# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::CalendarEvents::ICS;

use strict;
use warnings;

use iCal::Parser;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::HTMLUtils',
    'Kernel::System::DateTime',
    'Kernel::System::Encode',
);

=head1 NAME

Kernel::System::CalendarEvents::ICS - to manage calendar ICS events

=head1 DESCRIPTION

Global module for operations on calendar events with ICS extension

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $CalendarEventsICSObject = $Kernel::OM->Get('Kernel::System::CalendarEvents::ICS');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $Self->{TimeZonesMap} = $ConfigObject->Get('AppointmentCalendar::NonStandardTimeZonesMapping') // {};

    $Self->{GlobalPropertiesMap} = {
        Events => {
            DESCRIPTION => "Description",
            SUMMARY     => "Summary",
            LOCATION    => "Location",
            ATTENDEE    => "Attendee",
            ORGANIZER   => "Organizer",
        }
    };

    $Self->{DetailsPropertiesMap} = {
        Keys => {
            FREQ       => "Frequency",
            UNTIL      => "Until",
            INTERVAL   => "Interval",
            BYSECOND   => "BySecond",
            BYMINUTE   => "ByMinute",
            BYHOUR     => "ByHour",
            BYDAY      => "ByDay",
            BYMONTHDAY => "ByMonthDay",
            BYYEARDAY  => "ByYearDay",
            BYWEEKNO   => "ByWeek",
            BYMONTH    => "ByMonth",
            BYSETPOS   => "BySetPos",
            WKST       => "WeekDay",
            TYPE       => "Type",
        },
        Values => {
            YEARLY    => "Yearly",
            MONTHLY   => "Monthly",
            WEEKLY    => "Weekly",
            DAILY     => "Daily",
            HOURLY    => "Hourly",
            MINUTELY  => "Minutely",
            SECONDELY => "Secondely",
            SPAN      => "Span",
            RECURRENT => "Recurrent",
        }
    };

    return $Self;
}

=head2 Parse()

Parses ICS string.

    my $Result = $CalendarEventsICSObject->Parse(
        String =>
            "BEGIN:VCALENDAR
            ..
            END:VCALENDAR",
        ToTimeZone => 'Europe/Berlin', # optional
    );

=cut

sub Parse {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(String)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $StringData = $Self->_PreProcess(
        String => $Param{String},
    );
    return if !IsHashRefWithData($StringData);

    my $String = $StringData->{Value};
    return if !IsStringWithData($String);

    my $TimeZone = $StringData->{tz};
    return if !$TimeZone;

    # parser accepts only timezones from TimeZoneList()
    # any other format will result in error
    my $TimeZones = Kernel::System::DateTime->TimeZoneList() // [];
    my %TimeZones = map { $_ => 1 } @{$TimeZones};

    if ( !$TimeZones{$TimeZone} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Specified timezone $TimeZone is not supported!"
        );
        return;
    }

    my $ICSParserStartDate = $ConfigObject->Get('ICSParser::StartDate') // '20100101';

    my $ICSParserEndDateObject = $Kernel::OM->Create('Kernel::System::DateTime');
    $ICSParserEndDateObject->Add( Years => 10 );
    my $ICSParserEndDate = $ICSParserEndDateObject->Format( Format => '%Y%m%d' );

    my $ParserObject;
    eval {
        $ParserObject = iCal::Parser->new(
            start => $ICSParserStartDate,
            end   => $ICSParserEndDate,
            tz    => $TimeZone,
        );
    };
    if ($@) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "There was an error on initializing ICS calendar event parser: $@"
        );
        return;
    }
    return if !$ParserObject;

    my $ParsedData;
    eval {
        $ParsedData = $ParserObject->parse_strings($String);
    };
    if ($@) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "There was an error while parsing calendar event data: $@"
        );
        return;
    }
    return if !$ParsedData;

    my $Result = $Self->_PrepareData(
        Data           => $ParsedData,
        TimeZone       => $TimeZone,
        ToTimeZone     => $Param{ToTimeZone},
        AdditionalData => $StringData->{AdditionalData}
    );

    return $Result;
}

=head2 _PrepareData()

Standardizes/post-processes data hash from parsed data.

    my $Result = $CalendarEventsICSObject->_PrepareData(
        Data => {
          'todos' => [
                      ..
                     ],
          'events' => {
                        '2022' => {
                                    '3' => {
                                             '7' => {
                                                     ..
                                                    }
                                           }
                                  }
                      }

        }, 'cals' => [
                       {
                        'X-WR-CALNAME' => 'Calendar 1',
                        'X-WR-RELCALID' => 1,
                        ..
                       }
                     ]
        }

=cut

sub _PrepareData {
    my ( $Self, %Param ) = @_;

    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $EncodeObject    = $Kernel::OM->Get('Kernel::System::Encode');

    return if !IsHashRefWithData( $Param{Data} );
    return if !$Param{TimeZone};

    my $ConvertTimeZone;
    my %GlobalPropertiesSaved;
    my %EventResult;
    my %Result;

    my $Calendars = $Param{Data}->{cals};
    my $Events    = $Param{Data}->{events};
    my $Todos     = $Param{Data}->{todos};

    my $TimeZone         = $Param{TimeZone};
    my $OriginalTimeZone = $TimeZone;

    if ( IsArrayRefWithData($Calendars) ) {
        for my $Calendar ( @{$Calendars} ) {
            push @{ $Result{Calendars} }, {
                Name     => $Calendar->{"X-WR-CALNAME"},
                Index    => $Calendar->{"index"},
                Timezone => $Calendar->{"X-WR-TIMEZONE"},
                ProdID   => $Calendar->{"PRODID"},
            };
        }
    }

    if ( $Param{ToTimeZone} && $Param{ToTimeZone} ne $Param{TimeZone} ) {
        $ConvertTimeZone = $Param{ToTimeZone};
        $TimeZone        = $Param{ToTimeZone};
    }

    return \%Result if !IsHashRefWithData($Events);

    YEAR:
    for my $Year ( sort { $a <=> $b } keys %{$Events} ) {
        next YEAR if !IsHashRefWithData( $Events->{$Year} );

        my %Months = %{ $Events->{$Year} };
        for my $Month ( sort { $a <=> $b } keys %Months ) {
            next YEAR if !IsHashRefWithData( $Months{$Month} );

            my %Days = %{ $Months{$Month} };
            for my $Day ( sort { $a <=> $b } keys %Days ) {
                next YEAR if !IsHashRefWithData( $Days{$Day} );

                my %Events = %{ $Days{$Day} };
                my $AllDay;

                EVENTID:
                for my $EventID ( sort keys %Events ) {
                    next YEAR if !IsHashRefWithData( $Events{$EventID} );

                    my $Data = $Events{$EventID};

                    my $DTStart = $Data->{DTSTART};
                    my $DTEnd   = $Data->{DTEND};

                    next EVENTID if ( ref $DTStart ne 'DateTime' ) || ( ref $DTEnd ne 'DateTime' );

                    my $DTStartLocal = $DTStart->{local_c};
                    my $DTEndLocal   = $DTEnd->{local_c};

                    my %Date = (
                        Start => {
                            Year   => $DTStartLocal->{year},
                            Month  => $DTStartLocal->{month},
                            Day    => $DTStartLocal->{day},
                            Hour   => $DTStartLocal->{hour},
                            Minute => $DTStartLocal->{minute},
                            Second => $DTStartLocal->{second},
                        },
                        End => {
                            Year   => $DTEndLocal->{year},
                            Month  => $DTEndLocal->{month},
                            Day    => $DTEndLocal->{day},
                            Hour   => $DTEndLocal->{hour},
                            Minute => $DTEndLocal->{minute},
                            Second => $DTEndLocal->{second},
                        }
                    );

                    if ($ConvertTimeZone) {
                        my %DateTimeSettingsConverted;

                        my $DateTimeObjectStart = $Kernel::OM->Create(
                            'Kernel::System::DateTime',
                            ObjectParams => {
                                %{ $Date{Start} },
                                TimeZone => $Param{TimeZone}
                            }
                        );
                        $DateTimeObjectStart->ToTimeZone(
                            TimeZone => $ConvertTimeZone,
                        );

                        $DateTimeSettingsConverted{Start} = $DateTimeObjectStart->Get();

                        my $DateTimeObjectEnd = $Kernel::OM->Create(
                            'Kernel::System::DateTime',
                            ObjectParams => {
                                %{ $Date{End} },
                                TimeZone => $Param{TimeZone}
                            }
                        );

                        $DateTimeObjectEnd->ToTimeZone(
                            TimeZone => $ConvertTimeZone,
                        );

                        $DateTimeSettingsConverted{End} = $DateTimeObjectEnd->Get();

                        for my $Boundary (qw(Start End)) {
                            for my $Property (qw(Year Month Day Hour Minute Second)) {
                                $Date{$Boundary}->{$Property} = $DateTimeSettingsConverted{$Boundary}->{$Property};
                            }
                        }
                    }

                    if ( $Data->{allday} ) {
                        $AllDay = 1;
                    }

                    push @{ $EventResult{$EventID}->{Dates} }, {
                        %Date,
                    };

                    # for multiple events this data is the same
                    # no need to save multiple times
                    next EVENTID if $GlobalPropertiesSaved{$EventID};

                    $GlobalPropertiesSaved{$EventID} = 1;
                    if ( IsArrayRefWithData( $Param{AdditionalData}->{$EventID}->{Description} ) ) {

                        DATATOINJECT:
                        for my $DataToInject ( @{ $Param{AdditionalData}->{$EventID}->{Description} } ) {
                            next DATATOINJECT if $DataToInject->{DataType} ne 'base64';
                            next DATATOINJECT if !$DataToInject->{InlineImage};
                            next DATATOINJECT if !$DataToInject->{ContentType};

                            push @{ $EventResult{$EventID}->{AdditionalData}->{Description}->{Images} }, {
                                ContentType => $DataToInject->{ContentType},
                                DataType    => 'base64',
                                Content     => $DataToInject->{Content},
                            };
                        }
                    }

                    if (
                        IsHashRefWithData( $Data->{ORGANIZER} )
                        && IsStringWithData( $Data->{ORGANIZER}->{CN} )
                        )
                    {
                        my %Safety = $HTMLUtilsObject->Safety(
                            String       => $Data->{ORGANIZER}->{CN},
                            NoApplet     => 1,
                            NoObject     => 1,
                            NoEmbed      => 1,
                            NoSVG        => 1,
                            NoImg        => 1,
                            NoIntSrcLoad => 1,
                            NoExtSrcLoad => 1,
                            NoJavaScript => 1,
                        );

                        $EncodeObject->EncodeInput( \$Safety{String} );

                        $EventResult{$EventID}->{ $Self->{GlobalPropertiesMap}->{Events}->{ORGANIZER} }
                            = $Safety{String};
                    }

                    my $Attendees = $Data->{ATTENDEE};
                    if ( IsArrayRefWithData($Attendees) ) {
                        my @AttendeeSafety;

                        for my $Attendee ( @{$Attendees} ) {
                            my %Safety = $HTMLUtilsObject->Safety(
                                String       => $Attendee->{CN},
                                NoApplet     => 1,
                                NoObject     => 1,
                                NoEmbed      => 1,
                                NoSVG        => 1,
                                NoImg        => 1,
                                NoIntSrcLoad => 1,
                                NoExtSrcLoad => 1,
                                NoJavaScript => 1,
                            );

                            $EncodeObject->EncodeInput( \$Safety{String} );

                            push @AttendeeSafety, $Safety{String};
                        }
                        $EventResult{$EventID}->{ $Self->{GlobalPropertiesMap}->{Events}->{ATTENDEE} }
                            = \@AttendeeSafety;
                    }

                    for my $Property (qw(DESCRIPTION SUMMARY LOCATION)) {
                        if ( IsStringWithData( $Data->{$Property} ) ) {
                            $Data->{$Property} =~ s{\\n}{\n}g;
                            $Data->{$Property} =~ s{\\r}{\r}g;
                            $Data->{$Property} =~ s{&nbsp}{ }g;
                        }
                        my $PropertyString;
                        if ( IsStringWithData( $Data->{$Property} ) ) {
                            my %Safety = $HTMLUtilsObject->Safety(
                                String       => $Data->{$Property},
                                NoApplet     => 1,
                                NoObject     => 1,
                                NoEmbed      => 1,
                                NoSVG        => 1,
                                NoImg        => 0,
                                NoIntSrcLoad => 0,
                                NoExtSrcLoad => 1,
                                NoJavaScript => 1,
                            );

                            $PropertyString = $Safety{String};
                            $EncodeObject->EncodeInput( \$PropertyString );
                        }
                        elsif ( defined $Data->{$Property} && !length $Data->{$Property} ) {
                            $PropertyString = '';
                        }

                        $EventResult{$EventID}->{ $Self->{GlobalPropertiesMap}->{Events}->{$Property} }
                            = $PropertyString;
                    }

                    if ( IsHashRefWithData( $Param{AdditionalData}->{"$EventID"}->{Details} ) ) {
                        my %Details = %{ $Param{AdditionalData}->{"$EventID"}->{Details} };
                        for my $Detail ( sort keys %Details ) {
                            my $Key   = $Self->{DetailsPropertiesMap}->{Keys}->{$Detail} || $Detail;
                            my $Value = $Self->{DetailsPropertiesMap}->{Values}->{ $Details{$Detail} }
                                || $Details{$Detail};
                            $EventResult{$EventID}->{Details}->{$Key} = $Value;
                        }
                    }

                    $EventResult{$EventID}->{Details}->{AllDay} = $AllDay;
                    $EventResult{$EventID}->{TimeZone} = $TimeZone;
                }
            }
        }
    }

    return \%Result if !%EventResult;

    for my $EventID ( sort keys %EventResult ) {
        push @{ $Result{Events} }, {
            UID              => $EventID,
            OriginalTimeZone => $OriginalTimeZone,
            %{ $EventResult{$EventID} }
        };
    }

    return \%Result;
}

=head2 _PreProcess()

Pre-processes calendar data.

    my $Result = $CalendarEventsICSObject->$CalendarEventsICSObject(
        String =>
            "BEGIN:VCALENDAR
            PRODID:-//Microsoft Corporation//Outlook 16.0 MIMEDIR//EN
            VERSION:2.0
            METHOD:REQUEST
            .."
    );

=cut

sub _PreProcess {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(String)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %Result;
    my $TimeZone;
    my $ProdID;
    my $String      = $Param{String};
    my @EventsFound = $String =~ m{BEGIN:VEVENT.*?END:VEVENT}gsm;

    $String =~ m{BEGIN:VTIMEZONE.+?TZID:(.*?)(\n|\r).+?END:VTIMEZONE}sm;
    $TimeZone = $1;

    $String =~ m{PRODID:(.+?)(\n|\r)}sm;
    $ProdID = $1 // '';

    EVENT:
    for my $Event (@EventsFound) {
        $Event =~ m/.*?UID:(.*?)[\n*\r*]/sm;
        my $UID = $1;

        # clean long base64 from parser
        while ( $Event =~ m/(.*?DESCRIPTION.*?)%3Cimg.*?src\%3D\%22data%3A(.*?)%3B(.*?)%2C(.*?)\%22(.*)/gsm ) {
            next EVENT if !$1 || !$2 || !$3 || !$4 || !$5;
            next EVENT if $3 ne 'base64';

            my $EventTemp   = $1 . $5;
            my $ContentType = URI::Escape::uri_unescape($2);

            my $Content = $4;
            $Content =~ s{ *\r*\n*}{}gsm;
            $Content = URI::Escape::uri_unescape($Content);

            $String =~ s{$Event}{$EventTemp};
            $Event = $EventTemp;

            push @{ $Result{AdditionalData}->{$UID}->{Description} }, {
                ContentType => $ContentType,
                Content     => $Content,
                DataType    => 'base64',
                InlineImage => 1,
            };
        }

        my %Details;

        # recurrent event with daily repeat will be treated as span events
        # as there is no difference between them
        if ( $Event =~ m{RRULE:(.*)\n*\r*} ) {
            my $RecurrenceString = $1;
            $Details{TYPE} = "RECURRENT";

            my @RecurrencePropertiesTemp = split /;/, $RecurrenceString;
            for my $Property (@RecurrencePropertiesTemp) {
                my @SplitProperty = split /=/, $Property;
                $Details{ $SplitProperty[0] } = $SplitProperty[1];
            }
        }
        else {
            $Details{TYPE} = "SPAN";
            $Details{FREQ} = "DAILY";
        }

        $Result{AdditionalData}->{$UID}->{Details} = \%Details;

        if ( $ProdID =~ m{Google Inc\/\/Google Calendar} ) {

            # clean unwanted google calendar description string
            if ( $Event =~ m{DESCRIPTION.*?(-\s*:\s*:\s*~\s*.+~\s*:\s*:\s*-)}sm ) {
                my $DescriptionPartToClean = $1;

                # on single meeting, google won't send timezone in tag, but only in link in the URL
                if ( !$TimeZone ) {
                    my $DescriptionToSearch = $DescriptionPartToClean;
                    $DescriptionToSearch =~ s{ *\n*\r*}{}gsm;
                    $DescriptionToSearch =~ m{https:\/\/.+?calendar.+?tz=(.*?)&.+?\.}sm;
                    if ($1) {
                        $TimeZone = URI::Escape::uri_unescape($1);
                    }
                }

                $String =~ s{\Q$DescriptionPartToClean\E}{}sm;
            }
        }

        # code to apply if microsoft additional auto-generated part of string will need to be cut
        #         elsif ( $ProdID =~ m{^Microsoft} ) {
        #
        #             # clean unwanted microsoft calendar description string if exists
        #             if ( $Event =~ m{DESCRIPTION.*?([\_\s*]{82}.*[\_\s*]{82})}sm ) {
        #                 my $DescriptionPartToClean = $1;
        #                 $String =~ s{\Q$DescriptionPartToClean\E}{}sm;
        #             }
        #         }
    }

    if ( !$TimeZone ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Could not determine timezone for the calendar event!',
        );
        return;
    }

    # decode from URL
    $String = URI::Escape::uri_unescape($String);

    if ( $Self->{TimeZonesMap}->{$TimeZone} ) {
        $TimeZone = $Self->{TimeZonesMap}->{$TimeZone};
    }

    $Result{Value} = $String;
    $Result{tz}    = $TimeZone;

    # do not return data if it's too big for parser to process
    return if length $Result{Value} > 150000;

    return \%Result;
}

1;
