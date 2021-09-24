# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## no critic (Modules::RequireExplicitPackage)
use strict;
use warnings;
use vars (qw($Self));

use Kernel::System::VariableCheck qw(:all);

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

$Kernel::OM->Get('Kernel::System::Main')->Require('Kernel::Modules::AdminProcessManagementTransitionAction');
my $TestModule = Kernel::Modules::AdminProcessManagementTransitionAction->new();

# define variables
my $ModuleName = 'AdminProcessManagementTransitionActionParameter';

my $RandomID   = $Helper->GetRandomID();

#
# Create the config for testing
#

# add config
$Kernel::OM->Get('Kernel::Config')->Set(
    Key => 'TransitionActionDefaultParameter::Settings', 
    Value => {
        'TicketCreate' => {
            'Body' => $RandomID,
            'From' => 'otrs',
            'UserID' => '123'
        },
        'TicketCustomerSet' => {
            'CustomerID' => 'client123',
            'CustomerUserID' => 'client-user-123'
        },
        'TicketLockSet' => {
            'Lock' => '(Lock|Unlock)',
            'LockID' => '(1|2)'
        },
    }
);

# add tests
my @ParameterTestConfigs = (
    {
        Name       => 'TicketCreate',
        ActionModule => 'Kernel::System::ProcessManagement::TransitionAction::TicketCreate',
        Result  => {
            'Body' => $RandomID,
            'From' => 'otrs',
            'UserID' => '123'
        },
    },
    {
        Name       => 'TicketCustomerSet',
        ActionModule => 'Kernel::System::ProcessManagement::TransitionAction::TicketCustomerSet',
        Result  => {
            'CustomerID' => 'client123',
            'CustomerUserID' => 'client-user-123'
        },
    },
    {
        Name       => 'UnknownConfig',
        ActionModule => $RandomID,
        Result  => {},
    },
    {
        Name       => 'EmptyConfig',
        ActionModule => '',
        Result  => {},
    },
);

for my $Test (@ParameterTestConfigs) {

    my %Expectation = %{$Test->{Result}};

    # run module
    my %Result = $TestModule->_GetDefaultConfigParameters(
        Module => $Test->{ActionModule},
    );
       
    # compare hashes
    my $DataIsDifferent = DataIsDifferent(
        Data1 => \%Expectation,
        Data2 => \%Result,
    );

    $Self->True(
        !$DataIsDifferent,
        "Result is equal to the expectation.",
    );

}

1;
