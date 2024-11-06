// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Znuny         = Znuny       || {};
Znuny.Agent       = Znuny.Agent || {};
Znuny.Agent.Admin = Znuny.Agent.Admin || {};

/**
 * @namespace
 * @exports TargetNS as Znuny.Agent.Admin.DynamicFieldScreenConfiguration
 */
Znuny.Agent.Admin.DynamicFieldScreenConfiguration = (function (TargetNS) {

    TargetNS.Init = function () {

        // Init drag & drop between lists.
        Core.UI.AllocationList.Init(
            "#AvailableElements, #DisabledElements, #AssignedElements, #AssignedRequiredElements",
            ".AllocationList",
            UpdateFields
        );

        // Init filters for every list.
        $.each(
            ['Sidebar', 'Available', 'Disabled', 'Assigned', 'AssignedRequired'],
            function (Index, ElementSelector) {
                Core.UI.Table.InitTableFilter(
                    $('#Filter' + ElementSelector + 'Elements'),
                    $('#' + ElementSelector + 'Elements')
                );
            }
        );

        // Select all elements of a list.
        $.each(
            ['Available', 'Disabled', 'Assigned', 'AssignedRequired'],
            function (Index, ElementSelector) {
                $('#SelectAll' + ElementSelector + 'Elements').on('click', function () {
                    var Checked = $(this).prop('checked');

                    $('input:checkbox[name="Select' + ElementSelector + 'Element"]').filter(":visible").prop('checked', Checked);
                });
            }
        );

        // Set/unset checkbox "select all" depending on selected elements of a list.
        $.each(
            ['Available', 'Disabled', 'Assigned', 'AssignedRequired'],
            function (Index, ElementSelector) {
                $('input:checkbox[name="Select' + ElementSelector + 'Element"]').on(
                    'click',
                    function() {
                        var $ElementList = $(this).closest('ul'),
                            ElementType = $ElementList.attr('data-element-type'),
                            ElementCountOfList = $ElementList.find('li').length,
                            SelectedElementCountOfList = $ElementList.find('input:checkbox:checked').length;

                        // Note: Don't use ElementSelector for checkbox ID because the element
                        // could have been moved to another list.
                        if (SelectedElementCountOfList == ElementCountOfList) {
                            $('input:checkbox#SelectAll' + ElementType + 'Elements').prop('checked', true);
                            return;
                        }

                        $('input:checkbox#SelectAll' + ElementType + 'Elements').prop('checked', false);
                    }
                );
            }
        );

        // Assign selected elements to a list.
        $.each(
            ['Available', 'Disabled', 'Assigned', 'AssignedRequired'],
            function (Index, Target) {
                $('#AssignSelectedTo'+ Target + 'Elements').on(
                    'click',
                    function () {

                        // move all li to selected ul.
                        $('input:checkbox[name^="Select"]:checked').each(
                            function() {
                                var ElementID = $(this).val(),
                                    $Element;

                                if (!ElementID) return;

                                $Element = $('li#' + ElementID);
                                if (!$Element.length) return;

                                // Move element's li to selected list (ul).
                                $Element.appendTo('ul#'+ Target + 'Elements');

                                RenameElement($Element, Target);

                                // Regardless of filters: Show the elements that have been moved
                                // so the user knows what is happening.
                                $Element.show();
                            }
                        );

                        $('input:checkbox[id^="Select"]').prop('checked', false);
                    }
                );
            }
        );

        $('#Submit').on('click', function() {
            $('#Form').submit();
            return false;
        });
    };

    function UpdateFields(Event, UI) {
        var $Element = $(UI.item),
            Name     = $Element.parent().attr('data-element-type');

        RenameElement($Element, Name);
    }

    function RenameElement($Element, Name) {
        var ID = $Element.find('input:checkbox').val();

        // Label
        $Element.find('label').attr('for', 'Select' + Name + 'Element' + ID);

        // Checkbox name and ID
        $Element.find('input:checkbox').attr('name', 'Select' + Name + 'Element');
        $Element.find('input:checkbox').attr('id', 'Select' + Name + 'Element' + ID);

        // Hidden input
        $Element.find('input[type="hidden"]').attr('name', Name + 'Elements');
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Znuny.Agent.Admin.DynamicFieldScreenConfiguration || {}));
