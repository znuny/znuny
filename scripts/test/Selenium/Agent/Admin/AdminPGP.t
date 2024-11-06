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

use File::Path qw(mkpath rmtree);

my $Selenium = $Kernel::OM->Get('Kernel::System::UnitTest::Selenium');

$Selenium->RunTest(
    sub {

        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
        my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # Create test user and login.
        my $TestUserLogin = $HelperObject->TestUserCreate(
            Groups => ['admin'],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # Disable PGP in config.
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'PGP',
            Value => 0,
        );

        # Create test PGP path and set it in sysConfig.
        my $PGPPath = $ConfigObject->Get('Home') . "/var/tmp/pgp" . $HelperObject->GetRandomID();
        mkpath( [$PGPPath], 0, 0770 );    ## no critic

        my $ScriptAlias = $ConfigObject->Get('ScriptAlias');

        # Navigate to AdminPGP screen.
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AdminPGP");

        # Check breadcrumb on Overview screen.
        $Self->True(
            $Selenium->find_element( '.BreadCrumb', 'css' ),
            "Breadcrumb is found on Overview screen.",
        );

        # Check widget sidebar when PGP sysconfig is disabled.
        $Self->True(
            $Selenium->find_element( 'h3 span.Warning', 'css' ),
            "Widget sidebar with warning message is displayed.",
        );
        $Self->True(
            $Selenium->find_element("//button[\@value='Enable it here!']"),
            "Button 'Enable it here!' to the PGP SysConfig is displayed.",
        );

        # Enable PGP in config.
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'PGP',
            Value => 1,
        );

        # Set PGP path in config.
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            Key   => 'PGP::Options',
            Value => "--homedir $PGPPath --batch --no-tty --yes",
        );

        # Refresh AdminSPGP screen.
        $Selenium->VerifiedRefresh();

        # Add first test PGP key.
        $Selenium->find_element("//a[contains(\@href, \'Action=AdminPGP;Subaction=Add' )]")->VerifiedClick();

        # Check breadcrumb on Add screen.
        for my $BreadcrumbText ( 'PGP Management', 'Add PGP Key' ) {
            $Selenium->ElementExists(
                Selector     => ".BreadCrumb>li>[title='$BreadcrumbText']",
                SelectorType => 'css',
            );
        }

        my $LocalFile1 = $Selenium->{Home}
            . "/scripts/test/sample/Crypt/PGPPrivateKey-1.asc";
        my $Location1 = $Selenium->upload_file($LocalFile1);

        $Selenium->find_element( "#FileUpload", 'css' )->send_keys($Location1);
        $Selenium->find_element("//button[\@type='submit']")->VerifiedClick();

        # Add second test PGP key.
        $Selenium->find_element("//a[contains(\@href, \'Action=AdminPGP;Subaction=Add' )]")->VerifiedClick();
        my $LocalFile2 = $Selenium->{Home}
            . "/scripts/test/sample/Crypt/PGPPrivateKey-2.asc";
        my $Location2 = $Selenium->upload_file($LocalFile2);

        $Selenium->find_element( "#FileUpload", 'css' )->send_keys($Location2);
        $Selenium->find_element("//button[\@type='submit']")->VerifiedClick();

        # Check if test PGP keys show on AdminPGP screen.
        my %PGPKey = (
            1 => "unittest\@example.com",
            2 => "unittest2\@example.com",
        );

        $Self->True(
            index( $Selenium->get_page_source(), $PGPKey{1} ) > -1,
            "$PGPKey{1} test PGP key found on page",
        );
        $Self->True(
            index( $Selenium->get_page_source(), $PGPKey{2} ) > -1,
            "$PGPKey{2} test PGP key found on page",
        );

        # Test search filter.
        $Selenium->find_element( "#Search", 'css' )->send_keys( $PGPKey{1} );
        $Selenium->find_element( "#Search", 'css' )->VerifiedSubmit();

        $Self->True(
            index( $Selenium->get_page_source(), $PGPKey{1} ) > -1,
            "$PGPKey{1} test PGP key found on page",
        );
        $Self->False(
            index( $Selenium->get_page_source(), $PGPKey{2} ) > -1,
            "$PGPKey{2} test PGP key is not found on page",
        );

        # Clear search filter.
        $Selenium->find_element( "#Search", 'css' )->clear();
        $Selenium->find_element( "#Search", 'css' )->VerifiedSubmit();

        # Set test PGP in config so we can delete them.
        $HelperObject->ConfigSettingChange(
            Key   => 'PGP',
            Value => 1,
        );
        $HelperObject->ConfigSettingChange(
            Key   => 'PGP::Options',
            Value => "--homedir $PGPPath --batch --no-tty --yes",
        );

        # Delete test PGP keys.
        for my $Count ( 1 .. 2 ) {
            my @Keys = $Kernel::OM->Get('Kernel::System::Crypt::PGP')->KeySearch(
                Search => $PGPKey{$Count},
            );

            for my $Key (@Keys) {

                # Secure key should be deleted first.
                if ( $Key->{Type} eq 'sec' ) {

                    # Click on delete secure key and public key.
                    for my $Type (qw( sec pub )) {

                        $Selenium->find_element(
                            "//a[contains(\@href, \'Subaction=Delete;Type=$Type;Key=$Key->{FingerprintShort}' )]"
                        )->click();
                        sleep 1;

                        $Selenium->WaitFor( AlertPresent => 1 );
                        $Selenium->accept_alert();

                        $Selenium->WaitFor(
                            JavaScript =>
                                "return typeof(\$) === 'function' && \$('a[href*=\"Delete;Type=$Type;Key=$Key->{FingerprintShort}\"]').length == 0;"
                        );
                        $Selenium->VerifiedRefresh();

                        # Check if PGP key is deleted.
                        $Self->False(
                            $Selenium->execute_script(
                                "return \$('a[href*=\"Delete;Type=$Type;Key=$Key->{FingerprintShort}\"]').length;"
                            ),
                            "PGPKey $Type - $Key->{Identifier} deleted",
                        );

                    }
                }
            }
        }

        # Remove test PGP path.
        my $Success = rmtree( [$PGPPath] );
        $Self->True(
            $Success,
            "Directory deleted - '$PGPPath'",
        );

    }

);

1;
