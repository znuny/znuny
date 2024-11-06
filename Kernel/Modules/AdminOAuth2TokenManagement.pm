# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminOAuth2TokenManagement;

use strict;
use warnings;
use utf8;

use File::Basename;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::DateTime',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Valid',
    'Kernel::System::Web::Request',
    'Kernel::System::YAML',
    'Kernel::System::OAuth2Token',
    'Kernel::System::OAuth2TokenConfig',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $HomePath = $ConfigObject->Get('Home');
    $Self->{TokenConfigTemplateFilesBasePath} = $HomePath
        . '/scripts/OAuth2TokenManagement/TokenConfigTemplates';

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( $Self->{Subaction} eq 'RequestTokenByAuthorizationCode' ) {
        return $Self->_RequestTokenByAuthorizationCode(%Param);
    }
    elsif ( $Self->{Subaction} eq 'EditTokenConfig' ) {
        return $Self->_EditTokenConfig(%Param);
    }
    elsif ( $Self->{Subaction} eq 'AddTokenConfigByTemplateFile' ) {
        return $Self->_AddTokenConfigByTemplateFile(%Param);
    }
    elsif ( $Self->{Subaction} eq 'SaveTokenConfig' ) {
        return $Self->_SaveTokenConfig(%Param);
    }
    elsif ( $Self->{Subaction} eq 'DeleteTokenConfig' ) {
        return $Self->_DeleteTokenConfig(%Param);
    }
    elsif ( $Self->{Subaction} eq 'ImportTokenConfigurations' ) {
        return $Self->_ImportTokenConfigurations(%Param);
    }
    elsif ( $Self->{Subaction} eq 'ExportTokenConfigurations' ) {
        return $Self->_ExportTokenConfigurations(%Param);
    }

    # Overview
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $Self->_Overview(%Param);
    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _RequestTokenByAuthorizationCode {
    my ( $Self, %Param ) = @_;

    my $ConfigObject      = $Kernel::OM->Get('Kernel::Config');
    my $ParamObject       = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject      = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $OAuth2TokenObject = $Kernel::OM->Get('Kernel::System::OAuth2Token');

    my %AuthorizationCodeParameters = $OAuth2TokenObject->GetAuthorizationCodeParameters(
        ParamObject => $ParamObject,
        UserID      => $Self->{UserID},
    );
    if ( !%AuthorizationCodeParameters ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('Authorization code parameters not found.'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my %Token = $OAuth2TokenObject->RequestTokenByAuthorizationCode(
        TokenConfigID     => $AuthorizationCodeParameters{TokenConfigID},
        AuthorizationCode => $AuthorizationCodeParameters{AuthorizationCode},
        UserID            => $Self->{UserID},
    );

    my $TokenErrorMessage = $OAuth2TokenObject->GetTokenErrorMessage(
        TokenConfigID => $AuthorizationCodeParameters{TokenConfigID},
        UserID        => $Self->{UserID},
    );

    if ( !%Token || IsStringWithData($TokenErrorMessage) ) {
        my $Message
            = "Error requesting token for token config ID $AuthorizationCodeParameters{TokenConfigID} with authorization code '$AuthorizationCodeParameters{AuthorizationCode}'.";
        if ( IsStringWithData($TokenErrorMessage) ) {
            $Message .= " Error: $TokenErrorMessage";
        }

        return $LayoutObject->ErrorScreen(
            Message => $Message,
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    return $LayoutObject->PopupClose(
        Reload => 1,
    );
}

sub _DeleteTokenConfig {
    my ( $Self, %Param ) = @_;

    my $ParamObject             = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $TokenConfigID = $ParamObject->GetParam( Param => 'ID' );

    if ( !$TokenConfigID ) {
        return $LayoutObject->ErrorScreen(
            Message => "Parameter 'ID' is missing.",
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my $OAuth2TokenConfigIsInUse = $OAuth2TokenConfigObject->IsOAuth2TokenConfigInUse(
        ID => $TokenConfigID,
    );
    if ($OAuth2TokenConfigIsInUse) {
        return $LayoutObject->ErrorScreen(
            Message => "OAuth2 token configuration with ID $TokenConfigID is in use and cannot be deleted.",
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my $TokenConfigDeleted = $OAuth2TokenConfigObject->DataDelete(
        $OAuth2TokenConfigObject->{Identifier} => $TokenConfigID,
        UserID                                 => $Self->{UserID},
    );
    if ( !$TokenConfigDeleted ) {
        return $LayoutObject->ErrorScreen(
            Message => "Error deleting token config with ID $TokenConfigID.",
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my $Output = $LayoutObject->Redirect(
        OP => 'Action=AdminOAuth2TokenManagement',
    );

    return $Output;
}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $OAuth2TokenObject       = $Kernel::OM->Get('Kernel::System::OAuth2Token');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my %ValidIDs = $ValidObject->ValidList();

    my @TokenConfigs = $OAuth2TokenConfigObject->DataListGet(
        UserID => $Self->{UserID},
    );

    $LayoutObject->Block(
        Name => 'Filter',
    );

    TOKENCONFIG:
    for my $TokenConfig (@TokenConfigs) {
        my $OAuth2TokenConfigIsInUse = $OAuth2TokenConfigObject->IsOAuth2TokenConfigInUse(
            ID => $TokenConfig->{ID},
        );
        next TOKENCONFIG if !$OAuth2TokenConfigIsInUse;

        $TokenConfig->{Used} = 1;
    }

    # Assemble details about tokens and refresh tokens
    for my $TokenConfig (@TokenConfigs) {
        my %TokenData = (
            TokenPresent                  => undef,
            TokenExpirationDate           => undef,
            TokenHasExpired               => undef,
            LastTokenRequestFailed        => undef,
            RefreshTokenPresent           => undef,
            RefreshTokenExpirationDate    => undef,
            RefreshTokenHasExpired        => undef,
            RefreshTokenRequestConfigured => undef,
        );

        # Because ID column is configurable in database backend and using simply 'ID'
        # in template might cause problems in the future.
        my $TokenConfigID = $TokenConfig->{ $OAuth2TokenConfigObject->{Identifier} };
        $TokenConfig->{TokenConfigID} = $TokenConfigID;

        my %Token = $OAuth2TokenObject->DataGet(
            TokenConfigID => $TokenConfigID,
            UserID        => $Self->{UserID},
        );

        my $TokenHasExpired = $OAuth2TokenObject->HasTokenExpired(
            TokenConfigID => $TokenConfigID,
            UserID        => $Self->{UserID},
        );

        my $RefreshTokenHasExpired = $OAuth2TokenObject->HasRefreshTokenExpired(
            TokenConfigID => $TokenConfigID,
            UserID        => $Self->{UserID},
        );

        my $TokenErrorMessage = $OAuth2TokenObject->GetTokenErrorMessage(
            TokenConfigID => $TokenConfigID,
            UserID        => $Self->{UserID},
        );

        my $RefreshTokenRequestConfigured = IsHashRefWithData(
            $TokenConfig->{Config}->{Requests}->{TokenByRefreshToken}
        );

        my $AuthorizationCodeRequestURL = $OAuth2TokenObject->GenerateAuthorizationCodeRequestURL(
            TokenConfigID => $TokenConfigID,
            UserID        => $Self->{UserID},
        );

        %TokenData = (
            TokenPresent                  => $Token{Token} ? 1 : undef,
            TokenExpirationDate           => $Token{TokenExpirationDate},
            TokenHasExpired               => $TokenHasExpired,
            LastTokenRequestFailed        => defined $TokenErrorMessage ? 1 : undef,
            AuthorizationCodeRequestURL   => $AuthorizationCodeRequestURL,
            RefreshTokenPresent           => $Token{RefreshToken} ? 1 : undef,
            RefreshTokenExpirationDate    => $Token{RefreshTokenExpirationDate},
            RefreshTokenHasExpired        => $RefreshTokenHasExpired,
            RefreshTokenRequestConfigured => $RefreshTokenRequestConfigured,
        );

        $TokenConfig->{TokenData} = \%TokenData;
    }

    # Template selection for adding token configs.
    my $TokenConfigTemplateSelection = $Self->_GetTokenConfigTemplateSelection();

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AdminOAuth2TokenManagement/Overview',
        Data         => {
            TokenConfigs                 => \@TokenConfigs,
            ValidIDs                     => \%ValidIDs,
            TokenConfigTemplateSelection => $TokenConfigTemplateSelection,
        },
    );

    return $Output;
}

sub _EditTokenConfig {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $ParamObject             = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $TokenConfigID = $ParamObject->GetParam( Param => 'ID' );
    if ( !$TokenConfigID ) {
        return $LayoutObject->ErrorScreen(
            Message => 'Missing parameter ID.',
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $TokenConfigID,
        UserID                                 => $Self->{UserID},
    );
    if ( !%TokenConfig ) {
        return $LayoutObject->ErrorScreen(
            Message => "Token config with ID $TokenConfigID could not be found.",
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my %ValidIDs         = $ValidObject->ValidList();
    my $ValidIDSelection = $LayoutObject->BuildSelection(
        Data       => \%ValidIDs,
        Name       => 'ValidID',
        SelectedID => $TokenConfig{ValidID},
        Class      => 'Modernize Validate_Required',
    );

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminOAuth2TokenManagement/Edit',
        Data         => {
            ID           => $TokenConfigID,
            TemplateName => $TokenConfig{Config}->{TemplateName},
            Name         => $TokenConfig{Name},
            ClientID     => $TokenConfig{Config}->{ClientID},
            ClientSecret => $TokenConfig{Config}->{ClientSecret},
            AuthorizationCodeRequestURL =>
                $TokenConfig{Config}->{Requests}->{AuthorizationCode}->{Request}->{URL},
            TokenByAuthorizationCodeRequestURL =>
                $TokenConfig{Config}->{Requests}->{TokenByAuthorizationCode}->{Request}->{URL},
            TokenByRefreshTokenRequestURL =>
                $TokenConfig{Config}->{Requests}->{TokenByRefreshToken}->{Request}->{URL},
            Scope =>
                $TokenConfig{Config}->{Scope},
            NotifyOnExpiredToken        => $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredToken},
            NotifyOnExpiredRefreshToken => $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredRefreshToken},
            ValidIDSelection            => $ValidIDSelection,
        },
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _AddTokenConfigByTemplateFile {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $ParamObject             = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $MainObject              = $Kernel::OM->Get('Kernel::System::Main');
    my $YAMLObject              = $Kernel::OM->Get('Kernel::System::YAML');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $TokenConfigTemplateFilename = $ParamObject->GetParam( Param => 'TokenConfigTemplateFilename' );
    if ( !$TokenConfigTemplateFilename ) {
        return $LayoutObject->ErrorScreen(
            Message => 'Missing parameter TokenConfigTemplateFilename.',
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my $TokenConfigTemplate = $Self->_GetTokenConfigTemplate(
        TokenConfigTemplateFilename => $TokenConfigTemplateFilename,
    );
    if ( !IsHashRefWithData($TokenConfigTemplate) ) {
        return $LayoutObject->ErrorScreen(
            Message => "Error reading file for token config template $TokenConfigTemplateFilename.",
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my %ValidIDs      = $ValidObject->ValidList();
    my %ValidIDByName = reverse %ValidIDs;

    my $ValidIDSelection = $LayoutObject->BuildSelection(
        Data       => \%ValidIDs,
        Name       => 'ValidID',
        SelectedID => $ValidIDByName{valid},
        Class      => 'Modernize Validate_Required',
    );

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminOAuth2TokenManagement/Edit',
        Data         => {
            TokenConfigTemplateFilename => $TokenConfigTemplateFilename,
            TokenConfigTemplateName     => $TokenConfigTemplate->{Name},

            # Leave name initially empty for admin to fill out.
            Name         => '',
            ClientID     => $TokenConfigTemplate->{Config}->{ClientID},
            ClientSecret => $TokenConfigTemplate->{Config}->{ClientSecret},
            AuthorizationCodeRequestURL =>
                $TokenConfigTemplate->{Config}->{Requests}->{AuthorizationCode}->{Request}->{URL},
            TokenByAuthorizationCodeRequestURL =>
                $TokenConfigTemplate->{Config}->{Requests}->{TokenByAuthorizationCode}->{Request}->{URL},
            TokenByRefreshTokenRequestURL =>
                $TokenConfigTemplate->{Config}->{Requests}->{TokenByRefreshToken}->{Request}->{URL},
            Scope =>
                $TokenConfigTemplate->{Config}->{Scope},
            NotifyOnExpiredToken => $TokenConfigTemplate->{Config}->{Notifications}->{NotifyOnExpiredToken},
            NotifyOnExpiredRefreshToken =>
                $TokenConfigTemplate->{Config}->{Notifications}->{NotifyOnExpiredRefreshToken},
            ValidIDSelection => $ValidIDSelection,
        },
    );

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _SaveTokenConfig {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $ParamObject             = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my %GetParam;
    for my $GetParam (
        qw(
        ID TokenConfigTemplateFilename TokenConfigTemplateName Name ClientID ClientSecret
        AuthorizationCodeRequestURL TokenByAuthorizationCodeRequestURL TokenByRefreshTokenRequestURL Scope ValidID
        NotifyOnExpiredToken NotifyOnExpiredRefreshToken ContinueAfterSave
        )
        )
    {
        $GetParam{$GetParam} = $ParamObject->GetParam( Param => $GetParam );
    }

    my %Errors;

    # Check for required fields
    REQUIREDFIELD:
    for my $RequiredField (
        qw(Name ClientID ClientSecret AuthorizationCodeRequestURL TokenByAuthorizationCodeRequestURL TokenByRefreshTokenRequestURL ValidID)
        )
    {
        next REQUIREDFIELD if defined $GetParam{$RequiredField} && length $GetParam{$RequiredField};

        $Errors{ $RequiredField . 'Invalid' } = 'ServerError';
        if ( $RequiredField eq 'Name' ) {
            $LayoutObject->Block(
                Name => 'NameRequiredServerError',
                Data => {},
            );
        }
    }

    # Check for unique name of token config.
    if ( defined $GetParam{Name} && length $GetParam{Name} ) {
        my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
            Name   => $GetParam{Name},
            UserID => $Self->{UserID},
        );

        if (
            %TokenConfig
            && (
                !$GetParam{ID}    # new token config to be stored
                || $TokenConfig{ $OAuth2TokenConfigObject->{Identifier} }
                != $GetParam{ID}    # token config update
            )
            )
        {
            $Errors{NameInvalid} = 'ServerError';
            $LayoutObject->Block(
                Name => 'NameExistsServerError',
                Data => {},
            );
        }
    }

    if (%Errors) {
        my %ValidIDs         = $ValidObject->ValidList();
        my $ValidIDSelection = $LayoutObject->BuildSelection(
            Data       => \%ValidIDs,
            Name       => 'ValidID',
            SelectedID => $GetParam{ValidID},
            Class      => 'Modernize Validate_Required',
        );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();

        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminOAuth2TokenManagement/Edit',
            Data         => {
                ID                                 => $GetParam{ID},
                TokenConfigTemplateFilename        => $GetParam{TokenConfigTemplateFilename},
                TokenConfigTemplateName            => $GetParam{TokenConfigTemplateName},
                Name                               => $GetParam{Name},
                ClientID                           => $GetParam{ClientID},
                ClientSecret                       => $GetParam{ClientSecret},
                AuthorizationCodeRequestURL        => $GetParam{AuthorizationCodeRequestURL},
                TokenByAuthorizationCodeRequestURL => $GetParam{TokenByAuthorizationCodeRequestURL},
                TokenByRefreshTokenRequestURL      => $GetParam{TokenByRefreshTokenRequestURL},
                Scope                              => $GetParam{Scope},
                NotifyOnExpiredToken               => $GetParam{NotifyOnExpiredToken},
                NotifyOnExpiredRefreshToken        => $GetParam{NotifyOnExpiredRefreshToken},
                ValidIDSelection                   => $ValidIDSelection,
                %Errors,
            },
        );

        $Output .= $LayoutObject->Footer();

        return $Output;
    }

    # Update existing token config.
    if ( $GetParam{ID} ) {
        my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
            $OAuth2TokenConfigObject->{Identifier} => $GetParam{ID},
            UserID                                 => $Self->{UserID},
        );
        if ( !%TokenConfig ) {
            return $LayoutObject->ErrorScreen(
                Message => "Token config with ID $GetParam{ID} could not be found.",
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        $TokenConfig{Name}                   = $GetParam{Name};
        $TokenConfig{Config}->{ClientID}     = $GetParam{ClientID};
        $TokenConfig{Config}->{ClientSecret} = $GetParam{ClientSecret};
        $TokenConfig{Config}->{Requests}->{AuthorizationCode}->{Request}->{URL}
            = $GetParam{AuthorizationCodeRequestURL};
        $TokenConfig{Config}->{Requests}->{TokenByAuthorizationCode}->{Request}->{URL}
            = $GetParam{TokenByAuthorizationCodeRequestURL};
        $TokenConfig{Config}->{Requests}->{TokenByRefreshToken}->{Request}->{URL}
            = $GetParam{TokenByRefreshTokenRequestURL};
        $TokenConfig{Config}->{Scope} = $GetParam{Scope};
        $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredToken} = $GetParam{NotifyOnExpiredToken} ? 1 : 0;
        $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredRefreshToken}
            = $GetParam{NotifyOnExpiredRefreshToken} ? 1 : 0;
        $TokenConfig{ValidID} = $GetParam{ValidID};

        my $TokenConfigUpdated = $OAuth2TokenConfigObject->DataUpdate(
            %TokenConfig,
            UserID => $Self->{UserID},
        );
        if ( !$TokenConfigUpdated ) {
            return $LayoutObject->ErrorScreen(
                Message => "Error updating token config with ID $GetParam{ID}.",
                Comment => Translatable('Please contact the administrator.'),
            );
        }
    }

    # Add new token config by template.
    elsif ( $GetParam{TokenConfigTemplateFilename} ) {
        my $TokenConfigTemplate = $Self->_GetTokenConfigTemplate(
            TokenConfigTemplateFilename => $GetParam{TokenConfigTemplateFilename},
        );
        if ( !IsHashRefWithData($TokenConfigTemplate) ) {
            return $LayoutObject->ErrorScreen(
                Message => "Error reading file for token config template $GetParam{TokenConfigTemplateFilename}.",
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        my %TokenConfig = %{$TokenConfigTemplate};
        $TokenConfig{Name}                   = $GetParam{Name};
        $TokenConfig{Config}->{TemplateName} = $GetParam{TokenConfigTemplateName};
        $TokenConfig{Config}->{ClientID}     = $GetParam{ClientID};
        $TokenConfig{Config}->{ClientSecret} = $GetParam{ClientSecret};
        $TokenConfig{Config}->{Requests}->{AuthorizationCode}->{Request}->{URL}
            = $GetParam{AuthorizationCodeRequestURL};
        $TokenConfig{Config}->{Requests}->{TokenByAuthorizationCode}->{Request}->{URL}
            = $GetParam{TokenByAuthorizationCodeRequestURL};
        $TokenConfig{Config}->{Requests}->{TokenByRefreshToken}->{Request}->{URL}
            = $GetParam{TokenByRefreshTokenRequestURL};
        $TokenConfig{Config}->{Scope} = $GetParam{Scope};
        $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredToken} = $GetParam{NotifyOnExpiredToken} ? 1 : 0;
        $TokenConfig{Config}->{Notifications}->{NotifyOnExpiredRefreshToken}
            = $GetParam{NotifyOnExpiredRefreshToken} ? 1 : 0;
        $TokenConfig{ValidID} = $GetParam{ValidID};

        my $TokenConfigAdded = $OAuth2TokenConfigObject->DataAdd(
            %TokenConfig,
            CreateBy => $Self->{UserID},
            ChangeBy => $Self->{UserID},
            UserID   => $Self->{UserID},
        );
        if ( !$TokenConfigAdded ) {
            return $LayoutObject->ErrorScreen(
                Message => 'Error adding token config for template with name ' . $TokenConfigTemplate->{Name} . '.',
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        %TokenConfig = $OAuth2TokenConfigObject->DataGet(
            Name   => $GetParam{Name},
            UserID => $Self->{UserID},
        );
        if ( !%TokenConfig ) {
            return $LayoutObject->ErrorScreen(
                Message => 'Error retrieving token config with name ' . $GetParam{Name} . '.',
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        # For redirect to editing dialog after creating the token config.
        $GetParam{ID} = $TokenConfig{ $OAuth2TokenConfigObject->{Identifier} };
    }
    else {
        return $LayoutObject->ErrorScreen(
            Message => 'Parameter ID or TokenConfigTemplateFilename is missing.',
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    if ( $GetParam{ContinueAfterSave} ) {
        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action};Subaction=EditTokenConfig;ID=$GetParam{ID}"
        );
    }

    return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
}

sub _ImportTokenConfigurations {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject             = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $YAMLObject              = $Kernel::OM->Get('Kernel::System::YAML');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    $LayoutObject->ChallengeTokenCheck();

    my %Upload = $ParamObject->GetUploadAll(
        Param => 'FileUpload',
    );

    my $OverwriteExistingTokenConfigurations
        = $ParamObject->GetParam( Param => 'OverwriteExistingTokenConfigurations' );

    my $TokenConfigs = $YAMLObject->Load(
        Data => $Upload{Content},
    );

    if (
        !IsArrayRefWithData($TokenConfigs)
        && !IsHashRefWithData($TokenConfigs)
        )
    {
        return $LayoutObject->ErrorScreen(
            Message => 'Uploaded file does not contain valid YAML data.',
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    if ( IsHashRefWithData($TokenConfigs) ) {
        $TokenConfigs = [$TokenConfigs];
    }

    my @ValidIDs = $ValidObject->ValidIDsGet();
    my $ValidID  = shift @ValidIDs;

    my $ImportSuccessful = $OAuth2TokenConfigObject->DataImport(
        Content   => $Upload{Content},
        Format    => 'yml',
        Overwrite => $OverwriteExistingTokenConfigurations,
        Data      => {
            ValidID  => $ValidID,
            CreateBy => $Self->{UserID},
            ChangeBy => $Self->{UserID},
        },
        UserID => $Self->{UserID},
    );
    if ( !$ImportSuccessful ) {
        return $LayoutObject->ErrorScreen(
            Message => 'Error importing/parsing uploaded file.',
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    my $Output = $LayoutObject->Redirect(
        OP => 'Action=AdminOAuth2TokenManagement',
    );

    return $Output;
}

sub _ExportTokenConfigurations {
    my ( $Self, %Param ) = @_;

    my $LayoutObject            = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $TokenConfigsYAML = $OAuth2TokenConfigObject->DataExport(
        Format => 'yml',
        Cache  => 0,
        UserID => $Self->{UserID},
    );

    my $DateTimeObject = $Kernel::OM->Create(
        'Kernel::System::DateTime',
        ObjectParams => {
            TimeZone => $LayoutObject->{UserTimeZone},
        }
    );

    my $DateTimeString = $DateTimeObject->Format( Format => '%Y%m%d_%H%M%S' );

    my $Filename = "OAuth2TokenConfigurationExport_$DateTimeString.yml";

    my $Output = $LayoutObject->Attachment(
        ContentType => 'text/html; charset=UTF-8',
        Content     => $TokenConfigsYAML,
        Type        => 'attachment',
        Filename    => $Filename,
        NoCache     => 1,
    );

    return $Output;
}

sub _GetTokenConfigTemplateSelection {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $YAMLObject   = $Kernel::OM->Get('Kernel::System::YAML');

    my @TokenConfigTemplateFilePaths = $MainObject->DirectoryRead(
        Directory => $Self->{TokenConfigTemplateFilesBasePath},
        Filter    => '*.yml',
        Silent    => 1,
    );
    return if !@TokenConfigTemplateFilePaths;

    my %TokenConfigTemplateSelection;

    FILEPATH:
    for my $FilePath (@TokenConfigTemplateFilePaths) {
        my $TokenConfigTemplateFileContent = $MainObject->FileRead(
            Location => $FilePath,
            Result   => 'SCALAR',
        );
        next FILEPATH if !$TokenConfigTemplateFileContent;

        my $TokenConfigTemplates = $YAMLObject->Load(
            Data => ${$TokenConfigTemplateFileContent},
        );
        next FILEPATH if !IsArrayRefWithData($TokenConfigTemplates);

        TOKENCONFIGTEMPLATE:
        for my $TokenConfigTemplate ( @{$TokenConfigTemplates} ) {
            next TOKENCONFIGTEMPLATE if !defined $TokenConfigTemplate->{Name};
            next TOKENCONFIGTEMPLATE if !length $TokenConfigTemplate->{Name};

            my $Filename = fileparse( $FilePath, '.yml' );

            $TokenConfigTemplateSelection{$Filename} = $TokenConfigTemplate->{Name};

            # Only one template is allowed per file. Any other templates will be ignored.
            last TOKENCONFIGTEMPLATE;
        }
    }

    return if !%TokenConfigTemplateSelection;

    my $TokenConfigTemplateSelection = $LayoutObject->BuildSelection(
        Data         => \%TokenConfigTemplateSelection,
        Name         => 'TokenConfigTemplateFilePath',
        PossibleNone => 1,
        Class        => 'Modernize',
    );

    return $TokenConfigTemplateSelection;
}

sub _GetTokenConfigTemplate {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');
    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');

    NEEDED:
    for my $Needed (qw(TokenConfigTemplateFilename)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $TokenConfigTemplateFilePath = $Self->{TokenConfigTemplateFilesBasePath}
        . '/' . $Param{TokenConfigTemplateFilename} . '.yml';
    my $TokenConfigTemplateFileContent = $MainObject->FileRead(
        Location => $TokenConfigTemplateFilePath,
        Result   => 'SCALAR',
    );
    return if !$TokenConfigTemplateFileContent;

    my $TokenConfigTemplates = $YAMLObject->Load(
        Data => ${$TokenConfigTemplateFileContent},
    );
    return if !IsArrayRefWithData($TokenConfigTemplates);

    my $SelectedTokenConfigTemplate;

    TOKENCONFIGTEMPLATE:
    for my $TokenConfigTemplate ( @{$TokenConfigTemplates} ) {
        next TOKENCONFIGTEMPLATE if !defined $TokenConfigTemplate->{Name};
        next TOKENCONFIGTEMPLATE if !length $TokenConfigTemplate->{Name};

        $SelectedTokenConfigTemplate = $TokenConfigTemplate;

        # Only one template is allowed per file. Any other template will be ignored.
        last TOKENCONFIGTEMPLATE;
    }

    return $SelectedTokenConfigTemplate;
}

1;
