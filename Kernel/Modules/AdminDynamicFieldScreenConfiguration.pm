# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminDynamicFieldScreenConfiguration;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::DynamicField::ScreenConfiguration',
    'Kernel::System::DynamicField',
    'Kernel::System::Log',
    'Kernel::System::SysConfig',
    'Kernel::System::Web::Request',
    'Kernel::System::ZnunyHelper',
);

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    my $DynamicFieldScreenConfigurationObject = $Kernel::OM->Get('Kernel::System::DynamicField::ScreenConfiguration');
    my $ZnunyHelperObject                     = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
    my $DynamicFieldObject                    = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $ConfigObject                          = $Kernel::OM->Get('Kernel::Config');

    my $ShowOnlyValidDynamicFields = $ConfigObject->Get(
        'DynamicFields::ScreenConfiguration::ShowOnlyValidDynamicFields',
    );

    my @DynamicFieldObjectTypes = $DynamicFieldScreenConfigurationObject->GetDynamicFieldObjectTypes();

    my $DynamicFieldConfigs = $DynamicFieldObject->DynamicFieldListGet(
        ResultType => 'HASH',
        Valid      => $ShowOnlyValidDynamicFields,
        ObjectType => \@DynamicFieldObjectTypes,
    );

    $Self->{DynamicFields} = {};

    DYNAMICFIELDCONFIG:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigs} ) {
        next DYNAMICFIELDCONFIG if !IsHashRefWithData($DynamicFieldConfig);
        $Self->{DynamicFields}->{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Label};
    }

    my $ValidDynamicFieldScreens = $ZnunyHelperObject->_ValidDynamicFieldScreenListGet(
        Result => 'HASH',
    );

    $Self->{DynamicFieldConfigs}   = $DynamicFieldObject->DynamicFieldListGet();
    $Self->{DynamicFieldScreens}   = $ValidDynamicFieldScreens->{DynamicFieldScreens};
    $Self->{DefaultColumnsScreens} = $ValidDynamicFieldScreens->{DefaultColumnsScreens};

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject                          = $Kernel::OM->Get('Kernel::Config');
    my $LogObject                             = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject                       = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ZnunyHelperObject                     = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
    my $LayoutObject                          = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject                           = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LanguageObject                        = $Kernel::OM->Get('Kernel::Language');
    my $DynamicFieldScreenConfigurationObject = $Kernel::OM->Get('Kernel::System::DynamicField::ScreenConfiguration');

    $Self->{Subaction} = $ParamObject->GetParam( Param => 'Subaction' ) || '';

    my %DynamicFields         = %{ $Self->{DynamicFields} };
    my %DynamicFieldScreens   = %{ $Self->{DynamicFieldScreens} };
    my %DefaultColumnsScreens = %{ $Self->{DefaultColumnsScreens} };

    NEEDED:
    for my $Needed (qw(Element Type)) {
        $Param{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if $Param{$Needed};
    }

    my %Config = $Self->_GetConfig(%Param);

    if ( $Self->{Subaction} eq 'Edit' ) {
        return $Self->_ShowEdit(
            %Param,
            Data => \%Config,
        );
    }
    elsif ( $Self->{Subaction} eq 'EditAction' ) {
        $LayoutObject->ChallengeTokenCheck();

        my @AvailableElements = $ParamObject->GetArray( Param => 'AvailableElements' );

        my @DisabledElements         = $ParamObject->GetArray( Param => 'DisabledElements' );
        my @AssignedElements         = $ParamObject->GetArray( Param => 'AssignedElements' );
        my @AssignedRequiredElements = $ParamObject->GetArray( Param => 'AssignedRequiredElements' );

        my %AvailableElements        = map { $_ => undef } @AvailableElements;
        my %DisabledElements         = map { $_ => '0' } @DisabledElements;
        my %AssignedElements         = map { $_ => '1' } @AssignedElements;
        my %AssignedRequiredElements = map { $_ => '2' } @AssignedRequiredElements;

        my %Config = (
            %AvailableElements,
            %DisabledElements,
            %AssignedElements,
            %AssignedRequiredElements,
        );

        %Config = $DynamicFieldScreenConfigurationObject->ValidateDynamicFieldActivation(
            Config  => \%Config,
            Element => $Param{Element},
        );

        my $Success;
        my %ScreenConfig;
        $ScreenConfig{ $Param{Element} } ||= {};

        if ( $Param{Type} eq 'DynamicField' ) {
            $ScreenConfig{ $Param{Element} } = \%Config;

            $Success = $ZnunyHelperObject->_DynamicFieldsScreenConfigImport(
                Config => \%ScreenConfig,
            );
        }
        elsif ( $Param{Type} eq 'DynamicFieldScreen' ) {
            for my $DynamicField ( sort keys %Config ) {
                $ScreenConfig{ $Param{Element} }->{$DynamicField} = $Config{$DynamicField};
            }

            $Success = $ZnunyHelperObject->_DynamicFieldsScreenEnable(%ScreenConfig);
        }
        elsif ( $Param{Type} eq 'DefaultColumnsScreen' ) {
            for my $DynamicField ( sort keys %Config ) {
                $ScreenConfig{ $Param{Element} }->{ 'DynamicField_' . $DynamicField } = $Config{$DynamicField};
            }

            $Success = $ZnunyHelperObject->_DefaultColumnsEnable(%ScreenConfig);
        }

        $Param{Priority} = 'Info';
        $Param{Message}  = $LanguageObject->Translate(
            "Settings were saved.",
        );

        if ( !$Success ) {
            $Param{Priority} = 'Error';
            $Param{Message}  = $LanguageObject->Translate(
                "System was not able to save the setting!",
            );
        }

        my $ElementLinkEncoded = $LayoutObject->LinkEncode( $Param{Element} );
        my $TypeLinkEncoded    = $LayoutObject->LinkEncode( $Param{Type} );

        if ( $ParamObject->GetParam( Param => 'ContinueAfterSave' ) ) {
            return $LayoutObject->Redirect(
                OP => "Action=$Self->{Action};Subaction=Edit;Element=$ElementLinkEncoded;Type=$TypeLinkEncoded"
            );
        }
        else {
            return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
        }
    }
    elsif ( $Self->{Subaction} eq 'Reset' ) {
        $Self->{Subaction} = 'Edit';

        if (
            $Param{Type} ne 'DynamicFieldScreen'
            && $Param{Type} ne 'DefaultColumnsScreen'
            )
        {
            return $Self->_ShowOverview();
        }

        my $ExclusiveLockGUID;
        my %Setting = $SysConfigObject->SettingGet(
            Name => $Param{Element},
        );

        if ( !$Setting{ExclusiveLockGUID} ) {

            # Setting is not locked yet.
            $ExclusiveLockGUID = $SysConfigObject->SettingLock(
                UserID    => $Self->{UserID},
                DefaultID => $Setting{DefaultID},
            );
        }
        elsif ( $Setting{ExclusiveLockUserID} != $Self->{UserID} ) {

            # Someone else locked the setting.
            $Param{Priority} = 'Error';
            $Param{Message}  = $LanguageObject->Translate(
                "Setting is locked by another user!",
            );

            return $Self->_ShowEdit(
                %Param,
                Data => \%Config,
            );
        }
        else {

            # Already locked to this user.
            $ExclusiveLockGUID = $Setting{ExclusiveLockGUID};
        }

        my $Success = $SysConfigObject->SettingReset(
            Name              => $Param{Element},
            ExclusiveLockGUID => $ExclusiveLockGUID,
            UserID            => $Self->{UserID},
        );

        if ( !$Success ) {
            $Param{Priority} = 'Error';
            $Param{Message}  = $LanguageObject->Translate(
                "System was not able to reset the setting!",
            );

            return $Self->_ShowEdit(
                %Param,
                Data => \%Config,
            );
        }

        $SysConfigObject->SettingUnlock(
            DefaultID => $Setting{DefaultID},
        );

        $Success = $ZnunyHelperObject->_RebuildConfig();

        $Param{Priority} = 'Info';
        $Param{Message}  = $LanguageObject->Translate(
            "Settings were reset.",
        );

        if ( !$Success ) {
            $Param{Priority} = 'Error';
            $Param{Message}  = $LanguageObject->Translate(
                "System was not able to reset the setting!",
            );
        }

        my $ElementLinkEncoded = $LayoutObject->LinkEncode( $Param{Element} );
        my $TypeLinkEncoded    = $LayoutObject->LinkEncode( $Param{Type} );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=Edit;Element=$ElementLinkEncoded;Type=$TypeLinkEncoded"
        );
    }

    return $Self->_ShowOverview();
}

sub _ShowOverview {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my %DynamicFields         = %{ $Self->{DynamicFields} };
    my %DynamicFieldScreens   = %{ $Self->{DynamicFieldScreens} };
    my %DefaultColumnsScreens = %{ $Self->{DefaultColumnsScreens} };

    $LayoutObject->Block( Name => 'Overview' );

    for my $DynamicFieldScreen (
        sort { $DynamicFieldScreens{$a} cmp $DynamicFieldScreens{$b} }
        keys %DynamicFieldScreens
        )
    {
        $LayoutObject->Block(
            Name => 'DynamicFieldScreenOverviewRow',
            Data => {
                DynamicFieldScreen => $DynamicFieldScreen,
                Name               => $DynamicFieldScreens{$DynamicFieldScreen},
            },
        );
    }

    for my $DefaultColumnsScreen (
        sort { $DefaultColumnsScreens{$a} cmp $DefaultColumnsScreens{$b} }
        keys %DefaultColumnsScreens
        )
    {
        $LayoutObject->Block(
            Name => 'DefaultColumnsScreenOverviewRow',
            Data => {
                DefaultColumnsScreen => $DefaultColumnsScreen,
                Name                 => $DefaultColumnsScreens{$DefaultColumnsScreen},
            },
        );
    }

    if ( !%DynamicFields ) {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
        );
    }
    else {

        # Get all dynamic fields and translate the name.
        my @DynamicFields;
        for my $DynamicField ( sort keys %DynamicFields ) {
            my $Name = $LayoutObject->{LanguageObject}->Translate( $DynamicFields{$DynamicField} );
            push @DynamicFields, {
                Name         => $Name,
                DynamicField => $DynamicField,
            };
        }

        # Sort by translated name.
        my @SortedDynamicFields = sort { $a->{Name} cmp $b->{Name} } @DynamicFields;

        # Show dynamic fields orderd by translated name on overview.
        for my $DynamicField (@SortedDynamicFields) {
            $LayoutObject->Block(
                Name => 'DynamicFieldOverviewRow',
                Data => {
                    DynamicField => $DynamicField->{DynamicField},
                    Name         => $DynamicField->{Name},
                },
            );
        }
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminDynamicFieldScreenConfiguration',
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _ShowEdit {
    my ( $Self, %Param ) = @_;

    my $ConfigObject                          = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject                          = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $DynamicFieldObject                    = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldScreenConfigurationObject = $Kernel::OM->Get('Kernel::System::DynamicField::ScreenConfiguration');

    my $NoAssignedRequiredFieldRow;

    $Param{Action} = 'Edit';

    my %Data                  = %{ $Param{Data} || {} };
    my %DynamicFields         = %{ $Self->{DynamicFields} };
    my %DynamicFieldScreens   = %{ $Self->{DynamicFieldScreens} };
    my %DefaultColumnsScreens = %{ $Self->{DefaultColumnsScreens} };

    my %Screens = (
        %{ $Self->{DynamicFieldScreens} },
        %{ $Self->{DefaultColumnsScreens} },
    );

    my %AvailableElements = %DynamicFields;
    my %OtherElements     = %DefaultColumnsScreens;

    $Param{Size} = 'Size1of4';

    if ( $Param{Type} eq 'DynamicField' ) {
        my @DynamicField = grep { $Param{Element} eq $_->{Name} } @{ $Self->{DynamicFieldConfigs} };
        my %DynamicField = %{ $DynamicField[0] };

        %AvailableElements = %Screens;
        if ( $DynamicField{ObjectType} ) {
            %AvailableElements = $DynamicFieldScreenConfigurationObject->GetConfigKeysOfScreensByObjectType(
                ObjectType => $DynamicField{ObjectType},
                Screens    => \%Screens
            );
        }

        %OtherElements      = %DynamicFields;
        $Param{Header}      = Translatable('Screens for dynamic field %s');
        $Param{HiddenReset} = 'Hidden';
    }
    elsif ( $Param{Type} eq 'DynamicFieldScreen' ) {

        # remove AssignedRequiredFieldRow from template if screen is AgentTicketZoom or CustomTicketZoom
        if ( $Param{Element} =~ m{Zoom}msxi ) {

            # AssignedRequired is not needed for zoom views
            $NoAssignedRequiredFieldRow = 1;
            $Param{Size}                = 'Size1of3';
            $Param{HiddenRequired}      = 'Hidden';
        }
        %OtherElements = %DynamicFieldScreens;

        $Param{Header} = Translatable('Dynamic fields for screen %s');
    }
    elsif ( $Param{Type} eq 'DefaultColumnsScreen' ) {
        $Param{Header} = Translatable('Default columns for screen %s');
    }

    if ( $Param{Type} ne 'DynamicField' ) {
        my @ObjectType = $DynamicFieldScreenConfigurationObject->GetDynamicFieldObjectTypes(
            Screen => $Param{Element},
        );

        my $ShowOnlyValidDynamicFields
            = $ConfigObject->Get('DynamicFields::ScreenConfiguration::ShowOnlyValidDynamicFields');

        my $DynamicFieldConfigs = $DynamicFieldObject->DynamicFieldListGet(
            ResultType => 'HASH',
            Valid      => $ShowOnlyValidDynamicFields,
            ObjectType => \@ObjectType,
        );

        my %AvailableElements;

        DYNAMICFIELDCONFIG:
        for my $DynamicFieldConfig ( @{$DynamicFieldConfigs} ) {
            next DYNAMICFIELDCONFIG if !IsHashRefWithData($DynamicFieldConfig);

            $AvailableElements{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Label};
        }
    }

    $LayoutObject->Block(
        Name => 'Edit',
        Data => {
            %Param,
        },
    );

    for my $Element ( sort { $OtherElements{$a} cmp $OtherElements{$b} } keys %OtherElements ) {
        $LayoutObject->Block(
            Name => 'ActionOverviewRowEdit',
            Data => {
                Element    => $OtherElements{$Element},
                ElementKey => $Element,
                Type       => $Param{Type},
            },
        );
    }

    # get used fields by the dynamic field group
    if (%Data) {
        ELEMENT:
        for my $Element ( sort keys %Data ) {
            next ELEMENT if !defined $Data{$Element};
            next ELEMENT if !$AvailableElements{$Element};

            # remove all spaces, # and :
            my $ID = $Element;
            $ID =~ s{\s}{}g;
            $ID =~ s{\#*}{}g;
            $ID =~ s{\:\:}{}g;

            my $BlockName;
            if ( $Data{$Element} == 0 ) {
                $BlockName = 'DisabledFieldRow';
            }
            elsif ( $Data{$Element} == 1 ) {
                $BlockName = 'AssignedFieldRow';
            }
            elsif ( $Data{$Element} == 2 && !$NoAssignedRequiredFieldRow ) {
                $BlockName = 'AssignedRequiredFieldRow';
            }

            next ELEMENT if !$BlockName;

            $LayoutObject->Block(
                Name => $BlockName,
                Data => {
                    Element => $Element,
                    Label   => $AvailableElements{$Element},
                    ID      => $ID,
                },
            );

            # remove used fields from available list
            delete $AvailableElements{$Element};
        }
    }

    # display available fields
    for my $Element (
        sort { $AvailableElements{$a} cmp $AvailableElements{$b} }
        keys %AvailableElements
        )
    {
        # remove all spaces, # or :
        my $ID = $Element;
        $ID =~ s{\s}{}g;
        $ID =~ s{\#*}{}g;
        $ID =~ s{\:\:}{}g;

        $LayoutObject->Block(
            Name => 'AvailableFieldRow',
            Data => {
                Element => $Element,
                Label   => $AvailableElements{$Element},
                ID      => $ID,
            },
        );
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    if ( $Param{Message} && $Param{Priority} ) {
        $Output .= $LayoutObject->Notify(
            Priority => $Param{Priority} || 'Info',
            Info     => $Param{Message},
        );
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminDynamicFieldScreenConfiguration',
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _GetConfig {
    my ( $Self, %Param ) = @_;

    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    my %Config;
    return %Config if !defined $Param{Type};

    # get config of element
    if ( $Param{Type} eq 'DynamicField' ) {
        my %ConfigItemConfig = $ZnunyHelperObject->_DynamicFieldsScreenConfigExport(
            DynamicFields => [ $Param{Element} ],
        );

        %Config = %{ $ConfigItemConfig{ $Param{Element} } || {} };
    }
    elsif ( $Param{Type} eq 'DynamicFieldScreen' ) {
        my %ConfigItemConfig = $ZnunyHelperObject->_DynamicFieldsScreenGet(
            ConfigItems => [ $Param{Element} ],
        );

        %Config = %{ $ConfigItemConfig{ $Param{Element} } || {} };
    }
    elsif ( $Param{Type} eq 'DefaultColumnsScreen' ) {
        my %ConfigItemConfig = $ZnunyHelperObject->_DynamicFieldsDefaultColumnsGet(
            ConfigItems => [ $Param{Element} ],
        );

        %Config = %{ $ConfigItemConfig{ $Param{Element} } || {} };
    }

    return %Config;
}

1;
