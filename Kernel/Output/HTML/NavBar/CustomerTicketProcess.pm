# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Output::HTML::NavBar::CustomerTicketProcess;

use parent 'Kernel::Output::HTML::Base';

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Cache',
    'Kernel::System::Ticket',
    'Kernel::System::ProcessManagement::Process',
);

sub Run {
    my ( $Self, %Param ) = @_;

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get process management configuration
    my $FrontendModuleConfig     = $ConfigObject->Get('CustomerFrontend::Module')->{CustomerTicketProcess};
    my $FrontendNavigationConfig = $ConfigObject->Get('CustomerFrontend::Navigation')->{CustomerTicketProcess};

    # check if the registration config is valid
    return if !IsHashRefWithData($FrontendModuleConfig);
    return if !IsHashRefWithData($FrontendNavigationConfig);
    return if !IsArrayRefWithData( $FrontendNavigationConfig->{'002-ProcessManagement'} );

    my $NameForID     = $FrontendNavigationConfig->{'002-ProcessManagement'}->[0]->{Name};
    my $NameForHidden = $NameForID;
    $NameForID =~ s/[ &;]//ig;

    # check if the module name is valid
    return if !$NameForID;

    my $DisplayMenuItem;

    # check the cache
    my $CacheKey = 'ProcessManagement::UserID' . $Self->{UserID} . '::DisplayMenuItem';

    # get cache object
    my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

    my $Cache = $CacheObject->Get(
        Type => 'ProcessManagement_Process',
        Key  => $CacheKey,
    );

    # set the cache value to show or hide the menu item (if value exists)
    if ( $Cache && ref $Cache eq 'SCALAR' ) {
        $DisplayMenuItem = ${$Cache};
    }

    # otherwise determine the value by quering the process object
    else {

        $DisplayMenuItem = 0;
        my $Processes = $ConfigObject->Get('Process');

        # avoid error messages when there is no processes and call ProcessList
        if ( IsHashRefWithData($Processes) ) {

            # get process list
            my $ProcessList = $Kernel::OM->Get('Kernel::System::ProcessManagement::Process')->ProcessList(
                ProcessState => ['Active'],
                Interface    => ['CustomerInterface'],
            );

            # prepare process list for ACLs, use only entities instead of names, convert from
            #   P1 => Name to P1 => P1. As ACLs should work only against entities
            my %ProcessListACL = map { $_ => $_ } sort keys %{$ProcessList};

            # get ticket object
            my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

            # validate the ProcessList with stored ACLs
            my $ACL = $TicketObject->TicketAcl(
                ReturnType     => 'Process',
                ReturnSubType  => '-',
                Data           => \%ProcessListACL,
                CustomerUserID => $Self->{UserID},
            );

            if ( IsHashRefWithData($ProcessList) && $ACL ) {

                # get ACL results
                my %ACLData = $TicketObject->TicketAclData();

                # recover process names
                my %ReducedProcessList = map { $_ => $ProcessList->{$_} } sort keys %ACLData;

                # replace original process list with the reduced one
                $ProcessList = \%ReducedProcessList;
            }

            # set the value to show or hide the menu item (based in process list)
            if ( IsHashRefWithData($ProcessList) ) {
                $DisplayMenuItem = 1;
            }
        }

        # get the cache TTL (in seconds)
        my $CacheTTL = int( $Kernel::OM->Get('Kernel::Config')->Get('Process::NavBar::CacheTTL') || 900 );

        # set cache
        $CacheObject->Set(
            Type  => 'ProcessManagement_Process',
            Key   => $CacheKey,
            Value => \$DisplayMenuItem,
            TTL   => $CacheTTL,
        );
    }

    # return nothing to display the menu item
    return if $DisplayMenuItem;

    # frontend module is enabled but there is no selectable process, then remove the menu entry
    my $NavBarName = $FrontendModuleConfig->{NavBarName};
    my $Priority   = sprintf( '%07d', $FrontendNavigationConfig->{'002-ProcessManagement'}->[0]->{Prio} );

    return if !$Param{NavBarModule};

    # remove CustomerTicketProcess from the main menu
    delete $Param{NavBarModule}->{$Priority};

    return 1;
}

1;
