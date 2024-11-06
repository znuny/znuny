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

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $ZnunyHelperObject    = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $UnitTestHelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $ExpectedValidDynamicFieldScreenListHash = {
    'DefaultColumnsScreens' => {
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder' =>
            'DashboardWidget CIC-TicketPendingReminder',
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation' => 'DashboardWidget CIC-TicketEscalation',
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew'        => 'DashboardWidget CIC-TicketNew',
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen'       => 'DashboardWidget CIC-TicketOpen',
        'AgentCustomerUserInformationCenter::Backend###0100-CUIC-TicketPendingReminder' =>
            'DashboardWidget CUIC-TicketPendingReminder',
        'AgentCustomerUserInformationCenter::Backend###0110-CUIC-TicketEscalation' =>
            'DashboardWidget CUIC-TicketEscalation',
        'AgentCustomerUserInformationCenter::Backend###0120-CUIC-TicketNew'  => 'DashboardWidget CUIC-TicketNew',
        'AgentCustomerUserInformationCenter::Backend###0130-CUIC-TicketOpen' => 'DashboardWidget CUIC-TicketOpen',
        'DashboardBackend###0100-TicketPendingReminder'                      => 'DashboardWidget TicketPendingReminder',
        'DashboardBackend###0110-TicketEscalation'                           => 'DashboardWidget TicketEscalation',
        'DashboardBackend###0120-TicketNew'                                  => 'DashboardWidget TicketNew',
        'DashboardBackend###0130-TicketOpen'                                 => 'DashboardWidget TicketOpen',
        'DashboardBackend###0140-RunningTicketProcess'                       => 'DashboardWidget RunningTicketProcess',
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns'       => 'AgentTicketEscalationView',
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns'           => 'AgentTicketLockedView',
        'Ticket::Frontend::AgentTicketOwnerView###DefaultColumns'            => 'AgentTicketOwnerView',
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns'                => 'AgentTicketQueue',
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns'      => 'AgentTicketResponsibleView',
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns'               => 'AgentTicketSearch',
        'Ticket::Frontend::AgentTicketService###DefaultColumns'              => 'AgentTicketService',
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns'           => 'AgentTicketStatusView',
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns'            => 'AgentTicketWatchView',
    },
    'DynamicFieldScreens' => {
        'Ticket::Frontend::AgentTicketBulk###DynamicField'               => 'AgentTicketBulk',
        'Ticket::Frontend::AgentTicketClose###DynamicField'              => 'AgentTicketClose',
        'Ticket::Frontend::AgentTicketCompose###DynamicField'            => 'AgentTicketCompose',
        'Ticket::Frontend::AgentTicketEmail###DynamicField'              => 'AgentTicketEmail',
        'Ticket::Frontend::AgentTicketEmailOutbound###DynamicField'      => 'AgentTicketEmailOutbound',
        'Ticket::Frontend::AgentTicketForward###DynamicField'            => 'AgentTicketForward',
        'Ticket::Frontend::AgentTicketFreeText###DynamicField'           => 'AgentTicketFreeText',
        'Ticket::Frontend::AgentTicketMove###DynamicField'               => 'AgentTicketMove',
        'Ticket::Frontend::AgentTicketNote###DynamicField'               => 'AgentTicketNote',
        'Ticket::Frontend::AgentTicketNoteToLinkedTicket###DynamicField' => 'AgentTicketNoteToLinkedTicket',
        'Ticket::Frontend::AgentTicketOwner###DynamicField'              => 'AgentTicketOwner',
        'Ticket::Frontend::AgentTicketPending###DynamicField'            => 'AgentTicketPending',
        'Ticket::Frontend::AgentTicketPhone###DynamicField'              => 'AgentTicketPhone',
        'Ticket::Frontend::AgentTicketPhoneInbound###DynamicField'       => 'AgentTicketPhoneInbound',
        'Ticket::Frontend::AgentTicketPhoneOutbound###DynamicField'      => 'AgentTicketPhoneOutbound',
        'Ticket::Frontend::AgentTicketPrint###DynamicField'              => 'AgentTicketPrint',
        'Ticket::Frontend::AgentTicketPriority###DynamicField'           => 'AgentTicketPriority',
        'Ticket::Frontend::AgentTicketResponsible###DynamicField'        => 'AgentTicketResponsible',
        'Ticket::Frontend::AgentTicketSearch###DynamicField'             => 'AgentTicketSearch',
        'Ticket::Frontend::AgentTicketZoom###DynamicField'               => 'AgentTicketZoom',
        'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField'  => 'ProcessWidgetDynamicField',
        'Ticket::Frontend::CustomerTicketMessage###DynamicField'         => 'CustomerTicketMessage',
        'Ticket::Frontend::CustomerTicketOverview###DynamicField'        => 'CustomerTicketOverview',
        'Ticket::Frontend::CustomerTicketPrint###DynamicField'           => 'CustomerTicketPrint',
        'Ticket::Frontend::CustomerTicketSearch###DynamicField'          => 'CustomerTicketSearch',
        'Ticket::Frontend::CustomerTicketZoom###DynamicField'            => 'CustomerTicketZoom',
        'Ticket::Frontend::OverviewMedium###DynamicField'                => 'OverviewMedium',
        'Ticket::Frontend::OverviewPreview###DynamicField'               => 'OverviewPreview',
        'Ticket::Frontend::OverviewSmall###DynamicField'                 => 'OverviewSmall',
    },
};

my $ExpectedValidDynamicFieldScreenListArray = {
    'DefaultColumnsScreens' => [
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder',
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation',
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew',
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen',
        'AgentCustomerUserInformationCenter::Backend###0100-CUIC-TicketPendingReminder',
        'AgentCustomerUserInformationCenter::Backend###0110-CUIC-TicketEscalation',
        'AgentCustomerUserInformationCenter::Backend###0120-CUIC-TicketNew',
        'AgentCustomerUserInformationCenter::Backend###0130-CUIC-TicketOpen',
        'DashboardBackend###0100-TicketPendingReminder',
        'DashboardBackend###0110-TicketEscalation',
        'DashboardBackend###0120-TicketNew',
        'DashboardBackend###0130-TicketOpen',
        'DashboardBackend###0140-RunningTicketProcess',
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns',
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns',
        'Ticket::Frontend::AgentTicketOwnerView###DefaultColumns',
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns',
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns',
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns',
        'Ticket::Frontend::AgentTicketService###DefaultColumns',
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns',
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns'
    ],
    'DynamicFieldScreens' => [
        'Ticket::Frontend::AgentTicketBulk###DynamicField',
        'Ticket::Frontend::AgentTicketClose###DynamicField',
        'Ticket::Frontend::AgentTicketCompose###DynamicField',
        'Ticket::Frontend::AgentTicketEmail###DynamicField',
        'Ticket::Frontend::AgentTicketEmailOutbound###DynamicField',
        'Ticket::Frontend::AgentTicketForward###DynamicField',
        'Ticket::Frontend::AgentTicketFreeText###DynamicField',
        'Ticket::Frontend::AgentTicketMove###DynamicField',
        'Ticket::Frontend::AgentTicketNote###DynamicField',
        'Ticket::Frontend::AgentTicketNoteToLinkedTicket###DynamicField',
        'Ticket::Frontend::AgentTicketOwner###DynamicField',
        'Ticket::Frontend::AgentTicketPending###DynamicField',
        'Ticket::Frontend::AgentTicketPhone###DynamicField',
        'Ticket::Frontend::AgentTicketPhoneInbound###DynamicField',
        'Ticket::Frontend::AgentTicketPhoneOutbound###DynamicField',
        'Ticket::Frontend::AgentTicketPrint###DynamicField',
        'Ticket::Frontend::AgentTicketPriority###DynamicField',
        'Ticket::Frontend::AgentTicketResponsible###DynamicField',
        'Ticket::Frontend::AgentTicketSearch###DynamicField',
        'Ticket::Frontend::AgentTicketZoom###DynamicField',
        'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField',
        'Ticket::Frontend::CustomerTicketMessage###DynamicField',
        'Ticket::Frontend::CustomerTicketOverview###DynamicField',
        'Ticket::Frontend::CustomerTicketPrint###DynamicField',
        'Ticket::Frontend::CustomerTicketSearch###DynamicField',
        'Ticket::Frontend::CustomerTicketZoom###DynamicField',
        'Ticket::Frontend::OverviewMedium###DynamicField',
        'Ticket::Frontend::OverviewPreview###DynamicField',
        'Ticket::Frontend::OverviewSmall###DynamicField'
    ],
};

# Test export
my @Tests = (
    {
        Name     => 'Get ValidDynamicFieldScreenList as ARRAY.',
        Result   => 'ARRAY',
        Expected => $ExpectedValidDynamicFieldScreenListArray,
    },
    {
        Name     => 'Get ValidDynamicFieldScreenList as HASH.',
        Result   => 'HASH',
        Expected => $ExpectedValidDynamicFieldScreenListHash,
    },
);

TEST:
for my $Test (@Tests) {

    $Self->True(
        $Test->{Name},
        "$Test->{Name}",
    );

    my $ValidDynamicFieldScreenList = $ZnunyHelperObject->_ValidDynamicFieldScreenListGet(
        Result => $Test->{Result},
    );

    $Self->IsDeeply(
        $ValidDynamicFieldScreenList,
        $Test->{Expected},
        "Expected valid dynamicField screen list as $Test->{Result} is correct.",
    );

}

1;
