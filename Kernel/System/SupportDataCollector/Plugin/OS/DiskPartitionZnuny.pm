# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::OS::DiskPartitionZnuny;

use strict;
use warnings;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('Operating System');
}

sub Run {
    my $Self = shift;

    # Check if used OS is a linux system
    if ( $^O !~ /(linux|unix|netbsd|freebsd|darwin)/i ) {
        return $Self->GetResults();
    }

    # find Znuny partition
    my $Home = $Kernel::OM->Get('Kernel::Config')->Get('Home');

    my $ZnunyPartition = `df -P $Home | tail -1 | cut -d' ' -f 1`;
    chomp $ZnunyPartition;

    $Self->AddResultInformation(
        Label => Translatable('Znuny Disk Partition'),
        Value => $ZnunyPartition,
    );

    return $Self->GetResults();
}

1;
