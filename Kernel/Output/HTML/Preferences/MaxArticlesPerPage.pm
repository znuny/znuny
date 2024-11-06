# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Preferences::MaxArticlesPerPage;

use strict;
use warnings;
use utf8;

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
    'Kernel::System::AuthSession',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    for my $Needed (qw(UserID UserObject ConfigItem)) {
        die "Got no $Needed!" if !$Self->{$Needed};
    }

    return $Self;
}

sub Param {
    my ( $Self, %Param ) = @_;

    my @Params;

    push @Params, {
        %Param,
        Name       => $Self->{ConfigItem}->{PrefKey},
        Raw        => 1,
        Block      => 'Input',
        SelectedID => $Param{UserData}->{ $Self->{ConfigItem}->{PrefKey} } // '',
    };

    return @Params;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');
    my $SessionObject  = $Kernel::OM->Get('Kernel::System::AuthSession');

    my $PrefKey                   = 'MaxArticlesPerPage';
    my $MaxArticlesPerPage        = $Param{GetParam}->{$PrefKey}->[0] // '';
    my $MaxArticlesPerPageIsValid = !length $MaxArticlesPerPage
        || (
        $MaxArticlesPerPage =~ m{\A\d+\z}
        && $MaxArticlesPerPage >= 1
        && $MaxArticlesPerPage <= 1000
        );

    if ( !$MaxArticlesPerPageIsValid ) {
        $Self->{Error}
            = $LanguageObject->Translate('Max. number of articles per page must be between 1 and 1000 or empty.');
        return;
    }

    if ( !$ConfigObject->Get('DemoSystem') ) {
        $Self->{UserObject}->SetPreferences(
            UserID => $Param{UserData}->{UserID},
            Key    => $PrefKey,
            Value  => $MaxArticlesPerPage,
        );
    }

    # Update session data when the preference is updated by the user himself.
    if ( $Param{UpdateSessionData} ) {
        $SessionObject->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => $PrefKey,
            Value     => $MaxArticlesPerPage,
        );
    }
    else {

        # Delete the session when the preference is updated by an admin user
        # to force a login with fresh session data for the affected user.
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
