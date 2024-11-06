# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::TicketAttributeRelations;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::CSV',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Encode',
    'Kernel::System::FileTemp',
    'Kernel::System::HTMLUtils',
    'Kernel::System::JSON',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

use MIME::Base64 qw();

use Kernel::System::VariableCheck qw(:all);

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $TicketAttributeRelationsObject = $Kernel::OM->Get('Kernel::System::TicketAttributeRelations');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{CacheType} = 'TicketAttributeRelations';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;

    return $Self;
}

=head2 AddTicketAttributeRelations()

Adds a new ticket attribute relations record.

    my $ID = $TicketAttributeRelationsObject->AddTicketAttributeRelations(
        Filename                 => 'csv-filename.csv',
        Data                     => 'Data from CSV or Excel file',
        DynamicFieldConfigUpdate => 1, # optional, this option will create dynamic field values for the CSV file
        Priority                 => 123,
        UserID                   => 123,
    );

Returns ID of created record on success.

    my $ID = 1;

=cut

sub AddTicketAttributeRelations {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(Filename Data Priority UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $IsExcelFilename = $Self->_IsExcelFilename( Filename => $Param{Filename} );
    if ($IsExcelFilename) {
        $Param{Data} = MIME::Base64::encode_base64( $Param{Data} );
    }

    my $ParsedData = $Self->_ParseTicketAttributeRelationsData(
        Filename => $Param{Filename},
        Data     => $Param{Data},
        UserID   => $Param{UserID},
    );

    return if !IsHashRefWithData($ParsedData);
    return if !$ParsedData->{Attribute1};
    return if !$ParsedData->{Attribute2};
    return if !IsArrayRefWithData( $ParsedData->{Data} );

    my $TempPriority = $Self->_GenerateTemporaryPriority(
        Priority => $Param{Priority},
    );

    $Self->_PreReorderTicketAttributeRelationsPriorities();

    return if !$DBObject->Do(
        SQL => '
        INSERT INTO
            acl_ticket_attribute_relations
                (filename, attribute_1, attribute_2, acl_data, priority, create_time, create_by, change_time, change_by)
            VALUES
                (?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Filename}, \$ParsedData->{Attribute1}, \$ParsedData->{Attribute2}, \$Param{Data},
            \$TempPriority,
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    $Self->_PostReorderTicketAttributeRelationsPriorities();

    return if !$DBObject->Prepare(
        SQL   => 'SELECT id FROM acl_ticket_attribute_relations WHERE filename = ?',
        Bind  => [ \$Param{Filename} ],
        Limit => 1,
    );

    my $ID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ID = $Row[0];
    }

    $CacheObject->CleanUp(
        Type => $Self->{CacheType},
    );

    return $ID if !$Param{DynamicFieldConfigUpdate};

    $Self->_UpdateDynamicFieldConfigs(
        TicketAttributeRelationsID => $ID,
        UserID                     => $Param{UserID},
    );

    return $ID;
}

=head2 ExistsTicketAttributeRelationsFilename()

Checks if a ticket attribute relations record with the given filename exists.

    my $ID = $TicketAttributeRelationsObject->ExistsTicketAttributeRelationsFilename(
        Filename => 'test1.csv',
    );

Returns the ID of the found record or 0 if not found.

    my $ID = 1;

=cut

sub ExistsTicketAttributeRelationsFilename {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(Filename)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $CacheKey = 'ExistsTicketAttributeRelationsFilename::' . $Param{Filename};
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if defined $Cache;

    return if !$DBObject->Prepare(
        SQL => '
            SELECT id
            FROM   acl_ticket_attribute_relations
            WHERE  filename = ?',
        Bind  => [ \$Param{Filename} ],
        Limit => 1,
    );

    my $ID = 0;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ID = $Row[0];
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => $ID,
    );

    return $ID;
}

=head2 GetTicketAttributeRelations()

Fetches a ticket attribute relations record.

    my $TicketAttributeRelations = $TicketAttributeRelationsObject->GetTicketAttributeRelations(
        ID         => 123,
        # or
        # Filename => 'test.csv',
        UserID     => 1,
    );

Returns:

    my $TicketAttributeRelations = {
        ID         => 41,
        Filename   => 'csv-filename.csv',
        Priority   => 4,
        Attribute1 => 'Queue',
        Attribute2 => 'DynamicField_test',
        Data       => [
            {
                'Queue'             => 'abc',
                'DynamicField_test' => 'bcd',
            },
        ],
        RawData     => '...', # original content of uploaded file
        CreatedTime => '...',
        CreatedBy   => 2,
        ChangeTime  => '...',
        ChangedBy   => 4,
    };

=cut

sub GetTicketAttributeRelations {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');
    my $JSONObject   = $Kernel::OM->Get('Kernel::System::JSON');

    NEEDED:
    for my $Needed (qw(UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    if (
        ( exists $Param{ID} && exists $Param{Filename} )
        || ( !$Param{ID} && !IsStringWithData( $Param{Filename} ) )
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Either parameter "ID" or "Filename" has to be given.',
        );
        return;
    }

    # Look up ID of for given filename.
    my $ID = $Param{ID};
    if ( !$ID && IsStringWithData( $Param{Filename} ) ) {
        $ID = $Self->ExistsTicketAttributeRelationsFilename( Filename => $Param{Filename} );
    }

    my $CacheKey = 'GetTicketAttributeRelations::' . $ID;
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if ref $Cache eq 'HASH';

    return if !$DBObject->Prepare(
        SQL => '
            SELECT
                id, filename, attribute_1, attribute_2, acl_data, priority,
                create_time, create_by, change_time, change_by
            FROM
                acl_ticket_attribute_relations
            WHERE
                id = ?',
        Bind  => [ \$ID ],
        Limit => 1,
    );

    my %Data;
    TICKETATTRIBUTERELATIONS:
    while ( my @Data = $DBObject->FetchrowArray() ) {
        my $Data = $Data[4];
        $EncodeObject->EncodeOutput( \$Data );

        my $ParsedData = $Self->_ParseTicketAttributeRelationsData(
            Filename => $Data[1],
            Data     => $Data,
            UserID   => $Param{UserID},
        );
        next TICKETATTRIBUTERELATIONS if !IsHashRefWithData($ParsedData);
        next TICKETATTRIBUTERELATIONS if !IsArrayRefWithData( $ParsedData->{Data} );

        my $RawData         = $Data[4];
        my $IsExcelFilename = $Self->_IsExcelFilename( Filename => $Data[1] );
        if ($IsExcelFilename) {
            $RawData = MIME::Base64::decode_base64($RawData);
        }

        %Data = (
            ID          => $Data[0],
            Filename    => $Data[1],
            Attribute1  => $Data[2],
            Attribute2  => $Data[3],
            Data        => $ParsedData->{Data},
            RawData     => $RawData,
            Priority    => $Data[5],
            CreatedTime => $Data[6],
            CreatedBy   => $Data[7],
            ChangeTime  => $Data[8],
            ChangedBy   => $Data[9],
        );
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Data,
    );

    return \%Data;
}

=head2 UpdateTicketAttributeRelations()

Updates an existing ticket attribute relations record.

    my $Success = $TicketAttributeRelationsObject->UpdateTicketAttributeRelations(
        ID                       => 123,
        Filename                 => 'csv-filename.csv',
        Data                     => 'Data from CSV or Excel file',
        DynamicFieldConfigUpdate => 1, # optional, this option will create dynamic field values for the csv file
        Priority                 => 123,
        UserID                   => 123,
    );

Returns true value on success.

    my $Success = 1;

=cut

sub UpdateTicketAttributeRelations {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    NEEDED:
    for my $Needed (qw(ID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $TicketAttributeRelations = $Self->GetTicketAttributeRelations(
        ID     => $Param{ID},
        UserID => $Param{UserID},
    );
    if ( !IsHashRefWithData($TicketAttributeRelations) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Ticket attribute relations with ID $Param{ID} not found.",
        );
        return;
    }

    my @SQLSet;
    my @Bind;

    if ( $Param{Filename} && $Param{Data} ) {
        my $IsExcelFilename = $Self->_IsExcelFilename( Filename => $Param{Filename} );
        if ($IsExcelFilename) {
            $Param{Data} = MIME::Base64::encode_base64( $Param{Data} );
        }

        my $ParsedData = $Self->_ParseTicketAttributeRelationsData(
            Filename => $Param{Filename},
            Data     => $Param{Data},
            UserID   => $Param{UserID},
        );

        return if !IsHashRefWithData($ParsedData);
        return if !$ParsedData->{Attribute1};
        return if !$ParsedData->{Attribute2};
        return if !IsArrayRefWithData( $ParsedData->{Data} );

        push @SQLSet, (
            'filename = ?',
            'attribute_1 = ?',
            'attribute_2 = ?',
            'acl_data = ?',
        );

        push @Bind, (
            \$Param{Filename},
            \$ParsedData->{Attribute1},
            \$ParsedData->{Attribute2},
            \$Param{Data},
        );
    }

    if ( $Param{Priority} ) {
        my $Priority = $Self->_GenerateTemporaryPriority(
            Priority         => int $Param{Priority},
            PreviousPriority => $TicketAttributeRelations->{Priority},
        );

        push @SQLSet, 'priority = ?';
        push @Bind,   \$Priority;
    }

    return if !@SQLSet;

    push @Bind, \$Param{ID};

    $Self->_PreReorderTicketAttributeRelationsPriorities();

    return if !$DBObject->Do(
        SQL => 'UPDATE acl_ticket_attribute_relations SET '
            . join( ', ', @SQLSet )
            . ', change_time = current_timestamp WHERE id = ?',
        Bind => \@Bind,
    );

    $Self->_PostReorderTicketAttributeRelationsPriorities();

    $CacheObject->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1 if !$Param{DynamicFieldConfigUpdate};

    $Self->_UpdateDynamicFieldConfigs(
        TicketAttributeRelationsID => $Param{ID},
        UserID                     => $Param{UserID},
    );

    return 1;
}

=head2 GetAllTicketAttributeRelations()

Fetches data of all ticket attribute relation records, sorted by priority.

    my $TicketAttributeRelations = $TicketAttributeRelationsObject->GetAllTicketAttributeRelations(
        UserID => 123,
    );

Returns:

    my $TicketAttributeRelations = [
        {
            ID         => 41,
            Filename   => 'csv-filename.csv',
            Priority   => 1,
            Attribute1 => 'Queue',
            Attribute2 => 'DynamicField_test',
            Data       => [
                {
                    'Queue'             => 'abc',
                    'DynamicField_test' => 'bcd',
                },
            ],
            RawData     => '...', # original content of uploaded file
            CreatedTime => '...',
            CreatedBy   => 2,
            ChangeTime  => '...',
            ChangedBy   => 4,
        },
        {
            ID         => 7,
            Filename   => 'csv-filename-2.csv',
            Priority   => 2,
            Attribute1 => 'Queue',
            Attribute2 => 'DynamicField_test',
            Data       => [
                {
                    'Queue'             => 'abc',
                    'DynamicField_test' => 'bcd',
                },
            ],
            RawData     => '...' # original content of uploaded file
            CreatedTime => '...',
            CreatedBy   => 2,
            ChangeTime  => '...',
            ChangedBy   => 4,
        },
        # ...
    ];

=cut

sub GetAllTicketAttributeRelations {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $CacheKey = 'GetAllTicketAttributeRelations';
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return $Cache if ref $Cache eq 'ARRAY';

    return if !$DBObject->Prepare(
        SQL => '
            SELECT   id
            FROM     acl_ticket_attribute_relations
            ORDER BY priority ASC
        ',
    );

    my @TicketAttributeRelationsIDs;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @TicketAttributeRelationsIDs, $Row[0];
    }

    my @TicketAttributeRelations;
    TICKETATTRIBUTERELATIONSID:
    for my $TicketAttributeRelationsID (@TicketAttributeRelationsIDs) {
        my $TicketAttributeRelations = $Self->GetTicketAttributeRelations(
            ID     => $TicketAttributeRelationsID,
            UserID => $Param{UserID}
        );
        next TICKETATTRIBUTERELATIONSID if !IsHashRefWithData($TicketAttributeRelations);

        push @TicketAttributeRelations, $TicketAttributeRelations;
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@TicketAttributeRelations,
    );

    return \@TicketAttributeRelations;
}

=head2 DeleteTicketAttributeRelations()

Deletes a ticket attribute relations record.

    my $Success = $TicketAttributeRelationsObject->DeleteTicketAttributeRelations(
        ID     => 123,
        UserID => 123,
    );

Returns true value on success.

    my $Success = 1;

=cut

sub DeleteTicketAttributeRelations {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(ID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    return if !$DBObject->Do(
        SQL  => 'DELETE FROM acl_ticket_attribute_relations WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

    $CacheObject->CleanUp(
        Type => $Self->{CacheType},
    );

    $Self->_PostReorderTicketAttributeRelationsPriorities();

    return 1;
}

=head2 _ParseTicketAttributeRelationsData()

Parses stored ticket attribute relation data.

    my $ParsedData = $TicketAttributeRelationsObject->_ParseTicketAttributeRelationsData(
        Filename => 'csv_file1.csv', # or Excel file
        Data     => 'Data...',
        UserID   => 123,
    );

Returns:

    my $ParsedData = {
        Attribute1 => 'DynamicField1',
        Attribute2 => 'DynamicField2',
        Data => [
            {
                'DynamicField1' => 'abc',
                'DynamicField2' => 'bcd',
            },
            # ...
        ],
    };

=cut

sub _ParseTicketAttributeRelationsData {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $CSVObject    = $Kernel::OM->Get('Kernel::System::CSV');
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    NEEDED:
    for my $Needed (qw(Filename Data UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $ParsedData;

    my $IsExcelFilename = $Self->_IsExcelFilename( Filename => $Param{Filename} );
    if ($IsExcelFilename) {
        $ParsedData = $Self->_Excel2ArrayTicketAttributeRelationsData(
            Data => $Param{Data},
        );
    }
    else {
        my $StringWithoutBOM = $EncodeObject->RemoveUTF8BOM( String => $Param{Data} );
        $ParsedData = $CSVObject->CSV2Array(
            String => $StringWithoutBOM,
        );
    }
    return if !IsArrayRefWithData($ParsedData);

    my @Attributes = @{ shift @{$ParsedData} };
    if ( @Attributes != 2 ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Given ticket attribute relations data must have two columns.',
        );
        return;
    }

    my @Data;

    ROW:
    for my $Row ( @{$ParsedData} ) {
        my %Data;
        for my $AttributeIndex ( 0 .. @Attributes - 1 ) {
            $Data{ $Attributes[$AttributeIndex] } = $Row->[$AttributeIndex];
        }
        next ROW if !%Data;

        push @Data, \%Data;
    }

    my %ParsedData = (
        Attribute1 => $Attributes[0],
        Attribute2 => $Attributes[1],
        Data       => \@Data,
    );

    return \%ParsedData;
}

=head2 _GenerateTemporaryPriority()

Generates a temporary priority for the given priority to be able to resort priorities
of all existing ticket attribute relation records.

    my $TempPriority = $TicketAttributeRelationsObject->_GenerateTemporaryPriority(
        Priority         => 5,
        PreviousPriority => 7, # optional
    );

Returns:

    my $TempPriority = 50; # or 52 (see explanation below)

=cut

sub _GenerateTemporaryPriority {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Priority)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need '$Needed'!",
        );
        return;
    }

    my $Priority         = int( $Param{Priority} );
    my $PreviousPriority = int( $Param{PreviousPriority} // 0 );

    #
    # Explanation:
    #
    # 1. Adding ticket attribute relations
    # 1.1 Existing elements have prio 1, 2 and 3.
    # 1.2 New element will have priority 2.
    # 1.3 Temp priority for new element will be 20 (see code below).
    # 1.4 _PreReorderTicketAttributeRelationsPriorities will set prio of existing elements to:
    #     1 => 11
    #     2 => 21
    #     3 => 31
    # 1.5 New element will be stored with prio 20 (see 1.3)
    # 1.6 _PostReorderTicketAttributeRelationsPriorities will set final prio after ordering by
    #     prios of 1.4 and 1.5, so : 11, 20, 21, 31 will become 1, 2, 3, 4. New element has prio 2.
    # 1.7 The same goes for adding an element to the end of the current list by selecting unused prio 4.
    #     11, 21, 31, 40 => 1, 2, 3, 4
    #
    # 2. Updating existing ticket attribute relations
    # 2.1 Existing elements have prio 1, 2 and 3.
    #
    # 2.2 Priority of element changes from 3 to 1 ("goes up") (parameter PreviousPriority has to be given)
    # 2.2.1 Temp priority for element will be 10
    # 2.2.2 _PreReorderTicketAttributeRelationsPriorities will set prio of existing elements to:
    #       1 => 11
    #       2 => 21
    #       3 => 31
    # 2.2.3 Updated element will be stored with prio 10 (see 2.2.1)
    # 2.2.4 _PostReorderTicketAttributeRelationsPriorities will set final prio after ordering by
    #       prios of 2.2.2 and 2.2.3, so : 10, 11, 21 will become 1, 2, 3. Changed element has prio 1.
    #
    # 2.3 Priority of element changes from 1 to 2 ("goes down") (parameter PreviousPriority has to be given)
    # 2.3.1 Temp priority for element will be 22
    # 2.3.2 _PreReorderTicketAttributeRelationsPriorities will set prio of existing elements to:
    #       1 => 11
    #       2 => 21
    #       3 => 31
    # 2.3.3 Updated element will be stored with prio 22 (see 2.3.1)
    # 2.3.4 _PostReorderTicketAttributeRelationsPriorities will set final prio after ordering by
    #       prios of 2.3.2 and 2.3.3, so : 21, 22, 31 will become 1, 2, 3. Changed element has prio 2.
    #

    my $TempPriority = $Priority * 10;
    if ( $PreviousPriority && $Priority > $PreviousPriority ) {
        $TempPriority += 2;
    }

    return $TempPriority;
}

=head2 _PreReorderTicketAttributeRelationsPriorities()

Temporarily updates priorities of all ticket attribute relations to be able to resort them later.
For explanation, see _GenerateTemporaryPriority().

    $TicketAttributeRelationsObject->_PreReorderTicketAttributeRelationsPriorities();

Returns true value on success.

    my $Success = 1;

=cut

sub _PreReorderTicketAttributeRelationsPriorities {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Do(
        SQL => 'UPDATE acl_ticket_attribute_relations SET priority = (priority * 10 + 1)',
    );

    $CacheObject->CleanUp(
        Type => 'TicketAttributeRelations',
    );

    return 1;
}

=head2 _PostReorderTicketAttributeRelationsPriorities()

Updates priorities of all ticket attribute relations to finalize resorting.
For explanation, see _GenerateTemporaryPriority().

    $TicketAttributeRelationsObject->_PostReorderTicketAttributeRelationsPriorities();

Returns true value on success.

    my $Success = 1;

=cut

sub _PostReorderTicketAttributeRelationsPriorities {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => 'SELECT id, priority FROM acl_ticket_attribute_relations',
    );

    my %RelationID2Priority;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $RelationID2Priority{ $Row[0] } = $Row[1];
    }

    my $Priority = 1;
    for my $RelationID ( sort { $RelationID2Priority{$a} <=> $RelationID2Priority{$b} } keys %RelationID2Priority ) {
        return if !$DBObject->Do(
            SQL  => 'UPDATE acl_ticket_attribute_relations SET priority = ? WHERE id = ?',
            Bind => [ \$Priority, \$RelationID ],
        );

        $Priority++;
    }

    $CacheObject->CleanUp(
        Type => 'TicketAttributeRelations',
    );

    return 1;
}

=head2 _UpdateDynamicFieldConfigs()

Updates the dynamic field configuration based on the ticket attribute relation configuration.

    my $Success = $TicketAttributeRelationsObject->_UpdateDynamicFieldConfigs(
        TicketAttributeRelationsID => 123,
        UserID                     => 123,
    );

Returns true value on success.

    my $Success = 1;

=cut

sub _UpdateDynamicFieldConfigs {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $LogObject                 = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(TicketAttributeRelationsID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $TicketAttributeRelations = $Self->GetTicketAttributeRelations(
        ID     => $Param{TicketAttributeRelationsID},
        UserID => 1,
    );
    return if !IsHashRefWithData($TicketAttributeRelations);

    my @Attributes = ( $TicketAttributeRelations->{Attribute1}, $TicketAttributeRelations->{Attribute2} );

    ATTRIBUTE:
    for my $Attribute (@Attributes) {
        next ATTRIBUTE if $Attribute !~ m{\ADynamicField_(.*)}i;

        my $DynamicFieldName = $1;

        my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => $DynamicFieldName,
        );

        if ( !IsHashRefWithData($DynamicFieldConfig) ) {
            my $DynamicFieldNameLength = length $DynamicFieldName;

            $LogObject->Log(
                Priority => 'error',
                Message =>
                    "Could not find dynamic field '$DynamicFieldName' (length of name in in ticket attribute relations"
                    . " with ID $Param{TicketAttributeRelationsID}: $DynamicFieldNameLength). Please check the encoding of the stored data."
                    . " This can e.g. happen with a UTF-16 encoded file with an invisible 0xfeff character"
                    . " (https://www.freecodecamp.org/news/a-quick-tale-about-feff-the-invisible-character-cd25cd4630e7/).",
            );
            return;
        }

        my $DynamicFieldBackend = 'DynamicField' . $DynamicFieldConfig->{FieldType} . 'Object';
        if ( !$DynamicFieldBackendObject->{$DynamicFieldBackend} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Dynamic field backend $Param{DynamicFieldConfig}->{FieldType} is invalid!"
            );
            return;
        }

        my $CanPossibleValuesGet = $DynamicFieldBackendObject->{$DynamicFieldBackend}->can('PossibleValuesGet');
        if ( !$CanPossibleValuesGet ) {
            $LogObject->Log(
                Priority => 'error',
                Message =>
                    "Dynamic field backend $Param{DynamicFieldConfig}->{FieldType} is missing function PossibleValuesGet.",
            );
            return;
        }

        $DynamicFieldConfig->{Config}->{PossibleValues} //= {};
        ENTRY:
        for my $Entry ( @{ $TicketAttributeRelations->{Data} // [] } ) {
            my $Value = $Entry->{$Attribute};

            next ENTRY if !IsStringWithData($Value);
            next ENTRY if $Value eq '-';
            next ENTRY if $DynamicFieldConfig->{Config}->{PossibleValues}->{$Value};

            $DynamicFieldConfig->{Config}->{PossibleValues}->{$Value} = $Value;
        }

        my $DynamicFieldUpdateSuccess = $DynamicFieldObject->DynamicFieldUpdate(
            %{$DynamicFieldConfig},
            UserID => 1,
        );

        if ( !$DynamicFieldUpdateSuccess ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Could not update dynamic field config for dynamic field '$DynamicFieldName'.",
            );
            return;
        }
    }

    return 1;
}

=head2 _IsExcelFilename()

Checks if the given filename has an Excel extension.

    my $IsExcelFilename = $TicketAttributeRelationsObject->_IsExcelFilename(
        Filename => 'test.xlsx',
    );

Returns true value if the given name has an Excel extension.

    my $IsExcelFilename = 1;

=cut

sub _IsExcelFilename {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Filename)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return 1 if $Param{Filename} =~ m{\.xlsx\z}i;
    return;
}

=head2 _Excel2ArrayTicketAttributeRelationsData()

Returns an array for the given Excel file data.

    my $Data = $TicketAttributeRelationsObject->_Excel2ArrayTicketAttributeRelationsData(
        Data => '...',
    );

Returns:

    my $Data = [
        {
            'DynamicField1' => 'abc',
            'DynamicField2' => 'bcd',
        },
        # ...
    ],

=cut

sub _Excel2ArrayTicketAttributeRelationsData {
    my ( $Self, %Param ) = @_;

    my $FileTempObject = $Kernel::OM->Get('Kernel::System::FileTemp');
    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject     = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(Data)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $ExcelFileSupportAvailable = $MainObject->Require(
        'Spreadsheet::XLSX',
        Silent => 1,
    );
    if ( !$ExcelFileSupportAvailable ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Excel file cannot be parsed because Perl module "Spreadsheet::XLSX" is missing.',
        );
        return;
    }

    my $Data = $Param{Data};
    $Data = MIME::Base64::decode_base64($Data);

    my ( $FH, $TempFilePath ) = $FileTempObject->TempFile();

    my $FileLocation = $MainObject->FileWrite(
        Location => $TempFilePath,
        Content  => \$Data,
        Mode     => 'binmode',
    );

    if ( !$FileLocation ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Could not create temporary file for Excel data.',
        );
        return;
    }

    my $ExcelFile;
    eval {
        $ExcelFile = Spreadsheet::XLSX->new($TempFilePath);
    };
    return if !$ExcelFile;

    my ($FirstWorksheet) = @{ $ExcelFile->{Worksheet} // [] };
    return if !$FirstWorksheet;

    my @Data;
    ROW:
    for my $Row ( 0 .. $FirstWorksheet->{MaxRow} ) {
        $FirstWorksheet->{MaxCol} ||= $FirstWorksheet->{MinCol};

        my $CurrentRow = $FirstWorksheet->{Cells}->[$Row];

        next ROW if !$CurrentRow->[0]->{Val};
        next ROW if !$CurrentRow->[1]->{Val};

        for my $Index ( 0 .. 1 ) {
            $CurrentRow->[$Index]->{Val} = $Self->_ImportExcelValue( $CurrentRow->[$Index]->{Val} );
        }

        my @Entry;
        push @Entry, $CurrentRow->[0]->{Val};
        push @Entry, $CurrentRow->[1]->{Val};

        push @Data, \@Entry;
    }

    return \@Data;
}

=head2 _ImportExcelValue()

Encodes the given imported Excel file value and converts it too ASCII.

    my $ImportedValue = $TicketAttributeRelationsObject->_ImportExcelValue($Value);

    Returns encoded/converted value.

=cut

sub _ImportExcelValue {
    my ( $Self, $Value ) = @_;

    my $EncodeObject    = $Kernel::OM->Get('Kernel::System::Encode');
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    return $Value if !IsStringWithData($Value);

    my $ImportedValue = $Value;

    $EncodeObject->EncodeInput( \$ImportedValue );
    return $Value if !IsStringWithData($ImportedValue);

    $ImportedValue = $HTMLUtilsObject->ToAscii( String => $ImportedValue );

    return $ImportedValue;
}

1;
