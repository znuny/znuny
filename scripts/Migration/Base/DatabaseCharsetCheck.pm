# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Base::DatabaseCharsetCheck;    ## no critic

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

use version;

our @ObjectDependencies = (
    'Kernel::System::DB',
);

=head1 SYNOPSIS

Checks if MySQL database is using correct charset.

=cut

sub CheckPreviousRequirement {
    my ( $Self, %Param ) = @_;

    return 1;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Verbose = $Param{CommandlineOptions}->{Verbose} || 0;

    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # Get Znuny version
    my $Version = $ConfigObject->Get('Version');
    my $MajorVersion;
    my $MinorVersion;

    if ( $Version =~ m{(\d+)\.(\d+)}xms ) {
        $MajorVersion = $1;
        $MinorVersion = $2;
    }

    # Define the required charset based on Znuny version
    my $RequiredCharacterSet = 'utf8';
    if ( $MajorVersion == 7 && $MinorVersion >= 1 ) {
        $RequiredCharacterSet = 'utf8mb4';
    }

    # This check makes sense only for MySQL, so skip it in case of other back-ends.
    if ( $DBObject->GetDatabaseFunction('Type') ne 'mysql' ) {
        if ($Verbose) {
            print "    Database backend is not MySQL, skipping...\n";
        }
        return 1;
    }

    my $ClientIsCorrect    = 0;
    my $ClientCharacterSet = "";

    # Check client character set.
    $DBObject->Prepare( SQL => "show variables like 'character_set_client'" );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ClientCharacterSet = $Row[1];

        if ( $ClientCharacterSet =~ /^$RequiredCharacterSet/i ) {
            $ClientIsCorrect = 1;
        }
    }

    if ( !$ClientIsCorrect ) {
        print "    Error: Setting character_set_client needs to be '$RequiredCharacterSet'.\n";
        return;
    }

    if ($Verbose) {
        print "    The setting character_set_client is: $ClientCharacterSet. ";
    }

    my $DatabaseIsCorrect    = 0;
    my $DatabaseCharacterSet = "";

    # Check database character set.
    $DBObject->Prepare( SQL => "show variables like 'character_set_database'" );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $DatabaseCharacterSet = $Row[1];

        if ( $DatabaseCharacterSet =~ /^$RequiredCharacterSet$/i ) {
            $DatabaseIsCorrect = 1;
        }
    }

    if ( !$DatabaseIsCorrect ) {
        print "\n    Error: The setting character_set_database needs to be '$RequiredCharacterSet'.\n";
        return;
    }

    if ($Verbose) {
        print "The setting character_set_database is: $DatabaseCharacterSet. ";
    }

    my @SystemTables = $DBObject->GetSystemTables(
        IncludePackageTables => 1,
    );
    my %SystemTables = map { $_ => 1 } @SystemTables;

    my @SystemTablesWithInvalidCharset;
    my @NonSystemTablesWithInvalidCharset;

    # Check for tables with invalid character set. Views have engine == null, ignore those.
    $DBObject->Prepare( SQL => 'show table status where engine is not null' );
    while ( my @Row = $DBObject->FetchrowArray() ) {
        if ( $Row[14] !~ /^$RequiredCharacterSet\_unicode_ci$/i ) {
            my $Table = $Row[0];

            push @SystemTablesWithInvalidCharset,    $Table if $SystemTables{$Table};
            push @NonSystemTablesWithInvalidCharset, $Table if !$SystemTables{$Table};
        }
    }

    if (@NonSystemTablesWithInvalidCharset) {
        print
            "\n    Warning: There were non-system tables found which do not have '$RequiredCharacterSet' as charset: '";
        print join( "', '", @NonSystemTablesWithInvalidCharset ) . "'.\n";
    }

    if (@SystemTablesWithInvalidCharset) {
        print "\n    Error: There were tables found which do not have '$RequiredCharacterSet' as charset: '";
        print join( "', '", @SystemTablesWithInvalidCharset ) . "'.\n";
        return;
    }

    if (
        $Verbose
        && !@SystemTablesWithInvalidCharset
        && !@NonSystemTablesWithInvalidCharset
        )
    {
        print "No tables found with invalid charset.\n";
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
