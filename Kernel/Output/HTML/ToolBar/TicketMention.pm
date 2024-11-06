# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ToolBar::TicketMention;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;
use utf8;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Mention'
);

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    NEEDED:
    for my $Needed (qw(Config)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    return if !$ConfigObject->Get('Frontend::Module')->{AgentTicketMentionView};

    my %AdditionalParams;

    my $Mentions = $MentionObject->GetUserMentions(
        UserID => $Self->{UserID},
    ) // [];

    my $MentionsCount;
    my $NewMentionsCount;

    if ( IsArrayRefWithData($Mentions) ) {

        # set mention count of all mentions
        $MentionsCount = @{$Mentions};

        my @MentionedTicketIDs = map { $_->{TicketID} } @{$Mentions};

        # get mention count of unseen mentions
        $NewMentionsCount = $TicketObject->TicketSearch(
            Result           => 'COUNT',
            TicketID         => \@MentionedTicketIDs,
            UserID           => 1,
            TicketFlagUserID => $Self->{UserID},
            TicketFlag       => {
                MentionSeen => 0,
            }
        );
    }

    my $MentionsConfig = $ConfigObject->Get('Mentions') // {};

    if ( $MentionsConfig->{ToolbarCount} ) {
        $AdditionalParams{Mentions}->{Count}    = $MentionsCount;
        $AdditionalParams{NewMentions}->{Count} = $NewMentionsCount;
    }

    my $Icon = $Param{Config}->{Icon};

    my $URL      = $LayoutObject->{Baselink};
    my $Priority = $Param{Config}->{Priority};

    my $MentionLabel = $AdditionalParams{Mentions}->{Count} ? Translatable('Total mentions') : Translatable('Mentions');
    my $NewMentionLabel
        = $AdditionalParams{NewMentions}->{Count} ? Translatable('Total new mentions') : Translatable('New mentions');

    my %Return;
    if ($MentionsCount) {
        $Return{ $Priority++ } = {
            %{ $AdditionalParams{Mentions} },
            Block       => $Param{Config}->{Block} || 'ToolBarItem',
            Description => $MentionLabel,
            Class       => $Param{Config}->{CssClass},
            Icon        => $Icon,
            Link        => $URL . 'Action=AgentTicketMentionView',
            AccessKey   => $Param{Config}->{AccessKey} || '',
        };
    }
    if ($NewMentionsCount) {
        $Return{ $Priority++ } = {
            %{ $AdditionalParams{NewMentions} },
            Block       => $Param{Config}->{Block} || 'ToolBarItem',
            Description => $NewMentionLabel,
            Class       => $Param{Config}->{CssClassNew},
            Icon        => $Icon,
            Link        => $URL . 'Action=AgentTicketMentionView;Filter=New',
            AccessKey   => $Param{Config}->{AccessKey} || '',
        };
    }

    return %Return;
}

1;
