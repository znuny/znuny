# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::DBCRUD;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
);

use parent qw(Kernel::System::DBCRUD);
use parent qw(Kernel::System::DBCRUD::History);

=head1 NAME

Kernel::System::UnitTest::DBCRUD - DBCRUD test lib

=head1 SYNOPSIS

All DBCRUD functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $DBCRUDTestObject = $Kernel::OM->Get('Kernel::System::UnitTest::DBCRUD');

=cut

=head2 DataAdd()

add data to table

    my $Success = $DBCRUDTestObject->DataAdd(
        ID          => '...',
        Name        => '...', # optional
        Age         => '...', # optional
        Description => '...', # optional
        ContentJSON => '...', # optional
        CreateTime  => '...', # optional
        ChangeTime  => '...', # optional
    );

Returns:

    my $Success = 1;

=cut

=head2 DataGet()

get data attributes

    my %Data = $DBCRUDTestObject->DataGet(
        ID          => '...', # optional
        Name        => '...', # optional
        Age         => '...', # optional
        Description => '...', # optional
        ContentJSON => '...', # optional
        CreateTime  => '...', # optional
        ChangeTime  => '...', # optional
    );

Returns:

    my %Data = (
        ID          => '...',
        Name        => '...',
        Age         => '...',
        Description => '...',
        ContentJSON => '...',
        CreateTime  => '...',
        ChangeTime  => '...',
    );

=cut

=head2 DataListGet()

get list data with attributes

    my @Data = $DBCRUDTestObject->DataListGet(
        ID          => '...', # optional
        Name        => '...', # optional
        Age         => '...', # optional
        Description => '...', # optional
        ContentJSON => '...', # optional
        CreateTime  => '...', # optional
        ChangeTime  => '...', # optional
    );

Returns:

    my @Data = (
        {
            ID          => '...',
            Name        => '...',
            Age         => '...',
            Description => '...',
            ContentJSON => '...',
            CreateTime  => '...',
            ChangeTime  => '...',
        },
        # ...
    );

=cut

=head2 DataSearch()

search for value in defined attributes

    my %Data = $DBCRUDTestObject->DataSearch(
        Search      => 'test*test',
        ID          => '...', # optional
        Name        => '...', # optional
        Age         => '...', # optional
        Description => '...', # optional
        ContentJSON => '...', # optional
        CreateTime  => '...', # optional
        ChangeTime  => '...', # optional
    );

Returns:

    my %Data = (
        '1' => {
            ID          => '...',
            Name        => '...',
            Age         => '...',
            Description => '...',
            ContentJSON => '...',
            CreateTime  => '...',
            ChangeTime  => '...',
        },
        # ...
    );

=cut

=head2 DataDelete()

remove data from table

    my $Success = $DBCRUDTestObject->DataDelete(
        ID          => '...', # optional
        Name        => '...', # optional
        Age         => '...', # optional
        Description => '...', # optional
        ContentJSON => '...', # optional
        CreateTime  => '...', # optional
        ChangeTime  => '...', # optional
    );

Returns:

    my $Success = 1;

=cut

=head2 DataExport()

exports data.

    my $Export = $DBCRUDTestObject->DataExport(
        Format => 'yml',
        Cache  => 0,
    );

Returns:

    my $Export = 'STRING';

=cut

=head2 DataImport()

imports data.

    my $Success = $DBCRUDTestObject->DataImport(
        Content   => $ContentString,
        Format    => 'yml',                 # optional - default
        Overwrite => 1,                     # optional to overwrite existing data
        Data      => {                      # additional data if not all needed data exists
            ValidID => 1,
        }
    );

Returns:

    my $Success = 1;

=cut

=head2 InitConfig()

init config for object

    my $Success = $DBCRUDTestObject->InitConfig();

Returns:

    my $Success = 1;

=cut

sub InitConfig {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $Self->{Columns} = {
        ID => {
            Column => 'id',
        },
        Name => {
            Column       => 'name',
            SearchTarget => 1,
            Export       => 1,
            ImportID     => 1,
        },
        Age => {
            Column       => 'age',
            SearchTarget => 1,
            Export       => 2,
        },
        Description => {
            Column       => 'description',
            SearchTarget => 1,
            Export       => 3,
            CopyDelete   => 1,
        },
        ContentJSON => {
            Column       => 'content_json',
            SearchTarget => 0,
            ContentJSON  => 1,
            DisableWhere => 1,
        },
        CreateTime => {
            Column       => 'create_time',
            TimeStamp    => 1,
            TimeStampAdd => 1,
        },
        ChangeTime => {
            Column          => 'change_time',
            TimeStamp       => 1,
            TimeStampAdd    => 1,
            TimeStampUpdate => 1,
        },
    };

    # base table configuration
    $Self->{Name}           = 'DBCRUDTest';
    $Self->{Identifier}     = 'ID';
    $Self->{DatabaseTable}  = 'dbcrud_test';
    $Self->{DefaultSortBy}  = 'Name';
    $Self->{DefaultOrderBy} = 'ASC';
    $Self->{CacheType}      = 'DBCRUDTest';
    $Self->{CacheTTL}       = 60 * 60 * 8;

    $Self->{AutoCreateMissingUUIDDatabaseTableColumns} = 1;

    # base function activation
    $Self->{FunctionDataAdd}           = 1;
    $Self->{FunctionDataUpdate}        = 1;
    $Self->{FunctionDataDelete}        = 1;
    $Self->{FunctionDataGet}           = 1;
    $Self->{FunctionDataListGet}       = 1;
    $Self->{FunctionDataSearch}        = 1;
    $Self->{FunctionDataSearchValue}   = 1;
    $Self->{FunctionDataExport}        = 1;
    $Self->{FunctionDataImport}        = 1;
    $Self->{HistoryFunctionDataUpdate} = 1;

    return 1;
}

1;
