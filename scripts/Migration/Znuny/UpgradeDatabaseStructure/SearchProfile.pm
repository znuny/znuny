# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package scripts::Migration::Znuny::UpgradeDatabaseStructure::SearchProfile;    ## no critic

use strict;
use warnings;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies;

=head1 SYNOPSIS

Increases size of columns of database table search_profile.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    return if !$Self->_IncreaseColumnsSize(%Param);

    return 1;
}

sub _IncreaseColumnsSize {
    my ( $Self, %Param ) = @_;

    my @XMLStrings = (
        '<TableAlter Name="search_profile">
            <ColumnChange NameOld="profile_key" NameNew="profile_key" Required="true" Size="2000" Type="VARCHAR"/>
            <ColumnChange NameOld="profile_value" NameNew="profile_value" Required="false" Size="2000" Type="VARCHAR"/>
        </TableAlter>',
    );

    return if !$Self->ExecuteXMLDBArray(
        XMLArray => \@XMLStrings,
    );

    return 1;
}

1;
