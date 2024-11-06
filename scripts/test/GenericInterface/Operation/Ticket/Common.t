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

use vars (qw($Self));
use Kernel::System::VariableCheck qw(:all);

use parent qw(
    Kernel::GenericInterface::Operation::Common
    Kernel::GenericInterface::Operation::Ticket::Common
);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        SkipSSLVerify     => 1,
        DisableAsyncCalls => 1,
    },
);

my $HelperObject       = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ServiceObject      = $Kernel::OM->Get('Kernel::System::Service');
my $SLAObject          = $Kernel::OM->Get('Kernel::System::SLA');
my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');
my $TicketObject       = $Kernel::OM->Get('Kernel::System::Ticket');

my $RandomID  = $HelperObject->GetRandomID();
my $TicketID  = $HelperObject->TicketCreate();
my $ArticleID = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
);

my %Ticket = $TicketObject->TicketGet(
    TicketID => $TicketID,
    UserID   => 1,
    Extended => 1,
);

my $DynamicField = $DynamicFieldObject->DynamicFieldListGet(
    Valid      => 1,
    ObjectType => [ 'Ticket', 'Article' ],
);

# create a Dynamic Fields lookup table (by name)
DYNAMICFIELD:
for my $DynamicField ( @{$DynamicField} ) {
    next DYNAMICFIELD if !$DynamicField;
    next DYNAMICFIELD if !IsHashRefWithData($DynamicField);
    next DYNAMICFIELD if !$DynamicField->{Name};
    $Self->{DynamicFieldLookup}->{ $DynamicField->{Name} } = $DynamicField;
}

my $TestCustomerUserLogin = $HelperObject->TestCustomerUserCreate(
    Language  => 'de',
    KeepValid => 1,
);

my $ServiceID = $ServiceObject->ServiceAdd(
    Name    => $RandomID,
    Comment => 'Some Comment',
    ValidID => 1,
    UserID  => 1,
);

$ServiceObject->CustomerUserServiceMemberAdd(
    CustomerUserLogin => $TestCustomerUserLogin,
    ServiceID         => $ServiceID,
    Active            => 1,
    UserID            => 1,
);

my $SLAID = $SLAObject->SLAAdd(
    Name       => $RandomID,
    ServiceIDs => [$ServiceID],
    ValidID    => 1,
    UserID     => 1,
);

my @Tests = (
    {
        Name     => 'ValidateQueue - QueueID - True',
        Function => 'ValidateQueue',
        Data     => {
            QueueID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateQueue - Queue - True',
        Function => 'ValidateQueue',
        Data     => {
            Queue => 'Postmaster',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateQueue - QueueID - False',
        Function => 'ValidateQueue',
        Data     => {
            QueueID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateQueue - Queue - False',
        Function => 'ValidateQueue',
        Data     => {
            Queue => 'UNKNOWN',
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateLock - LockID - True',
        Function => 'ValidateLock',
        Data     => {
            LockID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateLock - Lock - True',
        Function => 'ValidateLock',
        Data     => {
            Lock => 'lock',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateLock - LockID - False',
        Function => 'ValidateLock',
        Data     => {
            LockID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateLock - Lock - False',
        Function => 'ValidateLock',
        Data     => {
            Lock => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateType - TypeID - True',
        Function => 'ValidateType',
        Data     => {
            TypeID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateType - Type - True',
        Function => 'ValidateType',
        Data     => {
            Type => 'Unclassified',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateType - TypeID - False',
        Function => 'ValidateType',
        Data     => {
            TypeID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateType - Type - False',
        Function => 'ValidateType',
        Data     => {
            Type => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name      => 'ValidateCustomer - CustomerUser - True',
        Function  => 'ValidateCustomer',
        SysConfig => [
            {
                Key   => 'CheckEmailAddresses',
                Value => 1,
            }
        ],
        Data => {
            CustomerUser => $TestCustomerUserLogin,
        },
        ExpectedData => 1,
    },
    {
        Name      => 'ValidateCustomer - CustomerUser - True',
        Function  => 'ValidateCustomer',
        SysConfig => [
            {
                Key   => 'CheckEmailAddresses',
                Value => 0,
            }
        ],
        Data => {
            CustomerUser => 'UNKNOWN',
        },
        ExpectedData => 1,
    },
    {
        Name      => 'ValidateCustomer - CustomerUser CheckEmailAddresses - False',
        Function  => 'ValidateCustomer',
        SysConfig => [
            {
                Key   => 'CheckEmailAddresses',
                Value => 1,
            }
        ],
        Data => {
            CustomerUser => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateService - ServiceID - True',
        Function => 'ValidateService',
        Data     => {
            ServiceID    => $ServiceID,
            CustomerUser => $TestCustomerUserLogin,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateService - Service - True',
        Function => 'ValidateService',
        Data     => {
            Service      => $RandomID,
            CustomerUser => $TestCustomerUserLogin,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateService - ServiceID - False',
        Function => 'ValidateService',
        Data     => {
            ServiceID    => 999,
            CustomerUser => $TestCustomerUserLogin,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateService - Service - False',
        Function => 'ValidateService',
        Data     => {
            Service      => 'UNKNOWN',
            CustomerUser => $TestCustomerUserLogin,
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateSLA - SLAID - True',
        Function => 'ValidateSLA',
        Data     => {
            SLAID     => $SLAID,
            ServiceID => $ServiceID,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateSLA - SLA - True',
        Function => 'ValidateSLA',
        Data     => {
            SLA       => $RandomID,
            ServiceID => $ServiceID,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateSLA - SLAID - False',
        Function => 'ValidateSLA',
        Data     => {
            SLAID     => 999,
            ServiceID => $ServiceID,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateSLA - SLA - False',
        Function => 'ValidateSLA',
        Data     => {
            SLA       => 'UNKNOWN',
            ServiceID => $ServiceID,
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateState - StateID - True',
        Function => 'ValidateState',
        Data     => {
            StateID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateState - State - True',
        Function => 'ValidateState',
        Data     => {
            State => 'open',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateState - StateID - False',
        Function => 'ValidateState',
        Data     => {
            StateID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateState - State - False',
        Function => 'ValidateState',
        Data     => {
            State => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidatePriority - PriorityID - True',
        Function => 'ValidatePriority',
        Data     => {
            PriorityID => 3,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidatePriority - Priority - True',
        Function => 'ValidatePriority',
        Data     => {
            Priority => '3 normal',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidatePriority - PriorityID - False',
        Function => 'ValidatePriority',
        Data     => {
            PriorityID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidatePriority - Priority - False',
        Function => 'ValidatePriority',
        Data     => {
            Priority => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateOwner - OwnerID - True',
        Function => 'ValidateOwner',
        Data     => {
            OwnerID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateOwner - Owner - True',
        Function => 'ValidateOwner',
        Data     => {
            Owner => 'root@localhost',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateOwner - OwnerID - False',
        Function => 'ValidateOwner',
        Data     => {
            OwnerID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateOwner - Owner - False',
        Function => 'ValidateOwner',
        Data     => {
            Owner => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateResponsible - ResponsibleID - True',
        Function => 'ValidateResponsible',
        Data     => {
            ResponsibleID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateResponsible - Responsible - True',
        Function => 'ValidateResponsible',
        Data     => {
            Responsible => 'root@localhost',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateResponsible - ResponsibleID - False',
        Function => 'ValidateResponsible',
        Data     => {
            ResponsibleID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateResponsible - Responsible - False',
        Function => 'ValidateResponsible',
        Data     => {
            Responsible => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidatePendingTime - PendingTime - True',
        Function => 'ValidatePendingTime',
        Data     => {
            PendingTime => {
                Year   => 2011,
                Month  => 12,
                Day    => 23,
                Hour   => 15,
                Minute => 0,
            },
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidatePendingTime - Diff - True',
        Function => 'ValidatePendingTime',
        Data     => {
            PendingTime => {
                Diff => 10080,
            },
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidatePendingTime - PendingTime - False',
        Function => 'ValidatePendingTime',
        Data     => {
            PendingTime => {

                # Year   => 2021,
                Month  => 12,
                Day    => 23,
                Hour   => 15,
                Minute => 0,
            },
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidatePendingTime - Diff - False',
        Function => 'ValidatePendingTime',
        Data     => {
            PendingTime => {
                Diff => 'UNKNOWN',
            },
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateAutoResponseType - AutoResponseType - True',
        Function => 'ValidateAutoResponseType',
        Data     => {
            AutoResponseType => 'auto reply',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateAutoResponseType - AutoResponseType - False',
        Function => 'ValidateAutoResponseType',
        Data     => {
            AutoResponseType => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateFrom - From - True',
        Function => 'ValidateFrom',
        Data     => {
            From => 'user@domain.com',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateFrom - From - False',
        Function => 'ValidateFrom',
        Data     => {
            From => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateArticleCommunicationChannel - CommunicationChannelID - True',
        Function => 'ValidateArticleCommunicationChannel',
        Data     => {
            CommunicationChannelID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateArticleCommunicationChannel - CommunicationChannel - True',
        Function => 'ValidateArticleCommunicationChannel',
        Data     => {
            CommunicationChannel => 'Internal',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateArticleCommunicationChannel - CommunicationChannelID - False',
        Function => 'ValidateArticleCommunicationChannel',
        Data     => {
            CommunicationChannelID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateArticleCommunicationChannel - CommunicationChannel - False',
        Function => 'ValidateArticleCommunicationChannel',
        Data     => {
            CommunicationChannel => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateSenderType - SenderTypeID - True',
        Function => 'ValidateSenderType',
        Data     => {
            SenderTypeID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateSenderType - SenderType - True',
        Function => 'ValidateSenderType',
        Data     => {
            SenderType => 'agent',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateSenderType - SenderTypeID - False',
        Function => 'ValidateSenderType',
        Data     => {
            SenderTypeID => 999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateSenderType - SenderType - False',
        Function => 'ValidateSenderType',
        Data     => {
            SenderType => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateMimeType - MimeType - True',
        Function => 'ValidateMimeType',
        Data     => {
            MimeType => 'text/plain',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateMimeType - MimeType - False',
        Function => 'ValidateMimeType',
        Data     => {
            MimeType => 999,
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateCharset - Charset - True',
        Function => 'ValidateCharset',
        Data     => {
            Charset => 'utf-8',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateCharset - Charset - False',
        Function => 'ValidateCharset',
        Data     => {
            Charset => 999,
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateHistoryType - HistoryType - True',
        Function => 'ValidateHistoryType',
        Data     => {
            HistoryType => 'NewTicket',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateHistoryType - HistoryType - False',
        Function => 'ValidateHistoryType',
        Data     => {
            HistoryType => 999,
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateTimeUnit - TimeUnit - True',
        Function => 'ValidateTimeUnit',
        Data     => {
            TimeUnit => 10,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateTimeUnit - TimeUnit negative - False',
        Function => 'ValidateTimeUnit',
        Data     => {
            TimeUnit => -999,
        },
        ExpectedData => undef,
    },
    {
        Name     => 'ValidateTimeUnit - TimeUnit - False',
        Function => 'ValidateTimeUnit',
        Data     => {
            TimeUnit => 'abc',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateUserID - UserID - True',
        Function => 'ValidateUserID',
        Data     => {
            UserID => 1,
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateUserID - UserID - False',
        Function => 'ValidateUserID',
        Data     => {
            UserID => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateDynamicFieldName - Name - True',
        Function => 'ValidateDynamicFieldName',
        Data     => {
            Name => 'ProcessManagementProcessID',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateDynamicFieldName - Name - False',
        Function => 'ValidateDynamicFieldName',
        Data     => {
            Name => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateDynamicFieldValue - DynamicFieldValue - True',
        Function => 'ValidateDynamicFieldValue',
        Data     => {
            Name  => 'ProcessManagementProcessID',
            Value => '1',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateDynamicFieldValue - DynamicFieldValue - False',
        Function => 'ValidateDynamicFieldValue',
        Data     => {
            Name  => 'UNKNOWN',
            Value => '2',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'ValidateDynamicFieldObjectType - Name - True',
        Function => 'ValidateDynamicFieldObjectType',
        Data     => {
            Name => 'ProcessManagementProcessID',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'ValidateDynamicFieldObjectType - Name - False',
        Function => 'ValidateDynamicFieldObjectType',
        Data     => {
            Name => 'UNKNOWN',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'SetDynamicFieldValue - True',
        Function => 'SetDynamicFieldValue',
        Data     => {
            Name     => 'ProcessManagementProcessID',
            Value    => 'some value',
            TicketID => $TicketID,
            UserID   => 1,
        },
        ExpectedData => {
            Success => 1
        },
    },
    {
        Name     => 'SetDynamicFieldValue - Name - False',
        Function => 'SetDynamicFieldValue',
        Data     => {
            Name     => 'UNKNOWN',
            Value    => 'some value',
            TicketID => $TicketID,
            UserID   => 1,
        },
        ExpectedData => {
            ErrorMessage => 'SetDynamicFieldValue() Could not set ObjectID!',
            Success      => 0,
        },
    },

    {
        Name     => 'CreateAttachment - True',
        Function => 'CreateAttachment',
        Data     => {
            TicketID   => $TicketID,
            ArticleID  => $ArticleID,
            Attachment => {
                Content            => 'Something',
                ContentType        => 'text/html; charset="iso-8859-15"',
                Filename           => 'lala.html',
                ContentID          => 'cid-1234',
                ContentAlternative => 0,
                Disposition        => 'attachment',
            },
            UserID => 1,
        },
        ExpectedData => {
            Success => 1
        },
    },
    {
        Name     => 'CreateAttachment - False',
        Function => 'CreateAttachment',
        Data     => {
            TicketID   => $TicketID,
            Attachment => {
                Content            => 'Something',
                ContentType        => 'text/html; charset="iso-8859-15"',
                Filename           => 'lala.html',
                ContentID          => 'cid-1234',
                ContentAlternative => 0,
                Disposition        => 'attachment',
            },
            UserID => 1,
        },
        ExpectedData => {
            Success      => 0,
            ErrorMessage => 'CreateAttachment() Got no ArticleID!'
        },
    },

    {
        Name     => 'CheckCreatePermissions - True',
        Function => 'CheckCreatePermissions',
        Data     => {
            Ticket   => \%Ticket,
            UserID   => 1,
            UserType => 'Agent',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'CheckCreatePermissions - False',
        Function => 'CheckCreatePermissions',
        Data     => {
            Ticket   => {},
            UserID   => 1,
            UserType => 'Agent',
        },
        ExpectedData => undef,
    },

    {
        Name     => 'CheckAccessPermissions - True',
        Function => 'CheckAccessPermissions',
        Data     => {
            TicketID => $TicketID,
            UserID   => 1,
            UserType => 'Agent',
        },
        ExpectedData => 1,
    },
    {
        Name     => 'CheckAccessPermissions - False',
        Function => 'CheckAccessPermissions',
        Data     => {
            TicketID => $TicketID,
            UserID   => 123,
            UserType => 'Agent',
        },
        ExpectedData => undef,
    },
);

TEST:
for my $Test (@Tests) {

    for my $SySConfig ( @{ $Test->{SysConfig} } ) {
        $HelperObject->ConfigSettingChange(
            Valid => 1,
            %{$SySConfig},
        );
    }

    my $Function = $Test->{Function};
    my $Result   = $Self->$Function(
        %{ $Test->{Data} }
    );

    $Self->IsDeeply(
        $Result,
        $Test->{ExpectedData},
        $Test->{Name},
    );
}

# cleanup cache
$Kernel::OM->Get('Kernel::System::Cache')->CleanUp();

1;
