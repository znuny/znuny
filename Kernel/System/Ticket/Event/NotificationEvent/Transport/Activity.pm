# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::NotificationEvent::Transport::Activity;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

use parent qw(Kernel::System::Ticket::Event::NotificationEvent::Transport::Base);

our @ObjectDependencies = (
    'Kernel::System::Activity',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
);

=head1 NAME

Kernel::System::Ticket::Event::NotificationEvent::Transport::Activity - Web activity transport layer

=head1 PUBLIC INTERFACE

=head2 new()

create a notification transport object. Do not use it directly, instead use:

    my $TransportObject = $Kernel::OM->Get('Kernel::System::Ticket::Event::NotificationEvent::Transport::Activity');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub SendNotification {
    my ( $Self, %Param ) = @_;

    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $ActivityObject = $Kernel::OM->Get('Kernel::System::Activity');

    NEEDED:
    for my $Needed (qw(TicketID UserID Notification Recipient)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!",
        );

        return;
    }

    NEEDED:
    for my $Needed (qw(Notification Recipient)) {
        next NEEDED if ref $Param{$Needed} eq 'HASH';

        $LogObject->Log(
            Priority => 'error',
            Message  => "$Needed needs to be a hash!",
        );

        return;
    }

    # clean up event data
    $Self->{EventData} = undef;

    # get recipient data
    my %Recipient = %{ $Param{Recipient} };

    return if $Recipient{Type} eq 'Customer';
    return if !$Recipient{UserID};

    my %Notification = %{ $Param{Notification} };

    my $Type = 'Ticket';
    if ( $ActivityObject->{EventTypeMap} && $Param{Event} && $ActivityObject->{EventTypeMap}->{ $Param{Event} } ) {
        $Type = $ActivityObject->{EventTypeMap}->{ $Param{Event} };
    }

    my $Link = $ActivityObject->GetLink(
        TicketID => $Param{TicketID},
    );

    my $ActivitID = $ActivityObject->Add(
        Type     => $Type,
        Title    => $Notification{Subject},
        Text     => $Notification{Body},
        State    => 'new',
        Link     => $Link,
        CreateBy => 1,
        UserID   => $Recipient{UserID},
    );

    if ( !$ActivitID ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "'$Notification{Name}' notification could not be sent to agent '$Recipient{UserFullname}.",
        );
        return;
    }

    $LogObject->Log(
        Priority => 'info',
        Message => "Sent activity notification '$Notification{Name}' to '$Recipient{UserFullname}' ($Recipient{Type}).",
    );

    $Self->{EventData} = {
        Event => 'ActivityAdd',
        Data  => {
            TicketID => $Param{TicketID},
        },
        UserID => $Param{UserID},
    };

    return 1;
}

1;
