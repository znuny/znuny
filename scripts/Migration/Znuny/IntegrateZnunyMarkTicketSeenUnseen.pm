# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::IntegrateZnunyMarkTicketSeenUnseen;    ## no critic

use strict;
use warnings;
use utf8;

use IO::Interactive qw(is_interactive);

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::DB',
);

=head1 SYNOPSIS

Remove some deprecated user prefrences.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    return if !$Self->_RemoveDeprecatedUserPreferences(%Param);

    return 1;
}

sub _RemoveDeprecatedUserPreferences {
    my ( $Self, %Param ) = @_;

    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    my %PreferencesToRemove = (
        MarkTicketUnseenRedirectURL => [
            'Action=AgentTicketZoom;TicketID=###TicketID####1',
            'LastScreenView',
        ],
        MarkTicketSeenRedirectURL => [
            'Action=AgentTicketZoom;TicketID=###TicketID####1',
        ],
    );

    my $SQL = 'DELETE FROM user_preferences WHERE preferences_key = ? AND preferences_value = ?';

    for my $PreferenceKey ( sort keys %PreferencesToRemove ) {
        for my $PreferenceValue ( @{ $PreferencesToRemove{$PreferenceKey} } ) {
            my @Bind = (
                \$PreferenceKey,
                \$PreferenceValue,
            );

            return if !$DBObject->Do(
                SQL  => $SQL,
                Bind => \@Bind,
            );
        }
    }

    $CacheObject->CleanUp(
        Type => 'User',
    );

    return 1;
}

1;
