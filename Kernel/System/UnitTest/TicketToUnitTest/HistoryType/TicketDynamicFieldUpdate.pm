# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::TicketDynamicFieldUpdate;

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
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    $Param{Name} =~ /^\%\%FieldName\%\%(.+?)\%\%Value\%\%(.*?)(?:\%\%|$)/;
    $Param{FieldName} ||= $1;
    $Param{Value}     ||= $2 || '';

    my $Output = <<OUTPUT;
\$TempValue = \$DynamicFieldObject->DynamicFieldGet(
    Name => '$Param{FieldName}',
);

\$Success = \$BackendObject->ValueSet(
    DynamicFieldConfig => \$TempValue,
    ObjectID           => \$TicketID,
    Value              => '$Param{Value}',
    UserID             => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketDynamicFieldUpdate "$Param{FieldName}" was successful.',
);

OUTPUT

    return $Output;
}

1;
