# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

## no critic (Modules::RequireExplicitPackage)
package main;
use strict;
use warnings;
use utf8;
use Storable 'dclone';
use vars (qw($Self));

use Kernel::GenericInterface::Debugger;
use Kernel::GenericInterface::Operation::Session::SessionCreate;
use Kernel::GenericInterface::Operation::Ticket::TicketUpdate;
use Kernel::GenericInterface::Requester;

use Kernel::System::VariableCheck qw(:all);

# skip SSL certificate verification
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        SkipSSLVerify => 1,
    },
);
my $HelperObject = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

$HelperObject->ConfigSettingChange(
    Valid => 1,
    Key   => 'CheckMXRecord',
    Value => 0,
);

my $RandomID = $HelperObject->GetRandomNumber();

# create a new user for current test
my $UserLogin = $HelperObject->TestUserCreate(
    Groups => ['users'],
);
my $Password = $UserLogin;

my $UserObject = $Kernel::OM->Get('Kernel::System::User');

$Self->{UserID} = $UserObject->UserLookup(
    UserLogin => $UserLogin,
);

# create a new user without permissions for current test
my $UserLogin2 = $HelperObject->TestUserCreate();
my $Password2  = $UserLogin2;

# create a customer where a ticket will use and will have permissions
my $CustomerUserLogin = $HelperObject->TestCustomerUserCreate();
my $CustomerPassword  = $CustomerUserLogin;

# create a customer that will not have permissions
my $CustomerUserLogin2 = $HelperObject->TestCustomerUserCreate();
my $CustomerPassword2  = $CustomerUserLogin2;

my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

# add text dynamic field
my %DynamicFieldTextConfig = (
    Name       => "Unittest1$RandomID",
    FieldOrder => 9991,
    FieldType  => 'Text',
    ObjectType => 'Ticket',
    Label      => 'Description',
    ValidID    => 1,
    Config     => {
        DefaultValue => '',
    },
);
my $FieldTextID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldTextConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldTextID,
    "Dynamic Field $FieldTextID",
);

# add ID
$DynamicFieldTextConfig{ID} = $FieldTextID;

# add dropdown dynamic field
my %DynamicFieldDropdownConfig = (
    Name       => "Unittest2$RandomID",
    FieldOrder => 9992,
    FieldType  => 'Dropdown',
    ObjectType => 'Ticket',
    Label      => 'Description',
    ValidID    => 1,
    Config     => {
        PossibleValues => {
            1 => 'One',
            2 => 'Two',
            3 => 'Three',
            0 => '0',
        },
    },
);
my $FieldDropdownID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldDropdownConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldDropdownID,
    "Dynamic Field $FieldDropdownID",
);

# add ID
$DynamicFieldDropdownConfig{ID} = $FieldDropdownID;

# add multiselect dynamic field
my %DynamicFieldMultiselectConfig = (
    Name       => "Unittest3$RandomID",
    FieldOrder => 9993,
    FieldType  => 'Multiselect',
    ObjectType => 'Ticket',
    Label      => 'Multiselect label',
    ValidID    => 1,
    Config     => {
        PossibleValues => {
            1 => 'Value9ßüß',
            2 => 'DifferentValue',
            3 => '1234567',
        },
    },
);
my $FieldMultiselectID = $DynamicFieldObject->DynamicFieldAdd(
    %DynamicFieldMultiselectConfig,
    UserID  => 1,
    Reorder => 0,
);
$Self->True(
    $FieldMultiselectID,
    "Dynamic Field $FieldMultiselectID",
);

# add ID
$DynamicFieldMultiselectConfig{ID} = $FieldMultiselectID;

# create ticket object
my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

#ticket id container
my @TicketIDs;

# create ticket 1
my $TicketID1 = $TicketObject->TicketCreate(
    Title        => 'Ticket One Title',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'new',
    CustomerID   => $CustomerUserLogin,
    CustomerUser => 'unittest@otrs.com',
    OwnerID      => 1,
    UserID       => 1,
);

# sanity check
$Self->True(
    $TicketID1,
    "TicketCreate() successful for Ticket One ID $TicketID1",
);

my %Ticket = $TicketObject->TicketGet(
    TicketID => $TicketID1,
    UserID   => 1,
);

# remember ticket id
push @TicketIDs, $TicketID1;

# create backed object
my $BackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');
$Self->Is(
    ref $BackendObject,
    'Kernel::System::DynamicField::Backend',
    'Backend object was created successfully',
);

# set text field value
my $Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldTextConfig,
    ObjectID           => $TicketID1,
    Value              => 'ticket1_field1',
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Text ValueSet() for Ticket $TicketID1",
);

# set dropdown field value
$Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldDropdownConfig,
    ObjectID           => $TicketID1,
    Value              => 1,
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Multiselect ValueSet() for Ticket $TicketID1",
);

# set multiselect field value
$Result = $BackendObject->ValueSet(
    DynamicFieldConfig => \%DynamicFieldMultiselectConfig,
    ObjectID           => $TicketID1,
    Value              => [ 2, 3 ],
    UserID             => 1,
);

# sanity check
$Self->True(
    $Result,
    "Dropdown ValueSet() for Ticket $TicketID1",
);

# set web service name
my $WebserviceName = $HelperObject->GetRandomID();

# create web-service object
my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

$Self->Is(
    'Kernel::System::GenericInterface::Webservice',
    ref $WebserviceObject,
    "Create web service object",
);

my $WebserviceID = $WebserviceObject->WebserviceAdd(
    Name   => $WebserviceName,
    Config => {
        Debugger => {
            DebugThreshold => 'debug',
        },
        Provider => {
            Transport => {
                Type => '',
            },
        },
    },
    ValidID => 1,
    UserID  => 1,
);
$Self->True(
    $WebserviceID,
    "Added web service",
);

# get config object
my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

# get remote host with some precautions for certain unit test systems
my $Host = $HelperObject->GetTestHTTPHostname();

# prepare web-service config
my $RemoteSystem =
    $ConfigObject->Get('HttpType')
    . '://'
    . $Host
    . '/'
    . $ConfigObject->Get('ScriptAlias')
    . '/nph-genericinterface.pl/WebserviceID/'
    . $WebserviceID;

my $WebserviceConfig = {

    #    Name => '',
    Description =>
        'Test for Ticket Connector using SOAP transport backend.',
    Debugger => {
        DebugThreshold => 'debug',
        TestMode       => 1,
    },
    Provider => {
        Transport => {
            Type   => 'HTTP::SOAP',
            Config => {
                MaxLength => 10000000,
                NameSpace => 'http://otrs.org/SoapTestInterface/',
                Endpoint  => $RemoteSystem,
            },
        },
        Operation => {
            TicketUpdate => {
                Type => 'Ticket::TicketUpdate',
            },
            SessionCreate => {
                Type => 'Session::SessionCreate',
            },
        },
    },
    Requester => {
        Transport => {
            Type   => 'HTTP::SOAP',
            Config => {
                NameSpace => 'http://otrs.org/SoapTestInterface/',
                Encoding  => 'UTF-8',
                Endpoint  => $RemoteSystem,
                Timeout   => 120,
            },
        },
        Invoker => {
            TicketUpdate => {
                Type => 'Test::TestSimple',
            },
            SessionCreate => {
                Type => 'Test::TestSimple',
            },
        },
    },
};

# update web-service with real config
# the update is needed because we are using
# the WebserviceID for the Endpoint in config
my $WebserviceUpdate = $WebserviceObject->WebserviceUpdate(
    ID      => $WebserviceID,
    Name    => $WebserviceName,
    Config  => $WebserviceConfig,
    ValidID => 1,
    UserID  => $Self->{UserID},
);
$Self->True(
    $WebserviceUpdate,
    "Updated web service $WebserviceID - $WebserviceName",
);

# disable SessionCheckRemoteIP setting
$ConfigObject->Set(
    Key   => 'SessionCheckRemoteIP',
    Value => 0,
);

# Get SessionID
# create requester object
my $RequesterSessionObject = $Kernel::OM->Get('Kernel::GenericInterface::Requester');

$Self->Is(
    'Kernel::GenericInterface::Requester',
    ref $RequesterSessionObject,
    "SessionID - Create requester object",
);

# start requester with our web-service
my $RequesterSessionResult = $RequesterSessionObject->Run(
    WebserviceID => $WebserviceID,
    Invoker      => 'SessionCreate',
    Data         => {
        UserLogin => $UserLogin,
        Password  => $Password,
    },
);

my $NewSessionID = $RequesterSessionResult->{Data}->{SessionID};

my @Tests = (
    {
        Name           => 'Add articles with attachment',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
            Article => [
                {
                    Subject              => 'Article subject äöüßÄÖÜ€ис',
                    Body                 => 'Article body',
                    AutoResponseType     => 'auto reply',
                    IsVisibleForCustomer => 1,
                    CommunicationChannel => 'Email',
                    SenderType           => 'agent',
                    From                 => 'enjoy@otrs.com',
                    Charset              => 'utf8',
                    MimeType             => 'text/plain',
                    HistoryType          => 'AddNote',
                    HistoryComment       => '%%',
                },
                {
                    Subject              => 'Article2 subject ຟູບາຣ',
                    Body                 => 'Article2 body',
                    IsVisibleForCustomer => 1,
                    CommunicationChannel => 'Phone',
                    SenderType           => 'agent',
                    From                 => 'foo@otrs.com',
                    Charset              => 'latin-1',
                    MimeType             => 'text/plain',
                    HistoryType          => 'AddNote',
                    HistoryComment       => '%%',
                },
            ],
            Attachment => [
                {
                    Content     => 'Ymx1YiBibHViIGJsdWIg',
                    ContentType => 'text/html',
                    Filename    => 'test.txt',
                },
            ],
        },
        IncludeTicketData        => 1,
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        Operation => 'TicketUpdate',
    },
    {
        Name           => 'Add email articles with attachment named "0"',
        SuccessRequest => '1',
        RequestData    => {
            TicketID => $TicketID1,
            Ticket   => {
                Title => 'Updated',
            },
            Article => [
                {
                    Subject              => 'Article1 subject',
                    Body                 => 'Article1 body',
                    AutoResponseType     => 'auto reply',
                    IsVisibleForCustomer => 1,
                    CommunicationChannel => 'Email',
                    SenderType           => 'agent',
                    Charset              => 'utf8',
                    MimeType             => 'text/plain',
                    HistoryType          => 'AddNote',
                    HistoryComment       => '%%',
                },
                {
                    Subject              => 'Article2 subject',
                    Body                 => 'Article2 body',
                    AutoResponseType     => 'auto reply',
                    IsVisibleForCustomer => 1,
                    CommunicationChannel => 'Email',
                    SenderType           => 'agent',
                    Charset              => 'utf8',
                    MimeType             => 'text/plain',
                    HistoryType          => 'AddNote',
                    HistoryComment       => '%%',
                },
            ],
            Attachment => [
                {
                    Content     => 'Ymx1YiBibHViIGJsdWIg',
                    ContentType => 'text/html',
                    Filename    => '0',
                },
            ],
        },
        IncludeTicketData        => 1,
        ExpectedReturnRemoteData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        ExpectedReturnLocalData => {
            Success => 1,
            Data    => {
                TicketID     => $Ticket{TicketID},
                TicketNumber => $Ticket{TicketNumber},
            },
        },
        AlsoExpect => {
            Remote => sub {
                my ( $Self, $Result, $LocalRemote ) = @_;

                $Self->Is(
                    $Result->{Data}->{Ticket}->{Articles}->[0]->{Attachment}->{Filename},
                    '0',
                    "Attachment found in first article ($LocalRemote)"
                );
                $Self->False(
                    exists $Result->{Data}->{Ticket}->{Articles}->[1]->{Attachment},
                    "No attachment found in second article ($LocalRemote)"
                );
            },
        },
        Operation => 'TicketUpdate',
    },
);

# debugger object
my $DebuggerObject = Kernel::GenericInterface::Debugger->new(
    %{$Self},
    DebuggerConfig => {
        DebugThreshold => 'debug',
        TestMode       => 1,
    },
    WebserviceID      => $WebserviceID,
    CommunicationType => 'Provider',
);
$Self->Is(
    ref $DebuggerObject,
    'Kernel::GenericInterface::Debugger',
    'DebuggerObject instantiate correctly',
);

$HelperObject->FixedTimeSet();

my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');

TEST:
for my $Test (@Tests) {

    # Update web service config to include ticket data in responses.
    if ( $Test->{IncludeTicketData} ) {
        $WebserviceConfig->{Provider}->{Operation}->{TicketUpdate}->{IncludeTicketData} = 1;
        my $WebserviceUpdate = $WebserviceObject->WebserviceUpdate(
            ID      => $WebserviceID,
            Name    => $WebserviceName,
            Config  => $WebserviceConfig,
            ValidID => 1,
            UserID  => $Self->{UserID},
        );
        $Self->True(
            $WebserviceUpdate,
            'WebserviceUpdate - Turned on IncludeTicketData'
        );
    }

    # create local object
    my $LocalObject = "Kernel::GenericInterface::Operation::Ticket::$Test->{Operation}"->new(
        %{$Self},
        DebuggerObject => $DebuggerObject,
        WebserviceID   => $WebserviceID,
        ConfigObject   => $ConfigObject,
    );

    $Self->Is(
        "Kernel::GenericInterface::Operation::Ticket::$Test->{Operation}",
        ref $LocalObject,
        "$Test->{Name} - Create local object",
    );

    my %Auth = (
        UserLogin => $UserLogin,
        Password  => $Password,
    );
    if ( IsHashRefWithData( $Test->{Auth} ) ) {
        %Auth = %{ $Test->{Auth} };
    }

    # start requester with our web-service
    my $LocalResult = $LocalObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            %Auth,
            %{ $Test->{RequestData} },
        },
    );

    # check result
    $Self->Is(
        'HASH',
        ref $LocalResult,
        "$Test->{Name} - Local result structure is valid",
    );

    _ExpectLatestArticles( $Test, $TicketID1, 'Local' );

    # create requester object
    my $RequesterObject = Kernel::GenericInterface::Requester->new(
        %{$Self},
        ConfigObject => $ConfigObject,
    );
    $Self->Is(
        'Kernel::GenericInterface::Requester',
        ref $RequesterObject,
        "$Test->{Name} - Create requester object",
    );

    # start requester with our web-service
    my $RequesterResult = $RequesterObject->Run(
        WebserviceID => $WebserviceID,
        Invoker      => $Test->{Operation},
        Data         => {
            %Auth,
            %{ $Test->{RequestData} },
        },
    );

    # TODO prevent failing test if environment on SaaS unit test system doesn't work.
    if (
        $RequesterResult->{ErrorMessage} eq
        'faultcode: Server, faultstring: Attachment could not be created, please contact the  system administrator'
        )
    {
        next TEST;
    }

    # check result
    $Self->Is(
        'HASH',
        ref $RequesterResult,
        "$Test->{Name} - Requester result structure is valid",
    );

    $Self->Is(
        $RequesterResult->{Success},
        $Test->{SuccessRequest},
        "$Test->{Name} - Requester successful result",
    );

    # remove ErrorMessage parameter from direct call
    # result to be consistent with SOAP call result
    if ( $LocalResult->{ErrorMessage} ) {
        delete $LocalResult->{ErrorMessage};
    }

    if ( $Test->{IncludeTicketData} ) {
        my %TicketGet = $TicketObject->TicketGet(
            TicketID      => $TicketID1,
            DynamicFields => 1,
            Extended      => 1,
            UserID        => 1,
        );

        my %TicketData;
        my @DynamicFields;

        # Transform some ticket properties so they match expected data structure.
        KEY:
        for my $Key ( sort keys %TicketGet ) {

            # Quote some properties as strings.
            if ( $Key eq 'UntilTime' ) {
                $TicketData{$Key} = "$TicketGet{$Key}";
                next KEY;
            }

            # Push all dynamic field data in a separate array structure.
            elsif ( $Key =~ m{^DynamicField_(?<DFName>\w+)$}xms ) {
                push @DynamicFields, {
                    Name  => $+{DFName},
                    Value => $TicketGet{$Key} // '',
                };
                next KEY;
            }

            # Skip some fields since they might differ.
            elsif (
                $Key eq 'Age'
                || $Key eq 'FirstResponse'
                || $Key eq 'Changed'
                || $Key eq 'UnlockTimeout'
                )
            {
                next KEY;
            }

            # Include any other ticket property as-is. Undefined values should be represented as empty string.
            $TicketData{$Key} = $TicketGet{$Key} // '';
        }

        if (@DynamicFields) {
            $TicketData{DynamicField} = \@DynamicFields;
        }

        $Test->{ExpectedReturnRemoteData}->{Data} = {
            %{ $Test->{ExpectedReturnRemoteData}->{Data} },
            Ticket => \%TicketData,
        };
    }

    if ( defined $Test->{RequestData}->{Ticket}->{CustomerUser} ) {
        $Self->Is(
            "\"$CustomerUserLogin $CustomerUserLogin\" <$CustomerUserLogin\@localunittest.com>",
            $RequesterResult->{Data}->{Ticket}->{Article}->{To},
            "Article parameter To is set well after TicketUpdate()",
        );
    }

    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp();

    # Check if parameters To, cc and Bcc set well
    # See bug#14393 for more information.
    my $RequestArticles  = $Test->{RequestData}->{Article};
    my $ResponseArticles = $RequesterResult->{Data}->{Ticket}->{Articles};
    REQUESTARTICLE:
    for my $i ( 0 .. $#$RequestArticles ) {
        for my $Header (qw(To Cc Bcc)) {
            next REQUESTARTICLE if !defined $RequestArticles->[$i]->{$Header};
            $Self->Is(
                $RequestArticles->[$i]->{$Header},
                $ResponseArticles->[$i]->{$Header},
                "Article parameter $Header is set well after TicketUpdate() - $$RequestArticles->[ $i ]->{ $Header }",
            );
        }
    }

    my @ArticleList = _ExpectLatestArticles( $Test, $TicketID1, 'Remote' );

    my @Articles;
    for my $QueryArticle (@ArticleList) {
        my %Article;

        my $ArticleBackendObject = $ArticleObject->BackendForArticle( %{$QueryArticle} );
        %Article = $ArticleBackendObject->ArticleGet(
            %{$QueryArticle},
            DynamicFields => 1,
        );

        $_ //= '' for values %Article;

        # Push all dynamic field data in a separate array structure.
        my $DynamicFields;
        for my $Key ( sort grep {m{^DynamicField_}} keys %Article ) {
            push @{$DynamicFields}, {
                Name  => substr( $Key, length('DynamicField_') ),
                Value => $Article{$Key} // '',
            };
            delete $Article{$Key};
        }
        if ( scalar @{$DynamicFields} == 1 ) {
            $DynamicFields = $DynamicFields->[0];
        }
        if ( IsArrayRefWithData($DynamicFields) || IsHashRefWithData($DynamicFields) ) {
            $Article{DynamicField} = $DynamicFields;
        }

        my %AttachmentIndex = $ArticleBackendObject->ArticleAttachmentIndex(
            ArticleID => $Article{ArticleID},
        );

        my @Attachments;
        $Kernel::OM->Get('Kernel::System::Main')->Require('MIME::Base64');
        ATTACHMENT:
        for my $FileID ( sort keys %AttachmentIndex ) {
            next ATTACHMENT if !$FileID;
            my %Attachment = $ArticleBackendObject->ArticleAttachment(
                ArticleID => $Article{ArticleID},
                FileID    => $FileID,
            );

            next ATTACHMENT if !IsHashRefWithData( \%Attachment );

            # Convert content to base64.
            $Attachment{Content} = MIME::Base64::encode_base64( $Attachment{Content}, '' );
            push @Attachments, {%Attachment};
        }

        # Set attachment data.
        if (@Attachments) {

            # Flatten array if only one attachment was found.
            if ( scalar @Attachments == 1 ) {
                for my $Attachment (@Attachments) {
                    $Article{Attachment} = $Attachment;
                }
            }
            else {
                $Article{Attachment} = \@Attachments;
            }
        }

        $Article{ArticleNumber} .= '';    # stringify
        push @Articles, \%Article;
    }

    $Test->{ExpectedReturnRemoteData}->{Data}->{Ticket} = {
        %{ $Test->{ExpectedReturnRemoteData}->{Data}->{Ticket} },
        Articles => \@Articles,
    };

    # Remove some fields before comparison since they might differ.
    if ( $Test->{IncludeTicketData} ) {
        for my $Key (qw(Age Changed UnlockTimeout)) {
            delete $RequesterResult->{Data}->{Ticket}->{$Key};
        }
    }

    # Expect to find just a few request attributes in the result
    my @ExpectAttributes = qw( Body Subject );
    for my $ExpectedArticle ( @{ $Test->{RequestData}->{Article} } ) {
        push @{ $Test->{ExpectedReturnRemoteData}->{Data}->{Ticket}->{Articles} }, {
            map { $_ => $ExpectedArticle->{$_} } @ExpectAttributes
        };
    }
    my $ReducedRequesterResult = dclone($RequesterResult);
    $ReducedRequesterResult->{Data}->{Ticket}->{Articles} = [];
    for my $ReceivedArticle ( @{ $RequesterResult->{Data}->{Ticket}->{Articles} } ) {
        push @{ $ReducedRequesterResult->{Data}->{Ticket}->{Articles} }, {
            map { $_ => $ReceivedArticle->{$_} } @ExpectAttributes
        };
    }
    $Self->IsDeeply(
        $ReducedRequesterResult,
        $Test->{ExpectedReturnRemoteData},
        "$Test->{Name} - Requester success status (needs configured and running webserver)",
    );

    if ( $Test->{ExpectedReturnLocalData} ) {
        $Self->IsDeeply(
            $LocalResult,
            $Test->{ExpectedReturnLocalData},
            "$Test->{Name} - Local result matched with expected local call result.",
        );
    }
    else {
        $Self->IsDeeply(
            $LocalResult,
            $Test->{ExpectedReturnRemoteData},
            "$Test->{Name} - Local result matched with remote result.",
        );
    }

    # Update web service config to exclude ticket data in responses.
    if ( $Test->{IncludeTicketData} ) {
        $WebserviceConfig->{Provider}->{Operation}->{TicketUpdate}->{IncludeTicketData} = 0;
        my $WebserviceUpdate = $WebserviceObject->WebserviceUpdate(
            ID      => $WebserviceID,
            Name    => $WebserviceName,
            Config  => $WebserviceConfig,
            ValidID => 1,
            UserID  => $Self->{UserID},
        );
        $Self->True(
            $WebserviceUpdate,
            'WebserviceUpdate - Turned off IncludeTicketData'
        );
    }

    _RunAlsoExpect( $Self, $Test, $LocalResult, $RequesterResult );
}

# cleanup

# delete web-service
my $WebserviceDelete = $WebserviceObject->WebserviceDelete(
    ID     => $WebserviceID,
    UserID => $Self->{UserID},
);
$Self->True(
    $WebserviceDelete,
    "Deleted web service $WebserviceID",
);

# delete tickets
for my $TicketID (@TicketIDs) {
    my $TicketDelete = $TicketObject->TicketDelete(
        TicketID => $TicketID,
        UserID   => $Self->{UserID},
    );

    # sanity check
    $Self->True(
        $TicketDelete,
        "TicketDelete() successful for Ticket ID $TicketID",
    );
}

# delete dynamic fields
my $DeleteFieldList = $DynamicFieldObject->DynamicFieldList(
    ResultType => 'HASH',
    ObjectType => 'Ticket',
);

DYNAMICFIELD:
for my $DynamicFieldID ( sort keys %{$DeleteFieldList} ) {

    next DYNAMICFIELD if !$DynamicFieldID;
    next DYNAMICFIELD if !$DeleteFieldList->{$DynamicFieldID};

    next DYNAMICFIELD if $DeleteFieldList->{$DynamicFieldID} !~ m{ ^Unittest }xms;

    my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
        ID => $DynamicFieldID,
    );
    my $ValuesDeleteSuccess = $BackendObject->AllValuesDelete(
        DynamicFieldConfig => $DynamicFieldConfig,
        UserID             => $Self->{UserID},
    );

    $DynamicFieldObject->DynamicFieldDelete(
        ID     => $DynamicFieldID,
        UserID => 1,
    );
}

# cleanup cache
$Kernel::OM->Get('Kernel::System::Cache')->CleanUp();

# Fix up test data to expect the latest Article IDs according to the number to be created
# Returns the last results of $ArticleObject->ArticleList() if any
sub _ExpectLatestArticles {
    my ( $Test, $TicketID, $LocalRemote ) = @_;
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my @ArticleList;

    if ( $Test->{RequestData}->{Article} ) {
        my $NumArticles = @{ $Test->{RequestData}->{Article} };

        my @ArticleList = (
            $ArticleObject->ArticleList(
                TicketID => $TicketID,
            )
        )[ -$NumArticles .. -1 ];

        my @ArticleIDs = map { $_->{ArticleID} } @ArticleList;
        if ( $Test->{"ExpectedReturn${LocalRemote}Data"} ) {
            $Test->{"ExpectedReturn${LocalRemote}Data"}->{Data} = {
                %{ $Test->{"ExpectedReturn${LocalRemote}Data"}->{Data} },
                ArticleIDs => \@ArticleIDs,
            };
        }
    }
    return @ArticleList;
}

# Run extra tests specified as code if any
sub _RunAlsoExpect {
    my ( $Self, $Test, $LocalResult, $RemoteResult ) = @_;
    return if !exists $Test->{AlsoExpect};

    my $Tests = $Test->{AlsoExpect};
    for my $Sub ( $Tests->{All}, $Tests->{Local} ) {
        $Sub->( $Self, $LocalResult, 'LocalResult' ) if defined $Sub;
    }
    for my $Sub ( $Tests->{All}, $Tests->{Remote} ) {
        $Sub->( $Self, $RemoteResult, 'RemoteResult' ) if defined $Sub;
    }
    return;
}

1;
