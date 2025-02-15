# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::PostMaster::FollowUpCheck::References;

use strict;
use warnings;

use Kernel::System::ObjectManager;    # prevent used once warning

our @ObjectDependencies = (
    'Kernel::System::Ticket::Article',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    $Self->{ParserObject} = $Param{ParserObject} || die "Got no ParserObject";

    # Get communication log object.
    $Self->{CommunicationLogObject} = $Param{CommunicationLogObject} || die "Got no CommunicationLogObject!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->{CommunicationLogObject}->ObjectLog(
        ObjectLogType => 'Message',
        Priority      => 'Debug',
        Key           => 'Kernel::System::PostMaster::FollowUpCheck::References',
        Value         => 'Searching for TicketID in email references.',
    );

    my @References = $Self->{ParserObject}->GetReferences();
    return if !@References;

    my $ArticleBackendObject = $Kernel::OM->Get('Kernel::System::Ticket::Article')->BackendForChannel(
        ChannelName => 'Email',
    );

    for my $Reference (@References) {

        # Get ticket id containing article(s) with given message id.
        my $TicketID = $ArticleBackendObject->ArticleGetTicketIDByMessageID(
            MessageID              => "<$Reference>",
            Quiet                  => $Param{Quiet},
            CommunicationLogObject => $Self->{CommunicationLogObject},
        );

        if ($TicketID) {
            $Self->{CommunicationLogObject}->ObjectLog(
                ObjectLogType => 'Message',
                Priority      => 'Debug',
                Key           => 'Kernel::System::PostMaster::FollowUpCheck::References',
                Value         => "Found valid TicketID '$TicketID' using email references.",
            );

            return $TicketID;
        }
    }

    return;
}

1;
