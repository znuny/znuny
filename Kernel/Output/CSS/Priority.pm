# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::CSS::Priority;

use strict;
use warnings;
use utf8;

use parent 'Kernel::Output::CSS::Base';

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Priority',
);

use Kernel::System::VariableCheck qw(:all);

=head1 NAME

Kernel::Output::CSS::Priority - output css priority

=head2 CreateCSS()

Creates and returns a CSS string.

    my $CSS = $CSSObject->CreateCSS();

Returns:

    my $CSS = 'CSS';

=cut

sub CreateCSS {
    my ( $Self, %Param ) = @_;

    my $PriorityObject = $Kernel::OM->Get('Kernel::System::Priority');
    my $LayoutObject   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %PriorityList = $PriorityObject->PriorityList(
        UserID => 1,
        Valid  => 0,
    );

    return '' if !%PriorityList;

    my %Data;

    PriorityID:
    for my $PriorityID ( sort keys %PriorityList ) {
        my %Priority = $PriorityObject->PriorityGet(
            PriorityID => $PriorityID,
            UserID     => 1,
        );
        next PriorityID if !%Priority;
        next PriorityID if !IsStringWithData( $Priority{Color} );

        $Data{ '.PriorityID-' . $PriorityID } = {
            background => $Priority{Color} . ' !important',
        };
    }

    my $CSS = $LayoutObject->ConvertToCSS(
        Data => \%Data,
    ) // '';

    return $CSS;
}

1;
