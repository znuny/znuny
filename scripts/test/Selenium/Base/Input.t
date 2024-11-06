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

use Kernel::System::VariableCheck qw(:all);

use vars (qw($Self));

my $SeleniumObject = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

# store test function in variable so the Selenium object can handle errors/exceptions/dies etc.
my $SeleniumTest = sub {

    my $HelperObject      = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
    my $ZnunyHelperObject = $Kernel::OM->Get('Kernel::System::ZnunyHelper');

    my $RandomID = $HelperObject->GetRandomID();

    # setup a full featured test environment
    my $TestEnvironmentData = $HelperObject->SetupTestEnvironment();

    # create test user and login
    my %TestUser = $SeleniumObject->AgentLogin(
        Groups => [ 'admin', 'users' ],
    );

    $SeleniumObject->AgentInterface(
        Action      => 'AgentTicketPhone',
        WaitForAJAX => 0,
    );

    my $CustomerUser = $TestEnvironmentData->{CustomerUser}->[0];

    my $SetCustomerUserID = $SeleniumObject->InputSet(
        Attribute => 'CustomerUserID',
        Content   => $CustomerUser->{UserID},
    );

    $Self->True(
        $SetCustomerUserID,
        "Setting CustomerUserID '$CustomerUser->{UserID}'",
    );

    my $GetCustomerUserID = $SeleniumObject->InputGet(
        Attribute => 'CustomerUserID',
    );

    $Self->Is(
        $GetCustomerUserID->[0],
        $CustomerUser->{UserID},
        "Get CustomerUserID is '$CustomerUser->{UserID}'",
    );

    my $DynamicFieldText    = "DynamicFieldText äöüß%\$'\")(}{? - $RandomID";
    my $SetDynamicFieldText = $SeleniumObject->InputSet(
        Attribute   => 'DynamicField_UnitTestText',
        Content     => $DynamicFieldText,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetDynamicFieldText,
        "Setting DynamicFieldText '$DynamicFieldText'",
    );

    my $ExistsDynamicFieldText = $SeleniumObject->InputExists(
        Attribute => 'DynamicField_UnitTestText',
    );

    $Self->True(
        $ExistsDynamicFieldText,
        "DynamicFieldText exists",
    );

    my $GetDynamicFieldText = $SeleniumObject->InputGet(
        Attribute => 'DynamicField_UnitTestText',
    );

    $Self->Is(
        $GetDynamicFieldText,
        $DynamicFieldText,
        "Get DynamicFieldText is '$DynamicFieldText'",
    );

    my $DynamicFieldCheckbox        = 'true';
    my $SetDynamicFieldCheckboxTrue = $SeleniumObject->InputSet(
        Attribute   => 'DynamicField_UnitTestCheckbox',
        Content     => $DynamicFieldCheckbox,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetDynamicFieldCheckboxTrue,
        "Setting DynamicFieldCheckbox '$DynamicFieldCheckbox'",
    );

    my $GetDynamicFieldCheckboxTrue = $SeleniumObject->InputGet(
        Attribute => 'DynamicField_UnitTestCheckbox',
    );

    $Self->True(
        $GetDynamicFieldCheckboxTrue,
        "Get DynamicFieldCheckbox is '$DynamicFieldCheckbox'",
    );

    $DynamicFieldCheckbox = 'false';
    my $SetDynamicFieldCheckboxFalse = $SeleniumObject->InputSet(
        Attribute   => 'DynamicField_UnitTestCheckbox',
        Content     => $DynamicFieldCheckbox,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetDynamicFieldCheckboxFalse,
        "Setting DynamicFieldCheckbox '$DynamicFieldCheckbox'",
    );

    my $GetDynamicFieldCheckboxFalse = $SeleniumObject->InputGet(
        Attribute => 'DynamicField_UnitTestCheckbox',
    );

    $Self->False(
        $GetDynamicFieldCheckboxFalse,
        "Get DynamicFieldCheckbox is '$DynamicFieldCheckbox'",
    );

    my %DynamicFieldDropdownTestData = (
        Key   => 'Key3',
        Value => 'Value3',
    );

    for my $Type ( sort keys %DynamicFieldDropdownTestData ) {

        sleep 2;

        my $SetDynamicFieldDropdown = $SeleniumObject->InputSet(
            Attribute => 'DynamicField_UnitTestDropdown',
            Content   => $DynamicFieldDropdownTestData{$Type},
            Options   => {
                KeyOrValue => $Type,
            },
        );

        $Self->True(
            $SetDynamicFieldDropdown,
            "Setting DynamicFieldDropdown '$DynamicFieldDropdownTestData{ $Type }'",
        );

        sleep 2;

        my $GetDynamicFieldDropdown = $SeleniumObject->InputGet(
            Attribute => 'DynamicField_UnitTestDropdown',
            Options   => {
                KeyOrValue => $Type,
            },
        );

        $Self->Is(
            $GetDynamicFieldDropdown,
            $DynamicFieldDropdownTestData{$Type},
            "Get DynamicFieldDropdown is '$DynamicFieldDropdownTestData{ $Type }'",
        );
    }

    my $DynamicFieldTextArea    = "DynamicFieldTextArea \n\n\n äöüß%\$'\")(}{? \n\n\n - $RandomID";
    my $SetDynamicFieldTextArea = $SeleniumObject->InputSet(
        Attribute   => 'DynamicField_UnitTestTextArea',
        Content     => $DynamicFieldTextArea,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetDynamicFieldTextArea,
        "Setting DynamicFieldTextArea '$DynamicFieldTextArea'",
    );

    my $GetDynamicFieldTextArea = $SeleniumObject->InputGet(
        Attribute => 'DynamicField_UnitTestTextArea',
    );

    $Self->Is(
        $GetDynamicFieldTextArea,
        $DynamicFieldTextArea,
        "Get DynamicFieldTextArea is '$DynamicFieldTextArea'",
    );

    my %DynamicFieldMultiSelectTestData = (
        Key   => [ 'Key1',   'Key2' ],
        Value => [ 'Value1', 'Value2' ],
    );

    for my $SetType ( sort keys %DynamicFieldMultiSelectTestData ) {

        my $SetDynamicFieldMultiSelect = $SeleniumObject->InputSet(
            Attribute => 'DynamicField_UnitTestMultiSelect',
            Content   => $DynamicFieldMultiSelectTestData{$SetType},
            Options   => {
                KeyOrValue => $SetType,
            },
        );

        $Self->True(
            $SetDynamicFieldMultiSelect,
            "Setting DynamicFieldMultiSelect '$DynamicFieldMultiSelectTestData{ $SetType }'",
        );

        for my $GetType ( sort keys %DynamicFieldMultiSelectTestData ) {

            my $GetDynamicFieldMultiSelect = $SeleniumObject->InputGet(
                Attribute => 'DynamicField_UnitTestMultiSelect',
                Options   => {
                    KeyOrValue => $GetType,
                },
            );

            $Self->IsDeeply(
                $GetDynamicFieldMultiSelect,
                $DynamicFieldMultiSelectTestData{$GetType},
                "Get DynamicFieldMultiSelect is '$DynamicFieldMultiSelectTestData{ $GetType }'",
            );
        }
    }

    my @DynamicDateOrDateTimeData = (
        {
            Year   => 2014,
            Month  => 6,
            Day    => 12,
            Hour   => 10,
            Minute => 28,
            Used   => 1,
        },
        {
            Year   => 2015,
            Month  => 10,
            Day    => 9,
            Hour   => 2,
            Minute => 55,
            Used   => 0,
        },
    );
    DATEORDATETIME:
    for my $DateOrDateTime (qw(Date DateTime)) {

        my $Counter = 1;
        for my $DateOrDateTimeValue (@DynamicDateOrDateTimeData) {

            my $SetDynamicFieldDateOrDateTimeResult = $SeleniumObject->InputSet(
                Attribute   => "DynamicField_UnitTest$DateOrDateTime",
                Content     => $DateOrDateTimeValue,
                WaitForAJAX => 0,
            );

            $Self->True(
                $SetDynamicFieldDateOrDateTimeResult,
                "Setting DynamicField_UnitTest$DateOrDateTime #$Counter",
            );

            my $GetDynamicFieldDateOrDateTimeResult = $SeleniumObject->InputGet(
                Attribute => "DynamicField_UnitTest$DateOrDateTime",
            );

            my %CompareData = %{$DateOrDateTimeValue};
            if ( $DateOrDateTime eq 'Date' ) {
                delete $CompareData{Hour};
                delete $CompareData{Minute};
            }

            $Self->IsDeeply(
                $GetDynamicFieldDateOrDateTimeResult,
                \%CompareData,
                "Getting DynamicField_UnitTest$DateOrDateTime #$Counter",
            );

            $Counter++;
        }
    }

    my $Subject    = "Subject äöüß%\$'\")(}{? - $RandomID";
    my $SetSubject = $SeleniumObject->InputSet(
        Attribute   => 'Subject',
        Content     => $Subject,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetSubject,
        "Setting Subject '$Subject'",
    );

    my $GetSubject = $SeleniumObject->InputGet(
        Attribute => 'Subject',
    );

    $Self->Is(
        $GetSubject,
        $Subject,
        "Get Subject is '$Subject'",
    );

    my $RichText    = "RichText<br />\n<br />\n<br />\näöüß%\$'\")(}{?<br />\n<br />\n- $RandomID";
    my $SetRichText = $SeleniumObject->InputSet(
        Attribute   => 'RichText',
        Content     => $RichText,
        WaitForAJAX => 0,
    );

    $Self->True(
        $SetRichText,
        "Setting RichText '$RichText'",
    );

    my $GetRichText = $SeleniumObject->InputGet(
        Attribute => 'RichText',
    );

    $Self->Is(
        $GetRichText,
        $RichText,
        "Get RichText is '$RichText'",
    );

    ATTRIBUTE:
    for my $Attribute (qw(Service SLA Type Queue)) {

        next ATTRIBUTE if !IsHashRefWithData( $TestEnvironmentData->{$Attribute} );

        my $JSAttribute = "${Attribute}ID";

        my $FieldID = $SeleniumObject->InputFieldID(
            Attribute => $JSAttribute,
        );
        my $ModernizedFieldID = "${FieldID}_Search";

        $Self->True(
            $FieldID,
            "Found FieldID for $Attribute",
        );

        my $IsDisplayed = $SeleniumObject->find_element( "#$ModernizedFieldID", 'css' )->is_displayed();

        $Self->True(
            $IsDisplayed,
            "$FieldID ($Attribute) is displayed",
        );

        my $HiddenResult = $SeleniumObject->InputHide(
            Attribute => $JSAttribute,
        );

        $Self->True(
            $HiddenResult,
            "$FieldID ($Attribute) is set to hidden",
        );

        $IsDisplayed = $SeleniumObject->find_element( "#$ModernizedFieldID", 'css' )->is_displayed();

        $Self->False(
            $IsDisplayed,
            "$FieldID ($Attribute) InputHide success",
        );

        my $ShowResult = $SeleniumObject->InputShow(
            Attribute => $JSAttribute,
        );

        $Self->True(
            $ShowResult,
            "$FieldID ($Attribute) is set to shown",
        );

        $IsDisplayed = $SeleniumObject->find_element( "#$ModernizedFieldID", 'css' )->is_displayed();

        $Self->True(
            $IsDisplayed,
            "$FieldID ($Attribute) InputShow success",
        );

        for my $AttributeValue ( sort keys %{ $TestEnvironmentData->{$Attribute} } ) {

            my $AttributeKey = $TestEnvironmentData->{$Attribute}->{$AttributeValue};

            my %SetContentMapping = (
                Key   => $AttributeKey,
                Value => $AttributeValue,
            );

            for my $SetType (qw(Key Value)) {

                my $SetValueResult = $SeleniumObject->InputSet(
                    Attribute => $JSAttribute,
                    Content   => $SetContentMapping{$SetType},
                    Options   => {
                        KeyOrValue => $SetType,
                    },
                );

                $Self->True(
                    $SetValueResult,
                    "Set $SetType '$SetContentMapping{$SetType}' for $FieldID ($Attribute)",
                );

                my $GetKeyResult = $SeleniumObject->InputGet(
                    Attribute => $JSAttribute,
                );

                $Self->Is(
                    $GetKeyResult,
                    $AttributeKey,
                    "Get key '$AttributeKey' for $FieldID ($Attribute)",
                );

                my $GetValueResult = $SeleniumObject->InputGet(
                    Attribute => $JSAttribute,
                    Options   => {
                        KeyOrValue => 'Value',
                    },
                );

                $Self->Is(
                    $GetValueResult,
                    $AttributeValue,
                    "Get value '$AttributeValue' for $FieldID ($Attribute)",
                );
            }
        }
    }
};

# finally run the test(s) in the browser
$SeleniumObject->RunTest($SeleniumTest);

1;
