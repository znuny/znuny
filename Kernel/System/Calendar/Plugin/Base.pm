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

package Kernel::System::Calendar::Plugin::Base;

our @ObjectDependencies = (
    'Kernel::System::Calendar::Appointment',
    'Kernel::System::Calendar::Plugin',
);

=head1 NAME

Kernel::System::Calendar::Plugin::Base - Base plugin

=head1 DESCRIPTION

Ticket appointment plugin.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $BasePluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Base');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 RenderOutput()

renders the output as html.

    my $HTML = $BasePluginObject->RenderOutput(
        Param           => \%Param,
        GetParam        => \%GetParam,
        Appointment     => \%Appointment,
        Plugin          => \%Plugin,
        PermissionLevel => $PermissionLevel{$Permissions},
        UserID          => $Self->{UserID},
    );

Returns:

    my $HTML = 'HTML';

=cut

sub RenderOutput {
    my ( $Self, %Param ) = @_;

    return '';
}

=head2 Update()

updated accordingly as needed.

    variant 1: parent appointment with children (parent)

        param:
            Recurring = 1
            ParentID  = undef

        tasks:
            - update current appointment (parent)
            - delete children (should have happened before)
            - add new children

    variant 2: single appointment (single)

        param:
            Recurring = 0
            ParentID  = undef

        tasks:
            - update current appointment (single)

    variant 3: single child appointment is a child of a parent (single child)

        param:
            Recurring = 0
            ParentID  = 123

        tasks:
            - update current appointment (single child)


    my $Success = $BasePluginObject->Update(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
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

    if (%Data) {
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
    for my $Appointment (@Appointments) {

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

=head2 Delete()

delete all plugin information.

    my $Success = $BasePluginObject->Delete(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
    );

Returns:

    my $Success = 1;

=cut

sub Delete {
    my ( $Self, %Param ) = @_;

    my $PluginObject      = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');
    my $AppointmentObject = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');

    my $AppointmentID = $Param{Appointment}->{AppointmentID};

    my %Appointment = $AppointmentObject->AppointmentGet(
        AppointmentID => $AppointmentID,
    );
    return if !%Appointment;

    $PluginObject->DataDelete(
        AppointmentID => $AppointmentID,
        PluginKey     => $Param{Plugin}->{PluginKey},
        UserID        => 1,
    );

    # if Recurring = 0, then AppointmentID is child appointment and we only delete the current appointment
    # if Recurring = 1, then AppointmentID is parent appointment and we delete all 'child' appointments
    return 1 if !$Param{GetParam}->{Recurring};

    # Assemble recurring appointments and also add parent appointment to start of array.
    my @Appointments = $AppointmentObject->AppointmentRecurringGet(
        AppointmentID => $AppointmentID,
    );

    for my $Appointment (@Appointments) {

        my $Success = $PluginObject->DataDelete(
            AppointmentID => $Appointment->{AppointmentID},
            PluginKey     => $Param{Plugin}->{PluginKey},
            UserID        => 1,
        );
        return if !$Success;
    }

    return 1;
}

=head2 Get()

Get all plugin information.

    my $Data = $BasePluginObject->Get(
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

    my $PluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

    my %Data = $PluginObject->DataGet(
        AppointmentID => $Param{Appointment}->{AppointmentID},
        PluginKey     => $Param{Plugin}->{PluginKey},
        UserID        => 1,
    );
    return if ( !%Data );

    return \%Data;
}

=head2 AJAXUpdate()

Return an array with all plugin ajax update informations to build the layoutobject selection JSON.

    my @PluginAJAX = $BasePluginObject->AJAXUpdate(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
    );

Returns:

    my @PluginAJAX = (
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

    return;
}

1;
