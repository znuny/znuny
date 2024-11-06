# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Znuny::TimeSettings;

use strict;
use warnings;

use POSIX;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);
use Kernel::System::DateTime;

our @ObjectDependencies = (
    'Kernel::Config',
);

sub GetDisplayPath {
    return Translatable('Znuny') . '/' . Translatable('Time Settings');
}

sub Run {
    my $Self = shift;

    # Server time zone
    my $ServerTimeZone = POSIX::tzname();

    $Self->AddResultOk(
        Identifier => 'ServerTimeZone',
        Label      => Translatable('Server time zone'),
        Value      => $ServerTimeZone,
    );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # OTRS time zone
    my $OTRSTimeZone = $ConfigObject->Get('OTRSTimeZone');
    if ( defined $OTRSTimeZone ) {
        $Self->AddResultOk(
            Identifier => 'OTRSTimeZone',
            Label      => Translatable('Znuny time zone'),
            Value      => $OTRSTimeZone,
        );
    }
    else {
        $Self->AddResultProblem(
            Identifier => 'OTRSTimeZone',
            Label      => Translatable('Znuny time zone'),
            Value      => '',
            Message    => Translatable('Znuny time zone is not set.'),
        );
    }

    # User default time zone
    my $UserDefaultTimeZone = $ConfigObject->Get('UserDefaultTimeZone');
    if ( defined $UserDefaultTimeZone ) {
        $Self->AddResultOk(
            Identifier => 'UserDefaultTimeZone',
            Label      => Translatable('User default time zone'),
            Value      => $UserDefaultTimeZone,
        );
    }
    else {
        $Self->AddResultProblem(
            Identifier => 'UserDefaultTimeZone',
            Label      => Translatable('User default time zone'),
            Value      => '',
            Message    => Translatable('User default time zone is not set.'),
        );
    }

    # Calendar time zones
    my $Maximum = $ConfigObject->Get("MaximumCalendarNumber") || 50;

    COUNTER:
    for my $Counter ( '', 1 .. $Maximum ) {
        my $CalendarName = $ConfigObject->Get( 'TimeZone::Calendar' . $Counter . 'Name' );

        next COUNTER if !$CalendarName;

        my $CalendarTimeZone = $ConfigObject->Get( 'TimeZone::Calendar' . $Counter );

        if ( defined $CalendarTimeZone ) {
            $Self->AddResultOk(
                Identifier => "OTRSTimeZone::Calendar$Counter",
                Label      => "OTRS time zone setting for calendar $Counter",
                Value      => $CalendarTimeZone,
            );
        }
        else {
            $Self->AddResultInformation(
                Identifier => "OTRSTimeZone::Calendar$Counter",
                Label      => "OTRS time zone setting for calendar $Counter",
                Value      => '',
                Message    => Translatable('Calendar time zone is not set.'),
            );
        }
    }

    return $Self->GetResults();
}

1;
