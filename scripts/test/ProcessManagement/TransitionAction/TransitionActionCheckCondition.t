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

use Kernel::System::VariableCheck qw(:all);
use Data::Dumper;

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
        UseTmpArticleDir => 1,
    },
);

# get needed objects
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
my $BackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
my $ServiceObject = $Kernel::OM->Get('Kernel::System::Service');
my $SLAObject = $Kernel::OM->Get('Kernel::System::SLA');
my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

$HelperObject->ConfigSettingChange(
    Valid => 1,
    Key => 'Ticket::Type',
    Value => 1,
);
my $RandomID = $HelperObject->GetRandomID();
my $DFName1  = 'Test1' . $RandomID;
my ( $UserLogin, $UserID ) = $HelperObject->TestUserCreate();
my $TestUserLogin = $HelperObject->TestCustomerUserCreate();

my $TicketID = $TicketObject->TicketCreate(
    Title => 'test',
    QueueID => 1,
    Lock => 'unlock',
    Priority => '3 normal',
    StateID => 1,
    TypeID => 1,
    OwnerID => 1,
    ResponsibleID => 1,
    UserID => $UserID,
);

my $Success = $TicketObject->TicketCustomerSet(
    User => $TestUserLogin,
    TicketID => $TicketID,
    UserID => 1,
);

my %DynamicFieldConfig = (
    Name => $DFName1,
    Label => $DFName1,
    FieldType => 'Dropdown',
    ObjectType => 'Ticket',
    Config => {
        TranslatableValues => '0',
        PossibleValues => {
            1 => 'A',
            2 => 'B',
            3 => 'C',
        },
    },
    
);
my $ID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldConfig,
    FieldOrder => 99999,
    ValidID => 1,
    UserID => 1,
);
my $DynamicField = $DynamicFieldObject->DynamicFieldGet(
    ID => $ID,
);

$Self->True(
    $ID,
    "DynamicFieldCreated"
);

# add service
my $ServiceID = $ServiceObject->ServiceAdd(
    Name => 'UnitTest'. $RandomID,
    ValidID => 1,
    UserID => 1,
);

$ServiceObject->CustomerUserServiceMemberAdd(
    CustomerUserLogin => $TestUserLogin,
    ServiceID => $ServiceID,
    Active => 1,
    UserID => 1,
);

my %ServiceData = $ServiceObject->ServiceGet(
    ServiceID => $ServiceID,
    UserID => 1,
);

# add SLA
my $SLAID = $SLAObject->SLAAdd(
    ServiceIDs          => [$ServiceID],
    Name                => 'SLA Name'. $RandomID,
    Calendar            => 'Calendar1',
    ValidID             => 1,
    UserID              => 1,
);
# web service config
my $WebserviceConfig = {
    Debugger => {
        DebugThreshold => 'debug',
        TestMode => 1,
    },
    Requester => {
        Transport => {
            Type => 'HTTP::Test',
            Config => {
                Fail => 0,
            },
        },
        Invoker => {
            test_operation => {
                Type => 'Test::TestSimple',
            },
        },
    },
};

my $WebserviceID = $WebserviceObject->WebserviceAdd(
    Config => $WebserviceConfig,
    Name => "Test $RandomID",
    ValidID => 1,
    UserID => 1,
);

my @Tests = (
    {
        Name => 'DynamicFieldSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T2',
            TransitionActionEntityID => 'TA1',
            Config => {
                $DFName1 => 'New Value'
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'DynamicFieldSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T2',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                $DFName1 => 'New Value'
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'DynamicFieldSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                $DFName1 => 'New Value'
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'DynamicFieldSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => '',
                $DFName1 => 'New Value'
            },
        },
        Success => 1,
        DynamicFieldValue => 0,
    },
    {
        Name => 'DynamicFieldSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'ExecuteInvoker',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                Webservice => "Test $RandomID",
                Invoker => 'Test::TestSimple',
                UserID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'ExecuteInvoker',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                Webservice => {
                    ID => 1,                    
                },
                Invoker => 'Notify by chat',
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketArticleCreate',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                 _Check => "DynamicField_" . $DFName1,
                SenderType => 'agent',
                IsVisibleForCustomer => 1,
                CommunicationChannel => 'Internal',

                # Internal article data payload.
                From => 'Some Agent <email@example.com>',
                To => 'Some Customer A <customer-a@example.com>',
                Subject => 'some short description',
                Body => 'the message text',
                Charset => 'ISO-8859-15',
                MimeType => 'text/plain',
                HistoryType => 'OwnerUpdate',
                HistoryComment => 'Some free text!',
                UnlockOnAway => 1,              
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketArticleCreate',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                SenderType => 'agent',
                IsVisibleForCustomer => 1,
                CommunicationChannel => 'Internal',

                # Internal article data payload.
                From => 'Some Agent <email@example.com>',
                To => 'Some Customer A <customer-a@example.com>',
                Subject => 'some short description',
                Body => 'the message text',
                Charset => 'ISO-8859-15',
                MimeType => 'text/plain',
                HistoryType => 'OwnerUpdate',
                HistoryComment => 'Some free text!',
                UnlockOnAway => 1,             
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketCreate',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                OwnerID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketCreate',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                OwnerID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketCustomerSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                CustomerID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketCustomerSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                CustomerID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketLockSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                LockID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketLockSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                LockID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketOwnerSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                OwnerID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketOwnerSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                OwnerID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketQueueSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                QueueID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },    
    {
        Name => 'TicketQueueSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                QueueID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketResponsibleSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                ResponsibleID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketResponsibleSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                ResponsibleID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketServiceSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                ServiceID => $ServiceData{ServiceID},
                Service => $ServiceData{Name},
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketServiceSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                ServiceID => $ServiceData{ServiceID},
                Service => $ServiceData{Name},
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketSLASet',
        Config => {
            UserID => 1,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                SLAID => $SLAID,
                SLA => 'SLA Name'. $RandomID,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketSLASet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                SLAID => $SLAID,
                SLA => 'SLA Name'. $RandomID,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketStateSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                StateID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketStateSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                StateID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketTitleSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                Title => 'Test Title',
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketTitleSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                Title => 'Test Title',
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
    {
        Name => 'TicketTypeSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                TypeID => 1,
            },
        },
        Success => 1,
        DynamicFieldValue => 1,
    },
    {
        Name => 'TicketTypeSet',
        Config => {
            UserID => $UserID,
            ProcessEntityID => 'P1',
            ActivityEntityID => 'A1',
            TransitionEntityID => 'T1',
            TransitionActionEntityID => 'TA1',
            Config => {
                _Check => "DynamicField_" . $DFName1,
                TypeID => 1,
            },
        },
        Success => 0,
        DynamicFieldValue => 0,
    },
);

for my $Test (@Tests) {

    my $Success = $BackendObject->ValueSet(
        DynamicFieldConfig => $DynamicField,
        ObjectID => $TicketID,
        UserID => 1,
        Value => $Test->{DynamicFieldValue},
    );

    my %Ticket = $TicketObject->TicketGet(
        TicketID => $TicketID,
        DynamicFields => 1,
        UserID => 1,
    );
    $Test->{Config}->{Ticket} = \%Ticket;
    $Test->{Config}->{Ticket}->{ServiceID} = $ServiceID;

    my $ModulName = "Kernel::System::ProcessManagement::TransitionAction::" . $Test->{Name};
    my $ModulObject = $Kernel::OM->Get($ModulName);
    my $CheckResult = $ModulObject->Run( %{ $Test->{Config} } );

    if ( $Test->{Success} ) {
        $Self->Is(
            $CheckResult,
            1,
            "Run() for test $Test->{Name} should return 1",
        );
    }
    else {
        $Self->IsNot(
            $CheckResult,
            1,
            "Run() for test $Test->{Name} should not return 1",
        );
    }
}

1;
