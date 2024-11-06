# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package scripts::Migration::Znuny::UpgradeDatabaseStructure::CreatePrimaryKeys;    ## no critic

use strict;
use warnings;
use utf8;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Main',
    'Kernel::System::XML',
);

=head1 SYNOPSIS

Creates missing primary keys in tables.

=head1 PUBLIC INTERFACE

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $XMLObject    = $Kernel::OM->Get('Kernel::System::XML');

    my $Verbose = $Param{CommandlineOptions}->{Verbose} || 0;
    my @Tables  = qw(
        acl_sync
        article_flag
        calendar_appointment_ticket
        customer_preferences
        customer_user_customer
        generic_agent_jobs
        group_customer
        group_customer_user
        group_role
        group_user
        link_relation
        notification_event_item
        personal_queues
        personal_services
        pm_entity_sync
        postmaster_filter
        process_id
        queue_preferences
        queue_standard_template
        role_user
        search_profile
        service_customer_user
        service_preferences
        service_sla
        sla_preferences
        ticket_flag
        ticket_index
        ticket_lock_index
        ticket_loop_protection
        ticket_watcher
        user_preferences
        virtual_fs_preferences
        web_upload_cache
        xml_storage
    );

    TABLE:
    for my $Table ( sort @Tables ) {
        my $TableExists = $Self->TableExists(
            Table => $Table,
        );
        next TABLE if !$TableExists;

        my $ColumnExists = $Self->ColumnExists(
            Table  => $Table,
            Column => 'id',
        );
        next TABLE if $ColumnExists;

        if ( $DBObject->{'DB::Type'} eq 'mysql' ) {

            # Add the 'id' column.
            my $IDColumnAdded = $Self->_AddColumn(
                Table => $Table,
            );

            if ( !$IDColumnAdded ) {
                print "           Could not add primary key columnd 'id' to table $Table!\n" if $Verbose;
                next TABLE;
            }
        }

        # For postgresql and oracle is it needed to re-create the table with
        # the correct column order.
        #
        # For mysql these steps are not needed because it supports creating a new column
        # at the first position of the table.
        if ( $DBObject->{'DB::Type'} eq 'postgresql' || $DBObject->{'DB::Type'} eq 'oracle' ) {

            # Get all column names.
            $DBObject->Prepare(
                SQL   => "SELECT * FROM $Table",
                Limit => 1,
            );

            my @ColumnNames = $DBObject->GetColumnNames();
            my $ColumnOrder;

            for my $Column (@ColumnNames) {
                if ( !$ColumnOrder ) {
                    $ColumnOrder = $Column;
                }
                else {
                    $ColumnOrder .= ', ' . $Column;
                }
            }

            # Create a temporary table with new column order.
            # CREATE TABLE acl_sync_tmp AS SELECT acl_id, sync_state, create_time, change_time FROM acl_sync;
            my $SQL       = 'CREATE TABLE ' . $Table . '_tmp AS SELECT ' . $ColumnOrder . ' FROM ' . $Table;
            my $Temporary = $DBObject->Do( SQL => $SQL );
            if ( !$Temporary ) {
                print "           Could not create temporary table $Table with new column order!\n" if $Verbose;
                next TABLE;
            }

            # Drop the original table.
            my $TableDropped = $Self->_DropTable(
                Table => $Table,
            );

            if ( !$TableDropped ) {
                print "           Could not drop table $Table!\n" if $Verbose;
                next TABLE;
            }

            # Create the main table again with correct column order and all relations.
            my $TableCreated = $Self->_CreateTable(
                Table => $Table,
            );

            if ( !$TableCreated ) {
                print "           Could not create table $Table!\n" if $Verbose;
                next TABLE;
            }

            # Insert data from tmp in main table.
            #
            # INSERT INTO acl_sync
            #     ( acl_id, sync_state, create_time, change_time )
            #     SELECT acl_id, sync_state, create_time, change_time
            #         FROM acl_sync_tmp
            my $InsertSQL = 'INSERT INTO '
                . $Table . ' ( '
                . $ColumnOrder
                . ' ) SELECT '
                . $ColumnOrder
                . ' FROM '
                . $Table . '_tmp';
            my $DataInserted = $DBObject->Do( SQL => $InsertSQL );

            if ( !$DataInserted ) {
                print "           Could not insert data into table $Table!\n" if $Verbose;
                next TABLE;
            }

            # Drop the temporary table again.
            my $TemporaryTableDropped = $Self->_DropTable(
                Table => $Table . '_tmp',
            );

            if ( !$TemporaryTableDropped ) {
                print "           Could not drop temporary table $Table!\n" if $Verbose;
                next TABLE;
            }
        }
    }

    return 1;
}

sub _AddColumn {
    my ( $Self, %Param ) = @_;

    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    return if !$Param{Table};

    my $Table = $Param{Table};
    my $XML   = '
        <TableAlter Name="' . $Table . '">
            <ColumnAdd Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
        </TableAlter>
    ';

    my @XML = $XMLObject->XMLParse( String => $XML );
    return if !@XML;

    my @SQL = $DBObject->SQLProcessor( Database => \@XML );
    return if !@SQL;

    my @SQLPost = $DBObject->SQLProcessorPost();
    push @SQL, @SQLPost;

    for my $SQL (@SQL) {
        return if !$DBObject->Do( SQL => $SQL );
    }

    return 1;
}

sub _DropTable {
    my ( $Self, %Param ) = @_;

    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    return if !$Param{Table};

    my $Table = $Param{Table};
    my $XML   = '
        <TableDrop Name="' . $Param{Table} . '"/>
    ';

    my @XML = $XMLObject->XMLParse( String => $XML );
    return if !@XML;

    my @SQL = $DBObject->SQLProcessor( Database => \@XML );
    return if !@SQL;

    my @SQLPost = $DBObject->SQLProcessorPost();
    push @SQL, @SQLPost;

    for my $SQL (@SQL) {
        return if !$DBObject->Do( SQL => $SQL );
    }

    return 1;
}

sub _CreateTable {
    my ( $Self, %Param ) = @_;

    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    return if !$Param{Table};

    my $Table = $Param{Table};
    my $XML   = $Self->_GetTableSchema(
        Table => $Table,
    );
    return if !$XML;

    my @XML = $XMLObject->XMLParse( String => $XML );
    return if !@XML;

    my @SQL = $DBObject->SQLProcessor( Database => \@XML );
    return if !@SQL;

    my @SQLPost = $DBObject->SQLProcessorPost();
    push @SQL, @SQLPost;

    for my $SQL (@SQL) {
        return if !$DBObject->Do( SQL => $SQL );
    }

    return 1;
}

sub _GetTableSchema {
    my ( $Self, %Param ) = @_;

    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    return if !$Param{Table};

    # This hash is based on scripts/database/schema.xml
    my %Schema = (
        acl_sync => '
            <Table Name="acl_sync">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="acl_id" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="sync_state" Required="true" Size="30" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
            </Table>',
        article_flag => '
            <Table Name="article_flag">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="article_id" Required="true" Type="BIGINT"/>
                <Column Name="article_key" Required="true" Size="50" Type="VARCHAR"/>
                <Column Name="article_value" Required="false" Size="50" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Index Name="article_flag_article_id_create_by">
                    <IndexColumn Name="article_id"/>
                    <IndexColumn Name="create_by"/>
                </Index>
                <Index Name="article_flag_article_id">
                    <IndexColumn Name="article_id"/>
                </Index>
                <ForeignKey ForeignTable="article">
                    <Reference Local="article_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        calendar_appointment_ticket => '
            <Table Name="calendar_appointment_ticket">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="calendar_id" Required="true" Type="BIGINT" />
                <Column Name="ticket_id" Required="true" Type="BIGINT" />
                <Column Name="rule_id" Required="true" Size="32" Type="VARCHAR" />
                <Column Name="appointment_id" Required="true" Type="BIGINT" />
                <Unique Name="calendar_appointment_ticket_calendar_id_ticket_id_rule_id">
                    <UniqueColumn Name="calendar_id" />
                    <UniqueColumn Name="ticket_id" />
                    <UniqueColumn Name="rule_id" />
                </Unique>
                <Index Name="calendar_appointment_ticket_calendar_id">
                    <IndexColumn Name="calendar_id" />
                </Index>
                <Index Name="calendar_appointment_ticket_ticket_id">
                    <IndexColumn Name="ticket_id" />
                </Index>
                <Index Name="calendar_appointment_ticket_rule_id">
                    <IndexColumn Name="rule_id" />
                </Index>
                <Index Name="calendar_appointment_ticket_appointment_id">
                    <IndexColumn Name="appointment_id" />
                </Index>
                <ForeignKey ForeignTable="calendar">
                    <Reference Local="calendar_id" Foreign="id" />
                </ForeignKey>
                <ForeignKey ForeignTable="ticket">
                    <Reference Local="ticket_id" Foreign="id" />
                </ForeignKey>
                <ForeignKey ForeignTable="calendar_appointment">
                    <Reference Local="appointment_id" Foreign="id" />
                </ForeignKey>
            </Table>',
        customer_preferences => '
            <Table Name="customer_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Size="250" Type="VARCHAR"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Size="250" Type="VARCHAR"/>
                <Index Name="customer_preferences_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
            </Table>',
        customer_user_customer => '
            <Table Name="customer_user_customer">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Size="100" Type="VARCHAR"/>
                <Column Name="customer_id" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="customer_user_customer_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="customer_user_customer_customer_id">
                    <IndexColumn Name="customer_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        generic_agent_jobs => '
            <Table Name="generic_agent_jobs">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="job_name" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="job_key" Required="true" Size="255" Type="VARCHAR"/>
                <Column Name="job_value" Required="false" Size="3800" Type="VARCHAR"/>
                <Index Name="generic_agent_jobs_job_name">
                    <IndexColumn Name="job_name"/>
                </Index>
            </Table>',
        group_customer => '
            <Table Name="group_customer">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="customer_id" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="group_id" Required="true" Type="INTEGER"/>
                <Column Name="permission_key" Required="true" Size="20" Type="VARCHAR"/>
                <!-- Here permission_value is still used (0/1) because CustomerGroup.pm
                    was not yet refactored like Group.pm. -->
                <Column Name="permission_value" Required="true" Type="SMALLINT"/>
                <Column Name="permission_context" Required="true" Size="100" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="group_customer_customer_id">
                    <IndexColumn Name="customer_id"/>
                </Index>
                <Index Name="group_customer_group_id">
                    <IndexColumn Name="group_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="permission_groups">
                    <Reference Local="group_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        group_customer_user => '
            <Table Name="group_customer_user">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Size="100" Type="VARCHAR"/>
                <Column Name="group_id" Required="true" Type="INTEGER"/>
                <Column Name="permission_key" Required="true" Size="20" Type="VARCHAR"/>
                <!-- Here permission_value is still used (0/1) because CustomerGroup.pm
                    was not yet refactored like Group.pm. -->
                <Column Name="permission_value" Required="true" Type="SMALLINT"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="group_customer_user_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="group_customer_user_group_id">
                    <IndexColumn Name="group_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="permission_groups">
                    <Reference Local="group_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        group_role => '
        <Table Name="group_role">
            <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
            <Column Name="role_id" Required="true" Type="INTEGER"/>
            <Column Name="group_id" Required="true" Type="INTEGER"/>
            <Column Name="permission_key" Required="true" Size="20" Type="VARCHAR"/>
            <!-- permission_value is currently unneeded (always 1), but there could be old entries from
                OTRS 4 or earlier which have 0 set. -->
            <Column Name="permission_value" Required="true" Type="SMALLINT"/>
            <Column Name="create_time" Required="true" Type="DATE"/>
            <Column Name="create_by" Required="true" Type="INTEGER"/>
            <Column Name="change_time" Required="true" Type="DATE"/>
            <Column Name="change_by" Required="true" Type="INTEGER"/>
            <Index Name="group_role_role_id">
                <IndexColumn Name="role_id"/>
            </Index>
            <Index Name="group_role_group_id">
                <IndexColumn Name="group_id"/>
            </Index>
            <ForeignKey ForeignTable="users">
                <Reference Local="create_by" Foreign="id"/>
                <Reference Local="change_by" Foreign="id"/>
            </ForeignKey>
            <ForeignKey ForeignTable="permission_groups">
                <Reference Local="group_id" Foreign="id"/>
            </ForeignKey>
            <ForeignKey ForeignTable="roles">
                <Reference Local="role_id" Foreign="id"/>
            </ForeignKey>
        </Table>',
        group_user => '
            <Table Name="group_user">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="group_id" Required="true" Type="INTEGER"/>
                <Column Name="permission_key" Required="true" Size="20" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="group_user_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="group_user_group_id">
                    <IndexColumn Name="group_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                    <Reference Local="user_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="permission_groups">
                    <Reference Local="group_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        link_relation => '
            <Table Name="link_relation">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="source_object_id" Required="true" Type="SMALLINT"/>
                <Column Name="source_key" Required="true" Size="50" Type="VARCHAR"/>
                <Column Name="target_object_id" Required="true" Type="SMALLINT"/>
                <Column Name="target_key" Required="true" Size="50" Type="VARCHAR"/>
                <Column Name="type_id" Required="true" Type="SMALLINT"/>
                <Column Name="state_id" Required="true" Type="SMALLINT"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Unique Name="link_relation_view">
                    <UniqueColumn Name="source_object_id"/>
                    <UniqueColumn Name="source_key"/>
                    <UniqueColumn Name="target_object_id"/>
                    <UniqueColumn Name="target_key"/>
                    <UniqueColumn Name="type_id"/>
                </Unique>
                <Index Name="link_relation_list_source">
                    <IndexColumn Name="source_object_id"/>
                    <IndexColumn Name="source_key"/>
                    <IndexColumn Name="state_id"/>
                </Index>
                <Index Name="link_relation_list_target">
                    <IndexColumn Name="target_object_id"/>
                    <IndexColumn Name="target_key"/>
                    <IndexColumn Name="state_id"/>
                </Index>
                <ForeignKey ForeignTable="link_object">
                    <Reference Local="source_object_id" Foreign="id"/>
                    <Reference Local="target_object_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="link_type">
                    <Reference Local="type_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="link_state">
                    <Reference Local="state_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        notification_event_item => '
            <Table Name="notification_event_item">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="notification_id" Required="true" Type="INTEGER"/>
                <Column Name="event_key" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="event_value" Required="true" Size="200" Type="VARCHAR"/>
                <ForeignKey ForeignTable="notification_event">
                    <Reference Foreign="id" Local="notification_id"/>
                </ForeignKey>
                <Index Name="notification_event_item_notification_id">
                    <IndexColumn Name="notification_id"/>
                </Index>
                <Index Name="notification_event_item_event_key">
                    <IndexColumn Name="event_key"/>
                </Index>
                <Index Name="notification_event_item_event_value">
                    <IndexColumn Name="event_value"/>
                </Index>
            </Table>',
        personal_queues => '
            <Table Name="personal_queues">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="queue_id" Required="true" Type="INTEGER"/>
                <Index Name="personal_queues_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="personal_queues_queue_id">
                    <IndexColumn Name="queue_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="user_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="queue">
                    <Reference Local="queue_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        personal_services => '
            <Table Name="personal_services">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="service_id" Required="true" Type="INTEGER"/>
                <Index Name="personal_services_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="personal_services_service_id">
                    <IndexColumn Name="service_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="user_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="service">
                    <Reference Local="service_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        pm_entity_sync => '
            <Table Name="pm_entity_sync">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="entity_type" Required="true" Size="30" Type="VARCHAR"/>
                <Column Name="entity_id" Required="true" Size="50" Type="VARCHAR"/>
                <Column Name="sync_state" Required="true" Size="30" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Unique Name="pm_entity_sync_list">
                    <UniqueColumn Name="entity_type"/>
                    <UniqueColumn Name="entity_id"/>
                </Unique>
            </Table>',
        postmaster_filter => '
            <Table Name="postmaster_filter">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="f_name" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="f_stop" Required="false" Type="SMALLINT"/>
                <Column Name="f_type" Required="true" Size="20" Type="VARCHAR"/>
                <Column Name="f_key" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="f_value" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="f_not" Required="false" Type="SMALLINT"/>
                <Index Name="postmaster_filter_f_name">
                    <IndexColumn Name="f_name"/>
                </Index>
            </Table>',
        process_id => '
            <Table Name="process_id">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="process_name" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="process_id" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="process_host" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="process_create" Required="true" Type="INTEGER"/>
                <Column Name="process_change" Required="true" Type="INTEGER"/>
            </Table>',
        queue_preferences => '
            <Table Name="queue_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="queue_id" Required="true" Type="INTEGER"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Size="250" Type="VARCHAR"/>
                <Index Name="queue_preferences_queue_id">
                    <IndexColumn Name="queue_id"/>
                </Index>
                <ForeignKey ForeignTable="queue">
                    <Reference Local="queue_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        queue_standard_template => '
            <Table Name="queue_standard_template">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="queue_id" Required="true" Type="INTEGER"/>
                <Column Name="standard_template_id" Required="true" Type="INTEGER"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <ForeignKey ForeignTable="standard_template">
                    <Reference Local="standard_template_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="queue">
                    <Reference Local="queue_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        role_user => '
            <Table Name="role_user">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="role_id" Required="true" Type="INTEGER"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="role_user_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <Index Name="role_user_role_id">
                    <IndexColumn Name="role_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                    <Reference Local="user_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        search_profile => '
            <Table Name="search_profile">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="login" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="profile_name" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="profile_type" Required="true" Size="30" Type="VARCHAR"/>
                <Column Name="profile_key" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="profile_value" Required="false" Size="200" Type="VARCHAR"/>
                <Index Name="search_profile_login">
                    <IndexColumn Name="login"/>
                </Index>
                <Index Name="search_profile_profile_name">
                    <IndexColumn Name="profile_name"/>
                </Index>
            </Table>',
        service_customer_user => '
            <Table Name="service_customer_user">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="customer_user_login" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="service_id" Required="true" Type="INTEGER"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Index Name="service_customer_user_customer_user_login">
                    <IndexColumn Name="customer_user_login" Size="10"/>
                </Index>
                <Index Name="service_customer_user_service_id">
                    <IndexColumn Name="service_id"/>
                </Index>
                <ForeignKey ForeignTable="service">
                    <Reference Local="service_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        service_preferences => '
            <Table Name="service_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="service_id" Required="true" Type="INTEGER"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Size="250" Type="VARCHAR"/>
                <Index Name="service_preferences_service_id">
                    <IndexColumn Name="service_id"/>
                </Index>
                <ForeignKey ForeignTable="service">
                    <Reference Local="service_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        service_sla => '
            <Table Name="service_sla">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="service_id" Required="true" Type="INTEGER"/>
                <Column Name="sla_id" Required="true" Type="INTEGER"/>
                <ForeignKey ForeignTable="service">
                    <Reference Local="service_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="sla">
                    <Reference Local="sla_id" Foreign="id"/>
                </ForeignKey>
            </Table>
        ',
        sla_preferences => '
            <Table Name="sla_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="sla_id" Required="true" Type="INTEGER"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Size="250" Type="VARCHAR"/>
                <Index Name="sla_preferences_sla_id">
                    <IndexColumn Name="sla_id"/>
                </Index>
                <ForeignKey ForeignTable="sla">
                    <Reference Local="sla_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        ticket_flag => '
            <Table Name="ticket_flag">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="ticket_id" Required="true" Type="BIGINT"/>
                <Column Name="ticket_key" Required="true" Size="50" Type="VARCHAR"/>
                <Column Name="ticket_value" Required="false" Size="50" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Index Name="ticket_flag_ticket_id_create_by">
                    <IndexColumn Name="ticket_id"/>
                    <IndexColumn Name="create_by"/>
                </Index>
                <!-- index for updating/deleting a certain flag for all users of a ticket -->
                <Index Name="ticket_flag_ticket_id_ticket_key">
                    <IndexColumn Name="ticket_id"/>
                    <IndexColumn Name="ticket_key"/>
                </Index>
                <!-- index for deleting all flags from a ticket -->
                <Index Name="ticket_flag_ticket_id">
                    <IndexColumn Name="ticket_id"/>
                </Index>
                <!-- unique index enforcing that each flag key can exist only once per user and ticket -->
                <Unique Name="ticket_flag_per_user">
                    <UniqueColumn Name="ticket_id"/>
                    <UniqueColumn Name="ticket_key"/>
                    <UniqueColumn Name="create_by"/>
                </Unique>
                <ForeignKey ForeignTable="ticket">
                    <Reference Local="ticket_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="create_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        ticket_index => '
            <Table Name="ticket_index">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="ticket_id" Required="true" Type="BIGINT"/>
                <Column Name="queue_id" Required="true" Type="INTEGER"/>
                <Column Name="queue" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="group_id" Required="true" Type="INTEGER"/>
                <Column Name="s_lock" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="s_state" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Index Name="ticket_index_ticket_id">
                    <IndexColumn Name="ticket_id"/>
                </Index>
                <Index Name="ticket_index_queue_id">
                    <IndexColumn Name="queue_id"/>
                </Index>
                <Index Name="ticket_index_group_id">
                    <IndexColumn Name="group_id"/>
                </Index>
                <ForeignKey ForeignTable="ticket">
                    <Reference Local="ticket_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="queue">
                    <Reference Local="queue_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="permission_groups">
                    <Reference Local="group_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        ticket_lock_index => '
            <Table Name="ticket_lock_index">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="ticket_id" Required="true" Type="BIGINT"/>
                <Index Name="ticket_lock_index_ticket_id">
                    <IndexColumn Name="ticket_id"/>
                </Index>
                <ForeignKey ForeignTable="ticket">
                    <Reference Local="ticket_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        ticket_loop_protection => '
            <Table Name="ticket_loop_protection">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="sent_to" Required="true" Size="250" Type="VARCHAR"/>
                <Column Name="sent_date" Required="true" Size="150" Type="VARCHAR"/>
                <Index Name="ticket_loop_protection_sent_to">
                    <IndexColumn Name="sent_to"/>
                </Index>
                <Index Name="ticket_loop_protection_sent_date">
                    <IndexColumn Name="sent_date"/>
                </Index>
            </Table>',
        ticket_watcher => '
            <Table Name="ticket_watcher">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="ticket_id" Required="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="create_time" Required="true" Type="DATE"/>
                <Column Name="create_by" Required="true" Type="INTEGER"/>
                <Column Name="change_time" Required="true" Type="DATE"/>
                <Column Name="change_by" Required="true" Type="INTEGER"/>
                <Index Name="ticket_watcher_ticket_id">
                    <IndexColumn Name="ticket_id"/>
                </Index>
                <Index Name="ticket_watcher_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <ForeignKey ForeignTable="ticket">
                    <Reference Local="ticket_id" Foreign="id"/>
                </ForeignKey>
                <ForeignKey ForeignTable="users">
                    <Reference Local="user_id" Foreign="id"/>
                    <Reference Local="create_by" Foreign="id"/>
                    <Reference Local="change_by" Foreign="id"/>
                </ForeignKey>
            </Table>',
        user_preferences => '
            <Table Name="user_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="user_id" Required="true" Type="INTEGER"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Type="LONGBLOB"/>
                <Index Name="user_preferences_user_id">
                    <IndexColumn Name="user_id"/>
                </Index>
                <ForeignKey ForeignTable="users">
                    <Reference Local="user_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        virtual_fs_preferences => '
            <Table Name="virtual_fs_preferences">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="virtual_fs_id" Required="true" Type="BIGINT"/>
                <Column Name="preferences_key" Required="true" Size="150" Type="VARCHAR"/>
                <Column Name="preferences_value" Required="false" Size="350" Type="VARCHAR"/>
                <Index Name="virtual_fs_preferences_virtual_fs_id">
                    <IndexColumn Name="virtual_fs_id"/>
                </Index>
                <Index Name="virtual_fs_preferences_key_value">
                    <IndexColumn Name="preferences_key"/>
                    <IndexColumn Name="preferences_value" Size="150"/>
                </Index>
                <ForeignKey ForeignTable="virtual_fs">
                    <Reference Local="virtual_fs_id" Foreign="id"/>
                </ForeignKey>
            </Table>',
        web_upload_cache => '
            <Table Name="web_upload_cache">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="form_id" Required="false" Size="250" Type="VARCHAR"/>
                <Column Name="filename" Required="false" Size="250" Type="VARCHAR"/>
                <Column Name="content_id" Required="false" Size="250" Type="VARCHAR"/>
                <Column Name="content_size" Required="false" Size="30" Type="VARCHAR"/>
                <Column Name="content_type" Required="false" Size="250" Type="VARCHAR"/>
                <Column Name="disposition" Required="false" Size="15" Type="VARCHAR"/>
                <Column Name="content" Required="true" Type="LONGBLOB"/>
                <Column Name="create_time_unix" Required="true" Type="BIGINT"/>
            </Table>',
        xml_storage => '
            <Table Name="xml_storage">
                <Column Name="id" Required="true" PrimaryKey="true" AutoIncrement="true" Type="BIGINT"/>
                <Column Name="xml_type" Required="true" Size="200" Type="VARCHAR"/>
                <Column Name="xml_key" Required="true" Size="250" Type="VARCHAR"/>
                <Column Name="xml_content_key" Required="true" Size="250" Type="VARCHAR"/>
                <Column Name="xml_content_value" Required="false" Size="1000000" Type="VARCHAR"/>
                <Index Name="xml_storage_key_type">
                    <IndexColumn Name="xml_key" Size="10"/>
                    <IndexColumn Name="xml_type" Size="10"/>
                </Index>
                <Index Name="xml_storage_xml_content_key">
                    <IndexColumn Name="xml_content_key" Size="100"/>
                </Index>
            </Table>',
    );

    return $Schema{ $Param{Table} } || undef;
}

1;
