# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminSystemFiles;

use strict;
use warnings;

use Kernel::System::WebUserAgent;
use Kernel::Language qw(Translatable);
use Text::Diff::FormattedHTML;
use Kernel::System::VariableCheck qw(:all);
use File::stat;

use Cwd 'abs_path';

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Cache',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Package',
    'Kernel::System::SupportBundleGenerator',
    'Kernel::System::Time',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{CacheType} = 'AdminSystemFiles';
    $Self->{CacheTTL}  = 60 * 60 * 24;

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');

    my @ParamNames = $ParamObject->GetParamNames();

    for my $Value (@ParamNames) {
        $Param{$Value} = $ParamObject->GetParam( Param => $Value ) || '';
    }

    $Param{CacheDate} = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => 'CacheDate',
    );

    if ( !$Param{CacheDate} ) {
        $Param{CacheDate} = $TimeObject->CurrentTimestamp();
        $CacheObject->Set(
            Type  => $Self->{CacheType},
            TTL   => $Self->{CacheTTL},
            Key   => 'CacheDate',
            Value => $Param{CacheDate},
        );
    }

    my $IsZnunyFile = $Self->_IsZnunyFile(
        File => $Param{File}
    );

    if ( $Param{File} && !$IsZnunyFile ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('File or Directory not found.'),
        );
    }

    if ( !$Param{File} ) {
        $LayoutObject->Block(
            Name => 'Sidebar',
        );
        $LayoutObject->Block(
            Name => 'Filter',
            Data => {
                %Param
            },
        );
    }

    $LayoutObject->AddJSOnDocumentCompleteIfNotExists(
        Key  => 'AdminSystemFiles.InitTableFilter',
        Code => '
            Core.UI.Table.InitTableFilter($("#FilterFiles"), $(".Files"),2,1);
            $("#FilterFiles").focus();
        ',
    );

    if ( $Self->{Subaction} eq 'CacheDelete' ) {

        # delete cache
        $CacheObject->CleanUp(
            Type => $Self->{CacheType},
        );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action}"
        );
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminSystemFiles',
        Data         => {
            %Param,
        }
    );

    if ( $Self->{Subaction} eq 'ViewFile' ) {
        $Output .= $Self->_ViewFile(%Param);
    }
    else {
        $Output .= $Self->_ShowOverview();
    }

    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _ShowOverview {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Output;
    my @Files = $Self->GetFiles();

    for my $Widget (qw(Custom Changed Package)) {
        my @Files = grep { $Widget eq $_->{Type} } @Files;

        $Output .= $Self->_ShowFilesWidget(
            Files  => \@Files,
            Widget => $Widget,
        );
    }

    return $Output;
}

sub _ViewFile {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(File)) {

        next NEEDED if defined $Param{$Needed};
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    $Self->PackageFiles( Cache => 0 );

    my $Content = $MainObject->FileRead(
        Location => $Param{File},
    );

    my %FileDetails = $Self->FileDetails(
        File     => $Param{File},
        Type     => $Param{Type},
        Extended => 1,
    );

    KEY:
    for my $Key (qw(Name Path FullPath User Group Created Changed  )) {
        next KEY if !$FileDetails{$Key};

        $LayoutObject->Block(
            Name => 'FileDetails',
            Data => {
                Key   => $Key,
                Value => $FileDetails{$Key},
            },
        );
    }
    KEY:
    for my $Key (qw(Type Package State StateMessage Permissions MD5 OriginalMD5)) {
        next KEY if !$FileDetails{$Key};
        if ( $Key eq 'Type' ) {
            $FileDetails{$Key} = $Self->{Files}->{ $FileDetails{FullPath} }->{Type} || $FileDetails{$Key};
        }
        $LayoutObject->Block(
            Name => 'FileDetailsExtended',
            Data => {
                Key   => $Key,
                Value => $FileDetails{$Key},
            },
        );
    }

    if ( $FileDetails{Diff} ) {
        $LayoutObject->Block(
            Name => 'FileDiff',
            Data => {
                File    => $FileDetails{Name},
                Content => $FileDetails{Diff},
            },
        );
    }

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AdminSystemFiles/File',
        Data         => {
            File    => $FileDetails{Name},
            Content => $Content ? ${$Content} : '',
        },
    );

    return $Output;
}

sub _ShowFilesWidget {
    my ( $Self, %Param ) = @_;

    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

    my @Files = @{ $Param{Files} };

    if ( $Param{Widget} eq 'Package' ) {

        # for each package generate own widget
        my %Packages = map { $_->{Package} => 1 } @Files;

        for my $Package ( sort keys %Packages ) {
            my @Files = grep { $Package eq $_->{Package} } @Files;

            my $TranslatedWidgetName = $LanguageObject->Translate( 'Package files - %s', $Package );

            $LayoutObject->Block(
                Name => 'Widget',
                Data => {
                    Name   => $TranslatedWidgetName,
                    Widget => $Param{Widget},
                },
            );

            for my $File (@Files) {
                $LayoutObject->Block(
                    Name => 'File',
                    Data => {
                        Widget => $Param{Widget},
                        %{$File}
                    },
                );
            }
        }
    }
    else {

        my $Hint;
        if ( $Param{Widget} eq 'Changed' ) {
            $Hint = $LanguageObject->Translate(
                '(Files where only the permissions have been changed will not be displayed.)'
            );
        }
        $LayoutObject->Block(
            Name => 'Widget',
            Data => {
                Name   => $Param{Widget} . ' files',
                Hint   => $Hint,
                Widget => $Param{Widget},
            },
        );

        for my $File (@Files) {
            if (
                $Self->{Files}->{ $File->{FullPath} }->{Package}
                && $Self->{Files}->{ $File->{FullPath} }->{State} ne 'OK'
                )
            {
                $File->{Type} = 'Package';
            }

            $LayoutObject->Block(
                Name => 'File',
                Data => {
                    Widget => $Param{Widget},
                    %{$File},
                },
            );
        }
    }

    my $Output = $LayoutObject->Output(
        TemplateFile => 'AdminSystemFiles/Widget',
    );

    return $Output;
}

=head2 GetFiles()

returns all custom, package and changed files.

    my @Files = $Object->GetFiles();

Returns:

    my @Files = (
        {
            'StateMessage' => 'OK',
            'Path'         => 'Kernel/Config/Files/XML/Custom.xml',
            'Type'         => 'Package',
            'Group'        => 'www-data',
            'User'         => 'staff',
            'Name'         => 'Custom.xml',
            'Permissions'  => '0660',
            'State'        => 'OK',
            'Package'      => 'Custom',
            'FullPath'     => '/workspace/znuny/znuny_70New/Kernel/Config/Files/XML/Custom.xml',
            'Created'      => '2019-10-28 09:36:03',
            'Changed'      => '2019-10-28 09:36:03'
        },
        {
            'StateMessage' => 'OK',
            'Path'         => 'Custom/Kernel/System/Ticket.pm',
            'Type'         => 'Custom',
            'Group'        => 'www-data',
            'User'         => 'staff',
            'Name'         => 'Ticket.pm',
            'Permissions'  => '0660',
            'State'        => 'OK',
            'FullPath'     => '/workspace/znuny/znuny_70New/Custom/Kernel/System/Ticket.pm',
            'Created'      => '2019-10-28 09:36:03',
            'Changed'      => '2019-10-28 09:36:03'
        },
        ...
    );

=cut

sub GetFiles {
    my ( $Self, %Param ) = @_;

    my @Files;
    push @Files, $Self->PackageFiles();
    push @Files, $Self->CustomFiles();
    push @Files, $Self->ChangedFiles();

    return @Files;
}

=head2 PackageFiles()

returns all package files.

    my @PackageFiles = $Object->PackageFiles();

Returns:

    my @PackageFiles = (
        {
            'StateMessage' => 'OK',
            'Path'         => 'Kernel/Config/Files/XML/Custom.xml',
            'Type'         => 'Package',
            'Group'        => 'www-data',
            'User'         => 'staff',
            'Name'         => 'Custom.xml',
            'Permissions'  => '0660',
            'State'        => 'OK',
            'Package'      => 'Custom',
            'FullPath'     => '/workspace/znuny/znuny_70New/Kernel/Config/Files/XML/Custom.xml',
            'Created'      => '2019-10-28 09:36:03',
            'Changed'      => '2019-10-28 09:36:03'
        },
        ...
    );

=cut

sub PackageFiles {
    my ( $Self, %Param ) = @_;

    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $CacheObject   = $Kernel::OM->Get('Kernel::System::Cache');

    my $CacheKey = 'PackageFiles';
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );

    $Param{Cache} //= 1;
    return @{$Cache} if IsArrayRefWithData($Cache) && $Param{Cache};

    my $Home = $ConfigObject->Get('Home');

    my @RepositoryList = $PackageObject->RepositoryList(
        Result => 'short',
    );

    my @PackageFiles;
    for my $Repository (@RepositoryList) {

        # deploy check
        my $Deployed = $PackageObject->DeployCheck(
            %{$Repository},
            Log => 0,
        );
        my %DeployInfo = $PackageObject->DeployCheckInfo();

        my $PackageFile = $PackageObject->PackageFileGetMD5Sum(
            %{$Repository},
        );

        for my $File ( sort keys %{$PackageFile} ) {
            $File =~ s{\/\/}{/}smxg;
            my $RelativPath = $File;
            $RelativPath =~ s{$Home\/}{}smxg;

            my %FileDetails = $Self->FileDetails(
                File => $File,
                Type => 'Package',
            );

            $FileDetails{Package}      = $Repository->{Name};
            $FileDetails{State}        = 'OK';
            $FileDetails{StateMessage} = 'OK';
            if ( IsHashRefWithData( $DeployInfo{File} ) && $DeployInfo{File}->{$RelativPath} ) {
                $FileDetails{State}        = 'Problem';
                $FileDetails{StateMessage} = 'File is different!';
            }

            $Self->{Files}->{$File} = \%FileDetails;

            push @PackageFiles, {
                %FileDetails,
            };
        }
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@PackageFiles,
    );

    return @PackageFiles;
}

=head2 CustomFiles()

returns all custom files.

    my @CustomFiles = $Object->CustomFiles();

Returns:

    my @CustomFiles = (
        {
            'StateMessage' => 'OK',
            'Path'         => 'Custom/Kernel/System/Ticket.pm',
            'Type'         => 'Custom',
            'Group'        => 'www-data',
            'User'         => 'staff',
            'Name'         => 'Ticket.pm',
            'Permissions'  => '0660',
            'State'        => 'OK',
            'FullPath'     => '/workspace/znuny/znuny_70New/Custom/Kernel/System/Ticket.pm',
            'Created'      => '2019-10-28 09:36:03',
            'Changed'      => '2019-10-28 09:36:03'
        },
        ...
    );

=cut

sub CustomFiles {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');

    my $CacheKey = 'CustomFiles';
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );

    return @{$Cache} if IsArrayRefWithData($Cache);

    my $Home = $ConfigObject->Get('Home');

    my @Files = $MainObject->DirectoryRead(
        Directory => $Home . '/Custom/',
        Filter    => '*.*',
        Recursive => 1,
    );

    my @CustomFiles;
    for my $File (@Files) {
        $File =~ s{\/\/}{/}smxg;
        my %FileDetails = $Self->FileDetails(
            File => $File,
            Type => 'Custom',
        );

        $Self->{Files}->{$File} = \%FileDetails;

        push @CustomFiles, \%FileDetails;
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@CustomFiles,
    );

    return @CustomFiles;
}

=head2 ChangedFiles()

returns all changed files.

    my @ChangedFiles = $Object->ChangedFiles();

Returns:

    my @ChangedFiles = (
        {
            'StateMessage' => 'OK',
            'Path'         => 'Kernel/Config.pm',
            'Type'         => 'Changed',
            'Group'        => 'www-data',
            'User'         => 'staff',
            'Name'         => 'Ticket.pm',
            'Permissions'  => '0660',
            'State'        => 'OK',
            'FullPath'     => '/workspace/znuny/znuny_70New/Kernel/Config.pm',
            'Created'      => '2019-10-28 09:36:03',
            'Changed'      => '2019-10-28 09:36:03'
        },
        ...
    );

=cut

sub ChangedFiles {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');

    my $CacheKey = 'ChangedFiles';
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return @{$Cache} if IsArrayRefWithData($Cache);

    my $SupportBundleGeneratorObject = $Kernel::OM->Get('Kernel::System::SupportBundleGenerator');

    my @ChangedFiles;

    my $Home = $ConfigObject->Get('Home');

    $SupportBundleGeneratorObject->{MD5SumLookup} = $SupportBundleGeneratorObject->_GetMD5SumLookup();
    my @List = $SupportBundleGeneratorObject->_GetCustomFileList( Directory => $Home );

    CHANGEDFILE:
    for my $File (@List) {
        next CHANGEDFILE if $Self->{Files}->{$File} && $Self->{Files}->{$File}->{Type} eq 'Package';
        next CHANGEDFILE if $Self->{Files}->{$File} && $Self->{Files}->{$File}->{Type} eq 'Custom';

        $File =~ s{\/\/}{/}smxg;
        my %FileDetails = $Self->FileDetails(
            File => $File,
            Type => 'Changed',
        );

        $Self->{Files}->{$File} = \%FileDetails;

        push @ChangedFiles, \%FileDetails;

    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@ChangedFiles,
    );

    return @ChangedFiles;
}

sub FileDetails {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TimeObject   = $Kernel::OM->Get('Kernel::System::Time');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    my $Home = $ConfigObject->Get('Home');
    my $File = $Param{File};

    my $Stat        = stat($File);
    my $Changed     = $Stat ? $Stat->mtime() : '';
    my $Created     = $Stat ? $Stat->ctime() : '';
    my $Mode        = $Stat ? $Stat->mode() : '';
    my $Permissions = $Stat ? ( sprintf '%04o', $Mode & 07777 ) : '';    ## no critic
    my $User        = $Stat ? getgrgid( $Stat->gid ) : '';               ## no critic
    my $Group       = $Stat ? getpwuid( $Stat->uid ) : '';               ## no critic
    my $FullPath    = $File;
    my $FileName    = $File;

    $FileName =~ s{.+\/(.*)}{$1}smxg;
    $File     =~ s{$Home\/}{}smxg;

    my $ChangedTimeStamp = $Stat
        ? $TimeObject->SystemTime2TimeStamp(
        SystemTime => $Changed,
        )
        : '';

    my $CreatedTimeStamp = $Stat
        ? $TimeObject->SystemTime2TimeStamp(
        SystemTime => $Created,
        )
        : '';

    my %FileDetails = (
        Type         => $Param{Type},
        FullPath     => $FullPath,
        Path         => $File,
        Name         => $FileName,
        Changed      => $ChangedTimeStamp,
        Created      => $CreatedTimeStamp,
        User         => $User,
        Group        => $Group,
        Permissions  => $Permissions,
        Package      => $Self->{Files}->{$FullPath}->{Package} || '',
        State        => $Stat ? ( $Self->{Files}->{$FullPath}->{State} || 'Warning' ) : 'Missing or not readable',
        StateMessage => $Self->{Files}->{$FullPath}->{StateMessage} || 'Unknown',
    );

    return %FileDetails if !$Param{Extended} || !$Stat;

    my %Extended = $Self->FileDetailsExtended(
        %Param,
        %FileDetails,
    );
    %FileDetails = (
        %FileDetails,
        %Extended
    );

    return %FileDetails;
}

sub FileDetailsExtended {
    my ( $Self, %Param ) = @_;

    my $MainObject    = $Kernel::OM->Get('Kernel::System::Main');
    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $CacheObject   = $Kernel::OM->Get('Kernel::System::Cache');

    my $CacheKey = 'FileDetailsExtended::' . $Param{FullPath};
    my $Cache    = $CacheObject->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );

    #     return %{$Cache} if IsHashRefWithData($Cache);

    my %Extended;

    my $Content = $MainObject->FileRead(
        Location => $Param{FullPath},
    );

    $Extended{MD5} = $MainObject->MD5sum(
        String => $Content,
    );

    my $OriginalPath = $Param{FullPath};

    $Param{Type} //= 'Package';

    if ( $Param{Type} eq 'Package' ) {

        my @RepositoryList = $PackageObject->RepositoryList(

            # will only return name, version, install_status md5sum and vendorinstead of the structure
            Result => 'short',
        );

        my %Repository = map { $_->{Name} => $_->{Version} } @RepositoryList;

        my $Package = $PackageObject->RepositoryGet(
            Name    => $Param{Package},
            Version => $Repository{ $Param{Package} },
            Result  => 'SCALAR',
        );

        my %Structure = $PackageObject->PackageParse( String => $Package );

        my $OriginalContent = '';
        if ( ref $Structure{Filelist} eq 'ARRAY' ) {
            for my $Hash ( @{ $Structure{Filelist} } ) {
                if ( $Hash->{Location} eq $Param{Path} ) {
                    $OriginalContent = $Hash->{Content};
                }
            }
        }

        $Extended{OriginalMD5} = $MainObject->MD5sum(
            String => $OriginalContent,
        );

        my $CurrentContent = $MainObject->FileRead(
            Location => $Param{FullPath},
        );

        if ( $Extended{MD5} ne $Extended{OriginalMD5} ) {
            $MainObject->Require('Text::Diff::FormattedHTML');
            $Extended{Diff} = diff_strings( $OriginalContent, $$CurrentContent );
        }

    }
    elsif ( $Param{Type} eq 'Custom' ) {

        $OriginalPath =~ s{Custom\/}{}smxg;

        if ( !-e $OriginalPath ) {
            $Extended{State}        = 'Problem';
            $Extended{StateMessage} = 'Original file not exists.';
            $Extended{OriginalMD5}  = 'Original file not exists.';
            return %Extended;
        }

        my $OriginalContent = $MainObject->FileRead(
            Location => $OriginalPath,
        );
        $Extended{OriginalMD5} = $MainObject->MD5sum(
            String => $OriginalContent,
        );

        if ( $Extended{MD5} ne $Extended{OriginalMD5} ) {
            $MainObject->Require('Text::Diff::FormattedHTML');
            $Extended{Diff} = diff_files( $OriginalPath, $Param{FullPath} );
        }
    }
    elsif ( $Param{Type} eq 'Changed' ) {

        # e.g. 6.4.2
        my $Version = $ConfigObject->Get('Version');

        $Version =~ s{\.x\z}{}i;     # 6.4.x => 6.4 (latest)
        $Version =~ s{\.}{_}smxg;    # 6.4.2 => 6_4_2
        $Version = 'rel-' . $Version;    # 6_4_2 => rel-6_4_2

        my $WebUserAgentObject = Kernel::System::WebUserAgent->new(
            Timeout => 15,
        );

        #  e.g.: https://raw.githubusercontent.com/znuny/znuny/rel-6_5/Kernel/GenericInterface/Event/Handler.pm
        my $URL      = "https://raw.githubusercontent.com/znuny/znuny/" . $Version . "/" . $Param{Path};
        my %Response = $WebUserAgentObject->Request(
            URL   => $URL,
            NoLog => 1,
        );

        if ( $Response{Status} eq '200 OK' && $Response{Content} ) {
            $Extended{OriginalMD5} = $MainObject->MD5sum(
                String => $Response{Content},
            );

            if ( $Extended{MD5} ne $Extended{OriginalMD5} ) {
                $MainObject->Require('Text::Diff::FormattedHTML');
                $Extended{Diff} = diff_strings( ${ $Response{Content} }, $$Content );
            }
        }
    }

    $CacheObject->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Extended,
    );

    return %Extended;
}

sub _IsZnunyFile {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    return if !IsStringWithData( $Param{File} );

    my $AbsoluteFilePath = abs_path( $Param{File} );

    # Use absolute path of configured home directory to be able
    # to compare with potential symbolic links.
    my $Home = abs_path( $ConfigObject->Get('Home') );

    return if $AbsoluteFilePath !~ m{\A\Q$Home\E};

    return 1;
}

1;
