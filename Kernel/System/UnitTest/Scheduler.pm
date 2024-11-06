# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::Scheduler;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Daemon::SchedulerDB',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::UnitTest::Scheduler - Scheduler unit test lib

=head1 SYNOPSIS

All Scheduler functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $UnitTestSchedulerObject = $Kernel::OM->Get('Kernel::System::UnitTest::Scheduler');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->CleanUp();

    return $Self;
}

=head2 CleanUp()

Removes all entries in the SchedulerDB.

    my $Success = $UnitTestSchedulerObject->CleanUp(
        Type => 'AsynchronousExecutor', # optional
    );

=cut

sub CleanUp {
    my ( $Self, %Param ) = @_;

    my $SchedulerDBObject = $Kernel::OM->Get('Kernel::System::Daemon::SchedulerDB');

    my @DeleteTasks = $SchedulerDBObject->TaskList(
        Type => $Param{Type},
    );

    for my $DeleteTask (@DeleteTasks) {
        $SchedulerDBObject->TaskDelete(
            TaskID => $DeleteTask->{TaskID},
        );
    }

    return 1;
}

=head2 Execute()

Executes all entries in the SchedulerDB.

    my $Success = $UnitTestSchedulerObject->Execute(
        Type => 'AsynchronousExecutor', # optional
    );

=cut

sub Execute {
    my ( $Self, %Param ) = @_;

    my $SchedulerDBObject = $Kernel::OM->Get('Kernel::System::Daemon::SchedulerDB');

    my @Tasks = $SchedulerDBObject->TaskList(
        Type => $Param{Type},
    );

    for my $Task (@Tasks) {
        my %Task = $SchedulerDBObject->TaskGet(
            TaskID => $Task->{TaskID},
        );

        my $TaskHandlerObject
            = $Kernel::OM->Get( 'Kernel::System::Daemon::DaemonModules::SchedulerTaskWorker::' . $Task{Type} );

        $TaskHandlerObject->Run(
            TaskID   => $Task{TaskID},
            TaskName => $Task{Name},
            Data     => $Task{Data},
        );

        $SchedulerDBObject->TaskDelete(
            TaskID => $Task{TaskID},
        );
    }

    return 1;
}

=head2 CheckCount()

Checks the count of the entries in the SchedulerDB.

    my $Success = $UnitTestSchedulerObject->CheckCount(
        UnitTestObject => $Self,
        Count          => '2',
        Message        => "2 'AsynchronousExecutor' tasks added",    # optional
        Type           => 'AsynchronousExecutor',                    # optional
    );

=cut

sub CheckCount {
    my ( $Self, %Param ) = @_;

    my $SchedulerDBObject = $Kernel::OM->Get('Kernel::System::Daemon::SchedulerDB');
    my $LogObject         = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Count UnitTestObject)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my @CountCheckTasks = $SchedulerDBObject->TaskList(
        Type => $Param{Type},
    );

    if ( $Param{Type} ) {
        $Param{Message} //= "$Param{Count} '$Param{Type}' tasks added";
    }
    else {
        $Param{Message} //= "$Param{Count} tasks added";
    }

    return $Param{UnitTestObject}->Is(
        scalar @CountCheckTasks,
        $Param{Count},
        $Param{Message},
    );
}

1;
