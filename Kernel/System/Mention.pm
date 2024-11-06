# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Mention;

use strict;
use warnings;
use utf8;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::EventHandler);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Group',
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
    'Kernel::System::User',
);

=head1 NAME

Kernel::System::Mention

=head1 DESCRIPTION

Support for mentioning users.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $MentionObject = $Kernel::OM->Get('Kernel::System::Mention');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->EventHandlerInit(
        Config => 'Ticket::EventModulePost',
    );

    return $Self;
}

=head2 AddMention()

Adds a mention and triggers event "UserMention" to send a notification.

    my $Success = $MentionObject->AddMention(
        TicketID        => 3252,
        ArticleID       => 6538,
        MentionedUserID => 5,
        UserID          => 1,
    );

    Returns true value on success.

=cut

sub AddMention {
    my ( $Self, %Param ) = @_;

    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject      = $Kernel::OM->Get('Kernel::System::DB');
    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');

    NEEDED:
    for my $Needed (qw(TicketID ArticleID MentionedUserID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $TicketID        = $Param{TicketID};
    my $ArticleID       = $Param{ArticleID};
    my $MentionedUserID = $Param{MentionedUserID};

    my $Mentions = $Self->GetTicketMentions(
        TicketID => $TicketID,
    );
    return if ref $Mentions ne 'ARRAY';

    my $MentionExists = grep {
        $_->{UserID} == $MentionedUserID
            && $_->{TicketID} == $TicketID
            && $_->{ArticleID} == $ArticleID
    } @{$Mentions};
    return 1 if $MentionExists;

    my $TicketFlagSet = $TicketObject->TicketFlagSet(
        TicketID => $TicketID,
        Key      => 'MentionSeen',
        Value    => 0,
        UserID   => $MentionedUserID,
    );
    return if !$TicketFlagSet;

    return if !$DBObject->Do(
        SQL => '
            INSERT INTO
                mention (user_id, ticket_id, article_id, create_time)
                VALUES (?, ?, ?, current_timestamp)
        ',
        Bind => [
            \$MentionedUserID,
            \$TicketID,
            \$ArticleID,
        ],
    );

    my $NotificationsConfig = $ConfigObject->Get('Mentions')->{Notifications};
    if ( $NotificationsConfig && $NotificationsConfig eq 'Ticket' ) {
        my $IsUserMentionedTicket = grep {
            $_->{UserID} == $MentionedUserID
                && $_->{TicketID} == $TicketID
        } @{$Mentions};

        return if $IsUserMentionedTicket;
    }

    $Self->EventHandler(
        Event => 'UserMention',
        Data  => {
            TicketID   => $TicketID,
            ArticleID  => $ArticleID,
            Recipients => [ $MentionedUserID, ],
        },
        UserID => $Param{UserID},
    );

    return 1;
}

=head2 CanUserRemoveMention()

Checks if the given user is allowed to remove the given mention.

    my $UserCanRemoveMention = $MentionObject->CanUserRemoveMention(
        TicketID        => 3252,
        MentionedUserID => 5,
        UserID          => 1, # user who wants to remove the mention
    );

    Returns true value if the user is allowed to remove the mention.

=cut

sub CanUserRemoveMention {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    NEEDED:
    for my $Needed (qw(TicketID MentionedUserID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    # User can remove his own mention.
    return 1 if $Param{MentionedUserID} == $Param{UserID};

    # User can remove any mention from a ticket he owns.
    my %Ticket = $TicketObject->TicketGet(
        TicketID => $Param{TicketID},
        UserID   => $Param{UserID},
    );
    return   if !%Ticket;
    return 1 if $Ticket{OwnerID} == $Param{UserID};

    return;
}

=head2 RemoveMention()

Removes all mentions of a ticket for a specific user ID.

    my $Success = $MentionObject->RemoveMention(
        TicketID        => 3252,
        MentionedUserID => 5,
        UserID          => 1, # user who wants to remove the mention
    );

    Returns true value on success.

=cut

sub RemoveMention {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(TicketID MentionedUserID UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $UserCanRemoveMention = $Self->CanUserRemoveMention(
        TicketID        => $Param{TicketID},
        MentionedUserID => $Param{MentionedUserID},
        UserID          => $Param{UserID},
    );
    if ( !$UserCanRemoveMention ) {
        $LogObject->Log(
            Priority => 'error',
            Message =>
                "User with ID $Param{UserID} is not allowed to remove mention of user with ID $Param{MentionedUserID} from ticket with ID $Param{TicketID}.",
        );

        return;
    }

    return if !$DBObject->Do(
        SQL => '
            DELETE FROM mention
            WHERE       ticket_id = ?
                        AND user_id = ?
        ',
        Bind => [
            \$Param{TicketID},
            \$Param{MentionedUserID},
        ],
    );

    return 1;
}

=head2 RemoveAllMentions()

Deletes all mentions of a ticket.

    my $Success = $MentionObject->RemoveAllMentions(
        TicketID => 3252,
    );

    Returns true value on success.

=cut

sub RemoveAllMentions {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(TicketID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return if !$DBObject->Do(
        SQL  => 'DELETE FROM mention WHERE ticket_id = ?',
        Bind => [ \$Param{TicketID} ],
    );

    return 1;
}

=head2 GetTicketMentions()

Retrieves all mentions of a ticket.

    my $Mentions = $MentionObject->GetTicketMentions(
        TicketID  => 3252,
        OrderBy   => 'create_time',     # optional; default
        SortOrder => 'ASC',             # or 'DESC', optional; default
    );

    Returns:

    my $Mentions = [
        {
            UserID     => 5,
            TicketID   => 76,
            ArticleID  => 89,
            CreateTime => '2022-07-20 12:34:23',
        },
        # ...
    ];

=cut

sub GetTicketMentions {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(TicketID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $OrderByQuery = $Self->_AssembleOrderByQuery(
        OrderBy   => $Param{OrderBy},
        SortOrder => $Param{SortOrder},
    );
    return if !$OrderByQuery;

    return if !$DBObject->Prepare(
        SQL => "
            SELECT   user_id, ticket_id, article_id, create_time
            FROM     mention
            WHERE    ticket_id = ?
            ORDER BY $OrderByQuery
        ",
        Bind => [
            \$Param{TicketID},
        ],
    );

    my @Mentions;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        my %Mention = (
            UserID     => $Row[0],
            TicketID   => $Row[1],
            ArticleID  => $Row[2],
            CreateTime => $Row[3],
        );

        push @Mentions, \%Mention;
    }

    return \@Mentions;
}

=head2 GetUserMentions()

Retrieves all mentions of a user.

    my $Mentions = $MentionObject->GetUserMentions(
        UserID     => 87,

        # optional, defaults to 0 and then means that all mentions of all articles per ticket are
        # counted as one combined mention;
        # if set to 1, all mentions of every article count separately
        PerArticle => 0,

        OrderBy    => 'create_time',    # optional; default
        SortOrder  => 'ASC',            # or 'DESC', optional; default
    );

    Returns:

    my $Mentions = [
        {
            UserID   => 5,
            TicketID => 76,

            # the following two entries will only be returned if parameter PerArticle is set
            ArticleID  => 89,
            CreateTime => '2022-07-20 12:34:23',
        },
        # ...
    ];

=cut

sub GetUserMentions {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');
    my $DBObject  = $Kernel::OM->Get('Kernel::System::DB');

    NEEDED:
    for my $Needed (qw(UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $OrderByQuery = $Self->_AssembleOrderByQuery(
        OrderBy   => $Param{OrderBy},
        SortOrder => $Param{SortOrder},
    );
    return if !$OrderByQuery;

    $DBObject->Prepare(
        SQL => "
            SELECT   user_id, ticket_id, article_id, create_time
            FROM     mention
            WHERE    user_id = ?
            ORDER BY $OrderByQuery
        ",
        Bind => [
            \$Param{UserID},
        ],
    );

    my $PerArticle = $Param{PerArticle} // 0;
    my %MentionedTicketIDs;

    my @Mentions;
    ROW:
    while ( my @Row = $DBObject->FetchrowArray() ) {
        my $TicketID = $Row[1];
        if ( !$PerArticle ) {
            next ROW if $MentionedTicketIDs{$TicketID};

            $MentionedTicketIDs{$TicketID} = 1;
        }

        my %Mention = (
            UserID   => $Row[0],
            TicketID => $TicketID,
        );

        if ($PerArticle) {
            $Mention{ArticleID}  = $Row[2];
            $Mention{CreateTime} = $Row[3];
        }

        push @Mentions, \%Mention;
    }

    return \@Mentions;
}

=head2 GetDashboardWidgetTicketData()

Returns data for dashboard widgets that output information about mentions.

    my $Data = $MentionObject->GetDashboardWidgetTicketData(
        UserID => 37,
    );

    Returns:

    my $Data = (
        TicketIDs     => [ 5, 27, 382, ],
        CustomColumns => {
            5 => {
                LastMention => '2022-07-03 10:32:42',
            },
            27 => {
                LastMention => '2022-07-08 14:56:20',
            },
            382 => {
                LastMention => '2022-07-25 16:09:12',
            },
        },
    );

=cut

sub GetDashboardWidgetTicketData {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Mentions = $Self->GetUserMentions(
        UserID     => $Param{UserID},
        PerArticle => 1,
        OrderBy    => 'create_time',
        SortOrder  => 'ASC',
    );
    return if !IsArrayRefWithData($Mentions);

    my %TicketIDs;
    my %CustomColumns;
    for my $Mention ( @{$Mentions} ) {
        $TicketIDs{ $Mention->{TicketID} } = 1;

        # Note: This will only use the creation time of the newest article
        # per ticket.
        $CustomColumns{ $Mention->{TicketID} }->{ Translatable('LastMention') } = $Mention->{CreateTime};
    }

    my %Data = (
        TicketIDs     => [ sort keys %TicketIDs ],
        CustomColumns => \%CustomColumns,
    );

    return \%Data;
}

=head2 GetMentionedUserIDsFromString()

    Parses HTML string and returns the IDs of found mentioned users.

    my $MentionedUserIDs = $MentionObject->GetMentionedUserIDsFromString(
        HTMLString => '...<a class="Mention" href="..." target="...">@root@localhost<\/a>...',

        # optional
        # plain text string must be given if mentions in quoted text should be ignored.
        # they are not reliably parsable from the HTML string.
        PlainTextString => '...@root@localhost...',

        # optional
        # Limit for number of returned user IDs. The rest will silently be ignored.
        Limit => 5,
    );

    Returns:
    my $MentionedUserIDs = [ 1, 5, ],

=cut

sub GetMentionedUserIDsFromString {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(HTMLString)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $MentionsRichtTextEditorConfig = $ConfigObject->Get('Mentions::RichTextEditor') // {};
    my $MentionsTriggerConfig         = $MentionsRichtTextEditorConfig->{Triggers};
    return [] if !IsHashRefWithData($MentionsTriggerConfig);

    my @MentionedUsers;
    my %UserNameByFullname;

    while (
        $Param{HTMLString}
        =~ m{<a[^>]*class="Mention"[^(id)|>]*id="([^"]*)"[^>]*>\Q$MentionsTriggerConfig->{User}\E(.*?)<\/a>}sg
        )
    {
        $UserNameByFullname{$2} = $1;
        push @MentionedUsers, $1;
    }

    my @MentionedGroups = (
        $Param{HTMLString}
            =~ m{<a\b[^>]*?\bclass="GroupMention"[^>]*?>\Q$MentionsTriggerConfig->{Group}\E(.*?)<\/a>}sg
    );

    # Mentions cannot be removed from quotations in HTML string because
    # parsing is not reliably possible.
    # Therefore, if plain text has additionally been given, use it to remove quoted text (lines starting
    # with characters configured in Ticket::Frontend::Quote) and match the remaining
    # contained mentions with those of the given HTML string. So the sole purpose of giving plain text
    # is to be able to remove mentions from quotes.
    #
    # This avoids notifications for mentions contained in quoted text.
    my $QuoteMarker = $ConfigObject->Get('Ticket::Frontend::Quote');
    if (
        IsStringWithData( $Param{PlainTextString} )
        && IsStringWithData($QuoteMarker)
        )
    {
        # Remove every line that starts with a quote marker.
        ( my $PlainTextStringWithoutQuote = $Param{PlainTextString} ) =~ s{^\Q$QuoteMarker\E.*}{}mig;

        # Drop found mentioned users that are not part of the plain text without quotes.
        if ( defined $PlainTextStringWithoutQuote ) {
            @MentionedUsers = map { $UserNameByFullname{$_} }
                grep { $PlainTextStringWithoutQuote =~ m{\[\d+\]\Q$MentionsTriggerConfig->{User}\E\Q$_\E(\s|\b)}m }
                keys %UserNameByFullname;
        }

        # Drop found mentioned groups that are not part of the plain text without quotes.
        if ( defined $PlainTextStringWithoutQuote ) {
            @MentionedGroups
                = grep { $PlainTextStringWithoutQuote =~ m{\[\d+\]\Q$MentionsTriggerConfig->{Group}\E\Q$_\E(\s|\b)}m }
                @MentionedGroups;
        }
    }

    # Filter out blocked groups
    @MentionedGroups = grep { !$Self->IsGroupBlocked( Group => $_ ) } @MentionedGroups;

    if (@MentionedGroups) {
        my $GroupUsers = $Self->_GetUsersOfGroups(
            Groups => \@MentionedGroups,
        );
        if ( IsArrayRefWithData($GroupUsers) ) {
            push @MentionedUsers, @{$GroupUsers};
        }
    }

    return [] if !@MentionedUsers;

    # Remove duplicate users but keep their order because of possible configured limit.
    # Note that the order of users within a group is arbitrary.
    my %UniqueMentionedUsers;
    my @UniqueMentionedUsers;

    MENTIONEDUSER:
    for my $MentionedUser (@MentionedUsers) {
        next MENTIONEDUSER if $UniqueMentionedUsers{$MentionedUser};

        $UniqueMentionedUsers{$MentionedUser} = 1;
        push @UniqueMentionedUsers, $MentionedUser;
    }

    if ( $Param{Limit} && @UniqueMentionedUsers > $Param{Limit} ) {
        @UniqueMentionedUsers = @UniqueMentionedUsers[ 0 .. $Param{Limit} - 1 ];
    }

    my $MentionedUserIDs = $Self->_GetMentionedUserIDs(
        MentionedUsers => \@UniqueMentionedUsers,
    );

    return $MentionedUserIDs;
}

=head2 IsGroupBlocked()

Checks if the given group is blocked for mentioning by SysConfig option 'Mentions###BlockedGroups'.

    my $GroupIsBlocked = $MentionObject->IsGroupBlocked(
        Group => 'users',
    );

    Returns true value of group is blocked.

=cut

sub IsGroupBlocked {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(Group)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $MentionsConfig = $ConfigObject->Get('Mentions') // {};

    my $BlockedGroups = $MentionsConfig->{BlockedGroups} // [];
    my %BlockedGroups = map { $_ => 1 } @{$BlockedGroups};
    return if !%BlockedGroups;
    return if !$BlockedGroups{ $Param{Group} };

    return 1;
}

sub _GetUsersOfGroups {
    my ( $Self, %Param ) = @_;

    my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');
    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Groups)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return if !IsArrayRefWithData( $Param{Groups} );
    my %Groups = map { $_ => 1 } @{ $Param{Groups} };

    my %Users;
    GROUP:
    for my $Group ( sort keys %Groups ) {
        my $GroupID = $GroupObject->GroupLookup(
            Group => $Group,
        );
        next GROUP if !$GroupID;

        my %GroupUsers = $GroupObject->PermissionGroupUserGet(
            GroupID => $GroupID,
            Type    => 'ro',
        );
        next GROUP if !%GroupUsers;

        %Users = ( %Users, %GroupUsers );
    }

    my @Users = values %Users;

    return \@Users;
}

sub _GetMentionedUserIDs {
    my ( $Self, %Param ) = @_;

    my $UserObject = $Kernel::OM->Get('Kernel::System::User');
    my $LogObject  = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(MentionedUsers)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    return if !IsArrayRefWithData( $Param{MentionedUsers} );

    my %MentionedUserIDs;
    USER:
    for my $User ( @{ $Param{MentionedUsers} } ) {
        my $UserID = $UserObject->UserLookup(
            UserLogin => $User,
        );
        next USER if !$UserID;

        $MentionedUserIDs{$UserID} = 1;
    }

    my @MentionedUserIDs = sort keys %MentionedUserIDs;

    return \@MentionedUserIDs;
}

sub _AssembleOrderByQuery {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    my $OrderBy      = $Param{OrderBy} // 'create_time';
    my %ValidOrderBy = (
        user_id     => 1,
        ticket_id   => 1,
        article_id  => 1,
        create_time => 1,
    );
    if ( !$ValidOrderBy{$OrderBy} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'OrderBy' contains invalid column name!",
        );
        return;
    }

    my $SortOrder = $Param{SortOrder} // 'ASC';
    if ( $SortOrder !~ m{\A(?:ASC|DESC)\z}i ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter 'SortOrder' contains invalid value!",
        );
        return;
    }

    my $OrderByQuery = "$OrderBy $SortOrder";

    return $OrderByQuery;
}

1;
