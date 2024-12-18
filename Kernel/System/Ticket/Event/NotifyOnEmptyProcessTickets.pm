# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Ticket::Event::NotifyOnEmptyProcessTickets;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

# use parent qw(Kernel::System::Ticket::Article::Backend::Base);
use parent qw(Kernel::System::EventHandler);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # This is a flag that will only be evaluated by unit test
    # scripts/test/Ticket/Event/NotifyOnEmptyProcessTickets.t
    $Self->{NotificationNewTicketEventTriggered} = 0;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');

    NEEDED:
    for my $Needed (qw( Data Event Config UserID )) {
        next NEEDED if $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    NEEDED:
    for my $Needed (qw( TicketID )) {
        next NEEDED if $Param{Data}->{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed in Data!"
        );
        return;
    }

    my %Ticket = $TicketObject->TicketGet(
        TicketID => $Param{Data}->{TicketID},
        UserID   => $Param{UserID},
    );
    return 1 if !%Ticket;

    my $IsProcessTicket = $TicketObject->TicketCheckForProcessType(
        TicketID => $Param{Data}->{TicketID},
    );
    return 1 if !$IsProcessTicket;

    # Exclude agents.
    my @SkipRecipients;
    if ( IsArrayRefWithData( $Param{ExcludeNotificationToUserID} ) ) {
        push @SkipRecipients, @{ $Param{ExcludeNotificationToUserID} };
    }

    # Exclude agents, but keep them in the 'To' field.
    if ( IsArrayRefWithData( $Param{ExcludeMuteNotificationToUserID} ) ) {
        push @SkipRecipients, @{ $Param{ExcludeMuteNotificationToUserID} };
    }

    my @ExtraRecipients;
    if ( IsArrayRefWithData( $Param{ForceNotificationToUserID} ) ) {
        push @ExtraRecipients, @{ $Param{ForceNotificationToUserID} };
    }

    # Event 'NotificationNewTicket' will be triggered if the process ticket
    # has no articles at all (new ticket).
    my @ArticleIDs = $ArticleObject->ArticleIndex(
        TicketID => $Param{Data}->{TicketID},
    );
    return 1 if @ArticleIDs;

    $Self->EventHandlerInit(
        Config => 'Ticket::EventModulePost',
    );

    $Self->EventHandler(
        Event       => 'NotificationNewTicket',
        UserID      => $Param{UserID},
        Transaction => 1,
        Data        => {
            TicketID              => $Ticket{TicketID},
            Queue                 => $Ticket{Queue},
            SenderTypeID          => 1,
            SkipRecipients        => \@SkipRecipients,
            IsVisibleForCustomer  => 1,
            Recipients            => \@ExtraRecipients,
            CustomerMessageParams => {},
        },
    );

    $Self->{NotificationNewTicketEventTriggered} = 1;

    return 1;
}

1;
