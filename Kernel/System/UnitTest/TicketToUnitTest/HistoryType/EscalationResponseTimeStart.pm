# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ObjectDependencies)

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::EscalationResponseTimeStart;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Ticket',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output = <<OUTPUT;
\$GenericAgentObject->JobRun(
    Job    => 'trigger escalation events',
    Config => {
        Escalation => 1,
        New        => {
            Module => 'Kernel::System::GenericAgent::TriggerEscalationStartEvents',
        },
    },
    Limit  => 100_000_000,
    UserID => 1,
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
