# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::LastViews;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::AuthSession',
    'Kernel::System::Log',
    'Kernel::System::Time',
    'Kernel::System::Main',
    'Kernel::Language',
);

use Kernel::System::VariableCheck qw(:all);

=head1 NAME

Kernel::System::LastViews - LastViews lib

=head1 PUBLIC INTERFACE

=head2 new()

    Don't use the constructor directly, use the ObjectManager instead:

    my $LastViewsObject = $Kernel::OM->Get('Kernel::System::LastViews');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{SessionKey} = 'UserLastViews';

    @{ $Self->{ActionIgnore} } = (
        'CustomerTicketArticleContent',
        'AgentTicketArticleContent',
        'AgentTicketSearch',
        'AgentTicketNote',
        'AgentTicketActionCommon',
        'AgentTicketArticleContent',
        'AgentTicketAttachment',
        'AgentTicketBounce',
        'AgentTicketBulk',
        'AgentTicketClose',
        'AgentTicketCompose',
        'AgentTicketCustomer',
        'AgentTicketEmailOutbound',
        'AgentTicketEmailResend',
        'AgentTicketForward',
        'AgentTicketFreeText',
        'AgentTicketHistory',
        'AgentTicketLockedView',
        'AgentTicketLock',
        'AgentTicketMarkSeenUnseen',
        'AgentTicketMerge',
        'AgentTicketMove',
        'AgentTicketOwner',
        'AgentTicketPending',
        'AgentTicketPhoneCommon',
        'AgentTicketPhoneInbound',
        'AgentTicketPhoneOutbound',
        'AgentTicketPlain',
        'AgentTicketPrint',
        'AgentTicketPriority',
        'AgentTicketProcess',
        'AgentTicketResponsible',
        'AgentTicketToUnitTest',
        'AgentTicketWatcher',
    );

    @{ $Self->{SubactionIgnore} } = (
        'LoadWidget',
        'MarkAsSeen',
        'AJAXNavigationTree',
        'CheckSettings',
    );

    return $Self;
}

=head2 Get()

Returns data of LastView (Request).

    my %LastView = $LastViewsObject->Get(
        %{ $Param{Request} },
    );

Returns:

    my %LastView = (
        Type     => 'TicketOverview',
        Name     => 'Queue',
        Frontend => 'Agent',
        Icon     => 'fa fa-table',
        PopUp    => 0,                  # 0 or 1
        Params   => {
            Title   => 'Raw',
        },
        FrontendIcon => 'fa fa-user',
        URL          => 'Action=AgentTicketQueue;QueueID=2;View=;Filter=Unlocked',
        Action       => 'AgentTicketQueue',
        TimeStamp    => '2020-04-16 23:59:59',
    );

=cut

sub Get {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $TimeObject    = $Kernel::OM->Get('Kernel::System::Time');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(LastViewsParams RequestedURL Action)) {
        next NEEDED if defined $Param{$Needed};
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in Get!",
        );
        return;
    }

    my $Config    = $ConfigObject->Get('LastViews');
    my $TimeStamp = $TimeObject->CurrentTimestamp();

    my %LastView = (
        Type     => 'UNKNOWN',
        Frontend => 'UNKNOWN',
        Name     => 'UNKNOWN',
        Icon     => 'Question',
    );

    # general frontend
    if ( $Param{Action} =~ m{\A(Admin|Agent|Customer|Public)(.*)} ) {
        $LastView{Type}     = $1;
        $LastView{Frontend} = $1;
        $LastView{Icon}     = $1;
        $LastView{Name}     = $2;
    }

    # general types
    VIEW:
    for my $View (qw(FAQ Customer CustomerUser Statistics Calendar Appointment Preferences)) {
        next VIEW if $Param{Action} !~ m{\A(?:Agent|Customer)$View};

        $LastView{Type} = $View;
        $LastView{Icon} = $View;
    }

    # Ticket Views
    if ( $Param{Action} =~ m{\A(?:Agent|Customer)Ticket(.*)} ) {
        $LastView{Type} = 'Ticket';
        $LastView{Icon} = 'Ticket';
        $LastView{Name} = $1;
    }

    # TicketOverview
    if ( $Param{Action} =~ m{^(?:Agent|Customer)Ticket(Queue|Service|Status|Escalation|Owner|Overview)} ) {
        $LastView{Type} = 'TicketOverview';
        $LastView{Icon} = 'Overview';
        $LastView{Name} = $1;
    }
    if ( $Param{Action} =~ m{^Agent(Dashboard)} ) {
        $LastView{Type} = 'TicketOverview';
        $LastView{Icon} = 'Overview';
        $LastView{Name} = $1;
    }

    # TicketCreate
    if ( $Param{Action} =~ m{\A(?:Agent|Customer)Ticket(Phone|Email|Process)\z} ) {
        $LastView{Type} = 'TicketCreate';
        $LastView{Icon} = $1;
        $LastView{Name} = $1;
    }
    if ( $Param{Action} =~ m{\A(?:Agent|Customer)(TicketMessage)\z} ) {
        $LastView{Type} = 'TicketCreate';
        $LastView{Icon} = 'Ticket';
        $LastView{Name} = $1;
    }

    # replace LastView-parameters for some Modules with more detailed information.
    my $LastViewParams = $Self->_LastViewParameters(
        Param    => \%Param,
        LastView => \%LastView,
    );

    # complete replacement of LastViewsParams, but add Subaction again
    $LastViewParams->{Params}->{'Subaction'} = $Param{LastViewsParams}->{Subaction}
        if defined $Param{LastViewsParams}->{Subaction};
    $Param{LastViewsParams} = $LastViewParams->{Params};

    # overwrite only some special LastView keys
    if ( $LastViewParams && $LastViewParams->{LastView} ) {
        for my $Key ( sort keys %{ $LastViewParams->{LastView} } ) {
            $LastView{$Key} = $LastViewParams->{LastView}->{$Key};
        }
    }

    my %ActionMapping = $Self->GetActionMapping();

    # used if you have a config for this action
    if ( %ActionMapping && $ActionMapping{ $Param{Action} } ) {
        KEY:
        for my $Key ( %{ $ActionMapping{ $Param{Action} } } ) {
            next KEY if !$ActionMapping{ $Param{Action} }->{$Key};

            $LastView{$Key} = $ActionMapping{ $Param{Action} }->{$Key};
        }
    }

    my %IconMap = %{ $Config->{IconMapping} };

    $LastView{Icon} = $IconMap{ $LastView{Icon} };
    my $FrontendIcon = $IconMap{ $LastView{Frontend} };
    my %PopUpActions = $Self->GetPopUpActions();

    %LastView = (
        Type         => $LastView{Type},
        Name         => $LastView{Name},
        Frontend     => $LastView{Frontend},
        Icon         => $LastView{Icon},
        PopUp        => $PopUpActions{ $Param{Action} } || '',
        Params       => $Param{LastViewsParams},
        FrontendIcon => $FrontendIcon,
        URL          => $Param{RequestedURL},
        Action       => $Param{Action},
        TimeStamp    => $TimeStamp,
    );

    return %LastView;
}

=head2 _LastViewParameters()

Returns additional LastView parameters for specific Modules.

    my $LastViewParams = $Self->_LastViewParameters(
        Param    => \%Param,
        LastView => \%LastView,
    );

Returns:

    $LastViewParams = {
        'LastView' => {
            'Name' => 'Znuny says hi!'
        },
        'Params' => {
            'Nummer'   => '2021012710123456',
            'Besitzer' => 'root@localhost'
        }
    };


=cut

sub _LastViewParameters {
    my ( $Self, %Param ) = @_;

    my $MainObject     = $Kernel::OM->Get('Kernel::System::Main');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

    # Overwrite LastView-information for configured Modules.
    my %TypeConfig = (
        'Ticket' => {
            'Module'             => 'Kernel::System::Ticket',
            'Function'           => 'TicketGet',
            'FunctionKey'        => 'TicketID',
            'FunctionReturnType' => 'HASH',
            'AttributeMapping'   => {
                'Title'  => 'Title',
                'Number' => 'TicketNumber',
                'Owner'  => 'Owner',
            },
        },
        'Statistics' => {
            'Module'             => 'Kernel::System::Stats',
            'Function'           => 'StatsGet',
            'FunctionKey'        => 'StatID',
            'ParamKey'           => 'StatID',
            'FunctionReturnType' => 'HASHREF',
            'AttributeMapping'   => {
                'Title'  => 'Title',
                'Number' => 'StatNumber',
            },
        },
    );

    # This config overwrites $TypeConfig for specific actions.
    my %ActionConfig = (

        # Ticket
        'AgentTicketQueue' => {
            'Module'             => 'Kernel::System::Queue',
            'Function'           => 'QueueGet',
            'ParamKey'           => 'QueueID',
            'FunctionKey'        => 'ID',
            'FunctionReturnType' => 'HASH',
            'AttributeMapping'   => {
                'Title' => 'Name',
            },
        },
        'AgentTicketService' => {
            'Module'              => 'Kernel::System::Service',
            'Function'            => 'ServiceGet',
            'FunctionKey'         => 'ServiceID',
            'FunctionReturnType'  => 'HASH',
            'AdditionalParamKeys' => {
                'UserID' => '1',
            },
            'AttributeMapping' => {
                'Title' => 'Name',
            },
        },

        # FAQ
        'AgentFAQZoom' => {
            'Module'              => 'Kernel::System::FAQ',
            'Function'            => 'FAQGet',
            'FunctionKey'         => 'ItemID',
            'FunctionReturnType'  => 'HASH',
            'ParamKey'            => 'ItemID',
            'AdditionalParamKeys' => {
                'UserID' => '1',
            },
            'AttributeMapping' => {
                'Title'    => 'Title',
                'Category' => 'CategoryName',
            },
        },
        'AgentFAQCategory' => {
            'Module'              => 'Kernel::System::FAQ',
            'Function'            => 'CategoryGet',
            'FunctionKey'         => 'CategoryID',
            'FunctionReturnType'  => 'HASH',
            'ParamKey'            => 'CategoryID',
            'AdditionalParamKeys' => {
                'UserID' => '1',
            },
            'AttributeMapping' => {
                'Title'   => 'Name',
                'Comment' => 'Comment',
            },
        },

        # Calendar
        'AdminAppointmentCalendarManage' => {
            'Module'             => 'Kernel::System::Calendar',
            'Function'           => 'CalendarGet',
            'FunctionKey'        => 'CalendarID',
            'FunctionReturnType' => 'HASH',
            'AttributeMapping'   => {
                'Title' => 'CalendarName',
            },
        },

        # Customers
        'AdminCustomerCompany' => {
            'Module'             => 'Kernel::System::CustomerCompany',
            'Function'           => 'CustomerCompanyGet',
            'FunctionKey'        => 'CustomerID',
            'FunctionReturnType' => 'HASH',
            'AttributeMapping'   => {
                'Title'      => 'CustomerCompanyName',
                'CustomerID' => 'CustomerID',
            },
        },
        'AdminCustomerUser' => {
            'Module'             => 'Kernel::System::CustomerUser',
            'Function'           => 'CustomerName',
            'FunctionKey'        => 'UserLogin',
            'ParamKey'           => 'ID',
            'FunctionReturnType' => 'STRING',
            'AttributeMapping'   => {
                'Title' => 'Name',
            },
        },
        'AgentCustomerUserInformationCenter' => {
            'Module'             => 'Kernel::System::CustomerUser',
            'Function'           => 'CustomerName',
            'FunctionKey'        => 'UserLogin',
            'ParamKey'           => 'CustomerUserID',
            'FunctionReturnType' => 'STRING',
            'AttributeMapping'   => {
                'Title' => 'Name',
            },
        },
    );

    my %LastViewParams;
    my $Action       = $Param{Param}->{LastViewsParams}->{Action};
    my $LastViewType = $Param{LastView}->{Type};
    my $TitleLength  = 42;

    return {} if !$Action;

    # this is a special handling for AdminSystemConfiguration
    if ( $Action eq "AdminSystemConfiguration" || $Action eq "AdminSystemConfigurationGroup" ) {
        my $Title;
        if ( $Action eq "AdminSystemConfigurationGroup" && defined $Param{Param}->{LastViewsParams}->{RootNavigation} )
        {
            $Title = substr( $Param{Param}->{LastViewsParams}->{RootNavigation}, 0, $TitleLength );
            $Title .= " ..." if $Param{Param}->{LastViewsParams}->{RootNavigation} ne $Title;
        }
        if ( $Action eq "AdminSystemConfiguration" && defined $Param{Param}->{LastViewsParams}->{Setting} ) {
            $Title = substr( $Param{Param}->{LastViewsParams}->{Setting}, 0, $TitleLength );
            $Title .= " ..." if $Param{Param}->{LastViewsParams}->{Setting} ne $Title;
        }

        $LastViewParams{LastView}->{Name} = $Title;
        return \%LastViewParams;
    }

    my %Config = %TypeConfig;
    if ( $ActionConfig{$Action} ) {
        %Config       = %ActionConfig;
        $LastViewType = $Action;
    }

    my $ModuleName         = $Config{$LastViewType}->{Module};
    my $Function           = $Config{$LastViewType}->{Function};
    my $FunctionKey        = $Config{$LastViewType}->{FunctionKey};
    my $FunctionReturnType = $Config{$LastViewType}->{FunctionReturnType};

    return {} if !$LastViewType;
    return {} if !$Config{$LastViewType};
    return {} if !$FunctionReturnType;
    return {} if !$FunctionKey;

    return {} if !$MainObject->Require( $ModuleName, Silent => 1 );
    my $Module = $Kernel::OM->Get($ModuleName);

    return {} if !$Module->can($Function);

    # In the most cases FunctionKey == ParamKey, but if not, use configured ParamKey.
    my $ParamKey = $Config{$LastViewType}->{ParamKey} || $Config{$LastViewType}->{FunctionKey};
    return {} if !$ParamKey;

    my $ParamValue = $Param{Param}->{LastViewsParams}->{$ParamKey};
    return {} if !$ParamValue;

    my %AdditionalParams = %{ $Config{$LastViewType}->{AdditionalParamKeys} || {} };

    if ( $FunctionReturnType eq "HASHREF" ) {
        my $Data = $Module->$Function(
            $FunctionKey => $ParamValue,
            %AdditionalParams,
        );
        return {} if !$Data;

        for my $Attribute ( sort keys %{ $Config{$LastViewType}->{AttributeMapping} } ) {
            my $Key = $Config{$LastViewType}->{AttributeMapping}->{$Attribute};

            # Show 'Title' only as the Title of the LastView and not again in Params-list.
            if ( $Attribute eq "Title" ) {
                my $Title = substr( $Data->{$Key}, 0, $TitleLength );
                $Title .= " ..." if $Data->{$Key} ne $Title;
                $LastViewParams{LastView}->{Name} = $Title;
            }
            else {
                $Attribute = $LanguageObject->Translate($Attribute);
                $LastViewParams{Params}->{$Attribute} = $Data->{$Key};
            }
        }
    }

    if ( $FunctionReturnType eq "HASH" ) {
        my %Data = $Module->$Function(
            $FunctionKey => $ParamValue,
            %AdditionalParams,
        );
        return {} if !%Data;

        for my $Attribute ( sort keys %{ $Config{$LastViewType}->{AttributeMapping} } ) {
            my $Key = $Config{$LastViewType}->{AttributeMapping}->{$Attribute};

            # Show 'Title' only as the Title of the LastView and not again in Params-list.
            if ( $Attribute eq "Title" ) {
                my $Title = substr( $Data{$Key}, 0, $TitleLength );
                $Title .= " ..." if $Data{$Key} ne $Title;
                $LastViewParams{LastView}->{Name} = $Title;
            }
            else {
                $Attribute = $LanguageObject->Translate($Attribute);
                $LastViewParams{Params}->{$Attribute} = $Data{$Key};
            }
        }
    }

    if ( $FunctionReturnType eq "STRING" ) {
        my $Data = $Module->$Function(
            $FunctionKey => $ParamValue,
            %AdditionalParams,
        );
        return {} if !$Data;

        for my $Attribute ( sort keys %{ $Config{$LastViewType}->{AttributeMapping} } ) {
            my $Key = $Config{$LastViewType}->{AttributeMapping}->{$Attribute};

            # Show 'Title' only as the Title of the LastView and not again in Params-list.
            if ( $Attribute eq "Title" ) {
                my $Title = substr( $Data, 0, $TitleLength );
                $Title .= " ..." if $Data ne $Title;
                $LastViewParams{LastView}->{Name} = $Title;
            }
            else {
                $Attribute = $LanguageObject->Translate($Attribute);
                $LastViewParams{Params}->{$Attribute} = $Data;
            }
        }
    }

    return \%LastViewParams;
}

=head2 GetList()

Returns a list of all last views from session

    my @LastViews = $LastViewsObject->GetList(
        SessionID => 123,
        Types     => ['Ticket', 'Admin'],   # optional
    );

Returns:

    my @LastViews = 1;

=cut

sub GetList {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    NEEDED:
    for my $Needed (qw(SessionID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in GetList!",
        );
        return;
    }

    my %Data = $SessionObject->GetSessionIDData(
        SessionID => $Param{SessionID},
    );

    my $SessionKey = $Param{SessionKey} || $Self->{SessionKey};
    return if !$Data{$SessionKey};

    my @LastViews = @{ $Data{$SessionKey} };
    return @LastViews if !$Param{Types};

    my @LastViewsTemp;
    LASTVIEW:
    for my $LastView (@LastViews) {
        next LASTVIEW if !$LastView->{Type};

        my $TypeExists = grep { $LastView->{Type} eq $_ } @{ $Param{Types} };
        next LASTVIEW if !$TypeExists;

        push @LastViewsTemp, $LastView;
    }

    @LastViews = @LastViewsTemp;

    return @LastViews;
}

=head2 GetActionMapping()

returns action mappings.

    my %ActionMapping = $LastViewsObject->GetActionMapping();

Returns:

    my %ActionMapping = (
        AgentTicketPhone => {
            Type     => 'TicketCreate',
            Frontend => 'Agent',
            Icon     => 'Phone',
            Name     => 'Phone',
        },
    );

=cut

sub GetActionMapping {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Config = $ConfigObject->Get('LastViews');

    my %ActionMapping;

    my %Registration = %{ $Config->{ActionMapping} };
    for my $ActionMapping ( sort keys %Registration ) {
        %ActionMapping = (
            %ActionMapping,
            %{ $Registration{$ActionMapping} },
        );
    }
    return %ActionMapping;
}

=head2 GetPopUpActions()

returns all popup actions.

    my %PopUpActions = $LastViewsObject->GetPopUpActions();

Returns:

    my %PopUpActions = (
        'AgentTicketMerge'    => 'TicketAction',
        'AgentTicketCustomer' => 'TicketAction',
        'AgentTicketPriority' => 'TicketAction',
        'AgentTicketNote'     => 'TicketAction',
        'AgentLinkObject'     => 'TicketAction',
    );

=cut

sub GetPopUpActions {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my %PopUpActions;

    my %MenuModules;
    $MenuModules{MenuModules}    = $ConfigObject->Get('Ticket::Frontend::MenuModule');
    $MenuModules{PreMenuModules} = $ConfigObject->Get('Ticket::Frontend::PreMenuModule');

    for my $Type ( sort keys %MenuModules ) {
        MODULE:
        for my $Module ( sort keys %{ $MenuModules{$Type} } ) {
            my $MenuModule = $MenuModules{$Type}->{$Module};
            next MODULE if !$MenuModule->{PopupType};

            $PopUpActions{ $MenuModule->{Action} } = $MenuModule->{PopupType};
        }
    }

    return %PopUpActions;
}

=head2 GetActionIgnore()

returns all actions to skip.

    my @ActionIgnore = $LastViewsObject->GetActionIgnore();

Returns:

    my @ActionIgnore = (
        'AgentTicketArticleContent'
    );

=cut

sub GetActionIgnore {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Config = $ConfigObject->Get('LastViews');

    my @ActionIgnore = @{ $Self->{ActionIgnore} };
    return @ActionIgnore if !IsHashRefWithData( $Config->{ActionIgnore} );

    my %Registration = %{ $Config->{ActionIgnore} };
    for my $ActionIgnore ( sort keys %Registration ) {
        push @ActionIgnore, @{ $Registration{$ActionIgnore} };
    }

    my %ActionIgnore = map { $_ => $_ } @ActionIgnore;
    @ActionIgnore = sort keys %ActionIgnore;

    return @ActionIgnore;
}

=head2 GetSubactionIgnore()

returns all sub-actions to skip.

    my @SubactionIgnore = $LastViewsObject->GetSubactionIgnore();

Returns:

    my @SubactionIgnore = (
        'AgentTicketArticleContent'
    );

=cut

sub GetSubactionIgnore {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $Config       = $ConfigObject->Get('LastViews');

    my @SubactionIgnore = @{ $Self->{SubactionIgnore} };
    return @SubactionIgnore if !IsHashRefWithData( $Config->{SubactionIgnore} );

    my %Registration = %{ $Config->{SubactionIgnore} };
    for my $SubactionIgnore ( sort keys %Registration ) {
        push @SubactionIgnore, @{ $Registration{$SubactionIgnore} };
    }

    my %SubactionIgnore = map { $_ => $_ } @SubactionIgnore;
    @SubactionIgnore = sort keys %SubactionIgnore;

    return @SubactionIgnore;
}

=head2 Update()

Updates the last view list - added latest view to list.

    my $Success = $LastViewsObject->Update(
        SessionID => $Self->{SessionID},
        Request   => \%Request,
    );

Returns:

    my $Success = 1;

=cut

sub Update {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');
    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(SessionID Request)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in Update!",
        );
        return;
    }

    my $IsValidRequest = $Self->IsValidRequest(
        %{ $Param{Request} },
    );
    return if !$IsValidRequest;

    $Self->Delete(
        SessionID => $Param{SessionID},
        Count     => 20,
    );

    my @LastViews = $Self->GetList(
        SessionID => $Param{SessionID},
    );

    my %LastView = $Self->Get(
        %{ $Param{Request} },
    );
    return 1 if !%LastView;

    if (@LastViews) {
        my %TestData1 = %LastView;
        my %TestData2 = %{ $LastViews[-1] };

        delete $TestData1{TimeStamp};
        delete $TestData2{TimeStamp};

        my $DataIsDifferent = DataIsDifferent(
            Data1 => \%TestData1,
            Data2 => \%TestData2,
        );

        return 1 if !$DataIsDifferent;
    }

    push @LastViews, ( \%LastView );

    my $SessionKey = $Param{SessionKey} || $Self->{SessionKey};
    $SessionObject->UpdateSessionID(
        SessionID => $Param{SessionID},
        Key       => $SessionKey,
        Value     => \@LastViews,
    );

    return 1 if !$Param{Request}->{RequestedURL};

    # store last screen
    $SessionObject->UpdateSessionID(
        SessionID => $Param{SessionID},
        Key       => 'LastScreenView',
        Value     => $Param{Request}->{RequestedURL},
    );

    return 1;
}

=head2 Delete()

Deletes the last view list.

    my $Success = $LastViewsObject->Delete(
        SessionID => $Param{SessionID},
        Count     => 20,                    # option - deletes all views but the latest n
    );

Returns:

    my $Success = 1;

=cut

sub Delete {
    my ( $Self, %Param ) = @_;

    my $SessionObject = $Kernel::OM->Get('Kernel::System::AuthSession');

    my @LastViews;
    if ( $Param{Count} ) {
        @LastViews = $Self->GetList(
            SessionID => $Param{SessionID},
        );
        my $LastViewsCount = scalar @LastViews;
        if ( $LastViewsCount && $LastViewsCount >= $Param{Count} ) {
            @LastViews = splice @LastViews, -$Param{Count};
        }
    }

    my $SessionKey = $Param{SessionKey} // $Self->{SessionKey};
    $SessionObject->UpdateSessionID(
        SessionID => $Param{SessionID},
        Key       => $SessionKey,
        Value     => \@LastViews,
    );

    return 1;
}

=head2 IsValidRequest()

Checks if request is valid.
Request is valid if
    - RequestedURL has an Action
    - LastScreenView is not equal to RequestedURL
    - Action is not one of 'ActionIgnore'
    - Subaction is not one of 'SubactionIgnore'


    my $IsValidRequest = $LastViewsObject->IsValidRequest(
        %Request
    );

Returns:

    my $IsValidRequest = 1;

=cut

sub IsValidRequest {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Action SessionID RequestedURL)) {
        next NEEDED if defined $Param{$Needed};
        return 0;
    }

    return 0 if $Param{LastScreenView} && $Param{LastScreenView} eq $Param{RequestedURL};
    return 0 if $Param{RequestedURL} !~ m{^Action=.+}smx;

    my @ActionIgnore = $Self->GetActionIgnore();

    my $IsIgnoreAction = grep { $Param{Action} eq $_ } @ActionIgnore;
    return 0 if $IsIgnoreAction;

    if ( $Param{Subaction} ) {
        my @SubactionIgnore   = $Self->GetSubactionIgnore();
        my $IsIgnoreSubaction = grep { $Param{Subaction} eq $_ } @SubactionIgnore;
        return 0 if $IsIgnoreSubaction;
    }

    return 1;
}

1;
