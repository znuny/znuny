# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Console::Command::Maint::ObjectLink::Delete;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Removes a link between objects.');

    $Self->AddOption(
        Name        => 'source-object',
        Description => 'Source object to remove link for (e.g. "Ticket").',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );

    $Self->AddOption(
        Name        => 'source-key',
        Description => 'Source object key (e.g. a ticket ID).',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );

    $Self->AddOption(
        Name        => 'target-object',
        Description => 'Target object to remove link for (e.g. "Ticket").',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );

    $Self->AddOption(
        Name        => 'target-key',
        Description => 'Target object key (e.g. a ticket ID).',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );

    $Self->AddOption(
        Name        => 'link-type',
        Description => 'Type of link to remove (e.g. "Normal", "ParentChild", etc.).',
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/.*/,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    $Self->Print("<yellow>Removing link between objects...</yellow>\n\n");

    my $SourceObject = $Self->GetOption('source-object');
    my $SourceKey    = $Self->GetOption('source-key');
    my $TargetObject = $Self->GetOption('target-object');
    my $TargetKey    = $Self->GetOption('target-key');
    my $LinkType     = $Self->GetOption('link-type');

    my $Success = $LinkObject->LinkDelete(
        Object1 => $SourceObject,
        Key1    => $SourceKey,
        Object2 => $TargetObject,
        Key2    => $TargetKey,
        Type    => $LinkType,
        UserID  => 1,
    );

    if ( !$Success ) {
        $Self->PrintError('Error removing link.');

        my $Message = $LogObject->GetLogEntry(
            Type => 'error',
            What => 'Message',
        );

        $Self->PrintError("$Message\n");
        return $Self->ExitCodeError();
    }

    $Self->Print("<green>Done.</green>\n");
    return $Self->ExitCodeOk();
}

1;
