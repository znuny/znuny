# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::AdminTicketAttributeRelations;

use strict;
use warnings;
use utf8;

use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::DynamicField',
    'Kernel::System::DynamicField::Backend',
    'Kernel::System::TicketAttributeRelations',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject                   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject                    = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $TicketAttributeRelationsObject = $Kernel::OM->Get('Kernel::System::TicketAttributeRelations');

    my ( %GetParam, %Errors );

    $GetParam{ID} = $ParamObject->GetParam( Param => 'ID' );
    my $StoredTicketAttributeRelations;
    if ( $GetParam{ID} ) {
        $StoredTicketAttributeRelations = $TicketAttributeRelationsObject->GetTicketAttributeRelations(
            ID     => $GetParam{ID},
            UserID => $Self->{UserID},
        );

        if ( !IsHashRefWithData($StoredTicketAttributeRelations) ) {
            return $LayoutObject->FatalError(
                Message => "Ticket attribute relations record with ID $GetParam{ID} not found.",
            );
        }
    }

    if ( $Self->{Subaction} eq 'Change' ) {
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Self->_Edit(
            Action => 'Change',
            %{$StoredTicketAttributeRelations},
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminTicketAttributeRelations',
            Data         => {
                %Param,
                TicketAttributeRelations => $StoredTicketAttributeRelations,
                Action                   => 'Change',
            },
        );
        $Output .= $LayoutObject->Footer();

        return $Output;
    }
    elsif ( $Self->{Subaction} eq 'ChangeAction' ) {
        $LayoutObject->ChallengeTokenCheck();

        for my $Parameter (qw(Priority DynamicFieldConfigUpdate)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        # File upload is optional on update
        my %UploadData = $ParamObject->GetUploadAll(
            Param => 'File',
        );

        if (%UploadData) {

            # Check if another record already has the same filename.
            my $ExistingTicketAttributeRelationsID
                = $TicketAttributeRelationsObject->ExistsTicketAttributeRelationsFilename(
                Filename => $UploadData{Filename},
                );

            my $FilenameUsedByOtherRecord
                = $ExistingTicketAttributeRelationsID && $ExistingTicketAttributeRelationsID != $GetParam{ID};

            if (
                $UploadData{Filename} !~ m{\.(csv|xlsx)\z}i
                || !defined $UploadData{Content}
                || !length $UploadData{Content}
                || $FilenameUsedByOtherRecord
                )
            {
                $Errors{FileInvalid} = 'ServerError';
            }
        }
        else {
            $UploadData{Filename} = $StoredTicketAttributeRelations->{Filename};
            $UploadData{Content}  = $StoredTicketAttributeRelations->{RawData};
        }

        if ( !%Errors ) {
            my $UpdateSuccess = $TicketAttributeRelationsObject->UpdateTicketAttributeRelations(
                ID                       => $GetParam{ID},
                Filename                 => $UploadData{Filename},
                Data                     => $UploadData{Content},
                DynamicFieldConfigUpdate => $GetParam{DynamicFieldConfigUpdate},
                Priority                 => $GetParam{Priority},
                UserID                   => $Self->{UserID},
            );

            if ($UpdateSuccess) {
                if ( $ParamObject->GetParam( Param => 'ContinueAfterSave' ) ) {
                    return $LayoutObject->Redirect(
                        OP => "Action=$Self->{Action};Subaction=Change;ID=$GetParam{ID}"
                    );
                }

                return $LayoutObject->Redirect(
                    OP => "Action=$Self->{Action}",
                );
            }

            $Errors{FileInvalid} = 'ServerError';
        }

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Change',
            Errors => \%Errors,
            %{$StoredTicketAttributeRelations},
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminTicketAttributeRelations',
            Data         => {
                %Param,
                Action => 'Change',
            },
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    elsif ( $Self->{Subaction} eq 'Add' ) {
        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Self->_Edit(
            Action => 'Add',
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminTicketAttributeRelations',
            Data         => {
                %Param,
                Action => 'Add',
            },
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    elsif ( $Self->{Subaction} eq 'AddAction' ) {
        $LayoutObject->ChallengeTokenCheck();

        for my $Parameter (qw(Priority DynamicFieldConfigUpdate)) {
            $GetParam{$Parameter} = $ParamObject->GetParam( Param => $Parameter ) || '';
        }

        my %UploadData = $ParamObject->GetUploadAll(
            Param => 'File',
        );

        # Check if another record already has the same filename.
        my $FilenameUsedByOtherRecord;
        if (%UploadData) {
            $FilenameUsedByOtherRecord = $TicketAttributeRelationsObject->ExistsTicketAttributeRelationsFilename(
                Filename => $UploadData{Filename},
            );
        }

        if (
            !%UploadData
            || $UploadData{Filename} !~ m{\.(csv|xlsx)\z}i
            || !defined $UploadData{Content}
            || !length $UploadData{Content}
            || $FilenameUsedByOtherRecord
            )
        {
            $Errors{'FileInvalid'} = 'ServerError';
        }

        if ( !%Errors ) {
            my $TicketAttributeRelationsID = $TicketAttributeRelationsObject->AddTicketAttributeRelations(
                Filename                 => $UploadData{Filename},
                Data                     => $UploadData{Content},
                Priority                 => $GetParam{Priority},
                DynamicFieldConfigUpdate => $GetParam{DynamicFieldConfigUpdate},
                UserID                   => $Self->{UserID},
            );
            if ($TicketAttributeRelationsID) {
                return $LayoutObject->Redirect(
                    OP => "Action=$Self->{Action}",
                );
            }

            $Errors{FileInvalid} = 'ServerError';
        }

        my $Output = $LayoutObject->Header();
        $Output .= $LayoutObject->NavigationBar();
        $Output .= $LayoutObject->Notify( Priority => 'Error' );
        $Self->_Edit(
            Action => 'Add',
            Errors => \%Errors,
            %GetParam,
        );
        $Output .= $LayoutObject->Output(
            TemplateFile => 'AdminTicketAttributeRelations',
            Data         => {
                %Param,
                Action => 'Add',
            },
        );
        $Output .= $LayoutObject->Footer();
        return $Output;
    }
    elsif ( $Self->{Subaction} eq 'Download' ) {
        my %MimeTypes = (
            csv  => 'text/csv',
            xlsx => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        );

        my $MimeType = 'application/octet-stream';

        ( my $FilenameExtension ) = ( $StoredTicketAttributeRelations->{Filename} =~ m{.*\.(.*)\z} );
        if ( defined $FilenameExtension && $MimeTypes{ lc $FilenameExtension } ) {
            $MimeType = $MimeTypes{ lc $FilenameExtension };
        }

        return $LayoutObject->Attachment(
            Filename    => $StoredTicketAttributeRelations->{Filename},
            ContentType => $MimeType,
            Content     => $StoredTicketAttributeRelations->{RawData},
        );
    }
    elsif ( $Self->{Subaction} eq 'Delete' ) {
        $TicketAttributeRelationsObject->DeleteTicketAttributeRelations(
            ID     => $GetParam{ID},
            UserID => $Self->{UserID},
        );

        return $LayoutObject->Redirect(
            OP => "Action=$Self->{Action}",
        );
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();

    $Self->_Overview();

    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminTicketAttributeRelations',
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _Edit {
    my ( $Self, %Param ) = @_;

    my $LayoutObject                   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketAttributeRelationsObject = $Kernel::OM->Get('Kernel::System::TicketAttributeRelations');
    my $DynamicFieldObject             = $Kernel::OM->Get('Kernel::System::DynamicField');
    my $DynamicFieldBackendObject      = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

    my $TicketAttributeRelations = $TicketAttributeRelationsObject->GetAllTicketAttributeRelations(
        UserID => $Self->{UserID},
    );
    my $TicketAttributeRelationsCount = scalar @{$TicketAttributeRelations};

    #
    # Priority selection
    #
    my @SelectablePriorities;
    for my $CurrentTicketAttributeRelations ( @{$TicketAttributeRelations} ) {
        push @SelectablePriorities, {
            Key   => $CurrentTicketAttributeRelations->{Priority},
            Value => $CurrentTicketAttributeRelations->{Priority}
                . " ($CurrentTicketAttributeRelations->{Filename})",
        };
    }
    if ( $Self->{Subaction} =~ m{\AAdd(Action)?\z} ) {
        push @SelectablePriorities, {
            Key   => $TicketAttributeRelationsCount + 1,
            Value => $TicketAttributeRelationsCount + 1,
        };
    }

    my $PrioritySelectionHTML = $LayoutObject->BuildSelection(
        Data       => \@SelectablePriorities,
        Name       => 'Priority',
        Class      => 'Priority',
        SelectedID => $Param{Priority} ? $Param{Priority} : $TicketAttributeRelationsCount + 1,
        Class      => 'Modernize Validate_Required',
    );

    if ( $Param{Action} =~ m{\AChange(Action)?\z} ) {

        #
        # Check which values of the ticket attribute relations are missing
        # from dynamic field dropdowns and selections.
        #
        my %PossibleAttributeValues;
        ATTRIBUTE:
        for my $Attribute ( $Param{Attribute1}, $Param{Attribute2} ) {
            next ATTRIBUTE if $Attribute !~ m{\ADynamicField_(.*)}i;

            my $DynamicFieldName = $1;

            my $DynamicFieldConfig = $DynamicFieldObject->DynamicFieldGet(
                Name => $DynamicFieldName,
            );
            next ATTRIBUTE if !IsHashRefWithData($DynamicFieldConfig);
            next ATTRIBUTE if $DynamicFieldConfig->{FieldType} !~ m{Dropdown|Multiselect};

            $PossibleAttributeValues{$Attribute} = $DynamicFieldBackendObject->PossibleValuesGet(
                DynamicFieldConfig => $DynamicFieldConfig,
            );
        }

        ATTRIBUTE:
        for my $Attribute ( $Param{Attribute1}, $Param{Attribute2} ) {
            next ATTRIBUTE if $Attribute !~ m{\ADynamicField_(.*)}xmsi;

            # Loop over all data of the ticket attribute relations record.
            VALUE:
            for my $Value ( @{ $Param{Data} } ) {
                next VALUE if exists $PossibleAttributeValues{$Attribute}->{ $Value->{$Attribute} };

                # save if the value is missing
                $Value->{ $Attribute . 'ValueMissing' } = 1;
            }
        }
    }

    $LayoutObject->Block(
        Name => 'Edit',
        Data => {
            %Param,
            %{ $Param{Errors} // {} },
            PrioritySelectionHTML => $PrioritySelectionHTML,
            Action                => $Param{Action},
        },
    );

    return 1;
}

sub _Overview {
    my ( $Self, %Param ) = @_;

    my $TicketAttributeRelationsObject = $Kernel::OM->Get('Kernel::System::TicketAttributeRelations');
    my $LayoutObject                   = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    my $TicketAttributeRelations = $TicketAttributeRelationsObject->GetAllTicketAttributeRelations(
        UserID => $Self->{UserID},
    );

    $LayoutObject->Block(
        Name => 'Overview',
        Data => {
            TicketAttributeRelations => $TicketAttributeRelations,
        },
    );

    return 1;
}

1;
