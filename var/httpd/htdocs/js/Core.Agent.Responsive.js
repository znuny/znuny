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
 * @namespace Core.Agent.Responsive
 * @memberof Core.Agent
 * @author OTRS AG
 * @description
 *      This namespace contains the responsive functionality.
 */
Core.Agent.Responsive = (function (TargetNS) {

    Core.App.Subscribe('Event.App.Responsive.SmallerOrEqualScreenL', function () {
        // Add switch for Desktop mode
        if (!$('#ViewModeSwitch').length) {
            $('#Footer').append('<div id="ViewModeSwitch"><a href="#">' + Core.Language.Translate('Switch to desktop mode') + '</a></div>');
            $('#ViewModeSwitch a').on('click.Responsive', function() {
                localStorage.setItem("DesktopMode", 1);
                location.reload(true);
                return false;
            });
        }

        // hide graphs as they're not properly supported on mobile devices
        $('.D3GraphMessage, .D3GraphCanvas').closest('.WidgetSimple').hide();

        // Add trigger icon for pagination
        $('span.Pagination a:first-child').parent().closest('.WidgetSimple').each(function() {
            if (!$(this).find('.ShowPagination').length) {
                $(this).find('.wrapper-widget-close').after('<li><div class="WidgetAction ShowPagination"><a title="Close" href=""><span class="iconWrapper"><i class="fa fa-angle-right"></i></span><span class="textWrapper">Pagination</span></a></div></li>');
            }
        });

        $('.WidgetAction.ShowPagination').off('click.Responsive').on('click.Responsive', function() {
            $(this).closest('.WidgetSimple').find('.Pagination').toggleClass('AsBlock');
            return false;
        });

        // wrap sidebar modules with an additional container
        if ($('.SidebarColumn').children().length && !$('.SidebarColumn').closest('.ResponsiveSidebarContainer').length) {
            $('.SidebarColumn').wrap('<div class="ResponsiveSidebarContainer" />');
        }
        if (!$('#NavigationContainer').closest('.ResponsiveSidebarContainer').length) {
            $('#NavigationContainer').wrap('<div class="ResponsiveSidebarContainer" />');
        }

        // make sure the relevant sidebar is being collapsed on clicking
        // on the background
        $('.ResponsiveSidebarContainer').off().on('click', function(Event) {

            // only react on a direct click on the background
            if (Event.target !== this) {
                return;
            }

            $(this).prev('.ResponsiveHandle').trigger('click');
        });

        // add handles for navigation and sidebar
        if (!$('#ResponsiveSidebarHandle').length) {
            $('.SidebarColumn').closest('.ResponsiveSidebarContainer').before('<span class="ResponsiveHandle" id="ResponsiveSidebarHandle"><i class="fa fa-sign-out"></i></span>');
        }
        if (!$('#ResponsiveNavigationHandle').length) {
            $('#NavigationContainer').closest('.ResponsiveSidebarContainer').before('<span class="ResponsiveHandle" id="ResponsiveNavigationHandle"><i class="fa fa-navicon"></i></span>');
        }

        // add navigation sidebar expansion handling
        $('#ResponsiveNavigationHandle').off().on('click', function() {
            if (parseInt($('#NavigationContainer').css('left'), 10) < 0 || parseInt($('#NavigationContainer').css('left'), 10) === 10) {
                $('#ResponsiveSidebarHandle').animate({
                    'right': '-45px'
                });
                $('#NavigationContainer').closest('.ResponsiveSidebarContainer').fadeIn();
                $('html').addClass('NoScroll');
                $('#NavigationContainer').animate({
                    'left': '0'
                });
            }
            else {
                $('#ResponsiveSidebarHandle').animate({
                    'right': '20px'
                });
                $('#NavigationContainer').closest('.ResponsiveSidebarContainer').fadeOut();
                $('html').removeClass('NoScroll');
                $('#NavigationContainer').animate({
                    'left': '-280px'
                });
            }
            return false;
        });

        // add sidebar column expansion handling
        $('#ResponsiveSidebarHandle').off().on('click', function() {
            if (parseInt($('.SidebarColumn').css('right'), 10) < 0) {
                $('#ResponsiveNavigationHandle').animate({
                    'left': '-45px'
                });
                $('.SidebarColumn').closest('.ResponsiveSidebarContainer').fadeIn();
                $('html').addClass('NoScroll');
                $('.SidebarColumn').animate({
                    'right': '0'
                });
            }
            else {
                $('#ResponsiveNavigationHandle').animate({
                    'left': '20px'
                });
                $('.SidebarColumn').closest('.ResponsiveSidebarContainer').fadeOut();
                $('html').removeClass('NoScroll');
                $('.SidebarColumn').animate({
                    'right': '-300px'
                });
            }
            return false;
        });

        // check if there are any changes in the sidebar that we should notify the user about
        Core.App.Subscribe('Event.Agent.CustomerSearch.GetCustomerInfo.Callback', function() {
            $('#ResponsiveSidebarHandle').after('<span class="ResponsiveHandle" id="ResponsiveSidebarNotification"><i class="fa fa-exclamation"></i></span>');
            $('#ResponsiveSidebarNotification').fadeIn().delay(3000).fadeOut(function() {
                $(this).remove();
            });
        });

        // hide options on ticket creations
        $('#OptionCustomer').closest('.Field').hide().prev('label').hide();

        // initially hide navigation container
        $('#NavigationContainer').css('left', '-280px');


        $('#HeaderToolBar').detach().prependTo('#NavigationContainer');
        $('.InnerSidebarColumn').detach().insertAfter('.WidgetActions');
        $('#Logo').detach().prependTo('#Header');
        $('.NotificationIcon').click(function() {
            $('body').toggleClass("ShowNotificationList");
        });

        // make fields which have a following icon not as wide as other fields
        $('.FormScreen select').each(function() {
            if ($(this).nextAll('a:visible:not(".DatepickerIcon")').length) {
                $(this).css('width', '85%');
            }
        });

        // Collapse widgets in preferences screen for better overview
        $('.PreferencesScreen .Size1of3 > .WidgetSimple').removeClass('Expanded').addClass('Collapsed');
    });

    Core.App.Subscribe('Event.App.Responsive.ScreenXL', function () {

        // remove show pagination trigger icons
        $('.WidgetAction.ShowPagination, #ViewModeSwitch').remove();

        // show graphs again
        if (!$('.D3GraphMessage, .D3GraphCanvas').closest('.WidgetSimple').hasClass('Hidden')) {
            $('.D3GraphMessage, .D3GraphCanvas').closest('.WidgetSimple').show();
        }

        // remove the additional container again
        $('.ResponsiveSidebarContainer').children('.SidebarColumn, #NavigationContainer').unwrap();

        $('#OptionCustomer').closest('.Field').show().prev('label').show();

        // reset navigation container position
        $('#NavigationContainer').detach().prependTo('#Header');

        // re-add toolbar to header
        $('#Logo').detach().prependTo('#NavigationContainer');

        // reset field widths
        $('.FormScreen select').each(function() {
            if ($(this).nextAll('a:visible:not(".DatepickerIcon")').length) {
                $(this).css('width', '');
            }
        });

        // re-expand widgets in preferences screen
        $('.PreferencesScreen .WidgetSimple').removeClass('Collapsed').addClass('Expanded');

    });

    // MOBILE - Show Actions Menu

    //open
    $('.mobile-action-option').on('click', function() {
        $('body').addClass('has-options-overlay-opened');
        $('html').addClass('NoScroll');
        $(this).closest('.ItemActions, .ActionRow').addClass('active');
    });

    //close
    $('.Actions-close, .btn-collapse').on('click', function() {
        $('body').removeClass('has-options-overlay-opened');
        $('html').removeClass('NoScroll');
        $(this).closest('.ItemActions, .ActionRow').removeClass('active');
    });



    return TargetNS;

}(Core.Agent.Responsive || {}));
