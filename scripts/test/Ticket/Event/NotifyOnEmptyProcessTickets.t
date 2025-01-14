# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));
use parent qw(Kernel::System::EventHandler);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

my $UserID = 1;

#
# Test non-process tickets
#
ARTICLECOUNT:
for my $ArticleCount ( 0 .. 2 ) {
    my $NonProcessTicketID = $HelperObject->TicketCreate();

    for ( 1 .. $ArticleCount ) {
        $HelperObject->ArticleCreate(
            TicketID => $NonProcessTicketID,
        );
    }

    my $EventModule = $Kernel::OM->Get('Kernel::System::Ticket::Event::NotifyOnEmptyProcessTickets');
    $EventModule->Run(
        Event  => 'TicketCreate',
        UserID => $UserID,
        Data   => {
            TicketID => $NonProcessTicketID,
        },
        Config => {
            NotRelevantForTest => 1,
        },
    );

    my $ExpectedEventTriggered = $EventModule->{NotificationNewTicketEventTriggered};

    $Self->False(
        scalar $ExpectedEventTriggered,
        "Event 'NotificationNewTicket' must not be triggered for non-process ticket with $ArticleCount article(s).",
    );
}

#
# Test process tickets
#
my $DynamicFieldNameProcessManagementProcessID = $ConfigObject->Get('Process::DynamicFieldProcessManagementProcessID')
    // 'ProcessManagementProcessID';

ARTICLECOUNT:
for my $ArticleCount ( 0 .. 2 ) {
    my $ProcessTicketID = $HelperObject->TicketCreate();

    $HelperObject->DynamicFieldSet(
        Field    => $DynamicFieldNameProcessManagementProcessID,
        ObjectID => $ProcessTicketID,
        Value    => '999',
    );

    for ( 1 .. $ArticleCount ) {
        $HelperObject->ArticleCreate(
            TicketID => $ProcessTicketID,
        );
    }

    my $EventModule = $Kernel::OM->Get('Kernel::System::Ticket::Event::NotifyOnEmptyProcessTickets');
    $EventModule->Run(
        Event  => 'TicketCreate',
        UserID => $UserID,
        Data   => {
            TicketID => $ProcessTicketID,
        },
        Config => {
            NotRelevantForTest => 1,
        },
    );

    my $ExpectedEventTriggered = $EventModule->{NotificationNewTicketEventTriggered};

    if ($ArticleCount) {
        $Self->False(
            scalar $ExpectedEventTriggered,
            "Event 'NotificationNewTicket' must not be triggered for process ticket with $ArticleCount article(s).",
        );

        next ARTICLECOUNT;
    }

    $Self->True(
        scalar $ExpectedEventTriggered,
        "Event 'NotificationNewTicket' must be triggered for process ticket with $ArticleCount article(s).",
    );
}

1;
