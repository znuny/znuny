# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::OAuth2TokenManagement::ExportTokenConfig;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::OAuth2TokenConfig',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Exports OAuth2 token config in YAML format.');

    $Self->AddOption(
        Name        => 'token-config-name',
        Description => 'Only exports token config with given name (instead of all).',
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr{.+},
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $UserID = 1;
    my %DataExportFilter;

    my $TokenConfigName = $Self->GetOption('token-config-name');
    if ( defined $TokenConfigName ) {
        $DataExportFilter{Name} = $TokenConfigName;
    }

    my $TokenConfigsYAML = $OAuth2TokenConfigObject->DataExport(
        Format => 'yml',
        Cache  => 0,
        Filter => \%DataExportFilter,
        UserID => $UserID,
    );

    $Self->Print("$TokenConfigsYAML\n");

    return $Self->ExitCodeOk();
}

1;
