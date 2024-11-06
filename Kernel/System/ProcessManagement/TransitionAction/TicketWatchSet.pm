# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionAction::TicketWatchSet;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::ProcessManagement::TransitionAction::Base);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::TicketWatchSet - A module to enables or disables watching of a ticket.

=head1 SYNOPSIS

All TicketWatchSet functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    my $TicketWatchSetObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionAction::TicketWatchSet');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

Runs TransitionAction TicketWatchSet

    my $Success = $TicketWatchSetActionObject->Run(
        UserID                   => 123,

        # Ticket contains the result of TicketGet including dynamic fields.
        Ticket                   => \%Ticket,   # required

        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',

        # Config is the hash stored in a Process::TransitionAction's config key.
        Config                   => {
            Action    => 'Subscribe', # Subscribe/Unsubscribe
            UserLogin => 'UserLogin1, UserLogin2, UserLogin3',

            # or
            Action           => 'Subscribe', # Subscribe/Unsubscribe
            PostMasterSearch => 'UserLogin1@znuny.com, UserLogin2@znuny.com, UserLogin3@znuny.com',

            # or
            Action  => 'Subscribe', # Subscribe/Unsubscribe
            UserIDs => '1, 2, 3',

            # or
            Action => 'UnsubscribeAll',

            UserID => 123,                     # optional, to override the UserID from the logged user
        }
    );


Returns:

    my $Success = 1; # 0

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');

    # define a common message to output in case of any error
    my $CommonMessage = "Process: $Param{ProcessEntityID} Activity: $Param{ActivityEntityID}"
        . " Transition: $Param{TransitionEntityID}"
        . " TransitionAction: $Param{TransitionActionEntityID} - ";

    # check for missing or wrong params
    my $Success = $Self->_CheckParams(
        %Param,
        CommonMessage => $CommonMessage,
    );
    return if !$Success;

    # override UserID if specified as a parameter in the TA config
    $Param{UserID} = $Self->_OverrideUserID(%Param);

    # special case for DyanmicField UserID, convert form DynamicField_UserID to UserID
    if ( defined $Param{Config}->{DynamicField_UserID} ) {
        $Param{Config}->{UserID} = $Param{Config}->{DynamicField_UserID};
        delete $Param{Config}->{DynamicField_UserID};
    }

    # use ticket attributes if needed
    $Self->_ReplaceTicketAttributes(%Param);
    $Self->_ReplaceAdditionalAttributes(%Param);

    my $Action = $Param{Config}->{Action} || 'Subscribe';

    # unsubscribe all
    if ( $Action eq 'UnsubscribeAll' ) {
        my $Success = $TicketObject->TicketWatchUnsubscribe(
            TicketID => $Param{Ticket}->{TicketID},
            AllUsers => 1,
            UserID   => $Param{UserID},
        );

        if ( !$Success ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Cannot unsubscribe all users from ticket with ID $Param{Ticket}->{TicketID}.",
            );
            return;
        }

        return 1;
    }

    my @UserLoginList = split /\s*,\s*/, $Param{Config}->{UserLogin} || '';
    USER:
    for my $UserLogin (@UserLoginList) {
        my %User = $UserObject->GetUserData(
            User  => $UserLogin,
            Valid => 1,
        );

        if ( !%User ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Cannot find user login '$UserLogin'.",
            );
            next USER;
        }

        $Self->_TicketWatch(
            Action      => $Action,
            TicketID    => $Param{Ticket}->{TicketID},
            WatchUserID => $User{UserID},
            UserID      => $Param{UserID},
        );
    }

    my @PostMasterSearchList = split /\s*,\s*/, $Param{Config}->{PostMasterSearch} || '';
    for my $PostMasterSearch (@PostMasterSearchList) {
        my %UserIDs = $UserObject->UserSearch(
            PostMasterSearch => $PostMasterSearch,
            Valid            => 1,
        );

        for my $UserID ( sort keys %UserIDs ) {
            $Self->_TicketWatch(
                Action      => $Action,
                TicketID    => $Param{Ticket}->{TicketID},
                WatchUserID => $UserID,
                UserID      => $Param{UserID},
            );
        }
    }

    my @UserIDList = split /\s*,\s*/, $Param{Config}->{UserIDs} || '';
    USER:
    for my $UserID (@UserIDList) {
        my %User = $UserObject->GetUserData(
            UserID => $UserID,
            Valid  => 1,
        );

        if ( !%User ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Cannot find user with ID $UserID.",
            );
            next USER;
        }

        $Self->_TicketWatch(
            Action      => $Action,
            TicketID    => $Param{Ticket}->{TicketID},
            WatchUserID => $User{UserID},
            UserID      => $Param{UserID},
        );
    }

    return 1;
}

=head2 _TicketWatch()

Enables or disables watching of a ticket.

    my $Success = $Object->_TicketWatch(
        Action      => 'Subscribe', # or 'Unsubscribe'
        TicketID    => 8754,
        WatchUserID => 564,
        UserID      => 23,
    );

Returns:

    my $Success = 1;

=cut

sub _TicketWatch {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Action TicketID WatchUserID UserID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Success;
    if ( $Param{Action} eq 'Subscribe' ) {
        $Success = $TicketObject->TicketWatchSubscribe(%Param);
    }
    else {
        $Success = $TicketObject->TicketWatchUnsubscribe(%Param);
    }

    if ( !$Success ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Cannot execute action '$Param{Action}' for user with ID '$Param{WatchUserID}' on ticket with ID '$Param{TicketID}'!",
        );
        return;
    }

    return 1;
}

1;
