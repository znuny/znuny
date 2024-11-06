# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::Preferences::Theme;

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

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    for my $Needed (qw(UserID ConfigItem)) {
        $Self->{$Needed} = $Param{$Needed} || die "Got no $Needed!";
    }

    return $Self;
}

sub Param {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    my $PossibleThemesRef = $ConfigObject->Get('Frontend::Themes')
        || {};
    my %PossibleThemes = %{$PossibleThemesRef};
    my $Home           = $ConfigObject->Get('Home');

    my %ActiveThemes;

    # prepare the list of active themes
    for my $PossibleTheme ( sort keys %PossibleThemes ) {
        if ( $PossibleThemes{$PossibleTheme} == 1 )
        {
            # only add a theme if it is set to 1 in sysconfig
            my $ThemeDir = $Home . "/Kernel/Output/HTML/Templates/" . $PossibleTheme;
            if ( -d $ThemeDir ) {

                # .. and if the theme dir exists
                $ActiveThemes{$PossibleTheme} = $PossibleTheme;
            }
        }
    }

    # only show the theme preference if there are two or more themes to choose from
    return if scalar keys %ActiveThemes < 2;

    my @Params;
    push(
        @Params,
        {
            %Param,
            Name       => $Self->{ConfigItem}->{PrefKey},
            Data       => \%ActiveThemes,
            HTMLQuote  => 0,
            SelectedID => $ParamObject->GetParam( Param => 'UserTheme' )
                || $Param{UserData}->{UserTheme}
                || $ConfigObject->Get('DefaultTheme'),
            Block => 'Option',
            Max   => 100,
        },
    );
    return @Params;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    for my $Key ( sort keys %{ $Param{GetParam} } ) {
        my @Array = @{ $Param{GetParam}->{$Key} };
        for my $Value (@Array) {

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
