# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionValidation::String;

use parent qw(Kernel::System::ProcessManagement::Transition);
use parent qw(Kernel::System::ProcessManagement::TransitionValidation::Base);

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionValidation::String - String for Transition Validation Module

=head1 DESCRIPTION

All String functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $TransitionValidationObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionValidation::String');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{Name}  = 'String';
    $Self->{Label} = 'String';

    return $Self;
}

=head2 Validate()

Validate Data

    my $Match = $ValidateModuleObject->Validate(
        Data => {
            # TicketData
            TicketID          => 1,
            DynamicField_Make => [
               'Test1',
               'Test2',
               'Test3'
            ]
            # [...]
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
            Match => 'Test4',
            Type  => 'String'
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

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Data FieldName)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in !",
        );
        return;
    }

    # if our Check contains anything else than a string we can't check
    #   Special Condition: if Match contains '0' we can check.
    if (
        (
            !$Param{Condition}->{Match}
            && $Param{Condition}->{Match} ne '0'
        )
        || ref $Param{Condition}->{Match}
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "$Param{TransitionEntityID}->Condition->$Param{ConditionName}->Fields->$Param{FieldName}: Match must"
                . " be a string if type is set to String!",
        );
        return;
    }

    my $Match;
    my $MatchValue;

    # Make sure there is data to compare.
    if ( defined $Param{Data}->{ $Param{FieldName} } && defined $Param{Condition}->{Match} ) {

        # Check if field data is a string and compare directly.
        if (
            ref $Param{Data}->{ $Param{FieldName} } eq ''
            && $Param{Condition}->{Match} eq $Param{Data}->{ $Param{FieldName} }
            )
        {
            $Match      = 1;
            $MatchValue = $Param{Data}->{ $Param{FieldName} };
        }

        # Otherwise check if field data is and array and compare each element until
        #   one match.
        elsif ( ref $Param{Data}->{ $Param{FieldName} } eq 'ARRAY' ) {
            ITEM:
            for my $Item ( @{ $Param{Data}->{ $Param{FieldName} } } ) {
                next ITEM if $Param{Condition}->{Match} ne $Item;

                $Match      = 1;
                $MatchValue = "Item: [$Item]";
                last ITEM;
            }
        }
    }

    if ($Match) {
        $Self->DebugLog(
            MessageType    => 'Match',
            TransitionName => $Param{TransitionName},
            ConditionName  => $Param{ConditionName},
            FieldName      => $Param{FieldName},
            MatchType      => 'Regexp',
            MatchValue     => $MatchValue,
            MatchCondition => $Param{Condition}->{Match},
        );
    }

    return $Match;
}

1;
