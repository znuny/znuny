# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::ProcessManagement::TransitionAction::ArticleSend;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::ProcessManagement::TransitionAction::Base);

our @ObjectDependencies = (
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Queue',
    'Kernel::System::Salutation',
    'Kernel::System::Signature',
    'Kernel::System::StandardTemplate',
    'Kernel::System::StdAttachment',
    'Kernel::System::SystemAddress',
    'Kernel::System::TemplateGenerator',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
);

=head1 NAME

Kernel::System::ProcessManagement::TransitionAction::ArticleSend - A module to send article

=head1 SYNOPSIS

All ArticleSend functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    my $ArticleSendObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::TransitionAction::ArticleSend');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Run()

Runs TransitionAction ArticleSend.

    my $Success = $ArticleSendActionObject->Run(
        UserID                   => 123,
        Ticket                   => \%Ticket,   # required
        ProcessEntityID          => 'P123',
        ActivityEntityID         => 'A123',
        TransitionEntityID       => 'T123',
        TransitionActionEntityID => 'TA123',
        Config                   => {
            SenderTypeID         => 1,                                             # (required)
                                                                                   # or
            SenderType           => 'agent',                                       # (required) agent|system|customer
            IsVisibleForCustomer => 1,                                             # (required) Is article visible for customer?
            UserID               => 123,                                           # (required)

            From        => 'Some Agent <email@example.com>',                       # required
            To          => 'Some Customer A <customer-a@example.com>',             # required if both Cc and Bcc are not present
            Cc          => 'Some Customer B <customer-b@example.com>',             # required if both To and Bcc are not present
            Bcc         => 'Some Customer C <customer-c@example.com>',             # required if both To and Cc are not present
            ReplyTo     => 'Some Customer B <customer-b@example.com>',             # not required, is possible to use 'Reply-To' instead
            Subject     => 'some short description',                               # required
            Body        => 'the message text',                                     # required
            InReplyTo   => '<asdasdasd.12@example.com>',                           # not required but useful
            References  => '<asdasdasd.1@example.com> <asdasdasd.12@example.com>', # not required but useful
            Charset     => 'iso-8859-15',
            MimeType    => 'text/plain',
            Loop        => 0, # 1|0 used for bulk emails
            HistoryType    => 'OwnerUpdate',                                       # Move|AddNote|PriorityUpdate|WebRequestCustomer|...
            HistoryComment => 'Some free text!',
            NoAgentNotify  => 0,                                                   # if you don't want to send agent notifications

            Queue   => 'Misc',                                                     # optional, use system address of queue as "From" parameter
            QueueID => 123,                                                        # optional, use system address of queue id as "From" parameter

            Attachments   => 'Attachment 1, Attachment 2, Attachment 3',           # Add attachment of the admin interface for the ArticleSend
            AttachmentIDs => '15,34,42',                                           # Add attachment ids of the admin interface for the ArticleSend

            AttachmentsReuse => 1                                                  # optional, 1|0 - Reuse of attachments stored in the dynamic field configured in Process::DynamicFieldProcessManagementAttachment.

            Template   => 'Template 1',                                            # Use template to replace in Body by Tag <OTRS_TA_TEMPLATE>
            TemplateID => 1,                                                       # Use template id to replace in Body by Tag <OTRS_TA_TEMPLATE>

            Salutation   => 'Salutation 1',                                        # Use salutation to replace in Body by Tag <OTRS_TA_SALUTATION>
            SalutationID => 1,                                                     # Use salutation id to replace in Body by Tag <OTRS_TA_SALUTATION>

            Signature   => 'Signature 1',                                          # Use signature to replace in Body by Tag <OTRS_TA_SIGNATURE>
            SignatureID => 1,                                                      # Use signature id to replace in Body by Tag <OTRS_TA_SIGNATURE>

            UseTicketHook => 0,                                                    # optional, default: 1 - if you don't want to a ticket hook
        }
    );

Returns:

    Ticket contains the result of TicketGet including DynamicFields
    Config is the Config Hash stored in a Process::TransitionAction's Config key

    my $Success = 1;     # 0

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    my $ArticleObject           = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $SalutationObject        = $Kernel::OM->Get('Kernel::System::Salutation');
    my $SignatureObject         = $Kernel::OM->Get('Kernel::System::Signature');
    my $StandardTemplateObject  = $Kernel::OM->Get('Kernel::System::StandardTemplate');
    my $StdAttachmentObject     = $Kernel::OM->Get('Kernel::System::StdAttachment');
    my $TemplateGeneratorObject = $Kernel::OM->Get('Kernel::System::TemplateGenerator');
    my $TicketObject            = $Kernel::OM->Get('Kernel::System::Ticket');
    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');

    # define a common message to output in case of any error
    my $CommonMessage = "Process: $Param{ProcessEntityID} Activity: $Param{ActivityEntityID}"
        . " Transition: $Param{TransitionEntityID}"
        . " TransitionAction: $Param{TransitionActionEntityID} - ";

    # check for missing or wrong params
    my $Success = $Self->_CheckParams(
        %Param,
        CommonMessage => $CommonMessage,
    );
    return if !$Success;

    # override UserID if specified as a parameter in the TA config
    $Param{UserID} = $Self->_OverrideUserID(%Param);

    # special case for DyanmicField UserID, convert form DynamicField_UserID to UserID
    if ( defined $Param{Config}->{DynamicField_UserID} ) {
        $Param{Config}->{UserID} = $Param{Config}->{DynamicField_UserID};
        delete $Param{Config}->{DynamicField_UserID};
    }

    # use ticket attributes if needed
    $Self->_ReplaceTicketAttributes(%Param);
    $Self->_ReplaceAdditionalAttributes(%Param);

    my $RichText = $Param{Config}->{MimeType} =~ m{html}xmsi ? 1 : 0;

    # get from address for the mail
    $Param{Config}->{From} = $Self->FromGet(%Param);

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

    # get template for the mail
    if ( $Param{Config}->{Template} || $Param{Config}->{TemplateID} ) {
        my $ID = $Param{Config}->{TemplateID} || $StandardTemplateObject->StandardTemplateLookup(
            StandardTemplate => $Param{Config}->{Template},
        );

        my %StandardTemplate = $StandardTemplateObject->StandardTemplateGet(
            ID => $ID,
        );

        my $Text = $Self->ConvertText(
            RichText    => $RichText,
            Content     => $StandardTemplate{Template},
            ContentType => $StandardTemplate{ContentType},
        );

        $Text = $TemplateGeneratorObject->_Replace(
            RichText   => $RichText,
            Text       => $Text,
            TicketData => $Param{Ticket},
            Data       => {},
            UserID     => $Param{UserID},
        );

        $Param{Config}->{Body} =~ s{(<|&lt;)OTRS_TA_Template(>|&gt;)}{$Text}xmsi;
    }

    # get salutation for the mail
    if ( $Param{Config}->{Salutation} || $Param{Config}->{SalutationID} ) {
        my %List = reverse $SalutationObject->SalutationList();

        my $ID = $Param{Config}->{SalutationID} || $List{ $Param{Config}->{Salutation} };

        my %Salutation = $SalutationObject->SalutationGet(
            ID => $ID,
        );

        my $Text = $Self->ConvertText(
            RichText    => $RichText,
            Content     => $Salutation{Text},
            ContentType => $Salutation{ContentType},
        );

        $Text = $TemplateGeneratorObject->_Replace(
            RichText   => $RichText,
            Text       => $Text,
            TicketData => $Param{Ticket},
            Data       => {},
            UserID     => $Param{UserID},
        );

        $Param{Config}->{Body} =~ s{(<|&lt;)OTRS_TA_Salutation(>|&gt;)}{$Text}xmsi;
    }

    # get signature for the mail
    if ( $Param{Config}->{Signature} || $Param{Config}->{SignatureID} ) {
        my %List = reverse $SignatureObject->SignatureList();

        my $ID = $Param{Config}->{SignatureID} || $List{ $Param{Config}->{Signature} };

        my %Signature = $SignatureObject->SignatureGet(
            ID => $ID,
        );

        my $Text = $Self->ConvertText(
            RichText    => $RichText,
            Content     => $Signature{Text},
            ContentType => $Signature{ContentType},
        );

        $Text = $TemplateGeneratorObject->_Replace(
            RichText   => $RichText,
            Text       => $Text,
            TicketData => $Param{Ticket},
            Data       => {},
            UserID     => $Param{UserID},
        );

        $Param{Config}->{Body} =~ s{(<|&lt;)OTRS_TA_Signature(>|&gt;)}{$Text}xmsi;
    }

    # add ticket hook for subject
    my $UseTicketHook = $Param{Config}->{UseTicketHook} // 1;
    if ($UseTicketHook) {
        $Param{Config}->{Subject} = $TicketObject->TicketSubjectBuild(
            TicketNumber => $Param{Ticket}->{TicketNumber},
            Subject      => $Param{Config}->{Subject},
            Type         => 'New',
            Action       => 'Reply',
        );
    }

    my $ArticleBackendObject = $ArticleObject->BackendForChannel( ChannelName => 'Email' );

    $ArticleBackendObject->ArticleSend(
        TicketID => $Param{Ticket}->{TicketID},
        UserID   => $Param{UserID},
        %{ $Param{Config} || {} },
    );

    return 1;
}

=head2 ConvertText()

This function will convert the content if the content type differs.

    my $Text = $TransitionActionObject->ConvertText(
        RichText    => 0,
        Content     => '<b>123</b> 123 123',
        ContentType => 'text/html',
    );

Returns:

    my $Text = '123 123 123';

=cut

sub ConvertText {
    my ( $Self, %Param ) = @_;

    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Content RichText ContentType)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $ContentRichText = $Param{ContentType} =~ m{html}xmsi ? 1 : 0;
    my $RichText        = $Param{RichText};
    my $Text            = $Param{Content};

    if ( $RichText && !$ContentRichText ) {
        $Text = $HTMLUtilsObject->ToHTML(
            String => $Text,
        );
    }
    elsif ( !$RichText && $ContentRichText ) {
        $Text = $HTMLUtilsObject->ToAscii(
            String => $Text,
        );
    }

    return $Text;
}

=head2 FromGet()

This function returns the from parameter for ArticleSend.

    my $From = $TransitionActionObject->FromGet(%Param);

Returns:

    my $From = 'user abc <test@test.de>';

=cut

sub FromGet {
    my ( $Self, %Param ) = @_;

    my $QueueObject         = $Kernel::OM->Get('Kernel::System::Queue');
    my $SystemAddressObject = $Kernel::OM->Get('Kernel::System::SystemAddress');
    my $LogObject           = $Kernel::OM->Get('Kernel::System::Log');

    my $From;
    if ( $Param{Config}->{From} ) {
        my $IsSystemAddress = $SystemAddressObject->SystemAddressIsLocalAddress(
            Address => $Param{Config}->{From},
        );

        if ($IsSystemAddress) {
            my %ListReverse = reverse $SystemAddressObject->SystemAddressList();

            my %SystemAddress = $SystemAddressObject->SystemAddressGet(
                ID => $ListReverse{ $Param{Config}->{From} },
            );

            $From = $SystemAddress{Realname} . ' <' . $SystemAddress{Name} . '>';
        }
        else {
            $LogObject->Log(
                Priority => 'error',
                Message =>
                    "Configured 'From' address '$Param{Config}->{From}' for transition action is not a system address. Replaced by default queue system address.",
            );

            delete $Param{Config}->{From};

            $From = $Self->FromGet(%Param);
        }
    }
    elsif ( $Param{Config}->{Queue} || $Param{Config}->{QueueID} ) {
        my $QueueID = $Param{Config}->{QueueID} || $QueueObject->QueueLookup(
            Queue => $Param{Config}->{Queue},
        );

        my %Address = $QueueObject->GetSystemAddress(
            QueueID => $QueueID,
        );

        $From = $Address{RealName} . ' <' . $Address{Email} . '>';
    }
    else {
        my %Address = $QueueObject->GetSystemAddress(
            QueueID => $Param{Ticket}->{QueueID},
        );

        $From = $Address{RealName} . ' <' . $Address{Email} . '>';
    }

    return $From;
}

1;
