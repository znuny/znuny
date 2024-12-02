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
 * @exports TargetNS as Znuny.Agent.Admin.DynamicFieldConfigurationImportExport
 */
Znuny.Agent.Admin.DynamicFieldConfigurationImportExport = (function (TargetNS) {

    TargetNS.Init = function () {

        // Initialize dynamic field filter
        Core.UI.Table.InitTableFilter($('#FilterDynamicFields'), $('#DynamicFieldsTable'));

        // Select all configurations.
        $('#SelectAllDynamicFieldConfigurations, #SelectAllDynamicFieldScreenConfigurations').on('click', function () {
            var Checked = $(this).prop('checked'),
                Type = $(this).attr('data-type');

            // Check only visible checkboxes.
            $('input:checkbox[name="' + Type + '"]:visible').prop('checked', Checked);
        });

        // Set/unset checkbox "select all" depending on selected configurations.
        $.each(
            ['DynamicFieldConfiguration', 'DynamicFieldScreenConfiguration'],
            function (Index, Type) {
                $('input:checkbox[name="' + Type + '"]').on(
                    'click',
                    function() {
                        var ElementCount         = $('input:checkbox[name="' + Type + '"]').length,
                            SelectedElementCount = $('input:checkbox[name="' + Type + '"]:checked').length;

                        if (SelectedElementCount == ElementCount) {
                            $('#SelectAll' + Type + 's').prop('checked', true);
                            return;
                        }

                        $('#SelectAll' + Type + 's').prop('checked', false);
                    }
                );
            }
        );
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;

}(Znuny.Agent.Admin.DynamicFieldConfigurationImportExport || {}));
