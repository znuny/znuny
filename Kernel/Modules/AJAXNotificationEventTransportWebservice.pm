# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AJAXNotificationEventTransportWebservice;

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

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $WebserviceTransportObject
        = $Kernel::OM->Get('Kernel::System::Ticket::Event::NotificationEvent::Transport::Webservice');

    my %GetParam;

    GETPARAMNAME:
    for my $GetParamName (qw(WebserviceID)) {
        $GetParam{$GetParamName} = $ParamObject->GetParam( Param => $GetParamName );
    }

    my %Result;

    if (
        $Self->{Subaction} eq 'GetWebserviceInvokers'
        && $GetParam{WebserviceID}
        )
    {
        my $Invokers = $WebserviceTransportObject->GetWebserviceInvokers(
            WebserviceID => $GetParam{WebserviceID},
        );

        $Result{Data} = $Invokers;
    }

    my $JSONString = $LayoutObject->JSONEncode(
        Data => \%Result,
    );

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $JSONString,
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
