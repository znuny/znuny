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

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase  => 1,
        UseTmpArticleDir => 1,
    },
);

my $HelperObject  = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');
my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
my $GroupObject   = $Kernel::OM->Get('Kernel::System::Group');
my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');
my $UserObject    = $Kernel::OM->Get('Kernel::System::User');

$ConfigObject->Set(
    Key   => 'SendmailModule',
    Value => 'Kernel::System::Email::DoNotSendEmail',
);

$ConfigObject->Set(
    Key   => 'Ticket::Frontend::Quote',
    Value => '>',
);

$HelperObject->ConfigSettingChange(
    Valid => 1,
    Key   => 'CheckEmailAddresses',
    Value => 0,
);

#
# Prepare data for tests.
#
my ( $UserLogin, $UserID ) = $HelperObject->TestUserCreate();

my $TicketID = $HelperObject->TicketCreate(
    Title        => 'TestTicket #1',
    Queue        => 'Raw',
    Lock         => 'unlock',
    Priority     => '3 normal',
    State        => 'open',
    CustomerNo   => '123465',
    CustomerUser => 'customer@example.com',
    OwnerID      => 1,
    UserID       => 1,
);

my @ArticleIDs;
for my $ArticleCounter ( 1 .. 3 ) {
    my $ArticleID = $HelperObject->ArticleCreate(
        TicketID             => $TicketID,
        SenderType           => 'agent',
        ChannelName          => 'Email',
        IsVisibleForCustomer => 1,
        From                 => 'Some Agent <email@example.com>',
        To                   => 'Some Customer A <customer-a@example.com>',
        Charset              => 'iso-8859-15',
        MimeType             => 'text/plain',
        HistoryType          => 'SendAnswer',
        HistoryComment       => 'Some free text!',
        UserID               => 1,
    );

    push @ArticleIDs, $ArticleID;
}

# Users and groups for testing mentions.
my @UserIDs;
my @UserFullNames;
my %UserLoginByUserID;
for my $UserCounter ( 1 .. 7 ) {
    my ( $UserLogin, $UserID ) = $HelperObject->TestUserCreate();
    $UserLoginByUserID{$UserID} = $UserLogin;

    my %User = $UserObject->GetUserData(
        UserID => $UserID,
    );

    push @UserIDs,       $UserID;
    push @UserFullNames, $User{UserFullname};
}

my @GroupIDs;
my %GroupByGroupID;
for my $GroupCounter ( 1 .. 2 ) {
    my $Group   = 'mentions-unit-test-' . $HelperObject->GetRandomID();
    my $GroupID = $GroupObject->GroupAdd(
        Name    => $Group,
        ValidID => 1,
        UserID  => 1,
    );

    push @GroupIDs, $GroupID;
    $GroupByGroupID{$GroupID} = $Group;
}

# Users for group 1
for my $UserID ( @UserIDs[ 2 .. 4 ] ) {
    $GroupObject->GroupMemberAdd(
        GID        => $GroupIDs[0],
        UID        => $UserID,
        Permission => {
            rw => 1,
        },
        UserID => 1,
    );
}

# Users for group 2
# Note that first user is also in group 2.
for my $UserID ( @UserIDs[ 0, 5 .. 6 ] ) {
    $GroupObject->GroupMemberAdd(
        GID        => $GroupIDs[1],
        UID        => $UserID,
        Permission => {
            rw => 1,
        },
        UserID => 1,
    );
}

#
# Tests for IsGroupBlocked
#
my $MentionsConfig = $ConfigObject->Get('Mentions') // {};

$MentionsConfig->{BlockedGroups} = [];

for my $Group (qw(users stats admin)) {
    my $GroupIsBlocked = $MentionObject->IsGroupBlocked( Group => $Group );

    $Self->False(
        scalar $GroupIsBlocked,
        'IsGroupBlocked() must return expected result.',
    );
}

$MentionsConfig->{BlockedGroups} = [qw(users admin)];
for my $Group (qw(users admin)) {
    my $GroupIsBlocked = $MentionObject->IsGroupBlocked( Group => $Group );

    $Self->True(
        scalar $GroupIsBlocked,
        'IsGroupBlocked() must return expected result.',
    );
}

my $GroupIsBlocked = $MentionObject->IsGroupBlocked( Group => 'stats' );

$Self->False(
    scalar $GroupIsBlocked,
    'IsGroupBlocked() must return expected result.',
);

$MentionsConfig->{BlockedGroups} = [];

#
# Tests for AddMention, RemoveMention, GetTicketMentions and GetUserMentions
#
for my $ArticleID (@ArticleIDs) {
    my $Success = $MentionObject->AddMention(
        MentionedUserID => $UserID,
        TicketID        => $TicketID,
        ArticleID       => $ArticleID,
        UserID          => 1,
    );
    $Self->True(
        $Success,
        "AddMention(): Mention successfully added for article ID $ArticleID.",
    );
}

my $TicketMentions = $MentionObject->GetTicketMentions(
    TicketID => $TicketID,
) // [];

$Self->Is(
    scalar @{$TicketMentions},
    3,
    'GetTicketMentions(): Successful.',
);

# Mention removal with user who is not owner of the ticket or mention should fail.
my $MentionRemoved = $MentionObject->RemoveMention(
    TicketID        => $TicketID,
    MentionedUserID => $UserID,
    UserID          => 9999999,
);
$Self->False(
    scalar $MentionRemoved,
    'RemoveMention(): Mention removal fails for user who is not owner of the ticket or mention.',
);

$MentionRemoved = $MentionObject->RemoveMention(
    TicketID        => $TicketID,
    MentionedUserID => $UserID,
    UserID          => $UserID,
);

$Self->True(
    scalar $MentionRemoved,
    'RemoveMention(): Successfully removed mention from ticket.',
);

my $Success = $MentionObject->AddMention(
    MentionedUserID => $UserID,
    TicketID        => $TicketID,
    ArticleID       => $ArticleIDs[0],
    UserID          => 1,
);

$Self->True(
    $Success,
    "AddMention(): Mention successfully added for article ID $ArticleIDs[0].",
);

my $Mentions = $MentionObject->GetUserMentions(
    UserID => $UserID,
) // [];

$Self->Is(
    $Mentions->[0]->{TicketID},
    $TicketID,
    'GetUserMentions: Get all mentions of user.',
);

#
# Tests for GetMentionedUserIDsFromString
#
my $MentionsRichtTextEditorConfig = $ConfigObject->Get('Mentions::RichTextEditor') // {};
my $MentionsTriggerConfig         = $MentionsRichtTextEditorConfig->{Triggers};

# Single user
my $HTMLString = 'A single user is <a class="Mention" id="'
    . $UserLoginByUserID{ $UserIDs[0] }
    . '" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[0]
    . '</a>mentioned.';
my $MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);
my @ExpectedMentionedUserIDs = ( $UserIDs[0] );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# Multiple users
$HTMLString
    .= "\n"
    . '<br />A second user is <a href="https://example.org" class="Mention" id="'
    . $UserLoginByUserID{ $UserIDs[1] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[1]
    . '</a>mentioned.';
$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);
@ExpectedMentionedUserIDs = ( @UserIDs[ 0 .. 1 ] );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# Single group
$HTMLString = 'A single group is <a class="GroupMention" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a>mentioned.';
$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);
@ExpectedMentionedUserIDs = ( @UserIDs[ 2 .. 4 ] );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# Single blocked group
$MentionsConfig->{BlockedGroups} = [ $GroupByGroupID{ $GroupIDs[0] } ];

$HTMLString = 'A single group is <a class="GroupMention" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a>mentioned.';
$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);
@ExpectedMentionedUserIDs = ();

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

$MentionsConfig->{BlockedGroups} = [];

# Two groups
# Note that here, the first user is also part of second group.
$HTMLString .= 'And another group is <a class="GroupMention">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[1] }
    . '</a>mentioned.';
$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);
@ExpectedMentionedUserIDs = ( @UserIDs[ 0, 2 .. 6 ] );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# All users and groups
$HTMLString = 'A single user is <a class="Mention" href="https://example.org" target="_blank" id="'
    . $UserLoginByUserID{ $UserIDs[0] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[0]
    . '</a>mentioned.';
$HTMLString .= 'A single group is <a class="GroupMention" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a>mentioned.';
$HTMLString .= "\n"
    . '<br />A second user is <a href="https://example.org" class="Mention" id="'
    . $UserLoginByUserID{ $UserIDs[1] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[1]
    . '</a>mentioned.';
$HTMLString .= 'And another group is <a class="GroupMention">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[1] }
    . '</a>mentioned.';

$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);

@ExpectedMentionedUserIDs = @UserIDs;

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# All users and groups (all groups blocked)
$MentionsConfig->{BlockedGroups} = [
    $GroupByGroupID{ $GroupIDs[0] },
    $GroupByGroupID{ $GroupIDs[1] },
];

$HTMLString = 'A single user is <a class="Mention" href="https://example.org" target="_blank" id="'
    . $UserLoginByUserID{ $UserIDs[0] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[0]
    . '</a>mentioned.';
$HTMLString .= 'A single group is <a class="GroupMention" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a>mentioned.';
$HTMLString .= "\n"
    . '<br />A second user is <a href="https://example.org" class="Mention" id="'
    . $UserLoginByUserID{ $UserIDs[1] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[1]
    . '</a>mentioned.';
$HTMLString .= 'And another group is <a class="GroupMention">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[1] }
    . '</a>mentioned.';

$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString => $HTMLString,
);

@ExpectedMentionedUserIDs = ( $UserIDs[0], $UserIDs[1], );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

$MentionsConfig->{BlockedGroups} = [];

# All users and groups (all groups blocked) + mentions in quoted text which must be ignored.
$MentionsConfig->{BlockedGroups} = [
    $GroupByGroupID{ $GroupIDs[0] },
    $GroupByGroupID{ $GroupIDs[1] },
];

$HTMLString = 'A single user is <a class="Mention" href="https://example.org" target="_blank" id="'
    . $UserLoginByUserID{ $UserIDs[0] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[0]
    . '</a>mentioned.';
$HTMLString .= 'A single group is <a class="GroupMention" href="https://example.org" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a>mentioned.';
$HTMLString .= "\n"
    . '<br />A second user is <a href="https://example.org" class="Mention" id="'
    . $UserLoginByUserID{ $UserIDs[1] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[1]
    . '</a>mentioned.';
$HTMLString .= 'And another group is <a class="GroupMention">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[1] }
    . '</a>mentioned.';

$MentionsConfig->{BlockedGroups} = [];

# Single user with quoted text that contains mentions which must be ignored.
# The plain text string is also given to make it possible to reliably recognize
# mentions in quoted text which should be ignored.
$HTMLString = 'A single user is <a class="Mention" href="https://example.org" target="_blank" id="'
    . $UserLoginByUserID{ $UserIDs[0] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[0]
    . '</a>mentioned.';
$HTMLString .= "\n"
    . '<div style="border:none; border-left:solid blue 1.5pt; padding:0cm 0cm 0cm 4.0pt" type="cite">Dear John,<br />'
    . '<br />'
    . '<a class="Mention" href="#" target="_blank" id="' . $UserLoginByUserID{ $UserIDs[1] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[1]
    . '</a><br />'
    . '<div style="border:none; border-left:solid blue 1.5pt; padding:0cm 0cm 0cm 4.0pt" type="cite">'
    . '<a class="GroupMention" href="#" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[0] }
    . '</a><br />'
    . '</div>'
    . 'Mentions in text and quote.<br />'
    . '<br />'
    . 'Thank you for your request.<br />'
    . '</div>';
$HTMLString .= "\n"
    . 'Another user is <a class="Mention" href="https://example.org" target="_blank" id="'
    . $UserLoginByUserID{ $UserIDs[4] } . '">'
    . $MentionsTriggerConfig->{User}
    . $UserFullNames[4]
    . '</a>mentioned.'
    . '<a class="GroupMention" href="#" target="_blank">'
    . $MentionsTriggerConfig->{Group}
    . $GroupByGroupID{ $GroupIDs[1] }
    . '</a><br />';

my $PlainTextString = "A single user is [1]$MentionsTriggerConfig->{User}$UserFullNames[0] mentioned.";
$PlainTextString .= "
>Dear John,
>
> [2]$MentionsTriggerConfig->{User}$UserFullNames[1]
>
> [3]$MentionsTriggerConfig->{Group}$GroupByGroupID{ $GroupIDs[0] }
>
> Mentions in text and quote.
>
> Thank you for your request.
";

$PlainTextString .= "
Another user is [4]$MentionsTriggerConfig->{User}$UserFullNames[4] mentioned.
[5]$MentionsTriggerConfig->{Group}$GroupByGroupID{ $GroupIDs[1] }";

$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString      => $HTMLString,
    PlainTextString => $PlainTextString,
);

@ExpectedMentionedUserIDs = ( $UserIDs[0], $UserIDs[4], $UserIDs[5], $UserIDs[6], );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

# Also test for optional limit
$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString      => $HTMLString,
    PlainTextString => $PlainTextString,
    Limit           => 2,                  # outside of quote: both mentioned users
);

@ExpectedMentionedUserIDs = ( $UserIDs[0], $UserIDs[4], );

$Self->IsDeeply(
    $MentionedUserIDs,
    \@ExpectedMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected mentioned user IDs.',
);

$MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
    HTMLString      => $HTMLString,
    PlainTextString => $PlainTextString,
    Limit           => 3,                  # outside of quote: both mentioned users + one from second group
);

my $ExpectedNumberOfMentionedUserIDs = 3;

# Note that the order of users within a group is arbitrary.
# So it cannot be tested that the first user of a group was given.
# Just test for the number of expected user IDs.
$Self->Is(
    scalar @{$MentionedUserIDs},
    $ExpectedNumberOfMentionedUserIDs,
    'GetMentionedUserIDsFromString() must return expected number of mentioned user IDs.',
);

1;
