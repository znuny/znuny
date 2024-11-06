# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AdminPackageManager;
## nofilter(TidyAll::Plugin::Znuny::Perl::DBObject)

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

use parent('Kernel::System::AsynchronousExecutor');

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $Source = $Self->{UserRepository} || '';
    my %Errors;

    # ------------------------------------------------------------ #
    # check mod perl version and Apache::Reload
    # ------------------------------------------------------------ #

    if ( exists $ENV{MOD_PERL} ) {
        if ( defined $mod_perl::VERSION ) {    ## no critic
            if ( $mod_perl::VERSION >= 1.99 ) {    ## no critic

                # check if Apache::Reload is loaded
                my $ApacheReload = 0;
                for my $Module ( sort keys %INC ) {
                    $Module =~ s/\//::/g;
                    $Module =~ s/\.pm$//g;
                    if ( $Module eq 'Apache::Reload' || $Module eq 'Apache2::Reload' ) {
                        $ApacheReload = 1;
                    }
                }
                if ( !$ApacheReload ) {
                    return $LayoutObject->ErrorScreen(
                        Message => Translatable(
                            'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!'
                        ),
                    );
                }
            }
        }
    }

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # secure mode message (don't allow this action until secure mode is enabled)
    if ( !$ConfigObject->Get('SecureMode') ) {
        return $LayoutObject->SecureMode();
    }

    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');
    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $MainObject    = $Kernel::OM->Get('Kernel::System::Main');

    # ------------------------------------------------------------ #
    # view diff file
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'ViewDiff' ) {
        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $Location = $ParamObject->GetParam( Param => 'Location' );

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }
        my %Structure = $PackageObject->PackageParse( String => $Package );
        my $File      = '';
        if ( ref $Structure{Filelist} eq 'ARRAY' ) {
            for my $Hash ( @{ $Structure{Filelist} } ) {
                if ( $Hash->{Location} eq $Location ) {
                    $File = $Hash->{Content};
                }
            }
        }
        my $LocalFile = $ConfigObject->Get('Home') . "/$Location";

        # do not allow to read file with including .. path (security related)
        $LocalFile =~ s/\.\.//g;
        if ( !$File ) {
            $LayoutObject->Block(
                Name => 'FileDiff',
                Data => {
                    Location => $Location,
                    Name     => $Name,
                    Version  => $Version,
                    Diff     => $LayoutObject->{LanguageObject}->Translate( 'No such file %s in package!', $LocalFile ),
                },
            );
        }
        elsif ( !-e $LocalFile ) {
            $LayoutObject->Block(
                Name => 'FileDiff',
                Data => {
                    Location => $Location,
                    Name     => $Name,
                    Version  => $Version,
                    Diff     => $LayoutObject->{LanguageObject}
                        ->Translate( 'No such file %s in local file system!', $LocalFile ),
                },
            );
        }
        elsif ( -e $LocalFile ) {
            my $Content = $MainObject->FileRead(
                Location => $LocalFile,
                Mode     => 'binmode',
            );
            if ($Content) {
                $MainObject->Require('Text::Diff');
                my $Diff = Text::Diff::diff( \$File, $Content, { STYLE => 'OldStyle' } );
                $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Diff );
                $LayoutObject->Block(
                    Name => "FileDiff",
                    Data => {
                        Location => $Location,
                        Name     => $Name,
                        Version  => $Version,
                        Diff     => $Diff,
                    },
                );
            }
            else {
                $LayoutObject->Block(
                    Name => "FileDiff",
                    Data => {
                        Location => $Location,
                        Name     => $Name,
                        Version  => $Version,
                        Diff     => $LayoutObject->{LanguageObject}->Translate( 'Can\'t read %s!', $LocalFile ),
                    },
                );
            }
        }
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # ------------------------------------------------------------ #
    # view package
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'View' ) {
        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $Location = $ParamObject->GetParam( Param => 'Location' );
        my %Frontend;

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        # parse package
        my %Structure = $PackageObject->PackageParse( String => $Package );

        # deploy check
        my $Deployed = $PackageObject->DeployCheck(
            Name    => $Name,
            Version => $Version,
        );
        my %DeployInfo = $PackageObject->DeployCheckInfo();
        $LayoutObject->Block(
            Name => 'Package',
            Data => {
                %Param, %Frontend,
                Name    => $Name,
                Version => $Version,
            },
        );

        my @RepositoryList = $PackageObject->RepositoryList(
            Result => 'short',
        );

        # if visible property is not enable, return error screen
        if (
            defined $Structure{PackageIsVisible}
            && exists $Structure{PackageIsVisible}->{Content}
            && !$Structure{PackageIsVisible}->{Content}
            )
        {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        PACKAGEACTION:
        for my $PackageAction (qw(DownloadLocal Rebuild Reinstall)) {

            if (
                $PackageAction eq 'DownloadLocal'
                && (
                    defined $Structure{PackageIsDownloadable}
                    && exists $Structure{PackageIsDownloadable}->{Content}
                    && !$Structure{PackageIsDownloadable}->{Content}
                )
                )
            {
                next PACKAGEACTION;
            }

            $LayoutObject->Block(
                Name => 'Package' . $PackageAction,
                Data => {
                    %Param,
                    %Frontend,
                    Name    => $Name,
                    Version => $Version,
                },
            );
        }

        # check if file is requested
        if ($Location) {
            if ( ref $Structure{Filelist} eq 'ARRAY' ) {
                for my $Hash ( @{ $Structure{Filelist} } ) {
                    if ( $Hash->{Location} eq $Location ) {
                        return $LayoutObject->Attachment(
                            Filename    => $Location,
                            ContentType => 'application/octet-stream',
                            Content     => $Hash->{Content},
                        );
                    }
                }
            }
        }
        my @DatabaseBuffer;

        # correct any 'dos-style' line endings - http://bugs.otrs.org/show_bug.cgi?id=9838
        ${$Package} =~ s{\r\n}{\n}xmsg;

        # create MD5 sum and add it into existing package structure
        my $MD5sum = $MainObject->MD5sum( String => $Package );

        $Structure{MD5sum} = {
            Tag     => 'MD5sum',
            Content => $MD5sum,
        };

        for my $Key ( sort keys %Structure ) {

            if ( ref $Structure{$Key} eq 'HASH' ) {

                if ( $Key =~ /^(Description|Filelist)$/ ) {
                    $LayoutObject->Block(
                        Name => "PackageItem$Key",
                        Data => {
                            Tag => $Key,
                            %{ $Structure{$Key} }
                        },
                    );
                }
                elsif ( $Key =~ /^Database(Install|Reinstall|Upgrade|Uninstall)$/ ) {

                    for my $Type (qw(pre post)) {
                        for my $Hash ( @{ $Structure{$Key}->{$Type} } ) {
                            if ( $Hash->{TagType} eq 'Start' ) {
                                if ( $Hash->{Tag} =~ /^Table/ ) {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabase",
                                        Data => {
                                            %{$Hash},
                                            TagName => $Key,
                                            Type    => $Type
                                        },
                                    );
                                    push @DatabaseBuffer, $Hash;
                                }
                                else {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabaseSub",
                                        Data => {
                                            %{$Hash},
                                            TagName => $Key,
                                        },
                                    );
                                    push @DatabaseBuffer, $Hash;
                                }
                            }
                            if ( $Hash->{Tag} =~ /^Table/ && $Hash->{TagType} eq 'End' ) {
                                push @DatabaseBuffer, $Hash;
                                my @SQL = $DBObject->SQLProcessor(
                                    Database => \@DatabaseBuffer
                                );
                                my @SQLPost = $DBObject->SQLProcessorPost();
                                push @SQL, @SQLPost;
                                for my $SQL (@SQL) {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabaseSQL",
                                        Data => {
                                            TagName => $Key,
                                            SQL     => $SQL,
                                        },
                                    );
                                }
                                @DatabaseBuffer = ();
                            }
                        }
                    }
                }
                else {
                    $LayoutObject->Block(
                        Name => 'PackageItemGeneric',
                        Data => {
                            Tag => $Key,
                            %{ $Structure{$Key} }
                        },
                    );
                }
            }
            elsif ( ref $Structure{$Key} eq 'ARRAY' ) {

                for my $Hash ( @{ $Structure{$Key} } ) {
                    if ( $Key =~ /^(Description|ChangeLog)$/ ) {
                        $LayoutObject->Block(
                            Name => "PackageItem$Key",
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                    elsif ( $Key =~ /^Code/ ) {
                        $Hash->{Content} = $LayoutObject->Ascii2Html(
                            Text           => $Hash->{Content},
                            HTMLResultMode => 1,
                            NewLine        => 72,
                        );
                        $LayoutObject->Block(
                            Name => "PackageItemCode",
                            Data => {
                                Tag => $Key,
                                %{$Hash}
                            },
                        );
                    }
                    elsif ( $Key =~ /^(Intro)/ ) {
                        if ( $Hash->{Format} && $Hash->{Format} =~ /plain/i ) {
                            $Hash->{Content} = '<pre class="contentbody">' . $Hash->{Content} . '</pre>';
                        }

                        $Hash->{Content} = $Self->_GetSafeString( String => $Hash->{Content} );

                        $LayoutObject->Block(
                            Name => "PackageItemIntro",
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                    elsif ( $Hash->{Tag} =~ /^(File)$/ ) {

                        # add human readable file size
                        if ( defined $Hash->{Size} ) {
                            $Hash->{Size} = $LayoutObject->HumanReadableDataSize(
                                Size => $Hash->{Size},
                            );
                        }

                        $LayoutObject->Block(
                            Name => "PackageItemFilelistFile",
                            Data => {
                                Name    => $Name,
                                Version => $Version,
                                %{$Hash},
                            },
                        );

                        # check if is possible to download files
                        if (
                            !defined $Structure{PackageIsDownloadable}
                            || (
                                defined $Structure{PackageIsDownloadable}->{Content}
                                && $Structure{PackageIsDownloadable}->{Content} eq '1'
                            )
                            )
                        {
                            $LayoutObject->Block(
                                Name => "PackageItemFilelistFileLink",
                                Data => {
                                    Name    => $Name,
                                    Version => $Version,
                                    %{$Hash},
                                },
                            );
                        }

                        if ( $DeployInfo{File}->{ $Hash->{Location} } ) {
                            if ( $DeployInfo{File}->{ $Hash->{Location} } =~ /different/ ) {
                                $LayoutObject->Block(
                                    Name => "PackageItemFilelistFileNoteDiff",
                                    Data => {
                                        Name    => $Name,
                                        Version => $Version,
                                        %{$Hash},
                                        Message => $DeployInfo{File}->{ $Hash->{Location} },
                                    },
                                );
                            }
                            else {
                                $LayoutObject->Block(
                                    Name => "PackageItemFilelistFileNote",
                                    Data => {
                                        Name    => $Name,
                                        Version => $Version,
                                        %{$Hash},
                                    },
                                );
                            }
                        }
                        else {
                            $LayoutObject->Block(
                                Name => "PackageItemFilelistFileNote",
                                Data => {
                                    Name    => $Name,
                                    Version => $Version,
                                    %{$Hash},
                                },
                            );
                        }
                    }
                    else {
                        $LayoutObject->Block(
                            Name => "PackageItemGeneric",
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                }
            }
        }
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        if ( !$Deployed ) {
            my $Priority = 'Error';
            my $Message  = $LayoutObject->{LanguageObject}
                ->Translate("Package not correctly deployed! Please reinstall the package.");
            if ( $Kernel::OM->Get('Kernel::Config')->Get('Package::AllowLocalModifications') ) {
                $Priority = 'Notice';
                $Message  = $LayoutObject->{LanguageObject}->Translate("Package has locally modified files.");
            }

            $Output .= $LayoutObject->Notify(
                Priority => $Priority,
                Data     => "$Name $Version - $Message",
                Link     => $LayoutObject->{Baselink}
                    . 'Action=AdminPackageManager;Subaction=View;Name='
                    . $Name
                    . ';Version='
                    . $Version,
            );
        }

        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # view remote package
    # ------------------------------------------------------------ #
    if ( $Self->{Subaction} eq 'ViewRemote' ) {
        my $File     = $ParamObject->GetParam( Param => 'File' ) || '';
        my $Location = $ParamObject->GetParam( Param => 'Location' );
        my %Frontend;

        # download package
        my $Package = $PackageObject->PackageOnlineGet(
            Source => $Source,
            File   => $File,
        );

        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }
        my %Structure = $PackageObject->PackageParse( String => $Package );

        $Frontend{Name} = $Structure{Name}->{Content};

        $LayoutObject->Block(
            Name => 'Package',
            Data => { %Param, %Frontend, },
        );

        # allow to download only if package is allow to do it
        if (
            !defined $Structure{PackageIsDownloadable}
            || (
                defined $Structure{PackageIsDownloadable}->{Content}
                && $Structure{PackageIsDownloadable}->{Content} eq '1'
            )
            )
        {

            $LayoutObject->Block(
                Name => 'PackageDownloadRemote',
                Data => {
                    %Param, %Frontend,
                    File => $File,
                },
            );
        }

        # check if file is requested
        if ($Location) {
            if ( ref $Structure{Filelist} eq 'ARRAY' ) {
                for my $Hash ( @{ $Structure{Filelist} } ) {
                    if ( $Hash->{Location} eq $Location ) {
                        return $LayoutObject->Attachment(
                            Filename    => $Location,
                            ContentType => 'application/octet-stream',
                            Content     => $Hash->{Content},
                        );
                    }
                }
            }
        }
        my @DatabaseBuffer;
        for my $Key ( sort keys %Structure ) {
            if ( ref $Structure{$Key} eq 'HASH' ) {
                if ( $Key =~ /^(Description|Filelist)$/ ) {
                    $LayoutObject->Block(
                        Name => "PackageItem$Key",
                        Data => {
                            Tag => $Key,
                            %{ $Structure{$Key} }
                        },
                    );
                }
                elsif ( $Key =~ /^Database(Install|Reinstall|Upgrade|Uninstall)$/ ) {
                    for my $Type (qw(pre post)) {
                        for my $Hash ( @{ $Structure{$Key}->{$Type} } ) {
                            if ( $Hash->{TagType} eq 'Start' ) {
                                if ( $Hash->{Tag} =~ /^Table/ ) {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabase",
                                        Data => {
                                            %{$Hash},
                                            TagName => $Key,
                                            Type    => $Type
                                        },
                                    );
                                    push @DatabaseBuffer, $Hash;
                                }
                                else {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabaseSub",
                                        Data => {
                                            %{$Hash},
                                            TagName => $Key,
                                        },
                                    );
                                    push @DatabaseBuffer, $Hash;
                                }
                            }
                            if ( $Hash->{Tag} =~ /^Table/ && $Hash->{TagType} eq 'End' ) {
                                push @DatabaseBuffer, $Hash;
                                my @SQL = $DBObject->SQLProcessor(
                                    Database => \@DatabaseBuffer
                                );
                                my @SQLPost = $DBObject->SQLProcessorPost();
                                push @SQL, @SQLPost;
                                for my $SQL (@SQL) {
                                    $LayoutObject->Block(
                                        Name => "PackageItemDatabaseSQL",
                                        Data => {
                                            TagName => $Key,
                                            SQL     => $SQL,
                                        },
                                    );
                                }
                                @DatabaseBuffer = ();
                            }
                        }
                    }
                }
                else {
                    $LayoutObject->Block(
                        Name => 'PackageItemGeneric',
                        Data => {
                            Tag => $Key,
                            %{ $Structure{$Key} }
                        },
                    );
                }
            }
            elsif ( ref $Structure{$Key} eq 'ARRAY' ) {
                for my $Hash ( @{ $Structure{$Key} } ) {
                    if ( $Key =~ /^(Description|ChangeLog)$/ ) {
                        $LayoutObject->Block(
                            Name => "PackageItem$Key",
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                    elsif ( $Key =~ /^Code/ ) {
                        $Hash->{Content} = $LayoutObject->Ascii2Html(
                            Text           => $Hash->{Content},
                            HTMLResultMode => 1,
                            NewLine        => 72,
                        );
                        $LayoutObject->Block(
                            Name => "PackageItemCode",
                            Data => {
                                Tag => $Key,
                                %{$Hash}
                            },
                        );
                    }
                    elsif ( $Key =~ /^(Intro)/ ) {
                        if ( $Hash->{Format} && $Hash->{Format} =~ /plain/i ) {
                            $Hash->{Content} = '<pre class="contentbody">' . $Hash->{Content} . '</pre>';
                        }

                        $Hash->{Content} = $Self->_GetSafeString( String => $Hash->{Content} );

                        $LayoutObject->Block(
                            Name => "PackageItemIntro",
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                    elsif ( $Hash->{Tag} =~ /^(File)$/ ) {

                        # add human readable file size
                        if ( defined $Hash->{Size} ) {
                            $Hash->{Size} = $LayoutObject->HumanReadableDataSize(
                                Size => $Hash->{Size},
                            );
                        }

                        $LayoutObject->Block(
                            Name => 'PackageItemFilelistFile',
                            Data => {
                                Name    => $Structure{Name}->{Content},
                                Version => $Structure{Version}->{Content},
                                File    => $File,
                                %{$Hash},
                            },
                        );

                        # check if is possible to download files
                        if (
                            !defined $Structure{PackageIsDownloadable}
                            || (
                                defined $Structure{PackageIsDownloadable}->{Content}
                                && $Structure{PackageIsDownloadable}->{Content} eq '1'
                            )
                            )
                        {
                            $LayoutObject->Block(
                                Name => "PackageItemFilelistFileLink",
                                Data => {
                                    Name    => $Structure{Name}->{Content},
                                    Version => $Structure{Version}->{Content},
                                    File    => $File,
                                    %{$Hash},
                                },
                            );
                        }
                    }
                    else {
                        $LayoutObject->Block(
                            Name => 'PackageItemGeneric',
                            Data => {
                                %{$Hash},
                                Tag => $Key,
                            },
                        );
                    }
                }
            }
        }
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # ------------------------------------------------------------ #
    # download package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Download' ) {
        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }
        return $LayoutObject->Attachment(
            Content     => $Package,
            ContentType => 'application/octet-stream',
            Filename    => "$Name-$Version.opm",
            Type        => 'attachment',
        );
    }

    # ------------------------------------------------------------ #
    # download remote package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'DownloadRemote' ) {
        my $File = $ParamObject->GetParam( Param => 'File' ) || '';

        # download package
        my $Package = $PackageObject->PackageOnlineGet(
            Source => $Source,
            File   => $File,
        );

        # check
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }
        return $LayoutObject->Attachment(
            Content     => $Package,
            ContentType => 'application/octet-stream',
            Filename    => $File,
            Type        => 'attachment',
        );
    }

    # ------------------------------------------------------------ #
    # change repository
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ChangeRepository' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Source = $ParamObject->GetParam( Param => 'Source' ) || '';
        $Kernel::OM->Get('Kernel::System::AuthSession')->UpdateSessionID(
            SessionID => $Self->{SessionID},
            Key       => 'UserRepository',
            Value     => $Source,
        );
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # install package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Install' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );

        return $Self->_InstallHandling( Package => $Package );
    }

    # ------------------------------------------------------------ #
    # install remote package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'InstallRemote' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $File = $ParamObject->GetParam( Param => 'File' ) || '';

        # download package
        my $Package = $PackageObject->PackageOnlineGet(
            Source => $Source,
            File   => $File,
        );

        return $Self->_InstallHandling(
            Package => $Package,
            Source  => $Source,
            File    => $File,
        );
    }

    # ------------------------------------------------------------ #
    # upgrade remote package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'UpgradeRemote' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $File = $ParamObject->GetParam( Param => 'File' ) || '';

        # download package
        my $Package = $PackageObject->PackageOnlineGet(
            File   => $File,
            Source => $Source,
        );

        return $Self->_UpgradeHandling(
            Package => $Package,
            File    => $File,
            Source  => $Source,
        );
    }

    # ------------------------------------------------------------ #
    # reinstall package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Reinstall' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $IntroReinstallPre = $ParamObject->GetParam( Param => 'IntroReinstallPre' )
            || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        # check if we have to show reinstall intro pre
        my %Structure = $PackageObject->PackageParse(
            String => $Package,
        );

        # intro screen
        my %Data;
        if ( $Structure{IntroReinstall} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroReinstall},
                Type => 'pre'
            );
        }
        if ( %Data && !$IntroReinstallPre ) {
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => $Self->{Subaction},
                    Type      => 'IntroReinstallPre',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => $Self->{Subaction},
                    Type      => 'IntroReinstallPre',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroCancel',
            );
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
                Data         => \%Param,
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # reinstall screen
        else {
            $LayoutObject->Block(
                Name => 'Reinstall',
                Data => {
                    %Param,
                    Name    => $Structure{Name}->{Content},
                    Version => $Structure{Version}->{Content},
                },
            );
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }
    }

    # ------------------------------------------------------------ #
    # reinstall action package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'ReinstallAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $IntroReinstallPost = $ParamObject->GetParam( Param => 'IntroReinstallPost' )
            || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        # check if we have to show reinstall intro pre
        my %Structure = $PackageObject->PackageParse(
            String => $Package,
        );

        # intro screen
        if ( !$PackageObject->PackageReinstall( String => $Package ) ) {
            return $LayoutObject->ErrorScreen();
        }
        my %Data;
        if ( $Structure{IntroReinstall} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroReinstall},
                Type => 'post'
            );
        }
        if ( %Data && !$IntroReinstallPost ) {
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroReinstallPost',
                    Name      => $Name,
                    Version   => $Version,
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroReinstallPost',
                    Name      => $Name,
                    Version   => $Version,
                },
            );

            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # redirect
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # uninstall package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'Uninstall' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $IntroUninstallPre = $ParamObject->GetParam( Param => 'IntroUninstallPre' )
            || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        # check if we have to show uninstall intro pre
        my %Structure = $PackageObject->PackageParse(
            String => $Package,
        );

        # intro screen
        my %Data;
        if ( $Structure{IntroUninstall} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroUninstall},
                Type => 'pre'
            );
        }
        if ( %Data && !$IntroUninstallPre ) {
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => $Self->{Subaction},
                    Type      => 'IntroUninstallPre',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => $Self->{Subaction},
                    Type      => 'IntroUninstallPre',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroCancel',
            );
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # uninstall screen
        else {
            $LayoutObject->Block(
                Name => 'Uninstall',
                Data => {
                    %Param,
                    Name    => $Structure{Name}->{Content},
                    Version => $Structure{Version}->{Content},
                },
            );
            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }
    }

    # ------------------------------------------------------------ #
    # uninstall action package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'UninstallAction' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';
        my $IntroUninstallPost = $ParamObject->GetParam( Param => 'IntroUninstallPost' )
            || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }

        # parse package
        my %Structure = $PackageObject->PackageParse(
            String => $Package,
        );

        # unsinstall the package
        if ( !$PackageObject->PackageUninstall( String => $Package ) ) {
            return $LayoutObject->ErrorScreen();
        }

        # intro screen
        my %Data;
        if ( $Structure{IntroUninstall} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroUninstall},
                Type => 'post'
            );
        }
        if ( %Data && !$IntroUninstallPost ) {
            my %Data = $Self->_MessageGet( Info => $Structure{IntroUninstallPost} );
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroUninstallPost',
                    Name      => $Name,
                    Version   => $Version,
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroUninstallPost',
                    Name      => $Name,
                    Version   => $Version,
                },
            );

            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # redirect
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # ------------------------------------------------------------ #
    # install package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'InstallUpload' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $FormID      = $ParamObject->GetParam( Param => 'FormID' ) || '';
        my %UploadStuff = $ParamObject->GetUploadAll(
            Param => 'FileUpload',
        );

        my $UploadCacheObject = $Kernel::OM->Get('Kernel::System::Web::UploadCache');

        # save package in upload cache
        if (%UploadStuff) {
            my $Added = $UploadCacheObject->FormIDAddFile(
                FormID => $FormID,
                %UploadStuff,
            );

            # if file got not added to storage
            # (e. g. because of 1 MB max_allowed_packet MySQL problem)
            if ( !$Added ) {
                $LayoutObject->FatalError();
            }
        }

        # get package from upload cache
        else {
            my @AttachmentData = $UploadCacheObject->FormIDGetAllFilesData(
                FormID => $FormID,
            );
            if ( !@AttachmentData || ( $AttachmentData[0] && !%{ $AttachmentData[0] } ) ) {
                $Errors{FileUploadInvalid} = 'ServerError';
            }
            else {
                %UploadStuff = %{ $AttachmentData[0] };
            }
        }
        if ( !%Errors ) {
            my $Feedback = $PackageObject->PackageIsInstalled( String => $UploadStuff{Content} );

            if ($Feedback) {
                return $Self->_UpgradeHandling(
                    Package => $UploadStuff{Content},
                    FormID  => $FormID,
                );
            }
            return $Self->_InstallHandling(
                Package => $UploadStuff{Content},
                FormID  => $FormID,
            );
        }
    }

    # ------------------------------------------------------------ #
    # rebuild package
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'RebuildPackage' ) {

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        my $Name    = $ParamObject->GetParam( Param => 'Name' )    || '';
        my $Version = $ParamObject->GetParam( Param => 'Version' ) || '';

        # get package
        my $Package = $PackageObject->RepositoryGet(
            Name    => $Name,
            Version => $Version,
            Result  => 'SCALAR',
        );
        if ( !$Package ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('No such package!'),
            );
        }
        my %Structure = $PackageObject->PackageParse(
            String => $Package,
        );
        my $File = $PackageObject->PackageBuild(%Structure);
        return $LayoutObject->Attachment(
            Content     => $File,
            ContentType => 'application/octet-stream',
            Filename    => "$Name-$Version-rebuild.opm",
            Type        => 'attachment',
        );
    }

    # ------------------------------------------------------------ #
    # Create a PackageUpgradeAll task for daemon
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXPackageUpgradeAll' ) {

        my $Success = $Self->AsyncCall(
            ObjectName               => 'Kernel::System::Package',
            FunctionName             => 'PackageUpgradeAll',
            FunctionParams           => [],
            Attempts                 => 3,
            MaximumParallelInstances => 1,
        );

        my $JSON = $LayoutObject->JSONEncode(
            Data => {
                Success => $Success,
            },
        );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $JSON || '',
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # Check if is safe to start a new Package Upgrade all process
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXGetPackageUpgradeRunStatus' ) {

        my %Result = $PackageObject->PackageUpgradeAllIsRunning();

        my $JSON = $LayoutObject->JSONEncode(
            Data => {
                Success => 1,
                %Result,
            },
        );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # Check current Package Upgrade all results (partial or full)
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXGetPackageUpgradeResult' ) {

        my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');
        my %SystemData       = $SystemDataObject->SystemDataGroupGet(
            Group => 'Package_UpgradeAll',
        );

        my $JSONObject        = $Kernel::OM->Get('Kernel::System::JSON');
        my $InstalledPackages = $JSONObject->Decode(
            Data => $SystemData{InstalledPackages} || {},
        );

        my $UpgradeResult = $JSONObject->Decode(
            Data => $SystemData{UpgradeResult} || {},
        );

        my %PackageList;
        if ( IsArrayRefWithData($InstalledPackages) ) {
            my $DefaultStatus        = Translatable('Not Started');
            my $DefaultStatusDisplay = $LayoutObject->{LanguageObject}->Translate($DefaultStatus);
            for my $Package ( @{$InstalledPackages} ) {
                $PackageList{ $Package->{Name} } = {
                    Name          => $Package->{Name},
                    Status        => $DefaultStatus,
                    StatusDisplay => $DefaultStatusDisplay,
                };
            }
            my %StatusStings = (
                Updated        => $LayoutObject->{LanguageObject}->Translate('Updated'),
                AlreadyUpdated => $LayoutObject->{LanguageObject}->Translate('Already up-to-date'),
                Installed      => $LayoutObject->{LanguageObject}->Translate('Installed'),
                Undeployed     => $LayoutObject->{LanguageObject}->Translate('Not correctly deployed'),
                Failed         => $LayoutObject->{LanguageObject}->Translate('Failed'),
            );
            my %StatusMessages = (
                Updated        => $LayoutObject->{LanguageObject}->Translate('Package updated correctly'),
                AlreadyUpdated => $LayoutObject->{LanguageObject}->Translate('Package was already updated'),
                Installed      => $LayoutObject->{LanguageObject}->Translate('Dependency installed correctly'),
                Undeployed     => $LayoutObject->{LanguageObject}->Translate('The package needs to be reinstalled'),
                Cyclic       => $LayoutObject->{LanguageObject}->Translate('The package contains cyclic dependencies'),
                NotFound     => $LayoutObject->{LanguageObject}->Translate('Not found in on-line repositories'),
                WrongVersion => $LayoutObject->{LanguageObject}->Translate('Required version is higher than available'),
                DependencyFail => $LayoutObject->{LanguageObject}->Translate('Dependencies fail to upgrade or install'),
                InstallError   => $LayoutObject->{LanguageObject}->Translate('Package could not be installed'),
                UpdateError    => $LayoutObject->{LanguageObject}->Translate('Package could not be upgraded'),
            );

            if ( IsHashRefWithData($UpgradeResult) ) {
                for my $StatusType (qw(Updated Installed AlreadyUpdated Undeployed)) {
                    for my $PackageName ( sort keys %{ $UpgradeResult->{$StatusType} } ) {
                        my $Class = 'Success';
                        if ( $StatusType eq 'Installed' || $StatusType eq 'Undeployed' ) {
                            $Class = 'Warning';
                        }
                        $PackageList{$PackageName} = {
                            Name          => $PackageName,
                            Status        => $StatusType,
                            StatusDisplay => $StatusStings{$StatusType},
                            StatusMessage => $StatusMessages{$StatusType},
                            Class         => $Class,
                        };
                    }
                }
                for my $FailType ( sort keys %{ $UpgradeResult->{Failed} } ) {
                    for my $PackageName ( sort keys %{ $UpgradeResult->{Failed}->{$FailType} } ) {
                        $PackageList{$PackageName} = {
                            Name          => $PackageName,
                            Status        => 'Failed',
                            StatusDisplay => $StatusStings{Failed},
                            StatusMessage => $StatusMessages{$FailType},
                            Class         => 'Fail',
                        };
                    }
                }
            }
        }

        # Convert it into an array for easy and persistent sorting.
        my @PackageList = map { $PackageList{$_} } sort keys %PackageList;

        my $JSON = $LayoutObject->JSONEncode(
            Data => {
                Success        => 1,
                UpgradeStatus  => $SystemData{Status} || '',
                UpgradeSuccess => $SystemData{Success} || '',
                PackageList    => \@PackageList,
            },
        );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $JSON || '',
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # Removes any Package Upgrade data from the database
    # ------------------------------------------------------------ #
    elsif ( $Self->{Subaction} eq 'AJAXDeletePackageUpgradeData' ) {

        my $Success = $Kernel::OM->Get('Kernel::System::Package')->PackageUpgradeAllDataDelete();

        my $JSON = $LayoutObject->JSONEncode(
            Data => {
                Success => $Success,
            },
        );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $JSON || '',
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    # ------------------------------------------------------------ #
    # overview
    # ------------------------------------------------------------ #
    my %Frontend;
    my %NeedReinstall;
    my $OutputNotify = '';

    my %RepositoryList = $PackageObject->ConfiguredRepositoryListGet();

    # Get the list of the installed packages early to be able to show or not the Upgrade All button
    #   in the layout block.
    my @RepositoryList = $PackageObject->RepositoryList();

    my %RepositoryListSelection = map { $_ => $_ } keys %RepositoryList;

    $Frontend{SourceList} = $LayoutObject->BuildSelection(
        Data        => \%RepositoryListSelection,
        Name        => 'Source',
        Title       => Translatable('Repository List'),
        Max         => 40,
        Translation => 0,
        SelectedID  => $Source,
        Class       => "Modernize W100pc",
    );
    $LayoutObject->Block(
        Name => 'Overview',
        Data => {
            %Param,
            %Frontend,
            InstalledPackages => @RepositoryList ? 1 : 0,
        },
    );
    if ($Source) {

        my @List = $PackageObject->RepositoryPackageListGet(
            Source => $Source,
            Lang   => $LayoutObject->{UserLanguage},
        );
        if ( !@List ) {
            $OutputNotify .= $LayoutObject->Notify(
                Priority => 'Warning',
                Info     => Translatable('No packages found in selected repository. Please check log for more info!'),
                Link     => $LayoutObject->{Baselink} . 'Action=AdminLog',
            );
            $LayoutObject->Block(
                Name => 'NoDataFoundMsg',
                Data => {},
            );
        }

        for my $Data (@List) {

            $LayoutObject->Block(
                Name => 'ShowRemotePackage',
                Data => {
                    %{$Data},
                    Source => $Source,
                },
            );

            # show documentation link
            my %DocFile = $Self->_DocumentationGet( Filelist => $Data->{Filelist} );
            if (%DocFile) {
                $LayoutObject->Block(
                    Name => 'ShowRemotePackageDocumentation',
                    Data => {
                        %{$Data},
                        Source => $Source,
                        %DocFile,
                    },
                );
            }

            if ( $Data->{Upgrade} ) {
                $LayoutObject->Block(
                    Name => 'ShowRemotePackageUpgrade',
                    Data => {
                        %{$Data},
                        Source => $Source,
                    },
                );
            }
            elsif ( !$Data->{Installed} ) {
                $LayoutObject->Block(
                    Name => 'ShowRemotePackageInstall',
                    Data => {
                        %{$Data},
                        Source => $Source,
                    },
                );
            }
        }
    }

    # if there are no remote packages to show, a msg is displayed
    else {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg',
            Data => {},
        );
    }

    # remove not visible packages
    @RepositoryList = map {
        (
            !defined $_->{PackageIsVisible}
                || ( $_->{PackageIsVisible}->{Content} && $_->{PackageIsVisible}->{Content} eq '1' )
            )
            ? $_
            : ()
    } @RepositoryList;

    # if there are no local packages to show, a msg is displayed
    if ( !@RepositoryList ) {
        $LayoutObject->Block(
            Name => 'NoDataFoundMsg2',
        );
    }

    for my $Package (@RepositoryList) {
        my %Data = $Self->_MessageGet( Info => $Package->{Description} );

        $LayoutObject->Block(
            Name => 'ShowLocalPackage',
            Data => {
                %{$Package},
                %Data,
                Name    => $Package->{Name}->{Content},
                Version => $Package->{Version}->{Content},
                Vendor  => $Package->{Vendor}->{Content},
                URL     => $Package->{URL}->{Content},
            },
        );

        # show documentation link
        my %DocFile = $Self->_DocumentationGet( Filelist => $Package->{Filelist} );
        if (%DocFile) {
            $LayoutObject->Block(
                Name => 'ShowLocalPackageDocumentation',
                Data => {
                    Name    => $Package->{Name}->{Content},
                    Version => $Package->{Version}->{Content},
                    %DocFile,
                },
            );
        }

        if ( $Package->{Status} eq 'installed' ) {
            if (
                !defined $Package->{PackageIsRemovable}
                || (
                    defined $Package->{PackageIsRemovable}->{Content}
                    && $Package->{PackageIsRemovable}->{Content} eq '1'
                )
                )
            {
                $LayoutObject->Block(
                    Name => 'ShowLocalPackageUninstall',
                    Data => {
                        %{$Package},
                        Name    => $Package->{Name}->{Content},
                        Version => $Package->{Version}->{Content},
                        Vendor  => $Package->{Vendor}->{Content},
                        URL     => $Package->{URL}->{Content},
                    },
                );
            }

            if (
                !$PackageObject->DeployCheck(
                    Name    => $Package->{Name}->{Content},
                    Version => $Package->{Version}->{Content}
                )
                )
            {
                $NeedReinstall{ $Package->{Name}->{Content} } = $Package->{Version}->{Content};
                $LayoutObject->Block(
                    Name => 'ShowLocalPackageReinstall',
                    Data => {
                        %{$Package},
                        Name    => $Package->{Name}->{Content},
                        Version => $Package->{Version}->{Content},
                        Vendor  => $Package->{Vendor}->{Content},
                        URL     => $Package->{URL}->{Content},
                    },
                );
            }
        }
        else {
            $LayoutObject->Block(
                Name => 'ShowLocalPackageInstall',
                Data => {
                    %{$Package},
                    Name    => $Package->{Name}->{Content},
                    Version => $Package->{Version}->{Content},
                    Vendor  => $Package->{Vendor}->{Content},
                    URL     => $Package->{URL}->{Content},
                },
            );
        }
    }

    # show file upload
    if ( $ConfigObject->Get('Package::FileUpload') ) {
        $LayoutObject->Block(
            Name => 'OverviewFileUpload',
            Data => {
                FormID => $Kernel::OM->Get('Kernel::System::Web::UploadCache')->FormIDCreate(),
                %Errors,
            },
        );

        # check if we're on MySQL and show a max_allowed_packet notice
        # if the actual value for this setting is too low
        if ( $DBObject->{'DB::Type'} eq 'mysql' ) {

            # check the actual setting
            $DBObject->Prepare(
                SQL => "SHOW variables WHERE Variable_name = 'max_allowed_packet'",
            );

            my $MaxAllowedPacket            = 0;
            my $MaxAllowedPacketRecommended = 64;
            while ( my @Data = $DBObject->FetchrowArray() ) {
                if ( $Data[1] ) {
                    $MaxAllowedPacket = $Data[1] / 1024 / 1024;
                }
            }

            if ( $MaxAllowedPacket < $MaxAllowedPacketRecommended ) {
                $LayoutObject->Block(
                    Name => 'DatabasePackageSizeWarning',
                    Data => {
                        MaxAllowedPacket            => $MaxAllowedPacket,
                        MaxAllowedPacketRecommended => $MaxAllowedPacketRecommended,
                    },
                );
            }
        }
    }

    # Check if OTRS Daemon is running in the background.
    #   Get daemon state from the cache.
    my $DaemonRunning = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => 'DaemonRunning',
        Key  => $ConfigObject->Get('NodeID') || 1,
    );
    $LayoutObject->AddJSData(
        Key   => 'DaemonCheckNotRunning',
        Value => !$DaemonRunning,
    );

    # Remove old package upgrade all data.
    my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');
    my %SystemData       = $SystemDataObject->SystemDataGroupGet(
        Group => 'Package_UpgradeAll',
    );
    if ( %SystemData && $SystemData{UpdateTime} ) {
        my $CurrentDateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');
        my $TargetDateTimeObject  = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                String => $SystemData{UpdateTime},
            }
        );
        $TargetDateTimeObject->Add( Days => 1 );
        if ( $CurrentDateTimeObject > $TargetDateTimeObject ) {
            $PackageObject->PackageUpgradeAllDataDelete();
        }
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $OutputNotify;
    for my $ReinstallKey ( sort keys %NeedReinstall ) {

        my $Priority = 'Error';
        my $Message  = $LayoutObject->{LanguageObject}
            ->Translate("Package not correctly deployed! Please reinstall the package.");
        if ( $Kernel::OM->Get('Kernel::Config')->Get('Package::AllowLocalModifications') ) {
            $Priority = 'Notice';
            $Message  = $LayoutObject->{LanguageObject}->Translate("Package has locally modified files.");
        }

        $Output .= $LayoutObject->Notify(
            Priority => $Priority,
            Data     => "$ReinstallKey $NeedReinstall{$ReinstallKey} - $Message",
            Link     => $LayoutObject->{Baselink}
                . 'Action=AdminPackageManager;Subaction=View;Name='
                . $ReinstallKey
                . ';Version='
                . $NeedReinstall{$ReinstallKey},
        );
    }

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminPackageManager',
    );
    $Output .= $LayoutObject->Footer();
    return $Output;
}

sub _MessageGet {
    my ( $Self, %Param ) = @_;

    my $Title       = '';
    my $Description = '';
    my $Use         = 0;

    my $Language = $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{UserLanguage}
        || $Kernel::OM->Get('Kernel::Config')->Get('DefaultLanguage');

    if ( $Param{Info} ) {
        TAG:
        for my $Tag ( @{ $Param{Info} } ) {
            if ( $Param{Type} ) {
                next TAG if $Tag->{Type} !~ /^$Param{Type}/i;
            }
            $Use = 1;
            if ( $Tag->{Format} && $Tag->{Format} =~ /plain/i ) {
                $Tag->{Content} = '<pre class="contentbody">' . $Tag->{Content} . '</pre>';
            }
            if ( !$Description && $Tag->{Lang} eq 'en' ) {
                $Description = $Tag->{Content};
                $Title       = $Tag->{Title};
            }

            if ( $Tag->{Lang} eq $Language ) {
                $Description = $Tag->{Content};
                $Title       = $Tag->{Title};
            }
        }
        if ( !$Description && $Use ) {
            for my $Tag ( @{ $Param{Info} } ) {
                if ( !$Description ) {
                    $Description = $Tag->{Content};
                    $Title       = $Tag->{Title};
                }
            }
        }
    }
    return if !$Description && !$Title;

    $Description = $Self->_GetSafeString( String => $Description );
    $Title       = $Self->_GetSafeString( String => $Title );

    return (
        Description => $Description,
        Title       => $Title,
    );
}

sub _DocumentationGet {
    my ( $Self, %Param ) = @_;

    return if !$Param{Filelist};
    return if ref $Param{Filelist} ne 'ARRAY';

    # find the correct user language documentation file
    my $DocumentationFileUserLanguage;

    # find the correct default language documentation file
    my $DocumentationFileDefaultLanguage;

    # find the correct en documentation file
    my $DocumentationFile;

    # remember fallback file
    my $DocumentationFileFallback;

    # get default language
    my $DefaultLanguage = $Kernel::OM->Get('Kernel::Config')->Get('DefaultLanguage');

    # find documentation files
    FILE:
    for my $File ( @{ $Param{Filelist} } ) {

        next FILE if !$File;
        next FILE if !$File->{Location};

        my ( $Dir, $Filename ) = $File->{Location} =~ m{ \A doc/ ( .+ ) / ( .+? .pdf ) }xmsi;

        next FILE if !$Dir;
        next FILE if !$Filename;

        # take user language first
        if ( $Dir eq $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{UserLanguage} ) {
            $DocumentationFileUserLanguage = $File->{Location};
        }

        # take default language next
        elsif ( $Dir eq $DefaultLanguage ) {
            $DocumentationFileDefaultLanguage = $File->{Location};
        }

        # take en language next
        elsif ( $Dir eq 'en' && !$DocumentationFile ) {
            $DocumentationFile = $File->{Location};
        }

        # remember fallback file
        $DocumentationFileFallback = $File->{Location};
    }

    # set fallback file (if exists) as documentation file
    my %Doc;
    if ($DocumentationFileUserLanguage) {
        $Doc{Location} = $DocumentationFileUserLanguage;
    }
    elsif ($DocumentationFileDefaultLanguage) {
        $Doc{Location} = $DocumentationFileDefaultLanguage;
    }
    elsif ($DocumentationFile) {
        $Doc{Location} = $DocumentationFile;
    }
    elsif ($DocumentationFileFallback) {
        $Doc{Location} = $DocumentationFileFallback;
    }
    return %Doc;
}

sub _InstallHandling {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed params
    if ( !$Param{Package} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No such package!'),
        );
    }

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # redirect after finishing installation
    if ( $ParamObject->GetParam( Param => 'IntroInstallPost' ) ) {
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    my $IntroInstallPre = $ParamObject->GetParam( Param => 'IntroInstallPre' ) // '';

    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    # parse package
    my %Structure = $PackageObject->PackageParse( String => $Param{Package} );

    # intro screen
    my %Data;
    if ( $Structure{IntroInstall} ) {
        %Data = $Self->_MessageGet(
            Info => $Structure{IntroInstall},
            Type => 'pre'
        );
    }

    # parse sopm-file and show <PackageRequired> information
    if ( $Structure{PackageRequired} ) {
        $Data{PackageRequired} = $PackageObject->GetRequiredPackages(
            Structure => \%Structure,
        );
        $Data{PackageRequiredProblem} = grep { $_->{IsInstalled} eq 0 } @{ $Data{PackageRequired} };
    }

    # parse sopm-file and show <ModuleRequired> information
    if ( $Structure{ModuleRequired} ) {
        $Data{ModuleRequired} = $PackageObject->GetRequiredModules(
            Structure => \%Structure,
        );
        $Data{ModuleRequiredProblem} = grep { $_->{IsInstalled} eq 0 } @{ $Data{ModuleRequired} };
    }

    my %Response = $PackageObject->AnalyzePackageFrameworkRequirements(
        Framework => $Structure{Framework},
        NoLog     => 1,
    );

    if ( !$Response{Success} ) {
        $LayoutObject->Block(
            Name => 'IncompatibleInfo',
            Data => {
                %Param,
                %Data,
                Subaction              => $Self->{Subaction},
                Type                   => 'InstallIncompatible',
                Name                   => $Structure{Name}->{Content},
                Version                => $Structure{Version}->{Content},
                RequiredMinimumVersion => $Response{RequiredFrameworkMinimum},
                RequiredMaximumVersion => $Response{RequiredFrameworkMaximum},
                RequiredFramework      => $Response{RequiredFramework},
            },
        );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;

    }

    # intro before installation
    if ( %Data && !$IntroInstallPre ) {

        $LayoutObject->Block(
            Name => 'Intro',
            Data => {
                %Param,
                %Data,
                Subaction => $Self->{Subaction},
                Type      => 'IntroInstallPre',
                Name      => $Structure{Name}->{Content},
                Version   => $Structure{Version}->{Content},
            },
        );

        $LayoutObject->Block(
            Name => 'IntroForm',
            Data => {
                %Param,
                %Data,
                Subaction => $Self->{Subaction},
                Type      => 'IntroInstallPre',
                Name      => $Structure{Name}->{Content},
                Version   => $Structure{Version}->{Content},
            },
        );

        $LayoutObject->Block(
            Name => 'IntroCancel',
        );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # install package
    elsif (
        $PackageObject->PackageInstall(
            String => $Param{Package},
        )
        )
    {

        # intro screen
        my %Data;
        if ( $Structure{IntroInstall} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroInstall},
                Type => 'post'
            );
        }
        if (%Data) {
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => 'Install',
                    Type      => 'IntroInstallPost',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => 'Install',
                    Type      => 'IntroInstallPost',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # redirect
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    return $LayoutObject->ErrorScreen();
}

sub _UpgradeHandling {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed params
    if ( !$Param{Package} ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No such package!'),
        );
    }

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # redirect after finishing upgrade
    if ( $ParamObject->GetParam( Param => 'IntroUpgradePost' ) ) {
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    my $IntroUpgradePre = $ParamObject->GetParam( Param => 'IntroUpgradePre' ) || '';

    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    # check if we have to show upgrade intro pre
    my %Structure = $PackageObject->PackageParse(
        String => $Param{Package},
    );

    # intro screen
    my %Data;
    if ( $Structure{IntroUpgrade} ) {
        %Data = $Self->_MessageGet(
            Info => $Structure{IntroUpgrade},
            Type => 'pre'
        );
    }

    # parse sopm-file and show <PackageRequired> information
    if ( $Structure{PackageRequired} ) {
        $Data{PackageRequired} = $PackageObject->GetRequiredPackages(
            Structure => \%Structure,
        );
    }

    # parse sopm-file and show <ModuleRequired> information
    if ( $Structure{ModuleRequired} ) {
        $Data{ModuleRequired} = $PackageObject->GetRequiredModules(
            Structure => \%Structure,
        );
    }

    my %Response = $PackageObject->AnalyzePackageFrameworkRequirements(
        Framework => $Structure{Framework},
        NoLog     => 1,
    );

    if ( !$Response{Success} ) {
        $LayoutObject->Block(
            Name => 'IncompatibleInfo',
            Data => {
                %Param,
                %Data,
                Subaction              => $Self->{Subaction},
                Type                   => 'UpgradeIncompatible',
                Name                   => $Structure{Name}->{Content},
                Version                => $Structure{Version}->{Content},
                RequiredMinimumVersion => $Response{RequiredFrameworkMinimum},
                RequiredMaximumVersion => $Response{RequiredFrameworkMaximum},
                RequiredFramework      => $Response{RequiredFramework},
            },
        );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    if ( %Data && !$IntroUpgradePre ) {
        $LayoutObject->Block(
            Name => 'Intro',
            Data => {
                %Param,
                %Data,
                Subaction => $Self->{Subaction},
                Type      => 'IntroUpgradePre',
                Name      => $Structure{Name}->{Content},
                Version   => $Structure{Version}->{Content},
            },
        );

        $LayoutObject->Block(
            Name => 'IntroForm',
            Data => {
                %Param,
                %Data,
                Subaction => $Self->{Subaction},
                Type      => 'IntroUpgradePre',
                Name      => $Structure{Name}->{Content},
                Version   => $Structure{Version}->{Content},
            },
        );

        $LayoutObject->Block(
            Name => 'IntroCancel',
        );

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminPackageManager',
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }

    # upgrade
    elsif ( $PackageObject->PackageUpgrade( String => $Param{Package} ) ) {

        # intro screen
        my %Data;
        if ( $Structure{IntroUpgrade} ) {
            %Data = $Self->_MessageGet(
                Info => $Structure{IntroUpgrade},
                Type => 'post'
            );
        }
        if (%Data) {
            $LayoutObject->Block(
                Name => 'Intro',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroUpgradePost',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            $LayoutObject->Block(
                Name => 'IntroForm',
                Data => {
                    %Param,
                    %Data,
                    Subaction => '',
                    Type      => 'IntroUpgradePost',
                    Name      => $Structure{Name}->{Content},
                    Version   => $Structure{Version}->{Content},
                },
            );

            my $Output = $LayoutObject->Header();
            $Output .= $LayoutObject->NavigationBar();
            $Output .= $LayoutObject->Output(
                TemplateFile => 'AdminPackageManager',
            );
            $Output .= $LayoutObject->Footer();
            return $Output;
        }

        # redirect
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    return $LayoutObject->ErrorScreen();
}

sub _GetSafeString {
    my ( $Self, %Param ) = @_;

    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    my %SafeString = $HTMLUtilsObject->Safety(
        String       => $Param{String} // '',
        NoApplet     => 1,
        NoObject     => 1,
        NoEmbed      => 1,
        NoSVG        => 1,
        NoImg        => 1,
        NoIntSrcLoad => 0,
        NoExtSrcLoad => 1,
        NoJavaScript => 1,
    );

    return $SafeString{String};
}

1;
