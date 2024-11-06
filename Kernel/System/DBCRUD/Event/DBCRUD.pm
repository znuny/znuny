# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DBCRUD::Event::DBCRUD;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw( ModuleName UseHistoryBackend Event Data Config UserID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    return if $Param{Event} !~ m{\ADBCRUD(.+)\z};
    my $Method = 'Data' . $1 . 'Post';

    my $BackendObject = $Kernel::OM->Get( $Param{ModuleName} );
    return if !$BackendObject;

    return 1 if !$BackendObject->can($Method);

    if (
        $Param{UseHistoryBackend}
        && $BackendObject->can('IsHistoryBackendSet')
        )
    {
        my $HistoryBackendWasAlreadySet = $BackendObject->IsHistoryBackendSet();
        $BackendObject->HistoryBackendSet() if !$HistoryBackendWasAlreadySet;
        my $Success = $BackendObject->$Method(
            %{ $Param{Data} },
        );
        $BackendObject->HistoryBackendUnset() if !$HistoryBackendWasAlreadySet;

        return $Success;
    }

    my $Success = $BackendObject->$Method(
        %{ $Param{Data} },
    );

    return $Success;
}

1;
