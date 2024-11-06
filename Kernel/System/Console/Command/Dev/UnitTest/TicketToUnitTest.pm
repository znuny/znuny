# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Dev::UnitTest::TicketToUnitTest;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Ticket',
    'Kernel::System::UnitTest::TicketToUnitTest',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description(
        'Creates a unit test of a ticket.',
    );

    $Self->AddArgument(
        Name        => 'ticket-id',
        Description => 'ID of ticket to from which to create a unit test.',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/\A[1-9]\d*\z/,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $TicketObject           = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TicketToUnitTestObject = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest');

    my $TicketID = $Self->GetArgument('ticket-id');

    my $TicketNumber = $TicketObject->TicketNumberLookup(
        TicketID => $TicketID,
    );
    if ( !$TicketNumber ) {
        $Self->PrintError("Ticket with ID $TicketID could not be found.");
        return $Self->ExitCodeError();
    }

    my $UnitTest = $TicketToUnitTestObject->CreateUnitTest(
        TicketID => $Self->GetArgument('ticket-id'),
    );

    $Self->Print("$UnitTest\n");

    return $Self->ExitCodeOk();
}

1;
