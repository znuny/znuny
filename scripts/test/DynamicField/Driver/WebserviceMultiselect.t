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

my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
$ConfigObject->Set(
    Key   => 'DefaultLanguage',
    Value => 'en',
);

my $HelperObject              = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ZnunyHelperObject         = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $LayoutObject              = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
my $DynamicFieldObject        = $Kernel::OM->Get('Kernel::System::DynamicField');
my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
my $ParamObject               = $Kernel::OM->Get('Kernel::System::Web::Request');
my $UnitTestWebserviceObject  = $Kernel::OM->Get('Kernel::System::UnitTest::Webservice');
my $WebserviceObject          = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

my $WebserviceName = 'DynamicFieldWebservice';
my $DynamicField   = $WebserviceName . 'Driver';

$ZnunyHelperObject->_WebserviceCreate(
    Webservices => {
        $WebserviceName => 'scripts/test/sample/Webservice/' . $WebserviceName . '.yml',
    }
);
my $Webservice = $WebserviceObject->WebserviceGet(
    Name => $WebserviceName,
);

$Self->True(
    $Webservice,
    "WebserviceGet() - $WebserviceName",
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

my @DynamicFields = (
    {
        Name       => $DynamicField . 'Multiselect',
        Label      => $DynamicField . 'Multiselect',
        ObjectType => 'Ticket',
        FieldType  => 'WebserviceMultiselect',
        Config     => {
            Webservice               => $WebserviceName,
            InvokerSearch            => 'TestSearch',
            InvokerGet               => 'TestGet',
            Backend                  => 'DirectRequest',
            SearchKeys               => 'key',
            StoredValue              => 'key',
            DisplayedValues          => 'key',
            DisplayedValuesSeparator => '-',
            Limit                    => 100,
            AutocompleteMinLength    => 3,
            InputFieldWidth          => 50,
            QueryDelay               => 1,
            AdditionalDFStorage      => [
                {
                    DynamicField => 'TestDynamicField1',
                    Key          => 'Key',
                    Type         => 'FrontendBackend',
                },
                {
                    DynamicField => 'TestDynamicField2',
                    Key          => 'Value',
                    Type         => 'FrontendBackend',
                },
            ],
            Link         => '',
            LinkPreview  => '',
            DefaultValue => '',
        },
    },
);
my $Success = $ZnunyHelperObject->_DynamicFieldsCreate(@DynamicFields);

$Self->True(
    $Success,
    '_DynamicFieldsCreate',
);

my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
    Name => $DynamicField . 'Multiselect',
);

# EditFieldRender
my $TicketID = $HelperObject->TicketCreate();
$LayoutObject->{TicketID} = $TicketID;

my $DynamicFieldHTML = $DynamicFieldBackendObject->EditFieldRender(
    DynamicFieldConfig => $DynamicFieldConfig,
    LayoutObject       => $LayoutObject,
    ParamObject        => $ParamObject,
    AJAXUpdate         => 1,
);

my ($InputFieldUUID) = $DynamicFieldHTML->{Field} =~ m{data-input-field-uuid="(.+?)"};

$Self->IsDeeply(
    $DynamicFieldHTML,
    {
        'Label' =>
            "<div class='label-wrapper'><label id='LabelDynamicField_DynamicFieldWebserviceDriverMultiselect' for='DynamicField_DynamicFieldWebserviceDriverMultiselect'>DynamicFieldWebserviceDriverMultiselect</label></div>",
        'Field' =>
            '<select  data-dynamic-field-name="DynamicFieldWebserviceDriverMultiselect" data-dynamic-field-type="WebserviceMultiselect" data-selected-value-field-name="DynamicField_DynamicFieldWebserviceDriverMultiselect" data-autocomplete-field-name="DynamicField_DynamicFieldWebserviceDriverMultiselect_Search" data-autocomplete-min-length="3" data-query-delay="1" data-default-search-term="" data-ticket-id="'
            . $TicketID
            . '" data-input-field-uuid="'
            . $InputFieldUUID
            . '" class="DynamicFieldMultiselect Modernize W50pc" id="DynamicField_DynamicFieldWebserviceDriverMultiselect" multiple="multiple" name="DynamicField_DynamicFieldWebserviceDriverMultiselect">
  <option value="">-</option>
  <option value=" "></option>
</select><div id="DynamicField_DynamicFieldWebserviceDriverMultiselectError" class="TooltipErrorMessage">
    <p>
        This field is required.
    </p>
</div>
<div id="DynamicField_DynamicFieldWebserviceDriverMultiselectServerError" class="TooltipErrorMessage">
    <p>
        This field is required.
    </p>
</div>
',
    },
    'EditFieldRender',
);

# ValueSet
$Success = $DynamicFieldBackendObject->ValueSet(
    DynamicFieldConfig => $DynamicFieldConfig,
    ObjectID           => $TicketID,
    Value              => 'UNKNOWN',
    UserID             => 1,
);

$Self->True(
    $Success,
    'ValueSet - UNKNOWN',
);

# ValueGet
my $ValueGet = $DynamicFieldBackendObject->ValueGet(
    DynamicFieldConfig => $DynamicFieldConfig,
    ObjectID           => $TicketID,
);

$Self->IsDeeply(
    $ValueGet,
    [
        'UNKNOWN'
    ],
    'ValueGet',
);

1;
