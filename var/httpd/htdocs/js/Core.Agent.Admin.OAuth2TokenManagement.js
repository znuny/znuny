// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core   = Core || {};

Core.Agent = Core.Agent || {};
Core.Agent.Admin = Core.Agent.Admin || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.Admin.OAuth2TokenManagement
 * @description
 *      This namespace contains the special functions for OAuth2TokenManagement.
 */
Core.Agent.Admin.OAuth2TokenManagement = (function (TargetNS) {

    TargetNS.Init = function () {

        Core.UI.Table.InitTableFilter($("#FilterTokens"), $("#OAuth2Tokens"));

        // Adding token configuration based on template file
        $('#TokenConfigTemplateFilePath').on('change', function() {
            var TokenConfigTemplateFilename = $(this).val(),
                URL = Core.Config.Get('Baselink') + 'Action=AdminOAuth2TokenManagement;Subaction=AddTokenConfigByTemplateFile;TokenConfigTemplateFilename=' + TokenConfigTemplateFilename;

            window.location = URL;
        });

        // Authorization code request
        $('a.AsPopup.PopupType_AdminOAuth2TokenManagement').on('click', function() {
            var PopupType = 'AdminOAuth2TokenManagement';

            Core.UI.Popup.OpenPopup(
                $(this).attr('href'),
                PopupType
            );

            return false;
        });

        // Deletion of token config and its token
        $('a[data-action-delete-token-config]').on('click', function (Event) {
            if (window.confirm(Core.Language.Translate("Do you really want to delete this token and its configuration?"))) {
                $(this).addClass('Disabled');
                return true;
            }

            Event.stopPropagation();
            Event.preventDefault();
            return false;
        });

        return true;
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.Admin.OAuth2TokenManagement || {}));
