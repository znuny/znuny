// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Znuny = Znuny || {};
Znuny.DynamicField = Znuny.DynamicField || {};

/**
 * @namespace
 * @exports TargetNS as Znuny.DynamicField.Webservice
 * @description
 *      This namespace contains the special functions for dynamic field types WebserviceDropdown and WebserviceMultiselect.
 */
Znuny.DynamicField.Webservice = (function (TargetNS) {

    TargetNS.Init = function() {

        // Subscribe to event which triggers when dynamic fields will be dynamically
        // added to the DOM. This way, the InitAutoComplete() can be executed for these fields.
        // This is being done e. g. in AdminGenericAgent when configuring the dynamic fields.
        Core.App.Subscribe('Event.DynamicField.InitByInputFieldUUID', InitDynamicField);
    }

    function InitDynamicField(InputFieldUUID) {

        // If the dynamic field is present in the HTML retrieved from the web server,
        // InitAutocomplete() below will be automatically called.
        // However, if the dynamic field will be added dynamically, this function
        // will execute InitAutocomplete() for the field.
        var $DynamicFieldElement = $(':input[data-input-field-uuid="' + InputFieldUUID + '"]').first(),
            DynamicFieldName,
            DynamicFieldType,
            SelectedValueFieldName,
            AutocompleteFieldName,
            AutocompleteMinLength,
            TicketID,
            QueryDelay,
            DefaultSearchTerm;

        if (!$DynamicFieldElement.length) {
            return;
        }

        DynamicFieldName       = $DynamicFieldElement.attr('data-dynamic-field-name');
        DynamicFieldType       = $DynamicFieldElement.attr('data-dynamic-field-type');
        SelectedValueFieldName = $DynamicFieldElement.attr('data-selected-value-field-name');
        AutocompleteFieldName  = $DynamicFieldElement.attr('data-autocomplete-field-name');
        AutocompleteMinLength  = $DynamicFieldElement.attr('data-autocomplete-min-length');
        TicketID               = $DynamicFieldElement.attr('data-ticket-id');
        QueryDelay             = $DynamicFieldElement.attr('data-query-delay');
        DefaultSearchTerm      = $DynamicFieldElement.attr('data-default-search-term');

        if (
            !DynamicFieldName
            || !DynamicFieldType
            || !SelectedValueFieldName
            || !AutocompleteFieldName
            || !AutocompleteMinLength
        ) {
            return;
        }

        if (
            DynamicFieldType != 'WebserviceDropdown'
            && DynamicFieldType != 'WebserviceMultiselect'
        ) {
            return;
        }

        TargetNS.InitSelect(
            InputFieldUUID, DynamicFieldName, SelectedValueFieldName, AutocompleteFieldName, AutocompleteMinLength, QueryDelay, DefaultSearchTerm, TicketID
        );
        return;
    }

    TargetNS.InitAdmin = function() {
        TargetNS.InitTest();

        $('#Webservice').on('change', function(){
            var $Form = $(this).closest('form');
            Core.AJAX.FormUpdate($Form, 'AJAXUpdate', 'Webservice', ['InvokerSearch', 'InvokerGet']);
        });

        $('#Backend').on('change', function(){
            var $Form = $(this).closest('form');
            Core.AJAX.FormUpdate($Form, 'AJAXUpdate', 'Backend', ['BackendDocumentation']);
        });
    };

    TargetNS.InitSelect = function (InputFieldUUID, DynamicFieldName, SelectedValueFieldName, AutocompleteFieldName, AutocompleteMinLength, QueryDelay, DefaultSearchTerm, TicketID, AdditionalDFs) {
        var ActiveAJAXCall  = false,

            // Find input field with matching UUID.
            $InputField = $(':input[data-input-field-uuid="' + InputFieldUUID +'"]').first(),

            // Set $InputDiv to the surrounding div of the input field with the matching UUID.
            $InputDiv = $InputField.closest('div');

        // Remove read-only attribute from autocompletion dropdown
        // because the field might be empty initially.
        $('#' + AutocompleteFieldName).removeAttr('readonly');

        //
        // Use "live" update for the following events because the autocomplete field might not
        // be present in the DOM yet (e.g. in AgentTicketSearch, AdminGenericAgent).
        //
        // Click on search field with configured default search term.
        $InputDiv
            .off('click.AutocompleteSelect', '#' + AutocompleteFieldName)
            .on('click.AutocompleteSelect', '#' + AutocompleteFieldName, function() {
                if (DefaultSearchTerm){
                    AutocompleteSelect($(this), DefaultSearchTerm);
                }
            });

        // Execute autocompletion when typing in search field
        $InputDiv
            .off('keyup.AutocompleteSelect', '#' + AutocompleteFieldName)
            .on('keyup.AutocompleteSelect', '#' + AutocompleteFieldName, function() {
                var $ThisAutocompleteElement = $(this);
                window.setTimeout(
                    function () {
                        if (ActiveAJAXCall){
                            return;
                        }
                        AutocompleteSelect($ThisAutocompleteElement);
                    },
                    QueryDelay
                );
            });

        function AutocompleteSelect($AutocompleteField, SearchTerm) {
            var URL   = Core.Config.Get('Baselink'),
                Value = SearchTerm || $AutocompleteField.val() || '',
                Data  = {
                    Action:           'AJAXDynamicFieldWebservice',
                    Subaction:        'Autocomplete',
                    DynamicFieldName: DynamicFieldName,
                    SearchTerms:      Value,
                    TicketID:         TicketID
                },
                SerializedFormData = TargetNS.SerializeForm($InputField),
                InputValues        = TargetNS.GetInputValues($InputField);

            if (Value.length < AutocompleteMinLength) {
                return;
            }

            Data = $.extend(Data, SerializedFormData);
            Data.FormFields = InputValues;

            ActiveAJAXCall = true;
            ToggleAJAXLoader(true);
            Core.AJAX.FunctionCall(
                URL,
                Data,
                function (Response) {
                    var CurrentValue,
                        Options  = {},
                        SelectedIDs;

                    ActiveAJAXCall = false;

                    ToggleAJAXLoader(false);
                    if (!Response || (Array.isArray(Response) && !Response.length)) {
                        return;
                    }

                    // additional check if current search term is equal to sent search term
                    CurrentValue = SearchTerm || $AutocompleteField.val() || '';
                    if (CurrentValue != Value){
                        AutocompleteSelect($AutocompleteField);
                        return;
                    }

                    $.each(Response,function () {
                        if (this.StoredValue && this.DisplayValue){
                            Options[this.StoredValue] = this.DisplayValue;
                        }
                    });

                    SelectedIDs = $InputField.val();
                    if (SelectedIDs) {
                        $InputField.find('option').each(function(Index, Element) {
                            var Key        = $(Element).val(),
                                Value      = $(Element).text(),
                                IsSelected = SelectedIDs.includes(Key);

                            // Add previously selected options to result to keep them
                            // available and selected.
                            if (IsSelected){
                                Options[Key] = Value;
                            }
                        });
                    }

                    // Use own 'Set' function to be able to set options and values for a given element instead of a field ID.
                    // Znuny.Form.Input.Set does not support this.
                    // Znuny.Form.Input.Set(SelectedValueFieldName, Options, {SelectOption: true, Modernize: true, TriggerChange: true, AddEmptyOption: true});
                    SetInputFieldSelectableOptions(Options, $AutocompleteField);

                    if (!jQuery.isEmptyObject(SelectedIDs)){

                        // Znuny.Form.Input.Set(SelectedValueFieldName, SelectedIDs);
                        SetInputFieldSelectedOptions(SelectedIDs);
                    }
                },
                'json'
            );
        }

        function ToggleAJAXLoader(Show) {
            var AJAXLoaderPrefix = 'AJAXLoader',
                $Loader = $InputDiv.find('#' + AJAXLoaderPrefix + DynamicFieldName),
                LoaderHTML = '<span id="' + AJAXLoaderPrefix + DynamicFieldName + '" class="AJAXLoader"></span>';

            if (Show) {
                if (!$Loader.length) {
                    $InputField.after(LoaderHTML);
                }
                else {
                    $Loader.show();
                }

                return;
            }

            $Loader.hide();
        }

        function SetInputFieldSelectableOptions(Options, $AutocompleteField) {
            var SearchValue = $AutocompleteField.val();
            $InputField.find('option').remove();

            function AppendOptions() {

                // Add empty option as first option for single-selects/dropdowns
                // because otherwise somehow the first element will be selected
                // automatically. Somehow this is not the case for multi-select fields.
                // Also, the single-select/dropdown would not display the 'x' button to
                // clear the field if this option won't be added.
                // To avoid unknown side effects, leave it as optional via flag AddEmptyOption.
                if (
                    $InputField.hasClass('Modernize')
                    && !$InputField.prop('multiple')
                ) {
                    $InputField.append($('<option>', { value: '', selected: true }).text('-'));
                }
                $.each(Options, function(Key, Value) {
                    if (Value !== '') {
                        $InputField.append($('<option>', { value: Key }).text(Value));
                    }
                });
            }

            function RedrawInputField() {
                $InputField.trigger('redraw.InputField').trigger('redraw.InputField');
                $InputField.data('tree', true);
            }

            $.when(AppendOptions()).then(function(){
                $.when(RedrawInputField()).then(function(){
                    $InputField.triggerHandler('change');
                    $AutocompleteField.triggerHandler('focus.InputField');
                    $AutocompleteField.val(SearchValue);
                    $AutocompleteField.focus();
                })
            })

            Core.App.Publish('Znuny.Form.Input.Change.' + DynamicFieldName);

            // trigger redraw on modernized fields
            if ($InputField.hasClass('Modernize')) {
                $InputField.trigger('redraw.InputField');
            }
        }

        function SetInputFieldSelectedOptions(SelectedIDs) {
            var SetSelected = [];

            // reset selection
            $InputField.find('option').prop('selected', false);

            // get selected values as an array
            if (SelectedIDs) {
                if (
                    $InputField.prop('multiple')
                    && $.isArray(SelectedIDs)
                ) {
                    SetSelected = SelectedIDs;
                }
                else {
                    SetSelected = [SelectedIDs];
                }
            }

            // cast to strings
            SetSelected = jQuery.map(SetSelected, function(Element) {
                return Element.toString();
            });

            $InputField.find('option').filter(function() {
                var Selected = false;

                // may want to use $.trim in here?
                if (SetSelected.indexOf($.trim($(this).val())) != -1) {
                    Selected = true;
                }

                return Selected;
            }).prop('selected', true);

            $InputField.trigger('change');

            Core.App.Publish('Znuny.Form.Input.Change.'+ DynamicFieldName);

            // trigger redraw on modernized fields
            if ($InputField.hasClass('Modernize')) {
                $InputField.trigger('redraw.InputField');
            }

        }

        // prepare AutoFill for additional dynamic fields
        $('#' + SelectedValueFieldName).off('change.Multiselect').on('change.Multiselect', function () {
            var SelectedIDs = Znuny.Form.Input.Get(SelectedValueFieldName),
                InitAutoFill;

            if (SelectedIDs && AdditionalDFs && AdditionalDFs.length){
                $.each(AdditionalDFs, function(Index, DynamicField) {
                    var Exists = Znuny.Form.Input.Exists('DynamicField_' + DynamicField);

                    if (Exists){
                        InitAutoFill = 1;
                        return false;
                    }
                });

                if (InitAutoFill){
                    TargetNS.InitAutoFill(DynamicFieldName,SelectedIDs);
                }
            }
        });
    }

    TargetNS.InitAutoFill = function(DynamicFieldName,Value) {
        var URL  = Core.Config.Get('Baselink'),
            Data = {
                Action:           'AJAXDynamicFieldWebservice',
                Subaction:        'AutoFill',
                DynamicFieldName: DynamicFieldName,
                SearchTerms:      Value,
            },
            SerializedFormData = TargetNS.SerializeForm($('#DynamicField_' + DynamicFieldName)),
            InputValues        = TargetNS.GetInputValues($('#DynamicField_' + DynamicFieldName));

        Data = $.extend(Data, SerializedFormData);
        Data.FormFields = InputValues;

        Core.AJAX.FunctionCall(
            URL,
            Data,
            function (Response) {
                if (!Response) {
                    return;
                }

                $.each(Response, function(DynamicFieldName, Value) {
                    var DynamicField = 'DynamicField_' + DynamicFieldName,
                        Exists = Znuny.Form.Input.Exists(DynamicField);

                    if (Exists){
                        Znuny.Form.Input.Set(DynamicField, Value);
                    }
                });
            },
            'json'
        );

        return true;
    }

    TargetNS.InitTest = function() {
        $('button[data-action="Test"]')
            .off('click.dynamicfieldwebservice')
            .on('click.dynamicfieldwebservice', function () {
                var AutocompleteMinLength    = $('#AutocompleteMinLength').val(),
                    QueryDelay          = $('#QueryDelay').val() || 100,
                    DefaultSearchTerm   = $('#DefaultSearchTerm').val(),
                    FieldType           = $('[name="FieldType"]').val(),
                    DynamicFieldName    = $('#Name').val(),
                    FieldName           = 'DynamicField_' + DynamicFieldName,
                    AutocompleteFieldName,
                    URL                      = Core.Config.Get('Baselink'),
                    Config                   = [
                        'Webservice', 'InvokerSearch', 'InvokerGet', 'Backend', 'CacheTTL', 'StoredValue', 'SearchKeys', 'DisplayedValues', 'DisplayedValuesSeparator', 'Limit', 'AutocompleteMinLength', 'QueryDelay', 'AdditionalDFStorage', 'InputFieldWidth', 'DefaultValue', 'Link', 'SearchTerms',                     ],
                    Data = {
                        Action:           'AJAXDynamicFieldWebservice',
                        Subaction:        'Test',
                        DynamicFieldName: DynamicFieldName,
                        FieldType:        FieldType,
                        Config:   {}
                    },
                    $Button = $(this);

                if ($Button.prop('disabled')) {
                    return;
                }

                $.each(Config, function(Index, Value) {
                    Data['Config'][Value] = $('#' + Value).val();
                });

                $Button.prop('disabled', true);

                // Hide test results
                $('#TestError, #TestSuccess, .Test')
                    .addClass('Hidden');

                Core.AJAX.FunctionCall(
                    URL,
                    Data,
                    function (Result) {
                        $Button.prop('disabled', false);

                        if (Result['Success'] != 1) {
                            $('#TestError').removeClass('Hidden');
                            return;
                        }

                        $('#TestSuccess, .Test').removeClass('Hidden');
                        $('#TestData').html(Result['TestDataHTML']);

                        Core.UI.InputFields.Activate();

                        AutocompleteFieldName = FieldName + '_Search';

                        TargetNS.InitSelect(DynamicFieldName, FieldName, AutocompleteFieldName, AutocompleteMinLength, QueryDelay, DefaultSearchTerm, 0, '');
                    }
                )
            });

        return true;
    }

    TargetNS.SerializeForm = function ($Element, Ignore) {
        var QueryString = {};

        if (typeof Ignore === 'undefined') {
            Ignore = {};
        }

        if (isJQueryObject($Element) && $Element.length) {
            $Element.closest('form').find('input:not(:file), textarea, select').filter(':not([disabled=disabled])').each(function () {
                var Name = $(this).attr('name') || '';

                // only look at fields with name
                // only add element to the string, if there is no key in the data hash with the same name
                if (!Name.length || typeof Ignore[Name] !== 'undefined'){
                    return;
                }

                if (!Name.match(/^DynamicField/)) return;

                QueryString[Name] = $(this).val();
            });
        }
        return QueryString;
    };

    TargetNS.GetInputValues = function ($Element) {
        var QueryString = {},
            DynamicFieldName = $Element.attr('name');

        if (isJQueryObject($Element) && $Element.length) {
            $Element.closest('form').find('input:not(:file), textarea, select').filter(':not([disabled=disabled])').each(function () {
                var Name = $(this).attr('name') || '';

                if (!Name.length){
                    return;
                }

                if (Name == DynamicFieldName || Name == 'Action' || Name == 'Subaction' || Name.match('Autocomplete')) return;

                if($(this).attr('type') == 'checkbox') {
                    QueryString[Name] = {
                        ID: $(this).prop('checked') ? 1 : 0
                    };
                    return;
                }

                QueryString[Name] = {
                    ID:   $(this).val(),
                    Name: $(this).children('option:selected').text()
                };

            });
        }

        return QueryString;
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Znuny.DynamicField.Webservice || {}));
