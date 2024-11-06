# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::TicketZoom::Agent::MIMEBase;

use parent 'Kernel::Output::HTML::TicketZoom::Agent::Base';

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Article::MIMEBase',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::CalendarEvents',
    'Kernel::System::CommunicationChannel',
    'Kernel::System::DateTime',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Ticket::Article',
    'Kernel::System::User',
);

=head2 ArticleRender()

Returns article html.

    my $HTML = $ArticleBaseObject->ArticleRender(
        TicketID               => 123,         # (required)
        ArticleID              => 123,         # (required)
        ShowBrowserLinkMessage => 1,           # (optional) Default: 0.
        ArticleActions         => [],          # (optional)
        UserID                 => 123,         # (optional)
    );

Result:
    $HTML = "<div>...</div>";

=cut

sub ArticleRender {
    my ( $Self, %Param ) = @_;

    # Check needed stuff.
    for my $Needed (qw(TicketID ArticleID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my $ConfigObject         = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject         = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $MainObject           = $Kernel::OM->Get('Kernel::System::Main');
    my $ArticleBackendObject = $Kernel::OM->Get('Kernel::System::Ticket::Article')->BackendForArticle(%Param);

    my %Article = $ArticleBackendObject->ArticleGet(
        %Param,
        RealNames => 1,
    );
    if ( !%Article ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Article not found (ArticleID=$Param{ArticleID})!"
        );
        return;
    }

    # Get channel specific fields
    my %ArticleFields = $LayoutObject->ArticleFields(%Param);

    # Get dynamic fields and accounted time
    my %ArticleMetaFields = $Self->ArticleMetaFields(%Param);

    # Get data from modules like Google CVE search
    my @ArticleModuleMeta = $Self->_ArticleModuleMeta(%Param);

    # Show created by string, if creator is different from admin user.
    if ( $Article{CreateBy} > 1 ) {
        $Article{CreateByUser} = $Kernel::OM->Get('Kernel::System::User')->UserName( UserID => $Article{CreateBy} );
    }

    my $RichTextEnabled = $ConfigObject->Get('Ticket::Frontend::ZoomRichTextForce')
        || $LayoutObject->{BrowserRichText}
        || 0;

    # Show HTML if RichText is enabled and HTML attachment isn't missing.
    my $ShowHTML         = $RichTextEnabled;
    my $HTMLBodyAttachID = $Kernel::OM->Get('Kernel::Output::HTML::Article::MIMEBase')->HTMLBodyAttachmentIDGet(
        %Param,
    );
    if ( $ShowHTML && !$HTMLBodyAttachID ) {
        $ShowHTML = 0;
    }

    # Strip plain text attachments by default.
    my $ExcludePlainText = 1;

    # Do not strip plain text attachments if no plain text article body was found.
    if ( $Article{Body} && $Article{Body} eq '- no text message => see attachment -' ) {
        $ExcludePlainText = 0;
    }

    # Get attachment index (excluding body attachments).
    my %AtmIndex = $ArticleBackendObject->ArticleAttachmentIndex(
        ArticleID        => $Param{ArticleID},
        ExcludePlainText => $ExcludePlainText,
        ExcludeHTMLBody  => $RichTextEnabled,
        ExcludeInline    => $RichTextEnabled,
    );

    my @ArticleAttachments;

    # Add block for attachments.
    if (%AtmIndex) {
        my $Config = $ConfigObject->Get('Ticket::Frontend::ArticleAttachmentModule');

        ATTACHMENT:
        for my $FileID ( sort keys %AtmIndex ) {

            my $Attachment;

            # Run article attachment modules.
            next ATTACHMENT if ref $Config ne 'HASH';
            my %Jobs = %{$Config};

            JOB:
            for my $Job ( sort keys %Jobs ) {
                my %File = %{ $AtmIndex{$FileID} };

                # load module
                next JOB if !$MainObject->Require( $Jobs{$Job}->{Module} );
                my $Object = $Jobs{$Job}->{Module}->new(
                    %{$Self},
                    TicketID  => $Param{TicketID},
                    ArticleID => $Param{ArticleID},
                    UserID    => $Param{UserID} || 1,
                );

                # run module
                my %Data = $Object->Run(
                    File => {
                        %File,
                        FileID => $FileID,
                    },
                    TicketID => $Param{TicketID},
                    Article  => \%Article,
                );

                if (%Data) {
                    %File = %Data;
                }

                $File{Links} = [
                    {
                        Action => $File{Action},
                        Class  => $File{Class},
                        Link   => $File{Link},
                        Target => $File{Target},
                    },
                ];
                if ( $File{Action} && $File{Action} ne 'Download' ) {
                    delete $File{Action};
                    delete $File{Class};
                    delete $File{Link};
                    delete $File{Target};
                }

                if ($Attachment) {
                    push @{ $Attachment->{Links} }, $File{Links}->[0];
                }
                else {
                    $Attachment = \%File;
                }
            }
            push @ArticleAttachments, $Attachment;
        }
    }

    my $ArticleContent;

    if ($ShowHTML) {
        if ( $Param{ShowBrowserLinkMessage} ) {
            $LayoutObject->Block(
                Name => 'BrowserLinkMessage',
            );
        }
    }
    else {
        $ArticleContent = $LayoutObject->ArticlePreview(
            %Param,
            ResultType => 'plain',
        );

        # html quoting
        $ArticleContent = $LayoutObject->Ascii2Html(
            NewLine        => $ConfigObject->Get('DefaultViewNewLine'),
            Text           => $ArticleContent,
            VMax           => $ConfigObject->Get('DefaultViewLines') || 5000,
            HTMLResultMode => 1,
            LinkFeature    => 1,
        );
    }

    my %CommunicationChannel = $Kernel::OM->Get('Kernel::System::CommunicationChannel')->ChannelGet(
        ChannelID => $Article{CommunicationChannelID},
    );

    if ( $CommunicationChannel{ChannelName} eq 'Email' ) {
        my $TransmissionStatus = $ArticleBackendObject->ArticleTransmissionStatus(
            ArticleID => $Article{ArticleID},
        );
        if ($TransmissionStatus) {
            $LayoutObject->Block(
                Name => 'TransmissionStatusMessage',
                Data => $TransmissionStatus,
            );
        }

        $Self->_CalendarEventsOutput(
            TicketID     => $Param{TicketID},
            ArticleID    => $Param{ArticleID},
            AtmIndex     => \%AtmIndex,
            LayoutObject => $LayoutObject,
        );
    }

    my $SenderImage = $Self->_ArticleSenderImage(
        Sender => $Article{From},
        UserID => $Param{UserID},
    );

    my $SenderInitials = $LayoutObject->UserInitialsGet(
        Fullname => $Article{FromRealname},
    );

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentTicketZoom/ArticleRender/MIMEBase',
        Data         => {
            %Article,
            ArticleFields        => \%ArticleFields,
            ArticleMetaFields    => \%ArticleMetaFields,
            ArticleModuleMeta    => \@ArticleModuleMeta,
            Attachments          => \@ArticleAttachments,
            MenuItems            => $Param{ArticleActions},
            Body                 => $ArticleContent,
            HTML                 => $ShowHTML,
            CommunicationChannel => $CommunicationChannel{DisplayName},
            ChannelIcon          => $CommunicationChannel{DisplayIcon},
            SenderImage          => $SenderImage,
            SenderInitials       => $SenderInitials,
        },
    );

    return $Content;
}

sub _CalendarEventsOutput {
    my ( $Self, %Param ) = @_;

    my $CalendarEventsObject = $Kernel::OM->Get('Kernel::System::CalendarEvents');
    my $HTMLUtilsObject      = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $LayoutObject         = $Param{LayoutObject};

    my $CalendarEventsData = $CalendarEventsObject->Parse(
        TicketID    => $Param{TicketID},
        ArticleID   => $Param{ArticleID},
        Attachments => {
            Type => 'Article',
            Data => $Param{AtmIndex},
        },
        ToTimeZone => $LayoutObject->{UserTimeZone},
    ) // {};

    my @AttachmentCalendarEvents = @{ $CalendarEventsData->{Attachments} // [] };
    @AttachmentCalendarEvents = grep { IsArrayRefWithData( $_->{Data}->{Events} ) } @AttachmentCalendarEvents;
    return if !@AttachmentCalendarEvents;

    my $TotalNumberOfEvents = 0;
    ATTACHMENT:
    for my $Attachment (@AttachmentCalendarEvents) {
        $TotalNumberOfEvents += @{ $Attachment->{Data}->{Events} };
    }

    $LayoutObject->Block(
        Name => 'CalendarEvents',
        Data => {
            MultipleEvents => $TotalNumberOfEvents > 1 ? 1 : 0,
        }
    );

    ATTACHMENT:
    for my $Attachment (@AttachmentCalendarEvents) {
        my @Events         = @{ $Attachment->{Data}->{Events} };
        my $EventCounter   = 0;
        my $NumberOfEvents = scalar @Events;

        EVENT:
        for my $Event (@Events) {
            $EventCounter++;

            next EVENT if !IsHashRefWithData( $Event->{Dates}->[0]->{Start} );
            next EVENT if !IsHashRefWithData( $Event->{Dates}->[-1]->{End} );

            my $TimeZone = $Event->{TimeZone};
            next EVENT if !$TimeZone;

            my %GlobalStartDateProperties = %{ $Event->{Dates}->[0]->{Start} };
            my %GlobalEndDateProperties   = %{ $Event->{Dates}->[-1]->{End} };

            my $DateTimeObjectStart = $Kernel::OM->Create(
                'Kernel::System::DateTime',
                ObjectParams => {
                    %GlobalStartDateProperties,
                    TimeZone => $TimeZone,
                }
            );
            my $DateTimeObjectEnd = $Kernel::OM->Create(
                'Kernel::System::DateTime',
                ObjectParams => {
                    %GlobalEndDateProperties,
                    TimeZone => $TimeZone,
                }
            );

            my $EventStartString
                = $DateTimeObjectStart->Format( Format => '%Y-%m-%d %H:%M:%S (%{time_zone_long_name})' );
            my $EventEndString = $DateTimeObjectEnd->Format( Format => '%Y-%m-%d %H:%M:%S (%{time_zone_long_name})' );

            my %DateRangeGlobal = (
                Start => $EventStartString,
                End   => $EventEndString,
            );

            $LayoutObject->Block(
                Name => 'CalendarEventsMessageRow',
                Data => {
                    %DateRangeGlobal,
                },
            );

            $LayoutObject->Block(
                Name => 'CalendarEvent',
            );

            my @PropertiesToDisplay;

            PROPERTY:
            for my $Property (qw(Summary Organizer Attendee Description Location)) {
                if ( IsArrayRefWithData( $Event->{$Property} ) ) {
                    my $Value = join "\n", @{ $Event->{$Property} };

                    push @PropertiesToDisplay, {
                        Name  => $Property,
                        Value => $Value,
                    };

                    next PROPERTY;
                }

                next PROPERTY if !$Event->{$Property};

                push @PropertiesToDisplay, {
                    Name  => $Property,
                    Value => $Event->{$Property},
                };
            }

            push @PropertiesToDisplay, {
                Name  => "Start",
                Value => $EventStartString,
            };

            push @PropertiesToDisplay, {
                Name  => "End",
                Value => $EventEndString,
            };

            PROPERTY:
            for my $Property (@PropertiesToDisplay) {
                my $HTMLString = $HTMLUtilsObject->ToHTML(
                    String             => $Property->{Value},
                    ReplaceDoubleSpace => 1,
                );

                my %Safety = $HTMLUtilsObject->Safety(
                    String       => $HTMLString,
                    NoApplet     => 1,
                    NoObject     => 1,
                    NoEmbed      => 1,
                    NoSVG        => 1,
                    NoImg        => 1,
                    NoIntSrcLoad => 1,
                    NoExtSrcLoad => 1,
                    NoJavaScript => 1,
                );

                $LayoutObject->Block(
                    Name => 'CalendarEventPropertyRow',
                    Data => {
                        Label => $Property->{Name},
                        Value => $Safety{String},
                    }
                );

                my $PropertyImages = $Event->{AdditionalData}->{ $Property->{Name} }->{Images};
                next PROPERTY if !IsArrayRefWithData($PropertyImages);

                IMAGE:
                for my $Image ( @{$PropertyImages} ) {
                    for my $Property (qw (DataType ContentType Content)) {
                        next IMAGE if !$Image->{$Property};
                    }

                    next IMAGE if $Image->{DataType} ne 'base64';

                    $LayoutObject->Block(
                        Name => 'CalendarEventPropertyRowImage',
                        Data => {
                            DataType    => $Image->{DataType},
                            ContentType => $Image->{ContentType},
                            Content     => $Image->{Content},
                        }
                    );
                }
            }

            my $FrequencyString = $CalendarEventsObject->BuildString(
                Data             => $Event->{Details},
                OriginalTimeZone => $Event->{OriginalTimeZone},
                Type             => "Frequency",
            );

            if ($FrequencyString) {
                $LayoutObject->Block(
                    Name => 'CalendarEventPropertyRowFrequency',
                    Data => {
                        FrequencyStrg => $FrequencyString,
                    },
                );
            }

            # show download for every attachment
            next EVENT if $EventCounter != $NumberOfEvents;

            $LayoutObject->Block(
                Name => 'CalendarEventPropertyRowDownload',
                Data => {
                    TicketID  => $Param{TicketID},
                    ArticleID => $Param{ArticleID},
                    FileID    => $Attachment->{Index},
                }
            );
        }
    }

    return 1;
}

1;
