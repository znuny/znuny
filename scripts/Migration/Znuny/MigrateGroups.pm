# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::MigrateGroups;    ## no critic

#
# IMPORTANT
#
# TimeAccounting package was integrated into Znuny 6.1 and this migration module was
# included. It was removed from Znuny 6.2 again.
#
# But: Group "timeaccounting_webservice" wasn't added to the initial data insertion.
# So this group is missing in all *new* installations since 6.2.
# Hence, this migration module must be kept until the release of Znuny 7.2 (in 7.1 it is still
# needed if someone updates from an earlier 7.0 without this migration module).
#

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::Group',
    'Kernel::System::ZnunyHelper',
);

=head1 SYNOPSIS

Migrate web service configuration.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->_MigrateGroupNames(%Param);
    $Self->_CreateMissingGroups(%Param);

    return 1;
}

sub _MigrateGroupNames {
    my ( $Self, %Param ) = @_;

    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    my %Groups = $GroupObject->GroupList(
        Valid => 0,
    );
    return 1 if !%Groups;

    my %GroupIDsByName = reverse %Groups;

    my %GroupNameMapping = (
        'znuny4otrs_timeaccounting_webservice' => 'timeaccounting_webservice',
    );

    CURRENTGROUPNAME:
    for my $CurrentGroupName ( sort keys %GroupNameMapping ) {

        # No group with matching name found.
        next CURRENTGROUPNAME if !$GroupIDsByName{$CurrentGroupName};

        my $NewGroupName = $GroupNameMapping{$CurrentGroupName};

        # A group with the new name already exists.
        if ( $GroupIDsByName{$NewGroupName} ) {
            print
                "        Group $CurrentGroupName cannot be renamed to $NewGroupName because this name is already used by another group.\n";
            next CURRENTGROUPNAME;
        }

        # Rename group.
        my $RenamingOK = $DBObject->Do(
            SQL => '
                UPDATE permission_groups SET name = ?
                WHERE id = ?
            ',
            Bind => [
                \$NewGroupName,
                \$GroupIDsByName{$CurrentGroupName},
            ],
        );

        next CURRENTGROUPNAME if $RenamingOK;

        print "        Error renaming group $CurrentGroupName to $NewGroupName.\n";
    }

    return 1;
}

sub _CreateMissingGroups {
    my ( $Self, %Param ) = @_;

    my $GroupObject       = $Kernel::OM->Get('Kernel::System::Group');
    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    my %Groups = $GroupObject->GroupList(
        Valid => 0,
    );

    my %GroupIDsByName = reverse %Groups;

    my @GroupsToCreate = (
        {
            Name    => 'timeaccounting_webservice',
            Comment => 'Group for time accounting web service access.',
        },
    );

    GROUPNAME:
    for my $Group ( sort @GroupsToCreate ) {
        next GROUPNAME if $GroupIDsByName{ $Group->{Name} };

        $ZnunyHelperObject->_GroupCreateIfNotExists(
            Name    => $Group->{Name},
            Comment => $Group->{Comment},
        );
    }

    return 1;
}

1;
