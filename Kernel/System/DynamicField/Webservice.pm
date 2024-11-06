# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicField::Webservice;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Cache',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Ticket',
    'Kernel::System::Util',
    'Kernel::System::Web::Request',
);

use Kernel::System::VariableCheck qw(:all);
use File::Basename;

=head1 NAME

Kernel::System::DynamicField::Webservice - Dynamic field web service lib

=head1 PUBLIC INTERFACE

=head2 new()

    Don't use the constructor directly, use the ObjectManager instead:

    my $DynamicFieldWebserviceObject = $Kernel::OM->Get('Kernel::System::DynamicField::Webservice');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{RequiredAttributes} = [ 'Webservice', 'InvokerSearch', 'InvokerGet', 'Backend', 'StoredValue', ];
    $Self->{OptionalAttributes} = [
        'SearchKeys', 'CacheTTL', 'DisplayedValues', 'DisplayedValuesSeparator', 'Limit', 'AutocompleteMinLength',
        'QueryDelay', 'AdditionalDFStorage', 'InputFieldWidth', 'DefaultValue', 'Link',
    ];

    $Self->{SupportedDynamicFieldTypes} = {
        WebserviceDropdown    => 1,
        WebserviceMultiselect => 1,
    };

    $Self->{CacheType} = 'DynamicFieldWebservice';

    return $Self;
}

=head2 Test()

Tests given web-service configuration by connecting and querying the web-service.

    my $Result = $DynamicFieldWebserviceObject->Test(
        Config   => {
            Webservice               => $Param{Webservice},
            InvokerSearch            => $Param{InvokerSearch},
            InvokerGet               => $Param{InvokerGet},
            Backend                  => $Param{Backend},
            StoredValue              => $Param{StoredValue},
            DisplayedValues          => $Param{DisplayedValues},
            DisplayedValuesSeparator => $Param{DisplayedValuesSeparator},
            Limit                    => $Param{Limit},
            SearchTerms              => $Param{SearchTerms},
        },
        DynamicFieldName => 'DFName1',      # optional
        FieldType        => 'WebserviceDropdown',
        TicketID         => 65, # optional
        UserID           => 1,
        UserType         => 'Agent',                                        # optional 'Agent' or 'Customer'
    );

=cut

sub Test {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Config UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !IsHashRefWithData( $Param{Config} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Config' must be hash ref with data.",
        );
        return;
    }

    my $DynamicFieldConfig = $Param{Config};

    # needed for _DisplayValueAssemble
    $DynamicFieldConfig->{Name}      = $Param{DynamicFieldName};
    $DynamicFieldConfig->{Config}    = $Param{Config};
    $DynamicFieldConfig->{FieldType} = $Param{FieldType};

    my $Result = {
        Data    => [],
        Success => 0,
    };

    if ( !defined $DynamicFieldConfig->{StoredValue} || !length $DynamicFieldConfig->{StoredValue} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Missing web service config 'StoredValue'.",
        );
        return $Result;
    }

    my @StoredValue     = split /\s*,\s*/, $DynamicFieldConfig->{StoredValue};
    my @DisplayedValues = split /\s*,\s*/, $DynamicFieldConfig->{DisplayedValues};
    my %Attributes = map { $_ => 1 } ( 'DisplayValue', @StoredValue, @DisplayedValues );
    my @Attributes = sort keys %Attributes;

    my $Results = $Self->Search(
        DynamicFieldConfig => $DynamicFieldConfig,
        SearchTerms        => $Param{SearchTerms} || $DynamicFieldConfig->{SearchTerms} || '***',
        SearchType         => 'LIKE',
        TicketID           => $Param{TicketID},                                                     # optional
        UserID             => $Param{UserID},
        Attributes         => \@Attributes,
        UserType           => $Param{UserType},
    );

    if ( IsArrayRefWithData($Results) ) {
        for my $Data ( @{$Results} ) {
            my $DisplayValue = $Self->_DisplayValueAssemble(
                DynamicFieldConfig => $DynamicFieldConfig,
                Result             => $Data
            );
            $Data->{DisplayValue} = $DisplayValue;
        }
    }

    $Result->{Search}          = $Self->{Search};
    $Result->{Data}            = $Results;
    $Result->{StoredValue}     = \@StoredValue;
    $Result->{DisplayedValues} = \@DisplayedValues;
    $Result->{Attributes}      = \@Attributes;
    $Result->{Success}         = 1;

    return $Result;
}

=head2 Autocomplete()

Retrieves data for auto-complete list of given dynamic field config.

    my $Results = $DynamicFieldWebserviceObject->Autocomplete(
        DynamicFieldConfig => {},
        SearchTerms        => 'my search',
        TicketID           => 65, # optional
        UserID             => 1,
        UserType           => 'Agent',                # optional 'Agent' or 'Customer'
    );

    $Results is an (empty) array ref or undef on failure.

=cut

sub Autocomplete {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig SearchTerms)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    return if !IsHashRefWithData($BackendConfig);

    my $Results = $Self->Search(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
        SearchTerms        => $Param{SearchTerms},
        SearchKeys         => $Param{SearchKeys},
        SearchType         => 'LIKE',
        TicketID           => $Param{TicketID},                  # optional
        UserID             => $Param{UserID},
        UserType           => $Param{UserType},
        FieldValues        => $Param{GetParam}->{FieldValues},
    );

    return [] if !defined $Results;
    return [] if !IsArrayRefWithData($Results) && !IsHashRefWithData($Results);

    my @Results;
    for my $Result ( @{$Results} ) {

        my $StoredValue  = $Result->{ $BackendConfig->{StoredValue} } // '';
        my $DisplayValue = $Self->_DisplayValueAssemble(
            DynamicFieldConfig => $Param{DynamicFieldConfig},
            Result             => $Result,
        );

        push @Results, {
            StoredValue  => $StoredValue,
            DisplayValue => $DisplayValue,
        };
    }
    return \@Results;
}

=head2 AutoFill()

Retrieves data for auto-fill list of given dynamic field config.

    my $Results = $DynamicFieldWebserviceObject->AutoFill(
        DynamicFieldConfig => {},
        SearchTerms        => 'my search',
        TicketID           => 65, # optional
        UserID             => 1,
        UserType           => 'Agent',                # optional 'Agent' or 'Customer'
    );

    $Results is an (empty) array ref or undef on failure.

=cut

sub AutoFill {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig SearchTerms UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    return if !IsHashRefWithData($BackendConfig);

    my @AdditionalDFStorage = grep { $_->{Type} ne 'Backend' } @{ $BackendConfig->{AdditionalDFStorage} };
    my @Attributes          = map  { $_->{Key} } @AdditionalDFStorage;

    my $Results = $Self->Search(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
        SearchTerms        => $Param{SearchTerms},
        SearchKeys         => [ $BackendConfig->{StoredValue} ],
        SearchType         => 'EQUALS',
        Attributes         => \@Attributes,
        TicketID           => $Param{TicketID},                    # optional
        UserID             => $Param{UserID},
        UserType           => $Param{UserType},
    );

    my %AutoFill;
    for my $Storage (@AdditionalDFStorage) {
        my $DynamicField = $Storage->{DynamicField};
        my $Key          = $Storage->{Key};
        my $Value;

        if ( IsArrayRefWithData($Results) && scalar @{$Results} eq 1 ) {
            $Value = $Results->[0]->{$Key};
        }
        elsif ( IsArrayRefWithData($Results) ) {
            my @Values;
            for my $Result ( @{$Results} ) {
                push @Values, $Result->{$Key};
            }
            $Value = join ', ', @Values;
        }

        $AutoFill{$DynamicField} = $Value;
    }

    return \%AutoFill;
}

=head2 Search()

Executes search in configured dynamic field web-service.

    my $Results = $DynamicFieldWebserviceObject->Search(
        DynamicFieldConfig => $DynamicFieldConfig,
        SearchTerms        => 'searchstring',   # or array
        SearchType         => 'LIKE',           # LIKE | EQUALS
        SearchKeys         => 'Key',            # id, depends on web service
        Attributes         => [
            'Key',
            'Value',
            # or

            'Name',
            'ID',
        ],
        TicketID => 65, # optional
        UserID   => 1,
    );

    $Results is an (empty) array ref of the follwing form or undef on failure.

    my $Results = [
        {
            'Key'   => 'Znuny3',
            'Value' => 'Znuny3'
        },
        {
            'Key'   => 'Rocks4',
            'Value' => 'Rocks4'
        }
        # ...
    ];

    # or

    my $Results = [
        {
            'Key'  => 'Znuny3',
            'ID'   => 'Znuny3',
            'Name' => 'Znuny3'
        },
        {
            'Key'  => 'Rocks4',
            'ID'   => 'Rocks4',
            'Name' => 'Rocks4'
        }
        # ...
    ];

=cut

sub Search {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $UtilObject   = $Kernel::OM->Get('Kernel::System::Util');
    my $CacheObject  = $Kernel::OM->Get('Kernel::System::Cache');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig SearchTerms)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    $Param{SearchType} //= 'LIKE';
    my $SearchType = uc( $Param{SearchType} );

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    return if !IsHashRefWithData($BackendConfig);

    my $BackendObject = $Self->_BackendObjectGet(
        BackendConfig => $BackendConfig
    );
    return if !$BackendObject;

    # Assemble keys to select and also add column for stored value
    my @Attributes;
    if ( defined $BackendConfig->{DisplayedValues} && length $BackendConfig->{DisplayedValues} ) {
        @Attributes = split /\s*,\s*/, $BackendConfig->{DisplayedValues};
    }
    if ( IsArrayRefWithData( $Param{Attributes} ) ) {
        push @Attributes, @{ $Param{Attributes} };
    }
    unshift @Attributes, $BackendConfig->{StoredValue};

    # Reduce to unique selected keys.
    my %Attributes = map { $_ => 1 } @Attributes;
    @Attributes = keys %Attributes;

    # Assemble columns that will be searched
    my @SearchKeys;
    if ( IsArrayRefWithData( $Param{SearchKeys} ) ) {
        @SearchKeys = @{ $Param{SearchKeys} };
    }
    elsif (
        defined $BackendConfig->{SearchKeys}
        && length defined $BackendConfig->{SearchKeys}
        )
    {
        @SearchKeys = split /\s*,\s*/, $BackendConfig->{SearchKeys};
    }
    else {

        # Fallback: No search column given/configured, use column with stored value.
        @SearchKeys = ( $BackendConfig->{StoredValue} );
    }

    my %Data;
    if ( $Param{UserType} ) {
        my %AdditionalRequestData = $Self->AdditionalRequestDataGet(
            UserID   => $Param{UserID},
            UserType => $Param{UserType},
        );
        $Data{ $Param{UserType} } = \%AdditionalRequestData;
    }

    my $InvokerType = $SearchType eq 'EQUALS' ? 'InvokerGet' : 'InvokerSearch';
    my $InvokerName = $BackendConfig->{$InvokerType};

    # Remove configured fields.
    my $OmittedFields = $ConfigObject->Get(
        'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::OmittedFields'
    ) // {};

    if (
        defined $OmittedFields->{$InvokerName}
        && length $OmittedFields->{$InvokerName}
        )
    {
        my @HashKeys = split /\s*;\s*/, $OmittedFields->{$InvokerName};
        $UtilObject->DataStructureRemoveElements(
            Data     => \%Data,
            HashKeys => \@HashKeys,
        );
    }

    # Base-64 encode configured field values.
    my $Base64EncodedFields = $ConfigObject->Get(
        'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::Base64EncodedFields'
    ) // {};

    if (
        defined $Base64EncodedFields->{$InvokerName}
        && length $Base64EncodedFields->{$InvokerName}
        )
    {
        my @HashKeys = split /\s*;\s*/, $Base64EncodedFields->{$InvokerName};
        $UtilObject->Base64DeepEncode(
            Data     => \%Data,
            HashKeys => \@HashKeys,
        );
    }

    my @RequestResults;

    if ( IsHashRefWithData( $Param{FieldValues} ) ) {
        %Data = ( %Data, %{ $Param{FieldValues} } );
    }

    if ( !$Data{TicketID} ) {
        my $IsFrontendContext = $UtilObject->IsFrontendContext();

        if ( $Param{TicketID} ) {
            $Data{TicketID} = $Param{TicketID};
        }
        elsif ($IsFrontendContext) {

            # Fallback: Try to get ticket ID from param object.
            my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');
            $Data{TicketID} = $ParamObject->GetParam( Param => 'TicketID' );

            # Fallback: Try to get ticket ID from layout object.
            if ( !$Data{TicketID} ) {
                my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
                $Data{TicketID} = $LayoutObject->{TicketID};
            }
        }
    }

    # Use one request per search term if InvokerGet is being used because
    # some web services don't report the needed data when using InvokerSearch for this.
    if ( $InvokerType eq 'InvokerGet' ) {
        my $SearchTerms = $Param{SearchTerms};
        if ( ref $SearchTerms ne 'ARRAY' ) {
            $SearchTerms = [$SearchTerms];
        }

        SEARCHTERM:
        for my $SearchTerm ( @{$SearchTerms} ) {
            my %RequestData = (
                InvokerType => $InvokerType,
                Invoker     => $InvokerName,
                SearchTerms => $SearchTerm,
                UserID      => $Param{UserID},
            );

            my $CacheKey = $Param{DynamicFieldConfig}->{Name}
                . '::'
                . $InvokerType
                . '::'
                . $InvokerName
                . '::'
                . $SearchTerm
                . '::'
                . $Param{UserID};

            my $Results;
            if ( $BackendConfig->{CacheTTL} ) {
                $Results = $CacheObject->Get(
                    Type => $Self->{CacheType},
                    Key  => $CacheKey,
                );
            }
            my $RequestExecuted;
            if ( !defined $Results ) {
                $Results = $BackendObject->Request(
                    %{$BackendConfig},
                    %RequestData,
                    Data => \%Data,
                );

                $RequestExecuted = 1;
            }

            next SEARCHTERM if !IsArrayRefWithData($Results) && !IsHashRefWithData($Results);

            if ( !IsArrayRefWithData($Results) ) {
                $Results = [$Results];
            }

            if (
                $BackendConfig->{CacheTTL}
                && $RequestExecuted
                )
            {
                $CacheObject->Set(
                    Type  => $Self->{CacheType},
                    Key   => $CacheKey,
                    Value => $Results,
                    TTL   => $BackendConfig->{CacheTTL},
                );
            }

            push @RequestResults, @{$Results};
        }
    }

    # Use combined request for all search terms when using InvokerSearch.
    else {
        my %RequestData = (
            InvokerType => $InvokerType,
            Invoker     => $InvokerName,
            SearchTerms => $Param{SearchTerms},
            UserID      => $Param{UserID},
        );

        my $CacheKey = $Param{DynamicFieldConfig}->{Name}
            . '::'
            . $InvokerType
            . '::'
            . $InvokerName
            . '::'
            . $Param{SearchTerms}
            . '::'
            . $Param{UserID};

        my $Results;
        if ( $BackendConfig->{CacheTTL} ) {
            $Results = $CacheObject->Get(
                Type => $Self->{CacheType},
                Key  => $CacheKey,
            );
        }
        my $RequestExecuted;
        if ( !defined $Results ) {
            $Results = $BackendObject->Request(
                %{$BackendConfig},
                %RequestData,
                Data => \%Data,
            );

            $RequestExecuted = 1;
        }

        return if !IsArrayRefWithData($Results) && !IsHashRefWithData($Results);

        if ( !IsArrayRefWithData($Results) ) {
            $Results = [$Results];
        }

        if (
            $BackendConfig->{CacheTTL}
            && $RequestExecuted
            )
        {
            $CacheObject->Set(
                Type  => $Self->{CacheType},
                Key   => $CacheKey,
                Value => $Results,
                TTL   => $BackendConfig->{CacheTTL},
            );
        }

        push @RequestResults, @{$Results};
    }

    my @Results;

    RESULT:
    for my $Result (@RequestResults) {
        my %SearchKeyValue;

        KEY:
        for my $Key ( %{$Result} ) {
            my $KeyExists = grep { $Key eq $_ } @SearchKeys;
            next KEY if !$KeyExists;

            $SearchKeyValue{$Key} = $Result->{$Key};
        }

        # if search keys 'SearchKeys' are stored in dynamic field config,
        # use the additional filter with $SearchType
        if ( $BackendConfig->{SearchKeys} && $SearchType eq 'EQUALS' ) {
            if ( IsArrayRefWithData( $Param{SearchTerms} ) ) {
                my $FoundSearchTermInSearchKey;

                SEARCHTERM:
                for my $SearchTerm ( @{ $Param{SearchTerms} } ) {
                    my @FoundSearchTermInSearchKey = grep { $_ =~ m{\A$SearchTerm\z} } sort values %SearchKeyValue;
                    next SEARCHTERM if !@FoundSearchTermInSearchKey;

                    $FoundSearchTermInSearchKey = 1;
                    last SEARCHTERM;
                }
                next RESULT if !$FoundSearchTermInSearchKey;
            }
            else {
                my @FoundSearchTermInSearchKey = grep { $_ =~ m{\A$Param{SearchTerms}\z} } sort values %SearchKeyValue;
                next RESULT if !@FoundSearchTermInSearchKey;
            }
        }
        elsif ( $BackendConfig->{SearchKeys} && $SearchType eq 'LIKE' ) {
            if ( IsArrayRefWithData( $Param{SearchTerms} ) ) {
                my $FoundSearchTermInSearchKey;

                SEARCHTERM:
                for my $SearchTerm ( @{ $Param{SearchTerms} } ) {

                    my $LCSearchTerms              = lc($SearchTerm);
                    my @FoundSearchTermInSearchKey = grep { lc($_) =~ m{$LCSearchTerms} } sort values %SearchKeyValue;
                    next SEARCHTERM if !@FoundSearchTermInSearchKey;

                    $FoundSearchTermInSearchKey = 1;
                    last SEARCHTERM;
                }
                next RESULT if !$FoundSearchTermInSearchKey;
            }
            elsif ( IsStringWithData( $Param{SearchTerms} ) && $Param{SearchTerms} !~ m{\A(\*)+\z} ) {
                my $LCSearchTerms              = lc( $Param{SearchTerms} );
                my @FoundSearchTermInSearchKey = grep { lc($_) =~ m{$LCSearchTerms} } sort values %SearchKeyValue;
                next RESULT if !@FoundSearchTermInSearchKey;
            }
        }

        my %Data;
        for my $Attribute (@Attributes) {
            my $Value = $Result->{$Attribute};
            if ( !IsStringWithData($Value) ) {
                $Value = '';
            }
            $Data{$Attribute} = $Value;
        }

        push @Results, \%Data;
    }

    return \@Results;
}

=head2 AdditionalRequestDataGet()

Returns additional data for request. Agent (User) or Customer (CustomerUser) data.

    my %Data = $DynamicFieldWebserviceObject->AdditionalRequestDataGet(
        UserID   => 123,
        UserType => 'Agent',            # optional (Agent|Customer)
    );

Returns:

    my %Data = $DynamicFieldWebserviceObject->AdditionalRequestDataGet(
        UserID   => 123,
        UserType => 'Agent',            # optional (Agent|Customer)
    );

    my %Data = (
        'UserID'                       => 1,
        'UserEmail'                    => 'root@localhost',
        'UserFirstname'                => 'Admin',
        'UserFullname'                 => 'Admin OTRS',
        'UserLastLogin'                => '1629733655',
        'UserLastname'                 => 'OTRS',
        'UserLogin'                    => 'root@localhost',
        [...]
    );

    # or

    my %Data = $DynamicFieldWebserviceObject->AdditionalRequestDataGet(
        UserID   => 123,
        UserType => 'Customer',            # optional (Agent|Customer)
    );

    my %Data = (
        'UserLogin'              => '9326500963200000',
        'UserID'                 => '9326500963200000',
        'UserFirstname'          => 'Firstname',
        'UserLastname'           => 'Lastname',
        'UserFullname'           => 'Firstname Lastname',
        'UserEmail'              => 'znuny@localunittest.com',
        'UserCustomerID'         => 'znuny',
        'Source'                 => 'CustomerUser',
        [...]
    );

=cut

sub AdditionalRequestDataGet {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    NEEDED:
    for my $Needed (qw(UserID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %Data;
    if ( $Param{UserType} ) {

        my %BackendMap = (
            Agent    => 'Kernel::System::User',
            Customer => 'Kernel::System::CustomerUser',
        );
        my %FunctionMap = (
            Agent    => 'GetUserData',
            Customer => 'CustomerUserDataGet',
        );
        my %KeyMap = (
            Agent    => 'UserID',
            Customer => 'User',
        );
        return %Data if !$BackendMap{ $Param{UserType} };

        my $UserBackendObject = $Kernel::OM->Get( $BackendMap{ $Param{UserType} } );
        return %Data if !$UserBackendObject;

        return %Data if !$FunctionMap{ $Param{UserType} };

        my $Function = $FunctionMap{ $Param{UserType} };
        return %Data if !$Function;

        if ( $UserBackendObject->can($Function) ) {
            %Data = $UserBackendObject->$Function(
                $KeyMap{ $Param{UserType} } => $Param{UserID},
            );
        }

        my $Data = $TicketObject->_TicketDeepGetDataCleanUp(
            Data => \%Data,
        );
        %Data = %{$Data};
    }

    return %Data;
}

=head2 AdditionalDynamicFieldValuesStore()

stores additional values from web-service in dynamic fields

    my $Success = $DynamicFieldWebserviceObject->AdditionalDynamicFieldValuesStore(
        DynamicFieldConfig => {},
        TicketID           => 1234,
        UserID             => 1234,
    );

    my $Success = 1;

=cut

sub AdditionalDynamicFieldValuesStore {
    my ( $Self, %Param ) = @_;

    my $LogObject                 = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject              = $Kernel::OM->Get('Kernel::System::Ticket');
    my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    NEEDED:
    for my $Needed (qw( DynamicFieldConfig TicketID UserID )) {
        next NEEDED if $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Need $Needed!"
        );
        return;
    }

    return if !$Self->{SupportedDynamicFieldTypes}->{ $Param{DynamicFieldConfig}->{FieldType} };
    return if $Param{DynamicFieldConfig}->{ObjectType} ne 'Ticket';
    return if !IsArrayRefWithData( $Param{DynamicFieldConfig}->{Config}->{AdditionalDFStorage} );

    my @AdditionalDFStorage = @{ $Param{DynamicFieldConfig}->{Config}->{AdditionalDFStorage} };
    return if !@AdditionalDFStorage;

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    if ( !$BackendConfig ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "No web service config found for dynamic field '$Param{DynamicFieldConfig}->{Name}'.",
        );

        return;
    }

    # Fetch stored value of dynamic field which contains "ID" of record from which to fetch
    # values for the configured additional dynamic field storage.
    my %Ticket = $TicketObject->TicketGet(
        TicketID      => $Param{TicketID},
        UserID        => $Param{UserID},
        DynamicFields => 1,
    );
    return if !%Ticket;

    my $DynamicFieldValue = $Ticket{ 'DynamicField_' . $Param{DynamicFieldConfig}->{Name} };
    return if !defined $DynamicFieldValue;

    @AdditionalDFStorage = grep { $_->{Type} ne 'Frontend' } @AdditionalDFStorage;
    my @Attributes = map { $_->{Key} } @AdditionalDFStorage;

    # Fetch record.
    my $Results = $Self->Search(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
        SearchTerms        => $DynamicFieldValue,
        SearchKeys         => [ $BackendConfig->{StoredValue}, ],
        SearchType         => 'EQUALS',
        UserID             => $Param{UserID},
        Attributes         => \@Attributes,
        UserType           => $Param{UserType},
    );

    return 1 if !IsArrayRefWithData($Results);

    STORAGE:
    for my $Storage (@AdditionalDFStorage) {
        my $DynamicField = $Storage->{DynamicField};
        my $Key          = $Storage->{Key};
        my $Type         = $Storage->{Type};
        my $Value;

        next STORAGE if $Type eq 'Frontend';

        my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
            Name => $DynamicField,
        );
        next STORAGE if !IsHashRefWithData($DynamicFieldConfig);
        next STORAGE if $DynamicFieldConfig->{ObjectType} ne 'Ticket';

        if ( IsArrayRefWithData($Results) && scalar @{$Results} eq 1 ) {
            $Value = $Results->[0]->{$Key} // '';
        }
        elsif ( IsArrayRefWithData($Results) ) {

            my @Values;
            for my $Result ( @{$Results} ) {
                push @Values, $Result->{$Key};
            }
            $Value = join ', ', @Values;
        }

        if ( defined $Value && length $Value ) {
            $DynamicFieldBackendObject->ValueSet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ObjectID           => $Param{TicketID},
                Value              => $Value,
                UserID             => $Param{UserID},
            );

            next STORAGE;
        }

        $DynamicFieldBackendObject->ValueDelete(
            DynamicFieldConfig => $DynamicFieldConfig,
            ObjectID           => $Param{TicketID},
            UserID             => $Param{UserID},
        );
    }

    return 1;
}

=head2 DisplayValueGet()

Fetches display value(s) for given dynamic field config and value(s).
Hashref is used for BuildSelection or input fields.

    my $DisplayValue = $DynamicFieldWebserviceObject->DisplayValueGet(
        DynamicFieldConfig => {},
        Value              => 'My value', # or array of values
        TicketID           => 65, # optional
        UserID             => 1, # optional
    );

    If one value was given, it returns its display value as a string
    or the given value if no display value could be found.

    If an array of values was given (even with only one element), it returns a hash reference:
    my $DisplayValues = {
        'My value 1' => 'My display value 1',
        'My value 2' => 'My value 2', # if display value was not found
    };

=cut

sub DisplayValueGet {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig Value)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !IsStringWithData( $Param{Value} ) && !IsArrayRefWithData( $Param{Value} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Value' must be a string or an array ref with data.",
        );
        return;
    }

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    return if !$BackendConfig;

    # Assemble default display value(s)
    my $DisplayValue;
    if ( IsArrayRefWithData( $Param{Value} ) ) {
        $DisplayValue = {};
        %{$DisplayValue} = map { $_ => $_ } @{ $Param{Value} };
    }
    else {
        $DisplayValue = $Param{Value};
    }

    my @SearchKeys;
    if (
        defined $BackendConfig->{SearchKeys}
        && length defined $BackendConfig->{SearchKeys}
        )
    {
        @SearchKeys = split /\s*,\s*/, $BackendConfig->{SearchKeys};
    }

    # Also add stored value key to search keys so that the displayed value
    # can be found by its stored value.
    my $StoredValueInSearchKeys = grep { $_ eq $BackendConfig->{StoredValue} } @SearchKeys;
    if ( !$StoredValueInSearchKeys ) {
        unshift @SearchKeys, $BackendConfig->{StoredValue};
    }

    my $Results = $Self->Search(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
        SearchTerms        => $Param{Value},
        SearchType         => 'EQUALS',
        SearchKeys         => \@SearchKeys,
        TicketID           => $Param{TicketID},             # optional
        UserID             => $Param{UserID} || 1,
        UserType           => $Param{UserType},
    );

    return $DisplayValue if !IsArrayRefWithData($Results);

    if ( IsHashRefWithData($DisplayValue) ) {
        for my $Result ( @{$Results} ) {
            $DisplayValue->{ $Result->{ $BackendConfig->{StoredValue} } } = $Self->_DisplayValueAssemble(
                DynamicFieldConfig => $Param{DynamicFieldConfig},
                Result             => $Result,
            );
        }
    }
    else {
        my $Result = shift @{$Results};
        $DisplayValue = $Self->_DisplayValueAssemble(
            DynamicFieldConfig => $Param{DynamicFieldConfig},
            Result             => $Result,
        );
    }

    return $DisplayValue;
}

=head2 _DisplayValueAssemble()

Assembles display value for given web-service result hash (after search).

    my $DisplayValue = $DynamicFieldWebserviceObject->_DisplayValueAssemble(
        DynamicFieldConfig => {},
        Result             => {
            Key   => 'value col 1',
            Value => 'value col 2',
            # ...
        },
    );

    my $DisplayValue = 'value col 1 - value col 2';

=cut

sub _DisplayValueAssemble {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig Result)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !IsHashRefWithData( $Param{Result} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'Result' must be hash ref with data.",
        );
        return;
    }

    my $BackendConfig = $Self->_BackendConfigGet(
        DynamicFieldConfig => $Param{DynamicFieldConfig},
    );
    return if !$BackendConfig;

    my $DisplaySeparator = $Self->_DisplaySeparatorGet(
        DisplaySeparator => $BackendConfig->{DisplayedValuesSeparator},
    );

    my $DisplayKeyValuesConfig = $BackendConfig->{DisplayedValues};
    if ( !defined $BackendConfig->{DisplayedValues} || !length $BackendConfig->{DisplayedValues} ) {
        $DisplayKeyValuesConfig = $BackendConfig->{StoredValue};
    }
    return if !$DisplayKeyValuesConfig;

    my @DisplayKeyValues = split /\s*,\s*/, $DisplayKeyValuesConfig;
    my $DisplayValue;
    for my $DisplayKeyValue (@DisplayKeyValues) {
        if ( defined $DisplayValue ) {
            $DisplayValue .= $DisplaySeparator;
        }

        $DisplayValue .= $Param{Result}->{$DisplayKeyValue} // '';
    }

    return $DisplayValue;
}

=head2 _DisplaySeparatorGet()

Returns the display keys separator to use.

    my $DisplaySeparator = $DynamicFieldWebserviceObject->_DisplaySeparatorGet(
        DisplaySeparator => '', # this (or omitting the parameter) will be turned into ' '
    );

=cut

sub _DisplaySeparatorGet {
    my ( $Self, %Param ) = @_;

    my $DisplaySeparator = $Param{DisplaySeparator};
    if ( !defined $DisplaySeparator || !length $DisplaySeparator ) {
        $DisplaySeparator = ' ';
    }

    # Add space to separator if <space> or <SPACE> exists (dynamic field admin will remove them when saving settings).
    $DisplaySeparator =~ s{\<space\>}{ }xgsi;

    return $DisplaySeparator;
}

=head2 Template()

Returns the current value or values as string according to the desired template.
This function is only needed for WebserviceMultiselect (multiselect).

    my $Value = $DynamicFieldWebserviceObject->Template(
        DynamicFieldConfig => \%DynamicFieldConfig,
        Value              => ['first','second', 'third'], # or a scalar value
        Type               => 'Value', # optional; or 'Title'
        ContentType        => 'ASCII', # optional; 'HTML' is default,
        TemplateType       => 'default', # optional; or: 'separator', 'wordwrap', 'list'
    );

Returns:

    my $Value = 'first, second, third';                                     # default
    my $Value = 'first second third';                                       # separator '<space>'
    my $Value = 'first<br>second<br>third';                                 # wordwrap 'HTML'
    my $Value = 'first\nsecond\nthird';                                     # wordwrap 'ASCII'
    my $Value = '<ul><li>first<\li><li>second<\li><li>third<\li></ul>';     # list 'HTML'
    my $Value = '- first\n- second\n- third';                               # list 'ASCII'

=cut

sub Template {
    my ( $Self, %Param ) = @_;

    my $LogObject       = $Kernel::OM->Get('Kernel::System::Log');
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');
    my $LayoutObject    = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ConfigObject    = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig Value)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @Values;
    if ( ref $Param{Value} eq 'ARRAY' ) {
        @Values = @{ $Param{Value} };
    }
    else {
        @Values = ( $Param{Value} );
    }

    # we have to create a map for some templates.
    my %ActionTemplateMap = (
        AgentTicketZoom => {
            Value => {
                ContentType  => 'HTML',
                TemplateType => 'wordwrap',
            },
            Title => {
                ContentType  => 'ASCII',
                TemplateType => 'wordwrap',
            },
        },
    );

    my $ContentType = 'HTML';
    if ( !$ConfigObject->Get('Frontend::RichText') ) {
        $ContentType = 'ASCII';
    }

    my $TemplateType = $Param{DynamicFieldConfig}->{Config}->{TemplateType} || 'default';

    if ( $Param{LayoutObject}->{Action} && $Param{Type} ) {
        $ContentType
            = $ActionTemplateMap{ $Param{LayoutObject}->{Action} }->{ $Param{Type} }->{ContentType} || $ContentType;
        $TemplateType
            = $ActionTemplateMap{ $Param{LayoutObject}->{Action} }->{ $Param{Type} }->{TemplateType} || $TemplateType;
    }

    if ( $Param{ContentType} ) {
        $ContentType = $Param{ContentType};
    }

    if ( $Param{TemplateType} ) {
        $TemplateType = $Param{TemplateType};
    }

    my $ConfigSeparator      = $Param{DynamicFieldConfig}->{Config}->{DisplayedValuesSeparator};
    my %TemplateSeparatorMap = (
        default   => ', ',
        separator => $ConfigSeparator || ', ',
        wordwrap  => '<br>',
        list      => '</li><li>',
    );

    my $Separator = $TemplateSeparatorMap{$TemplateType};
    $Separator = $Self->_DisplaySeparatorGet(
        DisplaySeparator => $Separator,
    );

    my $Value = join( $Separator, @Values );
    if ( $TemplateType eq 'list' ) {
        $Value = '<ul><li>' . $Value . '</li></ul>';
    }

    return $Value if $ContentType ne 'ASCII';

    $Value = $HTMLUtilsObject->ToAscii( String => $Value );

    return $Value;
}

=head2 TemplateTypeList()

Returns a list of template types.
This function is only needed for WebserviceMultiselect (multiselect).

    my %TemplateTypeList = $Object->TemplateTypeList();

Returns:

    my %TemplateTypeList = (
        default   => 'default',
        separator => 'separator',
        wordwrap  => 'wordwrap',
        list      => 'list',
    );

=cut

sub TemplateTypeList {
    my ( $Self, %Param ) = @_;

    my %TemplateTypeList = (
        default   => 'Default',
        separator => 'Separator',
        wordwrap  => 'Word wrap',
        list      => 'List',
    );

    return %TemplateTypeList;
}

=head2 BackendList()

Returns a list of backends which can be used for this dynamic field web service.

    my %BackendList = $DynamicFieldWebserviceObject->BackendList();

Returns:

    my %BackendList = (
        DirectRequest => DirectRequest,
    );

=cut

sub BackendList {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Home         = $ConfigObject->Get('Home');
    my @BackendFiles = $MainObject->DirectoryRead(
        Directory => $Home . '/Kernel/System/DynamicField/Webservice',
        Filter    => '*.pm'
    );

    my %BackendList;
    BACKENDFILE:
    for my $BackendFile (@BackendFiles) {
        $BackendFile = basename $BackendFile;

        ( my $Backend = $BackendFile ) =~ s/\.[^.]+$//;
        next BACKENDFILE if $Backend eq 'Base';

        $BackendList{$Backend} = $Backend;
    }

    return %BackendList;
}

=head2 BackendListGet()

Returns a list of backends which can be used for this dynamic field web service.

    my %BackendListGet = $DynamicFieldWebserviceObject->BackendListGet();

Returns:

    my %BackendListGet = (
        DirectRequest => DirectRequest,
    );

=cut

sub BackendListGet {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    my $Home         = $ConfigObject->Get('Home');
    my @BackendFiles = $MainObject->DirectoryRead(
        Directory => $Home . '/Kernel/System/DynamicField/Webservice',
        Filter    => '*.pm'
    );

    my %BackendListGet;
    BACKENDFILE:
    for my $BackendFilePath (@BackendFiles) {
        my $ModuleFile = $BackendFilePath;
        ( my $Module = $ModuleFile ) =~ s/$Home//;

        my $BackendFile = basename $BackendFilePath;
        ( my $Backend = $BackendFile ) =~ s/\.[^.]+$//;
        next BACKENDFILE if $Backend eq 'Base';

        my $BaseClassName = "Kernel::System::DynamicField::Webservice::$Backend";
        my $BackendObject = $Kernel::OM->Get($BaseClassName);

        my $Documentation = 'There is no information for this backend.';
        if ( $BackendObject->can('Documentation') ) {
            $Documentation = $BackendObject->Documentation();
        }

        $BackendListGet{$Backend} = {
            Name          => $Backend,
            Module        => $Module,
            Documentation => $Documentation,
        };

    }

    return %BackendListGet;
}

=head2 _BackendConfigGet

Fetches backend config (web-service) of dynamic field.

    my $BackendConfig = $DynamicFieldWebserviceObject->_BackendConfigGet(
        DynamicFieldConfig => {},
    );

    my $BackendConfig = {
        Backend       => 'DirectRequest',
        InvokerSearch => 'TestSearch',
        InvokerGet    => 'TestGet',
        Webservice    => 'DynamicFieldWebserviceTest'
    };

=cut

sub _BackendConfigGet {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(DynamicFieldConfig)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !$Self->{SupportedDynamicFieldTypes}->{ $Param{DynamicFieldConfig}->{FieldType} } ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Unsupported dynamic field type $Param{DynamicFieldConfig}->{FieldType}.",
        );
        return;
    }

    my $BackendConfig;
    my %DefaultValues = (
        Backend         => 'DirectRequest',
        StoredValue     => 'Key',
        DisplayedValues => '',
        DefaultValue    => '',
        Link            => '',
    );

    BACKENDCONFIGFIELD:
    for my $BackendConfigField ( @{ $Self->{RequiredAttributes} } ) {
        $BackendConfig->{$BackendConfigField}
            = $Param{DynamicFieldConfig}->{Config}->{$BackendConfigField} || $DefaultValues{$BackendConfigField};
        next BACKENDCONFIGFIELD
            if defined $BackendConfig->{$BackendConfigField} && length $BackendConfig->{$BackendConfigField};

        $LogObject->Log(
            Priority => 'error',
            Message =>
                "Config option $BackendConfigField is not defined for dynamic field $Param{DynamicFieldConfig}->{Name}.",
        );
        return;
    }

    BACKENDCONFIGFIELD:
    for my $BackendConfigField ( @{ $Self->{OptionalAttributes} } ) {
        $BackendConfig->{$BackendConfigField} = $Param{DynamicFieldConfig}->{Config}->{$BackendConfigField};

        next BACKENDCONFIGFIELD
            if defined $BackendConfig->{$BackendConfigField} && length $BackendConfig->{$BackendConfigField};

        $BackendConfig->{$BackendConfigField} = $DefaultValues{$BackendConfigField};
    }

    return $BackendConfig;
}

=head2 _BackendObjectGet

Fetches backend object (web-service) to access web-service of dynamic field.

    my $BackendObject = $DynamicFieldWebserviceObject->_BackendObjectGet(
        BackendConfig => {
            Backend       => 'DirectRequest',
            InvokerSearch => 'TestSearch',
            InvokerGet    => 'TestGet',
            Webservice    => 'DynamicFieldWebserviceTest'
        },
    );

=cut

sub _BackendObjectGet {
    my ( $Self, %Param ) = @_;

    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');
    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    NEEDED:
    for my $Needed (qw(BackendConfig)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    if ( !IsHashRefWithData( $Param{BackendConfig} ) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'BackendConfig' must be hash ref with data.",
        );
        return;
    }

    NEEDED:
    for my $Needed (qw(Webservice InvokerSearch InvokerGet)) {
        next NEEDED if defined $Param{BackendConfig}->{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $BackendConfig = $Param{BackendConfig};
    $BackendConfig->{Backend} ||= 'DirectRequest';

    my $BaseClassName = "Kernel::System::DynamicField::Webservice::$BackendConfig->{Backend}";

    if ( !$MainObject->RequireBaseClass($BaseClassName) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Could not load webservice backend class $BaseClassName.",
        );
        return;
    }

    my $BackendObject = $Kernel::OM->Get($BaseClassName);

    NEEDED:
    for my $Needed (qw(Webservice InvokerSearch InvokerGet)) {
        $BackendObject->{$Needed} = $Param{BackendConfig}->{$Needed};
    }

    return $BackendObject;
}

1;
