# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ParamObject)
## nofilter(TidyAll::Plugin::Znuny::Perl::LayoutObject)

package Kernel::System::Calendar::Plugin::Ticket::Create;
use Kernel::Language qw(Translatable);

use parent qw(Kernel::System::Calendar::Plugin::Base);

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Calendar',
    'Kernel::System::Calendar::Appointment',
    'Kernel::System::Calendar::Plugin',
    'Kernel::System::CustomerUser',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Group',
    'Kernel::System::JSON',
    'Kernel::System::LinkObject',
    'Kernel::System::Lock',
    'Kernel::System::Log',
    'Kernel::System::Priority',
    'Kernel::System::ProcessManagement::Process',
    'Kernel::System::Queue',
    'Kernel::System::Service',
    'Kernel::System::State',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
    'Kernel::System::Time',
    'Kernel::System::Type',
    'Kernel::System::User',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::System::Calendar::Plugin::Ticket::Create - Ticket::Create plugin

=head1 DESCRIPTION

Ticket appointment plugin.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TicketCreatePluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Ticket::Create');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 RenderOutput()

renders the output as html.

    my $HTML = $TicketCreatePluginObject->RenderOutput(
        Param           => \%Param,
        GetParam        => \%GetParam,
        Appointment     => \%Appointment,
        Plugin          => \%Plugin,
        PermissionLevel => $PermissionLevel{$Permissions},
        UserID          => $Param{UserID},
    );

Returns:

    my $HTML = 'HTML';

=cut

sub RenderOutput {
    my ( $Self, %Param ) = @_;

    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $GroupObject        = $Kernel::OM->Get('Kernel::System::Group');
    my $StateObject        = $Kernel::OM->Get('Kernel::System::State');
    my $JSONObject         = $Kernel::OM->Get('Kernel::System::JSON');
    my $PluginObject       = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    if ( $Config && IsArrayRefWithData( $Config->{Group} ) ) {
        my %GroupList = reverse $GroupObject->PermissionUserGet(
            UserID => $Param{UserID},
            Type   => 'rw',
        );

        my $Access;
        GROUP:
        for my $Group ( @{ $Config->{Group} } ) {
            next GROUP if !$GroupList{$Group};

            $Access = 1;
            last GROUP;
        }
        return if !$Access;
    }

    if ( $Param{Plugin}->{Data}->{QueueID} && !IsArrayRefWithData( $Param{Plugin}->{Data}->{QueueID} ) ) {
        $Param{Plugin}->{Data}->{QueueID} = [ $Param{Plugin}->{Data}->{QueueID} ];
    }

    if ( $Param{Plugin}->{Data}->{CustomerUserID} ) {
        $Param{Plugin}->{Data}->{CustomerAutoComplete} = $CustomerUserObject->CustomerName(
            UserLogin => $Param{Plugin}->{Data}->{CustomerUserID},
        );
        my %User = $CustomerUserObject->CustomerUserDataGet(
            User => $Param{Plugin}->{Data}->{CustomerUserID},
        );

        $Param{Plugin}->{Data}->{CustomerID} = $User{UserCustomerID};
    }

    if ( $Param{Plugin}->{Data}->{Link} ) {
        $Param{Plugin}->{Data}->{Link} = 'checked';
    }

    # Default to 1 for ticket pending time offset if not set (yet).
    $Param{Plugin}->{Data}->{TicketPendingTimeOffset} = $Param{Plugin}->{Data}->{TicketPendingTimeOffset} // 1;

    # add Data to Param to use the next functions several times (initial and via AJAXUpdate)
    $Param{Plugin}->{Param} = $Param{Plugin}->{Data};
    $Param{Action} = 'AgentAppointmentEdit';

    $Param{TicketCreateTimeTypeStrg}    = $Self->_TicketCreateTimeTypeSelection(%Param);
    $Param{TicketCreateOffsetUnitStrg}  = $Self->_TicketCreateOffsetUnitSelection(%Param);
    $Param{TicketCreateOffsetPointStrg} = $Self->_TicketCreateOffsetPointSelection(%Param);

    $Param{QueueStrg}                       = $Self->_QueueSelection(%Param);
    $Param{OwnerStrg}                       = $Self->_OwnerSelection(%Param);
    $Param{StateStrg}                       = $Self->_StateSelection(%Param);
    $Param{PriorityStrg}                    = $Self->_PrioritySelection(%Param);
    $Param{LockStrg}                        = $Self->_LockSelection(%Param);
    $Param{TicketPendingTimeOffsetUnitStrg} = $Self->_TicketPendingTimeOffsetUnitSelection(%Param);

    my $TicketResponsible = $ConfigObject->Get('Ticket::Responsible');
    if ($TicketResponsible) {
        $Param{ResponsibleUserStrg} = $Self->_ResponsibleUserSelection(%Param);
        $LayoutObject->Block(
            Name => 'Responsible',
            Data => \%Param,
        );
    }

    my $TicketType = $ConfigObject->Get('Ticket::Type');
    if ($TicketType) {
        $Param{TypeStrg} = $Self->_TypeSelection(%Param);

        $LayoutObject->Block(
            Name => 'Type',
            Data => \%Param,
        );
    }

    my $TicketService = $ConfigObject->Get('Ticket::Service');
    if ($TicketService) {
        $Param{ServiceStrg} = $Self->_ServiceSelection(%Param);
        $Param{SLAStrg}     = $Self->_SLASelection(%Param);

        $LayoutObject->Block(
            Name => 'ServiceSLA',
            Data => \%Param,
        );
    }

    $Param{ProcessStrg} = $Self->_ProcessSelection(%Param);

    my @StateList = $StateObject->StateGetStatesByType(
        StateType => [ 'pending reminder', 'pending auto' ],
        Result    => 'ID',
    );

    $Param{PendingStateIDs} = $JSONObject->Encode(
        Data => \@StateList,
    );

    my $HTML = $LayoutObject->Output(
        TemplateFile => 'Calendar/Plugin/Ticket/Create',
        Data         => {
            %Param,
        },
        AJAX => 1,
    );

    return $HTML;
}

=head2 Update()

updated accordingly as needed.

    my $Success = $TicketCreatePluginObject->Update(
        GetParam    => \%GetParam,
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
                PendingStateIDs             => [7,8,6],
                TicketPendingTimeOffset     => 11,
                TicketPendingTimeOffsetUnit => 60,
                PriorityID                  => 1,
                ProcessID                   => 'Process-37d25e23af417c91c78939039316f8c5',
                QueueID                     => 1,
                ResponsibleUserID           => 1,
                SLAID                       => 1,
                ServiceID                   => 1,
                StateID                     => 1,
                TicketCreateTimeType        => 'Never',                # Never|Relative|StartTime
                TicketCreateOffset          => 2,
                TicketCreateOffsetUnit      => 3600,
                TicketCreateTime            => '2019-05-01 08:00:00',
                TicketCreated               => 1,
                TypeID                      => 1,
            },
        },
        UserID => 1,
    );

Returns:

    my $Success = 1;

=cut

sub Update {
    my ( $Self, %Param ) = @_;

    my $PluginObject      = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');
    my $AppointmentObject = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');

    my $AppointmentID = $Param{Appointment}->{AppointmentID};

    my %Appointment = $AppointmentObject->AppointmentGet(
        AppointmentID => $AppointmentID,
    );

    return if !%Appointment;

    # update current appointment (parent|single|single child)
    my %Data = $PluginObject->DataGet(
        AppointmentID => $AppointmentID,
        PluginKey     => $Param{Plugin}->{PluginKey},
        UserID        => 1,
    );

    $Self->_PrepareUpdateData(
        %Param,
    );

    if (
        %Data
        && $Param{Plugin}->{Param}->{TicketCreateTimeType}
        && $Param{Plugin}->{Param}->{TicketCreateTimeType} eq 'Never'
        )
    {
        $PluginObject->DataDelete(
            ID     => $Data{ID},
            UserID => $Param{UserID},
        );
    }
    elsif (%Data) {

        $PluginObject->DataUpdate(
            ID     => $Data{ID},
            Config => {
                %{ $Data{Config} },
                %{ $Param{Plugin}->{Param} },
            },
            CreateBy => $Param{UserID},
            ChangeBy => $Param{UserID},
            UserID   => $Param{UserID},
        );

    }
    else {
        $PluginObject->DataAdd(
            AppointmentID => $Param{Appointment}->{AppointmentID},
            PluginKey     => $Param{Plugin}->{PluginKey},
            Config        => {
                %{ $Param{Plugin}->{Param} },
            },
            CreateBy => $Param{UserID},
            ChangeBy => $Param{UserID},
            UserID   => $Param{UserID},
        );
    }

    # if Recurring = 0, then AppointmentID is child appointment and we only update the current appointment
    # if Recurring = 1, then AppointmentID is parent appointment and we delete and create new all 'child' appointments
    return 1 if !$Param{GetParam}->{Recurring};

    my @Appointments = $AppointmentObject->AppointmentRecurringGet(
        AppointmentID => $AppointmentID,
    );

    # Create/update base plugin entry for the recurring appointments.
    APPOINTMENT:
    for my $Appointment (@Appointments) {

        if (
            $Appointment->{AppointmentID}
            && $Param{Plugin}->{Param}->{TicketCreateTimeType}
            && $Param{Plugin}->{Param}->{TicketCreateTimeType} eq 'Never'
            )
        {
            $PluginObject->DataDelete(
                ID     => $Appointment->{AppointmentID},
                UserID => $Param{UserID},
            );
            next APPOINTMENT;
        }

        $Self->_PrepareUpdateData(
            %Param,
            Appointment => $Appointment,
        );

        $PluginObject->DataAdd(
            AppointmentID => $Appointment->{AppointmentID},
            PluginKey     => $Param{Plugin}->{PluginKey},
            Config        => {
                %{ $Param{Plugin}->{Param} },
            },
            CreateBy => $Param{UserID},
            ChangeBy => $Param{UserID},
            UserID   => $Param{UserID},
        );
    }

    return 1;
}

=head2 Get()

Get all plugin information.

    my $Data = $TicketCreatePluginObject->Get(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
    );

Returns:

    my $Data = {};

=cut

sub Get {
    my ( $Self, %Param ) = @_;

    my $PluginObject   = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');
    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %Data = $PluginObject->DataGet(
        AppointmentID => $Param{Appointment}->{AppointmentID},
        PluginKey     => $Param{Plugin}->{PluginKey},
        UserID        => 1,
    );
    return if ( !%Data );

    if (
        $Data{Config}
        && $Data{Config}->{TicketCreateTimeType}
        && $Data{Config}->{TicketCreateTimeType} ne 'Never'
        && $Data{Config}->{TicketCreateTime}
        )
    {

        my $OTRSTimeZone   = Kernel::System::DateTime->OTRSTimeZoneGet();
        my $DateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                String   => $Data{Config}->{TicketCreateTime},
                TimeZone => $OTRSTimeZone,
            }
        );

        $DateTimeObject->ToTimeZone( TimeZone => $LayoutObject->{UserTimeZone} );
        my $DateTimeString = $DateTimeObject->ToString();

        my $Value = $LanguageObject->Translate( $Data{Config}->{TicketCreateTimeType} )
            . ': ' . $DateTimeString;

        $Data{Icon}  = 'ticket';
        $Data{Value} = $Value;
    }

    return \%Data;
}

=head2 AJAXUpdate()

Return an array with all plugin ajax update informations to build the LayoutObject selection JSON.

    my $PluginAJAX = $TicketCreatePluginObject->AJAXUpdate(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
    );

Returns:

    my $PluginAJAX = (
        {
            Data         => \%Data,
            Name         => 'Plugin_HTML_Field',
            ID           => 'Plugin_HTML_Field',
            SelectedID   => 1,
            PossibleNone => 1,
            Translation  => 1,
            Class        => 'Modernize',
        },
    );

=cut

sub AJAXUpdate {
    my ( $Self, %Param ) = @_;

    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject    = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $StateObject    = $Kernel::OM->Get('Kernel::System::State');
    my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    my @ParamNames = $ParamObject->GetParamNames();

    PARAMNAME:
    for my $Key (@ParamNames) {

        # skip the Acton parameter, it's giving BuildDateSelection problems for some reason
        next PARAMNAME if $Key eq 'Action';
        next PARAMNAME if $Key eq 'QueueID';

        $Param{$Key} = $ParamObject->GetParam( Param => $Key );
    }

    @{ $Param{QueueIDs} } = $ParamObject->GetArray(
        Param => 'QueueID',
    );

    if ( scalar @{ $Param{QueueIDs} } eq 1 ) {
        $Param{QueueID} = $Param{QueueIDs}[0];
    }

    # this is needed to get the Ticket::Frontend::AgentAppointmentEdit### config
    $Param{Action} = 'AgentAppointmentEdit';

    my %Owner            = $Self->_GetUsers(%Param);
    my %ResponsibleUsers = $Self->_GetResponsibles(%Param);
    my %States           = $Self->_GetStates(%Param);
    my $StateDefaultID   = $StateObject->StateLookup(
        State => $Config->{StateDefault},
    );

    my $PriorityDefaultID = $PriorityObject->PriorityLookup(
        Priority => $Config->{PriorityDefault},
    );
    my %Priorities = $Self->_GetPriorities(%Param);
    my %Locks      = $Self->_GetLocks(%Param);
    my %Types      = $Self->_GetTypes(%Param);
    my %Services   = $Self->_GetServices(%Param);
    my %SLAs       = $Self->_GetSLAs(%Param);

    # lock if owner is selected (OwnerID exists)
    $Param{LockID} = 1;
    if ( $Param{OwnerID} || IsStringWithData( $Param{OwnerID} ) ) {
        $Param{LockID} = 2;
    }

    my @AJAXPlugin = (
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_OwnerID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_OwnerID',
            Data         => \%Owner,
            SelectedID   => $Param{Plugin}->{Param}->{OwnerID},
            PossibleNone => 1,
            Translation  => 0,
            Class        => 'Modernize W75pc',
            Max          => 100,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ResponsibleUserID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ResponsibleUserID',
            Data         => \%ResponsibleUsers,
            SelectedID   => $Param{Plugin}->{Param}->{ResponsibleUserID},
            PossibleNone => 1,
            Translation  => 0,
            Class        => 'Modernize W75pc',
            Max          => 100,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_StateID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_StateID',
            Data         => \%States,
            SelectedID   => $Param{Plugin}->{Param}->{StateID} || $StateDefaultID,
            PossibleNone => $Config->{StateDefault} ? 0 : 1,
            Translation  => 1,
            Class        => 'Modernize W75pc',
            Max          => 100,
        },
        {
            ID          => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_PriorityID',
            Name        => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_PriorityID',
            Data        => \%Priorities,
            SelectedID  => $Param{Plugin}->{Param}->{PriorityID} || $PriorityDefaultID,
            Class       => 'Modernize W75pc',
            Translation => 1,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_LockID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_LockID',
            Data         => \%Locks,
            SelectedID   => $Param{Plugin}->{Param}->{LockID},
            Class        => 'Modernize W75pc',
            PossibleNone => 0,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TypeID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TypeID',
            Data         => \%Types,
            SelectedID   => $Param{Plugin}->{Param}->{TypeID},
            Class        => 'Modernize W75pc',
            PossibleNone => 0,
            Translation  => 1,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ServiceID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ServiceID',
            Data         => \%Services,
            SelectedID   => $Param{Plugin}->{Param}->{ServiceID},
            Class        => 'Modernize W75pc',
            TreeView     => $TreeView,
            PossibleNone => 1,
        },
        {
            ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_SLAID',
            Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_SLAID',
            Data         => \%SLAs,
            SelectedID   => $Param{Plugin}->{Param}->{SLAID},
            Class        => 'Modernize W75pc',
            PossibleNone => 1,
        },
    );

    return \@AJAXPlugin;
}

=head2 CalculateTicketCreateTime()

calculates the ticket create time as time stamp

    my $TicketCreateTime = $TicketCreatePluginObject->CalculateTicketCreateTime(
        StartTimeStamp          => '2019-05-01 08:00:00',
        EndTimeStamp            => '2019-05-02 08:00:00',
        TicketCreateOffset      => 2,
        TicketCreateOffsetUnit  => 3600,
        TicketCreateOffsetPoint => 'beforestart', #  afterstart | beforeend | afterend
    );

Returns:

    my $TicketCreateTime = 1;

=cut

sub CalculateTicketCreateTime {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $TimeObject = $Kernel::OM->Get('Kernel::System::Time');

    NEEDED:
    for my $Needed (qw(TicketCreateOffset TicketCreateOffsetUnit TicketCreateOffsetPoint)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !$Param{StartTimeStamp} && !$Param{EndTimeStamp} ) {

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'StartTimeStamp' or 'EndTimeStamp' is needed!",
        );
        return;
    }

    if ( !$Param{StartSystemTime} ) {
        $Param{StartSystemTime} = $TimeObject->TimeStamp2SystemTime(
            String => $Param{StartTimeStamp},
        );
    }

    if ( !$Param{EndSystemTime} ) {
        $Param{EndSystemTime} = $TimeObject->TimeStamp2SystemTime(
            String => $Param{EndTimeStamp},
        );
    }

    my $RealTicketCreateOffset = $Param{TicketCreateOffset} * $Param{TicketCreateOffsetUnit};

    my $TicketCreateSystemTime;
    if ( $Param{TicketCreateOffsetPoint} eq 'beforestart' ) {
        $TicketCreateSystemTime = $Param{StartSystemTime} - $RealTicketCreateOffset;
    }
    if ( $Param{TicketCreateOffsetPoint} eq 'afterstart' ) {
        $TicketCreateSystemTime = $Param{StartSystemTime} + $RealTicketCreateOffset;
    }
    if ( $Param{TicketCreateOffsetPoint} eq 'beforeend' ) {
        $TicketCreateSystemTime = $Param{EndSystemTime} - $RealTicketCreateOffset;
    }
    if ( $Param{TicketCreateOffsetPoint} eq 'afterend' ) {
        $TicketCreateSystemTime = $Param{EndSystemTime} + $RealTicketCreateOffset;
    }

    my $TicketCreateTimeStamp = $TimeObject->SystemTime2TimeStamp(
        SystemTime => $TicketCreateSystemTime,
    );

    return $TicketCreateTimeStamp;
}

=head2 TicketCreate()

Creates tickets for appointments.

    my $TicketCounter = $TicketCreatePluginObject->TicketCreate(
        %CalendarBasedTicketCreationData,
        UserID => 123,
    );

Returns number of created tickets.

=cut

sub TicketCreate {
    my ( $Self, %Param ) = @_;

    my $TicketObject              = $Kernel::OM->Get('Kernel::System::Ticket');
    my $LogObject                 = $Kernel::OM->Get('Kernel::System::Log');
    my $AppointmentObject         = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');
    my $ConfigObject              = $Kernel::OM->Get('Kernel::Config');
    my $LinkObject                = $Kernel::OM->Get('Kernel::System::LinkObject');
    my $TimeObject                = $Kernel::OM->Get('Kernel::System::Time');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $ProcessObject             = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process');
    my $CalendarObject            = $Kernel::OM->Get('Kernel::System::Calendar');
    my $ArticleObject             = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $PluginObject              = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

    NEEDED:
    for my $Needed (qw(AppointmentID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    NEEDED:
    for my $Needed (qw(TicketCreateTime)) {
        next NEEDED if defined $Param{Config}->{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $CurrentSystemTime      = $TimeObject->SystemTime();
    my $TicketCreateSystemTime = $TimeObject->TimeStamp2SystemTime(
        String => $Param{Config}->{TicketCreateTime},
    );

    my $DiffSystemTime = $CurrentSystemTime - $TicketCreateSystemTime;

    # don't create ticket if it's not due yet
    return 0 if $DiffSystemTime < 0;

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    # Check if ticket creation time is too far in the past.
    # In this case, the ticket will not be created anymore.
    my $TicketCreateCatchUpThresholdMinutes = $Config->{TicketCreateCatchUpThreshold} // 5;
    my $TicketCreateCatchUpThresholdSeconds = $TicketCreateCatchUpThresholdMinutes * 60;

    if ( $DiffSystemTime > $TicketCreateCatchUpThresholdSeconds ) {

        # Mark ticket creation as done (although not ticket was created).
        $PluginObject->DataUpdate(
            ID     => $Param{ID},
            Config => {
                %{ $Param{Config} },
                TicketCreated => '1',
            },
            CreateBy => $Param{UserID},
            ChangeBy => $Param{UserID},
            UserID   => $Param{UserID},
        );

        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Ticket for appointment with ID $Param{AppointmentID} and creation date $Param{Config}->{TicketCreateTime} was not created because catch-up threshold of $TicketCreateCatchUpThresholdMinutes minutes was exceeded.",
        );
        return 0;
    }

    my %Appointment = $AppointmentObject->AppointmentGet(
        AppointmentID => $Param{AppointmentID},
    );

    my $TicketCounter = 0;
    my %Calendar      = $CalendarObject->CalendarGet(
        CalendarID => $Appointment{CalendarID},
    );

    # run only for valid calendar
    return 0 if $Calendar{ValidID} ne 1;

    if ( !IsArrayRefWithData( $Param{Config}->{QueueID} ) ) {
        $Param{Config}->{QueueID} = [ $Param{Config}->{QueueID} ] || [];
    }

    TICKETINQUEUE:
    for my $QueueID ( @{ $Param{Config}->{QueueID} } ) {
        $TicketCounter++;

        my $TicketID = $TicketObject->TicketCreate(
            Title         => $Appointment{Title},
            QueueID       => $QueueID,
            LockID        => $Param{Config}->{LockID},
            StateID       => $Param{Config}->{StateID},
            TypeID        => $Param{Config}->{TypeID},
            PriorityID    => $Param{Config}->{PriorityID},
            ServiceID     => $Param{Config}->{ServiceID},
            SLAID         => $Param{Config}->{SLAID},
            OwnerID       => $Param{Config}->{OwnerID} || 1,
            ResponsibleID => $Param{Config}->{ResponsibleUserID},
            CustomerID    => $Param{Config}->{CustomerID},
            CustomerUser  => $Param{Config}->{CustomerUserID},
            UserID        => $Param{UserID},
        );

        if ( $Param{Config}->{TicketPendingTime} ne '1900-01-01 00:00:00' ) {
            $TicketObject->TicketPendingTimeSet(
                String   => $Param{Config}->{TicketPendingTime},
                TicketID => $TicketID,
                UserID   => $Param{UserID},
            );
        }

        my $ArticleID = $ArticleObject->ArticleCreate(
            TicketID             => $TicketID,
            ChannelName          => $Config->{ArticleChannelName},
            IsVisibleForCustomer => $Config->{ArticleIsVisibleForCustomer},
            SenderType           => $Config->{SenderType},
            From                 => $Calendar{CalendarName} || $Config->{From},
            Subject              => $Appointment{Title} || $Config->{Title},
            Body                 => $Appointment{Description} || $Config->{Body},
            ContentType          => $Config->{ContentType} || 'text/plain; charset=ISO-8859-15',
            HistoryType          => $Config->{HistoryType} || 'NewTicket',
            HistoryComment       => $Config->{HistoryComment},
            UserID               => $Param{UserID},
        );

        if ( $Param{Config}->{Link} ) {
            $LinkObject->LinkAdd(
                SourceObject => 'Ticket',
                SourceKey    => $TicketID,
                TargetObject => 'Appointment',
                TargetKey    => $Param{AppointmentID},
                Type         => 'Normal',
                State        => 'Valid',
                UserID       => $Param{UserID},
            );
        }

        if ( $Param{Config}->{ProcessID} ) {

            my $Process = $ProcessObject->ProcessGet(
                ProcessEntityID => $Param{Config}->{ProcessID},
            );

            if ( $Process->{State} ne 'Active' ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "Process '$Param{Config}->{ProcessID}' is not active!",
                );
                next TICKETINQUEUE;
            }

            if ( !$Process->{StartActivity} ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "StartActivity for '$Param{Config}->{ProcessID}' is needed!",
                );
                next TICKETINQUEUE;
            }

            my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                Name => 'ProcessManagementProcessID',
            );

            if ( !$DynamicFieldConfig ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "DynamicField 'ProcessManagementProcessID' is needed!",
                );
                next TICKETINQUEUE;
            }

            $DynamicFieldBackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $TicketID,
                Value              => $Param{Config}->{ProcessID},
                UserID             => $Param{UserID},
            );

            $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                Name => 'ProcessManagementActivityID',
            );

            if ( !$DynamicFieldConfig ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "DynamicField 'ProcessManagementActivityID' is needed!",
                );
                next TICKETINQUEUE;
            }

            $DynamicFieldBackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $TicketID,
                Value              => $Process->{StartActivity},
                UserID             => $Param{UserID},
            );
        }
    }

    # set TicketCreated to run only once
    $PluginObject->DataUpdate(
        ID     => $Param{ID},
        Config => {
            %{ $Param{Config} },
            TicketCreated => '1',
        },
        CreateBy => $Param{UserID},
        ChangeBy => $Param{UserID},
        UserID   => $Param{UserID},
    );

    return $TicketCounter;
}

=head2 Cleanup()

Cleanup obsolete calendar based ticket creation data.

    my $Counter = $TicketCreatePluginObject->Cleanup();

Returns:

    my $Counter = 1;

=cut

sub Cleanup {
    my ( $Self, %Param ) = @_;

    my $AppointmentObject = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');
    my $PluginObject      = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

    my @PuginDataListGet = $PluginObject->DataListGet(
        PluginKey => 'TicketCreate',
        UserID    => 1,
    );

    my $Counter = 0;
    TICKETCREATION:
    for my $TicketCreation (@PuginDataListGet) {

        my %Appointment = $AppointmentObject->AppointmentGet(
            AppointmentID => $TicketCreation->{AppointmentID},
        );
        next TICKETCREATION if %Appointment;

        $Counter++;
        my $Success = $PluginObject->DataDelete(
            ID            => $TicketCreation->{ID},
            AppointmentID => $TicketCreation->{AppointmentID},
            PluginKey     => 'TicketCreate',
            UserID        => 1,
        );
    }
    return $Counter;

}

sub _PrepareUpdateData {
    my ( $Self, %Param ) = @_;

    my $StateObject = $Kernel::OM->Get('Kernel::System::State');
    my $TimeObject  = $Kernel::OM->Get('Kernel::System::Time');

    $Param{Plugin}->{Param}->{TicketCreateOffset} //= 0;
    $Param{Plugin}->{Param}->{CustomerID} = $Param{GetParam}->{CustomerID};

    if (
        $Param{Plugin}->{Param}->{TicketCreateTimeType}
        && $Param{Plugin}->{Param}->{TicketCreateTimeType} eq 'Relative'
        && $Param{Plugin}->{Param}->{TicketCreateOffset}
        && $Param{Plugin}->{Param}->{TicketCreateOffsetPoint}
        && $Param{Plugin}->{Param}->{TicketCreateOffsetUnit}
        && $Param{Appointment}->{StartTime}
        && $Param{Appointment}->{EndTime}
        )
    {
        $Param{Plugin}->{Param}->{TicketCreateTime} = $Self->CalculateTicketCreateTime(
            StartTimeStamp          => $Param{Appointment}->{StartTime},
            EndTimeStamp            => $Param{Appointment}->{EndTime},
            TicketCreateOffset      => $Param{Plugin}->{Param}->{TicketCreateOffset},
            TicketCreateOffsetPoint => $Param{Plugin}->{Param}->{TicketCreateOffsetPoint},
            TicketCreateOffsetUnit  => $Param{Plugin}->{Param}->{TicketCreateOffsetUnit},
        );
    }
    elsif (
        $Param{Plugin}->{Param}->{TicketCreateTimeType}
        && $Param{Plugin}->{Param}->{TicketCreateTimeType} eq 'StartTime'
        )
    {
        $Param{Plugin}->{Param}->{TicketCreateTime} = $Param{Appointment}->{StartTime};
    }

    $Param{Plugin}->{Param}->{TicketPendingTime} = '1900-01-01 00:00:00';
    if ( $Param{Plugin}->{Param}->{StateID} ) {
        my @PendingStateList = $StateObject->StateGetStatesByType(
            StateType => [ 'pending reminder', 'pending auto' ],
            Result    => 'ID',
        );

        my $IsPendingState = grep { $Param{Plugin}->{Param}->{StateID} eq $_ } @PendingStateList;
        if ($IsPendingState) {
            my $TicketCreateSystemTime = $TimeObject->TimeStamp2SystemTime(
                String => $Param{Plugin}->{Param}->{TicketCreateTime},
            );

            $TicketCreateSystemTime +=
                ( $Param{Plugin}->{Param}->{TicketPendingTimeOffset} // 0 )
                * ( $Param{Plugin}->{Param}->{TicketPendingTimeOffsetUnit} // 60 );

            $Param{Plugin}->{Param}->{TicketPendingTime} = $TimeObject->SystemTime2TimeStamp(
                SystemTime => $TicketCreateSystemTime,
            );
        }
    }

    return 1;
}

sub _TicketCreateTimeTypeSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    return $LayoutObject->BuildSelection(
        ID   => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateTimeType',
        Name => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateTimeType',
        Data => {
            Never     => Translatable('Never'),
            Relative  => Translatable('Relative period'),
            StartTime => Translatable('On the date'),
        },
        Sort           => 'IndividualKey',
        SortIndividual => [ 'Never', 'Relative', 'StartTime' ],
        Translation    => 1,
        SelectedID     => $Param{Plugin}->{Data}->{TicketCreateTimeType} || 'Never',
        Multiple       => 0,
        Class          => 'Modernize W75pc',
        PossibleNone   => 0,
    );
}

sub _TicketCreateTimeDateTimeSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');

    $Param{Plugin}->{Data}->{TicketCreateTime} ||= $Param{Appointment}->{StartTime};

    my $SystemTime = $TimeObject->TimeStamp2SystemTime(
        String => $Param{Plugin}->{Data}->{TicketCreateTime},
    );
    my ( $Second, $Minute, $Hour, $Day, $Month, $Year, $DayOfWeek ) = $TimeObject->SystemTime2Date(
        SystemTime => $SystemTime,
    );

    # TicketCreateOffsetCustomDate date selection
    return $LayoutObject->BuildDateSelection(
        Prefix                         => 'TicketCreateTimeDateTime',
        TicketCreateTimeDateTimeYear   => $Year,
        TicketCreateTimeDateTimeMonth  => $Month,
        TicketCreateTimeDateTimeDay    => $Day,
        TicketCreateTimeDateTimeHour   => $Hour,
        TicketCreateTimeDateTimeMinute => $Minute,
        Format                         => 'DateInputFormatLong',
        YearPeriodPast                 => 5,
        YearPeriodFuture               => 5,
    );
}

sub _TicketCreateOffsetUnitSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    return $LayoutObject->BuildSelection(
        ID   => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateOffsetUnit',
        Name => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateOffsetUnit',
        Data => {
            60    => 'minute(s)',
            3600  => 'hour(s)',
            86400 => 'day(s)',
        },
        Sort           => 'IndividualKey',
        SortIndividual => [ '60', '3600', '86400' ],
        Translation    => 1,
        SelectedID     => $Param{Plugin}->{Data}->{TicketCreateOffsetUnit},
        Multiple       => 0,
        Class          => 'Modernize W75pc',
        PossibleNone   => 0,
    );
}

sub _TicketCreateOffsetPointSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    return $LayoutObject->BuildSelection(
        ID   => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateOffsetPoint',
        Name => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketCreateOffsetPoint',
        Data => {
            beforestart => 'before the appointment starts',
            afterstart  => 'after the appointment has been started',
            beforeend   => 'before the appointment ends',
            afterend    => 'after the appointment has been ended',
        },
        Sort           => 'IndividualKey',
        SortIndividual => [ 'beforestart', 'afterstart', 'beforeend', 'afterend' ],
        Translation    => 1,
        SelectedID     => $Param{Plugin}->{Data}->{TicketCreateOffsetPoint},
        Multiple       => 0,
        Class          => 'Modernize W75pc',
        PossibleNone   => 0,
    );
}

sub _QueueSelection {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    my %Queues = $Self->_GetQueues(%Param);

    return $LayoutObject->AgentQueueListOption(
        ID                 => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_QueueID',
        Name               => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_QueueID',
        Data               => \%Queues,
        SelectedIDRefArray => $Param{Plugin}->{Data}->{QueueID} || undef,
        Multiple           => 1,
        PossibleNone       => 0,
        Translation        => 0,
        TreeView           => $TreeView,
        Class              => 'Modernize W75pc',
        Max                => 100,
    );
}

sub _OwnerSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %Owner = $Self->_GetUsers(%Param);

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_OwnerID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_OwnerID',
        Data         => \%Owner,
        SelectedID   => $Param{Plugin}->{Data}->{OwnerID},
        PossibleNone => 1,
        Translation  => 0,
        Class        => 'Modernize W75pc',
        Max          => 100,
    );
}

sub _ResponsibleUserSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %ResponsibleUsers = $Self->_GetResponsibles(%Param);

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ResponsibleUserID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ResponsibleUserID',
        Data         => \%ResponsibleUsers,
        SelectedID   => $Param{Plugin}->{Data}->{ResponsibleUserID},
        PossibleNone => 1,
        Translation  => 0,
        Class        => 'Modernize W75pc',
        Max          => 100,
    );
}

sub _StateSelection {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $StateObject  = $Kernel::OM->Get('Kernel::System::State');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    my %States = $Self->_GetStates(%Param);

    my $StateDefaultID = $StateObject->StateLookup(
        State => $Config->{StateDefault},
    );

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_StateID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_StateID',
        Data         => \%States,
        SelectedID   => $Param{Plugin}->{Data}->{StateID} || $StateDefaultID,
        PossibleNone => $Config->{StateDefault} ? 0 : 1,
        Translation  => 1,
        Class        => 'Modernize W75pc',
        Max          => 100,
    );
}

sub _TicketPendingTimeOffsetUnitSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    return $LayoutObject->BuildSelection(
        ID   => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketPendingTimeOffsetUnit',
        Name => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TicketPendingTimeOffsetUnit',
        Data => {
            60    => 'minute(s)',
            3600  => 'hour(s)',
            86400 => 'day(s)',
        },
        Sort           => 'IndividualKey',
        SortIndividual => [ 'beforestart', 'afterstart', 'beforeend', 'afterend' ],
        SelectedID     => $Param{Plugin}->{Data}->{TicketPendingTimeOffsetUnit},
        Multiple       => 0,
        Class          => 'Modernize W75pc',
        PossibleNone   => 0,
    );
}

sub _PrioritySelection {
    my ( $Self, %Param ) = @_;

    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    my $PriorityDefaultID = $PriorityObject->PriorityLookup(
        Priority => $Config->{PriorityDefault},
    );

    my %Priorities = $Self->_GetPriorities(%Param);

    return $LayoutObject->BuildSelection(
        ID          => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_PriorityID',
        Name        => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_PriorityID',
        Data        => \%Priorities,
        SelectedID  => $Param{Plugin}->{Data}->{PriorityID} || $PriorityDefaultID,
        Class       => 'Modernize W75pc',
        Translation => 1,
    );
}

sub _LockSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %Locks = $Self->_GetLocks(%Param);

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_LockID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_LockID',
        Data         => \%Locks,
        SelectedID   => $Param{Plugin}->{Data}->{LockID} || 1,
        Class        => 'Modernize W75pc',
        PossibleNone => 0,
    );
}

sub _TypeSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LockObject   = $Kernel::OM->Get('Kernel::System::Lock');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $DefaultTicketType = $ConfigObject->Get('Ticket::Type::Default');

    my %Types        = $Self->_GetTypes(%Param);
    my %ReverseTypes = reverse %Types;

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TypeID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_TypeID',
        Data         => \%Types,
        SelectedID   => $Param{Plugin}->{Data}->{TypeID} || $ReverseTypes{$DefaultTicketType},
        Class        => 'Modernize W75pc',
        PossibleNone => 0,
        Translation  => 1,
    );
}

sub _ServiceSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get list type
    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    my %Services = $Self->_GetServices(%Param);

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ServiceID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ServiceID',
        Data         => \%Services,
        SelectedID   => $Param{Plugin}->{Data}->{ServiceID},
        Class        => 'Modernize W75pc',
        TreeView     => $TreeView,
        PossibleNone => 1,
    );
}

sub _SLASelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %SLAs = $Self->_GetSLAs(%Param);

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_SLAID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_SLAID',
        Data         => \%SLAs,
        SelectedID   => $Param{Plugin}->{Data}->{SLAID},
        Class        => 'Modernize W75pc',
        PossibleNone => 1,
    );
}

sub _ProcessSelection {
    my ( $Self, %Param ) = @_;

    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ProcessObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    my $ProcessList = $ProcessObject->ProcessList(
        ProcessState => ['Active'],
        Interface    => [ 'AgentInterface', 'CustomerInterface' ],
        Silent       => 1
    );

    return $LayoutObject->BuildSelection(
        ID           => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ProcessID',
        Name         => 'Plugin_' . $Param{Plugin}->{PluginKey} . '_ProcessID',
        Data         => $ProcessList || {},
        SelectedID   => $Param{Plugin}->{Data}->{ProcessID},
        Class        => 'Modernize W75pc',
        TreeView     => $Config->{'ProcessTreeView'} || 0,
        PossibleNone => 1,
    );
}

sub _GetQueues {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Get Queues.
    my %Queues = $TicketObject->TicketMoveList(
        %Param,
        TicketID => $Self->{TicketID},
        Action   => $Self->{Action},
        UserID   => $Param{UserID},
        Type     => 'move_into',
    );

    return %Queues;
}

sub _GetUsers {
    my ( $Self, %Param ) = @_;

    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $QueueObject  = $Kernel::OM->Get('Kernel::System::Queue');
    my $GroupObject  = $Kernel::OM->Get('Kernel::System::Group');

    my %ShownUsers;
    my %AllGroupsMembers = $UserObject->UserList(
        Type  => 'Short',
        Valid => 1,
    );

    # check show users
    if (
        $ConfigObject->Get('Ticket::ChangeOwnerToEveryone')
        || !$Param{Plugin}->{Param}->{QueueID}
        || IsArrayRefWithData( $Param{Plugin}->{Param}->{QueueID} )
        )
    {
        %ShownUsers = %AllGroupsMembers;
    }

    # show all users who are owner or rw in the queue group
    elsif ( $Param{Plugin}->{Param}->{QueueID} ) {
        my $GID   = $QueueObject->GetQueueGroupID( QueueID => $Param{Plugin}->{Param}->{QueueID} );
        my %Users = $GroupObject->PermissionGroupGet(
            GroupID => $GID,
            Type    => 'owner',
        );

        USER:
        for my $User ( sort keys %Users ) {
            next USER if !$AllGroupsMembers{$User};
            $ShownUsers{$User} = $AllGroupsMembers{$User};
        }
    }

    # workflow
    my $ACL = $TicketObject->TicketAcl(
        %Param,
        Action        => $Param{Action} || $Self->{Action},
        ReturnType    => 'Ticket',
        ReturnSubType => 'Owner',
        Data          => \%ShownUsers,
        UserID        => $Param{UserID},
    );

    if ($ACL) {
        %ShownUsers = $TicketObject->TicketAclData();
    }

    my %AllGroupsMembersFullnames = $UserObject->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    @ShownUsers{ keys %ShownUsers } = @AllGroupsMembersFullnames{ keys %ShownUsers };

    return %ShownUsers;
}

sub _GetResponsibles {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $QueueObject  = $Kernel::OM->Get('Kernel::System::Queue');
    my $GroupObject  = $Kernel::OM->Get('Kernel::System::Group');

    my %ShownUsers;
    my %AllGroupsMembers = $UserObject->UserList(
        Type  => 'Short',
        Valid => 1,
    );

    # check show users
    if (
        $ConfigObject->Get('Ticket::ChangeOwnerToEveryone')
        || !$Param{Plugin}->{Param}->{QueueID}
        || IsArrayRefWithData( $Param{Plugin}->{Param}->{QueueID} )
        )
    {
        %ShownUsers = %AllGroupsMembers;
    }

    # show all users who are owner or rw in the queue group
    elsif ( $Param{Plugin}->{Param}->{QueueID} ) {
        my $GID        = $QueueObject->GetQueueGroupID( QueueID => $Param{Plugin}->{Param}->{QueueID} );
        my %MemberList = $GroupObject->PermissionGroupGet(
            GroupID => $GID,
            Type    => 'responsible',
        );
        for my $MemberKey ( sort keys %MemberList ) {
            if ( $AllGroupsMembers{$MemberKey} ) {
                $ShownUsers{$MemberKey} = $AllGroupsMembers{$MemberKey};
            }
        }
    }

    # workflow
    my $ACL = $TicketObject->TicketAcl(
        %Param,
        Action        => $Param{Action} || $Self->{Action},
        ReturnType    => 'Ticket',
        ReturnSubType => 'Responsible',
        Data          => \%ShownUsers,
        UserID        => $Param{UserID},
    );

    if ($ACL) {
        %ShownUsers = $TicketObject->TicketAclData();
    }

    my %AllGroupsMembersFullnames = $UserObject->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    @ShownUsers{ keys %ShownUsers } = @AllGroupsMembersFullnames{ keys %ShownUsers };

    return %ShownUsers;
}

sub _GetStates {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $StateObject  = $Kernel::OM->Get('Kernel::System::State');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Config = $ConfigObject->Get('AppointmentCalendar::Plugin::TicketCreate');

    my %States;
    if ( $Param{QueueID} ) {
        %States = $TicketObject->TicketStateList(
            %Param,
            Action => $Param{Action} || $Self->{Action},
            UserID => $Param{UserID},
        );
    }
    else {
        %States = $StateObject->StateGetStatesByType(
            StateType => $Config->{StateType},
            Result    => 'HASH',
        );
    }

    return %States;
}

sub _GetPriorities {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # get priority
    my %Priorities = $TicketObject->TicketPriorityList(
        %Param,
        Action => $Param{Action} || $Self->{Action},
        UserID => $Param{UserID},
    );

    return %Priorities;
}

sub _GetLocks {
    my ( $Self, %Param ) = @_;

    my $LockObject = $Kernel::OM->Get('Kernel::System::Lock');

    my %LockList = $LockObject->LockList(
        UserID => $Param{UserID},
    );

    delete $LockList{3};

    return %LockList;
}

sub _GetTypes {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $TypeObject   = $Kernel::OM->Get('Kernel::System::Type');

    # get type
    my %Types;
    if ( $Param{QueueID} ) {
        %Types = $TicketObject->TicketTypeList(
            %Param,
            Action => $Param{Action} || $Self->{Action},
            UserID => $Param{UserID},
        );
    }
    else {
        %Types = $TypeObject->TypeList(
            Valid => 1
        );
    }

    return %Types;
}

sub _GetServices {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

    # get service
    my %Services;

    # get options for default services for unknown customers
    my $DefaultServiceUnknownCustomer = $ConfigObject->Get('Ticket::Service::Default::UnknownCustomer');

    # check if no CustomerUserID is selected
    # if $DefaultServiceUnknownCustomer = 0 leave CustomerUserID empty, it will not get any services
    # if $DefaultServiceUnknownCustomer = 1 set CustomerUserID to get default services
    if ( !$Param{Plugin}->{Param}->{CustomerUserID} && $DefaultServiceUnknownCustomer ) {
        $Param{Plugin}->{Param}->{CustomerUserID} = '<DEFAULT>';
    }

    # get service list
    if ( $Param{Plugin}->{Param}->{QueueID} && $Param{Plugin}->{Param}->{CustomerUserID} ) {
        if ( IsArrayRefWithData( $Param{Plugin}->{Param}->{QueueID} ) ) {
            $Param{QueueID} = $Param{Plugin}->{Param}->{QueueID}[0];
        }
        %Services = $TicketObject->TicketServiceList(
            %Param,
            QueueID        => $Param{Plugin}->{Param}->{QueueID},
            CustomerUserID => $Param{Plugin}->{Param}->{CustomerUserID},
            Action         => $Param{Action} || $Self->{Action},
            UserID         => $Param{UserID},
        );
    }
    elsif ( $Param{Plugin}->{Param}->{CustomerUserID} ) {
        %Services = $ServiceObject->CustomerUserServiceMemberList(
            Result            => 'HASH',
            CustomerUserLogin => $Param{Plugin}->{Param}->{CustomerUserID},
            UserID            => $Param{UserID},
        );
    }
    if ( $Param{Plugin}->{Param}->{CustomerUserID} eq '<DEFAULT>' ) {
        $Param{Plugin}->{Param}->{CustomerUserID} = '';
    }

    return %Services;
}

sub _GetSLAs {
    my ( $Self, %Param ) = @_;

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    $Param{Action} ||= $Self->{Action};

    # get sla
    my %SLAs;
    if ( $Param{Plugin}->{Param}->{ServiceID} && $Param{Plugin}->{Param}->{QueueID} && $Param{Action} ) {
        %SLAs = $TicketObject->TicketSLAList(
            %{ $Param{Plugin}->{Param} },
            Action => $Param{Action},
            UserID => $Param{UserID},
        );
    }
    elsif ( IsArrayRefWithData( $Param{Plugin}->{Param}->{QueueID} ) && $Param{Action} ) {
        $Param{QueueID} = $Param{Plugin}->{Param}->{QueueID}[0];

        if ( $Param{QueueID} && $Param{Action} ) {
            %SLAs = $TicketObject->TicketSLAList(
                %{ $Param{Plugin}->{Param} },
                Action => $Param{Action},
                UserID => $Param{UserID},
            );
        }
    }

    return %SLAs;
}

1;
