# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::PostMasterFilter::Export;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::ZnunyHelper',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description(
        'Exports configuration of all PostMaster filters. Output can be formatted as YAML or Perl structure.',
    );

    $Self->AddArgument(
        Name        => 'format',
        Description => 'Format of the export: YAML or Perl.',
        Required    => 1,
        ValueRegex  => qr/\A(ya?ml|perl)\z/i,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    my $Format = $Self->GetArgument('format');

    my $ConfigString = $ZnunyHelperObject->_PostMasterFilterConfigExport(
        Format => $Format,
    );

    $Self->Print("$ConfigString\n");

    return $Self->ExitCodeOk();
}

1;
