# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::Unlock;

use strict;
use warnings;

our @ObjectDependencies = ();

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output = <<OUTPUT;
\$Success = \$TicketObject->TicketLockSet(
    Lock     => 'lock',
    TicketID => \$TicketID,
    UserID   => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketLockSet to "lock" was successful.',
);

OUTPUT

    return $Output;
}

1;
