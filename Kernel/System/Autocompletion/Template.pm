# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::Autocompletion::Template;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::Autocompletion::Base);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::Log',
    'Kernel::System::Queue',
    'Kernel::System::StandardTemplate',
    'Kernel::System::TemplateGenerator',
    'Kernel::System::Ticket',
);

=head2 GetData()

    Template autocompletion module.
    Implements autocompletion for standard templates which are also used as reply templates.
    Searches for a template's name (default trigger is ## if Frontend::RichText::Autocompletion::Modules##Template is enabled)
    and will return the template information.

    my $Data = $AutocompletionObject->GetData(
        SearchString     => 'Raw',
        UserID           => 2,
        AdditionalParams => { # optional
            TicketID => 3,
        },
    );

    Returns:

    my $Data = [
        {
            id                   => 3,
            selection_list_title => 'My Template',
            inserted_value       => 'My Template content',
        },
    ];

=cut

sub GetData {
    my ( $Self, %Param ) = @_;

    my $ConfigObject            = $Kernel::OM->Get('Kernel::Config');
    my $LogObject               = $Kernel::OM->Get('Kernel::System::Log');
    my $QueueObject             = $Kernel::OM->Get('Kernel::System::Queue');
    my $TicketObject            = $Kernel::OM->Get('Kernel::System::Ticket');
    my $StandardTemplateObject  = $Kernel::OM->Get('Kernel::System::StandardTemplate');
    my $TemplateGeneratorObject = $Kernel::OM->Get('Kernel::System::TemplateGenerator');

    NEEDED:
    for my $Needed (qw(SearchString UserID)) {
        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $ModuleConfig = $Self->_GetModuleConfig();
    return if !IsHashRefWithData($ModuleConfig);

    my $SearchFields = $ModuleConfig->{SearchFields};
    return if !IsArrayRefWithData($SearchFields);

    my $AdditionalParams = $Param{AdditionalParams} // {};
    my $RichText         = $ConfigObject->Get('Frontend::RichText');

    #
    # Get list of relevant standard templates to fetch autocompletion information for.
    #

    # Use given queue ID.
    # Otherwise use queue ID of existing ticket.
    # There's no fallback without queue ID.
    my %Ticket;
    my $QueueID;
    if ( $AdditionalParams->{QueueID} ) {
        $QueueID = $AdditionalParams->{QueueID};
    }
    elsif ( $AdditionalParams->{TicketID} ) {
        %Ticket = $TicketObject->TicketGet(
            TicketID      => $AdditionalParams->{TicketID},
            UserID        => $Param{UserID},
            DynamicFields => 1,
            Silent        => 1,
        );
        return if !%Ticket;

        $QueueID = $Ticket{QueueID};
    }

    return if !$QueueID;

    # Only use template type "Snippet".
    my %StandardTemplates = $QueueObject->QueueStandardTemplateMemberList(
        QueueID       => $QueueID,
        TemplateTypes => 1,
    );
    return if !%StandardTemplates;
    return if !IsHashRefWithData( $StandardTemplates{Snippet} );
    %StandardTemplates = %{ $StandardTemplates{Snippet} };

    # Build autocompletion information for templates.
    my @Data;
    STANDARDTEMPLATEID:
    for my $StandardTemplateID (
        sort { lc $StandardTemplates{$a} cmp lc $StandardTemplates{$b} || $a cmp $b }
        keys %StandardTemplates
        )
    {
        # Skip template with ID 0.
        next STANDARDTEMPLATEID if $StandardTemplateID == 0;

        my %StandardTemplate = $StandardTemplateObject->StandardTemplateGet(
            ID => $StandardTemplateID,
        );
        next STANDARDTEMPLATEID if !%StandardTemplate;

        # Replace template tags/placeholders.
        $StandardTemplate{Template} = $TemplateGeneratorObject->_Replace(
            RichText   => $RichText,
            Text       => $StandardTemplate{Template},
            TicketData => \%Ticket,
            Data       => {},
            UserID     => $Param{UserID},
        );

        SEARCHFIELD:
        for my $SearchField ( @{$SearchFields} ) {
            next SEARCHFIELD if !IsStringWithData( $StandardTemplate{$SearchField} );
            next SEARCHFIELD if $StandardTemplate{$SearchField} !~ m{\Q$Param{SearchString}\E}i;

            my $MappedData = $Self->_MapData(
                ID                 => $StandardTemplate{ID}                                        // '',
                SelectionListTitle => $StandardTemplate{Name} . ' - ' . $StandardTemplate{Comment} // '',
                InsertedValue      => $StandardTemplate{Template}                                  // '',
            );
            next STANDARDTEMPLATEID if !IsHashRefWithData($MappedData);

            push @Data, $MappedData;
            next STANDARDTEMPLATEID;
        }
    }

    return \@Data;
}

1;
