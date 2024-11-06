# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::Misc;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(TicketID UserID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Output = <<OUTPUT;
\$TempValue = \$TimeObject->SystemTime();
\$Success = \$TicketObject->TicketUnlockTimeoutUpdate(
    UnlockTimeout => \$TempValue,
    TicketID      => \$TicketID,
    UserID        => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketUnlockTimeoutUpdate was successful.',
);

OUTPUT

    return $Output;
}

1;
