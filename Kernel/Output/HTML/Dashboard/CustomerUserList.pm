# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::Dashboard::CustomerUserList;

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use parent qw(Kernel::Output::HTML::Dashboard::Base);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    # get needed parameters
    for my $Needed (qw(Config Name UserID)) {
        die "Got no $Needed!" if ( !$Self->{$Needed} );
    }

    # get param object
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    # get current filter
    my $Name           = $ParamObject->GetParam( Param => 'Name' ) || '';
    my $PreferencesKey = 'UserDashboardCustomerUserListFilter' . $Self->{Name};

    $Self->{PrefKey} = 'UserDashboardPref' . $Self->{Name} . '-Shown';

    $Self->{PageShown} = $Param{PageShown} || $Kernel::OM->Get('Kernel::Output::HTML::Layout')->{ $Self->{PrefKey} }
        || $Self->{Config}->{Limit};

    $Self->{StartHit} = int( $ParamObject->GetParam( Param => 'StartHit' ) || 1 );

    return $Self;
}

sub Preferences {
    my ( $Self, %Param ) = @_;

    my @Params = (
        {
            Desc  => Translatable('Shown customer users'),
            Name  => $Self->{PrefKey},
            Block => 'Option',

            #            Block => 'Input',
            Data => {
                5  => ' 5',
                10 => '10',
                15 => '15',
                20 => '20',
                25 => '25',
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

        # remember, do not allow to use page cache
        # (it's not working because of internal filter)
        CacheTTL => undef,
        CacheKey => undef,
    );
}

=head2 Header()

Returns additional header content of dashboard (HTML).

    my $Header = $Object->Header();

Returns:

    my $Header = 1;

=cut

sub Header {
    my ( $Self, %Param ) = @_;

    my $LayoutObject       = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    $LayoutObject->Block(
        Name => 'HeaderCustomerUserList',
        Data => {
            %Param,
        },
    );

    # show change customer relations button if the agent has permission
    my $ChangeCustomerReleationsAccess = $LayoutObject->Permission(
        Action => 'AdminCustomerUserCustomer',
        Type   => 'rw',
    );

    if ($ChangeCustomerReleationsAccess) {
        $LayoutObject->Block(
            Name => 'ContentLargeCustomerIDAdd',
            Data => {
                CustomerID => $Param{CustomerID},
            },
        );
    }

    # Show add new customer button if:
    #   - The agent has permission to use the module
    #   - There are writable customer backends
    my $HasAdminCustomerUserPermission = $Self->_HasAdminCustomerUserPermission();

    # Get writable data sources.
    my %CustomerSources = $CustomerUserObject->CustomerSourceList(
        ReadOnly => 0,
    );

    if ( $HasAdminCustomerUserPermission && %CustomerSources ) {
        $LayoutObject->Block(
            Name => 'ContentLargeCustomerUserAdd',
            Data => {
                CustomerID => $Self->{CustomerID},
            },
        );
    }

    my $Header = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardCustomerUserList',
        Data         => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
        },
        AJAX => $Param{AJAX},
    );

    return $Header;
}

sub Run {
    my ( $Self, %Param ) = @_;

    return if !$Param{CustomerID};

    # get customer user object
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

    my $CustomerIDs = { $CustomerUserObject->CustomerSearch( CustomerIDRaw => $Param{CustomerID} ) };

    # if we are using multiple CustomerIDs for a CustomerUser, we have to expand our CustomerIDs variable
    my @CustomerUserIDs = $CustomerUserObject->CustomerUserCustomerMemberList(
        CustomerID => $Param{CustomerID},
    );

    CUSTOMERUSERID:
    for my $CustomerUserID (@CustomerUserIDs) {
        my %CustomerUserList = $CustomerUserObject->CustomerSearch( UserLogin => $CustomerUserID );
        next CUSTOMERUSERID if !%CustomerUserList;
        $CustomerIDs = { %$CustomerIDs, %CustomerUserList };
    }

    # add page nav bar
    my $Total = scalar keys %{$CustomerIDs};

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $HasAdminCustomerUserPermission = $Self->_HasAdminCustomerUserPermission();

    $LayoutObject->Block(
        Name => 'ContentCustomerUserList',
        Data => {
            %Param,
            HasAdminCustomerUserPermission => $HasAdminCustomerUserPermission,
        },
    );

    my $LinkPage = 'Subaction=Element;Name='
        . $Self->{Name} . ';'
        . 'CustomerID='
        . $LayoutObject->LinkEncode( $Param{CustomerID} ) . ';';

    my %PageNav = $LayoutObject->PageNavBar(
        StartHit    => $Self->{StartHit},
        PageShown   => $Self->{PageShown},
        AllHits     => $Total || 1,
        Action      => 'Action=' . $LayoutObject->{Action},
        Link        => $LinkPage,
        AJAXReplace => 'Dashboard' . $Self->{Name},
        IDPrefix    => 'Dashboard' . $Self->{Name},
        AJAX        => $Param{AJAX},
    );

    $LayoutObject->Block(
        Name => 'ContentLargeCustomerUserListNavBar',
        Data => {
            %{ $Self->{Config} },
            Name => $Self->{Name},
            %PageNav,
        },
    );

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check the permission for the SwitchToCustomer feature
    if ( $ConfigObject->Get('SwitchToCustomer') ) {

        # get group object
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        # get the group id which is allowed to use the switch to customer feature
        my $SwitchToCustomerGroupID = $GroupObject->GroupLookup(
            Group => $ConfigObject->Get('SwitchToCustomer::PermissionGroup'),
        );

        # get user groups, where the user has the rw privilege
        my %Groups = $GroupObject->PermissionUserGet(
            UserID => $Self->{UserID},
            Type   => 'rw',
        );

        # if the user is a member in this group he can access the feature
        if ( $Groups{$SwitchToCustomerGroupID} ) {

            $Self->{SwitchToCustomerPermission} = 1;

            $LayoutObject->Block(
                Name => 'OverviewResultSwitchToCustomer',
            );
        }
    }

    # get the permission for the phone ticket creation
    my $NewAgentTicketPhonePermission = $LayoutObject->Permission(
        Action => 'AgentTicketPhone',
        Type   => 'rw',
    );

    # check the permission for the phone ticket creation
    if ($NewAgentTicketPhonePermission) {
        $LayoutObject->Block(
            Name => 'OverviewResultNewAgentTicketPhone',
        );
    }

    # get the permission for the email ticket creation
    my $NewAgentTicketEmailPermission = $LayoutObject->Permission(
        Action => 'AgentTicketEmail',
        Type   => 'rw',
    );

    # check the permission for the email ticket creation
    if ($NewAgentTicketEmailPermission) {
        $LayoutObject->Block(
            Name => 'OverviewResultNewAgentTicketEmail',
        );
    }

    my @CustomerKeys = sort { lc( $CustomerIDs->{$a} ) cmp lc( $CustomerIDs->{$b} ) } keys %{$CustomerIDs};
    @CustomerKeys = splice @CustomerKeys, $Self->{StartHit} - 1, $Self->{PageShown};

    for my $CustomerKey (@CustomerKeys) {
        $LayoutObject->Block(
            Name => 'ContentLargeCustomerUserListRow',
            Data => {
                %Param,
                HasAdminCustomerUserPermission => $HasAdminCustomerUserPermission,
                CustomerKey                    => $CustomerKey,
                CustomerListEntry              => $CustomerIDs->{$CustomerKey},
            },
        );

        # get ticket object
        my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

        my $TicketCountOpen = $TicketObject->TicketSearch(
            StateType            => 'Open',
            CustomerUserLoginRaw => $CustomerKey,
            Result               => 'COUNT',
            Permission           => $Self->{Config}->{Permission},
            UserID               => $Self->{UserID},
            CacheTTL             => $Self->{Config}->{CacheTTLLocal} * 60,
        ) || 0;

        my $CustomerKeySQL = $Kernel::OM->Get('Kernel::System::DB')->QueryStringEscape( QueryString => $CustomerKey );

        $LayoutObject->Block(
            Name => 'ContentLargeCustomerUserListRowCustomerUserTicketsOpen',
            Data => {
                %Param,
                Count          => $TicketCountOpen,
                CustomerKey    => $CustomerKey,
                CustomerKeySQL => $CustomerKeySQL,
            },
        );

        my $TicketCountClosed = $TicketObject->TicketSearch(
            StateType            => 'Closed',
            CustomerUserLoginRaw => $CustomerKey,
            Result               => 'COUNT',
            Permission           => $Self->{Config}->{Permission},
            UserID               => $Self->{UserID},
            CacheTTL             => $Self->{Config}->{CacheTTLLocal} * 60,
        ) || 0;

        $LayoutObject->Block(
            Name => 'ContentLargeCustomerUserListRowCustomerUserTicketsClosed',
            Data => {
                %Param,
                Count          => $TicketCountClosed,
                CustomerKey    => $CustomerKey,
                CustomerKeySQL => $CustomerKeySQL,
            },
        );

        # check the permission for the phone ticket creation
        if ($NewAgentTicketPhonePermission) {
            $LayoutObject->Block(
                Name => 'ContentLargeCustomerUserListNewAgentTicketPhone',
                Data => {
                    %Param,
                    CustomerKey       => $CustomerKey,
                    CustomerListEntry => $CustomerIDs->{$CustomerKey},
                },
            );
        }

        # check the permission for the email ticket creation
        if ($NewAgentTicketEmailPermission) {
            $LayoutObject->Block(
                Name => 'ContentLargeCustomerUserListNewAgentTicketEmail',
                Data => {
                    %Param,
                    CustomerKey       => $CustomerKey,
                    CustomerListEntry => $CustomerIDs->{$CustomerKey},
                },
            );
        }

        if ($HasAdminCustomerUserPermission)
        {
            $LayoutObject->Block(
                Name => 'OverviewResultEditCustomer',
                Data => {
                    %Param,
                },
            );
        }

        if ( $ConfigObject->Get('SwitchToCustomer') && $Self->{SwitchToCustomerPermission} )
        {
            $LayoutObject->Block(
                Name => 'OverviewResultRowSwitchToCustomer',
                Data => {
                    %Param,
                    Count       => $TicketCountClosed,
                    CustomerKey => $CustomerKey,
                },
            );
        }
    }

    # show "none" if there are no customers
    if ( !%{$CustomerIDs} ) {
        $LayoutObject->Block(
            Name => 'ContentLargeCustomerUserListNone',
            Data => {},
        );
    }

    # check for refresh time
    my $Refresh = '';
    if ( $Self->{UserRefreshTime} ) {
        $Refresh = 60 * $Self->{UserRefreshTime};
        my $NameHTML = $Self->{Name};
        $NameHTML =~ s{-}{_}xmsg;

        # send data to JS
        $LayoutObject->AddJSData(
            Key   => 'CustomerUserListRefresh',
            Value => {
                %{ $Self->{Config} },
                Name        => $Self->{Name},
                NameHTML    => $NameHTML,
                RefreshTime => $Refresh,
                CustomerID  => $Param{CustomerID},
            },
        );
    }

    my $Content = $LayoutObject->Output(
        TemplateFile => 'AgentDashboardCustomerUserList',
        Data         => {
            %{ $Self->{Config} },
            HasAdminCustomerUserPermission => $HasAdminCustomerUserPermission,
            Name                           => $Self->{Name},
        },
        AJAX => $Param{AJAX},
    );

    return $Content;
}

sub _HasAdminCustomerUserPermission {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    for my $PermissionType (qw(ro rw)) {
        my $HasPermission = $LayoutObject->Permission(
            Action => 'AdminCustomerUser',
            Type   => 'rw',
        );
        return 1 if $HasPermission;
    }

    return;
}

1;
