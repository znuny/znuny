# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::PreApplicationLastViews;

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    if ( !$Self->{RequestedURL} ) {
        $Self->{RequestedURL} = 'Action=';
    }

    my $ParamObject     = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LastViewsObject = $Kernel::OM->Get('Kernel::System::LastViews');

    my @IgnoreParams = (
        'ChallengeToken'
    );

    my $IsAJAXRequest = $ParamObject->IsAJAXRequest();
    return if $IsAJAXRequest;

    my $RequestMethod = $ParamObject->{Query}->request_method() // '';
    return if $RequestMethod ne 'GET';

    my %Request = %{$Self};

    my @ParamNames = $ParamObject->GetParamNames();
    PARAMNAME:
    for my $ParamName (@ParamNames) {
        my $IsIgnoreParam = grep { $ParamName eq $_ } @IgnoreParams;
        next PARAMNAME if $IsIgnoreParam;

        $Request{LastViewsParams}->{$ParamName} = $ParamObject->GetParam( Param => $ParamName );
    }

    $LastViewsObject->Update(
        SessionID => $Self->{SessionID},
        Request   => \%Request,
    );

    return;
}

1;
