# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Znuny::SessionConfigSettings;

use strict;
use warnings;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('Znuny') . '/' . Translatable('Session Config Settings');
}

sub Run {
    my $Self = shift;

    my @Settings = qw(
        SessionMaxTime
        SessionMaxIdleTime
        AgentSessionLimit
        AgentSessionPerUserLimit
        CustomerSessionLimit
        CustomerSessionPerUserLimit
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    for my $Setting (@Settings) {

        my $ConfigValue = $ConfigObject->Get($Setting);

        my $Message;

        $Self->AddResultInformation(
            Identifier => $Setting,
            Label      => $Setting,
            Value      => $ConfigValue,
        );
    }

    return $Self->GetResults();
}

1;
