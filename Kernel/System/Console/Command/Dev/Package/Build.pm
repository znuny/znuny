# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Console::Command::Dev::Package::Build;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Main',
    'Kernel::System::Package',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Create a package (opm) file from a package source (sopm) file.');
    $Self->AddOption(
        Name        => 'version',
        Description => "Specify the version to be used (overrides version from sopm file).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^\d{1,4}[.]\d{1,4}[.]\d{1,4}$/smx,
    );
    $Self->AddOption(
        Name => 'module-directory',
        Description =>
            "Specify the directory containing the module sources (otherwise the OTRS home directory will be used).",
        Required   => 0,
        HasValue   => 1,
        ValueRegex => qr/.*/smx,
    );
    $Self->AddArgument(
        Name        => 'source-path',
        Description => "Specify the path to a package source (sopm) file that should be built.",
        Required    => 1,
        ValueRegex  => qr/.*/smx,
    );
    $Self->AddArgument(
        Name        => 'target-directory',
        Description => "Specify the directory where the generated package should be placed.",
        Required    => 1,
        ValueRegex  => qr/.*/smx,
    );

    return;
}

sub PreRun {
    my ( $Self, %Param ) = @_;

    my $SourcePath = $Self->GetArgument('source-path');
    if ( !-r $SourcePath ) {
        die "File $SourcePath does not exist / cannot be read.\n";
    }

    my $TargetDirectory = $Self->GetArgument('target-directory');
    if ( !-d $TargetDirectory ) {
        die "Directory $TargetDirectory does not exist.\n";
    }

    my $ModuleDirectory = $Self->GetOption('module-directory');
    if ( $ModuleDirectory && !-d $ModuleDirectory ) {
        die "Directory $ModuleDirectory does not exist.\n";
    }

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    $Self->Print("<yellow>Building package...</yellow>\n");

    my $FileString;
    my $SourcePath = $Self->GetArgument('source-path');
    my $ContentRef = $Kernel::OM->Get('Kernel::System::Main')->FileRead(
        Location => $SourcePath,
        Mode     => 'utf8',        # optional - binmode|utf8
        Result   => 'SCALAR',      # optional - SCALAR|ARRAY
    );
    if ( !$ContentRef || ref $ContentRef ne 'SCALAR' ) {
        $Self->PrintError("File $SourcePath is empty / could not be read.");
        return $Self->ExitCodeError();
    }
    $FileString = ${$ContentRef};

    my %Structure = $Kernel::OM->Get('Kernel::System::Package')->PackageParse(
        String => $FileString,
    );

    # just build it if PackageIsDownloadable flag is enable
    if (
        defined $Structure{PackageIsDownloadable}
        && !$Structure{PackageIsDownloadable}->{Content}
        )
    {
        $Self->PrintError("Package cannot be built.\n");
        return $Self->ExitCodeError();
    }

    if ( $Self->GetOption('version') ) {
        $Structure{Version}->{Content} = $Self->GetOption('version');
    }

    # build from given package directory, if any (otherwise default to OTRS home)
    if ( $Self->GetOption('module-directory') ) {
        $Structure{Home} = $Self->GetOption('module-directory');
    }

    my $Filename = $Structure{Name}->{Content} . '-' . $Structure{Version}->{Content} . '.opm';
    my $Content  = $Kernel::OM->Get('Kernel::System::Package')->PackageBuild(%Structure);
    if ( !$Content ) {
        $Self->PrintError("Package build failed.\n");
        return $Self->ExitCodeError();
    }
    my $File = $Kernel::OM->Get('Kernel::System::Main')->FileWrite(
        Location   => $Self->GetArgument('target-directory') . '/' . $Filename,
        Content    => \$Content,
        Mode       => 'utf8',
        Type       => 'Local',
        Permission => '644',
    );

    if ( !$File ) {
        $Self->PrintError("File $Filename could not be written.\n");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
