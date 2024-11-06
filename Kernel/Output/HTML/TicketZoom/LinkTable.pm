# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::TicketZoom::LinkTable;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LinkObject   = $Kernel::OM->Get('Kernel::System::LinkObject');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # get linked objects
    my $LinkListWithData = $LinkObject->LinkListWithData(
        Object           => 'Ticket',
        Key              => $Param{Ticket}->{TicketID},
        State            => 'Valid',
        UserID           => $Self->{UserID},
        ObjectParameters => {
            Ticket => {
                IgnoreLinkedTicketStateTypes => 1,
            },
        },
    );

    # get link table view mode
    my $LinkTableViewMode = $ConfigObject->Get('LinkObject::ViewMode');

    # create the link table
    my $LinkTableStrg = $LayoutObject->LinkObjectTableCreate(
        LinkListWithData => $LinkListWithData,
        ViewMode         => $LinkTableViewMode,
        Object           => 'Ticket',
        Key              => $Param{Ticket}->{TicketID},
    );
    return if !$LinkTableStrg;

    my $Location = '';

    # output the simple link table
    if ( $LinkTableViewMode eq 'Simple' ) {
        $LayoutObject->Block(
            Name => 'LinkTableSimple',
            Data => {
                LinkTableStrg => $LinkTableStrg,
            },
        );
        $Location = 'Sidebar';
    }

    # output the complex link table
    if ( $LinkTableViewMode eq 'Complex' ) {
        $LayoutObject->Block(
            Name => 'LinkTableComplex',
            Data => {
                LinkTableStrg => $LinkTableStrg,
            },
        );
        $Location = 'Main';
    }

    # Hide empty "linked elements" widget when nothing is to show.
    my $None = $LayoutObject->{LanguageObject}->Translate('none');
    ( my $LinkTableCheck = $LinkTableStrg ) =~ s{\s}{}g;
    return if $LinkTableCheck eq $None;

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentTicketZoom/LinkTable',
        Data         => {},
    );

    my $Config = $Param{Config};
    my $Rank   = '0300';
    $Rank = $Config->{Rank} if exists $Config->{Rank} && defined $Config->{Rank};

    return {
        Location => $Location,
        Output   => $Output,
        Rank     => $Rank,
    };
}

1;
