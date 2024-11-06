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

my $ZnunyHelperObject                     = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $DynamicFieldScreenConfigurationObject = $Kernel::OM->Get('Kernel::System::DynamicField::ScreenConfiguration');
my $HelperObject                          = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport
    = $DynamicFieldScreenConfigurationObject->GetConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport(
    Result => 'ARRAY',
    );

$Self->IsDeeply(
    $ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport,
    [
        'Ticket::Frontend::AgentTicketPrint###DynamicField',
        'Ticket::Frontend::AgentTicketZoom###DynamicField',
        'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField',
        'Ticket::Frontend::CustomerTicketOverview###DynamicField',
        'Ticket::Frontend::CustomerTicketPrint###DynamicField',
        'Ticket::Frontend::CustomerTicketSearch###DynamicField',
        'Ticket::Frontend::CustomerTicketZoom###DynamicField',
        'Ticket::Frontend::OverviewMedium###DynamicField',
        'Ticket::Frontend::OverviewPreview###DynamicField',
        'Ticket::Frontend::OverviewSmall###DynamicField'
    ],
    'GetConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport ARRAY',
);

$ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport
    = $DynamicFieldScreenConfigurationObject->GetConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport(
    Result => 'HASH',
    );

$Self->IsDeeply(
    $ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport,
    {
        'Ticket::Frontend::AgentTicketPrint###DynamicField'             => 'AgentTicketPrint',
        'Ticket::Frontend::AgentTicketZoom###DynamicField'              => 'AgentTicketZoom',
        'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField' => 'ProcessWidgetDynamicField',
        'Ticket::Frontend::CustomerTicketOverview###DynamicField'       => 'CustomerTicketOverview',
        'Ticket::Frontend::CustomerTicketPrint###DynamicField'          => 'CustomerTicketPrint',
        'Ticket::Frontend::CustomerTicketSearch###DynamicField'         => 'CustomerTicketSearch',
        'Ticket::Frontend::CustomerTicketZoom###DynamicField'           => 'CustomerTicketZoom',
        'Ticket::Frontend::OverviewMedium###DynamicField'               => 'OverviewMedium',
        'Ticket::Frontend::OverviewPreview###DynamicField'              => 'OverviewPreview',
        'Ticket::Frontend::OverviewSmall###DynamicField'                => 'OverviewSmall',
    },
    'GetConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport HASH',
);

my %ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport = (
    'Ticket::Frontend::AgentTicketPrint###DynamicField'             => 2,
    'Ticket::Frontend::AgentTicketZoom###DynamicField'              => 2,
    'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField' => 2,
    'Ticket::Frontend::CustomerTicketOverview###DynamicField'       => 2,
    'Ticket::Frontend::CustomerTicketPrint###DynamicField'          => 2,
    'Ticket::Frontend::CustomerTicketSearch###DynamicField'         => 2,
    'Ticket::Frontend::CustomerTicketZoom###DynamicField'           => 2,
    'Ticket::Frontend::OverviewMedium###DynamicField'               => 2,
    'Ticket::Frontend::OverviewPreview###DynamicField'              => 2,
    'Ticket::Frontend::OverviewSmall###DynamicField'                => 2,
);

my $RandomID1 = $HelperObject->GetRandomID();
my $RandomID2 = $HelperObject->GetRandomID();

my @DynamicFieldConfigs = (
    {
        Name          => 'TestDynamicField' . $RandomID1,
        Label         => "TestDynamicField" . $RandomID1,
        InternalField => 0,
        ObjectType    => 'Ticket',
        FieldType     => 'Text',
        Config        => {
            DefaultValue => "",
        },
    },
    {
        Name          => 'TestDynamicField' . $RandomID2,
        Label         => "TestDynamicField" . $RandomID2,
        InternalField => 0,
        ObjectType    => 'Ticket',
        FieldType     => 'Text',
        Config        => {
            DefaultValue => "",
        },
    },
);

$ZnunyHelperObject->_DynamicFieldsCreate(@DynamicFieldConfigs);

#
# Element: Screens without support for requirable dynamic fields
#
my $Element;
my %NewConfig;
my %Config = (
    'TestDynamicField' . $RandomID1 => 1,
    'TestDynamicField' . $RandomID2 => 2,
);

for my $Screen ( sort keys %ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport ) {
    %NewConfig = $DynamicFieldScreenConfigurationObject->ValidateDynamicFieldActivation(
        Config  => \%Config,
        Element => $Screen,
    );

    $Self->IsNotDeeply(
        \%Config,
        \%NewConfig,
        "ValidateDynamicFieldActivation - $Screen - is not equal to first config",
    );
    $Self->IsDeeply(
        \%NewConfig,
        {
            'TestDynamicField' . $RandomID1 => 1,
            'TestDynamicField' . $RandomID2 => 1,
        },
        "ValidateDynamicFieldActivation - $Screen - config changed",
    );
}

#
# Element: Screen with support for requirable dynamic fields
#

$Element = 'Ticket::Frontend::AgentTicketNote###DynamicField';

%NewConfig = $DynamicFieldScreenConfigurationObject->ValidateDynamicFieldActivation(
    Config  => \%Config,
    Element => $Element,
);

$Self->IsDeeply(
    \%Config,
    \%NewConfig,
    "ValidateDynamicFieldActivation - $Element - is equal to first config",
);

#
# Element: Dynamic field in screen without support for requirable dynamic fields
#
$Element = 'TestDynamicField' . $RandomID1;

for my $Screen ( sort keys %ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport ) {
    %Config          = ();
    $Config{$Screen} = $ConfigKeysOfScreensWithoutMandatoryDynamicFieldSupport{$Screen};
    %NewConfig       = $DynamicFieldScreenConfigurationObject->ValidateDynamicFieldActivation(
        Config  => \%Config,
        Element => $Element,
    );

    $Self->IsNotDeeply(
        \%Config,
        \%NewConfig,
        "ValidateDynamicFieldActivation - $Element - is not equal to first config",
    );
    $Self->IsDeeply(
        \%NewConfig,
        {
            $Screen => 1,
        },
        "ValidateDynamicFieldActivation - $Element - config changed",
    );
}

#
# Element: Dynamic field in different screens
#
%Config = (
    'Ticket::Frontend::AgentTicketNote###DynamicField' => 2,
    'Ticket::Frontend::AgentTicketZoom###DynamicField' => 2,
);

%NewConfig = $DynamicFieldScreenConfigurationObject->ValidateDynamicFieldActivation(
    Config  => \%Config,
    Element => $Element,
);

$Self->IsDeeply(
    \%NewConfig,
    {
        'Ticket::Frontend::AgentTicketNote###DynamicField' => 2,
        'Ticket::Frontend::AgentTicketZoom###DynamicField' => 1,
    },
    "ValidateDynamicFieldActivation - $Element - change value for AgentTicketZoom",
);

#
# GetConfigKeysOfScreensByObjectType
#
my %ConfigKeysOfScreensByObjectType = $DynamicFieldScreenConfigurationObject->GetConfigKeysOfScreensByObjectType(
    ObjectType => 'Ticket',
);

$Self->IsDeeply(
    \%ConfigKeysOfScreensByObjectType,
    {
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
        'Ticket::Frontend::AgentTicketClose###DynamicField'                  => 'AgentTicketClose',
        'Ticket::Frontend::AgentTicketCompose###DynamicField'                => 'AgentTicketCompose',
        'Ticket::Frontend::AgentTicketEmail###DynamicField'                  => 'AgentTicketEmail',
        'Ticket::Frontend::AgentTicketEmailOutbound###DynamicField'          => 'AgentTicketEmailOutbound',
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns'       => 'AgentTicketEscalationView',
        'Ticket::Frontend::AgentTicketForward###DynamicField'                => 'AgentTicketForward',
        'Ticket::Frontend::AgentTicketFreeText###DynamicField'               => 'AgentTicketFreeText',
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns'           => 'AgentTicketLockedView',
        'Ticket::Frontend::AgentTicketMove###DynamicField'                   => 'AgentTicketMove',
        'Ticket::Frontend::AgentTicketNote###DynamicField'                   => 'AgentTicketNote',
        'Ticket::Frontend::AgentTicketOwner###DynamicField'                  => 'AgentTicketOwner',
        'Ticket::Frontend::AgentTicketPending###DynamicField'                => 'AgentTicketPending',
        'Ticket::Frontend::AgentTicketPhone###DynamicField'                  => 'AgentTicketPhone',
        'Ticket::Frontend::AgentTicketPhoneInbound###DynamicField'           => 'AgentTicketPhoneInbound',
        'Ticket::Frontend::AgentTicketPhoneOutbound###DynamicField'          => 'AgentTicketPhoneOutbound',
        'Ticket::Frontend::AgentTicketPrint###DynamicField'                  => 'AgentTicketPrint',
        'Ticket::Frontend::AgentTicketPriority###DynamicField'               => 'AgentTicketPriority',
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns'                => 'AgentTicketQueue',
        'Ticket::Frontend::AgentTicketResponsible###DynamicField'            => 'AgentTicketResponsible',
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns'      => 'AgentTicketResponsibleView',
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns'               => 'AgentTicketSearch (Overview Screen)',
        'Ticket::Frontend::AgentTicketSearch###DynamicField'                 => 'AgentTicketSearch (Screen)',
        'Ticket::Frontend::AgentTicketService###DefaultColumns'              => 'AgentTicketService',
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns'           => 'AgentTicketStatusView',
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns'            => 'AgentTicketWatchView',
        'Ticket::Frontend::AgentTicketZoom###DynamicField'                   => 'AgentTicketZoom',
        'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField'      => 'ProcessWidgetDynamicField',
        'Ticket::Frontend::CustomerTicketMessage###DynamicField'             => 'CustomerTicketMessage',
        'Ticket::Frontend::CustomerTicketOverview###DynamicField'            => 'CustomerTicketOverview',
        'Ticket::Frontend::CustomerTicketPrint###DynamicField'               => 'CustomerTicketPrint',
        'Ticket::Frontend::CustomerTicketSearch###DynamicField'              => 'CustomerTicketSearch',
        'Ticket::Frontend::CustomerTicketZoom###DynamicField'                => 'CustomerTicketZoom',
        'Ticket::Frontend::OverviewMedium###DynamicField'                    => 'OverviewMedium',
        'Ticket::Frontend::OverviewPreview###DynamicField'                   => 'OverviewPreview',
        'Ticket::Frontend::OverviewSmall###DynamicField'                     => 'OverviewSmall',
        'Ticket::Frontend::AgentTicketNoteToLinkedTicket###DynamicField'     => 'AgentTicketNoteToLinkedTicket',
    },
    "GetConfigKeysOfScreensByObjectType - Ticket",
);

my %Screens = (
    'Ticket::Frontend::NOTEXISTS###DynamicField'        => 'NOTEXISTS',
    'Ticket::Frontend::AgentTicketPrint###DynamicField' => 'AgentTicketPrint',
    'Ticket::Frontend::AgentTicketZoom###DynamicField'  => 'AgentTicketZoom',
);

%ConfigKeysOfScreensByObjectType = $DynamicFieldScreenConfigurationObject->GetConfigKeysOfScreensByObjectType(
    ObjectType => 'Ticket',
    Screens    => \%Screens
);

$Self->IsDeeply(
    \%ConfigKeysOfScreensByObjectType,
    {
        'Ticket::Frontend::AgentTicketPrint###DynamicField' => 'AgentTicketPrint',
        'Ticket::Frontend::AgentTicketZoom###DynamicField'  => 'AgentTicketZoom',
    },
    "GetConfigKeysOfScreensByObjectType - Ticket - Screens",
);

#
# GetDynamicFieldObjectTypes
#
my @DynamicFieldObjectTypes = $DynamicFieldScreenConfigurationObject->GetDynamicFieldObjectTypes();

$Self->IsDeeply(
    \@DynamicFieldObjectTypes,
    [
        'Article',
        'Ticket',
    ],
    "GetGetDynamicFieldObjectTypes",
);

@DynamicFieldObjectTypes = $DynamicFieldScreenConfigurationObject->GetDynamicFieldObjectTypes(
    Screen => 'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder'
);

$Self->IsDeeply(
    \@DynamicFieldObjectTypes,
    [
        'Ticket',
    ],
    "GetGetDynamicFieldObjectTypes - Screen",
);

1;
