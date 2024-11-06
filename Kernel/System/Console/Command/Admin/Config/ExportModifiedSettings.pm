# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::Config::ExportModifiedSettings;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Main',
    'Kernel::System::SysConfig',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Export all modified settings to a file.');
    $Self->AddOption(
        Name        => 'target-path',
        Description => 'Output path, e.g. /tmp/Config.yml',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/\A.+\z/,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $MainObject      = $Kernel::OM->Get('Kernel::System::Main');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    my $TargetPath = $Self->GetOption('target-path');

    my $ModifiedConfigSettingsExport = $SysConfigObject->ConfigurationDump(
        SkipDefaultSettings => 1,
        SkipUserSettings    => 1,
    );

    my $FileLocation = $MainObject->FileWrite(
        Location => $TargetPath,
        Content  => \$ModifiedConfigSettingsExport,
        Mode     => 'utf8',
    );

    if ( !$FileLocation ) {
        $Self->PrintError("Could not write to file $TargetPath");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>File $TargetPath written.</green>\n");

    return $Self->ExitCodeOk();
}

1;
