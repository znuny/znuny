# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::JSONWebToken;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Main',
);

use Kernel::System::VariableCheck qw(:all);

=head1 SYNOPSIS

Support for JSON web tokens (JWT).

=head1 PUBLIC INTERFACE

=head2 new()

    Don't use the constructor directly, use the ObjectManager instead:

    my $JWTObject = $Kernel::OM->Get('Kernel::System::JSONWebToken');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{IsSupported} = $Self->IsSupported();

    return $Self;
}

=head2 IsSupported()

    Checks (and requires) Crypt::JWT module needed for JWT support.

    my $JWTObjectIsSupported = $JWTObject->IsSupported();

    Returns true value if JWT is supported.

=cut

sub IsSupported {
    my ( $Self, %Param ) = @_;

    return $Self->{IsSupported} if defined $Self->{IsSupported};

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $PackageSuccessfullyRequired = $MainObject->Require(
        'Crypt::JWT',
        Silent => 1,
    );

    $Self->{IsSupported} = $PackageSuccessfullyRequired ? 1 : 0;

    return $Self->{IsSupported};
}

=head2 Encode()

    Encodes a JSON web token with the given data.

    my $JWT = $JWTObject->Encode(
        Payload => {

            # arbitrary data
            Subject       => '...',
            SomeOtherData => {
                # ...
            },
        },
        Algorithm   => 'RS512', # see https://metacpan.org/pod/Crypt::JWT#alg

        # Key or key file
        Key         => '...', # see https://metacpan.org/pod/Crypt::JWT#key1
        KeyFilePath => '/home/user1/key.pem',

        KeyPassword          => '...', # optional, password for the key
        AdditionalHeaderData => { # optional

            # arbitrary data
            Type => '...',
        },

        # Optional: Use this hash to give additional parameters to Crypt::JWT.
        CryptJWTParameters => {

            # see https://metacpan.org/pod/Crypt::JWT#encode_jwt
            enc => '...',

            # ...
        },

        # Optional: Data to be placed in placeholders in given Payload and AdditionalHeaderData parameters.
        # All values of the given payload and additional header data hash will be searched
        # for all the given placeholders and their values be replaced.
        PlaceholderData => {
            OTRS_JWT_CertSubject         => '...',
            OTRS_JWT_ExpirationTimestamp => '9999999999999',

            # ...
        },
    );

    Returns a JSON web token string on success.

=cut

sub Encode {
    my ( $Self, %Param ) = @_;

    return if !$Self->IsSupported();

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(Payload Algorithm)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed.",
        );
        return;
    }

    if (
        ( !$Param{Key} && !$Param{KeyFilePath} )
        || ( $Param{Key} && $Param{KeyFilePath} )
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Either give parameter 'Key' or 'KeyFilePath'.",
        );
        return;
    }

    my $Key = \$Param{Key};
    if ( $Param{KeyFilePath} ) {
        $Key = $MainObject->FileRead(
            Location        => $Param{KeyFilePath},
            Mode            => 'binmode',             # optional - binmode|utf8
            Type            => 'Local',               # optional - Local|Attachment|MD5
            Result          => 'SCALAR',              # optional - SCALAR|ARRAY
            DisableWarnings => 0,                     # optional
        );

        if ( !IsStringWithData( ${$Key} ) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error reading key file $Param{KeyFilePath}.",
            );
            return;
        }
    }

    my %CryptJWTParameters;
    if ( IsHashRefWithData( $Param{CryptJWTParameters} ) ) {
        %CryptJWTParameters = %{ $Param{CryptJWTParameters} };
    }

    # Insert values for placeholders.
    DATA:
    for my $Data ( $Param{Payload}, $Param{AdditionalHeaderData} ) {
        next DATA if !IsHashRefWithData($Data);

        DATAKEY:
        for my $DataKey ( sort keys %{$Data} ) {
            my $DataValue = $Data->{$DataKey};
            next DATAKEY if !defined $DataValue;

            if ( IsHashRefWithData( $Param{PlaceholderData} ) ) {
                for my $Placeholder ( sort keys %{ $Param{PlaceholderData} } ) {
                    my $PlaceholderValue = $Param{PlaceholderData}->{$Placeholder} // '';

                    $DataValue =~ s{<$Placeholder>}{$PlaceholderValue}g;
                }
            }

            # Remove unknown placeholders.
            $DataValue =~ s{<OTRS_.*?>}{}g;

            $Data->{$DataKey} = $DataValue;
        }
    }

    my $JWT;

    eval {
        $JWT = Crypt::JWT::encode_jwt(
            payload       => $Param{Payload},
            alg           => $Param{Algorithm},
            key           => $Key,
            keypass       => $Param{KeyPassword},
            extra_headers => $Param{AdditionalHeaderData},
            %CryptJWTParameters,
        );
    };

    return if $@;

    return $JWT;
}

=head2 Decode()

    Decodes a JSON web token.

    my $JWT = $JWTObject->Decode(
        Token       => '...',

        # Key or KeyFilePath
        Key         => '...', # see https://metacpan.org/pod/Crypt::JWT#key1
        KeyFilePath => '/home/user1/key.pem',

        KeyPassword => '...', # optional, password for the key

        # Optional: Use this hash to give additional parameters to Crypt::JWT.
        CryptJWTParameters => {

            # see https://metacpan.org/pod/Crypt::JWT#decode_jwt
            # '...' => '...',

            # ...
        },
    );

    Returns decoded data of the given JSON web token.

=cut

sub Decode {
    my ( $Self, %Param ) = @_;

    return if !$Self->IsSupported();

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(Token)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if (
        ( !$Param{Key} && !$Param{KeyFilePath} )
        || ( $Param{Key} && $Param{KeyFilePath} )
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Either give parameter 'Key' or 'KeyFilePath'.",
        );
        return;
    }

    my $Key = \$Param{Key};
    if ( $Param{KeyFilePath} ) {
        $Key = $MainObject->FileRead(
            Location        => $Param{KeyFilePath},
            Mode            => 'binmode',             # optional - binmode|utf8
            Type            => 'Local',               # optional - Local|Attachment|MD5
            Result          => 'SCALAR',              # optional - SCALAR|ARRAY
            DisableWarnings => 0,                     # optional
        );

        if ( !IsStringWithData( ${$Key} ) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error reading key file $Param{KeyFilePath}.",
            );
            return;
        }
    }

    my %CryptJWTParameters;
    if ( IsHashRefWithData( $Param{CryptJWTParameters} ) ) {
        %CryptJWTParameters = %{ $Param{CryptJWTParameters} };
    }

    my $JWT;

    eval {
        $JWT = Crypt::JWT::decode_jwt(
            token   => $Param{Token},
            key     => $Key,
            keypass => $Param{KeyPassword},
            %CryptJWTParameters,
        );
    };

    return if $@;

    return $JWT;
}

1;
