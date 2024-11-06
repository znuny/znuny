# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject             = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $CalendarObject           = $Kernel::OM->Get('Kernel::System::Calendar');
my $AppointmentObject        = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');
my $GroupObject              = $Kernel::OM->Get('Kernel::System::Group');
my $PluginObject             = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');
my $TicketCreatePluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Ticket::Create');
my $LinkObject               = $Kernel::OM->Get('Kernel::System::LinkObject');
my $TicketObject             = $Kernel::OM->Get('Kernel::System::Ticket');

$HelperObject->FixedTimeSetByTimeStamp('2022-04-07 21:11:00');

my @Tests = (
    {
        Name => 'CalculateTicketCreateTime beforestart',
        Data => {
            StartTimeStamp          => '2019-05-01 08:00:00',
            EndTimeStamp            => '2019-05-02 08:00:00',
            TicketCreateOffset      => 2,
            TicketCreateOffsetUnit  => 3600,
            TicketCreateOffsetPoint => 'beforestart',
        },
        Expected => '2019-05-01 06:00:00',
    },
    {
        Name => 'CalculateTicketCreateTime afterstart',
        Data => {
            StartTimeStamp          => '2019-05-01 08:00:00',
            EndTimeStamp            => '2019-05-02 08:00:00',
            TicketCreateOffset      => 2,
            TicketCreateOffsetUnit  => 3600,
            TicketCreateOffsetPoint => 'afterstart',
        },
        Expected => '2019-05-01 10:00:00',
    },
    {
        Name => 'CalculateTicketCreateTime beforeend',
        Data => {
            StartTimeStamp          => '2019-05-01 08:00:00',
            EndTimeStamp            => '2019-05-02 08:00:00',
            TicketCreateOffset      => 2,
            TicketCreateOffsetUnit  => 3600,
            TicketCreateOffsetPoint => 'beforeend',
        },
        Expected => '2019-05-02 06:00:00',
    },
    {
        Name => 'CalculateTicketCreateTime afterend',
        Data => {
            StartTimeStamp          => '2019-05-01 08:00:00',
            EndTimeStamp            => '2019-05-02 08:00:00',
            TicketCreateOffset      => 2,
            TicketCreateOffsetUnit  => 3600,
            TicketCreateOffsetPoint => 'afterend',
        },
        Expected => '2019-05-02 10:00:00',
    },
);

for my $Test (@Tests) {

    my $TicketCreateTime = $TicketCreatePluginObject->CalculateTicketCreateTime(
        %{ $Test->{Data} },
    );

    $Self->Is(
        $TicketCreateTime,
        $Test->{Expected},
        $Test->{Name},
    );
}

my $RandomID = $HelperObject->GetRandomID();

# create test group
my $GroupName = 'test-calendar-plugin-ticket-create-' . $RandomID;
my $GroupID   = $GroupObject->GroupAdd(
    Name    => $GroupName,
    ValidID => 1,
    UserID  => 1,
);

$Self->True(
    $GroupID,
    "Test group $GroupID created",
);

# create test user
my ( $UserLogin, $UserID ) = $HelperObject->TestUserCreate(
    Groups => [ 'users', $GroupName ],
);

$Self->True(
    $UserID,
    "Test user $UserID created",
);

# create test calendar
my %Calendar = $CalendarObject->CalendarCreate(
    CalendarName => 'Test Calendar ' . $RandomID,
    Color        => '#3A87AD',
    GroupID      => $GroupID,
    UserID       => $UserID,
);

$Self->True(
    $Calendar{CalendarID},
    "CalendarCreate() - $Calendar{CalendarID}",
);

# create test appointment
my $AppointmentID = $AppointmentObject->AppointmentCreate(
    CalendarID         => $Calendar{CalendarID},
    Title              => 'Recurring appointment ' . $RandomID,
    Title              => 'Recurring appointment',
    StartTime          => '2016-02-01 16:00:00',
    EndTime            => '2016-02-01 17:00:00',
    AllDay             => 1,
    Recurring          => 1,
    RecurrenceType     => 'Daily',
    RecurrenceInterval => 1,                                      # once per day
    RecurrenceUntil    => '2016-02-06 00:00:00',                  # included last day
    UserID             => $UserID,
);

$Self->True(
    $AppointmentID,
    "AppointmentCreate() - $AppointmentID",
);

my %Appointment = $AppointmentObject->AppointmentGet(
    AppointmentID => $AppointmentID,
);

# Update

my $Update = $TicketCreatePluginObject->Update(
    GetParam => {
        Recurring => 1
    },
    Appointment => \%Appointment,
    Plugin      => {
        Name      => 'Ticket Create',
        PluginKey => 'TicketCreate',
        Block     => 'Ticket',
        Module    => 'Kernel::System::Calendar::Plugin::Ticket::Create',
        Prio      => '1000',
        Param     => {
            CustomerID                  => 'customer',
            CustomerUserID              => 'customer',
            Link                        => 1,
            LockID                      => 1,
            Offset                      => 12,
            OwnerID                     => 1,
            PendingStateIDs             => [ 7, 8, 6 ],
            TicketPendingTimeOffset     => 11,
            TicketPendingTimeOffsetUnit => 60,
            PriorityID                  => 1,
            QueueID                     => 1,
            ResponsibleUserID           => 1,
            StateID                     => 1,
            TicketCreateTime            => '2022-04-07 21:11:00',
            TicketCreateTimeType        => 'StartTime',
            TypeID                      => 1,
        },
    },
    UserID => 1,
);

$Self->True(
    $Update,
    "TicketCreatePluginObject Update()",
);

my @Data = $PluginObject->DataListGet(
    PluginKey => 'TicketCreate',
    UserID    => 1,
);

$Self->Is(
    scalar @Data,
    6,
    'DataListGet count',
);

# Get

my $Data = $TicketCreatePluginObject->Get(
    GetParam    => {},
    Appointment => \%Appointment,
    Plugin      => {
        PluginKey => 'TicketCreate',
    },
    UserID => $UserID,
);

$Self->Is(
    $Data->{AppointmentID},
    $AppointmentID,
    'TicketCreatePluginObject Get',
);

my $Success = $PluginObject->DataDelete(
    PluginKey => 'TicketCreate',
    UserID    => 1,
);

# TicketCreate
@Tests = (
    {
        Name            => 'TicketCreatePluginObject - TicketCreate',
        AppointmentData => {
            CalendarID         => $Calendar{CalendarID},
            Title              => 'Recurring appointment',
            StartTime          => '2022-04-07 21:11:00',
            EndTime            => '2022-04-08 21:11:00',
            AllDay             => 1,
            Recurring          => 1,
            RecurrenceType     => 'Daily',
            RecurrenceInterval => 1,                         # once per day
            RecurrenceUntil    => '2022-04-08 21:11:00',     # included last day
            UserID             => $UserID,
        },
        CreatePluginData => {
            GetParam => {
                Recurring => 1
            },
            Appointment => {},
            Plugin      => {
                Name      => 'Ticket Create',
                PluginKey => 'TicketCreate',
                Block     => 'Ticket',
                Module    => 'Kernel::System::Calendar::Plugin::Ticket::Create',
                Prio      => '1000',
                Param     => {
                    CustomerID                  => 'customer',
                    CustomerUserID              => 'customer',
                    Link                        => 1,
                    LockID                      => 1,
                    Offset                      => 12,
                    OwnerID                     => 1,
                    PendingStateIDs             => [ 7, 8, 6 ],
                    TicketPendingTimeOffset     => 11,
                    TicketPendingTimeOffsetUnit => 60,
                    PriorityID                  => 1,
                    QueueID                     => [ 1, 2 ],
                    ResponsibleUserID           => $UserID,
                    StateID                     => 1,
                    TicketCreateTime            => '2022-04-07 21:11:00',
                    TicketCreateTimeType        => 'StartTime',
                    TypeID                      => 1,
                },
            },
            UserID => 1,
        },
        Expected => 2,
    },
);
for my $Test (@Tests) {

    my $AppointmentID = $AppointmentObject->AppointmentCreate(
        %{ $Test->{AppointmentData} },
    );

    $Self->True(
        $AppointmentID,
        $Test->{Name} . " - AppointmentCreate - " . $AppointmentID,
    );

    my %Appointment = $AppointmentObject->AppointmentGet(
        AppointmentID => $AppointmentID,
    );
    $Test->{CreatePluginData}->{Appointment} = \%Appointment;

    # delete
    $TicketCreatePluginObject->Delete(
        Appointment => {
            AppointmentID => $AppointmentID,
        },
        Plugin => {
            PluginKey => 'TicketCreate',
        },
        GetParam => {
            Recurring => 1,
        },
    );

    $TicketCreatePluginObject->Update(
        %{ $Test->{CreatePluginData} },
    );

    my @Data = $PluginObject->DataListGet(
        PluginKey => 'TicketCreate',
        UserID    => 1,
    );

    my %Data = $PluginObject->DataGet(
        AppointmentID => $Appointment{AppointmentID},
        PluginKey     => 'TicketCreate',
        UserID        => 1,
    );

    $Self->Is(
        $Data{Config}->{TicketCreated},
        undef,
        'TicketCreated',
    );

    my $TicketCounter = $TicketCreatePluginObject->TicketCreate(
        %Data,
        UserID => 1,
    );

    $Self->Is(
        $TicketCounter,
        $Test->{Expected},
        $Test->{Name},
    );

    %Data = $PluginObject->DataGet(
        AppointmentID => $Appointment{AppointmentID},
        PluginKey     => 'TicketCreate',
        UserID        => 1,
    );

    $Self->True(
        %Data,
        'TicketCreated',
    );

    $Self->Is(
        $Data{Config}->{TicketCreated},
        1,
        'TicketCreated',
    );

    my %LinkKeyList = $LinkObject->LinkKeyListWithData(
        Object1 => 'Appointment',
        Key1    => $Appointment{AppointmentID},
        Object2 => 'Ticket',
        State   => 'Valid',
        Type    => 'Normal',
        UserID  => 1,
    );

    $Self->True(
        \%LinkKeyList,
        'LinkKeyListWithData',
    );

    $Self->True(
        $UserID gt 1,
        'Used responsible User ID is NOT Admin OTRS (Id: 1) but as expected: "' . $UserID ? $UserID : '' . '"',
    );

    my %Tickets = $TicketObject->TicketSearch(
        UserID         => 1,
        ResponsibleIDs => [ $UserID, ],
        Result         => 'HASH',
    );

    for my $TicketID ( sort keys %Tickets ) {

        my %Ticket = $TicketObject->TicketGet(
            $UserID  => 1,
            TicketID => $TicketID,
        );
        $Self->True(
            $Ticket{ResponsibleID} gt 1,
            'Ticket responsible UserID is NOT Admin OTRS (Id: 1) but as expected: "' . $UserID ? $UserID : '' . '"',
        );
        $Self->Is(
            $Ticket{ResponsibleID},
            $UserID,
            'Ticket responsible UserID is "' . $UserID ? $UserID : '' . '"',
        );
    }
}

1;
