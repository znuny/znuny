// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core         = Core || {};
Core.Agent       = Core.Agent || {};
Core.Agent.Admin = Core.Agent.Admin || {};

/**
 * @namespace Core.Agent.Admin.TicketAttributeRelations
 * @memberof Core.Agent.Admin
 * @author Znuny GmbH
 */
Core.Agent.Admin.TicketAttributeRelations = (function (TargetNS) {

    /*
    * @name Init
    * @memberof Core.Agent.Admin.TicketAttributeRelations
    * @function
    * @description
    *      Initializes table filter.
    */
    TargetNS.Init = function () {
        InitTicketAttributeRelationsDeletionConfirmation();
    };

    function InitTicketAttributeRelationsDeletionConfirmation() {
        $('a[data-action="delete-ticket-attribute-relations"]').on('click', function() {
            var ConfirmationMessage = $(this).attr('data-confirmation-message'),
                DeletionURL = $(this).attr('data-url');

            Core.UI.Dialog.ShowDialog({
                Title:               Core.Language.Translate('Warning'),
                HTML:                ConfirmationMessage,
                Modal:               true,
                CloseOnClickOutside: false,
                CloseOnEscape:       true,
                PositionTop:         '100px',
                PositionLeft:        'Center',
                Buttons:             [
                    {
                        Label: Core.Language.Translate("Yes"),
                        Class: 'Primary',
                        Function: function () {
                            Core.UI.Dialog.CloseDialog($('.Dialog:visible'));
                            window.location.href = DeletionURL;
                        }
                    },
                    {
                        Label: Core.Language.Translate("Cancel"),
                        Function: function () {
                            Core.UI.Dialog.CloseDialog($('.Dialog:visible'));
                        }
                    }
                ]
            });
        });
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.Admin.TicketAttributeRelations || {}));
