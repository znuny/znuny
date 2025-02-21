# --
# Copyright (C) 2003 Serg V Kravchenko <skraft at rgs.ru>
# Copyright (C) 2007 Andrey Feldman <afeldman at alt-lan.ru>
# Copyright (C) 2008-2009 Egor Tsilenko <bg8s at symlink.ru>
# Copyright (C) 2009 Andrey Cherepanov <cas at altlinux.ru>
# Copyright (C) 2010 Denis Kot <denis.kot at gmail.com>
# Copyright (C) 2010 Andrey A. Fedorov <2af at mail.ru>
# Copyright (C) 2010-2011 Eugene Kungurov <ekungurov83 at ya.ru>
# Copyright (C) 2010 Sergey Romanov <romanov_s at mail.ru>
# Copyright (C) 2012-2013 Vadim Goncharov <vgoncharov at mail.ru>
# Copyright (C) 2013 Alexey Gluhov <glalexnn at yandex.ru>
# Copyright (C) 2013 Andrey N. Burdin <BurdinAN at it-sakh.net>
# Copyright (C) 2013 Yuriy Kolesnikov <ynkolesnikov at gmail.com>
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Translation::JavaScriptStrings)

package Kernel::Language::ru;

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
    $Self->{DateFormatLong}      = '%T, %A %D %B, %Y г.';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.869235836627141;

    # csv separator
    $Self->{Separator}         = ';';

    $Self->{DecimalSeparator}  = ',';
    $Self->{ThousandSeparator} = '.';
    $Self->{Translation} = {

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt
        'Actions' => 'Действия',
        'Create New ACL' => 'Создать новый ACL',
        'Deploy ACLs' => 'Синхронизировать ACL',
        'Export ACLs' => 'Экспортировать ACL',
        'Filter for ACLs' => 'Фильтр для ACL',
        'Just start typing to filter...' => 'Начните вводить символы для фильтрации...',
        'Configuration Import' => 'Импорт конфигурации',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Здесь можно загрузить конфигурационный файл для импорта ACL в систему. Файл должен иметь .yml формат, такой же, как при экспорте из модуля редактора ACL.',
        'This field is required.' => 'Это поле обязательно.',
        'Overwrite existing ACLs?' => 'Перезаписать существующие ACL?',
        'Upload ACL configuration' => 'Загрузить настройки ACL',
        'Import ACL configuration(s)' => 'Импортировать настройки ACL',
        'Description' => 'Описание',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Для создания нового ACL или импортируйте его из файла экспорта другой системы или создайте заново.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Изменения в ACL, сделанные здесь будут актуальны после синхронизации данных ACL. При синхронизации, все вновь внесенные изменения будут записаны в конигурационные файлы системы.',
        'ACL Management' => 'Управление ACL',
        'ACLs' => 'ACL',
        'Filter' => 'Фильтр',
        'Show Valid' => 'Показать действительные',
        'Show All' => 'Показать все',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Помните: Эта таблица отображает порядок выполнения ACL. Если вы хотите изменить порядок в котором они исполняются, измените их имена.',
        'ACL name' => 'Имя ACL',
        'Comment' => 'Комментарий',
        'Validity' => 'Действительность',
        'Export' => 'Экспортировать',
        'Copy' => 'Копировать',
        'No data found.' => 'Данные не найдены.',
        'No matches found.' => 'Совпадений не найдено.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLEdit.tt
        'Go to overview' => 'Перейти к обзору',
        'Delete ACL' => 'Удалить ACL',
        'Delete Invalid ACL' => 'Удалить неправильный ACL',
        'Match settings' => 'Настройки условий',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Задайте условия совпадения для этого ACL. Используйте \'Properties\' для данных текущей формы или \'PropertiesDatabase\' для проверки данных текущей заявки, которые уже в базе данных',
        'Change settings' => 'Изменить настройки',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Задайте, что вы хотите изменить в случае выполнения условия. Имейте в виду, что \'Possible\' это "белый список", а \'PossibleNot\' - "черный список"',
        'A list of all possible match and set criteria is found in the ACL Reference Guide %sdocumentation%s.' =>
            '',
        'Edit ACL %s' => 'Изменить ACL %s',
        'Edit ACL' => 'Изменить ACL',
        'Show or hide the content' => 'Отобразить или скрыть содержимое',
        'Edit ACL Information' => 'Изменить информацию о ACL',
        'Name' => 'Название',
        'Stop after match' => 'Прекратить проверку после совпадения',
        'Edit ACL Structure' => 'Изменить структуру ACL',
        'Cancel' => 'Отменить',
        'Save' => 'Сохранить',
        'Save and finish' => 'Сохранить и закончить',
        'Do you really want to delete this ACL?' => 'Вы действительно хотите удалить этот ACL?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLNew.tt
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Для создания нового ACL заполните форму описания и сохраните. После этого можно добавлять наборы условий и действий в режиме редактирования.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentCalendarManage.tt
        'Calendar Overview' => 'Обзор календарей',
        'Add new Calendar' => 'Добавить новый календарь',
        'Add Calendar' => 'Добавить календарь',
        'Import Appointments' => 'Импортировать мероприятия',
        'Calendar Import' => 'Импортировать календарь',
        'Here you can upload a configuration file to import a calendar to your system. The file needs to be in .yml format as exported by calendar management module.' =>
            'Здесь можно загрузить файл конфигурации для импорта календаря в систему. Файл должен быть в .yml формате, таком же, как при экспорте из модуля управления календарями.',
        'Overwrite existing entities' => 'Переписывать существующие объекты',
        'Upload calendar configuration' => 'Загрузить конфигурацию календаря',
        'Import Calendar' => 'Импортировать календарь',
        'Filter for Calendars' => 'Фильтр календарей',
        'Filter for calendars' => 'Фильтр для календарей',
        'Depending on the group field, the system will allow users the access to the calendar according to their permission level.' =>
            'В зависимости от значения в поле group, система предоставляет агентам доступ к календарю в в соответствии с уровнем его полномочий.',
        'Read only: users can see and export all appointments in the calendar.' =>
            'Только чтение: пользователи могут смотреть и экспортировать все мероприятия календаря.',
        'Move into: users can modify appointments in the calendar, but without changing the calendar selection.' =>
            'Переместить в: пользователи могут изменять мероприятия в календаре, но без выбора календаря.',
        'Create: users can create and delete appointments in the calendar.' =>
            'Создать: пользователи могут создавать и удалять мероприятия в календаре.',
        'Read/write: users can manage the calendar itself.' => 'Чтение/запись: пользователи могут полностью управлять календарём.',
        'Calendar Management' => 'Управление календарями',
        'Edit Calendar' => 'Изменить календарь',
        'Group' => 'Группа',
        'Changed' => 'Изменен',
        'Created' => 'Создана',
        'Download' => 'Загрузить',
        'URL' => 'URL',
        'Export calendar' => 'Экспортировать календарь',
        'Download calendar' => 'Загрузка календаря',
        'Copy public calendar URL' => 'Копировать публичный URL календаря',
        'Calendar' => 'Календарь',
        'Calendar name' => 'Имя календаря',
        'Calendar with same name already exists.' => 'Календарь с таким именем уже существует.',
        'Permission group' => 'Групповые права',
        'Ticket Appointments' => 'Мероприятия заявки',
        'Rule' => 'Правило',
        'Remove this entry' => 'Удалить эту запись',
        'Remove' => 'Удалить',
        'Start date' => 'Дата начала',
        'End date' => 'Дата окончания',
        'Use options below to narrow down for which tickets appointments will be automatically created.' =>
            'Используйте опции ниже, чтобы указать, какие мероприятия заявок будут созданы автоматически.',
        'Queues' => 'Очереди',
        'Please select a valid queue.' => 'Выберите правильную очередь.',
        'Search attributes' => 'Атрибуты поиска',
        'Add entry' => 'Добавить запись',
        'Add' => 'Добавить',
        'Define rules for creating automatic appointments in this calendar based on ticket data.' =>
            'Задать правила для автоматического создания мероприятий в этом календаре, основанных на данных заявки.',
        'Add Rule' => 'Добавить правило',
        'Submit' => 'Отправить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentImport.tt
        'Go back' => 'Назад',
        'Uploaded file must be in valid iCal format (.ics).' => 'Загружаемый файл должен иметь правильный iCal формат (.ics).',
        'If desired Calendar is not listed here, please make sure that you have at least \'create\' permissions.' =>
            'Если желаемый календарь отсутствует в списке, убедитесь, что у вас есть хотя бы права на создание - \'create\'.',
        'Appointment Import' => 'Импорт мероприятий',
        'Upload' => 'Загрузить',
        'Update existing appointments?' => 'Обновить существующее мероприятие?',
        'All existing appointments in the calendar with same UniqueID will be overwritten.' =>
            'Все существующие мероприятия в календаре с одинаковым UniqueID будут перезаписаны.',
        'Upload calendar' => 'Загрузить календарь',
        'Import appointments' => 'Импортировать мероприятия',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEvent.tt
        'Add Notification' => 'Добавить уведомление',
        'Export Notifications' => 'Экспортировать уведомления',
        'Filter for Notifications' => 'Фильтр для уведомлений',
        'Filter for notifications' => 'Фильтр для уведомлений',
        'Here you can upload a configuration file to import appointment notifications to your system. The file needs to be in .yml format as exported by the appointment notification module.' =>
            'Здесь можно загрузить конфигурационный файл для импорта уведомлений о мероприятиях в систему. Файл должен быть в .yml формате, таком же, как при экспорте из модуля уведомлений о мероприятиях.',
        'Overwrite existing notifications?' => 'Перезаписать существующие уведомления?',
        'Upload Notification configuration' => 'Загрузить конфигурацию уведомлений',
        'Import Notification configuration' => 'Импортировать настройки уведомлений',
        'Appointment Notification Management' => 'Управление уведомлениями о мероприятиях',
        'Edit Notification' => 'Изменить уведомление',
        'List' => 'Список',
        'Delete' => 'Удаление',
        'Delete this notification' => 'Удалить это уведомление',
        'Show in agent preferences' => 'Показать в настройках агента',
        'Agent preferences tooltip' => 'Подсказка в настройках агента',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Это сообщение будет показано на экране настроек агента, как подсказка к этому уведомлению.',
        'Toggle this widget' => 'Переключить показ этого блока',
        'Events' => 'События',
        'Event' => 'Событие',
        'Here you can choose which events will trigger this notification. An additional appointment filter can be applied below to only send for appointments with certain criteria.' =>
            'Здесь вы можете выбрать какие события будут включать это уведомление. Дополнительный фильтр может быть применён ниже для их отправки для мероприятий, удовлетворяющих заданному условию.',
        'Appointment Filter' => 'Фильтр мероприятий.',
        'Type' => 'Тип',
        'Title' => 'Заголовок',
        'Location' => 'Местоположение',
        'Team' => 'Команда',
        'Resource' => 'Ресурсы',
        'Recipients' => 'Получатели',
        'Send to' => 'Кому отправить',
        'Send to these agents' => 'Отправить этим агентам',
        'Send to all group members (agents only)' => 'Отправить всем членам группы (только агенты)',
        'Send to all role members' => 'Отправить всем членам роли',
        'Also send if the user is currently out of office.' => 'Также отправить, если пользователь в настоящее время отсутствует на месте.',
        'Send on out of office' => 'Отправить для отсутствующих на месте',
        'Notify user just once per day about a single appointment using a selected transport.' =>
            'Уведомить пользователя только раз в день для каждого отдельного мероприятия, используя указанный способ доставки.',
        'Once per day' => 'Один раз в день',
        'Notification Methods' => 'Способы уведомлений',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Существует несколько способов для отправки этого уведомления каждому из получателей. Выберите хотя бы один из приведенных ниже.',
        'Enable this notification method' => 'Активировать этот способ уведомлений',
        'Transport' => 'Передача',
        'At least one method is needed per notification.' => 'Должен быть выбран хотя бы один способ для каждого уведомления',
        'Active by default in agent preferences' => 'Включен по умолчанию в настройках агента',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Это значение по умолчанию назначаемое агентам получателям, которые не имеют возможности сделать выбор для этого уведомления в своих настройках. Если включено, уведомление будет отправляться таким агентам.',
        'This feature is currently not available.' => 'Эта функция в данный момент не доступна',
        'No data found' => 'Данные не найдены',
        'No notification method found.' => 'Не задан метод уведомлений.',
        'Notification Text' => 'Текст уведомления',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Этот язык отсутствует или не включен для использования в системе. Этот текст уведомления будет удален, если он больше не нужен.',
        'Remove Notification Language' => 'Удалить язык уведомлений',
        'Subject' => 'Тема сообщения',
        'Text' => 'Текст',
        'Message body' => 'Содержание уведомления',
        'Add new notification language' => 'Добавить дополнительный язык для уведомлений',
        'Save Changes' => 'Сохранить изменения',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEventTransportEmailSettings.tt
        'Additional recipient email addresses' => 'Дополнительный адрес получателя',
        'This field must have less then 200 characters.' => 'Это поле должно содержать менее 200 символов',
        'Article visible for customer' => 'Сообщение видно клиенту',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Сообщение/Заметка будет создана, если уведомление отправляется клиенту или на дополнительный адрес почты.',
        'Email template' => 'Шаблон письма',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Используйте этот шаблон для создания полного почтового сообщения (только для сообщений в HTML формате).',
        'Enable email security' => 'Включить защиту почты',
        'Email security level' => 'Уровень защиты почты',
        'If signing key/certificate is missing' => 'Если ключ/сертификат подписи отсутствует',
        'If encryption key/certificate is missing' => 'Если ключ/сертификат шифрования отсутствует',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAttachment.tt
        'Add Attachment' => 'Добавить вложение',
        'Filter for Attachments' => 'Фильтр для вложений',
        'Filter for attachments' => 'Фильтр вложений',
        'Related Actions' => 'Схожие действия',
        'Templates' => 'Шаблоны',
        'Templates ↔ Attachments' => 'Шаблоны ↔ Вложения',
        'Attachment Management' => 'Управление прикрепленными файлами',
        'Edit Attachment' => 'Редактировать вложение',
        'Filename' => 'Имя файла',
        'Download file' => 'Скачать файл',
        'Delete this attachment' => 'Удалить это вложение',
        'Do you really want to delete this attachment?' => 'Вы действительно хотите удалить это вложение?',
        'Attachment' => 'Вложение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAutoResponse.tt
        'Add Auto Response' => 'Добавить автоответ',
        'Filter for Auto Responses' => 'Фильтр для автоответов',
        'Filter for auto responses' => 'Фильтр для автоответов',
        'Queues ↔ Auto Responses' => 'Очереди ↔ Автоответы',
        'Auto Response Management' => 'Управление автоответами',
        'Edit Auto Response' => 'Изменить автоответ',
        'Response' => 'Ответ',
        'Auto response from' => 'Автоответ от',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLog.tt
        'Time Range' => 'Интервал времени',
        'Show only communication logs created in specific time range.' =>
            'Показать записи журнала связи созданные в определенном промежутке времени.',
        'Filter for Communications' => 'Фильтр по сеансам связи',
        'Filter for communications' => 'Фильтр для сеансов',
        'Hint' => 'Подсказка',
        'In this screen you can see an overview about incoming and outgoing communications.' =>
            'На этой странице Вы можете видеть обзор входящих и исходящих сеансов связи.',
        'You can change the sort and order of the columns by clicking on the column header.' =>
            'Чтобы изменить сортировку или порядок столбцов, щёлкните мышью по заголовку столбцов.',
        'If you click on the different entries, you will get redirected to a detailed screen about the message.' =>
            'Нажимая на различные записи, Вы будете перенаправляться на страницу подробного просмотра сообщения.',
        'Communication Log' => 'Журнал сеансов связи',
        'Status for: %s' => 'Состояние: %s',
        'Failing accounts' => 'Неверные учетные записи',
        'Some account problems' => 'Есть проблемы с учетными записями',
        'No account problems' => 'Нет проблем с учетными записями',
        'No account activity' => 'Нет активных учетных записей',
        'Number of accounts with problems: %s' => 'Количество учетных записей с проблемами: %s',
        'Number of accounts with warnings: %s' => 'Количество учетных записей с предупреждениями: %s',
        'Failing communications' => 'Неудачные сеансы связи',
        'No communication problems' => 'Нет проблем с сеансами связи',
        'No communication logs' => 'Нет записей журнала сеансов связи',
        'Number of reported problems: %s' => 'Количество обнаруженных проблем:%s',
        'Open communications' => 'Открытые сеансы связи',
        'No active communications' => 'Нет активных сеансов связи',
        'Number of open communications: %s' => 'Количество открытых сеансов связи:%s',
        'Average processing time' => 'Среднее время сеанса',
        'List of communications (%s)' => 'Список сеансов связи (%s)',
        'Settings' => 'Параметры',
        'Entries per page' => 'Записей на странице',
        'No communications found.' => 'Нет сеансов связи.',
        '%s s' => '%s s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogAccounts.tt
        'Back to overview' => 'Назад в обзорный список',
        'Filter for Accounts' => 'Фильтр учетных записей',
        'Filter for accounts' => 'Фильтр учетных записей',
        'You can change the sort and order of those columns by clicking on the column header.' =>
            'Вы можете поменять сортировку и порядок колонок, кликнув по заголовку. ',
        'Account Status' => 'Статус учетной записи',
        'Account status for: %s' => 'Статус учетной записи для: %s',
        'Status' => 'Состояние',
        'Account' => 'Учетная запись',
        'Edit' => 'Редактировать',
        'No accounts found.' => 'Учетные записи не найдены.',
        'Communication Log Details (%s)' => 'Подробный просмотр записи журнала сеансов связи для:  (%s)',
        'Direction' => 'Направление',
        'Start Time' => 'Время начала',
        'End Time' => 'Время окончания',
        'No communication log entries found.' => 'Нет записей журнала сеансов связи.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogCommunications.tt
        'Duration' => 'Продолжительность',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogObjectLog.tt
        '#' => '#',
        'Priority' => 'Приоритет',
        'Module' => 'Модуль',
        'Information' => 'Сведения',
        'No log entries found.' => 'Нет записей в журнале.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogZoom.tt
        'Filter for Log Entries' => 'Фильтр для записей журнала',
        'Filter for log entries' => 'Фильтр для записей журнала',
        'Show only entries with specific priority and higher:' => 'Показывать записи только с указанным приоритетом и выше:',
        'Detail view for %s communication started at %s' => 'Подробный просмотр для %s сеанс начат в %s',
        'Communication Log Overview (%s)' => 'Просмотр журнала сеансов связи (%s)',
        'No communication objects found.' => 'Нет объектов сеансов связи.',
        'Communication Log Details' => 'Подробный просмотр журнала сеансов связи',
        'Please select an entry from the list.' => 'Выберите запись из списка.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerCompany.tt
        'Search' => 'Поиск',
        'Wildcards like \'*\' are allowed.' => 'Разрешены шаблоны типа \'*\'.',
        'Add Customer' => 'Добавить компанию',
        'Select' => 'Выбор',
        'Customer Users' => 'Клиенты',
        'Customers ↔ Groups' => 'Компании ↔ Группы',
        'Customer Management' => 'Управление компаниями',
        'Edit Customer' => 'Редактировать компанию',
        'List (only %s shown - more available)' => 'Список (%s показано, доступно еще)',
        'total' => 'всего',
        'Please enter a search term to look for customers.' => 'Введите запрос для поиска компании.',
        'Customer ID' => 'Компания',
        'Please note' => 'Помните',
        'This customer backend is read only!' => 'Этот бэкенд клиентов только для чтения!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerGroup.tt
        'Notice' => 'Замечание',
        'This feature is disabled!' => 'Данная функция отключена!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Просто используйте эту возможность, если хотите определить групповые права для клиентов.',
        'Enable it here!' => 'Включить функцию!',
        'Edit Customer Default Groups' => 'Редактировать группы клиента по умолчанию',
        'These groups are automatically assigned to all customers.' => 'Эти группы автоматически назначаются всем клиентам.',
        'You can manage these groups via the configuration setting "CustomerGroupCompanyAlwaysGroups".' =>
            'Этими группами можно управлять в настройке конфигурации "CustomerGroupAlwaysGroups".',
        'Filter for Groups' => 'Фильтры для Групп',
        'Select the customer:group permissions.' => 'Выберите разрешения клиент:группа.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Если ничего не выбрано, тогда у клиентов в этой группе не будет прав (заявки будут недоступны клиенту).',
        'Customers' => 'Компании',
        'Groups' => 'Группы',
        'Manage Customer-Group Relations' => 'Управлять связями Клиент ↔ Группа',
        'Search Results' => 'Результаты поиска',
        'Change Group Relations for Customer' => 'Изменить связи Группы с Клиентами',
        'Change Customer Relations for Group' => 'Изменить связь клиентов с группой',
        'Toggle %s Permission for all' => 'Переключить разрешение "%s" для всех',
        'Toggle %s permission for %s' => 'Переключить разрешение "%s" для %s',
        'Customer Default Groups:' => 'Клиентские группы по-умолчанию:',
        'No changes can be made to these groups.' => 'В эти группы нельзя внести изменения.',
        'Reference' => 'Ссылка',
        'ro' => 'Только чтение',
        'Read only access to the ticket in this group/queue.' => 'Права только на чтение заявки в данной группе/очереди',
        'rw' => 'Чтение/запись',
        'Full read and write access to the tickets in this group/queue.' =>
            'Полные права на чтение и запись для заявок в данной группе/очереди.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUser.tt
        'Back to search results' => 'Назад к результатам поиска',
        'Add Customer User' => 'Добавить учётную запись клиента',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Необходимо для наличия данных о клиенте и подключения к системе через интерфейс клиента.',
        'Customer Users ↔ Customers' => 'Клиенты ↔ Компании',
        'Customer Users ↔ Groups' => 'Клиенты ↔ Группы',
        'Customer Users ↔ Services' => 'Клиенты ↔ Сервисы',
        'Customer User Management' => 'Управление учётными записями клиентов',
        'Edit Customer User' => 'Изменить учётную запись клиента',
        'List (%s total)' => 'Список (%s всего)',
        'Username' => 'Логин',
        'Email' => 'Email',
        'Last Login' => 'Последний вход',
        'Login as' => 'Войти как агент',
        'Switch to customer' => 'Переключиться на клиента',
        'This customer backend is read only, but the customer user preferences can be changed!' =>
            'Этот клиентский бэкенд - только для чтения, но личные настройки клиента можно менять!',
        'This field is required and needs to be a valid email address.' =>
            'Это поле обязательно, и должно быть корректным адресом электронной почты.',
        'This email address is not allowed due to the system configuration.' =>
            'Такой адрес электронной почты не разрешен в конфигурации системы.',
        'This email address failed MX check.' => 'Этот адрес электронной почты не прошел проверку наличия MX-записей.',
        'DNS problem, please check your configuration and the error log.' =>
            'Проблема с DNS, проверьте вашу конфигурацию и лог ошибок.',
        'The syntax of this email address is incorrect.' => 'Синтаксис этого адреса электронной почты некорректен.',
        'This CustomerID is invalid.' => 'Этот ID компании недействительный.',
        'Effective Permissions for Customer User' => 'Действующие права для Клиента',
        'Group Permissions' => 'Права доступа группы',
        'This customer user has no group permissions.' => 'Этот клиент не имеет прав в группах.',
        'Table above shows effective group permissions for the customer user. The matrix takes into account all inherited permissions (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'Таблица выше показывает действующие права клиента в группах. Матрица учитывает все унаследованные разрешения (например, через группы клиентов). Примечание. В таблице не рассматриваются изменения, внесенные в эту форму, без ее отправки.',
        'Customer Access' => 'Доступ Клиента',
        'Customer' => 'Компания',
        'This customer user has no customer access.' => 'Этот клиент не имеет клиентского доступа.',
        'Table above shows granted customer access for the customer user by permission context. The matrix takes into account all inherited access (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'Таблица выше показывает действующие права клиента. Матрица учитывает все унаследованные разрешения (например, через группы клиентов). Примечание. В таблице не рассматриваются изменения, внесенные в эту форму, без ее отправки.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserCustomer.tt
        'Select the customer user:customer relations.' => 'Выберите связи Клиент:Компания.',
        'Manage Customer User-Customer Relations' => 'Управление Клиент ↔ Компания связями',
        'Change Customer Relations for Customer User' => 'Изменить связи Компаний с Клиентом',
        'Change Customer User Relations for Customer' => 'Изменить связи Клиентов с Компанией',
        'Toggle active state for all' => 'Сделать активным для всех',
        'Active' => 'Активно',
        'Toggle active state for %s' => 'Сделать активным для %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserGroup.tt
        'Just use this feature if you want to define group permissions for customer users.' =>
            'Просто используйте эту возможность, если хотите определить групповые права для клиентов.',
        'Edit Customer User Default Groups' => 'Изменить группы клиента по-умолчанию',
        'These groups are automatically assigned to all customer users.' =>
            'Эти группы автоматически назначаются всем клиентам.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Этими группами можно управлять в настройке конфигурации "CustomerGroupAlwaysGroups".',
        'Filter for groups' => 'Фильтр групп',
        'Select the customer user - group permissions.' => 'Выберите клиент - групповые права.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer user).' =>
            'Если ничего не выбрано, тогда у клиентов в этой группе не будет прав (заявки будут недоступны клиенту).',
        'Manage Customer User-Group Relations' => 'Управление Клиент ↔ Группа связями',
        'Customer User Default Groups:' => 'Группы клиента по-умолчанию:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserService.tt
        'Edit default services' => 'Редактировать сервисы по умолчанию',
        'Filter for Services' => 'Фильтр для Сервисов',
        'Filter for services' => 'Фильтр для Сервисов',
        'Services' => 'Сервисы',
        'Service Level Agreements' => 'Соглашения об Уровне Сервиса',
        'Manage Customer User-Service Relations' => 'Управление Клиент ↔ Сервис связями',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicField.tt
        'Add new field for object' => 'Добавить новое поле для объекта',
        'Filter for Dynamic Fields' => 'Фильтр для динамических полей',
        'Filter for dynamic fields' => 'Фильтр для динамических полей',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Чтобы добавить новое поле, выберите один из типов из появившегося списка, тип определяет границы использования для поля и он не может быть изменен после создания поля.',
        'Import and export of configurations' => 'Импорт и экспорт настроек',
        'Upload a file in YAML format (as provided by the export) to import dynamic field configurations.' =>
            'Загрузите файл в YAML формате (полученный при экспорте), чтобы обновить настройки динамических полей.',
        'Overwrite existing configurations' => 'Переписать существующие настройки',
        'Import configurations' => 'Импорт настроек',
        'Export configurations' => 'Экспорт настроек',
        'Process Management' => 'Управление Процессами',
        'Dynamic fields ↔ Screens' => 'Динамические поля ↔ Экраны',
        'Dynamic Fields Management' => 'Управление динамическими полями',
        'Dynamic Fields List' => 'Список динамических полей',
        'Dynamic fields per page' => 'Динамических полей на страницу',
        'Label' => 'Название',
        'Order' => 'Порядок',
        'Object' => 'Объект',
        'Delete this field' => 'Удалить это поле',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldCheckbox.tt
        'Go back to overview' => 'Вернуться к обзору',
        'Dynamic Fields' => 'Динамические поля',
        'General' => 'Общие',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Данное поле обязательно, и может состоять только из букв и цифр.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Должно быть уникальным, и может состоять только из букв и цифр.',
        'Changing this value will require manual changes in the system.' =>
            'Изменение этого значения потребует ручных изменений в системе.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Это имя, под которым поле будет показано на тех экранах, на которых оно активно.',
        'Field order' => 'Порядок поля',
        'This field is required and must be numeric.' => 'Это поле обязательно, и должно быть числовым.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Это порядок, в котором поле будет показываться среди других полей на тех экранах, где оно активно.',
        'Is not possible to invalidate this entry, all config settings have to be changed beforehand.' =>
            'Невозможно аннулировать эту запись, все настройки конфигурации должны быть изменены заранее.',
        'Field type' => 'Тип поля',
        'Object type' => 'Тип объекта',
        'Internal field' => 'Внутреннее поле',
        'This field is protected and can\'t be deleted.' => 'Это поле защищено и не может быть удалено.',
        'This dynamic field is used in the following config settings:' =>
            'Это динамическое поле используется в следующих параметрах конфигурации:',
        'Field Settings' => 'Настройки поля',
        'Default value' => 'Значение по умолчанию',
        'This is the default value for this field.' => 'Это значение по умолчанию для данного поля.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldConfigurationImportExport.tt
        'Select the dynamic fields you want to import and click on \'Import\'.' =>
            '',
        'Select the dynamic fields whose configuration you want to export and click on \'Export\' to generate a YAML file.' =>
            '',
        'Dynamic field configurations: %s' => '',
        'Dynamic fields' => 'Динамические поля',
        'For the following dynamic fields a configuration cannot be imported because of an invalid backend.' =>
            '',
        'Select all field configurations' => '',
        'Select all screen configurations' => '',
        'The uploaded file does not contain configuration(s), is not a YAML file, is damaged or has the wrong structure.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDateTime.tt
        'Default date difference' => 'Диапазон дат по умолчанию',
        'This field must be numeric.' => 'Это поле должно быть числовым',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Разница в секундах с NOW (текущим моментом) для подсчета значения по умолчанию для этого поля (например, 3600 или -60).',
        'Define years period' => 'Задать период лет',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Активируйте эту возможность для задания фиксированного диапазона лет (в прошлом и в будущем) для отображения в части поля, показывающей год.',
        'Years in the past' => 'Лет в прошлом',
        'Years in the past to display (default: 5 years).' => 'Число лет в прошлом для отображения (по умолчанию: 5 лет)',
        'Years in the future' => 'Лет в будущее',
        'Years in the future to display (default: 5 years).' => 'Число лет в будущее для отображения (по умолчанию: 5 лет)',
        'Show link' => 'Показывать ссылку',
        'Reserved keywords. The following placeholders are not allowed:' =>
            '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Здесь можно указать необязательную HTTP-ссылку для значения поля на страницах Обзоров и Подробного просмотра.',
        'If special characters (&, @, :, /, etc.) should not be encoded, use \'url\' instead of \'uri\' filter.' =>
            'Если специальные символы (&, @, :, /, т.п.) не должны быть закодированы, вместо "uri" используйте фильтр "url".',
        'Example' => 'Пример',
        'Link for preview' => 'Ссылка для предпросмотра',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Эта ссылка будет использована для предпросмотра, который будет отображаться по наведению на нее в экране заявки. Чтобы эта опция работала, поле со ссылкой выше также должно быть заполнено.',
        'Restrict entering of dates' => 'Ограничить ввод дат',
        'Here you can restrict the entering of dates of tickets.' => 'Здесь вы можете ограничить ввода дат в заявке.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDropdown.tt
        'Possible values' => 'Возможные значения',
        'Key' => 'Ключ',
        'Value' => 'Значение',
        'Remove value' => 'Удалить значение',
        'Add value' => 'Добавить значение',
        'Add Value' => 'Добавить Значение',
        'Add empty value' => 'Добавить пустое значение',
        'Activate this option to create an empty selectable value.' => 'Отметьте эту опцию для создания пустого выбираемого значения.',
        'Tree View' => 'Иерархический вид',
        'Activate this option to display values as a tree.' => 'Включите для отображения в иерархическом виде.',
        'Translatable values' => 'Переводимые значения',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Если включить эту опцию, значения, при отображении, будут переведены на заданный язык.',
        'Note' => 'Заметка',
        'You need to add the translations manually into the language translation files.' =>
            'Вам необходимо вручную добавить переводы значений в файлы переводов для используемых языков.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldScreenConfiguration.tt
        'Assignment of dynamic fields to screens' => '',
        'Overview' => 'Обзор',
        'Screens' => '',
        'Overview Default Columns' => '',
        'Add dynamic field' => 'Добавить динамическое поле',
        'You can assign elements by dragging and dropping them to the lists of available, disabled, assigned and required elements.' =>
            '',
        'Filter available elements' => '',
        'Assign selected elements to this list' => '',
        'Select all' => 'Выбрать все',
        'Filter disabled elements' => '',
        'Filter assigned elements' => '',
        'Filter required elements' => '',
        'Reset' => 'Сбросить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldText.tt
        'Number of rows' => 'Число строк',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Задает высоту (в строках) для этого поля в режиме редактирования.',
        'Number of cols' => 'Число столбцов',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Задает ширину (в символах) для этого поля в режиме редактирования.',
        'Check RegEx' => 'Регулярное выражение для проверки',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Здесь можно задать регулярное выражение для проверки значения. Оно будет выполняться с расширением xms.',
        'RegEx' => 'Регулярное выражение',
        'Invalid RegEx' => 'Некорректное регулярное выражение',
        'Error Message' => 'Сообщение об ошибке',
        'Add RegEx' => 'Добавить регулярное выражение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice.tt
        'Default search term' => '',
        'This is the default term for the click search.' => '',
        'Initial default search term' => '',
        'This is the default search term when the mask is loaded.' => '',
        'Attributes' => 'Свойства',
        'Attributes for invoker execution (initially default values will be used).' =>
            '',
        'Attribute keys' => '',
        'Custom attribute form for invoker execution.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/Config.tt
        'Web service' => 'Веб-сервисы',
        'Web service which will be used for this dynamic field.' => '',
        'Invoker to search for records' => '',
        'Invoker which will be used for this dynamic field. Searches for the search term(s) and returns an array as result. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Invoker to get a record' => '',
        'Invoker which will be used for this dynamic field. Returns a hash of the record that will be found when searching for its identifier in the field configured in \'key for stored value\' below. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Backend' => 'Бэкенд',
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
        'Limit' => 'Ограничение',
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
            'С помощью этого модуля администраторы могут отправлять сообщения агентам, являющимся членом группы или роли.',
        'Admin Message' => 'Сообщение администратора',
        'Create Administrative Message' => 'Создать сообщение администратора',
        'Your message was sent to' => 'Ваше сообщение было отправлено',
        'From' => 'Отправитель',
        'Send message to users' => 'Отправить сообщение пользователям',
        'Send message to group members' => 'Отправить сообщение членам группы',
        'Group members need to have permission' => 'Члены группы должны иметь разрешение',
        'Send message to role members' => 'Отправить сообщение членам роли',
        'Also send to customers in groups' => 'Также отправить клиентам в группах',
        'Body' => 'Тело сообщения',
        'Send' => 'Отправить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericAgent.tt
        'Add Job' => 'Добавить Задание',
        'Filter for Jobs' => 'Фильтр Заданий',
        'Filter for jobs' => 'Фильтр заданий',
        'Generic Agent Job Management' => 'Управление заданиями Планировщика задач',
        'Edit Job' => 'Изменить задание',
        'Run Job' => 'Выполнить Задание',
        'Last run' => 'Дата последнего запуска',
        'Run' => 'Выполнить',
        'Delete this task' => 'Удалить задачу',
        'Run this task' => 'Запустить задачу',
        'Do you really want to delete this generic agent job?' => 'Вы действительно хотите удалить данную задачу?',
        'Job Settings' => 'Настройки задания',
        'Job name' => 'Имя задания',
        'The name you entered already exists.' => 'Введенное вами имя уже существует.',
        'Automatic Execution (Multiple Tickets)' => 'Автоматическое выполнение (несколько заявок)',
        'Execution Schedule' => 'Управление запуском',
        'Schedule minutes' => 'Запускать в минуты',
        'Schedule hours' => 'Запускать в часы',
        'Schedule days' => 'Запускать в дни',
        'Automatic execution values are in the system timezone.' => '',
        'Currently this generic agent job will not run automatically.' =>
            'В данный момент это задание не запускается автоматически.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Для автоматического запуска укажите как минимум одно из значений в минутах, часах или днях!',
        'Event Based Execution (Single Ticket)' => 'Управляемое событием выполнение (одна заявка)',
        'Event Triggers' => 'Триггеры событий',
        'List of all configured events' => 'Список всех настроенных событий',
        'Delete this event' => 'Удалить это событие',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Дополнительно или или вместо запуска по расписанию, вы можете задать события для заявки, которые запустят эту задачу.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Если событие по заявке наступило, фильтр заявок находит соответствующие заявки. Только после этого стартует задача для этой заявки.',
        'Add Event Trigger' => 'Добавить триггер события',
        'To add a new event select the event object and event name' => 'Чтобы добавить новое событие выберите объект и имя события',
        'Do you really want to delete this event trigger?' => 'Вы действительно хотите удалить этот триггер события?',
        'Select Tickets' => 'Выбрать заявки',
        '(e. g. 10*5155 or 105658*)' => '(например, 10*5155 или 105658*)',
        '(e. g. 234321)' => '(например, 234321)',
        'Customer user ID' => 'Логин клиента',
        '(e. g. U5150)' => '(например, U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Полнотекстовый поиск в сообщении (например, "Mar*in" или "Baue*").',
        'To' => 'Получатель',
        'Cc' => 'Копия',
        'Service' => 'Сервис',
        'Service Level Agreement' => 'Соглашение об Уровне Сервиса',
        'Queue' => 'Очередь',
        'State' => 'Состояние',
        'Agent' => 'Агент',
        'Owner' => 'Владелец',
        'Responsible' => 'Ответственный',
        'Ticket lock' => 'Блокировка заявки',
        'Create times' => 'Когда создана',
        'No create time settings.' => 'Без учета времени создания.',
        'Ticket created' => 'Заявка создана',
        'Ticket created between' => 'Заявка создана между',
        'and' => 'и',
        'Last changed times' => 'Время последнего изменения',
        'No last changed time settings.' => 'Не заданы настройки для времени последнего изменения.',
        'Ticket last changed' => 'Последнее изменение заявки',
        'Ticket last changed between' => 'Время последнего изменения заявки между',
        'Change times' => 'Когда изменена',
        'No change time settings.' => 'Нет настройки времени изменения.',
        'Ticket changed' => 'Заявка изменена',
        'Ticket changed between' => 'Заявка изменена в период',
        'Last close times' => '',
        'No last close time settings.' => '',
        'Ticket last close' => '',
        'Ticket last close between' => '',
        'Close times' => 'Когда закрыта',
        'No close time settings.' => 'Без учета времени закрытия.',
        'Ticket closed' => 'Заявка закрыта',
        'Ticket closed between' => 'Заявка закрыта между',
        'Pending times' => 'Когда отложена',
        'No pending time settings.' => 'Без учета времени напоминания.',
        'Ticket pending time reached' => 'Достигнуто время напоминания по заявке',
        'Ticket pending time reached between' => 'Время напоминания по заявке достигнуто между',
        'Escalation times' => 'Когда эскалирована',
        'No escalation time settings.' => 'Без учета времени эскалации',
        'Ticket escalation time reached' => 'Заявка была эскалирована',
        'Ticket escalation time reached between' => 'Заявка была эскалирована между',
        'Escalation - first response time' => 'Эскалация - время первого ответа',
        'Ticket first response time reached' => 'Время первого ответа по заявке достигнуто',
        'Ticket first response time reached between' => 'Время первого ответа по заявке достигнуто между',
        'Escalation - update time' => 'Эскалация - время обновления',
        'Ticket update time reached' => 'Время обновления для заявки достигнуто',
        'Ticket update time reached between' => 'Время обновления для заявки достигнуто между',
        'Escalation - solution time' => 'Эскалация - время решения',
        'Ticket solution time reached' => 'Время решения заявки достигнуто',
        'Ticket solution time reached between' => 'Время решения заявки достигнуто между',
        'Archive search option' => 'Опция Поиск в архиве',
        'Update/Add Ticket Attributes' => 'Обновить/добавить атрибуты заявки',
        'Set new service' => 'Установить новый сервис',
        'Set new Service Level Agreement' => 'Установить новое Соглашение об Уровне Сервиса (SLA)',
        'Set new priority' => 'Установить новый приоритет',
        'Set new queue' => 'Установить новую очередь',
        'Set new state' => 'Установить новое состояние',
        'Pending date' => 'Дата ожидания',
        'Set new agent' => 'Назначить нового агента',
        'new owner' => 'новый владелец',
        'new responsible' => 'новый ответственный',
        'Set new ticket lock' => 'Установить новое состояние блокировки',
        'New customer user ID' => 'Новый логин клиента',
        'New customer ID' => 'Новый ID компании',
        'New title' => 'Новый заголовок',
        'New type' => 'Новый тип',
        'Archive selected tickets' => 'Архивировать выбранные заявки',
        'Add Note' => 'Добавить заметку/сообщение',
        'Visible for customer' => 'Видно клиенту',
        'Time units' => 'Затраченное время',
        'Execute Ticket Commands' => 'Выполнить действия над заявкой',
        'Send agent/customer notifications on changes' => 'Отправить уведомление агенту/клиенту при изменениях',
        'Delete tickets' => 'Удалить заявки',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Предупреждение: Все выбранные заявки будут удалены из базы данных без возможности восстановления!',
        'Execute Custom Module' => 'Запустить пользовательский модуль',
        'Param %s key' => 'Параметр %s ключ',
        'Param %s value' => 'Параметр %s значение',
        'Results' => 'Результаты',
        '%s Tickets affected! What do you want to do?' => 'Затронуто %s заявок! Что желаете сделать?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Внимание! Вы использовали опцию УДАЛЕНИЯ. Все удаленные заявки будут потеряны!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Внимание: Всего %s заявок затронуто, но только %s могут быть изменены за один запуск задания!',
        'Affected Tickets' => 'Выбранные заявки',
        'Age' => 'Возраст',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceDebugger.tt
        'Go back to web service' => 'Вернуться к веб-сервису',
        'Clear' => 'Очистить',
        'Do you really want to clear the debug log of this web service?' =>
            'Действительно очистить журнал отладки для этого веб-сервиса?',
        'GenericInterface Web Service Management' => 'Управление GenericInterface Web Service',
        'Web Service Management' => 'Управление веб-сервисами',
        'Debugger' => 'Отладчик',
        'Request List' => 'Список запросов',
        'Time' => 'Время',
        'Communication ID' => 'Communication ID',
        'Remote IP' => 'Удалённый IP-адрес',
        'Loading' => 'Загрузка',
        'Select a single request to see its details.' => 'Выберите запрос для просмотра подробностей.',
        'Filter by type' => 'Фильтр по типу',
        'Filter from' => 'Фильтр с',
        'Filter to' => 'Фильтр по',
        'Filter by remote IP' => 'Фильтр по удалённому IP-адресу',
        'Refresh' => 'Обновить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingDefault.tt
        'Do you really want to delete this error handling module?' => 'Вы действительно хотите удалить этот модуль обработки ошибок?',
        'All configuration data will be lost.' => 'Все данные конфигурации будут потеряны.',
        'Add ErrorHandling' => 'Добавить ErrorHandling',
        'Edit ErrorHandling' => 'Редактировать ErrorHandling',
        'General options' => 'Общие настройки',
        'The name can be used to distinguish different error handling configurations.' =>
            'Имя может быть использовано для отличия настроек обработки ошибок.',
        'Please provide a unique name for this web service.' => 'Укажите уникальное имя для этого веб-сервиса.',
        'Error handling module backend' => 'Бэкенд-модуль обработки ошибок',
        'This Znuny error handling backend module will be called internally to process the error handling mechanism.' =>
            'Этот серверный модуль обработки ошибок Znuny будет вызываться скрыто для обеспечения работы механизма обработки ошибок.',
        'Processing options' => 'Настройки выполнения',
        'Configure filters to control error handling module execution.' =>
            'Настроить фильтры для управления выполнением модуля обработки ошибок.',
        'Only requests matching all configured filters (if any) will trigger module execution.' =>
            'Запрос на вызов модуля выполняется только в случае соответствия всем (если есть) настроенным фильтрам.',
        'Operation filter' => 'Фильтр операций',
        'Only execute error handling module for selected operations.' => 'Выполнять модуль обработки ошибок только для избранных операций.',
        'Note: Operation is undetermined for errors occuring while receiving incoming request data. Filters involving this error stage should not use operation filter.' =>
            'Заметка: Операция не определена из-за ошибок при получении поступающего запроса данных. Фильтры, содержащие эту ошибку в операции не должны использовать фильтр процессов.',
        'Invoker filter' => 'Фильтр вызовов',
        'Only execute error handling module for selected invokers.' => '',
        'Error message content filter' => 'Фильтр по содержимому ошибки',
        'Enter a regular expression to restrict which error messages should cause error handling module execution.' =>
            'Введите регулярное выражение для ограничения сообщений об ошибках, которые будут приходить от модуля обработки ошибок.',
        'Error message subject and data (as seen in the debugger error entry) will considered for a match.' =>
            'Для поиска соответствия будет рассматриваться тема сообщения об ошибке и данные (как они видны в записи об ошибке отладчика).',
        'Example: Enter \'^.*401 Unauthorized.*\$\' to handle only authentication related errors.' =>
            'Пример: Введите \'^.*401 Unauthorized.*\$\', чтобы обрабатывать ошибки, связанные только с аутентификацией.',
        'Error stage filter' => 'Фильтр ошибок',
        'Only execute error handling module on errors that occur during specific processing stages.' =>
            'Выполнять модуль обработки ошибок только для ошибок возникших во время специфичных стадий обработки.',
        'Example: Handle only errors where mapping for outgoing data could not be applied.' =>
            'Пример: Обрабатывать только ошибки, где отображение для исходящих данных не могло быть применено.',
        'Error code' => 'Код ошибки',
        'An error identifier for this error handling module.' => 'Идентификатор ошибки для этого модуля обработки ошибок.',
        'This identifier will be available in XSLT-Mapping and shown in debugger output.' =>
            'Этот идентификатор будет доступен в XSLT-Mapping и отображается в листинге отладчика.',
        'Error message' => 'Сообщение об ошибке',
        'An error explanation for this error handling module.' => 'Пояснение ошибки для этого модуля обработки ошибок.',
        'This message will be available in XSLT-Mapping and shown in debugger output.' =>
            'Это сообщение будет доступно в XSLT-Mapping и отображается в листинге отладчика.',
        'Define if processing should be stopped after module was executed, skipping all remaining modules or only those of the same backend.' =>
            'Определяет следует ли прекратить обработку после выполнения модуля, пропустив все оставшиеся модули или только те из них, которые используются в одном и том же бэкенде.',
        'Default behavior is to resume, processing the next module.' => 'Поведение по умолчанию - продолжить, перейти к следующему модулю.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingRequestRetry.tt
        'This module allows to configure scheduled retries for failed requests.' =>
            'Этот модуль позволяет настраивать запланированные попытки неудачных запросов.',
        'Default behavior of GenericInterface web services is to send each request exactly once and not to reschedule after errors.' =>
            'Поведение GenericInterface веб-сервисов по умолчанию - отсылать каждый запрос ровно один раз и не повторять после ошибок.',
        'If more than one module capable of scheduling a retry is executed for an individual request, the module executed last is authoritative and determines if a retry is scheduled.' =>
            'Если для отдельного запроса запущено больше одного модуля способных планировать повтор, последний выполняемый модуль является полномочным и определяет, планируется ли повторная попытка.',
        'Request retry options' => 'Настройка попыток запроса',
        'Retry options are applied when requests cause error handling module execution (based on processing options).' =>
            'Опции повтора применяются, когда запросы вызывают выполнение модуля обработки ошибок (на основе параметров обработки).',
        'Schedule retry' => 'Повтор по расписанию',
        'Should requests causing an error be triggered again at a later time?' =>
            'Должен ли запрос приведший к ошибке повторен позже?',
        'Initial retry interval' => 'Начальный интервал попыток',
        'Interval after which to trigger the first retry.' => 'Интервал, после которого производится первая попытка.',
        'Note: This and all further retry intervals are based on the error handling module execution time for the initial request.' =>
            'Внимание: Этот и последующие интервалы между попытками основаны на времени выполнения обработчика ошибок после первого запроса.',
        'Factor for further retries' => 'Фактор для дальнейших попыток',
        'If a request returns an error even after a first retry, define if subsequent retries are triggered using the same interval or in increasing intervals.' =>
            'Задать, если первый запрос вызвал ошибку, то последующие должны выполняться через такой же или увеличивающийся интервал.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\' and retry factor at \'2\', retries would be triggered at 10:01 (1 minute), 10:03 (2*1=2 minutes), 10:07 (2*2=4 minutes), 10:15 (2*4=8 minutes), ...' =>
            'Пример: если запрос первоначально запускается в 10:00 с начальным интервалом "1 минута" и коэффициент повторения равен "2", то повторы будут запускаться в 10:01 (1 минута), 10:03 (2 * 1 = 2 минуты), 10:07 (2 * 2 = 4 минуты), 10:15 (2 * 4 = 8 минут), ...',
        'Maximum retry interval' => 'Максимальный интервал повторных попыток',
        'If a retry interval factor of \'1.5\' or \'2\' is selected, undesirably long intervals can be prevented by defining the largest interval allowed.' =>
            'Если выбран коэффициент интервала повторения \'1,5\' или \'2\', нежелательные длинные интервалы могут быть заблокированы путем определения максимального разрешенного интервала.',
        'Intervals calculated to exceed the maximum retry interval will then automatically be shortened accordingly.' =>
            'Интервалы, рассчитанные для превышения максимального интервала повтора, затем автоматически соответственно будут уменьшены.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum interval at \'5 minutes\', retries would be triggered at 10:01 (1 minute), 10:03 (2 minutes), 10:07 (4 minutes), 10:12 (8=>5 minutes), 10:17, ...' =>
            'Пример: Если запрос сначала запускается в 10:00 с начальным интервалом "1 минута", коэффициентом повторения "2" и максимальным интервалом "5 минут", повторные попытки будут срабатывать в 10:01 (1 минута), 10:03 (2 минуты), 10:07 (4 минуты), 10:12 (8=>5 минут), 10:17, ...',
        'Maximum retry count' => 'Максимальное значение счетчика попыток',
        'Maximum number of retries before a failing request is discarded, not counting the initial request.' =>
            'Максимальное количество попыток (не учитывая начальный запрос) прежде чем неудачный запрос будет отброшен.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry count at \'2\', retries would be triggered at 10:01 and 10:02 only.' =>
            'Пример: Если запрос сначала запускается в 10:00 с начальным интервалом "1 минута", коэффициентом повторения "2" и максимальным числом попыток "2", повторные попытки будут срабатывать только в 10:01 и 10:02.',
        'Note: Maximum retry count might not be reached if a maximum retry period is configured as well and reached earlier.' =>
            'Примечание: Максимальный счетчик повторов может и не быть достигнут, если также настроен максимальный период для повтора, который достигнут ранее.',
        'This field must be empty or contain a positive number.' => 'Это поле должно быть пустым или содержать положительное число.',
        'Maximum retry period' => 'Максимальный период повтора',
        'Maximum period of time for retries of failing requests before they are discarded (based on the error handling module execution time for the initial request).' =>
            'Максимальный период времени для повторения неудачных запросов прежде, чем они будут отменены (на основе времени выполнения модуля обработки ошибок для первоначального запроса).',
        'Retries that would normally be triggered after maximum period is elapsed (according to retry interval calculation) will automatically be triggered at maximum period exactly.' =>
            'Повторные попытки, которые обычно запускаются после истечения максимального периода (в соответствии с расчетом интервалов повторов), будут автоматически срабатывать точно в момент достижения максимального периода.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry period at \'30 minutes\', retries would be triggered at 10:01, 10:03, 10:07, 10:15 and finally at 10:31=>10:30.' =>
            'Пример: Если запрос сначала запускается в 10:00 с начальным интервалом "1 минута", коэффициентом повторения "2" и максимальным периодом повторения "30 минут", повторные попытки будут срабатывать в 10:01, 10:03, 10:07, 10:15 и окончательно в 10:31=>10:30.',
        'Note: Maximum retry period might not be reached if a maximum retry count is configured as well and reached earlier.' =>
            'Примечание: Максимальный период повторения может и не быть достигнут, если также настроен максимальный счетчик повторов, который достигнут ранее.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerDefault.tt
        'Do you really want to delete this invoker?' => 'Вы действительно желаете удалить этот инициатор вызова (invoker)?',
        'Add Invoker' => 'Добавить Invoker',
        'Edit Invoker' => 'Редактировать Invoker',
        'Invoker Details' => 'Подробности для Invoker ',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Имя обычно используется для вызова операции удаленного веб-сервиса.',
        'Invoker backend' => 'Invoker бэкэнд',
        'This Znuny invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Этот модуль Znuny invoker будет вызываться для подготовки данных, отправляемых в удаленную систему и для обработки ответных данных.',
        'Mapping for outgoing request data' => 'Соответствие исходящему запросу данных',
        'Configure' => 'Конфигурировать',
        'The data from the invoker of Znuny will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Данные полученные от инициатора вызова (invoker) Znuny будут преобразованы с использованием этого соответствия в ожидаемый удаленной стороной формат.',
        'Mapping for incoming response data' => 'Соответствие входящим ответным данным',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of Znuny expects.' =>
            'Данные ответа будут преобразованы с использованием этого соответствия в формат, ожидаемый инициатором вызова (invoker) Znuny.',
        'Asynchronous' => 'Асинхронный',
        'Condition' => 'Условие',
        'Edit this event' => 'Редактировать это событие',
        'This invoker will be triggered by the configured events.' => 'Этот инициатор вызова (invoker) будет вызван при наступлении заданных событий.',
        'Add Event' => 'Добавить событие',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Чтобы добавить новое событие выберите объект и имя события и щелкните кнопку "+"',
        'Asynchronous event triggers are handled by the Znuny Scheduler Daemon in background (recommended).' =>
            'Асинхронные триггеры событий будут обрабатываться Планировщиком задач Znuny в фоновом режиме (рекомендуется).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Синхронные триггеры событий будут обрабатываться непосредственно при веб-запросе.',
        'Add all attachments' => 'Добавьте все вложения',
        'Add all attachments to invoker payload.' => 'Добавьте все вложения как полезную информацию (payload) в инициатор вызова (invoker).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerEvent.tt
        'GenericInterface Invoker Event Settings for Web Service %s' => '',
        'Go back to' => 'Вернуться к',
        'Delete all conditions' => 'Удалить все условия',
        'Do you really want to delete all the conditions for this event?' =>
            'Вы действительно хотите удалить все условия для этого события?',
        'General Settings' => 'Общие настройки',
        'Event type' => 'Тип события',
        'Conditions' => 'Условия',
        'Conditions can only operate on non-empty fields.' => 'Условия могут действовать только на заполненных полях.',
        'Type of Linking between Conditions' => 'Тип связи между Условиями',
        'Remove this Condition' => 'Удалить это Условие',
        'Type of Linking' => 'Тип связи',
        'Fields' => 'Поля',
        'Add a new Field' => 'Добавить новое поле',
        'Remove this Field' => 'Удалить это поле',
        'And can\'t be repeated on the same condition.' => 'Оператор AND/И не может повторно использоваться в одном и том же условии.',
        'Add New Condition' => 'Добавить новое Условие',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingSimple.tt
        'Mapping Simple' => 'Простое сопоставление',
        'Default rule for unmapped keys' => 'Правило по умолчанию для не назначенных кнопок',
        'This rule will apply for all keys with no mapping rule.' => 'Это правило будет использоваться для всех не назначенных кнопок',
        'Default rule for unmapped values' => 'Правило по умолчанию для неопределенных значений',
        'This rule will apply for all values with no mapping rule.' => 'Это правило будет применено для всех значений без правил',
        'New key map' => 'Новая карта ключкй',
        'Add key mapping' => 'Добавить мапинг ключа',
        'Mapping for Key ' => 'Мапинг для ключа',
        'Remove key mapping' => 'Удалить сопоставление ключей',
        'Key mapping' => 'Мапинг ключа',
        'Map key' => 'Карта ключей',
        'matching' => '',
        'to new key' => 'для нового ключа',
        'Value mapping' => 'Значение мапинга',
        'Map value' => 'Карта значений',
        'new value' => '',
        'Remove value mapping' => 'Удалить сопоставление значений',
        'New value map' => 'Новая карта значений',
        'Add value mapping' => 'Добавить сопоставление значений',
        'Do you really want to delete this key mapping?' => 'Вы действительно хотите удалить это сопоставление ключей?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingXSLT.tt
        'General Shortcuts' => 'Общие сокращения',
        'MacOS Shortcuts' => 'Сокращения MacOS ',
        'Comment code' => 'Закомметировать код',
        'Uncomment code' => 'Раскомметировать код',
        'Auto format code' => 'Авто форматирование кода',
        'Expand/Collapse code block' => 'Развернуть/Свернуть блок кода',
        'Find' => 'Найти',
        'Find next' => 'Найти следующее',
        'Find previous' => 'Найти предыдущее',
        'Find and replace' => 'Найти и заменить',
        'Find and replace all' => 'Найти и заменить все',
        'XSLT Mapping' => 'Отображение XSLT',
        'XSLT stylesheet' => 'Таблица стилей XSLT',
        'The entered data is not a valid XSLT style sheet.' => 'Указана не допустимая таблица стилей XSLT.',
        'Here you can add or modify your XSLT mapping code.' => 'Здесь можно добавить или изменить ваш XSLT код.',
        'The editing field allows you to use different functions like automatic formatting, window resize as well as tag- and bracket-completion.' =>
            'Поле редактирования позволяет использовать различные функции, например, такие как автоматическое форматирование, изменение размеров окна, а также автозавершение тега и скобки.',
        'Data includes' => 'Данные включают',
        'Select one or more sets of data that were created at earlier request/response stages to be included in mappable data.' =>
            'Выберите один или несколько наборов данных, которые создавались на более ранних этапах запроса/ответа, которые будут включены в отображаемые данные.',
        'These sets will appear in the data structure at \'/DataInclude/<DataSetName>\' (see debugger output of actual requests for details).' =>
            'Эти наборы появятся в структуре данных в \'/DataInclude/<DataSetName>\' (для получения детальной информации смотрите вывод отладчика фактических запросов).',
        'Force array for tags' => '',
        'Enter tags separated by space for which array representation should be forced.' =>
            '',
        'Keep XML attributes' => '',
        'Only needed for content type XML.' => 'Требуется только для типа содержимого XML.',
        'Data key regex filters (before mapping)' => '',
        'Data key regex filters (after mapping)' => '',
        'Regular expressions' => 'Регулярные выражения',
        'Replace' => 'Заменить',
        'Remove regex' => 'Удалить регулярное выражение',
        'Add regex' => 'Добавить регулярное выражение',
        'These filters can be used to transform keys using regular expressions.' =>
            'Эти фильтры могут быть использованы для преобразования ключей с помощью регулярных выражений.',
        'The data structure will be traversed recursively and all configured regexes will be applied to all keys.' =>
            'Проход по структуре данных будет происходить рекурсивно, и все настроенные регулярные выражения будут применены ко всем ключам.',
        'Use cases are e.g. removing key prefixes that are undesired or correcting keys that are invalid as XML element names.' =>
            'Примеры использования, такие как, удаление ключевых префиксов, которые являются нежелательными или исправление ключей, которые являются некорректными в качестве имен XML-элементов.',
        'Example 1: Search = \'^jira:\' / Replace = \'\' turns \'jira:element\' into \'element\'.' =>
            'Пример 1: Поиск = \'^jira:\' / Замена = \'\' преобразует \'jira:element\' в \'element\'.',
        'Example 2: Search = \'^\' / Replace = \'_\' turns \'16x16\' into \'_16x16\'.' =>
            'Пример 2: Поиск = \'^\' / Замена = \'_\' преобразует \'16x16\' в \'_16x16\'.',
        'Example 3: Search = \'^(?<number>\d+) (?<text>.+?)\$\' / Replace = \'_\$+{text}_\$+{number}\' turns \'16 elementname\' into \'_elementname_16\'.' =>
            'Пример 3: Поиск = \'^(?\d+) (?.+?)\$\' / Замена = \'_\$+{text}_\$+{number}\' преобразует \'16 elementname\' в \'_elementname_16\'.',
        'For information about regular expressions in Perl please see here:' =>
            'Для информации о регулярных выражениях в Perl смотрите здесь:',
        'Perl regular expressions tutorial' => 'Руководство по регулярным выражениям Perl',
        'If modifiers are desired they have to be specified within the regexes themselves.' =>
            '',
        'Regular expressions defined here will be applied before the XSLT mapping.' =>
            'Регулярные выражения заданные здесь будут применены до XSLT mapping.',
        'Regular expressions defined here will be applied after the XSLT mapping.' =>
            'Регулярные выражения заданные здесь будут применены после XSLT mapping.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceOperationDefault.tt
        'Do you really want to delete this operation?' => 'Вы действительно хотите удалить эту операцию?',
        'Add Operation' => 'Добавить операцию',
        'Edit Operation' => 'Редактировать операцию',
        'Operation Details' => 'Детали операции',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Имя обычно используется для вызова этой операции веб-сервиса из удаленной системы.',
        'Operation backend' => 'Бэкэнд для операций',
        'This Znuny operation backend module will be called internally to process the request, generating data for the response.' =>
            'Этот модуль Znuny будет вызываться для обработки запроса и подготавливать данные для ответа.',
        'Mapping for incoming request data' => 'Сопоставление для данных входящего запроса',
        'The request data will be processed by this mapping, to transform it to the kind of data Znuny expects.' =>
            'Запрашиваемые данные будут обработаны и преобразованы в формат поддерживаемый Znuny',
        'Mapping for outgoing response data' => 'Сопоставление данных для исходящего ответа',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Данные из ответа будут обработаны с помощью этого мапинга, чтобы преобразовать их к такому виду, который ожидает удалённая система.',
        'Include Ticket Data' => 'Вставить данные заявки',
        'Include ticket data in response.' => 'Включить данные заявки в ответе.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPREST.tt
        'Network Transport' => 'Транспортная Сеть',
        'Properties' => 'Properties',
        'Route mapping for Operation' => 'Карта маршрута для выполнения операции',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Определите маршрут, который должен сопоставляться этой операции. Переменные, отмеченные \':\', будут сопоставлены введенному имени и передавался вместе с другими для сопоставления. (например, /Ticket/:TicketID).',
        'Valid request methods for Operation' => 'Допустимые методы запроса для Операции',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Ограничить использование этой Операции для определенных методов запроса. Если никакой метод не указан, все запросы будут приняты.',
        'Parser backend for operation' => '',
        'Defines the incoming data format.' => '',
        'Parser backend parameter' => '',
        'Please click \'Save\' to get the corresponding backend parameter if the parser backend was changed.' =>
            '',
        'Maximum message length' => 'Максимальная длина сообщения',
        'This field should be an integer number.' => 'Это поле должно быть целым числом.',
        'Here you can specify the maximum size (in bytes) of REST messages that Znuny will process.' =>
            'Здесь вы можете задать максимальный размер (в байтах) REST сообщений, которые Znuny будет обрабатывать.',
        'Send Keep-Alive' => 'Отправить Keep-Alive',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Этот параметр определяет закрывать входящие соединения или оставлять открытыми.',
        'Endpoint' => 'Конечная точка',
        'URI to indicate specific location for accessing a web service.' =>
            'URI для указания точного расположения для доступа к веб-сервису.',
        'e.g https://www.example.com:10745/api/v1.0 (without trailing backslash)' =>
            'например, https://www.example.com:10745/api/v1.0 (без обратных слэшей)',
        'Disable SSL hostname certificate verification' => '',
        'Disables hostname certificate verification. This is not recommended and should only be used in test environments.' =>
            '',
        'Timeout' => 'Тайм-аут',
        'Timeout value for requests.' => 'Значение Timeout для запросов.',
        'Authentication' => 'Аутентификация',
        'An optional authentication mechanism to access the remote system.' =>
            'Необязательный механизм аутентификации для доступа к удаленной системе.',
        'BasicAuth User' => 'BasicAuth Пользователь',
        'The user name to be used to access the remote system.' => 'Имя пользователя для доступа к удаленной системе.',
        'BasicAuth Password' => 'BasicAuth Пароль',
        'The password for the privileged user.' => 'Пароль для привилегированного пользователя',
        'JWT authentication: Key file' => '',
        'ATTENTION: Key file and/or password (if needed, see below) seem to be invalid.' =>
            'ВНИМАНИЕ: Файл ключа и/или пароль (при необходимости см. ниже) выглядят недействительными.',
        'Path to private key file (PEM or DER). The key will be used to sign the JWT.' =>
            '',
        'JWT authentication: Key file password' => '',
        'ATTENTION: Password and/or key file (see above) seem to be invalid.' =>
            'ВНИМАНИЕ: Пароль и/или файл ключа (см. выше) кажутся недействительными.',
        'JWT authentication: Certificate file' => '',
        'ATTENTION: Certificate file could not be parsed.' => 'ВНИМАНИЕ: Не удалось разобрать файл сертификата.',
        'ATTENTION: Certificate is expired.' => 'ВНИМАНИЕ: Срок действия сертификата истек.',
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
        'OAuth2 token configuration' => 'Конфигурация OAuth2 ключа (token)',
        'Content type' => 'Тип содержимого',
        'The default content type added to HTTP header to use for POST and PUT requests.' =>
            'Тип содержимого по умолчанию, указываемый в HTTP заголовке в POST и PUT запросах.',
        'Use Proxy Options' => 'Использовать настройки прокси',
        'Show or hide Proxy options to connect to the remote system.' => 'Показать или скрыть параметры прокси для подключения к удаленной системе.',
        'Proxy Server' => 'Прокси-сервер',
        'URI of a proxy server to be used (if needed).' => 'URI используемого прокси сервера (если требуется).',
        'e.g. http://proxy_hostname:8080' => 'например, http://proxy_hostname:8080',
        'Proxy User' => 'Пользователь прокси',
        'The user name to be used to access the proxy server.' => 'Имя пользователя для доступа к прокси серверу.',
        'Proxy Password' => 'Пароль прокси',
        'The password for the proxy user.' => 'Пароль пользователя для доступа к прокси серверу.',
        'Skip Proxy' => 'Пропустить Прокси',
        'Skip proxy servers that might be configured globally?' => 'Пропустить прокси-серверы, которые могли быть сконфигурированы глобально?',
        'Use SSL Options' => 'Использовать SSL параметры',
        'Show or hide SSL options to connect to the remote system.' => 'Показать или скрыть параметры SSL для подключения к удаленной системе.',
        'Client Certificate' => 'Сертификат Клиента',
        'The full path and name of the SSL client certificate file (must be in PEM, DER or PKCS#12 format).' =>
            'Полный путь и имя файла клиентского SSL сертификата (должен быть в формате PEM, DER или PKCS#12).',
        'e.g. /opt/znuny/var/certificates/SOAP/certificate.pem' => 'например /opt/znuny/var/certificates/SOAP/certificate.pem',
        'Client Certificate Key' => 'Ключ сертификата клиента',
        'The full path and name of the SSL client certificate key file (if not already included in certificate file).' =>
            'Полный путь и имя файла клиентского SSL сертификата ключей (если он еще не включен в файл сертификата).',
        'e.g. /opt/znuny/var/certificates/SOAP/key.pem' => 'например /opt/znuny/var/certificates/SOAP/key.pem',
        'Client Certificate Key Password' => 'Пароль ключа сертификата клиента',
        'The password to open the SSL certificate if the key is encrypted.' =>
            'Пароль для открытия SSL сертификата если ключ зашифрован.',
        'Certification Authority (CA) Certificate' => 'Certification Authority (CA) Сертификат',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'Полный путь и имя файла сертификата для проверки SSL ',
        'e.g. /opt/znuny/var/certificates/SOAP/CA/ca.pem' => 'например, /opt/znuny/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Каталог Certification Authority (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Полный путь к каталогу certification authority, в котором хранятся CA certificates. ',
        'e.g. /opt/znuny/var/certificates/SOAP/CA' => 'например, /opt/znuny/var/certificates/SOAP/CA',
        'Controller mapping for Invoker' => 'Controller mapping для Invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Контроллер, на который invoker должен отправлять запросы. Переменные, помеченные \':\', будут заменены значением и переданы вместе с запросом. (например, /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).',
        'Valid request command for Invoker' => 'Допустимая команда запроса для Invoker',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Конкретная команда HTTP для использования в запросах этого Invoker (необязательна).',
        'Default command' => 'Команда по умолчанию',
        'The default HTTP command to use for the requests.' => 'Команда HTTP по умолчанию для использования в запросах.',
        'Additional response headers' => 'Дополнительные заголовки ответа',
        'Additional request headers' => '',
        'Header' => 'Заголовок',
        'Add response header' => 'Добавить заголовок ответа',
        'Add request header' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPSOAP.tt
        'e.g. https://example.com:8000/Webservice/Example' => 'например https://example.com:8000/Webservice/Example',
        'Set SOAPAction' => 'Установить SOAPAction',
        'Set to "Yes" in order to send a filled SOAPAction header.' => 'Установить "Да" для отсылки заполненного SOAPAction заголовока.',
        'Set to "No" in order to send an empty SOAPAction header.' => 'Установить "Нет" для отсылки пустого SOAPAction заголовока.',
        'Set to "Yes" in order to check the received SOAPAction header (if not empty).' =>
            'Установить "Да" для проверки принятого SOAPAction заголовока (если не пустой).',
        'Set to "No" in order to ignore the received SOAPAction header.' =>
            'Установить "Нет" для игнорирования принятого SOAPAction заголовока.',
        'SOAPAction scheme' => 'SOAPAction схема',
        'Select how SOAPAction should be constructed.' => 'Выбрать как SOAPAction должна быть построена.',
        'Some web services require a specific construction.' => 'Некоторые веб-сервисы требуют специфичной конструкции.',
        'Some web services send a specific construction.' => 'Некоторые веб-сервисы отправляют специфичную конструкцию.',
        'SOAPAction separator' => 'Разделитель SOAPAction.',
        'Character to use as separator between name space and SOAP operation.' =>
            'Символ, используемый в качестве разделителя между пространством имен и SOAP операцией.',
        'Usually .Net web services use "/" as separator.' => 'Обычно .Net веб-сервисы используют "/" в качестве разделителя.',
        'SOAPAction free text' => 'Произвольный текст SOAPAction',
        'Text to be used to as SOAPAction.' => 'Текст для использования в качестве SOAPAction.',
        'Namespace' => 'Пространство имен',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI, предоставляющий SOAP методам контекст для уменьшения двусмысленности.',
        'e.g urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions' =>
            'например, urn:example-com:soap:functions или http://www.example.com/GenericInterface/actions',
        'Omit namespace prefix' => '',
        'Omits the namespace prefix (e. g. namesp1:) in root tag of SOAP message.' =>
            '',
        'Request name scheme' => 'Схема именования запросов',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Выберите способ построения обертки функции SOAP запросов.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'FunctionName\' используется в качестве примера для фактического имени Invoker или операции.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'FreeText\' используется в качестве примера для фактического конфигурируемого значения.',
        'Request name free text' => 'Произвольный текст имени запроса',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Текст, который будет использоваться как суффикс имени обертки функции или для замены.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Обратите внимание на ограничения именования XML элементов (например, нельзя использовать "<" и "&").',
        'Response name scheme' => 'Схема именования ответов',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Выберите способ построения обертки функции SOAP ответов.',
        'Response name free text' => 'Произвольный текст схемы именования ',
        'Here you can specify the maximum size (in bytes) of SOAP messages that Znuny will process.' =>
            'Здесь вы можете задать макс. размер (в байтах) SOAP сообщений, которые Znuny будет обрабатывать.',
        'Fixed namespace prefix' => '',
        'Use a fixed namespace prefix (e. g. myns:) for the root tag of a SOAP message.' =>
            '',
        'Suffix for response tag' => '',
        'Usually Znuny expects a response tag like "&lt;Operation&gt;Response". This setting can change the "Response" part, e. g. to "Result".' =>
            '',
        'Encoding' => 'Кодировка',
        'The character encoding for the SOAP message contents.' => 'Кодировка символов для содержимого SOAP сообщений.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'например, utf-8, latin1, iso-8859-1, cp1250, и т.д.',
        'User' => 'Пользователь',
        'Password' => 'Пароль',
        'Disable SSL hostname verification' => '',
        'Disables (setting "Yes") or enables (setting "No", default) the SSL hostname verification.' =>
            '',
        'Sort options' => 'Опции сортировки',
        'Add new first level element' => 'Добавить новый элемент первого уровня',
        'Element' => 'Элемент',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebservice.tt
        'Add Web Service' => 'Добавить веб-сервис',
        'Clone Web Service' => 'Клонировать веб-сервис',
        'The name must be unique.' => 'Имя должно быть уникальным.',
        'Clone' => 'Клонировать',
        'Export Web Service' => 'Экспортировать веб-сервис',
        'Import web service' => 'Импортировать веб-сервис',
        'Configuration File' => 'Файл конфигурации',
        'The file must be a valid web service configuration YAML file.' =>
            'Файл должен быть файлом конфигурации веб-сервисов формата YAML.',
        'Here you can specify a name for the webservice. If this field is empty, the name of the configuration file is used as name.' =>
            'Здесь вы можете указать имя веб-сервиса. Если оставлено пустым, в качестве имени используется название конфигурационного файла.',
        'Import' => 'Импорт',
        'Configuration History' => 'История конфигурации',
        'Delete web service' => 'Удалить веб-сервис',
        'Do you really want to delete this web service?' => 'Вы действительно хотите удалить этот веб-сервис?',
        'Ready2Adopt Web Services' => 'Ready2Adopt веб-сервисы',
        'Import Ready2Adopt web service' => 'Импорт Ready2Adopt веб-сервис',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'После сохранения конфигурации вы будете перенаправлены обратно на экран редактирования.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Чтобы вернуться к обзору, нажмите кнопку "Перейти к обзору".',
        'Edit Web Service' => 'Редактировать веб-сервис',
        'Remote system' => 'Удалённая система',
        'Provider transport' => 'Транспорт провайдера',
        'Requester transport' => 'Транспорт запрашивающего',
        'Debug threshold' => 'Порог отладки',
        'In provider mode, Znuny offers web services which are used by remote systems.' =>
            'В режиме провайдера Znuny предоставляет веб-сервисы удалённым системам.',
        'In requester mode, Znuny uses web services of remote systems.' =>
            'В режиме запрашивающего Znuny использует веб-сервисы удалённых систем.',
        'Network transport' => 'Сетевой транспорт',
        'Error Handling Modules' => 'Модули обработки ошибок',
        'Error handling modules are used to react in case of errors during the communication. Those modules are executed in a specific order, which can be changed by drag and drop.' =>
            'Модули обработки ошибок используются для реагирования на ошибки во время взаимодействия. Эти модули запускаются в определённом порядке, который можно изменить путём их перетаскивания с помощью мыши.',
        'Add error handling module' => 'Добавить модуль обработки ошибок',
        'Operations are individual system functions which remote systems can request.' =>
            'Операции — это отдельные системные функции, которые могут вызываться удалёнными системами.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Вызывающие модули подготавливают данные для запроса к удалённому веб-сервису и обрабатывают полученные от них ответы.',
        'Controller' => 'Контроллер',
        'Inbound mapping' => 'Входящий мапинг',
        'Outbound mapping' => 'Исходящий мапинг',
        'Delete this action' => 'Удалить это действие',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'По крайней мере один %s имеет controller, который или неактивен, или отсутствует, проверьте, пожалуйста, controller registration или удалите %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebserviceHistory.tt
        'Go back to Web Service' => 'Вернуться в веб-сервис',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Здесь можно просмотреть старые версии конфигураций текущего веб-сервиса, экспортировать или восстановить их.',
        'History' => 'История',
        'Configuration History List' => 'Список истории конфигурации',
        'Version' => 'Версия',
        'Create time' => 'Время создания',
        'Select a single configuration version to see its details.' => 'Выберите отдельную версию конфигурации для ее просмотра',
        'Export web service configuration' => 'Экспортировать конфигурацию веб-сервиса',
        'Restore web service configuration' => 'Восстановить конфигурацию веб-сервиса',
        'Do you really want to restore this version of the web service configuration?' =>
            'Действительно восстановить эту версию конфигурации веб-сервиса?',
        'Your current web service configuration will be overwritten.' => 'Ваша текущая конфигурация веб-сервиса будет перезаписана.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGroup.tt
        'Add Group' => 'Добавить группу',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Группа admin может осуществлять администрирование, а группа stats — просматривать статистику',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Создать новые группы, чтобы управлять правами для разных групп агентов (например, департамент закупок, департамент поддержки, департамент продаж, ...).',
        'It\'s useful for ASP solutions. ' => 'Полезно для сервис-провайдеров.',
        'Agents ↔ Groups' => 'Агенты ↔ Группы',
        'Roles ↔ Groups' => 'Роли ↔ Группы',
        'Group Management' => 'Управление группами',
        'Edit Group' => 'Редактировать группу',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminLog.tt
        'Clear log entries' => '',
        'Here you will find log information about your system.' => 'Здесь вы найдете логи с информацией о вашей системе.',
        'Hide this message' => 'Скрыть это сообщение',
        'System Log' => 'Системный журнал',
        'Recent Log Entries' => 'Свежие записи в логе',
        'Facility' => 'Объект',
        'Message' => 'Сообщение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminMailAccount.tt
        'Add Mail Account' => 'Добавить почтовую учетную запись',
        'Filter for Mail Accounts' => 'Фильтр почтовых учетных записей',
        'Filter for mail accounts' => 'Фильтр почтовых учетных записей',
        'All incoming emails with one account will be dispatched in the selected queue.' =>
            'Все входящие письма с одной учетной записью будут перенаправлены в выбранную очередь.',
        'If your account is marked as trusted, the X-OTRS headers already existing at arrival time (for priority etc.) will be kept and used, for example in PostMaster filters.' =>
            'Если ваша учётная запись помечена как доверенная, все уже существующие в письмах на момент получения заголовки X-OTRS (для выставления приоритета и прочих данных) будут приняты и использованы, например в фильтрах PostMaster.',
        'Outgoing email can be configured via the Sendmail* settings in %s.' =>
            'Исходящая почта может быть настроена через параметр Sendmail* в %s.',
        'System Configuration' => 'Настройка системы',
        'Mail Account Management' => 'Управление почтовыми учетными записями',
        'Edit Mail Account for host' => 'Изменить почтовую учетную запись для хоста',
        'and user account' => 'и учётную запись пользователя',
        'Host' => 'Сервер',
        'Authentication type' => '',
        'Fetch mail' => 'Забрать почту',
        'Delete account' => 'Удалить учётную запись',
        'Do you really want to delete this mail account?' => 'Вы действительно хотите удалить эту почтовую учётную запись?',
        'Example: mail.example.com' => 'Пример: mail.example.com',
        'IMAP Folder' => 'Папка IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Измените только в том случае, если нужно забирать почту из папки, отличной от INBOX.',
        'Trusted' => 'Доверенная',
        'Dispatching' => 'Перенаправление',
        'Edit Mail Account' => 'Изменить почтовую учётную запись',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNavigationBar.tt
        'Administration Overview' => 'Панель администратора',
        'Favorites' => 'Избранные',
        'You can add favorites by moving your cursor over items on the right side and clicking the star icon.' =>
            'Можно добавить отдельные настройки в Избранные кликнув мышкой по "звездочке" справа в списке параметров.',
        'Links' => 'Ссылки',
        'View the admin manual on Github' => 'Смотрите руководство администратора на Github',
        'Filter for Items' => 'Фильтр для элементов',
        'No Matches' => 'Совпадений не найдено',
        'Sorry, your search didn\'t match any items.' => 'К сожалению, поиск не дал результатов.',
        'Set as favorite' => 'Назначить избранным',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEvent.tt
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Здесь можно загрузить конфигурационный файл для импорта Ticket Notifications в систему. Файл должен быть в .yml формате, таком же, как при экспорте из модуля Ticket Notification.',
        'Ticket Notification Management' => 'Управление уведомлениями',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Здесь вы можете выбрать какие события будут включать это уведомление. Дополнительный фильтр может быть применён ниже для их отправки для заявок, удовлетворяющих заданному условию.',
        'Ticket Filter' => 'Фильтр заявок',
        'Lock' => 'Блокировать',
        'SLA' => 'SLA',
        'Customer User ID' => 'Логин клиента',
        'Article Filter' => 'Фильтр сообщений',
        'Only for ArticleCreate and ArticleSend event' => 'Только для событий ArticleCreate и ArticleSend',
        'Article sender type' => 'Тип отправителя сообщения',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Если ArticleCreate или ArticleSend используется как переключатель события, вы должны задать фильтр для сообщений. Выберите, хотя бы одно из полей фильтра.',
        'Customer visibility' => 'Показывать клиенту',
        'Communication channel' => 'Канал связи',
        'Include attachments to notification' => 'Включить вложения в уведомление',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Уведомить пользователя только раз в день для каждой отдельной заявки, используя указанный способ доставки.',
        'This field is required and must have less than 4000 characters.' =>
            'Данное поле обязательно и должно быть менее 4000 символов.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportEmailSettings.tt
        'Use comma or semicolon to separate email addresses.' => '',
        'You can use Znuny-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Вы можете использовать Znuny-тэги типа <OTRS_TICKET_DynamicField_...> для вставки значений из текущей заявки.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportWebserviceSettings.tt
        'Web service name' => '',
        'Invoker' => 'Инициатор вызова',
        'Asynchronous event triggers will be handled as separate process by the scheduler daemon (recommended).' =>
            '',
        'Synchronous event triggers will be processed directly during the web request.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Edit.tt
        'Queue Management' => 'Управление очередями',
        'Manage OAuth2 tokens and their configurations' => 'Управление OAuth2 ключами (tokens) и их конфигурациями',
        'Add by template' => 'Добавить используя шаблон',
        'Base configuration' => 'Базовая конфигурация',
        'An OAuth2 token configuration with this name already exists.' =>
            'Конфигурация OAuth2 ключа (token) с таким именем уже существует.',
        'Client ID' => 'ID клиента',
        'Client secret' => 'Секрет клиента',
        'URL for authorization code' => 'URL для получения кода авторизации',
        'URL for token by authorization code' => 'URL для получения ключа доступа (token) по коду авторизации',
        'URL for token by refresh token' => 'URL для получения ключа доступа (token) по ключу обновления (refresh token)',
        'Access token scope' => 'Область действия ключа (token)',
        'Template' => 'Шаблон',
        'This is the template that was used to create this OAuth2 token configuration.' =>
            'Этот шаблон был использован, чтобы создать эту конфигурацию OAuth2 ключа (token).',
        'Notifications' => 'Уведомления',
        'Expired token' => 'Истекший ключ (token)',
        'Shows a notification for admins below the top menu if the OAuth2 token has expired.' =>
            'Показывать уведомление администратору ниже верхнего меню, если OAuth2 ключ (token) истек.',
        'Expired refresh token' => 'Истекший ключ обновления (refresh token)',
        'Shows a notification for admins below the top menu if the OAuth2 refresh token has expired.' =>
            'Показывать уведомление администратору ниже верхнего меню, если OAuth2 ключ обновления (refresh token) истек.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Overview.tt
        'Add OAuth2 token configuration' => 'Добавить конфигурацию OAuth2 ключа (token)',
        'Add a new OAuth2 token configuration based on the selected template.' =>
            'Добавить новую конфигурацию OAuth2 ключа (token), основанную на выбранном шаблоне.',
        'Import and export' => 'Импорт и экспорт',
        'Upload a YAML file to import token configurations. See documentation on OAuth2 token management for further details.' =>
            'Загрузите файл в YAML формате для импорта конфигураций ключей. Для более детальной информации смотрите документацию по управлению OAuth2 ключами (tokens).',
        'Overwrite existing token configurations' => 'Перезаписать существующие конфигурации ключей (tokens)',
        'Import token configurations' => 'Импорт конфигураций ключей (tokens)',
        'Export token configurations' => 'Экспорт конфигураций ключей (tokens)',
        'OAuth2 token configurations' => 'Конфигурации OAuth2 ключей (tokens)',
        'Token status' => 'Статус ключа (token)',
        'Refresh token status' => 'Статус ключа обновления (refresh token)',
        'Validity of token configuration' => 'Актуальность конфигурации ключа',
        'Last token request failed.' => 'Последний запрос ключа доступа (token) завершился неудачно.',
        'Token has expired on %s.' => 'Срок действия ключа доступа (token) истек %s.',
        'Token is valid until %s.' => 'Ключ доступа (token) действителен до %s.',
        'No token was requested yet.' => 'Ключ доступа (token) еще не был запрошен.',
        'Last (refresh) token request failed.' => 'Последний запрос ключа обновления (refresh token) завершился неудачно.',
        'Refresh token has expired on %s.' => 'Срок действия ключа обновления (refresh token) истек %s.',
        'Refresh token has expired.' => 'Срок действия ключа обновления (refresh token) истек.',
        'Refresh token is valid until %s.' => 'Ключ обновления (refresh token) действителен до %s.',
        'Refresh token is valid (without expiration date).' => 'Ключ обновления (refresh token) действительный (бессрочный).',
        'No refresh token was requested yet.' => 'Ключ обновления (refresh token) еще не был запрошен.',
        'Refresh token request is not configured.' => 'Запрос ключа обновления (refresh token) не настроен.',
        'Request new token' => 'Запросить новый ключ (token)',
        'Delete this token and its configuration.' => 'Удалить этот ключ (token) и его конфигурацию.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPGP.tt
        'PGP support is disabled' => 'Поддержка PGP отключена',
        'To be able to use PGP in Znuny, you have to enable it first.' =>
            'Чтобы использовать PGP в Znuny, сначала надо включить его поддержку.',
        'Enable PGP support' => 'Включить поддержку PGP ',
        'Faulty PGP configuration' => 'Неверная настройка PGP ',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'Поддержка PGP включена, но соответствующие настройки содержат ошибки. Проверьте настройки используя кнопку расположенную ниже.',
        'Configure it here!' => 'Выполните настройку здесь!',
        'Check PGP configuration' => 'Проверить настройки PGP ',
        'Add PGP Key' => 'Добавить PGP ключ',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'В данном случае вы можете изменить ключи прямо в конфигурации системы',
        'Introduction to PGP' => 'Введение в PGP',
        'PGP Management' => 'Управление подписями PGP',
        'Identifier' => 'Идентификатор',
        'Bit' => 'Бит',
        'Fingerprint' => 'Цифровой отпечаток',
        'Expires' => 'Истекает',
        'Delete this key' => 'Удалите этот ключ',
        'PGP key' => 'PGP-ключ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPackageManager.tt
        'Package Manager' => 'Менеджер пакетов',
        'Uninstall Package' => 'Деинсталлировать пакет',
        'Uninstall package' => 'Деинсталлировать пакет',
        'Do you really want to uninstall this package?' => 'Удалить этот пакет?',
        'Reinstall package' => 'Переустановить пакет',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Вы действительно хотите переустановить этот пакет? Все ручные изменения будут потеряны.',
        'Go to updating instructions' => 'Перейдите к инструкциям по обновлению',
        'Go to znuny.org' => '',
        'package information' => 'Информация о пакете',
        'Package installation requires a patch level update of Znuny.' =>
            'Установка пакета требует обновления уровня патчей Znuny.',
        'Package update requires a patch level update of Znuny.' => 'Обновление пакета требует обновления уровня патчей Znuny.',
        'Please note that your installed Znuny version is %s.' => 'Установлена Znuny версии %s.',
        'To install this package, you need to update Znuny to version %s or newer.' =>
            'Для установки пакета необходимо обновить Znuny до версии %s или выше.',
        'This package can only be installed on Znuny version %s or older.' =>
            'Этот пакет может быть установлен для версий Znuny не выше %s.',
        'This package can only be installed on Znuny version %s.' => '',
        'Why should I keep Znuny up to date?' => 'Почему я должен постоянно обновлять Znuny?',
        'You will receive updates about relevant security issues.' => 'Вы получите обновления о соответствующих выпусках безопасности.',
        'You will receive updates for all other relevant Znuny issues.' =>
            'Вы получите обновления для всех других соответствующих вопросов Znuny.',
        'How can I do a patch level update if I don’t have a contract?' =>
            'Как я могу выполнить обновление уровня патч если у меня нет контракта?',
        'Please find all relevant information within the updating instructions at %s.' =>
            'Пожалуйста, найдите всю соответствующую информацию в инструкциях по обновлению здесь %s.',
        'In case you would have further questions we would be glad to answer them.' =>
            'В случае, если у Вас возникли вопросы, мы будем рады ответить на них.',
        'Please visit our customer portal and file a request.' => 'Посетите наш клиентский портал и отправьте запрос.',
        'Install Package' => 'Установить пакет',
        'Update Package' => 'Обновить пакет',
        'Package' => '',
        'Required package %s is already installed.' => '',
        'Required Perl module %s is already installed.' => '',
        'Required package %s needs to get installed!' => '',
        'Required package %s needs to get updated to version %s!' => '',
        'Required Perl module %s needs to get installed or updated!' => '',
        'Continue' => 'Продолжить',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Убедитесь что ваша СУБД принимает пакеты размером больше %s MB (текущее значение размера пакета - до %s MB). Измените значение параметра max_allowed_packet для вашей СУБД во избежание ошибок.',
        'Install' => 'Установить',
        'Update' => 'Обновление',
        'Update repository information' => 'Обновить информацию репозитория',
        'Update all installed packages' => 'Обновить все установленные пакеты',
        'Online Repository' => 'Онлайновый репозиторий',
        'Vendor' => 'Изготовитель',
        'Action' => 'Действие',
        'Module documentation' => 'Документация модуля',
        'Local Repository' => 'Локальный репозиторий',
        'Uninstall' => 'Деинсталлировать',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Пакет установлен некорректно! Переустановите пакет.',
        'Reinstall' => 'Переустановить',
        'Download package' => 'Скачать пакет',
        'Rebuild package' => 'Пересобрать пакет',
        'Package Information' => 'Информация о пакете',
        'Metadata' => 'Метаданные',
        'Change Log' => 'Список изменений',
        'Date' => 'Дата',
        'List of Files' => 'Список файлов',
        'Permission' => 'Права доступа',
        'Size' => 'Размер',
        'Problem' => 'Проблема',
        'OK' => 'О.К.',
        'Download file from package!' => 'Загрузить файл из пакета!',
        'Required' => 'Требуется',
        'Primary Key' => 'Главный ключ',
        'Auto Increment' => 'Авто инкремент',
        'SQL' => 'SQL',
        'File Differences for File %s' => 'Перечень различий для файла %s',
        'File differences for file %s' => 'Файл различий для файла %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPerformanceLog.tt
        'This feature is enabled!' => 'Данная функция активирована!',
        'Just use this feature if you want to log each request.' => 'Используйте эту функцию, если хотите заносить каждый запрос в журнал',
        'Activating this feature might affect your system performance!' =>
            'Включение этой функции может повлиять на производительность вашей системы!',
        'Disable it here!' => 'Отключите ее здесь!',
        'Logfile too large!' => 'Файл журнала слишком большой!',
        'The logfile is too large, you need to reset it' => 'Файл логов слишком большой, необходимо его очистить',
        'Performance Log' => 'Журнал производительности',
        'Range' => 'Диапазон',
        'last' => 'последние',
        'Interface' => 'Интерфейс',
        'Requests' => 'Запросов',
        'Min Response' => 'Минимальное время ответа',
        'Max Response' => 'Максимальное время ответа',
        'Average Response' => 'Среднее время ответа',
        'Period' => 'Период',
        'minutes' => 'минут',
        'Min' => 'Мин',
        'Max' => 'Макс',
        'Average' => 'Среднее',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPostMasterFilter.tt
        'Add PostMaster Filter' => 'Добавить фильтр PostMaster-а',
        'Filter for PostMaster Filters' => '',
        'Filter for PostMaster filters' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Для распределения или фильтрации входящей электронной почты по заголовкам. Возможна также проверка и с использованием регулярных выражений.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Если вы хотите отфильтровать только по адресам электронной почты, используйте EMAILADDRESS:info@example.com в полях From, To или Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Если вы используете регулярные выражения, вы также можете использовать совпавшее в () значение как [***] в действии "Выставить"',
        'You can also use named captures %s and use the names in the \'Set\' action %s (e.g. Regexp: %s, Set action: %s). A matched EMAILADDRESS has the name \'%s\'.' =>
            '',
        'PostMaster Filter Management' => 'Управление фильтрами PostMaster',
        'Edit PostMaster Filter' => 'Редактировать фильтр PostMaster-а',
        'Delete this filter' => 'Удалить этот фильтр',
        'Do you really want to delete this postmaster filter?' => 'Вы действительно хотите удалить этот postmaster фильтр?',
        'A postmaster filter with this name already exists!' => 'Фильтр postmaster с этим имением уже существует!',
        'Filter Condition' => 'Условие фильтра',
        'AND Condition' => 'Условие "И"(AND)',
        'Search header field' => 'Найти поле заголовка',
        'for value' => 'для значения',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Это поле должно быть корректным регулярным выражением либо буквально совпадающей строкой.',
        'Negate' => 'Отрицание ("НЕ")',
        'Set Email Headers' => 'Выставить заголовки письма',
        'Set email header' => 'Выставить заголовок письма',
        'with value' => 'Со значением',
        'The field needs to be a literal word.' => 'Значение поля должно быть литералом.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPriority.tt
        'Add Priority' => 'Создать приоритет',
        'Filter for Priorities' => 'Фильтр для Приоритетов',
        'Filter for priorities' => 'Фильтр для Приоритетов',
        'Configure Priority Visibility and Defaults' => '',
        'Priority Management' => 'Управление приоритетами',
        'Edit Priority' => 'Изменить приоритет',
        'Color' => 'Цвет',
        'This priority is present in a SysConfig setting, confirmation for updating settings to point to the new priority is needed!' =>
            'Это значение приоритета указано в настройках SysConfig, требуется подтверждение для обновления настроек для его использования в системе!',
        'This priority is used in the following config settings:' => 'Этот приоритет используется в следующих параметрах конфигурации:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagement.tt
        'Filter for Processes' => 'Фильтр для Процессов',
        'Filter for processes' => 'Фильтр процессов',
        'Create New Process' => 'Создать новый Процесс',
        'Deploy All Processes' => 'Синхронизировать все Процессы',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Здесь Вы можете загрузить файл конфигурации для импорта процесса в Вашу систему. Файл должен быть в .yml формате, таком же, как при экспорте из модуля управления процессами.',
        'Upload process configuration' => 'Загрузить конфигурацию Процесса',
        'Import process configuration' => 'Импортировать конфигурацию Процесса',
        'Ready2Adopt Processes' => '',
        'Here you can activate Ready2Adopt processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            '',
        'Import Ready2Adopt process' => '',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Для создания нового Процесса Вы можете импортировать Процесс, экспортированный из другой системы или создать полностью новый.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Изменения в Процессах сделанные здесь будут актуальны после синхронизации данных Процесса. При синхронизации, все вновь внесенные изменения будут записаны в конигурационные файлы системы.',
        'Access Control Lists (ACL)' => 'Списки управления доступом (ACL)',
        'Generic Agent' => 'Планировщие задач',
        'Manage Process Widget Groups' => '',
        'Processes' => 'Процессы',
        'Process name' => 'Имя Процесса',
        'Print' => 'Печать',
        'Export Process Configuration' => 'Экспортировать конфигурацию процесса',
        'Copy Process' => 'Скопировать процесс',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivity.tt
        'Please note, that changing this activity will affect the following processes' =>
            'Помните, что изменение этой Активности повлияет на следующие Процессы',
        'Activity' => 'Активность',
        'Activity Name' => 'Имя Активности',
        'Scope' => '',
        'Scope Entity ID' => '',
        'This field is required for activities with a scope.' => '',
        'Activity Dialogs' => 'Диалог Активности',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Вы можете назначить Диалоги Активности для этой Активности перетаскиванием элементов мышью из левого списка в правый.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Порядок элементов в списке изменяется перетаскиванием элементов (drag \'n\' drop)',
        'Available Activity Dialogs' => 'Доступные Диалоги Активности',
        'Filter available Activity Dialogs' => 'Фильтр доступных Диалогов Активности',
        'Also show global %s' => '',
        'Name: %s, EntityID: %s' => 'Имя: %s, EntityID: %s',
        'Create New Activity Dialog' => 'Создать новый Диалог Активности',
        'Assigned Activity Dialogs' => 'Назначить Диалоги Активности',
        'Filter Assigned Activity Dialogs' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivityDialog.tt
        'Please note that changing this activity dialog will affect the following activities' =>
            'Помните, что изменение этого Диалога Активности повлияет на следующие Активности',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Помните, что клиенты не смогут видеть или использовать следующие поля: Владелец, Ответственный, Блокировка, Время ожидания и ID компании.',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Поле Очередь/Получатель может быть использовано только клиентом при создании новой заявки.',
        'Activity Dialog' => 'Диалог Активности',
        'Activity dialog Name' => 'Имя Диалога Активности',
        'Available in' => 'Доступно в',
        'Description (short)' => 'Описание (краткое)',
        'Description (long)' => 'Описание (полное)',
        'The selected permission does not exist.' => 'Выбранные права не существуют',
        'Required Lock' => 'Требуется блокировка',
        'The selected required lock does not exist.' => 'Выбранное требование - "требуется блокировка" не существует.',
        'This field is required for activitiy dialogs with a scope.' => '',
        'Submit Advice Text' => 'Текст подсказки кнопки Отправить',
        'Submit Button Text' => 'Название кнопки Отправить',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Вы можете назначить поля для этого Диалога Активности перетаскиванием элементов мышью из левого списка в правый.',
        'Available Fields' => 'Доступные поля',
        'Filter available fields' => 'Фильтр доступных полей',
        'Assigned Fields' => 'Назначенные поля',
        'Filter assigned fields' => 'Фильтр назначенных полей',
        'Communication Channel' => 'Канал связи',
        'Is visible for customer' => 'Виден клиенту',
        'Text Template' => 'Текстовый шаблон',
        'Auto fill' => '',
        'Display' => 'Отобразить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementPath.tt
        'Path' => 'Путь',
        'Edit this transition' => 'Редактировать этот Переход',
        'Transition Actions' => 'Действия Перехода',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Вы можете назначить Действия Перехода для этого Перехода перетаскиванием элементов мышью из левого списка в правый.',
        'Available Transition Actions' => 'Доступные Действия Перехода',
        'Filter available Transition Actions' => 'Фильтр для доступных Действий Перехода',
        'Create New Transition Action' => 'Создать новое Действие Перехода',
        'Assigned Transition Actions' => 'Назначить Действия Перехода',
        'Filter assigned Transition Actions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessAccordion.tt
        'Activities' => 'Активности',
        'Filter Activities...' => 'Фильтр для Активностей...',
        'Create New Activity' => 'Создать новую Активность',
        'Filter Activity Dialogs...' => 'Фильтр для Диалогов Активности',
        'Transitions' => 'Переходы',
        'Filter Transitions...' => 'Фильтр для Переходов...',
        'Create New Transition' => 'Создать новый Переход',
        'Filter Transition Actions...' => 'Фильтр для Действий Переходов...',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessEdit.tt
        'Print process information' => 'Печать информации о Процессе',
        'Delete Process' => 'Удалить Процесс',
        'Delete Inactive Process' => 'Удалить неактивный Процесс',
        'Available Process Elements' => 'Доступные элементы Процесса',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Элементы показанные в этом окне можно перенести на поле схемы справа используя перетаскивание мышью',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Вы можете поместить Активности на схему для назначения ее Процессу.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Для назначения Диалога Активности для этой Активности перетащите его из списка на значок Активности на схеме',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            '',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Действия могут быть назначены Переходу переиаскиванием Действия на метку(значок) Перехода',
        'Edit Process' => 'Редактировать процесс',
        'Edit Process Information' => 'Редактировать информацию о Процессе',
        'Process Name' => 'Имя Процесса',
        'The selected state does not exist.' => 'Выбранное состояние не существует.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Добавление и Редактирование Активностей, Диалогов Активности и Переходов',
        'Show EntityIDs' => 'Схема связей в Процессе',
        'Extend the width of the Canvas' => 'Увеличит ширину схемы',
        'Extend the height of the Canvas' => 'Увеличить высоту схемы',
        'Remove the Activity from this Process' => 'Удалить Активность из этого Процесса',
        'Edit this Activity' => 'Редактировать Активность',
        'Save Activities, Activity Dialogs and Transitions' => 'Сохранить Активности, Диалоги Активности и Переходы',
        'Do you really want to delete this Process?' => 'Вы действительно хотите удалить этот Процесс?',
        'Do you really want to delete this Activity?' => 'Вы действительно хотите удалить эту Активность?',
        'Do you really want to delete this Activity Dialog?' => 'Вы действительно хотите удалить этот Диалог Активности?',
        'Do you really want to delete this Transition?' => 'Вы действительно хотите удалить этот Переход?',
        'You can not edit a transition before it\'s connected to two activities.' =>
            '',
        'Do you really want to delete this Transition Action?' => 'Вы действительно хотите удалить это Действие Перехода?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Вы действительно желаете удалить эту Актвность из схемы? Это можно отменить только покинув этот экран без сохранения.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Вы действительно желаете удалить этот Переход из схемы? Это можно отменить только покинув этот экран без сохранения.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessNew.tt
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'На этом экране вы можете создать новый Процесс. Чтобы новый Процесс стал доступным пользователям, убедитесь, что его состояние установлено в \'Active\' и он синхронизирован с системой по окончании его создания.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessPrint.tt
        'Start Activity' => 'Начальная Активность',
        'Contains %s dialog(s)' => 'Содержит %s диалог(ов)',
        'Assigned dialogs' => 'Назначенные диалоги',
        'Activities are not being used in this process.' => 'Активности не используются в этом процессе',
        'Assigned fields' => 'Назначенные поля',
        'Activity dialogs are not being used in this process.' => 'Диалоги Активности не используются в этом процессе',
        'Condition linking' => 'Связывание условий',
        'Transitions are not being used in this process.' => 'Переходы не используются в этом процессе',
        'Module name' => 'Имя модуля',
        'Configuration' => 'Конфигурация',
        'Transition actions are not being used in this process.' => 'Действия Переходов не используются в этом процессе',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransition.tt
        'Please note that changing this transition will affect the following processes' =>
            'Имейте в виду, что изменение в этом Переходе повлияет на следующие Процессы',
        'Transition' => 'Переход',
        'Transition Name' => 'Имя Перехода',
        'This field is required for transitions with a scope.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransitionAction.tt
        'Please note that changing this transition action will affect the following processes' =>
            'Имейте в виду, что изменение в этом Действии Перехода повлияет на следующие Процессы',
        'Transition Action' => 'Действие Перехода',
        'Transition Action Name' => 'Имя Действия Перехода',
        'Transition Action Module' => 'Модуль Действия Перехода',
        'This field is required for transition actions with a scope.' => '',
        'Config Parameters' => 'Параметры конфигурации',
        'Add a new Parameter' => 'Добавить новый параметр',
        'Remove this Parameter' => 'Удалить этот параметр',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueue.tt
        'Add Queue' => 'Добавить очередь',
        'Filter for Queues' => 'Фильтр для очередей',
        'Filter for queues' => 'Фильтр для очередей',
        'Email Addresses' => 'Адреса email',
        'PostMaster Mail Accounts' => 'Учетные записи почты для PostMaster',
        'Salutations' => 'Приветствия',
        'Signatures' => 'Подписи',
        'Templates ↔ Queues' => 'Шаблоны ↔ Очереди',
        'Configure Working Hours' => '',
        'Configure Queue Related Settings' => '',
        'Edit Queue' => 'Изменить очередь',
        'A queue with this name already exists!' => 'Очередь с таким именем уже существует!',
        'This queue is present in a SysConfig setting, confirmation for updating settings to point to the new queue is needed!' =>
            'Эта очередь указана в настройках SysConfig, требуется подтверждение для обновления настроек для её использования в системе!',
        'Sub-queue of' => 'Подочередь для',
        'Follow up Option' => 'Последующие обращения',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Что делать с последующим обращением по уже закрытой заявке: переоткрывать заявку, отклонять обращение или создать новую заявку.',
        'Unlock timeout' => 'Срок блокировки',
        '0 = no unlock' => '0 = не разблокировать',
        'hours' => 'часов',
        'Only business hours are counted.' => 'С учетом только рабочего времени.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Если агент блокирует заявку и не закрывает её, когда подошел таймаут разблокировки, заявка будет разблокирована и станет доступна другим агентам.',
        'Notify by' => 'Уведомление от',
        '0 = no escalation' => '0 — без эскалации',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Если к новой заявке не добавляются контакты клиента, либо телефонные, либо внешний email, до истечения указанного здесь времени, заявка эскалируется.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Когда к заявке добавляется сообщение, через клиентский портал или электронной почтой, счетчик времени эскалации по обновлению сбрасывается и начинает отсчитываться заново. Если к заявке не добавляются контакты клиента, либо телефонные, либо внешний email, до истечения указанного здесь времени, заявка эскалируется.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Если заявка не закрыта до истечения указанного здесь времени разрешения, она эскалируется.',
        'Ticket lock after a follow up' => 'Блокировка заявки после получения повторного ответа клиента',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Если заявка закрыта, а клиент снова посылает ответ, заявка будет заблокирована на старого владельца.',
        'System address' => 'Адрес системы',
        'Will be the sender address of this queue for email answers.' => 'Установка адреса отправителя для ответов в этой очереди.',
        'Default sign key' => 'Ключ подписи по умолчанию',
        'To use a sign key, PGP keys or S/MIME certificates need to be added with identifiers for selected queue system address.' =>
            '',
        'Salutation' => 'Приветствие',
        'The salutation for email answers.' => 'Приветствие для ответов в электронных письмах.',
        'Signature' => 'Подпись',
        'The signature for email answers.' => 'Подпись для писем',
        'This queue is used in the following config settings:' => 'Эта очередь используется в следующих параметрах конфигурации:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueAutoResponse.tt
        'This filter allow you to show queues without auto responses' => 'Этот фильтр позволяет показать очереди без автоответа',
        'Queues without Auto Responses' => 'Очереди без автоответов',
        'This filter allow you to show all queues' => 'Этот фильтр позволяет показать все очереди',
        'Show All Queues' => 'Показать все очереди',
        'Auto Responses' => 'Автоответы',
        'Manage Queue-Auto Response Relations' => 'Управление связями Очередь ↔ Автоответ',
        'Change Auto Response Relations for Queue' => 'Изменить связь Автоответа с Очередью',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueTemplates.tt
        'Filter for Templates' => 'Фильтр для Шаблонов',
        'Filter for templates' => 'Фильтр для шаблонов',
        'Manage Template-Queue Relations' => 'Управление связями Шаблон ↔ Очередь',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRole.tt
        'Add Role' => 'Добавить роль',
        'Filter for Roles' => 'Фильтр для Ролей',
        'Filter for roles' => 'Фильтр для Ролей',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Создайте роль и добавьте в неё группы. Затем распределите роли по пользователям.',
        'Agents ↔ Roles' => 'Агенты ↔ Роли',
        'Role Management' => 'Управление ролями',
        'Edit Role' => 'Изменить роль',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Роли не определены. Пожалуйста, используйте кнопку \'Добавить\' для создания новой роли.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleGroup.tt
        'Roles' => 'Роли',
        'Manage Role-Group Relations' => 'Управление связями Роль ↔ Группа',
        'Select the role:group permissions.' => 'Выберите разрешения Роль:Группа.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Если ничего не выбрано, тогда в этой группе нет прав (для этой роли заявки не будут доступны).',
        'Toggle %s permission for all' => 'Переключить разрешение "%s" для всех',
        'move_into' => 'переместить',
        'Permissions to move tickets into this group/queue.' => 'Права на перемещение заявок в эту группу/очередь.',
        'create' => 'создание',
        'Permissions to create tickets in this group/queue.' => 'Права на создание заявок в этой группе/очереди',
        'note' => 'заметка',
        'Permissions to add notes to tickets in this group/queue.' => 'Права на добавление заметок в заявки в этой группе/очереди.',
        'owner' => 'владелец',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Права на смену владельца заявок в этой группе/очереди.',
        'priority' => 'приоритет',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Права на смену приоритета заявок в этой группе/очереди',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleUser.tt
        'Add Agent' => 'Добавить агента',
        'Filter for Agents' => 'Фильтр для Агентов',
        'Filter for agents' => 'Фильтр для агентов',
        'Agents' => 'Агенты',
        'Manage Agent-Role Relations' => 'Управление связями Агент ↔ Роли',
        'Manage Role-Agent Relations' => 'Управление связями Роль ↔ Агенты',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSLA.tt
        'Add SLA' => 'Добавить SLA',
        'Filter for SLAs' => 'Фильтр для SLA',
        'Configure SLA Visibility and Defaults' => '',
        'SLA Management' => 'Управление SLA',
        'Edit SLA' => 'Изменить SLA',
        'Please write only numbers!' => 'Сюда можно писать только числа!',
        'Minimum Time Between Incidents' => 'Минимальное время между инцидентами',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIME.tt
        'SMIME support is disabled' => 'Поддержка SMIME отключена',
        'To be able to use SMIME in Znuny, you have to enable it first.' =>
            'Чтобы использовать SMIME в Znuny, сначала надо включить его поддержку.',
        'Enable SMIME support' => 'Включить поддержку SMIME',
        'Faulty SMIME configuration' => 'Неверная настройка SMIME ',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'Поддержка SMIME включена, но соответствующие настройки содержат ошибки. Проверьте настройки используя кнопку расположенную ниже.',
        'Check SMIME configuration' => 'Проверить настройки SMIME ',
        'Add Certificate' => 'Добавить сертификат',
        'Add Private Key' => 'Добавить закрытый ключ',
        'Filter for Certificates' => 'Фильтр для сертификатов',
        'Filter for certificates' => 'Фильтр для сертификатов',
        'To show certificate details click on a certificate icon.' => 'Для показа подробностей сертификата нажмите на иконку сертификата.',
        'To manage private certificate relations click on a private key icon.' =>
            'Для управления личным сертификатом кликните по значку личного ключа.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Здесь вы можете добавить связи с вашим личным сертификатом, они будут включаться в подпись S/MIME каждый раз, когда вы используете этот сертификат для подписи письма.',
        'See also' => 'См. также',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Вы можете редактировать сертификаты и закрытые ключи прямо на файловой системе',
        'S/MIME Management' => 'Управление S/MIME',
        'Hash' => 'Хэш',
        'Create' => 'Создать',
        'Handle related certificates' => 'Управлять связанными сертификатами',
        'Read certificate' => 'Прочитать сертификат',
        'Delete this certificate' => 'Удалить сертификат',
        'File' => 'Файл',
        'Secret' => 'Пароль',
        'Related Certificates for' => 'Связанные сертификаты для',
        'Delete this relation' => 'Удалить эту связь',
        'Available Certificates' => 'Доступные сертификаты',
        'Filter for S/MIME certs' => 'Фильтр для сертификатов S/MIME',
        'Relate this certificate' => 'Связать этот сертификат',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIMECertRead.tt
        'S/MIME Certificate' => 'Сертификат S/MIME',
        'Close' => 'Закрыть',
        'Certificate Details' => 'Содержание сертификата',
        'Close this dialog' => 'Закрыть этот диалог',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSalutation.tt
        'Add Salutation' => 'Добавить приветствие',
        'Filter for Salutations' => 'Фильтр для приветствий',
        'Filter for salutations' => 'Фильтр для приветствий',
        'Salutation Management' => 'Управление приветствиями',
        'Edit Salutation' => 'Изменить приветствие',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSecureMode.tt
        'Secure Mode Needs to be Enabled!' => 'Необходимо включить безопасный режим!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'После установки системы обычно сразу же включают безопасный режим.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Если безопасный режим не активирован, включите его через SysConfig, поскольку ваше приложение уже запущено.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSelectBox.tt
        'Filter for Results' => 'Фильтр для результатов',
        'Filter for results' => 'Фильтр для результатов',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Здесь вы можете ввести SQL-запрос и напрямую отправить его в базу данных приложения. Невозможно изменение данных в таблицах, только выборка.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Здесь вы можете ввести SQL-запрос и напрямую отправить его в базу данных приложения.',
        'SQL Box' => 'SQL-запросы',
        'Options' => 'Настройки',
        'Only select queries are allowed.' => 'Разрешены только запросы на выборку данных.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Ошибка синтаксиса в вашем SQL-запросе, пожалуйста, проверьте его еще раз. ',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Отсутствует как минимум один параметр привязки. Пожалуйста, проверьте его.',
        'Result format' => 'Формат вывода',
        'Run Query' => 'Выполнить запрос',
        '%s Results' => '%s Результаты',
        'Query is executed.' => 'Запрос выполняется.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminService.tt
        'Add Service' => 'Добавить сервис',
        'Configure Service Visibility and Defaults' => '',
        'Service Management' => 'Управление сервисами',
        'Edit Service' => 'Изменить Сервис',
        'Service name maximum length is 200 characters (with Sub-service).' =>
            'Максимальная длина названия сервиса 200 символов (с подсервисами).',
        'Sub-service of' => 'Подсервис сервиса',
        'Criticality' => 'Критичность',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSession.tt
        'All sessions' => 'Все сеансы',
        'Agent sessions' => 'Сеансы агента',
        'Customer sessions' => 'Сеансы клиента',
        'Unique agents' => 'Уникальные агенты',
        'Unique customers' => 'Уникальные клиенты',
        'Kill all sessions' => 'Завершить все сеансы',
        'Kill this session' => 'Завершить сеанс',
        'Filter for Sessions' => 'Фильтр для сеансов',
        'Filter for sessions' => 'Фильтр для сеансов',
        'Session Management' => 'Управление сеансами',
        'Detail Session View for %s (%s)' => 'Просмотр сессии для %s (%s)',
        'Session' => 'Сеанс',
        'Kill' => 'Завершить',
        'Detail View for SessionID: %s - %s' => 'Просмотр для SessionID: %s - %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSignature.tt
        'Add Signature' => 'Добавить Подпись',
        'Filter for Signatures' => 'Фильтр для Подписей',
        'Filter for signatures' => 'Фильтр для Подписей',
        'Signature Management' => 'Управление подписями',
        'Edit Signature' => 'Изменить подпись',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminState.tt
        'Add State' => 'Добавить состояние',
        'Filter for States' => 'Фильтр для состояний',
        'Filter for states' => 'Фильтр для состояний',
        'Attention' => 'Внимание',
        'Please also update the states in SysConfig where needed.' => 'Пожалуйста, обновите также состояния и в Конфигурации Системы (там, где необходимо).',
        'Configure State Visibility and Defaults' => '',
        'Configure State Type Visibility and Defaults' => '',
        'State Management' => 'Управление состояниями',
        'Edit State' => 'Изменить состояние',
        'This state is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Это состояние указано в настройках SysConfig, требуется подтверждение для обновления настроек для использования нового типа в системе!',
        'State type' => 'Тип состояния',
        'It\'s not possible to invalidate this entry because there is no other merge states in system!' =>
            'Невозможно аннулировать эту запись, потому что нет других merge состояний в системе!',
        'This field must be a hexadecimal color code.' => '',
        'This state is used in the following config settings:' => 'Это состояние используется в следующих параметрах конфигурации:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSupportDataCollector.tt
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Пакет поддержки (включая сведения о регистрации системы, данные поддержки, список установленных пакетов и локально изменённые файлы с исходным кодом) можно сгенерировать нажатием этой кнопки:',
        'Generate Support Bundle' => 'Сгенерировать пакет поддержки',
        'The Support Bundle has been Generated' => 'Пакет поддержки сгенерирован.',
        'A file containing the support bundle will be downloaded to the local system.' =>
            'Файл, содержащий пакет поддержки будет загружен в вашу локальную систему.',
        'Support Data' => 'Данные для поддержки',
        'Error: Support data could not be collected (%s).' => 'Ошибка: данные для поддержки не могут быть собраны (%s).',
        'Support Data Collector' => 'Сбор данных для поддержки',
        'Delete cache' => 'Удалить кеш',
        'Details' => 'Подробно',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemAddress.tt
        'Add System Address' => 'Добавить системный адрес',
        'Filter for System Addresses' => 'Фильтр для системных адресов',
        'Filter for system addresses' => 'Фильтр для системных адресов',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Вся входящая электронная почта с этим адресом в To или Cc будет направлена в выбранную очередь.',
        'System Email Addresses Management' => 'Управление системными адресами электронной почты',
        'Add System Email Address' => 'Добавить системный адрес электронной почты',
        'Edit System Email Address' => 'Редактировать системный адрес электронной почты',
        'Email address' => 'Адрес электронной почты',
        'Display name' => 'Отображаемое имя',
        'This email address is already used as system email address.' => 'Этот адрес электронной почты уже используется как системный адрес.',
        'The display name and email address will be shown on mail you send.' =>
            'Отображаемое имя и адрес электронной почты будут показываться в отправляемой вами почте.',
        'This system address cannot be set to invalid.' => 'Этот системный адрес не может быть установлен недействительным.',
        'This system address cannot be set to invalid, because it is used in one or more queue(s) or auto response(s).' =>
            'Данный системный адрес не может быть сохранен как "недействительный", т.к. используется в одной или нескольких очередях или автоответах.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfiguration.tt
        'online administrator documentation' => 'онлайн-руководство администратора',
        'System configuration' => 'Системная конфигурация',
        'Navigate through the available settings by using the tree in the navigation box on the left side.' =>
            'Перемещайтесь по доступным настройкам, используя дерево в окне навигации слева.',
        'Find certain settings by using the search field below or from search icon from the top navigation.' =>
            'Найдите нужные настройки, используя поле поиска ниже или значок поиска из верхней панели навигации.  ',
        'Find out how to use the system configuration by reading the %s.' =>
            'Об использовании системных настроек можно почитать в %s.',
        'Search in all settings...' => 'Искать среди всех настроек...',
        'There are currently no settings available. Please make sure to run \'znuny.Console.pl Maint::Config::Rebuild\' before using the software.' =>
            'В настоящий момент нет доступных настроек. Убедитесь, что перед началом использования приложения была выполнена команда \'znuny.Console.pl Maint::Config::Rebuild\'.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationDeployment.tt
        'Help' => 'Помощь',
        'This is an overview of all settings which will be part of the deployment if you start it now. You can compare each setting to its former state by clicking the icon on the top right.' =>
            '',
        'To exclude certain settings from a deployment, click the checkbox on the header bar of a setting.' =>
            '',
        'By default, you will only deploy settings which you changed on your own. If you\'d like to deploy settings changed by other users, too, please click the link on top of the screen to enter the advanced deployment mode.' =>
            'По умолчанию, Вы можете применить только те настройки, которые Вы изменили сами. Если Вы хотите поменять также настройки, измененные другими пользователями, пожалуйста выберите ссылку вверху экрана, чтобы войти в расширенный режим развертывания.',
        'A deployment has just been restored, which means that all affected setting have been reverted to the state from the selected deployment.' =>
            'Откат Изменения, это означает, что все затронутые настройки были возвращены в состояние из выбранного применения.',
        'Please review the changed settings and deploy afterwards.' => 'После этого просмотрите измененные настройки и примените их.',
        'An empty list of changes means that there are no differences between the restored and the current state of the affected settings.' =>
            'Пустой список изменений означает, что между восстановленным и текущим состоянием затронутых настроек нет различий.',
        'Changes Deployment' => 'Применение Изменений ',
        'Changes Overview' => 'Обзор Изменений',
        'There are %s changed settings which will be deployed in this run.' =>
            'здесь приведены %s параметра(ов) для применения при этом запуске.',
        'Switch to basic mode to deploy settings only changed by you.' =>
            'Переключиться в основной режим, чтобы применить только ваши изменения.',
        'You have %s changed settings which will be deployed in this run.' =>
            'У вас имеется %s параметра(ов) для применения при этом запуске.',
        'Switch to advanced mode to deploy settings changed by other users, too.' =>
            'Переключиться в расширенный режим, чтобы применить изменения, сделанные вами и другими пользователями.',
        'There are no settings to be deployed.' => 'Нет готовых для применения измененных параметров',
        'Switch to advanced mode to see deployable settings changed by other users.' =>
            'Переключиться в расширенный режим, чтобы просмотреть готовые для применения изменения, сделанные другими пользователями.',
        'Deploy selected changes' => 'Применить выбранные изменения',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationGroup.tt
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups.' =>
            'В этой группе нет параметров. Попробуйте посмотреть есть ли они в её подгруппах.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationImportExport.tt
        'Import & Export' => 'Импорт и Экспорт',
        'Upload a file to be imported to your system (.yml format as exported from the System Configuration module).' =>
            'Загрузите файл, который будет импортирован в Вашу систему (.yml формат, такой же, как при экспорте из модуля System Configuration).',
        'Upload system configuration' => 'Загрузить системные настройки',
        'Import system configuration' => 'Импортировать системные настройки',
        'Download current configuration settings of your system in a .yml file.' =>
            'Выгрузить текущие системные настройки в .yml файл.',
        'Export current configuration' => 'Экспортировать текущую конфигурацию',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearch.tt
        'Search for' => 'Найти',
        'Search for category' => 'Найти категорию',
        'Settings I\'m currently editing' => 'Параметры, которые я редактирую в настоящий момент',
        'Your search for "%s" in category "%s" did not return any results.' =>
            'Поиск "%s" в категории "%s" не дал результата.',
        'Your search for "%s" in category "%s" returned one result.' => 'Поиск "%s" в категории "%s" возвратил один элемент.',
        'Your search for "%s" in category "%s" returned %s results.' => 'Поиск "%s" в категории "%s" возвратил %s элементов (а).',
        'You\'re currently not editing any settings.' => 'Вы в настоящий момент ничего не редактируете в настройках.',
        'You\'re currently editing %s setting(s).' => 'Вы в настоящий момент редактируете %s параметр(ов).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearchDialog.tt
        'Category' => 'Категория',
        'Run search' => 'Выполнить поиск',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationView.tt
        'Go back to Deployment Details' => '',
        'View a custom List of Settings' => 'Просмотр пользовательского Списка Изменений',
        'View single Setting: %s' => 'Просмотр единственного параметра: %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles.tt
        'System file support' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles/Widget.tt
        'Permissions' => 'Права',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenance.tt
        'Schedule New System Maintenance' => 'Новый график технического обслуживания системы',
        'Filter for System Maintenances' => 'Фильтр для Графиков техобслуживания',
        'Filter for system maintenances' => 'Фильтр для Графиков техобслуживания',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Задать график технического обслуживания системы для оповещения агентов и клиентов об отключении системы на определенный период времени.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'За некоторое время до начала периода техобслуживания пользователи получат уведомление на каждом экране интерфейса об этом событии.',
        'System Maintenance Management' => 'Управление обслуживанием системы',
        'Stop date' => 'Дата окончания',
        'Delete System Maintenance' => 'Удалить график техобслуживания.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenanceEdit.tt
        'Edit System Maintenance' => 'Редактировать График техобслуживания ',
        'Edit System Maintenance Information' => 'Редактировать информацию Графика техобслуживания',
        'Date invalid!' => 'Некорректная дата!',
        'Login message' => 'Сообщение при входе',
        'This field must have less then 250 characters.' => 'Это поле не может превышать более чем 250 символов',
        'Show login message' => 'Показать сообщение при входе',
        'Notify message' => 'Сообщение оповещения',
        'Manage Sessions' => 'Управление сеансами',
        'All Sessions' => 'Все сеансы',
        'Agent Sessions' => 'Сеансы агента',
        'Customer Sessions' => 'Сеансы клиента',
        'Kill all Sessions, except for your own' => 'Завершить все сеансы, кроме вашего собственного',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplate.tt
        'Add Template' => 'Добавить шаблон',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Шаблон - текст по умолчанию, который помогает Вашим агентам писать более быстрые заявки, ответы или перенаправления.',
        'Don\'t forget to add new templates to queues.' => 'Не забудьте добавить новые шаблоны к очередям',
        'Template Management' => 'Управление Шаблонами',
        'Edit Template' => 'Изменить шаблон',
        'Attachments' => 'Прикрепленные файлы',
        'Delete this entry' => 'Удалить эту запись',
        'Do you really want to delete this template?' => 'Вы действительно хотите удалить этот шаблон?',
        'A standard template with this name already exists!' => 'Стандартный шаблон с таким именем уже существует!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplateAttachment.tt
        'Manage Template-Attachment Relations' => 'Управление связями Шаблон ↔ Вложение',
        'Toggle active for all' => 'Включить для всех',
        'Link %s to selected %s' => 'Связать %s с выбранным %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTicketAttributeRelations.tt
        'Import CSV or Excel file' => 'Импорт CSV или Excel файла',
        'Ticket attribute relations' => 'Связи свойств заявки',
        'Add ticket attribute relations' => 'Добавить связи свойств заявки',
        'Edit ticket attribute relations' => 'Редактировать связи свойств заявки',
        'Attribute' => 'Свойство',
        'Last update' => 'Последнее изменение',
        'Are you sure you want to delete entry \'%s\'?' => 'Вы действительно хотите удалить запись \'%s\'?',
        'Download previously imported file' => 'Загрузить предварительно импортированный файл',
        'The file needs to be in CSV (UTF-8) or Excel format. Both header columns need to contain the names of valid ticket attributes. The name of the uploaded file must be unique and must not be in use by another ticket attribute relations record.' =>
            'Файл должен быть в CSV (UTF-8) или Excel формате. Обе заголовочные колонки должны содержать имена действительных свойств заявки. Имя загружаемого файла должно быть уникальным и не должно использоваться другой записью связей свойств заявки.',
        'Add missing possible dynamic field values' => '',
        'Attribute values' => '',
        'If a value is colored red, it is missing from the possible values list of the dynamic field configuration.' =>
            'Если значение окрашено красным, оно отсутствует в списке возможных значений в конфигурации динамического поля.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminType.tt
        'Add Type' => 'Добавить тип',
        'Filter for Types' => 'Фильтр для Типов',
        'Filter for types' => 'Фильтр для типов',
        'Configure Type Visibility and Defaults' => '',
        'Type Management' => 'Управление типами заявок',
        'Edit Type' => 'Редактировать тип',
        'A type with this name already exists!' => 'Тип с таким именем уже существует!',
        'This type is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Это состояние есть в настройках SysConfig, требуется подтверждение для обновления настроек для использования нового типа в системе!',
        'This type is used in the following config settings:' => 'Этот тип используется в следующих параметрах конфигурации:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUser.tt
        'Edit personal preferences for this agent' => 'Редактировать персональные настройки этого агента',
        'Agents will be needed to handle tickets.' => 'Для обработки заявок потребуются агенты.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Не забудьте добавить новых агентов в группы и/или роли!',
        'Agent Management' => 'Управление агентами',
        'Edit Agent' => 'Редактирование агента',
        'Please enter a search term to look for agents.' => 'Пожалуйста, введите поисковый запрос для поиска агентов.',
        'Last login' => 'Последний вход',
        'Switch to agent' => 'Переключиться на агента',
        'Title or salutation' => 'Заголовок или приветствие',
        'Firstname' => 'Имя',
        'Lastname' => 'Фамилия',
        'A user with this username already exists!' => 'Пользователь с таким именем уже существует!',
        'Will be auto-generated if left empty.' => 'Будет автоматически сгенерирован, если поле оставлено пустым.',
        'Mobile' => 'Мобильный телефон',
        'Effective Permissions for Agent' => 'Действующие права для агента',
        'This agent has no group permissions.' => 'Этот агент не имеет прав в группах.',
        'Table above shows effective group permissions for the agent. The matrix takes into account all inherited permissions (e.g. via roles).' =>
            'Таблица показывает действующие права агентов в группах. Матрица учитывает все унаследованные разрешения (например, через роли).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUserGroup.tt
        'Manage Agent-Group Relations' => 'Управление связями Агент ↔ Группа',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentAgendaOverview.tt
        'Agenda Overview' => 'Обзор повестки дня',
        'Manage Calendars' => 'Управлять календарями',
        'Add Appointment' => 'Добавить мероприятие',
        'Today' => 'Сегодня',
        'All-day' => 'Целодневный',
        'Repeat' => 'Повторение',
        'Notification' => 'Уведомление',
        'Yes' => 'Да',
        'No' => 'Нет',
        'No calendars found. Please add a calendar first by using Manage Calendars page.' =>
            'Не назначен календарь. Добавьте календарь используя экран управления календарями.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentCalendarOverview.tt
        'Add new Appointment' => 'Добавить новое мероприятие',
        'Appointments' => 'Мероприятия',
        'Calendars' => 'Календари',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentEdit.tt
        'Basic information' => 'Основные данные',
        'Date/Time' => 'Дата/Время',
        'Invalid date!' => 'Неверная дата!',
        'Please set this to value before End date.' => 'Пожалуйста, установите это значение до времени окончания.',
        'Please set this to value after Start date.' => 'Пожалуйста, установите это значение после времени начала.',
        'This an occurrence of a repeating appointment.' => 'Это ряд повторяющихся мероприятий.',
        'Click here to see the parent appointment.' => 'Кликните сюда чтобы открыть родительское мероприятие.',
        'Click here to edit the parent appointment.' => 'Кликните сюда чтобы редактировать родительское мероприятие.',
        'Frequency' => 'Частота',
        'Every' => 'Каждые',
        'day(s)' => 'день(дней)',
        'week(s)' => 'неделя(ль)',
        'month(s)' => 'месяц(ев)',
        'year(s)' => 'год(лет)',
        'On' => 'Включено',
        'Monday' => 'Понедельник',
        'Mon' => 'Пнд',
        'Tuesday' => 'Вторник',
        'Tue' => 'Втр',
        'Wednesday' => 'Среда',
        'Wed' => 'Срд',
        'Thursday' => 'Четверг',
        'Thu' => 'Чтв',
        'Friday' => 'Пятница',
        'Fri' => 'Птн',
        'Saturday' => 'Суббота',
        'Sat' => 'Сбт',
        'Sunday' => 'Воскресенье',
        'Sun' => 'Вск',
        'January' => 'Январь',
        'Jan' => 'Янв',
        'February' => 'Февраль',
        'Feb' => 'Фев',
        'March' => 'Март',
        'Mar' => 'Мар',
        'April' => 'Апрель',
        'Apr' => 'Апр',
        'May_long' => 'Май',
        'May' => 'Май',
        'June' => 'Июнь',
        'Jun' => 'Июн',
        'July' => 'Июль',
        'Jul' => 'Июл',
        'August' => 'Август',
        'Aug' => 'Авг',
        'September' => 'Сентябрь',
        'Sep' => 'Сен',
        'October' => 'Октябрь',
        'Oct' => 'Окт',
        'November' => 'Ноябрь',
        'Nov' => 'Ноя',
        'December' => 'Декабрь',
        'Dec' => 'Дек',
        'Relative point of time' => 'Относительная точка времени',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenter.tt
        'Customer Information Center' => 'Центр информации о компаниях',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenterSearch.tt
        'Customer User' => 'Учетная запись клиента',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerTableView.tt
        'Note: Customer is invalid!' => 'Замечание: неверный клиент!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBook.tt
        'Customer User Address Book' => 'Адресная книга клиентов',
        'Search for recipients and add the results as \'%s\'.' => 'Найти получателей и добавить результаты как \'%s\'.',
        'Search template' => 'Шаблон поиска',
        'Create Template' => 'Создать шаблон',
        'Create New' => 'Создать новый',
        'Save changes in template' => 'Сохранить изменения в шаблоне',
        'Filters in use' => 'Используемые атрибуты фильтра',
        'Additional filters' => 'Дополнительные атрибуты фильтра',
        'Add another attribute' => 'Добавить атрибут поиска',
        'The attributes with the identifier \'(Customer)\' are from the customer company.' =>
            'Атрибуты с идентификатором \'Cuastomer\'/\'Клиент\' принадлежат к компании клиента.',
        '(e. g. Term* or *Term*)' => '(например Term* или *Term*)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverview.tt
        'The customer user is already selected in the ticket mask.' => 'Клиент уже выбран в маске заявки.',
        'Select this customer user' => 'Выбрать этого клиента',
        'Add selected customer user to' => 'Добавить выбранного клиента в',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverviewNavBar.tt
        'Change search options' => 'Изменить параметры поиска',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserInformationCenter.tt
        'Customer User Information Center' => 'Центр информации о клиентах',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDaemonInfo.tt
        'The Znuny Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Планировщик Znuny это такой процесс, который выполняет асинхронные/фоновые задачи, например включение эскалации заявки, отправка почты и прочее.',
        'A running Znuny Daemon is mandatory for correct system operation.' =>
            'Наличие запущенного Планировщика Znuny обязательно для корректной работы системы.',
        'Starting the Znuny Daemon' => 'Запуск Планировщика Znuny',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the Znuny Daemon is running and start it if needed.' =>
            'Убедитесь, что файл  \'%s\' существует (без расширения .dist). Это задание cron будет каждые 5 минут проверять, что Планировщик Znuny запущен и запускает его при необходимости.',
        'Execute \'%s start\' to make sure the cron jobs of the \'znuny\' user are active.' =>
            'Выполните команду  \'%s start\' чтобы убедиться, что cron от имени пользователя \'znuny\' запущен.',
        'After 5 minutes, check that the Znuny Daemon is running in the system (\'bin/znuny.Daemon.pl status\').' =>
            'По истечении 5 минут проверьте, что Планировщик Znuny работает (\'bin/znuny.Daemon.pl status\').',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboard.tt
        'Dashboard' => 'Дайджест',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardAppointmentCalendar.tt
        'New Appointment' => 'Новое мероприятие',
        'Tomorrow' => 'Завтра',
        'Soon' => 'Скоро',
        '5 days' => '5 дней',
        'Start' => 'Начало',
        'none' => 'нет',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCalendarOverview.tt
        'in' => 'в',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCommon.tt
        'All' => 'Все',
        'Search inactive widgets' => 'Поиск не активных виджетов',
        'Active Widgets' => 'Активные виджеты',
        'Save changes' => 'Сохранить изменения',
        'Close this widget' => 'Закрыть виджет',
        'Hide' => 'Скрыть',
        'more' => 'далее',
        'No Data Available.' => 'Данные недоступны.',
        'Available Columns' => 'Колонки, доступные для отображения',
        'Visible Columns (order by drag & drop)' => 'Отображаемые колонки (порядок устанавливается перетаскиванием)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDList.tt
        'Change Customer Relations' => 'Изменить связи клиентов с компанией',
        'Open' => 'Открытые',
        'Closed' => 'Закрытые',
        'Phone ticket' => 'Заявка по телефону',
        'Email ticket' => 'Заявка по почте',
        '%s open ticket(s) of %s' => '%s открытых заявок из %s',
        '%s closed ticket(s) of %s' => '%s закрытых заявок из %s',
        'New phone ticket from %s' => 'Новая телефонная заявка от %s',
        'New email ticket to %s' => 'Новая заявка по почте в %s',
        'Edit customer ID' => 'Редактировать ID клиента',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDStatus.tt
        'Escalated tickets' => 'Эскалированные заявки',
        'Open tickets' => 'Открытые заявки',
        'Closed tickets' => 'Закрытые заявки',
        'All tickets' => 'Все заявки',
        'Archived tickets' => 'Архивированные заявки',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserInformation.tt
        'Note: Customer User is invalid!' => 'Замечание: неверный клиент!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserList.tt
        'Customer user information' => 'Информация о клиенте',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardMyLastChangedTickets.tt
        'No tickets found.' => 'Заявок не найдено.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardRSSOverview.tt
        'Posted %s ago.' => 'Опубликовано %s назад.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardStats.tt
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Настройки виджета статистики содержат ошибки, проверьте их пожалуйста.',
        'Download as SVG file' => 'Загрузить как SVG файл.',
        'Download as PNG file' => 'Загрузить как PNG файл.',
        'Download as CSV file' => 'Загрузить как CSV файл.',
        'Download as Excel file' => 'Загрузить как Excel файл.',
        'Download as PDF file' => 'Загрузить как PDF файл.',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Пожалуйста, выберите правильный формат графического файла для вывода в настройках этого виджета.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Содержимое статистики готовится для вас, подождите.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Этот отчет не может быть в настоящее время использован, так как его настройки должны быть исправлены администратором отчетности.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketGeneric.tt
        'Show' => 'Показать',
        'Assigned to customer user' => 'Назначить клиенту',
        'Accessible for customer user' => 'Доступно клиенту',
        'My locked tickets' => 'Мои заблокированные заявки',
        'My owned tickets' => 'Заявки, где я владелец',
        'My watched tickets' => 'Мои наблюдаемые заявки',
        'My responsibilities' => 'Заявки, где я ответственный',
        'Tickets in My Queues' => 'Заявки в моих очередях',
        'Tickets in My Services' => 'Заявки в Моих сервисах',
        'Service Time' => 'Время обслуживания',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketQueueOverview.tt
        'Total' => 'Итого',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOnline.tt
        'out of office' => 'вне офиса',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOutOfOffice.tt
        'until' => 'до',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentInfo.tt
        'To accept some news, a license or some changes.' => 'Чтобы принять какие-нибудь новости, лицензию или какие-то изменения.',
        'Yes, accepted.' => 'Да, принято',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentLinkObject.tt
        'Manage links for %s' => 'Управление связями для %s',
        'Close and Back' => 'Закрыть и вернуться',
        'Create new links' => 'Создать новые связи',
        'Manage existing links' => 'Управление существующими связями',
        'Link with' => 'Связать с',
        'Start search' => 'Начать поиск',
        'There are currently no links. Please click \'Create new Links\' on the top to link this item to other objects.' =>
            'Нет текущих связей. Нажмите \'Создать новые связи\' выше, чтобы связать этот элемент с другими объектами.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferences.tt
        'Preferences' => 'Настройки',
        'Please note: you\'re currently editing the preferences of %s.' =>
            'Внимание: вы редактируете настройки %s.',
        'Go back to editing this agent' => 'Возврат к редактированию этого агента',
        'Set up your personal preferences. Save each setting by clicking the checkmark on the right.' =>
            'Установите свои личные настройки. Сохраните каждый параметр поставив  "галочку" в квадратике справа.',
        'You can use the navigation tree below to only show settings from certain groups.' =>
            'Вы можете использовать дерево навигации ниже, чтобы показывать только настройки определенных групп.',
        'Dynamic Actions' => 'Динамические Действия',
        'Filter settings...' => 'Фильтровать настройки...',
        'Filter for settings' => 'Фильтр для настроек',
        'Save all settings' => 'Сохранить все настройки',
        'Edit your preferences' => 'Измените ваши личные настройки',
        'Personal Preferences' => 'Персональные настройки',
        'Avatars have been disabled by the system administrator. You\'ll see your initials instead.' =>
            'Системные администраторы отключили аватары. Вместо этого вы увидите свои инициалы.',
        'You can change your avatar image by registering with your email address %s at %s. Please note that it can take some time until your new avatar becomes available because of caching.' =>
            'Вы можете изменить свое изображение аватара, зарегистрировавшись на ваш адрес электронной почты %s на %s. Обратите внимание, что это может занять некоторое время, пока ваш новый аватар не станет доступен из-за кэширования.',
        'Off' => 'Выключено',
        'End' => 'Окончание',
        'Left' => 'Левый',
        'The horizontal distance of the window relative to the screen, in pixels.' =>
            '',
        'Top' => '',
        'The vertical distance of the window relative to the screen, in pixels.' =>
            '',
        'Width' => '',
        'Width in pixels or percent.' => '',
        'Height' => '',
        'Height in pixels or percent.' => '',
        'This setting can currently not be saved.' => 'Этот параметр не может быть изменен в настоящее время.',
        'This setting can currently not be saved' => 'Этот параметр не может быть изменен в настоящее время.',
        'Save setting' => '',
        'Save this setting' => 'Сохранить эту настройку',
        'Did you know? You can help translating Znuny at %s.' => 'Знаете ли Вы? Вы можете помочь с переводом Znuny на %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferencesOverview.tt
        'Choose from the groups on the left to find the settings you\'d wish to change.' =>
            'Выберите группу слева, чтобы найти настройки, которые желаете изменить.',
        'Did you know?' => 'Знаете ли Dы?',
        'You can change your avatar by registering with your email address %s on %s' =>
            'Вы можете изменить свое изображение аватара поменяв адрес электронной почты с %sна %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentSplitSelection.tt
        'Target' => 'Цель',
        'Process' => 'Процесс',
        'Split' => 'Разделить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsAdd.tt
        'Statistics Management' => 'Управление статистикой',
        'Add Statistics' => 'Добавить отчет',
        'Dynamic Matrix' => 'Динамическая матрица',
        'Each cell contains a singular data point.' => 'Каждая ячейка содержит одну точку данных.',
        'Dynamic List' => 'Динамический список',
        'Each row contains data of one entity.' => 'Каждая строка содержит данные одного объекта.',
        'Static' => 'Статический',
        'Non-configurable complex statistics.' => 'Неконфигурируемый комплексный отчет.',
        'General Specification' => 'Общая характеристика',
        'Create Statistic' => 'Создать отчет',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsEdit.tt
        'Run now' => 'Выполнить сейчас',
        'Edit Statistics' => 'Изменить статистику',
        'Statistics Preview' => 'Предпросмотр отчета',
        'Save Statistic' => 'Сохранить отчет',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsImport.tt
        'Import Statistics' => 'Импортировать статистику',
        'Import Statistics Configuration' => 'Импортировать настройки Отчета',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsOverview.tt
        'Statistics' => 'Отчеты',
        'Edit statistic "%s".' => 'Редактировать отчет "%s".',
        'Export statistic "%s"' => 'Экспортировать отчёт "%s"',
        'Export statistic %s' => 'Экспортировать отчёт %s',
        'Delete statistic %s' => 'Удалить отчет %s',
        'Do you really want to delete this statistic?' => 'Вы действительно хотите удалить этот отчет?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsView.tt
        'Statistics Information' => 'Информация об отчете',
        'Created by' => 'Создал',
        'Changed by' => 'Изменил',
        'Sum rows' => 'Сумма строк',
        'Sum columns' => 'Сумма столбцов',
        'Show as dashboard widget' => 'Показать как виджет Дайджеста',
        'Cache' => 'Кэш',
        'Statistics Overview' => 'Перечень отчетов',
        'View Statistics' => 'Просмотреть статистику',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Этот отчет содержит ошибки в настройках и не может в настоящее время использоваться.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketActionCommon.tt
        'Change Free Text of %s%s%s' => 'Изменить свободный текст для %s%s%s',
        'Change Owner of %s%s%s' => 'Изменить владельца для %s%s',
        'Close %s%s%s' => 'Закрыть %s%s%s',
        'Add Note to %s%s%s' => 'Добавить заметку к %s%s%s',
        'Set Pending Time for %s%s%s' => 'Установить время ожидания до %s%s%s',
        'Change Priority of %s%s%s' => 'Сменить приоритет %s%s%s',
        'Change Responsible of %s%s%s' => 'Изменить ответственного для %s%s%s',
        'The ticket has been locked' => 'Заявка была заблокирована',
        'Ticket Settings' => 'Настройки заявки',
        'Service invalid.' => 'Некорректный сервис.',
        'SLA invalid.' => 'Неверное SLA.',
        'Team Data' => '',
        'Queue invalid.' => 'Неверная очередь.',
        'New Owner' => 'Новый владелец',
        'Please set a new owner!' => 'Укажите нового владельца!',
        'Owner invalid.' => 'Неверный владелец',
        'New Responsible' => 'Новый ответственный',
        'Please set a new responsible!' => 'Пожалуйста, задайте нового ответственного!',
        'Responsible invalid.' => 'Неверный ответственный.',
        'Ticket Data' => 'Данные заявки',
        'Next state' => 'Следующее состояние',
        'State invalid.' => 'Неверное состояние.',
        'For all pending* states.' => 'Для всех состояний "ожидает ..."',
        'Dynamic Info' => '',
        'Add Article' => 'Добавить заметку',
        'Inform' => 'Уведомление',
        'Inform agents' => 'Уведомить агентов',
        'Inform involved agents' => 'Уведомить участвующих агентов',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Здесь вы можете выбрать дополнительных агентов, которые получат уведомление в зависимости от нового сообщения/заметки',
        'Text will also be received by' => 'Текст будет также получен',
        'Communications' => 'Сообщение',
        'Create an Article' => 'Создать заметку/сообщение',
        'Setting a template will overwrite any text or attachment.' => 'Создание шаблона перезаписывает любой существующий текст или вложение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBounce.tt
        'Bounce %s%s%s' => 'Перенаправить %s%s%s',
        'cancel' => '',
        'Bounce to' => 'Перенаправить на',
        'You need a email address.' => 'Нужно указать адрес электронной почты.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Требуется корректный адрес электронной почты либо не указывайте локальный адрес.',
        'Next ticket state' => 'Следующее состояние заявки',
        'Inform sender' => 'Информировать отправителя',
        'Send mail' => 'Отправить письмо',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBulk.tt
        'Ticket Bulk Action' => 'Массовое действие',
        'Send Email' => 'Отправить письмо',
        'Merge' => 'Объединить',
        'Merge to' => 'Объединить с',
        'Invalid ticket identifier!' => 'Некорректный идентификатор заявки!',
        'Merge to oldest' => 'Объединить с самым старым',
        'Link together' => 'Связать',
        'Link to parent' => 'Связать с родителем',
        'Unlock tickets' => 'Разблокировать заявки',
        'Watch tickets' => 'Наблюдать за заявками',
        'Mark tickets as seen' => 'Пометить заявки как прочитанные',
        'Mark tickets as unseen' => 'Пометить заявки как непрочитанные',
        'Execute Bulk Action' => 'Выполнить Массовое действие',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCompose.tt
        'Compose Answer for %s%s%s' => 'Создать ответ для %s%s%s',
        'Date Invalid!' => 'Неверная дата!',
        'Select one or more recipients from the customer user address book.' =>
            'Выберите одного или более получателей из адресной книги клиентов.',
        'Customer user address book' => 'Адресная книга клиентов',
        'This address is registered as system address and cannot be used: %s' =>
            'Этот адрес является системным зарегистрированным адресом и не может быть использован: %s',
        'Please include at least one recipient' => 'Пожалуйста, включите хотя бы одного получателя.',
        'Remove Ticket Customer' => 'Удалить клиента-инициатора заявки',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Пожалуйста, удалите эту запись и введите новую с корректным значением.',
        'This address already exists on the address list.' => 'Такой адрес уже существует в списке адресов.',
        'Remove Cc' => 'Удалить из копии',
        'Bcc' => 'Скрытая копия',
        'Remove Bcc' => 'Удалить из скрытой копии',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCustomer.tt
        'Change Customer of %s%s%s' => 'Изменить клиента для %s%s%s',
        'Customer Information' => 'Информация о компании',
        'Customer user' => 'Учетная запись клиента',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmail.tt
        'Create New Email Ticket' => 'Создать заявку по email',
        'Example Template' => 'Пример шаблона',
        'To customer user' => 'Клиенту',
        'Please include at least one customer user for the ticket.' => 'Укажите, пожалуйста, хотя бы одного клиента',
        'Select this customer as the main customer.' => 'Выбрать этого клиента главным клиентом',
        'Remove Ticket Customer User' => 'Удалить клиента заявки',
        'From queue' => 'Из очереди',
        'Get all' => 'Получить всех',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailOutbound.tt
        'Outbound Email for %s%s%s' => 'Исходящее письмо для %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailResend.tt
        'Resend Email for %s%s%s' => 'Отправить личное сообщение для %s%s%s',
        'All fields marked with an asterisk (*) are mandatory.' => 'Все поля отмеченные (*) являются обязательными',
        'Cancel & close' => 'Отменить и закрыть',
        'Undo & close' => 'Отменить и закрыть',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEscalation.tt
        'Ticket %s: first response time is over (%s/%s)!' => 'Заявка %s: время первого ответа истекло (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Заявка %s: время первого ответа истекает через %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Заявка %s: время обновления истекло (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Заявка %s: время обновления истекает через %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Заявка %s: время решения истекло (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Заявка %s: время решения истекает через %s/%s!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketForward.tt
        'Forward %s%s%s' => 'Переслать %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketHistory.tt
        'History of %s%s%s' => 'История для %s%s%s',
        'Start typing to filter...' => '',
        'Filter for history items' => 'Фильтр для элементов истории',
        'Expand/Collapse all' => 'Раскрыть/Свернуть все',
        'CreateTime' => 'ВремяСоздания',
        'Article' => 'Сообщение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMerge.tt
        'Merge %s%s%s' => 'Объединить %s%s%s',
        'Merge Settings' => 'Настройки объединения',
        'Try typing part of the ticket number or title in order to search by it.' =>
            'Начните вводить номер заявки или или текст заголовка для поиска по ним.',
        'You need to use a ticket number!' => 'Вам необходимо использовать номер заявки!',
        'A valid ticket number is required.' => 'Требуется корректный номер заявки.',
        'Limit the search to tickets with same Customer ID (%s).' => 'Ограничить поиск заявок только по Customer ID (%s).',
        'Inform Sender' => 'Информировать отправителя',
        'Need a valid email address.' => 'Требуется верный почтовый адрес.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMove.tt
        'Move %s%s%s' => 'Переслать %s%s%s',
        'New Queue' => 'Новая очередь',
        'Communication' => 'Взаимодействие',
        'Move' => 'Переместить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketNoteToLinkedTicket.tt
        'Add note to linked %s%s%s' => '',
        'Notes' => '',
        'Note to linked Ticket' => '',
        'LinkList invalid.' => 'Список связей недействительный.',
        'Note to origin Ticket' => '',
        'NoteToTicket invalid.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewMedium.tt
        'No ticket data found.' => 'Не найдено данных о заявках.',
        'Open / Close ticket action menu' => '',
        'Select this ticket' => '',
        'Sender' => 'Отправитель',
        'Customer User Name' => 'Имя клиента',
        'Impact' => 'Степень влияния',
        'Update Time' => 'Время до изменения заявки',
        'Solution Time' => 'Время до решения заявки',
        'First Response Time' => 'Время до первого ответа',
        'Move ticket to a different queue' => 'Переместить заявку в другую очередь',
        'Change queue' => 'Сменить очередь',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewNavBar.tt
        'Remove active filters for this screen.' => 'Удалить активные фильтры для этого экрана.',
        'Clear all filters' => 'Очистить все фильтры',
        'Remove mention' => '',
        'Remove from list of watched tickets' => 'Удалить из списка наблюдаемых заявок',
        'Tickets per page' => 'Заявок на страницу',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewPreview.tt
        'Missing channel' => 'Ошибочный канал',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewSmall.tt
        'Reset overview' => 'Сбросить настройки просмотра',
        'Column Filters Form' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhone.tt
        'Split Into New Phone Ticket' => 'Разделить с созданием новой телефонной заявки',
        'Create New Phone Ticket' => 'Создать телефонную заявку',
        'Please include at least one customer for the ticket.' => 'Пожалуйста, введите хотя бы одного клиента для заявки.',
        'To queue' => 'В очередь',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhoneCommon.tt
        'Phone Call for %s%s%s' => 'Телефонный звонок для %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPlain.tt
        'View Email Plain Text for %s%s%s' => 'Показать исходный формат письма для %s%s%s',
        'Plain' => 'Исходный',
        'Download this email' => 'Скачать это письмо',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcess.tt
        'Create New Process Ticket' => 'Создать новую процессную заявку',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcessSmall.tt
        'Enroll Ticket into a Process' => 'Зарегистрировать заявку в Процессе',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketSearch.tt
        'Profile link' => 'Ссылка на шаблон',
        'Output' => 'Вывод результатов',
        'Fulltext' => 'Полнотекстовый',
        'Customer ID (complex search)' => 'Наименование компании (поиск по маске)',
        '(e. g. 234*)' => '(Например, 234 *)',
        'Customer ID (exact match)' => 'Наименование компании (точное совпадение)',
        'Assigned to Customer User Login (complex search)' => 'Назначена на клиента (логин, поиск по маске)',
        '(e. g. U51*)' => '(Например, U51*)',
        'Assigned to Customer User Login (exact match)' => 'Назначена на клиента (логин, точное совпадение)',
        'Accessible to Customer User Login (exact match)' => 'Доступно для клиента (логин, точное совпадение)',
        'Created in Queue' => 'Создана в очереди',
        'Lock state' => 'Состояние блокировки',
        'Watcher' => 'Наблюдатель',
        'Article Create Time (before/after)' => 'Время создания сообщения (до/после)',
        'Article Create Time (between)' => 'Время создания сообщения (между)',
        'Please set this to value before end date.' => 'Пожалуйста, установите это значение до даты окончания.',
        'Please set this to value after start date.' => 'Пожалуйста, установите это значение после даты начала.',
        'Ticket Create Time (before/after)' => 'Время создания заявки (до/после)',
        'Ticket Create Time (between)' => 'Время создания заявки (между)',
        'Ticket Change Time (before/after)' => 'Время изменения заявки (до/после)',
        'Ticket Change Time (between)' => 'Время изменения заявки (между)',
        'Ticket Last Change Time (before/after)' => 'Время последнего изменения заявки (до/после)',
        'Ticket Last Change Time (between)' => 'Время последнего изменения заявки (между)',
        'Ticket Pending Until Time (before/after)' => 'Заявка отложена до (до/после)',
        'Ticket Pending Until Time (between)' => 'Заявка отложена до (между)',
        'Ticket Close Time (before/after)' => 'Время закрытия заявки (до/после)',
        'Ticket Close Time (between)' => 'Время закрытия заявки (между)',
        'Ticket Escalation Time (before/after)' => 'Время эскалации заявки (до/после)',
        'Ticket Escalation Time (between)' => 'Время эскалации заявки (между)',
        'Archive Search' => 'Поиск в архиве',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom.tt
        'Sender Type' => 'Тип отправителя',
        'Save filter settings as default' => 'Сохранить условия фильтра для показа по умолчанию',
        'Event Type' => 'Тип события',
        'Save as default' => 'Сохранить, как значение по умолчанию',
        'Drafts' => 'Черновики',
        'by' => 'кем',
        'Change Queue' => 'Сменить очередь',
        'There are no dialogs available at this point in the process.' =>
            'Нет доступных диалогов в этой части процесса.',
        'This item has no articles yet.' => 'Этот элемент пока не имеет заметок.',
        'Article Overview - %s Article(s)' => 'Обзор заметок/сообщений - %s заметка(ок)',
        'Page %s' => 'Страница %s',
        'Add Filter' => 'Добавить фильтр',
        'Set' => 'Установить',
        'Reset Filter' => 'Сбросить фильтр',
        'No.' => '№',
        'Unread articles' => 'Непрочитанные сообщения',
        'Via' => 'Через',
        'Important' => 'Важно',
        'Unread Article!' => 'Непрочитанные сообщения!',
        'Incoming message' => 'Входящее сообщение',
        'Outgoing message' => 'Исходящее сообщение',
        'Internal message' => 'Внутреннее сообщение',
        'Sending of this message has failed.' => 'Передача сообщения не удалась.',
        'Resize' => 'Изменить размер',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/Chat.tt
        '#%s' => '#%s',
        'via %s' => 'через %s',
        'by %s' => 'от %s',
        'Toggle article details' => 'Включить показ деталей сообщения',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/MIMEBase.tt
        'This message is being processed. Already tried to send %s time(s). Next try will be %s.' =>
            'Это сообщение обрабатывается. Было попыток отправить %s. Следующая попытка будет через %s.',
        'This message contains events' => '',
        'This message contains an event' => '',
        'Show more information' => '',
        'Start: %s, End: %s' => '',
        'Calendar events details' => '',
        'Calendar event details' => '',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Для открытия ссылки в следующем сообщении/заметке необходимо нажать и удерживать клавишу Ctrl или Cmd или Shift и кликнуть по ссылке (зависит от вашего браузера и ОС).',
        'Close this message' => 'Закрыть это сообщение',
        'Image' => 'Изображение',
        'PDF' => 'PDF',
        'View' => 'Просмотр',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/LinkTable.tt
        'Linked Objects' => 'Связанные объекты',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/MentionsTable.tt
        'Mentions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/TicketInformation.tt
        'Archive' => 'Архив',
        'This ticket is archived.' => 'Заявка перемещена в архив.',
        'is invalid' => 'недействительный',
        'Pending till' => 'В ожидании еще',
        'Locked' => 'Блокировка',
        'Accounted time' => 'Потраченное на заявку время',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ArticleContent/Invalid.tt
        'Preview of this article is not possible because %s channel is missing in the system.' =>
            'Предварительный просмотр этой заметки невозможен, поскольку в системе отсутствует канал %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AttachmentBlocker.tt
        'To protect your privacy, remote content was blocked.' => 'Для защиты конфиденциальности, содержимое из внешнего источника было заблокировано',
        'Load blocked content.' => 'Загрузить заблокированное содержимое.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Breadcrumb.tt
        'Home' => 'Домой',
        'Back' => 'Назад',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Create.tt
        'Ticket Creation' => '',
        'Link' => 'Связать',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Link.tt
        'Remove entry' => 'Удалить запись',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt
        'Dear Customer,' => 'Уважаемый Клиент, ',
        'thank you for using our services.' => 'благодарим за использование наших сервисов.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerCompany/TicketCustomerIDSelection.tt
        'The customer ID is not changeable, no other customer ID can be assigned to this ticket.' =>
            'Компания не подлежит изменению, другая компания, сама по себе, не может быть назначена этой заявке.',
        'First select a customer user, then you can select a customer ID to assign to this ticket.' =>
            'Сначала выберите клиента, затем Вы можете выбрать компанию для назначения этой заявке.',
        'Select a customer ID to assign to this ticket.' => 'Выберите компанию для назначения этой заявке.',
        'From all Customer IDs' => 'Из всех компаний клиента',
        'From assigned Customer IDs' => 'Из назначенных компаний клиента',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerError.tt
        'Error' => 'Ошибка',
        'An Error Occurred' => 'Произошла ошибка',
        'Traceback' => 'Трассировка',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooter.tt
        'Powered by %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooterJS.tt
        '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'Соединение было восстановлено после потери связи. По этой причине ряд элементов на странице может работать неверно. Чтобы исключить это, настоятельно рекомендуем обновить страницу.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerHeader.tt
        'Edit personal preferences' => 'Редактировать персональные настройки',
        'Personal preferences' => 'Персональные настройки',
        'Logout' => 'Выход',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerLogin.tt
        'JavaScript Not Available' => 'JavaScript недоступен',
        'In order to experience this software, you\'ll need to enable JavaScript in your browser.' =>
            'Для работы с Znuny вам потребуется включить JavaScript в вашем браузере.',
        'Browser Warning' => 'Предупреждение о браузере',
        'The browser you are using is too old.' => 'Используемый вами браузер слишком стар.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.' =>
            'Это ПО работает с большим списком браузеров, пожалуйста, сделайте обновление для работы с одним из них.',
        'Please see the documentation or ask your admin for further information.' =>
            'Обратитесь к документации или спросите своего администратора для получения дополнительной информации.',
        'One moment please, you are being redirected...' => 'Подождите, вы будете перенаправлены...',
        'Login' => 'Вход',
        'User name' => 'Имя пользователя',
        'Your user name' => 'Ваше имя пользователя',
        'Your password' => 'Ваш пароль',
        'Forgot password?' => 'Забыли пароль?',
        '2 Factor Token' => '2-факторный токен',
        'Your 2 Factor Token' => 'Ваш 2-факторный токен',
        'Log In' => 'Войти',
        'Request New Password' => 'Запросить новый пароль',
        'Your User Name' => 'Логин',
        'A new password will be sent to your email address.' => 'Новый пароль будет отправлен на Ваш адрес электронной почты.',
        'Back to login' => 'Вернуться к странице входа в систему',
        'Create Account' => 'Создать учетную запись',
        'Please fill out this form to receive login credentials.' => 'Пожалуйста, заполните эту форму, чтобы получить учетные данные для входа',
        'How we should address you' => 'Как мы должны к вам обращаться',
        'Your First Name' => 'Ваше Имя',
        'Your Last Name' => 'Ваша Фамилия',
        'Your email address (this will become your username)' => 'Ваш адрес электронной почты (он станет вашим именем пользователя)',
        'Not yet registered?' => 'Хотите зарегистрироваться?',
        'Sign up now' => 'Зарегистрируйтесь сейчас',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketMessage.tt
        'New Ticket' => 'Новая заявка',
        'Service level agreement' => 'Соглашения об уровне сервиса',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketOverview.tt
        'Tickets' => 'Заявки',
        'Welcome!' => 'Добро пожаловать!',
        'Please click the button below to create your first ticket.' => 'Пожалуйста, нажмите на кнопку ниже, чтобы создать вашу первую заявку.',
        'Create your first ticket' => 'Создать вашу первую заявку.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketProcess.tt
        'New Process Ticket' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearch.tt
        'Ticket Search' => 'Поиск заявки',
        'Profile' => 'Параметры',
        'Template Name' => 'Имя шаблона',
        'e. g. 10*5155 or 105658*' => 'например, 10*5155 или 105658*',
        'CustomerID' => 'ID компании',
        'Types' => 'Типы',
        'Limitation' => 'Ограничения',
        'No time settings' => 'Без указания времени',
        'Specific date' => 'Определенная дата',
        'Only tickets created' => 'Заявки созданные',
        'Date range' => 'Диапазон дат',
        'Only tickets created between' => 'Заявки, созданные в промежутке',
        'Ticket Archive System' => 'Система архивирования заявок',
        'Save Search as Template?' => 'Сохранить параметры поиска как шаблон?',
        'Save as Template' => 'Сохранить как шаблон',
        'Save as Template?' => 'Сохранить как шаблон?',
        'Pick a profile name' => 'Выберите имя шаблона',
        'Output to' => 'Вывести как',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearchResultShort.tt
        'Remove this Search Term.' => 'Удалить эти условия поска.',
        'of' => 'из',
        'Page' => 'Страница',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom.tt
        'Ticket Details' => 'Детали заявки',
        'Next Steps' => 'Далее',
        'Reply' => 'Ответить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom/ArticleRender/Chat.tt
        'Expand article' => 'Развернуть сообщение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerWarning.tt
        'Warning' => 'Предупреждение',

        # TT Template: Kernel/Output/HTML/Templates/Standard/DashboardEventsTicketCalendar.tt
        'Event Information' => 'Информация о событии',
        'Ticket fields' => 'Поля заявки',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Error.tt
        'Error Details' => 'Подробности об ошибке',
        'Expand' => 'Развернуть',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/AttachmentList.tt
        'Click to delete this attachment.' => 'Нажмите для удаления вложения.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftButtons.tt
        'Update draft' => 'Обновить черновик',
        'Save as new draft' => 'Сохранить как новый черновик',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftNotifications.tt
        'You have loaded the draft "%s".' => 'Вы загрузили черновик "%s".',
        'You have loaded the draft "%s". You last changed it %s.' => 'Вы загрузили черновик "%s". Последний раз Вы обновляли его %s.',
        'You have loaded the draft "%s". It was last changed %s by %s.' =>
            'Вы загрузили черновик "%s". Последнее его обновление было %s.',
        'Please note that you have already one or more saved drafts for this action.' =>
            '',
        'Please note that this draft is outdated because the ticket was modified since this draft was created.' =>
            'Обратите внимание, что черновик устарел, так как заявка была обновлена после его создания.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Header.tt
        'Last viewed' => 'Последнее просмотренное',
        'You are logged in as' => 'Вы вошли как',
        'Delete all activities' => 'Удалить все активности',
        'Delete all' => 'Удалить все',
        'Mark all activities as seen' => 'Пометить все активности как прочитанные',
        'Seen all' => 'Просмотреть все',

        # TT Template: Kernel/Output/HTML/Templates/Standard/HeaderToolbar.tt
        'Overviews' => 'Обзоры',
        'Personal views' => 'Персональные обзоры',
        'Last Views' => 'Последнее просмотренное',
        'Search tools' => 'Поисковые инструменты',
        'SearchTemplate' => 'Шаблон поиска',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Installer.tt
        'JavaScript not available' => 'JavaScript недоступен',
        'License' => 'Лицензия',
        'Database Settings' => 'Настройки базы данных',
        'General Specifications and Mail Settings' => 'Общие указания и настройки почты',
        'Finish' => 'Закончить',
        'Welcome to %s' => 'Добро пожаловать в %s',
        'Address' => 'Адрес',
        'Phone' => 'Телефон',
        'Web site' => 'Веб-сайт',
        'Community' => '',
        'Next' => 'Вперед',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerConfigureMail.tt
        'Configure Outbound Mail' => 'Конфигурация исходящей почты',
        'Outbound mail type' => 'Тип исходящей почты',
        'Select outbound mail type.' => 'Выберите протокол/способ для отправки исходящей почты.',
        'Outbound mail port' => 'Порт исходящей почты',
        'Select outbound mail port.' => 'Выберите порт исходящей почты.',
        'SMTP host' => 'SMTP-сервер',
        'SMTP host.' => 'SMTP-сервер.',
        'SMTP authentication' => 'SMTP-аутентификация',
        'Does your SMTP host need authentication?' => 'SMTP сервер требует аутентификацию?',
        'SMTP auth user' => 'Пользователь для SMTP-аутентификации',
        'Username for SMTP auth.' => 'Имя пользователя для использования в SMTP-аутентификации.',
        'SMTP auth password' => 'Пароль для SMTP-аутентификации',
        'Password for SMTP auth.' => 'Пароль для использования в SMTP-аутентификации',
        'Configure Inbound Mail' => 'Конфигурация входящей почты',
        'Inbound mail type' => 'Тип входящей почты',
        'Select inbound mail type.' => 'Выберите протокол/способ для получения входящей почты.',
        'Inbound mail host' => 'Почтовый сервер для входящей почты',
        'Inbound mail host.' => 'Почтовый сервер для входящей почты.',
        'Inbound mail user' => 'Имя пользователя для входящей почты',
        'User for inbound mail.' => 'Имя пользователя для входящей почты.',
        'Inbound mail password' => 'Пароль для входящей почты',
        'Password for inbound mail.' => 'Пароль для входящей почты.',
        'Result of mail configuration check' => 'Результаты проверки настроек почты',
        'Check mail configuration' => 'Проверить настройки почты',
        'or' => 'или',
        'Skip this step' => 'Пропустить этот шаг',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBResult.tt
        'Done' => 'Готово',
        'Database setup successful!' => 'База данных настроена успешно!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBStart.tt
        'Install Type' => 'Тип установки',
        'Create a new database for Znuny' => 'Создать новую базу данных для Znuny',
        'Use an existing database for Znuny' => 'Использовать существующую базу данных Znuny',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmssql.tt
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Если вы установили root пароль для базы данных, введите его здесь, иначе, оставьте поле пустым.',
        'Database name' => 'Имя базы данных',
        'Check database settings' => 'Проверить настройки БД',
        'Result of database check' => 'Результат проверки базы данных',
        'Database check successful.' => 'База данных проверена успешно.',
        'Database User' => 'Пользователь базы данных',
        'New' => 'Новое',
        'A new database user with limited permissions will be created for this Znuny system.' =>
            'Для этой системы Znuny будет создан новый пользователь базы данных с ограниченными правами.',
        'Repeat Password' => 'Повторите пароль',
        'Generated password' => 'Сгенерированный пароль',
        'Database' => 'База данных',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmysql.tt
        'Passwords do not match' => 'Пароли не подходят',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBoracle.tt
        'SID' => 'SID',
        'Port' => 'Порт',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerFinish.tt
        'To be able to use Znuny you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Чтобы использовать Znuny, запустите следующую команду в командной строке с правами root.',
        'Restart your webserver' => 'Перезапустите ваш веб-сервер',
        'After doing so your Znuny is up and running.' => 'После этих действий Ваша система Znuny станет запущенной и работающей.',
        'Start page' => 'Главная страница',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerLicense.tt
        'Don\'t accept license' => 'Не принимаю условия лицензии',
        'Accept license and continue' => 'Принять условия лицензии и продолжить',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerSystem.tt
        'SystemID' => 'SystemID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Идентификатор системы. Каждый номер заявки и каждый идентификатор HTTP-сессии - содержат этот номер.',
        'System FQDN' => 'Системное FQDN',
        'Fully qualified domain name of your system.' => 'Полное доменное имя вашей системы.',
        'AdminEmail' => 'Адрес администратора',
        'Email address of the system administrator.' => 'Адрес электронной почты системного администратора.',
        'Organization' => 'Организация',
        'Log' => 'Журнал',
        'LogModule' => 'Модуль журнала ',
        'Log backend to use.' => 'Какой бэкенд использовать для собственно записи журнала.',
        'LogFile' => 'Файл журнала',
        'Webfrontend' => 'Веб-интерфейс',
        'Default language' => 'Язык по умолчанию',
        'Default language.' => 'Язык по умолчанию.',
        'CheckMXRecord' => 'Проверять записи MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Вручную вводимые адреса электронной почты будут проверяться на MX-записи в DNS. Не используйте эту опцию, если ваш DNS-сервер медленный или не разрешает публичные адреса.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/LinkObject.tt
        'Delete link' => 'Удалить связь',
        'Delete Link' => 'Удалить связь',
        'Object#' => 'Объект#',
        'Add links' => 'Добавить связи',
        'Delete links' => 'Удалить связи',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Login.tt
        'Lost your password?' => 'Забыли свой пароль?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MetaFloater.tt
        'Scale preview content' => 'Масштабировать предпросмотр',
        'Open URL in new tab' => 'Открыть URL в новой вкладке',
        'Close preview' => 'Закрыть превью',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Предпросмотр этого сайта недоступен, так как его встраивание не разрешено.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MobileNotAvailableWidget.tt
        'Feature not Available' => 'Возможность недоступна',
        'Sorry, but this feature of Znuny is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'К сожалению, эта функция Znuny в настоящее время недоступна для мобильных устройств. Если вы желаете пользоваться ею, то необходимо или переключиться в режим ПК или воспользоваться стационарным компьютером.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Motd.tt
        'Message of the Day' => 'Новость дня',
        'This is the message of the day. You can edit this in %s.' => 'Это сообщение дня. Вы можете отредактировать его в %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NoPermission.tt
        'Insufficient Rights' => 'Недостаточно прав',
        'Back to the previous page' => 'Обратно на предыдущую страницу',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NotificationEvent/Email/Alert.tt
        'Alert' => 'Предупреждение',
        'Powered by' => 'Используется',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Pagination.tt
        'Show first page' => 'Показать первую страницу',
        'Show previous pages' => 'Показать предыдущие страницы',
        'Show page %s' => 'Показать страницу %s',
        'Show next pages' => 'Показать следующие страницы',
        'Show last page' => 'Показать последнюю страницу',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PictureUpload.tt
        'Need FormID!' => 'Требуется FormID!',
        'No file found!' => 'Файл не найден!',
        'The file is not an image that can be shown inline!' => 'Этот файл не может быть отображен как часть текста!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PreferencesNotificationEvent.tt
        'No user configurable notifications found.' => 'Отсутствуют уведомления, настраиваемые пользователем.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Получить сообщения для уведомления \'%s\'  с помощью метода доставки \'%s\'.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/ActivityDialogHeader.tt
        'Process Information' => 'Информация о процессе',
        'Dialog' => 'Диалог',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/Article.tt
        'Inform Agent' => 'Уведомить агента',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PublicDefault.tt
        'Welcome' => 'Добро пожаловать',
        'This is the default public interface of Znuny! There was no action parameter given.' =>
            'Это публичный/общедоступный интерфейс Znuny по умолчанию! Он не имеет дополнительных параметров действий.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Вы можете установить специальный общедоступный модуль (с помощью менеджера пакетов), например, модуль FAQ, который имеет открытый интерфейс.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAppointmentNotificationEvent.tt
        'To get the appointment attribute' => 'Чтобы получить атрибут мероприятия',
        'e. g.' => 'например,',
        'To get the first 20 character of the appointment title.' => 'Чтобы получить первые 20 символов темы мероприятия.',
        'To get the calendar attribute' => 'Чтобы получить атрибут календаря',
        'Attributes of the recipient user for the notification' => 'Атрибуты пользователя - получателя уведомления',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAutoResponse.tt
        'To get the first 20 character of the subject.' => 'Чтобы получить первые 20 символов темы.',
        'To get the first 5 lines of the email.' => 'Чтобы получить первые 5 строк email.',
        'To get the name of the ticket\'s customer user (if given).' => 'Получить имя клиента заявки (если указано).',
        'To get the article attribute' => 'Чтобы получить атрибут сообщения',
        'Options of the current customer user data' => 'Атрибуты данных о пользователе текущего клиента',
        'Ticket owner options' => 'Атрибуты владельца заявки',
        'Options of the ticket data' => 'Атрибуты данных заявки',
        'Options of ticket dynamic fields internal key values' => 'Атрибуты динамических полей заявки (значения внутренних ключей)',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Атрибуты отображаемых значений динамических полей заявки, полезно при использовании типов Dropdown и Multiselect',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminNotificationEvent.tt
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Первые 20 символов темы из последнего сообщения агента',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Первые 5 строк последнего сообщения агента',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Первые 20 символов темы из последнего сообщения клиента',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Первые 5 строк последнего сообщения клиента',
        'Attributes of the current customer user data' => 'Атрибуты данных текущего клиента',
        'Attributes of the current ticket owner user data' => 'Атрибуты текущего владельца заявки',
        'Attributes of the ticket data' => 'Атрибуты данных заявки',
        'Ticket dynamic fields internal key values' => 'Значения внутренних ключей динамических полей заявки',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Отображаемые значения динамических полей заявки, полезно при использовании полей типа Dropdown и Multiselect',

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
        'Tag Reference' => 'Справка по тэгам',
        'You can use the following tags' => 'Вы можете использовать следующие теги',
        'Ticket responsible options' => 'Атрибуты ответственного за заявку',
        'Options of the current user who requested this action' => 'Атрибуты текущего пользователя, запросившего это действие',
        'Config options' => 'Опции конфигурации',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/GeneralSpecificationsWidget.tt
        'You can select one or more groups to define access for different agents.' =>
            'Вы можете выбрать одну или несколько групп для определения доступа для разных агентов.',
        'Result formats' => 'Форматы результата',
        'Time Zone' => 'Часовой пояс',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Выбранный период времени для отчета не зависит от временНой зоны.',
        'Create summation row' => 'Создать итоговую строку',
        'Generate an additional row containing sums for all data rows.' =>
            'Генерирует дополнительную строку, содержащую суммы для всех строк данных.',
        'Create summation column' => 'Создать итоговую колонку',
        'Generate an additional column containing sums for all data columns.' =>
            'Генерирует дополнительную колонку, содержащую суммы по всем колонкам данных.',
        'Cache results' => 'Кэширование результатов',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Сохраняет результирующие данные отчета в кэше для использования в последующих обзорах с такими же настройками (требуется наличие хотя бы одного поля типа дата/время).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Представляет отчет как виджет, который агент может активировать в своем Дайджесте.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Обращаем внимание, что включение виджета статистики в Дайджесте активирует кэширование для этого виджета.',
        'If set to invalid end users can not generate the stat.' => 'Если установлен недействительным, конечные пользователи не могут генерировать этот отчет.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/PreviewWidget.tt
        'There are problems in the configuration of this statistic:' => 'Обнаружены проблемы в настройках этого отчета:',
        'You may now configure the X-axis of your statistic.' => 'Теперь вы можете настроить параметры оси Х для отчета.',
        'This statistic does not provide preview data.' => 'Этот отчет не предоставляет возможности предварительного просмотра.',
        'Preview format' => 'Формат предварительного просмотра',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Пожалуйста, обратите внимание, что предварительный просмотр использует случайные данные и не учитывает фильтры данных.',
        'Configure X-Axis' => 'Настройка оси X',
        'X-axis' => 'Ось X',
        'Configure Y-Axis' => 'Настройка оси Y',
        'Y-axis' => 'Ось Y',
        'Configure Filter' => 'Настройка фильтров',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/RestrictionsWidget.tt
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Выберите только один пункт или уберите флажок \'Фиксировано\'.',
        'Absolute period' => 'Абсолютный период',
        'Between %s and %s' => 'Между %s и %s',
        'Relative period' => 'Относительный период',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'Прошлое заканчивается %s и текущее+наступающее заканчивается %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'После создания отчета данные для этого элемента уже не могут быть изменены.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsParamsWidget.tt
        'Format' => 'Формат',
        'Exchange Axis' => 'Поменять оси',
        'Configurable Params of Static Stat' => 'Конфигурируемые параметры статического отчета',
        'No element selected.' => 'Элементы не выбраны',
        'Scale' => 'Масштаб',
        'show more' => 'показать далее',
        'show less' => 'скрыть',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsResultRender/D3.tt
        'Download SVG' => 'Скачать как SVG файл.',
        'Download PNG' => 'Скачать как PNG файл.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/XAxisWidget.tt
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Выбранный период времени задает временной период по умолчанию для этого отчета',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Определяет единицу времени, которая будет использоваться для разделения выбранного периода времени в отчете на отрезки для которых вычисляются данные..',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/YAxisWidget.tt
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Помните, что масштаб для групп значений должен быть больше, чем масштаб для оси X (например, ось Х — месяц, группы значений — год).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsList.tt
        'This setting is disabled.' => 'Данный параметр отключен.',
        'This setting is fixed but not deployed yet!' => 'Этот параметр исправлен, но пока не применен!',
        'This setting is currently being overridden in %s and can\'t thus be changed here!' =>
            'Этот параметр в настоящее время переопределяется в %s и здесь не может быть изменен!',
        'Changing this setting is only available in a higher config level!' =>
            '',
        '%s (%s) is currently working on this setting.' => '%s (%s) работает с этим параметром.',
        'Toggle advanced options for this setting' => 'Включить расширенные опции для этого параметра',
        'Disable this setting, so it is no longer effective' => 'Отключите эту настройку, чтобы она перестала действовать',
        'Disable' => 'Отключить',
        'Enable this setting, so it becomes effective' => 'Включите эту настройку, чтобы она начала действовать',
        'Enable' => 'Включить',
        'Reset this setting to its default state' => 'Сбросить эту настройку на значение по умолчанию',
        'Reset setting' => 'Сбросить настройку',
        'Copy a direct link to this setting to your clipboard' => 'Скопировать прямую ссылку на этот параметр в буфер обмена',
        'Copy direct link' => 'Скопировать прямую ссылку',
        'Remove this setting from your favorites setting' => 'Удалить эту настройку из вашего списка избранных',
        'Remove from favourites' => 'Удалить из списка избранных',
        'Add this setting to your favorites' => 'Добавить эту настройку в ваш список избранных',
        'Add to favourites' => 'Добавить в избранное',
        'Cancel editing this setting' => 'Отменить правку этой настройки.',
        'Save changes on this setting' => 'Сохранить эту настройку',
        'Edit this setting' => 'Редактировать этот параметр',
        'Enable this setting' => 'Включить эту настройку',
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups or another group.' =>
            'В этой группе нет параметров. Попробуйте посмотреть есть ли они в её подгруппах или другой группе.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsListCompare.tt
        'Now' => 'Сейчас',
        'User modification' => 'Исправления пользователя',
        'enabled' => 'включено',
        'disabled' => 'отключено',
        'Setting state' => 'Настройка статуса',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Actions.tt
        'Edit search' => 'Изменить условия поиска',
        'Go back to admin: ' => 'Вернуться в панель администратора: ',
        'Deployment' => 'Применение',
        'My favourite settings' => 'Мои избранные настройки',
        'Invalid settings' => 'Неверное значение параметра',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/DynamicActions.tt
        'Filter visible settings...' => 'Фильтровать видимые настройки ...',
        'Enable edit mode for all settings' => 'Включить возможность редактирования всех параметров',
        'Save all edited settings' => 'Сохранить все изменённые параметры',
        'Cancel editing for all settings' => 'Отменить правку всех настроек.',
        'All actions from this widget apply to the visible settings on the right only.' =>
            'Все действия этого виджета применимы только к видимым настройкам справа.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Help.tt
        'Currently edited by me.' => 'Сейчас изменяется мною.',
        'Modified but not yet deployed.' => 'Изменен, но пока не применен.',
        'Currently edited by another user.' => 'Сейчас редактируется другим пользователем.',
        'Different from its default value.' => 'Отличается от значения по умолчанию.',
        'Save current setting.' => 'Сохранить текущие настройки.',
        'Cancel editing current setting.' => 'Отменить правку текущих настроек.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Navigation.tt
        'Navigation' => 'Навигация',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Test.tt
        'Znuny Test Page' => 'Тестовая страница Znuny',
        'Unlock' => 'Разблокировать',
        'Welcome %s %s' => 'Добро пожаловать %s %s',
        'Counter' => 'Счетчик',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Ticket/TimeUnits.tt
        'Invalid time!' => 'Неверное время!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Warning.tt
        'Go back to the previous page' => 'Перейти на предыдущую страницу',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/FormDraftAddDialog.html.tmpl
        'Draft title' => 'Проект заголовка',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/ArticleViewSettingsDialog.html.tmpl
        'Article display' => 'Отображение сообщений',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl
        'Do you really want to delete "%s"?' => 'Вы действительно хотите удалить "%s"?',
        'Confirm' => 'Подтвердить',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/WidgetLoading.html.tmpl
        'Loading, please wait...' => 'Подождите, идет загрузка...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/AjaxDnDUpload/UploadContainer.html.tmpl
        'Click to select a file for upload.' => 'Нажмите, чтобы выбрать файл для загрузки',
        'Select files or drop them here' => 'Выбрать файлы или сбросить их сюда',
        'Select a file or drop it here' => 'Выбрать файл или сбросить его сюда',
        'Uploading...' => 'Выгружается...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/PackageManager/InformationDialog.html.tmpl
        'Process state' => 'Состояние процесса',
        'Running' => 'Выполняется',
        'Finished' => 'Закончено',
        'Unknown' => 'Неизвестный',
        'No package information available.' => 'Информация о пакете недоступна.',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddButton.html.tmpl
        'Add new entry' => 'Добавить новую запись',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddHashKey.html.tmpl
        'Add key' => 'Добавить ключ',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogDeployment.html.tmpl
        'Deployment comment...' => 'Пояснения по применению...',
        'This field can have no more than 250 characters.' => '',
        'Deploying, please wait...' => 'Подождите, идет применение...',
        'Preparing to deploy, please wait...' => 'Подождите, идет подготовка к развертыванию...',
        'Deploy now' => 'Применить сейчас',
        'Try again' => 'Попробуйте еще раз',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogReset.html.tmpl
        'Do you really want to reset this setting to it\'s default value?' =>
            'Вы действительно желаете сбросить эту настройку на значение по умолчанию?',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/HelpDialog.html.tmpl
        'You can use the category selection to limit the navigation tree below to entries from the selected category. As soon as you select the category, the tree will be re-built.' =>
            'Вы можете воспользоваться выбором категории для перемещения по дереву навигации только в пределах выбранной категории. Как только вы выберете категорию дерево будет перестроено.',

        # Perl Module: Kernel/Config/Defaults.pm
        'Database Backend' => 'Бэкенд Базы данных',
        'CustomerIDs' => 'Компании клиента',
        'Fax' => 'Факс',
        'Street' => 'Улица',
        'Zip' => 'Индекс',
        'City' => 'Город',
        'Country' => 'Страна',
        'Valid' => 'Действительность',
        'Mr.' => 'Г-н',
        'Mrs.' => 'Г-жа',
        'View system log messages.' => 'Просмотр системных сообщений.',
        'Edit the system configuration settings.' => 'Редактировать настройки конфигурации системы',
        'Update and extend your system with software packages.' => 'Обновление и расширение системы с помощью программных пакетов.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'ACL в базе данных не синхронизирована с системой. Выполните синхронизацию для всех ACL.',
        'ACLs could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'ACL не могут быть импортированы из-за неизвестной ошибки, проверьте, пожалуйста, логи Znuny для получения более детальной информации',
        'The following ACLs have been added successfully: %s' => 'Следующие ACL были успешно добавлены: %s',
        'The following ACLs have been updated successfully: %s' => 'Следующие ACL были успешно обновлены: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Произошла ошибка при добавлении/обновлении следующей ACL. Подробности в лог-файле.',
        'This field is required' => 'Это поле обязательно',
        'There was an error creating the ACL' => 'Произошла ошибка при создание ACL',
        'Need ACLID!' => 'Требуется ACLID!',
        'Could not get data for ACLID %s' => 'Невозможно получить данные для ACLID %s',
        'There was an error updating the ACL' => 'Произошла ошибка при обновлении ACL',
        'There was an error setting the entity sync status.' => 'Произошла ошибка при установки статуса синхронизации.',
        'There was an error synchronizing the ACLs.' => 'Произошла ошибка при синхронизации ACL.',
        'ACL %s could not be deleted' => 'Невозможно удалить ACL %s',
        'There was an error getting data for ACL with ID %s' => 'Произошла ошибка при получении данный от ACL с ID %s',
        '%s (copy) %s' => '%s (копия) %s ',
        'Please note that ACL restrictions will be ignored for the Superuser account (UserID 1).' =>
            'Обратите внимание, что для аккаунта Superuser (UserID 1) ограничения ACL игнорируются.',
        'Exact match' => 'Полное совпадение',
        'Negated exact match' => 'Отрицание точного совпадения',
        'Regular expression' => 'Регулярное выражение',
        'Regular expression (ignore case)' => 'Регулярное выражение (игнорировать регистр)',
        'Negated regular expression' => 'Отрицание регулярного выражения',
        'Negated regular expression (ignore case)' => 'Отрицание регулярного выражения (игнорировать регистр)',

        # Perl Module: Kernel/Modules/AdminAppointmentCalendarManage.pm
        'System was unable to create Calendar!' => 'Системе не удалось создать календарь!',
        'Please contact the administrator.' => 'Свяжитесь с администратором.',
        'No CalendarID!' => 'Отсутствует CalendarID!',
        'You have no access to this calendar!' => 'У вас нет прав на доступ к этому календарю!',
        'Error updating the calendar!' => 'Ошибки при обновлении календаря!',
        'Couldn\'t read calendar configuration file.' => 'Невозможно прочитать файл настроек календаря.',
        'Please make sure your file is valid.' => 'Убедитесь, пожалуйста, что файл имеет правильный формат.',
        'Could not import the calendar!' => 'Невозможно импортировать календарь!',
        'Calendar imported!' => 'Календарь импортирован!',
        'Need CalendarID!' => 'Требуется CalendarID!',
        'Could not retrieve data for given CalendarID' => 'Невозможно получить данные для указанного CalendarID',
        'Successfully imported %s appointment(s) to calendar %s.' => 'Успешно импортированы %s мероприятий в календарь %s.',
        '+5 minutes' => '+5 минут',
        '+15 minutes' => '+15 минут',
        '+30 minutes' => '+30 минут',
        '+1 hour' => '+1 час',

        # Perl Module: Kernel/Modules/AdminAppointmentImport.pm
        'No permissions' => 'Нет прав доступа',
        'System was unable to import file!' => 'Системе не удалось импортировать файл!',
        'Please check the log for more information.' => 'Пожалуйста, проверьте журнал для получения дополнительной информации.',

        # Perl Module: Kernel/Modules/AdminAppointmentNotificationEvent.pm
        'Notification name already exists!' => 'Уведомление с таким именем уже существует!',
        'Notification added!' => 'Уведомления добавлены!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Произошла ошибка при получении данных для Уведомления с ID: %s!',
        'Unknown Notification %s!' => 'Неизвестное Уведомление %s!',
        '%s (copy)' => '%s (копия)',
        'There was an error creating the Notification' => 'Произошла ошибка при создании Уведомления',
        'Notifications could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'Уведомления не могут быть импортированы из-за неизвестной ошибки, проверьте, пожалуйста, логи Znuny для получения более детальной информации',
        'The following Notifications have been added successfully: %s' =>
            'Следующие Уведомления были успешно добавлены: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Следующие Уведомления были успешно обновлены: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Произошла ошибка при добавлении/обновлении следующих Уведомлений: %s.  Подробности в лог-файле.',
        'Notification updated!' => 'Уведомления обновлены!',
        'Agent (resources), who are selected within the appointment' => 'Агент (ресурс), который выбран в мероприятии',
        'All agents with (at least) read permission for the appointment (calendar)' =>
            'Все агенты с правом чтения (как минимум) для мероприятия (календаря)',
        'All agents with write permission for the appointment (calendar)' =>
            'Все агенты с правом -w/записи на заявку для мероприятия (календаря)',

        # Perl Module: Kernel/Modules/AdminAutoResponse.pm
        'Auto Response added!' => 'Автоответ добавлен!',

        # Perl Module: Kernel/Modules/AdminCommunicationLog.pm
        'Invalid CommunicationID!' => 'Недействительный CommunicationID!',
        'All communications' => 'Все коммуникации',
        'Last 1 hour' => 'Последний 1 час',
        'Last 3 hours' => 'Последние 3 часа',
        'Last 6 hours' => 'Последние 6 часов',
        'Last 12 hours' => 'Последние 12 часов',
        'Last 24 hours' => 'Последние 24 часа',
        'Last week' => 'Последняя неделя',
        'Last month' => 'Последний месяц',
        'Invalid StartTime: %s!' => 'Неверное StartTime: %s!',
        'Successful' => 'Успешно',
        'Processing' => 'Выполнение',
        'Failed' => 'Не удалось выполнить',
        'Invalid Filter: %s!' => 'Неверный Фильтр: %s!',
        'Less than a second' => 'Меньше секунды',
        'sorted descending' => 'отсортировано в порядке убывания',
        'sorted ascending' => 'отсортировано в порядке возрастания',
        'Trace' => 'Трассировка',
        'Debug' => 'Отладка',
        'Info' => 'Информация',
        'Warn' => 'Предупреждение',
        'days' => 'дней',
        'day' => 'день',
        'hour' => 'час',
        'minute' => 'минута',
        'seconds' => 'секунд',
        'second' => 'секунда',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer company updated!' => 'Компания клиента обновлена!',
        'Dynamic field %s not found!' => 'Динамическое поле %s не найдено!',
        'Unable to set value for dynamic field %s!' => 'Невозможно установить значение для динамического поля %s!',
        'Customer Company %s already exists!' => 'Компания клиента %s уже существует!',
        'Customer company added!' => 'Компания клиента добавлена!',

        # Perl Module: Kernel/Modules/AdminCustomerGroup.pm
        'No configuration for \'CustomerGroupPermissionContext\' found!' =>
            'Не найдено настроек для \'CustomerGroupPermissionContext\'!',
        'Please check system configuration.' => 'Проверьте системные настройки.',
        'Invalid permission context configuration:' => 'Неверна конфигурация распределения прав:',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'Customer updated!' => 'Клиент обновлен!',
        'New phone ticket' => 'Новая телефонная заявка',
        'New email ticket' => 'Новая заявка по email',
        'Customer %s added' => 'Клиент %s добавлен',
        'Customer user updated!' => 'Клиент обновлен!',
        'Same Customer' => 'Такой же клиент',
        'Direct' => 'Прямой',
        'Indirect' => 'Косвенный',

        # Perl Module: Kernel/Modules/AdminCustomerUserGroup.pm
        'Change Customer User Relations for Group' => 'Изменить связи Клиентов с Группой',
        'Change Group Relations for Customer User' => 'Изменить связи Групп с Клиентом',

        # Perl Module: Kernel/Modules/AdminCustomerUserService.pm
        'Allocate Customer Users to Service' => 'Связать Клиентов с Сервисом',
        'Allocate Services to Customer User' => 'Связать Сервисы с Клиентом',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'Настройка полей неверна',
        'Objects configuration is not valid' => 'Настройка объектов неверна',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Невозможно правильно сбросить очередность Динамического Поля, подробности в логе ошибок.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Неопределенный subaction.',
        'Need %s' => 'Требуется  %s',
        'Add %s field' => 'Добавить %s поле',
        'The field does not contain only ASCII letters and numbers.' => 'Поле содержит не только буквы и цифры таблицы ASCII.',
        'There is another field with the same name.' => 'Существует другое поле с таким же именем.',
        'The field must be numeric.' => 'Это поле должно быть числовым',
        'Need ValidID' => 'Требуется ValidID',
        'Could not create the new field' => 'Не удалось создать новое поле',
        'Need ID' => 'Требуется ID',
        'Could not get data for dynamic field %s' => 'Невозможно получить данные для динамического поля  %s',
        'Change %s field' => 'Изменить поле %s',
        'The name for this field should not change.' => 'Наименование этого поля не должно меняться',
        'Could not update the field %s' => 'Не удалось обновить поле %s',
        'Currently' => 'В настоящий момент',
        'Unchecked' => 'Не отмечено',
        'Checked' => 'Отмечено',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Запретить ввод дат в будущем',
        'Prevent entry of dates in the past' => 'Запретить ввод дат в прошлом',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Это поле дублируется.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldScreenConfiguration.pm
        'Settings were saved.' => '',
        'System was not able to save the setting!' => '',
        'Setting is locked by another user!' => 'Параметр заблокирован другим агентом!',
        'System was not able to reset the setting!' => 'Система не может сбросить эту настройку!',
        'Settings were reset.' => 'Настройки были сброшены.',
        'Screens for dynamic field %s' => '',
        'Dynamic fields for screen %s' => '',
        'Default columns for screen %s' => '',

        # Perl Module: Kernel/Modules/AdminDynamicFieldWebservice.pm
        'Could not get config for dynamic field %s' => '',
        'The field must contain only ASCII letters and numbers.' => '',
        'Dynamic field is configured more than once.' => '',
        'Dynamic field does not exist or is invalid.' => 'Динамическое поле не существует или недействительное.',
        'Only dynamic fields for tickets are allowed.' => '',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Необходимо указать хотя бы одного получателя.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'minute(s)' => 'минут(а)',
        'hour(s)' => 'час(ов)',
        'Time unit' => 'Единица времени',
        'within the last ...' => 'в течение последних ...',
        'within the next ...' => 'в течение следующих ...',
        'more than ... ago' => 'более чем ... назад',
        'Unarchived tickets' => 'Неархивированные заявки',
        'archive tickets' => 'Архивировать заявки',
        'restore tickets from archive' => 'Восстановить заявки из архива',
        'Need Profile!' => 'Требуется Профиль!',
        'Got no values to check.' => 'Нет значений для проверки.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Удалите, пожалуйста, следующие слова, так как они не могут использоваться для выбора заявок:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Требуется WebserviceID!',
        'Could not get data for WebserviceID %s' => 'Невозможно получить данные для WebserviceID %s',
        'ascending' => 'По возрастанию',
        'descending' => 'По убыванию',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingDefault.pm
        'Need communication type!' => 'Требуется тип коммуникации!',
        'Communication type needs to be \'Requester\' or \'Provider\'!' =>
            'Тип коммуникации должен быть \'Requester\' или \'Provider\'!',
        'Invalid Subaction!' => 'Недопустимый Subaction!',
        'Need ErrorHandlingType!' => 'Требуется ErrorHandlingType!',
        'ErrorHandlingType %s is not registered' => 'ErrorHandlingType %s незарегистрирован',
        'Could not update web service' => 'Не удалось обновить веб-сервис',
        'Need ErrorHandling' => 'Требуется ErrorHandling',
        'Could not determine config for error handler %s' => 'Не удалось определить конфигурацию для обработчика ошибки %s',
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
        'skip all modules' => 'пропустить все модули',
        'Operation deleted' => 'Процесс удален',
        'Invoker deleted' => 'Invoker удалён',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingRequestRetry.pm
        '0 seconds' => '0 секунд',
        '15 seconds' => '15 секунд',
        '30 seconds' => '30 секунд',
        '45 seconds' => '45 секунд',
        '1 minute' => '1 минута',
        '2 minutes' => '2 минуты',
        '3 minutes' => '3 минуты',
        '4 minutes' => '4 минуты',
        '5 minutes' => '5 минут',
        '10 minutes' => '10 минут',
        '15 minutes' => '15 минут',
        '30 minutes' => '30 минут',
        '1 hour' => '1 час',
        '2 hours' => '2 часа',
        '3 hours' => '3 часа',
        '4 hours' => '4 часа',
        '5 hours' => '5 часов',
        '6 hours' => '6 часов',
        '12 hours' => '12 часов',
        '18 hours' => '18 часов',
        '1 day' => '1 день',
        '2 days' => '2 дня',
        '3 days' => '3 дня',
        '4 days' => '4 дня',
        '6 days' => '6 дней',
        '1 week' => '1 неделя',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Could not determine config for invoker %s' => 'Не удалось определить настройки для Invoker %s',
        'InvokerType %s is not registered' => 'Тип Invoker %s не зарегистрирован',
        'MappingType %s is not registered' => 'MappingType %s незарегистрирован',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerEvent.pm
        'Need Invoker!' => 'Требуется Invoker!',
        'Need Event!' => 'Требуется Event!',
        'Could not get registered modules for Invoker' => '',
        'Could not get backend for Invoker %s' => '',
        'The event %s is not valid.' => '',
        'Could not update configuration data for WebserviceID %s' => 'Не возможно обновить параметры для WebserviceID %s',
        'This sub-action is not valid' => '',
        'xor' => 'xor',
        'String' => 'String',
        'Regexp' => 'Регулярное выражение',
        'Validation Module' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Simple Mapping for Outgoing Data' => '',
        'Simple Mapping for Incoming Data' => '',
        'Could not get registered configuration for action type %s' => 'Не возможно зарегистрировать настройки для типа действия %s',
        'Could not get backend for %s %s' => 'Не возможно получить бэкэнд для %s %s',
        'Keep (leave unchanged)' => 'Keep: (оставить без изменений)',
        'Ignore (drop key/value pair)' => 'Ignore: (удалить пару ключ/значение)',
        'Map to (use provided value as default)' => 'Сопоставить с (использовать предоставленное значение по умолчанию)',
        'Exact value(s)' => 'Точное значение(я)',
        'Ignore (drop Value/value pair)' => 'Ignore: (удалить пару Значение / Значение)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'XSLT Mapping for Outgoing Data' => '',
        'XSLT Mapping for Incoming Data' => '',
        'Could not find required library %s' => 'Не удалось найти библиотеку %s',
        'Outgoing request data before processing (RequesterRequestInput)' =>
            '',
        'Outgoing request data before mapping (RequesterRequestPrepareOutput)' =>
            '',
        'Outgoing request data after mapping (RequesterRequestMapOutput)' =>
            '',
        'Incoming response data before mapping (RequesterResponseInput)' =>
            'Данные входящего ответа перед сопоставлением (RequesterResponseInput)',
        'Outgoing error handler data after error handling (RequesterErrorHandlingOutput)' =>
            '',
        'Incoming request data before mapping (ProviderRequestInput)' => 'Данные входящего запроса перед сопоставлением (ProviderRequestInput)',
        'Incoming request data after mapping (ProviderRequestMapOutput)' =>
            '',
        'Outgoing response data before mapping (ProviderResponseInput)' =>
            '',
        'Outgoing error handler data after error handling (ProviderErrorHandlingOutput)' =>
            '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Could not determine config for operation %s' => 'Не удалось определить настройки для процесса %s',
        'OperationType %s is not registered' => 'ТипПроцесса %s не зарегистрирован',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need valid Subaction!' => 'Требуется правильный Subaction!',
        'This field should be an integer.' => 'Это поле должно быть целым числом.',
        'Invalid key file and/or password (if needed, see below).' => '',
        'Invalid password and/or key file (see above).' => '',
        'Certificate is expired.' => '',
        'Certificate file could not be parsed.' => '',
        'Please enter a time in seconds (at least 10 seconds).' => '',
        'Please enter data in expected form (see explanation of field).' =>
            '',
        'File or Directory not found.' => 'Файл или каталог не найден.',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Существует другой веб-сервис с таким же именем.',
        'There was an error updating the web service.' => 'Произошла ошибка при обновлении веб-сервиса.',
        'There was an error creating the web service.' => 'Произошла ошибка при создании веб-сервиса.',
        'Web service "%s" created!' => 'Web-сервис "%s" создан!',
        'Need Name!' => 'Требуется Имя!',
        'Need ExampleWebService!' => 'Требуется ExampleWebService!',
        'Could not load %s.' => '',
        'Could not read %s!' => 'Невозможно прочитать %s!',
        'Need a file to import!' => 'Требуется файл для импорта!',
        'The imported file has not valid YAML content! Please check Znuny log for details' =>
            'импортированный файл имеет недопустимое для YAML содержимое! Пожалуйста, проверьте логи Znuny для подробностей',
        'Web service "%s" deleted!' => 'Web-сервис "%s" удален!',
        'Znuny as provider' => 'Znuny как провайдер',
        'Operations' => 'Операции',
        'Znuny as requester' => 'Znuny как запрашивающий',
        'Invokers' => 'Вызывающие модули',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Не получен WebserviceHistoryID!',
        'Could not get history data for WebserviceHistoryID %s' => 'Невозможно получить исторические данные для WebserviceHistoryID %s',

        # Perl Module: Kernel/Modules/AdminGroup.pm
        'Group updated!' => 'Группа обновлена!',

        # Perl Module: Kernel/Modules/AdminMailAccount.pm
        'Mail account added!' => 'Учетная запись почты добавлена!',
        'Email account fetch already fetched by another process. Please try again later!' =>
            'Учетная запись электронной почты уже обрабатывается другим процессом. Пожалуйста, повторите попытку позже!',
        'Dispatching by email To: field.' => 'Перенаправление по заголовку To: электронного письма',
        'Dispatching by selected Queue.' => 'Перенаправление по выбранной очереди',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Agent who created the ticket' => 'Агент который создал заявку',
        'Agent who owns the ticket' => 'Агент, который владеет заявкой',
        'Agent who is responsible for the ticket' => 'Агент, ответственный за заявку',
        'All agents watching the ticket' => 'Все агенты наблюдающие за заявкой',
        'All agents with write permission for the ticket' => 'Все агенты с правами -w/записи на заявку',
        'All agents subscribed to the ticket\'s queue' => 'Все агенты подписанные на эту очередь',
        'All agents subscribed to the ticket\'s service' => 'Все агенты подписанные на этот сервис',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Все агенты подписанные на этот сервис и эту очередь',
        'Customer user of the ticket' => 'Клиент заявки',
        'All recipients of the first article' => 'Все получатели первой заметки',
        'All recipients of the last article' => 'Все получатели последней заметки',
        'All agents who are mentioned in the ticket' => 'Все агенты, которые были упомянуты в заявке',
        'Invisible to customer' => 'Невидимо для клиента',
        'Visible to customer' => '',

        # Perl Module: Kernel/Modules/AdminOAuth2TokenManagement.pm
        'Authorization code parameters not found.' => '',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'Окружение PGP не работает. Проверьте логи для получения подробностей!',
        'Need param Key to delete!' => 'Требуются параметры Ключа для удаления!',
        'Key %s deleted!' => 'Ключ %s удален!',
        'Need param Key to download!' => 'Требуются параметры Ключа для скачивания!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!' =>
            'В конфигурационном файле Apache для PerlModule и PerlInitHandler требуется Apache::Reload. См. также scripts/apache2-httpd.include.conf. Для установки пакетов также можно  воспользоваться утилитой командной строки bin/znuny.Console.pl!',
        'No such package!' => 'Такой пакет не существует!',
        'No such file %s in package!' => 'Отсутствует файл %s в пакете!',
        'No such file %s in local file system!' => 'Отсутствует файл %s в локальной системе!',
        'Can\'t read %s!' => 'Не возможно прочитать %s!',
        'Package has locally modified files.' => 'Пакет содержит локально изменённые файлы.',
        'Not Started' => 'Не запущено',
        'Updated' => 'Обновлено',
        'Already up-to-date' => 'Уже обновлено',
        'Installed' => 'Установлено',
        'Not correctly deployed' => 'Применено некорректно',
        'Package updated correctly' => 'Приложение обновлено корректно',
        'Package was already updated' => 'Приложение уже обновлено',
        'Dependency installed correctly' => 'Зависимость установлена правильно',
        'The package needs to be reinstalled' => 'Пакет не может быть переустановлен',
        'The package contains cyclic dependencies' => 'Пакет содержит циклические зависимости',
        'Not found in on-line repositories' => 'Не найдено в онлайн репозиториях',
        'Required version is higher than available' => 'Требуемая версия выше доступной',
        'Dependencies fail to upgrade or install' => 'Нарушены зависимости при обновлении или установке',
        'Package could not be installed' => 'Пакет на может быть установлен',
        'Package could not be upgraded' => 'Пакет на может быть обновлен',
        'Repository List' => 'Список репозиториев',
        'No packages found in selected repository. Please check log for more info!' =>
            '',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Не существует фильтра: %s',

        # Perl Module: Kernel/Modules/AdminPriority.pm
        'Priority added!' => 'Приоритет добавлен!',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Информация по управлению процессами из базы данных не синхронизирована с системой, выполните синхронизацию всех процессов.',
        'Need ExampleProcesses!' => 'Требуется ExampleProcesses!',
        'Need ProcessID!' => 'Требуется ProcessID!',
        'Yes (mandatory)' => 'Да (обязательно)',
        'Unknown Process %s!' => 'Неизвестный Процесс %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Произошла ошибка при создании нового EntityID для этого Процесса',
        'The StateEntityID for state Inactive does not exists' => 'StateEntityID для неактивного состояния не существует',
        'There was an error creating the Process' => 'Произошла ошибка при создании Процесса',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для Process entity: %s',
        'Could not get data for ProcessID %s' => 'Невозможно получить данные для ProcessID %s',
        'There was an error updating the Process' => 'Произошла ошибка при обновлении Процесса',
        'Process: %s could not be deleted' => 'Процесс: %s не может быть удален',
        'There was an error synchronizing the processes.' => 'Произошла ошибка при синхронизации процессов.',
        'The %s:%s is still in use' => '%s:%s уже используются',
        'The %s:%s has a different EntityID' => '%s:%s имеют различные EntityID',
        'Could not delete %s:%s' => 'Невозможно удалить %s:%s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для %s entity: %s',
        'Could not get %s' => 'Невозможно получить %s',
        'Need %s!' => 'Требуется %s!',
        'Process: %s is not Inactive' => 'Процесс: %s не является Inactive/Неактивный',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Произошла ошибка при создании нового EntityID для Activity',
        'There was an error creating the Activity' => 'Произошла ошибка при создании Activity',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для Activity entity: %s',
        'Need ActivityID!' => 'Требуется ActivityID!',
        'Could not get data for ActivityID %s' => 'Невозможно получить данные для ActivityID %s',
        'There was an error updating the Activity' => 'Произошла ошибка при обновлении Activity',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Пропущен параметр: Нужны Activity и ActivityDialog!',
        'Activity not found!' => 'Activity не найдена!',
        'ActivityDialog not found!' => 'ActivityDialog не найден!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'ActivityDialog уже назначен для Activity. Нельзя добавлять ActivityDialog дважды!',
        'Error while saving the Activity to the database!' => 'Ошибка при сохранении Activity в базу данных!',
        'This subaction is not valid' => 'Этот subaction недопустим',
        'Edit Activity "%s"' => 'Редактировать Activity "%s".',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Произошла ошибка при создании нового EntityID для ActivityDialog',
        'There was an error creating the ActivityDialog' => 'Произошла ошибка при создании ActivityDialog',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для ActivityDialog  entity: %s',
        'Need ActivityDialogID!' => 'Требуется ActivityDialogID!',
        'Could not get data for ActivityDialogID %s' => 'Невозможно получить данные для ActivityDialogID %s',
        'There was an error updating the ActivityDialog' => 'Произошла ошибка при обновлении ActivityDialog',
        'Edit Activity Dialog "%s"' => 'Редактировать Activity Dialog "%s".',
        'Agent Interface' => 'Интерфейс агента',
        'Customer Interface' => 'Интерфейс клиента',
        'Agent and Customer Interface' => 'Интерфейс агента и клиента',
        'Do not show Field' => 'Не показывать поле',
        'Show Field' => 'Показать поле',
        'Show Field As Mandatory' => 'Заполнение поля обязательно ',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Редактировать путь',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Произошла ошибка при создании нового EntityID для Transition',
        'There was an error creating the Transition' => 'Произошла ошибка при создании Transition',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для Transition entity: %s',
        'Need TransitionID!' => 'Требуется TransitionID!',
        'Could not get data for TransitionID %s' => 'Невозможно получить данные для TransitionID %s',
        'There was an error updating the Transition' => 'Произошла ошибка при обновлении Transition',
        'Edit Transition "%s"' => 'Редактировать Переход/Transition "%s"',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Требуется хотя бы один действительный параметр конфигурации.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Произошла ошибка при создании нового EntityID для TransitionAction',
        'There was an error creating the TransitionAction' => 'Произошла ошибка при созданииTransitionAction',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Произошла ошибка при установке статуса синхронизации для TransitionAction entity: %s',
        'Need TransitionActionID!' => 'Требуется TransitionActionID!',
        'Could not get data for TransitionActionID %s' => 'Невозможно получить данные для TransitionActionID %s',
        'There was an error updating the TransitionAction' => 'Произошла ошибка при обновлении TransitionAction',
        'Edit Transition Action "%s"' => 'Редактировать Transition Action "%s"',
        'Error: Not all keys seem to have values or vice versa.' => 'Ошибка: Не все ключи, кажется, имеют значения, или наоборот.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Queue updated!' => 'Очередь обновлена!',
        'Don\'t use :: in queue name!' => 'Не используйте :: в имени очереди!',
        'Click back and change it!' => 'Нажмите "назад" и измените значение!',
        '-none-' => '-нет-',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Очереди (без автоответов)',

        # Perl Module: Kernel/Modules/AdminQueueTemplates.pm
        'Change Queue Relations for Template' => 'Изменить связь Очередей с Шаблоном',
        'Change Template Relations for Queue' => 'Изменить связь Шаблонов с Очередью',

        # Perl Module: Kernel/Modules/AdminRole.pm
        'Role updated!' => 'Роль обновлена!',
        'Role added!' => 'Роль добавлена!',

        # Perl Module: Kernel/Modules/AdminRoleGroup.pm
        'Change Group Relations for Role' => 'Изменить связи Групп с Ролью',
        'Change Role Relations for Group' => 'Изменить связи Ролей с Группой',

        # Perl Module: Kernel/Modules/AdminRoleUser.pm
        'Role' => 'Роль',
        'Change Role Relations for Agent' => 'Изменить связи Ролей с Агентом',
        'Change Agent Relations for Role' => 'Изменить связи Агентов с Ролью',

        # Perl Module: Kernel/Modules/AdminSLA.pm
        'Please activate %s first!' => 'Пожалуйста, сначала активируйте %s!',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'Окружение S/MIME не работает. Проверьте логи для получения подробностей!',
        'Need param Filename to delete!' => 'Требуются параметр "Имя файла" для удаления!',
        'Need param Filename to download!' => 'Требуются параметр "Имя файла" для скачивания!',
        'Needed CertFingerprint and CAFingerprint!' => 'Требуется CertFingerprint и CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint должен отличаться от CertFingerprint',
        'Relation exists!' => 'Связь существует!',
        'Relation added!' => 'Связь создана!',
        'Impossible to add relation!' => 'Невозможно добавить отношение!',
        'Relation doesn\'t exists' => 'Отношение не существует',
        'Relation deleted!' => 'Связь разорвана!',
        'Impossible to delete relation!' => 'Невозможно удалить отношение!',
        'Certificate %s could not be read!' => 'Сертификат %s невозможно прочитать!',
        'Handle Private Certificate Relations' => '',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation added!' => 'Приветствие добавлено!',

        # Perl Module: Kernel/Modules/AdminSignature.pm
        'Signature updated!' => 'Подпись обновлена!',
        'Signature added!' => 'Подпись добавлена!',

        # Perl Module: Kernel/Modules/AdminState.pm
        'State added!' => 'Состояние добавлено!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'Невозможно прочитать файл %s !',

        # Perl Module: Kernel/Modules/AdminSystemAddress.pm
        'System e-mail address added!' => 'Системный адрес электронной почты добавлен!',

        # Perl Module: Kernel/Modules/AdminSystemConfiguration.pm
        'Invalid Settings' => 'Неверное значение параметра',
        'There are no invalid settings active at this time.' => 'В настоящий момент нет активных неверных настроек.',
        'You currently don\'t have any favourite settings.' => 'У вас сейчас нет никаких избранных настроек.',
        'The following settings could not be found: %s' => 'Следующий параметр не найден: %s',
        'Import not allowed!' => 'Импорт недопустим!',
        'System Configuration could not be imported due to an unknown error, please check Znuny logs for more information.' =>
            'Системная конфигурация не может быть импортирована из-за неизвестной ошибки. Проверьте, пожалуйста, лог Znuny для детальной инофрмации',
        'Category Search' => 'Поиск категории',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationDeployment.pm
        'Some imported settings are not present in the current state of the configuration or it was not possible to update them. Please check the Znuny log for more information.' =>
            'Некоторые импортированные настройки отсутствуют в текущей конфигурации или их невозможно обновить. Для подробностей проверьте записи журнала Znuny.',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationGroup.pm
        'You need to enable the setting before locking!' => 'Необходимо включить параметр перед блокировкой!',
        'You can\'t work on this setting because %s (%s) is currently working on it.' =>
            'Вы не можете работать с этим параметром так как %s (%s) уже работает с ним.',
        'Missing setting name!' => 'Пропущено имя параметра!',
        'Missing ResetOptions!' => 'Пропущен Сброс настроек - ResetOptions!',
        'System was not able to lock the setting!' => 'Система не может заблокировать эту настройку!',
        'System was unable to update setting!' => 'Система не смогла обновить эту настройку!',
        'Missing setting name.' => 'Пропущено имя параметра.',
        'Setting not found.' => 'Параметр не найден.',
        'Missing Settings!' => 'Пропущены параметры!',

        # Perl Module: Kernel/Modules/AdminSystemFiles.pm
        'Package files - %s' => '',
        '(Files where only the permissions have been changed will not be displayed.)' =>
            '',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'Начальная дата не может быть задана позднее даты окончания!',
        'There was an error creating the System Maintenance' => 'Произошла ошибка при создании System Maintenance',
        'Need SystemMaintenanceID!' => 'Требуется SystemMaintenanceID!',
        'Could not get data for SystemMaintenanceID %s' => 'Невозможно получить данные для SystemMaintenanceID %s',
        'System Maintenance was added successfully!' => 'Запись об Обслуживании системы добавлена успешно!',
        'System Maintenance was updated successfully!' => 'Запись об Обслуживании системы обновлена успешно!',
        'Session has been killed!' => 'Сессия была прервана!',
        'All sessions have been killed, except for your own.' => 'Завершить все сеансы, кроме вашего собственного.',
        'There was an error updating the System Maintenance' => 'Произошла ошибка при обновлении System Maintenance',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'Не представлялось возможным удалить запись о SystemMaintenance: %s!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Шаблон обновлен!',

        # Perl Module: Kernel/Modules/AdminTemplateAttachment.pm
        'Change Attachment Relations for Template' => 'Изменить связи Вложений с Шаблоном',
        'Change Template Relations for Attachment' => 'Изменить связи Шаблонов с Вложением',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'Требуется Type!',
        'Type added!' => 'Тип добавлен!',

        # Perl Module: Kernel/Modules/AdminUser.pm
        'Agent updated!' => 'Агент обновлен!',

        # Perl Module: Kernel/Modules/AdminUserGroup.pm
        'Change Group Relations for Agent' => 'Изменить связи Групп с Агентом',
        'Change Agent Relations for Group' => 'Изменить связи Агентов с Группой',

        # Perl Module: Kernel/Modules/AgentAppointmentAgendaOverview.pm
        'Month' => 'Месяц',
        'Week' => 'Неделя',
        'Day' => 'День',

        # Perl Module: Kernel/Modules/AgentAppointmentCalendarOverview.pm
        'All appointments' => 'Все мероприятия',
        'Appointments assigned to me' => 'Мероприятия назначенные мне',
        'Showing only appointments assigned to you! Change settings' => 'Показаны только мероприятия назначенные Вам! Измените настройки',

        # Perl Module: Kernel/Modules/AgentAppointmentEdit.pm
        'Appointment not found!' => 'Мероприятия не найдены!',
        'Never' => 'Никогда',
        'Every Day' => 'Каждый день',
        'Every Week' => 'Каждую неделю',
        'Every Month' => 'Каждый месяц',
        'Every Year' => 'Каждый год',
        'Custom' => 'Пользовательский',
        'Daily' => 'Ежедневно',
        'Weekly' => 'Еженедельно',
        'Monthly' => 'Ежемесячно',
        'Yearly' => 'Ежегодно',
        'every' => 'каждые',
        'for %s time(s)' => 'повторить %s раз(а)',
        'until ...' => 'до ...',
        'for ... time(s)' => 'повторить ... раз(а)',
        'until %s' => 'до %s',
        'No notification' => 'Не уведомлять',
        '%s minute(s) before' => 'за %s минут(у) до',
        '%s hour(s) before' => 'за %s час(ов) до',
        '%s day(s) before' => 'за %s день(дней) до',
        '%s week before' => 'за %s неделю до',
        'before the appointment starts' => 'до начала мероприятия',
        'after the appointment has been started' => 'после начала мероприятия',
        'before the appointment ends' => 'до окончания мероприятия',
        'after the appointment has been ended' => 'после окончания мероприятия',
        'No permission!' => 'Нет прав доступа!',
        'Cannot delete ticket appointment!' => 'Невозможно удалить мероприятие заявки!',
        'No permissions!' => 'Нет прав доступа!',

        # Perl Module: Kernel/Modules/AgentAppointmentList.pm
        '+%s more' => '+%s еще',

        # Perl Module: Kernel/Modules/AgentCustomerSearch.pm
        'Customer History' => 'История клиента',

        # Perl Module: Kernel/Modules/AgentCustomerUserAddressBook.pm
        'No RecipientField is given!' => 'Не указан Получатель!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'Не существует конфигурации для %s',
        'Statistic' => 'Отчет',
        'No preferences for %s!' => 'Нет предпочтений для %s!',
        'Can\'t get element data of %s!' => 'Не возможно получить данные элемента %s!',
        'Can\'t get filter content data of %s!' => 'Невозможно отфильтровать данные %s!',
        'Customer Name' => 'Наименование компании',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Требуется SourceObject и SourceKey!',
        'You need ro permission!' => 'Необходимы права ro!',
        'Can not delete link with %s!' => 'Невозможно удалить связь с %s!',
        '%s Link(s) deleted successfully.' => '%s связь(и) удалены успешно.',
        'Can not create link with %s! Object already linked as %s.' => 'Невозможно создать связь с %s! Объект уже связан с %s.',
        'Can not create link with %s!' => 'Невозможно создать связь с %s!',
        '%s links added successfully.' => '%s связь добавлена успешно.',
        'The object %s cannot link with other object!' => 'Объект %s не может быть связан с другим объектом!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Требуется группа Параметров!',

        # Perl Module: Kernel/Modules/AgentSplitSelection.pm
        'Process ticket' => 'Процессная заявка',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Параметры %s пропущен.',
        'Invalid Subaction.' => 'Недопустимый Subaction.',
        'Statistic could not be imported.' => 'Отчет не может быть импортирован',
        'Please upload a valid statistic file.' => 'Загрузите корректный файл отчёта.',
        'Export: Need StatID!' => 'Экспорт: нужен StatID!',
        'Delete: Get no StatID!' => 'Удаление: Нет StatID!',
        'Need StatID!' => 'Требуется StatID!',
        'Could not load stat.' => 'Не удалось загрузить статистику.',
        'Add New Statistic' => 'Добавить новый отчет',
        'Could not create statistic.' => 'Не удалось создать отчёт.',
        'Run: Get no %s!' => 'Выполнение: Нет %s!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Не задан TicketID!',
        'You need %s permissions!' => 'Вам необходимы %s права!',
        'Loading draft failed!' => 'Загрузка черновика не удалась!',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Извините, для выполнения этого действия вам необходимо быть владельцем заявки.',
        'Please change the owner first.' => 'Сначала измените владельца.',
        'FormDraft functionality disabled!' => 'Функция FormDraft отключена!',
        'Draft name is required!' => 'Необходимо задать название черновика!',
        'FormDraft name %s is already in use!' => 'Имя FormDraft %s уже используется!',
        'Could not perform validation on field %s!' => 'Не удалось выполнить проверку для поля %s!',
        'No subject' => 'Тема отсутствует',
        'Could not delete draft!' => 'Не удалось удалить черновик!',
        'Previous Owner' => 'Предыдущий владелец',
        'wrote' => 'написал(а)',
        'Message from' => 'Сообщение от',
        'End message' => 'Конец сообщения',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => 'Требуется %s!',
        'Plain article not found for article %s!' => 'Не найдена простая статья для статьи %s!',
        'Article does not belong to ticket %s!' => 'Сообщение не принадлежит заявке %s!',
        'Can\'t bounce email!' => 'Не удается отправить эл. почту!',
        'Can\'t send email!' => 'Не удается отправить email!',
        'Wrong Subaction!' => 'Неправильный Subaction!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'Невозможно заблокировать заявки, не указаны TicketID!',
        'Ticket (%s) is not unlocked!' => 'Заявка (%s) не была разблокирована!',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to tickets: %s.' =>
            'Следующие заявки были проигнорированы, потому что они были заблокированы другим агентом или у вас нет прав на изменение этих заявок: %s.',
        'The following ticket was ignored because it is locked by another agent or you don\'t have write access to ticket: %s.' =>
            'Следующая заявка была проигнорирована, потому что она была заблокирована другим агентом или у вас нет прав на изменение заявки: %s.',
        'You need to select at least one ticket.' => 'Выберите хотя бы одну заявку.',
        'Bulk feature is not enabled!' => 'Массовое действие не разрешено!',
        'No selectable TicketID is given!' => 'Не задан доступный TicketID!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'Вы либо не выбрали ни одной заявки, либо все заявки блокированы другими агентами.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            'Следующие заявки были не выбраны так как они заблокированы другими агентами или у вас нет прав на запись для этих заявок: %s.',
        'The following tickets were locked: %s.' => 'Текущие заявки были заблокированы: %s.',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Article subject will be empty if the subject contains only the ticket hook!' =>
            'Тема заметки будет пустой, если тема состоит только из хука заявки!',
        'Address %s replaced with registered customer address.' => 'Адрес %s заменён зарегистрированным адресом клиента.',
        'Customer user automatically added in Cc.' => 'Клиент автоматически добавлен копию сообщения.',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'Ticket "%s" created!' => 'Создана заявка "%s"!',
        'No Subaction!' => 'Нет Subaction!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'Не указан TicketID!',
        'System Error!' => 'Системная ошибка!',

        # Perl Module: Kernel/Modules/AgentTicketEmailResend.pm
        'No ArticleID is given!' => 'Не указан ArticleID!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Next week' => 'Следующая неделя',
        'Ticket Escalation View' => 'Просмотр эскалированных заявок',

        # Perl Module: Kernel/Modules/AgentTicketForward.pm
        'Article %s could not be found!' => 'Заметка %s не найдена!',
        'Forwarded message from' => 'Пересылаемое сообщение от',
        'End forwarded message' => 'Конец пересылаемого сообщения',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'Невозможно отобразить историю, не задан TicketID!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'Невозможно заблокировать заявку, не задан TicketID!',
        'Sorry, the current owner is %s!' => 'Извените, текущий владелец %s!',
        'Please become the owner first.' => 'Пожалуйста, сначала станьте владельцем.',
        'Ticket (ID=%s) is locked by %s!' => 'Заявка (ID=%s) заблокирована %s!',
        'Change the owner!' => 'Сменить владельца!',

        # Perl Module: Kernel/Modules/AgentTicketLockedView.pm
        'New Article' => 'Новое сообщение',
        'Pending' => 'Напоминание',
        'Reminder Reached' => 'Наступило время напоминания',
        'My Locked Tickets' => 'Мои заблокированные заявки',

        # Perl Module: Kernel/Modules/AgentTicketMentionView.pm
        'New mention' => '',
        'My Mentions' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'Не возможно объединить заявку с самой собой!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Требуется права на перемещение!',

        # Perl Module: Kernel/Modules/AgentTicketPhoneCommon.pm
        'Ticket locked.' => 'Заявка заблокирована.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'Нет ArticleID!',
        'This is not an email article.' => 'Это не почтовая заметка.',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'Не возможно прочитать статью! Возможно отсутствует обычная электронная почта в бэкенде! Прочитайте сообщения в бэкенд.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'Требуется TicketID!',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'Невозможно получить ActivityDialogEntityID "%s"!',
        'No Process configured!' => 'Процесс не настроен!',
        'The selected process is invalid!' => 'Выбранный процесс - неправильный!',
        'Process %s is invalid!' => 'Процесс %s неверный!',
        'Subaction is invalid!' => 'Subaction недействительный!',
        'Parameter %s is missing in %s.' => 'Отсутствует параметр %s в %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Не настроен ActivityDialog для %s в _RenderAjax!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'Отсутствуют начальные ActivityEntityID или начальные ActivityDialogEntityID для Процесса: %s в _GetParam!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'Невозможно получить Заявку для TicketID: %s в _GetParam!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'Не удалось определить ActivityEntityID. Динамическое поле или конфигурация настроены некорректно!',
        'Process::Default%s Config Value missing!' => 'Не указаны настройки Process::Default%s!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'Отсутствуют ProcessEntityID или TicketID и ActivityDialogEntityID!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'Не удалось получить StartActivityDialog и StartActivityDialog для ProcessEntityID "%s"!',
        'Can\'t get Ticket "%s"!' => 'Не возможно получить Заявку "%s"!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'Невозможно получить ProcessEntityID или ActivityEntityID для заявки "%s"!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'Невозможно получить конфигурацию активности для ActivityEntityID "%s"!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'Невозможно получить конфигурацию ActivityDialog для ActivityDialogEntityID "%s"!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'Невозможно получить данные для поля "%s" в ActivityDialog "%s"!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'PendingTime может просто использоваться если State или StateID настроены для такого же ActivityDialog. ActivityDialog: %s!',
        'Pending Date' => 'Ожидать до',
        'for pending* states' => 'для состояний "ожидает ..."',
        'ActivityDialogEntityID missing!' => 'Отсутствует ActivityDialogEntityID!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'Невозможно получить Config для ActivityDialogEntityID "%s"!',
        'Couldn\'t use CustomerID as an invisible field.' => 'Невозможно использовать CustomerID в качестве невидимого поля. ',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'Отсутствует ProcessEntityID, проверьте ActivityDialogHeader.tt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Отсутствует StartActivityDialog или StartActivityDialog для Процесса "%s" !',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'Невозможно создать заявку для Процесса с ProcessEntityID "%s"!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'Не удалось установить ProcessEntityID "%s" на TicketID "%s"!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'Не удалось установить ActivityEntityID "%s" на TicketID "%s"!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'Не удалось сохранить ActivityDialog, не верный TicketID: %s!',
        'Invalid TicketID: %s!' => 'Неверный TicketID: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'Отсутствует ActivityEntityID в Ticket %s!',
        'This step does not belong anymore to the current activity in process for ticket \'%s%s%s\'! Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            'Этот шаг больше не относится к текущей текущей активности в процессе по заявке \'%s%s%s\'! Другой пользователь уже изменил эту заявку. Закройте это окно и перезагрузите заявку.',
        'Missing ProcessEntityID in Ticket %s!' => 'Отсутствует ProcessEntityID в Ticket %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Невозможно установить значение динамического поля %s для заявки с ID "%s" in ActivityDialog "%s"!',
        'Could not set attachments for ticket with ID %s in activity dialog "%s"!' =>
            '',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Невозможно установить PendingTime для заявки с ID "%s" в ActivityDialog "%s"!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'Неверная настройка для ActivityDialog Field: %s не отображать => 1 / Показать поле (Пожалуйста, его настройку отображения на => 0 / Не показывать поле или  => 2 /Показывать обязательно)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Невозможно установить %s для заявки с ID "%s" в ActivityDialog "%s"!',
        'Default Config for Process::Default%s missing!' => 'Настройки по умолчанию для Process::Default%s не указаны!',
        'Default Config for Process::Default%s invalid!' => 'Настройки по умолчанию для Process::Default%s недопустимы!',

        # Perl Module: Kernel/Modules/AgentTicketQueue.pm
        'Available tickets' => 'Доступные заявки',
        'including subqueues' => 'включая подочереди',
        'excluding subqueues' => 'исключая подочереди',
        'QueueView' => 'Просмотр очереди',

        # Perl Module: Kernel/Modules/AgentTicketResponsibleView.pm
        'My Responsible Tickets' => 'Заявки, за которые ответственен',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'last-search' => 'последний поиск',
        'Untitled' => 'Без названия',
        'Ticket Number' => 'Номер заявки',
        'Ticket' => 'Заявка',
        'printed by' => 'распечатал',
        'CustomerID (complex search)' => 'Наименование компании (поиск по маске)',
        'CustomerID (exact match)' => 'Наименование компании (точное совпадение)',
        'Invalid Users' => 'Недействительные пользователи',
        'Normal' => 'Обычная',
        'CSV' => 'CSV',
        'Excel' => 'Excel',
        'in more than ...' => 'в более чем ...',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'Функция не доступна!',
        'Service View' => 'Обзор сервисов',

        # Perl Module: Kernel/Modules/AgentTicketStatusView.pm
        'Status View' => 'Просмотр состояний',

        # Perl Module: Kernel/Modules/AgentTicketWatchView.pm
        'My Watched Tickets' => 'Мои наблюдаемые заявки',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'Функция не активирована',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'This ticket does not exist, or you don\'t have permissions to access it in its current state.' =>
            'Эта заявка не существует или у вас нет прав для доступа к ней в её текущем состоянии.',
        'Missing FormDraftID!' => 'Пропущен FormDraftID!',
        'Can\'t get for ArticleID %s!' => 'Невозможно получить %s для ArticleID!',
        'Article filter settings were saved.' => 'Параметры фильтра сообщений/заметок сохранены.',
        'Event type filter settings were saved.' => 'Параметры фильтра событий сохранены.',
        'Need ArticleID!' => 'Требуется ArticleID!',
        'Invalid ArticleID!' => 'Неверный ArticleID!',
        'Forward article via mail' => 'Переслать сообщение почтой',
        'Forward' => 'Переслать',
        'Fields with no group' => 'Поля для которых не указана группа',
        'Invisible only' => 'Только невидимые',
        'Visible only' => 'Только видимые',
        'Visible and invisible' => 'Видимые и невидимые',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'Заметка не может быть открыта! Возможно, она на другой странице заметок?',
        'Show one article' => 'Отобразить одно сообщение',
        'Show all articles' => 'Отобразить все сообщения',

        # Perl Module: Kernel/Modules/AjaxAttachment.pm
        'Got no FormID.' => 'Отсутствует FormID.',
        'Error: the file could not be deleted properly. Please contact your administrator (missing FileID).' =>
            'Ошибка: файл не может быть корректно удален. Обратитесь к администратору (пропущен FileID).',

        # Perl Module: Kernel/Modules/CustomerTicketArticleContent.pm
        'ArticleID is needed!' => 'Требуется ArticleID!',
        'No TicketID for ArticleID (%s)!' => 'Отсутствует TicketID для ArticleID (%s)!',
        'HTML body attachment is missing!' => 'Отсутствует тело HTML-вложения!',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'Требуются FileID и ArticleID!',
        'No such attachment (%s)!' => 'Не существует вложения (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Проверьте настройки SysConfig для %s::QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Проверьте настройки SysConfig setting для %s::TicketTypeDefault.',
        'You don\'t have sufficient permissions for ticket creation in default queue.' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'Требуется CustomerID!',
        'My Tickets' => 'Мои заявки',
        'Company Tickets' => 'Заявки компании',
        'Untitled!' => 'Без заголовка!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Customer Realname' => 'ФИО клиента',
        'Created within the last' => 'Созданы в течение последних ...',
        'Created more than ... ago' => 'Созданы более чем ... назад',
        'Please remove the following words because they cannot be used for the search:' =>
            'Удалите, пожалуйста, следующие слова, так как они не могут использоваться для поиска:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'Не удается переоткрыть заявку, невозможно в этой очереди!',
        'Create a new ticket!' => 'Создать новую заявку!',

        # Perl Module: Kernel/Modules/Installer.pm
        'SecureMode active!' => 'Активирован SecureMode!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'Если вы желаете перезапустить установщик, отключите SecureMode в SysConfig.',
        'Directory "%s" doesn\'t exist!' => 'Каталог "%s" не существует!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Настройте вначале "Home" в Kernel/Config.pm!',
        'File "%s/Kernel/Config.pm" not found!' => 'Файл "%s/Kernel/Config.pm" не найден!',
        'Directory "%s" not found!' => 'Каталог "%s" не найден!',
        'Install Znuny' => 'Установите Znuny',
        'Intro' => 'Интро',
        'Kernel/Config.pm isn\'t writable!' => 'Файл Kernel/Config.pm не доступен для записи!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Если вы желаете использовать инсталлятор, сделайте Kernel/Config.pm доступным для записи для пользователя веб-сервера!',
        'Database Selection' => 'Выбор базы данных',
        'Unknown Check!' => 'Неизвестная проверка!',
        'The check "%s" doesn\'t exist!' => 'Проверка "%s" не существует!',
        'Enter the password for the database user.' => 'Введите пароль пользователя  базы данных.',
        'Database %s' => 'База данных %s',
        'Configure MySQL' => 'Конфигурировать MySQL',
        'Enter the password for the administrative database user.' => 'Введите пароль администратора базы данных.',
        'Configure PostgreSQL' => 'Конфигурировать PostgreSQL',
        'Configure Oracle' => 'Конфигурировать Oracle',
        'Unknown database type "%s".' => 'Неизвестный тип баз данных "%s".',
        'Please go back.' => 'Пожалуйста, вернитесь назад.',
        'Create Database' => 'Создать базу данных',
        'Install Znuny - Error' => 'Установка Znuny - Ошибка',
        'File "%s/%s.xml" not found!' => 'Файл "%s/%s.xml" не найден!',
        'Contact your Admin!' => 'Обратитесь к Вашему администратору!',
        'System Settings' => 'Системные параметры',
        'Syslog' => 'Системный журнал',
        'Configure Mail' => 'Конфигурировать почту',
        'Mail Configuration' => 'Конфигурация почты',
        'Can\'t write Config file!' => 'Не удается записать файл Config!',
        'Unknown Subaction %s!' => 'Неизвестный Subaction %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'Не удается соединиться с базой данных, Perl-модуль DBD::%s не установлен!',
        'Can\'t connect to database, read comment!' => 'Не удается соединиться с базой данных, читайте комментарий!',
        'Database already contains data - it should be empty!' => 'В базе данных уже есть данные. Она должна быть пустой!',
        'Error: You have the wrong database version installed (%s). You need at least version %s! ' =>
            '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Ошибка: Убедитесь что ваша СУБД принимает пакеты размером больше %s MB (текущее значение размера пакета - до %s MB). Измените значение параметра max_allowed_packet для вашей СУБД во избежание ошибок.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Ошибка: Установите значение параметра  innodb_log_file_size для вашей СУБД по крайней мере %s MB (текущее: %s MB, рекомендуемое: %s MB) Более подробно смотрите в %s.',
        'Error: Please set the value for innodb_file_per_table on your database to ON.' =>
            '',
        'Error: Please set the value for innodb_default_row_format on your database to dynamic.' =>
            '',
        'Wrong default storage engine (%s is %s, but it needs to be InnoDB).' =>
            '',

        # Perl Module: Kernel/Modules/Mentions.pm
        '%s users will be mentioned' => '%s пользователей будет упомянуто',

        # Perl Module: Kernel/Modules/PublicCalendar.pm
        'No %s!' => 'Отсутствует %s!',
        'No such user!' => 'Такой пользователь не существует!',
        'Invalid calendar!' => 'Недействительный календарь!',
        'Invalid URL!' => 'Неверный URL!',
        'There was an error exporting the calendar!' => 'Произошла ошибка при экспортировании календаря!',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'Необходима настройка Package::RepositoryAccessRegExp',
        'Authentication failed from %s!' => 'Аутентификация неудачна от %s!',

        # Perl Module: Kernel/Output/HTML/Article/Chat.pm
        'Chat' => 'Чат',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketBounce.pm
        'Bounce Article to a different mail address' => 'Перенаправить сообщение на другой почтовый адрес',
        'Bounce' => 'Перенаправить',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketCompose.pm
        'Reply All' => 'Ответить всем',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketEmailResend.pm
        'Resend this article' => 'Отправить эту заметку повторно',
        'Resend' => 'Отправить повторно',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketMessageLog.pm
        'View message log details for this article' => 'Посмотреть записи журнала отправки для этой заметки',
        'Message Log' => 'Журнал отправки',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNote.pm
        'Reply to note' => 'Ответить на сообщение',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNoteToLinkedTicket.pm
        'Create notice for linked ticket' => '',
        'Transfer notice' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPhone.pm
        'Split this article' => 'Разделить это сообщение',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPlain.pm
        'View the source for this Article' => 'Посмотреть исходный текст этого Сообщения',
        'Plain Format' => 'Исходный формат',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPrint.pm
        'Print this article' => 'Напечатать это сообщение',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkArticleSeenUnseen.pm
        'Mark article as unseen' => 'Отметить сообщение как непрочитанное',
        'Mark as unseen' => 'Пометить как непрочитанное',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkAsImportant.pm
        'Mark' => 'Пометить',
        'Unmark' => 'Снять пометку',

        # Perl Module: Kernel/Output/HTML/ArticleAction/ReinstallPackageLink.pm
        'Re-install Package' => 'Переустановить пакет',
        'Re-install' => 'Переустановить ',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Crypted' => 'Зашифровано',
        'Sent message encrypted to recipient!' => 'Отправить зашифрованное сообщение получателю!',
        'Signed' => 'Подписано',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => 'Обнаружен заголовок "PGP SIGNED MESSAGE", но он испорчен!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => 'Обнаружен заголовок "S/MIME SIGNED MESSAGE", но он испорчен!',
        'Ticket decrypted before' => 'Заявка расшифрованная до этого',
        'Impossible to decrypt: private key for email was not found!' => 'Невозможно расшифровать: частный ключ для почты не обнаружен!',
        'Successful decryption' => 'Успешно расшифровано',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Crypt.pm
        'There are no encryption keys available for the addresses: \'%s\'. ' =>
            'Для адресов \'%s\'нет ключей шифрования.',
        'There are no selected encryption keys for the addresses: \'%s\'. ' =>
            'Для адресов: \'%s\'не выбраны ключи шифрования.',
        'Cannot use expired encryption keys for the addresses: \'%s\'. ' =>
            '',
        'Cannot use revoked encryption keys for the addresses: \'%s\'. ' =>
            '',
        'Encrypt' => 'Зашифровать',
        'Keys/certificates will only be shown for recipients with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            'Ключи/сертификаты будут показаны для получателей с более чем одним ключом/сертификатом. Первый найденный ключ/сертификат будет уже предварительно выбран. Убедитесь, что выбран правильный.',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Security.pm
        'Email security' => 'Защита почты',
        'PGP sign' => 'PGP подпись',
        'PGP sign and encrypt' => 'PGP подпись и шифрование',
        'PGP encrypt' => 'PGP шифрование',
        'SMIME sign' => 'SMIME подпись',
        'SMIME sign and encrypt' => 'SMIME подпись и шифрование',
        'SMIME encrypt' => 'SMIME шифрование',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Sign.pm
        'Cannot use expired signing key: \'%s\'. ' => '',
        'Cannot use revoked signing key: \'%s\'. ' => '',
        'There are no signing keys available for the addresses \'%s\'.' =>
            'Для адресов: \'%s\'нет ключей подписи.',
        'There are no selected signing keys for the addresses \'%s\'.' =>
            'Для адресов: \'%s\'не выбраны ключи подписи.',
        'Sign' => 'Подписать',
        'Keys/certificates will only be shown for a sender with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            'Ключи/сертификаты будут показаны для отправителя с более чем одним ключом/сертификатом. Первый найденный ключ/сертификат будет уже предварительно выбран. Убедитесь, что выбран правильный.',

        # Perl Module: Kernel/Output/HTML/Dashboard/AppointmentCalendar.pm
        'Shown' => 'Показано',
        'Refresh (minutes)' => 'Интервал обновления (в минутах)',
        'off' => 'выключено',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerIDList.pm
        'Shown customer ids' => 'Показанные идентификаторы клиентов',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerUserList.pm
        'Shown customer users' => 'Отображенные клиенты',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'Время начала для заявки установлено после времени окончания!',

        # Perl Module: Kernel/Output/HTML/Dashboard/MyLastChangedTickets.pm
        'Shown Tickets' => 'Показываемые заявки',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'Не удается подключиться к %s!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'Shown Columns' => 'Показываемые колонки',
        'filter not active' => 'фильтр не активен',
        'filter active' => 'фильтр активирован',
        'This ticket has no title or subject' => 'У этой заявки отсутствует Тема',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketStatsGeneric.pm
        '7 Day Stats' => 'Статистика за неделю (7 дней)',

        # Perl Module: Kernel/Output/HTML/Dashboard/UserOnline.pm
        'User is currently offline.' => 'Пользователь сейчас отключен.',
        'User is currently active.' => 'Пользователь сейчас активен.',
        'User was inactive for a while.' => 'Пользователь некоторое время неактивен.',
        'User set their status to unavailable.' => 'Пользователь установил свое состояние как недоступное.',
        'Away' => 'Отсутствует',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'Standard' => 'Стандартный',
        'The following tickets are not updated: %s.' => '',
        'h' => 'ч',
        'm' => 'мин',
        'd' => 'дн',
        'This ticket does not exist, or you don\'t have permissions to access it in its current state. You can take one of the following actions:' =>
            'Эта заявка не существует или у вас нет прав для доступа к ней в её текущем состоянии. Вы можете попробовать выполнить одно из следующих действий:',
        'This is a' => 'Это',
        'email' => 'email',
        'click here' => 'нажмите здесь',
        'to open it in a new window.' => 'открыть в новом окне.',
        'Year' => 'Год',
        'Hours' => 'Часы',
        'Minutes' => 'Минуты',
        'Check to activate this date' => 'Отметьте, чтобы активировать эту дату',
        '%s TB' => '%s TB',
        '%s GB' => '%s GB',
        '%s MB' => '%s MB',
        '%s KB' => '%s KB',
        '%s B' => '%s B',
        'No Permission!' => 'Нет прав доступа!',
        'No Permission' => 'Нет разрешения',
        'Show Tree Selection' => 'Показать в виде дерева',
        'Split Quote' => 'Разделить Цитату',
        'Remove Quote' => 'Удалить Цитату',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Связан как',
        'Search Result' => 'Результат поиска',
        'Linked' => 'Связан',
        'Bulk' => 'Массовое действие',

        # Perl Module: Kernel/Output/HTML/Layout/Ticket.pm
        'Lite' => 'Облегченный',
        'Unread article(s) available' => 'Доступны непрочтенные сообщения',

        # Perl Module: Kernel/Output/HTML/LinkObject/Appointment.pm
        'Appointment' => 'Мероприятие',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Поиск в архиве',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOnline.pm
        'Online Agent: %s' => 'Агент онлайн: %s',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTicketEscalation.pm
        'There are more escalated tickets!' => 'Есть еще эскалированные заявки!',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTimeZoneCheck.pm
        'Please select a time zone in your preferences and confirm it by clicking the save button.' =>
            'Выберите временнУю зону для личных настроек и подтвердите нажатием кнопки сохранения.',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerOnline.pm
        'Online Customer: %s' => 'Клиент онлайн: %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'System maintenance is active!' => 'Система на техническом обслуживании!',
        'A system maintenance period will start at: %s and is expected to stop at: %s' =>
            'Период обслуживания системы: начало в %s, ожидаемое окончание %s',

        # Perl Module: Kernel/Output/HTML/Notification/DaemonCheck.pm
        'Znuny Daemon is not running.' => 'Служба Znuny не запущена.',

        # Perl Module: Kernel/Output/HTML/Notification/OAuth2TokenManagementTokenExpired.pm
        'OAuth2 token for "%s" has expired.' => 'Срок действия OAuth2 ключа (token) для "%s" истек.',
        'OAuth2 refresh token for "%s" has expired.' => 'Срок действия OAuth2 ключа обновления (refresh token) для "%s" истек.',

        # Perl Module: Kernel/Output/HTML/Notification/OutofOfficeCheck.pm
        'You have Out of Office enabled, would you like to disable it?' =>
            'Вы включали Отсутствие в офисе, хотите отключить?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationInvalidCheck.pm
        'You have %s invalid setting(s) deployed. Click here to show invalid settings.' =>
            'У вас %s ошибочных настроек. Нажмите здесь, чтобы отобразить их.',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationIsDirtyCheck.pm
        'You have undeployed settings, would you like to deploy them?' =>
            'У вас есть непримененные настройки, желаете применить?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationOutOfSyncCheck.pm
        'The configuration is being updated, please be patient...' => 'Конфигурация обновляется, будьте внимательны...',
        'There is an error updating the system configuration!' => 'Произошла ошибка при обновлении конфигурации!',

        # Perl Module: Kernel/Output/HTML/Notification/UIDCheck.pm
        'Don\'t use the Superuser account to work with %s! Create new Agents and work with these accounts instead.' =>
            'Не используйте учетную запись суперпользователя для работы с Znuny! Создайте новых агентов и работайте под их учетными записями.',

        # Perl Module: Kernel/Output/HTML/Preferences/AppointmentNotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Убедитесь, что вы выбрали по крайней мере один метод доставки для обязательных уведомлений.',
        'Preferences updated successfully!' => 'Настройки успешно обновлены!',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(выполняется)',

        # Perl Module: Kernel/Output/HTML/Preferences/MaxArticlesPerPage.pm
        'Max. number of articles per page must be between 1 and 1000 or empty.' =>
            'Максимальное число сообщений на странице должно быть между 1 и 1000 или пусто.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Пожалуйста, укажите Дату окончания раньше даты начала.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Current password' => 'Текущий пароль',
        'New password' => 'Новый пароль',
        'Verify password' => 'Подтвердите пароль',
        'The current password is not correct. Please try again!' => 'Пароль не верен. Пожалуйста, попробуйте снова!',
        'Please supply your new password!' => 'Пожалуйста, укажите ваш новый пароль!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Невозможно обновить пароль. Новые пароли не совпадают. Пожалуйста, попробуйте снова!',
        'This password is forbidden by the current system configuration. Please contact the administrator if you have additional questions.' =>
            'Такой пароль запрещен в текущей конфигурации. Если есть вопросы обращайтесь к администратору системы.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Невозможно обновить пароль, т.к. его длина должна быть не менее %s символов!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase letter characters!' =>
            'Невозможно обновить пароль, т.к. он должен содержать не менее 2-х строчных и 2-х заглавных символов!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Невозможно обновить пароль, т.к. он должен содержать не менее 1-й цифры!',
        'Can\'t update password, it must contain at least 2 letter characters!' =>
            'Невозможно обновить пароль, т.к. он должен содержать не менее 2 символов!',

        # Perl Module: Kernel/Output/HTML/Preferences/TimeZone.pm
        'Time zone updated successfully!' => 'Часовой пояс успешно обновлён!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'invalid' => 'недействительный',
        'valid' => 'действительный',
        'No (not supported)' => 'Нет (не поддерживается)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Ни прошлого, ни текущего + наступающее относительного времени завершения не выбрано.',
        'The selected time period is larger than the allowed time period.' =>
            'Выбранный период времени больше, чем разрешенный период.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Не назначено значение шкалы времени для текущего выбранного значения шкалы времени на оси X.',
        'The selected date is not valid.' => 'Выбранная дата неверна.',
        'The selected end time is before the start time.' => 'Указанное время окончания раньше времени начала.',
        'There is something wrong with your time selection.' => 'какая-то ошибка при указании времени.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Пожалуйста, выберите только один параметр или снимите флаг \'Fixed\' для времени создания отчета.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Пожалуйста, выберите хотя бы один параметр или снимите флаг \'Fixed\' для времени создания отчета.',
        'Please select one element for the X-axis.' => 'Выберите один элемент для оси X.',
        'You can only use one time element for the Y axis.' => 'Вы можете выбрать только один параметр времени для оси Y.',
        'You can only use one or two elements for the Y axis.' => 'Вы можете выбрать только один или два параметра для оси Y.',
        'Please select at least one value of this field.' => 'Пожалуйста, выберите хотя бы одно значение для этого поля.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Пожалуйста, укажите значение или снимите флаг \'Fixed\' для времени создания отчета.',
        'Please select a time scale.' => 'Пожалуйста, выберите шкалу времени.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'Период отчетности слишком мал, укажите больший интервал.',
        'second(s)' => 'секунд(а)',
        'quarter(s)' => 'квартал(ы)',
        'half-year(s)' => 'полугодие(я)',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Удалите, пожалуйста, следующие слова, так как они не могут использоваться для фильтра заявок: %s.',

        # Perl Module: Kernel/Output/HTML/SysConfig.pm
        'Cancel editing and unlock this setting' => 'Отменить правку и разблокировать эту настройку',
        'Reset this setting to its default value.' => 'Сбросить эту настройку на значение по умолчанию.',
        'Unable to load %s!' => 'Не удалось загрузить %s!',
        'Content' => 'Содержание',

        # Perl Module: Kernel/Output/HTML/TicketMenu/Lock.pm
        'Unlock to give it back to the queue' => 'Разблокировать, чтобы вернуть в очередь',
        'Lock it to work on it' => 'Заблокировать, чтобы работать с нею',

        # Perl Module: Kernel/Output/HTML/TicketMenu/TicketWatcher.pm
        'Unwatch' => 'Не наблюдать',
        'Watch' => 'Наблюдать',
        'Add to list of watched tickets' => 'Добавить в список наблюдаемых заявок',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Сортировка по',

        # Perl Module: Kernel/Output/HTML/TicketZoom/TicketInformation.pm
        'Ticket Information' => 'Информация о заявке',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketLocked.pm
        'Locked Tickets New' => 'Заблокированные заявки: Новые',
        'Locked Tickets Reminder Reached' => 'Заблокированные заявки: Время напоминания наступило',
        'Locked Tickets Total' => 'Заблокированные заявки: Всего',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketMention.pm
        'Total mentions' => '',
        'Total new mentions' => '',
        'New mentions' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketOwner.pm
        'Owned Tickets New' => 'Владелец заявки (Новые)',
        'Owned Tickets Reminder Reached' => 'Владелец заявки (Время ожидания истекло)',
        'Owned Tickets Total' => 'Владелец заявки (Всего)',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketResponsible.pm
        'Responsible Tickets New' => 'Ответственный за заявки (Новые)',
        'Responsible Tickets Reminder Reached' => 'Ответственный за заявки (Напоминание истекло)',
        'Responsible Tickets Total' => 'Ответственный за заявки (Всего)',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketWatcher.pm
        'Watched Tickets New' => 'Наблюдаемые заявки: Новые',
        'Watched Tickets Reminder Reached' => 'Наблюдаемые заявки: Напоминание истекло',
        'Watched Tickets Total' => 'Наблюдаемые заявки: Всего',

        # Perl Module: Kernel/Output/PDF/Ticket.pm
        'Ticket Dynamic Fields' => 'Динамические поля заявки',

        # Perl Module: Kernel/System/ACL/DB/ACL.pm
        'Couldn\'t read ACL configuration file. Please make sure the file is valid.' =>
            'Не удалось прочитать конфигурационный файл ACL. Убедитесь, что вы выбрали верный файл.',

        # Perl Module: Kernel/System/Auth.pm
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Невозможно подключиться к системе, т.к. она находится на профилактике/системном обслуживании.',

        # Perl Module: Kernel/System/AuthSession.pm
        'Session limit reached! Please try again later.' => 'Срок жизни сессии прошел. Пожалуйста попробуйте еще раз.',
        'Session per user limit reached!' => 'Достигнут предел количества сессий на одного пользователя!',

        # Perl Module: Kernel/System/AuthSession/DB.pm
        'Session invalid. Please log in again.' => 'Ошибка сессии. Пожалуйста авторизуйтесь вновь.',
        'Session has timed out. Please log in again.' => 'Сеанс завершен. Попробуйте войти заново.',

        # Perl Module: Kernel/System/Calendar/Event/Transport/Email.pm
        'PGP sign only' => 'PGP только подпись',
        'PGP encrypt only' => 'PGP только шифрование',
        'SMIME sign only' => 'SMIME только подпись',
        'SMIME encrypt only' => 'SMIME только шифрование',
        'PGP and SMIME not enabled.' => 'PGP и SMIME не включены.',
        'Skip notification delivery' => 'Пропустить уведомление о доставке',
        'Send unsigned notification' => 'Отправить не подписанное уведомление',
        'Send unencrypted notification' => 'Отправить не зашифрованное уведомление',

        # Perl Module: Kernel/System/Calendar/Plugin/Ticket/Create.pm
        'On the date' => '',

        # Perl Module: Kernel/System/CalendarEvents.pm
        'on' => '',
        'of year' => '',
        'of month' => '',
        'all-day' => '',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Справочник параметров настройки',
        'This setting can not be changed.' => 'Этот параметр не может быть изменен.',
        'This setting is not active by default.' => 'Этот параметр по-умолчанию не активен.',
        'This setting can not be deactivated.' => 'Этот параметр не может быть отключен.',
        'This setting is not visible.' => 'Этот параметр не отображается.',
        'This setting can be overridden in the user preferences.' => 'Этот параметр может быть изменен в личных настройках.',
        'This setting can be overridden in the user preferences, but is not active by default.' =>
            'Этот параметр может быть изменен в личных настройках, но по умолчанию не активен.',

        # Perl Module: Kernel/System/CustomerUser.pm
        'Customer user "%s" already exists.' => 'Клиент "%s" уже существует.',

        # Perl Module: Kernel/System/CustomerUser/DB.pm
        'This email address is already in use for another customer user.' =>
            'Этот адрес электронной почты уже используется другим клиентом.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseDateTime.pm
        'before/after' => 'до/после',
        'between' => 'между',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => 'например Text или Te*t',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => 'Игнорировать это поле.',

        # Perl Module: Kernel/System/DynamicField/Driver/TextArea.pm
        'This field is required or' => 'Это поле обязательно.',
        'The field content is too long!' => 'Содержимое поля слишком длинное!',
        'Maximum size is %s characters.' => 'Максимальный размер %s символов',

        # Perl Module: Kernel/System/MailQueue.pm
        'Error while validating Message data.' => '',
        'Error while validating Sender email address.' => '',
        'Error while validating Recipient email address.' => '',

        # Perl Module: Kernel/System/Mention.pm
        'LastMention' => '',

        # Perl Module: Kernel/System/NotificationEvent.pm
        'Couldn\'t read Notification configuration file. Please make sure the file is valid.' =>
            'Не удалось прочитать конфигурационный файл Уведомлений. Убедитесь, что вы выбрали верный файл.',
        'Imported notification has body text with more than 4000 characters.' =>
            'Текст импортированного уведомления содержит более 4000 символов.',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'не установлено',
        'installed' => 'установлено',
        'Unable to parse repository index document.' => 'Не получилось разобрать формат индексного файла репозитория.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Нет пакетов для вашей версии фреймворка в этом репозитории, он содержит пакеты для других версий фреймворка.',
        'File is not installed!' => 'Файл не установлен!',
        'File is different!' => 'Файл отличается!',
        'Can\'t read file!' => 'Невозможно прочитать файл!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process.pm
        'The process "%s" and all of its data has been imported successfully.' =>
            'Процесс "%s" и все его данные был импортирован успешно.',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Неактивно',
        'FadeAway' => 'Исчезающий',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Сумма',
        'week' => 'неделя',
        'quarter' => 'квартал',
        'half-year' => 'полугодие',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Тип состояния',
        'Created Priority' => 'Созданный Приоритет',
        'Created State' => 'Созданное Состояние',
        'Create Time' => 'Время создания',
        'Pending until time' => 'Отложить до ',
        'Close Time' => 'Время закрытия',
        'Escalation' => 'Эскалация',
        'Escalation - First Response Time' => 'Эскалация - Время Первого Отклика',
        'Escalation - Update Time' => 'Эскалация - Время обновления',
        'Escalation - Solution Time' => 'Эскалация - Время решения',
        'Agent/Owner' => 'Агент (владелец)',
        'Created by Agent/Owner' => 'Создано агентом (владельцем)',
        'Assigned to Customer User Login' => 'Назначена на клиента (логин)',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Оценка по',
        'Ticket/Article Accounted Time' => 'Затраты рабочего времени на заявку или сообщение',
        'Ticket Create Time' => 'Время создания заявки',
        'Ticket Close Time' => 'Время закрытия заявки',
        'Accounted time by Agent' => 'Затраты рабочего времени по агентам',
        'Total Time' => 'Всего времени',
        'Ticket Average' => 'Среднее время рассмотрения заявки',
        'Ticket Min Time' => 'Мин. время рассмотрения заявки',
        'Ticket Max Time' => 'Макс. время рассмотрения заявки',
        'Number of Tickets' => 'Количество заявок',
        'Article Average' => 'Среднее время между сообщениями',
        'Article Min Time' => 'Мин. время между сообщениями',
        'Article Max Time' => 'Макс. время между сообщениями',
        'Number of Articles' => 'Количество сообщений',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'неограничено',
        'Attributes to be printed' => 'Атрибуты для печати',
        'Sort sequence' => 'Порядок сортировки',
        'State Historic' => 'Состояние истории',
        'State Type Historic' => 'Тип состояния истории',
        'Historic Time Range' => 'Период истории',
        'Number' => 'Число',
        'Last Changed' => 'Дата последнего изменеия',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Среднее время решения заявки',
        'Solution Min Time' => 'Минимальное время решения заявки',
        'Solution Max Time' => 'Максимальное время решения заявки',
        'Solution Average (affected by escalation configuration)' => 'Среднее время решения заявки (учитывая настройки эскалации)',
        'Solution Min Time (affected by escalation configuration)' => 'Минимальное время решения заявки (учитывая настройки эскалации)',
        'Solution Max Time (affected by escalation configuration)' => 'Максимальное время решения заявки (учитывая настройки эскалации)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'Среднее рабочее время решения заявки (учитывая настройки эскалации)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'Минимальное рабочее время решения заявки (учитывая настройки эскалации)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'Максимальное рабочее время решения заявки (учитывая настройки эскалации)',
        'First Response Average (affected by escalation configuration)' =>
            'Среднее значение первого ответа (зависит от конфигурации эскалации)',
        'First Response Min Time (affected by escalation configuration)' =>
            'Минимальное значение первого ответа (зависит от конфигурации эскалации)',
        'First Response Max Time (affected by escalation configuration)' =>
            'Максимальное значение первого ответа (зависит от конфигурации эскалации)',
        'First Response Working Time Average (affected by escalation configuration)' =>
            '',
        'First Response Min Working Time (affected by escalation configuration)' =>
            '',
        'First Response Max Working Time (affected by escalation configuration)' =>
            '',
        'Number of Tickets (affected by escalation configuration)' => 'Количество заявок (учитывая настройки эскалации)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Дни',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/OutdatedTables.pm
        'Outdated Tables' => 'Устаревшие таблицы',
        'Outdated tables were found in the database. These can be removed if empty.' =>
            'В базе данных обнаружены устаревшие таблицы. Они могут быть удалены, если пусты.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Наличие таблиц',
        'Internal Error: Could not open file.' => 'Внутренняя ошибка: невозможно открыть файл.',
        'Table Check' => 'Таблица проверки',
        'Internal Error: Could not read file.' => 'Внутренняя ошибка: невозможно прочитать файл.',
        'Tables found which are not present in the database.' => 'Найдены таблицы, которые не существуют в базе данных.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Размер базы данных',
        'Could not determine database size.' => 'Не удалось определить размер базы данных.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Версия СУБД',
        'Could not determine database version.' => 'Не удалось определить версию базы данных.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Кодировка клиентского соединения',
        'Setting character_set_client needs to be utf8mb4.' => '',
        'Server Database Charset' => 'Кодировка для сервера базы данных',
        'The setting character_set_database needs to be \'utf8mb4\'.' => '',
        'Table Charset' => 'Кодировка для таблицы',
        'There were non-system tables found which do not have \'utf8mb4\' as charset.' =>
            '',
        'There were tables found which do not have \'utf8mb4\' as charset.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Размер файла журнала InnoDB ',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Значение параметра innodb_log_file_size должно быть больше 256 МВ.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InvalidDefaultValues.pm
        'Invalid Default Values' => 'Неправильные значения по умолчанию',
        'Tables with invalid default values were found. In order to fix it automatically, please run: bin/znuny.Console.pl Maint::Database::Check --repair' =>
            'Найдены таблицы с неправильными значениями по умолчанию. Пожалуйста запустите bin/znuny.Console.pl Maint::Database::Check --repair, чтобы исправить это автоматически.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Максимальный размер запроса',
        'The setting \'max_allowed_packet\' must be higher than 64 MB.' =>
            'Значение параметра \'max_allowed_packet\' должно быть больше 64 МВ.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Метод доступа по умолчанию',
        'Table Storage Engine' => 'Метод доступа к таблицам',
        'Tables with a different storage engine than the default engine were found.' =>
            'Обнаружены таблицы с методом доступа отличающимся от установленного по умолчанию.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'Требуется MySQL 5.х или выше',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Параметр NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG должен быть установлен в al32utf8 (например,  GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Параметр NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT должен быть задан в виде \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'Параметр NLS_DATE_FORMAT для SQL Check',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/PrimaryKeySequencesAndTriggers.pm
        'Primary Key Sequences and Triggers' => '',
        'The following sequences and/or triggers with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Значение кодировки для клиента должно быть UNICODE or UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Значение кодировки для сервера должно быть UNICODE или UTF8. ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Формат даты',
        'Setting DateStyle needs to be ISO.' => 'Значение DateStyle должно быть  ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/PrimaryKeySequences.pm
        'Primary Key Sequences' => '',
        'The following sequences with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 9.2 or higher is required.' => 'PostgreSQL 9.2 или выше необходим.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionZnuny.pm
        'Operating System' => 'Операционная система',
        'Znuny Disk Partition' => 'Раздел диска для Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Использование дисковой памяти.',
        'The partition where Znuny is located is almost full.' => 'Раздел, в котором размещен Znuny уже заполнен.',
        'The partition where Znuny is located has no disk space problems.' =>
            'Раздел с Znuny не имеет проблем с дисковым пространством.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Использование разделов диска',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Распостранение',
        'Could not determine distribution.' => 'Не удалось определить дистрибутив ОС',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Версия ядра',
        'Could not determine kernel version.' => 'Не удалось определить версию ядра.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Нагрузка системы',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'Нагрузка системы должна быть не более количества процессоров в системе (например, загрузка в 8 или меньше в системе с 8 CPU будет правильной).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Модули Perl',
        'Not all required Perl modules are correctly installed.' => 'Не все требуемые модули Perl установлены корректно.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModulesAudit.pm
        'Perl Modules Audit' => 'Аудит модулей Perl',
        'CPAN::Audit reported that one or more installed Perl modules have known vulnerabilities. Please note that there might be false positives for distributions patching Perl modules without changing their version number.' =>
            '',
        'CPAN::Audit did not report any known vulnerabilities in the installed Perl modules.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlVersion.pm
        'Perl Version' => 'Версия Perl',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Свободное место для подкачки (%)',
        'No swap enabled.' => 'Подкачка не включена.',
        'Used Swap Space (MB)' => 'Использованное пространство для подкачки (MB)',
        'There should be more than 60% free swap space.' => 'Должно быть более 60% свободного места для подкачки.',
        'There should be no more than 200 MB swap space used.' => 'Нельзя использовать для подкачки более 200МВ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Веб-сервер',
        'Loaded Apache Modules' => 'Загруженные модули Apache',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'Модель MPM',
        'Znuny requires apache to be run with the \'prefork\' MPM model.' =>
            'Для Znuny необходимо, чтобы apache работал с опцией \'prefork\' MPM model.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Использование CGI Accelerator',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Необходимо использовать FastCGI или mod_perl для повышения производительности.',
        'mod_deflate Usage' => 'Использование mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Установите mod_deflate для повышения скорости GUI.',
        'mod_filter Usage' => 'Использование mod_filter ',
        'Please install mod_filter if mod_deflate is used.' => 'Установите  mod_filter, если используете mod_deflate.',
        'mod_headers Usage' => 'Использование mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Установите mod_headers для повышения скорости GUI.',
        'Apache::Reload Usage' => 'Использование Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload или Apache2::Reload должны использоваться как PerlModule и PerlInitHandler, чтобы предупредить рестарт веб-сервера при установке и обновлении модулей.',
        'Apache2::DBI Usage' => 'Использование Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Apache2::DBI должен использоваться для повышения производительности с предустановленными соединениями с БД.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Переменные окружения',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'Сбор данных для поддержки',
        'Support data could not be collected from the web server.' => 'Данные поддержки не могут быть собраны с веб-сервера.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Версия Веб-сервера',
        'Could not determine webserver version.' => 'Не удалось определить версию Веб - сервера.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticleSearchIndexStatus.pm
        'Znuny' => '',
        'Article Search Index Status' => 'Состояние Article Search Index',
        'Indexed Articles' => 'Индексированные сообщения',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticlesPerCommunicationChannel.pm
        'Articles Per Communication Channel' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLog.pm
        'Incoming communications' => 'Входящие сообщения',
        'Outgoing communications' => 'Исходящие сообщения',
        'Failed communications' => '',
        'Average processing time of communications (s)' => 'Среднее время сеанса (ов)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLogAccountStatus.pm
        'Communication Log Account Status (last 24 hours)' => '',
        'No connections found.' => 'Подключения не найдены.',
        'ok' => 'ok',
        'permanent connection errors' => 'постоянные ошибки связи',
        'intermittent connection errors' => 'Ошибки прерывания соединения',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ConfigSettings.pm
        'Config Settings' => 'Параметры конфигурации',
        'Could not determine value.' => 'Не удалось определить значение.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DaemonRunning.pm
        'Daemon' => 'Служба ',
        'Daemon is running.' => 'Демон работает.',
        'Daemon is not running.' => 'Служба не запущена.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DatabaseRecords.pm
        'Database Records' => 'Записи базы данных',
        'Ticket History Entries' => 'Записи истории заявки',
        'Articles' => 'Заметки/сообщения',
        'Attachments (DB, Without HTML)' => 'Вложения (DB, без HTML)',
        'Customers With At Least One Ticket' => 'Клиенты, имеющие хотя бы одну заявку',
        'Dynamic Field Values' => 'Значения динамического поля',
        'Invalid Dynamic Fields' => 'Неверные динамические поля',
        'Invalid Dynamic Field Values' => 'Неверные значения динамического поля',
        'GenericInterface Webservices' => 'Веб-сервисы GenericInterface ',
        'Process Tickets' => 'Процессные заявки',
        'Months Between First And Last Ticket' => 'Месяцев между первой и последней заявками',
        'Tickets Per Month (avg)' => 'Заявок в месяц (среднее)',
        'Open Tickets' => 'Открытые заявки',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Логин и пароль для SOAP по умолчанию',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Риск безопасности: вы используете установки по умолчанию для SOAP::User и SOAP::Password. Измените их.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultUser.pm
        'Default Admin Password' => 'Пароль администратора по умолчанию',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Риск безопасности: учетная запись агента root@localhost имеет пароль по умолчанию. Измените его или сделайте учетную запись недействительной.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/EmailQueue.pm
        'Email Sending Queue' => 'Очередь для отправки писем',
        'Emails queued for sending' => 'Очередь писем на отправку',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FQDN.pm
        'FQDN (domain name)' => 'FQDN (Имя домена)',
        'Please configure your FQDN setting.' => 'Пожалуйста укажите ваш FQDN.',
        'Domain Name' => 'Имя домена',
        'Your FQDN setting is invalid.' => 'Значение для FQDN неверно.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FileSystemWritable.pm
        'File System Writable' => 'Файловая система доступная для записи',
        'The file system on your Znuny partition is not writable.' => 'Файловая система в разделе Znuny недоступна для записи.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/LegacyConfigBackups.pm
        'Legacy Configuration Backups' => 'Резервные копии устаревшей конфигурации',
        'No legacy configuration backup files found.' => 'Нет устаревших файлов резервного копирования конфигурации.',
        'Legacy configuration backup files found in Kernel/Config/Backups folder, but they might still be required by some packages.' =>
            '',
        'Legacy configuration backup files are no longer needed for the installed packages, please remove them from Kernel/Config/Backups folder.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/MultipleJSFileLoad.pm
        'The following JavaScript files loaded multiple times:' => '',
        'Files' => '',
        'Views with multiple loaded JavaScript files' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageDeployment.pm
        'Package Installation Status' => 'Состояние установки пакетов',
        'Some packages have locally modified files.' => 'Некоторые пакеты содержат локально модифицированные файлы.',
        'Some packages are not correctly installed.' => 'Некоторые пакеты установлены некорректно.',
        'Package Framework Version Status' => '',
        'Some packages are not allowed for the current framework version.' =>
            'Некоторые пакеты не разрешены для текущей версии сервера.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageList.pm
        'Package List' => 'Список пакетов',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SessionConfigSettings.pm
        'Session Config Settings' => 'Настройка параметров сеансов',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SpoolMails.pm
        'Spooled Emails' => 'Буферизованные почтовые сообщения',
        'There are emails in var/spool that Znuny could not process.' => 'Имеются почтовые сообщения в var/spool, которые Znuny не смог обработать.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Ваш SystemID неверен. Он должен состоять только из цифр.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Тип заявки по умолчанию',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'Указанный тип заявки недействителен или ошибочен. Пожалуйста, измените настройки Ticket::Type::Default и укажите действительный тип заявки.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Модуль индексирования заявок',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'У вас в системе более 60000 заявок и необходимо использовать опцию StaticDB. Смотрите руководство администратора (настройки производительности) для более подробной информации.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Недействительные агенты с заблокированными заявками',
        'There are invalid users with locked tickets.' => 'Есть недействительные агенты с заблокированными заявками.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/OpenTickets.pm
        'You should not have more than 8,000 open tickets in your system.' =>
            'У вас не должно быть более 8000 открытых заявок в системе.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Модуль индексирования заявок для поиска',
        'The indexing process forces the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            'Процесс индексирования заставляет хранить исходный текст статьи в индексе поиска статьи без выполнения фильтров или применения стоп-слов. Это увеличит размер индекса поиска и, таким образом, может замедлить поиск в полнотекстовом режиме.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Потерянные записи в таблице ticket_lock_index ',
        'Table ticket_lock_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Таблица ticket_lock_index содержит потерянные записи. Выполните скрипт bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" для очистки индексов StaticDB.',
        'Orphaned Records In ticket_index Table' => 'Потерянные записи в таблице ticket_index',
        'Table ticket_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Таблица ticket_index содержит потерянные записи. Выполните скрипт bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" для очистки индексов StaticDB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/TimeSettings.pm
        'Time Settings' => 'Параметры времени',
        'Server time zone' => 'Временная зона сервера',
        'Znuny time zone' => 'Временная зона Znuny ',
        'Znuny time zone is not set.' => 'Временная зона Znuny не установлена.',
        'User default time zone' => 'Временная зона пользователя по умолчанию',
        'User default time zone is not set.' => 'Временная зона пользователя не установлена.',
        'Calendar time zone is not set.' => 'Временная зона календаря не установлена.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentSkinUsage.pm
        'UI - Agent Skin Usage' => 'UI - Использование скинов агента',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentThemeUsage.pm
        'UI - Agent Theme Usage' => 'UI - использование тем агента',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/SpecialStats.pm
        'UI - Special Statistics' => '',
        'Agents using custom main menu ordering' => 'Агенты, использующие пользовательские настройки главного меню',
        'Agents using favourites for the admin overview' => 'Агенты, использующие избранное для панели администрирования',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Version.pm
        'Znuny Version' => 'Версия Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/Znuny/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Подробности о конкурирующих ползователях',
        'Concurrent Users' => 'Конкурентая лицензия',

        # Perl Module: Kernel/System/SysConfig.pm
        'Setting %s does not exists!' => 'Параметр %s не существует!',
        'Setting %s is not locked to this user!' => 'Параметр %s не заблокирован этим агентом!',
        'Setting value is not valid!' => 'Значение параметра недействительно!',
        'Could not add modified setting!' => 'Не удалось добавить измененную настройку!',
        'Could not update modified setting!' => 'Не удалось обновить измененную настройку!',
        'Setting could not be unlocked!' => 'Настройка не может быть разблокирована!',
        'Missing key %s!' => 'Пропущен ключ %s!',
        'Invalid setting: %s' => 'Недопустимая настройка: %s',
        'Could not combine settings values into a perl hash.' => 'Не смог объединить значения настроек в perl хеш.',
        'Can not lock the deployment for UserID \'%s\'!' => 'Невозможно заблокировать развертывание для пользователя с ID \'%s\'!',
        'All Settings' => 'Все настройки',

        # Perl Module: Kernel/System/SysConfig/BaseValueType.pm
        'Default' => 'По умолчанию',
        'Value is not correct! Please, consider updating this field.' => 'Значение неверно! Пожалуйста, подумайте об обновлении этого поля.',
        'Value doesn\'t satisfy regex (%s).' => 'Значение не удовлетворяет регулярному выражению (%s).',

        # Perl Module: Kernel/System/SysConfig/ValueType/Checkbox.pm
        'Enabled' => 'Включено',
        'Disabled' => 'Отключено',

        # Perl Module: Kernel/System/SysConfig/ValueType/Date.pm
        'System was not able to calculate user Date in OTRSTimeZone!' => 'Системе не удалось вычислить дату пользователя в OTRSTimeZone!',

        # Perl Module: Kernel/System/SysConfig/ValueType/DateTime.pm
        'System was not able to calculate user DateTime in OTRSTimeZone!' =>
            'Системе не удалось вычислить DateTime пользователя в OTRSTimeZone!',

        # Perl Module: Kernel/System/SysConfig/ValueType/FrontendNavigation.pm
        'Value is not correct! Please, consider updating this module.' =>
            'Значение неверно! Пожалуйста, подумайте об обновлении этого модуля.',

        # Perl Module: Kernel/System/SysConfig/ValueType/VacationDays.pm
        'Value is not correct! Please, consider updating this setting.' =>
            'Значение неверно! Пожалуйста, подумайте об обновлении этой настройки.',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Сбросить время разблокировки.',

        # Perl Module: Kernel/System/Ticket/Article/Backend/Chat.pm
        'Chat Participant' => 'Участник чата',
        'Chat Message Text' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Ошибка входа! Указано неправильное имя или пароль.',
        'Authentication succeeded, but no user data record is found in the database. Please contact the administrator.' =>
            'Аутентификация успешна, однако ни одной записи для клиента не обнаружено в используемой/ых базе клиентов. Обратитесь к вашему администратору.',
        'Can`t remove SessionID.' => 'Невозможно удалить SessionID.',
        'Logout successful.' => 'Успешный выход.',
        'Feature not active!' => 'Функция не активирована!',
        'Sent password reset instructions. Please check your email.' => 'Отправлены инструкции по сбросу пароля. Проверьте свою почту.',
        'Invalid Token!' => 'Неверный ключ (token)!',
        'Sent new password to %s. Please check your email.' => 'Новый пароль выслан на %s. Проверьте свою почту.',
        'Error: invalid session.' => 'Ошибка: недействительный сеанс.',
        'No Permission to use this frontend module!' => 'Нет прав на использование этого модуля!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            'Аутентификация успешна, однако ни одной записи для клиента не обнаружено в используемой/ых базе клиентов. Обратитесь к вашему администратору.',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'Сброс пароля не выполнен. Пожалуйста, свяжитесь с администратором.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Такой адрес электронной почты уже существует. Пожалуйста, войдите или сбросьте свой пароль.',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Этот адрес почты не разрешен для регистрации. Обратитесь к персоналу поддержки.',
        'Added via Customer Panel (%s)' => 'Добавлено через Customer Panel/Панель клиента (%s)',
        'Customer user can\'t be added!' => 'Невозможно добавить клиента!',
        'Can\'t send account info!' => 'Не удается отправить информацию аккаунта!',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Новая учетная запись создана. Данные для входа направлены на %s. Проверьте свою почту.',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'Action "%s" not found!' => 'Действие  "%s" не найдено!',

        # XML Definition: Kernel/Config/Files/XML/Calendar.xml
        'Frontend module registration for the public interface.' => 'Frontend module registration для public/публичного/общедоступного интерфейса.',
        'Frontend module registration for the agent interface.' => 'Frontend module registration для интерфейса агента.',
        'Loader module registration for the agent interface.' => '',
        'Main menu item registration.' => 'Регистрация пункта главного меню.',
        'Admin area navigation for the agent interface.' => 'Область навигации для администратора в интерфейсе агента.',
        'Maximum number of active calendars in overview screens. Please note that large number of active calendars can have a performance impact on your server by making too much simultaneous calls.' =>
            'Максимальное количество активных календарей на экранах обзора. Помните, что большое число активных календарей может оказать влияние на производительность сервера, делая слишком много одновременных вызовов.',
        'List of colors in hexadecimal RGB which will be available for selection during calendar creation. Make sure the colors are dark enough so white text can be overlayed on them.' =>
            'Список цветов в шестнадцатеричном RGB, доступных для выбора при создании календаря. Убедитесь при выборе, что цвет фона достаточно темный, чтобы белый текст был на нем виден/читаем.',
        'Defines available groups for the appointment calendar screen.' =>
            '',
        'Defines the ticket plugin for calendar appointments.' => 'Задает плагин обработки заявок для мероприятий календаря.',
        'Links appointments and tickets with a "Normal" type link.' => 'Связывает мероприятия с заявками связью типа "Normal/Обычная".',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'Задает Действия/Actions когда кнопка настройки доступна в связанном виджете (LinkObject::ViewMode = "complex"). Обратите внимание, что эти Действия/Actions должны иметь зарегистрированные JS или CSS файлы: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.',
        'Define which columns are shown in the linked appointment widget (LinkObject::ViewMode = "complex"). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Задайте, какие колонки отображать в связанном виджете мероприятий (LinkObject::ViewMode = "complex"). Возможные значения: 0 = Отключено, 1 = Да, 2 = Включена по умолчанию.',
        'Znuny doesn\'t support recurring Appointments without end date or number of iterations. During import process, it might happen that ICS file contains such Appointments. Instead, system creates all Appointments in the past, plus Appointments for the next N months (120 months/10 years by default).' =>
            '',
        'Defines the ticket appointment type backend for ticket escalation time.' =>
            'Задает модуль обработки для мероприятий заявки по ticket escalation time.',
        'Defines the ticket appointment type backend for ticket pending time.' =>
            'Задает модуль обработки для мероприятий заявки по ticket pending time.',
        'Defines the ticket appointment type backend for ticket dynamic field date time.' =>
            'Задает модуль обработки для мероприятий заявки для динамических полей типа дата/время / date time.',
        'Defines the list of params that can be passed to ticket search function.' =>
            'Задает перечень атрибутов, которые могут использоваться при поиске заявок.',
        'Defines the event object types that will be handled via AdminAppointmentNotificationEvent.' =>
            'Задает типы событий, которые будут управляться  с помощью AdminAppointmentNotificationEvent.',
        'List of all calendar events to be displayed in the GUI.' => 'Список всех событий календаря, отображаемых в интерфейсе.',
        'List of all appointment events to be displayed in the GUI.' => 'Список всех событий, для мероприятий, отображаемых в интерфейсе.',
        'Appointment calendar event module that prepares notification entries for appointments.' =>
            'Модуль управления событиями Календаря мероприятий, который подготавливает уведомления для мероприятий.',
        'Uses richtext for viewing and editing ticket notification.' => 'Использует форматированный текст для просмотра и редактирования уведомлений о заявках.',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Задает ширину окна текстового редактора на этом экране. Введите число (пикселов) или значение в процентах.',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Задает высоту окна текстового редактора на этом экране. Введите число пикселей и значение в процентах.',
        'Transport selection for appointment notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Задает количество символов в строке, используемое при просмотре сообщений в HTML формате в TemplateGenerator/Генераторе_шаблонов для EventNotifications/Уведомлений_о_событиях.',
        'Defines all the parameters for this notification transport.' => 'Задает все параметры для этого типа отправки уведомлений.',
        'Appointment calendar event module that updates the ticket with data from ticket appointment.' =>
            'Модуль управления событиями Календаря мероприятий, который обновляет заявки с данными из мероприятий заявки.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Определяет параметры Дайджеста. "Limit" определяет число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" указывает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" определяет время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Shows a link in the menu for creating a calendar appointment linked to the ticket directly from the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Отображает ссылку/пункт меню для создания мероприятия календаря, связанного с заявкой непосредственно из подробного просмотра заявки/TicketZoom в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Defines an icon with link to the google map page of the current location in appointment edit screen.' =>
            'Задает иконку со ссылкой на страницу текущего местоположения в Google Map на экране редактирования мероприятий.',
        'Triggers add or update of automatic calendar appointments based on certain ticket times.' =>
            'Переключает добавить или изменить автоматическое создание мероприятий календаря, основанное на определенных временНых параметрах заявки',

        # XML Definition: Kernel/Config/Files/XML/Daemon.xml
        'Defines the module to display a notification in the agent interface if the Znuny Daemon is not running.' =>
            'Задает модуль который показывает уведомление в интерфейсе агента, если не запущен Znuny Daemon.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Список CSS файлов всегда загружаемых в интерфейсе агента.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Список JS файлов всегда загружаемых в интерфейсе агента.',
        'Type of daemon log rotation to use: Choose \'OTRS\' to let Znuny system to handle the file rotation, or choose \'External\' to use a 3rd party rotation mechanism (i.e. logrotate). Note: External rotation mechanism requires its own and independent configuration.' =>
            'Какой тип обновления журнала залогированных событий использовать: Выберите \'OTRS\', чтобы позволить Znuny системе самой заботиться о ротации логов, или выберите \'External\', чтобы использовать сторонний механизм ротации (например logrotate). Примечание: сторонний механизм ротации логов требует собственной независимой настройки.',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if &lt;$OTRSHome&gt;/var/run/ can not be used.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => 'Задает количество дней хранения daemon log files.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Если включено, демон перенаправит стандартный вывод в лог-файл.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Если включено, демон перенаправит стандартный поток сообщений об ошибках в лог-файл.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler cron task manager.' =>
            '',
        'The daemon registration for the scheduler future task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The daemon registration for the system configuration deployment sync manager.' =>
            '',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Задает максимальное количество задач, выполняемых одновременно.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Задает почтовые адреса для получения уведомляющих сообщений от Планировщика.',
        'Defines the maximum number of affected tickets per job.' => 'Определяет максимальное количество заявок, подвергаемых обработке в задании.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Задает "паузу", в микросекундах, между обработкой заявок заданием.',
        'Delete expired cache from core modules.' => 'Удалить просроченный кэш модулей ядра.',
        'Delete expired upload cache hourly.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Удалять просроченный кэш загрузчика еженедельно (утром в воскресенье).',
        'Fetch emails via fetchmail.' => 'Получение писем через fetchmail.',
        'Fetch emails via fetchmail (using SSL).' => 'Получение писем через fetchmail (используя SSL).',
        'Generate dashboard statistics.' => 'Создать отчет для дайджеста.',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Триггеры событий и оповещения для эскалации заявки.',
        'Process pending tickets.' => 'Обработать отложенные заявки.',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Fetch incoming emails from configured mail accounts.' => 'Получение входящих писем от настроенных учетных записей.',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Перестраивает индексы заявок для AgentTicketQueue.',
        'Delete expired sessions.' => 'Удалить просроченные сеансы.',
        'Unlock tickets that are past their unlock timeout.' => 'Разблокировать заявки с истекшим сроком блокировки.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be enabled in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            'Обновить существующие SMIME сертификаты из backend клиента. Примечание: SMIME и SMIME::FetchFromCustomer должны быть доступными в SysConfig и backend клиента должен быть настроен получать UserSMIMECertificate аттрибут.',
        'Checks for articles that needs to be updated in the article search index.' =>
            '',
        'Checks for queued outgoing emails to be sent.' => 'Проверить наличие исходящей почты в очереди отправки.',
        'Checks for communication log entries to be deleted.' => 'Проверить логи сеансов связи на наличие записей для удаления.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Выполняет пользовательскую команду или модуль. Внимание: если используется модуль, требуется указание функции.',
        'Run file based generic agent jobs (Note: module name needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            'Запустить задачи планировщика на основе файла (примечание: имя модуля должно быть указано через параметр -configuration-module, например, "Kernel::System::GenericAgent").',
        'Collect support data for asynchronous plug-in modules.' => 'Собрать данные для поддержки асинхронно подключаемых плагинов.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Задает время по умолчанию, в секундах (от текущего времени) для перезапуска невыполненного задания. ',
        'Removes old system configuration deployments (Sunday mornings).' =>
            '',
        'Removes old ticket number counters (each 10 minutes).' => '',
        'Removes old generic interface debug log entries created before the specified amount of days.' =>
            '',
        'Delete expired ticket draft entries.' => '',

        # XML Definition: Kernel/Config/Files/XML/Framework.xml
        'Disables the web installer (http://yourhost.example.com/znuny/installer.pl), to prevent the system from being hijacked. If not enabled, the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If enabled, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => 'Включает или выключает режим отладки через интерфейс системы.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            'Если включено, то в случае появления каких-либо ошибок AJAX, предоставляет во фронтенде расширенную отладочную информацию.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Включает или отключает кэширование для шаблонов. ВНИМАНИЕ: НЕ отключайте кэширование шаблонов в рабочей системе, так как это приведет к значительному снижению производительности! Этот параметр следует отключать только для целей отладки!',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Устанавливает уровень доступа администратора к SysConfig. В зависисмости от установленного уровня, некоторые параметры конфигурации не будут показываться. Чем выше уровень (Beginner - наивысший, всего их три - Expert, Advanced, Beginner), тем меньше вероятность внесения в конфигурацию изменений, которые могут привести ее в неработоспособное состояние.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Управляет возможностью для администратора загружать сохраненную конфигурацию системы в SysConfig.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Имя приложения, показываемое в веб - интерфейсе, вкладке и заголовке браузера.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of Znuny).' =>
            'Задает идентификатор системы. Каждый номер заявки и http-сеанса содержит его. Это дает уверенность в том, что заявки только вашей системы будут обработаны как ответы (дополнения) (может быть полезно при связи между двумя установками Znuny).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Задает полный доменный адрес системы. ОН используется в качестве тэга OTRS_CONFIG_FQDN при написании текстов сообщений для ссылки на заявки. ',
        'Defines the fully qualified domain name for external IDs generation (i.e. Message-ID, ContentID).' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the timeout (in seconds, minimum is 20 seconds) for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Задает тип протокола, используемого веб-сервером для системы. Если протокол https используется вместо простого http, он должен быть указан здесь. Этот параметр не влияет на настройки сервера/ов и не изменяет метода доступа к системе, и если указан неверно, не может закрыть возможность подключения к ней. Это значение используется лишь как переменная OTRS_CONFIG_HttpType используемая как тэг при построении сообщений/уведомлений, для построения ссылки на заявку.',
        'Whether to force redirect all requests from http to https protocol. Please check that your web server is configured correctly for https protocol before enable this option.' =>
            'Перенаправить все запросы с http на https протокол. Пожалуйста проверьте, что https протокол настроен корректно на Вашем web сервере, прежде чем включать эту опцию.',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Задает префикс к имени папки скриптов на сервере, как установлено в веб-сервере. Этот параметр используется как переменная OTRS_CONFIG_ScriptAlias для применения в сообщениях для построения ссылки на заявки.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Задает почтовый адрес системного администратора. Он будет отображаться в сообщениях об ошибках.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Название компании, включаемое в исходящих письмах как X-Header.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Задает язык интерфейса по умолчанию. Все доступные значения определяются наличием соответствующих языковых файлов в системе (см. следующий параметр).',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Задает все языки доступные в приложении. Указывайте здесь только английские названия языков.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Задает все языки доступные в приложении. Указывайте здесь только native/родные? названия языков.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.znuny.org/manual/developer/.' =>
            'Задает имя темы (HTML theme - имя папки для альтернативных модулей), которая будет использоваться в интерфейсах агентов и клиентов. По желанию, вы можете добавить свою собственную тему. Подробности в руководстве администратора https://doc.znuny.org/manual/developer/.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Можно задать разные схемы оформления, напрмер, чтобы отличать агентов и клиентов, на основе принадлежности к доменам. Используя регулярные выражения (regex), вы можете задать пары Ключ/Содержание, соответствующие доменам. Значение Ключа должно соответствовать домену, а значение Содержания - имя схемы (skin) в системе. Смотрите пример для правильного построения регулярного выражения.',
        'The headline shown in the customer interface.' => 'Заголовок, отображаемый в интерфейсе клиента.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Логотип, отображаемый в заголовке экрана в интерфейсе клиента. URL ссылка может быть относительным URL на каталог с файлами (skin) или быть полным URL на внешний веб-сервер.',
        'The shortcut icon for the customer interface.' => 'Иконка ярлыка интерфейса клиента.',
        'The shortcut icon for the customer interface for the skin "default".' =>
            'Иконка ярлыка для интерфейса клиента с внешним видом (skin) "по умолчанию".',
        'The Apple touch icon for the customer interface.' => 'Apple touch иконка для интерфейса клиента.',
        'The Apple touch icon for the customer interface for skin "default".' =>
            'Apple touch иконка для интерфейса клиента с внешним видом (skin) "по умолчанию".',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Логотип, отображаемый в заголовке экрана в интерфейсе агента. URL ссылка может быть относительным URL на каталог с файлами (skin) или быть полным URL на внешний веб-сервер.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Логотип, отображаемый в заголовке экрана в интерфейсе агента для окраса "default". Смотрите описание "AgentLogo" для дальгейших пояснений.',
        'The logo shown on top of the login box of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The shortcut icon for the agent interface.' => 'Иконка ярлыка для интерфейса агента.',
        'The shortcut icon for the agent interface fot the skin "default".' =>
            'Иконка ярлыка для интерфейса агента с внешним видом (skin) "по умолчанию".',
        'The Apple touch icon for the agent interface.' => 'Apple touch иконка для интерфейса агента.',
        'The Apple touch icon for the agent interface for the skin "default".' =>
            'Apple touch иконка для интерфейса агента с внешним видом (skin) "по умолчанию".',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Задает путь в виде URL к icons, CSS и Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Задает путь в виде URL к файлам иконок навигационной панели.',
        'Defines the URL CSS path.' => 'Задает путь к URL CSS.',
        'Defines the URL java script path.' => 'Задает путь в виде URL к java скриптам.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Использует форматированный текст для просмотра и редактирования: сообщений, приветствий, подписей, стандартных шаблонов, автоответов и уведомлений.',
        'Defines the URL rich text editor path.' => 'Задает путь в виде URL к rich text editor',
        'Defines the default CSS used in rich text editors.' => 'Задает стандартные CSS, используемые в текстовом редакторе (rich text editor).',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Включает расширенные средства редактирования.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'Включает расширенные средства редактирования (использование таблиц, замены, подстрочный индекс, надстрочный индекс, вставить из слова и т. д.) в интерфейсе клиента.',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Задает ширину окна текстового редактора. Введите число (пикселов) или значение в процентах.',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Задает высоту окна текстового редактора. Введите число пикселей и значение в процентах.',
        'Defines the selectable font sizes in the rich text editor.' => '',
        'Defines the selectable fonts in the rich text editor.' => '',
        'Defines the selectable format tags in the rich text editor.' => '',
        'Defines additional plugins for use in the rich text editor.' => '',
        'Defines extra content that is allowed for use in the rich text editor.' =>
            '',
        'Global settings for all popup profiles.' => '',
        'Disable autocomplete in the login screen.' => '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow Znuny to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Отключить HTTP-заголовок "X-Frame-Options: SAMEORIGIN", чтобы разрешить встраивать Znuny в IFrame на других сайтах. Отключение этого заголовка может вызвать проблемы с безопасностью! Отключайте только если уверены в своих действиях!',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Отключите HTTP заголовок "Content-Security-Policy", чтобы разрешить загрузку содержимого внешних скриптов. Отключение этого HTTP заголовка снижает уровень безопасности! Отключайте только, если вы точно знаете, что делаете!',
        'Automated line break in text messages after x number of chars.' =>
            'Автоматический перевод строки в тексте сообщения после х символов.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'Задает количество строк отображаемых в текстовых сообщениях (например, строк заявки в QueueZoom).',
        'Limits the number of options for modernized selection fields. If this limit will be exceeded, the selection field will for performance reasons be shown as non-modernized.' =>
            '',
        'Turns on drag and drop for the main navigation.' => 'Включает возможность "drag and drop" для основной навигации.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Задает способ ввода даты (выбором (option) или прямым вводом в поле (input).',
        'Defines the available steps in time selections. Select "Minute" to be able to select all minutes of one hour from 1-59. Select "30 Minutes" to only make full and half hours available.' =>
            'Определяет доступные шаги при выборе временнОго интервала. Выберите "Минуты", чтобы выбрать все минуты одного часа от 1 до 59. Выберите "30 минут", чтобы сделать доступными только полные часы и полчаса.',
        'Shows time in long format (days, hours, minutes), if enabled; or in short format (days, hours), if not enabled.' =>
            '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Выбор варианта показа вложения к заявке - в окне браузера или как файл для загрузки(вложение).',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Включает проверку MX record почтовых адресов клиента до отправки почты или приема почтовой или телефонной заявки.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Задать адрес выделенного DNS сервера , если необходимо, для проверки "CheckMXRecord".',
        'Sets the timeout (in seconds) for DNS resolver queries.' => '',
        'Makes the application check the syntax of email addresses.' => 'Включает проверку синтаксиса адреса электронной почты.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Задать регулярное выражение для исключения некоторых адресов из проверки правописания (если "CheckEmailAddresses" установлено в "Да"). Введите regex в это поле для почтовых адресов, которые синтаксически неверны, но необходимы в системе (напр. "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Задать регулярное выражение для  для фильтрации всех почтовых адресов, которые не будут использоваться в системе.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Задает способ отображения связанных объектов в подробных просмотрах.',
        'Determines if a button to delete a link should be displayed next to each link in each zoom mask.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Задает тип связи \'Normal\'. Если исходное имя и планируемое имя содержат одинаковое значение, то результирующая связь - ненаправленная; иначе - направленная.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Задает тип связи \'ParentChild\'. Если исходное имя и планируемое имя содержат одинаковое значение, то результирующая связь - ненаправленная; иначе - направленная.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Задает группы типов связи. Типы связи одинаковых групп отменяют друг друга. Например: Если заявка А связана связью типа \'Normal\'с заявкой Б, то эти заявки не могут быть дополнительно связаны связью типа \'ParentChild\'.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Задает тип журнала для системы. "File" пишет все сообщения в указанный logfile, "SysLog" использует syslog daemon системы, т.е. syslogd.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Если "SysLog" было выбрано для LogModule, параметры записи в журнал можут быть заданы.',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Если "SysLog" было выбрано для LogModule, набор символов (charset) для запси в журнал может быть задан.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Если "file" было выбрано для LogModule, файл должен быть задан. Если файл не существует, он будет создан системой.',
        'Adds a suffix with the actual year and month to the Znuny log file. A logfile for every month will be created.' =>
            'Добавляет суффикс с текущим годом и месяцем к имени лог файла Znuny. Лог-файл создается для каждого месяца.',
        'Set the minimum log level. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages. The order of log levels is: \'debug\', \'info\', \'notice\' and \'error\'.' =>
            '',
        'Defines the module to send emails. "DoNotSendEmail" doesn\'t send emails at all. Any of the "SMTP" mechanisms use a specified (external) mailserver. "Sendmail" directly uses the sendmail binary of your operating system. "Test" doesn\'t send emails, but writes them to $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/ for testing purposes.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Если любой из "SMTP" механизмов был выбран для SendmailModule, mailhost, который отправляет почту, должен быть задан',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Если любой из "SMTP" механизмов был выбран для SendmailModule, порт, на котором, почтовый серевер проверяет входящие соединения, должен быть задан.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Если любой из "SMTP" механизмов был выбран для SendmailModule, и аутентификация на почтовом серевере необходима, username должно быть задано.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Если любой из "SMTP" механизмов был выбран для SendmailModule, и аутентификация на почтовом серевере необходима, пароль должен быть задан.',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Отсылать всю исходящую почту через bcc на заданные адреса. Используйте эту опцию только резервного копирования.',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Устанавливает кодировку исходящей почты (7bit|8bit|quoted-printable|base64).',
        'Defines default headers for outgoing emails.' => 'Задает заголовки по умолчанию для исходящих писем.',
        'Registers a log module, that can be used to log communication related information.' =>
            '',
        'Defines the number of hours a successful communication will be stored.' =>
            '',
        'Defines the number of hours a communication will be stored, whichever its status.' =>
            '',
        'MailQueue configuration settings.' => 'Настройки конфигурации MailQueue.',
        'Define which avatar engine should be used for the agent avatar on the header and the sender images in AgentTicketZoom. If \'None\' is selected, initials will be displayed instead. Please note that selecting anything other than \'None\' will transfer the encrypted email address of the particular user to an external service.' =>
            'Определите, какой движок аватара следует использовать для аватара агента в заголовке и изображениях отправителя в AgentTicketZoom. Если выбрано \'Нет\', вместо него будут отображаться инициалы. Обратите внимание, что выбор чего-либо другого, кроме \'Нет\', переносит зашифрованный адрес электронной почты конкретного пользователя на внешнюю службу.',
        'Define which avatar default image should be used for the current agent if no gravatar is assigned to the mail address of the agent. Check https://gravatar.com/site/implement/images/ for further information.' =>
            '',
        'Define which avatar default image should be used for the article view if no gravatar is assigned to the mail address. Check https://gravatar.com/site/implement/images/ for further information.' =>
            '',
        'Defines an alternate URL, where the login link refers to.' => 'Задает альтернативную URL, для страницы входа.',
        'Defines an alternate URL, where the logout link refers to.' => 'Задает альтернативную URL, для страницы выхода.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Задать полезные модули для загрузки пользовательских опций или отображения новостей',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Задает ключ, который проверяется модулем Kernel::Modules::AgentInfo. Если этот ключ личных настроек верен, сообщение принимается системой.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Файл отображаемый модулем Kernel::Modules::AgentInfo, если он помещен в Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.',
        'Defines the module to generate code for periodic page reloads.' =>
            'Задает модуль, генерирующий код для периодической перезагрузки страниц.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Задает модуль который показывает уведомление в интерфейсе агента, что вы зашли в систему как администратор (в обычном режиме вы не должны работать под этой учетной записью).',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Задает модуль который показывает всех подключившихся агентов в интерфейсе агента.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'Задает модуль который показывает всех подключившихся клиентов в интерфейсе агента.',
        'Defines the module to display a notification in the agent interface, if there are modified sysconfig settings that are not deployed yet.' =>
            'Задает модуль который показывает уведомление в интерфейсе агента, если имеются измененные параметры в конфигурации системы и они не применены.',
        'Defines the module to display a notification in the agent interface, if there are invalid sysconfig settings deployed.' =>
            'Задает модуль, который показывает уведомление в интерфейсе агента, если имеются недействительные параметры в конфигурации системы.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Задает модуль, который показывает уведомление в интерфейсе агента, если агент зашел в систему при включенном режиме "Вне офиса".',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Задает модуль, который показывает уведомление в интерфейсе агента, если агент зашел в систему, когда она в состоянии Профилактика/Обслуживание системы.',
        'Defines the module to display a notification in the agent interface if the system configuration is out of sync.' =>
            'Задает модуль который показывает уведомление в интерфейсе агента, если конфигурация системы не актуализирована.',
        'Defines the module to display a notification in the agent interface, if the agent has not yet selected a time zone.' =>
            'Задает модуль, который показывает уведомление в интерфейсе агента, если агент не выбрал временнУю зону.',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Задает модуль который показывает основные уведомления в интерфейсе агента. Либо "Text", если настроен, либо содержимое "File" будет отображаться.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Задает модуль для сохранения данных сеансов. "DB" - сохраняются в БД системы. "FS" - быстрее.',
        'Defines the name of the session key. E.g. Session, SessionID or Znuny.' =>
            'Задает имя ключа для сеанса. Т.е. Session, SessionID или Znuny.',
        'Defines the name of the key for customer sessions.' => 'Задает имя ключа для сеансов клиента.',
        'Turns on the remote ip address check. It should not be enabled if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Включить проверку удаленного IP-адреса. Она не должна быть включена, если соединение, например, устанавливается через проски или используется модемное соединение, потому что удаленный IP-адрес в основном будет отличаться в запросах.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Удаляет сеанс, если его id используется с некорректным remote IP address.',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Задает максимально возможное время (в секундах) для сессии (session id).',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            'Установить время отсутствия активности (в секундах), которое должно пройти, прежде чем сессия будет закрыта и пользователь будет отключен',
        'Deletes requested sessions if they have timed out.' => 'Удаляет запрошенные сеансы с истекшим сроком.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Позволяет использовать html cookies для управления сеансами. Если html cookies выключены, или в браузере клиента выключено использование html cookies, в этом случае система работает как обычно и добавляет session id к ссылке.',
        'Stores cookies after the browser has been closed.' => 'Сохраняет cookies после закрытия браузера.',
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
            'Если "DB" выбрано для SessionModule, папка в БД, где будут храниться сеансы должна быть указана.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Если "DB" выбрано для SessionModule, таблица в БД, где будут храниться сеансы должна быть указана.',
        'Defines the period of time (in minutes) before agent is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            '',
        'Defines the period of time (in minutes) before customer is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            'Задает интервал времени (в минутах), после которого клиент будет помечен как "отсутствующий", потому как неактивен (например в "Залогированные Пользователи" виджете или в чате).',
        'This setting is deprecated. Set OTRSTimeZone instead.' => 'Этот параметр устарел. Вместо него используйте OTRSTimeZone.',
        'Sets the time zone being used internally by Znuny to e. g. store dates and times in the database. WARNING: This setting must not be changed once set and tickets or any other data containing date/time have been created.' =>
            '',
        'Sets the time zone that will be assigned to newly created users and will be used for users that haven\'t yet set a time zone. This is the time zone being used as default to convert date and time between the Znuny time zone and the user\'s time zone.' =>
            '',
        'If enabled, users that haven\'t selected a time zone yet will be notified to do so. Note: Notification will not be shown if (1) user has not yet selected a time zone and (2) OTRSTimeZone and UserDefaultTimeZone do match and (3) are not set to UTC.' =>
            'Если включено, пользователи, еще не выбравшие временную зону, будут уведомлены сделать это. Примечание: Уведомление будет показано если (1) пользователь еще не выбрал временную зону и (2) OTRSTimeZone совпадает с UserDefaultTimeZone и (3) они не установлены в UTC.',
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Define the start day of the week for the date picker.' => 'Укажите первый день недели для использовании при выборе даты',
        'Adds the permanent vacation days.' => 'Добавляет постоянные дни отпуска.',
        'Adds the one time vacation days.' => 'Добавляет одноразовые дни отпуска.',
        'Defines the hours and week days to count the working time.' => 'Задает часы и дни недели для подсчета рабочего времени',
        'Defines the name of the indicated calendar.' => 'Задает имя выбранного календаря.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'Задает временную зону выбранного календаря, который позднее может быть назначен определенной очереди.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Укажите первый день недели для использования при выборе даты для выбранного календаря.',
        'Adds the permanent vacation days for the indicated calendar.' =>
            'Добавляет постоянные дни отпуска для указанного календаря.',
        'Adds the one time vacation days for the indicated calendar.' => 'Добавляет одноразовые дни отпуска для указанного календаря.',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Задает часы и дни недели в выбранном календаре для подсчета рабочего времени',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your Znuny instance to stop working (probably any mask which takes input from the user).' =>
            'Задает максимальный размер в байтах для файлов загружаемых через браузер. Предупреждение: Не задавайте слишком малое значение этому параметру во избежание остановки работы Znuny',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Выбирает способ управления загрузкой через веб-интерфейс. "DB" - сохраняет загружаемые файлы в БД, "FS" использует файловую систему.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Задает текст, который записывается в лог для регистрации обращения к скриптам CGI.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Задает фильтр для текста сообщений для подсветки URLs.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Включить функцию восстановления пароля для агентов в интерфейсе агента',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Показывает сообщение дня на экране входа агента.',
        'Runs the system in "Demo" mode. If enabled, agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Дает возможность администратору войти в систему как обычному агенту, через панель управления агентами.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Дает возможность администратору войти в систему как клиенту, через панель управления учетными записями клиентов.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'Задает группу с rw правами для агента, члены которой могут использовать возможность "SwitchToCustomer" (войти как клиент).',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Задает timeout (в сек) для http/ftp downloads.',
        'Defines the connections for http/ftp, via a proxy.' => 'Задает параметры для соединения для http/ftp, через proxy.',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Выключает проверку SSL-сертификата, например, при использовании прозрачного HTTPS-прокси. Используйте на свой страх и риск!',
        'Enables file upload in the package manager frontend.' => 'Включает возможность загрузки дополнительных пакетов (расширений) в Управлении пакетами.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Задает расположение для получения списка online репозиториев для дополнительных пакетов. Будет использоваться первый доступный.',
        'List of online package repositories.' => '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Задает регулярное выражение для IP для доступа к локальному репозиторию. его надо указать, чтбы иметь доступ к вашему локальному репозиторию и package::RepositoryList требуется для удаленного хоста.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Задает timeout (в сек) для загрузки пакетов. Перекрывает "WebUserAgent::Timeout".',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Получает пакеты через proxy. Перекрывает параметр "WebUserAgent::Proxy".',
        'If this setting is enabled, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'List of all Package events to be displayed in the GUI.' => 'Список всех событий для Package, отображаемых в интерфейсе.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Список всех событий для DynamicField, отображаемых в интерфейсе.',
        'List of all LinkObject events to be displayed in the GUI.' => '',
        'DynamicField object registration.' => 'Регистрация объектов  для динамических полей (поле заявки или сообщения/заметки).',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Задает username для доступа к обработчику SOAP (bin/cgi-bin/rpc.pl).',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Задает пароль доступа к обработчику SOAP (bin/cgi-bin/rpc.pl).',
        'Enable keep-alive connection header for SOAP responses.' => 'Включить заголовок Keep-Alive для SOAP-ответов.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png).' =>
            '',
        'Size of the logo in the page header.' => '',
        'Defines the standard size of PDF pages.' => 'Задает стандартный размер страницы при выводе в PDF',
        'Defines the maximum number of pages per PDF file.' => 'Задает максимальное количество страниц для PDF файла',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Задает путь и файл TTF для proportional font для PDF докуметов.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Задает путь и файл TTF для bold proportional font для PDF докуметов.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Задает путь и файл TTF для  italic proportional font для PDF докуметов.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Задает путь и файл TTF для bold italic proportional font для PDF докуметов.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Задает путь и файл TTF для monospaced font для PDF докуметов.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Задает путь и файл TTF для bold monospaced font для PDF докуметов.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Задает путь и файл TTF для  italic monospaced font для PDF докуметов.',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Задает путь и файл TTF для bold italic monospaced font для PDF докуметов.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the Znuny user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Включает поддержку PGP, когда она включается для возможности подписи и дешифровки почты, настоятельно рекомендуется, чтобы веб-сервер запускался от имени пользователя Znuny. Иначе, возможны проблемы с привилегиями при доступе к папке .gnupg.',
        'Defines the path to PGP binary.' => 'Задает путь к PGP binary.',
        'Sets the options for PGP binary.' => 'Задает настройки для модуля PGP.',
        'Sets the preferred digest to be used for PGP binary.' => '',
        'Sets the password for private PGP key.' => 'Устанавливает праоль для частного ключа PGP.',
        'Enable this if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Configure your own log text for PGP.' => 'Настроить свой собственный текст журнала для PGP.',
        'Sets the method PGP will use to sing and encrypt emails. Note Inline method is not compatible with RichText messages.' =>
            '',
        'Enables S/MIME support.' => 'Включить поддержку S/MIME',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Задает путь к ssl binary. Может понадобиться переменная HOME - ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Specifies the directory where SSL certificates are stored.' => 'Задает каталог для хранения SSL сертификатов.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Задает каталог для хранения частных SSL сертификатов.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Cache time, в сек, для SSL certificate атрибутов.',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com).' =>
            'Задает имя, которое будет использоваться при отсылке уведомлений. Оно используется для построения полного отображаемого имени для мастера уведомлений (например, "Znuny Notifications" znuny@your.example.com). ',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'Задает email address, который должен использоваться при отсылке уведомлений. Он используется построения полного отображаемого имени для мастера уведомлений (например, "Znuny Notifications" znuny@your.example.com). Вы можете использовать переменную OTRS_CONFIG_FQDN заданную в конфигурации или выбрать другой адрес.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Задает тему почтового сообщения, отправляемого агентам, с ключом для создания нового запрошенного пароля.',
        'Defines the body text for notification mails sent to agents, with token about new requested password.' =>
            'Задает текст почтового сообщения, отправляемого агентам, с ключом для создания нового запрошенного пароля.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Задает тему почтового сообщения, отправляемого агенту о новом пароле.',
        'Defines the body text for notification mails sent to agents, about new password.' =>
            'Задает текст почтового сообщения, отправляемого агенту о новом пароле.',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Задает набор доступных прав агентов в системе. Если требуются дополнительные права, они могут быть заданы здесь. Права должны быть определены, чтобы использоваться в системе. Некоторые другие полезные права, также встроены в систему: note, close, pending, customer, freetext, move, compose, responsible, forward, и bounce. Последней строкой в таблице всегда дорлжна быть строка с "rw".',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Задает стандартный набор прав для клиентов в системе. Если требуются дополнительные права, вы можете указать их здесь. Права должны существовать в системе (или добавлены в нее). При дополнении таблицы с правами помните, что строка с правом "rw" всегда должна быть последней в списке.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Позволяет переопределить встроенный список стран своим списком. Это позволит сократить отображаемый список до необходимого минимума.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Включает журналирование производительности (время загрузки страниц). Этот параметр снижает производительность системы. Параметр Frontend::Module###AdminPerformanceLog должен быть активирован.',
        'Specifies the path of the file for the performance log.' => 'Задает путь к файлу журнала производительности.',
        'Defines the maximum size (in MB) of the log file.' => 'Задает максимальный размер (в MB) для файла журнала.',
        'Defines the two-factor module to authenticate agents.' => 'Задает модуль для двухфакторной аутентификации агентов.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Задает ключ личных настроек агента в котором хранится общий секретный ключ.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Задает возможность входа для агента, если для него не задан секретный ключ хранимый в его личных настройках, т.е. не используется двух-факторная аутентификация.',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Определяет, должен ли предыдущий правильный ключ (token) быть принят для авторизации. Это немного менее безопасно, но дает пользователям на 30 секунд больше времени для ввода их одноразового пароля.',
        'Defines the name of the table where the user preferences are stored.' =>
            'Задать имя таблицы где будут храниться предпочтения пользователей.',
        'Defines the column to store the keys for the preferences table.' =>
            'Задает колонку для хранения ключей для таблицы личных настроек.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Задает имя колонки для хранения данных в preferences table.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'адает имя колонки для хранения идентификатора пользователя в preferences table.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Определяет параметры конфигурации этого элемента, которые будут отображаться в персональных настройках. \'PasswordRegExp\' позволяет сопоставлять пароли с регулярным выражением. Определите минимальное количество символов, используя \'PasswordMinSize\'. Определите, нужны ли как минимум 2 строчных и 2 заглавных буквы, установив для соответствующей опции значение \'1\'. \'PasswordMin2Characters\' определяет, должен ли пароль содержать как минимум 2 буквенных символа (установить значение 0 или 1). \'PasswordNeedDigit\' контролирует необходимость наличия как минимум 1 цифры (контролируется установкой 0 или 1). \'PasswordMaxLoginFailed\' позволяет временно сделать агента недействительным, если достигнуто максимальное количество неудачных попыток входа в систему. Обратите внимание: установка свойства \'Активный\' в 0 только запретит агентам редактировать настройки этой группы в их персональных настройках, но по-прежнему позволит администраторам редактировать настройки от имени другого пользователя. Используйте \'PreferenceGroup\', чтобы указать, в какой области эти настройки должны отображаться в пользовательском интерфейсе.',
        'Defines the config parameters of this item, to be shown in the preferences view. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the users avatar. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => 'Задает идентификатор пользователя для клиентской панели.',
        'Activates support for customer and customer user groups.' => 'Включить поддержку компаний и групп клиентов',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer user for these groups).' =>
            'Задает группы, в которые включается каждый клиент (если CustomerGroupSupport включена и вы не желаете делать это для каждого клиента по отдельности).',
        'Defines the groups every customer will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer for these groups).' =>
            'Задает список групп, в которые включаются все клиенты/компании (если CustomerGroupSupport включена и вы не желаете делать это для каждого клиента/компании по отдельности).',
        'Defines a permission context for customer to group assignment.' =>
            'Задает перечень прав для назначения группам клиентов.',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'Задает модуль который показывает всех подключившихся агентов в интерфейсе клиента.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'Задает модуль который показывает всех подключившихся клиентов в интерфейсе клиента.',
        'Defines the module to display a notification in the customer interface, if the customer is logged in while having system maintenance active.' =>
            'Задает модуль, который показывает уведомление в интерфейсе клиента, если клиента зашел в систему, когда она в состоянии Профилактика/Обслуживание системы',
        'Defines the module to display a notification in the customer interface, if the customer user has not yet selected a time zone.' =>
            'Задает модуль для отображения уведомлений в интерфейсе клиента, если клиент все еще не выбрал временную зону.',
        'Defines an alternate login URL for the customer panel..' => 'Задает альтернативную URL, для входа  клиента.',
        'Defines an alternate logout URL for the customer panel.' => 'Задает альтернативную URL, для выхода  клиента.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Задает элемент данных клиента, на основании которого создается изображение из Google Maps в конце блока информации о клиенте.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Задает элемент данных клиента, на основании которого создается изображение из Google в конце блока информации о клиенте.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Задает элемент данных клиента, на основании которого создается изображение из LinkedIn  в конце блока информации о клиенте.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Задает элемент данных клиента, на основании которого создается изображение из XING в конце блока информации о клиенте.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Этот модуль и его PreRun() функция будет запускаться, если он определен для каждого запроса. Он полезен для проверки некоторых атрибутов пользователя или отображать новости о новых приложениях.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Задает ключ, который проверяется модулем CustomerAccept. Если этот ключ личных настроек верен, сообщение принимается системой.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Задает путь к файлу info file/информационного сообщения, расположенного в Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.',
        'Activates lost password feature for customers.' => 'Включить функцию восстановления пароля для клиентов',
        'Enables customers to create their own accounts.' => 'Дать возможность клиентам самостоятельно создавать свои учетные записи.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Если включено, адрес электронной почты пользователя  для разрешения регистрации должен соответствовать хотя бы одному из регулярных выражений.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Если включено, адрес электронной почты пользователя  для разрешения регистрации может не соответствовать ни одному из регулярных выражений.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Задает тему почтового сообщения, отправляемого клиентам, с ключом для создания нового запрошенного пароля.',
        'Defines the body text for notification mails sent to customers, with token about new requested password.' =>
            'Задает текст почтового сообщения, отправляемого клиентам, с ключом для создания нового запрошенного пароля.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Задает тему почтового сообщения, отправляемого клиенту о новом пароле.',
        'Defines the body text for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Задает тему почтового сообщения, отправляемого клиенту о новой учетной записи.',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Задает текст письма в почтовом уведомлении, посылаемом клиентам, о создании новой учетной записи.',
        'Defines the module to authenticate customers.' => 'Задает модуль аутентификации клиентов',
        'If "DB" was selected for Customer::AuthModule, the encryption type of passwords must be specified.' =>
            'Если "DB" был выбран в качестве Customer::AuthModule, необходимо указать шифрование паролей.',
        'If "bcrypt" was selected for CryptType, use cost specified here for bcrypt hashing. Currently max. supported cost value is 31.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, имя таблицы, где будут храниться данные клиентов, должно быть задано.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, имя колонки для CustomerKey в таблице клиентов должно быть задано.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, имя колонки для CustomerPassword (пароль клиента) в таблице клиентов должно быть указано.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, имя файла для доступа к таблице клиентов должно быть указано.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, имя пользователя для доступа к таблице клиентов должно быть указано.',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, пароль для доступа к таблице клиентов должен быть указан.',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Если "DB" выбрано для Customer::AuthModule, драйвер СУБД (обычно используется автоопределение) должен быть задан.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Если "HTTPBasicAuth" был выбран в качестве Customer::AuthModule, Вы можете указать обрезать начальные части имен пользователей (например, для доменов, как example_domain\user обрезать до user).',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Если "HTTPBasicAuth" было выбрано для Customer::AuthModule, вы можете задать (используя RegExp) удаление части REMOTE_USER (т.е. для удаления имени домена). RegExp-Note, $1 будет новый Login.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, хост для LDAP должен быть указан.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, BaseDN должен быть указан.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, идентификатор пользователя должен быть указан.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use Znuny. Specify the group, who may access the system.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, вы можете проверять позволено ли клиенту входить, т.к. он член posixGroup, например, пользователь должен быть в группе xyz для работы в Znuny. Задайте группу, которая имеет доступ к системе.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, вы можете задать атрибуты доступа здесь.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, атрибуты пользователя должны быть указаны. Для LDAP posixGroups используйте UID, для не LDAP posixGroups используйте полный DN пользователя.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule и ваши пользователи имеют только анонимный доступ к LDAP, но вы желаете осуществлять поиск данных в нем, вы можете осуществить это с учетной записью пользователя, имеющего доступ к LDAP. Задайте его username такого пользователя здесь.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule и ваши пользователи имеют только анонимный доступ к LDAP, но вы желаете осуществлять поиск данных в нем, вы можете осуществить это с учетной записью пользователя, имеющего доступ к LDAP. Задайте пароль такого пользователя здесь.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Если "LDAP" было выбрано, вы можете добавить фильтр для каждого LDAP запроса, например (mail=*), (objectclass=user) или (!objectclass=computer).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule и вы желаете добавить суффикс к каждому логину пользователя, задайте его здесь, т.е. вы вы хотите имя пользователя user, но в вашем LDAP существует user@domain.',
        'If "LDAP" was selected for Customer::AuthModule and special parameters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule и специальные параметры необходимы для Net::LDAP perl module, вы можете задать их здесь. См. "perldoc Net::LDAP" для дополнительной информации о параметрах.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Если "LDAP" было выбрано для Customer::AuthModule, вы можете задать должно ли приложение быть остановлено если, например, соединение с сервером не может быть установлено из-за проблем с сетью.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Если "Radius" выбрано для Customer::AuthModule, сервер radius должен быть задан.',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Если "Radius" выбрано для Customer::AuthModule, пароль для аутентификации на сервере radius должен быть задан.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Если "Radius" было выбрано для Customer::AuthModule, вы можете указать, должно ли приложение быть остановлено, если, например, соединение с сервером не может быть установлено из-за проблем с сетью.',
        'Defines the two-factor module to authenticate customers.' => 'Задает модуль для двухфакторной аутентификации клиентов.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Задает ключ личных настроек клиента в котором хранится общий секретный ключ.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Задает возможность входа для клиента, если для него не задан секретный ключ хранимый в его личных настройках, т.е. не используется двух-факторная аутентификация.',
        'Defines the parameters for the customer preferences table.' => 'Задает параметры личных настроек для клиента',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'Определяет все параметры этого элемента в личных настройках клиента. \'PasswordRegExp\' позволяет сопоставлять пароли с регулярным выражением. Определите минимальное количество символов, используя \'PasswordMinSize\'. Определите, требуется ли как минимум 2 строчных буквы и 2 буквы в верхнем регистре, установив соответствующую опцию в \'1\'. \'PasswordMin2Characters\' определяет, должен ли пароль содержать не менее 2 буквенных символов (устанавливается в 0 или 1). \'PasswordNeedDigit\' управляет необходимостью указывать не менее 1 цифры (устанавливается в 0 или 1 ).',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Задает параметры для этого элемента, которые будут отображаться на экране личных настроек.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Задать все параметры для этого элемента в личных настройках в интерфейсе клиента',
        'Parameters for the pages (in which the communication log entries are shown) of the communication log overview.' =>
            '',
        'Search backend router.' => 'Модуль поиска.',
        'JavaScript function for the search frontend.' => 'Функция JavaScript для фронтэнд поиска.',
        'Main menu registration.' => 'ModuleRegistration для главного меню.',
        'Parameters for the dashboard backend of the customer company information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметры для раздела Дайджеста  в интерфейсе агента с информацией о компании клиента. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.',
        'Parameters for the dashboard backend of the customer user information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметры для раздела Дайджеста  в интерфейсе агента с информацией о клиентах. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.',
        'Search backend default router.' => 'Модуль поиска по умолчанию.',
        'Defines available groups for the admin overview screen.' => 'Задает перечень групп доступных администратору в его панели.',
        'Frontend module registration (show personal favorites as sub navigation items of \'Admin\').' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Frontend module registration (отключает ссылку на компанию, если отключена поддержка компаний).',
        'Frontend module registration for the customer interface.' => 'Frontend module registration для интерфейса клиента.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Включить доступные темы системы. Значение 1 - включена, 0 - отключена',
        'Defines the default value for the action parameter.' => '',
        'Defines the shown links in the footer area of the customer and public interface of this Znuny system. The value in "Key" is the external URL, the value in "Content" is the shown label.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Задает значение параметра Action по умолчанию для общедоступного (public) интерфейса. Параметр Action используется в скриптах системы.',
        'Sets the stats hook.' => 'Задает признак (знак, префикс) для имени отчета.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Начальный номер для нумерации отчетов. Каждый новый отчет увеличивает этот номер.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Задает стандартное значение максимального количества отчетов на странице экрана просмотра.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Задает стандартный выбор для выпадающего меню для динамических объектов (Экран: Общие характеристики).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Задает стандартный выбор для выпадающего меню для прав доступа (Экран: Общие характеристики).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Задает стандартный выбор для выпадающего меню для формата вывода (Экран: Общие характеристики). Выберите тип формата (смотрите параметр Формат вывода).',
        'Defines the search limit for the stats.' => 'Задает лимит поиска для отчетов.',
        'Defines all the possible stats output formats.' => 'Задает возможные форматы вывода отчетов',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Позволяет поменять местами оси графика в отчете.',
        'Adds the following elements for use in stats: "Agent/Owner", "Created by Agent/Owner", "Responsible", "Accounted time by Agent".' =>
            '',
        'Allows invalid agents to be used in stats. Stats::UseAgentElementInStats must be active.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Показывает все идентификаторы клиентов в поле типа "multi-select" (не следует использовать при наличии большого количества таких идентификаторов).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            'Показывает все идентифкаторы клиента в поле с выбором нескольких значений (не пригодно, если имеется большое число идентификаторов клиента).',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Задает максимальное количество атрибутов для оси - Х для временНой шкалы.',
        'Znuny can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'Znuny может использовать одну или более зеркальных БД, в режиме только для чтения, для ресурсоёмких операций, типа полнотекстового поиска или генерации отчетов. Здесь вы можете указать имя/DSN для первой зеркальной БД.',
        'Specify the username to authenticate for the first mirror database.' =>
            'Задайте имя пользователя для аутентификации в первой зеркалируемой БД.',
        'Specify the password to authenticate for the first mirror database.' =>
            'Задайте пароль для аутентификации для первой зеркалируемой БД.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Укажите любые дополнительные, доступные только для чтения зеркальные базы данных, которые желаете использовать.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Определяет параметры Дайджеста. "Limit" определяет число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" указывает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTL" указывает время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Определяет параметры Дайджеста. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" указывает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTL" указывает время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Показывать сообщение дня (MOTD) в Дайджесте. "Group" используется, чтобы ограничить доступ к плагину (например Group: admin;group1;group2;). "Default" показывает - включен ли плагин по умолчанию или пользователь может включить его вручную. "Mandatory" определяет будет ли плагин отображаться всегда и не сможет быть закрыт агентами.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'Запускает поиск с символами подстановки активного объекта в окне связывания объектов.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Задает фильтр для текста сообщений для подсветки определенных слов.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Задает фильтр для HTML для добавления ссылки после CVE numbers. Элемент Image может быть в двух вариантах. Первый - задать имя рисунка (напр. faq.png). В этом случае будет использоваться путь к файлам рисунков Znuny. Второй - вставить ссылку на рисунок.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Задает фильтр для HTML для добавления ссылки после bugtraq numbers. Элемент Image может быть в двух вариантах. Первый - задать имя рисунка (напр. faq.png). В этом случае будет использоваться путь к файлам рисунков Znuny. Второй - вставить ссылку на рисунок.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Задает фильтр для HTML для добавления ссылки после MSBulletin numbers. Элемент Image может быть в двух вариантах. Первый - задать имя рисунка (напр. faq.png). В этом случае будет использоваться путь к файлам рисунков Znuny. Второй - вставить ссылку на рисунок.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Задать фильтр для вывода в HTML для добавления ссылки после определенной строки. Элемент Image может быть в двух вариантах. Первый - имя рисунка (напр. faq.png). В этом случае должен использоваться путь к файлам рисунков Znuny. Во втором вставить ссылку на рисунок.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Задать фильтр для вывода в HTML для добавления ссылки после определенной строки. Элемент Image может быть в двух вариантах. Первый - имя рисунка (напр. faq.png). В этом случае будет использоваться путь к файлам рисунков Znuny. Второй - вставить ссылку на рисунок.',
        'If enabled, the Znuny version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            'Если включено, метка версии Znuny будет убрана из web интерфейса, HTTP заголовков и Х-Заголовков исходящих писем. Примечание: если Вы изменили эту опцию, пожалуйста, убедитесь что кеш удален.',
        'If enabled, Znuny will deliver all CSS files in minified form.' =>
            'Если включено, Znuny будет предоставлять все CSS файлы в уменьшенной форме.',
        'If enabled, Znuny will deliver all JavaScript files in minified form.' =>
            'Если включено, Znuny выполняет все JavaScript в минимизированной форме.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Список CSS файлов всегда загружаемых в интерфейсе агента.',
        'List of JS files to always be loaded for the admin interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Список CSS файлов всегда загружаемых в интерфейсе клиента.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Список CSS файлов всегда загружаемых в интерфейсе клиента.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Список JS файлов всегда загружаемых в интерфейсе клиента.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Если включено, первый уровень меню будет открываться по наведению указателя мыши (вместо только "клика").',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Задает порядок в котором отображаются Фамилия и Имя агентов.',
        'Default skin for the agent interface.' => 'Стандартная тема оформления для интерфейса агента.',
        'Dark skin for the agent interface.' => 'Темный окрас в интерфейса агента.',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'Внутреннее имя окраса (skin) экрана для интерфейса агента. Доступные варианты заданы в Frontend::Agent::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Можно задать разные схемы оформления, напрмер, чтобы отличать агентов из разных доменов. Используя регулярные выражения (regex), вы можете задать пары Ключ/Содержание, соответствующие доменам. Значение Ключа должно соответствовать домену, а значение Содержания - имя схемы (skin) в системе. Смотрите пример для правильного построения регулярного выражения.',
        'Default skin for the customer interface.' => 'Стандартная тема оформления для интерфейса клиента.',
        'Dark skin for the customer interface.' => 'Темный окрас в интерфейсе клиента.',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'Внутреннее имя окраса (skin) экрана для интерфейса клиента. Доступные варианты заданы в Frontend::Customer::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Можно задать разные схемы оформления, напрмер, чтобы отличать клиентов из разных доменов. Используя регулярные выражения (regex), вы можете задать пары Ключ/Содержание, соответствующие доменам. Значение Ключа должно соответствовать домену, а значение Содержания - имя схемы (skin) в системе. Смотрите пример для правильного построения регулярного выражения.',
        'Shows time use complete description (days, hours, minutes), if enabled; or just first letter (d, h, m), if not enabled.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'Выполняет начальный поиск по символу подстановки в списке клиентов при доступе к модулю AdminCustomerUser.',
        'Controls if the autocomplete field will be used for the customer ID selection in the AdminCustomerUser interface.' =>
            'Включает использование автозаполнения поля при выборе ID компании в AdminCustomerUser интерфейсе.',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'Выполняет начальный поиск по символу подстановки в списке компаний клиентов в модуле AdminCustomerCompany.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Задает право администратора выполнять изменения в БД используя AdminSelectBox.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Список всех событий для Клиента отображаемых в интерфейсе.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Список всех событий для Компаний клиента отображаемых в интерфейсе.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Модуль обработки события, который обновляет заявки клиентов после обновления учетной записи клиента.',
        'Event module that updates customer company object name for dynamic fields.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            'Модуль обработки события, который обновляет профили поиска для клиента при смене логина.',
        'Event module that updates customer user service membership if login changes.' =>
            'Модуль обработки события, который обновляет принадлежность сервисов клиентов после смены логина клиента.',
        'Event module that updates customer user object name for dynamic fields.' =>
            '',
        'Selects the cache backend to use.' => 'Выберите бэкэнд под кэш.',
        'If enabled, the cache data be held in memory.' => 'Если включено, данные кеша будут храниться в памяти.',
        'If enabled, the cache data will be stored in cache backend.' => 'Если включено, данные кеша будут храниться в кеш backend\'е.',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'Задает количество уровней подкаталога для кэш файлов. параметр предотвращает от создания большого количества файлов в одном каталоге.',
        'Defines the config options for the autocompletion feature.' => 'Задает настройки для функции автозавершения.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'Определяет список возможных дальнейших действий на экране ошибки, необходим полный путь, тогда станет возможным добавление внешних ссылок, в случае необходимости.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Задает время отображения сообщения о наступлении периода техобслуживания, в минутах.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Задает сообщение по умолчанию для уведомления, отображаемого в период обслуживания системы',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Задает сообщение по умолчанию для экрана ввода логина в интерфейсах агента и клиента, оно выдается когда период обслуживания системы не истек.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Задает сообщение об ошибке по умолчанию для экрана ввода логина в интерфейсах агента и клиента, оно выдается когда период обслуживания системы не истек.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Используйте новый способ выбора и автозавершения при заполнении полей в интерфейсе агента, где это применимо (InputFields/Поля ввода).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'Используйте новый способ выбора и автозавершения при заполнении полей в интерфейсе клиента, где это применимо (InputFields/Поля ввода).',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Задает путь к расположению модуля приема почты. Обратите внимание - имя модуля должно быть \'fetchmail\', если ого отличается - используйте символьную ссылку.',
        'Defines an overview module to show the address book view of a customer user list.' =>
            'Задает модуль просмотра для отображения списка клиентов в формате адресной книги.',
        'Specifies the group where the user needs rw permissions so that they can edit other users preferences.' =>
            'Задает для пользователя группу с rw правами, члены которой могут редактировать настройки других пользователей.',
        'Defines email communication channel.' => '',
        'Defines internal communication channel.' => '',
        'Defines phone communication channel.' => '',
        'Defines chat communication channel.' => '',
        'Defines groups for preferences items.' => 'Задает группы для личных настроек.',
        'Defines how many deployments the system should keep.' => 'Определяет количество развертываний системы.',
        'Defines the search parameters for the AgentCustomerUserAddressBook screen. With the setting \'CustomerTicketTextField\' the values for the recipient field can be specified.' =>
            '',
        'Defines the default filter fields in the customer user address book search (CustomerUser or CustomerCompany). For the CustomerCompany fields a prefix \'CustomerCompany_\' must be added.' =>
            'Задает поля фильтра по умолчанию при поиске в адресной книге клиентов (Клиент или Компания). Для полей компании клиента необходимо добавить префикс \'CustomerCompany_\'.',
        'Defines the shown columns and the position in the AgentCustomerUserAddressBook result screen.' =>
            '',
        'Example package autoload configuration.' => '',
        'Activates week number for datepickers.' => 'Активирует номер недели при выборе даты.',

        # XML Definition: Kernel/Config/Files/XML/GenericInterface.xml
        'Performs the configured action for each event (as an Invoker) for each configured web service.' =>
            '',
        'Cache time in seconds for the web service config backend.' => 'Cache time, в сек, для backend конфигурации веб сервисов.',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Cache time, в сек, для аутентификации агентов в GenericInterface.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Cache time, в сек, для аутентификации клиентов в GenericInterface.',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the invoker layer.' => 'GenericInterface модуль регистрации для уровня Invoker',
        'GenericInterface module registration for the mapping layer.' => '',
        'Defines the default visibility of the article to customer for this operation.' =>
            'Задает видимость заметок/сообщений по умолчанию для клиента по этой операции.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для этой операции, в интерфейсе агента.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для этой операции, в интерфейсе агента.',
        'Defines the default auto response type of the article for this operation.' =>
            'Задает стандартный тип автоответа для этой операции.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Задаёт максимальный размер в килобайтах для ответов GenericInterface которые регистрируются в таблице gi_debugger_entry_content.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Максимальное количество заявок отображаемых в результате этой операции.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре результатов поиска для этой операции.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в результатах поиска для этой операции. Up: старые вверху. Down: новые вверху.',
        'GenericInterface module registration for an error handling module.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/ProcessManagement.xml
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Frontend module registration (отключает экран процессеой заявки, если нет доступных процессов).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate).' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Этот параметр задает динамическое поле для хранения идентификаторов элементов Процесса в Управлении Процессами.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Этот параметр задает динамическое поле для хранения идентификаторов элементов Активности в Управлении Процессами.',
        'This option defines the process tickets default queue.' => 'Задает очередь по умолчанию для процессной заявки.',
        'This option defines the process tickets default state.' => 'Задает состояние по умолчанию для процессной заявки.',
        'This option defines the process tickets default lock.' => 'Задает блокировку по умолчанию для процессной заявки.',
        'This option defines the process tickets default priority.' => 'Задает приоритет по умолчанию для процессной заявки.',
        'Display settings to override defaults for Process Tickets.' => 'Отображает настройки, перекрывающие умалчиваемые для процессных заявок.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key =&gt; My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'Показывает пункт меню для преобразования заявки в Процесс при просмотре заявки в интерфейсе агента.',
        'Loader module registration for the customer interface.' => '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Frontend module registration (отключает экран процессеой заявки, если нет доступных процессов) для клиента.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Стандартные префиксы идентификаторов элементов процессов в Управлении Процессами, генерируемые автоматически (напр. A, T, AD, TA).',
        'Cache time in seconds for the DB process backend.' => 'Cache time, в сек, для DB process backend.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Cache time, в сек, для модуля вывода на навигационной панели процессных заявок.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Задает список следующих доступных состояний после создания новой процессной заявки в интерфейсе агента.',
        'Shows existing parent/child (separated by ::) process lists in the form of a tree or a list.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => 'Устанавливает атрибут read-only/только чтение для CustomerID в интерфейсе агента.',
        'If enabled debugging information for transitions is logged.' => 'Включить журналирование отладки Переходов.',
        'Defines the priority in which the information is logged and presented.' =>
            'Задает приоритет с которым информация журналируется и отображается.',
        'Filter for debugging Transitions. Note: More filters can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком выполняемых процессных заявках. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'DynamicField backend registration.' => 'Регистрация типов используемых динамических полей (dropdown, text, checbox...).',
        'Defines the default keys and values for the transition action module parameters. Mandatory fields are marked with "(* required)". Note: For most of the keys the AttributeID can also be used, e.g. "Owner" can be "OwnerID". Keys that define the same Attribute should only be used once, e.g. "Owner" and "OwnerID" are redundant.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Ticket.xml
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Идентфикатор заявки, например, Заявка№, Звонок#. По умолчанию - Ticket#.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Разделитель между символом номера и его значением. (Например ":", ".").',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'Максимальная длина поля Тема в почтовом ответе и некоторых экранах просмотра.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Текст, предшествующий теме в ответе на письмо, например, RE, AW, или AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Текст, предшествующий теме при пересылке письма, например, FW, Fwd, или WG.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'Формат поля Тема. "Left" означает "[TicketHook#:12345] текст темы", "Right" - "текст темы [TicketHook#:12345]", "None" "текст темы без номера заявки". В последнем случае вы должны убедиться, что параметр PostMaster::CheckFollowUpModule###0200-References активирован для распознавания ответов/дополнений, на основании анализа заголовка/темы письма.',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Список динамических полей, которые объединяются в главной заявке при слиянии. Только динамические поля, имеющие пустые значения в главной заявке будут установлены/заполнены.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Имя пользовательского списка очередей. Это набор очередей, выбранных из списка доступных очередей в личных настройках.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'Имя пользовательского сервиса. Это сервис, выбранный из списка предпочтительных сервисов и он может быть выбран в личных настройках.',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            'Игнорировать сообщения с типом отправителя \'система\' (например авто-ответы или почтовые уведомления), которые будут отмечены как \'Непрочитанное Сообщение\' на странице просмотра заявки (AgentTicketZoom) или автоматически раскрыты в "Большом" обзоре заявок.',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Изменить Владельца заявок на любого (полезно для ASP). Обычно, только агенты с rw - правами в очереди отображаются.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Включает возможность назначения ответственных для заявки.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'Автоматически устанавливает владельца заявки ответственным за нее (если механизм ответственных включен). Это работает лишь при ручных операциях для вошедшего в систему пользователя. Не работает при автоматически выполняемых работах, типа GenericAgent/Планировщик, Postmaster или GenericInterface.',
        'Automatically change the state of a ticket with an invalid owner once it is unlocked. Maps from a state type to a new ticket state.' =>
            'Автоматически изменяет состояние заявки с недействительным агентом после её разблокирования. Новое состояние заявки берется из доступных типов состояния.',
        'Enables ticket type feature.' => '',
        'Defines the default ticket type.' => 'Определяет тип заявки по умолчанию.',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Позволяет определить сервисы и SLA для заявок (например, почта, компьютер, сеть и т. п.), и параметры эскалации для SLA (если включена функция сервисов и SLA).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Оставляет все сервисы в списке, даже если они являются потомками от недействительных элементов.',
        'Allows default services to be selected also for non existing customers.' =>
            'Разрешает установить Сервис по умолчанию для несуществующих клиентов.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Включить функцию архивирования заявок для ускорения работы, путем перемещения некоторых заявок из ежедневного объема. Для поиска таких заявок необходимо включить архивный флажок при создании поискового запроса',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Управляет удалением флагов просмотра заявок и сообщений при архивировании заявки.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Удаляет признак наблюдения за заявкой при ее архивировании.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Включить возможность поиска заявок в архиве в интерфейсе клиента.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). With "Random" the ticket numbers will be generated by 12 random numbers. The format looks like SystemID.RandomNumbers (e.g. 10123456789012).' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups. If not enabled, SystemID will be changed after using the system.' =>
            'Проверяет SystemID в номере заявки при обнаружении ответа клиент (follow-ups). Если выключено, SystemID будет изменен после использования системы.',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'Задает минимальное количество разрядов счетчика (если "AutoIncrement" выбран в качестве TicketNumberGenerator. По умолчанию - 5, что означает, что счетчик стартует с 10000.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Включает минимальный размер счетчика заявок (Если "Date" было выбрано в качестве TicketNumberGenerator).',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'IndexAccelerator: для выбора серверного TicketViewAccelerator модуля. "RuntimeDB" - строит каждый обзор на лету из таблицы заявок (не будет проблем с производительностью, примерно, до общего объема в 60.000 заявок и 6.000 открытых). "StaticDB" - наиболее мощный модуль, он использует внешнюю таблицу индексов заявок (рекомендуется при объеме более 80.000 заявок при 6.000 открытых хранимых в системе). Используйте скрипт "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild"  для первичного создания индексов.',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the Znuny user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Сохраняет вложения из сообщений/заметок. "DB" - сохраняет их в БД (не рекомендуется для больших вложений). "FS" - сохраняет данные в файловой системе; это быстрее, но веб-сервер должен запускаться от имени пользователя Znuny. Вы можете переключать это значение в процессе работы без потери данных. Примечание: Поиск по именам вложений не поддерживается при использовании "FS".',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'Определяет, должны ли все виды хранилищ проверяться при просмотре вложений. Это необходимо лишь в случае, когда часть вложений хранится в файловой системе, а остальные в базе данных.',
        'Specifies the directory to store the data in, if "FS" was selected for ArticleStorage.' =>
            'Задает каталог для сохранения данных, если "FS" выбрано в ArticleStorage. ',
        'Specifies whether the (MIMEBase) article attachments will be indexed and searchable.' =>
            'Определяет, будут ли вложения сообщений (MIMEBase) проиндексированы и доступны для поиска.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Период в минутах после наступления события, в который новое уведомление об эскалации подавляется.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Updates the ticket index accelerator.' => 'Обновляет ticket index accelerator.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Сбрасывает Владельца и разблокирует заявку при перемещении ее в другую очередь.',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Принудительно устанавливать новое состояние (отличное от текущего) поcле блокирования заявки. Задайте текущее состояние как Ключ и следующее состояние как Содержимое.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Автоматически назначает Ответственного (если это еще не произошло) после первой смены Владельца.',
        'When agent creates a ticket, whether or not the ticket is automatically locked to the agent.' =>
            'Когда агент создает заявку, она автоматически блокируется этим агентом.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Устанавливает время ожидания в 0 если состояние изменяется на состояние без ожидания.',
        'Sends the notifications which are configured in the admin interface under "Ticket Notifications".' =>
            '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Обновляет индексы эскалации заявок после изменения атрибутов заявки.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Модуль управления событием остановки эскалации.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Принудительно разблокировать заявки при перемещении в другую очередь.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Обновляет значение флага "Seen" (прочитано), если каждое сообщение просмотрено или создано новое сообщение.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Модуль обработки события, который обновляет заявки клиентов после обновления учетной записи клиента.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Модуль обработки события, который обновляет заявки клиентов после обновления учетной записи клиента.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser setting.' =>
            'Задает соответствие между данными о клиенте (ключи) и динамическими полями заявки (значения). Цель - сохранить данные о клиенте в динамических полях заявки. Динамические поля должны быть созданы в системе и доступны для AgentTicketFreeText, таким образом они смогут быть установлены/изменены агентом вручную. Они не должны быть доступны для AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. Если бы они были доступны, они имели бы приоритет над автоматически установленными значениями. Чтобы использовать данную настройку, Вы также должны активировать Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser настройку.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see DynamicFieldFromCustomerUser::Mapping setting for how to configure the mapping.' =>
            'Этот модуль событий сохраняет атрибуты Клиента как Динамические поля заявок. Пожалуйста, посмотрите DynamicFieldFromCustomerUser::Mapping настройку, чтобы понять как настроить отображение.',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Переопределяет функции заданные в Kernel::System::Ticket::(имя папки с альтернативными модулями). Применяется для облегчения кастомизации.',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). It will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild".' =>
            '',
        'Defines whether to index archived tickets for fulltext searches.' =>
            '',
        'Force the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'Отобразить предупреждение и прекратить поиск при использовании стоп-слов при полнотекстовом поиске',
        'Basic fulltext index settings. Execute "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" in order to generate a new index.' =>
            '',
        'Fulltext index regex filters to remove parts of the text.' => 'Регулярное выражение для удаления части текста в запросе полнотекстового поиска.',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Английские стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Немецкие стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Голландские стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Испанские стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Французские стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Итальянские стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Настраиваемые стоп-слова для полнотекстовой индексации. Эти слова будут удалены и поискового индекса.',
        'Allows having a small format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo =&gt; 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Задает тип отправителя сообщения, показываемый при просмотре заявки.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Устанавливает видимость счетчика сообщений в preview mode (L) просмотра заявок.',
        'Defines if the first article should be displayed as expanded, that is visible for the related customer. If nothing defined, latest article will be expanded.' =>
            'Задает, какое тип сообщение разворачивается при входе в просмотр клиентом. Если ничего не указано, разворачивается последнее сообщение.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Время (в сек) добавляемое к текущему, если установлено состояние ожидания. (по умолчанию: 86400 = 1 день).',
        'Define the max depth of queues.' => 'Задайте максимальный уровень вложенности для очередей',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Показывать список очередей Родитель/Потомок в виде списка или дерева.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Включает/выключает функцию наблюдения за заявками, чтобы иметь возможность отслеживания заявок не будучи ее владельцем или ответственным.',
        'Enables ticket watcher feature only for the listed groups.' => 'Включает возможность Наблюдения для заявок для выбранных групп агентов.',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Включает возможность массовых операций с заявками',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Включает возможность массовых операций с заявками только для выбранных групп.',
        'Defines time in minutes since last modification for drafts of specified type before they are considered expired.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Показывет пункт меню для просмотра почтовой заявки как plain text.',
        'Shows all the articles of the ticket (expanded) in the agent zoom view.' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Показывать сообщения к заявке отсортированными в обычном или обратном порядке в интерфейсе агента.',
        'Shows the article head information in the agent zoom view.' => '',
        'Shows a count of attachments in the ticket zoom, if the article has attachments.' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Отображает учтенное время для заметки в подробном просмотре заявки.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Включить фильтр сообщений в подробном просмотре, для выбора сообщений для показа',
        'Displays the number of all tickets with the same CustomerID as current ticket in the ticket zoom view.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Показывает историю заявки (в обратном порядке) в интерфейсе агента.',
        'Controls how to display the ticket history entries as readable values.' =>
            'Управляет способом отображения записей истории заявки в читаемом виде.',
        'Permitted width for compose email windows.' => 'Ширина окна для текста ответа.',
        'Permitted width for compose note windows.' => 'Ширина окна для текста сообщения/заметки.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Максимальный размер (в строках) списка информируемых агентов, в интерфейсе агента.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Максимальный размер (в строках) списка привлекаемых агентов, в интерфейсе агента.',
        'Makes the application block external content loading.' => '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Показывать информацию о клиенте (телефон и адрес электронной почты) при создании сообщений.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Максимальный размер (в символах) таблицы с информацией о клиенте (при создании заявки или ответа).',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Максимальная длина (в символах) для таблицы информации о клиенте при просмотре заявки.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'Максимальная длина (в символах) для динамических полей в информации о заявке в подробном просмотре заявки.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'Максимальная длина (в символах) для динамических полей в сообщении в подробном просмотре заявки.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Задает возможность сортировки заявок для клиента',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Этот параметр запрещает доступ к заявкам Компании клиента, которые не созданы этим клиентом.',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Текст отображаемый клиенту еще не имеющему заявок (если желаете, чтобы этот текст отображался на нужном языке, добавьте его в кастомный русский файл локализации - ru_custom.pm).',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Показывать последнюю тему сообщения клиента или тему заявки при small format обзоре заявок.',
        'Show the current owner in the customer interface.' => 'Показывать текущего Владельца в интерфейсе клиента.',
        'Show the current queue in the customer interface.' => 'Показывать текущую Очередь в интерфейсе клиента.',
        'Dynamic fields shown in the ticket overview screen of the customer interface.' =>
            '',
        'Strips empty lines on the ticket preview in the queue view.' => 'Убирает пустые строки при предпросмотре заявки в обзоре очередей.',
        'Shows all both ro and rw queues in the queue view.' => 'Показывает заявки агентов с правами ro и rw в просмотре очередей.',
        'Show queues even when only locked tickets are in.' => 'Отображать очереди даже если в них только заблокированные заявки.',
        'Enable highlighting queues based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Устанавливает возраст в минутах (первый уровень) для подсветки очередей, содержащих непросмотренные заявки.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Устанавливает возраст в минутах (второй уровень) для подсветки очередей, содержащих непросмотренные заявки.',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Включить "мигание" для очередей содержащих наиболее старые заявки',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Включает заявки подочередей по умолчанию при выборе очереди.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Сортировать заявки (по возрастанию или убыванию) если выбрана одна очередь при просмотре очередей и после сортировки по приоритету. Значения: 0 = по возрастанию (старые сверху, по умолчанию), 1 = по убыванию (новейшие сверху). Используйте QueueID в качестве ключа и 0 или 1 в качестве значения ключа.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Задает критерий сортировки по умолчанию для всех очередей отображаемых в обзоре очередей.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Устанавливает, должна ли быть выполнена предварительная сортировка по приоритету в обзоре очередей.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Задает порядок сортировки по умолчанию для всех очередей отображаемых в обзоре очередей, после сортировки по приоритету.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Убирает пустые строки при предпросмотре заявки в обзоре сервисов.',
        'Shows all both ro and rw tickets in the service view.' => 'Показывает заявки агентов с правами ro и rw в просмотре сервисов.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'Сортировать заявки (по возрастанию или убыванию) если выбрана одна очередь при просмотре очередей и после сортировки по приоритету. Значения: 0 = по возрастанию (старые сверху, по умолчанию), 1 = по убыванию (новейшие сверху). Используйте QueueID в качестве ключа и 0 или 1 в качестве значение ключа.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Задает критерий сортировки по умолчанию для всех сервисов отображаемых в обзоре сервисов.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Устанавливает, должна ли быть выполнена предварительная сортировка по приоритету в обзоре заявок по сервисам.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Задаёт порядок сортировки по умолчанию для всех сервисов при просмотре сервисов после сортировки по приоритету.',
        'Enable highlighting services based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting services that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting services that contain untouched tickets.' =>
            '',
        'Activates a blinking mechanism of the service that contains the oldest ticket.' =>
            'Активирует механизм моргания сервиса, который содержит самую старую заявку.',
        'Activates time accounting.' => 'Включить учет времени выполнения',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Задает единицы измерения для единиц времени (например: рабочие часы, часы, минуты).',
        'Defines if time accounting is mandatory in the agent interface. If enabled, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Включить Учет времени для всех заявок при массовом действии.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре статусов заявок в интерфейсе агента.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки (после приоритета) в обзоре статусов в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Задает требуемые права для просмотра эскалаций в интерфейсе агента.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре эскалаций в интерфейсе агента.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки (после приоритета) в обзоре эскалаций в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Максимальное количество заявок отображаемых в результате поиска в интерфейсе агента.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Количество заявок которое показывается на каждой странице при выводе результатов поиска в интерфейсе агента.',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Количество строк (на заявку) которое показывается при выводе результатов поиска в интерфейсе агента.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре результатов поиска в интерфейсе агента.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в результатах поиска в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'Экспортирует полное дерево сообщений в результат поиска (может повлиять на производительность системы).',
        'Data used to export the search result in CSV format.' => 'Данные используемые для экспортирования результатов поиска в формат CSV.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Включить время создания сообщений/заметок в атрибуты поиска в интерфейсе агента.',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Выберите атрибут по умолчанию для показа на экране поискового запроса.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".' =>
            'Стандартные данные, используемые для атрибутов поиска. Например: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре блокированных заявок в интерфейсе агента.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в обзоре заблокированных в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре заявок Ответственного в интерфейсе агента.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в обзоре Ответственных в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок в обзоре наблюдаемых заявок в интерфейсе агента.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в обзоре наблюдаемых заявок в интерфейсе агента. Up: старые вверху. Down: новые вверху.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Права, требуемые для изменения Дополнительных полей заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при редактировании ее дополнительных полей в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets if service must be selected by the agent.' => 'Задает, что Сервис должен быть выбран агентом.',
        'Sets if SLA must be selected by the agent.' => 'Задает, что SLA должен быть выбран агентом.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при изменении Дополнительных полей заявки в интерфейсе агента.',
        'Sets if queue must be selected by the agent.' => '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Задает Владельца при измененииДополнительных полей заявки в интерфейсе агента.',
        'Sets if ticket owner must be selected by the agent.' => 'Задает, что Владелец должен быть выбран агентом.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку на странице изменения дополнительных полей заявки в интерфейсе агента.',
        'Sets if ticket responsible must be selected by the agent.' => 'Установить, если агент обязан выбрать ответственного за заявку.',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if state must be selected by the agent.' => '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране Дополнительные поля в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при редактировании Дополнительных полей в интерфейсе агента.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране Свободные/Дополн. поля заявки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Задает, должно ли быть заполнено сообщение агентом. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Тема по умолчанию для сообщения при редактировании Дополнительных полей в интерфейсе агента',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Задает стандартный текст заметки при редактировании Дополнительных полей (ticket free text) в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при изменении Дополнительных полей заявки в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket free text screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту сообщение агента при изменении динамических полей заявки в интерфейсе агента по умолчанию.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране изменения Дополнительных полей заявки в интерфейсе агента.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране изменения Дополнительных полей заявки в интерфейсе агента.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket free text screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране изменения динамических полей заявки в интерфейсе агента.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Задает текст в записи истории для экрана изменения Дополнительных полей заявки, в интерфейсе агента.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Задает текст комментария в записи истории при изменении Дополнительных полей, в интерфейсе агента.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Права, требуемые для регистрации исходящего звонка клиента в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при исходящем звонке клиенту в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Задает тип отправителя по умолчанию для телефонной заявки при регистрации исходящего звонка клиенту в интерфейсе агента.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Тема по умолчанию для телефонной заявки на экране регистрации исходящего звонка клиенту в интерфейсе агента.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Задать стандартный текст для телефонной заявки при регистрации исходящего звонка клиенту в интерфейсе агента.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию после регистрации исходящего звонка клиента в интерфейсе агента.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Следующее доступное состояние после добавления заметки при регистрации исходящего звонка в интерфейсе агента.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана регистрации исходящего звонка клиента, в интерфейсе агента.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для экрана регистрации исходящего звонка клиента, в интерфейсе агента.',
        'Allows to save current work as draft in the ticket phone outbound screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране регистрации исходящего звонка по заявке в интерфейсе агента.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'Права, требуемые для регистрации входящего звонка клиента в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при входящем звонке от клиента в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Задает тип отправителя по умолчанию для телефонной заявки при регистрации входящего звонка в интерфейсе агента.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Тема по умолчанию для телефонной заявки на экране регистрации входящего звонка клиента в интерфейсе агента.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Задать стандартный текст для телефонной заявки при регистрации входящего звонка клиента в интерфейсе агента.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию после регистрации входящего звонка клиента в интерфейсе агента.',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Следующее доступное состояние после добавления заметки при регистрации входящего звонка в интерфейсе агента.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана регистрации входящего звонка клиента, в интерфейсе агента.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для экрана регистрации входящего звонка клиента, в интерфейсе агента.',
        'Allows to save current work as draft in the ticket phone inbound screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране регистрации входящего звонка по заявке в интерфейсе агента.',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Показывает поле выбора Владельца при создании почтовых и телефонных заявок в интерфейсе агента.',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Выводит окно выбора ответственного при создании телефонных (почтовых) заявок в интерфейсе агента.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "&lt;Queue&gt;" shows the names of the queues and for SystemAddress "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'Задает какие варианты будут доступны для поля Получатель (в телефонной) или Отправитель (в почтовой заявке) в интерфейсе агента.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Показывать предыдущие заявки клиента в AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Если включено, TicketPhone and TicketEmail будут открываться в новом окне браузера.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Устанавливает приоритет по умолчанию для новой телефонной заявки в интерфейсе агента.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Устанавливает отправителя по умолчанию для новой телефонной заявки в интерфейсе агента.',
        'Sets the default article customer visibility for new phone tickets in the agent interface.' =>
            'Устанавливает по умолчанию видимость сообщения клиентом для новых телефонных заявок в интерфейсе агента.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Задает возможность указать более одного клиента для новой телефонной заявки в интерфейсе агента.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Устанавливает Тему по умолчанию для новых телефонных заявок в интерфейсе агента.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Устанавливает текст заявки по умолчанию для новой телефонной заявки в интерфейсе агента.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Устанавливает следующее состояние по умолчанию для новой телефонной заявки в интерфейсе агента.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Задает список следующих доступных состояний после создания новой телефонной заявки в интерфейсе агента.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана новой телефонной заявки, в интерфейсе агента.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для новой телефонной заявки, в интерфейсе агента.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Задает тип связи по умолчанию при разделения заявки в интерфейсе агента.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Устанавливает приоритет по умолчанию для новой почтовой заявки в интерфейсе агента.',
        'Sets the default article customer visibility for new email tickets in the agent interface.' =>
            'Устанавливает по умолчанию видимость сообщения клиентом для новых почтовых заявок в интерфейсе агента.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Устанавливает отправителя по умолчанию для новой почтовой заявки в интерфейсе агента.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Устанавливает Тему по умолчанию для новых почтовых заявок в интерфейсе агента.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Устанавливает Текст по умолчанию для новых почтовых заявок в интерфейсе агента.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Устанавливает следующее состояние по умолчанию при создании новой почтовой заявки в интерфейсе агента.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Задает список следующих доступных состояний после создания новой почтовой заявки в интерфейсе агента.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана новой почтовой заявки, в интерфейсе агента.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для новой почтовой заявки, в интерфейсе агента.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Права, требуемые для закрытия заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки на экране закрытия заявки в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при закрытии заявки в интерфейсе агента.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Задает Владельца при закрытии заявки в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку при закрытии заявки в интерфейсе агента.',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране закрытия заявки в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при закрытии заявки в интерфейсе агента.',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране закрытия заявки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при закрытии заявок в интерфейсе агента.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при закрытии заявки в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при закрытии заявки в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines if the note in the close ticket screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту сообщение агента при закрытии заявки в интерфейсе агента по умолчанию.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране закрытия заявки в интерфейсе агента.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране закрытия заявки в интерфейсе агента.',
        'Shows the title field in the close ticket screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the close ticket screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в скрытом экране заявки в интерфейсе агента.',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана закрытия заявки, в интерфейсе агента.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории при закрытии заявки, в интерфейсе агента.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Права, требуемые для написания сообщения/заметки для заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при написании заметки к заявке в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при создании сообщения/заметки к заявке в интерфейсе агента.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Задает Владельца при создании заметки к заявке в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку на странице создания заметки к заявке в интерфейсе агента.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране Заметка (Сообщение) в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки в интерфейсе агента.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране создания заметки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при создании сообщения к заявке в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при создании сообщения к заявке в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при создании зпметки к заявке в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket note screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту заметка, созданная агентом на экране создания заметки в заявке по умолчанию.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране создания заметки заявки в интерфейсе агента.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране создания заметки к заявке в интерфейсе агента.',
        'Shows the title field in the ticket note screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket note screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране создания заметки в интерфейсе агента.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана новой заметки в заявке, в интерфейсе агента.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для новой заметки, в интерфейсе агента.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Права, требуемые для изменения Владельца заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки просматриваемой заявки при изменении Владельца заявки в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при назначении Владельца заявки в интерфейсе агента.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Задает Владельца при назначении Владельца заявки в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку на странице назначения владельца заявки в интерфейсе агента.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране назначения Вдладельца заявки в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при смене Владельца заявки при ее просмотре в интерфейсе агента.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране Владелец в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при назначении Владельца заявки в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при смене Владельца заявки в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при назначении Владельца заявки в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket owner screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту заметка, созданная агентом на экране назначения владельца заявки, по умолчанию.',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Дает возможность изменить приоритет на экране назначения Владельца заявки в интерфейсе агента.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране назначения Владельца при просмотре заявки в интерфейсе агента.',
        'Shows the title field in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket owner screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране смены владельца заявки в интерфейсе агента.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана назначения Владельца заявки, в интерфейсе агента.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории при назначении Владельца заявки, в интерфейсе агента.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Права, требуемые для заявки в ожидание в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки просматриваемой заявки при переводе ее в ожидание в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при переводе заявки в ожидание в интерфейсе агента.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Задает Владельца при переводе заявки в ожидание в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку на странице перевода заявки в ожидание при ее просмотре в интерфейсе агента.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране перевода заявки в состояние ожидания в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при переводе заявки в ожидание в интерфейсе агента.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране Отложить в просмотре заявки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при переводе заявки в ожидание в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при переводе заявки в ожидание в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при переводе заявки в ожидание в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket pending screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту заметка, созданная агентом на экране перевода заявки в ожидание, по умолчанию.',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Дает возможность изменить приоритет на экране перевода заявки в ожидание в интерфейсе агента.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране перевода заявки в ожидание при просмотре заявки в интерфейсе агента.',
        'Shows the title field in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket pending screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране перевода заявки в ожидание в интерфейсе агента.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана перевода заявки в ожидание, в интерфейсе агента.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для экрана перевода заявки в ожидание, в интерфейсе агента.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Права, требуемые для изменения приоритета заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки просматриваемой заявки при изменении ее приоритета в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при изменении приоритета заявки в интерфейсе агента.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Задает Владельца при изменении приоритета заявки в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Установить, чтобы задать ответственного за заявку на странице изменения приоритета заявки при ее просмотре в интерфейсе агента.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране смены Приоритета заявки в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при изменении приоритета заявки в интерфейсе агента.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране Приоритет в просмотре заявки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при назначении приоритета заявки в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при смене приоритета заявки в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при изменении приоритета заявки в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket priority screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту заметка, созданная агентом на экране изменения приоритета заявки, по умолчанию.',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Дает возможность изменить приоритет на экране изменения приоритета заявки в интерфейсе агента.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране назначения Приоритета при просмотре заявки в интерфейсе агента.',
        'Shows the title field in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket priority screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране смены приоритета заявки в интерфейсе агента.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана изменения проритета заявки, в интерфейсе агента.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для экрана изменения приоритета, в интерфейсе агента.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Права, требуемые для изменения Ответственного заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при изменении Ответственного за заявку в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Задает очередь при назначении Ответственног для заявки в интерфейсе агента.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Задает Владельца при назначении Ответственного за заявку в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Задает Ответственного за заявку при назначении Ответственного заявки в интерфейсе агента.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Задает следующее состояние заявки после добавления заметки на экране назначения Ответственного в интерфейсе агента.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после добавления заметки при смене Ответственного за заявку в интерфейсе агента.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Позволяет добавить сообщение на экране Ответственный в просмотре заявки в интерфейсе агента. Может быть перекрыто параметром Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при назначении Ответственного заявки в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при назначении Ответственного заявки в интерфейсе агента.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Показывает список всех привлекаемых агентов по этой заявке при назначении Ответственного за заявку в интерфейсе агента.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket responsible screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту заметка, созданная агентом на экране назначения ответственного за заявку, по умолчанию.',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране назначения Ответственного за заявку в интерфейсе агента.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране назначения Ответственного при просмотре заявки в интерфейсе агента.',
        'Shows the title field in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket responsible screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране смены ответственного за заявку в интерфейсе агента.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст в записи истории для экрана изменения Ответственного за заявку, в интерфейсе агента.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Задает текст комментария в записи истории для экрана назначения Ответственного, в интерфейсе агента.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Автоматически блокирует заявку и назначает текущего агента владельцем при выборе массового действия',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Задает Тип заявки при массовом действии с заявками в интерфейсе агента. (Ticket::Type должен быть активирован).',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Задает Владельца при массовом действии с заявками в интерфейсе агента.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Задает Ответственного за заявку при массовом действии с заявками в интерфейсе агента.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            'Определяет следующее состояние по умолчанию для заявки на экране массового действия с заявками в интерфейсе агента.',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране массовых действий с заявками в интерфейсе агента.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Задает приоритет заявки по умолчанию на экране массовых действий в интерфейсе агента.',
        'Defines if the note in the ticket bulk screen of the agent interface is visible for the customer by default.' =>
            'Определяет, будет ли доступно для просмотра клиенту сообщение агента при массовом действии с заявками в интерфейсе агента по умолчанию.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Задает список доступных очередей для перемещения заявки в выпадающем списке или в новом окне в интерфейсе агента. Если выбрана опция "New Window" (в новом окне) вы можете добавить заметку о перемещении к заявке.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Автоматически блокирует заявку и назначает ответственным текущего агента после открытия экрана смены очереди в интерфейсе агента.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Позволяет установить новое Состояние заявки на экране смены очереди в интерфейсе агента.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Задает следующее состояние заявки после перемещения заявки в другую очередь на экране  перемещения заявки в другую очередь в интерфейсе агента.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Дает возможность изменить приоритет на экране смены очереди заявки в интерфейсе агента.',
        'Allows to save current work as draft in the ticket move screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране перемещения заявки в интерфейсе агента.',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Права, требуемые для перенаправлении заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки на экране ticket bounce в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после отправки (bounce) на экране Отправить заявки в интерфейсе агента.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Задает следующее состояние заявки после перенаправления заявки на экране перенаправления заявки в интерфейсе агента.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Задает стандартный текст сообщения об отправке заявки для клиента/получателя заявки на экране Отправить в интерфейсе агента.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Права, требуемые для ответа на заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки на экране ее создания (compose) в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки при создании ответа/сообщения в интерфейсе агента.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Задает список следующих доступных состояний после ответа на заявку на экране создания ответа в интерфейсе агента.',
        'Defines if the message in the ticket compose screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket compose screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране компоновки заявки в интерфейсе агента.',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Задает формат ответа на экране формирования сообщения в интерфейсе агента ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] является действительным именем в From).',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'Задает символ для выделения цитируемых почтовых сообщений на экране создания сообщения в интерфейсе агента. Если не задан или оставлено пустым, исходное сообщение не будет выделено, но будет добавлено к ответу.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Определяет максимальное количество цитируемых строк, которые будут добавлены к ответам.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Добавляет почтовые адреса клиентов - получателей на экране создания ответа в интерфейсе агента. E-mail адреса нельзя добавить, если тип сообщения - email-internal.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Заменяет оригинального отправителя текущим почтовым адресом клиента при написании ответа в интерфейсе агента.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Права, требуемые для пересылки заявки в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при ее перенаправлении (forward) в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после перенаправлении (forward) заявки на экране Переслать в интерфейсе агента.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Задает список следующих доступных состояний после пресылки заявки на экране Переслать в интерфейсе агента.',
        'Defines if the message in the ticket forward screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket forward screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране переадресации заявки в интерфейсе агента.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Права, требуемые для создания исходящего письма клиенуа в интерфейсе агента.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки на экране email outbound в интерфейсе агента (если заявка еще не блокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Задает следующее состояние по умолчанию для заявки после отправки сообщения на экране создания исходящего почтового сообщения в интерфейсе агента.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Задает список следующих доступных состояний после отправки сообщения на экране регистрации исходящего почтового сообщения в интерфейсе агента.',
        'Defines if the message in the email outbound screen of the agent interface is visible for the customer by default.' =>
            '',
        'Required permissions to use the email resend screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the email resend screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки на экране email resend в интерфейсе агента (если заявка еще не блокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Defines if the message in the email resend screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the email outbound screen of the agent interface.' =>
            'Позволяет сохранить текущую работу в качестве черновика в экране почтового ответа в интерфейсе агента.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Права, требуемые для сляния заявок в интерфейсе агента.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки просматриваемой заявки при слиянии заявок в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Права, требуемые для изменения клиента заявки в интерфейсе агента.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Определяет необходимость блокировки заявки при изменении клента заявки в интерфейсе агента (если заявка еще не заблокирована, она блокируется и текущий агент автоматически становится ее владельцем).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'При слиянии/объединении заявок, клиент может быть информирован об этом почтовым сообщением, активацией параметра "Inform Sender". Здесь вы можете задать текст, который  потом может быть изменен агентами.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Когда выполняется слияние заявок, заметка автоматически добавляется к заявке, которая более неактивна. Здесь можно задать Тему сообщения/заметки (она не может быть изменена агентом).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Когда выполняется слияние заявок, заметка автоматически добавляется к заявке, которая более неактивна. Здесь можно задать текст сообщения/заметки (он не может быть изменен агентом).',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Задает отображаемый тип отправителя заявки по умолчанию (по умолчанию: customer).',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            'Определяет доступные для просмотра блокировки заявки. Примечание: Когда вы измените эту настройку, убедитесь, что кэш удален для возможности использовать новое значение. По умолчанию: unlock, tmp_lock.',
        'Defines the valid state types for a ticket. If a ticket is in a state which have any state type from this setting, this ticket will be considered as open, otherwise as closed.' =>
            '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'Задает действительные состояния для разблокированных заявок. Для разблокирования заявок используйте скрипт "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout".',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Посылать напоминание о разблокированных заявках после истечения времени напоминания (посылается только владельцу заявки).',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be enabled).' =>
            'Отключает рассылку уведомлений-напоминаний ответственному за заявку агенту (Ticket::Responsible параметр должен быть включен).',
        'Defines the state type of the reminder for pending tickets.' => 'Задает тип состояния для отложенных заявок.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Задает возможные состояния для заявок с ожиданием, которые меняют состояние после истечения времени.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Задает, какие состояния будут установлены автоматически (Содержание), в зависимости от состояния ожидания (Ключ) после истечения его срока.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Задает внешнюю ссылку на БД клиента  (например, \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' или \'\').',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Задает целевой атрибут в ссылке на внешнюю базу клиентов. Например, \'target="cdb"\'.',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'Задает целевой атрибут в ссылке на внешнюю базу клиентов. Например, \'AsPopup PopupType_TicketAction\'.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Элемент панели навигации для иконки.Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль отображения количества заявок за которые агент является ответственным в навигационной панели интерфейса агента. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль отображения количества наблюдаемых заявок в навигационной панели интерфейса агента. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль отображения количества заблокированных заявок в навигационной панели интерфейса агента. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль отображения количества заявок в Моих Сервисах в навигационной панели интерфейса агента. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль для интерфейса агента для доступа к полнотекстовому поиску из навигационной панели. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль для интерфейса агента для доступа к поиску CIC из навигационной панели. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Модуль для интерфейса агента для доступа к поиску по сохраненным шаблонам из навигационной панели. Дополнительный контроль доступа к этой возможности может осуществляться использованием ключа "Group/Группа" и Content/Содержание, например - "rw:group1;move_into:group2"',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Модуль для генерации HTML OpenSearch шаблонов для быстрого поиска заявок в интерфейсе агента.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Модуль для показа уведомлений и эскалаций (ShownMax: мак. кол-во показываемых эскалаций, EscalationInMinutes: Показать эскалированные заявки, CacheTime: Cache для вычисленных эскалаций в сек.).',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Элемент интерфейса клиента (иконка), который показывает в виде информационного блока количество заявок открытых текущим клиентом. При CustomerUserLogin, установленном в 1, поиск производится по логину клиента, а не по компании.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Элемент интерфейса клиента (иконка), который показывает в виде информационного блока количество заявок закрытых текущим клиентом. При CustomerUserLogin, установленном в 1, поиск производится по логину клиента, а не по компании.',
        'Agent interface article notification module to check PGP.' => 'Модуль уведомления для проверки PGP в интерфейсе агента.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Модуль проверки входящих emails в окне Ticket-Zoom-View если S/MIME-key доступен и верен.',
        'Agent interface article notification module to check S/MIME.' =>
            'Модуль уведомления для проверки S/MIME в интерфейсе агента.',
        'Module to define the email security options to use (PGP or S/MIME).' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'Модуль создания подписанных сообщений (PGP or S/MIME).',
        'Module to encrypt composed messages (PGP or S/MIME).' => '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Показывает кнопку для загрузки вложений при просмотре сообщений в интерфейсе агента.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Показывает пункт меню для просмотра вложений к сообщениям через html online viewer при просмотре сообщений в интерфейсе агента.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Назад" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Блокировать" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "История" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Печать" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Приоритет" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Свободные поля" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Связать" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to change the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню для изменения ответственного за заявку агента на странице просмотра заявки в интерфейсе агента. Дополнительный контроль отображения данного пункта меню может быть выполнен через ключ "Group" и его значение вида "rw:group1;move_into:group2". Для объединения пунктов меню в группу, используйте ключ "ClusterName" и в качестве его значения любое имя, которое хотите видеть в UI. Используйте "ClusterPriority", чтобы задать порядок группы пунктов в рамках панели меню.',
        'Shows a link in the menu to change the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Заметка" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to add a phone call outbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a phone call inbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Отказ" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Объединить" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "В ожидание/Отложить" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Наблюдать/Не наблюдать" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Закрыть" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "Удалить" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Показывает пункт меню "В корзину/Junk" при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием ключа "Group", где в содержании указывается перечень групп, которым эта кнопка будет доступна "rw:group1;move_into:group2". Для организации пунктов меню в группы/кластеры используйте в качестве ключа "ClusterName" и в содержании укажите то имя, которое желаете увидеть в строке меню. Используйте "ClusterPriority" для настройки порядка отображения групп/кластеров в меню.',
        'Shows link to external page in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Показать ссылку на внешнюю страницу на странице подробного просмотра заявки в интерфейсе агента. Дополнительный контроль доступа, чтобы показывать или не показывать эту ссылку, можно реализовать используя Ключ "Группа" и Содержимое "rw: group1; move_into: group2".',
        'This setting shows the sorting attributes in all overview screen, not only in queue view.' =>
            'Это параметр отображает опции сортировки во всех экранах обзора заявок, а не только в обзоре очередей.',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Задает какие атрибуты заявки агент может выбрать для сортировки в обзоре заявок в очередях.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Показывает пункт меню Блокировать / Разблокировать при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Показывает пункт меню Подробно при просмотре заявок в интерфейсе агента.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Показывает пункт меню История при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'Показывает пункт меню Приоритет при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'Показывает пункт меню Заметка при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Показывает пункт меню Закрыть при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Показывает пункт меню Сменить очередь при просмотре заявки в интерфейсе агента.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Показывает пункт меню Удалить при просмотре заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием параметра "Group", где В содержании указывается перечень групп, которым эта кнопка будет доступна ("rw:group1;move_into:group2").',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Показывает пункт меню Спам при просмотрах заявки в интерфейсе агента. Дополнительно, можно ограничить доступ к этому пункту меню, использованием параметра "Group", где в Содержании указывается перечень групп, членам которых эта кнопка будет доступна ("rw:group1;move_into:group2").',
        'Module to grant access to the owner of a ticket.' => 'Модуль предоставления прав владельцу заявки.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Модуль для предоставления прав ответственному за заявку агенту.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Необязательное ограничение прав на очереди для ResponsibleCheck модуля. Если установлено, доступ разрешен только для заявок в определенных очередях.',
        'Module to check the group permissions for the access to tickets.' =>
            'Модуль проверки прав в группах для доступа к заявкам.',
        'Module to grant access to the watcher agents of a ticket.' => 'Модуль предоставления прав агентам для наблюдения за заявкой.',
        'Module to grant access to the creator of a ticket.' => 'Модуль предоставления прав создателю заявки.',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Модуль предоставления прав любому агенту, вовлеченному в работу с заявкой в прошлом (на основании записей в истории заявки).',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to check the group permissions for customer access to tickets.' =>
            'Модуль проверки прав в группах для доступа пользователей к заявкам.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Модуль, который дает доступ, если CustomerUserID заявки соответствует CustomerUserID текущего клиента.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            '',
        'Module to grant access if the CustomerID of the customer has necessary group permissions.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Задает состав атрибутов в поле От письма (отправляемых в ответах и почтовых заявках)',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Задает разделитель между real name агента и почтовым адресом очереди.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком заявок, отложенных с напоминанием. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком эскалированных заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком новых заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком открытых заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента со статистиками по заявкам. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'MyLastChangedTickets dashboard widget.' => '\'Мои последние измененные заявки\' виджет дайджеста.',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с информацией о предстоящих событиях, отложенных с напоминанием. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком очередей. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;).  "QueuePermissionGroup" - не обязательный, очереди отображаются в списке, только если они принадлежат указанной группе, если Вы ее включили. "States" - список состояний, ключ (key) - порядок сортировки состояний в разделе. "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с календарем событий по заявкам. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. "Mandatory" определяет, будет ли раздел отображаться всегда без возможности убрать его агентами.',
        'Defines the calendar width in percent. Default is 95%.' => 'Задает ширину фрейма для Календаря в процентах. Стандартно - 95%.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Выбор очередей, заявки из которых будут отображаться в Календаре событий по заявкам в Дайджесте.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Задайте имя динамического поля для начала периода. Это поле надо создать как Тип "Заявка": "Date / Time" и активировать для экранов создания заявки и/или любого другого действия с заявкой.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Задайте имя динамического поля для конца периода. Это поле надо создать как Тип "Заявка": "Date / Time" и активировать для экранов создания заявки и/или любого другого действия с заявкой.',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Задает динамическое поле, отображаемое при событиях календаря.',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'Задает поля, которые будут отображаться для заявки в Календаре событий по заявкам. Ключ - задает поле или атрибут заявки, а Содержание - отображаемое имя.',
        'Defines if the values for filters should be retrieved from all available tickets. If enabled, only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с информацией о списке клиентов компании. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" - задает, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком заявок, отложенных с напоминанием. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком эскалированных заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком новых заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Параметры для раздела Дайджеста в интерфейсе агента с обзорным списком открытых заявок. "Limit" - число записей, отображаемых по умолчанию. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела. Примечание: только Атрибуты заявки и Дополнительные поля (DynamicField_NameX) допустимы для использования в DefaultColumns.',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметры для раздела Дайджеста  в интерфейсе агента с информацией о состоянии заявок компании клиента. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.',
        'Parameters for the dashboard backend of the customer id list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Параметры для раздела Дайджеста  в интерфейсе агента с обзорным списком компаний клиентов. "Group" используется для ограничения доступа к разделу (например, Group: admin;group1;group2;). "Default" определяет, будет ли раздел доступен по умолчанию или агент должен активировать его вручную. "CacheTTLLocal" - время обновления кэша в минутах для этого раздела.',
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
        'Parameters of the example queue attribute Comment2.' => 'Параметры для дополнительного атрибута Очереди Комментарий2(Comment2).',
        'Parameters of the example service attribute Comment2.' => 'Параметры для дополнительного атрибута Сервиса Комментарий2(Comment2).',
        'Parameters of the example SLA attribute Comment2.' => 'Параметры для дополнительного атрибута SLA  Комментарий2(Comment2).',
        'Sends customer notifications just to the mapped customer.' => '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Задает будет ли агент получать уведомления о собственных действиях.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Задает какой следующий экран открывается после создания заявки в интерфейсе клиента.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Позволяет в интерфейсе клиента установить приоритет заявки.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Задает приоритет по умолчанию для новой заявки клиента через клиентский интерфейс.',
        'Allows customers to set the ticket queue in the customer interface. If this is not enabled, QueueDefault should be configured.' =>
            'Дает возможность клиентам указывать очередь для заявки в интерфейсе клиента. Если не включено, то QueueDefault должно быть определено.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Задает очередь по умолчанию для новых заявок, создаваемых клиентом в WEB интерфейсе.',
        'Allows customers to set the ticket type in the customer interface. If this is not enabled, TicketTypeDefault should be configured.' =>
            'Дает возможность клиентам указывать тип заявки в интерфейсе клиента. Если не включено, то TicketTypeDefault должно быть определено.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Задает приоритет заявки по умолчанию для новой заявки в интерфейсе клиента.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Позволяет клиенту выбирать Сервис для заявки.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Позволяет клиенту выбирать SLA для заявки.',
        'Sets if service must be selected by the customer.' => 'Задает, что Сервис должен быть выбран клиентом.',
        'Sets if SLA must be selected by the customer.' => 'Задает, что SLA должен быть выбран клиентом.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Задает состояние по умолчанию для новых заявок в интерфейсе клиента.',
        'Sender type for new tickets from the customer inteface.' => 'Тип отправителя для новых заявок из интерфейса клиента.',
        'Defines the default history type in the customer interface.' => 'Задает тип записи истории в интерфейсе клиента.',
        'Comment for new history entries in the customer interface.' => 'Комметарий для новых записей истории в интерфейсе клиента.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "&lt;Queue&gt;" shows the names of the queues, and for SystemAddress, "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Задает список доступных очередей для новой заяаки в интерфейсе клиента.',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Модуль для выбора значения поля To в новой заявке в интерфейсе клиента.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'Задает какой следующий экран открывается после создания ответа в экране просмотра заявки в интерфейсе клиента.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Задает тип отправителя по умолчанию для заявки при ответе в интерфейсе клиента.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Задает текст в записи истории для экрана подробного просмотра заявки, в интерфейсе агента.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Задает текст комментария в записи истории для экрана подробного просмотра заявки, в интерфейсе агента.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Позволяет в интерфейсе клиента изменить приоритет заявки.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Задает приоритет по умолчанию при ответе клиента через клиентский интерфейс.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Позволяет отобразить в интерфейсе клиента возможность выбора следующего состояния заявки при ответе.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Задает следующее состояние по умолчанию для заявки, после ответа клиентом на сообщение или дополнение к заявке в интерфейсе клиента  .',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Задает список следующих доступных состояний для заявок клиента в интерфейсе клиента.',
        'Shows the enabled ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Показывать доступные атрибуты заявки в интерфейсе клиента (0 = Не доступен и 1 = Доступен).',
        'Defines the length of the article preview in the customer interface.' =>
            '',
        'Defines the displayed style of the From field in notes that are visible for customers. A default agent name can be defined in Ticket::Frontend::CustomerTicketZoom###DefaultAgentName setting.' =>
            '',
        'Defines the default agent name in the ticket zoom view of the customer interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Максимальное количество заявок отображаемых в результате поиска в интерфейсе клиента.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Количество заявок которое показывается на каждой странице при выводе результатов поиска в интерфейсе клиента.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Задает атрибут заявки по умолчанию для сортировки заявок при поиске в интерфейсе клиента.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Задает стандартный порядок сортировки в результатах поиска в интерфейсе клиента. Up: старые вверху. Down: новые вверху.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Если включено, клиент может производить поиск заявок во всех Сервисах (в зависимости от того, какие Сервисы назначены клиенту).',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Задать все параметры для объекта "Заявок на страницу" в личных настройках в интерфейсе клиента',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Задать все параметры для объекта "Интервал обновления" в личных настройках в интерфейсе клиента',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Задает модуль по умолчанию, если никакой параметр Action (в url)не указан в интерфейсе агента.',
        'Default queue ID used by the system in the agent interface.' => 'ID очереди по умолчанию используемый в системе в интерфейсе агента.',
        'Default ticket ID used by the system in the agent interface.' =>
            'TicketID по умолчанию, для использования в интерфейсе агента.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Задает модуль по умолчанию, если никакой параметр Action (в url)не указан в интерфейсе клиента.',
        'Default ticket ID used by the system in the customer interface.' =>
            'TicketID по умолчанию, для использования в интерфейсе клиента.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Модуль для генерации HTML OpenSearch шаблонов для быстрого поиска заявок в интерфейсе клиента.',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Задает какой следующий экран открывается после перемещения заявки. LastScreenOverview - возвращает к последнему экрану обзора )т.е. экран результата поиска, просмотру очередей, дайджесту). TicketZoom - возвращает в просмотр заявки.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Устанавливает Тему по умолчанию для сообщений при перемещении заявок в интерфейсе агента.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Устанавливает текст сообщения по умолчанию при перемещении заявки в другую очередь в интерфейсе агента.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Задает предельное количество заявок, обрабатываемых за один запуск задания Планировщика.',
        'Allows generic agent to execute custom modules.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Разблокирует заявку всякий раз, когда добавляется новое сообщение к заявке и владелец установил состояние - вне офиса.',
        'Include unknown customers in ticket filter.' => 'Включать неизвестных клиентов в фильтр заявок.',
        'List of all ticket events to be displayed in the GUI.' => 'Список всех событий, для заявок, отображаемых в интерфейсе.',
        'List of all article events to be displayed in the GUI.' => 'Список всех событий для сообщений/заметок, отображаемых в интерфейсе.',
        'List of all queue events to be displayed in the GUI.' => 'Список всех событий, для очередей, отображаемых в интерфейсе.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Модуль обработки события, который выполняет команду обновления для TicketIndex для переименования очереди, если необходимо, и если используется StaticDB.',
        'Ignores not ticket related attributes.' => '',
        'Transport selection for ticket notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ACL модуль, который позволяет закрывать родительские заявки только после того как все младшие закрыты ("State" задает доступные состояния для родительских заявок до закрытия всех младших',
        'Default ACL values for ticket actions.' => 'Стандартные значения ACL для действий по заявке.',
        'Defines which items are available in first level of the ACL structure.' =>
            'Задает, какие элементы доступны на первом уровне структуры ACL.',
        'Defines which items are available in second level of the ACL structure.' =>
            'Задает, какие элементы доступны на втором уровне структуры ACL.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Задает, какие элементы доступны для "Action" на третьем уровне структуры ACL.',
        'Cache time in seconds for the DB ACL backend.' => 'Cache time, в сек, для DB ACL backend.',
        'If enabled debugging information for ACLs is logged.' => 'Включить журналирование отладки ACL.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Максимальное количество почтовых автоответов на собственный почтовый адрес в день (Loop-Protection).',
        'Maximal auto email responses to own email-address a day, configurable by email address (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Максимальный размер в KBytes для писем принимаемых через POP3/POP3S/IMAP/IMAPS.',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Максимальное количество писем, получаемых за одно подключение к серверу.',
        'Default loop protection module.' => 'Стандартный модуль защиты от зацикливания.',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Путь к лог файлу (применяется только если выбран атрибут "FS" для LoopProtectionModule и он обязателен).',
        'Converts HTML mails into text messages.' => 'Преобразовать письмо из HTML в текст',
        'Specifies user id of the postmaster data base.' => 'Задает user id БД postmaster.',
        'Defines the postmaster default queue.' => 'Задает очередь по умолчанию для postmaster.',
        'Defines the default priority of new tickets.' => 'Задает приоритет по умолчанию для новых заявок.',
        'Defines the default state of new tickets.' => 'Задает состояние по умолчанию для новых заявок',
        'Defines the state of a ticket if it gets a follow-up.' => 'Задает состояние заявки при получении ответа клиента',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Задает новое состояние заявки при получении ответа клиента, когда заявка была уже закрыта',
        'Defines the PostMaster header to be used on the filter for keeping the current state of the ticket.' =>
            'Задает PostMaster заголовок, используемый при фильтрации для получения текущего состояния заявки.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Отправлять уведомления агентам об откликах только владельцу, если заявка разблокирована (по умолчанию уведомляются все агенты).',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Задает количество полей заголовков для добавления или обновления postmaster фильтров. Можно указать до 99 полей.',
        'Indicates if a bounce e-mail should always be treated as normal follow-up.' =>
            '',
        'Defines all the X-headers that should be scanned.' => 'Задать все X-headers, которые должны проверяться.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Модуль фильтрации и управления входящими сообщениями. Блокировать/Игнорировать весь спам от отправителей: noreply@ address.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From =&gt; \'(.+?)@.+?\', and use () as [***] in Set =&gt;.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Блокирует все входящие письма, не содержащие в поле Тема правильного номера заявки и имеющих в поле From(от): @example.com',
        'Defines the sender for rejected emails.' => 'Задает отправителя для отвергнутых заявок.',
        'Defines the subject for rejected emails.' => 'Задает текст поля Тема для отвергнутых заявок',
        'Defines the body text for rejected emails.' => 'Задает содержание сообщения для отвергнутых писем',
        'Module to use database filter storage.' => '',
        'Module to check if arrived emails should be marked as internal (because of original forwarded internal email). IsVisibleForCustomer and SenderType define the values for the arrived email/article.' =>
            '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number. Note: the first capturing group from the \'NumberRegExp\' expression will be used as the ticket number value.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => 'Модуль для фильтрации зашифрованных тел во входящих сообщениях.',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'Модуль для извлечения клиентами SMIME-сертификатов входящих сообщений.',
        'Module to check if a incoming e-mail message is bounce.' => '',
        'Module used to detect if attachments are present.' => '',
        'Executes follow-up checks on Znuny Header \'X-OTRS-Bounce\'.' =>
            '',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Проверяет, является ли письмо дополнением к существующей заявке путем поиска в теме письма правильного номера заявки.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'Выполняет проверку ответа клиента в In-Reply-To или References заголовках для писем, не содержащих в Теме номер заявки.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'Выполняет проверку тела сообщения в почтовых ответах клиента, не имеющих в Теме номер заявки.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'Выполняет проверку вложения к почтовым ответам клиента, не имеющим в Теме номера заявки.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'Выполняет проверку тела сообщения в исходном формате/raw в почтовых ответах клиента, не имеющих в Теме номер заявки.',
        'Checks if an email is a follow-up to an existing ticket with external ticket number which can be found by ExternalTicketNumberRecognition filter module.' =>
            '',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            'Управляет автоматическим присвоением CustomerID из адреса отправителя для незарегистрированных пользователей.',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Если это регулярное выражение верно, автоответ не будет посылаться.',
        'If this option is enabled, tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is not enabled, no autoresponses will be sent.' =>
            '',
        'Links 2 tickets with a "Normal" type link.' => 'Связывает 2 заявки связью типа "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Связывает 2 заявки связью типа "ParentChild".',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Задает, какие заявки с какими типами состояний не будут отображаться в списках связанных заявок.',
        'For these state types the ticket numbers are striked through in the link table.' =>
            '',
        'Module to generate ticket statistics.' => 'Модуль для формирования статистки по заявкам.',
        'Determines if the statistics module may generate ticket lists.' =>
            'Задает, может ли модуль статистки создавать список заявок.',
        'Module to generate accounted time ticket statistics.' => 'Модуль для формирования статистки о затраченном времени по заявкам.',
        'Module to generate ticket solution and response time statistics.' =>
            'Модуль для формирования статистки по времени реакции и разрешения заявки.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Задает высоту (в пикселах) по умолчанию для inline HTML сообщений в AgentTicketZoom.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Задает максимальную высоту (в пикселах) для inline HTML сообщений в AgentTicketZoom.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'Максимальное количество раскрытых сообщений/заметок отображаемых на одном экране в AgentTicketZoom.',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Максимальное количество сообщений/заметок отображаемых на одном экране в AgentTicketZoom.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Показывает сообщение как rich text даже если применение rich text отключено.',
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
            'Динамические поля, отображаемые на экране ответственного за заявки в интерфейсе агента.',
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
            'Виджет в AgentTicketZoom отображающий данные заявки  в боковой панели. ',
        'AgentTicketZoom widget that displays customer information for the ticket in the side bar.' =>
            'Виджет в AgentTicketZoom отображающий информацию о пользователе  в боковой панели. ',
        'AgentTicketZoom widget that displays a table of objects linked to the ticket.' =>
            'Виджет в AgentTicketZoom отображающий таблицу объектов связанных с заявкой.',
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
            'Выберите атрибут по умолчанию для показа на экране поискового запроса. Пример: "Ключ" должен содержать имя динамического поля в этом случае \'X\', "Содержание" значение динамического поля в зависимости от его типа,  Текст: \'текст\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' и или \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Динамические поля, используемые при экспортировании результатов поиска в формат CSV.',
        'Dynamic fields shown in the ticket search screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (https://doc.znuny.org/manual/developer/), chapter "Ticket Event Module".' =>
            'Задает настройки TicketDynamicField по умолчанию. "Name/Имя" задает поле, которое будет использоваться, "Value/Значение" - данные которые будут заданы и "Event/Событие" определяет событие триггера. Подробнее, смотрите в руководстве разработчика (https://doc.znuny.org/manual/developer/), раздел "Ticket Event Module".',
        'Defines the list of types for templates.' => 'Задает список типов для шаблонов',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Список по умолчанию для Стандартных Шаблонов, которые назначаются автоматически при создании новой очереди.',
        'General ticket data shown in the ticket overviews (fall-back). Note that TicketNumber can not be disabled, because it is necessary.' =>
            '',
        'Columns that can be filtered in the status view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре заявок по статусам в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the queue view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре очередей заявок в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the responsible view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре заявок ответственных в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the watch view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре наблюдаемых заявок в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the locked view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре заблокированных заявок в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the escalation view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре эскалированных заявок в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре результата поиска заявок по сервисам в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Columns that can be filtered in the service view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Колонки, по которым доступна фильтрация при просмотре заявок по сервисам в интерфейсе агента. Внимание: Только атрибуты заявки и динамические поля (DynamicField_Имя поляX), а также атрибуты Клиента (например, CustomerUserPhone, CustomerCompanyName, ...) разрешены.',
        'Frontend module registration (disable AgentTicketService link if Ticket Service feature is not used).' =>
            '',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Способ отображения по умолчанию имен получателей (To,Cc) в AgentTicketZoom и CustomerTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Способ отображения по умолчанию имени отправителя  (From) в AgentTicketZoom и CustomerTicketZoom.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Задает, какие колонки отображаются в виджете связанных заявок (LinkObject::ViewMode = "complex"). Внимание: только атрибуты заявки и динамических полей (DynamicField_NameX) разрешены для DefaultColumns/Колонки по умолчанию. Возможные значения: 0 = Отключено, 1 = Включено, 2 = Включено по умолчанию.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'Собирать или нет мета информацию из заметок, используя фильтры заданные в Ticket::Frontend::ZoomCollectMetaFilters.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'Определяет фильтр для сбора CVE номеров из текста статей в AgentTicketZoom. Результаты будут отображаться в мета-блоке следом за статьей. Заполните URLPreview, если вы хотите отобразить предварительный просмотр, перемещая курсор мыши над элементом ссылки. Это может быть тот же URL-адрес, что и в URL или какой-либо альтернативный. Обратите внимание, что некоторые веб-сайты запрещают отображение в iframe (например, Google) и, следовательно, режим предварительного просмотра работать не будет.',
        'Sets the default link type of split tickets in the agent interface.' =>
            'Установливает тип связи по умолчанию при разделении заявок в интерфейсе агента.',
        'Defines available article actions for Internal articles.' => 'Задает список допустимых действий с внутренними сообщениями/заметками.',
        'Defines available article actions for Phone articles.' => 'Задает список допустимых действий с телефонными сообщениями.',
        'Defines available article actions for Email articles.' => 'Задает список допустимых действий с почтовыми сообщениями.',
        'Defines available article actions for invalid articles.' => 'Задает список допустимых действий с недействительными сообщениями.',
        'Disables the redirection to the last screen overview / dashboard after a ticket is closed.' =>
            'Отключить перенаправление на страницу последнего просмотренного обзора / Дайджеста после закрытия заявки.',
        'Defines the default queue for new tickets in the agent interface.' =>
            'Задает очередь по умолчанию для новых заявок, создаваемых в интерфейсе агента.',

        # XML Definition: Kernel/Config/Files/XML/Znuny.xml
        'Default preferences to set during user creation.' => '',
        'Enables/disables the Znuny package verification. If disabled, all packages are shown as verified. It\'s still recommended to use only verified packages.' =>
            '',
        'Screens for which it is possible to enable or disable dynamic fields.' =>
            '',
        'Screens for which it is possible to enable or disable default columns.' =>
            '',
        'Enables historical values for selection in dynamic field types that are based on BaseSelect (Dropdown and Multiselect). Disable this if there are performance problems because of too many different stored values.' =>
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
        'Registers a user preferences module for LastViewsLimit.' => 'Регистрирует модуль пользовательских настроек для LastViewsLimit.',
        'Registers a user preferences module for LastViewsPosition.' => 'Регистрирует модуль пользовательских настроек для LastViewsPosition.',
        'Registers a user preferences module for LastViewsType.' => 'Регистрирует модуль пользовательских настроек для LastViewsType.',
        'Pre-application module to store the current view.' => '',
        'Domains accessed through WebUserAgent module for which no proxy should be used. Separate domains by semicolon.' =>
            '',
        'User agent string to use for the WebUserAgent module. Leave empty to use the default user agent string.' =>
            '',
        'Agent recipient information which will be passed to the web service.' =>
            'Информация об агенте-получателе, которая будет передана веб сервису.',
        'Customer recipient information which will be passed to the web service.' =>
            '',
        'Parameter name for additional recipients.' => '',
        'Shows only valid dynamic fields in screen configuration (AdminDynamicFieldScreenConfiguration) if enabled.' =>
            '',
        'Shows only valid dynamic fields in dynamic field export selection (AdminDynamicFieldConfigurationImportExport) if enabled.' =>
            'Показывать только действительные динамические поля при выборе полей для экспорта (AdminDynamicFieldConfigurationImportExport), если включено.',
        'Config keys and their action to activate dynamic fields in different screens, grouped by object type.' =>
            '',
        'Dynamic field screen config keys and their action for all screens that don\'t allow dynamic fields to be mandatory.' =>
            '',
        'Frontend module registration for the admin interface.' => '',
        'The user\'s Mattermost username.' => '',
        'Loader module registration for the admin interface.' => '',
        'Adds ticket attribute relations based on CSV/Excel data.' => 'Добавить связи свойств заявки, основанные на CSV/Excel данных.',
        'Available/allowed actions for ticket attribute relations.' => 'Доступные/разрешенные действия для связей свойств заявки.',
        'Always adds empty values to the ticket attribute relations so that it is not needed to add them to the CSV/Excel data.' =>
            'Всегда добавлять пустые значения в связи свойств заявки, чтобы не было необходимости добавлять их в CSV/Excel данные.',
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
            'Отображать уведомления для отсутствующих и истекших OAuth2 ключах (tokens).',
        'Authentication type for sendmail module. If \'OAuth2 token\' has been selected, SendmailModule::OAuth2TokenConfigName must also be configured.' =>
            'Тип авторизации для модуля отсылки почтовых сообщений. Если \'OAuth2 ключ (token)\' был выбран, SendmailModule::OAuth2TokenConfigName также должен быть настроен.',
        'Name of the OAuth2 token configuration to use for sending mails if \'OAuth2 token\' was configured in SendmailModule::AuthenticationType.' =>
            'Имя конфигурации OAuth2 ключа (token) для использования при отсылке почтовых сообщений, если \'OAuth2 ключ (token)\' был выбран в SendmailModule::AuthenticationType.',
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
            'Модуль уведомления в интерфейсе агента, показывающий число заявок, владельцем которых является агент. Дополнительный контроль доступа, ограничивающий отображение этой ссылки, может быть выполнен используя ключ "Group" и значение вида "rw:group1;move_into:group2".',
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
        'Do not verify the signer\'s certificate of a signed message.' =>
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
            'Список цветов в шестнадцатеричном RGB доступных для выбора. Убедитесь при выборе, что цвет фона достаточно темный, чтобы белый текст был на нем виден/читаем.',
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
            'Активирует выбор, если в этой исходной заявке должна быть создана заметка на NoteToLinkedTicket экране.',
        'Defines the default value if a note in NoteToLinkedTicket screen should be created in this origin ticket.' =>
            '',
        'Sets the default subject for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            '',
        'Allows adding notes in the NoteToLinkedTicket screen of the agent interface.' =>
            'Разрешает добавлять заметки на экране NoteToLinkedTicket в интерфейсе агента.',
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
            'Задает ответственного за заявку на странице NoteToLinkedTicket в интерфейсе агента.',
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
            'Определяет параметры конфигурации, доступные в персональных настройках. Если сотрудник не выберет значение, он будет перенаправлен на URL-адрес страницы по умолчанию, заданный \'MarkTicketUnseenRedirectDefaultURL\' параметром системной конфигурации.',
        'Defines the redirect URL for setting a ticket article to \'unseen\'.' =>
            'Определяет URL-адрес страницы для отметки сообщения заявки как \'непрочитанное\'.',
        'Defines the config parameters available in the preferences view. The default redirect URL from SysConfig \'MarkTicketSeenRedirectDefaultURL\' is used if no selection is made by the agent.' =>
            'Определяет параметры конфигурации, доступные в персональных настройках. Если сотрудник не выберет значение, он будет перенаправлен на URL-адрес страницы по умолчанию, заданный \'MarkTicketSeenRedirectDefaultURL\' параметром системной конфигурации.',
        'Defines the redirect URL for setting a ticket article to \'seen\'.' =>
            'Определяет URL-адрес страницы для отметки сообщения заявки как \'прочитанное\'.',
        'Registers a link in the ticket menu to mark a ticket as unseen.' =>
            'Регистрирует ссылку в меню заявки для отметки заявки как непрочитанной.',
        'Registers a link in the ticket menu to mark a ticket as seen.' =>
            'Регистрирует ссылку в меню заявки для отметки заявки как прочитанной.',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as unseen.' =>
            'Регистрирует ссылку в меню заявки в обзоре заявок для отметки всех сообщений заявки как непрочитанные.',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as seen.' =>
            'Регистрирует ссылку в меню заявки в обзоре заявок для отметки всех сообщений заявки как прочитанные.',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "agent".' =>
            '',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "system".' =>
            '',
        'Adds the field mapping for AgentTicketActionCommon for an unknown action. Used by Znuny.Form.Input.' =>
            '',

        # XML Definition: scripts/database/initial_insert.xml
        'invalid-temporarily' => 'временно недействительный',
        'Group for default access.' => 'Группа доступа по умолчанию.',
        'Group of all administrators.' => 'Группа для всех администраторов.',
        'Group for statistics access.' => 'Группа для доступа к отчетам.',
        'Group for time accounting web service access.' => '',
        'new' => 'новая',
        'All new state types (default: viewable).' => 'Все новые типы состояний (по умолчанию: для просмотра).',
        'open' => 'открыта',
        'All open state types (default: viewable).' => 'Все типы состояний "открыта" (по умолчанию: для просмотра).',
        'closed' => 'закрыта',
        'All closed state types (default: not viewable).' => 'Все типы состояний "закрыта" (по умолчанию: для просмотра).',
        'pending reminder' => 'ожидает напоминания',
        'All \'pending reminder\' state types (default: viewable).' => 'Все типы состояний "ожидает напоминания" (по умолчанию: для просмотра).',
        'pending auto' => 'ожидает автозакрытия',
        'All \'pending auto *\' state types (default: viewable).' => 'Все типы состояний "ожидает авто*" (по умолчанию: для просмотра).',
        'removed' => 'удаленная',
        'All \'removed\' state types (default: not viewable).' => 'Все типы состояний "удалена" (по умолчанию: для просмотра).',
        'merged' => 'объединенные',
        'State type for merged tickets (default: not viewable).' => 'Все типы состояний "объединена" (по умолчанию: для просмотра).',
        'New ticket created by customer.' => 'Новая заявка созданная клиентом',
        'closed successful' => 'закрыта успешно',
        'Ticket is closed successful.' => 'Заявка закрыта успешно.',
        'closed unsuccessful' => 'закрыта неуспешно',
        'Ticket is closed unsuccessful.' => 'Заявка закрыта не успешно.',
        'Open tickets.' => 'Открытые заявки.',
        'Customer removed ticket.' => 'Заявка удаленная клиентом.',
        'Ticket is pending for agent reminder.' => 'Заявка ожидает напоминания агенту.',
        'pending auto close+' => 'ожидает автозакрытия(+)',
        'Ticket is pending for automatic close.' => 'Заявка ожидает автозакрытия.',
        'pending auto close-' => 'ожидает автозакрытия(-)',
        'State for merged tickets.' => 'Состояние для объединённых заявок.',
        'system standard salutation (en)' => 'стандартное приветствие системы (ru)',
        'Standard Salutation.' => 'Стандартное приветствие.',
        'system standard signature (en)' => 'стандартная подпись системы (ru)',
        'Standard Signature.' => 'Стандартная подпись.',
        'Standard Address.' => 'Стандартный адрес.',
        'possible' => 'разрешено',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Последующие обращения по закрытым заявкам разрешены. Заявка будет открыта заново.',
        'reject' => 'запрещено',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Последующие обращения по закрытым заявкам запрещены. Заявка создаваться не будет.',
        'new ticket' => 'новая заявка',
        'Follow-ups for closed tickets are not possible. A new ticket will be created.' =>
            'Последующие обращения по закрытым заявкам запрещены. Будет создана новая заявка.',
        'Postmaster queue.' => 'Очередь Postmaster.',
        'All default incoming tickets.' => 'По умолчанию все входящие заявки.',
        'All junk tickets.' => 'Все "мусорные" заявки.',
        'All misc tickets.' => 'Все прочие заявки.',
        'auto reply' => 'автоответ',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Автоматический ответ, который будет выслан после создания новой заявки.',
        'auto reject' => 'автоотказ',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Автоматический отказ, который будет выслан после того, как дополнение будет отвергнуто (если установлена опция для очереди "отвергнуть" дополнения)',
        'auto follow up' => 'автоотклик',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Автоматическое подтверждение, которое высылается после получения дополнения к заявке (если для очереди установлена возможность получения дополнений).',
        'auto reply/new ticket' => 'авто-ответ/новая заявка',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Автоматический ответ, который высылается после того как дополнение было отвергнуто и была создана новая заявка (в случае, когда для очереди установлено "новая заявка").',
        'auto remove' => 'авто-удаление',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Сообщение об автоудалении будет выслано после того как клиент удалит запрос.',
        'default reply (after new ticket has been created)' => 'Стандартный ответ (после создания новой заявки)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'стандартный отказ (после получения дополнения и отказа для закрытой заявки)',
        'default follow-up (after a ticket follow-up has been added)' => 'стандартное сообщение о дополнении (после добавления дополнения к заявке)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'Стандартное сообщение об отказе/создании новой заявки (после закрытия дополнения и создания новой заявки)',
        'Unclassified' => 'Неклассифицировано',
        '1 very low' => '1 very low - очень низкая',
        '2 low' => '2 low - низкая',
        '3 normal' => '3 normal - нормальная',
        '4 high' => '4 high - высокая',
        '5 very high' => '5 very high - очень высокая',
        'unlock' => 'разблокировано',
        'lock' => 'заблокировано',
        'tmp_lock' => 'временно заблокировано',
        'agent' => 'агент',
        'system' => 'система',
        'customer' => 'клиент',
        'Ticket create notification' => 'Уведомление о создании заявки',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Вы будете получать уведомление всякий раз при создании новой заявки в Вашей очереди из "Мои очереди" или "Мои Сервисы".',
        'Ticket follow-up notification (unlocked)' => 'Уведомление об ответе по заявке (для разблокированных)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Вы будете получать уведомление всякий раз когда клиент посылает дополнение к разблокированной заявке в "Моих очередях" или "Моих Сервисах".',
        'Ticket follow-up notification (locked)' => 'Уведомление об ответе по заявке (для заблокированных)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Вы будете получать уведомление, когда клиент посылает дополнение к заблокированной заявке, для которой вы являетесь Владельцем или Ответственным.',
        'Ticket lock timeout notification' => 'Уведомление об истечении срока блокировки заявки системой',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Вы будете получать уведомление как только заявка, владельцем которой вы являетесь - будет автоматически разблокирована.',
        'Ticket owner update notification' => 'Уведомление об изменении владельца заявки',
        'Ticket responsible update notification' => 'Уведомление об изменении ответственного за заявку',
        'Ticket new note notification' => 'Уведомление о новой заметке в заявке',
        'Ticket queue update notification' => 'Уведомление об изменении очереди заявки',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Вы будете получать уведомление, если заявка будет перенесена в одну из Ваших очередей из "Мои Очереди".',
        'Ticket pending reminder notification (locked)' => 'Уведомление об истечении времени напоминания по заявке (для заблокированных)',
        'Ticket pending reminder notification (unlocked)' => 'Уведомление об истечении времени напоминания по заявке (для разблокированных)',
        'Ticket escalation notification' => 'Уведомление об эскалации заявки',
        'Ticket escalation warning notification' => 'Уведомление о предупреждении по эскалации заявки',
        'Ticket service update notification' => 'Уведомление об изменении сервиса заявки',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'Вы будете получать уведомление всякий раз, когда сервис заявки будет изменен на один из ваших "Моих Сервисов".',
        'Appointment reminder notification' => 'Уведомление о напоминании о мероприятии',
        'You will receive a notification each time a reminder time is reached for one of your appointments.' =>
            'Вы будете получать уведомление всякий раз, когда наступит срок напоминания по одному из Ваших мероприятий.',
        'Ticket email delivery failure notification' => 'Уведомление об отказе доставки электронной почты заявки',
        'Mention notification' => '',

        # JS File: var/httpd/htdocs/js/Core.AJAX.js
        'Error during AJAX communication. Status: %s, Error: %s' => 'Ошибка во время связи AJAX. Статус: %s, Ошибка: %s',
        'This window must be called from compose window.' => 'Это окно нужно вызвать из окна компоновки.',

        # JS File: var/httpd/htdocs/js/Core.Activity.js
        'An error occurred' => '',
        'The activity could not be created. %s is needed.' => '',
        'The activity could not be created.' => '',
        'The activity could not be updated.' => '',
        'The activity could not be deleted.' => '',
        'The activity could not be marked as new.' => '',
        'The activity could not be marked as seen.' => 'Активность не может быть помечена как прочитанная.',
        'The activities could not be marked as seen.' => 'Активности не могут быть помечены как прочитанные.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ACL.js
        'Add all' => 'Добавить все. После добавления вы можете изменить статус элемента нажав на пометку справа',
        'An item with this name is already present.' => 'Элемент с таким именем уже существует',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Этот элемент содержит подэлементы. Вы уверены что желаете удалить его, включая его подэлементы?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.AppointmentCalendar.Manage.js
        'Press Ctrl+C (Cmd+C) to copy to clipboard' => 'Нажмите Ctrl+C (Cmd+C) для копирования в буфер обмена',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Attachment.js
        'Delete this Attachment' => 'Удалить это вложение',
        'Deleting attachment...' => 'Удаление вложения...',
        'There was an error deleting the attachment. Please check the logs for more information.' =>
            'Произошла ошибка при удалении вложения. Подробности в лог-файле.',
        'Attachment was deleted successfully.' => 'Вложение успешно удалено.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.DynamicField.js
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Вы действительно хотите удалить это динамическое поле? ВСЕ связанные с ним данные будут ПОТЕРЯНЫ!',
        'Delete field' => 'Удалить поле',
        'Deleting the field and its data. This may take a while...' => 'Удаление поля и связанных данных. Это может занять некоторое время...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericAgent.js
        'Remove this dynamic field' => '',
        'Remove selection' => 'Удалить выбор',
        'An error occurred during communication.' => 'Ошибка при попытке связи.',
        'Duplicate event.' => 'Дублировать событие.',
        'This event is already attached to the job, Please use a different one.' =>
            'Это событие уже назначено задаче. Выберите другое.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceDebugger.js
        'Request Details' => 'Детали запроса (Request)',
        'Request Details for Communication ID' => 'Запросить детализацию для Communication ID',
        'Show or hide the content.' => 'Показать или убрать содержимое.',
        'Clear debug log' => 'Очистить журнал отладки',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceErrorHandling.js
        'Delete error handling module' => 'Удалить модуль обработки ошибок ',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvoker.js
        'It is not possible to add a new event trigger because the event is not set.' =>
            '',
        'Delete this Invoker' => 'Удалить этот Invoker',
        'Delete this Event Trigger' => 'Удалить этот Триггер События',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvokerEvent.js
        'Sorry, the only existing condition can\'t be removed.' => 'Извините, единственное существующее условие не может быть удалено.',
        'Sorry, the only existing field can\'t be removed.' => 'Извините, единственное существующее поле не может быть удалено.',
        'Delete conditions' => 'Удалить условия',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceMapping.js
        'Mapping for Key %s' => 'Мапинг для ключа %s',
        'Mapping for Key' => 'Мапинг для ключа',
        'Delete this Key Mapping' => 'Удалить этот мапинг ключа',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceOperation.js
        'Delete this Operation' => 'Удалить эту операцию',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceWebservice.js
        'Clone web service' => 'Клонировать веб-сервис',
        'Delete operation' => 'Удалить операцию',
        'Delete invoker' => 'Удалить invoker',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Group.js
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'ВНИМАНИЕ! Если вы измените имя группы \'admin\' до того, как поменяете название этой группы конфигурации системы, у вас не будет прав доступа на панель администрирования. Если это произошло, верните прежнее название группы (admin) вручную командой SQL.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js
        'Delete this Mail Account' => 'Удалить эту учетную запись почты',
        'Deleting the mail account and its data. This may take a while...' =>
            'Удаление почтового аккаунта и связанных данных. Это может занять некоторое время...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.NotificationEvent.js
        'Do you really want to delete this notification language?' => 'Вы действительно желаете удалить этот язык для уведомлений?',
        'Do you really want to delete this notification?' => 'Вы действительно хотите удалить это уведомление?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.OAuth2TokenManagement.js
        'Do you really want to delete this token and its configuration?' =>
            'Вы действительно хотите удалить этот ключ (token) и его конфигурацию?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PGP.js
        'Do you really want to delete this key?' => 'Вы действительно хотите удалить этот ключ?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PackageManager.js
        'There is a package upgrade process running, click here to see status information about the upgrade progress.' =>
            'Выполняется процесс обновления пакета, нажмите здесь, чтобы просмотреть информацию о состоянии обновления.',
        'A package upgrade was recently finished. Click here to see the results.' =>
            'Обновление пакета завершено. Нажмите здесь, чтобы посмотреть результаты.',
        'No response from get package upgrade result.' => '',
        'Update all packages' => 'Обновить все пакеты',
        'Dismiss' => 'Отклонить',
        'Update All Packages' => 'Обновить все пакеты',
        'No response from package upgrade all.' => '',
        'Currently not possible' => 'В настоящий момент невозможно',
        'This is currently disabled because of an ongoing package upgrade.' =>
            'В настоящее время это отключено из-за идущего процесса обновления пакета.',
        'This option is currently disabled because the Znuny Daemon is not running.' =>
            'Эта возможность в настоящее время отключена т.к. Znuny Daemon не запущен.',
        'Are you sure you want to update all installed packages?' => 'Вы уверены, что желаете обновить все установленные пакеты?',
        'No response from get package upgrade run status.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PostMasterFilter.js
        'Delete this PostMasterFilter' => 'Удалить этот PostMasterFilter',
        'Deleting the postmaster filter and its data. This may take a while...' =>
            'Удаление postmaster фильтра и его данных. Это может занять некоторое время...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.Canvas.js
        'Remove Entity from canvas' => 'Удалить Entity со схемы',
        'No TransitionActions assigned.' => 'Не назначено ни одного Действия Перехода.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Не назначено Диалога. Просто перетащите Диалог Активности из списка слева и поместите его сюда.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Эту Активность нельзя удалить, т.к. она первая.',
        'Remove the Transition from this Process' => 'Удалить Переход из этого Процесса',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.js
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'После использования этой кнопки или ссылки, вы можете выйти с этого экрана и его текущее состояние будет сохранено автоматически. Желаете продолжить?',
        'Delete Entity' => 'Удалить Entity/Объект',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Эта Активность уже используется в этом Процессе. Ее нельзя использовать дважды!',
        'Error during AJAX communication' => 'Ошибка во время связи AJAX ',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Не связанные Переходы есть на схеме. Соедините их до помещения на схему нового(следующего).',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Этот Переход уже используется для этой Активности. Его нельзя использовать дважды!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Это Действие Перехода уже используется на этой Схеме. Его нельзя использовать дважды!',
        'Hide EntityIDs' => 'Скрыть EntityIDs',
        'Edit Field Details' => 'Редактировать атрибуты поля',
        'Customer interface does not support articles not visible for customers.' =>
            'Интерфейс клиента не поддерживает сообщения невидимые клиентам.',
        'Sorry, the only existing parameter can\'t be removed.' => 'Извините, единственный существующий параметр не может быть удален.',
        'Are you sure you want to overwrite the config parameters?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SMIME.js
        'Do you really want to delete this certificate?' => 'Вы действительно хотите удалить этот сертификат?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SupportDataCollector.js
        'Generating...' => 'Выполняется...',
        'It was not possible to generate the Support Bundle.' => 'Не удалось сгенерировать Пакет поддержки/ Support Bundle.',
        'Generate Result' => 'Результат генерации',
        'Support Bundle' => 'Пакет поддержки',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SysConfig.Entity.js
        'It is not possible to set this entry to invalid. All affected configuration settings have to be changed beforehand.' =>
            'Невозможно аннулировать эту запись. Все настройки конфигурации должны быть изменены заранее.',
        'Cannot proceed' => 'Не удается продолжить',
        'Update manually' => 'Обновите вручную',
        'You can either have the affected settings updated automatically to reflect the changes you just made or do it on your own by pressing \'update manually\'.' =>
            'Вы можете либо автоматически изменять затронутые параметры, чтобы отразить изменения, которые Вы только что сделали, либо сделать это самостоятельно, нажав \'обновить вручную\'.',
        'Save and update automatically' => 'Сохранить и обновить автоматически',
        'Don\'t save, update manually' => 'Не сохранять, обновить вручную',
        'The item you\'re currently viewing is part of a not-yet-deployed configuration setting, which makes it impossible to edit it in its current state. Please wait until the setting has been deployed. If you\'re unsure what to do next, please contact your system administrator.' =>
            'Элемент, который вы просматриваете в данный момент, является частью еще не сохраненного параметра конфигурации, что делает невозможным его редактирование в текущем состоянии. Подождите, пока настройка не будет применена. Если вы не знаете, что делать дальше, обратитесь к системному администратору.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemConfiguration.js
        'Loading...' => 'Загрузка...',
        'Search the System Configuration' => 'Поиск в Конфигурации системы',
        'Please enter at least one search word to find anything.' => 'Для поиска введите хотя бы одно слово.',
        'Unfortunately deploying is currently not possible, maybe because another agent is already deploying. Please try again later.' =>
            'К сожалению, сохранение в настоящий момент невозможно, возможно, это связано с тем, что другой агент уже работает с настройками. Попробуйте, пожалуйста, позже.',
        'Deploy' => 'Применить',
        'The deployment is already running.' => 'Процесс применения уже идет.',
        'Deployment successful. You\'re being redirected...' => 'Применение завершено успешно. Вы будете перенаправлены...',
        'There was an error. Please save all settings you are editing and check the logs for more information.' =>
            'Произошла ошибка. Сохраните все настройки, которые вы изменяли и проверьте логи для большей информации.',
        'Reset option is required!' => 'Требуется отменить!',
        'By restoring this deployment all settings will be reverted to the value they had at the time of the deployment. Do you really want to continue?' =>
            'При восстановлении этого применения, все настройки будут возвращены до значения, которое они имели во время него. Вы действительно хотите продолжить?',
        'Keys with values can\'t be renamed. Please remove this key/value pair instead and re-add it afterwards.' =>
            'Ключи со значениями нельзя переименовать. Удалите эту пару ключ / значение и повторно добавьте ее заново.',
        'Unlock setting.' => 'Разблокировать настройку.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemMaintenance.js
        'Do you really want to delete this scheduled system maintenance?' =>
            'Вы действительно хотите удалить этот график техобслуживания?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Template.js
        'Delete this Template' => 'Удалить этот шаблон',
        'Deleting the template and its data. This may take a while...' =>
            'Удаление шаблона и связанных данных. Это может занять некоторое время...',

        # JS File: var/httpd/htdocs/js/Core.Agent.AppointmentCalendar.js
        'Jump' => 'Перейти',
        'Timeline Month' => 'Месячный график',
        'Timeline Week' => 'Недельный график',
        'Timeline Day' => 'График дня',
        'Previous' => 'Назад',
        'Resources' => 'Ресурсы',
        'Su' => 'Вс',
        'Mo' => 'Пн',
        'Tu' => 'Вт',
        'We' => 'Ср',
        'Th' => 'Чт',
        'Fr' => 'Пт',
        'Sa' => 'Сб',
        'This is a repeating appointment' => 'Это повторяющееся мероприятие',
        'Would you like to edit just this occurrence or all occurrences?' =>
            'Изменить только текущее мероприятие или все его повторения?',
        'All occurrences' => 'Все вхождения/копии',
        'Just this occurrence' => 'Только эту копию',
        'Too many active calendars' => 'Слишком много активных календарей',
        'Please either turn some off first or increase the limit in configuration.' =>
            'Пожалуйста или отключите некоторые или увеличьте предельное количество в настройках.',
        'Restore default settings' => 'Восстановить настройки по умолчанию',
        'Are you sure you want to delete this appointment? This operation cannot be undone.' =>
            'Вы действительно желаете удалить это мероприятие? Эта операция не может быть отменена.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerSearch.js
        'First select a customer user, then select a customer ID to assign to this ticket.' =>
            'Сначала выберите клиента, затем выберите компанию для назначения этой заявке.',
        'Duplicated entry' => 'Дублирующаяся запись',
        'It is going to be deleted from the field, please try again.' => 'Данные будут удалены из поля, пожалуйста, попробуйте еще раз.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerUserAddressBook.js
        'Please enter at least one search value or * to find anything.' =>
            'Пожалуйста, введите хотя бы одно значение для поиска, или * (звездочку) для поиска чего угодно.',
        'Insert selected customer user(s) into the "%s:" field.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Daemon.js
        'Information about the Znuny Daemon' => 'Информация о планировщике Znuny',

        # JS File: var/httpd/htdocs/js/Core.Agent.Dashboard.js
        'Please check the fields marked as red for valid inputs.' => 'Проверьте поля отмеченные красным цветом и исправьте их.',
        'month' => 'месяц',
        'Remove active filters for this widget.' => 'Удалить активные фильтры для этого виджета.',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.SearchForm.js
        'Please wait...' => 'Подождите пожалуйста',
        'Searching for linkable objects. This may take a while...' => 'Поиск доступных для связывания объектов. Это может занять некоторое время ...',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.js
        'Do you really want to delete this link?' => 'Вы действительно хотите удалить эту связь?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Login.js
        'Are you using a browser plugin like AdBlock or AdBlockPlus? This can cause several issues and we highly recommend you to add an exception for this domain.' =>
            'Используете ли вы плагины браузера, например AdBlock или AdBlockPlus? Это может вызвать различные проблемы, и мы настоятельно рекомендуем вам добавить исключение для этого домена.',
        'Do not show this warning again.' => 'Больше не показывать это предупреждение.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Preferences.js
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Извините, но вы не можете отключить уведомления отмеченные как обязательные.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Извините, но вы не можете отключить все методы уведомления для этого оповещения.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.' =>
            'Обратите внимание, что один из обновленных вами параметров требует обновления страницы. Нажмите здесь для обновления экрана.',
        'An unknown error occurred. Please contact the administrator.' =>
            'Произошла неизвестная ошибка. Свяжитесь с администратором.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Responsive.js
        'Switch to desktop mode' => 'Переключиться на режим ПК',

        # JS File: var/httpd/htdocs/js/Core.Agent.Search.js
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Удалите, пожалуйста, следующие слова из поискового запроса, так как поиск по ним невозможен:',

        # JS File: var/httpd/htdocs/js/Core.Agent.SharedSecretGenerator.js
        'Generate' => 'Сгенерировать',

        # JS File: var/httpd/htdocs/js/Core.Agent.SortedTree.js
        'This element has children elements and can currently not be removed.' =>
            'Этот параметр имеет подчиненные элементы и не может быть удален в настоящее время.',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketAction.js
        'Select a customer ID to assign to this ticket' => 'Выберите компанию для назначения этой заявке',
        'Do you really want to continue?' => 'Действительно продолжить?',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketBulk.js
        ' ...and %s more' => 'и %s более',
        ' ...show less' => '...скрыть',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketFormDraft.js
        'Add new draft' => 'Добавить новый черновик',
        'Delete draft' => 'Удалить черновик',
        'There are no more drafts available.' => 'Больше нет черновиков.',
        'It was not possible to delete this draft.' => 'Невозможно удалить этот черновик.',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketZoom.js
        'Article filter' => 'Фильтр сообщений',
        'Apply' => 'Применить',
        'Event Type Filter' => 'Фильтр типов событий',

        # JS File: var/httpd/htdocs/js/Core.Agent.js
        'Slide the navigation bar' => 'Прокрутите панель навигации',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Выключите Compatibility Mode/Режим совместимости в Internet Explorer!',

        # JS File: var/httpd/htdocs/js/Core.App.Responsive.js
        'Switch to mobile mode' => 'Переключиться на мобильный режим',

        # JS File: var/httpd/htdocs/js/Core.App.js
        'Error: Browser Check failed!' => 'Ошибка: Проверка браузера/Browser Check не удалась!',
        'Reload page' => 'Перезагрузить страницу',
        'Reload page (%ss)' => 'Обновление страницы (%s сек.)',

        # JS File: var/httpd/htdocs/js/Core.Debug.js
        'Namespace %s could not be initialized, because %s could not be found.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Exception.js
        'An error occurred! Please check the browser error log for more details!' =>
            'Произошла ошибка" Подробности в логах браузера!',

        # JS File: var/httpd/htdocs/js/Core.Form.Validate.js
        'One or more errors occurred!' => 'Произошла одна или несколько ошибок!',

        # JS File: var/httpd/htdocs/js/Core.Installer.js
        'Mail check successful.' => 'Почта проверена успешно.',
        'Error in the mail settings. Please correct and try again.' => 'Ошибка в настройках почты. Пожалуйста, исправьте и попробуйте снова.',

        # JS File: var/httpd/htdocs/js/Core.SystemConfiguration.js
        'Open this node in a new window' => 'Открыть эту заметку в новом окне',
        'Please add values for all keys before saving the setting.' => 'Добавьте значения для всех ключей до сохранения настройки.',
        'The key must not be empty.' => 'Этот ключ не может быть пустым.',
        'A key with this name (\'%s\') already exists.' => 'Ключ с таким именем (\'%s\')уже существует.',
        'Do you really want to revert this setting to its historical value?' =>
            'Вы действительно желаете вернуть эту настройку к ее историческому значению?',

        # JS File: var/httpd/htdocs/js/Core.UI.Datepicker.js
        'Open date selection' => 'Открыть выбор даты',
        'Invalid date (need a future date)!' => 'Некорректная дата (нужна дата в будущем)!',
        'Invalid date (need a past date)!' => 'Некорректная дата (нужна дата в прошлом)!',

        # JS File: var/httpd/htdocs/js/Core.UI.InputFields.js
        'Not available' => 'Не доступно',
        'and %s more...' => 'и %s более...',
        'Show current selection' => 'Показать текущий выбор',
        'Current selection' => 'Текущий выбор',
        'Clear all' => 'Очистить всё',
        'Filters' => 'Фильтры',
        'Clear search' => 'Очистить параметры поиска',

        # JS File: var/httpd/htdocs/js/Core.UI.Popup.js
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Если вы сейчас покинете эту страницу, будут также закрыты и все всплывающие окна!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Всплывающее окно с таким экраном уже открыто. Хотите закрыть то и открыть вместо него это?',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Невозможо открыть всплывающее окно. Пожалуйста, отключите для этого приложения любые блокировки всплывающих окон.',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.Sort.js
        'Ascending sort applied, ' => 'Используется сортировка по возрастанию,',
        'Descending sort applied, ' => 'Используется сортировка по убыванию,',
        'No sort applied, ' => 'Без сортировки,',
        'sorting is disabled' => 'сортировка отключена',
        'activate to apply an ascending sort' => 'Включить для сортировки по возрастанию',
        'activate to apply a descending sort' => 'Включить для сортировки по убыванию',
        'activate to remove the sort' => 'Включить для удаления сортировки',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.js
        'Remove the filter' => 'Удалить фильтр',

        # JS File: var/httpd/htdocs/js/Core.UI.TreeSelection.js
        'There are currently no elements available to select from.' => 'Отсутствуют элементы доступные для выбора',

        # JS File: var/httpd/htdocs/js/Core.UI.js
        'Please only select one file for upload.' => 'Выберите только один файл для загрузки.',
        'Sorry, you can only upload one file here.' => 'Извините, но загрузить сюда можно только один файл.',
        'Sorry, you can only upload %s files.' => 'Извините, но загрузить можно только %s файлы.',
        'Please only select at most %s files for upload.' => 'Пожалуйста, выберите только файлы %s для загрузки.',
        'The following files are not allowed to be uploaded: %s' => 'Следующие типы файлов не разрешены для загрузки: %s',
        'The following files exceed the maximum allowed size per file of %s and were not uploaded: %s' =>
            'Следующие файлы превысили максимальный допустимый размер одного файла (%s) и не были загружены: %s',
        'The names of the following files exceed the maximum allowed length of %s characters and were not uploaded: %s' =>
            'Следующие файлы превысили максимальное допустимое количество символов в имени (%s) и не были загружены: %s',
        'The following files were already uploaded and have not been uploaded again: %s' =>
            'Следующие файлы уже загружены и не были загружены снова: %s',
        'No space left for the following files: %s' => 'Недостаточно места для следующих файлов: %s',
        'Available space %s of %s.' => 'Доступное место %s из %s',
        'Upload information' => 'Информация о загрузке',
        'An unknown error occurred when deleting the attachment. Please try again. If the error persists, please contact your system administrator.' =>
            'Неизвестная ошибка обнаружена при удалении вложения. Попробуйте повторить. Если ошибка повторяется постоянно, свяжитесь в вашим системным администратором.',

        # JS File: var/httpd/htdocs/js/test/Core.Language.UnitTest.js
        'yes' => 'да',
        'no' => 'нет',
        'This is %s' => 'Это %s',
        'Complex %s with %s arguments' => '',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js
        'Grouped' => 'Сгруппированная',
        'Stacked' => 'С накоплением',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js
        'Stream' => 'Поток',
        'Expanded' => 'Развернутая',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Уважаемый клиент,

к сожалению, мы не обнаружили правильного номера заявки
в теме, поэтому письмо не может быть обработано.

Пожалуйста, создайте новую заявку используя клиентский портал.

Спасибо за помощь и понимание!

 Группа техподдержки
',
        ' (work units)' => ' (единиц времени)',
        ' 2 minutes' => ' 2 минуты',
        ' 5 minutes' => ' 5 минут',
        ' 7 minutes' => ' 7 минут',
        '%s' => 'Прочее %s',
        '(UserLogin) Firstname Lastname' => '(UserLogin) Имя Фамилия',
        '(UserLogin) Lastname Firstname' => '(UserLogin) Фамилия Имя',
        '(UserLogin) Lastname, Firstname' => '(UserLogin) Фамилия, Имя',
        '0 - Disabled' => '0 - Отключено',
        '1 - Available' => '1 - Доступно',
        '1 - Enabled' => '1 - Включено',
        '10 Minutes' => '10 минут',
        '100 (Expert)' => '100 (Эксперт)',
        '15 Minutes' => '15 минут',
        '2 - Enabled and required' => '2 - Включено и обязательно',
        '2 - Enabled and shown by default' => '2 - Включено и отображается по умолчанию',
        '2 - Enabled by default' => '2 - Включено по умолчанию',
        '2 Minutes' => '2 минуты',
        '200 (Advanced)' => '200 (Продвинутый)',
        '30 Minutes' => '30 минут',
        '300 (Beginner)' => '300 (Начинающий)',
        '5 Minutes' => '5 минут',
        'A TicketWatcher Module.' => 'Модуль TicketWatcher.',
        'A Website' => 'Веб сайт',
        'A picture' => 'Рисунок',
        'AJAX functions for notification event transport web service.' =>
            '',
        'AJAX interface for the web service dynamic field backends.' => '',
        'AccountedTime' => 'Затраченное время',
        'Activation of dynamic fields for screens.' => 'Активация динамических полей для экранов.',
        'Activity LinkTarget' => '',
        'Activity Notification' => '',
        'Activity.' => '',
        'ActivityID' => 'ActivityID',
        'Add a note to this ticket' => 'Добавить заметку к этой заявке',
        'Add an inbound phone call to this ticket' => 'Добавить входящий звонок клиента к этой заявке',
        'Add an outbound phone call to this ticket' => 'Добавить исходящий звонок клиенту к этой заявке',
        'Added %s time unit(s), for a total of %s time unit(s).' => 'Добавлено %sединиц времени, всего единиц времени %s.',
        'Added email. %s' => 'Получено письмо от %s.',
        'Added follow-up to ticket [%s]. %s' => 'Добавлено дополнение к заявке [%s]. %s',
        'Added link to ticket "%s".' => 'К заявке "%s" добавлена связь.',
        'Added note (%s).' => 'Добавлена заметка (%s).',
        'Added phone call from customer.' => 'Добавлена запись звонка клиента.',
        'Added phone call to customer.' => 'Добавлена запись звонка клиенту.',
        'Added subscription for user "%s".' => 'Добавлена подписка для пользователя "%s".',
        'Added system request (%s).' => 'Добавлен системный запрос (%s).',
        'Added web request from customer.' => 'Добавлен веб-запрос от клиента.',
        'Admin' => 'Администрирование',
        'Admin Area.' => 'Панель администратора.',
        'Admin Notification' => 'Уведомление администратором',
        'Admin configuration dialog for dynamic field types WebserviceDropdown and WebserviceMultiselect' =>
            '',
        'Admin modules overview.' => 'Обзор модулей администратора.',
        'Admin.' => 'Администратор.',
        'Administration' => 'Администрирование',
        'Agent Customer Search' => 'Поиск клиента агентом',
        'Agent Customer Search.' => 'Поиск клиента агентом.',
        'Agent Name' => 'Имя Агента',
        'Agent Name + FromSeparator + System Address Display Name' => 'Agent Name + FromSeparator + System Address Display Name',
        'Agent Preferences.' => 'Предпочтения агента.',
        'Agent Statistics.' => 'Статистика агентов',
        'Agent User Search' => 'Поиск агента',
        'Agent User Search.' => '',
        'All CustomerIDs of a customer user.' => 'Все компании клиента.',
        'All customer users of a CustomerID' => 'Все клиенты компании',
        'All escalated tickets' => 'Все эскалированные заявки',
        'All new tickets, these tickets have not been worked on yet' => 'Все новые заявки; с этими заявками еще никто не работал',
        'All open tickets, these tickets have already been worked on.' =>
            'Все открытые заявки, это заявки работа с которыми начата.',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Все заявки с напоминанием, у которых назначенная дата напоминания наступила',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Позволяет задать расширенные возможности поиска в интерфейсе агента. При включении его, появится возможность поиска с использованием конструкций типа "(key1&&key2)" или "(key1||key2)".',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Позволяет задать расширенные возможности поиска в интерфейсе клиента. При включении его, появится возможность поиска с использованием конструкций типа "(key1&&key2)" или "(key1||key2)".',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Позволяет задать расширенные возможности поиска в интерфейсе агента в заданиях Планировщика. При включении его, появится возможность поиска с использованием конструкций типа "(key1&&key2)" или "(key1||key2)".',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Допускает использование medium режима просмотра заявок (CustomerInfo => 1 - показывает также информацию о клиенте).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Допускает использование small(краткий) режима просмотра заявок (CustomerInfo => 1 - показывает также информацию о клиенте).',
        'Always show RichText if available' => 'Всегда показывать RichText если доступно',
        'An additional screen to add notes to a linked ticket.' => '',
        'Answer' => 'Ответ',
        'Appointment Calendar overview page.' => 'Страница обзора Календаря мероприятий.',
        'Appointment Notifications' => 'Уведомления о мероприятиях',
        'Appointment edit screen.' => 'Экран редактирования Мероприятий.',
        'Appointment list' => 'Список мероприятий',
        'Appointment list.' => 'Список мероприятий.',
        'Appointment notifications' => 'Уведомления о мероприятиях',
        'Arabic (Saudi Arabia)' => 'Арабский (Саудовская Аравия)',
        'ArticleTree' => 'Дерево сообщений',
        'Attachment Name' => 'Имя вложения',
        'Avatar' => 'Аватар',
        'Based on global RichText setting' => 'Основано на глобальной настройке RichText',
        'Bounced to "%s".' => 'Перенаправлено "%s".',
        'Bulgarian' => 'Болгарский',
        'Bulk Action' => 'Массовое действие',
        'CSV Separator' => 'Разделитель CSV',
        'Calendar manage screen.' => 'Экран Управление календарями.',
        'Catalan' => 'Каталонский',
        'Change password' => 'Изменить пароль',
        'Change queue!' => 'Сменить очередь!',
        'Change the customer for this ticket' => 'Изменить клиента для этой заявки',
        'Change the free fields for this ticket' => 'Изменить свободные поля для этой заявки',
        'Change the owner for this ticket' => 'Сменить владельца этой заявки',
        'Change the priority for this ticket' => 'Поменять приоритет заявки',
        'Change the responsible for this ticket' => 'Изменить ответственного за эту заявку',
        'Change your avatar image.' => 'Сменить изображение аватара.',
        'Change your password and more.' => 'Измените свой пароль и остальное.',
        'Changed SLA to "%s" (%s).' => 'SLA изменен на "%s" (%s).',
        'Changed archive state to "%s".' => 'Архивный статус изменен на "%s".',
        'Changed customer to "%s".' => 'Клиент изменен на "%s".',
        'Changed dynamic field %s from "%s" to "%s".' => 'Динамическое поле %s изменено с "%s" на "%s".',
        'Changed owner to "%s" (%s).' => 'Владелец изменен на "%s" (%s).',
        'Changed pending time to "%s".' => 'Время ожидания изменено на "%s".',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Изменен приоритет с "%s" (%s) на "%s" (%s).',
        'Changed queue to "%s" (%s) from "%s" (%s).' => 'Очередь изменена на "%s" (%s) с "%s" (%s).',
        'Changed responsible to "%s" (%s).' => 'Ответственный изменен на "%s" (%s).',
        'Changed service to "%s" (%s).' => 'Сервис изменен на "%s" (%s).',
        'Changed state from "%s" to "%s".' => 'Состояние изменено с "%s" на "%s".',
        'Changed title from "%s" to "%s".' => 'Заголовок изменен с "%s" на "%s".',
        'Changed type from "%s" (%s) to "%s" (%s).' => 'Тип изменен с  "%s" (%s) на "%s" (%s).',
        'Chat communication channel.' => 'Канал связи чата.',
        'Checkbox' => 'Checkbox',
        'Child' => 'Потомок',
        'Chinese (Simplified)' => 'Китайский (упрощённый)',
        'Chinese (Traditional)' => 'Китайский (традиционный)',
        'Choose for which kind of appointment changes you want to receive notifications.' =>
            'Выберите для какого типа изменений мероприятий вы желаете получать уведомления.',
        'Choose for which kind of ticket changes you want to receive notifications. Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Выберите для какого типа изменений заявок вы будете получать уведомления. Обратите внимание, что нельзя отключить уведомление отмеченное как обязательное.',
        'Choose which notifications you\'d like to receive.' => 'Выберите, какие уведомления Вы хотели бы получать.',
        'Christmas Eve' => 'Сочельник',
        'Close this ticket' => 'Закрыть эту заявку',
        'Closed tickets (customer user)' => 'Закрытые заявки (клиента)',
        'Closed tickets (customer)' => 'Закрытые заявки (клиента)',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Фильтры в столбцах для просмотра заявок в режиме "Small".',
        'Comment2' => 'Комментарий2',
        'Communication & Notifications' => 'Каналы связи и уведомления',
        'Communication Log GUI' => 'Журнала сеансов связи',
        'Communication log limit per page for Communication Log Overview.' =>
            '',
        'CommunicationLog Overview Limit' => '',
        'Company Status' => 'Информация по компании клиента',
        'Company Tickets.' => 'Заявки компании.',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => 'Complex/Комплексный',
        'Compose' => 'Создать',
        'Configure Processes.' => 'Настройка Процессов',
        'Configure and manage ACLs.' => 'Настройка и управление ACL.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Выберите экран, который должен отображаться после создания новой заявки.',
        'Configure which screen should be shown after marking a ticket or article as seen.' =>
            'Настраивает экран, который должен отображаться после отметки заявки или сообщения как прочитанное.',
        'Configure which screen should be shown after marking a ticket or article as unseen.' =>
            'Настраивает экран, который должен отображаться после отметки заявки или сообщения как непрочитанное.',
        'Create New process ticket.' => 'Создать новую процессную заявку.',
        'Create Process Ticket' => '',
        'Create Ticket' => 'Создание заявки',
        'Create a new calendar appointment linked to this ticket' => 'Создать новое мероприятие календаря связанное с этой заявкой',
        'Create a unit test file' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Создание соглашений об уровне сервиса (SLA) и управление ими.',
        'Create and manage agents.' => 'Создание агентов и управление ими.',
        'Create and manage appointment notifications.' => 'Создание и управление уведомлениями по мероприятиям.',
        'Create and manage attachments.' => 'Создание вложений и управление ими.',
        'Create and manage calendars.' => 'Создание календарей и управление ими.',
        'Create and manage customer users.' => 'Создание клиентов и управление ими.',
        'Create and manage customers.' => 'Создание компаний и управление ими.',
        'Create and manage dynamic fields.' => 'Создание динамических полей и управление ими.',
        'Create and manage groups.' => 'Создание групп и управление ими.',
        'Create and manage queues.' => 'Создание очередей и управление ими.',
        'Create and manage responses that are automatically sent.' => 'Создание и управление автоматическими ответами.',
        'Create and manage roles.' => 'Создание ролей и управление ими.',
        'Create and manage salutations.' => 'Создание приветствий и управление ими.',
        'Create and manage services.' => 'Создание и управление сервисами.',
        'Create and manage signatures.' => 'Создание подписей и управление ими.',
        'Create and manage templates.' => 'Создание шаблонов и управление ими.',
        'Create and manage ticket notifications.' => 'Создание и управление уведомлениями по заявкам.',
        'Create and manage ticket priorities.' => 'Создание приоритетов заявок и управление ими.',
        'Create and manage ticket states.' => 'Создание состояний заявок и управление ими.',
        'Create and manage ticket types.' => 'Создание типов заявок и управление ими.',
        'Create and manage web services.' => 'Создание и управление веб-сервисами.',
        'Create new Ticket.' => 'Создать новую Заявку.',
        'Create new appointment.' => 'Создать новое мероприятие.',
        'Create new email ticket and send this out (outbound).' => 'Создать новую e-mail заявку и отправить ее (исходящая)',
        'Create new email ticket.' => 'Создать новую заявку по email.',
        'Create new phone ticket (inbound).' => 'Создать новую заявку по телефону (входящая)',
        'Create new phone ticket.' => 'Создать новую телефонную заявку.',
        'Create new process ticket.' => 'Создать новую процессную заявку.',
        'Create tickets.' => 'Создать заявки.',
        'Created ticket [%s] in "%s" with priority "%s" and state "%s".' =>
            'Создана заявка [%s] в "%s" с приоритетом "%s" и состоянием "%s".',
        'Creates a unit test file for this ticket and sends it to Znuny.' =>
            '',
        'Creates a unit test file for this ticket.' => '',
        'Croatian' => 'Хорватский',
        'Customer Administration' => 'Управление Компаниями',
        'Customer Companies' => 'Компании клиента',
        'Customer IDs' => 'Компании клиента',
        'Customer Information Center Search.' => 'Поиск в центре информации о компаниях.',
        'Customer Information Center search.' => 'Поиск в центре информации о компаниях.',
        'Customer Information Center.' => 'Центр оповещения клиентов.',
        'Customer Ticket Print Module.' => 'Модуль печати клиентских заявок.',
        'Customer User Administration' => 'Управление Клиентами',
        'Customer User Information' => 'Информация о клиенте',
        'Customer User Information Center Search.' => 'Поиск в центре информации о клиентах.',
        'Customer User Information Center search.' => 'Поиск в центре информации о клиентах.',
        'Customer User Information Center.' => 'Центр информации о клиентах.',
        'Customer User-Customer Relations' => 'Связи Клиент ↔ Компания',
        'Customer preferences.' => 'Предпочтения для клиентов.',
        'Customer ticket overview' => 'Обзор клиентской заявки',
        'Customer ticket search.' => 'Поиск клиентских заявок.',
        'Customer ticket zoom' => 'Просмотр клиентской заявки',
        'Customer user search' => 'Поиск клиента',
        'CustomerID search' => 'Поиск по компании',
        'CustomerName' => 'Имя Клиента',
        'CustomerUser' => 'Клиент',
        'Czech' => 'Чешский',
        'Danish' => 'Датский',
        'Dark' => 'Темный',
        'Dashboard overview.' => '',
        'Date / Time' => 'Дата/Время',
        'Default agent name' => '',
        'Default value for NameX' => 'Значение по умолчанию для NameX',
        'Define the queue comment 2.' => 'Внести Комментарий 2 для очереди.',
        'Define the service comment 2.' => 'Внести Комментарий 2 для сервиса.',
        'Define the sla comment 2.' => 'Внести Комментарий 2 для SLA.',
        'Delete this ticket' => 'Удалить эту заявку',
        'Deleted link to ticket "%s".' => 'Связь с заявкой "%s" удалена.',
        'Detached' => '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Display communication log entries.' => 'Показать записи журнала сеансов связи.',
        'Down' => 'Вниз',
        'Dropdown' => 'Выпадающий список',
        'Dutch' => '',
        'Dynamic Fields Checkbox Backend GUI' => 'Редактор динамических полей типа Checkbox',
        'Dynamic Fields Date Time Backend GUI' => 'Редактор динамических полей типа Date Time',
        'Dynamic Fields Drop-down Backend GUI' => 'Редактор динамических полей типа Drop-down',
        'Dynamic Fields GUI' => 'Редактор динамических полей',
        'Dynamic Fields Multiselect Backend GUI' => 'Редактор динамических полей типа Multiselect',
        'Dynamic Fields Overview Limit' => 'Количество строк списка динамических полей на странице.',
        'Dynamic Fields Text Backend GUI' => 'Редактор динамических полей типа Text',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'Группы динамических полей для процессного виджета. Ключ - имя группы, Значение - содержит имена показываемых полей. Например: Ключ - "My Group", Содержание: "Name_X, NameY".',
        'Dynamic fields limit per page for Dynamic Fields Overview.' => '',
        'DynamicField' => 'DynamicField',
        'DynamicField_%s' => 'DynamicField_%s',
        'E-Mail Outbound' => 'Перенаправить почтовое сообщение',
        'Edit Customer Companies.' => 'Редактировать компанию клиента.',
        'Edit Customer Users.' => 'Редактировать пользователей клиента.',
        'Edit appointment' => 'Редактировать мероприятие',
        'Edit customer company' => 'Редактировать компанию клиента',
        'Email Outbound' => 'Исходящая эл. почта',
        'Email Resend' => 'Повторная отправка Письма',
        'Email communication channel.' => '',
        'Enabled filters.' => 'Доступные фильтры.',
        'English (Canada)' => 'Английский (Канада)',
        'English (United Kingdom)' => 'Английский (Великобритания)',
        'English (United States)' => 'Английский (США)',
        'Enroll process for this ticket' => 'Зарегистрировать процесс для этой заявки',
        'Enter your shared secret to enable two factor authentication. WARNING: Make sure that you add the shared secret to your generator application and the application works well. Otherwise you will be not able to login anymore without the two factor token.' =>
            '',
        'Escalated Tickets' => 'Эскалированные заявки',
        'Escalation view' => 'Просмотр эскалированных заявок',
        'EscalationTime' => 'EscalationTime',
        'Estonian' => 'Эстонский',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Регистрация модуля обработки события. Для большей производительности вы должны задать событие (например: Event => TicketCreate).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Регистрация модуля обработки события. Для большей производительности вы должны задать событие (например: Event => TicketCreate). Это возможно только в случае, если все динамические поля заявки нуждаются в одном и том же событии.',
        'Events Ticket Calendar' => 'Календарь событий по заявкам',
        'Execute SQL statements.' => 'Выполнить SQL-запросы.',
        'External' => '',
        'External Link' => 'Внешняя Ссылка',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Фильтр для отладки ACL. Примечание: атрибуты могут быть добавлены в формате <OTRS_TICKET_Attribute> например, <OTRS_TICKET_Priority>.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Фильтр для отладки Переходов. Примечание: можно добавить фильты в формате <OTRS_TICKET_Attribute> например, <OTRS_TICKET_Priority>. ',
        'Filter incoming emails.' => 'Фильтрация входящей почты.',
        'Finnish' => 'Финский',
        'First Christmas Day' => 'Первый день Рождества',
        'First Queue' => 'Имя первой Очереди',
        'First response time' => 'Время до первого ответа',
        'FirstLock' => 'Дата первой блокировки',
        'FirstResponse' => 'Дата первого ответа',
        'FirstResponseDiffInMin' => 'FirstResponseDiffInMin',
        'FirstResponseInMin' => 'FirstResponseInMin',
        'Firstname Lastname' => 'Имя Фамилия',
        'Firstname Lastname (UserLogin)' => 'Имя Фамилия (UserLogin)',
        'Forwarded to "%s".' => 'Переcлано "%s".',
        'Free Fields' => 'Свободные поля',
        'French' => 'Французский',
        'French (Canada)' => 'Французский (Канада)',
        'Frontend' => 'Интерфес',
        'Full value' => 'Полное значение',
        'Fulltext search' => 'Полнотекстовый поиск',
        'Galician' => 'Галисийский',
        'Generic Info module.' => '',
        'GenericAgent' => 'Планировщик задач',
        'GenericInterface Debugger GUI' => 'GenericInterface Debugger GUI',
        'GenericInterface ErrorHandling GUI' => '',
        'GenericInterface Invoker Event GUI' => '',
        'GenericInterface Invoker GUI' => 'GenericInterface Invoker GUI',
        'GenericInterface Operation GUI' => 'GenericInterface Operation GUI',
        'GenericInterface TransportHTTPREST GUI' => 'GenericInterface TransportHTTPREST GUI',
        'GenericInterface TransportHTTPSOAP GUI' => 'GenericInterface TransportHTTPSOAP GUI',
        'GenericInterface Web Service GUI' => 'GenericInterface Web Service GUI',
        'GenericInterface Web Service History GUI' => '',
        'GenericInterface Web Service Mapping GUI' => '',
        'German' => 'Немецкий',
        'Gives customer users group based access to tickets from customer users of the same customer (ticket CustomerID is a CustomerID of the customer user).' =>
            'Предоставляет клиентам доступ, основанный на группах, к заявкам клиентов, принадлежащих той же компании (заявка Компании - это Компания клиента).',
        'Global Search Module.' => 'Модуль глобального поиска.',
        'Go to dashboard!' => 'Перейти в Дайджест!',
        'Good PGP signature.' => '',
        'Google Authenticator' => 'Аутентификатор Google ',
        'Graph: Bar Chart' => 'Диаграммы: линейчатая',
        'Graph: Line Chart' => 'Диаграммы: Линейный график',
        'Graph: Stacked Area Chart' => 'Диаграммы: области с накоплениями',
        'Greek' => 'Греческий',
        'Hebrew' => 'Иврит',
        'Hindi' => 'Хинди',
        'Hungarian' => 'Венгерский',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if <$OTRSHome>/var/run/ can not be used.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Если включено, экраны обзоров (дайджест, просмотр заблокированных, просмотр очереди) будут автоматически обновляться по истечении указанного времени.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            'Если Вы планируете отсутствовать в офисе, Вы можете проинформировать об этом других пользователей, установив точный период отсутствия.',
        'Import appointments screen.' => 'Экран импорта мероприятий.',
        'Incoming Phone Call.' => 'Входящий телефонный звонок.',
        'Indonesian' => 'Индонезийский',
        'Inline' => '',
        'Input' => 'Input',
        'Interface language' => 'Язык интерфейса',
        'Internal' => '',
        'Internal communication channel.' => 'Внутренний канал связи.',
        'International Workers\' Day' => 'День международной солидарности трудящихся',
        'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.' =>
            '',
        'Italian' => 'Итальянский',
        'Japanese' => 'Японский',
        'Korean' => 'Корейский',
        'Language' => 'Язык',
        'Large' => 'Большой',
        'Last Mentions' => '',
        'Last Screen Overview' => 'Обзор последних просмотренных страниц',
        'Last customer subject' => 'Последняя заголовок клиента',
        'Last view - limit' => 'Последние просмотренные страницы - ограничение',
        'Last view - position' => 'Последние просмотренные страницы - позиция',
        'Last view - types' => 'Последние просмотренные страницы - типы',
        'Last viewed overview' => 'Обзор последних просмотренных страниц',
        'Last viewed screen' => 'Последняя просмотренная страница',
        'Lastname Firstname' => 'Фамилия Имя',
        'Lastname Firstname (UserLogin)' => 'Фамилия Имя (UserLogin)',
        'Lastname, Firstname' => 'Фамилия, Имя',
        'Lastname, Firstname (UserLogin)' => 'Фамилия, Имя (UserLogin)',
        'LastnameFirstname' => 'ФамилияИмя',
        'Latvian' => 'Латышский',
        'Link Object' => 'Связать объект',
        'Link Object.' => 'Связать объект.',
        'Link agents to groups.' => 'Связать агентов с группами.',
        'Link agents to roles.' => 'Связать агентов с ролями.',
        'Link customer users to customers.' => 'Связать клиентов с компаниями.',
        'Link customer users to groups.' => 'Связать клиентов с группами.',
        'Link customer users to services.' => 'Связать клиентов с сервисами.',
        'Link customers to groups.' => 'Связать компании с группами.',
        'Link queues to auto responses.' => 'Связать очереди с автоответами.',
        'Link roles to groups.' => 'Связать роли с группами.',
        'Link templates to attachments.' => 'Связать шаблоны с вложениями.',
        'Link templates to queues.' => 'Связать шаблоны с очередями.',
        'Link this ticket to other objects' => 'Связать эту заявку с другими объектами',
        'List view' => 'Вид в виде списка',
        'Lithuanian' => 'Литовский',
        'Lock / unlock this ticket' => 'Заблокировать / разблокировать эту заявку',
        'Locked Tickets' => 'Заблокированные заявки',
        'Locked Tickets.' => 'Заблокированные Заявки.',
        'Locked ticket.' => 'Заблокирована заявка.',
        'Logged in users.' => '',
        'Logged-In Users' => '',
        'Logout of customer panel.' => 'Панель выхода для клиента.',
        'Look into a ticket!' => 'Просмотреть заявку!',
        'Loop protection: no auto-response sent to "%s".' => '',
        'Macedonian' => '',
        'Mail Accounts' => 'Почтовые аккаунты',
        'Malay' => 'Малайский',
        'Manage Customer User-Customer Relations.' => 'Управление Клиент ↔ Компания связями.',
        'Manage OAuth2 tokens and their configurations.' => 'Управление OAuth2 ключами (tokens) и их конфигурациями.',
        'Manage PGP keys for email encryption.' => 'Управления PGP ключами для шифрования почтовых сообщений.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Управление учётными записями POP3 или IMAP для получения почтовых сообщений.',
        'Manage S/MIME certificates for email encryption.' => 'Управление S/MIME сертификатами для шифрования почты',
        'Manage System Configuration Deployments.' => '',
        'Manage different calendars.' => 'Управлять различными календарями.',
        'Manage existing sessions.' => 'Управление активными сеансами.',
        'Manage support data.' => 'Управление данными для поддержки.',
        'Manage system files.' => 'Управление системными файлами.',
        'Manage tasks triggered by event or time based execution.' => 'Управление заданиями, основанными на событиях или времени выполнения',
        'Management of ticket attribute relations.' => 'Управление связями свойств заявки.',
        'Mark as Spam!' => 'Пометить как спам!',
        'Mark as seen' => '',
        'Mark this ticket as junk!' => 'Пометить эту заявку как мусор!',
        'Mark ticket as seen' => 'Пометить заявку как прочитанную',
        'Mark ticket as unseen' => 'Пометить заявку как непрочитанную',
        'Mattermost Username' => '',
        'Max. number of articles per page in TicketZoom' => 'Максимальное число сообщений на странице при просмотре заявки',
        'Medium' => 'Средний',
        'Mentioned in article' => '',
        'Mentioned in ticket' => '',
        'Mentions.' => '',
        'Merge this ticket and all articles into another ticket' => 'Объединить эту заявку и все ее заметки с другой заявкой',
        'Merged Ticket (%s/%s) to (%s/%s).' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Объединена заявка <OTRS_TICKET> с <OTRS_MERGE_TO_TICKET>.',
        'Minute' => '',
        'Miscellaneous' => 'Разное',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Модуль для фильтрации и управления входящими сообщениями. Получите 4-х значный номер в свободное поле заявки, используйте регулярное выражение в Match т.е. From => \'(.+?)@.+?\', и используйте () как [***] в Set =>.',
        'Multiselect' => 'Multiselect - множественный выбор',
        'My Queues' => 'Мои очереди',
        'My Services' => 'Мои сервисы',
        'My last changed tickets' => 'Мои последние измененные заявки',
        'NameX' => 'ИмяХ',
        'New Tickets' => 'Новые заявки',
        'New Window' => 'Новое окно',
        'New Year\'s Day' => 'Новый Год',
        'New Year\'s Eve' => 'Канун Нового Года',
        'New process ticket' => 'Новая процессная заявка',
        'News' => '',
        'No public key found.' => '',
        'No valid OpenPGP data found.' => '',
        'None' => 'Нет',
        'Norwegian' => 'Норвежский',
        'Notification Settings' => 'Настройка Уведомлений',
        'Notified about response time escalation.' => '',
        'Notified about solution time escalation.' => '',
        'Notified about update time escalation.' => '',
        'Number of displayed tickets' => 'Количество отображаемых заявок',
        'OAuth2' => '',
        'OAuth2 token' => 'OAuth2 ключ (token)',
        'OTRS' => 'OTRS',
        'Open an external link!' => 'Открыть внешнюю ссылку!',
        'Open tickets (customer user)' => 'Заявки, открытые клиентом',
        'Open tickets (customer)' => 'Заявки, открытые компанией',
        'Option' => 'Настройка',
        'Other Customers' => '',
        'Out Of Office' => 'Вне офиса',
        'Out Of Office Time' => 'Период отсутствия в офисе',
        'Out of Office users.' => 'Пользователи за пределами офиса',
        'Overview Escalated Tickets.' => 'Обзор эскалированных заявок.',
        'Overview Refresh Time' => 'Время обновления обзоров',
        'Overview of all Tickets per assigned Queue.' => 'Обзор всех заявок с разделением по очередям.',
        'Overview of all appointments.' => 'Обзор всех мероприятий.',
        'Overview of all escalated tickets.' => 'Просмотр всех эскалированных заявок',
        'Overview of all open Tickets.' => 'Обзор всех заявок',
        'Overview of all open tickets.' => 'Обзор всех открытых заявок.',
        'Overview of customer tickets.' => 'Обзор заявок клиента',
        'PGP Key' => 'PGP ключ',
        'PGP Key Management' => 'Управление ключами PGP',
        'PGP Keys' => 'PGP ключи',
        'Parent' => 'Родитель',
        'ParentChild' => 'Телефонный звонок.',
        'Pending time' => 'Время в ожидании',
        'People' => 'Агенты',
        'Persian' => 'Фарси',
        'Phone Call Inbound' => 'Входящий звонок',
        'Phone Call Outbound' => 'Сделать звонок',
        'Phone Call.' => 'Телефонный звонок.',
        'Phone call' => 'Телефонный звонок',
        'Phone communication channel.' => '',
        'Phone-Ticket' => 'Заявка по телефону',
        'Picture Upload' => 'Загрузка изображений',
        'Picture upload module.' => 'Модуль загрузки изображений.',
        'Picture-Upload' => 'Загрузка рисунка',
        'Plugin search' => 'Поисковый плагин',
        'Plugin search module for autocomplete.' => 'Поисковый плагин для автозавершения.',
        'Polish' => 'Польский',
        'Portuguese' => 'Португальский',
        'Portuguese (Brasil)' => 'Португальский (Бразилия)',
        'PostMaster Filters' => 'Фильтры PostMaster (входящей почты)',
        'Print this ticket' => 'Напечатать эту заявку',
        'Priorities' => 'Приоритеты',
        'Process Management Activity Dialog GUI' => 'Управление процессами Интерфейс Диалоги Активности',
        'Process Management Activity GUI' => 'Управление процессами Интерфейс Активности',
        'Process Management Path GUI' => 'Управление процессами Интерфейс Схема',
        'Process Management Transition Action GUI' => 'Управление процессами Интерфейс Действия Переходов',
        'Process Management Transition GUI' => 'Управление процессами Интерфейс Переходы',
        'Process Ticket.' => 'Процессная заявка.',
        'ProcessID' => 'ProcessID',
        'Processes & Automation' => 'Процессы и автоматизация',
        'Provides a matrix overview of the tickets per state per queue' =>
            'Предоставляет обзорную матрицу заявок сгрупированных по состояниям и проектам',
        'Provides customer users access to tickets even if the tickets are not assigned to a customer user of the same customer ID(s), based on permission groups.' =>
            'Предоставляет клиентам доступ к заявкам, основанный на доступе к группам, даже если заявки не назначены на клиента той же компании(ий).',
        'Public Calendar' => 'Общедоступный календарь',
        'Public calendar.' => 'Общедоступный календарь.',
        'Queue view' => 'Просмотр очередей',
        'Refresh interval' => 'Интервал обновления',
        'Reminder Tickets' => 'Заявки с напоминанием',
        'Removed subscription for user "%s".' => 'Удалена подписка для пользователя "%s".',
        'Reports' => 'Отчеты',
        'Resend Ticket Email.' => '',
        'Resent email to "%s".' => '',
        'Responsible Tickets' => 'Заявки, за которые ответственный',
        'Responsible Tickets.' => 'Заявки, за которые ответственный.',
        'Right' => 'Правый',
        'Romanian' => '',
        'Running Process Tickets' => 'Запущенные Процессные заявки',
        'Russian' => 'Русский',
        'S/MIME Certificates' => 'Сертификаты S/MIME',
        'Schedule a maintenance period.' => 'Управлять периодом обслуживания.',
        'Screen after marking as seen' => 'Страница после отметки как прочитанное',
        'Screen after marking as unseen' => 'Страница после отметки как непрочитанное',
        'Screen after new ticket' => 'Экран после создания новой заявки',
        'Search Customer' => 'Искать клиента',
        'Search Ticket.' => 'Поиск заявки.',
        'Search Tickets.' => 'Поиск заявок.',
        'Search User' => 'Искать агента',
        'Search tickets.' => 'Поиск заявок.',
        'Second Christmas Day' => 'Второй день Рождества',
        'Second Queue' => 'Вторая очередь',
        'Seconds' => '',
        'Select after which period ticket overviews should refresh automatically.' =>
            'Выберите период, после которого просмотр списка заявок будет автоматически обновлен.',
        'Select how many last views should be shown.' => 'Выбрать количество отображаемых последних просмотренных страниц.',
        'Select how many tickets should be shown in overviews by default.' =>
            'Выберете как много заявок будет показываться в обзоре по умолчанию.',
        'Select the main interface language.' => 'Выберете главный язык интерфейса.',
        'Select the maximum articles per page shown in TicketZoom. System default value will apply when entered empty value.' =>
            'Выбрать максимальное число сообщений на странице при просмотре заявки. Значение по умолчанию используется, когда поле пустое.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Выберите символ разделителя, используемый в файлах CSV (статистика и поиски). Если вы не выберете его здесь, будет использован разделитель по умолчанию для вашего языка.',
        'Select where to display the last views.' => 'Выбрать место отображения обзора последних просмотренных страниц.',
        'Select which types should be displayed.' => 'Выбрать типы последних просмотренных страниц для отображения.',
        'Select your frontend Theme.' => 'Тема интерфейса (имя папки с кастомными модулями).',
        'Select your personal time zone. All times will be displayed relative to this time zone.' =>
            'Выберите свой часовой пояс. Все даты и время будут отображаться относительно этого часового пояса.',
        'Select your preferred layout for the software.' => 'Выберите предпочитаемый вами стиль.',
        'Select your preferred theme for OTRS.' => '',
        'Send a unit test file' => '',
        'Send new outgoing mail from this ticket' => 'Отправить новое исходящее письмо от этой заявки',
        'Send notifications to users.' => 'Отправить уведомление пользователям.',
        'Sent "%s" notification to "%s" via "%s".' => '',
        'Sent auto follow-up to "%s".' => '',
        'Sent auto reject to "%s".' => '',
        'Sent auto reply to "%s".' => '',
        'Sent email to "%s".' => '',
        'Sent email to customer.' => '',
        'Sent notification to "%s".' => '',
        'Serbian Cyrillic' => 'Сербский Кириллица',
        'Serbian Latin' => 'Сербский Латиница',
        'Service view' => 'Обзор сервисов',
        'ServiceView' => 'ServiceView',
        'Set a new password by filling in your current password and a new one.' =>
            'Измените пароль, указав текущий пароль и новый.',
        'Set sender email addresses for this system.' => 'Задать адрес отправителя для этой системы.',
        'Set this ticket to pending' => 'Поставить заявку в ожидание',
        'Shared Secret' => 'Общий секрет',
        'Show the history for this ticket' => 'Показать историю этой заявки',
        'Show the ticket history' => 'Показать историю заявки',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Допускает использование режима предпросмотра при просмотре заявок (CustomerInfo => 1 - показывает также информацию о клиенте, CustomerInfoMaxSize макс. размер в символах для Customer-Info).',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows last mention of tickets.' => '',
        'Signature data.' => '',
        'Simple' => 'Простой',
        'Skin' => 'Окрас',
        'Slovak' => 'Словацкий',
        'Slovenian' => 'Словенский',
        'Small' => 'Маленький',
        'Snippet' => '',
        'Software Package Manager.' => 'Управление пакетами программного обеспечения',
        'Solution time' => 'Время решения',
        'SolutionDiffInMin' => 'SolutionDiffInMin',
        'SolutionInMin' => 'SolutionInMin',
        'Some description!' => 'Некоторое описание!',
        'Some picture description!' => 'Некоторое описание рисунка!',
        'Spam' => 'Спам',
        'Spanish' => 'Испанский',
        'Spanish (Colombia)' => 'Испанский (Колумбия)',
        'Spanish (Mexico)' => 'Испанский (Мексика)',
        'Started response time escalation.' => '',
        'Started solution time escalation.' => '',
        'Started update time escalation.' => '',
        'Stat#' => 'Отчет#',
        'States' => 'Состояния',
        'Statistics overview.' => 'Обзор статистики.',
        'Status view' => 'Просмотр статусов',
        'Stopped response time escalation.' => '',
        'Stopped solution time escalation.' => '',
        'Stopped update time escalation.' => '',
        'Support Agent' => '',
        'Swahili' => 'Суахили',
        'Swedish' => 'Шведский',
        'System Address Display Name' => 'Отображаемое имя для System Address',
        'System Configuration Deployment' => '',
        'System Configuration Group' => '',
        'System Maintenance' => 'Обслуживание системы',
        'Textarea' => 'Textarea/Длинный текст',
        'Thai' => 'Тайский',
        'The PGP signature is expired.' => '',
        'The PGP signature was made by a revoked key, this could mean that the signature is forged.' =>
            '',
        'The PGP signature was made by an expired key.' => '',
        'The PGP signature with the keyid has not been verified successfully.' =>
            '',
        'The PGP signature with the keyid is good.' => '',
        'The secret you supplied is invalid. The secret must only contain letters (A-Z, uppercase) and numbers (2-7) and must consist of 16 characters.' =>
            'Введенный вами секрет не подходит. Секрет может состоять только из: Букв (A-Z, заглавных) и цифр (2-7) и может состоять только из 16 символов.',
        'The value of the From field' => '',
        'Theme' => 'Тема',
        'This is a Description for Comment on Framework.' => 'Это Описание Комментария к Фреймворку',
        'This is a Description for DynamicField on Framework.' => 'Это Описание Динамических Полей Фреймворка',
        'This is the dark skin for the agent interface.' => 'Это темный окрас интерфейса агента.',
        'This is the dark skin for the customer interface.' => 'Это темный окрас интерфейса клиента.',
        'This is the default orange - black skin for the customer interface.' =>
            'Это стандартная оранжево-черная тема для интерфейса клиента.',
        'This is the default orange - black skin.' => 'Это стандартная оранжево-черная тема.',
        'This key is not certified with a trusted signature!' => '',
        'This module is part of the admin area of OTRS.' => '',
        'Ticket Close.' => 'Заявка закрыта.',
        'Ticket Compose Bounce Email.' => '',
        'Ticket Compose email Answer.' => '',
        'Ticket Customer.' => 'Клиента-инициатор заявки.',
        'Ticket Forward Email.' => '',
        'Ticket FreeText.' => 'Произвольный текст заявки',
        'Ticket History.' => 'История заявки.',
        'Ticket Lock.' => 'Блокировка заявки.',
        'Ticket Merge.' => 'Объединение заявки.',
        'Ticket Move.' => 'Перемещение заявки.',
        'Ticket Note.' => 'Заметка к заявки.',
        'Ticket Notifications' => 'Уведомления по заявкам',
        'Ticket Outbound Email.' => 'Исходящая почта для заявки.',
        'Ticket Overview "Medium" Limit' => 'Обзор заявок - лимит режима "Средний"',
        'Ticket Overview "Preview" Limit' => 'Обзор заявок - лимит режима "Предварительный просмотр"',
        'Ticket Overview "Small" Limit' => 'Обзор заявок - лимит режима "Краткий"',
        'Ticket Owner.' => 'Владелец заявки.',
        'Ticket Pending.' => 'Заявка ожидает.',
        'Ticket Print.' => 'Печать заявки.',
        'Ticket Priority.' => 'Приоритет заявки.',
        'Ticket Queue Overview' => 'Итоги по очередям',
        'Ticket Responsible.' => 'Ответственный за заявку.',
        'Ticket Watcher' => 'Наблюдающий за заявкой',
        'Ticket Zoom' => 'Подробный просмотр заявки',
        'Ticket Zoom.' => 'Подробный просмотр заявки.',
        'Ticket bulk module.' => 'Массовое действие с заявкой.',
        'Ticket creation' => '',
        'Ticket limit per page for Ticket Overview "Medium".' => '',
        'Ticket limit per page for Ticket Overview "Preview".' => '',
        'Ticket limit per page for Ticket Overview "Small".' => '',
        'Ticket notifications' => 'Уведомления по заявкам',
        'Ticket overview' => 'Обзор заявок',
        'Ticket plain view of an email.' => '',
        'Ticket split dialog.' => 'Диалог разделения заявки.',
        'Ticket title' => 'Заголовок заявки',
        'Ticket zoom view.' => 'Подробный просмотр заявки.',
        'TicketNumber' => 'Заявка №',
        'Tickets.' => 'Заявки.',
        'To accept login information, such as an EULA or license.' => 'Принять регистрационную информацию, такую как EULA или лицензию.',
        'To download attachments.' => 'Для загрузки вложение.',
        'To view HTML attachments.' => 'Для просмотра HTML вложений.',
        'Tree view' => 'Иерархический вид',
        'Turkish' => 'Турецкий',
        'Tweak the system as you wish.' => 'Оптимизируйте систему по своему усмотрению.',
        'Ukrainian' => 'Украинский',
        'Unlocked ticket.' => 'Разблокирована заявка.',
        'Up' => 'Вверх',
        'Upcoming Events' => 'Предстоящие события',
        'Update time' => 'Время изменения заявки',
        'Upload your PGP key.' => 'Загрузите ваш PGP-ключ',
        'Upload your S/MIME certificate.' => 'Загрузить Ваш S/MIME сертификат.',
        'User Profile' => 'Профиль пользователя',
        'UserFirstname' => 'Имя',
        'UserLastname' => 'Фамилия',
        'Users, Groups & Roles' => 'Пользователи, группы и роли',
        'Vietnam' => 'Вьетнамский',
        'View performance benchmark results.' => 'Просмотр результатов измерения производительности.',
        'Watch this ticket' => 'Наблюдать за этой заявкой',
        'Watched Tickets' => 'Наблюдаемые заявки',
        'Watched Tickets.' => 'Наблюдаемые заявки.',
        'We are performing scheduled maintenance.' => 'Проводиться плановое техническое обслуживание.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Проводиться плановое техническое обслуживание сайта. Вход временно недоступен.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Проводиться плановое техническое обслуживание. Уже скоро закончим.',
        'Web Services' => 'Веб-сервисы',
        'Web service (Dropdown)' => '',
        'Web service (Multiselect)' => '',
        'Web service dynamic field AJAX interface' => '',
        'Webservice' => '',
        'Yes, but hide archived tickets' => 'Да, скрыть архивированные заявки',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Ваше письмо с номером заявки "<OTRS_TICKET>" переправлено адресату "<OTRS_BOUNCE_TO>". Контактируйте по этому адресу для получения дальнейшей информации.',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Ваш email с номером заявки "<OTRS_TICKET>" объединен с "<OTRS_MERGE_TO_TICKET>".',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Выбор очередей, которые вас интересуют. Вы также будете уведомляться по электронной почте о событиях в ней происходящих, если эта функция включена.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Выбор сервисов, которые вас интересуют. Вы также будете уведомляться по электронной почте об этих сервисах, если эта функция включена.',
        'Your username in Mattermost without the leading @' => '',
        'Znuny.org - News' => '',
        'Zoom' => 'Подробно',
        'all tickets' => '',
        'archived tickets' => '',
        'attachment' => 'вложение',
        'bounce' => 'Перенаправить',
        'compose' => 'создать',
        'debug' => 'отладка',
        'error' => 'ошибка',
        'forward' => 'переслать',
        'info' => 'информация',
        'inline' => 'в очереди',
        'normal' => 'обычный',
        'not archived tickets' => '',
        'notice' => 'уведомление',
        'open in current tab' => '',
        'open in new tab' => '',
        'pending' => 'в ожидании',
        'phone' => 'телефон',
        'responsible' => 'ответственный',
        'reverse' => 'обратный',
        'stats' => 'отчеты',

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
