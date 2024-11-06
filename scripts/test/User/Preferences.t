# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $UserObject   = $Kernel::OM->Get('Kernel::System::User');

my ( $TestUserLogin, $TestUserID ) = $HelperObject->TestUserCreate();

my @PreferencesToSet = (
    {
        'UserUnitTestPref1' => 'UserPref1InitialValue',
        'UserUnitTestPref2' => 'UserPref2InitialValue',
    },
    {
        'UserUnitTestPref1' => 'UserPref1UpdatedValue',
        'UserUnitTestPref2' => 'UserPref2UpdatedValue',
        'UserUnitTestPref3' => 'UserPref3InitialValue',
    },
);

for my $PreferencesToSet (@PreferencesToSet) {
    for my $PreferencesBackendModule (
        'Kernel::System::User::Preferences::DBJSON'
        , # IMPORTANT: Test DBJSON first, so that the DB backend keys are unknown at this time and SearchPreferences cannot find them
        'Kernel::System::User::Preferences::DB',
        )
    {
        $ConfigObject->Set(
            Key   => 'User::PreferencesModule',
            Value => $PreferencesBackendModule,
        );

        #
        # SetPreferences
        #
        for my $PreferenceKey ( sort keys %{$PreferencesToSet} ) {
            my $PreferenceValue = $PreferencesToSet->{$PreferenceKey};

            my $PreferenceSet = $UserObject->SetPreferences(
                Key    => $PreferenceKey,
                Value  => $PreferenceValue,
                UserID => $TestUserID,
            );

            $Self->True(
                scalar $PreferenceSet,
                "$PreferencesBackendModule: SetPreferences() must be successful for key $PreferenceKey.",
            );

        }

        #
        # GetPreferences
        #
        my %Preferences = $UserObject->GetPreferences(
            UserID => $TestUserID,
        );

        for my $PreferenceKey ( sort keys %{$PreferencesToSet} ) {
            my $PreferenceValue = $PreferencesToSet->{$PreferenceKey};

            $Self->Is(
                scalar $Preferences{$PreferenceKey},
                scalar $PreferenceValue,
                "$PreferencesBackendModule: GetPreference() must return expected value for key $PreferenceKey.",
            );
        }

        #
        # GetPreferences via GetUserData
        #
        my %User = $UserObject->GetUserData(
            User => $TestUserLogin,
        );

        for my $PreferenceKey ( sort keys %{$PreferencesToSet} ) {
            my $PreferenceValue = $PreferencesToSet->{$PreferenceKey};

            $Self->Is(
                scalar $User{$PreferenceKey},
                scalar $PreferenceValue,
                "$PreferencesBackendModule: GetUserData() must return expected value for preference key $PreferenceKey.",
            );
        }

        #
        # SearchPreferences
        #
        for my $PreferenceKey ( sort keys %{$PreferencesToSet} ) {
            my $PreferenceValue = $PreferencesToSet->{$PreferenceKey};

            my %SearchPreferencesResult = $UserObject->SearchPreferences(
                Key => $PreferenceKey,
            );

            $Self->IsDeeply(
                \%SearchPreferencesResult,
                {
                    $TestUserID => $PreferenceValue,
                },
                "$PreferencesBackendModule: SearchPreferences must return expected result for key $PreferenceKey.",
            );

            %SearchPreferencesResult = $UserObject->SearchPreferences(
                Key => $PreferenceKey . 'NONEXISTING',
            );

            $Self->False(
                scalar %SearchPreferencesResult,
                "$PreferencesBackendModule: SearchPreferences must return empty hash for key ${PreferenceKey}NONEXISTING.",
            );

            %SearchPreferencesResult = $UserObject->SearchPreferences(
                Key   => $PreferenceKey,
                Value => $PreferenceValue,
            );

            $Self->IsDeeply(
                \%SearchPreferencesResult,
                {
                    $TestUserID => $PreferenceValue,
                },
                "$PreferencesBackendModule: SearchPreferences must return expected result for key $PreferenceKey and value $PreferenceValue.",
            );

            %SearchPreferencesResult = $UserObject->SearchPreferences(
                Key   => $PreferenceKey,
                Value => $PreferenceValue . 'NONEXISTING',
            );

            $Self->False(
                scalar %SearchPreferencesResult,
                "$PreferencesBackendModule: SearchPreferences must return empty hash for key $PreferenceKey and non-existing value ${PreferenceValue}NONEXISTING.",
            );

        }
    }
}

1;
