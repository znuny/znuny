// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --
// nofilter(TidyAll::Plugin::Znuny::JavaScript::ESLint)
'use strict';

var Znuny  = Znuny || {};
Znuny.Form = Znuny.Form || {};

/**
 * @namespace
 * @exports TargetNS as Znuny.Form.Input
 */
Znuny.Form.Input = (function (TargetNS) {

    var AttributFieldIDMapping = {
        AgentTicketActionCommon: {
            OwnerID:       'NewOwnerID',
            PriorityID:    'NewPriorityID',
            QueueID:       'NewQueueID',
            ResponsibleID: 'NewResponsibleID',
            Body:          'RichText',
            StateID:       'NewStateID',
        },

        AgentTicketBounce: {
            Body: 'RichText',
        },

        AgentTicketBulk: {
            RichText: 'Body',
            StateID:  'EmailStateID',
        },

        AgentTicketCompose: {
            Body:           'RichText',
            Customer:       'ToCustomer',
            CustomerUserID: 'ToCustomer'
        },

        AgentTicketCustomer: {
            Customer:       'CustomerAutoComplete',
            CustomerUserID: 'CustomerAutoComplete',
        },

        AgentTicketEmail: {
            OwnerID:        'NewUserID',
            QueueID:        'Dest',
            ResponsibleID:  'NewResponsibleID',
            Body:           'RichText',
            StateID:        'NextStateID',
            Customer:       'ToCustomer',
            CustomerUserID: 'ToCustomer',
        },

        AgentTicketEmailOutbound: {
            Body:           'RichText',
            StateID:        'ComposeStateID',
            Customer:       'ToCustomer',
            CustomerUserID: 'ToCustomer'
        },

        AgentTicketForward: {
            Body:           'RichText',
            StateID:        'ComposeStateID',
            Customer:       'ToCustomer',
            CustomerUserID: 'ToCustomer'
        },

        AgentTicketMerge: {
            Body: 'RichText',
        },

        AgentTicketMove: {
            QueueID:    'DestQueueID',
            PriorityID: 'NewPriorityID',
            StateID:    'NewStateID',
            Body:       'RichText',
        },

        AgentTicketOverviewMedium: {
            QueueID: 'DestQueueID'
        },

        AgentTicketOverviewPreview: {
            QueueID: 'DestQueueID'
        },

        AgentTicketOverviewSmall: {
            QueueID: 'DestQueueID'
        },

        AgentTicketPhone: {
            CustomerUserID: 'FromCustomer',
            Customer:       'FromCustomer',
            OwnerID:        'NewUserID',
            QueueID:        'Dest',
            ResponsibleID:  'NewResponsibleID',
            Body:           'RichText',
            StateID:        'NextStateID',
        },

        AgentTicketPhoneCommon: {
            Body:    'RichText',
            StateID: 'NextStateID',
        },

        AgentTicketZoom: {
            QueueID: 'DestQueueID'
        },

        CustomerTicketMessage: {
            QueueID: 'Dest',
            Body:    'RichText',
        },

        CustomerTicketZoom: {
            Body: 'RichText',
        },

        AgentTicketProcess: {
            Body:           'RichText',
            Customer:       'CustomerAutoComplete',
            CustomerUserID: 'CustomerAutoComplete',
        },

        AgentAppointmentCalendarOverview: {
            QueueID:            'QueueID',
            TypeID:             'TypeID',
            TicketCreateOffset: 'TicketCreateOffset',
        },

        CustomerTicketProcess: {
            Body:           'RichText',
            Customer:       'CustomerAutoComplete',
            CustomerUserID: 'CustomerAutoComplete',
        }
    };

    var ActionModuleMapping = {
        AgentTicketClose:         'AgentTicketActionCommon',
        AgentTicketFreeText:      'AgentTicketActionCommon',
        AgentTicketNote:          'AgentTicketActionCommon',
        AgentTicketOwner:         'AgentTicketActionCommon',
        AgentTicketPending:       'AgentTicketActionCommon',
        AgentTicketPriority:      'AgentTicketActionCommon',
        AgentTicketResponsible:   'AgentTicketActionCommon',
        AgentTicketPhoneInbound:  'AgentTicketPhoneCommon',
        AgentTicketPhoneOutbound: 'AgentTicketPhoneCommon',

        // Znuny4OTRS-SecondTicketCreateScreen
        AgentTicketEmailSecond: 'AgentTicketEmail',
        AgentTicketPhoneSecond: 'AgentTicketPhone',

        // Znuny4OTRS-AdditionalCommon
        AgentTicketAdditionalCommon1: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon2: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon3: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon4: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon5: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon6: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon7: 'AgentTicketActionCommon',
        AgentTicketAdditionalCommon8: 'AgentTicketActionCommon',
    }

    TargetNS.FieldID = function (Attribute) {
        var Module;

        if (!Attribute) return false;

        Module = TargetNS.Module();

        if (Attribute.indexOf('DynamicField_') === 0) {

            // check if we have a Date or DateTime DynamicField
            var DynamicFieldDateCheckboxID = Attribute + 'Used';
            if (
                $('#' + DynamicFieldDateCheckboxID)
                && $('#' + DynamicFieldDateCheckboxID).length == 1
                && $('#'+ Attribute + 'Year').length == 1
            ) {
                return DynamicFieldDateCheckboxID;
            }

            return Attribute;
        }

        // Use the common field ID mapping of AgentTicketActionCommon for unknown modules
        if (!AttributFieldIDMapping[Module] && Core.Config.Get('AutoAttributFieldIDMapping')) {
            AttributFieldIDMapping[Module] = AttributFieldIDMapping['AgentTicketActionCommon'];
        }

        if (
            !AttributFieldIDMapping[ Module ]
            || !AttributFieldIDMapping[ Module ][ Attribute ]
        ) {
            if ($('#'+ Attribute).length > 0) {
                return Attribute;
            }
            else {
                return false;
            }
        }

        return AttributFieldIDMapping[Module][Attribute];
    }

    /*

    Adds a field mapping to an Action.

        var Result = Znuny.Form.Input.FieldIDMapping('AdminQueue',
            {
                EscalationStep1Color: 'EscalationStep1Color' # FirstParam = AccessKey
                                                             # SecondParam = ID of the HTML element on page
            }
        );

    Returns:

        Result = {
            EscalationStep1Color: 'EscalationStep1Color'
        };

    */
    TargetNS.FieldIDMapping = function (Action, AttributeFieldIDs) {

        var Module = TargetNS.Module(Action);

        if (typeof AttributeFieldIDs === 'object') {
            AttributFieldIDMapping[Module] = AttributeFieldIDs;
        }

        return AttributFieldIDMapping[Module];
    }

    TargetNS.Module = function (Action) {

        Action = Action || Core.Config.Get('Action');

        if (ActionModuleMapping[Action]) {
            return ActionModuleMapping[Action];
        }

        return Action;
    }

    /*

    Returns the value(s) of input field.

        var Result = Znuny.Form.Input.Get('Queue',
            {
                KeyOrValue: 'Value',
            }
        );

    Returns:

        var Result = 'Postmaster';

    */
    TargetNS.Get = function (Attribute, Options) {

        var FieldID;
        var KeyOrValue;
        var LookupClass;
        var PossibleValues; // Affects currently only select fields (no dynamic field support)
        var Prefix;
        var Result;
        var SelectedAffix;
        var Type;
        var Value;
        var $Element;

        Options = Options || {};

        if (typeof Options !== 'object') return;

        KeyOrValue     = Options.KeyOrValue || 'Key';
        PossibleValues = Options.PossibleValues; // Affects currently only select fields (no dynamic field support)
        FieldID        = TargetNS.FieldID(Attribute);

        if (!FieldID) return;

        Type = TargetNS.Type(FieldID);
        if (Options.Type){
            Type = Options.Type;
        }

        if (FieldID === 'RichText' || Type === 'RichText') {
            if (
                typeof CKEDITOR !== 'undefined'
                && CKEDITOR.instances[FieldID]
            ) {
                return CKEDITOR.instances[FieldID].getData();
            }
            else {
                return $('#'+ FieldID).val();
            }
        }
        else if (
            Type == 'text'
            || Type == 'hidden'
            || Type == 'textarea'
        ) {
            if (
                Type == 'text'
                && $('#'+ FieldID).hasClass('CustomerAutoComplete')
            ) {
                Prefix = FieldID;
                Prefix = Prefix.replace(/^ToCustomer$/, 'Customer');
                Prefix = Prefix.replace(/^FromCustomer$/, 'Customer');

                if (KeyOrValue == 'Key') {
                    LookupClass = 'CustomerKey';
                }
                else {
                    LookupClass = 'CustomerTicketText';
                }

                Result = [];
                $('.'+LookupClass).each(function(Index, Element) {

                    if ($(Element).attr('id').indexOf(Prefix) != 0) return true;

                    Value = $.trim($(Element).val());

                    if (Value.length === 0) return true;

                    // only get selected customers if option is set
                    if (Options.Selected && !$(Element).siblings('.RadioRound').prop('checked')) return true;

                    Result.push(Value);
                });

                return Result;
            }
            // AgentTicketCustomer
            else if (
                Type == 'text'
                && FieldID === 'CustomerAutoComplete'
            ) {
                if (KeyOrValue == 'Key') {
                    return $('#SelectedCustomerUser').val();
                }
                else {
                    return $('#CustomerAutoComplete').val();
                }
            }
            // DynamicField CustomerUserID
            else if (
                Type == 'hidden'
                && FieldID.indexOf('DynamicField_') == 0
                && $('#'+ FieldID +'Autocomplete').length > 0
            ) {
                if (KeyOrValue == 'Key') {
                    return $('#'+ FieldID).val();
                }
                else {
                    return $('#'+ FieldID +'Autocomplete').val();
                }
            }
            // regular fields
            else {
                return $('#'+ FieldID).val();
            }
        }
        else if (Type == 'checkbox') {

            // it is not possible to set arrays via ids like $('#StateList[]')
            // because ids always relating to one element
            if ($('input[name=\'' + FieldID + '\']').length > 1) {

                // check checked status
                var ReturnValues = [];
                $('input[name=\'' + FieldID + '\']').each(function(){
                    if (!$(this).prop('checked') && !PossibleValues) return true;

                    ReturnValues.push($(this).val());
                });

                return ReturnValues;
            }

            return $('#'+ FieldID).prop('checked');
        }
        else if (Type == 'select') {

            if ($('#'+ FieldID).prop('multiple') || PossibleValues) {

                Result = [];
                SelectedAffix = '';
                if (!Options.PossibleValues) {
                    SelectedAffix = ':selected';
                }

                $('#' + FieldID + ' option' + SelectedAffix).each(function(Index, Element) {

                    var Text = RebuildLevelText($(Element));

                    if (KeyOrValue == 'Key') {
                        Value = QueueIDExtract($(Element).val(), Text);
                        Result.push(Value);
                    }
                    else {
                        Result.push($.trim(Text));
                    }
                });

                return Result;
            }
            else {
                $Element = $('#'+ FieldID +' option:selected');

                if (!$Element.length) return;

                var Text = RebuildLevelText($Element);

                if (KeyOrValue == 'Key') {
                    return QueueIDExtract($Element.val(), Text);
                }
                else {
                    return $.trim(Text);
                }
            }
        }
        // DynamicField Date or DateTime
        // Znuny.Form.Input.Get('DynamicField_DateName');
        // Znuny.Form.Input.Get('Year',{Type: 'PendingDate'});
        else if (
            Type == 'DynamicField_Date'
            || Type == 'DynamicField_DateTime'
            || Type == 'PendingDate'
        ) {
            // ATTENTION - SPECIAL CASE: For DynamicFields Date or DateTime the Attribute is used as FieldID
            // to handle input actions since FieldID maps to the Checkbox element

            var DateStructure = {};
            if (Type == 'PendingDate'){
                Attribute = '';
            }
            $.each(['Year', 'Month', 'Day', 'Hour', 'Minute'], function (Index, Suffix) {

                if (
                    $('#'+ Attribute + Suffix)
                    && $('#'+ Attribute + Suffix).length == 1
                ) {
                    DateStructure[Suffix] = parseInt($('#'+ Attribute + Suffix).val(), 10);
                }
                // exit loop
                else {
                    return false;
                }
            });

            // add checkbox state
            DateStructure.Used = $('#'+ FieldID).prop('checked');
            // Znuny.Form.Input.Get('DynamicField_Datum',{TimeStamp: 1});
            // return 2020-11-25 14:22:00
            if (Options.TimeStamp) {
                $.each(['Year', 'Month', 'Day', 'Hour', 'Minute'], function (Index, Suffix) {
                    DateStructure[Suffix] = DateStructure[ Suffix ] || '00';

                    if (DateStructure[Suffix].toString().length < 2) {
                        DateStructure[Suffix] = '0' + DateStructure[ Suffix ];
                    }
                });

                // 2020-11-25 14:22:00
                DateStructure = DateStructure['Year'] + '-' + DateStructure['Month'] + '-' + DateStructure['Day'] + ' ' + DateStructure['Hour'] + ':' + DateStructure['Minute']  + ':00';
            }

            // new Date(DateStructure.Year, DateStructure.Month, DateStructure.Day, DateStructure.Hour, DateStructure.Minute, DateStructure.Second);
            return DateStructure;
        }

        // TODO: Attachments?

        return;
    }

    /*

    Returns the type of input field.

        var Type = Znuny.Form.Input.Type('Queue');

    Returns:

        var Type = 'RichText'; # RichText, DynamicField_DateTime, input, select, checkbox

    */

    TargetNS.Type = function (FieldID) {

        if ($('#'+ FieldID).length == 0) return;

        if ($('#'+ FieldID).hasClass('RichText')) return 'RichText';

        if ($('#'+ FieldID)[0].tagName != 'INPUT') {
            return $('#'+ FieldID)[0].tagName.toLowerCase();
        }
        var Type = $('#'+ FieldID)[0].type.toLowerCase();

        // special DynamicField Date and DateTime handling
        if (Type != 'checkbox') return Type;

        if (FieldID.indexOf('DynamicField_') != 0) return Type;

        var Attribute = FieldID.replace(/Used$/, '');
        if (FieldID == Attribute) return Type;

        if ($('#'+ Attribute + 'Year').length == 0) return Type;

        if ($('#'+ Attribute + 'Minute').length == 0) return 'DynamicField_Date';

        return 'DynamicField_DateTime';
    }

    TargetNS.Exists = function (Attribute) {
        var FieldID = TargetNS.FieldID(Attribute);

        return $('#' + FieldID).length ? true : false;
    }

    /*

    Set value or key of input field.

        var Success = Znuny.Form.Input.Set('Queue',
            'Postmaster',
            {
                KeyOrValue:     'Value',     # Key, Value
                TriggerChange:  'false',
                Modernize:       true,       # true, false

                SelectOption:    true,       # true, false  - set options of select field
                AddEmptyOption:  true,       # true, false  - add empty option as first option for single-selects/dropdowns
                SortBy:         'Key',       # Key, Value   - Key is default
                SortOrder:      'ASC',       # ASC, DESC    - ASC is default
            }
        );

    Returns:

        var Success = true;     # true, false

    */
    TargetNS.Set = function (Attribute, Content, Options) {

        var Checked,
            CompareKeyOrValue,
            Key,
            Value,
            Exists,
            FieldID,
            KeyOrValue,
            Prefix,
            Selected,
            SetSelected,
            TriggerChange,
            Type,
            SetAsTicketCustomer,
            Modernize;

        Options = Options || {};

        if (typeof Options !== 'object') return;

        TriggerChange = true;
        if (typeof Options.TriggerChange === 'boolean') {
            TriggerChange = Options.TriggerChange;
        }

        KeyOrValue = Options.KeyOrValue || 'Key';
        FieldID    = TargetNS.FieldID(Attribute);

        Modernize  = true
        if (typeof Options.Modernize === 'boolean') {
            Modernize = Options.Modernize;
        }

        if (!FieldID) {
            return false;
        }

        Type = TargetNS.Type(FieldID);
        if(Options.Type){
            Type = Options.Type;
        }

        if (FieldID === 'RichText' || Type == 'RichText') {
            if (
                typeof CKEDITOR !== 'undefined'
                && CKEDITOR.instances[FieldID]
            ) {
                // Attention: No 'change' event will get triggered
                // and the content will get re-rendered, so all events are lost :)
                // See: https://dev.ckeditor.com/ticket/6633
                CKEDITOR.instances[FieldID].setData(Content || '');
                Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
            }
            else {
                $('#'+ FieldID).val(Content || '');
                if (TriggerChange) {
                    $('#'+ FieldID).trigger('change');
                }
                Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
            }
        }
        else if (
            Type == 'text'
            || Type == 'hidden'
            || Type == 'textarea'
        )
        {
            if (
                Type == 'text'
                && $('#'+ FieldID).hasClass('CustomerAutoComplete')
            ) {
                // register event listener to fetch and set result
                $('#'+ FieldID).one('autocompleteresponse', function(Event, Result) {

                    $('#'+ FieldID).autocomplete('close');

                    Prefix = FieldID;
                    Prefix = Prefix.replace(/^ToCustomer$/, 'Customer');
                    Prefix = Prefix.replace(/^FromCustomer$/, 'Customer');

                    SetAsTicketCustomer = $('#'+ Prefix +'TicketText').hasClass('Radio');
                    $.each(Result.content, function (Index, CustomerUser) {

                        Key   = CustomerUser.key,
                        Value = CustomerUser.value;

                        Exists = false;
                        $('input.CustomerTicketText').each(function (Index, Element) {

                            if ($(Element).val() != Value) return true;

                            if (SetAsTicketCustomer) {
                                Index = $(Element).attr('id');
                                Index = Index.replace('CustomerTicketText_', '');

                                if (TriggerChange) {
                                    $('#CustomerSelected_'+Index).trigger('click');
                                }

                                SetAsTicketCustomer = false;
                            }

                            Exists = true;
                        });

                        if (Exists) return true;

                        Core.Agent.CustomerSearch.AddTicketCustomer($(Event.target).attr('id'), Value, Key, SetAsTicketCustomer);

                        Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);

                        SetAsTicketCustomer = false;
                    });
                });

                // start search
                $('#'+FieldID).autocomplete('search', Content);
            }

            // CustomerAutoComplete
            else if (
                Type == 'text'
                && FieldID === 'CustomerAutoComplete'
            ) {
                // register event listener to fetch and set result
                $('#'+ FieldID).one('autocompleteresponse', function(Event, Result) {

                    if (Result.content.length === 1) {

                        Key   = Result.content[0].key,
                        Value = Result.content[0].value;

                        $('#'+ FieldID).autocomplete('close');
                        $('#'+ FieldID).val(Value);

                        if (TriggerChange) {
                            $('#'+ FieldID).trigger('change');
                        }

                        Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
                        Core.Agent.CustomerSearch.ReloadCustomerInfo(Key);
                    }
                    else if(KeyOrValue == 'Key' && Result.content.length > 1) {

                        $.each(Result.content, function(Index,Element){

                            if(Element.key != Content) return true;

                            Key   = Element.key,
                            Value = Element.value;

                            $('#'+ FieldID).autocomplete('close');
                            $('#'+ FieldID).val(Value);

                            if (TriggerChange) {
                                $('#'+ FieldID).trigger('change');
                            }

                            Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
                            Core.Agent.CustomerSearch.ReloadCustomerInfo(Key);

                            return false;
                        });
                    }
                });

                // start search
                $('#'+ FieldID).autocomplete('search', Content);
            }
            // DynamicField Autocomplete
            else if (
                Type == 'hidden'
                && FieldID.indexOf('DynamicField_') == 0
                && $('#'+ FieldID +'Autocomplete').length > 0
            )
            {
                // register event listener to fetch and set result
                $('#'+ FieldID +'Autocomplete').one('autocompleteresponse', function(Event, Result) {

                    if (Result.content.length === 1) {

                        // key is the stored value
                        // value is the showed value
                        if (Result.content[0].key){
                            Key   = Result.content[0].key,
                            Value = Result.content[0].value;
                        }
                        // DynamicField Autocomplete
                        // value is the stored value
                        // label is the showed value
                        else if (Result.content[0].label) {
                            Key   = Result.content[0].value,
                            Value = Result.content[0].label;
                        }

                        // Key is the stored value
                        // Value is the showed value
                        $('#'+ FieldID +'Autocomplete').autocomplete('close');
                        $('#'+ FieldID +'Autocomplete').val(Value);
                        $('#'+ FieldID).val(Key);

                        if (TriggerChange) {
                            $('#'+ FieldID).trigger('change');
                        }

                        Core.App.Publish('Znuny.Form.Input.Change.' + Attribute);
                    }
                    else if(Result.content.length > 1) {

                        $.each(Result.content, function(Index,Element){

                            // key is the stored value
                            // value is the showed value
                            if (Element.key){
                                Key   = Element.key,
                                Value = Element.value;
                            }
                            // DynamicField Autocomplete
                            // value is the stored value
                            // label is the showed value
                            else if (Element.label) {
                                Key   = Element.value,
                                Value = Element.label;
                            }

                            if(KeyOrValue == 'Key' && Key && Key != Content) return true;
                            if(KeyOrValue == 'Value' && Value && Value != Content) return true;

                            $('#'+ FieldID +'Autocomplete').autocomplete('close');
                            $('#'+ FieldID +'Autocomplete').val(Value);
                            $('#'+ FieldID).val(Key);

                            if (TriggerChange) {
                                $('#'+ FieldID).trigger('change');
                            }
                            Core.App.Publish('Znuny.Form.Input.Change.' + Attribute);

                            return false;
                        });
                    }
                });

                // start search
                $('#'+ FieldID +'Autocomplete').autocomplete('search', Content);
            }
            // regular fields
            else {
                $('#'+ FieldID).val(Content || '');

                if (TriggerChange) {
                    $('#'+ FieldID).trigger('change');
                }

                Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
            }
        }
        else if (Type == 'checkbox') {

            if ($.isArray(Content)) {

                // loop values of checkbox array
                // it is not possible to set arrays via ids like $('#StateList[]')
                // because ids always relating to one element
                $('input[name=\'' + FieldID + '\']').each(function() {

                    // get value of checkbox element
                    var CheckboxValue = $(this).val();

                    // check checked status
                    Checked = false
                    $.each(Content, function(Index, Value) {
                        if (CheckboxValue != Value) return true;

                        Checked = true;

                        return false;
                    });

                    var $Element = $(this);
                    $Element.prop('checked', Checked);
                    if (TriggerChange) {
                        $Element.trigger('change');
                    }

                    Core.App.Publish('Znuny.Form.Input.Change.' + Attribute + '.' + CheckboxValue);
                });
            }
            else {

                Checked = false;
                if (Content) {
                    Checked = true;
                }

                var $Element = $('#' + FieldID);
                $Element.prop('checked', Checked);
                if (TriggerChange) {
                    $Element.trigger('change');
                }
            }

            Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
        }
        else if (Type == 'select') {

            // set options of select field
            if (Options && Options.SelectOption){

                var SearchValue = $('#'+ FieldID + '_Search').val();
                $('#'+ FieldID +' option').remove();

                function AppendOptions() {
                    var ContentArray;

                    // Add empty option as first option for single-selects/dropdowns
                    // because otherwise somehow the first element will be selected
                    // automatically. Somehow this is not the case for multi-select fields.
                    // Also, the single-select/dropdown would not display the 'x' button to
                    // clear the field if this option won't be added.
                    // To avoid unknown side effects, leave it as optional via flag AddEmptyOption.
                    if (
                        Modernize
                        && $('#'+ FieldID).hasClass('Modernize')
                        && !$('#'+ FieldID).prop('multiple')
                        && Options.AddEmptyOption
                    ) {
                        $('#'+ FieldID).append($('<option>', { value: '', selected: true }).text('-'));
                    }

                    // create array from object
                    if (Options.SortBy || Options.SortOrder) {

                        ContentArray = Object.entries(Content).map(([key, value]) => ({ key: parseInt(key), value }));

                        if (
                            typeof Options.SortBy === 'undefined'
                            || (Options.SortBy !== 'Key' && Options.SortBy !== 'Value')
                        ) {
                            Options.SortBy = 'Key';
                        }

                        if (
                            typeof Options.SortOrder === 'undefined'
                            || (Options.SortOrder !== 'DESC' && Options.SortOrder !== 'ASC')
                        ) {
                            Options.SortOrder = 'DESC';
                        }
                        // sort by id
                        if (Options.SortBy == 'Key') {
                            ContentArray.sort((a, b) => a.key - b.key);
                        }

                        // sort by name
                        else if (Options.SortBy == 'Value') {
                            ContentArray.sort((a, b) => a.value.localeCompare(b.value));
                        }

                        // sort order
                        if (Options.SortOrder == 'DESC') {
                            ContentArray.reverse();
                        }
                        // add options
                        ContentArray.forEach(function(item) {
                            var Key = item.key;
                            var Value = item.value;

                            if (Value !== '') {
                                $('#'+ FieldID).append($('<option>', { value: Key }).text(Value));
                            }
                        });
                    }

                    // add options without sorting
                    else {
                        $.each(Content, function(Key, Value) {
                            if (Value !== '') {
                                $('#'+ FieldID).append($('<option>', { value: Key }).text(Value));
                            }
                        });
                    }
                }

                function RedrawInputField() {
                    $('#'+ FieldID).trigger('redraw.InputField').trigger('redraw.InputField');
                    $('#'+ FieldID).data('tree', true);
                }

                if (TriggerChange) {
                    $.when(AppendOptions()).then(function(){
                        $.when(RedrawInputField()).then(function(){
                            $('#'+ FieldID).triggerHandler('change');
                            $('#'+ FieldID + '_Search').triggerHandler('focus.InputField');
                            $('#'+ FieldID + '_Search').val(SearchValue);
                            $('#'+ FieldID + '_Search').focus();
                        })
                    })
                }else {
                    $.when(AppendOptions()).then(function(){
                        RedrawInputField();
                    })
                }
            }
            // select one option of select field
            else {

                // reset selection
                $('#'+ FieldID +' option').prop('selected', false);

                // get selected values as an array
                SetSelected = [];
                if (Content) {
                    if (
                        $('#'+ FieldID).prop('multiple')
                        && $.isArray(Content)
                    ) {
                        SetSelected = Content;
                    }
                    else {
                        SetSelected = [Content];
                    }
                }

                // cast to strings
                SetSelected = jQuery.map(SetSelected, function(Element) {
                  return Element.toString();
                });

                $('#'+ FieldID +' option').filter(function() {

                    var Text = RebuildLevelText($(this));

                    if (KeyOrValue == 'Key') {
                        CompareKeyOrValue = QueueIDExtract($(this).val(), Text);
                    }
                    else {
                        CompareKeyOrValue = Text;
                    }

                    Selected = false;
                    // may want to use $.trim in here?
                    if (SetSelected.indexOf($.trim(CompareKeyOrValue)) != -1) {
                        Selected = true;
                    }

                    return Selected;
                }).prop('selected', true);

                if (TriggerChange) {
                    $('#'+ FieldID).trigger('change');
                }
            }

            Core.App.Publish('Znuny.Form.Input.Change.'+ Attribute);
        }
        // DynamicField Date or DateTime
        else if (
            Type == 'DynamicField_Date'
            || Type == 'DynamicField_DateTime'
        ) {
            // if no content is given we will disable the Checkbox
            if (!Content) {
                $('#'+ FieldID).prop('checked', false);
                return true;
            }

            // ATTENTION - SPECIAL CASE: For DynamicFields Date or DateTime the Attribute is used as FieldID
            // to handle input actions since FieldID maps to the Checkbox element
            var DateContent = {};

            // Znuny.Form.Input.Set('DynamicField_DateTime','2020-11-25 14:22:00');
            if (!Content['Year'] && $.type(Content) === "string") {
                var DateObject = new Date(Content);

                DateContent.Year   = DateObject.getFullYear();
                DateContent.Month  = DateObject.getMonth() + 1;
                DateContent.Day    = DateObject.getDate();
                DateContent.Hour   = DateObject.getHours();
                DateContent.Minute = DateObject.getMinutes();
                DateContent.Used   = 1;

                Content = DateContent;
            }
            // Znuny.Form.Input.Set('DynamicField_Date',{Year: 2022, Month: 2, Day: 15, Hour: 10, Minute: 50, Used: true});
            if (Content['Year']){
                $.each(['Year', 'Month', 'Day', 'Hour', 'Minute'], function (Index, Suffix) {

                    // skip if no value is given
                    if (typeof Content[ Suffix ] === 'undefined') return true;

                    if (
                        $('#'+ Attribute + Suffix)
                        && $('#'+ Attribute + Suffix).length == 1
                    ) {
                        $('#'+ Attribute + Suffix).val(Content[ Suffix ]);
                    }
                    // exit loop
                    else {
                        return false;
                    }
                });
            }

            if (typeof Content.Used === 'undefined') return true;

            // set checkbox state
            $('#'+ FieldID).prop('checked', Content.Used);

            return true;
        }
        // if you use explicit Type: 'PendingDate' in Options
        else if (Type == 'PendingDate') {
            var DateContent = {};

            // Znuny.Form.Input.Set('Year','2020-11-25 14:22:00',{Type: 'PendingDate'});
            if(!Content['Year'] && $.type(Content) === "string"){
                var DateObject = new Date(Content);

                DateContent.Year   = DateObject.getFullYear();
                DateContent.Month  = DateObject.getMonth() + 1;
                DateContent.Day    = DateObject.getDate();
                DateContent.Hour   = DateObject.getHours();
                DateContent.Minute = DateObject.getMinutes();
                DateContent.Used   = 1;

                Content = DateContent;
            }
            // Znuny.Form.Input.Set('Year',{Year: 2022, Month: 2, Day: 15, Hour: 10, Minute: 50, Used: true},{Type: 'PendingDate'});
            if (Content['Year']){
                $.each(['Year', 'Month', 'Day', 'Hour', 'Minute'], function (Index, Suffix) {

                    // skip if no value is given
                    if (typeof Content[ Suffix ] === 'undefined') return true;

                    if (
                        $('#' + Suffix)
                        && $('#' + Suffix).length == 1
                    ) {
                        $('#' + Suffix).val(Content[ Suffix ]);
                    }
                    // exit loop
                    else {
                        return false;
                    }
                });
            }
        }

        // TODO: Attachments?

        // trigger redraw on modernized fields
        if (Modernize && $('#'+ FieldID).hasClass('Modernize')) {
            $('#'+ FieldID).trigger('redraw.InputField');
        }

        return true;
    };

    TargetNS.Hide = function (Attribute) {

        var FieldID = TargetNS.FieldID(Attribute);

        if (!FieldID) {
            return false;
        }

        $('#'+ FieldID).parent().parent('div.Row').hide();
        $('#'+ FieldID).parent().hide();
        $("label[for='" + FieldID + "']").hide();

        return true;
    }

    TargetNS.Show = function (Attribute) {

        var FieldID = TargetNS.FieldID(Attribute);

        if (!FieldID) {
            return false;
        }

        $('#'+ FieldID).parent().parent('div.Row').show();
        $('#'+ FieldID).parent().show();
        $("label[for='" + FieldID + "']").show();

        // Trigger custom redraw event for InputFields
        // since hidden elements are not calculated correclty
        // see https://github.com/OTRS/otrs/pull/1002
        if ($('#'+ FieldID).hasClass('Modernize')) {
            $('#'+ FieldID).trigger('redraw.InputField');
        }

        return true;
    }

    TargetNS.Visible = function (Attribute) {
        var FieldID = TargetNS.FieldID(Attribute);
        if (!FieldID) return;

        return $("label[for='" + FieldID + "']:visible").length ? true : false;
    }

    /*

    Manipulates the field to mandatory or optional field.

    var Result = Znuny.Form.Input.Mandatory('DynamicField_Example', true);
    var Result = Znuny.Form.Input.Mandatory('DynamicField_Example', false);

    Returns:

        Result = true

    Or:

    var CurrentState = Znuny.Form.Input.Mandatory('DynamicField_Example');

    Returns:

        CurrentState = true|false

    */
    TargetNS.Mandatory = function (Attribute, Mandatory) {

        var IsMandatory;
        var $LabelObject;
        var FieldID = TargetNS.FieldID(Attribute);

        if (!FieldID) {
            return false;
        }

        $LabelObject = $('[for="'+FieldID+'"]');

        // changed check from label to field class to have this
        // function working even if there is label given for the element
        IsMandatory = $('#'+FieldID).hasClass('Validate_Required');

        if (typeof Mandatory === 'undefined') {
            return IsMandatory;
        }

        if (Mandatory === IsMandatory) {
            return true;
        }

        if (IsMandatory) {
            $LabelObject.removeClass('Mandatory');
            $LabelObject.find('.Marker').remove();
            $('#'+FieldID).removeClass('Validate_Required');
        }
        else {
            $LabelObject.addClass('Mandatory');
            $LabelObject.prepend('<span class="Marker">*</span>');
            $('#'+FieldID).addClass('Validate_Required');
        }

        return true;
    }

    /*

    Manipulates the field to readonly.

    var Result = Znuny.Form.Input.Readonly('DynamicField_Example', true);
    var Result = Znuny.Form.Input.Readonly('DynamicField_Example', false);

    Returns:

        Result = true

    Or:

    var CurrentState = Znuny.Form.Input.Readonly('DynamicField_Example');

    Returns:

        CurrentState = true|false

    */
    TargetNS.Readonly = function (Attribute, Readonly) {

        var IsReadonly,
            $LabelObject,
            FieldID = TargetNS.FieldID(Attribute),
            Type    = TargetNS.Type(FieldID);

        if (!FieldID) {
            return false;
        }

        IsReadonly = $('#'+FieldID).prop('readonly');

        if (typeof Readonly === 'undefined') {
            return IsReadonly;
        }

        if (Readonly) {
            $('#' + FieldID).prop('readonly', true).attr('tabindex', '-1');

            if (Type == 'select'){
                $('#' + FieldID + '_Search').prop('readonly', true).attr('tabindex', '-1');
                $('#' + FieldID + '_Search').next().find('.Remove').remove();
            }
        }
        else {
            $('#' + FieldID).prop('readonly', false).attr('tabindex', '0');

            if (Type == 'select'){
                $('#' + FieldID + '_Search').prop('readonly', false).attr('tabindex', '0');
            }
        }

        return true;
    }

    /*

    Manipulates the error state of a given attribute.

    var Result = Znuny.Form.Input.Error('DynamicField_Example', 'Error');
    var Result = Znuny.Form.Input.Error('DynamicField_Example', 'ServerError');

    Returns:

        Result = true

    */
    TargetNS.Error = function (Attribute, ErrorType) {

        var FieldID = TargetNS.FieldID(Attribute);

        if (!FieldID) {
            return false;
        }

        Core.Form.Validate.HighlightError($('#'+ FieldID)[0], ErrorType);
    }

    /*
    Manipulates the configuration of RichText input fields. It takes a config structure where the key is the Editor FieldID and the value is another structure with the config items it should set. It's possible to use the meta key 'Global' to set the config of all RichText instances on the current site. Notice that old configurations will be kept and extended instead of removed. For a complete list of possible config attributes visit the CKEdior documentation: http://docs.ckeditor.com/#!/api/CKEDITOR.config

    var Result = Znuny.Form.Input.RichTextConfig({
      'RichText': {
        toolbarCanCollapse:     true,
        toolbarStartupExpanded: false,
      }
    });

    Returns:

      Result = true
    */
    TargetNS.RichTextConfig = function (NewConfig) {
        if (typeof CKEDITOR === 'undefined') {
            return;
        }

        // remove all rte's
        $('textarea.RichText').each(function () {
            var EditorID = $(this).attr('id');
            var Editor   = CKEDITOR.instances[EditorID];

            if (!Editor) return true;

            $(this).removeClass('HasCKEInstance');
            Editor.destroy(true);
        });

        // add hack to overwrite config at its lowest place
        CKEDITOR.replaceZnunyFormInput = CKEDITOR.replace;
        CKEDITOR.replace = function(EditorID, EditorConfig) {
            var ExtendedConfig = NewConfig[ EditorID ] || NewConfig['Global'];
            $.each(ExtendedConfig, function(Attribute, Value) {
              EditorConfig[ Attribute ] = Value;
            });

            return CKEDITOR.replaceZnunyFormInput(EditorID, EditorConfig);
        };

        // reinitialize all rte's
        Core.UI.RichTextEditor.InitAllEditors();

        // remove hack
        CKEDITOR.replace = CKEDITOR.replaceZnunyFormInput;
        delete CKEDITOR.replaceZnunyFormInput;

        return true;
    }

    /*

    This function will check if there is a sidebar on the page and else it will automatically
    create a magic sidebar and load the widget html into the sidebar.

    var Success = Znuny.Form.Input.MagicSideBarAddHTML(HTML);

    Returns:

    var Success = 1;

    */

    TargetNS.MagicSideBarAddHTML = function(HTML) {

        if ($('div.ARIARoleMain div.SidebarColumn').length > 0) {
            $('div.SidebarColumn').append(HTML);
        }
        else {
            var $MainElement = $('div.ARIARoleMain > div.Content').last();

            $MainElement.wrap('<div class="LayoutFixedSidebar SidebarLast"></div>');
            $MainElement.removeClass('Content').addClass('ContentColumn').attr('style', 'padding-top: 15px; padding-left: 15px;');

            $MainElement = $('div.LayoutFixedSidebar').last();

            $MainElement.prepend('<div class="SidebarColumn" style="padding-top: 15px; padding-left: 15px; padding-right: 10px"></div>');
            $MainElement.append('<div class="clear"></div>');

            var $Widget = $('#ResponseTemplateWidget').detach();

            $Widget.appendTo('div.SidebarColumn');
            $Widget.css('position', 'static');

            $('div.ARIARoleMain div.SidebarColumn').last().append(HTML);
        }

        return 1;
    };

    function RebuildLevelText($Element) {

        var Levels = [];

        var CurrentText = $Element.text();
        var Level       = CurrentText.search(/\S/);

        Levels.unshift($.trim(CurrentText));

        var LevelSearch = false;
        if (Level > 0) {
            LevelSearch = true;
        }

        var $TempElement = $Element;
        while (LevelSearch) {

            $TempElement = $TempElement.prev();
            CurrentText  = $TempElement.text();

            // special handling for broken element values
            // that start with a leading whitespace
            // see issue #17
            if (!CurrentText) {
                LevelSearch = false;
                continue;
            }

            var CompareLevel = CurrentText.search(/\S/);

            if (CompareLevel >= Level) {
                continue;
            }

            Level = CompareLevel;

            Levels.unshift($.trim(CurrentText));

            if (Level == 0) {
                LevelSearch = false;
            }
        }

        return Levels.join('::');
    }

    // special queue handling
    function QueueIDExtract (Key, Value) {
        var QueueName   = $.trim(Value);
        QueueName       = escapeRegExp(QueueName);
        var QueueExp    = '^(\\d*)\\|\\|.*'+ QueueName +'$';
        var QueueRegExp = new RegExp(QueueExp);

        return Key.replace(QueueRegExp, "$1");
    }

    function escapeRegExp(str) {
      return str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
    }

    //
    // Automatically sets the checkbox of date and datetime dynamic fields
    // if a date/time (or part of it) was selected.
    //
    function InitDynamicFieldDateTimeAutoCheckboxSet() {

        // Note: Also handle input fields because date fields can also be input fields (SysConfig option TimeInputFormat).
        $('select, input')
            .off('change.DynamicFieldDateTimeAutoCheckboxSet')
            .on('change.DynamicFieldDateTimeAutoCheckboxSet', function() {
                DynamicFieldDateTimeAutoCheckboxSet($(this));
            }
        );

        // Take care of AJAX requests, this is e.g. needed in process management.
        Core.App.Subscribe('Event.AJAX.FunctionCall.Callback', function() {
            $('select, input')
                .off('change.DynamicFieldDateTimeAutoCheckboxSet')
                .on('change.DynamicFieldDateTimeAutoCheckboxSet', function() {
                    DynamicFieldDateTimeAutoCheckboxSet($(this));
                }
            );
        });
    }

    function DynamicFieldDateTimeAutoCheckboxSet($Element) {
        var ElementID = $Element.attr('id'),
            ElementType,
            ElementCheckboxID;

        if (!ElementID) return;

        // Only handle dynamic fields.
        if (!ElementID.match(/^DynamicField/)) return;

        // Check which element of the date input was changed.
        var ChangedElementType = ElementID.match(/(Day|Month|Year|Hour|Minute)$/);
        if (!ChangedElementType) return;

        // Set checkbox for changed date input field.
        ElementCheckboxID = ElementID.replace(ChangedElementType[1], 'Used');
        $('#' + ElementCheckboxID).prop('checked', true);
    }

    //
    // Shows/hides pending time selection depending on if a pending state was
    // selected.
    //
    function InitPendingStateDateTimeSelectionToggle() {
        var PendingStateIDs = Core.Config.Get('PendingStateIDs');

        if (!PendingStateIDs || !PendingStateIDs.length) {
            return;
        }

        $('#NextStateID, #NewStateID, #StateID, #ComposeStateID')
            .off('change.PendingStateDateTimeSelectionToggle')
            .on(
                'change.PendingStateDateTimeSelectionToggle',
                function () {
                    var SelectedStateID = $(this).val(),
                        $ParentField,
                        PendingStateIDsFound = [];

                    PendingStateIDsFound = jQuery.grep(
                        PendingStateIDs,
                        function(StateID) {
                            return StateID == SelectedStateID;
                        }
                    );

                    if (PendingStateIDsFound.length) {
                        $('#Month, #PendingTimeMonth').closest('div.Field').parent().show();
                        return;
                    }

                    $ParentField = $('#Month, #PendingTimeMonth').closest('div.Field').parent();
                    if ( $ParentField.is("div") ) {
                        $ParentField.hide();
                    }
                }
            )
            .trigger('change.PendingStateDateTimeSelectionToggle');
    }

    TargetNS.Init = function () {
        InitDynamicFieldDateTimeAutoCheckboxSet();
        InitPendingStateDateTimeSelectionToggle();

        Core.App.Subscribe('TicketProcess.Init.FirstActivityDialog.Load', function($Element) {
            InitPendingStateDateTimeSelectionToggle();
        });
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Znuny.Form.Input || {}));
