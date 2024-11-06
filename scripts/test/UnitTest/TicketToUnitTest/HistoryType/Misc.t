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
    = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest::HistoryType::Misc');

my $TicketID = $HelperObject->TicketCreate();

my %Param = (
    TicketID => $TicketID,
    UserID   => 1,
);

my $Output = $TicketToUnitTestHistoryTypeObject->Run(
    %Param,
);

my $ExpectedOutout = <<OUTPUT;
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

$Self->Is(
    $Output,
    $ExpectedOutout,
    'TicketToUnitTest::HistoryType::Misc',
);

1;
