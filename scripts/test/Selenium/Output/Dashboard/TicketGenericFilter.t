# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        my $HelperObject            = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $TicketObject            = $Kernel::OM->Get('Kernel::System::Ticket');
        my $DynamicFieldObject      = $Kernel::OM->Get('Kernel::System::DynamicField');
        my $CacheObject             = $Kernel::OM->Get('Kernel::System::Cache');
        my $UserObject              = $Kernel::OM->Get('Kernel::System::User');
        my $ConfigObject            = $Kernel::OM->Get('Kernel::Config');
        my $DynamicFieldValueObject = $Kernel::OM->Get('Kernel::System::DynamicFieldValue');

        # disable dashboard widget MyLastChangedTickets for this TicketGenericFilter test.
        $HelperObject->DisableSysConfigs(
            DisableSysConfigs => [
                'DashboardBackend###0255-MyLastChangedTickets',
            ],
        );

        # Create test user.
        my $TestUserLogin = $HelperObject->TestUserCreate(
            Groups => [ 'admin', 'users' ],
        ) || die "Did not get test user";

        # Get test user ID.
        my $TestUserID = $UserObject->UserLookup(
            UserLogin => $TestUserLogin,
        );

        my @Tests = (
            {
                TN                => $TicketObject->TicketCreateNumber(),
                CustomerUser      => $HelperObject->GetRandomID() . '@first.com',
                DynamicFieldValue => 'Key',
            },
            {
                TN                => $TicketObject->TicketCreateNumber(),
                CustomerUser      => $HelperObject->GetRandomID() . '@second.com',
                DynamicFieldValue => 'Key::Sub',
            },
            {
                TN                => $TicketObject->TicketCreateNumber(),
                CustomerUser      => $HelperObject->GetRandomID() . '@third.com',
                CustomerID        => 'CustomerCompany' . $HelperObject->GetRandomID() . '(#)',
                DynamicFieldValue => 'Key;Special',
            },
            {
                TN           => $TicketObject->TicketCreateNumber(),
                CustomerUser => $HelperObject->GetRandomID() . '@fourth.com',
                CustomerID   => 'CustomerCompany#%' . $HelperObject->GetRandomID() . '(#)',
            },
        );

        # Check if test dynamic field exists in the system, remove it if it does.
        my $DynamicFieldName = 'DynamicFieldFilterTest';
        my $DynamicField     = $DynamicFieldObject->DynamicFieldGet(
            Name => $DynamicFieldName,
        );
        my $Success;
        if ( $DynamicField->{ID} ) {
            my $ValuesDeleteSuccess = $DynamicFieldValueObject->AllValuesDelete(
                FieldID => $DynamicField->{ID},
                UserID  => 1,
            );
            $Success = $DynamicFieldObject->DynamicFieldDelete(
                ID     => $DynamicField->{ID},
                UserID => 1,
            );
            $Self->True(
                $Success,
                "DynamicFieldID $DynamicField->{ID} is deleted",
            );
        }

        # Create test dynamic field.
        my $DynamicFieldID = $DynamicFieldObject->DynamicFieldAdd(
            Name       => $DynamicFieldName,
            Label      => $DynamicFieldName,
            FieldOrder => 9991,
            FieldType  => 'Dropdown',
            ObjectType => 'Ticket',
            Config     => {
                PossibleValues => {
                    'Key'         => 'Value',
                    'Key::Sub'    => 'SubValue',
                    'Key;Special' => 'SpecialValue',
                },
            },
            ValidID => 1,
            UserID  => 1,
        );
        $Self->True(
            $DynamicFieldID,
            "DynamicFieldID $DynamicFieldID is created",
        );

        # Create test tickets.
        my @Tickets;
        for my $Test (@Tests) {
            my $TicketID = $TicketObject->TicketCreate(
                TN           => $Test->{TN},
                Title        => 'Selenium Test Ticket',
                Queue        => 'Raw',
                Lock         => 'unlock',
                Priority     => '3 normal',
                State        => 'new',
                CustomerID   => $Test->{CustomerID} || 'SomeCustomer',
                CustomerUser => $Test->{CustomerUser},
                OwnerID      => $TestUserID,
                UserID       => $TestUserID,
            );
            $Self->True(
                $TicketID,
                "Ticket ID $TicketID - created"
            );

            # Set dynamic field value for the ticket
            if ( defined $Test->{DynamicFieldValue} ) {
                $Success = $DynamicFieldValueObject->ValueSet(
                    FieldID    => $DynamicFieldID,
                    ObjectType => 'Ticket',
                    ObjectID   => $TicketID,
                    Value      => [
                        {
                            ValueText => $Test->{DynamicFieldValue},
                        },
                    ],
                    UserID => 1,
                );
                $Self->True(
                    $Success,
                    "DynamicFieldID $DynamicFieldID is set to '$Test->{DynamicFieldValue}' successfully",
                );
            }

            push @Tickets, {
                TicketID          => $TicketID,
                TN                => $Test->{TN},
                CustomerUser      => $Test->{CustomerUser},
                CustomerID        => $Test->{CustomerID},
                DynamicFieldValue => $Test->{DynamicFieldValue},
            };
        }

        # Login test user.
        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Turn on the 'Customer User ID' column by default.
        my $Config = $ConfigObject->Get('DashboardBackend')->{'0120-TicketNew'};
        $Config->{DefaultColumns}->{CustomerUserID} = '2';
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'DashboardBackend###0120-TicketNew',
            Value => $Config,
        );

        # Refresh dashboard screen and clean it's cache.
        $CacheObject->CleanUp(
            Type => 'Dashboard',
        );

        $Selenium->VerifiedRefresh();

        # Navigate to dashboard screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?");

        # Check if 'Customer User ID' filter for TicketNew dashboard is set.
        eval {
            $Self->True(
                $Selenium->find_element("//a[contains(\@title, \'Customer User ID\' )]"),
                "'Customer User ID' filter for TicketNew dashboard is set",
            );
        };
        if ($@) {
            $Self->True(
                $@,
                "'Customer User ID' filter for TicketNew dashboard is not set",
            );
        }
        else {

            # Click on column setting filter for the first customer in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer User ID\' )]")->click();
            $Selenium->WaitFor(
                JavaScript =>
                    'return $("div.ColumnSettingsBox").length'
            );

            # Select the first test 'Customer User ID' as filter for TicketNew generic dashboard overview.
            my $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $ParentElement->click();

            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && $(".InputField_Search").length'
            );

            $Selenium->find_child_element( $ParentElement, '.InputField_Search', 'css' )
                ->send_keys( $Tickets[0]->{CustomerUser} );
            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerUserID0120-TicketNew').val('$Tickets[0]->{CustomerUser}').trigger('change');"
            );

            # Wait for auto-complete action.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[1]->{TicketID}
                    . '\']").length'
            );

            # Verify the first test ticket is found by filtering with the second customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) > -1,
                "Test ticket with TN $Tickets[0]->{TN} - found on screen after filtering with customer - $Tickets[0]->{CustomerUser}",
            );

            # Verify the second test ticket is not found by filtering with the first customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with customer - $Tickets[0]->{CustomerUser}",
            );

            # Click on column setting filter for 'Customer User ID' in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer User ID\' )]")->click();
            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Delete the current filter.
            $Selenium->find_element( "a.DeleteFilter", 'css' )->click();

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Click on column setting filter for 'Customer User ID' in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer User ID\' )]")->click();
            $Selenium->WaitFor(
                JavaScript =>
                    'return $("div.ColumnSettingsBox").length'
            );

            # Select test 'Customer User ID' as filter for TicketNew generic dashboard overview.
            $ParentElement = $Selenium->find_element( 'div.ColumnSettingsBox', 'css' );
            $ParentElement->click();

            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && $(".InputField_Search").length'
            );

            $Selenium->find_child_element( $ParentElement, '.InputField_Search', 'css' )
                ->send_keys( $Tickets[1]->{CustomerUser} );

            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerUserID0120-TicketNew').val('$Tickets[1]->{CustomerUser}').trigger('change');"
            );

            # Wait for auto-complete action.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[0]->{TicketID}
                    . '\']").length'
            );

            # Verify the second test ticket is found by filtering with the second customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) > -1,
                "Test ticket TN $Tickets[1]->{TN} - found on screen after filtering with the customer - $Tickets[1]->{CustomerUser}",
            );

            # Verify the first test ticket is not found by filtering with the second customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) == -1,
                "Test ticket TN $Tickets[0]->{TN} - not found on screen after filtering with customer - $Tickets[1]->{CustomerUser}",
            );

            # Cleanup
            # Click on column setting filter for 'Customer User ID' in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer User ID\' )]")->click();
            sleep 1;

            # wait for AJAX to finish
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Delete the current filter.
            $Selenium->find_element( "a.DeleteFilter", 'css' )->click();

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );
        }

        # Update configuration.
        $Config                                     = $ConfigObject->Get('DashboardBackend')->{'0120-TicketNew'};
        $Config->{DefaultColumns}->{CustomerUserID} = '0';
        $Config->{DefaultColumns}->{CustomerID}     = '2';
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'DashboardBackend###0120-TicketNew',
            Value => $Config,
        );

        # Refresh dashboard screen and clean it's cache.
        $CacheObject->CleanUp(
            Type => 'Dashboard',
        );

        $Selenium->VerifiedRefresh();

        # Navigate to dashboard screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?");

        # Check if 'Customer ID' filter for TicketNew dashboard is set.
        eval {
            $Self->True(
                $Selenium->find_element("//a[contains(\@title, \'Customer ID\' )]"),
                "'Customer ID' filter for TicketNew dashboard is set",
            );
        };
        if ($@) {
            $Self->True(
                $@,
                "'Customer ID' filter for TicketNew dashboard is not set",
            );
        }
        else {

            # Click on column setting filter for the first customer in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer ID\' )]")->click();
            $Selenium->WaitFor(
                JavaScript =>
                    'return $("div.ColumnSettingsBox").length'
            );

            # Select the third test Customer ID as filter for TicketNew generic dashboard overview.
            my $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $ParentElement->click();

            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && $(".InputField_Search").length'
            );

            $Selenium->find_child_element( $ParentElement, '.InputField_Search', 'css' )
                ->send_keys( $Tickets[2]->{CustomerID} );
            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerID0120-TicketNew').val('$Tickets[2]->{CustomerID}').trigger('change');"
            );

            # Wait for auto-complete action.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("a[href*=\'TicketID='
                    . $Tickets[1]->{TicketID}
                    . '\']").length'
            );

            # Verify the third test ticket is found  by filtering with the second customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[2]->{TN} ) > -1,
                "Test ticket with TN $Tickets[2]->{TN} - found on screen after filtering with customer - $Tickets[2]->{CustomerID}",
            );

            # Verify the second test ticket is not found by filtering with the first customer that is not in DB.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with customer - $Tickets[1]->{CustomerID}",
            );

            # Click on column setting filter for CustomerID in TicketNew generic dashboard overview.
            $Selenium->find_element("//a[contains(\@title, \'Customer ID\' )]")->click();
            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Delete the current filter.
            $Selenium->find_element( "a.DeleteFilter", 'css' )->click();

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify if CustomerID containing special characters is filtered correctly. See bug#14982.
            $Selenium->find_element("//a[contains(\@title, \'Customer ID\' )]")->click();

            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && $(".InputField_Search").length'
            );

            $ParentElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $Selenium->find_child_element( $ParentElement, '.InputField_Search', 'css' )
                ->send_keys( $Tickets[3]->{CustomerID} );
            sleep 1;

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("span.AJAXLoader:visible").length'
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterCustomerID0120-TicketNew').val('$Tickets[3]->{CustomerID}').trigger('change');"
            );

            # Wait for autocomplete action.
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === 'function' && \$('td div[title=\"$Tickets[3]->{CustomerID}\"]').length == 1;"
            );

            # Verify CustomerID containing special characters is found.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[3]->{TN} ) > -1,
                "Test ticket with TN $Tickets[3]->{TN} - found on screen after filtering with customer - $Tickets[3]->{CustomerID}",
            );

            # Cleanup
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === 'function' && \$('a#Dashboard0120-TicketNew-remove-filters').length == 1;"
            );

            # Delete filter
            $Selenium->execute_script(
                "\$('a#Dashboard0120-TicketNew-remove-filters').trigger('click');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );
        }

        # Update configuration.
        $Config                                     = $ConfigObject->Get('DashboardBackend')->{'0120-TicketNew'};
        $Config->{DefaultColumns}->{CustomerUserID} = '0';
        $Config->{DefaultColumns}->{CustomerID}     = '0';
        $Config->{DefaultColumns}->{"DynamicField_$DynamicFieldName"} = '2';
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'DashboardBackend###0120-TicketNew',
            Value => $Config,
        );

        # Refresh dashboard screen and clean it's cache.
        $CacheObject->CleanUp(
            Type => 'Dashboard',
        );

        $Selenium->VerifiedRefresh();

        # Navigate to dashboard screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?");

        # Check if '$DynamicFieldName' filter for TicketNew dashboard is set.
        eval {
            $Self->True(
                $Selenium->find_element("//a[contains(\@title, \'$DynamicFieldName\' )]"),
                "'$DynamicFieldName' filter for TicketNew dashboard is set",
            );
        };
        if ($@) {
            $Self->True(
                $@,
                "'$DynamicFieldName' filter for TicketNew dashboard is not set",
            );
        }
        else {

            $Selenium->WaitFor(
                JavaScript => 'return typeof($) === "function" && $("a[title=\"' . $DynamicFieldName . '\"]").length'
            );

            $Selenium->find_element( "a[title*=\"$DynamicFieldName\"].ColumnSettingsTrigger", 'css' )->click();
            my $ColumnSettingsBoxElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $ColumnSettingsBoxElement->click();

            # Wait for option to exist
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === \"function\" && \$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew > option[value=\"$Tickets[0]->{DynamicFieldValue}\"]').length"
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew').val('$Tickets[0]->{DynamicFieldValue}').trigger('change');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify the first test ticket is found by filtering with the first dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) > -1,
                "Test ticket with TN $Tickets[0]->{TN} - found on screen after filtering with dynamic field value - $Tickets[0]->{DynamicFieldValue}",
            );

            # Verify the second test ticket is not found by filtering with the first dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with dynamic field value - $Tickets[0]->{DynamicFieldValue}",
            );

            # Verify the third test ticket is not found by filtering with the first dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[2]->{TN} ) == -1,
                "Test ticket with TN $Tickets[2]->{TN} - not found on screen after filtering with dynamic field value - $Tickets[0]->{DynamicFieldValue}",
            );

            # Cleanup
            $Selenium->execute_script(
                "\$('a#Dashboard0120-TicketNew-remove-filters').trigger('click');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify if dynamic field values containing tree separators (::) are filtered correctly.
            $Selenium->WaitFor(
                JavaScript => 'return typeof($) === "function" && $("a[title=\"' . $DynamicFieldName . '\"]").length'
            );
            $Selenium->find_element( "a[title*=\"$DynamicFieldName\"].ColumnSettingsTrigger", 'css' )->click();

            $ColumnSettingsBoxElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $ColumnSettingsBoxElement->click();

            # Wait for option to exist
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === \"function\" && \$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew > option[value=\"$Tickets[1]->{DynamicFieldValue}\"]').length"
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew').val('$Tickets[1]->{DynamicFieldValue}').trigger('change');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify the second test ticket is found by filtering with the second dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) > -1,
                "Test ticket with TN $Tickets[1]->{TN} - found on screen after filtering with dynamic field value with special characters - $Tickets[1]->{DynamicFieldValue}",
            );

            # Verify the first test ticket is not found by filtering with the second dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) == -1,
                "Test ticket with TN $Tickets[0]->{TN} - not found on screen after filtering with dynamic field value with special characters - $Tickets[1]->{DynamicFieldValue}",
            );

            # Verify the third test ticket is not found by filtering with the second dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[2]->{TN} ) == -1,
                "Test ticket with TN $Tickets[2]->{TN} - not found on screen after filtering with dynamic field value with special characters - $Tickets[1]->{DynamicFieldValue}",
            );

            # Cleanup
            $Selenium->execute_script(
                "\$('a#Dashboard0120-TicketNew-remove-filters').trigger('click');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify if dynamic field values containing special characters is filtered correctly. See bug#14497.
            $Selenium->WaitFor(
                JavaScript => 'return typeof($) === "function" && $("a[title=\"' . $DynamicFieldName . '\"]").length'
            );
            $Selenium->find_element( "a[title*=\"$DynamicFieldName\"].ColumnSettingsTrigger", 'css' )->click();

            $ColumnSettingsBoxElement = $Selenium->find_element( "div.ColumnSettingsBox", 'css' );
            $ColumnSettingsBoxElement->click();

            # Wait for option to exist
            $Selenium->WaitFor(
                JavaScript =>
                    "return typeof(\$) === \"function\" && \$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew > option[value=\"$Tickets[2]->{DynamicFieldValue}\"]').length"
            );

            # Choose the value.
            $Selenium->execute_script(
                "\$('#ColumnFilterDynamicField_${DynamicFieldName}0120-TicketNew').val('$Tickets[2]->{DynamicFieldValue}').trigger('change');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );

            # Verify the third test ticket is found by filtering with the third dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[2]->{TN} ) > -1,
                "Test ticket with TN $Tickets[2]->{TN} - found on screen after filtering with dynamic field value with special characters - $Tickets[2]->{DynamicFieldValue}",
            );

            # Verify the first test ticket is not found by filtering with the third dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[0]->{TN} ) == -1,
                "Test ticket with TN $Tickets[0]->{TN} - not found on screen after filtering with dynamic field value with special characters - $Tickets[2]->{DynamicFieldValue}",
            );

            # Verify the second test ticket is not found by filtering with the third dynamic field value.
            $Self->True(
                index( $Selenium->get_page_source(), $Tickets[1]->{TN} ) == -1,
                "Test ticket with TN $Tickets[1]->{TN} - not found on screen after filtering with dynamic field value with special characters - $Tickets[2]->{DynamicFieldValue}",
            );

            # Cleanup
            $Selenium->execute_script(
                "\$('a#Dashboard0120-TicketNew-remove-filters').trigger('click');"
            );

            # Wait for AJAX to finish.
            $Selenium->WaitFor(
                JavaScript =>
                    'return typeof($) === "function" && !$("#Dashboard0120-TicketNew-box.Loading").length'
            );
        }

        # Delete test tickets.
        for my $Ticket (@Tickets) {
            my $Success = $TicketObject->TicketDelete(
                TicketID => $Ticket->{TicketID},
                UserID   => 1,
            );

            # Ticket deletion could fail if apache still writes to ticket history. Try again in this case.
            if ( !$Success ) {
                sleep 3;
                $Success = $TicketObject->TicketDelete(
                    TicketID => $Ticket->{TicketID},
                    UserID   => 1,
                );
            }
            $Self->True(
                $Success,
                "Ticket ID $Ticket->{TicketID} - deleted"
            );
        }

        # Delete dynamic field
        $Success = $DynamicFieldObject->DynamicFieldDelete(
            ID     => $DynamicFieldID,
            UserID => 1,
        );
        $Self->True(
            $Success,
            "DynamicFieldID $DynamicFieldID is deleted",
        );

        # Make sure cache is correct.
        $CacheObject->CleanUp(
            Type => 'Ticket',
        );
    }
);

1;
