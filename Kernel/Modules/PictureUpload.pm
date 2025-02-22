# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::PictureUpload;

use strict;
use warnings;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $Charset      = $LayoutObject->{UserCharset};

    # get params
    my $ParamObject     = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $FormID          = $ParamObject->GetParam( Param => 'FormID' );
    my $CKEditorFuncNum = $ParamObject->GetParam( Param => 'CKEditorFuncNum' ) || 0;
    my $ResponseType    = $ParamObject->GetParam( Param => 'responseType' ) // 'json';

    # return if no form id exists
    if ( !$FormID ) {
        $LayoutObject->Block(
            Name => 'ErrorNoFormID',
            Data => {
                CKEditorFuncNum => $CKEditorFuncNum,
            },
        );
        return $LayoutObject->Attachment(
            ContentType => 'text/html; charset=' . $Charset,
            Content     => $LayoutObject->Output( TemplateFile => 'PictureUpload' ),
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    # deliver file form for display inline content
    my $ContentID = $ParamObject->GetParam( Param => 'ContentID' );
    if ($ContentID) {

        # return image inline
        my @AttachmentData = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $FormID,
        );
        ATTACHMENT:
        for my $Attachment (@AttachmentData) {
            next ATTACHMENT if !$Attachment->{ContentID};
            next ATTACHMENT if $Attachment->{ContentID} ne $ContentID;

            if (
                $Attachment->{Filename} !~ /\.(png|gif|jpg|jpeg|bmp)$/i
                || substr( $Attachment->{ContentType}, 0, 6 ) ne 'image/'
                )
            {
                $LayoutObject->Block(
                    Name => 'ErrorNoImageFile',
                    Data => {
                        CKEditorFuncNum => $CKEditorFuncNum,
                    },
                );
                return $LayoutObject->Attachment(
                    ContentType => 'text/html; charset=' . $Charset,
                    Content     => $LayoutObject->Output( TemplateFile => 'PictureUpload' ),
                    Type        => 'inline',
                    NoCache     => 1,
                );
            }

            if ( $Attachment->{ContentType} =~ /xml/i ) {

                # Strip out file content first, escaping script tag.
                my %SafetyCheckResult = $Kernel::OM->Get('Kernel::System::HTMLUtils')->Safety(
                    String       => $Attachment->{Content},
                    NoApplet     => 1,
                    NoObject     => 1,
                    NoEmbed      => 1,
                    NoSVG        => 0,
                    NoIntSrcLoad => 0,
                    NoExtSrcLoad => 0,
                    NoJavaScript => 1,
                    Debug        => $Self->{Debug},
                );

                $Attachment->{Content} = $SafetyCheckResult{String};
            }

            return $LayoutObject->Attachment(
                Type => 'inline',
                %{$Attachment},
            );
        }
    }

    # get uploaded file
    my %File = $ParamObject->GetUploadAll(
        Param => 'upload',
    );

    # return error if no file is there
    if ( !%File ) {
        $LayoutObject->Block(
            Name => 'ErrorNoFileFound',
            Data => {
                CKEditorFuncNum => $CKEditorFuncNum,
            },
        );
        return $LayoutObject->Attachment(
            ContentType => 'text/html; charset=' . $Charset,
            Content     => $LayoutObject->Output( TemplateFile => 'PictureUpload' ),
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # return error if file is not possible to show inline
    if ( $File{Filename} !~ /\.(png|gif|jpg|jpeg|bmp)$/i || substr( $File{ContentType}, 0, 6 ) ne 'image/' ) {
        $LayoutObject->Block(
            Name => 'ErrorNoImageFile',
            Data => {
                CKEditorFuncNum => $CKEditorFuncNum,
            },
        );
        return $LayoutObject->Attachment(
            ContentType => 'text/html; charset=' . $Charset,
            Content     => $LayoutObject->Output( TemplateFile => 'PictureUpload' ),
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    if ( $File{ContentType} =~ /xml/i ) {

        # Strip out file content first, escaping script tag.
        my %SafetyCheckResult = $Kernel::OM->Get('Kernel::System::HTMLUtils')->Safety(
            String       => $File{Content},
            NoApplet     => 1,
            NoObject     => 1,
            NoEmbed      => 1,
            NoSVG        => 0,
            NoIntSrcLoad => 0,
            NoExtSrcLoad => 0,
            NoJavaScript => 1,
            Debug        => $Self->{Debug},
        );

        $File{Content} = $SafetyCheckResult{String};
    }

    # Protect against file name collisions by adding random prefix.
    $File{Filename} = 'inline'
        . $Kernel::OM->Get('Kernel::System::Main')->GenerateRandomString( Length => 16 )
        . '-'
        . $File{Filename};

    # Clean up filename for name in ContentType; for FormIDAddFile we pass filename without
    # cleaning it up (need original filename and will clean it up independently).
    my $FilenameCleanedUp = $Kernel::OM->Get('Kernel::System::Main')->FilenameCleanUp(
        Filename => $File{Filename},
    );

    # add uploaded file to upload cache
    $UploadCacheObject->FormIDAddFile(
        FormID      => $FormID,
        Filename    => $File{Filename},
        Content     => $File{Content},
        ContentType => $File{ContentType} . '; name="' . $FilenameCleanedUp . '"',
        Disposition => 'inline',
    );

    # Get new content id and update filename after possible cleanup in FormIDAddFile().
    my $ContentIDNew = '';
    my @AttachmentMeta = $UploadCacheObject->FormIDGetAllFilesMeta(
        FormID => $FormID
    );
    ATTACHMENT:
    for my $Attachment (@AttachmentMeta) {
        next ATTACHMENT if ($File{Filename} ne $Attachment->{Filename})
            && !(defined($Attachment->{FilenameOrig}) && ($File{Filename} eq $Attachment->{FilenameOrig}));
        $File{Filename} = $Attachment->{Filename};
        $ContentIDNew = $Attachment->{ContentID};
        last ATTACHMENT;
    }

    # serve new content id and url to rte
    my $Session = '';
    if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
        $Session = ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
    }
    my $URL = $LayoutObject->{Baselink}
        . "Action=PictureUpload;FormID=$FormID;ContentID=$ContentIDNew$Session";

    # if ResponseType is JSON, do not return template content but a JSON structure
    if ( $ResponseType eq 'json' ) {
        my %Result = (
            fileName => $File{Filename},
            uploaded => 1,
            url      => $URL,
        );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $Charset,
            Content     => $LayoutObject->JSONEncode( Data => \%Result ),
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    $LayoutObject->Block(
        Name => 'Success',
        Data => {
            CKEditorFuncNum => $CKEditorFuncNum,
            URL             => $URL,
        },
    );
    return $LayoutObject->Attachment(
        ContentType => 'text/html; charset=' . $Charset,
        Content     => $LayoutObject->Output( TemplateFile => 'PictureUpload' ),
        Type        => 'inline',
        NoCache     => 1,
    );
}

1;
