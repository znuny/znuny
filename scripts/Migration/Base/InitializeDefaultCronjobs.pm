# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package scripts::Migration::Base::InitializeDefaultCronjobs;    ## no critic

use strict;
use warnings;
use utf8;

use File::Copy ();

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::Config',
);

=head1 SYNOPSIS

Creates default cron jobs if they don't exist yet.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $Home = $Kernel::OM->Get('Kernel::Config')->Get('Home');

    for my $DistFile ( glob "$Home/var/cron/*.dist" ) {
        my $TargetFile = $DistFile =~ s{.dist$}{}r;
        if ( !-e $TargetFile ) {
            print "    Copying $DistFile to $TargetFile...\n";
            my $Success = File::Copy::copy( $DistFile, $TargetFile );
            if ( !$Success ) {
                print "\n    Error: Could not copy $DistFile to $TargetFile: $!\n";
                return;
            }
            print "    done.\n";
        }
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
