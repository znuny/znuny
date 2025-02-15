# --
# Copyright (C) 2021-2023 Informatyka Boguslawski sp. z o.o. sp.k., http://www.ib.pl/
# Based on ArchiveRestore.pm by OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Ticket::Event::TicketLearnSpam;
## nofilter(TidyAll::Plugin::Znuny::Legal::UpdateZnunyCopyright)
## nofilter(TidyAll::Plugin::Znuny::Perl::HashObjectFunctionCall)

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Log',
    'Kernel::System::Queue',
    'Kernel::System::Ticket',
);

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # Check needed stuff.

    for my $Needed (qw(Data Event Config)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }
    for my $Needed (qw(OldTicketData TicketID)) {
        if ( !$Param{Data}->{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed in Data!"
            );
            return;
        }
    }

    if ( !$Param{Data}->{OldTicketData}->{Queue} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need Queue in OldTicketData!"
        );
        return;
    }

    my $OldQueue = $Param{Data}->{OldTicketData}->{Queue};

    if ( !$Param{Config}->{SpamQueues} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need SpamQueues in Config!"
        );
        return;
    }

    if ( !$Param{Config}->{TrashQueues} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need TrashQueues in Config!"
        );
        return;
    }

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Get current ticket queue name.
    my $NewQueue = $Kernel::OM->Get('Kernel::System::Queue')->QueueLookup(
        QueueID => $TicketObject->TicketQueueID(
            TicketID => $Param{Data}->{TicketID}
        )
    );

    # Mark for learning spam if moved from non-spam queues to spam queues.
    if (
        ( $Param{Config}->{SpamQueues} !~ /(^|:::)$OldQueue(:::|$)/i )
        && ( $Param{Config}->{SpamQueues} =~ /(^|:::)$NewQueue(:::|$)/i )
        )
    {
        my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => 'PendingSpamLearningOperation',
        );

        if ( !$DynamicFieldConfig ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Need dynamic field PendingSpamLearningOperation present in system!'
            );
            return;
        }

        my $Result = $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $Param{Data}->{TicketID},
            Value              => 'spam',
            UserID             => 1,
        );

        if ( !$Result ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Cannot mark ticket ' . $Param{Data}->{TicketID} . ' as spam!',
            );
            return;
        }

        # Change ticket state after marking as spam (if configured).
        if ( $Param{Config}->{NewStateAfterMarkingSpam} ) {
            $Result = $TicketObject->TicketStateSet(
                State    => $Param{Config}->{NewStateAfterMarkingSpam},
                TicketID => $Param{Data}->{TicketID},
                UserID   => 1,
            );

            if ( !$Result ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => 'Cannot change ticket '
                        . $Param{Data}->{TicketID}
                        . " state to '"
                        . $Param{Config}->{NewStateAfterMarkingSpam}
                        . "' after moving to spam queue.",
                );
                return;
            }
        }
    }

    # Mark for learning ham if moved from spam or trash queues to
    # non-spam, non-trash queues.
    if (
        (
            ( $Param{Config}->{SpamQueues} =~ /(^|:::)$OldQueue(:::|$)/i )
            || ( $Param{Config}->{TrashQueues} =~ /(^|:::)$OldQueue(:::|$)/i )
        )
        && ( $Param{Config}->{SpamQueues}  !~ /(^|:::)$NewQueue(:::|$)/i )
        && ( $Param{Config}->{TrashQueues} !~ /(^|:::)$NewQueue(:::|$)/i )
        )
    {
        my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => 'PendingSpamLearningOperation',
        );

        if ( !$DynamicFieldConfig ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Need dynamic field PendingSpamLearningOperation present in system!'
            );
            return;
        }

        my $Result = $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $Param{Data}->{TicketID},
            Value              => 'ham',
            UserID             => 1,
        );

        if ( !$Result ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => 'Cannot mark ticket ' . $Param{Data}->{TicketID} . ' as ham!',
            );
            return;
        }
    }

    return 1;
}

1;
