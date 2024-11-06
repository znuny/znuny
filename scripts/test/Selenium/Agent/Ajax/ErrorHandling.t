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

use Kernel::Language;

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

# TODO: This test does not cancel potential other AJAX calls that might happen in the background.

$Selenium->RunTest(
    sub {

        my $CacheObject        = $Kernel::OM->Get('Kernel::System::Cache');
        my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
        my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
        my $HelperObject       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $UserObject         = $Kernel::OM->Get('Kernel::System::User');

        # Change "Move" action to be a link instead of dropdown, since there is an issue to click
        # on the "Customer" action (dropdown can be on top is some cases).
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::Frontend::MoveType',
            Value => 'link',
        );

        my $Language      = 'de';
        my $TestUserLogin = $HelperObject->TestUserCreate(
            Language => $Language,
            Groups   => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        my $TestUserID = $UserObject->UserLookup(
            UserLogin => $TestUserLogin,
        );

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketPhone");

        # Provoke an ajax error caused by unexpected result (404), should show no dialog, but an regular alert.
        $Selenium->execute_script(
            "Core.AJAX.FunctionCall(Core.Config.Get('CGIHandle') + ':12345', null, function () {});"
        );

        $Selenium->WaitFor( JavaScript => "return \$('.NoConnection:visible').length;" );

        my $LanguageObject = Kernel::Language->new(
            UserLanguage => $Language,
        );

        # Another alert dialog opens with the detail message.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .NoConnection p').text().trim();"),
            $LanguageObject->Translate(
                '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.',
                $ConfigObject->Get('Product'),
            ),
            'Check for opened alert text',
        );

        # the footer is in the way some times
        sleep 1;

        # Reload the page.
        $Selenium->find_element( '#DialogButton1', 'css' )->click();

        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete;'
        );

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Change the queue to trigger an ajax call.
        $Selenium->InputFieldValueSet(
            Element => '#Dest',
            Value   => '2||Raw',
        );

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # There should be no error dialog yet.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .NoConnection:visible').length;"),
            0,
            "Error dialog not visible yet"
        );

        # Overload ajax function to simulate connection drop.
        my $AjaxOverloadJSError = <<"JAVASCRIPT";
window.AjaxOriginal = \$.ajax;
\$.ajax = function() {
    var Status = 'Status',
        Error = 'Error';
    Core.Exception.HandleFinalError(new Core.Exception.ApplicationError("Error during AJAX communication. Status: " + Status + ", Error: " + Error, 'ConnectionError'));
    return false;
};
\$.ajax();
JAVASCRIPT

        # Trigger faked ajax request.
        $Selenium->execute_script($AjaxOverloadJSError);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # Now check if we see a connection error popup.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .NoConnection:visible').length;"),
            1,
            "Error dialog visible - first try"
        );

        # Now act as if the connection had been re-established.
        my $AjaxOverloadJSSuccess = <<"JAVASCRIPT";
\$.ajax = window.AjaxOriginal;
Core.AJAX.FunctionCall(Core.Config.Get('CGIHandle'), null, function () {}, 'html');
\$.ajax();
JAVASCRIPT

        # Trigger faked ajax request.
        $Selenium->execute_script($AjaxOverloadJSSuccess);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # The dialog should show the re-established message now.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .ConnectionReEstablished:visible').length;"),
            1,
            "ConnectionReEstablished dialog visible"
        );

        # Reload the page.
        $Selenium->find_element( '#DialogButton1', 'css' )->click();
        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete;'
        );

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Trigger faked ajax request again.
        $Selenium->execute_script($AjaxOverloadJSError);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # Now check if we see a connection error popup.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .NoConnection:visible').length;"),
            1,
            "Error dialog visible - second try"
        );

        # Now act as if the connection had been re-established.
        $Selenium->execute_script($AjaxOverloadJSSuccess);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # The dialog should show the re-established message now.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .ConnectionReEstablished:visible').length;"),
            1,
            "ConnectionReEstablished dialog visible"
        );

        # Create a test ticket to see if the dialogs work in popups, too.
        my $TestCustomerUser = $HelperObject->TestCustomerUserCreate(
        ) || die "Did not get test customer user";

        my %TestCustomerUserID = $CustomerUserObject->CustomerUserDataGet(
            User => $TestCustomerUser,
        );

        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        my $TitleRandom  = "Title" . $HelperObject->GetRandomID();
        my $TicketNumber = $TicketObject->TicketCreateNumber();
        my $TicketID     = $TicketObject->TicketCreate(
            TN         => $TicketNumber,
            Title      => $TitleRandom,
            Queue      => 'Raw',
            Lock       => 'unlock',
            Priority   => '3 normal',
            State      => 'open',
            CustomerID => $TestCustomerUserID{UserCustomerID},
            OwnerID    => $TestUserID,
            UserID     => $TestUserID,
        );
        $Self->True(
            $TicketID,
            "Ticket is created - ID $TicketID",
        );

        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentTicketZoom;TicketID=$TicketID");

        # Open the owner change dialog.
        $Selenium->execute_script("\$('.Cluster ul ul#nav-People-container').addClass('ForceVisible');");
        $Selenium->execute_script('$(\'#nav-People a[href*="Action=AgentTicketOwner"]\').click()');

        $Selenium->WaitFor( WindowCount => 2 );
        my $Handles = $Selenium->get_window_handles();
        $Selenium->switch_to_window( $Handles->[1] );

        $Selenium->WaitFor(
            JavaScript =>
                'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Trigger faked ajax request again.
        $Selenium->execute_script($AjaxOverloadJSError);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # Now check if we see a connection error popup.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .NoConnection:visible').length;"),
            1,
            "Error dialog visible -  in popup"
        );

        # Now act as if the connection had been re-established.
        $Selenium->execute_script($AjaxOverloadJSSuccess);

        # Wait until all AJAX calls finished.
        $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

        # Wait until modal dialog has open.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && $(".Dialog.Modal").length;'
        );

        # The dialog should show the re-established message now.
        $Self->Is(
            $Selenium->execute_script("return \$('#AjaxErrorDialogInner .ConnectionReEstablished:visible').length;"),
            1,
            "ConnectionReEstablished dialog visible"
        );

        $Selenium->find_element( '#DialogButton1', 'css' )->click();

        # Wait until modal dialog has closed.
        $Selenium->WaitFor(
            JavaScript => 'return typeof($) === "function" && !$(".Dialog.Modal").length;'
        );

        $Selenium->find_element( '.CancelClosePopup', 'css' )->click();
        $Selenium->WaitFor( WindowCount => 1 );

        # Delete created test tickets.
        my $Success = $TicketObject->TicketDelete(
            TicketID => $TicketID,
            UserID   => 1,
        );

        # Ticket deletion could fail if apache still writes to ticket history. Try again in this case.
        if ( !$Success ) {
            sleep 3;
            $Success = $TicketObject->TicketDelete(
                TicketID => $TicketID,
                UserID   => 1,
            );
        }
        $Self->True(
            $Success,
            "Ticket with ticket ID $TicketID is deleted"
        );

        # Make sure the cache is correct.
        $CacheObject->CleanUp( Type => 'Ticket' );
    }
);

1;
