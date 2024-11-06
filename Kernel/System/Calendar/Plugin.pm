# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ParamObject)

package Kernel::System::Calendar::Plugin;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::JSON',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Web::Request',
);

use parent qw(Kernel::System::DBCRUD);

=head1 NAME

Kernel::System::Calendar::Plugin - Plugin lib

=head1 DESCRIPTION

Abstraction layer for appointment plugins.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $PluginObject = $Kernel::OM->Get('Kernel::System::Calendar::Plugin');

=cut

=head2 PluginList()

returns the hash of registered plugins

    my $PluginList = $PluginObject->PluginList();

=cut

sub PluginList {
    my ( $Self, %Param ) = @_;

    my %PluginList = map {
        $_ => {
            Module => $Self->{Plugins}->{$_}->{Module},
            Name   => $Self->{Plugins}->{$_}->{Name},
            URL    => $Self->{Plugins}->{$_}->{URL},
            Block  => $Self->{Plugins}->{$_}->{Block} || 'Miscellaneous',
            Prio   => $Self->{Plugins}->{$_}->{Prio},
        }
    } keys %{ $Self->{Plugins} };

    return \%PluginList;
}

=head2 PluginKeys()

returns the hash of proper plugin keys for lowercase matching

    my $PluginKeys = $PluginObject->PluginKeys();

=cut

sub PluginKeys {
    my ( $Self, %Param ) = @_;

    my %PluginKeys = map {
        lc $_ => $_
    } keys %{ $Self->{Plugins} };

    return \%PluginKeys;
}

=head2 PluginFunction()

run given plugin function with all existing params.

    # LinkAdd
    my $Result = $PluginObject->PluginFunction(
        PluginKey      => 'TicketLink',
        PluginFunction => 'LinkAdd',
        PluginData     => {
            TargetKey => 42,    # TicketID, depends on TargetObject
            SourceKey => 1,     # AppointmentID
            UserID    => 1,
        }
    );

    # LinkList
    my $Result = $PluginObject->PluginFunction(
        PluginKey      => 'TicketLink',
        PluginFunction => 'LinkList',
        PluginData     => {
            AppointmentID => 1,     # AppointmentID
            UserID        => 1,
            URL           => 'http://znuny.local/index.pl?Action=AgentTicketZoom;TicketID=%s', # optional
        }
    );

    # LinkDelete
    my $Result = $PluginObject->PluginFunction(
        PluginKey      => 'TicketLink',
        PluginFunction => 'LinkDelete',
        PluginData     => {
            AppointmentID => 1,
            UserID        => 1,
        },
    );

    # Search
    my $Result = $PluginObject->PluginFunction(
        PluginKey      => 'TicketLink',
        PluginFunction => 'Search',
        PluginData     => {
            UserID    => 1,
            Search    => 'SearchTerm',      # (required) Search string
                                            # or
            ObjectID  => $TicketID          # (required) Object ID
        },
    );

=cut

sub PluginFunction {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    for my $Needed (qw(PluginFunction PluginKey)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }

    my $PluginObject   = $Self->{Plugins}->{ $Param{PluginKey} }->{Object};
    my $PluginFunction = $Param{PluginFunction};

    if ( $MainObject->Require( $PluginObject, Silent => 1 ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Sorry, can't load $PluginObject!",
        );
        return;
    }

    my $Exists = $PluginObject->can($PluginFunction);
    if ( !$Exists ) {
        $LogObject->Log(
            Priority => 'notice',
            Message  => "Sorry, can't load function $PluginFunction in $PluginObject!",
        );
        return;
    }

    my $Result = $PluginObject->$PluginFunction(
        %{ $Param{PluginData} },
    );

    return $Result;
}

=head2 PluginGroups()

return an array of plugin groups in correct order.

    my @PluginGroups = $PluginObject->PluginGroups(
        UserID => 123,
    );

Returns:

    my @PluginGroups = (
        {
            'Title' => 'Ticket',
            'Prio'  => 1000,
            'Key'   => 'Ticket'
        },
        {
            'Key'   => 'Miscellaneous',
            'Title' => 'Miscellaneous',
            'Prio'  => 9000
        }
    );

=cut

sub PluginGroups {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my @PluginGroups;
    my $PluginGroupsConfig = $ConfigObject->Get('AppointmentCalendar::Plugin::Groups');

    # get all registered groups
    for my $Group ( sort keys %{$PluginGroupsConfig} ) {
        for my $Key ( sort keys %{ $PluginGroupsConfig->{$Group} } ) {
            push @PluginGroups, {
                'Key'   => $Key,
                'Prio'  => $PluginGroupsConfig->{$Group}->{$Key}->{Prio},
                'Title' => $PluginGroupsConfig->{$Group}->{$Key}->{Title},
            };
        }
    }

    @PluginGroups = sort { $a->{Prio} <=> $b->{Prio} } @PluginGroups;

    return @PluginGroups;
}

=head2 PluginGetParam()

Returns all params from ParamObject (Web::Request) of each plugin.

    my %PluginGetParam = $PluginObject->PluginGetParam(
        'Plugin_TicketCreate_PriorityID'                  => '3',
        'Plugin_TicketCreate_Offset'                      => '1',
        'Plugin_TicketCreate_LockID'                      => '2',
        'Plugin_TicketCreate_TicketPendingTimeOffsetUnit' => '86400',
        'Plugin_TicketCreate_QueueID[]'                   => '[4,1,28]',
        'Plugin_TicketCreate_OffsetPoint'                 => 'beforestart',
        'Plugin_TicketCreate_TypeID'                      => '105',
        'Plugin_TicketCreate_OffsetUnit'                  => '60',
        'Plugin_TicketCreate_SLAID'                       => '1',
        'Plugin_TicketCreate_ResponsibleUserID'           => '1',
        'Plugin_TicketCreate_ServiceID'                   => '1',
        'Plugin_TicketCreate_OwnerID'                     => '1',
        'Plugin_TicketCreate_StateID'                     => '1',
        'Plugin_TicketCreate_TimeType'                    => 'Never',
        'Plugin_TicketLink_LinkList[]'                      => '[438,414]',
    );

    my %PluginGetParam = $PluginObject->PluginGetParam(
        'Plugin[TicketCreate][Config][PriorityID]'                  => '3',
        'Plugin[TicketCreate][Config][Offset]'                      => '1',
        'Plugin[TicketCreate][Config][LockID]'                      => '2',
        'Plugin[TicketCreate][Config][TicketPendingTimeOffsetUnit]' => '86400',
        'Plugin[TicketCreate][Config][QueueID]'                     => '[4,1,28]',
        'Plugin[TicketCreate][Config][OffsetPoint]'                 => 'beforestart',
        'Plugin[TicketCreate][Config][TypeID]'                      => '105',
        'Plugin[TicketCreate][Config][OffsetUnit]'                  => '60',
        'Plugin[TicketCreate][Config][SLAID]'                       => '1',
        'Plugin[TicketCreate][Config][ResponsibleUserID]'           => '1',
        'Plugin[TicketCreate][Config][ServiceID]'                   => '1',
        'Plugin[TicketCreate][Config][OwnerID]'                     => '1',
        'Plugin[TicketCreate][Config][StateID]'                     => '1',
        'Plugin[TicketCreate][Config][TimeType]'                    => 'Never',
        'Plugin[TicketLink][Config][LinkList]'                      => '[438,414]',
    );

Returns:

    my %PluginGetParam = (
        'TicketCreate' => {
            'PriorityID'                  => '3',
            'Offset'                      => '1',
            'LockID'                      => '2',
            'TicketPendingTimeOffsetUnit' => '86400',
            'QueueID'                     => [
                '4',
                '1',
                '28'
            ],
            'OffsetPoint'       => 'beforestart',
            'TypeID'            => '105',
            'OffsetUnit'        => '60',
            'SLAID'             => '1',
            'ResponsibleUserID' => '1',
            'ServiceID'         => '1',
            'OwnerID'           => '1',
            'StateID'           => '1',
            'TimeType'          => 'Never'
        },
        'TicketLink' => {
            'LinkList' => [
                '438',
                '414'
            ]
        }
    );

=cut

sub PluginGetParam {
    my ( $Self, %Param ) = @_;

    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    my @ParamNames = $ParamObject->GetParamNames();

    my %GetParams;
    PARAMNAME:
    for my $ParamName (@ParamNames) {

        next PARAMNAME if $ParamName !~ m{^Plugin}g;
        next PARAMNAME if $ParamName =~ m{_Search$}g;

        my $Key;
        my ( $ID, $PluginKey, $Attribute );

        # 'Plugin[TicketCreate][Config][StateID]' = 2
        if ( $ParamName =~ m{\]\[}xms ) {
            $Key = $ParamName;

            # 'Plugin[TicketCreate][Config][StateID]' = 2
            if ( $ParamName =~ m{Plugin\[(.*)\]\[Config\]\[(.*)\]}xms ) {
                $PluginKey = $1;
                $Attribute = $2;
                $Attribute =~ s{\]\[}{};
            }
        }

        # 'Plugin_TicketCreate_StateID' = 2
        else {
            $Key = $ParamName;
            ( $ID, $PluginKey, $Attribute ) = split /_/, $ParamName;
            $Attribute =~ s/\[\]$//;
        }

        next PARAMNAME if !$PluginKey || $PluginKey eq '';
        next PARAMNAME if !$Attribute || $Attribute eq '';

        $GetParams{$PluginKey}->{$Attribute} = $ParamObject->GetParam( Param => $Key ) || undef;

        if ( $GetParams{$PluginKey}->{$Attribute} && $GetParams{$PluginKey}->{$Attribute} =~ m{^\[}g ) {
            $GetParams{$PluginKey}->{$Attribute} = $Kernel::OM->Get('Kernel::System::JSON')->Decode(
                Data => $GetParams{$PluginKey}->{$Attribute},
            );
        }

        my @Param = $ParamObject->GetArray(
            Param => $ParamName,
            Raw   => 1,
        );

        next PARAMNAME if !@Param || scalar @Param <= 1;
        $GetParams{$PluginKey}->{$Attribute} = \@Param;
    }

    return %GetParams;
}

=head2 DataAdd()

creates data attributes

    my $CreatedID = $PluginObject->DataAdd(
        ID            => '...',
        AppointmentID => '...',
        PluginKey     => '...',
        Config        => '...',
        CreateTime    => '...',
        CreateBy      => '...',
        ChangeTime    => '...',
        ChangeBy      => '...',
        UserID        => 1,
    );

Returns:

    my $CreatedID = 1;

=cut

=head2 DataGet()

get data attributes

    my %Data = $PluginObject->DataGet(
        ID            => '...', # optional
        AppointmentID => '...', # optional
        PluginKey     => '...', # optional
        Config        => '...', # optional
        CreateTime    => '...', # optional
        CreateBy      => '...', # optional
        ChangeTime    => '...', # optional
        ChangeBy      => '...', # optional
        UserID        => 1,
    );

Returns:

    my %Data = (
        ID            => '...',
        AppointmentID => '...',
        PluginKey     => '...',
        Config        => '...',
        CreateTime    => '...',
        CreateBy      => '...',
        ChangeTime    => '...',
        ChangeBy      => '...',
    );

=cut

=head2 DataListGet()

get list data with attributes

    my @Data = $PluginObject->DataListGet(
        ID            => '...', # optional
        AppointmentID => '...', # optional
        PluginKey     => '...', # optional
        Config        => '...', # optional
        CreateTime    => '...', # optional
        CreateBy      => '...', # optional
        ChangeTime    => '...', # optional
        ChangeBy      => '...', # optional
        UserID        => 1,
    );

Returns:

    my @Data = (
        {
            ID            => '...',
            AppointmentID => '...',
            PluginKey     => '...',
            Config        => '...',
            CreateTime    => '...',
            CreateBy      => '...',
            ChangeTime    => '...',
            ChangeBy      => '...',
        },
        # ...
    );

=cut

=head2 DataUpdate()

update data attributes

    my $Success = $PluginObject->DataUpdate(
        ID     => 1234,
        UserID => 1,
        # all other attributes are optional
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataDelete()

deletes data attributes - at least one is required.

    my $Success = $PluginObject->DataDelete(
        ID            => '...', # optional
        AppointmentID => '...', # optional
        PluginKey     => '...', # optional
        Config        => '...', # optional
        CreateTime    => '...', # optional
        CreateBy      => '...', # optional
        ChangeTime    => '...', # optional
        ChangeBy      => '...', # optional
        UserID        => 1,
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataSearch()

search for value in defined attributes

    my %Data = $PluginObject->DataSearch(
        Search        => 'test*test',
        ID            => '...', # optional
        AppointmentID => '...', # optional
        PluginKey     => '...', # optional
        Config        => '...', # optional
        CreateTime    => '...', # optional
        CreateBy      => '...', # optional
        ChangeTime    => '...', # optional
        ChangeBy      => '...', # optional
        UserID        => 1,
    );

Returns:

    my %Data = (
        '1' => {
            'ID'            => '...',
            'AppointmentID' => '...',
            'PluginKey'     => '...',
            'Config'        => '...',
            'CreateTime'    => '...',
            'CreateBy'      => '...',
            'ChangeTime'    => '...',
            'ChangeBy'      => '...',
        },
        # ...
    );

=cut

=head2 InitConfig()

init config for object

    my $Success = $PluginObject->InitConfig();

Returns:

    my $Success = 1;

=cut

sub InitConfig {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    $Self->{Columns} = {
        ID => {
            Column       => 'id',
            SearchTarget => 0,
        },
        AppointmentID => {
            Column       => 'appointment_id',
            SearchTarget => 1,
        },
        PluginKey => {
            Column       => 'plugin_key',
            SearchTarget => 1,
        },
        Config => {
            Column       => 'config',
            SearchTarget => 0,
            ContentJSON  => 1,
            DisableWhere => 1,
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
        ChangeTime => {
            Column          => 'change_time',
            SearchTarget    => 0,
            TimeStampAdd    => 1,
            TimeStampUpdate => 1,
        },
        ChangeBy => {
            Column       => 'change_by',
            SearchTarget => 0,
        },
    };

    # base table configuration
    $Self->{Name}           = 'Calendar::Plugin';
    $Self->{Identifier}     = 'ID';
    $Self->{DatabaseTable}  = 'calendar_appointment_plugin';
    $Self->{DefaultSortBy}  = 'PluginKey';
    $Self->{DefaultOrderBy} = 'ASC';
    $Self->{CacheType}      = 'CalendarPlugin';
    $Self->{CacheTTL}       = 60 * 60 * 8;

    $Self->{AutoCreateMissingUUIDDatabaseTableColumns} = 1;

    # base function activation
    $Self->{FunctionDataAdd}         = 1;
    $Self->{FunctionDataUpdate}      = 1;
    $Self->{FunctionDataDelete}      = 1;
    $Self->{FunctionDataGet}         = 1;
    $Self->{FunctionDataListGet}     = 1;
    $Self->{FunctionDataSearch}      = 1;
    $Self->{FunctionDataSearchValue} = 1;

    # get registered plugin modules
    my $PluginConfig = $ConfigObject->Get("AppointmentCalendar::Plugin");

    # load plugin modules
    PLUGIN:
    for my $PluginKey ( sort keys %{$PluginConfig} ) {

        my $GenericModule = $PluginConfig->{$PluginKey}->{Module};
        next PLUGIN if !$GenericModule;

        if ( !$MainObject->Require($GenericModule) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't load plugin module $GenericModule! $@",
            );
            next PLUGIN;
        }

        $Self->{Plugins}->{$PluginKey}           = $PluginConfig->{$PluginKey};
        $Self->{Plugins}->{$PluginKey}->{Name}   = $PluginConfig->{$PluginKey}->{Name} // $GenericModule;
        $Self->{Plugins}->{$PluginKey}->{Object} = $GenericModule->new( %{$Self} );
        $Self->{Plugins}->{$PluginKey}->{Module} = $GenericModule;

        if ( defined $Self->{Plugins}->{$PluginKey}->{URL} ) {
            my $URL = $Self->{Plugins}->{$PluginKey}->{URL};
            $URL =~ s{<OTRS_CONFIG_(.+?)>}{$ConfigObject->Get($1)}egx;
            $Self->{Plugins}->{$PluginKey}->{URL} = $URL || '';
        }
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
