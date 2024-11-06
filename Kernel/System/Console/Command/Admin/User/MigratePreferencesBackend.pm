# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::User::MigratePreferencesBackend;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::User',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description(
        'Migrates user preferences from source backend to destination backend.'
    );

    $Self->AddArgument(
        Name => 'source-backend',
        Description =>
            'Source backend (DB or DBJSON) whose preferences will be migrated to the destination backend. Preferences in source backend will be kept.',
        Required   => 1,
        ValueRegex => qr/\A(DB|DBJSON)\z/,
    );

    $Self->AddArgument(
        Name => 'destination-backend',
        Description =>
            'Destination backend (DB or DBSJON) for preferences of source backend. Preferences in the destination backend that are not present in the source backend will be kept.',
        Required   => 1,
        ValueRegex => qr/\A(DB|DBJSON)\z/,
    );

    $Self->AddOption(
        Name        => 'dry-run',
        Description => "Only show info about preferences to be migrated. Don't actually migrate them.",
        Required    => 0,
        HasValue    => 0,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');

    my $SourceBackend      = $Self->GetArgument('source-backend');
    my $DestinationBackend = $Self->GetArgument('destination-backend');
    my $DryRun             = $Self->GetOption('dry-run');

    if ( $SourceBackend eq $DestinationBackend ) {
        $Self->PrintError('Source and destination backend must be different.');
        return $Self->ExitCodeError();
    }

    $Self->Print(
        "<yellow>Migrating preferences from backend $SourceBackend to backend $DestinationBackend...</yellow>\n"
    );

    my %Users = $UserObject->UserList(
        Type  => 'Short',
        Valid => 0,
    );
    my @UserIDs = sort keys %Users;

    $Self->Print( "\t" . ( scalar @UserIDs ) . " users\n" );

    #
    # Fetch source backend preferences
    #
    $ConfigObject->Set(
        Key   => 'User::PreferencesModule',
        Value => "Kernel::System::User::Preferences::$SourceBackend",
    );

    my $SourceBackendPreferencesCount = 0;
    my %SourceBackendPreferencesByUserID;
    for my $UserID (@UserIDs) {
        $SourceBackendPreferencesByUserID{$UserID} = { $UserObject->GetPreferences( UserID => $UserID ) };
        $SourceBackendPreferencesCount += scalar keys %{ $SourceBackendPreferencesByUserID{$UserID} };
    }

    $Self->Print("\tSource backend contains $SourceBackendPreferencesCount preferences\n");

    #
    # Fetch destination backend preferences
    #
    $ConfigObject->Set(
        Key   => 'User::PreferencesModule',
        Value => "Kernel::System::User::Preferences::$DestinationBackend",
    );

    my $DestinationBackendPreferencesCount = 0;
    for my $UserID (@UserIDs) {
        my %DestinationBackendPreferences = $UserObject->GetPreferences( UserID => $UserID );
        $DestinationBackendPreferencesCount += scalar keys %DestinationBackendPreferences;
    }

    $Self->Print("\tDestination backend contains $DestinationBackendPreferencesCount preferences\n");

    if ($DryRun) {
        $Self->Print("<green>Dry run, migration not executed.</green>\n");
        return $Self->ExitCodeOk();
    }

    #
    # Write destination backend preferences
    #
    for my $UserID ( sort keys %SourceBackendPreferencesByUserID ) {
        my $SourceBackendPreferences = $SourceBackendPreferencesByUserID{$UserID};

        PREFERENCEKEY:
        for my $PreferenceKey ( sort keys %{$SourceBackendPreferences} ) {
            my $PreferenceValue = $SourceBackendPreferences->{$PreferenceKey};

            my $PreferenceSet = $UserObject->SetPreferences(
                Key    => $PreferenceKey,
                Value  => $PreferenceValue,
                UserID => $UserID,
            );
            next PREFERENCEKEY if $PreferenceSet;

            $Self->PrintError(
                "\tError setting preference $PreferenceKey to '$PreferenceValue' for user ID $UserID in destination backend.\n"
            );
        }

        $Self->Print( "\tMigrated preferences of user " . $Users{$UserID} . " (ID $UserID).\n" );
    }

    $Self->Print("<green>Migration done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
