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
    = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest::HistoryType::TimeAccounting');

my %Param = (
    TimeAccounting => 123,
);

my $Output = $TicketToUnitTestHistoryTypeObject->Run(
    %Param,
);

my $FieldName = 'DFTestName';

my $ExpectedOutout = <<OUTPUT;
\$Success = \$TicketObject->TicketAccountTime(
    TicketID  => \$TicketID,
    ArticleID => \$ArticleID,
    TimeUnit  => '123',
    UserID    => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketAccountTime "$Param{TimeAccounting}" was successful.',
);

OUTPUT

$Self->Is(
    $Output,
    $ExpectedOutout,
    'TicketToUnitTest::HistoryType::TimeAccounting',
);

1;
