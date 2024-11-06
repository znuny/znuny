# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::Calendar::Ticket::Generate;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Calendar::Plugin',
    'Kernel::System::Calendar::Plugin::Ticket::Create',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Creates calendar based tickets.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Create calendar based tickets...</yellow>\n");

    my $PluginObject             = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');
    my $TicketCreatePluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Ticket::Create');

    my @PuginDataListGet = $PluginObject->DataListGet(
        PluginKey => 'TicketCreate',
        UserID    => 1,
    );

    my $TicketCounter = 0;
    CALENDARBASEDTICKET:
    for my $CalendarBasedTicket (@PuginDataListGet) {

        next CALENDARBASEDTICKET if !$CalendarBasedTicket->{AppointmentID};
        next CALENDARBASEDTICKET if !$CalendarBasedTicket->{Config};
        next CALENDARBASEDTICKET if !$CalendarBasedTicket->{Config}->{TicketCreateTime};
        next CALENDARBASEDTICKET if $CalendarBasedTicket->{Config}->{TicketCreated};

        my $NumberOfCreatedTickets = $TicketCreatePluginObject->TicketCreate(
            %{$CalendarBasedTicket},
            UserID => 1,
        );
        next CALENDARBASEDTICKET if !$NumberOfCreatedTickets;

        $TicketCounter += $NumberOfCreatedTickets;
    }

    $Self->Print("\n<yellow>Number of created tickets:</yellow> $TicketCounter\n");
    $Self->Print("\n<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
