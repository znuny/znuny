# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::MailAccount;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DB',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::Valid',
    'Kernel::System::Cache',
);

=head1 NAME

Kernel::System::MailAccount - to manage mail accounts

=head1 DESCRIPTION

All functions to manage the mail accounts.

=head1 PUBLIC INTERFACE

=head2 new()

Don't use the constructor directly, use the ObjectManager instead:

    my $MailAccountObject = $Kernel::OM->Get('Kernel::System::MailAccount');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    $Self->{CacheType} = 'MailAccount';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;    # 20 days

    return $Self;
}

=head2 MailAccountAdd()

adds a new mail account

    my $MailAccountID = $MailAccount->MailAccountAdd(
        Login               => 'mail',
        Password            => 'SomePassword',
        Host                => 'pop3.example.com',
        Type                => 'POP3',
        IMAPFolder          => 'Some Folder',       # optional, only valid for IMAP-type accounts
        ValidID             => 1,
        Trusted             => 0,
        AuthenticationType  => 'oauth2_token',      # optional; defaults to 'password'
        OAuth2TokenConfigID => 2,                   # optional
        DispatchingBy       => 'Queue',             # Queue|From
        QueueID             => 12,
        UserID              => 123,
    );

Returns:

    my $MailAccountID = 1;

=cut

sub MailAccountAdd {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    for my $Needed (qw(Login Password Host ValidID Trusted DispatchingBy QueueID UserID)) {
        if ( !defined $Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "$Needed not defined!"
            );
            return;
        }
    }
    for my $Needed (qw(Login Password Host Type ValidID UserID)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    $Param{AuthenticationType} //= 'password';
    my %AuthenticationTypes = $Self->GetAuthenticationTypes();
    if ( !$AuthenticationTypes{ $Param{AuthenticationType} } ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Invalid value '$Param{AuthenticationType}' for parameter AuthenticationType.",
        );
        return;
    }

    # check if dispatching is by From
    if ( $Param{DispatchingBy} eq 'From' ) {
        $Param{QueueID} = 0;
    }
    elsif ( $Param{DispatchingBy} eq 'Queue' && !$Param{QueueID} ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Need QueueID for dispatching!"
        );
        return;
    }

    # only set IMAP folder on IMAP type accounts
    # fallback to 'INBOX' if none given
    if ( $Param{Type} =~ m{ IMAP .* }xmsi ) {
        if ( !defined $Param{IMAPFolder} || !$Param{IMAPFolder} ) {
            $Param{IMAPFolder} = 'INBOX';
        }
    }
    else {
        $Param{IMAPFolder} = '';
    }

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # sql
    return if !$DBObject->Do(
        SQL =>
            'INSERT INTO mail_account (login, pw, host, account_type, valid_id, comments, queue_id, '
            . ' imap_folder, trusted, authentication_type, oauth2_token_config_id, create_time, create_by, change_time, change_by)'
            . ' VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
        Bind => [
            \$Param{Login},   \$Param{Password}, \$Param{Host},    \$Param{Type},
            \$Param{ValidID}, \$Param{Comment},  \$Param{QueueID}, \$Param{IMAPFolder},
            \$Param{Trusted}, \$Param{AuthenticationType}, \$Param{OAuth2TokenConfigID},
            \$Param{UserID}, \$Param{UserID},
        ],
    );

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return if !$DBObject->Prepare(
        SQL  => 'SELECT id FROM mail_account WHERE login = ? AND host = ? AND account_type = ?',
        Bind => [ \$Param{Login}, \$Param{Host}, \$Param{Type} ],
    );

    my $ID;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $ID = $Row[0];
    }

    return $ID;
}

=head2 MailAccountGetAll()

returns an array of all mail account data

    my @MailAccounts = $MailAccount->MailAccountGetAll();

Returns:

    my @MailAccount = (
        [
            ID                  => 123,
            Login               => 'mail',
            Password            => 'SomePassword',
            Host                => 'pop3.example.com',
            Type                => 'POP3',
            QueueID             => 1,
            IMAPFolder          => 'Some Folder',
            Trusted             => 0,
            Comment             => 'Comment',
            ValidID             => 1,
            AuthenticationType  => 'oauth2_token',
            OAuth2TokenConfigID => 2,
            CreateTime          => '16-04-2016 12:34:56',
            ChangeTime          => '16-04-2016 12:34:56',
        ],
        [
            # ...
        ]
    );


=cut

sub MailAccountGetAll {
    my ( $Self, %Param ) = @_;

    # check cache
    my $CacheKey = 'MailAccountGetAll';
    my $Cache    = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return @{$Cache} if $Cache;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # sql
    return if !$DBObject->Prepare(
        SQL =>
            'SELECT id, login, pw, host, account_type, queue_id, imap_folder, trusted, comments, valid_id, '
            . ' authentication_type, oauth2_token_config_id, create_time, change_time FROM mail_account',
    );

    my @Accounts;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        my %Data = (
            ID                  => $Data[0],
            Login               => $Data[1],
            Password            => $Data[2],
            Host                => $Data[3],
            Type                => $Data[4] || 'POP3',    # compat for old setups
            QueueID             => $Data[5],
            IMAPFolder          => $Data[6],
            Trusted             => $Data[7],
            Comment             => $Data[8],
            ValidID             => $Data[9],
            AuthenticationType  => $Data[10],
            OAuth2TokenConfigID => $Data[11],
            CreateTime          => $Data[12],
            ChangeTime          => $Data[13],
        );

        if ( $Data{QueueID} == 0 ) {
            $Data{DispatchingBy} = 'From';
        }
        else {
            $Data{DispatchingBy} = 'Queue';
        }

        # only return IMAP folder on IMAP type accounts
        # fallback to 'INBOX' if none given
        if ( $Data{Type} =~ m{ IMAP .* }xmsi ) {
            if ( defined $Data{IMAPFolder} && !$Data{IMAPFolder} ) {
                $Data{IMAPFolder} = 'INBOX';
            }
        }
        else {
            $Data{IMAPFolder} = '';
        }

        push @Accounts, \%Data;
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \@Accounts,
    );

    return @Accounts;
}

=head2 MailAccountGet()

returns a hash of mail account data

    my %MailAccount = $MailAccount->MailAccountGet(
        ID => 123,
    );

Returns:

    my %MailAccount = (
        ID                  => 123,
        Login               => 'mail',
        Password            => 'SomePassword',
        Host                => 'pop3.example.com',
        Type                => 'POP3',
        QueueID             => 1,
        IMAPFolder          => 'Some Folder',
        Trusted             => 0,
        Comment             => 'Comment',
        ValidID             => 1,
        AuthenticationType  => 'oauth2_token',
        OAuth2TokenConfigID => 2,
        CreateTime          => '16-04-2016 12:34:56',
        ChangeTime          => '16-04-2016 12:34:56',
    );

=cut

sub MailAccountGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need ID!"
        );
        return;
    }

    # check cache
    my $CacheKey = join '::', 'MailAccountGet', 'ID', $Param{ID};
    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return %{$Cache} if $Cache;

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    # sql
    return if !$DBObject->Prepare(
        SQL =>
            'SELECT login, pw, host, account_type, queue_id, imap_folder, trusted, comments, valid_id, '
            . ' authentication_type, oauth2_token_config_id, create_time, change_time FROM mail_account WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

    my %Data;
    while ( my @Data = $DBObject->FetchrowArray() ) {
        %Data = (
            ID                  => $Param{ID},
            Login               => $Data[0],
            Password            => $Data[1],
            Host                => $Data[2],
            Type                => $Data[3] || 'POP3',    # compat for old setups
            QueueID             => $Data[4],
            IMAPFolder          => $Data[5],
            Trusted             => $Data[6],
            Comment             => $Data[7],
            ValidID             => $Data[8],
            AuthenticationType  => $Data[9],
            OAuth2TokenConfigID => $Data[10],
            CreateTime          => $Data[11],
            ChangeTime          => $Data[12],
        );
    }

    if ( $Data{QueueID} == 0 ) {
        $Data{DispatchingBy} = 'From';
    }
    else {
        $Data{DispatchingBy} = 'Queue';
    }

    # only return IMAP folder on IMAP type accounts
    # fallback to 'INBOX' if none given
    if ( $Data{Type} =~ m{ IMAP .* }xmsi ) {
        if ( defined $Data{IMAPFolder} && !$Data{IMAPFolder} ) {
            $Data{IMAPFolder} = 'INBOX';
        }
    }
    else {
        $Data{IMAPFolder} = '';
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Data,
    );

    return %Data;
}

=head2 MailAccountUpdate()

update a new mail account

    my $Success = $MailAccount->MailAccountUpdate(
        ID                  => 1,
        Login               => 'mail',
        Password            => 'SomePassword',
        Host                => 'pop3.example.com',
        Type                => 'POP3',
        IMAPFolder          => 'Some Folder',   # optional, only valid for IMAP-type accounts
        ValidID             => 1,
        Trusted             => 0,
        AuthenticationType  => 'oauth2_token',  # optional; defaults to 'password'
        OAuth2TokenConfigID => 2, # optional
        DispatchingBy       => 'Queue',         # Queue|From
        QueueID             => 12,
        UserID              => 123,
    );

Returns:

    my $Success = 1;

=cut

sub MailAccountUpdate {
    my ( $Self, %Param ) = @_;

    for my $Needed (qw(ID Login Password Host Type ValidID Trusted DispatchingBy QueueID UserID)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    $Param{AuthenticationType} //= 'password';
    my %AuthenticationTypes = $Self->GetAuthenticationTypes();
    if ( !$AuthenticationTypes{ $Param{AuthenticationType} } ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Invalid value '$Param{AuthenticationType}' for parameter AuthenticationType.",
        );
        return;
    }

    # check if dispatching is by From
    if ( $Param{DispatchingBy} eq 'From' ) {
        $Param{QueueID} = 0;
    }
    elsif ( $Param{DispatchingBy} eq 'Queue' && !$Param{QueueID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need QueueID for dispatching!"
        );
        return;
    }

    # only set IMAP folder on IMAP type accounts
    # fallback to 'INBOX' if none given
    if ( $Param{Type} =~ m{ IMAP .* }xmsi ) {
        if ( !defined $Param{IMAPFolder} || !$Param{IMAPFolder} ) {
            $Param{IMAPFolder} = 'INBOX';
        }
    }
    else {
        $Param{IMAPFolder} = '';
    }

    # sql
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => 'UPDATE mail_account SET login = ?, pw = ?, host = ?, account_type = ?, '
            . ' comments = ?, imap_folder = ?, trusted = ?, authentication_type = ?, oauth2_token_config_id = ?, '
            . ' valid_id = ?, change_time = current_timestamp, '
            . ' change_by = ?, queue_id = ? WHERE id = ?',
        Bind => [
            \$Param{Login}, \$Param{Password}, \$Param{Host}, \$Param{Type},
            \$Param{Comment}, \$Param{IMAPFolder}, \$Param{Trusted},
            \$Param{AuthenticationType}, \$Param{OAuth2TokenConfigID},
            \$Param{ValidID}, \$Param{UserID}, \$Param{QueueID}, \$Param{ID},
        ],
    );

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1;
}

=head2 MailAccountDelete()

deletes a mail account

    $MailAccount->MailAccountDelete(
        ID => 123,
    );

=cut

sub MailAccountDelete {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{ID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Need ID!"
        );
        return;
    }

    # sql
    return if !$Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL  => 'DELETE FROM mail_account WHERE id = ?',
        Bind => [ \$Param{ID} ],
    );

    # delete cache
    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
        Type => $Self->{CacheType},
    );

    return 1;
}

=head2 MailAccountList()

returns a list (Key, Name) of all mail accounts

    my %List = $MailAccount->MailAccountList(
        Valid => 0, # just valid/all accounts
    );

=cut

sub MailAccountList {
    my ( $Self, %Param ) = @_;

    # check cache
    my $CacheKey = join '::', 'MailAccountList', ( $Param{Valid} ? 'Valid::1' : '' );
    my $Cache = $Kernel::OM->Get('Kernel::System::Cache')->Get(
        Type => $Self->{CacheType},
        Key  => $CacheKey,
    );
    return %{$Cache} if $Cache;

    # get valid object
    my $ValidObject = $Kernel::OM->Get('Kernel::System::Valid');

    my $Where = $Param{Valid}
        ? 'WHERE valid_id IN ( ' . join ', ', $ValidObject->ValidIDsGet() . ' )'
        : '';

    # get database object
    my $DBObject = $Kernel::OM->Get('Kernel::System::DB');

    return if !$DBObject->Prepare(
        SQL => "SELECT id, host, login FROM mail_account $Where",
    );

    my %Data;
    while ( my @Row = $DBObject->FetchrowArray() ) {
        $Data{ $Row[0] } = "$Row[1] ($Row[2])";
    }

    # set cache
    $Kernel::OM->Get('Kernel::System::Cache')->Set(
        Type  => $Self->{CacheType},
        TTL   => $Self->{CacheTTL},
        Key   => $CacheKey,
        Value => \%Data,
    );

    return %Data;
}

=head2 MailAccountBackendList()

returns a list of usable backends

    my %List = $MailAccount->MailAccountBackendList();

=cut

sub MailAccountBackendList {
    my ( $Self, %Param ) = @_;

    my $Directory = $Kernel::OM->Get('Kernel::Config')->Get('Home') . '/Kernel/System/MailAccount/';

    my @List = $Kernel::OM->Get('Kernel::System::Main')->DirectoryRead(
        Directory => $Directory,
        Filter    => '*.pm',
    );

    my %Backends;

    FILE:
    for my $File (@List) {

        # remove .pm
        $File =~ s/^.*\/(.+?)\.pm$/$1/;
        next FILE if $File eq 'Base';    # ignore mail account base module

        my $GenericModule = "Kernel::System::MailAccount::$File";

        # try to load module $GenericModule
        if ( eval "require $GenericModule" ) {    ## no critic
            if ( eval { $GenericModule->new() } ) {
                $Backends{$File} = $File;
            }
        }
    }

    return %Backends;
}

=head2 MailAccountFetch()

fetch emails by using backend

    my $Ok = $MailAccount->MailAccountFetch(
        Login         => 'mail',
        Password      => 'SomePassword',
        Host          => 'pop3.example.com',
        Type          => 'POP3',    # POP3,POP3s,IMAP,IMAPS
        Trusted       => 0,
        DispatchingBy => 'Queue',   # Queue|From
        QueueID       => 12,
        UserID        => 123,
    );

=cut

sub MailAccountFetch {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Login Password Host Type Trusted DispatchingBy QueueID UserID)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # load backend
    my $GenericModule = "Kernel::System::MailAccount::$Param{Type}";

    # try to load module $GenericModule
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($GenericModule) ) {
        return;
    }

    # fetch mails
    my $Backend = $GenericModule->new();

    return $Backend->Fetch(%Param);
}

=head2 MailAccountCheck()

Check inbound mail configuration

    my %Check = $MailAccount->MailAccountCheck(
        Login    => 'mail',
        Password => 'SomePassword',
        Host     => 'pop3.example.com',
        Type     => 'POP3',             # POP3|POP3S|IMAP|IMAPS
        Timeout  => '60',
        Debug    => '0',
    );

=cut

sub MailAccountCheck {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Login Password Host Type Timeout Debug)) {
        if ( !defined $Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # load backend
    my $GenericModule = "Kernel::System::MailAccount::$Param{Type}";

    # try to load module $GenericModule
    if ( !$Kernel::OM->Get('Kernel::System::Main')->Require($GenericModule) ) {
        return;
    }

    # check if connect is successful
    my $Backend = $GenericModule->new();
    my %Check   = $Backend->Connect(%Param);

    if ( $Check{Successful} ) {
        return ( Successful => 1 );
    }
    else {
        return (
            Successful => 0,
            Message    => $Check{Message}
        );
    }
}

=head2 GetAuthenticationTypes()

Returns the available authentication types.

    my %AuthenticationTypes = $MailAccountObject->GetAuthenticationTypes();

Returns:

    my %AuthenticationTypes = (
        # authentication type => name
        password              => 'Password',
        oauth2_token          => 'OAuth2 token',
    );

=cut

sub GetAuthenticationTypes {
    my ( $Self, %Param ) = @_;

    my %AuthenticationTypes = (
        password     => 'Password',
        oauth2_token => 'OAuth2 token',
    );

    return %AuthenticationTypes;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
