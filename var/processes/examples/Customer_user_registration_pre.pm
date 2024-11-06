# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::processes::examples::Customer_user_registration_pre;
## nofilter(TidyAll::Plugin::Znuny::Perl::PerlCritic)

use strict;
use warnings;

use parent qw(var::processes::examples::Base);

our @ObjectDependencies = ();

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my %Response = (
        Success => 1,
    );

    # Dynamic fields definition
    my @DynamicFields = (
        {
            Name       => 'PreProcUserFirstname',
            Label      => 'Contact\'s first name',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            FieldOrder => 10000,
            Config     => {
                DefaultValue => '',
            },
        },
        {
            Name       => 'PreProcUserLastname',
            Label      => 'Contact\'s last name',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            FieldOrder => 10001,
            Config     => {
                DefaultValue => '',
            },
        },
        {
            Name       => 'PreProcUserLanguage',
            Label      => 'Contact\'s preferred language',
            FieldType  => 'Dropdown',
            ObjectType => 'Ticket',
            FieldOrder => 10006,
            Config     => {
                DefaultValue   => '',
                PossibleNone   => 1,
                PossibleValues => {
                    'en' => 'English',
                    'de' => 'German',
                },
            },
        },
        {
            Name       => 'PreProcUserEmail',
            Label      => 'Contact\'s e-mail address',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            FieldOrder => 10002,
            Config     => {
                DefaultValue => '',
            },
        },
        {
            Name       => 'PreProcUserPhone',
            Label      => 'Contact\'s telephone number',
            FieldType  => 'Text',
            ObjectType => 'Ticket',
            FieldOrder => 10003,
            Config     => {
                DefaultValue => '',
            },
        },
    );

    %Response = $Self->DynamicFieldsAdd(
        DynamicFieldList => \@DynamicFields,
    );

    return %Response;
}

1;
