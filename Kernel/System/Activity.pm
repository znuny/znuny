# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Activity;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::DBCRUD);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::Activity - to manage the activity

=head1 DESCRIPTION

All functions to manage the activity.

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $ActivityObject = $Kernel::OM->Get('Kernel::System::Activity');

=cut

=head2 Add()

Creates data attributes.

    my $CreatedID = $ActivityObject->Add(
        ID               => '...',
        Type             => '...',
        Title            => '...',
        Text             => '...',
        State            => '...',
        Link             => '...',
        CreateTime       => '...',
        CreateBy         => '...',
        UserID           => 1,
    );

Returns:

    my $CreatedID = 1;

=cut

sub Add {
    my ( $Self, %Param ) = @_;

    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    my $Title = $HTMLUtilsObject->ToAscii( String => $Param{Title} );
    my $Text  = $HTMLUtilsObject->ToAscii( String => $Param{Text} );

    my $ActivitID = $Self->DataAdd(
        Type     => $Param{Type},
        Title    => $Title,
        Text     => $Text,
        State    => $Param{State},
        Link     => $Param{Link},
        CreateBy => $Param{CreateBy},
        UserID   => $Param{UserID},
    );

    return $ActivitID;
}

=head2 GetLink()

Returns a valid URL to the details dialog of the object with the given ID.

    my $String = $ActivityObject->GetLink(
        TicketID => 32,

        # OR:
        ApointmentID => 78,
    );

Returns:

    my $String = 'http://www.znuny.org/index.pl?Action=AgentTicketZoom;TicketID=1';

=cut

sub GetLink {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    if (
        ( !$Param{TicketID} && !$Param{AppointmentID} )
        || ( $Param{TicketID} && $Param{AppointmentID} )
        )
    {
        $LogObject->Log(
            Priority => "Either give parameter 'TicketID' or 'AppointmentID'.",
            Message  => "",
        );

        return;
    }

    my $HttpType    = $ConfigObject->Get('HttpType');
    my $Hostname    = $ConfigObject->Get('FQDN');
    my $ScriptAlias = $ConfigObject->Get('ScriptAlias') // '';

    my $BaseURL = "$HttpType://$Hostname/$ScriptAlias" . "index.pl";
    my $Link    = '';

    if ( $Param{TicketID} ) {
        $Link = $BaseURL . "?Action=AgentTicketZoom;TicketID=" . $Param{TicketID};
    }
    elsif ( $Param{AppointmentID} ) {
        $Link = $BaseURL . "?Action=AgentAppointmentCalendarOverview;AppointmentID=" . $Param{AppointmentID};
    }

    return $Link;
}

=head2 Get()

Get data attributes with mapped icons.

    my $Success = $ActivityObject->Get();
        ID         => 1,
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 123,
    );

Returns:

    my $Success = 1;

=cut

sub Get {
    my ( $Self, %Param ) = @_;

    my %Data = $Self->DataGet(
        ID     => $Param{ID},
        UserID => $Param{UserID},
        %Param,
    );

    my $Icon = '';
    if ( $Data{Type} ) {
        $Icon = $Self->{TypeIconMap}->{ $Data{Type} } || '';
    }
    $Data{Icon} = $Icon;

    return %Data;
}

=head2 ListGet()

Get list data with attributes with mapped icons.

    my @Activities = $ActivityObject->ListGet(
        ID         => '...', # optional
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 123,
    );

Returns:

    my @Activities = 1;

=cut

sub ListGet {
    my ( $Self, %Param ) = @_;

    my @Activities = $Self->DataListGet(
        UserID => $Param{UserID},
        %Param,
    );

    ACTIVITY:
    for my $Activity (@Activities) {
        $Activity->{Icon} = '';

        next ACTIVITY if !$Activity->{Type};
        next ACTIVITY if !$Self->{TypeIconMap};
        $Activity->{Icon} = $Self->{TypeIconMap}->{ $Activity->{Type} } // '';
    }

    return @Activities;
}

=head2 DataAdd()

creates data attributes

    my $CreatedID = $ActivityObject->DataAdd(
        ID         => '...',
        Type       => '...',
        Title      => '...',
        Text       => '...',
        State      => '...',
        Link       => '...',
        CreateTime => '...',
        CreateBy   => '...',
        UserID     => 1,
    );

Returns:

    my $CreatedID = 1;

=cut

=head2 DataGet()

get data attributes

    my %Data = $ActivityObject->DataGet(
        ID         => '...', # optional
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 1,
    );

Returns:

    my %Data = (
        ID         => '...',
        UserID     => 1,
        Type       => '...',
        Title      => '...',
        Text       => '...',
        State      => '...',
        Link       => '...',
        CreateTime => '...',
        CreateBy   => '...',
    );

=cut

=head2 DataListGet()

get list data with attributes

    my @Data = $ActivityObject->DataListGet(
        ID         => '...', # optional
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 1,
    );

Returns:

    my @Data = (
        {
            ID         => '...',
            UserID     => 1,
            Type       => '...',
            Title      => '...',
            Text       => '...',
            State      => '...',
            Link       => '...',
            CreateTime => '...',
            CreateBy   => '...',
        },
        # ...
    );

=cut

=head2 DataUpdate()

update data attributes

    my $Success = $ActivityObject->DataUpdate(
        ID     => 1234,
        UserID => 1,
        # all other attributes are optional
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataDelete()

deletes data attributes - at least one is required.

    my $Success = $ActivityObject->DataDelete(
        ID         => '...', # optional
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 1,
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataSearch()

search for value in defined attributes

    my %Data = $ActivityObject->DataSearch(
        Search     => 'test*test',
        ID         => '...', # optional
        Type       => '...', # optional
        Title      => '...', # optional
        Text       => '...', # optional
        State      => '...', # optional
        Link       => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        UserID     => 1,
    );

Returns:

    my %Data = (
        '1' => {
            'ID'         => '...',
            'Type'       => '...',
            'Title'      => '...',
            'Text'       => '...',
            'State'      => '...',
            'Link'       => '...',
            'CreateTime' => '...',
            'CreateBy'   => '...',
            'UserID'     => 1,
        },
        # ...
    );

=cut

=head2 InitConfig()

init config for object

    my $Success = $ActivityObject->InitConfig();

Returns:

    my $Success = 1;

=cut

sub InitConfig {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $Self->{Columns} = {
        ID => {
            Column => 'id',
        },
        UserID => {
            Column       => 'user_id',
            SearchTarget => 1,
        },
        Type => {
            Column       => 'activity_type',
            SearchTarget => 1,
        },
        Title => {
            Column       => 'activity_title',
            SearchTarget => 1,
        },
        Text => {
            Column       => 'activity_text',
            SearchTarget => 1,
        },
        State => {
            Column       => 'activity_state',
            SearchTarget => 1,
        },
        Link => {
            Column       => 'activity_link',
            SearchTarget => 1,
        },
        CreateTime => {
            Column       => 'create_time',
            SearchTarget => 0,
            TimeStampAdd => 1,
        },
        CreateBy => {
            Column       => 'create_by',
            SearchTarget => 0,
        },
    };

    # base table activity
    $Self->{Name}           = 'Activity';
    $Self->{Identifier}     = 'ID';
    $Self->{DatabaseTable}  = 'activity';
    $Self->{DefaultSortBy}  = 'CreateTime';
    $Self->{DefaultOrderBy} = 'DESC';
    $Self->{CacheType}      = 'Activity';
    $Self->{CacheTTL}       = $ConfigObject->Get( 'DBCRUD::' . $Self->{Name} . '::CacheTTL' ) || 60 * 60 * 8;

    $Self->{AutoCreateMissingUUIDDatabaseTableColumns} = 1;

    # base function activation
    $Self->{FunctionDataAdd}         = 1;
    $Self->{FunctionDataUpdate}      = 1;
    $Self->{FunctionDataDelete}      = 1;
    $Self->{FunctionDataGet}         = 1;
    $Self->{FunctionDataListGet}     = 1;
    $Self->{FunctionDataSearch}      = 1;
    $Self->{FunctionDataSearchValue} = 1;

    my $Config = $ConfigObject->Get('Activity');
    %{ $Self->{TypeIconMap} }  = %{ $Config->{TypeIconMapping}  || {} };
    %{ $Self->{EventTypeMap} } = %{ $Config->{EventTypeMapping} || {} };

    return 1;
}

1;
