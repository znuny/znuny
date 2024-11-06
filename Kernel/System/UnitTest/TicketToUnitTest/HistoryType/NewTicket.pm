# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ObjectDependencies)

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::NewTicket;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Ticket',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    NEEDED:
    for my $Needed (qw(Queue Priority State Type OwnerID ResponsibleID CustomerUser CustomerID Service SLA )) {
        $Param{$Needed} //= '';
    }

    my $Output = <<OUTPUT;
my \$TicketID = \$HelperObject->TicketCreate(
    Queue         => '$Param{Queue}',
    Priority      => "$Param{Priority}",
    State         => '$Param{State}',
    Type          => '$Param{Type}',
    OwnerID       => '$Param{OwnerID}',
    ResponsibleID => '$Param{ResponsibleID}',
    CustomerUser  => '$Param{CustomerUser}',
    CustomerID    => '$Param{CustomerID}',
    Service       => '$Param{Service}',
    SLA           => '$Param{SLA}',
);

# trigger transaction events
\$Kernel::OM->ObjectsDiscard(
    Objects => ['Kernel::System::Ticket'],
);
\$TicketObject = \$Kernel::OM->Get('Kernel::System::Ticket');

OUTPUT

    return $Output;

}

1;
