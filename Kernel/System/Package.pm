# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::CodeStyle::STDERRCheck)

package Kernel::System::Package;

use strict;
use warnings;
use utf8;

use MIME::Base64;
use File::Copy;

use Kernel::Config;
use Kernel::System::SysConfig;
use Kernel::System::WebUserAgent;

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

use parent qw(Kernel::System::EventHandler);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::DB',
    'Kernel::System::DateTime',
    'Kernel::System::Encode',
    'Kernel::System::Environment',
    'Kernel::System::JSON',
    'Kernel::System::Loader',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Scheduler',
    'Kernel::System::SystemData',
    'Kernel::System::XML',
);

=head1 NAME

Kernel::System::Package - to manage application packages/modules

=head1 DESCRIPTION

All functions to manage application packages/modules.

=encoding utf-8

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{ConfigObject} = $Kernel::OM->Get('Kernel::Config');
    $Self->{PackageMap}   = {
        Name            => 'SCALAR',
        Version         => 'SCALAR',
        Vendor          => 'SCALAR',
        BuildDate       => 'SCALAR',
        BuildHost       => 'SCALAR',
        License         => 'SCALAR',
        URL             => 'SCALAR',
        ChangeLog       => 'ARRAY',
        Description     => 'ARRAY',
        Framework       => 'ARRAY',
        OS              => 'ARRAY',
        PackageRequired => 'ARRAY',
        ModuleRequired  => 'ARRAY',
        IntroInstall    => 'ARRAY',
        IntroUninstall  => 'ARRAY',
        IntroUpgrade    => 'ARRAY',
        IntroReinstall  => 'ARRAY',
        PackageMerge    => 'ARRAY',

        # package flags
        PackageIsVisible         => 'SCALAR',
        PackageIsDownloadable    => 'SCALAR',
        PackageIsRemovable       => 'SCALAR',
        PackageAllowDirectUpdate => 'SCALAR',

        # *(Pre|Post) - just for compat. to 2.2
        IntroInstallPre    => 'ARRAY',
        IntroInstallPost   => 'ARRAY',
        IntroUninstallPre  => 'ARRAY',
        IntroUninstallPost => 'ARRAY',
        IntroUpgradePre    => 'ARRAY',
        IntroUpgradePost   => 'ARRAY',
        IntroReinstallPre  => 'ARRAY',
        IntroReinstallPost => 'ARRAY',

        CodeInstall   => 'ARRAY',
        CodeUpgrade   => 'ARRAY',
        CodeUninstall => 'ARRAY',
        CodeReinstall => 'ARRAY',
    };
    $Self->{PackageMapFileList} = {
        File => 'ARRAY',
    };

    $Self->{Home} = $Self->{ConfigObject}->Get('Home');

    # init of event handler
    $Self->EventHandlerInit(
        Config => 'Package::EventModulePost',
    );

    # reserve space for merged packages
    $Self->{MergedPackages} = {};

    return $Self;
}

=head2 RepositoryList()

returns a list of repository packages

    my @List = $PackageObject->RepositoryList();

    my @List = $PackageObject->RepositoryList(
        Result => 'short',  # will only return name, version, install_status md5sum, vendor and build commit ID
        instead of the structure
    );

=cut

sub RepositoryList {
    my ( $Self, %Param ) = @_;

    my $Result = 'Full';
    if ( defined $Param{Result} && lc $Param{Result} eq 'short' ) {
        $Result = 'Short';
    }

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # check cache
    my $Cache = $CacheObject->Get(
        Type => "RepositoryList",
        Key  => $Result . 'List',
    );
    return @{$Cache} if $Cache;

    my $DBObject   = $Kernel::OM->Get('Kernel::System::DB');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    # get repository list
    $DBObject->Prepare(
        SQL => 'SELECT name, version, install_status, content, vendor
                FROM package_repository
                ORDER BY name, create_time',
    );

    # fetch the data
    my @Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {

        my %Package = (
            Name    => $Row[0],
            Version => $Row[1],
            Status  => $Row[2],
            Vendor  => $Row[4],
        );

        my $Content = $Row[3];

        if ( $Content && !$DBObject->GetDatabaseFunction('DirectBlob') ) {

            # Backwards compatibility: don't decode existing values that were not yet properly Base64 encoded.
            if ( $Content =~ m{ \A [a-zA-Z0-9+/\n]+ ={0,2} [\n]? \z }smx ) {    # Does it look like Base64?
                $Content = decode_base64($Content);
                $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Content );
            }
        }

        # Correct any 'dos-style' line endings that might have been introduced by saving an
        #   opm file from a mail client on Windows (see http://bugs.otrs.org/show_bug.cgi?id=9838).
        $Content =~ s{\r\n}{\n}xmsg;
        $Package{MD5sum} = $MainObject->MD5sum( String => \$Content );

        # Extract and include build commit ID.
        if ( $Content =~ m{ <BuildCommitID> (.*) </BuildCommitID> }smx ) {
            $Package{BuildCommitID} = $1;
            $Package{BuildCommitID} =~ s{ ^\s+|\s+$ }{}gsmx;
        }

        # get package attributes
        if ( $Content && $Result eq 'Short' ) {

            push @Data, {%Package};
        }
        elsif ($Content) {

            my %Structure = $Self->PackageParse( String => \$Content );
            push @Data, { %Package, %Structure };
        }
    }

    $CacheObject->Set(
        Type  => 'RepositoryList',
        Key   => $Result . 'List',
        Value => \@Data,
        TTL   => 30 * 24 * 60 * 60,
    );

    return @Data;
}

=head2 RepositoryGet()

get a package from local repository

    my $Package = $PackageObject->RepositoryGet(
        Name    => 'Application A',
        Version => '1.0',
    );

    my $PackageScalar = $PackageObject->RepositoryGet(
        Name            => 'Application A',
        Version         => '1.0',
        Result          => 'SCALAR',
        DisableWarnings => 1,                 # optional
    );

=cut

sub RepositoryGet {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Name Version)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # check cache
    my $CacheKey = $Param{Name} . $Param{Version};
    my $Cache    = $CacheObject->Get(
        Type => 'RepositoryGet',
        Key  => $CacheKey,
    );
    return $Cache    if $Cache && $Param{Result} && $Param{Result} eq 'SCALAR';
    return ${$Cache} if $Cache;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # get repository
    $DBObject->Prepare(
        SQL   => 'SELECT content FROM package_repository WHERE name = ? AND version = ?',
        Bind  => [ \$Param{Name}, \$Param{Version} ],
        Limit => 1,
    );

    # fetch data
    my $Package = '';
    ROW:
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Package = $Row[0];

        next ROW if $DBObject->GetDatabaseFunction('DirectBlob');

        # Backwards compatibility: don't decode existing values that were not yet properly Base64 encoded.
        next ROW if $Package !~ m{ \A [a-zA-Z0-9+/\n]+ ={0,2} [\n]? \z }smx;    # looks like Base64?
        $Package = decode_base64($Package);
        $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Package );
    }

    if ( !$Package ) {

        return if $Param{DisableWarnings};

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => "No such package: $Param{Name}-$Param{Version}!",
        );

        return;
    }

    $CacheObject->Set(
        Type  => 'RepositoryGet',
        Key   => $CacheKey,
        Value => \$Package,
        TTL   => 30 * 24 * 60 * 60,
    );

    return \$Package if $Param{Result} && $Param{Result} eq 'SCALAR';
    return $Package;
}

=head2 RepositoryAdd()

add a package to local repository

    $PackageObject->RepositoryAdd(
        String => $FileString,
    );

=cut

sub RepositoryAdd {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!',
        );
        return;
    }

    # get package attributes
    my %Structure = $Self->PackageParse(%Param);

    if ( !IsHashRefWithData( \%Structure ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid Package!',
        );
        return;
    }
    if ( !$Structure{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name!',
        );
        return;
    }
    if ( !$Structure{Version} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Version!',
        );
        return;
    }

    # check if package already exists
    my $PackageExists = $Self->RepositoryGet(
        Name            => $Structure{Name}->{Content},
        Version         => $Structure{Version}->{Content},
        Result          => 'SCALAR',
        DisableWarnings => 1,
    );

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    if ($PackageExists) {
        $DBObject->Do(
            SQL  => 'DELETE FROM package_repository WHERE name = ? AND version = ?',
            Bind => [ \$Structure{Name}->{Content}, \$Structure{Version}->{Content} ],
        );
    }

    # add new package
    my $FileName = $Structure{Name}->{Content} . '-' . $Structure{Version}->{Content} . '.xml';

    my $Content = $Param{String};
    if ( !$DBObject->GetDatabaseFunction('DirectBlob') ) {
        $Kernel::OM->Get('Kernel::System::Encode')->EncodeOutput( \$Content );
        $Content = encode_base64($Content);
    }

    return if !$DBObject->Do(
        SQL => 'INSERT INTO package_repository (name, version, vendor, filename, '
            . ' content_type, content, install_status, '
            . ' create_time, create_by, change_time, change_by)'
            . ' VALUES  (?, ?, ?, ?, \'text/xml\', ?, \''
            . Translatable('not installed') . '\', '
            . ' current_timestamp, 1, current_timestamp, 1)',
        Bind => [
            \$Structure{Name}->{Content}, \$Structure{Version}->{Content},
            \$Structure{Vendor}->{Content}, \$FileName, \$Content,
        ],
    );

    # cleanup cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => 'RepositoryList',
    );

    return 1;
}

=head2 RepositoryRemove()

remove a package from local repository

    $PackageObject->RepositoryRemove(
        Name    => 'Application A',
        Version => '1.0',
    );

=cut

sub RepositoryRemove {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Name not defined!',
        );
        return;
    }

    # create sql
    my @Bind = ( \$Param{Name} );
    my $SQL  = 'DELETE FROM package_repository WHERE name = ?';
    if ( $Param{Version} ) {
        $SQL .= ' AND version = ?';
        push @Bind, \$Param{Version};
    }

    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => $SQL,
        Bind => \@Bind,
    );

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # cleanup cache
    $Self->_RepositoryCacheClear();

    return 1;
}

=head2 PackageInstall()

install a package

    $PackageObject->PackageInstall(
        String => $FileString,
        Force  => 1,             # optional 1 or 0, for to install package even if validation fails
    );

=cut

sub PackageInstall {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!',
        );
        return;
    }

    # Cleanup the repository cache before the package installation to have the current state
    #   during the installation.
    $Self->_RepositoryCacheClear();

    # conflict check
    my %Structure = $Self->PackageParse(%Param);

    # check if package is already installed
    if ( $Self->PackageIsInstalled( Name => $Structure{Name}->{Content} ) ) {
        if ( !$Param{Force} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'notice',
                Message  => 'Package already installed, trying upgrade!',
            );
            return $Self->PackageUpgrade(%Param);
        }
    }

    # write permission check
    return if !$Self->_FileSystemCheck();

    # check OS
    if ( $Structure{OS} && !$Param{Force} ) {
        return if !$Self->_OSCheck( OS => $Structure{OS} );
    }

    # check framework
    if ( $Structure{Framework} && !$Param{Force} ) {
        my %Check = $Self->AnalyzePackageFrameworkRequirements(
            Framework => $Structure{Framework},
        );
        return if !$Check{Success};
    }

    # check required packages
    if ( $Structure{PackageRequired} && !$Param{Force} ) {
        return if !$Self->_CheckPackageRequired(
            %Param,
            PackageRequired => $Structure{PackageRequired},
        );
    }

    # check required modules
    if ( $Structure{ModuleRequired} && !$Param{Force} ) {
        return if !$Self->_CheckModuleRequired(
            %Param,
            ModuleRequired => $Structure{ModuleRequired},
        );
    }

    # check merged packages
    if ( $Structure{PackageMerge} ) {

        # upgrade merged packages (no files)
        return if !$Self->_MergedPackages(
            %Param,
            Structure => \%Structure,
        );
    }

    # check files
    my $FileCheckOk = 1;
    if ( !$FileCheckOk && !$Param{Force} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'File conflict, can\'t install package!',
        );
        return;
    }

    # check if one of this files is already intalled by an other package
    if ( %Structure && !$Param{Force} ) {
        return if !$Self->_PackageFileCheck(
            Structure => \%Structure,
        );
    }

    # install code (pre)
    if ( $Structure{CodeInstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeInstall},
            Type      => 'pre',
            Structure => \%Structure,
        );
    }

    # install database (pre)
    if ( $Structure{DatabaseInstall} && $Structure{DatabaseInstall}->{pre} ) {

        my $DatabaseInstall = $Self->_CheckDBInstalledOrMerged( Database => $Structure{DatabaseInstall}->{pre} );

        if ( IsArrayRefWithData($DatabaseInstall) ) {
            $Self->_Database( Database => $DatabaseInstall );
        }
    }

    # install files
    if ( $Structure{Filelist} && ref $Structure{Filelist} eq 'ARRAY' ) {
        for my $File ( @{ $Structure{Filelist} } ) {
            $Self->_FileInstall( File => $File );
        }
    }

    # add package
    return if !$Self->RepositoryAdd(
        String => $Param{String},
    );

    # update package status
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE package_repository SET install_status = \''
            . Translatable('installed') . '\''
            . ' WHERE name = ? AND version = ?',
        Bind => [
            \$Structure{Name}->{Content},
            \$Structure{Version}->{Content},
        ],
    );

    # install config
    $Self->_ConfigurationDeploy(
        Comments => "Package Install $Structure{Name}->{Content} $Structure{Version}->{Content}",
        Package  => $Structure{Name}->{Content},
        Action   => 'PackageInstall',
    );

    # install database (post)
    if ( $Structure{DatabaseInstall} && $Structure{DatabaseInstall}->{post} ) {

        my $DatabaseInstall = $Self->_CheckDBInstalledOrMerged( Database => $Structure{DatabaseInstall}->{post} );

        if ( IsArrayRefWithData($DatabaseInstall) ) {
            $Self->_Database( Database => $DatabaseInstall );
        }
    }

    # install code (post)
    if ( $Structure{CodeInstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeInstall},
            Type      => 'post',
            Structure => \%Structure,
        );
    }

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        KeepTypes => [
            'XMLParse',
            'SysConfigDefaultListGet',
            'SysConfigDefaultList',
            'SysConfigDefault',
            'SysConfigPersistent',
            'SysConfigModifiedList',
        ],
    );
    $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();

    # trigger event
    $Self->EventHandler(
        Event => 'PackageInstall',
        Data  => {
            Name    => $Structure{Name}->{Content},
            Vendor  => $Structure{Vendor}->{Content},
            Version => $Structure{Version}->{Content},
        },
        UserID => 1,
    );

    return 1;
}

=head2 PackageReinstall()

reinstall files of a package

    $PackageObject->PackageReinstall( String => $FileString );

=cut

sub PackageReinstall {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!',
        );
        return;
    }

    # Cleanup the repository cache before the package reinstallation to have the current state
    #   during the reinstallation.
    $Self->_RepositoryCacheClear();

    # parse source file
    my %Structure = $Self->PackageParse(%Param);

    # check if package is installed
    if ( !$Self->PackageIsInstalled( Name => $Structure{Name}->{Content} ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => 'Package is not installed.',
        );
        return;
    }

    # write permission check
    return if !$Self->_FileSystemCheck();

    # check OS
    if ( $Structure{OS} && !$Param{Force} ) {
        return if !$Self->_OSCheck( OS => $Structure{OS} );
    }

    # check framework
    if ( $Structure{Framework} && !$Param{Force} ) {
        my %Check = $Self->AnalyzePackageFrameworkRequirements(
            Framework => $Structure{Framework},
        );
        return if !$Check{Success};
    }

    # reinstall code (pre)
    if ( $Structure{CodeReinstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeReinstall},
            Type      => 'pre',
            Structure => \%Structure,
        );
    }

    # install files
    if ( $Structure{Filelist} && ref $Structure{Filelist} eq 'ARRAY' ) {
        for my $File ( @{ $Structure{Filelist} } ) {

            # install file
            $Self->_FileInstall(
                File      => $File,
                Reinstall => 1,
            );
        }
    }

    # install config
    $Self->_ConfigurationDeploy(
        Comments => "Package Reinstall $Structure{Name}->{Content} $Structure{Version}->{Content}",
        Package  => $Structure{Name}->{Content},
        Action   => 'PackageReinstall',
    );

    # reinstall code (post)
    if ( $Structure{CodeReinstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeReinstall},
            Type      => 'post',
            Structure => \%Structure,
        );
    }

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        KeepTypes => [
            'XMLParse',
            'SysConfigDefaultListGet',
            'SysConfigDefaultList',
            'SysConfigDefault',
            'SysConfigPersistent',
            'SysConfigModifiedList',
        ],
    );
    $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();

    # trigger event
    $Self->EventHandler(
        Event => 'PackageReinstall',
        Data  => {
            Name    => $Structure{Name}->{Content},
            Vendor  => $Structure{Vendor}->{Content},
            Version => $Structure{Version}->{Content},
        },
        UserID => 1,
    );

    return 1;
}

=head2 PackageUpgrade()

upgrade a package

    $PackageObject->PackageUpgrade(
        String => $FileString,
        Force  => 1,             # optional 1 or 0, for to install package even if validation fails
    );

=cut

sub PackageUpgrade {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!',
        );
        return;
    }

    # Cleanup the repository cache before the package upgrade to have the current state
    #   during the upgrade.
    $Self->_RepositoryCacheClear();

    # conflict check
    my %Structure = $Self->PackageParse(%Param);

    # check if package is already installed
    my %InstalledStructure;
    my $Installed        = 0;
    my $InstalledVersion = 0;
    for my $Package ( $Self->RepositoryList() ) {

        if ( $Structure{Name}->{Content} eq $Package->{Name}->{Content} ) {

            if ( $Package->{Status} =~ /^installed$/i ) {
                $Installed          = 1;
                $InstalledVersion   = $Package->{Version}->{Content};
                %InstalledStructure = %{$Package};
            }
        }
    }

    if ( !$Installed ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Package is not installed, try an installation!',
        );
        return;
    }

    # write permission check
    return if !$Self->_FileSystemCheck();

    # check OS
    if ( $Structure{OS} && !$Param{Force} ) {
        return if !$Self->_OSCheck( OS => $Structure{OS} );
    }

    # check framework
    if ( $Structure{Framework} && !$Param{Force} ) {
        my %Check = $Self->AnalyzePackageFrameworkRequirements(
            Framework => $Structure{Framework},
        );
        return if !$Check{Success};
    }

    # check required packages
    if ( $Structure{PackageRequired} && !$Param{Force} ) {

        return if !$Self->_CheckPackageRequired(
            %Param,
            PackageRequired => $Structure{PackageRequired},
        );
    }

    # check required modules
    if ( $Structure{ModuleRequired} && !$Param{Force} ) {

        return if !$Self->_CheckModuleRequired(
            %Param,
            ModuleRequired => $Structure{ModuleRequired},
        );
    }

    # check merged packages
    if ( $Structure{PackageMerge} ) {

        # upgrade merged packages (no files)
        return if !$Self->_MergedPackages(
            %Param,
            Structure => \%Structure,
        );
    }

    # check version
    my $CheckVersion = $Self->CheckVersion(
        VersionNew       => $Structure{Version}->{Content},
        VersionInstalled => $InstalledVersion,
        Type             => 'Max',
    );

    if ( !$CheckVersion ) {

        if ( $Structure{Version}->{Content} eq $InstalledVersion ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't upgrade, package '$Structure{Name}->{Content}-$InstalledVersion' already installed!",
            );

            return if !$Param{Force};
        }
        else {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message =>
                    "Can't upgrade, installed package '$InstalledVersion' is newer as '$Structure{Version}->{Content}'!",
            );

            return if !$Param{Force};
        }
    }

    # check if one of this files is already installed by an other package
    if ( %Structure && !$Param{Force} ) {
        return if !$Self->_PackageFileCheck(
            Structure => \%Structure,
        );
    }

    # remove old package
    return if !$Self->RepositoryRemove( Name => $Structure{Name}->{Content} );

    # add new package
    return if !$Self->RepositoryAdd( String => $Param{String} );

    # update package status
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE package_repository SET install_status = \''
            . Translatable('installed') . '\''
            . ' WHERE name = ? AND version = ?',
        Bind => [
            \$Structure{Name}->{Content}, \$Structure{Version}->{Content},
        ],
    );

    # upgrade code (pre)
    if ( $Structure{CodeUpgrade} && ref $Structure{CodeUpgrade} eq 'ARRAY' ) {

        my @Parts;
        PART:
        for my $Part ( @{ $Structure{CodeUpgrade} } ) {

            if ( $Part->{Version} ) {

                # skip code upgrade block if its version is bigger than the new package version
                my $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $Structure{Version}->{Content},
                    Type             => 'Max',
                );

                next PART if $CheckVersion;

                $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $InstalledVersion,
                    Type             => 'Min',
                );

                if ( !$CheckVersion ) {
                    push @Parts, $Part;
                }
            }
            else {
                push @Parts, $Part;
            }
        }

        $Self->_Code(
            Code      => \@Parts,
            Type      => 'pre',
            Structure => \%Structure,
        );
    }

    # upgrade database (pre)
    if ( $Structure{DatabaseUpgrade}->{pre} && ref $Structure{DatabaseUpgrade}->{pre} eq 'ARRAY' ) {

        my @Parts;
        my $Use = 0;
        my $UseInstalled;
        my $NotUseTag;
        my $NotUseTagLevel;
        PARTDB:
        for my $Part ( @{ $Structure{DatabaseUpgrade}->{pre} } ) {

            if ( !$UseInstalled ) {

                if (
                    $Part->{TagType} eq 'End'
                    && ( defined $NotUseTag      && $Part->{Tag} eq $NotUseTag )
                    && ( defined $NotUseTagLevel && $Part->{TagLevel} eq $NotUseTagLevel )
                    )
                {
                    $UseInstalled = 1;
                }

                next PARTDB;

            }
            elsif (
                (
                    defined $Part->{IfPackage}
                    && !$Self->{MergedPackages}->{ $Part->{IfPackage} }
                )
                || (
                    defined $Part->{IfNotPackage}
                    &&
                    (
                        defined $Self->{MergedPackages}->{ $Part->{IfNotPackage} }
                        || $Self->PackageIsInstalled( Name => $Part->{IfNotPackage} )
                    )
                )
                )
            {
                # store Tag and TagLevel to be used later and found the end of this level
                $NotUseTag      = $Part->{Tag};
                $NotUseTagLevel = $Part->{TagLevel};

                $UseInstalled = 0;

                next PARTDB;
            }

            if ( $Part->{TagLevel} == 3 && $Part->{Version} ) {

                my $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $InstalledVersion,
                    Type             => 'Min',
                );

                if ( !$CheckVersion ) {
                    $Use   = 1;
                    @Parts = ();
                    push @Parts, $Part;
                }
            }
            elsif ( $Use && $Part->{TagLevel} == 3 && $Part->{TagType} eq 'End' ) {
                $Use = 0;
                push @Parts, $Part;
                $Self->_Database( Database => \@Parts );
            }
            elsif ($Use) {
                push @Parts, $Part;
            }
        }
    }

    # uninstall old package files
    if ( $InstalledStructure{Filelist} && ref $InstalledStructure{Filelist} eq 'ARRAY' ) {
        for my $File ( @{ $InstalledStructure{Filelist} } ) {

            # remove file
            $Self->_FileRemove( File => $File );
        }
    }

    # install files
    if ( $Structure{Filelist} && ref $Structure{Filelist} eq 'ARRAY' ) {
        for my $File ( @{ $Structure{Filelist} } ) {

            # install file
            $Self->_FileInstall( File => $File );
        }
    }

    # install config
    $Self->_ConfigurationDeploy(
        Comments => "Package Upgrade $Structure{Name}->{Content} $Structure{Version}->{Content}",
        Package  => $Structure{Name}->{Content},
        Action   => 'PackageUpgrade',
    );

    # upgrade database (post)
    if ( $Structure{DatabaseUpgrade}->{post} && ref $Structure{DatabaseUpgrade}->{post} eq 'ARRAY' )
    {

        my @Parts;
        my $Use          = 0;
        my $UseInstalled = 1;
        my $NotUseTag;
        my $NotUseTagLevel;
        PARTDB:
        for my $Part ( @{ $Structure{DatabaseUpgrade}->{post} } ) {

            if ( !$UseInstalled ) {

                if (
                    $Part->{TagType} eq 'End'
                    && ( defined $NotUseTag      && $Part->{Tag} eq $NotUseTag )
                    && ( defined $NotUseTagLevel && $Part->{TagLevel} eq $NotUseTagLevel )
                    )
                {
                    $UseInstalled = 1;
                }

                next PARTDB;

            }
            elsif (
                (
                    defined $Part->{IfPackage}
                    && !$Self->{MergedPackages}->{ $Part->{IfPackage} }
                )
                || (
                    defined $Part->{IfNotPackage}
                    && (
                        defined $Self->{MergedPackages}->{ $Part->{IfNotPackage} }
                        || $Self->PackageIsInstalled( Name => $Part->{IfNotPackage} )
                    )
                )
                )
            {
                # store Tag and TagLevel to be used later and found the end of this level
                $NotUseTag      = $Part->{Tag};
                $NotUseTagLevel = $Part->{TagLevel};

                $UseInstalled = 0;

                next PARTDB;
            }

            if ( $Part->{TagLevel} == 3 && $Part->{Version} ) {

                my $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $InstalledVersion,
                    Type             => 'Min',
                );

                if ( !$CheckVersion ) {
                    $Use   = 1;
                    @Parts = ();
                    push @Parts, $Part;
                }
            }
            elsif ( $Use && $Part->{TagLevel} == 3 && $Part->{TagType} eq 'End' ) {

                $Use = 0;
                push @Parts, $Part;
                $Self->_Database( Database => \@Parts );
            }
            elsif ($Use) {
                push @Parts, $Part;
            }
        }
    }

    # upgrade code (post)
    if ( $Structure{CodeUpgrade} && ref $Structure{CodeUpgrade} eq 'ARRAY' ) {

        my @Parts;
        PART:
        for my $Part ( @{ $Structure{CodeUpgrade} } ) {

            if ( $Part->{Version} ) {

                # skip code upgrade block if its version is bigger than the new package version
                my $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $Structure{Version}->{Content},
                    Type             => 'Max',
                );

                next PART if $CheckVersion;

                $CheckVersion = $Self->CheckVersion(
                    VersionNew       => $Part->{Version},
                    VersionInstalled => $InstalledVersion,
                    Type             => 'Min',
                );

                if ( !$CheckVersion ) {
                    push @Parts, $Part;
                }
            }
            else {
                push @Parts, $Part;
            }
        }

        $Self->_Code(
            Code      => \@Parts,
            Type      => 'post',
            Structure => \%Structure,
        );
    }

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        KeepTypes => [
            'XMLParse',
            'SysConfigDefaultListGet',
            'SysConfigDefaultList',
            'SysConfigDefault',
            'SysConfigPersistent',
            'SysConfigModifiedList',
        ],
    );
    $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();

    # trigger event
    $Self->EventHandler(
        Event => 'PackageUpgrade',
        Data  => {
            Name    => $Structure{Name}->{Content},
            Vendor  => $Structure{Vendor}->{Content},
            Version => $Structure{Version}->{Content},
        },
        UserID => 1,
    );

    return 1;
}

=head2 PackageUninstall()

uninstall a package

    $PackageObject->PackageUninstall( String => $FileString );

=cut

sub PackageUninstall {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!'
        );
        return;
    }

    # Cleanup the repository cache before the package uninstallation to have the current state
    #   during the uninstallation.
    $Self->_RepositoryCacheClear();

    # parse source file
    my %Structure = $Self->PackageParse(%Param);

    # check depends
    if ( !$Param{Force} ) {
        return if !$Self->_CheckPackageDepends( Name => $Structure{Name}->{Content} );
    }

    # write permission check
    return if !$Self->_FileSystemCheck();

    # uninstall code (pre)
    if ( $Structure{CodeUninstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeUninstall},
            Type      => 'pre',
            Structure => \%Structure,
        );
    }

    # uninstall database (pre)
    if ( $Structure{DatabaseUninstall} && $Structure{DatabaseUninstall}->{pre} ) {
        $Self->_Database( Database => $Structure{DatabaseUninstall}->{pre} );
    }

    # files
    my $FileCheckOk = 1;
    if ( $Structure{Filelist} && ref $Structure{Filelist} eq 'ARRAY' ) {
        for my $File ( @{ $Structure{Filelist} } ) {

            # remove file
            $Self->_FileRemove( File => $File );
        }
    }

    # remove old packages
    $Self->RepositoryRemove( Name => $Structure{Name}->{Content} );

    # install config
    $Self->_ConfigurationDeploy(
        Comments => "Package Uninstall $Structure{Name}->{Content} $Structure{Version}->{Content}",
        Package  => $Structure{Name}->{Content},
        Action   => 'PackageUninstall',
    );

    # uninstall database (post)
    if ( $Structure{DatabaseUninstall} && $Structure{DatabaseUninstall}->{post} ) {
        $Self->_Database( Database => $Structure{DatabaseUninstall}->{post} );
    }

    # uninstall code (post)
    if ( $Structure{CodeUninstall} ) {
        $Self->_Code(
            Code      => $Structure{CodeUninstall},
            Type      => 'post',
            Structure => \%Structure,
        );
    }

    # install config
    $Self->{ConfigObject} = Kernel::Config->new( %{$Self} );

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        KeepTypes => [
            'XMLParse',
            'SysConfigDefaultListGet',
            'SysConfigDefaultList',
            'SysConfigDefault',
            'SysConfigPersistent',
            'SysConfigModifiedList',
        ],
    );
    $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();

    # trigger event
    $Self->EventHandler(
        Event => 'PackageUninstall',
        Data  => {
            Name    => $Structure{Name}->{Content},
            Vendor  => $Structure{Vendor}->{Content},
            Version => $Structure{Version}->{Content},
        },
        UserID => 1,
    );

    return 1;
}

=head2 GetRequiredPackages()

This function returns an array of hashes that contains information
about C<RequiredPackages> of the .sopm-file.

    my $PackageRequired = $PackageObject->GetRequiredPackages(
        Structure => \%Structure,       # return of PackageParse()
    );

Returns:

    my $PackageRequired = (
      {
        'Name'                       => 'ITSMCore',
        'Version'                    => '',
        'IsInstalled'                => 'Problem',
        'IsRequiredVersionInstalled' => 0,
      },
      {
        'Name'                       => 'Survey',
        'Version'                    => '6.5.0',
        'IsInstalled'                => 'OK',
        'IsRequiredVersionInstalled' => 1,
      }
    );

=cut

sub GetRequiredPackages {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    NEEDED:
    for my $Needed (qw(Structure)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    NEEDED:
    for my $Needed (qw(PackageRequired)) {

        next NEEDED if defined $Param{Structure}->{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @RepositoryList = $PackageObject->RepositoryList();
    my @Requirements;

    for my $Element ( sort @{ $Param{Structure}->{PackageRequired} } ) {

        my $PackageIsInstalled = $PackageObject->PackageIsInstalled(
            Name => $Element->{Content}
        );

        my $IsInstalled = 0;
        if ($PackageIsInstalled) {
            $IsInstalled = 1;
        }

        my $Version                    = $Element->{Version} // "";
        my $IsRequiredVersionInstalled = 1;

        # if the required package is already installed, check if the installed version is high enough.
        if ( $IsInstalled eq 1 && $Version ne "" ) {
            my $InstalledVersion = 0;

            LOCAL:
            for my $Local (@RepositoryList) {
                next LOCAL if $Local->{Name}->{Content} ne $Element->{Content};
                next LOCAL if $Local->{Status} ne 'installed';

                $InstalledVersion = $Local->{Version}->{Content};
                last LOCAL;
            }

            my $CheckVersion = $PackageObject->CheckVersion(
                VersionNew       => $Version,
                VersionInstalled => $InstalledVersion,
                Type             => 'Min',
            );

            if ( !$CheckVersion ) {
                $IsInstalled                = 0;
                $IsRequiredVersionInstalled = 0;
            }
        }

        push @Requirements, {
            Name                       => $Element->{Content},
            Version                    => $Version,
            IsInstalled                => $IsInstalled,
            IsRequiredVersionInstalled => $IsRequiredVersionInstalled,
        };
    }

    return \@Requirements;
}

=head2 RootRepositoryListGet()

Returns a list of available root repositories. These are the ones contained in the XML file
configured in SysConfig option Package::RepositoryRoot.

    my %List = $PackageObject->RootRepositoryListGet();

=cut

sub RootRepositoryListGet {
    my ( $Self, %Param ) = @_;

    return () if !$Self->{ConfigObject}->Get('Package::RepositoryRoot');

    # get repository list
    my $XML = '';
    URL:
    for my $URL ( @{ $Self->{ConfigObject}->Get('Package::RepositoryRoot') } ) {
        $XML = $Self->_Download( URL => $URL );

        last URL if $XML;
    }

    return if !$XML;

    my @XMLARRAY = $Kernel::OM->Get('Kernel::System::XML')->XMLParse( String => $XML );

    my %List;
    my $Name = '';

    TAG:
    for my $Tag (@XMLARRAY) {

        # just use start tags
        next TAG if $Tag->{TagType} ne 'Start';

        # reset package data
        if ( $Tag->{Tag} eq 'Repository' ) {
            $Name = '';
        }
        elsif ( $Tag->{Tag} eq 'Name' ) {
            $Name = $Tag->{Content};
        }
        elsif ( $Tag->{Tag} eq 'URL' ) {
            if ($Name) {
                $List{ $Tag->{Content} } = $Name;
            }
        }
    }

    return %List;
}

=head2 ConfiguredRepositoryListGet()

Returns the combined configuration of all configured repositories from
Package::RepositoryRoot and Package::RepositoryList.

    my %RepositoryList = $PackageObject->ConfiguredRepositoryListGet();

Returns:

    my %RepositoryList = (
        'Freebie Features' => {
            URL   => 'https://download.znuny.org/releases/packages',
        },
        'Znuny Open Source Add-ons' => {
            URL   => 'https://addons.znuny.com/public',
        },
        'Znuny GmbH' => {
            URL   => 'https://addons.znuny.com/private',
            AuthHeaderKey   => '...',
            AuthHeaderValue => '...',
        },
        'Customer Z' => {
            URL             => 'https://addons.znuny.com/private',
            AuthHeaderKey   => '...',
            AuthHeaderValue => '...',
        },
    );

=cut

sub ConfiguredRepositoryListGet {
    my ( $Self, %Param ) = @_;

    my %RepositoryList;

    my %RootRepositoryList = $Self->RootRepositoryListGet();
    for my $RootRepositoryURL ( sort keys %RootRepositoryList ) {
        my $RootRepositoryName = $RootRepositoryList{$RootRepositoryURL};

        $RepositoryList{$RootRepositoryName} = {
            URL => $RootRepositoryURL,
        };
    }

    my $RepositoryListFromConfig = $Self->{ConfigObject}->Get('Package::RepositoryList') // [];

    # Throw away old config structure to avoid problems (e.g. from ITSM bundle or ITSMCore
    # which overwrite Package::RepositoryList).
    $RepositoryListFromConfig = [] if ref $RepositoryListFromConfig ne 'ARRAY';

    REPOSITORYFROMCONFIG:
    for my $RepositoryFromConfig ( @{$RepositoryListFromConfig} ) {
        $RepositoryList{ $RepositoryFromConfig->{Name} } = {
            URL => $RepositoryFromConfig->{URL},
        };

        next REPOSITORYFROMCONFIG if !IsStringWithData( $RepositoryFromConfig->{AuthHeaderKey} );
        next REPOSITORYFROMCONFIG if !IsStringWithData( $RepositoryFromConfig->{AuthHeaderValue} );

        $RepositoryList{ $RepositoryFromConfig->{Name} }->{AuthHeaderKey}   = $RepositoryFromConfig->{AuthHeaderKey};
        $RepositoryList{ $RepositoryFromConfig->{Name} }->{AuthHeaderValue} = $RepositoryFromConfig->{AuthHeaderValue};
    }

    return %RepositoryList;
}

=head2 RepositoryPackageListGet()

Returns a list of available packages for the given source repository.

    my @List = $PackageObject->RepositoryPackageListGet(
        Source             => 'Example repository 1',   # the value of key 'Name' in item of SysConfig option Package::RepositoryList or a direct download URL
        Lang               => 'en',
        Cache              => 0,                        # (optional) use cached data
        IncludeSameVersion => 1,                        # (optional) also get packages already installed and with the same version
    );

=cut

sub RepositoryPackageListGet {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');

    for my $Needed (qw(Source Lang)) {
        if ( !defined $Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    $Param{IncludeSameVersion} //= 0;

    # check cache
    my $CacheKey = $Param{Source} . '-' . $Param{Lang} . '-' . $Param{IncludeSameVersion};
    if ( $Param{Cache} ) {
        my $Cache = $CacheObject->Get(
            Type => 'RepositoryPackageList',
            Key  => $CacheKey,
        );
        return @{$Cache} if $Cache;
    }

    my @Packages;

    # Default: Handle source as direct URL.
    my %DownloadParams = (
        URL => $Param{Source} . '/otrs.xml',
    );

    # If Source is a known repository name, use its URL and credentials instead.
    my %RepositoryList = $Self->ConfiguredRepositoryListGet();
    if ( $RepositoryList{ $Param{Source} } ) {
        my $Repository = $RepositoryList{ $Param{Source} };

        $DownloadParams{URL}             = $Repository->{URL} . '/otrs.xml';
        $DownloadParams{AuthHeaderKey}   = $Repository->{AuthHeaderKey};
        $DownloadParams{AuthHeaderValue} = $Repository->{AuthHeaderValue};
    }

    my %Package;
    my $Filelist;
    my $XML = $Self->_Download(%DownloadParams);
    return if !$XML;

    my @XMLARRAY = $Kernel::OM->Get('Kernel::System::XML')->XMLParse( String => $XML );

    if ( !@XMLARRAY ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => Translatable('Unable to parse repository index document.'),
        );
        return;
    }

    TAG:
    for my $Tag (@XMLARRAY) {

        # remember package
        if ( $Tag->{TagType} eq 'End' && $Tag->{Tag} eq 'Package' ) {
            if (%Package) {
                push @Packages, {%Package};
            }
            next TAG;
        }

        # just use start tags
        next TAG if $Tag->{TagType} ne 'Start';

        # reset package data
        if ( $Tag->{Tag} eq 'Package' ) {
            %Package  = ();
            $Filelist = 0;
        }
        elsif ( $Tag->{Tag} eq 'Framework' ) {
            push @{ $Package{Framework} }, $Tag;
        }
        elsif ( $Tag->{Tag} eq 'Filelist' ) {
            $Filelist = 1;
        }
        elsif ( $Filelist && $Tag->{Tag} eq 'FileDoc' ) {
            push @{ $Package{Filelist} }, $Tag;
        }
        elsif ( $Tag->{Tag} eq 'Description' ) {
            if ( !$Package{Description} ) {
                $Package{Description} = $Tag->{Content};
            }
            if ( $Tag->{Lang} eq $Param{Lang} ) {
                $Package{Description} = $Tag->{Content};
            }
        }
        elsif ( $Tag->{Tag} eq 'PackageRequired' ) {
            push @{ $Package{PackageRequired} }, $Tag;
        }
        else {
            $Package{ $Tag->{Tag} } = $Tag->{Content};
        }
    }

    # if not packages found, just return
    return if !@Packages;

    # just framework packages
    my @NewPackages;
    my $PackageForRequestedFramework = 0;
    for my $Package (@Packages) {

        my $FWCheckOk = 0;

        if ( $Package->{Framework} ) {

            my %Check = $Self->AnalyzePackageFrameworkRequirements(
                Framework => $Package->{Framework},
                NoLog     => 1
            );
            if ( $Check{Success} ) {
                $FWCheckOk                    = 1;
                $PackageForRequestedFramework = 1;
            }
        }

        if ($FWCheckOk) {
            push @NewPackages, $Package;
        }
    }

    # return if there are packages, just not for this framework version
    if ( @Packages && !$PackageForRequestedFramework ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message =>
                Translatable(
                'No packages for your framework version found in this repository, it only contains packages for other framework versions.'
                ),
        );
    }
    @Packages = @NewPackages;

    # just the newest packages
    my %Newest;
    for my $Package (@Packages) {

        if ( !$Newest{ $Package->{Name} } ) {
            $Newest{ $Package->{Name} } = $Package;
        }
        else {

            my $CheckVersion = $Self->CheckVersion(
                VersionNew       => $Package->{Version},
                VersionInstalled => $Newest{ $Package->{Name} }->{Version},
                Type             => 'Min',
            );

            if ( !$CheckVersion ) {
                $Newest{ $Package->{Name} } = $Package;
            }
        }
    }

    # get possible actions
    @NewPackages = ();
    my @LocalList = $Self->RepositoryList();

    for my $Data ( sort keys %Newest ) {

        my $InstalledSameVersion = 0;

        PACKAGE:
        for my $Package (@LocalList) {

            next PACKAGE if $Newest{$Data}->{Name} ne $Package->{Name}->{Content};

            $Newest{$Data}->{Local} = 1;

            next PACKAGE if $Package->{Status} ne 'installed';

            $Newest{$Data}->{Installed} = 1;

            if (
                !$Self->CheckVersion(
                    VersionNew       => $Newest{$Data}->{Version},
                    VersionInstalled => $Package->{Version}->{Content},
                    Type             => 'Min',
                )
                )
            {
                $Newest{$Data}->{Upgrade} = 1;
            }

            # check if version or lower is already installed
            elsif (
                !$Self->CheckVersion(
                    VersionNew       => $Newest{$Data}->{Version},
                    VersionInstalled => $Package->{Version}->{Content},
                    Type             => 'Max',
                )
                )
            {
                $InstalledSameVersion = 1;
            }
        }

        # add package if not already installed
        if ( !$InstalledSameVersion || $Param{IncludeSameVersion} ) {
            push @NewPackages, $Newest{$Data};
        }
    }

    @Packages = @NewPackages;

    # Sort packages by name and then by version (ascending).
    @Packages = sort {
        ( my $ComparableVersionA = $a->{Version} ) =~ s{(\A(\d+)\.(\d+)\.(\d+)\z)}{
            sprintf( '%03u%03u%03u', $2, $3, $4 );
        }e;
        ( my $ComparableVersionB = $b->{Version} ) =~ s{(\A(\d+)\.(\d+)\.(\d+)\z)}{
            sprintf( '%03u%03u%03u', $2, $3, $4 );
        }e;

        $a->{Name} cmp $b->{Name}
            || $ComparableVersionA <=> $ComparableVersionB
    } @Packages;

    # set cache
    if ( $Param{Cache} ) {
        $CacheObject->Set(
            Type  => 'RepositoryPackageList',
            Key   => $CacheKey,
            Value => \@Packages,
            TTL   => 60 * 60,
        );
    }

    return @Packages;
}

=head2 PackageOnlineGet()

download online package and put it into the local repository

    $PackageObject->PackageOnlineGet(
        Source => 'http://host.example.com/', # or the name of a configured repository in Package::RepositoryList
        File   => 'SomePackage-1.0.opm',
    );

=cut

sub PackageOnlineGet {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(File Source)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    my $FileName = $Param{File};

    # Try to map filename without version/suffix 'opm' to the real filename in repository
    my @Packages = $Self->RepositoryPackageListGet(
        Source             => $Param{Source},
        Lang               => $Kernel::OM->Get('Kernel::Config')->Get('DefaultLanguage'),
        IncludeSameVersion => 1,
    );
    if (@Packages) {
        my $MatchingPackageByFileNameFound = grep { $_->{File} eq $FileName } @Packages;
        if ( !$MatchingPackageByFileNameFound ) {
            my @MatchingPackagesByPackageName = grep { $_->{Name} eq $FileName } @Packages;
            if (@MatchingPackagesByPackageName) {
                my $Package = shift @MatchingPackagesByPackageName;
                $FileName = $Package->{File};
            }
        }
    }

    # Default: Handle source as direct URL.
    my %DownloadParams = (
        URL => $Param{Source} . '/' . $FileName,
    );

    # If Source is a known repository name, use its URL and credentials instead.
    my %RepositoryList = $Self->ConfiguredRepositoryListGet();
    if ( $RepositoryList{ $Param{Source} } ) {
        my $Repository = $RepositoryList{ $Param{Source} };

        $DownloadParams{URL}             = $Repository->{URL} . '/' . $FileName;
        $DownloadParams{AuthHeaderKey}   = $Repository->{AuthHeaderKey};
        $DownloadParams{AuthHeaderValue} = $Repository->{AuthHeaderValue};
    }

    return $Self->_Download(%DownloadParams);
}

=head2 DeployCheck()

check if package (files) is deployed, returns true if it's ok

    $PackageObject->DeployCheck(
        Name    => 'Application A',
        Version => '1.0',
        Log     => 1,       # Default: 1
    );

=cut

sub DeployCheck {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Name Version)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    if ( !defined $Param{Log} ) {
        $Param{Log} = 1;
    }

    my $Package   = $Self->RepositoryGet( %Param, Result => 'SCALAR' );
    my %Structure = $Self->PackageParse( String => $Package );

    $Self->{DeployCheckInfo} = undef;

    return 1 if !$Structure{Filelist};
    return 1 if ref $Structure{Filelist} ne 'ARRAY';

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $Hit = 0;
    for my $File ( @{ $Structure{Filelist} } ) {

        my $LocalFile = $Self->{Home} . '/' . $File->{Location};

        if ( !-e $LocalFile ) {

            if ( $Param{Log} ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "$Param{Name}-$Param{Version}: No such file: $LocalFile!",
                );
            }

            $Self->{DeployCheckInfo}->{File}->{ $File->{Location} } = Translatable('File is not installed!');
            $Hit = 1;
        }
        elsif ( -e $LocalFile ) {

            my $Content = $MainObject->FileRead(
                Location => $Self->{Home} . '/' . $File->{Location},
                Mode     => 'binmode',
            );

            if ($Content) {

                if ( ${$Content} ne $File->{Content} ) {

                    if ( $Param{Log} && !$Kernel::OM->Get('Kernel::Config')->Get('Package::AllowLocalModifications') ) {
                        $Kernel::OM->Get('Kernel::System::Log')->Log(
                            Priority => 'error',
                            Message  => "$Param{Name}-$Param{Version}: $LocalFile is different!",
                        );
                    }

                    $Hit = 1;
                    $Self->{DeployCheckInfo}->{File}->{ $File->{Location} } = Translatable('File is different!');
                }
            }
            else {

                if ( $Param{Log} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Can't read $LocalFile!",
                    );
                }

                $Self->{DeployCheckInfo}->{File}->{ $File->{Location} } = Translatable('Can\'t read file!');
            }
        }
    }

    return if $Hit;
    return 1;
}

=head2 DeployCheckInfo()

returns the info of the latest DeployCheck(), what's not deployed correctly

    my %Hash = $PackageObject->DeployCheckInfo();

=cut

sub DeployCheckInfo {
    my ( $Self, %Param ) = @_;

    return %{ $Self->{DeployCheckInfo} }
        if $Self->{DeployCheckInfo};

    return ();
}

=head2 PackageBuild()

build an opm package

    my $Package = $PackageObject->PackageBuild(
        Name => {
            Content => 'SomePackageName',
        },
        Version => {
            Content => '1.0',
        },
        Vendor => {
            Content => 'OTRS AG',
        },
        URL => {
            Content => 'L<http://otrs.org/>',
        },
        License => {
            Content => 'GNU GENERAL PUBLIC LICENSE Version 3, November 2007',
        }
        Description => [
            {
                Lang    => 'en',
                Content => 'english description',
            },
            {
                Lang    => 'de',
                Content => 'german description',
            },
        ],
        Filelist = [
            {
                Location   => 'Kernel/System/Lala.pm',
                Permission => '644',
                Content    => $FileInString,
            },
            {
                Location   => 'Kernel/System/Lulu.pm',
                Permission => '644',
                Content    => $FileInString,
            },
        ],
    );

=cut

sub PackageBuild {
    my ( $Self, %Param ) = @_;

    my $XML  = '';
    my $Home = $Param{Home} || $Self->{ConfigObject}->Get('Home');

    for my $Needed (qw(Name Version Vendor License Description)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    # find framework, may we need do some things different to be compat. to 2.2
    my $Framework;
    if ( $Param{Framework} ) {

        FW:
        for my $FW ( @{ $Param{Framework} } ) {

            next FW if $FW->{Content} !~ /2\.2\./;

            $Framework = '2.2';

            last FW;
        }
    }

    # build xml
    if ( !$Param{Type} ) {
        $XML .= '<?xml version="1.0" encoding="utf-8" ?>';
        $XML .= "\n";
        $XML .= '<otrs_package version="1.1">';
        $XML .= "\n";
    }

    TAG:
    for my $Tag (
        qw(Name Version Vendor URL License ChangeLog Description Framework OS
        IntroInstall IntroUninstall IntroReinstall IntroUpgrade
        PackageIsVisible PackageIsDownloadable PackageIsRemovable PackageAllowDirectUpdate PackageMerge
        PackageRequired ModuleRequired CodeInstall CodeUpgrade CodeUninstall CodeReinstall)
        )
    {

        # don't use CodeInstall CodeUpgrade CodeUninstall CodeReinstall in index mode
        if ( $Param{Type} && $Tag =~ /(Code|Intro)(Install|Upgrade|Uninstall|Reinstall)/ ) {
            next TAG;
        }

        if ( ref $Param{$Tag} eq 'HASH' ) {

            my %OldParam;
            for my $Item (qw(Content Encode TagType Tag TagLevel TagCount TagKey TagLastLevel)) {
                $OldParam{$Item} = $Param{$Tag}->{$Item} || '';
                delete $Param{$Tag}->{$Item};
            }

            $XML .= "    <$Tag";

            for my $Item ( sort keys %{ $Param{$Tag} } ) {
                $XML .= " $Item=\"" . $Self->_Encode( $Param{$Tag}->{$Item} ) . "\"";
            }

            $XML .= ">";
            $XML .= $Self->_Encode( $OldParam{Content} ) . "</$Tag>\n";
        }
        elsif ( ref $Param{$Tag} eq 'ARRAY' ) {

            for my $Item ( @{ $Param{$Tag} } ) {

                my $TagSub = $Tag;
                my %Hash   = %{$Item};
                my %OldParam;

                for my $HashParam (
                    qw(Content Encode TagType Tag TagLevel TagCount TagKey TagLastLevel)
                    )
                {
                    $OldParam{$HashParam} = $Hash{$HashParam} || '';
                    delete $Hash{$HashParam};
                }

                # compat. to 2.2
                if ( $Framework && $Tag =~ /^Intro/ ) {
                    if ( $Hash{Type} eq 'pre' ) {
                        $Hash{Type} = 'Pre';
                    }
                    else {
                        $Hash{Type} = 'Post';
                    }
                    $TagSub = $Tag . $Hash{Type};
                    delete $Hash{Type};
                }

                $XML .= "    <$TagSub";

                for my $Item ( sort keys %Hash ) {
                    $XML .= " $Item=\"" . $Self->_Encode( $Hash{$Item} ) . "\"";
                }

                $XML .= ">";
                $XML .= $Self->_Encode( $OldParam{Content} ) . "</$TagSub>\n";
            }
        }
    }

    # don't use Build* in index mode
    if ( !$Param{Type} ) {

        # get time object
        my $DateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');

        $XML .= "    <BuildDate>" . $DateTimeObject->ToString() . "</BuildDate>\n";
        $XML .= "    <BuildHost>" . $Self->{ConfigObject}->Get('FQDN') . "</BuildHost>\n";
    }

    if ( $Param{Filelist} ) {

        # get main object
        my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

        $XML .= "    <Filelist>\n";

        FILE:
        for my $File ( @{ $Param{Filelist} } ) {

            my %OldParam;

            for my $Item (qw(Content Encode TagType Tag TagLevel TagCount TagKey TagLastLevel)) {
                $OldParam{$Item} = $File->{$Item} || '';
                delete $File->{$Item};
            }

            # do only use doc/* Filelist in index mode
            next FILE if $Param{Type} && $File->{Location} !~ /^doc\//;

            if ( !$Param{Type} ) {
                $XML .= "        <File";
            }
            else {
                $XML .= "        <FileDoc";
            }
            for my $Item ( sort keys %{$File} ) {
                if ( $Item ne 'Tag' && $Item ne 'Content' && $Item ne 'TagType' && $Item ne 'Size' )
                {
                    $XML
                        .= " "
                        . $Self->_Encode($Item) . "=\""
                        . $Self->_Encode( $File->{$Item} ) . "\"";
                }
            }

            # don't use content in in index mode
            if ( !$Param{Type} ) {
                $XML .= " Encode=\"Base64\">";
                my $FileContent = $MainObject->FileRead(
                    Location => $Home . '/' . $File->{Location},
                    Mode     => 'binmode',
                );

                return if !defined $FileContent;

                $XML .= encode_base64( ${$FileContent}, '' );
                $XML .= "</File>\n";
            }
            else {
                $XML .= " >";
                $XML .= "</FileDoc>\n";
            }
        }
        $XML .= "    </Filelist>\n";
    }

    # don't use Database* in index mode
    return $XML if $Param{Type};

    TAG:
    for my $Item (qw(DatabaseInstall DatabaseUpgrade DatabaseReinstall DatabaseUninstall)) {

        if ( ref $Param{$Item} ne 'HASH' ) {
            next TAG;
        }

        for my $Type ( sort %{ $Param{$Item} } ) {

            if ( $Param{$Item}->{$Type} ) {

                my $Counter = 1;
                for my $Tag ( @{ $Param{$Item}->{$Type} } ) {

                    if ( $Tag->{TagType} eq 'Start' ) {

                        my $Space = '';
                        for my $Current ( 1 .. $Counter ) {
                            $Space .= '    ';
                        }

                        $Counter++;
                        $XML .= $Space . "<$Tag->{Tag}";

                        if ( $Tag->{TagLevel} == 3 ) {
                            $XML .= " Type=\"$Type\"";
                        }

                        KEY:
                        for my $Key ( sort keys %{$Tag} ) {

                            next KEY if $Key eq 'Tag';
                            next KEY if $Key eq 'Content';
                            next KEY if $Key eq 'TagType';
                            next KEY if $Key eq 'TagLevel';
                            next KEY if $Key eq 'TagCount';
                            next KEY if $Key eq 'TagKey';
                            next KEY if $Key eq 'TagLastLevel';

                            next KEY if !defined $Tag->{$Key};

                            next KEY if $Tag->{TagLevel} == 3 && lc $Key eq 'type';

                            $XML .= ' '
                                . $Self->_Encode($Key) . '="'
                                . $Self->_Encode( $Tag->{$Key} ) . '"';
                        }

                        $XML .= ">";

                        if ( $Tag->{TagLevel} <= 3 || $Tag->{Tag} =~ /(Foreign|Reference|Index)/ ) {
                            $XML .= "\n";
                        }
                    }
                    if (
                        defined( $Tag->{Content} )
                        && $Tag->{TagLevel} >= 4
                        && $Tag->{Tag} !~ /(Foreign|Reference|Index)/
                        )
                    {
                        $XML .= $Self->_Encode( $Tag->{Content} );
                    }
                    if ( $Tag->{TagType} eq 'End' ) {

                        $Counter = $Counter - 1;
                        if ( $Tag->{TagLevel} > 3 && $Tag->{Tag} !~ /(Foreign|Reference|Index)/ ) {
                            $XML .= "</$Tag->{Tag}>\n";
                        }
                        else {

                            my $Space = '';

                            for my $Current ( 1 .. $Counter ) {
                                $Space .= '    ';
                            }

                            $XML .= $Space . "</$Tag->{Tag}>\n";
                        }
                    }
                }
            }
        }
    }

    $XML .= '</otrs_package>';

    return $XML;
}

=head2 PackageParse()

parse a package

    my %Structure = $PackageObject->PackageParse( String => $FileString );

=cut

sub PackageParse {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{String} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'String not defined!',
        );
        return;
    }

    # create checksum
    my $CookedString = ref $Param{String} ? ${ $Param{String} } : $Param{String};

    $Kernel::OM->Get('Kernel::System::Encode')->EncodeOutput( \$CookedString );

    # create checksum
    my $Checksum = $Kernel::OM->Get('Kernel::System::Main')->MD5sum(
        String => \$CookedString,
    );

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # check cache
    if ($Checksum) {
        my $Cache = $CacheObject->Get(
            Type => 'PackageParse',
            Key  => $Checksum,

            # Don't store complex structure in memory as it will be modified later.
            CacheInMemory => 0,
        );
        return %{$Cache} if $Cache;
    }

    # get xml object
    my $XMLObject = $Kernel::OM->Get('Kernel::System::XML');

    my @XMLARRAY = eval {
        $XMLObject->XMLParse(%Param);
    };

    if ( !IsArrayRefWithData( \@XMLARRAY ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid XMLParse in PackageParse()!",
        );
        return;
    }

    my %Package;

    # parse package
    my %PackageMap = %{ $Self->{PackageMap} };

    TAG:
    for my $Tag (@XMLARRAY) {

        next TAG if $Tag->{TagType} ne 'Start';

        if ( $PackageMap{ $Tag->{Tag} } && $PackageMap{ $Tag->{Tag} } eq 'SCALAR' ) {
            $Package{ $Tag->{Tag} } = $Tag;
        }
        elsif ( $PackageMap{ $Tag->{Tag} } && $PackageMap{ $Tag->{Tag} } eq 'ARRAY' ) {

            # For compat. to 2.2 - convert Intro(Install|Upgrade|Unintall)(Pre|Post) to
            # e. g. <IntroInstall Type="post">.
            if ( $Tag->{Tag} =~ /^(Intro(Install|Upgrade|Uninstall))(Pre|Post)/ ) {
                $Tag->{Tag}  = $1;
                $Tag->{Type} = lc $3;
            }

            # Set default type of Code* and Intro* to post.
            elsif ( $Tag->{Tag} =~ /^(Code|Intro)/ && !$Tag->{Type} ) {
                $Tag->{Type} = 'post';
            }

            push @{ $Package{ $Tag->{Tag} } }, $Tag;
        }
    }

    # define names and locations that are not allowed for files in a package
    my $FilesNotAllowed = [
        'Kernel/Config.pm$',
        'Kernel/Config/Files/ZZZAuto.pm$',
        'Kernel/Config/Files/ZZZAAuto.pm$',
        'Kernel/Config/Files/ZZZProcessManagement.pm$',
        'var/tmp/Cache',
        'var/log/',
        '\.\./',
        '^/',
    ];

    my $Open = 0;
    TAG:
    for my $Tag (@XMLARRAY) {

        if ( $Open && $Tag->{Tag} eq 'Filelist' ) {
            $Open = 0;
        }
        elsif ( !$Open && $Tag->{Tag} eq 'Filelist' ) {
            $Open = 1;
            next TAG;
        }

        if ( $Open && $Tag->{TagType} eq 'Start' ) {

            # check for allowed file names and locations
            FILECHECK:
            for my $FileNotAllowed ( @{$FilesNotAllowed} ) {

                next FILECHECK if $Tag->{Location} !~ m{ $FileNotAllowed }xms;

                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Invalid file/location '$Tag->{Location}' in PackageParse()!",
                );

                next TAG;
            }

            # get attachment size
            {
                if ( $Tag->{Content} ) {

                    my $ContentPlain = 0;

                    if ( $Tag->{Encode} && $Tag->{Encode} eq 'Base64' ) {
                        $Tag->{Encode}  = '';
                        $Tag->{Content} = decode_base64( $Tag->{Content} );
                    }

                    $Tag->{Size} = bytes::length( $Tag->{Content} );
                }
            }

            push @{ $Package{Filelist} }, $Tag;
        }
    }

    for my $Key (qw(DatabaseInstall DatabaseUpgrade DatabaseReinstall DatabaseUninstall)) {

        my $Type = 'post';

        TAG:
        for my $Tag (@XMLARRAY) {

            if ( $Open && $Tag->{Tag} eq $Key ) {
                $Open = 0;
                push( @{ $Package{$Key}->{$Type} }, $Tag );
            }
            elsif ( !$Open && $Tag->{Tag} eq $Key ) {

                $Open = 1;

                if ( $Tag->{Type} ) {
                    $Type = $Tag->{Type};
                }
            }

            next TAG if !$Open;

            push @{ $Package{$Key}->{$Type} }, $Tag;
        }
    }

    # check if a structure is present
    if ( !%Package ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid package structure in PackageParse()!",
        );
        return;
    }

    # set cache
    if ($Checksum) {
        $CacheObject->Set(
            Type  => 'PackageParse',
            Key   => $Checksum,
            Value => \%Package,
            TTL   => 30 * 24 * 60 * 60,

            # Don't store complex structure in memory as it will be modified later.
            CacheInMemory => 0,
        );
    }

    return %Package;
}

=head2 PackageExport()

export files of an package

    $PackageObject->PackageExport(
        String => $FileString,
        Home   => '/path/to/export'
    );

=cut

sub PackageExport {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(String Home)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    # parse source file
    my %Structure = $Self->PackageParse(%Param);

    return 1 if !$Structure{Filelist};
    return 1 if ref $Structure{Filelist} ne 'ARRAY';

    # install files
    for my $File ( @{ $Structure{Filelist} } ) {

        $Self->_FileInstall(
            File => $File,
            Home => $Param{Home},
        );
    }

    return 1;
}

=head2 PackageIsInstalled()

returns true if the package is already installed

    $PackageObject->PackageIsInstalled(
        String => $PackageString,    # Attribute String or Name is required
        Name   => $NameOfThePackage,
    );

=cut

sub PackageIsInstalled {
    my ( $Self, %Param ) = @_;

    if ( !$Param{String} && !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need String (PackageString) or Name (Name of the package)!',
        );
        return;
    }

    if ( $Param{String} ) {
        my %Structure = $Self->PackageParse(%Param);
        $Param{Name} = $Structure{Name}->{Content};
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    $DBObject->Prepare(
        SQL => "SELECT name FROM package_repository "
            . "WHERE name = ? AND install_status = 'installed'",
        Bind  => [ \$Param{Name} ],
        Limit => 1,
    );

    my $Flag = 0;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Flag = 1;
    }

    return $Flag;
}

=head2 PackageInstallDefaultFiles()

returns true if the distribution package (located under ) can get installed

    $PackageObject->PackageInstallDefaultFiles();

=cut

sub PackageInstallDefaultFiles {
    my ( $Self, %Param ) = @_;

    # write permission check
    return if !$Self->_FileSystemCheck();

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $Directory    = $Self->{ConfigObject}->Get('Home') . '/var/packages';
    my @PackageFiles = $MainObject->DirectoryRead(
        Directory => $Directory,
        Filter    => '*.opm',
    );

    # read packages and install
    LOCATION:
    for my $Location (@PackageFiles) {

        # read package
        my $ContentSCALARRef = $MainObject->FileRead(
            Location => $Location,
            Mode     => 'binmode',
            Type     => 'Local',
            Result   => 'SCALAR',
        );

        next LOCATION if !$ContentSCALARRef;

        # install package (use eval to be safe)
        eval {
            $Self->PackageInstall( String => ${$ContentSCALARRef} );
        };

        next LOCATION if !$@;

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => $@,
        );
    }

    return 1;
}

=head2 PackageFileGetMD5Sum()

generates a MD5 Sum for all files in a given package

    my $MD5Sum = $PackageObject->PackageFileGetMD5Sum(
        Name    => 'Package Name',
        Version => 123.0,
    );

returns:

    $MD5SumLookup = {
        'Direcoty/File1' => 'f3f30bd59afadf542770d43edb280489',
        'Direcoty/File2' => 'ccb8a0b86adf125a36392e388eb96778',
    };

=cut

sub PackageFileGetMD5Sum {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Name Version)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
        }
    }

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    # check cache
    my $CacheKey = $Param{Name} . $Param{Version};
    my $Cache    = $CacheObject->Get(
        Type => 'PackageFileGetMD5Sum',
        Key  => $CacheKey,
    );
    return $Cache if IsHashRefWithData($Cache);

    # get the package contents
    my $Package = $Self->RepositoryGet(
        %Param,
        Result => 'SCALAR',
    );
    my %Structure = $Self->PackageParse( String => $Package );

    return {} if !$Structure{Filelist};
    return {} if ref $Structure{Filelist} ne 'ARRAY';

    # cleanup the Home variable (remove tailing "/")
    my $Home = $Self->{Home};
    $Home =~ s{\/\z}{};

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my %MD5SumLookup;
    for my $File ( @{ $Structure{Filelist} } ) {

        my $LocalFile = $Home . '/' . $File->{Location};

        # generate the MD5Sum
        my $MD5Sum = $MainObject->MD5sum(
            String => \$File->{Content},
        );

        $MD5SumLookup{$LocalFile} = $MD5Sum;
    }

    # set cache
    $CacheObject->Set(
        Type  => 'PackageFileGetMD5Sum',
        Key   => $CacheKey,
        Value => \%MD5SumLookup,
        TTL   => 6 * 30 * 24 * 60 * 60,    # 6 Months (Aprox)
    );

    return \%MD5SumLookup;
}

=head2 AnalyzePackageFrameworkRequirements()

Compare a framework array with the current framework.

    my %CheckOk = $PackageObject->AnalyzePackageFrameworkRequirements(
        Framework => $Structure{Framework},     # [ { 'Content' => '4.0.x', 'Minimum' => '4.0.4'} ]
        NoLog     => 1, # optional
    );

    %CheckOK = (
        Success                  => 1,           # 1 || 0
        RequiredFramework        => '5.0.x',
        RequiredFrameworkMinimum => '5.0.10',
        RequiredFrameworkMaximum => '5.0.16',
    );

=cut

sub AnalyzePackageFrameworkRequirements {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Framework} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Framework not defined!',
        );
        return;
    }

    # check format
    if ( ref $Param{Framework} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need array ref in Framework param!',
        );
        return;
    }

    my %Response = (
        Success => 0,
    );

    my $FWCheck           = 0;
    my $CurrentFramework  = $Self->{ConfigObject}->Get('Version');
    my $PossibleFramework = '';

    if ( ref $Param{Framework} eq 'ARRAY' ) {

        FW:
        for my $FW ( @{ $Param{Framework} } ) {

            next FW if !$FW;

            # add framework versions for the log entry
            $PossibleFramework .= $FW->{Content} . ';';
            my $Framework = $FW->{Content};

            # add required framework to response hash
            $Response{RequiredFramework} = $Framework;

            # regexp modify
            $Framework =~ s/\./\\\./g;
            $Framework =~ s/x/.+?/gi;

            # skip to next framework, if we get no positive match
            next FW if $CurrentFramework !~ /^$Framework$/i;

            # framework is correct
            $FWCheck = 1;

            if ( !$Param{IgnoreMinimumMaximum} ) {

                # get minimum and/or maximum values
                # e.g. the opm contains <Framework Minimum="5.0.7" Maximum="5.0.12">5.0.x</Framework>
                my $FrameworkMinimum = $FW->{Minimum} || '';
                my $FrameworkMaximum = $FW->{Maximum} || '';

                # check for minimum or maximum required framework, if it was defined
                if ( $FrameworkMinimum || $FrameworkMaximum ) {

                    # prepare hash for framework comparsion
                    my %FrameworkComparsion;
                    $FrameworkComparsion{MinimumFrameworkRequired} = $FrameworkMinimum;
                    $FrameworkComparsion{MaximumFrameworkRequired} = $FrameworkMaximum;
                    $FrameworkComparsion{CurrentFramework}         = $CurrentFramework;

                    # prepare version parts hash
                    my %VersionParts;

                    TYPE:
                    for my $Type (qw(MinimumFrameworkRequired MaximumFrameworkRequired CurrentFramework)) {

                        # split version string
                        my @ThisVersionParts = split /\./, $FrameworkComparsion{$Type};
                        $VersionParts{$Type} = \@ThisVersionParts;
                    }

                    # check minimum required framework
                    if ($FrameworkMinimum) {

                        COUNT:
                        for my $Count ( 0 .. 2 ) {

                            $VersionParts{MinimumFrameworkRequired}->[$Count] ||= 0;
                            $VersionParts{CurrentFramework}->[$Count]         ||= 0;

                            # skip equal version parts
                            next COUNT
                                if $VersionParts{MinimumFrameworkRequired}->[$Count] eq
                                $VersionParts{CurrentFramework}->[$Count];

                            # skip current framework verion parts containing "x"
                            next COUNT if $VersionParts{CurrentFramework}->[$Count] =~ /x/;

                            if (
                                $VersionParts{CurrentFramework}->[$Count]
                                > $VersionParts{MinimumFrameworkRequired}->[$Count]
                                )
                            {
                                $FWCheck = 1;
                                last COUNT;
                            }
                            else {

                                # add required minimum version for the log entry
                                $PossibleFramework .= 'Minimum Version ' . $FrameworkMinimum . ';';

                                # add required minimum version to response hash
                                $Response{RequiredFrameworkMinimum} = $FrameworkMinimum;

                                $FWCheck = 0;
                            }
                        }
                    }

                    # check maximum required framework, if the framework check is still positive so far
                    if ( $FrameworkMaximum && $FWCheck ) {

                        COUNT:
                        for my $Count ( 0 .. 2 ) {

                            $VersionParts{MaximumFrameworkRequired}->[$Count] ||= 0;
                            $VersionParts{CurrentFramework}->[$Count]         ||= 0;

                            next COUNT
                                if $VersionParts{MaximumFrameworkRequired}->[$Count] eq
                                $VersionParts{CurrentFramework}->[$Count];

                            # skip current framework verion parts containing "x"
                            next COUNT if $VersionParts{CurrentFramework}->[$Count] =~ /x/;

                            if (
                                $VersionParts{CurrentFramework}->[$Count]
                                < $VersionParts{MaximumFrameworkRequired}->[$Count]
                                )
                            {

                                $FWCheck = 1;
                                last COUNT;
                            }
                            else {

                                # add required maximum version for the log entry
                                $PossibleFramework .= 'Maximum Version ' . $FrameworkMaximum . ';';

                                # add required maximum version to response hash
                                $Response{RequiredFrameworkMaximum} = $FrameworkMaximum;

                                $FWCheck = 0;
                            }

                        }
                    }
                }
            }

        }
    }

    if ($FWCheck) {
        $Response{Success} = 1;
    }
    elsif ( !$Param{NoLog} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Sorry, can't install/upgrade package, because the framework version required"
                . " by the package ($PossibleFramework) does not match your Framework ($CurrentFramework)!",
        );
    }

    return %Response;
}

=head2 PackageUpgradeAll()

Updates installed packages to their latest version.

    my %Result = $PackageObject->PackageUpgradeAll(
        Force           => 1,     # optional 1 or 0, Upgrades packages even if validation fails.
        SkipDeployCheck => 1,     # optional 1 or 0, If active it does not check file deployment status
                                  #     for already updated packages.
    );

    %Result = (
        Updated => {                # updated packages to the latest remote repository version
            PackageA => 1,
            PackageB => 1,
            PackageC => 1,
            # ...
        },
        Installed => {              # packages installed as a result of missing dependencies
            PackageD => 1,
            # ...
        },
        AlreadyInstalled {          # packages that are already installed with the latest version
            PackageE => 1,
            # ...
        }
        Undeployed {                # packages not correctly deployed
            PackageK => 1,
            # ...
        }
        Failed => {                 # or {} if no failures
            Cyclic => {             # packages with cyclic dependencies
                PackageF => 1,
                # ...
            },
            NotFound => {           # packages not listed in the remote repositories
                PackageG => 1,
                # ...
            },
            WrongVersion => {       # packages that require a major version that is not available in the remote repositories
                PackageH => 1,
                # ...
            },
            DependencyFail => {     # packages with dependencies that fail on any of the above reasons
                PackageI => 1,
                # ...
            },
        },
    );

=cut

sub PackageUpgradeAll {
    my ( $Self, %Param ) = @_;

    # Set system data as communication channel with the GUI
    my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');
    my $DataGroup        = 'Package_UpgradeAll';
    my %SystemData       = $SystemDataObject->SystemDataGroupGet(
        Group => $DataGroup,
    );
    if (%SystemData) {
        KEY:
        for my $Key (qw(StartTime UpdateTime InstalledPackages UpgradeResult Status Success))
        {    # remove any existing information
            next KEY if !defined $SystemData{$Key};

            my $Success = $SystemDataObject->SystemDataDelete(
                Key    => "${DataGroup}::${Key}",
                UserID => 1,
            );
            if ( !$Success ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not delete key ${DataGroup}::${Key} from SystemData!",
                );
            }
        }
    }
    my $CurrentDateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');
    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::StartTime",
        Value  => $CurrentDateTimeObject->ToString(),
        UserID => 1,
    );
    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::UpdateTime",
        Value  => $CurrentDateTimeObject->ToString(),
        UserID => 1,
    );
    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::Status",
        Value  => "Running",
        UserID => 1,
    );

    my %OnlinePackages = $Self->_PackageOnlineListGet();

    my @PackageOnlineList   = @{ $OnlinePackages{PackageList} };
    my %PackageSourceLookup = %{ $OnlinePackages{PackageLookup} };

    my @PackageInstalledList = $Self->RepositoryList(
        Result => 'short',
    );

    # Modify @PackageInstalledList if ITSM packages are installed from Bundle (see bug#13778).
    if (
        @PackageInstalledList && grep { $_->{Name} eq 'ITSM' }
        @PackageInstalledList && grep { $_->{Name} eq 'ITSM' } @PackageOnlineList
        )
    {
        my @TmpPackages = (
            'GeneralCatalog',
            'ITSMCore',
            'ITSMChangeManagement',
            'ITSMConfigurationManagement',
            'ITSMIncidentProblemManagement',
            'ITSMServiceLevelManagement',
            'ImportExport'
        );
        my %Values = map { $_ => 1 } @TmpPackages;
        @PackageInstalledList = grep { !$Values{ $_->{Name} } } @PackageInstalledList;
    }

    my $JSONObject = $Kernel::OM->Get('Kernel::System::JSON');
    my $JSON       = $JSONObject->Encode(
        Data => \@PackageInstalledList,
    );
    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::InstalledPackages",
        Value  => $JSON,
        UserID => 1,
    );
    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::UpgradeResult",
        Value  => '{}',
        UserID => 1,
    );

    my %Result = $Self->PackageInstallOrderListGet(
        InstalledPackages => \@PackageInstalledList,
        OnlinePackages    => \@PackageOnlineList,
    );

    my %InstallOrder = %{ $Result{InstallOrder} };
    my $Success      = 1;
    if ( IsHashRefWithData( $Result{Failed} ) ) {
        $Success = 0;
    }

    my %Failed = %{ $Result{Failed} };
    my %Installed;
    my %Updated;
    my %AlreadyUpdated;
    my %Undeployed;

    my %InstalledVersions = map { $_->{Name} => $_->{Version} } @PackageInstalledList;

    PACKAGENAME:
    for my $PackageName ( sort { $InstallOrder{$b} <=> $InstallOrder{$a} } keys %InstallOrder ) {
        my $MetaPackage = $PackageSourceLookup{$PackageName};

        next PACKAGENAME if !$MetaPackage;

        if ( $MetaPackage->{Version} eq ( $InstalledVersions{$PackageName} || '' ) ) {

            if ( $Param{SkipDeployCheck} ) {
                $AlreadyUpdated{$PackageName} = 1;
                next PACKAGENAME;
            }

            my $CheckSuccess = $Self->DeployCheck(
                Name    => $PackageName,
                Version => $MetaPackage->{Version},
                Log     => 0
            );
            if ( !$CheckSuccess ) {
                $Undeployed{$PackageName} = 1;
                next PACKAGENAME;
            }
            $AlreadyUpdated{$PackageName} = 1;
            next PACKAGENAME;
        }

        my $Package = $Self->PackageOnlineGet(
            Source => $MetaPackage->{Source},
            File   => $MetaPackage->{File},
        );

        if ( !$InstalledVersions{$PackageName} ) {
            my $InstallSuccess = $Self->PackageInstall(
                String => $Package,
                Force  => $Param{Force} || 0,
            );
            if ( !$InstallSuccess ) {
                $Success = 0;
                $Failed{InstallError}->{$PackageName} = 1;
                next PACKAGENAME;
            }
            $Installed{$PackageName} = 1;
            next PACKAGENAME;
        }

        my $UpdateSuccess = $Self->PackageUpgrade(
            String => $Package,
            Force  => $Param{Force} || 0,
        );
        if ( !$UpdateSuccess ) {
            $Success = 0;
            $Failed{UpdateError}->{$PackageName} = 1;
            next PACKAGENAME;
        }
        $Updated{$PackageName} = 1;
        next PACKAGENAME;
    }
    continue {
        my $JSON = $JSONObject->Encode(
            Data => {
                Updated        => \%Updated,
                Installed      => \%Installed,
                AlreadyUpdated => \%AlreadyUpdated,
                Undeployed     => \%Undeployed,
                Failed         => \%Failed,
            },
        );
        $SystemDataObject->SystemDataUpdate(
            Key    => "${DataGroup}::UpdateTime",
            Value  => $Kernel::OM->Create('Kernel::System::DateTime')->ToString(),
            UserID => 1,
        );
        $SystemDataObject->SystemDataUpdate(
            Key    => "${DataGroup}::UpgradeResult",
            Value  => $JSON,
            UserID => 1,
        );
    }

    $SystemDataObject->SystemDataAdd(
        Key    => "${DataGroup}::Success",
        Value  => $Success,
        UserID => 1,
    );
    $SystemDataObject->SystemDataUpdate(
        Key    => "${DataGroup}::Status",
        Value  => 'Finished',
        UserID => 1,
    );

    return (
        Success        => $Success,
        Updated        => \%Updated,
        Installed      => \%Installed,
        AlreadyUpdated => \%AlreadyUpdated,
        Undeployed     => \%Undeployed,
        Failed         => \%Failed,
    );
}

=head2 PackageInstallOrderListGet()

Gets a list of packages and its corresponding install order including is package dependencies. Higher
    install order means to install first.

    my %Result = $PackageObject->PackageInstallOrderListGet(
        InstalledPackages => \@PackageList,      # as returned from RepositoryList(Result => 'short')
        OnlinePackages    => \@PackageList,      # as returned from PackageOnlineList()
    );

    %Result = (
        InstallOrder => {
            PackageA => 3,
            PackageB => 2,
            PackageC => 1,
            PackageD => 1,
            # ...
        },
        Failed => {                 # or {} if no failures
            Cyclic => {             # packages with cyclic dependencies
                PackageE => 1,
                # ...
            },
            NotFound => {           # packages not listed in the remote repositories
                PackageF => 1,
                # ...
            },
            WrongVersion => {        # packages that require a major version that is not available in the remote repositories
                PackageG => 1,
                # ...
            },
            DependencyFail => {     # packages with dependencies that fail on any of the above reasons
                PackageH => 1,
                # ...
            }
        },
    );

=cut

sub PackageInstallOrderListGet {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(InstalledPackages OnlinePackages)) {
        if ( !$Param{$Needed} || ref $Param{$Needed} ne 'ARRAY' ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed is missing or invalid!",
            );
            return;
        }
    }

    my %InstalledVersions = map { $_->{Name} => $_->{Version} } @{ $Param{InstalledPackages} };

    my %OnlinePackageLookup = map { $_->{Name} => $_ } @{ $Param{OnlinePackages} };

    my %InstallOrder;
    my %Failed;

    my $DependenciesSuccess = $Self->_PackageInstallOrderListGet(
        Callers             => {},
        InstalledVersions   => \%InstalledVersions,
        TargetPackages      => \%InstalledVersions,
        InstallOrder        => \%InstallOrder,
        OnlinePackageLookup => \%OnlinePackageLookup,
        Failed              => \%Failed,
        IsDependency        => 0,
    );

    return (
        InstallOrder => \%InstallOrder,
        Failed       => \%Failed,
    );
}

=head2 PackageUpgradeAllDataDelete()

Removes all Package Upgrade All data from the database.

    my $Success = $PackageObject->PackageUpgradeAllDataDelete();

=cut

sub PackageUpgradeAllDataDelete {
    my ( $Self, %Param ) = @_;

    my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');
    my $DataGroup        = 'Package_UpgradeAll';
    my %SystemData       = $SystemDataObject->SystemDataGroupGet(
        Group => $DataGroup,
    );

    my $Success = 1;

    KEY:
    for my $Key (qw(StartTime UpdateTime InstalledPackages UpgradeResult Status Success)) {
        next KEY if !$SystemData{$Key};

        my $DeleteSuccess = $SystemDataObject->SystemDataDelete(
            Key    => "${DataGroup}::${Key}",
            UserID => 1,
        );
        if ( !$DeleteSuccess ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Could not delete key ${DataGroup}::${Key} from SystemData!",
            );
            $Success = 0;
        }
    }

    return 1;
}

=head2 PackageUpgradeAllIsRunning()

Check if there is a Package Upgrade All process running by checking the scheduler tasks and the
system data.

    my %Result = $PackageObject->PackageUpgradeAllIsRunning();

Returns:
    %Result = (
        IsRunning      => 1,             # or 0 if it is not running
        UpgradeStatus  => 'Running',     # (optional) 'Running' or 'Finished' or 'TimedOut',
        UpgradeSuccess => 1,             # (optional) 1 or 0,
    );

=cut

sub PackageUpgradeAllIsRunning {
    my ( $Self, %Param ) = @_;

    my $IsRunning;

    # Check if there is a task for the scheduler daemon (process started from GUI).
    my @List = $Kernel::OM->Get('Kernel::System::Scheduler')->TaskList(
        Type => 'AsynchronousExecutor',
    );
    if ( grep { $_->{Name} eq 'Kernel::System::Package-PackageUpgradeAll()' } @List ) {
        $IsRunning = 1;
    }

    my $SystemDataObject = $Kernel::OM->Get('Kernel::System::SystemData');
    my %SystemData       = $SystemDataObject->SystemDataGroupGet(
        Group => 'Package_UpgradeAll',
    );

    # If there is no task running but there is system data it might be that the is a running
    #   process from the CLI.
    if (
        !$IsRunning
        && %SystemData
        && $SystemData{Status}
        && $SystemData{Status} eq 'Running'
        )
    {
        $IsRunning = 1;

        # Check if the last update was more than 5 minutes ago (timed out).
        my $CurrentDateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');
        my $TargetDateTimeObject  = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                String => $SystemData{UpdateTime},
            }
        );
        $TargetDateTimeObject->Add( Minutes => 5 );
        if ( $CurrentDateTimeObject > $TargetDateTimeObject ) {
            $IsRunning = 0;
            $SystemData{Status} = 'TimedOut';
        }
    }

    return (
        IsRunning      => $IsRunning // 0,
        UpgradeStatus  => $SystemData{Status} || '',
        UpgradeSuccess => $SystemData{Success} || '',
    );
}

=head2 CheckVersion()

Compare the two version strings $VersionNew and $VersionInstalled.
The type is either 'Min' or 'Max'.
'Min' returns a true value if $VersionInstalled >= $VersionNew.
'Max' returns a true value if $VersionInstalled < $VersionNew.
Otherwise undef is returned in scalar context.

    my $CheckOk = $PackageObject->CheckVersion(
        VersionNew       => '1.3.92',
        VersionInstalled => '1.3.91',
        Type             => 'Min',     # 'Min' or 'Max'
        ExternalPackage  => 1,         # optional
    )

=cut

sub CheckVersion {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(VersionNew VersionInstalled Type)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    # check Type
    if ( $Param{Type} ne 'Min' && $Param{Type} ne 'Max' ) {

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Invalid Type!',
        );
        return;
    }

    # prepare parts hash
    my %Parts;
    TYPE:
    for my $Type (qw(VersionNew VersionInstalled)) {

        # split version string
        my @ThisParts = split /\./, $Param{$Type};

        $Parts{$Type} = \@ThisParts;
        $Parts{ $Type . 'Num' } = scalar @ThisParts;
    }

    # if it is not an external package, and the versions are different
    # we want to add a 0 at the end of the shorter version number
    # (1.2.3 will be modified to 1.2.3.0)
    # This is important to compare with a test-release version number
    if ( !$Param{ExternalPackage} && $Parts{VersionNewNum} ne $Parts{VersionInstalledNum} ) {

        TYPE:
        for my $Type (qw(VersionNew VersionInstalled)) {

            next TYPE if $Parts{ $Type . 'Num' } > 3;

            # add a zero at the end if number has less than 4 digits
            push @{ $Parts{$Type} }, 0;
            $Parts{ $Type . 'Num' } = scalar @{ $Parts{$Type} };
        }
    }

    COUNT:
    for my $Count ( 0 .. 5 ) {

        $Parts{VersionNew}->[$Count]       ||= 0;
        $Parts{VersionInstalled}->[$Count] ||= 0;

        next COUNT if $Parts{VersionNew}->[$Count] eq $Parts{VersionInstalled}->[$Count];

        # compare versions
        if ( $Param{Type} eq 'Min' ) {
            return 1 if $Parts{VersionInstalled}->[$Count] >= $Parts{VersionNew}->[$Count];
            return;
        }
        elsif ( $Param{Type} eq 'Max' ) {
            return 1 if $Parts{VersionInstalled}->[$Count] < $Parts{VersionNew}->[$Count];
            return;
        }
    }

    return 1 if $Param{Type} eq 'Min';
    return;
}

=head2 GetRequiredModules()

This function returns an array of hashes that contains information
about C<RequiredModules> of the .sopm-file.

    my $ModuleRequired = $PackageObject->GetRequiredModules(
        Structure => \%Structure,       # return of PackageParse()
    );

Returns:

    my $ModuleRequired = (
        {
          'Name'        => 'GD::Graph',
          'Version'     => undef,
          'IsInstalled' => 'Problem',
        },
        {
          'Name'        => 'Data::Dumper',
          'Version'     => '2.179',
          'IsInstalled' => 'OK',
        }
    );

=cut

sub GetRequiredModules {
    my ( $Self, %Param ) = @_;

    my $LogObject         = $Kernel::OM->Get('Kernel::System::Log');
    my $EnvironmentObject = $Kernel::OM->Get('Kernel::System::Environment');

    NEEDED:
    for my $Needed (qw(Structure)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    NEEDED:
    for my $Needed (qw(ModuleRequired)) {

        next NEEDED if defined $Param{Structure}->{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @Requirements;

    for my $Element ( sort @{ $Param{Structure}->{ModuleRequired} } ) {
        my $Version = $EnvironmentObject->ModuleVersionGet(
            Module => $Element->{Content},
        );

        my $IsInstalled = 0;
        if ($Version) {
            $IsInstalled = 1;
        }

        push @Requirements, {
            Name        => $Element->{Content},
            Version     => $Version,
            IsInstalled => $IsInstalled,
        };
    }

    return \@Requirements;
}

=begin Internal:

=cut

sub _Download {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{URL} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'URL not defined!',
        );
        return;
    }

    my $WebUserAgentObject = Kernel::System::WebUserAgent->new(
        Timeout => $Self->{ConfigObject}->Get('Package::Timeout'),
        Proxy   => $Self->{ConfigObject}->Get('Package::Proxy'),
    );

    my %Header;
    if (
        IsStringWithData( $Param{AuthHeaderKey} )
        && IsStringWithData( $Param{AuthHeaderValue} )
        )
    {
        $Header{ $Param{AuthHeaderKey} } = $Param{AuthHeaderValue};
    }

    my %Response = $WebUserAgentObject->Request(
        URL    => $Param{URL},
        Header => \%Header,
    );

    return if !$Response{Content};
    return ${ $Response{Content} };
}

sub _Database {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Database} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Database not defined!',
        );
        return;
    }

    if ( ref $Param{Database} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need array ref in Database param!',
        );
        return;
    }

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my @SQL = $DBObject->SQLProcessor(
        Database => $Param{Database},
    );

    for my $SQL (@SQL) {
        print STDERR "Notice: $SQL\n";
        $DBObject->Do( SQL => $SQL );
    }

    my @SQLPost = $DBObject->SQLProcessorPost();

    for my $SQL (@SQLPost) {
        print STDERR "Notice: $SQL\n";
        $DBObject->Do( SQL => $SQL );
    }

    return 1;
}

sub _Code {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Code Type Structure)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    # check format
    if ( ref $Param{Code} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need array ref in Code param!',
        );
        return;
    }

    # execute code
    CODE:
    for my $Code ( @{ $Param{Code} } ) {

        next CODE if !$Code->{Content};
        next CODE if $Param{Type} !~ /^$Code->{Type}$/i;

        # if the merged packages was already installed or not
        if (
            (
                defined $Code->{IfPackage}
                && !$Self->{MergedPackages}->{ $Code->{IfPackage} }
            )
            || (
                defined $Code->{IfNotPackage}
                && (
                    $Self->{MergedPackages}->{ $Code->{IfNotPackage} }
                    || $Self->PackageIsInstalled( Name => $Code->{IfNotPackage} )
                )
            )
            )
        {
            next CODE;
        }

        print STDERR "Code: $Code->{Content}\n";

        if ( !eval $Code->{Content} . "\n1;" ) {    ## no critic
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Code: $@",
            );
            return;
        }
    }

    return 1;
}

sub _OSCheck {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{OS} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'OS not defined!',
        );
        return;
    }

    # check format
    if ( ref $Param{OS} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need array ref in OS param!',
        );
        return;
    }

    # check OS
    my $OSCheck   = 0;
    my $CurrentOS = $^O;
    my @TestedOS;

    OS:
    for my $OS ( @{ $Param{OS} } ) {
        next OS if !$OS->{Content};
        push @TestedOS, $OS->{Content};
        next OS if $CurrentOS !~ /^$OS->{Content}$/i;

        $OSCheck = 1;
        last OS;
    }

    return 1 if $OSCheck;
    return   if $Param{NoLog};

    my $PossibleOS = join ', ', @TestedOS;

    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'error',
        Message  => "Sorry, can't install/upgrade package, because OS of package "
            . "($PossibleOS) does not match your OS ($CurrentOS)!",
    );

    return;
}

=head2 _CheckVersion()

Deprecated. Please use the new CheckVersion() instead of this.

=cut

sub _CheckVersion {
    my ( $Self, %Param ) = @_;

    return $Self->CheckVersion(%Param);
}

sub _CheckPackageRequired {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{PackageRequired} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'PackageRequired not defined!',
        );
        return;
    }

    return 1 if !$Param{PackageRequired};
    return 1 if ref $Param{PackageRequired} ne 'ARRAY';

    # get repository list
    my @RepositoryList = $Self->RepositoryList();

    # check required packages
    PACKAGE:
    for my $Package ( @{ $Param{PackageRequired} } ) {

        next PACKAGE if !$Package;

        my $Installed        = 0;
        my $InstalledVersion = 0;

        LOCAL:
        for my $Local (@RepositoryList) {

            next LOCAL if $Local->{Name}->{Content} ne $Package->{Content};
            next LOCAL if $Local->{Status} ne 'installed';

            $Installed        = 1;
            $InstalledVersion = $Local->{Version}->{Content};
            last LOCAL;
        }

        if ( !$Installed ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Sorry, can't install package, because package "
                    . "$Package->{Content} v$Package->{Version} is required!",
            );
            return;
        }

        my $VersionCheck = $Self->CheckVersion(
            VersionNew       => $Package->{Version},
            VersionInstalled => $InstalledVersion,
            Type             => 'Min',
        );

        next PACKAGE if $VersionCheck;

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Sorry, can't install package, because "
                . "package $Package->{Content} v$Package->{Version} is required!",
        );
        return;
    }

    return 1;
}

sub _CheckModuleRequired {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{ModuleRequired} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'ModuleRequired not defined!',
        );
        return;
    }

    # check required perl modules
    if ( $Param{ModuleRequired} && ref $Param{ModuleRequired} eq 'ARRAY' ) {

        my $EnvironmentObject = $Kernel::OM->Get('Kernel::System::Environment');

        MODULE:
        for my $Module ( @{ $Param{ModuleRequired} } ) {

            next MODULE if !$Module;

            # Check if module is installed by querying its version number via environment object.
            #   Some required modules might already be loaded by existing process, and might not support reloading.
            #   Because of this, opt not to use the main object an its Require() method at this point.
            my $Installed        = 0;
            my $InstalledVersion = $EnvironmentObject->ModuleVersionGet(
                Module => $Module->{Content},
            );
            if ($InstalledVersion) {
                $Installed = 1;
            }

            if ( !$Installed ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Sorry, can't install package, because module "
                        . "$Module->{Content} v$Module->{Version} is required "
                        . "and not installed!",
                );
                return;
            }

            # return if no version is required
            return 1 if !$Module->{Version};

            # return if no module version is available
            return 1 if !$InstalledVersion;

            # check version
            my $Ok = $Self->CheckVersion(
                VersionNew       => $Module->{Version},
                VersionInstalled => $InstalledVersion,
                Type             => 'Min',
                ExternalPackage  => 1,
            );

            if ( !$Ok ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Sorry, can't install package, because module "
                        . "$Module->{Content} v$Module->{Version} is required and "
                        . "$InstalledVersion is installed! You need to upgrade "
                        . "$Module->{Content} to $Module->{Version} or higher first!",
                );
                return;
            }
        }
    }

    return 1;
}

sub _CheckPackageDepends {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Name not defined!',
        );
        return;
    }

    for my $Local ( $Self->RepositoryList() ) {

        if (
            $Local->{PackageRequired}
            && ref $Local->{PackageRequired} eq 'ARRAY'
            && $Local->{Name}->{Content} ne $Param{Name}
            && $Local->{Status} eq 'installed'
            )
        {
            for my $Module ( @{ $Local->{PackageRequired} } ) {
                if ( $Param{Name} eq $Module->{Content} && !$Param{Force} ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message =>
                            "Sorry, can't uninstall package $Param{Name}, "
                            . "because package $Local->{Name}->{Content} depends on it!",
                    );
                    return;
                }
            }
        }
    }

    return 1;
}

sub _PackageFileCheck {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Structure} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Structure not defined!',
        );
        return;
    }

    # check if one of the files is already installed by another package
    PACKAGE:
    for my $Package ( $Self->RepositoryList() ) {

        next PACKAGE if $Param{Structure}->{Name}->{Content} eq $Package->{Name}->{Content};

        for my $FileNew ( @{ $Param{Structure}->{Filelist} } ) {

            FILEOLD:
            for my $FileOld ( @{ $Package->{Filelist} } ) {

                $FileNew->{Location} =~ s/\/\//\//g;
                $FileOld->{Location} =~ s/\/\//\//g;

                next FILEOLD if $FileNew->{Location} ne $FileOld->{Location};

                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Can't install/upgrade package, file $FileNew->{Location} already "
                        . "used in package $Package->{Name}->{Content}-$Package->{Version}->{Content}!",
                );

                return;
            }
        }
    }

    return 1;
}

sub _FileInstall {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(File)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }
    for my $Item (qw(Location Content Permission)) {
        if ( !defined $Param{File}->{$Item} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Item not defined in File!",
            );
            return;
        }
    }

    my $Home = $Param{Home} || $Self->{Home};

    # check Home
    if ( !-e $Home ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such home directory: $Home!",
        );
        return;
    }

    # get real file name in fs
    my $RealFile = $Home . '/' . $Param{File}->{Location};
    $RealFile =~ s/\/\//\//g;

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    # backup old file (if reinstall, don't overwrite .backup and .save files)
    if ( -e $RealFile ) {
        if ( $Param{File}->{Type} && $Param{File}->{Type} =~ /^replace$/i ) {
            if ( !$Param{Reinstall} || ( $Param{Reinstall} && !-e "$RealFile.backup" ) ) {
                move( $RealFile, "$RealFile.backup" );
            }
        }
        else {

            # check if we reinstall the same file, create a .save if it is not the same
            my $Save = 0;
            if ( $Param{Reinstall} && !-e "$RealFile.save" ) {

                # check if it's not the same
                my $Content = $MainObject->FileRead(
                    Location => $RealFile,
                    Mode     => 'binmode',
                );
                if ( $Content && ${$Content} ne $Param{File}->{Content} ) {

                    # check if it's a framework file, create .save file
                    my %File = $Self->_ReadDistArchive( Home => $Home );
                    if ( $File{ $Param{File}->{Location} } ) {
                        $Save = 1;
                    }
                }
            }

            # if it's no reinstall or reinstall and framework file but different, back it up
            if ( !$Param{Reinstall} || ( $Param{Reinstall} && $Save ) ) {
                move( $RealFile, "$RealFile.save" );
            }
        }
    }

    # check directory of location (in case create a directory)
    if ( $Param{File}->{Location} =~ /^(.*)\/(.+?|)$/ ) {

        my $Directory        = $1;
        my @Directories      = split( /\//, $Directory );
        my $DirectoryCurrent = $Home;

        DIRECTORY:
        for my $Directory (@Directories) {

            $DirectoryCurrent .= '/' . $Directory;

            next DIRECTORY if -d $DirectoryCurrent;

            if ( mkdir $DirectoryCurrent ) {
                print STDERR "Notice: Create Directory $DirectoryCurrent!\n";
            }
            else {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Can't create directory: $DirectoryCurrent: $!",
                );
            }
        }
    }

    # write file
    return if !$MainObject->FileWrite(
        Location   => $RealFile,
        Content    => \$Param{File}->{Content},
        Mode       => 'binmode',
        Permission => $Param{File}->{Permission},
    );

    print STDERR "Notice: Install $RealFile ($Param{File}->{Permission})!\n";

    return 1;
}

sub _FileRemove {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(File)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }
    for my $Item (qw(Location)) {
        if ( !defined $Param{File}->{$Item} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Item not defined in File!",
            );
            return;
        }
    }

    my $Home = $Param{Home} || $Self->{Home};

    # check Home
    if ( !-e $Home ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such home directory: $Home!",
        );
        return;
    }

    # get real file name in fs
    my $RealFile = $Home . '/' . $Param{File}->{Location};
    $RealFile =~ s/\/\//\//g;

    # check if file exists
    if ( !-e $RealFile ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'debug',
            Message  => "No such file: $RealFile!",
        );
        return;
    }

    # get main object
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    # check if we should backup this file, if it is touched/different
    if ( $Param{File}->{Content} ) {
        my $Content = $MainObject->FileRead(
            Location => $RealFile,
            Mode     => 'binmode',
        );
        if ( $Content && ${$Content} ne $Param{File}->{Content} ) {
            my $BackupFilePath = "$RealFile.custom_backup";
            print STDERR "Notice: Backup for changed file: $BackupFilePath\n";
            copy( $RealFile, $BackupFilePath );
        }
    }

    # check if it's a framework file and if $RealFile.(backup|save) exists
    # then do not remove it!
    my %File = $Self->_ReadDistArchive( Home => $Home );
    if ( $File{ $Param{File}->{Location} } && ( !-e "$RealFile.backup" && !-e "$RealFile.save" ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't remove file $RealFile, because it a framework file and no "
                . "other one exists!",
        );
        return;
    }

    # remove old file
    if ( !$MainObject->FileDelete( Location => $RealFile ) ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't remove file $RealFile: $!!",
        );
        return;
    }

    print STDERR "Notice: Removed file: $RealFile\n";

    # restore old file (if exists)
    if ( -e "$RealFile.backup" ) {
        print STDERR "Notice: Recovered: $RealFile.backup\n";
        move( "$RealFile.backup", $RealFile );
    }

    # restore old file (if exists)
    elsif ( -e "$RealFile.save" ) {
        print STDERR "Notice: Recovered: $RealFile.save\n";
        move( "$RealFile.save", $RealFile );
    }

    return 1;
}

sub _ReadDistArchive {
    my ( $Self, %Param ) = @_;

    my $Home = $Param{Home} || $Self->{Home};

    # check cache
    return %{ $Self->{Cache}->{DistArchive}->{$Home} }
        if $Self->{Cache}->{DistArchive}->{$Home};

    # check if ARCHIVE exists
    if ( !-e "$Home/ARCHIVE" ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such file: $Home/ARCHIVE!",
        );
        return;
    }

    # read ARCHIVE file
    my $Content = $Kernel::OM->Get('Kernel::System::Main')->FileRead(
        Directory => $Home,
        Filename  => 'ARCHIVE',
        Result    => 'ARRAY',
    );

    my %File;
    if ($Content) {

        for my $ContentRow ( @{$Content} ) {

            my @Row = split /::/, $ContentRow;
            $Row[1] =~ s/\/\///g;
            $Row[1] =~ s/(\n|\r)//g;

            $File{ $Row[1] } = $Row[0];
        }
    }
    else {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't open $Home/ARCHIVE: $!",
        );
    }

    # set in memory cache
    $Self->{Cache}->{DistArchive}->{$Home} = \%File;

    return %File;
}

sub _FileSystemCheck {
    my ( $Self, %Param ) = @_;

    return 1 if $Self->{FileSystemCheckAlreadyDone};

    my $Home = $Param{Home} || $Self->{Home};

    # check Home
    if ( !-e $Home ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such home directory: $Home!",
        );
        return;
    }

    my @Filepaths = (
        '/bin/',
        '/Kernel/',
        '/Kernel/System/',
        '/Kernel/Output/',
        '/Kernel/Output/HTML/',
        '/Kernel/Modules/',
    );

    # check write permissions
    FILEPATH:
    for my $Filepath (@Filepaths) {

        next FILEPATH if -w $Home . $Filepath;

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "ERROR: Need write permissions for directory $Home$Filepath\n"
                . " Try: $Home/bin/znuny.SetPermissions.pl!",
        );

        return;
    }

    $Self->{FileSystemCheckAlreadyDone} = 1;

    return 1;
}

sub _Encode {
    my ( $Self, $Text ) = @_;

    return $Text if !defined $Text;

    $Text =~ s/&/&amp;/g;
    $Text =~ s/</&lt;/g;
    $Text =~ s/>/&gt;/g;
    $Text =~ s/"/&quot;/g;

    return $Text;
}

=head2 _PackageUninstallMerged()

ONLY CALL THIS METHOD FROM A DATABASE UPGRADING SCRIPT DURING FRAMEWORK UPDATES
OR FROM A CODEUPGRADE SECTION IN AN SOPM FILE OF A PACKAGE THAT INCLUDES A MERGED FEATURE ADDON.

Uninstall an already framework (or module) merged package.

Package files that are not in the framework ARCHIVE file will be deleted, DatabaseUninstall() and
CodeUninstall are not called.

    $Success = $PackageObject->_PackageUninstallMerged(
        Name        => 'some package name',
        Home        => 'OTRS Home path',      # Optional
        DeleteSaved => 1,                     # or 0, 1 Default, Optional: if set to 1 it also
                                              # delete .save files
    );

=cut

sub _PackageUninstallMerged {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name (Name of the package)!',
        );
        return;
    }

    my $Home = $Param{Home} || $Self->{Home};

    # check Home
    if ( !-e $Home ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "No such home directory: $Home!",
        );
        return;
    }

    if ( !defined $Param{DeleteSaved} ) {
        $Param{DeleteSaved} = 1;
    }

    # check if the package is installed, otherwise return success (nothing to do)
    my $PackageInstalled = $Self->PackageIsInstalled(
        Name => $Param{Name},
    );
    return 1 if !$PackageInstalled;

    # get the package details
    my @PackageList       = $Self->RepositoryList();
    my %PackageListLookup = map { $_->{Name}->{Content} => $_ } @PackageList;
    my %PackageDetails    = %{ $PackageListLookup{ $Param{Name} } };

    # get the list of framework files
    my %FrameworkFiles = $Self->_ReadDistArchive( Home => $Home );

    # can not continue if there are no framework files
    return if !%FrameworkFiles;

    # remove unneeded files (if exists)
    if ( IsArrayRefWithData( $PackageDetails{Filelist} ) ) {

        # get main object
        my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

        FILE:
        for my $FileHash ( @{ $PackageDetails{Filelist} } ) {

            my $File = $FileHash->{Location};

            # get real file name in fs
            my $RealFile = $Home . '/' . $File;
            $RealFile =~ s/\/\//\//g;

            # check if file exists
            if ( -e $RealFile ) {

                # check framework files (use $File instead of $RealFile)
                if ( $FrameworkFiles{$File} ) {

                    if ( $Param{DeleteSaved} ) {

                        # check if file was overridden by the package
                        my $SavedFile = $RealFile . '.save';
                        if ( -e $SavedFile ) {

                            # remove old file
                            if ( !$MainObject->FileDelete( Location => $SavedFile ) ) {
                                $Kernel::OM->Get('Kernel::System::Log')->Log(
                                    Priority => 'error',
                                    Message  => "Can't remove file $SavedFile: $!!",
                                );
                                return;
                            }
                            print STDERR "Notice: Removed old backup file: $SavedFile\n";
                        }
                    }

                    # skip framework file
                    print STDERR "Notice: Skipped framework file: $RealFile\n";
                    next FILE;
                }

                # remove old file
                if ( !$MainObject->FileDelete( Location => $RealFile ) ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Can't remove file $RealFile: $!!",
                    );
                    return;
                }
                print STDERR "Notice: Removed file: $RealFile\n";
            }
        }
    }

    # delete package from the database
    my $PackageRemove = $Self->RepositoryRemove(
        Name => $Param{Name},
    );

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        KeepTypes => [
            'XMLParse',
            'SysConfigDefaultListGet',
            'SysConfigDefaultList',
            'SysConfigDefault',
            'SysConfigPersistent',
            'SysConfigModifiedList',
        ],
    );
    $Kernel::OM->Get('Kernel::System::Loader')->CacheDelete();

    return $PackageRemove;
}

sub _MergedPackages {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Structure}->{PackageMerge} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'PackageMerge not defined!',
        );

        return;
    }

    return 1 if !$Param{Structure}->{PackageMerge};
    return 1 if ref $Param{Structure}->{PackageMerge} ne 'ARRAY';

    # get repository list
    my @RepositoryList    = $Self->RepositoryList();
    my %PackageListLookup = map { $_->{Name}->{Content} => $_ } @RepositoryList;

    # check required packages
    PACKAGE:
    for my $Package ( @{ $Param{Structure}->{PackageMerge} } ) {

        next PACKAGE if !$Package;

        my $Installed        = 0;
        my $InstalledVersion = 0;
        my $TargetVersion    = $Package->{TargetVersion};
        my %PackageDetails;

        # check if the package is installed, otherwise go next package (nothing to do)
        my $PackageInstalled = $Self->PackageIsInstalled(
            Name => $Package->{Name},
        );

        # do nothing if package is not installed
        next PACKAGE if !$PackageInstalled;

        # get complete package info
        %PackageDetails = %{ $PackageListLookup{ $Package->{Name} } };

        # verify package version
        $InstalledVersion = $PackageDetails{Version}->{Content};

        # store package name and version for
        # use it on code and database installation
        # for principal package
        $Self->{MergedPackages}->{ $Package->{Name} } = $InstalledVersion;

        my $CheckTargetVersion = $Self->CheckVersion(
            VersionNew       => $TargetVersion,
            VersionInstalled => $InstalledVersion,
            Type             => 'Max',
        );

        if ( $TargetVersion eq $InstalledVersion ) {

            # do nothing, installed version is the correct one,
            # code and database are up to date
        }

        # merged package shouldn't be newer than the known mergeable target version
        elsif ( !$CheckTargetVersion ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Sorry, can't install package, because package "
                    . "$Package->{Name} v$InstalledVersion newer than required v$TargetVersion!",
            );

            return;
        }
        else {

            # upgrade code (merge)
            if (
                $Param{Structure}->{CodeUpgrade}
                && ref $Param{Structure}->{CodeUpgrade} eq 'ARRAY'
                )
            {

                my @Parts;
                PART:
                for my $Part ( @{ $Param{Structure}->{CodeUpgrade} } ) {

                    if ( $Part->{Version} ) {

                        # if VersionNew >= VersionInstalled add code for execution
                        my $CheckVersion = $Self->CheckVersion(
                            VersionNew       => $Part->{Version},
                            VersionInstalled => $TargetVersion,
                            Type             => 'Min',
                        );

                        if ($CheckVersion) {
                            push @Parts, $Part;
                        }
                    }
                    else {
                        push @Parts, $Part;
                    }
                }

                $Self->_Code(
                    Code      => \@Parts,
                    Type      => 'merge',
                    Structure => $Param{Structure},
                );
            }

            # upgrade database (merge)
            if (
                $Param{Structure}->{DatabaseUpgrade}->{merge}
                && ref $Param{Structure}->{DatabaseUpgrade}->{merge} eq 'ARRAY'
                )
            {

                my @Parts;
                my $Use = 0;
                for my $Part ( @{ $Param{Structure}->{DatabaseUpgrade}->{merge} } ) {

                    if ( $Part->{TagLevel} == 3 && $Part->{Version} ) {

                        my $CheckVersion = $Self->CheckVersion(
                            VersionNew       => $Part->{Version},
                            VersionInstalled => $InstalledVersion,
                            Type             => 'Min',
                        );

                        if ( !$CheckVersion ) {
                            $Use   = 1;
                            @Parts = ();
                            push @Parts, $Part;
                        }
                    }
                    elsif ( $Use && $Part->{TagLevel} == 3 && $Part->{TagType} eq 'End' ) {
                        $Use = 0;
                        push @Parts, $Part;
                        $Self->_Database( Database => \@Parts );
                    }
                    elsif ($Use) {
                        push @Parts, $Part;
                    }
                }
            }

        }

        # purge package
        if ( IsArrayRefWithData( $PackageDetails{Filelist} ) ) {
            for my $File ( @{ $PackageDetails{Filelist} } ) {

                # remove file
                $Self->_FileRemove( File => $File );
            }
        }

        # remove merged package from repository
        return if !$Self->RepositoryRemove(
            Name    => $Package->{Name},
            Version => $InstalledVersion,
        );
    }

    return 1;
}

sub _CheckDBInstalledOrMerged {
    my ( $Self, %Param ) = @_;

    if ( !defined $Param{Database} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Database not defined!',
        );

        return;
    }

    if ( ref $Param{Database} ne 'ARRAY' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need array ref in Database param!',
        );

        return;
    }

    my @Parts;
    my $Use = 1;
    my $NotUseTag;
    my $NotUseTagLevel;
    PART:
    for my $Part ( @{ $Param{Database} } ) {

        if ( $Use eq 0 ) {

            if (
                $Part->{TagType} eq 'End'
                && ( defined $NotUseTag      && $Part->{Tag} eq $NotUseTag )
                && ( defined $NotUseTagLevel && $Part->{TagLevel} eq $NotUseTagLevel )
                )
            {
                $Use = 1;
            }

            next PART;

        }
        elsif (
            (
                defined $Part->{IfPackage}
                && !$Self->{MergedPackages}->{ $Part->{IfPackage} }
            )
            || (
                defined $Part->{IfNotPackage}
                &&
                (
                    defined $Self->{MergedPackages}->{ $Part->{IfNotPackage} }
                    || $Self->PackageIsInstalled( Name => $Part->{IfNotPackage} )
                )
            )
            )
        {
            # store Tag and TagLevel to be used later and found the end of this level
            $NotUseTag      = $Part->{Tag};
            $NotUseTagLevel = $Part->{TagLevel};

            $Use = 0;
            next PART;
        }

        push @Parts, $Part;
    }

    return \@Parts;
}

sub _ConfigurationDeploy {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Package Action)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    #
    # Normally, on package modifications, a configuration settings cleanup needs to happen,
    #   to prevent old configuration settings from breaking the system.
    #
    # This does not work in the case of updates: there we can have situations where the packages
    #   only exist in the DB, but not yet on the file system, and need to be reinstalled. We have
    #   to prevent the cleanup until all packages are properly installed again.
    #
    # Please see bug#13754 for more information.
    #

    my $CleanUp = 1;

    PACKAGE:
    for my $Package ( $Self->RepositoryList() ) {

        # Only check the deployment state of the XML configuration files for performance reasons.
        #   Otherwise, this would be too slow on systems with many packages.
        $CleanUp = $Self->_ConfigurationFilesDeployCheck(
            Name    => $Package->{Name}->{Content},
            Version => $Package->{Version}->{Content},
        );

        # Stop if any package has its configuration wrong deployed, configuration cleanup should not
        #   take place in the lines below. Otherwise modified setting values can be lost.
        last PACKAGE if !$CleanUp;
    }

    my $SysConfigObject = Kernel::System::SysConfig->new();

    if (
        !$SysConfigObject->ConfigurationXML2DB(
            UserID  => 1,
            Force   => 1,
            CleanUp => $CleanUp,
        )
        )
    {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "There was a problem writing XML to DB.",
        );
        return;
    }

    my $Success = $SysConfigObject->ConfigurationDeploy(
        Comments => $Param{Comments},
        NotDirty => 1,
        UserID   => 1,
        Force    => 1,
    );
    if ( !$Success ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Could not deploy configuration!",
        );
        return;
    }

    return 1;
}

=head2 _PackageInstallOrderListGet()

Helper function for PackageInstallOrderListGet() to process the packages and its dependencies recursively.

    my $Success = $PackageObject->_PackageInstallOrderListGet(
        Callers           => {      # packages in the recursive chain
            PackageA => 1,
            # ...
        },
        InstalledVersions => {      # list of installed packages and their versions
            PackageA => '1.0.1',
            # ...
        },
        TargetPackages => {
            PackageA => '1.0.1',    # list of packages to process
            # ...
        }
        InstallOrder => {           # current install order
            PackageA => 2,
            PacakgeB => 1,
            # ...
        },
        Failed => {                 # current failed packages or dependencies
            Cyclic => {},
            NotFound => {},
            WrongVersion => {},
            DependencyFail => {},
        },
        OnlinePackageLookup => {
            PackageA => {
                Name    => 'PackageA',
                Version => '1.0.1',
                PackageRequired => [
                    {
                        Content => 'PackageB',
                        Version => '1.0.2',
                    },
                    # ...
                ],
            },
        },
        IsDependency => 1,      # 1 or 0
    );

=cut

sub _PackageInstallOrderListGet {
    my ( $Self, %Param ) = @_;

    my $Success = 1;
    PACKAGENAME:
    for my $PackageName ( sort keys %{ $Param{TargetPackages} } ) {

        # Prevent cyclic dependencies.
        if ( $Param{Callers}->{$PackageName} ) {
            $Param{Failed}->{Cyclic}->{$PackageName} = 1;
            $Success = 0;
            next PACKAGENAME;
        }

        my $OnlinePackage = $Param{OnlinePackageLookup}->{$PackageName};

        # Check if the package can be obtained remotely.
        if ( !$OnlinePackage || !IsHashRefWithData($OnlinePackage) ) {
            $Param{Failed}->{NotFound}->{$PackageName} = 1;
            $Success = 0;
            next PACKAGENAME;
        }

        # Check if the version of the remote package is grater (or equal) to the required version,
        #   in case of equal, reference still counts, but at update or install package must be
        #   skipped.
        if ( $OnlinePackage->{Version} ne $Param{TargetPackages}->{$PackageName} ) {
            my $CheckOk = $Self->CheckVersion(
                VersionNew       => $OnlinePackage->{Version},
                VersionInstalled => $Param{TargetPackages}->{$PackageName},
                Type             => 'Max',
            );
            if ( !$CheckOk ) {
                $Param{Failed}->{WrongVersion}->{$PackageName} = 1;
                $Success = 0;
                next PACKAGENAME;
            }
        }

        my %PackageDependencies = map { $_->{Content} => $_->{Version} } @{ $OnlinePackage->{PackageRequired} };

        # Update callers list locally to start recursion
        my %Callers = (
            %{ $Param{Callers} },
            $PackageName => 1,
        );

        # Start recursion with package dependencies.
        my $DependenciesSuccess = $Self->_PackageInstallOrderListGet(
            Callers             => \%Callers,
            InstalledVersions   => $Param{InstalledVersions},
            TargetPackages      => \%PackageDependencies,
            InstallOrder        => $Param{InstallOrder},
            OnlinePackageLookup => $Param{OnlinePackageLookup},
            Failed              => $Param{Failed},
            IsDependency        => 1,
        );

        if ( !$DependenciesSuccess ) {
            $Param{Failed}->{DependencyFail}->{$PackageName} = 1;
            $Success = 0;

            # Do not process more dependencies.
            last PACKAGENAME if $Param{IsDependency};

            # Keep processing other initial packages.
            next PACKAGENAME;
        }

        if ( $Param{InstallOrder}->{$PackageName} ) {

            # Only increase the counter if is a dependency, if its a first level package then skip,
            #   as it was already set from the dependencies of another package.
            if ( $Param{IsDependency} ) {
                $Param{InstallOrder}->{$PackageName}++;
            }

            next PACKAGENAME;
        }

        # If package wasn't set before it initial value must be 1, but in case the package is added
        #   because its a dependency then it must be sum of all packages that requires it at the
        #   moment + 1 e.g.
        #   ITSMCore -> GeneralCatalog, Then GeneralCatalog needs to be 2
        #   ITSMIncidenProblemManagement -> ITSMCore -> GeneralCatalog, Then GeneralCatalog needs to be 3
        my $InitialValue = $Param{IsDependency} ? scalar keys %Callers : 1;
        $Param{InstallOrder}->{$PackageName} = $InitialValue;
    }

    return $Success;
}

=head2 _PackageOnlineListGet()

Helper function that gets the full list of available remote packages.

    my %OnlinePackages = $PackageObject->_PackageOnlineListGet();

Returns:

    %OnlinePackages = (
        PackageList => [
            {
                Name        => 'Test',
                Version     => '6.0.20',
                File        => 'Test-6.0.20.opm',
                ChangeLog   => 'InitialRelease',
                Description => 'Test package.',
                Framework   => [
                    {
                        Content => '6.0.x',
                        Minimum => '6.0.2',
                        # ... ,
                    }
                ],
                License => 'GNU GENERAL PUBLIC LICENSE Version 3, November 2007',
                PackageRequired => [
                    {
                        Content => 'TestRequitement',
                        Version => '6.0.20',
                        # ... ,
                    },
                ],
                URL    => 'http://otrs.org/',
                Vendor => 'OTRS AG',
            },
            # ...
        ];
        PackageLookup  => {
            Test => {
                   URL        => 'http://otrs.org/',
                    Version   => '6.0.20',
                    File      => 'Test-6.0.20.opm',
            },
            # ...
        },
    );

=cut

sub _PackageOnlineListGet {
    my ( $Self, %Param ) = @_;

    my %RepositoryList = $Self->ConfiguredRepositoryListGet();

    my @PackageOnlineList;
    my %PackageSourceLookup;

    for my $Source ( sort keys %RepositoryList ) {
        my @OnlineList = $Self->RepositoryPackageListGet(
            Source             => $Source,
            Lang               => 'en',
            Cache              => 1,
            IncludeSameVersion => 1,
        );

        @PackageOnlineList = ( @PackageOnlineList, @OnlineList );

        for my $Package (@OnlineList) {
            $PackageSourceLookup{ $Package->{Name} } = {
                Source  => $Source,
                Version => $Package->{Version},
                File    => $Package->{File},
            };
        }
    }

    return (
        PackageList   => \@PackageOnlineList,
        PackageLookup => \%PackageSourceLookup,
    );
}

=head2 _RepositoryCacheClear()

Remove all caches related to the package repository.

    my $Success = $PackageObject->_RepositoryCacheClear();

=cut

sub _RepositoryCacheClear {
    my ( $Self, %Param ) = @_;

    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    $CacheObject->CleanUp(
        Type => 'RepositoryList',
    );
    $CacheObject->CleanUp(
        Type => 'RepositoryGet',
    );

    return 1;
}

=head2 _ConfigurationFilesDeployCheck()

check if package configuration files are deployed correctly.

    my $Success = $PackageObject->_ConfigurationFilesDeployCheck(
        Name    => 'Application A',
        Version => '1.0',
    );

=cut

sub _ConfigurationFilesDeployCheck {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(Name Version)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "$Needed not defined!",
            );
            return;
        }
    }

    my $Package   = $Self->RepositoryGet( %Param, Result => 'SCALAR' );
    my %Structure = $Self->PackageParse( String => $Package );

    return 1 if !$Structure{Filelist};
    return 1 if ref $Structure{Filelist} ne 'ARRAY';

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $Success = 1;

    FILE:
    for my $File ( @{ $Structure{Filelist} } ) {

        my $Extension = substr $File->{Location}, -4, 4;

        next FILE if lc $Extension ne '.xml';

        my $LocalFile = $Self->{Home} . '/' . $File->{Location};

        if ( !-e $LocalFile ) {
            $Success = 0;
            last FILE;
        }

        my $Content = $MainObject->FileRead(
            Location => $Self->{Home} . '/' . $File->{Location},
            Mode     => 'binmode',
        );

        if ( !$Content ) {
            $Success = 0;
            last FILE;
        }

        if ( ${$Content} ne $File->{Content} ) {
            $Success = 0;
            last FILE;
        }
    }

    return $Success;
}

sub DESTROY {
    my $Self = shift;

    # execute all transaction events
    $Self->EventHandlerTransaction();

    return 1;
}

1;

=end Internal:

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
