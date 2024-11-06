# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::GenericInterface::Transport::HTTP::REST;

use strict;
use warnings;

use HTTP::Status;
use MIME::Base64;
use REST::Client;
use URI::Escape;
use LWP::UserAgent;
use XML::Simple;
use Kernel::Config;

use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Transport::HTTP::REST - GenericInterface network transport interface for HTTP::REST

=head1 PUBLIC INTERFACE

=head2 new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Transport->new();

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {};
    bless( $Self, $Type );

    for my $Needed (qw(DebuggerObject TransportConfig)) {
        $Self->{$Needed} = $Param{$Needed} || die "Got no $Needed!";
    }

    return $Self;
}

=head2 ProviderProcessRequest()

Process an incoming web service request. This function has to read the request data
from from the web server process.

Based on the request the Operation to be used is determined.

No out-bound communication is done here, except from continue requests.

In case of an error, the resulting http error code and message are remembered for the response.

    my $Result = $TransportObject->ProviderProcessRequest();

    $Result = {
        Success      => 1,                  # 0 or 1
        ErrorMessage => '',                 # in case of error
        Operation    => 'DesiredOperation', # name of the operation to perform
        Data         => {                   # data payload of request
            ...
        },
    };

=cut

sub ProviderProcessRequest {
    my ( $Self, %Param ) = @_;

    my $JSONObject  = $Kernel::OM->Get('Kernel::System::JSON');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # Check transport config.
    if ( !IsHashRefWithData( $Self->{TransportConfig} ) ) {
        return $Self->_Error(
            Summary   => 'REST Transport: Have no TransportConfig',
            HTTPError => 500,
        );
    }
    if ( !IsHashRefWithData( $Self->{TransportConfig}->{Config} ) ) {
        return $Self->_Error(
            Summary   => 'Rest Transport: Have no Config',
            HTTPError => 500,
        );
    }
    my $Config = $Self->{TransportConfig}->{Config};
    $Self->{KeepAlive} = $Config->{KeepAlive} || 0;

    if ( !IsHashRefWithData( $Config->{RouteOperationMapping} ) ) {
        return $Self->_Error(
            Summary   => "HTTP::REST Can't find RouteOperationMapping in Config",
            HTTPError => 500,
        );
    }

    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    my $Operation;
    my %URIData;
    my $RequestURI = $ENV{REQUEST_URI} || $ENV{PATH_INFO};
    $RequestURI =~ s{.*Webservice(?:ID)?\/[^\/]+(\/.*)$}{$1}xms;

    # Remove any query parameter from the URL
    #   e.g. from /Ticket/1/2?UserLogin=user&Password=secret
    #   to /Ticket/1/2?.
    $RequestURI =~ s{([^?]+)(.+)?}{$1};

    # Remember the query parameters e.g. ?UserLogin=user&Password=secret.
    my $QueryParamsStr = $2 || '';
    my %QueryParams;

    if ($QueryParamsStr) {

        # Remove question mark '?' in the beginning.
        substr $QueryParamsStr, 0, 1, '';

        # Convert query parameters into a hash
        #   e.g. from UserLogin=user&Password=secret
        #   to (
        #        UserLogin => 'user',
        #        Password  => 'secret',
        #      );
        for my $QueryParam ( split /[;&]/, $QueryParamsStr ) {
            my ( $Key, $Value ) = split '=', $QueryParam;

            # Convert + characters to its encoded representation, see bug#11917.
            $Value =~ s{\+}{%20}g;

            # Unescape URI strings in query parameters.
            $Key   = URI::Escape::uri_unescape($Key);
            $Value = URI::Escape::uri_unescape($Value);

            # Encode variables.
            $EncodeObject->EncodeInput( \$Key );
            $EncodeObject->EncodeInput( \$Value );

            if ( !defined $QueryParams{$Key} ) {
                $QueryParams{$Key} = $Value || '';
            }

            # Elements specified multiple times will be added as array reference.
            elsif ( ref $QueryParams{$Key} eq '' ) {
                $QueryParams{$Key} = [ $QueryParams{$Key}, $Value ];
            }
            else {
                push @{ $QueryParams{$Key} }, $Value;
            }
        }
    }

    my $ParserBackend;
    my %ParserBackendParameter;

    my $RequestMethod = $ENV{'REQUEST_METHOD'} || 'GET';
    ROUTE:
    for my $CurrentOperation ( sort keys %{ $Config->{RouteOperationMapping} } ) {

        next ROUTE if !IsHashRefWithData( $Config->{RouteOperationMapping}->{$CurrentOperation} );

        my %RouteMapping = %{ $Config->{RouteOperationMapping}->{$CurrentOperation} };

        if ( IsArrayRefWithData( $RouteMapping{RequestMethod} ) ) {
            next ROUTE if !grep { $RequestMethod eq $_ } @{ $RouteMapping{RequestMethod} };
        }

        # Convert the configured route with the help of extended regexp patterns
        #   to a regexp. This generated regexp is used to:
        #   1.) Determine the Operation for the request
        #   2.) Extract additional parameters from the RequestURI
        #   For further information: http://perldoc.perl.org/perlre.html#Extended-Patterns
        #
        #   For example, from the RequestURI: /Ticket/1/2
        #       and the route setting:        /Ticket/:TicketID/:Other
        #       %URIData will then contain:
        #       (
        #           TicketID => 1,
        #           Other    => 2,
        #       );
        my $RouteRegEx = $RouteMapping{Route};
        $RouteRegEx =~ s{:([^\/]+)}{(?<$1>[^\/]+)}xmsg;

        next ROUTE if !( $RequestURI =~ m{^ $RouteRegEx $}xms );

        # Import URI params.
        for my $URIKey ( sort keys %+ ) {
            my $URIValue = $+{$URIKey};

            # Unescape value
            $URIValue = URI::Escape::uri_unescape($URIValue);

            # Encode value.
            $EncodeObject->EncodeInput( \$URIValue );

            # Add to URI data.
            $URIData{$URIKey} = $URIValue;
        }

        $ParserBackend = $RouteMapping{ParserBackend} || 'JSON';

        if ( IsHashRefWithData( $RouteMapping{ParserBackendParameter} ) ) {
            %ParserBackendParameter = %{ $RouteMapping{ParserBackendParameter} };
        }

        $Operation = $CurrentOperation;

        # Leave with the first matching regexp.
        last ROUTE;
    }

    # Combine query params with URIData params, URIData has more precedence.
    if (%QueryParams) {
        %URIData = ( %QueryParams, %URIData, );
    }

    my %DataHeaderOverwrite = (
        HTTP_X_OTRS_HEADER_USERLOGIN         => 'UserLogin',
        HTTP_X_OTRS_HEADER_CUSTOMERUSERLOGIN => 'CustomerUserLogin',
        HTTP_X_OTRS_HEADER_SESSIONID         => 'SessionID',
        HTTP_X_OTRS_HEADER_PASSWORD          => 'Password',
        HTTP_X_OTRS_HEADER_IMPERSONATEASUSER => 'ImpersonateAsUser',
        HTTP_X_OTRS_HEADER_TWOFACTORTOKEN    => 'TwoFactorToken',
    );

    HEADER:
    for my $Header ( sort keys %DataHeaderOverwrite ) {
        next HEADER if !IsStringWithData( $ENV{$Header} );

        $URIData{ $DataHeaderOverwrite{$Header} } = $ENV{$Header};
    }

    if ( !$Operation ) {
        return $Self->_Error(
            Summary   => "HTTP::REST Error while determine Operation for request URI '$RequestURI'.",
            HTTPError => 500,
        );
    }

    my $Length = $ENV{'CONTENT_LENGTH'};

    # No length provided, return the information we have.
    # Also return for 'GET' method because it does not allow sending an entity-body in requests.
    # For more information, see https://bugs.otrs.org/show_bug.cgi?id=14203.
    if ( !$Length || $RequestMethod eq 'GET' ) {
        return {
            Success   => 1,
            Operation => $Operation,
            Data      => {
                %URIData,
                RequestMethod => $RequestMethod,
            },
        };
    }

    # Request bigger than allowed.
    if ( IsInteger( $Config->{MaxLength} ) && $Length > $Config->{MaxLength} ) {
        return $Self->_Error(
            Summary   => HTTP::Status::status_message(413),
            HTTPError => 413,
        );
    }

    # try to read request from special CGI parameters
    # those are filled:
    # 'If POSTed data is not of type application/x-www-form-urlencoded or multipart/form-data'
    # https://metacpan.org/pod/CGI#Handling-non-urlencoded-arguments
    my $Content = $ParamObject->GetParam( Param => 'POSTDATA' )
        // $ParamObject->GetParam( Param => 'PUTDATA' )
        // $ParamObject->GetParam( Param => 'PATCHDATA' );

    # if no content is given yet, maybe there were some
    # 'application/x-www-form-urlencoded or multipart/form-data'
    # submitted...
    if ( !IsStringWithData($Content) ) {

        # get possible POST parameter name from config
        # otherwise fall back on 'file'
        my %UploadInfo = $Kernel::OM->Get('Kernel::System::Web::Request')->GetUploadAll(
            Param => $Config->{PostParamName} || 'file',
        );

        # if the parameter indeed has some content with it
        # pass it to $Content so we can work with it later
        if ( IsStringWithData( $UploadInfo{Content} ) ) {
            $Content = $UploadInfo{Content};
        }
    }

    # fallback to otrs standard
    if ( !$Content ) {
        read STDIN, $Content, $Length;
    }

    # If there is no STDIN data it might be caused by fastcgi already having read the request.
    # In this case we need to get the data from CGI.
    if ( !IsStringWithData($Content) && $RequestMethod ne 'GET' ) {
        my $ParamName = $RequestMethod . 'DATA';
        $Content = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam(
            Param => $ParamName,
        );
    }

    # Check if we have content.
    if ( !IsStringWithData($Content) ) {
        return $Self->_Error(
            Summary   => 'Could not read input data',
            HTTPError => 500,
        );
    }

    # remove utf-8 BOMs:
    # http://www.ueber.net/who/mjl/projects/bomstrip/
    $Content =~ s{\xef\xbb\xbf}{}g;

    # Convert char-set if necessary.
    my $ContentCharset;
    if ( $ENV{'CONTENT_TYPE'} =~ m{ \A .* charset\s*=\s* ["']? ( [^"']+ ) ["']? \z }xmsi ) {
        $ContentCharset = $1;
    }
    if ( $ContentCharset && $ContentCharset !~ m{ \A utf [-]? 8 \z }xmsi ) {
        $Content = $EncodeObject->Convert2CharsetInternal(
            Text => $Content,
            From => $ContentCharset,
        );
    }
    else {
        $EncodeObject->EncodeInput( \$Content );
    }

    # Send received data to debugger.
    $Self->{DebuggerObject}->Debug(
        Summary => 'Received data by provider from remote system',
        Data    => $Content,
    );

    my $ContentDecoded;
    if ( $ParserBackend eq 'JSON' ) {
        $ContentDecoded = $JSONObject->Decode(
            %ParserBackendParameter,
            Data => $Content,
        );
    }
    else {
        return $Self->_Error(
            Summary   => "Invalid parser backend '$ParserBackend' configured for Operation '$Operation'.",
            HTTPError => 500,
        );
    }

    if ( !$ContentDecoded ) {
        return $Self->_Error(
            Summary   => 'Error while decoding request content.',
            HTTPError => 500,
        );
    }

    my $ReturnData;
    if ( IsHashRefWithData($ContentDecoded) ) {

        $ReturnData = $ContentDecoded;
        @{$ReturnData}{ keys %URIData } = values %URIData;
    }
    elsif ( IsArrayRefWithData($ContentDecoded) ) {

        ELEMENT:
        for my $CurrentElement ( @{$ContentDecoded} ) {

            if ( IsHashRefWithData($CurrentElement) ) {
                @{$CurrentElement}{ keys %URIData } = values %URIData;
            }

            push @{$ReturnData}, $CurrentElement;
        }
    }
    else {
        return $Self->_Error(
            Summary   => 'Unsupported request content structure.',
            HTTPError => 500,
        );
    }

    # All OK - return data
    return {
        Success   => 1,
        Operation => $Operation,
        Data      => $ReturnData,
    };
}

=head2 ProviderGenerateResponse()

Generates response for an incoming web service request.

In case of an error, error code and message are taken from environment
(previously set on request processing).

The HTTP code is set accordingly
- C<200> for (syntactically) correct messages
- C<4xx> for http errors
- C<500> for content syntax errors

    my $Result = $TransportObject->ProviderGenerateResponse(
        Success => 1,
        Data    => { # data payload for response, optional
            ...
        },
    );

    $Result = {
        Success      => 1,   # 0 or 1
        ErrorMessage => '',  # in case of error
    };

=cut

sub ProviderGenerateResponse {
    my ( $Self, %Param ) = @_;

    # Do we have a http error message to return.
    if ( IsStringWithData( $Self->{HTTPError} ) && IsStringWithData( $Self->{HTTPMessage} ) ) {
        return $Self->_Output(
            HTTPCode => $Self->{HTTPError},
            Content  => $Self->{HTTPMessage},
        );
    }

    # Check success param.
    my $HTTPCode = $Param{HTTPCode} // 200;

    if ( !$Param{Success} ) {

        # Create Fault structure.
        my $FaultString = $Param{ErrorMessage} || 'Unknown';
        $Param{Data} = {
            faultcode   => 'Server',
            faultstring => $FaultString,
        };

        # overide HTTPCode to 500 if no custom HTTP code was provided
        $HTTPCode = 500 if !$Param{HTTPCode};
    }

    my %AdditionalResponseHeaders;
    if ( exists $Param{Data}->{AdditionalResponseHeaders} ) {
        if ( IsHashRefWithData( $Param{Data}->{AdditionalResponseHeaders} ) ) {
            %AdditionalResponseHeaders = %{ $Param{Data}->{AdditionalResponseHeaders} };
        }

        delete $Param{Data}->{AdditionalResponseHeaders};
    }

    # Prepare data.
    my $JSONString = $Kernel::OM->Get('Kernel::System::JSON')->Encode(
        Data     => $Param{Data},
        SortKeys => 1,
    );

    if ( !$JSONString ) {
        return $Self->_Output(
            HTTPCode => 500,
            Content  => 'Error while encoding return JSON structure.',
        );
    }

    # No error - return output.
    return $Self->_Output(
        HTTPCode                  => $HTTPCode,
        Content                   => $JSONString,
        AdditionalResponseHeaders => \%AdditionalResponseHeaders,
    );
}

=head2 RequesterPerformRequest()

Prepare data payload as XML structure, generate an outgoing web service request,
receive the response and return its data.

    my $Result = $TransportObject->RequesterPerformRequest(
        Operation => 'remote_op', # name of remote operation to perform
        Data      => {            # data payload for request
            ...
        },
    );

    $Result = {
        Success      => 1,        # 0 or 1
        ErrorMessage => '',       # in case of error
        Data         => {
            ...
        },
    };

=cut

sub RequesterPerformRequest {
    my ( $Self, %Param ) = @_;

    my $EncodeObject      = $Kernel::OM->Get('Kernel::System::Encode');
    my $JSONObject        = $Kernel::OM->Get('Kernel::System::JSON');
    my $OAuth2TokenObject = $Kernel::OM->Get('Kernel::System::OAuth2Token');

    # Check transport config.
    if ( !IsHashRefWithData( $Self->{TransportConfig} ) ) {
        return {
            Success      => 0,
            ErrorMessage => 'REST Transport: Have no TransportConfig',
        };
    }
    if ( !IsHashRefWithData( $Self->{TransportConfig}->{Config} ) ) {
        return {
            Success      => 0,
            ErrorMessage => 'REST Transport: Have no Config',
        };
    }
    my $Config = $Self->{TransportConfig}->{Config};

    NEEDED:
    for my $Needed (qw(Host DefaultCommand Timeout)) {
        next NEEDED if IsStringWithData( $Config->{$Needed} );

        return {
            Success      => 0,
            ErrorMessage => "REST Transport: Have no $Needed in config",
        };
    }

    # Check data param.
    if ( defined $Param{Data} && ref $Param{Data} ne 'HASH' ) {
        return {
            Success      => 0,
            ErrorMessage => 'REST Transport: Invalid Data',
        };
    }

    # Check operation param.
    if ( !IsStringWithData( $Param{Operation} ) ) {
        return {
            Success      => 0,
            ErrorMessage => 'REST Transport: Need Operation',
        };
    }

    # Create header container and add proper content type
    my $Headers = { 'Content-Type' => 'application/json; charset=UTF-8' };

    # set up a REST session
    my $RestClient = $Kernel::OM->{Objects}->{ $Config->{Host} };

    if (
        !$Config->{ReuseClient}
        || !$RestClient
        )
    {
        # fill default parameter
        my %RESTClientParameter = (
            host    => $Config->{Host},
            timeout => $Config->{Timeout},
        );

        # if configured we have to skip hostname verification
        # on ssl connections for e.g. self signed certs
        if ( $Config->{SSLNoHostnameVerification} ) {

            # therefore we have to use our own LWP::UserAgent object
            # with disabled 'verify_hostname' SSL option
            $RESTClientParameter{useragent} = LWP::UserAgent->new(
                keep_alive => $Config->{KeepAlive},
                ssl_opts   => {
                    verify_hostname => 0,
                    SSL_verify_mode => 0,
                },
            );
        }

        # create a REST::Client object we can perform our session with
        $RestClient = REST::Client->new( \%RESTClientParameter );

        if ( !$RestClient ) {
            my $ErrorMessage = "Error while creating REST client from 'REST::Client'.";

            # log to debugger
            $Self->{DebuggerObject}->Error(
                Summary => $ErrorMessage,
            );
            return {
                Success      => 0,
                ErrorMessage => $ErrorMessage,
            };
        }

        # add X509 options if configured
        if ( IsHashRefWithData( $Config->{X509} ) ) {

            # use X509 options
            if (
                IsStringWithData( $Config->{X509}->{UseX509} )
                && $Config->{X509}->{UseX509} eq 'Yes'
                )
            {
                #X509 client authentication
                $RestClient->setCert( $Config->{X509}->{X509CertFile} );
                $RestClient->setKey( $Config->{X509}->{X509KeyFile} );

                #add a CA to verify server certificates
                if ( IsStringWithData( $Config->{X509}->{X509CAFile} ) ) {
                    $RestClient->setCa( $Config->{X509}->{X509CAFile} );
                }
            }
        }

        if ( $Config->{ReuseClient} ) {
            $Kernel::OM->{Objects}->{ $Config->{Host} } = $RestClient;
        }
    }

    if ( !$RestClient ) {

        my $ErrorMessage = "Error while creating REST client from 'REST::Client'.";

        # Log to debugger.
        $Self->{DebuggerObject}->Error(
            Summary => $ErrorMessage,
        );
        return {
            Success      => 0,
            ErrorMessage => $ErrorMessage,
        };
    }

    # Add SSL options if configured.
    my %SSLOptions;
    if (
        IsHashRefWithData( $Config->{SSL} )
        && IsStringWithData( $Config->{SSL}->{UseSSL} )
        && $Config->{SSL}->{UseSSL} eq 'Yes'
        )
    {
        my %SSLOptionsMap = (
            SSLCertificate => 'SSL_cert_file',
            SSLKey         => 'SSL_key_file',
            SSLPassword    => 'SSL_passwd_cb',
            SSLCAFile      => 'SSL_ca_file',
            SSLCADir       => 'SSL_ca_path',
        );
        SSLOPTION:
        for my $SSLOption ( sort keys %SSLOptionsMap ) {
            next SSLOPTION if !IsStringWithData( $Config->{SSL}->{$SSLOption} );

            if ( $SSLOption ne 'SSLPassword' ) {
                $RestClient->getUseragent()->ssl_opts(
                    $SSLOptionsMap{$SSLOption} => $Config->{SSL}->{$SSLOption},
                );
                next SSLOPTION;
            }

            # Passwords needs a special treatment.
            $RestClient->getUseragent()->ssl_opts(
                $SSLOptionsMap{$SSLOption} => sub { $Config->{SSL}->{$SSLOption} },
            );
        }
    }

    # Add proxy options if configured.
    if (
        IsHashRefWithData( $Config->{Proxy} )
        && IsStringWithData( $Config->{Proxy}->{UseProxy} )
        && $Config->{Proxy}->{UseProxy} eq 'Yes'
        )
    {

        # Explicitly use no proxy (even if configured system wide).
        if (
            IsStringWithData( $Config->{Proxy}->{ProxyExclude} )
            && $Config->{Proxy}->{ProxyExclude} eq 'Yes'
            )
        {
            $RestClient->getUseragent()->no_proxy();
        }

        # Use proxy.
        elsif ( IsStringWithData( $Config->{Proxy}->{ProxyHost} ) ) {

            # Set host.
            $RestClient->getUseragent()->proxy(
                [ 'http', 'https', ],
                $Config->{Proxy}->{ProxyHost},
            );

            # Add proxy authentication.
            if (
                IsStringWithData( $Config->{Proxy}->{ProxyUser} )
                && IsStringWithData( $Config->{Proxy}->{ProxyPassword} )
                )
            {
                $Headers->{'Proxy-Authorization'} = 'Basic ' . encode_base64(
                    $Config->{Proxy}->{ProxyUser} . ':' . $Config->{Proxy}->{ProxyPassword},
                    '',
                );
            }
        }
    }

    #
    # JWT support
    #
    my $JWTObject             = $Kernel::OM->Get('Kernel::System::JSONWebToken');
    my $X509CertificateObject = $Kernel::OM->Get('Kernel::System::X509Certificate');

    my $JWTObjectIsSupported             = $JWTObject->IsSupported();
    my $X509CertificateObjectIsSupported = $X509CertificateObject->IsSupported();

    my $JWT;

    if (
        $JWTObjectIsSupported
        && IsHashRefWithData( $Config->{Authentication} )
        && IsStringWithData( $Config->{Authentication}->{AuthType} )
        && $Config->{Authentication}->{AuthType} eq 'JWT'
        )
    {
        my %JWTPlaceholderData;

        # Fetch data from X.509 certificate, if configured and supported
        # to be able to insert it into configured placeholders of payload and additional header data
        # of the JWT.
        if (
            $X509CertificateObjectIsSupported
            && $Config->{Authentication}->{JWTAuthCertificateFilePath}
            )
        {
            my $X509Certificate = $X509CertificateObject->Parse(
                FilePath => $Config->{Authentication}->{JWTAuthCertificateFilePath},
            ) // {};

            for my $X509CertificateKey ( sort keys %{$X509Certificate} ) {
                my $X509CertificateValue = $X509Certificate->{$X509CertificateKey} // '';
                $JWTPlaceholderData{ 'OTRS_JWT_Cert' . $X509CertificateKey } = $X509CertificateValue;
            }
        }

        # Calculate expiration date and insert it into placeholders of payload and additional header data
        # of the JWT.
        my $TTL            = int( $Config->{Authentication}->{JWTAuthTTL} );
        my $DateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                TimeZone => 'UTC',
            }
        );
        $DateTimeObject->Add( Seconds => $TTL );
        $JWTPlaceholderData{OTRS_JWT_ExpirationDateTimestamp} = $DateTimeObject->ToEpoch();
        $JWTPlaceholderData{OTRS_JWT_ExpirationDateString}    = $DateTimeObject->Format(
            Format => '%Y-%m-%dT%H:%M:%S %{time_zone_long_name}',
        );

        my $Payload              = $Config->{Authentication}->{JWTAuthPayload}              // {};
        my $AdditionalHeaderData = $Config->{Authentication}->{JWTAuthAdditionalHeaderData} // {};
        $JWT = $JWTObject->Encode(
            Payload              => $Payload,
            Algorithm            => $Config->{Authentication}->{JWTAuthAlgorithm},
            KeyFilePath          => $Config->{Authentication}->{JWTAuthKeyFilePath},
            KeyPassword          => $Config->{Authentication}->{JWTAuthKeyFilePassword},
            AdditionalHeaderData => $AdditionalHeaderData,
            PlaceholderData      => \%JWTPlaceholderData,
        );
    }

    # Add authentication options if configured (hard wired to basic authentication at the moment).
    if (
        IsHashRefWithData( $Config->{Authentication} )
        && IsStringWithData( $Config->{Authentication}->{AuthType} )
        && $Config->{Authentication}->{AuthType} eq 'BasicAuth'
        && IsStringWithData( $Config->{Authentication}->{BasicAuthUser} )
        && IsStringWithData( $Config->{Authentication}->{BasicAuthPassword} )
        )
    {
        $Headers->{Authorization} = 'Basic ' . encode_base64(
            $Config->{Authentication}->{BasicAuthUser} . ':' . $Config->{Authentication}->{BasicAuthPassword},
            '',
        );
    }

    # JWT header
    elsif (
        $JWTObjectIsSupported
        && IsHashRefWithData( $Config->{Authentication} )
        && IsStringWithData( $Config->{Authentication}->{AuthType} )
        && $Config->{Authentication}->{AuthType} eq 'JWT'
        && IsStringWithData($JWT)
        )
    {
        $Headers->{Authorization} = "Bearer $JWT";
    }

    my $RestCommand = $Config->{DefaultCommand};
    if ( IsStringWithData( $Config->{InvokerControllerMapping}->{ $Param{Operation} }->{Command} ) )
    {
        $RestCommand = $Config->{InvokerControllerMapping}->{ $Param{Operation} }->{Command};
    }

    $RestCommand = uc $RestCommand;

    if ( !grep { $_ eq $RestCommand } qw(GET POST PUT PATCH DELETE HEAD OPTIONS CONNECT TRACE) ) {

        my $ErrorMessage = "'$RestCommand' is not a valid REST command.";

        # Log to debugger.
        $Self->{DebuggerObject}->Error(
            Summary => $ErrorMessage,
        );
        return {
            Success      => 0,
            ErrorMessage => $ErrorMessage,
        };
    }

    if (
        !IsHashRefWithData( $Config->{InvokerControllerMapping} )
        || !IsHashRefWithData( $Config->{InvokerControllerMapping}->{ $Param{Operation} } )
        || !IsStringWithData(
            $Config->{InvokerControllerMapping}->{ $Param{Operation} }->{Controller}
        )
        )
    {
        my $ErrorMessage = "REST Transport: Have no Invoker <-> Controller mapping for Invoker '$Param{Operation}'.";

        # Log to debugger.
        $Self->{DebuggerObject}->Error(
            Summary => $ErrorMessage,
        );
        return {
            Success      => 0,
            ErrorMessage => $ErrorMessage,
        };
    }

    if ( grep { $_ eq $RestCommand } qw(POST PUT PATCH) ) {
        if ( IsStringWithData( $Config->{ContentType} ) ) {

            # Add defined content-type to HTTP header
            if ( $Config->{ContentType} eq 'JSON' ) {
                $Headers->{'Content-Type'} = 'application/json';
            }
            elsif ( $Config->{ContentType} eq 'FORM' ) {
                $Headers->{'Content-Type'} = 'application/x-www-form-urlencoded';
            }
            elsif ( $Config->{ContentType} eq 'XML' ) {
                $Headers->{'Content-Type'} = 'application/xml';
            }
        }
    }

    my $RequestHeaders = delete $Param{Data}->{__RequestHeaders};
    if ( IsHashRefWithData($RequestHeaders) ) {
        $Headers = $RequestHeaders;
    }

    my $RequestHeadersAppend = delete $Param{Data}->{__RequestHeadersAppend};
    if ( IsHashRefWithData($RequestHeadersAppend) ) {
        %{$Headers} = (
            %{$Headers},
            %{$RequestHeadersAppend},
        );
    }

    my @RequestParam;
    my $Controller = $Config->{InvokerControllerMapping}->{ $Param{Operation} }->{Controller};

    # Remove any query parameters that might be in the config,
    #   For example, from the controller: /Ticket/:TicketID/?:UserLogin&:Password
    #   controller must remain  /Ticket/:TicketID/
    $Controller =~ s{([^?]+)(.+)?}{$1};

    # Remember the query parameters e.g. ?:UserLogin&:Password.
    my $QueryParamsStr = $2 || '';

    my @ParamsToDelete;

    my %FlattenedParamData;
    $Self->_FlattenDataStructure(
        Data      => $Param{Data},
        Flattened => \%FlattenedParamData,
    );

    # Replace any URI params with their actual value.
    #    for example: from /Ticket/:TicketData.TicketID/:Other
    #    to /Ticket/1/2 (considering that $Param{Data} contains {TicketData}->{TicketID} = 1 and {Other} = 2).
    FLATTENEDPARAMDATA:
    for my $FlattenedParamName ( sort keys %FlattenedParamData ) {
        next FLATTENEDPARAMDATA if $Controller !~ m{:$FlattenedParamName(?=/|\?|$)}ms;

        my $ParamValue = $FlattenedParamData{$FlattenedParamName};
        next FLATTENEDPARAMDATA if !defined $ParamValue;

        $EncodeObject->EncodeInput( \$ParamValue );

        $ParamValue = URI::Escape::uri_escape_utf8($ParamValue);
        $Controller =~ s{:$FlattenedParamName(?=/|\?|$)}{$ParamValue}msg;

        # Only delete "top level" hash keys.
        # Keep data of nested structures as is because it would
        # look like there's something missing otherwise (especially if
        # array elements would be removed).
        next FLATTENEDPARAMDATA if index( $FlattenedParamName, '.' ) != -1;

        push @ParamsToDelete, $FlattenedParamName;
    }

    $Self->{DebuggerObject}->Debug(
        Summary => "URI after interpolating URI params from outgoing data",
        Data    => $Controller,
    );

    if ($QueryParamsStr) {

        # Replace any query params with their actual value
        #    for example: from ?UserLogin:UserLogin&Password=:Password
        #    to ?UserLogin=user&Password=secret
        #    (considering that $Param{Data} contains UserLogin = 'user' and Password = 'secret').
        my $ReplaceFlag;
        FLATTENEDPARAMDATA:
        for my $FlattenedParamName ( sort keys %FlattenedParamData ) {
            next FLATTENEDPARAMDATA if $QueryParamsStr !~ m{:$FlattenedParamName(?=&|$)}ms;

            my $ParamValue = $FlattenedParamData{$FlattenedParamName};
            next FLATTENEDPARAMDATA if !defined $ParamValue;

            $EncodeObject->EncodeInput( \$ParamValue );

            $ParamValue = URI::Escape::uri_escape_utf8($ParamValue);
            $QueryParamsStr =~ s{:$FlattenedParamName(?=&|$)}{$ParamValue}msxg;
            $ReplaceFlag = 1;

            # Only delete "top level" hash keys.
            # Keep data of nested structures as is because it would
            # look like there's something missing otherwise (especially if
            # array elements would be removed).
            next FLATTENEDPARAMDATA if index( $FlattenedParamName, '.' ) != -1;

            push @ParamsToDelete, $FlattenedParamName;
        }

        # Append query params in the URI.
        if ($ReplaceFlag) {
            $Controller .= $QueryParamsStr;

            $Self->{DebuggerObject}->Debug(
                Summary => "URI after interpolating Query params from outgoing data",
                Data    => $Controller,
            );
        }
    }

    # Remove already used "top-level" params.
    for my $ParamName (@ParamsToDelete) {
        delete $Param{Data}->{$ParamName};
    }

    my $Body;
    if ( IsHashRefWithData( $Param{Data} ) ) {

        # POST, PUT and PATCH can have Data in the Body.
        if (
            $RestCommand eq 'POST'
            || $RestCommand eq 'PUT'
            || $RestCommand eq 'PATCH'
            )
        {
            $Self->{DebuggerObject}->Debug(
                Summary => "Remaining outgoing data to be sent",
                Data    => $Param{Data},
            );

            if ( $Headers->{'Content-Type'} eq 'application/x-www-form-urlencoded' ) {

                # Add parameters as form data to body.
                $Param{Data} = $RestClient->buildQuery(
                    %{ $Param{Data} }
                );

                # Remove any leading questing mark
                if ( IsStringWithData( $Param{Data} ) ) {
                    $Param{Data} =~ s{\A\?}{}sm;
                }
            }
            elsif ( $Headers->{'Content-Type'} eq 'application/xml' ) {
                my $XMLSimple = XML::Simple->new();
                my $XMLOut;
                eval {
                    $XMLOut = $XMLSimple->XMLout(
                        $Param{Data},
                        AttrIndent => 1,
                        ContentKey => '-content',
                        NoAttr     => 0,
                        KeyAttr    => [],
                        RootName   => undef,
                    );
                };

                $XMLOut //= '';

                if ( !length $XMLOut ) {
                    $Self->{DebuggerObject}->Error(
                        Summary => 'Could not generate XML content for request.',
                    );
                }

                $Param{Data} = '<?xml version="1.0" encoding="UTF-8"?>' . "\n" . $XMLOut;
            }
            else {

                # Default to JSON (OTRS default behavior)
                $Param{Data} = $JSONObject->Encode(
                    Data => $Param{Data},
                );
            }

            # Make sure data is correctly encoded.
            $EncodeObject->EncodeOutput( \$Param{Data} );
        }

        # Whereas GET and the others just have a the data added to the Query URI.
        else {
            my $QueryParams = $RestClient->buildQuery(
                %{ $Param{Data} }
            );

            # Check if controller already have a  question mark '?'.
            if ( $Controller =~ m{\?}msx ) {

                # Replace question mark '?' by an ampersand '&'.
                $QueryParams =~ s{\A\?}{&};
            }

            $Controller .= $QueryParams;

            $Self->{DebuggerObject}->Debug(
                Summary => "URI after adding Query params from outgoing data",
                Data    => $Controller,
            );

            $Self->{DebuggerObject}->Debug(
                Summary => "Remaining outgoing data to be sent",
                Data    => "No data is sent in the request body as $RestCommand command sets all"
                    . " Data as query params",
            );
        }
    }
    push @RequestParam, $Controller;

    if ( IsStringWithData( $Param{Data} ) ) {
        $Body = $Param{Data};
        push @RequestParam, $Body;
    }

    if ( IsHashRefWithData( $Config->{AdditionalHeaders} ) ) {
        my $AdditionalHeaders = $Config->{AdditionalHeaders};

        # Insert data into placeholders.
        my %PlaceholderData;
        if (
            IsHashRefWithData( $Config->{Authentication} )
            && IsStringWithData( $Config->{Authentication}->{AuthType} )
            )
        {

            # JWT
            if (
                $Config->{Authentication}->{AuthType} eq 'JWT'
                && $JWTObjectIsSupported
                && IsStringWithData($JWT)
                )
            {
                $PlaceholderData{OTRS_JWT} = $JWT;
            }

            # OAuth2 token
            if (
                $Config->{Authentication}->{AuthType} eq 'OAuth2Token'
                && $Config->{Authentication}->{OAuth2TokenConfigID}
                )
            {
                my $OAuth2Token = $OAuth2TokenObject->GetToken(
                    TokenConfigID => $Config->{Authentication}->{OAuth2TokenConfigID},
                    UserID        => 1,
                );
                if ( !IsStringWithData($OAuth2Token) ) {
                    my $ErrorMessage
                        = "OAuth2 token for config with ID $Config->{Authentication}->{OAuth2TokenConfigID} could not be retrieved.";
                    $Self->{DebuggerObject}->Error(
                        Summary => $ErrorMessage,
                    );
                    return {
                        Success      => 0,
                        ErrorMessage => $ErrorMessage,
                    };
                }

                $PlaceholderData{OTRS_OAUTH2_TOKEN} = $OAuth2Token;
            }
        }

        HEADERFIELDNAME:
        for my $HeaderFieldname ( sort keys %{$AdditionalHeaders} ) {
            my $HeaderValue = $AdditionalHeaders->{$HeaderFieldname};
            next HEADERFIELDNAME if !defined $HeaderValue;

            for my $Placeholder ( sort keys %PlaceholderData ) {
                my $PlaceholderValue = $PlaceholderData{$Placeholder} // '';
                $HeaderValue =~ s{<$Placeholder>}{$PlaceholderValue}g;
            }

            # Remove unknown placeholders.
            $HeaderValue =~ s{<OTRS_.*?>}{}g;

            $AdditionalHeaders->{$HeaderFieldname} = $HeaderValue;
        }

        %{$Headers} = (
            %{$Headers},
            %{ $Config->{AdditionalHeaders} },
        );
    }

    if ( IsHashRefWithData($Headers) ) {
        for my $HeaderName ( sort keys %{$Headers} ) {
            my $HeaderValue = $Headers->{$HeaderName};
            $RestClient->addHeader( $HeaderName, $HeaderValue );
        }
    }

    # Add headers to request
    push @RequestParam, $Headers;

    $RestClient->$RestCommand(@RequestParam);

    $Self->{DebuggerObject}->Debug(
        Summary => "Request params from outgoing data",
        Data    => \@RequestParam,
    );

    my $ResponseCode = $RestClient->responseCode();
    my $ResponseError;
    my $ErrorMessage = "Error while performing REST '$RestCommand' request to Controller '$Controller' on Host '"
        . $Config->{Host} . "'.";

    if ( !IsStringWithData($ResponseCode) ) {
        $ResponseError = $ErrorMessage;
    }

    if ( $ResponseCode !~ m{ \A 20 \d \z }xms ) {
        $ResponseError = $ErrorMessage . " Response code '$ResponseCode'.";
    }

    my $ResponseContent = $RestClient->responseContent();

    $Self->{DebuggerObject}->Debug(
        Summary => "JSON data received from remote system",
        Data    => $ResponseContent,
    );

    if ( $ResponseCode ne '204' && !IsStringWithData($ResponseContent) ) {
        $ResponseError .= ' No content provided.';
    }

    # Return early in case an error on response.
    if ($ResponseError) {

        my $ResponseData = 'No content provided.';
        if ( IsStringWithData($ResponseContent) ) {
            $ResponseData = "Response content: '$ResponseContent'";
        }

        # log to debugger
        $Self->{DebuggerObject}->Error(
            Summary => $ResponseError,
            Data    => $ResponseData,
        );

        return {
            Success      => 0,
            ErrorMessage => $ResponseError,
        };
    }

    # Send processed data to debugger.
    my $SizeExceeded = 0;
    {
        my $MaxSize = $Kernel::OM->Get('Kernel::Config')->Get('GenericInterface::Operation::ResponseLoggingMaxSize')
            || 200;
        $MaxSize = $MaxSize * 1024;
        use bytes;

        my $ByteSize = length($ResponseContent);

        if ( $ByteSize < $MaxSize ) {
            $Self->{DebuggerObject}->Debug(
                Summary => 'JSON data received from remote system',
                Data    => $ResponseContent,
            );
        }
        else {
            $SizeExceeded = 1;
            $Self->{DebuggerObject}->Debug(
                Summary => "JSON data received from remote system was too large for logging",
                Data =>
                    'See SysConfig option GenericInterface::Operation::ResponseLoggingMaxSize to change the maximum.',
            );
        }
    }

    $ResponseContent = $EncodeObject->Convert2CharsetInternal(
        Text => $ResponseContent,
        From => 'utf-8',
    );

    # To convert the data into a hash, use the JSON module.
    my $Result;

    if ( $ResponseCode ne '204' ) {

        my $ResponseContentType = $RestClient->responseHeader('Content-Type') // '';
        if ( $ResponseContentType =~ m{text/(plain|html|xml)} ) {
            $Result = {
                Body => $ResponseContent,
            };

            return {
                Success      => 1,
                Data         => $Result,
                SizeExceeded => $SizeExceeded,
            };
        }

        $Result = $JSONObject->Decode(
            Data => $ResponseContent,
        );

        if ( !$Result ) {
            my $ResponseError = $ErrorMessage . ' Error while parsing JSON data.';

            # Log to debugger.
            $Self->{DebuggerObject}->Error(
                Summary => $ResponseError,
            );
            return {
                Success      => 0,
                ErrorMessage => $ResponseError,
            };
        }
    }

    # All OK - return result.
    return {
        Success      => 1,
        Data         => $Result || undef,
        SizeExceeded => $SizeExceeded,
    };
}

=begin Internal:

=head2 _Output()

Generate http response for provider and send it back to remote system.
Environment variables are checked for potential error messages.
Returns structure to be passed to provider.

    my $Result = $TransportObject->_Output(
        HTTPCode => 200,           # http code to be returned, optional
        Content  => 'response',    # message content, XML response on normal execution
    );

    $Result = {
        Success      => 0,
        ErrorMessage => 'Message', # error message from given summary
    };

=cut

sub _Output {
    my ( $Self, %Param ) = @_;

    # Check params.
    my $Success = 1;
    my $ErrorMessage;
    if ( defined $Param{HTTPCode} && !IsInteger( $Param{HTTPCode} ) ) {
        $Param{HTTPCode} = 500;
        $Param{Content}  = 'Invalid internal HTTPCode';
        $Success         = 0;
        $ErrorMessage    = 'Invalid internal HTTPCode';
    }
    elsif ( defined $Param{Content} && !IsString( $Param{Content} ) ) {
        $Param{HTTPCode} = 500;
        $Param{Content}  = 'Invalid Content';
        $Success         = 0;
        $ErrorMessage    = 'Invalid Content';
    }

    # Prepare protocol.
    my $Protocol = defined $ENV{SERVER_PROTOCOL} ? $ENV{SERVER_PROTOCOL} : 'HTTP/1.0';

    # FIXME: according to SOAP::Transport::HTTP the previous should only be used
    #   for IIS to imitate nph- behavior
    #   for all other browser 'Status:' should be used here
    #   this breaks apache though

    # prepare data
    $Param{Content}  ||= '';
    $Param{HTTPCode} ||= 500;
    my $ContentType;
    if ( $Param{HTTPCode} eq 200 ) {
        $ContentType = 'application/json';
    }
    else {
        $ContentType = 'text/plain';
    }

    # Calculate content length (based on the bytes length not on the characters length).
    my $ContentLength = bytes::length( $Param{Content} );

    # Log to debugger.
    my $DebugLevel;
    if ( $Param{HTTPCode} eq 200 ) {
        $DebugLevel = 'debug';
    }
    else {
        $DebugLevel = 'error';
    }
    $Self->{DebuggerObject}->DebugLog(
        DebugLevel => $DebugLevel,
        Summary    => "Returning provider data to remote system (HTTP Code: $Param{HTTPCode})",
        Data       => $Param{Content},
    );

    # Set keep-alive.
    my $Connection = $Self->{KeepAlive} ? 'Keep-Alive' : 'close';

    # prepare additional headers
    my $AdditionalHeaderStrg = '';

    my %AdditionalHeaders;
    if ( IsHashRefWithData( $Self->{TransportConfig}->{Config}->{AdditionalHeaders} ) ) {
        %AdditionalHeaders = %{ $Self->{TransportConfig}->{Config}->{AdditionalHeaders} };
    }
    if ( IsHashRefWithData( $Param{AdditionalResponseHeaders} ) ) {
        %AdditionalHeaders = ( %AdditionalHeaders, %{ $Param{AdditionalResponseHeaders} } );
    }
    for my $AdditionalHeader ( sort keys %AdditionalHeaders ) {
        $AdditionalHeaderStrg
            .= $AdditionalHeader . ': ' . ( $AdditionalHeaders{$AdditionalHeader} // '' ) . "\r\n";
    }

    # In the constructor of this module STDIN and STDOUT are set to binmode without any additional
    #   layer (according to the documentation this is the same as set :raw). Previous solutions for
    #   binary responses requires the set of :raw or :utf8 according to IO layers.
    #   with that solution Windows OS requires to set the :raw layer in binmode, see #bug#8466.
    #   while in *nix normally was better to set :utf8 layer in binmode, see bug#8558, otherwise
    #   XML parser complains about it... ( but under special circumstances :raw layer was needed
    #   instead ).
    #
    # This solution to set the binmode in the constructor and then :utf8 layer before the response
    #   is sent  apparently works in all situations. ( Linux circumstances to requires :raw was no
    #   reproducible, and not tested in this solution).
    binmode STDOUT, ':utf8';    ## no critic

    # Print data to http - '\r' is required according to HTTP RFCs.
    my $StatusMessage = HTTP::Status::status_message( $Param{HTTPCode} );
    print STDOUT "$Protocol $Param{HTTPCode} $StatusMessage\r\n";
    print STDOUT "Content-Type: $ContentType; charset=UTF-8\r\n";
    print STDOUT "Content-Length: $ContentLength\r\n";
    print STDOUT "Connection: $Connection\r\n";
    print STDOUT $AdditionalHeaderStrg;
    print STDOUT "\r\n";
    print STDOUT $Param{Content};

    return {
        Success      => $Success,
        ErrorMessage => $ErrorMessage,
    };
}

=head2 _Error()

Take error parameters from request processing.
Error message is written to debugger, written to environment for response.
Error is generated to be passed to provider/requester.

    my $Result = $TransportObject->_Error(
        Summary   => 'Message',    # error message
        HTTPError => 500,          # http error code, optional
    );

    $Result = {
        Success      => 0,
        ErrorMessage => 'Message', # error message from given summary
    };

=cut

sub _Error {
    my ( $Self, %Param ) = @_;

    # check needed params
    if ( !IsString( $Param{Summary} ) ) {
        return $Self->_Error(
            Summary   => 'Need Summary!',
            HTTPError => 500,
        );
    }

    # Log to debugger.
    $Self->{DebuggerObject}->Error(
        Summary => $Param{Summary},
    );

    # Remember data for response.
    if ( IsStringWithData( $Param{HTTPError} ) ) {
        $Self->{HTTPError}   = $Param{HTTPError};
        $Self->{HTTPMessage} = $Param{Summary};
    }

    # Return to provider/requester.
    return {
        Success      => 0,
        ErrorMessage => $Param{Summary},
    };
}

=head2 _FlattenDataStructure()

    Returns a flattened hash/array of a given hash/array.

    $TransportObject->_FlattenDataStructure(
        Data => \%OldHash,
        Flattened => \%NewHash,
    );

    my %OldHash = (
        Config => {
            A => 1,
            B => 2,
            C => 3,
            D => [
                2, 5, 6,
            ],
        },
        Config2 => 1
    );

    my %NewHash = (
        Config.A   => 1,
        Config.B   => 1,
        Config.C   => 1,
        Config.D.0 => 2,
        Config.D.1 => 5,
        Config.D.2 => 6,
        Config2    => 1,
    );

=cut

sub _FlattenDataStructure {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Data Flattened)) {
        if ( !$Param{$Needed} ) {
            print "Got no $Needed!\n";
            return;
        }
    }

    my @Containers;
    my $DataType;

    if ( ref $Param{Data} eq 'HASH' ) {
        @Containers = sort keys %{ $Param{Data} };
        $DataType   = 'Hash';
    }
    elsif ( ref $Param{Data} eq 'ARRAY' ) {
        @Containers = @{ $Param{Data} };
        $DataType   = 'Array';
    }
    else {
        return 1;
    }

    my $Prefix = $Param{Prefix} // '';

    my $ArrayCount = 0;

    CONTAINER:
    for my $Container (@Containers) {
        next CONTAINER if !$Container;

        if ( $DataType eq 'Hash' ) {
            if (
                IsHashRefWithData( $Param{Data}->{$Container} )
                || IsArrayRefWithData( $Param{Data}->{$Container} )
                )
            {
                $Self->_FlattenDataStructure(
                    Data      => $Param{Data}->{$Container},
                    Flattened => $Param{Flattened},
                    Prefix    => $Prefix . $Container . '.',
                );
            }
            else {
                $Prefix                      = $Prefix . $Container;
                $Param{Flattened}->{$Prefix} = $Param{Data}->{$Container};
                $Prefix                      = $Param{Prefix} || '';
            }
        }
        else {
            if (
                IsHashRefWithData($Container)
                || IsArrayRefWithData($Container)
                )
            {
                $Self->_FlattenDataStructure(
                    Data      => $Container,
                    Flattened => $Param{Flattened},
                    Prefix    => $Prefix . $Container . '.',
                );
            }
            else {
                $Prefix                      = $Prefix . $ArrayCount;
                $Param{Flattened}->{$Prefix} = $Container;
                $Prefix                      = $Param{Prefix} || '';
            }

            $ArrayCount++;
        }
    }

    return 1;
}

1;

=end Internal:

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
