# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AgentAppointmentPluginSearch;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->ChallengeTokenCheck();

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get needed params
    my $Search    = $ParamObject->GetParam( Param => 'Term' ) || '';
    my $PluginKey = $ParamObject->GetParam( Param => 'PluginKey' );
    my $MaxResults = int( $ParamObject->GetParam( Param => 'MaxResults' ) || 20 );

    # workaround, all auto completion requests get posted by utf8 anyway
    # convert any to 8bit string if application is not running in utf8
    $Search = $Kernel::OM->Get('Kernel::System::Encode')->Convert2CharsetInternal(
        Text => $Search,
        From => 'utf-8',
    );

    my $ResultList;

    if ($PluginKey) {

        # get plugin object
        my $PluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

        $ResultList = $PluginObject->PluginFunction(
            PluginKey      => $PluginKey,
            PluginFunction => 'Search',
            PluginData     => {
                Search => $Search,
                UserID => $Self->{UserID},
            },
        );
    }

    # build data
    my @Data;
    my $MaxResultCount = $MaxResults;

    OBJECTID:
    for my $ObjectID (
        sort { $ResultList->{$a} cmp $ResultList->{$b} }
        keys %{$ResultList}
        )
    {

        my $ObjectData = $ResultList->{$ObjectID};
        push @Data, {
            Key   => $ObjectID,
            Value => ref $ObjectData ? $ObjectData->{Subject} : $ObjectData,
        };

        $MaxResultCount--;
        last OBJECTID if $MaxResultCount <= 0;
    }

    # build JSON output
    my $JSON = $LayoutObject->JSONEncode(
        Data => \@Data || {},
    );

    # send JSON response
    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $JSON || '',
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
