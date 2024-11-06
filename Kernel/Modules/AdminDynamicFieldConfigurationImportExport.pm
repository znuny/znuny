# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminDynamicFieldConfigurationImportExport;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Cache',
    'Kernel::System::DynamicField',
    'Kernel::System::Log',
    'Kernel::System::Time',
    'Kernel::System::Valid',
    'Kernel::System::Web::Request',
    'Kernel::System::YAML',
    'Kernel::System::ZnunyHelper',
);

use Kernel::System::VariableCheck qw(:all);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $LogObject          = $Kernel::OM->Get('Kernel::System::Log');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $TimeObject         = $Kernel::OM->Get('Kernel::System::Time');
    my $YAMLObject         = $Kernel::OM->Get('Kernel::System::YAML');
    my $ZnunyHelperObject  = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
    my $CacheObject        = $Kernel::OM->Get('Kernel::System::Cache');

    $Self->{DynamicFields} = $Self->_GetDynamicFields();

    my $ValidDynamicFieldScreens = $ZnunyHelperObject->_ValidDynamicFieldScreenListGet(
        Result => 'HASH',
    );

    $Self->{DynamicFieldScreens}   = $ValidDynamicFieldScreens->{DynamicFieldScreens};
    $Self->{DefaultColumnsScreens} = $ValidDynamicFieldScreens->{DefaultColumnsScreens};

    $Self->{Subaction} = $ParamObject->GetParam( Param => 'Subaction' ) // '';

    if ( $Self->{Subaction} eq 'Import' ) {
        my $Success;

        $LayoutObject->ChallengeTokenCheck();

        my %UploadStuff = $ParamObject->GetUploadAll(
            Param => 'FileUpload',
        );

        my $OverwriteExistingConfigurations = $ParamObject->GetParam( Param => 'OverwriteExistingConfigurations' );

        my $ImportData = $YAMLObject->Load(
            Data => $UploadStuff{Content},
        );

        my $ImportYAMLFileError = $ImportData ? 0 : 1;

        $CacheObject->Set(
            Type  => 'AdminDynamicFieldConfigurationImportExport',
            Key   => 'AdminDynamicFieldConfigurationImportExport::' . $Self->{UserID},
            Value => $ImportData,
            TTL   => 60 * 60,
        );

        return $Self->_Mask(
            Data                            => $ImportData,
            ImportYAMLFileError             => $ImportYAMLFileError,
            OverwriteExistingConfigurations => $OverwriteExistingConfigurations // 0,
        );
    }
    elsif ( $Self->{Subaction} eq 'ImportAction' ) {
        my $ImportData = $CacheObject->Get(
            Type => 'AdminDynamicFieldConfigurationImportExport',
            Key  => 'AdminDynamicFieldConfigurationImportExport::' . $Self->{UserID},
        );

        if ( !IsHashRefWithData($ImportData) ) {
            return $LayoutObject->Redirect(
                OP => "Action=AdminDynamicField"
            );
        }

        my @SelectedDynamicFieldConfigurations = $ParamObject->GetArray( Param => 'DynamicFieldConfiguration' );
        my @SelectedDynamicFieldScreenConfigurations
            = $ParamObject->GetArray( Param => 'DynamicFieldScreenConfiguration' );
        my $OverwriteExistingConfigurations = $ParamObject->GetParam( Param => 'OverwriteExistingConfigurations' ) || 0;

        $CacheObject->Delete(
            Type => 'AdminDynamicFieldConfigurationImportExport',
            Key  => 'AdminDynamicFieldConfigurationImportExport::' . $Self->{UserID},
        );

        # Import dynamic fields
        my $FieldTypeConfig = $ConfigObject->Get('DynamicFields::Driver');
        if ( IsHashRefWithData( $ImportData->{DynamicFields} ) ) {
            my @DynamicFieldConfigurations;
            DYNAMICFIELDNAME:
            for my $DynamicFieldName ( sort keys %{ $ImportData->{DynamicFields} } ) {
                my $Selected = grep { $ImportData->{DynamicFields}->{$DynamicFieldName}->{Name} eq $_ }
                    @SelectedDynamicFieldConfigurations;
                next DYNAMICFIELDNAME if !$Selected;

                next DYNAMICFIELDNAME if !IsHashRefWithData( $ImportData->{DynamicFields}->{$DynamicFieldName} );

                my $FieldType = $ImportData->{DynamicFields}->{$DynamicFieldName}->{FieldType};

                if ( !IsHashRefWithData( $FieldTypeConfig->{$FieldType} ) ) {
                    $LogObject->Log(
                        'Priority' => 'error',
                        'Message' =>
                            "Could not import configuration of dynamic field '$ImportData->{DynamicFields}->{$DynamicFieldName}->{Name}': Dynamic field backend for field type '$ImportData->{DynamicFields}->{$DynamicFieldName}->{FieldType}' does not exist!",
                    );
                    next DYNAMICFIELDNAME;
                }

                push @DynamicFieldConfigurations, $ImportData->{DynamicFields}->{$DynamicFieldName};
            }

            if ($OverwriteExistingConfigurations) {
                $ZnunyHelperObject->_DynamicFieldsCreate(@DynamicFieldConfigurations);
            }
            else {
                $ZnunyHelperObject->_DynamicFieldsCreateIfNotExists(@DynamicFieldConfigurations);
            }
        }

        # Import dynamic fields screens
        if ( IsHashRefWithData( $ImportData->{DynamicFieldScreens} ) ) {
            my %DynamicFieldScreenConfigurations;
            DYNAMICFIELDNAME:
            for my $DynamicFieldName ( sort keys %{ $ImportData->{DynamicFieldScreens} } ) {

                # check if dynamic field screen was selected
                my $Selected = grep { $DynamicFieldName eq $_ } @SelectedDynamicFieldScreenConfigurations;
                next DYNAMICFIELDNAME if !$Selected;

                $DynamicFieldScreenConfigurations{$DynamicFieldName}
                    = $ImportData->{DynamicFieldScreens}->{$DynamicFieldName};
            }

            if (%DynamicFieldScreenConfigurations) {
                $ZnunyHelperObject->_DynamicFieldsScreenConfigImport(
                    Config => \%DynamicFieldScreenConfigurations,
                );
            }
        }

        return $LayoutObject->Redirect(
            OP => "Action=AdminDynamicField"
        );
    }
    elsif ( $Self->{Subaction} eq 'Export' ) {
        return $Self->_Mask(%Param);
    }
    elsif ( $Self->{Subaction} eq 'ExportAction' ) {
        my @SelectedDynamicFieldConfigurations = $ParamObject->GetArray( Param => 'DynamicFieldConfiguration' );
        my @SelectedDynamicFieldScreenConfigurations
            = $ParamObject->GetArray( Param => 'DynamicFieldScreenConfiguration' );

        my %Data;

        if (@SelectedDynamicFieldConfigurations) {
            $Data{DynamicFields} = $ZnunyHelperObject->_DynamicFieldsConfigExport(
                Format                => 'var',
                IncludeInternalFields => 1,
                IncludeAllConfigKeys  => 1,
                DynamicFields         => \@SelectedDynamicFieldConfigurations,
                Result                => 'HASH',
            );
        }

        if (@SelectedDynamicFieldScreenConfigurations) {
            %{ $Data{DynamicFieldScreens} } = $ZnunyHelperObject->_DynamicFieldsScreenConfigExport(
                DynamicFields => \@SelectedDynamicFieldScreenConfigurations,
            );
        }

        if ( !%Data ) {
            return $LayoutObject->Redirect(
                OP => "Action=AdminDynamicFieldConfigurationImportExport;Subaction=Export",
            );
        }

        my $DynamicFieldConfigYAML = $YAMLObject->Dump( Data => \%Data );

        my $TimeStamp = $TimeObject->CurrentTimestamp();

        return $LayoutObject->Attachment(
            ContentType => 'text/html; charset=' . $LayoutObject->{Charset},
            Content     => $DynamicFieldConfigYAML,
            Type        => 'attachment',
            Filename    => "Export_DynamicFields_$TimeStamp.yml",
            NoCache     => 1,
        );
    }

    return $LayoutObject->Redirect(
        OP => "Action=AdminDynamicField"
    );
}

sub _Mask {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    $LayoutObject->Block( Name => 'ActionOverview' );

    $LayoutObject->Block(
        Name => $Self->{Subaction} . 'Hint',
        Data => {
            %Param,
        },
    );

    if ( !$Param{Data} && !$Param{ImportYAMLFileError} ) {
        $Param{Data}->{DynamicFields} = $Self->_GetDynamicFields();
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    if ( !$Param{ImportYAMLFileError} ) {
        $Self->_DynamicFieldShow(
            %Param,
        );
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminDynamicFieldConfigurationImportExport',
        Data         => {
            %Param,
            ImportYAMLFileError => $Param{ImportYAMLFileError},
        },
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _DynamicFieldShow {
    my ( $Self, %Param ) = @_;

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my $FieldTypeConfig = $ConfigObject->Get('DynamicFields::Driver');

    my $InvalidCounter = 0;

    if (
        IsHashRefWithData( $Param{Data}->{DynamicFields} )
        || IsHashRefWithData( $Param{Data}->{DynamicFieldScreens} )
        )
    {
        my @DynamicFieldNamesAlreadyUsed;

        DYNAMICFIELDNAME:
        for my $DynamicFieldName ( sort keys %{ $Param{Data}->{DynamicFields} } ) {
            push @DynamicFieldNamesAlreadyUsed, $DynamicFieldName;

            my $DynamicFieldConfig;
            if ( IsHashRefWithData( $Param{Data}->{DynamicFields}->{$DynamicFieldName} ) ) {
                $DynamicFieldConfig = $Param{Data}->{DynamicFields}->{$DynamicFieldName};

            }
            else {
                $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                    Name => $DynamicFieldName,
                );
            }

            next DYNAMICFIELDNAME if !IsHashRefWithData($DynamicFieldConfig);

            # convert ValidID to Validity string
            my $Valid = $ValidObject->ValidLookup(
                ValidID => $DynamicFieldConfig->{ValidID},
            );

            # get the object type display name
            my $ObjectTypeName = $ConfigObject->Get('DynamicFields::ObjectType')
                ->{ $DynamicFieldConfig->{ObjectType} }->{DisplayName}
                || $DynamicFieldConfig->{ObjectType};

            # get the field type display name
            my $FieldTypeName = $FieldTypeConfig->{ $DynamicFieldConfig->{FieldType} }->{DisplayName}
                || $DynamicFieldConfig->{FieldType};

            # get the field backend dialog
            my $ConfigDialog = $FieldTypeConfig->{ $DynamicFieldConfig->{FieldType} }->{ConfigDialog}
                || '';

            my %DynamicFieldData = (
                %{$DynamicFieldConfig},
                Valid          => $Valid,
                ConfigDialog   => $ConfigDialog,
                FieldTypeName  => $FieldTypeName,
                ObjectTypeName => $ObjectTypeName,
            );

            if ( !$ConfigDialog ) {
                if ( $InvalidCounter == 0 ) {

                    $LayoutObject->Block(
                        Name => 'DynamicFieldsInvalidBackend',
                    );
                }

                $LayoutObject->Block(
                    Name => 'DynamicFieldRowInvalidBackend',
                    Data => {
                        %DynamicFieldData,
                    },
                );

                $InvalidCounter++;
                next DYNAMICFIELDNAME;
            }

            for my $Blocks ( 'DynamicFieldRow', 'DynamicFieldConfigurationCheckbox', $Self->{Subaction} ) {
                $LayoutObject->Block(
                    Name => $Blocks,
                    Data => {
                        %DynamicFieldData,
                    },
                );
            }

            if (
                IsHashRefWithData( $Param{Data}->{DynamicFieldScreens}->{$DynamicFieldName} )
                || $Self->{Subaction} ne 'Import'
                )
            {
                $LayoutObject->Block(
                    Name => 'DynamicFieldScreenConfigurationCheckbox',
                    Data => {
                        %DynamicFieldData
                    },
                );
            }
        }

        DYNAMICFIELDNAME:
        for my $DynamicFieldName ( sort keys %{ $Param{Data}->{DynamicFieldScreens} } ) {
            next DYNAMICFIELDNAME if grep { $DynamicFieldName eq $_ } @DynamicFieldNamesAlreadyUsed;
            next DYNAMICFIELDNAME if !IsHashRefWithData( $Param{Data}->{DynamicFieldScreens}->{$DynamicFieldName} );

            for my $Block ( 'DynamicFieldRow', 'DynamicFieldScreenConfigurationCheckbox', $Self->{Subaction} ) {
                $LayoutObject->Block(
                    Name => $Block,
                    Data => {
                        Name => $DynamicFieldName,
                    },
                );
            }
        }

        return;
    }

    # otherwise show a "no data found" message
    $LayoutObject->Block(
        Name => 'NoDataFound',
        Data => \%Param,
    );

    return;
}

sub _GetDynamicFields {
    my ( $Self, %Param ) = @_;

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my $ShowOnlyValidDynamicFields = $ConfigObject->Get('DynamicFields::ImportExport::ShowOnlyValidDynamicFields');

    my $DynamicFieldConfigs = $DynamicFieldObject->DynamicFieldListGet(
        ResultType => 'HASH',
        Valid      => $ShowOnlyValidDynamicFields,
        ObjectType => 'All',
    );

    my %DynamicFields;

    DYNAMICFIELDCONFIG:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigs} ) {

        next DYNAMICFIELDCONFIG if !IsHashRefWithData($DynamicFieldConfig);

        $DynamicFields{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Label};
    }

    return \%DynamicFields;
}

1;
