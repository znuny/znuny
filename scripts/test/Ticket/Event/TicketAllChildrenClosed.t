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
use parent qw(Kernel::System::EventHandler);

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

# get ticket object
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
my $LinkObject   = $Kernel::OM->Get('Kernel::System::LinkObject');
my $ModuleObject = $Kernel::OM->Get('Kernel::System::Ticket::Event::TicketAllChildrenClosed');

# define Variables 
my $UserID     = 1;
my $ModuleName = 'TicketAllChildrenClosed';
my $RandomID   = $Helper->GetRandomID();

# set user details
my ( $TestUserLogin, $TestUserID ) = $Helper->TestUserCreate();

# add Event to Config if it doesn't exist yet
my $AddEvent = 1;
my $EventsConfig = $ConfigObject->Get('Events')->{'Ticket'};
my @EventsConfigArray = @{$EventsConfig};
for my $Event (@EventsConfigArray) {
    if ($Event eq 'TicketAllChildrenClosed' ) {
        $AddEvent = 0;
    }
}
if ($AddEvent) {
    push @EventsConfigArray, "TicketAllChildrenClosed";
}
$ConfigObject->Set(
    Key => 'Events::Ticket',
    Value => @EventsConfigArray,
);

# Creating Test Tickets
my $ParentTicketID = $TicketObject->TicketCreate(
    Title         => 'test',
    QueueID       => 1,
    Lock          => 'unlock',
    Priority      => '3 normal',
    StateID       => 1,
    TypeID        => 1,
    OwnerID       => 1,
    ResponsibleID => 1,
    UserID        => $UserID,
);
# sanity checks
$Self->True(
    $ParentTicketID,
    "ParentTicket TicketCreate() - ID: $ParentTicketID",
);

# Creating 3 ChildTickets
my @TestSubTickets;
for (my $i = 0; $i < 3; $i++) {
    my $TicketID = $TicketObject->TicketCreate(
        Title         => 'test'.$i,
        QueueID       => 1,
        Lock          => 'unlock',
        Priority      => '3 normal',
        StateID       => 1,
        TypeID        => 1,
        OwnerID       => 1,
        ResponsibleID => 1,
        UserID        => $UserID,
    );
    $Self->True(
        $TicketID,
        "ChildTicket TicketCreate() - ID: $TicketID",
    );
    push @TestSubTickets, $TicketID;

    my $TicketLink = $LinkObject->LinkAdd(
        SourceObject => 'Ticket',
        SourceKey    => $ParentTicketID,
        TargetObject => 'Ticket',
        TargetKey    => $TicketID,
        Type         => 'ParentChild',
        State        => 'Valid',
        UserID       => 1,
    );
    $Self->True(
        $TicketLink,
        "ChildTicket Linked with parent",
    );
}

# Set the tests up
my @Tests = (
    {
        TicketID => $TestSubTickets[0],
        ExpectedEventExec => 0,
    },
    {
        TicketID => $TestSubTickets[1],
        ExpectedEventExec => 0,
    },
    {
        TicketID => $TestSubTickets[2],
        ExpectedEventExec => 1,
    },
);

# set State to closed and run the Module to check if the event has been executed
my $EventExecuted = 0;

for my $Event( @{$TicketObject->{EventHandlerPipe}} ) {
    if ( $Event->{Event} eq 'TicketAllChildrenClosed' ) {
        $EventExecuted = 1;
    }
}

$Self->False(
    $EventExecuted,
    "$ModuleName Pre Run() was unsuccessful with the execution of the event TicketAllChildrenClosed"
);

for my $Test ( @Tests ) {
    my %EventData = (
        Event => 'TicketStateUpdate',
        UserID => $TestUserID,
        Config =>{
            'Event' => 'TicketStateUpdate',
            'Module' => 'Kernel::System::Ticket::Event::TicketAllChildrenClosed'
        },
        Data => {
            TicketID => $Test->{TicketID},
        }
    );

    my $Success = $ModuleObject->Run(%EventData);
    $Self->True(
        $Success,
        "$ModuleName Run() was successful with new State",
    );

    my $TicketStateSet = $TicketObject->TicketStateSet(
        State     => 'closed successful',
        TicketID  => $Test->{TicketID},
        UserID    => 1,
    );

    $Success = $ModuleObject->Run(%EventData);
    $Self->True(
        $Success,
        "$ModuleName Run() was successful with closed successful State - ID: $Test->{TicketID}",
    );

    $EventExecuted = 0;
    for my $Event( @{$TicketObject->{EventHandlerPipe}} ) {
        if ( $Event->{Event} eq 'TicketAllChildrenClosed' ) {
            $EventExecuted = 1;
        }
    }

    $Self->Is(
        $EventExecuted,
        $Test->{ExpectedEventExec},
        "$ModuleName Post Run() executed and returned with the expected result"
    );
}

1;
