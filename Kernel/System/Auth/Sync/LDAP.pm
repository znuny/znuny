# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Auth::Sync::LDAP;

use strict;
use warnings;

use Net::LDAP;
use Net::LDAP::Util qw(escape_filter_value);
use URI;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Encode',
    'Kernel::System::Group',
    'Kernel::System::Log',
    'Kernel::System::User',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    # Debug 0=off 1=on
    $Self->{Debug} = 0;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get ldap preferences
    if ( !$ConfigObject->Get( 'AuthSyncModule::LDAP::Host' . $Param{Count} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need AuthSyncModule::LDAP::Host$Param{Count} in Kernel/Config.pm",
        );
        return;
    }
    if ( !defined $ConfigObject->Get( 'AuthSyncModule::LDAP::BaseDN' . $Param{Count} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need AuthSyncModule::LDAP::BaseDN$Param{Count} in Kernel/Config.pm",
        );
        return;
    }
    if ( !$ConfigObject->Get( 'AuthSyncModule::LDAP::UID' . $Param{Count} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need AuthSyncModule::LDAP::UID$Param{Count} in Kernel/Config.pm",
        );
        return;
    }
    $Self->{Count}        = $Param{Count} || '';
    $Self->{Die}          = $ConfigObject->Get( 'AuthSyncModule::LDAP::Die' . $Param{Count} );
    $Self->{Host}         = $ConfigObject->Get( 'AuthSyncModule::LDAP::Host' . $Param{Count} );
    $Self->{BaseDN}       = $ConfigObject->Get( 'AuthSyncModule::LDAP::BaseDN' . $Param{Count} );
    $Self->{UID}          = $ConfigObject->Get( 'AuthSyncModule::LDAP::UID' . $Param{Count} );
    $Self->{SearchUserDN} = $ConfigObject->Get( 'AuthSyncModule::LDAP::SearchUserDN' . $Param{Count} ) || '';
    $Self->{SearchUserPw} = $ConfigObject->Get( 'AuthSyncModule::LDAP::SearchUserPw' . $Param{Count} ) || '';
    $Self->{GroupDN}      = $ConfigObject->Get( 'AuthSyncModule::LDAP::GroupDN' . $Param{Count} )
        || '';
    $Self->{AccessAttr} = $ConfigObject->Get( 'AuthSyncModule::LDAP::AccessAttr' . $Param{Count} )
        || 'memberUid';
    $Self->{UserAttr} = $ConfigObject->Get( 'AuthSyncModule::LDAP::UserAttr' . $Param{Count} )
        || 'DN';
    $Self->{DestCharset} = $ConfigObject->Get( 'AuthSyncModule::LDAP::Charset' . $Param{Count} )
        || 'utf-8';
    $Self->{NestedGroupSearch} = $ConfigObject->Get( 'AuthSyncModule::LDAP::NestedGroupSearch' . $Param{Count} );

    # ldap filter always used
    $Self->{AlwaysFilter} = $ConfigObject->Get( 'AuthSyncModule::LDAP::AlwaysFilter' . $Param{Count} ) || '';

    # Net::LDAP new params
    if ( $ConfigObject->Get( 'AuthSyncModule::LDAP::Params' . $Param{Count} ) ) {
        $Self->{Params} = $ConfigObject->Get( 'AuthSyncModule::LDAP::Params' . $Param{Count} );
    }
    else {
        $Self->{Params} = {};
    }

    return $Self;
}

sub Sync {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{User} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need User!'
        );
        return;
    }
    $Param{User} = $Self->_ConvertTo( $Param{User}, 'utf-8' );

    my $RemoteAddr = $ENV{REMOTE_ADDR} || 'Got no REMOTE_ADDR env!';

    # remove leading and trailing spaces
    $Param{User} =~ s{ \A \s* ( [^\s]+ ) \s* \z }{$1}xms;

    # just in case for debug!
    if ( $Self->{Debug} > 0 ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "User: '$Param{User}' tried to sync (REMOTE_ADDR: $RemoteAddr)",
        );
    }

    # ldap connect and bind (maybe with SearchUserDN and SearchUserPw)
    my $LDAP = Net::LDAP->new( $Self->{Host}, %{ $Self->{Params} } );
    if ( !$LDAP ) {
        if ( $Self->{Die} ) {
            die "Can't connect to $Self->{Host}: $@";
        }

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't connect to $Self->{Host}: $@",
        );
        return;
    }
    my $Result;
    if ( $Self->{SearchUserDN} && $Self->{SearchUserPw} ) {
        $Result = $LDAP->bind(
            dn       => $Self->{SearchUserDN},
            password => $Self->{SearchUserPw}
        );
    }
    else {
        $Result = $LDAP->bind();
    }
    if ( $Result->code() ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'First bind failed! ' . $Result->error(),
        );
        return;
    }

    # build filter
    my $Filter = "($Self->{UID}=" . escape_filter_value( $Param{User} ) . ')';

    # prepare filter
    if ( $Self->{AlwaysFilter} ) {
        $Filter = "(&$Filter$Self->{AlwaysFilter})";
    }

    # perform user search
    $Result = $LDAP->search(
        base   => $Self->{BaseDN},
        filter => $Filter,
    );
    if ( $Result->code() ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Search failed! ($Self->{BaseDN}) filter='$Filter' " . $Result->error(),
        );
        return;
    }

    # get whole user dn
    my $UserDN;
    for my $Entry ( $Result->all_entries() ) {
        $UserDN = $Entry->dn();
    }

    # log if there is no LDAP user entry
    if ( !$UserDN ) {

        # failed login note
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "User: $Param{User} sync failed, no LDAP entry found!"
                . "BaseDN='$Self->{BaseDN}', Filter='$Filter', (REMOTE_ADDR: $RemoteAddr).",
        );

        # take down session
        $LDAP->unbind();
        return;
    }

    # check if user needs to be in a group!
    if ( $Self->{AccessAttr} && $Self->{GroupDN} ) {

        # just in case for debug
        if ( $Self->{Debug} > 0 ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => 'check for groupdn!',
            );
        }

        # search if we're allowed to
        my $Filter2 = '';
        if ( $Self->{UserAttr} eq 'DN' ) {
            $Filter2 = "($Self->{AccessAttr}=" . escape_filter_value($UserDN) . ')';
        }
        else {
            $Filter2 = "($Self->{AccessAttr}=" . escape_filter_value( $Param{User} ) . ')';
        }
        my $Result2 = $LDAP->search(
            base   => $Self->{GroupDN},
            filter => $Filter2,
            attrs  => ['1.1'],
        );
        if ( $Result2->code() ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Search failed! base='$Self->{GroupDN}', filter='$Filter2', "
                    . $Result2->error(),
            );

            # take down session
            $LDAP->unbind();
            $LDAP->disconnect();
            return;
        }

        # extract it
        my $GroupDN = '';
        for my $Entry ( $Result2->all_entries() ) {
            $GroupDN = $Entry->dn();
        }

        # log if there is no LDAP entry
        if ( !$GroupDN ) {

            # failed login note
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => "User: $Param{User} sync failed, no LDAP group entry found"
                    . "GroupDN='$Self->{GroupDN}', Filter='$Filter2'! (REMOTE_ADDR: $RemoteAddr).",
            );

            # take down session
            $LDAP->unbind();
            $LDAP->disconnect();
            return;
        }
    }

    # get needed objects
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get current user id
    my $UserID = $UserObject->UserLookup(
        UserLogin => $Param{User},
        Silent    => 1,
    );

    # system permissions
    my %PermissionsEmpty =
        map { $_ => 0 } @{ $ConfigObject->Get('System::Permission') };

    # get group object
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # get system groups and create lookup
    my %SystemGroups       = $GroupObject->GroupList( Valid => 1 );
    my %SystemGroupsByName = reverse %SystemGroups;

    # get system roles and create lookup
    my %SystemRoles       = $GroupObject->RoleList( Valid => 1 );
    my %SystemRolesByName = reverse %SystemRoles;

    # sync user from ldap
    my $UserSyncMap = $ConfigObject->Get( 'AuthSyncModule::LDAP::UserSyncMap' . $Self->{Count} );
    if ($UserSyncMap) {

        # get whole user dn
        my %SyncUser;
        for my $Entry ( $Result->all_entries() ) {
            for my $Key ( sort keys %{$UserSyncMap} ) {

                # detect old config setting
                if ( $Key =~ m{ \A (?: Firstname | Lastname | Email ) }xms ) {
                    $Key = 'User' . $Key;
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => 'Old config setting detected, please use the new one '
                            . 'from Kernel/Config/Defaults.pm (User* has been added!).',
                    );
                }

                my $AttributeNames = $UserSyncMap->{$Key};
                if ( ref $AttributeNames ne 'ARRAY' ) {
                    $AttributeNames = [$AttributeNames];
                }
                ATTRIBUTE_NAME:
                for my $AttributeName ( @{$AttributeNames} ) {
                    if ( $AttributeName =~ /^_/ ) {
                        $SyncUser{$Key} = substr( $AttributeName, 1 );
                        last ATTRIBUTE_NAME;
                    }
                    elsif ( $Entry->get_value($AttributeName) ) {
                        $SyncUser{$Key} = $Entry->get_value($AttributeName);
                        last ATTRIBUTE_NAME;
                    }
                }

                # e. g. set utf-8 flag
                $SyncUser{$Key} = $Self->_ConvertFrom(
                    $SyncUser{$Key},
                    'utf-8',
                );
            }
            if ( $Entry->get_value('userPassword') ) {
                $SyncUser{UserPw} = $Entry->get_value('userPassword');

                # e. g. set utf-8 flag
                $SyncUser{UserPw} = $Self->_ConvertFrom(
                    $SyncUser{UserPw},
                    'utf-8',
                );
            }
        }

        # add new user
        if ( %SyncUser && !$UserID ) {
            $UserID = $UserObject->UserAdd(
                UserLogin => $Param{User},
                %SyncUser,    # Must contain other parameters required by UserAdd.
                UserType     => 'User',
                ValidID      => 1,
                ChangeUserID => 1,
            );
            if ( !$UserID ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Can't create user '$Param{User}' ($UserDN) in RDBMS!",
                );

                # take down session
                $LDAP->unbind();
                return;
            }
            else {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'notice',
                    Message  => "Initial data for '$Param{User}' ($UserDN) created in RDBMS.",
                );

                # sync initial groups
                my $UserSyncInitialGroups = $ConfigObject->Get(
                    'AuthSyncModule::LDAP::UserSyncInitialGroups' . $Self->{Count}
                );
                if ($UserSyncInitialGroups) {
                    GROUP:
                    for my $Group ( @{$UserSyncInitialGroups} ) {

                        # only for valid groups
                        if ( !$SystemGroupsByName{$Group} ) {
                            $Kernel::OM->Get('Kernel::System::Log')->Log(
                                Priority => 'notice',
                                Message =>
                                    "Invalid group '$Group' in "
                                    . "'AuthSyncModule::LDAP::UserSyncInitialGroups"
                                    . "$Self->{Count}'!",
                            );
                            next GROUP;
                        }

                        $GroupObject->PermissionGroupUserAdd(
                            GID        => $SystemGroupsByName{$Group},
                            UID        => $UserID,
                            Permission => {
                                rw => 1,
                            },
                            UserID => 1,
                        );
                    }
                }
            }
        }

        # update user attributes (only if changed)
        elsif (%SyncUser) {

            # get user data
            my %UserData = $UserObject->GetUserData( User => $Param{User} );

            # check for changes
            my $AttributeChange;
            ATTRIBUTE:
            for my $Attribute ( sort keys %SyncUser ) {

                # Treat undef and empty strings as equal.
                my $SyncUserAttribute = $SyncUser{$Attribute} // '';
                my $UserDataAttribute = $UserData{$Attribute} // '';
                next ATTRIBUTE if $SyncUserAttribute eq $UserDataAttribute;
                $AttributeChange = 1;
                last ATTRIBUTE;
            }

            if ($AttributeChange) {
                $UserObject->UserUpdate(
                    ValidID   => $UserData{ValidID},    # May be not present in %SyncUser and is required by UserUpdate.
                    UserID    => $UserID,
                    UserLogin => $Param{User},
                    %SyncUser,                          # Must contain other parameters required by UserUpdate.
                    UserType     => 'User',
                    ChangeUserID => 1,
                );
            }
        }
    }

    # variable to store group permissions from ldap
    my %GroupPermissionsFromLDAP;

    # sync ldap group 2 otrs group permissions
    my $UserSyncGroupsDefinition = $ConfigObject->Get(
        'AuthSyncModule::LDAP::UserSyncGroupsDefinition' . $Self->{Count}
    );
    if ($UserSyncGroupsDefinition) {

        # read and remember groups from ldap
        GROUPDN:
        for my $GroupDN ( sort keys %{$UserSyncGroupsDefinition} ) {

            # search if we are allowed to
            my $Filter;
            if ( $Self->{UserAttr} eq 'DN' ) {
                $Filter = "($Self->{AccessAttr}=" . escape_filter_value($UserDN) . ')';
            }
            else {
                $Filter = "($Self->{AccessAttr}=" . escape_filter_value( $Param{User} ) . ')';
            }
            my $Result = $LDAP->search(
                base   => $GroupDN,
                filter => $Filter,
            );
            if ( $Result->code() ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Search failed! ($GroupDN) filter='$Filter' " . $Result->error(),
                );
                next GROUPDN;
            }

            # extract it
            my $Valid;
            for my $Entry ( $Result->all_entries() ) {
                $Valid = $Entry->dn();
            }

            # only consider nested group search if we got no result
            if (
                !$Valid
                && $Self->{NestedGroupSearch}
                )
            {

                # check if nested group search is ENABLED
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'debug',
                    Message  => 'Performing an extended nested group search.',
                );

                my $NestedGroupResult = $Self->_NestedGroupSearch( $LDAP, $GroupDN, $UserDN );

                # check if user was found with nested group search
                if ($NestedGroupResult) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'info',
                        Message  => "User: $Param{User} membership for group "
                            . "GroupDN='$GroupDN' confirmed through nested group search.",
                    );

                    # change the result to be valid
                    $Valid = $UserDN;
                }
            }

            # log if there is no LDAP entry
            if ( !$Valid ) {

                # failed login note
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'notice',
                    Message  => "User: $Param{User} not in "
                        . "GroupDN='$GroupDN', Filter='$Filter'! (REMOTE_ADDR: $RemoteAddr).",
                );
                next GROUPDN;
            }

            # remember group permissions
            my %SyncGroups = %{ $UserSyncGroupsDefinition->{$GroupDN} };
            SYNCGROUP:
            for my $SyncGroup ( sort keys %SyncGroups ) {

                # only for valid groups
                if ( !$SystemGroupsByName{$SyncGroup} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'notice',
                        Message =>
                            "Invalid group '$SyncGroup' in "
                            . "'AuthSyncModule::LDAP::UserSyncGroupsDefinition"
                            . "$Self->{Count}'!",
                    );
                    next SYNCGROUP;
                }

                # set/overwrite remembered permissions

                # if rw permission exists, discard all other permissions
                if ( $SyncGroups{$SyncGroup}->{rw} ) {
                    $GroupPermissionsFromLDAP{ $SystemGroupsByName{$SyncGroup} } = {
                        rw => 1,
                    };
                    next SYNCGROUP;
                }

                # remember permissions as provided
                $GroupPermissionsFromLDAP{ $SystemGroupsByName{$SyncGroup} } = {
                    %PermissionsEmpty,
                    %{ $SyncGroups{$SyncGroup} },
                };
            }
        }
    }

    # sync ldap attribute 2 otrs group permissions
    my $UserSyncAttributeGroupsDefinition = $ConfigObject->Get(
        'AuthSyncModule::LDAP::UserSyncAttributeGroupsDefinition' . $Self->{Count}
    );
    if ($UserSyncAttributeGroupsDefinition) {

        # build filter
        my $Filter = "($Self->{UID}=" . escape_filter_value( $Param{User} ) . ')';

        # perform search
        $Result = $LDAP->search(
            base   => $Self->{BaseDN},
            filter => $Filter,
        );
        if ( $Result->code() ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Search failed! ($Self->{BaseDN}) filter='$Filter' " . $Result->error(),
            );
        }
        else {
            my %SyncConfig = %{$UserSyncAttributeGroupsDefinition};
            for my $Attribute ( sort keys %SyncConfig ) {

                my %AttributeValues = %{ $SyncConfig{$Attribute} };
                ATTRIBUTEVALUE:
                for my $AttributeValue ( sort keys %AttributeValues ) {

                    for my $Entry ( $Result->all_entries() ) {

                        # Check if configured value exists in values of group attribute
                        # If yes, add sync groups to the user
                        my $GotValue;
                        my @Values = $Entry->get_value($Attribute);
                        VALUE:
                        for my $Value (@Values) {
                            next VALUE if $Value !~ m{ \A \Q$AttributeValue\E \z }xmsi;
                            $GotValue = 1;
                            last VALUE;
                        }
                        next ATTRIBUTEVALUE if !$GotValue;

                        # remember group permissions
                        my %SyncGroups = %{ $AttributeValues{$AttributeValue} };
                        SYNCGROUP:
                        for my $SyncGroup ( sort keys %SyncGroups ) {

                            # only for valid groups
                            if ( !$SystemGroupsByName{$SyncGroup} ) {
                                $Kernel::OM->Get('Kernel::System::Log')->Log(
                                    Priority => 'notice',
                                    Message =>
                                        "Invalid group '$SyncGroup' in "
                                        . "'AuthSyncModule::LDAP::UserSyncAttributeGroupsDefinition"
                                        . "$Self->{Count}'!",
                                );
                                next SYNCGROUP;
                            }

                            # set/overwrite remembered permissions

                            # if rw permission exists, discard all other permissions
                            if ( $SyncGroups{$SyncGroup}->{rw} ) {
                                $GroupPermissionsFromLDAP{ $SystemGroupsByName{$SyncGroup} } = {
                                    rw => 1,
                                };
                                next SYNCGROUP;
                            }

                            # remember permissions as provided
                            $GroupPermissionsFromLDAP{ $SystemGroupsByName{$SyncGroup} } = {
                                %PermissionsEmpty,
                                %{ $SyncGroups{$SyncGroup} },
                            };
                        }
                    }
                }
            }
        }
    }

    # Compare group permissions from LDAP with current user group permissions.
    my %GroupPermissionsChanged;

    PERMISSIONTYPE:
    for my $PermissionType ( @{ $ConfigObject->Get('System::Permission') } ) {

        # get current permission for type
        my %GroupPermissions = $GroupObject->PermissionUserGroupGet(
            UserID => $UserID,
            Type   => $PermissionType,
        );

        GROUPID:
        for my $GroupID ( sort keys %SystemGroups ) {

            my $OldPermission = $GroupPermissions{$GroupID} ? 1 : 0;

            # Set the new permission (from LDAP) if exist, if not set it to a default value
            #   regularly 0 but it LDAP has rw permission set it to 1 as PermissionUserGroupGet()
            #   gets all system permissions to 1 if stored permission is rw.
            my $NewPermission = $GroupPermissionsFromLDAP{$GroupID}->{$PermissionType}
                || $GroupPermissionsFromLDAP{$GroupID}->{rw} ? 1 : 0;

            # Skip permission if is identical as in the DB
            next GROUPID if $OldPermission == $NewPermission;

            # Remember the LDAP permission if they are not identical as in the DB.
            $GroupPermissionsChanged{$GroupID} = $GroupPermissionsFromLDAP{$GroupID};
        }
    }

    # update changed group permissions
    if (
        %GroupPermissionsChanged
        && (
            $UserSyncGroupsDefinition
            || $UserSyncAttributeGroupsDefinition
        )
        )
    {
        for my $GroupID ( sort keys %GroupPermissionsChanged ) {

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => "User: '$Param{User}' sync ldap group $SystemGroups{$GroupID}!",
            );
            $GroupObject->PermissionGroupUserAdd(
                GID        => $GroupID,
                UID        => $UserID,
                Permission => $GroupPermissionsChanged{$GroupID} || \%PermissionsEmpty,
                UserID     => 1,
            );
        }
    }

    # variable to store role permissions from ldap
    my %RolePermissionsFromLDAP;

    # sync ldap group 2 otrs role permissions
    my $UserSyncRolesDefinition = $ConfigObject->Get(
        'AuthSyncModule::LDAP::UserSyncRolesDefinition' . $Self->{Count}
    );
    if ($UserSyncRolesDefinition) {

        # read and remember roles from ldap
        GROUPDN:
        for my $GroupDN ( sort keys %{$UserSyncRolesDefinition} ) {

            # search if we're allowed to
            my $Filter;
            if ( $Self->{UserAttr} eq 'DN' ) {
                $Filter = "($Self->{AccessAttr}=" . escape_filter_value($UserDN) . ')';
            }
            else {
                $Filter = "($Self->{AccessAttr}=" . escape_filter_value( $Param{User} ) . ')';
            }
            my $Result = $LDAP->search(
                base   => $GroupDN,
                filter => $Filter,
            );
            if ( $Result->code() ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Search failed! ($GroupDN) filter='$Filter' " . $Result->error(),
                );
                next GROUPDN;
            }

            # extract it
            my $Valid;
            for my $Entry ( $Result->all_entries() ) {
                $Valid = $Entry->dn();
            }

            # log if there is no LDAP entry
            if ( !$Valid ) {

                # failed login note
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'notice',
                    Message  => "User: $Param{User} not in "
                        . "GroupDN='$GroupDN', Filter='$Filter'! (REMOTE_ADDR: $RemoteAddr).",
                );
                next GROUPDN;
            }

            # remember role permissions
            my %SyncRoles = %{ $UserSyncRolesDefinition->{$GroupDN} };
            SYNCROLE:
            for my $SyncRole ( sort keys %SyncRoles ) {

                # only for valid roles
                if ( !$SystemRolesByName{$SyncRole} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'notice',
                        Message =>
                            "Invalid role '$SyncRole' in "
                            . "'AuthSyncModule::LDAP::UserSyncRolesDefinition"
                            . "$Self->{Count}'!",
                    );
                    next SYNCROLE;
                }

                # set/overwrite remembered permissions
                $RolePermissionsFromLDAP{ $SystemRolesByName{$SyncRole} } =
                    $SyncRoles{$SyncRole};
            }
        }
    }

    # sync ldap attribute 2 otrs role permissions
    my $UserSyncAttributeRolesDefinition = $ConfigObject->Get(
        'AuthSyncModule::LDAP::UserSyncAttributeRolesDefinition' . $Self->{Count}
    );
    if ($UserSyncAttributeRolesDefinition) {

        # build filter
        my $Filter = "($Self->{UID}=" . escape_filter_value( $Param{User} ) . ')';

        # perform search
        $Result = $LDAP->search(
            base   => $Self->{BaseDN},
            filter => $Filter,
        );
        if ( $Result->code() ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Search failed! ($Self->{BaseDN}) filter='$Filter' " . $Result->error(),
            );
        }
        else {
            my %SyncConfig = %{$UserSyncAttributeRolesDefinition};
            for my $Attribute ( sort keys %SyncConfig ) {

                my %AttributeValues = %{ $SyncConfig{$Attribute} };
                ATTRIBUTEVALUE:
                for my $AttributeValue ( sort keys %AttributeValues ) {

                    for my $Entry ( $Result->all_entries() ) {

                        # Check if configured value exists in values of role attribute
                        # If yes, add sync roles to the user
                        my $GotValue;
                        my @Values = $Entry->get_value($Attribute);
                        VALUE:
                        for my $Value (@Values) {
                            next VALUE if $Value !~ m{ \A \Q$AttributeValue\E \z }xmsi;
                            $GotValue = 1;
                            last VALUE;
                        }
                        next ATTRIBUTEVALUE if !$GotValue;

                        # remember role permissions
                        my %SyncRoles = %{ $AttributeValues{$AttributeValue} };
                        SYNCROLE:
                        for my $SyncRole ( sort keys %SyncRoles ) {

                            # only for valid roles
                            if ( !$SystemRolesByName{$SyncRole} ) {
                                $Kernel::OM->Get('Kernel::System::Log')->Log(
                                    Priority => 'notice',
                                    Message =>
                                        "Invalid role '$SyncRole' in "
                                        . "'AuthSyncModule::LDAP::UserSyncAttributeRolesDefinition"
                                        . "$Self->{Count}'!",
                                );
                                next SYNCROLE;
                            }

                            # set/overwrite remembered permissions
                            $RolePermissionsFromLDAP{ $SystemRolesByName{$SyncRole} } =
                                $SyncRoles{$SyncRole};
                        }
                    }
                }
            }
        }
    }

    # compare role permissions from ldap with current user role permissions and update if necessary

    if (
        $UserSyncRolesDefinition
        || $UserSyncAttributeRolesDefinition
        )
    {

        # get current user roles
        my %UserRoles = $GroupObject->PermissionUserRoleGet(
            UserID => $UserID,
        );

        ROLEID:
        for my $RoleID ( sort keys %SystemRoles ) {

            # if old and new permission for role matches, do nothing
            if (
                ( $UserRoles{$RoleID} && $RolePermissionsFromLDAP{$RoleID} )
                ||
                ( !$UserRoles{$RoleID} && !$RolePermissionsFromLDAP{$RoleID} )
                )
            {
                next ROLEID;
            }

            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => "User: '$Param{User}' sync ldap role $SystemRoles{$RoleID}!",
            );
            $GroupObject->PermissionRoleUserAdd(
                UID    => $UserID,
                RID    => $RoleID,
                Active => $RolePermissionsFromLDAP{$RoleID} || 0,
                UserID => 1,
            );
        }
    }

    # take down session
    $LDAP->unbind();

    return $Param{User};
}

sub _ConvertTo {
    my ( $Self, $Text, $Charset ) = @_;

    return if !defined $Text;

    # get encode object
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    if ( !$Charset || !$Self->{DestCharset} ) {
        $EncodeObject->EncodeInput( \$Text );
        return $Text;
    }

    # convert from input charset ($Charset) to directory charset ($Self->{DestCharset})
    return $EncodeObject->Convert(
        Text => $Text,
        From => $Charset,
        To   => $Self->{DestCharset},
    );
}

sub _ConvertFrom {
    my ( $Self, $Text, $Charset ) = @_;

    return if !defined $Text;

    # get encode object
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    if ( !$Charset || !$Self->{DestCharset} ) {
        $EncodeObject->EncodeInput( \$Text );
        return $Text;
    }

    # convert from directory charset ($Self->{DestCharset}) to input charset ($Charset)
    return $EncodeObject->Convert(
        Text => $Text,
        From => $Self->{DestCharset},
        To   => $Charset,
    );
}

sub _NestedGroupSearch {
    my ( $Self, $LDAP, $GroupDN, $UserDN ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    $LogObject->Log(
        Priority => 'debug',
        Message  => "Nested group search to check if user $UserDN is a member of group $GroupDN.",
    );

    # protect against circular nesting (=infinite loop)
    my $FoundGroups = {};

    # call the actual search function
    my $MemberFound = 0;
    $Self->_NestedGroupSearchMemberFind( $LDAP, $GroupDN, $UserDN, $FoundGroups, \$MemberFound );

    my $GroupCount = keys %{$FoundGroups};
    $LogObject->Log(
        Priority => 'debug',
        Message  => 'Nested group search remembered '
            . "$GroupCount group objects to prevent an infinite loop.",
    );

    return $MemberFound;
}

sub _NestedGroupSearchMemberFind {
    my ( $Self, $LDAP, $GroupDN, $UserDN, $FoundGroups, $MemberFound ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check for infinite loop
    if ( $FoundGroups->{$GroupDN} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Nested group search found circular nesting in "
                . "$GroupDN (while searching for user $UserDN)",
        );
        return;
    }

    # check if the user is a member of this group
    my $Result = $LDAP->compare(
        $GroupDN,
        attr  => 'uniquemember',
        value => $UserDN,
    );
    return if !$Result;

    if ( $Result->code() == Net::LDAP::Constant::LDAP_COMPARE_TRUE() ) {
        $LogObject->Log(
            Priority => 'debug',
            Message  => "Nested group search result: $UserDN is a member of $GroupDN",
        );
        ${$MemberFound} = 1;
        return;
    }

    #
    # not a member, continue search
    #

    # get list of group members
    my @GroupAttributes = qw( uniquemember objectclass memberurl );
    $Result = $LDAP->search(
        base       => $GroupDN,
        filter     => '(|(objectclass=groupOfUniqueNames)(objectclass=groupOfUrls))',
        Attributes => \@GroupAttributes,
    );
    return if !$Result;

    my $Entry = $Result->pop_entry();
    return if !$Entry;

    $LogObject->Log(
        Priority => 'debug',
        Message  => "Nested group search in GroupDN " . $Entry->dn(),
    );

    # add group to list
    # if it is seen again, it will be ignoreed to avoid an infinite loop
    $FoundGroups->{ $Entry->dn() } = 1;

    # search in dynamic groups
    my $URLValues = $Entry->get_value( 'memberurl', asref => 1 ) // [];
    URLVALUE:
    for my $URLValue ( @{$URLValues} ) {
        my $Uri        = URI->new($URLValue);
        my $Filter     = $Uri->filter();
        my @Attributes = $Uri->attributes();

        $Result = $LDAP->search(
            base       => $UserDN,
            scope      => 'base',
            filter     => $Filter,
            Attributes => \@Attributes,
        );
        next URLVALUE if !$Result;

        # check if entry was found
        $Entry = $Result->pop_entry();
        next URLVALUE if !$Entry;

        ${$MemberFound} = 1;
        return;
    }

    # search in static groups
    my $MemberValues = $Entry->get_value( 'uniquemember', asref => 1 ) // [];
    VALUE:
    for my $Value ( @{$MemberValues} ) {

        # call search function again for each member
        $Self->_NestedGroupSearchMemberFind( $LDAP, $Value, $UserDN, $FoundGroups, $MemberFound );

        # stop if match was found
        last VALUE if ${$MemberFound};
    }

    # abort on LDAP errors
    die $Result->error() if $Result->code();

    return;
}

1;
