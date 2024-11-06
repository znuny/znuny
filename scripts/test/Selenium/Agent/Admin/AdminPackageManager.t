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

my $HelperObject  = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');
my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');

my @List = $PackageObject->RepositoryList(
    Result => 'short',
);
my $NumberOfPackagesInstalled = scalar @List;

# Skip the test if there is more then 8 packages installed (8 because of SaaS scenarios).
# TODO: fix the main issue with "unexpected alert open".
if ( $NumberOfPackagesInstalled > 8 ) {
    $Self->True(
        1,
        "Found $NumberOfPackagesInstalled packages installed, skipping test..."
    );
    return 1;
}

my $RandomID = $HelperObject->GetRandomID();

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

my $CheckBreadcrumb = sub {

    my %Param = @_;

    my $BreadcrumbText = $Param{BreadcrumbText} || '';
    for my $BreadcrumbText ( 'Package Manager', "$BreadcrumbText Test" ) {
        $Selenium->ElementExists(
            Selector     => ".BreadCrumb>li>[title='$BreadcrumbText']",
            SelectorType => 'css',
        );
    }
};

my $NavigateToAdminPackageManager = sub {

    # Wait until all AJAX calls finished.
    $Selenium->WaitFor( JavaScript => "return \$.active == 0" );

    # Go back to overview.
    # Navigate to AdminPackageManager screen.
    my $ScriptAlias = $ConfigObject->Get('ScriptAlias');
    $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminPackageManager");
    $Selenium->WaitFor(
        Time => 120,
        JavaScript =>
            'return typeof($) == "function" && $("#FileUpload").length;'
    );
};

my $ClickAction = sub {

    my $Selector = $_[0];

    $Selenium->execute_script('window.Core.App.PageLoadComplete = false;');
    $Selenium->find_element($Selector)->click();
    $Selenium->WaitFor(
        Time => 120,
        JavaScript =>
            'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
    );
};

$Selenium->RunTest(
    sub {
        my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # For the sake of stability, check if test package is already installed.
        my $TestPackage = $PackageObject->RepositoryGet(
            Name            => 'Test',
            Version         => '0.0.1',
            DisableWarnings => 1,
        );

        # If test package is installed, remove it so we can install it again.
        if ($TestPackage) {
            my $PackageUninstall = $PackageObject->PackageUninstall( String => $TestPackage );
            $Self->True(
                $TestPackage,
                'Test package is uninstalled'
            );
        }

        # Create test user and login.
        my $TestUserLogin = $HelperObject->TestUserCreate(
            Groups => ['admin'],
        ) || die 'Did not get test user';

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # Get script alias.
        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminPackageManager");

        # Check if needed frontend module is registered in sysconfig.
        if ( !$ConfigObject->Get('Frontend::Module')->{AdminPackageManager} ) {
            $Self->True(
                index(
                    $Selenium->get_page_source(),
                    'Module Kernel::Modules::AdminPackageManager not registered in Kernel/Config.pm!'
                ) > 0,
                'Module AdminPackageManager is not registered in sysconfig, skipping test...'
            );

            return 1;
        }

        # Check breadcrumb on Overview screen.
        $Self->True(
            $Selenium->find_element( '.BreadCrumb', 'css' ),
            'Breadcrumb is found on Overview screen'
        );

        # Check overview AdminPackageManager.
        my $Element = $Selenium->find_element( '#FileUpload', 'css' );
        $Element->is_enabled();
        $Element->is_displayed();

        # Install test package.
        my $Location  = $Selenium->{Home} . '/scripts/test/sample/PackageManager/TestPackage.opm';
        my $LocalFile = $Selenium->upload_file($Location);
        $Selenium->find_element( '#FileUpload', 'css' )->send_keys($LocalFile);

        $Selenium->execute_script('window.Core.App.PageLoadComplete = false;');
        $Selenium->find_element("//button[contains(.,'Install Package')]")->click();
        $Selenium->WaitFor(
            Time       => 120,
            JavaScript => 'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        $Selenium->find_element("//button[contains(.,'Continue')]")->VerifiedClick();

        $Selenium->WaitFor(
            Time       => 120,
            JavaScript => 'return typeof(Core) == "object" && typeof(Core.App) == "object" && Core.App.PageLoadComplete'
        );

        my $PackageCheck = $PackageObject->PackageIsInstalled(
            Name => 'Test',
        );
        $Self->True(
            $PackageCheck,
            'Test package is installed'
        );

        $NavigateToAdminPackageManager->();

        # Load page with metadata of installed package.
        $ClickAction->("//a[contains(.,'Test')]");

        # Check breadcrumb on Package metadata screen.
        $CheckBreadcrumb->(
            BreadcrumbText => 'Package Information:',
        );

        $NavigateToAdminPackageManager->();

        # Uninstall package.
        $ClickAction->("//a[contains(\@href, \'Subaction=Uninstall;Name=Test' )]");

        # Check breadcrumb on uninstall screen.
        $CheckBreadcrumb->(
            BreadcrumbText => 'Uninstall Package:',
        );

        $ClickAction->("//button[\@value='Uninstall package'][\@type='submit']");

        # Check if test package is uninstalled.
        $Self->True(
            index( $Selenium->get_page_source(), 'Subaction=View;Name=Test' ) == -1,
            'Test package is uninstalled'
        );

        $Selenium->VerifiedGet(
            "${ScriptAlias}index.pl?Action=AdminPackageManager;Subaction=View;Name=NonexistingPackage;Version=0.0.1"
        );

        $Selenium->find_element( 'div.ErrorScreen', 'css' );

        $NavigateToAdminPackageManager->();

        # Try to install incompatible test package.
        $Location  = $Selenium->{Home} . '/scripts/test/sample/PackageManager/TestPackageIncompatible.opm';
        $LocalFile = $Selenium->upload_file($Location);
        $Selenium->find_element( '#FileUpload', 'css' )->send_keys($LocalFile);

        $Selenium->execute_script('window.Core.App.PageLoadComplete = false;');

        $ClickAction->("//button[contains(.,'Install Package')]");

        # Check if info for incompatible package is shown.
        $Self->True(
            $Selenium->execute_script(
                "return \$('.WidgetSimple .Content h2:contains(\"Package installation requires a patch level update of Znuny\")').length;"
            ),
            'Info for incompatible package is shown'
        );

        my $Test = $ConfigObject->Get("Package::RepositoryList");

        # Set default repository list.
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'Package::RepositoryList',
            Value => [
                {
                    Name => "Example repository 1",
                    URL  => "https://addons.znuny.com/api/addon_repos/NOPACKAGES",
                }
            ],
        );

        # Allow web server to pick up the changed SysConfig.
        sleep 3;

        $NavigateToAdminPackageManager->();
        $Selenium->InputFieldValueSet(
            Element => '#Source',
            Value   => 'Example repository 1',
        );

        $ClickAction->("//button[\@name=\'GetRepositoryList']");

        # Check that there is a notification about no packages.
        my $Notification = 'No packages found in selected repository. Please check log for more info!';
        $Self->True(
            $Selenium->execute_script("return \$('.MessageBox.Warning p:contains($Notification)').length"),
            "$Notification - notification is found."
        );
    }
);

# Do an implicit cleanup of the test package, in case it's still present in the system.
#   If Selenium Run() method above fails because of an error, it will not proceed to uninstall the test package in an
#   interactive way. Here we check for existence of the test package, and remove it only if it's found.
my $TestPackage = $PackageObject->RepositoryGet(
    Name            => 'Test',
    Version         => '0.0.1',
    DisableWarnings => 1,
);
if ($TestPackage) {
    my $PackageUninstall = $PackageObject->PackageUninstall( String => $TestPackage );
    $Self->True(
        $TestPackage,
        'Test package is cleaned up'
    );
}

$HelperObject->CustomFileCleanup();

1;
