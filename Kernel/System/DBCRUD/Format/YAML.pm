# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DBCRUD::Format::YAML;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::YAML',
);

=head1 NAME

Kernel::System::DBCRUD::Format::YAML - DBCRUD YAML lib

=head1 SYNOPSIS

All DBCRUD format YAML functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my DBCRUDYAMLObject = $Kernel::OM->Get('Kernel::System::DBCRUD::Format::YAML');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{CacheType} = 'DBCRUDYAML';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;

    for my $Item ( sort keys %Param ) {
        $Self->{$Item} = $Param{$Item};
    }

    return $Self;
}

=head2 GetContent()

return content of yml string as array-ref.

    my $Array = $DBCRUDYAMLObject->GetContent(
        Content => $ContentString,
    );

Returns:

    my $Array = [];

=cut

sub GetContent {
    my ( $Self, %Param ) = @_;

    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');

    my $Content = $YAMLObject->Load(
        Data => $Param{Content},
    );

    return $Content;
}

=head2 SetContent()

return content of array as yml string.

    my $ExportString = $DBCRUDYAMLObject->SetContent(
        Content => $Array,
    );

Returns:

    my $ExportString = '---';

=cut

sub SetContent {
    my ( $Self, %Param ) = @_;

    my $YAMLObject = $Kernel::OM->Get('Kernel::System::YAML');

    my $ExportString = $YAMLObject->Dump( Data => \@{ $Param{Content} } );
    return $ExportString;
}

1;
