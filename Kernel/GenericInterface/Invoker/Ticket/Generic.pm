# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::GenericInterface::Invoker::Ticket::Generic;

use strict;
use warnings;

use Kernel::System::ObjectManager;
use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::AsynchronousExecutor);
use parent qw(Kernel::System::EventHandler);

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::GenericInterface::Invoker::Ticket::Generic

=head1 PUBLIC INTERFACE

=head2 new()

usually, you want to create an instance of this
by using Kernel::GenericInterface::Invoker->new();

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    if ( !$Param{DebuggerObject} ) {
        return {
            Success      => 0,
            ErrorMessage => "Got no DebuggerObject!"
        };
    }

    $Self->{DebuggerObject} = $Param{DebuggerObject};

    return $Self;
}

=head2 PrepareRequest()

prepare the invocation of the configured remote web service.

    my $Result = $InvokerObject->PrepareRequest(
        Data => {                               # data payload
            ...
        },
    );

    $Result = {
        Success         => 1,                   # 0 or 1
        ErrorMessage    => '',                  # in case of error
        Data            => {                    # data payload after Invoker
            ...
        },
    };

=cut

sub PrepareRequest {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UtilObject   = $Kernel::OM->Get('Kernel::System::Util');

    my $InvokerName              = $Param{InvokerName} // 'Generic';
    my $GetAllArticleAttachments = $Param{Data}->{GetAllArticleAttachments}
        || $Param{Webservice}->{Config}->{Requester}->{Invoker}->{$InvokerName}->{GetAllArticleAttachments};

    my %Ticket;
    if ( $Param{Data}->{TicketID} ) {
        %Ticket = $TicketObject->TicketDeepGet(
            TicketID                 => $Param{Data}->{TicketID},
            ArticleID                => $Param{Data}->{ArticleID},    # optional, hence not checked
            GetAllArticleAttachments => $GetAllArticleAttachments,
            UserID                   => 1,
        );

        # Provide UntilTime as date/time parts
        if ( $Ticket{UntilTime} ) {
            my $UntilTimeDateTimeObject = $Kernel::OM->Create(
                'Kernel::System::DateTime',
            );
            $UntilTimeDateTimeObject->Add(
                Seconds => int( $Ticket{UntilTime} ),
            );

            $Ticket{UntilTimeDateTimeParts} = $UntilTimeDateTimeObject->Get();
        }
    }

    # Remove configured fields.
    my $OmittedFields = $ConfigObject->Get(
        'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::OmittedFields'
    ) // {};

    if (
        defined $OmittedFields->{$InvokerName}
        && length $OmittedFields->{$InvokerName}
        )
    {
        my @HashKeys = split /\s*;\s*/, $OmittedFields->{$InvokerName};

        $UtilObject->DataStructureRemoveElements(
            Data     => \%Ticket,
            HashKeys => \@HashKeys,
        );

        # Also remove elements from given payload.
        $UtilObject->DataStructureRemoveElements(
            Data     => $Param{Data},
            HashKeys => \@HashKeys,
        );
    }

    # Base-64 encode configured field values.
    my $Base64EncodedFields = $ConfigObject->Get(
        'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::Base64EncodedFields'
    ) // {};

    if (
        defined $Base64EncodedFields->{$InvokerName}
        && length $Base64EncodedFields->{$InvokerName}
        )
    {
        my @HashKeys = split /\s*;\s*/, $Base64EncodedFields->{$InvokerName};

        $UtilObject->Base64DeepEncode(
            Data     => \%Ticket,
            HashKeys => \@HashKeys,
        );

        # Also encode elements of given payload.
        $UtilObject->Base64DeepEncode(
            Data     => $Param{Data},
            HashKeys => \@HashKeys,
        );
    }

    my %Data = (
        Ticket => \%Ticket,
        Event  => $Param{Data},
    );

    $Self->{RequestData} = \%Data;

    return {
        Success => 1,
        Data    => \%Data,
    };
}

=head2 HandleResponse()

handle response data of the configured remote web service.

    my $Result = $InvokerObject->HandleResponse(
        ResponseSuccess      => 1,              # success status of the remote web service
        ResponseErrorMessage => '',             # in case of web service error
        Data => {                               # data payload
            ...
        },
    );

    $Result = {
        Success         => 1,                   # 0 or 1
        ErrorMessage    => '',                  # in case of error
        Data            => {                    # data payload after Invoker
            ...
        },
    };

=cut

sub HandleResponse {
    my ( $Self, %Param ) = @_;

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $BackendObject      = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject      = $Kernel::OM->Get('Kernel::System::Ticket::Article');

    # Pass through response if no hash
    if ( !IsHashRefWithData( $Param{Data} ) ) {
        return {
            Success => 1,
            Data    => $Param{Data},
        };
    }

    # Set data and execute functions even in error case.
    RESULT:
    for my $Key ( sort keys %{ $Param{Data} } ) {

        my $Success = 1;
        if ( $Key =~ m{OTRS_TicketDynamicFieldSet_(.*)}xmsi ) {
            my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                Name => $1,
            );

            next RESULT if !IsHashRefWithData($DynamicFieldConfig);

            $Success = $BackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $Self->{RequestData}->{Ticket}->{TicketID},
                Value              => $Param{Data}->{$Key},
                UserID             => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketTitleUpdate' ) {
            $Success = $TicketObject->TicketTitleUpdate(
                Title    => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketServiceSet' ) {
            $Success = $TicketObject->TicketServiceSet(
                Service  => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketTypeSet' ) {
            $Success = $TicketObject->TicketTypeSet(
                Type     => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketQueueSet' ) {
            $Success = $TicketObject->TicketQueueSet(
                Queue    => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketSLASet' ) {
            $Success = $TicketObject->TicketSLASet(
                SLA      => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketCustomerSet' ) {
            my @Value = split /;/, $Param{Data}->{$Key};

            $Success = $TicketObject->TicketCustomerSet(
                No       => $Value[0],
                User     => $Value[1],
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketStateSet' ) {
            $Success = $TicketObject->TicketStateSet(
                State    => $Param{Data}->{$Key},
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketOwnerSet' ) {
            $Success = $TicketObject->TicketOwnerSet(
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                NewUser  => $Param{Data}->{$Key},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketResponsibleSet' ) {
            $Success = $TicketObject->TicketResponsibleSet(
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                NewUser  => $Param{Data}->{$Key},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketPrioritySet' ) {
            $Success = $TicketObject->TicketPrioritySet(
                TicketID => $Self->{RequestData}->{Ticket}->{TicketID},
                Priority => $Param{Data}->{$Key},
                UserID   => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketHistoryAdd' ) {
            NEEDED:
            for my $Needed (qw(HistoryType)) {
                next NEEDED if defined $Param{Data}->{$Key}->{$Needed};

                return $Self->{DebuggerObject}->Error(
                    Summary =>
                        "Missing parameter '$Needed' on action '$Key' with value '$Param{Data}->{$Key}'. Failed to execute!",
                );
            }

            $Success = $TicketObject->HistoryAdd(
                Name        => $Param{Data}->{$Key}->{Name}        || $Param{Data}->{$Key}->{HistoryComment} || ' ',
                HistoryType => $Param{Data}->{$Key}->{HistoryType} || 'AddNote',
                TicketID    => $Self->{RequestData}->{Ticket}->{TicketID},
                CreateUserID => 1,
            );
        }
        elsif ( $Key eq 'OTRS_TicketArticleAdd' ) {
            NEEDED:
            for my $Needed (qw(Subject Body)) {
                next NEEDED if defined $Param{Data}->{$Key}->{$Needed};

                return $Self->{DebuggerObject}->Error(
                    Summary =>
                        "Missing parameter '$Needed' on action '$Key'. Failed to execute!",
                );
            }

            $Success = $ArticleObject->ArticleCreate(
                TicketID             => $Self->{RequestData}->{Ticket}->{TicketID},
                ChannelName          => 'Internal',
                IsVisibleForCustomer => 0,
                SenderType           => 'agent',
                Charset              => 'utf-8',
                MimeType             => 'text/plain',
                From                 => "Generic Interface",
                UserID               => 1,
                %{ $Param{Data}->{$Key} },
            );
        }
        elsif ( $Key eq 'OTRS_TicketCreate' ) {
            $Success = $TicketObject->TicketCreate(
                %{ $Param{Data}->{$Key} },
            );
        }
        elsif ( $Key eq 'OTRS_AsynchronousInvokerExecution' ) {
            if ( !IsArrayRefWithData( $Param{Data}->{$Key} ) ) {
                return $Self->{DebuggerObject}->Error(
                    Summary =>
                        "Parameter '$Key' needs to be an array with data.",
                );
            }

            INVOKERPARAMETERS:
            for my $InvokerParameters ( @{ $Param{Data}->{$Key} } ) {
                if ( !IsHashRefWithData($InvokerParameters) ) {
                    return $Self->{DebuggerObject}->Error(
                        Summary =>
                            "Parameter '$Key' needs to be an array of hashes with data.",
                    );
                }

                my $MaximumParallelInstances = $ConfigObject->Get(
                    'GenericInterface::Invoker::Ticket::Generic::HandleResponse::MaximumParallelInstances'
                ) // 1;

                my $AsyncCallOK = $Self->AsyncCall(
                    ObjectName               => 'Kernel::GenericInterface::Requester',
                    FunctionName             => 'Run',
                    FunctionParams           => $InvokerParameters,
                    Attempts                 => 3,
                    MaximumParallelInstances => $MaximumParallelInstances,
                );
                next INVOKERPARAMETERS if $AsyncCallOK;

                return $Self->{DebuggerObject}->Error(
                    Summary =>
                        'Error executing asynchronous call of Kernel::GenericInterface::Requester::Run().',
                );
            }

            $Success = 1;
        }
        elsif ( $Key eq 'OTRS_TicketArticleCreateEvent' ) {
            $Self->EventHandlerInit(
                Config => 'Ticket::EventModulePost',
            );

            my $ArticleIDsString = $Param{Data}->{$Key} // '';
            my @ArticleIDs       = split /\s*,\s*/, $ArticleIDsString;

            my %UniqueArticleIDs = map { $_ => 1 } grep { $_ =~ m{\A\d+\z} } @ArticleIDs;

            for my $ArticleID ( sort keys %UniqueArticleIDs ) {
                $Self->EventHandler(
                    Event => 'ArticleCreate',
                    Data  => {
                        ArticleID => $ArticleID,
                        TicketID  => $Self->{RequestData}->{Ticket}->{TicketID},
                    },
                    UserID => 1,
                );
            }

            # Handle all queued 'Transaction' events which were collected up to this point.
            $Self->EventHandlerTransaction();

            $Success = 1;
        }

        next RESULT if $Success;

        return $Self->{DebuggerObject}->Error(
            Summary => "Error on response action '$Key' with value '$Param{Data}->{$Key}'. Failed to execute!",
        );
    }

    # if there was an error in the response, forward it
    if ( !$Param{ResponseSuccess} ) {
        if ( !IsStringWithData( $Param{ResponseErrorMessage} ) ) {
            return $Self->{DebuggerObject}->Error(
                Summary => 'Got response error, but no response error message!',
            );
        }
        return {
            Success      => 0,
            ErrorMessage => $Param{ResponseErrorMessage},
        };
    }

    return {
        Success => 1,
        Data    => $Param{Data},
    };
}

sub HandleError {
    my ( $Self, %Param ) = @_;

    # Execute HandleResponse with error data because it might contain further tags
    # to set data or execute functions (see HandleResponse above) in error case.
    return $Self->HandleResponse(
        ResponseSuccess => 0,
        Data            => $Param{Data},
    );
}

1;
