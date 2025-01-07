# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::UninstallMergedPackages;    ## no critic

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::Package',
);

=head1 SYNOPSIS

Uninstalls code that was merged from packages into Znuny.

=head1 PUBLIC INTERFACE

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $CacheObject   = $Kernel::OM->Get('Kernel::System::Cache');
    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    # Purge relevant caches before uninstalling to avoid errors because of inconsistent states.
    $CacheObject->CleanUp(
        Type => 'RepositoryList',
    );
    $CacheObject->CleanUp(
        Type => 'RepositoryGet',
    );
    $CacheObject->CleanUp(
        Type => 'XMLParse',
    );

    my @PackageNames = (
        'Znuny-MarkTicketSeenUnseen',
        'Znuny4OTRS-MarkTicketSeenUnseen',
        'Znuny-CustomPriorityColor',
        'Znuny4OTRS-CustomPriorityColor',
    );

    PACKAGENAME:
    for my $PackageName (@PackageNames) {
        my $Success = $PackageObject->_PackageUninstallMerged(
            Name => $PackageName,
        );
        next PACKAGENAME if $Success;

        print "\n    Error uninstalling package $PackageName\n\n";
        return;
    }

    return 1;
}

1;
