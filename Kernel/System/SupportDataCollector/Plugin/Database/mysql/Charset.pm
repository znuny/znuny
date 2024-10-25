# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Database::mysql::Charset;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::System::DB',
);

sub GetDisplayPath {
    return Translatable('Database');
}

sub Run {
    my $Self = shift;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    if ( $DBObject->GetDatabaseFunction('Type') ne 'mysql' ) {
        return $Self->GetResults();
    }

    $DBObject->Prepare( SQL => "show variables like 'character_set_client'" );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[1] =~ /utf8mb4/i ) {
            $Self->AddResultOk(
                Identifier => 'ClientEncoding',
                Label      => Translatable('Client Connection Charset'),
                Value      => $Row[1],
            );
        }
        else {
            $Self->AddResultProblem(
                Identifier => 'ClientEncoding',
                Label      => Translatable('Client Connection Charset'),
                Value      => $Row[1],
                Message    => Translatable('Setting character_set_client needs to be utf8mb4.'),
            );
        }
    }

    $DBObject->Prepare( SQL => "show variables like 'character_set_database'" );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[1] =~ /utf8mb4/i ) {
            $Self->AddResultOk(
                Identifier => 'ServerEncoding',
                Label      => Translatable('Server Database Charset'),
                Value      => $Row[1],
            );
        }
        else {
            $Self->AddResultProblem(
                Identifier => 'ServerEncoding',
                Label      => Translatable('Server Database Charset'),
                Value      => $Row[1],
                Message    => Translatable("The setting character_set_database needs to be 'utf8mb4'."),
            );
        }
    }

    my @SystemTables = $DBObject->GetSystemTables(
        IncludePackageTables => 1,
    );
    my %SystemTables = map { $_ => 1 } @SystemTables;

    my @SystemTablesWithInvalidCharset;
    my @NonSystemTablesWithInvalidCharset;

    # Views have engine == null, ignore those.
    $DBObject->Prepare( SQL => 'show table status where engine is not null' );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[14] !~ /^utf8mb4/i ) {
            my $Table = $Row[0];

            push @SystemTablesWithInvalidCharset,    $Table if $SystemTables{$Table};
            push @NonSystemTablesWithInvalidCharset, $Table if !$SystemTables{$Table};
        }
    }

    if (@NonSystemTablesWithInvalidCharset) {
        $Self->AddResultWarning(
            Identifier => 'TableEncoding',
            Label      => Translatable('Table Charset'),
            Value      => join( ', ', @NonSystemTablesWithInvalidCharset ),
            Message    => Translatable("There were non-system tables found which do not have 'utf8mb4' as charset."),
        );
    }

    if (@SystemTablesWithInvalidCharset) {
        $Self->AddResultProblem(
            Identifier => 'TableEncoding',
            Label      => Translatable('Table Charset'),
            Value      => join( ', ', @SystemTablesWithInvalidCharset ),
            Message    => Translatable("There were tables found which do not have 'utf8mb4' as charset."),
        );
    }

    if ( !@SystemTablesWithInvalidCharset && !@NonSystemTablesWithInvalidCharset ) {
        $Self->AddResultOk(
            Identifier => 'TableEncoding',
            Label      => Translatable('Table Charset'),
            Value      => '',
        );
    }

    return $Self->GetResults();
}

1;
