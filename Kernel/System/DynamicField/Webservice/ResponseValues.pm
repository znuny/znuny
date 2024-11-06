# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicField::Webservice::ResponseValues;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::GenericInterface::Requester',
    'Kernel::System::GenericInterface::Webservice',
    'Kernel::System::Log',
);

use parent qw(Kernel::System::DynamicField::Webservice::Base);
use Kernel::System::VariableCheck qw(:all);

=head1 NAME

Kernel::System::DynamicField::Webservice::ResponseValues - Dynamic field web service response values backend lib

=head1 INHERITS

L<Kernel::System::DynamicField::Webservice::Base>

=head1 PUBLIC INTERFACE

=head2 Request()

Returns the payload of the backend.

    my $Result = $DynamicFieldWebserviceResponseValuesObject->Request(
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

    my $LogObject        = $Kernel::OM->Get('Kernel::System::Log');
    my $WebserviceObject = $Kernel::OM->Get('Kernel::System::GenericInterface::Webservice');
    my $RequesterObject  = $Kernel::OM->Get('Kernel::GenericInterface::Requester');

    $Param{Invoker} //= $Param{InvokerSearch} // $Param{InvokerGet};

    NEEDED:
    for my $Needed (qw(Webservice Invoker SearchTerms UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $WebserviceData = $WebserviceObject->WebserviceGet(
        Name => $Param{Webservice}
    );
    if ( !IsHashRefWithData($WebserviceData) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Web service '$Param{Webservice}' not found."
        );
    }

    $Param{Data} //= {};

    my $ResultData = $RequesterObject->Run(
        WebserviceID => $WebserviceData->{ID},
        Invoker      => $Param{Invoker},
        Data         => {
            %{ $Param{Data} },
            Limit       => $Param{Limit},
            SearchTerms => $Param{SearchTerms},
            UserID      => $Param{UserID},
        },
    );

    if (
        !IsHashRefWithData($ResultData)
        && !IsArrayRefWithData( $ResultData->{Data} )
        || (
            !$ResultData->{Success}
            && !$ResultData->{ResponseSuccess}
        )
        )
    {
        my %Error = (
            Error => "Error while getting result from web service $Param{Webservice}!",
        );

        $LogObject->Log(
            Priority => 'error',
            Message  => $Error{Error}
        );
    }

    return $ResultData->{Data}->{values}
        if !$ResultData->{Data}->{response} || !$ResultData->{Data}->{response}->{returnmessage};

    $LogObject->Log(
        Priority => 'debug',
        Message  => $ResultData->{Data}->{response}->{returnmessage},
    );

    return $ResultData->{Data}->{values};
}

=head2 Documentation()

Returns the documentation of the backend.

    my $Documentation = $DynamicFieldWebserviceResponseValuesObject->Documentation();

Returns:

    my $Documentation = '';

=cut

sub Documentation {
    my ( $Self, %Param ) = @_;

    my $Documentation = <<"EOF";
Runs a request with return code and return message handling.

Example response:
{
    response => {
        returncode    => '200',
        returnmessage => 'Success'
    },
    values => [
        {
            ID    => '1',
            Name  => 'Znuny',
            Value => 'Rocks',
        }
    ],
}

Returns:
[
    {
        ID    => '1',
        Name  => 'Znuny',
        Value => 'Rocks',
    }
]

EOF

    return $Documentation;
}

1;
