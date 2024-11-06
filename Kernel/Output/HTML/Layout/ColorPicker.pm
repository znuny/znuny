# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::Layout::ColorPicker;

use strict;
use warnings;
use utf8;

our $ObjectManagerDisabled = 1;

=head1 NAME

Kernel::Output::HTML::Layout::ColorPicker - ColorPicker data

=head1 DESCRIPTION

All valid functions.

=head1 PUBLIC INTERFACE

=head2 ColorPicker()

build a HTML color picker input element based on given data

    my $HTML = $LayoutObject->ColorPicker(
        Type => 'InputField',           # Input         returns only a single input field
                                        # InputField    returns label and field combination

        Name  => 'Name',                # name of element
        ID    => 'ID',                  # the HTML ID for this element, if not provided, the name will be used as ID as well
        Class => 'class',               # (optional) a css class, include 'Modernize' to activate InputFields
        Label => 'Color',               # (optional) the label if type 'InputField' is used

        # ColorPicker configurations
        # All configurations listed here can be used https://jscolor.com/docs/
        # Keys can be written in CamelCase or in lowerCamelCase.

        Value   => '#FF8A25',           # default selected color
        Color   => '#FF8A25',           # default selected color

        Width   => 141,                 # make the picker a little narrower
        Palette => [
            '#000000', '#7d7d7d',
            '#870014', '#ec1c23',
            '#fef100', '#22b14b',
            '#00a1e7', '#3f47cc',
            '#ffffff', '#c3c3c3',
            '#b87957', '#feaec9',
            '#eee3af', '#b5e61d',
            '#99d9ea', '#7092be',
        ],
    );

returns:

    my $HTML = '<input type="text" id="[% Data.ID | html %]" name="[% Data.Name | html %]" class="[% Data.Class | html %]" value="[% Data.Value | html %]"
    data-jscolor="[% Data.JSColorConfig | html %]">';

=cut

sub ColorPicker {
    my ( $Self, %Param ) = @_;

    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');
    my $JSONObject   = $Kernel::OM->Get('Kernel::System::JSON');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    NEEDED:
    for my $Needed (qw(Type Name ID)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed in ColorPicker!",
        );
        return;
    }

    $Param{Label} //= 'Color';
    $Param{Value} //= $Param{Color} // '#FF8A25';

    my @TemplateAttributes = ( 'Type', 'Name', 'ID', 'Class', 'Label', 'Color' );
    my %ColorPickerConfig  = (
        backgroundColor => 'rgb(245, 245, 245)',
        borderColor     => 'rgb(201, 201, 201)',
        borderRadius    => '8',
        mode            => 'HV',
        value           => '#ff9b00',
    );

    my $Config = $ConfigObject->Get('ColorPicker');

    # get color palette
    if ( $Config->{Palette} && !$Param{Palette} ) {
        $ColorPickerConfig{palette} = $Config->{Palette};
    }

    ATTRIBUTE:
    for my $Attribute ( sort keys %Param ) {
        next ATTRIBUTE if grep { $Attribute eq $_ } @TemplateAttributes;
        my $Key = lcfirst($Attribute);
        $ColorPickerConfig{$Key} = $Param{$Attribute};
    }

    my $ColorPickerConfig = $JSONObject->Encode(
        Data     => \%ColorPickerConfig,
        SortKeys => 1,
        Pretty   => 1,
    );

    $Self->Block(
        Name => $Param{Type} || 'InputField',
        Data => {
            ColorPickerConfig => $ColorPickerConfig,
            %Param,
        }
    );

    # create & return output
    return $Self->Output(
        TemplateFile => 'FormElements/ColorPicker',
        Data         => {
            %Param,
        }
    );
}

1;
