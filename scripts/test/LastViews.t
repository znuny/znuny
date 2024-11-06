# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::ObjectManager;
use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject    = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $LastViewsObject = $Kernel::OM->Get('Kernel::System::LastViews');
my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

my $Date = '2004-08-14 22:45:00';
$Self->{SessionID} = $HelperObject->GetRandomID();

$HelperObject->FixedTimeSetByTimeStamp($Date);

my %Request = (
    LastViewsParams => {
        QueueID => '2',
        View    => '2',
        Filter  => 'Unlocked',
    },
    RequestedURL => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
    Action       => 'AgentTicketQueue',
    SessionID    => $Self->{SessionID},

);

# IsValidRequest

my @Tests = (
    {
        Name => 'Fine - (successful)',
        Data => {
            Action          => 'AgentTicketQueue',
            SessionID       => $Self->{SessionID},
            RequestedURL    => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
            LastViewsParams => {
                QueueID => '2',
                View    => '2',
                Filter  => 'Unlocked',
            },
        },
        ExpectedResult => 1,
    },
    {
        Name => 'Missing SessionID - (failed)',
        Data => {
            Action          => 'AgentTicketQueue',
            RequestedURL    => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
            LastViewsParams => {
                QueueID => '2',
                View    => '2',
                Filter  => 'Unlocked',
            },
        },
        ExpectedResult => 0,
    },
    {
        Name => 'Same LastScreenView - (failed)',
        Data => {
            Action          => 'AgentTicketQueue',
            SessionID       => $Self->{SessionID},
            RequestedURL    => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
            LastScreenView  => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
            LastViewsParams => {
                QueueID => '2',
                View    => '2',
                Filter  => 'Unlocked',
            },
        },
        ExpectedResult => 0,
    },
    {
        Name => 'IgnoreAction LastScreenView - (failed)',
        Data => {
            Action          => 'AgentTicketArticleContent',
            SessionID       => $Self->{SessionID},
            RequestedURL    => 'Action=AgentTicketArticleContent;QueueID=2;View=;Filter=Unlocked',
            LastViewsParams => {
                QueueID => '2',
                View    => '2',
                Filter  => 'Unlocked',
            },
        },
        ExpectedResult => 0,
    },
);

for my $Test (@Tests) {
    my $IsValidRequest = $LastViewsObject->IsValidRequest(
        %{ $Test->{Data} },
    );

    $Self->Is(
        $IsValidRequest,
        $Test->{ExpectedResult},
        'IsValidRequest - ' . $Test->{Name},
    );
}

# Get

my %LastView = $LastViewsObject->Get(
    %Request,
);

$Self->IsDeeply(
    \%LastView,
    {
        Type         => 'TicketOverview',
        Name         => 'Queue',
        Frontend     => 'Agent',
        Icon         => 'fa fa-table',
        PopUp        => '',
        FrontendIcon => 'fa fa-user',
        URL          => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
        Action       => 'AgentTicketQueue',
        TimeStamp    => $Date,
    },
    'Get',
);

# Update

my $Success = $LastViewsObject->Update(
    SessionID => $Self->{SessionID},
    Request   => \%Request,
);

$Self->True(
    $Success,
    'Update',
);

# GetList

my @LastViews = $LastViewsObject->GetList(
    SessionID => $Self->{SessionID},
);

$Self->IsDeeply(
    \@LastViews,
    [
        {
            Type         => 'TicketOverview',
            Name         => 'Queue',
            Frontend     => 'Agent',
            Icon         => 'fa fa-table',
            PopUp        => '',
            FrontendIcon => 'fa fa-user',
            URL          => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
            Action       => 'AgentTicketQueue',
            TimeStamp    => $Date,
        },
    ],
    'GetList - LastViews',
);

@LastViews = $LastViewsObject->GetList(
    SessionID => $Self->{SessionID},
    Types     => [ 'Ticket', 'Admin' ],
);

$Self->IsDeeply(
    \@LastViews,
    [],
    'GetList - empty list',
);

# Delete

$Success = $LastViewsObject->Delete(
    SessionID => $Self->{SessionID},
);

$Self->True(
    $Success,
    'Delete',
);

@LastViews = $LastViewsObject->GetList(
    SessionID => $Self->{SessionID},
);

$Self->IsDeeply(
    \@LastViews,
    [],
    'Delete - empty list',
);

# GetActionMapping

my %ActionMapping = $LastViewsObject->GetActionMapping();

$Self->IsNotDeeply(
    \%ActionMapping,
    {},
    'GetActionMapping',
);

# GetActionIgnore

my @ActionIgnore = $LastViewsObject->GetActionIgnore();

$Self->IsDeeply(
    \@ActionIgnore,
    [
        'AgentTicketActionCommon',
        'AgentTicketArticleContent',
        'AgentTicketAttachment',
        'AgentTicketBounce',
        'AgentTicketBulk',
        'AgentTicketClose',
        'AgentTicketCompose',
        'AgentTicketCustomer',
        'AgentTicketEmailOutbound',
        'AgentTicketEmailResend',
        'AgentTicketForward',
        'AgentTicketFreeText',
        'AgentTicketHistory',
        'AgentTicketLock',
        'AgentTicketLockedView',
        'AgentTicketMarkSeenUnseen',
        'AgentTicketMerge',
        'AgentTicketMove',
        'AgentTicketNote',
        'AgentTicketOwner',
        'AgentTicketPending',
        'AgentTicketPhoneCommon',
        'AgentTicketPhoneInbound',
        'AgentTicketPhoneOutbound',
        'AgentTicketPlain',
        'AgentTicketPrint',
        'AgentTicketPriority',
        'AgentTicketProcess',
        'AgentTicketResponsible',
        'AgentTicketSearch',
        'AgentTicketToUnitTest',
        'AgentTicketWatcher',
        'CustomerTicketArticleContent',
    ],
    'GetActionIgnore',
);

$ConfigObject->{'LastViews'}->{ActionIgnore}->{Framework} = [
    'AgentTicketQueue',
];

$ConfigObject->{'LastViews'}->{ActionIgnore}->{NewPackage} = [
    'AgentTicketNew',
];

@ActionIgnore = $LastViewsObject->GetActionIgnore();

$Self->IsDeeply(
    \@ActionIgnore,
    [
        'AgentTicketActionCommon',
        'AgentTicketArticleContent',
        'AgentTicketAttachment',
        'AgentTicketBounce',
        'AgentTicketBulk',
        'AgentTicketClose',
        'AgentTicketCompose',
        'AgentTicketCustomer',
        'AgentTicketEmailOutbound',
        'AgentTicketEmailResend',
        'AgentTicketForward',
        'AgentTicketFreeText',
        'AgentTicketHistory',
        'AgentTicketLock',
        'AgentTicketLockedView',
        'AgentTicketMarkSeenUnseen',
        'AgentTicketMerge',
        'AgentTicketMove',
        'AgentTicketNew',
        'AgentTicketNote',
        'AgentTicketOwner',
        'AgentTicketPending',
        'AgentTicketPhoneCommon',
        'AgentTicketPhoneInbound',
        'AgentTicketPhoneOutbound',
        'AgentTicketPlain',
        'AgentTicketPrint',
        'AgentTicketPriority',
        'AgentTicketProcess',
        'AgentTicketQueue',
        'AgentTicketResponsible',
        'AgentTicketSearch',
        'AgentTicketToUnitTest',
        'AgentTicketWatcher',
        'CustomerTicketArticleContent',
    ],
    'GetActionIgnore',
);

1;
