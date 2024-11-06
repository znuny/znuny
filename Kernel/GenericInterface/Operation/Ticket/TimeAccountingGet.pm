# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Operation::Ticket::TimeAccountingGet;

use strict;
use warnings;

use parent qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::Ticket::Common
);

our @ObjectDependencies = (
    'Kernel::System::Group',
    'Kernel::System::User',
    'Kernel::System::TimeAccountingWebservice',
);

=head1 NAME

Kernel::GenericInterface::Operation::Ticket::TimeAccountingGet - GenericInterface Ticket Get Operation backend

=head1 PUBLIC INTERFACE

=head2 new()

Usually, you want to create an instance of this
by using Kernel::GenericInterface::Operation->new();

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    for my $Needed (qw(DebuggerObject WebserviceID)) {
        if ( !$Param{$Needed} ) {
            return {
                Success      => 0,
                ErrorMessage => "Got no $Needed!",
            };
        }

        $Self->{$Needed} = $Param{$Needed};
    }

    return $Self;
}

=head2 Run()

Perform TimeAccountingGet operation. This function is able to return
one or more ticket entries in one call.

    my $Result = $OperationObject->Run(
        Data => {
            UserLogin            => 'some agent login',                            # UserLogin or CustomerUserLogin or SessionID is
                                                                                   #   required
            CustomerUserLogin    => 'some customer login',
            SessionID            => 123,

            Password             => 'some password',                               # if UserLogin or customerUserLogin is sent then
                                                                                   #   Password is required

            TimeAccountingUserLogin => 'some agent login',
            TimeAccountingStart     => '2017-01-01 10:00:00',
            TimeAccountingEnd       => '2018-01-01 10:00:00',
        },
    );

    $Result = {
        Success      => 1,                                # 0 or 1
        ErrorMessage => '',                               # In case of an error
        Data         => [
            {
                TicketNumber => '...',
                TicketTitle  => '...',
                Queue        => '...',
                Created      => '...',
                TimeUnit     => '...',
            },
        ],
    };

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $GroupObject                    = $Kernel::OM->Get('Kernel::System::Group');
    my $TimeAccountingWebserviceObject = $Kernel::OM->Get('Kernel::System::TimeAccountingWebservice');
    my $UserObject                     = $Kernel::OM->Get('Kernel::System::User');

    my ( $UserID, $UserType ) = $Self->Auth(
        %Param,
    );

    if ( !$UserID ) {
        return $Self->ReturnError(
            ErrorCode    => 'TimeAccountingGet.AuthFail',
            ErrorMessage => "TimeAccountingGet: Authentication failed!",
        );
    }

    my %GroupsReversed = reverse $GroupObject->PermissionUserGet(
        UserID => $UserID,
        Type   => 'rw',
    );

    if ( !$GroupsReversed{timeaccounting_webservice} ) {
        return $Self->ReturnError(
            ErrorCode    => 'TimeAccountingGet.NoPermission',
            ErrorMessage => "TimeAccountingGet: No permission!",
        );
    }

    NEEDED:
    for my $Needed (qw(TimeAccountingUserLogin TimeAccountingStart TimeAccountingEnd)) {
        next NEEDED if $Param{Data}->{$Needed};

        return $Self->ReturnError(
            ErrorCode    => 'TimeAccountingGet.MissingParameter',
            ErrorMessage => "TimeAccountingGet: $Needed parameter is missing!",
        );
    }

    my $TimeAccountingUserID = $UserObject->UserLookup(
        UserLogin => $Param{Data}->{TimeAccountingUserLogin},
    );

    my @TimeAccountingEntries = $TimeAccountingWebserviceObject->TimeAccountingSearch(
        Start  => $Param{Data}->{TimeAccountingStart},
        End    => $Param{Data}->{TimeAccountingEnd},
        UserID => $TimeAccountingUserID,
    );

    my %Data;
    if (@TimeAccountingEntries) {
        $Data{TimeAccountingResult} = \@TimeAccountingEntries;
    }

    return {
        Success => 1,
        Data    => \%Data,
    };
}

1;
