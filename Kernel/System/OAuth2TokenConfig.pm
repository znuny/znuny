# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
package Kernel::System::OAuth2TokenConfig;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::GenericInterface::Webservice',
    'Kernel::System::Log',
    'Kernel::System::MailAccount',
    'Kernel::System::OAuth2Token',
);

use parent qw(Kernel::System::DBCRUD);

=head1 NAME

Kernel::System::OAuth2TokenConfig - OAuth2TokenConfig lib

=head1 SYNOPSIS

All OAuth2TokenConfig functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $OAuth2TokenConfigObject = $Kernel::OM->Get('Kernel::System::OAuth2TokenConfig');

=cut

=head2 DataAdd()

Add data to table.

    my $Success = $OAuth2TokenConfigObject->DataAdd(
        ID         => '...',
        Name       => '...',
        Config     => '...',
        ValidID    => '...',
        CreateTime => '...',
        CreateBy   => '...',
        ChangeTime => '...',
        ChangeBy   => '...',
    );

Returns:

    my $Success = 1;

=cut

=head2 DataUpdate()

Update data attributes.

    my $Success = $OAuth2TokenConfigObject->DataUpdate(
        ID     => 1234,
        UserID => 1,

        # all other attributes are optional
        Name       => '...',
        Config     => '...',
        ValidID    => '...',
        CreateTime => '...',
        CreateBy   => '...',
        ChangeTime => '...',
        ChangeBy   => '...',
    );

Returns:

    my $Success = 1; # 1|0

=cut

=head2 DataGet()

Get data attributes.

    my %Data = $OAuth2TokenConfigObject->DataGet(
        ID         => '...', # optional
        Name       => '...', # optional
        Config     => '...', # optional
        ValidID    => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        ChangeTime => '...', # optional
        ChangeBy   => '...', # optional
    );

Returns:

    my %Data = (
        ID         => '...',
        Name       => '...',
        Config     => '...',
        ValidID    => '...',
        CreateTime => '...',
        CreateBy   => '...',
        ChangeTime => '...',
        ChangeBy   => '...',
    );

=cut

=head2 DataListGet()

Get list data with attributes.

    my @Data = $OAuth2TokenConfigObject->DataListGet(
        ID         => '...', # optional
        Name       => '...', # optional
        Config     => '...', # optional
        ValidID    => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        ChangeTime => '...', # optional
        ChangeBy   => '...', # optional
    );

Returns:

    my @Data = (
        {
            ID         => '...',
            Name       => '...',
            Config     => '...',
            ValidID    => '...',
            CreateTime => '...',
            CreateBy   => '...',
            ChangeTime => '...',
            ChangeBy   => '...',
        },
        # ...
    );

=cut

=head2 DataDelete()

Remove data from table.

    my $Success = $OAuth2TokenConfigObject->DataDelete(
        ID         => '...', # optional
        Name       => '...', # optional
        Config     => '...', # optional
        ValidID    => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        ChangeTime => '...', # optional
        ChangeBy   => '...', # optional
    );

Returns:

    my $Success = 1;

=cut

=head2 DataSearch()

Search for value in defined attributes.

    my %Data = $OAuth2TokenConfigObject->DataSearch(
        Search     => 'test*test',
        ID         => '...', # optional
        Name       => '...', # optional
        Config     => '...', # optional
        ValidID    => '...', # optional
        CreateTime => '...', # optional
        CreateBy   => '...', # optional
        ChangeTime => '...', # optional
        ChangeBy   => '...', # optional
    );

Returns:

    my %Data = (
        '1' => {
            ID         => '...',
            Name       => '...',
            Config     => '...',
            ValidID    => '...',
            CreateTime => '...',
            CreateBy   => '...',
            ChangeTime => '...',
            ChangeBy   => '...',
        },
        # ...
    );

=cut

=head2 InitConfig()

init config for object

    my $Success = $OAuth2TokenConfigObject->InitConfig();

Returns:

    my $Success = 1;

=cut

sub InitConfig {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    $Self->{Columns} = {
        ID => {
            Column       => 'id',
            SearchTarget => 0,
        },
        Name => {
            Column       => 'name',
            SearchTarget => 0,
            ImportID     => 1,
        },
        Config => {
            Column       => 'config',
            SearchTarget => 0,
            ContentJSON  => 1,
            DisableWhere => 1,
        },
        ValidID => {
            Column       => 'valid_id',
            SearchTarget => 0,
        },
        CreateTime => {
            Column       => 'create_time',
            SearchTarget => 0,
            TimeStampAdd => 1,
        },
        CreateBy => {
            Column       => 'create_by',
            SearchTarget => 0,
        },
        ChangeTime => {
            Column          => 'change_time',
            SearchTarget    => 0,
            TimeStampUpdate => 1,
            TimeStampAdd    => 1,
        },
        ChangeBy => {
            Column       => 'change_by',
            SearchTarget => 0,
        },
    };

    # base table configuration
    $Self->{Name}           = 'OAuth2TokenConfig';
    $Self->{Identifier}     = 'ID';
    $Self->{DatabaseTable}  = 'oauth2_token_config';
    $Self->{DefaultSortBy}  = 'Name';
    $Self->{DefaultOrderBy} = 'ASC';
    $Self->{CacheType}      = 'OAuth2TokenConfig';
    $Self->{CacheTTL}       = $ConfigObject->Get( 'DBCRUD::' . $Self->{Name} . '::CacheTTL' ) || 60 * 60 * 8;

    $Self->{UserIDCheck} = 1;

    $Self->{AutoCreateMissingUUIDDatabaseTableColumns} = 1;

    # base function activation
    $Self->{FunctionDataAdd}           = 1;
    $Self->{FunctionDataUpdate}        = 1;
    $Self->{FunctionDataGet}           = 1;
    $Self->{FunctionDataListGet}       = 1;
    $Self->{FunctionDataDelete}        = 1;
    $Self->{FunctionDataSearch}        = 1;
    $Self->{FunctionDataExport}        = 1;
    $Self->{FunctionDataImport}        = 1;
    $Self->{HistoryFunctionDataUpdate} = 0;

    return 1;
}

sub DataDelete {
    my ( $Self, %Param ) = @_;

    my $OAuth2TokenObject = $Kernel::OM->Get('Kernel::System::OAuth2Token');

    # Delete token
    if ( defined $Param{ $Self->{Identifier} } ) {
        my $TokenDeleted = $OAuth2TokenObject->DataDelete(
            TokenConfigID => $Param{ $Self->{Identifier} },
            UserID        => $Param{UserID},
        );
        return if !$TokenDeleted;
    }

    return $Self->SUPER::DataDelete(%Param);
}

=head2 UsedOAuth2TokenConfigListGet()

DEPRECATED. Remove in Znuny 6.5.

Returns a list of used OAuth2 token configs as array.

    my @UsedOAuth2TokenConfigListGet = $OAuth2TokenConfigObject->UsedOAuth2TokenConfigListGet(
        Scope => 'MailAccount'      # optional, default 'undef', (MailAccount);
    );

Returns:

    my @UsedOAuth2TokenConfigListGet = (
        {
            ID      => 1,
            Scope   => 'MailAccount',
            ScopeID => '1',
            Name    => 'Google Mail Token Config',
            Config  => {
                ClientID      => 2,
                Scope         => https://mail.google.com/,
                ClientSecret  => 3,
                TemplateName  => Google Mail,
                Notifications => {
                    NotifyOnExpiredRefreshToken => 1,
                    NotifyOnExpiredToken        => 1,
                },
            },
            ValidID    => 1,
            CreateTime => 2016-04-16 12:34:56,
            CreateBy   => 1,
            ChangeTime => 2016-04-16 12:34:56,
            ChangeBy   => 1,
        },
    );

=cut

sub UsedOAuth2TokenConfigListGet {
    my ( $Self, %Param ) = @_;

    my %UsedOAuth2TokenConfigIDs;
    my @UsedOAuth2TokenConfigListGet;

    if ( !$Param{Scope} || $Param{Scope} eq 'MailAccount' ) {

        my $MailAccountObject = $Kernel::OM->Get('Kernel::System::MailAccount');
        my @MailAccounts      = $MailAccountObject->MailAccountGetAll();

        MAILACCOUNT:
        for my $MailAccount (@MailAccounts) {

            next MAILACCOUNT if !$MailAccount->{OAuth2TokenConfigID};

            $UsedOAuth2TokenConfigIDs{MailAccount}->{ $MailAccount->{ID} } = $MailAccount->{OAuth2TokenConfigID};
        }
    }

    return if !%UsedOAuth2TokenConfigIDs;

    my @OAuth2TokenConfigs = $Self->DataListGet(
        UserID => 1,
    );

    return if !@OAuth2TokenConfigs;

    for my $Scope ( sort keys %UsedOAuth2TokenConfigIDs ) {
        CONFIG:
        for my $ScopeID ( sort keys %{ $UsedOAuth2TokenConfigIDs{$Scope} } ) {

            my $OAuth2TokenConfigID = $UsedOAuth2TokenConfigIDs{$Scope}->{$ScopeID};

            my ($Config) = grep { $OAuth2TokenConfigID eq $_->{ID} } @OAuth2TokenConfigs;

            next CONFIG if !$Config;

            my %Config = %{$Config};

            $Config{Scope}   = $Scope;
            $Config{ScopeID} = $ScopeID;

            push @UsedOAuth2TokenConfigListGet, \%Config;
        }
    }
    return @UsedOAuth2TokenConfigListGet;
}

=head2 IsOAuth2TokenConfigInUse()

Checks if the token config with the given ID is in use (e.g. mail account, web service, etc.).

    my $IsInUse = $OAuth2TokenConfigObject->IsOAuth2TokenConfigInUse(
        ID => 3,
    );

    Returns true value if in use.

=cut

sub IsOAuth2TokenConfigInUse {
    my ( $Self, %Param ) = @_;

    my $LogObject         = $Kernel::OM->Get('Kernel::System::Log');
    my $MailAccountObject = $Kernel::OM->Get('Kernel::System::MailAccount');
    my $WebserviceObject  = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');

    NEEDED:
    for my $Needed (qw( ID )) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    # Check mail accounts.
    my @MailAccounts = $MailAccountObject->MailAccountGetAll();

    MAILACCOUNT:
    for my $MailAccount (@MailAccounts) {
        next MAILACCOUNT if !defined $MailAccount->{OAuth2TokenConfigID};
        next MAILACCOUNT if $MailAccount->{OAuth2TokenConfigID} != $Param{ID};

        return 1;
    }

    # Check generic interface requester configs (HTTP::REST).
    my $Webservices = $WebserviceObject->WebserviceList();
    return if !IsHashRefWithData($Webservices);

    WEBSERVICEID:
    for my $WebserviceID ( sort keys %{$Webservices} ) {
        my $Webservice = $WebserviceObject->WebserviceGet(
            ID => $WebserviceID,
        );
        next WEBSERVICEID if !IsHashRefWithData($Webservice);

        my $AuthenticationConfig = $Webservice->{Config}->{Requester}->{Transport}->{Config}->{Authentication};
        next WEBSERVICEID if !IsHashRefWithData($AuthenticationConfig);

        next WEBSERVICEID if !$AuthenticationConfig->{AuthType};
        next WEBSERVICEID if $AuthenticationConfig->{AuthType} ne 'OAuth2Token';
        next WEBSERVICEID if !$AuthenticationConfig->{OAuth2TokenConfigID};
        next WEBSERVICEID if $AuthenticationConfig->{OAuth2TokenConfigID} != $Param{ID};

        return 1;
    }

    return;
}

1;
