# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Dashboard::MyLastChangedTickets;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get needed objects
    for my $Needed (qw(Config Name UserID)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    # check if the user has filter preferences for this widget
    my %Preferences = $Kernel::OM->Get('Kernel::System::User')->GetPreferences(
        UserID => $Self->{UserID},
    );

    $Self->{PrefKeyShown} = 'UserDashboardPref' . $Self->{Name} . '-Shown';
    $Self->{PageShown}    = $Preferences{ $Self->{PrefKeyShown} };

    return $Self;
}

sub Preferences {
    my ( $Self, %Param ) = @_;

    my @Params = (
        {
            Desc  => Translatable('Shown Tickets'),
            Name  => $Self->{PrefKeyShown},
            Block => 'Option',
            Data  => {
                5  => ' 5',
                10 => '10',
                15 => '15',
                20 => '20',
                25 => '25',
                30 => '30',
                35 => '35',
            },
            SelectedID  => $Self->{PageShown},
            Translation => 0,
        },
    );

    return @Params;
}

sub Config {
    my ( $Self, %Param ) = @_;

    return (
        %{ $Self->{Config} },
        CacheKey => 'MyLastChangedTickets-'
            . $Self->{UserID} . '-'
            . $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{UserLanguage},
    );
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $DBObject     = $Kernel::OM->Get('Kernel::System::DB');
    my $UserObject   = $Kernel::OM->Get('Kernel::System::User');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %Preferences = $UserObject->GetPreferences(
        UserID => $Self->{UserID},
    );

    my $UserLimit = $Preferences{ $Self->{PrefKeyShown} };
    my $Limit     = $UserLimit || $Self->{Config}->{Limit} || 10;

    my $SQL = 'SELECT   id
               FROM     ticket
               WHERE    change_by = ?
               ORDER BY change_time DESC
    ';

    return if !$DBObject->Prepare(
        SQL   => $SQL,
        Bind  => [ \$Self->{UserID} ],
        Limit => $Limit,
    );

    my @TicketIDs;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        push @TicketIDs, $Row[0];
    }

    if ( !@TicketIDs ) {
        $LayoutObject->Block(
            Name => 'NoTickets',
        );
    }
    else {
        for my $TicketID (@TicketIDs) {
            my %Ticket = $TicketObject->TicketGet(
                TicketID => $TicketID,
                UserID   => $Self->{UserID},
            );

            $Ticket{Link} = "Action=AgentTicketZoom&TicketID=$TicketID";

            $LayoutObject->Block(
                Name => 'Ticket',
                Data => \%Ticket,
            );
        }
    }

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardMyLastChangedTickets',
        Data         => {
            %{ $Self->{Config} },
        },
    );

    return $Content;
}

1;
