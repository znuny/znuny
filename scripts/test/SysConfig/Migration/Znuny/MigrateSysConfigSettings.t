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
use Kernel::Config;
use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $ConfigObject             = $Kernel::OM->Get('Kernel::Config');
my $HelperObject             = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $MainObject               = $Kernel::OM->Get('Kernel::System::Main');
my $SysConfigObject          = $Kernel::OM->Get('Kernel::System::SysConfig');
my $SysConfigMigrationObject = $Kernel::OM->Get('Kernel::System::SysConfig::Migration');

my $Home = $ConfigObject->{Home};

my $TestFile      = 'ZZZAuto.pm';
my $TestPath      = $Home . '/scripts/test/sample/SysConfig/Migration/';
my $TestLocation  = $TestPath . $TestFile;
my $TestFileClass = "scripts::test::sample::SysConfig::Migration::ZZZAuto";

$Self->True(
    -e $TestLocation,
    "TestFile '$TestFile' existing",
);

# load from samples
my $Config = $MainObject->FileRead(
    Directory => $TestPath,
    Filename  => $TestFile,
    Mode      => 'utf8',
);

$Self->True(
    $Config,
    "File was readable",
);

$Self->True(
    -e $TestLocation,
    "File location",
);

# Import wrong FileClass
my %ZnunyConfig;
my $FileClass = 'Kernel::Config::Files::ZZZAAuto';
delete $INC{$TestPath};
$MainObject->Require($FileClass);
$FileClass->Load( \%ZnunyConfig );

$Self->True(
    \%ZnunyConfig,
    "ZZZAAuto Config was loaded",
);

$Self->Is(
    $ZnunyConfig{MigrateSysConfigSettings},
    undef,
    'MigrateSysConfigSettings is undef',
);

# Import
%ZnunyConfig = ();
delete $INC{$TestPath};
$MainObject->Require($TestFileClass);
$TestFileClass->Load( \%ZnunyConfig );

$Self->True(
    \%ZnunyConfig,
    "Test Config was loaded",
);

$Self->Is(
    $ZnunyConfig{MigrateSysConfigSettings},
    1,
    'MigrateSysConfigSettings is 1',
);

# Load sample XML file.
my $Directory = $Home . '/scripts/test/sample/SysConfig/Migration';
my $XMLLoaded = $SysConfigObject->ConfigurationXML2DB(
    UserID    => 1,
    Directory => $Directory,
    Force     => 1,
    CleanUp   => 0,
);

$Self->True(
    $XMLLoaded,
    "Example XML loaded.",
);

my %Data = (
    'Frontend::RichTextPath' => {
        UpdateName => 'Frontend::RichText::Path',
    },
    'Frontend::RichTextWidth' => {
        UpdateName     => 'Frontend::RichText::Settings###Width',
        EffectiveValue => '500',                                    # original 320
    },
    'Frontend::RichTextHeight' => {
        UpdateName     => 'Frontend::RichText::Settings###Height',
        EffectiveValue => '600',                                     # original 620
    },
);

my %Expected = (
    'Frontend::RichText::Path' => {
        EffectiveValue => '<OTRS_CONFIG_Frontend::WebPath>js/thirdparty/ckeditor-4.17.1/',
    },
    'Frontend::RichText::Settings###Width' => {
        EffectiveValue => '500',
    },
    'Frontend::RichText::Settings###Height' => {
        EffectiveValue => '600',
    },
);

my $Success = $SysConfigMigrationObject->MigrateSysConfigSettings(
    FileClass => $TestFileClass,
    FilePath  => $TestLocation,
    Data      => \%Data,
);

$Self->True(
    $Success,
    "Config was successfully migrated."
);

for my $SettingName ( sort keys %Expected ) {

    my %Setting = $SysConfigObject->SettingGet(
        Name => $SettingName,
    );

    for my $Key ( sort keys %{ $Expected{$SettingName} } ) {

        $Self->Is(
            $Setting{$Key},
            $Expected{$SettingName}->{$Key},
            "$SettingName - Check $Key",
        );
    }
}

1;
