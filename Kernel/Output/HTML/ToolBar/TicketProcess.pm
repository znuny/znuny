# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Output::HTML::ToolBar::TicketProcess;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Log',
    'Kernel::System::ProcessManagement::Process',
    'Kernel::System::Ticket',
);

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ProcessObject = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process');

    for my $Needed (qw(Config)) {
        if ( !$Param{$Needed} ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Need $Needed!"
            );
            return;
        }
    }

    # check if frontend module is used
    my $Action = $Param{Config}->{Action};
    if ($Action) {
        return if !$ConfigObject->Get('Frontend::Module')->{$Action};
    }

    my $ProcessList = $ProcessObject->ProcessList(
        ProcessState => ['Active'],
        Interface    => ['AgentInterface'],
        Silent       => 1,
    );

    # prepare process list for ACLs, use only entities instead of names, convert from
    #   P1 => Name to P1 => P1. As ACLs should work only against entities
    my %ProcessListACL = map { $_ => $_ } sort keys %{$ProcessList};

    # validate the ProcessList with stored ACLs
    my $ACL = $TicketObject->TicketAcl(
        ReturnType    => 'Process',
        ReturnSubType => '-',
        Data          => \%ProcessListACL,
        Action        => $Self->{Action},
        UserID        => $Self->{UserID},
    );

    if ( IsHashRefWithData($ProcessList) && $ACL ) {

        # get ACL results
        my %ACLData = $TicketObject->TicketAclData();

        # recover process names
        my %ReducedProcessList = map { $_ => $ProcessList->{$_} } sort keys %ACLData;

        # replace original process list with the reduced one
        $ProcessList = \%ReducedProcessList;
    }

    return if ( !IsHashRefWithData($ProcessList) );

    # get item definition
    my $Text      = $LayoutObject->{LanguageObject}->Translate( $Param{Config}->{Name} );
    my $URL       = $LayoutObject->{Baselink} . $Param{Config}->{Link};
    my $Priority  = $Param{Config}->{Priority};
    my $AccessKey = $Param{Config}->{AccessKey};
    my $CssClass  = $Param{Config}->{CssClass};
    my $Icon      = $Param{Config}->{Icon};

    my %Return;
    $Return{$Priority} = {
        Block       => $Param{Config}->{Block},
        Description => $Text,
        Class       => $CssClass,
        Icon        => $Icon,
        Link        => $URL,
        AccessKey   => $AccessKey,
    };
    return %Return;
}

1;
