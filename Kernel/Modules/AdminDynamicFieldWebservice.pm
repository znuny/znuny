# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminDynamicFieldWebservice;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::AuthSession',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::DynamicField::Webservice',
    'Kernel::System::GenericInterface::Webservice',
    'Kernel::System::Log',
    'Kernel::System::SysConfig',
    'Kernel::System::Valid',
    'Kernel::System::Web::Request',
);

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Store last entity screen.
    $SessionObject->UpdateSessionID(
        SessionID => $Self->{SessionID},
        Key       => 'LastScreenEntity',
        Value     => $Self->{RequestedURL},
    );

    my @ParamNames = $ParamObject->GetParamNames();
    for my $ParamName (@ParamNames) {
        $Param{$ParamName} = $ParamObject->GetParam( Param => $ParamName ) || '';
    }

    $LayoutObject->AddJSOnDocumentComplete(
        Code => 'Znuny.DynamicField.Webservice.InitAdmin();',
    );

    if ( $Self->{Subaction} eq 'Add' ) {
        return $Self->_Add(%Param);
    }
    elsif ( $Self->{Subaction} eq 'AddAction' ) {
        $LayoutObject->ChallengeTokenCheck();
        return $Self->_AddAction(%Param);
    }
    elsif ( $Self->{Subaction} eq 'Change' ) {
        return $Self->_Change(%Param);
    }
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {
        $LayoutObject->ChallengeTokenCheck();
        return $Self->_ChangeAction(%Param);
    }
    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {
        return $Self->_AJAXUpdate(%Param);
    }

    return $LayoutObject->ErrorScreen(
        Message => Translatable('Undefined subaction.'),
    );
}

sub _Add {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my %GetParam;

    NEEDED:
    for my $Needed (qw(ObjectType FieldType FieldOrder)) {
        $GetParam{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if defined $GetParam{$Needed} && length $GetParam{$Needed};

        my $Message = $LayoutObject->{LanguageObject}->Translate( 'Need %s', $Needed );
        return $LayoutObject->ErrorScreen(
            Message => $Message,
        );
    }

    my $ObjectTypeName = $ConfigObject->Get('DynamicFields::ObjectType')->{ $GetParam{ObjectType} }->{DisplayName}
        // '';
    my $FieldTypeName = $ConfigObject->Get('DynamicFields::Driver')->{ $GetParam{FieldType} }->{DisplayName} // '';

    my $BreadcrumbText = $LayoutObject->{LanguageObject}
        ->Translate( 'Add %s field', $LayoutObject->{LanguageObject}->Translate($FieldTypeName) );

    my %AdditionalParams = $Self->_AdditionalParamsGet();

    my $Output = $Self->_ShowScreen(
        %AdditionalParams,
        %Param,
        %GetParam,
        Mode           => 'Add',
        BreadcrumbText => $BreadcrumbText,
        ObjectTypeName => $ObjectTypeName,
        FieldTypeName  => $FieldTypeName,
    );

    return $Output;
}

sub _AddAction {
    my ( $Self, %Param ) = @_;

    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');

    my %Errors;
    my %GetParam;

    NEEDED:
    for my $Needed (qw(Name Label FieldOrder Webservice InvokerSearch InvokerGet)) {
        $GetParam{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if defined $GetParam{$Needed} && length $GetParam{$Needed};

        $Errors{ $Needed . 'ServerError' }        = 'ServerError';
        $Errors{ $Needed . 'ServerErrorMessage' } = Translatable('This field is required.');
    }

    my @AdditionalAttributes = $ParamObject->GetArray( Param => 'AdditionalAttributes' );

    if ( $GetParam{Name} ) {

        # check if name is alphanumeric
        if ( $GetParam{Name} !~ m{\A (?: [a-zA-Z] | \d )+ \z}xms ) {
            $Errors{NameServerError} = 'ServerError';
            $Errors{NameServerErrorMessage} =
                Translatable('The field does not contain only ASCII letters and numbers.');
        }

        # check if name is duplicated
        my %DynamicFieldsList = %{
            $DynamicFieldObject->DynamicFieldList(
                Valid      => 0,
                ResultType => 'HASH',
            )
        };
        %DynamicFieldsList = reverse %DynamicFieldsList;

        if ( $DynamicFieldsList{ $GetParam{Name} } ) {
            $Errors{NameServerError}        = 'ServerError';
            $Errors{NameServerErrorMessage} = Translatable('There is another field with the same name.');
        }
    }

    if ( $GetParam{FieldOrder} ) {

        # check if field order is numeric and positive
        if ( $GetParam{FieldOrder} !~ m{\A (?: \d )+ \z}xms ) {
            $Errors{FieldOrderServerError}        = 'ServerError';
            $Errors{FieldOrderServerErrorMessage} = Translatable('The field must be numeric.');
        }
    }

    for my $ConfigParam (
        qw(ObjectType ObjectTypeName FieldType FieldTypeName DefaultValue ValidID Rows Cols Link LinkPreview Webservice InvokerSearch InvokerGet)
        )
    {
        $GetParam{$ConfigParam} = $ParamObject->GetParam( Param => $ConfigParam );
    }

    if ( !$GetParam{ValidID} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Need ValidID'),
        );
    }

    my %AdditionalParams      = $Self->_AdditionalParamsGet();
    my %AdditionalParamErrors = $Self->_AdditionalParamsValidate(
        %GetParam,
        %AdditionalParams,
    );

    %Errors = ( %Errors, %AdditionalParamErrors );

    if (%Errors) {
        my $Output = $Self->_ShowScreen(
            %Param,
            %Errors,
            %GetParam,
            Mode => 'Add',
            %AdditionalParams,
        );
        return $Output;
    }

    my $AdditionalAttributesConfig = $ConfigObject->Get('DynamicFieldWebservice::AdditionalAttributes') // {};
    my $StandardAttributesConfig   = $AdditionalAttributesConfig->{Standard}                            // {};
    my $SelectableAttributesConfig = $AdditionalAttributesConfig->{Selectable}                          // {};

    my $DefaultStandardAttributeSet   = $StandardAttributesConfig->{Default}   // {};
    my $DefaultSelectableAttributeSet = $SelectableAttributesConfig->{Default} // {};

    for my $InitialAttributes ( sort keys %{$DefaultSelectableAttributeSet} ) {
        delete $DefaultSelectableAttributeSet->{$InitialAttributes}->{Name};
    }

    my $DefaultAttributeSet = {
        %{$DefaultStandardAttributeSet},
        %{$DefaultSelectableAttributeSet}
    };

    my $FieldConfig = {
        DefaultValue            => $GetParam{DefaultValue},
        Link                    => $GetParam{Link},
        LinkPreview             => $GetParam{LinkPreview},
        Webservice              => $GetParam{Webservice},
        InvokerSearch           => $GetParam{InvokerSearch},
        InvokerGet              => $GetParam{InvokerGet},
        AdditionalAttributes    => \@AdditionalAttributes,
        AdditionalAttributeKeys => $DefaultAttributeSet,
        %AdditionalParams,
    };

    $FieldConfig->{TreeView} = $GetParam{TreeView};

    my $FieldID = $DynamicFieldObject->DynamicFieldAdd(
        Name       => $GetParam{Name},
        Label      => $GetParam{Label},
        FieldOrder => $GetParam{FieldOrder},
        FieldType  => $GetParam{FieldType},
        ObjectType => $GetParam{ObjectType},
        Config     => $FieldConfig,
        ValidID    => $GetParam{ValidID},
        UserID     => $Self->{UserID},
    );

    if ( !$FieldID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Could not create the new field'),
        );
    }

    return $LayoutObject->Redirect(
        OP => "Action=AdminDynamicField",
    );
}

sub _Change {
    my ( $Self, %Param ) = @_;

    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my %GetParam;

    NEEDED:
    for my $Needed (qw(ObjectType FieldType)) {
        $GetParam{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if defined $GetParam{$Needed} && length $GetParam{$Needed};

        my $Message = $LayoutObject->{LanguageObject}->Translate( 'Need %s', $Needed );
        return $LayoutObject->ErrorScreen(
            Message => $Message,
        );
    }

    my $ObjectTypeName = $ConfigObject->Get('DynamicFields::ObjectType')->{ $GetParam{ObjectType} }->{DisplayName}
        // '';
    my $FieldTypeName = $ConfigObject->Get('DynamicFields::Driver')->{ $GetParam{FieldType} }->{DisplayName} // '';

    my $FieldID = $ParamObject->GetParam( Param => 'ID' );

    if ( !$FieldID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Need ID'),
        );
    }

    my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
        ID => $FieldID,
    );

    if ( !IsHashRefWithData($DynamicFieldConfig) ) {
        my $Message
            = $LayoutObject->{LanguageObject}->Translate( 'Could not get config for dynamic field %s', $FieldID );
        return $LayoutObject->ErrorScreen(
            Message => $Message,
        );
    }

    my %Config;
    if ( IsHashRefWithData( $DynamicFieldConfig->{Config} ) ) {
        %Config = %{ $DynamicFieldConfig->{Config} };
    }

    my $BreadcrumbText = $LayoutObject->{LanguageObject}
        ->Translate( 'Change %s field', $LayoutObject->{LanguageObject}->Translate($FieldTypeName) );

    my %AdditionalParams = $Self->_AdditionalParamsGet();

    my $Output = $Self->_ShowScreen(
        %AdditionalParams,
        %Param,
        %GetParam,
        %{$DynamicFieldConfig},
        %Config,
        ID             => $FieldID,
        Mode           => 'Change',
        BreadcrumbText => $BreadcrumbText,
        ObjectTypeName => $ObjectTypeName,
        FieldTypeName  => $FieldTypeName,
    );

    return $Output;
}

sub _ChangeAction {
    my ( $Self, %Param ) = @_;

    my $ParamObject        = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');
    my $SysConfigObject    = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');

    my $AdditionalAttributesConfig           = $ConfigObject->Get('DynamicFieldWebservice::AdditionalAttributes') // {};
    my $SelectableAttributesConfig           = $AdditionalAttributesConfig->{Selectable}                          // {};
    my $AdditionalSelectableAttributesConfig = $SelectableAttributesConfig->{Option}                              // {};

    my %Errors;
    my %GetParam;

    NEEDED:
    for my $Needed (qw(Name Label FieldOrder Webservice InvokerSearch InvokerGet)) {
        $GetParam{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if defined $GetParam{$Needed} && length $GetParam{$Needed};

        $Errors{ $Needed . 'ServerError' }        = 'ServerError';
        $Errors{ $Needed . 'ServerErrorMessage' } = Translatable('This field is required.');
    }

    my @AdditionalAttributes = $ParamObject->GetArray( Param => 'AdditionalAttributes' );

    my %AdditionalAttributeKeys;
    ADDITIONALATTRIBUTE:
    for my $AdditionalAttribute (@AdditionalAttributes) {
        if ( grep { $_ eq $AdditionalAttribute } keys %{$AdditionalSelectableAttributesConfig} ) {
            my $SelectableAttributesEnabled = 0;

            TYPE:
            for my $Type (qw(ID Name)) {
                next TYPE if !$ParamObject->GetParam( Param => $AdditionalAttribute . $Type );
                $AdditionalAttributeKeys{$AdditionalAttribute}->{$Type} = 1;
                $SelectableAttributesEnabled = 1;
            }

            # Prevent passing not selected attribute type.
            if ( !$SelectableAttributesEnabled ) {
                $AdditionalAttributeKeys{$AdditionalAttribute}->{ID} = 1;
            }
        }
    }

    my $FieldID = $ParamObject->GetParam( Param => 'ID' );
    if ( !$FieldID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Need ID'),
        );
    }

    my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
        ID => $FieldID,
    );

    if ( !IsHashRefWithData($DynamicFieldConfig) ) {
        return $LayoutObject->ErrorScreen(
            Message =>
                $LayoutObject->{LanguageObject}->Translate( 'Could not get config for dynamic field %s', $FieldID ),
        );
    }

    if ( $GetParam{Name} ) {

        # check if name is lowercase
        if ( $GetParam{Name} !~ m{\A (?: [a-zA-Z] | \d )+ \z}xms ) {
            $Errors{NameServerError} = 'ServerError';
            $Errors{NameServerErrorMessage} =
                Translatable('The field must contain only ASCII letters and numbers.');
        }

        # check if name is duplicated
        my %DynamicFieldsList = %{
            $DynamicFieldObject->DynamicFieldList(
                Valid      => 0,
                ResultType => 'HASH',
            )
        };

        %DynamicFieldsList = reverse %DynamicFieldsList;

        if (
            $DynamicFieldsList{ $GetParam{Name} } &&
            $DynamicFieldsList{ $GetParam{Name} } ne $FieldID
            )
        {
            $Errors{NameServerError}        = 'ServerError';
            $Errors{NameServerErrorMessage} = Translatable('There is another field with the same name.');
        }

        # if it's an internal field, it's name should not change
        if (
            $DynamicFieldConfig->{InternalField} &&
            $DynamicFieldsList{ $GetParam{Name} } ne $FieldID
            )
        {
            $Errors{NameServerError}        = 'ServerError';
            $Errors{NameServerErrorMessage} = Translatable('The name for this field should not change.');
            $Param{InternalField}           = $DynamicFieldConfig->{InternalField};
        }
    }

    if ( $GetParam{FieldOrder} ) {

        # check if field order is numeric and positive
        if ( $GetParam{FieldOrder} !~ m{\A (?: \d )+ \z}xms ) {
            $Errors{FieldOrderServerError}        = 'ServerError';
            $Errors{FieldOrderServerErrorMessage} = Translatable('The field must be numeric.');
        }
    }

    for my $ConfigParam (
        qw(ObjectType ObjectTypeName FieldType FieldTypeName DefaultValue ValidID Rows Cols Link LinkPreview Webservice InvokerSearch InvokerGet)
        )
    {
        $GetParam{$ConfigParam} = $ParamObject->GetParam( Param => $ConfigParam );
    }

    if ( !$GetParam{ValidID} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Need ValidID'),
        );
    }

    # Check if dynamic field is present in SysConfig setting
    my $UpdateEntity          = $ParamObject->GetParam( Param => 'UpdateEntity' ) || '';
    my %DynamicFieldOldConfig = %{$DynamicFieldConfig};
    my @IsDynamicFieldInSysConfig;
    @IsDynamicFieldInSysConfig = $SysConfigObject->ConfigurationEntityCheck(
        EntityType => 'DynamicField',
        EntityName => $DynamicFieldConfig->{Name},
    );

    if (@IsDynamicFieldInSysConfig) {

        # An entity present in SysConfig couldn't be invalidated.
        if (
            $ValidObject->ValidLookup( ValidID => $GetParam{ValidID} )
            ne 'valid'
            )
        {
            $Errors{ValidIDInvalid}         = 'ServerError';
            $Errors{ValidOptionServerError} = 'InSetting';
        }

        # In case changing name an authorization (UpdateEntity) should be send
        elsif ( $DynamicFieldConfig->{Name} ne $GetParam{Name} && !$UpdateEntity ) {
            $Errors{NameInvalid}              = 'ServerError';
            $Errors{InSettingNameServerError} = 1;
        }
    }

    my %AdditionalParams      = $Self->_AdditionalParamsGet();
    my %AdditionalParamErrors = $Self->_AdditionalParamsValidate(
        %GetParam,
        %AdditionalParams,
    );

    %Errors = ( %Errors, %AdditionalParamErrors );

    if (%Errors) {
        my $Output = $Self->_ShowScreen(
            %Param,
            %Errors,
            %GetParam,
            ID   => $FieldID,
            Mode => 'Change',
            %AdditionalParams,
        );
        return $Output;
    }

    my $FieldConfig = {
        DefaultValue            => $GetParam{DefaultValue},
        Link                    => $GetParam{Link},
        LinkPreview             => $GetParam{LinkPreview},
        Webservice              => $GetParam{Webservice},
        InvokerSearch           => $GetParam{InvokerSearch},
        InvokerGet              => $GetParam{InvokerGet},
        AdditionalAttributes    => \@AdditionalAttributes,
        AdditionalAttributeKeys => \%AdditionalAttributeKeys,
        %AdditionalParams,
    };

    $FieldConfig->{TreeView} = $GetParam{TreeView};

    # update dynamic field (FieldType and ObjectType cannot be changed; use old values)
    my $UpdateSuccess = $DynamicFieldObject->DynamicFieldUpdate(
        ID         => $FieldID,
        Name       => $GetParam{Name},
        Label      => $GetParam{Label},
        FieldOrder => $GetParam{FieldOrder},
        FieldType  => $DynamicFieldConfig->{FieldType},
        ObjectType => $DynamicFieldConfig->{ObjectType},
        Config     => $FieldConfig,
        ValidID    => $GetParam{ValidID},
        UserID     => $Self->{UserID},
    );

    if ( !$UpdateSuccess ) {
        my $Message = $LayoutObject->{LanguageObject}->Translate( 'Could not update the field %s', $GetParam{Name} );
        return $LayoutObject->ErrorScreen(
            Message => $Message,
        );
    }

    if (
        @IsDynamicFieldInSysConfig
        && $DynamicFieldOldConfig{Name} ne $GetParam{Name}
        && $UpdateEntity
        )
    {
        SETTING:
        for my $SettingName (@IsDynamicFieldInSysConfig) {
            my %Setting = $SysConfigObject->SettingGet(
                Name => $SettingName,
            );
            next SETTING if !%Setting;

            $Setting{EffectiveValue} =~ s{$DynamicFieldOldConfig{Name}}{$GetParam{Name}}g;

            my $ExclusiveLockGUID = $SysConfigObject->SettingLock(
                Name   => $Setting{Name},
                Force  => 1,
                UserID => $Self->{UserID}
            );
            $Setting{ExclusiveLockGUID} = $ExclusiveLockGUID;

            $SysConfigObject->SettingUpdate(
                %Setting,
                UserID => $Self->{UserID},
            );
        }

        $SysConfigObject->ConfigurationDeploy(
            Comments      => "DynamicField name change",
            DirtySettings => \@IsDynamicFieldInSysConfig,
            UserID        => $Self->{UserID},
            Force         => 1,
        );
    }

    # if the user would like to continue editing the dynamic field, just redirect to the change screen
    if (
        defined $ParamObject->GetParam( Param => 'ContinueAfterSave' )
        && ( $ParamObject->GetParam( Param => 'ContinueAfterSave' ) eq '1' )
        )
    {
        return $LayoutObject->Redirect(
            OP =>
                "Action=$Self->{Action};Subaction=Change;ObjectType=$DynamicFieldConfig->{ObjectType};FieldType=$DynamicFieldConfig->{FieldType};ID=$FieldID"
        );
    }

    return $LayoutObject->Redirect( OP => "Action=AdminDynamicField" );
}

sub _ShowScreen {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject           = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $LayoutObject              = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject               = $Kernel::OM->Get('Kernel::System::Valid');
    my $ParamObject               = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $ConfigObject              = $Kernel::OM->Get('Kernel::Config');

    $Param{DisplayFieldName} = 'New';

    if ( $Param{Mode} eq 'Change' ) {
        $Param{ShowWarning}      = 'ShowWarning';
        $Param{DisplayFieldName} = $Param{Name};
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    # get the list of order numbers (is already sorted).
    my @DynamicfieldOrderList;
    my %DynamicfieldNamesList;
    for my $Dynamicfield ( @{$DynamicFieldList} ) {
        push @DynamicfieldOrderList, $Dynamicfield->{FieldOrder};
        $DynamicfieldNamesList{ $Dynamicfield->{FieldOrder} } = $Dynamicfield->{Label};
    }

    # when adding we need to create an extra order number for the new field
    if ( $Param{Mode} eq 'Add' ) {

        # get the last element from the order list and add 1
        my $LastOrderNumber = $DynamicfieldOrderList[-1];
        $LastOrderNumber++;

        # add this new order number to the end of the list
        push @DynamicfieldOrderList, $LastOrderNumber;
    }

    # show the names of the other fields to ease ordering
    my %OrderNamesList;
    my $CurrentlyText = $LayoutObject->{LanguageObject}->Translate('Currently') . ': ';
    for my $OrderNumber ( sort @DynamicfieldOrderList ) {
        $OrderNamesList{$OrderNumber} = $OrderNumber;
        if ( $DynamicfieldNamesList{$OrderNumber} && $OrderNumber ne $Param{FieldOrder} ) {
            $OrderNamesList{$OrderNumber} = $OrderNumber . ' - '
                . $CurrentlyText
                . $DynamicfieldNamesList{$OrderNumber};
        }
    }

    my $DynamicFieldOrderStrg = $LayoutObject->BuildSelection(
        Data          => \%OrderNamesList,
        Name          => 'FieldOrder',
        SelectedValue => $Param{FieldOrder} || 1,
        PossibleNone  => 0,
        Translation   => 0,
        Sort          => 'NumericKey',
        Class         => 'Modernize W75pc Validate_Number',
    );

    my %ValidList    = $ValidObject->ValidList();
    my $ValidityStrg = $LayoutObject->BuildSelection(
        Data         => \%ValidList,
        Name         => 'ValidID',
        SelectedID   => $Param{ValidID} || 1,
        PossibleNone => 0,
        Translation  => 1,
        Class        => 'Modernize W50pc',
    );

    my $DefaultValue = ( defined $Param{DefaultValue} ? $Param{DefaultValue} : '' );

    $LayoutObject->Block(
        Name => 'DefaultValue',
        Data => {
            %Param,
            DefaultValue => $DefaultValue,
        },
    );

    # define config field specific settings
    my $Link        = $Param{Link}        || '';
    my $LinkPreview = $Param{LinkPreview} || '';

    # create the default link element
    $LayoutObject->Block(
        Name => 'Link',
        Data => {
            %Param,
            Link        => $Link,
            LinkPreview => $LinkPreview,
        },
    );

    my %ShowParams = $Self->_AdditionalParamsShow(
        %Param
    );
    %Param = ( %Param, %ShowParams );

    %ShowParams = $Self->_AdditionalDFStorageShow(
        %Param
    );
    %Param = ( %Param, %ShowParams );

    my $ReadonlyInternalField = '';

    # Internal fields can not be deleted and name should not change.
    if ( $Param{InternalField} ) {
        $LayoutObject->Block(
            Name => 'InternalField',
            Data => {%Param},
        );
        $ReadonlyInternalField = 'readonly="readonly"';
    }

    my $FieldID = $ParamObject->GetParam( Param => 'ID' );

    # only if the dynamic field exists and should be edited,
    # not if the field is added for the first time
    if ($FieldID) {
        my $DynamicField = $DynamicFieldObject->DynamicFieldGet(
            ID => $FieldID,
        );

        my $FieldConfig      = $DynamicField->{Config};
        my $DynamicFieldName = $DynamicField->{Name};

        # In case dirty setting disable form
        my $IsDirtyConfig = 0;
        my @IsDirtyResult = $SysConfigObject->ConfigurationDirtySettingsList();
        my %IsDirtyList   = map { $_ => 1 } @IsDirtyResult;

        my @IsDynamicFieldInSysConfig = $SysConfigObject->ConfigurationEntityCheck(
            EntityType => 'DynamicField',
            EntityName => $DynamicFieldName // '',
        );

        if (@IsDynamicFieldInSysConfig) {
            $LayoutObject->Block(
                Name => 'DynamicFieldInSysConfig',
                Data => {
                    OldName => $DynamicFieldName,
                },
            );
            for my $SettingName (@IsDynamicFieldInSysConfig) {
                $LayoutObject->Block(
                    Name => 'DynamicFieldInSysConfigRow',
                    Data => {
                        SettingName => $SettingName,
                    },
                );

                # Verify if dirty setting
                if ( $IsDirtyList{$SettingName} ) {
                    $IsDirtyConfig = 1;
                }
            }
        }

        if ($IsDirtyConfig) {
            $LayoutObject->Block(
                Name => 'DynamicFieldInSysConfigDirty',
            );
        }
    }

    if ( $Param{ID} ) {
        my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
            ID => $Param{ID},
        );

        my $DynamicFieldHTML = $DynamicFieldBackendObject->EditFieldRender(
            DynamicFieldConfig => $DynamicFieldConfig,
            LayoutObject       => $LayoutObject,
            ParamObject        => $ParamObject,
            AJAXUpdate         => 1,
        );

        $LayoutObject->Block(
            Name => 'TestField',
            Data => $DynamicFieldHTML,
        );
    }

    my %InputFieldWidthSelection = (
        10  => '10 %',
        20  => '20 %',
        25  => '25 %',
        33  => '33 %',
        50  => '50 %',
        60  => '60 %',
        70  => '70 %',
        75  => '75 %',
        80  => '80 %',
        90  => '90 %',
        95  => '95 %',
        100 => '100 %',
    );
    my $InputFieldWidthSelection = $LayoutObject->BuildSelection(
        Data         => \%InputFieldWidthSelection,
        Name         => 'InputFieldWidth',
        SelectedID   => $Param{InputFieldWidth} || '50',
        PossibleNone => 0,
        Translation  => 0,
        Class        => 'Modernize W50pc',
        Sort         => 'NumericKey',
    );

    my $AdditionalAttributesConfig = $ConfigObject->Get('DynamicFieldWebservice::AdditionalAttributes') // {};

    my $AdditionalStandardAttributesConfig = $AdditionalAttributesConfig->{Standard}        // {};
    my $AdditionalAttributesMapping        = $AdditionalStandardAttributesConfig->{Option}  // {};
    my $DefaultAttributeSet                = $AdditionalStandardAttributesConfig->{Default} // {};

    my $AdditionalSelectableAttributesConfig  = $AdditionalAttributesConfig->{Selectable}        // {};
    my $AdditionalSelectableAttributesMapping = $AdditionalSelectableAttributesConfig->{Option}  // {};
    my $DefaultSelectableAttributeSet         = $AdditionalSelectableAttributesConfig->{Default} // {};

    my $SelectableAttributes = {
        %{$AdditionalAttributesMapping},
        %{$AdditionalSelectableAttributesMapping}
    };

    $Self->_IsAttributeFeatureEnabled(
        AdditionalAttributes => $SelectableAttributes,
    );

    my $AdditionalAttributes = $LayoutObject->BuildSelection(
        Data          => $SelectableAttributes,
        Name          => 'AdditionalAttributes',
        SelectedValue => $Param{AdditionalAttributes},
        Translation   => 0,
        Class         => 'Modernize W50pc',
        Sort          => 'Key',
        Multiple      => 1
    );

    if ( IsArrayRefWithData( $Param{AdditionalAttributes} ) ) {
        my $SelectableAttributesEnabled;

        ATTRIBUTE:
        for my $AdditionalAttribute ( @{ $Param{AdditionalAttributes} } ) {
            next ATTRIBUTE if !$AdditionalSelectableAttributesMapping->{$AdditionalAttribute};
            next ATTRIBUTE if $AdditionalAttribute =~ m{DynamicField};

            if ( !$SelectableAttributesEnabled ) {
                $LayoutObject->Block(
                    Name => 'AttributeKey',
                    Data => {}
                );
                $SelectableAttributesEnabled = 1;
            }

            $LayoutObject->Block(
                Name => 'SelectableAttributeKeyRow',
                Data => {
                    AtributeLabel => $AdditionalAttribute,
                    AttributeKey  => $AdditionalAttribute,
                }
            );
            for my $Type (qw(ID Name)) {
                my %Mapping = (
                    "ID"   => "ID",
                    "Name" => ""
                );

                $LayoutObject->Block(
                    Name => 'AttributeType',
                    Data => {
                        AttributeIDChecked => $Param{AdditionalAttributeKeys}->{$AdditionalAttribute}->{$Type}
                        ? "checked"
                        : "",
                        AttributeKey   => $AdditionalAttribute . $Type,
                        AttributeLabel => $AdditionalAttribute . $Mapping{$Type},
                        Value          => $Param{AdditionalAttributeKeys}->{$AdditionalAttribute}->{$Type},
                    }
                );
            }
        }
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminDynamicFieldWebservice',
        Data         => {
            %Param,
            ValidityStrg             => $ValidityStrg,
            DynamicFieldOrderStrg    => $DynamicFieldOrderStrg,
            DefaultValue             => $DefaultValue,
            ReadonlyInternalField    => $ReadonlyInternalField,
            Link                     => $Link,
            LinkPreview              => $LinkPreview,
            InputFieldWidthSelection => $InputFieldWidthSelection,
            AdditionalAttributes     => $AdditionalAttributes,
        },
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _AJAXUpdate {
    my ( $Self, %Param ) = @_;

    my $LayoutObject                 = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $WebserviceObject             = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $DynamicFieldWebserviceObject = $Kernel::OM->Get('Kernel::System::DynamicField::Webservice');

    my $JSON;

    if ( $Param{ElementChanged} eq 'Webservice' ) {
        my $Webservice = $WebserviceObject->WebserviceGet(
            Name => $Param{Webservice},
        );

        my %InvokerList = ();
        if ( IsHashRefWithData($Webservice) && $Webservice->{Config}->{Requester}->{Invoker} ) {
            %InvokerList = map { $_ => $_ } keys %{ $Webservice->{Config}->{Requester}->{Invoker} };
        }

        $JSON = $LayoutObject->BuildSelectionJSON(
            [
                {
                    Data         => \%InvokerList,
                    Name         => 'InvokerSearch',
                    ID           => 'InvokerSearch',
                    SelectedID   => $Param{InvokerSearch},
                    PossibleNone => 0,
                    Translation  => 1,
                    Class        => 'Modernize',
                },
                {
                    Data         => \%InvokerList,
                    Name         => 'InvokerGet',
                    ID           => 'InvokerGet',
                    SelectedID   => $Param{InvokerGet},
                    PossibleNone => 0,
                    Translation  => 1,
                    Class        => 'Modernize',
                },
            ],
        );
    }
    elsif ( $Param{ElementChanged} eq 'Backend' ) {

        my %BackendListGet = $DynamicFieldWebserviceObject->BackendListGet();
        $JSON = $LayoutObject->BuildSelectionJSON(
            [
                {
                    Name => 'BackendDocumentation',
                    Data => $BackendListGet{ $Param{Backend} }->{Documentation},
                },
            ],
        );
    }

    return $LayoutObject->Attachment(
        ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
        Content     => $JSON,
        Type        => 'inline',
        NoCache     => 1,
    );
}

sub _AdditionalParamsShow {
    my ( $Self, %Param ) = @_;

    my $LayoutObject                 = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $DynamicFieldObject           = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $WebserviceObject             = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $DynamicFieldWebserviceObject = $Kernel::OM->Get('Kernel::System::DynamicField::Webservice');

    my %ShowParams;

    # Only ticket dynamic fields are supported for additional dynamic field storage.
    return %ShowParams if !$Param{ObjectType};
    return %ShowParams if $Param{ObjectType} ne 'Ticket';

    my $WebserviceList = $WebserviceObject->WebserviceList();
    my %WebserviceList;
    if ( IsHashRefWithData($WebserviceList) ) {
        %WebserviceList = map { $_ => $_ } values %{$WebserviceList};
    }

    $ShowParams{WebserviceOption} = $LayoutObject->BuildSelection(
        Data         => \%WebserviceList,
        Name         => 'Webservice',
        ID           => 'Webservice',
        SelectedID   => $Param{Webservice},
        PossibleNone => 1,
        Translation  => 1,
        Class        => 'Modernize Validate_Required',
    );

    my $Webservice;
    if ( $Param{Webservice} ) {
        $Webservice = $WebserviceObject->WebserviceGet(
            Name => $Param{Webservice},
        );
    }

    my %InvokerList = ();
    if ( IsHashRefWithData($Webservice) && $Webservice->{Config}->{Requester}->{Invoker} ) {
        %InvokerList = map { $_ => $_ } keys %{ $Webservice->{Config}->{Requester}->{Invoker} };
    }

    $ShowParams{InvokerSearchOption} = $LayoutObject->BuildSelection(
        Data         => \%InvokerList,
        Name         => 'InvokerSearch',
        ID           => 'InvokerSearch',
        SelectedID   => $Param{InvokerSearch},
        PossibleNone => 0,
        Translation  => 1,
        Class        => 'Modernize Validate_Required',
    );
    $ShowParams{InvokerGetOption} = $LayoutObject->BuildSelection(
        Data         => \%InvokerList,
        Name         => 'InvokerGet',
        ID           => 'InvokerGet',
        SelectedID   => $Param{InvokerGet},
        PossibleNone => 0,
        Translation  => 1,
        Class        => 'Modernize Validate_Required',
    );

    my %BackendList = $DynamicFieldWebserviceObject->BackendList();

    $Param{Backend} //= 'DirectRequest';
    $ShowParams{BackendOption} = $LayoutObject->BuildSelection(
        Data         => \%BackendList,
        Name         => 'Backend',
        ID           => 'Backend',
        SelectedID   => $Param{Backend},
        PossibleNone => 1,
        Translation  => 1,
        Class        => 'Modernize Validate_Required',
    );

    my %BackendListGet = $DynamicFieldWebserviceObject->BackendListGet();
    $ShowParams{BackendDocumentation} = $BackendListGet{ $Param{Backend} }->{Documentation} || '';

    my $DefaultSearchTerm = defined $Param{DefaultSearchTerm} ? $Param{DefaultSearchTerm} : '';

    $LayoutObject->Block(
        Name => 'DefaultSearchTerm',
        Data => {
            %Param,
            DefaultSearchTerm => $DefaultSearchTerm,
        },
    );

    return %ShowParams if $Param{FieldType} ne 'WebserviceMultiselect';

    my $InitialSearchTerm = defined $Param{InitialSearchTerm} ? $Param{InitialSearchTerm} : '';
    $LayoutObject->Block(
        Name => 'InitialSearchTerm',
        Data => {
            %Param,
            InitialSearchTerm => $InitialSearchTerm,
        },
    );

    my $TemplateType     = $Param{TemplateType} // 'default';
    my %TemplateTypeList = $DynamicFieldWebserviceObject->TemplateTypeList();

    my $TemplateTypeOption = $LayoutObject->BuildSelection(
        Data           => \%TemplateTypeList,
        Sort           => 'IndividualKey',
        SortIndividual => [ 'default', 'separator', 'wordwrap', 'list' ],
        Name           => 'TemplateType',
        SelectedID     => $TemplateType || 'default',
        PossibleNone   => 0,
        Translation    => 1,
        Class          => 'Modernize',
    );

    $LayoutObject->Block(
        Name => 'TemplateType',
        Data => {
            %Param,
            TemplateTypeOption => $TemplateTypeOption,
        },
    );

    return %ShowParams;
}

sub _AdditionalParamsGet {
    my ( $Self, %Param ) = @_;

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my %AdditionalParams;
    for my $Param (
        qw(
        Webservice InvokerSearch InvokerGet Backend SearchKeys CacheTTL StoredValue DisplayedValues
        TemplateType DisplayedValuesSeparator Limit AutocompleteMinLength QueryDelay
        InputFieldWidth DefaultSearchTerm InitialSearchTerm
        )
        )
    {
        $AdditionalParams{$Param} = $ParamObject->GetParam( Param => $Param ) // '';
    }

    # Set default values
    if ( !length $AdditionalParams{Limit} ) {
        $AdditionalParams{Limit} = 20;
    }
    if ( !length $AdditionalParams{AutocompleteMinLength} ) {
        $AdditionalParams{AutocompleteMinLength} = 3;
    }

    my @AdditionalDFStorage = $Self->_AdditionalDFStorageGet();
    $AdditionalParams{AdditionalDFStorage} = \@AdditionalDFStorage;

    return %AdditionalParams;
}

sub _AdditionalParamsValidate {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my %Errors;

    REQUIREDPARAM:
    for my $RequiredParam (qw(Webservice InvokerSearch InvokerGet Backend)) {
        next REQUIREDPARAM if IsStringWithData( $Param{$RequiredParam} );

        $Errors{ $RequiredParam . 'ServerError' }        = 'ServerError';
        $Errors{ $RequiredParam . 'ServerErrorMessage' } = 'This field is required.';
    }

    # Cache TTL must be an integer or empty
    if (
        IsStringWithData( $Param{CacheTTL} )
        && $Param{CacheTTL} !~ m{\A\d+\z}
        )
    {
        $Errors{'CacheTTLServerError'}        = 'ServerError';
        $Errors{'CacheTTLServerErrorMessage'} = 'This field should be an integer.';
    }

    my $DynamicFieldName = $Param{Name};
    if ( !defined $DynamicFieldName || !length $DynamicFieldName ) {

        # Note: This is not a form error, since the name was checked earlier in this package.
        $LogObject->Log(
            Priority => 'error',
            Message  => "Name of dynamic field is missing.",
        );
        return;
    }

    my %AdditionalDFStorageErrors = $Self->_AdditionalDFStorageValidate(
        %Param
    );

    %Errors = (
        %Errors,
        %AdditionalDFStorageErrors,
    );

    return %Errors;
}

sub _AdditionalDFStorageShow {
    my ( $Self, %Param ) = @_;

    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my %ShowParams;

    # Only ticket dynamic fields are supported for additional dynamic field storage.
    return %ShowParams if !$Param{ObjectType};
    return %ShowParams if $Param{ObjectType} ne 'Ticket';

    my @AdditionalDFStorage;
    if ( IsArrayRefWithData( $Param{AdditionalDFStorage} ) ) {
        @AdditionalDFStorage = @{ $Param{AdditionalDFStorage} };
    }

    $LayoutObject->Block(
        Name => 'AdditionalDFStorage',
        Data => {},
    );

    # Assemble available dynamic fields to be additionally filled.
    my $AdditionalDynamicFieldConfigs = $DynamicFieldObject->DynamicFieldListGet(
        ObjectType => 'Ticket',
    );

    # Filter out dynamic field that is currently being configured. It's not available
    # to be selected as an additional dynamic field to be filled.
    my @AdditionalDynamicFieldConfigs = @{$AdditionalDynamicFieldConfigs};
    if ( defined $Param{Name} ) {
        @AdditionalDynamicFieldConfigs = grep { $_->{Name} ne $Param{Name} } @{$AdditionalDynamicFieldConfigs};
    }

    my %AdditionalDynamicFieldSelection
        = map { $_->{Name} => $_->{Name} . ' (' . $_->{Label} . ')' } @AdditionalDynamicFieldConfigs;

    my $AdditionalDFStorageValueCounter = 0;
    for my $Storage (@AdditionalDFStorage) {
        my $DynamicField = $Storage->{DynamicField};
        my $Key          = $Storage->{Key};
        my $Type         = $Storage->{Type};

        my $DynamicFieldError        = '';
        my $DynamicFieldErrorMessage = Translatable('This field is required');    # default in template

        my $KeyError        = '';
        my $KeyErrorMessage = Translatable('This field is required');             # default in template;

        if ( $Param{AdditionalDFStorageErrors} ) {

            # Dynamic field error
            if ( defined $Param{AdditionalDFStorageErrors}->[$AdditionalDFStorageValueCounter]->{DynamicField} ) {
                $DynamicFieldError = 'ServerError';
                $DynamicFieldErrorMessage
                    = $Param{AdditionalDFStorageErrors}->[$AdditionalDFStorageValueCounter]->{DynamicField};
            }

            # key error
            if ( defined $Param{AdditionalDFStorageErrors}->[$AdditionalDFStorageValueCounter]->{Key} ) {
                $KeyError        = 'ServerError';
                $KeyErrorMessage = $Param{AdditionalDFStorageErrors}->[$AdditionalDFStorageValueCounter]->{Key};
            }
        }

        $AdditionalDFStorageValueCounter++;

        my $DynamicFieldSelection = $LayoutObject->BuildSelection(
            Data         => \%AdditionalDynamicFieldSelection,
            Sort         => 'AlphanumericValue',
            Name         => 'DynamicField_' . $AdditionalDFStorageValueCounter,
            SelectedID   => $DynamicField,
            PossibleNone => 1,
            Translation  => 0,
            Class        => "Modernize VariableWidth DataTable Validate_Required $DynamicFieldError",
        );

        my $TypeOption = $LayoutObject->BuildSelection(
            Data => {
                'Frontend'        => 'Frontend',
                'Backend'         => 'Backend',
                'FrontendBackend' => 'Frontend and Backend',
            },
            Sort           => 'IndividualKey',
            SortIndividual => [ 'Backend', 'Frontend', 'FrontendBackend' ],
            Name           => 'Type_' . $AdditionalDFStorageValueCounter,
            SelectedID     => $Type || 'Backend',
            PossibleNone   => 0,
            Translation    => 1,
            Class          => 'Modernize',
        );

        # create a value map row
        $LayoutObject->Block(
            Name => 'AdditionalDFStorageRow',
            Data => {
                AdditionalDFStorageValueCounter => $AdditionalDFStorageValueCounter,
                DynamicFieldSelection           => $DynamicFieldSelection,
                DynamicFieldErrorMessage        => $DynamicFieldErrorMessage,
                Key                             => $Key,
                KeyError                        => $KeyError,
                KeyErrorMessage                 => $KeyErrorMessage,
                TypeOption                      => $TypeOption,
            },
        );
    }

    $Param{TypeOption} = $LayoutObject->BuildSelection(
        Data => {
            'Frontend'        => 'Frontend',
            'Backend'         => 'Backend',
            'FrontendBackend' => 'Frontend and Backend',
        },
        Sort           => 'IndividualKey',
        SortIndividual => [ 'Backend', 'Frontend', 'FrontendBackend' ],
        Name           => 'Type',
        SelectedID     => $Param{Type} || 'Backend',
        PossibleNone   => 0,
        Translation    => 1,
        Class          => 'Modernize',
    );

    # create AdditionalDFStorage template
    $Param{DynamicFieldSelectionTemplate} = $LayoutObject->BuildSelection(
        Data         => \%AdditionalDynamicFieldSelection,
        Sort         => 'AlphanumericValue',
        Name         => 'DynamicField',
        PossibleNone => 1,
        Translation  => 0,
        Class        => 'Modernize VariableWidth DataTable',
    );

    $LayoutObject->Block(
        Name => 'AdditionalDFStorageTemplate',
        Data => {
            %Param,
        },
    );

    $LayoutObject->Block(
        Name => 'AdditionalDFStorageValueCounter',
        Data => {
            AdditionalDFStorageValueCounter => $AdditionalDFStorageValueCounter,
        },
    );

    $ShowParams{AdditionalDFStorageValueCounter} = $AdditionalDFStorageValueCounter;

    return %ShowParams;
}

sub _AdditionalDFStorageGet {
    my ( $Self, %Param ) = @_;

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my @AdditionalDFStorage;

    my $ValueCounter = $ParamObject->GetParam( Param => 'AdditionalDFStorageValueCounter' ) // 0;

    VALUECOUNTERINDEX:
    for my $ValueCounterIndex ( 1 .. $ValueCounter ) {
        my $DynamicField = $ParamObject->GetParam( Param => 'DynamicField_' . $ValueCounterIndex );
        next VALUECOUNTERINDEX if !defined $DynamicField;

        my $Key  = $ParamObject->GetParam( Param => 'Key_' . $ValueCounterIndex );
        my $Type = $ParamObject->GetParam( Param => 'Type_' . $ValueCounterIndex ) // 'Backend';

        push @AdditionalDFStorage, {
            DynamicField => $DynamicField,
            Key          => $Key,
            Type         => $Type,
        };
    }

    return @AdditionalDFStorage;
}

sub _AdditionalDFStorageValidate {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my @AdditionalDFStorage = @{ $Param{AdditionalDFStorage} // [] };

    my %UsedDynamicFields;
    my @StorageErrorMessages;
    my $StorageErrorFound;

    STORAGE:
    for my $Storage (@AdditionalDFStorage) {
        my $DynamicField = $Storage->{DynamicField};
        my $Key          = $Storage->{Key};
        my $Type         = $Storage->{Type};

        my %StorageErrorMessages;

        # Check dynamic field.
        if ( !defined $DynamicField || !length $DynamicField ) {
            $StorageErrorMessages{DynamicField} = Translatable('This field is required.');
        }
        elsif ( $UsedDynamicFields{$DynamicField} ) {
            $StorageErrorMessages{DynamicField} = Translatable('Dynamic field is configured more than once.');
        }
        else {
            my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                Name => $DynamicField,
            );
            if ( !IsHashRefWithData($DynamicFieldConfig) ) {
                $StorageErrorMessages{DynamicField} = Translatable('Dynamic field does not exist or is invalid.');
            }
            elsif ( $DynamicFieldConfig->{ObjectType} ne 'Ticket' ) {
                $StorageErrorMessages{DynamicField} = Translatable('Only dynamic fields for tickets are allowed.');
            }
        }

        if ( defined $DynamicField && length $DynamicField ) {
            $UsedDynamicFields{$DynamicField} = 1;
        }

        # Check key.
        if ( !defined $Key || !length $Key ) {
            $StorageErrorMessages{Key} = Translatable('This field is required.');
        }

        # Important: push even if %StorageErrorMessages is empty
        # because the index in @StorageErrorMessages must match the one of @AdditionalDFStorage.
        push @StorageErrorMessages, \%StorageErrorMessages;

        $StorageErrorFound = 1 if %StorageErrorMessages;
    }

    my %Errors;
    return %Errors if !$StorageErrorFound;

    $Errors{AdditionalDFStorageErrors} = \@StorageErrorMessages;

    return %Errors;
}

sub _IsAttributeFeatureEnabled {
    my ( $Self, %Param ) = @_;

    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $AdditionalAttributes = $Param{AdditionalAttributes};

    for my $AttributeFeature (qw( Responsible Type Service )) {
        my $TicketAttribute = $ConfigObject->Get("Ticket::$AttributeFeature");
        delete $AdditionalAttributes->{$AttributeFeature} if !$TicketAttribute;
    }

    return 1;
}

1;
