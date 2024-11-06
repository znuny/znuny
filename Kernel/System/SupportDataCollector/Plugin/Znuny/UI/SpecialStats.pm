# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Znuny::UI::SpecialStats;

use strict;
use warnings;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::System::User',
);

sub GetDisplayPath {
    return Translatable('Znuny') . '/' . Translatable('UI - Special Statistics');
}

sub Run {
    my $Self = shift;

    my %PreferenceMap = (
        UserNavBarItemsOrder         => Translatable('Agents using custom main menu ordering'),
        AdminNavigationBarFavourites => Translatable('Agents using favourites for the admin overview'),
    );

    for my $Preference ( sort keys %PreferenceMap ) {

        my %FoundPreferences = $Kernel::OM->Get('Kernel::System::User')->SearchPreferences(
            Key => $Preference,
        );

        $Self->AddResultInformation(
            Identifier => $Preference,
            Label      => $PreferenceMap{$Preference},
            Value      => scalar keys %FoundPreferences,
        );
    }

    return $Self->GetResults();
}

1;
