# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::ResponsibleUpdate;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    $Param{Name} =~ /^\%\%(.+?)\%\%(.+?)/;
    $Param{NewUser}   ||= $1;
    $Param{NewUserID} ||= $2;

    NEEDED:
    for my $Needed (qw(NewUser)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Output = <<OUTPUT;
\$Success = \$TicketObject->TicketResponsibleSet(
    TicketID  => \$TicketID,
    NewUser   => '$Param{NewUser}',
    UserID    => \$UserID,
)

\$Self->True(
    \$Success,
    'TicketResponsibleSet to "$Param{NewUser}" was successful.',
);

OUTPUT

    return $Output;
}

1;
