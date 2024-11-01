# --
# Copyright (C) 2006-2009 Amir Shams Parsa <a.parsa at gmail.com>
# Copyright (C) 2008 Hooman Mesgary <info at mesgary.com>
# Copyright (C) 2009 Afshar Mohebbi <afshar.mohebbi at gmail.com>
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Translation::JavaScriptStrings)

package Kernel::Language::fa;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D.%M.%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %T %Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.617564672927995;

    # csv separator
    $Self->{Separator}         = '';

    $Self->{DecimalSeparator}  = '';
    $Self->{ThousandSeparator} = '';
    # TextDirection rtl or ltr
    $Self->{TextDirection} = 'rtl';

    $Self->{Translation} = {

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt
        'Actions' => 'عملیات‌ها',
        'Create New ACL' => 'ایجاد ACL جدید ',
        'Deploy ACLs' => 'استقرار ACL ها',
        'Export ACLs' => 'صادرات ACL ها',
        'Filter for ACLs' => 'فیلتر برای ACL ها',
        'Just start typing to filter...' => 'فقط شروع به تایپ برای فیلتر ...',
        'Configuration Import' => 'دریافت پیکربندی',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'در اینجا شما می توانید یک فایل پیکربندی برای ورود ACL ها  به سیستم خود را بارگذاری کنید. فایل نیاز به  فرمت  yml دارد  که توسط ماژول ویرایشگر ACL صادر می شود.',
        'This field is required.' => 'این فیلد مورد نیاز است.',
        'Overwrite existing ACLs?' => 'بازنویسی ACL ها موجود؟',
        'Upload ACL configuration' => 'پیکربندی ACL بارگذاری شده ',
        'Import ACL configuration(s)' => 'پیکربندی واردات ACL (s)',
        'Description' => 'توضیحات',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'برای ایجاد یک ACL جدید شما هم می توانید واردات ACL ها که از سیستم دیگری صادر شده و یا ایجاد کنید یک ACL جدید کامل.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'تغییرات به ACL در اینجا تنها رفتار سیستم تاثیر می گذارد، اگر شما اطلاعات ACL اعزام پس از آن. با استقرار داده ACL، تغییرات تازه ساخته شده را به پیکربندی نوشته شده است.',
        'ACL Management' => 'مدیریت ACL',
        'ACLs' => 'ACL ها',
        'Filter' => 'فیلتر',
        'Show Valid' => '',
        'Show All' => '',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'لطفا توجه داشته باشید: این جدول نشان دهنده حکم اعدام از ACL ها است. اگر شما نیاز به تغییر نظم که در آن ACL ها اجرا می شوند، لطفا نام ACL ها را تحت تاثیر قرار را تغییر دهید.',
        'ACL name' => 'نام ACL',
        'Comment' => 'توضیح',
        'Validity' => 'اعتبار',
        'Export' => 'خروجی به',
        'Copy' => 'کپی',
        'No data found.' => 'داده‌ای یافت نشد.',
        'No matches found.' => 'هیچ موردی یافت نشد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLEdit.tt
        'Go to overview' => 'به نمای کلی برو',
        'Delete ACL' => 'حذف ACL',
        'Delete Invalid ACL' => 'حذف نامعتبر ACL',
        'Match settings' => 'تطابق تنظیمات ',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'تنظیم معیارهای تطبیق برای این ACL است. استفاده از "Properties" را برای مطابقت با صفحه نمایش فعلی یا PropertiesDatabase »برای مطابقت ویژگی بلیط فعلی که در پایگاه داده می باشد.',
        'Change settings' => 'تغییر تنظیمات',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'تنظیم آنچه که می خواهید تغییر دهید اگر بازی معیارهای. به خاطر داشته باشید که ممکن است یک لیست سفید، \'PossibleNot، یک لیست سیاه است.',
        'Check the official %sdocumentation%s.' => '',
        'Edit ACL %s' => 'ویرایش ACL %s',
        'Edit ACL' => '',
        'Show or hide the content' => 'نمایش یا عدم نمایش محتوا',
        'Edit ACL Information' => '',
        'Name' => 'نام',
        'Stop after match' => 'توقف بعد از تطبیق',
        'Edit ACL Structure' => '',
        'Cancel' => 'لغو',
        'Save' => 'ذخیره',
        'Save and finish' => 'ذخیره و پایان',
        'Do you really want to delete this ACL?' => 'آیا شما واقعا می خواهید این ACL را حذف کنید؟',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLNew.tt
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'درست ACL جدید با ارسال داده های فرم را. پس از ایجاد ACL، شما قادر به اضافه کردن آیتم های پیکربندی در حالت ویرایش خواهد بود.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentCalendarManage.tt
        'Calendar Overview' => '',
        'Add new Calendar' => 'اضافه کردن تقویم جدید',
        'Add Calendar' => 'اضافه‌کردن تقویم',
        'Import Appointments' => '',
        'Calendar Import' => '',
        'Here you can upload a configuration file to import a calendar to your system. The file needs to be in .yml format as exported by calendar management module.' =>
            '',
        'Overwrite existing entities' => 'بازنویسی نهادهای موجود',
        'Upload calendar configuration' => '',
        'Import Calendar' => '',
        'Filter for Calendars' => '',
        'Filter for calendars' => '',
        'Depending on the group field, the system will allow users the access to the calendar according to their permission level.' =>
            '',
        'Read only: users can see and export all appointments in the calendar.' =>
            '',
        'Move into: users can modify appointments in the calendar, but without changing the calendar selection.' =>
            '',
        'Create: users can create and delete appointments in the calendar.' =>
            '',
        'Read/write: users can manage the calendar itself.' => '',
        'Calendar Management' => 'مدیریت تقویم',
        'Edit Calendar' => 'ویرایش تقویم',
        'Group' => 'گروه',
        'Changed' => 'تغییر یافت',
        'Created' => 'ایجاد شد',
        'Download' => 'دریافت',
        'URL' => '',
        'Export calendar' => '',
        'Download calendar' => '',
        'Copy public calendar URL' => '',
        'Calendar' => 'تقویم',
        'Calendar name' => '',
        'Calendar with same name already exists.' => '',
        'Permission group' => '',
        'Ticket Appointments' => '',
        'Rule' => 'قاعده',
        'Remove this entry' => 'پاک کردن این ورودی',
        'Remove' => 'حذف کردن',
        'Start date' => 'تاریخ شروع',
        'End date' => 'ویرایش تاریخ',
        'Use options below to narrow down for which tickets appointments will be automatically created.' =>
            '',
        'Queues' => 'لیست‌های درخواست',
        'Please select a valid queue.' => '',
        'Search attributes' => '',
        'Add entry' => 'افزودن ورودی',
        'Add' => 'افزودن',
        'Define rules for creating automatic appointments in this calendar based on ticket data.' =>
            '',
        'Add Rule' => '',
        'Submit' => 'ارسال',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentImport.tt
        'Go back' => 'برگرد',
        'Uploaded file must be in valid iCal format (.ics).' => '',
        'If desired Calendar is not listed here, please make sure that you have at least \'create\' permissions.' =>
            '',
        'Appointment Import' => '',
        'Upload' => 'ارسال فایل',
        'Update existing appointments?' => '',
        'All existing appointments in the calendar with same UniqueID will be overwritten.' =>
            '',
        'Upload calendar' => '',
        'Import appointments' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEvent.tt
        'Add Notification' => 'افزودن اعلان',
        'Export Notifications' => 'ارسال اطلاعات',
        'Filter for Notifications' => '',
        'Filter for notifications' => '',
        'Here you can upload a configuration file to import appointment notifications to your system. The file needs to be in .yml format as exported by the appointment notification module.' =>
            '',
        'Overwrite existing notifications?' => 'بازنویسی اطلاعات موجود؟',
        'Upload Notification configuration' => 'هشدار از طریق بارگذاری پیکربندی ',
        'Import Notification configuration' => ' هشدار از طریق دریافت پیکربندی',
        'Appointment Notification Management' => '',
        'Edit Notification' => 'ویرایش اعلان',
        'List' => 'فهرست',
        'Delete' => 'حذف',
        'Delete this notification' => 'حذف این اعلان',
        'Show in agent preferences' => 'نمایش در تنظیمات عامل',
        'Agent preferences tooltip' => 'عامل راهنمای تنظیمات ابزار',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'این پیام خواهد شد بر روی صفحه نمایش تنظیمات عامل به عنوان یک ابزار برای این اطلاع رسانی شده است.',
        'Toggle this widget' => 'اعمال این ابزارک',
        'Events' => 'رویدادها',
        'Event' => 'رویداد',
        'Here you can choose which events will trigger this notification. An additional appointment filter can be applied below to only send for appointments with certain criteria.' =>
            '',
        'Appointment Filter' => '',
        'Type' => 'نوع',
        'Title' => 'عنوان',
        'Location' => 'موقعیت',
        'Team' => '',
        'Resource' => '',
        'Recipients' => 'دریافت کنندگان',
        'Send to' => 'فرستادن به',
        'Send to these agents' => 'ارسال به این عوامل',
        'Send to all group members (agents only)' => '',
        'Send to all role members' => 'ارسال به تمام نقشهای اعضا',
        'Also send if the user is currently out of office.' => 'همچنین ارسال در صورتی که کاربر در حال حاضر خارج از دفتر.',
        'Send on out of office' => 'ارسال در خارج از دفتر',
        'Notify user just once per day about a single appointment using a selected transport.' =>
            '',
        'Once per day' => 'یک بار در روز',
        'Notification Methods' => 'روش های اطلاع رسانی',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'این روش ممکن است که می تواند مورد استفاده برای ارسال این اطلاع رسانی به هر یک از دریافت کنندگان می باشد. لطفا حداقل یک روش زیر انتخاب کنید.',
        'Enable this notification method' => 'فعال کردن این روش اطلاع رسانی',
        'Transport' => 'حمل و نقل',
        'At least one method is needed per notification.' => 'حداقل یک روش در اطلاع رسانی مورد نیاز است.',
        'Active by default in agent preferences' => 'به طور پیش فرض فعال در تنظیمات عامل است',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'این مقدار پیش فرض برای عوامل گیرنده اختصاص داده که یک انتخاب برای این اطلاع رسانی در تنظیمات خود را هنوز رتبهدهی نشده است. اگر در کادر فعال باشد، اطلاع رسانی خواهد شد به چنین عوامل فرستاده می شود.',
        'This feature is currently not available.' => 'این قابلیت در حال حاضر در دسترس نیست.',
        'No data found' => 'داده ای یافت نشد',
        'No notification method found.' => 'هیچ روش اطلاع رسانی یافت نشد.',
        'Notification Text' => 'متن اطلاع رسانی',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'از این زبان در حال حاضر و یا فعال در سیستم نیست. این متن اطلاع رسانی می تواند حذف اگر آن مورد نیاز نیست.',
        'Remove Notification Language' => 'حذف هشدار از طریق زبان',
        'Subject' => 'موضوع',
        'Text' => 'متن',
        'Message body' => 'پیام بدن',
        'Add new notification language' => 'اضافه کردن زبان اطلاع رسانی جدید',
        'Save Changes' => 'ذخیره‌سازی تغییرات',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEventTransportEmailSettings.tt
        'Additional recipient email addresses' => 'دریافت کننده اضافی آدرس ایمیل ',
        'This field must have less then 200 characters.' => '',
        'Article visible for customer' => '',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'یک مقاله ایجاد خواهد شد اگر اطلاع رسانی به مشتریان و یا یک آدرس ایمیل دیگر ارسال می شود.',
        'Email template' => 'قالب ایمیل',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'استفاده از این قالب برای تولید ایمیل کامل (فقط برای ایمیل های HTML).',
        'Enable email security' => 'فعال کردن امنیت ایمیل',
        'Email security level' => 'سطح امنیتی ایمیل',
        'If signing key/certificate is missing' => 'اگر امضای کلید / گواهی از دست رفته است',
        'If encryption key/certificate is missing' => 'اگر کلید رمزنگاری / گواهی از دست رفته است',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAttachment.tt
        'Add Attachment' => 'افزودن پیوست',
        'Filter for Attachments' => 'فیلتر برای پیوست‌ها',
        'Filter for attachments' => '',
        'Related Actions' => '',
        'Templates' => 'قالب ها',
        'Templates ↔ Attachments' => '',
        'Attachment Management' => 'مدیریت پیوست‌ها',
        'Edit Attachment' => 'ویرایش پیوست',
        'Filename' => 'نام فایل',
        'Download file' => 'بارگیری فایل',
        'Delete this attachment' => 'حذف این پیوست',
        'Do you really want to delete this attachment?' => 'آیا شما واقعا می خواهید این پیوست را حذف کنید؟',
        'Attachment' => 'پیوست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAutoResponse.tt
        'Add Auto Response' => 'افزودن پاسخ خودکار',
        'Filter for Auto Responses' => 'فیلتر برای پاسخ‌های خودکار',
        'Filter for auto responses' => '',
        'Queues ↔ Auto Responses' => '',
        'Auto Response Management' => 'مدیریت پاسخ خودکار',
        'Edit Auto Response' => 'ویرایش پاسخ خودکار',
        'Response' => 'پاسخ',
        'Auto response from' => 'پاسخ خودکار از طرف',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLog.tt
        'Time Range' => '',
        'Show only communication logs created in specific time range.' =>
            '',
        'Filter for Communications' => '',
        'Filter for communications' => '',
        'Hint' => 'تذکر',
        'In this screen you can see an overview about incoming and outgoing communications.' =>
            '',
        'You can change the sort and order of the columns by clicking on the column header.' =>
            '',
        'If you click on the different entries, you will get redirected to a detailed screen about the message.' =>
            '',
        'Communication Log' => '',
        'Status for: %s' => '',
        'Failing accounts' => '',
        'Some account problems' => '',
        'No account problems' => '',
        'No account activity' => '',
        'Number of accounts with problems: %s' => '',
        'Number of accounts with warnings: %s' => '',
        'Failing communications' => '',
        'No communication problems' => '',
        'No communication logs' => '',
        'Number of reported problems: %s' => '',
        'Open communications' => '',
        'No active communications' => '',
        'Number of open communications: %s' => '',
        'Average processing time' => '',
        'List of communications (%s)' => '',
        'Settings' => 'تنظیمات',
        'Entries per page' => '',
        'No communications found.' => '',
        '%s s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogAccounts.tt
        'Back to overview' => '',
        'Filter for Accounts' => '',
        'Filter for accounts' => '',
        'You can change the sort and order of those columns by clicking on the column header.' =>
            '',
        'Account Status' => '',
        'Account status for: %s' => '',
        'Status' => 'وضعیت',
        'Account' => '',
        'Edit' => 'ویرایش',
        'No accounts found.' => '',
        'Communication Log Details (%s)' => '',
        'Direction' => 'جهت',
        'Start Time' => '',
        'End Time' => '',
        'No communication log entries found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogCommunications.tt
        'Duration' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogObjectLog.tt
        '#' => '',
        'Priority' => 'اولویت',
        'Module' => 'ماژول',
        'Information' => 'اطلاعات',
        'No log entries found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogZoom.tt
        'Filter for Log Entries' => '',
        'Filter for log entries' => '',
        'Show only entries with specific priority and higher:' => '',
        'Detail view for %s communication started at %s' => '',
        'Communication Log Overview (%s)' => '',
        'No communication objects found.' => '',
        'Communication Log Details' => '',
        'Please select an entry from the list.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerCompany.tt
        'Search' => 'جستجو',
        'Wildcards like \'*\' are allowed.' => 'نویسه عام مانند "*" مجاز است.',
        'Add Customer' => 'افزودن مشترک',
        'Select' => 'انتخاب',
        'Customer Users' => 'مشترکین',
        'Customers ↔ Groups' => '',
        'Customer Management' => 'مدیریت مشترک',
        'Edit Customer' => 'ویرایش مشترک',
        'List (only %s shown - more available)' => 'فهرست (فقط %s نشان داده شده است - در دسترس تر)',
        'total' => 'مجموع',
        'Please enter a search term to look for customers.' => 'لطفا عبارت جستجو را وارد نمایید تا مشترکین را جستجو نمایید.',
        'Customer ID' => 'شناسه مشترک',
        'Please note' => '',
        'This customer backend is read only!' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerGroup.tt
        'Notice' => 'توجه',
        'This feature is disabled!' => 'این ویژگی غیر فعال است',
        'Just use this feature if you want to define group permissions for customers.' =>
            'فقط زمانی از این ویژگی استفاده کنید که می‌خواهید از دسترسی‌های گروه برای مشترکین استفاده نمایید.',
        'Enable it here!' => 'از اینجا فعال نمائید',
        'Edit Customer Default Groups' => 'ویرایش گروه‌های پیش‌فرض مشترکین',
        'These groups are automatically assigned to all customers.' => 'این گروه‌ها به صورت خودکار به تمام مشترکین اعمال می‌شوند.',
        'You can manage these groups via the configuration setting "CustomerGroupCompanyAlwaysGroups".' =>
            '',
        'Filter for Groups' => 'فیلتر برای گروه‌ها',
        'Select the customer:group permissions.' => 'انتخاب دسترسی‌های مشترک:گروه',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'اگرچیزی انتخاب نشود، هیچ دسترسی در این گروه موجود نیست (درخواست‌ها برای مشترک در دسترس نیست)',
        'Customers' => 'مشترکین',
        'Groups' => 'گروه‌ها',
        'Manage Customer-Group Relations' => 'مدیریت روابط مشترک-گروه',
        'Search Results' => 'نتیجه جستجو',
        'Change Group Relations for Customer' => 'تغییر ارتباطات گروه برای مشترک',
        'Change Customer Relations for Group' => 'تغییر ارتباطات مشترک برای گروه',
        'Toggle %s Permission for all' => 'اعمال دسترسی %s برای همه',
        'Toggle %s permission for %s' => 'تعویض %s اجازه %s',
        'Customer Default Groups:' => 'گروه‌های پیش‌فرض مشترک',
        'No changes can be made to these groups.' => 'هیچ تغییری نمی‌توان به این گروه‌ها اعمال کرد.',
        'Reference' => 'منبع',
        'ro' => 'فقط خواندنی',
        'Read only access to the ticket in this group/queue.' => 'حق فقط خواندنی برای درخواست‌ها در این گروه /لیست.',
        'rw' => 'خواندنی و نوشتنی',
        'Full read and write access to the tickets in this group/queue.' =>
            'دسترسی کامل به درخواست‌ها در این لیست / گروه.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUser.tt
        'Back to search results' => 'بازگشت به نتایج جستجو',
        'Add Customer User' => 'اضافه کردن کاربر مشترک',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'کاربران و ضوابط مورد نیاز برای یک سابقه مشتری و برای ورود به سایت از طریق پنل مشتری می باشد.',
        'Customer Users ↔ Customers' => '',
        'Customer Users ↔ Groups' => '',
        'Customer Users ↔ Services' => '',
        'Customer User Management' => 'مدیریت کاربری مشترک',
        'Edit Customer User' => ' ویرایش کاربر مشتری',
        'List (%s total)' => 'فهرست ( تعداد %s)',
        'Username' => 'نام کاربری',
        'Email' => 'ایمیل',
        'Last Login' => 'آخرین ورود',
        'Login as' => 'ورود به عنوان',
        'Switch to customer' => 'تغییر به مشتری',
        'This customer backend is read only, but the customer user preferences can be changed!' =>
            '',
        'This field is required and needs to be a valid email address.' =>
            'این گزینه مورد نیاز است و باید یک آدرس ایمیل معتبر باشد.',
        'This email address is not allowed due to the system configuration.' =>
            'این آدرس ایمیل با توجه به پیکربندی سیستم، نامعتبر است.',
        'This email address failed MX check.' => 'این آدرس ایمیل در چک MX ناموفق بوده است.',
        'DNS problem, please check your configuration and the error log.' =>
            'مشکل DNS، لطفا تنظیمات خود و خطای ورود را بررسی کنید .',
        'The syntax of this email address is incorrect.' => 'گرامر این آدرس ایمیل نادرست می‌باشد.',
        'This CustomerID is invalid.' => '',
        'Effective Permissions for Customer User' => '',
        'Group Permissions' => '',
        'This customer user has no group permissions.' => '',
        'Table above shows effective group permissions for the customer user. The matrix takes into account all inherited permissions (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            '',
        'Customer Access' => '',
        'Customer' => 'مشترک',
        'This customer user has no customer access.' => '',
        'Table above shows granted customer access for the customer user by permission context. The matrix takes into account all inherited access (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserCustomer.tt
        'Select the customer user:customer relations.' => '',
        'Manage Customer User-Customer Relations' => '',
        'Change Customer Relations for Customer User' => '',
        'Change Customer User Relations for Customer' => '',
        'Toggle active state for all' => 'اعمال وضعیت فعال برای همه',
        'Active' => 'فعال',
        'Toggle active state for %s' => 'اعمال وضعیت فعال برای %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserGroup.tt
        'Just use this feature if you want to define group permissions for customer users.' =>
            '',
        'Edit Customer User Default Groups' => '',
        'These groups are automatically assigned to all customer users.' =>
            '',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'شما می‌توانید این گروه‌ها را از طریق تنظیم پیکربندی "CustomerGroupAlwaysGroups" مدیریت نمایید.',
        'Filter for groups' => '',
        'Select the customer user - group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer user).' =>
            '',
        'Manage Customer User-Group Relations' => '',
        'Customer User Default Groups:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserService.tt
        'Edit default services' => 'ویرایش خدمات پیش‌فرض',
        'Filter for Services' => 'فیلتر برای خدمات',
        'Filter for services' => '',
        'Services' => 'خدمات',
        'Service Level Agreements' => 'توافقات سطح سرویس',
        'Manage Customer User-Service Relations' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicField.tt
        'Add new field for object' => 'اضافه کردن فیلد جدید برای موضوع',
        'Filter for Dynamic Fields' => '',
        'Filter for dynamic fields' => '',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'برای اضافه کردن یک رشته جدید، نوع رشته را از یکی موضوع های لیست انتخاب کنید، موضوع مرز رشته را تعریف میکند و نمی توان آن را پس از ایجاد رشته  تغییر داد.',
        'Import and export of configurations' => '',
        'Upload a file in YAML format (as provided by the export) to import dynamic field configurations.' =>
            '',
        'Overwrite existing configurations' => '',
        'Import configurations' => '',
        'Export configurations' => '',
        'Process Management' => 'مدیریت فرآیند',
        'Dynamic fields ↔ Screens' => '',
        'Dynamic Fields Management' => 'مدیریت پویای زمینه',
        'Dynamic Fields List' => ' فهرست زمینه حرکتی',
        'Dynamic fields per page' => 'زمینه های پویا در هر صفحه',
        'Label' => 'برچسب',
        'Order' => 'ترتیب',
        'Object' => 'مورد',
        'Delete this field' => 'حذف این قسمت',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldCheckbox.tt
        'Go back to overview' => 'برگرد به نمایش مجموعه',
        'Dynamic Fields' => 'رشته های پویا',
        'General' => 'عمومی',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'این فیلد مورد نیاز است، و بها باید فقط حروف و عدد باشد.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'باید منحصر به فرد باشد و تنها حروف و عددی را بپذیرید.',
        'Changing this value will require manual changes in the system.' =>
            'تغییر این مقدار خواهد تغییرات دستی در سیستم نیاز داشته باشد.',
        'This is the name to be shown on the screens where the field is active.' =>
            'این نام به بر روی صفحه نمایش که در آن زمینه فعال است نشان داده شده است.',
        'Field order' => 'سفارش درست',
        'This field is required and must be numeric.' => 'این فیلد الزامی است و باید عدد باشد.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'این نظم که در آن این زمینه خواهد شد بر روی صفحه نمایش که در آن فعال است نشان داده شده است.',
        'Is not possible to invalidate this entry, all config settings have to be changed beforehand.' =>
            '',
        'Field type' => 'نوع رشته',
        'Object type' => 'نوع موضوع',
        'Internal field' => 'رشته داخلی',
        'This field is protected and can\'t be deleted.' => 'در این زمینه محافظت شده است و نمی تواند حذف شود.',
        'This dynamic field is used in the following config settings:' =>
            '',
        'Field Settings' => 'تنظیمات درست',
        'Default value' => 'مقدار پیش‌فرض',
        'This is the default value for this field.' => 'این مقدار پیش فرض برای این رشته است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldConfigurationImportExport.tt
        'Select the dynamic fields you want to import and click on \'Import\'.' =>
            '',
        'Select the dynamic fields whose configuration you want to export and click on \'Export\' to generate a YAML file.' =>
            '',
        'Dynamic field configurations: %s' => '',
        'Dynamic fields' => 'زمینه های پویا',
        'For the following dynamic fields a configuration cannot be imported because of an invalid backend.' =>
            '',
        'Select all field configurations' => '',
        'Select all screen configurations' => '',
        'The uploaded file does not contain configuration(s), is not a YAML file, is damaged or has the wrong structure.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDateTime.tt
        'Default date difference' => 'تفاوت تاریخ به طور پیش فرض',
        'This field must be numeric.' => 'در این زمینه باید عدد باشد.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'تفاوت از شرکت (در ثانیه) برای محاسبه درست مقدار پیش فرض (به عنوان مثال 3600 یا -60).',
        'Define years period' => 'تعریف دوره سال',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'فعال کردن این ویژگی برای تعریف یک محدوده ثابت از سال (در آینده و در گذشته) در بخشی از سال نمایش داده می شود.',
        'Years in the past' => 'سال در گذشته',
        'Years in the past to display (default: 5 years).' => 'سال در گذشته برای نمایش (به طور پیش فرض: 5 سال).',
        'Years in the future' => 'سال در آینده',
        'Years in the future to display (default: 5 years).' => 'سال در آینده برای نمایش (به طور پیش فرض: 5 سال).',
        'Show link' => 'نمایش لینک',
        'Reserved keywords. The following placeholders are not allowed:' =>
            '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'در اینجا شما می توانید یک لینک HTTP اختیاری برای مقدار فیلد در صفحه نمایش بررسی ها و زوم را مشخص کنید.',
        'If special characters (&, @, :, /, etc.) should not be encoded, use \'url\' instead of \'uri\' filter.' =>
            '',
        'Example' => 'مثال',
        'Link for preview' => 'لینک برای پیش نمایش',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'اگر در پر شده است، این URL خواهد شد برای یک پیش نمایش است که نشان داده شده است که این پیوند در زوم بلیط ماند استفاده می شود. لطفا توجه داشته باشید که برای این کار، زمینه URL به طور منظم بالا نیاز به در شود پر شده است، بیش از حد.',
        'Restrict entering of dates' => 'محدود کردن ورود از  تاریخ',
        'Here you can restrict the entering of dates of tickets.' => 'در اینجا شما می توانید تاریخ درخواست ورود را محدود کنید .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDropdown.tt
        'Possible values' => 'مقادیر ممکن',
        'Key' => 'کلید',
        'Value' => 'مقدار',
        'Remove value' => 'حذف مقدار',
        'Add value' => 'اضافه کردن مقدار',
        'Add Value' => 'اضافه کردن مقدار',
        'Add empty value' => 'اضافه کردن مقدار خالی',
        'Activate this option to create an empty selectable value.' => 'این گزینه را برای ساختن یک مقدارخالی انتخابی فعال کنید',
        'Tree View' => 'نمای درختی',
        'Activate this option to display values as a tree.' => 'این گزینه را برای نمایش مقادیر درختی فعال کنید.',
        'Translatable values' => 'ارزش ترجمه',
        'If you activate this option the values will be translated to the user defined language.' =>
            'اگر این گزینه را فعال شدن ارزش خواهد شد به زبان تعریف شده توسط کاربر ترجمه شده است.',
        'Note' => 'یادداشت',
        'You need to add the translations manually into the language translation files.' =>
            'شما نیاز به اضافه کردن ترجمه دستی برای فایل های ترجمه زبان دارید .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldScreenConfiguration.tt
        'Assignment of dynamic fields to screens' => '',
        'Overview' => 'پیش نمایش',
        'Screens' => '',
        'Overview Default Columns' => '',
        'Add dynamic field' => '',
        'You can assign elements by dragging and dropping them to the lists of available, disabled, assigned and required elements.' =>
            '',
        'Filter available elements' => '',
        'Assign selected elements to this list' => '',
        'Select all' => 'انتخاب همه',
        'Filter disabled elements' => '',
        'Filter assigned elements' => '',
        'Filter required elements' => '',
        'Reset' => 'ورود مجدد',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldText.tt
        'Number of rows' => 'تعداد ردیف',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'شاخص ارتفاع (در خط) در این زمینه در حالت ویرایش است  . ',
        'Number of cols' => 'تعداد گذرگاه',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'مشخص عرض (در شخصیت) برای این رشته در حالت ویرایش.',
        'Check RegEx' => 'بررسی عبارت منظم',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'در اینجا شما می توانید یک عبارت منظم برای بررسی ارزش را مشخص کنید. عبارت منظم خواهد شد با اصلاح XMS اجرا شده است.',
        'RegEx' => 'عبارت منظم',
        'Invalid RegEx' => 'عبارت منظم نامعتبر',
        'Error Message' => 'پیغام خطا',
        'Add RegEx' => 'اضافه کردن عبارت منظم',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice.tt
        'Default search term' => '',
        'This is the default term for the click search.' => '',
        'Initial default search term' => '',
        'This is the default search term when the mask is loaded.' => '',
        'Attributes' => '',
        'Attributes for invoker execution (initially default values will be used).' =>
            '',
        'Attribute keys' => '',
        'Custom attribute form for invoker execution.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/Config.tt
        'Web service' => '',
        'Web service which will be used for this dynamic field.' => '',
        'Invoker to search for records' => '',
        'Invoker which will be used for this dynamic field. Searches for the search term(s) and returns an array as result. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Invoker to get a record' => '',
        'Invoker which will be used for this dynamic field. Returns a hash of the record that will be found when searching for its identifier in the field configured in \'key for stored value\' below. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Backend' => '',
        'Backend which will be used for this dynamic field.' => '',
        'Backend documentation' => '',
        'Cache TTL' => '',
        'TTL (in seconds) for caching request results. Leave empty or set to 0 to disable caching.' =>
            '',
        'Key for search' => '',
        'The keys (separated by comma) that will be searched when using the autocomplete while entering a value for the dynamic field.' =>
            '',
        'Key for stored value' => '',
        'The key whose value will be stored in the dynamic field.' => '',
        'Key to display' => '',
        'The keys (separated by comma) that will be shown when the value of the dynamic field is being displayed. This also affects the value displayed in the autocomplete field when entering a value. If this field is left empty, the stored value from above will be displayed.' =>
            '',
        'Template Type' => '',
        'This configuration determines how the values of the dynamic field are output in templates or masks.' =>
            '',
        'Separator to display between multi-key values' => '',
        'The separator to show between the values if there\'s more than one key configured to be displayed above. If left empty, a single space will be used as separator. Use <space> to add spaces.' =>
            '',
        'Limit' => 'محدوده',
        'Maximum number of results for web service queries, e.g. for autocomplete selection list.' =>
            '',
        'Autocomplete min. input length' => '',
        'Minimum length of input for autocomplete field to trigger search.' =>
            '',
        'Query delay' => '',
        'Delay (in milliseconds) until the AJAX request will be sent.' =>
            '',
        'Input field width' => '',
        'Width of the input field (percentage).' => '',
        'Additional dynamic field storage' => '',
        'Dynamic field' => '',
        'Restore values' => '',
        'These dynamic fields are also filled with values from the same record.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/Test.tt
        'Test settings' => '',
        'Error while testing configuration. Please check the configuration.' =>
            '',
        'Test was successful.' => '',
        'Test this dynamic field exactly as it is displayed in the editing dialogs.' =>
            '',
        'Enter a search term to test the current settings.' => '',
        'Click "Test settings"' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/TestData.tt
        'DisplayValue' => '',
        'StoredValue' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminEmail.tt
        'With this module, administrators can send messages to agents, group or role members.' =>
            'با استفاده از این ماژول، مدیران سیستم می‌توانند پیغام‌ها را به کارشناسان، گروه‌ها و یا اعضای با نقش خاص ارسال کنند.',
        'Admin Message' => '',
        'Create Administrative Message' => 'ساخت پیغام مدیریتی',
        'Your message was sent to' => 'پیغام شما ارسال شد برای',
        'From' => 'فرستنده',
        'Send message to users' => 'ارسال پیغام به کاربران',
        'Send message to group members' => 'ارسال پیغام به اعضای گروه',
        'Group members need to have permission' => 'اعضای گروه نیاز به داشتن دسترسی دارند',
        'Send message to role members' => 'ارسال پیغام به اعضای یک نقش',
        'Also send to customers in groups' => 'برای مشترکین عضو گروه هم ارسال شود',
        'Body' => 'متن نامه',
        'Send' => 'ارسال',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericAgent.tt
        'Add Job' => '',
        'Filter for Jobs' => '',
        'Filter for jobs' => '',
        'Generic Agent Job Management' => '',
        'Edit Job' => '',
        'Run Job' => '',
        'Last run' => 'آخرین اجرا',
        'Run' => 'اجرا',
        'Delete this task' => 'حذف این وظیفه',
        'Run this task' => 'اجرای این وظیفه',
        'Do you really want to delete this generic agent job?' => '',
        'Job Settings' => 'تنظیمات کار',
        'Job name' => 'نام کار',
        'The name you entered already exists.' => 'نامی که وارد کردید درحال حاضر وجود دارد.',
        'Automatic Execution (Multiple Tickets)' => '',
        'Execution Schedule' => 'برنامه اجرایی',
        'Schedule minutes' => 'زمانبندی دقایق',
        'Schedule hours' => 'زمانبندی ساعات',
        'Schedule days' => 'زمانبندی روزها',
        'Automatic execution values are in the system timezone.' => '',
        'Currently this generic agent job will not run automatically.' =>
            'این کار اتوماتیک در حال حاضر به طور خودکار انجام نخواهد شد',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'برای فعال کردن اجرای خودکار اقلا یکی از موارد دقیقه، ساعت یا روز را مقدار دهی کنید!',
        'Event Based Execution (Single Ticket)' => '',
        'Event Triggers' => 'رویداد راه انداز',
        'List of all configured events' => 'فهرست از تمام وقایع پیکربندی',
        'Delete this event' => 'حذف این رویداد',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'علاوه بر این و یا معادل آن به اعدام های دوره ای، شما می توانید حوادث بلیط که این کار را آغاز کند را تعریف کنیم.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'اگر یک رویداد بلیط شلیک می شود، فیلتر بلیط اعمال خواهد شد به بررسی در صورتی که بلیط منطبق است. تنها پس از آن کار است که بر روی بلیط را اجرا کنید.',
        'Add Event Trigger' => 'اضافه کردن رویداد راه انداز',
        'To add a new event select the event object and event name' => '',
        'Do you really want to delete this event trigger?' => 'آیا شما واقعا می خواهید این محرک رویداد را حذف کنید  .',
        'Select Tickets' => 'درخواست را انتخاب کنید',
        '(e. g. 10*5155 or 105658*)' => '(مثال: ۱۰*۵۱۵۵ یا ۱۰۵۶۵۸*)',
        '(e. g. 234321)' => '(مثال: ۲۳۴۳۲۱)',
        'Customer user ID' => '',
        '(e. g. U5150)' => '(مثال: U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'جستجوی تمام متن در مطالب (مثال: "Mar*in")',
        'To' => 'گیرنده',
        'Cc' => 'رونوشت',
        'Service' => 'خدمات',
        'Service Level Agreement' => 'توافق سطح سرویس',
        'Queue' => 'لیست درخواست',
        'State' => 'وضعیت',
        'Agent' => 'کارشناس',
        'Owner' => 'صاحب',
        'Responsible' => 'مسئول',
        'Ticket lock' => 'تحویل درخواست',
        'Create times' => 'زمان‌های ساخت',
        'No create time settings.' => 'تنظیمی برای زمان ایجاد درخواست وجود ندارد',
        'Ticket created' => 'زمان ایجاد درخواست',
        'Ticket created between' => 'بازه زمانی ایجاد درخواست',
        'and' => 'و',
        'Last changed times' => 'زمان آخرین تغییر ',
        'No last changed time settings.' => 'بدون آخرین تغییرات تنظیمات زمان .',
        'Ticket last changed' => 'آخرین تغییردرخواست ',
        'Ticket last changed between' => 'بین آخرین تغییر درخواست ',
        'Change times' => ' تغییر زمان',
        'No change time settings.' => 'هیچ تنظیمی برای تغییر زمان وجود ندارد',
        'Ticket changed' => 'درخواست تغییر داده شده',
        'Ticket changed between' => 'درخواست تغییر داده شده بین',
        'Last close times' => '',
        'No last close time settings.' => '',
        'Ticket last close' => '',
        'Ticket last close between' => '',
        'Close times' => 'زمان‌های بستن',
        'No close time settings.' => 'زمان بستن تنظیم نشده است',
        'Ticket closed' => 'درخواست بسته شده',
        'Ticket closed between' => 'درخواست بسته شده بین',
        'Pending times' => 'زمان‌های تعلیق',
        'No pending time settings.' => ' تنظیمی برای زمان تعلیق درخواست وجود ندارد ',
        'Ticket pending time reached' => 'زمان سررسید تعلیق ',
        'Ticket pending time reached between' => 'بازه زمانی سررسید تعلیق',
        'Escalation times' => 'زمان‌های نهایی پاسخگویی',
        'No escalation time settings.' => 'بدون هر گونه تنظیم برای زمان ارتقای اولویت در صف',
        'Ticket escalation time reached' => 'زمان ارتقای اولویت درخواست در صف فرا رسیده است',
        'Ticket escalation time reached between' => 'زمان ارتقای اولویت در صف بین',
        'Escalation - first response time' => 'زمان نهایی پاسخ - زمان اولین پاسخگویی',
        'Ticket first response time reached' => 'زمان اولین پاسخگویی به درخواست فرا رسیده است',
        'Ticket first response time reached between' => 'زمان اولین پاسخگویی به درخواست بین',
        'Escalation - update time' => 'زمان نهایی پاسخ - زمان به‌روز رسانی',
        'Ticket update time reached' => 'زمان به‌روز رسانی درخواست فرا رسیده است',
        'Ticket update time reached between' => 'زمان به‌روز رسانی درخواست بین',
        'Escalation - solution time' => 'زمان نهایی پاسخ - زمان حل درخواست',
        'Ticket solution time reached' => 'زمان حل درخواست فرا رسیده است',
        'Ticket solution time reached between' => 'زمان حل درخواست بین',
        'Archive search option' => 'آرشیو گزینه‌های جستجو',
        'Update/Add Ticket Attributes' => 'به روز رسانی / اضافه کردن لیست درخواست ',
        'Set new service' => 'تنظیم سرویس جدید',
        'Set new Service Level Agreement' => 'تنظیم توافق سطح سرویس جدید',
        'Set new priority' => 'تنظیم الویت جدید',
        'Set new queue' => 'تنظیم صف درخواست جدید',
        'Set new state' => 'تنظیم وضعیت جدید',
        'Pending date' => 'تاریخ تعلیق',
        'Set new agent' => 'تنظیم کارشناس جدید',
        'new owner' => 'صاحب جدید',
        'new responsible' => ' مسئول جدید',
        'Set new ticket lock' => 'تنظیم تحویل درخواست جدید',
        'New customer user ID' => '',
        'New customer ID' => 'شناسه مشترک جدید',
        'New title' => 'عنوان جدید',
        'New type' => 'نوع جدید',
        'Archive selected tickets' => 'آرشیو درخواست‌های انتخاب شده',
        'Add Note' => 'افزودن یادداشت',
        'Visible for customer' => '',
        'Time units' => 'واحد زمان',
        'Execute Ticket Commands' => 'اجرای دستورات درخواست ',
        'Send agent/customer notifications on changes' => 'آگاه کردن کارشناس/مشتری به هنگام ایجاد تغییرات',
        'Delete tickets' => 'حذف درخواست‌ها',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'اخطار: تمامی درخواست‌های تاثیر یافته از پایگاه داده حذف خواهد شد و قابل بازیابی نخواهد بود!',
        'Execute Custom Module' => 'اجرای ماژول سفارشی',
        'Param %s key' => 'PARAM %s کلید',
        'Param %s value' => 'PARAM %s ارزش',
        'Results' => 'نتیجه',
        '%s Tickets affected! What do you want to do?' => '%s درخواست تاثیر خواهند پذیرفت! می‌خواهید چه کاری انجام دهید؟',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'اخطار: شما از گزینه حذف استفاده کرده‌اید. تمامی درخواست‌های حذف شده از بین خواهند رفت!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'هشدار: وجود دارد %s بلیط تحت تاثیر قرار اما تنها %s ممکن است در طول یک اجرا کار اصلاح!',
        'Affected Tickets' => 'درخواست‌های تاثیر یافته',
        'Age' => 'طول عمر درخواست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceDebugger.tt
        'Go back to web service' => 'برگشت به وب سرویس',
        'Clear' => 'واضح',
        'Do you really want to clear the debug log of this web service?' =>
            'آیا شما واقعا می خواهید برای روشن ورود به سیستم اشکال زدایی از این وب سرویس؟',
        'GenericInterface Web Service Management' => 'مدیریت GenericInterface وب سرویس',
        'Web Service Management' => '',
        'Debugger' => 'اشکال زدا',
        'Request List' => 'لیست درخواست',
        'Time' => 'زمان',
        'Communication ID' => '',
        'Remote IP' => 'از راه دور IP',
        'Loading' => 'در حال اجرا',
        'Select a single request to see its details.' => 'یک درخواست تکی برای دیدن جزئیات آن انتخاب کنید.',
        'Filter by type' => 'فیلتر بر اساس نوع',
        'Filter from' => 'فیلتر از',
        'Filter to' => 'فیلتر برای',
        'Filter by remote IP' => 'فیلتر بر اساس راه دور IP',
        'Refresh' => 'بازیابی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingDefault.tt
        'Do you really want to delete this error handling module?' => '',
        'All configuration data will be lost.' => 'همه داده های پیکربندی  از دست خواهد رفت.',
        'Add ErrorHandling' => '',
        'Edit ErrorHandling' => '',
        'General options' => '',
        'The name can be used to distinguish different error handling configurations.' =>
            '',
        'Please provide a unique name for this web service.' => 'لطفا یک نام منحصر به فرد برای این وب سرویس ارائه دهید .',
        'Error handling module backend' => '',
        'This Znuny error handling backend module will be called internally to process the error handling mechanism.' =>
            '',
        'Processing options' => '',
        'Configure filters to control error handling module execution.' =>
            '',
        'Only requests matching all configured filters (if any) will trigger module execution.' =>
            '',
        'Operation filter' => '',
        'Only execute error handling module for selected operations.' => '',
        'Note: Operation is undetermined for errors occuring while receiving incoming request data. Filters involving this error stage should not use operation filter.' =>
            '',
        'Invoker filter' => '',
        'Only execute error handling module for selected invokers.' => '',
        'Error message content filter' => '',
        'Enter a regular expression to restrict which error messages should cause error handling module execution.' =>
            '',
        'Error message subject and data (as seen in the debugger error entry) will considered for a match.' =>
            '',
        'Example: Enter \'^.*401 Unauthorized.*\$\' to handle only authentication related errors.' =>
            '',
        'Error stage filter' => '',
        'Only execute error handling module on errors that occur during specific processing stages.' =>
            '',
        'Example: Handle only errors where mapping for outgoing data could not be applied.' =>
            '',
        'Error code' => '',
        'An error identifier for this error handling module.' => '',
        'This identifier will be available in XSLT-Mapping and shown in debugger output.' =>
            '',
        'Error message' => '',
        'An error explanation for this error handling module.' => '',
        'This message will be available in XSLT-Mapping and shown in debugger output.' =>
            '',
        'Define if processing should be stopped after module was executed, skipping all remaining modules or only those of the same backend.' =>
            '',
        'Default behavior is to resume, processing the next module.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingRequestRetry.tt
        'This module allows to configure scheduled retries for failed requests.' =>
            '',
        'Default behavior of GenericInterface web services is to send each request exactly once and not to reschedule after errors.' =>
            '',
        'If more than one module capable of scheduling a retry is executed for an individual request, the module executed last is authoritative and determines if a retry is scheduled.' =>
            '',
        'Request retry options' => '',
        'Retry options are applied when requests cause error handling module execution (based on processing options).' =>
            '',
        'Schedule retry' => '',
        'Should requests causing an error be triggered again at a later time?' =>
            '',
        'Initial retry interval' => '',
        'Interval after which to trigger the first retry.' => '',
        'Note: This and all further retry intervals are based on the error handling module execution time for the initial request.' =>
            '',
        'Factor for further retries' => '',
        'If a request returns an error even after a first retry, define if subsequent retries are triggered using the same interval or in increasing intervals.' =>
            '',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\' and retry factor at \'2\', retries would be triggered at 10:01 (1 minute), 10:03 (2*1=2 minutes), 10:07 (2*2=4 minutes), 10:15 (2*4=8 minutes), ...' =>
            '',
        'Maximum retry interval' => '',
        'If a retry interval factor of \'1.5\' or \'2\' is selected, undesirably long intervals can be prevented by defining the largest interval allowed.' =>
            '',
        'Intervals calculated to exceed the maximum retry interval will then automatically be shortened accordingly.' =>
            '',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum interval at \'5 minutes\', retries would be triggered at 10:01 (1 minute), 10:03 (2 minutes), 10:07 (4 minutes), 10:12 (8=>5 minutes), 10:17, ...' =>
            '',
        'Maximum retry count' => '',
        'Maximum number of retries before a failing request is discarded, not counting the initial request.' =>
            '',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry count at \'2\', retries would be triggered at 10:01 and 10:02 only.' =>
            '',
        'Note: Maximum retry count might not be reached if a maximum retry period is configured as well and reached earlier.' =>
            '',
        'This field must be empty or contain a positive number.' => '',
        'Maximum retry period' => '',
        'Maximum period of time for retries of failing requests before they are discarded (based on the error handling module execution time for the initial request).' =>
            '',
        'Retries that would normally be triggered after maximum period is elapsed (according to retry interval calculation) will automatically be triggered at maximum period exactly.' =>
            '',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry period at \'30 minutes\', retries would be triggered at 10:01, 10:03, 10:07, 10:15 and finally at 10:31=>10:30.' =>
            '',
        'Note: Maximum retry period might not be reached if a maximum retry count is configured as well and reached earlier.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerDefault.tt
        'Do you really want to delete this invoker?' => 'آیا شما واقعا می خواهید این invoker را حذف کنید؟',
        'Add Invoker' => '',
        'Edit Invoker' => '',
        'Invoker Details' => 'Invoker اطلاعات',
        'The name is typically used to call up an operation of a remote web service.' =>
            'نام معمولا برای پاسخ یک عملیات از یک وب سرویس از راه دور.',
        'Invoker backend' => 'باطن Invoker',
        'This Znuny invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'این invoker ماژول باطن Znuny خواهد شد به نام برای آماده سازی داده ها به سیستم از راه دور ارسال می شود، و برای پردازش داده ها پاسخ آن است.',
        'Mapping for outgoing request data' => 'نقشه برداری برای درخواست داده های خروجی',
        'Configure' => 'تنظیمات',
        'The data from the invoker of Znuny will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'داده ها از فراخواننده Znuny خواهد شد این نقشه برداری پردازش، آن را تبدیل به نوع داده سیستم از راه دور انتظار.',
        'Mapping for incoming response data' => 'نگاشت برای پاسخ داده های ورودی ',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of Znuny expects.' =>
            'پاسخ داده خواهد شد این نقشه برداری پردازش، آن را تبدیل به نوع داده فراخواننده Znuny انتظار.',
        'Asynchronous' => 'ناهمگام',
        'Condition' => 'وضعیت',
        'Edit this event' => '',
        'This invoker will be triggered by the configured events.' => 'این invoker باعث ایجاد حوادث پیکربندی خواهد شد . ',
        'Add Event' => 'اضافه کردن رویداد',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'برای اضافه کردن یک رویداد جدید انتخاب موضوع رویداد و نام  رویداد و کلیک بر روی  دکمه \ "+ " میباشد',
        'Asynchronous event triggers are handled by the Znuny Scheduler Daemon in background (recommended).' =>
            'باعث رویداد آسنکرون توسط Znuny زمانبند شبح در پس زمینه به کار گرفته (توصیه می شود).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'باعث رویداد همزمان می تواند به طور مستقیم در طول درخواست وب پردازش شده است.',
        'Add all attachments' => '',
        'Add all attachments to invoker payload.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerEvent.tt
        'GenericInterface Invoker Event Settings for Web Service %s' => '',
        'Go back to' => 'بازگشت به',
        'Delete all conditions' => '',
        'Do you really want to delete all the conditions for this event?' =>
            '',
        'General Settings' => '',
        'Event type' => '',
        'Conditions' => 'شرایط',
        'Conditions can only operate on non-empty fields.' => 'شرایط فقط می توانید در زمینه های غیر خالی به کار گیرند.',
        'Type of Linking between Conditions' => 'نوع پیوند بین شرایط',
        'Remove this Condition' => 'حذف این شرط',
        'Type of Linking' => 'نوع لینک کردن',
        'Fields' => 'زمینه های',
        'Add a new Field' => 'اضافه کردن فیلد جدید',
        'Remove this Field' => 'حذف این فیلد',
        'And can\'t be repeated on the same condition.' => 'و نمی تواند در شرایط یکسان  تکرار شود.',
        'Add New Condition' => 'اضافه کردن شرط  جدید',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingSimple.tt
        'Mapping Simple' => 'نگاشت ساده',
        'Default rule for unmapped keys' => 'قانونی به طور پیش فرض برای کلیدها در نگاشت نیامده',
        'This rule will apply for all keys with no mapping rule.' => 'این قانون برای تمام کلید ها با قانون نگاشت اعمال می شود.',
        'Default rule for unmapped values' => 'قانون به طور پیش فرض برای مقادیر نگاشت نیامده',
        'This rule will apply for all values with no mapping rule.' => 'این قانون برای همه با ارزش  قانون نگاشت اعمال نمی شود.',
        'New key map' => 'نگاشت کلید جدید',
        'Add key mapping' => 'اضافه کردن نگاشت کلید',
        'Mapping for Key ' => 'نگاشت برای کلید ',
        'Remove key mapping' => 'حذف نگاشت کلید ',
        'Key mapping' => 'نگاشت کلید',
        'Map key' => 'نگاشت کلیدی ',
        'matching' => '',
        'to new key' => 'به کلید جدید',
        'Value mapping' => 'ارزش نگاشت ',
        'Map value' => 'ارزش نگاشت',
        'new value' => '',
        'Remove value mapping' => 'حذف ارزش نگاشت ',
        'New value map' => ' مقدار جدید نگاشت',
        'Add value mapping' => 'اضافه کردن ارزش نگاشت',
        'Do you really want to delete this key mapping?' => 'آیا شما واقعا می خواهید  این نگاشت کلید را حذف کنید؟',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingXSLT.tt
        'General Shortcuts' => '',
        'MacOS Shortcuts' => '',
        'Comment code' => '',
        'Uncomment code' => '',
        'Auto format code' => '',
        'Expand/Collapse code block' => '',
        'Find' => '',
        'Find next' => '',
        'Find previous' => '',
        'Find and replace' => '',
        'Find and replace all' => '',
        'XSLT Mapping' => '',
        'XSLT stylesheet' => '',
        'The entered data is not a valid XSLT style sheet.' => '',
        'Here you can add or modify your XSLT mapping code.' => '',
        'The editing field allows you to use different functions like automatic formatting, window resize as well as tag- and bracket-completion.' =>
            '',
        'Data includes' => '',
        'Select one or more sets of data that were created at earlier request/response stages to be included in mappable data.' =>
            '',
        'These sets will appear in the data structure at \'/DataInclude/<DataSetName>\' (see debugger output of actual requests for details).' =>
            '',
        'Force array for tags' => '',
        'Enter tags separated by space for which array representation should be forced.' =>
            '',
        'Keep XML attributes' => '',
        'Only needed for content type XML.' => '',
        'Data key regex filters (before mapping)' => '',
        'Data key regex filters (after mapping)' => '',
        'Regular expressions' => '',
        'Replace' => '',
        'Remove regex' => '',
        'Add regex' => '',
        'These filters can be used to transform keys using regular expressions.' =>
            '',
        'The data structure will be traversed recursively and all configured regexes will be applied to all keys.' =>
            '',
        'Use cases are e.g. removing key prefixes that are undesired or correcting keys that are invalid as XML element names.' =>
            '',
        'Example 1: Search = \'^jira:\' / Replace = \'\' turns \'jira:element\' into \'element\'.' =>
            '',
        'Example 2: Search = \'^\' / Replace = \'_\' turns \'16x16\' into \'_16x16\'.' =>
            '',
        'Example 3: Search = \'^(?<number>\d+) (?<text>.+?)\$\' / Replace = \'_\$+{text}_\$+{number}\' turns \'16 elementname\' into \'_elementname_16\'.' =>
            '',
        'For information about regular expressions in Perl please see here:' =>
            '',
        'Perl regular expressions tutorial' => '',
        'If modifiers are desired they have to be specified within the regexes themselves.' =>
            '',
        'Regular expressions defined here will be applied before the XSLT mapping.' =>
            '',
        'Regular expressions defined here will be applied after the XSLT mapping.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceOperationDefault.tt
        'Do you really want to delete this operation?' => 'آیا واقعا میخواهید این عملیات را حذف کنید؟',
        'Add Operation' => '',
        'Edit Operation' => '',
        'Operation Details' => 'جزئیات عملیات',
        'The name is typically used to call up this web service operation from a remote system.' =>
            ' نام بطور معمول از یک سیستم از راه دور برای تماس با این وب سرویس استفاده میشود . ',
        'Operation backend' => 'باطن عمل',
        'This Znuny operation backend module will be called internally to process the request, generating data for the response.' =>
            'این عملیات ماژول باطن Znuny صورت داخلی نامیده خواهد شد به پردازش درخواست، تولید داده ها را برای پاسخ.',
        'Mapping for incoming request data' => 'نگاشت برای درخواست داده های ورودی',
        'The request data will be processed by this mapping, to transform it to the kind of data Znuny expects.' =>
            'داده درخواست خواهد شد این نقشه برداری پردازش، آن را تبدیل به نوع Znuny داده انتظار دارد.',
        'Mapping for outgoing response data' => 'نگاشت برای پاسخ خروجی داده ',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'پاسخ داده خواهد شد این نقشه برداری پردازش، آن را تبدیل به نوع داده سیستم از راه دور انتظار.',
        'Include Ticket Data' => '',
        'Include ticket data in response.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPREST.tt
        'Network Transport' => '',
        'Properties' => 'خواص',
        'Route mapping for Operation' => 'نگاشت مسیر برای عملیات',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'تعریف مسیر است که باید به این عملیات نقشه برداری. متغیرهای مشخص شده توسط \':\' خواهد شد به نام وارد شده نقشه برداری و سرانجام همراه با دیگران به نقشه برداری. (به عنوان مثال / درخواست /: TicketID).',
        'Valid request methods for Operation' => 'روش درخواست معتبر برای عملیات',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'محدود کردن این عملیات به روش درخواست خاص. اگر هیچ روشی انتخاب نشده است همه درخواست ها پذیرفته خواهد شد .',
        'Parser backend for operation' => '',
        'Defines the incoming data format.' => '',
        'Parser backend parameter' => '',
        'Please click \'Save\' to get the corresponding backend parameter if the parser backend was changed.' =>
            '',
        'Maximum message length' => 'حداکثر طول پیام',
        'This field should be an integer number.' => 'در این زمینه باید یک عدد صحیح باشد.',
        'Here you can specify the maximum size (in bytes) of REST messages that Znuny will process.' =>
            'اینجا شما می توانید حداکثر اندازه (در بایت) از پیام های REST که Znuny پردازش را مشخص کنید.',
        'Send Keep-Alive' => 'ارسال حفظ',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'این تنظیمات را تعریف می کند اگر اتصالات ورودی باید بسته شدن و یا زنده نگه داشت.',
        'Endpoint' => 'نقطه پایانی',
        'URI to indicate specific location for accessing a web service.' =>
            '',
        'e.g https://www.example.com:10745/api/v1.0 (without trailing backslash)' =>
            'به عنوان مثال https://www.example.com:10745/api/v1.0 (بدون دنباله بک اسلش)',
        'Disable SSL hostname certificate verification' => '',
        'Disables hostname certificate verification. This is not recommended and should only be used in test environments.' =>
            '',
        'Timeout' => '',
        'Timeout value for requests.' => '',
        'Authentication' => 'احراز هویت',
        'An optional authentication mechanism to access the remote system.' =>
            '',
        'BasicAuth User' => '',
        'The user name to be used to access the remote system.' => 'نام کاربری مورد استفاده قرار گیرد برای دسترسی به سیستم از راه دور.',
        'BasicAuth Password' => '',
        'The password for the privileged user.' => 'رمز عبور برای کاربر ممتاز.',
        'JWT authentication: Key file' => '',
        'ATTENTION: Key file and/or password (if needed, see below) seem to be invalid.' =>
            '',
        'Path to private key file (PEM or DER). The key will be used to sign the JWT.' =>
            '',
        'JWT authentication: Key file password' => '',
        'ATTENTION: Password and/or key file (see above) seem to be invalid.' =>
            '',
        'JWT authentication: Certificate file' => '',
        'ATTENTION: Certificate file could not be parsed.' => '',
        'ATTENTION: Certificate is expired.' => '',
        'Path to X.509 certificate file (PEM). Data of the certificate can be used for the payload and/or header data of the JWT.' =>
            '',
        'JWT authentication: Algorithm' => '',
        'JWT authentication: TTL' => '',
        'TTL (time to live) in seconds for the JWT. This value will be used to calculate the expiration date which will be available in placeholders ExpirationDateTimestamp and ExpirationDateString.' =>
            '',
        'JWT authentication: Payload' => '',
        'Payload for JWT. Give key/value pairs (separated by ;), e.g.: Key1=Value1;Key2=Value2;Key3=Value3' =>
            '',
        'Available placeholders (prefixed with OTRS_JWT): ExpirationDateTimestamp, ExpirationDateString. Additionally if X.509 certificate support is present: CertSubject, CertIssuer, CertSerial, CertNotBefore, CertNotAfter, CertEmail, CertVersion.' =>
            '',
        'Placeholder usage example: Key1=<OTRS_JWT_ExpirationDateTimestamp>' =>
            '',
        'JWT authentication: Additional header data' => '',
        'Additional header data for JWT. Give key/value pairs (separated by ;), e.g.: Key1=Value1;Key2=Value2;Key3=Value3' =>
            '',
        'OAuth2 token configuration' => '',
        'Content type' => '',
        'The default content type added to HTTP header to use for POST and PUT requests.' =>
            '',
        'Use Proxy Options' => '',
        'Show or hide Proxy options to connect to the remote system.' => '',
        'Proxy Server' => 'سرور پروکسی',
        'URI of a proxy server to be used (if needed).' => 'URI از یک پروکسی سرور مورد استفاده قرار گیرد (در صورت نیاز).',
        'e.g. http://proxy_hostname:8080' => 'به عنوان مثال از http: // proxy_hostname: 8080',
        'Proxy User' => 'کاربر پروکسی',
        'The user name to be used to access the proxy server.' => 'نام کاربری برای دسترسی به پروکسی سرور مورد استفاده قرار گیرد .',
        'Proxy Password' => 'رمز عبور پروکسی',
        'The password for the proxy user.' => 'رمز عبور برای کاربران پروکسی.',
        'Skip Proxy' => '',
        'Skip proxy servers that might be configured globally?' => '',
        'Use SSL Options' => 'استفاده از گزینه های SSL',
        'Show or hide SSL options to connect to the remote system.' => 'نمایش یا عدم نمایش گزینه های SSL برای اتصال به سیستم از راه دور.',
        'Client Certificate' => '',
        'The full path and name of the SSL client certificate file (must be in PEM, DER or PKCS#12 format).' =>
            '',
        'e.g. /opt/znuny/var/certificates/SOAP/certificate.pem' => '',
        'Client Certificate Key' => '',
        'The full path and name of the SSL client certificate key file (if not already included in certificate file).' =>
            '',
        'e.g. /opt/znuny/var/certificates/SOAP/key.pem' => '',
        'Client Certificate Key Password' => '',
        'The password to open the SSL certificate if the key is encrypted.' =>
            '',
        'Certification Authority (CA) Certificate' => '',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'مسیر کامل و نام فایل گواهی اقتدار صدور گواهینامه که تایید گواهینامه SSL.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA/ca.pem' => 'به عنوان مثال /opt/znuny/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'مجوز (CA) راهنمای',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'مسیر کامل دایرکتوری که در آن اقتدار صدور گواهینامه گواهی CA ها در سیستم فایل ذخیره می شود.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA' => 'به عنوان مثال / انتخاب کردن / Znuny / ور / گواهی / SOAP / CA',
        'Controller mapping for Invoker' => ' برای  کنترل نگاشت Invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'کنترل که فراخواننده باید درخواست برای ارسال. متغیرهای مشخص شده توسط \':\' خواهد شد با مقدار داده جایگزین و سرانجام همراه با درخواست. (به عنوان مثال / درخواست /: TicketID صفحهی =: صفحهی و رمز عبور =: رمز عبور).',
        'Valid request command for Invoker' => 'درخواست فرماندهی معتبر برای Invoker',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'فرمان HTTP خاص برای استفاده برای درخواست با این Invoker (اختیاری).',
        'Default command' => 'دستور پیش فرض',
        'The default HTTP command to use for the requests.' => 'دستور HTTP به طور پیش فرض برای استفاده از درخواست.',
        'Additional response headers' => '',
        'Additional request headers' => '',
        'Header' => 'سرصفحه',
        'Add response header' => '',
        'Add request header' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPSOAP.tt
        'e.g. https://example.com:8000/Webservice/Example' => '',
        'Set SOAPAction' => '',
        'Set to "Yes" in order to send a filled SOAPAction header.' => '',
        'Set to "No" in order to send an empty SOAPAction header.' => '',
        'Set to "Yes" in order to check the received SOAPAction header (if not empty).' =>
            '',
        'Set to "No" in order to ignore the received SOAPAction header.' =>
            '',
        'SOAPAction scheme' => '',
        'Select how SOAPAction should be constructed.' => '',
        'Some web services require a specific construction.' => '',
        'Some web services send a specific construction.' => '',
        'SOAPAction separator' => 'تفکیک کننده SOAPAction',
        'Character to use as separator between name space and SOAP operation.' =>
            '',
        'Usually .Net web services use "/" as separator.' => '',
        'SOAPAction free text' => '',
        'Text to be used to as SOAPAction.' => '',
        'Namespace' => 'فضای نام',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI به روش SOAP زمینه ای، کاهش ابهامات.',
        'e.g urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions' =>
            'به عنوان مثال کوزه: Znuny-COM: صابون: توابع و یا http://www.example.com/GenericInterface/actions',
        'Omit namespace prefix' => '',
        'Omits the namespace prefix (e. g. namesp1:) in root tag of SOAP message.' =>
            '',
        'Request name scheme' => ' درخواست پاسخ به طرح نام',
        'Select how SOAP request function wrapper should be constructed.' =>
            'انتخاب کنید که چگونه SOAP تابع درخواست لفاف بسته بندی باید ساخته شود.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '"FunctionName» به عنوان مثال برای نام واقعی invoker / عملیات استفاده می شود.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '"گه از FREETEXT» به عنوان مثال برای ارزش پیکربندی واقعی استفاده می شود.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'متن باید به عنوان نام تابع لفاف بسته بندی پسوند و یا جایگزینی استفاده  شود.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'لطفا عنصر XML نامگذاری محدودیت در نظر (به عنوان مثال استفاده نمیشود "<" و "و").',
        'Response name scheme' => 'درخواست پاسخ به طرح نام',
        'Select how SOAP response function wrapper should be constructed.' =>
            'انتخاب کنید که چگونه تابع پاسخ SOAP لفاف بسته بندی باید ساخته شود.',
        'Response name free text' => 'نام پاسخ های متنی رایگان',
        'Here you can specify the maximum size (in bytes) of SOAP messages that Znuny will process.' =>
            'اینجا شما می توانید حداکثر اندازه (در بایت) از پیام های SOAP که Znuny پردازش می کند را مشخص کنید.',
        'Fixed namespace prefix' => '',
        'Use a fixed namespace prefix (e. g. myns:) for the root tag of a SOAP message.' =>
            '',
        'Suffix for response tag' => '',
        'Usually Znuny expects a response tag like "&lt;Operation&gt;Response". This setting can change the "Response" part, e. g. to "Result".' =>
            '',
        'Encoding' => 'کدگذاری',
        'The character encoding for the SOAP message contents.' => 'رمزگذاری کاراکتر برای محتویات پیام SOAP.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'به عنوان مثال UTF-8، latin1، ISO-8859-1، cp1250، و غیره',
        'User' => 'کاربر',
        'Password' => 'رمز عبور',
        'Disable SSL hostname verification' => '',
        'Disables (setting "Yes") or enables (setting "No", default) the SSL hostname verification.' =>
            '',
        'Sort options' => 'گزینه های مرتب سازی',
        'Add new first level element' => 'اضافه کردن عنصر جدید سطح اول',
        'Element' => 'عنصر',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'مرتب کردن عازم ناحیه دور دست برای زمینه های XML (ساختار شروع زیر نام تابع لفاف بسته بندی) - مشاهده اسناد و مدارک برای حمل و نقل SOAP.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebservice.tt
        'Add Web Service' => '',
        'Clone Web Service' => '',
        'The name must be unique.' => 'این نام باید منحصر به فرد باشد.',
        'Clone' => 'کلون',
        'Export Web Service' => '',
        'Import web service' => 'وب سرویس واردات',
        'Configuration File' => 'فایل پیکربندی',
        'The file must be a valid web service configuration YAML file.' =>
            'فایل باید یک وب سرویس فایل پیکربندی YAML معتبر باشد.',
        'Here you can specify a name for the webservice. If this field is empty, the name of the configuration file is used as name.' =>
            '',
        'Import' => 'ورود اطلاعات',
        'Configuration History' => '',
        'Delete web service' => 'حذف وب سرویس',
        'Do you really want to delete this web service?' => 'آیا شما واقعا  حذف این وب سرویس رامی خواهید؟',
        'Ready2Adopt Web Services' => '',
        'Import Ready2Adopt web service' => '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'پس از این که تنظیمات را ذخیره کنید به شما خواهد شد دوباره به صفحه ویرایش هدایت می شوید.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'اگر می خواهید بازگشت به نمای کلی لطفا با کلیک بر \ "برو به بررسی اجمالی " را فشار دهید.',
        'Edit Web Service' => '',
        'Remote system' => 'سیستم از راه دور',
        'Provider transport' => 'ارائه دهنده حمل و نقل ',
        'Requester transport' => ' درخواست حمل و نقل',
        'Debug threshold' => 'آستانه اشکال زدایی',
        'In provider mode, Znuny offers web services which are used by remote systems.' =>
            'در حالت ارائه دهنده، Znuny ارائه می دهد خدمات وب که توسط سیستم های راه دور استفاده می شود.',
        'In requester mode, Znuny uses web services of remote systems.' =>
            'در حالت درخواست، Znuny با استفاده از خدمات وب سیستم های از راه دور.',
        'Network transport' => 'انتقال شبکه ای',
        'Error Handling Modules' => '',
        'Error handling modules are used to react in case of errors during the communication. Those modules are executed in a specific order, which can be changed by drag and drop.' =>
            '',
        'Add error handling module' => '',
        'Operations are individual system functions which remote systems can request.' =>
            'عملیات توابع سیستم منحصر به فرد است که سیستم از راه دور می توانید درخواست هستند.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Invokers آماده سازی داده برای یک درخواست به یک وب سرویس از راه دور، و پردازش داده ها پاسخ آن است.',
        'Controller' => 'کنترل کننده',
        'Inbound mapping' => 'نقشه برداری بین المللی به درون',
        'Outbound mapping' => 'نقشه برداری عازم ناحیه دور دست',
        'Delete this action' => 'حذف این اقدام',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'حداقل یک %s دارای یک کنترلر است که یا فعال و یا وجود ندارد، لطفا ثبت نام کنترل را بررسی کنید و یا حذف %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebserviceHistory.tt
        'Go back to Web Service' => 'بازگشت به وب سرویس',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'در اینجا شما می توانید نسخه های قدیمی تر از پیکربندی وب سرویس فعلی، صادرات مشاهده و یا حتی آنها را بازگرداند.',
        'History' => 'سابقه',
        'Configuration History List' => 'فهرست تاریخچه پیکربندی',
        'Version' => 'نسخه',
        'Create time' => ' زمان ساخت',
        'Select a single configuration version to see its details.' => 'یک نسخه پیکربندی را انتخاب کنید برای دیدن جزئیات آن است.',
        'Export web service configuration' => 'صادرات پیکربندی وب سرویس',
        'Restore web service configuration' => 'بازگرداندن تنظیمات وب سرویس',
        'Do you really want to restore this version of the web service configuration?' =>
            'آیا شما واقعا می خواهید برای بازگرداندن این نسخه از پیکربندی وب سرویس؟',
        'Your current web service configuration will be overwritten.' => 'پیکربندی وب سرویس فعلی خود بازنویسی خواهد شد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGroup.tt
        'Add Group' => 'ایجاد گروه',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'گروه admin برای دسترسی به بخش مدیریت سیستم و گروه stats برای دسترسی به بخش گزارش ها است.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'گروه‌های جدید بسازید تا دسترسی‌ها را برای گروه‌های مختلف کارشناسان مدیریت کنید (مثال: بخش خرید، بخش پشتیبانی، بخش فروش و ...)',
        'It\'s useful for ASP solutions. ' => 'این برای راه‌حل‌های ASP مفید می‌باشد.',
        'Agents ↔ Groups' => '',
        'Roles ↔ Groups' => '',
        'Group Management' => 'مدیریت گروه‌ها',
        'Edit Group' => 'ویرایش گروه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminLog.tt
        'Clear log entries' => '',
        'Here you will find log information about your system.' => 'در اینجا اطلاعات ثبت شده‌ای در رابطه با سیستم پیدا خواهید کرد.',
        'Hide this message' => 'پنهان کردن این پیغام',
        'System Log' => 'وقایع ثبت شده سیستم',
        'Recent Log Entries' => 'وقایع ثبت شده جدید',
        'Facility' => 'سهولت',
        'Message' => 'پیام',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminMailAccount.tt
        'Add Mail Account' => 'افزودن حساب ایمیل',
        'Filter for Mail Accounts' => '',
        'Filter for mail accounts' => '',
        'All incoming emails with one account will be dispatched in the selected queue.' =>
            '',
        'If your account is marked as trusted, the X-OTRS headers already existing at arrival time (for priority etc.) will be kept and used, for example in PostMaster filters.' =>
            '',
        'Outgoing email can be configured via the Sendmail* settings in %s.' =>
            '',
        'System Configuration' => '',
        'Mail Account Management' => 'مدیریت حساب‌های ایمیل ',
        'Edit Mail Account for host' => '',
        'and user account' => '',
        'Host' => 'میزبان',
        'Authentication type' => '',
        'Fetch mail' => 'واکشی ایمیل',
        'Delete account' => 'حذف حساب',
        'Do you really want to delete this mail account?' => '',
        'Example: mail.example.com' => 'مثال: mail.example.com',
        'IMAP Folder' => 'پوشه IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'فقط این را تغییر دهید اگر شما نیاز به دریافت نامه از پوشه های مختلف از صندوق.',
        'Trusted' => 'مجاز',
        'Dispatching' => 'توزیع',
        'Edit Mail Account' => 'ویرایش حساب ایمیل',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNavigationBar.tt
        'Administration Overview' => '',
        'Favorites' => '',
        'You can add favorites by moving your cursor over items on the right side and clicking the star icon.' =>
            '',
        'Links' => '',
        'View the admin manual on Github' => '',
        'Filter for Items' => '',
        'No Matches' => '',
        'Sorry, your search didn\'t match any items.' => '',
        'Set as favorite' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEvent.tt
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'در اینجا شما می توانید یک فایل پیکربندی برای واردات اطلاعیه بلیط را به سیستم خود را بارگذاری کنید. فایل نیاز به در فرمت .yml باشد که توسط ماژول اطلاع رسانی بلیط صادر می شود.',
        'Ticket Notification Management' => 'درخواست مدیریت اطلاع رسانی',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'در اینجا شما می توانید انتخاب کنید که وقایع این اطلاع رسانی را آغاز کند. یک فیلتر بلیط اضافی را می توان زیر اعمال شده به فقط برای بلیط با معیارهای خاصی را ارسال کنید.',
        'Ticket Filter' => 'فیلتر درخواست',
        'Lock' => 'تحویل گرفتن',
        'SLA' => 'موافقت نامه مطلوبیت ارائه خدمات (SLA)',
        'Customer User ID' => '',
        'Article Filter' => 'فیلتر مطلب',
        'Only for ArticleCreate and ArticleSend event' => 'فقط برای ArticleCreate و ArticleSend رویداد',
        'Article sender type' => ' نوع نوشته فرستنده',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'اگر ArticleCreate یا ArticleSend به عنوان یک رویداد ماشه استفاده می شود، شما نیاز به مشخص از یک فیلتر مقاله است. لطفا حداقل یکی از زمینه های مقاله فیلتر را انتخاب کنید.',
        'Customer visibility' => '',
        'Communication channel' => '',
        'Include attachments to notification' => 'الحاق پیوست‌ها به اعلان',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'کاربر اطلاع فقط یک بار در روز با بلیط تک با استفاده از یک حمل و نقل انتخاب در مورد.',
        'This field is required and must have less than 4000 characters.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportEmailSettings.tt
        'Use comma or semicolon to separate email addresses.' => '',
        'You can use Znuny-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportWebserviceSettings.tt
        'Web service name' => '',
        'Invoker' => '',
        'Asynchronous event triggers will be handled as separate process by the scheduler daemon (recommended).' =>
            '',
        'Synchronous event triggers will be processed directly during the web request.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Edit.tt
        'Queue Management' => '',
        'Manage OAuth2 tokens and their configurations' => '',
        'Add by template' => '',
        'Base configuration' => '',
        'An OAuth2 token configuration with this name already exists.' =>
            '',
        'Client ID' => '',
        'Client secret' => '',
        'URL for authorization code' => '',
        'URL for token by authorization code' => '',
        'URL for token by refresh token' => '',
        'Access token scope' => '',
        'Template' => 'قالب',
        'This is the template that was used to create this OAuth2 token configuration.' =>
            '',
        'Notifications' => '',
        'Expired token' => '',
        'Shows a notification for admins below the top menu if the OAuth2 token has expired.' =>
            '',
        'Expired refresh token' => '',
        'Shows a notification for admins below the top menu if the OAuth2 refresh token has expired.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Overview.tt
        'Add OAuth2 token configuration' => '',
        'Add a new OAuth2 token configuration based on the selected template.' =>
            '',
        'Import and export' => '',
        'Upload a YAML file to import token configurations. See documentation on OAuth2 token management for further details.' =>
            '',
        'Overwrite existing token configurations' => '',
        'Import token configurations' => '',
        'Export token configurations' => '',
        'OAuth2 token configurations' => '',
        'Token status' => '',
        'Refresh token status' => '',
        'Validity of token configuration' => '',
        'Last token request failed.' => '',
        'Token has expired on %s.' => '',
        'Token is valid until %s.' => '',
        'No token was requested yet.' => '',
        'Last (refresh) token request failed.' => '',
        'Refresh token has expired on %s.' => '',
        'Refresh token has expired.' => '',
        'Refresh token is valid until %s.' => '',
        'Refresh token is valid (without expiration date).' => '',
        'No refresh token was requested yet.' => '',
        'Refresh token request is not configured.' => '',
        'Request new token' => '',
        'Delete this token and its configuration.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPGP.tt
        'PGP support is disabled' => 'پشتیبانی PGP غیر فعال است',
        'To be able to use PGP in Znuny, you have to enable it first.' =>
            'برای اینکه قادر به استفاده از PGP در Znuny باشید، شما باید برای اولین بار آن را فعال کنید .',
        'Enable PGP support' => 'فعال کردن پشتیبانی از PGP',
        'Faulty PGP configuration' => 'پیکربندی PGP معیوب',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'پشتیبانی PGP فعال است، اما پیکربندی های مربوطه دارای خطا است. لطفا پیکربندی با استفاده از دکمه زیر را بررسی کنید.',
        'Configure it here!' => 'پیکربندی آن را در اینجا!',
        'Check PGP configuration' => 'بررسی پیکربندی PGP',
        'Add PGP Key' => 'افزودن کلید PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'از این طریق شما می‌توانید مستقیما کلید‌های خود را درسیستم تنظیم نمائید',
        'Introduction to PGP' => 'معرفی به PGP',
        'PGP Management' => 'مدیریت رمزگذاری PGP',
        'Identifier' => 'شناسه',
        'Bit' => 'Bit',
        'Fingerprint' => 'اثر انگشت',
        'Expires' => 'ابطال',
        'Delete this key' => 'حذف این کلید',
        'PGP key' => 'کلید PGP',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPackageManager.tt
        'Package Manager' => 'مدیریت بسته‌ها',
        'Uninstall Package' => '',
        'Uninstall package' => 'حذف بسته',
        'Do you really want to uninstall this package?' => 'از حذف این بسته اطمینان دارید؟',
        'Reinstall package' => 'نصب مجدد بسته',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'آیا واقعا می‌خواهید این بسته را مجددا نصب نمایید؟ تمام تغییرات دستی از بین خواهد رفت.',
        'Go to updating instructions' => '',
        'Go to znuny.org' => '',
        'package information' => '',
        'Package installation requires a patch level update of Znuny.' =>
            '',
        'Package update requires a patch level update of Znuny.' => '',
        'Please note that your installed Znuny version is %s.' => '',
        'To install this package, you need to update Znuny to version %s or newer.' =>
            '',
        'This package can only be installed on Znuny version %s or older.' =>
            '',
        'This package can only be installed on Znuny version %s.' => '',
        'Why should I keep Znuny up to date?' => '',
        'You will receive updates about relevant security issues.' => '',
        'You will receive updates for all other relevant Znuny issues.' =>
            '',
        'How can I do a patch level update if I don’t have a contract?' =>
            '',
        'Please find all relevant information within the updating instructions at %s.' =>
            '',
        'In case you would have further questions we would be glad to answer them.' =>
            'در مورد شما می سوال بیشتر دارند ما خوشحال خواهد بود به آنها پاسخ دهد.',
        'Please visit our customer portal and file a request.' => '',
        'Install Package' => 'نصب بسته',
        'Update Package' => '',
        'Package' => '',
        'Required package %s is already installed.' => '',
        'Required Perl module %s is already installed.' => '',
        'Required package %s needs to get installed!' => '',
        'Required package %s needs to get updated to version %s!' => '',
        'Required Perl module %s needs to get installed or updated!' => '',
        'Continue' => 'ادامه',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'لطفا مطمئن شوید که پایگاه داده خود را بسته بر می پذیرد %s MB در اندازه (در حال حاضر تنها بسته می پذیرد تا %s MB). لطفا تنظیمات max_allowed_packet از پایگاه داده خود را به منظور جلوگیری از اشتباهات وفق دهند.',
        'Install' => 'نصب',
        'Update' => 'بروزرسانی',
        'Update repository information' => 'به‌روز رسانی اطلاعات مخزن',
        'Update all installed packages' => '',
        'Online Repository' => 'مخزن آنلاین بسته‌ها',
        'Vendor' => 'عرضه‌کننده',
        'Action' => 'فعالیت',
        'Module documentation' => 'مستندات ماژول',
        'Local Repository' => 'مخزن محلی بسته‌ها',
        'Uninstall' => 'حذف بسته',
        'Package not correctly deployed! Please reinstall the package.' =>
            'بسته به درستی قرار نگرفته! لطفا بسته رامجدد نصب کنید .',
        'Reinstall' => 'نصب مجدد',
        'Download package' => 'دریافت بسته',
        'Rebuild package' => 'ساخت مجدد بسته',
        'Package Information' => '',
        'Metadata' => 'ابرداده',
        'Change Log' => 'وقایع ثبت شده تغییرات',
        'Date' => 'تاریخ',
        'List of Files' => 'فهرست فایل‌ها',
        'Permission' => 'حقوق دسترسی',
        'Size' => 'اندازه',
        'Problem' => 'مساله است.',
        'OK' => 'خوب',
        'Download file from package!' => 'دریافت فایل از بسته!',
        'Required' => 'الزامی',
        'Primary Key' => 'کلید اولیه',
        'Auto Increment' => 'افزایش خودکار',
        'SQL' => 'SQL',
        'File Differences for File %s' => '',
        'File differences for file %s' => 'تفاوت‌های فایل برای فایل %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPerformanceLog.tt
        'This feature is enabled!' => 'این ویژگی فعال است.',
        'Just use this feature if you want to log each request.' => 'این ویژگی امکان ثبت همه درخواست‌ها را می‌دهد',
        'Activating this feature might affect your system performance!' =>
            'فعال کردن این خاصیت ممکن است سیستم شما را کند سازد!',
        'Disable it here!' => 'اینجا غیر فعال نمائید',
        'Logfile too large!' => 'فایل ثبت وقایع بیش از حد بزرگ است',
        'The logfile is too large, you need to reset it' => 'فایل ثبت وقایع بیش از حد بزرگ است، نیاز دارید که مجدد آن را بسازید',
        'Performance Log' => 'گزارش عملکرد',
        'Range' => 'حدود',
        'last' => 'آخرین',
        'Interface' => 'واسط',
        'Requests' => 'درخواست‌ها',
        'Min Response' => 'کمترین پاسخ',
        'Max Response' => 'بیشترین پاسخ',
        'Average Response' => 'میانگین پاسخ',
        'Period' => 'دوره',
        'minutes' => 'دقیقه',
        'Min' => 'کمترین',
        'Max' => 'بیشترین',
        'Average' => 'میانگین',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPostMasterFilter.tt
        'Add PostMaster Filter' => 'افزودن فیلتر پستی',
        'Filter for PostMaster Filters' => '',
        'Filter for PostMaster filters' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'برای توزیع یا پالایش ایمیل‌ها وارده بر اساس هدرهای ایمیل. تطابق بر اساس عبارات منظم نیز مجاز است.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'برای انطباق اختصاصی Email از EMAILADDRESS:info@example.com در فرستنده،گیرنده و رونوشت استفاده نمائید.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'اگر از عبارات منظم استفاده می‌کنید، می‌توانید از مقدار تطابق یافته در () به عنوان [***] در عملیات Set استفاده نمایید.',
        'You can also use named captures %s and use the names in the \'Set\' action %s (e.g. Regexp: %s, Set action: %s). A matched EMAILADDRESS has the name \'%s\'.' =>
            '',
        'PostMaster Filter Management' => 'مدیریت فیلتر پستی',
        'Edit PostMaster Filter' => 'ویرایش فیلتر پستی',
        'Delete this filter' => 'حذف این فیلتر',
        'Do you really want to delete this postmaster filter?' => '',
        'A postmaster filter with this name already exists!' => '',
        'Filter Condition' => 'شرط تطابق',
        'AND Condition' => 'و شرایط',
        'Search header field' => '',
        'for value' => '',
        'The field needs to be a valid regular expression or a literal word.' =>
            'زمینه نیاز به یک عبارت منظم معتبر و یا یک کلمه واقعی.',
        'Negate' => 'خنثی کردن',
        'Set Email Headers' => 'تنظیم هدرهای ایمیل',
        'Set email header' => ' تنظیم هدر ایمیل',
        'with value' => '',
        'The field needs to be a literal word.' => 'زمینه نیاز به یک کلمه دارد .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPriority.tt
        'Add Priority' => 'افزودن اولویت',
        'Filter for Priorities' => '',
        'Filter for priorities' => '',
        'Configure Priority Visibility and Defaults' => '',
        'Priority Management' => 'مدیریت اولویت‌ها',
        'Edit Priority' => 'ویرایش الویت',
        'Color' => '',
        'This priority is present in a SysConfig setting, confirmation for updating settings to point to the new priority is needed!' =>
            '',
        'This priority is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagement.tt
        'Filter for Processes' => 'فیلتر برای پردازش',
        'Filter for processes' => '',
        'Create New Process' => 'خلق فرآیند جدید',
        'Deploy All Processes' => 'استقرار تمام فرآیندها',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'در اینجا شما می توانید یک فایل پیکربندی برای وارد یک فرایند را به سیستم خود را بارگذاری کنید. فایل نیاز به در فرمت .yml باشد که توسط ماژول مدیریت فرایند صادر می شود.',
        'Upload process configuration' => ' روند  بارگذاری پیکربندی',
        'Import process configuration' => ' روند دریافت پیکربندی',
        'Ready2Adopt Processes' => '',
        'Here you can activate Ready2Adopt processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            '',
        'Import Ready2Adopt process' => '',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'برای ایجاد یک فرایند جدید شما هم می توانید یک فرایند است که از یک سیستم دیگر صادر شد وارد و یا ایجاد یک جدید کامل.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'تغییرات در فرایندهای اینجا تنها رفتار سیستم را تحت تاثیر قرار، اگر شما داده های فرایند همگام سازی. با هماهنگ سازی فرآیندها، تغییرات تازه ساخته شده را به پیکربندی نوشته شده است.',
        'Access Control Lists (ACL)' => 'فهرست سطخ دسترسی (ACL)',
        'Generic Agent' => '',
        'Manage Process Widget Groups' => '',
        'Processes' => 'فرایند ها',
        'Process name' => 'نام فرایند',
        'Print' => 'چاپ',
        'Export Process Configuration' => 'استخراج پیکربندی فرایند',
        'Copy Process' => 'فرایند کپی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivity.tt
        'Please note, that changing this activity will affect the following processes' =>
            'لطفا توجه داشته باشید، که در حال تغییر این فعالیت مراحل زیر را تحت تاثیر قرار',
        'Activity' => 'فعالیت',
        'Activity Name' => 'نام فعالیت',
        'Scope' => '',
        'Scope Entity ID' => '',
        'This field is required for activities with a scope.' => '',
        'Activity Dialogs' => 'تبادل فعالیت',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'شما می توانید فعالیت تبادل به این فعالیت با کشیدن عناصر با ماوس از لیست سمت چپ به لیست راست اختصاص دهید.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'مرتب سازی عناصر در لیست با کشیدن و رها کردن نیز ممکن است.',
        'Available Activity Dialogs' => 'در دسترس تبادل فعالیت',
        'Filter available Activity Dialogs' => 'فیلتر در دسترس تبادل فعالیت',
        'Also show global %s' => '',
        'Name: %s, EntityID: %s' => 'نام: %s ، EntityID: %s',
        'Create New Activity Dialog' => 'ساختن فعالیت جدید گفت و گو',
        'Assigned Activity Dialogs' => 'فعالیتهای واگذارشده به گفتگو',
        'Filter Assigned Activity Dialogs' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivityDialog.tt
        'Please note that changing this activity dialog will affect the following activities' =>
            'لطفا توجه داشته باشید که در حال تغییر فعالیت این گفت و گو  فعالیت های زیر را تحت تاثیر قرارخواهد داد',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'لطفا توجه داشته باشید که کاربران مشتری قادر به دیدن و یااستفاده از زمینه های زیر نخواهند بود: مالک، مسئول، قفل، PendingTime و CustomerID.',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'زمینه صف تنها می تواند توسط مشتریان زمانی که یک بلیط جدید ایجاد استفاده می شود.',
        'Activity Dialog' => 'فعالیت های گفت و گو',
        'Activity dialog Name' => 'فعالیت نام گفت و گو',
        'Available in' => 'قابل دسترسی در',
        'Description (short)' => 'توضیحات (کوتاه)',
        'Description (long)' => 'توضیحات (طولانی)',
        'The selected permission does not exist.' => 'اجازه انتخاب وجود ندارد.',
        'Required Lock' => 'قفل مورد نیاز',
        'The selected required lock does not exist.' => 'انتخاب قفل مورد نیاز وجود ندارد.',
        'This field is required for activitiy dialogs with a scope.' => '',
        'Submit Advice Text' => 'ارسال مشاوره متن',
        'Submit Button Text' => 'ارایه دادن دکمه متن',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'شما می توانید زمینه این فعالیت گفت و گو با کشیدن عناصر با ماوس از لیست سمت چپ به لیست راست اختصاص دهید.',
        'Available Fields' => 'زمینه های موجود',
        'Filter available fields' => 'فیلتر زمینه های موجود',
        'Assigned Fields' => 'زمینه اختصاص داده',
        'Filter assigned fields' => '',
        'Communication Channel' => '',
        'Is visible for customer' => '',
        'Text Template' => 'قالب متن',
        'Auto fill' => '',
        'Display' => 'نمایش',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementPath.tt
        'Path' => 'PATH, 1998',
        'Edit this transition' => 'ویرایش این انتقال',
        'Transition Actions' => 'عملیات انتقال',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'شما می توانید عملیات انتقال به این انتقال با کشیدن عناصر با ماوس از لیست سمت چپ به لیست راست اختصاص دهید.',
        'Available Transition Actions' => 'عملیات انتقال در دسترس',
        'Filter available Transition Actions' => 'فیلتر عملیات انتقال در دسترس',
        'Create New Transition Action' => 'ایجاد جدید انتقال اقدام',
        'Assigned Transition Actions' => 'عملیات انتقال اختصاص داده',
        'Filter assigned Transition Actions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessAccordion.tt
        'Activities' => 'فعالیت',
        'Filter Activities...' => 'فیلتر فعالیت ...',
        'Create New Activity' => 'ساختن فعالیت جدید',
        'Filter Activity Dialogs...' => 'فیلتر فعالیت تبادل ...',
        'Transitions' => 'انتقال ها',
        'Filter Transitions...' => 'فیلتر انتقال، ...',
        'Create New Transition' => 'ساختن انتقال جدید',
        'Filter Transition Actions...' => 'عملیات فیلتر گذار ...',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessEdit.tt
        'Print process information' => 'اطلاعات فرآیند چاپ',
        'Delete Process' => 'حذف فرآیند',
        'Delete Inactive Process' => 'حذف فرآیند های غیر فعال',
        'Available Process Elements' => 'عناصر فرآیند در دسترس',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'عناصر ذکر شده در بالا در این نوار کناری را می توان به منطقه بوم در سمت راست با استفاده از کشیدن و رها نقل مکان کرد.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'شما می توانید فعالیت در منطقه بوم جایی برای اختصاص دادن این فعالیت به این فرآیند است.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'برای تعیین فعالیت گفت و گو به یک فعالیت رها کردن عنصر فعالیت محاوره ای از این نوار کناری بر فعالیت قرار داده شده در منطقه بوم.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'شما می توانید یک ارتباط بین دو فعالیت با حذف عنصر انتقال بیش از فعالیت شروع اتصال شروع می شود. پس از آن شما می توانید به پایان شل از فلش به پایان فعالیت درسایت حرکت می کند.',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'اقدامات را می توان به انتقال با حذف اقدام عنصر بر روی برچسب از یک انتقال داده می شود.',
        'Edit Process' => 'ویرایش فرآیند',
        'Edit Process Information' => 'ویرایش اطلاعات فرآیند',
        'Process Name' => 'نام پردازش',
        'The selected state does not exist.' => 'وضعیت انتخاب شده وجود ندارد.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'اضافه کردن و ویرایش فعالیت، تبادل و انتقال فعالیت',
        'Show EntityIDs' => 'نمایش EntityIDs',
        'Extend the width of the Canvas' => 'گسترش عرض بوم',
        'Extend the height of the Canvas' => 'گسترش ارتفاع بوم',
        'Remove the Activity from this Process' => 'حذف فعالیت از این روند',
        'Edit this Activity' => 'ویرایش این فعالیت',
        'Save Activities, Activity Dialogs and Transitions' => 'ذخیره فعالیت ها، فعالیت تبادل و انتقال',
        'Do you really want to delete this Process?' => 'آیا واقعا میخواهید این روند را حذف کنید؟',
        'Do you really want to delete this Activity?' => 'آیا شما واقعا می خواهید  این فعالیت را حذف کنید ؟',
        'Do you really want to delete this Activity Dialog?' => 'آیا شما واقعا می خواهید  این فعالیت گفت و گو را حذف کنید؟',
        'Do you really want to delete this Transition?' => 'آیا واقعا میخواهید این انتقال را حذف کنید؟',
        'You can not edit a transition before it\'s connected to two activities.' =>
            '',
        'Do you really want to delete this Transition Action?' => 'آیا شما واقعا می خواهید  این حرکت انتقال را حذف کنید؟',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'آیا شما واقعا می خواهید به حذف این فعالیت را از بوم؟ این فقط می تواند با ترک این صفحه نمایش بدون ذخیره خنثی کرد.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'آیا شما واقعا می خواهید به حذف این گذار از بوم؟ این فقط می تواند با ترک این صفحه نمایش بدون ذخیره خنثی کرد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessNew.tt
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'در این صفحه، شما می توانید یک فرآیند جدید ایجاد کنید. به منظور ایجاد فرآیند جدید در دسترس کاربران، لطفا مطمئن شوید که به مجموعه دولت خود را به «فعال» و همگام سازی پس از اتمام کار خود را.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessPrint.tt
        'Start Activity' => ' شروع فعالیت',
        'Contains %s dialog(s)' => 'شامل %s گفتگوی (بازدید کنندگان)',
        'Assigned dialogs' => 'گفتگوی معین',
        'Activities are not being used in this process.' => 'درفعالیت های دیگر هم این فرایند استفاده نمی شود.',
        'Assigned fields' => 'زمینه معین',
        'Activity dialogs are not being used in this process.' => 'تبادل فعالیت هستند که در این فرایند استفاده نمی شود.',
        'Condition linking' => ' شرط ارتباط',
        'Transitions are not being used in this process.' => 'انتقال هستند که در این فرایند استفاده نمی شود.',
        'Module name' => 'نام ماژول',
        'Configuration' => 'پیکر بندی',
        'Transition actions are not being used in this process.' => 'اقدامات انتقال هستند که در این فرایند استفاده نمی شود.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransition.tt
        'Please note that changing this transition will affect the following processes' =>
            'لطفا توجه داشته باشید که در حال تغییر این انتقال را به مراحل زیر را تحت تاثیر قرار',
        'Transition' => 'انتقال',
        'Transition Name' => 'نام انتقال',
        'This field is required for transitions with a scope.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransitionAction.tt
        'Please note that changing this transition action will affect the following processes' =>
            'لطفا توجه داشته باشید که در حال تغییر این عمل انتقال فرآیندهای زیر را تحت تاثیر قرار',
        'Transition Action' => 'انتقال عمل',
        'Transition Action Name' => 'نام انتقال فعالیت',
        'Transition Action Module' => 'انتقال واحد فعالیت',
        'This field is required for transition actions with a scope.' => '',
        'Config Parameters' => 'پارامترهای پیکربندی',
        'Add a new Parameter' => 'اضافه کردن یک پارامتر جدید',
        'Remove this Parameter' => 'حذف این پارامتر',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueue.tt
        'Add Queue' => 'افزودن صف درخواست',
        'Filter for Queues' => 'فیلتر برای صف‌های درخواست',
        'Filter for queues' => '',
        'Email Addresses' => 'آدرس‌های ایمیل',
        'PostMaster Mail Accounts' => 'حساب‌های ایمیل پستی',
        'Salutations' => 'عنوان',
        'Signatures' => 'امضاء',
        'Templates ↔ Queues' => '',
        'Configure Working Hours' => '',
        'Configure Queue Related Settings' => '',
        'Edit Queue' => 'ویرایش صف درخواست',
        'A queue with this name already exists!' => 'یک صف با این نام وجود دارد.',
        'This queue is present in a SysConfig setting, confirmation for updating settings to point to the new queue is needed!' =>
            '',
        'Sub-queue of' => 'زیر صف مربوط به',
        'Follow up Option' => 'گزینه پیگیری',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'مشخص می‌کند که اگر پیگیری درخواست‌های بسته شده باعث باز شدن مجدد آن شود، رد شده یا به یک درخواست جدید منتهی گردد.',
        'Unlock timeout' => 'مهلت تحویل دادن درخواست',
        '0 = no unlock' => '0 = تحویل داده نشود',
        'hours' => 'ساعت',
        'Only business hours are counted.' => ' فقط ساعات اداری محاسبه شده است ',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'اگر یک کارشناس درخواستی را تحویل بگیرد و آن را قبل از زمان خاتمه تحویل بگذرد، نبندد، درخواست از دست کارشناس خارج شده و برای کارشناسان دیگر در دسترس خواهند شد.',
        'Notify by' => 'اعلان توسط',
        '0 = no escalation' => '0 = بدون زمان پاسخگویی نهایی',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'اگر مشخصات تماس مشترک، ایمیل خارجی و یا تلفن، قبل از اینکه زمان تعریف شده در اینجا به پایان برسد، اضافه نشده باشد، درخواست به زمان نهایی پاسخ خود رسیده است.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'اگر یک مطلب افزوده شده موجود باشد، مانند یک پیگیری از طریق ایمیل یا پرتال مشتری، زمان به‌روز رسانی برای زمان نهایی پاسخگویی تنظیم مجدد می‌شود. اگر مشخصات تماس مشترک، ایمیل خارجی و یا تلفن، قبل از اینکه زمان تعریف شده در اینجا به پایان برسد، اضافه نشده باشد، درخواست به زمان نهایی پاسخ خود رسیده است.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'اگر درخواستی تنظیم نشده که قبل از زمان تعریف شده در اینجا بسته شده، زمان پاسخگویی نهایی می‌رسد.',
        'Ticket lock after a follow up' => 'درخواست بعد از پیگیری تحویل گرفته شود',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'اگر یک درخواست بسته شده و مشترک یک پیگیری ارسال کند، درخواست تحویل صاحب قدیمی خواهد شد.',
        'System address' => 'آدرس سیستم',
        'Will be the sender address of this queue for email answers.' => 'آدرس ارسال کننده این لیست برای پاسخ به ایمیل استفاده خواهد شد.',
        'Default sign key' => 'کلید امضای پیش‌فرض',
        'To use a sign key, PGP keys or S/MIME certificates need to be added with identifiers for selected queue system address.' =>
            '',
        'Salutation' => 'عنوان',
        'The salutation for email answers.' => 'عنوان برای پاسخ‌های ایمیلی',
        'Signature' => 'امضاء',
        'The signature for email answers.' => 'یامضاء برای پاسخ‌های ایمیل ',
        'This queue is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueAutoResponse.tt
        'This filter allow you to show queues without auto responses' => 'این فیلتر به شما اجازه نشان صف بدون پاسخ خودکار',
        'Queues without Auto Responses' => '',
        'This filter allow you to show all queues' => 'این فیلتر به شما اجازه نشان دادن تمام صفها را میدهد',
        'Show All Queues' => '',
        'Auto Responses' => 'پاسخ خودکار',
        'Manage Queue-Auto Response Relations' => 'مدیریت روابط صف درخواست-پاسخ خودکار',
        'Change Auto Response Relations for Queue' => 'تغییر روابط پاسخ خودکار برای صف درخواست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueTemplates.tt
        'Filter for Templates' => 'فیلتر برای قالب',
        'Filter for templates' => '',
        'Manage Template-Queue Relations' => 'مدیریت روابط الگو صف',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRole.tt
        'Add Role' => 'افزودن نقش',
        'Filter for Roles' => 'فیلتر برای نقش‌ها',
        'Filter for roles' => '',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'یک نقش بسازید و گروه را در آن قرار دهید سپس نقش را به کاربرها اضافه کنید',
        'Agents ↔ Roles' => '',
        'Role Management' => 'مدیریت نقش',
        'Edit Role' => 'ویرایش نقش',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'هیچ نقشی ساخته نشده است. لطفا از کلید «افزودن» برای ساخت نقش جدید استفاده نمایید.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleGroup.tt
        'Roles' => 'نقش‌ها',
        'Manage Role-Group Relations' => 'مدیریت روابط نقش-گروه',
        'Select the role:group permissions.' => 'نقش را انتخاب کنید: دسترسی‌های گروه.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'اگر چیزی انتخاب نشود، هیچ دسترسی در این گروه وجود نخواهد داشت (درخواست‌ها برای نقش در دسترس نخواهند بود)',
        'Toggle %s permission for all' => 'اعمال دسترسی %s برای همه',
        'move_into' => 'انتقال به',
        'Permissions to move tickets into this group/queue.' => 'مجوز انتقال درخواست به این گروه/لیست.',
        'create' => 'ساختن',
        'Permissions to create tickets in this group/queue.' => 'مجوز ایجاد درخواست در این گروه/لیست.',
        'note' => 'یادداشت',
        'Permissions to add notes to tickets in this group/queue.' => 'دسترسی‌ها برای افزودن یادداشت به درخواست‌ها در این گروه/صف درخواست',
        'owner' => 'صاحب',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'دسترسی‌ها برای تغییر صاحب درخواست‌ها در این گروه/صف درخواست',
        'priority' => 'الویت',
        'Permissions to change the ticket priority in this group/queue.' =>
            'مجوز تغییر اولویت درخواست در این گروه/لیست.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleUser.tt
        'Add Agent' => 'افزودن کارشناس',
        'Filter for Agents' => 'فیلتر برای کارشناسان',
        'Filter for agents' => '',
        'Agents' => 'کارشناسان',
        'Manage Agent-Role Relations' => 'مدیریت روابط کارشناس-نقش',
        'Manage Role-Agent Relations' => 'مدیریت روابط نقش-کارشناس',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSLA.tt
        'Add SLA' => 'افزودن توافقنامه SLA',
        'Filter for SLAs' => '',
        'Configure SLA Visibility and Defaults' => '',
        'SLA Management' => 'مدیریت SLA',
        'Edit SLA' => 'ویرایش SLA',
        'Please write only numbers!' => 'لطفا فقط ارقام را بنویسید!',
        'Minimum Time Between Incidents' => 'حداقل زمان بین دو رخداد',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIME.tt
        'SMIME support is disabled' => 'پشتیبانی SMIME غیر فعال است',
        'To be able to use SMIME in Znuny, you have to enable it first.' =>
            'برای اینکه قادر به استفاده از SMIME در Znuny، شما باید آن را فعال کنید برای اولین بار.',
        'Enable SMIME support' => 'فعال کردن پشتیبانی SMIME',
        'Faulty SMIME configuration' => 'پیکربندی SMIME معیوب',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'پشتیبانی SMIME فعال است، اما پیکربندی های مربوطه دارای خطا است. لطفا پیکربندی با استفاده از دکمه زیر را بررسی کنید.',
        'Check SMIME configuration' => 'بررسی پیکربندی SMIME',
        'Add Certificate' => 'افزودن گواهینامه',
        'Add Private Key' => 'افزودن کلید خصوصی',
        'Filter for Certificates' => '',
        'Filter for certificates' => 'فیلتر برای گواهی',
        'To show certificate details click on a certificate icon.' => 'برای نشان دادن جزئیات گواهی  بر روی آیکون گواهی کلیک کنید .',
        'To manage private certificate relations click on a private key icon.' =>
            'برای مدیریت روابط گواهی خصوصی بر روی آیکون کلید خصوصی را کلیک کنید.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'در اینجا شما می توانید روابط به گواهی خصوصی خود را اضافه کنید، این خواهد بود به امضای S / MIME تعبیه شده هر زمانی که شما با استفاده از این گواهی یک ایمیل به ثبت نام.',
        'See also' => 'همچنین ببنید',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'از این طریق شما میتوانید کلید‌های رمز خود را برای رمز گذاری نامه‌ها و پیامها به سیستم وارد نمائید',
        'S/MIME Management' => 'مدیریت S/MIME',
        'Hash' => 'Hash',
        'Create' => 'ایجاد',
        'Handle related certificates' => 'رسیدگی به مدارک معتبر',
        'Read certificate' => 'گواهی خوانده شده',
        'Delete this certificate' => 'حذف این گواهینامه',
        'File' => 'فایل',
        'Secret' => 'مخفی',
        'Related Certificates for' => 'گواهینامه های مرتبط برای',
        'Delete this relation' => 'حذف این رابطه',
        'Available Certificates' => 'گواهینامه ها موجود',
        'Filter for S/MIME certs' => 'فیلتر برای S / MIME گواهیهای',
        'Relate this certificate' => 'مربوط به این مجوز',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIMECertRead.tt
        'S/MIME Certificate' => 'گواهینامه S/MIME',
        'Close' => 'بستن',
        'Certificate Details' => '',
        'Close this dialog' => 'بستن این پنجره',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSalutation.tt
        'Add Salutation' => 'افزودن عنوان',
        'Filter for Salutations' => '',
        'Filter for salutations' => '',
        'Salutation Management' => 'مدیریت عنوان‌ها',
        'Edit Salutation' => 'ویرایش عنوان',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSecureMode.tt
        'Secure Mode Needs to be Enabled!' => '',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'حالت امن (به طور معمول) بعد از تکمیل نصب قابل تنظیم خواهد بود.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'اگر حالت امن فعال نشده است، آن را از طریق تنظیم سیستم فعال نمایید زیرا نرم‌افزار شما در حال اجرا می‌باشد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSelectBox.tt
        'Filter for Results' => '',
        'Filter for results' => '',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'در اینجا شما می توانید SQL وارد به ارسال آن به طور مستقیم به پایگاه داده نرم افزار. این ممکن است به تغییر محتوای جداول، تنها انتخاب نمایش داده شد مجاز است.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'در اینجا می‌توانید کوئری SQL وارد نمایید تا آن را به صورت مستقیم به پایگاه داده برنامه بفرستید.',
        'SQL Box' => 'جعبه SQL',
        'Options' => 'گزینه‌ها',
        'Only select queries are allowed.' => 'فقط مجاز هستید نمایش داده شد را انتخاب کنید ',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'گرامر نوشتاری کوئری SQL شما دارای اشتباه می‌باشد. لطفا آن را کنترل نمایید.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'حداقل یک پارامتر برای اجرا وجود ندارد. لطفا آن را کنترل نمایید.',
        'Result format' => 'قالب نتیجه',
        'Run Query' => 'اجرای کوئری',
        '%s Results' => '',
        'Query is executed.' => 'پرس و جو اجرا است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminService.tt
        'Add Service' => 'افزودن خدمت',
        'Configure Service Visibility and Defaults' => '',
        'Service Management' => 'مدیریت خدمات',
        'Edit Service' => 'ویرایش خدمت',
        'Service name maximum length is 200 characters (with Sub-service).' =>
            '',
        'Sub-service of' => 'زیرمجموعه‌ای از خدمت',
        'Criticality' => 'اهمیت',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSession.tt
        'All sessions' => 'تمام sessionها',
        'Agent sessions' => 'session کارشناسان',
        'Customer sessions' => 'session مشترکین',
        'Unique agents' => 'کارشناسان یکه',
        'Unique customers' => 'مشترکین یکه',
        'Kill all sessions' => 'همه Session‌ها را از بین ببر',
        'Kill this session' => 'از بین بردن session',
        'Filter for Sessions' => '',
        'Filter for sessions' => '',
        'Session Management' => 'مدیریت Session‌ها',
        'Detail Session View for %s (%s)' => '',
        'Session' => 'Session',
        'Kill' => 'کشتن',
        'Detail View for SessionID: %s - %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSignature.tt
        'Add Signature' => 'افزودن امضاء',
        'Filter for Signatures' => '',
        'Filter for signatures' => '',
        'Signature Management' => 'مدیریت امضاء',
        'Edit Signature' => 'ویرایش امضاء',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminState.tt
        'Add State' => 'افزودن وضعیت',
        'Filter for States' => '',
        'Filter for states' => '',
        'Attention' => 'توجه',
        'Please also update the states in SysConfig where needed.' => 'لطفا کشورهای در SysConfig به روز رسانی که در آن مورد نیاز است.',
        'Configure State Visibility and Defaults' => '',
        'Configure State Type Visibility and Defaults' => '',
        'State Management' => 'مدیریت وضعیت',
        'Edit State' => 'ویرایش وضعیت',
        'This state is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            '',
        'State type' => 'نوع وضعیت',
        'It\'s not possible to invalidate this entry because there is no other merge states in system!' =>
            '',
        'This field must be a hexadecimal color code.' => '',
        'This state is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSupportDataCollector.tt
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'بسته نرم افزاری پشتیبانی (از جمله: اطلاعات ثبت نام سیستم، داده پشتیبانی، یک لیست از بسته های نصب شده و تمامی فایل های کد منبع به صورت محلی تغییر) را می توان با فشار دادن این دکمه تولید:',
        'Generate Support Bundle' => 'تولید پشتیبانی بسته نرم افزاری',
        'The Support Bundle has been Generated' => '',
        'A file containing the support bundle will be downloaded to the local system.' =>
            'فایل حاوی بسته نرم افزاری پشتیبانی خواهد شد به سیستم محلی دریافت کنید.',
        'Support Data' => 'پشتیبانی از داده ها',
        'Error: Support data could not be collected (%s).' => 'خطا: اطلاعات پشتیبانی نمی تواند جمع آوری  شود ( %s ).',
        'Support Data Collector' => 'پشتیبانی از داده های جمع آوری شده',
        'Delete cache' => '',
        'Details' => 'جزئیات',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemAddress.tt
        'Add System Address' => '',
        'Filter for System Addresses' => '',
        'Filter for system addresses' => '',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'تمام ایمیل‌های وارده با این آدرس در To یا Cc به صف درخواست انتخاب شده توزیع خواهد شد.',
        'System Email Addresses Management' => 'مدیریت آدرس‌های ایمیل سیستم',
        'Add System Email Address' => 'افزودن آدرس ایمیل سیستم',
        'Edit System Email Address' => 'ویرایش آدرس ایمیل سیستم',
        'Email address' => 'آدرس ایمیل',
        'Display name' => 'نام نمایش داده شده',
        'This email address is already used as system email address.' => '',
        'The display name and email address will be shown on mail you send.' =>
            'نام نمایش داده شده و آدرس ایمیل در ایمیلی که شما می‌فرستید نمایش داده خواهد شد.',
        'This system address cannot be set to invalid.' => '',
        'This system address cannot be set to invalid, because it is used in one or more queue(s) or auto response(s).' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfiguration.tt
        'online administrator documentation' => '',
        'System configuration' => '',
        'Navigate through the available settings by using the tree in the navigation box on the left side.' =>
            '',
        'Find certain settings by using the search field below or from search icon from the top navigation.' =>
            '',
        'Find out how to use the system configuration by reading the %s.' =>
            '',
        'Search in all settings...' => '',
        'There are currently no settings available. Please make sure to run \'znuny.Console.pl Maint::Config::Rebuild\' before using the software.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationDeployment.tt
        'Help' => '',
        'This is an overview of all settings which will be part of the deployment if you start it now. You can compare each setting to its former state by clicking the icon on the top right.' =>
            '',
        'To exclude certain settings from a deployment, click the checkbox on the header bar of a setting.' =>
            '',
        'By default, you will only deploy settings which you changed on your own. If you\'d like to deploy settings changed by other users, too, please click the link on top of the screen to enter the advanced deployment mode.' =>
            '',
        'A deployment has just been restored, which means that all affected setting have been reverted to the state from the selected deployment.' =>
            '',
        'Please review the changed settings and deploy afterwards.' => '',
        'An empty list of changes means that there are no differences between the restored and the current state of the affected settings.' =>
            '',
        'Changes Deployment' => '',
        'Changes Overview' => '',
        'There are %s changed settings which will be deployed in this run.' =>
            '',
        'Switch to basic mode to deploy settings only changed by you.' =>
            '',
        'You have %s changed settings which will be deployed in this run.' =>
            '',
        'Switch to advanced mode to deploy settings changed by other users, too.' =>
            '',
        'There are no settings to be deployed.' => '',
        'Switch to advanced mode to see deployable settings changed by other users.' =>
            '',
        'Deploy selected changes' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationGroup.tt
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationImportExport.tt
        'Import & Export' => '',
        'Upload a file to be imported to your system (.yml format as exported from the System Configuration module).' =>
            '',
        'Upload system configuration' => '',
        'Import system configuration' => '',
        'Download current configuration settings of your system in a .yml file.' =>
            '',
        'Export current configuration' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearch.tt
        'Search for' => '',
        'Search for category' => '',
        'Settings I\'m currently editing' => '',
        'Your search for "%s" in category "%s" did not return any results.' =>
            '',
        'Your search for "%s" in category "%s" returned one result.' => '',
        'Your search for "%s" in category "%s" returned %s results.' => '',
        'You\'re currently not editing any settings.' => '',
        'You\'re currently editing %s setting(s).' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearchDialog.tt
        'Category' => 'دسته بندی',
        'Run search' => 'اجرا جستجو ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationView.tt
        'Go back to Deployment Details' => '',
        'View a custom List of Settings' => '',
        'View single Setting: %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles.tt
        'System file support' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles/Widget.tt
        'Permissions' => 'دسترسی‌ها',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenance.tt
        'Schedule New System Maintenance' => 'برنامه تعمیر و نگهداری سیستم های جدید',
        'Filter for System Maintenances' => '',
        'Filter for system maintenances' => '',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'برنامه ریزی یک دوره تعمیر و نگهداری سیستم برای اعلام عوامل و مشتریان سیستم پایین است برای یک دوره زمانی.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'چند وقت پیش از این تعمیر و نگهداری سیستم شروع می شود کاربران یک اطلاع رسانی در هر صفحه نمایش اعلام در مورد این واقعیت دریافت خواهید کرد.',
        'System Maintenance Management' => 'سیستم مدیریت نگهداری و تعمیرات',
        'Stop date' => 'تاریخ توقف',
        'Delete System Maintenance' => 'حذف تعمیر و نگهداری سیستم',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenanceEdit.tt
        'Edit System Maintenance' => '',
        'Edit System Maintenance Information' => '',
        'Date invalid!' => 'تاریخ نامعتبر!',
        'Login message' => 'پیام ورود',
        'This field must have less then 250 characters.' => '',
        'Show login message' => 'پیام ورود نمایش',
        'Notify message' => 'اعلام کردن پیام',
        'Manage Sessions' => 'مدیریت جلسات',
        'All Sessions' => 'تمام جلسات',
        'Agent Sessions' => 'جلسات عامل',
        'Customer Sessions' => 'جلسات و ضوابط',
        'Kill all Sessions, except for your own' => 'کشتن تمام جلسات، به جز مال خود را',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplate.tt
        'Add Template' => 'افزودن قالب',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'قالب یک متن پیش فرض است که کمک می کند تا عوامل خود را برای ارسال سریعتر بلیط، پاسخ و یا جلو است.',
        'Don\'t forget to add new templates to queues.' => 'فراموش نکنید که برای اضافه کردن قالب جدید به صف.',
        'Template Management' => '',
        'Edit Template' => 'ویرایش قالب',
        'Attachments' => 'پیوست‌ها',
        'Delete this entry' => 'حذف این ورودی',
        'Do you really want to delete this template?' => 'آیا واقعا مایل به حذف این قالب هستید؟',
        'A standard template with this name already exists!' => 'قالب استاندارد با این نام وجود دارد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplateAttachment.tt
        'Manage Template-Attachment Relations' => '',
        'Toggle active for all' => 'اعمال فعال برای همه',
        'Link %s to selected %s' => 'ارتباط %s به %s انتخاب شده',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTicketAttributeRelations.tt
        'Import CSV or Excel file' => '',
        'Ticket attribute relations' => '',
        'Add ticket attribute relations' => '',
        'Edit ticket attribute relations' => '',
        'Attribute' => 'صفت',
        'Last update' => '',
        'Are you sure you want to delete entry \'%s\'?' => '',
        'Download previously imported file' => '',
        'The file needs to be in CSV (UTF-8) or Excel format. Both header columns need to contain the names of valid ticket attributes. The name of the uploaded file must be unique and must not be in use by another ticket attribute relations record.' =>
            '',
        'Add missing possible dynamic field values' => '',
        'Attribute values' => '',
        'If a value is colored red, it is missing from the possible values list of the dynamic field configuration.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminType.tt
        'Add Type' => 'افزودن نوع',
        'Filter for Types' => '',
        'Filter for types' => '',
        'Configure Type Visibility and Defaults' => '',
        'Type Management' => 'مدیریت نوع‌ها',
        'Edit Type' => 'ویرایش درخواست',
        'A type with this name already exists!' => 'یک نوع با این نام وجود دارد.',
        'This type is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            '',
        'This type is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUser.tt
        'Edit personal preferences for this agent' => '',
        'Agents will be needed to handle tickets.' => 'کارشناسان نیاز دارند که به درخواست‌ها رسیدگی کنند.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'فراموش نکنید که یک کارشناس جدید را به گروه‌ها و/یا نقش‌ها بیفزایید!',
        'Agent Management' => 'مدیریت کارشناس',
        'Edit Agent' => 'ویرایش کارشناس',
        'Please enter a search term to look for agents.' => 'لطفا یک عبارت جستجو برای گشتن کارشناسان وارد نمایید.',
        'Last login' => 'آخرین ورود',
        'Switch to agent' => 'سوئیچ به کارشناس',
        'Title or salutation' => 'عنوان یا سلام',
        'Firstname' => 'نام',
        'Lastname' => 'نام خانوادگی',
        'A user with this username already exists!' => 'کاربری با این نام کاربری وجو دارد!',
        'Will be auto-generated if left empty.' => ' اگر خالی بماند، به صورت خودکار تولید میشود.',
        'Mobile' => 'تلفن همراه',
        'Effective Permissions for Agent' => '',
        'This agent has no group permissions.' => '',
        'Table above shows effective group permissions for the agent. The matrix takes into account all inherited permissions (e.g. via roles).' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUserGroup.tt
        'Manage Agent-Group Relations' => 'مدیریت روابط کارشناس-گروه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentAgendaOverview.tt
        'Agenda Overview' => '',
        'Manage Calendars' => '',
        'Add Appointment' => '',
        'Today' => 'امروز ',
        'All-day' => 'تمام روز',
        'Repeat' => '',
        'Notification' => 'اعلان',
        'Yes' => 'بله',
        'No' => 'خیر',
        'No calendars found. Please add a calendar first by using Manage Calendars page.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentCalendarOverview.tt
        'Add new Appointment' => '',
        'Appointments' => '',
        'Calendars' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentEdit.tt
        'Basic information' => '',
        'Date/Time' => '',
        'Invalid date!' => 'تاریخ نا معتبر',
        'Please set this to value before End date.' => '',
        'Please set this to value after Start date.' => '',
        'This an occurrence of a repeating appointment.' => '',
        'Click here to see the parent appointment.' => '',
        'Click here to edit the parent appointment.' => '',
        'Frequency' => '',
        'Every' => '',
        'day(s)' => 'روز',
        'week(s)' => 'هفته',
        'month(s)' => 'ماه',
        'year(s)' => 'سال',
        'On' => 'روشن',
        'Monday' => 'دوشنبه',
        'Mon' => 'دوشنبه',
        'Tuesday' => 'سه‌شنبه',
        'Tue' => 'سه‌شنبه',
        'Wednesday' => 'چهارشنبه',
        'Wed' => 'چهارشنبه',
        'Thursday' => 'پنجشنبه',
        'Thu' => 'پنجشنبه',
        'Friday' => 'جمعه',
        'Fri' => 'جمعه',
        'Saturday' => 'شنبه',
        'Sat' => 'شنبه',
        'Sunday' => 'یکشنبه',
        'Sun' => 'یکشنبه',
        'January' => 'ژانویه',
        'Jan' => 'ژانویه',
        'February' => 'فوریه',
        'Feb' => 'فوریه',
        'March' => 'مارس',
        'Mar' => 'مارس',
        'April' => 'آپریل',
        'Apr' => 'آپریل',
        'May_long' => 'می',
        'May' => 'می',
        'June' => 'ژون',
        'Jun' => 'ژون',
        'July' => 'جولای',
        'Jul' => 'جولای',
        'August' => 'آگوست',
        'Aug' => 'آگوست',
        'September' => 'سپتامبر',
        'Sep' => 'سپتامبر',
        'October' => 'اکتبر',
        'Oct' => 'اکتبر',
        'November' => 'نوامبر',
        'Nov' => 'نوامبر',
        'December' => 'دسامبر',
        'Dec' => 'دسامبر',
        'Relative point of time' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenter.tt
        'Customer Information Center' => 'مرکز اطلاعات مشترکین',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenterSearch.tt
        'Customer User' => 'مشترک',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerTableView.tt
        'Note: Customer is invalid!' => 'یادداشت: مشترک نامعتبر است!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBook.tt
        'Customer User Address Book' => '',
        'Search for recipients and add the results as \'%s\'.' => '',
        'Search template' => 'الگوی جستجو',
        'Create Template' => 'ساخت قالب',
        'Create New' => 'ساخت مورد جدید',
        'Save changes in template' => 'ذخیره تغییرات در قالب',
        'Filters in use' => 'فیلترها برای استفاده',
        'Additional filters' => 'فیلتر های اضافی',
        'Add another attribute' => 'افزودن ویژگی دیگر',
        'The attributes with the identifier \'(Customer)\' are from the customer company.' =>
            '',
        '(e. g. Term* or *Term*)' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverview.tt
        'The customer user is already selected in the ticket mask.' => '',
        'Select this customer user' => '',
        'Add selected customer user to' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverviewNavBar.tt
        'Change search options' => 'تغییر گزینه‌های جستجو',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserInformationCenter.tt
        'Customer User Information Center' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDaemonInfo.tt
        'The Znuny Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Znuny شبح یک فرایند شبح که انجام وظایف ناهمزمان، به عنوان مثال تشدید بلیط تحریک، ارسال ایمیل، و غیره است',
        'A running Znuny Daemon is mandatory for correct system operation.' =>
            'یک شبح Znuny در حال اجرا برای عملیات سیستم درست الزامی است.',
        'Starting the Znuny Daemon' => 'شروع Znuny دیمون',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the Znuny Daemon is running and start it if needed.' =>
            'مطمئن شوید که فایل \' %s \' وجود دارد (بدون .dist پسوند). این cron در هر 5 دقیقه اگر Znuny دیمون در حال اجرا است را بررسی کنید و شروع به آن در صورت نیاز.',
        'Execute \'%s start\' to make sure the cron jobs of the \'znuny\' user are active.' =>
            'اعدام %s شروع به مطمئن شوید که به cron job از کاربر Znuny، فعال هستند.',
        'After 5 minutes, check that the Znuny Daemon is running in the system (\'bin/znuny.Daemon.pl status\').' =>
            'پس از 5 دقیقه، بررسی کنید که Znuny دیمون در حال اجرا در سیستم ( \'وضعیت بن / znuny.Daemon.pl\').',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboard.tt
        'Dashboard' => 'داشبورد',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardAppointmentCalendar.tt
        'New Appointment' => '',
        'Tomorrow' => 'فردا ',
        'Soon' => '',
        '5 days' => '',
        'Start' => 'شروع',
        'none' => '--',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCalendarOverview.tt
        'in' => 'در',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCommon.tt
        'Search inactive widgets' => '',
        'Active Widgets' => '',
        'Save changes' => '',
        'Close this widget' => '',
        'Hide' => '',
        'more' => 'بیشتر',
        'No Data Available.' => '',
        'Available Columns' => 'ستون در دسترس',
        'Visible Columns (order by drag & drop)' => 'ستون قابل مشاهده است (سفارش با کشیدن و رها کردن)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDList.tt
        'Change Customer Relations' => '',
        'Open' => 'باز',
        'Closed' => 'بسته شده',
        'Phone ticket' => 'تیکت تلفنی',
        'Email ticket' => 'تیکت ایمیلی',
        '%s open ticket(s) of %s' => '%s بلیط باز (بازدید کنندگان) از %s',
        '%s closed ticket(s) of %s' => '%s بلیط بسته (بازدید کنندگان) از %s',
        'New phone ticket from %s' => 'درخواست گوشی جدید از %s',
        'New email ticket to %s' => 'درخواست ایمیل جدید به %s',
        'Edit customer ID' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDStatus.tt
        'Escalated tickets' => 'تیکت های خیلی مهم',
        'Open tickets' => 'تیکت های باز',
        'Closed tickets' => 'تیکت های بسته شده',
        'All tickets' => 'همه درخواست‌ها',
        'Archived tickets' => 'بلیط آرشیو',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserInformation.tt
        'Note: Customer User is invalid!' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserList.tt
        'Customer user information' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardMyLastChangedTickets.tt
        'No tickets found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardRSSOverview.tt
        'Posted %s ago.' => '%s وقت پیش ارسال شد',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardStats.tt
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'پیکربندی برای این ویجت آمار دارای خطامیباشد، لطفا تنظیمات خود را بررسی کند.',
        'Download as SVG file' => 'دانلود به صورت فایل SVG',
        'Download as PNG file' => 'دانلود به صورت فایل PNG',
        'Download as CSV file' => 'دانلود به عنوان فایل CSV',
        'Download as Excel file' => 'دانلود به صورت فایل اکسل',
        'Download as PDF file' => 'دانلود به عنوان فایل PDF',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'لطفا یک فرمت خروجی نمودار معتبر در پیکربندی این ویجت را انتخاب کنید.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'محتوای این آمار است که برای شما آماده میباشد، لطفا صبور باشید.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'این آمار در حال حاضر می توانید استفاده نیست زیرا پیکربندی آن باید توسط Administrator آمار اصلاح شود.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketGeneric.tt
        'Show' => '',
        'Assigned to customer user' => '',
        'Accessible for customer user' => '',
        'My locked tickets' => 'درخواست‎های قفل شده من',
        'My owned tickets' => '',
        'My watched tickets' => 'درخواست مشاهده شده من',
        'My responsibilities' => 'مسئولیت من',
        'Tickets in My Queues' => 'درخواستهای در صفهای من',
        'Tickets in My Services' => 'درخواستهای در سرویسهای من',
        'Service Time' => 'زمان سرویس',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketQueueOverview.tt
        'Total' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOnline.tt
        'out of office' => 'زمان بیرون بودن از محل کار',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOutOfOffice.tt
        'until' => 'تا',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentInfo.tt
        'To accept some news, a license or some changes.' => 'برای پذیرش برخی اخبار، یک گواهینامه یا برخی تغییرات.',
        'Yes, accepted.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentLinkObject.tt
        'Manage links for %s' => '',
        'Close and Back' => '',
        'Create new links' => '',
        'Manage existing links' => '',
        'Link with' => '',
        'Start search' => '',
        'There are currently no links. Please click \'Create new Links\' on the top to link this item to other objects.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferences.tt
        'Preferences' => 'تنظیمات',
        'Please note: you\'re currently editing the preferences of %s.' =>
            '',
        'Go back to editing this agent' => '',
        'Set up your personal preferences. Save each setting by clicking the checkmark on the right.' =>
            '',
        'You can use the navigation tree below to only show settings from certain groups.' =>
            '',
        'Dynamic Actions' => '',
        'Filter settings...' => '',
        'Filter for settings' => '',
        'Save all settings' => '',
        'Edit your preferences' => 'تنظیمات شخصی خودتان را ویرایش نمایید',
        'Personal Preferences' => '',
        'Avatars have been disabled by the system administrator. You\'ll see your initials instead.' =>
            '',
        'You can change your avatar image by registering with your email address %s at %s. Please note that it can take some time until your new avatar becomes available because of caching.' =>
            '',
        'Off' => 'خاموش',
        'End' => 'پایان',
        'Left' => 'چپ',
        'The horizontal distance of the window relative to the screen, in pixels.' =>
            '',
        'Top' => '',
        'The vertical distance of the window relative to the screen, in pixels.' =>
            '',
        'Width' => '',
        'Width in pixels or percent.' => '',
        'Height' => '',
        'Height in pixels or percent.' => '',
        'This setting can currently not be saved.' => '',
        'This setting can currently not be saved' => '',
        'Save setting' => '',
        'Save this setting' => '',
        'Did you know? You can help translating Znuny at %s.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferencesOverview.tt
        'Choose from the groups on the left to find the settings you\'d wish to change.' =>
            '',
        'Did you know?' => '',
        'You can change your avatar by registering with your email address %s on %s' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentSplitSelection.tt
        'Target' => 'جهت بازشدن',
        'Process' => 'پروسه',
        'Split' => 'جدا ساختن',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsAdd.tt
        'Statistics Management' => '',
        'Add Statistics' => '',
        'Dynamic Matrix' => 'ماتریس پویا',
        'Each cell contains a singular data point.' => '',
        'Dynamic List' => 'لیست پویا',
        'Each row contains data of one entity.' => '',
        'Static' => 'ایستا',
        'Non-configurable complex statistics.' => '',
        'General Specification' => 'مشخصات عمومی',
        'Create Statistic' => 'آماردرست ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsEdit.tt
        'Run now' => 'الان اجرا کن',
        'Edit Statistics' => '',
        'Statistics Preview' => ' پیش آمار',
        'Save Statistic' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsImport.tt
        'Import Statistics' => '',
        'Import Statistics Configuration' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsOverview.tt
        'Statistics' => 'گزارش ها',
        'Edit statistic "%s".' => 'ویرایش گزارش " %s ".',
        'Export statistic "%s"' => 'آمارارسال \ " %s "',
        'Export statistic %s' => 'استخراج گزارش "%s"',
        'Delete statistic %s' => 'حذف گزارش "%s"',
        'Do you really want to delete this statistic?' => 'آیا واقعا میخواهید این آمار را حذف کنید؟',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsView.tt
        'Statistics Information' => 'اطلاعات گزارش ها',
        'Created by' => 'ایجاد شده توسط',
        'Changed by' => 'تغییر یافته توسط',
        'Sum rows' => 'جمع سطر‌ها',
        'Sum columns' => 'جمع ستون‌ها',
        'Show as dashboard widget' => 'نمایش به عنوان ویجت داشبورد',
        'Cache' => 'نگهداری',
        'Statistics Overview' => 'مرور گزارش ها',
        'View Statistics' => 'مشاهده گزارش ها',
        'This statistic contains configuration errors and can currently not be used.' =>
            'این آمار شامل خطاهای پیکربندی هستند و در حال حاضر قابل استفاده نیستند.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketActionCommon.tt
        'Change Free Text of %s%s%s' => 'تغییر متن رایگان از %s %s %s',
        'Change Owner of %s%s%s' => 'تغییر صاحب %s %s %s',
        'Close %s%s%s' => 'نزدیک %s %s %s',
        'Add Note to %s%s%s' => 'اضافه کردن یادداشت به %s %s %s',
        'Set Pending Time for %s%s%s' => 'تنظیم انتظار زمان برای %s %s %s',
        'Change Priority of %s%s%s' => 'تغییر اولویت %s %s %s',
        'Change Responsible of %s%s%s' => 'تغییر مسئول %s %s %s',
        'The ticket has been locked' => 'درخواست تحویل گرفته شده است',
        'Ticket Settings' => 'تنظیمات درخواست',
        'Service invalid.' => 'سرویس نامعتبر',
        'SLA invalid.' => '',
        'Team Data' => '',
        'Queue invalid.' => '',
        'New Owner' => 'صاحب جدید',
        'Please set a new owner!' => 'لطفا یک صاحب جدید مشخص نمایید!',
        'Owner invalid.' => '',
        'New Responsible' => ' مسئول جدید',
        'Please set a new responsible!' => '',
        'Responsible invalid.' => '',
        'Ticket Data' => '',
        'Next state' => 'وضعیت بعدی',
        'State invalid.' => '',
        'For all pending* states.' => 'برای همه کشورهای * در انتظار.',
        'Dynamic Info' => '',
        'Add Article' => 'اضافه کردن نوشته',
        'Inform' => '',
        'Inform agents' => 'اطلاع عوامل',
        'Inform involved agents' => 'اطلاع عوامل درگیر',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'در اینجا شما می توانید عوامل اضافی که باید اطلاع رسانی در مورد این مقاله جدید دریافت خواهید کرد را انتخاب کنید.',
        'Text will also be received by' => 'متن نیز دریافت می شود  توسط',
        'Communications' => '',
        'Create an Article' => 'ایجاد یک مقاله',
        'Setting a template will overwrite any text or attachment.' => 'تنظیم یک قالب هر گونه متن یا پیوست بازنویسی.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBounce.tt
        'Bounce %s%s%s' => 'پریدن %s %s %s',
        'cancel' => '',
        'Bounce to' => 'ارجاع شده به',
        'You need a email address.' => 'به یک آدرس ایمیل نیاز دارید',
        'Need a valid email address or don\'t use a local email address.' =>
            'به یک آدرس ایمیل معتبر نیاز دارید یا از یک آدرس ایمیل محلی استفاده نکنید.',
        'Next ticket state' => 'وضعیت بعدی درخواست',
        'Inform sender' => 'به ارسال کننده اطلاع بده',
        'Send mail' => 'ارسال ایمیل!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBulk.tt
        'Ticket Bulk Action' => 'عملیات کلی روی درخواست',
        'Send Email' => 'ارسال ایمیل!',
        'Merge' => 'ادغام ',
        'Merge to' => 'ادغام با',
        'Invalid ticket identifier!' => 'شناسه درخواست نامعتبر',
        'Merge to oldest' => 'ترکیب با قدیمی‌ترین',
        'Link together' => 'ارتباط با یک دیگر',
        'Link to parent' => 'ارتباط به والد',
        'Unlock tickets' => 'درخواست‌های تحویل داده شده',
        'Watch tickets' => '',
        'Mark tickets as seen' => '',
        'Mark tickets as unseen' => '',
        'Execute Bulk Action' => 'ادراه کردن میزان عمل',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCompose.tt
        'Compose Answer for %s%s%s' => 'نوشتن پاسخ برای %s %s %s',
        'Date Invalid!' => 'تاریخ نامعتبر!',
        'Select one or more recipients from the customer user address book.' =>
            '',
        'Customer user address book' => '',
        'This address is registered as system address and cannot be used: %s' =>
            'این آدرس به عنوان آدرس سیستم ثبت شده و می تواند استفاده شود: %s',
        'Please include at least one recipient' => 'لطفا حداقل یک گیرنده را قراردهید',
        'Remove Ticket Customer' => 'حذف و ضوابط درخواست',
        'Please remove this entry and enter a new one with the correct value.' =>
            'لطفا این مطلب را حذف و یک مطلب جدید با مقدار صحیح را وارد کنید.',
        'This address already exists on the address list.' => 'این آدرس در لیست آدرس ها موجود است.',
        'Remove Cc' => 'حذف رونوشت',
        'Bcc' => 'رونوشت پنهان',
        'Remove Bcc' => 'حذف کپی به',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCustomer.tt
        'Change Customer of %s%s%s' => 'تغییر مشتری از %s %s %s',
        'Customer Information' => 'اطلاعات مشترک',
        'Customer user' => 'مشترک',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmail.tt
        'Create New Email Ticket' => 'ساخت درخواست ایمیلی جدید',
        'Example Template' => 'به عنوان مثال قالب',
        'To customer user' => 'به کاربران مشتری',
        'Please include at least one customer user for the ticket.' => 'لطفا حداقل یک کاربر مشتری برای درخواست قرار دهید',
        'Select this customer as the main customer.' => 'این مشتری را به عنوان مشتری اصلی انتخاب کنید.',
        'Remove Ticket Customer User' => 'حذف درخواست  کاربرمشتری',
        'From queue' => 'از صف درخواست',
        'Get all' => 'گرفتن همه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailOutbound.tt
        'Outbound Email for %s%s%s' => 'عازم ناحیه دور دست ایمیل برای %s %s %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailResend.tt
        'Resend Email for %s%s%s' => '',
        'All fields marked with an asterisk (*) are mandatory.' => 'همه فیلدهایی که با ستاره مشخص شده اند (*) الزامی است.',
        'Cancel & close' => 'لغو کنید و ببندید',
        'Undo & close' => 'عملیات را برگردان و پنجره را ببند',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEscalation.tt
        'Ticket %s: first response time is over (%s/%s)!' => 'بلیط %s : زمان پاسخ برای اولین بار است که بیش از ( %s / %s )!',
        'Ticket %s: first response time will be over in %s/%s!' => 'بلیط %s : اول زمان پاسخ را در خواهد %s / %s !',
        'Ticket %s: update time is over (%s/%s)!' => 'بلیط %s : زمان به روز رسانی به پایان رسیده است ( %s / %s )!',
        'Ticket %s: update time will be over in %s/%s!' => 'بلیط %s : زمان به روز رسانی بیش از در خواهد %s / %s !',
        'Ticket %s: solution time is over (%s/%s)!' => 'بلیط %s : زمان حل به پایان رسیده است ( %s / %s )!',
        'Ticket %s: solution time will be over in %s/%s!' => 'بلیط %s : زمان حل بیش از در خواهد %s / %s !',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketForward.tt
        'Forward %s%s%s' => 'رو به جلو %s %s %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketHistory.tt
        'History of %s%s%s' => 'تاریخ %s %s %s',
        'Start typing to filter...' => '',
        'Filter for history items' => '',
        'Expand/Collapse all' => '',
        'CreateTime' => 'زمان ساختن',
        'Article' => 'نوشته',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMerge.tt
        'Merge %s%s%s' => 'ادغام %s %s %s',
        'Merge Settings' => 'ادغام تنظیمات',
        'Try typing part of the ticket number or title in order to search by it.' =>
            '',
        'You need to use a ticket number!' => 'شما باید از شماره درخواست استفاده نمائید!',
        'A valid ticket number is required.' => 'شماره درخواست معتبر مورد نیاز است.',
        'Limit the search to tickets with same Customer ID (%s).' => '',
        'Inform Sender' => '',
        'Need a valid email address.' => 'به آدرس ایمیل معتبر نیاز است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMove.tt
        'Move %s%s%s' => 'حرکت %s %s %s',
        'New Queue' => 'لیست درخواست جدید',
        'Communication' => 'ارتباطات',
        'Move' => 'انتقال',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketNoteToLinkedTicket.tt
        'Add note to linked %s%s%s' => '',
        'Notes' => '',
        'Note to linked Ticket' => '',
        'LinkList invalid.' => '',
        'Note to origin Ticket' => '',
        'NoteToTicket invalid.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewMedium.tt
        'No ticket data found.' => 'اطلاعات درخواست یافت نشد.',
        'Open / Close ticket action menu' => '',
        'Select this ticket' => '',
        'Sender' => 'فرستنده',
        'Customer User Name' => '',
        'Impact' => 'اثر',
        'Update Time' => 'زمان بروز رسانی',
        'Solution Time' => 'زمان ارائه راهکار',
        'First Response Time' => 'زمان اولین پاسخ',
        'Move ticket to a different queue' => 'انتقال درخواست یه صف درخواست دیگر',
        'Change queue' => 'تغییر لیست درخواست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewNavBar.tt
        'Remove active filters for this screen.' => 'حذف فیلتر فعال برای این صفحه نمایش.',
        'Clear all filters' => '',
        'Remove mention' => '',
        'Remove from list of watched tickets' => 'حذف از فهرست درخواست‌های مشاهده شده',
        'Tickets per page' => 'درخواست در هر صفحه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewPreview.tt
        'Missing channel' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewSmall.tt
        'Reset overview' => 'مرور تنظیم مجدد',
        'Column Filters Form' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhone.tt
        'Split Into New Phone Ticket' => 'تقسیم درخواست تلفن جدید',
        'Create New Phone Ticket' => 'ساخت درخواست تلفنی جدید',
        'Please include at least one customer for the ticket.' => 'لطفا حداقل یک مشتری برای درخواست قراردهید',
        'To queue' => 'به صف درخواست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhoneCommon.tt
        'Phone Call for %s%s%s' => 'تماس بگیرید تلفن تماس برای %s %s %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPlain.tt
        'View Email Plain Text for %s%s%s' => 'نمایش ایمیل متن ساده برای %s %s %s',
        'Plain' => 'ساده',
        'Download this email' => 'دریافت این ایمیل',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcess.tt
        'Create New Process Ticket' => 'ایجاد درخواست جدید فرآیند',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcessSmall.tt
        'Enroll Ticket into a Process' => 'ثبت نام درخواست به یک فرایند',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketSearch.tt
        'Profile link' => 'لینک مشخصات',
        'Output' => 'نوع نتیجه',
        'Fulltext' => 'جستجوی تمام متن',
        'Customer ID (complex search)' => '',
        '(e. g. 234*)' => '',
        'Customer ID (exact match)' => '',
        'Assigned to Customer User Login (complex search)' => '',
        '(e. g. U51*)' => '',
        'Assigned to Customer User Login (exact match)' => '',
        'Accessible to Customer User Login (exact match)' => '',
        'Created in Queue' => 'ایجاد شده در صف درخواست',
        'Lock state' => 'وضعیت تحویل',
        'Watcher' => 'مشاهده‌کننده',
        'Article Create Time (before/after)' => 'زمان ساخت مطلب (قبل از/بعد از)',
        'Article Create Time (between)' => 'زمان ساخت مطلب (بین)',
        'Please set this to value before end date.' => '',
        'Please set this to value after start date.' => '',
        'Ticket Create Time (before/after)' => 'زمان ساخت درخواست (قبل از/بعد از)',
        'Ticket Create Time (between)' => 'زمان ساخت درخواست (بین)',
        'Ticket Change Time (before/after)' => 'زمان تغییر درخواست (قبل از/بعد از)',
        'Ticket Change Time (between)' => 'زمان تغییر درخواست (بین)',
        'Ticket Last Change Time (before/after)' => 'بلیط آخرین تغییر زمان (قبل از / پس)',
        'Ticket Last Change Time (between)' => 'بلیط آخرین تغییر زمان (بین)',
        'Ticket Pending Until Time (before/after)' => '',
        'Ticket Pending Until Time (between)' => '',
        'Ticket Close Time (before/after)' => 'زمان بستن درخواست (قبل از/بعد از)',
        'Ticket Close Time (between)' => 'زمان بستن درخواست (بین)',
        'Ticket Escalation Time (before/after)' => 'تشدید درخواست زمان (قبل از / پس)',
        'Ticket Escalation Time (between)' => 'تشدید درخواست زمان (بین)',
        'Archive Search' => 'جستجوی آرشیو',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom.tt
        'Sender Type' => 'نوع فرستنده',
        'Save filter settings as default' => 'ذخیره تنظیمات فیلتر به عنوان تنظیمات پیش فرض',
        'Event Type' => 'نوع رویداد',
        'Save as default' => 'ذخیره به عنوان پیش فرض',
        'Drafts' => '',
        'by' => 'توسط',
        'Change Queue' => 'تغییر صف درخواست',
        'There are no dialogs available at this point in the process.' =>
            'هیچ پنجره موجود در این نقطه از این فرآیند وجود ندارد.',
        'This item has no articles yet.' => 'این محصول هنوز دارای هیچ مقاله ای نیست.',
        'Article Overview - %s Article(s)' => '',
        'Page %s' => '',
        'Add Filter' => 'افزودن فیلتر',
        'Set' => 'ثبت',
        'Reset Filter' => 'تنظیم مجدد فیلتر',
        'No.' => 'خیر',
        'Unread articles' => 'مطالب خوانده نشده',
        'Via' => '',
        'Important' => 'مهم',
        'Unread Article!' => 'مطلب خوانده نشده!',
        'Incoming message' => 'پیغام وارده',
        'Outgoing message' => 'پیغام ارسالی',
        'Internal message' => 'پیغام داخلی',
        'Sending of this message has failed.' => '',
        'Resize' => 'تغییر اندازه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/Chat.tt
        '#%s' => '',
        'via %s' => '',
        'by %s' => '',
        'Toggle article details' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/MIMEBase.tt
        'This message is being processed. Already tried to send %s time(s). Next try will be %s.' =>
            '',
        'This message contains events' => '',
        'This message contains an event' => '',
        'Show more information' => '',
        'Start: %s, End: %s' => '',
        'Calendar events details' => '',
        'Calendar event details' => '',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'برای باز کردن لینک در مقاله زیر، شما ممکن است نیاز به فشار دکمه های Ctrl و کلیدهای Cmd و یا کلید Shift در حالی که در سایت ثبت نام (بسته به نوع مرورگر و سیستم عامل خود را).',
        'Close this message' => 'این پیام را ببندید',
        'Image' => '',
        'PDF' => '',
        'View' => 'نمایش',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/LinkTable.tt
        'Linked Objects' => 'آبجکت‌های مرتبط شده',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/MentionsTable.tt
        'Mentions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/TicketInformation.tt
        'Archive' => 'آرشیو',
        'This ticket is archived.' => 'این درخواست بایگانی شده است.',
        'is invalid' => '',
        'Pending till' => 'تا زمانی که',
        'Locked' => 'تحویل گرفته شده',
        'Accounted time' => 'زمان محاسبه شده',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ArticleContent/Invalid.tt
        'Preview of this article is not possible because %s channel is missing in the system.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AttachmentBlocker.tt
        'To protect your privacy, remote content was blocked.' => 'برای محافظت از حریم خصوصی شما، محتوای راه دور متوقف شد.',
        'Load blocked content.' => 'بارگذاری محتوای مسدود شده.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Breadcrumb.tt
        'Home' => '',
        'Back' => 'بازگشت',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Create.tt
        'Ticket Creation' => '',
        'Link' => 'لینک',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Link.tt
        'Remove entry' => 'پاک کردن ورودی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt
        'Dear Customer,' => '',
        'thank you for using our services.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerCompany/TicketCustomerIDSelection.tt
        'The customer ID is not changeable, no other customer ID can be assigned to this ticket.' =>
            '',
        'First select a customer user, then you can select a customer ID to assign to this ticket.' =>
            '',
        'Select a customer ID to assign to this ticket.' => '',
        'From all Customer IDs' => '',
        'From assigned Customer IDs' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerError.tt
        'Error' => 'خطا',
        'An Error Occurred' => 'خطا',
        'Traceback' => 'بازبینی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooter.tt
        'Powered by %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooterJS.tt
        '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'اتصال شده است دوباره برقرار پس از از دست دادن اتصال موقت. با توجه به این، از عناصر این صفحه می تواند متوقف کرده اند به درستی کار کند. به منظور قادر به استفاده از تمام عناصر به درستی دوباره، آن است که شدت توصیه می شود به بارگذاری مجدد این صفحه.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerHeader.tt
        'Edit personal preferences' => 'ویرایش تنظیمات شخصی',
        'Personal preferences' => '',
        'Logout' => 'خروج',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerLogin.tt
        'JavaScript Not Available' => 'جاوااسکریپت در دسترس نیست',
        'In order to experience this software, you\'ll need to enable JavaScript in your browser.' =>
            '',
        'Browser Warning' => 'اخطار مرورگر',
        'The browser you are using is too old.' => 'مرورگری که استفاده می‌کنید خیلی قدیمی است.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.' =>
            '',
        'Please see the documentation or ask your admin for further information.' =>
            'لطفا مستندات را مشاهده کنید یا از مدیر سیستم برای اطلاعات بیشتر سوال بپرسید.',
        'One moment please, you are being redirected...' => 'چند لحظه صبر کنید، در حال هدایت...',
        'Login' => 'ورود به سیستم',
        'User name' => 'نام کاربری',
        'Your user name' => 'نام کاربری شما',
        'Your password' => 'رمز عبور شما',
        'Forgot password?' => 'رمز عبور را فراموش کردید؟',
        '2 Factor Token' => '2 فاکتور رمز',
        'Your 2 Factor Token' => ' 2 فاکتور رمزشما',
        'Log In' => 'ورود',
        'Request New Password' => 'درخواست رمز عبور جدید',
        'Your User Name' => 'نام کاربری شما',
        'A new password will be sent to your email address.' => 'رمز عبور جدید برای آدرس ایمیل شما ارسال خواهد شد.',
        'Back to login' => 'بازگشت به صفحه ورود',
        'Create Account' => 'ثبت نام',
        'Please fill out this form to receive login credentials.' => 'لطفا این فرم را  برای دریافت اعتبار ورود پر کنید . ',
        'How we should address you' => 'ما چگونه شما را خطاب کنیم',
        'Your First Name' => 'نام شما',
        'Your Last Name' => 'نام خانوادگی شما',
        'Your email address (this will become your username)' => 'نشانی ایمیل شما (این تبدیل خواهد شد به نام کاربری شما)',
        'Not yet registered?' => 'هنوز ثبت نام نشده‌اید؟',
        'Sign up now' => 'اکنون عضو شوید',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketMessage.tt
        'New Ticket' => 'درخواست جدید',
        'Service level agreement' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketOverview.tt
        'Welcome!' => 'خوش آمدید',
        'Please click the button below to create your first ticket.' => 'لطفا دکمه زیر را برای ساخت اولین درخواست خود بفشارید.',
        'Create your first ticket' => 'ساخت اولین درخواست شما',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketProcess.tt
        'New Process Ticket' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearch.tt
        'Profile' => 'مشخصات کاربری',
        'e. g. 10*5155 or 105658*' => 'به عنوان مثال 10*5155 یا 105658*',
        'CustomerID' => 'کد اشتراک',
        'Types' => 'انواع',
        'Limitation' => '',
        'No time settings' => 'بدون تنظیمات زمان',
        'All' => 'همه',
        'Specific date' => 'تاریخ خاص',
        'Only tickets created' => 'فقط درخواست‌های ساخته شده',
        'Date range' => 'محدوده زمانی',
        'Only tickets created between' => 'فقط درخواست‌های ساخته شده بین',
        'Ticket Archive System' => '',
        'Save Search as Template?' => '',
        'Save as Template' => 'ذخیره به عنوان الگو',
        'Save as Template?' => 'ذخیره به عنوان قالب؟',
        'Template Name' => 'نام قالب',
        'Pick a profile name' => 'انتخاب یک نام مشخصات',
        'Output to' => 'خروجی به',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearchResultShort.tt
        'Remove this Search Term.' => 'حذف این عبارت جستجو.',
        'of' => ' از ',
        'Page' => 'صفحه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom.tt
        'Ticket Details' => '',
        'Next Steps' => 'گام های بعدی',
        'Reply' => 'پاسخ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom/ArticleRender/Chat.tt
        'Expand article' => 'گسترش مطلب',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerWarning.tt
        'Warning' => 'اخطار',

        # TT Template: Kernel/Output/HTML/Templates/Standard/DashboardEventsTicketCalendar.tt
        'Event Information' => 'اطلاعات رویداد',
        'Ticket fields' => 'زمینه های درخواست',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Error.tt
        'Error Details' => 'جزئیات خطا',
        'Expand' => 'گسترش',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/AttachmentList.tt
        'Click to delete this attachment.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftButtons.tt
        'Update draft' => '',
        'Save as new draft' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftNotifications.tt
        'You have loaded the draft "%s".' => '',
        'You have loaded the draft "%s". You last changed it %s.' => '',
        'You have loaded the draft "%s". It was last changed %s by %s.' =>
            '',
        'Please note that you have already one or more saved drafts for this action.' =>
            '',
        'Please note that this draft is outdated because the ticket was modified since this draft was created.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Header.tt
        'Last viewed' => '',
        'You are logged in as' => 'شما با این عنوان وارد شده‌اید',
        'Delete all activities' => '',
        'Delete all' => '',
        'Mark all activities as seen' => '',
        'Seen all' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/HeaderToolbar.tt
        'Overviews' => '',
        'Personal views' => '',
        'Last Views' => '',
        'Search tools' => '',
        'SearchTemplate' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Installer.tt
        'JavaScript not available' => 'جاوا اسکریپت در دسترس نیست',
        'License' => 'مجوز بهره برداری سیستم',
        'Database Settings' => 'تنظیمات پایگاه داده',
        'General Specifications and Mail Settings' => 'مشخصات عمومی و تنظیمات ایمیل',
        'Finish' => 'پایان',
        'Welcome to %s' => 'خوش آمدید به %s',
        'Address' => 'نشانی',
        'Phone' => 'تلفن',
        'Web site' => 'وب سایت',
        'Community' => '',
        'Next' => 'بعدی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerConfigureMail.tt
        'Configure Outbound Mail' => 'پیکربندی ایمیل ارسالی',
        'Outbound mail type' => 'نوع ایمیل ارسالی',
        'Select outbound mail type.' => 'نوع ایمیل ارسالی را انتخا نمایید.',
        'Outbound mail port' => 'پورت ایمیل ارسالی',
        'Select outbound mail port.' => 'پورت ایمیل ارسالی را انتخاب نمایید.',
        'SMTP host' => 'میزبان SMTP',
        'SMTP host.' => 'میزبان SMTP.',
        'SMTP authentication' => 'تصدیق SMTP',
        'Does your SMTP host need authentication?' => 'آیا میزبان SMTP شما نیاز به authentication دارد؟',
        'SMTP auth user' => 'کاربر SMTP',
        'Username for SMTP auth.' => 'نام کاربری برای تصدیق SMTP',
        'SMTP auth password' => 'رمز عبور SMTP',
        'Password for SMTP auth.' => 'رمز عبور برای تصدیق SMTP',
        'Configure Inbound Mail' => 'پیکربندی ایمیل وارده',
        'Inbound mail type' => 'نوع ایمیل وارده',
        'Select inbound mail type.' => 'نوع ایمیل وارده را انتخاب نمایید.',
        'Inbound mail host' => 'میزبان ایمیل وارده',
        'Inbound mail host.' => 'میزبان ایمیل وارده.',
        'Inbound mail user' => 'کاربر ایمیل وارده',
        'User for inbound mail.' => 'کاربر برای ایمیل وارده.',
        'Inbound mail password' => 'رمز عبور ایمیل وارده',
        'Password for inbound mail.' => 'رمز عبور برای ایمیل وارده.',
        'Result of mail configuration check' => 'نتیجه کنترل پیکربندی ایمیل',
        'Check mail configuration' => 'کنترل پیکربندی ایمیل',
        'or' => 'یا',
        'Skip this step' => 'از این مرحله بگذر',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBResult.tt
        'Done' => 'انجام شد',
        'Database setup successful!' => 'راه اندازی پایگاه داده موفق!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBStart.tt
        'Install Type' => ' نوع نصب',
        'Create a new database for Znuny' => 'ایجاد یک پایگاه داده جدید برای Znuny',
        'Use an existing database for Znuny' => 'استفاده از یک پایگاه داده موجود برای Znuny',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmssql.tt
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'اگر شما  کلمه ی عبور کاربر root را برای پایگاه داده تان تعیین کرده اید، باید آن را در اینجا وارد کنید. وگر نه در این فیلد چیزی وارد نکنید.',
        'Database name' => 'نام پایگاه داده :',
        'Check database settings' => 'کنترل تنظیمات پایگاه داده',
        'Result of database check' => 'نتیجه کنترل پایگاه داده',
        'Database check successful.' => 'کنترل پایگاه داده با موفقیت انجام شد.',
        'Database User' => 'پایگاه داده کاربر',
        'New' => 'جدید',
        'A new database user with limited permissions will be created for this Znuny system.' =>
            'یک کاربر برای پایگاه داده با دسترسی‌های محدود برای این سیستم ساخته خواهند شد.',
        'Repeat Password' => 'تکرار رمز عبور ',
        'Generated password' => 'رمز عبور تولید شده',
        'Database' => 'پایگاه داده',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmysql.tt
        'Passwords do not match' => 'رمزهای ورود مطابقت ندارند',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBoracle.tt
        'SID' => 'SID',
        'Port' => 'پورت',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerFinish.tt
        'To be able to use Znuny you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'برای استفاده از سیستم خط زیر را در Command Prompt اجرا نمائید.',
        'Restart your webserver' => 'سرور وب خود را راه اندازی مجدد نمائید',
        'After doing so your Znuny is up and running.' => 'بعد از انجام سیستم قابل استفاده خواهد بود',
        'Start page' => 'صفحه شروع',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerLicense.tt
        'Don\'t accept license' => 'عدم تائید مجوز بهره برداری',
        'Accept license and continue' => 'قبول مجوز و ادامه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerSystem.tt
        'SystemID' => 'شناسه سیستم',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'شناسه سیستم. هر شماره درخواست و هر شناسه HTTP Session شامل این شماره می‌باشد.',
        'System FQDN' => 'FQDN سیستم',
        'Fully qualified domain name of your system.' => 'FQDN سیستم شما',
        'AdminEmail' => 'ایمیل مدیر',
        'Email address of the system administrator.' => 'آدرس ایمیل مدیریت سیستم',
        'Organization' => 'سازمان',
        'Log' => 'وقایع ثبت شده',
        'LogModule' => 'ماژول ثبت وقایع',
        'Log backend to use.' => 'ورود باطن برای استفاده.',
        'LogFile' => 'فایل ثبت وقایع',
        'Webfrontend' => 'محیط کار وب',
        'Default language' => 'زبان پیش‌فرض',
        'Default language.' => 'زبان پیش‌فرض',
        'CheckMXRecord' => 'بررسی Mx Record',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'آدرس‌های ایمیل که به صورت دستی وارده شده در برابر رکوردهای MX یافت شده در DNS کنترل می‌شود. اگر DNS شما کند است و یا آدرس‌های عمومی را عبور نمی‌دهد از این گزینه استفاده نکنید.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/LinkObject.tt
        'Delete link' => '',
        'Delete Link' => '',
        'Object#' => 'شماره آبجکت',
        'Add links' => 'افزودن رابطه‌ها',
        'Delete links' => 'حذف رابطه‌ها',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Login.tt
        'Lost your password?' => 'رمز عبور خود را فراموش کرده اید؟',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MetaFloater.tt
        'Scale preview content' => 'محتوای پیش نمایش مقیاس',
        'Open URL in new tab' => 'باز کردن URL در تب جدید',
        'Close preview' => 'بستن پیش نمایش',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'پیش نمایش از این وب سایت می تواند ارائه شود چرا که آن را اجازه نمی دهد به تعبیه شده است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MobileNotAvailableWidget.tt
        'Feature not Available' => '',
        'Sorry, but this feature of Znuny is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'با عرض پوزش، اما این ویژگی از Znuny در حال حاضر برای دستگاه های تلفن همراه در دسترس نیست. اگر شما می خواهم به استفاده از آن، شما می توانید هر دو سوئیچ به حالت دسکتاپ و یا استفاده از دستگاه دسکتاپ خود را به طور منظم.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Motd.tt
        'Message of the Day' => 'پیام روز',
        'This is the message of the day. You can edit this in %s.' => 'این پیام از روز است. شما می توانید این را در ویرایش %s .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NoPermission.tt
        'Insufficient Rights' => 'حقوق دسترسی ناکافی',
        'Back to the previous page' => 'بازگشت به صفحه قبل',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NotificationEvent/Email/Alert.tt
        'Alert' => '',
        'Powered by' => ' قدرت گرفته از ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Pagination.tt
        'Show first page' => 'نمایش اولین صفحه',
        'Show previous pages' => 'نمایش صفحات قبلی',
        'Show page %s' => 'نمایش صفحه %s',
        'Show next pages' => 'نمایش صفحات بعدی',
        'Show last page' => 'نمایش آخرین صفحه',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PictureUpload.tt
        'Need FormID!' => 'شناسه فرم مورد نیاز است',
        'No file found!' => 'فایلی یافت نشد!',
        'The file is not an image that can be shown inline!' => 'فایل مورد نظر تصویری نیست که بتواند به صورت inline نمایش داده شود.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PreferencesNotificationEvent.tt
        'No user configurable notifications found.' => 'هیچ کاربری اطلاعیه تنظیم شده است.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'برای دریافت پیام های اطلاع رسانی " %s با روش حمل و نقل %s .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/ActivityDialogHeader.tt
        'Process Information' => 'پردازش اطلاعات',
        'Dialog' => 'گفتگو',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/Article.tt
        'Inform Agent' => 'اطلاع به کارشناس',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PublicDefault.tt
        'Welcome' => 'خوش آمدید',
        'This is the default public interface of Znuny! There was no action parameter given.' =>
            'این به طور پیش فرض رابط عمومی Znuny موجود است! هیچ پارامتر action داده شده وجود دارد.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'شما می توانید یک ماژول سفارشی عمومی (از طریق مدیر بسته) نصب، به عنوان مثال ماژول پرسش و پاسخ، که دارای یک رابط عمومی است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAppointmentNotificationEvent.tt
        'To get the appointment attribute' => '',
        'e. g.' => 'به عنوان مثال',
        'To get the first 20 character of the appointment title.' => '',
        'To get the calendar attribute' => '',
        'Attributes of the recipient user for the notification' => 'صفات کاربران دریافت کننده برای اطلاع رسانی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAutoResponse.tt
        'To get the first 20 character of the subject.' => 'برای دریافت ۲۰ حرف اول موضوع',
        'To get the first 5 lines of the email.' => 'برای دریافت ۵ خط اول نامه',
        'To get the name of the ticket\'s customer user (if given).' => 'برای دریافت نام کاربر و ضوابط بلیط (در صورت داده شده).',
        'To get the article attribute' => 'برای گرفتن ویژگی مطلب',
        'Options of the current customer user data' => 'گزینه‌هایی از داده مشترک کنونی',
        'Ticket owner options' => 'گزینه‌های صاحب درخواست',
        'Options of the ticket data' => 'گزینه‌هایی از داده‌های درخواست',
        'Options of ticket dynamic fields internal key values' => 'گزینه درخواست رشته پویا ارزش های داخلی کلیدی',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'گزینه زمینه های پویا بلیط نمایش مقادیر، مفید برای زمینه های کرکره و چندین انتخاب',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminNotificationEvent.tt
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'برای گرفتن ۲۰ کاراکتر اول موضوع (از آخرین نوشته کارشناس).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'برای گرفتن اولین ۵ خط بدنه (از آخرین نوشته کارشناس).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'برای گرفتن اولین ۲۰ کاراکتر موضوع (از آخرین نوشته مشتری).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'برای گرفتن اولین ۵ خط بدنه (از آخرین نوشته مشتری).',
        'Attributes of the current customer user data' => 'ویژگی های داده های کاربر مشتری فعلی',
        'Attributes of the current ticket owner user data' => 'ویژگی های درخواست فعلی داده های کاربرمالک',
        'Attributes of the ticket data' => 'ویژگی های درخواست داده ',
        'Ticket dynamic fields internal key values' => 'درخواست زمینه های پویا ارزش های کلیدی داخلی',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'بلیط زمینه های پویا نمایش مقادیر، مفید برای زمینه های کرکره و چندین انتخاب',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminTemplate.tt
        'To get the first 20 characters of the subject of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            '',
        'To get the first 5 lines of the body of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            '',
        'To get the first 20 characters of the subject of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            '',
        'To get the first 5 lines of the body of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/Default.tt
        'Tag Reference' => 'مرجع برچسب',
        'You can use the following tags' => 'شما می‌توانید از برچسب‌های زیر استفاده نمایید.',
        'Ticket responsible options' => 'گزینه‌های مسئول درخواست',
        'Options of the current user who requested this action' => 'گزینه‌هایی از کاربر کنونی که این عملیات را درخواست کرده است',
        'Config options' => 'گزینه‌های پیکربندی',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/GeneralSpecificationsWidget.tt
        'You can select one or more groups to define access for different agents.' =>
            'شما می‌توانید یک یا چندین گروه را برای دسترسی برای کارشناسان مختلف تعریف نمایید.',
        'Result formats' => 'فرمت نتیجه',
        'Time Zone' => 'منطقه زمانی',
        'The selected time periods in the statistic are time zone neutral.' =>
            'دوره زمانی انتخاب شده در آمار هستند منطقه زمانی خنثی است.',
        'Create summation row' => 'ایجاد ردیف جمع',
        'Generate an additional row containing sums for all data rows.' =>
            'تولید یک ردیف اضافی شامل مبالغ برای همه ردیف داده.',
        'Create summation column' => 'ساختن ستون جمع',
        'Generate an additional column containing sums for all data columns.' =>
            'تولید یک ستون حاوی مبالغ اضافی برای همه ستون داده ها.',
        'Cache results' => 'نتایج کش',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'آمار فروشگاه های منجر داده ها در یک کش به توان در نمایش های بعدی با همان پیکربندی استفاده می شود (نیاز به حداقل یک انتخاب زمان درست).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'ارائه آمار به عنوان یک ویجت است که عوامل می تواند در داشبورد خود را فعال کنید.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'لطفا توجه داشته باشید که قادر می سازد ویجت داشبورد خواهد ذخیره برای این آمار در داشبورد فعال کنید.',
        'If set to invalid end users can not generate the stat.' => 'اگر به کاربران نهایی نامعتبر تنظیم شده باشد، نمی‌توان گزارش را تولید کرد.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/PreviewWidget.tt
        'There are problems in the configuration of this statistic:' => 'مشکلات در پیکربندی این آمار وجود دارد:',
        'You may now configure the X-axis of your statistic.' => 'شما اکنون میتوانید با محور X آماره خود را پیکربندی کنید.',
        'This statistic does not provide preview data.' => 'این آمار داده های پیش نمایش ارائه نمی دهد.',
        'Preview format' => '',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'لطفا توجه داشته باشید که پیش نمایش با استفاده از داده های تصادفی و فیلتر داده نمی دانند.',
        'Configure X-Axis' => 'پیکربندی X-محور',
        'X-axis' => 'محور افقی',
        'Configure Y-Axis' => 'پیکربندی محور Y',
        'Y-axis' => 'محور Y',
        'Configure Filter' => 'پیکربندی فیلتر',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/RestrictionsWidget.tt
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'فقط یک گزینه را انتخاب نمائید و یا کلید ثابت را خاموش نمائید',
        'Absolute period' => 'دوره مطلق',
        'Between %s and %s' => '',
        'Relative period' => 'دوره نسبی',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'گذشته کامل %s و جاری + آینده کامل %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'هنوز تغییرات را به این عنصر اجازه نمی دهد که آمار تولید می شود.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsParamsWidget.tt
        'Format' => 'فرمت',
        'Exchange Axis' => 'جابجایی محورها',
        'Configurable Params of Static Stat' => '',
        'No element selected.' => 'هیچ گزینه ای انتخاب نشده است',
        'Scale' => 'مقیاس',
        'show more' => 'نمایش بیشتر',
        'show less' => 'کمترنشان می دهد ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsResultRender/D3.tt
        'Download SVG' => 'دانلود SVG',
        'Download PNG' => 'دانلود PNG',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/XAxisWidget.tt
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'دوره زمانی انتخاب شده به طور پیش فرض چارچوب زمانی برای این آمار به جمع آوری داده ها از تعریف می کند.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'تعریف می کند که واحد زمان که استفاده می شود به تقسیم یک دوره زمانی انتخاب به گزارش نقاط داده است.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/YAxisWidget.tt
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'لطفا به یاد داشته باشید که این مقیاس برای محور Y را به بزرگتر از مقیاس برای محور X (به عنوان مثال محور X => ماه، محور Y => سال).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsList.tt
        'This setting is disabled.' => '',
        'This setting is fixed but not deployed yet!' => '',
        'This setting is currently being overridden in %s and can\'t thus be changed here!' =>
            '',
        'Changing this setting is only available in a higher config level!' =>
            '',
        '%s (%s) is currently working on this setting.' => '',
        'Toggle advanced options for this setting' => '',
        'Disable this setting, so it is no longer effective' => '',
        'Disable' => '',
        'Enable this setting, so it becomes effective' => '',
        'Enable' => '',
        'Reset this setting to its default state' => '',
        'Reset setting' => '',
        'Copy a direct link to this setting to your clipboard' => '',
        'Copy direct link' => '',
        'Remove this setting from your favorites setting' => '',
        'Remove from favourites' => '',
        'Add this setting to your favorites' => '',
        'Add to favourites' => '',
        'Cancel editing this setting' => '',
        'Save changes on this setting' => '',
        'Edit this setting' => '',
        'Enable this setting' => '',
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups or another group.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsListCompare.tt
        'Now' => '',
        'User modification' => '',
        'enabled' => '',
        'disabled' => '',
        'Setting state' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Actions.tt
        'Edit search' => '',
        'Go back to admin: ' => '',
        'Deployment' => '',
        'My favourite settings' => '',
        'Invalid settings' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/DynamicActions.tt
        'Filter visible settings...' => '',
        'Enable edit mode for all settings' => '',
        'Save all edited settings' => '',
        'Cancel editing for all settings' => '',
        'All actions from this widget apply to the visible settings on the right only.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Help.tt
        'Currently edited by me.' => '',
        'Modified but not yet deployed.' => '',
        'Currently edited by another user.' => '',
        'Different from its default value.' => '',
        'Save current setting.' => '',
        'Cancel editing current setting.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Navigation.tt
        'Navigation' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Test.tt
        'Znuny Test Page' => 'صفحه آزمایش سیستم',
        'Unlock' => 'تحویل دادن',
        'Welcome %s %s' => '%s - %s',
        'Counter' => 'شمارنده',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Ticket/TimeUnits.tt
        'Invalid time!' => 'زمان نا معتبر',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Warning.tt
        'Go back to the previous page' => 'به صفحه قبل بازگرد',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/FormDraftAddDialog.html.tmpl
        'Draft title' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/ArticleViewSettingsDialog.html.tmpl
        'Article display' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl
        'Do you really want to delete "%s"?' => '',
        'Confirm' => 'تائید',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/WidgetLoading.html.tmpl
        'Loading, please wait...' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/AjaxDnDUpload/UploadContainer.html.tmpl
        'Click to select a file for upload.' => '',
        'Select files or drop them here' => '',
        'Select a file or drop it here' => '',
        'Uploading...' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/PackageManager/InformationDialog.html.tmpl
        'Process state' => '',
        'Running' => '',
        'Finished' => 'پایان یافت',
        'Unknown' => 'ناشناخته',
        'No package information available.' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddButton.html.tmpl
        'Add new entry' => 'افزودن ورودی جدید',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddHashKey.html.tmpl
        'Add key' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogDeployment.html.tmpl
        'Deployment comment...' => '',
        'This field can have no more than 250 characters.' => '',
        'Deploying, please wait...' => '',
        'Preparing to deploy, please wait...' => '',
        'Deploy now' => '',
        'Try again' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogReset.html.tmpl
        'Do you really want to reset this setting to it\'s default value?' =>
            '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/HelpDialog.html.tmpl
        'You can use the category selection to limit the navigation tree below to entries from the selected category. As soon as you select the category, the tree will be re-built.' =>
            '',

        # Perl Module: Kernel/Config/Defaults.pm
        'Database Backend' => '',
        'CustomerIDs' => 'کد اشتراک',
        'Fax' => 'نمابر',
        'Street' => 'استان',
        'Zip' => 'کد پستی',
        'City' => 'شهر',
        'Country' => 'کشور',
        'Valid' => 'معتبر',
        'Mr.' => 'آقای',
        'Mrs.' => 'خانم',
        'View system log messages.' => 'نمایش پیغام‌های ثبت وقایع سیستم',
        'Edit the system configuration settings.' => 'ویرایش تنظیمات پیکربندی سیستم',
        'Update and extend your system with software packages.' => 'به روزرسانی و گسترش سیستم به کمک بسته‌های نرم‌افزاری',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'اطلاعات ACL از پایگاه اطلاع داده  هماهنگی با پیکربندی سیستم نیست، لطفا تمام ACL ها را مستقر کنید . ',
        'ACLs could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'ACL ها نمی تواند به دلیل یک خطای ناشناخته وارد شود، لطفابرای اطلاعات بیشتر Znuny سیاهه های مربوط را بررسی کنید ',
        'The following ACLs have been added successfully: %s' => 'استفاده از ACL زیر با موفقیت اضافه شده است: %s',
        'The following ACLs have been updated successfully: %s' => 'استفاده از ACL زیر با موفقیت به روز شده است: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'وجود دارد که در آن خطاهای اضافه کردن / به روز رسانی ACL ها زیر است: %s . لطفا ورود به سیستم فایل برای اطلاعات بیشتر.',
        'This field is required' => 'این فیلد مورد نیاز است',
        'There was an error creating the ACL' => 'خطایی در ایجاد لیگ قهرمانان آسیا وجود دارد',
        'Need ACLID!' => 'نیاز ACLID!',
        'Could not get data for ACLID %s' => 'می تواند داده ها را برای ACLID نیست %s',
        'There was an error updating the ACL' => 'خطایی در به روزرسانی لیگ قهرمانان آسیا وجود دارد',
        'There was an error setting the entity sync status.' => 'خطا در تنظیم وضعیت همگام نهاد وجود دارد.',
        'There was an error synchronizing the ACLs.' => 'یک خطای هماهنگ سازی ACL وجود دارد.',
        'ACL %s could not be deleted' => 'ACL %s نمی تواند حذف شود',
        'There was an error getting data for ACL with ID %s' => 'یک خطای گرفتن داده برای ACL با ID وجود دارد %s',
        '%s (copy) %s' => '',
        'Please note that ACL restrictions will be ignored for the Superuser account (UserID 1).' =>
            '',
        'Exact match' => 'مطابقت کامل',
        'Negated exact match' => 'مطابقت دقیق نفی',
        'Regular expression' => 'عبارت منظم',
        'Regular expression (ignore case)' => 'عبارت منظم (چشم پوشی مورد)',
        'Negated regular expression' => 'بیان نفی به طور منظم',
        'Negated regular expression (ignore case)' => 'عبارت منظم نفی (چشم پوشی مورد)',

        # Perl Module: Kernel/Modules/AdminAppointmentCalendarManage.pm
        'System was unable to create Calendar!' => '',
        'Please contact the administrator.' => 'لطفا با مدیر تماس بگیرید.',
        'No CalendarID!' => '',
        'You have no access to this calendar!' => '',
        'Error updating the calendar!' => '',
        'Couldn\'t read calendar configuration file.' => '',
        'Please make sure your file is valid.' => '',
        'Could not import the calendar!' => '',
        'Calendar imported!' => '',
        'Need CalendarID!' => '',
        'Could not retrieve data for given CalendarID' => '',
        'Successfully imported %s appointment(s) to calendar %s.' => '',
        '+5 minutes' => '',
        '+15 minutes' => '',
        '+30 minutes' => '',
        '+1 hour' => '',

        # Perl Module: Kernel/Modules/AdminAppointmentImport.pm
        'No permissions' => '',
        'System was unable to import file!' => '',
        'Please check the log for more information.' => '',

        # Perl Module: Kernel/Modules/AdminAppointmentNotificationEvent.pm
        'Notification name already exists!' => '',
        'Notification added!' => 'اطلاع رسانی اضافه شده است!',
        'There was an error getting data for Notification with ID:%s!' =>
            'یک خطای گرفتن داده برای هشدار  با ID وجود دارد: %s !',
        'Unknown Notification %s!' => 'هشدار نامشخص  از طریق %s !',
        '%s (copy)' => '',
        'There was an error creating the Notification' => 'خطایی در ایجاد هشدار  وجود دارد',
        'Notifications could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'اطلاعیه نمی تواند به دلیل یک خطای ناشناخته وارد شود، لطفا Znuny سیاهه های مربوط را بررسی کنید برای اطلاعات بیشتر',
        'The following Notifications have been added successfully: %s' =>
            'این اعلانها با موفقیت اضافه شده است: %s',
        'The following Notifications have been updated successfully: %s' =>
            'این اعلانها  با موفقیت به روز شده است: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'وجود دارد که در آن خطاهای اضافه کردن / به روز رسانی اطلاعیه زیر است: %s . لطفا ورود به سیستم فایل برای اطلاعات بیشتر.',
        'Notification updated!' => 'اطلاع رسانی به روز شده!',
        'Agent (resources), who are selected within the appointment' => '',
        'All agents with (at least) read permission for the appointment (calendar)' =>
            '',
        'All agents with write permission for the appointment (calendar)' =>
            '',

        # Perl Module: Kernel/Modules/AdminAutoResponse.pm
        'Auto Response added!' => '',

        # Perl Module: Kernel/Modules/AdminCommunicationLog.pm
        'Invalid CommunicationID!' => '',
        'All communications' => '',
        'Last 1 hour' => '',
        'Last 3 hours' => '',
        'Last 6 hours' => '',
        'Last 12 hours' => '',
        'Last 24 hours' => '',
        'Last week' => '',
        'Last month' => '',
        'Invalid StartTime: %s!' => '',
        'Successful' => '',
        'Processing' => '',
        'Failed' => '',
        'Invalid Filter: %s!' => 'فیلتر نامعتبر: %s !',
        'Less than a second' => '',
        'sorted descending' => 'مرتب شده نزولی',
        'sorted ascending' => 'مرتب شده صعودی',
        'Trace' => '',
        'Debug' => 'اشکال زدایی',
        'Info' => 'اطلاعات',
        'Warn' => '',
        'days' => 'روز',
        'day' => 'روز',
        'hour' => 'ساعت',
        'minute' => 'دقیقه',
        'seconds' => 'ثانیه',
        'second' => 'ثانیه',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer company updated!' => 'شرکت مشترک به روز شد.',
        'Dynamic field %s not found!' => '',
        'Unable to set value for dynamic field %s!' => '',
        'Customer Company %s already exists!' => 'ضوابط شرکت %s قبل وجود دارد!',
        'Customer company added!' => 'شرکت مشترک افزوده شد.',

        # Perl Module: Kernel/Modules/AdminCustomerGroup.pm
        'No configuration for \'CustomerGroupPermissionContext\' found!' =>
            '',
        'Please check system configuration.' => '',
        'Invalid permission context configuration:' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'Customer updated!' => 'مشترک به روزرسانی شد!',
        'New phone ticket' => 'درخواست تلفنی جدید',
        'New email ticket' => 'درخواست ایمیلی جدید',
        'Customer %s added' => 'مشترک %s افزوده شد',
        'Customer user updated!' => '',
        'Same Customer' => '',
        'Direct' => '',
        'Indirect' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUserGroup.pm
        'Change Customer User Relations for Group' => '',
        'Change Group Relations for Customer User' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUserService.pm
        'Allocate Customer Users to Service' => '',
        'Allocate Services to Customer User' => '',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'پیکربندی زمینه معتبر نیست',
        'Objects configuration is not valid' => 'پیکربندی اشیاء معتبر نیست',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'می تواند پویا درست سفارش تنظیم مجدد نمی کند، لطفا ورود به سیستم خطا برای جزئیات بیشتر.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'subaction تعریف نشده است.',
        'Need %s' => 'نیاز %s',
        'Add %s field' => '',
        'The field does not contain only ASCII letters and numbers.' => 'میدان آیا فقط شامل حروف ASCII و اعداد نیست.',
        'There is another field with the same name.' => ' یکی دیگر از این زمینه با همین نام وجود دارد.',
        'The field must be numeric.' => 'زمینه باید عدد باشد.',
        'Need ValidID' => 'نیاز ValidID',
        'Could not create the new field' => 'نمی توانید زمینه جدید ایجاد کنید',
        'Need ID' => 'نیاز ID',
        'Could not get data for dynamic field %s' => ' توان داده هابرای زمینه پویا نیست %s',
        'Change %s field' => '',
        'The name for this field should not change.' => 'نام این زمینه نباید تغییر کند.',
        'Could not update the field %s' => 'نمی توانید زمینه را به روز رسانی کنید %s',
        'Currently' => 'در حال حاضر',
        'Unchecked' => 'بدون کنترل',
        'Checked' => 'بررسی',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'جلوگیری از ورود تاریخ در آینده',
        'Prevent entry of dates in the past' => 'جلوگیری از ورود تاریخ در گذشته',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'این مقدار فیلد تکراری است.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldScreenConfiguration.pm
        'Settings were saved.' => '',
        'System was not able to save the setting!' => '',
        'Setting is locked by another user!' => '',
        'System was not able to reset the setting!' => '',
        'Settings were reset.' => '',
        'Screens for dynamic field %s' => '',
        'Dynamic fields for screen %s' => '',
        'Default columns for screen %s' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldWebservice.pm
        'Could not get config for dynamic field %s' => '',
        'The field must contain only ASCII letters and numbers.' => '',
        'Dynamic field is configured more than once.' => '',
        'Dynamic field does not exist or is invalid.' => '',
        'Only dynamic fields for tickets are allowed.' => '',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'حداقل یک گیرنده را انتخاب کنید.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'minute(s)' => 'دقیقه',
        'hour(s)' => 'ساعت',
        'Time unit' => 'واحد زمان',
        'within the last ...' => 'در آخرین ...',
        'within the next ...' => 'در بعدی ...',
        'more than ... ago' => 'بیش از ... قبل',
        'Unarchived tickets' => 'بلیط از بایگانی خارج شد',
        'archive tickets' => ' آرشیو درخواست',
        'restore tickets from archive' => 'بازگرداندن درخواست از آرشیو',
        'Need Profile!' => 'نیاز به مشخصات!',
        'Got no values to check.' => 'هیچ ارزش به بررسی کردم.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'لطفا کلمات زیر حذف زیرا آنها می توانند برای انتخاب بلیط مورد استفاده قرار گیرد:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'نیاز WebserviceID!',
        'Could not get data for WebserviceID %s' => 'می تواند داده ها را برای WebserviceID نیست %s',
        'ascending' => 'صعودی',
        'descending' => 'نزولی',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingDefault.pm
        'Need communication type!' => '',
        'Communication type needs to be \'Requester\' or \'Provider\'!' =>
            '',
        'Invalid Subaction!' => '',
        'Need ErrorHandlingType!' => '',
        'ErrorHandlingType %s is not registered' => '',
        'Could not update web service' => '',
        'Need ErrorHandling' => '',
        'Could not determine config for error handler %s' => '',
        'Invoker processing outgoing request data' => '',
        'Mapping outgoing request data' => '',
        'Transport processing request into response' => '',
        'Mapping incoming response data' => '',
        'Invoker processing incoming response data' => '',
        'Transport receiving incoming request data' => '',
        'Mapping incoming request data' => '',
        'Operation processing incoming request data' => '',
        'Mapping outgoing response data' => '',
        'Transport sending outgoing response data' => '',
        'skip same backend modules only' => '',
        'skip all modules' => '',
        'Operation deleted' => '',
        'Invoker deleted' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingRequestRetry.pm
        '0 seconds' => '',
        '15 seconds' => '',
        '30 seconds' => '',
        '45 seconds' => '',
        '1 minute' => '',
        '2 minutes' => '',
        '3 minutes' => '',
        '4 minutes' => '',
        '5 minutes' => '',
        '10 minutes' => '۱۰ دقیقه',
        '15 minutes' => '۱۵ دقیقه',
        '30 minutes' => '',
        '1 hour' => '',
        '2 hours' => '',
        '3 hours' => '',
        '4 hours' => '',
        '5 hours' => '',
        '6 hours' => '',
        '12 hours' => '',
        '18 hours' => '',
        '1 day' => '',
        '2 days' => '',
        '3 days' => '',
        '4 days' => '',
        '6 days' => '',
        '1 week' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Could not determine config for invoker %s' => 'می تواند پیکربندی برای invoker مشخص نیست %s',
        'InvokerType %s is not registered' => 'InvokerType %s ثبت نشده است',
        'MappingType %s is not registered' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerEvent.pm
        'Need Invoker!' => '',
        'Need Event!' => '',
        'Could not get registered modules for Invoker' => '',
        'Could not get backend for Invoker %s' => '',
        'The event %s is not valid.' => '',
        'Could not update configuration data for WebserviceID %s' => 'می تواند داده های پیکربندی برای WebserviceID به روز رسانی کنید %s',
        'This sub-action is not valid' => '',
        'xor' => 'XOR',
        'String' => 'String',
        'Regexp' => '',
        'Validation Module' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Simple Mapping for Outgoing Data' => '',
        'Simple Mapping for Incoming Data' => '',
        'Could not get registered configuration for action type %s' => 'می تواند پیکربندی ثبت نام برای نوع عمل نمی %s',
        'Could not get backend for %s %s' => 'می تواند باطن برای دریافت %s %s',
        'Keep (leave unchanged)' => 'نگه دارید (ترک بدون تغییر)',
        'Ignore (drop key/value pair)' => 'نادیده گرفتن (کلید قطره / جفت ارزش)',
        'Map to (use provided value as default)' => 'نقشه به (استفاده ارائه ارزش به عنوان پیش فرض)',
        'Exact value(s)' => 'مقدار دقیق (بازدید کنندگان)',
        'Ignore (drop Value/value pair)' => 'نادیده گرفتن (رها ارزش جفت / ارزش)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'XSLT Mapping for Outgoing Data' => '',
        'XSLT Mapping for Incoming Data' => '',
        'Could not find required library %s' => 'نمی توانید کتابخانه مورد نیازرا پیدا کنید %s',
        'Outgoing request data before processing (RequesterRequestInput)' =>
            '',
        'Outgoing request data before mapping (RequesterRequestPrepareOutput)' =>
            '',
        'Outgoing request data after mapping (RequesterRequestMapOutput)' =>
            '',
        'Incoming response data before mapping (RequesterResponseInput)' =>
            '',
        'Outgoing error handler data after error handling (RequesterErrorHandlingOutput)' =>
            '',
        'Incoming request data before mapping (ProviderRequestInput)' => '',
        'Incoming request data after mapping (ProviderRequestMapOutput)' =>
            '',
        'Outgoing response data before mapping (ProviderResponseInput)' =>
            '',
        'Outgoing error handler data after error handling (ProviderErrorHandlingOutput)' =>
            '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Could not determine config for operation %s' => 'می تواند پیکربندی برای عملیات مشخص نیست %s',
        'OperationType %s is not registered' => 'OperationType %s ثبت نشده است',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need valid Subaction!' => '',
        'This field should be an integer.' => '',
        'Invalid key file and/or password (if needed, see below).' => '',
        'Invalid password and/or key file (see above).' => '',
        'Certificate is expired.' => '',
        'Certificate file could not be parsed.' => '',
        'Please enter a time in seconds (at least 10 seconds).' => '',
        'Please enter data in expected form (see explanation of field).' =>
            '',
        'File or Directory not found.' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'یکی دیگر از خدمات وب سایت با همین نام وجود دارد.',
        'There was an error updating the web service.' => 'خطایی در به روزرسانی وب سرویس وجود دارد.',
        'There was an error creating the web service.' => 'خطایی در ایجاد وب سرویس وجود دارد.',
        'Web service "%s" created!' => 'وب سرویس \ " %s " ایجاد شده است!',
        'Need Name!' => 'نیاز به نام!',
        'Need ExampleWebService!' => 'نیاز ExampleWebService!',
        'Could not load %s.' => '',
        'Could not read %s!' => 'قادر به خواندن نیست %s !',
        'Need a file to import!' => 'نیاز به یک فایل برای دریافت است .',
        'The imported file has not valid YAML content! Please check Znuny log for details' =>
            'فایل وارد شده است محتوای YAML معتبر نیست! لطفا وارد سیستم شوید Znuny برای جزئیات بیشتر',
        'Web service "%s" deleted!' => 'وب سرویس \ " %s " حذف!',
        'Znuny as provider' => 'Znuny به عنوان ارائه دهنده',
        'Operations' => '',
        'Znuny as requester' => 'Znuny به عنوان درخواست',
        'Invokers' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'کردم هیچ WebserviceHistoryID!',
        'Could not get history data for WebserviceHistoryID %s' => 'می تواند داده های تاریخ برای WebserviceHistoryID نیست %s',

        # Perl Module: Kernel/Modules/AdminGroup.pm
        'Group updated!' => 'گروه به روزرسانی شد!',

        # Perl Module: Kernel/Modules/AdminMailAccount.pm
        'Mail account added!' => 'حساب ایمیل افزوده شد.',
        'Email account fetch already fetched by another process. Please try again later!' =>
            '',
        'Dispatching by email To: field.' => 'ارسال با پست الکترونیکی به:فیلد',
        'Dispatching by selected Queue.' => 'ارسال بوسیله لیست انتخاب شده',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Agent who created the ticket' => '',
        'Agent who owns the ticket' => 'عامل کسیکه صاحب درخواست',
        'Agent who is responsible for the ticket' => 'عامل کسیکه مسئول درخواست است',
        'All agents watching the ticket' => 'تمام عوامل تماشای درخواست',
        'All agents with write permission for the ticket' => 'همه عوامل با مجوز نوشتن درخواست برای',
        'All agents subscribed to the ticket\'s queue' => 'تمام عوامل مشترک به صف درخواست',
        'All agents subscribed to the ticket\'s service' => 'تمام عوامل مشترک خدمات درخواست',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'تمام عوامل مشترک به هر دو صف و خدمات درخواست',
        'Customer user of the ticket' => '',
        'All recipients of the first article' => '',
        'All recipients of the last article' => '',
        'All agents who are mentioned in the ticket' => '',
        'Invisible to customer' => '',
        'Visible to customer' => '',

        # Perl Module: Kernel/Modules/AdminOAuth2TokenManagement.pm
        'Authorization code parameters not found.' => '',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'محیط زیست PGP کار نمی کند. لطفا وارد سیستم شوید برای اطلاعات بیشتر ',
        'Need param Key to delete!' => 'نیاز کلید param را حذف کنید!',
        'Key %s deleted!' => 'کلید %s حذف!',
        'Need param Key to download!' => 'نیاز کلید param برای دانلود!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!' =>
            'با عرض پوزش، آپاچی :: بازنگری به عنوان PerlModule و PerlInitHandler در فایل پیکربندی آپاچی مورد نیاز است. همچنین نگاه اسکریپت / apache2 را-httpd.include.conf. متناوبا، شما می توانید از دستور ابزار خط بن / znuny.Console.pl برای نصب بستههای استفاده کنید!',
        'No such package!' => 'بدون چنین بسته!',
        'No such file %s in package!' => 'بدون چنین فایل %s در بسته!',
        'No such file %s in local file system!' => 'بدون چنین فایلی  %s در فایل سیستم محلی!',
        'Can\'t read %s!' => 'نمی تواند بخواند %s !',
        'Package has locally modified files.' => 'بسته بندی به صورت محلی فایل های اصلاح شده.',
        'Not Started' => '',
        'Updated' => '',
        'Already up-to-date' => '',
        'Installed' => '',
        'Not correctly deployed' => '',
        'Package updated correctly' => '',
        'Package was already updated' => '',
        'Dependency installed correctly' => '',
        'The package needs to be reinstalled' => '',
        'The package contains cyclic dependencies' => '',
        'Not found in on-line repositories' => '',
        'Required version is higher than available' => '',
        'Dependencies fail to upgrade or install' => '',
        'Package could not be installed' => '',
        'Package could not be upgraded' => '',
        'Repository List' => '',
        'No packages found in selected repository. Please check log for more info!' =>
            '',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'بدون چنین فیلتر: %s',

        # Perl Module: Kernel/Modules/AdminPriority.pm
        'Priority added!' => 'اولویت اضافه شده است!',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'اطلاعات مدیریت فرآیند از پایگاه اطلاع داده هماهنگ با پیکربندی سیستم نیست، لطفا تمام فرآیندها را همگام سازی کنید.',
        'Need ExampleProcesses!' => 'نیاز ExampleProcesses!',
        'Need ProcessID!' => 'نیاز ProcessID!',
        'Yes (mandatory)' => 'بله (اجباری)',
        'Unknown Process %s!' => 'فرایند ناشناخته %s !',
        'There was an error generating a new EntityID for this Process' =>
            'یک خطای تولید یک EntityID جدید برای این فرایند وجود دارد',
        'The StateEntityID for state Inactive does not exists' => 'StateEntityID برای حالت غیر فعال وجود ندارد',
        'There was an error creating the Process' => 'خطایی در ایجاد این فرآیند وجود دارد',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'خطا در تنظیم وضعیت همگام نهاد برای نهاد فرآیند وجود دارد: %s',
        'Could not get data for ProcessID %s' => 'نمی تواند داده ها را برای ProcessID بگیرد %s',
        'There was an error updating the Process' => 'خطایی در به روزرسانی این فرآیند وجود دارد',
        'Process: %s could not be deleted' => 'فرآیند: %s نمی تواند حذف شود',
        'There was an error synchronizing the processes.' => 'یک خطای هماهنگ سازی فرآیند وجود دارد.',
        'The %s:%s is still in use' => '%s : %s هنوز هم مورد استفاده',
        'The %s:%s has a different EntityID' => '%s : %s مختلف EntityIDدارد',
        'Could not delete %s:%s' => 'نمیتوان حذف کرد %s : %s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'خطا در تنظیم وضعیت همگام نهاد وجود دارد %s نهاد: %s',
        'Could not get %s' => 'نمی تواند بگیرد%s',
        'Need %s!' => 'نیاز %s !',
        'Process: %s is not Inactive' => 'فرآیند: %sغیر فعال نیست',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'یک خطای تولید  EntityID جدید برای این فعالیت وجود دارد',
        'There was an error creating the Activity' => 'خطایی در ایجاد فعالیت وجود دارد',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'خطا در تنظیم وضعیت همگام نهاد برای نهاد فعالیت وجود دارد: %s',
        'Need ActivityID!' => 'نیاز ActivityID!',
        'Could not get data for ActivityID %s' => 'نمی تواند داده ها را برای ActivityID بگیرد %s',
        'There was an error updating the Activity' => 'خطایی هنگام فعالیت به روزرسانی وجود دارد',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'پارامتر: نیاز فعالیت و ActivityDialog!',
        'Activity not found!' => 'فعالیت یافت نشد!',
        'ActivityDialog not found!' => 'ActivityDialog یافت نشد!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'ActivityDialog در حال حاضر به فعالیت اختصاص داده است. شما نمی توانید ActivityDialog اضافه دو بار!',
        'Error while saving the Activity to the database!' => 'خطا در هنگام ذخیره فعالیت ها به پایگاه داده!',
        'This subaction is not valid' => 'این subaction معتبر نیست',
        'Edit Activity "%s"' => 'ویرایش فعالیت \ " %s "',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'یک خطای تولید  EntityID جدید برای این ActivityDialog وجود دارد',
        'There was an error creating the ActivityDialog' => 'یک خطای ایجاد ActivityDialog وجود دارد',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'خطا در تنظیم نهاد وضعیت همگام برای نهاد ActivityDialog وجود دارد: %s',
        'Need ActivityDialogID!' => 'نیاز ActivityDialogID!',
        'Could not get data for ActivityDialogID %s' => 'نمی تواند داده ها را برای ActivityDialogIDبگیرد %s',
        'There was an error updating the ActivityDialog' => 'یک خطای به روز رسانی ActivityDialog وجود دارد',
        'Edit Activity Dialog "%s"' => 'ویرایش فعالیت گفت و گو \ " %s "',
        'Agent Interface' => 'رابط عامل',
        'Customer Interface' => 'رابط مشتری',
        'Agent and Customer Interface' => 'عامل و  رابط مشتری',
        'Do not show Field' => 'زمینه را درست نشان نمی دهد ',
        'Show Field' => 'نمایش زمینه',
        'Show Field As Mandatory' => 'نمایش زمینه به عنوان اجباری',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'ویرایش مسیر',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'یک خطای تولید  EntityID جدید برای این انتقال وجود دارد',
        'There was an error creating the Transition' => 'خطایی در ایجاد انتقال وجود دارد',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'خطا در تنظیم نهاد وضعیت همگام برای نهاد گذار وجود دارد: %s',
        'Need TransitionID!' => 'نیاز TransitionID!',
        'Could not get data for TransitionID %s' => 'نمی تواند داده ها را برای TransitionID گرفت %s',
        'There was an error updating the Transition' => 'خطایی هنگام انتقال وجود دارد',
        'Edit Transition "%s"' => 'ویرایش گذار \ " %s "',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'حداقل یک پارامتر پیکربندی معتبر مورد نیاز است.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'یک خطای تولید یک EntityID جدید برای این TransitionAction وجود دارد',
        'There was an error creating the TransitionAction' => 'یک خطای ایجاد TransitionAction وجود دارد',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'خطا در تنظیم نهاد وضعیت همگام برای نهاد TransitionAction وجود دارد: %s',
        'Need TransitionActionID!' => 'نیاز TransitionActionID!',
        'Could not get data for TransitionActionID %s' => 'نمی تواند داده ها را برای TransitionActionID\'گرفت %s',
        'There was an error updating the TransitionAction' => 'یک خطای به روز رسانی TransitionAction وجود دارد',
        'Edit Transition Action "%s"' => 'ویرایش انتقال اقدام \ " %s "',
        'Error: Not all keys seem to have values or vice versa.' => 'خطا: همه کلید به نظر می رسد ارزش و یا بالعکس.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Queue updated!' => 'صف به روزرسانی شد!',
        'Don\'t use :: in queue name!' => 'استفاده نکنید :: در نام صف!',
        'Click back and change it!' => ' کلیک بک کنید و آن را تغییر دهید!',
        '-none-' => '--',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'صف (بدون پاسخ خودکار)',

        # Perl Module: Kernel/Modules/AdminQueueTemplates.pm
        'Change Queue Relations for Template' => 'تغییر روابط صف برای الگو',
        'Change Template Relations for Queue' => 'تغییر روابط الگو برای صف',

        # Perl Module: Kernel/Modules/AdminRole.pm
        'Role updated!' => 'نقش به روزرسانی شد!',
        'Role added!' => 'نقش افزوده شد!',

        # Perl Module: Kernel/Modules/AdminRoleGroup.pm
        'Change Group Relations for Role' => 'تغییر روابط گروه برای نقش',
        'Change Role Relations for Group' => 'تغییر روابط نقش برای گروه',

        # Perl Module: Kernel/Modules/AdminRoleUser.pm
        'Role' => '',
        'Change Role Relations for Agent' => 'تغییر روابط نقش برای کارشناس',
        'Change Agent Relations for Role' => 'تغییر روابط کارشناس برای نقش',

        # Perl Module: Kernel/Modules/AdminSLA.pm
        'Please activate %s first!' => 'لطفا ابتدا %s را فعال نمایید.',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'محیط زیست S / MIME کار نمی کند. لطفا وارد سیستم شوید برای اطلاعات بیشتر بررسی کنید!',
        'Need param Filename to delete!' => 'نیاز نام فایل PARAM را حذف کنید!',
        'Need param Filename to download!' => 'نیاز نام فایل PARAM برای دانلود!',
        'Needed CertFingerprint and CAFingerprint!' => 'مورد نیاز CertFingerprint و CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint باید از CertFingerprint متفاوت باشد',
        'Relation exists!' => 'رابطه وجود دارد!',
        'Relation added!' => 'رابطه اضافه شده است!',
        'Impossible to add relation!' => 'اضافه کردن رابطه غیر ممکن است  !',
        'Relation doesn\'t exists' => 'رابطه  وجود ندارد',
        'Relation deleted!' => 'حذف رابطه !',
        'Impossible to delete relation!' => '  حذف رابطه غیر ممکن است!',
        'Certificate %s could not be read!' => 'گواهی %s نمی تواند خوانده شود!',
        'Handle Private Certificate Relations' => '',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation added!' => 'سلام اضافه شده است!',

        # Perl Module: Kernel/Modules/AdminSignature.pm
        'Signature updated!' => 'امضا به روز شده!',
        'Signature added!' => 'امضا اضافه شده است!',

        # Perl Module: Kernel/Modules/AdminState.pm
        'State added!' => 'وضعیت افزوده شد!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'فایل %s نمی تواند بخواند!',

        # Perl Module: Kernel/Modules/AdminSystemAddress.pm
        'System e-mail address added!' => 'سیستم آدرس ایمیل اضافه شده است!',

        # Perl Module: Kernel/Modules/AdminSystemConfiguration.pm
        'Invalid Settings' => '',
        'There are no invalid settings active at this time.' => '',
        'You currently don\'t have any favourite settings.' => '',
        'The following settings could not be found: %s' => '',
        'Import not allowed!' => 'دریافت مجاز نیست!',
        'System Configuration could not be imported due to an unknown error, please check Znuny logs for more information.' =>
            '',
        'Category Search' => '',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationDeployment.pm
        'Some imported settings are not present in the current state of the configuration or it was not possible to update them. Please check the Znuny log for more information.' =>
            '',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationGroup.pm
        'You need to enable the setting before locking!' => '',
        'You can\'t work on this setting because %s (%s) is currently working on it.' =>
            '',
        'Missing setting name!' => '',
        'Missing ResetOptions!' => '',
        'System was not able to lock the setting!' => '',
        'System was unable to update setting!' => '',
        'Missing setting name.' => '',
        'Setting not found.' => '',
        'Missing Settings!' => '',

        # Perl Module: Kernel/Modules/AdminSystemFiles.pm
        'Package files - %s' => '',
        '(Files where only the permissions have been changed will not be displayed.)' =>
            '',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'نباید تاریخ شروع  پس از تاریخ توقف تعریف  شود!',
        'There was an error creating the System Maintenance' => 'خطایی در ایجاد تعمیر و نگهداری سیستم وجود دارد',
        'Need SystemMaintenanceID!' => 'نیاز SystemMaintenanceID!',
        'Could not get data for SystemMaintenanceID %s' => 'نمی تواند داده ها را برای SystemMaintenanceID گرفت %s',
        'System Maintenance was added successfully!' => '',
        'System Maintenance was updated successfully!' => '',
        'Session has been killed!' => 'جلسه کشته شده است!',
        'All sessions have been killed, except for your own.' => 'تمام جلسات کشته شده اند، به جز خود شما.',
        'There was an error updating the System Maintenance' => 'خطایی هنگام تعمیر و نگهداری سیستم وجود دارد',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'بود ممکن است برای حذف ورود SystemMaintenance نه: %s !',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'الگو به روز شده!',

        # Perl Module: Kernel/Modules/AdminTemplateAttachment.pm
        'Change Attachment Relations for Template' => 'روابط تغییر فایل پیوست برای الگو',
        'Change Template Relations for Attachment' => 'تغییر روابط الگو برای پیوست',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'نیاز تایپ!',
        'Type added!' => 'نوع افزوده شد!',

        # Perl Module: Kernel/Modules/AdminUser.pm
        'Agent updated!' => 'کارشناس به روز شد!',

        # Perl Module: Kernel/Modules/AdminUserGroup.pm
        'Change Group Relations for Agent' => 'تغییر روابط گروه برای کارشناس',
        'Change Agent Relations for Group' => 'تغییر روابط کارشناس برای گروه',

        # Perl Module: Kernel/Modules/AgentAppointmentAgendaOverview.pm
        'Month' => 'ماه',
        'Week' => '',
        'Day' => 'روز',

        # Perl Module: Kernel/Modules/AgentAppointmentCalendarOverview.pm
        'All appointments' => '',
        'Appointments assigned to me' => '',
        'Showing only appointments assigned to you! Change settings' => '',

        # Perl Module: Kernel/Modules/AgentAppointmentEdit.pm
        'Appointment not found!' => '',
        'Never' => '',
        'Every Day' => '',
        'Every Week' => '',
        'Every Month' => '',
        'Every Year' => '',
        'Custom' => '',
        'Daily' => '',
        'Weekly' => '',
        'Monthly' => '',
        'Yearly' => '',
        'every' => '',
        'for %s time(s)' => '',
        'until ...' => '',
        'for ... time(s)' => '',
        'until %s' => '',
        'No notification' => '',
        '%s minute(s) before' => '',
        '%s hour(s) before' => '',
        '%s day(s) before' => '',
        '%s week before' => '',
        'before the appointment starts' => '',
        'after the appointment has been started' => '',
        'before the appointment ends' => '',
        'after the appointment has been ended' => '',
        'No permission!' => '',
        'Cannot delete ticket appointment!' => '',
        'No permissions!' => '',

        # Perl Module: Kernel/Modules/AgentAppointmentList.pm
        '+%s more' => '',

        # Perl Module: Kernel/Modules/AgentCustomerSearch.pm
        'Customer History' => 'تاریخچه اشتراک',

        # Perl Module: Kernel/Modules/AgentCustomerUserAddressBook.pm
        'No RecipientField is given!' => '',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'چنین پیکربندی برای %s',
        'Statistic' => 'آمار',
        'No preferences for %s!' => 'هیچ تنظیمات برای %s !',
        'Can\'t get element data of %s!' => 'نمی توانید داده های عنصررا بگیرید %s !',
        'Can\'t get filter content data of %s!' => 'نمی توانید داده ها محتوای فیلتر را بگیرید  %s !',
        'Customer Name' => 'نام مشتری',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'نیاز SourceObject و SourceKey!',
        'You need ro permission!' => 'شما نیاز RO اجازه!',
        'Can not delete link with %s!' => 'نمی توانید لینک را حذف کنید با %s !',
        '%s Link(s) deleted successfully.' => '',
        'Can not create link with %s! Object already linked as %s.' => 'نمی توانید لینک را ایجاد کنید با%s ! جسم در حال حاضر به عنوان مرتبط %s .',
        'Can not create link with %s!' => 'نمی توانید لینک را ایجاد کنید %s !',
        '%s links added successfully.' => '',
        'The object %s cannot link with other object!' => 'هدف %s نمی تواند با جسم دیگر  لینک شود!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'PARAM گروه مورد نیاز است!',

        # Perl Module: Kernel/Modules/AgentSplitSelection.pm
        'Process ticket' => 'روند درخواست',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'پارامتر %s از دست رفته است.',
        'Invalid Subaction.' => 'Subaction نامعتبر است.',
        'Statistic could not be imported.' => 'آمار نمی تواند وارد شود.',
        'Please upload a valid statistic file.' => 'لطفا یک فایل آمار معتبر آپلود کنید.',
        'Export: Need StatID!' => 'ارسال: نیاز StatID!',
        'Delete: Get no StatID!' => 'حذف: مطلع هیچ StatID!',
        'Need StatID!' => 'نیاز StatID!',
        'Could not load stat.' => 'آمار نمی تواند بارگزاری شود .',
        'Add New Statistic' => 'اضافه کردن  آمارجدید',
        'Could not create statistic.' => 'نمی توانید آمار ایجاد کنید.',
        'Run: Get no %s!' => 'اجرا: دریافت هیچ %s !',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'بدون TicketID داده شده است!',
        'You need %s permissions!' => 'شما نیاز %s مجوز!',
        'Loading draft failed!' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'با عرض پوزش،برای انجام این عملیات شما نیاز به اطلاعت  صاحب بلیط دارید . ',
        'Please change the owner first.' => 'لطفا ابتدا مالک را تغییر دهید.',
        'FormDraft functionality disabled!' => '',
        'Draft name is required!' => '',
        'FormDraft name %s is already in use!' => '',
        'Could not perform validation on field %s!' => 'نمی تواند اعتبار سنجی در زمینه انجام شود  %s !',
        'No subject' => 'بدون موضوع',
        'Could not delete draft!' => '',
        'Previous Owner' => 'صاحب قبلی',
        'wrote' => 'نوشته شد',
        'Message from' => 'فرم پیام',
        'End message' => 'پایان پیام',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s مورد نیاز است!',
        'Plain article not found for article %s!' => 'مقاله ساده برای مقاله یافت نشد %s !',
        'Article does not belong to ticket %s!' => 'مقاله به درخواست تعلق ندارد %s !',
        'Can\'t bounce email!' => 'نمی توانید از ایمیل بپرید !',
        'Can\'t send email!' => 'نمی توانید ایمیل ارسال کنید!',
        'Wrong Subaction!' => 'Subaction اشتباه است!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'نمی توانید درخواست را قفل کنید، هیچ TicketIDs داده نمی شود!',
        'Ticket (%s) is not unlocked!' => 'درخواست  ( %s )باز نشده است .',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to tickets: %s.' =>
            '',
        'The following ticket was ignored because it is locked by another agent or you don\'t have write access to ticket: %s.' =>
            '',
        'You need to select at least one ticket.' => 'شما نیاز به انتخاب حداقل یک بلیط.',
        'Bulk feature is not enabled!' => 'از ویژگی های فله فعال نیست!',
        'No selectable TicketID is given!' => 'بدون TicketID انتخاب داده شده است!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'شما هم بدون بلیط و یا فقط بلیط که توسط عوامل دیگر قفل شده انتخاب شده است.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            '',
        'The following tickets were locked: %s.' => '',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Article subject will be empty if the subject contains only the ticket hook!' =>
            '',
        'Address %s replaced with registered customer address.' => ' %s آدرس با آدرس مشتری ثبت شده جایگزین شده است.',
        'Customer user automatically added in Cc.' => 'نام کاربری مشتری به طور خودکار در رونوشت اضافه میشود',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'Ticket "%s" created!' => 'درخواست %s ایجاد شد !',
        'No Subaction!' => 'بدون Subaction!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'کردم هیچ TicketID!',
        'System Error!' => 'خطای سیستم!',

        # Perl Module: Kernel/Modules/AgentTicketEmailResend.pm
        'No ArticleID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Next week' => 'هفته آینده',
        'Ticket Escalation View' => 'نمای درخواست‌های خیلی مهم',

        # Perl Module: Kernel/Modules/AgentTicketForward.pm
        'Article %s could not be found!' => '',
        'Forwarded message from' => 'پیام فوروارد شده از',
        'End forwarded message' => 'پایان پیام فرستاده شده',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'نمی تواند تاریخ را نشان دهد، هیچ TicketID داده نشده است!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'نمی توانید درخواست را قفل کنید، هیچ TicketID داده نشده است!',
        'Sorry, the current owner is %s!' => 'با عرض پوزش، مالک فعلی است %s !',
        'Please become the owner first.' => 'لطفا تبدیل شود به صاحب اول.',
        'Ticket (ID=%s) is locked by %s!' => 'درخواست (ID = %s ) توسط قفل شده %s !',
        'Change the owner!' => 'تغییر صاحب!',

        # Perl Module: Kernel/Modules/AgentTicketLockedView.pm
        'New Article' => 'نوشته جدید',
        'Pending' => 'معلق',
        'Reminder Reached' => 'زمان اعلام یک یادآوری است',
        'My Locked Tickets' => 'درخواست‌های تحویل گرفته شده من',

        # Perl Module: Kernel/Modules/AgentTicketMentionView.pm
        'New mention' => '',
        'My Mentions' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'نمی توانید درخواست خود را با خودش ادغام کنید!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'شما نیاز به مجوز حرکت دارید !',

        # Perl Module: Kernel/Modules/AgentTicketPhoneCommon.pm
        'Ticket locked.' => 'تیکت قفل شده است.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'بدون ArticleID!',
        'This is not an email article.' => '',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'نمی توانید مقاله ساده را بخوانید! شاید هیچ ایمیل ساده ای در باطن وجود ندارد! خواندن پیام باطن.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'نیاز TicketID!',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'نمی تواند ActivityDialogEntityID \ "بگیرد %s "!',
        'No Process configured!' => 'هیچ فرآیندی پیکربندی نشده است!',
        'The selected process is invalid!' => 'روند انتخاب نامعتبر است!',
        'Process %s is invalid!' => 'روند %s نامعتبر است!',
        'Subaction is invalid!' => 'Subaction نامعتبر است!',
        'Parameter %s is missing in %s.' => 'پارامتر %s در از دست رفته %s .',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'بدون ActivityDialog پیکربندی شده برای %s در _RenderAjax!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'کردم هیچ شروع ActivityEntityID یا Start ActivityDialogEntityID برای فرآیند: %s در _GetParam!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => ': می تواند بلیط برای TicketID نیست %s در _GetParam!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'نمی تواند ActivityEntityID  تعیین  کند. DynamicField یا پیکربندی شده است به درستی تنظیم نشده!',
        'Process::Default%s Config Value missing!' => 'فرآیند :: پیش فرض %s پیکربندی ارزش از دست رفته!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'کردم هیچ ProcessEntityID یا TicketID و ActivityDialogEntityID!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'می توانید StartActivityDialog و StartActivityDialog شدن برای ProcessEntityID \ "نمی %s "!',
        'Can\'t get Ticket "%s"!' => 'نمی توانید بلیط \ "از %s "!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'نمی توانید ProcessEntityID یا ActivityEntityID برای درخواست  \ "بگیرید %s "!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'می توانید پیکربندی فعالیت برای ActivityEntityID \ "نمی %s "!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'می توانید پیکربندی ActivityDialog برای ActivityDialogEntityID \ "نمی %s "!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'می توانید داده ها را برای درست \ "نمی %s " از ActivityDialog \ " %s "!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'PendingTime میتوانید از استفاده اگر دولت و یا StateID برای ActivityDialog همان پیکربندی شده است. ActivityDialog: %s !',
        'Pending Date' => 'مهلت تعلیق',
        'for pending* states' => 'برای حالات تعلیق',
        'ActivityDialogEntityID missing!' => 'ActivityDialogEntityID از دست رفته!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'می تواند پیکربندی برای ActivityDialogEntityID \ "نمی %s "!',
        'Couldn\'t use CustomerID as an invisible field.' => 'می تواند به عنوان یک CustomerID میدان نامرئی استفاده کنید.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'ازدست رفته ProcessEntityID،خود را ActivityDialogHeader.tt بررسی کنید !',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'بدون StartActivityDialog یا StartActivityDialog برای فرآیند \ " %s " پیکربندی شده است!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'نمی تواند درخواست برای فرآیند با ProcessEntityID \ "ایجاد کنید %s "!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'تنظیم نشد ProcessEntityID \ " %s " در TicketID \ " %s "!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'تنظیم نشد ActivityEntityID \ " %s " در TicketID \ " %s "!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'نمی تواند ActivityDialog، TicketID نامعتبر ذخیره شود: %s !',
        'Invalid TicketID: %s!' => 'TicketID نامعتبر: %s !',
        'Missing ActivityEntityID in Ticket %s!' => 'ازدست رفته ActivityEntityID در درخواست %s !',
        'This step does not belong anymore to the current activity in process for ticket \'%s%s%s\'! Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => 'از دست رفته ProcessEntityID دردرخواست %s !',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'می تواند ارزش DynamicField تنظیم نشده برای %s از بلیط با ID \ " %s " در ActivityDialog \ " %s "!',
        'Could not set attachments for ticket with ID %s in activity dialog "%s"!' =>
            '',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'می تواند PendingTime برای بلیط با ID \ "تنظیم نشده %s " در ActivityDialog \ " %s "!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'اشتباه ActivityDialog درست پیکربندی: %s نمی تواند نمایش => 1 نمایش درست / (لطفا تنظیمات آن را تغییر دهید به نمایش => 0 / هنوز درست و یا صفحه نمایش => 2 نشان دادن درست / به عنوان اجباری نشان نمی دهد).',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'تنظیم نشد %s برای بلیط با ID \ " %s " در ActivityDialog \ " %s "!',
        'Default Config for Process::Default%s missing!' => 'پیش فرض پیکربندی برای فرآیند :: پیش فرض %s از دست رفته!',
        'Default Config for Process::Default%s invalid!' => 'پیش فرض پیکربندی برای فرآیند :: پیش فرض %s نامعتبر است!',

        # Perl Module: Kernel/Modules/AgentTicketQueue.pm
        'Available tickets' => 'درخواست موجود',
        'including subqueues' => 'از جمله subqueues',
        'excluding subqueues' => 'به استثنای subqueues',
        'QueueView' => 'نمای صف درخواست',

        # Perl Module: Kernel/Modules/AgentTicketResponsibleView.pm
        'My Responsible Tickets' => 'درخواست‌های وظیفه من',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'last-search' => 'آخرین جستجو',
        'Untitled' => 's',
        'Ticket Number' => 'شماره درخواست',
        'Ticket' => 'درخواست‌ها',
        'printed by' => 'چاپ شده توسط  :',
        'CustomerID (complex search)' => 'CustomerID (جستجوی پیچیده)',
        'CustomerID (exact match)' => 'CustomerID (مطابقت دقیق)',
        'Invalid Users' => 'کاربر نامعتبر',
        'Normal' => 'عادی',
        'CSV' => 'CSV',
        'Excel' => 'اکسل',
        'in more than ...' => 'در بیش از ...',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'ویژگی فعال نیست!',
        'Service View' => 'نمای سرویس',

        # Perl Module: Kernel/Modules/AgentTicketStatusView.pm
        'Status View' => 'نمای وضعیت',

        # Perl Module: Kernel/Modules/AgentTicketWatchView.pm
        'My Watched Tickets' => 'درخواست‌های مشاهده شده من',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'ویژگی غیر فعال است',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'This ticket does not exist, or you don\'t have permissions to access it in its current state.' =>
            '',
        'Missing FormDraftID!' => '',
        'Can\'t get for ArticleID %s!' => ' نمی توانم بگیرم ArticleID از %s !',
        'Article filter settings were saved.' => 'تنظیمات فیلتر مقاله ذخیره شدند.',
        'Event type filter settings were saved.' => 'تنظیمات فیلتر نوع رویداد ذخیره شدند.',
        'Need ArticleID!' => 'نیاز ArticleID!',
        'Invalid ArticleID!' => 'ArticleID نامعتبر است!',
        'Forward article via mail' => 'ارسال نوشته از طریق ایمیل',
        'Forward' => 'ارسال به دیگری',
        'Fields with no group' => 'رشته های بی گروه',
        'Invisible only' => '',
        'Visible only' => '',
        'Visible and invisible' => '',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'مقاله نمی تواند باز شود. شاید آن در صفحه مقاله دیگری است؟',
        'Show one article' => 'نمایش یک مطلب',
        'Show all articles' => 'نمایش تمام مطالب',

        # Perl Module: Kernel/Modules/AjaxAttachment.pm
        'Got no FormID.' => '',
        'Error: the file could not be deleted properly. Please contact your administrator (missing FileID).' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketArticleContent.pm
        'ArticleID is needed!' => '',
        'No TicketID for ArticleID (%s)!' => 'بدون TicketID برای ArticleID ( %s )!',
        'HTML body attachment is missing!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'FileID و ArticleID مورد نیاز است!',
        'No such attachment (%s)!' => 'چنین ضمیمه  ( %s )!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'بررسی SysConfig تنظیم برای %s :: QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'بررسی SysConfig تنظیم برای %s :: TicketTypeDefault.',
        'You don\'t have sufficient permissions for ticket creation in default queue.' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'نیاز CustomerID!',
        'My Tickets' => 'درخواست‌های من',
        'Company Tickets' => 'درخواست‌های سازمانی/شرکتی',
        'Untitled!' => 's',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Customer Realname' => 'نام واقعی مشترک',
        'Created within the last' => 'ایجاد شده در آخرین',
        'Created more than ... ago' => 'ایجاد شده بیشتر از ... قبل',
        'Please remove the following words because they cannot be used for the search:' =>
            'لطفا کلمات زیر را حذف کنید زیرا آنها نمی توانند برای جستجو استفاده  شوند:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'نمی توانید درخواست را بازگشایی کنید، در این صف ممکن نیست !',
        'Create a new ticket!' => 'یک درخواست جدید ایجاد کنید!',

        # Perl Module: Kernel/Modules/Installer.pm
        'SecureMode active!' => 'SecureMode فعال!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'اگر می خواهید دوباره اجرا نصب، غیر فعال کردن SecureMode در SysConfig.',
        'Directory "%s" doesn\'t exist!' => 'راهنمای \ " %s " وجود ندارد!',
        'Configure "Home" in Kernel/Config.pm first!' => 'پیکربندی \ "خانه " در هسته / Config.pm برای اولین بار!',
        'File "%s/Kernel/Config.pm" not found!' => 'فایل \ " %s /Kernel/Config.pm " یافت نشد!',
        'Directory "%s" not found!' => 'راهنمای \ " %s " یافت نشد!',
        'Install Znuny' => 'نصب  Znuny',
        'Intro' => 'معرفی',
        'Kernel/Config.pm isn\'t writable!' => 'هسته / Config.pm قابل نوشتن نیست!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'اگر شما می خواهید به استفاده از نصب، قابل نوشتن هسته / Config.pm برای کاربران وب سرور مجموعه!',
        'Database Selection' => 'انتخاب پایگاه داده',
        'Unknown Check!' => 'بررسی ناشناخته!',
        'The check "%s" doesn\'t exist!' => 'چک \ " %s " وجود ندارد!',
        'Enter the password for the database user.' => 'کلمه عبور برای کاربر پایگاه داده وارد کنید.',
        'Database %s' => 'پایگاه های داده بسیار بزرگ به دست می آید .',
        'Configure MySQL' => '',
        'Enter the password for the administrative database user.' => 'کلمه عبور کاربر مدیر پایگاه داده را وارد کنید.',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => 'نامشخص نوع پایگاه داده \ " %s ".',
        'Please go back.' => 'لطفا برگردید.',
        'Create Database' => 'ایجاد بانک',
        'Install Znuny - Error' => 'نصب Znuny - خطا',
        'File "%s/%s.xml" not found!' => 'فایل \ " %s / %s .XML " یافت نشد!',
        'Contact your Admin!' => 'تماس با مدیریت خود !',
        'System Settings' => 'تنظیمات سیستم',
        'Syslog' => '',
        'Configure Mail' => 'پیکربندی ایمیل',
        'Mail Configuration' => 'پیکربندی پست الکترونیک',
        'Can\'t write Config file!' => 'نمی توانید بنویسید، فایل پیکربندی شده است!',
        'Unknown Subaction %s!' => 'نامشخص Subaction %s !',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'نمی توانید به پایگاه داده متصل شوید، پرل و DBD :: %s نصب نشده است!',
        'Can\'t connect to database, read comment!' => 'نمی توانید به پایگاه داده متصل شوید، به عنوان خواننده نظر!',
        'Database already contains data - it should be empty!' => 'پایگاه داده در حال حاضر حاوی اطاعات است  -باید خالی باشد !',
        'Error: You have the wrong database version installed (%s). You need at least version %s! ' =>
            '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'خطا: لطفا مطمئن شوید که پایگاه داده خود را بسته بر می پذیرد %s MB در اندازه (در حال حاضر تنها بسته می پذیرد تا %s MB). لطفا تنظیمات max_allowed_packet از پایگاه داده خود را به منظور جلوگیری از اشتباهات وفق دهند.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'خطا: لطفا مقدار را برای innodb_log_file_size در پایگاه داده خود را به حداقل مجموعه %s (: در حال حاضر MB %s MB، توصیه می شود: %s MB). برای کسب اطلاعات بیشتر، لطفا یک نگاهی به %s .',
        'Error: Please set the value for innodb_file_per_table on your database to ON.' =>
            '',
        'Error: Please set the value for innodb_default_row_format on your database to dynamic.' =>
            '',
        'Wrong default storage engine (%s is %s, but it needs to be InnoDB).' =>
            '',

        # Perl Module: Kernel/Modules/Mentions.pm
        '%s users will be mentioned' => '',

        # Perl Module: Kernel/Modules/PublicCalendar.pm
        'No %s!' => '',
        'No such user!' => '',
        'Invalid calendar!' => '',
        'Invalid URL!' => '',
        'There was an error exporting the calendar!' => '',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'نیاز بسته بندی پیکربندی :: RepositoryAccessRegExp',
        'Authentication failed from %s!' => 'احراز هویت از %s !',

        # Perl Module: Kernel/Output/HTML/Article/Chat.pm
        'Chat' => 'گپ',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketBounce.pm
        'Bounce Article to a different mail address' => 'برگشت زدن نوشته به یک آدرس ایمیل دیگر ',
        'Bounce' => 'ارجاع',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketCompose.pm
        'Reply All' => 'پاسخ به همه',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketEmailResend.pm
        'Resend this article' => '',
        'Resend' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketMessageLog.pm
        'View message log details for this article' => '',
        'Message Log' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNote.pm
        'Reply to note' => 'به پاسخ توجه داشته باشید',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNoteToLinkedTicket.pm
        'Create notice for linked ticket' => '',
        'Transfer notice' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPhone.pm
        'Split this article' => 'جدا کردن این نوشته',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPlain.pm
        'View the source for this Article' => 'مشاهده منبع برای این مقاله',
        'Plain Format' => 'قالب ساده',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPrint.pm
        'Print this article' => 'چاپ این نوشته ',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkArticleSeenUnseen.pm
        'Mark article as unseen' => '',
        'Mark as unseen' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkAsImportant.pm
        'Mark' => 'علامت دار',
        'Unmark' => 'بدون علامت',

        # Perl Module: Kernel/Output/HTML/ArticleAction/ReinstallPackageLink.pm
        'Re-install Package' => '',
        'Re-install' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Crypted' => 'رمز گذاری شده',
        'Sent message encrypted to recipient!' => '',
        'Signed' => 'امضاء شده',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '\ "PGP امضا پیام " هدر پیدا شده است، اما نامعتبر است!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '\ "S / MIME امضا پیام " هدر پیدا شده است، اما نامعتبر است!',
        'Ticket decrypted before' => 'درخواست رمزگشایی قبل',
        'Impossible to decrypt: private key for email was not found!' => 'غیر ممکن است برای رمزگشایی: کلید خصوصی برای ایمیل یافت نشد!',
        'Successful decryption' => 'رمزگشایی موفق',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Crypt.pm
        'There are no encryption keys available for the addresses: \'%s\'. ' =>
            '',
        'There are no selected encryption keys for the addresses: \'%s\'. ' =>
            '',
        'Cannot use expired encryption keys for the addresses: \'%s\'. ' =>
            '',
        'Cannot use revoked encryption keys for the addresses: \'%s\'. ' =>
            '',
        'Encrypt' => '',
        'Keys/certificates will only be shown for recipients with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            '',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Security.pm
        'Email security' => '',
        'PGP sign' => '',
        'PGP sign and encrypt' => 'ثبت نام PGP و رمزگذاری',
        'PGP encrypt' => '',
        'SMIME sign' => '',
        'SMIME sign and encrypt' => 'نشانه SMIME و رمزگذاری',
        'SMIME encrypt' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Sign.pm
        'Cannot use expired signing key: \'%s\'. ' => '',
        'Cannot use revoked signing key: \'%s\'. ' => '',
        'There are no signing keys available for the addresses \'%s\'.' =>
            '',
        'There are no selected signing keys for the addresses \'%s\'.' =>
            '',
        'Sign' => 'امضاء',
        'Keys/certificates will only be shown for a sender with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Dashboard/AppointmentCalendar.pm
        'Shown' => 'نمایش داده شده',
        'Refresh (minutes)' => '',
        'off' => 'خاموش',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerIDList.pm
        'Shown customer ids' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerUserList.pm
        'Shown customer users' => 'مشتری کاربر نشان داده شده است',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'زمان شروع یک درخواست پس از زمان پایان تنظیم  شده است!',

        # Perl Module: Kernel/Output/HTML/Dashboard/MyLastChangedTickets.pm
        'Shown Tickets' => 'درخواست‌های نمایش داده شده',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'نمی توانید به اتصال %s !',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'Shown Columns' => 'ستون نشان داده شده است',
        'filter not active' => 'فیلتر فعال است',
        'filter active' => 'فیلتر فعال',
        'This ticket has no title or subject' => 'این بلیط هیچ عنوان یا موضوعی ندارد',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketStatsGeneric.pm
        '7 Day Stats' => 'گزارش ۷ روز',

        # Perl Module: Kernel/Output/HTML/Dashboard/UserOnline.pm
        'User is currently offline.' => 'کاربر در حال حاضر آفلاین.',
        'User is currently active.' => 'کاربر در حال حاضر فعال است.',
        'User was inactive for a while.' => 'کاربر غیر فعال در حالی که برای بود.',
        'User set their status to unavailable.' => 'کاربر وضعیت خود را به در دسترس تنظیم شده است.',
        'Away' => 'دور',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'Standard' => 'استاندارد',
        'The following tickets are not updated: %s.' => '',
        'h' => 'h',
        'm' => 'm',
        'd' => 'd',
        'This ticket does not exist, or you don\'t have permissions to access it in its current state. You can take one of the following actions:' =>
            '',
        'This is a' => 'این یک',
        'email' => 'ایمیل',
        'click here' => 'اینجا کلیک کنید',
        'to open it in a new window.' => 'برای باز شدن در پنجره جدید',
        'Year' => 'سال',
        'Hours' => 'ساعت',
        'Minutes' => 'دقیقه',
        'Check to activate this date' => 'بررسی فعال شدن این تاریخ ',
        '%s TB' => '',
        '%s GB' => '',
        '%s MB' => '',
        '%s KB' => '',
        '%s B' => '',
        'No Permission!' => 'دسترسی به این قسمت امکانپذیر نیست!',
        'No Permission' => 'بدون مجوز و اجازه',
        'Show Tree Selection' => ' انتخاب درخت را نشان بده',
        'Split Quote' => 'نقل قول اسپلیت',
        'Remove Quote' => 'حذف نقل قول',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'مرتبط به عنوان',
        'Search Result' => 'نتیجه جستجو',
        'Linked' => 'لینک شده',
        'Bulk' => 'دسته جمعی',

        # Perl Module: Kernel/Output/HTML/Layout/Ticket.pm
        'Lite' => 'اولیه',
        'Unread article(s) available' => 'مطالب خوانده نشده وجود دارد',

        # Perl Module: Kernel/Output/HTML/LinkObject/Appointment.pm
        'Appointment' => '',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'بایگانی جستجو',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOnline.pm
        'Online Agent: %s' => 'کارشناس فعال: %s',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTicketEscalation.pm
        'There are more escalated tickets!' => 'درخواست‌های اولویت داده شده بیشتری وجود دارد',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTimeZoneCheck.pm
        'Please select a time zone in your preferences and confirm it by clicking the save button.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerOnline.pm
        'Online Customer: %s' => 'مشترک فعال: %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'System maintenance is active!' => '',
        'A system maintenance period will start at: %s and is expected to stop at: %s' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/DaemonCheck.pm
        'Znuny Daemon is not running.' => 'سرویس Znuny در حال اجرا نیست.',

        # Perl Module: Kernel/Output/HTML/Notification/OAuth2TokenManagementTokenExpired.pm
        'OAuth2 token for "%s" has expired.' => '',
        'OAuth2 refresh token for "%s" has expired.' => '',

        # Perl Module: Kernel/Output/HTML/Notification/OutofOfficeCheck.pm
        'You have Out of Office enabled, would you like to disable it?' =>
            'شما گزینه خارج از دفتردارید،می خواهید غیرفعالش کنید؟ ',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationInvalidCheck.pm
        'You have %s invalid setting(s) deployed. Click here to show invalid settings.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationIsDirtyCheck.pm
        'You have undeployed settings, would you like to deploy them?' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationOutOfSyncCheck.pm
        'The configuration is being updated, please be patient...' => '',
        'There is an error updating the system configuration!' => '',

        # Perl Module: Kernel/Output/HTML/Notification/UIDCheck.pm
        'Don\'t use the Superuser account to work with %s! Create new Agents and work with these accounts instead.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/AppointmentNotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'لطفا مطمئن شوید که شما حداقل یک روش حمل و نقل برای اطلاعیه اجباری را انتخاب کرده ایم.',
        'Preferences updated successfully!' => 'تنظیمات با موفقیت ثبت شد.!',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(در حال انجام)',

        # Perl Module: Kernel/Output/HTML/Preferences/MaxArticlesPerPage.pm
        'Max. number of articles per page must be between 1 and 1000 or empty.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'لطفا تاریخ پایان است که بعد از تاریخ شروع را مشخص کنید.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Current password' => 'رمز عبور کنونی',
        'New password' => 'رمز عبور جدید',
        'Verify password' => 'تکرار رمز عبور',
        'The current password is not correct. Please try again!' => 'رمز عبور کنونی صحیح نمی‌باشد. لطفا مجددا تلاش نمایید!',
        'Please supply your new password!' => 'لطفا رمز عبور جدید خود را عرضه کنید!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'نمی‌توان کلمه عبور را به روز کرد، رمزهای عبور جدید با هم مطابقت ندارند. لطفا مجددا تلاش نمایید!',
        'This password is forbidden by the current system configuration. Please contact the administrator if you have additional questions.' =>
            '',
        'Can\'t update password, it must be at least %s characters long!' =>
            'نمی‌توان کلمه عبور را به روز کرد، باید حداقل شامل %s کاراکتر باشد!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase letter characters!' =>
            '',
        'Can\'t update password, it must contain at least 1 digit!' => 'نمی‌توان کلمه عبور را به روز کرد، باید شامل حداقل یک عدد باشد!',
        'Can\'t update password, it must contain at least 2 letter characters!' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/TimeZone.pm
        'Time zone updated successfully!' => '',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'invalid' => 'غیر معتبر',
        'valid' => 'معتبر',
        'No (not supported)' => 'هیچ (پشتیبانی نمی شود)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'هیچ گذشته کامل و یا جاری + آینده کامل نسبت ارزش زمانی انتخاب شده است.',
        'The selected time period is larger than the allowed time period.' =>
            'دوره زمانی انتخاب شده بزرگتر از مدت زمان مجاز است.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'هیچ وقت ارزش در مقیاس موجود برای جریان انتخاب زمان ارزش مقیاس در محور X. نیست',
        'The selected date is not valid.' => 'تاریخ انتخاب شده معتبر نمی باشد.',
        'The selected end time is before the start time.' => 'انتخاب پایان زمان پیش از زمان آغاز است.',
        'There is something wrong with your time selection.' => 'مشکلی با انتخاب زمان شما وجود دارد.',
        'Please select only one element or allow modification at stat generation time.' =>
            'لطفا تنها یک عنصر را انتخاب کنید و یا اجازه اصلاح در زمان نسل آماررا بدهید .',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'لطفا حداقل یک مقدار این فیلد را انتخاب کنید و یا اجازه اصلاح در زمان نسل آمار را بدهید.',
        'Please select one element for the X-axis.' => 'لطفا یک عنصر برای محور X را انتخاب کنید.',
        'You can only use one time element for the Y axis.' => 'شما فقط می توانید برای محور Y از یک عنصر زمان استفاده کنید. ',
        'You can only use one or two elements for the Y axis.' => 'شما فقط می توانید یک یا دو عنصر برای محور Y استفاده کنید.',
        'Please select at least one value of this field.' => 'لطفا حداقل یک مقدار این فیلد را انتخاب کنید.',
        'Please provide a value or allow modification at stat generation time.' =>
            'لطفا یک مقدار را فراهم و یا اجازه اصلاح در زمان نسل آمار.',
        'Please select a time scale.' => 'لطفا یک مقیاس زمانی را انتخاب کنید.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'فاصله زمانی گزارش خود را بیش از حد کوچک است، لطفا با استفاده از یک مقیاس زمانی بزرگتر است.',
        'second(s)' => 'ثانیه',
        'quarter(s)' => 'یک چهارم(ها)',
        'half-year(s)' => 'نیمی از سال(ها)',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'لطفا کلمات زیر حذف زیرا آنها می توانند برای محدودیت بلیط مورد استفاده قرار گیرد: %s .',

        # Perl Module: Kernel/Output/HTML/SysConfig.pm
        'Cancel editing and unlock this setting' => '',
        'Reset this setting to its default value.' => '',
        'Unable to load %s!' => '',
        'Content' => 'محتوا',

        # Perl Module: Kernel/Output/HTML/TicketMenu/Lock.pm
        'Unlock to give it back to the queue' => 'ان را برگردان به لیست باز شده . ',
        'Lock it to work on it' => 'قفل آن را بر روی آن کاربگذار ',

        # Perl Module: Kernel/Output/HTML/TicketMenu/TicketWatcher.pm
        'Unwatch' => 'عدم پیگیری',
        'Watch' => 'پیگیری',
        'Add to list of watched tickets' => 'افزودن به فهرست درخواست‌های مشاهده شده',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'مرتب‌سازی بر اساس',

        # Perl Module: Kernel/Output/HTML/TicketZoom/TicketInformation.pm
        'Ticket Information' => 'اطلاعات درخواست',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketLocked.pm
        'Locked Tickets New' => 'درخواست‌های تازه تحویل گرفته شده',
        'Locked Tickets Reminder Reached' => 'درخواست‌های تحویل گرفته شده‌ای که زمان یادآوری آن رسیده',
        'Locked Tickets Total' => 'تمامی درخواست‌های تحویل گرفته شده',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketMention.pm
        'Total mentions' => '',
        'Total new mentions' => '',
        'New mentions' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketOwner.pm
        'Owned Tickets New' => '',
        'Owned Tickets Reminder Reached' => '',
        'Owned Tickets Total' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketResponsible.pm
        'Responsible Tickets New' => 'تمام درخواست‌های جدید من',
        'Responsible Tickets Reminder Reached' => 'درخواست‌های من که زمان یادآوری آن‌ها رسیده',
        'Responsible Tickets Total' => 'تمام درخواست‌های من',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketWatcher.pm
        'Watched Tickets New' => 'درخواست‌های مشاهده شده جدید',
        'Watched Tickets Reminder Reached' => 'درخواست‌های مشاهده شدهکه زمان یادآوری آن رسیده',
        'Watched Tickets Total' => 'تمامی درخواست‌های مشاهده شده',

        # Perl Module: Kernel/Output/PDF/Ticket.pm
        'Ticket Dynamic Fields' => 'درخواست زمینه  پویا',

        # Perl Module: Kernel/System/ACL/DB/ACL.pm
        'Couldn\'t read ACL configuration file. Please make sure the file is valid.' =>
            '',

        # Perl Module: Kernel/System/Auth.pm
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'در حال حاضر بدلیل تعمیر و نگهداری سیستم برنامه ریزی شده، ورود به سایت امکان پذیر نمیباشد.',

        # Perl Module: Kernel/System/AuthSession.pm
        'Session limit reached! Please try again later.' => 'محدودیت در ورود! لطفا بعدا دوباره امتحان کنید.',
        'Session per user limit reached!' => 'جلسه در حد کاربران رسیده!',

        # Perl Module: Kernel/System/AuthSession/DB.pm
        'Session invalid. Please log in again.' => 'جلسه نامعتبر است. لطفا مجددا وارد شوید.',
        'Session has timed out. Please log in again.' => 'مهلت Session شما به اتمام رسید . لطفا مجددا وارد سیستم شوید..',

        # Perl Module: Kernel/System/Calendar/Event/Transport/Email.pm
        'PGP sign only' => 'تنها PGP امضا',
        'PGP encrypt only' => 'رمزگذاری PGP تنها',
        'SMIME sign only' => 'تنها SMIME امضا',
        'SMIME encrypt only' => 'SMIME رمزگذاری تنها',
        'PGP and SMIME not enabled.' => 'PGP و SMIME فعال نیست.',
        'Skip notification delivery' => 'پرش تحویل اعلان',
        'Send unsigned notification' => 'ارسال هشدار از طریق بدون علامت',
        'Send unencrypted notification' => 'ارسال هشدار از طریق تکه تکه کردن',

        # Perl Module: Kernel/System/Calendar/Plugin/Ticket/Create.pm
        'On the date' => '',

        # Perl Module: Kernel/System/CalendarEvents.pm
        'on' => '',
        'of year' => '',
        'of month' => '',
        'all-day' => '',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'گزینه های پیکربندی مرجع',
        'This setting can not be changed.' => 'این تنظیم نمی تواند تغییر کند.',
        'This setting is not active by default.' => 'این تنظیم به طور پیش فرض فعال است.',
        'This setting can not be deactivated.' => 'این تنظیمات نمی تواند غیر فعال  شود.',
        'This setting is not visible.' => '',
        'This setting can be overridden in the user preferences.' => '',
        'This setting can be overridden in the user preferences, but is not active by default.' =>
            '',

        # Perl Module: Kernel/System/CustomerUser.pm
        'Customer user "%s" already exists.' => '',

        # Perl Module: Kernel/System/CustomerUser/DB.pm
        'This email address is already in use for another customer user.' =>
            '',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseDateTime.pm
        'before/after' => 'قبل/بعد',
        'between' => 'بین',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/TextArea.pm
        'This field is required or' => 'این فیلد اجباری یا',
        'The field content is too long!' => 'محتویات این فیلد طولانی است!',
        'Maximum size is %s characters.' => 'حداکثر اندازه %s کاراکتر است.',

        # Perl Module: Kernel/System/MailQueue.pm
        'Error while validating Message data.' => '',
        'Error while validating Sender email address.' => '',
        'Error while validating Recipient email address.' => '',

        # Perl Module: Kernel/System/Mention.pm
        'LastMention' => '',

        # Perl Module: Kernel/System/NotificationEvent.pm
        'Couldn\'t read Notification configuration file. Please make sure the file is valid.' =>
            '',
        'Imported notification has body text with more than 4000 characters.' =>
            '',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'نصب نشده',
        'installed' => 'نصب شده',
        'Unable to parse repository index document.' => 'ناتوانی در تجزیه کردن مستند',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'در این مخزن بسته بندی برای چهارچوب نسخه شما پیدا نشده است ، آن فقط شامل دیگر بسته بندی های چهارچوب نسخه ها میشود . ',
        'File is not installed!' => 'فایل نصب نشده است!',
        'File is different!' => 'فایل متفاوت است!',
        'Can\'t read file!' => 'نمی توانید فایل خوانده شده!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process.pm
        'The process "%s" and all of its data has been imported successfully.' =>
            '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'غیر فعال',
        'FadeAway' => 'ناپدید شدن',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'جمع',
        'week' => 'هفته',
        'quarter' => 'یک چهارم',
        'half-year' => 'نیمی از سال',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'نوع حالت',
        'Created Priority' => 'اولویت ایجاد',
        'Created State' => 'وضعیت ایجاد',
        'Create Time' => 'زمان ایجاد ',
        'Pending until time' => '',
        'Close Time' => 'زمان بسته شدن',
        'Escalation' => 'تشدید',
        'Escalation - First Response Time' => 'تشدید -  زمان اولین پاسخ',
        'Escalation - Update Time' => 'تشدید - به روز رسانی زمان',
        'Escalation - Solution Time' => 'تشدید - راه حل زمان',
        'Agent/Owner' => 'کارشناس/صاحب',
        'Created by Agent/Owner' => 'ایجاد شده توسط کارشناس/صاحب',
        'Assigned to Customer User Login' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'ارزیابی شده به وسیله',
        'Ticket/Article Accounted Time' => 'زمان محاسبه شده برای درخواست/نوشته',
        'Ticket Create Time' => 'زمان ایجاد درخواست',
        'Ticket Close Time' => 'زمان بسته شدن درخواست',
        'Accounted time by Agent' => 'زمان محاسبه شده توسط کارشناس',
        'Total Time' => 'کل زمان‌ها',
        'Ticket Average' => 'میانگین درخواست',
        'Ticket Min Time' => 'حداقل زمان درخواست',
        'Ticket Max Time' => 'حداکثر زمان درخواست',
        'Number of Tickets' => 'تعداد درخواست‌ها',
        'Article Average' => 'میانگین نوشته',
        'Article Min Time' => 'حداقل زمان نوشته',
        'Article Max Time' => 'حداکثر زمان نوشته',
        'Number of Articles' => 'تعداد نوشته‌ها',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'نا محدود',
        'Attributes to be printed' => 'خواصی که قرار است چاپ شوند',
        'Sort sequence' => 'توالی ترتیب',
        'State Historic' => 'تاریخی ایالتی',
        'State Type Historic' => 'نوع تاریخی ایالتی',
        'Historic Time Range' => 'تاریخی محدوده زمانی',
        'Number' => 'عدد',
        'Last Changed' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'راه حل میانگین',
        'Solution Min Time' => 'راه حل حداقل زمان',
        'Solution Max Time' => 'راه حل حداکثر زمان',
        'Solution Average (affected by escalation configuration)' => 'راه حل میانگین (متاثر از پیکربندی تشدید)',
        'Solution Min Time (affected by escalation configuration)' => 'راه حل حداقل زمان (متاثر از پیکربندی تشدید)',
        'Solution Max Time (affected by escalation configuration)' => 'راه حل حداکثر زمان (متاثر از پیکربندی تشدید)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'راه حل زمان کار میانگین (متاثر از پیکربندی تشدید)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'راه حل حداقل زمان کار (متاثر از پیکربندی تشدید)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'راه حل حداکثر زمان کار (متاثر از پیکربندی تشدید)',
        'First Response Average (affected by escalation configuration)' =>
            '',
        'First Response Min Time (affected by escalation configuration)' =>
            '',
        'First Response Max Time (affected by escalation configuration)' =>
            '',
        'First Response Working Time Average (affected by escalation configuration)' =>
            '',
        'First Response Min Working Time (affected by escalation configuration)' =>
            '',
        'First Response Max Working Time (affected by escalation configuration)' =>
            '',
        'Number of Tickets (affected by escalation configuration)' => 'تعداد درخواست (متاثر از پیکربندی تشدید)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'روزها',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/OutdatedTables.pm
        'Outdated Tables' => '',
        'Outdated tables were found in the database. These can be removed if empty.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'حضور جدول',
        'Internal Error: Could not open file.' => 'خطای داخلی: فایل باز نمی شود.',
        'Table Check' => 'جدول بررسی',
        'Internal Error: Could not read file.' => 'خطای داخلی: فایل خوانده نشد.',
        'Tables found which are not present in the database.' => 'استفاده از جدول موجود که در حال حاضر در پایگاه داده است.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'اندازه پایگاه داده',
        'Could not determine database size.' => ' اندازه پایگاه داده مشخص نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'نسخه پایگاه داده',
        'Could not determine database version.' => ' نسخه پایگاه داده مشخص نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'اتصال مشتری نویسهگان',
        'Setting character_set_client needs to be utf8mb4.' => '',
        'Server Database Charset' => 'سرور مجموعه کاراکتر پایگاه',
        'The setting character_set_database needs to be \'utf8mb4\'.' => '',
        'Table Charset' => 'جدول مجموعه کاراکتر',
        'There were non-system tables found which do not have \'utf8mb4\' as charset.' =>
            '',
        'There were tables found which do not have \'utf8mb4\' as charset.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'سازی InnoDB ورود حجم فایل',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'innodb_log_file_size تنظیم باید حداقل 256 مگابایت باشد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InvalidDefaultValues.pm
        'Invalid Default Values' => '',
        'Tables with invalid default values were found. In order to fix it automatically, please run: bin/znuny.Console.pl Maint::Database::Check --repair' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'حداکثر اندازه پرس و جو',
        'The setting \'max_allowed_packet\' must be higher than 64 MB.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'موتور ذخیره سازی پیش فرض',
        'Table Storage Engine' => ' موتور ذخیره سازی جدول',
        'Tables with a different storage engine than the default engine were found.' =>
            'جداول با یک موتور ذخیره سازی متفاوت با موتور به طور پیش فرض پیدا شد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => '5.x خروجی زیر و یا بالاتر مورد نیاز است.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'تنظیم NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG باید تنظیم شود تا al32utf8 (به عنوان مثال GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'تنظیم NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT باید روی ": MI: SS YYYY-MM-DD HH24، تنظیم شده است.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'NLS_DATE_FORMAT تنظیم SQL بررسی',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/PrimaryKeySequencesAndTriggers.pm
        'Primary Key Sequences and Triggers' => '',
        'The following sequences and/or triggers with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'تنظیم client_encoding نیاز به UNICODE یا UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'تنظیم server_encoding نیاز به UNICODE یا UTF8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'فرمت تاریخ',
        'Setting DateStyle needs to be ISO.' => 'تنظیم DateStyle نیاز به ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/PrimaryKeySequences.pm
        'Primary Key Sequences' => '',
        'The following sequences with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 9.2 or higher is required.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionZnuny.pm
        'Operating System' => 'سیستم عامل',
        'Znuny Disk Partition' => 'پارتیشن Znuny دیسک',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'کاربرد دیسک',
        'The partition where Znuny is located is almost full.' => 'پارتیشن که در آن واقع شده است Znuny تقریبا کامل است.',
        'The partition where Znuny is located has no disk space problems.' =>
            'پارتیشن که در آن واقع شده است Znuny هیچ مشکلی روی هارد دیسک ندارد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'دیسک پارتیشن طریقه استفاده',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'توزیع می کند.',
        'Could not determine distribution.' => 'نمی تواند توزیع مشخص کند.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'نسخه اصلی',
        'Could not determine kernel version.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'بارگزاری سیستم',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'بار سیستم باید در حداکثر تعداد CPU سیستم (به عنوان مثال یک بار از 8 یا کمتر در یک سیستم با پردازنده 8 خوب است) باشد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'ماژول پرل',
        'Not all required Perl modules are correctly installed.' => 'همه ماژول های مورد نیاز پرل به درستی نصب نشده است.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModulesAudit.pm
        'Perl Modules Audit' => '',
        'CPAN::Audit reported that one or more installed Perl modules have known vulnerabilities. Please note that there might be false positives for distributions patching Perl modules without changing their version number.' =>
            '',
        'CPAN::Audit did not report any known vulnerabilities in the installed Perl modules.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlVersion.pm
        'Perl Version' => 'پرل نسخه',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'فضای swap خالی (٪)',
        'No swap enabled.' => ' مبادله را فعال نکنید.',
        'Used Swap Space (MB)' => 'فضای مبادله استفاده شده (MB)',
        'There should be more than 60% free swap space.' => 'باید بیش از 60٪ فضای swap رایگان وجود داشته باشد.',
        'There should be no more than 200 MB swap space used.' => 'باید فضای swap بیش از 200 MB مورد استفاده وجود داشته باشد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'وب Server',
        'Loaded Apache Modules' => 'لود ماژول های آپاچی',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'مدل MPM',
        'Znuny requires apache to be run with the \'prefork\' MPM model.' =>
            'Znuny به Apache به با "prefork را مدل MPM اجرا می شود.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'CGI استفاده از شتاب دهنده ',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'شما باید FastCGI یا mod_perl وجود استفاده برای افزایش کارایی خود را.',
        'mod_deflate Usage' => 'طریقه استفاده mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'لطفا  mod_deflate به منظور بهبود سرعت رابط کاربری گرافیکی نصب کنید.',
        'mod_filter Usage' => 'طریقه استفاده mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'لطفا mod_filter نصب کنید اگر mod_deflate استفاده شده است.',
        'mod_headers Usage' => 'mod_headers طریقه استفاده',
        'Please install mod_headers to improve GUI speed.' => 'لطفا mod_headers نصب کنید به منظور بهبود سرعت رابط کاربری گرافیکی.',
        'Apache::Reload Usage' => 'آپاچی :: بارگزادی مجدد طریقه استفاده',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'آپاچی :: بارگذاری مجدد یا apache2 را :: بازنگری باید به عنوان PerlModule و PerlInitHandler برای جلوگیری از راه اندازی مجدد وب سرور در هنگام نصب و ارتقاء ماژول استفاده می شود.',
        'Apache2::DBI Usage' => 'apache2 را :: DBI طریقه استفاده',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'apache2 را :: DBI برای به دست آوردن عملکرد بهتر با قابلیت اتصال به پایگاه داده از پیش تعیین شده باید استفاده شود.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'متغیرهای محیطی',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'پشتیبانی جمع آوری داده ها',
        'Support data could not be collected from the web server.' => 'داده ها پشتیبانی می تواند از وب سرور نمی تواند جمع آوری شده.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => ' نسخه وب سرور',
        'Could not determine webserver version.' => ' نسخه وب سرور مشخص نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticleSearchIndexStatus.pm
        'Znuny' => '',
        'Article Search Index Status' => '',
        'Indexed Articles' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticlesPerCommunicationChannel.pm
        'Articles Per Communication Channel' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLog.pm
        'Incoming communications' => '',
        'Outgoing communications' => '',
        'Failed communications' => '',
        'Average processing time of communications (s)' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLogAccountStatus.pm
        'Communication Log Account Status (last 24 hours)' => '',
        'No connections found.' => '',
        'ok' => '',
        'permanent connection errors' => '',
        'intermittent connection errors' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ConfigSettings.pm
        'Config Settings' => 'تنظیمات پیکربندی',
        'Could not determine value.' => 'نمی تواند ارزش را تعیین  کند.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DaemonRunning.pm
        'Daemon' => 'سرویس',
        'Daemon is running.' => 'شبح در حال اجرا است.',
        'Daemon is not running.' => 'سرویس در حال اجرا نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DatabaseRecords.pm
        'Database Records' => 'سوابق پایگاه داده',
        'Tickets' => 'درخواست‌ها',
        'Ticket History Entries' => 'درخواست تاریخچه مطالب',
        'Articles' => 'مقالات',
        'Attachments (DB, Without HTML)' => 'فایل های پیوست (DB، بدون HTML)',
        'Customers With At Least One Ticket' => 'مشتریان با حداقل یک درخواست',
        'Dynamic Field Values' => 'مقادیر فیلد پویا',
        'Invalid Dynamic Fields' => ' زمینه های پویا نامعتبر',
        'Invalid Dynamic Field Values' => 'ارزش فیلد پویا نامعتبر',
        'GenericInterface Webservices' => 'GenericInterface webservices های',
        'Process Tickets' => 'بلیط روند',
        'Months Between First And Last Ticket' => 'ماهها از اولین تا  آخرین درخواست',
        'Tickets Per Month (avg)' => 'درخواست در هر ماه (AVG)',
        'Open Tickets' => 'درخواست باز',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'به طور پیش فرض SOAP نام کاربری و رمز',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'خطر امنیتی:  با استفاده از تنظیمات پیش فرض برای SOAP :: کاربر و SOAP :: رمز عبور. لطفا آن را تغییر دهید.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultUser.pm
        'Default Admin Password' => 'به طور پیش فرض کلمه عبور کاربر admin',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'خطر امنیتی: حساب عامل ریشه @ localhost را هنوز رمز عبور به طور پیش فرض. لطفا آن را تغییر دهید و یا از درجه اعتبار ساقط حساب.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/EmailQueue.pm
        'Email Sending Queue' => '',
        'Emails queued for sending' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FQDN.pm
        'FQDN (domain name)' => 'FQDN (نام دامنه)',
        'Please configure your FQDN setting.' => 'لطفا تنظیمات FQDN خود را پیکربندی کنید.',
        'Domain Name' => 'نام دامنه',
        'Your FQDN setting is invalid.' => 'تنظیم FQDN شما نامعتبر است.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FileSystemWritable.pm
        'File System Writable' => 'سیستم فایل قابل نوشتن',
        'The file system on your Znuny partition is not writable.' => 'سیستم فایل در پارتیشن Znuny  قابل نوشتن نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/LegacyConfigBackups.pm
        'Legacy Configuration Backups' => '',
        'No legacy configuration backup files found.' => '',
        'Legacy configuration backup files found in Kernel/Config/Backups folder, but they might still be required by some packages.' =>
            '',
        'Legacy configuration backup files are no longer needed for the installed packages, please remove them from Kernel/Config/Backups folder.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/MultipleJSFileLoad.pm
        'The following JavaScript files loaded multiple times:' => '',
        'Files' => '',
        'Views with multiple loaded JavaScript files' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageDeployment.pm
        'Package Installation Status' => 'وضعیت بسته نصب و راه اندازی',
        'Some packages have locally modified files.' => 'برخی از بسته های به صورت محلی فایل ها اصلاح شده.',
        'Some packages are not correctly installed.' => 'برخی از بسته ها به درستی نصب نشده است.',
        'Package Framework Version Status' => 'بسته بندی Framework نسخه وضعیت',
        'Some packages are not allowed for the current framework version.' =>
            'برخی از بسته های برای نسخه چارچوب فعلی مجاز نیست.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageList.pm
        'Package List' => 'فهرست پکیج ها',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SessionConfigSettings.pm
        'Session Config Settings' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SpoolMails.pm
        'Spooled Emails' => 'ایمیل Spooled',
        'There are emails in var/spool that Znuny could not process.' => 'هستند ایمیل در مسیر var / قرقره که Znuny نمی تواند فرآیند وجود دارد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'تنظیم سیستم شما نامعتبر است، آن تنها باید شامل ارقام باشد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/DefaultType.pm
        'Default Ticket Type' => 'به طور پیش فرض نوع درخواست',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'پیکربندی پیش فرض نوع درخواست نامعتبر است و یا از دست رفته است. لطفا تنظیمات درخواست:: نوع :: پیش فرض را تغییر دهید و یک نوع درخواست معتبر را انتخاب کنید.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/IndexModule.pm
        'Ticket Index Module' => 'درخواست شاخص ماژول',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'شما باید بیش از 60،000درخواست از باطن StaticDB استفاده کنید. کتابچه راهنمای کاربر مدیر (تنظیم عملکرد)  را برای اطلاعات بیشتر ببینید.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'کاربران نامعتبر با درخواست قفل شده',
        'There are invalid users with locked tickets.' => 'کاربران نامعتبر با درخواست قفل شده وجود دارد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/OpenTickets.pm
        'You should not have more than 8,000 open tickets in your system.' =>
            'نباید بیش از 8000 درخواست باز در سیستم شما وجود داشته باشد.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'درخواست جستجوی شاخص ماژول',
        'The indexing process forces the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'سوابق یتیم در جدول ticket_lock_index',
        'Table ticket_lock_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'ticket_lock_index جدول شامل سوابق یتیم. لطفا اجرا بن / znuny.Console.pl \ "سیستم maint :: بلیط :: QueueIndexCleanup " برای تمیز کردن شاخص StaticDB.',
        'Orphaned Records In ticket_index Table' => 'سوابق یتیم در جدول ticket_index',
        'Table ticket_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/TimeSettings.pm
        'Time Settings' => 'تنظیمات زمان',
        'Server time zone' => 'منطقه زمانی سرور',
        'Znuny time zone' => '',
        'Znuny time zone is not set.' => '',
        'User default time zone' => '',
        'User default time zone is not set.' => '',
        'Calendar time zone is not set.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentSkinUsage.pm
        'UI - Agent Skin Usage' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentThemeUsage.pm
        'UI - Agent Theme Usage' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/SpecialStats.pm
        'UI - Special Statistics' => '',
        'Agents using custom main menu ordering' => '',
        'Agents using favourites for the admin overview' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Version.pm
        'Znuny Version' => 'Znuny نسخه',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/Znuny/ConcurrentUsers.pm
        'Concurrent Users Details' => 'کاربران همزمان اطلاعات',
        'Concurrent Users' => 'کاربران موازی',

        # Perl Module: Kernel/System/SysConfig.pm
        'Setting %s does not exists!' => '',
        'Setting %s is not locked to this user!' => '',
        'Setting value is not valid!' => '',
        'Could not add modified setting!' => '',
        'Could not update modified setting!' => '',
        'Setting could not be unlocked!' => '',
        'Missing key %s!' => '',
        'Invalid setting: %s' => '',
        'Could not combine settings values into a perl hash.' => '',
        'Can not lock the deployment for UserID \'%s\'!' => '',
        'All Settings' => '',

        # Perl Module: Kernel/System/SysConfig/BaseValueType.pm
        'Default' => 'پیش فرض',
        'Value is not correct! Please, consider updating this field.' => '',
        'Value doesn\'t satisfy regex (%s).' => '',

        # Perl Module: Kernel/System/SysConfig/ValueType/Checkbox.pm
        'Enabled' => '',
        'Disabled' => '',

        # Perl Module: Kernel/System/SysConfig/ValueType/Date.pm
        'System was not able to calculate user Date in OTRSTimeZone!' => '',

        # Perl Module: Kernel/System/SysConfig/ValueType/DateTime.pm
        'System was not able to calculate user DateTime in OTRSTimeZone!' =>
            '',

        # Perl Module: Kernel/System/SysConfig/ValueType/FrontendNavigation.pm
        'Value is not correct! Please, consider updating this module.' =>
            '',

        # Perl Module: Kernel/System/SysConfig/ValueType/VacationDays.pm
        'Value is not correct! Please, consider updating this setting.' =>
            '',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'تنظیم مجدد از زمان باز کردن.',

        # Perl Module: Kernel/System/Ticket/Article/Backend/Chat.pm
        'Chat Participant' => '',
        'Chat Message Text' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Login failed! Your user name or password was entered incorrectly.' =>
            'ورود ناموفق! نام کاربری یا کلمه عبور وارد شده اشتباه می‌باشد.',
        'Authentication succeeded, but no user data record is found in the database. Please contact the administrator.' =>
            '',
        'Can`t remove SessionID.' => 'نمیتواند SESSIONID را حذف کنید.',
        'Logout successful.' => 'خروج موفقیت آمیز.',
        'Feature not active!' => 'این ویژگی فعال نیست.',
        'Sent password reset instructions. Please check your email.' => 'دستورالعمل تنظیم مجدد کلمه عبور ارسال شد. لطفا ایمیل خود را چک نمایید.',
        'Invalid Token!' => 'کد بازیابی معتبر نیست',
        'Sent new password to %s. Please check your email.' => 'کلمه عبور جدید به %s ارسال شد. لطفا ایمیل خود را چک نمایید.',
        'Error: invalid session.' => '',
        'No Permission to use this frontend module!' => 'بدون اجازه به استفاده از این ماژول ظاهر!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            'احراز هویت موفق شد، اما هیچ سابقه مشتری در باطن مشتری پیدا شده است. لطفا با مدیر تماس بگیرید.',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'تنظیم مجدد کلمه ناموفق است. لطفا با مدیر تماس بگیرید.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'این آدرس ایمیل در حال حاضر وجود دارد. لطفا وارد شوید و یارمز عبور خود را بازیابی کنید.',
        'This email address is not allowed to register. Please contact support staff.' =>
            'این آدرس ایمیل مجاز به ثبت نام نیست . لطفا با کارکنان پشتیبانی تماس بگیرید.',
        'Added via Customer Panel (%s)' => 'اضافه شده از طریق پنل مشتری ( %s )',
        'Customer user can\'t be added!' => 'کاربران مشتری نمی توانند اضافه شود!',
        'Can\'t send account info!' => 'نمی توانید اطلاعات حساب را ارسال کنید!',
        'New account created. Sent login information to %s. Please check your email.' =>
            'حساب کاربری جدید ساخته شد. اطلاعات ورود به %s ارسال شد. لطفا ایمیل خود را چک نمایید. ',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'Action "%s" not found!' => 'اقدام \ " %s " یافت نشد!',

        # XML Definition: Kernel/Config/Files/XML/Calendar.xml
        'Frontend module registration for the public interface.' => '',
        'Frontend module registration for the agent interface.' => 'ظاهر ثبت نام ماژول برای رابط عامل.',
        'Loader module registration for the agent interface.' => '',
        'Main menu item registration.' => '',
        'Admin area navigation for the agent interface.' => '',
        'Maximum number of active calendars in overview screens. Please note that large number of active calendars can have a performance impact on your server by making too much simultaneous calls.' =>
            '',
        'List of colors in hexadecimal RGB which will be available for selection during calendar creation. Make sure the colors are dark enough so white text can be overlayed on them.' =>
            '',
        'Defines available groups for the appointment calendar screen.' =>
            '',
        'Defines the ticket plugin for calendar appointments.' => '',
        'Links appointments and tickets with a "Normal" type link.' => '',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'تعریف عملیات که در آن یک دکمه تنظیمات در دسترس است در اشیاء مرتبط ویجت (LinkObject :: ViewMode = \ "پیچیده "). لطفا توجه داشته باشید که این اقدامات باید در بر داشت زیر JS و CSS فایل های ثبت نام کرده اند: Core.AllocationList.css، Core.UI.AllocationList.js، Core.UI.Table.Sort.js، Core.Agent.TableFilters.js.',
        'Define which columns are shown in the linked appointment widget (LinkObject::ViewMode = "complex"). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            '',
        'Znuny doesn\'t support recurring Appointments without end date or number of iterations. During import process, it might happen that ICS file contains such Appointments. Instead, system creates all Appointments in the past, plus Appointments for the next N months (120 months/10 years by default).' =>
            '',
        'Defines the ticket appointment type backend for ticket escalation time.' =>
            '',
        'Defines the ticket appointment type backend for ticket pending time.' =>
            '',
        'Defines the ticket appointment type backend for ticket dynamic field date time.' =>
            '',
        'Defines the list of params that can be passed to ticket search function.' =>
            '',
        'Defines the event object types that will be handled via AdminAppointmentNotificationEvent.' =>
            '',
        'List of all calendar events to be displayed in the GUI.' => '',
        'List of all appointment events to be displayed in the GUI.' => '',
        'Appointment calendar event module that prepares notification entries for appointments.' =>
            '',
        'Uses richtext for viewing and editing ticket notification.' => 'استفاده از richtext برای اطلاع رسانی مشاهده و ویرایش درخواست',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'پهنای برای غنی جزء ویرایشگر متن برای این صفحه نمایش. تعداد (پیکسل) یا ارزش درصد (نسبی) را وارد کنید.',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'تعریف می کند که ارتفاع برای غنی جزء ویرایشگر متن برای این صفحه نمایش. تعداد (پیکسل) یا ارزش درصد (نسبی) را وارد کنید.',
        'Transport selection for appointment notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'تعریف تعداد کاراکتر در هر خط مورد استفاده در مورد یک HTML جایگزینی پیش نمایش مقاله در TemplateGenerator برای EventNotifications.',
        'Defines all the parameters for this notification transport.' => 'تعریف می کند همه پارامترها را برای این حمل و نقل اطلاع رسانی.',
        'Appointment calendar event module that updates the ticket with data from ticket appointment.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Shows a link in the menu for creating a calendar appointment linked to the ticket directly from the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Defines an icon with link to the google map page of the current location in appointment edit screen.' =>
            '',
        'Triggers add or update of automatic calendar appointments based on certain ticket times.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Daemon.xml
        'Defines the module to display a notification in the agent interface if the Znuny Daemon is not running.' =>
            'تعریف می کند که ماژول برای نمایش اطلاع رسانی در رابط عامل اگر Znuny شبح حال اجرا نیست.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'لیستی از فایل های CSS برای همیشه برای رابط عامل بارگذاری می شود.',
        'List of JS files to always be loaded for the agent interface.' =>
            'لیستی از فایل های JS برای همیشه برای رابط عامل بارگذاری می شود.',
        'Type of daemon log rotation to use: Choose \'OTRS\' to let Znuny system to handle the file rotation, or choose \'External\' to use a 3rd party rotation mechanism (i.e. logrotate). Note: External rotation mechanism requires its own and independent configuration.' =>
            '',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if &lt;$OTRSHome&gt;/var/run/ can not be used.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => 'تعریف تعداد روز برای حفظ فایل ورود به سیستم شبح.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'اگر فعال شبح را به خروجی استاندارد را به یک فایل ورود به سیستم تغییر مسیر.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'اگر فعال شبح را به جریان خطای استاندارد را به یک فایل ورود به سیستم تغییر مسیر.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            'ثبت نام شبح برای زمانبندی عمومی عامل مدیر وظیفه.',
        'The daemon registration for the scheduler cron task manager.' =>
            'ثبت نام شبح برای مدیریت زمانبندی کار cron  است.',
        'The daemon registration for the scheduler future task manager.' =>
            'ثبت نام شبح برای زمانبندی مدیر وظیفه آینده است.',
        'The daemon registration for the scheduler task worker.' => 'ثبت نام شبح برای کارگر وظیفه زمانبند.',
        'The daemon registration for the system configuration deployment sync manager.' =>
            '',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'تعریف حداکثر تعداد از وظایف را به عنوان همان زمان اجرا شود.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            ' آدرس ایمیل برای دریافت پیام های اطلاع رسانی از وظایف زمانبندی را مشخص میکند.',
        'Defines the maximum number of affected tickets per job.' => 'تعریف می کند که حداکثر تعداد درخواست های آسیب دیده در هر کاررا اعلام کنید.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'تعریف یک زمان خواب در میکروثانیه بین درخواست در حالی که آنها توسط یک کار پردازش شده است.',
        'Delete expired cache from core modules.' => 'حذف کش منقضی شده از ماژول های هسته ای است.',
        'Delete expired upload cache hourly.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => 'حذف منقضی شده هفتگی کش لودر (صبح یکشنبه).',
        'Fetch emails via fetchmail.' => 'واکشی ایمیل از طریق fetchmail مشاهده کنید.',
        'Fetch emails via fetchmail (using SSL).' => 'واکشی ایمیل از طریق کامند fetchmail (با استفاده از SSL).',
        'Generate dashboard statistics.' => 'تولید آمار داشبورد.',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'باعث حوادث تشدید بلیط و رویدادهای هشدار برای تشدید.',
        'Process pending tickets.' => 'پردازش درخواست در انتظار.',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            'پردازش مجدد ایمیل از دایرکتوری قرقره است که نمی تواند در وهله اول وارد شود.',
        'Fetch incoming emails from configured mail accounts.' => 'واکشی ایمیل های دریافتی از حساب های ایمیل پیکربندی شده است.',
        'Rebuild the ticket index for AgentTicketQueue.' => 'بازسازی شاخص بلیط برای AgentTicketQueue.',
        'Delete expired sessions.' => 'حذف جلسات منقضی شده است.',
        'Unlock tickets that are past their unlock timeout.' => 'باز کردن درخواست که گذشته ای برای باز کردن خود هستند.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be enabled in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Checks for articles that needs to be updated in the article search index.' =>
            '',
        'Checks for queued outgoing emails to be sent.' => '',
        'Checks for communication log entries to be deleted.' => '',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'اجرای یک دستور سفارشی و یا ماژول. توجه: اگر ماژول استفاده می شود، تابع مورد نیاز است.',
        'Run file based generic agent jobs (Note: module name needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Collect support data for asynchronous plug-in modules.' => 'جمع آوری داده ها پشتیبانی از پلاگین در ماژول ناهمزمان.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'تعریف می کند که به طور پیش فرض تعدادی از ثانیه (از زمان فعلی) به دوباره برنامه یک رابط شکست خورده کار عمومی است.',
        'Removes old system configuration deployments (Sunday mornings).' =>
            '',
        'Removes old ticket number counters (each 10 minutes).' => '',
        'Removes old generic interface debug log entries created before the specified amount of days.' =>
            '',
        'Delete expired ticket draft entries.' => '',

        # XML Definition: Kernel/Config/Files/XML/Framework.xml
        'Disables the web installer (http://yourhost.example.com/znuny/installer.pl), to prevent the system from being hijacked. If not enabled, the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If enabled, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => 'فعال یا غیر فعال کردن حالت اشکال زدایی بیش از رابط ظاهر.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            'ارائه اطلاعات اشکال زدایی گسترده در ظاهر در مورد هر گونه خطا AJAX رخ می دهد، اگر فعال باشد.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'فعال یا غیر فعال کش برای قالب. هشدار: الگو ذخیره غیر فعال کردن نیست برای محیط های تولید برای آن یک قطره عملکرد عظیم می شود! این تنظیم فقط باید برای اشکال زدایی دلایل غیر فعال است!',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'سطح پیکربندی مدیر تنظیم می کند. بسته به سطح پیکربندی، برخی از گزینه های sysconfig نشان داده نخواهد کرد. سطوح config هستند در به ترتیب صعودی: کارشناس، پیشرفته، مبتدی. سطح پیکربندی بالاتر است (به عنوان مثال مبتدی بالاترین است)، به احتمال زیاد کمتر از آن است که کاربر به طور تصادفی می تواند پیکربندی سیستم در یک راه آن است که قابل استفاده نمی شود.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'کنترل اگر مدیر مجاز به واردات یک پیکربندی سیستم ذخیره شده در SysConfig. است',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'تعریف می کند که نام برنامه، نشان داده شده در رابط وب، زبانه ها و نوار عنوان مرورگر وب.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of Znuny).' =>
            'تعریف می کند شناسه سیستم. هر عدد بلیط و جلسه HTTP رشته شامل این ID. این تضمین می کند که تنها بلیط که متعلق به سیستم شما خواهد شد به شرح زیر یو پی اس (در هنگام برقراری ارتباط بین دو نمونه از Znuny مفید) پردازش شده است.',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'تعریف می کند که نام مناسب دامنه از سیستم. این تنظیم به عنوان یک متغیر، OTRS_CONFIG_FQDN است که در تمام اشکال پیام استفاده شده توسط برنامه، برای ساخت لینک به بلیط در سیستم شما یافت استفاده می شود.',
        'Defines the fully qualified domain name for external IDs generation (i.e. Message-ID, ContentID).' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            'تعریف می کند نام میزبان HTTP برای جمع آوری داده ها پشتیبانی با ماژول عمومی PublicSupportDataCollector، (به عنوان مثال استفاده از Znuny شبح).',
        'Defines the timeout (in seconds, minimum is 20 seconds) for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'تعریف می کند نوع پروتکل مورد استفاده توسط وب سرور، برای خدمت به نرم افزار است. اگر پروتکل HTTPS به جای HTTP ساده استفاده می شود، در اینجا باید مشخص شود. از آنجا که این هیچ در تنظیمات و یا رفتار وب سرور تاثیر می گذارد، آن را به روش دسترسی به برنامه را تغییر دهید، و اگر آن اشتباه است، آن را به شما از ورود به نرم افزار جلوگیری نمی کند. این تنظیم فقط به عنوان یک متغیر، OTRS_CONFIG_HttpType است که در تمام اشکال پیام استفاده شده توسط برنامه پیدا شده است استفاده می شود، برای ساخت لینک به بلیط در سیستم خود را.',
        'Whether to force redirect all requests from http to https protocol. Please check that your web server is configured correctly for https protocol before enable this option.' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'پیشوند به پوشه Scripts بر روی سرور، به عنوان بر روی وب سرور پیکربندی تنظیم می کند. این تنظیم به عنوان یک متغیر، OTRS_CONFIG_ScriptAlias ​​است که در تمام اشکال پیام استفاده شده توسط برنامه پیدا شده است استفاده می شود، برای ساخت لینک به بلیط در سیستم.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'تعریف می کند آدرس ایمیل مدیر سیستم است. از آن خواهد شد در صفحه نمایش خطا از نرم افزار نمایش داده شود.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'نام شرکت می باشد که در ایمیل های ارسالی به عنوان یک X-سربرگ شامل خواهد شد.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'زبان پیش فرض جلویی تعریف می کند. همه مقادیر ممکن توسط فایل های زبان موجود بر روی سیستم (تنظیمات بعدی را ببینید) تعیین می شود.',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'تعریف می کند تمام زبان هایی که در دسترس  برنامه می باشد. تنها نام انگلیسی از زبان را در اینجا مشخص کنید.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'تعریف می کند تمام زبان های که در دسترس  برنامه می باشد. تنها نام بومی زبان را در اینجا مشخص کنید.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.znuny.org/manual/developer/.' =>
            'تعریف می کند که تم پیش فرض جلویی (HTML) به توسط عوامل و مشتریان استفاده می شود. اگر دوست دارید، شما می توانید موضوع خود را اضافه کنید. لطفا کتابچه راهنمای کاربر مدیر واقع در https://doc.znuny.org/manual/developer/ مراجعه کنید.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'ممکن است که به پیکربندی تم های مختلف، به عنوان مثال برای تمایز بین عوامل و مشتریان، به بر اساس هر دامنه در داخل نرم افزار استفاده می شود. با استفاده از یک عبارت منظم (عبارت منظم)، شما می توانید یک جفت محتوا / کلیدی برای مطابقت با یک دامنه پیکربندی کنید. ارزش در \ "کلید " باید دامنه مطابقت، و ارزش در \ "محتوا " باید یک موضوع معتبر بر روی سیستم شما می شود. لطفا برای فرم مناسب از عبارت منظم مشاهده نوشته های مثال.',
        'The headline shown in the customer interface.' => 'تیتر نشان داده شده در رابط مشتری.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'آرم نشان داده شده است در هدر رابط مشتری. URL به تصویر می تواند یک آدرس نسبی به دایرکتوری تصویر پوست، و یا یک URL کامل به یک وب سرور از راه دور.',
        'The shortcut icon for the customer interface.' => '',
        'The shortcut icon for the customer interface for the skin "default".' =>
            '',
        'The Apple touch icon for the customer interface.' => '',
        'The Apple touch icon for the customer interface for skin "default".' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'آرم نشان داده شده است در هدر رابط عامل. URL به تصویر می تواند یک آدرس نسبی به دایرکتوری تصویر پوست، و یا یک URL کامل به یک وب سرور از راه دور.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'آرم نشان داده شده در هدر از رابط عامل برای پوست \ "به طور پیش فرض ". \ "AgentLogo " برای توضیحات بیشتر را مشاهده کنید.',
        'The logo shown on top of the login box of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The shortcut icon for the agent interface.' => '',
        'The shortcut icon for the agent interface fot the skin "default".' =>
            '',
        'The Apple touch icon for the agent interface.' => '',
        'The Apple touch icon for the agent interface for the skin "default".' =>
            '',
        'Defines the URL base path of icons, CSS and Java Script.' => 'تعریف می کند که URL مسیر پایه از آیکون ها، CSS و جاوا اسکریپت.',
        'Defines the URL image path of icons for navigation.' => 'تعریف می کند که URL مسیر تصویر از آیکون برای ناوبری.',
        'Defines the URL CSS path.' => 'تعریف می کند که مسیر URL CSS.',
        'Defines the URL java script path.' => 'تعریف می کند که مسیر URL جاوا اسکریپت.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'استفاده از richtext برای مشاهده و ویرایش: مقالات، درود، امضا، قالب استاندارد، پاسخ خودکار و اطلاعیه ها.',
        'Defines the URL rich text editor path.' => 'تعریف می کند URL غنی مسیر ویرایشگر متن.',
        'Defines the default CSS used in rich text editors.' => 'تعریف می کند که CSS به طور پیش فرض مورد استفاده در ویرایشگرهای متن غنی است.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'تعریف می کند اگر حالت پیشرفته استفاده شود (را قادر می سازد استفاده از جدول، جایگزین، زیرنویس، بالانویس، چسباندن از Word، و غیره).',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'تعریف می کند اگر حالت پیشرفته استفاده شود (را قادر می سازد استفاده از جدول، جایگزین، زیرنویس، بالانویس، چسباندن از Word، و غیره) در رابط مشتری می باشد.',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'پهنای برای غنی جزء ویرایشگر متن. تعداد (پیکسل) یا ارزش درصد (نسبی) را وارد کنید.',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'تعریف می کند که ارتفاع برای غنی جزء ویرایشگر متن. تعداد (پیکسل) یا ارزش درصد (نسبی) را وارد کنید.',
        'Defines the selectable font sizes in the rich text editor.' => '',
        'Defines the selectable fonts in the rich text editor.' => '',
        'Defines the selectable format tags in the rich text editor.' => '',
        'Defines additional plugins for use in the rich text editor.' => '',
        'Defines extra content that is allowed for use in the rich text editor.' =>
            '',
        'Global settings for all popup profiles.' => '',
        'Disable autocomplete in the login screen.' => '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow Znuny to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'غیر فعال کردن HTTP هدر \ "X-قاب گزینه ها: SAMEORIGIN " اجازه می دهد Znuny به عنوان یک iframe در وب سایت های دیگر گنجانده شده است. غیر فعال کردن این هدر HTTP می تواند یک مسئله امنیتی! فقط آن را غیر فعال کنید، اگر شما می دانید آنچه شما انجام می دهند!',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'غیر فعال کردن HTTP هدر "Content-Security-Policy" اجازه می دهد تا بارگذاری محتویات اسکریپت های خارجی. غیر فعال کردن این هدر HTTP می تواند یک مسئله امنیتی! فقط آن را غیر فعال کنید، اگر شما می دانید آنچه شما انجام می دهند!',
        'Automated line break in text messages after x number of chars.' =>
            'خط خودکار در پیام های متنی از تعداد X از کاراکتر.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'مجموعه تعدادی از خطوط که در پیام های متنی (به عنوان مثال خطوط بلیط در QueueZoom) نمایش داده شود.',
        'Limits the number of options for modernized selection fields. If this limit will be exceeded, the selection field will for performance reasons be shown as non-modernized.' =>
            '',
        'Turns on drag and drop for the main navigation.' => 'روشن کشیدن و رها کردن برای ناوبری اصلی.',
        'Defines the date input format used in forms (option or input fields).' =>
            'تعریف فرمت تاریخ ورودی مورد استفاده در اشکال (گزینه و یا ورودی زمینه).',
        'Defines the available steps in time selections. Select "Minute" to be able to select all minutes of one hour from 1-59. Select "30 Minutes" to only make full and half hours available.' =>
            '',
        'Shows time in long format (days, hours, minutes), if enabled; or in short format (days, hours), if not enabled.' =>
            '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'اجازه می دهد تا انتخاب بین نشان دادن فایل پیوست یک بلیط در مرورگر (خطی) یا فقط آنها را دانلود (فایل پیوست) است.',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'باعث می شود نرم افزار چک رکورد MX از آدرس های ایمیل قبل از ارسال ایمیل و یا ارسال یک تلفن و یا ایمیل بلیط.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'تعریف می کند که آدرس یک سرور DNS اختصاص داده شده، در صورت لزوم، برای \ "CheckMXRecord " نگاه یو پی اس.',
        'Sets the timeout (in seconds) for DNS resolver queries.' => '',
        'Makes the application check the syntax of email addresses.' => 'باعث می شود نرم افزار چک نحو آدرس ایمیل.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'تعریف یک عبارت منظم که در آنها از برخی از آدرس های از کنترل و بررسی گرامر (در صورت \ "CheckEmailAddresses " قرار است به \ "بله "). لطفا یک عبارت منظم در این زمینه برای آدرس ایمیل، که از لحاظ دستوری معتبر نیست وارد کنید، اما برای سیستم (یعنی \ "ریشه @ localhost را ") لازم است.',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'تعریف یک عبارت منظم است که فیلتر تمام آدرس های ایمیل  نباید در برنامه استفاده  شود.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'تعیین راه اشیاء مرتبط در هر ماسک زوم نمایش داده شود.',
        'Determines if a button to delete a link should be displayed next to each link in each zoom mask.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'تعریف می کند نوع لینک \'عادی\'. اگر نام منبع و نام هدف حاوی همان مقدار از لینک در نتیجه غیر جهت است؛ در غیر این صورت، در نتیجه یک لینک جهت است.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'تعریف می کند نوع لینک "ParentChild. اگر نام منبع و نام هدف حاوی همان مقدار از لینک در نتیجه غیر جهت است؛ در غیر این صورت، در نتیجه یک لینک جهت است.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'تعریف می کند که گروه های نوع لینک. انواع لینک از همان گروه دیگری را لغو نمایید. مثال: اگر بلیط در هر یک لینک \'عادی\' با بلیط B مرتبط است، پس از آن این بلیط را می توان علاوه بر این با لینک رابطه یک ParentChild، مرتبط است.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'تعریف می کند ماژول ورود به سیستم برای سیستم. \ "فایل " می نویسد: تمام پیام ها در یک فایل تاریخچه ثبت داده می شود، \ "syslog را " با استفاده از شبح syslog را از سیستم، به عنوان مثال و syslogd.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'اگر \ "syslog را " برای LogModule انتخاب شد، یک مرکز ورود به سیستم خاص می تواند مشخص شود.',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'اگر \ "syslog را " برای LogModule انتخاب شد، مجموعه کاراکتر است که باید برای ورود به سیستم استفاده می شود می تواند مشخص شود.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'اگر \ "فایل " برای LogModule انتخاب شد، یک فایل تاریخچه ثبت باید مشخص شود. اگر فایل وجود ندارد، از آن خواهد شد توسط سیستم ایجاد شده است.',
        'Adds a suffix with the actual year and month to the Znuny log file. A logfile for every month will be created.' =>
            'پسوند سال و ماه به فایل ثبت وقایع می‌افزاید. برای هر ماه یک فایل ساخته خواهد شد.',
        'Set the minimum log level. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages. The order of log levels is: \'debug\', \'info\', \'notice\' and \'error\'.' =>
            '',
        'Defines the module to send emails. "DoNotSendEmail" doesn\'t send emails at all. Any of the "SMTP" mechanisms use a specified (external) mailserver. "Sendmail" directly uses the sendmail binary of your operating system. "Test" doesn\'t send emails, but writes them to $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/ for testing purposes.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'اگر هر یک از \ "SMTP " مکانیزم به عنوان SendmailModule از mailhost می فرستد که از ایمیل باید مشخص شود انتخاب شد.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'اگر هر یک از \ "SMTP " مکانیزم به عنوان SendmailModule انتخاب شد، بندر که در آن mailserver ای خود را برای اتصالات ورودی گوش دادن باید مشخص شود.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'اگر هر یک از \ "SMTP " مکانیزم به عنوان SendmailModule انتخاب شد، احراز هویت به میل سرور مورد نیاز است، یک نام کاربری باید مشخص شود.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'اگر هر یک از \ "SMTP " مکانیزم به عنوان SendmailModule انتخاب شد، احراز هویت به میل سرور مورد نیاز است، یک رمز عبور باید مشخص شود.',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'می فرستد تمام ایمیل های خروجی از طریق BCC به آدرس مشخص شده. لطفا این تنها به دلایل پشتیبان استفاده کنید.',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'اگر تعیین شود، این آدرس به عنوان فرستنده پاکت در پیام های خروجی استفاده می شود (اطلاعیه - پایین را ببینید). اگر هیچ آدرس مشخص شده باشد، فرستنده پاکت برابر به صف آدرس ایمیل است.',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            'اگر تعیین شود، این آدرس به عنوان هدر فرستنده پاکت در اطلاعیه های خروجی استفاده می شود. اگر هیچ آدرس مشخص شده باشد، هدر فرستنده پاکت خالی است (مگر اینکه SendmailNotificationEnvelopeFrom :: FallbackToEmailFrom تنظیم شده است).',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            'اگر هیچ SendmailNotificationEnvelopeFrom مشخص شده باشد، این تنظیم را ممکن می سازد به استفاده از ایمیل از جای آدرس فرستنده پاکت خالی (مورد نیاز در برخی از تنظیمات سرور ایمیل).',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'را پشتیبانی می کند نیروهای ایمیل های ارسالی (7bit | 8bit های | نقل قابل چاپ | از base64).',
        'Defines default headers for outgoing emails.' => '',
        'Registers a log module, that can be used to log communication related information.' =>
            '',
        'Defines the number of hours a successful communication will be stored.' =>
            '',
        'Defines the number of hours a communication will be stored, whichever its status.' =>
            '',
        'MailQueue configuration settings.' => '',
        'Define which avatar engine should be used for the agent avatar on the header and the sender images in AgentTicketZoom. If \'None\' is selected, initials will be displayed instead. Please note that selecting anything other than \'None\' will transfer the encrypted email address of the particular user to an external service.' =>
            '',
        'Define which avatar default image should be used for the current agent if no gravatar is assigned to the mail address of the agent. Check https://gravatar.com/site/implement/images/ for further information.' =>
            '',
        'Define which avatar default image should be used for the article view if no gravatar is assigned to the mail address. Check https://gravatar.com/site/implement/images/ for further information.' =>
            '',
        'Defines an alternate URL, where the login link refers to.' => 'یک Anchor را معرفی URL متناوب، که در آن لینک ورود به سیستم اشاره به.',
        'Defines an alternate URL, where the logout link refers to.' => 'یک Anchor را معرفی URL متناوب، که در آن لینک خروج از سیستم اشاره به.',
        'Defines a useful module to load specific user options or to display news.' =>
            'تعریف یک ماژول مفید برای بارگذاری گزینه های کاربر خاص و یا برای نمایش اخبار.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'تعریف می کند که کلید با هسته :: :: ماژول AgentInfo بررسی می شود. اگر این تنظیمات کلید کاربر درست است، این پیام است که توسط سیستم پذیرفته شده است.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'فایل است که در کرنل :: ماژول :: AgentInfo نمایش داده، اگر در هسته / خروجی / HTML / قالب / استاندارد / AgentInfo.tt واقع شده است.',
        'Defines the module to generate code for periodic page reloads.' =>
            'تعریف می کند که ماژول تولید کد برای بارگذاری مجدد صفحه تناوبی است.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'ماژول برای نمایش اطلاع رسانی در رابط عامل، در صورتی که سیستم توسط کاربر مدیریت استفاده را تعریف می کند (به طور معمول شما باید به عنوان مدیر کار نمی کند).',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'ماژول است که همه به در حال حاضر در عوامل در رابط عامل وارد تعریف می کند.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'ماژول است که همه به در حال حاضر در مشتریان در رابط عامل وارد تعریف می کند.',
        'Defines the module to display a notification in the agent interface, if there are modified sysconfig settings that are not deployed yet.' =>
            '',
        'Defines the module to display a notification in the agent interface, if there are invalid sysconfig settings deployed.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'تعریف می کند که ماژول برای نمایش اطلاع رسانی در رابط عامل، اگر عامل در حالی که داشتن خارج از دفتر فعال وارد سایت شوید.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'تعریف می کند که ماژول برای نمایش اطلاع رسانی در رابط عامل، اگر عامل در حالی که داشتن تعمیر و نگهداری سیستم فعال وارد سایت شوید.',
        'Defines the module to display a notification in the agent interface if the system configuration is out of sync.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent has not yet selected a time zone.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'تعریف می کند که نشان می دهد یک ماژول است که اطلاع رسانی عمومی در رابط عامل. در هر دو صورت \ "متن " - در صورت پیکربندی - و یا محتویات \ "فایل " نمایش داده خواهد شد.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'تعریف می کند ماژول استفاده می شود برای ذخیره داده ها جلسه. با \ "DB " سرور ظاهر می توانید از سرور دسیبل برابر خرد. \ "FS " سریع تر است.',
        'Defines the name of the session key. E.g. Session, SessionID or Znuny.' =>
            'تعریف می کند که نام کلید جلسه. به عنوان مثال جلسه، SESSIONID یا Znuny.',
        'Defines the name of the key for customer sessions.' => 'تعریف می کند که نام کلید برای جلسات مشتری می باشد.',
        'Turns on the remote ip address check. It should not be enabled if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'حذف یک جلسه اگر شناسه جلسه با یک آدرس IP از راه دور نامعتبر استفاده می شود.',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'تعریف می کند که حداکثر زمان معتبر (در ثانیه) برای یک ID را وارد نمایید.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            'مجموعه زمان عدم فعالیت (در ثانیه) به تصویب قبل از یک جلسه کشته و یک کاربر وارد شده است است.',
        'Deletes requested sessions if they have timed out.' => 'حذف جلسات درخواست اگر آنها به پایان رسیده است.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'باعث می شود مدیریت جلسه کوکی استفاده از HTML. اگر کوکی ها اچ غیر فعال و یا اگر کوکی ها مرورگر HTML غیر فعال است مشتری، سپس سیستم به طور معمول کار خواهد کرد و اضافه ID جلسه به لینک ها',
        'Stores cookies after the browser has been closed.' => 'فروشگاه کوکی ها پس از مرورگر بسته شده است.',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see https://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            '',
        'Sets the maximum number of active agents within the timespan defined in SessionMaxIdleTime.' =>
            '',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionMaxIdleTime.' =>
            '',
        'Sets the maximum number of active customers within the timespan defined in SessionMaxIdleTime.' =>
            '',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionMaxIdleTime.' =>
            '',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'اگر \ "FS " برای SessionModule انتخاب شد، یک دایرکتوری که در آن داده جلسه ذخیره خواهد شد باید مشخص شود.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'اگر \ "DB " برای SessionModule انتخاب شد، یک جدول در پایگاه داده که در آن جلسه داده ذخیره می شود باید مشخص شود.',
        'Defines the period of time (in minutes) before agent is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            '',
        'Defines the period of time (in minutes) before customer is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            '',
        'This setting is deprecated. Set OTRSTimeZone instead.' => '',
        'Sets the time zone being used internally by Znuny to e. g. store dates and times in the database. WARNING: This setting must not be changed once set and tickets or any other data containing date/time have been created.' =>
            '',
        'Sets the time zone that will be assigned to newly created users and will be used for users that haven\'t yet set a time zone. This is the time zone being used as default to convert date and time between the Znuny time zone and the user\'s time zone.' =>
            '',
        'If enabled, users that haven\'t selected a time zone yet will be notified to do so. Note: Notification will not be shown if (1) user has not yet selected a time zone and (2) OTRSTimeZone and UserDefaultTimeZone do match and (3) are not set to UTC.' =>
            '',
        'Maximum Number of a calendar shown in a dropdown.' => 'حداکثر تعداد یک تقویم نشان داده شده در منوی کرکره ای.',
        'Define the start day of the week for the date picker.' => 'تعریف روز شروع هفته برای جمع کننده اطلاعات.',
        'Adds the permanent vacation days.' => '',
        'Adds the one time vacation days.' => '',
        'Defines the hours and week days to count the working time.' => 'تعریف می کند که ساعت و روز هفته برای شمارش زمان کار است.',
        'Defines the name of the indicated calendar.' => 'تعریف می کند که نام تقویم نشان داد.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'تعریف می کند که منطقه زمانی از تقویم نشان داد، که می تواند بعدا به صف خاص اختصاص داده شود.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'تعریف روز شروع هفته را برای جمع کننده اطلاعات تقویم نشان داد.',
        'Adds the permanent vacation days for the indicated calendar.' =>
            '',
        'Adds the one time vacation days for the indicated calendar.' => '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'تعریف می کند که ساعت و روز هفته  برای شمارش زمان کاردر تقویم نشان داده میشود.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your Znuny instance to stop working (probably any mask which takes input from the user).' =>
            'تعریف می کند به اندازه حداکثر (در بایت) برای ارسال فایل از طریق مرورگر. هشدار: تنظیم این گزینه بر یک ارزش است که خیلی کم می تواند از ماسک های بسیاری در مثال Znuny شما می شود برای جلوگیری از کار (احتمالا هر ماسک که طول می کشد ورودی از کاربر).',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'ماژول که مسئولیت رسیدگی به ارسال از طریق رابط وب انتخاب می کند. \ "DB " فروشگاه های ارسال همه در پایگاه داده، \ "FS " با استفاده از سیستم فایل.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'متنی که باید در پرونده ثبت نظر برسد به معنی ورود اسکریپت CGI مشخص .',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'تعریف می کند که فیلتر است که پردازش متن در مقالات، به منظور برجسته آدرس ها.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'ویژگی رمز عبور فراموش شده را برای کارشناسان فعال می‌کند.',
        'Shows the message of the day on login screen of the agent interface.' =>
            'پیام روز در صفحه ورود به رابط عامل نشان می دهد.',
        'Runs the system in "Demo" mode. If enabled, agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'اجازه می دهد تا مدیران به عنوان کاربران دیگر وارد شوند، از طریق پانل کاربران دولت.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'اجازه می دهد تا مدیران به عنوان مشتریان دیگر وارد شوند، از طریق استفاده از پنل مدیریت کاربران مشتری .',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'گروه که در آن کاربر به مجوز نیاز دارد RW به طوری که او می تواند \ "SwitchToCustomer " از ویژگی های دسترسی مشخص می کند.',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'ایست (در ثانیه) برای دریافت HTTP / FTP تنظیم می کند.',
        'Defines the connections for http/ftp, via a proxy.' => 'تعریف می کند که ارتباطات به HTTP / FTP، از طریق یک پروکسی است.',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'خاموش می شود اعتبار گواهی SSL، برای مثال اگر شما استفاده از یک پروکسی HTTPS شفاف است. با پذیرش خطر عواقب آن استفاده کنید!',
        'Enables file upload in the package manager frontend.' => 'آپلود فایل در ظاهر مدیر بسته را قادر می سازد.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'تعریف می کند محل برای دریافت لیست مخزن آنلاین برای بسته های اضافی. اولین نتیجه در دسترس استفاده خواهد شد.',
        'List of online package repositories.' => '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'تعریف می کند بیان IP به طور منظم برای دسترسی به مخزن محلی. شما نیاز به فعال کردن دسترسی به این دارند به مخزن محلی خود و بسته :: RepositoryList در میزبان راه دور مورد نیاز است.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'ایست (در ثانیه) برای دریافت بسته را تنظیم میکند. رونویسی \ "WebUserAgent :: اتمام مهلت ".',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'بازخوانی بسته از طریق پروکسی. رونویسی \ "WebUserAgent :: پروکسی ".',
        'If this setting is enabled, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'Package event module file a scheduler task for update registration.' =>
            'بسته ماژول رویداد پرونده وظیفه زمانبند برای ثبت نام به روز رسانی.',
        'List of all Package events to be displayed in the GUI.' => 'فهرست از تمام وقایع بسته بندی در رابط کاربری گرافیکی نمایش داده می شود.',
        'List of all DynamicField events to be displayed in the GUI.' => 'فهرست از تمام وقایع DynamicField در رابط کاربری گرافیکی نمایش داده می شود.',
        'List of all LinkObject events to be displayed in the GUI.' => '',
        'DynamicField object registration.' => 'DynamicField ثبت نام شی.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'تعریف می کند که نام کاربری برای دسترسی به دسته SOAP (بن / cgi-bin در / rpc.pl). میباشد',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'تعریف می کند که رمز عبور برای دسترسی به دسته SOAP (بن / cgi-bin در / rpc.pl). کدام است',
        'Enable keep-alive connection header for SOAP responses.' => 'فعال کردن هدر ارتباط زنده نگه داشتن برای پاسخ SOAP.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png).' =>
            '',
        'Size of the logo in the page header.' => '',
        'Defines the standard size of PDF pages.' => ' اندازه استاندارد برای صفحات PDF. تعریف می کند ',
        'Defines the maximum number of pages per PDF file.' => 'تعریف می کند که حداکثر تعداد صفحه درهر فایل PDF. چه مقدار است',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به فونت متناسب در اسناد PDF. را دارد',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به فونت متناسب با حروف درشت در اسناد PDF. را دارد',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به فونت متناسب با حالت های italic در اسناد PDF. را دارد',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به جسورانه فونت متناسب با حالت های italic در اسناد PDF.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به قلم تکفاصله در اسناد PDF. را دارد',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به قلم تکفاصله جسورانه در اسناد PDF.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به قلم تکفاصله کج در اسناد PDF. را دارد',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'تعریف می کند که مسیر و TTF-فایل که مسئولیت رسیدگی به جسورانه قلم تکفاصله کج در اسناد PDF.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the Znuny user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'پشتیبانی PGP را قادر می سازد. زمانی که حمایت PGP برای امضای و رمزنگاری ایمیل فعال، آن را بسیار توصیه می شود که وب سرور به عنوان کاربر Znuny اجرا می شود. در غیر این صورت، وجود خواهد داشت مشکلات با امتیازات زمانی که دسترسی به .gnupg پوشه.',
        'Defines the path to PGP binary.' => 'تعریف می کند که مسیر به باینری PGP.',
        'Sets the options for PGP binary.' => 'مجموعه گزینه برای باینری PGP.',
        'Sets the preferred digest to be used for PGP binary.' => '',
        'Sets the password for private PGP key.' => 'رمز عبور برای کلید PGP خصوصی تنظیم می کند.',
        'Enable this if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Configure your own log text for PGP.' => 'پیکربندی متن ورود به سیستم خود  برای PGP.',
        'Sets the method PGP will use to sing and encrypt emails. Note Inline method is not compatible with RichText messages.' =>
            '',
        'Enables S/MIME support.' => 'پشتیبانی از S / MIME را قادر می سازد.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'تعریف می کند که مسیر برای باز کردن باینری SSL. این ممکن است یک پاکت HOME نیاز ($ ENV {HOME} = \'/ var / معاونت / wwwrun\'؛).',
        'Specifies the directory where SSL certificates are stored.' => 'دایرکتوری که در آن گواهینامه های SSL ذخیره می شود را مشخص میکند.',
        'Specifies the directory where private SSL certificates are stored.' =>
            ' دایرکتوری که در آن گواهینامه های SSL خصوصی ذخیره شده است را مشخص میکند.',
        'Cache time in seconds for the SSL certificate attributes.' => 'زمان کش در ثانیه برای ویژگی گواهینامه SSL.',
        'Enables fetch S/MIME from CustomerUser backend support.' => 'را قادر می سازد واکشی S / MIME از پشتیبانی باطن CustomerUser.',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com).' =>
            'نامی است که باید توسط نرم افزار در هنگام ارسال اطلاعیه استفاده می شود مشخص می کند. نام فرستنده استفاده می شود برای ساخت نام صفحه نمایش کامل برای کارشناسی ارشد اطلاع رسانی (یعنی \ "Znuny اطلاعیه " znuny@your.example.com).',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'آدرس ایمیل که باید توسط نرم افزار در هنگام ارسال اطلاعیه استفاده می شود مشخص می کند. آدرس ایمیل استفاده می شود برای ساخت نام صفحه نمایش کامل برای کارشناسی ارشد اطلاع رسانی (یعنی \ "Znuny اطلاعیه " znuny@your.example.com). شما می توانید متغیر OTRS_CONFIG_FQDN به عنوان مجموعه ای در configuation خود استفاده کنید، یا آدرس ایمیل دیگر را انتخاب کنید.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'تعریف می کند این موضوع برای ایمیل های آگاه سازی فرستاده شده به عوامل، با رمز در مورد کلمه عبور جدید درخواست شده است.',
        'Defines the body text for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'تعریف می کند این موضوع برای ایمیل های آگاه سازی فرستاده شده به عوامل، در مورد رمز عبور جدید.',
        'Defines the body text for notification mails sent to agents, about new password.' =>
            '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'مجوز دسترس استاندارد برای عوامل داخل نرم افزار. اگر مجوزهای بیشتری مورد نیاز است، می توان آنها را در اینجا وارد شده است. مجوز باید تعریف شود، موثر باشد. برخی از مجوز خوب دیگر نیز ارائه ساخته شده در: توجه داشته باشید، نزدیک، در انتظار، مشتری، گه از FREETEXT، حرکت، آهنگسازی، مسئول، به جلو، و گزاف گویی. مطمئن شوید که \ "RW " همیشه آخرین اجازه ثبت شده است.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'تعریف می کند که مجوز استاندارد برای مشتریان داخل نرم افزار. اگر مجوزهای بیشتری مورد نیاز است، شما می توانید آنها را در اینجا وارد کنید. مجوز باید سخت کدگذاری موثر باشد. لطفا اطمینان حاصل شود، در هنگام اضافه کردن هر یک از مجوز مزبور، که \ "RW " اجازه آخرین ورود باقی مانده است.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'این تنظیم امکان را به نادیده گرفتن ساخته شده است در لیست کشور با لیست خود را از کشور است. این امر به ویژه مفید است اگر شما فقط می خواهید به استفاده از یک گروه را انتخاب کنید کوچکی از کشورها.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'ورود به سیستم عملکرد را قادر می سازد (برای ورود به صفحه زمان پاسخ). این عملکرد سیستم تاثیر می گذارد. ظاهر :: ماژول ### AdminPerformanceLog باید فعال باشد.',
        'Specifies the path of the file for the performance log.' => 'مسیر فایل را برای ورود به سیستم عملکرد مشخص می کند.',
        'Defines the maximum size (in MB) of the log file.' => 'تعریف می کند که حداکثر اندازه (در MB) از فایل وارد شوید.',
        'Defines the two-factor module to authenticate agents.' => 'تعریف می کند ماژول دو عامل به اعتبار عوامل.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'تعریف می کند کلید تنظیمات عامل که در آن کلید رمز مشترک ذخیره شده است.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'تعریف می کند اگر عوامل باید مجاز به ورود در صورتی که هیچ راز به اشتراک گذاشته شده ذخیره شده در تنظیمات خود را و در نتیجه با استفاده از احراز هویت دو عامل است.',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'تعریف می کند در صورتی که رمز قبلا معتبر باید برای احراز هویت پذیرفته شده است. این است که کمی کمتر امن اما کاربران می دهد 30 ثانیه به زمان بیشتری برای وارد کنید رمز عبور یک بار خود را.',
        'Defines the name of the table where the user preferences are stored.' =>
            'تعریف می کند که نام جدول که در آن تنظیمات کاربر ذخیره می شود.',
        'Defines the column to store the keys for the preferences table.' =>
            'تعریف می کند که ستون برای ذخیره کلید برای جدول تنظیمات است.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'تعریف می کند که نام ستون برای ذخیره داده ها در جدول تنظیمات.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'تعریف می کند که نام ستون برای ذخیره شناسه کاربر در جدول تنظیمات.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the users avatar. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => 'تعریف می کند که شناسه کاربر برای پنل مشتری می باشد.',
        'Activates support for customer and customer user groups.' => '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer user for these groups).' =>
            '',
        'Defines the groups every customer will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer for these groups).' =>
            '',
        'Defines a permission context for customer to group assignment.' =>
            '',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'تعریف می کند ماژول که نشان می دهد در حال حاضر در عوامل در رابط مشتری وارد سایت شوید.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'تعریف می کند ماژول که نشان می دهد در حال حاضر در مشتریان در رابط مشتری وارد سایت شوید.',
        'Defines the module to display a notification in the customer interface, if the customer is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the customer interface, if the customer user has not yet selected a time zone.' =>
            '',
        'Defines an alternate login URL for the customer panel..' => 'یک Anchor را معرفی URL لاگین دیگر را برای پنل مشتری ..',
        'Defines an alternate logout URL for the customer panel.' => 'یک Anchor را معرفی URL خروج از سیستم جایگزین برای پنل مشتری می باشد.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'یک Anchor را معرفی مشتری، که تولید یک آیکون نقشه های گوگل در پایان یک بلوک اطلاعات مشتری.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'یک Anchor را معرفی مشتری، که تولید یک آیکون گوگل در پایان یک بلوک اطلاعات مشتری.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'یک Anchor را معرفی مشتری، که تولید یک آیکون مربوط در پایان یک بلوک اطلاعات مشتری.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'یک Anchor را معرفی مشتری، که تولید یک آیکون زینگ در پایان یک بلوک اطلاعات مشتری.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'این ماژول و عملکرد PreRun () آن اجرا خواهد شد، اگر تعریف شده است، برای هر درخواست. این ماژول مفید است که برای بررسی برخی از گزینه های کاربران و یا برای نمایش اخبار در مورد برنامه های جدید.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'تعریف می کند که کلید را چک کنید با CustomerAccept. اگر این تنظیمات کلید کاربر درست است، پس از آن پیام است که توسط سیستم پذیرفته شده است.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'تعریف می کند که مسیر فایل اطلاعات نشان داده شده است،  در زیر هسته / خروجی / HTML / قالب / استاندارد / CustomerAccept.tt واقع شده است.',
        'Activates lost password feature for customers.' => 'ویژگی رمز عبور فراموش شده را برای مشترکین فعال می‌کند.',
        'Enables customers to create their own accounts.' => 'مشتریان را برای ایجاد حساب خود قادر می سازد .',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'اگر فعال، یکی از عبارات منظم برای مطابقت آدرس ایمیل کاربر اجازه می دهد تا ثبت نام.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'اگر فعال، هیچ یک از عبارات منظم ممکن است آدرس ایمیل کاربر اجازه می دهد تا ثبت نام مطابقت.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'تعریف می کند این موضوع برای ایمیل های آگاه سازی فرستاده شده به مشتریان، با رمز در مورد کلمه عبور جدید درخواست شده است.',
        'Defines the body text for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'تعریف می کند این موضوع برای ایمیل های آگاه سازی فرستاده شده به مشتریان، در مورد رمز عبور جدید.',
        'Defines the body text for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'تعریف می کند این موضوع برای ایمیل های آگاه سازی فرستاده شده به مشتریان، در مورد حساب کاربری جدید.',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'تعریف می کند که متن برای ایمیل اطلاع رسانی ارسال شده به مشتریان، در مورد حساب کاربری جدید.',
        'Defines the module to authenticate customers.' => 'تعریف می کند که ماژول برای تأیید هویت مشتریان است.',
        'If "DB" was selected for Customer::AuthModule, the encryption type of passwords must be specified.' =>
            '',
        'If "bcrypt" was selected for CryptType, use cost specified here for bcrypt hashing. Currently max. supported cost value is 31.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، نام جدول که در آن داده های مشتری خود باید ذخیره شود باید مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، نام ستون برای CustomerKey در جدول مشتری باید مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، نام ستون برای CustomerPassword در جدول مشتری باید مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، DSN برای اتصال به جدول مشتری باید مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، یک نام کاربری برای اتصال به جدول مشتری می تواند مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، یک رمز عبور برای اتصال به جدول مشتری می تواند مشخص شود.',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'اگر \ "DB " برای مشتریان :: AuthModule انتخاب شد، یک راننده پایگاه داده (به طور معمول خودکار استفاده می شود) می تواند مشخص شود.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'اگر \ "HTTPBasicAuth " برای ضوابط انتخاب شد :: AuthModule، شما می توانید مشخص به نوار قطعات منجر از نام کاربر (به عنوان مثال برای دامنه های مانند example_domain \ کاربر به کاربر).',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'اگر \ "HTTPBasicAuth " برای ضوابط انتخاب شد :: AuthModule، شما می توانید (با استفاده از یک استقبال میکنم) به نوار قطعات از REMOTE_USER (به عنوان مثال برای به حذف دامنه انتهایی) را مشخص کنید. استقبال میکنم-توجه داشته باشید، $ 1 خواهد بود که کاربری جدید ورود.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد، میزبان LDAP را می توان مشخص کرد.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد، BaseDN باید مشخص شود.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد، شناسه کاربر باید مشخص شود.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use Znuny. Specify the group, who may access the system.' =>
            'اگر \ "LDAP " برای ضوابط Authmodule انتخاب شد ::، شما می توانید در صورتی که کاربر مجاز به تصدیق چرا که او در یک posixGroup است، به عنوان مثال کاربر نیاز به در یک XYZ گروه به استفاده از Znuny شود تیک بزنید. مشخص گروه، که ممکن است سیستم دسترسی داشته باشید.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'اگر \ "LDAP " برای ضوابط AuthModule انتخاب شد ::.، شما می توانید ویژگی های دسترسی، اینجا را مشخص کنید.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد، ویژگی های کاربر می تواند مشخص شود. برای posixGroups LDAP استفاده UID، برای posixGroups غیر LDAP استفاده DN کاربر کامل.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد و کاربران شما تنها دسترسی ناشناس به درخت LDAP، اما شما می خواهید از طریق داده های جستجو، شما می توانید این کار را با کاربران که دسترسی به دایرکتوری LDAP است را انجام دهد. نام کاربری برای این کاربر خاص در اینجا مشخص کنید.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد و کاربران شما تنها دسترسی ناشناس به درخت LDAP، اما شما می خواهید از طریق داده های جستجو، شما می توانید این کار را با کاربران که دسترسی به دایرکتوری LDAP است را انجام دهد. مشخص رمز عبور برای این کاربر خاص است.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'اگر \ "LDAP " انتخاب شد، شما می توانید یک فیلتر برای هر پرس و جو LDAP، به عنوان مثال (ایمیل = *)، (objectclass = کاربر) و یا (! objectclass = کامپیوتر) اضافه کنید.',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد و اگر شما می خواهید برای اضافه کردن یک پسوند به هر نام کاربری مشتری، آن را specifiy در اینجا، به عنوان مثال شما فقط می خواهم به ارسال کاربران نام کاربری اما در دایرکتوری LDAP شما وجود دارد کاربران @ دامنه.',
        'If "LDAP" was selected for Customer::AuthModule and special parameters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد و پارامتر های ویژه ای را برای شبکه :: LDAP ماژول پرل مورد نیاز، شما می توانید آنها را در اینجا مشخص کنید. \ "خالص perldoc :: LDAP " برای اطلاعات بیشتر در مورد پارامترها را ببینید.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'اگر \ "LDAP " برای مشتریان :: AuthModule انتخاب شد، شما می توانید مشخص کنید اگر برنامه های کاربردی متوقف خواهد شد اگر به عنوان مثال یک اتصال به یک سرور می تواند به دلیل مشکلات شبکه ایجاد شود.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'اگر \ "شعاع " برای مشتریان :: AuthModule انتخاب شد، میزبان شعاع باید مشخص شود.',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'اگر \ "شعاع " برای مشتریان :: AuthModule انتخاب شد، رمز عبور برای احراز هویت به میزبان شعاع باید مشخص شود.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'اگر \ "شعاع " برای مشتریان :: AuthModule انتخاب شد، شما می توانید مشخص کنید اگر برنامه های کاربردی متوقف خواهد شد اگر به عنوان مثال یک اتصال به یک سرور می تواند به دلیل مشکلات شبکه ایجاد شود.',
        'Defines the two-factor module to authenticate customers.' => 'تعریف می کند ماژول دو عامل به اعتبار مشتریان.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'تعریف می کند کلید ترجیحات مشتری که در آن کلید رمز مشترک ذخیره شده است.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'تعریف می کند اگر مشتریان باید مجاز به ورود در صورتی که هیچ راز به اشتراک گذاشته شده ذخیره شده در تنظیمات خود را و در نتیجه با استفاده از احراز هویت دو عامل است.',
        'Defines the parameters for the customer preferences table.' => 'تعریف می کند که پارامترهای جدول ترجیحات مشتری.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'تعریف می کند تمام پارامترهای را برای این آیتم در تنظیمات مشتری. "PasswordRegExp اجازه می دهد تا برای مطابقت با کلمه عبور در مقابل یک عبارت منظم. تعریف حداقل تعداد کاراکتر با استفاده از \'PasswordMinSize. تعریف اگر حداقل 2 حروف کوچک و 2 نامه حروف بزرگ با تنظیم گزینه مناسب به \'1\' مورد نیاز است. تعریف: PasswordMin2Characters اگر رمز عبور نیاز به حداقل 2 نویسه (مجموعه را به 0 یا 1). "PasswordNeedDigit \'کنترل نیاز به حداقل 1 رقمی (مجموعه ای به 0 یا 1 به کنترل).',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'تعریف می کند که پارامترهای پیکربندی از این آیتم، به  نظردر تنظیمات نشان داده میشود.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'تعریف می کند تمام پارامترهای را برای این آیتم در تنظیمات مشتری.',
        'Parameters for the pages (in which the communication log entries are shown) of the communication log overview.' =>
            '',
        'Search backend router.' => 'جستجو  باطن روتر.',
        'JavaScript function for the search frontend.' => 'جاوا اسکریپت تابع برای ظاهر جستجو.',
        'Main menu registration.' => 'ثبت نام منوی اصلی.',
        'Parameters for the dashboard backend of the customer company information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer user information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Search backend default router.' => 'جستجو باطن روتر به طور پیش فرض.',
        'Defines available groups for the admin overview screen.' => '',
        'Frontend module registration (show personal favorites as sub navigation items of \'Admin\').' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'ثبت نام ماژول ظاهر (لینک شرکت غیر فعال کردن اگر هیچ ویژگی شرکت استفاده می شود).',
        'Frontend module registration for the customer interface.' => 'ظاهر ثبت نام ماژول برای رابط مشتری.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'پوسته‌های ظاهری را در سیستم فعال می‌کند. مقدار ۱ یعنی فعال و مقدار ۰ یعنی غیرفعال.',
        'Defines the default value for the action parameter.' => '',
        'Defines the shown links in the footer area of the customer and public interface of this Znuny system. The value in "Key" is the external URL, the value in "Content" is the shown label.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'مقدار پیش فرض برای پارامتر عمل برای ظاهر عمومی است. پارامتر عمل در اسکریپت از سیستم استفاده می شود.',
        'Sets the stats hook.' => 'مجموعه آمار قلاب.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'شروع تعداد آمار شمارش. هر آمار جدید واحد افزایش این عدد است.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'تعریف می کند که به طور پیش فرض حداکثر تعداد آمار در هر صفحه بر روی صفحه نمایش مرور کلی.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'تعریف می کند، انتخاب پیش فرض در منوی کشویی برای اشیاء پویا (فرم: مشخصات مشترک).است',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'تعریف می کند، انتخاب پیش فرض در منوی کشویی برای مجوز (فرم: مشخصات مشترک).است',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'تعریف می کند، انتخاب پیش فرض در منوی کشویی برای فرمت آمار (فرم: مشخصات مشترک). لطفا کلید فرمت را وارد (آمار :: قالب مراجعه کنید).',
        'Defines the search limit for the stats.' => ' حد جستجو برای آمار را تعریف می کند.',
        'Defines all the possible stats output formats.' => 'تعریف می کند همه امکانات فرمت آمار خروجی.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'اجازه می دهد تا عوامل به تبادل محور یک آمار اگر آنها تولید یک.',
        'Adds the following elements for use in stats: "Agent/Owner", "Created by Agent/Owner", "Responsible", "Accounted time by Agent".' =>
            '',
        'Allows invalid agents to be used in stats. Stats::UseAgentElementInStats must be active.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'همه شناسه های مشتری در یک میدان چند را انتخاب کنید (مفید می کنید اگر شما یک مقدار زیادی از شناسه مشتری).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'تعریف می کند که به طور پیش فرض حداکثر تعداد محور X ویژگی برای مقیاس زمانی.',
        'Znuny can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'Znuny می توانید یک یا چند پایگاه داده آینه فقط خواندنی برای عملیات گران قیمت مانند جستجو و یا آمار نسل متن استفاده کنید. در اینجا شما می توانید DSN برای پایگاه داده آینه اول را مشخص کنید.',
        'Specify the username to authenticate for the first mirror database.' =>
            'نام مشخص کاربری برای تأیید هویت برای پایگاه داده آینه است.',
        'Specify the password to authenticate for the first mirror database.' =>
            'رمز عبور مشخص برای احراز هویت برای پایگاه داده آینه است.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'پیکربندی هر پایگاه داده آینه فقط خواندنی های اضافی است که شما می خواهید به استفاده از.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'جستجوی کلمات از جسم فعال پس از ماسک لینک شی آغاز شده است.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'تعریف می کند یک فیلتر برای پردازش متن در مقالات، به منظور برجسته کلمات کلیدی از پیش تعریف شده.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'تعریف می کند یک فیلتر برای خروجی HTML برای اضافه کردن لینک در پشت اعداد CVE. عنصر تصویر اجازه می دهد تا دو نوع ورودی. در یک بار نام یک تصویر (به عنوان مثال faq.png). در این مورد مسیر تصویر Znuny استفاده خواهد شد. احتمال و امکان دوم است برای قرار دادن لینک به تصویر.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'تعریف می کند یک فیلتر برای خروجی HTML برای اضافه کردن لینک در پشت اعداد BUGTRAQ. عنصر تصویر اجازه می دهد تا دو نوع ورودی. در یک بار نام یک تصویر (به عنوان مثال faq.png). در این مورد مسیر تصویر Znuny استفاده خواهد شد. احتمال و امکان دوم است برای قرار دادن لینک به تصویر.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'تعریف می کند یک فیلتر برای خروجی HTML برای اضافه کردن لینک در پشت اعداد MSBulletin. عنصر تصویر اجازه می دهد تا دو نوع ورودی. در یک بار نام یک تصویر (به عنوان مثال faq.png). در این مورد مسیر تصویر Znuny استفاده خواهد شد. احتمال و امکان دوم است برای قرار دادن لینک به تصویر.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'تعریف یک فیلتر برای خروجی HTML برای اضافه کردن لینک پشت یک رشته تعریف شده است. عنصر تصویر اجازه می دهد تا دو نوع ورودی. در یک بار نام یک تصویر (به عنوان مثال faq.png). در این مورد مسیر تصویر Znuny استفاده خواهد شد. احتمال و امکان دوم است برای قرار دادن لینک به تصویر.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'تعریف می کند یک فیلتر برای خروجی HTML برای اضافه کردن لینک پشت یک رشته تعریف شده است. عنصر تصویر اجازه می دهد تا دو نوع ورودی. در یک بار نام یک تصویر (به عنوان مثال faq.png). در این مورد مسیر تصویر Znuny استفاده خواهد شد. احتمال و امکان دوم است برای قرار دادن لینک به تصویر.',
        'If enabled, the Znuny version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            'اگر فعال باشد، نسخه برچسب Znuny خواهد شد از Webinterface، هدر HTTP و X-هدر از ایمیل های خروجی حذف خواهند شد. توجه: اگر شما این گزینه را تغییر دهید، لطفا مطمئن شوید که به حذف کش.',
        'If enabled, Znuny will deliver all CSS files in minified form.' =>
            '',
        'If enabled, Znuny will deliver all JavaScript files in minified form.' =>
            'اگر فعال باشد، Znuny تمام فایل های جاوا اسکریپت را در فرم های Minified ارائه کرده است.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'لیستی از فایل های CSS پاسخگو برای همیشه برای رابط عامل بارگذاری می شود.',
        'List of JS files to always be loaded for the admin interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            'لیستی از فایل های CSS برای همیشه برای رابط مشتری بارگذاری می شود.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'لیستی از فایل های CSS پاسخگو برای همیشه برای رابط مشتری بارگذاری می شود.',
        'List of JS files to always be loaded for the customer interface.' =>
            'لیستی از فایل های JS برای همیشه برای رابط مشتری بارگذاری می شود.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'اگر فعال باشد، در سطح اول از منوی اصلی باز می شود بر روی موس (به جای تنها کلیک کنید).',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            ' نظمی که در آن نام و نام خانوادگی از عوامل نمایش داده خواهد شد را مشخص میکند.',
        'Default skin for the agent interface.' => 'پوست به طور پیش فرض برای رابط عامل.',
        'Dark skin for the agent interface.' => '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'InternalName پوست عامل است که باید در رابط عامل استفاده شود. لطفا پوسته های موجود در ظاهر :: :: عامل پوسته را تیک بزنید.',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'ممکن است که به پیکربندی پوسته های مختلف، به عنوان مثال برای تمایز بین عوامل مختلف، به بر اساس هر دامنه در داخل نرم افزار استفاده می شود. با استفاده از یک عبارت منظم (عبارت منظم)، شما می توانید یک جفت محتوا / کلیدی برای مطابقت با یک دامنه پیکربندی کنید. ارزش در \ "کلید " باید دامنه مطابقت، و ارزش در \ "محتوا " باید یک پوست معتبر بر روی سیستم شما می شود. لطفا برای فرم مناسب از عبارت منظم مشاهده نوشته های مثال.',
        'Default skin for the customer interface.' => 'پوست به طور پیش فرض برای رابط مشتری.',
        'Dark skin for the customer interface.' => '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'InternalName پوست مشتری است که باید در رابط مشتری استفاده می شود. لطفا پوسته های موجود در ظاهر :: مشتریان :: پوسته را تیک بزنید.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'ممکن است که به پیکربندی پوسته های مختلف، به عنوان مثال برای تمایز بین مشتریان مختلف، به بر اساس هر دامنه در داخل نرم افزار استفاده می شود. با استفاده از یک عبارت منظم (عبارت منظم)، شما می توانید یک جفت محتوا / کلیدی برای مطابقت با یک دامنه پیکربندی کنید. ارزش در \ "کلید " باید دامنه مطابقت، و ارزش در \ "محتوا " باید یک پوست معتبر بر روی سیستم شما می شود. لطفا برای فرم مناسب از عبارت منظم مشاهده نوشته های مثال.',
        'Shows time use complete description (days, hours, minutes), if enabled; or just first letter (d, h, m), if not enabled.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'اجرا می شود جستجو کلمات اولیه از کاربران مشتری های موجود در هنگام دسترسی به ماژول AdminCustomerUser است.',
        'Controls if the autocomplete field will be used for the customer ID selection in the AdminCustomerUser interface.' =>
            '',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'اجرا می شود جستجو کلمات اولیه این شرکت مشتری های موجود در هنگام دسترسی به ماژول AdminCustomerCompany است.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'کنترل اگر مدیر مجاز به ایجاد تغییرات به پایگاه داده از طریق AdminSelectBox. است',
        'List of all CustomerUser events to be displayed in the GUI.' => 'فهرست از تمام وقایع CustomerUser در رابط کاربری گرافیکی نمایش داده می شود.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'فهرست از تمام وقایع CustomerCompany در رابط کاربری گرافیکی نمایش داده می شود.',
        'Event module that updates customer users after an update of the Customer.' =>
            'ماژول رویداد که به روز رسانی به کاربران مشتری پس از به روز رسانی از مشتری می باشد.',
        'Event module that updates customer company object name for dynamic fields.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            'ماژول رویداد که به روز رسانی پروفایل جستجو کاربران مشتری اگر تغییرات وارد سایت شوید.',
        'Event module that updates customer user service membership if login changes.' =>
            'ماژول رویداد که به روز رسانی عضویت خدمات کاربران مشتری اگر تغییرات وارد سایت شوید.',
        'Event module that updates customer user object name for dynamic fields.' =>
            '',
        'Selects the cache backend to use.' => 'باطن کش استفاده انتخاب می کند.',
        'If enabled, the cache data be held in memory.' => '',
        'If enabled, the cache data will be stored in cache backend.' => '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'مشخص کنید که چگونه بسیاری از سطوح زیر دایرکتوری استفاده در هنگام ایجاد فایل های کش. این باید بیش از حد بسیاری از فایل های کش جلوگیری از بودن در یک دایرکتوری.',
        'Defines the config options for the autocompletion feature.' => 'تعریف می کند که گزینه های پیکربندی برای قابلیت تکمیل خودکار است.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'لیستی از اقدامات بعدی ممکن است در یک صفحه خطا، یک مسیر کامل مورد نیاز است، پس از آن ممکن است برای اضافه کردن لینک های خارجی در صورت نیاز.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'در دقیقه یک اطلاع رسانی برای اطلاع در مورد دوره تعمیر و نگهداری سیستم های آینده نشان داده شده است تنظیم می کند.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'مجموعه پیام پیش فرض برای اطلاع رسانی است که در یک دوره تعمیر و نگهداری سیستم در حال اجرا نشان داده شده است.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'مجموعه پیام پیش فرض برای صفحه ورود به سیستم در عامل و رابط مشتری، آن را نشان داده زمانی که یک دوره تعمیر و نگهداری سیستم در حال اجرا فعال است.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'مجموعه پیغام خطای پیش فرض برای صفحه ورود به سیستم در عامل و رابط مشتری، آن را نشان داده زمانی که یک دوره تعمیر و نگهداری سیستم در حال اجرا فعال است.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'استفاده از نوع جدیدی از زمینه را انتخاب کنید و تکمیل خودکار در رابط عامل، که در آن قابل اجرا (InputFields).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'استفاده از نوع جدیدی از زمینه را انتخاب کنید و تکمیل خودکار در رابط مشتری، در آن قابل اجرا (InputFields).',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'تعریف می کند که مسیر پاییز پشت برای باز کردن باینری fetchmail مشاهده کنید. توجه: نام باینری نیاز به \'کامند fetchmail "، در صورت متفاوت است مدیر یک پیوند نمادین استفاده کنید.',
        'Defines an overview module to show the address book view of a customer user list.' =>
            '',
        'Specifies the group where the user needs rw permissions so that they can edit other users preferences.' =>
            '',
        'Defines email communication channel.' => '',
        'Defines internal communication channel.' => '',
        'Defines phone communication channel.' => '',
        'Defines chat communication channel.' => '',
        'Defines groups for preferences items.' => '',
        'Defines how many deployments the system should keep.' => '',
        'Defines the search parameters for the AgentCustomerUserAddressBook screen. With the setting \'CustomerTicketTextField\' the values for the recipient field can be specified.' =>
            '',
        'Defines the default filter fields in the customer user address book search (CustomerUser or CustomerCompany). For the CustomerCompany fields a prefix \'CustomerCompany_\' must be added.' =>
            '',
        'Defines the shown columns and the position in the AgentCustomerUserAddressBook result screen.' =>
            '',
        'Example package autoload configuration.' => '',
        'Activates week number for datepickers.' => '',

        # XML Definition: Kernel/Config/Files/XML/GenericInterface.xml
        'Performs the configured action for each event (as an Invoker) for each configured web service.' =>
            '',
        'Cache time in seconds for the web service config backend.' => 'زمان کش در ثانیه برای خدمات وب باطن پیکربندی.',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'زمان کش در ثانیه را برای احراز هویت عامل در GenericInterface.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'زمان کش در ثانیه را برای احراز هویت مشتری در GenericInterface.',
        'GenericInterface module registration for the transport layer.' =>
            'GenericInterface ثبت نام ماژول برای لایه حمل و نقل.',
        'GenericInterface module registration for the operation layer.' =>
            'GenericInterface ثبت نام ماژول برای لایه عملیات.',
        'GenericInterface module registration for the invoker layer.' => 'GenericInterface ثبت نام ماژول برای لایه invoker است.',
        'GenericInterface module registration for the mapping layer.' => 'GenericInterface ثبت نام ماژول برای لایه های نقشه برداری.',
        'Defines the default visibility of the article to customer for this operation.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای این عملیات، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای این عملیات، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the default auto response type of the article for this operation.' =>
            'تعریف می کند که به طور پیش فرض نوع پاسخ خودکار مقاله برای این عملیات.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'تعریف می کند که حداکثر اندازه در کیلوبایت پاسخ GenericInterface که به جدول gi_debugger_entry_content وارد شده است.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'حداکثر تعداد درخواست در نتیجه این کار نمایش داده می شود.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای مرتب سازی بلیط از نتیجه جستجو بلیط این عملیات.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط در نتیجه جستجو بلیط از این عملیات. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'GenericInterface module registration for an error handling module.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/ProcessManagement.xml
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'ثبت نام ماژول ظاهر (فرآیندهای بلیط غیر فعال کردن صفحه نمایش اگر هیچ فرایند در دسترس).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate).' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'این گزینه زمینه پویا که در آن یک مدیریت فرآیند نهاد شناسه فرایند ذخیره شده است تعریف می کند.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'این گزینه زمینه پویا که در آن یک مدیریت فرآیند نهاد فعالیت شناسه ذخیره شده است تعریف می کند.',
        'This option defines the process tickets default queue.' => 'این گزینه به طور پیش فرض درخواست روند صف تعریف می کند.',
        'This option defines the process tickets default state.' => 'این گزینه به طور پیش فرض درخواست روند دولت تعریف می کند.',
        'This option defines the process tickets default lock.' => 'این گزینه به طور پیش فرض درخواست روند قفل تعریف می کند.',
        'This option defines the process tickets default priority.' => 'این گزینه به طور پیش فرض درخواست اولویت فرایند تعریف می کند.',
        'Display settings to override defaults for Process Tickets.' => 'تنظیمات پیش فرض صفحه نمایش برای نادیده گرفتن فرایند درخواست هست.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key =&gt; My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'نشان می دهد یک لینک در منوی ثبت نام یک بلیط به یک فرایند در نظر زوم بلیط رابط عامل.',
        'Loader module registration for the customer interface.' => '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'ثبت نام ماژول ظاهر (فرآیندهای بلیط غیر فعال کردن صفحه نمایش اگر هیچ روند موجود) برای مشتری.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'به طور پیش فرض پیشوند نهاد مدیریت پردازش برای شناسه های نهاد است که به طور خودکار تولید می شود.',
        'Cache time in seconds for the DB process backend.' => 'زمان کش در ثانیه برای فرایند باطن DB.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'زمان کش در ثانیه برای فرایند بلیط ماژول خروجی نوار ناوبری.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'تعیین حالات درخواست ممکن بعدی، برای درخواست روند در رابط عامل.',
        'Shows existing parent/child (separated by ::) process lists in the form of a tree or a list.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            'تعیین ایالات بلیط ممکن بعدی، برای بلیط روند در رابط مشتری.',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'If enabled debugging information for transitions is logged.' => 'در صورت فعال بودن اطلاعات اشکال زدایی برای انتقال به سیستم وارد شده است.',
        'Defines the priority in which the information is logged and presented.' =>
            'تعریف می کند که اولویت است که در آن اطلاعات وارد شده و ارائه شده است.',
        'Filter for debugging Transitions. Note: More filters can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'DynamicField backend registration.' => 'DynamicField ثبت نام باطن.',
        'Defines the default keys and values for the transition action module parameters. Mandatory fields are marked with "(* required)". Note: For most of the keys the AttributeID can also be used, e.g. "Owner" can be "OwnerID". Keys that define the same Attribute should only be used once, e.g. "Owner" and "OwnerID" are redundant.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Ticket.xml
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'شناسه یک بلیط برای، به عنوان مثال بلیط #، تماس #، MyTicket #. به طور پیش فرض بلیط # است.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'تقسیم کننده بین TicketHook و تعداد درخواست به عنوان مثال \': \'.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'حداکثر اندازه از افراد در یک پاسخ ایمیل و در برخی از صفحه نمایش مرور کلی.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'متن در آغاز از این موضوع در یک پاسخ ایمیل، به عنوان مثال RE، AW، و یا به عنوان.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'متن در آغاز موضوع هنگامی که یک ایمیل فرستاده است، به عنوان مثال FW، FWD، یا WG.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'قالب این موضوع است. یعنی «چپ» [TicketHook #: 12،345] برخی از موضوع، به معنای "حق" \'برخی از تم [TicketHook #: 12،345]\'، \'هیچ\' به معنی \'برخی از تم و هیچ تعداد بلیط. در مورد دوم شما باید بررسی کنید که رئيس پست تنظیم :: CheckFollowUpModule ### 0200-منابع فعال است به رسمیت شناختن پیگیری بر اساس هدر ایمیل.',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'یک لیست از زمینه پویا که بلیط اصلی را به در جریان یک عملیات ادغام. تنها زمینه های پویا که بلیط اصلی در خالی هستند مجموعه خواهد شد.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'نام صف سفارشی. صف های سفارشی انتخاب صف از صف مورد نظر خود را است و می تواند در تنظیمات تنظیمات انتخاب شده است.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'نام خدمات سفارشی. خدمات سفارشی انتخاب خدمات خدمات مورد نظر خود را است و می تواند در تنظیمات تنظیمات انتخاب شده است.',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'تغییرات صاحب بلیط برای همه (برای ASP مفید). به طور معمول تنها عامل با مجوز RW در صف بلیط نشان داده خواهد شد.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'درخواست ویژگی مسئول، برای پیگیری یک بلیط خاص را قادر می سازد .',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'به طور خودکار مجموعه صاحب یک بلیط به عنوان مسئول آن از (اگر بلیط ویژگی مسئول فعال باشد). این تنها کار خواهد کرد به صورت دستی اعمال در کاربران وارد سایت شوید. آن را برای اقدامات خودکار به عنوان مثال GenericAgent، پست و GenericInterface کار نمی کند.',
        'Automatically change the state of a ticket with an invalid owner once it is unlocked. Maps from a state type to a new ticket state.' =>
            '',
        'Enables ticket type feature.' => '',
        'Defines the default ticket type.' => 'تعریف می کند که نوع درخواست به طور پیش فرض است.',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'اجازه تعریف خدمات و SLA ها برای درخواست  می دهد (به عنوان مثال ایمیل، دسکتاپ، شبکه، ...)، و تشدید ویژگی برای SLA ها (اگر سرویس بلیط / ویژگی های SLA فعال باشد).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'حفظ تمام خدمات در لیست حتی اگر آنها کودکان از عناصر نامعتبر است.',
        'Allows default services to be selected also for non existing customers.' =>
            'اجازه می دهد تا خدمات به طور پیش فرض به همچنین برای مشتریان غیر موجود انتخاب شود.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'سیستم آرشیو درخواست را با انتقال برخی درخواست‌ها به خارج از ناحیه روزانه به منظور داشتن سیستمی سریع‌تر، فعال می‌کند. برای جستجوی این درخواست‌ها باید چک آرشیو در جستجوی درخواست انتخاب شده باشد.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'کنترل اگر پرچم درخواست و مقاله دیده شود آنها حذف می شوند زمانیکه یک بلیط بایگانی شده است.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'حذف درخواست نگهبان اطلاعات زمانی که درخواست بایگانی شده است.',
        'Activates the ticket archive system search in the customer interface.' =>
            'فعال کردن جستجو سیستم آرشیو درخواست در رابط مشتری.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). With "Random" the ticket numbers will be generated by 12 random numbers. The format looks like SystemID.RandomNumbers (e.g. 10123456789012).' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups. If not enabled, SystemID will be changed after using the system.' =>
            '',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'مجموعه حداقل اندازه بلیط ضد اگر \ "AUTOINCREMENT " به عنوان TicketNumberGenerator انتخاب شد. به طور پیش فرض 5 است، این به معنای ضد از 10،000 شروع می شود.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'حداقل اندازه بلیط ضد قادر می سازد (در صورت \ "تاریخ " به عنوان TicketNumberGenerator انتخاب شد).',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'IndexAccelerator: برای انتخاب ماژول باطن TicketViewAccelerator خود را. \ "RuntimeDB " تولید هر نظر صف در پرواز از جدول بلیط (بدون مشکل در عملکرد تا حدود 60.000 بلیط در کل و 6.000 بلیط باز در سیستم). \ "StaticDB " است که ماژول قدرتمند ترین، آن را با استفاده از یک جدول بلیط شاخص های اضافی است که مانند یک کار می کند (توصیه می شود اگر بیش از 80.000 و 6.000 بلیط باز در سیستم ذخیره می شود). استفاده از دستور \ "بن / znuny.Console.pl سیستم maint :: بلیط :: QueueIndexRebuild " برای ایجاد شاخص اولیه.',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the Znuny user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'موجب صرفه جویی در فایل پیوست مقالات. \ "DB " فروشگاه تمام اطلاعات در پایگاه داده (برای ذخیره سازی فایل پیوست بزرگ توصیه نمی شود). \ "FS " ذخیره اطلاعات در فایل سیستم. این است سریع تر اما وب سرور باید تحت کاربر Znuny اجرا کنید. شما می توانید بین ماژول حتی در یک سیستم است که در حال حاضر در تولید بدون از دست دادن داده ها تغییر دهید. توجه داشته باشید: جستجو برای نام دلبستگی پشتیبانی نمی که \ "FS " استفاده شده است.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'مشخص میکند که آیا تمام پایانه (Backend) ذخیره سازی باید چک شود که دنبال فایل پیوست کنید. این فقط برای نصب و راه اندازی که در آن برخی از فایل پیوست در فایل سیستم، و دیگران در پایگاه داده مورد نیاز است.',
        'Specifies the directory to store the data in, if "FS" was selected for ArticleStorage.' =>
            '',
        'Specifies whether the (MIMEBase) article attachments will be indexed and searchable.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'مدت زمان در دقیقه پس از رهبری یک رویداد، که در آن تشدید جدید مطلع و شروع به حوادث سرکوب می شوند.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            'بازیابی یک بلیط از آرشیو (فقط در صورتی که این رویداد تغییر دولت به هر حالت باز موجود است).',
        'Updates the ticket index accelerator.' => 'به روز رسانی شتاب دهنده شاخص درخواست',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'بازنشانی و بازکردن دسترسی صاحب یک درخواست اگر آن را به صف دیگری انتقال داده.',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'نیروهای به انتخاب یک دولت بلیط مختلف (از فعلی) بعد از عمل قفل. تعریف وضعیت فعلی به عنوان کلید، و دولت بعدی پس از عمل قفل به عنوان محتوا.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'به طور خودکار مجموعه مسئول یک بلیط (در صورت تنظیم نشده است) پس از به روز رسانی صاحب اول.',
        'When agent creates a ticket, whether or not the ticket is automatically locked to the agent.' =>
            '',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'مجموعه PendingTime یک بلیط تا 0، از اگر دولت به حالت عدم در حال بررسی تغییر کرده است.',
        'Sends the notifications which are configured in the admin interface under "Ticket Notifications".' =>
            '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'به روز رسانی صفحه اول تشدید بلیط پس از یک ویژگی بلیط به روز کردم.',
        'Ticket event module that triggers the escalation stop events.' =>
            'درخواست ماژول رویداد که باعث حوادث تشدید توقف.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'نیروهای  باز کردن درخواست پس ازاین به صف دیگری نقل مکان کرد.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'به روز رسانی بلیط \ "دیده می شود " پرچم اگر هر مقاله دیده شد و یا یک مقاله جدید ایجاد کردم.',
        'Event module that updates tickets after an update of the Customer.' =>
            'ماژول رویداد که به روز رسانی بلیط پس از بروز رسانی از مشتری است.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'ماژول رویداد که به روز رسانی بلیط پس از به روز رسانی از کاربر مشتری.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser setting.' =>
            '',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see DynamicFieldFromCustomerUser::Mapping setting for how to configure the mapping.' =>
            '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'اضافه بار (باز تعریف) توابع موجود در هسته :: :: سیستم بلیط. استفاده به راحتی سفارشی اضافه کنید.',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). It will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild".' =>
            '',
        'Defines whether to index archived tickets for fulltext searches.' =>
            '',
        'Force the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'نمایش اخطار و جلوگیری از جستجو زمانی که با استفاده از کلمات در درون جستجوی متن هست.',
        'Basic fulltext index settings. Execute "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" in order to generate a new index.' =>
            '',
        'Fulltext index regex filters to remove parts of the text.' => 'متن فیلتر شاخص عبارت منظم به حذف بخش هایی از متن.',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف انگلیسی برای شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف آلمانی برای شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف هلندی شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف اسپانیایی برای شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف فرانسه برای شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف ایتالیایی شاخص متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'کلمات توقف قابل تنظیم برای صفحه اول متن. این کلمات از صفحه اول جستجو حذف خواهند شد.',
        'Allows having a small format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo =&gt; 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'تعریف می کند که مقاله انواع فرستنده باید در پیش نمایش یک درخواست نشان داده شود.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'تعداد مقالات در حالت پیش نمایش از مروری بلیط قابل مشاهده تنظیم می کند.',
        'Defines if the first article should be displayed as expanded, that is visible for the related customer. If nothing defined, latest article will be expanded.' =>
            '',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'زمان در ثانیه است که می شود به زمان واقعی اضافه شده است اگر تنظیم یک انتظار دولت (به طور پیش فرض: 86،400 = 1 روز).',
        'Define the max depth of queues.' => 'تعریف عمق حداکثر صف.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'نشان می دهد موجود لیست صف والد / فرزند در سیستم در قالب یک درخت یا یک لیست.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'فعال یا غیر فعال از ویژگی های نگهبان درخواست، برای پیگیری درخواست بدون داشتن صاحب و نه مسئول است.',
        'Enables ticket watcher feature only for the listed groups.' => ' از ویژگی های نگهبان درخواست تنها برای گروه های ذکر شده را قادر می سازد.',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'حجم درخواست از ویژگی های عمل برای ظاهر عامل به کار بر روی بیش از درخواست در یک زمان قادر می سازد.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'ویژگی های عمل حجم درخواست تنها برای گروه های ذکر شده را قادر می سازد .',
        'Defines time in minutes since last modification for drafts of specified type before they are considered expired.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => 'یک لینک به یک بلیط ایمیل بزرگنمایی در متن ساده را نشان می دهد.',
        'Shows all the articles of the ticket (expanded) in the agent zoom view.' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'مقالات طبقه بندی شده اند به طور معمول یا در جهت معکوس، تحت زوم بلیط در رابط عامل نشان می دهد.',
        'Shows the article head information in the agent zoom view.' => '',
        'Shows a count of attachments in the ticket zoom, if the article has attachments.' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'نمایش زمان به حساب برای یک مقاله در نظر زوم درخواست است.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'فیلتر مطلب را در نمای نمایش کامل برای مشخص کردن اینکه کدام مطلب نمایش داده شود، فعال می‌کند.',
        'Displays the number of all tickets with the same CustomerID as current ticket in the ticket zoom view.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'تاریخ بلیط (معکوس دستور داد) در رابط عامل نشان می دهد.',
        'Controls how to display the ticket history entries as readable values.' =>
            'کنترل نحوه نمایش نوشته های تاریخ بلیط به عنوان ارزش های قابل خواندن است.',
        'Permitted width for compose email windows.' => 'عرض مجاز برای ویندوز نوشتن ایمیل.',
        'Permitted width for compose note windows.' => 'عرض مجاز برای ویندوز توجه داشته باشید نوشتن.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'حداکثر اندازه (در ردیف) از عوامل آگاه در رابط عامل جعبه.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'حداکثر اندازه (در ردیف) از جمله عوامل مرتبط در رابط عامل جعبه.',
        'Makes the application block external content loading.' => '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'اطلاعات کاربر با مشتری (تلفن و ایمیل) در صفحه نوشتن را نشان می دهد.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'حداکثر اندازه (در شخصیت) از جدول اطلاعات مربوط به مشتری (تلفن و ایمیل) در صفحه نوشتن.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'حداکثر اندازه (در شخصیت) از جدول اطلاعات مربوط به مشتری در نظر زوم بلیط.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'حداکثر طول (به نویسه) زمینه پویا در نوار کناری از نظر زوم درخواست',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'حداکثر طول (به نویسه) زمینه پویا در مقاله از نظر زوم درخواست',
        'Controls if customers have the ability to sort their tickets.' =>
            'کنترل اگر مشتریان توانایی مرتب سازی درخواست های خود را داشته باشند.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'این گزینه دسترسی به بلیط شرکت مشتری، که توسط کاربران مشتری ایجاد نمی انکار کند.',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'متن دلخواه برای صفحه نشان داده شده به مشتریان است که هیچ بلیط هنوز (اگر شما نیاز به آن متن ترجمه آنها را به یک ماژول ترجمه سفارشی اضافه کنید).',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'هم موضوع آخرین مقاله مشتری و یا به عنوان بلیط در بررسی اجمالی فرمت کوچک نشان می دهد.',
        'Show the current owner in the customer interface.' => 'نمایش مالک فعلی در رابط مشتری.',
        'Show the current queue in the customer interface.' => 'نمایش صف فعلی در رابط مشتری.',
        'Dynamic fields shown in the ticket overview screen of the customer interface.' =>
            '',
        'Strips empty lines on the ticket preview in the queue view.' => 'نوار خطوط خالی بر روی پیش نمایش درخواست در نظر صف.',
        'Shows all both ro and rw queues in the queue view.' => 'همه هر دو صف RO و RW در نظر صف نشان می دهد.',
        'Show queues even when only locked tickets are in.' => 'نمایش صف حتی زمانی که بلیط تنها قفل شده در هستند.',
        'Enable highlighting queues based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'مجموعه سن در دقیقه (سطح اول) برای برجسته صف که حاوی بلیط دست نخورده.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'مجموعه سن در دقیقه (سطح دوم) برای برجسته صف که حاوی بلیط دست نخورده.',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'مکانیزم چشمک زدن را برای صف درخواستی که شامل قدیمی‌ترین درخواست می‌باشد فعال می‌کند.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'شامل بلیط از subqueues در به طور پیش فرض در هنگام انتخاب یک صف.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'انواع بلیط (ascendingly یا descendingly) که یک صف واحد در نمایش صف انتخاب و پس از بلیط ها با اولویت طبقه بندی شده اند. ارزش: 0 = صعودی (قدیمی ترین در بالا، به طور پیش فرض)، 1 = نزولی (جوانترین در بالا). استفاده از QueueID برای کلید و 0 یا 1 برای ارزش.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'تعریف می کند که به طور پیش فرض مرتب سازی بر معیارهای برای همه صف نمایش داده شده در نمایش صف.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'تعریف می کند اگر قبل از مرتب کردن بر اساس اولویت باید در نظر صف انجام شود.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'تعریف می کند که به طور پیش فرض مرتب کردن برای همه صف در نظر صف، پس از مرتب سازی بر اولویت است.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'نوار خطوط خالی بر روی پیش نمایش درخواست در نظر خدمات.',
        'Shows all both ro and rw tickets in the service view.' => 'همه هر دو بلیط RO و RW در نظر خدمات.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'انواع بلیط (ascendingly یا descendingly) که یک صف واحد در نمایش خدمات انتخاب و پس از بلیط ها با اولویت طبقه بندی شده اند. ارزش: 0 = صعودی (قدیمی ترین در بالا، به طور پیش فرض)، 1 = نزولی (جوانترین در بالا). استفاده از ServiceID برای کلید و 0 یا 1 برای ارزش.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'تعریف می کند که به طور پیش فرض مرتب سازی بر معیارهای برای همه خدمات نمایش داده شده در نمایش خدمات.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'تعریف می کند اگر قبل از مرتب کردن بر اساس اولویت باید در نظر خدمات انجام  شود.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'تعریف می کند که به طور پیش فرض مرتب کردن برای همه خدمات در نظر خدمات، پس از مرتب کردن اولویت است.',
        'Enable highlighting services based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting services that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting services that contain untouched tickets.' =>
            '',
        'Activates a blinking mechanism of the service that contains the oldest ticket.' =>
            '',
        'Activates time accounting.' => 'محاسبه زمان را فعال می‌کند.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'مجموعه واحد زمان مورد نظر (به عنوان مثال واحد کار، ساعت، دقیقه).',
        'Defines if time accounting is mandatory in the agent interface. If enabled, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'تعریف می کند اگر حسابداری هم باید به تمام بلیط در عمل بخش عمده تنظیم شده است.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در نمایش وضعیت رابط عامل.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که سفارش بلیط به طور پیش فرض (پس از مرتب کردن اولویت) در نظر وضعیت رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'تعریف می کند که مجوز مورد نیاز برای نشان دادن یک درخواست در نظر تشدید رابط عامل است.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در نظر تشدید رابط عامل.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که سفارش بلیط به طور پیش فرض (پس از مرتب کردن اولویت) در نظر تشدید رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'حداکثر تعداد بلیط در نتیجه یک جستجو در رابط عامل نمایش داده میشود.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'تعداد بلیط در هر صفحه از یک نتیجه جستجو در رابط عامل نمایش داده شود.',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'تعداد خطوط (در هر بلیط) که توسط ابزار جستجو در رابط عامل نشان داده شده است.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای مرتب سازی بلیط از نتیجه جستجو بلیط رابط عامل.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط در نتیجه جستجو بلیط رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'صادرات کل درخت مقاله در نتیجه جستجو (می تواندبرعملکرد سیستم تاثیر بگذارد).',
        'Data used to export the search result in CSV format.' => 'داده استفاده شده برای ارسال نتایج جستجو به قالب CSV',
        'Includes article create times in the ticket search of the agent interface.' =>
            'شامل مقاله ایجاد بار در جستجو درخواست رابط عامل.',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'تعریف می کند که به طور پیش فرض نشان داده بلیط ویژگی جستجو برای صفحه نمایش جستجو بلیط.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'داده های پیش فرض برای استفاده بر روی ویژگی برای صفحه نمایش جستجو بلیط. به عنوان مثال: \ "TicketCreateTimePointFormat = سال؛ TicketCreateTimePointStart = آخرین. TicketCreateTimePoint = 2؛ ".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'داده های پیش فرض برای استفاده بر روی ویژگی برای صفحه نمایش جستجو بلیط. به عنوان مثال: \ "TicketCreateTimeStartYear = 2010؛ TicketCreateTimeStartMonth = 10؛ TicketCreateTimeStartDay = 4؛ TicketCreateTimeStopYear = 2010؛ TicketCreateTimeStopMonth = 11؛ TicketCreateTimeStopDay = 3؛ ".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در نظر بلیط قفل رابط عامل.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط در نظر بلیط قفل رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در نظر مسئول رابط عامل.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط در نظر مسئول رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در نظر دیده بان رابط عامل.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط در نظر دیده بان رابط عامل. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده ازدرخواست صفحه نمایش های متنی رایگان در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در بلیط صفحه نمایش های متنی رایگان از رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets if service must be selected by the agent.' => 'مجموعه  سرویس باید توسط عامل انتخاب شود.',
        'Sets if SLA must be selected by the agent.' => 'مجموعه SLA باید توسط کارشناس انتخاب شود.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'صف در بلیط رایگان صفحه نمایش متن یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets if queue must be selected by the agent.' => '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'مجموعه صاحب بلیط در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Sets if ticket owner must be selected by the agent.' => 'مجموعه صاحب درخواست باید توسط عامل انتخاب شود.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'مجموعه عامل مسئول بلیط در بلیط صفحه نمایش های متنی رایگان از رابط عامل از.',
        'Sets if ticket responsible must be selected by the agent.' => '',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if state must be selected by the agent.' => '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش بلیط های متنی رایگان از رابط عامل. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'مجموعه توجه داشته باشید باید در عامل پر شده است. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'تعریف می کند که موضوع به طور پیش فرض از توجه داشته باشید در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'تعریف می کند که بدن به طور پیش فرض از توجه داشته باشید در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، بلیط در صفحه نمایش های متنی رایگان از رابط عامل نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket free text screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'گزینه های اولویت بلیط در بلیط صفحه نمایش های متنی رایگان از رابط عامل نشان می دهد.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در بلیط صفحه نمایش های متنی رایگان از رابط عامل.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            'قسمت عنوان در بلیط صفحه نمایش های متنی رایگان از رابط عامل نشان می دهد.',
        'Allows to save current work as draft in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'تعریف می کند نوع تاریخ برای بلیط رایگان عمل صفحه نمایش متن، می شود که برای تاریخ بلیط استفاده می شود.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'تعریف می کند که نظر تاریخ برای بلیط رایگان عمل صفحه نمایش متن، می شود که برای تاریخ بلیط استفاده می شود.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش خروجی تلفن بلیط در رابط عامل.',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش خروجی تلفن بلیط رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض نوع فرستنده برای بلیط تلفن در صفحه نمایش خروجی تلفن بلیط رابط عامل.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'تعریف می کند که موضوع به طور پیش فرض برای بلیط تلفن در صفحه نمایش خروجی تلفن بلیط رابط عامل.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض متن توجه داشته باشید بدن برای بلیط تلفن در صفحه نمایش خروجی تلفن بلیط رابط عامل.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض بلیط دولت بعد و پس از اضافه کردن یک یادداشت تلفن در صفحه نمایش خروجی تلفن بلیط رابط عامل.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'بعدی ایالات بلیط ممکن است پس از اضافه کردن یک یادداشت تلفن در صفحه نمایش خروجی تلفن بلیط رابط عامل.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای گوشی بلیط عمل روی صفحه نمایش خروجی، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای گوشی بلیط عمل روی صفحه نمایش خروجی، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Allows to save current work as draft in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش های ورودی تلفن بلیط در رابط عامل.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در تلفن بلیط صفحه نمایش بین المللی به درون رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض نوع فرستنده برای بلیط تلفن در گوشی بلیط صفحه نمایش بین المللی به درون رابط عامل.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'تعریف می کند که موضوع به طور پیش فرض برای بلیط تلفن در گوشی بلیط صفحه نمایش بین المللی به درون رابط عامل.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض متن توجه داشته باشید بدن برای بلیط تلفن در گوشی بلیط صفحه نمایش بین المللی به درون رابط عامل.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض بلیط دولت بعد و پس از اضافه کردن یک یادداشت تلفن در گوشی بلیط صفحه نمایش بین المللی به درون رابط عامل.',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'بعدی ایالات بلیط ممکن است پس از اضافه کردن یک یادداشت تلفن در گوشی بلیط صفحه نمایش بین المللی به درون رابط عامل.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای گوشی بلیط عمل روی صفحه نمایش ورودی، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای گوشی بلیط عمل روی صفحه نمایش ورودی، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Allows to save current work as draft in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'انتخاب صاحب در تلفن و ایمیل بلیط در رابط عامل نشان می دهد.',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'نمایش یک انتخاب مسئول در تلفن و ایمیل بلیط در رابط عامل.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'تعریف می کند که هدف دریافت کننده بلیط تلفن و فرستنده بلیط ایمیل (\ "صف " را نشان می دهد تمام صف، \ "آدرس سیستم " تمام آدرس های سیستم) در رابط عامل.',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "&lt;Queue&gt;" shows the names of the queues and for SystemAddress "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'مشخص است که گزینه های گیرنده (درخواست تلفن) و فرستنده (درخواست ایمیل) در رابط عامل معتبر خواهد بود.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'نشان می دهد بلیط تاریخ مشتری در AgentTicketPhone، AgentTicketEmail و AgentTicketCustomer.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'اگر فعال باشد، TicketPhone و TicketEmail در پنجره جدید باز خواهد شد.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'مجموعه از اولویت پیش فرض برای بلیط تلفن جدید در رابط عامل.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'به طور پیش فرض نوع فرستنده برای بلیط تلفن جدید در رابط عامل تنظیم می کند.',
        'Sets the default article customer visibility for new phone tickets in the agent interface.' =>
            '',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'کنترل اگر بیش از یک  ورودی می تواند بلیط تلفن جدید در رابط عامل در تنظیم شده است.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'مجموعه این موضوع به طور پیش فرض برای بلیط گوشی جدید (به عنوان مثال «تماس با تلفن) در رابط عامل.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'متن پیش فرض توجه داشته باشید برای بلیط تلفن جدید تنظیم می کند. به عنوان مثال \'بلیط جدید از طریق تماس در رابط عامل.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'به طور پیش فرض حالت بعدی برای درخواست تلفن جدید را در صفحه ی کارشناس تنظیم می کند.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'تعیین حالات درخواست ممکن بعدی، پس از ایجاد یک درخواست تلفن جدید در رابط عامل.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش بلیط تلفن، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش بلیط تلفن، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'به طور پیش فرض نوع لینک بلیط خرد شده در رابط عامل تنظیم می کند.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'مجموعه از اولویت پیش فرض برای بلیط ایمیل جدید در رابط عامل.',
        'Sets the default article customer visibility for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'به طور پیش فرض نوع فرستنده برای بلیط ایمیل جدید در رابط عامل تنظیم می کند.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'مجموعه این موضوع به طور پیش فرض برای بلیط ایمیل جدید (به عنوان مثال، عازم ناحیه دور دست ایمیل \') در رابط عامل.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'متن پیش فرض برای بلیط ایمیل جدید در رابط عامل تنظیم می کند.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'مجموعه به طور پیش فرض حالت بلیط آینده، پس از ایجاد یک بلیط ایمیل در رابط عامل.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'تعیین حالات درخواست ممکن بعدی، پس از ایجاد یک درخواست ایمیل جدید در رابط عامل.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش بلیط ایمیل، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش بلیط ایمیل، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش درخواست نزدیک در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش بلیط نزدیک رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط می شود قفل شده است و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'صف در بلیط صفحه نمایش نزدیک یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'مجموعه صاحب بلیط در صفحه نمایش بلیط نزدیک رابط عامل.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'مجموعه عامل مسئول بلیط در صفحه نمایش بلیط نزدیک رابط عامل از.',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش بلیط نزدیک رابط عامل.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش بلیط نزدیک رابط عامل.',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش بلیط نزدیک رابط عامل. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'مجموعه تم پیش فرض برای یادداشت های اضافه شده در صفحه نمایش بلیط نزدیک رابط عامل.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در صفحه نمایش بلیط نزدیک رابط عامل تنظیم می کند.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، در روی صفحه نمایش بلیط نزدیک رابط عامل نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines if the note in the close ticket screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'گزینه های اولویت بلیط در صفحه نمایش بلیط نزدیک رابط عامل نشان می دهد.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'تعریف می کند که اولویت درخواست به طور پیش فرض در صفحه نمایش درخواست نزدیک رابط عامل است .',
        'Shows the title field in the close ticket screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the close ticket screen of the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش بلیط نزدیک، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش بلیط نزدیک، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش توجه داشته باشید بلیط در رابط عامل.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'صف در روی صفحه نمایش توجه داشته باشید بلیط یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'مجموعه صاحب بلیط در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'مجموعه عامل مسئول بلیط در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل از.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش توجه داشته باشید بلیط رابط عامل. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'مجموعه تم پیش فرض برای یادداشت های اضافه شده در صفحه نمایش توجه داشته باشید بلیط رابط عامل.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در صفحه نمایش توجه داشته باشید بلیط رابط عامل تنظیم می کند.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket note screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'گزینه های اولویت بلیط در روی صفحه نمایش توجه داشته باشید بلیط رابط عامل نشان می دهد.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در صفحه نمایش توجه داشته باشید بلیط رابط عامل.',
        'Shows the title field in the ticket note screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket note screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش توجه داشته باشید بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش توجه داشته باشید بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش صاحب بلیط یک بلیط بزرگنمایی در رابط عامل.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل را از مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'صف در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'مجموعه صاحب بلیط در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'مجموعه عامل مسئول بلیط در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'مجموعه تم پیش فرض برای یادداشت های اضافه شده در صفحه نمایش صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در صفحه نمایش صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket owner screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'گزینه های اولویت بلیط در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در صفحه صاحب بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Shows the title field in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket owner screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش صاحب بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش صاحب بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل را از مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'صف در روی صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'مجموعه صاحب بلیط در بلیط صفحه نمایش در حال بررسی یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'مجموعه عامل مسئول بلیط در صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در بلیط صفحه نمایش در حال بررسی یک بلیط بزرگنمایی در رابط عامل از.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'مجموعه تم پیش فرض برای یادداشت های اضافه شده در صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، در روی صفحه نمایش بلیط در انتظار یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket pending screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'گزینه های اولویت بلیط در بلیط صفحه نمایش در حال بررسی یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در بلیط صفحه نمایش در حال بررسی یک بلیط بزرگنمایی در رابط عامل از.',
        'Shows the title field in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket pending screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای بلیط در انتظار عمل روی صفحه نمایش، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش بلیط در انتظار، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل را از مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'صف در روی صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'مجموعه صاحب بلیط در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'مجموعه عامل مسئول بلیط در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در روی صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'مجموعه تم پیش فرض برای یادداشت های اضافه شده در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، در روی صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket priority screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'گزینه های اولویت بلیط در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل را نشان می دهد.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در صفحه نمایش اولویت بلیط یک بلیط بزرگنمایی در رابط عامل از.',
        'Shows the title field in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket priority screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای عمل روی صفحه نمایش اولویت بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای عمل روی صفحه نمایش اولویت بلیط، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از درخواست صفحه نمایش در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در بلیط صفحه نمایش مسئول رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'صف در بلیط صفحه نمایش مسئول یک بلیط بزرگنمایی در رابط عامل از مجموعه.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'مجموعه صاحب بلیط در بلیط صفحه نمایش مسئول رابط عامل.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'مجموعه عامل مسئول بلیط در بلیط صفحه نمایش مسئول رابط عامل از.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از اضافه کردن یک یادداشت، در بلیط صفحه نمایش مسئول رابط عامل.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی به طور پیش فرض یک بلیط پس از اضافه کردن یک یادداشت، در بلیط صفحه نمایش مسئول رابط عامل.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'اجازه می دهد تا با اضافه کردن یادداشت در صفحه نمایش بلیط مسئول رابط عامل. می توان با بلیط :: ظاهر :: NeedAccountedTime رونویسی.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'مجموعه این موضوع به طور پیش فرض برای یادداشت اضافه شده در بلیط صفحه نمایش مسئول رابط عامل.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در بلیط صفحه نمایش مسئول رابط عامل تنظیم می کند.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'یک لیست از تمام عوامل درگیر این بلیط، بلیط در صفحه نمایش مسئول رابط عامل نشان می دهد.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket responsible screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'گزینه های اولویت بلیط در بلیط صفحه نمایش مسئول رابط عامل نشان می دهد.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'تعریف می کند که اولویت درخواست به طور پیش فرض در درخواست صفحه نمایش مسئول رابط عامل است.',
        'Shows the title field in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند نوع تاریخ برای بلیط عمل صفحه نمایش مسئول، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'تعریف می کند که نظر تاریخ برای بلیط عمل صفحه نمایش مسئول، می شود که برای تاریخ بلیط در رابط عامل استفاده می شود.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'به صورت خودکار قفل و پس از انتخاب برای یک عمل فله مجموعه مالک به عامل فعلی.',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'نوع بلیط در صفحه نمایش فله بلیط رابط عامل تنظیم می کند.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'مجموعه صاحب بلیط در صفحه نمایش فله بلیط رابط عامل.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'مجموعه عامل مسئول بلیط در صفحه نمایش فله بلیط رابط عامل از.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'گزینه های اولویت بلیط در صفحه نمایش فله بلیط رابط عامل نشان می دهد.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'تعریف می کند که اولویت بلیط به طور پیش فرض در صفحه نمایش فله بلیط رابط عامل.',
        'Defines if the note in the ticket bulk screen of the agent interface is visible for the customer by default.' =>
            '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'تعیین اگر لیستی از صف ممکن به حرکت به بلیط به باید در یک لیست کشویی یا در یک پنجره جدید در رابط عامل نمایش داده میشود. اگر \ "پنجره جدید " قرار است شما می توانید یک یادداشت حرکت بلیط برای اضافه کنید.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'به صورت خودکار قفل و پس از باز کردن صفحه نمایش درخواست حرکت از رابط عامل تعیین مالک به عامل فعلی.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'اجازه می دهد تا به مجموعه ای از یک دولت درخواست جدید در صفحه نمایش درخواست حرکت از رابط عامل.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از به صف دیگری نقل مکان کرد، در روی صفحه نمایش بلیط حرکت از رابط عامل.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'گزینه های اولویت بلیط در صفحه نمایش بلیط حرکت از رابط عامل نشان می دهد.',
        'Allows to save current work as draft in the ticket move screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش پرش درخواست در صفحه ی کارشناس .',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش گزاف گویی بلیط رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض حالت یک بلیط بعد از بعدی بودن منعکس، در صفحه نمایش گزاف گویی بلیط رابط عامل.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'تعریف می کند که دولت بعدی یک بلیط پس از منعکس، در صفحه نمایش گزاف گویی بلیط رابط عامل.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض بلیط اطلاع رسانی برای مشتری / فرستنده در صفحه نمایش گزاف گویی بلیط رابط عامل میره.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش آهنگسازی درخواست در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نوشتن بلیط رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض حالت بعدی یک بلیط اگر آن تشکیل شده است از / پاسخ در صفحه نوشتن بلیط رابط عامل.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'تعریف می کند که حالت ممکن بعدی را بعد از ترکیب / پاسخ یک بلیط در صفحه نوشتن بلیط رابط عامل.',
        'Defines if the message in the ticket compose screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'تعریف فرمت پاسخها را در صفحه نوشتن بلیط رابط عامل ([٪ Data.OrigFrom | HTML٪] است از 1: 1، [٪ Data.OrigFromName | HTML٪] تنها realname از از است).',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'تعریف می کند که کاراکتر استفاده می شود برای نقل قول ایمیل متن در صفحه نوشتن بلیط رابط عامل. اگر این خالی است و یا غیر فعال است، ایمیل اصلی نخواهد نقل شود اما افزوده به پاسخ.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'تعریف و حداکثر تعداد خطوط به نقل از پاسخ آن اضافه شود.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'می افزاید: مشتریان به آدرس ایمیل به گیرندگان در صفحه نوشتن بلیط رابط عامل. آدرس مشتریان ایمیل اضافه خواهد شد در صورتی که نوع مقاله ایمیل داخلی است.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'جایگزین فرستنده اصلی با آدرس ایمیل مشتری فعلی در پاسخ نوشتن در صفحه نوشتن بلیط رابط عامل.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش انتقال درخواست در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در بلیط صفحه نمایش رو به جلو از رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض حالت یک بلیط بعد از بعدی بودن فرستاده، در بلیط صفحه نمایش رو به جلو از رابط عامل.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'تعریف می کند که حالت ممکن بعد و پس از حمل و نقل یک بلیط در بلیط صفحه نمایش رو به جلو از رابط عامل.',
        'Defines if the message in the ticket forward screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket forward screen of the agent interface.' =>
            '',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش خروجی ایمیل در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش خروجی ایمیل از رابط عامل مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'تعریف می کند که به طور پیش فرض بعدی دولت یک بلیط پس از پیام ارسال شده است، در صفحه نمایش خروجی ایمیل از رابط عامل.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'تعریف می کند که حالت ممکن بعدی پس از ارسال پیام در صفحه نمایش خروجی ایمیل از رابط عامل.',
        'Defines if the message in the email outbound screen of the agent interface is visible for the customer by default.' =>
            '',
        'Required permissions to use the email resend screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the email resend screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines if the message in the email resend screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the email outbound screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'دسترسی مورد نیاز برای استفاده از صفحه نمایش ادغام درخواست یک درخواست زوم شده  در صفحه ی کارشناس.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط در صفحه نمایش ادغام بلیط یک بلیط بزرگنمایی در رابط عامل را از مورد نیاز است (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'دسترسی مورد نیاز برای تغییر درخواست دهنده ی یک درخواست در صفحه ی کارشناس.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'تعریف می کند اگر یک قفل بلیط مورد نیاز برای تغییر مشتری یک بلیط در رابط عامل (اگر بلیط هنوز قفل نشده است، بلیط قفل می شود و عامل فعلی خواهد شد به طور خودکار به عنوان صاحب آن تنظیم).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'هنگامی که بلیط هم ادغام شدند، مشتری می تواند در هر ایمیل با تنظیم چک باکس \ "اطلاع فرستنده " آگاه است. در این متن، شما می توانید یک متن از قبل فرمت شده که بعدا توسط عوامل اصلاح شود را تعریف کنیم.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'هنگامی که بلیط ادغام شدهاند، توجه داشته باشید به طور خودکار بلیط است که دیگر فعال به اضافه شده است. در اینجا شما می توانید موضوع این توجه داشته باشید (این موضوع می تواند توسط عامل نمی توان تغییر داد) را تعریف کنیم.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'هنگامی که بلیط ادغام شدهاند، توجه داشته باشید به طور خودکار بلیط است که دیگر فعال به اضافه شده است. در اینجا شما می توانید بدن از این توجه داشته باشید (این متن را می توسط عامل نمی توان تغییر داد) را تعریف کنیم.',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'تعریف می کند که به طور پیش فرض انواع فرستنده قابل مشاهده یک بلیط (به طور پیش فرض: مشتری).',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            'تعریف می کند که قفل قابل مشاهده یک بلیط. توجه: وقتی که این تنظیم را تغییر دهید، مطمئن شوید که به حذف کش به منظور استفاده از ارزش های جدید است. به طور پیش فرض: باز کردن، tmp_lock.',
        'Defines the valid state types for a ticket. If a ticket is in a state which have any state type from this setting, this ticket will be considered as open, otherwise as closed.' =>
            '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'تعریف می کند که ایالات معتبر برای بلیط باز شده است. برای باز کردن قفل بلیط اسکریپت \ "بن / znuny.Console.pl سیستم maint :: بلیط :: UnlockTimeout " می تواند استفاده شود.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'می فرستد اطلاعیه یادآور بلیط قفل پس از رسیدن به تاریخ یادآوری (فقط به صاحب بلیط ارسال).',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be enabled).' =>
            '',
        'Defines the state type of the reminder for pending tickets.' => 'تعریف می کند نوع دولت از یادآوری برای انتظار بلیط.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'تعیین حالات ممکن برای درخواست در حال بررسی است که پس از رسیدن به محدودیت زمانی حالت تغییر کرده است.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'تعریف می کند که حالت ها باید به طور خودکار تنظیم شوند (محتوا)، پس از زمان انتظار به حالت (کلید) رسیده است.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'لینک های خارجی به پایگاه داده های مشتری (: یا \'\' به عنوان مثال \'؟ //yourhost/customer.php CID = [٪ Data.CustomerID٪] HTTP\') تعریف می کند.',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'تعریف می کند ویژگی target در لینک به پایگاه داده های مشتری خارجی. به عنوان مثال \'هدف = \ "CDB ".',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'تعریف می کند ویژگی target در لینک به پایگاه داده های مشتری خارجی. به عنوان مثال \'AsPopup PopupType_TicketAction.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'مورد نوار ابزار برای یک میانبر. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول اطلاع رسانی رابط برای دیدن تعدادی از بلیط از عوامل مسئول است. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول اطلاع رسانی رابط برای دیدن تعدادی از بلیط تماشا. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول اطلاع رسانی رابط برای دیدن تعدادی از بلیط قفل شده است. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول اطلاع رسانی رابط برای دیدن تعدادی از بلیط در سرویس های من. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول رابط برای دسترسی به جستجوی متن از طریق نوار منو. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول رابط برای دسترسی به جستجوی CIC از طریق نوار منو. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'عامل ماژول رابط برای دسترسی به پروفایل جستجو از طریق نوار منو. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'ماژول برای تولید مشخصات opensearch بر روی HTML برای جستجو بلیط کوتاه در رابط عامل.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'ماژول برای نمایش اعلام و escalations (ShownMax: حداکثر escalations نشان داده شده است، EscalationInMinutes: بلیط نمایش که تشدید، CacheTime خواهد شد: کش از escalations محاسبه در ثانیه).',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'مورد و ضوابط (آیکون) نشان می دهد که بلیط باز این مشتری را به عنوان بلوک اطلاعات. تنظیم CustomerUserLogin تا 1 جستجو برای بلیط بر اساس نام کاربری به جای CustomerID.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'مورد و ضوابط (آیکون) نشان می دهد که بلیط بسته از این مشتری را به عنوان بلوک اطلاعات. تنظیم CustomerUserLogin تا 1 جستجو برای بلیط بر اساس نام کاربری به جای CustomerID.',
        'Agent interface article notification module to check PGP.' => 'ماژول اعلان مطلب برای کارشناس به جهت کنترل PGP',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'ماژول واسط کارشناس برای کنترل ایمیل‌های وارده در نمای نمایش کامل درخواست در صورتی که کلید S/MIME موجود و صحیح باشد.',
        'Agent interface article notification module to check S/MIME.' =>
            'ماژول اعلان مطلب برای کارشناس به جهت کنترل S/MIME',
        'Module to define the email security options to use (PGP or S/MIME).' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'ماژول برای نوشتن پیام های امضا (PGP و یا S / MIME).',
        'Module to encrypt composed messages (PGP or S/MIME).' => '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'یک لینک برای دانلود فایل پیوست مقاله در نظر زوم مقاله در رابط عامل نشان می دهد.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'یک لینک برای دسترسی به فایل پیوست مقاله از طریق یک بیننده آنلاین HTML در نظر زوم مقاله در رابط عامل نشان می دهد.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو برای رفتن در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو به قفل / باز کردن بلیط در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو برای دسترسی به تاریخ یک بلیط در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'نشان می دهد یک لینک در منو به چاپ یک بلیط یا یک مقاله در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی نشان می دهد برای دیدن اولویت یک بلیط در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'نشان می دهد یک لینک در منو به اضافه کردن یک فیلد متنی رایگان در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی که اجازه می دهد تا ارتباط یک بلیط با یکی دیگر از جسم در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to change the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی نشان می دهد به اضافه کردن یک یادداشت در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to add a phone call outbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a phone call inbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی نشان می دهد به ارسال یک ایمیل عازم ناحیه دور دست در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی که اجازه می دهد تا ادغام بلیط در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو برای تنظیم یک بلیط به عنوان انتظار در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو برای اشتراک / لغو اشتراک یک بلیط در نظر زوم بلیط رابط عامل از نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منوی نشان می دهد برای بستن یک بلیط در نظر زوم بلیط رابط عامل. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک در منو به یک بلیط در نظر زوم بلیط رابط عامل حذف نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'یک لینک به تنظیم یک بلیط به عنوان آشغال در نظر زوم بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود. به خوشه آیتم های منو برای کلید \ "CLUSTERNAME " و برای محتوای هر نام شما می خواهید برای دیدن در UI استفاده کنید. استفاده از \ "ClusterPriority " برای پیکربندی سفارش از یک خوشه خاص در نوار ابزار.',
        'Shows link to external page in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'This setting shows the sorting attributes in all overview screen, not only in queue view.' =>
            '',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'تعریف می کند که از آن بلیط ویژگی های عامل می توانید سفارش نتیجه را انتخاب کنید.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'یک لینک در منو به قفل / باز کردن یک بلیط در مروری بلیط رابط عامل نشان می دهد.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'یک لینک در منوی نشان می دهد به زوم یک بلیط در مروری بلیط رابط عامل.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'یک لینک در منوی نشان می دهد برای دیدن تاریخ یک بلیط در هر مروری بلیط رابط عامل.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'یک لینک در منو برای تنظیم اولویت یک بلیط در هر مروری بلیط رابط عامل نشان می دهد.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'نشان می دهد یک لینک در منو به اضافه کردن یک یادداشت یک بلیط به در هر مروری بلیط رابط عامل.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'یک لینک در منوی نشان می دهد برای بستن یک بلیط در هر مروری بلیط رابط عامل.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'یک لینک در منوی نشان می دهد به حرکت یک بلیط در هر مروری بلیط رابط عامل.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'یک لینک در منو به حذف یک بلیط در هر مروری بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'یک لینک در منو برای تنظیم یک بلیط به عنوان آشغال در هر مروری بلیط رابط عامل نشان می دهد. کنترل دسترسی اضافی برای نشان دادن یا این لینک نشان می دهد را نمی توان با استفاده از کلید \ "گروه " و محتوا مانند \ ":؛: GROUP2 \ move_into GROUP1 RW" انجام می شود.',
        'Module to grant access to the owner of a ticket.' => 'ماژول برای اعطای دسترسی به صاحب یک درخواست.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'محدودیت صف اختیاری برای ماژول اجازه OwnerCheck. اگر تعیین شود، مجوز فقط برای بلیط در صف مشخص اعطا می شود.',
        'Module to grant access to the agent responsible of a ticket.' =>
            'ماژول برای اعطای دسترسی به عامل مسئول یک درخواست.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'محدودیت صف اختیاری برای ماژول اجازه ResponsibleCheck. اگر تعیین شود، مجوز فقط برای بلیط در صف مشخص اعطا می شود.',
        'Module to check the group permissions for the access to tickets.' =>
            'ماژول برای بررسی مجوز گروه برای دسترسی به درخواست.',
        'Module to grant access to the watcher agents of a ticket.' => 'ماژول برای اعطای دسترسی به عوامل نگهبان یک درخواست.',
        'Module to grant access to the creator of a ticket.' => 'ماژول برای اعطای دسترسی به خالق یک درخواست .',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'محدودیت صف اختیاری برای ماژول اجازه CreatorCheck. اگر تعیین شود، مجوز فقط برای بلیط در صف مشخص اعطا می شود.',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'ماژول برای اعطای دسترسی به هر عامل است که یک بلیط در گذشته درگیر (بر اساس نوشته های تاریخ بلیط).',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'محدودیت صف اختیاری برای ماژول اجازه InvolvedCheck. اگر تعیین شود، مجوز فقط برای بلیط در صف مشخص اعطا می شود.',
        'Module to check the group permissions for customer access to tickets.' =>
            'ماژول برای بررسی مجوز گروه برای دسترسی مشتری به درخواست',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'ماژول برای اعطای دسترسی اگر CustomerUserID بلیط مسابقات CustomerUserID مشتری باشد.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'ماژول برای اعطای دسترسی اگر CustomerID بلیط مسابقات CustomerID مشتری باشد.',
        'Module to grant access if the CustomerID of the customer has necessary group permissions.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'تعریف می کند که چگونه از میدان از ایمیل (ارسال از پاسخ و بلیط ایمیل) باید مانند نگاه.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'تعریف می کند که جدا کننده بین عوامل نام واقعی و با توجه به آدرس ایمیل صف.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'MyLastChangedTickets dashboard widget.' => '',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Defines the calendar width in percent. Default is 95%.' => 'پهنای تقویم در درصد است. به طور پیش فرض 95٪ است.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'تعریف می کند که صف را بلیط برای نمایش به عنوان رویدادهای تقویم استفاده می شود.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'تعریف نام زمینه پویا برای زمان شروع. این فیلد به صورت دستی به سیستم به عنوان بلیط افزود: \ "تاریخ / زمان " و باید در صفحه نمایش ایجاد بلیط و / یا در هر صفحه نمایش عمل بلیط دیگر فعال شود.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'تعریف نام زمینه پویا برای زمان پایان. این فیلد به صورت دستی به سیستم به عنوان بلیط افزود: \ "تاریخ / زمان " و باید در صفحه نمایش ایجاد بلیط و / یا در هر صفحه نمایش عمل بلیط دیگر فعال شود.',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'تعریف می کند که زمینه های پویا هستند که برای نمایش بر روی رویدادهای تقویم استفاده می شود.',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'تعریف می کند زمینه های بلیط که در حال رفتن به رویدادهای تقویم نمایش داده شود. در \ "کلید " تعریف درست و یا بلیط خاصیت ها و \ "محتوا " نام صفحه نمایش تعریف می کند.',
        'Defines if the values for filters should be retrieved from all available tickets. If enabled, only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'پارامترهای باطن داشبورد لیست کاربران مشتری مروری بر رابط عامل. \ "محدود " تعداد ورودی نشان داده شده است به طور پیش فرض است. \ "گروه " استفاده شده است برای محدود کردن دسترسی به پلاگین (به عنوان مثال گروه: مدیریت. GROUP1؛ GROUP2؛). \ "پیش فرض " تعیین اگر این افزونه به طور پیش فرض و یا اگر کاربر نیاز به آن را فعال کنید به صورت دستی فعال کنید. \ "CacheTTLLocal " زمان کش در دقیقه برای پلاگین است.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'پارامترهای باطن داشبورد از شناسه مشتری ویجت وضعیت رابط عامل. \ "گروه " استفاده شده است برای محدود کردن دسترسی به پلاگین (به عنوان مثال گروه: مدیریت. GROUP1؛ GROUP2؛). \ "پیش فرض " تعیین اگر این افزونه به طور پیش فرض و یا اگر کاربر نیاز به آن را فعال کنید به صورت دستی فعال کنید. \ "CacheTTLLocal " زمان کش در دقیقه برای پلاگین است.',
        'Parameters for the dashboard backend of the customer id list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the CustomQueue object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the CustomService object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the RefreshTime object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the column filters of the small ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters for the CreateNextMask object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Parameters of the example queue attribute Comment2.' => 'پارامترهای مثال صف نسبت Comment2.',
        'Parameters of the example service attribute Comment2.' => 'پارامترهای خدمات به عنوان مثال ویژگی Comment2.',
        'Parameters of the example SLA attribute Comment2.' => 'پارامترهای مثال SLA نسبت Comment2.',
        'Sends customer notifications just to the mapped customer.' => 'می فرستد اطلاعیه مشتری فقط به مشتری نقشه برداری.',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'مشخص میکند که آیا یک عامل باید ایمیل برای اطلاع از اقدامات خود را دریافت خواهید کرد.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'تعیین صفحه بعدی بعد ازدرخواست مشتری جدید در رابط مشتری.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'به مشتریان اجازه می دهد به تنظیم اولویت درخواست در رابط مشتری.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'تعریف می کند که اولویت پیش فرض درخواست مشتری جدید در رابط مشتری است. ',
        'Allows customers to set the ticket queue in the customer interface. If this is not enabled, QueueDefault should be configured.' =>
            '',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'تعریف می کند که صف به طور پیش فرض برای درخواست مشتری جدید در رابط مشتری است.',
        'Allows customers to set the ticket type in the customer interface. If this is not enabled, TicketTypeDefault should be configured.' =>
            '',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'تعریف می کند که به طور پیش فرض نوع بلیط برای بلیط مشتری جدید در رابط مشتری.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'اجازه می دهد به مشتریان تا قراردهند  مجموعه خدمات درخواست در رابط مشتری.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'مشتریان اجازه می دهد تا مجموعه ای از SLA بلیط در رابط مشتری.',
        'Sets if service must be selected by the customer.' => 'مجموعه  سرویس باید توسط مشتری انتخاب شود.',
        'Sets if SLA must be selected by the customer.' => 'مجموعه SLA باید توسط مشتری انتخاب شود.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'تعریف می کند که حالت پیش فرض از درخواست مشتری جدید در رابط مشتری است.',
        'Sender type for new tickets from the customer inteface.' => 'نوع فرستنده برای درخواست جدید از inteface مشتری.',
        'Defines the default history type in the customer interface.' => 'تعریف می کند که به طور پیش فرض نوع تاریخ در رابط مشتری.',
        'Comment for new history entries in the customer interface.' => 'نظر برای نوشته های تاریخ جدید در رابط مشتری.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            'تعریف می کند که هدف دریافت کننده بلیط (\ "صف " را نشان می دهد تمام صف، \ "SystemAddress " نشان می دهد تنها صف که به آدرس سیستم اختصاص داده) در رابط مشتری.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "&lt;Queue&gt;" shows the names of the queues, and for SystemAddress, "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'مشخص می کند که صف برای گیرنده های نامه درخواست در رابط مشتری معتبر خواهد بود.',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'ماژول برای انتخاب در صفحه نمایش درخواست جدید در رابط مشتری.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'تعیین صفحه بعدی بعد از صفحه نمایش پیگیری یک درخواست بزرگنمایی در رابط مشتری .',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'تعریف می کند که به طور پیش فرض نوع فرستنده برای بلیط در روی صفحه نمایش زوم بلیط رابط مشتری.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'تعریف می کند نوع تاریخ برای بزرگنمایی بلیط، می شود که برای تاریخ بلیط در رابط مشتری استفاده می شود.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'تعریف می کند که نظر تاریخ برای بزرگنمایی بلیط، می شود که برای تاریخ بلیط در رابط مشتری استفاده می شود.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'به مشتریان  برای تغییر اولویت بلیط در رابط مشتری اجازه می دهد .',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'تعریف می کند که اولویت پیش فرض درخواست مشتری پیگیری در صفحه نمایش زوم درخواست در رابط مشتری است .',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'اجازه می دهد تا انتخاب حالت نوشتن بعدی برای درخواست مشتری در رابط مشتری.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'تعریف می کند که به طور پیش فرض حالت بعدی یک بلیط از مشتری پیگیری در رابط مشتری برای.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'تعریف می کند که حالت ممکن بعدی برای بلیط مشتری در رابط مشتری.',
        'Shows the enabled ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Defines the length of the article preview in the customer interface.' =>
            '',
        'Defines the displayed style of the From field in notes that are visible for customers. A default agent name can be defined in Ticket::Frontend::CustomerTicketZoom###DefaultAgentName setting.' =>
            '',
        'Defines the default agent name in the ticket zoom view of the customer interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'حداکثر تعداد درخواست در نتیجه یک جستجو در رابط مشتری نمایش داده می شود.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'تعداد بلیط در هر صفحه از یک نتیجه جستجو در رابط مشتری نمایش داده می شود.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'تعریف می کند که به طور پیش فرض ویژگی بلیط برای بلیط مرتب سازی در یک جستجو بلیط رابط مشتری.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'تعریف می کند که به طور پیش فرض سفارش بلیط از یک نتیجه جستجو در رابط مشتری. تا: قدیمی ترین در بالای صفحه. پایین: شدن در بالای صفحه.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'اگر فعال باشد، مشتری می تواند برای درخواست در همه خدمات (بدون در نظر گرفتن اینکه چه خدماتی به مشتری اختصاص داده) جستجو کنید.',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'تعریف می کند تمام پارامترهای برای ShownTickets در ترجیحات مشتری رابط مشتری شی.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'تعریف می کند تمام پارامترهای برای شی RefreshTime در ترجیحات مشتری رابط مشتری.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'تعریف می کند که به طور پیش فرض استفاده می شود ظاهر ماژول اگر هیچ پارامتر اقدام داده شده در URL در رابط عامل.',
        'Default queue ID used by the system in the agent interface.' => 'شناسه پیش‌فرض صف استفاده شده برای سیستم در واسط کاربری کارشناس',
        'Default ticket ID used by the system in the agent interface.' =>
            'ID درخواست به طور پیش فرض استفاده شده توسط سیستم در رابط عامل.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'تعریف می کند که به طور پیش فرض استفاده می شود ظاهر ماژول اگر هیچ پارامتر اقدام داده شده در URL در رابط مشتری.',
        'Default ticket ID used by the system in the customer interface.' =>
            'ID درخواست به طور پیش فرض استفاده شده توسط سیستم در رابط مشتری.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'ماژول برای تولید مشخصات opensearch بر روی HTML برای جستجو بلیط کوتاه در رابط مشتری.',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'تعیین صفحه بعدی پس از بلیط منتقل شده است. LastScreenOverview خواهد آخرین صفحه نمای کلی (به عنوان مثال نتایج جستجو، queueview، داشبورد) بازگشت. TicketZoom به TicketZoom بازگشت.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'مجموعه این موضوع به طور پیش فرض برای یادداشت اضافه شده در روی صفحه نمایش حرکت بلیط رابط عامل.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'به طور پیش فرض متن برای یادداشت اضافه شده در روی صفحه نمایش حرکت بلیط رابط عامل تنظیم می کند.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'مجموعه ای از محدودیت بلیط خواهد شد که در یک اعدام کار genericagent تک اجرا می شود.',
        'Allows generic agent to execute custom modules.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'باز کردن بلیط هر زمان که یک توجه داشته باشید اضافه شده است و مالک از دفتر.',
        'Include unknown customers in ticket filter.' => 'شامل مشتریان ناشناخته در فیلتر درخواست',
        'List of all ticket events to be displayed in the GUI.' => 'فهرست از تمام وقایع درخواست در رابط کاربری گرافیکی نمایش داده می شود.',
        'List of all article events to be displayed in the GUI.' => 'فهرست از تمام وقایع مقاله در رابط کاربری گرافیکی نمایش داده می شود.',
        'List of all queue events to be displayed in the GUI.' => 'فهرست از تمام وقایع صف  در رابط کاربری گرافیکی نمایش داده می شود.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'ماژول رویداد است که انجام یک بیانیه به روز رسانی در TicketIndex به تغییر نام نام صف وجود دارد در صورت نیاز و اگر StaticDB است که در واقع استفاده می شود.',
        'Ignores not ticket related attributes.' => '',
        'Transport selection for ticket notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ماژول ACL فقط زمانی که تمام درخواست‌های فرزند بسته شده باشد، اجازه بستن درخواست‌های والد را می‌دهد. ("وضعیت" نان می‌دهد که کدام وضعیت‌ها برای درخواست والدتا زمانی که تمام درخواست‌های فرزند بسته شده است، در دسترس می‌باشد.)',
        'Default ACL values for ticket actions.' => 'مقادیر ACL پیش‌فرض برای عملیات‌های درخواست',
        'Defines which items are available in first level of the ACL structure.' =>
            'تعریف می کند که اقلام در سطح اول از ساختار ACL در دسترس هستند.',
        'Defines which items are available in second level of the ACL structure.' =>
            'تعریف می کند که اقلام در سطح دوم از ساختار ACL در دسترس هستند.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'تعریف می کند که اقلام برای \'عمل\' در سطح سوم ساختار ACL در دسترس هستند.',
        'Cache time in seconds for the DB ACL backend.' => 'زمان کش در ثانیه برای بخش مدیریت DB لیگ قهرمانان آسیا.',
        'If enabled debugging information for ACLs is logged.' => 'اگر اطلاعات اشکال زدایی فعال برای ACL ها وارد شده است.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'پاسخ به ایمیل خودکار حداکثر به خود آدرس ایمیل در روز (حلقه حفاظت).',
        'Maximal auto email responses to own email-address a day, configurable by email address (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'اندازه حداکثر در کیلو بایت برای ایمیل است که می تواند از طریق POP3 / POP3S / IMAP / IMAPS (کیلو بایت) برگردانده شده.',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'حداکثر تعداد ایمیل در یک بار قبل از اتصال مجدد به سرور دریافت.',
        'Default loop protection module.' => 'ماژول جلوگیری از تشکیل حلقه پیش‌فرض',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'راه را برای ورود به سیستم فایل (تنها در صورتی به \ "FS " برای LoopProtectionModule انتخاب شد و آن الزامی است).',
        'Converts HTML mails into text messages.' => 'تبدیل ایمیل های HTML و به پیام های متنی.',
        'Specifies user id of the postmaster data base.' => ' شناسه کاربر از پایگاه داده رئيس پست را مشخص میکند.',
        'Defines the postmaster default queue.' => 'تعریف می کند  به طور پیش فرض صف رئيس پست را.',
        'Defines the default priority of new tickets.' => 'تعریف می کند که اولویت پیش فرض درخواست جدید است.',
        'Defines the default state of new tickets.' => 'تعریف می کند که حالت پیش فرض از درخواست های جدید است.',
        'Defines the state of a ticket if it gets a follow-up.' => 'تعریف می کند که دولت یک بلیط اگر می شود پیگیری.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'تعریف می کند که دولت یک بلیط اگر می شود پیگیری و بلیط در حال حاضر بسته شده است.',
        'Defines the PostMaster header to be used on the filter for keeping the current state of the ticket.' =>
            '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'می فرستد عامل پیگیری اطلاع رسانی تنها به مالک، اگر یک بلیط قفل شده است (به طور پیش فرض است که برای ارسال اطلاع رسانی به تمام عوامل).',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'تعریف تعداد فیلدهای هدر در ماژول ظاهر برای اضافه کردن و به روز رسانی فیلتر رئيس پست. آن را می توانید تا 99 زمینه باشد.',
        'Indicates if a bounce e-mail should always be treated as normal follow-up.' =>
            '',
        'Defines all the X-headers that should be scanned.' => 'تعریف می کند همه X-header که باید اسکن شود.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'ماژول برای فیلتر کردن و دستکاری پیام های دریافتی. بلوک / چشم پوشی از همه ایمیل های اسپم با از: noreply @ آدرس.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From =&gt; \'(.+?)@.+?\', and use () as [***] in Set =&gt;.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'بلوک تمام ایمیل های دریافتی است که یک تعداد بلیط معتبر در موضوع با از ندارید: @ example.com آدرس.',
        'Defines the sender for rejected emails.' => 'تعریف می کند که فرستنده ایمیل را رد کرد.',
        'Defines the subject for rejected emails.' => 'تعریف می کند که موضوع برای ایمیل را رد کرد.',
        'Defines the body text for rejected emails.' => 'تعریف می کند که متن برای ایمیل را رد کرد.',
        'Module to use database filter storage.' => 'ماژول برای استفاده از ذخیره سازی فیلتر پایگاه داده.',
        'Module to check if arrived emails should be marked as internal (because of original forwarded internal email). IsVisibleForCustomer and SenderType define the values for the arrived email/article.' =>
            '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number. Note: the first capturing group from the \'NumberRegExp\' expression will be used as the ticket number value.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => 'ماژول برای فیلتر بدن رمزگذاری شده از پیام های دریافتی.',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'ماژول به بهانه کاربران مشتری SMIME گواهی از پیام های دریافتی.',
        'Module to check if a incoming e-mail message is bounce.' => '',
        'Module used to detect if attachments are present.' => '',
        'Executes follow-up checks on Znuny Header \'X-OTRS-Bounce\'.' =>
            '',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'چک اگر یک ایمیل پیگیری بلیط های موجود به با جستجو در موضوع برای یک تعداد بلیط معتبر است.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'اجرا چک پیگیری در پاسخ به یا مراجع هدر برای ایمیل هایی که شماره درخواست را در موضوع ندارد.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'اجرا چک پیگیری بدن ایمیل برای ایمیل هایی که شماره درخواست را در موضوع ندارد.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'اجرا چک پیگیری محتویات پیوست برای ایمیل هایی که شماره درخواست را در موضوع ندارد.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'اجرا چک پیگیری ایمیل منبع اولیه برای ایمیل هایی که شماره درخواست را در موضوع ندارد.',
        'Checks if an email is a follow-up to an existing ticket with external ticket number which can be found by ExternalTicketNumberRecognition filter module.' =>
            '',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'اگر این عبارت منظم مسابقات، هیچ پیام خواهد شد توسط پاسخگوی خودکار ارسال می کند.',
        'If this option is enabled, tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is not enabled, no autoresponses will be sent.' =>
            '',
        'Links 2 tickets with a "Normal" type link.' => 'لینک 2 درخواست با یک \ "عادی " لینک نوع.',
        'Links 2 tickets with a "ParentChild" type link.' => 'لینک 2درخواست با یک \ "ParentChild " لینک نوع.',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'تعریف می کند، که درخواست  که انواع حالت درخواست باید در لیست درخواست مرتبط ذکر شده نخواهد شد.',
        'For these state types the ticket numbers are striked through in the link table.' =>
            '',
        'Module to generate ticket statistics.' => 'ماژول برای تولید آماردرخواست.',
        'Determines if the statistics module may generate ticket lists.' =>
            'تعیین  ماژول آمار ممکن است لیست درخواست تولید کند.',
        'Module to generate accounted time ticket statistics.' => 'ماژول برای تولید آمار زمان بود.',
        'Module to generate ticket solution and response time statistics.' =>
            'ماژول برای تولید راه حل درخواست و آمار زمان پاسخ.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'مجموعه ای از ارتفاع به طور پیش فرض (به پیکسل) مقالات HTML درون خطی در AgentTicketZoom.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'تنظیم حداکثر ارتفاع (به پیکسل) مقالات HTML درون خطی در AgentTicketZoom.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'حداکثر تعداد مقالات در یک صفحه در AgentTicketZoom گسترش یافته است.',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'حداکثر تعداد مقالات در یک صفحه در AgentTicketZoomنشان داده شده است.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'مشاهده مقاله به عنوان متن غنی حتی اگر نوشتن متن غنی غیر فعال است.',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Dynamic fields shown in the ticket close screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket compose screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket email screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket free text screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket forward screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the email outbound screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket move screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket note screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket owner screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket pending screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket phone screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket priority screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket responsible screen of the agent interface.' =>
            '',
        'Dynamic fields options shown in the ticket message screen of the customer interface. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            '',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface.' =>
            '',
        'AgentTicketZoom widget that displays ticket data in the side bar.' =>
            '',
        'AgentTicketZoom widget that displays customer information for the ticket in the side bar.' =>
            '',
        'AgentTicketZoom widget that displays a table of objects linked to the ticket.' =>
            '',
        'Dynamic fields shown in the ticket zoom screen of the customer interface.' =>
            '',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the agent interface.' =>
            '',
        'Dynamic fields shown in the ticket print screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the agent interface.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            'تعریف می کند که به طور پیش فرض نشان داده بلیط ویژگی جستجو برای صفحه نمایش جستجو بلیط. به عنوان مثال: \ "کلید " باید نام زمینه پویا در این مورد \'X\'، \ "محتوا "، باید ارزش درست پویا بسته به نوع پویا درست، متن را داشته باشد: یک متن، کرکره : \'1\'، تاریخ / زمان: Search_DynamicField_XTimeSlotStartYear = 1974؛ Search_DynamicField_XTimeSlotStartMonth = 01؛ Search_DynamicField_XTimeSlotStartDay = 26؛ Search_DynamicField_XTimeSlotStartHour = 00؛ Search_DynamicField_XTimeSlotStartMinute = 00؛ Search_DynamicField_XTimeSlotStartSecond = 00؛ Search_DynamicField_XTimeSlotStopYear = 2013؛ Search_DynamicField_XTimeSlotStopMonth = 01؛ Search_DynamicField_XTimeSlotStopDay = 26؛ Search_DynamicField_XTimeSlotStopHour = 23؛ Search_DynamicField_XTimeSlotStopMinute = 59؛ Search_DynamicField_XTimeSlotStopSecond = 59؛ \' و یا "Search_DynamicField_XTimePointFormat = هفته؛ Search_DynamicField_XTimePointStart = قبل از. Search_DynamicField_XTimePointValue = 7 \'؛.',
        'Dynamic Fields used to export the search result in CSV format.' =>
            ' زمینه های پویا مورد استفاده به صادرات نتیجه جستجو در فرمت CSV.',
        'Dynamic fields shown in the ticket search screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (https://doc.znuny.org/manual/developer/), chapter "Ticket Event Module".' =>
            'پیکربندی تنظیمات پیش فرض TicketDynamicField. \ "نام " تعریف می کند زمینه پویا است که باید مورد استفاده قرار گیرد، \ "ارزش " داده است که تعیین خواهد شد، و \ "رویداد " رویداد ماشه تعریف می کند. لطفا کتابچه راهنمای توسعه (https://doc.znuny.org/manual/developer/)، فصل \ "بلیط رویداد ماژول " تیک بزنید.',
        'Defines the list of types for templates.' => 'لیستی از انواع برای قالب تعریف میکند.',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'فهرست پیش فرض قالب استاندارد که به طور خودکار به صف جدید بر ایجاد اختصاص داده است.',
        'General ticket data shown in the ticket overviews (fall-back). Note that TicketNumber can not be disabled, because it is necessary.' =>
            '',
        'Columns that can be filtered in the status view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the queue view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the responsible view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the watch view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the locked view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the escalation view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the ticket search result view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Columns that can be filtered in the service view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            '',
        'Frontend module registration (disable AgentTicketService link if Ticket Service feature is not used).' =>
            '',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'به طور پیش فرض نوع صفحه نمایش برای گیرنده (برای، سی) نام در AgentTicketZoom و CustomerTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'نوع صفحه نمایش به طور پیش فرض برای فرستنده (از) نام در AgentTicketZoom و CustomerTicketZoom.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'یا نه به جمع آوری اطلاعات متا از مقالات با استفاده از فیلتر تنظیم شده در بلیط :: ظاهر :: ZoomCollectMetaFilters.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'تعریف می کند یک فیلتر برای جمع آوری تعداد CVE از متون مقاله در AgentTicketZoom. نتایج خواهد شد در یک جعبه متا بعدی به مقاله نمایش داده شود. را پر کنید در URLPreview اگر شما می خواهم برای دیدن یک پیش نمایش در هنگام حرکت ماوس خود را بالا عنصر link. این می تواند از همان URL که در URL، بلکه یک جایگزین. لطفا توجه داشته باشید که برخی از وب سایت های انکار که در درون یک iframe (مانند گوگل) نمایش داده و به این ترتیب با حالت پیش نمایش کار نمی کند.',
        'Sets the default link type of split tickets in the agent interface.' =>
            '',
        'Defines available article actions for Internal articles.' => '',
        'Defines available article actions for Phone articles.' => '',
        'Defines available article actions for Email articles.' => '',
        'Defines available article actions for invalid articles.' => '',
        'Disables the redirection to the last screen overview / dashboard after a ticket is closed.' =>
            '',
        'Defines the default queue for new tickets in the agent interface.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Znuny.xml
        'Enables/disables the Znuny package verification. If disabled, all packages are shown as verified. It\'s still recommended to use only verified packages.' =>
            '',
        'Screens for which it is possible to enable or disable dynamic fields.' =>
            '',
        'Screens for which it is possible to enable or disable default columns.' =>
            '',
        'Mapping of Ticket::Generic invoker name (key) to list of fields (content) whose values will be base-64 encoded. Fields have to be given in the following form: Field1->Field2;Field3->Field4->Field5;Field6. So a nested data structure can be given by connecting the fields with \'->\'. Content of different fields can be given by separating those fields by \';\'.' =>
            '',
        'Mapping of Ticket::Generic invoker name (key) to list of fields (content) which will be removed from the request. Fields have to be given in the following form: Field1->Field2;Field3->Field4->Field5;Field6. So a nested data structure can be given by connecting the fields with \'->\'. Different fields can be omitted by separating them by \';\'.' =>
            '',
        'Maximum number of parallel instances when using OTRS_AsynchronousInvokerExecution in invoker Ticket::Generic.' =>
            '',
        'Enables support for huge XML data in load_xml calls of CPAN library XML::LibXML. This should only be enabled if absolutely needed. Disabling this option (default) protects against denial of service through entity expansion attacks. Before enabling this option ensure that alternative measures to protect the application against this type of attack have been taken.' =>
            '',
        'Shows a link in the menu to create a unit test for the current ticket.' =>
            '',
        'Shows a link in the menu to create and send a unit test for the current ticket.' =>
            '',
        'Dynamic field backend registration.' => '',
        'Frontend module for the agent interface that provides the AJAX interface for the web service dynamic field backends.' =>
            '',
        'Frontend module for the customer interface that provides the AJAX interface for the web service dynamic field backends.' =>
            '',
        'Ticket event module that stores values of the selected web service record into the configured additional dynamic fields.' =>
            '',
        'It might happen that a dynamic field of type WebserviceDropdown or WebserviceMultiselect will be set to a value fetched from a configured web service table but the web service record will not have a value set in the field that is configured as displayed value. Enable this setting to hide those dynamic fields in the ticket information widget of AgentTicketZoom so that they will not be shown as empty.' =>
            '',
        'Mapping for field values received from form. This setting is necessary for the correct identification of the form fields. Key means value type, value means possible representation in views.' =>
            '',
        'Mapping for field values received from form which have multiple values. This setting is needed when the view shows the values of a particular field in a custom way (e.g. selectable customer user in ticket creation view). This setting is always respected first. There is also the possibility to specify an order for checking fields. (Field of customer user in ticket creation view can be saved as CustomerUser or just simple e-mail. First we need to check if CustomerKey is present (CustomerKey -> ID of CustomerUser). If not, then simply take plain text (CustomerTicketText -> E-mail)).' =>
            '',
        'Options and default field set for attributes. Values of this setting will always be passed as simple form value without possibility to further configure it in AdminDynamicField view. The keys with which the form values will be sent to the invoker can be edited in the "Default" section of this setting.' =>
            '',
        'Options and default field set for selectable attributes. Values which will be passed to invoker (ID or Name or both) can be configured in AdminDynamicField view. The keys with which the form values (ID or Name) will be sent to the invoker can be edited in the "Default" section of this setting. Example usage for field Queue: Field with selected ID and Name will send QueueID = 3 and Queue = Raw.' =>
            '',
        'Template for the out-of-office message shown to the user in the frontend. Placeholders for out-of-office information can be used via ###PlaceholderName###. Possible placeholders are: StartYear, StartMonth, StartDay, EndYear, EndMonth, EndDay, DaysRemaining.' =>
            '',
        'Message that will be shown if the agent is currently logged in.' =>
            '',
        'Message that will be shown if the agent is currently logged out.' =>
            '',
        'Assignment between action and attributes.' => '',
        'Possible types for agent interface.' => '',
        'Possible types for customer interface.' => '',
        'Assignment between type and icon.' => '',
        'List of actions that will be ignored.' => '',
        'List of sub-actions that will be ignored.' => '',
        'Registers a user preferences module for LastViewsLimit.' => '',
        'Registers a user preferences module for LastViewsPosition.' => '',
        'Registers a user preferences module for LastViewsType.' => '',
        'Pre-application module to store the current view.' => '',
        'Domains accessed through WebUserAgent module for which no proxy should be used. Separate domains by semicolon.' =>
            '',
        'User agent string to use for the WebUserAgent module. Leave empty to use the default user agent string.' =>
            '',
        'Agent recipient information which will be passed to the web service.' =>
            '',
        'Customer recipient information which will be passed to the web service.' =>
            '',
        'Parameter name for additional recipients.' => '',
        'Shows only valid dynamic fields in screen configuration (AdminDynamicFieldScreenConfiguration) if enabled.' =>
            '',
        'Shows only valid dynamic fields in dynamic field export selection (AdminDynamicFieldConfigurationImportExport) if enabled.' =>
            '',
        'Config keys and their action to activate dynamic fields in different screens, grouped by object type.' =>
            '',
        'Dynamic field screen config keys and their action for all screens that don\'t allow dynamic fields to be mandatory.' =>
            '',
        'Frontend module registration for the admin interface.' => '',
        'The user\'s Mattermost username.' => '',
        'Loader module registration for the admin interface.' => '',
        'Adds ticket attribute relations based on CSV/Excel data.' => '',
        'Available/allowed actions for ticket attribute relations.' => '',
        'Always adds empty values to the ticket attribute relations so that it is not needed to add them to the CSV/Excel data.' =>
            '',
        'Triggers event \'TicketAllChildrenClosed\' if all child tickets of a parent ticket have been closed/merged/removed.' =>
            '',
        'Ticket event module which sends new ticket notifications even for tickets without articles.' =>
            '',
        'Name of the dynamic field in which the attachment file IDs of the transition will be stored.' =>
            '',
        'Keep dynamic field attachments after each transition.' => '',
        'Format string for output of attachments in the selection list. "%1$d": article number; "%2$s": filename; "%3$s": translated object type (e.g. Article => Artikel); "%4$s": translated attachment label (e.g. "Anhang").' =>
            '',
        'Sets the service in the ticket bulk screen in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Dynamic fields shown in the ticket bulk screen of the agent interface.' =>
            '',
        'This configuration defines if a dynamic field has to be checked in the agent ticket bulk view to get set for each ticket. This prevents unwanted overwrite of dynamic field values with their default or even empty values.' =>
            '',
        'Default format for export files.' => '',
        'Separator for exported CSV files.' => '',
        'Quoting character for exported CSV files.' => '',
        'Handles changes to data of modules which use the DBCRUD base module.' =>
            '',
        'Cache settings for DBCRUD modules (default: 1 day).' => '',
        'Displays notifications for missing and expired OAuth2 tokens.' =>
            '',
        'Authentication type for sendmail module. If \'OAuth2 token\' has been selected, SendmailModule::OAuth2TokenConfigName must also be configured.' =>
            '',
        'Name of the OAuth2 token configuration to use for sending mails if \'OAuth2 token\' was configured in SendmailModule::AuthenticationType.' =>
            '',
        'Hosts that need a separate info about authentication method and token (instead of both in one line). Most commonly needed for Office 365 and Outlook.' =>
            '',
        'This option enables a dropdown which will be displayed instead of the time unit input field.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the owner view of the agent interface.' =>
            '',
        'Defines the default ticket order in the owner view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Columns that can be filtered in the owner view of the agent interface. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed.' =>
            '',
        'Agent interface notification module to see the number of tickets an agent is owner for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Defines the next possible ticket states for calendar based tickets.' =>
            '',
        'Defines the default next state.' => '',
        'Defines the default ticket priority for calendar based tickets.' =>
            '',
        'Defines if the processes should be displayed in TreeView.' => '',
        'Enables calendar based ticket creation feature only for the listed groups.' =>
            '',
        'Defines the default ticket title for calendar based tickets.' =>
            '',
        'Defines the default ticket body for calendar based tickets.' => '',
        'Defines the default article channel name for calendar based tickets.' =>
            '',
        'Defines the default visibility of articles for calendar based tickets.' =>
            '',
        'Defines the default sender type for calendar based tickets.' => '',
        'Defines the default from for calendar based tickets.' => '',
        'Defines the default history type for calendar based tickets.' =>
            '',
        'Defines the default history comment for calendar based tickets.' =>
            '',
        'Defines the default content type for calendar based tickets.' =>
            '',
        'Threshold (in minutes) for catching up with ticket creation for appointments. Tickets for due appointments will only be created if their planned creation date is not older than the configured amount of minutes. This prevents creation of tickets for e. g. recurring appointments if the ticket creation will be executed some time later.' =>
            '',
        'Creates the calendar-based tickets regularly.' => '',
        'Cleans up the calendar-based tickets regularly.' => '',
        'Maximum number of quoted lines to be added to forwarded messages.' =>
            '',
        'Re-indexes S/MIME certificate folders. Note: S/MIME needs to be enabled in SysConfig.' =>
            '',
        'Maximum length of displayed attachment filenames in the article preview of ticket zoom view.' =>
            '',
        'General settings for autocompletion in rich text editor.' => '',
        'Rich text editor configuration for autocompletion module.' => '',
        'Rich text editor configuration for autocompletion module to support templates.' =>
            '',
        'Defines which notifications about mentions should be sent.' => '',
        'Defines if the toolbar mention icon should count mentions.' => '',
        'These groups won\'t be selectable to be mentioned.' => '',
        'Limits number of users (per article) that will be marked as mentioned and be notified. Users (and users from mentioned groups) that exceed this limit will silently be ignored.' =>
            '',
        'Frontend registration of triggers for mention plugin of CKEditor.' =>
            '',
        'Frontend registration of input/output templates for mention plugin of CKEditor.' =>
            '',
        'Event handler for mentions.' => '',
        'Parameters for the dashboard backend of the last mention widget.' =>
            '',
        'Agent interface notification module to show the number of mentions.' =>
            '',
        'Module to grant access to the mentioned agents of a ticket.' => '',
        'Assignment between event and type.' => '',
        'Defines the link type for each activity.' => '',
        'List of colors in hexadecimal RGB which will be available for selection. Make sure the colors are dark enough so white text can be overlayed on them.' =>
            '',
        'Mapping of non-standard time zones to official ones.' => '',
        'Start date (YYYYMMDD) of the range to use when parsing ICS files. The used CPAN module iCal::Parser needs this to be able to parse ICS files with events in a year before the current one. The end date of the range is automatically set to 10 years in the future from the time of parsing/execution.' =>
            '',
        'Define a mapping between variables of the customer company data (keys) and dynamic fields of a ticket (values). The purpose is to store customer company data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerCompany setting.' =>
            '',
        'This event module stores attributes from customer companies in ticket dynamic fields. Please see DynamicFieldFromCustomerCompany::Mapping setting for how to configure the mapping.' =>
            '',
        'Required permissions to use the NoteToLinkedTicket screen in the agent interface.' =>
            '',
        'Sets the state of the selected linked ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Activates the selection if a note in NoteToLinkedTicket screen should be created in this origin ticket.' =>
            '',
        'Defines the default value if a note in NoteToLinkedTicket screen should be created in this origin ticket.' =>
            '',
        'Sets the default subject for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Allows adding notes in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Sets if a note in NoteToLinkedTicket screen must be filled in by the agent.' =>
            '',
        'Defines the history type for the NoteToLinkedTicket screen, which will be used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the NoteToLinkedTicket screen, which will be used for ticket history in the agent interface.' =>
            '',
        'Defines if the note in the NoteToLinkedTicket screen of the agent interface is visible for the customer by default.' =>
            '',
        'Sets the ticket type in the NoteToLinkedTicket screen of the agent interface (Ticket::Type needs to be activated).' =>
            '',
        'Sets the service in the NoteToLinkedTicket screen of the agent interface (Ticket::Service needs to be activated).' =>
            '',
        'Sets the queue in the NoteToLinkedTicket screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Shows the title field in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'User preferences backend to use.' => '',
        'Loader module registration for the public interface.' => '',
        'Deletes orphaned sessions.' => '',
        'Defines the config parameters available in the preferences view. The default redirect URL from SysConfig \'MarkTicketUnseenRedirectDefaultURL\' is used if no selection is made by the agent.' =>
            '',
        'Defines the redirect URL for setting a ticket article to \'unseen\'.' =>
            '',
        'Defines the config parameters available in the preferences view. The default redirect URL from SysConfig \'MarkTicketSeenRedirectDefaultURL\' is used if no selection is made by the agent.' =>
            '',
        'Defines the redirect URL for setting a ticket article to \'seen\'.' =>
            '',
        'Registers a link in the ticket menu to mark a ticket as unseen.' =>
            '',
        'Registers a link in the ticket menu to mark a ticket as seen.' =>
            '',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as unseen.' =>
            '',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as seen.' =>
            '',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "agent".' =>
            '',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "system".' =>
            '',
        'Adds the field mapping for AgentTicketActionCommon for an unknown action. Used by Znuny.Form.Input.' =>
            '',

        # XML Definition: scripts/database/initial_insert.xml
        'invalid-temporarily' => 'موقتا غیر معتبر',
        'Group for default access.' => 'گروه برای دسترسی پیش فرض.',
        'Group of all administrators.' => 'گروه از همه مدیران.',
        'Group for statistics access.' => 'گروه برای دسترسی آمار.',
        'Group for time accounting web service access.' => '',
        'new' => 'جدید',
        'All new state types (default: viewable).' => 'تمام انواع حالت جدید (به طور پیش فرض: قابل مشاهده).',
        'open' => 'باز',
        'All open state types (default: viewable).' => 'تمام انواع حالت باز (به طور پیش فرض: قابل مشاهده).',
        'closed' => 'بسته شده',
        'All closed state types (default: not viewable).' => 'تمام انواع حالت بسته (به طور پیش فرض: قابل مشاهده نیست).',
        'pending reminder' => 'یادآوری حالت معلق',
        'All \'pending reminder\' state types (default: viewable).' => 'همه "در انتظار یادآوری، انواع حالت (به طور پیش فرض: قابل مشاهده).',
        'pending auto' => 'حالت خودکار معلق',
        'All \'pending auto *\' state types (default: viewable).' => 'همه "در انتظار خودکار * انواع حالت (به طور پیش فرض: قابل مشاهده).',
        'removed' => 'حذف شده',
        'All \'removed\' state types (default: not viewable).' => 'تمام انواع حالت حذف (به طور پیش فرض: قابل مشاهده نیست).',
        'merged' => 'ادغام شد',
        'State type for merged tickets (default: not viewable).' => 'نوع حالت برای درخواست ادغام (به طور پیش فرض: قابل مشاهده نیست).',
        'New ticket created by customer.' => 'درخواست جدید ایجاد شده توسط مشتری.',
        'closed successful' => 'با موفقیت بسته شد',
        'Ticket is closed successful.' => 'درخواست موفق بسته شده است.',
        'closed unsuccessful' => 'با موفقیت بسته نشد',
        'Ticket is closed unsuccessful.' => 'درخواست ناموفق بسته شده است.',
        'Open tickets.' => 'درخواست را باز کنید.',
        'Customer removed ticket.' => 'درخواست مشتری حذف خواهند شد.',
        'Ticket is pending for agent reminder.' => 'درخواست برای یادآوری عامل در انتظار.',
        'pending auto close+' => 'حالت تعلیق-بستن خودکار(+)',
        'Ticket is pending for automatic close.' => 'درخواست  نزدیک اتوماتیک در انتظار.',
        'pending auto close-' => 'حالت تعلیق-بستن خودکار(-)',
        'State for merged tickets.' => 'حالت برای ادغام درخواست.',
        'system standard salutation (en)' => 'سیستم سلام استاندارد (FA)',
        'Standard Salutation.' => 'سلام استاندارد.',
        'system standard signature (en)' => 'سیستم امضای استاندارد (FA)',
        'Standard Signature.' => 'امضاء استاندارد.',
        'Standard Address.' => ' نشانی استاندارد.',
        'possible' => 'بله',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'پیگیری برای درخواست بسته امکان پذیر است. درخواست بازگشایی خواهد شد.',
        'reject' => 'خیر',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'پیگیری برای درخواست بسته امکان پذیر نیست. بدون درخواست جدید ایجاد خواهد شد.',
        'new ticket' => 'درخواست جدید',
        'Follow-ups for closed tickets are not possible. A new ticket will be created.' =>
            '',
        'Postmaster queue.' => 'صف رئيس پست.',
        'All default incoming tickets.' => 'همه به طور پیش فرض درخواست ورودی.',
        'All junk tickets.' => 'تمام درخواست های ناخواسته.',
        'All misc tickets.' => 'تمام درخواست متفرقه.',
        'auto reply' => 'پاسخ خودکار',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'پاسخ خودکار خواهد شد که یک بلیط جدید بعد از ارسال ایجاد شده است.',
        'auto reject' => 'رد خودکار ',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'به صورت خودکار رد خواهد شد که پس از پیگیری رد شده است ارسال (در صورت صف گزینه پیگیری است \ "رد ").',
        'auto follow up' => 'پیگیری خودکار',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'تایید خودکار است که پس از پیگیری فرستاده است یک بلیط برای دریافت شده است (در مورد صف پیگیری گزینه \ "ممکن " است).',
        'auto reply/new ticket' => 'پاسخ خودکار/تیکت جدید',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'پاسخ خودکار خواهد شد که پس از پیگیری ارسال رد شده است و یک بلیط جدید ایجاد شده است (در مورد صف پیگیری گزینه است \ "بلیط جدید ").',
        'auto remove' => 'حذف خودکار',
        'Auto remove will be sent out after a customer removed the request.' =>
            'حذف خودکار ارسال می شود پس از یک مشتری درخواست حذف شدند.',
        'default reply (after new ticket has been created)' => 'به طور پیش فرض پاسخ (پس از بلیط جدید ایجاد شده است)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'به طور پیش فرض رد (پس از پیگیری و رد یک بلیط بسته)',
        'default follow-up (after a ticket follow-up has been added)' => 'به طور پیش فرض پیگیری (پس از یک بلیط پیگیری اضافه شده است)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'به طور پیش فرض / بلیط جدید ایجاد رد (پس از بسته پیگیری با ایجاد بلیط جدید)',
        'Unclassified' => 'طبقه بندی نشده',
        '1 very low' => '۱ خیلی پائین',
        '2 low' => '۲ پائین',
        '3 normal' => '۳ عادی',
        '4 high' => '۴ بالا',
        '5 very high' => '۵ خیلی بالا',
        'unlock' => 'تحویل داده شده',
        'lock' => 'تحویل گرفته شده',
        'tmp_lock' => 'tmp_lock',
        'agent' => 'کارشناس',
        'system' => 'سیستم',
        'customer' => 'مشترک',
        'Ticket create notification' => 'درخواست ایجاد اطلاع رسانی',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'شما اطلاع رسانی در هر زمان یک بلیط جدید در یکی از \ شما ایجاد می شود دریافت "صف من " یا \ "سرویس های من ".',
        'Ticket follow-up notification (unlocked)' => 'درخواست پیگیری اطلاع رسانی (کلیک کنید)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'شما یک اخطار دریافت خواهید اگر یک مشتری می فرستد یک پیگیری یک بلیط باز شده است که در \ خود را به "صف من " یا \ "سرویس های من ".',
        'Ticket follow-up notification (locked)' => 'درخواست پیگیری اطلاع رسانی (قفل شده)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'شما یک اخطار دریافت خواهید اگر یک مشتری یک پیگیری یک بلیط قفل شده که شما صاحب بلیط یا مسئول هستند به ارسال می کند.',
        'Ticket lock timeout notification' => 'پایان مهلت تحویل گرفتن درخواست را به من اطلاع بده',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'شما اطلاع رسانی به زودی به عنوان یک بلیط متعلق به شما به طور خودکار باز دریافت خواهید کرد.',
        'Ticket owner update notification' => 'درخواست  شخصی به روزرسانی اطلاعات',
        'Ticket responsible update notification' => 'درخواست به روز رسانی اطلاعات مسئول',
        'Ticket new note notification' => 'درخواست اطلاع رسانی یادداشت جدید',
        'Ticket queue update notification' => 'درخواست به روز رسانی اطلاعات صف',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'شما یک اخطار دریافت خواهید اگر یک بلیط به یکی از \ خود نقل مکان کرد "صف من ".',
        'Ticket pending reminder notification (locked)' => 'درخواست در انتظار آگاه شدن از طریق یادآوری (قفل شده)',
        'Ticket pending reminder notification (unlocked)' => 'درخواست در انتظار آگاه شدن از طریق یادآوری (قفل)',
        'Ticket escalation notification' => 'درخواست تشدید اطلاع رسانی ',
        'Ticket escalation warning notification' => 'درخواست  تشدید اطلاع رسانی هشدار دهنده',
        'Ticket service update notification' => 'درخواست به روز رسانی اطلاع رسانی خدمات',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'شما یک اخطار دریافت خواهید اگر سرویس یک بلیط به یکی از \ خود را تغییر "سرویس های من ".',
        'Appointment reminder notification' => '',
        'You will receive a notification each time a reminder time is reached for one of your appointments.' =>
            '',
        'Ticket email delivery failure notification' => '',
        'Mention notification' => '',

        # JS File: var/httpd/htdocs/js/Core.AJAX.js
        'Error during AJAX communication. Status: %s, Error: %s' => '',
        'This window must be called from compose window.' => '',

        # JS File: var/httpd/htdocs/js/Core.Activity.js
        'An error occurred' => '',
        'The activity could not be created. %s is needed.' => '',
        'The activity could not be created.' => '',
        'The activity could not be updated.' => '',
        'The activity could not be deleted.' => '',
        'The activity could not be marked as new.' => '',
        'The activity could not be marked as seen.' => '',
        'The activities could not be marked as seen.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ACL.js
        'Add all' => 'اضافه کردن همه',
        'An item with this name is already present.' => 'یک آیتم با این نام از قبل وجود دارد.',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'این مورد را ارزیابی هنوز شامل آیتم های زیر. آیا مطمئن هستید که می خواهید به حذف این مورد را ارزیابی از جمله آیتم های زیر است؟',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.AppointmentCalendar.Manage.js
        'Press Ctrl+C (Cmd+C) to copy to clipboard' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Attachment.js
        'Delete this Attachment' => '',
        'Deleting attachment...' => '',
        'There was an error deleting the attachment. Please check the logs for more information.' =>
            '',
        'Attachment was deleted successfully.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.DynamicField.js
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'آیا شما واقعا می خواهید  این زمینه پویارا حذف کنید؟ تمام داده های مرتبط از دست خواهد رفت.',
        'Delete field' => 'حذف زمینه',
        'Deleting the field and its data. This may take a while...' => 'حذف رشته و داده های آن. این ممکن است یک مدت طول بکشد.....',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericAgent.js
        'Remove this dynamic field' => '',
        'Remove selection' => 'حذف انتخاب',
        'An error occurred during communication.' => 'یک خطا در هنگام برقراری ارتباط رخ داده است.',
        'Duplicate event.' => 'تکرار رویداد.',
        'This event is already attached to the job, Please use a different one.' =>
            'این رویداد در حال حاضر به این کار متصل است، لطفا یک رویداد دیگر را استفاده کنید.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceDebugger.js
        'Request Details' => 'جزئیات درخواست',
        'Request Details for Communication ID' => '',
        'Show or hide the content.' => 'نمایش یا مخفی کردن محتوا.',
        'Clear debug log' => 'پاک کردن گزارش اشکال زدایی',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceErrorHandling.js
        'Delete error handling module' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvoker.js
        'It is not possible to add a new event trigger because the event is not set.' =>
            '',
        'Delete this Invoker' => 'حذف این Invoker',
        'Delete this Event Trigger' => 'حذف این رویداد راه انداز',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvokerEvent.js
        'Sorry, the only existing condition can\'t be removed.' => '',
        'Sorry, the only existing field can\'t be removed.' => '',
        'Delete conditions' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceMapping.js
        'Mapping for Key %s' => '',
        'Mapping for Key' => '',
        'Delete this Key Mapping' => 'حذف این نگاشت کلید',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceOperation.js
        'Delete this Operation' => 'حذف این عملیات',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceWebservice.js
        'Clone web service' => 'وب سرویس کلون',
        'Delete operation' => 'حذف عملیات',
        'Delete invoker' => 'حذف invoker',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Group.js
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'هشدار: اگر قبل از اعمال تغییرات مناسب در SysConfig نام گروه admin را تغییر دهید، دسترسی‌تان به بخش مدیریت سیستم از بین می‌رود! اگر چنین اتفاقی افتاد، نام آن را از طریق SQL دوباره به admin تغییر دهید.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js
        'Delete this Mail Account' => '',
        'Deleting the mail account and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.NotificationEvent.js
        'Do you really want to delete this notification language?' => 'آیا شما واقعا حذف این زبان اطلاع رسانی را میخواهید؟',
        'Do you really want to delete this notification?' => 'آیا واقعا میخواهید این اطلاعات را حذف کنید؟',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.OAuth2TokenManagement.js
        'Do you really want to delete this token and its configuration?' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PGP.js
        'Do you really want to delete this key?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PackageManager.js
        'There is a package upgrade process running, click here to see status information about the upgrade progress.' =>
            '',
        'A package upgrade was recently finished. Click here to see the results.' =>
            '',
        'No response from get package upgrade result.' => '',
        'Update all packages' => '',
        'Dismiss' => '',
        'Update All Packages' => '',
        'No response from package upgrade all.' => '',
        'Currently not possible' => '',
        'This is currently disabled because of an ongoing package upgrade.' =>
            '',
        'This option is currently disabled because the Znuny Daemon is not running.' =>
            '',
        'Are you sure you want to update all installed packages?' => '',
        'No response from get package upgrade run status.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PostMasterFilter.js
        'Delete this PostMasterFilter' => '',
        'Deleting the postmaster filter and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.Canvas.js
        'Remove Entity from canvas' => 'حذف نهاد از بوم',
        'No TransitionActions assigned.' => 'بدون TransitionActions اختصاص داده است.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'هیچ تبادل اختصاص داده است. فقط یک گفت و گو فعالیت از لیست در سمت چپ انتخاب کنید و آن را در اینجا بکشید.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'این فعالیت را نمی توان حذف کرد چرا که آن شروع فعالیت است . ',
        'Remove the Transition from this Process' => 'حذف انتقال از این فرایند',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.js
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'به محض این که شما با استفاده از این دکمه و یا لینک، شما این صفحه نمایش را ترک و وضعیت فعلی خود را به طور خودکار ذخیره شده است. می خواهید ادامه دهید؟',
        'Delete Entity' => 'حذف نهاد',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'این فعالیت در حال حاضر در فرایند استفاده می شود. شما می توانید آن را دو باره اضافه کنید!',
        'Error during AJAX communication' => '',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'انتقال بیارتباط است در حال حاضر بر روی بوم قرار داده است. لطفا این انتقال برای اولین بار قبل از قرار دادن انتقال دیگر متصل شوید.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'این انتقال در حال حاضر برای این فعالیت استفاده می شود. شما می توانید از آن دو بار استفاده کنید !',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'این TransitionAction قبلا در این مسیر استفاده می شود. شما می توانید از آن استفاده کنید دو بار!',
        'Hide EntityIDs' => 'مخفی کردن EntityIDs',
        'Edit Field Details' => 'ویرایش اطلاعات درست',
        'Customer interface does not support articles not visible for customers.' =>
            '',
        'Sorry, the only existing parameter can\'t be removed.' => '',
        'Are you sure you want to overwrite the config parameters?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SMIME.js
        'Do you really want to delete this certificate?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SupportDataCollector.js
        'Generating...' => 'تولید ...',
        'It was not possible to generate the Support Bundle.' => 'ممکن بود برای تولید پشتیبانی بسته نرم افزاری.',
        'Generate Result' => ' نتیجه تولید',
        'Support Bundle' => 'پشتیبانی بسته نرم افزاری',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SysConfig.Entity.js
        'It is not possible to set this entry to invalid. All affected configuration settings have to be changed beforehand.' =>
            '',
        'Cannot proceed' => '',
        'Update manually' => '',
        'You can either have the affected settings updated automatically to reflect the changes you just made or do it on your own by pressing \'update manually\'.' =>
            '',
        'Save and update automatically' => '',
        'Don\'t save, update manually' => '',
        'The item you\'re currently viewing is part of a not-yet-deployed configuration setting, which makes it impossible to edit it in its current state. Please wait until the setting has been deployed. If you\'re unsure what to do next, please contact your system administrator.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemConfiguration.js
        'Loading...' => 'بارگذاری...',
        'Search the System Configuration' => '',
        'Please enter at least one search word to find anything.' => '',
        'Unfortunately deploying is currently not possible, maybe because another agent is already deploying. Please try again later.' =>
            '',
        'Deploy' => '',
        'The deployment is already running.' => '',
        'Deployment successful. You\'re being redirected...' => '',
        'There was an error. Please save all settings you are editing and check the logs for more information.' =>
            '',
        'Reset option is required!' => '',
        'By restoring this deployment all settings will be reverted to the value they had at the time of the deployment. Do you really want to continue?' =>
            '',
        'Keys with values can\'t be renamed. Please remove this key/value pair instead and re-add it afterwards.' =>
            '',
        'Unlock setting.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemMaintenance.js
        'Do you really want to delete this scheduled system maintenance?' =>
            'آیا شما واقعا می خواهید  این تعمیر و نگهداری سیستم های برنامه ریزی شده را حذف کنید؟',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Template.js
        'Delete this Template' => '',
        'Deleting the template and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.AppointmentCalendar.js
        'Jump' => '',
        'Timeline Month' => '',
        'Timeline Week' => '',
        'Timeline Day' => '',
        'Previous' => 'قبلی',
        'Resources' => '',
        'Su' => 'یک',
        'Mo' => 'دو',
        'Tu' => 'سه',
        'We' => 'چهار',
        'Th' => 'پنج',
        'Fr' => 'جمعه',
        'Sa' => 'شنبه',
        'This is a repeating appointment' => '',
        'Would you like to edit just this occurrence or all occurrences?' =>
            '',
        'All occurrences' => '',
        'Just this occurrence' => '',
        'Too many active calendars' => '',
        'Please either turn some off first or increase the limit in configuration.' =>
            '',
        'Restore default settings' => '',
        'Are you sure you want to delete this appointment? This operation cannot be undone.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerSearch.js
        'First select a customer user, then select a customer ID to assign to this ticket.' =>
            '',
        'Duplicated entry' => 'ورود تکراری',
        'It is going to be deleted from the field, please try again.' => 'آن است که رفتن به از میدان حذف شود، لطفا دوباره امتحان کنید.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerUserAddressBook.js
        'Please enter at least one search value or * to find anything.' =>
            'لطفا حداقل یک مقدار مورد جستجو را وارد کنید یا * به پیدا کردن هر چیزی.',
        'Insert selected customer user(s) into the "%s:" field.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Daemon.js
        'Information about the Znuny Daemon' => 'اطلاعات در مورد Znuny دیمون',

        # JS File: var/httpd/htdocs/js/Core.Agent.Dashboard.js
        'Please check the fields marked as red for valid inputs.' => 'لطفا فیلدهای مشخص شده به عنوان قرمز برای ورودی های معتبر را بررسی کنید.',
        'month' => 'ماه',
        'Remove active filters for this widget.' => 'حذف فیلتر فعال برای این عنصر است.',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.SearchForm.js
        'Please wait...' => '',
        'Searching for linkable objects. This may take a while...' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.js
        'Do you really want to delete this link?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Login.js
        'Are you using a browser plugin like AdBlock or AdBlockPlus? This can cause several issues and we highly recommend you to add an exception for this domain.' =>
            '',
        'Do not show this warning again.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Preferences.js
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'با عرض پوزش، اما شما می توانید از تمام روش برای اطلاعیه مشخص شده به عنوان اجباری را غیر فعال کنید.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'با عرض پوزش، اما شما می توانید از تمام روش برای این اطلاع رسانی را غیر فعال کنید.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.' =>
            '',
        'An unknown error occurred. Please contact the administrator.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Responsive.js
        'Switch to desktop mode' => 'تغییر به حالت دسکتاپ',

        # JS File: var/httpd/htdocs/js/Core.Agent.Search.js
        'Please remove the following words from your search as they cannot be searched for:' =>
            'لطفا کلمات زیر از جستجوی خود را حذف به آنها می تواند قابل جستجو نیستند:',

        # JS File: var/httpd/htdocs/js/Core.Agent.SharedSecretGenerator.js
        'Generate' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.SortedTree.js
        'This element has children elements and can currently not be removed.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketAction.js
        'Select a customer ID to assign to this ticket' => '',
        'Do you really want to continue?' => 'آیا واقعا میخواهید ادامه دهید؟',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketBulk.js
        ' ...and %s more' => '',
        ' ...show less' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketFormDraft.js
        'Add new draft' => '',
        'Delete draft' => '',
        'There are no more drafts available.' => '',
        'It was not possible to delete this draft.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketZoom.js
        'Article filter' => 'فیلتر مطلب',
        'Apply' => 'اعمال',
        'Event Type Filter' => 'نوع رویداد فیلتر',

        # JS File: var/httpd/htdocs/js/Core.Agent.js
        'Slide the navigation bar' => 'اسلاید نوار ناوبری',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'لطفا حالت سازگاری در اینترنت اکسپلورر را خاموش کنید !',

        # JS File: var/httpd/htdocs/js/Core.App.Responsive.js
        'Switch to mobile mode' => 'تغییر به حالت همراه',

        # JS File: var/httpd/htdocs/js/Core.App.js
        'Error: Browser Check failed!' => '',
        'Reload page' => 'بارگذاری مجدد صفحه',
        'Reload page (%ss)' => '',

        # JS File: var/httpd/htdocs/js/Core.Debug.js
        'Namespace %s could not be initialized, because %s could not be found.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Exception.js
        'An error occurred! Please check the browser error log for more details!' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Form.Validate.js
        'One or more errors occurred!' => 'یک یا جچند خطا رخ داده است!',

        # JS File: var/httpd/htdocs/js/Core.Installer.js
        'Mail check successful.' => 'کنترل تنظیمات ایمیل موفقیت‌آمیز بود.',
        'Error in the mail settings. Please correct and try again.' => 'خطا در تنظیمات ایمیل. لطفا تصحیح نموده و مجددا تلاش نمایید.',

        # JS File: var/httpd/htdocs/js/Core.SystemConfiguration.js
        'Open this node in a new window' => '',
        'Please add values for all keys before saving the setting.' => '',
        'The key must not be empty.' => '',
        'A key with this name (\'%s\') already exists.' => '',
        'Do you really want to revert this setting to its historical value?' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.UI.Datepicker.js
        'Open date selection' => 'باز کردن انتخاب تاریخ',
        'Invalid date (need a future date)!' => 'تاریخ نامعتبر (نیاز به تاریخی در آینده)!',
        'Invalid date (need a past date)!' => 'تاریخ نامعتبر (نیاز به یک تاریخ گذشته)!',

        # JS File: var/httpd/htdocs/js/Core.UI.InputFields.js
        'Not available' => 'در دسترس نیست',
        'and %s more...' => 'و %s بیشتر ...',
        'Show current selection' => '',
        'Current selection' => '',
        'Clear all' => 'همه را پاک کن ',
        'Filters' => 'فیلترها ',
        'Clear search' => ' پاک کردن جستجو',

        # JS File: var/httpd/htdocs/js/Core.UI.Popup.js
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'اگر اکنون این صفحه را ترک نمایید، تمام پنجره‌های popup باز شده نیز بسته خواهند شد!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'popup ای از این صفحه هم اکنون باز است. آیا می‌خواهید این را بسته و آن را به جایش بارگذاری نمایید؟',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'پنجره popup نمی‌تواند باز شود. لطفا همه مسدودکننده‌های popup را برای این نرم‌افزار غیرفعال نمایید.',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.Sort.js
        'Ascending sort applied, ' => '',
        'Descending sort applied, ' => '',
        'No sort applied, ' => '',
        'sorting is disabled' => '',
        'activate to apply an ascending sort' => '',
        'activate to apply a descending sort' => '',
        'activate to remove the sort' => '',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.js
        'Remove the filter' => '',

        # JS File: var/httpd/htdocs/js/Core.UI.TreeSelection.js
        'There are currently no elements available to select from.' => 'در حال حاضر هیچ یک از عناصر در دسترس برای انتخاب  وجود ندارد.',

        # JS File: var/httpd/htdocs/js/Core.UI.js
        'Please only select one file for upload.' => '',
        'Sorry, you can only upload one file here.' => '',
        'Sorry, you can only upload %s files.' => '',
        'Please only select at most %s files for upload.' => '',
        'The following files are not allowed to be uploaded: %s' => '',
        'The following files exceed the maximum allowed size per file of %s and were not uploaded: %s' =>
            '',
        'The names of the following files exceed the maximum allowed length of %s characters and were not uploaded: %s' =>
            '',
        'The following files were already uploaded and have not been uploaded again: %s' =>
            '',
        'No space left for the following files: %s' => '',
        'Available space %s of %s.' => '',
        'Upload information' => '',
        'An unknown error occurred when deleting the attachment. Please try again. If the error persists, please contact your system administrator.' =>
            '',

        # JS File: var/httpd/htdocs/js/test/Core.Language.UnitTest.js
        'yes' => 'بله',
        'no' => 'خیر',
        'This is %s' => '',
        'Complex %s with %s arguments' => '',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js
        'Grouped' => 'گروه بندی شده',
        'Stacked' => 'انباشته',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js
        'Stream' => 'جریان',
        'Expanded' => 'Expanded',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
مشترک گرامی،

متاسفانه شماره درخواست معتبری در عنوان تشخیص داده نشد و
بنابراین این پیام ایمیلی قابل پردازش نیست.

لطفا یک درخواست جدید توسط پنل کاربری مشترک ایجاد کنید.

از همراهمی شما متشکریم

 تیم پشتیبانی
',
        ' (work units)' => ' (واحد کار)',
        ' 2 minutes' => '۲ دقیقه',
        ' 5 minutes' => '۵ دقیقه',
        ' 7 minutes' => '۷ دقیقه',
        '%s' => '٪s',
        '(UserLogin) Firstname Lastname' => '(صفحهی) نام نام خانوادگی',
        '(UserLogin) Lastname Firstname' => '(صفحهی) نام خانوادگی FIRSTNAME',
        '(UserLogin) Lastname, Firstname' => '(صفحهی) نام خانوادگی، نام',
        '0 - Disabled' => '',
        '1 - Available' => '',
        '1 - Enabled' => '',
        '10 Minutes' => '',
        '100 (Expert)' => '100 (کارشناس)',
        '15 Minutes' => '',
        '2 - Enabled and required' => '',
        '2 - Enabled and shown by default' => '',
        '2 - Enabled by default' => '',
        '2 Minutes' => '',
        '200 (Advanced)' => '200پیشرفته',
        '30 Minutes' => '',
        '300 (Beginner)' => '300 (مبتدی)',
        '5 Minutes' => '',
        'A TicketWatcher Module.' => 'ماژول TicketWatcher.',
        'A Website' => 'یک وبسایت',
        'A picture' => 'یک تصویر',
        'AJAX functions for notification event transport web service.' =>
            '',
        'AJAX interface for the web service dynamic field backends.' => '',
        'AccountedTime' => 'AccountedTime',
        'Activation of dynamic fields for screens.' => '',
        'Activity LinkTarget' => '',
        'Activity Notification' => '',
        'Activity.' => '',
        'ActivityID' => 'ActivityID',
        'Add a note to this ticket' => 'اضافه کردن یک یادداشت  به این بلیط',
        'Add an inbound phone call to this ticket' => 'اضافه کردن یک تماس تلفنی بین المللی به درون این درخواست',
        'Add an outbound phone call to this ticket' => 'اضافه کردن یک تماس تلفنی به این درخواست',
        'Added %s time unit(s), for a total of %s time unit(s).' => '',
        'Added email. %s' => 'اضافه شده ایمیل. %s',
        'Added follow-up to ticket [%s]. %s' => '',
        'Added link to ticket "%s".' => 'اضافه شدن لینک به بلیط \ " %s ".',
        'Added note (%s).' => '',
        'Added phone call from customer.' => '',
        'Added phone call to customer.' => '',
        'Added subscription for user "%s".' => 'عضویت اضافه شده برای کاربر "%s".',
        'Added system request (%s).' => '',
        'Added web request from customer.' => '',
        'Admin' => 'مدیریت سیستم',
        'Admin Area.' => 'بخش مدیریت.',
        'Admin Notification' => 'اعلام مدیر سیستم',
        'Admin configuration dialog for dynamic field types WebserviceDropdown and WebserviceMultiselect' =>
            '',
        'Admin modules overview.' => '',
        'Admin.' => 'مدیر',
        'Administration' => '',
        'Agent Customer Search' => '',
        'Agent Customer Search.' => '',
        'Agent Name' => 'نام نماینده',
        'Agent Name + FromSeparator + System Address Display Name' => 'نام نماینده + FromSeparator + سیستم نام آدرس ها',
        'Agent Preferences.' => 'تنظیمات عامل.',
        'Agent Statistics.' => '',
        'Agent User Search' => '',
        'Agent User Search.' => '',
        'All CustomerIDs of a customer user.' => '',
        'All customer users of a CustomerID' => 'همه کاربران مشتری از CustomerID',
        'All escalated tickets' => 'تمام درخواست‌هایی که زمان پاسخگویی آن‌ها رو به پایان است',
        'All new tickets, these tickets have not been worked on yet' => 'تمام درخواست‌های جدید، روی این درخواست‌ها هنوز کاری انجام شده',
        'All open tickets, these tickets have already been worked on.' =>
            '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'تمام درخواست‌هایی که برای آن‌ها یک یادآوری تنظیم شده و زمان یادآوری فرا رسیده است',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'اجازه می دهد تا شرایط جستجو شده در جستجوی بلیط از رابط عامل عمومی است. با این ویژگی شما می توانید به عنوان مثال عنوان بلیط با این نوع از شرایط مانند \ جستجو "(* key1 * && * key2 *) " یا \ "(* key1 * || * key2 *) ".',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'اجازه می دهد تا داشتن یک دید کلی قطع متوسط ​​بلیط (CustomerInfo => 1 - نشان می دهد نیز اطلاعات مربوط به مشتری).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'اجازه می دهد تا داشتن یک دید کلی فرمت کوچک بلیط (CustomerInfo => 1 - نشان می دهد نیز اطلاعات مربوط به مشتری).',
        'Always show RichText if available' => 'همیشه RichText  نشان می دهد اگر موجود باشد',
        'An additional screen to add notes to a linked ticket.' => '',
        'Answer' => 'پاسخ',
        'Appointment Calendar overview page.' => '',
        'Appointment Notifications' => '',
        'Appointment edit screen.' => '',
        'Appointment list' => '',
        'Appointment list.' => '',
        'Appointment notifications' => '',
        'Arabic (Saudi Arabia)' => 'عربی (عربستان سعودی)',
        'ArticleTree' => 'ArticleTree',
        'Attachment Name' => 'نام فایل پیوست',
        'Avatar' => '',
        'Based on global RichText setting' => 'بر اساس تنظیم RichText جهانی',
        'Bounced to "%s".' => 'لینک ثابت به : "%s"',
        'Bulgarian' => 'بلغاری',
        'Bulk Action' => 'اعمال کلی',
        'CSV Separator' => 'جداکننده CSV',
        'Calendar manage screen.' => '',
        'Catalan' => 'کاتالان',
        'Change password' => 'تغییر رمز عبور',
        'Change queue!' => 'تغییر صف درخواست!',
        'Change the customer for this ticket' => 'تغییر مشتری  برای این درخواست',
        'Change the free fields for this ticket' => 'تغییر زمینه رایگان برای این درخواست',
        'Change the owner for this ticket' => 'تغییرمالک برای این درخواست ',
        'Change the priority for this ticket' => 'تغییر اولویت  برای این درخواست',
        'Change the responsible for this ticket' => 'تغییر مسئول برای این درخواست',
        'Change your avatar image.' => '',
        'Change your password and more.' => '',
        'Changed SLA to "%s" (%s).' => '',
        'Changed archive state to "%s".' => '',
        'Changed customer to "%s".' => '',
        'Changed dynamic field %s from "%s" to "%s".' => '',
        'Changed owner to "%s" (%s).' => '',
        'Changed pending time to "%s".' => '',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'اولویت تغییر از \ " %s " ( %s ) به \ " %s " ( %s ).',
        'Changed queue to "%s" (%s) from "%s" (%s).' => '',
        'Changed responsible to "%s" (%s).' => '',
        'Changed service to "%s" (%s).' => '',
        'Changed state from "%s" to "%s".' => '',
        'Changed title from "%s" to "%s".' => '',
        'Changed type from "%s" (%s) to "%s" (%s).' => '',
        'Chat communication channel.' => '',
        'Checkbox' => 'قابل انتخاب',
        'Child' => 'فرعی',
        'Chinese (Simplified)' => 'چینی (ساده شده)',
        'Chinese (Traditional)' => 'چینی (سنتی)',
        'Choose for which kind of appointment changes you want to receive notifications.' =>
            '',
        'Choose for which kind of ticket changes you want to receive notifications. Please note that you can\'t completely disable notifications marked as mandatory.' =>
            '',
        'Choose which notifications you\'d like to receive.' => '',
        'Christmas Eve' => 'شب کریسمس',
        'Close this ticket' => 'بستن این درخواست ',
        'Closed tickets (customer user)' => 'درخواست های بسته (کاربران مشتری)',
        'Closed tickets (customer)' => 'درخواست های بسته (مشتری)',
        'Column ticket filters for Ticket Overviews type "Small".' => 'فیلتر درخواست ستون برای نوع درخواست مروری \ "کوچک ".',
        'Comment2' => '1 نظر',
        'Communication & Notifications' => '',
        'Communication Log GUI' => '',
        'Communication log limit per page for Communication Log Overview.' =>
            '',
        'CommunicationLog Overview Limit' => '',
        'Company Status' => 'وضعیت شرکت',
        'Company Tickets.' => 'درخواست شرکت.',
        'Compat module for AgentZoom to AgentTicketZoom.' => 'ماژول Compat برای AgentZoom به AgentTicketZoom.',
        'Complex' => 'پیچیده',
        'Compose' => 'ارسال',
        'Configure Processes.' => ' پردازش پیکربندی .',
        'Configure and manage ACLs.' => 'پیکربندی و مدیریت ACL ها است.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'پیکربندی که صفحه نمایش باید نشان داده شود پس از یک درخواست جدید ایجاد شده است.',
        'Configure which screen should be shown after marking a ticket or article as seen.' =>
            '',
        'Configure which screen should be shown after marking a ticket or article as unseen.' =>
            '',
        'Create New process ticket.' => 'ساختن درخواست روند جدید.',
        'Create Process Ticket' => '',
        'Create Ticket' => '',
        'Create a new calendar appointment linked to this ticket' => '',
        'Create a unit test file' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'ساخت و مدیریت توافقات سطح سرویس (SLA)',
        'Create and manage agents.' => 'ساخت و مدیریت کارشناسان',
        'Create and manage appointment notifications.' => '',
        'Create and manage attachments.' => 'ساخت و مدیریت پیوست‌ها',
        'Create and manage calendars.' => '',
        'Create and manage customer users.' => 'ایجاد و مدیریت کاربران مشتری می باشد.',
        'Create and manage customers.' => 'ساخت و مدیریت مشترکین',
        'Create and manage dynamic fields.' => 'ایجاد و مدیریت زمینه های پویا.',
        'Create and manage groups.' => 'ساخت و مدیریت گروه‌ها',
        'Create and manage queues.' => 'ساخت و مدیریت صف‌های درخواست',
        'Create and manage responses that are automatically sent.' => 'ساخت و مدیریت پاسخ‌های خودکار',
        'Create and manage roles.' => 'ساخت و مدیریت نقش‌ها',
        'Create and manage salutations.' => 'ساخت و مدیریت عناوین',
        'Create and manage services.' => 'ساخت و مدیریت خدمات',
        'Create and manage signatures.' => 'ساخت و مدیریت امضاءها',
        'Create and manage templates.' => 'ایجاد و مدیریت قالب.',
        'Create and manage ticket notifications.' => 'ایجاد و مدیریت اطلاعیه درخواست',
        'Create and manage ticket priorities.' => 'ساخت و مدیریت خصوصیات درخواست',
        'Create and manage ticket states.' => 'ساخت و مدیریت وضعیت درخواست‌ها',
        'Create and manage ticket types.' => 'ساخت و مدیریت انواع درخواست',
        'Create and manage web services.' => 'ایجاد و مدیریت خدمات وب .',
        'Create new Ticket.' => 'ایجاد درخواست جدید.',
        'Create new appointment.' => '',
        'Create new email ticket and send this out (outbound).' => 'ساختن درخواست ایمیل های جدید و ارسال این (خروجی).',
        'Create new email ticket.' => 'ساختن درخواست ایمیل جدید.',
        'Create new phone ticket (inbound).' => 'ساختن درخواست گوشی جدید (ورودی).',
        'Create new phone ticket.' => 'ساختن درخواست گوشی جدید.',
        'Create new process ticket.' => 'ساختن درخواست فرآیند جدید.',
        'Create tickets.' => 'ساختن درخواست',
        'Created ticket [%s] in "%s" with priority "%s" and state "%s".' =>
            '',
        'Creates a unit test file for this ticket and sends it to Znuny.' =>
            '',
        'Creates a unit test file for this ticket.' => '',
        'Croatian' => 'کرواتی',
        'Customer Administration' => 'اداره مشتری',
        'Customer Companies' => 'شرکت/سازمان‌های مشترک',
        'Customer IDs' => '',
        'Customer Information Center Search.' => ' جستجو مرکز اطلاعات مشتری.',
        'Customer Information Center search.' => '',
        'Customer Information Center.' => 'مرکز اطلاعات مشتری.',
        'Customer Ticket Print Module.' => 'درخواست مشتری چاپ ماژول.',
        'Customer User Administration' => 'مشتری اداره کاربری',
        'Customer User Information' => '',
        'Customer User Information Center Search.' => '',
        'Customer User Information Center search.' => '',
        'Customer User Information Center.' => '',
        'Customer User-Customer Relations' => '',
        'Customer preferences.' => 'ترجیحات مشتری.',
        'Customer ticket overview' => 'مروری درخواست مشتری',
        'Customer ticket search.' => 'جستجو درخواست مشتری.',
        'Customer ticket zoom' => 'زوم درخواست مشتری',
        'Customer user search' => 'جستجو کاربران مشترک',
        'CustomerID search' => 'جستجو CustomerID',
        'CustomerName' => 'نام مشتری',
        'CustomerUser' => 'CustomerUser',
        'Czech' => 'چک',
        'Danish' => 'دانمارکی',
        'Dark' => '',
        'Dashboard overview.' => '',
        'Date / Time' => 'زمان تاریخ',
        'Default agent name' => '',
        'Default value for NameX' => 'مقدار پیش فرض برای NameX',
        'Define the queue comment 2.' => 'تعریف نظر صف 2.',
        'Define the service comment 2.' => 'تعریف نظر خدمات 2.',
        'Define the sla comment 2.' => 'تعریف نظر SLA 2.',
        'Delete this ticket' => 'حذف این درخواست ',
        'Deleted link to ticket "%s".' => 'لینک های حذف شده به درخواست \ " %s ".',
        'Detached' => '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'تعیین رشته است که به عنوان دریافت کننده نشان داده خواهد شد (برای :) بلیط تلفن و به عنوان فرستنده (از :) از بلیط ایمیل در رابط عامل. برای صف به عنوان NewQueueSelectionType \ "<صف> " نشان می دهد نام از صف و برای SystemAddress \ "<Realname> << >> ایمیل " نام و ایمیل دریافت کننده نشان می دهد.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'تعیین رشته است که به عنوان گیرنده (به :) بلیط در رابط مشتری از نشان داده خواهد شد. برای صف به عنوان CustomerPanelSelectionType، \ "<صف> " نشان می دهد نام از صف، و برای SystemAddress، \ "<Realname> << >> ایمیل " نشان می دهد نام و ایمیل دریافت کننده.',
        'Display communication log entries.' => '',
        'Down' => 'پائین',
        'Dropdown' => 'رها کردن',
        'Dutch' => '',
        'Dynamic Fields Checkbox Backend GUI' => 'رابط کاربری گرافیکی پویا زمینه جعبه بخش مدیریت',
        'Dynamic Fields Date Time Backend GUI' => 'پویا زمینه های تاریخ زمان بخش مدیریت رابط کاربری گرافیکی',
        'Dynamic Fields Drop-down Backend GUI' => 'پویا زمینه های کشویی GUI بخش مدیریت',
        'Dynamic Fields GUI' => 'رابط کاربری گرافیکی زمینه پویا ',
        'Dynamic Fields Multiselect Backend GUI' => 'رابط کاربری گرافیکی زمینه پویا چندین انتخاب بخش مدیریت',
        'Dynamic Fields Overview Limit' => 'زمینه پویا نمای کلی محدود',
        'Dynamic Fields Text Backend GUI' => ' زمینه های پویا متن بخش مدیریت رابط کاربری گرافیکی',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'زمینه گروه پویا برای ویجت روند. کلید نام این گروه است، ارزش شامل زمینه نشان داده شود. به عنوان مثال: \'کلید => من گروه\'، \'مطالب و محتوا: Name_X، NameY.',
        'Dynamic fields limit per page for Dynamic Fields Overview.' => '',
        'DynamicField' => 'DynamicField',
        'DynamicField_%s' => '',
        'E-Mail Outbound' => 'عازم ناحیه دور دست ایمیل',
        'Edit Customer Companies.' => 'ویرایش شرکت و مشتری',
        'Edit Customer Users.' => 'ویرایش کاربران مشتری',
        'Edit appointment' => '',
        'Edit customer company' => 'ویرایش شرکت مشتری',
        'Email Outbound' => 'عازم ناحیه دور دست ایمیل',
        'Email Resend' => '',
        'Email communication channel.' => '',
        'Enabled filters.' => 'فیلتر را فعال کنید.',
        'English (Canada)' => 'انگلیسی (کانادا)',
        'English (United Kingdom)' => 'انگلیسی (بریتانیایی)',
        'English (United States)' => 'ایالات متحده انگلیسی)',
        'Enroll process for this ticket' => 'ثبت نام فرآیند  این درخواست برای',
        'Enter your shared secret to enable two factor authentication. WARNING: Make sure that you add the shared secret to your generator application and the application works well. Otherwise you will be not able to login anymore without the two factor token.' =>
            '',
        'Escalated Tickets' => 'درخواست های خیلی مهم',
        'Escalation view' => 'نمای درخواست‌های خیلی مهم',
        'EscalationTime' => 'EscalationTime',
        'Estonian' => 'زبان استونی',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'رویداد ثبت نام ماژول. برای عملکرد بیشتر شما می توانید رویداد ماشه (به عنوان مثال رویداد => TicketCreate) را تعریف کنیم.',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'رویداد ثبت نام ماژول. برای عملکرد بیشتر شما می توانید رویداد ماشه (به عنوان مثال رویداد => TicketCreate) را تعریف کنیم. این تنها راه ممکن است اگر تمام زمینه های پویا بلیط نیاز همان رویداد.',
        'Events Ticket Calendar' => 'رویدادها درخواست تقویم',
        'Execute SQL statements.' => 'اجرای عبارات SQL',
        'External' => '',
        'External Link' => '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'فیلتر برای اشکال زدایی ACL ها است. توجه: چند ویژگی بلیط را می توان در قالب <OTRS_TICKET_Attribute> به عنوان مثال <OTRS_TICKET_Priority> اضافه شده است.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'فیلتر برای اشکال زدایی انتقال. توجه: بیشتر فیلتر را می توان در قالب <OTRS_TICKET_Attribute> به عنوان مثال <OTRS_TICKET_Priority> اضافه شده است.',
        'Filter incoming emails.' => 'فیلتر ایمیل‌های ورودی',
        'Finnish' => 'فنلاندی',
        'First Christmas Day' => 'روز اول کریسمس',
        'First Queue' => 'صف نخست',
        'First response time' => '',
        'FirstLock' => 'FirstLock',
        'FirstResponse' => 'FirstResponse',
        'FirstResponseDiffInMin' => 'FirstResponseDiffInMin',
        'FirstResponseInMin' => 'FirstResponseInMin',
        'Firstname Lastname' => 'نام نام خانوادگی',
        'Firstname Lastname (UserLogin)' => 'نام نام خانوادگی (صفحهی)',
        'Forwarded to "%s".' => 'لینک ثابت به : "%s"',
        'Free Fields' => 'فیلد‌های آزاد',
        'French' => 'فرانسوی',
        'French (Canada)' => 'فرانسه (کانادا)',
        'Frontend' => 'ظاهر',
        'Full value' => 'ارزش کامل',
        'Fulltext search' => 'جستجوی متن',
        'Galician' => 'گاليکي',
        'Generic Info module.' => 'ماژول اطلاعات عمومی است.',
        'GenericAgent' => 'کارشناس عمومی',
        'GenericInterface Debugger GUI' => 'رابط کاربری گرافیکی GenericInterface دیباگر',
        'GenericInterface ErrorHandling GUI' => '',
        'GenericInterface Invoker Event GUI' => '',
        'GenericInterface Invoker GUI' => 'رابط کاربری گرافیکی GenericInterface Invoker',
        'GenericInterface Operation GUI' => 'رابط کاربری گرافیکی GenericInterface عملیات',
        'GenericInterface TransportHTTPREST GUI' => 'رابط کاربری گرافیکی GenericInterface TransportHTTPREST',
        'GenericInterface TransportHTTPSOAP GUI' => 'رابط کاربری گرافیکی GenericInterface TransportHTTPSOAP',
        'GenericInterface Web Service GUI' => 'رابط کاربری گرافیکی GenericInterface وب سرویس',
        'GenericInterface Web Service History GUI' => '',
        'GenericInterface Web Service Mapping GUI' => '',
        'German' => 'آلمانی',
        'Gives customer users group based access to tickets from customer users of the same customer (ticket CustomerID is a CustomerID of the customer user).' =>
            '',
        'Global Search Module.' => 'بازارهای ماژول جستجو.',
        'Go to dashboard!' => 'برو به داشبورد!',
        'Good PGP signature.' => '',
        'Google Authenticator' => 'Google Authenticator را',
        'Graph: Bar Chart' => 'نمودار: نمودار نوار',
        'Graph: Line Chart' => 'نمودار: نمودار خط',
        'Graph: Stacked Area Chart' => 'نمودار: نمودار محیطی پشتهای',
        'Greek' => 'یونانی',
        'Hebrew' => 'عبری',
        'Hindi' => 'هندی',
        'Hungarian' => 'مجارستانی',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if <$OTRSHome>/var/run/ can not be used.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'اگر فعال باشد، مروری مختلف (داشبورد، LockedView، QueueView) به طور خودکار پس از زمان مشخص را تازه کنید.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Import appointments screen.' => '',
        'Incoming Phone Call.' => 'تماس تلفنی ورودی.',
        'Indonesian' => 'اندونزی',
        'Inline' => '',
        'Input' => 'ورودی',
        'Interface language' => 'زبان واسط',
        'Internal' => '',
        'Internal communication channel.' => '',
        'International Workers\' Day' => 'روز جهانی کارگر',
        'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.' =>
            '',
        'Italian' => 'ایتالیایی',
        'Japanese' => 'ژاپنی',
        'Korean' => '',
        'Language' => 'زبان',
        'Large' => 'بزرگ',
        'Last Mentions' => '',
        'Last Screen Overview' => '',
        'Last customer subject' => 'آخرین موضوع مشتری',
        'Last view - limit' => '',
        'Last view - position' => '',
        'Last view - types' => '',
        'Last viewed overview' => '',
        'Last viewed screen' => '',
        'Lastname Firstname' => 'نام خانوادگی',
        'Lastname Firstname (UserLogin)' => 'نام خانوادگی نام (صفحهی)',
        'Lastname, Firstname' => 'نام خانوادگی',
        'Lastname, Firstname (UserLogin)' => 'نام خانوادگی، نام (صفحهی)',
        'LastnameFirstname' => '',
        'Latvian' => 'لتونی',
        'Link Object' => 'لینک',
        'Link Object.' => 'شی لینک.',
        'Link agents to groups.' => 'برقراری ارتباط بین کارشناسان و گروه‌ها',
        'Link agents to roles.' => 'برقراری ارتباط بین کارشناسان و نقش‌ها',
        'Link customer users to customers.' => '',
        'Link customer users to groups.' => '',
        'Link customer users to services.' => '',
        'Link customers to groups.' => '',
        'Link queues to auto responses.' => 'برقراری ارتباط بین صف‌های درخواست و پاسخ‌های خودکار',
        'Link roles to groups.' => 'برقراری ارتباط بین نقش‌ها و گروه‌ها',
        'Link templates to attachments.' => '',
        'Link templates to queues.' => 'قالب لینک به صف.',
        'Link this ticket to other objects' => 'پیوند این درخواست به موضوع دیگر',
        'List view' => 'نمایش لیستی',
        'Lithuanian' => 'زبان لیتوانی',
        'Lock / unlock this ticket' => 'قفل / باز کردن این درخواست',
        'Locked Tickets' => 'درخواست‌های تحویل گرفته شده',
        'Locked Tickets.' => 'درخواست قفل شده است.',
        'Locked ticket.' => 'سابقه::تحویل گرفتن درخواست',
        'Logged in users.' => '',
        'Logged-In Users' => '',
        'Logout of customer panel.' => 'خروج از پنل مشتری.',
        'Look into a ticket!' => 'مشاهده درخواست',
        'Loop protection: no auto-response sent to "%s".' => '',
        'Macedonian' => '',
        'Mail Accounts' => 'حساب های پست الکترونیکی',
        'Malay' => 'مالایا',
        'Manage Customer User-Customer Relations.' => '',
        'Manage OAuth2 tokens and their configurations.' => '',
        'Manage PGP keys for email encryption.' => 'مدیریت کلیدهای PGP برای رمزنگاری ایمیل',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'مدیریت حساب‌های POP3 و IMAP برای واکشی ایمیل‌ها',
        'Manage S/MIME certificates for email encryption.' => 'مدیریت گواهینامه‌ها برای رمزنگاری ایمیل‌ها',
        'Manage System Configuration Deployments.' => '',
        'Manage different calendars.' => '',
        'Manage existing sessions.' => 'مدیریت session های موجود',
        'Manage support data.' => 'مدیریت داده پشتیبانی می کند.',
        'Manage system files.' => '',
        'Manage tasks triggered by event or time based execution.' => 'مدیریت وظایف موجب شده توسط رویداد یا زمان اجرای .',
        'Management of ticket attribute relations.' => '',
        'Mark as Spam!' => 'به‌عنوان هرزنامه علامت بزن',
        'Mark as seen' => '',
        'Mark this ticket as junk!' => 'علامت گذاری به عنوان این درخواست به عنوان آشغال!',
        'Mark ticket as seen' => '',
        'Mark ticket as unseen' => '',
        'Mattermost Username' => '',
        'Max. number of articles per page in TicketZoom' => '',
        'Medium' => 'متوسط',
        'Mentioned in article' => '',
        'Mentioned in ticket' => '',
        'Mentions.' => '',
        'Merge this ticket and all articles into another ticket' => '',
        'Merged Ticket (%s/%s) to (%s/%s).' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'با هم ادغام شدند بلیط <OTRS_TICKET> تا <OTRS_MERGE_TO_TICKET>.',
        'Minute' => '',
        'Miscellaneous' => 'تنظیمات اضافی',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'ماژول برای فیلتر کردن و دستکاری پیام های دریافتی. مطلع یک شماره 4 رقمی به بلیط های متنی رایگان، استفاده از عبارت منظم را در بازی به عنوان مثال از => \'(. +) @. +؟ "، و استفاده از () به عنوان [***] در مجموعه ای =>.',
        'Multiselect' => 'چندین انتخاب',
        'My Queues' => 'لیست درخواست‌های من',
        'My Services' => 'خدمات من',
        'My last changed tickets' => '',
        'NameX' => 'NameX',
        'New Tickets' => 'درخواست‌های جدید',
        'New Window' => 'پنجره جدید',
        'New Year\'s Day' => 'روز اول ژانویه که آغاز سال نو مسیحیان است',
        'New Year\'s Eve' => 'شب سال نو',
        'New process ticket' => 'درخواست فرآیند جدید',
        'News' => '',
        'No public key found.' => '',
        'No valid OpenPGP data found.' => '',
        'None' => 'هیچ',
        'Norwegian' => 'نروژی',
        'Notification Settings' => 'تنظیمات اطلاع رسانی',
        'Notified about response time escalation.' => '',
        'Notified about solution time escalation.' => '',
        'Notified about update time escalation.' => '',
        'Number of displayed tickets' => 'تعداد درخواست‌های نمایش داده شده',
        'OAuth2' => '',
        'OAuth2 token' => '',
        'OTRS' => 'OTRS',
        'Open an external link!' => '',
        'Open tickets (customer user)' => 'درخواست باز (کاربران مشتری)',
        'Open tickets (customer)' => 'درخواست گسترش (مشتری)',
        'Option' => 'انتخاب',
        'Other Customers' => '',
        'Out Of Office' => 'بیرون از دفتر',
        'Out Of Office Time' => 'زمان بیرون بودن از محل کار',
        'Out of Office users.' => '',
        'Overview Escalated Tickets.' => 'درخواست تشدید هفتگی.',
        'Overview Refresh Time' => 'نمای کلی زمان بازسازی',
        'Overview of all Tickets per assigned Queue.' => '',
        'Overview of all appointments.' => '',
        'Overview of all escalated tickets.' => 'نمای کلی از تمام بلیط افزایش یافت.',
        'Overview of all open Tickets.' => 'نمایی کلی از تمام درخواست‌های باز',
        'Overview of all open tickets.' => 'نمای کلی از تمام درخواست باز.',
        'Overview of customer tickets.' => 'بررسی اجمالی از  درخواست مشتری .',
        'PGP Key' => 'کلید PGP',
        'PGP Key Management' => 'PGP مدیریت کلید',
        'PGP Keys' => 'کلیدهای PGP',
        'Parent' => 'اصلی',
        'ParentChild' => 'ParentChild',
        'Pending time' => '',
        'People' => 'کاربران',
        'Persian' => 'فارسی',
        'Phone Call Inbound' => 'تلفن تماس ورودی',
        'Phone Call Outbound' => 'تماس تلفنی راه دور',
        'Phone Call.' => 'شماره تماس',
        'Phone call' => 'تماس تلفنی',
        'Phone communication channel.' => '',
        'Phone-Ticket' => 'درخواست تلفنی',
        'Picture Upload' => 'تصویر آپلود',
        'Picture upload module.' => 'تصویر ماژول آپلود.',
        'Picture-Upload' => 'تصویر آپلود',
        'Plugin search' => '',
        'Plugin search module for autocomplete.' => '',
        'Polish' => 'لهستانی',
        'Portuguese' => 'پرتغالی',
        'Portuguese (Brasil)' => 'پرتغالی (برزیل)',
        'PostMaster Filters' => 'فیلترهای پستی',
        'Print this ticket' => 'چاپ این بلیط',
        'Priorities' => 'الویت‌ها',
        'Process Management Activity Dialog GUI' => 'فرآیند مدیریت فعالیت های گفت و گو GUI',
        'Process Management Activity GUI' => 'روند GUI مدیریت فعالیت',
        'Process Management Path GUI' => 'روند GUI مسیر مدیریت',
        'Process Management Transition Action GUI' => 'مدیریت فرآیند GUI انتقال اقدام',
        'Process Management Transition GUI' => 'روند GUI انتقال مدیریت',
        'Process Ticket.' => ' روند درخواست.',
        'ProcessID' => 'ProcessID',
        'Processes & Automation' => '',
        'Provides a matrix overview of the tickets per state per queue' =>
            '',
        'Provides customer users access to tickets even if the tickets are not assigned to a customer user of the same customer ID(s), based on permission groups.' =>
            '',
        'Public Calendar' => '',
        'Public calendar.' => '',
        'Queue view' => 'نمای صف درخواست',
        'Refresh interval' => 'بارگذاری مجدد ورودی',
        'Reminder Tickets' => 'درخواست‌های یادآوری شده',
        'Removed subscription for user "%s".' => 'عضویت حذف شده برای کاربر"%s".',
        'Reports' => 'گزارش ها',
        'Resend Ticket Email.' => '',
        'Resent email to "%s".' => '',
        'Responsible Tickets' => 'کارشناس درخواست',
        'Responsible Tickets.' => 'کارشناس درخواست.',
        'Right' => 'راست',
        'Romanian' => '',
        'Running Process Tickets' => 'در حال اجرا فرآیند درخواست',
        'Russian' => 'روسی',
        'S/MIME Certificates' => 'گواهینامه‌های S/MIME',
        'Schedule a maintenance period.' => 'برنامه ریزی یک دوره تعمیر و نگهداری.',
        'Screen after marking as seen' => '',
        'Screen after marking as unseen' => '',
        'Screen after new ticket' => 'وضعیت نمایش پس از دریافت درخواست جدید',
        'Search Customer' => 'جستجوی مشترک',
        'Search Ticket.' => 'جستجو درخواست.',
        'Search Tickets.' => 'درخواست های جستجو.',
        'Search User' => 'جستجوی کاربر',
        'Search tickets.' => '',
        'Second Christmas Day' => 'روز دوم کریسمس',
        'Second Queue' => 'صف دوم',
        'Seconds' => '',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many last views should be shown.' => '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => '',
        'Select the maximum articles per page shown in TicketZoom. System default value will apply when entered empty value.' =>
            '',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'لطفا کاراکتر استفاده شده برای فایل‌های CSV را انتخاب نمایید. اگر جداکننده‌ای را انتخاب نکنید، جداکننده پیش‌فرض زبان انتخاب شده توسط شما استفاده می‌گردد.',
        'Select where to display the last views.' => '',
        'Select which types should be displayed.' => '',
        'Select your frontend Theme.' => 'الگوی نمایش سیستم را انتخاب نمائید',
        'Select your personal time zone. All times will be displayed relative to this time zone.' =>
            '',
        'Select your preferred layout for the software.' => '',
        'Select your preferred theme for OTRS.' => '',
        'Send a unit test file' => '',
        'Send new outgoing mail from this ticket' => 'ارسال ایمیل های ارسالی جدید این درخواست از',
        'Send notifications to users.' => 'ارسال اعلان‌ها به کاربران',
        'Sent "%s" notification to "%s" via "%s".' => '',
        'Sent auto follow-up to "%s".' => '',
        'Sent auto reject to "%s".' => '',
        'Sent auto reply to "%s".' => '',
        'Sent email to "%s".' => '',
        'Sent email to customer.' => '',
        'Sent notification to "%s".' => '',
        'Serbian Cyrillic' => 'سیریلیک صربستان',
        'Serbian Latin' => 'صربی لاتین',
        'Service view' => 'نمای سرویس',
        'ServiceView' => 'ServiceView',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set sender email addresses for this system.' => 'تنظیم آدرس ایمیل‌های ارسال‌کننده برای این سیستم',
        'Set this ticket to pending' => 'قرارادادن این درخواست در لیست انتظار',
        'Shared Secret' => 'راز مشترک',
        'Show the history for this ticket' => 'نشان دادن تاریخ این بلیط برای',
        'Show the ticket history' => 'نمایش تاریخ بلیط',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'یک پیش نمایش کلی بلیط (- نشان می دهد نیز مشتری اطلاعات، CustomerInfoMaxSize حداکثر اندازه در شخصیت مشتری اطلاعات. CustomerInfo => 1) نشان می دهد.',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows last mention of tickets.' => '',
        'Signature data.' => '',
        'Simple' => 'ساده',
        'Skin' => 'پوسته',
        'Slovak' => 'اسلواکی',
        'Slovenian' => 'اسلوونی',
        'Small' => 'کوچک',
        'Snippet' => '',
        'Software Package Manager.' => 'نرم افزار مدیریت بسته بندی.',
        'Solution time' => '',
        'SolutionDiffInMin' => 'SolutionDiffInMin',
        'SolutionInMin' => 'SolutionInMin',
        'Some description!' => 'برخی از توضیحات!',
        'Some picture description!' => 'برخی از توضیحات تصویر!',
        'Spam' => 'هرزنامه ها',
        'Spanish' => 'اسپانیایی',
        'Spanish (Colombia)' => 'اسپانیایی (کلمبیا)',
        'Spanish (Mexico)' => 'اسپانیایی (مکزیک)',
        'Started response time escalation.' => '',
        'Started solution time escalation.' => '',
        'Started update time escalation.' => '',
        'Stat#' => 'شماره گزارش',
        'States' => 'وضعیت',
        'Statistics overview.' => '',
        'Status view' => 'نمای وضعیت',
        'Stopped response time escalation.' => '',
        'Stopped solution time escalation.' => '',
        'Stopped update time escalation.' => '',
        'Support Agent' => '',
        'Swahili' => 'سواحیلی',
        'Swedish' => 'سوئد',
        'System Address Display Name' => 'سیستم آدرس نام ها',
        'System Configuration Deployment' => '',
        'System Configuration Group' => '',
        'System Maintenance' => 'تعمیر و نگهداری سیستم',
        'Textarea' => 'ناحیه متنی',
        'Thai' => 'تایلندی',
        'The PGP signature is expired.' => '',
        'The PGP signature was made by a revoked key, this could mean that the signature is forged.' =>
            '',
        'The PGP signature was made by an expired key.' => '',
        'The PGP signature with the keyid has not been verified successfully.' =>
            '',
        'The PGP signature with the keyid is good.' => '',
        'The secret you supplied is invalid. The secret must only contain letters (A-Z, uppercase) and numbers (2-7) and must consist of 16 characters.' =>
            '',
        'The value of the From field' => '',
        'Theme' => 'طرح زمینه',
        'This is a Description for Comment on Framework.' => '',
        'This is a Description for DynamicField on Framework.' => '',
        'This is the dark skin for the agent interface.' => '',
        'This is the dark skin for the customer interface.' => '',
        'This is the default orange - black skin for the customer interface.' =>
            'پوست سیاه و سفید برای رابط مشتری - این به طور پیش فرض نارنجی است.',
        'This is the default orange - black skin.' => 'پوست سیاه و سفید - این به طور پیش فرض نارنجی است.',
        'This key is not certified with a trusted signature!' => '',
        'This module is part of the admin area of OTRS.' => '',
        'Ticket Close.' => 'درخواست نزدیک ',
        'Ticket Compose Bounce Email.' => 'درخواست نوشتن پرش ایمیل.',
        'Ticket Compose email Answer.' => 'درخواست نوشتن برای پاسخ ایمیل.',
        'Ticket Customer.' => 'درخواست مشتری.',
        'Ticket Forward Email.' => 'درخواست انتقال ایمیل.',
        'Ticket FreeText.' => 'گه از FREETEXT درخواست',
        'Ticket History.' => 'تاریخ درخواست.',
        'Ticket Lock.' => 'قفل درخواست',
        'Ticket Merge.' => 'ادغام درخواست',
        'Ticket Move.' => 'درخواست حرکت ',
        'Ticket Note.' => 'توجه درخواست',
        'Ticket Notifications' => 'درخواست اطلاعیه',
        'Ticket Outbound Email.' => 'درخواست عازم ناحیه دور دست ایمیل.',
        'Ticket Overview "Medium" Limit' => ' بررسی اجمالی درخواست \ "متوسط ​​" محدود',
        'Ticket Overview "Preview" Limit' => 'بررسی اجمالی درخواست \ "پیش نمایش " محدود',
        'Ticket Overview "Small" Limit' => ' بررسی اجمالی درخواست \ "کوچک " محدود ',
        'Ticket Owner.' => 'مالک درخواست',
        'Ticket Pending.' => ' انتظاردرخواست.',
        'Ticket Print.' => ' چاپ درخواست .',
        'Ticket Priority.' => 'اولویت درخواست',
        'Ticket Queue Overview' => 'بررسی اجمالی صف درخواست',
        'Ticket Responsible.' => 'درخواست به عهده دارد.',
        'Ticket Search' => '',
        'Ticket Watcher' => 'نگهبان درخواست',
        'Ticket Zoom' => '',
        'Ticket Zoom.' => 'درخواست زوم.',
        'Ticket bulk module.' => 'درخواست ماژول انبوه ',
        'Ticket creation' => '',
        'Ticket limit per page for Ticket Overview "Medium".' => '',
        'Ticket limit per page for Ticket Overview "Preview".' => '',
        'Ticket limit per page for Ticket Overview "Small".' => '',
        'Ticket notifications' => 'اطلاع رسانی تیکت',
        'Ticket overview' => 'نمای کلی درخواست',
        'Ticket plain view of an email.' => 'درخواست نظر ساده از یک ایمیل.',
        'Ticket split dialog.' => '',
        'Ticket title' => 'عنوان درخواست',
        'Ticket zoom view.' => 'نمایش زوم درخواست',
        'TicketNumber' => 'شماره درخواست',
        'Tickets.' => 'درخواست',
        'To accept login information, such as an EULA or license.' => 'برای قبول اطلاعات ورود به سیستم، مانند EULA یا مجوز.',
        'To download attachments.' => 'برای دانلود فایل پیوست کنید.',
        'To view HTML attachments.' => '',
        'Tree view' => 'نمای درختی',
        'Turkish' => 'ترکی',
        'Tweak the system as you wish.' => '',
        'Ukrainian' => 'اوکراینی',
        'Unlocked ticket.' => 'سابقه::تحویل دادن درخواست',
        'Up' => 'بالا',
        'Upcoming Events' => 'رویدادهای پیش رو',
        'Update time' => '',
        'Upload your PGP key.' => '',
        'Upload your S/MIME certificate.' => '',
        'User Profile' => 'مشخصات کاربر',
        'UserFirstname' => 'UserFirstname',
        'UserLastname' => 'UserLastname',
        'Users, Groups & Roles' => '',
        'Vietnam' => 'ویتنام',
        'View performance benchmark results.' => 'نمایش نتایج آزمون کارایی',
        'Watch this ticket' => 'سازمان دیده بان این درخواست',
        'Watched Tickets' => 'درخواست‌های مشاهده شده',
        'Watched Tickets.' => 'درخواست تماشا.',
        'We are performing scheduled maintenance.' => 'ما در حال انجام تعمیر و نگهداری برنامه ریزی شده هستیم .',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'ما در حال انجام تعمیر و نگهداری برنامه ریزی شده هستیم. ورود به طور موقت در دسترس نیست.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'ما در حال انجام تعمیر و نگهداری برنامه ریزی شده هستیم.ما باید بزودی به حالت آن لاین برگردیم.',
        'Web Services' => 'وب سرویس',
        'Web service (Dropdown)' => '',
        'Web service (Multiselect)' => '',
        'Web service dynamic field AJAX interface' => '',
        'Webservice' => '',
        'Yes, but hide archived tickets' => 'بله، اما آرشیو درخواست پنهان است',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'ایمیل خود را با تعداد درخواست  \ "<OTRS_TICKET> " منعکس است با \ "<OTRS_BOUNCE_TO> ". این آدرس برای کسب اطلاعات بیشتر تماس بگیرید.',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Email شما با شماره درخواست  "<OTRS_TICKET>" با درخواست "<OTRS_MERGE_TO_TICKET>"  ادغام گردید.',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'انتخاب صف خود را از صف نظر خود را. شما همچنین دریافت در مورد کسانی که صف از طریق ایمیل مطلع اگر فعال باشد.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'انتخاب خدمات خود را از خدمات مورد نظر خود را. شما همچنین دریافت در مورد کسانی که خدمات از طریق ایمیل مطلع اگر فعال باشد.',
        'Your username in Mattermost without the leading @' => '',
        'Znuny.org - News' => '',
        'Zoom' => 'نمایش کامل',
        'all tickets' => '',
        'archived tickets' => '',
        'attachment' => 'ضمیمه',
        'bounce' => '',
        'compose' => '',
        'debug' => 'اشکال زدایی',
        'error' => 'خطا',
        'forward' => '',
        'info' => 'اطلاعات',
        'inline' => 'درون خطی',
        'normal' => 'عادی',
        'not archived tickets' => '',
        'notice' => 'نکته',
        'open in current tab' => '',
        'open in new tab' => '',
        'pending' => '',
        'phone' => 'تلفن',
        'responsible' => '',
        'reverse' => 'برگردان',
        'stats' => '',

    };

    $Self->{JavaScriptStrings} = [
        ' ...and %s more',
        ' ...show less',
        '%s B',
        '%s GB',
        '%s KB',
        '%s MB',
        '%s TB',
        '+%s more',
        'A key with this name (\'%s\') already exists.',
        'A package upgrade was recently finished. Click here to see the results.',
        'A popup of this screen is already open. Do you want to close it and load this one instead?',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.',
        'Add',
        'Add Event Trigger',
        'Add all',
        'Add entry',
        'Add key',
        'Add new draft',
        'Add new entry',
        'Add to favourites',
        'Agent',
        'All occurrences',
        'All-day',
        'An Error Occurred',
        'An error occurred',
        'An error occurred during communication.',
        'An error occurred! Please check the browser error log for more details!',
        'An item with this name is already present.',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.',
        'An unknown error occurred when deleting the attachment. Please try again. If the error persists, please contact your system administrator.',
        'An unknown error occurred. Please contact the administrator.',
        'Apply',
        'Appointment',
        'Apr',
        'April',
        'Are you sure you want to delete this appointment? This operation cannot be undone.',
        'Are you sure you want to overwrite the config parameters?',
        'Are you sure you want to update all installed packages?',
        'Are you using a browser plugin like AdBlock or AdBlockPlus? This can cause several issues and we highly recommend you to add an exception for this domain.',
        'Article display',
        'Article filter',
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?',
        'Ascending sort applied, ',
        'Attachment was deleted successfully.',
        'Attachments',
        'Aug',
        'August',
        'Available space %s of %s.',
        'Basic information',
        'By restoring this deployment all settings will be reverted to the value they had at the time of the deployment. Do you really want to continue?',
        'Calendar',
        'Cancel',
        'Cannot proceed',
        'Clear',
        'Clear all',
        'Clear all filters',
        'Clear debug log',
        'Clear search',
        'Click to delete this attachment.',
        'Click to select a file for upload.',
        'Clone web service',
        'Close preview',
        'Close this dialog',
        'Close this message',
        'Complex %s with %s arguments',
        'Confirm',
        'Could not open popup window. Please disable any popup blockers for this application.',
        'Current selection',
        'Currently not possible',
        'Customer interface does not support articles not visible for customers.',
        'Date/Time',
        'Day',
        'Dec',
        'December',
        'Delete',
        'Delete Entity',
        'Delete conditions',
        'Delete draft',
        'Delete error handling module',
        'Delete field',
        'Delete invoker',
        'Delete operation',
        'Delete this Attachment',
        'Delete this Event Trigger',
        'Delete this Invoker',
        'Delete this Key Mapping',
        'Delete this Mail Account',
        'Delete this Operation',
        'Delete this PostMasterFilter',
        'Delete this Template',
        'Delete this event',
        'Delete this task',
        'Delete web service',
        'Deleting attachment...',
        'Deleting the field and its data. This may take a while...',
        'Deleting the mail account and its data. This may take a while...',
        'Deleting the postmaster filter and its data. This may take a while...',
        'Deleting the template and its data. This may take a while...',
        'Deploy',
        'Deploy now',
        'Deploying, please wait...',
        'Deployment comment...',
        'Deployment successful. You\'re being redirected...',
        'Descending sort applied, ',
        'Description',
        'Dismiss',
        'Do not show this warning again.',
        'Do you really want to continue?',
        'Do you really want to delete "%s"?',
        'Do you really want to delete this certificate?',
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!',
        'Do you really want to delete this key?',
        'Do you really want to delete this link?',
        'Do you really want to delete this notification language?',
        'Do you really want to delete this notification?',
        'Do you really want to delete this scheduled system maintenance?',
        'Do you really want to delete this token and its configuration?',
        'Do you really want to reset this setting to it\'s default value?',
        'Do you really want to revert this setting to its historical value?',
        'Don\'t save, update manually',
        'Draft title',
        'Duplicate event.',
        'Duplicated entry',
        'Edit Field Details',
        'Edit Transition "%s"',
        'Edit this setting',
        'Edit this transition',
        'End date',
        'Error',
        'Error during AJAX communication',
        'Error during AJAX communication. Status: %s, Error: %s',
        'Error in the mail settings. Please correct and try again.',
        'Error: Browser Check failed!',
        'Event Type Filter',
        'Expanded',
        'Feb',
        'February',
        'Filters',
        'Finished',
        'First select a customer user, then select a customer ID to assign to this ticket.',
        'Fr',
        'Fri',
        'Friday',
        'Generate',
        'Generate Result',
        'Generating...',
        'Grouped',
        'Help',
        'Hide EntityIDs',
        'If you now leave this page, all open popup windows will be closed, too!',
        'Import web service',
        'Information about the Znuny Daemon',
        'Insert selected customer user(s) into the "%s:" field.',
        'Invalid date (need a future date)!',
        'Invalid date (need a past date)!',
        'Invalid date!',
        'It is going to be deleted from the field, please try again.',
        'It is not possible to add a new event trigger because the event is not set.',
        'It is not possible to set this entry to invalid. All affected configuration settings have to be changed beforehand.',
        'It was not possible to delete this draft.',
        'It was not possible to generate the Support Bundle.',
        'Jan',
        'January',
        'Jul',
        'July',
        'Jump',
        'Jun',
        'June',
        'Just this occurrence',
        'Keys with values can\'t be renamed. Please remove this key/value pair instead and re-add it afterwards.',
        'Loading, please wait...',
        'Loading...',
        'Location',
        'Mail check successful.',
        'Mapping for Key',
        'Mapping for Key %s',
        'Mar',
        'March',
        'May',
        'May_long',
        'Mo',
        'Mon',
        'Monday',
        'Month',
        'Name',
        'Namespace %s could not be initialized, because %s could not be found.',
        'Next',
        'No Data Available.',
        'No TransitionActions assigned.',
        'No data found.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.',
        'No matches found.',
        'No package information available.',
        'No response from get package upgrade result.',
        'No response from get package upgrade run status.',
        'No response from package upgrade all.',
        'No sort applied, ',
        'No space left for the following files: %s',
        'Not available',
        'Notice',
        'Notification',
        'Nov',
        'November',
        'OK',
        'Oct',
        'October',
        'One or more errors occurred!',
        'Open URL in new tab',
        'Open date selection',
        'Open this node in a new window',
        'Please add values for all keys before saving the setting.',
        'Please check the fields marked as red for valid inputs.',
        'Please either turn some off first or increase the limit in configuration.',
        'Please enter at least one search value or * to find anything.',
        'Please enter at least one search word to find anything.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.',
        'Please only select at most %s files for upload.',
        'Please only select one file for upload.',
        'Please remove the following words from your search as they cannot be searched for:',
        'Please see the documentation or ask your admin for further information.',
        'Please turn off Compatibility Mode in Internet Explorer!',
        'Please wait...',
        'Preparing to deploy, please wait...',
        'Press Ctrl+C (Cmd+C) to copy to clipboard',
        'Previous',
        'Process state',
        'Queues',
        'Reload page',
        'Reload page (%ss)',
        'Remove',
        'Remove Entity from canvas',
        'Remove active filters for this widget.',
        'Remove from favourites',
        'Remove selection',
        'Remove the Transition from this Process',
        'Remove the filter',
        'Remove this dynamic field',
        'Remove this entry',
        'Repeat',
        'Request Details',
        'Request Details for Communication ID',
        'Reset',
        'Reset option is required!',
        'Reset setting',
        'Resource',
        'Resources',
        'Restore default settings',
        'Restore web service configuration',
        'Rule',
        'Running',
        'Sa',
        'Sat',
        'Saturday',
        'Save',
        'Save and update automatically',
        'Scale preview content',
        'Search',
        'Search attributes',
        'Search the System Configuration',
        'Searching for linkable objects. This may take a while...',
        'Select a customer ID to assign to this ticket',
        'Select a customer ID to assign to this ticket.',
        'Select a file or drop it here',
        'Select all',
        'Select files or drop them here',
        'Sep',
        'September',
        'Setting a template will overwrite any text or attachment.',
        'Settings',
        'Show',
        'Show EntityIDs',
        'Show current selection',
        'Show or hide the content.',
        'Slide the navigation bar',
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.',
        'Sorry, but you can\'t disable all methods for this notification.',
        'Sorry, the only existing condition can\'t be removed.',
        'Sorry, the only existing field can\'t be removed.',
        'Sorry, the only existing parameter can\'t be removed.',
        'Sorry, you can only upload %s files.',
        'Sorry, you can only upload one file here.',
        'Split',
        'Stacked',
        'Start date',
        'Status',
        'Stream',
        'Su',
        'Sun',
        'Sunday',
        'Support Bundle',
        'Switch to desktop mode',
        'Switch to mobile mode',
        'Team',
        'Th',
        'The activities could not be marked as seen.',
        'The activity could not be created.',
        'The activity could not be created. %s is needed.',
        'The activity could not be deleted.',
        'The activity could not be marked as new.',
        'The activity could not be marked as seen.',
        'The activity could not be updated.',
        'The browser you are using is too old.',
        'The deployment is already running.',
        'The following files are not allowed to be uploaded: %s',
        'The following files exceed the maximum allowed size per file of %s and were not uploaded: %s',
        'The following files were already uploaded and have not been uploaded again: %s',
        'The item you\'re currently viewing is part of a not-yet-deployed configuration setting, which makes it impossible to edit it in its current state. Please wait until the setting has been deployed. If you\'re unsure what to do next, please contact your system administrator.',
        'The key must not be empty.',
        'The names of the following files exceed the maximum allowed length of %s characters and were not uploaded: %s',
        'There are currently no elements available to select from.',
        'There are no more drafts available.',
        'There is a package upgrade process running, click here to see status information about the upgrade progress.',
        'There was an error deleting the attachment. Please check the logs for more information.',
        'There was an error. Please save all settings you are editing and check the logs for more information.',
        'This Activity cannot be deleted because it is the Start Activity.',
        'This Activity is already used in the Process. You cannot add it twice!',
        'This Transition is already used for this Activity. You cannot use it twice!',
        'This TransitionAction is already used in this Path. You cannot use it twice!',
        'This address already exists on the address list.',
        'This element has children elements and can currently not be removed.',
        'This event is already attached to the job, Please use a different one.',
        'This field can have no more than 250 characters.',
        'This field is required.',
        'This is %s',
        'This is a repeating appointment',
        'This is currently disabled because of an ongoing package upgrade.',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?',
        'This option is currently disabled because the Znuny Daemon is not running.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.',
        'This window must be called from compose window.',
        'Thu',
        'Thursday',
        'Timeline Day',
        'Timeline Month',
        'Timeline Week',
        'Title',
        'Today',
        'Too many active calendars',
        'Try again',
        'Tu',
        'Tue',
        'Tuesday',
        'Unfortunately deploying is currently not possible, maybe because another agent is already deploying. Please try again later.',
        'Unknown',
        'Unlock setting.',
        'Update All Packages',
        'Update all packages',
        'Update manually',
        'Upload information',
        'Uploading...',
        'Use options below to narrow down for which tickets appointments will be automatically created.',
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.',
        'Warning',
        'We',
        'Wed',
        'Wednesday',
        'Week',
        'Would you like to edit just this occurrence or all occurrences?',
        'Yes',
        'You can either have the affected settings updated automatically to reflect the changes you just made or do it on your own by pressing \'update manually\'.',
        'You can use the category selection to limit the navigation tree below to entries from the selected category. As soon as you select the category, the tree will be re-built.',
        'You have undeployed settings, would you like to deploy them?',
        'activate to apply a descending sort',
        'activate to apply an ascending sort',
        'activate to remove the sort',
        'and %s more...',
        'day',
        'month',
        'more',
        'no',
        'none',
        'sorting is disabled',
        'week',
        'yes',
    ];

    # $$STOP$$
    return;
}

1;
