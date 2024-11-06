# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Preferences::PopupProfile;

use strict;
use warnings;
use utf8;

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::AuthSession',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    for my $Needed (qw(UserID ConfigItem)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    return $Self;
}

sub Param {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $PopupProfiles = $ConfigObject->Get('Frontend::PopupProfiles');

    my %PopupProfiles;
    for my $Key ( sort keys %{$PopupProfiles} ) {
        %PopupProfiles = ( %PopupProfiles, %{ $PopupProfiles->{$Key} } );
    }

    my %UserPopupProfiles;
    NEEDED:
    for my $Needed (qw(Left Top Width Height)) {
        $UserPopupProfiles{ $Self->{ConfigItem}->{Key} . $Needed }
            = $Param{UserData}->{ $Self->{ConfigItem}->{Key} . $Needed } || $PopupProfiles{Default}->{$Needed};
    }

    my @Params;
    push(
        @Params,
        {
            %UserPopupProfiles,
            Block => 'PopupProfile',
        },
    );

    return @Params;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    NEEDED:
    for my $Key (qw(Left Top Width Height)) {
        $Param{GetParam}->{ $Self->{ConfigItem}->{Key} . $Key }
            = $ParamObject->GetParam( Param => $Self->{ConfigItem}->{Key} . $Key ) || '';
    }

    for my $Key ( sort keys %{ $Param{GetParam} } ) {
        my $Value = $Param{GetParam}->{$Key};

        # pref update db
        if ( !$ConfigObject->Get('DemoSystem') ) {
            $Self->{UserObject}->SetPreferences(
                UserID => $Param{UserData}->{UserID},
                Key    => $Key,
                Value  => $Value,
            );
        }

        # Update session data when the preference is updated by the user himself.
        if ( $Param{UpdateSessionData} ) {
            $SessionObject->UpdateSessionID(
                SessionID => $Self->{SessionID},
                Key       => $Key,
                Value     => $Value,
            );
        }
    }

    # Delete the session when the preference is updated by an admin user
    # to force a login with fresh session data for the affected user.
    if ( !$Param{UpdateSessionData} ) {
        $SessionObject->RemoveSessionByUser(
            UserLogin => $Param{UserData}->{UserLogin},
        );
    }

    $Self->{Message} = Translatable('Preferences updated successfully!');
    return 1;
}

sub Error {
    my ( $Self, %Param ) = @_;

    return $Self->{Error} || '';
}

sub Message {
    my ( $Self, %Param ) = @_;

    return $Self->{Message} || '';
}

1;
