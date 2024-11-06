# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
        my $QueueObject  = $Kernel::OM->Get('Kernel::System::Queue');

        # Create test queue.
        my $QueueID = $QueueObject->QueueAdd(
            Name            => "Queue" . $HelperObject->GetRandomID(),
            ValidID         => 1,
            GroupID         => 1,
            SystemAddressID => 1,
            SalutationID    => 1,
            SignatureID     => 1,
            UserID          => 1,
        );
        $Self->True(
            $QueueID,
            "QueueID $QueueID is created.",
        );

        my $TestUserLogin = $HelperObject->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AgentTicketPhone screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketPhone");

        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('body.cke_editable', \$('.cke_wysiwyg_frame').contents()).length == 1;"
        );

        $Selenium->find_element( "#RichTextField", 'css' )->click();
        $Selenium->find_element( "#Dest_Search",   'css' )->click();
        $Selenium->find_element( "#RichTextField", 'css' )->click();
        $Selenium->find_element( "#Dest_Search",   'css' )->click();

        # After JQuery update, invalid RichText field draws focus,
        #   so dropdown don't stay open. See bug#14997.
        # Queue dropdown should stay open.
        sleep 2;

        $Self->Is(
            $Selenium->execute_script(
                "return \$('.InputField_ListContainer:visible').length;"
            ),
            1,
            "Queue dropdown stays open.",
        );

        # Cleanup.
        my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

        my $Success = $DBObject->Do(
            SQL  => "DELETE FROM personal_queues WHERE queue_id = ?",
            Bind => [ \$QueueID ],
        );
        $Self->True(
            $Success,
            "QueueID $QueueID is deleted from personal queues.",
        );
        $Success = $DBObject->Do(
            SQL  => "DELETE FROM queue WHERE id = ?",
            Bind => [ \$QueueID ],
        );
        $Self->True(
            $Success,
            "QueueID $QueueID is deleted.",
        );
    }
);

1;
