# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionValidation::Module;

use parent qw(Kernel::System::ProcessManagement::Transition);
use parent qw(Kernel::System::ProcessManagement::TransitionValidation::Base);

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionValidation::Module - Module for Transition Validation Module

=head1 DESCRIPTION

All Module functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $TransitionValidationObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionValidation::Module');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{Name}  = 'Module';
    $Self->{Label} = 'Transition validation module';

    return $Self;
}

=head2 Validate()

Validate Data

    my $Match = $ValidateModuleObject->Validate(
        Data => {
            # TicketData
            TicketID => 1,
            Queue    => 'Postmaster',
        },
        FieldName    => 'DynamicField_Make',
        'Transition' => {
            'Name'      => 'Transition 2',
            'Condition' => {
                'Type'             => 'and',
                'ConditionLinking' => 'and',
                'Condition 1'      => {
                    'Fields' => {
                        'DynamicField_Make' => $VAR1->{'Condition'}
                    }
                }
            }
        },
        TransitionName     => 'Transition 2',
        TransitionEntityID => 'T1903007681700000',

        Condition          => {
            Match => 'Postmaster',
            Type  => 'Kernel::System::ProcessManagement::TransitionValidation::ValidateDemo.pm'
        },
        ConditionName    => 'Condition 1',
        ConditionType    => 'and',
        ConditionLinking => 'and'
    );

Returns:

    $Match = 1;        # or undef, only returns 1 if validation was successful

=cut

sub Validate {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(Data FieldName)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in !",
        );
        return;
    }

    # Load validation modules.
    # Default location for validation modules:
    #   Kernel/System/ProcessManagement/TransitionValidation/.
    if ( !$MainObject->Require( $Param{Condition}->{Match} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't load "
                . $Param{Condition}->{Type}
                . " module for Transition->$Param{TransitionEntityID}->Condition->$Param{ConditionName}->"
                . "Fields->$Param{FieldName} validation!",
        );
        return;
    }

    my $ValidateModuleObject = $Param{Condition}->{Match}->new();

    my $Match = $ValidateModuleObject->Validate(
        %Param
    );

    if ($Match) {
        $Self->DebugLog(
            MessageType    => 'Match',
            TransitionName => $Param{TransitionName},
            ConditionName  => $Param{ConditionName},
            FieldName      => $Param{FieldName},
            MatchType      => 'Module',
            Module         => $Param{Condition}->{Type}
        );
    }

    return $Match;
}

1;
