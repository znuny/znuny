# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $TicketToUnitTestHistoryTypeObject
    = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest::HistoryType::TicketDynamicFieldUpdate');

my %Param = (
    Name => "\%\%FieldName\%\%DFTestName"
        . "\%\%Value\%\%NewValue 1"
        . "\%\%OldValue\%\%OldValue 0",
);

my $Output = $TicketToUnitTestHistoryTypeObject->Run(
    %Param,
);

my $FieldName = 'DFTestName';

my $ExpectedOutout = <<OUTPUT;
\$TempValue = \$DynamicFieldObject->DynamicFieldGet(
    Name => '$FieldName',
);

\$Success = \$BackendObject->ValueSet(
    DynamicFieldConfig => \$TempValue,
    ObjectID           => \$TicketID,
    Value              => 'NewValue 1',
    UserID             => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketDynamicFieldUpdate "$FieldName" was successful.',
);

OUTPUT

$Self->Is(
    $Output,
    $ExpectedOutout,
    'TicketToUnitTest::HistoryType::TicketDynamicFieldUpdate',
);

1;
