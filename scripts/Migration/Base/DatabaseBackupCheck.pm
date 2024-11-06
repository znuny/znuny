# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Base::DatabaseBackupCheck;    ## no critic

use strict;
use warnings;
use utf8;

use IO::Interactive qw(is_interactive);

use parent qw(scripts::Migration::Base);

use version;

our @ObjectDependencies = (
    'Kernel::System::DB',
);

=head1 SYNOPSIS

Checks if database was backed up.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    return 1;
}

=head2 CheckPreviousRequirement()

Check for initial conditions for running this migration step.

Returns 1 on success:

    my $Result = $MigrateToZnunyObject->CheckPreviousRequirement();

=cut

sub CheckPreviousRequirement {
    my ( $Self, %Param ) = @_;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # This check will occur only if we are in interactive mode.
    if ( $Param{CommandlineOptions}->{NonInteractive} || !is_interactive() ) {
        return 1;
    }

    if ( $Param{CommandlineOptions}->{Verbose} ) {
        print "\n        Warning: this script can make changes to your database which are irreversible.\n"
            . "        Make sure you have properly backed up complete database before continuing.\n\n";
    }

    print "\n        Did you backup the database? [Y]es/[N]o: ";

    my $Answer = <>;

    # Remove white space from input.
    $Answer =~ s{\s}{}g;

    # Continue only if user answers affirmatively.
    if ( $Answer =~ m{\Ay(?:es)?\z}i ) {
        print "\n";
        return 1;
    }

    return;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
