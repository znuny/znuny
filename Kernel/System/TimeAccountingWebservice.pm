# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::TimeAccountingWebservice;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Time',
);

=head1 NAME

Kernel::System::TimeAccountingWebservice - TimeAccountingWebservice lib

=head1 PUBLIC INTERFACE

=head2 new()

    Don't use the constructor directly, use the ObjectManager instead:

    my $TimeAccountingWebserviceObject = $Kernel::OM->Get('Kernel::System::TimeAccountingWebservice');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 TimeAccountingSearch()

Searches for time accounting entries and returns a specific result based on title, number, queue, created and time units.

    my @TimeAccountingEntries = $TimeAccountingWebserviceObject->TimeAccountingSearch(
        Start  => '2017-01-01 10:00:00',
        End    => '2018-01-01 10:00:00',
        UserID => 123,
    );

Returns:

    my @TimeAccountingEntries = (
        {
            TicketNumber => '...',
            TicketTitle  => '...',
            Queue        => '...',
            TimeUnit     => '...',
            Created      => '...',
        },
    );

=cut

sub TimeAccountingSearch {
    my ( $Self, %Param ) = @_;

    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');

    NEEDED:
    for my $Needed (qw(Start End UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $SQL = '
        SELECT
            ticket.id,
            ticket.tn,
            ticket.customer_id,
            ticket.title,
            time_accounting.time_unit,
            time_accounting.create_time
        FROM
            time_accounting,
            ticket
        WHERE
            time_accounting.ticket_id = ticket.id AND
            time_accounting.create_by = ? AND
            time_accounting.create_time BETWEEN ? AND ?
        ORDER BY
            time_accounting.create_time ASC,
            ticket.id ASC';

    return if !$DBObject->Prepare(
        SQL  => $SQL,
        Bind => [
            \$Param{UserID},
            \$Param{Start},
            \$Param{End},
        ],
        Limit => 1_000_000,
    );

    my @Entries;

    ROW:
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @Entries, {
            TicketID         => $Row[0],
            TicketNumber     => $Row[1],
            TicketCustomerID => $Row[2],
            TicketTitle      => $Row[3],
            TimeUnit         => $Row[4],
            Created          => $Row[5],
        };
    }

    for my $Entry (@Entries) {
        my $SystemTime = $TimeObject->TimeStamp2SystemTime(
            String => $Entry->{Created},
        );

        my ( $Sec, $Min, $Hour, $Day, $Month, $Year, $WeekDay ) = $TimeObject->SystemTime2Date(
            SystemTime => $SystemTime,
        );

        my %HistoryData = $TicketObject->HistoryTicketGet(
            StopYear   => $Year,
            StopMonth  => $Month,
            StopDay    => $Day,
            StopHour   => $Hour,
            StopMinute => $Min,
            StopSecond => $Sec,
            TicketID   => $Entry->{TicketID},
        );

        $Entry->{Queue} = $HistoryData{Queue};

        delete $Entry->{TicketID};
    }

    return @Entries;
}

1;
