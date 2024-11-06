# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Console::Command::Admin::Service::Add;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::DynamicField',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Service',
    'Kernel::System::Util',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = $Type->SUPER::new(%Param);

    my $UtilObject = $Kernel::OM->Get('Kernel::System::Util');
    $Self->{IsITSMInstalled} = $UtilObject->IsITSMInstalled();

    return $Self;
}

sub Configure {
    my ( $Self, %Param ) = @_;

    my $UtilObject = $Kernel::OM->Get('Kernel::System::Util');
    $Self->{IsITSMInstalled} = $UtilObject->IsITSMInstalled();

    $Self->Description('Add new service.');
    $Self->AddOption(
        Name        => 'name',
        Description => "Name of the new service.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    if ( $Self->{IsITSMInstalled} ) {
        $Self->AddOption(
            Name        => 'criticality',
            Description => "Criticality of the new service.",
            Required    => 1,
            HasValue    => 1,
            ValueRegex  => qr/.*/smx,
        );
        $Self->AddOption(
            Name        => 'type',
            Description => "Type of the new service.",
            Required    => 1,
            HasValue    => 1,
            ValueRegex  => qr/.*/smx,
        );
    }

    $Self->AddOption(
        Name        => 'parent-name',
        Description => "Parent service name. If given, the new service will be a subservice of the given parent.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddOption(
        Name        => 'comment',
        Description => "Comment for the new service.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    # Get all services.
    $Self->{Name} = $Self->GetOption('name');
    my %ServiceList = $Kernel::OM->Get('Kernel::System::Service')->ServiceList(
        Valid  => 0,
        UserID => 1,
    );
    my %Reverse = reverse %ServiceList;

    $Self->{ParentName} = $Self->GetOption('parent-name');
    if ( $Self->{ParentName} ) {

        # Check if Parent service exists.
        $Self->{ParentID} = $Kernel::OM->Get('Kernel::System::Service')->ServiceLookup(
            Name   => $Self->{ParentName},
            UserID => 1,
        );
        die "Parent service $Self->{ParentName} does not exist.\n" if !$Self->{ParentID};

        # Check if Parent::Child service combination exists.
        my $ServiceName = $Self->{ParentName} . '::' . $Self->{Name};
        die "Service '$ServiceName' already exists!\n" if $Reverse{$ServiceName};
    }
    else {

        # Check if service already exists.
        die "Service '$Self->{Name}' already exists!\n" if $Reverse{ $Self->{Name} };
    }

    return if !$Self->{IsITSMInstalled};

    # get the dynamic field config for ITSMCriticality
    my $DynamicFieldConfigArrayRef = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['Ticket'],
        FieldFilter => {
            ITSMCriticality => 1,
        },
    );

    # get the dynamic field values for ITSMCriticality
    my %PossibleValues;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigArrayRef} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get PossibleValues
        $PossibleValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Config}->{PossibleValues} || {};
    }

    my %Criticality = %{ $PossibleValues{ITSMCriticality} };

    $Self->{Criticality} = $Criticality{ $Self->GetOption('criticality') };

    if ( !$Self->{Criticality} ) {
        die "Criticality '" . $Self->GetOption('criticality') . "' does not exist.\n";
    }

    # get service type list
    my $ServiceTypeList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Service::Type',
    );

    my %ServiceType = reverse %{$ServiceTypeList};

    $Self->{TypeID} = $ServiceType{ $Self->GetOption('type') };

    if ( !$Self->{TypeID} ) {
        die "Type '" . $Self->GetOption('type') . "' does not exist.\n";
    }

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Adding a new service...</yellow>\n");

    my %ServiceValues;

    if ( $Self->{IsITSMInstalled} ) {
        %ServiceValues = (
            TypeID      => $Self->{TypeID},
            Criticality => $Self->{Criticality},
        );
    }

    # add service
    my $ServiceID = $Kernel::OM->Get('Kernel::System::Service')->ServiceAdd(
        UserID   => 1,
        ValidID  => 1,
        Name     => $Self->{Name},
        Comment  => $Self->GetOption('comment'),
        ParentID => $Self->{ParentID},
        %ServiceValues,
    );

    if ( !$ServiceID ) {
        $Self->PrintError("Can't add service.");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
