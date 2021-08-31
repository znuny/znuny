# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::MailAccount::IMAPS;

use strict;
use warnings;

# There are currently errors on Perl 5.20 on Travis, disable this check for now.
## nofilter(TidyAll::Plugin::OTRS::Perl::SyntaxCheck)
use IO::Socket::SSL;

use parent qw(Kernel::System::MailAccount::IMAP);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
);

sub Connect {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Login Password Host Timeout Debug)) {
        if ( !defined $Param{$Needed} ) {
            return (
                Successful => 0,
                Message    => "Need $Needed!",
            );
        }
    }

    my $Type = 'IMAPS';

    # Get config object.
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # TLS verification settings
    my $TLSVerifyPeer = $ConfigObject->Get('TLS::VerifyPeer') // 1;
    my $TLSCAPath = $ConfigObject->Get('TLS::CAPath') || '/etc/ssl/certs';

    my $SSLOptions = [
        SSL_verify_mode     => IO::Socket::SSL::SSL_VERIFY_PEER(),
        SSL_ca_path         => $TLSCAPath,
        SSL_verifycn_scheme => 'default',    # Allows wildcards; see IO::Socket::SSL manual for details.
    ];

    if ($TLSVerifyPeer) {
        if ( ( !-d $TLSCAPath ) || ( !-r $TLSCAPath ) ) {
            return (
                Successful => 0,
                Message    => "$Type: Can't connect to $Param{Host} (incorrect TLS::CAPath)!"
            );
        }
    }
    else {
        $SSLOptions = [
            SSL_verify_mode => IO::Socket::SSL::SSL_VERIFY_NONE(),
        ];
    }

    # connect to host
    my $IMAPObject = Net::IMAP::Simple->new(
        $Param{Host},
        timeout     => $Param{Timeout},
        debug       => $Param{Debug},
        use_ssl     => 1,
        ssl_options => $SSLOptions,
    );
    if ( !$IMAPObject ) {
        return (
            Successful => 0,
            Message    => "$Type: Can't connect to $Param{Host}"
        );
    }

    # authentication
    my $Auth = $IMAPObject->login( $Param{Login}, $Param{Password} );
    if ( !defined $Auth ) {
        $IMAPObject->quit();
        return (
            Successful => 0,
            Message    => "$Type: Auth for user $Param{Login}/$Param{Host} failed!"
        );
    }

    return (
        Successful => 1,
        IMAPObject => $IMAPObject,
        Type       => $Type,
    );
}

1;
