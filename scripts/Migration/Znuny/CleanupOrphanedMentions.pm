# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::CleanupOrphanedMentions;    ## no critic

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::System::DB',
);

=head1 SYNOPSIS

Remove mentions that are not linked to a ticket anymore.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    return if !$Self->_CleanupOrphanedMentions(%Param);

    return 1;
}

sub _CleanupOrphanedMentions {
    my ( $Self, %Param ) = @_;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Do(
        SQL => 'DELETE FROM mention WHERE ticket_id NOT IN (SELECT id FROM ticket)',
    );

    return 1;
}

1;
