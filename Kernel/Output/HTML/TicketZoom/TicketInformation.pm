# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::TicketZoom::TicketInformation;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;
use utf8;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject         = $Kernel::OM->Get('Kernel::System::User');
    my $StateObject        = $Kernel::OM->Get('Kernel::System::State');
    my $QueueObject        = $Kernel::OM->Get('Kernel::System::Queue');
    my $PriorityObject     = $Kernel::OM->Get('Kernel::System::Priority');
    my $ServiceObject      = $Kernel::OM->Get('Kernel::System::Service');
    my $SLAObject          = $Kernel::OM->Get('Kernel::System::SLA');
    my $TypeObject         = $Kernel::OM->Get('Kernel::System::Type');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $ProcessObject      = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process');
    my $ActivityObject     = $Kernel::OM->Get('Kernel::System::ProcessManagement::Activity');

    my %Ticket    = %{ $Param{Ticket} };
    my %AclAction = %{ $Param{AclAction} };

    my %State = $StateObject->StateGet(
        ID => $Ticket{StateID},
    );
    $Param{StateValidID} = $State{ValidID};

    my %Queue = $QueueObject->QueueGet(
        ID => $Ticket{QueueID},
    );
    $Param{QueueValidID} = $Queue{ValidID};

    my %Priority = $PriorityObject->PriorityGet(
        PriorityID => $Ticket{PriorityID},
        UserID     => $Self->{UserID},
    );
    $Param{PriorityValidID} = $Priority{ValidID};

    # Show created by name, if different then root user (ID=1).
    if ( $Ticket{CreateBy} > 1 ) {
        $Ticket{CreatedByUser} = $UserObject->UserName( UserID => $Ticket{CreateBy} );
        $LayoutObject->Block(
            Name => 'CreatedBy',
            Data => {%Ticket},
        );
    }

    if ( $Ticket{ArchiveFlag} eq 'y' ) {
        $LayoutObject->Block(
            Name => 'ArchiveFlag',
            Data => { %Ticket, %AclAction },
        );
    }

    # ticket type
    if ( $ConfigObject->Get('Ticket::Type') ) {

        my %Type = $TypeObject->TypeGet(
            ID => $Ticket{TypeID},
        );

        $LayoutObject->Block(
            Name => 'Type',
            Data => {
                ValidID => $Type{ValidID},
                %Ticket,
                %AclAction
            },
        );
    }

    # ticket service
    if ( $ConfigObject->Get('Ticket::Service') && $Ticket{Service} ) {

        my %Service = $ServiceObject->ServiceGet(
            ServiceID => $Ticket{ServiceID},
            UserID    => 1,
        );

        $LayoutObject->Block(
            Name => 'Service',
            Data => {
                %Ticket,
                %AclAction,
                %Service,
            },
        );
        if ( $Ticket{SLA} ) {

            my %SLA = $SLAObject->SLAGet(
                SLAID  => $Ticket{SLAID},
                UserID => 1,
            );

            $LayoutObject->Block(
                Name => 'SLA',
                Data => {
                    %Ticket,
                    %AclAction,
                    %SLA,
                },
            );
        }
    }

    for my $TimerName (qw( FirstResponseTime UpdateTime SolutionTime )) {
        $Self->_AddTimeNeededBlock( \%Ticket, $TimerName, \%AclAction ) if defined $Ticket{$TimerName};
    }

    if ( $Ticket{CustomerID} ) {

        my $CICRWAccess = $LayoutObject->Permission(
            Action => 'AgentCustomerInformationCenter',
            Type   => 'rw',
        );

        $LayoutObject->Block(
            Name => $CICRWAccess ? 'CustomerIDRW' : 'CustomerIDRO',
            Data => \%Ticket,
        );

        # Show number of open tickets with the same customer id if feature is active:
        if ( $ConfigObject->Get('Ticket::Frontend::ZoomCustomerTickets') ) {
            $Ticket{CustomerIDTickets} = $TicketObject->TicketSearch(
                CustomerID => $Ticket{CustomerID},
                Result     => 'COUNT',
                Permission => 'ro',
                UserID     => $Self->{UserID},
            );
            $LayoutObject->Block(
                Name => 'CustomerIDTickets',
                Data => \%Ticket,
            );
        }
    }

    # show total accounted time if feature is active:
    if ( $ConfigObject->Get('Ticket::Frontend::AccountTime') ) {
        $Ticket{TicketTimeUnits} = $TicketObject->TicketAccountedTimeGet(%Ticket);
        $LayoutObject->Block(
            Name => 'TotalAccountedTime',
            Data => \%Ticket,
        );
    }

    # show pending until, if set:
    if ( $Ticket{UntilTime} ) {
        if ( $Ticket{UntilTime} < -1 ) {
            $Ticket{PendingUntilClass} = 'Warning';
        }

        my $CurSysDTObject = $Kernel::OM->Create('Kernel::System::DateTime');
        $Ticket{UntilTimeHuman} = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                Epoch => ( $Ticket{UntilTime} + $CurSysDTObject->ToEpoch() ),
            },
        )->ToString();

        $Ticket{PendingUntil} .= $LayoutObject->CustomerAge(
            Age   => $Ticket{UntilTime},
            Space => ' '
        );
        $LayoutObject->Block(
            Name => 'PendingUntil',
            Data => \%Ticket,
        );
    }

    my %OnlineData;

    # owner info
    my %OwnerInfo = $UserObject->GetUserData(
        UserID => $Ticket{OwnerID},
    );
    $LayoutObject->Block(
        Name => 'Owner',
        Data => { %Ticket, %OwnerInfo, %AclAction, %{ $OnlineData{OwnerID} // {} } },
    );

    if ( $ConfigObject->Get('Ticket::Responsible') ) {

        # show responsible
        my %ResponsibleInfo = $UserObject->GetUserData(
            UserID => $Ticket{ResponsibleID} || 1,
        );

        $LayoutObject->Block(
            Name => 'Responsible',
            Data => { %Ticket, %ResponsibleInfo, %AclAction, %{ $OnlineData{ResponsibleID} // {} } },
        );
    }

    # set display options
    $Param{WidgetTitle} = Translatable('Ticket Information');
    $Param{Hook}        = $ConfigObject->Get('Ticket::Hook') || 'Ticket#';

    # check if ticket is normal or process ticket
    my $IsProcessTicket = $TicketObject->TicketCheckForProcessType(
        TicketID => $Ticket{TicketID}
    );

    # get zoom settings depending on ticket type
    $Self->{DisplaySettings} = $ConfigObject->Get("Ticket::Frontend::AgentTicketZoom");

    # overwrite display options for process ticket
    if ($IsProcessTicket) {
        $Param{WidgetTitle} = $Self->{DisplaySettings}->{ProcessDisplay}->{WidgetTitle};

        # get the DF where the ProcessEntityID is stored
        my $ProcessEntityIDField = 'DynamicField_'
            . $ConfigObject->Get("Process::DynamicFieldProcessManagementProcessID");

        # get the DF where the AtivityEntityID is stored
        my $ActivityEntityIDField = 'DynamicField_'
            . $ConfigObject->Get("Process::DynamicFieldProcessManagementActivityID");

        my $ProcessData = $ProcessObject->ProcessGet(
            ProcessEntityID => $Ticket{$ProcessEntityIDField},
        );
        my $ActivityData = $ActivityObject->ActivityGet(
            Interface        => 'AgentInterface',
            ActivityEntityID => $Ticket{$ActivityEntityIDField},
        );

        # output process information in the sidebar
        $LayoutObject->Block(
            Name => 'ProcessData',
            Data => {
                Process  => $ProcessData->{Name}  || '',
                Activity => $ActivityData->{Name} || '',
            },
        );
    }

    # get dynamic field config for frontend module
    my $DynamicFieldFilter = {
        %{ $ConfigObject->Get("Ticket::Frontend::AgentTicketZoom")->{DynamicField} || {} },
        %{
            $ConfigObject->Get("Ticket::Frontend::AgentTicketZoom")
                ->{ProcessWidgetDynamicField}
                || {}
        },
    };

    # get the dynamic fields for ticket object
    my $DynamicField = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['Ticket'],
        FieldFilter => $DynamicFieldFilter || {},
    );
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    # to store dynamic fields to be displayed in the process widget and in the sidebar
    my @FieldsSidebar;

    # cycle trough the activated Dynamic Fields for ticket object
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicField} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
        next DYNAMICFIELD if !defined $Ticket{ 'DynamicField_' . $DynamicFieldConfig->{Name} };
        next DYNAMICFIELD if $Ticket{ 'DynamicField_' . $DynamicFieldConfig->{Name} } eq '';

        # Check if this field is supposed to be hidden from the ticket information box.
        #   For example, it's displayed by a different mechanism (i.e. async widget).
        if (
            $DynamicFieldBackendObject->HasBehavior(
                DynamicFieldConfig => $DynamicFieldConfig,
                Behavior           => 'IsHiddenInTicketInformation',
            )
            )
        {
            next DYNAMICFIELD;
        }

        my $SkipWebserviceDynamicField = $Self->_SkipWebserviceDynamicField(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Ticket{ 'DynamicField_' . $DynamicFieldConfig->{Name} },
        );
        next DYNAMICFIELD if $SkipWebserviceDynamicField;

        # use translation here to be able to reduce the character length in the template
        my $Label = $LayoutObject->{LanguageObject}->Translate( $DynamicFieldConfig->{Label} );

        my $ValueStrg = $DynamicFieldBackendObject->DisplayValueRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            Value              => $Ticket{ 'DynamicField_' . $DynamicFieldConfig->{Name} },
            LayoutObject       => $LayoutObject,
            ValueMaxChars      => $ConfigObject->
                Get('Ticket::Frontend::DynamicFieldsZoomMaxSizeSidebar')
                || 18,    # limit for sidebar display
        );

        if ( $Self->{DisplaySettings}->{DynamicField}->{ $DynamicFieldConfig->{Name} } ) {
            push @FieldsSidebar, {
                $DynamicFieldConfig->{Name} => $ValueStrg->{Title},
                Name                        => $DynamicFieldConfig->{Name},
                Title                       => $ValueStrg->{Title},
                Value                       => $ValueStrg->{Value},
                Label                       => $Label,
                Link                        => $ValueStrg->{Link},
                LinkPreview                 => $ValueStrg->{LinkPreview},

                # Include unique parameter with dynamic field name in case of collision with others.
                #   Please see bug#13362 for more information.
                "DynamicField_$DynamicFieldConfig->{Name}" => $ValueStrg->{Title},
            };
        }

        # example of dynamic fields order customization
        $LayoutObject->Block(
            Name => 'TicketDynamicField_' . $DynamicFieldConfig->{Name},
            Data => {
                Label => $Label,
            },
        );

        $LayoutObject->Block(
            Name => 'TicketDynamicField_' . $DynamicFieldConfig->{Name} . '_Plain',
            Data => {
                Value => $ValueStrg->{Value},
                Title => $ValueStrg->{Title},
            },
        );
    }

    # output dynamic fields in the sidebar
    for my $Field (@FieldsSidebar) {

        $LayoutObject->Block(
            Name => 'TicketDynamicField',
            Data => {
                Label => $Field->{Label},
            },
        );

        if ( $Field->{Link} ) {
            $LayoutObject->Block(
                Name => 'TicketDynamicFieldLink',
                Data => {
                    $Field->{Name} => $Field->{Title},
                    %Ticket,

                    # alias for ticket title, Title will be overwritten
                    TicketTitle => $Ticket{Title},
                    Value       => $Field->{Value},
                    ValueKey    => $Ticket{"DynamicField_$Field->{Name}"},
                    Title       => $Field->{Title},
                    Link        => $Field->{Link},
                    LinkPreview => $Field->{LinkPreview},

                    # Include unique parameter with dynamic field name in case of collision with others.
                    #   Please see bug#13362 for more information.
                    "DynamicField_$Field->{Name}" => $Field->{Title},
                },
            );
        }
        else {
            $LayoutObject->Block(
                Name => 'TicketDynamicFieldPlain',
                Data => {
                    Value => $Field->{Value},
                    Title => $Field->{Title},
                },
            );
        }
    }

    if ( IsStringWithData( $Ticket{StateID} ) ) {
        $Param{PillClass} .= 'pill StateID-' . $Ticket{StateID};
    }

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AgentTicketZoom/TicketInformation',
        Data         => { %Param, %Ticket, %AclAction },
    );

    my $Config = $Param{Config};
    my %Rank;
    %Rank = ( Rank => $Config->{Rank} ) if exists $Config->{Rank} && defined $Config->{Rank};

    return {
        Output => $Output,
        %Rank,
    };
}

sub _AddTimeNeededBlock {
    my ( $Self, $Ticket, $TimerName, $AclAction ) = @_;
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $Ticket->{"${TimerName}Human"} = $LayoutObject->CustomerAge(
        Age                => $Ticket->{$TimerName},
        TimeShowAlwaysLong => 1,
        Space              => ' ',
    );
    $Ticket->{"${TimerName}WorkingTime"} = $LayoutObject->CustomerAge(
        Age                => $Ticket->{"${TimerName}WorkingTime"},
        TimeShowAlwaysLong => 1,
        Space              => ' ',
    );
    if ( 60 * 60 * 1 > $Ticket->{$TimerName} ) {
        $Ticket->{"${TimerName}Class"} = 'Warning';
    }
    $LayoutObject->Block(
        Name => $TimerName,
        Data => { %$Ticket, %$AclAction },
    );
    return;
}

# Checks if dynamic fields of types WebserviceDropdown and WebserviceMultiselect
# should be skipped if they have no display value and SysConfig option
# Ticket::Frontend::AgentTicketZoom###HideWebserviceDynamicFieldsWithoutDisplayValue
# is enabled.
sub _SkipWebserviceDynamicField {
    my ( $Self, %Param ) = @_;

    my $LogObject                    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject                 = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldWebserviceObject = $Kernel::OM->Get('Kernel::System::DynamicField::Webservice');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig Value)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $DynamicFieldConfig = $Param{DynamicFieldConfig};
    return 1 if !IsHashRefWithData($DynamicFieldConfig);

    return if !$DynamicFieldWebserviceObject->{SupportedDynamicFieldTypes}->{ $DynamicFieldConfig->{FieldType} };

    my $Value = $Param{Value};
    return 1 if !length $Value;

    my $AgentTicketZoomConfig = $ConfigObject->Get('Ticket::Frontend::AgentTicketZoom');
    return if !IsHashRefWithData($AgentTicketZoomConfig);

    my $HideWebserviceDynamicFieldsWithoutDisplayValue
        = $AgentTicketZoomConfig->{HideWebserviceDynamicFieldsWithoutDisplayValue};
    return if !$HideWebserviceDynamicFieldsWithoutDisplayValue;

    my $DisplayValue = $DynamicFieldWebserviceObject->DisplayValueGet(
        DynamicFieldConfig => $DynamicFieldConfig,
        Value              => $Value,
    );
    return if defined $DisplayValue && length $DisplayValue;

    return 1;
}

1;
