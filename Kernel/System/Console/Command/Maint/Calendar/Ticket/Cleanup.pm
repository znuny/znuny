# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::System::Console::Command::Maint::Calendar::Ticket::Cleanup;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Calendar::Plugin::Ticket::Create',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Cleanup obsolete calendar based ticket creation data.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Cleaning up...</yellow>\n");

    my $TicketCreatePluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Ticket::Create');

    my $Counter = $TicketCreatePluginObject->Cleanup();
    $Self->Print("\n<yellow>Number of deleted calendar base ticket creation data:</yellow> $Counter\n");
    $Self->Print("\n<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
