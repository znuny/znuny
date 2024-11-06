# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionAction::DynamicFieldPendingTimeSet;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::ProcessManagement::TransitionAction::Base);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::DynamicFieldPendingTimeSet - A module to set pending time based on dynamic field an optional configurable offset.

=head1 SYNOPSIS

All DynamicFieldPendingTimeSet functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    my $DynamicFieldPendingTimeSetObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionAction::DynamicFieldPendingTimeSet');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

Runs TransitionAction DynamicFieldPendingTimeSet.

    my $Success = $DynamicFieldPendingTimeSetObject->Run(
        UserID                   => 123,
        Ticket                   => \%Ticket,       # required
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',
        Config                   => {
            DynamicField => 'test',
            Offset       => '1d 5h 12m 500s',
            UserID       => 123,                    # optional, to override the UserID from the logged user
        }
    );

Returns:

    my $Success = 1;

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');

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

    # use ticket attributes if needed
    $Self->_ReplaceTicketAttributes(%Param);
    $Self->_ReplaceAdditionalAttributes(%Param);

    my %Ticket       = %{ $Param{Ticket} || {} };
    my $TicketID     = $Param{Ticket}->{TicketID};
    my $Offset       = $Param{Config}->{Offset};
    my $DynamicField = $Param{Config}->{DynamicField};
    my $State        = $Param{Config}->{State};

    return if !$TicketID;

    my $DynamicFieldValue = $Ticket{ 'DynamicField_' . $DynamicField };

    # only do transition action for filled dynamic field
    return if !$DynamicFieldValue;

    my $DynamicFieldValueSystemTime = $TimeObject->TimeStamp2SystemTime(
        String => $DynamicFieldValue,
    );

    my $SystemTime = $TimeObject->SystemTime();

    # calculate offset based on config
    my $OffsetSeconds = $Self->_Offset2Seconds(
        Offset => $Offset,
    );

    # get new pending time based on dynamic field value + offset
    my $NewPendingTimeStamp = $TimeObject->SystemTime2TimeStamp(
        SystemTime => $DynamicFieldValueSystemTime + $OffsetSeconds,
    );

    if ($State) {
        my $Success = $TicketObject->TicketStateSet(
            State    => $State,
            TicketID => $TicketID,
            UserID   => $Param{UserID},
        );

        if ( !$Success ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't set state $State for ticket with ID $TicketID!",
            );
        }
    }

    # set pending time
    my $TicketPendingTimeSetSuccess = $TicketObject->TicketPendingTimeSet(
        String   => $NewPendingTimeStamp,
        TicketID => $TicketID,
        UserID   => $Param{UserID},
    );

    return 1 if $TicketPendingTimeSetSuccess;

    $LogObject->Log(
        Priority => 'error',
        Message  => "Can't set pending time for ticket with ID $TicketID!",
    );

    return;
}

=head2 _Offset2Seconds()

Converts the configurable offset to seconds.

    my $OffsetSeconds = $DynamicFieldPendingTimeSetObject->_Offset2Seconds(
        Offset => '1d',
    );

Returns:

    my $OffsetSeconds = 86400;

=cut

sub _Offset2Seconds {
    my ( $Self, %Param ) = @_;

    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    my $OffsetSeconds = 0;
    my $Offset        = $Param{Offset};

    return $OffsetSeconds if !$Offset;
    return $OffsetSeconds if $Offset !~ m{^(?:(\d+)d[ ]*)?(?:(\d+)h[ ]*)?(?:(\d+)m[ ]*)?(?:(\d+)s[ ]*)?$}xmsi;

    my $Days    = $1 // 0;
    my $Hours   = $2 // 0;
    my $Minutes = $3 // 0;
    my $Seconds = $4 // 0;

    $OffsetSeconds = ( $Days * 24 * 60 * 60 ) + ( $Hours * 60 * 60 ) + ( $Minutes * 60 ) + $Seconds;

    return $OffsetSeconds;
}

1;
