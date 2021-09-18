# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::PostMaster::Filter::Decrypt;

use strict;
use warnings;

use Kernel::System::EmailParser;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Crypt::PGP',
    'Kernel::System::Crypt::SMIME',
);

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {};
    bless( $Self, $Type );

    # Get parser object.
    $Self->{ParserObject} = $Param{ParserObject} || die "Got no ParserObject!";

    # get communication log object and MessageID
    $Self->{CommunicationLogObject} = $Param{CommunicationLogObject} || die "Got no CommunicationLogObject!";

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # Check needed stuff.
    for my $Needed (qw(JobConfig GetParam)) {
        if ( !$Param{$Needed} ) {
            $Self->{CommunicationLogObject}->ObjectLog(
                ObjectLogType => 'Message',
                Priority      => 'Error',
                Key           => 'Kernel::System::PostMaster::Filter::Decrypt',
                Value         => "Need $Needed!",
            );
            return;
        }
    }

    # Try to get message & encryption method.
    my $Message;
    my $ContentType;
    my $EncryptionMethod = '';

    if ( $Param{GetParam}->{Body} =~ /\A[\s\n]*^-----BEGIN PGP MESSAGE-----/m ) {
        $Message          = $Param{GetParam}->{Body};
        $ContentType      = $Param{GetParam}->{'Content-Type'} || '';
        $EncryptionMethod = 'PGP';
    }
    elsif ( $Param{GetParam}->{'Content-Type'} =~ /application\/(x-pkcs7|pkcs7)-mime/i ) {
        $EncryptionMethod = 'SMIME';
        $ContentType      = $Param{GetParam}->{'Content-Type'} || '';
    }
    else {
        CONTENT:
        for my $Content ( @{ $Param{GetParam}->{Attachment} } ) {
            if ( $Content->{Content} =~ /\A[\s\n]*^-----BEGIN PGP MESSAGE-----/m ) {
                $Message          = $Content->{Content};
                $ContentType      = $Content->{ContentType} || '';
                $EncryptionMethod = 'PGP';
                last CONTENT;
            }
            elsif ( $Content->{Content} =~ /^-----BEGIN PKCS7-----/ ) {
                $Message          = $Content->{Content};
                $ContentType      = $Param{GetParam}->{'Content-Type'} || '';
                $EncryptionMethod = 'SMIME';
                last CONTENT;
            }
        }
    }

    if ( $EncryptionMethod eq 'PGP' ) {

        # Try to decrypt body with PGP.
        $Param{GetParam}->{'X-OTRS-BodyDecrypted'} = $Self->_DecryptPGP(
            Body        => $Message,
            ContentType => $ContentType,
            %Param
        ) || '';

        # Return PGP decrypted content if encryption is PGP.
        return $Param{GetParam}->{'X-OTRS-BodyDecrypted'} if $Param{GetParam}->{'X-OTRS-BodyDecrypted'};
    }
    elsif ( $EncryptionMethod eq 'SMIME' ) {

        # Try to decrypt body with SMIME.
        $Param{GetParam}->{'X-OTRS-BodyDecrypted'} = $Self->_DecryptSMIME(
            Body        => $Self->{ParserObject}->{Email}->as_string(),
            ContentType => $ContentType,
            %Param
        ) || '';

        # Return SMIME decrypted content if encryption is SMIME
        return $Param{GetParam}->{'X-OTRS-BodyDecrypted'} if $Param{GetParam}->{'X-OTRS-BodyDecrypted'};
    }
    else {
        # If it's not an encrypted message, set X-OTRS-BodyDecrypted to message
        # body to allow one to use only X-OTRS-BodyDecrypted in postmaster filters
        # and not to force user to define separate filters for Body and X-OTRS-BodyDecrypted.
        $Param{GetParam}->{'X-OTRS-BodyDecrypted'} = $Param{GetParam}->{Body};
    }

    return 1;
}

sub _DecryptPGP {
    my ( $Self, %Param ) = @_;

    my $DecryptBody = $Param{Body}        || '';
    my $ContentType = $Param{ContentType} || '';

    # Check if PGP is active
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    if ( !$ConfigObject->Get('PGP') ) {
        $Self->{CommunicationLogObject}->ObjectLog(
            ObjectLogType => 'Message',
            Priority      => 'Error',
            Key           => 'Kernel::System::PostMaster::Filter::Decrypt',
            Value         => "PGP is not activated",
        );
        return;
    }

    # Check for PGP encryption
    if (
        $DecryptBody !~ m{\A[\s\n]*^-----BEGIN PGP MESSAGE-----}i
        && $ContentType !~ m{application/pgp}i
        )
    {
        return;
    }

    # PGP crypt object
    my $CryptObject = $Kernel::OM->Get('Kernel::System::Crypt::PGP');

    if ( !$CryptObject ) {
        $Self->{CommunicationLogObject}->ObjectLog(
            ObjectLogType => 'Message',
            Priority      => 'Error',
            Key           => 'Kernel::System::PostMaster::Filter::Decrypt',
            Value         => "Not possible to create crypt object",
        );
        return;
    }

    # Try to decrypt.
    my %Decrypt = $CryptObject->Decrypt( Message => $DecryptBody );

    return if !$Decrypt{Successful};

    my $ParserObject = Kernel::System::EmailParser->new( %{$Self}, Email => $Decrypt{Data} );
    $DecryptBody = $ParserObject->GetMessageBody();

    # WARNING: see StoreDecryptedBody description before enabling it
    # to avoid data loss!
    if ( $Param{JobConfig}->{StoreDecryptedBody} ) {
        $Param{GetParam}->{Body} = $DecryptBody;
    }

    # Return content if successful
    return $DecryptBody;
}

sub _DecryptSMIME {
    my ( $Self, %Param ) = @_;

    my $DecryptBody = $Param{Body}        || '';
    my $ContentType = $Param{ContentType} || '';

    # Check if SMIME is active
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    if ( !$ConfigObject->Get('SMIME') ) {
        $Self->{CommunicationLogObject}->ObjectLog(
            ObjectLogType => 'Message',
            Priority      => 'Error',
            Key           => 'Kernel::System::PostMaster::Filter::Decrypt',
            Value         => "SMIME is not activated",
        );
        return;
    }

    # Check for SMIME encryption
    if (
        $DecryptBody !~ m{^-----BEGIN PKCS7-----}i
        && $ContentType !~ m{application/(x-pkcs7|pkcs7)}i
        )
    {
        return;
    }

    # SMIME crypt object
    my $CryptObject = $Kernel::OM->Get('Kernel::System::Crypt::SMIME');

    if ( !$CryptObject ) {
        $Self->{CommunicationLogObject}->ObjectLog(
            ObjectLogType => 'Message',
            Priority      => 'Error',
            Key           => 'Kernel::System::PostMaster::Filter::Decrypt',
            Value         => "Not possible to create crypt object",
        );
        return;
    }

    # get all email addresses on article
    my %EmailsToSearch;
    for my $Email (qw(Resent-To Envelope-To To Cc Delivered-To X-Original-To)) {

        my @EmailAddressOnField = $Self->{ParserObject}->SplitAddressLine(
            Line => $Self->{ParserObject}->GetParam( WHAT => $Email ),
        );

        # filter email addresses avoiding repeated and save on hash to search
        for my $EmailAddress (@EmailAddressOnField) {
            my $CleanEmailAddress = $Self->{ParserObject}->GetEmailAddress(
                Email => $EmailAddress,
            );
            $EmailsToSearch{$CleanEmailAddress} = '1';
        }
    }

    # look for private keys for every email address
    # extract every resulting cert and put it into an hash of hashes avoiding repeated
    my %PrivateKeys;
    for my $EmailAddress ( sort keys %EmailsToSearch ) {
       my @PrivateKeysResult = $CryptObject->PrivateSearch(
           Search => $EmailAddress,
       );
       for my $Cert (@PrivateKeysResult) {
           $PrivateKeys{ $Cert->{Filename} } = $Cert;
       }
    }
    return if !%PrivateKeys;

    my %Decrypt;
    PRIVATESEARCH:
    for my $CertResult ( values %PrivateKeys ) {

        # decrypt
        %Decrypt = $CryptObject->Decrypt(
            Message            => $DecryptBody,
            SearchingNeededKey => 1,
            %{$CertResult},
        );
        last PRIVATESEARCH if ( $Decrypt{Successful} );
    }

    return if !$Decrypt{Successful};

    my $ParserObject = Kernel::System::EmailParser->new(
        %{$Self},
        Email => $Decrypt{Data},
    );
    $DecryptBody = $ParserObject->GetMessageBody();

    # WARNING: see StoreDecryptedBody description before enabling it
    # to avoid data loss!
    if ( $Param{JobConfig}->{StoreDecryptedBody} ) {
        $Param{GetParam}->{Body}           = $DecryptBody;
        $Param{GetParam}->{'Content-Type'} = 'text/html';
    }

    # Return content if successful
    return $DecryptBody;
}

1;
