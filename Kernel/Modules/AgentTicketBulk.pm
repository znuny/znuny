# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AgentTicketBulk;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    my $ConfigObject       = $Kernel::OM->Get('Kernel::Config');
    my $DynamicFieldObject = $Kernel::OM->Get('Kernel::System::DynamicField');

    $Self->{DynamicField} = $DynamicFieldObject->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => [ 'Ticket', 'Article' ],
        FieldFilter => $ConfigObject->Get("Ticket::Frontend::$Self->{Action}")->{DynamicField} // {},
    );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    if ( $Self->{Subaction} eq 'CancelAndUnlockTickets' ) {

        my @TicketIDs = grep {$_}
            $ParamObject->GetArray( Param => 'LockedTicketID' );

        # challenge token check for write action
        $LayoutObject->ChallengeTokenCheck();

        if ( !@TicketIDs ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Can\'t lock Tickets, no TicketIDs are given!'),
                Comment => Translatable('Please contact the administrator.'),
            );
        }

        my $Message = '';

        TICKETID:
        for my $TicketID (@TicketIDs) {

            my $Access = $TicketObject->TicketPermission(
                Type     => 'lock',
                TicketID => $TicketID,
                UserID   => $Self->{UserID}
            );

            # error screen, don't show ticket
            if ( !$Access ) {
                return $LayoutObject->NoPermission( WithHeader => 'yes' );
            }

            # get history lines to set previous owner
            my @HistoryLines = $TicketObject->HistoryGet(
                TicketID => $TicketID,
                UserID   => $Self->{UserID},
            );

            my @TicketBulkActionHistoryEntries = grep {
                $_->{HistoryType} eq 'Bulk'
                    && $_->{Name} eq 'Ticket bulk action.'
                    && $_->{CreateBy} == $Self->{UserID}
            } @HistoryLines;

            if (@TicketBulkActionHistoryEntries) {
                my $NewestTicketBulkActionHistoryEntry = pop @TicketBulkActionHistoryEntries;
                my $LastOwnerID                        = $NewestTicketBulkActionHistoryEntry->{OwnerID};

                # set previous owner
                $TicketObject->TicketOwnerSet(
                    TicketID  => $TicketID,
                    NewUserID => $LastOwnerID,
                    UserID    => $Self->{UserID},
                );
            }

            # set unlock
            my $Lock = $TicketObject->TicketLockSet(
                TicketID => $TicketID,
                Lock     => 'unlock',
                UserID   => $Self->{UserID},
            );
            next TICKETID if $Lock;
            $Message .= "$TicketID,";
        }

        if ( $Message ne '' ) {
            return $LayoutObject->ErrorScreen(
                Message => $LayoutObject->{LanguageObject}->Translate( "Ticket (%s) is not unlocked!", $Message ),
            );
        }

        return $LayoutObject->Redirect(
            OP => $Self->{LastScreenOverview},
        );

    }

    elsif ( $Self->{Subaction} eq 'AJAXUpdate' ) {

        my $Config = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");

        # Get List type.
        my $TreeView = 0;
        if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
            $TreeView = 1;
        }

        my %GetParam;
        for my $Key (qw(OwnerID ResponsibleID PriorityID QueueID Queue TypeID StateID)) {
            $GetParam{$Key} = $ParamObject->GetParam( Param => $Key ) || '';
        }

        my %QueueList = $Self->_GetQueues(
            %GetParam,
            Type   => 'move_into',
            UserID => $Self->{UserID},
            Action => $Self->{Action},
        );
        my @JSONData = (
            {
                Name         => 'QueueID',
                Data         => \%QueueList,
                SelectedID   => $GetParam{QueueID},
                TreeView     => $TreeView,
                Translation  => 0,
                PossibleNone => 1,
            },
        );

        if ( $Config->{State} ) {
            my %State;
            my %StateList = $Self->_GetStates(
                %GetParam,
                StateType => $Config->{StateType},
                Action    => $Self->{Action},
                UserID    => $Self->{UserID},
            );
            if ( !$Config->{StateDefault} ) {
                $StateList{''} = '-';
            }

            push @JSONData, {
                Name       => 'StateID',
                Data       => \%StateList,
                SelectedID => $GetParam{StateID},
            };
        }

        if ( $ConfigObject->Get('Ticket::Type') && $Config->{TicketType} ) {

            my %TypeList = $Self->_GetTypes(
                %GetParam,
                Action => $Self->{Action},
                UserID => $Self->{UserID},
            );

            push @JSONData, {
                Name         => 'TypeID',
                Data         => \%TypeList,
                SelectedID   => $GetParam{TypeID},
                PossibleNone => 1,
                Translation  => 0,
            };
        }

        if ( $Config->{Owner} ) {
            my %OwnerList = $Self->_GetOwners(
                %GetParam,
                Action => $Self->{Action},
                UserID => $Self->{UserID},
            );

            push @JSONData, {
                Name         => 'OwnerID',
                Data         => \%OwnerList,
                SelectedID   => $GetParam{OwnerID},
                PossibleNone => 1,
            };
        }

        if ( $ConfigObject->Get('Ticket::Responsible') && $Config->{Responsible} ) {
            my %ResponsibleList = $Self->_GetResponsibles(
                %GetParam,
                Action => $Self->{Action},
                UserID => $Self->{UserID},
            );

            push @JSONData, {
                Name         => 'ResponsibleID',
                Data         => \%ResponsibleList,
                SelectedID   => $GetParam{ResponsibleID},
                PossibleNone => 1,
            };
        }

        if ( $Config->{Priority} ) {
            my %PriorityList = $Self->_GetPriorities(
                %GetParam,
                UserID => $Self->{UserID},
                Action => $Self->{Action},
            );
            if ( !$Config->{PriorityDefault} ) {
                $PriorityList{''} = '-';
            }

            push @JSONData, {
                Name       => 'PriorityID',
                Data       => \%PriorityList,
                SelectedID => $GetParam{PriorityID},
            };
        }

        # services
        if ( $ConfigObject->Get('Ticket::Service') && $Config->{Service} ) {
            my $TreeView = 0;
            if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
                $TreeView = 1;
            }

            $GetParam{ServiceID} = $ParamObject->GetParam( Param => 'ServiceID' ) // '';

            my @TicketIDs = grep { defined $_ } $ParamObject->GetArray( Param => 'TicketID' );

            my $Services = $Self->_GetServices(
                %GetParam,
                TicketIDs => \@TicketIDs,
                QueueID   => $GetParam{QueueID},
                UserID    => $Self->{UserID},
            );

            # reset previous ServiceID to reset SLA-List if no service is selected
            if ( !$Param{ServiceID} || !$Services->{ $Param{ServiceID} } ) {
                $Param{ServiceID} = '';
            }

            push @JSONData, {
                Name         => 'ServiceID',
                Data         => $Services,
                SelectedID   => $GetParam{ServiceID},
                TreeView     => $TreeView,
                Sort         => 'TreeView',
                PossibleNone => 1,
            };
        }

        # get bulk modules from SysConfig
        my $BulkModuleConfig = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::Frontend::BulkModule') || {};

        # create bulk module objects
        my @BulkModules;
        MODULECONFIG:
        for my $ModuleConfig ( sort keys %{$BulkModuleConfig} ) {

            next MODULECONFIG if !$ModuleConfig;
            next MODULECONFIG if !$BulkModuleConfig->{$ModuleConfig};
            next MODULECONFIG if ref $BulkModuleConfig->{$ModuleConfig} ne 'HASH';
            next MODULECONFIG if !$BulkModuleConfig->{$ModuleConfig}->{Module};

            my $Module = $BulkModuleConfig->{$ModuleConfig}->{Module};

            my $ModuleObject;
            eval {
                $ModuleObject = $Kernel::OM->Get($Module);
            };

            if ( !$ModuleObject ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not create a new object for $Module!",
                );
                next MODULECONFIG;
            }

            if ( ref $ModuleObject ne $Module ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Object for $Module is invalid!",
                );
                next MODULECONFIG;
            }

            push @BulkModules, $ModuleObject;
        }

        # call AJAXUpdate() in all ticket bulk modules
        if (@BulkModules) {

            MODULEOBJECT:
            for my $ModuleObject (@BulkModules) {
                next MODULEOBJECT if !$ModuleObject->can('AJAXUpdate');

                my $ModuleAjaxUpdate = $ModuleObject->AJAXUpdate(
                    %GetParam,
                    Action => $Self->{Action},
                    UserID => $Self->{UserID},
                );

                next MODULEOBJECT if !IsHashRefWithData($ModuleAjaxUpdate);

                push @JSONData, $ModuleAjaxUpdate;
            }
        }

        my $JSON = $LayoutObject->BuildSelectionJSON( [@JSONData] );

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $JSON,
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    elsif ( $Self->{Subaction} eq 'AJAXRecipientList' ) {

        # get ticket IDs
        my @Recipients;
        my $TicketIDs = $ParamObject->GetParam( Param => 'TicketIDs' );
        if ($TicketIDs) {
            $TicketIDs = $Kernel::OM->Get('Kernel::System::JSON')->Decode(
                Data => $TicketIDs
            );
            @Recipients = $Self->_GetRecipientList( TicketIDs => $TicketIDs );
        }

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $Kernel::OM->Get('Kernel::System::JSON')->Encode( Data => \@Recipients ),
            Type        => 'inline',
            NoCache     => 1,
        );
    }

    elsif ( $Self->{Subaction} eq 'AJAXIgnoreLockedTicketIDs' ) {

        my @ValidTicketIDs;
        my @IgnoreLockedTicketIDs;
        my $TicketIDs = $ParamObject->GetParam( Param => 'TicketIDs' );
        if ($TicketIDs) {
            $TicketIDs = $Kernel::OM->Get('Kernel::System::JSON')->Decode(
                Data => $TicketIDs
            );

        }

        my $Config        = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");
        my @TicketIDArray = split( /;/, $TicketIDs );

        if ( $Config->{RequiredLock} ) {
            for my $TicketID (@TicketIDArray) {
                if ( $TicketObject->TicketLockGet( TicketID => $TicketID ) ) {
                    my $AccessOk = $TicketObject->OwnerCheck(
                        TicketID => $TicketID,
                        OwnerID  => $Self->{UserID},
                    );
                    if ($AccessOk) {
                        push @ValidTicketIDs, $TicketID;
                    }
                    else {
                        push @IgnoreLockedTicketIDs, $TicketID;
                    }
                }
                else {
                    push @ValidTicketIDs, $TicketID;
                }
            }
        }
        else {
            @ValidTicketIDs = @TicketIDArray;
        }

        my %DialogWarning;
        my @IgnoreLockedTicketNumber;
        if ( @IgnoreLockedTicketIDs && !@ValidTicketIDs ) {
            for my $TicketID (@IgnoreLockedTicketIDs) {
                my $TicketNumber = $TicketObject->TicketNumberLookup(
                    TicketID => $TicketID,
                );
                push @IgnoreLockedTicketNumber, $TicketNumber;

            }

            if ( $Config->{RequiredLock} ) {
                if ( scalar @IgnoreLockedTicketNumber > 1 ) {
                    %DialogWarning = (
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            "The following tickets were ignored because they are locked by another agent or you don't have write access to tickets: %s.",
                            join( ", ", @IgnoreLockedTicketNumber ),
                        )
                    );
                }
                else {
                    %DialogWarning = (
                        Message => $LayoutObject->{LanguageObject}->Translate(
                            "The following ticket was ignored because it is locked by another agent or you don't have write access to ticket: %s.",
                            join( ", ", @IgnoreLockedTicketNumber ),
                        )
                    );
                }
            }
            else {
                %DialogWarning = (
                    Message => Translatable('You need to select at least one ticket.'),
                );
            }
        }

        return $LayoutObject->Attachment(
            ContentType => 'application/json; charset=' . $LayoutObject->{Charset},
            Content     => $Kernel::OM->Get('Kernel::System::JSON')->Encode(
                Data => {
                    Message => $DialogWarning{Message} || '',
                }
            ),
            Type    => 'inline',
            NoCache => 1,
        );

    }

    if ( !$Self->{Subaction} || $Self->{Subaction} ne 'AJAXRecipientList' ) {

        # check if bulk feature is enabled
        if ( !$ConfigObject->Get('Ticket::Frontend::BulkFeature') ) {
            return $LayoutObject->ErrorScreen(
                Message => Translatable('Bulk feature is not enabled!'),
            );
        }

        # get involved tickets, filtering empty TicketIDs
        my @ValidTicketIDs;
        my @IgnoreLockedTicketIDs;
        my @TicketIDs = sort grep {$_}
            $ParamObject->GetArray( Param => 'TicketID' );

        my $Config = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");

        # check if only locked tickets have been selected
        if ( $Config->{RequiredLock} ) {
            for my $TicketID (@TicketIDs) {
                if ( $TicketObject->TicketLockGet( TicketID => $TicketID ) ) {
                    my $AccessOk = $TicketObject->OwnerCheck(
                        TicketID => $TicketID,
                        OwnerID  => $Self->{UserID},
                    );
                    if ($AccessOk) {
                        push @ValidTicketIDs, $TicketID;
                    }
                    else {
                        push @IgnoreLockedTicketIDs, $TicketID;
                    }
                }
                else {
                    push @ValidTicketIDs, $TicketID;
                }
            }
        }
        else {
            @ValidTicketIDs = @TicketIDs;
        }

        if ( !@ValidTicketIDs ) {
            if ( $Config->{RequiredLock} ) {
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('No selectable TicketID is given!'),
                    Comment =>
                        Translatable('You either selected no ticket or only tickets which are locked by other agents.'),
                );
            }
            else {
                return $LayoutObject->ErrorScreen(
                    Message => Translatable('No TicketID is given!'),
                    Comment => Translatable('You need to select at least one ticket.'),
                );
            }
        }

        my $Output = $LayoutObject->Header(
            Type => 'Small',
        );

        # make the ticket IDs available in javascript
        $LayoutObject->AddJSData(
            Key   => 'ValidTicketIDs',
            Value => \@ValidTicketIDs,
        );

        # declare the variables for all the parameters
        my %Error;
        my %Time;
        my %GetParam;

        my %DynamicFieldValues;
        my $DynamicFieldBackendObject = $Kernel::OM->Get('Kernel::System::DynamicField::Backend');

        # cycle trough the activated dynamic fields of this screen
        DYNAMICFIELD:
        for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
            next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

            $DynamicFieldValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldBackendObject->EditFieldValueGet(
                DynamicFieldConfig => $DynamicFieldConfig,
                ParamObject        => $ParamObject,
                LayoutObject       => $LayoutObject,
            );
        }

        # convert dynamic field values into a structure for ACLs
        my %DynamicFieldACLParameters;
        DYNAMICFIELD:
        for my $DynamicField ( sort keys %DynamicFieldValues ) {
            next DYNAMICFIELD if !$DynamicField;
            next DYNAMICFIELD if !$DynamicFieldValues{$DynamicField};

            $DynamicFieldACLParameters{ 'DynamicField_' . $DynamicField } = $DynamicFieldValues{$DynamicField};
        }
        $GetParam{DynamicField} = \%DynamicFieldACLParameters;

        # get bulk modules from SysConfig
        my $BulkModuleConfig = $Kernel::OM->Get('Kernel::Config')->Get('Ticket::Frontend::BulkModule') || {};

        # create bulk module objects
        my @BulkModules;
        MODULECONFIG:
        for my $ModuleConfig ( sort keys %{$BulkModuleConfig} ) {

            next MODULECONFIG if !$ModuleConfig;
            next MODULECONFIG if !$BulkModuleConfig->{$ModuleConfig};
            next MODULECONFIG if ref $BulkModuleConfig->{$ModuleConfig} ne 'HASH';
            next MODULECONFIG if !$BulkModuleConfig->{$ModuleConfig}->{Module};

            my $Module = $BulkModuleConfig->{$ModuleConfig}->{Module};

            my $ModuleObject;
            eval {
                $ModuleObject = $Kernel::OM->Get($Module);
            };

            if ( !$ModuleObject ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Could not create a new object for $Module!",
                );
                next MODULECONFIG;
            }

            if ( ref $ModuleObject ne $Module ) {
                $Kernel::OM->Get('Kernel::System::Log')->Log(
                    Priority => 'error',
                    Message  => "Object for $Module is invalid!",
                );
                next MODULECONFIG;
            }

            push @BulkModules, $ModuleObject;
        }

        # get needed objects
        my $StateObject = $Kernel::OM->Get('Kernel::System::State');

        # get all parameters and check for errors
        if ( $Self->{Subaction} eq 'Do' ) {

            # challenge token check for write action
            $LayoutObject->ChallengeTokenCheck();

            # get all parameters
            for my $Key (
                qw(ServiceID OwnerID Owner ResponsibleID Responsible PriorityID Priority QueueID Queue Subject
                Body IsVisibleForCustomer TypeID StateID State MergeToSelection MergeTo LinkTogether
                EmailSubject EmailBody EmailTimeUnits
                LinkTogetherParent Unlock MergeToChecked MergeToOldestChecked MarkTicketsAsSeen MarkTicketsAsUnseen)
                )
            {
                $GetParam{$Key} = $ParamObject->GetParam( Param => $Key ) || '';
            }

            for my $Key (qw(TimeUnits)) {
                $GetParam{$Key} = $ParamObject->GetParam( Param => $Key );
            }

            # get time stamp based on user time zone
            %Time = $LayoutObject->TransformDateSelection(
                Year   => $ParamObject->GetParam( Param => 'Year' ),
                Month  => $ParamObject->GetParam( Param => 'Month' ),
                Day    => $ParamObject->GetParam( Param => 'Day' ),
                Hour   => $ParamObject->GetParam( Param => 'Hour' ),
                Minute => $ParamObject->GetParam( Param => 'Minute' ),
            );

            if ( $GetParam{'MergeToSelection'} eq 'OptionMergeTo' ) {
                $GetParam{'MergeToChecked'} = 'checked';
            }
            elsif ( $GetParam{'MergeToSelection'} eq 'OptionMergeToOldest' ) {
                $GetParam{'MergeToOldestChecked'} = 'checked';
            }

            # check some stuff
            if (
                $GetParam{Subject}
                && $ConfigObject->Get('Ticket::Frontend::AccountTime')
                && $ConfigObject->Get('Ticket::Frontend::NeedAccountedTime')
                && $GetParam{TimeUnits} eq ''
                )
            {
                $Error{'TimeUnitsInvalid'} = 'ServerError';
            }

            if (
                $GetParam{EmailSubject}
                && $ConfigObject->Get('Ticket::Frontend::AccountTime')
                && $ConfigObject->Get('Ticket::Frontend::NeedAccountedTime')
                && $GetParam{EmailTimeUnits} eq ''
                )
            {
                $Error{'EmailTimeUnitsInvalid'} = 'ServerError';
            }

            # Body and Subject must both be filled in or both be empty
            if ( $GetParam{Subject} eq '' && $GetParam{Body} ne '' ) {
                $Error{'SubjectInvalid'} = 'ServerError';
            }
            if ( $GetParam{Subject} ne '' && $GetParam{Body} eq '' ) {
                $Error{'BodyInvalid'} = 'ServerError';
            }

            # Email Body and Email Subject must both be filled in or both be empty
            if ( $GetParam{EmailSubject} eq '' && $GetParam{EmailBody} ne '' ) {
                $Error{'EmailSubjectInvalid'} = 'ServerError';
            }
            if ( $GetParam{EmailSubject} ne '' && $GetParam{EmailBody} eq '' ) {
                $Error{'EmailBodyInvalid'} = 'ServerError';
            }

            # check if pending date must be validated
            if ( $GetParam{StateID} || $GetParam{State} ) {
                my %StateData;
                if ( $GetParam{StateID} ) {
                    %StateData = $StateObject->StateGet(
                        ID => $GetParam{StateID},
                    );
                }
                else {
                    %StateData = $StateObject->StateGet(
                        Name => $GetParam{State},
                    );
                }

                if ( $StateData{TypeName} =~ /^pending/i ) {

                    # create datetime object
                    my $PendingDateTimeObject = $Kernel::OM->Create(
                        'Kernel::System::DateTime',
                        ObjectParams => {
                            %Time,
                            Second => 0,
                        },
                    );

                    # get current system epoch
                    my $CurSystemDateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');
                    if (
                        !$PendingDateTimeObject
                        || $PendingDateTimeObject < $CurSystemDateTimeObject
                        )
                    {
                        $Error{'DateInvalid'} = 'ServerError';
                    }
                }
            }

            # get check item object
            my $CheckItemObject = $Kernel::OM->Get('Kernel::System::CheckItem');

            if ( $GetParam{'MergeToSelection'} eq 'OptionMergeTo' && $GetParam{'MergeTo'} ) {
                $CheckItemObject->StringClean(
                    StringRef => \$GetParam{'MergeTo'},
                    TrimLeft  => 1,
                    TrimRight => 1,
                );
                my $TicketID = $TicketObject->TicketCheckNumber(
                    Tn => $GetParam{'MergeTo'},
                );
                if ( !$TicketID ) {
                    $Error{'MergeToInvalid'} = 'ServerError';
                }
            }
            if ( $GetParam{'LinkTogetherParent'} ) {
                $CheckItemObject->StringClean(
                    StringRef => \$GetParam{'LinkTogetherParent'},
                    TrimLeft  => 1,
                    TrimRight => 1,
                );
                my $TicketID = $TicketObject->TicketCheckNumber(
                    Tn => $GetParam{'LinkTogetherParent'},
                );
                if ( !$TicketID ) {
                    $Error{'LinkTogetherParentInvalid'} = 'ServerError';
                }
            }

            # call Validate() in all ticket bulk modules
            if (@BulkModules) {
                MODULEOBJECT:
                for my $ModuleObject (@BulkModules) {
                    next MODULEOBJECT if !$ModuleObject->can('Validate');

                    my @Result = $ModuleObject->Validate(
                        UserID => $Self->{UserID},
                    );

                    next MODULEOBJECT if !@Result;

                    # include all validation errors in the common error hash
                    for my $ValidationError (@Result) {
                        $Error{ $ValidationError->{ErrorKey} } = $ValidationError->{ErrorValue};
                    }
                }
            }
        }

        # process tickets
        my @TicketIDSelected;
        my $LockedTickets = '';
        my $ActionFlag    = 0;
        my $Counter       = 1;
        $Param{TicketsWereLocked} = 0;

        my %DynamicFieldHTML;
        my %ACLCompatGetParam;
        $ACLCompatGetParam{OwnerID} = $GetParam{OwnerID};

        # if the tickets are to merged, precompute the ticket to merge to.
        # (it's the same for all tickets, so do it only once):
        my $MainTicketID;

        if ( ( $Self->{Subaction} eq 'Do' ) && ( !%Error ) ) {

            # merge to
            if ( $GetParam{'MergeToSelection'} eq 'OptionMergeTo' && $GetParam{'MergeTo'} ) {
                $MainTicketID = $TicketObject->TicketIDLookup(
                    TicketNumber => $GetParam{'MergeTo'},
                );
            }

            # merge to oldest
            elsif ( $GetParam{'MergeToSelection'} eq 'OptionMergeToOldest' ) {

                # find oldest
                my $OldestCreateTime;
                my $OldestTicketID;
                for my $TicketIDCheck (@TicketIDs) {
                    my %Ticket = $TicketObject->TicketGet(
                        TicketID      => $TicketIDCheck,
                        DynamicFields => 0,
                    );
                    if ( !defined $OldestCreateTime || $OldestCreateTime gt $Ticket{Created} ) {
                        $OldestCreateTime = $Ticket{Created};
                        $OldestTicketID   = $TicketIDCheck;
                    }
                }
                $MainTicketID = $OldestTicketID;
            }
        }

        my @TicketsWithError;
        my @TicketsWithLockNotice;
        my $Result;
        my @NonUpdatedTickets;

        my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');

        TICKETID:
        for my $TicketID (@TicketIDs) {
            my %Ticket = $TicketObject->TicketGet(
                TicketID      => $TicketID,
                DynamicFields => 0,
            );

            # check permissions
            my $Access = $TicketObject->TicketPermission(
                Type     => 'rw',
                TicketID => $TicketID,
                UserID   => $Self->{UserID}
            );
            if ( !$Access ) {

                # error screen, don't show ticket
                push @TicketsWithError, $Ticket{TicketNumber};
                next TICKETID;
            }

            # check if it's already locked by somebody else
            if ( $Config->{RequiredLock} ) {
                if ( grep ( { $_ eq $TicketID } @IgnoreLockedTicketIDs ) ) {
                    push @TicketsWithError, $Ticket{TicketNumber};
                    next TICKETID;
                }
                elsif ( $Ticket{Lock} eq 'unlock' ) {
                    $LockedTickets .= "LockedTicketID=" . $TicketID . ';';
                    $Param{TicketsWereLocked} = 1;

                    # set lock
                    $TicketObject->TicketLockSet(
                        TicketID => $TicketID,
                        Lock     => 'lock',
                        UserID   => $Self->{UserID},
                    );

                    $TicketObject->HistoryAdd(
                        Name         => 'Ticket bulk action.',
                        HistoryType  => 'Bulk',
                        TicketID     => $TicketID,
                        CreateUserID => $Self->{UserID},
                    );

                    # set user id
                    $Result = $TicketObject->TicketOwnerSet(
                        TicketID  => $TicketID,
                        UserID    => $Self->{UserID},
                        NewUserID => $Self->{UserID},
                    );

                    push @TicketsWithLockNotice, $Ticket{TicketNumber};

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }
            }

            # remember selected ticket ids
            push @TicketIDSelected, $TicketID;

            # cycle through the activated dynamic fields of this screen
            DYNAMICFIELD:
            for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
                next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

                my $PossibleValuesFilter;

                my $IsACLReducible = $DynamicFieldBackendObject->HasBehavior(
                    DynamicFieldConfig => $DynamicFieldConfig,
                    Behavior           => 'IsACLReducible',
                );

                if ($IsACLReducible) {
                    my $PossibleValues = $DynamicFieldBackendObject->PossibleValuesGet(
                        DynamicFieldConfig => $DynamicFieldConfig,
                    );

                    # check if field has PossibleValues property in its configuration
                    if ( IsHashRefWithData($PossibleValues) ) {

                        # convert possible values key => value to key => key for ACLs using a hash slice
                        my %AclData = %{$PossibleValues};
                        @AclData{ keys %AclData } = keys %AclData;

                        # set possible values filter from ACLs
                        my $ACL = $TicketObject->TicketAcl(
                            %GetParam,
                            %ACLCompatGetParam,
                            Action        => $Self->{Action},
                            ReturnType    => 'Ticket',
                            ReturnSubType => 'DynamicField_' . $DynamicFieldConfig->{Name},
                            Data          => \%AclData,
                            UserID        => $Self->{UserID},
                        );
                        if ($ACL) {
                            my %Filter = $TicketObject->TicketAclData();

                            # convert filter key => key back to key => value
                            %{$PossibleValuesFilter} = map { $_ => $PossibleValues->{$_} }
                                keys %Filter;
                        }
                    }
                }

                my $IsMandatory = $Config->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2;
                $DynamicFieldHTML{ $DynamicFieldConfig->{Name} } = $DynamicFieldBackendObject->EditFieldRender(
                    DynamicFieldConfig   => $DynamicFieldConfig,
                    PossibleValuesFilter => $PossibleValuesFilter,
                    LayoutObject         => $LayoutObject,
                    ParamObject          => $ParamObject,
                    AJAXUpdate           => 0,
                    Mandatory            => $IsMandatory,
                );
            }

            # do some actions on tickets
            if ( ( $Self->{Subaction} eq 'Do' ) && ( !%Error ) ) {

                # challenge token check for write action
                $LayoutObject->ChallengeTokenCheck();

                # Clean up 'TicketSearch' cache type if Bulk screen is reached from ticket search.
                if ( $Self->{LastScreenOverview} =~ /Action=AgentTicketSearch/ ) {
                    $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
                        Type => 'TicketSearch',
                    );
                }

                # set queue
                if ( $GetParam{'QueueID'} || $GetParam{'Queue'} ) {
                    $Result = $TicketObject->TicketQueueSet(
                        QueueID  => $GetParam{'QueueID'},
                        Queue    => $GetParam{'Queue'},
                        TicketID => $TicketID,
                        UserID   => $Self->{UserID},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }

                # set owner
                if ( $Config->{Owner} && ( $GetParam{'OwnerID'} || $GetParam{'Owner'} ) ) {
                    $Result = $TicketObject->TicketOwnerSet(
                        TicketID  => $TicketID,
                        UserID    => $Self->{UserID},
                        NewUser   => $GetParam{'Owner'},
                        NewUserID => $GetParam{'OwnerID'},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }

                    if ( !$Config->{RequiredLock} && $Ticket{StateType} !~ /^close/i ) {
                        $TicketObject->TicketLockSet(
                            TicketID => $TicketID,
                            Lock     => 'lock',
                            UserID   => $Self->{UserID},
                        );
                    }
                }

                # set responsible
                if (
                    $ConfigObject->Get('Ticket::Responsible')
                    && $Config->{Responsible}
                    && ( $GetParam{'ResponsibleID'} || $GetParam{'Responsible'} )
                    )
                {
                    $Result = $TicketObject->TicketResponsibleSet(
                        TicketID  => $TicketID,
                        UserID    => $Self->{UserID},
                        NewUser   => $GetParam{'Responsible'},
                        NewUserID => $GetParam{'ResponsibleID'},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }

                # set priority
                if (
                    $Config->{Priority}
                    && ( $GetParam{'PriorityID'} || $GetParam{'Priority'} )
                    )
                {
                    $Result = $TicketObject->TicketPrioritySet(
                        TicketID   => $TicketID,
                        UserID     => $Self->{UserID},
                        Priority   => $GetParam{'Priority'},
                        PriorityID => $GetParam{'PriorityID'},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }

                # set type
                if ( $ConfigObject->Get('Ticket::Type') && $Config->{TicketType} ) {
                    if ( $GetParam{'TypeID'} ) {
                        $Result = $TicketObject->TicketTypeSet(
                            TypeID   => $GetParam{'TypeID'},
                            TicketID => $TicketID,
                            UserID   => $Self->{UserID},
                        );

                        if ( !$Result ) {
                            push @NonUpdatedTickets, $Ticket{TicketNumber};
                        }
                    }
                }

                # send email
                my $EmailArticleID;
                if (
                    $GetParam{'EmailSubject'}
                    && $GetParam{'EmailBody'}
                    )
                {
                    my $MimeType = 'text/plain';
                    if ( $LayoutObject->{BrowserRichText} ) {
                        $MimeType = 'text/html';

                        # verify html document
                        $GetParam{'EmailBody'} = $LayoutObject->RichTextDocumentComplete(
                            String => $GetParam{'EmailBody'},
                        );
                    }

                    my @Recipients = $Self->_GetRecipientList( TicketIDs => [ $Ticket{TicketID} ] );
                    my $Customer   = $Recipients[0];

                    # get template generator object
                    my $CustomerUserObject      = $Kernel::OM->Get('Kernel::System::CustomerUser');
                    my $TemplateGeneratorObject = $Kernel::OM->ObjectParamAdd(
                        'Kernel::System::TemplateGenerator' => {
                            CustomerUserObject => $CustomerUserObject,
                        },
                    );

                    $TemplateGeneratorObject = $Kernel::OM->Get('Kernel::System::TemplateGenerator');

                    # generate sender name
                    my $From = $TemplateGeneratorObject->Sender(
                        QueueID => $Ticket{QueueID},
                        UserID  => $Self->{UserID},
                    );

                    # generate subject
                    my $TicketNumber = $TicketObject->TicketNumberLookup( TicketID => $TicketID );

                    my $EmailSubject = $TicketObject->TicketSubjectBuild(
                        TicketNumber => $TicketNumber,
                        Subject      => $GetParam{EmailSubject} || '',
                    );

                    my $EmailArticleBackendObject = $ArticleObject->BackendForChannel( ChannelName => 'Email' );

                    $EmailArticleID = $EmailArticleBackendObject->ArticleSend(
                        TicketID             => $TicketID,
                        SenderType           => 'agent',
                        IsVisibleForCustomer => 1,
                        From                 => $From,
                        To                   => $Customer,
                        Subject              => $EmailSubject,
                        Body                 => $GetParam{EmailBody},
                        MimeType             => $MimeType,
                        Charset              => $LayoutObject->{UserCharset},
                        UserID               => $Self->{UserID},
                        HistoryType          => 'SendAnswer',
                        HistoryComment       => '%%' . $Customer,
                    );
                }

                # add note
                my $ArticleID;
                if (
                    $GetParam{'Subject'}
                    && $GetParam{'Body'}
                    && !$MainTicketID
                    )
                {
                    my $MimeType = 'text/plain';
                    if ( $LayoutObject->{BrowserRichText} ) {
                        $MimeType = 'text/html';

                        # verify html document
                        $GetParam{'Body'} = $LayoutObject->RichTextDocumentComplete(
                            String => $GetParam{'Body'},
                        );
                    }
                    my $InternalArticleBackendObject = $ArticleObject->BackendForChannel( ChannelName => 'Internal' );

                    $ArticleID = $InternalArticleBackendObject->ArticleCreate(
                        TicketID             => $TicketID,
                        SenderType           => 'agent',
                        IsVisibleForCustomer => $GetParam{IsVisibleForCustomer},
                        From                 => "\"$Self->{UserFullname}\" <$Self->{UserEmail}>",
                        Subject              => $GetParam{'Subject'},
                        Body                 => $GetParam{'Body'},
                        MimeType             => $MimeType,
                        Charset              => $LayoutObject->{UserCharset},
                        UserID               => $Self->{UserID},
                        HistoryType          => 'AddNote',
                        HistoryComment       => '%%Bulk',
                    );
                }

                # set state
                if ( $Config->{State} && ( $GetParam{'StateID'} || $GetParam{'State'} ) ) {
                    $Result = $TicketObject->TicketStateSet(
                        TicketID => $TicketID,
                        StateID  => $GetParam{'StateID'},
                        State    => $GetParam{'State'},
                        UserID   => $Self->{UserID},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }

                    my %Ticket = $TicketObject->TicketGet(
                        TicketID      => $TicketID,
                        DynamicFields => 0,
                    );
                    my %StateData = $StateObject->StateGet(
                        ID => $Ticket{StateID},
                    );

                    # should i set the pending date?
                    if ( $Ticket{StateType} =~ /^pending/i ) {

                        # set pending time
                        $TicketObject->TicketPendingTimeSet(
                            %Time,
                            TicketID => $TicketID,
                            UserID   => $Self->{UserID},
                        );
                    }

                    # should I set an unlock?
                    if ( $Ticket{StateType} =~ /^close/i ) {
                        $TicketObject->TicketLockSet(
                            TicketID => $TicketID,
                            Lock     => 'unlock',
                            UserID   => $Self->{UserID},
                        );
                    }
                }

                # time units for note
                if ( $GetParam{TimeUnits} && $ArticleID && !$MainTicketID ) {
                    if ( $ConfigObject->Get('Ticket::Frontend::BulkAccountedTime') ) {
                        $TicketObject->TicketAccountTime(
                            TicketID  => $TicketID,
                            ArticleID => $ArticleID,
                            TimeUnit  => $GetParam{'TimeUnits'},
                            UserID    => $Self->{UserID},
                        );
                    }
                    elsif (
                        !$ConfigObject->Get('Ticket::Frontend::BulkAccountedTime')
                        && $Counter == 1
                        )
                    {
                        $TicketObject->TicketAccountTime(
                            TicketID  => $TicketID,
                            ArticleID => $ArticleID,
                            TimeUnit  => $GetParam{'TimeUnits'},
                            UserID    => $Self->{UserID},
                        );
                    }
                }

                # time units for email
                if ( $GetParam{EmailTimeUnits} && $EmailArticleID ) {
                    if ( $ConfigObject->Get('Ticket::Frontend::BulkAccountedTime') ) {
                        $TicketObject->TicketAccountTime(
                            TicketID  => $TicketID,
                            ArticleID => $EmailArticleID,
                            TimeUnit  => $GetParam{'EmailTimeUnits'},
                            UserID    => $Self->{UserID},
                        );
                    }
                    elsif (
                        !$ConfigObject->Get('Ticket::Frontend::BulkAccountedTime')
                        && $Counter == 1
                        )
                    {
                        $TicketObject->TicketAccountTime(
                            TicketID  => $TicketID,
                            ArticleID => $EmailArticleID,
                            TimeUnit  => $GetParam{'EmailTimeUnits'},
                            UserID    => $Self->{UserID},
                        );
                    }
                }

                # merge
                if ( $MainTicketID && $MainTicketID ne $TicketID ) {
                    $TicketObject->TicketMerge(
                        MainTicketID  => $MainTicketID,
                        MergeTicketID => $TicketID,
                        UserID        => $Self->{UserID},
                    );
                }

                # get link object
                my $LinkObject = $Kernel::OM->Get('Kernel::System::LinkObject');

                # link all tickets to a parent
                if ( $GetParam{'LinkTogetherParent'} ) {
                    my $MainTicketID = $TicketObject->TicketIDLookup(
                        TicketNumber => $GetParam{'LinkTogetherParent'},
                    );

                    TICKETIDPARTNER:
                    for my $TicketIDPartner (@TicketIDs) {

                        next TICKETIDPARTNER if $MainTicketID eq $TicketID;
                        $LinkObject->LinkAdd(
                            SourceObject => 'Ticket',
                            SourceKey    => $MainTicketID,
                            TargetObject => 'Ticket',
                            TargetKey    => $TicketID,
                            Type         => 'ParentChild',
                            State        => 'Valid',
                            UserID       => $Self->{UserID},
                        );
                    }
                }

                # link together
                if ( $GetParam{'LinkTogether'} ) {
                    TICKETIDPARTNER:
                    for my $TicketIDPartner (@TicketIDs) {

                        next TICKETIDPARTNER if $TicketID == $TicketIDPartner;

                        $LinkObject->LinkAdd(
                            SourceObject => 'Ticket',
                            SourceKey    => $TicketID,
                            TargetObject => 'Ticket',
                            TargetKey    => $TicketIDPartner,
                            Type         => 'Normal',
                            State        => 'Valid',
                            UserID       => $Self->{UserID},
                        );
                    }
                }

                # should I unlock tickets at user request?
                if ( $GetParam{'Unlock'} ) {
                    $Result = $TicketObject->TicketLockSet(
                        TicketID => $TicketID,
                        Lock     => 'unlock',
                        UserID   => $Self->{UserID},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }

                # call Store() in all ticket bulk modules
                if (@BulkModules) {

                    MODULEOBJECT:
                    for my $ModuleObject (@BulkModules) {
                        next MODULEOBJECT if !$ModuleObject->can('Store');

                        $ModuleObject->Store(
                            TicketID => $TicketID,
                            UserID   => $Self->{UserID},
                        );
                    }
                }

                # set ticket dynamic fields
                # cycle through the activated dynamic fields of this screen
                DYNAMICFIELD:
                for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
                    next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);
                    next DYNAMICFIELD if $DynamicFieldConfig->{ObjectType} ne 'Ticket';

                    my $DynamicFieldSet = $ParamObject->GetParam(
                        Param => 'DynamicField_' . $DynamicFieldConfig->{Name} . 'Used'
                    );
                    next DYNAMICFIELD if !$DynamicFieldSet && $Config->{DynamicFieldRequireActivation};

                    my $Success = $DynamicFieldBackendObject->ValueSet(
                        DynamicFieldConfig => $DynamicFieldConfig,
                        ObjectID           => $TicketID,
                        Value              => $DynamicFieldValues{ $DynamicFieldConfig->{Name} },
                        UserID             => $Self->{UserID},
                    );
                }

                # set new service
                if ( $ConfigObject->Get('Ticket::Service') && $Config->{Service} ) {
                    if ( $GetParam{ServiceID} ) {
                        $TicketObject->TicketServiceSet(
                            %GetParam,
                            %ACLCompatGetParam,
                            ServiceID => $GetParam{ServiceID},
                            TicketID  => $TicketID,
                            UserID    => $Self->{UserID},
                        );
                    }
                    if ( $GetParam{SLAID} ) {
                        $TicketObject->TicketSLASet(
                            SLAID    => $GetParam{SLAID},
                            TicketID => $TicketID,
                            UserID   => $Self->{UserID},
                        );
                    }
                }

                # watch or unwatch tickets
                if ( $GetParam{'Watch'} ) {
                    $Result = $TicketObject->TicketWatchSubscribe(
                        TicketID    => $TicketID,
                        WatchUserID => $Self->{UserID},
                        UserID      => $Self->{UserID},
                    );

                    if ( !$Result ) {
                        push @NonUpdatedTickets, $Ticket{TicketNumber};
                    }
                }

                if ( $GetParam{'MarkTicketsAsSeen'} || $GetParam{'MarkTicketsAsUnseen'} ) {
                    my $TicketActionFunction  = 'TicketFlagDelete';
                    my $ArticleActionFunction = 'ArticleFlagDelete';

                    if ( $GetParam{'MarkTicketsAsSeen'} ) {
                        $TicketActionFunction  = 'TicketFlagSet';
                        $ArticleActionFunction = 'ArticleFlagSet';
                    }

                    my @ArticleIDs = $ArticleObject->ArticleIndex(
                        TicketID => $TicketID,
                    );

                    ARTICLEID:
                    for my $ArticleID ( sort @ArticleIDs ) {

                        # article flag
                        my $Success = $ArticleObject->$ArticleActionFunction(
                            TicketID  => $TicketID,
                            ArticleID => $ArticleID,
                            Key       => 'Seen',
                            Value     => 1,                 # irrelevant in case of delete
                            UserID    => $Self->{UserID},
                        );
                    }

                    # ticket flag
                    $TicketObject->$TicketActionFunction(
                        TicketID => $TicketID,
                        Key      => 'Seen',
                        Value    => 1,                      # irrelevant in case of delete
                        UserID   => $Self->{UserID},
                    );
                }

                $ActionFlag = 1;
            }
            $Counter++;
        }

        # only create one Article and time for merging
        # add note
        if ($MainTicketID) {
            my $ArticleID;
            if (
                $GetParam{'Subject'}
                && $GetParam{'Body'}
                )
            {
                my $MimeType = 'text/plain';
                if ( $LayoutObject->{BrowserRichText} ) {
                    $MimeType = 'text/html';

                    # verify html document
                    $GetParam{'Body'} = $LayoutObject->RichTextDocumentComplete(
                        String => $GetParam{'Body'},
                    );
                }
                my $InternalArticleBackendObject = $ArticleObject->BackendForChannel( ChannelName => 'Internal' );

                $ArticleID = $InternalArticleBackendObject->ArticleCreate(
                    TicketID             => $MainTicketID,
                    SenderType           => 'agent',
                    IsVisibleForCustomer => $GetParam{IsVisibleForCustomer},
                    From                 => "\"$Self->{UserFullname}\" <$Self->{UserEmail}>",
                    Subject              => $GetParam{'Subject'},
                    Body                 => $GetParam{'Body'},
                    MimeType             => $MimeType,
                    Charset              => $LayoutObject->{UserCharset},
                    UserID               => $Self->{UserID},
                    HistoryType          => 'AddNote',
                    HistoryComment       => '%%Bulk',
                );
            }

            # time units for note
            if ( $GetParam{TimeUnits} && $ArticleID ) {
                if ( $ConfigObject->Get('Ticket::Frontend::BulkAccountedTime') ) {
                    $TicketObject->TicketAccountTime(
                        TicketID  => $MainTicketID,
                        ArticleID => $ArticleID,
                        TimeUnit  => $GetParam{'TimeUnits'},
                        UserID    => $Self->{UserID},
                    );
                }
                elsif (
                    !$ConfigObject->Get('Ticket::Frontend::BulkAccountedTime')
                    && $Counter == 1
                    )
                {
                    $TicketObject->TicketAccountTime(
                        TicketID  => $MainTicketID,
                        ArticleID => $ArticleID,
                        TimeUnit  => $GetParam{'TimeUnits'},
                        UserID    => $Self->{UserID},
                    );
                }
            }

        }

        # notify user about actions (errors)
        if (@TicketsWithError) {
            my $NotificationError = $LayoutObject->{LanguageObject}->Translate(
                "The following tickets were ignored because they are locked by another agent or you don't have write access to these tickets: %s.",
                join( ", ", @TicketsWithError ),
            );

            $Output .= $LayoutObject->Notify(
                Priority => 'Error',
                Data     => $NotificationError,
            );
        }

        # notify user about actions (notices)
        if (@TicketsWithLockNotice) {
            my $NotificationNotice = $LayoutObject->{LanguageObject}->Translate(
                "The following tickets were locked: %s.",
                join( ", ", @TicketsWithLockNotice ),
            );

            $Output .= $LayoutObject->Notify(
                Priority => 'Notice',
                Data     => $NotificationNotice,
            );
        }

        # redirect
        if ($ActionFlag) {

            if ( IsArrayRefWithData( \@NonUpdatedTickets ) ) {
                my $NonUpdatedTicketsString = join ', ', @NonUpdatedTickets;
                $Kernel::OM->Get('Kernel::System::Cache')->Set(
                    Type  => 'Ticket',
                    TTL   => 60,
                    Key   => 'NonUpdatedTicketsString-' . $Self->{UserID},
                    Value => $NonUpdatedTicketsString,
                );
            }

            my $DestURL = defined $MainTicketID
                ? "Action=AgentTicketZoom;TicketID=$MainTicketID"
                : ( $Self->{LastScreenOverview} || 'Action=AgentDashboard' );

            return $LayoutObject->PopupClose(
                URL => $DestURL,
            );
        }

        $Output .= $Self->_Mask(
            %Param,
            %GetParam,
            %Time,
            TicketIDs        => \@TicketIDSelected,
            LockedTickets    => $LockedTickets,
            Errors           => \%Error,
            BulkModules      => \@BulkModules,
            DynamicFieldHTML => \%DynamicFieldHTML,
        );
        $Output .= $LayoutObject->Footer(
            Type => 'Small',
        );
        return $Output;

    }

    return 1;
}

sub _GetRecipientList {

    my ( $Self, %Param ) = @_;

    my $ParamObject   = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject  = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $TicketObject  = $Kernel::OM->Get('Kernel::System::Ticket');
    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');

    my @Recipients;

    TICKETID:
    for my $TicketID ( @{ $Param{TicketIDs} } ) {
        my $UserHasTicketPermission = $TicketObject->TicketPermission(
            Type     => 'ro',
            TicketID => $TicketID,
            UserID   => $Self->{UserID},
        );

        next TICKETID if !$UserHasTicketPermission;

        my %Ticket = $TicketObject->TicketGet(
            TicketID      => $TicketID,
            DynamicFields => 0,
        );

        my $CustomerUserObject = $Kernel::OM->Get('Kernel::System::CustomerUser');

        # Get customer email address.
        my $Customer;
        if ( $Ticket{CustomerUserID} ) {
            my %Customer = $CustomerUserObject->CustomerUserDataGet(
                User => $Ticket{CustomerUserID}
            );
            if ( $Customer{UserEmail} ) {
                $Customer = $Customer{UserEmail};
            }
        }

        # Check if we have an address, otherwise deduce it from the article.
        if ( !$Customer ) {

            # Get last customer article.
            my @Articles = $ArticleObject->ArticleList(
                TicketID   => $TicketID,
                SenderType => 'customer',
                OnlyLast   => 1,
            );

            # If the ticket has no customer article, get the last agent article.
            if ( !@Articles ) {
                @Articles = $ArticleObject->ArticleList(
                    TicketID   => $TicketID,
                    SenderType => 'agent',
                    OnlyLast   => 1,
                );
            }

            # Finally, if everything failed, get latest article.
            if ( !@Articles ) {
                @Articles = $ArticleObject->ArticleList(
                    TicketID => $TicketID,
                    OnlyLast => 1,
                );
            }

            my %Article;
            for my $Article (@Articles) {
                %Article = $ArticleObject->BackendForArticle( %{$Article} )->ArticleGet(
                    %{$Article},
                    DynamicFields => 0,
                );
            }

            # Use ReplyTo if set, otherwise use From.
            $Customer = $Article{ReplyTo} ? $Article{ReplyTo} : $Article{From};

            # Check article sender type and replace From with To (in case sender is not customer).
            if ( $Article{SenderType} !~ /customer/ ) {
                $Customer = $Article{To};
            }
        }

        # Skip to next ticket if no customer recipient was found.
        next TICKETID if !$Customer;

        # Customer recipients are unique.
        push @Recipients, $Customer if !grep { $_ eq $Customer } @Recipients;
    }

    return @Recipients;
}

sub _Mask {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');

    # prepare errors!
    if ( $Param{Errors} ) {
        for my $KeyError ( sort keys %{ $Param{Errors} } ) {
            $Param{$KeyError} = $LayoutObject->Ascii2Html( Text => $Param{Errors}->{$KeyError} );
        }
    }

    $LayoutObject->Block(
        Name => 'BulkAction',
        Data => \%Param,
    );

    # remember ticket ids
    if ( $Param{TicketIDs} ) {
        for my $TicketID ( @{ $Param{TicketIDs} } ) {
            $LayoutObject->Block(
                Name => 'UsedTicketID',
                Data => {
                    TicketID => $TicketID,
                },
            );
        }
    }

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    my $Config = $ConfigObject->Get("Ticket::Frontend::$Self->{Action}");

    $Param{IsVisibleForCustomer} //= $Config->{IsVisibleForCustomerDefault} // 0;

    # build next states string
    if ( $Config->{State} ) {
        my %State;

        my %StateList = $Self->_GetStates(
            %Param,
            StateType => $Config->{StateType},
            Action    => $Self->{Action},
            UserID    => $Self->{UserID},
        );
        if ( !$Config->{StateDefault} ) {
            $StateList{''} = '-';
        }
        if ( !$Param{StateID} ) {
            if ( $Config->{StateDefault} ) {
                $State{SelectedValue} = $Config->{StateDefault};
            }
        }
        else {
            $State{SelectedID} = $Param{StateID};
        }

        $Param{NextStatesStrg} = $LayoutObject->BuildSelection(
            Data => \%StateList,
            Name => 'StateID',
            %State,
            Class => 'Modernize',
        );
        $LayoutObject->Block(
            Name => 'State',
            Data => \%Param,
        );

        my $StateObject = $Kernel::OM->Get('Kernel::System::State');

        STATE_ID:
        for my $StateID ( sort keys %StateList ) {
            next STATE_ID if !$StateID;
            my %StateData = $StateObject->StateGet( ID => $StateID );
            next STATE_ID if $StateData{TypeName} !~ /pending/i;
            $Param{DateString} = $LayoutObject->BuildDateSelection(
                %Param,
                Format               => 'DateInputFormatLong',
                DiffTime             => $ConfigObject->Get('Ticket::Frontend::PendingDiffTime') || 0,
                Class                => $Param{Errors}->{DateInvalid} || '',
                Validate             => 1,
                ValidateDateInFuture => 1,
            );
            $LayoutObject->Block(
                Name => 'StatePending',
                Data => \%Param,
            );
            last STATE_ID;
        }
    }

    # types
    if ( $ConfigObject->Get('Ticket::Type') && $Config->{TicketType} ) {
        my %TypeList = $Self->_GetTypes(
            %Param,
            Action => $Self->{Action},
            UserID => $Self->{UserID},
        );
        $Param{TypeStrg} = $LayoutObject->BuildSelection(
            Data         => \%TypeList,
            PossibleNone => 1,
            Name         => 'TypeID',
            SelectedID   => $Param{TypeID},
            Sort         => 'AlphanumericValue',
            Translation  => 0,
            Class        => 'Modernize',
        );
        $LayoutObject->Block(
            Name => 'Type',
            Data => {%Param},
        );
    }

    # owner list
    if ( $Config->{Owner} ) {
        my %OwnerList = $Self->_GetOwners(
            %Param,
            Action => $Self->{Action},
            UserID => $Self->{UserID},
        );
        $Param{OwnerStrg} = $LayoutObject->BuildSelection(
            Data         => \%OwnerList,
            Name         => 'OwnerID',
            Translation  => 0,
            SelectedID   => $Param{OwnerID},
            PossibleNone => 1,
            Class        => 'Modernize',
        );
        $LayoutObject->Block(
            Name => 'Owner',
            Data => \%Param,
        );
    }

    # responsible list
    if ( $ConfigObject->Get('Ticket::Responsible') && $Config->{Responsible} ) {
        my %ResponsibleList = $Self->_GetResponsibles(
            %Param,
            Action => $Self->{Action},
            UserID => $Self->{UserID},
        );
        $Param{ResponsibleStrg} = $LayoutObject->BuildSelection(
            Data         => \%ResponsibleList,
            PossibleNone => 1,
            Name         => 'ResponsibleID',
            Translation  => 0,
            SelectedID   => $Param{ResponsibleID},
            Class        => 'Modernize',
        );
        $LayoutObject->Block(
            Name => 'Responsible',
            Data => \%Param,
        );
    }

    # build move queue string
    my %QueueList = $Self->_GetQueues(
        %Param,
        Type   => 'move_into',
        UserID => $Self->{UserID},
        Action => $Self->{Action},
    );
    $Param{MoveQueuesStrg} = $LayoutObject->AgentQueueListOption(
        Data           => { %QueueList, '' => '-' },
        Multiple       => 0,
        Size           => 0,
        Name           => 'QueueID',
        OnChangeSubmit => 0,
        Class          => 'Modernize',
    );

    # get priority
    if ( $Config->{Priority} ) {
        my %Priority;
        my %PriorityList = $Self->_GetPriorities(
            %Param,
            UserID => $Self->{UserID},
            Action => $Self->{Action},
        );
        if ( !$Config->{PriorityDefault} ) {
            $PriorityList{''} = '-';
        }
        if ( !$Param{PriorityID} ) {
            if ( $Config->{PriorityDefault} ) {
                $Priority{SelectedValue} = $Config->{PriorityDefault};
            }
        }
        else {
            $Priority{SelectedID} = $Param{PriorityID};
        }
        $Param{PriorityStrg} = $LayoutObject->BuildSelection(
            Data => \%PriorityList,
            Name => 'PriorityID',
            %Priority,
            Class => 'Modernize',

        );
        $LayoutObject->Block(
            Name => 'Priority',
            Data => \%Param,
        );
    }

    # show time accounting box
    if ( $ConfigObject->Get('Ticket::Frontend::AccountTime') ) {
        my $IsTimeUnitsRequired = $ConfigObject->Get('Ticket::Frontend::NeedAccountedTime');
        $LayoutObject->AddJSData(
            Key   => 'TimeUnitsRequired',
            Value => $IsTimeUnitsRequired || '',
        );

        my $TimeUnitsInputType = $ConfigObject->Get('Ticket::Frontend::AccountTimeType') // 'Text';
        $LayoutObject->AddJSData(
            Key   => 'TimeUnitsInputType',
            Value => $TimeUnitsInputType,
        );

        $Param{TimeUnitsBlock} = $LayoutObject->TimeUnits(
            ID        => 'TimeUnits',
            Name      => 'TimeUnits',
            TimeUnits => $Param{TimeUnits},
        );

        $LayoutObject->Block(
            Name => 'TimeUnits',
            Data => \%Param,
        );

        $Param{EmailTimeUnitsBlock} = $LayoutObject->TimeUnits(
            ID        => 'EmailTimeUnits',
            Name      => 'EmailTimeUnits',
            TimeUnits => $Param{EmailTimeUnits},
        );
        $LayoutObject->Block(
            Name => 'EmailTimeUnits',
            Data => \%Param,
        );
    }

    $Param{LinkTogetherYesNoOption} = $LayoutObject->BuildSelection(
        Data       => $ConfigObject->Get('YesNoOptions'),
        Name       => 'LinkTogether',
        SelectedID => $Param{LinkTogether} // 0,
        Class      => 'Modernize',
    );

    $Param{UnlockYesNoOption} = $LayoutObject->BuildSelection(
        Data       => $ConfigObject->Get('YesNoOptions'),
        Name       => 'Unlock',
        SelectedID => $Param{Unlock} // 1,
        Class      => 'Modernize',
    );

    my $BulkWatch = 0;

    my @WatcherGroups = @{ $ConfigObject->Get('Ticket::WatcherGroup') // [] };

    # General permission via config switch to use ticket watcher.
    if ( $ConfigObject->Get('Ticket::Watcher') ) {
        $BulkWatch = 1;
    }

    # Ticket watcher via group.
    elsif (@WatcherGroups) {
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');
        GROUP:
        for my $Group (@WatcherGroups) {
            my $HasPermission = $GroupObject->PermissionCheck(
                UserID    => $Self->{UserID},
                GroupName => $Group,
                Type      => 'rw',
            );
            next GROUP if !$HasPermission;

            $BulkWatch = 1;
            last GROUP;
        }
    }

    if ($BulkWatch) {
        $Param{WatchYesNoOption} = $LayoutObject->BuildSelection(
            Data       => $ConfigObject->Get('YesNoOptions'),
            Name       => 'Watch',
            SelectedID => $Param{Watch} // 0,
            Class      => 'Modernize',
        );

        $LayoutObject->Block(
            Name => 'Watch',
            Data => \%Param,
        );
    }

    $Param{MarkTicketsAsSeenOption} = $LayoutObject->BuildSelection(
        Data       => $ConfigObject->Get('YesNoOptions'),
        Name       => 'MarkTicketsAsSeen',
        SelectedID => $Param{MarkTicketsAsSeen} // 0,
        Class      => 'Modernize',
    );

    $Param{MarkTicketsAsUnseenOption} = $LayoutObject->BuildSelection(
        Data       => $ConfigObject->Get('YesNoOptions'),
        Name       => 'MarkTicketsAsUnseen',
        SelectedID => $Param{MarkTicketsAsUnseen} // 0,
        Class      => 'Modernize',
    );

    # add rich text editor for note & email
    if ( $LayoutObject->{BrowserRichText} ) {

        # use height/width defined for this screen
        $Param{RichTextHeight} = $Config->{RichTextHeight} || 0;
        $Param{RichTextWidth}  = $Config->{RichTextWidth}  || 0;

        # set up rich text editor
        $LayoutObject->SetRichTextParameters(
            Data => \%Param,
        );
    }

    # reload parent window
    if ( $Param{TicketsWereLocked} ) {

        my $URL = $Self->{LastScreenOverview};

        # add session if no cookies are enabled
        if ( $Self->{SessionID} && !$Self->{SessionIDCookie} ) {
            $URL .= ';' . $Self->{SessionName} . '=' . $Self->{SessionID};
        }

        $LayoutObject->AddJSData(
            Key   => 'TicketBulkURL',
            Value => $LayoutObject->{Baselink} . $URL,
        );

        # show undo&close link
        $LayoutObject->Block(
            Name => 'UndoClosePopup',
            Data => {%Param},
        );
    }
    else {

        # show cancel&close link
        $LayoutObject->Block(
            Name => 'CancelClosePopup',
            Data => {%Param},
        );
    }

    my @DynamicFieldNames;
    my %DynamicFieldConfigs;

    # cycle trough the activated dynamic fields of this screen
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{ $Self->{DynamicField} } ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # skip fields for which HTML could not be retrieved
        if ( !IsHashRefWithData( $Param{DynamicFieldHTML}->{ $DynamicFieldConfig->{Name} } ) ) {
            next DYNAMICFIELD;
        }

        # get HTML strings from ParamObject
        my $IsChecked         = 'false';
        my $RequireActivation = 'false';
        my $DynamicFieldHTML  = $Param{DynamicFieldHTML}->{ $DynamicFieldConfig->{Name} };

        if ( $Config->{DynamicFieldRequireActivation} ) {
            $RequireActivation = 'true';
            my $DynamicFieldSet = $ParamObject->GetParam(
                Param => 'DynamicField_' . $DynamicFieldConfig->{Name} . 'Used'
            );

            # set DynamicField_NAMEUsed checkbox to true if it is set before or if mandatory (2)
            if ( $DynamicFieldSet || $Config->{DynamicField}->{ $DynamicFieldConfig->{Name} } == 2 ) {
                $IsChecked = 'true';
            }
        }

        $LayoutObject->Block(
            Name => 'DynamicField',
            Data => {
                Name  => $DynamicFieldConfig->{Name},
                Label => $DynamicFieldHTML->{Label},
                Field => $DynamicFieldHTML->{Field},
            },
        );

        $DynamicFieldConfigs{ 'DynamicField_' . $DynamicFieldConfig->{Name} } = {
            Name              => $DynamicFieldConfig->{Name},
            RequireActivation => $RequireActivation || 'false',
            IsChecked         => $IsChecked || 'false',
        };

        push @DynamicFieldNames, 'DynamicField_' . $DynamicFieldConfig->{Name};
    }

    # send data to JS
    $LayoutObject->AddJSData(
        Key   => 'DynamicFieldNames',
        Value => \@DynamicFieldNames,
    );
    $LayoutObject->AddJSData(
        Key   => 'DynamicFieldConfigs',
        Value => \%DynamicFieldConfigs,
    );

    my $TreeView = 0;
    if ( $ConfigObject->Get('Ticket::Frontend::ListType') eq 'tree' ) {
        $TreeView = 1;
    }

    # services
    if ( $ConfigObject->Get('Ticket::Service') && $Config->{Service} ) {
        my $Services = $Self->_GetServices(
            %Param,
            TicketIDs => $Param{TicketIDs},
            QueueID   => $Param{QueueID},
            UserID    => $Self->{UserID},
        );

        # reset previous ServiceID to reset SLA-List if no service is selected
        if ( !$Param{ServiceID} || !$Services->{ $Param{ServiceID} } ) {
            $Param{ServiceID} = '';
        }

        my $CSSClass = "Modernize " . ( $Config->{ServiceMandatory} ? 'Validate_Required ' : '' );

        $Param{ServiceStrg} = $LayoutObject->BuildSelection(
            Data         => $Services,
            Name         => 'ServiceID',
            SelectedID   => $Param{ServiceID},
            Class        => $CSSClass,
            PossibleNone => 1,
            TreeView     => $TreeView,
            Sort         => 'TreeView',
            Translation  => 0,
            Max          => 200,
        );

        $LayoutObject->Block(
            Name => 'Service',
            Data => {
                ServiceMandatory => $Config->{ServiceMandatory} || 0,
                %Param,
            },
        );
    }

    my @BulkModules = @{ $Param{BulkModules} };

    # call Display() in all ticket bulk modules
    if (@BulkModules) {

        my @BulkModuleContent;

        MODULEOBJECT:
        for my $ModuleObject (@BulkModules) {
            next MODULEOBJECT if !$ModuleObject->can('Display');

            my $ModuleContent = $ModuleObject->Display(
                Errors => $Param{Errors},
                UserID => $Self->{UserID},
            );

            push @BulkModuleContent, $ModuleContent;
        }

        $Param{BulkModuleContent} = \@BulkModuleContent;
    }

    # get output back
    return $LayoutObject->Output(
        TemplateFile => 'AgentTicketBulk',
        Data         => \%Param,
    );
}

sub _GetStates {
    my ( $Self, %Param ) = @_;

    # TicketStateList() can not be used here as it might not be a queue selected
    my %StateList = $Kernel::OM->Get('Kernel::System::State')->StateGetStatesByType(
        StateType => $Param{StateType},
        Result    => 'HASH',
        Action    => $Self->{Action},
        UserID    => $Self->{UserID},
    );

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Execute ACLs.
    my $ACL = $TicketObject->TicketAcl(
        %Param,
        ReturnType    => 'Ticket',
        ReturnSubType => 'State',
        Data          => \%StateList,
    );

    return $TicketObject->TicketAclData() if $ACL;
    return %StateList;
}

sub _GetTypes {
    my ( $Self, %Param ) = @_;

    my %TypeList = $Kernel::OM->Get('Kernel::System::Ticket')->TicketTypeList(
        %Param,
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );

    return %TypeList;
}

sub _GetOwners {
    my ( $Self, %Param ) = @_;

    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # Get all users.
    my %AllGroupsMembers = $UserObject->UserList(
        Type  => 'Short',
        Valid => 1
    );

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Put only possible 'owner' and 'rw' agents to owner list.
    my %OwnerList;
    if ( !$Kernel::OM->Get('Kernel::Config')->Get('Ticket::ChangeOwnerToEveryone') ) {
        my %AllGroupsMembersNew;
        my @QueueIDs;

        if ( $Param{QueueID} ) {
            push @QueueIDs, $Param{QueueID};
        }
        else {
            my @TicketIDs = grep {$_} $Kernel::OM->Get('Kernel::System::Web::Request')->GetArray( Param => 'TicketID' );
            for my $TicketID (@TicketIDs) {
                my %Ticket = $TicketObject->TicketGet(
                    TicketID      => $TicketID,
                    DynamicFields => 0,
                );
                push @QueueIDs, $Ticket{QueueID};
            }
        }

        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        for my $QueueID (@QueueIDs) {
            my $GroupID     = $QueueObject->GetQueueGroupID( QueueID => $QueueID );
            my %GroupMember = $GroupObject->PermissionGroupGet(
                GroupID => $GroupID,
                Type    => 'owner',
            );
            USER_ID:
            for my $UserID ( sort keys %GroupMember ) {
                next USER_ID if !$AllGroupsMembers{$UserID};
                $AllGroupsMembersNew{$UserID} = $AllGroupsMembers{$UserID};
            }
            %OwnerList = %AllGroupsMembersNew;
        }
    }
    else {
        %OwnerList = %AllGroupsMembers;
    }

    # Execute ACLs.
    my $ACL = $TicketObject->TicketAcl(
        %Param,
        Action        => $Self->{Action},
        ReturnType    => 'Ticket',
        ReturnSubType => 'Owner',
        Data          => \%OwnerList,
        UserID        => $Self->{UserID},
    );

    if ($ACL) {
        %OwnerList = $TicketObject->TicketAclData();
    }

    my %AllGroupsMembersFullnames = $UserObject->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    @OwnerList{ keys %OwnerList } = @AllGroupsMembersFullnames{ keys %OwnerList };

    return %OwnerList;
}

sub _GetResponsibles {
    my ( $Self, %Param ) = @_;

    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # Get all users.
    my %AllGroupsMembers = $UserObject->UserList(
        Type  => 'Short',
        Valid => 1
    );

    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');

    # Put only possible 'responsible' and 'rw' agents to responsible list.
    my %ResponsibleList;
    if ( !$Kernel::OM->Get('Kernel::Config')->Get('Ticket::ChangeOwnerToEveryone') ) {
        my %AllGroupsMembersNew;
        my @QueueIDs;

        if ( $Param{QueueID} ) {
            push @QueueIDs, $Param{QueueID};
        }
        else {
            my @TicketIDs = grep {$_} $Kernel::OM->Get('Kernel::System::Web::Request')->GetArray( Param => 'TicketID' );
            for my $TicketID (@TicketIDs) {
                my %Ticket = $TicketObject->TicketGet(
                    TicketID      => $TicketID,
                    DynamicFields => 0,
                );
                push @QueueIDs, $Ticket{QueueID};
            }
        }

        my $QueueObject = $Kernel::OM->Get('Kernel::System::Queue');
        my $GroupObject = $Kernel::OM->Get('Kernel::System::Group');

        for my $QueueID (@QueueIDs) {
            my $GroupID     = $QueueObject->GetQueueGroupID( QueueID => $QueueID );
            my %GroupMember = $GroupObject->PermissionGroupGet(
                GroupID => $GroupID,
                Type    => 'responsible',
            );
            USER_ID:
            for my $UserID ( sort keys %GroupMember ) {
                next USER_ID if !$AllGroupsMembers{$UserID};
                $AllGroupsMembersNew{$UserID} = $AllGroupsMembers{$UserID};
            }
            %ResponsibleList = %AllGroupsMembersNew;
        }
    }
    else {
        %ResponsibleList = %AllGroupsMembers;
    }

    # Execute ACLs.
    my $ACL = $TicketObject->TicketAcl(
        %Param,
        Action        => $Self->{Action},
        ReturnType    => 'Ticket',
        ReturnSubType => 'Responsible',
        Data          => \%ResponsibleList,
        UserID        => $Self->{UserID},
    );

    if ($ACL) {
        %ResponsibleList = $TicketObject->TicketAclData();
    }

    my %AllGroupsMembersFullnames = $UserObject->UserList(
        Type  => 'Long',
        Valid => 1,
    );

    @ResponsibleList{ keys %ResponsibleList } = @AllGroupsMembersFullnames{ keys %ResponsibleList };

    return %ResponsibleList;
}

sub _GetQueues {
    my ( $Self, %Param ) = @_;

    my %QueueList = $Kernel::OM->Get('Kernel::System::Ticket')->MoveList(
        %Param,
        UserID => $Self->{UserID},
        Action => $Self->{Action},
        Type   => 'move_into',
    );

    return %QueueList;
}

sub _GetPriorities {
    my ( $Self, %Param ) = @_;

    my %PriorityList = $Kernel::OM->Get('Kernel::System::Ticket')->TicketPriorityList(
        %Param,
        Action => $Self->{Action},
        UserID => $Self->{UserID},
    );
    return %PriorityList;
}

sub _GetServices {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TicketObject = $Kernel::OM->Get('Kernel::System::Ticket');
    my $QueueObject  = $Kernel::OM->Get('Kernel::System::Queue');

    # Assemble customer user IDs of all selected tickets.
    my $DefaultServiceUnknownCustomer = $ConfigObject->Get('Ticket::Service::Default::UnknownCustomer');

    my $TicketIDs = $Param{TicketIDs};
    return {} if !IsArrayRefWithData($TicketIDs);

    my $SelectedQueueID = $Param{QueueID};

    # Assemble common services of customer users.
    my %Services;

    TICKETID:
    for my $TicketID ( @{$TicketIDs} ) {
        my %Ticket = $TicketObject->TicketGet(
            TicketID => $TicketID,
            UserID   => $Self->{UserID},
        );

        # If one of the tickets cannot be found, don't show any selectable services.
        return {} if !%Ticket;

        my $CustomerUserID = $Ticket{CustomerUserID} || '<DEFAULT>';

        my %CustomerUserServices = $TicketObject->TicketServiceList(
            %Param,

            # If a queue was selected in the bulk action dialog, use it instead
            # of the queue of the ticket. This ensures that ACLs work.
            QueueID        => $SelectedQueueID || $Ticket{QueueID},
            TicketID       => $Ticket{TicketID},
            CustomerUserID => $CustomerUserID,
            UserID         => $Self->{UserID},
        );

        # If there are no services available, there cannot be any other common services
        # among the customer users.
        return {} if !%CustomerUserServices;

        # First ticket, take all available services.
        if ( !%Services ) {
            %Services = %CustomerUserServices;
            next TICKETID;
        }

        # Set all services to undef that are not available to the current customer user.
        SERVICEID:
        for my $ServiceID ( sort keys %Services ) {
            next SERVICEID if defined $Services{$ServiceID} && defined $CustomerUserServices{$ServiceID};

            $Services{$ServiceID} = undef;
        }

        return {} if !%Services;
    }

    # Delete all services that are not defined
    %Services = map { $_ => $Services{$_} } grep { defined $Services{$_} } keys %Services;

    return \%Services;
}

1;
