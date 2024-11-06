# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DynamicField::Webservice::DirectRequest;

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

Kernel::System::DynamicField::Webservice::DirectRequest - Dynamic field web service direct request backend lib

=head1 INHERITS

L<Kernel::System::DynamicField::Webservice::Base>

=head1 PUBLIC INTERFACE

=head2 Request()

Returns the payload of the backend.

    my $Result = $DynamicFieldWebserviceDirectRequestObject->Request(
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

        # do not return on an error! just log it.
        # it's just for ajax request which will produce
        # an ugly message to the user which does not really help him at all
    }

    # if we got a valid result pass key value to the json
    # a valid result should be an array which includes one or more hashes
    # with the structure:
    #   {
    #       Key   => 'Znuny',
    #       Value => 'Bar'
    #   }
    # please tell your invoker to send the right stuff

    return $ResultData->{Data};
}

=head2 Documentation()

Returns the documentation of the backend.

    my $Documentation = $DynamicFieldWebserviceDirectRequestObject->Documentation();

Returns:

    my $Documentation = '';

=cut

sub Documentation {
    my ( $Self, %Param ) = @_;

    my $Documentation = <<"EOF";
Executes a direct request without any checks before or after.
Example response:
{
    Key   => 'Znuny',
    Value => 'Rocks'
}
EOF

    return $Documentation;
}

1;
