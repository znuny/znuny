# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::Modules::AJAXRichTextAutocompletion;

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

    my $JSONObject           = $Kernel::OM->Get('Kernel::System::JSON');
    my $LayoutObject         = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject          = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $AutocompletionObject = $Kernel::OM->Get('Kernel::System::Autocompletion');

    my $Subaction = $ParamObject->GetParam( Param => 'Subaction' );

    my $ResponseData;

    # Restrict access to autocompletion to agent interface.
    my $SessionSource = $LayoutObject->{SessionSource} // '';
    if ( $SessionSource eq 'AgentInterface' ) {
        if ( $Subaction eq 'GetAutocompletionSettings' ) {
            $ResponseData = $AutocompletionObject->GetAutocompletionSettings();
        }
        elsif ( $Subaction eq 'GetData' ) {
            my $Trigger      = $ParamObject->GetParam( Param => 'Trigger' )      // '';
            my $SearchString = $ParamObject->GetParam( Param => 'SearchString' ) // '';

            # Fetch additional params.
            my @AdditionalParamNames = grep { $_ =~ m{\AAdditionalParams\[.*\]\z} } $ParamObject->GetParamNames();
            my %AdditionalParams;
            for my $AdditionalParamName (@AdditionalParamNames) {
                ( my $Key = $AdditionalParamName ) =~ s{\AAdditionalParams\[(.*)\]\z}{$1};
                my $Value = $ParamObject->GetParam( Param => $AdditionalParamName );

                $AdditionalParams{$Key} = $Value;
            }

            $ResponseData = $AutocompletionObject->GetData(
                Trigger          => $Trigger,
                SearchString     => $SearchString,
                UserID           => $Self->{UserID},
                AdditionalParams => \%AdditionalParams,
            );
        }
    }

    $ResponseData //= [];

    my $JSONEncodedResponseData = $JSONObject->Encode( Data => $ResponseData );

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $JSONEncodedResponseData,
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
