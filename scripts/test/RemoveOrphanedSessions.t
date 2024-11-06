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

my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
my $UserObject    = $Kernel::OM->Get('Kernel::System::User');

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# Create test users and a session for every one.
my @TestUserLogins;
for my $Count ( 1 .. 3 ) {
    my ( $TestUserLogin, $TestUserID ) = $HelperObject->TestUserCreate();
    push @TestUserLogins, $TestUserLogin;

    my %UserData = $UserObject->GetUserData(
        UserID        => $TestUserID,
        NoOutOfOffice => 1,
    );

    my $NewSessionID = $SessionObject->CreateSessionID(
        %UserData,
        UserLastRequest => $Kernel::OM->Create('Kernel::System::DateTime')->ToEpoch(),
        UserType        => 'User',
        SessionSource   => 'AgentInterface',
    );
    $Self->True(
        $NewSessionID,
        "SessionID '$NewSessionID' is created for user '$TestUserLogin'",
    );
}

# orphan first session
my @SessionIDs                = $SessionObject->GetAllSessionIDs();
my $OrphanedTestUserSessionID = $SessionIDs[0];

$SessionObject->UpdateSessionID(
    SessionID => $OrphanedTestUserSessionID,
    Key       => 'UserLogin',
    Value     => undef,
);
$Self->True(
    $OrphanedTestUserSessionID,
    "SessionID '$OrphanedTestUserSessionID' has been orphaned",
);

# delete orphaned session via console command method
# ( i.e. bin/znuny.Console.pl Maint::Session::DeleteOrphaned for maintenance )
my $CommandObject = $Kernel::OM->Get('Kernel::System::Console::Command::Maint::Session::DeleteOrphaned');
my $ExitCode      = $CommandObject->Execute();

$Self->Is(
    $ExitCode,
    $CommandObject->ExitCodeOk(),
    "Orphaned session '$OrphanedTestUserSessionID' was deleted",
);

# Check for remaining sessions.
my @RemainingSessionIDs = $SessionObject->GetAllSessionIDs();

$Self->Is(
    scalar @RemainingSessionIDs,
    scalar(@SessionIDs) - 1,
    "Ok, only one session was deleted.",
);

# Check if orphaned session is removed.
for my $SessionID (@RemainingSessionIDs) {
    if ( $SessionID eq $OrphanedTestUserSessionID ) {
        $Self->False(
            $OrphanedTestUserSessionID,
            "Orphaned session: '$OrphanedTestUserSessionID' was not deleted",
        );
    }
    else {
        $Self->True(
            $SessionID,
            "Session '$SessionID' is found",
        );
    }
}

# Restore to the previous state is done by RestoreDatabase.

1;
