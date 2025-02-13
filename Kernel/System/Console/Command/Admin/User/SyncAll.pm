# --
# Copyright (C) 2021 Informatyka Boguslawski sp. z o.o. sp.k., http://www.ib.pl/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Console::Command::Admin::User::SyncAll;
## nofilter(TidyAll::Plugin::Znuny::Legal::UpdateZnunyCopyright)

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Main',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Synchronize all users from specified sync backend.');
    $Self->AddOption(
        Name => 'count',
        Description =>
            'Use AuthSyncModule<count> backend to synchronize from (empty <count> will be used if this parameter is not specified).',
        Required   => 0,
        HasValue   => 1,
        ValueRegex => qr/\d/smx,
    );
    $Self->AddOption(
        Name        => 'invalidate-missing',
        Description => "Invalidate valid users in DB that are not found in LDAP.",
        Required    => 0,
        HasValue    => 0,
    );
    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Count = $Self->GetOption('count') // '';

    # Check if specified AuthSyncModule is configured.
    my $GenericModule = $Kernel::OM->Get('Kernel::Config')->Get("AuthSyncModule${Count}");
    if ( !$GenericModule ) {
        $Self->PrintError("User authentication sync module AuthSyncModule${Count} not configured!");
        return $Self->ExitCodeError();
    }

    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($GenericModule) ) {
        $Self->PrintError( "Invalid AuthSyncModule${Count} value (" . $GenericModule . ')!' );
        return $Self->ExitCodeError();
    }

    my $AuthSyncBackend = $GenericModule->new( %{$Self}, Count => $Count );

    $Self->Print(
        "<yellow>Starting all users synchronization from AuthSyncModule${Count} ("
            . $GenericModule
            . ")...</yellow>\n"
    );

    # Do the sync using specified backend.
    if ( !$AuthSyncBackend->SyncAll( InvalidateMissing => $Self->GetOption('invalidate-missing') ) ) {
        $Self->PrintError('Sync failed!');
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
