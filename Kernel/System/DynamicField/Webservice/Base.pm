# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicField::Webservice::Base;

use strict;
use warnings;

our @ObjectDependencies;

=head1 NAME

Kernel::System::DynamicField::Webservice::Base - Dynamic field web service base lib

=head1 PUBLIC INTERFACE

=head2 new()

Don't create an object directly, this is a base module.

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 Request()

Returns the payload of the backend.

    my $Result = $DynamicFieldWebserviceBackendObject->Request(
        Webservice => '...',

        Invoker => '...',
        # OR
        InvokerSearch => '...',
        # OR
        InvokerGet => '...',

        SearchTerms => '...',
        UserID => 1,
    );

Returns:

    my $Result = '';

=cut

sub Request {
    my ( $Self, %Param ) = @_;

    return;
}

=head2 Documentation()

Returns the documentation of the backend.

    my $Documentation = $DynamicFieldWebserviceBackendObject->Documentation();

Returns:

    my $Documentation = '...';

=cut

sub Documentation {
    my ( $Self, %Param ) = @_;

    my $Documentation = <<"EOF";
There is no information for this dynamic field web service backend.
EOF

    return $Documentation;
}

1;
