# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AdminLog;

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # Allocate new hash for object.
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    if ( $Self->{Subaction} eq 'Clear' ) {
        $LogObject->CleanUp();
        return $LayoutObject->Redirect( OP => "Action=$Self->{Action}" );
    }

    # Print form.
    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    # Get log data.
    my $Log = $LogObject->GetLog() || '';

    # Split data to lines.
    my $Limit    = 400;
    my @Messages = split /\n/, $Log;
    splice @Messages, $Limit;

    # Create months map.
    my %MonthMap;
    my @Months = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
    @MonthMap{@Months} = ( 1 .. 12 );

    # Get current user time zone.
    my $TimeZone = $Self->{UserTimeZone} || $Kernel::OM->Create('Kernel::System::DateTime')->UserDefaultTimeZoneGet();

    # Create table.
    ROW:
    for my $Row (@Messages) {

        my @Parts = split /;;/, $Row;

        next ROW if !$Parts[3];

        my $ErrorClass = ( $Parts[1] =~ /error/ ) ? 'Error' : '';

        # Create date and time object from ctime log stamp.
        my @Time = split ' ', $Parts[0];
        my $DateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                String => "$Time[4]-$MonthMap{$Time[1]}-$Time[2] $Time[3]",
            },
        );

        # Converts the date and time of this object to the user time zone.
        $DateTimeObject->ToTimeZone(
            TimeZone => $TimeZone,
        );

        # Output time back as ctime string with time zone.
        $Parts[0] = $DateTimeObject->ToCTimeString() . " ($TimeZone)";

        $LayoutObject->Block(
            Name => 'Row',
            Data => {
                ErrorClass => $ErrorClass,
                Time       => $Parts[0],
                Priority   => $Parts[1],
                Facility   => $Parts[2],
                Message    => $Parts[3],
            },
        );
    }

    # Print no data found message.
    if ( !@Messages ) {
        $LayoutObject->Block(
            Name => 'AdminLogNoDataRow',
            Data => {},
        );
    }

    # Create & return output.
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminLog',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

1;
