# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Digest::MD5 qw(md5_hex);

# get needed objects
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');
my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

for my $Module (qw(DB FS)) {

    # make sure that the $UploadCacheObject gets recreated for each loop.
    $Kernel::OM->ObjectsDiscard( Objects => ['Kernel::System::Web::UploadCache'] );

    $ConfigObject->Set(
        Key   => 'WebUploadCacheModule',
        Value => "Kernel::System::Web::UploadCache::$Module",
    );

    # get a new upload cache object
    my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

    my $FormID = $UploadCacheObject->FormIDCreate();

    $Self->True(
        $FormID,
        "#$Module - FormIDCreate()",
    );

    my $InvalidFormID = $HelperObject->GetRandomID();

    # file checks
    for my $FileExtension (qw(xls txt doc png pdf)) {

        my $Location = $ConfigObject->Get('Home')
            . "/scripts/test/sample/WebUploadCache/WebUploadCache-Test1.$FileExtension";
        my $ContentRef = $MainObject->FileRead(
            Location => $Location,
            Mode     => 'binmode',
        );
        my $Content = ${$ContentRef};
        $EncodeObject->EncodeOutput( \$Content );

        my $MD5         = md5_hex($Content);
        my $ContentID   = $HelperObject->GetRandomID();
        my $Disposition = 'inline';

        if ( $FileExtension eq 'txt' ) {
            $ContentID   = undef;
            $Disposition = 'attachment';
        }

        my $Add = $UploadCacheObject->FormIDAddFile(
            FormID      => $FormID,
            Content     => $Content,
            ContentType => 'text/html',
            ContentID   => $ContentID,
            Disposition => $Disposition,

            # path traversal fix, see internal GitLab issue 851
            Filename => '../../../test/UploadCache Test1äöüß.' . $FileExtension,
        );

        # formatted filename by FilenameCleanUp()
        my $ExpectedFilename = "UploadCache Test1äöüß.$FileExtension";

        $Self->True(
            $Add || '',
            "#$Module - FormIDAddFile() - ." . $FileExtension,
        );

        if ( $Module eq 'FS' ) {
            my $Add = $UploadCacheObject->FormIDAddFile(
                FormID      => $InvalidFormID,
                Filename    => 'UploadCache Test1äöüß.' . $FileExtension,
                Content     => $Content,
                ContentType => 'text/html',
                ContentID   => $ContentID,
                Disposition => $Disposition,
            );

            $Self->False(
                $Add // 0,
                "#$Module - FormIDAddFile() - Invalid FormID"
            );
        }

        my @Data = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $FormID,
        );
        if (@Data) {
            my %File = %{ $Data[-1] };

            $Self->Is(
                $File{ContentID},
                $ContentID,
                "#$Module - FormIDGetAllFilesData() - ContentID ." . $FileExtension,
            );

            $Self->Is(
                $File{Filename},
                $ExpectedFilename,
                "#$Module - FormIDGetAllFilesData() - Filename ." . $FileExtension,
            );
            $Self->True(
                $File{Content} eq $Content,
                "#$Module - FormIDGetAllFilesData() - Content ." . $FileExtension,
            );
            $EncodeObject->EncodeOutput( \$File{Content} );
            my $MD5New = md5_hex( $File{Content} );
            $Self->Is(
                $MD5New || '',
                $MD5    || '',
                "#$Module - md5 check",
            );
            $Self->True(
                $File{Disposition} eq $Disposition,
                "#$Module - FormIDGetAllFilesData() - Disposition ." . $FileExtension,
            );
        }
        @Data = $UploadCacheObject->FormIDGetAllFilesMeta( FormID => $FormID );
        if (@Data) {
            my %File = %{ $Data[-1] };
            $Self->Is(
                $File{ContentID},
                $ContentID,
                "#$Module - FormIDGetAllFilesMeta() - ContentID ." . $FileExtension,
            );

            $Self->Is(
                $File{Filename},
                $ExpectedFilename,
                "#$Module - FormIDGetAllFilesMeta() - Filename ." . $FileExtension,
            );
            $Self->True(
                $File{Disposition} eq $Disposition,
                "#$Module - FormIDGetAllFilesMeta() - Disposition ." . $FileExtension,
            );
        }

        if ( $Module eq 'FS' ) {
            my $Delete = $UploadCacheObject->FormIDRemoveFile(
                FormID => $InvalidFormID,
                FileID => 1,
            );

            $Self->False(
                $Delete // 0,
                "#$Module - FormIDRemoveFile() - Invalid FormID"
            );
        }

        my $Delete = $UploadCacheObject->FormIDRemoveFile(
            FormID => $FormID,
            FileID => 1,
        );
        $Self->True(
            $Delete || '',
            "#$Module - FormIDRemoveFile() - ." . $FileExtension,
        );
    }

    # file checks without ContentID
    for my $FileExtension (qw(xls txt doc png pdf)) {
        my $Location = $ConfigObject->Get('Home')
            . "/scripts/test/sample/WebUploadCache/WebUploadCache-Test1.$FileExtension";
        my $ContentRef = $MainObject->FileRead(
            Location => $Location,
            Mode     => 'binmode',
        );

        my $Content = ${$ContentRef};
        $EncodeObject->EncodeOutput( \$Content );
        my $MD5         = md5_hex($Content);
        my $Disposition = 'inline';
        if ( $FileExtension eq 'txt' ) {
            $Disposition = 'attachment';
        }
        my $Add = $UploadCacheObject->FormIDAddFile(
            FormID      => $FormID,
            Filename    => 'UploadCache Test1äöüß.' . $FileExtension,
            Content     => $Content,
            ContentType => 'text/html',
            Disposition => $Disposition,
        );

        # formatted filename by FilenameCleanUp()
        my $ExpectedFilename = "UploadCache Test1äöüß.$FileExtension";

        $Self->True(
            $Add || '',
            "#$Module - FormIDAddFile() - ." . $FileExtension,
        );

        if ( $Module eq 'FS' ) {
            my @Data = $UploadCacheObject->FormIDGetAllFilesData(
                FormID => $InvalidFormID,
            );

            $Self->False(
                @Data // 0,
                "#$Module - FormIDGetAllFilesData() - Invalid FormID"
            );
        }

        my @Data = $UploadCacheObject->FormIDGetAllFilesData(
            FormID => $FormID,
        );
        if (@Data) {
            my %File = %{ $Data[-1] };

            $Self->Is(
                $File{Filename},
                $ExpectedFilename,
                "#$Module - FormIDGetAllFilesData() - Filename ." . $FileExtension,
            );
            $Self->True(
                $File{Content} eq $Content,
                "#$Module - FormIDGetAllFilesData() - Content ." . $FileExtension,
            );
            $EncodeObject->EncodeOutput( \$File{Content} );
            my $MD5New = md5_hex( $File{Content} );
            $Self->Is(
                $MD5New || '',
                $MD5    || '',
                "#$Module - md5 check",
            );
            $Self->Is(
                $File{Disposition},
                $Disposition,
                "#$Module - FormIDGetAllFilesData() - Disposition ." . $FileExtension,
            );
        }

        if ( $Module eq 'FS' ) {
            my @Data = $UploadCacheObject->FormIDGetAllFilesMeta(
                FormID => $InvalidFormID,
            );

            $Self->False(
                @Data // 0,
                "#$Module - FormIDGetAllFilesMeta() - Invalid FormID"
            );
        }

        @Data = $UploadCacheObject->FormIDGetAllFilesMeta( FormID => $FormID );
        if (@Data) {
            my %File = %{ $Data[-1] };
            $Self->Is(
                $File{Filename},
                $ExpectedFilename,
                "#$Module - FormIDGetAllFilesMeta() - Filename ." . $FileExtension,
            );
            $Self->True(
                $File{Disposition} eq $Disposition,
                "#$Module - FormIDGetAllFilesMeta() - Disposition ." . $FileExtension,
            );
        }
        my $Delete = $UploadCacheObject->FormIDRemoveFile(
            FormID => $FormID,
            FileID => 1,
        );
        $Self->True(
            $Delete || '',
            "#$Module - FormIDRemoveFile() - ." . $FileExtension,
        );
    }

    my $Remove = $UploadCacheObject->FormIDRemove( FormID => $FormID );

    $Self->True(
        $Remove,
        "#$Module - FormIDRemove()",
    );

    if ( $Module eq 'FS' ) {
        my $Remove = $UploadCacheObject->FormIDRemove( FormID => $InvalidFormID );

        $Self->False(
            $Remove // 0,
            "#$Module - FormIDRemove() - Invalid FormID"
        );
    }
}

1;
