# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::CustomerAccept;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    $Self->{InfoKey}  = $ConfigObject->Get('CustomerPanel::InfoKey')  || 'CustomerAccept1';
    $Self->{InfoFile} = $ConfigObject->Get('CustomerPanel::InfoFile') || 'CustomerAccept';

    return $Self;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( !$Self->{RequestedURL} ) {
        $Self->{RequestedURL} = 'Action=';
    }

    # redirect if no primary group is selected
    if ( !$Self->{ $Self->{InfoKey} } && $Self->{Action} ne 'CustomerAccept' ) {

        # remove requested url from session storage
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'UserRequestedURL',
            Value     => $Self->{RequestedURL},
        );
        return $LayoutObject->Redirect( OP => 'Action=CustomerAccept' );
    }
    else {
        return;
    }
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output;
    if ( !$Self->{RequestedURL} ) {
        $Self->{RequestedURL} = 'Action=';
    }

    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $SessionObject      = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    my $Accept = $ParamObject->GetParam( Param => 'Accept' ) || '';

    if ( $Self->{ $Self->{InfoKey} } ) {

        # remove requested url from session storage
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'UserRequestedURL',
            Value     => '',
        );

        # redirect
        return $LayoutObject->Redirect( OP => "$Self->{UserRequestedURL}" );
    }
    elsif ($Accept) {

        # set session
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => $Self->{InfoKey},
            Value     => 1,
        );

        # set preferences
        $CustomerUserObject->SetPreferences(
            UserID => $Self->{UserID},
            Key    => $Self->{InfoKey},
            Value  => 1,
        );

        # remove requested url from session storage
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'UserRequestedURL',
            Value     => '',
        );

        # redirect
        return $LayoutObject->Redirect( OP => "$Self->{RequestedURL}" );
    }
    else {

        # show info
        $Output = $LayoutObject->CustomerHeader();
        $Output .= $LayoutObject->Output(
            TemplateFile => $Self->{InfoFile},
            Data         => \%Param
        );
        $Output .= $LayoutObject->CustomerFooter();
        return $Output;
    }
}

1;
