# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## no critic(RequireExplicitPackage)
use strict;
use warnings;
use utf8;

use vars (qw($Self));

my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $UserObject   = $Kernel::OM->Get('Kernel::System::User');

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

$ConfigObject->Set(
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

my $UserRandom = 'unittest-' . $HelperObject->GetRandomID();
my $UserID     = $UserObject->UserAdd(
    UserFirstname => 'John',
    UserLastname  => 'Doe',
    UserLogin     => $UserRandom,
    UserEmail     => $UserRandom . '@example.com',
    ValidID       => 1,
    ChangeUserID  => 1,
);

my %UserData = $UserObject->GetUserData(
    UserID => $UserID,
);

KEY:
for my $Key ( sort keys %UserData ) {

    # Skip some data that comes from default values.
    next KEY if $Key =~ m/PageShown$/smx;
    next KEY if $Key =~ m/NextMask$/smx;
    next KEY if $Key =~ m/RefreshTime$/smx;

    # These are actually user preferences.
    next KEY if $Key =~ m/UserEmail$/smx;
    next KEY if $Key =~ m/UserMobile$/smx;

    # Skip UserToolBarSearchBackend which is set by default
    next KEY if $Key eq 'UserToolBarSearchBackend';

    # Skip out-of-office status (will always be set dynamically in Kernel::System::User
    # and cannot be set/changed by SetPreferences()).
    next KEY if $Key eq 'LoggedStatusMessage';

    # Skip dropdown-values of last views
    next KEY if $Key =~ m{\AUserLastViews};

    # Skip dropdown-values of User Activity LinkTarget
    next KEY if $Key =~ m{\AUserActivityLinkTarget};

    # Skip dropdown-values of UserMarkTicketSeenRedirectURL and UserMarkTicketUnseenRedirectURL
    next KEY if $Key =~ m{\AUserMarkTicket};

    $Self->False(
        $UserObject->SetPreferences(
            Key    => $Key,
            Value  => '1',
            UserID => $UserID,
        ),
        "Preference for $Key not updated"
    );

    my %NewUserData = $UserObject->GetUserData(
        UserID => $UserID,
    );

    $Self->Is(
        $NewUserData{$Key},
        $UserData{$Key},
        "User data $Key unchanged"
    );
}

# cleanup is done by RestoreDatabase

1;
