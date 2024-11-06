// --
// Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
// Copyright (C) 2021 Znuny GmbH, https://znuny.org/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (GPL). If you
// did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
// --

"use strict";

var Core  = Core || {},
    Znuny = Znuny || {};

Core.UI = Core.UI || {};

/**
 * @namespace Core.UI.RichTextEditor
 * @memberof Core.UI
 * @author OTRS AG
 * @description
 *      Richtext Editor.
 */
Core.UI.RichTextEditor = (function (TargetNS) {
    /**
     * @private
     * @name $FormID
     * @memberof Core.UI.RichTextEditor
     * @member {jQueryObject}
     * @description
     *      Hidden input field with name FormID.
     */
    var $FormID,

    /**
     * @private
     * @name TimeOutRTEOnChange
     * @memberof Core.UI.RichTextEditor
     * @member {Object}
     * @description
     *      Object to handle timeout.
     */
        TimeOutRTEOnChange;

    /**
     * @private
     * @name CheckFormID
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {jQueryObject} FormID element.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that has become a rich text editor.
     * @description
     *      Check in the window which hidden element has a name same to 'FormID' and return it like a JQuery object.
     */
    function CheckFormID($EditorArea) {
        if (typeof $FormID === 'undefined') {
            $FormID = $EditorArea.closest('form').find('input:hidden[name=FormID]');
        }
        return $FormID;
    }

    /**
     * @private
     * @name InitAutocompletion
     * @memberof Core.UI.RichTextEditor
     * @function
     * @param { Editor } Editor - The editor object.
     * @description
     *      Initializes autocompletion for editor, if configured.
     */
    function InitAutocompletion(Editor) {
        var AutocompletionSettings = {};

        // CodeMirror does not load any other plugins, so the autocomplete plugin is not available then
        if (Core.Config.Get('RichText.Type') == 'CodeMirror') {
            return;
        }

        function AutocompletionDataCallback(MatchInfo, Callback) {
            $.each(AutocompletionSettings.Triggers, function (Trigger) {

                // Always take the current values because they could have been changed by
                // the user in the form.
                var AdditionalParams = {
                    TicketID: $('input[name="TicketID"]').val(), // optional, if present
                    Action: $('input[name="Action"]').val(), // optional, if present
                    QueueID: Znuny.Form.Input.Get('QueueID') // optional, if present
                };
                var SearchString,
                    RegExEscapedTrigger = EscapeRegExpCharacters(Trigger);

                if (!MatchInfo.query.match(new RegExp('^' + RegExEscapedTrigger))) {
                    return;
                }

                SearchString = MatchInfo.query.replace(new RegExp('^' + RegExEscapedTrigger), '');
                if (SearchString.length < AutocompletionSettings.MinSearchLength) {
                    return;
                }

                Core.AJAX.FunctionCall(
                    Core.Config.Get('Baselink'),
                    {
                        Action:           'AJAXRichTextAutocompletion',
                        Subaction:        'GetData',
                        Trigger:          Trigger,
                        SearchString:     SearchString,
                        AdditionalParams: AdditionalParams
                    },
                    function(Response){
                        if (!Array.isArray(Response)) {
                            return;
                        }

                        Callback(Response);
                    }
                );
            });
        }

        function AutocompletionTextTestCallback(Range) {
            if (!Range.collapsed) {
                return null;
            }

            return CKEDITOR.plugins.textMatch.match(Range, AutocompletionMatchCallback);
        }

        function AutocompletionMatchCallback(Text, Offset) {
            var TriggerMatch;

            $.each(AutocompletionSettings.Triggers, function(Trigger) {
                var RegExEscapedTrigger = EscapeRegExpCharacters(Trigger);

                if (TriggerMatch) {
                    return;
                }

                TriggerMatch = Text.match(new RegExp('(?:^|\\s+)(' + RegExEscapedTrigger + '\\S+)$'));
            });

            if (!TriggerMatch || TriggerMatch.length != 2) {
                return;
            }

            return {
                start: Offset - TriggerMatch[1].length,
                end:   Offset
            };
        }

        // Taken from: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions
        function EscapeRegExpCharacters(String) {
            return String.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // $& means the whole matched string
        }

        // Ensure that HTML will be inserted as HTML, not as text
        // by overwriting the autocomplete plugin's function getHtmlToInsert.
        CKEDITOR.plugins.autocomplete.prototype.getHtmlToInsert = function(item) {
            return this.outputTemplate ? this.outputTemplate.output(item) : item.name;
        };

        // Initialize CKEditor autocompletion.
        Core.AJAX.FunctionCall(
            Core.Config.Get('Baselink'),
            {
                Action:    'AJAXRichTextAutocompletion',
                Subaction: 'GetAutocompletionSettings'
            },
            function(Response) {
                var CKEditorConfig;

                if ($.isEmptyObject(Response)) {
                    return true;
                }

                AutocompletionSettings = Response;

                CKEditorConfig = {
                    textTestCallback: AutocompletionTextTestCallback,
                    dataCallback    : AutocompletionDataCallback,
                    itemTemplate    : AutocompletionSettings.ItemTemplate,
                    outputTemplate  : AutocompletionSettings.OutputTemplate
                };

                new CKEDITOR.plugins.autocomplete(Editor.editor, CKEditorConfig);
            }
        );
    }

    /**
     * @name InitEditor
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {Boolean} Returns false on error.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that will be a rich text editor.
     * @description
     *      This function initializes the application and executes the needed functions.
     */
    TargetNS.InitEditor = function ($EditorArea) {
        var EditorID = '',
            Editor,
            UserLanguage,
            UploadURL = '',
            EditorConfig,
            RemovedCKEditorPlugins = '',
            MentionsConfig = Core.Config.Get('Mentions::RichTextEditor');

        if (typeof CKEDITOR === 'undefined') {
            return false;
        }

        if (isJQueryObject($EditorArea) && $EditorArea.hasClass('HasCKEInstance')) {
            return false;
        }

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        if (MentionsConfig) {
            $("<input name='MentionRecipients' type='hidden'>").appendTo($('textarea.RichText').closest('form'));
            $("<input name='MentionGroups' type='hidden'>").appendTo($('textarea.RichText').closest('form'));

            CKEDITOR.config.mentions = [
                {
                    feed:           getMentionUserData,
                    marker:         MentionsConfig.Triggers.User,
                    itemTemplate:   MentionsConfig.Templates.Users.ItemTemplate,
                    outputTemplate: MentionsConfig.Templates.Users.OutputTemplate
                },
                {
                    feed:           getMentionGroupData,
                    marker:         MentionsConfig.Triggers.Group,
                    itemTemplate:   MentionsConfig.Templates.Groups.ItemTemplate,
                    outputTemplate: MentionsConfig.Templates.Groups.OutputTemplate
                }
            ];
        }

        // mark the editor textarea as linked with an RTE instance to avoid multiple instances
        $EditorArea.addClass('HasCKEInstance');

        CKEDITOR.on('instanceCreated', function (Editor) {
            CKEDITOR.addCss(Core.Config.Get('RichText.EditingAreaCSS'));

            // Remove the validation error tooltip if content is added to the editor
            Editor.editor.on('change', function() {
                window.clearTimeout(TimeOutRTEOnChange);
                TimeOutRTEOnChange = window.setTimeout(function () {
                    Core.Form.Validate.ValidateElement($(Editor.editor.element.$));
                    Core.App.Publish('Event.UI.RichTextEditor.ChangeValidationComplete', [Editor]);
                }, 250);
            });

            Core.App.Publish('Event.UI.RichTextEditor.InstanceCreated', [Editor]);
        });

        CKEDITOR.on('instanceReady', function (Editor) {
            InitAutocompletion(Editor);


            // specific config for CodeMirror instances (e.g. XSLT editor)
            if (Core.Config.Get('RichText.Type') == 'CodeMirror') {

                // The width of a tab character. Defaults to 4.
                window[ 'codemirror_' + Editor.editor.id ].setOption("tabSize", 4);

                // How many spaces a block (whatever that means in the edited language) should be indented. The default is 2.
                window[ 'codemirror_' + Editor.editor.id ].setOption("indentUnit", 4);

                // Whether to use the context-sensitive indentation that the mode provides (or just indent the same as the line before). Defaults to true.
                window[ 'codemirror_' + Editor.editor.id ].setOption("tabMode", 'spaces');
                window[ 'codemirror_' + Editor.editor.id ].setOption("smartIndent", true);

                // convert tabs to spaces
                window[ 'codemirror_' + Editor.editor.id ].setOption("extraKeys", {
                    Tab: function(cm) {
                        var spaces = Array(cm.getOption("indentUnit") + 1).join(" ");
                        cm.replaceSelection(spaces);
                    }
                });
            }

            Core.App.Publish('Event.UI.RichTextEditor.InstanceReady', [Editor]);
        });

        // The format for the language is different between OTRS and CKEditor (see bug#8024)
        // To correct this, we replace "_" with "-" in the language (e.g. zh_CN becomes zh-cn)
        UserLanguage = Core.Config.Get('UserLanguage').replace(/_/, "-");

        // build URL for image upload
        if (CheckFormID($EditorArea).length) {

            UploadURL = Core.Config.Get('Baselink')
                    + 'Action='
                    + Core.Config.Get('RichText.PictureUploadAction', 'PictureUpload')
                    + '&FormID='
                    + CheckFormID($EditorArea).val()
                    + '&' + Core.Config.Get('SessionName')
                    + '=' + Core.Config.Get('SessionID');
        }

        // set default editor config, but allow custom config for other types for editors
        /*eslint-disable camelcase */
        RemovedCKEditorPlugins = 'devtools,image,flash,mathjax,embed,embedsemantic,exportpdf,sourcedialog,bbcode,divarea,elementspath,stylesheetparser,autogrow';
        if (!CheckFormID($EditorArea).length) {
            RemovedCKEditorPlugins += ',uploadimage';
        }

        EditorConfig = {
            // customConfig:           '', // avoid loading external config files
            versionCheck:              false,
            disableNativeSpellChecker: false,
            defaultLanguage:           UserLanguage,
            language:                  UserLanguage,
            width:                     Core.Config.Get('RichText.Width', 620),
            resize_minWidth:           Core.Config.Get('RichText.Width', 620),
            height:                    Core.Config.Get('RichText.Height', 320),
            removePlugins:             RemovedCKEditorPlugins,
            forcePasteAsPlainText:     false,
            format_tags:               Core.Config.Get('RichText.FormatTags', 'p;h1;h2;h3;h4;h5;h6;pre'),
            fontSize_sizes:            Core.Config.Get('RichText.FontSizes', '8px;10px;12px;14px;16px;18px;20px;22px;24px;26px;28px;30px;'),
            font_names:                Core.Config.Get('RichText.FontNames', ''),
            extraAllowedContent:       Core.Config.Get('RichText.ExtraAllowedContent', 'div[type]{*}; img[*]; col[width]; style[*]{*}; *[id](*)'),
            enterMode:                 CKEDITOR.ENTER_BR,
            shiftEnterMode:            CKEDITOR.ENTER_BR,
            contentsLangDirection:     Core.Config.Get('RichText.TextDir', 'ltr'),
            toolbar:                   CheckFormID($EditorArea).length ? Core.Config.Get('RichText.Toolbar') : Core.Config.Get('RichText.ToolbarWithoutImage'),
            filebrowserBrowseUrl:      '',
            filebrowserUploadUrl:      UploadURL,
            extraPlugins:              Core.Config.Get('RichText.ExtraPlugins', 'splitquote,contextmenu_linkopen'),
            entities:                  false,
            skin:                      'moono-lisa',
            contentsCss:               [ Core.Config.Get('RichText.ContentsCss', '') ]
        };
        /*eslint-enable camelcase */

        // specific config for CodeMirror instances (e.g. XSLT editor)
        if (Core.Config.Get('RichText.Type') == 'CodeMirror') {
            $.extend(EditorConfig, {

                /*eslint-disable camelcase */
                startupMode:    'source',
                allowedContent: true,
                extraPlugins:   'codemirror',
                codemirror:     {
                    theme:                  'default',
                    lineNumbers:            true,
                    lineWrapping:           true,
                    matchBrackets:          true,
                    autoCloseTags:          true,
                    autoCloseBrackets:      true,
                    enableSearchTools:      true,
                    enableCodeFolding:      true,
                    enableCodeFormatting:   true,
                    autoFormatOnStart:      false,
                    autoFormatOnModeChange: false,
                    autoFormatOnUncomment:  false,
                    mode:                   'htmlmixed',
                    showTrailingSpace:      true,
                    highlightMatches:       true,
                    styleActiveLine:        true
                }
                /*eslint-disable camelcase */

            });
        }

        Editor = CKEDITOR.replace(EditorID, EditorConfig);

        // check if creating CKEditor was successful
        // might be a problem on mobile devices e.g.
        if (typeof Editor !== 'undefined') {

            // Hack for updating the textarea with the RTE content (bug#5857)
            // Rename the original function to another name, than overwrite the original one
            CKEDITOR.instances[EditorID].updateElementOriginal = CKEDITOR.instances[EditorID].updateElement;
            CKEDITOR.instances[EditorID].updateElement = function() {
                var Data;

                // First call the original function
                CKEDITOR.instances[EditorID].updateElementOriginal();

                // Now check if there is actually any non-whitespace content in the
                //  textarea field. If not, set it to an empty value to make sure
                //  the server side validation works correctly and there is no trash
                //  like '<br/>' stored in the DB.
                Data = this.element.getValue(); // get textarea content

                // only if codemirror plugin is not used (for XSLT editor)
                // or
                // if data contains no image tag,
                // this is important for inline images, we don't want to remove them!
                if (typeof CKEDITOR.instances[EditorID].config.codemirror === 'undefined' && !Data.match(/<img/)) {

                    // remove tags and whitespace for checking
                    Data = Data.replace(/\s+|&nbsp;|<\/?\w+[^>]*\/?>/g, '');
                    if (!Data.length) {
                        this.element.setValue(''); // reset textarea
                    }
                }
            };

            // Redefine 'writeCssText' function because of unnecessary sorting of CSS properties (bug#12848).
            /* eslint-disable no-unused-vars */
            CKEDITOR.tools.writeCssText = function (styles, sort) {
                var name,
                stylesArr = [];

                for (name in styles)
                    stylesArr.push(name + ':' + styles[name]);

                // This block sorts CSS properties which can make a wrong CSS style sent to CKEditor.
                // if ( sort )
                //     stylesArr.sort();

                return stylesArr.join('; ');
            };
            /* eslint-enable no-unused-vars */

            // Needed for clientside validation of RTE
            CKEDITOR.instances[EditorID].on('blur', function () {
                CKEDITOR.instances[EditorID].updateElement();
                if (!$EditorArea.hasClass('Error')) {
                    Core.Form.Validate.ValidateElement($EditorArea);
                }
            });

            // needed for client-side validation
            CKEDITOR.instances[EditorID].on('focus', function () {

                Core.App.Publish('Event.UI.RichTextEditor.Focus', [Editor]);

                if ($EditorArea.attr('class').match(/Error/)) {
                    window.setTimeout(function () {
                        CKEDITOR.instances[EditorID].updateElement();
                        Core.Form.Validate.ValidateElement($EditorArea);
                        Core.App.Publish('Event.UI.RichTextEditor.FocusValidationComplete', [Editor]);
                    }, 0);
                }
            });

            // mainly needed for client-side validation
            $EditorArea.focus(function () {
                TargetNS.Focus($EditorArea);
                Core.UI.ScrollTo($("label[for=" + $EditorArea.attr('id') + "]"));
            });
        }
    };

    /**
     * @name InitAllEditors
     * @memberof Core.UI.RichTextEditor
     * @function
     * @description
     *      This function initializes as a rich text editor every textarea element that containing the RichText class.
     */
    TargetNS.InitAllEditors = function () {
        if (typeof CKEDITOR === 'undefined') {
            return;
        }

        $('textarea.RichText').each(function () {
            TargetNS.InitEditor($(this));
        });
    };

    /**
     * @name Init
     * @memberof Core.UI.RichTextEditor
     * @function
     * @description
     *      This function initializes JS functionality.
     */
    TargetNS.Init = function () {
        if (typeof CKEDITOR === 'undefined') {
            return;
        }

        TargetNS.InitAllEditors();
    };

    /**
     * @name GetRTE
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {jQueryObject} jQuery object of the corresponsing RTE element.
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      Get RTE jQuery element.
     */
    TargetNS.GetRTE = function ($EditorArea) {
        var $RTE;

        if (isJQueryObject($EditorArea)) {
            $RTE = $('#cke_' + $EditorArea.attr('id'));
            return ($RTE.length ? $RTE : undefined);
        }
    };

    /**
     * @name UpdateLinkedField
     * @memberof Core.UI.RichTextEditor
     * @function
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function updates the linked field for a rich text editor.
     */
    TargetNS.UpdateLinkedField = function ($EditorArea) {
        var EditorID = '',
            Data,
            StrippedContent;

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        Data = CKEDITOR.instances[EditorID].getData();
        StrippedContent = Data.replace(/\s+|&nbsp;|<\/?\w+[^>]*\/?>/g, '');

        if (StrippedContent.length === 0 && !Data.match(/<img/)) {
            $EditorArea.val('');
        }
        else {
            $EditorArea.val(Data);
        }
    };

    /**
     * @name IsEnabled
     * @memberof Core.UI.RichTextEditor
     * @function
     * @returns {Boolean} True if RTE is enabled, false otherwise
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function check if a rich text editor is enable in this moment.
     */
    TargetNS.IsEnabled = function ($EditorArea) {
        if (typeof CKEDITOR === 'undefined') {
            return false;
        }

        if (isJQueryObject($EditorArea) && $EditorArea.length) {
            return (CKEDITOR.instances[$EditorArea[0].id] ? true : false);
        }
        return false;
    };

    /**
     * @name Focus
     * @memberof Core.UI.RichTextEditor
     * @function
     * @param {jQueryObject} $EditorArea - The jQuery object of the element that is a rich text editor.
     * @description
     *      This function focusses the given RTE.
     */
    TargetNS.Focus = function ($EditorArea) {
        var EditorID = '';

        if (isJQueryObject($EditorArea) && $EditorArea.length === 1) {
            EditorID = $EditorArea.attr('id');
        }

        if (EditorID === '') {
            Core.Exception.Throw('RichTextEditor: Need exactly one EditorArea!', 'TypeError');
        }

        if (typeof CKEDITOR === 'object') {
            CKEDITOR.instances[EditorID].focus();
        }
        else {
            $EditorArea.focus();
        }
    };

    function getMentionUserData(opts, callback) {
        Core.AJAX.FunctionCall(
            Core.Config.Get('Baselink'),
            {
                Action:     'Mentions',
                Subaction:  'GetUsers',
                SearchTerm: opts.query
            },
            function(Response) {
                callback(
                    $.each(Response.Users, function(User) {
                        return User.name;
                    })
                )
            }
        );
    }

    function getMentionGroupData(opts, callback) {
        Core.AJAX.FunctionCall(
            Core.Config.Get('Baselink'),
            {
                Action:     'Mentions',
                Subaction:  'GetGroups',
                SearchTerm: opts.query
            },
            function(Response){
                callback(
                    $.each(Response.Groups,function(Group) {
                        return Group.name;
                    })
                );
            }
        )
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.UI.RichTextEditor || {}));
