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

use Kernel::System::PostMaster;

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $StateObject    = $Kernel::OM->Get('Kernel::System::State');
my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');
my $TypeObject     = $Kernel::OM->Get('Kernel::System::Type');
my $QueueObject    = $Kernel::OM->Get('Kernel::System::Queue');
my $ServiceObject  = $Kernel::OM->Get('Kernel::System::Service');
my $SLAObject      = $Kernel::OM->Get('Kernel::System::SLA');

my $UserID  = 1;
my $ValidID = 1;

my %StateIDByState = reverse $StateObject->StateList(
    UserID => $UserID,
);

my %PriorityIDByPriority = reverse $PriorityObject->PriorityList();

my $TicketType1 = $HelperObject->GetRandomID();
my $TicketType2 = $HelperObject->GetRandomID();
for my $TicketType ( $TicketType1, $TicketType2, ) {
    $TypeObject->TypeAdd(
        Name    => $TicketType,
        ValidID => $ValidID,
        UserID  => $UserID,
    );
}
my %TypeIDByType = reverse $TypeObject->TypeList();

my %QueueIDByQueue = reverse $QueueObject->QueueList();

my $Service1 = $HelperObject->GetRandomID();
my $Service2 = $HelperObject->GetRandomID();
for my $Service ( $Service1, $Service2, ) {
    $ServiceObject->ServiceAdd(
        Name    => $Service,
        ValidID => $ValidID,
        UserID  => $UserID,
    );
}

my %ServiceIDByService = reverse $ServiceObject->ServiceList(
    UserID => $UserID,
);

my $SLA1 = $HelperObject->GetRandomID();
my $SLA2 = $HelperObject->GetRandomID();
for my $SLA ( $SLA1, $SLA2, ) {
    $SLAObject->SLAAdd(
        ServiceIDs => [ $ServiceIDByService{$Service1}, $ServiceIDByService{$Service2}, ],
        Name       => $SLA,
        ValidID    => $ValidID,
        UserID     => $UserID,
    );
}

my %SLAIDBySLA = reverse $SLAObject->SLAList(
    UserID => $UserID,
);

my @Tests = (
    {
        Name  => '#1 - New ticket',
        Email => 'From: Sender <sender@example.com>
To: Some Name <recipient@example.com>
Subject: A simple question
X-OTRS-StateID: ' . $StateIDByState{'closed successful'} . '
X-OTRS-PriorityID: ' . $PriorityIDByPriority{'5 very high'} . '
X-OTRS-TypeID: ' . $TypeIDByType{$TicketType1} . '
X-OTRS-QueueID: ' . $QueueIDByQueue{Junk} . '
X-OTRS-SLAID: ' . $SLAIDBySLA{$SLA1} . '
X-OTRS-ServiceID: ' . $ServiceIDByService{$Service1} . '

This is a multiline
email for server: example.tld

The IP address: 192.168.0.1
        ',
        Return => 1,    # it's a new ticket
        Check  => {
            State    => 'closed successful',
            Priority => '5 very high',
            Type     => $TicketType1,
            Queue    => 'Junk',
            SLA      => $SLA1,
            Service  => $Service1,
        },
    },
    {
        Name  => '#2 - Follow-up',
        Email => 'From: Sender <sender@example.com>
To: Some Name <recipient@example.com>
Subject: [#1] Another question
X-OTRS-FollowUp-StateID: ' . $StateIDByState{'closed unsuccessful'} . '
X-OTRS-FollowUp-PriorityID: ' . $PriorityIDByPriority{'2 low'} . '
X-OTRS-FollowUp-TypeID: ' . $TypeIDByType{$TicketType2} . '
X-OTRS-FollowUp-QueueID: ' . $QueueIDByQueue{Misc} . '
X-OTRS-FollowUp-SLAID: ' . $SLAIDBySLA{$SLA2} . '
X-OTRS-FollowUp-ServiceID: ' . $ServiceIDByService{$Service2} . '

This is a multiline
email for server: example.tld

The IP address: 192.168.0.1
        ',
        Return => 2,    # it's a followup
        Check  => {
            State    => 'closed unsuccessful',
            Priority => '2 low',
            Type     => $TicketType2,
            Queue    => 'Misc',
            SLA      => $SLA2,
            Service  => $Service2,
        },
    },
);

my %TicketNumbers;
my %TicketIDs;

my $Index = 1;
for my $Test (@Tests) {
    my $Name  = $Test->{Name};
    my $Email = $Test->{Email};

    $Email =~ s{\[#([0-9]+)\]}{[Ticket#$TicketNumbers{$1}]};

    my @Return;
    {
        my $CommunicationLogObject = $Kernel::OM->Create(
            'Kernel::System::CommunicationLog',
            ObjectParams => {
                Transport => 'Email',
                Direction => 'Incoming',
            },
        );
        $CommunicationLogObject->ObjectLogStart( ObjectLogType => 'Message' );

        my $PostMasterObject = Kernel::System::PostMaster->new(
            CommunicationLogObject => $CommunicationLogObject,
            Email                  => \$Email,
        );

        @Return = $PostMasterObject->Run();

        $CommunicationLogObject->ObjectLogStop(
            ObjectLogType => 'Message',
            Status        => 'Successful',
        );
        $CommunicationLogObject->CommunicationStop(
            Status => 'Successful',
        );
    }
    $Self->Is(
        $Return[0] || 0,
        $Test->{Return},
        "$Name - NewTicket/FollowUp",
    );
    $Self->True(
        $Return[1] || 0,
        "$Name - TicketID",
    );

    # new/clear ticket object
    $Kernel::OM->ObjectsDiscard( Objects => ['Kernel::System::Ticket'] );
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    my %Ticket = $TicketObject->TicketGet(
        TicketID      => $Return[1],
        DynamicFields => 1,
    );

    for my $Key ( sort keys %{ $Test->{Check} } ) {
        $Self->Is(
            $Ticket{$Key},
            $Test->{Check}->{$Key},
            "Run('$Test->{Name}') - $Key",
        );
    }

    $TicketNumbers{$Index} = $Ticket{TicketNumber};
    $TicketIDs{ $Return[1] }++;

    $Index++;
}

for my $TicketID ( sort keys %TicketIDs ) {

    # new/clear ticket object
    $Kernel::OM->ObjectsDiscard( Objects => ['Kernel::System::Ticket'] );
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # delete ticket
    my $Delete = $TicketObject->TicketDelete(
        TicketID => $TicketID,
        UserID   => 1,
    );

    $Self->True(
        $Delete || 0,
        "#Filter TicketDelete()",
    );
}

1;
