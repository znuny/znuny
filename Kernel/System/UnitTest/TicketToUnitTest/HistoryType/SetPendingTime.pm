# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::SetPendingTime;

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
    for my $Needed (qw(PendingTime)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( $Param{PendingTime} =~ /(\d{4})-(\d{1,2})-(\d{1,2})\s(\d{1,2}):(\d{1,2})(:(\d{1,2}))?/ ) {
        if ( !$6 ) {
            $Param{PendingTime} .= ':00';
        }
    }

    my $Output = <<OUTPUT;
\$Success = \$TicketObject->TicketPendingTimeSet(
    String   => '$Param{PendingTime}',
    TicketID => \$TicketID,
    UserID   => \$UserID,
);


\$Self->True(
    \$Success,
    'TicketPendingTimeSet to "$Param{PendingTime}" was successful.',
);

OUTPUT

    return $Output;
}

1;
