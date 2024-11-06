# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::CheckItem;

use strict;
use warnings;

use Email::Valid;
use Mail::Address;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::CheckItem - check items

=head1 DESCRIPTION

All item check functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $CheckItemObject = $Kernel::OM->Get('Kernel::System::CheckItem');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 CheckError()

get the error of check item back

    my $Error = $CheckItemObject->CheckError();

=cut

sub CheckError {
    my $Self = shift;

    return $Self->{Error};
}

=head2 CheckErrorType()

get the error's type of check item back

    my $ErrorType = $CheckItemObject->CheckErrorType();

=cut

sub CheckErrorType {
    my $Self = shift;

    return $Self->{ErrorType};
}

=head2 CheckEmail()

returns true if check was successful, if it's false, get the error message
from CheckError()

    my $Valid = $CheckItemObject->CheckEmail(
        Address => 'info@example.com',
    );

=cut

sub CheckEmail {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Address} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Address!'
        );
        return;
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check if it's to do
    return 1 if !$ConfigObject->Get('CheckEmailAddresses');

    # check valid email addresses
    my $RegExp = $ConfigObject->Get('CheckEmailValidAddress');
    if ( $RegExp && $Param{Address} =~ /$RegExp/i ) {
        return 1;
    }
    my $Error = '';

    # Workaround for https://github.com/Perl-Email-Project/Email-Valid/issues/36:
    # remove comment from address when checking.
    $Param{Address} =~ s{ \s* \( [^()]* \) \s* $ }{}smxg;

    # email address syntax check
    if ( !Email::Valid->address( $Param{Address} ) ) {
        $Error = "Invalid syntax";
        $Self->{ErrorType} = 'InvalidSyntax';
    }

    # period (".") may not be used to end the local part,
    # nor may two or more consecutive periods appear
    elsif ( $Param{Address} =~ /(\.\.)|(\.@)/ ) {
        $Error = "Invalid syntax";
        $Self->{ErrorType} = 'InvalidSyntax';
    }

    # mx check
    elsif (
        $ConfigObject->Get('CheckMXRecord')
        && eval { require Net::DNS }    ## no critic
        )
    {

        # get host
        my $Host = $Param{Address};
        $Host =~ s/^.*@(.*)$/$1/;
        $Host =~ s/\s+//g;
        $Host =~ s/(^\[)|(\]$)//g;

        # do dns query
        my $Resolver = Net::DNS::Resolver->new();
        if ($Resolver) {

            # it's no fun to have this hanging in the web interface
            my $ResolverTimeout = $ConfigObject->Get('CheckMXRecord::Timeout') // 3;
            $Resolver->tcp_timeout($ResolverTimeout);
            $Resolver->udp_timeout($ResolverTimeout);
            $Resolver->retry(1);
            $Resolver->retrans(1);

            # check if we need to use a specific name server
            my $Nameserver = $ConfigObject->Get('CheckMXRecord::Nameserver');
            if ($Nameserver) {
                $Resolver->nameservers($Nameserver);
            }

            # A-record lookup to verify proper DNS setup
            my $Packet = $Resolver->send( $Host, 'A' );
            if ( !$Packet ) {
                $Self->{ErrorType} = 'InvalidDNS';
                $Error = "DNS problem: " . $Resolver->errorstring();
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => $Error,
                );
            }

            else {
                # RFC 5321: first check MX record and fallback to A record if present.
                # mx record lookup
                my @MXRecords = Net::DNS::mx( $Resolver, $Host );

                if ( !@MXRecords ) {

                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'debug',
                        Message =>
                            "$Host has no mail exchanger (MX) defined, trying A resource record instead.",
                    );

                    # see if our previous A-record lookup returned a RR
                    if ( scalar $Packet->answer() eq 0 ) {

                        $Self->{ErrorType} = 'InvalidMX';
                        $Error = "$Host has no mail exchanger (MX) or A resource record defined.";

                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'debug',
                            Message  => $Error,
                        );
                    }
                }
            }
        }
    }
    elsif ( $ConfigObject->Get('CheckMXRecord') ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't load Net::DNS, no mx lookups possible",
        );
    }

    # check address
    if ( !$Error ) {

        # check special stuff
        my $RegExp = $ConfigObject->Get('CheckEmailInvalidAddress');
        if ( $RegExp && $Param{Address} =~ /$RegExp/i ) {
            $Self->{Error}     = "invalid $Param{Address} (config)!";
            $Self->{ErrorType} = 'InvalidConfig';
            return;
        }
        return 1;
    }
    else {

        # remember error
        $Self->{Error} = "invalid $Param{Address} ($Error)! ";
        return;
    }
}

=head2 AreEmailAddressesValid()

    Checks if the given string contains only valid email address(es).

    my $EmailAddressesAreValid = $UtilObject->AreEmailAddressesValid(
        EmailAddresses => 'test@example.org, test2@example.org',

        # or as array ref
        EmailAddresses => [
            'test@example.org',
            'test2@example.org',
        ],

        # also works with just one address
        EmailAddresses => 'test@example.org',

        # or as array ref
        EmailAddresses => ['test@example.org'],
    );

    Returns true value if the given string only contains valid email addresses.

=cut

sub AreEmailAddressesValid {
    my ( $Self, %Param ) = @_;

    return if !defined $Param{EmailAddresses};

    if ( ref $Param{EmailAddresses} eq 'ARRAY' ) {
        $Param{EmailAddresses} = join ', ', @{ $Param{EmailAddresses} };
    }

    my @EmailAddresses = Mail::Address->parse( $Param{EmailAddresses} );
    return if !@EmailAddresses;

    EMAILADDRESS:
    for my $EmailAddress (@EmailAddresses) {
        my $EmailAddressIsValid = $Self->CheckEmail(
            Address => $EmailAddress->address()
        );

        return if !$EmailAddressIsValid;
    }

    return 1;
}

=head2 StringClean()

clean a given string.

    my $StringRef = $CheckItemObject->StringClean(
        StringRef             => \'String',
        TrimLeft              => 0,  # (optional) default 1
        TrimRight             => 0,  # (optional) default 1
        RemoveAllNewlines     => 1,  # (optional) default 0
        RemoveAllTabs         => 1,  # (optional) default 0
        RemoveAllSpaces       => 1,  # (optional) default 0
        ReplaceWithWhiteSpace => 1,  # (optional) default 0
    );

=cut

sub StringClean {
    my ( $Self, %Param ) = @_;

    if ( !$Param{StringRef} || ref $Param{StringRef} ne 'SCALAR' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need a scalar reference!'
        );
        return;
    }

    return $Param{StringRef} if !defined ${ $Param{StringRef} };
    return $Param{StringRef} if ${ $Param{StringRef} } eq '';

    # check for invalid utf8 characters and remove invalid strings
    if ( !utf8::valid( ${ $Param{StringRef} } ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Removed string containing invalid utf8: '${ $Param{StringRef} }'!",
        );
        ${ $Param{StringRef} } = '';
        return;
    }

    # set default values
    $Param{TrimLeft}  = defined $Param{TrimLeft}  ? $Param{TrimLeft}  : 1;
    $Param{TrimRight} = defined $Param{TrimRight} ? $Param{TrimRight} : 1;

    my %TrimAction = (
        RemoveAllNewlines => qr{ (\n\r|\n|\r|\f)+ }xms,
        RemoveAllTabs     => qr{ \t       }xms,
        RemoveAllSpaces   => qr{ [ ]      }xms,
        TrimLeft          => qr{ \A \s+   }xms,
        TrimRight         => qr{ \s+ \z   }xms,
    );

    ACTION:
    for my $Action ( sort keys %TrimAction ) {
        next ACTION if !$Param{$Action};
        my $ReplaceWith = '';

        # Check if Newline or Tabs should be replaced with a whitespace
        if (
            $Param{ReplaceWithWhiteSpace}
            && ( $Action eq 'RemoveAllNewlines' || $Action eq 'RemoveAllTabs' )
            && !$Param{RemoveAllSpaces}
            )
        {
            $ReplaceWith = ' ';
        }
        ${ $Param{StringRef} } =~ s{ $TrimAction{$Action} }{$ReplaceWith}xmsg;
    }

    return $Param{StringRef};
}

=head2 CreditCardClean()

clean a given string and remove credit card

    my ($StringRef, $Found) = $CheckItemObject->CreditCardClean(
        StringRef => \'String',
    );

=cut

sub CreditCardClean {
    my ( $Self, %Param ) = @_;

    if ( !$Param{StringRef} || ref $Param{StringRef} ne 'SCALAR' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need a scalar reference!'
        );
        return;
    }

    return ( $Param{StringRef}, 0 ) if ${ $Param{StringRef} } eq '';
    return ( $Param{StringRef}, 0 ) if !defined ${ $Param{StringRef} };

    # strip credit card numbers
    my $Count = 0;
    ${ $Param{StringRef} } =~ s{
        \b(\d{4})(\s|\.|\+|_|-|\\|/)(\d{4})(\s|\.|\+|_|-|\\|/|)(\d{4})(\s|\.|\+|_|-|\\|/)(\d{3,4})\b
    }
    {
        $Count++;
        "$1$2XXXX$4XXXX$6$7";
    }egx;

    return $Param{StringRef}, $Count;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
