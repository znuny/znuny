# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::MigrateDBCRUDUUIDColumns;    ## no critic

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::Util',
);

=head1 SYNOPSIS

Migrates DBCRUD UUID columns and creates missing ones.
This is basically the same as executing command Admin::DBCRUD::AddUUIDColumns.

=head1 PUBLIC INTERFACE

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $UtilObject = $Kernel::OM->Get('Kernel::System::Util');

    my $InstalledDBCRUDObjects = $UtilObject->GetInstalledDBCRUDObjects();
    if ( !IsArrayRefWithData($InstalledDBCRUDObjects) ) {
        print "        No installed DBCRUD modules found.\n";
        return 1;
    }

    DATABASEBACKENDOBJECT:
    for my $DBCRUDObject ( @{$InstalledDBCRUDObjects} ) {
        print "        $DBCRUDObject->{Name}: Column $DBCRUDObject->{UUIDDatabaseTableColumnName} "
            . "in table $DBCRUDObject->{DatabaseTable}..."
            . "\n";

        # Migrate columns with old name like z4o_database_backend_uuid before creating
        # a missing one with the new name. This migrates also the history table columns.
        my $UUIDColumnsMigrated = $DBCRUDObject->MigrateUUIDDatabaseTableColumns();
        if ( !$UUIDColumnsMigrated ) {
            print "            Error migrating column\n";
            next DATABASEBACKENDOBJECT;
        }

        my $UUIDColumnPresent = $DBCRUDObject->IsUUIDDatabaseTableColumnPresent();
        if ($UUIDColumnPresent) {
            print "            Column already exists\n";
        }
        else {
            my $UUIDColumnCreated = $DBCRUDObject->CreateUUIDDatabaseTableColumn();
            if ( !$UUIDColumnCreated ) {
                print "        Column could not be created\n";
                next DATABASEBACKENDOBJECT;
            }

            print "            Column successfully created\n";
        }

        # Check/create history table UUID column.
        next DATABASEBACKENDOBJECT if !$DBCRUDObject->can('IsUUIDHistoryDatabaseTableColumnPresent');

        my $UUIDHistoryColumnPresent = $DBCRUDObject->IsUUIDHistoryDatabaseTableColumnPresent();
        if ($UUIDHistoryColumnPresent) {
            print "            History table UUID column already exists\n";
            next DATABASEBACKENDOBJECT;
        }

        my $UUIDHistoryColumnCreated = $DBCRUDObject->CreateUUIDHistoryDatabaseTableColumn();
        if ( !$UUIDHistoryColumnCreated ) {
            print "            History table UUID column could not be created\n";
            next DATABASEBACKENDOBJECT;
        }

        print "            History table UUID column successfully created\n";
    }

    return 1;
}

1;
