# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::X509Certificate;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 SYNOPSIS

Support for parsing X.509 certificates.

=head1 PUBLIC INTERFACE

=head2 new()

    Don't use the constructor directly, use the ObjectManager instead:

    my $X509CertificateObject = $Kernel::OM->Get('Kernel::System::X509Certificate');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{IsSupported} = $Self->IsSupported();

    return $Self;
}

=head2 IsSupported()

    Checks (and requires) Crypt::OpenSSL::X509 module needed for X.509 certificate support.

    my $X509CertificateObjectIsSupported = $X509CertificateObject->IsSupported();

    Returns true value if X.509 certificates are supported.

=cut

sub IsSupported {
    my ( $Self, %Param ) = @_;

    return $Self->{IsSupported} if defined $Self->{IsSupported};

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $PackageSuccessfullyRequired = $MainObject->Require(
        'Crypt::OpenSSL::X509',
        Silent => 1,
    );

    $Self->{IsSupported} = $PackageSuccessfullyRequired ? 1 : 0;

    return $Self->{IsSupported};
}

=head2 Parse()

    Parses the given certificate and returns a hash with its data.

    my $X509Certificate = $X509CertificateObject->Parse(

        # String or FilePath
        String   => '...',
        FilePath => '/home/user1/cert.pem',
    );

    Returns:

    my $X509Certificate = {
        Email     => '...',
        IsExpired => 0,
        Issuer    => '...',
        NotAfter  => '...',
        NotBefore => '...',
        Serial    => '...',
        Subject   => '...',
        Version   => '...',

        CryptOpenSSLX509Object => $Object, # object returned by Crypt::OpenSSL::X509
    };

=cut

sub Parse {
    my ( $Self, %Param ) = @_;

    return if !$Self->IsSupported();

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    if (
        ( !$Param{String} && !$Param{FilePath} )
        || ( $Param{String} && $Param{FilePath} )
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Either give parameter 'String' or 'FilePath'.",
        );
        return;
    }

    my $X509Certificate;
    local $@;

    eval {
        if ( $Param{String} ) {
            $X509Certificate = Crypt::OpenSSL::X509->new_from_string( $Param{String} );
        }
        else {
            $X509Certificate = Crypt::OpenSSL::X509->new_from_file( $Param{FilePath} );
        }
    };

    if ($@) {
        $LogObject->Log(
            Priority => 'error',
            Message  => $@,
        );
        return;
    }

    my %Data = (
        Email                  => $X509Certificate->email(),
        IsExpired              => $X509Certificate->checkend(1) ? 1 : 0,
        Issuer                 => $X509Certificate->issuer(),
        NotAfter               => $X509Certificate->notAfter(),
        NotBefore              => $X509Certificate->notBefore(),
        Serial                 => $X509Certificate->serial(),
        Subject                => $X509Certificate->subject(),
        Version                => $X509Certificate->version(),
        CryptOpenSSLX509Object => $X509Certificate,
    );

    return \%Data;
}

1;
