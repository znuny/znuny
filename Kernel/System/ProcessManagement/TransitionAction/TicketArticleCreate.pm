# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::ProcessManagement::TransitionAction::TicketArticleCreate;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::ProcessManagement::TransitionAction::Base);

our @ObjectDependencies = (
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::StdAttachment',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::TicketArticleCreate - A module to create an article

=head1 DESCRIPTION

All TicketArticleCreate functions.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $TicketArticleCreateObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionAction::TicketArticleCreate');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

Runs TransitionAction TicketArticleCreate.

    my $Success = $TicketArticleCreateActionObject->Run(
        UserID                   => 123,

        # Ticket contains the result of TicketGet including dynamic fields
        Ticket                   => \%Ticket,   # required
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',

        # Config is the hash stored in a Process::TransitionAction's config key
        Config => {
            SenderType           => 'agent',                            # (required) agent|system|customer
            IsVisibleForCustomer => 1,                                  # 0 or 1
            CommunicationChannel => 'Internal',                         # Internal|Phone|Email|..., default: Internal

            %DataPayload,                                               # some parameters depending of each communication channel, please check ArticleCreate() on each
                                                                        #   communication channel for the full list of optional and mandatory parameters

            AttachmentsReuse => 1                                       # optional, 1|0 - Reuse of attachments stored in the dynamic field configured in Process::DynamicFieldProcessManagementAttachment.
            TimeUnit => 123,                                            # optional, to set the accounting time
            UserID   => 123,                                            # optional, to override the UserID from the logged user
       },
    );

Returns:

    $Success = 1; # 0

    # Internal article example:

    my $Success = $TicketArticleCreateActionObject->Run(
        UserID => 123,
        Ticket => {
            TicketNumber => '20101027000001',
            Title        => 'some title',
            TicketID     => 123,
            State        => 'some state',
            # ... (all ticket properties)
        },
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',
        Config                   => {
            SenderType           => 'agent',
            IsVisibleForCustomer => 1,
            CommunicationChannel => 'Internal',

            # Internal article data payload.
            From           => 'Some Agent <email@example.com>',
            To             => 'Some Customer A <customer-a@example.com>',
            Subject        => 'some short description',
            Body           => 'the message text',
            Charset        => 'ISO-8859-15',
            MimeType       => 'text/plain',
            HistoryType    => 'OwnerUpdate',
            HistoryComment => 'Some free text!',
            UnlockOnAway   => 1,
        },
    );

    # Email article example:

    my $Success = $TicketArticleCreateActionObject->Run(
        UserID => 123,
        Ticket => {
            TicketNumber => '20101027000001',
            Title        => 'some title',
            TicketID     => 123,
            State        => 'some state',
            # ... (all ticket properties, as the result from Kernel::System::Ticket::TicketGet)
        },
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',
        Config                   => {
            SenderType           => 'agent',
            IsVisibleForCustomer => 1,
            CommunicationChannel => 'Email',

            # Email article data payload.
            From               => 'Some Agent <email@example.com>',
            To                 => 'Some Customer A <customer-a@example.com>',
            Subject            => 'some short description',
            Body               => 'the message text',
            Charset            => 'ISO-8859-15',
            MimeType           => 'text/plain',
            HistoryType        => 'EmailAgent',
            HistoryComment     => 'Some free text!',
            UnlockOnAway       => 1,
            DynamicField_NameX => 'Value of DF Article',
        },
    );

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $ArticleObject             = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $HTMLUtilsObject           = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $LogObject                 = $Kernel::OM->Get('Kernel::System::Log');
    my $StdAttachmentObject       = $Kernel::OM->Get('Kernel::System::StdAttachment');
    my $TicketObject              = $Kernel::OM->Get('Kernel::System::Ticket');
    my $UserObject                = $Kernel::OM->Get('Kernel::System::User');

    # Define a common message to output in case of any error.
    my $CommonMessage = "Process: $Param{ProcessEntityID} Activity: $Param{ActivityEntityID}"
        . " Transition: $Param{TransitionEntityID}"
        . " TransitionAction: $Param{TransitionActionEntityID} - ";

    # Check for missing or wrong params.
    my $Success = $Self->_CheckParams(
        %Param,
        CommonMessage => $CommonMessage,
    );
    return if !$Success;

    $Param{Config}->{CommunicationChannel} ||= 'Internal';

    if ( !defined $Param{Config}->{IsVisibleForCustomer} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Need Config -> IsVisibleForCustomer",
        );

        return;
    }

    # Override UserID if specified as a parameter in the TA config.
    $Param{UserID} = $Self->_OverrideUserID(%Param);

    # Convert DynamicField value to HTML string, see bug#14229.
    if ( $Param{Config}->{Body} =~ /OTRS_TICKET_DynamicField_/ ) {
        MATCH:
        for my $Match ( sort keys %{ $Param{Ticket} } ) {
            if ( $Match =~ m/DynamicField_(.*)/ && $Param{Ticket}->{$Match} ) {

                my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                    Name => $1,
                );

                # Check if there is HTML content.
                my $IsHTMLContent = $DynamicFieldBackendObject->HasBehavior(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Behavior           => 'IsHTMLContent',
                );

                # Avoid duble conversion to HTML for dynamic fields with HTML content.
                next MATCH if $IsHTMLContent;
                $Param{Ticket}->{$Match} = $HTMLUtilsObject->ToHTML(
                    String => $Param{Ticket}->{$Match},
                );
            }
        }
    }

    # Use ticket attributes if needed.
    $Self->_ReplaceTicketAttributes(%Param);
    $Self->_ReplaceAdditionalAttributes(%Param);

    # Convert scalar items into array references.
    for my $Attribute (
        qw(ForceNotificationToUserID ExcludeNotificationToUserID ExcludeMuteNotificationToUserID)
        )
    {
        if ( IsStringWithData( $Param{Config}->{$Attribute} ) ) {
            $Param{Config}->{$Attribute} = $Self->_ConvertScalar2ArrayRef(
                Data => $Param{Config}->{$Attribute},
            );
        }
    }

    # If "From" is not set and MIME based article is to be created.
    if (
        !$Param{Config}->{From}
        && $Param{Config}->{CommunicationChannel} =~ m{\AEmail|Internal|Phone\z}msxi
        )
    {

        # Get current user data
        my %User = $UserObject->GetUserData(
            UserID => $Param{UserID},
        );

        # Set "From" field according to user - UserFullname <UserEmail>.
        $Param{Config}->{From} = $User{UserFullname} . ' <' . $User{UserEmail} . '>';
    }

    my $ArticleBackendObject = $ArticleObject->BackendForChannel(
        ChannelName => $Param{Config}->{CommunicationChannel}
    );

    # attachments
    if ( $Param{Config}->{AttachmentsReuse} ) {
        $Param{Config}->{Attachment} = $Self->_GetAttachments(%Param);
    }

    if ( $Param{Config}->{Attachments} || $Param{Config}->{AttachmentIDs} ) {
        my @AttachmentIDs = split /\s*,\s*/, ( $Param{Config}->{AttachmentIDs} || '' );

        my @AttachmentNames = split /\s*,\s*/, ( $Param{Config}->{Attachments} || '' );
        ATTACHMENT:
        for my $Name (@AttachmentNames) {
            my $ID = $StdAttachmentObject->StdAttachmentLookup(
                StdAttachment => $Name,
            );
            next ATTACHMENT if !$ID;

            push @AttachmentIDs, $ID;
        }

        ATTACHMENT:
        for my $ID (@AttachmentIDs) {
            my %Data = $StdAttachmentObject->StdAttachmentGet(
                ID => $ID,
            );
            next ATTACHMENT if !%Data;

            if ( $Data{ValidID} != 1 ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => $CommonMessage
                        . 'Attachment (ID: '
                        . $ID
                        . ', Name: '
                        . $Data{Name}
                        . ') is invalid. Skip Attachment!',
                );
                next ATTACHMENT;
            }

            push @{ $Param{Config}->{Attachment} }, {
                Content     => $Data{Content},
                ContentType => $Data{ContentType},
                Filename    => $Data{Filename},
            };
        }
    }

    my $ArticleID = $ArticleBackendObject->ArticleCreate(
        %{ $Param{Config} },
        TicketID => $Param{Ticket}->{TicketID},
        UserID   => $Param{UserID},
    );

    if ( !$ArticleID ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => $CommonMessage
                . "Couldn't create article for Ticket: "
                . $Param{Ticket}->{TicketID} . '!',
        );
        return;
    }

    # Set time units.
    if ( $Param{Config}->{TimeUnit} ) {
        $TicketObject->TicketAccountTime(
            TicketID  => $Param{Ticket}->{TicketID},
            ArticleID => $ArticleID,
            TimeUnit  => $Param{Config}->{TimeUnit},
            UserID    => $Param{UserID},
        );
    }

    # set dynamic fields for ticket and article

    # set a field filter (all valid dynamic fields have to have set to 1 like NameX => 1)
    my %FieldFilter;
    for my $Attribute ( sort keys %{ $Param{Config} } ) {
        if ( $Attribute =~ m{\A DynamicField_ ( [a-zA-Z0-9]+ ) \z}msx ) {
            $FieldFilter{$1} = 1;
        }
    }

    # get the dynamic fields for ticket
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => [ 'Ticket', 'Article' ],
        FieldFilter => \%FieldFilter,
    );

    # cycle through the activated Dynamic Fields for this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicFieldList} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        my $ObjectID = $Param{Ticket}->{TicketID};
        if ( $DynamicFieldConfig->{ObjectType} ne 'Ticket' ) {

            # skip article dynamic fields if Article was not created
            next DYNAMICFIELD if !$ArticleID;

            $ObjectID = $ArticleID;
        }

        # set the value
        my $Success = $DynamicFieldBackendObject->ValueSet(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $ObjectID,
            Value              => $Param{Config}->{ 'DynamicField_' . $DynamicFieldConfig->{Name} },
            UserID             => $Param{UserID},
        );

        if ( !$Success ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => $CommonMessage
                    . "Couldn't set DynamicField Value on $DynamicFieldConfig->{ObjectType}:"
                    . " $ObjectID from Ticket: "
                    . $Param{Ticket}->{TicketID} . '!',
            );
            return;
        }
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
