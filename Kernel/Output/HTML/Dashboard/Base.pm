# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Dashboard::Base;

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

=head1 SYNOPSIS

Base class for dashboard.

=head1 PUBLIC INTERFACE

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    for my $Needed (qw(Config Name UserID)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    return $Self;
}

=head2 Preferences()

Returns module preferences.

    my @Params = $Object->Preferences();

Returns:

    my @Params = (
        {
            Desc  => Translatable('Shown'),
            Name  => $Self->{PrefKeyShown},
            Block => 'Option',
            Data  => {
                5  => ' 5',
                10 => '10',
                15 => '15',
                20 => '20',
                25 => '25',
            },
            SelectedID  => $Self->{PageShown},
            Translation => 0,
        },
        {
            Desc  => Translatable('Refresh (minutes)'),
            Name  => $Self->{PrefKeyRefresh},
            Block => 'Option',
            Data  => {
                0  => Translatable('off'),
                1  => '1',
                2  => '2',
                5  => '5',
                7  => '7',
                10 => '10',
                15 => '15',
            },
            SelectedID  => $Self->{PageRefresh},
            Translation => 1,
        },
    );

=cut

sub Preferences {
    my ( $Self, %Param ) = @_;

    return;
}

=head2 Config()

Returns module config.

    my %Config = $Object->Config();

Returns:

    my %Config = (
        %{ $Self->{Config} },
        CacheKey => undef,
        CacheTTL => undef,
    );

=cut

sub Config {
    my ( $Self, %Param ) = @_;

    return (
        %{ $Self->{Config} },

        # caching not needed
        CacheKey => undef,
        CacheTTL => undef,
    );
}

=head2 Header()

Returns additional header content of dashboard (HTML).

    my $Header = $Object->Header();

Returns:

    my $Header = 'HTML';

=cut

sub Header {
    my ( $Self, %Param ) = @_;
    my $Content = '';
    return $Content;
}

=head2 Run()

Returns content of dashboard (HTML).

    my $Content = $Object->Run();

Returns:

    my $Content = 'HTML';

=cut

sub Run {
    my ( $Self, %Param ) = @_;
    my $Content = '';
    return $Content;
}

1;
