# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::TicketZoom::Mentions;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub Run {
    my ( $Self, %Param ) = @_;

    my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $UserObject    = $Kernel::OM->Get('Kernel::System::User');

    my $Mentions = $MentionObject->GetTicketMentions(
        TicketID => $Param{Ticket}->{TicketID},
    ) // [];

    my %Users;

    MENTION:
    for my $Mention ( @{$Mentions} ) {
        next MENTION if $Users{ $Mention->{UserID} };

        my %User = $UserObject->GetUserData(
            UserID => $Mention->{UserID}
        );
        next MENTION if !%User;

        my $UserCanRemoveMention = $MentionObject->CanUserRemoveMention(
            TicketID        => $Param{Ticket}->{TicketID},
            MentionedUserID => $Mention->{UserID},
            UserID          => $Self->{UserID},              # user who wants to remove the mention
        );

        $Users{ $User{UserID} } = 1;
        $LayoutObject->Block(
            Name => "User",
            Data => {
                UserFullname => $User{UserFullname},
                UserEmail    => $User{UserEmail},
                UserID       => $User{UserID},
                Removable    => $UserCanRemoveMention,
            }
        );
    }

    # Hide widget when empty.
    return if !IsArrayRefWithData($Mentions);

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentTicketZoom/MentionsTable',
        Data         => {},
    );

    my $Config = $Param{Config};
    my %Rank;
    %Rank = ( Rank => $Config->{Rank} ) if exists $Config->{Rank} && defined $Config->{Rank};

    return {
        Output => $Output,
        %Rank,
    };
}

1;
