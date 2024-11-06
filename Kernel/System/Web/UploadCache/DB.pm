# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Web::UploadCache::DB;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
use MIME::Base64;
use File::Basename;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Encode',
    'Kernel::System::Log',
    'Kernel::System::FormDraft',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub FormIDCreate {
    my ( $Self, %Param ) = @_;

    # return requested form id
    return time() . '.' . rand(12341241);
}

sub FormIDRemove {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(FormID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    return if !$Self->_FormIDValidate( $Param{FormID} );

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            DELETE FROM web_upload_cache
            WHERE form_id = ?',
        Bind => [ \$Param{FormID} ],
    );

    return 1;
}

sub FormIDAddFile {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(FormID Filename ContentType)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    return if !$Self->_FormIDValidate( $Param{FormID} );

    $Param{Content} = '' if !defined( $Param{Content} );

    # get file size
    $Param{Filesize} = bytes::length( $Param{Content} );

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # encode attachment if it's a postgresql backend!!!
    if ( !$DBObject->GetDatabaseFunction('DirectBlob') ) {

        $Kernel::OM->Get('Kernel::System::Encode')->EncodeOutput( \$Param{Content} );

        $Param{Content} = encode_base64( $Param{Content} );
    }

    # create content id
    my $ContentID   = $Param{ContentID};
    my $Disposition = $Param{Disposition} || '';
    if ( !$ContentID && lc $Disposition eq 'inline' ) {

        my $Random       = rand 999999;
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
        my $ExternalFQDN = $ConfigObject->Get('ExternalFQDN') || $ConfigObject->Get('FQDN');

        $ContentID = "$Disposition$Random.$Param{FormID}\@$ExternalFQDN";
    }

    # write attachment to db
    my $Time = time();

    my $Filename = basename( $Param{Filename} );

    return if !$DBObject->Do(
        SQL => '
            INSERT INTO web_upload_cache (form_id, filename, content_type, content_size, content,
                create_time_unix, content_id, disposition)
            VALUES  (?, ?, ?, ?, ?, ?, ?, ?)',
        Bind => [
            \$Param{FormID}, \$Filename, \$Param{ContentType}, \$Param{Filesize},
            \$Param{Content}, \$Time, \$ContentID, \$Param{Disposition}
        ],
    );

    return 1;
}

sub FormIDRemoveFile {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(FormID FileID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    return if !$Self->_FormIDValidate( $Param{FormID} );

    my @Index = @{ $Self->FormIDGetAllFilesMeta(%Param) };

    # finish if files have been already removed by other process
    return if !@Index;

    my $ID = $Param{FileID} - 1;
    $Param{Filename} = $Index[$ID]->{Filename};

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => '
            DELETE FROM web_upload_cache
            WHERE form_id = ?
                AND filename = ?',
        Bind => [ \$Param{FormID}, \$Param{Filename} ],
    );

    return 1;
}

sub FormIDGetAllFilesData {
    my ( $Self, %Param ) = @_;

    my $Counter = 0;
    my @Data;
    for my $Needed (qw(FormID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    return \@Data if !$Self->_FormIDValidate( $Param{FormID} );

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    $DBObject->Prepare(
        SQL => '
            SELECT filename, content_type, content_size, content, content_id, disposition
            FROM web_upload_cache
            WHERE form_id = ?
            ORDER BY create_time_unix',
        Bind   => [ \$Param{FormID} ],
        Encode => [ 1, 1, 1, 0, 1, 1 ],
    );

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Counter++;

        # encode attachment if it's a postgresql backend!!!
        if ( !$DBObject->GetDatabaseFunction('DirectBlob') ) {
            $Row[3] = decode_base64( $Row[3] );
        }

        # add the info
        push(
            @Data,
            {
                Content     => $Row[3],
                ContentID   => $Row[4],
                ContentType => $Row[1],
                Filename    => $Row[0],
                Filesize    => $Row[2],
                Disposition => $Row[5],
                FileID      => $Counter,
            }
        );
    }

    return \@Data;
}

sub FormIDGetAllFilesMeta {
    my ( $Self, %Param ) = @_;

    my $Counter = 0;
    my @Data;
    for my $Needed (qw(FormID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    return \@Data if !$Self->_FormIDValidate( $Param{FormID} );

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    $DBObject->Prepare(
        SQL => '
            SELECT filename, content_type, content_size, content_id, disposition
            FROM web_upload_cache
            WHERE form_id = ?
            ORDER BY create_time_unix',
        Bind => [ \$Param{FormID} ],
    );

    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Counter++;

        # add the info
        push(
            @Data,
            {
                ContentID   => $Row[3],
                ContentType => $Row[1],
                Filename    => $Row[0],
                Filesize    => $Row[2],
                Disposition => $Row[4],
                FileID      => $Counter,
            }
        );
    }
    return \@Data;
}

sub FormIDCleanUp {
    my ( $Self, %Param ) = @_;

    # check for draft dependency within cache
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $FormDraftTTL = $ConfigObject->Get('FormDraftTTL');

    my @FormDrafts;
    my $FormDraftObject = $Kernel::OM->Get('Kernel::System::FormDraft');
    for my $ObjectType ( sort keys %{$FormDraftTTL} ) {
        my $FormDraftList = $FormDraftObject->FormDraftListGet(
            ObjectType => $ObjectType,
            UserID     => 1,
        );

        FORMDRAFT:
        for my $FormDraft ( @{$FormDraftList} ) {
            my $FormDraftConfig = $FormDraftObject->FormDraftGet(
                FormDraftID => $FormDraft->{FormDraftID},
                UserID      => 1,
            );

            next FORMDRAFT if !IsHashRefWithData($FormDraftConfig);
            my $FormID = $FormDraftConfig->{FormData}->{FormID};

            next FORMDRAFT if !$Self->_FormIDValidate($FormID);

            # if TTL configuration is missing, use the default
            next FORMDRAFT if !$FormDraftTTL->{$ObjectType};

            # form draft TTL config for specific object type is given in minutes
            my $CurrentTime = time() - ( $FormDraftTTL->{$ObjectType} * 60 );

            return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => '
                    DELETE FROM web_upload_cache
                    WHERE create_time_unix < ?
                    AND form_id = ?',
                Bind => [ \$CurrentTime, \$FormID ],
            );

            push @FormDrafts, $FormID;
        }
    }

    my $CurrentTime = time() - ( 60 * 60 * 24 * 1 );

    my $SQL = 'DELETE FROM web_upload_cache
            WHERE create_time_unix < ?';

    # do not include upload cache object type if has defined custom TTL value
    if (@FormDrafts) {
        my @SeparatedFormDrafts = map {"'$_'"} @FormDrafts;
        $SQL .= ' AND form_id NOT IN (' . join( ',', @SeparatedFormDrafts ) . ')';
    }

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => $SQL,
        Bind => [ \$CurrentTime ],
    );

    return 1;
}

sub _FormIDValidate {
    my ( $Self, $FormID ) = @_;

    return if !$FormID;

    if ( $FormID !~ m{^ \d+ \. \d+ \. \d+ $}xms ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid FormID!',
        );
        return;
    }

    return 1;
}

1;
