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

my $PackageObject     = $Kernel::OM->Get('Kernel::System::Package');
my $EnvironmentObject = $Kernel::OM->Get('Kernel::System::Environment');

my $DataDumperVersion = $EnvironmentObject->ModuleVersionGet(
    Module => 'Data::Dumper'
);

my @Tests = (
    {
        Name => 'Perl Module is not installed',
        Data => {
            ModuleRequired => [
                {
                    'TagLevel'     => '2',
                    'TagCount'     => '12',
                    'Content'      => 'Not::Installed::Module',
                    'TagLastLevel' => 'otrs_package',
                    'Tag'          => 'ModuleRequired',
                    'TagType'      => 'Start',
                },
            ]
        },
        Expected => [
            [
                {
                    'Name'        => 'Not::Installed::Module',
                    'Version'     => undef,
                    'IsInstalled' => 0,
                }
            ]
        ],
    },
    {
        Name => 'Perl Module is installed',
        Data => {
            ModuleRequired => [
                {
                    'TagLevel'     => '2',
                    'TagCount'     => '12',
                    'Content'      => 'Data::Dumper',
                    'TagLastLevel' => 'otrs_package',
                    'Tag'          => 'ModuleRequired',
                    'TagType'      => 'Start',
                },
            ]
        },
        Expected => [
            [
                {
                    'Name'        => 'Data::Dumper',
                    'Version'     => $DataDumperVersion,
                    'IsInstalled' => 1,
                }
            ]
        ],
    },
);

for my $Test (@Tests) {
    my @Modules = $PackageObject->GetRequiredModules(
        Structure => $Test->{Data},
    );

    $Self->IsDeeply(
        \@Modules,
        $Test->{Expected},
        'GetRequiredModules() - ' . $Test->{Name},
    );
}

1;
