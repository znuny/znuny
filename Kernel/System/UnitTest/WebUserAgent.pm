# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::UnitTest::WebUserAgent;

use strict;
use warnings;
use utf8;

use HTTP::Response;
use Sub::Override;
use Test::LWP::UserAgent;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::UnitTest::WebUserAgent - WebUserAgent lib

=head1 SYNOPSIS

All WebUserAgent functions

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $UnitTestWebUserAgentObject = $Kernel::OM->Get('Kernel::System::UnitTest::WebUserAgent');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{RiggedUserAgent}      = Test::LWP::UserAgent->new();
    $Self->{OverwrittenUserAgent} = undef;

    return $Self;
}

=head2 Mock()

Mocks all outgoing requests to a given mapping.

    my $Success = $UnitTestWebUserAgentObject->Mock(
        URL            => qr/testserver\/success/,
        Status         => 'OK',
        StatusCode     => '200',
        Header         => [ 'Content-Type' => 'application/json' ],
        Body           => '{ "access_token": "123", "token_type": "ABC" }',
    );

Returns:

    my $Success = 1;

=cut

sub Mock {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(URL Status StatusCode Header Body)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in !",
        );
        return;
    }

    my $URL        = $Param{URL};
    my $Status     = $Param{Status};
    my $StatusCode = $Param{StatusCode};
    my $Header     = $Param{Header};
    my $Body       = $Param{Body};

    $Self->{RiggedUserAgent}->map_response(
        $URL => HTTP::Response->new(
            $StatusCode,
            $Status,
            $Header,
            $Body,
        ),
    );

    $Self->_OverwrittenUserAgentRestore();

    $Self->{OverwrittenUserAgent} = Sub::Override->new(
        'LWP::UserAgent::new' => sub { return $Self->{RiggedUserAgent} }
    );

    return 1;
}

=head2 LastResponseGet()

Returns the last response of the overwritten user agent.

    my %Response = $Object->LastResponseGet();

Returns:

    my %Response = (
          'Status' => 'OK',
          'Body' => '{ "access_token": "123", "token_type": "ABC" }',
          'Header' => 'Content-Type: application/json
Client-Date: Wed, 25 Jan 2017 11:10:00 GMT
',
          'URL' => 'http://blub/rest',
          'StatusCode' => 200
    );

=cut

sub LastResponseGet {
    my ( $Self, %Param ) = @_;

    return if !$Self->{RiggedUserAgent};

    my $Result = $Self->{RiggedUserAgent}->last_http_response_received();
    return if !$Result;

    return (
        URL        => $Result->{_request}->{_uri}->as_string(),
        Status     => $Result->{_msg},
        StatusCode => $Result->{_rc},
        Header     => $Result->{_headers}->as_string(),
        Body       => $Result->{_content},
    );
}

=head2 LastRequestGet()

Returns the last request of the overwritten user agent.

    my %Request = $Object->LastRequestGet();

Returns:

    my %Request = (
          'Body' => '=',
          'URL' => 'http://blub/rest',
          'Method' => 'POST',
          'Header' => 'Authorization: Basic AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
User-Agent: OTRS 4.0.x git
Content-Length: 1
Content-Type: application/x-www-form-urlencoded
'
    );

=cut

sub LastRequestGet {
    my ( $Self, %Param ) = @_;

    return if !$Self->{RiggedUserAgent};

    my $Result = $Self->{RiggedUserAgent}->last_http_response_received();
    return if !$Result;

    return (
        URL    => $Result->{_request}->{_uri}->as_string(),
        Method => $Result->{_request}->{_method},
        Header => $Result->{_request}->{_headers}->as_string(),
        Body   => $Result->{_request}->{_content},
    );
}

=head2 Reset()

Removes all mocks and mocking status.

    my $Success = $UnitTestWebUserAgentObject->Reset();

Returns:

    my $Success = 1;

=cut

sub Reset {
    my ( $Self, %Param ) = @_;

    $Self->_OverwrittenUserAgentRestore();
    $Self->{RiggedUserAgent} = Test::LWP::UserAgent->new();

    return 1;
}

=head2 _OverwrittenUserAgentRestore()

Restores overwritten user agent.

    my $Success = $UnitTestWebUserAgentObject->_OverwrittenUserAgentRestore();

Returns:

    my $Success = 1;

=cut

sub _OverwrittenUserAgentRestore {
    my ( $Self, %Param ) = @_;

    return 1 if !defined $Self->{OverwrittenUserAgent};

    $Self->{OverwrittenUserAgent}->restore();
    $Self->{OverwrittenUserAgent} = undef;

    return 1;
}

1;
