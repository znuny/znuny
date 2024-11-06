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
Core.Customer = Core.Customer || {};

/**
 * @namespace Core.Customer.TicketZoom
 * @memberof Core.Customer
 * @author OTRS AG
 * @description
 *      This namespace contains all functions for CustomerTicketZoom.
 */
Core.Customer.TicketZoom = (function (TargetNS) {
    if (!Core.Debug.CheckDependency('Core.Customer', 'Core.UI.RichTextEditor', 'Core.UI.RichTextEditor')) {
        return false;
    }

    /**
     * @private
     * @name CalculateHeight
     * @memberof Core.Customer.TicketZoom
     * @function
     * @param {DOMObject} Iframe - DOM representation of an iframe
     * @description
     *      Sets the size of the iframe to the size of its inner html.
     */
    function CalculateHeight(Iframe){
        Iframe = isJQueryObject(Iframe) ? Iframe.get(0) : Iframe;

        setTimeout(function () {
            var $IframeContent = $(Iframe.contentWindow.document.body || Iframe.contentDocument || ''),
                NewHeight = $IframeContent.height();
            if (!NewHeight || isNaN(NewHeight)) {
                NewHeight = 100;
            }
            else {
                if (NewHeight > 2500) {
                    NewHeight = 2500;
                }
            }

            NewHeight = parseInt(NewHeight, 10) + 20;
            $(Iframe).height(NewHeight + 'px');
        }, 1500);
    }

    /**
     * @private
     * @name CalculateHeight
     * @memberof Core.Customer.TicketZoom
     * @function
     * @param {DOMObject} Iframe - DOM representation of an iframe
     * @param {Function} [Callback]
     * @description
     *      Resizes Iframe to its max inner height and (optionally) calls callback.
     */
    function ResizeIframe(Iframe, Callback){
        Iframe = isJQueryObject(Iframe) ? Iframe.get(0) : Iframe;
        CalculateHeight(Iframe);
        if ($.isFunction(Callback)) {
            Callback();
        }
    }

    /**
     * @private
     * @name CheckIframe
     * @memberof Core.Customer.TicketZoom
     * @function
     * @param {DOMObject} Iframe - DOM representation of an iframe
     * @param {Function} [Callback]
     * @description
     *      This function contains some workarounds for all browsers to get re-size the iframe.
     * @see http://sonspring.com/journal/jquery-iframe-sizing
     */
    function CheckIframe(Iframe, Callback){
        var Source;

        Iframe = isJQueryObject(Iframe) ? Iframe.get(0) : Iframe;

        if ($.browser.safari || $.browser.opera){
            $(Iframe).on('load', function() {
                setTimeout(ResizeIframe, 0, Iframe, Callback);
            });
            Source = Iframe.src;
            Iframe.src = '';
            Iframe.src = Source;
        }
        else {
            $(Iframe).on('load', function() {
                ResizeIframe(this, Callback);
            });
        }
    }

    /**
     * @private
     * @name LoadMessage
     * @memberof Core.Customer.TicketZoom
     * @function
     * @param {jQueryObject} $Message
     * @description
     *      This function is called when an articles should be loaded. Our trick is, to hide the
     *      url of a containing iframe in the title attribute of the iframe so that it doesn't load
     *      immediately when the site loads. So we set the url in this function.
     */
    function LoadMessage($Message){

        var $SubjectHolder = $('span h3', $Message),
            Subject       = $SubjectHolder.text(),
            LoadingString = $SubjectHolder.attr('title'),
            $SourceIframe = $('.Iframe iframe', $Message).clone(),
            Source        = $SourceIframe.attr('title'),
            $Iframe;

        var $MessageContent = $Message.clone().html();

        $('#VisibleMessageContent').html($MessageContent);
        $('#VisibleMessageContent .ArticleBody').addClass('Hidden');
        $('#VisibleMessageContent .Iframe').removeClass('Hidden');

        $Iframe = $('#VisibleMessageContent iframe');

        /*  Change Subject to Loading */
        $SubjectHolder.text(LoadingString);

        /*  Load iframe -> get title and put it in src */
        if (Source !== 'about:blank') {
            $Iframe.attr('src', Source);
        }

        function Callback(){

            /*  Add class Visible */
            $Message.addClass('Visible');

            /*  Change Subject back from Loading */
            $SubjectHolder.text(Subject).attr('title', Subject);
            $('#Subject').val('Re: ' + Subject).attr('title', Subject);
        }

        if ($Iframe.length) {
            CheckIframe($Iframe, Callback);
        }
        else {
            Callback();
        }
    }

    /**
     * @private
     * @name ToggleMessage
     * @memberof Core.Customer.TicketZoom
     * @function
     * @param {jQueryObject} $Message
     * @description
     *      This function always load given article in iframe.
     */
    function ToggleMessage($Message){
        var ActiveScreenSize;

        $('#Messages li').removeClass('Visible');
        $Message.addClass('Visible');
        LoadMessage($Message);

        ActiveScreenSize = Core.Config.Get('ActiveScreenSize');
        if (ActiveScreenSize && ActiveScreenSize !== 'ScreenXL'){
            $('#FollowUp').detach().appendTo('.Visible');
        }
    }

    /**
     * @name Init
     * @memberof Core.Customer.TicketZoom
     * @function
     * @description
     *      This function binds functions to the 'MessageHeader' and the 'Reply' button
     *      to toggle the visibility of the MessageBody and the reply form.
     *      Also it checks the iframes to re-size them to their full (inner) size
     *      and hides the quotes inside the iframes + adds an anchor to toggle the visibility of the quotes.
     *      Furthermore it execute field updates, add and remove of attachments.
     */
    TargetNS.Init = function(){
        var $FollowUp = $('#FollowUp'),
            $RTE = $('#RichText'),
            $Form,
            FieldID,
            DynamicFieldNames = Core.Config.Get('DynamicFieldNames');

        ToggleMessage($('#Messages li:last'));

        $('#Messages li').on('click', function(Event){
            ToggleMessage($(this));
            Event.preventDefault();
        });
        $('#ReplyButton').on('click', function(Event){
            Event.preventDefault();
            $FollowUp.addClass('Visible');
            $('html').css({scrollTop: $('#Body').height()});
            Core.UI.RichTextEditor.Focus($RTE);
        });
        $('#CloseButton').on('click', function(Event){
            Event.preventDefault();
            $FollowUp.removeClass('Visible');
            $('html').css({scrollTop: $('#Body').height()});
        });

        // init browser link message close button
        if ($('.MessageBrowser').length) {
            $('.MessageBrowser a.Close').on('click', function () {
                var Data = {
                    Action: 'CustomerTicketZoom',
                    Subaction: 'BrowserLinkMessage',
                    TicketID: $('input[name=TicketID]').val()
                };

                $('.MessageBrowser').fadeOut("slow");

                // call server, to save that the bo was closed and do not show it again on reload
                Core.AJAX.FunctionCall(
                    Core.Config.Get('CGIHandle'),
                    Data,
                    function () {}
                );

                return false;
            });
        }

        // Bind event to State field.
        $('#StateID').on('change', function () {
            Core.AJAX.FormUpdate($('#ReplyCustomerTicket'), 'AJAXUpdate', 'StateID', ['PriorityID', 'TicketID'].concat(DynamicFieldNames));
        });

        // Bind event to Priority field.
        $('#PriorityID').on('change', function () {
            Core.AJAX.FormUpdate($('#ReplyCustomerTicket'), 'AJAXUpdate', 'PriorityID', ['StateID', 'TicketID'].concat(DynamicFieldNames));
        });

        // Bind event to AttachmentUpload button.
        $('#Attachment').on('change', function () {
            var $Form = $('#Attachment').closest('form');
            Core.Form.Validate.DisableValidation($Form);
            $Form.find('#AttachmentUpload').val('1').end().submit();
        });

        // Bind event to AttachmentDelete button.
        $('button[id*=AttachmentDeleteButton]').on('click', function () {
            $Form = $(this).closest('form');
            FieldID = $(this).attr('id').split('AttachmentDeleteButton')[1];
            $('#AttachmentDelete' + FieldID).val(1);
            Core.Form.Validate.DisableValidation($Form);
            $Form.trigger('submit');
        });

        $('a.AsPopup').on('click', function () {
            Core.UI.Popup.OpenPopup($(this).attr('href'), 'TicketAction');
            return false;
        });

        Core.App.Subscribe('Event.App.Responsive.ScreenXL', function () {
            if ($('#FollowUp')) {
                $('#FollowUp').detach().appendTo('.main-content-wrapper');
            }
        });

        Core.App.Subscribe('Event.App.Responsive.SmallerOrEqualScreenL', function () {
            if ($('#FollowUp')) {
                $('#FollowUp').detach().appendTo('.Visible');
            }
        });
    };

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Customer.TicketZoom || {}));
