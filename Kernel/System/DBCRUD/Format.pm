# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DBCRUD::Format;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

=head1 NAME

Kernel::System::DBCRUD::Format - Format lib

=head1 SYNOPSIS

All file format functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my $DBCRUDFormatObject = $Kernel::OM->Get('Kernel::System::DBCRUD::Format');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    my $Self = {};
    bless( $Self, $Type );

    my $Home = $ConfigObject->Get('Home');
    my $Path = $Home . '/Kernel/System/DBCRUD/Format';

    my @Backends = $MainObject->DirectoryRead(
        Directory => $Path,
        Filter    => '*.pm',
    );

    BACKEND:
    for my $Backend (@Backends) {
        $Backend =~ s{$Path\/}{}gi;
        $Backend =~ s{\.pm}{}gi;

        next BACKEND if $Backend eq 'Base';
        my $Module       = "Kernel::System::DBCRUD::Format::$Backend";
        my $LoadedModule = $MainObject->Require(
            $Module,
            Silent => 1,
        );

        if ( !$LoadedModule ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "# ATTENTION: Can't find backend module for '$Backend'\n\n",
            );
            next BACKEND;
        }
        $Self->{Backends}->{$Backend} = $Kernel::OM->Create(
            $Module,
            ObjectParams => {
                %Param,
            },
        );
    }

    $Self->{BackendsMap} = {
        yml   => 'YAML',
        yaml  => 'YAML',
        csv   => 'CSV',
        excel => 'Excel',
        xlsx  => 'Excel',
    };

    return $Self;
}

=head2 GetContent()

return content of 'format' String as array-ref.

    my $Array = $DBCRUDFormatObject->GetContent(
        Content   => $ContentString,
        Format    => 'yml',                 # yml | csv | excel
    );

Returns:

    my $Array = [];

=cut

sub GetContent {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Format Content)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Backend = $Self->{BackendsMap}->{ lc( $Param{Format} ) };
    return 0 if !$Backend;

    my $Module = $Self->{Backends}->{$Backend};
    return 0 if !$Module;

    return 0 if !$Module->can('GetContent');

    my $Content = $Module->GetContent(%Param);

    return $Content;
}

=head2 SetContent()

return content of 'format' String as array-ref.

    my $Array = $DBCRUDFormatObject->SetContent(
        Content   => $ContentString,
        Format    => 'yml',                 # yml | csv | excel | xlsx
    );

Returns:

    my $Array = [];

=cut

sub SetContent {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(Format Content)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Backend = $Self->{BackendsMap}->{ lc( $Param{Format} ) };
    return 0 if !$Backend;

    my $Module = $Self->{Backends}->{$Backend};
    return 0 if !$Module;

    return 0 if !$Module->can('SetContent');

    my $Content = $Self->{Backends}->{$Backend}->SetContent(%Param);

    return $Content;
}

1;
