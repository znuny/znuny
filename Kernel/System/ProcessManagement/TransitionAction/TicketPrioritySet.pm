# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionAction::TicketPrioritySet;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::ProcessManagement::TransitionAction::Base);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Ticket',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::TicketPrioritySet - A Module to set the priority of a Ticket

=head1 DESCRIPTION

All TicketPrioritySet functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $TicketPrioritySetObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionAction::TicketPrioritySet');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

Runs TransitionAction TicketPrioritySet.

    my $Success = $TicketPrioritySetActionObject->Run(
        UserID                   => 123,

        # Ticket contains the result of TicketGet including dynamic fields
        Ticket                   => \%Ticket,       # required
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',

        # Config is the hash stored in a Process::TransitionAction's config key
        Config                   => {
            Priority   => '5 very high',
            # or
            PriorityID => '1',
            UserID     => 123,                      # optional, to override the UserID from the logged user

        }
    );

Returns:

    my $Success = 1; # 0

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # define a common message to output in case of any error
    my $CommonMessage = "Process: $Param{ProcessEntityID} Activity: $Param{ActivityEntityID}"
        . " Transition: $Param{TransitionEntityID}"
        . " TransitionAction: $Param{TransitionActionEntityID} - ";

    # Check for required parameters in ConfigHash
    if ( !defined $Param{Config}->{Priority} && !defined $Param{Config}->{PriorityID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => $CommonMessage . "No priority configured!",
        );
        return;
    }

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

    $Success = 0;
    if ( $Param{Config}->{Priority} && $Param{Config}->{Priority} ne $Param{Ticket}->{Priority} ) {
        $Success = $TicketObject->TicketPrioritySet(
            Priority => $Param{Config}->{Priority},
            TicketID => $Param{Ticket}->{TicketID},
            UserID   => $Param{UserID},
        );
    }
    elsif ( $Param{Config}->{PriorityID} && $Param{Config}->{PriorityID} ne $Param{Ticket}->{PriorityID} ) {
        $Success = $TicketObject->TicketPrioritySet(
            PriorityID => $Param{Config}->{PriorityID},
            TicketID   => $Param{Ticket}->{TicketID},
            UserID     => $Param{UserID},
        );
    }
    else {

        # data is the same as in ticket, nothing to do
        $Success = 1;
    }
    return 1 if $Success;

    $LogObject->Log(
        Priority => 'error',
        Message  => $CommonMessage
            . 'Ticket priority could not be updated for ticket with ID '
            . $Param{Ticket}->{TicketID} . '!',
    );

    return;
}

1;
