// --
// Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

"use strict";

var Core = Core || {};
Core.Agent = Core.Agent || {};

/**
 * @namespace Core.Agent.TicketBulk
 * @memberof Core.Agent
 * @author OTRS AG
 * @description
 *      This namespace contains special module functions for the TicketBulk.
 */
Core.Agent.TicketBulk = (function (TargetNS) {

    /**
     * @name Init
     * @memberof Core.Agent.TicketBulk
     * @function
     * @description
     *      This function initializes the functionality for the TicketBulk screen.
     */
    TargetNS.Init = function () {
        var TicketBulkURL = Core.Config.Get('TicketBulkURL'),
            $TicketNumberObj = $('#MergeTo'),
            Fields = ['StateID', 'TypeID', 'OwnerID', 'ResponsibleID', 'QueueID', 'PriorityID'],
            DynamicFieldNames = Core.Config.Get('DynamicFieldNames'),
            ModifiedFields,

            // Fields that are only required if they are visible to the user
            // when a widget gets expanded.
            RequiredWidgetFieldIDs = [
                'Subject', 'Body',
                'EmailSubject', 'EmailBody'
            ],
            TimeUnitsSelectFieldIDs = [
                'TimeUnitsMinutes', 'TimeUnitsSeconds', 'TimeUnitsHours',
                'EmailTimeUnitsMinutes', 'EmailTimeUnitsSeconds', 'EmailTimeUnitsHours'
            ];

        // Initialize autocomplete feature on ticket number field.
        Core.UI.Autocomplete.Init($TicketNumberObj, function (Request, Response) {
            var URL = Core.Config.Get('Baselink'),
                Data = {
                    Action: 'AgentTicketSearch',
                    Subaction: 'AJAXAutocomplete',
                    Term: Request.term,
                    MaxResults: Core.UI.Autocomplete.GetConfig('MaxResultsDisplayed')
                };

            $TicketNumberObj.data('AutoCompleteXHR', Core.AJAX.FunctionCall(URL, Data, function (Result) {
                var ValueData = [];
                $TicketNumberObj.removeData('AutoCompleteXHR');
                $.each(Result, function () {
                    ValueData.push({
                        label: this.Value,
                        key:  this.Key,
                        value: this.Value
                    });
                });
                Response(ValueData);
            }));
        }, function (Event, UI) {
            $TicketNumberObj.val(UI.item.key).trigger('select.Autocomplete');

            Event.preventDefault();
            Event.stopPropagation();

            return false;
        }, 'TicketSearch');

        // Make sure on focus handler also returns ticket number value only.
        $TicketNumberObj.on('autocompletefocus', function (Event, UI) {
            $TicketNumberObj.val(UI.item.key);

            Event.preventDefault();
            Event.stopPropagation();

            return false;
        });

        // bind radio and text input fields
        $('#MergeTo').on('blur', function() {
            if ($(this).val()) {
                $('#OptionMergeTo').prop('checked', true);
            }
        });


        TargetNS.InitDynamicFields(DynamicFieldNames);

        // Bind events to specific fields
        $.each(Fields, function(Index, Value) {
            ModifiedFields = Core.Data.CopyObject(Fields).concat(DynamicFieldNames);
            ModifiedFields.splice(Index, 1);

            FieldUpdate(Value, ModifiedFields);
        });

        // execute function in the parent window
        Core.UI.Popup.ExecuteInParentWindow(function(WindowObject) {
            WindowObject.Core.UI.Popup.FirePopupEvent('URL', { URL: TicketBulkURL }, false);
        });

        if (
            Core.Config.Get('TimeUnitsInputType') == 'Text'
            && Core.Config.Get('TimeUnitsRequired')
        ) {
            RequiredWidgetFieldIDs = $.merge(RequiredWidgetFieldIDs, ['TimeUnits', 'EmailTimeUnits']);
        }

        // Toggle required fields of widgets depending on their visibility.
        $('.WidgetAction.Toggle a').on('click', function() {
            ToggleRequiredWidgetFields(RequiredWidgetFieldIDs);
            if (
                Core.Config.Get('TimeUnitsInputType') == 'Dropdown'
                && Core.Config.Get('TimeUnitsRequired')
            ) {
                ToggleRequiredWidgetFields(TimeUnitsSelectFieldIDs, 'Validate_TimeUnits');
            }
        });

        // Initialize required visible fields of widgets once.
        ToggleRequiredWidgetFields(RequiredWidgetFieldIDs);
        if (Core.Config.Get('TimeUnitsInputType') == 'Dropdown' && Core.Config.Get('TimeUnitsRequired')) {
            ToggleRequiredWidgetFields(TimeUnitsSelectFieldIDs, 'Validate_TimeUnits');
        }

        // get the Recipients on expanding of the email widget
        $('#EmailSubject').closest('.WidgetSimple').find('.Header .Toggle a').on('click', function() {

            // if the spinner is still there, we want to load the recipients list
            if ($('#EmailRecipientsList i.fa-spinner:visible').length) {

                Core.AJAX.FunctionCall(
                    Core.Config.Get('CGIHandle'),
                    {
                        'Action'    : 'AgentTicketBulk',
                        'Subaction' : 'AJAXRecipientList',
                        'TicketIDs' : Core.JSON.Stringify(Core.Config.Get('ValidTicketIDs'))
                    },
                    function(Response) {
                        var Recipients = Core.JSON.Parse(Response),
                            TextShort = '',
                            TextFull = '',
                            Counter;

                        if (Recipients.length <= 3) {
                            $('#EmailRecipientsList').text(Recipients.join(', '));
                        }
                        else {
                            for (Counter = 0; Counter < 3; Counter++) {
                                TextShort += Recipients[Counter];
                                if (Counter < 2) {
                                    TextShort += ', ';
                                }
                            }

                            for (Counter = 3; Counter < Recipients.length; Counter++) {
                                if (Counter < Recipients.length) {
                                    TextFull += ', ';
                                }
                                TextFull += Recipients[Counter];
                            }

                            $('#EmailRecipientsList').text(TextShort);
                            $('#EmailRecipientsList')
                                .append('<a href="#" class="Expand"></a>')
                                .find('a')
                                .on('click', function() {

                                    $(this).hide();
                                    $(this).nextAll('span, a').fadeIn();
                                    return false;
                                })
                                .text(Core.Language.Translate(" ...and %s more", Recipients.length - 3))
                                .closest('span')
                                .append('<span />')
                                .find('span')
                                .text(TextFull)
                                .parent()
                                .append('<a href="#" class="Collapse"></a>')
                                .find('a.Collapse')
                                .on('click', function() {

                                    $(this)
                                        .hide()
                                        .prev('span')
                                        .hide()
                                        .prev('a')
                                        .fadeIn();

                                    return false;
                                })
                                .text(Core.Language.Translate(" ...show less"));
                        }
                    }
                );
            }
        });
    };

    TargetNS.InitDynamicFields = function (DynamicFieldNames) {
        $.each(DynamicFieldNames, function(Index, DynamicFieldName) {

            var DynamicFieldConfigs = Core.Config.Get('DynamicFieldConfigs'),
                UsedSuffix = 'Used',
                UsedType;

            var HasCheckbox = false,
                IsChecked         = (DynamicFieldConfigs[DynamicFieldName]['IsChecked'] === 'true'),
                RequireActivation = (DynamicFieldConfigs[DynamicFieldName]['RequireActivation'] === 'true');

            // check if this current DynamicField has a hidden checkbox "DynamicFieldUsed"
            if ($('#' +  DynamicFieldName + UsedSuffix).length) {
                HasCheckbox = true;
            }

            // if Ticket::Frontend::AgentTicketBulk###DynamicFieldRequireActivation is not activated
            // hide the additional checkbox (Used) of datetime and checkbox
            if (!RequireActivation) {
                if (HasCheckbox) {
                    $('#' + DynamicFieldName + 'Used').hide();
                    $('#' + DynamicFieldName + 'Used').prop('checked', true);
                }
                return;
            }

            if (HasCheckbox) {
                UsedType = $('#' + DynamicFieldName + 'Used').prop('type');
                // show hidden checkbox
                if (UsedType === 'hidden') {
                    UsedSuffix = '';
                    $('#' + DynamicFieldName + 'Used').prop('type', 'checkbox');
                }

                // move current checkboxUsed to the <for="DynamicField_DynamicFieldName"> tag
                $('#' + DynamicFieldName + 'Used').prependTo(
                    $("[for='" + DynamicFieldName + UsedSuffix + "']")
                );
            }
            else {
                // insert a new checkbox with id=DynamicFieldNameUsed to label
                $("[for='" + DynamicFieldName + "']").prepend(
                    '<input type="checkbox" id="' + DynamicFieldName + 'Used" name="' + DynamicFieldName + 'Used" value="1"/>'
                );
            }

            // set the label "for" to the CheckboxUsed
            // otherwise Firefox won't uncheck the CheckboxUsed
            $("[for='" + DynamicFieldName + "']").prop('for', '' + DynamicFieldName + 'Used');

            if (IsChecked) {
                $('#' + DynamicFieldName + 'Used').prop('checked',  true);
            }

            // reset input values for current DynamicField after uncheck CheckboxUsed
            $('#' + DynamicFieldName + 'Used').on('change', function () {
                var IsChecked = $('#' + DynamicFieldName + 'Used').prop('checked'),
                    Tag,
                    Type;

                if (
                    IsChecked === false
                    && $('#' + DynamicFieldName).length
                ) {
                    Tag = $('#' + DynamicFieldName).prop('tagName').toLowerCase();

                    if (Tag === 'input') {
                        Type = $('#' + DynamicFieldName).prop('type').toLowerCase();

                        if (Type === 'checkbox') {
                            $('#' + DynamicFieldName).prop('checked', false);
                        }
                        else {
                            $('#' + DynamicFieldName).val('');
                        }
                    }
                    else {
                        $('#' + DynamicFieldName).val('');
                    }
                }
            });

            // set CheckboxUsed to check after clicking into input field
            $('#' + DynamicFieldName).on('click', function () {
                $('#' + DynamicFieldName + 'Used').prop('checked', true);
            });

            // if input field is date dynamic field, loop over every input field to set CheckboxUsed to check
            $.each(['Year', 'Month', 'Day', 'Hour', 'Minute','DayDatepickerIcon'], function (Index, Element) {
                if ($('#' +  DynamicFieldName + Element).length) {
                    $('#' +  DynamicFieldName + Element).on('click', function() {
                        $('#' + DynamicFieldName + 'Used').prop('checked', true);
                    });
                }
            });

        });
    };

    /**
     * @private
     * @name FieldUpdate
     * @memberof Core.Agent.TicketBulk.Init
     * @function
     * @param {String} Value - FieldID
     * @param {Array} ModifiedFields - Fields
     * @description
     *      Create on change event handler
     */
    function FieldUpdate (Value, ModifiedFields) {
        $('#' + Value).on('change', function () {
            Core.AJAX.FormUpdate($('.Validate'), 'AJAXUpdate', Value, ModifiedFields);
        });
    }

    /**
     * @private
     * @name ToggleRequiredWidgetFields
     * @memberof Core.Agent.TicketBulk.Init
     * @function
     * @param {Object} RequiredWidgetFieldIDs
     * @param {String} AdditionalClass
     * @description
     *      Toggles mandatory fields if they are visible/being used in an expanded widget.
     *      Specify AdditionalClass to work with additional class.
     */
    function ToggleRequiredWidgetFields(RequiredWidgetFieldIDs, AdditionalClass) {

        // Check each relevant field for visibility and toggle
        // class Validate_Required (visible: add / invisible: remove).
        $.each(RequiredWidgetFieldIDs, function(Index, FieldID) {
            var $Widget = $('#' + FieldID).closest('div.WidgetSimple'),
                WidgetExpanded = $Widget.hasClass('Expanded');

            if (WidgetExpanded || $('#' + FieldID).is(':visible')) {
                $('#' + FieldID).addClass('Validate_Required');

                if (AdditionalClass) {
                    $('#' + FieldID).addClass(AdditionalClass);
                }

                return;
            }

            $('#' + FieldID).removeClass('Validate_Required');

            if (AdditionalClass) {
                $('#' + FieldID).removeClass(AdditionalClass);
            }
        });
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.TicketBulk || {}));
