# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::PostMasterFilter::Import;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Main',
    'Kernel::System::ZnunyHelper',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description(
        'Imports configuration of PostMaster filter from a file in YAML format.',
    );

    $Self->AddArgument(
        Name        => 'file-path',
        Description => "Path to YAML file with PostMaster filter.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );
    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
    my $MainObject        = $Kernel::OM->Get('Kernel::System::Main');

    my $FilePath = $Self->GetArgument('file-path');

    my $Content = $MainObject->FileRead(
        Location        => $FilePath,
        Mode            => 'utf8',
        Type            => 'Local',
        Result          => 'SCALAR',
        DisableWarnings => 1,
    );

    my $Success = $ZnunyHelperObject->_PostMasterFilterConfigImport(
        Filter => $Content,
        Format => 'yaml',
    );
    if ( !$Success ) {
        $Self->PrintError("Error importing PostMaster filter from file $FilePath");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

1;
