# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AgentTicketToUnitTest;

use strict;
use warnings;
use utf8;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Email',
    'Kernel::System::Log',
    'Kernel::System::Time',
    'Kernel::System::Web::Request',
    'Kernel::System::UnitTest::TicketToUnitTest',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $TicketToUnitTestObject = $Kernel::OM->Get('Kernel::System::UnitTest::TicketToUnitTest');
    my $LayoutObject           = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LogObject              = $Kernel::OM->Get('Kernel::System::Log');
    my $ParamObject            = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $TimeObject             = $Kernel::OM->Get('Kernel::System::Time');
    my $ConfigObject           = $Kernel::OM->Get('Kernel::Config');
    my $EmailObject            = $Kernel::OM->Get('Kernel::System::Email');

    NEEDED:
    for my $Needed (qw(TicketID)) {
        $Param{$Needed} = $ParamObject->GetParam( Param => $Needed );
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return $LayoutObject->ErrorScreen();
    }

    my $UnitTestContent = $TicketToUnitTestObject->CreateUnitTest(
        TicketID => $Param{TicketID},
    );

    my %SendConfig;
    for my $Attribute (qw(AdminEmail Organization FQDN)) {
        $SendConfig{$Attribute} = $ConfigObject->Get($Attribute);
    }

    my $Filename = "UnitTest-$SendConfig{Organization}-$Param{TicketID}.t";

    if ( $Self->{Subaction} eq 'CreateFile' ) {
        my $UnitTestFile = $LayoutObject->Attachment(
            ContentType => 'text/html; charset=' . $LayoutObject->{Charset},
            Content     => $UnitTestContent,
            Type        => 'attachment',
            Filename    => $Filename,
            NoCache     => 1,
        );

        return $UnitTestFile if $UnitTestFile;
    }
    elsif ( $Self->{Subaction} eq 'SendEmail' ) {

        my $From = $ConfigObject->Get('AdminEmail');
        my $Sent = $EmailObject->Send(
            From       => $SendConfig{AdminEmail},
            To         => 'support@znuny.com',
            Subject    => "UnitTest $SendConfig{Organization}",
            Charset    => 'utf-8',
            MimeType   => 'text/plain',
            Body       => "UnitTest $SendConfig{Organization}",
            Attachment => [
                {
                    Filename    => $Filename,
                    Content     => $UnitTestContent,
                    ContentType => "text/html",
                },
            ],
        );
    }

    return $LayoutObject->Redirect( OP => "Action=AgentTicketZoom;TicketID=$Param{TicketID}" );
}

1;
