# --
# Copyright (C) 2021 Informatyka Boguslawski sp. z o.o. sp.k., http://www.ib.pl/
# Based on FulltextIndexRebuildWorker.pm by OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## nofilter(TidyAll::Plugin::Znuny::Perl::NoExitInConsoleCommands)
## nofilter(TidyAll::Plugin::Znuny::Legal::UpdateZnunyCopyright)

package Kernel::System::Console::Command::Maint::Ticket::SpamAssassinLearn;

use strict;
use warnings;

use Time::HiRes();

use parent qw(Kernel::System::Console::BaseCommand);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::CommunicationChannel',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Send all inbound e-mail articles of tickets marked for spam/ham learning to spamassassin.');
    $Self->AddOption(
        Name        => 'host',
        Description => "SpamAssassin host.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/^.+$/smx,
    );
    $Self->AddOption(
        Name        => 'port',
        Description => "SpamAssassin port (default: 783).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^\d+$/smx,
    );
    $Self->AddOption(
        Name        => 'username',
        Description => "SpamAssassin username.",
        Required    => 1,
        HasValue    => 1,
        ValueRegex  => qr/^.+$/smx,
    );
    $Self->AddOption(
        Name        => 'limit',
        Description => "Maximum number of tickets to process (default: 4000).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^\d+$/smx,
    );
    $Self->AddOption(
        Name        => 'micro-sleep',
        Description => "Specify microseconds to sleep after every ticket to reduce system load (e.g. 1000).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^\d+$/smx,
    );
    $Self->AddOption(
        Name        => 'timeout',
        Description => "Connection timeout in seconds (default: 3).",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/^\d+$/smx,
    );

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Host       = $Self->GetOption('host');
    my $Port       = $Self->GetOption('port') // 783;
    my $Username   = $Self->GetOption('username');
    my $Limit      = $Self->GetOption('limit') // 4000;
    my $MicroSleep = $Self->GetOption('micro-sleep');
    my $Timeout    = $Self->GetOption('timeout') // 3;

    $Self->{TicketsLearnedAsSpam}    = 0;
    $Self->{TicketsLearnedAsHam}     = 0;
    $Self->{TicketsLearnTided}       = 0;
    $Self->{TicketsLearnFailed}      = 0;
    $Self->{ArticlesProcessedAsSpam} = 0;
    $Self->{ArticlesProcessedAsHam}  = 0;
    $Self->{ArticlesLearnedAsSpam}   = 0;
    $Self->{ArticlesLearnedAsHam}    = 0;

    # Load required spamassassin client lib.
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require( 'Mail::SpamAssassin::Client', Silent => 1 ) ) {
        $Self->_Abort( Message => 'Mail::SpamAssassin::Client is required but not found!' );
    }

    my $LogObject                 = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject              = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject             = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
    my $DynamicFieldConfig        = $DynamicFieldObject->DynamicFieldGet(
        Name => 'PendingSpamLearningOperation',
    );
    if ( !$DynamicFieldConfig ) {
        $Self->_Abort( Message => 'Need dynamic field PendingSpamLearningOperation present in system!' );
    }

    my %EmailCommunicationChannel = $Kernel::OM->Get('Kernel::System::CommunicationChannel')->ChannelGet(
        ChannelName => 'Email',
    );
    if ( !%EmailCommunicationChannel ) {
        $Self->_Abort( Message => 'Cannot find Email communication channel!' );
    }
    my $EmailCommunicationChannelID = $EmailCommunicationChannel{'ChannelID'};
    if ( !$EmailCommunicationChannelID ) {
        $Self->_Abort( Message => 'Cannot find Email communication channel ID!' );
    }

    my $SpamAssassinClient;

    $Self->Print(
        "<yellow>Feeding SpamAssassin with inbound e-mail messages content from tickets marked for spam/ham learning...</yellow>\n"
    );

    # Get all tickets marked for learning (non empty PendingSpamLearningOperation ticket dynamic field).
    my @TicketIDs = $TicketObject->TicketSearch(
        DynamicField_PendingSpamLearningOperation => {
            Empty => 0,
        },
        Limit      => $Limit,
        UserID     => 1,
        Permission => 'ro',
        Result     => 'ARRAY',
    );

    TICKET:
    for my $TicketID (@TicketIDs) {

        # Get ticket data.
        my %Ticket = $TicketObject->TicketGet(
            TicketID      => $TicketID,
            DynamicFields => 1,
        );

        my $TicketProcessedArticles = 0;
        my $TicketLearnedArticles   = 0;

        my $LearnType = -1;
        if ( $Ticket{'DynamicField_PendingSpamLearningOperation'} =~ /^spam$/i ) {
            $LearnType = 0;    # 0 means spam for Mail::SpamAssassin::Client->learn()
        }
        elsif ( $Ticket{'DynamicField_PendingSpamLearningOperation'} =~ /^ham$/i ) {
            $LearnType = 1;    # 1 means ham for Mail::SpamAssassin::Client->learn()
        }

        if ( ( $LearnType == 0 ) || ( $LearnType == 1 ) ) {

            # Find all customer (inbound) e-mail articles in ticket and feed it to spamassassin for learning.

            my @Articles = $ArticleObject->ArticleList(
                TicketID               => $TicketID,
                SenderType             => 'customer',
                CommunicationChannelID => $EmailCommunicationChannelID,
            );

            ARTICLE:
            for my $Article (@Articles) {
                my $ArticleBackendObject = $ArticleObject->BackendForArticle(
                    TicketID  => $TicketID,
                    ArticleID => $Article->{ArticleID},
                );

                next ARTICLE if ( $ArticleBackendObject->ChannelNameGet() ne 'Email' );

                my $EmailContent = $ArticleBackendObject->ArticlePlain(
                    TicketID  => $TicketID,
                    ArticleID => $Article->{ArticleID},
                );

                if ( !$EmailContent ) {
                    my $Message = sprintf(
                        'TicketID=%s ArticleID=%s: learning skipped (cannot get e-mail article plain content)',
                        $TicketID,
                        $Article->{ArticleID}
                    );
                    $LogObject->Log(
                        Priority => 'error',
                        Message  => $Message,
                    );
                    $Self->Print( $Message . "\n" );
                    next ARTICLE;
                }

                # Initialize connection to SpamAssassin if not already connected.
                if ( !$SpamAssassinClient ) {
                    $SpamAssassinClient = Mail::SpamAssassin::Client->new(
                        {
                            host     => $Host,
                            port     => $Port,
                            username => $Username,
                            timeout  => $Timeout,
                        }
                    );
                    if ( ( !$SpamAssassinClient ) || ( !$SpamAssassinClient->ping() ) ) {
                        $Self->{TicketsLearnFailed}++;
                        $Self->Print(
                            "TicketID=${TicketID}: left marked for learning again (cannot connect to SpamAssassin service)\n"
                        );
                        $Self->_Abort(
                            Message => sprintf(
                                'Cannot connect to SpamAssassin service %s@%s:%d (timeout %d)!',
                                $Host, $Port, $Username, $Timeout
                            )
                        );
                    }
                }

                my $Result = $SpamAssassinClient->learn( $EmailContent, $LearnType );

                if ( defined($Result) ) {
                    if ($Result) {
                        $Self->Print(
                            sprintf(
                                "TicketID=%s ArticleID=%s: message was learned by SpamAssassin (%d bytes)\n",
                                $TicketID, $Article->{ArticleID}, length($EmailContent)
                            )
                        );
                        $Self->{ArticlesLearnedAsSpam}++ if ( $LearnType == 0 );
                        $Self->{ArticlesLearnedAsHam}++  if ( $LearnType == 1 );
                        $TicketLearnedArticles++;
                    }
                    else {
                        $Self->Print(
                            sprintf(
                                "TicketID=%s ArticleID=%s: message was not learned by SpamAssassin (%d bytes)\n",
                                $TicketID, $Article->{ArticleID}, length($EmailContent)
                            )
                        );
                    }

                    $Self->{ArticlesProcessedAsSpam}++ if ( $LearnType == 0 );
                    $Self->{ArticlesProcessedAsHam}++  if ( $LearnType == 1 );
                    $TicketProcessedArticles++;
                }
                else {
                    $Self->{TicketsLearnFailed}++;
                    $Self->_Abort(
                        Message => sprintf(
                            'TicketID=%s ArticleID=%s: ticket left marked for learning again (error #%d sending article to SpamAssassin service: %s)',
                            $TicketID,
                            $Article->{ArticleID},
                            $SpamAssassinClient->{resp_code},
                            $SpamAssassinClient->{resp_msg}
                        )
                    );
                }
            }
        }

        # Reset dynamic field after processing.
        my $Result = $DynamicFieldBackendObject->ValueDelete(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $TicketID,
            UserID             => 1,
        );
        if ( !$Result ) {
            $Self->{TicketsLearnFailed}++;
            $Self->_PrintSummary();
            $Self->PrintError(
                "TicketID=${TicketID}: left marked for learning again (cannot remove dynamic field PendingSpamLearningOperation)\n"
            );
            return $Self->ExitCodeError();
        }

        # Print result for ticket and update counters.
        my $Message;
        if ( $LearnType == 0 ) {
            $Message = sprintf(
                'Ticket learned as spam (%d of %d customer e-mail messages learned).',
                $TicketLearnedArticles, $TicketProcessedArticles
            );
            $Self->{TicketsLearnedAsSpam}++;
        }
        elsif ( $LearnType == 1 ) {
            $Message = sprintf(
                'Ticket learned as ham (%d of %d customer e-mail messages learned).',
                $TicketLearnedArticles, $TicketProcessedArticles
            );
            $Self->{TicketsLearnedAsHam}++;
        }
        else {
            $Message = "Ticket was tided without learning (invalid PendingSpamLearningOperation value '"
                . $Ticket{'DynamicField_PendingSpamLearningOperation'} . "' was removed).";
            $Self->{TicketsLearnTided}++;
        }

        $Self->Print("TicketID=${TicketID}: ${Message}\n");

        # log the triggered event in the history
        $TicketObject->HistoryAdd(
            TicketID     => $TicketID,
            HistoryType  => 'Misc',
            Name         => $Message,
            CreateUserID => 1,
        );

        # Sleep if configured to reduce system load.
        Time::HiRes::usleep($MicroSleep) if $MicroSleep;
    }

    $Self->_PrintSummary();
    $Self->Print("<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

sub _PrintSummary {
    my ( $Self, %Param ) = @_;

    my $TicketsProcessed = $Self->{TicketsLearnedAsSpam}
        + $Self->{TicketsLearnedAsHam}
        + $Self->{TicketsLearnTided}
        + $Self->{TicketsLearnFailed};

    my $Summary = sprintf(
        "Summary: processed tickets: %d (spam=%d ham=%d tided=%d failed=%d), processed articles: %d (spam=%d ham=%d), learned articles: %d (spam=%d ham=%d)",
        $TicketsProcessed,
        $Self->{TicketsLearnedAsSpam},
        $Self->{TicketsLearnedAsHam},
        $Self->{TicketsLearnTided},
        $Self->{TicketsLearnFailed},
        $Self->{ArticlesProcessedAsSpam} + $Self->{ArticlesProcessedAsHam},
        $Self->{ArticlesProcessedAsSpam},
        $Self->{ArticlesProcessedAsHam},
        $Self->{ArticlesLearnedAsSpam} + $Self->{ArticlesLearnedAsHam},
        $Self->{ArticlesLearnedAsSpam},
        $Self->{ArticlesLearnedAsHam},
    );

    # Log summary only if any ticket was processed.
    if ( $TicketsProcessed > 0 ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'notice',
            Message  => $Summary,
        );
    }

    $Self->Print( $Summary . "\n" );

    return 1;
}

sub _Abort {
    my ( $Self, %Param ) = @_;

    if ( !$Param{Message} ) {
        die "Need Message!";
    }

    $Self->_PrintSummary();

    $Kernel::OM->Get('Kernel::System::Log')->Log(
        Priority => 'error',
        Message  => $Param{Message},
    );

    $Self->PrintError( $Param{Message} . "\n" );

    exit $Self->ExitCodeError();
}

1;
