# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

# because of direct open() calls
## nofilter(TidyAll::Plugin::Znuny::Perl::PerlCritic)

package Kernel::System::DBCRUD::History;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::JSON',
    'Kernel::System::Log',
    'Kernel::System::Storable',
    'Kernel::System::XML',
    'Kernel::System::Time',
);

our %ConfigBackup;
our @ConfigBackupColumns
    = qw(Columns Name Identifier DatabaseTable DefaultSortBy DefaultOrderBy CacheType CacheTTL PreventHistory FunctionDataAdd FunctionDataUpdate FunctionDataDelete FunctionDataGet FunctionDataListGet FunctionDataSearch FunctionDataSearchValue);

=head1 NAME

Kernel::System::DBCRUD::History

=head2 HistoryBackendSet()

This function sets the information for the history DBCRUD module

    my $Success = $Object->HistoryBackendSet();

Returns:

    my $Success = 1;

=cut

sub HistoryBackendSet {
    my ( $Self, %Param ) = @_;

    return 1 if $Self->IsHistoryBackendSet();

    # save configuration of the backend
    %ConfigBackup = ();
    for my $Key (@ConfigBackupColumns) {
        $ConfigBackup{$Key} = $Self->{$Key};
    }

    # define default config for history backend
    my %ConfigDefault = (
        Columns => {
            ID => {
                Column       => 'id',
                SearchTarget => 0,
            },
            Event => {
                Column       => 'event',
                SearchTarget => 0,
            },
            Field => {
                Column       => 'field',
                SearchTarget => 0,
            },
            OldValue => {
                Column       => 'old_value',
                SearchTarget => 0,
                DisableWhere => 1,
            },
            NewValue => {
                Column       => 'new_value',
                SearchTarget => 0,
                DisableWhere => 1,
            },
            $Self->{Name} . $Self->{Identifier} => {
                Column       => $Self->{DatabaseTable} . '_' . $Self->{Columns}->{ $Self->{Identifier} }->{Column},
                SearchTarget => 0,
            },
            CreateTime => {
                Column       => 'create_time',
                SearchTarget => 0,
                TimeStampAdd => 1,
            },
            CreateBy => {
                Column       => 'create_by',
                SearchTarget => 0,
            },
            ChangeTime => {
                Column          => 'change_time',
                SearchTarget    => 0,
                TimeStampUpdate => 1,
            },
            ChangeBy => {
                Column       => 'change_by',
                SearchTarget => 0,
            },
        },
        Name                    => $Self->{Name} . 'History',
        Identifier              => 'ID',
        DatabaseTable           => $Self->{DatabaseTable} . '_history',
        DefaultSortBy           => 'ID',
        DefaultOrderBy          => 'ASC',
        CacheType               => $Self->{Name} . 'History',
        CacheTTL                => $Self->{CacheTTL},
        UserIDCheck             => $Self->{UserIDCheck},
        PreventHistory          => 1,
        FunctionDataAdd         => 1,
        FunctionDataUpdate      => 0,
        FunctionDataDelete      => 1,
        FunctionDataGet         => 1,
        FunctionDataListGet     => 1,
        FunctionDataSearch      => 1,
        FunctionDataSearchValue => 1,
    );

    # set configuration for the history backend
    for my $Key (@ConfigBackupColumns) {
        $Self->{$Key} = $Self->{ 'History' . $Key } // $ConfigDefault{$Key};
    }

    $Self->{HistoryBackendIsSet} = 1;

    return 1;
}

=head2 HistoryBackendUnset()

This function unsets the information for the history DBCRUD module

    my $Success = $Object->HistoryBackendUnset();

Returns:

    my $Success = 1;

=cut

sub HistoryBackendUnset {
    my ( $Self, %Param ) = @_;

    return 1 if !$Self->IsHistoryBackendSet();

    # restore configuration of the backend
    for my $Key (@ConfigBackupColumns) {
        $Self->{$Key} = $ConfigBackup{$Key};
    }

    $Self->{HistoryBackendIsSet} = 0;

    return 1;
}

=head2 IsHistoryBackendSet()

Checks if history backend is currently set.

    my $HistoryBackendIsSet = $Object->IsHistoryBackendSet();

Returns true value, if history backend is currently set.

=cut

sub IsHistoryBackendSet {
    my ( $Self, %Param ) = @_;

    return 1 if $Self->{HistoryBackendIsSet};

    return;
}

=head2 HistoryEventDataAdd()

This functions adds the history based on the information of the event

    my $Success = $Object->HistoryEventDataAdd(%Event);

Returns:

    my $Success = 1;

=cut

sub HistoryEventDataAdd {
    my ( $Self, %Param ) = @_;

    my $JSONObject     = $Kernel::OM->Get('Kernel::System::JSON');
    my $StorableObject = $Kernel::OM->Get('Kernel::System::Storable');

    my %DataGet = $Self->DataGet(
        $Self->{Identifier} => $Param{Data}->{ $Self->{Identifier} },
        UserID              => $Param{UserID},
    );

    my $Columns = $StorableObject->Clone(
        Data => $Self->{Columns},
    );

    HISTORY:
    for my $Key ( sort keys %{$Columns} ) {
        my $Value    = $DataGet{$Key}                  // '';
        my $OldValue = $Param{Data}->{OldData}->{$Key} // '';

        next HISTORY if !DataIsDifferent(
            Data1 => \$OldValue,
            Data2 => \$Value,
        );

        if ( $Columns->{$Key}->{ContentJSON} ) {
            if ($Value) {
                $Value = $JSONObject->Encode(
                    Data => $Value,
                );
            }
            if ($OldValue) {
                $OldValue = $JSONObject->Encode(
                    Data => $OldValue,
                );
            }
        }

        $Self->HistoryDataAdd(
            $Self->{Name} . $Self->{Identifier} => $DataGet{ $Self->{Identifier} },
            Event                               => $Param{Event},
            Field                               => $Key,
            NewValue                            => $Value,
            OldValue                            => $OldValue,
            CreateBy                            => $Param{UserID},
            ChangedBy                           => $Param{UserID},
            UserID                              => $Param{UserID},
        );
    }

    return 1;
}

=head2 HistoryEventDataDelete()

This functions removes the history based on the information of the event

    my $Success = $Object->HistoryEventDataDelete(%Event);

Returns:

    my $Success = 1;

=cut

sub HistoryEventDataDelete {
    my ( $Self, %Param ) = @_;

    return $Self->HistoryDataDelete(
        $Self->{Name} . 'ID' => $Param{Data}->{ID},
        UserID               => $Param{UserID},
    );
}

sub HistoryDataAdd {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $Result = $Self->DataAdd(%Param);
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return $Result;
}

sub HistoryDataUpdate {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $Result = $Self->DataUpdate(%Param);
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return $Result;
}

sub HistoryDataGet {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;

    # modify new value to maybe decode json or other transformations
    my %Result = $Self->DataGet(%Param);
    if (%Result) {
        $Result{NewValue} = $Self->_ContentValueGet(
            Value  => $Result{NewValue},
            Config => $ConfigBackup{Columns}->{ $Result{Field} },
        );
        $Result{OldValue} = $Self->_ContentValueGet(
            Value  => $Result{OldValue},
            Config => $ConfigBackup{Columns}->{ $Result{Field} },
        );
    }

    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return %Result;
}

sub HistoryDataListGet {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;

    my @Result = $Self->DataListGet(%Param);
    DATA:
    for my $KeyOrData (@Result) {
        next DATA if !IsHashRefWithData($KeyOrData);

        # modify new value to maybe decode json or other transformations
        $KeyOrData->{NewValue} = $Self->_ContentValueGet(
            Value  => $KeyOrData->{NewValue},
            Config => $ConfigBackup{Columns}->{ $KeyOrData->{Field} },
        );
        $KeyOrData->{OldValue} = $Self->_ContentValueGet(
            Value  => $KeyOrData->{OldValue},
            Config => $ConfigBackup{Columns}->{ $KeyOrData->{Field} },
        );
    }

    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return @Result;
}

sub HistoryDataSearch {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;

    my @Result = $Self->DataSearch(%Param);
    DATA:
    for my $KeyOrData (@Result) {
        next DATA if !IsHashRefWithData($KeyOrData);

        # modify new value to maybe decode json or other transformations
        $KeyOrData->{NewValue} = $Self->_ContentValueGet(
            Value  => $KeyOrData->{NewValue},
            Config => $ConfigBackup{Columns}->{ $KeyOrData->{Field} },
        );
        $KeyOrData->{OldValue} = $Self->_ContentValueGet(
            Value  => $KeyOrData->{OldValue},
            Config => $ConfigBackup{Columns}->{ $KeyOrData->{Field} },
        );
    }

    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return @Result;
}

sub HistoryDataDelete {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $Result = $Self->DataDelete(%Param);
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return $Result;
}

sub HistoryDataNameExists {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $Result = $Self->DataNameExists(%Param);
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return $Result;
}

sub HistoryDataSearchValue {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $Result = $Self->DataSearchValue(%Param);
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return $Result;
}

=head2 DataHistoryGet()

returns a hash of some of the data
calculated based on data history info at the given date.

    my %DataHistoryGet = $Object->DataHistoryGet(
        [Identifier] => 123,

        # get data based on the system time
        SystemTime => 123,
    );

    my %DataHistoryGet = $Object->DataHistoryGet(
        [Identifier] => 123,

        # get data based on the timestamp
        TimeStamp => '2017-01-01 12:00:00',
    );

    my %DataHistoryGet = $Object->DataHistoryGet(
        [Identifier] => 123,

        # get data based on the date information
        StopYear   => 2003,
        StopMonth  => 12,
        StopDay    => 24,
        StopHour   => 10, (optional, default 23)
        StopMinute => 0,  (optional, default 59)
        StopSecond => 0,  (optional, default 59)
    );

Returns:

    my %DataHistoryGet = (...);

=cut

sub DataHistoryGet {
    my ( $Self, %Param ) = @_;

    my %DataGet = $Self->DataGet(
        $Self->{Identifier} => $Param{ $Self->{Name} . $Self->{Identifier} },
        UserID              => $Param{UserID},
    );

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my %Result = $Self->_DataHistoryGet(
        %Param,
        DataGet => \%DataGet,
    );
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    return %Result;
}

sub _DataHistoryGet {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $TimeObject  = $Kernel::OM->Get('Kernel::System::Time');

    NEEDED:
    for my $Needed ( ( $ConfigBackup{Name} . $ConfigBackup{Identifier} ) ) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }
    if ( $Self->{UserIDCheck} && !$Param{UserID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Need UserID!",
        );
        return;
    }

    my %DataGet = %{ $Param{DataGet} || {} };

    my $TimeStamp;
    if ( $Param{SystemTime} ) {
        $TimeStamp = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $Param{SystemTime},
        );
    }
    elsif ( $Param{TimeStamp} ) {
        $TimeStamp = $Param{TimeStamp};
    }
    elsif ( $Param{StopYear} && $Param{StopMonth} && $Param{StopDay} ) {
        $Param{StopHour}   = defined $Param{StopHour}   ? $Param{StopHour}   : '23';
        $Param{StopMinute} = defined $Param{StopMinute} ? $Param{StopMinute} : '59';
        $Param{StopSecond} = defined $Param{StopSecond} ? $Param{StopSecond} : '59';

        my $SystemTime = $TimeObject->Date2SystemTime(
            Year   => $Param{StopYear},
            Month  => $Param{StopMonth},
            Day    => $Param{StopDay},
            Hour   => $Param{StopHour},
            Minute => $Param{StopMinute},
            Second => $Param{StopSecond},
        );
        $TimeStamp = $TimeObject->SystemTime2TimeStamp(
            SystemTime => $SystemTime,
        );
    }

    if ( !$TimeStamp ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can not calculate timestamp for calculation.",
        );
        return;
    }

    my @Bind;
    my @Cache;
    my @DBGet;
    my @Select;
    my @Where;

    PARAM:
    for my $ColumnParam ( sort keys %{ $Self->{Columns} } ) {
        my $Column = $Self->{Columns}->{$ColumnParam};

        if ( !$Param{$ColumnParam} && $Column->{GetRequired} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $ColumnParam!"
            );
            return;
        }

        push @Select, $Column->{Column};
        push @DBGet,  $ColumnParam;
    }

    # set identifier condition
    push @Bind, \$Param{ $ConfigBackup{Name} . $ConfigBackup{Identifier} };
    push @Cache,
        $ConfigBackup{Name}
        . $ConfigBackup{Identifier} . '::'
        . $Param{ $ConfigBackup{Name} . $ConfigBackup{Identifier} };
    push @Where, $Self->{Columns}->{ $ConfigBackup{Name} . $ConfigBackup{Identifier} }->{Column} . ' = ?';

    # set time condition
    push @Bind,  \$TimeStamp;
    push @Cache, 'TimeStamp::' . $TimeStamp;
    push @Where, $Self->{Columns}->{CreateTime}->{Column} . ' <= ?';

    # set sorting
    $Param{SortBy}  = 'CreateTime';
    $Param{OrderBy} = 'ASC';

    my $CacheKeysSort = $Self->_CacheKeysSortGet(%Param);
    @Cache = ( @Cache, @{$CacheKeysSort} );

    # check cache
    my $CacheKey = $Self->{DatabaseTable} . '::DataHistoryGet::' . join( '::', @Cache );
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return %{$Cache} if $Cache;

    my $SQL = '
        SELECT
            ' . join( ', ', @Select ) . '
        FROM
            ' . $Self->{DatabaseTable};

    if (@Where) {
        $SQL .= ' WHERE ' . join( ' AND ', @Where );
    }

    $SQL .= $Self->_SQLSortPrepare(%Param);

    # ask the database
    return if !$Self->{DBObject}->Prepare(
        SQL   => $SQL,
        Bind  => \@Bind,
        Limit => 1_000_000,
    );

    # fetch the result
    my %Entry;
    while ( my @Data = $Self->{DBObject}->FetchrowArray() ) {
        my %HistoryEntry;
        COLUMN:
        for my $Index ( 0 .. $#DBGet ) {
            $HistoryEntry{ $DBGet[$Index] } = $Self->_ConvertFrom( $Data[$Index] );
            $HistoryEntry{ $DBGet[$Index] } = $Self->_ContentValueGet(
                Value  => $HistoryEntry{ $DBGet[$Index] },
                Config => $Self->{Columns}->{ $DBGet[$Index] },
            );
        }

        $Entry{ $HistoryEntry{Field} } = $Self->_ContentValueGet(
            Value  => $HistoryEntry{NewValue},
            Config => $ConfigBackup{Columns}->{ $HistoryEntry{Field} },
        );
    }

    # set default because we don't write the initial value of data add to the history
    # because of performance reasons
    DEFAULT:
    for my $Key ( sort keys %DataGet ) {
        next DEFAULT if exists $Entry{$Key};

        my @Bind;
        push @Bind, \$Param{ $ConfigBackup{Name} . $ConfigBackup{Identifier} };
        push @Bind, \$Key;

        my $SQL = '
            SELECT
                ' . $Self->{Columns}->{OldValue}->{Column} . '
            FROM
                ' . $Self->{DatabaseTable} . '
            WHERE
                ' . $Self->{Columns}->{ $ConfigBackup{Name} . $ConfigBackup{Identifier} }->{Column} . ' = ? AND
                ' . $Self->{Columns}->{Field}->{Column} . ' = ?';

        $SQL .= $Self->_SQLSortPrepare(
            SortBy  => 'ID',
            OrderBy => 'ASC',
        );

        # ask the database
        return if !$Self->{DBObject}->Prepare(
            SQL   => $SQL,
            Bind  => \@Bind,
            Limit => 1,
        );

        # fetch the result
        my $Value;
        my $ValueFound;
        while ( my @Data = $Self->{DBObject}->FetchrowArray() ) {
            $Value = $Self->_ConvertFrom( $Data[0] );
            $Value = $Self->_ContentValueGet(
                Value  => $Value,
                Config => $ConfigBackup{Columns}->{$Key},
            );
            $ValueFound = 1;
        }

        $Entry{$Key} = $Value;
        if ( !$ValueFound ) {
            $Entry{$Key} = $DataGet{$Key};
        }
    }

    # no data found
    return if !%Entry;

    # set cache
    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Entry,
    );

    # trigger event
    $Self->EventHandler(
        ModuleName        => ref $Self,
        UseHistoryBackend => 1,
        Event             => 'DBCRUDHistoryGet',
        Data              => \%Entry,
        UserID            => $Param{UserID} || 1,
    );

    return %Entry;
}

=head2 IsUUIDHistoryDatabaseTableColumnPresent()

    Checks if the column for the UUID.

    my $UUIDColumnPresent = $DBCRUDObject->IsUUIDHistoryDatabaseTableColumnPresent();

    Returns true value if column for UUID is present.

=cut

sub IsUUIDHistoryDatabaseTableColumnPresent {
    my ( $Self, %Param ) = @_;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $SQL = "SELECT " . $Self->{UUIDDatabaseTableColumnName} . " FROM " . $Self->{DatabaseTable};
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    # Don't write errors of the database table column check to the log.
    {
        my $Errors;
        my $FileHandle = local (*STDERR);
        open $FileHandle, '>', \$Errors;

        my $DBPrepareOK = $Self->{DBObject}->Prepare(
            SQL   => $SQL,
            Limit => 1,
        );

        close $FileHandle;

        return if !$DBPrepareOK;
    };

    # Finish query to omit warnings.
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) { }

    return 1;
}

=head2 CreateUUIDHistoryDatabaseTableColumn()

    Creates the UUID database table column.

    my $UUIDColumnCreated = $DBCRUDObject->CreateUUIDHistoryDatabaseTableColumn();

    Returns true value if column has been created successfully.

=cut

sub CreateUUIDHistoryDatabaseTableColumn {
    my ( $Self, $Text ) = @_;

    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $XML = '
        <TableAlter Name="' . $Self->{DatabaseTable} . '">
            <ColumnAdd Name="' . $Self->{UUIDDatabaseTableColumnName} . '" Required="false" Size="36" Type="VARCHAR"/>
            <UniqueCreate Name="' . $Self->{DatabaseTable} . '_uuid">
                <UniqueColumn Name="' . $Self->{UUIDDatabaseTableColumnName} . '"/>
            </UniqueCreate>
        </TableAlter>
    ';
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    my @XML = $XMLObject->XMLParse( String => $XML );
    return if !@XML;

    my @SQL = $Self->{DBObject}->SQLProcessor( Database => \@XML );
    return if !@SQL;

    for my $SQL (@SQL) {
        return if !$Self->{DBObject}->Do( SQL => $SQL );
    }

    return 1;
}

=head2 CreateMissingUUIDHistoryDatabaseTableColumn()

    Creates missing UUID database table column in backend's history database table.

    my $Success = $DBCRUDObject->CreateMissingUUIDHistoryDatabaseTableColumn();

    Returns true value on success (also if column already existed).
    Returns false value if something went wrong.

=cut

sub CreateMissingUUIDHistoryDatabaseTableColumn {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    my $UUIDHistoryColumnPresent = $Self->IsUUIDHistoryDatabaseTableColumnPresent();
    return 1 if $UUIDHistoryColumnPresent;

    my $UUIDHistoryColumnCreated = $Self->CreateUUIDHistoryDatabaseTableColumn();
    return 1 if $UUIDHistoryColumnCreated;

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
    my $UUIDHistoryDatabaseTableColumnName = $Self->{UUIDDatabaseTableColumnName};
    my $HistoryDatabaseTable               = $Self->{DatabaseTable};
    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    $LogObject->Log(
        Priority => 'error',
        Message =>
            "Column $UUIDHistoryDatabaseTableColumnName could not be created in database table $HistoryDatabaseTable.",
    );
    return;
}

=head2 MigrateUUIDHistoryDatabaseTableColumn()

    Renames the UUID column from z4o_database_backend_uuid (used up until Znuny 6.0) or
    database_backend_uuid (used in Znuny 6.1 and 6.2) to dbcrud_uuid (Znuny 6.3 and up).
    Also includes table from history backend, if present.

    my $Success = $Object->MigrateUUIDHistoryDatabaseTableColumn();

    Returns true value on success.

=cut

sub MigrateUUIDHistoryDatabaseTableColumn {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    my $HistoryBackendWasAlreadySet = $Self->IsHistoryBackendSet();
    $Self->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;

    my $UUIDHistoryDatabaseTableColumnName = $Self->{UUIDDatabaseTableColumnName};
    my $HistoryDatabaseTable               = $Self->{DatabaseTable};

    $Self->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

    #
    # Check if UUID column with one of the old names is present.
    #
    my $OldUUIDColumnName;

    # Don't write errors of the database table column check to the log.
    {
        my $Errors;
        my $FileHandle = local (*STDERR);
        open $FileHandle, '>', \$Errors;

        # Check for (z4o_)database_backend_uuid

        OLDUUIDCOLUMNNAME:
        for my $CurrentOldUUIDColumnName (qw(z4o_database_backend_uuid database_backend_uuid)) {
            my $DBPrepareOK = $Self->{DBObject}->Prepare(
                SQL => "SELECT $CurrentOldUUIDColumnName"
                    . " FROM "
                    . $HistoryDatabaseTable,
                Limit => 1,
            );

            next OLDUUIDCOLUMNNAME if !$DBPrepareOK;

            $OldUUIDColumnName = $CurrentOldUUIDColumnName;
            last OLDUUIDCOLUMNNAME;
        }

        return 1 if !$OldUUIDColumnName;
    };

    # Finish query to omit warnings.
    while ( my @Row = $Self->{DBObject}->FetchrowArray() ) { }

    #
    # Rename UUID column and adjust index.
    #
    my $NewUUIDColumnName = $UUIDHistoryDatabaseTableColumnName;

    my $XML = '
        <TableAlter Name="' . $HistoryDatabaseTable . '">
            <UniqueDrop Name="' . $HistoryDatabaseTable . '_uuid"/>
            <ColumnChange NameOld="'
        . $OldUUIDColumnName
        . '" NameNew="'
        . $NewUUIDColumnName
        . '" Required="false" Size="36" Type="VARCHAR"/>
             <UniqueCreate Name="' . $HistoryDatabaseTable . '_uuid">
                 <UniqueColumn Name="' . $UUIDHistoryDatabaseTableColumnName . '"/>
             </UniqueCreate>
        </TableAlter>
    ';

    my @XML = $XMLObject->XMLParse( String => $XML );
    return if !@XML;

    my @SQL = $Self->{DBObject}->SQLProcessor( Database => \@XML );
    return if !@SQL;

    SQL:
    for my $SQL (@SQL) {
        next SQL if $Self->{DBObject}->Do( SQL => $SQL );

        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error: Unable to execute SQL: $SQL",
        );
        return;
    }

    return 1;
}

1;
