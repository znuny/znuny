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

my $HelperObject   = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $SeleniumObject = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');
my $ZnunyHelper    = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $ArticleObject  = $Kernel::OM->Get('Kernel::System::Ticket::Article');

# create test ticket and articles
my $TicketID = $HelperObject->TicketCreate();

my $ArticleIDFirst = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
);
my $ArticleIDSecond = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
);

# store test function in variable so the Selenium object can handle errors/exceptions/dies etc.
my $SeleniumTest = sub {

    # create test user and login
    my %TestUser = $SeleniumObject->AgentLogin(
        Groups => [ 'admin', 'users' ],
    );

    # TODO: Use case for this test unknown
    #     # navigate to created test ticket in AgentTicketZoom page without an article
    #     $SeleniumObject->AgentInterface(
    #         Action      => 'AgentTicketZoom',
    #         TicketID    => $TicketID,
    #         WaitForAJAX => 0,
    #     );

    # navigate to created test ticket in AgentTicketZoom page with an article
    $SeleniumObject->AgentInterface(
        Action   => 'AgentTicketZoom',
        TicketID => $TicketID
    );

    # check for elements
    $Self->True(
        $SeleniumObject->find_element( 'li#nav-Mark-as-seen a', 'css' )->is_displayed(),
        '"Mark ticket as seen" link is visible',
    );

    $Self->True(
        $SeleniumObject->find_element( 'li#nav-Mark-as-unseen a', 'css' )->is_displayed(),
        '"Mark ticket as unseen" link is visible',
    );

    $Self->True(
        $SeleniumObject->find_element( 'a.AgentTicketMarkSeenUnseenArticle', 'css' )->is_displayed(),
        '"Mark article as unseen" link is visible',
    );

    # mark ticket as unseen
    # TODO: Unknown, why click AND AgentInterface call are both necessary. If one is omitted,
    # not all articles will be marked as unseen. Manual testing works.
    $SeleniumObject->find_element( 'li#nav-Mark-as-unseen a', 'css' )->click();
    $SeleniumObject->AgentInterface(
        Action      => 'AgentTicketMarkSeenUnseen',
        Subaction   => 'Unseen',
        TicketID    => $TicketID,
        WaitForAJAX => 0,
    );

    # check if flags were set correctly
    my %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDFirst,
        UserID    => $TestUser{UserID},
    );

    $Self->False(
        $Flags{Seen},
        "Initial article seen flag - ID $ArticleIDFirst",
    );

    %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDSecond,
        UserID    => $TestUser{UserID},
    );

    $Self->False(
        $Flags{Seen},
        "Initial article seen flag - ID $ArticleIDSecond",
    );

    # call "seen" subaction directly
    $SeleniumObject->AgentInterface(
        Action      => 'AgentTicketMarkSeenUnseen',
        Subaction   => 'Seen',
        TicketID    => $TicketID,
        ArticleID   => $ArticleIDFirst,
        WaitForAJAX => 0,
    );

    # check if URL call has marked the article as seen
    %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDFirst,
        UserID    => $TestUser{UserID},
    );

    $Self->True(
        $Flags{Seen},
        "Subaction article seen flag - ID $ArticleIDFirst",
    );

    %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDSecond,
        UserID    => $TestUser{UserID},
    );

    $Self->False(
        $Flags{Seen},
        "Subaction article seen flag - ID $ArticleIDSecond",
    );

    # re-navigate to created test ticket in AgentTicketZoom page
    $SeleniumObject->AgentInterface(
        Action   => 'AgentTicketZoom',
        TicketID => $TicketID,
    );

    # give AJAX request time to mark second article as seen
    sleep(5);

    # check if AJAX requests have marked the remaining article as read
    %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDFirst,
        UserID    => $TestUser{UserID},
    );

    $Self->True(
        $Flags{Seen},
        "Zoom AJAX article seen flag - ID $ArticleIDFirst",
    );

    %Flags = $ArticleObject->ArticleFlagGet(
        TicketID  => $TicketID,
        ArticleID => $ArticleIDSecond,
        UserID    => $TestUser{UserID},
    );

    $Self->True(
        $Flags{Seen},
        "Zoom AJAX article seen flag - ID $ArticleIDSecond",
    );
};

# finally run the test(s) in the browser
$SeleniumObject->RunTest($SeleniumTest);

1;
