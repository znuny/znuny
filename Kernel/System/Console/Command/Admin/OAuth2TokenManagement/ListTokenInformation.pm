# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Admin::OAuth2TokenManagement::ListTokenInformation;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::Valid',
    'Kernel::System::OAuth2Token',
    'Kernel::System::OAuth2TokenConfig',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Lists OAuth2 token information.');

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');
    my $OAuth2TokenObject       = $Kernel::OM->Get('Kernel::System::OAuth2Token');
    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

    my $UserID = 1;

    my @TokenConfigs = $OAuth2TokenConfigObject->DataListGet(
        UserID => $UserID,
    );

    if ( !@TokenConfigs ) {
        $Self->Print("No token configs found.\n");
        return $Self->ExitCodeOk();
    }

    my %ValidIDs = $ValidObject->ValidList();

    TOKENCONFIG:
    for my $TokenConfig (@TokenConfigs) {
        my $TokenConfigValidName   = $ValidIDs{ $TokenConfig->{ValidID} } // 'invalid';
        my $TokenConfigID          = $TokenConfig->{ $OAuth2TokenConfigObject->{Identifier} };
        my $TokenConfigInformation = "Token config '$TokenConfig->{Name}' ($TokenConfigValidName, ID $TokenConfigID)";

        $Self->Print("$TokenConfigInformation\n");

        my %Token = $OAuth2TokenObject->DataGet(
            TokenConfigID => $TokenConfigID,
            UserID        => $UserID,
        );

        if ( !%Token ) {
            $Self->Print("\tNo token record found for this token config.\n\n");
            next TOKENCONFIG;
        }

        $Self->Print("\tToken information:\n");
        for my $Field ( sort keys %Token ) {
            my $Value = $Token{$Field} // '';
            $Self->Print("\t\t$Field: $Value\n");
        }
        $Self->Print("\n");
    }

    return $Self->ExitCodeOk();
}

1;
