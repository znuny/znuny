# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::User::Preferences::DBJSON;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::JSON',
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # Preferences table config
    $Self->{PreferencesTable}       = $ConfigObject->Get('PreferencesTable')       || 'user_preferences';
    $Self->{PreferencesTableKey}    = $ConfigObject->Get('PreferencesTableKey')    || 'preferences_key';
    $Self->{PreferencesTableValue}  = $ConfigObject->Get('PreferencesTableValue')  || 'preferences_value';
    $Self->{PreferencesTableUserID} = $ConfigObject->Get('PreferencesTableUserID') || 'user_id';

    $Self->{PreferencesTableKeyDBJSONPreferences} = 'DBJSONPreferences';

    # Cache config
    $Self->{CacheType}      = 'User';
    $Self->{CacheTTL}       = 60 * 60 * 24 * 20;
    $Self->{CacheKeyPrefix} = 'UserPreferencesDBJSON'
        . $Self->{PreferencesTable}
        . $Self->{PreferencesTableKey}
        . $Self->{PreferencesTableValue}
        . $Self->{PreferencesTableUserID};

    return $Self;
}

sub SetPreferences {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
    my $JSONObject  = $Kernel::OM->Get('Kernel::System::JSON');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(UserID Key)) {
        next NEEDED if IsStringWithData( $Param{$Needed} );

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    my %Preferences = $Self->GetPreferences( UserID => $Param{UserID} );

    my $Value = $Param{Value} // '';
    $Preferences{ $Param{Key} } = $Value;

    my $DBJSONPreferencesString = $JSONObject->Encode(
        Data => \%Preferences,
    );
    return if !IsStringWithData($DBJSONPreferencesString);

    return if !$DBObject->Do(
        SQL => "
            DELETE FROM $Self->{PreferencesTable}
            WHERE       $Self->{PreferencesTableUserID} = ?
                        AND $Self->{PreferencesTableKey} = ?
        ",
        Bind => [
            \$Param{UserID},
            \$Self->{PreferencesTableKeyDBJSONPreferences},
        ],
    );

    return if !$DBObject->Do(
        SQL => "
            INSERT INTO $Self->{PreferencesTable}
                        ($Self->{PreferencesTableUserID}, $Self->{PreferencesTableKey}, $Self->{PreferencesTableValue})
                        VALUES (?, ?, ?)
        ",
        Bind => [
            \$Param{UserID},
            \$Self->{PreferencesTableKeyDBJSONPreferences},
            \$DBJSONPreferencesString,
        ],
    );

    my $CacheKey = $Self->{CacheKeyPrefix} . $Param{UserID};

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Preferences,
    );

    return 1;
}

sub GetPreferences {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
    my $JSONObject  = $Kernel::OM->Get('Kernel::System::JSON');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(UserID)) {
        next NEEDED if IsStringWithData( $Param{$Needed} );

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    my $CacheKey = $Self->{CacheKeyPrefix} . $Param{UserID};

    my $CachedData = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return %{$CachedData} if ref $CachedData eq 'HASH';

    return if !$DBObject->Prepare(
        SQL => "
            SELECT $Self->{PreferencesTableValue}
            FROM   $Self->{PreferencesTable}
            WHERE  $Self->{PreferencesTableUserID} = ?
                   AND $Self->{PreferencesTableKey} = ?
        ",
        Bind => [
            \$Param{UserID},
            \$Self->{PreferencesTableKeyDBJSONPreferences},
        ],
        Limit => 1,
    );

    my $DBJSONPreferencesString;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $DBJSONPreferencesString = $Row[0];
    }

    my $Preferences = {};
    if ( IsStringWithData($DBJSONPreferencesString) ) {
        $Preferences = $JSONObject->Decode(
            Data => $DBJSONPreferencesString,
        );
    }
    return if ref $Preferences ne 'HASH';

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => $Preferences,
    );

    return %{$Preferences};
}

sub SearchPreferences {
    my ( $Self, %Param ) = @_;

    my $DBObject   = $Kernel::OM->Get('Kernel::System::DB');
    my $JSONObject = $Kernel::OM->Get('Kernel::System::JSON');
    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');

    return if !$DBObject->Prepare(
        SQL => "
            SELECT $Self->{PreferencesTableUserID}, $Self->{PreferencesTableValue}
            FROM   $Self->{PreferencesTable}
            WHERE  $Self->{PreferencesTableKey} = ?
        ",
        Bind => [
            \$Self->{PreferencesTableKeyDBJSONPreferences},
        ],
    );

    # Param 'Key' seems to be required, but keep it optional to have the same behavior
    # as in DB backend.
    my $Key = $Param{Key} // '';

    my %PreferenceValueByUserID;
    ROW:
    while ( my @Row = $DBObject->FetchrowArray() ) {
        my $UserID = $Row[0];
        next ROW if !$UserID;

        my $DBJSONPreferencesString = $Row[1];
        next ROW if !IsStringWithData($DBJSONPreferencesString);

        my $Preferences = $JSONObject->Decode(
            Data => $DBJSONPreferencesString,
        );
        next ROW if !IsHashRefWithData($Preferences);
        next ROW if !exists $Preferences->{$Key};

        # Param 'Value' given, must match preference value.
        next ROW if defined $Param{Value} && defined $Preferences->{$Key} && $Param{Value} ne $Preferences->{$Key};

        $PreferenceValueByUserID{$UserID} = $Preferences->{$Key};
    }

    return %PreferenceValueByUserID;
}

1;
