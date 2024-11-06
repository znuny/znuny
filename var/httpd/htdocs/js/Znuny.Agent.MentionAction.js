// --
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core = Core || {},
    Znuny = Znuny || {};

Znuny.Agent = Znuny.Agent || {};

Znuny.Agent.MentionAction = (function (TargetNS) {

    TargetNS.Init = function () {
        var Data = {
            Action:    'Mentions',
            Subaction: 'Remove',
            TicketID:  Core.Config.Get("TicketID")
        };

        $('.MentionRow').each(function() {
            $(this).on('click', function(Event) {
                Event.preventDefault();
                Data.MentionedUserID = $(this).attr('data-user-id');

                Core.AJAX.FunctionCall(
                    Core.Config.Get('Baselink'),
                    Data,
                    function() {
                        location.reload();
                    }
                )
            });
       });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Znuny.Agent.MentionAction || {}));
