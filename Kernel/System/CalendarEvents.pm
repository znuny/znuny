# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::LayoutObject)

package Kernel::System::CalendarEvents;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Cache',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Ticket::Article',
);

=head1 NAME

Kernel::System::CalendarEvents - to manage calendar events

=head1 DESCRIPTION

Global module for operations that bases on calendar events

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $CalendarEventsObject = $Kernel::OM->Get('Kernel::System::CalendarEvents');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{SupportedExtensionsSearchParams} = {
        ICS => {
            SearchRegex => {
                Value => 'BEGIN:VCALENDAR.+?END:VCALENDAR',
            }
        },
    };

    $Self->{PossibleAttachments}->{ContentType} = {
        'text/calendar'                 => 1,
        'application/hbs-vcs'           => 1,
        'application/vnd.swiftview-ics' => 1,
        'text/x-vcalendar'              => 1,
    };

    return $Self;
}

=head2 Parse()

Parses calendar events of specified data.

    my $CalendarEventsData = $CalendarEventsObject->Parse(
        TicketID    => $Param{TicketID},
        ArticleID   => $Param{ArticleID},
        String      => $ArticleContent, # parse specified text content
        Attachments => { # parse attachments
            Data => {
                '4' => {
                    'Disposition' => 'attachment',
                    'ContentType' => 'text/calendar; charset=UTF-8; name="Some calendar name.ics"',
                    'Filename'    => 'calendar.ics',
                    'FilesizeRaw' => '949'
                },
                '1' => {
                    'Disposition' => 'attachment',
                    'ContentType' => 'text/calendar; charset=UTF-8; name="Some calendar name1.ics"',
                    'Filename'    => 'calendar1.ics',
                    'FilesizeRaw' => '2967'
                },
            },
            Type => "Article", # specify type of attachments
        },
        ToTimeZone => $UserTimeZone,
    );

=cut

sub Parse {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $CacheObject   = $Kernel::OM->Get('Kernel::System::Cache');
    my $MainObject    = $Kernel::OM->Get('Kernel::System::Main');

    my %DataToParse;
    my %ParsedData;

    my $ToTimeZoneCacheKey = $Param{ToTimeZone} || 'Default';

    if (
        IsHashRefWithData( $Param{Attachments} )
        && $Param{Attachments}->{Type}
        && $Param{Attachments}->{Type} eq 'Article'
        )
    {
        NEEDED:
        for my $Needed (qw(TicketID ArticleID)) {
            next NEEDED if defined $Param{$Needed};

            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }

        my $ArticleBackendObject = $ArticleObject->BackendForArticle(
            TicketID  => $Param{TicketID},
            ArticleID => $Param{ArticleID}
        );
        my $AttachmentsData = $Param{Attachments}->{Data};

        # parse attachments
        if ( IsHashRefWithData $AttachmentsData) {

            ATTACHMENTINDEX:
            for my $AttachmentIndex ( sort keys %{$AttachmentsData} ) {
                my %Data = $ArticleBackendObject->ArticleAttachment(
                    ArticleID => $Param{ArticleID},
                    TicketID  => $Param{TicketID},
                    FileID    => $AttachmentIndex,
                );

                $Data{Index} = $AttachmentIndex;

                next ATTACHMENTINDEX if !$Data{Content};
                next ATTACHMENTINDEX if !$Data{ContentType};

                next ATTACHMENTINDEX if $Data{ContentType} !~ m{^(.+?);.*};
                next ATTACHMENTINDEX if !$Self->{PossibleAttachments}->{ContentType}->{$1};

                my $CalendarEventsAttachment = $CacheObject->Get(
                    Type => 'CalendarEventsArticle',
                    Key => "Attachment::$Param{TicketID}::$Param{ArticleID}::${AttachmentIndex}::${ToTimeZoneCacheKey}",

                );

                if ( IsHashRefWithData($CalendarEventsAttachment) ) {
                    push @{ $ParsedData{Attachments} }, {
                        Data  => $CalendarEventsAttachment,
                        Index => $AttachmentIndex,
                    };
                }
                else {
                    push @{ $DataToParse{Attachments} }, \%Data;
                }
            }
        }
    }

    if ( $Param{String} ) {
        push @{ $DataToParse{String} }, {
            Content => $Param{String}
        };
    }

    return if !keys %DataToParse && !IsArrayRefWithData( $ParsedData{Attachments} );

    # support for specified calendar extensions
    # select each occurrences content
    my $CalendarEvents;
    if ( keys %DataToParse ) {
        $CalendarEvents = $Self->FindEvents(
            %DataToParse,
        );
    }

    return \%ParsedData if !IsHashRefWithData($CalendarEvents);

    EXTENSION:
    for my $Extension ( sort keys %{$CalendarEvents} ) {
        next EXTENSION if !IsArrayRefWithData( $CalendarEvents->{$Extension} );
        my $BackendModule = "Kernel::System::CalendarEvents::$Extension";

        # check module validity
        if ( !$MainObject->Require($BackendModule) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't load $BackendModule.",
            );
            next EXTENSION;
        }

        if ( !$BackendModule->can('Parse') ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Module $BackendModule is missing method 'Parse'.",
            );
            next EXTENSION;
        }

        $BackendModule = $BackendModule->new();

        my $Counter = 0;

        # parse actual content of each data type
        DATA:
        for my $Data ( $CalendarEvents->{$Extension} ) {

            next DATA if !IsArrayRefWithData($Data);

            EVENTSDATA:
            for my $EventsData ( @{$Data} ) {
                next EVENTSDATA if !IsArrayRefWithData( $EventsData->{CalendarEvents} );
                next EVENTSDATA if !$EventsData->{Type};

                CONTENT:
                for my $Content ( @{ $EventsData->{CalendarEvents} } ) {
                    my $Result = $BackendModule->Parse(
                        String     => $Content,
                        ToTimeZone => $Param{ToTimeZone},
                    );

                    next CONTENT if !$Result;

                    my $Index;
                    if (
                        $EventsData->{Type} eq 'Attachments'
                        && $EventsData->{Data}->{Index}
                        )
                    {
                        $Index = $EventsData->{Data}->{Index};
                        $CacheObject->Set(
                            Type  => 'CalendarEventsArticle',
                            Key   => "Attachment::$Param{TicketID}::$Param{ArticleID}::${Index}::${ToTimeZoneCacheKey}",
                            Value => $Result,
                            TTL   => 60 * 60,
                        );
                    }
                    else {
                        $Index = $Counter;
                        $Counter++;
                    }

                    push @{ $ParsedData{ $EventsData->{Type} } }, {
                        Data  => $Result,
                        Index => $Index,
                    };
                }
            }
        }
    }

    return \%ParsedData;
}

=head2 FindEvents()

Finds supported calendar event from the string.

    my $Result = $CalendarEventsObject->FindEvents(
        String => [
            {
                Content =>
                    "Hello! You've got an invitation for a meeting:
                    BEGIN:VCALENDAR
                    ..
                    END:VCALENDAR"
            }
        ],
        Attachments => [
            {
                Content =>
                    "Hello! You've got an invitation for a meeting:
                    BEGIN:VCALENDAR
                    ..
                    END:VCALENDAR"
            },
            {
                Content =>
                    "Hello! You've got an invitation for a meeting:
                    BEGIN:VCALENDAR
                    ..
                    END:VCALENDAR"
            },
            ..
        ],
    );

=cut

sub FindEvents {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    if (
        !$Param{String}
        && !$Param{Attachments}
        )
    {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need either parameter String or Attachments.',
        );
        return;
    }

    my $SupportedExtensionsSearch = $Self->{SupportedExtensionsSearchParams};
    my %Result;

    DATATYPE:
    for my $DataType (qw(String Attachments)) {
        next DATATYPE if !IsArrayRefWithData( $Param{$DataType} );

        DATA:
        for my $Data ( @{ $Param{$DataType} } ) {
            next DATA if !IsHashRefWithData($Data);
            next DATA if !$Data->{Content};
            my $Content = $Data->{Content};

            # search for each supported extension
            my @EventsFound;
            for my $Extension ( sort keys %{$SupportedExtensionsSearch} ) {
                my $SearchRegex = $SupportedExtensionsSearch->{$Extension}->{SearchRegex};
                @EventsFound = $Content =~ m{$SearchRegex->{Value}}smg;
                if (@EventsFound) {
                    push @{ $Result{$Extension} }, {
                        CalendarEvents => \@EventsFound,
                        Type           => $DataType,
                        Data           => $Data,
                    };
                }
            }
        }
    }

    return \%Result;
}

=head2 BuildString()

Builds string for data output.

    my $OutputString = $CalendarEventsObject->BuildString(
        Data => {
          'Type'      => 'Recurrent', # required
          'Interval'  => '5',
          'ByDay'     => 'SU,TU,WE,TH,FR,SA',
          'AllDay'    => 1,
          'Frequency' => 'Weekly'
        },
        Type => 'Frequency',
    );

=cut

sub BuildString {
    my ( $Self, %Param ) = @_;

    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LanguageObject = $LayoutObject->{LanguageObject};

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Data Type)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %Data = %{ $Param{Data} };

    return if $Param{Type} ne 'Frequency';
    return if !$Data{Frequency};

    my $Interval = $Data{Interval} || 1;

    my $FrequencyMapping = $Self->_FrequencyStringMappingGet();
    my $MonthsMapping    = $Self->_MonthsMappingGet();
    my $DaysMapping      = $Self->_DaysMappingGet();
    my $DaysOrderMapping = $Self->_DaysOrderMappingGet();
    my $EveryType        = $Interval > 1 ? "Multiple" : "Single";
    my $EveryWhat        = $FrequencyMapping->{ $Data{Frequency} }->{$EveryType};

    my %Details = (
        BySecond   => '',
        ByMinute   => '',
        ByHour     => '',
        ByDay      => '',
        ByMonthDay => '',
        ByYearDay  => '',
        ByWeek     => '',
        ByMonth    => '',

        #               BySetPos   => '',
    );

    my $On;

    PROPERTY:
    for my $Property (qw(BySecond ByMinute ByHour ByMonthDay ByYearDay)) {
        next PROPERTY if !$Data{$Property};

        my @ByProperty = split /,/, $Data{$Property};
        next PROPERTY if !@ByProperty;

        $On = 1;
        $Details{$Property} .= join ', ', @ByProperty;
    }

    my $In;

    if ( $Data{ByMonth} ) {
        my @ByMonth = split /,/, $Data{ByMonth};
        if (@ByMonth) {
            $In = 1;

            my @MonthValues = map { $MonthsMapping->{$_} } @ByMonth;
            $Details{ByMonth} .= join ', ', @MonthValues;
        }
    }

    if ( $Data{ByDay} ) {
        my @ByDay = split /,/, $Data{ByDay};

        my @DayValues;

        BYDAY:
        for my $ByDay (@ByDay) {
            next BYDAY if $ByDay !~ m{(-*)(\d*)(\w{2})};

            if ( $1 && $2 ) {
                push @DayValues, $DaysOrderMapping->{ $1 . $2 } . ' ' . $DaysMapping->{$3};
            }
            elsif ($2) {
                push @DayValues, $DaysOrderMapping->{$2} . ' ' . $DaysMapping->{$3};
            }
            elsif ( !$1 && !$2 ) {
                push @DayValues, $DaysMapping->{$3};
            }
        }

        if (@DayValues) {
            $On = 1;
            $Details{ByDay} .= join ', ', @DayValues;
        }
    }

    my $FrequencyString =
        $LanguageObject->Translate("every") . " $Interval" . " " .
        $LanguageObject->Translate($EveryWhat);

    if ($In) {
        $FrequencyString .= " " . $LanguageObject->Translate("in") . " ";
        if ( $Details{ByMonth} ) {
            $FrequencyString .= $LanguageObject->Translate( $Details{ByMonth} );
        }
    }

    if ($On) {
        $FrequencyString .= " " . $LanguageObject->Translate("on") . " ";
        if ( $Details{ByYearDay} ) {
            $FrequencyString .= $LanguageObject->Translate("day") . " $Details{ByYearDay}"
                . $LanguageObject->Translate("of year")
                . ', ';
        }
        if ( $Details{ByMonthDay} ) {
            $FrequencyString .= $LanguageObject->Translate("day") . " $Details{ByMonthDay}"
                . $LanguageObject->Translate("of month")
                . ', ';
        }
        if ( $Details{ByHour} ) {
            $FrequencyString .= $LanguageObject->Translate("hour") . " $Details{ByHour}"
                . ', ';
        }
        if ( $Details{ByMinute} ) {
            $FrequencyString .= $LanguageObject->Translate("minute") . " $Details{ByMinute}"
                . ', ';
        }
        if ( $Details{BySecond} ) {
            $FrequencyString .= $LanguageObject->Translate("second") . " $Details{BySecond}"
                . ', ';
        }
        if ( $Details{ByDay} ) {
            if ( $Details{ByDay} =~ m{(\w+?) {1}(\w+)} ) {
                $FrequencyString .= $LanguageObject->Translate("$1") . " " .
                    $LanguageObject->Translate("$2")
                    . ', ';
            }
            else {
                $FrequencyString .= $LanguageObject->Translate("$Details{ByDay}")
                    . ', ';
            }
        }
        if ( $Data{AllDay} && $Param{OriginalTimeZone} ) {
            $FrequencyString .= $LanguageObject->Translate("all-day")
                . "(" . $LanguageObject->Translate( $Param{OriginalTimeZone} ) . ")"
                . ', ';
        }
        $FrequencyString = substr $FrequencyString, 0, -2;
    }
    else {
        if ( $Data{AllDay} && $Param{OriginalTimeZone} ) {
            $FrequencyString .= ', ' . $LanguageObject->Translate("all-day")
                . " (" . $LanguageObject->Translate( $Param{OriginalTimeZone} ) . ")";
        }
    }

    return $FrequencyString;
}

=head2 _FrequencyStringMappingGet()

Get frequency string mapping.

    my $FrequencyStringMapping = $CalendarEventsObject->_FrequencyStringMappingGet();

=cut

sub _FrequencyStringMappingGet {
    my ( $Self, %Param ) = @_;

    return {
        Yearly => {
            Single   => 'year',
            Multiple => 'years'
        },
        Monthly => {
            Single   => 'month',
            Multiple => 'months'
        },
        Weekly => {
            Single   => 'week',
            Multiple => 'weeks'
        },
        Daily => {
            Single   => 'day',
            Multiple => 'days'
        },
        Hourly => {
            Single   => 'hour',
            Multiple => 'hours'
        },
        Minutely => {
            Single   => 'minute',
            Multiple => 'minutes'
        },
        Secondely => {
            Single   => 'second',
            Multiple => 'seconds'
        }
    };
}

=head2 _MonthsMappingGet()

Get months mapping.

    my $MonthsMapping = $CalendarEventsObject->_MonthsMappingGet();

=cut

sub _MonthsMappingGet {
    my ( $Self, %Param ) = @_;

    return {
        1  => 'January',
        2  => 'February',
        3  => 'March',
        4  => 'April',
        5  => 'May',
        6  => 'June',
        7  => 'July',
        8  => 'August',
        9  => 'September',
        10 => 'October',
        11 => 'November',
        12 => 'December',
    };
}

=head2 _DaysMappingGet()

Get days mapping

    my $DaysMapping = $CalendarEventsObject->_DaysMappingGet();

=cut

sub _DaysMappingGet {
    my ( $Self, %Param ) = @_;

    return {
        MO => 'Monday',
        TU => 'Tuesday',
        WE => 'Wednesday',
        TH => 'Thursday',
        FR => 'Friday',
        SA => 'Saturday',
        SU => 'Sunday',
    };
}

=head2 _DaysOrderMappingGet()

Get days order mapping

    my $DaysOrderMapping = $CalendarEventsObject->_DaysOrderMappingGet();

=cut

sub _DaysOrderMappingGet {
    my ( $Self, %Param ) = @_;

    return {
        -1 => 'last',
        1  => 'first',
        2  => 'second',
        3  => 'third',
        4  => 'fourth',
    };
}

1;
