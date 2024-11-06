# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::MigrateSysConfigSettings;    ## no critic

use strict;
use warnings;
use utf8;

use IO::Interactive qw(is_interactive);
use Kernel::System::VariableCheck qw(:all);

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::SysConfig::Migration',
);

=head1 SYNOPSIS

Migrates SysConfig settings.

=cut

=head2 _GetMigrateSysConfigSettings()

Returns the SysConfig settings to be migrated.

    my %MigrateSysConfigSettings = $MigrateToZnunyObject->_GetMigrateSysConfigSettings();

Returns:

    my %MigrateSysConfigSettings = ();

=cut

sub _GetMigrateSysConfigSettings {
    my ( $Self, %Param ) = @_;

    my %MigrateSysConfigSettings = (

        "Loader::Agent::CommonJS###000-Framework" => {
            UpdateEffectiveValue => {
                'thirdparty/jquery-jstree-3.3.7/jquery.jstree.js' => 'thirdparty/jquery-jstree-3.3.8/jquery.jstree.js',
                'thirdparty/nunjucks-3.2.2/nunjucks.min.js'       => 'thirdparty/nunjucks-3.2.3/nunjucks.min.js',
            },
        },
        "Loader::Customer::CommonJS###000-Framework" => {
            UpdateEffectiveValue => {
                'thirdparty/jquery-jstree-3.3.7/jquery.jstree.js' => 'thirdparty/jquery-jstree-3.3.8/jquery.jstree.js',
                'thirdparty/nunjucks-3.2.2/nunjucks.min.js'       => 'thirdparty/nunjucks-3.2.3/nunjucks.min.js',
            },
        },
    );

    return %MigrateSysConfigSettings;
}

=head2 CheckPreviousRequirement()

Check for initial conditions for running this migration step.

Returns 1 on success:

    my $Result = $MigrateToZnunyObject->CheckPreviousRequirement();

=cut

sub CheckPreviousRequirement {
    my ( $Self, %Param ) = @_;

    my %MigrateSysConfigSettings = $Self->_GetMigrateSysConfigSettings();
    return 1 if !%MigrateSysConfigSettings;

    # This check will occur only if we are in interactive mode.
    if ( $Param{CommandlineOptions}->{NonInteractive} || !is_interactive() ) {
        return 1;
    }

    if ( $Param{CommandlineOptions}->{Verbose} ) {
        my %FunctionMap = (
            'UpdateName'           => 'Change name to',
            'AddEffectiveValue'    => 'Add value(s)',
            'UpdateEffectiveValue' => "Update value(s)",
            'DeleteEffectiveValue' => "Delete value(s)",
        );

        print "\n        Warning: The following SysConfig settings will be modified.\n";
        for my $Setting ( sort keys %MigrateSysConfigSettings ) {

            print ' ' x 8 . '-' x 72 . "\n        Name:" . ' ' x 18 . "$Setting\n";

            for my $Function ( sort keys %{ $MigrateSysConfigSettings{$Setting} } ) {
                my $Length = 22 - ( length( $FunctionMap{$Function} ) );
                print "        $FunctionMap{$Function}:" . ' ' x $Length;

                if ( IsStringWithData( $MigrateSysConfigSettings{$Setting}->{$Function} ) ) {
                    print "$MigrateSysConfigSettings{$Setting}->{$Function}\n";
                }
                elsif ( IsArrayRefWithData( $MigrateSysConfigSettings{$Setting}->{$Function} ) ) {
                    print "\n";
                    for my $Key ( @{ $MigrateSysConfigSettings{$Setting}->{$Function} } ) {
                        print ' ' x 31 . "$Key \n";
                    }
                }
                elsif ( IsHashRefWithData( $MigrateSysConfigSettings{$Setting}->{$Function} ) ) {
                    print "\n";

                    for my $Key ( sort keys %{ $MigrateSysConfigSettings{$Setting}->{$Function} } ) {
                        print ' ' x 31 . "$Key => $MigrateSysConfigSettings{$Setting}->{$Function}->{$Key}\n";
                    }
                }
            }
        }
        print ' ' x 8 . '-' x 72 . "\n";
    }
    print "\n        Should the SysConfig be migrated? [Y]es/[N]o: ";

    my $Answer = <>;

    # Remove white space from input.
    $Answer =~ s{\s}{}g;

    # Continue only if user answers affirmatively.
    if ( $Answer =~ m{\Ay(?:es)?\z}i ) {
        print "\n";
        return 1;
    }

    return;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $SysConfigMigrationObject = $Kernel::OM->Get('Kernel::System::SysConfig::Migration');
    my $ConfigObject             = $Kernel::OM->Get('Kernel::Config');

    my $Home      = $ConfigObject->Get('Home');
    my $FileClass = 'Kernel::Config::Files::ZZZAAuto';
    my $FilePath  = "$Home/Kernel/Config/Backups/ZZZAAuto.pm";

    if ( !-f $FilePath ) {
        print "\n\n Error: ZZZAAuto backup file not found.\n";
        return;
    }

    my %MigrateSysConfigSettings = $Self->_GetMigrateSysConfigSettings();
    return 1 if !%MigrateSysConfigSettings;

    my $Success = $SysConfigMigrationObject->MigrateSysConfigSettings(
        FileClass => $FileClass,
        FilePath  => $FilePath,
        Data      => \%MigrateSysConfigSettings,
    );

    return 1;
}

1;
