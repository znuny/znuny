# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Ticket::Event::TicketAllChildrenClosed;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::LinkObject',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::TicketAllChildrenClosed - A module to create an event after all children have been closed.

=head1 DESCRIPTION

All TicketAllChildrenClosed functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $TicketAllChildrenClosedObject = $Kernel::OM->Get('Kernel::System::Ticket::Event::TicketAllChildrenClosed');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

    Run Data

    my $Success = $TicketAllChildrenClosedObject->Run(
        Data    => {
            TicketID => TicketID,
        },
        Event   => $EventName,
        Config  => $Config,
        UserID  => $UserID,        
    )

    If all subtickets are closed of a Ticket then the Event 'TicketAllChildrenClosed' will be triggered.

    Returns:

    $Success = 1; # 0

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Data Event Config)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }
    for my $Needed (qw(TicketID)) {
        if ( !$Param{Data}->{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed in Data!"
            );
            return;
        }
    }

    # get ticket object
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $LinkObject   = $Kernel::OM->Get('Kernel::System::LinkObject');

    my %LinkedParents = $LinkObject->LinkKeyList(
        Object1   => 'Ticket',
        Key1      => $Param{Data}->{TicketID},
        Object2   => 'Ticket',
        State     => 'Valid',
        Type      => 'ParentChild',
        Direction => 'Source',
        UserID    => 1,
    );

    PARENTS:
    for my $ParentID (keys %LinkedParents) {
        my %LinkedChildren = $LinkObject->LinkKeyList(
            Object1   => 'Ticket',
            Key1      => $ParentID,
            Object2   => 'Ticket',
            State     => 'Valid',
            Type      => 'ParentChild',
            Direction => 'Target',
            UserID    => 1,
        );

        my $ChildrenClosed = 1;

        # process child tickets
        CHILDREN:
        for my $ChildTicketID (keys %LinkedChildren) {
            my %ChildTicket = $TicketObject->TicketGet(
                TicketID      => $ChildTicketID,
            );

            if ( %ChildTicket ) {
                # skip closed/removed/merged tickets
                if ( $ChildTicket{StateType} !~ m/^(?:closed|merged|removed)$/ ) {
                    $ChildrenClosed = 0;
                    last CHILDREN;
                }
            }
        }
    
        if ( $ChildrenClosed ) {
            $TicketObject->EventHandler(
                Event => 'TicketAllChildrenClosed',
                Data  => {
                    TicketID      => $ParentID,
                },
                UserID => $Self->{UserID} || 1,
                Transaction => 0,
            );
        }
    }


    return 1;
}

1;
