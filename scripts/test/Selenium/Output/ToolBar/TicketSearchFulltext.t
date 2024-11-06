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

        my $HelperObject  = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
        my $UserObject    = $Kernel::OM->Get('Kernel::System::User');
        my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
        my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');

        # Enable ToolBar FulltextSearch..
        my %TicketSearchFulltext = (
            Module      => 'Kernel::Output::HTML::ToolBar::Generic',
            Name        => 'Fulltext',
            Description => 'Fulltext search',
            Block       => 'ToolBarSearch',
            Priority    => '1990010',
        );

        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'Frontend::ToolBarModule###220-Ticket::TicketSearchFulltext',
            Value => \%TicketSearchFulltext,
        );

        # Disable ticket archive system.
        $HelperObject->ConfigSettingChange(
            Valid => 0,
            Key   => 'Ticket::ArchiveSystem',
            Value => 0,
        );

        # create test user and login
        my ( $TestUserLogin, $TestUserID ) = $HelperObject->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        );

        $UserObject->SetPreferences(
            UserID => $TestUserID,
            Key    => 'UserToolBar',
            Value  => 1,
        );

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        my $ArticleBackendObject = $ArticleObject->BackendForChannel( ChannelName => 'Internal' );

        my $RandomID = $HelperObject->GetRandomID();

        my @Tickets;
        for my $Count ( 1 .. 4 ) {

            # Create test ticket.
            my $Title    = "Ticket $Count $RandomID";
            my $TicketID = $TicketObject->TicketCreate(
                Title         => $Title,
                Queue         => 'Raw',
                Lock          => 'unlock',
                Priority      => '3 normal',
                State         => 'open',
                CustomerID    => 'SeleniumCustomerID',
                CustomerUser  => 'test@localhost.com',
                OwnerID       => $TestUserID,
                UserID        => 1,
                ResponsibleID => $TestUserID,
            );
            $Self->True(
                $TicketID,
                "TicketID $TicketID is created"
            );

            # Create test article.
            my $Subject   = "Article $Count $RandomID";
            my $ArticleID = $ArticleBackendObject->ArticleCreate(
                TicketID             => $TicketID,
                SenderType           => 'agent',
                IsVisibleForCustomer => 1,
                From                 => "Some Agent $RandomID <email\@example.com>",
                To                   => "Some Customer $RandomID <customer\@example.com>",
                Subject              => $Subject,
                Body                 => "the message text",
                ContentType          => 'text/plain; charset=ISO-8859-15',
                HistoryType          => 'OwnerUpdate',
                HistoryComment       => "Some free text $RandomID!",
                UserID               => 1,
                NoAgentNotify        => 1,
            );
            $Self->True(
                $ArticleID,
                "ArticleID $ArticleID is created",
            );

            push @Tickets, {
                TicketID    => $TicketID,
                ArchiveFlag => $Count < 3 ? 'y' : 'n',
            };
        }

        # Open search.
        $Selenium->find_element( "#ToolBarSearchTerm", 'css' )->click();

        # Select Fulltext search.
        $Selenium->find_element( "#ToolBarSearchBackendFulltext", 'css' )->click();

        # Search for test created ticket in Fulltext search.
        $Selenium->find_element( "#ToolBarSearchTerm", 'css' )->send_keys( $RandomID, "\N{U+E007}" );

        $Selenium->WaitFor(
            JavaScript =>
                "return typeof(\$) === 'function' && \$('a[href*=\"AgentTicketZoom;TicketID=$Tickets[0]->{TicketID}\"').length;"
        );

        # Verify all three tickets are found on screen.
        for my $Ticket (@Tickets) {
            $Self->True(
                $Selenium->execute_script(
                    "return \$('a[href*=\"AgentTicketZoom;TicketID=$Ticket->{TicketID}\"').length === 1"
                ),
                "TicketID $Ticket->{TicketID} is found",
            );
        }

        # Enable ticket archive system.
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'Ticket::ArchiveSystem',
            Value => 1,
        );

        # Archive two out of four test created tickets.
        my $Success;
        for my $Ticket (@Tickets) {
            $Success = $TicketObject->TicketArchiveFlagSet(
                ArchiveFlag => $Ticket->{ArchiveFlag},
                TicketID    => $Ticket->{TicketID},
                UserID      => $TestUserID,
            );
            $Self->True(
                $Success,
                "TicketID $Ticket->{TicketID} archive flag set to '$Ticket->{ArchiveFlag}'",
            );
        }

        # Enable SearchInArchive config and switch between all three available configurations.
        # See bug#13790 (https://bugs.otrs.org/show_bug.cgi?id=13790).
        my %Tests = (
            All => 'AllTickets',
            y   => 'ArchivedTickets',
            n   => 'NotArchivedTickets',
        );

        for my $Key ( sort keys %Tests ) {

            # Change SysConfig value and refresh screen.
            $HelperObject->ConfigSettingChange(
                Valid => 1,
                Key   => 'Ticket::Frontend::AgentTicketSearch###Defaults###SearchInArchive',
                Value => "$Tests{$Key}",
            );

            $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentDashboard");

            # Open search.
            $Selenium->find_element( "#ToolBarSearchTerm", 'css' )->click();

            # Select Fulltext search.
            $Selenium->find_element( "#ToolBarSearchBackendFulltext", 'css' )->click();

            # Search in Fulltext search.
            $Selenium->find_element( "#ToolBarSearchTerm", 'css' )->send_keys( $RandomID, "\N{U+E007}" );
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
            );
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === 'function' && \$('#OverviewBody').length;"
            );

            # Verify expected results.
            for my $Ticket (@Tickets) {

                my $IsFound = 'is found';
                my $Length  = 1;

                if ( $Key ne 'All' && $Ticket->{ArchiveFlag} ne $Key ) {
                    $IsFound = 'is not found';
                    $Length  = 0;
                }

                $Self->Is(
                    $Selenium->execute_script(
                        "return \$('a[href*=\"AgentTicketZoom;TicketID=$Ticket->{TicketID}\"]').length;"
                    ),
                    $Length,
                    "$Tests{$Key} - ArchiveFlag '$Ticket->{ArchiveFlag}' - TicketID $Ticket->{TicketID} $IsFound",
                );
            }
        }

        # Delete test tickets.
        for my $Ticket (@Tickets) {

            $Success = $TicketObject->TicketDelete(
                TicketID => $Ticket->{TicketID},
                UserID   => $TestUserID,
            );

            # Ticket deletion could fail if apache still writes to ticket history. Try again in this case.
            if ( !$Success ) {
                sleep 3;
                $Success = $TicketObject->TicketDelete(
                    TicketID => $Ticket->{TicketID},
                    UserID   => $TestUserID,
                );
            }
            $Self->True(
                $Success,
                "TicketID $Ticket->{TicketID} is deleted"
            );
        }
    }
);

1;
