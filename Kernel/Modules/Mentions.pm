# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::Mentions;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $JSONObject    = $Kernel::OM->Get('Kernel::System::JSON');
    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');

    my $Data = {};

    my $Subaction = $ParamObject->GetParam( Param => 'Subaction' ) // '';

    if ( $Subaction eq "Remove" ) {
        my %Params;

        # Agent with bulk action from AgentTicketMentionView can remove only his own mentions.
        my $BulkAction = $ParamObject->GetParam( Param => 'BulkAction' ) // 0;
        $Params{MentionedUserID} = $Self->{UserID} if $BulkAction;

        NEEDED:
        for my $Needed (qw(TicketID MentionedUserID)) {
            $Params{$Needed} = $ParamObject->GetParam( Param => $Needed ) if !$Params{$Needed};
            next NEEDED if defined $Params{$Needed};

            $LogObject->Log(
                Priority => 'error',
                Message  => "Parameter $Needed is missing.",
            );
            return;
        }

        $MentionObject->RemoveMention(
            TicketID        => $Params{TicketID},
            MentionedUserID => $Params{MentionedUserID},
            UserID          => $Self->{UserID},
        );
    }
    elsif ( $Subaction eq "GetUsers" ) {
        my $SearchTerm = $ParamObject->GetParam( Param => "SearchTerm" );
        my $Users      = $Self->_GetUsers(
            SearchTerm => $SearchTerm,
        );

        $Data = {
            Users => $Users,
        };
    }
    elsif ( $Subaction eq "GetGroups" ) {
        my $SearchTerm = $ParamObject->GetParam( Param => "SearchTerm" );
        my $Groups     = $Self->_GetGroups(
            SearchTerm => $SearchTerm
        );

        $Data = {
            Groups => $Groups,
        };
    }

    my $ListEncoded = $JSONObject->Encode(
        Data => $Data,
    );

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $ListEncoded,
        Type        => 'inline',
        NoCache     => 1,
    );
}

sub _GetUsers {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    NEEDED:
    for my $Needed (qw(SearchTerm)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return if !IsStringWithData( $Param{SearchTerm} );

    my %Users = $UserObject->UserList(
        Type  => 'Short',
        Valid => 1
    );

    my @Users;

    USER:
    for my $User ( sort keys %Users ) {
        my %UserData = $UserObject->GetUserData(
            UserID => $User
        );

        next USER
            if $UserData{UserFullname} !~ m{\Q$Param{SearchTerm}\E}i
            && $UserData{UserLogin}    !~ m{\Q$Param{SearchTerm}\E}i
            && $UserData{UserEmail}    !~ m{\Q$Param{SearchTerm}\E}i;

        my %AssembledUserData = (
            id       => $UserData{UserID},
            fullname => $UserData{UserFullname},
            username => $UserData{UserLogin},
        );

        push @Users, \%AssembledUserData;
    }

    return \@Users;
}

sub _GetGroups {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $GroupObject   = $Kernel::OM->Get('Kernel::System::Group');
    my $UserObject    = $Kernel::OM->Get('Kernel::System::User');
    my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');

    NEEDED:
    for my $Needed (qw(SearchTerm)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return if !IsStringWithData( $Param{SearchTerm} );

    my %Groups = $GroupObject->GroupList(
        Valid => 1,
    );

    # Filter for search term and blocked groups
    %Groups = map { $_ => $Groups{$_} }
        grep {
        $Groups{$_} =~ m{\Q$Param{SearchTerm}\E}i
            && !$MentionObject->IsGroupBlocked( Group => $Groups{$_} )
        }
        sort keys %Groups;

    my @Groups;

    GROUPID:
    for my $GroupID ( sort keys %Groups ) {
        my $Group = $Groups{$GroupID};

        my %Users = $GroupObject->PermissionGroupUserGet(
            GroupID => $GroupID,
            Type    => 'ro',
        );

        my $NumberOfUsers = keys %Users;
        my $MentionLabel  = $LayoutObject->{LanguageObject}->Translate( '%s users will be mentioned', $NumberOfUsers );

        my %AssembledGroupData = (
            id           => $GroupID,
            name         => $Group,
            mentionLabel => $MentionLabel,
        );

        push @Groups, \%AssembledGroupData;
    }

    return \@Groups;
}

1;
