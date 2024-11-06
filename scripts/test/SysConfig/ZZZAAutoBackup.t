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

my $HelperObject    = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
my $MainObject      = $Kernel::OM->Get('Kernel::System::Main');
my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

my $Home                   = $ConfigObject->Get('Home');
my $BackupDir              = "$Home/Kernel/Config/Backups/";
my $ZZZAAutoFilePath       = "$Home/Kernel/Config/Files/ZZZAAuto.pm";
my $ZZZAAutoBackupFilePath = "$Home/Kernel/Config/Backups/ZZZAAuto.pm";
my $FileClass              = "Kernel::Config::Files::ZZZAAuto";
my $BackupFileClass        = "Kernel::Config::Backups::ZZZAAuto";

my $ContentSCALARRef = $MainObject->FileRead(
    Location => $ZZZAAutoFilePath,
    Mode     => 'utf8',
    Type     => 'Local',
    Result   => 'SCALAR',
);

$Self->Is(
    ref $ContentSCALARRef,
    'SCALAR',
    "ZZZAAutoFilePath: $ZZZAAutoFilePath",
);

my $ZZZAAutoData = ${$ContentSCALARRef};

if ( $ZZZAAutoData =~ m{package $FileClass;}msg ) {
    $Self->True(
        $ZZZAAutoData,
        "Before " . $FileClass,
    );
}
else {
    $Self->False(
        1,
        "Before " . $FileClass,
    );
}

my $Success = $SysConfigObject->CreateZZZAAutoBackup();

$Self->True(
    $Success,
    'CreateZZZAAutoBackup',
);

$ContentSCALARRef = $MainObject->FileRead(
    Location => $ZZZAAutoBackupFilePath,
    Mode     => 'utf8',
    Type     => 'Local',
    Result   => 'SCALAR',
);

$Self->Is(
    ref $ContentSCALARRef,
    'SCALAR',
    "ZZZAAutoBackupFilePath: $ZZZAAutoBackupFilePath",
);

my $ZZZAAutoBackupData = ${$ContentSCALARRef};

if ( $ZZZAAutoBackupData =~ m{package $BackupFileClass;}msg ) {
    $Self->True(
        $ZZZAAutoBackupData,
        "After " . $BackupFileClass,
    );
}
else {
    $Self->False(
        1,
        "After " . $BackupFileClass,
    );
}

$Success = $SysConfigObject->DeleteZZZAAutoBackup();

$Self->True(
    $Success,
    'DeleteZZZAAutoBackup',
);

if ( !-f $ZZZAAutoBackupFilePath ) {
    $Self->True(
        1,
        'ZZZAAutoBackup deleted.',
    );
}
else {
    $Self->False(
        1,
        'ZZZAAutoBackup not deleted.',
    );
}

1;
