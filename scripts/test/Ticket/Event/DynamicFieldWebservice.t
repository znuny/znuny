# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $HelperObject              = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
my $ConfigObject              = $Kernel::OM->Get('Kernel::Config');
my $ZnunyHelperObject         = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $UnitTestWebserviceObject  = $Kernel::OM->Get('Kernel::System::UnitTest::Webservice');
my $WebserviceObject          = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

my %Param;
$Param{WebserviceName}   = 'DynamicFieldWebservice';
$Param{DynamicFieldName} = $Param{WebserviceName} . 'Event';

$Param{InvokerSearch}            = 'TestSearch';
$Param{InvokerGet}               = 'TestGet';
$Param{Webservice}               = $Param{WebserviceName};
$Param{Backend}                  = 'DirectRequest';
$Param{StoredValue}              = 'Key';
$Param{SearchKeys}               = 'Key';
$Param{DisplayedValues}          = 'Key,Value';
$Param{DisplayedValuesSeparator} = '|';
$Param{Limit}                    = 1;
$Param{AutocompleteMinLength}    = 3;
$Param{SearchTerms}              = 'Znuny';

$ZnunyHelperObject->_WebserviceCreate(
    Webservices => {
        $Param{WebserviceName} => 'scripts/test/sample/Webservice/' . $Param{WebserviceName} . '.yml',
    }
);
my $Webservice = $WebserviceObject->WebserviceGet(
    Name => $Param{WebserviceName},
);

$Self->True(
    $Webservice,
    "WebserviceGet() - $Param{WebserviceName}",
);

my @Tests = (

    # WebserviceDropdown
    {
        Name         => 'WebserviceDropdown - SearchKey - Key',
        DynamicField => {
            Name       => $Param{DynamicFieldName} . 'Dropdown',
            Label      => $Param{DynamicFieldName} . 'Dropdown',
            ObjectType => 'Ticket',
            FieldType  => 'WebserviceDropdown',
            Config     => {
                InvokerSearch            => $Param{InvokerSearch},
                InvokerGet               => $Param{InvokerGet},
                Webservice               => $Param{Webservice},
                Backend                  => $Param{Backend},
                StoredValue              => $Param{StoredValue},
                SearchKeys               => $Param{SearchKeys},
                DisplayedValues          => $Param{DisplayedValues},
                DisplayedValuesSeparator => $Param{DisplayedValuesSeparator},
                Limit                    => $Param{Limit},
                AutocompleteMinLength    => $Param{AutocompleteMinLength},
                SearchTerms              => $Param{SearchTerms},
            },
            Value => 'Znuny',
        },
        DynamicFieldData => [
            {
                Name          => 'UnitTestDynamicFieldKey',
                Key           => 'Key',
                ExpectedValue => 'Znuny',
            },
        ],
    },
    {
        Name         => 'WebserviceDropdown - SearchKey - Key and Value',
        DynamicField => {
            Name       => $Param{DynamicFieldName} . 'Dropdown',
            Label      => $Param{DynamicFieldName} . 'Dropdown',
            ObjectType => 'Ticket',
            FieldType  => 'WebserviceDropdown',
            Config     => {
                InvokerSearch            => $Param{InvokerSearch},
                InvokerGet               => $Param{InvokerGet},
                Webservice               => $Param{Webservice},
                Backend                  => $Param{Backend},
                StoredValue              => $Param{StoredValue},
                SearchKeys               => $Param{SearchKeys},
                DisplayedValues          => $Param{DisplayedValues},
                DisplayedValuesSeparator => $Param{DisplayedValuesSeparator},
                Limit                    => $Param{Limit},
                AutocompleteMinLength    => $Param{AutocompleteMinLength},
                SearchTerms              => $Param{SearchTerms},
            },
            Value => 'Znuny',
        },
        DynamicFieldData => [
            {
                Name          => 'UnitTestDynamicFieldKey',
                Key           => 'Key',
                ExpectedValue => 'Znuny',
            },
            {
                Name          => 'UnitTestDynamicFieldValue',
                Key           => 'Value',
                ExpectedValue => 'Znuny',
            },
        ],
    },

    # WebserviceMultiselect
    {
        Name         => 'WebserviceMultiselect - SearchKey - Key',
        DynamicField => {
            Name       => $Param{DynamicFieldName} . 'Multiselect',
            Label      => $Param{DynamicFieldName} . 'Multiselect',
            ObjectType => 'Ticket',
            FieldType  => 'WebserviceMultiselect',
            Config     => {
                InvokerSearch            => $Param{InvokerSearch},
                InvokerGet               => $Param{InvokerGet},
                Webservice               => $Param{Webservice},
                Backend                  => $Param{Backend},
                StoredValue              => $Param{StoredValue},
                SearchKeys               => $Param{SearchKeys},
                DisplayedValues          => $Param{DisplayedValues},
                DisplayedValuesSeparator => $Param{DisplayedValuesSeparator},
                Limit                    => $Param{Limit},
                AutocompleteMinLength    => $Param{AutocompleteMinLength},
                SearchTerms              => $Param{SearchTerms},
            },
            Value => [
                'Znuny',
            ],
        },
        DynamicFieldData => [
            {
                Name          => 'UnitTestDynamicFieldKey',
                Key           => 'Key',
                ExpectedValue => 'Znuny',
            },
        ],
    },
    {
        Name         => 'WebserviceMultiselect - SearchKey - Key and Value',
        DynamicField => {
            Name       => $Param{DynamicFieldName} . 'Multiselect',
            Label      => $Param{DynamicFieldName} . 'Multiselect',
            ObjectType => 'Ticket',
            FieldType  => 'WebserviceMultiselect',
            Config     => {
                InvokerSearch            => $Param{InvokerSearch},
                InvokerGet               => $Param{InvokerGet},
                Webservice               => $Param{Webservice},
                Backend                  => $Param{Backend},
                StoredValue              => $Param{StoredValue},
                SearchKeys               => $Param{SearchKeys},
                DisplayedValues          => $Param{DisplayedValues},
                DisplayedValuesSeparator => $Param{DisplayedValuesSeparator},
                Limit                    => $Param{Limit},
                AutocompleteMinLength    => $Param{AutocompleteMinLength},
                SearchTerms              => $Param{SearchTerms},
            },
            Value => [
                'Znuny',
            ],
        },
        DynamicFieldData => [
            {
                Name          => 'UnitTestDynamicFieldKey',
                Key           => 'Key',
                ExpectedValue => 'Znuny',
            },
            {
                Name          => 'UnitTestDynamicFieldValue',
                Key           => 'Value',
                ExpectedValue => 'Znuny',
            },
        ],
    },
);

$UnitTestWebserviceObject->Mock(
    TestSearch => [
        {
            Data   => {},
            Result => {
                Success => 1,
                Data    => [
                    {
                        Key   => 'Znuny',
                        Value => 'Znuny',
                    },
                    {
                        Key   => 'Rocks',
                        Value => 'Rocks',
                    },
                ],
            },
        },
    ],
    TestGet => [
        {
            Data   => {},
            Result => {
                Success => 1,
                Data    => {
                    Key   => 'Znuny',
                    Value => 'Znuny',
                },
            },
        },
    ],
);

for my $Test (@Tests) {
    my @AdditionalDFStorage;
    my %ExpectedResult;
    my @DynamicFields;

    for my $DynamicField ( @{ $Test->{DynamicFieldData} } ) {
        my $AdditionalDF = $DynamicField->{Name} . $HelperObject->GetRandomID();
        push @DynamicFields,
            {
            Name       => $AdditionalDF,
            Label      => $AdditionalDF,
            ObjectType => 'Ticket',
            FieldType  => $DynamicField->{FieldType} || 'Text',
            Config     => {},
            };

        push @AdditionalDFStorage, {
            DynamicField => $AdditionalDF,
            Key          => $DynamicField->{Key},
            Type         => 'Backend',
        };

        $ExpectedResult{$AdditionalDF} = $DynamicField->{ExpectedValue};
    }

    my $DynamicFieldsCreated = $ZnunyHelperObject->_DynamicFieldsCreate(@DynamicFields);
    return if !$DynamicFieldsCreated;

    my $TicketID = $HelperObject->TicketCreate(
        UserID => 1,
    );

    my $DynamicFieldName = $Test->{DynamicField}->{Name};
    $Test->{DynamicField}->{Config}->{AdditionalDFStorage} = \@AdditionalDFStorage;

    $ZnunyHelperObject->_DynamicFieldsCreate(
        {
            %{ $Test->{DynamicField} }
        },
    );

    my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
        Name => $DynamicFieldName,
    );

    $DynamicFieldBackendObject->ValueSet(
        DynamicFieldConfig => $DynamicFieldConfig,
        ObjectID           => $TicketID,
        Value              => $Test->{DynamicField}->{Value},
        UserID             => 1,
    );

    $Kernel::OM->ObjectsDiscard(
        Objects => ['Kernel::System::Ticket'],
    );

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my %Ticket       = $TicketObject->TicketGet(
        TicketID      => $TicketID,
        DynamicFields => 1,
        UserID        => 1,
    );

    if ( IsArrayRefWithData( $Test->{DynamicField}->{Value} ) ) {
        $Self->IsDeeply(
            $Ticket{ 'DynamicField_' . $DynamicFieldName },
            $Test->{DynamicField}->{Value},
            "$Test->{DynamicField}->{FieldType} is set correctly.",
        );
    }
    else {
        $Self->Is(
            $Ticket{ 'DynamicField_' . $DynamicFieldName },
            $Test->{DynamicField}->{Value},
            "$Test->{DynamicField}->{FieldType} is set correctly.",
        );
    }

    for my $AdditionalDFStorage ( sort keys %ExpectedResult ) {
        $Self->Is(
            $Ticket{ 'DynamicField_' . $AdditionalDFStorage },
            $ExpectedResult{$AdditionalDFStorage},
            "DynamicField_$AdditionalDFStorage is set correctly.",
        );
    }
}

1;
