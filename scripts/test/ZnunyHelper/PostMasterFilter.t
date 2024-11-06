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

my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $HelperObject      = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $PMFilterObject    = $Kernel::OM->Get('Kernel::System::PostMaster::Filter');

my $RandomNumber = $HelperObject->GetRandomNumber();

my %PostmasterFilterConfig = (
    'Name'  => 'PostmasterFilter' . $RandomNumber,
    'Match' => {
        'Body' => '123'
    },
    'Not' => {
        'Body' => undef
    },
    'Set' => {
        'X-OTRS-DynamicField-test' => '123'
    },
    'StopAfterMatch' => '0'
);

my @Filters = (
    {
        %PostmasterFilterConfig
    },
);

# _PostMasterFilterCreate
my $Result = $ZnunyHelperObject->_PostMasterFilterCreate(@Filters);

$Self->True(
    $Result,
    '_PostMasterFilterCreate',
);

my %Data = $PMFilterObject->FilterGet(
    Name => 'PostmasterFilter' . $RandomNumber,
);

$Self->IsDeeply(
    \%Data,
    {
        'Match' => [
            {
                'Key'   => 'Body',
                'Value' => '123'
            }
        ],
        'Name' => 'PostmasterFilter' . $RandomNumber,
        'Not'  => [
            {
                'Key'   => 'Body',
                'Value' => undef
            }
        ],
        'Set' => [
            {
                'Key'   => 'X-OTRS-DynamicField-test',
                'Value' => '123'
            }
        ],
        'StopAfterMatch' => 0
    },
    '_PostMasterFilterCreate',
);

# _PostMasterFilterCreateIfNotExists
$Result = $ZnunyHelperObject->_PostMasterFilterCreateIfNotExists(@Filters);

$Self->True(
    $Result,
    '_PostMasterFilterCreateIfNotExists',
);

# _PostMasterFilterConfigImport yml
my $Name = 'PostmasterFilterYML' . $RandomNumber;
my $YML  = "---
- Match:
  - Key: Body
    Value: 333
  Name: $Name
  Not:
  - Key: Body
    Value: ~
  Set:
  - Key: X-OTRS-DynamicField-test
    Value: 333
  StopAfterMatch: 0";

$Result = $ZnunyHelperObject->_PostMasterFilterConfigImport(
    Filter => \$YML,
);

$Self->True(
    $Result,
    '_PostMasterFilterConfigImport',
);

%Data = $PMFilterObject->FilterGet(
    Name => $Name
);

$Self->IsDeeply(
    \%Data,
    {
        'Match' => [
            {
                'Key'   => 'Body',
                'Value' => '333'
            }
        ],
        'Name' => $Name,
        'Not'  => [
            {
                'Key'   => 'Body',
                'Value' => undef
            }
        ],
        'Set' => [
            {
                'Key'   => 'X-OTRS-DynamicField-test',
                'Value' => '333'
            }
        ],
        'StopAfterMatch' => 0
    },
    '_PostMasterFilterConfigImport',
);

# Update filter with same name via _PostMasterFilterConfigImport
$YML = "---
- Match:
  - Key: Body
    Value: 444
  Name: $Name
  Not:
  - Key: Body
    Value: ~
  Set:
  - Key: X-OTRS-DynamicField-test2
    Value: 555
  StopAfterMatch: 0";

$Result = $ZnunyHelperObject->_PostMasterFilterConfigImport(
    Filter => \$YML,
);

$Self->True(
    $Result,
    '_PostMasterFilterConfigImport',
);

%Data = $PMFilterObject->FilterGet(
    Name => $Name
);

$Self->IsDeeply(
    \%Data,
    {
        'Match' => [
            {
                'Key'   => 'Body',
                'Value' => '444'
            }
        ],
        'Name' => $Name,
        'Not'  => [
            {
                'Key'   => 'Body',
                'Value' => undef,
            }
        ],
        'Set' => [
            {
                'Key'   => 'X-OTRS-DynamicField-test2',
                'Value' => '555'
            }
        ],
        'StopAfterMatch' => 0
    },
    '_PostMasterFilterConfigImport',
);

1;
