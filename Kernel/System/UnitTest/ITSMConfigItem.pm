# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::ITSMConfigItem;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::GeneralCatalog',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Valid',
    'Kernel::System::ZnunyHelper',
);

=head1 NAME

Kernel::System::UnitTest::ITSMConfigItem - ITSMConfigItem unit test lib

=head1 SYNOPSIS

All ITSMConfigItem functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $UnitTestITSMConfigItemObject = $Kernel::OM->Get('Kernel::System::UnitTest::ITSMConfigItem');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 ConfigItemCreate()

Creates a config item and adds an initial version.

    my $VersionRef = $UnitTestITSMConfigItemObject->ConfigItemCreate(
        Name          => 'Znuny Rack 42',
        ClassName     => 'Server',
        DeplStateName => 'Production',
        InciStateName => 'Operational',
        XMLData       => {
            OtherEquipment         => '...',
            Note                   => '...',
            SerialNumber           => '...',
            WarrantyExpirationDate => '2016-01-01',
            InstallDate            => '2016-01-01',
        },
    );

    $VersionRef = {
        VersionID        => '...',
        ConfigItemID     => '...',
        Number           => '...',
        ClassID          => '...',
        Class            => '...',
        LastVersionID    => '...',
        Name             => '...',
        DefinitionID     => '...',
        DeplStateID      => '...',
        DeplState        => '...',
        DeplStateType    => '...',
        CurDeplStateID   => '...',
        CurDeplState     => '...',
        CurDeplStateType => '...',
        InciStateID      => '...',
        InciState        => '...',
        InciStateType    => '...',
        CurInciStateID   => '...',
        CurInciState     => '...',
        CurInciStateType => '...',
        XMLDefinition    => '...',
        XMLData          => '...',
        CreateTime       => '...',
        CreateBy         => '...',
    };

=cut

sub ConfigItemCreate {
    my ( $Self, %Param ) = @_;

    my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');
    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ZnunyHelperObject    = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );

    my $ClassListRef = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
        Valid => $ValidID,
    );
    my %ClassList = reverse %{ $ClassListRef || {} };

    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        ClassID => $ClassList{ $Param{ClassName} },
        UserID  => $Param{UserID} || 1,
    );

    $ZnunyHelperObject->_ITSMVersionAdd(
        %Param,
        ConfigItemID => $ConfigItemID,
    );

    return $ConfigItemObject->VersionGet(
        ConfigItemID => $ConfigItemID,
    );
}

1;
