# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::LayoutObject)

package Kernel::System::Calendar::Plugin::Ticket::Link;
use parent qw(Kernel::System::Calendar::Plugin::Base);

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Language',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Calendar::Appointment',
    'Kernel::System::LinkObject',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
);

=head1 NAME

Kernel::System::Calendar::Plugin::Ticket::Link - Ticket::Link plugin

=head1 DESCRIPTION

Ticket appointment plugin.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $TicketLinkPluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin::Ticket::Link');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 RenderOutput()

renders the output as html.

    my $HTML = $TicketLinkPluginObject->RenderOutput(
        Param           => \%Param,
        GetParam        => \%GetParam,
        Appointment     => \%Appointment,
        Plugin          => \%Plugin,
        PermissionLevel => $PermissionLevel{$Permissions},
        UserID          => $Self->{UserID},
    );

Returns:

    my $HTML = 'HTML';

=cut

sub RenderOutput {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( $Param{GetParam}->{PluginKey} && ( $Param{GetParam}->{Search} || $Param{GetParam}->{ObjectID} ) ) {

        # search using plugin
        my $ResultList = $Self->Search(
            %{ $Param{GetParam} },
            UserID => $Param{UserID},
        );

        $Param{Plugin}->{Links} = [];
        my @LinkArray = sort keys %{$ResultList};

        # add possible links
        for my $LinkID (@LinkArray) {
            my $LinkData = $ResultList->{$LinkID};

            if ( $Param{GetParam}->{ObjectID} && !defined $Param{Appointment}->{Title} && ref $LinkData ) {
                $Param{Appointment}->{Title} = $LinkData->{Title};
            }

            push @{ $Param{Plugin}->{Links} }, {
                LinkID   => $LinkID,
                LinkName => ( ref $LinkData ? $LinkData->{Subject} : $LinkData ),
                LinkURL  => sprintf(
                    $Param{Plugin}->{URL},
                    $LinkID
                ),
            };
        }

        $Param{Plugin}->{LinkList} = $LayoutObject->JSONEncode(
            Data => \@LinkArray,
        );

    }

    # edit appointment plugin links
    elsif ( $Param{GetParam}->{AppointmentID} ) {

        my $LinkList = $Self->LinkList(
            AppointmentID => $Param{GetParam}->{AppointmentID},
            UserID        => $Param{UserID},
            URL           => $Param{Plugin}->{URL},
        );
        my @LinkArray;
        $Param{Plugin}->{Links} = [];
        for my $LinkID ( sort keys %{$LinkList} ) {
            push @{ $Param{Plugin}->{Links} }, $LinkList->{$LinkID};
            push @LinkArray, $LinkList->{$LinkID}->{LinkID};
        }

        $Param{Plugin}->{LinkList} = $LayoutObject->JSONEncode(
            Data => \@LinkArray,
        );
    }

    my $HTML = $LayoutObject->Output(
        TemplateFile => 'Calendar/Plugin/Ticket/Link',
        Data         => {
            %Param,
        },
        AJAX => 1,
    );

    return $HTML;
}

=head2 Update()

updated accordingly as needed.

    my $Success = $TicketLinkPluginObject->Update(
        UserID => 123,
    );

Returns:

    my $Success = 1;

=cut

sub Update {
    my ( $Self, %Param ) = @_;

    my $AppointmentObject = $Kernel::OM->Get('Kernel::System::Calendar::Appointment');

    # Process all related appointments.
    my @RelatedAppointments  = ( $Param{Appointment}->{AppointmentID} );
    my @CalendarAppointments = $AppointmentObject->AppointmentList(
        CalendarID => $Param{Appointment}->{CalendarID},
    );

    # If we are dealing with a parent, include any child appointments as well.
    push @RelatedAppointments,
        map { $_->{AppointmentID} }
        grep { defined $_->{ParentID} && $_->{ParentID} eq $Param{Appointment}->{AppointmentID} } @CalendarAppointments;

    #  Execute link add method of the plugin.
    if ( IsArrayRefWithData( $Param{Plugin}->{Param}->{LinkList} ) ) {
        for my $LinkID ( @{ $Param{Plugin}->{Param}->{LinkList} } ) {
            for my $CurrentAppointmentID (@RelatedAppointments) {
                my $Link = $Self->LinkAdd(
                    TargetKey => $LinkID,
                    SourceKey => $CurrentAppointmentID,
                    UserID    => $Param{UserID},
                );

                if ( !$Link ) {
                    $Kernel::OM->Get('Kernel::System::Log')->Log(
                        Priority => 'error',
                        Message  => "Link could not be created for appointment $CurrentAppointmentID!",
                    );
                }
            }
        }
    }

    return 1;
}

=head2 Get()

Get all plugin information.

    my $Data = $TicketLinkPluginObject->Get(
        GetParam    => \%GetParam,
        Appointment => \%Appointment,
        Plugin      => \%Plugin,
        UserID      => $Self->{UserID},
    );

Returns:

    my $Data = {};

=cut

sub Get {
    my ( $Self, %Param ) = @_;

    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

    my $LinkList = $Self->LinkList(
        AppointmentID => $Param{Appointment}->{AppointmentID},
        UserID        => $Param{UserID},
        URL           => $Param{Plugin}->{URL},
    );

    my @LinkArray;
    for my $LinkID ( sort keys %{$LinkList} ) {
        push @LinkArray, $LinkList->{$LinkID}->{LinkName};
    }
    return if !@LinkArray;

    # truncate more than three elements
    my $LinkCount = scalar @LinkArray;
    if ( $LinkCount > 4 ) {
        splice @LinkArray, 3;
        push @LinkArray, $LanguageObject->Translate( '+%s more', $LinkCount - 3 );
    }

    my $Value = join( '\n', @LinkArray );

    my %Data = (
        Icon  => 'link',
        Value => $Value,
    );

    return \%Data;
}

=head2 LinkAdd()

adds a link from an appointment to the ticket

    my $Success = $TicketLinkPluginObject->LinkAdd(
        TargetKey => 42,    # TicketID
        SourceKey => 1,     # AppointmentID
        UserID    => 1,
    );

=cut

sub LinkAdd {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(SourceKey TargetKey UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    # check ticket id
    my %Ticket = $Kernel::OM->Get('Kernel::System::Ticket')->TicketGet(
        TicketID => $Param{TargetKey},
        UserID   => $Param{UserID},
    );
    return if !%Ticket;

    my $Success = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkAdd(
        SourceObject => 'Appointment',
        SourceKey    => $Param{SourceKey},
        TargetObject => 'Ticket',
        TargetKey    => $Param{TargetKey},
        Type         => 'Normal',
        State        => 'Valid',
        UserID       => $Param{UserID},
    );

    return $Success;
}

=head2 LinkList()

returns a hash of linked tickets to an appointment

    my $Success = $TicketLinkPluginObject->LinkList(
        AppointmentID => 123,
        UserID        => 1,
        URL           => 'http://znuny.local/index.pl?Action=AgentTicketZoom;TicketID=%s' # optional
    );

=cut

sub LinkList {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(AppointmentID UserID)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my %LinkKeyListWithData = $Kernel::OM->Get('Kernel::System::LinkObject')->LinkKeyListWithData(
        Object1 => 'Appointment',
        Key1    => $Param{AppointmentID},
        Object2 => 'Ticket',
        State   => 'Valid',
        UserID  => $Param{UserID},
    );

    return {} if !%LinkKeyListWithData;

    my %Result = map {
        $_ => {
            LinkID   => $LinkKeyListWithData{$_}->{TicketID},
            LinkName => $LinkKeyListWithData{$_}->{TicketNumber} . ' ' . $LinkKeyListWithData{$_}->{Title},
            LinkURL  => IsStringWithData( $Param{URL} )
            ? sprintf( $Param{URL}, $LinkKeyListWithData{$_}->{TicketID} )
            : '',
        }
    } keys %LinkKeyListWithData;

    return \%Result;
}

=head2 LinkDelete()

Deletes all linked tickets.

    my $Success = $TicketLinkPluginObject->LinkDelete(
        AppointmentID => 1,
        UserID        => 1,
    );

Returns:

    my $Success = 1;

=cut

sub LinkDelete {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

    for my $Needed (qw(AppointmentID UserID)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my %LinkKeyList = $LinkObject->LinkKeyList(
        Object1 => 'Appointment',
        Key1    => $Param{AppointmentID},
        Object2 => 'Ticket',
        State   => 'Valid',
        UserID  => $Param{UserID},
    );

    return 1 if !%LinkKeyList;

    my $Success;
    for my $TicketID ( sort keys %LinkKeyList ) {

        $Success = $LinkObject->LinkDelete(
            Object1 => 'Appointment',
            Key1    => $Param{AppointmentID},
            Object2 => 'Ticket',
            Key2    => $TicketID,
            Type    => 'Normal',
            UserID  => $Param{UserID},
        );

        if ( !$Success ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Unable to delete plugin links!",
            );
        }
    }

    return $Success;
}

=head2 Search()

search for ticket and return a hash of found tickets

    my $ResultList = $TicketLinkPluginObject->Search(
        Search   => '**',   # search by ticket number or title
                            # or
        ObjectID => 1,      # search by ticket ID (single result)

        UserID => 1,
    );

=cut

sub Search {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    for my $Needed (qw(UserID)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }
    if ( !$Param{Search} && !$Param{ObjectID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need either Search or ObjectID!',
        );
        return;
    }

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    my @TicketIDs;
    if ( $Param{Search} ) {

        # search the tickets by ticket number
        @TicketIDs = $TicketObject->TicketSearch(
            TicketNumber => $Param{Search},
            Limit        => 100,
            Result       => 'ARRAY',
            ArchiveFlags => ['n'],
            UserID       => $Param{UserID},
        );

        # try the title search if no results were found
        if ( !@TicketIDs ) {
            @TicketIDs = $TicketObject->TicketSearch(
                Title        => '%' . $Param{Search},
                Limit        => 100,
                Result       => 'ARRAY',
                ArchiveFlags => ['n'],
                UserID       => $Param{UserID},
            );
        }
    }
    elsif ( $Param{ObjectID} ) {
        @TicketIDs = $TicketObject->TicketSearch(
            TicketID     => $Param{ObjectID},
            Limit        => 100,
            Result       => 'ARRAY',
            ArchiveFlags => ['n'],
            UserID       => $Param{UserID},
        );
    }

    my %ResultList;

    # clean the results
    TICKET:
    for my $TicketID (@TicketIDs) {

        next TICKET if !$TicketID;

        # get ticket data
        my %Ticket = $TicketObject->TicketGet(
            TicketID      => $TicketID,
            DynamicFields => 0,
            UserID        => $Self->{UserID},
        );

        next TICKET if !%Ticket;

        # generate the ticket information string
        $ResultList{ $Ticket{TicketID} } = {
            Subject => $Ticket{TicketNumber} . ' ' . $Ticket{Title},
            Title   => $Ticket{Title},
        };
    }

    return \%ResultList;
}

1;
