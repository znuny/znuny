# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketMarkSeenUnseen;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::AuthSession',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
    'Kernel::System::User',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{Debug} = $Param{Debug} || 0;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $UserObject    = $Kernel::OM->Get('Kernel::System::User');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    my %GetParam;
    for my $Param (qw(TicketID ArticleID Subaction)) {
        $GetParam{$Param} = $ParamObject->GetParam( Param => $Param );
    }

    for my $RequiredParam (qw(TicketID Subaction)) {
        if ( !$GetParam{$RequiredParam} ) {
            $LayoutObject->FatalError(
                Message => "Need $RequiredParam!",
            );
        }
    }

    if ( !scalar grep { $GetParam{Subaction} eq $_ } qw( Seen Unseen ) ) {
        $LayoutObject->FatalError(
            Message => "Invalid value '$GetParam{Subaction}' for parameter 'Subaction'!",
        );
    }

    my @ArticleIDs = $ArticleObject->ArticleIndex(
        TicketID => $GetParam{TicketID},
    );

    if ( $GetParam{ArticleID} ) {
        if ( !scalar grep { $GetParam{ArticleID} eq $_ } @ArticleIDs ) {

            $LayoutObject->FatalError(
                Message => "Can't find ArticleID '$GetParam{ArticleID}' of ticket with TicketID '$GetParam{TicketID}'!",
            );
        }

        # reverse the ArticleIDs to get the correct index for the redirect URL
        @ArticleIDs = reverse @ArticleIDs;

        # remember article index for later replacement in redirect URL
        ( $GetParam{ArticleIndex} ) = grep { $ArticleIDs[$_] eq $GetParam{ArticleID} } 0 .. $#ArticleIDs;

        @ArticleIDs = ( $GetParam{ArticleID} );
    }

    # determine required function for subaction
    my $TicketActionFunction  = 'TicketFlagDelete';
    my $ArticleActionFunction = 'ArticleFlagDelete';

    if ( $GetParam{Subaction} eq 'Seen' ) {
        $TicketActionFunction  = 'TicketFlagSet';
        $ArticleActionFunction = 'ArticleFlagSet';
    }

    # perform action
    ARTICLE:
    for my $ArticleID ( sort @ArticleIDs ) {

        # article flag
        my $Success = $ArticleObject->$ArticleActionFunction(
            TicketID  => $GetParam{TicketID},
            ArticleID => $ArticleID,
            Key       => 'Seen',
            Value     => 1,                     # irrelevant in case of delete
            UserID    => $Self->{UserID},
        );

        next ARTICLE if $Success;

        $LayoutObject->FatalError(
            Message => "Error while setting article with ArticleID '$ArticleID' " .
                "of ticket with TicketID '$GetParam{TicketID}' as " .
                ( lc $GetParam{Subaction} ) .
                "!",
        );
    }

    # ticket flag
    my $Success = $TicketObject->$TicketActionFunction(
        TicketID => $GetParam{TicketID},
        Key      => 'Seen',
        Value    => 1,                     # irrelevant in case of delete
        UserID   => $Self->{UserID},
    );

    if ( !$Success ) {
        $LayoutObject->FatalError(
            Message => "Error while setting ticket with " .
                "TicketID '$GetParam{TicketID}' as " .
                ( lc $GetParam{Subaction} ) .
                "!",
        );
    }

    # get back to our last search result if the request came from a search view
    if ( $ParamObject->GetParam( Param => 'RedirectToSearch' ) ) {
        return $LayoutObject->Redirect(
            OP => 'Action=AgentTicketSearch;Subaction=Search;Profile=last-search;TakeLastSearch=1;',
        );
    }

    my %UserPreferences = $UserObject->GetPreferences(
        UserID => $Self->{UserID},
    );

    my $RedirectURL = $UserPreferences{ 'UserMarkTicket' . $GetParam{Subaction} . 'RedirectURL' } || '';

    # Fix for removed option "TicketZoom" for redirection. See issue #11.
    $RedirectURL = undef if $RedirectURL =~ m{TicketZoom};

    $RedirectURL ||= $ConfigObject->Get( 'MarkTicket' . $GetParam{Subaction} . 'RedirectDefaultURL' );
    $RedirectURL ||= 'LastScreenOverview';

    if ( $RedirectURL =~ m{LastScreenView|LastScreenOverview}i ) {
        my %SessionData = $SessionObject->GetSessionIDData(
            SessionID => $Self->{SessionID},
        );
        $RedirectURL = $SessionData{$RedirectURL};
    }

    REPLACE:
    for my $ReplaceParam (qw(TicketID ArticleID ArticleIndex)) {

        # make sure the placeholder gets replaced
        $GetParam{$ReplaceParam} ||= '';

        $RedirectURL =~ s{###$ReplaceParam###}{$GetParam{$ReplaceParam}}g;
    }

    return $LayoutObject->Redirect(
        OP => $RedirectURL,
    );
}

1;
