# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Session::DeleteOrphaned;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::AuthSession',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Delete orphaned sessions.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    $Self->Print("<yellow>Deleting orphaned sessions...</yellow>\n");

    my @OrphanedSessions = $SessionObject->GetOrphanedSessionIDs();

    for my $SessionID (@OrphanedSessions) {
        my $Success = $SessionObject->RemoveSessionID(
            SessionID => $SessionID,
        );

        if ( !$Success ) {
            $Self->PrintError("Session $SessionID could not be deleted.");
            return $Self->ExitCodeError();
        }

        $Self->Print("  $SessionID\n");
    }

    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
