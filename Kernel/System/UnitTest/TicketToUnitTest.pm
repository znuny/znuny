# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# $origin: otrs - 0000000000000000000000000000000000000000 - Kernel/System/UnitTest/TicketToUnitTest.pm
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::TicketToUnitTest;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::State',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
    'Kernel::System::Type',
    'Kernel::System::UnitTest::Helper',
    'Kernel::System::User',
    'Kernel::System::ZnunyHelper',
);

=head1 NAME

Kernel::System::UnitTest::TicketToUnitTest - creates unittest

=head1 SYNOPSIS

All TicketToUnitTest functions

=head1 PUBLIC INTERFACE

=head2 new()

creates an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TicketToUnitTestObject = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

=head2 CreateUnitTest()

This function creates a unittest

    my $Output = $TicketToUnitTestObject->CreateUnitTest(
        TicketID => 123456,
    );

Returns:

    my $Output = 'UNITTEST-OUTPUT';

=cut

sub CreateUnitTest {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(TicketID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Header        = $Self->GetHeader();
    my $TicketHistory = $Self->GetTicketHistory(%Param);

    my $CreateObjects = $Self->GetCreateObjects( %{ $Self->{TicketAttributes} } );
    my $NeededObjects = $Self->GetNeededObjects( %{ $Self->{TicketAttributes} } );
    my $Footer        = $Self->GetFooter();

    my $UnitTest = $Header;
    $UnitTest .= $NeededObjects;
    $UnitTest .= $CreateObjects;
    $UnitTest .= $TicketHistory;
    $UnitTest .= $Footer;

    return $UnitTest;

}

=head2 GetHeader()

Creates the unittest header

    my $Output = $TicketToUnitTestObject->GetHeader();

Returns:

    my $Output = 'UNITTEST-HEADER';

=cut

sub GetHeader {
    my ( $Self, %Param ) = @_;

    my $Header = <<'HEADER';
# ---
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# ---
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# ---

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreSystemConfiguration => 1,
        RestoreDatabase            => 1,
    },
);

my $UserID = 1;
my $Success;
my $TempValue;
my $ArticleID;

HEADER

    return $Header;
}

=head2 GetNeededObjects()

This function creates the needed OM objects

    my $Output = $TicketToUnitTestObject->GetNeededObjects();

Returns:

    my $Output = '
        my $HelperObject       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
        my $ZnunyHelperObject  = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
        my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
        my $BackendObject      = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
        my $TimeObject         = $Kernel::OM->Get('Kernel::System::Time');
    ';

=cut

sub GetNeededObjects {
    my ( $Self, %Param ) = @_;

    my $Objects = <<'OBJECTS';
my $HelperObject       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
my $ZnunyHelperObject  = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
my $BackendObject      = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
my $TimeObject         = $Kernel::OM->Get('Kernel::System::Time');

OBJECTS

    return $Objects;
}

=head2 GetCreateObjects()

This function creates the needed objects

    my $Output = $TicketToUnitTestObject->GetCreateObjects();

Returns:

    my $Output = '
        ## Service 'Test'

        $ZnunyHelperObject->_ServiceCreateIfNotExists(
            Name => 'Test',
        );

        [...]
    ';

=cut

sub GetCreateObjects {
    my ( $Self, %TicketAttributes ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $Output;
    my $ModulOutput;

    ATTRIBUTE:
    for my $TicketAttribute ( sort { "\L$a" cmp "\L$b" } keys %TicketAttributes ) {

        my $Module       = "Kernel::System::UnitTest::TicketToUnitTest::TicketObject::$TicketAttribute";
        my $LoadedModule = $MainObject->Require(
            $Module,
            Silent => 1,
        );

        if ( !$LoadedModule ) {
            $Output .= "# ATTENTION: Can't find modul for '$TicketAttribute'\n\n";
            next ATTRIBUTE;
        }

        $ModulOutput = $Kernel::OM->Get($Module)->Run(
            %TicketAttributes
        );

        next ATTRIBUTE if !$ModulOutput;
        $Output .= $ModulOutput;
    }

    return $Output;
}

=head2 GetTicketHistory()

This function creates the all needed history 'actions'

=cut

sub GetTicketHistory {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    my $CurrentSystemTime = 0;
    my %TicketAttributes;

    my @HistoryLines = $TicketObject->HistoryGet(
        TicketID => $Param{TicketID},
        UserID   => 1,
    );

    my $Output = "# Create ticket history entries\n";

    LINE:
    for my $HistoryLine (@HistoryLines) {

        my $TimeStamp  = $HistoryLine->{CreateTime};
        my $SystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $TimeStamp,
        );

        my %HistoryTicket = $Self->SystemTimeTicketGet(
            TicketID   => $Param{TicketID},
            SystemTime => $SystemTime,
        );

        if ( $CurrentSystemTime < $SystemTime ) {

            $CurrentSystemTime = $SystemTime;

            my $TimeSetOutput = <<TIMESET;

# $TimeStamp
\$HelperObject->FixedTimeSet($SystemTime);
TIMESET

            $Output .= $TimeSetOutput . "\n";
        }

        $Output .= "# HistoryType: '$HistoryLine->{HistoryType}' - $HistoryLine->{Name}\n";

        # get all ticket attributes of the current history entry and merge to existing
        %TicketAttributes = $Self->GetTicketAttributes(
            TicketAttributes => \%TicketAttributes,
            HistoryTicket    => \%HistoryTicket,
        );

        my $Module       = "Kernel::System::UnitTest::TicketToUnitTest::HistoryType::$HistoryLine->{HistoryType}";
        my $LoadedModule = $MainObject->Require(
            $Module,
            Silent => 1,
        );

        if ( !$LoadedModule ) {
            $Output .= "# ATTENTION: Can't find modul for '$HistoryLine->{HistoryType}' Entry - $HistoryLine->{Name}\n";
            next LINE;
        }

        my $ModulOutput = $Kernel::OM->Get($Module)->Run(
            %{$HistoryLine},
            %HistoryTicket,
        );

        next LINE if !$ModulOutput;
        $Output .= $ModulOutput;

    }

    %{ $Self->{TicketAttributes} } = %TicketAttributes;

    return $Output;
}

=head2 GetTicketAttributes()

This function creates an hash of all ticket attributes of current history entry

    my %TicketAttributes = $TicketToUnitTestObject->GetTicketAttributes(
        TicketAttributes => \%TicketAttributes,
        HistoryTicket    => \%HistoryTicket,
    );

Returns:

    my %TicketAttributes = {
        'State' => [
           'pending reminder',
           'open',
           'closed successful'
        ],
        'Queue' => [
            'Junk',
            'Misc',
        ],
        'Priority' => [
            '3 normal'
        ],
        'DynamicField' => [
            'Field1',
        ],
        'User' => [
            'root@localhost'
        ],
        'SLA' => [
            'SLA 1',
            'SLA 2',
        ],
        'Service' => [
            'Service F',
            'Service B'
        ],
        'Type' => [
            'Unclassified'
        ],
        'CustomerUser' => [
            'Customer',
            'Customer2'
        ]
    };

=cut

sub GetTicketAttributes {
    my ( $Self, %Param ) = @_;

    my %TicketAttributes = %{ $Param{TicketAttributes} };
    my %HistoryTicket    = %{ $Param{HistoryTicket} };

    # creates list of needed ticket attributes
    ATTRIBUTE:
    for my $Attribute (qw(Queue Type State Priority Owner Responsible CustomerUser Service SLA DynamicField)) {

        my $AttributeKeyStore = $Attribute;

        if ( $Attribute eq "Responsible" || $Attribute eq "Owner" ) {
            $AttributeKeyStore = "User";
        }

        # all attributes above without ID Time
        my $RegEx = qr/^$Attribute(?!ID|Time)(_.+)*$/;

        my @AttributeKeys = grep {/$RegEx/} keys %HistoryTicket;

        for my $Key (@AttributeKeys) {
            next ATTRIBUTE if !$HistoryTicket{$Key};
            next ATTRIBUTE if $HistoryTicket{$Key} eq 'NULL';

            my $Value = $HistoryTicket{$Key};

            if ( $AttributeKeyStore eq 'DynamicField' ) {
                $Value = $Key;
                $Value =~ s/DynamicField_//;
            }

            next ATTRIBUTE if grep { $Value eq $_ } @{ $TicketAttributes{$AttributeKeyStore} };
            push @{ $TicketAttributes{$AttributeKeyStore} }, $Value;
        }
    }

    return %TicketAttributes;
}

=head2 GetFooter()

Creates the unittest Footer.

    my $Output = $TicketToUnitTestObject->GetFooter();

Returns:

    my $Output = 'UNITTEST-Footer';

=cut

sub GetFooter {
    my ( $Self, %Param ) = @_;

    my $Footer = <<'FOOTER';
# TODO: Remove if not needed anymore
# Otherwise the HelperObject won't
# delete the Ticket
delete $HelperObject->{TestTickets};

FOOTER

    return $Footer;
}

=head2 SystemTimeTicketGet()

Returns the HistoryTicketGet for a given SystemTime and TicketID.

    my %HistoryData = $BaseObject->SystemTimeTicketGet(
        SystemTime => 19435456436,
        TicketID   => 123,
        Force      => 0, # cache
    );

    %HistoryData = (
        TicketID                => 'TicketID',
        Type                    => 'Type',
        TypeID                  => 'TypeID',
        Queue                   => 'Queue',
        QueueID                 => 'QueueID',
        Priority                => 'Priority',
        PriorityID              => 'PriorityID',
        State                   => 'State',
        StateID                 => 'StateID',
        Owner                   => 'Owner',
        OwnerID                 => 'OwnerID',
        CreateUserID            => 'CreateUserID',
        CreateTime (timestamp)  => 'CreateTime (timestamp)',
        CreateOwnerID           => 'CreateOwnerID',
        CreatePriority          => 'CreatePriority',
        CreatePriorityID        => 'CreatePriorityID',
        CreateState             => 'CreateState',
        CreateStateID           => 'CreateStateID',
        CreateQueue             => 'CreateQueue',
        CreateQueueID           => 'CreateQueueID',
        LockFirst (timestamp)   => 'LockFirst (timestamp)',
        LockLast (timestamp)    => 'LockLast (timestamp)',
        UnlockFirst (timestamp) => 'UnlockFirst (timestamp)',
        UnlockLast (timestamp)  => 'UnlockLast (timestamp)'
    );

=cut

sub SystemTimeTicketGet {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(TicketID SystemTime)) {
        next NEEDED if $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed in SystemTimeTicketGet!"
        );
        return;
    }

    my ( $Sec, $Min, $Hour, $Day, $Month, $Year ) = $TimeObject->SystemTime2Date(
        SystemTime => $Param{SystemTime},
    );

    return $Self->HistoryTicketGet(
        StopYear   => $Year,
        StopMonth  => $Month,
        StopDay    => $Day,
        StopHour   => $Hour,
        StopMinute => $Min,
        StopSecond => $Sec,
        TicketID   => $Param{TicketID},
        Force      => $Param{Force} || 0,    # 1: don't use cache
    );
}

=head2 HistoryTicketGet()

returns a hash of some of the ticket data
calculated based on ticket history info at the given date.

    my %HistoryData = $TicketObject->HistoryTicketGet(
        StopYear   => 2003,
        StopMonth  => 12,
        StopDay    => 24,
        StopHour   => 10, (optional, default 23)
        StopMinute => 0,  (optional, default 59)
        StopSecond => 0,  (optional, default 59)
        TicketID   => 123,
        Force      => 0,     # 1: don't use cache
    );

returns

    TicketNumber
    TicketID
    Type
    TypeID
    Queue
    QueueID
    Priority
    PriorityID
    State
    StateID
    Owner
    OwnerID
    CreateUserID
    CreateTime (timestamp)
    CreateOwnerID
    CreatePriority
    CreatePriorityID
    CreateState
    CreateStateID
    CreateQueue
    CreateQueueID
    LockFirst (timestamp)
    LockLast (timestamp)
    UnlockFirst (timestamp)
    UnlockLast (timestamp)
    CustomerID
    CustomerUser
    Service
    ServiceID
    SLA
    SLAID
    Type

=cut

sub HistoryTicketGet {
    my ( $Self, %Param ) = @_;

    my $StateObject  = $Kernel::OM->Get('Kernel::System::State');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');
    my $TypeObject   = $Kernel::OM->Get('Kernel::System::Type');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');

    my @ClosedStateList = $StateObject->StateGetStatesByType(
        StateType => ['closed'],
        Result    => 'Name',
    );

    # check needed stuff
    for my $Needed (qw(TicketID StopYear StopMonth StopDay)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # TODO
    $Self->{CacheType} = 'HistoryTicketGet' . $Param{TicketID};

    $Param{StopHour}   = defined $Param{StopHour}   ? $Param{StopHour}   : '23';
    $Param{StopMinute} = defined $Param{StopMinute} ? $Param{StopMinute} : '59';
    $Param{StopSecond} = defined $Param{StopSecond} ? $Param{StopSecond} : '59';

    # format month and day params
    for my $DateParameter (qw(StopMonth StopDay)) {
        $Param{$DateParameter} = sprintf( "%02d", $Param{$DateParameter} );
    }

    my $CacheKey = 'HistoryTicketGet::'
        . join( '::', map { ( $_ || 0 ) . "::$Param{$_}" } sort keys %Param );

    my $Cached = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    if ( ref $Cached eq 'HASH' && !$Param{Force} ) {
        return %{$Cached};
    }

    my $Time
        = "$Param{StopYear}-$Param{StopMonth}-$Param{StopDay} $Param{StopHour}:$Param{StopMinute}:$Param{StopSecond}";

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => '
            SELECT th.name, tht.name, th.create_time, th.create_by, th.ticket_id,
                th.article_id, th.queue_id, th.state_id, th.priority_id, th.owner_id, th.type_id
            FROM ticket_history th, ticket_history_type tht
            WHERE th.history_type_id = tht.id
                AND th.ticket_id = ?
                AND th.create_time <= ?
            ORDER BY th.create_time, th.id ASC',
        Bind  => [ \$Param{TicketID}, \$Time ],
        Limit => 3000,
    );

    my %Ticket;
    while ( my @Row = $DBObject->FetchrowArray() ) {

        if ( $Row[1] eq 'NewTicket' ) {
            if (
                $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)$/
                || $Row[0] =~ /Ticket=\[(.+?)\],.+?Q\=(.+?);P\=(.+?);S\=(.+?)/
                )
            {
                $Ticket{TicketNumber}   = $1;
                $Ticket{Queue}          = $2;
                $Ticket{CreateQueue}    = $2;
                $Ticket{Priority}       = $3;
                $Ticket{CreatePriority} = $3;
                $Ticket{State}          = $4;
                $Ticket{CreateState}    = $4;
                $Ticket{TicketID}       = $Row[4];
                $Ticket{Owner}          = 'root';
                $Ticket{CreateUserID}   = $Row[3];
                $Ticket{CreateTime}     = $Row[2];
            }
            else {

                # COMPAT: compat to 1.1
                # NewTicket
                $Ticket{TicketVersion} = '1.1';
                $Ticket{TicketID}      = $Row[4];
                $Ticket{CreateUserID}  = $Row[3];
                $Ticket{CreateTime}    = $Row[2];
            }
            $Ticket{CreateOwnerID}    = $Row[9] || '';
            $Ticket{CreatePriorityID} = $Row[8] || '';
            $Ticket{CreateStateID}    = $Row[7] || '';
            $Ticket{CreateQueueID}    = $Row[6] || '';
        }

        # COMPAT: compat to 1.1
        elsif ( $Row[1] eq 'PhoneCallCustomer' ) {
            $Ticket{TicketVersion} = '1.1';
            $Ticket{TicketID}      = $Row[4];
            $Ticket{CreateUserID}  = $Row[3];
            $Ticket{CreateTime}    = $Row[2];
        }
        elsif ( $Row[1] eq 'Move' ) {
            if (
                $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)/
                || $Row[0] =~ /^Ticket moved to Queue '(.+?)'/
                )
            {
                $Ticket{Queue} = $1;
            }
        }
        elsif (
            $Row[1] eq 'StateUpdate'
            || $Row[1] eq 'Close successful'
            || $Row[1] eq 'Close unsuccessful'
            || $Row[1] eq 'Open'
            || $Row[1] eq 'Misc'
            )
        {
            if (
                $Row[0]    =~ /^\%\%(.+?)\%\%(.+?)(\%\%|)$/
                || $Row[0] =~ /^Old: '(.+?)' New: '(.+?)'/
                || $Row[0] =~ /^Changed Ticket State from '(.+?)' to '(.+?)'/
                )
            {
                $Ticket{State}     = $2;
                $Ticket{StateTime} = $Row[2];

                my $IsClosedState = grep { $_ eq $2 } @ClosedStateList;
                if ($IsClosedState) {

                    # always last close time
                    $Ticket{CloseTime} = $Row[2];

                    # list of all close times
                    push @{ $Ticket{CloseTimes} }, $Row[2];
                }
            }
        }
        elsif ( $Row[1] eq 'TicketFreeTextUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)$/ ) {
                $Ticket{ 'Ticket' . $1 } = $2;
                $Ticket{ 'Ticket' . $3 } = $4;
                $Ticket{$1}              = $2;
                $Ticket{$3}              = $4;
            }
        }
        elsif ( $Row[1] eq 'TicketDynamicFieldUpdate' ) {

            # take care about different values between 3.3 and 4
            # 3.x: %%FieldName%%test%%Value%%TestValue1
            # 4.x: %%FieldName%%test%%Value%%TestValue1%%OldValue%%OldTestValue1
            if ( $Row[0] =~ /^\%\%FieldName\%\%(.+?)\%\%Value\%\%(.*?)(?:\%\%|$)/ ) {

                my $FieldName = $1;
                my $Value     = $2 || '';
                $Ticket{$FieldName} = $Value;
                $Ticket{"DynamicField_$FieldName"} = $Value;

                # Backward compatibility for TicketFreeText and TicketFreeTime
                if ( $FieldName =~ /^Ticket(Free(?:Text|Key)(?:[?:1[0-6]|[1-9]))$/ ) {

                    # Remove the leading Ticket on field name
                    my $FreeFieldName = $1;
                    $Ticket{$FreeFieldName} = $Value;
                }
            }
        }
        elsif ( $Row[1] eq 'PriorityUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)\%\%(.+?)\%\%(.+?)/ ) {
                $Ticket{Priority} = $3;
            }
        }
        elsif ( $Row[1] eq 'OwnerUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)/ || $Row[0] =~ /^New Owner is '(.+?)'/ ) {
                $Ticket{Owner} = $1;
            }
        }
        elsif ( $Row[1] eq 'Lock' ) {
            if ( !$Ticket{LockFirst} ) {
                $Ticket{LockFirst} = $Row[2];
            }
            $Ticket{LockLast} = $Row[2];
        }
        elsif ( $Row[1] eq 'Unlock' ) {
            if ( !$Ticket{UnlockFirst} ) {
                $Ticket{UnlockFirst} = $Row[2];
            }
            $Ticket{UnlockLast} = $Row[2];
        }
        elsif ( $Row[1] eq 'CustomerUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\=(.+?)\;(.+?)\=(.+?)\;/ ) {
                $Ticket{CustomerID}   = $2;
                $Ticket{CustomerUser} = $4;
            }
        }
        elsif ( $Row[1] eq 'ServiceUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.*?)\%\%(.*?)\%\%(.*?)\%\%/ ) {
                $Ticket{Service}   = $1;
                $Ticket{ServiceID} = $2;
            }
        }
        elsif ( $Row[1] eq 'SLAUpdate' ) {

            if ( $Row[0] =~ /^\%\%(.*?)\%\%(.*?)\%\%(.*?)\%\%/ ) {
                $Ticket{SLA}   = $1;
                $Ticket{SLAID} = $2;
            }
        }
        elsif ( $Row[1] eq 'ResponsibleUpdate' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)/ ) {
                $Ticket{Responsible}   = $1;
                $Ticket{ResponsibleID} = $2;
            }
        }
        elsif ( $Row[1] eq 'TicketLinkAdd' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)%%(.+?)/ ) {
                push @{ $Ticket{LinkedTicketIDs} }, $2;
            }
        }
        elsif ( $Row[1] eq 'TicketLinkDelete' ) {
            if ( $Row[0] =~ /^\%\%(.+?)\%\%(.+?)%%(.+?)/ ) {

                # remove unlinked TicketID
                @{ $Ticket{LinkedTicketIDs} } = grep { $_ != $2 } @{ $Ticket{LinkedTicketIDs} };
            }
        }
        elsif ( $Row[1] eq 'TimeAccounting' ) {
            if ( $Row[0] =~ /^\%\%(\d+)\%\%(\d+)/ ) {
                $Ticket{TimeAccounting}    = $1;
                $Ticket{TimeAccountingSum} = $2;
            }
        }
        elsif ( $Row[1] eq 'SetPendingTime' ) {
            if ( $Row[0] =~ /^\%\%(.+?)$/ ) {
                $Ticket{PendingTime} = $1;
            }
        }

        $Ticket{CustomerID}     ||= '';
        $Ticket{CustomerUser}   ||= '';
        $Ticket{Service}        ||= '';
        $Ticket{ServiceID}      ||= '';
        $Ticket{SLA}            ||= '';
        $Ticket{SLAID}          ||= '';
        $Ticket{Type}           ||= '';
        $Ticket{Responsible}    ||= '';
        $Ticket{TimeAccounting} ||= '';
        $Ticket{PendingTime}    ||= '';

        # get default options
        $Ticket{TypeID}     = $Row[10] || '';
        $Ticket{OwnerID}    = $Row[9]  || '';
        $Ticket{PriorityID} = $Row[8]  || '';
        $Ticket{StateID}    = $Row[7]  || '';
        $Ticket{QueueID}    = $Row[6]  || '';
    }

    # get Owner if only OwnerID exists
    if ( !$Ticket{Owner} && $Ticket{OwnerID} ) {

        $Ticket{Owner} = $UserObject->UserLookup(
            UserID => $Ticket{OwnerID},
            Silent => 1,
        );
    }

    if ( $Ticket{TypeID} ) {
        $Ticket{Type} = $TypeObject->TypeLookup( TypeID => $Ticket{TypeID} );
    }

    if ( !%Ticket ) {
        $LogObject->Log(
            Priority => 'notice',
            Message  => "No such TicketID in ticket history till "
                . "'$Param{StopYear}-$Param{StopMonth}-$Param{StopDay} $Param{StopHour}:$Param{StopMinute}:$Param{StopSecond}' ($Param{TicketID})!",
        );
        return;
    }

    # update old ticket info
    my %CurrentTicketData = $TicketObject->TicketGet(

        # use param ticket id is fallback because if you merge old tickets to new tickets then
        # the history will be like shit and there is no correct ticket data given
        TicketID => $Ticket{TicketID} || $Param{TicketID},

        DynamicFields => 0,
    );

    for my $TicketAttribute (qw(State Priority Queue TicketNumber)) {
        if ( !$Ticket{$TicketAttribute} ) {
            $Ticket{$TicketAttribute} = $CurrentTicketData{$TicketAttribute};
        }
        if ( !$Ticket{"Create$TicketAttribute"} ) {
            $Ticket{"Create$TicketAttribute"} = $CurrentTicketData{$TicketAttribute};
        }
    }

    # get time object
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    my $SystemTime = $TimeObject->SystemTime();

    # check if we should cache this ticket data
    my ( $Sec, $Min, $Hour, $Day, $Month, $Year, $WDay ) = $TimeObject->SystemTime2Date(
        SystemTime => $SystemTime,
    );

    # if the request is for the last month or older, cache it
    if ( "$Year-$Month" gt "$Param{StopYear}-$Param{StopMonth}" ) {
        $CacheObject->Set(
            Type  => $Self->{CacheType},
            TTL   => $Self->{CacheTTL},
            Key   => $CacheKey,
            Value => \%Ticket,
        );
    }

    return %Ticket;
}

1;
