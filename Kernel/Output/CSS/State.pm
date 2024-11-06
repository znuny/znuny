# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::CSS::State;

use strict;
use warnings;
use utf8;

use parent 'Kernel::Output::CSS::Base';

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::State',
);

use Kernel::System::VariableCheck qw(:all);

=head1 NAME

Kernel::Output::CSS::State - output css state

=head2 CreateCSS()

Creates and returns a CSS string.

    my $CSS = $CSSObject->CreateCSS();

Returns:

    my $CSS = 'CSS';

=cut

sub CreateCSS {
    my ( $Self, %Param ) = @_;

    my $StateObject  = $Kernel::OM->Get('Kernel::System::State');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my %StateList = $StateObject->StateList(
        UserID => 1,
        Valid  => 0,
    );

    return '' if !%StateList;

    my %Data;

    STATEID:
    for my $StateID ( sort keys %StateList ) {
        my %State = $StateObject->StateGet(
            ID => $StateID,
        );
        next STATEID if !%State;
        next STATEID if !IsStringWithData( $State{Color} );

        $Data{ '.StateID-' . $StateID } = {
            background => $State{Color} . ' !important',
        };
    }

    my $CSS = $LayoutObject->ConvertToCSS(
        Data => \%Data,
    ) // '';

    return $CSS;
}

1;
