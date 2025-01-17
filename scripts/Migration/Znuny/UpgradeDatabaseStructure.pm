# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::NamePod)

package scripts::Migration::Znuny::UpgradeDatabaseStructure;    ## no critic

use strict;
use warnings;

use parent qw(scripts::Migration::Base);

our @ObjectDependencies = (
    'Kernel::System::Console::Command::Maint::Database::Check',
    'Kernel::System::Main',
);

=head1 SYNOPSIS

Upgrades the database structure to OTRS 6.

=cut

sub Run {
    my ( $Self, %Param ) = @_;

    # enable auto-flushing of STDOUT
    $| = 1;    ## no critic

    my $Verbose = $Param{CommandlineOptions}->{Verbose} || 0;

    my @Tasks = (
        {
            Message => 'Update table smime_keys',
            Module  => 'SMIME',
        },
        {
            Message => 'Increase size of column of database table calendar_appointment_plugin',
            Module  => 'CalendarAppointmentID',
        },
        {
            Message => 'Increase size of columns of database table generic_agent_jobs',
            Module  => 'GenericAgentJobs',
        },
        {
            Message => 'Increase size of columns of database table standard_template',
            Module  => 'StandardTemplate',
        },
        {
            Message => 'Increase size of columns of database table notification_event_message',
            Module  => 'NotificationEventMessage',
        },
        {
            Message => 'Increase size of column of database table customer_user_customer',
            Module  => 'CustomerUserCustomerID',
        },
        {
            Message => 'Increase size of columns of database table search_profile',
            Module  => 'SearchProfile',
        },
    );

    return 1   if !@Tasks;
    print "\n" if $Verbose;

    TASK:
    for my $Task (@Tasks) {

        next TASK if !$Task;
        next TASK if !$Task->{Module};

        print "       - $Task->{Message}\n" if $Verbose;

        my $ModuleName = "scripts::Migration::Znuny::UpgradeDatabaseStructure::$Task->{Module}";
        if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($ModuleName) ) {
            next TASK;
        }

        # Run module.
        $Kernel::OM->ObjectParamAdd(
            "scripts::Migration::Znuny::UpgradeDatabaseStructure::$Task->{Module}" => {
                Opts => $Param{CommandlineOptions},
            },
        );

        my $Object = $Kernel::OM->Create($ModuleName);
        if ( !$Object ) {
            print "\n    Error: System was unable to create object for: $ModuleName.\n\n";
            return;
        }

        my $Success = $Object->Run(%Param);

        if ( !$Success ) {
            print "    Error.\n" if $Verbose;
            return;
        }
    }

    print "\n" if $Verbose;

    return 1;
}

=head2 CheckPreviousRequirement()

Check for initial conditions for running this migration step.

Returns 1 on success:

    my $Result = $MigrateToZnunyObject->CheckPreviousRequirement();

=cut

sub CheckPreviousRequirement {
    my ( $Self, %Param ) = @_;

    my $Verbose = $Param{CommandlineOptions}->{Verbose} || 0;

    print "\n" if $Verbose;

    # Localize standard output and redirect it to a variable in order to decide whether should it be shown later.
    my $StandardOutput;
    my $ConnectionCheck;
    {
        local *STDOUT = *STDOUT;
        undef *STDOUT;
        open STDOUT, '>:utf8', \$StandardOutput;    ## no critic

        # Check if DB connection is possible.
        $ConnectionCheck = $Kernel::OM->Get('Kernel::System::Console::Command::Maint::Database::Check')->Execute();
    }

    print $StandardOutput if $Verbose;

    print "\n" if $Verbose;

    if ( !defined $ConnectionCheck || $ConnectionCheck ne 0 ) {
        print "\n    Error: Not possible to perform DB connection!\n\n";
        return;
    }

    return 1;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
