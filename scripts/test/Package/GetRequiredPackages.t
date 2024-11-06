# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

my $Version = $ConfigObject->Get('Version');
my $String  = '<?xml version="1.0" encoding="utf-8" ?>
<otrs_package version="1.0">
    <Name>GetRequiredPackages</Name>
    <Version>1.0.0</Version>
    <Vendor>Znuny GmbH</Vendor>
    <URL>http://znuny.com/</URL>
    <License>GNU AFFERO GENERAL PUBLIC LICENSE Version 3, November 2007</License>
    <Description Lang="en">A test package (some test &lt; &gt; &amp;).</Description>
    <Description Lang="de">Ein Test Paket (some test &lt; &gt; &amp;).</Description>
    <ModuleRequired Version="1.112">Encode</ModuleRequired>
    <Framework>' . $Version . '</Framework>
    <BuildDate>2022-11-30 12:34:56</BuildDate>
    <BuildHost>znuny.com</BuildHost>
    <Filelist>
        <File Location="GetRequiredPackages" Permission="644" Encode="Base64">aGVsbG8K</File>
        <File Location="var/GetRequiredPackages" Permission="644" Encode="Base64">aGVsbG8K</File>
    </Filelist>
</otrs_package>
';

my @Tests = (
    {
        Name => 'Package is not installed',
        Data => {
            PackageRequired => [
                {
                    'TagType'      => 'Start',
                    'TagCount'     => '8',
                    'TagLastLevel' => 'otrs_package',
                    'TagLevel'     => '2',
                    'Tag'          => 'PackageRequired',
                    'Content'      => 'ITSMCore',
                },
            ]
        },
        Expected => [
            [
                {
                    'Name'                       => 'ITSMCore',
                    'Version'                    => '',
                    'IsInstalled'                => 0,
                    'IsRequiredVersionInstalled' => 1,
                }
            ]
        ],
    },
    {
        Name => 'Package is installed',
        Data => {
            PackageRequired => [
                {
                    'TagType'      => 'Start',
                    'TagCount'     => '8',
                    'TagLastLevel' => 'otrs_package',
                    'TagLevel'     => '2',
                    'Tag'          => 'PackageRequired',
                    'Content'      => 'GetRequiredPackages',
                },
            ]
        },
        Expected => [
            [
                {
                    'Name'                       => 'GetRequiredPackages',
                    'Version'                    => '',
                    'IsInstalled'                => 1,
                    'IsRequiredVersionInstalled' => 1,
                }
            ]
        ],
    },
    {
        Name => 'Package is installed, but not in expected version',
        Data => {
            PackageRequired => [
                {
                    'TagType'      => 'Start',
                    'TagCount'     => '8',
                    'TagLastLevel' => 'otrs_package',
                    'TagLevel'     => '2',
                    'Tag'          => 'PackageRequired',
                    'Content'      => 'GetRequiredPackages',
                    'Version'      => '2.0.0'
                },
            ]
        },
        Expected => [
            [
                {
                    'Name'                       => 'GetRequiredPackages',
                    'Version'                    => '2.0.0',
                    'IsInstalled'                => 0,
                    'IsRequiredVersionInstalled' => 0,
                }
            ]
        ],
    },
);

my $PackageInstall = $PackageObject->PackageInstall( String => $String );

$Self->True(
    $PackageInstall,
    'PackageInstall() - Install Test package',
);

my $PackageIsInstalledByName = $PackageObject->PackageIsInstalled( Name => 'GetRequiredPackages' );
$Self->True(
    $PackageIsInstalledByName,
    'PackageIsInstalled() - Check if the Test package was successfully installed',
);

for my $Test (@Tests) {
    my @Modules = $PackageObject->GetRequiredPackages(
        Structure => $Test->{Data},
    );

    $Self->IsDeeply(
        \@Modules,
        $Test->{Expected},
        'GetRequiredPackages() - ' . $Test->{Name},
    );
}

my $PackageUnInstall = $PackageObject->PackageUninstall( String => $String );
$Self->True(
    $PackageUnInstall,
    'PackageUnInstall() - Uninstall Test package',
);

1;
