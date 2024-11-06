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

Znuny.Agent.TicketMention = (function (TargetNS) {

    TargetNS.Init = function () {
        var Data = {
            Action:    'Mentions',
            Subaction: 'Remove',
            BulkAction: 1
        };

        $('#RemoveMention').on('click',function(Event){
            Event.preventDefault();

            $('.MasterAction').each(function(){
                var TicketID  = $(this).attr('id').replace('TicketID_', '');
                Data.TicketID = TicketID;

                if($(this).children().first().children().first().prop('checked')) {
                    Core.AJAX.FunctionCall(
                        Core.Config.Get('Baselink'),
                        Data,
                        function() {
                            location.reload();
                        }
                    )
                }
            });
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Znuny.Agent.TicketMention || {}));
