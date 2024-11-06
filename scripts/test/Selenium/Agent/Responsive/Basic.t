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

use Kernel::Language;

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        $Selenium->set_window_size( 600, 400 );

        my $Language      = 'de';
        my $TestUserLogin = $HelperObject->TestUserCreate(
            Language => $Language,
            Groups   => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AgentDashboard screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentDashboard");

        # Wait until jquery is ready.
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function'" );

        # The mobile navigation toggle should be visible.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveNavigationHandle:visible').length"),
            1,
            "Mobile navigation toggle should be visible"
        );

        # The mobile sidebar toggle should be visible.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveSidebarHandle:visible').length"),
            1,
            "Mobile sidebar toggle should be visible"
        );

        # Expand navigation bar.
        $Selenium->find_element( "#ResponsiveNavigationHandle", "css" )->click();

        # Wait for animation has finished.
        sleep 2;

        $Self->Is(
            $Selenium->execute_script("return \$('#NavigationContainer:visible').length"),
            1,
            "Navigation bar should be visible"
        );

        # Collapse navigation bar again.
        # The navigation button is not visible anymore, but we can't klick to the side of the element
        $Selenium->execute_script("return \$('#ResponsiveNavigationHandle').click()");

        # Wait for animation has finished.
        sleep 2;

        $Self->Is(
            $Selenium->execute_script("return \$('#NavigationContainer:visible').length"),
            0,
            "Navigation bar should be hidden again"
        );

        # Expand sidebar.
        $Selenium->find_element( "#ResponsiveSidebarHandle", "css" )->click();

        # Wait for animation has finished.
        sleep 2;

        $Self->Is(
            $Selenium->execute_script("return \$('.ResponsiveSidebarContainer:visible').length"),
            1,
            "Sidebar bar should be visible"
        );

        # Collapse sidebar again.
        # The navigation button is not visible anymore, but we can't klick to the side of the element
        $Selenium->execute_script("return \$('#ResponsiveSidebarHandle').click()");

        # Wait for animation has finished.
        sleep 2;

        $Self->Is(
            $Selenium->execute_script("return \$('.ResponsiveSidebarContainer:visible').length"),
            0,
            "Sidebar bar should be hidden again"
        );

        my $LanguageObject = Kernel::Language->new(
            UserLanguage => $Language,
        );

        # Check for the viewmode switch.
        $Self->Is(
            $Selenium->execute_script("return \$('#ViewModeSwitch > a').text();"),
            $LanguageObject->Translate(
                'Switch to desktop mode'
            ),
            'Check for mobile mode switch text',
        );

        # Toggle the switch.
        $Selenium->find_element( "#ViewModeSwitch", "css" )->click();

        # Wait until jquery is ready.
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function'" );
        sleep 1;

        # Check for the viewmode switch.
        $Self->Is(
            $Selenium->execute_script("return \$('#ViewModeSwitch > a').text();"),
            $LanguageObject->Translate(
                'Switch to mobile mode'
            ),
            'Check for mobile mode switch text',
        );

        # We should now be in desktop mode, thus the toggles should be hidden.
        # While the toolbar is expanded, navigation and sidebar toggle should be hidden.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveNavigationHandle:visible').length"),
            0,
            "Mobile navigation toggle should be hidden"
        );

        # The mobile sidebar toggle should be visible.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveSidebarHandle:visible').length"),
            0,
            "Mobile sidebar toggle should be hidden"
        );

        # Toggle the switch again.
        $Selenium->find_element( "#ViewModeSwitch", "css" )->click();

        # Wait until jquery is ready.
        $Selenium->WaitFor( JavaScript => "return typeof(\$) === 'function'" );
        sleep 1;

        # Check for the viewmode switch.
        $Self->Is(
            $Selenium->execute_script("return \$('#ViewModeSwitch > a').text();"),
            $LanguageObject->Translate(
                'Switch to desktop mode'
            ),
            'Check for mobile mode switch text',
        );

        # We should now be in desktop mode, thus the toggles should be hidden.
        # While the toolbar is expanded, navigation and sidebar toggle should be hidden.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveNavigationHandle:visible').length"),
            1,
            "Mobile navigation toggle should be visible"
        );

        # The mobile sidebar toggle should be visible.
        $Self->Is(
            $Selenium->execute_script("return \$('#ResponsiveSidebarHandle:visible').length"),
            1,
            "Mobile sidebar toggle should be visible"
        );
    }
);

1;
