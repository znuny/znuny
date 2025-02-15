# --
# Copyright (C) 2016-2021 Informatyka Boguslawski sp. z o.o. sp.k., http://www.ib.pl/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::PostMaster::FollowUpCheck::MessageID;
## nofilter(TidyAll::Plugin::Znuny::Legal::UpdateZnunyCopyright)

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Ticket::Article',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {};
    bless( $Self, $Type );

    # Get communication log object.
    $Self->{CommunicationLogObject} = $Param{CommunicationLogObject} || die "Got no CommunicationLogObject!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->{CommunicationLogObject}->ObjectLog(
        ObjectLogType => 'Message',
        Priority      => 'Debug',
        Key           => 'Kernel::System::PostMaster::FollowUpCheck::MessageID',
        Value         => 'Searching for existing TicketID using Message-ID header.',
    );

    # Checking mandatory configuration options.
    for my $Option (qw(MaxAge MaxArticles)) {
        if ( !defined $Param{JobConfig}->{$Option} || !$Param{JobConfig}->{$Option} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Missing configuration for $Option for postmaster MessageID follow-up check module.",
            );
            return;
        }
    }

    # Do ticket lookup using Message-ID; for details see
    # PostMaster::CheckFollowUpModule###0600-MessageID description in SysConfig.
    if ( $Param{GetParam}->{'Message-ID'} ) {
        my $ArticleBackendObject = $Kernel::OM->Get('Kernel::System::Ticket::Article')->BackendForChannel(
            ChannelName => 'Email',
        );

        # Get ticket id containing article(s) with given message id.
        my $TicketID = $ArticleBackendObject->ArticleGetTicketIDByMessageID(
            MessageID              => $Param{GetParam}->{'Message-ID'},
            MaxAge                 => $Param{JobConfig}->{MaxAge},
            MaxArticles            => $Param{JobConfig}->{MaxArticles},
            Quiet                  => $Param{Quiet},
            CommunicationLogObject => $Self->{CommunicationLogObject},
        );

        if ($TicketID) {
            $Self->{CommunicationLogObject}->ObjectLog(
                ObjectLogType => 'Message',
                Priority      => 'Debug',
                Key           => 'Kernel::System::PostMaster::FollowUpCheck::MessageID',
                Value         => "Found valid TicketID '$TicketID' using email Message-ID.",
            );

            return $TicketID;
        }
    }

    return;
}

1;
