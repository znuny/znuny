# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::processes::examples::Customer_user_registration_post;
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

    my @Data = (
        {
            'Ticket::Frontend::AgentTicketZoom' => {
                'ProcessWidgetDynamicFieldGroups' => {
                    'Request data - new customer user contact' =>
                        'PreProcUserFirstname,PreProcUserLastname,PreProcUserLanguage,PreProcUserEmail, PreProcUserPhone',
                },
                'ProcessWidgetDynamicField' => {
                    'PreProcUserFirstname' => '1',
                    'PreProcUserLastname'  => '1',
                    'PreProcUserLanguage'  => '1',
                    'PreProcUserEmail'     => '1',
                    'PreProcUserPhone'     => '1',
                },
            },
        }
    );

    $Response{Success} = $Self->SystemConfigurationUpdate(
        ProcessName => 'Customer user registration',
        Data        => \@Data,
    );

    return %Response;
}

1;
