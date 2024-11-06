# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ParamObject)

package Kernel::System::UnitTest::Param;

use strict;
use warnings;

use File::Spec;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Web::Request',
);

=head1 NAME

Kernel::System::UnitTest::Param - Helper to unit test the Param object

=head1 SYNOPSIS

Functions to unit test Params

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $UnitTestParamObject = $Kernel::OM->Get('Kernel::System::UnitTest::Param');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 ParamUploadSet()

Sets a file path as an upload parameter for the Param object.

    my $Success = $UnitTestParamObject->ParamUploadSet(
        Name     => 'Upload',
        Location => '...',
    );

Returns:

    my $Success = 1;

=cut

sub ParamUploadSet {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    NEEDED:
    for my $Needed (qw(Name Location)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name     = $Param{Name};
    my $Location = $Param{Location};

    my ( $Volume, $Directories, $Filename ) = File::Spec->splitpath($Location);

    open( my $FH, '<', $Location );    ## no critic

    $ParamObject->{Query}->param(
        -name   => $Name,
        -values => [ $Filename, $FH ],
    );

    return 1;
}

=head2 ParamSet()

Sets a parameter for the Param object.

    my $Success = $UnitTestParamObject->ParamSet(
        Name  => 'Upload',
        Value => '...',
    );

Returns:

    my $Success = 1;

=cut

sub ParamSet {
    my ( $Self, %Param ) = @_;

    my $LogObject   = $Kernel::OM->Get('Kernel::System::Log');
    my $ParamObject = $Kernel::OM->Get('Kernel::System::Web::Request');

    NEEDED:
    for my $Needed (qw(Name)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Name  = $Param{Name};
    my $Value = $Param{Value};

    $ParamObject->{Query}->param(
        -name   => $Name,
        -values => $Value,
    );

    return 1;
}

1;
