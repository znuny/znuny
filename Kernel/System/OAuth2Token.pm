# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

## nofilter(TidyAll::Plugin::Znuny::Perl::ParamObject)

package Kernel::System::OAuth2Token;

use strict;
use warnings;

use utf8;

use MIME::Base64;
use URI::Escape;

use Kernel::System::VariableCheck qw(:all);
use Kernel::System::WebUserAgent;

use parent qw(Kernel::System::DBCRUD);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DateTime',
    'Kernel::System::JSON',
    'Kernel::System::Log',
    'Kernel::System::OAuth2TokenConfig',
);

=head1 NAME

Kernel::System::OAuth2Token - OAuth2Token lib

=head1 SYNOPSIS

All OAuth2Token functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $OAuth2TokenObject = $Kernel::OM->Get('Kernel::System::OAuth2Token');

=cut

=head2 DataAdd()

Add data to table.

    my $Success = $OAuth2TokenObject->DataAdd(
        ID                         => '...',
        TokenConfigID              => '...',
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => '...',
        RefreshToken               => '...',
        RefreshTokenExpirationDate => '...',
        ErrorMessage               => '...',
        ErrorDescription           => '...',
        ErrorCode                  => '...',
        CreateTime                 => '...',
        CreateBy                   => '...',
        ChangeTime                 => '...',
        ChangeBy                   => '...',
    );

Returns:

    my $Success = 1;

=cut

=head2 DataUpdate()

Update data attributes.

    my $Success = $OAuth2TokenObject->DataUpdate(
        ID                         => 1234,
        UserID                     => 1,

        # all other attributes are optional
        TokenConfigID              => '...',
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => '...',
        RefreshToken               => '...',
        RefreshTokenExpirationDate => '...',
        ErrorMessage               => '...',
        ErrorDescription           => '...',
        ErrorCode                  => '...',
        CreateTime                 => '...',
        CreateBy                   => '...',
        ChangeTime                 => '...',
        ChangeBy                   => '...',
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataGet()

Get data attributes.

    my %Data = $OAuth2TokenObject->DataGet(
        ID                         => '...', # optional
        TokenConfigID              => '...', # optional
        AuthorizationCode          => '...', # optional
        Token                      => '...', # optional
        TokenExpirationDate        => '...', # optional
        RefreshToken               => '...', # optional
        RefreshTokenExpirationDate => '...', # optional
        ErrorMessage               => '...', # optional
        ErrorDescription           => '...', # optional
        ErrorCode                  => '...', # optional
        CreateTime                 => '...', # optional
        CreateBy                   => '...', # optional
        ChangeTime                 => '...', # optional
        ChangeBy                   => '...', # optional
    );

Returns:

    my %Data = (
        ID                         => '...',
        TokenConfigID              => '...',
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => '...',
        RefreshToken               => '...',
        RefreshTokenExpirationDate => '...',
        ErrorMessage               => '...',
        ErrorDescription           => '...',
        ErrorCode                  => '...',
        CreateTime                 => '...',
        CreateBy                   => '...',
        ChangeTime                 => '...',
        ChangeBy                   => '...',
    );

=cut

=head2 DataListGet()

Get list data with attributes.

    my @Data = $OAuth2TokenObject->DataListGet(
        ID                         => '...', # optional
        TokenConfigID              => '...', # optional
        AuthorizationCode          => '...', # optional
        Token                      => '...', # optional
        TokenExpirationDate        => '...', # optional
        RefreshToken               => '...', # optional
        RefreshTokenExpirationDate => '...', # optional
        ErrorMessage               => '...', # optional
        ErrorDescription           => '...', # optional
        ErrorCode                  => '...', # optional
        CreateTime                 => '...', # optional
        CreateBy                   => '...', # optional
        ChangeTime                 => '...', # optional
        ChangeBy                   => '...', # optional
    );

Returns:

    my @Data = (
        {
            ID                         => '...',
            TokenConfigID              => '...',
            AuthorizationCode          => '...',
            Token                      => '...',
            TokenExpirationDate        => '...',
            RefreshToken               => '...',
            RefreshTokenExpirationDate => '...',
            ErrorMessage               => '...',
            ErrorDescription           => '...',
            ErrorCode                  => '...',
            CreateTime                 => '...',
            CreateBy                   => '...',
            ChangeTime                 => '...',
            ChangeBy                   => '...',
        },
        # ...
    );

=cut

=head2 DataDelete()

Remove data from table.

    my $Success = $OAuth2TokenObject->DataDelete(
        ID                         => '...', # optional
        TokenConfigID              => '...', # optional
        AuthorizationCode          => '...', # optional
        Token                      => '...', # optional
        TokenExpirationDate        => '...', # optional
        RefreshToken               => '...', # optional
        RefreshTokenExpirationDate => '...', # optional
        ErrorMessage               => '...', # optional
        ErrorDescription           => '...', # optional
        ErrorCode                  => '...', # optional
        CreateTime                 => '...', # optional
        CreateBy                   => '...', # optional
        ChangeTime                 => '...', # optional
        ChangeBy                   => '...', # optional
    );

Returns:

    my $Success = 1;

=cut

=head2 DataSearch()

Search for value in defined attributes.

    my %Data = $OAuth2TokenObject->DataSearch(
        Search                     => 'test*test',
        ID                         => '...', # optional
        TokenConfigID              => '...', # optional
        AuthorizationCode          => '...', # optional
        Token                      => '...', # optional
        TokenExpirationDate        => '...', # optional
        RefreshToken               => '...', # optional
        RefreshTokenExpirationDate => '...', # optional
        ErrorMessage               => '...', # optional
        ErrorDescription           => '...', # optional
        ErrorCode                  => '...', # optional
        CreateTime                 => '...', # optional
        CreateBy                   => '...', # optional
        ChangeTime                 => '...', # optional
        ChangeBy                   => '...', # optional
    );

Returns:

    my %Data = (
        '1' => {
            ID                         => '...',
            TokenConfigID              => '...',
            AuthorizationCode          => '...',
            Token                      => '...',
            TokenExpirationDate        => '...',
            RefreshToken               => '...',
            RefreshTokenExpirationDate => '...',
            ErrorMessage               => '...',
            ErrorDescription           => '...',
            ErrorCode                  => '...',
            CreateTime                 => '...',
            CreateBy                   => '...',
            ChangeTime                 => '...',
            ChangeBy                   => '...',
        },
        # ...
    );

=cut

=head2 InitConfig()

init config for object

    my $Success = $OAuth2TokenObject->InitConfig();

Returns:

    my $Success = 1;

=cut

sub InitConfig {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $Self->{Columns} = {
        ID => {
            Column       => 'id',
            SearchTarget => 0,
        },
        TokenConfigID => {
            Column       => 'token_config_id',
            SearchTarget => 0,
        },
        AuthorizationCode => {
            Column       => 'authorization_code',
            SearchTarget => 0,
        },
        Token => {
            Column       => 'token',
            SearchTarget => 0,
        },
        TokenExpirationDate => {
            Column       => 'token_expiration_date',
            SearchTarget => 0,
        },
        RefreshToken => {
            Column       => 'refresh_token',
            SearchTarget => 0,
        },
        RefreshTokenExpirationDate => {
            Column       => 'refresh_token_expiration_date',
            SearchTarget => 0,
        },
        ErrorMessage => {
            Column       => 'error_message',
            SearchTarget => 0,
        },
        ErrorDescription => {
            Column       => 'error_description',
            SearchTarget => 0,
        },
        ErrorCode => {
            Column       => 'error_code',
            SearchTarget => 0,
        },
        CreateTime => {
            Column       => 'create_time',
            SearchTarget => 0,
            TimeStampAdd => 1,
        },
        CreateBy => {
            Column       => 'create_by',
            SearchTarget => 0,
        },
        ChangeTime => {
            Column          => 'change_time',
            SearchTarget    => 0,
            TimeStampUpdate => 1,
            TimeStampAdd    => 1,
        },
        ChangeBy => {
            Column       => 'change_by',
            SearchTarget => 0,
        },
    };

    # base table configuration
    $Self->{Name}           = 'OAuth2Token';
    $Self->{Identifier}     = 'ID';
    $Self->{DatabaseTable}  = 'oauth2_token';
    $Self->{DefaultSortBy}  = 'Name';
    $Self->{DefaultOrderBy} = 'ASC';
    $Self->{CacheType}      = 'OAuth2Token';
    $Self->{CacheTTL}       = $ConfigObject->Get( 'DBCRUD::' . $Self->{Name} . '::CacheTTL' ) || 60 * 60 * 8;

    $Self->{UserIDCheck} = 1;

    $Self->{AutoCreateMissingUUIDDatabaseTableColumns} = 1;

    # base function activation
    $Self->{FunctionDataAdd}           = 1;
    $Self->{FunctionDataUpdate}        = 1;
    $Self->{FunctionDataGet}           = 1;
    $Self->{FunctionDataListGet}       = 1;
    $Self->{FunctionDataDelete}        = 1;
    $Self->{FunctionDataSearch}        = 1;
    $Self->{FunctionDataExport}        = 0;
    $Self->{FunctionDataImport}        = 0;
    $Self->{HistoryFunctionDataUpdate} = 0;

    return 1;
}

=head2 GenerateAuthorizationCodeRequestURL()

    Generates the URL used to request an authorization code for a token.

    my $URL = $OAuth2TokenObject->GenerateAuthorizationCodeRequestURL(
        TokenConfigID => 3,
        UserID        => 1,
    );

=cut

sub GenerateAuthorizationCodeRequestURL {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my $AuthorizationCodeRequestConfig = $TokenConfig{Config}->{Requests}->{AuthorizationCode}->{Request};
    if ( !IsHashRefWithData($AuthorizationCodeRequestConfig) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Token config with ID $Param{TokenConfigID} does not contain config for authorization code request.",
        );
        return;
    }

    my $URL = $AuthorizationCodeRequestConfig->{URL};

    my %RequestData = $Self->_AssembleRequestData(
        TokenConfigID => $Param{TokenConfigID},
        RequestType   => 'AuthorizationCode',
        UserID        => $Param{UserID},
    );
    return $URL if !%RequestData;

    my @RequestData       = map { $_ . '=' . URI::Escape::uri_escape_utf8( $RequestData{$_} ) } sort keys %RequestData;
    my $RequestDataString = join '&', @RequestData;

    $URL .= '?' . $RequestDataString;

    return $URL;
}

=head2 GetAuthorizationCodeRequestRedirectURL()

    Returns the redirect URL for retrieving an authorization code.

    my $RedirectURL = $OAuth2TokenObject->GetAuthorizationCodeRequestRedirectURL();

=cut

sub GetAuthorizationCodeRequestRedirectURL {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $HttpType    = $ConfigObject->Get('HttpType');
    my $Hostname    = $ConfigObject->Get('FQDN');
    my $ScriptAlias = $ConfigObject->Get('ScriptAlias') // '';
    my $BaseURL     = "$HttpType://$Hostname/$ScriptAlias";

    my $RedirectURL = $BaseURL . 'get-oauth2-token-by-authorization-code.pl';

    return $RedirectURL;
}

=head2 GetAuthorizationCodeParameters()

    Retrieves authorization code parameters from web request parameters.

    my %AuthorizationCodeParameters = $OAuth2TokenObject->GetAuthorizationCodeParameters(
        ParamObject => $ParamObject,
        UserID      => 2,
    );

    Returns:

    my %AuthorizationCodeParameters = (
        TokenConfigID     => 7,
        AuthorizationCode => '...',
    );

=cut

sub GetAuthorizationCodeParameters {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( ParamObject UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $ParamObject = $Param{ParamObject};
    my @Params      = $ParamObject->GetParamNames();

    my $AuthorizationCodeResponseConfig;
    my $TokenConfigID;

    # Retrieve token ID from web request parameter that maps to 'State'.
    PARAM:
    for my $Param (@Params) {
        my $Value = $ParamObject->GetParam( Param => $Param );

        next PARAM if $Value !~ m{\ATokenConfigID(\d+)\z};
        my $TempTokenConfigID = $1;

        my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
            $OAuth2TokenConfigObject->{Identifier} => $TempTokenConfigID,
            UserID                                 => $Param{UserID},
        );
        next PARAM if !%TokenConfig;

        $AuthorizationCodeResponseConfig = $TokenConfig{Config}->{Requests}->{AuthorizationCode}->{Response};
        next PARAM if !IsHashRefWithData($AuthorizationCodeResponseConfig);
        next PARAM if !IsHashRefWithData( $AuthorizationCodeResponseConfig->{ParametersMapping} );

        # The param which contains the string TokenConfigID must be configured in the parameter mapping
        # of the response as 'State'.
        next PARAM if !exists $AuthorizationCodeResponseConfig->{ParametersMapping}->{$Param};
        next PARAM if $AuthorizationCodeResponseConfig->{ParametersMapping}->{$Param} ne 'State';

        $TokenConfigID = $TempTokenConfigID;

        last PARAM;
    }

    if ( !$TokenConfigID ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Token config ID could not be retrieved from response to authorization code request.',
        );
        return;
    }

    my %ResponseData = $Self->_AssembleResponseDataFromWebRequest(
        ParamObject   => $ParamObject,
        TokenConfigID => $TokenConfigID,
        RequestType   => 'AuthorizationCode',
        UserID        => $Param{UserID},
    );

    if ( !%ResponseData ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error retrieving response data for authorization code request for token config ID $TokenConfigID.",
        );
        return;
    }

    if ( !defined $ResponseData{AuthorizationCode} ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Response data for authorization code request for token config ID $TokenConfigID does not contain authorization code.",
        );
        return;
    }

    my %AuthorizationCodeParameters = (
        TokenConfigID     => $TokenConfigID,
        AuthorizationCode => $ResponseData{AuthorizationCode},
    );

    return %AuthorizationCodeParameters;
}

=head2 RequestTokenByAuthorizationCode()

    Requests a token by given authorization code.

    my %Token = $OAuth2TokenObject->RequestTokenByAuthorizationCode(
        TokenConfigID     => 7,
        AuthorizationCode => '...',
        UserID            => 2,
    );

    Returns a full OAuth2Token record, as DataGet() would.

    my %Token = (
        ID                         => 132,
        TokenConfigID              => 7,
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => 3500,
        RefreshToken               => '...',
        RefreshTokenExpirationDate => 3500,
        Error                      => '',
        ErrorDescription           => '',
        ErrorCode                  => 0,
        CreateTime                 => '2020-08-24 10:00:00',
        CreateBy                   => 2,
        ChangeTime                 => '2020-08-24 10:00:00',
        ChangeBy                   => 2,
    );

=cut

sub RequestTokenByAuthorizationCode {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID AuthorizationCode UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $RequestType = 'TokenByAuthorizationCode';

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    # Update/reset token record to reflect the current action of trying to retrieve a token by authorization code.
    my $TokenUpdated = $Self->DataUpdate(
        $Self->{Identifier} => $Token{ $Self->{Identifier} },
        AuthorizationCode   => $Param{AuthorizationCode},
        Error               => undef,
        ErrorDescription    => undef,
        ErrorCode           => undef,
        ChangeBy            => $Param{UserID},
        UserID              => $Param{UserID},

        # Issue #226:
        # Don't reset to undef because in case of an error the current token data should be kept.
        #         Token                      => undef,
        #         TokenExpirationDate        => undef,
        #         RefreshToken               => undef,
        #         RefreshTokenExpirationDate => undef,
    );
    if ( !$TokenUpdated ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error updating token for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my %RequestData = $Self->_AssembleRequestData(
        TokenConfigID => $Param{TokenConfigID},
        RequestType   => $RequestType,
        UserID        => $Param{UserID},
    );

    # Clear authorization code of the token record.
    $TokenUpdated = $Self->DataUpdate(
        $Self->{Identifier} => $Token{ $Self->{Identifier} },
        AuthorizationCode   => undef,
        ChangeBy            => $Param{UserID},
        UserID              => $Param{UserID},
    );
    if ( !$TokenUpdated ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error updating token for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my $WebUserAgentObject = Kernel::System::WebUserAgent->new();
    my %Response           = $WebUserAgentObject->Request(
        URL                          => $TokenConfig{Config}->{Requests}->{$RequestType}->{Request}->{URL},
        Type                         => 'POST',
        Data                         => \%RequestData,
        ReturnResponseContentOnError => 1,

        # SkipSSLVerification        => 1, # (optional)
        # NoLog                      => 1, # (optional)
    );
    if (
        !%Response
        || !defined $Response{Status}
        || !defined $Response{Content}
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error getting response for token request by authorization code for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    my %ResponseData = $Self->_AssembleResponseDataFromJSONString(
        JSONString    => ${ $Response{Content} },
        TokenConfigID => $Param{TokenConfigID},
        RequestType   => $RequestType,
        UserID        => $Param{UserID},
    );
    if ( !%ResponseData ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error assembling response data for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    $TokenUpdated = $Self->DataUpdate(
        $Self->{Identifier} => $Token{ $Self->{Identifier} },
        %ResponseData,
        ChangeBy => $Param{UserID},
        UserID   => $Param{UserID},
    );
    if ( !$TokenUpdated ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error updating token with response data for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my $TokenErrorMessage = $Self->GetTokenErrorMessage(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    ) // '';

    if ( $Response{Status} ne '200 OK' ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Response for request for token config with ID $Param{TokenConfigID} and request type '$RequestType' was not '200 OK'. $TokenErrorMessage",
        );
        return;
    }

    %Token = $Self->DataGet(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error fetching token for token config with ID $Param{TokenConfigID} after updating it with response data of request of type '$RequestType'. $TokenErrorMessage",
        );
        return;
    }

    return %Token;
}

=head2 RequestTokenByRefreshToken()

    Requests a token by refresh token. The refresh token is stored in the token record.

    my %Token = $OAuth2TokenObject->RequestTokenByRefreshToken(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns a full OAuth2Token record, as DataGet() would.

    my %Token = (
        ID                         => 132,
        TokenConfigID              => 7,
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => 3500,
        RefreshToken               => '...',
        RefreshTokenExpirationDate => 3500,
        Error                      => '',
        ErrorDescription           => '',
        ErrorCode                  => 0,
        CreateTime                 => '2020-08-24 10:00:00',
        CreateBy                   => 2,
        ChangeTime                 => '2020-08-24 10:00:00',
        ChangeBy                   => 2,
    );

=cut

sub RequestTokenByRefreshToken {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $RequestType = 'TokenByRefreshToken';

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    # Check if refresh token request is configured. Otherwise it cannot be obtained.
    if ( !IsHashRefWithData( $TokenConfig{Config}->{Requests}->{$RequestType} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Refresh token request is not configured in token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    my $RefreshTokenHasExpired = $Self->HasRefreshTokenExpired(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ($RefreshTokenHasExpired) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Refresh token of token record for token config with ID $Param{TokenConfigID} has expired (or is not present). A new token must be obtained by RequestTokenByAuthorizationCode().",
        );
        return;
    }

    my %RequestData = $Self->_AssembleRequestData(
        TokenConfigID => $Param{TokenConfigID},
        RequestType   => $RequestType,
        UserID        => $Param{UserID},
    );

    # Update/reset token record to reflect the current action of retrieving a token by refresh token.
    my $TokenUpdated = $Self->DataUpdate(
        $Self->{Identifier} => $Token{ $Self->{Identifier} },
        AuthorizationCode   => undef,
        Error               => undef,
        ErrorDescription    => undef,
        ErrorCode           => undef,
        ChangeBy            => $Param{UserID},
        UserID              => $Param{UserID},
    );
    if ( !$TokenUpdated ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error updating token for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my $WebUserAgentObject = Kernel::System::WebUserAgent->new();
    my %Response           = $WebUserAgentObject->Request(
        URL                          => $TokenConfig{Config}->{Requests}->{$RequestType}->{Request}->{URL},
        Type                         => 'POST',
        Data                         => \%RequestData,
        ReturnResponseContentOnError => 1,

        # SkipSSLVerification        => 1, # (optional)
        # NoLog                      => 1, # (optional)
    );

    if (
        !%Response
        || !defined $Response{Status}
        || !defined $Response{Content}
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error getting response for request for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my %ResponseData = $Self->_AssembleResponseDataFromJSONString(
        JSONString    => ${ $Response{Content} },
        TokenConfigID => $Param{TokenConfigID},
        RequestType   => $RequestType,
        UserID        => $Param{UserID},
    );
    if ( !%ResponseData ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error assembling response data for token config with ID $Param{TokenConfigID} and request of type '$RequestType'.",
        );
        return;
    }

    $TokenUpdated = $Self->DataUpdate(
        $Self->{Identifier} => $Token{ $Self->{Identifier} },
        %ResponseData,
        ChangeBy => $Param{UserID},
        UserID   => $Param{UserID},
    );
    if ( !$TokenUpdated ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error updating token with response data for token config with ID $Param{TokenConfigID} and request type '$RequestType'.",
        );
        return;
    }

    my $TokenErrorMessage = $Self->GetTokenErrorMessage(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    ) // '';

    if ( $Response{Status} ne '200 OK' ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Response for request for token config with ID $Param{TokenConfigID} and request type '$RequestType' was not '200 OK'. $TokenErrorMessage",
        );
        return;
    }

    %Token = $Self->DataGet(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Error fetching token for token config with ID $Param{TokenConfigID} after updating it with response data of request of type '$RequestType'. $TokenErrorMessage",
        );
        return;
    }

    return %Token;
}

=head2 HasTokenExpired()

    Checks if token has expired.

    my $HasExpired = $OAuth2TokenObject->HasTokenExpired(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns true value if token has expired.

=cut

sub HasTokenExpired {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    return 1 if !$Token{Token};
    return   if !defined $Token{TokenExpirationDate};

    my $CurrentDateTimeObject = $Kernel::OM->Create(
        'Kernel::System::DateTime',
    );

    my $ExpirationDateTimeObject = $Kernel::OM->Create(
        'Kernel::System::DateTime',
        ObjectParams => {
            String => $Token{TokenExpirationDate},
        },
    );

    return 1 if $CurrentDateTimeObject > $ExpirationDateTimeObject;

    return;
}

=head2 HasRefreshTokenExpired()

    Checks if refresh token has expired (or is not present).

    my $HasExpired = $OAuth2TokenObject->HasRefreshTokenExpired(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns true value if refresh token has expired or is not present.

=cut

sub HasRefreshTokenExpired {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    return 1 if !$Token{RefreshToken};
    return   if !defined $Token{RefreshTokenExpirationDate};

    my $CurrentDateTimeObject = $Kernel::OM->Create(
        'Kernel::System::DateTime',
    );

    my $ExpirationDateTimeObject = $Kernel::OM->Create(
        'Kernel::System::DateTime',
        ObjectParams => {
            String => $Token{RefreshTokenExpirationDate},
        },
    );

    return 1 if $CurrentDateTimeObject > $ExpirationDateTimeObject;

    return;
}

=head2 GetToken()

    Returns a valid token (not a token record), if possible.
    Automatically retrieves a new token by refresh token if token has expired.

    my $Token = $OAuth2TokenObject->GetToken(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns a token, if possible.

=cut

sub GetToken {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $HasTokenExpired = $Self->HasTokenExpired(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ($HasTokenExpired) {
        my $HasRefreshTokenExpired = $Self->HasRefreshTokenExpired(
            TokenConfigID => $Param{TokenConfigID},
            UserID        => $Param{UserID},
        );
        if ($HasRefreshTokenExpired) {
            $LogObject->Log(
                Priority => 'error',
                Message =>
                    "Refresh token for token config with ID $Param{TokenConfigID} has expired or is not present. Token must be retrieved manually via authorization code.",
            );
            return;
        }

        my %Token = $Self->RequestTokenByRefreshToken(
            TokenConfigID => $Param{TokenConfigID},
            UserID        => $Param{UserID},
        );
        if ( !%Token ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error requesting token by refresh token for token config with ID $Param{TokenConfigID}.",
            );
            return;
        }

        return $Token{Token};
    }

    my %Token = $Self->DataGet(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );

    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    return $Token{Token};
}

=head2 GetTokenErrorMessage()

    Assembles the error message of a token, if any.

    my $TokenErrorMessage = $OAuth2TokenObject->GetTokenErrorMessage(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns string with error message, if any.

=cut

sub GetTokenErrorMessage {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    my $ErrorMessage;

    if ( defined $Token{ErrorMessage} && length $Token{ErrorMessage} ) {
        $ErrorMessage .= $Token{ErrorMessage};
    }

    if ( defined $Token{ErrorCode} && length $Token{ErrorCode} ) {
        if ( defined $ErrorMessage && length $ErrorMessage ) {
            $ErrorMessage .= " (error code $Token{ErrorCode})";
        }
        else {
            $ErrorMessage .= "Error code $Token{ErrorCode}";
        }
    }

    if ( defined $Token{ErrorDescription} && length $Token{ErrorDescription} ) {
        if ( defined $ErrorMessage && length $ErrorMessage ) {
            $ErrorMessage .= ': ';
        }
        $ErrorMessage .= $Token{ErrorDescription};
    }

    return $ErrorMessage;
}

=head2 AssembleSASLAuthString()

    Assembles an SASL authentication string used to authenticate with an OAuth2 token.
    Used  e.g. for IMAP, POP3 and SMTP.

    See here:
    https://docs.microsoft.com/en-us/exchange/client-developer/legacy-protocols/how-to-authenticate-an-imap-pop-smtp-application-by-using-oauth#sasl-xoauth2
    https://developers.google.com/gmail/imap/xoauth2-protocol#the_sasl_xoauth2_mechanism

    my $SASLAuthString = $OAuth2TokenObject->AssembleSASLAuthString(
        Username    => 'user2',
        OAuth2Token => 'the token',
    );

    Returns base64 encoded authentication string for SASL.

=cut

sub AssembleSASLAuthString {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw( Username OAuth2Token )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $SASLAuthString
        = encode_base64( "user=" . $Param{Username} . "\x01auth=Bearer " . $Param{OAuth2Token} . "\x01\x01", '' );

    return $SASLAuthString;
}

#
# Internal
#

=head2 _GetOrCreateIfNotExists()

    Initializes empty token record if it does not exist yet for the given token config ID.
    Returns complete data of newly created token or of the one that already exists.

    my %Token = $OAuth2TokenObject->_GetOrCreateIfNotExists(
        TokenConfigID => 7,
        UserID        => 2,
    );

    Returns a full OAuth2Token record, as DataGet() would.

    my %Token = (
        ID                         => 132,
        TokenConfigID              => 7,
        AuthorizationCode          => '...',
        Token                      => '...',
        TokenExpirationDate        => 0,
        RefreshToken               => '...',
        RefreshTokenExpirationDate => 0,
        Error                      => '',
        ErrorDescription           => '',
        ErrorCode                  => 0,
        CreateTime                 => '2020-08-24 10:00:00',
        CreateBy                   => 2,
        ChangeTime                 => '2020-08-24 10:00:00',
        ChangeBy                   => 2,
    );

=cut

sub _GetOrCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->DataGet(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    return %Token if %Token;

    my $TokenID = $Self->DataAdd(
        TokenConfigID => $Param{TokenConfigID},
        CreateBy      => $Param{UserID},
        ChangeBy      => $Param{UserID},
        UserID        => $Param{UserID},
    );
    if ( !$TokenID ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error creating token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    %Token = $Self->DataGet(
        $Self->{Identifier} => $TokenID,
        UserID              => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token with ID $TokenID.",
        );
        return;
    }

    return %Token;
}

=head2 _AssembleRequestData()

    Assembles request data for given request type of given token config.

    my %RequestData = $OAuth2TokenObject->_AssembleRequestData(
        TokenConfigID => 7,
        RequestType   => 'TokenByAuthorizationCode', # or any types returned by _GetRequestTypes()
        UserID        => 2,
    );

    Returns hash ref with data for request:

    my %RequestData = (
        client_id          => '...',
        client_secret      => '...',
        authorization_code => '...',
        # ...
    );

=cut

sub _AssembleRequestData {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( TokenConfigID RequestType UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %RequestTypes = $Self->_GetRequestTypes();
    if ( !$RequestTypes{ $Param{RequestType} } ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Unknown request type '$Param{RequestType}'.",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my %Token = $Self->_GetOrCreateIfNotExists(
        TokenConfigID => $Param{TokenConfigID},
        UserID        => $Param{UserID},
    );
    if ( !%Token ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error fetching token for token config with ID $Param{TokenConfigID}.",
        );
        return;
    }

    my $RequestConfig = $TokenConfig{Config}->{Requests}->{ $Param{RequestType} }->{Request};
    if ( !IsHashRefWithData($RequestConfig) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Token config with ID $Param{TokenConfigID} does not contain request config for request type '$Param{RequestType}'.",
        );
        return;
    }

    my $RequestData = $RequestConfig->{Parameters} // {};
    my %RequestData = %{$RequestData};

    return %RequestData if !IsHashRefWithData( $RequestConfig->{AutofilledParametersMapping} );

    PARAMETER:
    for my $Parameter ( sort keys %{ $RequestConfig->{AutofilledParametersMapping} } ) {
        my $Key = $RequestConfig->{AutofilledParametersMapping}->{$Parameter};
        next PARAMETER if !defined $Key;

        my $Value;

        if ( defined $TokenConfig{Config}->{$Key} ) {
            $Value = $TokenConfig{Config}->{$Key};
        }
        elsif ( defined $Token{$Key} ) {
            $Value = $Token{$Key};
        }
        elsif ( $Key eq 'State' ) {
            $Value = "TokenConfigID$Param{TokenConfigID}";
        }
        elsif ( $Key eq 'RedirectURL' ) {
            $Value = $Self->GetAuthorizationCodeRequestRedirectURL();
        }

        $Value //= '';

        $RequestData{$Parameter} = $Value;
    }

    return %RequestData;
}

=head2 _AssembleResponseDataFromWebRequest()

    Assembles response data from web request for given request type of given token config.

    my %ResponseData = $OAuth2TokenObject->_AssembleResponseDataFromWebRequest(
        ParamObject   => $ParamObject,
        TokenConfigID => 7,
        RequestType   => 'TokenByAuthorizationCode', # or any types returned by _GetRequestTypes()
        UserID        => 2,
    );

    Returns hash ref with data of response:

    my %ResponseData = (
        Token               => '...',
        TokenExpirationDate => '...',
        ErrorMessage        => '...',
        # ...
    );

=cut

sub _AssembleResponseDataFromWebRequest {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( ParamObject TokenConfigID RequestType UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %RequestTypes = $Self->_GetRequestTypes();
    if ( !$RequestTypes{ $Param{RequestType} } ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Unknown request type '$Param{RequestType}'.",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my $ResponseConfig = $TokenConfig{Config}->{Requests}->{ $Param{RequestType} }->{Response};
    if ( !IsHashRefWithData($ResponseConfig) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Token config with ID $Param{TokenConfigID} does not contain response config for request type '$Param{RequestType}'.",
        );
        return;
    }

    my $ParamObject = $Param{ParamObject};

    my %ResponseData;
    return %ResponseData if !IsHashRefWithData( $ResponseConfig->{ParametersMapping} );

    PARAMETER:
    for my $Parameter ( sort keys %{ $ResponseConfig->{ParametersMapping} } ) {
        my $Key = $ResponseConfig->{ParametersMapping}->{$Parameter};
        next PARAMETER if !defined $Key;

        $ResponseData{$Key} = $ParamObject->GetParam( Param => $Parameter );

        # Turn TTL into expiration date.
        if ( $Key =~ m{\A(Refresh)?TokenExpirationDate\z} ) {
            my $ExpirationDateTimeObject = $Self->_CreateExpirationDateTimeObject(
                TTL => $ResponseData{$Key} // 0,
            );

            $ResponseData{$Key} = $ExpirationDateTimeObject->ToString();
        }
    }

    return %ResponseData;
}

=head2 _AssembleResponseDataFromJSONString()

    Assembles response data from JSON string for given request type of given token config.

    my %ResponseData = $OAuth2TokenObject->_AssembleResponseDataFromJSONString(
        JSONString    => '...',
        TokenConfigID => 7,
        RequestType   => 'TokenByAuthorizationCode', # or any types returned by _GetRequestTypes()
        UserID        => 2,
    );

    Returns hash ref with data of response:

    my %ResponseData = (
        Token               => '...',
        TokenExpirationDate => '...',
        ErrorMessage        => '...',
        # ...
    );

=cut

sub _AssembleResponseDataFromJSONString {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $JSONObject              = $Kernel::OM->Get('Kernel::System::JSON');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    NEEDED:
    for my $Needed (qw( JSONString TokenConfigID RequestType UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %RequestTypes = $Self->_GetRequestTypes();
    if ( !$RequestTypes{ $Param{RequestType} } ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Unknown request type '$Param{RequestType}'.",
        );
        return;
    }

    my %TokenConfig = $OAuth2TokenConfigObject->DataGet(
        $OAuth2TokenConfigObject->{Identifier} => $Param{TokenConfigID},
        UserID                                 => $Param{UserID},
    );
    if ( !%TokenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Token config with ID $Param{TokenConfigID} not found.",
        );
        return;
    }

    my $ResponseConfig = $TokenConfig{Config}->{Requests}->{ $Param{RequestType} }->{Response};
    if ( !IsHashRefWithData($ResponseConfig) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Token config with ID $Param{TokenConfigID} does not contain response config for request type '$Param{RequestType}'.",
        );
        return;
    }

    my %ResponseData;
    return %ResponseData if !IsHashRefWithData( $ResponseConfig->{ParametersMapping} );

    my $JSONData = $JSONObject->Decode(
        Data => $Param{JSONString},
    );
    if ( !IsHashRefWithData($JSONData) ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Received JSON data is not a hash for token config with ID $Param{TokenConfigID} and response of request of type '$Param{RequestType}'.",
        );
        return;
    }

    PARAMETER:
    for my $Parameter ( sort keys %{ $ResponseConfig->{ParametersMapping} } ) {
        my $Key = $ResponseConfig->{ParametersMapping}->{$Parameter};
        next PARAMETER if !defined $Key;

        # Issue #226:
        # Don't set missing values to undef.
        # Ignore them instead so that existing token values will not get lost.
        next PARAMETER if !exists $JSONData->{$Parameter};

        # Turn arrays and hashes into strings.
        if ( ref $JSONData->{$Parameter} eq 'ARRAY' ) {
            $JSONData->{$Parameter} = join ', ', @{ $JSONData->{$Parameter} };
        }
        elsif ( ref $JSONData->{$Parameter} eq 'HASH' ) {
            $JSONData->{$Parameter} = $JSONObject->Encode(
                Data => $JSONData->{$Parameter},
            );
        }

        $ResponseData{$Key} = $JSONData->{$Parameter};

        # Turn TTL into expiration date.
        if ( $Key =~ m{\A(Refresh)?TokenExpirationDate\z} ) {
            my $ExpirationDateTimeObject = $Self->_CreateExpirationDateTimeObject(
                TTL => $ResponseData{$Key} // 0,
            );

            $ResponseData{$Key} = $ExpirationDateTimeObject->ToString();
        }
    }

    return %ResponseData;
}

=head2 _GetRequestTypes()

    Returns the available request types.

    my %RequestTypes = $OAuth2TokenObject->_GetRequestTypes();

    Returns:

    my %RequestTypes = (
        # request type => 1
        # ...
    );

=cut

sub _GetRequestTypes {
    my ( $Self, %Param ) = @_;

    my %RequestTypes = (
        AuthorizationCode        => 1,
        TokenByAuthorizationCode => 1,
        TokenByRefreshToken      => 1,
    );

    return %RequestTypes;
}

=head2 _CreateExpirationDateTimeObject()

    Creates an expiration DateTime object for a TTL (time to live).

    my $DateTimeObject = $OAuth2TokenObject->_CreateExpirationDateTimeObject(
        StartDateTimeObject => $StartDateTimeObject,    # optional, offset for TTL. Current date/time will be used if omitted.
        TTL                 => 3600,                    # seconds (>= 0)
    );

    Returns DateTime object.

=cut

sub _CreateExpirationDateTimeObject {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw( TTL )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( $Param{TTL} !~ m{\A\d+\z} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Parameter TTL must be an integer.',
        );
        return;
    }

    my $StartDateTimeObject = $Param{StartDateTimeObject};
    if ( !$StartDateTimeObject ) {
        $StartDateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
        );
    }

    my $ExpirationDateTimeObject = $StartDateTimeObject->Clone();
    $ExpirationDateTimeObject->Add(
        Seconds => $Param{TTL},
    );

    return $ExpirationDateTimeObject;
}

1;
