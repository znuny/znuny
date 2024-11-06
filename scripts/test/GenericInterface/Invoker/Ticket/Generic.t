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

use MIME::Base64;

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $ConfigObject             = $Kernel::OM->Get('Kernel::Config');
my $HelperObject             = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ZnunyHelperObject        = $Kernel::OM->Get('Kernel::System::ZnunyHelper');
my $UnitTestWebserviceObject = $Kernel::OM->Get('Kernel::System::UnitTest::Webservice');
my $CustomerCompanyObject    = $Kernel::OM->Get('Kernel::System::CustomerCompany');
my $TicketObject             = $Kernel::OM->Get('Kernel::System::Ticket');
my $ArticleObject            = $Kernel::OM->Get('Kernel::System::Ticket::Article');

my $Home = $ConfigObject->Get('Home');

# Enable base-64-encoding for certain fields
$ConfigObject->Set(
    Key   => 'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::Base64EncodedFields',
    Value => {
        Generic => 'Articles->Body;CustomerCompany->CustomerCompanyCity;Owner',
    },
);

# Enable removal of certain fields
$ConfigObject->Set(
    Key   => 'GenericInterface::Invoker::Ticket::Generic::PrepareRequest::OmittedFields',
    Value => {
        Generic => 'Articles->IsVisibleForCustomer;CustomerCompany->CustomerCompanyStreet;Queue;ArticleID',
    },
);

$ZnunyHelperObject->_WebserviceCreate(
    Webservices => {
        Generic => $Home . '/scripts/test/sample/Webservice/ZnunyGeneric.yml',
    },
);

my @DynamicFields = (
    {
        Name       => 'InvokerGenericTest',
        Label      => 'InvokerGenericTest',
        ObjectType => 'Ticket',
        FieldType  => 'Text',
        Config     => {
            DefaultValue => "",
        },
    },
);

$ZnunyHelperObject->_DynamicFieldsCreate(@DynamicFields);

my %CustomerUserData = $HelperObject->TestCustomerUserDataGet(
    Language => 'de',
);

my %UserData = $HelperObject->TestUserDataGet(
    Groups   => [ 'admin', 'users' ],
    Language => 'de'
);

$CustomerCompanyObject->CustomerCompanyAdd(
    CustomerID             => 'example.com',
    CustomerCompanyName    => 'New Customer Inc.',
    CustomerCompanyStreet  => '5201 Blue Lagoon Drive',
    CustomerCompanyZIP     => '33126',
    CustomerCompanyCity    => 'Miami',
    CustomerCompanyCountry => 'USA',
    CustomerCompanyURL     => 'http://www.example.org',
    CustomerCompanyComment => 'some comment',
    ValidID                => 1,
    UserID                 => 1,
);

my $ServiceID = $ZnunyHelperObject->_ServiceCreateIfNotExists(
    Name => 'ttt-service',
);

my $TypeID = $ZnunyHelperObject->_TypeCreateIfNotExists(
    Name => 'ttt-type',
);

my $SLAID = $ZnunyHelperObject->_SLACreateIfNotExists(
    Name => 'ttt-sla',
);

my $QueueID = $ZnunyHelperObject->_QueueCreateIfNotExists(
    Name    => 'ttt-queue',
    GroupID => 1,
);

# HandleResponse
my $TicketID        = $HelperObject->TicketCreate();
my $ArticleIDEvent1 = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
);
my $ArticleIDEvent2 = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
);

my $ResultPrepareRequest = $UnitTestWebserviceObject->InvokerFunctionCall(
    Webservice => 'Generic',
    Invoker    => 'Generic',
    Function   => 'PrepareRequest',
    Data       => {
        Data => {
            Event    => 'TicketCreate',
            TicketID => $TicketID,
        },
    },
);

my $Result = $UnitTestWebserviceObject->InvokerFunctionCall(
    Webservice => 'Generic',
    Invoker    => 'Generic',
    Function   => 'HandleResponse',
    Data       => {
        ResponseSuccess => 1,
        Data            => {
            OTRS_TicketDynamicFieldSet_InvokerGenericTest => 'Hallo',
            OTRS_TicketTitleUpdate                        => 'invoker test title',
            OTRS_TicketServiceSet                         => 'ttt-service',
            OTRS_TicketTypeSet                            => 'ttt-type',
            OTRS_TicketQueueSet                           => 'ttt-queue',
            OTRS_TicketSLASet                             => 'ttt-sla',
            OTRS_TicketCustomerSet                        => 'example.com;' . $CustomerUserData{UserLogin},
            OTRS_TicketStateSet                           => 'closed successful',
            OTRS_TicketOwnerSet                           => $UserData{UserLogin},
            OTRS_TicketResponsibleSet                     => $UserData{UserLogin},
            OTRS_TicketPrioritySet                        => '5 very high',
            OTRS_TicketHistoryAdd                         => {
                HistoryComment => 'OTRS_TicketHistoryAdd Comment',
                HistoryType    => 'AddNote',
            },
            OTRS_TicketArticleAdd => {
                SenderType           => 'agent',
                IsVisibleForCustomer => 1,
                From                 => 'Some Agent <email@example.com>',
                To                   => 'Some Customer A <customer-a@example.com>',
                Cc                   => 'Some Customer B <customer-b@example.com>',
                Bcc                  => 'Some Customer C <customer-c@example.com>',
                ReplyTo              => 'Some Customer B <customer-b@example.com>',
                Subject              => 'some short description',
                Body                 => 'the message text',
                MessageID            => '<asdasdasd.123@example.com>',
                InReplyTo            => '<asdasdasd.12@example.com>',
                References           => '<asdasdasd.1@example.com> <asdasdasd.12@example.com>',
                ContentType          => 'text/plain; charset=ISO-8859-15',
                HistoryType          => 'OwnerUpdate',
                HistoryComment       => 'Some free text!',
            },
            OTRS_TicketArticleCreateEvent => "$ArticleIDEvent1 , $ArticleIDEvent2"
        },
    },
    ObjectModifyFunction => sub {
        my (%Params) = @_;

        $Params{Object}->{BackendObject}->{RequestData} = $ResultPrepareRequest->{Data};

        return 1;
    },
);

$Self->True(
    $Result->{Success},
    'Handle response executed successfully',
);

my %Ticket = $TicketObject->TicketGet(
    TicketID      => $TicketID,
    DynamicFields => 1,
    UserID        => 1,
);

my %ExpectedData = (
    DynamicField_InvokerGenericTest => 'Hallo',
    Title                           => 'invoker test title',
    Service                         => 'ttt-service',
    Type                            => 'ttt-type',
    Queue                           => 'ttt-queue',
    SLA                             => 'ttt-sla',
    CustomerID                      => 'example.com',
    CustomerUserID                  => $CustomerUserData{UserLogin},
    State                           => 'closed successful',
    Owner                           => $UserData{UserLogin},
    Responsible                     => $UserData{UserLogin},
    Priority                        => '5 very high',
);

for my $Key ( sort keys %ExpectedData ) {
    $Self->Is(
        $Ticket{$Key},
        $ExpectedData{$Key},
        "Ticket $Key filled correctly.",
    );
}

# check OTRS_TicketHistoryAdd

my @HistoryLines = $TicketObject->HistoryGet(
    TicketID => $TicketID,
    UserID   => 1,
);

@HistoryLines = grep { 'OTRS_TicketHistoryAdd Comment' eq $_->{Name} } @HistoryLines;

$Self->True(
    @HistoryLines,
    'OTRS_TicketHistoryAdd',
);

%ExpectedData = (
    Name        => 'OTRS_TicketHistoryAdd Comment',
    HistoryType => 'AddNote',
);

for my $Key ( sort keys %ExpectedData ) {
    $Self->Is(
        $HistoryLines[0]->{$Key},
        $ExpectedData{$Key},
        "TicketHistory $Key filled correctly.",
    );
}

# OTRS_TicketArticleAdd

my @ArticleIDs = $ArticleObject->ArticleIndex(
    TicketID => $TicketID,
);

my %Article = $ArticleObject->ArticleGet(
    TicketID  => $TicketID,
    ArticleID => $ArticleIDs[-1],
);

$Self->IsDeeply(
    \%Article,
    {
        ArticleID              => $ArticleIDs[-1],
        ArticleNumber          => 3,
        Bcc                    => 'Some Customer C <customer-c@example.com>',
        Body                   => 'the message text',
        Cc                     => 'Some Customer B <customer-b@example.com>',
        ChangeBy               => 1,
        ChangeTime             => $Article{ChangeTime},
        Charset                => 'ISO-8859-15',
        CommunicationChannelID => 3,
        ContentCharset         => 'ISO-8859-15',
        ContentType            => 'text/plain; charset=ISO-8859-15',
        CreateBy               => 1,
        CreateTime             => $Article{CreateTime},
        From                   => 'Some Agent <email@example.com>',
        InReplyTo              => '<asdasdasd.12@example.com>',
        IncomingTime           => $Article{IncomingTime},
        IsVisibleForCustomer   => 1,
        MessageID              => '<asdasdasd.123@example.com>',
        MimeType               => 'text/plain',
        References             => '<asdasdasd.1@example.com> <asdasdasd.12@example.com>',
        ReplyTo                => 'Some Customer B <customer-b@example.com>',
        SenderType             => 'agent',
        SenderTypeID           => '1',
        Subject                => 'some short description',
        TicketID               => $TicketID,
        To                     => 'Some Customer A <customer-a@example.com>'
    },
    'OTRS_TicketArticleAdd',
);

# PrepareRequest

$TicketID = $HelperObject->TicketCreate(
    CustomerUser => $CustomerUserData{UserLogin},
    CustomerID   => 'example.com',
    ServiceID    => $ServiceID,
    TypeID       => $TypeID,
    SLAID        => $SLAID,
);

my $ArticleID1 = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
    Body     => 'Body of article 1.',
);
my $ArticleID2 = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
    Body     => 'Body of article 2.',
);
my $ArticleID3 = $HelperObject->ArticleCreate(
    TicketID => $TicketID,
    Body     => 'Body of article 3.',
);

$Result = $UnitTestWebserviceObject->InvokerFunctionCall(
    Webservice => 'Generic',
    Invoker    => 'Generic',
    Function   => 'PrepareRequest',
    Data       => {
        Data => {
            Event     => 'ArticleCreate',
            TicketID  => $TicketID,
            ArticleID => $ArticleID3,
        },
    },
);

$Self->IsNot(
    $Result->{Data}->{Event}->{Event},
    undef,
    'event name is filled',
);
$Self->True(
    IsHashRefWithData( $Result->{Data}->{Event} ) ? 1 : 0,
    'Event data is filled',
);
$Self->True(
    IsHashRefWithData( $Result->{Data}->{Ticket} ) ? 1 : 0,
    'Ticket data is filled',
);

my @ExpectedData = (
    'CustomerUser', 'CustomerCompany', 'QueueData', 'TypeData', 'PriorityData', 'ServiceData',
    'SLAData', 'OwnerData', 'ResponsibleData', 'CreateByData', 'Article'
);

for my $Key ( sort @ExpectedData ) {
    $Self->True(
        IsHashRefWithData( $Result->{Data}->{Ticket}->{$Key} ) ? 1 : 0,
        "$Key data is filled",
    );
}

$Self->Is(
    $Result->{Data}->{Ticket}->{CreateByData}->{UserPw},
    undef,
    'CreateByData->UserPw got removed',
);
$Self->Is(
    $Result->{Data}->{Ticket}->{ResponsibleData}->{UserPw},
    undef,
    'ResponsibleData->UserPw got removed',
);
$Self->Is(
    $Result->{Data}->{Ticket}->{OwnerData}->{UserPw},
    undef,
    'OwnerData->UserPw got removed',
);
$Self->Is(
    $Result->{Data}->{Ticket}->{CustomerUser}->{UserPassword},
    undef,
    'CustomerUser->UserPassword got removed',
);

#
# Check base-64-encoding of values of configured fields.
#
my @ArticleBodiesBase64 = (
    encode_base64('Body of article 1.'),
    encode_base64('Body of article 2.'),
    encode_base64('Body of article 3.'),
);

my $CustomerCompanyCityBase64 = encode_base64('Miami');
my $OwnerBase64               = encode_base64('root@localhost');

my $ArticleIndex = 0;
for my $Article ( @{ $Result->{Data}->{Ticket}->{Articles} } ) {
    $Self->Is(
        $Article->{Body},
        $ArticleBodiesBase64[$ArticleIndex],
        "Body of article $ArticleIndex must be base-64 encoded.",
    );

    $ArticleIndex++;
}

$Self->Is(
    $Result->{Data}->{Ticket}->{CustomerCompany}->{CustomerCompanyCity},
    $CustomerCompanyCityBase64,
    'City of customer company must be base-64 encoded.',
);

$Self->Is(
    $Result->{Data}->{Ticket}->{Owner},
    $OwnerBase64,
    'Owner must be base-64 encoded.',
);

#
# Check absence of omitted fields.
#

#        Generic => 'Articles->IsVisibleForCustomer;CustomerCompany->CustomerCompanyStreet;Queue;ArticleID',
$ArticleIndex = 0;
for my $Article ( @{ $Result->{Data}->{Ticket}->{Articles} } ) {
    $Self->False(
        exists $Article->{IsVisibleForCustomer},
        "Articles must not contain field 'IsVisibleForCustomer'.",
    );

    $ArticleIndex++;
}

$Self->False(
    exists $Result->{Data}->{Event}->{ArticleID},
    "Event hash must not contain key ArticleID.",
);

$Self->False(
    exists $Result->{Data}->{Ticket}->{CustomerCompany}->{CustomerCompanyStreet},
    "Customer company must not contain field 'CustomerCompanyStreet'.",
);

$Self->False(
    exists $Result->{Data}->{Ticket}->{Queue},
    "Ticket must not contain field 'Queue'.",
);

1;
