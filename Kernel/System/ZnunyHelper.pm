# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::ZnunyHelper;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::CustomerUser',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::GenericAgent',
    'Kernel::System::GenericInterface::Webservice',
    'Kernel::System::Group',
    'Kernel::System::ITSMConfigItem',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::NotificationEvent',
    'Kernel::System::Package',
    'Kernel::System::PostMaster::Filter',
    'Kernel::System::Priority',
    'Kernel::System::ProcessManagement::DB::Entity',
    'Kernel::System::ProcessManagement::DB::Process',
    'Kernel::System::Queue',
    'Kernel::System::SLA',
    'Kernel::System::Service',
    'Kernel::System::StandardTemplate',
    'Kernel::System::State',
    'Kernel::System::Storable',
    'Kernel::System::SysConfig',
    'Kernel::System::Type',
    'Kernel::System::User',
    'Kernel::System::Valid',
    'Kernel::System::YAML',
);

=head1 NAME

Kernel::System::ZnunyHelper

=head1 DESCRIPTION

All ZnunyHelper functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = \%Param;
    bless( $Self, $Type );

    return $Self;
}

=head2 _ItemReverseListGet()

checks if a item (for example a service name) is in a reverse item list (for example reverse %ServiceList)
with case sensitive check

    my $ItemID = $ZnunyHelperObject->_ItemReverseListGet($ServiceName, %ServiceListReverse);

Returns:

    my $ItemID = 123;

=cut

sub _ItemReverseListGet {
    my ( $Self, $ItemName, %ItemListReverse ) = @_;

    return if !$ItemName;

    $ItemName =~ s{\A\s*}{}g;
    $ItemName =~ s{\s*\z}{}g;

    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    my $ItemID;
    if ( $DBObject->{Backend}->{'DB::CaseSensitive'} ) {
        $ItemID = $ItemListReverse{$ItemName};
    }
    else {
        my %ItemListReverseLC = map { lc $_ => $ItemListReverse{$_} } keys %ItemListReverse;

        $ItemID = $ItemListReverseLC{ lc $ItemName };
    }

    return $ItemID;
}

=head2 _PostmasterXHeaderAdd()

This function adds a Postmaster X-Header to the list of Postmaster X-Headers to the SysConfig.

    my $Success = $ZnunyHelperObject->_PostmasterXHeaderAdd(
        Header => 'X-OTRS-OwnHeader'
    );

    or

    my $Success = $ZnunyHelperObject->_PostmasterXHeaderAdd(
        Header => [
            'X-OTRS-OwnHeader',
            'AnotherHeader',
        ]
    );

=cut

sub _PostmasterXHeaderAdd {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Header)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @HeadersToAdd;
    if ( IsArrayRefWithData( $Param{Header} ) ) {
        @HeadersToAdd = @{ $Param{Header} };
    }
    elsif ( IsStringWithData( $Param{Header} ) ) {
        push @HeadersToAdd, $Param{Header};
    }
    else {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Header' should be an ArrayRef of String with data!",
        );
        return;
    }

    my $ConfiguredHeaders = $ConfigObject->Get('PostmasterX-Header');
    return if ref $ConfiguredHeaders ne 'ARRAY';

    my %ConfiguredHeaders = map { $_ => 1 } @{$ConfiguredHeaders};

    HEADER:
    for my $HeaderToAdd (@HeadersToAdd) {
        $ConfiguredHeaders{$HeaderToAdd} = 1;
    }

    return $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => 'PostmasterX-Header',
                IsValid        => 1,
                EffectiveValue => [ sort keys %ConfiguredHeaders ],
            },
        ],
        UserID => 1,
    );
}

=head2 _PostmasterXHeaderRemove()

This function removes a Postmaster X-Header from the list of Postmaster X-Headers in the SysConfig.

    my $Success = $ZnunyHelperObject->_PostmasterXHeaderRemove(
        Header => 'X-OTRS-OwnHeader'
    );

    or

    my $Success = $ZnunyHelperObject->_PostmasterXHeaderRemove(
        Header => [
            'X-OTRS-OwnHeader',
            'AnotherHeader',
        ]
    );

=cut

sub _PostmasterXHeaderRemove {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Header)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @HeadersToRemove;
    if ( IsArrayRefWithData( $Param{Header} ) ) {
        @HeadersToRemove = @{ $Param{Header} };
    }
    elsif ( IsStringWithData( $Param{Header} ) ) {
        push @HeadersToRemove, $Param{Header};
    }
    else {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Header' should be an ArrayRef of String with data!",
        );
        return;
    }

    my $ConfiguredHeaders = $ConfigObject->Get('PostmasterX-Header');
    return if ref $ConfiguredHeaders ne 'ARRAY';

    my %ConfiguredHeaders = map { $_ => 1 } @{$ConfiguredHeaders};

    HEADER:
    for my $HeaderToRemove (@HeadersToRemove) {
        delete $ConfiguredHeaders{$HeaderToRemove};
    }

    return $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => 'PostmasterX-Header',
                IsValid        => 1,
                EffectiveValue => [ sort keys %ConfiguredHeaders ],
            },
        ],
        UserID => 1,
    );
}

=head2 _EventAdd()

This function adds an Event to the list of Events of an Object to the SysConfig.

    my $Success = $ZnunyHelperObject->_EventAdd(
        Object => 'Ticket', # Ticket, Article, Queue...
        Event  => 'MyCustomEvent'
    );

    or

    my $Success = $ZnunyHelperObject->_EventAdd(
        Object => 'Ticket',
        Event  => [
            'MyCustomEvent',
            'AnotherCustomEvent',
        ]
    );

=cut

sub _EventAdd {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Object Event)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @AddEvents;
    if ( IsArrayRefWithData( $Param{Event} ) ) {
        @AddEvents = @{ $Param{Event} };
    }
    elsif ( IsStringWithData( $Param{Event} ) ) {
        push @AddEvents, $Param{Event};
    }
    else {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Event' should be an ArrayRef of String with data!",
        );
        return;
    }

    my $Events = $ConfigObject->Get('Events');

    return if !IsHashRefWithData($Events);

    $Events->{ $Param{Object} } ||= [];

    my @ConfigEvents = @{ $Events->{ $Param{Object} } };

    EVENT:
    for my $AddEvent (@AddEvents) {
        next EVENT if grep { $AddEvent eq $_ } @ConfigEvents;
        push @ConfigEvents, $AddEvent;
    }

    return $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => 'Events###' . $Param{Object},
                IsValid        => 1,
                EffectiveValue => \@ConfigEvents,
            },
        ],
        UserID => 1,
    );
}

=head2 _EventRemove()

This function removes an Event to the list of Events of an Object to the SysConfig.

    my $Success = $ZnunyHelperObject->_EventRemove(
        Object => 'Ticket', # Ticket, Article, Queue...
        Event  => 'MyCustomEvent'
    );

    or

    my $Success = $ZnunyHelperObject->_EventRemove(
        Object => 'Ticket',
        Event  => [
            'MyCustomEvent',
            'AnotherCustomEvent',
        ]
    );

=cut

sub _EventRemove {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Object Event)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @RemoveEvents;
    if ( IsArrayRefWithData( $Param{Event} ) ) {
        @RemoveEvents = @{ $Param{Event} };
    }
    elsif ( IsStringWithData( $Param{Event} ) ) {
        push @RemoveEvents, $Param{Event};
    }
    else {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Event' should be an ArrayRef of String with data!",
        );
        return;
    }

    my $Events = $ConfigObject->Get('Events');

    return if !IsHashRefWithData($Events);

    $Events->{ $Param{Object} } ||= [];

    my @ConfigEvents;
    EVENT:
    for my $CurrentEvent ( @{ $Events->{ $Param{Object} } } ) {
        next EVENT if grep { $CurrentEvent eq $_ } @RemoveEvents;
        push @ConfigEvents, $CurrentEvent;
    }

    return $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => 'Events###' . $Param{Object},
                IsValid        => 1,
                EffectiveValue => \@ConfigEvents,
            },
        ],
        UserID => 1,
    );
}

=head2 _ValidDynamicFieldScreenListGet()

Returns a list of valid screens for dynamic fields.

    my $ValidDynamicFieldScreenList = $ZnunyHelperObject->_ValidDynamicFieldScreenListGet(
        Result => 'ARRAY', # HASH or ARRAY, defaults to ARRAY
    );

Returns as HASH:

    my $ValidDynamicFieldScreenList = {
        'DynamicFieldScreens' => {
           'Ticket::Frontend::AgentTicketZoom###DynamicField' => 'AgentTicketZoom',
           'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField' => 'ProcessWidgetDynamicField'
           [...]
        },
        'DefaultColumnsScreens' => {
            'DashboardBackend###0110-TicketEscalation' => 'DashboardWidget TicketEscalation',
            'DashboardBackend###0130-TicketOpen' => 'DashboardWidget TicketOpen',
            [...]
        }
    };

Returns as ARRAY:

    my $ValidDynamicFieldScreenList = {
        'DynamicFieldScreens' => [
           'Ticket::Frontend::AgentTicketZoom###DynamicField',
           'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicField',
           [...]
        ],
        'DefaultColumnsScreens' => [
            'DashboardBackend###0110-TicketEscalation',
            'DashboardBackend###0130-TicketOpen',
            [...]
        ]
    };

=cut

sub _ValidDynamicFieldScreenListGet {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    $Param{Result} = lc( $Param{Result} // 'array' );

    my $ValidScreens;
    SCREEN:
    for my $Screen (qw(DynamicFieldScreens DefaultColumnsScreens)) {

        $ValidScreens->{$Screen} = {};
        my $ScreenRegistrations = $ConfigObject->Get($Screen);

        REGISTRATION:
        for my $Registration ( sort keys %{$ScreenRegistrations} ) {
            if ( $Registration =~ m{^ITSM.*}xmsi ) {
                my $IsInstalled = $PackageObject->PackageIsInstalled(
                    Name => $Registration,
                );
                next REGISTRATION if !$IsInstalled;
            }

            %{ $ValidScreens->{$Screen} } = (
                %{ $ValidScreens->{$Screen} },
                %{ $ScreenRegistrations->{$Registration} },
            );
        }

        # check if config is already valid / defined
        for my $CurrentConfig ( sort keys %{ $ValidScreens->{$Screen} } ) {
            my ( $ConfigPath, $Key ) = split '###', $CurrentConfig;
            my $ConfigData = $ConfigObject->Get($ConfigPath);

            delete $ValidScreens->{$Screen}->{$CurrentConfig} if !defined $ConfigData->{$Key};
        }

        next SCREEN if lc $Param{Result} ne 'array';

        my @Array = sort keys %{ $ValidScreens->{$Screen} };
        $ValidScreens->{$Screen} = \@Array;
    }

    return $ValidScreens;
}

=head2 _DefaultColumnsGet()

This function returns the DefaultColumn Attributes of the requested SysConfigs.

    my @Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns',
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns',
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns',
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns',
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns',
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns',
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns',
        'Ticket::Frontend::AgentTicketService###DefaultColumns',

        # substructure of DefaultColumns
        'DashboardBackend###0100-TicketPendingReminder',
        'DashboardBackend###0110-TicketEscalation',
        'DashboardBackend###0120-TicketNew',
        'DashboardBackend###0130-TicketOpen',

        # substructure of DefaultColumns
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder',
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation',
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew',
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen',
    );

    my %Configs = $ZnunyHelperObject->_DefaultColumnsGet(@Configs);

Returns:

    my %Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
        'DashboardBackend###0100-TicketPendingReminder' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
    );

=cut

sub _DefaultColumnsGet {
    my ( $Self, @ScreenConfig ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    return 1 if !@ScreenConfig;
    my %Configs;

    VIEW:
    for my $View (@ScreenConfig) {

        my $FrontendPath = $View;

        if (
            $View !~ m{(DashboardBackend|AgentCustomerInformationCenter::Backend)}xmsi
            && $View !~ m{(\w+::)+\w+}xmsi
            )
        {
            $FrontendPath = "Ticket::Frontend::$View";
        }

        my @Keys   = split '###', $FrontendPath;
        my $Config = $ConfigObject->Get( $Keys[0] );

        # check if config has DefaultColumns attribute and set it
        if ( !$#Keys && $Config->{DefaultColumns} ) {
            push @Keys, 'DefaultColumns';
        }

        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($Config);
            $Config = $Config->{ $Keys[$Index] };
        }

        next VIEW if ref $Config ne 'HASH';

        my %ExistingSetting = %{$Config};
        $Configs{$View} ||= {};

        # checks if substructure of DefaultColumns exists in settings
        if ( $ExistingSetting{DefaultColumns} ) {
            $Configs{$View} = $ExistingSetting{DefaultColumns};
        }
        else {
            $Configs{$View} = \%ExistingSetting;
        }
    }

    return %Configs;
}

=head2 _DefaultColumnsEnable()

This function enables the given Attributes for the requested DefaultColumns.

    my %Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
        'DashboardBackend###0100-TicketPendingReminder' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns'           => {},
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns' => {},
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns'       => {},
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns'      => {},
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns'  => {},
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns'          => {},
        'Ticket::Frontend::AgentTicketService###DefaultColumns'         => {},

        'DashboardBackend###0110-TicketEscalation'                                 => {},
        'DashboardBackend###0120-TicketNew'                                        => {},
        'DashboardBackend###0130-TicketOpen'                                       => {},
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder' => {},
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation'      => {},
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew'             => {},
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen'            => {},
    );

    my $Success = $ZnunyHelperObject->_DefaultColumnsEnable(%Configs);

Returns:

    my $Success = 1;

=cut

sub _DefaultColumnsEnable {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    my %ScreenConfig = %Param;
    my @Settings;

    my $NoConfigRebuild = 0;
    if ( $Param{NoConfigRebuild} ) {
        $NoConfigRebuild = 1;
        delete $Param{NoConfigRebuild};
    }

    VIEW:
    for my $View (%ScreenConfig) {

        next VIEW if !IsHashRefWithData( $ScreenConfig{$View} );

        my $FrontendPath = $View;

        if (
            $View !~ m{(DashboardBackend|AgentCustomerInformationCenter::Backend)}xmsi
            && $View !~ m{(\w+::)+\w+}xmsi
            )
        {
            $FrontendPath = "Ticket::Frontend::$View";
        }

        my @Keys   = split '###', $FrontendPath;
        my $Config = $ConfigObject->Get( $Keys[0] );

        # check if config has DefaultColumns attribute and set it
        if ( !$#Keys && $Config->{DefaultColumns} ) {
            push @Keys, 'DefaultColumns';
        }

        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($Config);
            $Config = $Config->{ $Keys[$Index] };
        }

        next VIEW if ref $Config ne 'HASH';

        my %ExistingSetting = %{$Config};

        # add the new settings
        my %NewDynamicFieldConfig;

        # checks if DefaultColumns exists in settings (DashboardBackend###0130-TicketOpen)
        if ( $ExistingSetting{DefaultColumns} ) {

            %{ $ExistingSetting{DefaultColumns} } = (
                %{ $ExistingSetting{DefaultColumns} },
                %{ $ScreenConfig{$View} }
            );

            # delete all undef params
            CONFIG:
            for my $CurrentConfig ( sort keys %{ $ExistingSetting{DefaultColumns} } ) {
                next CONFIG if defined $ExistingSetting{DefaultColumns}->{$CurrentConfig};
                delete $ExistingSetting{DefaultColumns}->{$CurrentConfig};
            }

            %NewDynamicFieldConfig = %ExistingSetting;
        }
        else {
            %NewDynamicFieldConfig = (
                %ExistingSetting,
                %{ $ScreenConfig{$View} }
            );

            # delete all undef params
            CONFIG:
            for my $CurrentConfig ( sort keys %NewDynamicFieldConfig ) {
                next CONFIG if defined $NewDynamicFieldConfig{$CurrentConfig};
                delete $NewDynamicFieldConfig{$CurrentConfig};
            }
        }

        # update the SysConfig
        my $SysConfigKey = join '###', @Keys;

        push @Settings, {
            Name           => $SysConfigKey,
            IsValid        => 1,
            EffectiveValue => \%NewDynamicFieldConfig,
        };
    }

    $SysConfigObject->SettingsSet(
        Settings => \@Settings,
        UserID   => 1,
    );

    return 1 if $NoConfigRebuild;

    # reload the ZZZ files
    # get a new config object to make sure config is updated
    $Self->_RebuildConfig();

    return 1;
}

=head2 _DefaultColumnsDisable()

This function disables the given Attributes for the requested DefaultColumns.

    my %Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
        'DashboardBackend###0100-TicketPendingReminder' => {
            Title                     => 2,
            CustomerUserID            => 1,
            DynamicField_DropdownTest => 1,
            DynamicField_Anotherone   => 2,
        },
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns'           => {},
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns' => {},
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns'       => {},
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns'      => {},
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns'  => {},
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns'          => {},
        'Ticket::Frontend::AgentTicketService###DefaultColumns'         => {},

        'DashboardBackend###0110-TicketEscalation'                                 => {},
        'DashboardBackend###0120-TicketNew'                                        => {},
        'DashboardBackend###0130-TicketOpen'                                       => {},
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder' => {},
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation'      => {},
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew'             => {},
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen'            => {},
    );

    my $Success = $ZnunyHelperObject->_DefaultColumnsDisable(%Configs);

Returns:

    my $Success = 1;

=cut

sub _DefaultColumnsDisable {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    my %ScreenConfig = %Param;

    VIEW:
    for my $View (%ScreenConfig) {

        next VIEW if !IsHashRefWithData( $ScreenConfig{$View} );

        my $FrontendPath = $View;

        if (
            $View !~ m{(DashboardBackend|AgentCustomerInformationCenter::Backend)}xmsi
            && $View !~ m{(\w+::)+\w+}xmsi
            )
        {
            $FrontendPath = "Ticket::Frontend::$View";
        }

        my @Keys   = split '###', $FrontendPath;
        my $Config = $ConfigObject->Get( $Keys[0] );

        # check if config has DefaultColumns attribute and set it
        if ( !$#Keys && $Config->{DefaultColumns} ) {
            push @Keys, 'DefaultColumns';
        }

        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($Config);
            $Config = $Config->{ $Keys[$Index] };
        }

        next VIEW if ref $Config ne 'HASH';

        my %ExistingSetting = %{$Config};

        # add the new settings
        my %NewDynamicFieldConfig;
        if ( $ExistingSetting{DefaultColumns} ) {

            %NewDynamicFieldConfig = %ExistingSetting;
            delete $NewDynamicFieldConfig{DefaultColumns};

            SETTING:
            for my $ExistingSettingKey ( sort keys %{ $ExistingSetting{DefaultColumns} } ) {

                next SETTING if $ScreenConfig{$View}->{$ExistingSettingKey};
                $NewDynamicFieldConfig{DefaultColumns}->{$ExistingSettingKey}
                    = $ExistingSetting{DefaultColumns}->{$ExistingSettingKey};
            }
        }
        else {

            SETTING:
            for my $ExistingSettingKey ( sort keys %ExistingSetting ) {

                next SETTING if $ScreenConfig{$View}->{$ExistingSettingKey};
                $NewDynamicFieldConfig{$ExistingSettingKey} = $ExistingSetting{$ExistingSettingKey};
            }
        }

        my $SysConfigKey = join '###', @Keys;
        $SysConfigObject->SettingsSet(
            Settings => [
                {
                    Name           => $SysConfigKey,
                    IsValid        => 1,
                    EffectiveValue => \%NewDynamicFieldConfig,
                },
            ],
            UserID => 1,
        );
    }

    return 1;
}

=head2 _DynamicFieldsDefaultColumnsGet()

Returns the DefaultColumn attributes of the requested SysConfigs, reduced to dynamic fields.

    my @Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns',
        'Ticket::Frontend::AgentTicketQueue###DefaultColumns',
        'Ticket::Frontend::AgentTicketResponsibleView###DefaultColumns',
        'Ticket::Frontend::AgentTicketWatchView###DefaultColumns',
        'Ticket::Frontend::AgentTicketLockedView###DefaultColumns',
        'Ticket::Frontend::AgentTicketEscalationView###DefaultColumns',
        'Ticket::Frontend::AgentTicketSearch###DefaultColumns',
        'Ticket::Frontend::AgentTicketService###DefaultColumns',

        # substructure of DefaultColumns
        'DashboardBackend###0100-TicketPendingReminder',
        'DashboardBackend###0110-TicketEscalation',
        'DashboardBackend###0120-TicketNew',
        'DashboardBackend###0130-TicketOpen',

        # substructure of DefaultColumns
        'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder',
        'AgentCustomerInformationCenter::Backend###0110-CIC-TicketEscalation',
        'AgentCustomerInformationCenter::Backend###0120-CIC-TicketNew',
        'AgentCustomerInformationCenter::Backend###0130-CIC-TicketOpen',
    );

    my %Configs = $ZnunyHelperObject->_DynamicFieldsDefaultColumnsGet(@Configs);

Returns:

    my %Configs = (
        'Ticket::Frontend::AgentTicketStatusView###DefaultColumns' => {
            DropdownTest => 1,
            Anotherone   => 2,
        },
        'DashboardBackend###0100-TicketPendingReminder' => {
            DropdownTest => 1,
            Anotherone   => 2,
        },
    );

=cut

sub _DynamicFieldsDefaultColumnsGet {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw( ConfigItems )) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %ScreenConfig = $Self->_DefaultColumnsGet( @{ $Param{ConfigItems} } );
    if ( !%ScreenConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't get Data (DefaultColumns) of SysConfig '$Param{ConfigItems}' !",
        );
        return;
    }

    my %Config;
    for my $ConfigItem ( @{ $Param{ConfigItems} } ) {

        my %CurrentScreenConfig = %{ $ScreenConfig{$ConfigItem} };

        ITEM:
        for my $Item ( sort keys %CurrentScreenConfig ) {

            next ITEM if $Item !~ m{\ADynamicField_};

            my $Value = $CurrentScreenConfig{$Item};
            $Item =~ s{\ADynamicField_}{};
            $Config{$ConfigItem}->{$Item} = $Value;
        }
    }

    return %Config;
}

=head2 _DynamicFieldsScreenGet()

This function returns the defined dynamic fields in the screens.

    my @Configs = (
        'Ticket::Frontend::AgentTicketSearch###Defaults###DynamicField',
        'Ticket::Frontend::CustomerTicketZoom###FollowUpDynamicField',
        'Ticket::Frontend::AgentTicketSearch###SearchCSVDynamicField',
    );

    my %Configs = $ZnunyHelperObject->_DynamicFieldsDefaultColumnsGet(@Configs);


Returns:

    my %Configs = (
        Ticket::Frontend::AgentTicketSearch###Defaults###DynamicField => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 2,
            TestDynamicField3 => 0,
            TestDynamicField4 => 1,
            TestDynamicField5 => 2,
        },
        'Ticket::Frontend::CustomerTicketZoom###FollowUpDynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 2,
            TestDynamicField3 => 0,
            TestDynamicField4 => 1,
            TestDynamicField5 => 2,
        },
        'Ticket::Frontend::AgentTicketSearch###SearchCSVDynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 2,
            TestDynamicField3 => 0,
            TestDynamicField4 => 1,
            TestDynamicField5 => 2,
        },
    );

=cut

sub _DynamicFieldsScreenGet {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(ConfigItems)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %Config;
    CONFIGITEM:
    for my $ConfigItem ( @{ $Param{ConfigItems} } ) {
        my @Keys = split '###', $ConfigItem;

        my $ConfigItemConfig = $ConfigObject->Get( $Keys[0] );
        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($ConfigItemConfig);
            $ConfigItemConfig = $ConfigItemConfig->{ $Keys[$Index] };
        }
        next CONFIGITEM if !$ConfigItemConfig;
        next CONFIGITEM if ref $ConfigItemConfig ne 'HASH';

        $Config{$ConfigItem} = $ConfigItemConfig;
    }

    return %Config;
}

=head2 _DynamicFieldsScreenEnable()

This function enables the defined dynamic fields in the needed screens.

    my %Screens = (
        AgentTicketFreeText => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'CustomerTicketZoom###FollowUpDynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'AgentTicketSearch###Defaults###DynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'ITSMChange::Frontend::AgentITSMChangeEdit###DynamicField' => {
            ChangeFreeText1 => 1,
            ChangeFreeText2 => 1,
            ChangeFreeText3 => 1,
            ChangeFreeText4 => 1,
            ChangeFreeText5 => 1,
        },
        'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit###DynamicField' => {
            WorkOrderFreeText1 => 1,
            WorkOrderFreeText2 => 1,
            WorkOrderFreeText3 => 1,
            WorkOrderFreeText4 => 1,
            WorkOrderFreeText5 => 1,
        },
    );

    my $Success = $ZnunyHelperObject->_DynamicFieldsScreenEnable(%Screens);

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsScreenEnable {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # define the enabled dynamic fields for each screen
    # (taken from sysconfig)
    my %ScreenDynamicFieldConfig = %Param;
    my @Settings;

    my $NoConfigRebuild = 0;
    if ( $Param{NoConfigRebuild} ) {
        $NoConfigRebuild = 1;
        delete $Param{NoConfigRebuild};
    }

    VIEW:
    for my $View ( sort keys %ScreenDynamicFieldConfig ) {

        next VIEW if !IsHashRefWithData( $ScreenDynamicFieldConfig{$View} );

        # There are special cases for defining the visibility of DynamicFields
        # Ticket::Frontend::AgentTicketSearch###Defaults###DynamicField
        # Ticket::Frontend::CustomerTicketZoom###FollowUpDynamicField
        # Ticket::Frontend::AgentTicketSearch###SearchCSVDynamicField
        #
        # on regular calls $View contains for examlpe "AgentTicketEmail"
        #
        # for the three special cases $View contains:
        # AgentTicketSearch###Defaults###DynamicField
        # CustomerTicketZoom###FollowUpDynamicField
        # AgentTicketSearch###SearchCSVDynamicField
        #
        # or calls for itsm change management for example
        #
        # ITSMChange::Frontend::AgentITSMChangeEdit###DynamicField
        # ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit###DynamicField
        #
        # so split on '###'
        # and put the values in the @Keys array
        #
        # for regular cases we put in the View name on $Keys[0] and 'DynamicField' on $Keys[1]

        my $FrontendPath = "Ticket::Frontend::$View";
        if ( $View =~ m{(\w+::)+\w+}xmsi ) {
            $FrontendPath = $View;
        }
        my @Keys = split '###', $FrontendPath;

        if ( !$#Keys ) {
            push @Keys, 'DynamicField';
        }

        my $Config = $ConfigObject->Get( $Keys[0] );
        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($Config);
            $Config = $Config->{ $Keys[$Index] };
        }
        next VIEW if ref $Config ne 'HASH';
        my %ExistingSetting = %{$Config};

        # add the new settings
        my %NewDynamicFieldConfig = ( %ExistingSetting, %{ $ScreenDynamicFieldConfig{$View} } );

        # delete all undef params
        CONFIG:
        for my $CurrentConfig ( sort keys %NewDynamicFieldConfig ) {
            next CONFIG if defined $NewDynamicFieldConfig{$CurrentConfig};
            delete $NewDynamicFieldConfig{$CurrentConfig};
        }

        # update the sysconfig
        my $SysConfigKey = join '###', @Keys;

        push @Settings, {
            Name           => $SysConfigKey,
            IsValid        => 1,
            EffectiveValue => \%NewDynamicFieldConfig,
        };
    }

    $SysConfigObject->SettingsSet(
        Settings => \@Settings,
        UserID   => 1,
    );

    return 1 if $NoConfigRebuild;

    # reload the ZZZ files
    # get a new config object to make sure config is updated
    $Self->_RebuildConfig();

    return 1;
}

=head2 _DynamicFieldsScreenDisable()

This function disables the defined dynamic fields in the needed screens.

    my %Screens = (
        AgentTicketFreeText => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'CustomerTicketZoom###FollowUpDynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'AgentTicketSearch###Defaults###DynamicField' => {
            TestDynamicField1 => 1,
            TestDynamicField2 => 1,
            TestDynamicField3 => 1,
            TestDynamicField4 => 1,
            TestDynamicField5 => 1,
        },
        'ITSMChange::Frontend::AgentITSMChangeEdit###DynamicField' => {
            ChangeFreeText1 => 1,
            ChangeFreeText2 => 1,
            ChangeFreeText3 => 1,
            ChangeFreeText4 => 1,
            ChangeFreeText5 => 1,
        },
        'ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit###DynamicField' => {
            WorkOrderFreeText1 => 1,
            WorkOrderFreeText2 => 1,
            WorkOrderFreeText3 => 1,
            WorkOrderFreeText4 => 1,
            WorkOrderFreeText5 => 1,
        },
    );

    my $Success = $ZnunyHelperObject->_DynamicFieldsScreenDisable(%Screens);

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsScreenDisable {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    # define the enabled dynamic fields for each screen
    # (taken from sysconfig)
    my %ScreenDynamicFieldConfig = %Param;

    VIEW:
    for my $View ( sort keys %ScreenDynamicFieldConfig ) {

        next VIEW if !IsHashRefWithData( $ScreenDynamicFieldConfig{$View} );

        # There are special cases for defining the visibility of DynamicFields
        # Ticket::Frontend::AgentTicketSearch###Defaults###DynamicField
        # Ticket::Frontend::CustomerTicketZoom###FollowUpDynamicField
        # Ticket::Frontend::AgentTicketSearch###SearchCSVDynamicField
        #
        # on regular calls $View contains for examlpe "AgentTicketEmail"
        #
        # for the three special cases $View contains:
        # AgentTicketSearch###Defaults###DynamicField
        # CustomerTicketZoom###FollowUpDynamicField
        # AgentTicketSearch###SearchCSVDynamicField
        #
        # or calls for itsm change management for example
        #
        # ITSMChange::Frontend::AgentITSMChangeEdit###DynamicField
        # ITSMWorkOrder::Frontend::AgentITSMWorkOrderEdit###DynamicField
        #
        # so split on '###'
        # and put the values in the @Keys array
        #
        # for regular cases we put in the View name on $Keys[0] and 'DynamicField' on $Keys[1]

        my $FrontendPath = "Ticket::Frontend::$View";
        if ( $View =~ m{(\w+::)+\w+}xmsi ) {
            $FrontendPath = $View;
        }
        my @Keys = split '###', $FrontendPath;

        if ( !$#Keys ) {
            push @Keys, 'DynamicField';
        }

        my $Config = $ConfigObject->Get( $Keys[0] );
        INDEX:
        for my $Index ( 1 ... $#Keys ) {
            last INDEX if !IsHashRefWithData($Config);
            $Config = $Config->{ $Keys[$Index] };
        }
        next VIEW if ref $Config ne 'HASH';
        my %ExistingSetting = %{$Config};

        my %NewDynamicFieldConfig;
        SETTING:
        for my $ExistingSettingKey ( sort keys %ExistingSetting ) {

            next SETTING if $ScreenDynamicFieldConfig{$View}->{$ExistingSettingKey};

            $NewDynamicFieldConfig{$ExistingSettingKey} = $ExistingSetting{$ExistingSettingKey};
        }

        my $SysConfigKey = join '###', @Keys;
        $SysConfigObject->SettingsSet(
            Settings => [
                {
                    Name           => $SysConfigKey,
                    IsValid        => 1,
                    EffectiveValue => \%NewDynamicFieldConfig,
                },
            ],
            UserID => 1,
        );

        # reload the ZZZ files
        # get a new config object to make sure config is updated
        $Self->_RebuildConfig();

    }

    return 1;
}

=head2 _DynamicFieldsDelete()

This function delete the defined dynamic fields

    my @DynamicFields = (
        'TestDynamicField1',
        'TestDynamicField2',
        'TestDynamicField3',
    );

    my $Success = $ZnunyHelperObject->_DynamicFieldsDelete(@DynamicFields);

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsDelete {
    my ( $Self, @DynamicFields ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $BackendObject      = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    return 1 if !@DynamicFields;

    # get all current dynamic fields
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    return 1 if !IsArrayRefWithData($DynamicFieldList);

    # create a dynamic fields lookup table
    my %DynamicFieldLookup;

    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicField);

        $DynamicFieldLookup{ $DynamicField->{Name} } = $DynamicField;
    }

    # delete the dynamic fields
    DYNAMICFIELD:
    for my $DynamicFieldName (@DynamicFields) {

        next DYNAMICFIELD if !IsHashRefWithData( $DynamicFieldLookup{$DynamicFieldName} );

        $BackendObject->AllValuesDelete(
            DynamicFieldConfig => $DynamicFieldLookup{$DynamicFieldName},
            UserID             => 1,
        );

        $DynamicFieldObject->DynamicFieldDelete(
            %{ $DynamicFieldLookup{$DynamicFieldName} },
            Reorder => 0,
            UserID  => 1,
        );
    }

    return 1;
}

=head2 _DynamicFieldsDisable()

This function disables the defined dynamic fields

    my @DynamicFields = (
        'TestDynamicField1',
        'TestDynamicField2',
        'TestDynamicField3',
    );

    my $Success = $ZnunyHelperObject->_DynamicFieldsDisable(@DynamicFields);

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsDisable {
    my ( $Self, @DynamicFields ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');

    return 1 if !@DynamicFields;

    # get all current dynamic fields
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    return 1 if !IsArrayRefWithData($DynamicFieldList);

    # create a dynamic fields lookup table
    my %DynamicFieldLookup;

    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicField);

        $DynamicFieldLookup{ $DynamicField->{Name} } = $DynamicField;
    }

    my $InvalidID = $ValidObject->ValidLookup(
        Valid => 'invalid',
    );

    # disable the dynamic fields
    DYNAMICFIELD:
    for my $DynamicFieldName (@DynamicFields) {

        next DYNAMICFIELD if !$DynamicFieldLookup{$DynamicFieldName};

        $DynamicFieldObject->DynamicFieldUpdate(
            %{ $DynamicFieldLookup{$DynamicFieldName} },
            ValidID => $InvalidID,
            Reorder => 0,
            UserID  => 1,
        );
    }

    return 1;
}

=head2 _DynamicFieldsCreateIfNotExists()

creates all dynamic fields that are necessary

Usable Snippets (SublimeTextAdjustments):
    otrs.dynamicfield.config.text
    otrs.dynamicfield.config.checkbox
    otrs.dynamicfield.config.datetime
    otrs.dynamicfield.config.dropdown
    otrs.dynamicfield.config.textarea
    otrs.dynamicfield.config.multiselect

    my @DynamicFields = (
        {
            Name       => 'TestDynamicField1',
            Label      => "TestDynamicField1",
            ObjectType => 'Ticket',
            FieldType  => 'Text',
            Config     => {
                DefaultValue => "",
            },
        },
        {
            Name       => 'TestDynamicField2',
            Label      => "TestDynamicField2",
            ObjectType => 'Ticket',
            FieldType  => 'Text',
            Config     => {
                DefaultValue => "",
            },
        },
    );

    my $Result = $ZnunyHelperObject->_DynamicFieldsCreateIfNotExists( @DynamicFields );

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsCreateIfNotExists {
    my ( $Self, @Definition ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    # get all current dynamic fields
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    if ( !IsArrayRefWithData($DynamicFieldList) ) {
        $DynamicFieldList = [];
    }

    my @DynamicFieldExistsNot;
    DYNAMICFIELD:
    for my $NewDynamicField (@Definition) {

        next DYNAMICFIELD if !IsHashRefWithData($NewDynamicField);

        next DYNAMICFIELD if grep { $NewDynamicField->{Name} eq $_->{Name} } @{$DynamicFieldList};

        push @DynamicFieldExistsNot, $NewDynamicField;
    }

    return 1 if !@DynamicFieldExistsNot;

    return $Self->_DynamicFieldsCreate(@DynamicFieldExistsNot);
}

=head2 _DynamicFieldsCreate()

creates all dynamic fields that are necessary

Usable Snippets (SublimeTextAdjustments):
    otrs.dynamicfield.config.text
    otrs.dynamicfield.config.checkbox
    otrs.dynamicfield.config.datetime
    otrs.dynamicfield.config.dropdown
    otrs.dynamicfield.config.textarea
    otrs.dynamicfield.config.multiselect

    my @DynamicFields = (
        {
            Name          => 'TestDynamicField1',
            Label         => "TestDynamicField1",
            InternalField => 0,                     # optional, 0 or 1, internal fields are protected
            ObjectType    => 'Ticket',
            FieldType     => 'Text',
            Config        => {
                DefaultValue => "",
            },
        },
        {
            Name                 => 'TestDynamicField2',
            Label                => "TestDynamicField2",
            InternalField        => 0,                     # optional, 0 or 1, internal fields are protected
            ObjectType           => 'Ticket',
            FieldType            => 'Text',
            FieldOrderAfterField => 'TestDynamicField1',   # special feature to order fields at a specific point. Can be also used for fields which are getting created in the same array before this dynamic field
            Config               => {
                DefaultValue => "",
            },
        },
    );

    my $Success = $ZnunyHelperObject->_DynamicFieldsCreate( @DynamicFields );

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsCreate {
    my ( $Self, @DynamicFields ) = @_;

    my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );

    # get all current dynamic fields
    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    if ( !IsArrayRefWithData($DynamicFieldList) ) {
        $DynamicFieldList = [];
    }

    # get the last element from the order list and add 1
    my $NextOrderNumber = 1;
    if (
        IsArrayRefWithData($DynamicFieldList)
        && IsHashRefWithData( $DynamicFieldList->[-1] )
        && $DynamicFieldList->[-1]->{FieldOrder}
        )
    {
        $NextOrderNumber = $DynamicFieldList->[-1]->{FieldOrder} + 1;
    }

    # create a dynamic fields lookup table
    my %DynamicFieldLookup;

    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {

        next DYNAMICFIELD if !IsHashRefWithData($DynamicField);

        $DynamicFieldLookup{ $DynamicField->{Name} } = $DynamicField;
    }

    # performance improvement for the FieldOrderAfterField functionality
    my $FieldOrderAfterFieldActive
        = grep { $_->{FieldOrderAfterField} || $_->{FieldOrderAfterFieldUpdate} } @DynamicFields;

    # create or update dynamic fields
    DYNAMICFIELD:
    for my $NewDynamicField (@DynamicFields) {

        my $CreateDynamicField;

        # check if the dynamic field already exists
        if ( !IsHashRefWithData( $DynamicFieldLookup{ $NewDynamicField->{Name} } ) ) {
            $CreateDynamicField = 1;
        }

        # if the field exists check if the type match with the needed type
        elsif (
            $DynamicFieldLookup{ $NewDynamicField->{Name} }->{FieldType}
            ne $NewDynamicField->{FieldType}
            )
        {
            my %OldDynamicFieldConfig = %{ $DynamicFieldLookup{ $NewDynamicField->{Name} } };

            # rename the field and create a new one
            my $Success = $DynamicFieldObject->DynamicFieldUpdate(
                %OldDynamicFieldConfig,
                Name   => $OldDynamicFieldConfig{Name} . 'Old',
                UserID => 1,
            );

            $CreateDynamicField = 1;
        }

        # otherwise if the field exists and the type matches, update it as defined
        else {
            my %OldDynamicFieldConfig = %{ $DynamicFieldLookup{ $NewDynamicField->{Name} } };

            my $FieldOrderUpdate = $Self->DynamicFieldFieldOrderAfterFieldGet(
                Name => $NewDynamicField->{FieldOrderAfterFieldUpdate},
            ) || $OldDynamicFieldConfig{FieldOrder};

            my $Success = $DynamicFieldObject->DynamicFieldUpdate(
                %{$NewDynamicField},
                ID         => $OldDynamicFieldConfig{ID},
                FieldOrder => $FieldOrderUpdate,
                ValidID    => $NewDynamicField->{ValidID} || $ValidID,
                Reorder    => 0,
                UserID     => 1,
            );
        }

        # check if new field has to be created
        next DYNAMICFIELD if !$CreateDynamicField;

        my $FieldOrderAdd = $Self->DynamicFieldFieldOrderAfterFieldGet(
            Name => $NewDynamicField->{FieldOrderAfterField},
        ) || $NextOrderNumber;

        # create a new field
        my $FieldID = $DynamicFieldObject->DynamicFieldAdd(
            Name          => $NewDynamicField->{Name},
            Label         => $NewDynamicField->{Label},
            FieldOrder    => $FieldOrderAdd,
            FieldType     => $NewDynamicField->{FieldType},
            ObjectType    => $NewDynamicField->{ObjectType},
            Config        => $NewDynamicField->{Config},
            InternalField => $NewDynamicField->{InternalField} || 0,
            ValidID       => $NewDynamicField->{ValidID} || $ValidID,
            UserID        => 1,
        );
        next DYNAMICFIELD if !$FieldID;

        # increase the order number
        $NextOrderNumber++;
    }

    return 1;
}

=head2 DynamicFieldFieldOrderAfterFieldGet()

This function will return the field order after a specific dynamic field field name.

e.g.

TestDynamicField has the field order 100.


    my $FieldOrder = $ZnunyHelperObject->DynamicFieldFieldOrderAfterFieldGet(
        Name => 'TestDynamicField1',
    );

Returns:

    my $FieldOrder = 101;

=cut

sub DynamicFieldFieldOrderAfterFieldGet {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    return if !$Param{Name};

    my $DynamicFieldList = $DynamicFieldObject->DynamicFieldListGet(
        Valid => 0,
    );

    my ($DynamicFieldFieldOrder) = grep { $_->{Name} eq $Param{Name} } @{ $DynamicFieldList || [] };

    return if !IsHashRefWithData($DynamicFieldFieldOrder);
    return $DynamicFieldFieldOrder->{FieldOrder} + 1;
}

=head2 DynamicFieldValueCreate()

Add a new dropdown value to a dynamic field. This function
will extended the possible values for the field.

    my $Success = $ZnunyHelperObject->DynamicFieldValueCreate(
        Name  => 'DynamicFieldName',
        Key   => 'ValueDropdown',
        Value => 'ValueDropdown',    # optional (Parameter "Key" is default)
    );

Returns:

    my $Success = 1;

=cut

sub DynamicFieldValueCreate {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $LogObject          = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name Key)) {
        next NEEDED if $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name  = $Param{Name};
    my $Key   = $Param{Key};
    my $Value = $Param{Value} || $Param{Key};

    my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
        Name => $Name,
    );

    return 1 if $DynamicFieldConfig->{Config}->{PossibleValues}->{$Key}
        && $DynamicFieldConfig->{Config}->{PossibleValues}->{$Key} eq $Value;

    $DynamicFieldConfig->{Config}->{PossibleValues} ||= {};
    $DynamicFieldConfig->{Config}->{PossibleValues}->{$Key} = $Value;

    my $Success = $DynamicFieldObject->DynamicFieldUpdate(
        %{$DynamicFieldConfig},
        UserID => 1,
    );

    return 1 if $Success;

    $LogObject->Log(
        Priority => 'error',
        Message  => "Can not update dynamic field configuration of field '" . $DynamicFieldConfig->{Name} . "'!",
    );

    return;
}

=head2 _DynamicFieldsConfigExport()

exports configuration of all dynamic fields

    my $Configs = $ZnunyHelperObject->_DynamicFieldsConfigExport(
        Format                => 'perl|yml|yaml|var', # defaults to perl. var returns the
        IncludeInternalFields => 1, # defaults to 1, also includes dynamic fields with flag 'InternalField',
        IncludeAllConfigKeys  => 1, # defaults to 1, also includes config keys ChangeTime, CreateTime, ID, InternalField, ValidID
        Result                => 'ARRAY', # HASH or ARRAY, defaults to ARRAY
        DynamicFields         => [  # optional, returns only the configs for the given fields
            'NameOfDynamicField',
            'SecondDynamicField',
        ],
    );

Returns:

    my $ARRAYResult = [
        {
          'Config' => {
              'DefaultValue' => ''
          },
          'FieldOrder' => '1',
          'FieldType'  => 'Text',
          'Label'      => "DynField1 Label",
          'Name'       => 'DynField1',
          'ObjectType' => 'Ticket'
        },
        {
          'Config' => {
              'DefaultValue' => ''
          },
          'FieldOrder' => '2',
          'FieldType'  => 'Text',
          'Label'      => 'DynField2 Label',
          'Name'       => 'DynField2',
          'ObjectType' => 'Ticket'
        },
    ];

    my $HASHResult = {
        'DynField1' => {
          'Config' => {
            'DefaultValue' => ''
          },
          'FieldOrder' => '1',
          'FieldType'  => 'Text',
          'Label'      => "DynField1 Label",
          'Name'       => 'DynField1',
          'ObjectType' => 'Ticket'
        },
        'DynField2' => {
          'Config' => {
            'DefaultValue' => ''
          },
          'FieldOrder' => '2',
          'FieldType'  => 'Text',
          'Label'      => 'DynField2 Label',
          'Name'       => 'DynField2',
          'ObjectType' => 'Ticket'
        },
    };

=cut

sub _DynamicFieldsConfigExport {
    my ( $Self, %Param ) = @_;

    my $MainObject         = $Kernel::OM->Get('Kernel::System::Main');
    my $LogObject          = $Kernel::OM->Get('Kernel::System::Log');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $YAMLObject         = $Kernel::OM->Get('Kernel::System::YAML');
    my $StorableObject     = $Kernel::OM->Get('Kernel::System::Storable');

    my $Format = lc( $Param{Format} // 'perl' );

    if ( $Format !~ m{\A(ya?ml|perl|var)\z} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Invalid value $Format for parameter Format.",
        );
        return;
    }

    my $ResultType = lc( $Param{Result} // 'array' );
    if ( $ResultType ne 'hash' && $ResultType ne 'array' ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Invalid value $ResultType for parameter Result.",
        );
        return;
    }

    # Use clone to make a copy to prevent weird issues with multiple calls to DynamicFieldListGet().
    # Somehow calls to DynamicFieldListGet() will report the already changed dynamic field configs
    # according to given parameters.
    my $DynamicFields = $DynamicFieldObject->DynamicFieldListGet() // [];
    $DynamicFields = $StorableObject->Clone( Data => $DynamicFields );
    my @DynamicFieldConfigs = sort { $a->{Name} cmp $b->{Name} } @{$DynamicFields};

    if ( IsArrayRefWithData( $Param{DynamicFields} ) ) {
        my %RestrictToDynamicFields = map { $_ => 1 } @{ $Param{DynamicFields} };
        @DynamicFieldConfigs = grep { $RestrictToDynamicFields{ $_->{Name} } } @DynamicFieldConfigs;
    }

    # Remove internal dynamic field configs
    my $IncludeInternalFields = $Param{IncludeInternalFields} // 1;
    if ( !$IncludeInternalFields ) {
        @DynamicFieldConfigs = grep { !$_->{InternalField} } @DynamicFieldConfigs;
    }

    # Remove hash keys
    my $IncludeAllConfigKeys = $Param{IncludeAllConfigKeys} // 1;
    if ( !$IncludeAllConfigKeys ) {
        for my $DynamicFieldConfig (@DynamicFieldConfigs) {

            KEY:
            for my $Key (qw(ChangeTime CreateTime ID InternalField ValidID)) {

                # Leave key InternalField in hash if it's an internal field.
                next KEY if $Key eq 'InternalField' && $DynamicFieldConfig->{InternalField};

                delete $DynamicFieldConfig->{$Key};
            }
        }
    }

    my $Data;
    if ( $ResultType eq 'hash' ) {
        %{$Data} = map { $_->{Name} => $_ } @DynamicFieldConfigs;
    }
    elsif ( $ResultType eq 'array' ) {
        $Data = \@DynamicFieldConfigs;
    }

    return $Data if $Format eq 'var';

    my $ConfigString = '';
    if ( $Format eq 'perl' ) {
        $ConfigString = $MainObject->Dump($Data);
    }
    elsif ( $Format =~ m{\Aya?ml\z} ) {
        $ConfigString = $YAMLObject->Dump( Data => $Data );
    }

    return $ConfigString;
}

=head2 _DynamicFieldsScreenConfigExport()

exports all configured screens of one ore more dynamic fields

    my $Configs = $ZnunyHelperObject->_DynamicFieldsScreenConfigExport(
        DynamicFields         => [              # optional, returns only for those fields
            'NameOfDynamicField',
            'SecondDynamicField',
        ],
    );

Returns:

    my $Result = {
        'DynField1' => {
            'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder' => '2',
            'DashboardBackend###0100-TicketPendingReminder'                            => '1',
            'DashboardBackend###0130-TicketOpen'                                       => '1',
            'DashboardBackend###0140-RunningTicketProcess'                             => '1',
            'Ticket::Frontend::AgentTicketQueue###DefaultColumns'                      => '2',
            'Ticket::Frontend::AgentTicketResponsible###DynamicField'                  => '2',
            'Ticket::Frontend::AgentTicketSearch###DefaultColumns'                     => '2',
            'Ticket::Frontend::AgentTicketStatusView###DefaultColumns'                 => '2',
            'Ticket::Frontend::AgentTicketZoom###DynamicField'                         => '0',
            'Ticket::Frontend::CustomerTicketOverview###DynamicField'                  => '2',
            'Ticket::Frontend::OverviewPreview###DynamicField'                         => '2',
        },
        'DynField2' => {
            'Ticket::Frontend::AgentTicketResponsible###DynamicField'                  => '2',
            'Ticket::Frontend::AgentTicketSearch###DefaultColumns'                     => '2',
        },
    };

=cut

sub _DynamicFieldsScreenConfigExport {
    my ( $Self, %Param ) = @_;

    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $LogObject          = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');

    my $ValidDynamicFieldScreenList = $Self->_ValidDynamicFieldScreenListGet();

    my @DynamicFields;
    if ( !$Param{DynamicFields} ) {
        my $List = $DynamicFieldObject->DynamicFieldList(
            ResultType => 'HASH',
        );
        @DynamicFields = sort values %{$List};
    }
    else {
        @DynamicFields = @{ $Param{DynamicFields} };
    }

    my %Config;
    for my $DynamicField (@DynamicFields) {
        DYNAMICFIELDSCREEN:
        for my $DynamicFieldScreen ( @{ $ValidDynamicFieldScreenList->{DynamicFieldScreens} } ) {
            my %DynamicFieldScreenConfig = $Self->_DynamicFieldsScreenGet(
                ConfigItems => [$DynamicFieldScreen],
            );

            next DYNAMICFIELDSCREEN
                if !IsStringWithData( $DynamicFieldScreenConfig{$DynamicFieldScreen}->{$DynamicField} );

            $Config{$DynamicField}->{$DynamicFieldScreen}
                = $DynamicFieldScreenConfig{$DynamicFieldScreen}->{$DynamicField};
        }

        DEFAULTCOLUMNSCREEN:
        for my $DefaultColumnsScreen ( @{ $ValidDynamicFieldScreenList->{DefaultColumnsScreens} } ) {
            my %DefaultColumnsScreenConfig = $Self->_DynamicFieldsDefaultColumnsGet(
                ConfigItems => [$DefaultColumnsScreen],
            );

            next DEFAULTCOLUMNSCREEN
                if !IsStringWithData( $DefaultColumnsScreenConfig{$DefaultColumnsScreen}->{$DynamicField} );

            $Config{$DynamicField}->{$DefaultColumnsScreen}
                = $DefaultColumnsScreenConfig{$DefaultColumnsScreen}->{$DynamicField};
        }
    }

    return %Config;
}

=head2 _DynamicFieldsScreenConfigImport()

imports all configured screens of one ore more dynamic fields

    %Config = {
        'DynField1' => {
            'AgentCustomerInformationCenter::Backend###0100-CIC-TicketPendingReminder' => '2',
            'DashboardBackend###0100-TicketPendingReminder'                            => '1',
            'DashboardBackend###0130-TicketOpen'                                       => '1',
            'DashboardBackend###0140-RunningTicketProcess'                             => '1',
            'Ticket::Frontend::AgentTicketQueue###DefaultColumns'                      => '2',
            'Ticket::Frontend::AgentTicketResponsible###DynamicField'                  => '2',
            'Ticket::Frontend::AgentTicketSearch###DefaultColumns'                     => '2',
            'Ticket::Frontend::AgentTicketStatusView###DefaultColumns'                 => '2',
            'Ticket::Frontend::AgentTicketZoom###DynamicField'                         => '0',
            'Ticket::Frontend::CustomerTicketOverview###DynamicField'                  => '2',
            'Ticket::Frontend::OverviewPreview###DynamicField'                         => '2',
        },
        'DynField2' => {
            'Ticket::Frontend::AgentTicketResponsible###DynamicField'                  => '2',
            'Ticket::Frontend::AgentTicketSearch###DefaultColumns'                     => '2',
        },
    };

    my $Success = $ZnunyHelperObject->_DynamicFieldsScreenConfigImport( %Config );

Returns:

    my $Success = 1;

=cut

sub _DynamicFieldsScreenConfigImport {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Config)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $ValidDynamicFieldScreenList = $Self->_ValidDynamicFieldScreenListGet();

    my %ScreenConfig;
    my %ColumnScreenConfig;

    for my $DynamicField ( sort keys %{ $Param{Config} } ) {

        DYNAMICFIELDSCREEN:
        for my $DynamicFieldScreen ( @{ $ValidDynamicFieldScreenList->{DynamicFieldScreens} } ) {
            $ScreenConfig{$DynamicFieldScreen}->{$DynamicField}
                = $Param{Config}->{$DynamicField}->{$DynamicFieldScreen};
        }

        DEFAULTCOLUMNSCREEN:
        for my $DefaultColumnsScreen ( @{ $ValidDynamicFieldScreenList->{DefaultColumnsScreens} } ) {
            $ColumnScreenConfig{$DefaultColumnsScreen}->{"DynamicField_$DynamicField"}
                = $Param{Config}->{$DynamicField}->{$DefaultColumnsScreen};
        }
    }

    $ScreenConfig{NoConfigRebuild} = 1;
    $Self->_DynamicFieldsScreenEnable(%ScreenConfig);

    $ColumnScreenConfig{NoConfigRebuild} = 1;
    $Self->_DefaultColumnsEnable(%ColumnScreenConfig);

    # reload the ZZZ files
    # get a new config object to make sure config is updated
    $Self->_RebuildConfig();

    return 1;
}

=head2 _PostMasterFilterCreateIfNotExists()

creates all postmaster filter that are necessary

    my @Filters = (
        {
            'Match' => {
                'Auto-Submitted' => '123'
            },
            'Name' => 'asdf',
            'Not' => {
                'Auto-Submitted' => undef
            },
            'Set' => {
                'X-OTRS-DynamicField-blub' => '123'
            },
            'StopAfterMatch' => '0'
        },
    );

    my $Result = $ZnunyHelperObject->_PostMasterFilterCreateIfNotExists( @Filters );

Returns:

    my $Success = 1;

=cut

sub _PostMasterFilterCreateIfNotExists {
    my ( $Self, @Definition ) = @_;

    my $PMFilterObject = $Kernel::OM->Get('Kernel::System::PostMaster::Filter');

    my @PostMasterFilterExistsNot;
    my %FilterList = $PMFilterObject->FilterList();

    FILTER:
    for my $NewPostMasterFilter (@Definition) {
        next FILTER if !IsHashRefWithData($NewPostMasterFilter);

        # only create if not exists
        my $FilterFound = grep { $NewPostMasterFilter->{Name} eq $_ } sort keys %FilterList;
        next FILTER if $FilterFound;

        push @PostMasterFilterExistsNot, $NewPostMasterFilter;
    }

    return $Self->_PostMasterFilterCreate(@PostMasterFilterExistsNot);
}

=head2 _PostMasterFilterCreate()

creates all postmaster filter that are necessary

    my @Filters = (
        {
            'Match' => {
                'Auto-Submitted' => '123'
            },
            'Name' => 'asdf',
            'Not' => {
                'Auto-Submitted' => undef
            },
            'Set' => {
                'X-OTRS-DynamicField-blub' => '123'
            },
            'StopAfterMatch' => '0'
        },
    );

    my $Result = $ZnunyHelperObject->_PostMasterFilterCreate( @Filters );

Returns:

    my $Success = 1;

=cut

sub _PostMasterFilterCreate {
    my ( $Self, @Definition ) = @_;

    my $PMFilterObject = $Kernel::OM->Get('Kernel::System::PostMaster::Filter');

    FILTER:
    for my $NewPostMasterFilter (@Definition) {
        next FILTER if !IsHashRefWithData($NewPostMasterFilter);

        # get filter
        my %Filter = %{$NewPostMasterFilter};

        my @ConvertStructureKeys = qw(Match Not Set);

        KEY:
        for my $ConvertStructureKey (@ConvertStructureKeys) {

            my $HashRef = $Filter{$ConvertStructureKey};
            next KEY if !IsHashRefWithData($HashRef);

            my @NewStructure;
            for my $ConfigKey ( sort keys %{$HashRef} ) {
                my $ConfigValue = $HashRef->{$ConfigKey};

                push(
                    @NewStructure,
                    {
                        Key   => $ConfigKey,
                        Value => $ConfigValue,
                    }
                );
            }

            $Filter{$ConvertStructureKey} = \@NewStructure;
        }

        # delete first (because no update function exists)
        $PMFilterObject->FilterDelete(%Filter);

        # add filter
        $PMFilterObject->FilterAdd(%Filter);
    }

    return 1;
}

=head2 _PostMasterFilterConfigExport()

exports configuration of all postmaster filter

    my $Configs = $ZnunyHelperObject->_PostMasterFilterConfigExport(
        Format => 'yml|perl', # defaults to perl
    );

=cut

sub _PostMasterFilterConfigExport {
    my ( $Self, %Param ) = @_;

    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject     = $Kernel::OM->Get('Kernel::System::Main');
    my $PMFilterObject = $Kernel::OM->Get('Kernel::System::PostMaster::Filter');
    my $YAMLObject     = $Kernel::OM->Get('Kernel::System::YAML');

    my $Format = lc( $Param{Format} // 'perl' );
    if ( $Format !~ m{\A(ya?ml|perl)\z} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Invalid value $Format for parameter Format.",
        );
        return;
    }

    my @Filters;
    my %FilterList = $PMFilterObject->FilterList();
    for my $FilterName ( sort keys %FilterList ) {
        my %Data = $PMFilterObject->FilterGet(
            Name => $FilterName,
        );

        push @Filters, \%Data;
    }

    my $ConfigString = '';
    if ( $Format eq 'perl' ) {
        $ConfigString = $MainObject->Dump( \@Filters );
    }
    elsif ( $Format =~ m{\Aya?ml\z} ) {
        $ConfigString = $YAMLObject->Dump( Data => \@Filters );
    }

    return $ConfigString;
}

# todo this should be merged to
# '_PostMasterFilterCreateIfNotExists' and '_PostMasterFilterCreate'
# while OTRS 7 porting

=head2 _PostMasterFilterConfigImport()

imports configuration of postmaster filter via yml

    my $Success = $ZnunyHelperObject->_PostMasterFilterConfigImport(
        Filter => $Filter,
        Format => 'yml',        # optional - default
    );

    $Filter = "---
- Match:
  - Key: Body
    Value: '123'
  Name: 'PostmasterFilter'
  Not:
  - Key: Body
    Value: ~
  Set:
  - Key: X-OTRS-DynamicField-test
    Value: '123'
  StopAfterMatch: 0
";


Returns:

    my $Success = 1;

=cut

sub _PostMasterFilterConfigImport {
    my ( $Self, %Param ) = @_;

    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');

    my $Format = lc( $Param{Format} // 'yml' );

    my $Filter;
    if ( $Format =~ m{\Aya?ml\z}i ) {
        $Filter = $YAMLObject->Load(
            Data => ${ $Param{Filter} },
        );
    }
    return if !IsArrayRefWithData($Filter);

    return $Self->_PostMasterFilterCreate( @{$Filter} );
}

=head2 _GroupCreateIfNotExists()

creates group if not exists

    my $Success = $ZnunyHelperObject->_GroupCreateIfNotExists(
        Name => 'Some Group Name',
    );

Returns:

    my $Success = 1;

=cut

sub _GroupCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %GroupsReversed = $GroupObject->GroupList(
        Valid => 0,
    );
    %GroupsReversed = reverse %GroupsReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %GroupsReversed );
    return $ItemID if $ItemID;

    return $GroupObject->GroupAdd(
        ValidID => 1,
        UserID  => 1,
        %Param,
    );
}

=head2 _RoleCreateIfNotExists()

creates role if not exists

    my $Success = $ZnunyHelperObject->_RoleCreateIfNotExists(
        Name => 'Some Role Name',
    );

Returns:

    my $Success = 1;

=cut

sub _RoleCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %RolesReversed = $GroupObject->RoleList(
        Valid => 0,
    );
    %RolesReversed = reverse %RolesReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %RolesReversed );
    return $ItemID if $ItemID;

    return $GroupObject->RoleAdd(
        ValidID => 1,
        UserID  => 1,
        %Param,
    );
}

=head2 _TypeCreateIfNotExists()

creates Type if not exists

    my $Success = $ZnunyHelperObject->_TypeCreateIfNotExists(
        Name => 'Some Type Name',
    );

Returns:

    my $Success = 1;

=cut

sub _TypeCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $TypeObject = $Kernel::OM->Get('Kernel::System::Type');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %TypesReversed = $TypeObject->TypeList(
        Valid => 0,
    );
    %TypesReversed = reverse %TypesReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %TypesReversed );
    return $ItemID if $ItemID;

    return $TypeObject->TypeAdd(
        ValidID => 1,
        UserID  => 1,
        %Param,
    );
}

=head2 _PriorityCreateIfNotExists()

creates Priority if not exists

    my $Success = $ZnunyHelperObject->_PriorityCreateIfNotExists(
        Name => 'Some Priority Name',
    );

Returns:

    my $Success = 1;

=cut

sub _PriorityCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');
    my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %PrioritysReversed = $PriorityObject->PriorityList(
        Valid => 0,
    );
    %PrioritysReversed = reverse %PrioritysReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %PrioritysReversed );
    return $ItemID if $ItemID;

    return $PriorityObject->PriorityAdd(
        ValidID => 1,
        UserID  => 1,
        %Param,
    );
}

=head2 _StateCreateIfNotExists()

creates State if not exists

    # e.g. new|open|closed|pending reminder|pending auto|removed|merged
    my $StateTypeID = $StateObject->StateTypeLookup( StateType => 'pending auto' );

    my $Success = $ZnunyHelperObject->_StateCreateIfNotExists(
        Name   => 'Some State Name',
        TypeID => $StateTypeID,
    );

Returns:

    my $Success = 1;

=cut

sub _StateCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $StateObject = $Kernel::OM->Get('Kernel::System::State');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %StatesReversed = $StateObject->StateList(
        Valid  => 0,
        UserID => 1
    );
    %StatesReversed = reverse %StatesReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %StatesReversed );
    return $ItemID if $ItemID;

    return $StateObject->StateAdd(
        %Param,
        ValidID => 1,
        UserID  => 1,
    );
}

=head2 _StateDisable()

disables a given state

    my @States = (
        'State1',
        'State2',
    );

    my $Success = $ZnunyHelperObject->_StateDisable(@States);

Returns:

    my $Success = 1;

=cut

sub _StateDisable {
    my ( $Self, @States ) = @_;

    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');
    my $StateObject = $Kernel::OM->Get('Kernel::System::State');

    return 1 if !@States;

    #get current invalid id
    my $InvalidID = $ValidObject->ValidLookup(
        Valid => 'invalid',
    );

    my $Success = 1;

    # disable the states
    STATE:
    for my $StateName (@States) {

        my %State = $StateObject->StateGet(
            Name => $StateName,
        );
        next STATE if !%State;

        my $UpdateSuccess = $StateObject->StateUpdate(
            %State,
            ValidID => $InvalidID,
            UserID  => 1,
        );

        if ( !$UpdateSuccess ) {
            $Success = 0;
        }
    }

    return $Success;
}

=head2 _StateTypeCreateIfNotExists()

creates state types if not exists

    my $StateTypeID = $ZnunyHelperObject->_StateTypeCreateIfNotExists(
        Name    => 'New StateType',
        Comment => 'some comment',
        UserID  => 123,
    );

=cut

sub _StateTypeCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name UserID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    # check if exists
    $DBObject->Prepare(
        SQL   => 'SELECT name FROM ticket_state_type WHERE name = ?',
        Bind  => [ \$Param{Name} ],
        Limit => 1,
    );
    my $Exists;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Exists = 1;
    }
    return 1 if $Exists;

    # create new
    return if !$DBObject->Do(
        SQL => 'INSERT INTO ticket_state_type (name, comments,'
            . ' create_time, create_by, change_time, change_by)'
            . ' VALUES (?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Name},   \$Param{Comment},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # get new statetype id
    return if !$DBObject->Prepare(
        SQL   => 'SELECT id FROM ticket_state_type WHERE name = ?',
        Bind  => [ \$Param{Name} ],
        Limit => 1,
    );

    # fetch the result
    my $ID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ID = $Row[0];
    }

    return if !$ID;
    return $ID;
}

=head2 _ServiceCreateIfNotExists()

creates Service if not exists

    my $Success = $ZnunyHelperObject->_ServiceCreateIfNotExists(
        Name => 'Some ServiceName',
        %ITSMParams,                        # optional params for Criticality or TypeID if ITSM is installed
    );

Returns:

    my $Success = 1;

=cut

sub _ServiceCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name = $Param{Name};

    # ITSMParams
    $Param{TypeID}      ||= '2';
    $Param{Criticality} ||= '3 normal';

    my %ServiceReversed = $ServiceObject->ServiceList(
        Valid  => 0,
        UserID => 1
    );
    %ServiceReversed = reverse %ServiceReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Name, %ServiceReversed );
    return $ItemID if $ItemID;

    # split string to check for possible sub services
    my @ServiceArray = split( '::', $Name );

    # create service with parent
    my $CompleteServiceName = '';
    my $ServiceID;

    SERVICE:
    for my $ServiceName (@ServiceArray) {

        my $ParentID;
        if ($CompleteServiceName) {

            $ParentID = $ServiceObject->ServiceLookup(
                Name   => $CompleteServiceName,
                UserID => 1,
            );

            if ( !$ParentID ) {

                $LogObject->Log(
                    Priority => 'error',
                    Message  => "Error while getting ServiceID for parent service "
                        . "'$CompleteServiceName' for new service '" . $Name . "'.",
                );
                return;
            }

            $CompleteServiceName .= '::';
        }

        $CompleteServiceName .= $ServiceName;

        my $ItemID = $Self->_ItemReverseListGet( $CompleteServiceName, %ServiceReversed );
        if ($ItemID) {
            $ServiceID = $ItemID;
            next SERVICE;
        }

        $ServiceID = $ServiceObject->ServiceAdd(
            %Param,
            Name     => $ServiceName,
            ParentID => $ParentID,
            ValidID  => 1,
            UserID   => 1,
        );

        if ( !$ServiceID ) {

            $LogObject->Log(
                Priority => 'error',
                Message  => "Error while adding new service '$ServiceName' ($ParentID).",
            );
            return;
        }

        %ServiceReversed = $ServiceObject->ServiceList(
            Valid  => 0,
            UserID => 1
        );
        %ServiceReversed = reverse %ServiceReversed;
    }

    return $ServiceID;
}

=head2 _SLACreateIfNotExists()

creates SLA if not exists

    my $Success = $ZnunyHelperObject->_SLACreateIfNotExists(
        Name => 'Some ServiceName',
        ServiceIDs          => [ 1, 5, 7 ],  # (optional)
        FirstResponseTime   => 120,          # (optional)
        FirstResponseNotify => 60,           # (optional) notify agent if first response escalation is 60% reached
        UpdateTime          => 180,          # (optional)
        UpdateNotify        => 80,           # (optional) notify agent if update escalation is 80% reached
        SolutionTime        => 580,          # (optional)
        SolutionNotify      => 80,           # (optional) notify agent if solution escalation is 80% reached
    );

Returns:

    my $Success = 1;

=cut

sub _SLACreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $SLAObject   = $Kernel::OM->Get('Kernel::System::SLA');
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    # ITSMParams
    $Param{TypeID}      ||= '2';
    $Param{Criticality} ||= '3 normal';

    my %SLAReversed = $SLAObject->SLAList(
        UserID => 1
    );
    %SLAReversed = reverse %SLAReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %SLAReversed );
    return $ItemID if $ItemID;

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );
    my $SLAID = $SLAObject->SLAAdd(
        %Param,
        ValidID => $ValidID,
        UserID  => 1,
    );

    return $SLAID;
}

=head2 _UserCreateIfNotExists()

creates user if not exists

    my $UserID = $ZnunyHelperObject->_UserCreateIfNotExists(
        UserFirstname => 'Manfred',
        UserLastname  => 'Huber',
        UserLogin     => 'mhuber',
        UserPw        => 'some-pass', # not required
        UserEmail     => 'email@example.com',
        UserMobile    => '1234567890', # not required
        ValidID       => 1,
        ChangeUserID  => 123,
    );

Returns:

    my $User = 123;

=cut

sub _UserCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $UserObject  = $Kernel::OM->Get('Kernel::System::User');
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(UserLogin)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %UserListReversed = $UserObject->UserList(
        Type   => 'Short',
        UserID => 1,
    );
    %UserListReversed = reverse %UserListReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{UserLogin}, %UserListReversed );
    return $ItemID if $ItemID;

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );
    my $UserID = $UserObject->UserAdd(
        %Param,
        ValidID => $ValidID,
        UserID  => 1,
    );

    return $UserID;
}

=head2 _CustomerUserCreateIfNotExists()

creates CustomerUser if not exists

    my $CustomerUserLogin = $ZnunyHelperObject->_CustomerUserCreateIfNotExists(
        Source         => 'CustomerUser', # CustomerUser source config
        UserFirstname  => 'Manfred',
        UserLastname   => 'Huber',
        UserCustomerID => 'A124',
        UserLogin      => 'mhuber',
        UserPassword   => 'some-pass', # not required
        UserEmail      => 'email@example.com',
    );

Returns:

    my $CustomerUserLogin = 'mhuber';

=cut

sub _CustomerUserCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject          = $Kernel::OM->Get('Kernel::System::Log');
    my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');
    my $ValidObject        = $Kernel::OM->Get('Kernel::System::Valid');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(UserLogin)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %CustomerUserReversedValid = $CustomerUserObject->CustomerSearch(
        UserLogin => $Param{UserLogin},
        Valid     => 1,
    );
    my %CustomerUserReversedInValid = $CustomerUserObject->CustomerSearch(
        UserLogin => $Param{UserLogin},
        Valid     => 0,
    );
    my %CustomerUserReversed = (
        %CustomerUserReversedValid,
        %CustomerUserReversedInValid,
    );

    # shitty solution for the check.
    # somebody should fix this and use the CustomerKey instead for the check.
    my $ItemID = $Self->_ItemReverseListGet( $Param{UserLogin}, %CustomerUserReversed );
    return $Param{UserLogin} if $ItemID;

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );
    my $CustomerUserID = $CustomerUserObject->CustomerUserAdd(
        %Param,
        ValidID => $ValidID,
        UserID  => 1,
    );

    return $CustomerUserID;
}

=head2 _QueueCreateIfNotExists()

creates Queue if not exists

    my $QueueID = $ZnunyHelperObject->_QueueCreateIfNotExists(
        Name    => 'Some Queue Name',
        GroupID => 1,
    );

Returns:

    my $QueueID = 123;

=cut

sub _QueueCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name GroupID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name = $Param{Name};

    my %QueueReversed = $QueueObject->QueueList(
        UserID => 1,
        Valid  => 0,
    );
    %QueueReversed = reverse %QueueReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Name, %QueueReversed );
    return $ItemID if $ItemID;

    # split string to check for possible sub Queues
    my @QueueArray = split( '::', $Name );

    # create Queue with parent
    my $CompleteQueueName = '';
    my $QueueID;

    QUEUE:
    for my $QueueName (@QueueArray) {

        if ($CompleteQueueName) {
            $CompleteQueueName .= '::';
        }

        $CompleteQueueName .= $QueueName;

        my $ItemID = $Self->_ItemReverseListGet( $CompleteQueueName, %QueueReversed );
        if ($ItemID) {
            $QueueID = $ItemID;
            next QUEUE;
        }

        $QueueID = $QueueObject->QueueAdd(
            %Param,
            Name          => $CompleteQueueName,
            ParentQueueID => $QueueID,
            ValidID       => 1,
            UserID        => 1,
        );

        if ( !$QueueID ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error while adding new Queue '$QueueName' ($QueueID).",
            );
            return;
        }

        %QueueReversed = $QueueObject->QueueList(
            UserID => 1,
        );
        %QueueReversed = reverse %QueueReversed;
    }

    return $QueueID;
}

=head2 _GeneralCatalogItemCreateIfNotExists()

adds a general catalog item if it does not exist

    my $ItemID = $ZnunyHelperObject->_GeneralCatalogItemCreateIfNotExists(
        Name            => 'Test Item',
        Class           => 'ITSM::ConfigItem::Test',
        Comment         => 'Class for test item.',
        PermissionGroup => 'itsm-configitem',              # optional
    );

Returns:

    my $ItemID = 1234;

=cut

sub _GeneralCatalogItemCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject            = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject             = $Kernel::OM->Get('Kernel::System::DB');
    my $GroupObject          = $Kernel::OM->Get('Kernel::System::Group');
    my $MainObject           = $Kernel::OM->Get('Kernel::System::Main');
    my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name Class)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name = $Param{Name};

    # check if general catalog module is installed
    my $GeneralCatalogLoaded = $MainObject->Require(
        'Kernel::System::GeneralCatalog',
        Silent => 1,
    );

    return if !$GeneralCatalogLoaded;

    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );

    # check if item already exists
    my $ItemListRef = $GeneralCatalogObject->ItemList(
        Class => $Param{Class},
        Valid => $ValidID,
    );

    my %ItemListReverse = reverse %{ $ItemListRef || {} };

    my $ItemID = $Self->_ItemReverseListGet( $Name, %ItemListReverse );
    return $ItemID if $ItemID;

    # add item if it does not exist
    $ItemID = $GeneralCatalogObject->ItemAdd(
        Class   => $Param{Class},
        Name    => $Name,
        ValidID => $ValidID,
        Comment => $Param{Comment},
        UserID  => 1,
    );

    return         if !$ItemID;
    return $ItemID if !$Param{PermissionGroup};

    my $GroupID = $GroupObject->GroupLookup(
        Group => $Param{PermissionGroup},
    );
    return $ItemID if !$GroupID;

    $GeneralCatalogObject->GeneralCatalogPreferencesSet(
        ItemID => $ItemID,
        Key    => 'Permission',
        Value  => $GroupID,
    );

    return $ItemID;
}

=head2 _ITSMConfigItemDefinitionCreate()

adds or updates a definition for a ConfigItemClass. You need to provide the configuration
of the CMDB class in the following directory:

/opt/znuny/scripts/cmdb_classes/Private_Endgeraete.config

The required general catalog item will be created automatically.

    my $DefinitionID = $ZnunyHelperObject->_ITSMConfigItemDefinitionCreate(
        Class           => 'Private Endgeraete',
        ClassFile       => 'Private_Endgeraete',  # optional
        PermissionGroup => 'itsm-configitem',     # optional
    );

Returns:

    my $DefinitionID = 1234;

=cut

sub _ITSMConfigItemDefinitionCreate {
    my ( $Self, %Param ) = @_;

    my $LogObject        = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject       = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigObject     = $Kernel::OM->Get('Kernel::Config');
    my $ConfigItemObject = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $YAMLObject       = $Kernel::OM->Get('Kernel::System::YAML');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Class)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Home = $ConfigObject->Get('Home');

    # check if ITSMConfigItem module is installed
    my $ITSMConfigItemLoaded = $MainObject->Require(
        'Kernel::System::ITSMConfigItem',
        Silent => 1,
    );
    return if !$ITSMConfigItemLoaded;

    # create general catalog item for class
    my $ClassID = $Self->_GeneralCatalogItemCreateIfNotExists(
        Name            => $Param{Class},
        Class           => 'ITSM::ConfigItem::Class',
        PermissionGroup => $Param{PermissionGroup},
    );
    return if !$ClassID;

    # do check create if not exists
    if ( $Param{CreateIfNotExists} ) {
        my $DefinitionListRef = $ConfigItemObject->DefinitionList(
            ClassID => $ClassID,
        );
        return $DefinitionListRef->[-1]->{DefinitionID} if IsArrayRefWithData($DefinitionListRef);
    }

    # check which type of import file is present (Perl structure or YAML).
    my $BaseClassFilePath = $Home . '/scripts/cmdb_classes/' . ( $Param{ClassFile} || $Param{Class} );

    my $ClassFilePath   = $BaseClassFilePath . '.yml';
    my $ClassFileIsYAML = 1;
    if ( !-f $ClassFilePath ) {
        $ClassFilePath   = $BaseClassFilePath . '.config';
        $ClassFileIsYAML = 0;
    }
    return if !-f $ClassFilePath;

    # get configuration from the file system
    my $ContentSCALARRef = $MainObject->FileRead(
        Location => $ClassFilePath,
        Mode     => 'utf8',
        Result   => 'SCALAR',
    );
    return if !$ContentSCALARRef;

    my $Content = ${$ContentSCALARRef};
    return if !defined $Content || !length $Content;

    # ITSMConfigurationManagement 6.0.18 switched format of config item definitions from Perl
    # to YAML. Check which one is needed by checking if the new console command
    # Kernel::System::Console::Command::Maint::ITSM::Configitem::DefinitionPerl2YAML
    # exists.
    my $DefinitionPerl2YAMLFilePath = $Home
        . '/Kernel/System/Console/Command/Maint/ITSM/Configitem/DefinitionPerl2YAML.pm';
    my $YAMLConfigItemDefinitionExpected = ( -f $DefinitionPerl2YAMLFilePath ) ? 1 : 0;

    if (
        !$ClassFileIsYAML
        && $YAMLConfigItemDefinitionExpected
        )
    {
        # Turn Perl config item file into Perl structure.
        $Content = eval $Content;    ## no critic
        return if !defined $Content;

        # Turn Perl structure into YAML.
        $Content = $YAMLObject->Dump(
            Data => $Content,
        );
    }
    elsif (
        $ClassFileIsYAML
        && !$YAMLConfigItemDefinitionExpected
        )
    {
        # Turn YAML config item file into Perl structure.
        $Content = $YAMLObject->Load(
            Data => $Content,
        );
        return if !defined $Content;

        # Turn Perl structure into string.
        $Content = $MainObject->Dump(
            $Content,
        );

        # Remove leading '$VAR1 =' from dump.
        $Content =~ s{\A\$VAR1 = }{};
    }

    return if !defined $Content || !length $Content;

    # get last definition
    my $LastDefinition = $ConfigItemObject->DefinitionGet(
        ClassID => $ClassID,
    );

    # stop add if definition was not changed
    return $LastDefinition->{DefinitionID}
        if IsHashRefWithData($LastDefinition) && $LastDefinition->{Definition} eq $Content;

    my $DefinitionID = $ConfigItemObject->DefinitionAdd(
        ClassID    => $ClassID,
        Definition => $Content,
        UserID     => 1,
    );

    return $DefinitionID;
}

=head2 _ITSMConfigItemDefinitionCreateIfNotExists()

add if not exists a definition for a ConfigItemClass. You need to provide the configuration
of the CMDB class in the following directory:

/opt/znuny/scripts/cmdb_classes/Private_Endgeraete.config

The required general catalog item will be created automatically.

    my $DefinitionID = $ZnunyHelperObject->_ITSMConfigItemDefinitionCreateIfNotExists(
        Class           => 'Private Endgeraete',
        ClassFile       => 'Private_Endgeraete',  # optional
        PermissionGroup => 'itsm-configitem',     # optional
    );

Returns:

    my $DefinitionID = 1234;

=cut

sub _ITSMConfigItemDefinitionCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    return $Self->_ITSMConfigItemDefinitionCreate(
        %Param,
        CreateIfNotExists => 1,
    );
}

=head2 _ITSMConfigItemVersionAdd()

adds or updates a ConfigItem version.

    my $VersionID = $ZnunyHelperObject->_ITSMConfigItemVersionAdd(
        ConfigItemID  => 12345,
        Name          => 'example name',

        ClassID       => 1234,
        ClassName     => 'example class',
        DefinitionID  => 1234,

        DeplStateID   => 1234,
        DeplStateName => 'Production',

        InciStateID   => 1234,
        InciStateName => 'Operational',

        XMLData => {
            'Priority'    => 'high',
            'Product'     => 'test',
            'Description' => 'test'
        },
    );

    EXAMPLE Create Computer:

    my $ZnunyHelperObject    = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');

    # get valid id
    my $ValidID = $ValidObject->ValidLookup(
        Valid => 'valid',
    );

    my $ClassListRef = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::Class',
        Valid => $ValidID,
    );
    my %ClassList = reverse %{ $ClassListRef || {} };

    my $YesNoRef = $GeneralCatalogObject->ItemList(
        Class => 'ITSM::ConfigItem::YesNo',
        Valid => $ValidID,
    );
    my %YesNoList = reverse %{ $YesNoRef || {} };

    my $ConfigItemID = $ConfigItemObject->ConfigItemAdd(
        ClassID => $ClassList{Computer},
        UserID  => 1,
    );

    # create new version of ConfigItem
    my $VersionID = $ZnunyHelperObject->_ITSMConfigItemVersionAdd(
        ConfigItemID  => $ConfigItemID,
        Name          => 'blub',
        ClassName     => 'Computer',
        DeplStateName => 'Production',
        InciStateName => 'Operational',
        XMLData => {
            OtherEquipment         => '...',
            Note                   => '...',
            WarrantyExpirationDate => '2016-01-01',
            InstallDate            => '2016-01-01',
            NIC                    => [
                {
                    Content => 'NIC',
                    IPoverDHCP => [
                        {
                            Content => $YesNoList{Yes},
                        },
                    ],
                    IPAddress => [
                        {
                            Content => '127.0.0.1'
                        },
                    ],
                },
            ],
        },
    );

Returns:

    my $VersionID = 1234;

=cut

sub _ITSMConfigItemVersionAdd {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(ConfigItemID Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !$Param{DeplStateID} && !$Param{DeplStateName} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'DeplStateID' or 'DeplStateName' needed!",
        );
        return;
    }
    if ( !$Param{InciStateID} && !$Param{InciStateName} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'DeplStateID' or 'DeplStateName' needed!",
        );
        return;
    }
    if ( $Param{XMLData} && ref $Param{XMLData} ne 'HASH' ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'XMLData' as hash ref needed!",
        );
        return;
    }

    # check if general catalog module is installed
    my $GeneralCatalogLoaded = $MainObject->Require(
        'Kernel::System::GeneralCatalog',
        Silent => 1,
    );

    return if !$GeneralCatalogLoaded;

    # check if general catalog module is installed
    my $ITSMConfigItemLoaded = $MainObject->Require(
        'Kernel::System::ITSMConfigItem',
        Silent => 1,
    );

    return if !$ITSMConfigItemLoaded;

    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');
    my $ValidObject          = $Kernel::OM->Get('Kernel::System::Valid');

    my $ConfigItemID = $Param{ConfigItemID};
    my %ConfigItem   = %{ $Param{XMLData} || {} };

    my %Version = $Self->_ITSMVersionGet(
        ConfigItemID => $ConfigItemID,
    );

    # get deployment state list
    my %DeplStateList = %{
        $GeneralCatalogObject->ItemList(
            Class => 'ITSM::ConfigItem::DeploymentState',
            )
            || {}
    };
    my %DeplStateListReverse = reverse %DeplStateList;

    my %InciStateList = %{
        $GeneralCatalogObject->ItemList(
            Class => 'ITSM::Core::IncidentState',
            )
            || {}
    };
    my %InciStateListReverse = reverse %InciStateList;

    # get definition
    my $DefinitionID = $Param{DefinitionID};
    if ( !$DefinitionID ) {

        # get class id or name
        my $ClassID = $Param{ClassID};
        if ( $Param{ClassName} ) {

            # get valid id
            my $ValidID = $ValidObject->ValidLookup(
                Valid => 'valid',
            );

            my $ItemListRef = $GeneralCatalogObject->ItemList(
                Class => 'ITSM::ConfigItem::Class',
                Valid => $ValidID,
            );

            my %ItemList = reverse %{ $ItemListRef || {} };

            $ClassID = $ItemList{ $Param{ClassName} };
        }

        my $XMLDefinition = $ConfigItemObject->DefinitionGet(
            ClassID => $ClassID,
        );

        $DefinitionID = $XMLDefinition->{DefinitionID};
    }

    if ( $Param{Name} ) {
        $Version{Name} = $Param{Name};
    }
    if ( $Param{DefinitionID} || $Param{ClassID} || $Param{ClassName} ) {
        $Version{DefinitionID} = $DefinitionID;
    }
    if ( $Param{DeplStateID} ) {
        $Version{DeplStateID} = $Param{DeplStateID};
    }
    if ( $Param{InciStateID} ) {
        $Version{InciStateID} = $Param{InciStateID};
    }
    if ( $Param{DeplStateName} ) {
        $Version{DeplStateID} = $DeplStateListReverse{ $Param{DeplStateName} };
    }
    if ( $Param{InciStateName} ) {
        $Version{InciStateID} = $InciStateListReverse{ $Param{InciStateName} };
    }

    %ConfigItem = ( %{ $Version{XMLData} || {} }, %ConfigItem );

    my $XMLData = [
        undef,
        {
            'Version' => [
                undef,
                {},
            ],
        },
    ];
    $Self->_ParseData2XML(
        %Param,
        Result => $XMLData->[1]->{Version}->[-1],
        Data   => \%ConfigItem,
    );

    my $VersionID = $ConfigItemObject->VersionAdd(
        ConfigItemID => $ConfigItemID,
        Name         => $Version{Name},
        DefinitionID => $Version{DefinitionID},
        DeplStateID  => $Version{DeplStateID},
        InciStateID  => $Version{InciStateID},
        XMLData      => $XMLData,
        UserID       => 1,
    );

    return $VersionID;
}

=head2 _ITSMConfigItemVersionExists()

checks if a version already exists without returning a error.


    my $Found = $ZnunyHelperObject->_ITSMConfigItemVersionExists(
        VersionID  => 123,
    );

    or

    my $Found = $ZnunyHelperObject->_ITSMConfigItemVersionExists(
        ConfigItemID => 123,
    );


Returns:

    my $Found = 1;

=cut

sub _ITSMConfigItemVersionExists {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');
    my $DBObject   = $Kernel::OM->Get('Kernel::System::DB');

    # check needed stuff
    if ( !$Param{VersionID} && !$Param{ConfigItemID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Need VersionID or ConfigItemID!',
        );
        return;
    }

    # check if general catalog module is installed
    my $GeneralCatalogLoaded = $MainObject->Require(
        'Kernel::System::GeneralCatalog',
        Silent => 1,
    );

    return if !$GeneralCatalogLoaded;

    # check if general catalog module is installed
    my $ITSMConfigItemLoaded = $MainObject->Require(
        'Kernel::System::ITSMConfigItem',
        Silent => 1,
    );

    return if !$ITSMConfigItemLoaded;

    if ( $Param{VersionID} ) {

        # get version
        $DBObject->Prepare(
            SQL   => 'SELECT 1 FROM configitem_version WHERE id = ?',
            Bind  => [ \$Param{VersionID} ],
            Limit => 1,
        );
    }
    else {

        # get version
        $DBObject->Prepare(
            SQL   => 'SELECT 1 FROM configitem_version WHERE configitem_id = ? ORDER BY id DESC',
            Bind  => [ \$Param{ConfigItemID} ],
            Limit => 1,
        );
    }

    # fetch the result
    my $Found;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Found = 1;
    }

    return $Found;
}

=head2 _ITSMConfigItemVersionGet()

get a ConfigItem version.

    my %Version = $ZnunyHelperObject->_ITSMConfigItemVersionGet(
        ConfigItemID    => 12345,
        XMLDataMultiple => 1,      # default: 0, This option will return a more complex XMLData structure with multiple element data! Makes sense if you are using CountMin, CountMax etc..
    );

Returns:

    my %Version = (
        ConfigItemID  => 12345,

        DefinitionID => 1234,
        DeplStateID  => 1234,
        DeplState    => 'Production',
        InciStateID  => 1234,
        InciState    => 'Operational',
        Name         => 'example name',
        XMLData      => {
            'Priority'    => 'high',
            'Product'     => 'test',
            'Description' => 'test'
        },
    );

=cut

sub _ITSMConfigItemVersionGet {
    my ( $Self, %Param ) = @_;

    my $MainObject           = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigItemObject     = $Kernel::OM->Get('Kernel::System::ITSMConfigItem');
    my $GeneralCatalogObject = $Kernel::OM->Get('Kernel::System::GeneralCatalog');

    # check if general catalog module is installed
    my $GeneralCatalogLoaded = $MainObject->Require(
        'Kernel::System::GeneralCatalog',
        Silent => 1,
    );

    return if !$GeneralCatalogLoaded;

    # check if general catalog module is installed
    my $ITSMConfigItemLoaded = $MainObject->Require(
        'Kernel::System::ITSMConfigItem',
        Silent => 1,
    );

    return if !$ITSMConfigItemLoaded;
    return if !$Self->_ITSMConfigItemVersionExists(%Param);

    my $VersionRef = $ConfigItemObject->VersionGet(
        %Param,
        XMLDataGet => 1,
    );

    return if !IsHashRefWithData($VersionRef);

    my %VersionConfigItem;
    $VersionConfigItem{XMLData} ||= {};
    if ( IsHashRefWithData( $VersionRef->{XMLData}->[1]->{Version}->[1] ) ) {
        $Self->_ParseXML2Data(
            %Param,
            Result => $VersionConfigItem{XMLData},
            Data   => $VersionRef->{XMLData}->[1]->{Version}->[1],
        );
    }

    for my $Field (qw(ConfigItemID Name ClassID Class DefinitionID DeplStateID DeplState InciStateID InciState)) {
        $VersionConfigItem{$Field} = $VersionRef->{$Field};
    }

    return %VersionConfigItem;
}

=head2 _ITSMVersionAdd()

DEPRECATED, use $Self->_ITSMConfigItemVersionAdd instead.

=cut

sub _ITSMVersionAdd {
    my ( $Self, %Param ) = @_;

    return $Self->_ITSMConfigItemVersionAdd(%Param);
}

=head2 _ITSMVersionExists()

DEPRECATED, use $Self->_ITSMConfigItemVersionExists instead.

=cut

sub _ITSMVersionExists {
    my ( $Self, %Param ) = @_;

    return $Self->_ITSMConfigItemVersionExists(%Param);
}

=head2 _ITSMVersionGet()

DEPRECATED, use $Self->_ITSMConfigItemVersionGet instead.

=cut

sub _ITSMVersionGet {
    my ( $Self, %Param ) = @_;

    return $Self->_ITSMConfigItemVersionGet(%Param);
}

=head2 _ParseXML2Data()

this is a internal function for _ITSMVersionGet to parse the additional data
stored in XMLData.

    my $Success = $ZnunyHelperObject->_ParseXML2Data(
        Parent          => $Identifier,          # optional: contains the field name of the parent xml
        Result          => $Result,              # contains the reference to the result hash
        Data            => $Data{$Field}->[1],   # contains the xml hash we want to parse
        XMLDataMultiple => 1,                    # default: 0, This option will return a more complex XMLData structure with multiple element data! Makes sense if you are using CountMin, CountMax etc..
    );

Returns:

    my $Success = 1;

=cut

sub _ParseXML2Data {
    my ( $Self, %Param ) = @_;

    my $Result          = $Param{Result};
    my $XMLDataMultiple = $Param{XMLDataMultiple};
    my $Parent          = $Param{Parent} || '';
    my %Data            = %{ $Param{Data} || {} };

    FIELD:
    for my $Field ( sort keys %Data ) {
        next FIELD if !IsArrayRefWithData( $Data{$Field} );

        if ($XMLDataMultiple) {
            $Result->{$Field} = [];

            for my $Index ( 1 .. $#{ $Data{$Field} } ) {
                my $Value = $Data{$Field}->[$Index]->{Content};

                my $CurrentResult = {};

                $Self->_ParseXML2Data(
                    %Param,
                    Parent => $Field,
                    Result => $CurrentResult,
                    Data   => $Data{$Field}->[$Index],
                );

                if ( defined $Value ) {
                    $CurrentResult->{Content} = $Value;

                    if ( keys %{$CurrentResult} ) {
                        push @{ $Result->{$Field} }, $CurrentResult;
                    }
                }
            }
        }
        else {
            my $Value = $Data{$Field}->[1]->{Content};

            next FIELD if !defined $Value;

            $Result->{$Field} = $Value;
        }
    }

    return 1;
}

=head2 _ParseData2XML()

this is a internal function for _ITSMVersionAdd to parse the additional data
for xml storage.

    my $Success = $ZnunyHelperObject->_ParseData2XML(
        Parent => $Identifier,          # optional: contains the field name of the parent xml
        Result => $Result,              # contains the reference to the result hash
        Data   => $Data{$Field}->[1],   # contains the xml hash we want to parse
    );

Returns:

    my $Success = 1;

=cut

sub _ParseData2XML {
    my ( $Self, %Param ) = @_;

    my $Result = $Param{Result};
    my $Parent = $Param{Parent} || '';
    my %Data   = %{ $Param{Data} || {} };

    ITEM:
    for my $ItemID ( sort keys %Data ) {
        next ITEM if $ItemID eq $Parent;
        next ITEM if $ItemID eq 'Content';

        my $Item = $Data{$ItemID};

        if ( IsArrayRefWithData($Item) ) {

            $Result->{$ItemID} = [undef];

            for my $Index ( 0 .. $#{$Item} ) {
                my $ItemData = $Item->[$Index];

                push @{ $Result->{$ItemID} }, {
                    'Content' => $Item->[$Index]->{Content},
                };

                $Self->_ParseData2XML(
                    %Param,
                    Parent => $ItemID,
                    Result => $Result->{$ItemID}->[-1],
                    Data   => $Data{$ItemID}->[$Index],
                );
            }
        }
        else {
            $Result->{$ItemID} = [
                undef,
                {
                    'Content' => $Item,
                }
            ];
        }
    }

    return 1;
}

=head2 _WebserviceCreateIfNotExists()

creates web services that not exist yet

    # installs all .yml files in $OTRS/scripts/webservices/
    # name of the file will be the name of the webservice
    my $Result = $ZnunyHelperObject->_WebserviceCreateIfNotExists(
        SubDir => 'ZnunyAssetDesk', # optional
    );

OR:

    my $Result = $ZnunyHelperObject->_WebserviceCreateIfNotExists(
        Webservices => {
            'New Webservice 1234' => '/path/to/Webservice.yml',
            # ...
        }
    );

=cut

sub _WebserviceCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $LogObject        = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject       = $Kernel::OM->Get('Kernel::System::Main');
    my $YAMLObject       = $Kernel::OM->Get('Kernel::System::YAML');

    my $Webservices = $Param{Webservices};
    if ( !IsHashRefWithData($Webservices) ) {
        $Webservices = $Self->_WebservicesGet(
            SubDir => $Param{SubDir},
        );
    }

    return 1 if !IsHashRefWithData($Webservices);

    my $WebserviceList = $WebserviceObject->WebserviceList();
    if ( ref $WebserviceList ne 'HASH' ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error while getting list of Webservices!"
        );
        return;
    }

    WEBSERVICE:
    for my $WebserviceName ( sort keys %{$Webservices} ) {

        # stop if already added
        next WEBSERVICE if grep { $WebserviceName eq $_ } sort values %{$WebserviceList};

        my $WebserviceYAMLPath = $Webservices->{$WebserviceName};

        # read config
        my $Content = $MainObject->FileRead(
            Location => $WebserviceYAMLPath,
            Mode     => 'utf8',
        );

        if ( !$Content ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't read $WebserviceYAMLPath!"
            );
            next WEBSERVICE;
        }

        my $Config = $YAMLObject->Load( Data => ${$Content} );
        if ( !$Config ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error while loading $WebserviceYAMLPath!"
            );
            next WEBSERVICE;
        }

        # add webservice to the system
        my $WebserviceID = $WebserviceObject->WebserviceAdd(
            Name    => $WebserviceName,
            Config  => $Config,
            ValidID => 1,
            UserID  => 1,
        );

        next WEBSERVICE if $WebserviceID;

        $LogObject->Log(
            Priority => 'error',
            Message  => "Error while adding Webservice '$WebserviceName' from $WebserviceYAMLPath!"
        );
    }

    return 1;
}

=head2 _WebserviceCreate()

creates or updates web services

    # installs all .yml files in $OTRS/scripts/webservices/
    # name of the file will be the name of the webservice
    my $Result = $ZnunyHelperObject->_WebserviceCreate(
        SubDir => 'ZnunyAssetDesk', # optional
    );

OR:

    my $Result = $ZnunyHelperObject->_WebserviceCreate(
        Webservices => {
            'New Webservice 1234' => '/path/to/Webservice.yml',
            # ...
        }
    );

=cut

sub _WebserviceCreate {
    my ( $Self, %Param ) = @_;

    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $LogObject        = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject       = $Kernel::OM->Get('Kernel::System::Main');
    my $YAMLObject       = $Kernel::OM->Get('Kernel::System::YAML');

    my $Webservices = $Param{Webservices};
    if ( !IsHashRefWithData($Webservices) ) {
        $Webservices = $Self->_WebservicesGet(
            SubDir => $Param{SubDir},
        );
    }

    return 1 if !IsHashRefWithData($Webservices);

    my $WebserviceList = $WebserviceObject->WebserviceList();
    if ( ref $WebserviceList ne 'HASH' ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error while getting list of Webservices!"
        );
        return;
    }
    my %WebserviceListReversed = reverse %{$WebserviceList};

    WEBSERVICE:
    for my $WebserviceName ( sort keys %{$Webservices} ) {

        my $WebserviceID           = $Self->_ItemReverseListGet( $WebserviceName, %WebserviceListReversed );
        my $UpdateOrCreateFunction = 'WebserviceAdd';

        if ($WebserviceID) {
            $UpdateOrCreateFunction = 'WebserviceUpdate';
        }

        my $WebserviceYAMLPath = $Webservices->{$WebserviceName};

        # read config
        my $Content = $MainObject->FileRead(
            Location => $WebserviceYAMLPath,
            Mode     => 'utf8',
        );

        if ( !$Content ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't read $WebserviceYAMLPath!"
            );
            next WEBSERVICE;
        }

        my $Config = $YAMLObject->Load( Data => ${$Content} );
        if ( !$Config ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error while loading $WebserviceYAMLPath!"
            );
            next WEBSERVICE;
        }

        # add or update webservice
        my $Success = $WebserviceObject->$UpdateOrCreateFunction(
            ID      => $WebserviceID,
            Name    => $WebserviceName,
            Config  => $Config,
            ValidID => 1,
            UserID  => 1,
        );

        next WEBSERVICE if $Success;

        $LogObject->Log(
            Priority => 'error',
            Message  => "Error while updating/adding Webservice '$WebserviceName' from $WebserviceYAMLPath!"
        );
    }

    return 1;
}

=head2 _WebserviceDelete()

deletes web services

    # deletes all .yml files webservices in $OTRS/scripts/webservices/
    # name of the file will be the name of the webservice
    my $Result = $ZnunyHelperObject->_WebserviceDelete(
        SubDir => 'ZnunyAssetDesk', # optional
    );

OR:

    my $Result = $ZnunyHelperObject->_WebserviceDelete(
        Webservices => {
            'Not needed Webservice 1234' => 1, # value is not used
            # ...
        }
    );

=cut

sub _WebserviceDelete {
    my ( $Self, %Param ) = @_;

    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $LogObject        = $Kernel::OM->Get('Kernel::System::Log');

    my $Webservices = $Param{Webservices};
    if ( !IsHashRefWithData($Webservices) ) {
        $Webservices = $Self->_WebservicesGet(
            SubDir => $Param{SubDir},
        );
    }

    return 1 if !IsHashRefWithData($Webservices);

    my $WebserviceList = $WebserviceObject->WebserviceList();
    if ( ref $WebserviceList ne 'HASH' ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Error while getting list of Webservices!"
        );
        return;
    }
    my %WebserviceListReversed = reverse %{$WebserviceList};

    WEBSERVICE:
    for my $WebserviceName ( sort keys %{$Webservices} ) {

        # stop if already deleted
        next WEBSERVICE if !$WebserviceListReversed{$WebserviceName};

        # delete webservice
        my $Success = $WebserviceObject->WebserviceDelete(
            ID     => $WebserviceListReversed{$WebserviceName},
            UserID => 1,
        );

        if ( !$Success ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Error while deleting Webservice '$WebserviceName'!"
            );
            return;
        }
    }

    return 1;
}

=head2 _WebservicesGet()

gets a list of .yml files from $OTRS/scripts/webservices

    my $Result = $ZnunyHelperObject->_WebservicesGet(
        SubDir => 'ZnunyAssetDesk', # optional
    );

    $Result = {
        'Webservice'          => '$OTRS/scripts/webservices/ZnunyAssetDesk/Webservice.yml',
        'New Webservice 1234' => '$OTRS/scripts/webservices/ZnunyAssetDesk/New Webservice 1234.yml',
    }

=cut

sub _WebservicesGet {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    my $WebserviceDirectory = $ConfigObject->Get('Home')
        . '/scripts/webservices';

    if ( IsStringWithData( $Param{SubDir} ) ) {
        $WebserviceDirectory .= '/' . $Param{SubDir};
    }

    my @FilesInDirectory = $MainObject->DirectoryRead(
        Directory => $WebserviceDirectory,
        Filter    => '*.yml',
    );

    my %Webservices;
    for my $FileWithPath (@FilesInDirectory) {

        my $WebserviceName = $FileWithPath;
        $WebserviceName =~ s{\A .+? \/ ([^\/]+) \. yml \z}{$1}xms;

        $Webservices{$WebserviceName} = $FileWithPath;
    }

    return \%Webservices;
}

=head2 _RebuildConfig()

Rebuilds OTRS config.

    my $Success = $ZnunyHelperObject->_RebuildConfig();

Returns:

    my $Success = 1;

=cut

sub _RebuildConfig {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    # Rebuild the configuration
    $SysConfigObject->ConfigurationDeploy(
        AllSettings => 1,
        Force       => 1,
        UserID      => 1,
    );

    delete $INC{'Kernel/Config/Files/ZZZAAuto.pm'};

    # Don't use ObjectDiscard of ObjectManager because
    # restore database will not work anymore (in tests).
    delete $Kernel::OM->{Objects}->{'Kernel::Config'};
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    return 1;
}

=head2 _ProcessCreateIfNotExists()

creates processes if there is no active process with the same name

    # installs all .yml files in $OTRS/scripts/processes/
    # name of the file will be the name of the process
    my $Success = $ZnunyHelperObject->_ProcessCreateIfNotExists(
        SubDir => 'ZnunyAssetDesk', # optional
    );

OR:

    my $Success = $ZnunyHelperObject->_ProcessCreateIfNotExists(
        Processes => {
            'New Process 1234' => '/path/to/Process.yml',
            # ...
        }
    );

=cut

sub _ProcessCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $MainObject      = $Kernel::OM->Get('Kernel::System::Main');
    my $YAMLObject      = $Kernel::OM->Get('Kernel::System::YAML');
    my $DBProcessObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::DB::Process');
    my $EntityObject    = $Kernel::OM->Get('Kernel::System::ProcessManagement::DB::Entity');

    my $Processes;
    if ( exists $Param{Processes} ) {
        $Processes = $Param{Processes};
    }
    else {
        $Processes = $Self->_ProcessesGet(
            SubDir => $Param{SubDir},    # SubDir can be undef
        );
    }

    if ( !IsHashRefWithData($Processes) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'No processes found for given parameters.',
        );

        return;
    }

    my $ProcessList = $DBProcessObject->ProcessListGet(
        UserID => 1,
    );
    if ( !IsArrayRefWithData($ProcessList) ) {
        $ProcessList = [];
    }

    PROCESS:
    for my $ProcessName ( sort keys %{$Processes} ) {

        my $ProcessYAMLPath = $Processes->{$ProcessName};

        # read config
        my $Content = $MainObject->FileRead(
            Location => $ProcessYAMLPath,
            Mode     => 'utf8',
        );

        if ( !defined $Content ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Can't read $ProcessYAMLPath!",
            );
            return;
        }

        my $ProcessData = $YAMLObject->Load( Data => ${$Content} );
        if ( !IsHashRefWithData($ProcessData) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "YAML parsing failed for file $ProcessYAMLPath!",
            );
            return;
        }

        if ( !IsHashRefWithData( $ProcessData->{Process} ) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "No process found in file $ProcessYAMLPath!",
            );
            return;
        }

        if ( !IsStringWithData( $ProcessData->{Process}->{Name} ) ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Process has no name in file $ProcessYAMLPath!",
            );
            return;
        }

        if ( !$Param{UpdateExisting} ) {
            EXISTINGPROCESS:
            for my $ExistingProcess ( @{$ProcessList} ) {

                next EXISTINGPROCESS if !defined $ExistingProcess->{Name};
                next EXISTINGPROCESS if $ExistingProcess->{Name} ne $ProcessData->{Process}->{Name};
                next EXISTINGPROCESS if !defined $ExistingProcess->{State};
                next EXISTINGPROCESS if $ExistingProcess->{State} ne 'Active';

                next PROCESS;
            }
        }

        my %ProcessImport = $DBProcessObject->ProcessImport(
            Content                   => ${$Content},
            OverwriteExistingEntities => 1,
            UserID                    => 1,
        );

        if (
            !%ProcessImport
            || !$ProcessImport{Success}
            )
        {

            $ProcessImport{Message} //= '';

            $LogObject->Log(
                Priority => 'error',
                Message =>
                    "Importing process '$ProcessData->{Process}->{Name}' from file '$ProcessYAMLPath' failed.\n"
                    . "\tBackend Error Message:\n\t$ProcessImport{Message}!",
            );
            return;
        }
    }

    # Synchronize newly created processes
    my $ConfigFileLocation = $ConfigObject->Get('Home') . '/Kernel/Config/Files/ZZZProcessManagement.pm';

    my $ProcessDump = $DBProcessObject->ProcessDump(
        ResultType => 'FILE',
        Location   => $ConfigFileLocation,
        UserID     => 1,
    );
    if ( !$ProcessDump ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Error while dumping processes via ProcessDump().',
        );

        return;
    }

    my $Synchronized = $EntityObject->EntitySyncStatePurge(
        UserID => 1,
    );
    if ( !$Synchronized ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => 'Error synchronizing processes.',
        );

        return;
    }

    return 1;
}

=head2 _ProcessCreate()

creates or updates processes

    # installs all .yml files in $OTRS/scripts/processes/
    # name of the file will be the name of the process
    my $Success = $ZnunyHelperObject->_ProcessCreate(
        SubDir => 'ZnunyAssetDesk', # optional
    );

OR:

    my $Success = $ZnunyHelperObject->_ProcessCreate(
        Processes => {
            'New Process 1234' => '/path/to/Process.yml',
            # ...
        }
    );

=cut

sub _ProcessCreate {
    my ( $Self, %Param ) = @_;

    return $Self->_ProcessCreateIfNotExists(
        %Param,
        UpdateExisting => 1,
    );
}

=head2 _ProcessesGet()

gets a list of .yml files from $OTRS/scripts/processes

    my $Result = $ZnunyHelperObject->_ProcessesGet(
        SubDir => 'ZnunyAssetDesk', # optional
    );

    $Result = {
        'Process'          => '$OTRS/scripts/processes/ZnunyAssetDesk/Process.yml',
        'New Process 1234' => '$OTRS/scripts/processes/ZnunyAssetDesk/New Process 1234.yml',
    }

=cut

sub _ProcessesGet {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    my $ProcessDirectory = $ConfigObject->Get('Home')
        . '/scripts/processes';

    if ( IsStringWithData( $Param{SubDir} ) ) {
        $ProcessDirectory .= '/' . $Param{SubDir};
    }

    my @FilesInDirectory = $MainObject->DirectoryRead(
        Directory => $ProcessDirectory,
        Filter    => '*.yml',
    );

    my %Processes;
    for my $FileWithPath (@FilesInDirectory) {

        my $ProcessName = $FileWithPath;
        $ProcessName =~ s{\A .+? \/ ([^\/]+) \. yml \z}{$1}xms;

        $Processes{$ProcessName} = $FileWithPath;
    }

    return \%Processes;
}

=head2 _ProcessWidgetDynamicFieldGroupsGet()

gets ProcessWidgetDynamicFieldGroups

    # get ProcessWidgetDynamicFieldGroups
    my %ProcessWidgetDynamicFieldGroups = $ZnunyHelperObject->_ProcessWidgetDynamicFieldGroupsGet();

    return:

    %ProcessWidgetDynamicFieldGroups = (
        Group1 = [
            'DynamicField1',
            'DynamicField3',
        ],
        Group2 = [
            'DynamicField2',
        ],
    );

=cut

sub _ProcessWidgetDynamicFieldGroupsGet {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    my $AgentTicketZoomConfig           = $ConfigObject->Get('Ticket::Frontend::AgentTicketZoom');
    my %ProcessWidgetDynamicFieldGroups = %{ $AgentTicketZoomConfig->{ProcessWidgetDynamicFieldGroups} };

    return if !%ProcessWidgetDynamicFieldGroups;

    my %Config;
    for my $Group ( sort keys %ProcessWidgetDynamicFieldGroups ) {

        my @DynamicFields = split /\,/, $ProcessWidgetDynamicFieldGroups{$Group};
        $Config{$Group} = \@DynamicFields || [];
    }

    return %Config;

}

=head2 _ProcessWidgetDynamicFieldGroupsAdd()

gets ProcessWidgetDynamicFieldGroups

    my %ProcessWidgetDynamicFieldGroups = (
        Group1 = [
            'DynamicField1',
            'DynamicField3',
        ],
        Group2 = [
            'DynamicField2',
        ],
    );

    my $Success = $ZnunyHelperObject->_ProcessWidgetDynamicFieldGroupsAdd(
        %ProcessWidgetDynamicFieldGroups
    );

=cut

sub _ProcessWidgetDynamicFieldGroupsAdd {
    my ( $Self, %Groups ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    my %ProcessWidgetDynamicFieldGroups = $Self->_ProcessWidgetDynamicFieldGroupsGet();

    my %NewDynamicFieldConfig;
    my $AgentTicketZoomConfig     = $ConfigObject->Get('Ticket::Frontend::AgentTicketZoom');
    my %CurrentDynamicFieldConfig = %{ $AgentTicketZoomConfig->{ProcessWidgetDynamicFieldGroups} };

    GROUP:
    for my $Group ( sort keys %Groups ) {

        my $NewDynamicFields;
        my @NewDynamicFields;
        my @CurrentDynamicFields;

        if ( $ProcessWidgetDynamicFieldGroups{$Group} ) {

            @CurrentDynamicFields = @{ $ProcessWidgetDynamicFieldGroups{$Group} };
            push @NewDynamicFields, @CurrentDynamicFields;
        }

        NEWDYNAMICFIELD:
        for my $DynamicFieldName ( @{ $Groups{$Group} } ) {

            my $Exists = grep { $DynamicFieldName eq $_ } @CurrentDynamicFields;

            # next dynamic field if already exists
            next NEWDYNAMICFIELD if $Exists;

            push @NewDynamicFields, $DynamicFieldName;
        }

        $NewDynamicFields .= join ',', @NewDynamicFields;
        $NewDynamicFieldConfig{$Group} = $NewDynamicFields;
    }

    %NewDynamicFieldConfig = (
        %CurrentDynamicFieldConfig,
        %NewDynamicFieldConfig,
    );

    my $SysConfigKey = 'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicFieldGroups';

    my $Success = $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => $SysConfigKey,
                IsValid        => 1,
                EffectiveValue => \%NewDynamicFieldConfig,
            },
        ],
        UserID => 1,
    );

    # reload the ZZZ files
    # get a new config object to make sure config is updated
    $Self->_RebuildConfig();

    return 1 if $Success;

    return 0;
}

=head2 _ProcessWidgetDynamicFieldGroupsRemove()

gets ProcessWidgetDynamicFieldGroups

    my %ProcessWidgetDynamicFieldGroups = (
        Group1 = [
            'DynamicField1',
            'DynamicField3',
        ],
        Group2 = [],            # deletes the whole group
    );

    my $Success = $ZnunyHelperObject->_ProcessWidgetDynamicFieldGroupsRemove(
        %ProcessWidgetDynamicFieldGroups
    );

=cut

sub _ProcessWidgetDynamicFieldGroupsRemove {
    my ( $Self, %Groups ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');

    my %ProcessWidgetDynamicFieldGroups = $Self->_ProcessWidgetDynamicFieldGroupsGet();
    my %NewDynamicFieldConfig;

    GROUP:
    for my $Group ( sort keys %ProcessWidgetDynamicFieldGroups ) {

        my $NewDynamicFields;

        if ( !$Groups{$Group} ) {
            $NewDynamicFields = join ',', @{ $ProcessWidgetDynamicFieldGroups{$Group} };
            $NewDynamicFieldConfig{$Group} = $NewDynamicFields;
            next GROUP;
        }

        # delete whole group if array is empty
        next GROUP if !IsArrayRefWithData( $Groups{$Group} );

        my @NewDynamicFields;
        DYNAMICFIELD:
        for my $DynamicFieldName ( @{ $ProcessWidgetDynamicFieldGroups{$Group} } ) {

            my $Exists = grep { $DynamicFieldName eq $_ } @{ $Groups{$Group} };

            next DYNAMICFIELD if $Exists;
            push @NewDynamicFields, $DynamicFieldName;

        }

        $NewDynamicFields = join ',', @NewDynamicFields;

        # removes empty groups
        next GROUP if !$NewDynamicFields;
        $NewDynamicFieldConfig{$Group} = $NewDynamicFields;
    }

    my $SysConfigKey = 'Ticket::Frontend::AgentTicketZoom###ProcessWidgetDynamicFieldGroups';

    my $Success = $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => $SysConfigKey,
                IsValid        => 1,
                EffectiveValue => \%NewDynamicFieldConfig,
            },
        ],
        UserID => 1,
    );

    # reload the ZZZ files
    # get a new config object to make sure config is updated
    $Self->_RebuildConfig();

    return 1 if $Success;

    return 0;
}

=head2 _ModuleGroupAdd()

This function adds one or more groups to the list of groups of a frontend module registration for any interface.

    my $Success = $HelperObject->_ModuleGroupAdd(
        Module => 'Admin',
        Group  => [
            'users',
        ],
        GroupRo => [
            'some_other_group'
        ],
        Frontend => 'Frontend::Module', # Frontend::Module (default), PublicFrontend::Module, CustomerFrontend::Module
    );

=cut

sub _ModuleGroupAdd {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Module)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if (
        !IsArrayRefWithData( $Param{Group} )
        && !IsArrayRefWithData( $Param{GroupRo} )
        )
    {
        return 1;
    }

    $Param{Frontend} ||= 'Frontend::Module';

    my $FrontendList = $ConfigObject->Get( $Param{Frontend} );
    return if !IsHashRefWithData($FrontendList);

    # Split module "path" (e. g. Admin###001-Framework)
    my $Module             = $Param{Module};
    my @ModulePathElements = split '###', $Module;

    my $ModuleRegistration = $FrontendList;
    for my $ModulePathElement (@ModulePathElements) {
        $ModuleRegistration = $ModuleRegistration->{$ModulePathElement};
        return if !$ModuleRegistration;
    }

    return if !IsArrayRefWithData($ModuleRegistration) && !IsHashRefWithData($ModuleRegistration);
    my $IsArray = IsArrayRefWithData($ModuleRegistration);

    # Some config settings are hashes, some are arrays of hashes.
    # Turn all into arrays temporarily for easier handling.
    if ( !$IsArray ) {
        $ModuleRegistration = [$ModuleRegistration];
    }

    MODULEREGISTRATION:
    for my $CurrentModuleRegistration ( @{$ModuleRegistration} ) {

        GROUP:
        for my $GroupType (qw(Group GroupRo)) {

            my $AddGroups = $Param{$GroupType};
            next GROUP if !IsArrayRefWithData($AddGroups);

            my $OldGroups = $CurrentModuleRegistration->{$GroupType} || [];

            my %AddGroups = map { $_ => 1 } @{$AddGroups};
            my %OldGroups = map { $_ => 1 } @{$OldGroups};

            my %NewGroups = (
                %AddGroups,
                %OldGroups
            );

            my @NewGroups = sort keys %NewGroups;

            $CurrentModuleRegistration->{$GroupType} = \@NewGroups;
        }
    }

    # Turn config arrays into their original form so that config setting update works.
    if ( !$IsArray ) {
        $ModuleRegistration = shift @{$ModuleRegistration};
    }

    $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => $Param{Frontend} . '###' . $Param{Module},
                IsValid        => 1,
                EffectiveValue => $ModuleRegistration,
            },
        ],
        UserID => 1,
    );

    return 1;
}

=head2 _ModuleGroupRemove()

This function removes one or more groups from the list of groups of a frontend module registration for any interface.

    my $Success = $ZnunyHelperObject->_ModuleGroupRemove(
        Module => 'Admin',
        Group  => [
            'users',
        ],
        GroupRo => [
            'some_other_group'
        ],
        Frontend => 'Frontend::Module', # Frontend::Module (default), PublicFrontend::Module, CustomerFrontend::Module
    );

=cut

sub _ModuleGroupRemove {
    my ( $Self, %Param ) = @_;

    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');
    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Module)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if (
        !IsArrayRefWithData( $Param{Group} )
        && !IsArrayRefWithData( $Param{GroupRo} )
        )
    {
        return 1;
    }

    $Param{Frontend} ||= 'Frontend::Module';

    my $FrontendList = $ConfigObject->Get( $Param{Frontend} );
    return if !IsHashRefWithData($FrontendList);

    # Split module "path" (e. g. Admin###001-Framework)
    my $Module             = $Param{Module};
    my @ModulePathElements = split '###', $Module;

    my $ModuleRegistration = $FrontendList;
    for my $ModulePathElement (@ModulePathElements) {
        $ModuleRegistration = $ModuleRegistration->{$ModulePathElement};
        return if !$ModuleRegistration;
    }

    return if !IsArrayRefWithData($ModuleRegistration) && !IsHashRefWithData($ModuleRegistration);
    my $IsArray = IsArrayRefWithData($ModuleRegistration);

    # Some config settings are hashes, some are arrays of hashes.
    # Turn all into arrays temporarily for easier handling.
    if ( !$IsArray ) {
        $ModuleRegistration = [$ModuleRegistration];
    }

    MODULEREGISTRATION:
    for my $CurrentModuleRegistration ( @{$ModuleRegistration} ) {

        GROUP:
        for my $GroupType (qw(Group GroupRo)) {

            my $RemoveGroups = $Param{$GroupType};
            next GROUP if !IsArrayRefWithData($RemoveGroups);

            my $OldGroups = $CurrentModuleRegistration->{$GroupType};
            next GROUP if !IsArrayRefWithData($OldGroups);

            my %OldGroups = map { $_ => 1 } @{$OldGroups};

            for my $RemoveGroup ( @{$RemoveGroups} ) {
                delete $OldGroups{$RemoveGroup};
            }

            my @NewGroups = sort keys %OldGroups;

            $CurrentModuleRegistration->{$GroupType} = \@NewGroups;
        }
    }

    # Turn config arrays into their original form so that config setting update works.
    if ( !$IsArray ) {
        $ModuleRegistration = shift @{$ModuleRegistration};
    }

    $SysConfigObject->SettingsSet(
        Settings => [
            {
                Name           => $Param{Frontend} . '###' . $Param{Module},
                IsValid        => 1,
                EffectiveValue => $ModuleRegistration,
            },
        ],
        UserID => 1,
    );

    return 1;
}

=head2 _NotificationEventCreate()

create or update notification event

    my @NotificationList = (
        {
            Name => 'Agent::CustomerVIPPriorityUpdate',
            Data => {
                Events => [
                    'TicketPriorityUpdate',
                ],
                ArticleAttachmentInclude => [
                    '0'
                ],
                LanguageID => [
                    'en',
                    'de'
                ],
                NotificationArticleTypeID => [
                    1,
                ],
                Recipients => [
                    'Customer',
                ],
                TransportEmailTemplate => [
                    'Default',
                ],
                Transports => [
                    'Email',
                ],
                VisibleForAgent => [
                    '0',
                ],
            },
            Message => {
                en => {
                    Subject     => 'Priority for your ticket changed',
                    ContentType => 'text/html',
                    Body        => '...',
                },
                de => {
                    Subject     => 'Die Prioritaet Ihres Tickets wurde geaendert',
                    ContentType => 'text/html',
                    Body        => '...',
                },
            },
        },
        # ...
    );

    my $Success = $ZnunyHelperObject->_NotificationEventCreate( @NotificationList );

Returns:

    my $Success = 1;

=cut

sub _NotificationEventCreate {
    my ( $Self, @NotificationEvents ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $NotificationEventObject = $Kernel::OM->Get('Kernel::System::NotificationEvent');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');

    my $Success = 1;
    NOTIFICATIONEVENT:
    for my $NotificationEvent (@NotificationEvents) {
        next NOTIFICATIONEVENT if !IsHashRefWithData($NotificationEvent);

        # check needed stuff
        NEEDED:
        for my $Needed (qw(Name)) {

            next NEEDED if defined $NotificationEvent->{$Needed};

            $LogObject->Log(
                Priority => 'error',
                Message  => "Parameter '$Needed' is needed!",
            );
            return;
        }

        my %NotificationEventReversed = $NotificationEventObject->NotificationList(
            UserID => 1
        );
        %NotificationEventReversed = reverse %NotificationEventReversed;

        my $ItemID  = $Self->_ItemReverseListGet( $NotificationEvent->{Name}, %NotificationEventReversed );
        my $ValidID = $NotificationEvent->{ValidID} // $ValidObject->ValidLookup(
            Valid => 'valid',
        );

        if ($ItemID) {
            my $UpdateSuccess = $NotificationEventObject->NotificationUpdate(
                %{$NotificationEvent},
                ID      => $ItemID,
                ValidID => $ValidID,
                UserID  => 1,
            );

            if ( !$UpdateSuccess ) {
                $Success = 0;
            }
        }
        else {
            my $CreateID = $NotificationEventObject->NotificationAdd(
                %{$NotificationEvent},
                ValidID => $ValidID,
                UserID  => 1,
            );

            if ( !$CreateID ) {
                $Success = 0;
            }
        }
    }

    return $Success;
}

=head2 _NotificationEventCreateIfNotExists()

creates notification event if not exists

    my $NotificationID = $ZnunyHelperObject->_NotificationEventCreateIfNotExists(
        Name => 'Agent::CustomerVIPPriorityUpdate',
        Data => {
            Events => [
                'TicketPriorityUpdate',
            ],
            ArticleAttachmentInclude => [
                '0'
            ],
            LanguageID => [
                'en',
                'de'
            ],
            NotificationArticleTypeID => [
                1,
            ],
            Recipients => [
                'Customer',
            ],
            TransportEmailTemplate => [
                'Default',
            ],
            Transports => [
                'Email',
            ],
            VisibleForAgent => [
                '0',
            ],
        },
        Message => {
            en => {
                Subject     => 'Priority for your ticket changed',
                ContentType => 'text/html',
                Body        => '...',
            },
            de => {
                Subject     => 'Die Prioritaet Ihres Tickets wurde geaendert',
                ContentType => 'text/html',
                Body        => '...',
            },
        },
    );

Returns:

    my $NotificationID = 123;

=cut

sub _NotificationEventCreateIfNotExists {
    my ( $Self, %Param ) = @_;

    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $NotificationEventObject = $Kernel::OM->Get('Kernel::System::NotificationEvent');
    my $ValidObject             = $Kernel::OM->Get('Kernel::System::Valid');

    # check needed stuff
    NEEDED:
    for my $Needed (qw(Name)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %NotificationEventReversed = $NotificationEventObject->NotificationList(
        UserID => 1
    );
    %NotificationEventReversed = reverse %NotificationEventReversed;

    my $ItemID = $Self->_ItemReverseListGet( $Param{Name}, %NotificationEventReversed );
    return $ItemID if $ItemID;

    my $ValidID = $Param{ValidID} // $ValidObject->ValidLookup(
        Valid => 'valid',
    );
    my $NotificationEventID = $NotificationEventObject->NotificationAdd(
        %Param,
        ValidID => $ValidID,
        UserID  => 1,
    );

    return $NotificationEventID;
}

=head2 _StandardTemplateCreate()

create or update standard template

    my @StandardTemplateList = (
        {
            Name         => 'New Standard Template',
            Template     => 'Thank you for your email.',
            ContentType  => 'text/plain; charset=utf-8',
            TemplateType => 'Answer',                     # 'Answer', 'Create', 'Email', 'Forward', 'Note', 'PhoneCall'
            Comment      => '',                           # optional
            ValidID      => 1,
            UserID       => 1,
        },
    );

    my $Success = $ZnunyHelperObject->_StandardTemplateCreate( @StandardTemplateList );

Returns:

    my $Success = 1;

=cut

sub _StandardTemplateCreate {
    my ( $Self, @StandardTemplateList ) = @_;

    my $LogObject              = $Kernel::OM->Get('Kernel::System::Log');
    my $ValidObject            = $Kernel::OM->Get('Kernel::System::Valid');
    my $StandardTemplateObject = $Kernel::OM->Get('Kernel::System::StandardTemplate');

    my $Success = 1;

    NOTIFICATIONEVENT:
    for my $StandardTemplate (@StandardTemplateList) {
        next StandardTemplate if !IsHashRefWithData($StandardTemplate);

        # check needed stuff
        NEEDED:
        for my $Needed (qw(Name)) {

            next NEEDED if defined $StandardTemplate->{$Needed};

            $LogObject->Log(
                Priority => 'error',
                Message  => "Parameter '$Needed' is needed!",
            );
            return;
        }

        my %StandardTemplateReversed = $StandardTemplateObject->StandardTemplateList();
        %StandardTemplateReversed = reverse %StandardTemplateReversed;

        my $ItemID = $Self->_ItemReverseListGet( $StandardTemplate->{Name}, %StandardTemplateReversed );

        my $ValidID = $StandardTemplate->{ValidID} // $ValidObject->ValidLookup(
            Valid => 'valid',
        );

        if ($ItemID) {
            my $UpdateSuccess = $StandardTemplateObject->StandardTemplateUpdate(
                %{$StandardTemplate},
                ID      => $ItemID,
                ValidID => $ValidID,
                UserID  => 1,
            );

            if ( !$UpdateSuccess ) {
                $Success = 0;
            }
        }
        else {
            my $CreateID = $StandardTemplateObject->StandardTemplateAdd(
                %{$StandardTemplate},
                ValidID => $ValidID,
                UserID  => 1,
            );

            if ( !$CreateID ) {
                $Success = 0;
            }
        }
    }

    return $Success;
}

=head2 _GenericAgentCreate()

creates or updates generic agents

    my @GenericAgents = (
        {
            Name => 'JobName',
            Data => {
                Valid => '1',

                # Automatic execution (multiple tickets)
                ScheduleMinutes => [
                    '16'
                ],
                ScheduleHours => [
                    '4'
                ],
                ScheduleDays => [
                    '5'
                ],

                # Event based execution (single ticket)
                EventValues => [
                    'TicketCreate'
                    # SysConfig - Events###Ticket
                    # SysConfig - Events###Article
                ],

                # Select Tickets
                TicketNumber      => '1234',
                Title             => 'Title',
                CustomerID        => 'Kundennummer',
                CustomerUserLogin => 'Kundenbenutzer',
                From              => 'VonZnuny',
                To                => 'AnZnuny',
                Cc                => 'CCZnuny',
                Body              => 'Text',
                Subject           => 'Subject',
                ServiceIDs        => [
                    '1'
                ],
                SLAIDs => [
                    '1'
                ],
                PriorityIDs => [
                    '3'
                ],
                QueueIDs => [
                    '2',
                    '1'
                ],
                StateIDs => [
                    '4'
                ],
                OwnerIDs => [
                    '1'
                ],
                LockIDs => [
                    '1'
                ],
                Search_DynamicField_Text => '',

                EscalationResponseTimeSearchType => '',
                EscalationSolutionTimeSearchType => '',
                EscalationTimeSearchType         => '',
                EscalationUpdateTimeSearchType   => '',
                LastChangeTimeSearchType         => '',
                TimePendingSearchType => '',
                TimeSearchType        => '',
                ChangeTimeSearchType => '',
                CloseTimeSearchType  => '',

                # Update/Add Ticket Attributes
                NewPendingTime       => '',
                NewCustomerID        => 'Znuny',
                NewCustomerUserLogin => 'Customer',
                NewLockID            => '1',
                NewOwnerID           => '1',
                NewPendingTimeType   => '60',
                NewPriorityID        => '1',
                NewQueueID           => '2',
                NewSLAID             => '3',
                NewServiceID         => '7',
                NewStateID           => '1',
                NewTitle             => 'New Title',
                DynamicField_Text    => '',

                # Add Note
                NewNoteFrom      => 'support@znuny.com',
                NewNoteSubject   => 'Znuny Note Subject',
                NewNoteBody      => 'Znuny Note Text',
                NewNoteTimeUnits => '1604',

                # Execute Ticket Commands
                NewCMD                => '',
                NewSendNoNotification => '0',
                NewDelete             => '0',

                # Execute Custom Module
                NewModule      => '',
                NewParamKey1   => '',
                NewParamKey2   => '',
                NewParamKey3   => '',
                NewParamKey4   => '',
                NewParamKey5   => '',
                NewParamKey6   => '',
                NewParamValue1 => '',
                NewParamValue2 => '',
                NewParamValue3 => '',
                NewParamValue4 => '',
                NewParamValue5 => '',
                NewParamValue6 => '',
            },
            UserID => 1,
        },
    );

    my $Success = $ZnunyHelperObject->_GenericAgentCreate( @GenericAgents );

Returns:

    my $Success = 1;

=cut

sub _GenericAgentCreate {
    my ( $Self, @GenericAgents ) = @_;

    my $GenericAgentObject = $Kernel::OM->Get('Kernel::System::GenericAgent');

    # get all current dynamic fields
    my %GenericAgentList = $GenericAgentObject->JobList();

    # create or update generic agents
    GENERICAGENT:
    for my $NewGenericAgent (@GenericAgents) {

        my %NewGenericAgent = %{$NewGenericAgent};

        # check and delete if the generic agent already exists
        # no generic agent update function exists
        if ( $GenericAgentList{ $NewGenericAgent->{Name} } ) {

            my %ExistingJob = $GenericAgentObject->JobGet( Name => $GenericAgentList{ $NewGenericAgent{Name} } );

            # prepare jobs to diff correctly
            my %NewGenericAgentDiff = %NewGenericAgent;

            delete $NewGenericAgentDiff{UserID};
            delete $NewGenericAgentDiff{Name};

            my %ExistingJobDiff = (
                Data => {
                    %ExistingJob,
                },
            );

            delete $ExistingJobDiff{Data}->{Name};

            # diff both jobs
            my $IsDiff = DataIsDifferent(
                Data1 => \%ExistingJobDiff,
                Data2 => \%NewGenericAgentDiff,
            );

            # if both jobs are identical skip this GA
            next GENERICAGENT if !$IsDiff;

            $GenericAgentObject->JobDelete(
                Name   => $NewGenericAgent{Name},
                UserID => 1,
            );
        }

        # create generic agent
        $GenericAgentObject->JobAdd(
            UserID  => 1,
            ValidID => 1,
            %NewGenericAgent,
        );

    }

    return 1;
}

=head2 _GenericAgentCreateIfNotExists()

creates generic agents if not exists

    my @GenericAgents = (
        {
            Name => 'JobName',
            Data => {
                Valid => '1',
                # ...
                Title => 'Test'
            },
            UserID => 1,
        },
    );

    my $Success = $ZnunyHelperObject->_GenericAgentCreateIfNotExists( @GenericAgents );

Returns:

    my $Success = 1;

=cut

sub _GenericAgentCreateIfNotExists {
    my ( $Self, @GenericAgents ) = @_;

    my $GenericAgentObject = $Kernel::OM->Get('Kernel::System::GenericAgent');

    # get all current dynamic fields
    my %GenericAgentList = $GenericAgentObject->JobList();

    GENERICAGENT:
    for my $NewGenericAgent (@GenericAgents) {

        # check if the generic agent already exists
        next GENERICAGENT if $GenericAgentList{ $NewGenericAgent->{Name} };

        # create generic agent
        $GenericAgentObject->JobAdd(
            UserID  => 1,
            ValidID => 1,
            %{$NewGenericAgent},
        );
    }

    return 1;
}

=head2 _ArticleActionsAdd()

Adds article action menu items.

    my %ArticleActions = (
        Internal => [ # Channel name (Internal, Phone, Email or Invalid)
            {
                Key      => 'ZnunyMarkTicketSeenUnseen',
                Module   => 'Kernel::Output::HTML::ArticleAction::MyMenuItem',
                Priority => 999,
            },
        ],
    );

    my $Success = $ZnunyHelperObject->_ArticleActionsAdd(%ArticleActionMenuItems);

Returns:

    my $Success = 1;

=cut

sub _ArticleActionsAdd {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    my $ArticleActionConfig = $ConfigObject->Get('Ticket::Frontend::Article::Actions') // {};

    my @Settings;
    CHANNELNAME:
    for my $ChannelName ( sort keys %Param ) {

        next CHANNELNAME if !IsArrayRefWithData( $Param{$ChannelName} );

        for my $ArticleAction ( @{ $Param{$ChannelName} } ) {
            $ArticleActionConfig->{$ChannelName}->{ $ArticleAction->{Key} } = {
                Module => $ArticleAction->{Module},
                Prio   => $ArticleAction->{Priority},
                Valid  => 1,
            };
        }

        push @Settings, {
            Name           => 'Ticket::Frontend::Article::Actions###' . $ChannelName,
            EffectiveValue => $ArticleActionConfig->{$ChannelName},
            IsValid        => 1,
        };

    }

    my $SettingSet = $SysConfigObject->SettingsSet(
        UserID   => 1,
        Comments => 'Article action settings added by ZnunyHelper::_ArticleActionsAdd().',
        Settings => \@Settings,
    );

    return if !$SettingSet;

    return 1;
}

=head2 _ArticleActionsRemove()

Removes article action menu items.

    my %ArticleActions = (
        Internal => [ # Channel name (Internal, Phone, Email or Invalid)
            {
                Module   => 'Kernel::Output::HTML::ArticleAction::MyMenuItem',
                Priority => 999,
            },
        ],
    );

    my $Success = $ZnunyHelperObject->_ArticleActionsRemove(%ArticleActions);

Returns:

    my $Success = 1;

=cut

sub _ArticleActionsRemove {
    my ( $Self, %Param ) = @_;

    my $SysConfigObject = $Kernel::OM->Get('Kernel::System::SysConfig');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    my $ArticleActionConfig = $ConfigObject->Get('Ticket::Frontend::Article::Actions') // {};

    my @Settings;
    CHANNELNAME:
    for my $ChannelName ( sort keys %Param ) {

        next CHANNELNAME if !IsArrayRefWithData( $Param{$ChannelName} );

        for my $ArticleAction ( @{ $Param{$ChannelName} } ) {
            delete $ArticleActionConfig->{$ChannelName}->{ $ArticleAction->{Key} };
        }

        push @Settings, {
            Name           => 'Ticket::Frontend::Article::Actions###' . $ChannelName,
            EffectiveValue => $ArticleActionConfig->{$ChannelName},
            IsValid        => 1,
        };

    }

    my $SettingSet = $SysConfigObject->SettingsSet(
        UserID   => 1,
        Comments => 'Article action settings removed by ZnunyHelper::_ArticleActionsRemove().',
        Settings => \@Settings,
    );

    return if !$SettingSet;

    return 1;
}

1;
