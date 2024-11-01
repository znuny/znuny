# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# Copyright (C) 2010 Thomas Kaltenbrunner <tkaltenbrunner at opc.de>
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Translation::JavaScriptStrings)

package Kernel::Language::de;

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
    $Self->{DateFormatLong}      = '%T - %D.%M.%Y';
    $Self->{DateFormatShort}     = '%D.%M.%Y';
    $Self->{DateInputFormat}     = '%D.%M.%Y';
    $Self->{DateInputFormatLong} = '%D.%M.%Y - %T';
    $Self->{Completeness}        = 0.995220042854788;

    # csv separator
    $Self->{Separator}         = ';';

    $Self->{DecimalSeparator}  = ',';
    $Self->{ThousandSeparator} = '.';
    $Self->{Translation} = {

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt
        'Actions' => 'Aktionen',
        'Create New ACL' => 'Neue ACL erstellen',
        'Deploy ACLs' => 'ACLs in Betrieb nehmen',
        'Export ACLs' => 'ACLs exportieren',
        'Filter for ACLs' => 'Filter für ACLs',
        'Just start typing to filter...' => 'Beginnen Sie mit der Eingabe, um zu filtern...',
        'Configuration Import' => 'Konfigurationsimport',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Hier können Sie über eine Konfigurationsdatei ACLs ins System importieren. Diese Datei muss das vom ACL Editor verwendete .yml Format haben.',
        'This field is required.' => 'Dieses Feld wird benötigt.',
        'Overwrite existing ACLs?' => 'Existierende ACLs überschreiben?',
        'Upload ACL configuration' => 'ACL-Konfiguration hochladen',
        'Import ACL configuration(s)' => 'ACL-Konfiguration(en) importieren',
        'Description' => 'Beschreibung',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Wenn Sie eine ACL erstellen möchten, können Sie sie von einem anderen System importieren oder eine ganz neue erstellen.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Änderungen an den ACLs wirken sich erst aus, wenn Sie die Konfiguration in Betrieb nehmen. Dabei werden die Änderungen in der Konfiguration gespeichert.',
        'ACL Management' => 'ACL-Verwaltung',
        'ACLs' => 'ACLs',
        'Filter' => 'Filter',
        'Show Valid' => 'Zeige nur valide Einträge',
        'Show All' => 'Zeige alle Einträge',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Hinweis: Diese Tabelle stellt die Ausführungsreihenfolge der ACLs dar. Wenn Sie die Reihenfolge ändern möchten, ändern Sie bitte die Namen der betroffenen ACLs.',
        'ACL name' => 'ACL-Name',
        'Comment' => 'Kommentar',
        'Validity' => 'Gültigkeit',
        'Export' => 'Export',
        'Copy' => 'Kopieren',
        'No data found.' => 'Keine Daten gefunden.',
        'No matches found.' => 'Keine Treffer gefunden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLEdit.tt
        'Go to overview' => 'Zur Übersicht gehen',
        'Delete ACL' => 'ACL löschen',
        'Delete Invalid ACL' => 'Ungültige ACL löschen',
        'Match settings' => 'Filterbedingungen',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Stellt die Filterbedingungen dieser ACL ein. Verwenden Sie \'Properties\' um den Wert aus dem aktuellen Bildschirm zu prüfen oder \'PropertiesDatabase\' für den Wert des Tickets, wie es in der Datenbank gespeichert ist.',
        'Change settings' => 'Werte ändern',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Stellt die Wertänderungen ein für den Fall, dass die Filterbedingungen zutreffen. Hierbei ist \'Possible\' eine Positivliste und \'PossibleNot\' eine Negativliste.',
        'Check the official %sdocumentation%s.' => 'Überprüfen Sie die offizielle %sdocumentation%s.',
        'Edit ACL %s' => 'ACL %s bearbeiten',
        'Edit ACL' => 'ACL bearbeiten',
        'Show or hide the content' => 'Inhalt einblenden oder ausblenden',
        'Edit ACL Information' => 'ACL-Information bearbeiten',
        'Name' => 'Name',
        'Stop after match' => 'Stoppen nach Treffer',
        'Edit ACL Structure' => 'ACL-Struktur bearbeiten',
        'Cancel' => 'Abbrechen',
        'Save' => 'Speichern',
        'Save and finish' => 'Speichern und abschließen',
        'Do you really want to delete this ACL?' => 'Wollen Sie diese ACL wirklich löschen?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLNew.tt
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Neue ACL durch Eingabe der Daten erstellen. Nach Erstellung der ACL ist es möglich, Konfigurationsparameter im Bearbeitungsmodus einzufügen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentCalendarManage.tt
        'Calendar Overview' => 'Kalenderübersicht',
        'Add new Calendar' => 'Einen neuen Kalender hinzufügen',
        'Add Calendar' => 'Neuen Kalender hinzufügen',
        'Import Appointments' => 'Termine importieren',
        'Calendar Import' => 'Kalender importieren',
        'Here you can upload a configuration file to import a calendar to your system. The file needs to be in .yml format as exported by calendar management module.' =>
            'Hier können Sie eine Konfigurationsdatei hochladen, um einen Kalender in Ihr System zu importieren. Die Datei muss im .yml Format vorliegen, so wie sie in der Kalenderverwaltung exportiert wurde.',
        'Overwrite existing entities' => 'Bestehende Einträge überschreiben',
        'Upload calendar configuration' => 'Kalenderkonfiguration hochladen',
        'Import Calendar' => 'Kalender importieren',
        'Filter for Calendars' => 'Filter für Kalender',
        'Filter for calendars' => 'Filter für Kalender',
        'Depending on the group field, the system will allow users the access to the calendar according to their permission level.' =>
            'Abhängig von der Gruppenzugehörigkeit wird das System Benutzern den Zugriff anhand ihrer Berechtigungen erlauben bzw. verweigern.',
        'Read only: users can see and export all appointments in the calendar.' =>
            'Nur lesen: Benutzer können alle Termine im Kalender sehen und exportieren.',
        'Move into: users can modify appointments in the calendar, but without changing the calendar selection.' =>
            'Verschieben in: Benutzer können Termine innerhalb eines Kalenders bearbeiten, diese jedoch nicht in andere Kalender verschieben.',
        'Create: users can create and delete appointments in the calendar.' =>
            'Erstellen: Benutzer können Termine im Kalender erstellen und löschen.',
        'Read/write: users can manage the calendar itself.' => 'Lesen/Schreiben: Benutzer können die Kalender an sich verwalten.',
        'Calendar Management' => 'Kalenderverwaltung',
        'Edit Calendar' => 'Kalender bearbeiten',
        'Group' => 'Gruppe',
        'Changed' => 'Geändert',
        'Created' => 'Erstellt',
        'Download' => 'Herunterladen',
        'URL' => 'URL',
        'Export calendar' => 'Kalender exportieren',
        'Download calendar' => 'Kalender herunterladen',
        'Copy public calendar URL' => 'Öffentliche Kalender-URL kopieren',
        'Calendar' => 'Kalender',
        'Calendar name' => 'Kalendername',
        'Calendar with same name already exists.' => 'Ein Kalender mit gleichem Namen existiert bereits.',
        'Permission group' => 'Berechtigungsgruppe',
        'Ticket Appointments' => 'Ticket-Termine',
        'Rule' => 'Regel',
        'Remove this entry' => 'Diesen Eintrag entfernen',
        'Remove' => 'Entfernen',
        'Start date' => 'Startzeitpunkt',
        'End date' => 'Endzeitpunkt',
        'Use options below to narrow down for which tickets appointments will be automatically created.' =>
            'Verwenden Sie die folgenden Optionen, um einzugrenzen, welche Ticket-Termine automatisch erstellt werden sollen.',
        'Queues' => 'Queues',
        'Please select a valid queue.' => 'Bitte wählen Sie eine gültige Queue aus.',
        'Search attributes' => 'Suchattribute',
        'Add entry' => 'Eintrag hinzufügen',
        'Add' => 'Hinzufügen',
        'Define rules for creating automatic appointments in this calendar based on ticket data.' =>
            'Definieren Sie Regeln, um automatisch Termine in diesem Kalender zu erstellen, welche auf Ticketdaten basieren.',
        'Add Rule' => 'Regel hinzufügen',
        'Submit' => 'Übermitteln',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentImport.tt
        'Go back' => 'Zurück',
        'Uploaded file must be in valid iCal format (.ics).' => 'Die hochgeladene Datei muss in einem gültigen iCal-Format (.ics) vorliegen.',
        'If desired Calendar is not listed here, please make sure that you have at least \'create\' permissions.' =>
            'Sollte ein gewünschter Kalender hier nicht aufgelistet sein, stellen Sie bitte sicher, dass Sie mindestens die Berechtigung zum Erstellen von Kalendern besitzen.',
        'Appointment Import' => 'Termine importieren',
        'Upload' => 'Hochladen',
        'Update existing appointments?' => 'Existierende Termine überschreiben?',
        'All existing appointments in the calendar with same UniqueID will be overwritten.' =>
            'Alle existierenden Termine mit der selben "UniqueID" im entsprechenden Kalender werden überschrieben.',
        'Upload calendar' => 'Kalender hochladen',
        'Import appointments' => 'Termine importieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEvent.tt
        'Add Notification' => 'Benachrichtigung hinzufügen',
        'Export Notifications' => 'Benachrichtigungen exportieren',
        'Filter for Notifications' => 'Filter für Benachrichtigungen',
        'Filter for notifications' => 'Filter für Benachrichtigungen',
        'Here you can upload a configuration file to import appointment notifications to your system. The file needs to be in .yml format as exported by the appointment notification module.' =>
            'Hier können Sie eine Konfigurationsdatei hochladen, mit der Terminbenachrichtigungen in das System importiert werden können. Die Datei muss im .yml-Format vorliegen, so wie sie auch vom Terminbenachrichtigungs-Modul exportiert wird.',
        'Overwrite existing notifications?' => 'Bestehende Benachrichtigungen überschreiben?',
        'Upload Notification configuration' => 'Benachrichtigungs-Konfiguration hochladen',
        'Import Notification configuration' => 'Benachrichtigungs-Konfiguration importieren',
        'Appointment Notification Management' => 'Verwaltung von Terminbenachrichtigungen',
        'Edit Notification' => 'Benachrichtigung bearbeiten',
        'List' => 'Liste',
        'Delete' => 'Löschen',
        'Delete this notification' => 'Diese Benachrichtigung löschen',
        'Show in agent preferences' => 'In Agenten-Einstellungen anzeigen',
        'Agent preferences tooltip' => 'Kurzinfo für die persönlichen Agenten-Einstellungen',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Diese Nachricht wird als Kurzinfo für diese Benachrichtigung im Einstellungsbildschirm der Agenten-Einstellungen angezeigt.',
        'Toggle this widget' => 'Dieses Widget umschalten',
        'Events' => 'Ereignisse',
        'Event' => 'Ereignis',
        'Here you can choose which events will trigger this notification. An additional appointment filter can be applied below to only send for appointments with certain criteria.' =>
            'Hier können Sie auswählen, welche Ereignisse diese Benachrichtigung auslösen. Ein zusätzlicher Terminfilter kann weiter unten eingestellt werden, um die Benachrichtigungen nur für Termine mit bestimmten Merkmalen zu versenden.',
        'Appointment Filter' => 'Terminfilter',
        'Type' => 'Typ',
        'Title' => 'Titel',
        'Location' => 'Standort',
        'Team' => 'Team',
        'Resource' => 'Ressource',
        'Recipients' => 'Empfänger',
        'Send to' => 'Senden an',
        'Send to these agents' => 'An diese Agenten senden',
        'Send to all group members (agents only)' => 'An alle Gruppenmitglieder senden (gilt nur für Agenten)',
        'Send to all role members' => 'An alle Rollenmitglieder senden',
        'Also send if the user is currently out of office.' => 'Auch senden, wenn der Benutzer nicht am Arbeitsplatz ist.',
        'Send on out of office' => 'Trotz "nicht im Büro" senden',
        'Notify user just once per day about a single appointment using a selected transport.' =>
            'Nur einmal am Tag pro Termin und Benachrichtigungs-Transportmethode versenden.',
        'Once per day' => 'Einmal pro Tag',
        'Notification Methods' => 'Benachrichtigungsmethoden',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Dies sind die verfügbaren Methoden für den Versand der Benachrichtigungen an jeden Empfänger. Bitte wählen Sie unten mindestens eine Methode aus.',
        'Enable this notification method' => 'Diese Benachrichtigungsmethode aktivieren',
        'Transport' => 'Transport',
        'At least one method is needed per notification.' => 'Mindestens eine Methode ist für jede Benachrichtigung erforderlich.',
        'Active by default in agent preferences' => 'Standardmäßig aktiv in den Agenten-Einstellungen',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Das ist der Standardwert für zugewiesene Empfänger-Agenten, die für diese Benachrichtigung in ihren Einstellungen noch keine Auswahl getroffen haben. Wenn das Feld ausgewählt ist, wird die Benachrichtigung solchen Agenten zugestellt.',
        'This feature is currently not available.' => 'Diese Funktion ist derzeit nicht verfügbar.',
        'No data found' => 'Keine Daten gefunden',
        'No notification method found.' => 'Keine Benachrichtigungsmethode gefunden.',
        'Notification Text' => 'Benachrichtigungstext',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Diese Sprache ist im System nicht verfügbar oder deaktiviert. Der Benachrichtigungstext kann gelöscht werden, falls er nicht mehr benötigt wird.',
        'Remove Notification Language' => 'Benachrichtigungssprache entfernen',
        'Subject' => 'Betreff',
        'Text' => 'Text',
        'Message body' => 'Nachrichteninhalt',
        'Add new notification language' => 'Neue Sprache für Benachrichtigungen hinzufügen',
        'Save Changes' => 'Änderungen speichern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEventTransportEmailSettings.tt
        'Additional recipient email addresses' => 'Zusätzliche Empfänger-E-Mail-Adressen',
        'This field must have less then 200 characters.' => 'Dieses Feld darf nur aus genau oder weniger als 200 Zeichen bestehen.',
        'Article visible for customer' => 'Artikel für Kunde sichtbar',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Ein Artikel wird erstellt, wenn die Benachrichtigung an den Kunden oder an eine zusätzliche E-Mail-Adresse versendet wird.',
        'Email template' => 'E-Mail-Vorlage',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Benutzen Sie diese Vorlage, um die komplette E-Mail zu generieren (nur für HTML-E-Mails).',
        'Enable email security' => 'E-Mail-Sicherheit aktivieren',
        'Email security level' => 'E-Mail-Sicherheitsstufe',
        'If signing key/certificate is missing' => 'Wenn Schlüssel/Zertifikat zum Signieren fehlen',
        'If encryption key/certificate is missing' => 'Wenn Schlüssel/Zertifikat zum Verschlüsseln fehlen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAttachment.tt
        'Add Attachment' => 'Anhang hinzufügen',
        'Filter for Attachments' => 'Filter für Anhänge',
        'Filter for attachments' => 'Filter für Anhänge',
        'Related Actions' => 'Verwandte Aktionen',
        'Templates' => 'Vorlagen',
        'Templates ↔ Attachments' => 'Vorlagen ↔ Anhänge',
        'Attachment Management' => 'Verwaltung von Anhängen',
        'Edit Attachment' => 'Anhang bearbeiten',
        'Filename' => 'Dateiname',
        'Download file' => 'Datei herunterladen',
        'Delete this attachment' => 'Diesen Anhang entfernen',
        'Do you really want to delete this attachment?' => 'Möchten Sie diesen Anhang wirklich löschen?',
        'Attachment' => 'Anhang',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAutoResponse.tt
        'Add Auto Response' => 'Automatische Antwort hinzufügen',
        'Filter for Auto Responses' => 'Filter für automatische Antworten',
        'Filter for auto responses' => 'Filter für automatische Antworten',
        'Queues ↔ Auto Responses' => 'Queues ↔ Automatische Antworten',
        'Auto Response Management' => 'Verwaltung automatischer Antworten',
        'Edit Auto Response' => 'Automatische Antwort bearbeiten',
        'Response' => 'Antwort',
        'Auto response from' => 'Automatische Antwort von',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLog.tt
        'Time Range' => 'Zeitbereich',
        'Show only communication logs created in specific time range.' =>
            'Nur Verbindungsprotokolle anzeigen, die in einem bestimmten Zeitraum erfasst wurden.',
        'Filter for Communications' => 'Filter für Kommunikationen',
        'Filter for communications' => 'Filter für Kommunikationen',
        'Hint' => 'Hinweis',
        'In this screen you can see an overview about incoming and outgoing communications.' =>
            'Dieser Bereich zeigt eine Übersicht von eingehender und ausgehender Kommunikation.',
        'You can change the sort and order of the columns by clicking on the column header.' =>
            'Sie können die Sortierung und Reihenfolge von Spalten durch Anklicken der Spaltenköpfe verändern.',
        'If you click on the different entries, you will get redirected to a detailed screen about the message.' =>
            'Wenn Sie einen Eintrag anklicken, erhalten Sie eine Detailansicht der jeweiligen Nachricht.',
        'Communication Log' => 'Kommunikationsprotokoll',
        'Status for: %s' => 'Status für: %s',
        'Failing accounts' => 'Fehlschlagende Konten',
        'Some account problems' => 'Einige Kontoprobleme',
        'No account problems' => 'Keine Kontoprobleme',
        'No account activity' => 'Keine Kontoaktivität',
        'Number of accounts with problems: %s' => 'Anzahl der Konten mit Problemen: %s',
        'Number of accounts with warnings: %s' => 'Anzahl der Konten mit Warnungen: %s',
        'Failing communications' => 'Fehlgeschlagene Verbindungen',
        'No communication problems' => 'Keine Verbindungsprobleme',
        'No communication logs' => 'Keine Verbindungsprotokolle',
        'Number of reported problems: %s' => 'Anzahl gemeldeter Probleme: %s',
        'Open communications' => 'Offene Verbindungen',
        'No active communications' => 'Keine aktiven Verbindungen',
        'Number of open communications: %s' => 'Offene Verbindungen: %s',
        'Average processing time' => 'Durchschnittliche Verarbeitungszeit',
        'List of communications (%s)' => 'Kommunikationsliste (%s)',
        'Settings' => 'Einstellungen',
        'Entries per page' => 'Einträge pro Seite',
        'No communications found.' => 'Keine Verbindungen gefunden.',
        '%s s' => '%s s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogAccounts.tt
        'Back to overview' => 'Zurück zur Übersicht',
        'Filter for Accounts' => 'Filter für Konten',
        'Filter for accounts' => 'Filter für Konten',
        'You can change the sort and order of those columns by clicking on the column header.' =>
            'Sie können die Sortierung und Reihenfolge dieser Spalten durch Anklicken der Spaltenköpfe verändern.',
        'Account Status' => 'Kontostatus',
        'Account status for: %s' => 'Kontostatus für: %s',
        'Status' => 'Status',
        'Account' => 'Konto',
        'Edit' => 'Bearbeiten',
        'No accounts found.' => 'Keine Konten gefunden.',
        'Communication Log Details (%s)' => 'Details des Kommunikationsprotokolls (%s)',
        'Direction' => 'Richtung',
        'Start Time' => 'Startzeit',
        'End Time' => 'Endzeit',
        'No communication log entries found.' => 'Keine Protokolleinträge gefunden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogCommunications.tt
        'Duration' => 'Dauer',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogObjectLog.tt
        '#' => '#',
        'Priority' => 'Priorität',
        'Module' => 'Modul',
        'Information' => 'Information',
        'No log entries found.' => 'Keine Protokolleinträge gefunden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogZoom.tt
        'Filter for Log Entries' => 'Filter für Protokolleinträge',
        'Filter for log entries' => 'Filter für Protokolleinträge',
        'Show only entries with specific priority and higher:' => 'Nur Einträge mit bestimmter Priorität (und höher) anzeigen:',
        'Detail view for %s communication started at %s' => 'Detailansicht für Verbindung %s, gestartet um %s',
        'Communication Log Overview (%s)' => 'Kommunikationsprotokoll-Übersicht (%s)',
        'No communication objects found.' => 'Keine Kommunikationsobjekte gefunden.',
        'Communication Log Details' => 'Verbindungsprotokoll-Details',
        'Please select an entry from the list.' => 'Bitte wählen Sie einen Eintrag aus der Liste.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerCompany.tt
        'Search' => 'Suche',
        'Wildcards like \'*\' are allowed.' => 'Platzhalter wie \'*\' sind erlaubt.',
        'Add Customer' => 'Kunde hinzufügen',
        'Select' => 'Auswahl',
        'Customer Users' => 'Kundenbenutzer',
        'Customers ↔ Groups' => 'Kunden ↔ Gruppen',
        'Customer Management' => 'Kundenverwaltung',
        'Edit Customer' => 'Kunde bearbeiten',
        'List (only %s shown - more available)' => 'Liste (nur %s angezeigt - mehr verfügbar)',
        'total' => 'gesamt',
        'Please enter a search term to look for customers.' => 'Bitte geben Sie einen Suchbegriff ein, um nach Kunden zu suchen.',
        'Customer ID' => 'Kundennummer',
        'Please note' => 'Bitte beachten',
        'This customer backend is read only!' => 'Dieses Kunden-Backend kann nicht bearbeitet werden!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerGroup.tt
        'Notice' => 'Bemerkung',
        'This feature is disabled!' => 'Diese Funktion ist deaktiviert!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Verwenden Sie diese Funktion, wenn Sie Gruppenberechtigungen für Kunden definieren möchten.',
        'Enable it here!' => 'Hier aktivieren!',
        'Edit Customer Default Groups' => 'Standardgruppen für Kunden bearbeiten',
        'These groups are automatically assigned to all customers.' => 'Diese Gruppen werden allen Kunden automatisch zugewiesen.',
        'You can manage these groups via the configuration setting "CustomerGroupCompanyAlwaysGroups".' =>
            'Sie können diese Gruppen über die Konfigurationseinstellung "CustomerGroupCompanyAlwaysGroups" bearbeiten.',
        'Filter for Groups' => 'Filter für Gruppen',
        'Select the customer:group permissions.' => 'Wählen Sie die Gruppenberechtigungen für Kunden aus.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Wenn nichts ausgewählt ist, hat der Kunde in dieser Gruppe keine Rechte (und kann nicht auf Tickets zugreifen).',
        'Customers' => 'Kunden',
        'Groups' => 'Gruppen',
        'Manage Customer-Group Relations' => 'Kunden-Gruppen-Zuordnungen verwalten',
        'Search Results' => 'Suchergebnisse',
        'Change Group Relations for Customer' => 'Gruppenzuordnungen verwalten für Kunden',
        'Change Customer Relations for Group' => 'Kundenzuordnungen verwalten für Gruppe',
        'Toggle %s Permission for all' => 'Recht %s für alle umschalten',
        'Toggle %s permission for %s' => 'Recht %s für %s umschalten',
        'Customer Default Groups:' => 'Standard-Kundengruppen:',
        'No changes can be made to these groups.' => 'An diesen Gruppen können keine Änderungen vorgenommen werden.',
        'Reference' => 'Referenz',
        'ro' => 'ro',
        'Read only access to the ticket in this group/queue.' => 'Nur-Lesen-Zugriff auf Tickets in diesen Gruppen/Queues.',
        'rw' => 'rw',
        'Full read and write access to the tickets in this group/queue.' =>
            'Voller Schreib- und Lesezugriff auf Tickets in der Queue/Gruppe.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUser.tt
        'Back to search results' => 'Zurück zum Suchergebnis',
        'Add Customer User' => 'Kundenbenutzer hinzufügen',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Kundenbenutzer werden für die Bereitstellung einer Kundenhistorie und für die Anmeldung über den Kundenzugang benötigt.',
        'Customer Users ↔ Customers' => 'Kundenbenutzer ↔ Kunden',
        'Customer Users ↔ Groups' => 'Kundenbenutzer ↔ Gruppen',
        'Customer Users ↔ Services' => 'Kundenbenutzer ↔ Services',
        'Customer User Management' => 'Kundenbenutzer-Verwaltung',
        'Edit Customer User' => 'Kundenbenutzer bearbeiten',
        'List (%s total)' => 'Liste (%s insgesamt)',
        'Username' => 'Benutzername',
        'Email' => 'E-Mail',
        'Last Login' => 'Letzte Anmeldung',
        'Login as' => 'Anmelden als',
        'Switch to customer' => 'Zum Kunden wechseln',
        'This customer backend is read only, but the customer user preferences can be changed!' =>
            'Dieses Kunden-Backend kann nicht bearbeitet werden, aber die persönlichen Einstellungen der Kundenbenutzer sind editierbar!',
        'This field is required and needs to be a valid email address.' =>
            'Dieses Feld wird benötigt und muss eine gültige E-Mail-Adresse sein.',
        'This email address is not allowed due to the system configuration.' =>
            'Diese E-Mail-Adresse wird von der aktuellen Systemkonfiguration nicht zugelassen.',
        'This email address failed MX check.' => 'Für diese E-Mail-Adresse ist die MX-Prüfung fehlgeschlagen.',
        'DNS problem, please check your configuration and the error log.' =>
            'DNS-Problem, bitte prüfen Sie ihre Konfiguration und das Fehlerprotokoll.',
        'The syntax of this email address is incorrect.' => 'Die Syntax dieser E-Mail-Adresse ist fehlerhaft.',
        'This CustomerID is invalid.' => 'Diese Kundennummer ist ungültig.',
        'Effective Permissions for Customer User' => 'Effektive Berechtigungen für Kundenbenutzer',
        'Group Permissions' => 'Gruppenberechtigungen',
        'This customer user has no group permissions.' => 'Dieser Kundenbenutzer hat keine Gruppenberechtigungen.',
        'Table above shows effective group permissions for the customer user. The matrix takes into account all inherited permissions (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'Die obige Tabelle zeigt die effektiven Gruppenberechtigungen für den Kundenbenutzer. Die Matrix berücksichtigt dabei auch alle vererbten Berechtigungen (z.B. durch Kundengruppen). Hinweis: Die Tabelle zeigt Änderungen in diesem Bildschirm erst nach dem Speichern.',
        'Customer Access' => 'Kundenzugang',
        'Customer' => 'Kunde',
        'This customer user has no customer access.' => 'Dieser Kundenbenutzer hat keinen Kundenzugang.',
        'Table above shows granted customer access for the customer user by permission context. The matrix takes into account all inherited access (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'Die obige Tabelle zeigt den gewährten Kundenzugang für den Kundenbenutzer nach Berechtigungskontext. Die Matrix berücksichtigt dabei auch alle vererbten Berechtigungen (z.B. durch Kundengruppen). Hinweis: Die Tabelle zeigt Änderungen in diesem Bildschirm erst nach dem Speichern.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserCustomer.tt
        'Select the customer user:customer relations.' => 'Beziehung zwischen Kundenbenutzer und Kunde auswählen.',
        'Manage Customer User-Customer Relations' => 'Beziehungen zwischen Kundenbenutzern und Kunden verwalten',
        'Change Customer Relations for Customer User' => 'Kundenbeziehungen für Kundenbenutzer ändern',
        'Change Customer User Relations for Customer' => 'Kundenbenutzerbeziehungen für Kunde ändern',
        'Toggle active state for all' => 'Aktiv-Status für alle umschalten',
        'Active' => 'Aktiv',
        'Toggle active state for %s' => 'Aktiv-Status für %s umschalten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserGroup.tt
        'Just use this feature if you want to define group permissions for customer users.' =>
            'Verwenden Sie diese Funktion, wenn Sie Gruppenberechtigungen für Kundenbenutzer definieren möchten.',
        'Edit Customer User Default Groups' => 'Standardgruppen für Kundenbenutzer bearbeiten',
        'These groups are automatically assigned to all customer users.' =>
            'Diese Gruppen werden allen Kundenbenutzern automatisch zugewiesen.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Sie können diese Gruppen mit der Konfigurationseinstellung "CustomerGroupAlwaysGroups" bearbeiten.',
        'Filter for groups' => 'Filter für Gruppen',
        'Select the customer user - group permissions.' => 'Wählen Sie die Gruppenberechtigungen für Kundenbenutzer aus.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer user).' =>
            'Wenn nichts ausgewählt ist, hat der Kunde in dieser Gruppe keine Rechte (und kann nicht auf Tickets zugreifen).',
        'Manage Customer User-Group Relations' => 'Zuordnungen zwischen Kundenbenutzern und Gruppen verwalten',
        'Customer User Default Groups:' => 'Standardgruppen des Kundenbenutzers:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserService.tt
        'Edit default services' => 'Standardservices bearbeiten',
        'Filter for Services' => 'Filter für Services',
        'Filter for services' => 'Filter für Services',
        'Services' => 'Services',
        'Service Level Agreements' => 'Service-Level-Vereinbarungen',
        'Manage Customer User-Service Relations' => 'Kundenbenutzer-Service-Zuordnungen verwalten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicField.tt
        'Add new field for object' => 'Neues Feld hinzufügen für Objekt',
        'Filter for Dynamic Fields' => 'Filter für Dynamische Felder',
        'Filter for dynamic fields' => 'Filter für Dynamische Felder',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Um ein neues Feld hinzuzufügen, wählen Sie den Typ des Feldes aus der Liste der verfügbaren Typen für das jeweilige Objekt aus. Die Objekt-Auswahl ist bindend und kann nicht nachträglich verändert werden.',
        'Import and export of configurations' => 'Import und Export von Konfigurationen',
        'Upload a file in YAML format (as provided by the export) to import dynamic field configurations.' =>
            'Datei im YAML-Format hochladen (wie durch den Export bereitgestellt), um Konfigurationen für dynamische Felder zu importieren.',
        'Overwrite existing configurations' => 'Bestehende Konfigurationen überschreiben',
        'Import configurations' => 'Konfigurationen importieren',
        'Export configurations' => 'Konfigurationen exportieren',
        'Process Management' => 'Prozessmanagement',
        'Dynamic fields ↔ Screens' => 'Dynamische Felder ↔ Masken',
        'Dynamic Fields Management' => 'Verwaltung Dynamischer Felder',
        'Dynamic Fields List' => 'Dynamische Felder - Liste',
        'Dynamic fields per page' => 'Dynamische Felder pro Seite',
        'Label' => 'Beschriftung',
        'Order' => 'Sortierung',
        'Object' => 'Objekt',
        'Delete this field' => 'Dieses Feld löschen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldCheckbox.tt
        'Go back to overview' => 'Zurück zur Übersicht gehen',
        'Dynamic Fields' => 'Dynamische Felder',
        'General' => 'Allgemein',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Dieses Feld wird benötigt, und der Wert darf nur Buchstaben und Zahlen enthalten.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Muss eindeutig sein und darf nur aus Buchstaben und Zahlen bestehen.',
        'Changing this value will require manual changes in the system.' =>
            'Eine Änderung dieses Wertes macht weitere manuelle Änderungen am System erforderlich.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Dieser Name wird auf den Bildschirmen angezeigt, auf denen dieses Feld aktiv ist.',
        'Field order' => 'Feldreihenfolge',
        'This field is required and must be numeric.' => 'Dieses Feld wird benötigt und darf nur Zahlen enthalten.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Die Feldreihenfolge steuert die Ausgabe der Felder auf den Bildschirmen.',
        'Is not possible to invalidate this entry, all config settings have to be changed beforehand.' =>
            'Es ist nicht möglich, diesen Eintrag auf ungültig zu setzen, bevor alle betroffenen Konfiguration entsprechend angepasst wurden.',
        'Field type' => 'Feldtyp',
        'Object type' => 'Objekttyp',
        'Internal field' => 'Internes Feld',
        'This field is protected and can\'t be deleted.' => 'Dies ist ein geschütztes internes Feld und kann nicht gelöscht werden.',
        'This dynamic field is used in the following config settings:' =>
            'Dieses Dynamische Feld wird in folgenden Konfigurationseinstellungen verwendet:',
        'Field Settings' => 'Feldeinstellungen',
        'Default value' => 'Standardwert',
        'This is the default value for this field.' => 'Dies ist der Standardwert für dieses Feld.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldConfigurationImportExport.tt
        'Select the dynamic fields you want to import and click on \'Import\'.' =>
            'Wählen Sie die dynamischen Felder, deren Konfiguration importiert werden soll und klicken Sie auf \'Importieren\'.',
        'Select the dynamic fields whose configuration you want to export and click on \'Export\' to generate a YAML file.' =>
            'Wählen Sie die dynamischen Felder, deren Konfiguration exportiert werden soll und klicken Sie auf \'Export\', um eine YAML-Datei zu erstellen.',
        'Dynamic field configurations: %s' => 'Konfigurationen dynamischer Felder: %s',
        'Dynamic fields' => 'Dynamische Felder',
        'For the following dynamic fields a configuration cannot be imported because of an invalid backend.' =>
            'Für die folgenden dynamischen Felder kann keine Konfiguration importiert werden, da das Backend ungültig ist.',
        'Select all field configurations' => 'Alle Feldkonfigurationen wählen',
        'Select all screen configurations' => 'Alle Maskenkonfigurationen wählen',
        'The uploaded file does not contain configuration(s), is not a YAML file, is damaged or has the wrong structure.' =>
            'Die hochgeladene Datei enthält keine Konfiguration(en), ist keine YAML-Datei, ist beschädigt oder hat die falsche Struktur.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDateTime.tt
        'Default date difference' => 'Standard-Datumsunterschied',
        'This field must be numeric.' => 'Dieses Feld darf nur Zahlen beinhalten.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Der Unterschied zu JETZT in Sekunden, mit dem der Standardwert des Feldes berechnet wird (z. B. 3600 oder -60).',
        'Define years period' => 'Jahresbereich definieren',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Aktivieren Sie diese Funktion, um für die Datumsauswahl einen festen Jahresbereich zu definieren (Jahre in der Vergangenheit und Zukunft).',
        'Years in the past' => 'Jahre in der Vergangenheit',
        'Years in the past to display (default: 5 years).' => 'Jahre in der Vergangenheit, die angezeigt werden (Standard: 5).',
        'Years in the future' => 'Jahre in der Zukunft',
        'Years in the future to display (default: 5 years).' => 'Jahre in der Zukunft, die angezeigt werden (Standard: 5).',
        'Show link' => 'Link anzeigen',
        'Reserved keywords. The following placeholders are not allowed:' =>
            'Reservierte Schlüsselwörter. Die folgenden Platzhalter sind nicht erlaubt:',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Hier können Sie einen optionalen HTTP-Link für den Feldwert in Übersichten und Ansichtsseiten angeben.',
        'If special characters (&, @, :, /, etc.) should not be encoded, use \'url\' instead of \'uri\' filter.' =>
            'Wenn Sonderzeichen (&, @, :, /, etc.) nicht kodiert werden sollen, verwenden Sie den Filter \'url\' anstelle des Filters \'uri\'.',
        'Example' => 'Beispiel',
        'Link for preview' => 'Link für Vorschau',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Diese URL wird (falls vorhanden) für eine Vorschau verwendet, wenn sich die Maus über diesem Link in der Ticketansicht befindet. Hierfür muss das oben stehende URL-Feld ebenso ausgefüllt werden.',
        'Restrict entering of dates' => 'Eingabe von Daten einschränken',
        'Here you can restrict the entering of dates of tickets.' => 'Hier können Sie die Eingabe von Daten in dieses Feld einschränken.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDropdown.tt
        'Possible values' => 'Mögliche Werte',
        'Key' => 'Schlüssel',
        'Value' => 'Wert',
        'Remove value' => 'Wert löschen',
        'Add value' => 'Wert hinzufügen',
        'Add Value' => 'Wert hinzufügen',
        'Add empty value' => 'Leeren Wert hinzufügen',
        'Activate this option to create an empty selectable value.' => 'Aktivieren Sie diese Option, um einen leeren Auswahlwert zu erstellen.',
        'Tree View' => 'Baumansicht',
        'Activate this option to display values as a tree.' => 'Aktivieren Sie diese Option um die Werte als Baum anzuzeigen.',
        'Translatable values' => 'Wertübersetzung',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Wenn Sie diese Option aktivieren, werden die Werte in die Sprache des Benutzers übersetzt.',
        'Note' => 'Notiz',
        'You need to add the translations manually into the language translation files.' =>
            'Sie müssen die Übersetzungen manuell zu den Übersetzungsdateien hinzufügen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldScreenConfiguration.tt
        'Assignment of dynamic fields to screens' => 'Zuordnung von dynamischen Feldern zu Masken',
        'Overview' => 'Übersicht',
        'Screens' => 'Masken',
        'Overview Default Columns' => 'Übersicht Standardspalten',
        'Add dynamic field' => 'Dynamisches Feld hinzufügen',
        'You can assign elements by dragging and dropping them to the lists of available, disabled, assigned and required elements.' =>
            'Sie können Elemente zuweisen, indem Sie sie auf die Listen von verfügbaren, deaktivierten, zugewiesenen und erforderlichen Elementen ziehen und ablegen.',
        'Filter available elements' => 'Verfügbare Elemente filtern',
        'Assign selected elements to this list' => 'Gewählte Elemente zu dieser Liste hinzufügen',
        'Select all' => 'Alle auswählen',
        'Filter disabled elements' => 'Deaktivierte Elemente filtern',
        'Filter assigned elements' => 'Zugewiesene Elemente filtern',
        'Filter required elements' => 'Erforderliche Elemente filtern',
        'Reset' => 'Zurücksetzen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldText.tt
        'Number of rows' => 'Anzahl der Zeilen',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Gibt die Anzahl der Zeilen für dieses Feld im Bearbeitungsmodus an.',
        'Number of cols' => 'Anzahl der Spalten',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Gibt die Breite in Zeichen für dieses Feld im Bearbeitungsmodus an.',
        'Check RegEx' => 'Auf RegEx prüfen',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Hier können Sie einen regulären Ausdruck definieren um den Wert zu prüfen. Der RegEx wird mit den Modifikatoren xms ausgeführt.',
        'RegEx' => 'RegEx',
        'Invalid RegEx' => 'Ungültige RegEx',
        'Error Message' => 'Fehlermeldung',
        'Add RegEx' => 'RegEx hinzufügen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice.tt
        'Default search term' => 'Standardwert für die Suche',
        'This is the default term for the click search.' => 'Dies ist der Standardbegriff für die Klicksuche.',
        'Initial default search term' => 'Initialer Standardwert für die Suche',
        'This is the default search term when the mask is loaded.' => 'Dies ist der Standardbegriff für die Suche, wenn die Maske geladen wird.',
        'Attributes' => 'Attribute',
        'Attributes for invoker execution (initially default values will be used).' =>
            'Attribute für Invoker-Ausführung (initial werden Defaultwerte verwendet).',
        'Attribute keys' => 'Attribut-Schlüssel',
        'Custom attribute form for invoker execution.' => 'Benutzerdefiniertes Attributformular für die Invoker-Ausführung.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/Config.tt
        'Web service' => 'Webservice',
        'Web service which will be used for this dynamic field.' => 'Webservice, der für dieses dynamische Feld verwendet werden soll.',
        'Invoker to search for records' => 'Invoker zur Datensatz-Suche',
        'Invoker which will be used for this dynamic field. Searches for the search term(s) and returns an array as result. Note: The invoker needs to be enabled in the web service you specified above.' =>
            'Invoker, welcher für dieses dynamische Feld verwendet werden soll. Sucht nach den Suchbegriffen und liefert ein Array als Ergebnis zurück. Hinweis: Der Invoker muss im oben angegebenen Webservice aktiviert sein.',
        'Invoker to get a record' => 'Invoker zur Abfrage eines Datensatzes',
        'Invoker which will be used for this dynamic field. Returns a hash of the record that will be found when searching for its identifier in the field configured in \'key for stored value\' below. Note: The invoker needs to be enabled in the web service you specified above.' =>
            'Invoker, welcher für dieses dynamische Feld verwendet werden soll. Gibt einen Hash des Datensatzes zurück, der bei der Suche nach seinem Bezeichner in dem unten unter "Schlüssel für den gespeicherten Wert" konfigurierten Feld gefunden wird. Hinweis: Der Invoker muss im oben angegebenen Webservice aktiviert sein.',
        'Backend' => 'Backend',
        'Backend which will be used for this dynamic field.' => 'Backend, das für dieses dynamische Feld benutzt wird.',
        'Backend documentation' => 'Backend-Dokumentation',
        'Cache TTL' => 'Cache-TTL',
        'TTL (in seconds) for caching request results. Leave empty or set to 0 to disable caching.' =>
            'TTL (in Sekunden) für Cache der Request-Ergebnisse. Leerlassen oder auf 0 setzen, um Cache zu deaktivieren.',
        'Key for search' => 'Schlüssel für Suche',
        'The keys (separated by comma) that will be searched when using the autocomplete while entering a value for the dynamic field.' =>
            'Schlüssel (kommasepariert), die bei Eingabe eines Werts im dynamischen Feld durchsucht werden.',
        'Key for stored value' => 'Schlüssel für den gespeicherten Wert',
        'The key whose value will be stored in the dynamic field.' => 'Schlüssel, dessen Wert im dynamischen Feld gespeichert wird.',
        'Key to display' => 'Schlüssel zur Anzeige',
        'The keys (separated by comma) that will be shown when the value of the dynamic field is being displayed. This also affects the value displayed in the autocomplete field when entering a value. If this field is left empty, the stored value from above will be displayed.' =>
            'Schlüssel (kommasepariert), deren Werte bei Ausgabe des dynamischen Felds angezeigt werden. Dies beeinflusst auch den angezeigten Wert bei der Eingabe per Auto-Complete. Wenn diese Konfigurationsoption leer gelassen wird, wird der im dynamischen Feld gespeicherte Wert angezeigt.',
        'Template Type' => 'Vorlagentyp',
        'This configuration determines how the values of the dynamic field are output in templates or masks.' =>
            'Diese Konfiguration legt fest, wie die Werte des dynamischen Felds in Templates oder Masken ausgegeben werden.',
        'Separator to display between multi-key values' => 'Trennzeichen zur Anzeige zwischen Werten mit mehreren Schlüsseln.',
        'The separator to show between the values if there\'s more than one key configured to be displayed above. If left empty, a single space will be used as separator. Use <space> to add spaces.' =>
            'Trennzeichen, das zwischen Anzeigewerten angezeigt wird, wenn oben mehr als ein Schlüssel zur Anzeige konfiguriert ist. Wenn diese Konfigurationsoption leer gelassen wird, die ein Leerzeichen als Trennzeichen verwendet. Benutzen Sie <space>, um Leerzeichen zu konfigurieren.',
        'Limit' => 'Limit',
        'Maximum number of results for web service queries, e.g. for autocomplete selection list.' =>
            'Maximale Anzahl von Ergebnissen für Webservice-Abfragen, z. B. für die automatische Vervollständigung der Auswahlliste.',
        'Autocomplete min. input length' => 'Min. Länge für Autovervollständigung',
        'Minimum length of input for autocomplete field to trigger search.' =>
            'Mindestlänge der Eingabe im Autocomplete-Feld, um die Suche auszulösen.',
        'Query delay' => 'Abfrage-Verzögerung',
        'Delay (in milliseconds) until the AJAX request will be sent.' =>
            'Verzögerung (in Millisekunden) bis der AJAX-Request abgeschickt wird.',
        'Input field width' => 'Breite des Eingabefelds',
        'Width of the input field (percentage).' => 'Breite des Eingabefelds (in Prozent).',
        'Additional dynamic field storage' => 'Zusätzliche dynamische Felder befüllen',
        'Dynamic field' => 'Dynamisches Feld',
        'Restore values' => 'Werte wiederherstellen',
        'These dynamic fields are also filled with values from the same record.' =>
            'Diese dynamischen Felder werden ebenfalls mit Werten aus demselben Datensatz befüllt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/Test.tt
        'Test settings' => 'Einstellungen testen',
        'Error while testing configuration. Please check the configuration.' =>
            'Fehler beim Testen der Konfiguration. Bitte überprüfen Sie die Konfiguration.',
        'Test was successful.' => 'Test war erfolgreich.',
        'Test this dynamic field exactly as it is displayed in the editing dialogs.' =>
            'Testen Sie dieses dynamische Feld exakt so wie es in den Bearbeitungsdialogen angezeigt wird.',
        'Enter a search term to test the current settings.' => 'Geben Sie einen Suchbegriff ein, um aktuellen Einstellungen zu testen.',
        'Click "Test settings"' => 'Klicken Sie auf "Einstellungen testen"',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldWebservice/TestData.tt
        'DisplayValue' => 'Anzeigewert',
        'StoredValue' => 'gespeicherter Wert',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminEmail.tt
        'With this module, administrators can send messages to agents, group or role members.' =>
            'Mit diesem Modul können Administratoren Nachrichten an Agenten, Gruppen oder Rollenmitglieder senden.',
        'Admin Message' => 'Administrator-Nachricht',
        'Create Administrative Message' => 'Administrator-Nachricht erstellen',
        'Your message was sent to' => 'Ihre Nachricht wurde gesendet an',
        'From' => 'Von',
        'Send message to users' => 'Nachricht an Benutzer senden',
        'Send message to group members' => 'Nachricht an Gruppenmitglieder senden',
        'Group members need to have permission' => 'Gruppenmitglieder brauchen eine Berechtigung',
        'Send message to role members' => 'Nachricht an Rollenmitglieder senden',
        'Also send to customers in groups' => 'Auch an Kunden der Gruppe senden',
        'Body' => 'Text',
        'Send' => 'Senden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericAgent.tt
        'Add Job' => 'Auftrag hinzufügen',
        'Filter for Jobs' => 'Aufträge filtern',
        'Filter for jobs' => 'Aufträge filtern',
        'Generic Agent Job Management' => 'Generic Agent-Auftragsverwaltung',
        'Edit Job' => 'Auftrag bearbeiten',
        'Run Job' => 'Auftrag ausführen',
        'Last run' => 'Letzte Ausführung',
        'Run' => 'Start',
        'Delete this task' => 'Diesen Auftrag löschen',
        'Run this task' => 'Diesen Auftrag ausführen',
        'Do you really want to delete this generic agent job?' => 'Wollen Sie diesen GenericAgent-Job wirklich löschen?',
        'Job Settings' => 'Auftragseinstellungen',
        'Job name' => 'Auftragsname',
        'The name you entered already exists.' => 'Der eingegebene Name existiert bereits.',
        'Automatic Execution (Multiple Tickets)' => 'Automatische Ausführung (mehrere Tickets)',
        'Execution Schedule' => 'Ausführungsplan',
        'Schedule minutes' => 'Ausführen zu Minute(n)',
        'Schedule hours' => 'Ausführen zu Stunde(n)',
        'Schedule days' => 'Ausführen an Tag(en)',
        'Automatic execution values are in the system timezone.' => 'Die Werte für die automatische Ausführung liegen in der Systemzeitzone.',
        'Currently this generic agent job will not run automatically.' =>
            'Derzeit würde dieser GenericAgent-Auftrag nicht automatisch ausgeführt werden.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Um ihn automatisch auszuführen, muss mindestens je ein Wert von Minuten, Stunden und Tagen ausgewählt werden!',
        'Event Based Execution (Single Ticket)' => 'Ereignisbasierte Ausführung (einzelnes Ticket)',
        'Event Triggers' => 'Ereignis-Auslöser',
        'List of all configured events' => 'Liste aller konfigurierten Ereignisse',
        'Delete this event' => 'Dieses Ereignis löschen',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Zusätzlich oder alternativ zur periodischen Ausführung können Sie Ticket-Ereignisse angeben, bei denen dieser Auftrag ausgeführt werden soll.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Wenn ein Ticket-Ereignis ausgelöst wird, wird zunächst der Ticket-Filter angewendet um zu prüfen, ob das Ticket betroffen ist. Erst danach wird der Auftrag ggf. für dieses Ticket ausgeführt.',
        'Add Event Trigger' => 'Ereignis-Auslöser hinzufügen',
        'To add a new event select the event object and event name' => 'Wählen Sie Ereignisobjekt und -Name, um ein neues Ereignis hinzuzufügen',
        'Do you really want to delete this event trigger?' => 'Wollen Sie diesen Ereignis-Auslöser wirklich löschen?',
        'Select Tickets' => 'Tickets selektieren',
        '(e. g. 10*5155 or 105658*)' => '(z .B. 10*5155 oder 105658*)',
        '(e. g. 234321)' => '(z. B. 234321)',
        'Customer user ID' => 'Kundenbenutzer-Nummer',
        '(e. g. U5150)' => '(z. B. U5150)',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Volltextsuche in Artikeln (z. B. "Mar*in" oder "Baue*").',
        'To' => 'An',
        'Cc' => 'Cc',
        'Service' => 'Service',
        'Service Level Agreement' => 'Service-Level-Vereinbarung',
        'Queue' => 'Queue',
        'State' => 'Status',
        'Agent' => 'Agent',
        'Owner' => 'Besitzer',
        'Responsible' => 'Verantwortlicher',
        'Ticket lock' => 'Ticketsperre',
        'Create times' => 'Erstellzeiten',
        'No create time settings.' => 'Keine Erstellzeit-Einstellungen.',
        'Ticket created' => 'Ticket erstellt',
        'Ticket created between' => 'Ticket erstellt zwischen',
        'and' => 'und',
        'Last changed times' => 'Letzte Änderungszeiten',
        'No last changed time settings.' => 'Keine Einstellungen für letzte Änderungszeiten.',
        'Ticket last changed' => 'Ticket zuletzt geändert',
        'Ticket last changed between' => 'Ticket zuletzt geändert zwischen',
        'Change times' => 'Änderungszeiten',
        'No change time settings.' => 'Keine Änderungszeit-Einstellungen.',
        'Ticket changed' => 'Ticket geändert',
        'Ticket changed between' => 'Ticket geändert zwischen',
        'Last close times' => 'Letzte Schließungszeiten',
        'No last close time settings.' => 'Keine letzten Schließzeit-Einstellungen.',
        'Ticket last close' => 'Letztes Schließen des Tickets',
        'Ticket last close between' => 'Letztes Schließen des Tickets zwischen',
        'Close times' => 'Schließzeiten',
        'No close time settings.' => 'Keine Schließzeit-Einstellungen.',
        'Ticket closed' => 'Ticket geschlossen',
        'Ticket closed between' => 'Ticket geschlossen zwischen',
        'Pending times' => 'Erinnerungszeiten',
        'No pending time settings.' => 'Keine Erinnerungszeit-Einstellungen.',
        'Ticket pending time reached' => 'Ticket-Erinnerungszeit erreicht',
        'Ticket pending time reached between' => 'Ticket-Erinnerungszeit erreicht zwischen',
        'Escalation times' => 'Eskalationszeiten',
        'No escalation time settings.' => 'Keine Eskalationszeit-Einstellungen.',
        'Ticket escalation time reached' => 'Ticket-Eskalationszeit erreicht',
        'Ticket escalation time reached between' => 'Ticket-Eskalationszeit erreicht zwischen',
        'Escalation - first response time' => 'Eskalation - Zeit für erste Reaktion',
        'Ticket first response time reached' => 'Ticket-Reaktionszeit erreicht',
        'Ticket first response time reached between' => 'Ticket-Reaktionszeit erreicht zwischen',
        'Escalation - update time' => 'Eskalation - Aktualisierungszeit',
        'Ticket update time reached' => 'Ticket-Aktualisierungszeit erreicht',
        'Ticket update time reached between' => 'Ticket-Aktualisierungszeit erreicht zwischen',
        'Escalation - solution time' => 'Eskalation - Lösungszeit',
        'Ticket solution time reached' => 'Ticket-Lösungszeit erreicht',
        'Ticket solution time reached between' => 'Ticket-Lösungszeit erreicht zwischen',
        'Archive search option' => 'Im Archiv suchen',
        'Update/Add Ticket Attributes' => 'Ticket-Attribute aktualisieren/hinzufügen',
        'Set new service' => 'Neuen Service festlegen',
        'Set new Service Level Agreement' => 'Neues Service-Level-Abkommen festlegen',
        'Set new priority' => 'Neue Priorität festlegen',
        'Set new queue' => 'Neue Queue festlegen',
        'Set new state' => 'Neuen Status setzen',
        'Pending date' => 'Warten bis',
        'Set new agent' => 'Neuen Agenten festlegen',
        'new owner' => 'Neuer Besitzer',
        'new responsible' => 'Neuer Verantwortlicher',
        'Set new ticket lock' => 'Neue Ticketsperre festlegen',
        'New customer user ID' => 'Neue Kundenbenutzer-Nummer',
        'New customer ID' => 'Neue Kundennummer',
        'New title' => 'Neuer Titel',
        'New type' => 'Neuer Typ',
        'Archive selected tickets' => 'Ausgewählte Tickets archivieren',
        'Add Note' => 'Notiz hinzufügen',
        'Visible for customer' => 'Sichtbar für Kunde',
        'Time units' => 'Zeiteinheiten',
        'Execute Ticket Commands' => 'Ticket-Befehle ausführen',
        'Send agent/customer notifications on changes' => 'Sende eine Agenten-/Kunden-Benachrichtigung bei Änderungen',
        'Delete tickets' => 'Tickets löschen',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Warnung: Alle betroffenen Tickets werden aus der Datenbank gelöscht und können nicht wiederhergestellt werden!',
        'Execute Custom Module' => 'Benutzerdefiniertes Modul ausführen',
        'Param %s key' => 'Schlüssel für Parameter %s',
        'Param %s value' => 'Wert für Parameter %s',
        'Results' => 'Ergebnisse',
        '%s Tickets affected! What do you want to do?' => '%s Tickets sind betroffen! Was wollen Sie tun?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Warnung: Sie verwenden die Option LÖSCHEN. Alle gelöschten Tickets gehen verloren!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Warnung: %s Tickets sind betroffen, aber nur %s können während der Ausführung eines Auftrages geändert werden!',
        'Affected Tickets' => 'Betroffene Tickets',
        'Age' => 'Alter',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceDebugger.tt
        'Go back to web service' => 'Zurück zum Webservice',
        'Clear' => 'Leeren',
        'Do you really want to clear the debug log of this web service?' =>
            'Möchten Sie wirklich das Debug-Protokoll dieses Webservices löschen?',
        'GenericInterface Web Service Management' => 'GenericInterface - Webservice-Verwaltung',
        'Web Service Management' => 'Webservice-Verwaltung',
        'Debugger' => 'Debugger',
        'Request List' => 'Anfrageliste',
        'Time' => 'Zeit',
        'Communication ID' => 'Verbindungs-ID',
        'Remote IP' => 'Remote-IP',
        'Loading' => 'Lade',
        'Select a single request to see its details.' => 'Wählen Sie eine Anfrage aus, um die Details zu sehen.',
        'Filter by type' => 'Filtern nach Typ',
        'Filter from' => 'Filter von',
        'Filter to' => 'Filter bis',
        'Filter by remote IP' => 'Filter nach Remote-IP',
        'Refresh' => 'Aktualisieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingDefault.tt
        'Do you really want to delete this error handling module?' => 'Möchten Sie dieses Fehlerbehandlungs-Modul wirklich löschen?',
        'All configuration data will be lost.' => 'Die Konfigurationsdaten gehen verloren.',
        'Add ErrorHandling' => 'Fehlerbehandlung hinzufügen',
        'Edit ErrorHandling' => 'Fehlerbehandlung bearbeiten',
        'General options' => 'Allgemeine Optionen',
        'The name can be used to distinguish different error handling configurations.' =>
            'Der Name kann dazu genutzt werden, um unterschiedliche Konfigurationen zur Fehlerbehandlung voneinander zu unterscheiden.',
        'Please provide a unique name for this web service.' => 'Bitte geben Sie einen eindeutigen Namen für diesen Webservice an.',
        'Error handling module backend' => 'Fehlerbehandlungs-Modul-Backend',
        'This Znuny error handling backend module will be called internally to process the error handling mechanism.' =>
            'Das Znuny Fehlerbehandlungs-Modul-Backend wird intern aufgerufen um die Fehlerbehandlung auszuführen.',
        'Processing options' => 'Verarbeitungsoptionen',
        'Configure filters to control error handling module execution.' =>
            'Konfigurieren Sie Filter, um die Ausführung des Fehlerbehandlungs-Moduls zu steuern.',
        'Only requests matching all configured filters (if any) will trigger module execution.' =>
            'Ausschließlich Anfragen welche allen konfigurierten Filtern entsprechen (sofern vorhanden) bewirken die Ausführung des Moduls.',
        'Operation filter' => 'Operation-Filter',
        'Only execute error handling module for selected operations.' => 'Ausführung des Fehlerbehandlungs-Moduls nur für die ausgewählten Operations.',
        'Note: Operation is undetermined for errors occuring while receiving incoming request data. Filters involving this error stage should not use operation filter.' =>
            'Hinweis: Für Fehler, welche beim Empfangen der eingehenden Anfragedaten auftreten ist die Operation unbestimmt. Filter für diese Verarbeitungsphase sollten keinen Operation-Filter nutzen.',
        'Invoker filter' => 'Invoker-Filter',
        'Only execute error handling module for selected invokers.' => 'Ausführung des Fehlerbehandlungs-Moduls nur für die ausgewählten Invoker.',
        'Error message content filter' => 'Filter für Inhalte von Fehlermeldungen',
        'Enter a regular expression to restrict which error messages should cause error handling module execution.' =>
            'Geben Sie einen regulären Ausdruck an, um die Fehlermeldungen einzuschränken, welche zur Ausführung des Fehlerbehandlungs-Moduls führen.',
        'Error message subject and data (as seen in the debugger error entry) will considered for a match.' =>
            'Titel und Inhalt der Fehlermeldung (wie im entsprechenden Debugger-Eintrag ersichtlich) werden auf Übereinstimmungen geprüft.',
        'Example: Enter \'^.*401 Unauthorized.*\$\' to handle only authentication related errors.' =>
            'Beispiel: Geben Sie \'^.*401 Unauthorized.*\$\'  ein, um ausschließlich authentifizierungsrelevante Fehlermeldungen zu handhaben.',
        'Error stage filter' => 'Filter für Verarbeitungsphasen',
        'Only execute error handling module on errors that occur during specific processing stages.' =>
            'Ausführung des Fehlerbehandlungs-Moduls nur für die ausgewählten Verarbeitungsphasen.',
        'Example: Handle only errors where mapping for outgoing data could not be applied.' =>
            'Beispiel: Ausschließlich Fehler behandeln, welche beim Mapping ausgehender Daten auftreten.',
        'Error code' => 'Fehlercode',
        'An error identifier for this error handling module.' => 'Ein Fehleridentifikator für dieses Fehlerbehandlungs-Modul.',
        'This identifier will be available in XSLT-Mapping and shown in debugger output.' =>
            'Dieser Identifikator wird in der Debugger-Ausgabe angezeigt und im XSLT-Mapping verfügbar gemacht.',
        'Error message' => 'Fehlermeldung',
        'An error explanation for this error handling module.' => 'Eine Fehlerbeschreibung für dieses Fehlerbehandlungs-Modul.',
        'This message will be available in XSLT-Mapping and shown in debugger output.' =>
            'Diese Beschreibung wird in der Debugger-Ausgabe angezeigt und im XSLT-Mapping verfügbar gemacht.',
        'Define if processing should be stopped after module was executed, skipping all remaining modules or only those of the same backend.' =>
            'Legt fest, ob die Fehlerbehandlung nach Ausführung dieses Module beendet werden soll. Entweder werden alle verbleibenden Module oder nur die Module des selben Backends übersprungen.',
        'Default behavior is to resume, processing the next module.' => 'Das standardmäßige Verhalten ist die anschließende Ausführung des nächsten Moduls.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingRequestRetry.tt
        'This module allows to configure scheduled retries for failed requests.' =>
            'Dieses Modul erlaubt die Konfiguration von geplanten Wiederholungen für fehlgeschlagene Anfragen.',
        'Default behavior of GenericInterface web services is to send each request exactly once and not to reschedule after errors.' =>
            'Das standardmäßige Verhalten von GenericInterface Webservices ist es, jede Anfrage nur genau einmal zu versenden und diese nach dem Auftreten von Fehlern nicht neu einzuplanen.',
        'If more than one module capable of scheduling a retry is executed for an individual request, the module executed last is authoritative and determines if a retry is scheduled.' =>
            'Wenn für eine einzelne Anfrage mehr als ein Modul ausgeführt wird, das in der Lage ist, einen Wiederholungsversuch zu planen, dann ist das zuletzt ausgeführte Modul maßgebend und bestimmt, ob ein Wiederholungsversuch geplant ist.',
        'Request retry options' => 'Optionen zur Wiederholung von Anfragen',
        'Retry options are applied when requests cause error handling module execution (based on processing options).' =>
            'Wiederholungsoptionen werden angewendet, wenn Anfragen die Ausführung von Fehlerbehandlungs-Modulen verursachen (basierend auf Verarbeitungsoptionen).',
        'Schedule retry' => 'Wiederholung planen',
        'Should requests causing an error be triggered again at a later time?' =>
            'Sollen fehlerhafte Anfragen zu einem späteren Zeitpunkt erneut ausgeführt werden?',
        'Initial retry interval' => 'Initialer Abstand für Wiederholungen',
        'Interval after which to trigger the first retry.' => 'Intervall für die Planung der ersten Wiederholung.',
        'Note: This and all further retry intervals are based on the error handling module execution time for the initial request.' =>
            'Hinweis: Der Abstand für diese sowie alle weiteren Wiederholungen wird basierend auf der Ausführungszeit des Fehlerbehandlungs-Moduls für die initiale Anfrage berechnet.',
        'Factor for further retries' => 'Faktor für weitere Wiederholungen',
        'If a request returns an error even after a first retry, define if subsequent retries are triggered using the same interval or in increasing intervals.' =>
            'Geben Sie an, ob weitere Wiederholungen mit dem selben Intervall oder in aufsteigenden Abständen geplant werden sollen, sofern eine Anfrage nach der ersten Wiederholung noch fehlerhaft ist.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\' and retry factor at \'2\', retries would be triggered at 10:01 (1 minute), 10:03 (2*1=2 minutes), 10:07 (2*2=4 minutes), 10:15 (2*4=8 minutes), ...' =>
            'Beispiel: Wenn eine Anfrage initial um 10:00 Uhr mit dem initialen Abstand \'1 Minute\' und dem Wiederholungsfaktor \'2\' ausgeführt wird, würden Wiederholungen um 10:01 Uhr (1 Minute), 10:03 Uhr (2*1=2 Minuten), 10:07 Uhr (2*2=4 Minuten), 10:15 Uhr (2*4=8 Minuten), ... ausgeführt.',
        'Maximum retry interval' => 'Maximaler Abstand für Wiederholungen',
        'If a retry interval factor of \'1.5\' or \'2\' is selected, undesirably long intervals can be prevented by defining the largest interval allowed.' =>
            'Falls ein Wiederholungsfaktor von \'1.5\' oder \'2\' ausgewählt wurde, können unerwünscht lange Abstände verhindert werden, indem ein größtmögliches Intervall angegeben wird.',
        'Intervals calculated to exceed the maximum retry interval will then automatically be shortened accordingly.' =>
            'Berechnete Intervalle, die den festgelegten maximalen Abstand überschreiten würden, werden automatisch entsprechend gekürzt.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum interval at \'5 minutes\', retries would be triggered at 10:01 (1 minute), 10:03 (2 minutes), 10:07 (4 minutes), 10:12 (8=>5 minutes), 10:17, ...' =>
            'Beispiel: Wenn eine Anfrage initial um 10:00 Uhr mit dem initialen Abstand \'1 Minute\', dem Wiederholungsfaktor \'2\' und dem maximalen Intervall von \'5 Minuten\' ausgeführt wird, würden Wiederholungen um 10:01 Uhr (1 Minute), 10:03 Uhr (2 Minuten), 10:07 Uhr (4 Minuten), 10:12 Uhr (8=>5 Minuten), 10:17 Uhr, ... ausgeführt.',
        'Maximum retry count' => 'Maximale Anzahl an Wiederholungen',
        'Maximum number of retries before a failing request is discarded, not counting the initial request.' =>
            'Maximale Anzahl an Wiederholungen bevor eine fehlerhafte Anfrage verworfen wird (die initiale Anfrage wird nicht mitgezählt).',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry count at \'2\', retries would be triggered at 10:01 and 10:02 only.' =>
            'Beispiel: Wenn eine Anfrage inital um 10:00 Uhr mit dem initialen Abstand \'1 Minute\', einem Wiederholungsfaktor \'2\' und der maximalen Anzahl an Wiederholungen von \'2\' ausgeführt wird, würden Wiederholungen ausschließlich um 10:01 Uhr und um 10:02 Uhr ausgeführt.',
        'Note: Maximum retry count might not be reached if a maximum retry period is configured as well and reached earlier.' =>
            'Hinweis: Die maximale Anzahl an Wiederholungen könnte nicht erreicht werden, sofern auch ein maximaler Zeitraum für Wiederholungen konfiguriert wurde und dieser früher erreicht wird.',
        'This field must be empty or contain a positive number.' => 'Dieses Feld muss entweder eine positive Zahl enthalten oder leer bleiben.',
        'Maximum retry period' => 'Maximaler Zeitraum für Wiederholungen',
        'Maximum period of time for retries of failing requests before they are discarded (based on the error handling module execution time for the initial request).' =>
            'Maximaler Zeitraum für Wiederholungen von fehlschlagenden Anfragen bevor diese verworfen werden (basierend auf der Ausführungszeit des Fehlerbehandlungs-Moduls für die initiale Anfrage).',
        'Retries that would normally be triggered after maximum period is elapsed (according to retry interval calculation) will automatically be triggered at maximum period exactly.' =>
            'Wiederholungen, die (gemäß der Berechnung des Intervalls) normalerweise ausgeführt würden nachdem der maximale Zeitraum für Wiederholungen abgelaufen ist, werden automatisch genau zum Ablauf dieses Zeitraums geplant.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry period at \'30 minutes\', retries would be triggered at 10:01, 10:03, 10:07, 10:15 and finally at 10:31=>10:30.' =>
            'Beispiel: Wenn eine Anfrage initial um 10:00 Uhr mit dem initialen Abstand \'1 Minute\', einem Wiederholungsfaktor \'2\' und dem maximalen Zeitraum für Wiederholungen \'30 Minuten\' ausgeführt wird, würden Wiederholungen um 10:01 Uhr, 10:03 Uhr, 10:07 Uhr, 10:15 Uhr und zuletzt um 10:31=>10:30 Uhr ausgeführt.',
        'Note: Maximum retry period might not be reached if a maximum retry count is configured as well and reached earlier.' =>
            'Hinweis: Der maximale Zeitraum für Wiederholungen könnte nicht erreicht werden, sofern auch eine maximale Anzahl an Wiederholungen konfiguriert wurde und diese früher erreicht wird.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerDefault.tt
        'Do you really want to delete this invoker?' => 'Wollen Sie diesen Invoker wirklich löschen?',
        'Add Invoker' => 'Invoker hinzufügen',
        'Edit Invoker' => 'Invoker bearbeiten',
        'Invoker Details' => 'Invoker-Details',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Der Name wird typischerweise genutzt, um eine Operation eines entfernten Webservices aufzurufen.',
        'Invoker backend' => 'Invoker-Backend',
        'This Znuny invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Dieses Invoker-Backend-Modul wird aufgerufen, um die Daten zum Versand an das entfernte System sowie die zurückgelieferten Daten aufzubereiten.',
        'Mapping for outgoing request data' => 'Mapping für ausgehende Anfragedaten',
        'Configure' => 'Konfigurieren',
        'The data from the invoker of Znuny will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Die Daten des Invokers von Znuny werden von diesem Mapping verarbeitet, um sie so umzuformen, wie das entfernte System die Daten benötigt.',
        'Mapping for incoming response data' => 'Mapping für eingehende Antwortdaten',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of Znuny expects.' =>
            'Die Antwort-Daten des entfernten Systems werden von diesem Mapping verarbeitet, um sie so umzuformen, wie der Invoker von Znuny sie benötigt.',
        'Asynchronous' => 'Asynchron',
        'Condition' => 'Bedingung',
        'Edit this event' => 'Dieses Ereignis bearbeiten',
        'This invoker will be triggered by the configured events.' => 'Dieser Invoker wird von den konfigurierten Ereignissen ausgelöst.',
        'Add Event' => 'Event hinzufügen',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Um einen neues Ereignis hinzuzufügen, wählen Sie bitte das Objekt und den Ereignisnamen und klicken Sie auf den "+"-Schaltfläche',
        'Asynchronous event triggers are handled by the Znuny Scheduler Daemon in background (recommended).' =>
            'Asynchrone Ereignisauslöser werden vom Znuny Scheduler Daemon im Hintergrund verarbeitet (empfohlen).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Synchrone Ereignisauslöser werden direkt während der laufenden Web-Anfrage verarbeitet.',
        'Add all attachments' => 'Alle Anhänge hinzufügen',
        'Add all attachments to invoker payload.' => 'Alle Anhänge zur Nutzlast des Invokers hinzufügen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerEvent.tt
        'GenericInterface Invoker Event Settings for Web Service %s' => 'GenericInterface Invoker Ereignis-Einstellungen für Webservice %s',
        'Go back to' => 'Zurück zu',
        'Delete all conditions' => 'Alle Bedingungen löschen',
        'Do you really want to delete all the conditions for this event?' =>
            'Möchten Sie wirklich alle Bedingungen für dieses Ereignis löschen?',
        'General Settings' => 'Generelle Einstellungen',
        'Event type' => 'Ereignistyp',
        'Conditions' => 'Bedingungen',
        'Conditions can only operate on non-empty fields.' => 'Bedingungen können nur Felder prüfen, die nicht leer sind.',
        'Type of Linking between Conditions' => 'Verknüpfungstyp zwischen den Bedingungen',
        'Remove this Condition' => 'Bedingung entfernen',
        'Type of Linking' => 'Verknüpfungstyp',
        'Fields' => 'Felder',
        'Add a new Field' => 'Neues Feld hinzufügen',
        'Remove this Field' => 'Feld entfernen',
        'And can\'t be repeated on the same condition.' => 'Und darf sich nicht innerhalb derselben Bedingung wiederholen.',
        'Add New Condition' => 'Neue Bedingung hinzufügen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingSimple.tt
        'Mapping Simple' => 'Einfaches Mapping',
        'Default rule for unmapped keys' => 'Standardregel für nicht gemappte Schlüssel',
        'This rule will apply for all keys with no mapping rule.' => 'Diese Regel wird für alle Schlüssel ohne passende Regel angewendet.',
        'Default rule for unmapped values' => 'Standardregel für nicht gemappte Werte',
        'This rule will apply for all values with no mapping rule.' => 'Diese Regel wird für alle Werte ohne passende Regel angewendet.',
        'New key map' => 'Neues Schlüssel-Mapping',
        'Add key mapping' => 'Schlüssel-Mapping hinzufügen',
        'Mapping for Key ' => 'Mapping für Schlüssel ',
        'Remove key mapping' => 'Schlüssel-Mapping entfernen',
        'Key mapping' => 'Schlüssel-Mapping',
        'Map key' => 'Schlüssel',
        'matching' => '',
        'to new key' => 'auf neuen Schlüssel mappen',
        'Value mapping' => 'Wert-Mapping',
        'Map value' => 'Wert',
        'new value' => 'Neuer Wert',
        'Remove value mapping' => 'Wert-Mapping entfernen',
        'New value map' => 'Neues Wert-Mapping',
        'Add value mapping' => 'Wert-Mapping hinzufügen',
        'Do you really want to delete this key mapping?' => 'Wollen Sie dieses Schlüssel-Mapping wirklich löschen?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingXSLT.tt
        'General Shortcuts' => 'Allgemeine Tastaturkürzel',
        'MacOS Shortcuts' => 'MacOS-Tastaturkürzel',
        'Comment code' => 'Code kommentieren',
        'Uncomment code' => 'Code nicht kommentieren',
        'Auto format code' => 'Code automatisch formatieren',
        'Expand/Collapse code block' => 'Code-Block aus-/einklappen',
        'Find' => 'Suchen',
        'Find next' => 'Nächste suchen',
        'Find previous' => 'Vorherige suchen',
        'Find and replace' => 'Suchen und ersetzen',
        'Find and replace all' => 'Suchen und alle ersetzen',
        'XSLT Mapping' => 'XSLT-Mapping',
        'XSLT stylesheet' => 'XSLT-Stylesheet',
        'The entered data is not a valid XSLT style sheet.' => 'Die eingegebenen Daten sind kein gültiges XSLT-Stylesheet.',
        'Here you can add or modify your XSLT mapping code.' => 'Hier können Sie Ihren XSLT-Mapping-Code hinzufügen oder bearbeiten.',
        'The editing field allows you to use different functions like automatic formatting, window resize as well as tag- and bracket-completion.' =>
            'Das Bearbeitungsfeld ermöglicht die Benutzung verschiedener Funktionen wie automatische Formatierung, Veränderung der Fenstergröße sowie Tag- und Klammer-Vervollständigung.',
        'Data includes' => 'Daten-Include',
        'Select one or more sets of data that were created at earlier request/response stages to be included in mappable data.' =>
            'Wählen Sie einen oder mehrere Datensätze, welche in vorhergehenden Anfrage-/Antwortphasen erstellt wurden, um diese im Mapping zur Verfügung zu stellen.',
        'These sets will appear in the data structure at \'/DataInclude/<DataSetName>\' (see debugger output of actual requests for details).' =>
            'Diese Datensätze werden in die Datenstruktur unter \'/DataInclude/<DatensatzName>\' dargestellt (in der Ausgabe des Debugger sehen Sie Details der tatsächlichen Struktur).',
        'Force array for tags' => 'Array für Tags erzwingen',
        'Enter tags separated by space for which array representation should be forced.' =>
            'Geben Sie Tags durch Leerzeichen getrennt ein, die als Array repräsentiert werden sollen.',
        'Keep XML attributes' => 'XML-Attribute beibehalten',
        'Only needed for content type XML.' => 'Nur für Content-Type XML benötigt.',
        'Data key regex filters (before mapping)' => 'RegEx-Filter für Daten-Schlüssel (vor dem Mapping)',
        'Data key regex filters (after mapping)' => 'RegEx-Filter für Daten-Schlüssel (nach dem Mapping)',
        'Regular expressions' => 'Reguläre Ausdrücke',
        'Replace' => 'Ersetzen',
        'Remove regex' => 'RegEx entfernen',
        'Add regex' => 'RegEx hinzufügen',
        'These filters can be used to transform keys using regular expressions.' =>
            'Diese Filter können genutzt werden, um Schlüssel mittels regulärer Ausdrücke umzuformen.',
        'The data structure will be traversed recursively and all configured regexes will be applied to all keys.' =>
            'Die Datenstruktur wird rekursiv durchlaufen und alle konfigurierten regulären Ausdrücke werden auf alle Schlüssel angewendet.',
        'Use cases are e.g. removing key prefixes that are undesired or correcting keys that are invalid as XML element names.' =>
            'Anwendungsfälle sind z.B. das Entfernen von unerwünschten Schlüssel-Präfixen oder die Korrektur von Schlüsseln, welche keine gültigen XML-Elementnamen darstellen.',
        'Example 1: Search = \'^jira:\' / Replace = \'\' turns \'jira:element\' into \'element\'.' =>
            'Beispiel 1: Suchen = \'^jira:\' / Ersetzen = \'\' wandelt \'jira:element\' in \'element\' um.',
        'Example 2: Search = \'^\' / Replace = \'_\' turns \'16x16\' into \'_16x16\'.' =>
            'Beispiel 2: Suchen = \'^\' / Ersetzen = \'_\' wandelt \'16x16\' in \'_16x16\' um.',
        'Example 3: Search = \'^(?<number>\d+) (?<text>.+?)\$\' / Replace = \'_\$+{text}_\$+{number}\' turns \'16 elementname\' into \'_elementname_16\'.' =>
            'Beispiel 3: Suche = \'^(?<number>\d+) (?<text>.+?)\$\' / Replace = \'_\$+{text}_\$+{number}\' turns \'16 elementname\' into \'_elementname_16\'.',
        'For information about regular expressions in Perl please see here:' =>
            'Informationen zu regulären Ausdrücken in Perl finden Sie hier:',
        'Perl regular expressions tutorial' => 'Perl regular expressions tutorial (Englisch)',
        'If modifiers are desired they have to be specified within the regexes themselves.' =>
            'Falls der Einsatz von Modifikatoren gewünscht ist, müssen diese innerhalb der regulären Ausdrücke definiert werden.',
        'Regular expressions defined here will be applied before the XSLT mapping.' =>
            'Hier definierte reguläre Ausdrücke werden vor dem XSLT-Mapping angewendet.',
        'Regular expressions defined here will be applied after the XSLT mapping.' =>
            'Hier definierte reguläre Ausdrücke werden nach dem XSLT-Mapping angewendet.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceOperationDefault.tt
        'Do you really want to delete this operation?' => 'Wollen Sie diese Operation wirklich löschen?',
        'Add Operation' => 'Operation hinzufügen',
        'Edit Operation' => 'Operation bearbeiten',
        'Operation Details' => 'Operation-Details',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Der Name wird typischerweise benutzt, um die Webservice-Operation von einem entfernten System aus aufzurufen.',
        'Operation backend' => 'Operation-Backend',
        'This Znuny operation backend module will be called internally to process the request, generating data for the response.' =>
            'Dieses Znuny-Operation-Backend-Modul wird intern aufgerufen, um die Anforderung zu bearbeiten und Daten für die Antwort zu generieren.',
        'Mapping for incoming request data' => 'Mapping für eingehende Anfragedaten',
        'The request data will be processed by this mapping, to transform it to the kind of data Znuny expects.' =>
            'Die Daten der eingehenden Anfrage werden von diesem Mapping verarbeitet, um sie so umzuformen, wie die Znuny-Operation sie benötigt.',
        'Mapping for outgoing response data' => 'Mapping für ausgehende Antwortdaten',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Die Antwortdaten werden von diesem Mapping verarbeitet, um sie so umzuformen, wie das entfernte System die Daten benötigt.',
        'Include Ticket Data' => 'Ticketdaten einbinden',
        'Include ticket data in response.' => 'Ticketdaten in Antwort einbinden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPREST.tt
        'Network Transport' => 'Netzwerktransport',
        'Properties' => 'Eigenschaften',
        'Route mapping for Operation' => 'Route-Mapping für Operationen',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Definiert die Route, die zu der Operation gemappt werden soll. Variablen, die mit einem \':\' markiert sind, werden zu dem eingegeben Namen gemappt und mit den anderen Variablen an die Funktion übergeben. (z.B.: /Ticket/:TicketID).',
        'Valid request methods for Operation' => 'Gültige Anfragemethoden für Operation',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Beschränken Sie diese Operation auf bestimmte Anfragemethoden. Wenn keine Anfragemethode ausgewählt ist, werden alle Anfragen akzeptiert.',
        'Parser backend for operation' => 'Parser-Backend für Operation',
        'Defines the incoming data format.' => 'Definiert das eingehende Datenformat.',
        'Parser backend parameter' => 'Parser-Backend-Parameter',
        'Please click \'Save\' to get the corresponding backend parameter if the parser backend was changed.' =>
            'Bitte klicken Sie \'Speichern\', nachdem das Parser-Backend geändert wurde, um die entsprechenden Backend-Parameter zu erhalten.',
        'Maximum message length' => 'Maximale Nachrichtenlänge',
        'This field should be an integer number.' => 'Dieses Feld sollte eine Ganzzahl beinhalten.',
        'Here you can specify the maximum size (in bytes) of REST messages that Znuny will process.' =>
            'Bestimmen Sie die maximale Größe (in Bytes) für REST-Nachrichten, die Znuny akzeptieren soll.',
        'Send Keep-Alive' => 'Keep-Alive senden',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Bestimmt, ob eingehende Verbindungen geschlossen oder am Leben erhalten werden sollen.',
        'Endpoint' => 'Endpunkt',
        'URI to indicate specific location for accessing a web service.' =>
            'URI zur Angabe eines bestimmten Standorts für den Zugriff auf einen Webdienst.',
        'e.g https://www.example.com:10745/api/v1.0 (without trailing backslash)' =>
            'z. B. https://www.example.com:10745/api/v1.0 (ohne abschließenden Backslash)',
        'Disable SSL hostname certificate verification' => 'SSL-Hostname-Verifikation deaktivieren',
        'Disables hostname certificate verification. This is not recommended and should only be used in test environments.' =>
            'Deaktiviert die SSL-Hostname-Verifikation. Es wird empfohlen, dies nicht oder nur in Testumgebungen zu deaktivieren.',
        'Timeout' => 'Timeout',
        'Timeout value for requests.' => 'Timeout-Wert für Anfragen.',
        'Authentication' => 'Authentifizierung',
        'An optional authentication mechanism to access the remote system.' =>
            'Die optionale Authentifizierungsmethode für den Zugriff auf das entfernte System.',
        'BasicAuth User' => 'BasicAuth-Benutzer',
        'The user name to be used to access the remote system.' => 'Der Benutzername für den Zugriff auf das entfernte System.',
        'BasicAuth Password' => 'BasicAuth-Passwort',
        'The password for the privileged user.' => 'Dass Passwort des berechtigten Benutzers.',
        'JWT authentication: Key file' => 'JWT-Authentifizierung: Key-Datei',
        'ATTENTION: Key file and/or password (if needed, see below) seem to be invalid.' =>
            'ACHTUNG: Key-Datei und/oder Passwort (falls benötigt, siehe unten) scheinen ungültig zu sein.',
        'Path to private key file (PEM or DER). The key will be used to sign the JWT.' =>
            'Pfad zur Datei mit dem privaten Key (PEM oder DER). Der Key wird zum Signieren des JWT verwendet.',
        'JWT authentication: Key file password' => 'JWT-Authentifizierung: Key-Datei-Passwort',
        'ATTENTION: Password and/or key file (see above) seem to be invalid.' =>
            'ACHTUNG: Password und/oder Key-Datei (siehe oben) scheinen ungültig zu sein.',
        'JWT authentication: Certificate file' => 'JWT-Authentifizierung: Zertifikatsdatei',
        'ATTENTION: Certificate file could not be parsed.' => 'ACHTUNG: Zertifikat-Datei konnte nicht gelesen werden.',
        'ATTENTION: Certificate is expired.' => 'ACHTUNG: Zertifikat ist abgelaufen.',
        'Path to X.509 certificate file (PEM). Data of the certificate can be used for the payload and/or header data of the JWT.' =>
            'Pfad zur X.509-Zertifikat-Datei (PEM). Die Daten des Zertifikats können für die Payload und/oder die Header-Daten des JWT verwendet werden.',
        'JWT authentication: Algorithm' => 'JWT-Authentifizierung: Algorithmus',
        'JWT authentication: TTL' => 'JWT-Authentifizierung: TTL',
        'TTL (time to live) in seconds for the JWT. This value will be used to calculate the expiration date which will be available in placeholders ExpirationDateTimestamp and ExpirationDateString.' =>
            'TTL (Time to live) in Sekunden für das JWT. Dieser Wert wird zur Berechnung des Ablaufdatums verwendet und steht in den Platzhaltern ExpirationDateTimestamp und ExpirationDateString zur Verfügung.',
        'JWT authentication: Payload' => 'JWT-Authentifizierung: Payload',
        'Payload for JWT. Give key/value pairs (separated by ;), e.g.: Key1=Value1;Key2=Value2;Key3=Value3' =>
            'Payload für JWT. Geben Sie Key- und Value-Paare an (durch ; getrennt), z. B.: Key1=Value1;Key2=Value2;Key3=Value3',
        'Available placeholders (prefixed with OTRS_JWT): ExpirationDateTimestamp, ExpirationDateString. Additionally if X.509 certificate support is present: CertSubject, CertIssuer, CertSerial, CertNotBefore, CertNotAfter, CertEmail, CertVersion.' =>
            'Verfügbare Platzhalter (OTRS_JWT vorangestellt): ExpirationDateTimestamp, ExpirationDateString. Zusätzlich bei vorhandener Unterstützung von X.509-Zertifikaten: CertSubject, CertIssuer, CertSerial, CertNotBefore, CertNotAfter, CertEmail, CertVersion.',
        'Placeholder usage example: Key1=<OTRS_JWT_ExpirationDateTimestamp>' =>
            'Beispiel für Platzhalterverwendung: Key1=<OTRS_JWT_ExpirationDateTimestamp>',
        'JWT authentication: Additional header data' => 'JWT-Authentifizierung: Zusätzliche Header-Daten',
        'Additional header data for JWT. Give key/value pairs (separated by ;), e.g.: Key1=Value1;Key2=Value2;Key3=Value3' =>
            'Zusätzliche Header-Daten für JWT. Geben Sie Key- und Value-Paare an (durch ; getrennt), z. B.: Key1=Value1;Key2=Value2;Key3=Value3',
        'OAuth2 token configuration' => 'OAuth2-Token-Konfiguration',
        'Content type' => 'Content-Type',
        'The default content type added to HTTP header to use for POST and PUT requests.' =>
            'Default-Content-Type, der für POST- und PUT-Requests zum HTTP-Header hinzugefügt wird.',
        'Use Proxy Options' => 'Proxy-Optionen verwenden',
        'Show or hide Proxy options to connect to the remote system.' => 'Optionen für die Verwendung eines Proxy zum Zugriff auf das entfernte System anzeigen oder verbergen.',
        'Proxy Server' => 'Proxy-Server',
        'URI of a proxy server to be used (if needed).' => 'URI eines Proxy-Servers (optional).',
        'e.g. http://proxy_hostname:8080' => 'z. B. http://proxy_hostname:8080',
        'Proxy User' => 'Proxy-Benutzer',
        'The user name to be used to access the proxy server.' => 'Benutzername für den Zugriff auf den Proxy-Server.',
        'Proxy Password' => 'Proxy-Passwort',
        'The password for the proxy user.' => 'Passwort des Proxy-Benutzers.',
        'Skip Proxy' => 'Proxy übergehen',
        'Skip proxy servers that might be configured globally?' => 'Sollen mögliche global konfigurierte Proxy-Server übergangen werden?',
        'Use SSL Options' => 'SSL-Optionen verwenden',
        'Show or hide SSL options to connect to the remote system.' => 'Optionen für die Verwendung von SSL zum Zugriff auf das entfernte System anzeigen oder verbergen.',
        'Client Certificate' => 'Client-Zertifikat',
        'The full path and name of the SSL client certificate file (must be in PEM, DER or PKCS#12 format).' =>
            'Der vollständige Pfad und Name der SSL-Client-Zertifikatsdatei (muss im PEM, DER oder PKCS#12-Format vorliegen).',
        'e.g. /opt/znuny/var/certificates/SOAP/certificate.pem' => 'z.B. /opt/znuny/var/certificates/SOAP/certificate.pem',
        'Client Certificate Key' => 'Client-Zertifikatschlüssel',
        'The full path and name of the SSL client certificate key file (if not already included in certificate file).' =>
            'Der vollständige Pfad und Name der SSL-Client-Zertifikats-Schlüsseldatei (sofern nicht bereits in der Client-Zertifikats-Datei enthalten).',
        'e.g. /opt/znuny/var/certificates/SOAP/key.pem' => 'z.B. /opt/znuny/var/certificates/SOAP/key.pem',
        'Client Certificate Key Password' => 'Passwort für Client-Zertifikatschlüssel',
        'The password to open the SSL certificate if the key is encrypted.' =>
            'Das Passwort für den Zugriff auf das SSL-Zertifikat falls der Schlüssel verschlüsselt ist.',
        'Certification Authority (CA) Certificate' => 'Zertifikat der Certification Authority (CA)',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'Voller Pfad und Dateiname der Datei der Certification Authority (CA), welche das Zertifikat signiert hat.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA/ca.pem' => 'z. B. /opt/znuny/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Verzeichnis mit Certification Autorities (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Voller Pfad und Dateiname des CA-Verzeichnisses, in dem CA-Zertifikate gespeichert sind.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA' => 'z. B. /opt/znuny/var/certificates/SOAP/CA',
        'Controller mapping for Invoker' => 'Controller-Mapping für Invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Der Controller, an den der Invoker Anfragen senden soll. Variablen, die mit einem \':\' markiert sind, werden durch den Datenwert ersetzt und mit der Anfrage übergeben. (z.B.: /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).',
        'Valid request command for Invoker' => 'Gültiger Anfragebefehl für Invoker',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Ein spezifisches HTTP-Kommando, das für Anfragen mit diesem Invoker zu verwenden ist (optional).',
        'Default command' => 'Standardbefehl',
        'The default HTTP command to use for the requests.' => 'Der Standard-HTTP-Befehl für die Anfragen.',
        'Additional response headers' => 'Zusätzliche Antwort-Header',
        'Additional request headers' => 'Zusätzliche Request-Header',
        'Header' => 'Überschrift',
        'Add response header' => 'Antwort-Header hinzufügen',
        'Add request header' => 'Request-Header hinzufügen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPSOAP.tt
        'e.g. https://example.com:8000/Webservice/Example' => 'z.B. https://example.com:8000/Webservice/Example',
        'Set SOAPAction' => 'Setzen von SOAPAction',
        'Set to "Yes" in order to send a filled SOAPAction header.' => 'Auf "Ja" setzen, um einen befüllten SOAPAction-Header zu senden.',
        'Set to "No" in order to send an empty SOAPAction header.' => 'Auf "Nein" setzen, um einen leeren SOAPAction-Header zu senden.',
        'Set to "Yes" in order to check the received SOAPAction header (if not empty).' =>
            'Auf "Ja" setzen, um den empfangenen SOAPAction-Header zu prüfen.',
        'Set to "No" in order to ignore the received SOAPAction header.' =>
            'Auf "Nein" setzen, um den empfangenen SOAPAction-Header zu ignorieren.',
        'SOAPAction scheme' => 'SOAPAction-Schema',
        'Select how SOAPAction should be constructed.' => 'Wählen Sie, wie die SOAPAction konstruiert werden soll.',
        'Some web services require a specific construction.' => 'Einige Webservices benötigen eine spezifische Konstruktion.',
        'Some web services send a specific construction.' => 'Einige Webservices senden eine spezifische Konstruktion.',
        'SOAPAction separator' => 'SOAPAction-Trenner',
        'Character to use as separator between name space and SOAP operation.' =>
            'Zu nutzendes Trennzeichen zwischen dem Namespace und der SOAP-Operation.',
        'Usually .Net web services use "/" as separator.' => 'Normalerweise verwenden .Net-basierte Webservices "/" als Trenner.',
        'SOAPAction free text' => 'SOAPAction Freitext',
        'Text to be used to as SOAPAction.' => 'Text welcher als SOAPAction genutzt werden soll.',
        'Namespace' => 'Namensraum',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI, die SOAP-Methoden einen Kontext gibt und damit Mehrdeutigkeiten auflöst.',
        'e.g urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions' =>
            'z. B. urn:example-com:soap:functions oder http://www.example.com/GenericInterface/actions',
        'Omit namespace prefix' => 'Namespace-Präfix weglassen',
        'Omits the namespace prefix (e. g. namesp1:) in root tag of SOAP message.' =>
            'Lässt das Namespace-Präfix (z. B. namesp1:) im Root-Tag der SOAP-Nachricht weg.',
        'Request name scheme' => 'Anfragen-Namensschema',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Wählen Sie, wie der SOAP-Funktionsaufruf konstruiert werden soll.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'FunctionName\' wird als Beispiel für den tatsächlichen Namen eines Invokers / einer Operation verwendet.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'FreeText\' wird als Beispiel für einen tatsächlich konfigurierten Wert verwendet.',
        'Request name free text' => 'Freitext für Anfragenamen',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Text, der als Anhang oder Ersatz für den Funktionsnamen verwendet werden soll.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Bitte beachten Sie die Beschränkungen von XML-Elementnamen (verwenden Sie z. B. kein \'<\' oder \'&\').',
        'Response name scheme' => 'Antwort-Namensschema',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Wählen Sie, wie die SOAP-Antwort konstruiert werden soll.',
        'Response name free text' => 'Freitext für den Antwortnamen',
        'Here you can specify the maximum size (in bytes) of SOAP messages that Znuny will process.' =>
            'Hier können Sie eine Maximalgröße für SOAP-Nachrichten (in Bytes) angeben, die Znuny verarbeitet.',
        'Fixed namespace prefix' => 'Festes Namespace-Präfix',
        'Use a fixed namespace prefix (e. g. myns:) for the root tag of a SOAP message.' =>
            'Festes Namespace-Präfix (z. B. myns:) im Root-Tag der SOAP-Nachricht verwenden.',
        'Suffix for response tag' => 'Suffix für Response-Tag',
        'Usually Znuny expects a response tag like "&lt;Operation&gt;Response". This setting can change the "Response" part, e. g. to "Result".' =>
            'Normalerweise erwartet Znuny ein Response-Tag in der Form "&lt;Operation&gt;Response". Mit dieser Einstellung kann der "Response"-Teil geändert werden, z. B. zu "Result".',
        'Encoding' => 'Kodierung',
        'The character encoding for the SOAP message contents.' => 'Die Zeichenkodierung für SOAP-Nachrichteninhalte.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'z. B. utf-8, latin1, iso-8859-1, cp1250, usw.',
        'User' => 'Benutzer',
        'Password' => 'Passwort',
        'Disable SSL hostname verification' => 'Deaktivierung der Verifikation des SSL-Hostnamens',
        'Disables (setting "Yes") or enables (setting "No", default) the SSL hostname verification.' =>
            'Deaktiviert (Einstellung "Ja") oder aktiviert (Einstellung "Nein", Default) die Verifikation des SSL-Hostnamens.',
        'Sort options' => 'Sortierungsoptionen',
        'Add new first level element' => 'Neues Element auf der obersten Ebene hinzufügen',
        'Element' => 'Element',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Sortierung für ausgehende XML-Felder (Struktur unterhalb des Funktionsaufrufes) - siehe Dokumentation für SOAP-Transport.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebservice.tt
        'Add Web Service' => 'Webservice hinzufügen',
        'Clone Web Service' => 'Webservice klonen',
        'The name must be unique.' => 'Der Name muss eindeutig sein.',
        'Clone' => 'Klonen',
        'Export Web Service' => 'Webservice exportieren',
        'Import web service' => 'Webservices importieren',
        'Configuration File' => 'Konfigurationsdatei',
        'The file must be a valid web service configuration YAML file.' =>
            'Die Datei muss eine gültige Webservice-Konfigurationsdatei im YAML-Format sein.',
        'Here you can specify a name for the webservice. If this field is empty, the name of the configuration file is used as name.' =>
            'Hier können Sie einen Namen für den Webservice angeben. Bleibt dieses Feld leer, wird der Dateiname der Konfigurationsdatei als Name verwendet.',
        'Import' => 'Importieren',
        'Configuration History' => 'Konfigurationshistorie',
        'Delete web service' => 'Webservice löschen',
        'Do you really want to delete this web service?' => 'Wollen Sie diesen Webservice wirklich löschen?',
        'Ready2Adopt Web Services' => 'Ready2Adopt-Webservices',
        'Import Ready2Adopt web service' => 'Ready2Adopt-Webservices importieren',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Nach dem Speichern der Konfiguration werden Sie wieder auf den Bearbeitungsbildschirm geleitet.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Wenn Sie zurück zur Übersicht möchten, verwenden Sie bitte die Schaltfläche "Zurück zur Übersicht".',
        'Edit Web Service' => 'Webservice bearbeiten',
        'Remote system' => 'Remote-System',
        'Provider transport' => 'Provider-Transport',
        'Requester transport' => 'Requester-Transport',
        'Debug threshold' => 'Debug-Level',
        'In provider mode, Znuny offers web services which are used by remote systems.' =>
            'Im Modus "Provider" bietet Znuny Webservices an, die von externen Systemen genutzt werden.',
        'In requester mode, Znuny uses web services of remote systems.' =>
            'Im Modus "Requester" nutzt Znuny selbst Webservices von externen Systemen.',
        'Network transport' => 'Netzwerktransport',
        'Error Handling Modules' => 'Fehlerbehandlungs-Module',
        'Error handling modules are used to react in case of errors during the communication. Those modules are executed in a specific order, which can be changed by drag and drop.' =>
            'Fehlerbehandlungs-Module werden genutzt, um auf Fehler zu reagieren, die während der Kommunikation auftreten. Diese Module werden in festgelegter Reihenfolge ausgeführt, die Sie durch Verschieben mit der Maus ändern können.',
        'Add error handling module' => 'Fehlerbehandlungs-Modul hinzufügen',
        'Operations are individual system functions which remote systems can request.' =>
            'Operations sind einzelne Systemfunktionen, die entfernte Systeme aufrufen können.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Invoker bereiten Daten für eine Anfrage an einen externen Webservice auf und verarbeiten die Antwortdaten.',
        'Controller' => 'Controller',
        'Inbound mapping' => 'Eingehendes Mapping',
        'Outbound mapping' => 'Ausgehendes Mapping',
        'Delete this action' => 'Diese Aktion löschen',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Noch mindestens ein %s hat einen Controller, der nicht aktiv oder nicht vorhanden ist, bitte prüfen Sie die Controller-Registrierung oder löschen Sie %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebserviceHistory.tt
        'Go back to Web Service' => 'Zurück zum Webservice',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Hier können Sie ältere Versionen der Konfiguration dieses Webservices einsehen, exportieren oder wiederherstellen.',
        'History' => 'Historie',
        'Configuration History List' => 'Liste der Konfigurationshistorie',
        'Version' => 'Version',
        'Create time' => 'Erstellzeit',
        'Select a single configuration version to see its details.' => 'Wählen Sie eine Konfigurationsversion aus, um die Details zu sehen.',
        'Export web service configuration' => 'Webservice-Konfiguration exportieren',
        'Restore web service configuration' => 'Webservice-Konfiguration wiederherstellen',
        'Do you really want to restore this version of the web service configuration?' =>
            'Wollen Sie diese Version der Webservice-Konfiguration wirklich wiederherstellen?',
        'Your current web service configuration will be overwritten.' => 'Ihre aktuelle Konfiguration wird überschrieben.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGroup.tt
        'Add Group' => 'Gruppe hinzufügen',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Die \'admin\'-Gruppe wird für den Admin-Bereich benötigt, die \'stats\'-Gruppe für den Statistik-Bereich.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Erstellen Sie neue Gruppen, um unterschiedliche Berechtigungen für verschiedene Agentengruppen zu realisieren (z. B. Einkauf, Produktion, Verkauf, ...) . ',
        'It\'s useful for ASP solutions. ' => 'Das ist nützlich für ASP-Lösungen. ',
        'Agents ↔ Groups' => 'Agenten ↔ Gruppen',
        'Roles ↔ Groups' => 'Rollen ↔ Gruppen',
        'Group Management' => 'Gruppenverwaltung',
        'Edit Group' => 'Gruppe bearbeiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminLog.tt
        'Clear log entries' => 'Lösche Protokolleinträge',
        'Here you will find log information about your system.' => 'Hier finden Sie Informationen zu protokollierten Systemereignissen.',
        'Hide this message' => 'Diesen Hinweis ausblenden',
        'System Log' => 'Systemprotokoll',
        'Recent Log Entries' => 'Aktuelle Einträge im Systemprotokoll',
        'Facility' => 'Einrichtung',
        'Message' => 'Nachricht',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminMailAccount.tt
        'Add Mail Account' => 'E-Mail-Konto hinzufügen',
        'Filter for Mail Accounts' => 'Filter für E-Mail-Konten',
        'Filter for mail accounts' => 'Filter für E-Mail-Konten',
        'All incoming emails with one account will be dispatched in the selected queue.' =>
            'Einkommende E-Mails von POP3-Konten werden in die ausgewählte Queue einsortiert.',
        'If your account is marked as trusted, the X-OTRS headers already existing at arrival time (for priority etc.) will be kept and used, for example in PostMaster filters.' =>
            'Wird dem Konto vertraut, bleiben die eingehenden X-OTRS-Header (für Priorität usw.) erhalten und werden benutzt, zum Beispiel in Postmaster-Filtern.',
        'Outgoing email can be configured via the Sendmail* settings in %s.' =>
            'Ausgehende E-Mails können über die Sendmail-Einstellungen in %s konfiguriert werden.',
        'System Configuration' => 'Systemkonfiguration',
        'Mail Account Management' => 'E-Mail-Kontenverwaltung',
        'Edit Mail Account for host' => 'E-Mail-Konto für Host bearbeiten',
        'and user account' => 'und Benutzerkonto',
        'Host' => 'Host',
        'Authentication type' => 'Authentifikationstyp',
        'Fetch mail' => 'E-Mails abholen',
        'Delete account' => 'E-Mail-Konto löschen',
        'Do you really want to delete this mail account?' => 'Möchten Sie dieses E-Mail-Konto wirklich löschen?',
        'Example: mail.example.com' => 'Beispiel: mail.example.com',
        'IMAP Folder' => 'IMAP-Ordner',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Ändern Sie diese Einstellung nur, wenn die E-Mails aus einem anderen Ordner als "INBOX" geholt werden sollen.',
        'Trusted' => 'Vertraut',
        'Dispatching' => 'Verteilung',
        'Edit Mail Account' => 'E-Mail-Konto bearbeiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNavigationBar.tt
        'Administration Overview' => 'Administrations-Übersicht',
        'Favorites' => 'Favoriten',
        'You can add favorites by moving your cursor over items on the right side and clicking the star icon.' =>
            'Sie können Favoriten hinzufügen, indem Sie Ihren Mauszeiger über Einträge auf der rechten Seite bewegen und dann das Sternsymbol anklicken.',
        'Links' => 'Verknüpfungen',
        'View the admin manual on Github' => 'Administrator-Handbuch auf Github',
        'Filter for Items' => 'Filter für Einträge',
        'No Matches' => 'Keine Treffer',
        'Sorry, your search didn\'t match any items.' => 'Es wurden leider keine passenden Einträge gefunden.',
        'Set as favorite' => 'Als Favorit markieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEvent.tt
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Hier können Sie eine Konfigurationsdatei hochladen, mit der Ticket-Benachrichtigungen im System importiert werden können. Die Datei muss im .yml-Format vorliegen, so wie sie auch vom Ticket-Benachrichtigungsmodul exportiert wird.',
        'Ticket Notification Management' => 'Verwaltung von Ticket-Benachrichtigungen',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Hier können Sie auswählen, welche Ereignisse diese Benachrichtigung auslösen. Ein zusätzlicher Ticket-Filter kann weiter unten eingestellt werden, um die Benachrichtigung nur für Tickets mit bestimmten Merkmalen zu versenden.',
        'Ticket Filter' => 'Ticket-Filter',
        'Lock' => 'Sperren',
        'SLA' => 'SLA',
        'Customer User ID' => 'Kundenbenutzer-Nummer',
        'Article Filter' => 'Artikelfilter',
        'Only for ArticleCreate and ArticleSend event' => 'Nur für die Events ArticleCreate und ArticleSend',
        'Article sender type' => 'Sendertyp des Artikels',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Wenn ArticleCreate oder ArticleSend aus auslösendes Ereignis verwendet werden, müssen Sie ebenfalls einen Artikelfilter spezifizieren. Bitte wählen Sie mindestens eins der Artikelfilterfelder aus.',
        'Customer visibility' => 'Sichtbarkeit für Kunden',
        'Communication channel' => 'Kommunikationskanal',
        'Include attachments to notification' => 'Anhänge an Benachrichtigung anfügen',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Nur einmal am Tag pro Ticket und Benachrichtigungs-Transportmethode versenden.',
        'This field is required and must have less than 4000 characters.' =>
            'Dieses Feld wird benötigt und darf nicht mehr als 4000 Zeichen enthalten.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportEmailSettings.tt
        'Use comma or semicolon to separate email addresses.' => 'Verwenden Sie Komma oder Semikolon, um E-Mail-Adressen zu trennen.',
        'You can use Znuny-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'Sie können Znuny-Tags wie <OTRS_TICKET_DynamicField_...> nutzen, um Werte des aktuellen Tickets einzufügen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportWebserviceSettings.tt
        'Web service name' => 'Webservice-Name',
        'Invoker' => 'Invoker',
        'Asynchronous event triggers will be handled as separate process by the scheduler daemon (recommended).' =>
            'Asynchrone Event-Trigger werden als separate Prozesse über den Scheduler-Daemon ausgeführt (empfohlen).',
        'Synchronous event triggers will be processed directly during the web request.' =>
            'Synchrone Event-Trigger werden direkt während des Web-Requests ausgeführt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Edit.tt
        'Queue Management' => 'Queue-Verwaltung',
        'Manage OAuth2 tokens and their configurations' => 'OAuth2-Token und deren Konfigurationen verwalten',
        'Add by template' => 'Auf Basis von Template hinzufügen',
        'Base configuration' => 'Basiskonfiguration',
        'An OAuth2 token configuration with this name already exists.' =>
            'Es existiert bereits eine OAuth2-Token-Konfiguration mit diesem Namen.',
        'Client ID' => 'Client-ID',
        'Client secret' => 'Client-Secret',
        'URL for authorization code' => 'URL für Autorisierungscode',
        'URL for token by authorization code' => 'URL für Token per Autorisierungscode',
        'URL for token by refresh token' => 'URL für Token per Refresh-Token',
        'Access token scope' => 'Access-Token-Scope',
        'Template' => 'Vorlage',
        'This is the template that was used to create this OAuth2 token configuration.' =>
            'Dies ist die Vorlage, die zur Erstellung dieser OAuth2-Token-Konfiguration verwendet wurde.',
        'Notifications' => 'Benachrichtigungen',
        'Expired token' => 'Abgelaufenes Token',
        'Shows a notification for admins below the top menu if the OAuth2 token has expired.' =>
            'Zeigt für abgelaufenes OAuth2-Token eine Benachrichtigung für Admins unterhalb des Hauptmenüs.',
        'Expired refresh token' => 'Abgelaufenes Refresh-Token',
        'Shows a notification for admins below the top menu if the OAuth2 refresh token has expired.' =>
            'Zeigt für abgelaufenes OAuth2-Refresh-Token eine Benachrichtigung für Admins unterhalb des Hauptmenüs.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Overview.tt
        'Add OAuth2 token configuration' => 'OAuth2-Token-Konfiguration hinzufügen',
        'Add a new OAuth2 token configuration based on the selected template.' =>
            'Neue OAuth2-Token-Konfiguration auf Basis der gewählten Vorlage hinzufügen',
        'Import and export' => 'Import und Export',
        'Upload a YAML file to import token configurations. See documentation on OAuth2 token management for further details.' =>
            'Datei im YAML-Format zum Import von Token-Konfigurationen hochladen. Beachten Sie die Dokumentation zum OAuth2-Token-Management für weitere Informationen.',
        'Overwrite existing token configurations' => 'Bestehende Token-Konfigurationen überschreiben',
        'Import token configurations' => 'Token-Konfigurationen importieren',
        'Export token configurations' => 'Token-Konfigurationen exportieren',
        'OAuth2 token configurations' => 'OAuth2-Token-Konfigurationen',
        'Token status' => 'Token-Status',
        'Refresh token status' => 'Refresh-Token-Status',
        'Validity of token configuration' => 'Gültigkeit der Token-Konfiguration',
        'Last token request failed.' => 'Letzter Token-Request ist fehlgeschlagen.',
        'Token has expired on %s.' => 'Token ist am %s abgelaufen.',
        'Token is valid until %s.' => 'Token ist gültig bis %s.',
        'No token was requested yet.' => 'Bisher wurde kein Token angefordert.',
        'Last (refresh) token request failed.' => 'Letzter (Refresh-)Token-Request ist fehlgeschlagen.',
        'Refresh token has expired on %s.' => 'Refresh-Token ist am %s abgelaufen.',
        'Refresh token has expired.' => 'Refresh-Token ist abgelaufen.',
        'Refresh token is valid until %s.' => 'Refresh-Token ist gültig bis %s.',
        'Refresh token is valid (without expiration date).' => 'Refresh-Token ist gültig (ohne Ablaufdatum).',
        'No refresh token was requested yet.' => 'Bisher wurde kein Refresh-Token angefordert.',
        'Refresh token request is not configured.' => 'Refresh-Token-Request ist nicht konfiguriert.',
        'Request new token' => 'Neues Token anfordern',
        'Delete this token and its configuration.' => 'Token und dessen Konfiguration löschen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPGP.tt
        'PGP support is disabled' => 'Unterstützung für PGP ist deaktiviert',
        'To be able to use PGP in Znuny, you have to enable it first.' =>
            'Um PGP in Znuny verwenden zu können, müssen Sie es zuerst aktivieren.',
        'Enable PGP support' => 'PGP-Unterstützung aktivieren',
        'Faulty PGP configuration' => 'Fehlerhafte PGP-Konfiguration',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'PGP-Unterstützung ist aktiviert, aber die Konfiguration ist fehlerhaft. Bitte überprüfen Sie die Konfiguration mit der untenstehenden Schaltfläche.',
        'Configure it here!' => 'Hier konfigurieren!',
        'Check PGP configuration' => 'PGP-Konfiguration überprüfen',
        'Add PGP Key' => 'PGP-Schlüssel hinzufügen',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Über diesen Weg kann man den Schlüsselring (konfiguriert in SysConfig) direkt bearbeiten.',
        'Introduction to PGP' => 'Einführung zu PGP',
        'PGP Management' => 'PGP-Verwaltung',
        'Identifier' => 'Identifikator',
        'Bit' => 'Bit',
        'Fingerprint' => 'Fingerabdruck',
        'Expires' => 'Erlischt',
        'Delete this key' => 'Diesen Schlüssel löschen',
        'PGP key' => 'PGP-Schlüssel',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPackageManager.tt
        'Package Manager' => 'Paketverwaltung',
        'Uninstall Package' => 'Paket deinstallieren',
        'Uninstall package' => 'Paket deinstallieren',
        'Do you really want to uninstall this package?' => 'Soll das Paket wirklich deinstalliert werden?',
        'Reinstall package' => 'Paket erneut installieren',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Möchten Sie dieses Paket wirklich erneut installieren? Alle manuellen Änderungen gehen verloren.',
        'Go to updating instructions' => 'Gehe zur Update-Anweisung',
        'Go to znuny.org' => 'znuny.org aufrufen',
        'package information' => 'Paketinformation',
        'Package installation requires a patch level update of Znuny.' =>
            'Paketinstallation benötigt ein Patchlevel-Update von Znuny.',
        'Package update requires a patch level update of Znuny.' => 'Paket-Update benötigt ein Patchlevel-Update von Znuny.',
        'Please note that your installed Znuny version is %s.' => 'Bitte beachten Sie, dass Ihre installierte Znuny-Version %s ist.',
        'To install this package, you need to update Znuny to version %s or newer.' =>
            'Um dieses Paket zu installieren, müssen Sie zunächst Znuny auf Version %s oder neuer aktualisieren.',
        'This package can only be installed on Znuny version %s or older.' =>
            'Dieses Paket kann nur mit Znuny-Version %s oder älter verwendet werden.',
        'This package can only be installed on Znuny version %s.' => 'Dieses Paket kann nur mit Znuny-Version %s verwendet werden.',
        'Why should I keep Znuny up to date?' => 'Warum sollte ich Znuny aktuell halten?',
        'You will receive updates about relevant security issues.' => 'Sie erhalten Updates über relevante Sicherheitsprobleme.',
        'You will receive updates for all other relevant Znuny issues.' =>
            'Sie erhalten Updates für alle anderen relevanten Probleme im Zusammenhang mit Znuny.',
        'How can I do a patch level update if I don’t have a contract?' =>
            'Wie kann ich ein Patchlevel-Update durchführen, wenn ich keinen Vertrag habe?',
        'Please find all relevant information within the updating instructions at %s.' =>
            'Bitte entnehmen Sie alle relevanten Informationen der Update-Anweisung auf %s.',
        'In case you would have further questions we would be glad to answer them.' =>
            'Sollten Sie weitere Fragen haben, freuen wir uns, diese zu beantworten.',
        'Please visit our customer portal and file a request.' => 'Bitte besuchen Sie unser Kundenportal und eröffnen Sie eine Anfrage.',
        'Install Package' => 'Paket installieren',
        'Update Package' => 'Paket Aktualisieren',
        'Package' => 'Paket',
        'Required package %s is already installed.' => 'Vorausgesetzes Paket %s ist bereits installiert.',
        'Required Perl module %s is already installed.' => 'Vorausgesetzes Perl Modul %s ist bereits installiert.',
        'Required package %s needs to get installed!' => 'Vorausgesetzes Paket %s muss noch installiert werden!',
        'Required package %s needs to get updated to version %s!' => 'Vorausgesetzes Paket %s muss noch auf Version %s aktuallisiert werden!',
        'Required Perl module %s needs to get installed or updated!' => 'Vorausgesetzes Perl Modul %s muss noch installiert oder aktuallisiert werden!',
        'Continue' => 'Weiter',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Stellen Sie sicher, dass Ihre Datenbank Pakete über %s MB akzeptiert (Derzeit werden nur Pakete bis %s MB akzeptiert). Bitte passen Sie die Einstellung max_allowed_packet Ihrer Datenbank-Konfiguration an, um Fehler zu vermeiden.',
        'Install' => 'Installieren',
        'Update' => 'Aktualisieren',
        'Update repository information' => 'Verzeichnis aktualisieren',
        'Update all installed packages' => 'Alle installierten Pakete aktualisieren',
        'Online Repository' => 'Online-Verzeichnis',
        'Vendor' => 'Anbieter',
        'Action' => 'Aktion',
        'Module documentation' => 'Moduldokumentation',
        'Local Repository' => 'Lokales Verzeichnis',
        'Uninstall' => 'Deinstallieren',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Paket nicht korrekt installiert. Bitte erneut installieren.',
        'Reinstall' => 'Erneut installieren',
        'Download package' => 'Paket herunterladen',
        'Rebuild package' => 'Paket neu aufbauen (rebuild)',
        'Package Information' => 'Paketinformationen',
        'Metadata' => 'Metadaten',
        'Change Log' => 'Änderungsprotokoll',
        'Date' => 'Datum',
        'List of Files' => 'Dateiliste',
        'Permission' => 'Berechtigungen',
        'Size' => 'Größe',
        'Problem' => 'Problem',
        'OK' => 'OK',
        'Download file from package!' => 'Datei aus dem Paket herunterladen!',
        'Required' => 'Benötigt',
        'Primary Key' => 'Primärer Schlüssel',
        'Auto Increment' => 'Automatisch erhöhen',
        'SQL' => 'SQL',
        'File Differences for File %s' => 'Unterschiede für Datei %s',
        'File differences for file %s' => 'Dateiunterschiede für Datei %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPerformanceLog.tt
        'This feature is enabled!' => 'Dieses Feature ist aktiv!',
        'Just use this feature if you want to log each request.' => 'Nur aktivieren, wenn jede Anfrage protokolliert werden soll.',
        'Activating this feature might affect your system performance!' =>
            'Bitte beachten Sie, dass das Aktivieren dieser Funktion Leistungseinbußen zur Folge haben kann!',
        'Disable it here!' => 'Hier deaktivieren!',
        'Logfile too large!' => 'Logdatei zu groß!',
        'The logfile is too large, you need to reset it' => 'Die Logdatei ist zu groß, sie muss zurückgesetzt werden',
        'Performance Log' => 'Leistungsprotokoll',
        'Range' => 'Bereich',
        'last' => 'letzten',
        'Interface' => 'Interface',
        'Requests' => 'Anfragen',
        'Min Response' => 'Min. Antwortzeit',
        'Max Response' => 'Max. Antwortzeit',
        'Average Response' => 'Durchschnittliche Antwortzeit',
        'Period' => 'Zeitraum',
        'minutes' => 'Minuten',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'Durchschnitt',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPostMasterFilter.tt
        'Add PostMaster Filter' => 'Postmaster-Filter hinzufügen',
        'Filter for PostMaster Filters' => 'Nach Postmaster Filtern suchen',
        'Filter for PostMaster filters' => 'Nach Postmaster Filtern suchen',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Einkommende E-Mails anhand von E-Mail-Kopfzeilen verteilen oder filtern. Für die Suche können auch reguläre Ausdrücke benutzt werden.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Wenn nur eine E-Mail-Adresse gesucht wird, dann benutzen Sie EMAILADDRESS:info@example.com in From, To oder Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Wenn Sie reguläre Ausdrücke verwenden, können Sie die gefundenen Werte in () auch als [***] in der Aktion "Setzen" verwenden.',
        'You can also use named captures %s and use the names in the \'Set\' action %s (e.g. Regexp: %s, Set action: %s). A matched EMAILADDRESS has the name \'%s\'.' =>
            'Sie können auch benannte Gruppierungen %s und die Namen in der "Setzen"-Aktion verwenden %s (z. B. Regexp: %s, "Setzen"-Aktion: %s). Eine gefundene EMAILADDRESS hat den Namen "%s".',
        'PostMaster Filter Management' => 'Postmaster-Filter-Verwaltung',
        'Edit PostMaster Filter' => 'Postmaster-Filter bearbeiten',
        'Delete this filter' => 'Diesen Filter löschen',
        'Do you really want to delete this postmaster filter?' => 'Möchten Sie diesen Postmaster-Filter wirklich löschen?',
        'A postmaster filter with this name already exists!' => 'Es existiert bereits ein Postmaster Filter mit diesem Namen!',
        'Filter Condition' => 'Filterbedingung',
        'AND Condition' => 'UND-Bedingung',
        'Search header field' => 'Kopfzeilen-Feld durchsuchen',
        'for value' => 'nach Wert',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Dieses Feld sollte einen gültigen regulären Ausdruck oder ein Wort enthalten.',
        'Negate' => 'Negieren',
        'Set Email Headers' => 'E-Mail-Kopfzeilen setzen',
        'Set email header' => 'Setze E-Mail-Kopfzeile',
        'with value' => 'Mit Wert',
        'The field needs to be a literal word.' => 'Dieses Feld sollte ein Wort enthalten.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPriority.tt
        'Add Priority' => 'Priorität hinzufügen',
        'Filter for Priorities' => 'Filter für Prioritäten',
        'Filter for priorities' => 'Filter für Prioritäten',
        'Configure Priority Visibility and Defaults' => 'Prioritätssichtbarkeit und Standardeinstellungen konfigurieren',
        'Priority Management' => 'Prioritäten-Verwaltung',
        'Edit Priority' => 'Priorität bearbeiten',
        'Color' => 'Farbe',
        'This priority is present in a SysConfig setting, confirmation for updating settings to point to the new priority is needed!' =>
            'Diese Priorität ist in einer SysConfig-Einstellung vorhanden. Eine Bestätigung für die Aktualisierung der Einstellung auf die neue Priorität ist notwendig!',
        'This priority is used in the following config settings:' => 'Diese Priorität wird in folgenden Konfigurationseinstellungen verwendet:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagement.tt
        'Filter for Processes' => 'Filter für Prozesse',
        'Filter for processes' => 'Filter für Prozesse',
        'Create New Process' => 'Neuen Prozess erstellen',
        'Deploy All Processes' => 'Alle Prozesse in Betrieb nehmen',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Hier können Sie eine Konfigurationdatei hochladen, um einen Prozess in Ihr System zu importieren. Die Datei muss im YAML-Format vorliegen, so wie sie vom Prozessmanagement auch exportiert wird.',
        'Upload process configuration' => 'Prozesskonfiguration hochladen',
        'Import process configuration' => 'Prozesskonfiguration importieren',
        'Ready2Adopt Processes' => 'Ready2Adopt-Prozesse',
        'Here you can activate Ready2Adopt processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Hier können Sie Ready2Adopt-Prozesse zur Demonstration unserer Best-Practices aktivieren. Bitte beachten Sie, dass eventuell weitere Einstellungen erforderlich sind.',
        'Import Ready2Adopt process' => 'Ready2Adopt-Prozesse importieren',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Um einen neuen Prozess zu erstellen, können Sie entweder einen Prozess aus einem anderen System importieren, oder einen ganz neuen erstellen.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Änderungen an den Prozessen wirken sich erst dann aus, wenn Sie die Prozesskonfiguration synchronisieren. Dabei werden alle Änderungen in die Systemkonfiguration übernommen.',
        'Access Control Lists (ACL)' => 'Access-Control-Lists (ACL)',
        'Generic Agent' => 'Generic Agent',
        'Manage Process Widget Groups' => 'Prozess-Widget-Gruppen verwalten',
        'Processes' => 'Prozesse',
        'Process name' => 'Prozessname',
        'Print' => 'Drucken',
        'Export Process Configuration' => 'Prozesskonfiguration exportieren',
        'Copy Process' => 'Prozess kopieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivity.tt
        'Please note, that changing this activity will affect the following processes' =>
            'Achtung: Änderungen an dieser Aktivität werden sich auf folgende Prozesse auswirken',
        'Activity' => 'Aktivität',
        'Activity Name' => 'Name der Aktivität',
        'Scope' => 'Geltungsbereich',
        'Scope Entity ID' => 'Geltungsbereich-Entitäts-ID',
        'This field is required for activities with a scope.' => 'Dieses Feld ist für Aktivitäten mit einem Geltungsbereich erforderlich.',
        'Activity Dialogs' => 'Aktivitäts-Dialoge',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Sie können Aktivitäts-Dialoge dieser Aktivität zuweisen, indem Sie die Elemente mit der Maus aus der linken Liste in die rechte Liste verschieben.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Die Elemente können auch durch Verschieben mit der Maus geordnet werden.',
        'Available Activity Dialogs' => 'Verfügbare Aktivitäts-Dialoge',
        'Filter available Activity Dialogs' => 'Verfügbare Aktivitäts-Dialoge filtern',
        'Also show global %s' => 'Auch globale %s anzeigen',
        'Name: %s, EntityID: %s' => 'Name: %s, EntityID: %s',
        'Create New Activity Dialog' => 'Neuen Aktivitäts-Dialog erstellen',
        'Assigned Activity Dialogs' => 'Zugewiesene Aktivitäts-Dialoge',
        'Filter Assigned Activity Dialogs' => 'Zugewiesene Aktivitäts-Dialoge filtern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivityDialog.tt
        'Please note that changing this activity dialog will affect the following activities' =>
            'Veränderungen an diesem Aktivitäts-Dialog werden sich auf folgende Aktivitäten auswirken',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Bitte beachten Sie, dass Kundenbenutzer die folgenden Felder nicht sehen oder benutzen können: Besitzer (Owner), Verantwortlicher (Responsible), Sperre (Lock), Warten bis (PendingTime) und Kundennummer (CustomerID).',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Das Queue-Feld kann nur von Kunden ausgewählt werden, wenn diese ein neues Ticket erstellen.',
        'Activity Dialog' => 'Aktivitäts-Dialog',
        'Activity dialog Name' => 'Name des Aktivitäts-Dialogs',
        'Available in' => 'Verfügbar in',
        'Description (short)' => 'Beschreibung (kurz)',
        'Description (long)' => 'Beschreibung (lang)',
        'The selected permission does not exist.' => 'Die ausgewählte Berechtigung existiert nicht.',
        'Required Lock' => 'Erforderliche Sperre',
        'The selected required lock does not exist.' => 'Die ausgewählte Sperre existiert nicht.',
        'This field is required for activitiy dialogs with a scope.' => 'Dieses Feld ist für Aktivitäts-Dialoge mit einem Geltungsbereich erforderlich.',
        'Submit Advice Text' => 'Hinweistext beim Absenden',
        'Submit Button Text' => 'Hinweistext für die Schaltfläche "Absenden"',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Sie können diesem Aktivitäts-Dialog Felder zuweisen, indem Sie sie mit der Maus aus der rechten Liste in die linke Liste verschieben.',
        'Available Fields' => 'Verfügbare Felder',
        'Filter available fields' => 'Verfügbare Felder filtern',
        'Assigned Fields' => 'Zugewiesene Felder',
        'Filter assigned fields' => 'Zugewiesene Felder filtern',
        'Communication Channel' => 'Kommunikationskanal',
        'Is visible for customer' => 'Ist sichtbar für Kunde',
        'Text Template' => 'Textvorlage',
        'Auto fill' => 'automatisch ausfüllen',
        'Display' => 'Anzeige',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementPath.tt
        'Path' => 'Pfad',
        'Edit this transition' => 'Diesen Übergang bearbeiten',
        'Transition Actions' => 'Übergangs-Aktionen',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Die können diesem Übergang Übergangs-Aktionen zuweisen, indem Sie sie mit der Maus aus der rechten Liste in die linke Liste verschieben.',
        'Available Transition Actions' => 'Verfügbare Übergangs-Aktionen',
        'Filter available Transition Actions' => 'Verfügbare Übergangs-Aktionen filtern',
        'Create New Transition Action' => 'Neue Übergangs-Aktion erstellen',
        'Assigned Transition Actions' => 'Zugewiesene Übergangs-Aktionen',
        'Filter assigned Transition Actions' => 'Zugewiesene Übergangs-Aktionen filtern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessAccordion.tt
        'Activities' => 'Aktivitäten',
        'Filter Activities...' => 'Aktivitäten filtern...',
        'Create New Activity' => 'Neue Aktivität erstellen',
        'Filter Activity Dialogs...' => 'Aktivitäts-Dialoge filtern...',
        'Transitions' => 'Übergänge',
        'Filter Transitions...' => 'Übergänge filtern...',
        'Create New Transition' => 'Neuen Übergang erstellen',
        'Filter Transition Actions...' => 'Übergangs-Aktionen filtern...',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessEdit.tt
        'Print process information' => 'Prozessinformationen drucken',
        'Delete Process' => 'Prozess löschen',
        'Delete Inactive Process' => 'Inaktiven Prozess löschen',
        'Available Process Elements' => 'Verfügbare Prozesselemente',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Die in der Seitenleiste aufgelisteten Elemente können mit der Maus in den Zeichenbereich gezogen werden.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Sie können Aktivitäten im Zeichenbereich platzieren, um diese Aktivitäten dem Prozess zuzuordnen.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Aktivitäts-Dialoge können Sie einer Aktivität zuweisen, indem Sie diese aus der Seitenleiste über die Aktivität im Zeichenbereich ziehen.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'Eine Verbindung zwischen Aktivitäten können Sie erstellen, indem Sie das Übergangselement auf die Start-Aktivität der Verbindung ziehen. Anschließend können Sie das freie Ende des Pfeils zur Ziel-Aktivität ziehen.',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Aktionen können einem Übergang zugeweisen werden, indem Sie das Aktionselement auf den Namen des Übergangs ziehen.',
        'Edit Process' => 'Prozess bearbeiten',
        'Edit Process Information' => 'Prozessinformationen bearbeiten',
        'Process Name' => 'Prozessname',
        'The selected state does not exist.' => 'Der ausgewählte Status existiert nicht.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Aktivitäten, Aktivitäts-Dialoge und Übergänge hinzufügen und bearbeiten',
        'Show EntityIDs' => 'EntityIDs einblenden',
        'Extend the width of the Canvas' => 'Die Breite des Zeichenbereichs vergrößern',
        'Extend the height of the Canvas' => 'Die Höhe des Zeichenbereichs vergrößern',
        'Remove the Activity from this Process' => 'Aktivität aus diesem Prozess entfernen',
        'Edit this Activity' => 'Diese Aktivität bearbeiten',
        'Save Activities, Activity Dialogs and Transitions' => 'Aktivitäten, Aktivitätsdialoge und Übergänge speichern',
        'Do you really want to delete this Process?' => 'Möchten Sie diesen Prozess wirklich löschen?',
        'Do you really want to delete this Activity?' => 'Möchten Sie diese Aktivität wirklich löschen?',
        'Do you really want to delete this Activity Dialog?' => 'Möchten Sie diesen Aktivitäts-Dialog wirklich löschen?',
        'Do you really want to delete this Transition?' => 'Möchten Sie diesen Übergang wirklich löschen?',
        'You can not edit a transition before it\'s connected to two activities.' =>
            'Sie können einen Übergang nicht bearbeiten, bevor er mit zwei Aktivitäten verbunden ist.',
        'Do you really want to delete this Transition Action?' => 'Möchten Sie diese Übergangs-Aktion wirklich löschen?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Möchten Sie diese Aktivität wirklich vom Zeichenbereich entfernen? Das kann nur rückgängig gemacht werden, wenn Sie diese Ansicht ohne Speichern verlassen.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Möchten Sie diesen Übergang wirklich von der Zeichenfläche entfernen? Das kann nur rückgängig gemacht werden, wenn Sie dieses Fenster ohne Speichern verlassen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessNew.tt
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'Hier können Sie einen neuen Prozess erstellen. Um den Prozess für die Benutzer verfügbar zu machen, sollten Sie den Status auf "Aktiv" setzen und als Abschluss Ihrer Arbeit die Synchronisation durchführen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessPrint.tt
        'Start Activity' => 'Startaktivität',
        'Contains %s dialog(s)' => 'Enthält %s Dialog(e)',
        'Assigned dialogs' => 'Zugewiesene Dialoge',
        'Activities are not being used in this process.' => 'In diesem Prozess werden keine Aktivitäten verwendet.',
        'Assigned fields' => 'Zugewiesene Felder',
        'Activity dialogs are not being used in this process.' => 'In diesem Prozess werden keine Aktivitäts-Dialoge verwendet.',
        'Condition linking' => 'Bedingungsverknüpfungen',
        'Transitions are not being used in this process.' => 'In diesem Prozess werden keine Übergänge verwendet.',
        'Module name' => 'Modulname',
        'Configuration' => 'Konfiguration',
        'Transition actions are not being used in this process.' => 'In diesem Prozess werden keine Übergangs-Aktionen verwendet.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransition.tt
        'Please note that changing this transition will affect the following processes' =>
            'Achtung: Änderungen an diesem Übergang wirken sich auf folgende Prozesse aus',
        'Transition' => 'Übergang',
        'Transition Name' => 'Name des Übergangs',
        'This field is required for transitions with a scope.' => 'Dieses Feld ist für Übergänge mit einem Geltungsbereich erforderlich.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransitionAction.tt
        'Please note that changing this transition action will affect the following processes' =>
            'Achtung: Änderungen an dieser Übergangs-Aktion wirken sich auf folgende Prozesse aus',
        'Transition Action' => 'Übergangs-Aktion',
        'Transition Action Name' => 'Name der Übergangs-Aktion',
        'Transition Action Module' => 'Übergangs-Aktionsmodul',
        'This field is required for transition actions with a scope.' => 'Dieses Feld ist für Übergangsaktionen mit einem Geltungsbereich erforderlich.',
        'Config Parameters' => 'Konfigurations-Parameter',
        'Add a new Parameter' => 'Neuen Parameter hinzufügen',
        'Remove this Parameter' => 'Parameter entfernen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueue.tt
        'Add Queue' => 'Queue hinzufügen',
        'Filter for Queues' => 'Filter für Queues',
        'Filter for queues' => 'Filter für Queues',
        'Email Addresses' => 'E-Mail-Adressen',
        'PostMaster Mail Accounts' => 'Postmaster-E-Mail-Konten',
        'Salutations' => 'Anreden',
        'Signatures' => 'Signaturen',
        'Templates ↔ Queues' => 'Vorlagen ↔ Queues',
        'Configure Working Hours' => 'Arbeitszeiten Konfigurieren',
        'Configure Queue Related Settings' => 'Queue-Einstellungen konfigurieren',
        'Edit Queue' => 'Queue bearbeiten',
        'A queue with this name already exists!' => 'Eine Queue mit diesem Namen ist bereits vorhanden!',
        'This queue is present in a SysConfig setting, confirmation for updating settings to point to the new queue is needed!' =>
            'Diese Queue ist in einer SysConfig-Einstellung vorhanden. Eine Bestätigung für die Aktualisierung der Einstellung auf die neue Queue ist notwendig!',
        'Sub-queue of' => 'Unter-Queue von',
        'Follow up Option' => 'Nachfrage-Option',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Gibt an, ob eine Rückmeldung zu einem geschlossenen Ticket dieses Ticket erneut öffnet, abgelehnt wird oder zu einem neuen Ticket führt.',
        'Unlock timeout' => 'Freigabe-Zeitintervall',
        '0 = no unlock' => '0 = keine Freigabe',
        'hours' => 'Stunden',
        'Only business hours are counted.' => 'Nur Geschäftszeiten werden berücksichtigt.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Wenn ein Agent ein Ticket sperrt und es vor der Entsperrzeit nicht schließt, wird es entsperrt und wieder für andere Agenten verfügbar gemacht.',
        'Notify by' => 'Benachrichtigung durch',
        '0 = no escalation' => '0 = keine Eskalation',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Wenn vor der definierten Zeit keine Kundenreaktion erfolgt (externe E-Mail oder Telefon), eskaliert das Ticket.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Wenn ein Artikel vom Kunden hinzugefügt wird, wird die Eskalationszeit zurückgesetzt. Wenn vor der definierten Zeit keine Kundenreaktion erfolgt, eskaliert das Ticket.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Wenn ein Ticket nicht vor der definierten Zeit geschlossen wird, eskaliert es.',
        'Ticket lock after a follow up' => 'Ticket sperren nach einer Rückmeldung',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Wenn ein Ticket geschlossen wird und der Kunde eine Rückmeldung schickt, wird das Ticket für den letzten Besitzer gesperrt.',
        'System address' => 'Systemadresse',
        'Will be the sender address of this queue for email answers.' => 'Absenderadresse für E-Mails aus dieser Queue.',
        'Default sign key' => 'Standard-Signierschlüssel',
        'To use a sign key, PGP keys or S/MIME certificates need to be added with identifiers for selected queue system address.' =>
            'Um einen Signierschlüssel zu verwenden, müssen PGP-Schlüssel oder S/MIME-Zertifikate mit Identifikatoren für die ausgewählte Systemadresse der Queue hinzugefügt werden.',
        'Salutation' => 'Anrede',
        'The salutation for email answers.' => 'Die Anrede für E-Mail-Antworten.',
        'Signature' => 'Signatur',
        'The signature for email answers.' => 'Die Signatur für E-Mail-Antworten.',
        'This queue is used in the following config settings:' => 'Diese Queue wird in folgenden Konfigurationseinstellungen verwendet:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueAutoResponse.tt
        'This filter allow you to show queues without auto responses' => 'Dieser Filter erlaubt das Anzeigen von Queues ohne Automatische Antworten',
        'Queues without Auto Responses' => 'Queues ohne automatische Antworten',
        'This filter allow you to show all queues' => 'Dieser Filter erlaubt das Anzeigen aller Queues',
        'Show All Queues' => 'Alle Queues anzeigen',
        'Auto Responses' => 'Automatische Antworten',
        'Manage Queue-Auto Response Relations' => 'Zuordnung von Queues und automatischen Antworten verwalten',
        'Change Auto Response Relations for Queue' => 'Automatische Antwort-Zuordnungen verändern für Queue',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueTemplates.tt
        'Filter for Templates' => 'Filter für Vorlagen',
        'Filter for templates' => 'Filter für Vorlagen',
        'Manage Template-Queue Relations' => 'Zuordnung von Vorlagen zu Queues verwalten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRole.tt
        'Add Role' => 'Rolle hinzufügen',
        'Filter for Roles' => 'Filter für Rollen',
        'Filter for roles' => 'Filter für Rollen',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Erstellen Sie Rollen und weisen Sie Gruppen hinzu. Danach fügen Sie Benutzer zu den Rollen hinzu.',
        'Agents ↔ Roles' => 'Agenten ↔ Rollen',
        'Role Management' => 'Verwaltung von Rollen',
        'Edit Role' => 'Rolle bearbeiten',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Bislang sind keine Rollen definiert. Bitte verwenden Sie die Schaltfläche "Rolle hinzufügen", um neue Rollen zu erstellen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleGroup.tt
        'Roles' => 'Rollen',
        'Manage Role-Group Relations' => 'Zuordnungen von Rollen zu Gruppen verwalten',
        'Select the role:group permissions.' => 'Wählen Sie die Rolle:Gruppe-Berechtigungen aus.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Wenn nichts ausgewählt ist, hat die Rolle in dieser Gruppe keine Berechtigungen (und kann nicht auf Tickets zugreifen).',
        'Toggle %s permission for all' => 'Berechtigung %s für alle umschalten',
        'move_into' => 'Verschieben in',
        'Permissions to move tickets into this group/queue.' => 'Berechtigungen, um Tickets in eine Gruppe/Queue zu verschieben.',
        'create' => 'Erstellen',
        'Permissions to create tickets in this group/queue.' => 'Berechtigungen, um in einer Gruppe/Queue Tickets zu erstellen.',
        'note' => 'Notiz',
        'Permissions to add notes to tickets in this group/queue.' => 'Berechtigungen zum Hinzufügen von Notizen zu Tickets dieser Gruppe/Queue.',
        'owner' => 'Besitzer',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Berechtigungen zum Ändern des Besitzers von Tickets dieser Gruppe/Queue.',
        'priority' => 'Priorität',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Berechtigungen, um die Priorität eines Tickets in einer Gruppe/Queue zu ändern.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleUser.tt
        'Add Agent' => 'Agent hinzufügen',
        'Filter for Agents' => 'Filter für Agenten',
        'Filter for agents' => 'Filter für Agenten',
        'Agents' => 'Agenten',
        'Manage Agent-Role Relations' => 'Zuordnungen von Agenten und Rollen verwalten',
        'Manage Role-Agent Relations' => 'Zuordnungen von Agenten und Rollen verwalten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSLA.tt
        'Add SLA' => 'SLA hinzufügen',
        'Filter for SLAs' => 'Filter für SLAs',
        'Configure SLA Visibility and Defaults' => 'SLA-Sichtbarkeit und Standardeinstellungen konfigurieren',
        'SLA Management' => 'SLA-Verwaltung',
        'Edit SLA' => 'SLA bearbeiten',
        'Please write only numbers!' => 'Bitte geben Sie nur Zahlen ein!',
        'Minimum Time Between Incidents' => 'Minimale Zeit zwischen den Vorfällen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIME.tt
        'SMIME support is disabled' => 'S/MIME-Unterstützung ist deaktiviert',
        'To be able to use SMIME in Znuny, you have to enable it first.' =>
            'Um S/MIME in Znuny zu verwenden, müssen Sie es zunächst aktivieren.',
        'Enable SMIME support' => 'S/MIME-Unterstützung aktivieren',
        'Faulty SMIME configuration' => 'Fehlerhafte S/MIME-Konfiguration',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'S/MIME-Unterstützung ist zwar aktiviert, jedoch fehlerhaft konfiguriert. Bitte prüfen Sie die Konfiguration durch Klicken der nachfolgenden Schaltfläche.',
        'Check SMIME configuration' => 'S/MIME-Konfiguration prüfen',
        'Add Certificate' => 'Zertifikat hinzufügen',
        'Add Private Key' => 'Privaten Schlüssel hinzufügen',
        'Filter for Certificates' => 'Filter für Zertifikate',
        'Filter for certificates' => 'Filter für Zertifikate',
        'To show certificate details click on a certificate icon.' => 'Zertifikatsdetails können Sie mit einem Klick auf das Zertifikats-Icon aufrufen.',
        'To manage private certificate relations click on a private key icon.' =>
            'Um Zertifikatszugehörigkeiten zu verwalten können Sie auf das Icon eines privaten Schlüssels klicken.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Hier können Sie Beziehungen zu Ihrem privaten Zertifikat hinzufügen, diese werden jedes Mal zur S/MIME-Signatur hinzugefügt, wenn Sie dieses Zertifikat verwenden um eine E-Mail zu signieren.',
        'See also' => 'Siehe auch',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Über diesen Weg können die Zertifikate und privaten Schlüssel im Dateisystem bearbeitet werden.',
        'S/MIME Management' => 'S/MIME-Verwaltung',
        'Hash' => 'Hash',
        'Create' => 'Erstellen',
        'Handle related certificates' => 'Zugehörige Zertifikate verwalten',
        'Read certificate' => 'Zertifikat lesen',
        'Delete this certificate' => 'Dieses Zertifikat löschen',
        'File' => 'Datei',
        'Secret' => 'Geheimnis',
        'Related Certificates for' => 'Zugehörige Zertifikate für',
        'Delete this relation' => 'Diese Zugehörigkeit löschen',
        'Available Certificates' => 'Verfügbare Zertifikate',
        'Filter for S/MIME certs' => 'Filter für S/MIME Zertifikate',
        'Relate this certificate' => 'Dieses Zertifikat zuordnen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIMECertRead.tt
        'S/MIME Certificate' => 'S/MIME-Zertifikat',
        'Close' => 'Schließen',
        'Certificate Details' => 'Zertifikatsdetails',
        'Close this dialog' => 'Diesen Dialog schließen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSalutation.tt
        'Add Salutation' => 'Anrede hinzufügen',
        'Filter for Salutations' => 'Filter für Anreden',
        'Filter for salutations' => 'Filter für Anreden',
        'Salutation Management' => 'Verwaltung von Anreden',
        'Edit Salutation' => 'Anrede bearbeiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSecureMode.tt
        'Secure Mode Needs to be Enabled!' => 'Sicherheitsmodus muss eingeschaltet sein!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'Der Sicherheitsmodus wird normalerweise eingeschaltet, nachdem die Installation abgeschlossen ist.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Wenn der Sicherheitsmodus nicht aktiv ist, können Sie ihn mit der SysConfig aktivieren, da Ihr System bereits läuft.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSelectBox.tt
        'Filter for Results' => 'Filter für Resultate',
        'Filter for results' => 'Filter für Resultate',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Senden Sie SQL-Befehle direkt an die Anwendungsdatenbank. Es ist nicht möglich, den Inhalt der Tabellen zu ändern, es sind nur SELECT-Abfragen erlaubt.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Hier können Sie SQL eingeben, das an die Datenbank gesendet wird.',
        'SQL Box' => 'SQL Box',
        'Options' => 'Optionen',
        'Only select queries are allowed.' => 'Es sind nur Select-Abfragen erlaubt.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Die Syntax Ihrer SQL-Abfrage ist fehlerhaft. Bitte prüfen.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Es fehlt mindestens ein Parameter für das Binding. Bitte prüfen.',
        'Result format' => 'Ergebnisformat',
        'Run Query' => 'Anfrage ausführen',
        '%s Results' => '%s Ergebnisse',
        'Query is executed.' => 'Anfrage wird ausgeführt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminService.tt
        'Add Service' => 'Service hinzufügen',
        'Configure Service Visibility and Defaults' => 'Serivce-Sichtbarkeit und Standardeinstellungen konfigurieren',
        'Service Management' => 'Service-Verwaltung',
        'Edit Service' => 'Service bearbeiten',
        'Service name maximum length is 200 characters (with Sub-service).' =>
            'Die maximale Länge für einen Service-Name (inklusive Unter-Services) beträgt 200 Zeichen.',
        'Sub-service of' => 'Unterservice von',
        'Criticality' => 'Kritikalität',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSession.tt
        'All sessions' => 'Alle Sitzungen',
        'Agent sessions' => 'Agenten-Sitzungen',
        'Customer sessions' => 'Kunden-Sitzungen',
        'Unique agents' => 'Eindeutige Agenten',
        'Unique customers' => 'Eindeutige Kunden',
        'Kill all sessions' => 'Alle Sitzungen beenden',
        'Kill this session' => 'Diese Sitzung beenden',
        'Filter for Sessions' => 'Filter für Sitzungen',
        'Filter for sessions' => 'Filter für Sitzungen',
        'Session Management' => 'Sitzungsverwaltung',
        'Detail Session View for %s (%s)' => 'Detail-Sitzungsansicht für %s (%s)',
        'Session' => 'Sitzung',
        'Kill' => 'Beenden',
        'Detail View for SessionID: %s - %s' => 'Detailansicht für SessionID: %s - %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSignature.tt
        'Add Signature' => 'Signatur hinzufügen',
        'Filter for Signatures' => 'Filter für Signaturen',
        'Filter for signatures' => 'Filter für Signaturen',
        'Signature Management' => 'Signaturverwaltung',
        'Edit Signature' => 'Signatur bearbeiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminState.tt
        'Add State' => 'Status hinzufügen',
        'Filter for States' => 'Filter für Status',
        'Filter for states' => 'Filter für Status',
        'Attention' => 'Achtung',
        'Please also update the states in SysConfig where needed.' => 'Bitte aktualisieren Sie auch die Status in der SysConfig dort, wo es erforderlich ist.',
        'Configure State Visibility and Defaults' => 'Status-Sichtbarkeit und Standardeinstellungen konfigurieren',
        'Configure State Type Visibility and Defaults' => 'Statustyp-Sichtbarkeit und Standardeinstellungen konfigurieren',
        'State Management' => 'Statusverwaltung',
        'Edit State' => 'Status bearbeiten',
        'This state is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Dieser Status ist in einer SysConfig-Einstellung vorhanden. Eine Bestätigung für die Aktualisierung der Einstellung auf den neuen Status ist notwendig!',
        'State type' => 'Statustyp',
        'It\'s not possible to invalidate this entry because there is no other merge states in system!' =>
            'Es ist nicht möglich, diese Eingabe ungültig zu machen, da es keinen anderen Statustyp für "Zusammenfassen" im System gibt!',
        'This field must be a hexadecimal color code.' => 'Dieses Feld muss ein hexadezimaler Farbcode beinhalten.',
        'This state is used in the following config settings:' => 'Dieser Status wird in folgenden SysConfig-Einstellungen verwendet:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSupportDataCollector.tt
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Ein Support-Paket (einschließlich: Systemregistrierungsdaten, Support-Daten, eine Liste der installierten Pakete und aller lokal geänderten Quellcode-Dateien) kann mit dieser Schaltfläche erstellt werden:',
        'Generate Support Bundle' => 'Support-Paket erstellen',
        'The Support Bundle has been Generated' => 'Das Support-Paket wurde erstellt',
        'A file containing the support bundle will be downloaded to the local system.' =>
            'Das Support-Paket wird als Datei ins lokale Dateisystem heruntergeladen.',
        'Support Data' => 'Supportdaten',
        'Error: Support data could not be collected (%s).' => 'Fehler: Support-Daten konnten nicht ermittelt werden (%s).',
        'Support Data Collector' => 'Supportdaten-Analyse',
        'Delete cache' => 'Cache löschen',
        'Details' => 'Details',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemAddress.tt
        'Add System Address' => 'Systemadresse hinzufügen',
        'Filter for System Addresses' => 'Filter für Systemadressen',
        'Filter for system addresses' => 'Filter für Systemadressen',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Alle einkommenden E-Mails mit dieser Adresse in An: oder Cc: werden an die ausgewählte Queue geleitet.',
        'System Email Addresses Management' => 'Verwaltung von System-E-Mail-Adressen',
        'Add System Email Address' => 'System-E-Mail-Adresse hinzufügen',
        'Edit System Email Address' => 'System-E-Mail-Adresse bearbeiten',
        'Email address' => 'E-Mail-Adresse',
        'Display name' => 'Anzeigename',
        'This email address is already used as system email address.' => 'Diese E-Mail-Adresse wird bereits als Systemadresse verwendet.',
        'The display name and email address will be shown on mail you send.' =>
            'Der Anzeigename und die E-Mail-Adresse werden für die gesendeten E-Mails verwendet.',
        'This system address cannot be set to invalid.' => 'Die Systemadresse kann nicht auf ungültig gesetzt werden.',
        'This system address cannot be set to invalid, because it is used in one or more queue(s) or auto response(s).' =>
            'Die Systemadresse kann nicht auf ungültig gesetzt werden, da sie in einer oder mehreren Queues oder Automatischen Antworten verwendet wird.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfiguration.tt
        'online administrator documentation' => 'Online-Administratorhandbuch',
        'System configuration' => 'Systemkonfiguration',
        'Navigate through the available settings by using the tree in the navigation box on the left side.' =>
            'Navigieren Sie mithilfe des Baums auf der linken Seite durch die verfügbaren Einstellungen.',
        'Find certain settings by using the search field below or from search icon from the top navigation.' =>
            'Finden Sie spezielle Einstellungen mithilfe des Suchfelds oder der Lupe in der Hauptnavigation.',
        'Find out how to use the system configuration by reading the %s.' =>
            'Erfahren Sie mehr zur Nutzung der Systemkonfiguration im %s.',
        'Search in all settings...' => 'In allen Einstellungen suchen...',
        'There are currently no settings available. Please make sure to run \'znuny.Console.pl Maint::Config::Rebuild\' before using the software.' =>
            'Aktuell sind keine Einstellungen verfügbar. Bitte führen Sie \'znuny.Console.pl Maint::Config::Rebuild\' aus, bevor Sie die Software nutzen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationDeployment.tt
        'Help' => 'Hilfe',
        'This is an overview of all settings which will be part of the deployment if you start it now. You can compare each setting to its former state by clicking the icon on the top right.' =>
            'Hier finden Sie eine Übersicht aller Einstellungen, die in die nächste Inbetriebnahme einfließen würden. Sie können jede Einstellung mit ihrem früheren Stand vergleichen, indem Sie auf das Icon oben rechts klicken.',
        'To exclude certain settings from a deployment, click the checkbox on the header bar of a setting.' =>
            'Um bestimmte Einstellungen aus der Inbetriebnahme auszuschließen, verwenden Sie die Checkbox im Kopfbereich der Einstellung.',
        'By default, you will only deploy settings which you changed on your own. If you\'d like to deploy settings changed by other users, too, please click the link on top of the screen to enter the advanced deployment mode.' =>
            'Standardmäßig werden nur Einstellungen in Betrieb genommen, die sie selbst verändert haben. Falls Sie auch Änderungen von anderen Benutzern in Betrieb nehmen möchten, verwenden Sie bitte den Link zur erweiterten Inbetriebnahme.',
        'A deployment has just been restored, which means that all affected setting have been reverted to the state from the selected deployment.' =>
            'Eine Inbetriebnahme wurde gerade wiederhergestellt. Das bedeutet, dass alle betroffenen Einstellungen auf den Stand zurückgesetzt wurden, in dem sie sich zum Zeitpunkt der gewählten Inbetriebnahme befanden.',
        'Please review the changed settings and deploy afterwards.' => 'Bitte prüfen Sie die geänderten Einstellungen und nehmen Sie sie anschließend in Betrieb.',
        'An empty list of changes means that there are no differences between the restored and the current state of the affected settings.' =>
            'Eine leere Änderungsliste bedeutet, dass es keine Unterschiede zwischen dem wiederhergestellten und dem aktuellen Stand der betroffenen Einstellungen gibt.',
        'Changes Deployment' => 'Inbetriebnahme von Änderungen',
        'Changes Overview' => 'Übersicht - Alle Änderungen',
        'There are %s changed settings which will be deployed in this run.' =>
            'In diesem Lauf werden %s geänderte Einstellungen in Betrieb genommen.',
        'Switch to basic mode to deploy settings only changed by you.' =>
            'Wechseln Sie in den Basismodus, um nur Einstellungen in Betrieb zu nehmen, die Sie selbst geändert haben.',
        'You have %s changed settings which will be deployed in this run.' =>
            'In diesem Lauf werden %s von Ihnen geänderte Einstellungen in Betrieb genommen.',
        'Switch to advanced mode to deploy settings changed by other users, too.' =>
            'Wechseln Sie in den erweiterten Modus, um auch Einstellungen in Betrieb zu nehmen, die von anderen Agenten geändert wurden.',
        'There are no settings to be deployed.' => 'Derzeit sind keine Einstellungen zur Inbetriebnahme vorhanden.',
        'Switch to advanced mode to see deployable settings changed by other users.' =>
            'Wechseln Sie in den erweiterten Modus, um Einstellungen zu sehen, die von anderen Agenten geändert wurden und zur Inbetriebnahme bereit sind.',
        'Deploy selected changes' => 'Ausgewählte Einstellungen in Betrieb nehmen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationGroup.tt
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups.' =>
            'Diese Gruppe enthält selbst keine Einstellungen. Versuchen Sie, in eine der verfügbaren Untergruppen zu navigieren.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationImportExport.tt
        'Import & Export' => 'Import & Export',
        'Upload a file to be imported to your system (.yml format as exported from the System Configuration module).' =>
            'Wählen Sie eine Datei, die in Ihr System importiert werden soll (im von der Systemkonfiguration exportierten .yml-Format).',
        'Upload system configuration' => 'Systemkonfiguration hochladen',
        'Import system configuration' => 'Systemkonfiguration importieren',
        'Download current configuration settings of your system in a .yml file.' =>
            'Laden Sie die aktuellen Einstellungen Ihres Systems als .yml-Datei herunter.',
        'Export current configuration' => 'Aktuelle Konfiguration exportieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearch.tt
        'Search for' => 'Suche nach',
        'Search for category' => 'Nach Kategorie suchen',
        'Settings I\'m currently editing' => 'Durch mich in Bearbeitung',
        'Your search for "%s" in category "%s" did not return any results.' =>
            'Ihre Suche nach "%s" in der Kategorie "%s" ergab keine Ergebnisse.',
        'Your search for "%s" in category "%s" returned one result.' => 'Ihre Suche nach "%s" in der Kategorie "%s" ergab ein Ergebnis.',
        'Your search for "%s" in category "%s" returned %s results.' => 'Ihre Suche nach "%s" in der Kategorie "%s" ergab %s Ergebnisse.',
        'You\'re currently not editing any settings.' => 'Sie bearbeiten derzeit keine Einstellungen.',
        'You\'re currently editing %s setting(s).' => 'Sie bearbeiten derzeit %s Einstellung(en).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearchDialog.tt
        'Category' => 'Kategorie',
        'Run search' => 'Suche starten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationView.tt
        'Go back to Deployment Details' => 'Zurück zu den Inbetriebnahme-Details gehen',
        'View a custom List of Settings' => 'Eine eigene Liste an Einstellungen anzeigen',
        'View single Setting: %s' => 'Einstellung: %s anzeigen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles.tt
        'System file support' => 'Systemdatei-Support',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles/Widget.tt
        'Permissions' => 'Berechtigungen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenance.tt
        'Schedule New System Maintenance' => 'Neue Systemwartung planen',
        'Filter for System Maintenances' => 'Filter für Systemwartungen',
        'Filter for system maintenances' => 'Filter für Systemwartungen',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Ein Systemwartungs-Zeitfenster planen, um Agenten und Kunden auf die Downtime hinzuweisen.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Einige Zeit vor der Systemwartung werden die Nutzer einen Hinweis auf jedem Bildschirm sehen.',
        'System Maintenance Management' => 'Systemwartungs-Verwaltung',
        'Stop date' => 'Endzeitpunkt',
        'Delete System Maintenance' => 'Systemwartung entfernen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenanceEdit.tt
        'Edit System Maintenance' => 'Systemwartung bearbeiten',
        'Edit System Maintenance Information' => 'Systemwartungs-Information bearbeiten',
        'Date invalid!' => 'Ungültiges Datum!',
        'Login message' => 'Nachricht bei Anmeldung',
        'This field must have less then 250 characters.' => 'Dieses Feld muss weniger als 250 Zeichen lang sein.',
        'Show login message' => 'Nachricht bei Anmeldung anzeigen',
        'Notify message' => 'Hinweistext',
        'Manage Sessions' => 'Sitzungen verwalten',
        'All Sessions' => 'Alle Sitzungen',
        'Agent Sessions' => 'Agenten-Sitzungen',
        'Customer Sessions' => 'Kunden-Sitzungen',
        'Kill all Sessions, except for your own' => 'Alle Sitzungen außer Ihrer eigenen beenden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplate.tt
        'Add Template' => 'Vorlage hinzufügen',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Eine Vorlage ist ein Standardtext, der Ihren Agenten helfen kann, Tickets schneller zu erstellen, beantworten oder weiterzuleiten.',
        'Don\'t forget to add new templates to queues.' => 'Vergessen Sie nicht, neue Vorlagen den Queues zuzuordnen.',
        'Template Management' => 'Vorlagenverwaltung',
        'Edit Template' => 'Vorlage bearbeiten',
        'Attachments' => 'Anhänge',
        'Delete this entry' => 'Diesen Eintrag löschen',
        'Do you really want to delete this template?' => 'Möchten Sie diese Vorlage wirklich löschen?',
        'A standard template with this name already exists!' => 'Es existiert bereits eine Standardvorlage mit diesem Namen!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplateAttachment.tt
        'Manage Template-Attachment Relations' => 'Verwaltung der Zuordnung von Anhängen zu Vorlagen',
        'Toggle active for all' => 'Aktiv umschalten für alle',
        'Link %s to selected %s' => '%s zu %s (markiert) verknüpfen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTicketAttributeRelations.tt
        'Import CSV or Excel file' => 'CSV- oder Excel-Datei importieren',
        'Ticket attribute relations' => 'Abhängige Ticketattribute',
        'Add ticket attribute relations' => 'Abhängige Ticketattribute hinzufügen',
        'Edit ticket attribute relations' => 'Abhängige Ticketattribute bearbeiten',
        'Attribute' => 'Attribut',
        'Last update' => 'Letzte Aktualisierung',
        'Are you sure you want to delete entry \'%s\'?' => 'Sind Sie sicher, dass der Eintrag \'%s\' gelöscht werden soll?',
        'Download previously imported file' => 'Zuvor importierte Datei herunterladen',
        'The file needs to be in CSV (UTF-8) or Excel format. Both header columns need to contain the names of valid ticket attributes. The name of the uploaded file must be unique and must not be in use by another ticket attribute relations record.' =>
            'Die Datei muss CSV- (UTF-8) oder Excel-Format haben. Beide Kopfspalten müssen den Namen von gültigen Ticket-Attributen enthalten. Der Name der hochgeladenen Datei muss eindeutig sein und darf nicht bereits für einen anderen Datensatz verwendet worden sein.',
        'Add missing possible dynamic field values' => 'Fehlende mögliche Werte zu dynamischen Feldern hinzufügen',
        'Attribute values' => 'Attributwerte',
        'If a value is colored red, it is missing from the possible values list of the dynamic field configuration.' =>
            'Falls ein Wert rot ist, fehlt er in der Liste der möglichen Werte der Konfiguration des dynamischen Felds.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminType.tt
        'Add Type' => 'Typ hinzufügen',
        'Filter for Types' => 'Filter für Typen',
        'Filter for types' => 'Filter für Typen',
        'Configure Type Visibility and Defaults' => 'Typ-Sichtbarkeit und Standardeinstellungen konfigurieren',
        'Type Management' => 'Typverwaltung',
        'Edit Type' => 'Typ bearbeiten',
        'A type with this name already exists!' => 'Ein Typ mit diesem Namen existiert bereits!',
        'This type is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Dieser Typ ist in einer SysConfig-Einstellung vorhanden. Eine Bestätigung für die Aktualisierung der Einstellung auf den neuen Typ ist notwendig!',
        'This type is used in the following config settings:' => 'Dieser Typ wird in folgenden Konfigurationseinstellungen verwendet:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUser.tt
        'Edit personal preferences for this agent' => 'Persönliche Einstellungen des Agenten bearbeiten',
        'Agents will be needed to handle tickets.' => 'Agenten werden für die Verarbeitung von Tickets benötigt.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Vergessen Sie nicht, einen neuen Agenten zu Gruppen und/oder Rollen hinzuzufügen!',
        'Agent Management' => 'Agentenverwaltung',
        'Edit Agent' => 'Agent bearbeiten',
        'Please enter a search term to look for agents.' => 'Bitte geben Sie einen Suchbegriff ein, um nach Agenten zu suchen.',
        'Last login' => 'Letzte Anmeldung',
        'Switch to agent' => 'Zu Agent wechseln',
        'Title or salutation' => 'Titel oder Anrede',
        'Firstname' => 'Vorname',
        'Lastname' => 'Nachname',
        'A user with this username already exists!' => 'Es existiert bereits ein Nutzer mit diesem Benutzernamen!',
        'Will be auto-generated if left empty.' => 'Wird für ein leeres Feld automatisch generiert.',
        'Mobile' => 'Mobiltelefon',
        'Effective Permissions for Agent' => 'Effektive Berechtigungen für Agent',
        'This agent has no group permissions.' => 'Dieser Agent besitzt keine Gruppenberechtigungen.',
        'Table above shows effective group permissions for the agent. The matrix takes into account all inherited permissions (e.g. via roles).' =>
            'Die obige Tabelle zeigt die effektiven Gruppenberechtigungen für den Agenten. Die Matrix berücksichtigt dabei auch alle vererbten Berechtigungen (z.B. durch Rollen).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUserGroup.tt
        'Manage Agent-Group Relations' => 'Zuordnungen von Agent und Gruppe verwalten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentAgendaOverview.tt
        'Agenda Overview' => 'Agendaübersicht',
        'Manage Calendars' => 'Kalender verwalten',
        'Add Appointment' => 'Termin hinzufügen',
        'Today' => 'Heute',
        'All-day' => 'Ganztägig',
        'Repeat' => 'Wiederholung',
        'Notification' => 'Benachrichtigung',
        'Yes' => 'Ja',
        'No' => 'Nein',
        'No calendars found. Please add a calendar first by using Manage Calendars page.' =>
            'Keine Kalender gefunden. Bitte legen Sie zuerst einen Kalender über die Kalenderverwaltung an.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentCalendarOverview.tt
        'Add new Appointment' => 'Einen neuen Termin hinzufügen',
        'Appointments' => 'Termine',
        'Calendars' => 'Kalender',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentEdit.tt
        'Basic information' => 'Grundlegende Informationen',
        'Date/Time' => 'Datum/Zeit',
        'Invalid date!' => 'Ungültige Zeitangabe!',
        'Please set this to value before End date.' => 'Bitte setzen Sie einen Wert vor dem Enddatum.',
        'Please set this to value after Start date.' => 'Bitte setzen Sie einen Wert nach dem Startdatum.',
        'This an occurrence of a repeating appointment.' => 'Dies ist ein Vorkommnis eines sich wiederholenden Termins.',
        'Click here to see the parent appointment.' => 'Klicken Sie hier, um den Eltern-Termin anzuzeigen.',
        'Click here to edit the parent appointment.' => 'Klicken Sie hier, um den Eltern-Termin zu bearbeiten.',
        'Frequency' => 'Frequenz',
        'Every' => 'Alle',
        'day(s)' => 'Tag(e)',
        'week(s)' => 'Woche(n)',
        'month(s)' => 'Monat(e)',
        'year(s)' => 'Jahr(e)',
        'On' => 'An',
        'Monday' => 'Montag',
        'Mon' => 'Mo',
        'Tuesday' => 'Dienstag',
        'Tue' => 'Di',
        'Wednesday' => 'Mittwoch',
        'Wed' => 'Mi',
        'Thursday' => 'Donnerstag',
        'Thu' => 'Do',
        'Friday' => 'Freitag',
        'Fri' => 'Fr',
        'Saturday' => 'Samstag',
        'Sat' => 'Sa',
        'Sunday' => 'Sonntag',
        'Sun' => 'So',
        'January' => 'Januar',
        'Jan' => 'Jan',
        'February' => 'Februar',
        'Feb' => 'Feb',
        'March' => 'März',
        'Mar' => 'Mär',
        'April' => 'April',
        'Apr' => 'Apr',
        'May_long' => 'Mai',
        'May' => 'Mai',
        'June' => 'Juni',
        'Jun' => 'Jun',
        'July' => 'Juli',
        'Jul' => 'Jul',
        'August' => 'August',
        'Aug' => 'Aug',
        'September' => 'September',
        'Sep' => 'Sep',
        'October' => 'Oktober',
        'Oct' => 'Okt',
        'November' => 'November',
        'Nov' => 'Nov',
        'December' => 'Dezember',
        'Dec' => 'Dez',
        'Relative point of time' => 'Relativer Zeitpunkt',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenter.tt
        'Customer Information Center' => 'Kunden-Informationszentrum',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenterSearch.tt
        'Customer User' => 'Kundenbenutzer',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerTableView.tt
        'Note: Customer is invalid!' => 'Hinweis: Kunde ist ungültig!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBook.tt
        'Customer User Address Book' => 'Kundenbenutzer-Adressbuch',
        'Search for recipients and add the results as \'%s\'.' => 'Suchen Sie nach Empfängern und fügen Sie die Ergebnisse als \'%s\' hinzu.',
        'Search template' => 'Suchvorlage',
        'Create Template' => 'Vorlage anlegen',
        'Create New' => 'Neue anlegen',
        'Save changes in template' => 'Änderungen in der Vorlage speichern',
        'Filters in use' => 'Verwendete Filter',
        'Additional filters' => 'Zusätzliche Filter',
        'Add another attribute' => 'Ein weiteres Attribut hinzufügen',
        'The attributes with the identifier \'(Customer)\' are from the customer company.' =>
            'Die Attribute mit der Bezeichnung \'(Kunde)\' gehören zum Kunden-Unternehmen.',
        '(e. g. Term* or *Term*)' => '(z. B. Begriff* oder *Begriff*)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverview.tt
        'The customer user is already selected in the ticket mask.' => 'Der Kunde wurde bereits in der Ticketmaske ausgewählt.',
        'Select this customer user' => 'Diesen Kundenbenutzer wählen',
        'Add selected customer user to' => 'Ausgewählten Kundenbenutzer hinzufügen zu',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverviewNavBar.tt
        'Change search options' => 'Suchoptionen ändern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserInformationCenter.tt
        'Customer User Information Center' => 'Kundenbenutzer-Informationszentrum',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDaemonInfo.tt
        'The Znuny Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Der Znuny Daemon ist ein Daemon-Prozess, welcher asynchrone Aufgaben übernimmt, z.B. das Auslösen von Ticket-Eskalationen oder das Versenden von E-Mails.',
        'A running Znuny Daemon is mandatory for correct system operation.' =>
            'Ein laufender Znuny Daemon ist für die korrekte Funktion des Systems erforderlich.',
        'Starting the Znuny Daemon' => 'Den Znuny Daemon starten',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the Znuny Daemon is running and start it if needed.' =>
            'Stellen Sie sicher, dass die Datei \'%s\' existiert (ohne die Endung .dist). Dieser Cronjob wird alle 5 Minuten prüfen, ob der Znuny Daemon läuft, und ihn ggf. starten.',
        'Execute \'%s start\' to make sure the cron jobs of the \'znuny\' user are active.' =>
            'Führen Sie \'%s start\' aus um sicherzustellen, dass die Cronjobs des \'znuny\'-Nutzers aktiv sind.',
        'After 5 minutes, check that the Znuny Daemon is running in the system (\'bin/znuny.Daemon.pl status\').' =>
            'Prüfen Sie nach 5 Minuten, ob der Znuny Daemon läuft (\'bin/znuny.Daemon.pl status\').',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboard.tt
        'Dashboard' => 'Übersicht',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardAppointmentCalendar.tt
        'New Appointment' => 'Neuer Termin',
        'Tomorrow' => 'Morgen',
        'Soon' => 'Demnächst',
        '5 days' => '5 Tage',
        'Start' => 'Start',
        'none' => 'keine',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCalendarOverview.tt
        'in' => 'in',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCommon.tt
        'Search inactive widgets' => 'Suche deaktivierte Widgets',
        'Active Widgets' => 'Aktivierte Widget',
        'Save changes' => 'Änderungen speichern',
        'Close this widget' => 'Widget schließen',
        'Hide' => 'Ausblenden',
        'more' => 'mehr',
        'No Data Available.' => 'Keine Daten verfügbar.',
        'Available Columns' => 'Verfügbare Spalten',
        'Visible Columns (order by drag & drop)' => 'Angezeigte Spalten (Anordnung ändern durch Ziehen)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDList.tt
        'Change Customer Relations' => 'Zuordnungen für Kunden ändern',
        'Open' => 'Offen',
        'Closed' => 'Geschlossen',
        'Phone ticket' => 'Telefon-Ticket',
        'Email ticket' => 'E-Mail-Ticket',
        '%s open ticket(s) of %s' => '%s offene Tickets von %s',
        '%s closed ticket(s) of %s' => '%s geschlossene Tickets von %s',
        'New phone ticket from %s' => 'Neues Telefon-Ticket von %s',
        'New email ticket to %s' => 'Neues E-Mail-Ticket an %s',
        'Edit customer ID' => 'Kundennummer bearbeiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDStatus.tt
        'Escalated tickets' => 'Eskalierte Tickets',
        'Open tickets' => 'Offene Tickets',
        'Closed tickets' => 'Geschlossene Tickets',
        'All tickets' => 'Alle Tickets',
        'Archived tickets' => 'Archivierte Tickets',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserInformation.tt
        'Note: Customer User is invalid!' => 'Hinweis: Kundenbenutzer ist ungültig!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserList.tt
        'Customer user information' => 'Kundenbenutzer-Information',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardMyLastChangedTickets.tt
        'No tickets found.' => 'Keine Tickets gefunden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardRSSOverview.tt
        'Posted %s ago.' => 'Veröffentlicht vor %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardStats.tt
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Die Konfiguration für dieses Statistik-Widget enthält Fehler, bitte prüfen Sie ihre Einstellungen.',
        'Download as SVG file' => 'Als SVG-Datei herunterladen',
        'Download as PNG file' => 'Als PNG-Datei herunterladen',
        'Download as CSV file' => 'Als CSV-Datei herunterladen',
        'Download as Excel file' => 'Als Excel-Datei herunterladen',
        'Download as PDF file' => 'Als PDF-Datei herunterladen',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Bitte wählen Sie eine gültiges Ausgabeformat in der Konfiguration dieses Widgets aus.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Der Inhalt dieser Statistik wird vorbereitet. Bitte haben Sie etwas Geduld.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Diese Statistik kann momentan nicht verwendet werden, weil ihre Konfiguration vom Statistik-Administrator korrigiert werden muss.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketGeneric.tt
        'Show' => 'Anzeigen',
        'Assigned to customer user' => 'Zugewiesen zu Kundenbenutzer',
        'Accessible for customer user' => 'Zugreifbar für Kundenbenutzer',
        'My locked tickets' => 'Meine gesperrten Tickets',
        'My owned tickets' => 'Meine eigenen Tickets',
        'My watched tickets' => 'Meine beobachteten Tickets',
        'My responsibilities' => 'Meine Verantwortlichkeiten',
        'Tickets in My Queues' => 'Tickets in "Meine Queues"',
        'Tickets in My Services' => 'Tickets in "Meinen Services"',
        'Service Time' => 'Service-Zeit',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketQueueOverview.tt
        'Total' => 'Summe',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOnline.tt
        'out of office' => 'abwesend',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOutOfOffice.tt
        'until' => 'bis',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentInfo.tt
        'To accept some news, a license or some changes.' => 'Neuigkeiten, eine Lizenz oder Änderungen bestätigen.',
        'Yes, accepted.' => 'Ja, akzeptiert.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentLinkObject.tt
        'Manage links for %s' => 'Verknüpfungen für %s verwalten',
        'Close and Back' => 'Schließen und zurück',
        'Create new links' => 'Neue Verknüpfungen erstellen',
        'Manage existing links' => 'Vorhandene Verknüpfungen verwalten',
        'Link with' => 'Verknüpfen mit',
        'Start search' => 'Suche starten',
        'There are currently no links. Please click \'Create new Links\' on the top to link this item to other objects.' =>
            'Derzeit existieren keine Verknüpfungen. Klicken Sie auf "Neue Verknüpfungen erstellen", um das aktuelle Objekt mit anderen Objekten zu verknüpfen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferences.tt
        'Preferences' => 'Einstellungen',
        'Please note: you\'re currently editing the preferences of %s.' =>
            'Bitte beachten: Sie bearbeiten derzeit die Einstellungen von %s.',
        'Go back to editing this agent' => 'Zurück zur Bearbeitung des Agenten',
        'Set up your personal preferences. Save each setting by clicking the checkmark on the right.' =>
            'Legen Sie Ihre persönlichen Einstellungen fest. Speichern Sie Einstellungen, indem Sie das Haken-Symbol auf der rechten Seite anklicken.',
        'You can use the navigation tree below to only show settings from certain groups.' =>
            'Sie können den Navigationsbaum verwenden, um nur Einstellungen aus bestimmten Kategorien anzuzeigen.',
        'Dynamic Actions' => 'Dynamische Aktionen',
        'Filter settings...' => 'Einstellungen filtern...',
        'Filter for settings' => 'Filter für Einstellungen',
        'Save all settings' => 'Alle speichern',
        'Edit your preferences' => 'Persönliche Einstellungen bearbeiten',
        'Personal Preferences' => 'Persönliche Einstellungen',
        'Avatars have been disabled by the system administrator. You\'ll see your initials instead.' =>
            'Avatare wurden vom Systemadministrator deaktiviert. Sie sehen stattdessen Ihre Initialen.',
        'You can change your avatar image by registering with your email address %s at %s. Please note that it can take some time until your new avatar becomes available because of caching.' =>
            'Sie können Ihr Avatar-Bild ändern, indem Sie sich mit Ihrer E-Mail-Adresse %s unter %s registrieren. Bitte beachten Sie, dass es einige Zeit dauern kann, bis Änderungen sichtbar werden.',
        'Off' => 'Aus',
        'End' => 'Ende',
        'Left' => 'Links',
        'The horizontal distance of the window relative to the screen, in pixels.' =>
            'Der horizontale Abstand des Fensters relativ zum Bildschirm in Pixeln',
        'Top' => 'Oben',
        'The vertical distance of the window relative to the screen, in pixels.' =>
            'Der vertikale Abstand des Fensters relativ zum Bildschirm in Pixeln',
        'Width' => 'Breite',
        'Width in pixels or percent.' => 'Breite in Pixeln oder Prozent',
        'Height' => 'Höhe',
        'Height in pixels or percent.' => 'Höhe in Pixeln oder Prozent',
        'This setting can currently not be saved.' => 'Diese Einstellung kann derzeit nicht gespeichert werden.',
        'This setting can currently not be saved' => 'Diese Einstellung kann derzeit nicht gespeichert werden',
        'Save setting' => 'Einstellung speichern',
        'Save this setting' => 'Einstellung speichern',
        'Did you know? You can help translating Znuny at %s.' => 'Haben Sie gewusst, dass Sie bei der Übersetzung von Znuny unter %s helfen können?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferencesOverview.tt
        'Choose from the groups on the left to find the settings you\'d wish to change.' =>
            '',
        'Did you know?' => 'Wussten Sie schon?',
        'You can change your avatar by registering with your email address %s on %s' =>
            'Sie können Ihren Avatar ändern, indem Sie sich mit Ihrer E-Mail-Adresse %s unter %s registrieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentSplitSelection.tt
        'Target' => 'Ziel',
        'Process' => 'Prozess',
        'Split' => 'Teilen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsAdd.tt
        'Statistics Management' => 'Statistikverwaltung',
        'Add Statistics' => 'Statistik hinzufügen',
        'Dynamic Matrix' => 'Dynamische Matrix',
        'Each cell contains a singular data point.' => 'Jede Zelle enthält einen einzelnen Datenpunkt.',
        'Dynamic List' => 'Dynamische Liste',
        'Each row contains data of one entity.' => 'Jede Zeile enthält Daten eines Objekts.',
        'Static' => 'Statisch',
        'Non-configurable complex statistics.' => 'Nicht konfigurierbare, komplexe Statistiken.',
        'General Specification' => 'Allgemeine Angabe',
        'Create Statistic' => 'Statistik erstellen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsEdit.tt
        'Run now' => 'Jetzt ausführen',
        'Edit Statistics' => 'Statistiken bearbeiten',
        'Statistics Preview' => 'Statistikvorschau',
        'Save Statistic' => 'Statistik speichern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsImport.tt
        'Import Statistics' => 'Statistiken importieren',
        'Import Statistics Configuration' => 'Statistikkonfiguration importieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsOverview.tt
        'Statistics' => 'Statistiken',
        'Edit statistic "%s".' => 'Statistik "%s" bearbeiten.',
        'Export statistic "%s"' => 'Statistik "%s" exportieren',
        'Export statistic %s' => 'Statistik %s exportieren',
        'Delete statistic %s' => 'Statistik %s löschen',
        'Do you really want to delete this statistic?' => 'Möchten Sie diese Statistik wirklich löschen?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsView.tt
        'Statistics Information' => 'Statistik-Informationen',
        'Created by' => 'Erstellt von',
        'Changed by' => 'Geändert von',
        'Sum rows' => 'Zeilensummierung',
        'Sum columns' => 'Spaltensummierung',
        'Show as dashboard widget' => 'Als Dashboard-Widget anzeigen',
        'Cache' => 'Cache',
        'Statistics Overview' => 'Statistikübersicht',
        'View Statistics' => 'Statistiken anzeigen',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Diese Statistik enthält Konfigurationsfehler und kann momentan nicht verwendet werden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketActionCommon.tt
        'Change Free Text of %s%s%s' => 'Den Freitext von %s%s%s ändern',
        'Change Owner of %s%s%s' => 'Besitzer von %s%s%s wechseln',
        'Close %s%s%s' => '%s%s%s schließen',
        'Add Note to %s%s%s' => 'Notiz zu %s%s%s hinzufügen',
        'Set Pending Time for %s%s%s' => 'Wartezeit setzen für %s%s%s',
        'Change Priority of %s%s%s' => 'Priorität von %s%s%s ändern',
        'Change Responsible of %s%s%s' => 'Verantwortlichen von %s%s%s ändern',
        'The ticket has been locked' => 'Das Ticket wurde gesperrt',
        'Ticket Settings' => 'Ticket-Einstellungen',
        'Service invalid.' => 'Ungültiger Service.',
        'SLA invalid.' => 'SLA ungültig.',
        'Team Data' => 'Teamdaten',
        'Queue invalid.' => 'Queue ungültig.',
        'New Owner' => 'Neuer Besitzer',
        'Please set a new owner!' => 'Bitte legen Sie einen neuen Besitzer fest!',
        'Owner invalid.' => 'Besitzer ungültig.',
        'New Responsible' => 'Neuer Verantwortlicher',
        'Please set a new responsible!' => 'Bitte legen Sie einen neuen Verantwortlichen fest!',
        'Responsible invalid.' => 'Verantwortlicher ungültig.',
        'Ticket Data' => 'Ticketdaten',
        'Next state' => 'Nächster Status',
        'State invalid.' => 'Status ungültig.',
        'For all pending* states.' => 'Für alle warten* Status.',
        'Dynamic Info' => 'Dynamische Felder',
        'Add Article' => 'Artikel hinzufügen',
        'Inform' => 'Informiere',
        'Inform agents' => 'Agenten informieren',
        'Inform involved agents' => 'Involvierte Agenten informieren',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Hier können Sie zusätzliche Agenten auswählen, die eine Benachrichtigung über den neuen Artikel enthalten sollen.',
        'Text will also be received by' => 'Text wird auch gesendet an',
        'Communications' => 'Kommunikation',
        'Create an Article' => 'Artikel erstellen',
        'Setting a template will overwrite any text or attachment.' => 'Die Auswahl einer Vorlage wird bereits bestehenden Text oder Anhänge löschen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBounce.tt
        'Bounce %s%s%s' => '%s%s%s umleiten',
        'cancel' => 'abbrechen',
        'Bounce to' => 'Umleiten an',
        'You need a email address.' => 'Sie benötigen eine E-Mail-Adresse.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Benötige eine gültige E-Mail-Adresse, verwenden Sie keine lokale Adresse.',
        'Next ticket state' => 'Nächster Status des Tickets',
        'Inform sender' => 'Sender informieren',
        'Send mail' => 'E-Mail senden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBulk.tt
        'Ticket Bulk Action' => 'Ticket Sammelaktion',
        'Send Email' => 'E-Mail versenden',
        'Merge' => 'Zusammenfassen',
        'Merge to' => 'Zusammenfassen zu',
        'Invalid ticket identifier!' => 'Ungültiger Ticket-Identifizierer!',
        'Merge to oldest' => 'Zusammenfassen zu Ältestem',
        'Link together' => 'Zusammen verlinken',
        'Link to parent' => 'Mit Eltern verknüpfen',
        'Unlock tickets' => 'Tickets entsperren',
        'Watch tickets' => 'Tickets beobachten',
        'Mark tickets as seen' => 'Tickets als gelesen markieren',
        'Mark tickets as unseen' => 'Tickets als ungelesen markieren',
        'Execute Bulk Action' => 'Sammelaktion ausführen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCompose.tt
        'Compose Answer for %s%s%s' => 'Antwort für %s%s%s verfassen',
        'Date Invalid!' => 'Ungültiges Datum!',
        'Select one or more recipients from the customer user address book.' =>
            'Wählen Sie einen oder mehrere Empfänger aus dem Kundenbenutzer-Adressbuch.',
        'Customer user address book' => 'Kundenbenutzer-Adressbuch',
        'This address is registered as system address and cannot be used: %s' =>
            'Diese Adresse ist als Systemadresse registriert und kann daher nicht verwendet werden: %s',
        'Please include at least one recipient' => 'Bitte geben sie mindestens einen Empfänger an',
        'Remove Ticket Customer' => 'Ticket-Kunden entfernen',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Bitte entfernen Sie diesen Eintrag und geben Sie einen mit einem gültigen Wert an.',
        'This address already exists on the address list.' => 'Dieser Eintrag existiert bereits in der Adressliste.',
        'Remove Cc' => 'Cc entfernen',
        'Bcc' => 'Bcc',
        'Remove Bcc' => 'Bcc entfernen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCustomer.tt
        'Change Customer of %s%s%s' => 'Kunde von %s%s%s ändern',
        'Customer Information' => 'Kundeninformation',
        'Customer user' => 'Kundenbenutzer',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmail.tt
        'Create New Email Ticket' => 'Neues E-Mail-Ticket erstellen',
        'Example Template' => 'Beispielvorlage',
        'To customer user' => 'An Kundenbenutzer',
        'Please include at least one customer user for the ticket.' => 'Bitte tragen Sie wenigstens einen Kundenbenutzer für das Ticket ein.',
        'Select this customer as the main customer.' => 'Diesen Kunden als Hauptkunden auswählen.',
        'Remove Ticket Customer User' => 'Kundenbenutzer des Tickets entfernen',
        'From queue' => 'Aus Queue',
        'Get all' => 'Alles holen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailOutbound.tt
        'Outbound Email for %s%s%s' => 'Ausgehende E-Mail für %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailResend.tt
        'Resend Email for %s%s%s' => 'E-Mail erneut versenden für %s%s%s',
        'All fields marked with an asterisk (*) are mandatory.' => 'Alle mit * gekennzeichneten Felder sind Pflichtfelder.',
        'Cancel & close' => 'Abbrechen und Schließen',
        'Undo & close' => 'Rückgängig machen und Beenden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEscalation.tt
        'Ticket %s: first response time is over (%s/%s)!' => 'Ticket %s: erste Reaktionszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Ticket %s: erste Reaktionszeit wird ablaufen in %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Ticket %s: Aktualisierungszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Ticket %s: Aktualisierungszeit wird ablaufen in %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Ticket %s: Lösungszeit ist abgelaufen (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Ticket %s: Lösungszeit wird ablaufen in %s/%s!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketForward.tt
        'Forward %s%s%s' => '%s%s%s weiterleiten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketHistory.tt
        'History of %s%s%s' => 'Verlauf von %s%s%s',
        'Start typing to filter...' => 'Tippen zum filtern...',
        'Filter for history items' => 'Filter für Historieneinträge',
        'Expand/Collapse all' => 'Alle einblenden/ausblenden',
        'CreateTime' => 'Erstellzeit',
        'Article' => 'Artikel',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMerge.tt
        'Merge %s%s%s' => '%s%s%s zusammenführen',
        'Merge Settings' => 'Einstellungen für Zusammenführung',
        'Try typing part of the ticket number or title in order to search by it.' =>
            'Geben Sie einen Teil der Ticketnummer oder des Titels ein, um danach zu suchen.',
        'You need to use a ticket number!' => 'Bitte eine Ticketnummer benutzen!',
        'A valid ticket number is required.' => 'Eine gültige Ticketnummer ist erforderlich.',
        'Limit the search to tickets with same Customer ID (%s).' => 'Suche auf Tickets beschränken, die derselben Kundennummer (%s) zugewiesen sind.',
        'Inform Sender' => 'Sender informieren',
        'Need a valid email address.' => 'Gültige E-Mail-Adresse benötigt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMove.tt
        'Move %s%s%s' => '%s%s%s verschieben',
        'New Queue' => 'Neue Queue',
        'Communication' => 'Kommunikation',
        'Move' => 'Verschieben',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketNoteToLinkedTicket.tt
        'Add note to linked %s%s%s' => 'Notiz zu verlinktem %s%s%s hinzufügen',
        'Notes' => 'Notizen',
        'Note to linked Ticket' => 'Notiz zu verlinktem Ticket',
        'LinkList invalid.' => 'LinkList ungültig.',
        'Note to origin Ticket' => 'Notiz zu Ursprungsticket',
        'NoteToTicket invalid.' => 'Notiz ungültig.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewMedium.tt
        'No ticket data found.' => 'Keine Ticket-Daten gefunden.',
        'Open / Close ticket action menu' => 'Öffne / Schließe Ticket Aktionsmenü',
        'Select this ticket' => 'Dieses Ticket auswählen',
        'Sender' => 'Sender',
        'Customer User Name' => 'Kundenbenutzer-Name',
        'Impact' => 'Auswirkung',
        'Update Time' => 'Aktualisierungszeit',
        'Solution Time' => 'Lösungszeit',
        'First Response Time' => 'Reaktionszeit',
        'Move ticket to a different queue' => 'Ticket in eine andere Queue verschieben',
        'Change queue' => 'Queue wechseln',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewNavBar.tt
        'Remove active filters for this screen.' => 'Aktive Filter für diesen Bildschirm entfernen.',
        'Clear all filters' => 'Alle Filter zurücksetzen',
        'Remove mention' => 'Erwähnung entfernen',
        'Remove from list of watched tickets' => 'Von der Liste der beobachteten Tickets entfernen',
        'Tickets per page' => 'Tickets pro Seite',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewPreview.tt
        'Missing channel' => 'Fehlender Kanal',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewSmall.tt
        'Reset overview' => 'Übersicht zurücksetzen',
        'Column Filters Form' => 'Spaltenfilter-Formular',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhone.tt
        'Split Into New Phone Ticket' => 'In ein neues Telefon-Ticket splitten',
        'Create New Phone Ticket' => 'Neues Telefon-Ticket erstellen',
        'Please include at least one customer for the ticket.' => 'Bitte geben Sie mindestens einen Kunden für das Ticket an.',
        'To queue' => 'An Queue',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhoneCommon.tt
        'Phone Call for %s%s%s' => 'Anruf für %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPlain.tt
        'View Email Plain Text for %s%s%s' => 'E-Mail-Klartext für %s%s%s ansehen',
        'Plain' => 'Unformatiert',
        'Download this email' => 'Diese E-Mail herunterladen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcess.tt
        'Create New Process Ticket' => 'Neues Prozess-Ticket',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcessSmall.tt
        'Enroll Ticket into a Process' => 'Ticket in einen Prozess überführen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketSearch.tt
        'Profile link' => 'Profil-Link',
        'Output' => 'Ausgabe',
        'Fulltext' => 'Volltext',
        'Customer ID (complex search)' => 'Kundennummer (komplexe Suche)',
        '(e. g. 234*)' => '(z. B. 234*)',
        'Customer ID (exact match)' => 'Kundennummer (exakte Suche)',
        'Assigned to Customer User Login (complex search)' => 'Zugewiesen an Kundenbenutzer-Login (komplexe Suche)',
        '(e. g. U51*)' => '(z. B. U51*)',
        'Assigned to Customer User Login (exact match)' => 'Zugewiesen an Kundenbenutzer-Loginname (exakte Treffer)',
        'Accessible to Customer User Login (exact match)' => 'Zugreifbar für Kundenbenutzer-Loginname (exakte Treffer)',
        'Created in Queue' => 'Erstellt in Queue',
        'Lock state' => 'Status Sperre',
        'Watcher' => 'Beobachter',
        'Article Create Time (before/after)' => 'Artikel-Erstellzeit (vor/nach)',
        'Article Create Time (between)' => 'Artikel-Erstellzeit (zwischen)',
        'Please set this to value before end date.' => 'Bitte wählen Sie einen Wert, der vor dem Enddatum liegt.',
        'Please set this to value after start date.' => 'Bitte wählen Sie einen Wert, der nach dem Startdatum liegt.',
        'Ticket Create Time (before/after)' => 'Ticket-Erstellzeit (vor/nach)',
        'Ticket Create Time (between)' => 'Ticket-Erstellzeit (zwischen)',
        'Ticket Change Time (before/after)' => 'Ticket-Änderungszeit (vor/nach)',
        'Ticket Change Time (between)' => 'Ticket-Änderungszeit (zwischen)',
        'Ticket Last Change Time (before/after)' => 'Letzte Ticket-Änderungszeit (vor/nach)',
        'Ticket Last Change Time (between)' => 'Letzte Ticket-Änderungszeit (zwischen)',
        'Ticket Pending Until Time (before/after)' => 'Warten bis-Zeit für Ticket (vor/nach)',
        'Ticket Pending Until Time (between)' => 'Warten bis-Zeit für Ticket (zwischen)',
        'Ticket Close Time (before/after)' => 'Ticket-Schließzeit (vor/nach)',
        'Ticket Close Time (between)' => 'Ticket-Schließzeit (zwischen)',
        'Ticket Escalation Time (before/after)' => 'Ticket-Eskalationszeit (vor/nach)',
        'Ticket Escalation Time (between)' => 'Ticket-Eskalationszeit (zwischen)',
        'Archive Search' => 'Archivsuche',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom.tt
        'Sender Type' => 'Absendertyp',
        'Save filter settings as default' => 'Filtereinstellungen als Standard speichern',
        'Event Type' => 'Ereignistyp',
        'Save as default' => 'Als Standard speichern',
        'Drafts' => 'Entwürfe',
        'by' => 'von',
        'Change Queue' => 'Queue ändern',
        'There are no dialogs available at this point in the process.' =>
            'Für diesen Prozess stehen derzeit keine Dialoge zur Verfügung.',
        'This item has no articles yet.' => 'Dieser Eintrag hat noch keine Artikel.',
        'Article Overview - %s Article(s)' => 'Artikelübersicht - %s Artikel',
        'Page %s' => 'Seite %s',
        'Add Filter' => 'Filter hinzufügen',
        'Set' => 'Setzen',
        'Reset Filter' => 'Filter zurücksetzen',
        'No.' => 'Nr.',
        'Unread articles' => 'Ungelesene Artikel',
        'Via' => 'Via',
        'Important' => 'Wichtig',
        'Unread Article!' => 'Ungelesene Artikel!',
        'Incoming message' => 'Eingehende Nachricht',
        'Outgoing message' => 'Ausgehende Nachricht',
        'Internal message' => 'Interne Nachricht',
        'Sending of this message has failed.' => 'Senden der Nachricht fehlgeschlagen.',
        'Resize' => 'Größe anpassen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/Chat.tt
        '#%s' => '#%s',
        'via %s' => 'via %s',
        'by %s' => 'von %s',
        'Toggle article details' => 'Artikeldetails ein-/ausblenden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/MIMEBase.tt
        'This message is being processed. Already tried to send %s time(s). Next try will be %s.' =>
            'Diese Nachricht wird gerade verarbeitet. Das Versenden wurde bereits %s mal probiert. Nächster Versuch um %s.',
        'This message contains events' => 'Diese Nachricht enthält Events.',
        'This message contains an event' => 'Diese Nachricht enthält ein Event.',
        'Show more information' => 'Mehr Informationen anzeigen',
        'Start: %s, End: %s' => 'Start: %s, Ende: %s',
        'Calendar events details' => 'Kalender-Events-Details',
        'Calendar event details' => 'Kalender-Event-Details',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Um die Links im folgenden Artikel zu öffnen, kann es notwendig sein Strg oder Shift zu drücken, während auf den Link geklickt wird (abhängig vom verwendeten Browser und Betriebssystem).',
        'Close this message' => 'Diese Nachricht schließen',
        'Image' => 'Bild',
        'PDF' => 'PDF',
        'View' => 'Ansehen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/LinkTable.tt
        'Linked Objects' => 'Verknüpfte Objekte',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/MentionsTable.tt
        'Mentions' => 'Erwähnungen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/TicketInformation.tt
        'Archive' => 'Archiv',
        'This ticket is archived.' => 'Dieses Ticket ist archiviert.',
        'is invalid' => 'ist ungültig',
        'Pending till' => 'Warten bis',
        'Locked' => 'Sperre',
        'Accounted time' => 'Erfasste Zeit',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ArticleContent/Invalid.tt
        'Preview of this article is not possible because %s channel is missing in the system.' =>
            'Vorschau des Artikels nicht möglich, da der Kanal %s nicht (mehr) im System vorhanden ist.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AttachmentBlocker.tt
        'To protect your privacy, remote content was blocked.' => 'Zum Schutz Ihrer Privatsphäre wurden entfernte Inhalte blockiert.',
        'Load blocked content.' => 'Blockierte Inhalte laden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Breadcrumb.tt
        'Home' => 'Startseite',
        'Back' => 'Zurück',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Create.tt
        'Ticket Creation' => 'Ticketerstellung',
        'Link' => 'Verknüpfen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Link.tt
        'Remove entry' => 'Eintrag entfernen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt
        'Dear Customer,' => 'Lieber Kunde,',
        'thank you for using our services.' => 'Danke, dass Sie unsere Services nutzen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerCompany/TicketCustomerIDSelection.tt
        'The customer ID is not changeable, no other customer ID can be assigned to this ticket.' =>
            'Die Kundennummer ist nicht änderbar, eine andere Kundennummer kann dem Ticket nicht zugewiesen werden.',
        'First select a customer user, then you can select a customer ID to assign to this ticket.' =>
            'Wählen Sie zunächst einen Kundenbenutzer aus. Anschließend können Sie das Ticket einer Kundennummer zuweisen.',
        'Select a customer ID to assign to this ticket.' => 'Wählen Sie die Kundenummer aus, der das Ticket zugewiesen werden soll.',
        'From all Customer IDs' => 'Aus allen Kundennummern',
        'From assigned Customer IDs' => 'Aus allen zugewiesenen Kundennummern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerError.tt
        'Error' => 'Fehler',
        'An Error Occurred' => 'Ein Fehler ist aufgetreten',
        'Traceback' => 'Rückverfolgung',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooter.tt
        'Powered by %s' => 'Powered by %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooterJS.tt
        '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '%s hat mögliche Netzwerkprobleme entdeckt. Sie können entweder versuchen die Seite manuell erneut zu laden oder Sie warten bis ihr Browser die Verbindung wiederhergestellt hat.',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'Die Verbindung wurde nach einer temporären Unterbrechung wiederhergestellt. Möglicherweise funktionieren deshalb einige Elemente der aktuellen Seite nicht (mehr) korrekt. Um alle Elemente wieder wie gewünscht nutzen zu können, sollten Sie die aktuelle Seite neu laden.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerHeader.tt
        'Edit personal preferences' => 'Persönliche Einstellungen bearbeiten',
        'Personal preferences' => 'Persönliche Einstellungen',
        'Logout' => 'Abmelden',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerLogin.tt
        'JavaScript Not Available' => 'JavaScript nicht verfügbar',
        'In order to experience this software, you\'ll need to enable JavaScript in your browser.' =>
            'Um alle Möglichkeiten dieser Software zu nutzen, müssen Sie JavaScript in Ihrem Webbrowser aktivieren.',
        'Browser Warning' => 'Browser-Warnung',
        'The browser you are using is too old.' => 'Sie verwenden leider einen (stark) veralteten Webbrowser.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.' =>
            'Diese Software funktioniert mit einer großen Auswahl an Webbrowsern, aus denen Sie wählen können. Bitte installieren Sie einen neueren Webbrowser oder aktualisieren Sie Ihren vorhandenen.',
        'Please see the documentation or ask your admin for further information.' =>
            'Bitte lesen Sie auch die Dokumentation oder fragen Sie Ihren Systemadministrator.',
        'One moment please, you are being redirected...' => 'Einen Moment bitte, Sie werden weitergeleitet...',
        'Login' => 'Anmeldung',
        'User name' => 'Benutzername',
        'Your user name' => 'Ihr Benutzername',
        'Your password' => 'Ihr Passwort',
        'Forgot password?' => 'Passwort vergessen?',
        '2 Factor Token' => '2-Faktor-Token',
        'Your 2 Factor Token' => 'Ihr 2-Faktor-Token',
        'Log In' => 'Anmelden',
        'Request New Password' => 'Neues Passwort anfordern',
        'Your User Name' => 'Ihr Benutzername',
        'A new password will be sent to your email address.' => 'Ein neues Passwort wird an Ihre E-Mail-Adresse gesendet.',
        'Back to login' => 'Zurück zur Anmeldung',
        'Create Account' => 'Konto erstellen',
        'Please fill out this form to receive login credentials.' => 'Bitte füllen Sie dieses Formular aus, um Ihre Anmeldedaten zu erhalten.',
        'How we should address you' => 'Wie sollen wir Sie ansprechen',
        'Your First Name' => 'Ihr Vorname',
        'Your Last Name' => 'Ihr Nachname',
        'Your email address (this will become your username)' => 'Ihre E-Mail-Adresse (das wird Ihr Benutzername)',
        'Not yet registered?' => 'Noch nicht registriert?',
        'Sign up now' => 'Registrieren Sie sich jetzt',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketMessage.tt
        'New Ticket' => 'Neues Ticket',
        'Service level agreement' => 'Service-Level-Vereinbarung',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketOverview.tt
        'Welcome!' => 'Willkommen!',
        'Please click the button below to create your first ticket.' => 'Bitte verwenden Sie den Knopf unten zur Erstellung Ihres ersten Tickets.',
        'Create your first ticket' => 'Ihr erstes Ticket erstellen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketProcess.tt
        'New Process Ticket' => 'Neues Prozess-Ticket',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearch.tt
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => 'z. B. 10*5155 oder 105658*',
        'CustomerID' => 'Kundennummer',
        'Types' => 'Typen',
        'Limitation' => 'Limitierung',
        'No time settings' => 'Keine Zeiteinstellungen',
        'All' => 'Alle',
        'Specific date' => 'spezifisches Datum',
        'Only tickets created' => 'Nur Tickets, die erstellt wurden',
        'Date range' => 'Datumsbereich',
        'Only tickets created between' => 'Nur Tickets, die erstellt wurden zwischen',
        'Ticket Archive System' => 'Ticket-Archivsystem',
        'Save Search as Template?' => 'Suche als Vorlage speichern?',
        'Save as Template' => 'Als Vorlage speichern',
        'Save as Template?' => 'Als Vorlage speichern?',
        'Template Name' => 'Name der Vorlage',
        'Pick a profile name' => 'Profilnamen auswählen',
        'Output to' => 'Ausgabe nach',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearchResultShort.tt
        'Remove this Search Term.' => 'Diesen Suchbegriff entfernen.',
        'of' => 'von',
        'Page' => 'Seite',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom.tt
        'Ticket Details' => 'Ticketdetails',
        'Next Steps' => 'Nächste Schritte',
        'Reply' => 'Antworten',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom/ArticleRender/Chat.tt
        'Expand article' => 'Artikel aufklappen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerWarning.tt
        'Warning' => 'Warnung',

        # TT Template: Kernel/Output/HTML/Templates/Standard/DashboardEventsTicketCalendar.tt
        'Event Information' => 'Ereignisinformation',
        'Ticket fields' => 'Ticket-Felder',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Error.tt
        'Error Details' => 'Fehlerdetails',
        'Expand' => 'Ausklappen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/AttachmentList.tt
        'Click to delete this attachment.' => 'Klicken Sie, um diesen Anhang zu löschen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftButtons.tt
        'Update draft' => 'Entwurf aktualisieren',
        'Save as new draft' => 'Als neuen Entwurf speichern',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftNotifications.tt
        'You have loaded the draft "%s".' => 'Sie haben den Entwurf "%s" geladen.',
        'You have loaded the draft "%s". You last changed it %s.' => 'Sie haben den Entwurf "%s" geladen, den Sie zuletzt %s geändert haben.',
        'You have loaded the draft "%s". It was last changed %s by %s.' =>
            'Sie haben den Entwurf "%s" geladen, der zuletzt %s von %s geändert wurde.',
        'Please note that you have already one or more saved drafts for this action.' =>
            'Bitte beachten Sie, dass Sie für diese Aktion bereits einen oder mehrere Entwürfe gespeichert haben.',
        'Please note that this draft is outdated because the ticket was modified since this draft was created.' =>
            'Bitte beachten Sie, dass dieser Entwurf aufgrund zwischenzeitlicher Änderungen am Ticket möglicherweise veraltet ist.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Header.tt
        'Last viewed' => 'Zuletzt gesehen',
        'You are logged in as' => 'Sie sind angemeldet als',
        'Delete all activities' => 'Alle Aktivitäten löschen',
        'Delete all' => 'Alle löschen',
        'Mark all activities as seen' => 'Alle Aktivitäten als gelesen markieren',
        'Seen all' => 'Alle gesehen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/HeaderToolbar.tt
        'Overviews' => 'Ansichten',
        'Personal views' => 'Persönliche Ansichten',
        'Last Views' => 'Zuletzt gesehen',
        'Search tools' => 'Suche',
        'SearchTemplate' => 'Suchvorlage',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Installer.tt
        'JavaScript not available' => 'JavaScript nicht verfügbar',
        'License' => 'Lizenz',
        'Database Settings' => 'Datenbankeinstellungen',
        'General Specifications and Mail Settings' => 'Allgemeine Einstellungen und E-Mail-Einstellungen',
        'Finish' => 'Abschließen',
        'Welcome to %s' => 'Willkommen bei %s',
        'Address' => 'Adresse',
        'Phone' => 'Telefon',
        'Web site' => 'Website',
        'Community' => 'Community',
        'Next' => 'Weiter',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerConfigureMail.tt
        'Configure Outbound Mail' => 'Mailversand konfigurieren',
        'Outbound mail type' => 'Typ der ausgehenden E-Mail',
        'Select outbound mail type.' => 'Typ der ausgehenden E-Mail auswählen.',
        'Outbound mail port' => 'Port der ausgehenden E-Mail',
        'Select outbound mail port.' => 'Port der ausgehenden E-Mail auswählen.',
        'SMTP host' => 'SMTP-Host',
        'SMTP host.' => 'SMTP-Host.',
        'SMTP authentication' => 'SMPT-Authentifizierung',
        'Does your SMTP host need authentication?' => 'Benötigt der SMTP-Host eine Authentifizierung?',
        'SMTP auth user' => 'Benutzer für SMTP-Authentifizierung',
        'Username for SMTP auth.' => 'Benutzername für SMTP-Authentifizierung.',
        'SMTP auth password' => 'Passwort für SMTP-Authentifizierung',
        'Password for SMTP auth.' => 'Passwort für SMTP-Authentifizierung.',
        'Configure Inbound Mail' => 'Mailempfang konfigurieren',
        'Inbound mail type' => 'Typ der eingehenden E-Mail',
        'Select inbound mail type.' => 'Typ der eingehenden E-Mail auswählen.',
        'Inbound mail host' => 'Host der eingehenden E-Mail',
        'Inbound mail host.' => 'Host der eingehenden E-Mail.',
        'Inbound mail user' => 'Benutzer der eingehenden E-Mail',
        'User for inbound mail.' => 'Benutzername der eingehenden E-Mail.',
        'Inbound mail password' => 'Passwort der eingehenden E-Mail',
        'Password for inbound mail.' => 'Passwort der eingehenden E-Mail.',
        'Result of mail configuration check' => 'Ergebnis der E-Mail-Konfigurationsprüfung',
        'Check mail configuration' => 'E-Mail-Konfiguration prüfen',
        'or' => 'oder',
        'Skip this step' => 'Diesen Schritt überspringen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBResult.tt
        'Done' => 'Fertig',
        'Database setup successful!' => 'Datenbank erfolgreich erstellt!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBStart.tt
        'Install Type' => 'Installationstyp',
        'Create a new database for Znuny' => 'Neue Datenbank für Znuny erstellen',
        'Use an existing database for Znuny' => 'Bestehende Datenbank für Znuny nutzen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmssql.tt
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Sollte ein Root-Passwort für die Datenbank gesetzt sein, muss dieses hier angegeben werden. Anderenfalls muss dieses Feld leer bleiben.',
        'Database name' => 'Datenbankname',
        'Check database settings' => 'Datenbankeinstellungen prüfen',
        'Result of database check' => 'Ergebnis der Datenbankprüfung',
        'Database check successful.' => 'Datenbankprüfung erfolgreich.',
        'Database User' => 'Datenbankbenutzer',
        'New' => 'Neu',
        'A new database user with limited permissions will be created for this Znuny system.' =>
            'Ein neuer Datenbank-Benutzer mit beschränkten Rechten wird für dieses Znuny-System erstellt.',
        'Repeat Password' => 'Passwort wiederholen',
        'Generated password' => 'Generiertes Passwort',
        'Database' => 'Datenbank',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmysql.tt
        'Passwords do not match' => 'Passworte stimmen nicht überein',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBoracle.tt
        'SID' => 'SID',
        'Port' => 'Port',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerFinish.tt
        'To be able to use Znuny you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Um Znuny nutzen zu können, müssen die die folgenden Zeilen als root in die Befehlszeile (Terminal/Shell) eingeben.',
        'Restart your webserver' => 'Starten Sie ihren Webserver neu',
        'After doing so your Znuny is up and running.' => 'Danach ist Znuny startklar.',
        'Start page' => 'Startseite',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerLicense.tt
        'Don\'t accept license' => 'Lizenz _nicht_ akzeptieren',
        'Accept license and continue' => 'Lizenz akzeptieren und fortfahren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerSystem.tt
        'SystemID' => 'SystemID',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Der System-Identifizierer. Jede Ticketnummer und jede HTTP-Sitzungs-ID enthalten diese Nummer.',
        'System FQDN' => 'System FQDN',
        'Fully qualified domain name of your system.' => 'Voll qualifizierter Domainname Ihres Systems.',
        'AdminEmail' => 'E-Mail des Administrators',
        'Email address of the system administrator.' => 'E-Mail-Adresse des Administrators.',
        'Organization' => 'Organisation',
        'Log' => 'Protokoll',
        'LogModule' => 'Protokollmodul',
        'Log backend to use.' => 'Protokoll-Backend, welches verwendet werden soll.',
        'LogFile' => 'Protokolldatei',
        'Webfrontend' => 'Web-Oberfläche',
        'Default language' => 'Standardsprache',
        'Default language.' => 'Standardsprache.',
        'CheckMXRecord' => 'MX-Records prüfen',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'E-Mail-Adressen, die vom Benutzer angegeben werden, werden gegen die MX-Einträge im DNS geprüft. Verwenden Sie diese Option nicht, wenn Ihr DNS langsam ist oder öffentliche Adressen nicht auflösen kann.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/LinkObject.tt
        'Delete link' => 'Verknüpfung löschen',
        'Delete Link' => 'Verknüpfung löschen',
        'Object#' => 'Objektnummer',
        'Add links' => 'Verknüpfungen hinzufügen',
        'Delete links' => 'Verknüpfungen löschen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Login.tt
        'Lost your password?' => 'Haben Sie Ihr Passwort vergessen?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MetaFloater.tt
        'Scale preview content' => 'Vorschauinhalt skalieren',
        'Open URL in new tab' => 'URL in neuem Tab öffnen',
        'Close preview' => 'Vorschau schließen',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Diese Webseite kann nicht als Vorschau angezeigt werden, weil sie keine Einbettung erlaubt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MobileNotAvailableWidget.tt
        'Feature not Available' => 'Funktion nicht verfügbar',
        'Sorry, but this feature of Znuny is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Entschuldigung, aber dieses Feature von Znuny ist derzeit nicht für Mobilgeräte verfügbar. Bitte wechseln sie in die Desktop-Ansicht oder nutzen sie ein normales Desktop-Gerät, wenn Sie diese Funktion verwenden möchten.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Motd.tt
        'Message of the Day' => 'Nachricht des Tages',
        'This is the message of the day. You can edit this in %s.' => 'Das ist die Nachricht des Tages. Sie können diese in %s bearbeiten.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NoPermission.tt
        'Insufficient Rights' => 'Nicht ausreichende Rechte',
        'Back to the previous page' => 'Zurück zur vorhergehenden Seite',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NotificationEvent/Email/Alert.tt
        'Alert' => 'Warnung',
        'Powered by' => 'Powered by',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Pagination.tt
        'Show first page' => 'Erste Seite anzeigen',
        'Show previous pages' => 'Vorige Seiten anzeigen',
        'Show page %s' => 'Seite %s anzeigen',
        'Show next pages' => 'Nächste Seiten anzeigen',
        'Show last page' => 'Letzte Seite anzeigen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PictureUpload.tt
        'Need FormID!' => 'FormID benötigt!',
        'No file found!' => 'Keine Datei gefunden!',
        'The file is not an image that can be shown inline!' => 'Diese Datei ist kein Bild, das inline angezeigt werden kann!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PreferencesNotificationEvent.tt
        'No user configurable notifications found.' => 'Keine vom Benutzer konfigurierbaren Benachrichtigungen gefunden.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Nachrichten für Benachrichtigung \'%s\' mittels Transportmethode \'%s\' empfangen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/ActivityDialogHeader.tt
        'Process Information' => 'Prozessinformationen',
        'Dialog' => 'Dialog',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/Article.tt
        'Inform Agent' => 'Agenten informieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PublicDefault.tt
        'Welcome' => 'Willkommen',
        'This is the default public interface of Znuny! There was no action parameter given.' =>
            'Dies ist die öffentliche Standard-Benutzerschnittstelle von Znuny. Es wurde kein Action-Parameter übergeben.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'Sie könnten (mithilfe des Paketmanagers) ein eigenes Modul für den öffentlichen Bereich von Znuny installieren, beispielsweise das FAQ-Modul.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAppointmentNotificationEvent.tt
        'To get the appointment attribute' => 'Die Termin-Attribute',
        'e. g.' => 'z. B.',
        'To get the first 20 character of the appointment title.' => 'Die ersten 20 Zeichen des Terminbetreffs.',
        'To get the calendar attribute' => 'Die Kalender-Attribute',
        'Attributes of the recipient user for the notification' => 'Attribute der Benutzerdaten des Empfängers der Benachrichtigung',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAutoResponse.tt
        'To get the first 20 character of the subject.' => 'Die ersten 20 Zeichen des Betreffs.',
        'To get the first 5 lines of the email.' => 'Die ersten fünf Zeilen der Nachricht.',
        'To get the name of the ticket\'s customer user (if given).' => 'Der Namen des Kundenbenutzers (falls vorhanden) eines Tickets.',
        'To get the article attribute' => 'Die Artikel-Attribute',
        'Options of the current customer user data' => 'Attribute des aktuellen Kunden',
        'Ticket owner options' => 'Attribute des Ticketbesitzers',
        'Options of the ticket data' => 'Attribute der Ticketdaten',
        'Options of ticket dynamic fields internal key values' => 'Interne Werte der Dynamischen Feldern von Tickets',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Angezeigte Werte der Dynamischen Felder von Tickets, nutzbar mit Dropdown und Multiselect',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminNotificationEvent.tt
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Die ersten 20 Zeichen des Betreffs (des letzten Agenten-Artikels).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Die ersten fünf Zeilen der Nachricht (des letzten Agenten-Artikels).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Die ersten 20 Zeichen des Betreffs (des letzten Kunden-Artikels).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Die ersten fünf Zeilen der Nachricht (des letzten Kunden-Artikels).',
        'Attributes of the current customer user data' => 'Attribute des aktuellen Kundenbenutzer-Datensatzes',
        'Attributes of the current ticket owner user data' => 'Attribute der Nutzerdaten des aktuellen Ticket-Besitzers',
        'Attributes of the ticket data' => 'Attribute der Ticket-Daten',
        'Ticket dynamic fields internal key values' => 'Interne Schlüssel der Dynamischen Felder des Tickets',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Anzeigewerte der Dynamischen Felder des Tickets, verwendbar für Auswahlfelder',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminTemplate.tt
        'To get the first 20 characters of the subject of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'So erhalten Sie die ersten 20 Zeichen des Betreffs des aktuellen/jüngsten Agentenartikels (aktuell für Antwort und Weiterleitung, spätestens für den Vorlagentyp Notiz). Dieses Tag wird für andere Vorlagentypen nicht unterstützt.',
        'To get the first 5 lines of the body of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'So erhalten Sie die ersten 5 Zeilen des Hauptteils des aktuellen/jüngsten Agentenartikels (aktuell für Antwort und Weiterleitung, spätestens für den Vorlagentyp Notiz). Dieses Tag wird für andere Vorlagentypen nicht unterstützt.',
        'To get the first 20 characters of the subject of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'Um die ersten 20 Zeichen des Betreffs des aktuellen/neuesten Artikels zu erhalten (aktuell für Antwort und Weiterleitung, spätestens für die Art der Notizvorlage). Dieser Tag wird für andere Vorlagentypen nicht unterstützt.',
        'To get the first 5 lines of the body of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'So erhalten Sie die ersten 5 Zeilen des Hauptteils des aktuellen/neuesten Artikels (aktuell für Antwort und Vorwärts, spätestens für den Vorlagentyp Notiz). Dieses Tag wird für andere Vorlagentypen nicht unterstützt.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/Default.tt
        'Tag Reference' => 'Tag-Referenz',
        'You can use the following tags' => 'Sie können folgende Tags verwenden',
        'Ticket responsible options' => 'Attribute des Ticket-Verantwortlichen',
        'Options of the current user who requested this action' => 'Attribute des aktuellen Benutzers, der die Aktion angefordert hat',
        'Config options' => 'Konfigurationsoptionen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/GeneralSpecificationsWidget.tt
        'You can select one or more groups to define access for different agents.' =>
            'Sie können eine oder mehrere Gruppen definieren, um Zugriffsrechte für verschiedene Agenten zu vergeben.',
        'Result formats' => 'Ergebnisformate',
        'Time Zone' => 'Zeitzone',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Die ausgewählten Zeitperioden der Statistik sind Zeitzonen-unabhängig.',
        'Create summation row' => 'Summenzeile erstellen',
        'Generate an additional row containing sums for all data rows.' =>
            'Eine zusätzliche Zeile mit Summen für alle Datenzeilen erstellen.',
        'Create summation column' => 'Summenspalte erstellen',
        'Generate an additional column containing sums for all data columns.' =>
            'Eine zusätzliche Spalte mit Summen für alle Datenspalten erstellen.',
        'Cache results' => 'Ergebnisse cachen',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Speichert Statistikergebnisse in einem Cache, der bei späteren Aufrufen mit derselben Konfiguration verwendet wird. (Benötigt mindestens ein ausgewähltes Zeitfeld).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Diese Statistik als Dashboard-Widget anbieten, die Agenten in Ihrem Dashboard aktivieren können.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Bitte beachten Sie, dass das Dashboard-Widget das Caching für diese Statistik aktiviert.',
        'If set to invalid end users can not generate the stat.' => 'Bei "ungültig" können Nutzer die Statistik nicht mehr ausführen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/PreviewWidget.tt
        'There are problems in the configuration of this statistic:' => 'Es bestehen Probleme in der Konfiguration dieser Statistik:',
        'You may now configure the X-axis of your statistic.' => 'Sie können jetzt die X-Achse Ihrer Statistik konfigurieren.',
        'This statistic does not provide preview data.' => 'Diese Statistik stellt keine Vorschaudaten zur Verfügung.',
        'Preview format' => 'Vorschauformat',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Bitte beachten Sie, dass die Vorschau Zufallsdaten verwendet und keine Datenfilter berücksichtigt.',
        'Configure X-Axis' => 'X-Achse konfigurieren',
        'X-axis' => 'X-Achse',
        'Configure Y-Axis' => 'Y-Achse konfigurieren',
        'Y-axis' => 'Y-Achse',
        'Configure Filter' => 'Filter konfigurieren',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/RestrictionsWidget.tt
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Bitte wählen Sie nur ein Element aus oder entfernen Sie das Häkchen der Checkbox \'Fixiert\'.',
        'Absolute period' => 'Absoluter Zeitraum',
        'Between %s and %s' => 'Zwischen %s und %s',
        'Relative period' => 'Relativer Zeitraum',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'Die vergangenen %s und der/die aktuelle+kommenden %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Beim Erstellen der Statistik keine Veränderungen an diesem Element erlauben.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsParamsWidget.tt
        'Format' => 'Format',
        'Exchange Axis' => 'Achsen vertauschen',
        'Configurable Params of Static Stat' => 'Konfigurierbare Parameter der statischen Statistik',
        'No element selected.' => 'Es wurde kein Element ausgewählt.',
        'Scale' => 'Skalierung',
        'show more' => 'Mehr anzeigen',
        'show less' => 'Weniger anzeigen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsResultRender/D3.tt
        'Download SVG' => 'SVG herunterladen',
        'Download PNG' => 'PNG herunterladen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/XAxisWidget.tt
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Der ausgewählte Zeitabschnitt definiert den (voreingestellten) Zeitraum, aus dem diese Statistik Daten aggregiert.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Definiert die Zeiteinheit, anhand welcher der ausgewählte Zeitraum in Berichts-Datenpunkte aufgeteilt wird.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/YAxisWidget.tt
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Bitte beachten Sie, dass die Skalierung der Y-Achse größer sein muss als die Skalierung der X-Achse (z. B. X-Achse => Monat, Y-Achse => Jahr).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsList.tt
        'This setting is disabled.' => 'Diese Einstellung ist deaktiviert.',
        'This setting is fixed but not deployed yet!' => 'Die Einstellung wurde korrigiert, aber bislang nicht in Betrieb genommen!',
        'This setting is currently being overridden in %s and can\'t thus be changed here!' =>
            'Diese Einstellung ist aktuell in %s überschrieben und kann deswegen hier nicht geändert werden!',
        'Changing this setting is only available in a higher config level!' =>
            'Das Ändern dieser Einstellung ist nur in einem höheren Konfigurationslevel verfügbar!',
        '%s (%s) is currently working on this setting.' => '%s (%s) arbeitet derzeit an dieser Einstellung.',
        'Toggle advanced options for this setting' => 'Erweiterte Optionen für diese Einstellung ein-/ausblenden',
        'Disable this setting, so it is no longer effective' => 'Einstellung deaktivieren, so dass sie keine Auswirkungen mehr hat',
        'Disable' => 'Deaktivieren',
        'Enable this setting, so it becomes effective' => 'Einstellung aktivieren, so dass sie Auswirkungen hat',
        'Enable' => 'Aktivieren',
        'Reset this setting to its default state' => 'Einstellung auf Standardwert zurücksetzen',
        'Reset setting' => 'Einstellung zurücksetzen',
        'Copy a direct link to this setting to your clipboard' => 'Direkt-Link zu dieser Einstellung in die Zwischenablage kopieren',
        'Copy direct link' => 'Direkt-Link kopieren',
        'Remove this setting from your favorites setting' => 'Einstellung aus den persönlichen Favoriten entfernen',
        'Remove from favourites' => 'Aus Favoriten entfernen',
        'Add this setting to your favorites' => 'Einstellungen den persönlichen Favoriten hinzufügen',
        'Add to favourites' => 'Zu Favoriten hinzufügen',
        'Cancel editing this setting' => 'Bearbeitung dieser Einstellung abbrechen',
        'Save changes on this setting' => 'Änderungen an dieser Einstellung speichern',
        'Edit this setting' => 'Einstellung bearbeiten',
        'Enable this setting' => 'Einstellung aktivieren',
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups or another group.' =>
            'Diese Gruppe enthält selbst keine Einstellungen. Versuchen Sie, in eine der verfügbaren Untergruppen oder eine andere Gruppe zu navigieren.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsListCompare.tt
        'Now' => 'Jetzt',
        'User modification' => 'Benutzeränderung',
        'enabled' => 'aktiviert',
        'disabled' => 'deaktiviert',
        'Setting state' => 'Status der Einstellung',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Actions.tt
        'Edit search' => 'Suche bearbeiten',
        'Go back to admin: ' => 'Zurück zum Admin-Bereich: ',
        'Deployment' => 'Inbetriebnahme',
        'My favourite settings' => 'Meine Favoriten',
        'Invalid settings' => 'Ungültige Einstellungen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/DynamicActions.tt
        'Filter visible settings...' => 'Sichtbare Einstellungen filtern...',
        'Enable edit mode for all settings' => 'Bearbeitungsmodus für alle aktivieren',
        'Save all edited settings' => 'Alle geänderten Einstellungen speichern',
        'Cancel editing for all settings' => 'Bearbeitungsmodus für alle abbrechen',
        'All actions from this widget apply to the visible settings on the right only.' =>
            'Alle Aktionen aus diesem Widget betreffen nur die jeweils sichtbaren Einstellungen auf der rechten Seite.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Help.tt
        'Currently edited by me.' => 'Derzeit von mir bearbeitet.',
        'Modified but not yet deployed.' => 'Bearbeitet, aber bislang nicht in Betrieb genommen.',
        'Currently edited by another user.' => 'Derzeit durch einen anderen Benutzer in Bearbeitung.',
        'Different from its default value.' => 'Weicht vom Standardwert ab.',
        'Save current setting.' => 'Aktuelle Einstellung speichern.',
        'Cancel editing current setting.' => 'Bearbeitung der aktuellen Einstellung abbrechen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Navigation.tt
        'Navigation' => 'Navigation',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Test.tt
        'Znuny Test Page' => 'Znuny Testseite',
        'Unlock' => 'Entsperren',
        'Welcome %s %s' => '%s %s willkommen',
        'Counter' => 'Zähler',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Ticket/TimeUnits.tt
        'Invalid time!' => 'Ungültige Zeitangabe!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Warning.tt
        'Go back to the previous page' => 'Zurück zur vorhergehenden Seite',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/FormDraftAddDialog.html.tmpl
        'Draft title' => 'Entwurfstitel',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/ArticleViewSettingsDialog.html.tmpl
        'Article display' => 'Artikel-Anzeige',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl
        'Do you really want to delete "%s"?' => 'Möchten Sie "%s" wirklich löschen?',
        'Confirm' => 'Bestätigen',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/WidgetLoading.html.tmpl
        'Loading, please wait...' => 'Lade, bitte warten...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/AjaxDnDUpload/UploadContainer.html.tmpl
        'Click to select a file for upload.' => 'Klicken Sie, um eine Datei fürs Hochladen auszuwählen.',
        'Select files or drop them here' => 'Dateien auswählen oder hierher ziehen',
        'Select a file or drop it here' => 'Datei auswählen oder hierher ziehen',
        'Uploading...' => 'Wird hochgeladen...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/PackageManager/InformationDialog.html.tmpl
        'Process state' => 'Prozess-Status',
        'Running' => 'Laufend',
        'Finished' => 'Fertig',
        'Unknown' => 'Unbekannt',
        'No package information available.' => 'Keine Paketinformationen verfügbar.',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddButton.html.tmpl
        'Add new entry' => 'Eintrag hinzufügen',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddHashKey.html.tmpl
        'Add key' => 'Schlüssel hinzufügen',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogDeployment.html.tmpl
        'Deployment comment...' => 'Kommentar zur Inbetriebnahme...',
        'This field can have no more than 250 characters.' => 'Dieses Feld darf nicht mehr als 250 Zeichen lang sein.',
        'Deploying, please wait...' => 'Inbetriebnahme läuft, bitte warten...',
        'Preparing to deploy, please wait...' => 'Inbetriebnahme wird vorbereitet, bitte warten...',
        'Deploy now' => 'Jetzt in Betrieb nehmen',
        'Try again' => 'Nochmals versuchen',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogReset.html.tmpl
        'Do you really want to reset this setting to it\'s default value?' =>
            'Möchten Sie diese Einstellung wirklich auf ihren Standardwert zurücksetzen?',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/HelpDialog.html.tmpl
        'You can use the category selection to limit the navigation tree below to entries from the selected category. As soon as you select the category, the tree will be re-built.' =>
            'Sie können die Kategorieauswahl nutzen, um den Navigationsbaum auf Einträge aus der gewählten Kategorie einzuschränken. Sobald Sie einen Eintrag wählen, wird der Baum automatisch neu aufgebaut.',

        # Perl Module: Kernel/Config/Defaults.pm
        'Database Backend' => 'Datenbank-Backend',
        'CustomerIDs' => 'Kundennummern',
        'Fax' => 'Fax',
        'Street' => 'Straße',
        'Zip' => 'PLZ',
        'City' => 'Stadt',
        'Country' => 'Land',
        'Valid' => 'Gültig',
        'Mr.' => 'Herr',
        'Mrs.' => 'Frau',
        'View system log messages.' => 'Systemprotokoll-Nachrichten ansehen.',
        'Edit the system configuration settings.' => 'Systemeinstellungen bearbeiten.',
        'Update and extend your system with software packages.' => 'System mit Softwarepaketen aktualisieren und erweitern.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'Die ACL-Konfiguration ist laut Datenbank nicht synchron mit der Systemkonfiguration, bitte ACLs in Betrieb nehmen.',
        'ACLs could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'ACLs konnten aufgrund eines unbekannten Fehlers nicht importiert werden, bitte prüfen Sie das Systemprotokoll für mehr Information',
        'The following ACLs have been added successfully: %s' => 'Die folgenden ACLs wurden erfolgreich hinzugefügt: %s',
        'The following ACLs have been updated successfully: %s' => 'Die folgenden ACLs wurden erfolgreich aktualisiert: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Beim Hinzufügen/Aktualisieren der folgenden ACLs sind Fehler aufgetreten: %s. Bitte prüfen Sie das Systemprotokoll für mehr Informationen.',
        'This field is required' => 'Dieses Feld wird benötigt',
        'There was an error creating the ACL' => 'Es gab einen Fehler beim Erstellen der ACL',
        'Need ACLID!' => 'ACL-ID benötigt!',
        'Could not get data for ACLID %s' => 'Konnte keine Daten für ACL-ID %s ermitteln',
        'There was an error updating the ACL' => 'Beim Aktualisieren der ACL ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status.' => 'Beim Setzen des Synchronisations-Status ist ein Fehler aufgetreten.',
        'There was an error synchronizing the ACLs.' => 'Es gab einen Fehler beim Synchronisieren der ACLs.',
        'ACL %s could not be deleted' => 'ACL %s konnte nicht gelöscht werden',
        'There was an error getting data for ACL with ID %s' => 'Es gab einen Fehler beim Holen der Daten für die ACL mit der ID %s',
        '%s (copy) %s' => '%s (Kopie) %s',
        'Please note that ACL restrictions will be ignored for the Superuser account (UserID 1).' =>
            'Bitte beachten Sie, dass ACL-Restriktionen nicht für den Superuser-Account gelten (UserID 1).',
        'Exact match' => 'Genauer Treffer',
        'Negated exact match' => 'Negierter genauer Treffer',
        'Regular expression' => 'Regulärer Ausdruck',
        'Regular expression (ignore case)' => 'Regulärer Ausdruck (Groß-/Kleinschreibung ignorieren)',
        'Negated regular expression' => 'Negierter Regulärer Ausdruck',
        'Negated regular expression (ignore case)' => 'Negierter regulärer Ausdruck (Groß-/Kleinschreibung ignorieren)',

        # Perl Module: Kernel/Modules/AdminAppointmentCalendarManage.pm
        'System was unable to create Calendar!' => 'Das System konnten den Kalender nicht erstellen!',
        'Please contact the administrator.' => 'Bitte kontaktieren Sie den Administrator.',
        'No CalendarID!' => 'Keine CalendarID!',
        'You have no access to this calendar!' => 'Sie haben keine Zugriffsberechtigung auf diesen Kalender!',
        'Error updating the calendar!' => 'Fehler beim Aktualisieren des Kalenders!',
        'Couldn\'t read calendar configuration file.' => 'Kalender-Konfigurationsdatei konnte nicht gelesen werden.',
        'Please make sure your file is valid.' => 'Bitte stellen Sie sicher, dass die Datei gültig ist.',
        'Could not import the calendar!' => 'Kalender konnte nicht importiert werden!',
        'Calendar imported!' => 'Kalender wurde importiert!',
        'Need CalendarID!' => 'CalendarID wird benötigt!',
        'Could not retrieve data for given CalendarID' => 'Daten konnten nicht abgerufen werden für CalendarID',
        'Successfully imported %s appointment(s) to calendar %s.' => 'Es wurde(n) %s Termin(e) erfolgreich in Kalender %s importiert.',
        '+5 minutes' => '+5 Minuten',
        '+15 minutes' => '+15 Minuten',
        '+30 minutes' => '+30 Minuten',
        '+1 hour' => '+1 Stunde',

        # Perl Module: Kernel/Modules/AdminAppointmentImport.pm
        'No permissions' => 'Keine Berechtigung',
        'System was unable to import file!' => 'Das System konnte die Datei nicht importieren!',
        'Please check the log for more information.' => 'Bitte prüfen Sie das Systemprotokoll für weitere Informationen.',

        # Perl Module: Kernel/Modules/AdminAppointmentNotificationEvent.pm
        'Notification name already exists!' => 'Benachrichtigungsname existiert bereits!',
        'Notification added!' => 'Benachrichtigung hinzugefügt!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Beim Ermitteln der Daten für die Benachrichtigung mit der ID %s ist ein Fehler aufgetreten!',
        'Unknown Notification %s!' => 'Unbekannte Benachrichtigung %s!',
        '%s (copy)' => '%s (Kopie)',
        'There was an error creating the Notification' => 'Beim Erstellen der Benachrichtigung ist ein Fehler aufgetreten',
        'Notifications could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'Benachrichtigungen konnten aufgrund eines unbekannten Fehlers nicht importiert werden. Bitte prüfen Sie das Systemprotokoll für mehr Informationen',
        'The following Notifications have been added successfully: %s' =>
            'Folgende Benachrichtigungen wurden erfolgreich importiert: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Folgende Benachrichtigungen wurden erfolgreich aktualisiert: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Beim Hinzufügen/Aktualisieren der folgenden Benachrichtigungen sind Fehler aufgetreten: %s. Bitte prüfen Sie das Systemprotokoll für mehr Informationen.',
        'Notification updated!' => 'Benachrichtigung aktualisiert!',
        'Agent (resources), who are selected within the appointment' => 'Agenten (Ressourcen), welche innerhalb des Termins ausgewählt wurden',
        'All agents with (at least) read permission for the appointment (calendar)' =>
            'Alle Agenten mit (mindestens) Leseberechtigung für den Termin(kalender)',
        'All agents with write permission for the appointment (calendar)' =>
            'Alle Agenten mit Schreibberechtigung für den Termin(kalender)',

        # Perl Module: Kernel/Modules/AdminAutoResponse.pm
        'Auto Response added!' => 'Automatische Antwort hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminCommunicationLog.pm
        'Invalid CommunicationID!' => 'Ungültige CommunicationID!',
        'All communications' => 'Gesamte Kommunikation',
        'Last 1 hour' => 'Letzte Stunde',
        'Last 3 hours' => 'Letzte 3 Stunden',
        'Last 6 hours' => 'Letzte 6 Stunden',
        'Last 12 hours' => 'Letzte 12 Stunden',
        'Last 24 hours' => 'Letzte 24 Stunden',
        'Last week' => 'Letzte Woche',
        'Last month' => 'Letzter Monat',
        'Invalid StartTime: %s!' => 'Ungültige Startzeit: %s!',
        'Successful' => 'Erfolgreich',
        'Processing' => 'Wird verarbeitet',
        'Failed' => 'Fehlgeschlagen',
        'Invalid Filter: %s!' => 'Ungültiger Filter: %s!',
        'Less than a second' => 'Weniger als eine Sekunde',
        'sorted descending' => 'absteigend sortiert',
        'sorted ascending' => 'aufsteigend sortiert',
        'Trace' => 'Aufzeichnen',
        'Debug' => 'Fehlersuche',
        'Info' => 'Info',
        'Warn' => 'Warnen',
        'days' => 'Tage',
        'day' => 'Tag',
        'hour' => 'Stunde',
        'minute' => 'Minute',
        'seconds' => 'Sekunden',
        'second' => 'Sekunde',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer company updated!' => 'Kundenunternehmen aktualisiert!',
        'Dynamic field %s not found!' => 'Dynamisches Feld 1%s nicht gefunden!',
        'Unable to set value for dynamic field %s!' => 'Wert für Dynamisches Feld 1%s kann nicht gesetzt werden!',
        'Customer Company %s already exists!' => 'Das Kundenunternehmen %s existiert bereits!',
        'Customer company added!' => 'Kundenunternehmen hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminCustomerGroup.pm
        'No configuration for \'CustomerGroupPermissionContext\' found!' =>
            'Keine Konfiguration für \'CustomerGroupPermissionContext\' gefunden!',
        'Please check system configuration.' => 'Bitte prüfen Sie die Systemkonfiguration.',
        'Invalid permission context configuration:' => 'Ungültige Berechtigungskontext-Konfiguration:',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'Customer updated!' => 'Kunde aktualisiert!',
        'New phone ticket' => 'Neues Telefon-Ticket',
        'New email ticket' => 'Neues E-Mail-Ticket',
        'Customer %s added' => 'Kunde %s hinzugefügt',
        'Customer user updated!' => 'Kundenbenutzer aktualisiert!',
        'Same Customer' => 'Gleicher Kunde',
        'Direct' => 'Direkt',
        'Indirect' => 'Indirekt',

        # Perl Module: Kernel/Modules/AdminCustomerUserGroup.pm
        'Change Customer User Relations for Group' => 'Kundenbenutzer-Zuordnungen verwalten für Gruppe',
        'Change Group Relations for Customer User' => 'Gruppenzuordnungen verwalten für Kundenbenutzer',

        # Perl Module: Kernel/Modules/AdminCustomerUserService.pm
        'Allocate Customer Users to Service' => 'Kundenbenutzer zu Services zuordnen',
        'Allocate Services to Customer User' => 'Services zu Kundenbenutzern zuordnen',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'Felderkonfiguration ist nicht gültig',
        'Objects configuration is not valid' => 'Die Objektkonfiguration ist ungültig',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Konnte die Reihenfolge der Dynamischen Felder nicht zurücksetzen, bitte prüfen Sie das Systemprotokoll für mehr Informationen.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Unbestimmte Unteraktion.',
        'Need %s' => '%s benötigt',
        'Add %s field' => '%s Feld hinzufügen',
        'The field does not contain only ASCII letters and numbers.' => 'Dieses Feld enthält nicht nur ASCII-Zeichen.',
        'There is another field with the same name.' => 'Es existiert bereits ein Feld mit demselben Namen.',
        'The field must be numeric.' => 'Das Feld darf nur Zahlen beinhalten.',
        'Need ValidID' => 'Benötige ValidID',
        'Could not create the new field' => 'Konnte das neue Feld nicht anlegen',
        'Need ID' => 'ID benötigt',
        'Could not get data for dynamic field %s' => 'Konnte keine Daten für das Dynamische Feld %s ermitteln',
        'Change %s field' => '%s Feld ändern',
        'The name for this field should not change.' => 'Der Name dieses Feldes sollte sich nicht ändern.',
        'Could not update the field %s' => 'Das Feld %s konnte nicht aktualisiert werden',
        'Currently' => 'Aktuell',
        'Unchecked' => 'Nicht ausgewählt',
        'Checked' => 'Ausgewählt',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Eingabe von zukünftigen Datumswerten verhindern',
        'Prevent entry of dates in the past' => 'Eingabe von vergangenen Datumswerten verhindern',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Dieser Wert existiert bereits.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldScreenConfiguration.pm
        'Settings were saved.' => 'Einstellungen wurden gespeichert.',
        'System was not able to save the setting!' => 'Das System konnte die Einstellung nicht speichern!',
        'Setting is locked by another user!' => 'Einstellung bereits durch einen anderen Nutzer in Bearbeitung!',
        'System was not able to reset the setting!' => 'Einstellung konnte nicht zurückgesetzt werden!',
        'Settings were reset.' => 'Einstellungen wurden zurückgesetzt.',
        'Screens for dynamic field %s' => 'Masken für dynamisches Feld %s',
        'Dynamic fields for screen %s' => 'Dynamische Felder für Maske %s',
        'Default columns for screen %s' => 'Standardspalten für Maske %s',

        # Perl Module: Kernel/Modules/AdminDynamicFieldWebservice.pm
        'Could not get config for dynamic field %s' => 'Konfiguration für dynamisches Feld %s wurde nicht gefunden.',
        'The field must contain only ASCII letters and numbers.' => 'Das Feld darf nur ASCII-Zeichen enthalten.',
        'Dynamic field is configured more than once.' => 'Dynamisches Feld ist mehrmals konfiguriert.',
        'Dynamic field does not exist or is invalid.' => 'Dynamisches Feld existiert nicht oder ist ungültig.',
        'Only dynamic fields for tickets are allowed.' => 'Nur dynamische Ticketfelder sind erlaubt.',

        # Perl Module: Kernel/Modules/AdminEmail.pm
        'Select at least one recipient.' => 'Wählen Sie mindestens einen Empfänger aus.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'minute(s)' => 'Minute(n)',
        'hour(s)' => 'Stunde(n)',
        'Time unit' => 'Zeiteinheit',
        'within the last ...' => 'innerhalb der letzten ...',
        'within the next ...' => 'innerhalb der kommenden ...',
        'more than ... ago' => 'vor mehr als ...',
        'Unarchived tickets' => 'Nicht archivierte Tickets',
        'archive tickets' => 'Tickets archivieren',
        'restore tickets from archive' => 'Tickets aus dem Archiv wiederherstellen',
        'Need Profile!' => 'Benötige Profile!',
        'Got no values to check.' => 'Keine Werte zum Prüfen empfangen.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Bitte entfernen Sie die folgenden Worte, da sie nicht für die Ticket-Auswahl genutzt werden können:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Benötige Webservice-ID!',
        'Could not get data for WebserviceID %s' => 'Konnte keine Daten für Webservice-ID %s ermitteln',
        'ascending' => 'aufsteigend',
        'descending' => 'absteigend',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingDefault.pm
        'Need communication type!' => 'Kommunikationstyp benötigt!',
        'Communication type needs to be \'Requester\' or \'Provider\'!' =>
            'Kommunikationstyp muss \'Requester\' oder \'Provider\' sein!',
        'Invalid Subaction!' => 'Ungültige Unteraktion!',
        'Need ErrorHandlingType!' => 'Benötige Fehlerbehandlungs-Typ!',
        'ErrorHandlingType %s is not registered' => 'Fehlerbehandlungs-Typ %s nicht registriert',
        'Could not update web service' => 'Webservice konnte nicht aktualisiert werden',
        'Need ErrorHandling' => 'Benötige Fehlerbehandlung',
        'Could not determine config for error handler %s' => 'Konnte Konfiguration für Fehlerbehandlung %s nicht ermitteln',
        'Invoker processing outgoing request data' => 'Der Invoker verarbeitet ausgehende Request-Daten',
        'Mapping outgoing request data' => 'Ausgehende Request-Daten zuordnen',
        'Transport processing request into response' => 'Transportverarbeitung von Anfrage (Request) zu Antwort (Response)',
        'Mapping incoming response data' => 'Eingehende Response-Daten zuordnen',
        'Invoker processing incoming response data' => 'Invoker verarbeitet eingehende Response-Daten',
        'Transport receiving incoming request data' => 'Transport erhält eingehende Request-Daten',
        'Mapping incoming request data' => 'Eingehende Request-Daten zuordnen',
        'Operation processing incoming request data' => 'Operation verarbeitet eingehende Request-Daten',
        'Mapping outgoing response data' => 'Ausgehende Response-Daten zuordnen',
        'Transport sending outgoing response data' => 'Transport sendet ausgehende Response-Daten',
        'skip same backend modules only' => 'Nur gleiche Backend-Module überspringen',
        'skip all modules' => 'Alle Module überspringen',
        'Operation deleted' => 'Operation gelöscht',
        'Invoker deleted' => 'Invoker gelöscht',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingRequestRetry.pm
        '0 seconds' => '0 Sekunden',
        '15 seconds' => '15 Sekunden',
        '30 seconds' => '30 Sekunden',
        '45 seconds' => '45 Sekunden',
        '1 minute' => '1 Minute',
        '2 minutes' => '2 Minuten',
        '3 minutes' => '3 Minuten',
        '4 minutes' => '4 Minuten',
        '5 minutes' => '5 Minuten',
        '10 minutes' => '10 Minuten',
        '15 minutes' => '15 Minuten',
        '30 minutes' => '30 Minuten',
        '1 hour' => '1 Stunde',
        '2 hours' => '2 Stunden',
        '3 hours' => '3 Stunden',
        '4 hours' => '4 Stunden',
        '5 hours' => '5 Stunden',
        '6 hours' => '6 Stunden',
        '12 hours' => '12 Stunden',
        '18 hours' => '18 Stunden',
        '1 day' => '1 Tag',
        '2 days' => '2 Tage',
        '3 days' => '3 Tage',
        '4 days' => '4 Tage',
        '6 days' => '6 Tage',
        '1 week' => '1 Woche',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Could not determine config for invoker %s' => 'Konnte Konfiguration für Invoker %s nicht ermitteln',
        'InvokerType %s is not registered' => 'Invoker-Typ %s ist nicht registriert',
        'MappingType %s is not registered' => 'Mapping-Typ %s ist nicht registriert',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerEvent.pm
        'Need Invoker!' => 'Benötige Invoker!',
        'Need Event!' => 'Benötige Ereignis!',
        'Could not get registered modules for Invoker' => 'Es konnten keine registrierten Module für Invoker abgerufen werden',
        'Could not get backend for Invoker %s' => 'Konnte das Backend für Invoker %s nicht aufrufen',
        'The event %s is not valid.' => 'Das Ereignis %s ist nicht gültig.',
        'Could not update configuration data for WebserviceID %s' => 'Konnte Konfigurationsdaten für Webservice-ID %s nicht aktualisieren',
        'This sub-action is not valid' => 'Diese Unteraktion ist nicht gültig',
        'xor' => 'exklusives oder (xor)',
        'String' => 'Zeichenkette',
        'Regexp' => 'Regexp',
        'Validation Module' => 'Validierungsmodul',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Simple Mapping for Outgoing Data' => 'Einfaches Mapping für ausgehende Daten',
        'Simple Mapping for Incoming Data' => 'Einfaches Mapping für eingehende Daten',
        'Could not get registered configuration for action type %s' => 'Konnte keine registrierte Konfiguration für Action Typ %s ermitteln',
        'Could not get backend for %s %s' => 'Konnte Backend für %s %s nicht ermitteln',
        'Keep (leave unchanged)' => 'Behalten (unverändert lassen)',
        'Ignore (drop key/value pair)' => 'Ignorieren (Schlüssel-Wert-Paar entfernen)',
        'Map to (use provided value as default)' => 'Ändern in (verwende angegeben Wert als Standard)',
        'Exact value(s)' => 'Genaue(r) Wert(e)',
        'Ignore (drop Value/value pair)' => 'Ignorieren (Wert-Wert-Paar entfernen)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'XSLT Mapping for Outgoing Data' => 'XSLT-Mapping für ausgehende Daten',
        'XSLT Mapping for Incoming Data' => 'XSLT-Mapping für eingehende Daten',
        'Could not find required library %s' => 'Konnte benötigte Bibliothek %s nicht finden',
        'Outgoing request data before processing (RequesterRequestInput)' =>
            'Ausgehende Request-Daten vor der Verarbeitung (RequesterRequestInput)',
        'Outgoing request data before mapping (RequesterRequestPrepareOutput)' =>
            'Ausgehende Request-Daten vor dem Mapping (RequesterRequestPrepareOutput)',
        'Outgoing request data after mapping (RequesterRequestMapOutput)' =>
            'Ausgehende Request-Daten nach dem Mapping (RequesterRequestMapOutput)',
        'Incoming response data before mapping (RequesterResponseInput)' =>
            'Eingehende Response-Daten vor dem Mapping (RequesterResponseInput)',
        'Outgoing error handler data after error handling (RequesterErrorHandlingOutput)' =>
            'Ausgehende Fehlerbehandlungsdaten nach der Fehlerbehandlung (RequesterErrorHandlingOutput)',
        'Incoming request data before mapping (ProviderRequestInput)' => 'Daten eingehender Requests vor dem Mapping (ProviderRequestInput)',
        'Incoming request data after mapping (ProviderRequestMapOutput)' =>
            'Daten eingehender Requests nach dem Mapping (ProviderRequestMapOutput)',
        'Outgoing response data before mapping (ProviderResponseInput)' =>
            'Ausgehende Response-Daten vor dem Mapping (ProviderResponseInput)',
        'Outgoing error handler data after error handling (ProviderErrorHandlingOutput)' =>
            'Ausgehende Fehlerbehandlungsdaten nach der Fehlerbehandlung (ProviderErrorHandlingOutput)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Could not determine config for operation %s' => 'Konnte Konfiguration für Operation %s nicht ermitteln',
        'OperationType %s is not registered' => 'Operation-Typ %s ist nicht registriert',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need valid Subaction!' => 'Benötige gültige Unteraktion!',
        'This field should be an integer.' => 'Dieses Feld darf nur Ganzzahlen enthalten.',
        'Invalid key file and/or password (if needed, see below).' => 'Ungültige Key-Datei und/oder Passwort (falls benötigt, siehe unten).',
        'Invalid password and/or key file (see above).' => 'Ungültiges Passwort und/oder Key-Datei (siehe oben).',
        'Certificate is expired.' => 'Zertifikat ist abgelaufen.',
        'Certificate file could not be parsed.' => 'Zertifikat-Datei konnte nicht gelesen werden.',
        'Please enter a time in seconds (at least 10 seconds).' => 'Bitte geben Sie eine Zeit in Sekunden ein (mind. 10 Sekunden).',
        'Please enter data in expected form (see explanation of field).' =>
            'Bitte geben Sie die Daten in der erwarteten Form ein (siehe Feldbeschreibung).',
        'File or Directory not found.' => 'Datei oder Verzeichnis nicht gefunden.',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Es existiert bereits ein Webservice mit demselben Namen.',
        'There was an error updating the web service.' => 'Beim Aktualisieren des Webservice ist ein Fehler aufgetreten.',
        'There was an error creating the web service.' => 'Beim Erstellen des Webservice ist ein Fehler aufgetreten.',
        'Web service "%s" created!' => 'Webservice "%s" erstellt!',
        'Need Name!' => 'Name benötigt!',
        'Need ExampleWebService!' => 'Benötige Beispiel-Webservice!',
        'Could not load %s.' => '%s konnte nicht geladen werden.',
        'Could not read %s!' => 'Konnte %s nicht lesen!',
        'Need a file to import!' => 'Benötige eine zu importierende Datei!',
        'The imported file has not valid YAML content! Please check Znuny log for details' =>
            'Die importierte Datei enthält ungültigen YAML-Inhalt. Bitte prüfen Sie das Systemprotokoll für mehr Informationen',
        'Web service "%s" deleted!' => 'Webservice "%s" gelöscht!',
        'Znuny as provider' => 'Znuny als Provider',
        'Operations' => 'Operationen',
        'Znuny as requester' => 'Znuny als Requester',
        'Invokers' => 'Invoker',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Keine WebserviceHistoryID empfangen!',
        'Could not get history data for WebserviceHistoryID %s' => 'Konnte Historie für WebserviceHistoryID %s nicht finden',

        # Perl Module: Kernel/Modules/AdminGroup.pm
        'Group updated!' => 'Gruppe aktualisiert!',

        # Perl Module: Kernel/Modules/AdminMailAccount.pm
        'Mail account added!' => 'E-Mail-Konto hinzugefügt!',
        'Email account fetch already fetched by another process. Please try again later!' =>
            'Der E-Mail-Kontoabruf wurde bereits von einem anderen Prozess aufgerufen. Bitte versuchen Sie es später erneut!',
        'Dispatching by email To: field.' => 'Verteilung nach To: Feld.',
        'Dispatching by selected Queue.' => 'Verteilung nach ausgewählter Queue.',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Agent who created the ticket' => 'Agent, der das Ticket erstellt hat',
        'Agent who owns the ticket' => 'Agent, der Besitzer des Tickets ist',
        'Agent who is responsible for the ticket' => 'Agent, der Verantwortlicher für das Ticket ist',
        'All agents watching the ticket' => 'Alle Agenten, die Beobachter des Tickets sind',
        'All agents with write permission for the ticket' => 'Alle Agenten mit Schreibberechtigung für das Ticket',
        'All agents subscribed to the ticket\'s queue' => 'Alle Agenten, die die Queue des Tickets abonniert haben',
        'All agents subscribed to the ticket\'s service' => 'Alle Agenten, die den Service des Tickets abonniert haben',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Alle Agenten, die sowohl Queue als auch Service des Tickets abonniert haben',
        'Customer user of the ticket' => 'Kundenbenutzer des Tickets',
        'All recipients of the first article' => 'Alle Empfänger des ersten Artikels',
        'All recipients of the last article' => 'Alle Empfänger des letzten Artikels',
        'All agents who are mentioned in the ticket' => 'Alle Agenten, die in dem Ticket erwähnt werden.',
        'Invisible to customer' => 'Unsichtbar für Kunde',
        'Visible to customer' => 'Sichtbar für Kunde',

        # Perl Module: Kernel/Modules/AdminOAuth2TokenManagement.pm
        'Authorization code parameters not found.' => 'Autorisierungscode-Parameter nicht gefunden.',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'Die PGP-Umgebung funktioniert derzeit nicht. Bitte prüfen Sie das Systemprotokoll für mehr Informationen!',
        'Need param Key to delete!' => 'Benötige Parameter "Key" zum Löschen!',
        'Key %s deleted!' => 'Schlüssel %s gelöscht!',
        'Need param Key to download!' => 'Benötige Parameter "Key" zum herunterladen!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!' =>
            'Entschuldigung, Apache::Reload wird als Perl-Modul und PerlInitHandler in der Apache-Konfiguration benötigt (siehe auch scripts/apache2-httpd.include.conf). Alternativ können Sie Pakete auch mithilfe des Kommandozeilen-Tools bin/znuny.Console.pl installieren!',
        'No such package!' => 'Kein solches Paket!',
        'No such file %s in package!' => 'Keine solche Datei %s im Paket!',
        'No such file %s in local file system!' => 'Datei %s existiert nicht im Dateisystem!',
        'Can\'t read %s!' => 'Kann %s nicht lesen!',
        'Package has locally modified files.' => 'Das Paket enthält lokal angepasste Dateien.',
        'Not Started' => 'Nicht gestartet',
        'Updated' => 'Aktualisiert',
        'Already up-to-date' => 'Bereits aktuell',
        'Installed' => 'Installiert',
        'Not correctly deployed' => 'Nicht korrekt installiert',
        'Package updated correctly' => 'Paket korrekt aktualisiert',
        'Package was already updated' => 'Paket wurde bereits aktualisiert',
        'Dependency installed correctly' => 'Abhängigkeit korrekt installiert',
        'The package needs to be reinstalled' => 'Das Paket muss neu installiert werden',
        'The package contains cyclic dependencies' => 'Das Paket enthält zyklische Abhängigkeiten',
        'Not found in on-line repositories' => 'Nicht im Online-Verzeichnis gefunden',
        'Required version is higher than available' => 'Erforderliche Version höher als verfügbar',
        'Dependencies fail to upgrade or install' => 'Abhängigkeiten können nicht aktualisiert oder installiert werden',
        'Package could not be installed' => 'Paket konnte nicht installiert werden',
        'Package could not be upgraded' => 'Paket konnte nicht aktualisiert werden',
        'Repository List' => 'Verzeichnisliste',
        'No packages found in selected repository. Please check log for more info!' =>
            'Keine Pakete im gewählten Verzeichnis gefunden. Bitte prüfen Sie das Systemprotokoll für mehr Informationen!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Kein solcher Filter: %s',

        # Perl Module: Kernel/Modules/AdminPriority.pm
        'Priority added!' => 'Priorität hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Die Konfiguration des Prozessmanagements in der Datenbank ist nicht synchron mit der Systemkonfiguration, bitte synchronisieren Sie alle Prozesse.',
        'Need ExampleProcesses!' => 'Benötige Beispiel-Prozesse!',
        'Need ProcessID!' => 'Benötige ProcessID!',
        'Yes (mandatory)' => 'Ja (erforderlich)',
        'Unknown Process %s!' => 'Unbekannter Prozess %s!',
        'There was an error generating a new EntityID for this Process' =>
            'Beim Generieren einer neuen EntityID für diesen Prozess ist ein Fehler aufgetreten',
        'The StateEntityID for state Inactive does not exists' => 'Die StateEntityID für den Status "Inaktiv" existiert nicht',
        'There was an error creating the Process' => 'Beim Erstellen des Prozesses ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Prozess %s ist ein Fehler aufgetreten',
        'Could not get data for ProcessID %s' => 'Konnte Daten für ProzessID %s nicht ermitteln',
        'There was an error updating the Process' => 'Beim Aktualisieren des Prozesses ist ein Fehler aufgetreten',
        'Process: %s could not be deleted' => 'Prozess %s konnte nicht gelöscht werden',
        'There was an error synchronizing the processes.' => 'Beim Synchronisieren des Prozesses ist ein Fehler aufgetreten.',
        'The %s:%s is still in use' => 'Der/die/das %s:%s ist noch in Benutzung',
        'The %s:%s has a different EntityID' => 'Der/die/das %s:%s hat eine abweichende EntityID',
        'Could not delete %s:%s' => 'Konnte %s:%s nicht löschen',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Beim Setzen des Synchronisations-Status für %s %s ist ein Fehler aufgetreten',
        'Could not get %s' => 'Konnte %s nicht ermitteln',
        'Need %s!' => 'Benötige %s!',
        'Process: %s is not Inactive' => 'Prozess: %s ist nicht aktiv',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Beim Generieren einer neuen EntityID für diese Aktivität ist ein Fehler aufgetreten',
        'There was an error creating the Activity' => 'Beim Erstellen der Aktivität ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Aktivität %s ist ein Fehler aufgetreten',
        'Need ActivityID!' => 'Benötige ActivityID!',
        'Could not get data for ActivityID %s' => 'Konnte Daten für ActivityID %s nicht ermitteln',
        'There was an error updating the Activity' => 'Beim Aktualisieren der Aktivität ist ein Fehler aufgetreten',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Fehlende Parameter: Benötige Aktivität und Aktivitätsdialog!',
        'Activity not found!' => 'Aktivität nicht gefunden!',
        'ActivityDialog not found!' => 'Aktivitätsdialog nicht gefunden!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'Aktivitätsdialog wurde der Aktivität bereits zugeordnet. Sie können denselben Aktivitätsdialog nicht mehrfach zuordnen!',
        'Error while saving the Activity to the database!' => 'Während des Speicherns der Aktivität ist ein Fehler aufgetreten!',
        'This subaction is not valid' => 'Diese Unteraktion ist ungültig',
        'Edit Activity "%s"' => 'Aktivität "%s" bearbeiten',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Beim Generieren einer neuen EntityID für diesen Aktivitätsdialog ist ein Fehler aufgetreten',
        'There was an error creating the ActivityDialog' => 'Beim Erstellen des Aktivitätsdialogs ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Aktivitätsdialog %s ist ein Fehler aufgetreten',
        'Need ActivityDialogID!' => 'Benötige ActivityDialogID!',
        'Could not get data for ActivityDialogID %s' => 'Konnte Daten für ActivityDialogID %s nicht ermitteln',
        'There was an error updating the ActivityDialog' => 'Beim Aktualisieren des Aktivitätsdialogs ist ein Fehler aufgetreten',
        'Edit Activity Dialog "%s"' => 'AktivitätsDialog "%s" bearbeiten',
        'Agent Interface' => 'Agenten-Interface',
        'Customer Interface' => 'Kunden-Oberfläche',
        'Agent and Customer Interface' => 'Agenten- und Kunden-Oberfläche',
        'Do not show Field' => 'Feld nicht anzeigen',
        'Show Field' => 'Feld anzeigen',
        'Show Field As Mandatory' => 'Als Pflichtfeld anzeigen',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Pfad bearbeiten',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Beim Generieren einer neuen Entity-ID für diesen Übergang ist ein Fehler aufgetreten',
        'There was an error creating the Transition' => 'Beim Erstellen der Transition ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Beim Setzen des Synchronisations-Status für Übergang %s ist ein Fehler aufgetreten',
        'Need TransitionID!' => 'Benötige TransitionID!',
        'Could not get data for TransitionID %s' => 'Konnte Daten für TransitionID %s nicht ermitteln',
        'There was an error updating the Transition' => 'Beim Aktualisieren des Übergangs ist ein Fehler aufgetreten',
        'Edit Transition "%s"' => 'Bearbeite Transition %s',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'Mindestens ein gültiger Konfigurationsparameter wird benötigt.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Beim Generieren einer neuen Entity-ID für diese Übergangsaktion ist ein Fehler aufgetreten',
        'There was an error creating the TransitionAction' => 'Beim Erstellen der Übergangsaktion ist ein Fehler aufgetreten',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Beim Setzen des Synchronisations-Status der Übergangsaktion %s ist ein Fehler aufgetreten',
        'Need TransitionActionID!' => 'Benötige TransitionActionID!',
        'Could not get data for TransitionActionID %s' => 'Konnte Daten für TransitionActionID %s nicht ermitteln',
        'There was an error updating the TransitionAction' => 'Beim Aktualisieren der Übergangsaktion ist ein Fehler aufgetreten',
        'Edit Transition Action "%s"' => 'Bearbeite Transition-Aktion %s',
        'Error: Not all keys seem to have values or vice versa.' => 'Fehler: Es scheint, als wären nicht allen Schlüsseln auch Werte zugewiesen (oder umgekehrt).',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Queue updated!' => 'Queue aktualisiert!',
        'Don\'t use :: in queue name!' => 'Bitte nutzen Sie innerhalb eines Queue-Namens nicht "::"!',
        'Click back and change it!' => 'Bitte gehen Sie zurück und ändern Sie es!',
        '-none-' => '-keine-',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Queues (ohne automatische Antworten)',

        # Perl Module: Kernel/Modules/AdminQueueTemplates.pm
        'Change Queue Relations for Template' => 'Zuordnung von Vorlage zu Queue verändern',
        'Change Template Relations for Queue' => 'Vorlagen-Zuordnungen für Queue verändern',

        # Perl Module: Kernel/Modules/AdminRole.pm
        'Role updated!' => 'Rolle aktualisiert!',
        'Role added!' => 'Rolle hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminRoleGroup.pm
        'Change Group Relations for Role' => 'Gruppen-Zuordnungen für Rolle ändern',
        'Change Role Relations for Group' => 'Rollen-Zuordnungen für Gruppe ändern',

        # Perl Module: Kernel/Modules/AdminRoleUser.pm
        'Role' => 'Rolle',
        'Change Role Relations for Agent' => 'Rollen-Zuordnungen für Agenten ändern',
        'Change Agent Relations for Role' => 'Agenten-Zuordnungen für Rolle ändern',

        # Perl Module: Kernel/Modules/AdminSLA.pm
        'Please activate %s first!' => 'Bitte %s zuerst aktivieren!',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'Die S/MIME-Umgebung funktioniert derzeit nicht. Bitte prüfen Sie das Systemprotokoll für mehr Informationen!',
        'Need param Filename to delete!' => 'Benötige Parameter "Filename" zum Löschen!',
        'Need param Filename to download!' => 'Benötige Parameter "Filename" zum Herunterladen!',
        'Needed CertFingerprint and CAFingerprint!' => 'Benötige CertFingerprint und CAFingerprint!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint und CertFingerprint müssen unterschiedlich sein',
        'Relation exists!' => 'Beziehung existiert!',
        'Relation added!' => 'Beziehung hinzugefügt!',
        'Impossible to add relation!' => 'Beziehung konnte nicht hinzugefügt werden!',
        'Relation doesn\'t exists' => 'Beziehung existiert nicht',
        'Relation deleted!' => 'Beziehung gelöscht!',
        'Impossible to delete relation!' => 'Beziehung konnte nicht gelöscht werden!',
        'Certificate %s could not be read!' => 'Zertifikat %s konnte nicht gelesen werden!',
        'Handle Private Certificate Relations' => 'Zuordnungen von privaten Zertifikaten verwalten',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation added!' => 'Begrüßung hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminSignature.pm
        'Signature updated!' => 'Signatur aktualisiert!',
        'Signature added!' => 'Signatur hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminState.pm
        'State added!' => 'Status hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'Datei %s kann nicht gelesen werden!',

        # Perl Module: Kernel/Modules/AdminSystemAddress.pm
        'System e-mail address added!' => 'System-E-Mail-Adresse hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminSystemConfiguration.pm
        'Invalid Settings' => 'Ungültige Einstellungen',
        'There are no invalid settings active at this time.' => 'Derzeit sind keine ungültigen Einstellungen aktiv.',
        'You currently don\'t have any favourite settings.' => 'Sie haben derzeit keine Einstellungen als Favorit gespeichert.',
        'The following settings could not be found: %s' => 'Die folgenden Einstellungen wurden nicht gefunden: %s',
        'Import not allowed!' => 'Import nicht erlaubt!',
        'System Configuration could not be imported due to an unknown error, please check Znuny logs for more information.' =>
            'Systemkonfiguration konnte nicht importiert werden, aufgrund eines unbekannten Fehlers. Bitte überprüfe Sie das Systemprotokoll für weitergehende Informationen.',
        'Category Search' => 'Kategoriesuche',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationDeployment.pm
        'Some imported settings are not present in the current state of the configuration or it was not possible to update them. Please check the Znuny log for more information.' =>
            'Einige importierte Einstellungen sind im derzeitigen Stand der Konfiguration entweder nicht vorhanden, oder sie konnten nicht aktualisiert werden. Bitte prüfen Sie das Systemprotokoll für weitere Informationen.',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationGroup.pm
        'You need to enable the setting before locking!' => 'Sie müssen die Einstellung vor der Bearbeitung aktivieren!',
        'You can\'t work on this setting because %s (%s) is currently working on it.' =>
            'Sie können diese Einstellung nicht bearbeiten, da sie derzeit von %s (%s) bearbeitet wird.',
        'Missing setting name!' => 'Name der Einstellung fehlt!',
        'Missing ResetOptions!' => 'ResetOptions fehlen!',
        'System was not able to lock the setting!' => 'Einstellung konnte nicht zur Bearbeitung gesperrt werden!',
        'System was unable to update setting!' => 'Einstellung konnte nicht aktualisiert werden!',
        'Missing setting name.' => 'Name der Einstellung fehlt.',
        'Setting not found.' => 'Einstellung nicht gefunden.',
        'Missing Settings!' => 'Fehlende Einstellungen!',

        # Perl Module: Kernel/Modules/AdminSystemFiles.pm
        'Package files - %s' => 'Paketdateien - %s',
        '(Files where only the permissions have been changed will not be displayed.)' =>
            '(Dateien bei denen nur die Permissions geändert wurde, werden nicht angezeigt.)',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => 'Das Startdatum sollte nicht nach dem Enddatum liegen!',
        'There was an error creating the System Maintenance' => 'Beim Erstellen der Systemwartung ist ein Fehler aufgetreten',
        'Need SystemMaintenanceID!' => 'Benötige SystemMaintenanceID!',
        'Could not get data for SystemMaintenanceID %s' => 'Konnte Daten für SystemMaintenanceID %s nicht ermitteln',
        'System Maintenance was added successfully!' => 'Systemwartung erfolgreich hinzugefügt!',
        'System Maintenance was updated successfully!' => 'Systemwartung erfolgreich aktualisiert!',
        'Session has been killed!' => 'Sitzung wurde beendet!',
        'All sessions have been killed, except for your own.' => 'Alle Sitzungen wurden beendet, außer Ihrer eigenen.',
        'There was an error updating the System Maintenance' => 'Beim Aktualisieren der Systemwartung ist ein Fehler aufgetreten',
        'Was not possible to delete the SystemMaintenance entry: %s!' => 'Eintrag %s für Systemwartung konnte nicht gelöscht werden!',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Vorlage aktualisiert!',

        # Perl Module: Kernel/Modules/AdminTemplateAttachment.pm
        'Change Attachment Relations for Template' => 'Anhangs-Zuordnungen für Vorlage verändern',
        'Change Template Relations for Attachment' => 'Vorlagen-Zuordnungen für Anhang verändern',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => 'Typ benötigt!',
        'Type added!' => 'Typ hinzugefügt!',

        # Perl Module: Kernel/Modules/AdminUser.pm
        'Agent updated!' => 'Agent aktualisiert!',

        # Perl Module: Kernel/Modules/AdminUserGroup.pm
        'Change Group Relations for Agent' => 'Gruppen-Zuordnungen für Agenten ändern',
        'Change Agent Relations for Group' => 'Agenten-Zuordnungen für Gruppe ändern',

        # Perl Module: Kernel/Modules/AgentAppointmentAgendaOverview.pm
        'Month' => 'Monat',
        'Week' => 'Woche',
        'Day' => 'Tag',

        # Perl Module: Kernel/Modules/AgentAppointmentCalendarOverview.pm
        'All appointments' => 'Alle Termine',
        'Appointments assigned to me' => 'Mir zugewiesene Termine',
        'Showing only appointments assigned to you! Change settings' => 'Es werden nur Termine angezeigt, die Ihnen zugewiesen sind! Einstellungen ändern',

        # Perl Module: Kernel/Modules/AgentAppointmentEdit.pm
        'Appointment not found!' => 'Termin wurde nicht gefunden!',
        'Never' => 'Niemals',
        'Every Day' => 'Jeden Tag',
        'Every Week' => 'Jede Woche',
        'Every Month' => 'Jeden Monat',
        'Every Year' => 'Jedes Jahr',
        'Custom' => 'Benutzerdefiniert',
        'Daily' => 'Täglich',
        'Weekly' => 'Wöchentlich',
        'Monthly' => 'Monatlich',
        'Yearly' => 'Jährlich',
        'every' => 'alle',
        'for %s time(s)' => 'für %s Wiederholungen',
        'until ...' => 'bis ...',
        'for ... time(s)' => 'für ... Wiederholungen',
        'until %s' => 'bis %s',
        'No notification' => 'Keine Benachrichtigung',
        '%s minute(s) before' => '%s Minute(n) vorher',
        '%s hour(s) before' => '%s Stunde(n) vorher',
        '%s day(s) before' => '%s Tag(e) vorher',
        '%s week before' => '%s Woche(n) vorher',
        'before the appointment starts' => 'bevor der Termin beginnt',
        'after the appointment has been started' => 'nachdem der Termin begonnen hat',
        'before the appointment ends' => 'bevor der Termin endet',
        'after the appointment has been ended' => 'nachdem der Termin geendet hat',
        'No permission!' => 'Keine Berechtigung!',
        'Cannot delete ticket appointment!' => 'Ticket-Termin konnte nicht gelöscht werden!',
        'No permissions!' => 'Keine Berechtigung!',

        # Perl Module: Kernel/Modules/AgentAppointmentList.pm
        '+%s more' => '%s weitere',

        # Perl Module: Kernel/Modules/AgentCustomerSearch.pm
        'Customer History' => 'Kundenhistorie',

        # Perl Module: Kernel/Modules/AgentCustomerUserAddressBook.pm
        'No RecipientField is given!' => 'RecipientField fehlt!',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => 'Keine solche Konfiguration für %s',
        'Statistic' => 'Statistik',
        'No preferences for %s!' => 'Keine Einstellungen für %s!',
        'Can\'t get element data of %s!' => 'Konnte Daten zu Element %s nicht ermitteln!',
        'Can\'t get filter content data of %s!' => 'Kann Filter-Daten von %s nicht ermitteln!',
        'Customer Name' => 'Kundenname',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => 'Benötige SourceObject und SourceKey!',
        'You need ro permission!' => 'Sie benötigen die ro-Berechtigung!',
        'Can not delete link with %s!' => 'Kann Verknüpfung mit %s nicht entfernen!',
        '%s Link(s) deleted successfully.' => '%s Verknüpfung(en) erfolgreich gelöscht.',
        'Can not create link with %s! Object already linked as %s.' => 'Kann Verknüpfung zu %s nicht erstellen! Objekt bereits verknüpft als %s.',
        'Can not create link with %s!' => 'Kann Verknüpfung mit %s nicht erstellen!',
        '%s links added successfully.' => '%s Verknüpfung(en) erfolgreich hinzugefügt.',
        'The object %s cannot link with other object!' => 'Objekt %s kann nicht mit anderen Objekten verknüpft werden!',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => 'Parameter "Group" wird benötigt!',

        # Perl Module: Kernel/Modules/AgentSplitSelection.pm
        'Process ticket' => 'Prozess-Ticket',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Parameter %s fehlt.',
        'Invalid Subaction.' => 'Ungültige Unteraktion.',
        'Statistic could not be imported.' => 'Statistik konnte nicht importiert werden.',
        'Please upload a valid statistic file.' => 'Bitte laden Sie eine gültige Statistikdatei hoch.',
        'Export: Need StatID!' => 'Export: Benötige StatID!',
        'Delete: Get no StatID!' => 'Löschen: Keine StatID empfangen!',
        'Need StatID!' => 'Benötige StatID!',
        'Could not load stat.' => 'Konnte Statistik nicht laden.',
        'Add New Statistic' => 'Neue Statistik hinzufügen',
        'Could not create statistic.' => 'Konnte Statistik nicht erstellen.',
        'Run: Get no %s!' => 'Durchlauf: Kein(e) %s empfangen!',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => 'Keine TicketID übermittelt!',
        'You need %s permissions!' => 'Sie benötigen die %s-Berechtigung!',
        'Loading draft failed!' => 'Laden des Entwurfs fehlgeschlagen!',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Entschuldigung, Sie müssen Besitzer des Tickets sein, um diese Aktion ausführen zu können.',
        'Please change the owner first.' => 'Bitte ändern Sie zunächst den Besitzer.',
        'FormDraft functionality disabled!' => 'Die Entwurfsfunktion ist nicht aktiviert!',
        'Draft name is required!' => 'Name benötigt!',
        'FormDraft name %s is already in use!' => 'Der Name %s ist bereits vergeben!',
        'Could not perform validation on field %s!' => 'Konnte Validierung auf Feld %s nicht ausführen!',
        'No subject' => 'Kein Betreff',
        'Could not delete draft!' => 'Entwurf konnte nicht gelöscht werden!',
        'Previous Owner' => 'Vorheriger Besitzer',
        'wrote' => 'schrieb',
        'Message from' => 'Nachricht von',
        'End message' => 'Ende der Nachricht',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s wird benötigt!',
        'Plain article not found for article %s!' => 'Nur-Text-Version für Artikel %s nicht gefunden!',
        'Article does not belong to ticket %s!' => 'Artikel gehört nicht zu Ticket %s!',
        'Can\'t bounce email!' => 'Kann E-Mail nicht abweisen!',
        'Can\'t send email!' => 'Kann E-Mail nicht senden!',
        'Wrong Subaction!' => 'Falsche Unteraktion!',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => 'Kann Tickets nicht sperren, keine TicketIDs übermittelt!',
        'Ticket (%s) is not unlocked!' => 'Ticket %s ist nicht entsperrt!',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to tickets: %s.' =>
            'Die folgenden Tickets wurden ignoriert, weil sie durch einen anderen Agenten gesperrt sind oder keine Schreibberechtigung für diese Tickets vorliegt: %s.',
        'The following ticket was ignored because it is locked by another agent or you don\'t have write access to ticket: %s.' =>
            'Das folgende Ticket wurde ignoriert, weil es durch einen anderen Agenten gesperrt sind oder keine Schreibberechtigung für dieses Ticket vorliegt: %s.',
        'You need to select at least one ticket.' => 'Sie müssen mindestens ein Ticket auswählen.',
        'Bulk feature is not enabled!' => 'Das Stapelverarbeitungs-Feature ist nicht aktiviert!',
        'No selectable TicketID is given!' => 'Keine auswählbare TicketID übermittelt!',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            'Sie haben entweder kein Ticket ausgewählt, oder nur Tickets, die von anderen Agenten gesperrt sind.',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            'Die folgenden Tickets wurden ignoriert, weil sie für einen anderen Agenten gesperrt sind oder keine Schreibberechtigung für diese Tickets vorliegt: %s.',
        'The following tickets were locked: %s.' => 'Die folgenden Tickets wurden gesperrt: %s.',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Article subject will be empty if the subject contains only the ticket hook!' =>
            'Der Betreff des Artikels ist leer, wenn der Betreff nur den Ticket-Hook enthält!',
        'Address %s replaced with registered customer address.' => 'Adresse %s wurde durch die Adresse des eingetragenen Kunden ersetzt.',
        'Customer user automatically added in Cc.' => 'Kundenbenutzer wurde automatisch ins Cc eingetragen.',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'Ticket "%s" created!' => 'Ticket "%s" erstellt!',
        'No Subaction!' => 'Keine Unteraktion!',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => 'Keine TicketID empfangen!',
        'System Error!' => 'Systemfehler!',

        # Perl Module: Kernel/Modules/AgentTicketEmailResend.pm
        'No ArticleID is given!' => 'Keine ArticleID vorhanden!',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Next week' => 'Nächste Woche',
        'Ticket Escalation View' => 'Ansicht nach Ticket-Eskalationen',

        # Perl Module: Kernel/Modules/AgentTicketForward.pm
        'Article %s could not be found!' => 'Artikel %s nicht gefunden!',
        'Forwarded message from' => 'Weitergeleitete Nachricht von',
        'End forwarded message' => 'Ende der weitergeleiteten Nachricht',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => 'Kann Historie nicht anzeigen, keine TicketID empfangen!',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => 'Kann Ticket nicht sperren, keine TicketID empfangen!',
        'Sorry, the current owner is %s!' => 'Entschuldigung, der aktuelle Besitzer ist %s!',
        'Please become the owner first.' => 'Bitte werden Sie zuerst der Besitzer.',
        'Ticket (ID=%s) is locked by %s!' => 'Ticket (ID=%s) ist durch %s gesperrt!',
        'Change the owner!' => 'Ändern Sie den Besitzer!',

        # Perl Module: Kernel/Modules/AgentTicketLockedView.pm
        'New Article' => 'Neuer Artikel',
        'Pending' => 'Warten',
        'Reminder Reached' => 'Erinnerung erreicht',
        'My Locked Tickets' => 'Meine gesperrten Tickets',

        # Perl Module: Kernel/Modules/AgentTicketMentionView.pm
        'New mention' => 'Neue Erwähnung',
        'My Mentions' => 'Meine Erwähnungen',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => 'Kann Ticket nicht mit sich selbst zusammenführen!',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Sie benötigen die "Verschieben"-Berechtigung!',

        # Perl Module: Kernel/Modules/AgentTicketPhoneCommon.pm
        'Ticket locked.' => 'Ticket gesperrt.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => 'Keine ArticleID!!',
        'This is not an email article.' => 'Dies ist kein E-Mail-Artikel.',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            'Konnte Nur-Text-Artikel nicht lesen. Möglicherweise existiert die Nur-Text-Version nicht. Bitte lesen Sie die Backend-Nachricht.',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => 'TicketID benötigt!',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => 'Konnte ActivityDialogEntityID %s nicht ermitteln!',
        'No Process configured!' => 'Kein Prozess konfiguriert!',
        'The selected process is invalid!' => 'Der ausgewählte Prozess ist ungültig!',
        'Process %s is invalid!' => 'Prozess %s ist ungültig!',
        'Subaction is invalid!' => 'Unteraktion ist ungültig!',
        'Parameter %s is missing in %s.' => 'Parameter %s fehlt in %s.',
        'No ActivityDialog configured for %s in _RenderAjax!' => 'Kein Aktivitätsdialog für %s in _RenderAjax definiert!',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            'Keine Start-ActivityEntityID oder Start-ActivityDialogEntityID für Process %s in _GetParam empfangen!',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => 'Konnte Ticket für TicketID %s in _GetParam nicht ermitteln!',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            'Konnte ActivityEntityID nicht ermitteln. Dynamisches Feld oder Konfiguration nicht korrekt!',
        'Process::Default%s Config Value missing!' => 'Process::Default%s Konfigurationswert fehlt!',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            'Weder ProcessEntityID, noch TicketID und ActivityDialogEntityID empfangen!',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            'Kann StartActivityDialog für ProcessEntityID "%s" nicht ermitteln!',
        'Can\'t get Ticket "%s"!' => 'Kann Ticket "%s" nicht ermitteln!',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            'Kann ProcessEntityID oder ActivityEntityID für Ticket "%s" nicht ermitteln!',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            'Kann Aktivitäts-Konfiguration für ActivityEntityID "%s" nicht ermitteln!',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            'Kann Aktivitätsdialog-Konfiguration für ActivityDialogEntityID "%s" nicht ermitteln!',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => 'Kann Daten für Feld "%s" von Aktivitätsdialog "%s" nicht ermitteln!',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            'Wartezeit kann nur verwendet werden, wenn Status oder StatusID für den Aktivitätsdialog konfiguriert sind. Aktivitätsdialog: %s!',
        'Pending Date' => 'Warten bis',
        'for pending* states' => 'für warten* Status',
        'ActivityDialogEntityID missing!' => 'ActivityDialogEntityID wird benötigt!',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => 'Konnte Konfiguration für ActivityDialogEntityID "%s" nicht ermitteln!',
        'Couldn\'t use CustomerID as an invisible field.' => 'CustomerID konnte nicht als unsichtbares Feld verwendet werden.',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            'ProcessEntityID fehlt, bitte prüfen Sie Ihre ActivityDialogHeader.tt!',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            'Kein StartActivityDialog für Prozess "%s" konfiguriert!',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            'Konnte für den Prozess mit der ProcessEntityID "%s" kein Ticket erstellen!',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => 'Konnte ProcessEntityID "%s" nicht für Ticket "%s" setzen!',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => 'Konnte ActivityEntityID "%s" nicht für Ticket "%s" setzen!',
        'Could not store ActivityDialog, invalid TicketID: %s!' => 'Konnte Aktivitätsdialog nicht speichern, ungültige TicketID: %s!',
        'Invalid TicketID: %s!' => 'Ungültige TicketID: %s!',
        'Missing ActivityEntityID in Ticket %s!' => 'ActivityEntityID fehlt für Ticket %s!',
        'This step does not belong anymore to the current activity in process for ticket \'%s%s%s\'! Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            'Dieser Schritt gehört nicht mehr der aktuellen Prozess-Aktivität von Ticket \'%s%s%s\'! Ein anderer Anwender hat das Ticket inzwischen verändert. Bitte schließen Sie dieses Fenster und laden Sie das Ticket erneut.',
        'Missing ProcessEntityID in Ticket %s!' => 'ProcessEntityID fehlt für Ticket %s!',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte Wert des Dynamischen Feldes %s für TicketID %s im Aktivitätsdialog "%s" nicht speichern!',
        'Could not set attachments for ticket with ID %s in activity dialog "%s"!' =>
            'Anhänge für Ticket mit ID %s konnten in Aktivitätsdialog "%s" nicht gesetzt werden!',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte Wartezeit %s für TicketID %s im Aktivitätsdialog "%s" nicht speichern!',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            'Falsche Feldkonfiguration im Aktivitätsdialog: %s kann für Anzeige nicht den Wert 1 (= Feld anzeigen) haben. Bitte ändern Sie die Konfiguration auf Anzeige => 0 (Feld nicht anzeigen) oder Anzeige => 2 (als Pflichtfeld anzeigen)!',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            'Konnte %s für TicketID "%s" im Aktivitätsdialog "%s" nicht setzen!',
        'Default Config for Process::Default%s missing!' => 'Standardkonfiguration für Process::Default%s fehlt!',
        'Default Config for Process::Default%s invalid!' => 'Standardkonfiguration für Process::Default%s ungültig!',

        # Perl Module: Kernel/Modules/AgentTicketQueue.pm
        'Available tickets' => 'Verfügbare Tickets',
        'including subqueues' => 'untergeordnete Queues miteinbeziehen',
        'excluding subqueues' => 'untergeordnete Queues ausschließen',
        'QueueView' => 'Queue-Ansicht',

        # Perl Module: Kernel/Modules/AgentTicketResponsibleView.pm
        'My Responsible Tickets' => 'Meine verantwortlichen Tickets',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'last-search' => 'Letzte Suche',
        'Untitled' => 'Unbenannt',
        'Ticket Number' => 'Ticket-Nummer',
        'Ticket' => 'Ticket',
        'printed by' => 'gedruckt von',
        'CustomerID (complex search)' => 'Kundennummer (komplexe Suche)',
        'CustomerID (exact match)' => 'Kundennummer (genaue Übereinstimmung)',
        'Invalid Users' => 'Ungültige Benutzer',
        'Normal' => 'Normal',
        'CSV' => 'CSV',
        'Excel' => 'Excel',
        'in more than ...' => 'in mehr als ...',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'Funktion nicht aktiviert!',
        'Service View' => 'Ansicht nach Services',

        # Perl Module: Kernel/Modules/AgentTicketStatusView.pm
        'Status View' => 'Ansicht nach Status',

        # Perl Module: Kernel/Modules/AgentTicketWatchView.pm
        'My Watched Tickets' => 'Meine beobachteten Tickets',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'Funktion ist nicht aktiv',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'This ticket does not exist, or you don\'t have permissions to access it in its current state.' =>
            'Dieses Ticket existiert nicht oder Sie haben keine Berechtigung, auf dieses Ticket in seinem aktuellen Status zuzugreifen.',
        'Missing FormDraftID!' => 'Fehlende FormDraftID!',
        'Can\'t get for ArticleID %s!' => 'Konnte Artikel-ID %s nicht ermitteln!',
        'Article filter settings were saved.' => 'Artikelfilter-Einstellungen wurden gespeichert.',
        'Event type filter settings were saved.' => 'Event-Typ-Filtereinstellungen wurden gespeichert.',
        'Need ArticleID!' => 'Benötige ArticleID!',
        'Invalid ArticleID!' => 'Ungültige ArticleID!',
        'Forward article via mail' => 'Artikel per E-Mail weiterleiten',
        'Forward' => 'Weiterleiten',
        'Fields with no group' => 'Felder ohne Gruppe',
        'Invisible only' => 'Nur unsichtbar',
        'Visible only' => 'Nur sichtbar',
        'Visible and invisible' => 'Sichtbar und unsichtbar',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'Artikel konnte nicht geöffnet werden. Befindet er sich vielleicht auf einer anderen Artikelseite?',
        'Show one article' => 'Einen Artikel anzeigen',
        'Show all articles' => 'Alle Artikel anzeigen',

        # Perl Module: Kernel/Modules/AjaxAttachment.pm
        'Got no FormID.' => 'FormID fehlt.',
        'Error: the file could not be deleted properly. Please contact your administrator (missing FileID).' =>
            'Fehler: die Datei konnte nicht korrekt gelöscht werden. Bitte kontaktieren Sie Ihren Administrator (fehlende FileID).',

        # Perl Module: Kernel/Modules/CustomerTicketArticleContent.pm
        'ArticleID is needed!' => 'ArticleID wird benötigt!',
        'No TicketID for ArticleID (%s)!' => 'Keine TicketID für ArticleID (%s)!',
        'HTML body attachment is missing!' => 'HTML-Body-Anhang fehlt!',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => 'FileID und ArticleID werden benötigt!',
        'No such attachment (%s)!' => 'Anlage nicht gefunden (%s)!',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => 'Prüfen Sie die Sysconfig-Einstellungen für %s::QueueDefault.',
        'Check SysConfig setting for %s::TicketTypeDefault.' => 'Prüfen Sie die Sysconfig-Einstellungen für %s::TicketTypeDefault.',
        'You don\'t have sufficient permissions for ticket creation in default queue.' =>
            'Sie haben keine ausreichenden Rechte zur Ticket-Anlage in der Default-Queue.',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => 'Benötige CustomerID!',
        'My Tickets' => 'Meine Tickets',
        'Company Tickets' => 'Firmen-Tickets',
        'Untitled!' => 'Unbenannt!',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Customer Realname' => 'Kundenname',
        'Created within the last' => 'Erstellt innerhalb der letzten',
        'Created more than ... ago' => 'Erstellt vor mehr als ...',
        'Please remove the following words because they cannot be used for the search:' =>
            'Bitte entfernen Sie die folgenden Suchworte, da sie nicht für die Suche verwendet werden können:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => 'Konnte Ticket nicht wieder eröffnen. In dieser Queue nicht möglich!',
        'Create a new ticket!' => 'Neues Ticket erstellen!',

        # Perl Module: Kernel/Modules/Installer.pm
        'SecureMode active!' => 'SecureMode ist aktiv!',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            'Wenn Sie den Installer erneut ausführen wollen, schalten Sie "SecureMode" in der SysConfig ab.',
        'Directory "%s" doesn\'t exist!' => 'Verzeichnis "%s" existiert nicht!',
        'Configure "Home" in Kernel/Config.pm first!' => 'Konfigurieren Sie zuerst "Home" in Kernel/Config.pm!',
        'File "%s/Kernel/Config.pm" not found!' => 'Datei "%s/Kernel/Config.pm" wurde nicht gefunden!',
        'Directory "%s" not found!' => 'Verzeichnis "%s" nicht gefunden!',
        'Install Znuny' => 'Znuny installieren',
        'Intro' => 'Einführung',
        'Kernel/Config.pm isn\'t writable!' => 'Kernel/Config.pm ist nicht schreibbar!',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            'Wenn Sie den Installer verwenden möchten, stellen Sie sicher, dass Kernel/Config.pm durch den Webserver-Benutzer schreibbar ist!',
        'Database Selection' => 'Datenbank-Auswahl',
        'Unknown Check!' => 'Unbekannte Prüfung!',
        'The check "%s" doesn\'t exist!' => 'Die Prüfung "%s" existiert nicht!',
        'Enter the password for the database user.' => 'Geben Sie das Passwort für den Datenbankbenutzer ein.',
        'Database %s' => 'Datenbank %s',
        'Configure MySQL' => 'MySQL konfigurieren',
        'Enter the password for the administrative database user.' => 'Geben Sie das Passwort für den Administrationsbenutzer der Datenbank ein.',
        'Configure PostgreSQL' => 'PostgreSQL konfigurieren',
        'Configure Oracle' => 'Oracle konfigurieren',
        'Unknown database type "%s".' => 'Unbekannter Datenbank-Typ "%s".',
        'Please go back.' => 'Bitte gehen Sie zurück.',
        'Create Database' => 'Datenbank erstellen',
        'Install Znuny - Error' => 'Znuny-Installation - Fehler',
        'File "%s/%s.xml" not found!' => 'Datei "%s/%s.xml" nicht gefunden!',
        'Contact your Admin!' => 'Kontaktieren Sie Ihren Administrator!',
        'System Settings' => 'System-Einstellungen',
        'Syslog' => 'Syslog',
        'Configure Mail' => 'E-Mail konfigurieren',
        'Mail Configuration' => 'Mail-Konfiguration',
        'Can\'t write Config file!' => 'Kann Konfigurationsdatei nicht schreiben!',
        'Unknown Subaction %s!' => 'Unbekannte Subaktion %s!',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            'Kann nicht zur Datenbank verbinden, Perl-Modul DBD::%s nicht installiert!',
        'Can\'t connect to database, read comment!' => 'Kann nicht zur Datenbank verbinden, bitte Hinweis lesen!',
        'Database already contains data - it should be empty!' => 'Die Datenbank enthält bereits Daten, obwohl sie leer sein sollte!',
        'Error: You have the wrong database version installed (%s). You need at least version %s! ' =>
            'Fehler: Sie haben eine falsche Datenbankversion installiert (%s). Sie benötigen mindestens Version %s!',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Fehler: Bitte stellen Sie sicher, dass Ihre Datenbank Pakete größer als %s MB akzeptiert (derzeit werden nur Pakete bis zu einer Größe von %s MB akzeptiert). Bitte passen Sie die Einstellung max_allowed_packet Ihrer Datenbank an, um Fehler zu vermeiden.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Fehler: Bitte erhöhen Sie den Wert für innodb_log_file_size in Ihrer Datenbank-Konfiguration auf mindestens %s MB (aktuell: %s MB, empfohlen: %s MB). Mehr Informationen finden Sie unter %s.',
        'Error: Please set the value for innodb_file_per_table on your database to ON.' =>
            'Fehler: Bitte setzen Sie den Wert für innodb_file_per_table in Ihrer Datenbank-Konfiguration auf ON.',
        'Error: Please set the value for innodb_default_row_format on your database to dynamic.' =>
            'Fehler: Bitte setzen Sie den Wert für innodb_default_row_format in Ihrer Datenbank-Konfiguration auf dynamic.',
        'Wrong default storage engine (%s is %s, but it needs to be InnoDB).' =>
            'Falsche Datenbank-Speicherengine (%s ist %s, muss aber InnoDB sein).',

        # Perl Module: Kernel/Modules/Mentions.pm
        '%s users will be mentioned' => '%s Benutzer werden erwähnt',

        # Perl Module: Kernel/Modules/PublicCalendar.pm
        'No %s!' => 'Kein %s!',
        'No such user!' => 'Kein Benutzer gefunden!',
        'Invalid calendar!' => 'Ungültiger Kalender!',
        'Invalid URL!' => 'Ungültige URL!',
        'There was an error exporting the calendar!' => 'Es ist ein Fehler beim Exportieren des Kalenders aufgetreten!',

        # Perl Module: Kernel/Modules/PublicRepository.pm
        'Need config Package::RepositoryAccessRegExp' => 'Benötige Konfiguration Package::RepositoryAccessRegExp',
        'Authentication failed from %s!' => 'Authentifizierung von %s fehlgeschlagen!',

        # Perl Module: Kernel/Output/HTML/Article/Chat.pm
        'Chat' => 'Chat',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketBounce.pm
        'Bounce Article to a different mail address' => 'Artikel per E-Mail umleiten',
        'Bounce' => 'Umleiten',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketCompose.pm
        'Reply All' => 'Allen antworten',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketEmailResend.pm
        'Resend this article' => 'Diesen Artikel erneut senden',
        'Resend' => 'Erneut senden',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketMessageLog.pm
        'View message log details for this article' => 'Das Nachrichtenprotokoll für diesen Artikel anzeigen',
        'Message Log' => 'Nachrichtenprotokoll',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNote.pm
        'Reply to note' => 'Auf Notiz antworten',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNoteToLinkedTicket.pm
        'Create notice for linked ticket' => 'Notiz für verlinktes Ticket erstellen',
        'Transfer notice' => 'Notiz übergeben',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPhone.pm
        'Split this article' => 'Diesen Artikel teilen',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPlain.pm
        'View the source for this Article' => 'Den Quelltext dieses Artikels anzeigen',
        'Plain Format' => 'Unformatierte Ansicht',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPrint.pm
        'Print this article' => 'Diesen Artikel drucken',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkArticleSeenUnseen.pm
        'Mark article as unseen' => 'Artikel als ungelesen markieren',
        'Mark as unseen' => 'Als ungelesen markieren',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkAsImportant.pm
        'Mark' => 'Markieren',
        'Unmark' => 'Markierung entfernen',

        # Perl Module: Kernel/Output/HTML/ArticleAction/ReinstallPackageLink.pm
        'Re-install Package' => 'Paket erneut installieren',
        'Re-install' => 'Erneut installieren',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Crypted' => 'Verschlüsselt',
        'Sent message encrypted to recipient!' => 'Nachricht verschlüsselt an Empfänger senden!',
        'Signed' => 'Signiert',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '"PGP SIGNED MESSAGE"-Header gefunden, aber ungültig!',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '"S/MIME SIGNED MESSAGE"-Header gefunden, aber ungültig!',
        'Ticket decrypted before' => 'Ticket wurde bereits entschlüsselt',
        'Impossible to decrypt: private key for email was not found!' => 'Entschlüsseln nicht möglich: Private Key für E-Mail nicht gefunden!',
        'Successful decryption' => 'Entschlüsseln erfolgreich',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Crypt.pm
        'There are no encryption keys available for the addresses: \'%s\'. ' =>
            'Es stehen keine Schlüssel zur Verfügung für die Adressen: \'%s\'. ',
        'There are no selected encryption keys for the addresses: \'%s\'. ' =>
            'Es sind keine Schlüssel ausgewählt für die Adressen: \'%s\'. ',
        'Cannot use expired encryption keys for the addresses: \'%s\'. ' =>
            'Kann abgelaufene Schlüssel für folgende Adressen nicht nutzen \'%s\'. ',
        'Cannot use revoked encryption keys for the addresses: \'%s\'. ' =>
            'Kann widerrufene Schlüssel für folgende Adressen nicht nutzen \'%s\'. ',
        'Encrypt' => 'Verschlüsseln',
        'Keys/certificates will only be shown for recipients with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            'Schlüssel/Zertifikate werden nur für Empfänger mit mehr als einem Schlüssel/Zertifikat angezeigt. Die erste gefundene Schlüssel/Zertifikat-Kombination wird vorausgewählt. Bitte stellen Sie sicher, die korrekte Kombination auszuwählen.',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Security.pm
        'Email security' => 'E-Mail-Sicherheit',
        'PGP sign' => 'PGP-Signierung',
        'PGP sign and encrypt' => 'PGP-Signierung und -Verschlüsselung',
        'PGP encrypt' => 'PGP-Verschlüsselung',
        'SMIME sign' => 'S/MIME-Signierung',
        'SMIME sign and encrypt' => 'S/MIME-Signierung und -Verschlüsselung',
        'SMIME encrypt' => 'S/MIME-Verschlüsselung',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Sign.pm
        'Cannot use expired signing key: \'%s\'. ' => 'Kann abgelaufenen Signierungsschlüssel nicht nutzen: \'%s\'. ',
        'Cannot use revoked signing key: \'%s\'. ' => 'Kann widerrufenen Signierungsschlüssel nicht nutzen: \'%s\'. ',
        'There are no signing keys available for the addresses \'%s\'.' =>
            'Es stehen keine Signierungsschlüssel zur Verfügung für die Adressen: \'%s\'.',
        'There are no selected signing keys for the addresses \'%s\'.' =>
            'Es sind keine Signierungsschlüssel ausgewählt für die Adressen: \'%s\'.',
        'Sign' => 'Signieren',
        'Keys/certificates will only be shown for a sender with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            'Schlüssel/Zertifikate werden nur für Absender mit mehr als einem Schlüssel/Zertifikat angezeigt. Die erste gefundene Schlüssel/Zertifikat-Kombination wird vorausgewählt. Bitte stellen Sie sicher, die korrekte Kombination auszuwählen.',

        # Perl Module: Kernel/Output/HTML/Dashboard/AppointmentCalendar.pm
        'Shown' => 'Angezeigt',
        'Refresh (minutes)' => 'Aktualisierung (Minuten)',
        'off' => 'aus',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerIDList.pm
        'Shown customer ids' => 'Angezeigte Kundennummern',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerUserList.pm
        'Shown customer users' => 'Angezeigte Kundenbenutzer',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => 'Die Startzeit eines Tickets wurde auf einen Zeitpunkt nach der Endzeit gesetzt!',

        # Perl Module: Kernel/Output/HTML/Dashboard/MyLastChangedTickets.pm
        'Shown Tickets' => 'Gezeigte Tickets',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => 'Kein Verbindungsaufbau zu %s möglich!',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'Shown Columns' => 'Gezeigte Spalten',
        'filter not active' => 'Filter nicht aktiv',
        'filter active' => 'Filter aktiv',
        'This ticket has no title or subject' => 'Dieses Ticket hat keinen Titel oder Betreff',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketStatsGeneric.pm
        '7 Day Stats' => '7-Tage-Statistik',

        # Perl Module: Kernel/Output/HTML/Dashboard/UserOnline.pm
        'User is currently offline.' => 'Benutzer ist derzeit offline.',
        'User is currently active.' => 'Benutzer ist gerade aktiv.',
        'User was inactive for a while.' => 'Benutzer war für eine Weile inaktiv.',
        'User set their status to unavailable.' => 'Benutzer hat seinen Status auf "nicht verfügbar" gesetzt.',
        'Away' => 'Abwesend',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'Standard' => 'Standard',
        'The following tickets are not updated: %s.' => 'Die folgenden Tickets werden nicht aktualisiert: %s.',
        'h' => 'h',
        'm' => 'm',
        'd' => 'd',
        'This ticket does not exist, or you don\'t have permissions to access it in its current state. You can take one of the following actions:' =>
            'Dieses Ticket existiert nicht oder Sie haben keine Berechtigung, auf dieses Ticket in seinem aktuellen Status zuzugreifen. Sie können eine der folgenden Optionen wählen:',
        'This is a' => 'Dies ist eine',
        'email' => 'E-Mail',
        'click here' => 'hier klicken',
        'to open it in a new window.' => 'um sie in einem neuen Fenster angezeigt zu bekommen.',
        'Year' => 'Jahr',
        'Hours' => 'Stunden',
        'Minutes' => 'Minuten',
        'Check to activate this date' => 'Auswählen, um dieses Datum zu aktivieren',
        '%s TB' => '%s TB',
        '%s GB' => '%s GB',
        '%s MB' => '%s MB',
        '%s KB' => '%s KB',
        '%s B' => '%s B',
        'No Permission!' => 'Keine Zugriffsrechte!',
        'No Permission' => 'Keine Berechtigung',
        'Show Tree Selection' => 'Baumauswahl anzeigen',
        'Split Quote' => 'Zitat aufteilen',
        'Remove Quote' => 'Zitat entfernen',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Verknüpft als',
        'Search Result' => 'Suchergebnis',
        'Linked' => 'Verknüpft',
        'Bulk' => 'Sammelaktion',

        # Perl Module: Kernel/Output/HTML/Layout/Ticket.pm
        'Lite' => 'Einfach',
        'Unread article(s) available' => 'Ungelesene Artikel verfügbar',

        # Perl Module: Kernel/Output/HTML/LinkObject/Appointment.pm
        'Appointment' => 'Termin',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => 'Archivsuche',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOnline.pm
        'Online Agent: %s' => 'Online-Agent: %s',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTicketEscalation.pm
        'There are more escalated tickets!' => 'Mehrere eskalierte Tickets vorhanden!',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTimeZoneCheck.pm
        'Please select a time zone in your preferences and confirm it by clicking the save button.' =>
            'Bitte wählen Sie eine Zeitzone in Ihren Einstellungen aus und bestätigen Sie dies durch Klicken der Speichern-Schaltfläche.',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerOnline.pm
        'Online Customer: %s' => 'Online-Kunde: %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'System maintenance is active!' => 'Systemwartung ist aktiv!',
        'A system maintenance period will start at: %s and is expected to stop at: %s' =>
            'Eine Systemwartung beginnt um: %s und endet voraussichtlich um: %s',

        # Perl Module: Kernel/Output/HTML/Notification/DaemonCheck.pm
        'Znuny Daemon is not running.' => 'Der Znuny Daemon läuft nicht.',

        # Perl Module: Kernel/Output/HTML/Notification/OAuth2TokenManagementTokenExpired.pm
        'OAuth2 token for "%s" has expired.' => 'OAuth2-Token für "%s" ist abgelaufen.',
        'OAuth2 refresh token for "%s" has expired.' => 'OAuth2-Refresh-Token für "%s" ist abgelaufen.',

        # Perl Module: Kernel/Output/HTML/Notification/OutofOfficeCheck.pm
        'You have Out of Office enabled, would you like to disable it?' =>
            'Sie haben die Abwesenheitszeit eingeschaltet, möchten Sie diese deaktivieren?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationInvalidCheck.pm
        'You have %s invalid setting(s) deployed. Click here to show invalid settings.' =>
            'Es wurden %s ungültige Einstellung(en) in Betrieb genommen. Klicken Sie hier, um die Einstellungen anzuzeigen.',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationIsDirtyCheck.pm
        'You have undeployed settings, would you like to deploy them?' =>
            'Es sind Einstellungen vorhanden, die bislang nicht in Betrieb genommen wurden. Möchten Sie jetzt eine Inbetriebnahme starten?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationOutOfSyncCheck.pm
        'The configuration is being updated, please be patient...' => 'Die Systemkonfiguration wird aktualisiert. Bitte haben Sie etwas Geduld.',
        'There is an error updating the system configuration!' => 'Beim Aktualisieren der Systemkonfiguration ist ein Fehler aufgetreten!',

        # Perl Module: Kernel/Output/HTML/Notification/UIDCheck.pm
        'Don\'t use the Superuser account to work with %s! Create new Agents and work with these accounts instead.' =>
            'Bitte nicht mit dem Superuser-Account in %s arbeiten! Bitte legen Sie neue Agenten an und nutzen Sie diese.',

        # Perl Module: Kernel/Output/HTML/Preferences/AppointmentNotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            'Bitte stellen Sie sicher, dass Sie für erforderliche Benachrichtigungen mindestens eine Benachrichtigungsmethode ausgewählt haben.',
        'Preferences updated successfully!' => 'Einstellungen erfolgreich aktualisiert!',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(in Arbeit)',

        # Perl Module: Kernel/Output/HTML/Preferences/MaxArticlesPerPage.pm
        'Max. number of articles per page must be between 1 and 1000 or empty.' =>
            'Max. Anzahl der Artikel pro Seite muss zwischen 1 und 1000 liegen oder nicht gefüllt sein.',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Bitte geben Sie ein Enddatum an, das nach dem Startdatum liegt.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Current password' => 'Aktuelles Passwort',
        'New password' => 'Neues Passwort',
        'Verify password' => 'Passwort verifizieren',
        'The current password is not correct. Please try again!' => 'Das eingegebene Passwort ist nicht korrekt. Bitte versuchen Sie es erneut!',
        'Please supply your new password!' => 'Bitte bestätigen Sie ihr neues Passwort!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Das Passwort kann nicht aktualisiert werden, da die Eingaben unterschiedlich sind. Bitte versuchen Sie es erneut!',
        'This password is forbidden by the current system configuration. Please contact the administrator if you have additional questions.' =>
            'Das Passwort ist aufgrund der aktuellen Systemkonfiguration nicht erlaubt. Bitte kontaktieren Sie den Administrator, wenn Sie weitere Fragen haben.',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens %s Zeichen lang sein!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase letter characters!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens 2 Groß- und 2 Kleinbuchstaben enthalten!',
        'Can\'t update password, it must contain at least 1 digit!' => 'Das Passwort kann nicht aktualisiert werden. Es muss mindestens eine Ziffer enthalten!',
        'Can\'t update password, it must contain at least 2 letter characters!' =>
            'Das Passwort kann nicht aktualisiert werden. Es muss mindestens 2 Zeichen enthalten!',

        # Perl Module: Kernel/Output/HTML/Preferences/TimeZone.pm
        'Time zone updated successfully!' => 'Zeitzone erfolgreich aktualisiert!',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'invalid' => 'ungültig',
        'valid' => 'gültig',
        'No (not supported)' => 'Nein (nicht unterstützt)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Kein relativer Zeitraum ausgewählt.',
        'The selected time period is larger than the allowed time period.' =>
            'Der ausgewählte Zeitraum ist größer als der erlaubte Zeitraum.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Keine Zeitskalierung für den aktuell ausgewählten Zeitskalierungswert der X-Achse verfügbar.',
        'The selected date is not valid.' => 'Das ausgewählte Datum ist ungültig.',
        'The selected end time is before the start time.' => 'Die ausgewählte Endzeit ist vor der Startzeit.',
        'There is something wrong with your time selection.' => 'Bitte überprüfen Sie Ihre Zeitauswahl.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Bitte wählen Sie nur ein Element oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Bitte wählen Sie nur ein Element oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select one element for the X-axis.' => 'Bitte wählen Sie ein Element für die X-Achse aus.',
        'You can only use one time element for the Y axis.' => 'Sie können nur ein Zeitelement für die Y-Achse verwenden.',
        'You can only use one or two elements for the Y axis.' => 'Sie können nur ein oder zwei Elemente für die Y-Achse verwenden.',
        'Please select at least one value of this field.' => 'Bitte wählen Sie mindestens einen Wert in diesem Feld aus.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Bitte geben Sie einen Wert an oder erlauben Sie die Bearbeitung zur Erstellzeit der Statistik.',
        'Please select a time scale.' => 'Bitte wählen Sie eine Zeitskala aus.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'Der ausgewählte Zeitraum ist zu klein, bitte nutzen Sie einen größeren Zeitmaßstab.',
        'second(s)' => 'Sekunde(n)',
        'quarter(s)' => 'Quartal(e)',
        'half-year(s)' => 'Halbjahr(e)',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Bitte entfernen Sie die folgenden Worte, da sie nicht für die Ticket-Einschränkung verwendet werden können: %s.',

        # Perl Module: Kernel/Output/HTML/SysConfig.pm
        'Cancel editing and unlock this setting' => 'Bearbeitung abbrechen und diese Einstellung freigeben',
        'Reset this setting to its default value.' => 'Einstellung auf Standardwert zurücksetzen.',
        'Unable to load %s!' => 'Kann %s nicht laden!',
        'Content' => 'Inhalt',

        # Perl Module: Kernel/Output/HTML/TicketMenu/Lock.pm
        'Unlock to give it back to the queue' => 'Zur Rückgabe an die Queue entsperren',
        'Lock it to work on it' => 'Zur Bearbeitung sperren',

        # Perl Module: Kernel/Output/HTML/TicketMenu/TicketWatcher.pm
        'Unwatch' => 'Nicht beobachten',
        'Watch' => 'Beobachten',
        'Add to list of watched tickets' => 'Zur Liste der beobachteten Tickets hinzufügen',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Sortieren nach',

        # Perl Module: Kernel/Output/HTML/TicketZoom/TicketInformation.pm
        'Ticket Information' => 'Ticket-Informationen',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketLocked.pm
        'Locked Tickets New' => 'Neue gesperrte Tickets',
        'Locked Tickets Reminder Reached' => 'Gesperrte Tickets, Erinnerungszeit erreicht',
        'Locked Tickets Total' => 'Gesperrte Tickets insgesamt',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketMention.pm
        'Total mentions' => 'Gesamte Erwähnungen',
        'Total new mentions' => 'Gesamte neue Erwähnungen',
        'New mentions' => 'Neue Erwähnungen',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketOwner.pm
        'Owned Tickets New' => 'Eigene Tickets Neu',
        'Owned Tickets Reminder Reached' => 'Eigene Tickets, Erinnerungszeit erreicht',
        'Owned Tickets Total' => 'Eigene Tickets Gesamt',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketResponsible.pm
        'Responsible Tickets New' => 'Neue verantwortliche Tickets',
        'Responsible Tickets Reminder Reached' => 'Verantwortliche Tickets, Erinnerungszeit erreicht',
        'Responsible Tickets Total' => 'Verantwortliche Tickets insgesamt',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketWatcher.pm
        'Watched Tickets New' => 'Neue beobachtete Tickets',
        'Watched Tickets Reminder Reached' => 'Beobachtete Tickets, Erinnerungszeit erreicht',
        'Watched Tickets Total' => 'Beobachtete Tickets insgesamt',

        # Perl Module: Kernel/Output/PDF/Ticket.pm
        'Ticket Dynamic Fields' => 'Dynamische Felder für Tickets',

        # Perl Module: Kernel/System/ACL/DB/ACL.pm
        'Couldn\'t read ACL configuration file. Please make sure the file is valid.' =>
            'Die ACL-Konfigurationsdatei konnte nicht gelesen werden. Bitte prüfen Sie, dass es sich um eine gültige Datei handelt.',

        # Perl Module: Kernel/System/Auth.pm
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Die Anmeldung ist derzeit aufgrund einer geplanten Systemwartung nicht verfügbar.',

        # Perl Module: Kernel/System/AuthSession.pm
        'Session limit reached! Please try again later.' => 'Maximale Anzahl an Sitzungen erreicht. Bitte versuchen Sie es später noch einmal.',
        'Session per user limit reached!' => 'Das Limit für Sitzungen pro Benutzer wurde erreicht!',

        # Perl Module: Kernel/System/AuthSession/DB.pm
        'Session invalid. Please log in again.' => 'Sitzung ungültig. Bitte neu anmelden.',
        'Session has timed out. Please log in again.' => 'Sitzung abgelaufen. Bitte neu anmelden.',

        # Perl Module: Kernel/System/Calendar/Event/Transport/Email.pm
        'PGP sign only' => 'Nur PGP-Signierung',
        'PGP encrypt only' => 'Nur PGP-Verschlüsselung',
        'SMIME sign only' => 'Nur S/MIME-Signierung',
        'SMIME encrypt only' => 'Nur S/MIME-Verschlüsselung',
        'PGP and SMIME not enabled.' => 'PGP und S/MIME sind nicht aktiviert.',
        'Skip notification delivery' => 'Zustellung der Benachrichtigung überspringen',
        'Send unsigned notification' => 'Unsignierte Benachrichtigung senden',
        'Send unencrypted notification' => 'Unverschlüsselte Benachrichtigung senden',

        # Perl Module: Kernel/System/Calendar/Plugin/Ticket/Create.pm
        'On the date' => 'Am Datum',

        # Perl Module: Kernel/System/CalendarEvents.pm
        'on' => 'an',
        'of year' => 'des Jahres',
        'of month' => 'des Monats',
        'all-day' => 'ganztägig',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Referenz der Konfigurationsoptionen',
        'This setting can not be changed.' => 'Diese Einstellung kann nicht geändert werden.',
        'This setting is not active by default.' => 'Diese Einstellung ist standardmäßig nicht aktiv.',
        'This setting can not be deactivated.' => 'Diese Einstellung kann nicht deaktiviert werden.',
        'This setting is not visible.' => 'Diese Einstellung ist nicht sichtbar.',
        'This setting can be overridden in the user preferences.' => 'Diese Einstellung kann in den Benutzereinstellungen überschrieben werden.',
        'This setting can be overridden in the user preferences, but is not active by default.' =>
            'Diese Einstellung kann in den Benutzereinstellungen überschrieben werden, ist aber standardmäßig nicht aktiv.',

        # Perl Module: Kernel/System/CustomerUser.pm
        'Customer user "%s" already exists.' => 'Kundenbenutzer "%s" existiert bereits.',

        # Perl Module: Kernel/System/CustomerUser/DB.pm
        'This email address is already in use for another customer user.' =>
            'Diese E-Mail-Adresse wird bereits für einen anderen Kundenbenutzer verwendet.',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseDateTime.pm
        'before/after' => 'vor/nach',
        'between' => 'zwischen',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => 'z.B. Text oder Te*t',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => 'Dieses Feld ignorieren.',

        # Perl Module: Kernel/System/DynamicField/Driver/TextArea.pm
        'This field is required or' => 'Dieses Feld ist ein Pflichtfeld oder',
        'The field content is too long!' => 'Der Feldinhalt ist zu lang!',
        'Maximum size is %s characters.' => 'Die Maximallänge beträgt %s Zeichen.',

        # Perl Module: Kernel/System/MailQueue.pm
        'Error while validating Message data.' => 'Fehler bei der Validierung der Nachrichtendaten.',
        'Error while validating Sender email address.' => 'Fehler bei der Validierung der Absender-E-Mail-Adresse.',
        'Error while validating Recipient email address.' => 'Fehler bei der Validierung der E-Mail-Adresse des Empfängers.',

        # Perl Module: Kernel/System/Mention.pm
        'LastMention' => 'Letzte Erwähnung',

        # Perl Module: Kernel/System/NotificationEvent.pm
        'Couldn\'t read Notification configuration file. Please make sure the file is valid.' =>
            'Die Benachrichtigungs-Konfigurationsdatei konnte nicht gelesen werden. Bitte prüfen Sie, dass es sich um eine gültige Datei handelt.',
        'Imported notification has body text with more than 4000 characters.' =>
            'Importierte Benachrichtigung hat einen Text mit mehr als 4000 Zeichen.',

        # Perl Module: Kernel/System/Package.pm
        'not installed' => 'nicht installiert',
        'installed' => 'installiert',
        'Unable to parse repository index document.' => 'Das Indexdokument des Verzeichnisses kann nicht gelesen werden.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Keine Pakete für Ihre Framework-Version in diesem Verzeichnis gefunden, es enthält nur Pakete für andere Framework-Versionen.',
        'File is not installed!' => 'Datei ist nicht installiert!',
        'File is different!' => 'Datei unterschiedlich!',
        'Can\'t read file!' => 'Datei kann nicht gelesen werden!',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process.pm
        'The process "%s" and all of its data has been imported successfully.' =>
            'Der Prozess "%s" und alle zugehörigen Daten wurden erfolgreich importiert.',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inaktiv',
        'FadeAway' => 'Ausblendend',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Summe',
        'week' => 'Woche',
        'quarter' => 'Quartal',
        'half-year' => 'Halbjahr',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Statustyp',
        'Created Priority' => 'Erstellt mit der Priorität',
        'Created State' => 'Erstellt mit dem Status',
        'Create Time' => 'Erstellzeit',
        'Pending until time' => 'Wartezeit',
        'Close Time' => 'Schließzeit',
        'Escalation' => 'Eskalation',
        'Escalation - First Response Time' => 'Eskalation - Zeit für die erste Reaktion',
        'Escalation - Update Time' => 'Eskalation - Aktualisierungszeit',
        'Escalation - Solution Time' => 'Eskalation - Lösungszeit',
        'Agent/Owner' => 'Agent/Besitzer',
        'Created by Agent/Owner' => 'Erstellt von Agent/Besitzer',
        'Assigned to Customer User Login' => 'Zugewiesen zum Kundenbenutzer-Login',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Auswertung nach',
        'Ticket/Article Accounted Time' => 'Ticket/Artikel - Gebuchte Zeit',
        'Ticket Create Time' => 'Ticket-Erstellzeit',
        'Ticket Close Time' => 'Ticket-Schließzeit',
        'Accounted time by Agent' => 'Zeit zugewiesen von Agent',
        'Total Time' => 'Gesamtzeit',
        'Ticket Average' => 'Durchschnittszeit pro Ticket',
        'Ticket Min Time' => 'Ticket-Minimalzeit',
        'Ticket Max Time' => 'Ticket-Maximalzeit',
        'Number of Tickets' => 'Anzahl der Tickets',
        'Article Average' => 'Durchschnittszeit pro Artikel',
        'Article Min Time' => 'Artikel-Minimalzeit',
        'Article Max Time' => 'Artikel Maximalzeit',
        'Number of Articles' => 'Anzahl der Artikel',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => 'unbeschränkt',
        'Attributes to be printed' => 'Auszugebene Attribute',
        'Sort sequence' => 'Sortierreihenfolge',
        'State Historic' => 'Statuschronik',
        'State Type Historic' => 'Statustypen-Historie',
        'Historic Time Range' => 'Historischer Zeitbereich',
        'Number' => 'Nummer',
        'Last Changed' => 'Zuletzt geändert',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => 'Durchschnittliche Lösungszeit',
        'Solution Min Time' => 'Minimale Lösungszeit',
        'Solution Max Time' => 'Maximale Lösungszeit',
        'Solution Average (affected by escalation configuration)' => 'Durchschnitts-Lösungszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'Solution Min Time (affected by escalation configuration)' => 'Minimale Lösungszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'Solution Max Time (affected by escalation configuration)' => 'Maximale Lösungszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'Solution Working Time Average (affected by escalation configuration)' =>
            'Durchschnittliche Lösungs-Arbeitszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'Solution Min Working Time (affected by escalation configuration)' =>
            'Minimale Lösungs-Arbeitszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'Solution Max Working Time (affected by escalation configuration)' =>
            'Maximale Lösungs-Arbeitszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Average (affected by escalation configuration)' =>
            'Erstreaktions-Durchschnittszeit (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Min Time (affected by escalation configuration)' =>
            'Minimale Zeit für Erstreaktion (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Max Time (affected by escalation configuration)' =>
            'Maximale Zeit für Erstreaktion (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Working Time Average (affected by escalation configuration)' =>
            'Durchschnittliche Arbeitszeit für Erstreaktion (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Min Working Time (affected by escalation configuration)' =>
            'Minimale Arbeitszeit für Erstreaktion (wird durch Eskalationskonfiguration beeinflusst)',
        'First Response Max Working Time (affected by escalation configuration)' =>
            'Maximale Arbeitszeit für Erstreaktion (wird durch Eskalationskonfiguration beeinflusst)',
        'Number of Tickets (affected by escalation configuration)' => 'Ticket-Anzahl (wird durch Eskalationskonfiguration beeinflusst)',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Tage',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/OutdatedTables.pm
        'Outdated Tables' => 'Veraltete Tabellen',
        'Outdated tables were found in the database. These can be removed if empty.' =>
            'In der Datenbank wurden veraltete Tabellen gefunden. Diese können, falls leer, gelöscht werden.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Prüfung Tabellenexistenz',
        'Internal Error: Could not open file.' => 'Interner Fehler: Konnte datei nicht öffnen.',
        'Table Check' => 'Prüfung Tabellenstatus',
        'Internal Error: Could not read file.' => 'Interner Fehler: Konnte Datei nicht lesen.',
        'Tables found which are not present in the database.' => 'In der Datenbank fehlen Tabellen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Datenbank-Größe',
        'Could not determine database size.' => 'Konnte Datenbank-Größe nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Datenbank-Version',
        'Could not determine database version.' => 'Konnte Datenbank-Version nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Zeichensatz der Client-Verbindung',
        'Setting character_set_client needs to be utf8mb4.' => 'Einstellung character_set_client muss utf8mb4 sein.',
        'Server Database Charset' => 'Zeichensatz des Datenbank-Servers',
        'The setting character_set_database needs to be \'utf8mb4\'.' => 'Die Einstellung character_set_database muss \'utf8mb4\' sein.',
        'Table Charset' => 'Zeichensatz der Tabellen',
        'There were non-system tables found which do not have \'utf8mb4\' as charset.' =>
            'Es wurden systemfremde Tabellen gefunden, die nicht \'utf8mb4\' als Zeichensatz haben.',
        'There were tables found which do not have \'utf8mb4\' as charset.' =>
            'Es wurden Tabellen gefunden, die nicht \'utf8mb4\' als Zeichensatz haben.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Größe der InnoDB-Log-Datei',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Die Einstellung innodb_log_file_size muss mindestens 256 MB betragen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InvalidDefaultValues.pm
        'Invalid Default Values' => 'Ungültige Standardwerte',
        'Tables with invalid default values were found. In order to fix it automatically, please run: bin/znuny.Console.pl Maint::Database::Check --repair' =>
            'Tabellen mit ungültigen Standardwerten wurden gefunden. Um diese automatisch zu reparieren, bitte folgendes Kommando ausführen: bin/znuny.Console.pl Maint::Database::Check --repair',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Maximale Anfragegröße',
        'The setting \'max_allowed_packet\' must be higher than 64 MB.' =>
            'Die Einstellung \'max_allowed_packet\' muss größer als 64 MB sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Standard-Storage-Engine',
        'Table Storage Engine' => 'Tabellen Speicher-Engine',
        'Tables with a different storage engine than the default engine were found.' =>
            'Es wurden Tabellen gefunden, die nicht die Standard-Engine nutzen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x oder höher wird benötigt.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Einstellung NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG muss auf al32utf8 festgelegt sein (z.B. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Einstellung NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT muss auf \'YYYY-MM-DD HH24:MI:SS\' gesetzt sein.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'SQL-Prüfung NLS_DATE_FORMAT',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/PrimaryKeySequencesAndTriggers.pm
        'Primary Key Sequences and Triggers' => 'Primärschlüssel-Sequenzen und Auslöser',
        'The following sequences and/or triggers with possible wrong names have been found. Please rename them manually.' =>
            'Die folgenden Sequenzen und/oder Auslöser mit potentiell falschen Namen wurden gefunden. Bitte passen Sie die Namen manuell an.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Einstellung client_encoding muss UNICODE oder UTF8 sein.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Einstellung server_encoding muss UNICODE oder UTF8 sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Datumsformat',
        'Setting DateStyle needs to be ISO.' => 'Einstellung DateStyle muss ISO sein.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/PrimaryKeySequences.pm
        'Primary Key Sequences' => 'Primärschlüssel-Sequenzen',
        'The following sequences with possible wrong names have been found. Please rename them manually.' =>
            'Es wurden die folgenden Sequenzen mit möglicherweise falschen Namen gefunden. Bitte ändern Sie die Namen manuell.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 9.2 or higher is required.' => 'PostgreSQL 9.2 oder höher wird benötigt.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionZnuny.pm
        'Operating System' => 'Betriebssystem',
        'Znuny Disk Partition' => 'Znuny-Festplattenpartition',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Festplatten-Verwendung',
        'The partition where Znuny is located is almost full.' => 'Die Partition, auf der Znuny sich befindet, ist fast voll.',
        'The partition where Znuny is located has no disk space problems.' =>
            'Die Partition, auf der Znuny sich befindet, hat keine Platzprobleme.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Belegung der Festplatten-Partitionen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribution',
        'Could not determine distribution.' => 'Konnte Distribution nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Kernel-Version',
        'Could not determine kernel version.' => 'Konnte Kernelversion nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Systemlast (load)',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'Die Systemlast sollte die Zahl der Systemprozessoren nicht übersteigen (bspw. wäre eine Last von 8 oder weniger auf einem 8-Core-System in Ordnung).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Perlmodule',
        'Not all required Perl modules are correctly installed.' => 'Es sind nicht alle benötigten Perl-Module installiert.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModulesAudit.pm
        'Perl Modules Audit' => 'Perl Module Audit',
        'CPAN::Audit reported that one or more installed Perl modules have known vulnerabilities. Please note that there might be false positives for distributions patching Perl modules without changing their version number.' =>
            'CPAN::Audit hat berichtet, dass ein oder mehrere installierte Perl-Module bekannte Schwachstellen aufweisen. Bitte beachten Sie, dass es möglicherweise falsche Positivmeldungen für Distributionen gibt, die Perl-Module patchen, ohne ihre Versionsnummer zu ändern.',
        'CPAN::Audit did not report any known vulnerabilities in the installed Perl modules.' =>
            'CPAN::Audit hat keine bekannten Schwachstellen in den installierten Perl-Modulen gemeldet.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlVersion.pm
        'Perl Version' => 'Perl-Version',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Freier Auslagerungsspeicher (%)',
        'No swap enabled.' => 'Kein Auslagerungsspeicher aktiviert.',
        'Used Swap Space (MB)' => 'Verwendeter Auslagerungsspeicher (MB)',
        'There should be more than 60% free swap space.' => 'Es sollten mehr als 60% Auslagerungsspeicher verfügbar sein.',
        'There should be no more than 200 MB swap space used.' => 'Es sollten nicht mehr als 200 MB Auslagerungsspeicher verwendet werden.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Webserver',
        'Loaded Apache Modules' => 'Geladene Apache-Module',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'MPM-Modell',
        'Znuny requires apache to be run with the \'prefork\' MPM model.' =>
            'Znuny benötigt das Apache \'prefork\' MPM Modul.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Verwendung CGI-Beschleuniger',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Sie sollten FastCGI oder mod_perl verwenden, um die Geschwindigkeit zu steigern.',
        'mod_deflate Usage' => 'Verwendung mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Bitte installieren Sie mod_deflate, um die Geschwindigkeit zu steigern.',
        'mod_filter Usage' => 'Verwendung mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'Bitte installieren Sie mod_filter falls mod_deflate verwendet wird.',
        'mod_headers Usage' => 'Verwendung mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Bitte installieren Sie mod_headers, um die Geschwindigkeit zu steigern.',
        'Apache::Reload Usage' => 'Verwendung Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload oder Apache2::Reload sollten als PerlModule und PerlInitHandler verwendet werden, um Webserver-Neustarts nach Paketinstallation oder -upgrade zu vermeiden.',
        'Apache2::DBI Usage' => 'Verwendung Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Nutzen Sie Apache2::DBI, um eine höhere Leistung im Zusammenhang mit persistenten Datenbankverbindungen zu erreichen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Umgebungsvariablen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => 'Supportdate-Sammlung',
        'Support data could not be collected from the web server.' => 'Supportdaten vom Web-Server konnten nicht ermittelt werden.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Webserver-Version',
        'Could not determine webserver version.' => 'Konnte Webserver-Version nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticleSearchIndexStatus.pm
        'Znuny' => 'Znuny',
        'Article Search Index Status' => 'Ticket-Suchindex-Status',
        'Indexed Articles' => 'Indexierte Artikel',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ArticlesPerCommunicationChannel.pm
        'Articles Per Communication Channel' => 'Artikel pro Kommunikationskanal',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLog.pm
        'Incoming communications' => 'Eingehende Kommunikation',
        'Outgoing communications' => 'Ausgehende Kommunikation',
        'Failed communications' => 'Fehlgeschlagene Kommunikation',
        'Average processing time of communications (s)' => 'Durchschnittliche Verarbeitungszeit für Kommunikation (s)',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/CommunicationLogAccountStatus.pm
        'Communication Log Account Status (last 24 hours)' => 'Kontostatus des Kommunikationsprotokoll (vergangene 24 Stunden)',
        'No connections found.' => 'Keine Verbindungen gefunden.',
        'ok' => 'OK',
        'permanent connection errors' => 'Dauerhafte Verbindungsfehler',
        'intermittent connection errors' => 'Unregelmäßige Verbindungsfehler',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/ConfigSettings.pm
        'Config Settings' => 'Konfigurationseinstellungen',
        'Could not determine value.' => 'Konnte Wert nicht ermitteln.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DaemonRunning.pm
        'Daemon' => 'Daemon',
        'Daemon is running.' => 'Daemon läuft.',
        'Daemon is not running.' => 'Daemon läuft nicht.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DatabaseRecords.pm
        'Database Records' => 'Datenbankeinträge',
        'Tickets' => 'Tickets',
        'Ticket History Entries' => 'Ticket-Historieneinträge',
        'Articles' => 'Artikel',
        'Attachments (DB, Without HTML)' => 'Anhänge (in der Datenbank, ohne HTML)',
        'Customers With At Least One Ticket' => 'Kunden mit wenigstens einem Ticket',
        'Dynamic Field Values' => 'Werte in Dynamischen Feldern',
        'Invalid Dynamic Fields' => 'Ungültige Dynamische Felder',
        'Invalid Dynamic Field Values' => 'Werte in ungültigen Dynamischen Feldern',
        'GenericInterface Webservices' => 'GenericInterface-Webservices',
        'Process Tickets' => 'Prozess-Tickets',
        'Months Between First And Last Ticket' => 'Monate zwischen erstem und letztem Ticket',
        'Tickets Per Month (avg)' => 'Tickets pro Monat (Durchschnitt)',
        'Open Tickets' => 'Offene Tickets',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Standard-Benutzername und -Passwort für SOAP',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Sicherheitsrisiko: Sie verwenden den Standard-SOAP-Benutzernamen und das Standardpasswort. Bitte ändern Sie diese Einstellungen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultUser.pm
        'Default Admin Password' => 'Standard-Admin-Passwort',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Sicherheitsrisiko: Das Agentenpasswort für root@localhost ist das Standardpasswort. Bitte ändern Sie es oder deaktivieren Sie diesen Nutzer.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/EmailQueue.pm
        'Email Sending Queue' => 'Queue für E-Mail-Versand',
        'Emails queued for sending' => 'E-Mails, die zum Senden eingereiht sind',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FQDN.pm
        'FQDN (domain name)' => 'FQDN (Domainname)',
        'Please configure your FQDN setting.' => 'Bitte konfigurieren Sie ihre FQDN-Einstellungen.',
        'Domain Name' => 'Domainname',
        'Your FQDN setting is invalid.' => 'Ihre FQDN-Einstellung ist ungültig.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FileSystemWritable.pm
        'File System Writable' => 'Dateisystem-Schreibbarkeit',
        'The file system on your Znuny partition is not writable.' => 'Das Dateisystem auf Ihrer Znuny-Partition ist nicht schreibbar.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/LegacyConfigBackups.pm
        'Legacy Configuration Backups' => 'Alte Konfigurations-Backups',
        'No legacy configuration backup files found.' => 'Keine alten Konfigurations-Backup-Dateien gefunden.',
        'Legacy configuration backup files found in Kernel/Config/Backups folder, but they might still be required by some packages.' =>
            'Alte Konfigurations-Backup-Dateien gefunden im Verzeichnis Kernel/Config/Backups, aber diese werden möglicherweise noch von Paketen benötigt.',
        'Legacy configuration backup files are no longer needed for the installed packages, please remove them from Kernel/Config/Backups folder.' =>
            'Alte Konfigurations-Backup-Dateien werden nicht mehr für die installierten Pakete benötigt. Bitte entfernen Sie diese aus dem Verzeichnis Kernel/Config/Backups.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/MultipleJSFileLoad.pm
        'The following JavaScript files loaded multiple times:' => 'Die folgenden JavaScript-Dateien werden mehrfach geladen:',
        'Files' => 'Dateien',
        'Views with multiple loaded JavaScript files' => 'Ansichten mit mehrfach geladenen JavaScript Dateien',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageDeployment.pm
        'Package Installation Status' => 'Paketinstallations-Status',
        'Some packages have locally modified files.' => 'Einige Pakete enthalten lokal angepasste Dateien.',
        'Some packages are not correctly installed.' => 'Es wurden Pakete gefunden, die nicht korrekt installiert sind.',
        'Package Framework Version Status' => 'Status der Paket-Framework-Version',
        'Some packages are not allowed for the current framework version.' =>
            'Einige Pakete sind für die aktuelle Framework-Version nicht geeignet.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageList.pm
        'Package List' => 'Paketliste',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SessionConfigSettings.pm
        'Session Config Settings' => 'Sitzungskonfigurations-Einstellungen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SpoolMails.pm
        'Spooled Emails' => 'Zum Senden anstehende E-Mails',
        'There are emails in var/spool that Znuny could not process.' => 'In var/spool befinden sich Emails, die Znuny nicht verarbeiten konnte.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Ihre SystemID-Einstellung ist ungültig, sie sollte nur Ziffern enthalten.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/DefaultType.pm
        'Default Ticket Type' => 'Standard Ticket-Typ',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            'Der konfigurierte Standard Ticket-Typ fehlt oder ist ungültig. Bitte ändern Sie die Einstellung Ticket::Type::Default und wählen Sie einen gültigen Ticket-Typ.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Ticket-Indexmodul',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Sie haben mehr als 60.000 Tickets und sollten das StaticDB-Backend verwenden. Bitte schauen Sie im Administratorhandbuch (Leistungsverbesserung) nach.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => 'Ungültige Benutzer mit gesperrten Tickets',
        'There are invalid users with locked tickets.' => 'Es existierten ungültige Benutzer mit gesperrten Tickets.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/OpenTickets.pm
        'You should not have more than 8,000 open tickets in your system.' =>
            'Sie sollten nicht mehr als 8.000 offene Tickets im System haben.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Ticket-Suchindexmodul',
        'The indexing process forces the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            'Der Indizierungsprozess erzwingt die Speicherung der originalen Artikelinhalte im Artikel-Suchindex, ohne dabei Filter und Stopp-Worte anzuwenden. Dadurch wird die Größe des Suchindex erhöht, was Volltextsuchen verlangsamen kann.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Verwaiste Einträge in der Tabelle ticket_lock_index',
        'Table ticket_lock_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Die Tabelle ticket_lock_index enthält verwaiste Einträge. Bitte führen Sie bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" aus, um den StaticDB-Index zu bereinigen.',
        'Orphaned Records In ticket_index Table' => 'Verwaiste Einträge in der Tabelle ticket_index',
        'Table ticket_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Die Tabelle ticket_index enthält verwaiste Einträge. Bitte führen Sie "Maint::Ticket::QueueIndexCleanup" aus, um sie zu entfernen.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/TimeSettings.pm
        'Time Settings' => 'Zeiteinstellungen',
        'Server time zone' => 'Server-Zeitzone',
        'Znuny time zone' => 'Znuny-Zeitzone',
        'Znuny time zone is not set.' => 'Znuny-Zeitzone ist nicht gesetzt.',
        'User default time zone' => 'Benutzer-Standard-Zeitzone',
        'User default time zone is not set.' => 'Benutzer-Standard-Zeitzone ist nicht gesetzt.',
        'Calendar time zone is not set.' => 'Kalender-Zeitzone ist nicht gesetzt.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentSkinUsage.pm
        'UI - Agent Skin Usage' => 'UI - Nutzung Agenten-Skins',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/AgentThemeUsage.pm
        'UI - Agent Theme Usage' => 'UI - Nutzung Agenten-Themes',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/UI/SpecialStats.pm
        'UI - Special Statistics' => 'UI - Spezielle Statistiken',
        'Agents using custom main menu ordering' => 'Agenten mit eigener Hauptmenüsortierung',
        'Agents using favourites for the admin overview' => 'Agenten, die Favoriten für die Administrator-Übersicht nutzen',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Version.pm
        'Znuny Version' => 'Znuny-Version',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/Znuny/ConcurrentUsers.pm
        'Concurrent Users Details' => 'Details der gleichzeitigen Benutzer',
        'Concurrent Users' => 'Gleichzeitige Benutzer',

        # Perl Module: Kernel/System/SysConfig.pm
        'Setting %s does not exists!' => 'Einstellung %s existiert nicht!',
        'Setting %s is not locked to this user!' => 'Einstellung %s ist nicht in Bearbeitung durch diesen Benutzer!',
        'Setting value is not valid!' => 'Der Einstellungswert ist ungültig!',
        'Could not add modified setting!' => 'Konnte geänderte Einstellung nicht hinzufügen!',
        'Could not update modified setting!' => 'Konnte geänderte Einstellung nicht aktualisieren!',
        'Setting could not be unlocked!' => 'Einstellung konnte nicht freigegeben werden!',
        'Missing key %s!' => 'Fehlender Schlüssel %s!',
        'Invalid setting: %s' => 'Ungültige Einstellung: %s',
        'Could not combine settings values into a perl hash.' => 'Konnte Einstellungswerte nicht zu einem Perl-Hash kombinieren.',
        'Can not lock the deployment for UserID \'%s\'!' => 'Das Deployment für UserID \'%s\' konnte nicht gesperrt werden!',
        'All Settings' => 'Alle Einstellungen',

        # Perl Module: Kernel/System/SysConfig/BaseValueType.pm
        'Default' => 'Standard',
        'Value is not correct! Please, consider updating this field.' => 'Wert ist nicht korrekt! Bitte überprüfen Sie das Feld.',
        'Value doesn\'t satisfy regex (%s).' => 'Wert entspricht nicht dem regulären Ausdruck (%s).',

        # Perl Module: Kernel/System/SysConfig/ValueType/Checkbox.pm
        'Enabled' => 'Aktiviert',
        'Disabled' => 'Deaktiviert',

        # Perl Module: Kernel/System/SysConfig/ValueType/Date.pm
        'System was not able to calculate user Date in OTRSTimeZone!' => 'Das Datum des Benutzers konnte in der Znuny-Zeitzone nicht berechnet werden!',

        # Perl Module: Kernel/System/SysConfig/ValueType/DateTime.pm
        'System was not able to calculate user DateTime in OTRSTimeZone!' =>
            'Das Datum und die Uhrzeit des Benutzers konnte in der Znuny-Zeitzone nicht berechnet werden!',

        # Perl Module: Kernel/System/SysConfig/ValueType/FrontendNavigation.pm
        'Value is not correct! Please, consider updating this module.' =>
            'Wert ist nicht korrekt! Bitte überprüfen Sie das Modul.',

        # Perl Module: Kernel/System/SysConfig/ValueType/VacationDays.pm
        'Value is not correct! Please, consider updating this setting.' =>
            'Wert ist nicht korrekt! Bitte überprüfen Sie diese Einstellung.',

        # Perl Module: Kernel/System/Ticket.pm
        'Reset of unlock time.' => 'Zurücksetzen des Freigabe-Zeitintervalls.',

        # Perl Module: Kernel/System/Ticket/Article/Backend/Chat.pm
        'Chat Participant' => 'Chat-Teilnehmer',
        'Chat Message Text' => 'Chat-Nachrichtentext',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Anmeldung fehlgeschlagen! Benutzername oder Passwort wurden falsch eingegeben.',
        'Authentication succeeded, but no user data record is found in the database. Please contact the administrator.' =>
            'Authentifizierung erfolgreich, aber in der Datenbank wurde kein Eintrag für den Benutzer gefunden. Bitte kontaktieren Sie Ihren Administrator.',
        'Can`t remove SessionID.' => 'Kann SessionID nicht entfernen.',
        'Logout successful.' => 'Abmeldung erfolgreich.',
        'Feature not active!' => 'Funktion nicht aktiviert!',
        'Sent password reset instructions. Please check your email.' => 'Anweisungen zum Zurücksetzen des Passworts wurden gesendet. Bitte prüfen Sie ihre E-Mail.',
        'Invalid Token!' => 'Ungültiger Token!',
        'Sent new password to %s. Please check your email.' => 'Neues Passwort an %s gesendet. Bitte prüfen Sie Ihre E-Mail.',
        'Error: invalid session.' => 'Fehler: Ungültige Sitzung.',
        'No Permission to use this frontend module!' => 'Sie haben keine Berechtigung, dieses Modul zu nutzen!',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            'Authentifizierung erfolgreich, aber im Kunden Backend wurde kein Kunden Eintrag gefunden. Bitte kontaktieren Sie Ihren Administrator.',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'Zurücksetzen des Passwort war nicht erfolgreich. Bitte kontaktieren Sie den Administrator.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Diese E-Mail-Adresse existiert bereits. Bitte melden Sie sich an oder setzen Ihr Passwort zurück.',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Diese E-Mail-Adresse darf nicht registriert werden. Bitte wenden Sie sich an die Supportabteilung.',
        'Added via Customer Panel (%s)' => 'Mittels Kundenbereich hinzugefügt (%s)',
        'Customer user can\'t be added!' => 'Kundenbenutzer kann nicht angelegt werden!',
        'Can\'t send account info!' => 'Kann Zugangsinformation nicht senden!',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Neues Konto angelegt. Anmeldedaten wurden an %s gesendet. Bitte prüfen Sie Ihre E-Mail.',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'Action "%s" not found!' => 'Aktion "%s" nicht gefunden!',

        # XML Definition: Kernel/Config/Files/XML/Calendar.xml
        'Frontend module registration for the public interface.' => 'Frontendmodul-Registrierung für das Public-Interface.',
        'Frontend module registration for the agent interface.' => 'Frontend-Modulregistrierung im Agent-Interface.',
        'Loader module registration for the agent interface.' => 'Loader-Modulregistrierung für die Agentenoberfläche.',
        'Main menu item registration.' => 'Hauptmenü-Objektregistrierung.',
        'Admin area navigation for the agent interface.' => 'Navigation der Adminoberfläche für Agenten-Interface.',
        'Maximum number of active calendars in overview screens. Please note that large number of active calendars can have a performance impact on your server by making too much simultaneous calls.' =>
            'Maximale Anzahl an aktiven Kalendern in der Kalenderübersicht oder Resourcenübersicht. Bitte beachten Sie, dass sich zuviele gleichzeitig aktive Kalender aufgrund vieler gleichzeitiger Anfragen auf die Performance des Systems auswirken kann.',
        'List of colors in hexadecimal RGB which will be available for selection during calendar creation. Make sure the colors are dark enough so white text can be overlayed on them.' =>
            'Liste an Farben in Hexadezimal RGB, welche verschiedenen Benutzerkalendern zugewiesen werden. Stellen Sie sicher, dass die Farben dunkel genug sind, um weißen Text darauf darzustellen. Sofern die Anzahl der Kalender die Anzahl der verfügbaren Farben überschreitet, wird diese Liste erneut von Anfang an genutzt.',
        'Defines available groups for the appointment calendar screen.' =>
            'Definiert die verfügbaren Gruppen für das Terminkalenderansicht.',
        'Defines the ticket plugin for calendar appointments.' => 'Legt das Ticket-Plugin für Termine fest.',
        'Links appointments and tickets with a "Normal" type link.' => 'Verknüpft Termine und Tickets mit einem Link vom Typ "Normal".',
        'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.' =>
            'Definieren Sie Actions, in denen im Verknüpfte-Objekte-Widget ein Einstellungen-Knopf verfügbar sein soll (LinkObject::ViewMode = "complex"). Bitte beachten Sie, dass für diese Actions die folgenden JS- und CSS-Dateien registriert sein müssen: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js.',
        'Define which columns are shown in the linked appointment widget (LinkObject::ViewMode = "complex"). Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.' =>
            'Legt fest welche Spalten im Terminverknüpfungs-Widget angezeigt werden (LinkObject::ViewMode = "complex"). Mögliche Einstellungen: 0 = Deaktiviert, 1 = Verfügbar, 2 = Standardmäßig aktiviert.',
        'Znuny doesn\'t support recurring Appointments without end date or number of iterations. During import process, it might happen that ICS file contains such Appointments. Instead, system creates all Appointments in the past, plus Appointments for the next N months (120 months/10 years by default).' =>
            'Znuny unterstützt keine wiederholenden Termine ohne Enddatum oder Anzahl der Durchläufe. Während des Importierungsprozesses kann es vorkommen, dass die entsprechende ICS-Datei solche Termin enthält. Stattdessen wird das System alle vergangenen Termine erstellen, sowie zusätzlich Termine für die kommenden n Monate (120 Monate / 10 Jahre standardmäßig).',
        'Defines the ticket appointment type backend for ticket escalation time.' =>
            'Beschreibt den Ticket-Termin-Backend Typ für Ticketeskalationen.',
        'Defines the ticket appointment type backend for ticket pending time.' =>
            'Beschreibt den Ticket-Termin-Backend Typ für Ticketpendingzeiten.',
        'Defines the ticket appointment type backend for ticket dynamic field date time.' =>
            'Beschreibt den Ticket-Termin-Backend Typ für Datum/Uhrzeit durch dynamische Felder.',
        'Defines the list of params that can be passed to ticket search function.' =>
            'Legt die Liste der Parameter fest, welche mit der Ticketsuchfunktion verwendet werden kann.',
        'Defines the event object types that will be handled via AdminAppointmentNotificationEvent.' =>
            'Legt die Event-Objekttypen fest, welche via AdminAppointmentNotificationEvent verarbeitet werden.',
        'List of all calendar events to be displayed in the GUI.' => 'Liste aller Kalenderereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all appointment events to be displayed in the GUI.' => 'Liste aller Termin-Events, welche in der Benutzeroberfläche angezeigt werden.',
        'Appointment calendar event module that prepares notification entries for appointments.' =>
            'Terminkalender Event-Modul, welches Benachrichtigungseinträge für Termine vorbereitet.',
        'Uses richtext for viewing and editing ticket notification.' => 'Nutzt richtext zum betrachten und bearbeiten von Ticket-Benachrichtigungen.',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Breite der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Höhe der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Transport selection for appointment notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Transportselektion der Terminbenachrichtigungen. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Legt die Anzahl von Zeichen pro Zeile für die Artikel-Vorschau-Ersetzung im TemplateGenerator für EventNotifications fest.',
        'Defines all the parameters for this notification transport.' => 'Steuert alle Parameter für diesen Benachrichtigungs-Transport.',
        'Appointment calendar event module that updates the ticket with data from ticket appointment.' =>
            'Termin-Kalender Eventmodul, welches Tickets mit Daten aus Ticket-Terminen aktualisiert.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Shows a link in the menu for creating a calendar appointment linked to the ticket directly from the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link im Menü der TicketZoom-Ansicht im Agenten-Interface an, um Termine zu erstellen, welche direkt mit dem entsprechenden Ticket verknüpft sind. Zusätzliche Zugriffskontrolle, ob der Menüpunkt angezeigt wird oder nicht, kann mit dem Schlüssel "Gruppe" und "Inhalt" wie z.B. ("rw:group1;move_into:group2") erreicht werden. Um Menüeinträge zu gruppieren, verwenden Sie den Schlüssel "ClusterName" und im Inhalt den Namen, welchen Sie in der Ansicht verwenden möchten. Verwenden Sie "ClusterPriority" um die Reihenfolge in der jeweiligen Gruppierung zu beeinflussen.',
        'Defines an icon with link to the google map page of the current location in appointment edit screen.' =>
            'Beschreibt ein Symbol mit Verknüpfung zur Google Maps Webseite mit dem aktuellen Standort als entsprechendes Ziel in der Terminbearbeitungs-Oberfläche.',
        'Triggers add or update of automatic calendar appointments based on certain ticket times.' =>
            'Stößt das Hinzufügen oder Aktualisieren von automatischen Terminen an, basierend auf Ticketzeiten.',

        # XML Definition: Kernel/Config/Files/XML/Daemon.xml
        'Defines the module to display a notification in the agent interface if the Znuny Daemon is not running.' =>
            'Definiert das Modul, dass eine Benachrichtigung im Agentenbereich anzeigt, wenn der Znuny Daemon nicht läuft.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Liste der CSS-Dateien, die immer im Agenten-Interface geladen werden sollen.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Liste der JavaScript-Dateien, die immer im Agenten-Interface geladen werden sollen.',
        'Type of daemon log rotation to use: Choose \'OTRS\' to let Znuny system to handle the file rotation, or choose \'External\' to use a 3rd party rotation mechanism (i.e. logrotate). Note: External rotation mechanism requires its own and independent configuration.' =>
            'Art der Logrotation, die vom Daemon genutzt werden soll. Wählen Sie "OTRS", um das System die Rotation verwalten zu lassen oder "extern", um eine Drittapplikation dafür zu nutzen (z. B. logrotate). Hinweis: externe Mechanismen erfordern weiterhin eine eigene Konfiguration.',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if &lt;$OTRSHome&gt;/var/run/ can not be used.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => 'Definiert die Aufbewahrungszeit für die Daemon Log-Dateien in Tagen.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Aktivieren um die Standard-Ausgabe des Daemons in eine Log-Datei umzuleiten.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Aktivieren um die Fehler-Ausgabe des Daemons in eine Log-Datei umzuleiten.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            'Der Hintergrundprozess für den zeitgesteuerten Aufgabenplaner.',
        'The daemon registration for the scheduler cron task manager.' =>
            'Der Hintergrundprozess für den zeitgesteuerten Aufgabenplaner.',
        'The daemon registration for the scheduler future task manager.' =>
            'Der Hintergrundprozess für die zeitgesteuerte Planung der zukünftigen Aufgaben.',
        'The daemon registration for the scheduler task worker.' => 'Der Hintergrundprozess für die zeitgesteuerte Abarbeitung von Aufgaben.',
        'The daemon registration for the system configuration deployment sync manager.' =>
            'Die Daemon-Registrierung für das Synchronisierungs-Management der Inbetriebnahme von Systemkonfigurationen.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Definiert die maximale Anzahl gleichzeitig ausgeführter Tasks.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Legt die Email-Adresse für Benachrichtigungen von Scheduler Tasks fest.',
        'Defines the maximum number of affected tickets per job.' => 'Definiert die maximale Anzahl der betroffenen Tickets pro Job.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Definiert einen Zeitraum in Mikrosekunden, der zwischen der Verarbeitung von Tickets abgewartet werden soll.',
        'Delete expired cache from core modules.' => 'Löscht den abgelaufenen Cache der Kern-Module.',
        'Delete expired upload cache hourly.' => 'Veraltete Upload-Caches stündlich löschen.',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Löscht wöchentlich den abgelaufenen Loader-Cache (Sonntag Morgen).',
        'Fetch emails via fetchmail.' => 'Empfängt Emails durch Fetchmail.',
        'Fetch emails via fetchmail (using SSL).' => 'Empfängt Emails durch Fetchmail (mit SSL).',
        'Generate dashboard statistics.' => 'Übersichtsseitenstatistiken erstellen.',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Löst Ticket-Eskalationsereignisse und Benachrichtigungsereignisse für Eskalationen aus.',
        'Process pending tickets.' => 'Abarbeitung wartender Tickets.',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            'Wiederhole die Verarbeitung von E-Mails aus dem Spool-Verzeichnis, die im ersten Durchlauf nicht importiert werden konnten.',
        'Fetch incoming emails from configured mail accounts.' => 'Eingehende E-Mails von konfigurierten Mailkonten abrufen.',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Ticket-Index für AgentTicketQueue neu aufbauen.',
        'Delete expired sessions.' => 'Löscht abgelaufene Benutzersitzungen.',
        'Unlock tickets that are past their unlock timeout.' => 'Geben Sie Tickets frei, deren Freigabe-Timeout abgelaufen ist.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be enabled in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            'Existierende SMIME-Zertifikate aus dem Kundenbereich erneuern. Hinweis: SMIME und SMIME::FetchFromCustomer müssen aktiv und das Kunden-Backend so konfiguriert sein, dass UserSMIMECertificate-Attribute ermittelt werden.',
        'Checks for articles that needs to be updated in the article search index.' =>
            'Prüft auf Artikel, die im Artikel-Suchindex aktualisiert werden müssen.',
        'Checks for queued outgoing emails to be sent.' => 'Prüft auf zu sendende ausgehende E-Mails.',
        'Checks for communication log entries to be deleted.' => 'Prüft auf zu löschende Einträge im Kommunikationsprotokoll.',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Führt ein benutzerdefiniertes Kommando oder Modul aus. Hinweis: Wird ein Modul benutzt, muss eine Funktion vorhanden sein.',
        'Run file based generic agent jobs (Note: module name needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            'Dateibasierte Generic-Agent-Jobs ausführen (Hinweis: Der Modulname muss im Parameter -configuration-module angegeben sein, z. B. "Kernel::System::GenericAgent").',
        'Collect support data for asynchronous plug-in modules.' => 'Sammelt Support Daten für asynchrone Erweiterungen.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Definiert die Anzahl an Sekunden (ausgehend vom aktuellen Zeitpunkt), nach denen ein fehlgeschlagener Generic Interface-Task neu geplant werden soll.',
        'Removes old system configuration deployments (Sunday mornings).' =>
            'Entfernt veraltete Inbetriebnahmen der Systemkonfiguration (Sonntagmorgens).',
        'Removes old ticket number counters (each 10 minutes).' => 'Entfernt veraltete Ticketnummern-Zähler (alle 10 Minuten).',
        'Removes old generic interface debug log entries created before the specified amount of days.' =>
            'Entfernt alte Generic Interface Debug Log-Einträge, die vor der angegebenen Anzahl von Tagen erstellt wurden.',
        'Delete expired ticket draft entries.' => 'Veraltete Ticket-Entwürfe löschen.',

        # XML Definition: Kernel/Config/Files/XML/Framework.xml
        'Disables the web installer (http://yourhost.example.com/znuny/installer.pl), to prevent the system from being hijacked. If not enabled, the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If enabled, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            'Deaktiviert den Web-Installer (http://yourhost.example.com/znuny/installer.pl), um unerwünschte Zugriffe auf das System zu verhindern. Wenn auf "Nein" gesetzt, kann das System neu installiert werden und die aktuelle Basiskonfiguration wird genutzt, um die Fragen des Installationsscripts vorauszufüllen. Wenn nicht aktiv, werden ebenso GenericAgent, die Paketverwaltung und die SQL-Box deaktiviert.',
        'Enables or disables the debug mode over frontend interface.' => 'Aktiviert oder deaktiviert den Debug-Modus für das Frontend.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            'Liefert erweiterte Debugging-Informationen im Frontend im Fall, dass AJAX-Fehler auftreten, wenn aktiviert.',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Schaltet das Caching von Templates an oder aus. Warnung: Schalten Sie auf Produktivsystemen das Template-Caching nicht ab, da hierdurch massive Performance-Beeinträchtigungen auftreten werden. Diese Einstellung sollte nur zur Fehlerbehebung abgeschaltet werden!',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Bestimmt das Konfigurationslevel des Administrators. Abhängig von diesem Level werden einige Optionen der Sysconfig nicht angezeigt. Die verfügbaren Level sind in absteigender Reihenfolge: Experte, Fortgeschrittener, Anfänger. Je höher das Level ist (wobei Anfänger das höchste Level ist), desto niedriger ist die Wahrscheinlichkeit, dass der Nutzer das System versehentlich so konfiguriert, dass es nicht mehr nutzbar ist.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Kontrolliert, ob es dem Admin erlaubt ist, eine gespeicherte Systemkonfiguration in SysConfig zu importieren.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Definiert den Namen der Anwendung, die in der Weboberfläche, in Tabs und in der Titelleiste des Webbrowser angezeigt wird.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of Znuny).' =>
            'Definiert die System ID. Jede Ticketnummer und HTTP Sitzung enthält diese ID. Das stellt sicher, dass nur Tickets in das Ticketsystem aufgenommen werden, welche zum eigenen Ticketsystem gehören (nützlich, wenn zwischen zwei Instanzen von Znuny kommuniziert wird).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Definiert den Full Qualified Domain Name des Znuny Systems. Diese Einstellung wird als Variable OTRS_CONFIG_FQDN genutzt, welche in allen Nachrichten-Formularen zu finden ist oder um Links zu Tickets in Ihrem Znuny System zu generieren.',
        'Defines the fully qualified domain name for external IDs generation (i.e. Message-ID, ContentID).' =>
            'Definiert den voll qualifizierten Domänennamen für die Generierung externer IDs (z. B. Message-ID, ContentID).',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            'Legt den HTTP-Hostnamen fest, der für die Sammlung von Supportdaten über das freie Modul \'PublicSupportDataCollector\' genutzt wird (z. B. durch den Znuny-Daemon).',
        'Defines the timeout (in seconds, minimum is 20 seconds) for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            'Legt den Timeout in Sekunden für die Sammlung von Supportdaten des öffentlichen Moduls \'PublicSupportDataCollector\' fest, das z. B. vom Znuny Daemon genutzt wird (min. 20 Sekunden).',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Legt das Protokoll fest, das zur Auslieferung der Applikation durch den Webserver genutzt werden soll. Wenn https anstelle von http genutzt werden soll, muss dies hier festgelegt werden. Die Einstellung hat keine Auswirkungen auf die Konfiguration des Webservers und verändert nicht, wie auf die Applikation zugegriffen wird. Bei fehlerhafter Konfiguration verhindert die Einstellung nicht die Anmeldung am System. Diese Einstellung wird nur als Variable verwendet (OTRS_CONFIG_HttpType), die in allen Nachrichten-Formularen zur Verfügung steht, um Links auf Tickets in Ihr System zu generieren.',
        'Whether to force redirect all requests from http to https protocol. Please check that your web server is configured correctly for https protocol before enable this option.' =>
            'Legt fest, ob eine Weiterleitung aller Anfragen von http zu https erzwungen werden soll. Bitte stellen Sie sicher, dass Ihr Webserver korrekt für die Verwendung von https konfiguriert wurde, bevor Sie diese Einstellung aktivieren.',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Legt den Prefix zum Skripte-Verzeichnis auf dem Server fest, analog zur Konfiguration des Webservers. Diese Einstellung wird als Variable OTRS_CONFIG_ScriptAlias in allen Nachrichten-Formularen innerhalb der Applikation genutzt, um Links zu Tickets in Ihrem System zu generieren.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Definiert die E-Mail-Adresse des System-Administrators. Sie wird in den Fehleranzeigen des Programms angezeigt.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Firmenname, welcher in ausgehenden E-Mails als X-Header gesetzt werden soll.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Definiert die Standard-Frontend-Sprache. Die möglichen Werte werden durch die verfügbaren Sprachdateien auf dem System bestimmt (siehe nächste Einstellung).',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Definiert alle Sprachen, die der Applikation zur Verfügung stehen. Geben Sie nur Englische Sprachnamen an.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Definiert alle Sprachen, die der Applikation zur Verfügung stehen. Geben Sie nur die einheimischen Sprachnamen an.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.znuny.org/manual/developer/.' =>
            'Definiert das Standard (HTML)-Theme für das Frontend, das von Agenten und Kunden genutzt wird. Wenn Sie möchten, können Sie Ihr eigenes Theme hinzufügen. Schauen Sie dazu bitte im Administration-Handbuch auf https://doc.znuny.org/manual/developer/.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Themes zu konfigurieren, zum Beispiel um zwischen verschiedenen Agenten und Kunden auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Themes für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'The headline shown in the customer interface.' => 'Die in der Kundenoberfläche angezeigte Überschrift.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Das Logo, das im Kunden-Interface angezeigt wird. Die URL zu dem Bild kann entweder eine relative URL zum Designverzeichnis mit dem Bild sein, oder eine vollständige URL zu einem anderen Webserver.',
        'The shortcut icon for the customer interface.' => 'Das Shortcut-Icon, welches in der Kundenoberfläche angezeigt wird.',
        'The shortcut icon for the customer interface for the skin "default".' =>
            'Das Shortcut-Icon, welches in der Kundenoberfläche für das Design "default" angezeigt wird.',
        'The Apple touch icon for the customer interface.' => 'Das Apple-Touch-Icon, welches in der Kundenoberfläche angezeigt wird.',
        'The Apple touch icon for the customer interface for skin "default".' =>
            'Das Apple-Touch-Icon, welches in der Kundenoberfläche für das Design "default" angezeigt wird.',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Das Logo, das im Agenten-Interface angezeigt wird. Die URL zu dem Bild kann entweder eine relative URL zum Designverzeichnis mit dem Bild sein, oder eine vollständige URL zu einem anderen Webserver.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Das Logo, das für das Design "default" im Agenten-Interface angezeigt wird. Mehr Informationen finden Sie in der Einstellung "AgentLogo".',
        'The logo shown on top of the login box of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Das Logo, das in der Anmelde-Box der Agenten-Oberfläche angezeigt wird. Die URL zu dem Bild kann entweder eine relative URL zum Designverzeichnis mit dem Bild sein, oder eine vollständige URL zu einem anderen Webserver.',
        'The shortcut icon for the agent interface.' => 'Das Shortcut-Icon, welches in der Agentenoberfläche angezeigt wird.',
        'The shortcut icon for the agent interface fot the skin "default".' =>
            'Das Shortcut-Icon, welches in der Agentenoberfläche für das Design "default" angezeigt wird.',
        'The Apple touch icon for the agent interface.' => 'Das Apple-Touch-Icon, welches in der Agentenoberfläche angezeigt wird.',
        'The Apple touch icon for the agent interface for the skin "default".' =>
            'Das Apple-Touch-Icon, welches in der Agentenoberfläche für das Design "default" angezeigt wird.',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Definiert den URL-Basispfad von Symbolen, CSS und JavaScript.',
        'Defines the URL image path of icons for navigation.' => 'Definiert den URL des Bildpfads von Symbolen für die Navigation.',
        'Defines the URL CSS path.' => 'Definiert den URL-CSS-Pfad.',
        'Defines the URL java script path.' => 'Definiert den URL des JavaScript-Pfads.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Nutzt richtext zum betrachten und bearbeiten von: Artikeln, Begrüßungen, Signaturen, Standard Vorlagen, Automatische Antworten und Benachrichtigungen.',
        'Defines the URL rich text editor path.' => 'Definiert den URL-RichTextEditor-Pfad.',
        'Defines the default CSS used in rich text editors.' => 'Definiert die genutzte Standard-CSS in RichText-Editoren.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Bestimmt, ob der erweiterte Modus genutzt werden soll (schaltet die Benutzung von Tabellen, Suchen & Ersetzen, Tiefstellen, Hochstellen, aus Word einfügen, etc. frei).',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            'Legt fest, ob im Kundenbereich der erweiterte Modus genutzt werden soll (erlaubt die Nutzung von Tabellen, Ersetzen, Hochstellen, Tiefstellen, Einfügen aus Word, usw.).',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Definiert die Breite der RichText-Editor Komponente. Geben Sie einen Zahlen- (Pixel) oder Prozenwert (relativ) an.',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Steuert die Höhe der Richtext-Editor-Komponente. Geben Sie eine Zahl (für die Höhe in Pixeln) oder einen prozentualen Wert (für eine relative Höhe) an.',
        'Defines the selectable font sizes in the rich text editor.' => 'Legt die wählbaren Schriftgrößen im Rich-Text-Editor fest.',
        'Defines the selectable fonts in the rich text editor.' => 'Legt die auswählbaren Schriftarten im Rich-Text-Editor fest.',
        'Defines the selectable format tags in the rich text editor.' => 'Legt die auswählbaren Formatierungen im Rich-Text-Editor fest.',
        'Defines additional plugins for use in the rich text editor.' => 'Definiert zusätzliche Plugins für die Verwendung im Rich-Text-Editor.',
        'Defines extra content that is allowed for use in the rich text editor.' =>
            'Definiert zusätzliche Inhalte, die für die Verwendung im Rich-Text-Editor zugelassen sind.',
        'Global settings for all popup profiles.' => 'Globale Einstellungen für alle Popup-Profile.',
        'Disable autocomplete in the login screen.' => 'Deaktiviert die Autovervollständigung im Anmeldebildschirm.',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow Znuny to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Wenn der HTTP-Header "X-Frame-Options: SAMEORIGIN" ausgeschaltet ist, kann Znuny als IFrame in andere Websites integriert werden. Dies stellt eine Sicherheitslücke dar! Daher sollte diese Einstellung nur deaktivieren werden, wenn Sie sich über die Konsequenzen im Klaren sind!',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Wenn HTTP-Header "Content-Security-Policy" ausgeschaltet ist, können externe Scripts geladen werden. Dies stellt eine Sicherheitslücke dar! Daher sollte diese Einstellung nur deaktivieren werden, wenn Sie sich über die Konsequenzen im Klaren sind!',
        'Automated line break in text messages after x number of chars.' =>
            'Automatischer Zeilenumbruch in Textnachrichten nach x-Zeichen.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'Legt die Anzahl an Zeilen fest, die von Textnachrichten angezeigt werden sollen (z. B. von Tickets in der Queue-Ansicht).',
        'Turns on drag and drop for the main navigation.' => 'Aktiviert Drag und Drop für die Hauptnavigation.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Definiert das benutzte Datumseingabeformat in Formularen (Option für Eingabefelder).',
        'Defines the available steps in time selections. Select "Minute" to be able to select all minutes of one hour from 1-59. Select "30 Minutes" to only make full and half hours available.' =>
            'Legt die verfügbaren Schritte in Zeitauswahlfeldern fest. Wähle Sie "Minuten", um alle Minuten einer Stunde von 1-59 auswählen zu können. Wählen Sie "30 Minuten", um nur ganze und halbe Stunden auswählbar zu machen.',
        'Shows time in long format (days, hours, minutes), if enabled; or in short format (days, hours), if not enabled.' =>
            'Zeigt die Beschreibung der Zeitfelder in Langform (Tage, Stunden, Minuten), wenn dies aktiviert ist oder aber nur die initialen Buchstaben (T, S, M), wenn dies nicht aktiviert ist.',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Ermöglicht die Wahl zwischen der Anzeige der Anhänge eines Tickets im Browser (Inline) oder einfach nur als Download anbieten (Anhang).',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Überprüft vor dem Senden einer E-Mail oder vor dem übermitteln eines Telefon-Tickets, den MX-Eintrag der E-Mailadresse.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Definiert die Adresse eines dedizierten DNS-Server, wenn nötig, für "CheckMXRecord" Auflösungen.',
        'Sets the timeout (in seconds) for DNS resolver queries.' => 'Steuert den Timeout (in Sekunden) für DNS-Resolver-Anfragen.',
        'Makes the application check the syntax of email addresses.' => 'Überprüft die Syntax der E-Mailadressen.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Definiert Regular-Expressions die einige Adressen von der Syntaxprüfung ausschließt (wenn "CheckEmailAddresses" auf \'"Ja" gesetzt ist). Bitte geben Sie in diesem Feld eine Regex für E-Mail-Adressen an, die syntaktisch nicht gültig, aber für das System (z.B.: "root@localhost") notwendig sind.',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definiert einen regulären Ausdruck, der alle E-Mail-Adressen filtert, die in der Anwendung nicht verwendet werden sollen.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Definiert wie Verlinkte-Objekte angezeigt werden in TicketZoom-Masken.',
        'Determines if a button to delete a link should be displayed next to each link in each zoom mask.' =>
            'Legt fest, ob ein Knopf zum Löschen neben jedem Link im TicketZoom-Bildschirm angezeigt werden soll.',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Definiert den Link-Typ \'Normal\'. Wenn der Name der Quelle dem des Ziels entspricht, ist der resultierende Link ein nicht-direktionaler Link; Ansonsten ist das Resultat ein direktionaler Link.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Definiert den Link-Typ \'ParentChild\'. Wenn der Quell- und der Zielname den selben Wert beinhalten, ist der Link nicht-direktional. Ansonsten ist das Ergebnis ein direktionaler Link.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Definition der verschiedenen Verknüpfungsmöglichkeiten. Verknüpfungstpyen der selben Gruppe schließen sich gegenseitig aus. Beispiel: Wenn Ticket A mit dem Typ \'Normal\' mit Ticket B verlinkt wird, dann können diese beiden Tickets nicht noch zusätzlich mit dem Typ \'ElternKind\' miteinander verlinkt werden.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Definiert das Log Module für das System. "Datei" schreibt alle Meldungen in das angegebene Logfile, "SysLog" nutzt den Syslog Daemon des Systems, z.B. syslogd.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Wenn "SysLog" als LogModule konfiguriert wurde, kann hier eine eigene Kategorie (facility) festgelegt werden.',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Wenn "SysLog" als LogModule konfiguriert wurde, kann hier der Zeichensatz, der für das Logging verwendet werden soll, festgelegt werden.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Wenn "Datei" als LogModule konfiguriert wurde, muss hier eine Log-Datei hinterlegt werden. Existiert die Datei nicht, wird sie automatisch vom System erstellt.',
        'Adds a suffix with the actual year and month to the Znuny log file. A logfile for every month will be created.' =>
            'Fügt einen Suffix mit dem aktuellen Jahr und Monat in die Znuny-Protokolldatei hinzu. Für jeden Monat wird eine eigene Log-Datei erstellt.',
        'Set the minimum log level. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages. The order of log levels is: \'debug\', \'info\', \'notice\' and \'error\'.' =>
            'Legt die minimale Protokoll-Ebene fest. Wählen Sie "error" aus, werden nur Fehler protokolliert. Mit "debug" erhalten Sie alle Einträge. Die Reihenfolge der Ebenen ist debug, info, notice und error.',
        'Defines the module to send emails. "DoNotSendEmail" doesn\'t send emails at all. Any of the "SMTP" mechanisms use a specified (external) mailserver. "Sendmail" directly uses the sendmail binary of your operating system. "Test" doesn\'t send emails, but writes them to $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/ for testing purposes.' =>
            'Definiert das Modul zum Versenden von E-Mails. "DoNotSendEmail" sendet überhaupt keine E-Mails. Jeder der "SMTP"-Mechanismen verwendet einen bestimmten (externen) Mailserver. "Sendmail" verwendet direkt die sendmail-Binärdatei Ihres Betriebssystems. "Test" sendet keine E-Mails, sondern schreibt sie zu Testzwecken in $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde, muss hier der Mailhost, der die Mails versendet, angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde, muss hier der Port, auf dem Ihr Mailserver auf eingehende Verbindungen lauscht, angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde und der Server eine Authentifizierung benötigt, muss hier ein Benutzername angegeben werden.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Wenn einer der SMTP-Mechanismen als SendmailModule ausgewählt wurde und der Server eine Authentifizierung benötigt, muss hier ein Passwort angegeben werden.',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Versendet alle ausgehenden E-Mails via BCC zu der angegebenen Adresse. Bitte nutzen Sie dies ausschließlich für Backups.',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'Wenn gesetzt, wird diese Adresse als Envelope-Sender-Header in ausgehenden Nachrichten (nicht Benachrichtigungen, siehe unten) genutzt. Ist keine Adresse angegeben, entspricht der Envelope-Sender der an der Queue hinterlegten E-Mail-Adresse.',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            'Wenn gesetzt, wird diese Adresse als Envelope-Sender-Header in ausgehenden Benachrichtigungen genutzt. Ist keine Adresse angegeben, bleibt der Header leer (außer SendmailNotificationEnvelopeFrom::FallbackToEmailFrom ist gesetzt).',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            'Wenn SendmailNotificationEnvelopeFrom nicht definiert ist, ermöglicht es diese Einstellung, die Absenderadresse der E-Mail zu nutzen anstatt eines leeren Envelope-Absenders (bei einigen Mail-Server-Konfigurationen erforderlich).',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Erzwingt die Kodierung von ausgehenden E-Mails (7bit|8bit|quoted-printable|base64).',
        'Defines default headers for outgoing emails.' => 'Legt die Standard-Header für ausgehende E-Mails fest.',
        'Registers a log module, that can be used to log communication related information.' =>
            'Registriert ein Protokoll-Modul, um Informationen zu Verbindungen zu protokollieren.',
        'Defines the number of hours a successful communication will be stored.' =>
            'Legt fest, wie viele Stunden eine erfolgreiche Verbindung gespeichert werden soll.',
        'Defines the number of hours a communication will be stored, whichever its status.' =>
            'Legt fest, wie viele Stunden eine Verbindung unabhängig von ihrem Status gespeichert werden soll.',
        'MailQueue configuration settings.' => 'MailQueue Konfigurationseinstellungen.',
        'Define which avatar engine should be used for the agent avatar on the header and the sender images in AgentTicketZoom. If \'None\' is selected, initials will be displayed instead. Please note that selecting anything other than \'None\' will transfer the encrypted email address of the particular user to an external service.' =>
            'Legt fest, welche Avatar-Engine für die Avatare im Kopf der Software und die Absenderbilder in AgentTicketZoom genutzt werden soll. Wenn \'Keine\' ausgewählt ist, werden stattdessen die Initialen des jeweiligen Nutzers angezeigt. Bitte beachten Sie, dass jede Auswahl außer \'Keine\' dazu führt, dass die verschlüsselte E-Mail-Adresse des jeweiligen Nutzers an einen externen Dienst übertragen wird.',
        'Define which avatar default image should be used for the current agent if no gravatar is assigned to the mail address of the agent. Check https://gravatar.com/site/implement/images/ for further information.' =>
            'Definiert welches Avatar Standardbild für den aktuellen Agent verwendet werden soll, wenn kein Gravatar für die Mailadresse des Agents zugeordnet ist. Siehe https://gravatar.com/site/implement/images/ für weitere Informationen.',
        'Define which avatar default image should be used for the article view if no gravatar is assigned to the mail address. Check https://gravatar.com/site/implement/images/ for further information.' =>
            'Definiert welches Avatar-Standardbild in der Artikel-Ansicht verwendet werden soll, wenn kein Gravatar für die Mailadresse des Agents zugeordnet ist. Siehe https://gravatar.com/site/implement/images/ für weitere Informationen.',
        'Defines an alternate URL, where the login link refers to.' => 'Definiert eine alternative URL, auf die der Login-Link verweist.',
        'Defines an alternate URL, where the logout link refers to.' => 'Definiert eine alternative URL, auf die der Logout-Link verweist.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Definiert ein nützliches Modul um bestimmte User-Optionen zu laden oder um Neuigkeiten anzuzeigen.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Definiert den Schlüssel, der mit dem Modul Kernel::Modules::AgentInfo geprüft wird. Wenn dieser Nutzer-Einstellungs-Schlüssel "wahr" ist, wird die Nachricht vom System akzeptiert.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Datei, die im Modul Kernel::Modules::AgentInfo genutzt wird, wenn sie in Kernel/Output/HTML/Templates/Standard liegt.',
        'Defines the module to generate code for periodic page reloads.' =>
            'Definiert das Modul für die Code-Generierung beim periodischen Neuladen von Seiten.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Legt das Modul fest, das eine Benachrichtigung im Agenten-Bereich anzeigt, wenn das System mit einem Admin-Benutzer genutzt wird (normalerweise sollte im System nicht als Admin-Benutzer gearbeitet werden).',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Definiert das Modul das alle zur Zeit angemeldeten Agenten im Agenten-Interface anzeigt.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            'Definiert das Modul, das alle zur Zeit angemeldeten Kunden im Agentenbereich anzeigt.',
        'Defines the module to display a notification in the agent interface, if there are modified sysconfig settings that are not deployed yet.' =>
            'Definiert das Modul, das eine Benachrichtigung im Agentenbereich anzeigt, wenn Konfigurationseinstellungen angepasst, aber noch nicht in Betrieb genommen wurden.',
        'Defines the module to display a notification in the agent interface, if there are invalid sysconfig settings deployed.' =>
            'Definiert das Modul, das eine Benachrichtigung im Agentenbereich anzeigt, wenn ungültige Konfigurationseinstellungen in Betrieb genommen wurden.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Definiert das Modul das eine Benachrichtigung im Agenten-Interface anzeigt, wenn ein Agent angemeldet ist, während er die "Out of Office"-Funktion aktiviert hat.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Definiert das Modul das eine Benachrichtigung im Agenten-Interface anzeigt, wenn ein Agent angemeldet ist, während die Systemwartung aktiv ist.',
        'Defines the module to display a notification in the agent interface if the system configuration is out of sync.' =>
            'Definiert das Modul, das eine Benachrichtigung im Agentenbereich anzeigt, wenn die Systemkonfiguration nicht synchronisiert ist.',
        'Defines the module to display a notification in the agent interface, if the agent has not yet selected a time zone.' =>
            'Definiert das Modul, das eine Benachrichtigung im Agentenbereich anzeigt, wenn ein Agent noch keine Zeitzone festgelegt hat.',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Legt das Modul fest, das eine generische Benachrichtigung im Agenten-Bereich anzeigt. Entweder wird "Text" (wenn konfiguriert), oder der Inhalt von "Datei" angezeigt.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Definiert, welches Modul für das Speichern der Sitzungsdaten verwendet werden soll. Mit "DB" kann der Anzeige Server getrennt vom DB-Server betrieben werden. "FS" ist schneller.',
        'Defines the name of the session key. E.g. Session, SessionID or Znuny.' =>
            'Definiert den Namen des Session-Schlüssels. Zum Beispiel: Session, SessionID oder Znuny.',
        'Defines the name of the key for customer sessions.' => 'Definiert den Namen des Schlüssels für die Kunden-Sessions.',
        'Turns on the remote ip address check. It should not be enabled if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Schaltet den Remote-IP-Adressencheck ein. Es sollte ausgeschaltet werden, wenn die Applikation z. B. durch eine Proxy-Farm oder eine Einwahlverbindung genutzt wird, da sich die IP-Adresse bei dieser Nutzung pro Anfrage unterscheiden kann.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Löscht die Sitzung, wenn die Sitzungs-ID mit einer ungültigen IP-Adresse benutzt wird.',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Definiert die maximale Gültigkeitsdauer (in Sekunden) für eine Sitzungs-ID.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            'Legt die Zeit in Sekunden fest, in der ein Nutzer untätig sein darf, bevor seine Sitzung automatisch beendet und der Nutzer ausgeloggt wird.',
        'Deletes requested sessions if they have timed out.' => 'Löscht die angefragte Sitzung, wenn ein Timeout vorliegt.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Benutzt für das Session-Management HTML-Cookies. Wenn HTML-Cookies deaktiviert sind oder im Browser HTML-Cookies deaktiviert sind, arbeitet das System wie immer und fügt die Session-ID and Links an.',
        'Stores cookies after the browser has been closed.' => 'Speichert Cookies nach dem Schließen des Browsers.',
        'Protection against CSRF (Cross Site Request Forgery) exploits (for more info see https://en.wikipedia.org/wiki/Cross-site_request_forgery).' =>
            'Schutz gegen CSRF-Lücken (Cross Site Request Forgery). Besuchen Sie https://de.wikipedia.org/wiki/Cross-Site-Request-Forgery für mehr Informationen.',
        'Sets the maximum number of active agents within the timespan defined in SessionMaxIdleTime.' =>
            'Legt die maximale Anzahl an aktiven Agenten innerhalb der in SessionMaxIdleTime festgelegten Zeitspanne fest.',
        'Sets the maximum number of active sessions per agent within the timespan defined in SessionMaxIdleTime.' =>
            'Legt die maximale Anzahl an aktiven Sitzungen pro Agent innerhalb der in SessionMaxIdleTime festgelegten Zeitspanne fest.',
        'Sets the maximum number of active customers within the timespan defined in SessionMaxIdleTime.' =>
            'Legt die maximale Anzahl an aktiven Kundenbenutzern innerhalb der in SessionMaxIdleTime festgelegten Zeitspanne fest.',
        'Sets the maximum number of active sessions per customers within the timespan defined in SessionMaxIdleTime.' =>
            'Legt die maximale Anzahl an aktiven Sitzungen pro Kundenbenutzer innerhalb der in SessionMaxIdleTime festgelegten Zeitspanne fest.',
        'If "FS" was selected for SessionModule, a directory where the session data will be stored must be specified.' =>
            'Wenn "FS" als SessionModule ausgewählt ist, muss hier der Name des Verzeichnisses, in dem Sitzungsdaten gespeichert werden sollen, hinterlegt werden.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Wenn "DB" als Sitzungsmodul ausgewählt ist, muss hier der Name der Tabelle, in der Sitzungsdaten gespeichert werden sollen, hinterlegt werden.',
        'Defines the period of time (in minutes) before agent is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            'Legt den Zeitraum in Minuten fest, bevor ein Agent aufgrund von Inaktivität als "abwesend" markiert wird (z. B. im "Angemeldete Nutzer"-Dashlet oder im Chat).',
        'Defines the period of time (in minutes) before customer is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            'Legt den Zeitraum in Minuten fest, bevor ein Kunde aufgrund von Inaktivität als "abwesend" markiert wird (z. B. im "Angemeldete Nutzer"-Dashlet oder im Chat).',
        'This setting is deprecated. Set OTRSTimeZone instead.' => 'Diese Einstellung ist veraltet. Bitte nutzen Sie stattdessen die Einstellung OTRSTimeZone.',
        'Sets the time zone being used internally by Znuny to e. g. store dates and times in the database. WARNING: This setting must not be changed once set and tickets or any other data containing date/time have been created.' =>
            'Legt die Zeitzone fest, die intern von Znuny genutzt werden soll (z. B. um Datumsangaben und Zeiten in der Datenbank zu speichern). ACHTUNG: Diese Einstellung darf nicht mehr geändert werden, sobald Tickets und/oder andere Objekte erstellt wurden, die Datumsangaben enthalten.',
        'Sets the time zone that will be assigned to newly created users and will be used for users that haven\'t yet set a time zone. This is the time zone being used as default to convert date and time between the Znuny time zone and the user\'s time zone.' =>
            'Legt die Zeitzone fest, die als Voreinstellung für neu angelegte Nutzer gelten soll. Diese Zeitzone wird dazu verwendet, um Datumsangaben und Uhrzeiten zwischen der Znuny-Zeitzone und der Nutzer-Zeitzone korrekt zu konvertieren.',
        'If enabled, users that haven\'t selected a time zone yet will be notified to do so. Note: Notification will not be shown if (1) user has not yet selected a time zone and (2) OTRSTimeZone and UserDefaultTimeZone do match and (3) are not set to UTC.' =>
            'Wenn aktiviert, werden Benutzer, die bislang noch keine Zeitzone ausgewählt haben, benachrichtigt dies zu tun. Hinweis: Die Benachrichtigung wird nicht angezeigt, wenn (1) der Benutzer noch keine Zeitzone ausgewählt hat und (2) OTRSTimeZone und UserDefaultTimeZone identisch sind und (3) nicht auf UTC gesetzt sind.',
        'Maximum Number of a calendar shown in a dropdown.' => 'Maximale Anzahl an Kalendern, die in Auswahlmenüs angezeigt werden.',
        'Define the start day of the week for the date picker.' => 'Definiert den Beginn einer Woche für den Datumswähler.',
        'Adds the permanent vacation days.' => 'Fügt die dauerhaften Urlaubstage hinzu.',
        'Adds the one time vacation days.' => 'Fügt die einmaligen Urlaubstage hinzu.',
        'Defines the hours and week days to count the working time.' => 'Definiert den Zeitraum und die Wochentage welche als Arbeitszeit zählen.',
        'Defines the name of the indicated calendar.' => 'Definiert den Namen des angezeigten Kalenders.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'Spezifiziert die Zeitzone des angezeigten Kalenders, welcher später einer bestimmten Queue zugewiesen werden kann.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Definiert den Wochentag, mit dem die Woche im angegebenen Kalender beginnt.',
        'Adds the permanent vacation days for the indicated calendar.' =>
            'Fügt die dauerhaften Urlaubstage für den angegebenen Kalender hinzu.',
        'Adds the one time vacation days for the indicated calendar.' => 'Fügt die einmaligen Urlaubstage für den angegebenen Kalender hinzu.',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Definiert die Stunden und Wochentage des angegebenen Kalenders um die Arbeitszeit zu messen.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your Znuny instance to stop working (probably any mask which takes input from the user).' =>
            'Definiert die maximale Größe (in Bytes) für das Hochladen von Dateien mit dem Browser. Achtung: Wenn man die Größe zu klein wählt können viele Eingabemasken in ihrer Znuny-Instanz nicht mehr funktionieren (vermutlich jede Maske die Benutzereingaben erwartet).',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Auswahl wie Uploads über die Web-Oberfläche gehandhabt werden sollen. "DB" speichert alle Uploads in der Datenbank, "FS" nutzt das Dateisystem.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Legt den Text fest, der im Protokoll einen CGI-Skripteintrag kennzeichnen soll.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Definiert den Filter, der Text in Artikeln verarbeitet, um URLs zu highlighten.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Aktiviert die "Passwort vergessen" Funktion für Agenten im Agenten-Interface.',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Zeigt die Nachricht des Tages (MOTD) im Anmeldebildschirm des Agentenbereichs an.',
        'Runs the system in "Demo" mode. If enabled, agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            'Führt das System im "Demo" Modus aus. Wenn die Einstellung aktivier ist, können Agenten Einstellungen, wie die Sprachauswahl oder das Design über die Agenten Weboberfläche ändern. Diese Einstellungen sind nur für die aktuelle Sitzung gültig. Agenten können ihr Passwort nicht ändern.',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Erlaubt Administratoren sich als anderer Agent über die Agenten-Administrationsoberfläche anzumelden.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Erlaubt Administratoren sich als Kunde über die Customer-User-Administrationsoberfläche anzumelden.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'Legt die Gruppe fest, für die ein Agent Schreibrechte besitzen muss, um Zugriff auf die "SwitchToCustomer"-Funktion zu haben.',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Steuert den Timeout (in Sekunden) für HTTP/FTP-Downloads.',
        'Defines the connections for http/ftp, via a proxy.' => 'Definiert Verbindungen für HTTP/FTP über einen Proxy.',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Schaltet die SSL-Zertifikatsvalidierung ab, wenn Sie beispielsweise einen HTTPS-Proxy nutzen. Benutzung auf eigene Gefahr!',
        'Enables file upload in the package manager frontend.' => 'Erlaubt den Datei-Upload im Paket-Manager.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Definiert die Adresse der Online-Repository-Liste für zusätzliche Pakete. Das erste verfügbare Ergebnis wird genutzt.',
        'List of online package repositories.' => 'Liste der Online-Paket-Repositorys.',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Definiert die Regular Expressions für IPs für den Zugriff auf das lokale Repository. Sie müssen diese Einstellungen aktivieren um Zugang zu Ihrem lokalen Repository zu haben, ebenfalls muss das Paket package::RepositoryList auf dem Remote-Host installiert sein.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Steuert den Timeout (in Sekunden) für Paket-Downloads. Überschreibt "WebUserAgent::Timeout".',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Lädt Pakete über einen Proxy herunter. Überschreibt "WebUserAgent::Proxy".',
        'If this setting is enabled, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            'Wenn die Einstellung aktiv ist, werden lokale Änderungen nicht als Fehler in der Supportdaten-Analyse angezeigt.',
        'Package event module file a scheduler task for update registration.' =>
            'Modul zum automatischen Planen der Aktualisierung der System-Registrierung.',
        'List of all Package events to be displayed in the GUI.' => 'Liste aller Paket-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Liste aller DynamischesFeld-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all LinkObject events to be displayed in the GUI.' => 'Liste aller LinkObject-Ereignisse die in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'DynamicField object registration.' => 'DynamischesFeld Objektregistrierung.',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Definiert den Benutzernamen um auf die SOAP-Schnittstelle zuzugreifen (bin/cgi-bin/rpc.pl).',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Definiert das Passwort, um die SOAP Schnittstelle anzusteuern (bin/cgi-bin/rpc.pl).',
        'Enable keep-alive connection header for SOAP responses.' => 'Keep-Alive-Verbindungsheader für SOAP-Responses aktivieren.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png).' =>
            'Gibt den Pfad für die Datei mit dem Logo in der Kopfzeile der Webseite an (gif|jpg|png).',
        'Size of the logo in the page header.' => 'Größe des Logos im Seiten-Header.',
        'Defines the standard size of PDF pages.' => 'Bestimmt die Standardgröße von PDF-Seiten.',
        'Defines the maximum number of pages per PDF file.' => 'Bestimmt die maximale Anzahl an Seiten pro PDF-Datei.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von kursiv gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett und kursiv gedruckter proportionaler Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett gedruckter nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von kursiv gedruckter nichtproportionaler (monospace) Schrift in PDF Dokumenten.',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Definiert den Pfad und die TTF Datei für die Handhabung von fett und kursiv gedruckter nichtproportionaler Schrift in PDF Dokumenten.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the Znuny user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Aktiviert PGP-Support. Wenn PGP-Support für das signieren und verschlüsseln von Mails eingeschaltet ist, wird dringend empfohlen, den Webserver unter dem Znuny-Benutzer zu betreiben. Andernfalls werden Probleme mit den Berechtigungen auftreten, wenn auf das .gnupg-Verzeichnis zugegriffen wird.',
        'Defines the path to PGP binary.' => 'Bestimmt den Pfad zur PGP-Binärdatei.',
        'Sets the options for PGP binary.' => 'Legt die Optionen für die PGP-Binärdatei fest.',
        'Sets the preferred digest to be used for PGP binary.' => 'Legt den bevorzugten Digest für die PGP-Binärdatei fest.',
        'Sets the password for private PGP key.' => 'Legt das Passwort für den privaten PGP-Schlüssel fest.',
        'Enable this if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            'Aktivieren Sie diese Einstellung, wenn Sie allen öffentlichen und privaten PGP-Schlüsseln vertrauen, selbst wenn diese nicht mit einer vertrauten Signatur signiert wurden.',
        'Configure your own log text for PGP.' => 'Konfigurieren Sie Ihren eigenen Log-Text für PGP.',
        'Sets the method PGP will use to sing and encrypt emails. Note Inline method is not compatible with RichText messages.' =>
            'Legt die Methode fest, mit der PGP E-Mails signieren und verschlüsseln soll. Bitte beachten Sie, dass die Methode "Inline" nicht für Richtext-Nachrichten verwendet werden kann.',
        'Enables S/MIME support.' => 'Aktiviert unterstützung für S/MIME.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Legt den Pfad zum OpenSSL-Binary fest. Es benötigt möglicherweise ein HOME-Env ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Specifies the directory where SSL certificates are stored.' => 'Legt das Verzeichnis, wo SSL-Zertifikate gespeichert sind, fest.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Legt das Verzeichnis fest, in welchem die privaten SSL Zertifikate gespeichert sind.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Cache-Zeit in Sekunden für SSL-Zertifikatsattribute.',
        'Enables fetch S/MIME from CustomerUser backend support.' => 'Schaltet S/MIME-Unterstützung für das Anfragen von Kundenbenutzer-Backends ein.',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com).' =>
            'Legt den Namen fest, der beim Versenden von Benachrichtigungen durch die Applikation verwendet werden soll. Der Absendername wird genutzt, um den vollständigen Anzeigenamen des Benachrichtigungs-Masters zu bilden (z. B. "Znuny Notifications znuny@your.example.com).',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'Legt die E-Mail-Adresse fest, die zum Versenden von E-Mails durch die Applikation verwendet werden soll. Die Adresse wird genutzt, um den vollständigen Anzeigenamen des Benachrichtigungs-Masters zu bilden (z. B. "Znuny Notifications znuny@your.example.com). Sie können die OTRS_CONFIG_FQDN-Variable nutzen, die Sie in der Konfiguration festgelegt haben, oder eine andere E-Mail-Adresse wählen.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Legt den Betreff der Benachrichtigungs-E-Mail fest, die bei einer Passwortanfrage an Agenten verschickt wird.',
        'Defines the body text for notification mails sent to agents, with token about new requested password.' =>
            'Legt den Fließtext der Benachrichtigungs-E-Mail fest, die bei einer Passwortanfrage an Agenten verschickt wird.',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Agenten geschickt werden.',
        'Defines the body text for notification mails sent to agents, about new password.' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails an Agenten betreffend dem neuen Passwort.',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Innerhalb der Applikation verfügbare Standardberechtigungen für Agenten. Wenn mehr Berechtigungen benötigt werden, können diese hier hinterlegt werden. Berechtigungen müssen definiert werden, um Auswirkungen zu haben. Einige zusätzliche Berechtigungen sind bereits zur Nutzung vorbereitet: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Bitte stellen Sie beim Anlegen neuer Berechtigungen sicher, dass "rw" immer der letzte Eintrag bleibt.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Legt die verfügbaren Standardberechtigungen für Kunden innerhalb der Applikation fest. Werden mehr Berechtigungen benötigt, können sie hier eingegeben werden. Berechtigungen müssen hart-kodiert sein, um Auswirkungen zu haben. Bitte stellen Sie beim Anlegen neuer Berechtigungen sicher, dass "rw" immer der letzte Eintrag bleibt.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Diese Einstellung erlaubt das Überschreiben der eingebauten Länderliste. Durch Nutzung dieser Einstellung können Sie z. B. eine eigene, kürzere Länderliste nutzen, wenn dies für Sie passender ist.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Aktiviert das Leistungsprotokoll zum Erfassen der Seiten-Antwortzeiten. Diese Einstellung beeinflusst die Gesamtleistung des Systems. Frontend::Module###AdminPerformanceLog muss aktiviert sein.',
        'Specifies the path of the file for the performance log.' => 'Hinterlegt den Pfad für die Datei des Leistungsprotokolls.',
        'Defines the maximum size (in MB) of the log file.' => 'Bestimmt die Maximalgröße (in MB) der Protokolldatei.',
        'Defines the two-factor module to authenticate agents.' => 'Definiert das Modul für die Zwei-Faktor-Authentifizierung von Agenten.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Defininiert das Einstellungsfeld für Agenten, in dem der Share Secret-Key gespeichert wird.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Steuert, ob Agenten, die die Zweifaktor-Authentifizierung nicht nutzen, sich im System einloggen dürfen.',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Steuert, ob das vorherige, gültige Token für die Authentifizierung akzeptiert werden soll. Dies ist etwas weniger sicher, gibt Nutzern aber 30 Sekunden mehr Zeit, Ihre Einmal-Passwort einzugeben.',
        'Defines the name of the table where the user preferences are stored.' =>
            'Legt den Namen der Tabelle fest, in der Benutzereinstellungen gespeichert werden.',
        'Defines the column to store the keys for the preferences table.' =>
            'Definiert die Spalte, in der die Schlüssel für die Tabelle mit den Einstellungen gespeichert werden sollen.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Definiert den Namen der Spalte, unter der Daten in der Eigenschaften-Tabelle gespeichert werden.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Definiert den Namen der Spalte, unter der die Benutzer-Identifier in der Eigenschaften-Tabelle gespeichert werden.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Definiert die Konfigurationsparamenter des Items, die in der Benutzereinstellung angezeigt wird. PasswordRegExp\' erlaubt das Prüfen von Passwörtern gegen einen regulären Ausdruck. Legen Sie die Mindestlänge für Passwörter mit \'PasswordMinSize\' fest. Legen Sie fest, ob das Passwort mindestens zwei Kleinbuchstaben und zwei Großbuchstaben enthalten muss, indem Sie die entsprechende Option auf \'1\' setzen. \'PasswordMin2Characters\' legt fest, dass mindestens zwei Buchstaben-Zeichen erforderlich sind (mögliche Werte sind \'0\' oder \'1\'). \'PasswordNeedDigit\' legt fest, ob das Passwort mindestens eine Zahl enthalten muss (mögliche Werte sind \'0\' oder \'1\'). \'PasswordMaxLoginFailed\' erlaubt es einen Agenten auf temporär ungültig wenn die maximale Anzahl fehlerhafter Logins erreicht ist. Bitte beachte: Wenn \'Active\' auf 0 eingestellt ist, so verhindert dies nur, dass Agenten die Einstellung dieser Gruppe in ihren persönlichen Einstellungen verändern können. Der Administrator kann weiterhin diese Einstellungen im Name von Benutzern verändern. Benutze \'PreferenceGroup\', um zu steuern, in welchem Bereich diese Einstellungen in der Benutzer-Oberfläche angezeigt werden.',
        'Defines the config parameters of this item, to be shown in the preferences view. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Definiert die Konfigurationsparamenter des Items, die in der Benutzereinstellung angezeigt wird. Bitte beachte: Wenn \'Active\' auf 0 eingestellt ist, so verhindert dies nur, dass Agenten die Einstellung dieser Gruppe in ihren persönlichen Einstellungen verändern können. Der Administrator kann weiterhin diese Einstellungen im Name von Benutzern verändern. Benutze \'PreferenceGroup\', um zu steuern, in welchem Bereich diese Einstellungen in der Benutzer-Oberfläche angezeigt werden.',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Gibt dem Endnutzer die Möglichkeit, das Separatorenzeichen von CSV-Dateien in der Übersetzungsdatei zu definieren. Bitte beachte: Wenn \'Active\' auf 0 eingestellt ist, so verhindert dies nur, dass Agenten die Einstellung dieser Gruppe in ihren persönlichen Einstellungen verändern können. Der Administrator kann weiterhin diese Einstellungen im Name von Benutzern verändern. Benutze \'PreferenceGroup\', um zu steuern, in welchem Bereich diese Einstellungen in der Benutzer-Oberfläche angezeigt werden.',
        'Defines the users avatar. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Definiert den Avatar des Benutzers. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Defines the user identifier for the customer panel.' => 'Definiert den Benutzer-Identifier für das Kunden-Interface.',
        'Activates support for customer and customer user groups.' => 'Aktiviert Unterstützung für Kunden- und Kundenbenutzergruppen.',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer user for these groups).' =>
            'Steuert die Gruppen, in denen sich ein Kundenbenutzer standardmäßig befinden soll (wenn CustomerGroupSupport aktiviert ist und Sie nicht jede Gruppenbeziehung für die Nutzer einzeln steuern möchten).',
        'Defines the groups every customer will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer for these groups).' =>
            'Steuert die Gruppen, in denen sich ein Kunde standardmäßig befinden soll (wenn CustomerGroupSupport aktiviert ist und Sie nicht jede Gruppenbeziehung für die Kunden einzeln steuern möchten).',
        'Defines a permission context for customer to group assignment.' =>
            'Bestimmt einen Berechtigungskontext für die Kunden-Gruppen-Zuweisung.',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            'Definiert das Modul, das alle zur Zeit angemeldeten Agenten im Kundenbereich anzeigt.',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            'Definiert das Modul, das alle zur Zeit angemeldeten Kunden im Kundenbereich anzeigt.',
        'Defines the module to display a notification in the customer interface, if the customer is logged in while having system maintenance active.' =>
            'Definiert das Modul, das eine Benachrichtigung im Kundenbereich anzeigt, wenn ein Kunde während einer Systemwartung eingeloggt ist.',
        'Defines the module to display a notification in the customer interface, if the customer user has not yet selected a time zone.' =>
            'Definiert das Modul, das eine Benachrichtigung im Kundenbereich anzeigt, wenn ein Kunde noch keine Zeitzone festgelegt hat.',
        'Defines an alternate login URL for the customer panel..' => 'Definiert für die Kundenoberfläche eine alternative Anmelde-URL, auf die der Login-Link verweist.',
        'Defines an alternate logout URL for the customer panel.' => 'Definiert für die Kundenoberfläche eine alternative Abmelde-URL, auf die der Logout-Link verweist.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein Google-Maps-Symbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein GoogleSymbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein LinedIn-Symbol am Endes der Kundeninformation hinzufügt.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Definiert einen Punkt, welcher ein XINGSymbol am Endes der Kundeninformation hinzufügt.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Die PreRun()-Funktion dieses Moduls wird (wenn aktiviert) bei jeder Anfrage ausgeführt. Es kann z. B. genutzt werden, um Benutzereinstellungen zu prüfen oder Neuigkeiten anzuzeigen.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Definiert den Schlüssel, der mit CustomerAccept geprüft wird. Wenn dieser Nutzer-Einstellungs-Schlüssel "wahr" ist, wird die Nachricht vom System akzeptiert.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Legt den Pfad der angezeigten Info-Datei fest, die in Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt liegt.',
        'Activates lost password feature for customers.' => 'Aktiviert die "Passwort vergessen" Funktion für Kunden.',
        'Enables customers to create their own accounts.' => 'Erlaubt Kunden, eigene Konten anzulegen.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Wenn aktiviert, muss mindestens einer der hier definierten regulären Ausdrücke auf die E-Mail-Adresse des Benutzers, der sich registrieren möchte, matchen.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Wenn aktiviert, darf keiner der hier definierten regulären Ausdrücke auf die E-Mail-Adresse des Benutzers, der sich registrieren möchte, matchen.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Legt den Betreff der Benachrichtigungs-E-Mail fest, die bei einer Passwortanfrage an Kunden verschickt wird.',
        'Defines the body text for notification mails sent to customers, with token about new requested password.' =>
            'Definiert den Text für Benachrichtigungs-E-Mails mit dem Token für neu generierte Passwörter, die an Kunden geschickt wird.',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Passworts an Kunden geschickt wird.',
        'Defines the body text for notification mails sent to customers, about new password.' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails an Kunden betreffend dem neuen Passwort.',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Definiert den Betreff für Benachrichtigungs-Emails, die wegen eines neuen Accounts an Kunden geschickt wird.',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Definiert den Text im Hauptteil für Benachrichtigungs-Emails, die wegen eines neuen Accounts an Kunden geschickt wird.',
        'Defines the module to authenticate customers.' => 'Definiert das Modul um Kunden zu authentifizieren.',
        'If "DB" was selected for Customer::AuthModule, the encryption type of passwords must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Verschlüsselungstyp für Passwörter hinterlegt werden.',
        'If "bcrypt" was selected for CryptType, use cost specified here for bcrypt hashing. Currently max. supported cost value is 31.' =>
            'Wenn "bcrypt" als CryptType gewählt wurde, wird der hier eingetragene Cost-Parameter zur Berechnung verwendet. Derzeit wird als Wert maximal 31 unterstützt.',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Tabelle, in der Kundendaten gespeichert werden sollen, hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Spalte, die CustomerKey enthält, hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der Name der Spalte, die das Kundenpasswort enthält, hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, muss hier der DSN zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Benutzername zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Passwort zum Verbinden zur Datenbank hinterlegt werden.',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Wenn "DB" als Customer::AuthModule ausgewählt ist, kann hier ein Datenbanktreiber definiert werden. Ansonsten wird der benötigte Treiber automatisch ermittelt.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Wenn "HTTPBasicAuth" als Customer::AuthModule festgelegt wurde, können Sie festlegen, ob Teile am Anfang des Benutzernamens entfernt werden sollen (z. B. um die Domain aus Nutzernamen wie example_domain\user zu entfernen).',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Wenn "HTTPBasicAuth" als Customer::AuthModule ausgewählt ist, kann hier ein regulärer Ausdruck definiert werden, um Teile von REMOTE_USER zu entfernen (z.B. für anhängende Domänen). Hinweis: $1 enthält den neuen Login-Namen.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, kann der LDAP-Host hier angegeben werden.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, muss das BaseDN hier angegeben werden.',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, muss der User-Identifier hier angegeben werden.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use Znuny. Specify the group, who may access the system.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie prüfen, ob der Benutzer aufgrund seiner Mitgliedschaft in einer posixGroup Authentifizierungsberechtigt (z.B. wenn ein Nutzer Mitglied der Gruppe xyz sein muss, um Znuny nutzen zu dürfen). Legen Sie diese Gruppe hier fest.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können hier Zugangs-Attribute bestimmt werden.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können hier Benutzer-Attribute spezifiziert werden. Nutzen Sie UID für LDAP-posixGroups, den vollen Benutzer-DN für nicht-LDAP-posixGroups.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Ihre Nutzer nur anonymen Zugriff auf den LDAP-Baum haben, Sie die Daten aber durchsuchen möchten, können Sie dies mithilfe eines speziellen Users tun, dessen Benutzernamen Sie hier angeben können.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Ihre Nutzer nur anonymen Zugriff auf den LDAP-Baum haben, Sie die Daten aber durchsuchen möchten, können Sie dies mithilfe eines speziellen Users tun, dessen Passwort Sie hier angeben können.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie hier Filter für jede LDAP-Anfrage festlegen, z.B. (mail=*), (objectclass=user) oder (!objectclass=computer).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und Sie einen Suffix zu jedem Kunden-Loginnamen hinzufügen möchten, können Sie dies hier festlegen (z.B. wenn "benutzername" im LDAP als "benutzername@domain" existiert).',
        'If "LDAP" was selected for Customer::AuthModule and special parameters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist und spezielle Parameter für das Perl-Modul Net::LDAP benötigt werden, können Sie diese hier angeben. Nutzen Sie "perldoc Net::LDAP" für weitere Informationen zu den Parametern.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Wenn "LDAP" als Customer::AuthModule ausgewählt ist, können Sie hier festlegen, ob Anwendungen stoppen sollen, wenn z.B. die Verbindung zum Server aufgrund von Netzwerkproblemen nicht hergestellt werden kann.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, muss hier der Radius-Host hinterlegt werden.',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, muss hier das Passwort zur Authentifizierung beim Radius-Host hinterlegt werden.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Wenn "Radius" als Customer::AuthModule ausgewählt ist, können Sie hier festlegen, ob Anwendungen stoppen sollen, wenn z.B. die Verbindung zum Server aufgrund von Netzwerkproblemen nicht hergestellt werden kann.',
        'Defines the two-factor module to authenticate customers.' => 'Definiert das Modul für die Zwei-Faktor-Authentifizierung von Kunden.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Defininiert das Einstellungsfeld für Kunden, in dem der Share Secret-Key gespeichert wird.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Steuert, ob Kunden, die die Zweifaktor-Authentifizierung nicht nutzen, sich im System einloggen dürfen.',
        'Defines the parameters for the customer preferences table.' => 'Definiert die Parameter der Tabelle mit den Kunden-Einstellungen.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            'Legt alle Parameter für diesen Eintrag in den Kunden-Einstellungen fest. \'PasswordRegExp\' erlaubt das prüfen von Passworten gegen einen regulären Ausdruck. Legen Sie Mindestlänge für Passworte mit \'PasswordMinSize\' fest. Legen Sie fest, ob das Passwort mindestens zwei Kleinbuchstaben und zwei Großbuchstaben enthalten muss, indem Sie die entsprechende Option auf \'1\' setzen. \'PasswordMin2Characters\' legt fest, ob mindestens zwei Buchstaben-Zeichen erforderlich sind. \'PasswordNeedDigit\' legt fest, ob das Passwort mindestens eine Zahl enthalten muss.',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Definiert die Konfigurationsparamenter des Eintrages, der in der Benutzereinstellung angezeigt wird.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Definiert alle Parameter für Kunden-Einstellungen.',
        'Parameters for the pages (in which the communication log entries are shown) of the communication log overview.' =>
            'Parameter der Seiten (die die Verbindungsprotokoll-Einträge zeigen) für die Verbindungsprotokoll-Übersicht.',
        'Search backend router.' => 'Router für Such-Backend.',
        'JavaScript function for the search frontend.' => 'JavaScript-Funktion für das Suche-Frontend.',
        'Main menu registration.' => 'Hauptmenü-Registrierung.',
        'Parameters for the dashboard backend of the customer company information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten.',
        'Parameters for the dashboard backend of the customer user information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten.',
        'Search backend default router.' => 'Standard-Router für Such-Backend.',
        'Defines available groups for the admin overview screen.' => 'Legt verfügbare Gruppen für die Administrator-Übersicht fest.',
        'Frontend module registration (show personal favorites as sub navigation items of \'Admin\').' =>
            'Frontend-Modulregistrierung (persönliche Favoriten als Untermenü des Punktes "Admin" anzeigen).',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Frontend-Modulregistrierung (Firmen-Link entfernen wenn das Firmen-Feature nicht aktiv ist).',
        'Frontend module registration for the customer interface.' => 'Frontend-Modulregistrierung für den Kundenbereich.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Aktiviert die verfügbaren Skins auf dem System. Wert 1 bedeutet aktiv, 0 bedeutet inaktiv.',
        'Defines the default value for the action parameter.' => 'Legt den Standardwert für den Aktionsparameter fest.',
        'Defines the shown links in the footer area of the customer and public interface of this Znuny system. The value in "Key" is the external URL, the value in "Content" is the shown label.' =>
            'Definiert die angezeigten Verknüpfungen im Fußbereich des Öffentlichen- und Kunden-Interface dieses Znuny Systems. Der Wert in "Schlüssel" ist die externe URL, der Wert in "Inhalt" das angezeigte Label.',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Definiert den Standard-Wert für den Action-Paramenter im Public-Frontend. Der Action-Paramter wird in System-Skripten vewendet.',
        'Sets the stats hook.' => 'Steuert den Hook für Statistiken.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Startzahl für das Zählen von Statistiken. Jede neue Statistik erhöht die hier eingestellte Zahl.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Steuert die maximale Anzahl angezeigter Statistiken pro Seite in der Übersicht.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Definiert die Standardauswahl in der Einfachauswahl für dynamische Objekte (Formular: genauere Spezifikation).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Definiert die Standardauswahl im Dropdown-Menü für Berechtigungen (Formular: Allgemeine Angaben).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Legt die Standardauswahl im Dropdown-Menü für das Statistik-Format (Form: Gemeinsame Spezifikation) fest. Bitte legen Sie die Formattaste fest (siehe Stats::Format).',
        'Defines the search limit for the stats.' => 'Definiert die maximalen Suchergebnisse für Statistiken.',
        'Defines all the possible stats output formats.' => 'Definiert alle möglichen Statistikausgabeformate.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Erlaubt Agenten die Achsen einer Statistik zu tauschen, wenn sie eine Statistik generieren.',
        'Adds the following elements for use in stats: "Agent/Owner", "Created by Agent/Owner", "Responsible", "Accounted time by Agent".' =>
            '',
        'Allows invalid agents to be used in stats. Stats::UseAgentElementInStats must be active.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Zeigt alle Kunden-Identifikatoren in einem Mehrfachauswahlfeld (nicht sinnvoll, wenn Sie sehr viele Identifikatoren haben).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            'Zeigt alle Kundenbenutzer-Identifikatoren in einem Mehrfachauswahlfeld (nicht sinnvoll, wenn Sie sehr viele Identifikatoren haben).',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Definiert die standardmäßig eingestellte maximale Anzahl von Attributen für die x-Achse für die Zeitachse.',
        'Znuny can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'Znuny kann eine oder mehrere Spiegeldatenbanken für aufwändige Operationen wie Volltextsuchen oder Statistikgenerierungen nutzen. Hier können Sie die DSN für die erste Spiegeldatenbank hinterlegen.',
        'Specify the username to authenticate for the first mirror database.' =>
            'Geben Sie den Benutzernamen für die Authentifikation mit der ersten Spiegeldatenbank an.',
        'Specify the password to authenticate for the first mirror database.' =>
            'Geben Sie das Passwort für die Authentifikation mit der ersten Spiegeldatenbank an.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Konfigurieren Sie alle weiteren Readonly-Spiegeldatenbanken, die Sie verwenden möchten.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTL" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTL" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Zeigt die Nachricht des Tages (MOTD) im Agenten-Dashboard. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'Startet eine Wildcard-Suche innerhalb des aktiven Objekts, nachdem der Verknüpfungs-Bildschirm geöffnet wurde.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Definiert einen Filter, um den Text in den Artikel zu verarbeiten, um vordefinierte Schlüsselwörter zu markieren.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter CVE-Nummern hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der Znuny-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter Bugtraq-Nummern hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der Znuny-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer MSBulletin-Nummer hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der Znuny-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer bestimmten Zeichenfolge hinzufügen. Dieses Element erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der Znuny-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definiert einen Filter für die HTML-Ausgabe um Links hinter einer bestimmten Zeichenfolge hinzufügen. Das Element Bild erlaubt zwei Eingabearten. Zum einem den Namen eines Bildes (Beispielsweise faq.png). In diesem Fall wird der Znuny-Bildpfad verwendet. Die zweite Möglichkeit ist, den Link zu dem Bild einzufügen.',
        'If enabled, the Znuny version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            'Wenn aktiviert, werden Znuny-Versionsinformationen aus der Oberfläche und HTTP-Headern und X-Headern entfernt. Hinweis: Nach Änderung dieser Option muss der Cache gelöscht werden.',
        'If enabled, Znuny will deliver all CSS files in minified form.' =>
            'Wenn aktiviert, liefert Znuny CSS-Dateien in minifizierter Form aus.',
        'If enabled, Znuny will deliver all JavaScript files in minified form.' =>
            'Wenn aktiviert, liefert Znuny JavaScript-Dateien in minifizierter Form aus.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Liste von Responsive-CSS-Dateien, die im Agenten-Bereich immer geladen werden sollen.',
        'List of JS files to always be loaded for the admin interface.' =>
            'Liste der JavaScript-Dateien, die immer im Admin-Interface geladen werden sollen.',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Liste der CSS-Dateien, die immer im Kunden-Interface geladen werden sollen.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Liste von Responsive-CSS-Dateien, die im Kunden-Bereich immer geladen werden sollen.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Liste der JavaScript-Dateien, die immer im Kunden-Interface geladen werden sollen.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Wenn aktiviert, öffnet sich die erste Ebene des Hauptmenüs beim schon beim Überfahren der Maus (anstelle nur beim Klick).',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Legt die Reihenfolge fest, in der Vorname und Nachname von Agenten angezeigt wird.',
        'Default skin for the agent interface.' => 'Standard-Skin für das Agenten-Interface.',
        'Dark skin for the agent interface.' => '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'Der interne Name des Skins, der im Agentenbereich genutzt werden soll. Verfügbare Skins finden Sie unter Frontend::Agent::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Skins zu konfigurieren, zum Beispiel um zwischen verschiedenen Agenten auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Skins für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'Default skin for the customer interface.' => 'Standard-Skin für das Kunden Interface.',
        'Dark skin for the customer interface.' => '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'Der interne Name des Skins, der im Kundenbereich genutzt werden soll. Verfügbare Skins finden Sie unter Frontend::Customer::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Es ist möglich, verschiedene Skins zu konfigurieren, zum Beispiel um zwischen verschiedenen Kunden auf Basis der jeweiligen Domain zu unterscheiden. Sie können durch Nutzung von regulären Ausdrücken mithilfe von Schlüssel-/Wert-Paaren auf Domains prüfen. Der Inhalt von "Schlüssel" sollte die Prüfung auf die Domain beinhalten, der Inhalt von "Wert" den Namen des zu selektierenden Skins für diese Domain. Bitte beachten Sie die Einträge mit Beispielen für korrekte reguläre Ausdrücke.',
        'Shows time use complete description (days, hours, minutes), if enabled; or just first letter (d, h, m), if not enabled.' =>
            'Zeigt die Beschreibung der Zeitfelder in Langform (Tage, Stunden, Minuten), wenn dies aktiviert ist oder aber nur die initialen Buchstaben (T, S, M), wenn dies nicht aktiviert ist.',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'Führt eine initiale Wildcard-Suche für bestehende Kundenbenutzer aus, wenn auf AdminCustomerUser zugegriffen wird.',
        'Controls if the autocomplete field will be used for the customer ID selection in the AdminCustomerUser interface.' =>
            'Legt fest, ob das Autovervollständigen-Feld in der Kundennummerauswahl des AdminCustomerUser-Bereichs genutzt werden soll.',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'Führt eine initiale Wildcard-Suche für bestehende Kundenfirmen aus, wenn auf AdminCustomerCompany zugegriffen wird.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Überprüft ob der Administrator die Berechtigung besitzt Änderungen in der Datenbank über die AdminSelectBox zu tätigen.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Liste aller Kundenbenutzerereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Liste aller Kundenereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Ereignis-Modul, das Kundenbenutzer aktualisiert nach einem Update des Kunden.',
        'Event module that updates customer company object name for dynamic fields.' =>
            'Eventmodul, das den Kundenunternehmen-Objektnamen für Dynamische Felder aktualisiert.',
        'Event module that updates customer user search profiles if login changes.' =>
            'Eventmodul, das Suchprofile von Kunden aktualisiert, wenn sich Loginnamen ändern.',
        'Event module that updates customer user service membership if login changes.' =>
            'Eventmodul, das Service-Zuordnungen von Kunden aktualisiert, wenn sich Loginnamen ändern.',
        'Event module that updates customer user object name for dynamic fields.' =>
            'Eventmodul, das den Kundenbenutzer-Objektnamen für Dynamische Felder aktualisiert.',
        'Selects the cache backend to use.' => 'Gibt das zu verwendende Cache Backend an.',
        'If enabled, the cache data be held in memory.' => 'Wenn aktiviert, werden Cache-Daten im Speicher gehalten.',
        'If enabled, the cache data will be stored in cache backend.' => 'Wenn aktiviert, werden Cache-Daten im Cache Backend gespeichert.',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'Legt fest, wieviele Unterebenen in vom Cache erstellten Verzeichnissen verwendet werden sollen. Dies verhindert, dass innerhalb eines Verzeichnisses zu viele Dateien erstellt werden.',
        'Defines the config options for the autocompletion feature.' => 'Definiert die Konfigurationsoptionen für die Autovervollständigung.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            'Definiert die Liste der möglichen Folgeaktionen in einer Fehleranzeige. Mit einem vollständigen Pfad kann man bei Bedarf externe Links einfügen.',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Steuert, wie lange (in Minuten) die Benachrichtigung über eine bevorstehende Wartungsphase angezeigt werden soll.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Setzt die Standard Nachricht für den Hinweis, der angezeigt wird, wenn das System im Wartungsmodus läuft.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Setzt die Standard Nachricht für den Hinweis, der auf der Agenten- und Kunden-Oberfläche angezeigt wird, wenn sich das System im Wartungsmodus befindet.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Legt die Standard-Fehlermeldung für den Anmelde-Bildschirm im Agenten- und Kundenbereich fest, die angezeigt wird, wenn sich das System gerade in einer Wartungsperiode befindet.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Nutzen Sie einen neuen Typ von Auswahl- und Autovervollständigen-Feldern in der Agenten-Schnittstelle, wo sie anwendbar sind (InputFields = Eingabefelder).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'Nutzung eines modernen Auswahlfeldes mit Autovervollständigung im Kundenbereich (wenn verfügbar).',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Steuert den Fallback-Pfad zum Öffnen des fetchmail-Binaries. Hinweis: Der Name des Binaries muss "fetchmail" sein. Bitte nutzen Sie einen symbolischen Link, wenn der Name anders lautet.',
        'Defines an overview module to show the address book view of a customer user list.' =>
            'Definiert ein Übersichtsmodul, dass eine Adressbuchansicht der Kundenbenutzerliste anzeigt.',
        'Specifies the group where the user needs rw permissions so that they can edit other users preferences.' =>
            'Legt die Gruppe fest, für die ein Agent Schreibrechte besitzen muss, um die persönlichen Einstellungen anderer Agenten verändern zu können.',
        'Defines email communication channel.' => 'Legt den E-Mail-Kommunikationskanal fest.',
        'Defines internal communication channel.' => 'Legt den internen Kommunikationskanal fest.',
        'Defines phone communication channel.' => 'Legt den Telefon-Kommunikationskanal fest.',
        'Defines chat communication channel.' => 'Legt den Chat-Kommunikationskanal fest.',
        'Defines groups for preferences items.' => 'Legt die Gruppen für die persönlichen Einstellungen fest.',
        'Defines how many deployments the system should keep.' => 'Legt fest, wieviele Versionen von Inbetriebnahmen im System behalten werden sollen.',
        'Defines the search parameters for the AgentCustomerUserAddressBook screen. With the setting \'CustomerTicketTextField\' the values for the recipient field can be specified.' =>
            'Bestimmt die Suchparameter für den Bildschirm AgentCustomerUserAddressBook. Mit der Einstellung \'CustomerTicketTextField\' können Werte für das Empfängerfeld vorgegeben werden.',
        'Defines the default filter fields in the customer user address book search (CustomerUser or CustomerCompany). For the CustomerCompany fields a prefix \'CustomerCompany_\' must be added.' =>
            'Definiert die Standard-Filterfelder in der Kundenbenutzer-Adressbuch-Suche (Kundenbenutzer oder Kundenunternehmen). Für Kundenunternehmen-Felder muss ein Präfix \'CustomerCompany_\' hinzugefügt werden.',
        'Defines the shown columns and the position in the AgentCustomerUserAddressBook result screen.' =>
            'Legt die angezeigten Spalten und ihre Position für den Ergebnisbildschirm von AgentCustomerUserAddressBook fest.',
        'Example package autoload configuration.' => 'Beispielhafte Autoload-Konfiguration für Pakete.',
        'Activates week number for datepickers.' => 'Kalenderwochen für Datumsauswahl aktivieren.',

        # XML Definition: Kernel/Config/Files/XML/GenericInterface.xml
        'Performs the configured action for each event (as an Invoker) for each configured web service.' =>
            'Führt die konfigurierte Aktion für jedes Ereignis für jeden konfigurierten Webservice aus (als Invoker).',
        'Cache time in seconds for the web service config backend.' => 'Cache-Zeit in Sekunden für das Webservice-Konfigurations-Backend.',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Cache-Zeit in Sekunden für Agent-Authentifizierungen im GenericInterface.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Cache-Zeit in Sekunden für Kunden-Authentifizierungen im GenericInterface.',
        'GenericInterface module registration for the transport layer.' =>
            'Modulregistrierung für Transport-Layer des GenericInterface.',
        'GenericInterface module registration for the operation layer.' =>
            'Modulregistrierung für Operation-Layer des GenericInterface.',
        'GenericInterface module registration for the invoker layer.' => 'Modulregistrierung für Invoker-Layer des GenericInterface.',
        'GenericInterface module registration for the mapping layer.' => 'Modulregistrierung für Mapping-Layer des GenericInterface.',
        'Defines the default visibility of the article to customer for this operation.' =>
            'Legt die Standardsichtbarkeit des Artikels für Kunden für diese Operation fest.',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Definiert den Verlaufstyp für diese Operation, der für den Ticket-Verlauf in der Agenten-Schnittstelle verwendet wird.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Definiert den Verlauf-Kommentar für diese Operation, der für den Ticket-Verlauf in der Agenten-Schnittstelle verwendet wird.',
        'Defines the default auto response type of the article for this operation.' =>
            'Definiert den Standard-Auto-Antwort-Typ des Artikels für diese Operation.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Legt die maximale Größe von Antworten des GenericInterfaces fest, die in der gi_debugger_entry_content-Tabelle gespeichert werden (in Kilobyte).',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Maximale Anzahl von Tickets, die als Ergebnis dieser Aktion angezeigt werden sollen.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets im Ticket-Suchergebnis von dieser Operation.',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht dieser Operation. Auf: Älteste oben. Ab: Neuste oben.',
        'GenericInterface module registration for an error handling module.' =>
            'Modulregistrierung für ein Fehlerbehandlungs-Modul des GenericInterface.',

        # XML Definition: Kernel/Config/Files/XML/ProcessManagement.xml
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Frontend-Modulregistrierung (verberge Ticket-Prozesse, falls kein Prozess verfügbar ist).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate).' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Legt fest, in welchem dynamischen Feld die Prozess-ID im Prozessmanagement gespeichert werden soll.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Legt fest, in welchem dynamischen Feld die Aktivitäts-ID im Prozessmanagement gespeichert werden soll.',
        'This option defines the process tickets default queue.' => 'Diese Option setzt die Prozess-Ticket Standard-Queue.',
        'This option defines the process tickets default state.' => 'Diese Option setzt den Standard-Status für Prozess-Tickets.',
        'This option defines the process tickets default lock.' => 'Diese Option setzt die Prozess-Ticket Standardsperre.',
        'This option defines the process tickets default priority.' => 'Diese Option setzt die Prozess-Ticket Standardpriorität.',
        'Display settings to override defaults for Process Tickets.' => 'Einstellungen zum Überschreiben der Standardwerte für Prozess-Tickets anzeigen.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key =&gt; My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface.' =>
            'Angezeigte Dynamische Felder im Prozess-Widget in der Ticket-Detailansicht des Agentenbereichs.',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'Zeigt einen Link zum Umwandeln eines regulären Tickets in ein Prozessticket in der Ticket-Detailansicht im Agenten-Interface an.',
        'Loader module registration for the customer interface.' => 'Loader-Modulregistrierung für das Kunden-Interface.',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Frontend-Modulregistrierung im Kunden-Interface (verberge Ticket-Prozesse, falls kein Prozess verfügbar ist).',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Standard Entitäts-Präfixe des Prozessmanagements für Entitäts-IDs, die automatisch generiert werden.',
        'Cache time in seconds for the DB process backend.' => 'Cache-Zeit in Sekunden für Datenbank Prozess-Backends.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Cache-Zeit in Sekunden für das Ticket-Prozess-Navigationsleisten-Ausgabemodul.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticket-Status für Prozess-Tickets im Agenten-Interface.',
        'Shows existing parent/child (separated by ::) process lists in the form of a tree or a list.' =>
            'Zeigt vorhandene Eltern/Kind (durch :: getrennte) Prozesslisten in Form eines Baums oder einer Liste an.',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            'Bestimmt die die möglichen Folge-Ticket-Status für Prozesstickets im Kundenbereich.',
        'Controls if CustomerID is read-only in the agent interface.' => 'Legt fest, ob die Kundennummer im Agentenbereich als nur lesend angezeigt wird.',
        'If enabled debugging information for transitions is logged.' => 'Wenn aktiviert, werden Informationen zur Fehlerbehebung für Transitions in Prozesstickets geloggt.',
        'Defines the priority in which the information is logged and presented.' =>
            'Definiert die Priorität in welcher die Information aufgezeichnet und präsentiert wird.',
        'Filter for debugging Transitions. Note: More filters can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'DynamicField backend registration.' => 'Backend-Registrierung für Dynamische Felder.',
        'Defines the default keys and values for the transition action module parameters. Mandatory fields are marked with "(* required)". Note: For most of the keys the AttributeID can also be used, e.g. "Owner" can be "OwnerID". Keys that define the same Attribute should only be used once, e.g. "Owner" and "OwnerID" are redundant.' =>
            'Definiert die vorausgewählten Schlüssel und Werte für die Konfigurations-Parameter bei den Übergangs-Aktionen. Notiz: Für die meisten Schlüssel können ebenfalls die AttributIDs genutzt werden, z.B. anstatt "Owner" kann "OwnerID" genutzt werden. Dabei sollten Schlüssel, die das gleiche Attribut beschreiben, nur einmal genutzt werden, z.B. wären "Owner" und "OwnerID" redundant.',

        # XML Definition: Kernel/Config/Files/XML/Ticket.xml
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Erkenner für Tickets, z. B. Ticket#, Anruf#, MeinTicket#.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Das Trennzeichen zwischen dem TicketHook und der Ticketnummer z.B. \':\'.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'Maximale Länge des Betreffs in einer E-Mail-Antwort und in einigen Übersichts-Bildschirmen.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Der Text am Anfang des Betreffs einer E-Mail Antwort, z.B. RE, AW oder AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Der Text am Anfang des Betreffs, wenn eine E-Mail weitergeleitet wird, z.B. FW, Fwd oder WG.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'Betreffsformat. "Links" führt zu "[TicketHook#:12345] Ein Betreff", "rechts" führt zu "Ein Betreff [TicketHook#:12345]". Bei Auswahl von "keine" enthält der Betreff keine Ticketnummer. In diesem Fall sollten Sie sicherstellen, dass die Einstellung PostMaster::CheckFollowUpModule###0200-References aktiviert ist, damit Folge-E-Mails anhand von E-Mail-Headern erkannt werden.',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Eine Liste der Dynamischen Felder, die während einer Zusammenführung in das Haupt-Ticket ebenfalls zusammengeführt werden. Es werden nur leere Dynamische Felder im Haupt-Ticket geändert.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Bezeichnung Ihrer persönlichen Queuekollektion. "Meine Queues" ist eine Zusammenstellung Ihrer bevorzugten Queues, die in den persönlichen Einstellungen konfiguriert werden kann.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'Bezeichnung Ihrer persönlichen Servicekollektion. "Meine Services" ist eine Zusammenstellung von bevorzugten Services, die in den persönlichen Einstellungen konfiguriert werden kann.',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            'System-Artikeltypen (z. B. Auto-Antworten oder E-Mail-Benachrichtigungen) werden in AgentTicketZoom nicht als ungelesene Artikel markiert oder in Large-Übersichten nicht automatisch aufgeklappt.',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Ändert den Besitzer der Tickets auf Alle (nützlich für ASP). In der Regel werden nur Agenten mit rw-Berechtigungen auf die Queue angezeigt.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Aktiviert das Verantwortlicher-Feature, das das Verfolgen von Tickets erlaubt.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            'Setzt den Besitzer eines Tickets automatisch auch als Verantwortlichen (wenn das Verantwortlicher-Feature aktiviert ist). Dies wird nur durch manuelle Aktionen des eingeloggten Benutzers ausgelöst, nicht durch automatische wie GenericAgent, Postmaster oder GenericInterface.',
        'Automatically change the state of a ticket with an invalid owner once it is unlocked. Maps from a state type to a new ticket state.' =>
            'Status eines Tickets mit ungültigem Besitzer bei Entsperren automatisch ändern. Bildet den neuen Ticketstatus entsprechend des Statustyps.',
        'Enables ticket type feature.' => 'Aktiviert Ticket-Typen.',
        'Defines the default ticket type.' => 'Definiert den Standardtyp für ein Ticket.',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Erlaubt die Definition von Services und SLAs für Tickets (zum Beispiel: E-Mail, Desktop, Network, ...) und Eskalationsattributen für SLAs (wenn die Ticket Service/SLA Einstellung aktiviert ist).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Behält alle Services in Auflistungen bei, auch, wenn sie Kind-Services von ungültigen Elementen sind.',
        'Allows default services to be selected also for non existing customers.' =>
            'Ermöglicht das Standard-Services auch für nicht angelegte Kunden ausgewählt werden können.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Aktiviert das Ticket Archivsystem, um ein schnelleres System zu haben, indem einige Tickets aus dem täglichen Anwendungsbereich verschoben werden. Um diese Tickets in der Suche zu finden, muss das Archiv-Flag in der Ticketsuche aktiviert werden.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Kontrolliert ob die Ticket- und Artikel "Gesehen"-Fähnchen entfernt werden, wenn ein Ticket archiviert wird.',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Entfernt die Ticket-Beobachter-Information, wenn ein Ticket archiviert wird.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Aktiviert die Suche im Ticket-Archiv für das Kunden-Interface.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). With "Random" the ticket numbers will be generated by 12 random numbers. The format looks like SystemID.RandomNumbers (e.g. 10123456789012).' =>
            'Definiert das Modul zur Generierung von Ticketnummern. "AutoIncrement" erhöht den Zähler fortlaufend, dazu werden System-ID und Zähler im Format "System-ID.Zähler" dargestellt. "Datum" generiert Ticketnummern basierend auf dem jeweiligen Datum, der System-ID und dem Zähler im Format "Jahr.Monat.Tag.System-ID.Zähler" (z. B. "200206231010138", "200206231010139"). "DateChecksum" fügt den Zähler als Checksumme nach Datum und System-ID ein. Die Checksumme ändert sich dabei täglich. Format: "Jahr.Monat.Tag.System-ID.Zähler.Checksumme" (z. B. "2002070110101520", "2002070110101535"). Mit "Random" werden die Ticketnummern aus 12 Zufallszahlen generiert. Format: "SysteID.RandomNumbers" (z.B. 10123456789012).',
        'Checks the SystemID in ticket number detection for follow-ups. If not enabled, SystemID will be changed after using the system.' =>
            'Ändert die SystemID in der Ticket-Nummernerkennung bei Rückfragen. Wenn nicht aktiviert, so wird die SystemID nach der Nutzung des Systems geändert.',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            'Legt die minimale Größe für den Ticketzähler fest, wenn "AutoIncrement" als TicketNumberGenerator gewählt wurde. Die Standardeinstellung ist 5, was bedeutet, dass der Zähler bei 10000 startet.',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Aktiviert die Minimalgröße für Ticketzähler (wenn "Datum" als TicketNumberGenerator ausgewählt ist).',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'IndexAccelerator: Auswahl des Backend-Moduls für TicketViewAccelerator. "RuntimeDB" generiert jede Queue-Ansicht dynamisch aus der Tickettabelle (keine Performance-Probleme bis zu etwa 60.000 Tickets insgesamt und 6.000 offenen Tickets im System). "StaticDB" ist das stärkste Modul, es benutzt zusätzliche Tabelle für den Ticket-Index, die wie eine Übersicht funktioniert (empfohlen bei mehr als 80.000 Tickets insgesamt und 6.000 offenen Tickets im System). Benutzen Sie das Kommando "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" für den initialen Indexaufbau.',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the Znuny user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Speicherung von Artikel-Anhängen. "DB" legt alle Daten in der Datenbank ab (nicht empfohlen für große Anhänge). "FS" legt alle Daten im Dateisystem ab; dies ist schneller, jedoch sollte der Webserver mit dem Znuny-Benutzer betrieben werden. Sie können im laufenden Betrieb ohne Datenverlust zwischen den Modulen wechseln. Bitte beachten Sie, dass das Suchen nach Anhängen für "FS" nicht unterstützt wird.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'Legt fest, ob bei der Suche nach Anhängen alle Storage-Backends geprüft werden sollen. Dies wird nur bei Installationen benötigt, bei denen sich Anhänge sowohl im Dateisystem, als auch in der Datenbank befinden.',
        'Specifies the directory to store the data in, if "FS" was selected for ArticleStorage.' =>
            'Legt das Verzeichnis zum Speichern von Daten fest, wenn "FS" als ArticleStorage gewählt wurde.',
        'Specifies whether the (MIMEBase) article attachments will be indexed and searchable.' =>
            'Legt fest, ob Anhänge von MIMEBase-Artikeln indexiert werden und durchsuchbar sein sollen.',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Die Zeitspanne in Minuten nach der Erzeugung eines Ereignisses, während der neue Vorwarn- und Start-Ereignisse unterdrückt werden.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            'Stellt ein Ticket aus dem Archiv wieder her (nur, wenn der Status auf einen der verfügbaren offen-Status geändert wird).',
        'Updates the ticket index accelerator.' => 'Aktualisiert den Ticket-Index-Beschleuniger.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Setzt den Besitzer eines TIckets zurück und entsperrt es, wenn das Ticket in eine andere Queue verschoben wird.',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Erzwingt das Setzen eines (vom aktuellen Status) abweichenden Ticket-Status nach dem Sperren eines Tickets. Legen Sie den aktuellen Status als Schlüssel und den neuen Status als Inhalt fest.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Automatisches setzen eines Ticket-Verantwortlichen (wenn er noch nicht gesetzt wurde) nach dem ersten Besitzer-Update.',
        'When agent creates a ticket, whether or not the ticket is automatically locked to the agent.' =>
            'Legt fest, ob ein Ticket beim Anlegen automatisch auf den anlegenden Agenten gesperrt werden soll.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Setzt die Wartezeit eines Tickets auf 0, wenn der Status auf einen nicht warten-Status gesetzt wird.',
        'Sends the notifications which are configured in the admin interface under "Ticket Notifications".' =>
            'Sendet eine Benachrichtigung, welche im Admin-Interface unter "Ticket-Benachrichtigen" eingestellt ist.',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Aktualisiert den Ticket-Eskalations-Index nachdem ein Ticket-Attribut aktualisiert wurde.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Ticket Event Modul welche die Eskalation-Stop-Ereignisse auslöst.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Tickets werden nach dem Verschieben in eine andere Queue entsperrt.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Aktualisieren des "Gesehen"-Merkmals, wenn jeder Artikel betrachtet oder ein neuer Artikel erstellt wurde.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Ereignis-Modul, das ein Ticket aktualisiert nach einem Update des Kunden.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Ereignis-Modul, das ein Ticket aktualisiert nach einem Update des Kundenbenutzers.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser setting.' =>
            'Definiert eine Zuordnung zwischen Variablen der Kundenbenutzerdaten (Schlüssel) und dynamischen Feldern eines Ticket (Werte). Somit können Sie Kundenbenutzerdaten eines Tickets in dynamische Felder speichern. Die dynamischen Felder müssen im System vorhanden sein und sollten für AgentTicketFreeText aktiviert werden, damit sie eingestellt / manuell durch den Agenten aktualisiert werden können. Sie dürfen nicht für AgentTicketPhone, AgentTicketEmail und AgentTicketCustomer aktiviert werden. Wenn dies der Fall ist, so haben sie Vorrang gegenüber den automatisch gesetzten Werten. Um dieses Mapping zu verwenden, müssen Sie auch dieTicketTicket Einstellung Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser aktivieren.',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see DynamicFieldFromCustomerUser::Mapping setting for how to configure the mapping.' =>
            'Dieses Eventmodul speichert Attribute des Kundenbenutzers als Werte von dynamischen Feldern. Bitte schauen sie sich die DynamicFieldFromCustomerUser::Mapping-Einstellung für die Konfiguration des Mappings an.',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Überlädt existierende Funktionen in Kernel::System::Ticket (redefining). Kann genutzt werden, um möglichst einfach Anpassungen vorzunehmen.',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). It will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild".' =>
            'Hilft beim Erweitern Ihres Artikel-Volltext-Suchindexes (Von-, An-, Cc-, Betreffs- und Text-Suche). Es erstellt einen Index nach Artikelerstellung, wodurch die Geschwindigkeit von Volltextsuchen um rund 50% steigt. Nutzen Sie "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild", um einen initialen Index zu erstellen.',
        'Defines whether to index archived tickets for fulltext searches.' =>
            'Legt fest, ob archivierte Tickets im Index für Volltextsuchen berücksichtigt werden sollen.',
        'Force the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            'Erzwingt die Speicherung der originalen Artikelinhalte im Artikel-Suchindex, ohne dabei Filter und Stopp-Worte anzuwenden. Dadurch wird die Größe des Suchindex erhöht, was Volltextsuchen verlangsamen kann.',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'Zeigt eine Warnung an und verhindert die Suche, wenn Stop-Wörter in der Volltextsuche eingegeben werden.',
        'Basic fulltext index settings. Execute "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" in order to generate a new index.' =>
            'Basis-Einstellungen für den Volltext-Index. Führen Sie "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" aus, um den Index neu zu erstellen.',
        'Fulltext index regex filters to remove parts of the text.' => 'Volltextindex-Regex-Filter, um Textteile zu entfernen.',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Englische Stopworte für den Volltext-Index. Diese Worte werden aus dem Index entfernt.',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Deutsche Stoppwörter für den Volltext-Index. Diese Wörter werden von Suchindex entfernt.',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Niederländische Stoppwörter für den Volltext-Index. Diese Wörter werden vom Suchindex entfernt.',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Spanische Stoppworte für den Volltext-Index. Diese Worte werden aus dem Suchindex entfernt.',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Französische Stoppwörter für den Volltext-Index. Diese Wörter werden vom Suchindex entfernt.',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Italienische Stoppwörter für den Volltext-Index. Diese Wörter werden von Suchindex entfernt.',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Anpassbare Stopworte für den Volltext-Index. Diese Worte werden aus dem Suchindex entfernt.',
        'Allows having a small format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo =&gt; 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Gibt an, welche Artikel-Sendertypen in der Vorschau eines Tickets angezeigt werden sollen.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Legt die Anzahl von Artikeln fest, die im Vorschau-Modus von Ticketübersichten sichtbar sein soll.',
        'Defines if the first article should be displayed as expanded, that is visible for the related customer. If nothing defined, latest article will be expanded.' =>
            'Gibt an, ob der erste für den Kunden sichtbare Artikel beim Öffnen der Übersichtsansicht aufgeklappt dargestellt werden soll. Wenn nichts angegeben ist, wird der neueste Artikel aufgeklappt dargestellt.',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Zeit in Sekunden wird der aktuellen Zeit hinzugefügt wenn ein unerledigter-zustand gesetzt wird (Standard: 86400 = 1 Tag).',
        'Define the max depth of queues.' => 'Definiert die maximale Tiefe von Queues.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Zeigt Queues als Liste oder Baumstruktur (mit Eltern-/Kind-Beziehung) an.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Aktiviert oder deaktiviert das Ticket beobachten-Feature, das das beobachten von Tickets erlaubt, ohne der Besitzer oder Verantwortliche zu sein.',
        'Enables ticket watcher feature only for the listed groups.' => 'Aktiviert das Ticket beobachten-Feature nur für die eingetragenen Gruppen.',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Aktiviert das Stapelverarbeitungs-Feature für das Agenten-Interface, das das gleichzeitige Bearbeiten von mehreren Tickets erlaubt.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Aktiviert das Stapelverarbeitungs-Feature nur für die eingetragenen Gruppen.',
        'Defines time in minutes since last modification for drafts of specified type before they are considered expired.' =>
            'Legt die Zeit in Minuten seit der letzten Änderung von Entwürfen des gewählten Typs fest, bis diese als veraltet gelten.',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Zeigt einen Link um das geöffnete Ticket im Rohformat anzuzeigen.',
        'Shows all the articles of the ticket (expanded) in the agent zoom view.' =>
            'Zeigt alle Artikel in der Ticket-Zoom-Ansicht (ausgeklappte Ansicht).',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Legt fest, ob die Liste von Artikeln in der Ticket-Detailansicht normal oder umgekehrt sortiert sein soll.',
        'Shows the article head information in the agent zoom view.' => 'Zeigt die Kopfinformationen des Artikels in der Detailansicht.',
        'Shows a count of attachments in the ticket zoom, if the article has attachments.' =>
            'Zeigt die Anhang-Anzahl im Ticket-Zoom an, wenn der Artikel Anhänge besitzt.',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Zeigt die bisher benötigte Zeit für einen Artikel in der TicketZoomView an.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Aktiviert verschiedene Artikelfilter in der Zoomansicht, um festzulegen, welche Artikel angezeigt werden sollen.',
        'Displays the number of all tickets with the same CustomerID as current ticket in the ticket zoom view.' =>
            'Zeigt die Anzahl aller Tickets mit derselben Kundennummer wie das aktuelle Ticket in der Ticket-Zoom-Ansicht an.',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Zeigt die Änderungschronik (umgekehrte Reihenfolge) in der Agentenoberfläche an.',
        'Controls how to display the ticket history entries as readable values.' =>
            'Kontrolliert wie die Ticket-Historie in lesbaren Werten dargestellt wird.',
        'Permitted width for compose email windows.' => 'Erlaubte Breite für E-Mail erstellen-Fenster.',
        'Permitted width for compose note windows.' => 'Erlaubte Breite für Notiz erstellen-Fenster.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Maximale Größe (in Reihen) des "Informiere Agenten" Kästchen im Agenten-Interface.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Maximale Größe (in Reihen) des "Beteiligte Agenten" Kästchen im Agenten-Interface.',
        'Makes the application block external content loading.' => 'Lässt die Anwendung das Laden externer Inhalte blockieren.',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Zeigt Informationen zum jeweiligen Kundenbenutzer (Telefon und E-Mail) im Verfassen-Bildschirm.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Maximale Größe (Buchstaben) der Kundeninformationen (Telefon und E-Mail) in der Erfassungs-Oberfläche.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Maximale Zeichenanzahl für die Tabelle mit Kundeninformationen in der TicketZoom-Ansicht.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'Maximale Länge (Buchstaben) von Dynamischen Feldern in der Seitenleiste in der TicketZoom-Übersicht.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'Maximale Länge (Buchstaben) von Dynamischen Felder von Artikeln in der TicketZoom-Übersicht.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Legt fest, ob Kunden die Möglichkeit haben ihre Tickets zu sortieren.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Diese Option verweigert den Zugriff auf Tickets von anderen Kundenbenutzern mit dem selben Kundenunternehmen.',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Benutzerdefinierter Text für Kunden, die noch keine Tickets haben (wenn Sie für diesen Text eine Übersetzung wünschen, fügen Sie die Übersetzung in einem eigenen Übersetzungsmodul hinzu).',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Zeigt entweder den Betreff des neusten Kundenartikels oder den Tickettitel in der Kompakt-Ansicht von Ticketübersichten.',
        'Show the current owner in the customer interface.' => 'Steuert, ob der aktuelle Besitzer im Kundenbereich angezeigt werden soll.',
        'Show the current queue in the customer interface.' => 'Steuert, ob die aktuelle Queue im Kundenbereich angezeigt werden soll.',
        'Dynamic fields shown in the ticket overview screen of the customer interface.' =>
            'Angezeigte dynamische Felder in der Ticketübersicht des Kundenbereichs.',
        'Strips empty lines on the ticket preview in the queue view.' => 'Entfernt leere Zeilen in der Ticket-Vorschau in der Queue-Ansicht.',
        'Shows all both ro and rw queues in the queue view.' => 'Zeigt sowohl rw als auch ro Queues in der Queue-Ansicht.',
        'Show queues even when only locked tickets are in.' => 'Queues auch dann anzeigen, wenn sich darin nur gesperrte Tickets befinden.',
        'Enable highlighting queues based on ticket age.' => 'Hervorheben von Queues nach Ticketalter aktivieren.',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Queues mit unbearbeiteten Tickets hervorgehoben werden (erstes Level).',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Queues mit unbearbeiteten Tickets hervorgehoben werden (zweites Level).',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Aktiviert einen Blinkmechanismus der Queue, die das älteste Ticket enthält.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Tickets von Unterqueues automatisch mit einschließen, wenn eine Queue ausgewählt wird.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Steuert die Sortierreihenfolge von Tickets bei Auswahl einer einzelnen Queue in der Queue-Ansicht nach dem Sortieren nach Priorität. Mögliche Werte: 0 = aufsteigend (älteste Tickets zuerst), 1 = absteigend (neuste Tickets zuerst). Tragen Sie die ID der Queue als Schlüssel und 0 oder 1 als Wert ein.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Queue-Ansicht angezeigten Queues.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Definiert ob in der Queue-Ansicht eine Vorsortierung anhand der Priorität vorgenommen werden soll.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Queue-Ansicht angezeigten Queues, nachdem nach Priorität sortiert wurde.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Entfernt leere Zeilen in der Ticket-Vorschau in der Service-Ansicht.',
        'Shows all both ro and rw tickets in the service view.' => 'Zeigt sowohl rw als auch ro Queues in der Service-Ansicht.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'Steuert die Sortierreihenfolge von Tickets bei Auswahl eines einzelnen Services in der Service-Ansicht nach dem Sortieren nach Priorität. Mögliche Werte: 0 = aufsteigend (älteste Tickets zuerst), 1 = absteigend (neuste Tickets zuerst). Tragen Sie die ID der Queue als Schlüssel und 0 oder 1 als Wert ein.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Service-Ansicht angezeigten Services.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Bestimmt, ob in der Service-Ansicht eine Vorsortierung anhand der Priorität vorgenommen werden soll.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Definiert die standardmäßig eingestellten Sortierkriterien für alle in der Service-Ansicht angezeigten Services, nachdem nach Priorität sortiert wurde.',
        'Enable highlighting services based on ticket age.' => 'Hervorheben von Services nach Ticketalter aktivieren.',
        'Sets the age in minutes (first level) for highlighting services that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Services mit unbearbeiteten Tickets hervorgehoben werden (erstes Level).',
        'Sets the age in minutes (second level) for highlighting services that contain untouched tickets.' =>
            'Definiert das Ticket Alter in Minuten bevor die Services mit unbearbeiteten Tickets hervorgehoben werden (zweites Level).',
        'Activates a blinking mechanism of the service that contains the oldest ticket.' =>
            'Aktiviert einen Blinkmechanismus des Services, welcher das älteste Ticket enthält.',
        'Activates time accounting.' => 'Aktiviert die Zeitabrechnung.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Legt die bevorzugten Zeiteinheiten fest (z.B. Arbeitseinheiten, Stunden, Minuten).',
        'Defines if time accounting is mandatory in the agent interface. If enabled, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            'Definiert ob die Zeiterfassung verpflichtend im Agenten-Interface ist. Wenn diese Funktion aktiviert ist, muss eine Notiz für alle Ticketaktionen (egal ob die Notiz als aktiv konfiguriert ist oder ursprünglich zwingend für die individuellen Ticket-Aktionen konfiguert wurde).',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Bestimmt, ob das Zeiterfassungs-Feld für alle Tickets im Stapelverarbeitungs-Bildschirm gesetzt werden soll.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Status-Anzeige im Agent-Interface.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung (nach der Sortierung nach Priorität) für die Status-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Definiert die benötigten Rechte, um ein Ticket in der Eskalationsansicht der Agenten-Oberfläche anzuzeigen.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Eskalations-Anzeige im Agent-Interface.',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung (nach der Sortierung nach Priorität) für die Eskalations-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            'Ermöglicht erweiterte Suchbedingungen in der Ticketsuche der Agentenschnittstelle. Mit dieser Funktion können Sie z. B. den Titel eines Tickets mit Bedingungen wie "(*key1*&amp;&amp;*key2*)" oder "(*key1*||*key2*)" suchen.',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Maximale Anzahl von Tickets, die im Suchergebnis des Agenten-Interfaces angezeigt werden sollen.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Anzahl von Tickets pro Seite in Suchergebnissen im Agentenbereich.',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Anzahl von Zeilen (pro Ticket), die über das Such-Tool im Agentenbereich angezeigt werden.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets des Ticket-Suchergebnis im Agent-Interface.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'Exportiert den vollständigen Artikelbaum im Suchergebnis (kann die System-Performance beeinträchtigen).',
        'Data used to export the search result in CSV format.' => 'Daten die verwendet werden um das Suchergebnis im CSV-Format zu exportieren.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Schließt Artikel-Erstellzeiten in die Ticketsuche im Agentenbereich mit ein.',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Definiert die standardmäßig angezeigten Ticketsuchattribute für die Ticketsuche.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Standarddaten, die als Attribute für die für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketCreateTimePointFormat = Jahr; TicketCreateTimePointStart = Letzter; TicketCreateTimePoint = 2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Standarddaten, die als Attribute für die für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".' =>
            'Standarddaten, die als Attribute für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".' =>
            'Standarddaten, die als Attribute für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".' =>
            'Standarddaten, die als Attribute für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".' =>
            'Standarddaten, die als Attribute für die Ticket-Suchmaske verwendet werden. Beispiel: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Gesperrte-Tickets-Anzeige im Agent-Interface.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Gesperrt-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Verantwortlicher-Anzeige im Agent-Interface.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Verantwortlicher-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Beobachten-Anzeige im Agent-Interface.',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Beobachten-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Benötigte Rechte um den "Freitext"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Freitext-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Freitext-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets if service must be selected by the agent.' => 'Gibt an, ob ein Service durch einen Agenten ausgewählt sein muss.',
        'Sets if SLA must be selected by the agent.' => 'Gibt an, ob ein SLA durch einen Agenten ausgewählt sein muss.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Freitext-Bildschirm von Tickets im Agentenbereich.',
        'Sets if queue must be selected by the agent.' => 'Legt fest, ob Agenten eine Queue wählen müssen.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Setzt den Besitzer im Freitext-Bildschirm für Tickets im Agentenbereich.',
        'Sets if ticket owner must be selected by the agent.' => 'Gibt an, ob ein Ticket-Besitzer durch einen Agenten ausgewählt sein muss.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Freitext-Bildschirm für Tickets im Agentenbereich.',
        'Sets if ticket responsible must be selected by the agent.' => 'Legt fest, ob Agenten einen Verantwortlichen wählen müssen.',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            'Setzt den Status im Freitext-Bildschirm für Tickets im Agentenbereich.',
        'Sets if state must be selected by the agent.' => 'Legt fest, ob Agenten einen Status wählen müssen.',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket FreiText" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Freitextfelder-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt im Agenten-Interface das Hinzufügen von Notizen im \'Freie-Felder\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Setzt ob eine Notiz vom Agenten ausgefüllt werden muss. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff einer Notiz im Ticket-Freitext-Bildschirm des Agenten-Interfaces.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Definiert den Standard-Inhalt einer Notiz in der TicketFreeText-Oberfläche im Agenten-Interface.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Zeigt in der "Ticket FreiText" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            'Zeigt in der "Ticket-FreiText"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket free text screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm für Freitextfelder des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Freitextfelder-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Freie Felder\'-Oberfläche im Agenten-Interface.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Freitextfelder-Bildschirm des Agentenbereichs.',
        'Allows to save current work as draft in the ticket free text screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Freitext-Felder-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket FreiText" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Steuert den Historien-Kommentar für die Freitext-Aktion im Agentenbereich.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Benötigte Rechte um den "Ausgehender Telefonanruf"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt den Standard-Absendertp für Telefon-Tickets in der Ausgehende-Telefon-Tickets-Anzeige in der Agenten-Oberfläche.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Telefon-Tickets in der Ausgehende-Telefon-Tickets-Anzeige in der Agent-Oberfläche.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Bestimmt die Vorbelegung des Textfeldes für Telefon-Tickets im Bildschirm für ausgehende Anrufe im Agenten-Interface.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Steuert den Ticketstatus, nachdem eine Notiz über den "Ausgehender Anruf"-Bildschirm im Agentenbereich hinzugefügt wurde.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Mögliche Folgestatus für Tickets, nachdem über den Ausgehender Anruf-Bildschirm im Agentenbereich eine Telefonnotiz hinzugefügt wurde.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ausgehender Telefonanruf" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ausgehender Telefonanruf" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Allows to save current work as draft in the ticket phone outbound screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Ausgehender-Anruf-Bildschirm des Agentenbereichs.',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'Benötigte Rechte um den "Eingehender Telefonanruf"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt den Standard-Absendertyp für Telefon-Tickets in der Eingehende-Telefon-Tickets-Anzeige im Agenten-Interface.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Telefon-Tickets in der Eingehende-Telefon-Tickets-Anzeige in der Agent-Oberfläche.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Bestimmt die Vorbelegung des Textfeldes für Telefon-Tickets im Bildschirm für eingehende Anrufe im Agenten-Interface.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Steuert den Ticketstatus, nachdem eine Notiz über den "Ausgehender Anruf"-Bildschirm im Agentenbereich hinzugefügt wurde.',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Mögliche Folgestatus für Tickets, nachdem über den Eingehender Anruf-Bildschirm im Agentenbereich eine Telefonnotiz hinzugefügt wurde.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Eingehender Telefonanruf" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Eingehender Telefonanruf" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Allows to save current work as draft in the ticket phone inbound screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Eingehender-Anruf-Bildschirm des Agentenbereichs.',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Zeigt eine Besitzerauswahl in Telefon- und E-Mail-Tickets im Agentenbereich an.',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Steuert, ob in Telefon- und E-Mail-Tickets eine Auswahl für den verantwortlichen Agenten angezeigt werden soll (Agentenbereich).',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'Legt die Art des Empfängers für Telefon-Tickets und des Absenders für E-Mail-Tickets im Agenten-Bereich fest ("Queue" zeigt alle Queues, "System address" alle System-Adressen).',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "&lt;Queue&gt;" shows the names of the queues and for SystemAddress "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'Definiert, welche Optionen für den Empfänger (Telefon-Ticket) und den Absender (E-Mail-Ticket) im Agenten-Interface gültig sind.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Zeigt die andere Tickets des Kunden in AgentTicketPhone, AgentTicketEmail und AgentTicketCustomer.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Wenn aktiviert, werden TicketPhone und TicketEmail in neuen Fenstern geöffnet.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Setzt die Standard Priorität für neue Telefon-Tickets in der Agenten-Oberfläche.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Bestimmt den Standard-Sendertyp für neue Telefon-Tickets im Agentenbereich.',
        'Sets the default article customer visibility for new phone tickets in the agent interface.' =>
            'Bestimmt die voreingestellte Sichtbarkeit von Artikeln für Kunden in Telefon-Tickets im Agentenbereich.',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Kontrolliert, ob mehr als ein Eintrag in einem neuen Telefon-Ticket festgelegt werden kann.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Bestimmt den Standard-Betreff für neue Telefon-Tickets (z.B. "Telefonanruf") im Agentenbereich.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Setzt die Standard Notiz für neue Telefon-Tickets. z.B. "Neues Ticket durch Anruf" im Agenten-Interface.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Setzt den Standard Ticket-Status für neue Telefon-Tickets in der Agenten-Oberfläche.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticketstatus, nachdem ein neues Telefon-Ticket im Agenten-Interface erstellt wurde.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Neues Telefon Ticket" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für Telefon-Ticket im Agentenbereich.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Bestimmt den Standard-Linktyp für geteilte Tickets im Agentenbereich.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Setzt die Standard Priorität für neue E-Mail-Tickets in der Agenten-Oberfläche.',
        'Sets the default article customer visibility for new email tickets in the agent interface.' =>
            'Bestimmt die voreingestellte Sichtbarkeit von Artikeln für Kunden in E-Mail-Tickets im Agentenbereich.',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Bestimmt den Standard-Sendertyp für neue E-Mail-Tickets im Agentenbereich.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Bestimmt den Standard-Betreff für neue E-Mail-Tickets (z.B. "Ausgehende E-Mail") im Agentenbereich.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Bestimmt den Standardtext für neue E-Mail-Tickets im Agentenbereich.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Setzt den Standard Ticket-Status für neue E-Mail-Tickets im Agenten-Interface.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Definiert den Nächstmöglichen Ticketstatus, nachdem ein neues E-Mailticket im Agenten-interface erstellt wurde.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Neues Email Ticket" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für Emailtickets im Agentenbereich.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Benötigte Rechte um den "Schließen"-Dialog im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Schließen-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Schließen-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Schließen-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Setzt den Besitzer im Schließen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Schließen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            'Setzt den Status im Schließen-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Schließen" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Schließen-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt im Agenten-Interface das Hinzufügen von Notizen im \'Schließen\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticket schließen-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Schließen" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Zeigt in der "Ticket Schließen" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            'Zeigt in der "Ticket Schließen"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the close ticket screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zum Schließen von Tickets des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Schließen-Bildschirm im Agentenbereich.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Schließen\'-Oberfläche im Agenten-Interface.',
        'Shows the title field in the close ticket screen of the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Schließe-Ticket-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the close ticket screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Schließen-Bildschirm des Agentenbereichs.',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Schließen" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für die Ticket schließen-Aktion im Agentenbereich.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Benötigte Rechte um den "Notiz"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Ticket-Notiz-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Notiz-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Notiz-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Setzt den Besitzer im Notiz-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Notiz-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            'Setzt den Status im Notiz-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Notiz" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Notiz-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt im Agenten-Interface das Hinzufügen von Notizen im \'Notiz\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketnotiz-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Notiz" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Zeigt in der "Ticket Notiz" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            'Zeigt in der "Ticket-Notiz"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung für Notizen in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket note screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zum Erfassen von Notizen des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Notiz hinzufügen-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Notiz\'-Oberfläche im Agenten-Interface.',
        'Shows the title field in the ticket note screen of the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Notiz-Hinzufügen-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the ticket note screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Notiz-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Notiz" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Steuert den Historien-Kommentar für die Ticketnotiz-Aktion im Agentenbereich.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Besitzer"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Besitzer-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Besitzer-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Besitzer-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Besitzer-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Besitzer-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Status im Besitzer-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz im "Ticket Besitzer" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Besitzer-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Besitzer\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketbesitzer-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Besitzer" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Besitzer" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket-Besitzer"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung für Notizen in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket owner screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Besitzer-Bildschirm des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Besitzer wechseln-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Besitzer\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Shows the title field in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Besitzer-Wechseln-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the ticket owner screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Besitzer-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Besitzer" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket-Besitzer" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Warten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Wartezeit-Setzen-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Wartezeit setzen-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Status im Wartezeit setzen-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Warten auf Erinnerung" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Warten bis-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt im Agenten-Interface in einem geöffneten Ticket das Hinzufügen von Notizen im \'Warten\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Wartezeit für Ticket setzen-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Warten auf Erinnerung" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Warten auf Erinnerung" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Warten auf Erinnerung"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung für Notizen in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket pending screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zum Setzen von Wartezeiten des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Wartezeit setzen-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Warten\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Shows the title field in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Wartezeit-Setzen-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the ticket pending screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Warten-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Warten auf Erinnerung" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Warten auf Erinnerung" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Priorität"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Ticket-Prioritäts-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Ticket-Prioriäten-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Priorität-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Besitzer im Priorität-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Priorität-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Setzt den Status im Priorität-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Ticket Priorität" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Prioritäts-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Priorität\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketprioriät-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Priorität" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket Priorität" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt in der "Ticket-Priorität"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung für Notizen in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket priority screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zum Setzen einer Priorität des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Priorität setzen-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Priorität\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Shows the title field in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Priorität-Setzen-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the ticket priority screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Priorität-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Priorität" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket Priorität" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Benötigte Rechte um den "Verantwortlicher"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be enabled).' =>
            'Setzt den Ticket-Typ im Verantwortlicher-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service im Verantwortlicher-Bildschirm für Tickets im Agentenbereich (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue im Verantwortlicher-Bildschirm von Tickets im Agentenbereich.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Setzt den Besitzer im Verantwortlicher-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Verantwortlicher-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            'Setzt den Status im Verantwortlicher-Bildschirm von Tickets im Agentenbereich.',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem hinzufügen einer Notiz in der "Ticket Verantwortlicher" Ansicht der Agenten-Oberfläche.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Verantwortlicher-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Erlaubt in der Agentenoberfläche in einem geöffneten Ticket das Hinzufügen von Notizen im \'Verantwortlichen\'-Bildschirm. Kann durch Ticket::Frontend::NeedAccountedTime überschrieben werden.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticketverantwortlicher-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Verantwortlicher" Ansicht in der Agenten-Oberfläche.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Zeigt in der "Ticket Verantwortlicher" Ansicht der Agenten-Oberfläche eine Liste aller am Ticket beteiligten Agenten.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            'Zeigt in der "Ticket-Verantwortlicher"-Ansicht der Agenten-Oberfläche eine Liste aller möglichen Agenten (alle Agenten mit mindestens RO-Berechtigung für Notizen in diesem Ticket/dieser Queue), die informiert werden sollen.',
        'Defines if the note in the ticket responsible screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zum Setzen eines Verantwortlichen des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Verantwortlicher setzen-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Verantwortlicher\'-Oberfläche im TicketZoom im Agenten-Interface.',
        'Shows the title field in the ticket responsible screen of the agent interface.' =>
            'Zeigt das Feld zur Eingabe eines Ticket-Titels im Verantwortlicher-Setzen-Bildschirm der Agentenoberfläche.',
        'Allows to save current work as draft in the ticket responsible screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Verantwortlicher-Bildschirm des Agentenbereichs.',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Typ für die Aktion "Ticket Verantwortlicher" welcher für die Ticket-Historie in der Agenten-Oberfläche benutzt wird.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Ticket-Verantwortlicher" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Automatisches Sperren und setzen des aktuellen Agenten als Besitzer nachdem der Sammelaktion-Bildschirm gewählt wurde.',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Setzt den Ticket-Typ im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich (Ticket::Type muss aktiviert sein).',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Setzt den Besitzer im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Setzt den verantwortlichen Agenten im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            'Setzt den Status im Stapelverarbeitungs-Bildschirm für Tickets im Agentenbereich.',
        'Defines the next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            'Definiert den Folgestatus für ein Ticket, im Stapelverarbeitungs-Bildschirm im Agenten-Interface.',
        'Defines the default next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            'Definiert den standardmäßigen Folgestatus für ein Ticket in der Stapelverarbeitungs-Ansicht im Agenten-Interface.',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im Stapelverarbeitungs-Bildschirm des Agentenbereichs.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Definiert die Standard-Ticketpriorität in der \'Sammelaktion\'-Oberfläche im Agenten-Interface.',
        'Defines if the note in the ticket bulk screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Notiz im Bildschirm zur Stapelverarbeitung von Tickets des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Bestimmt ob die Liste möglicher Queues in die ein Ticket verschoben werden kann als eine DropDown-Liste angezeigt wird oder in einem neuen Fenster. Wenn "Neues Fenster" eingestellt ist, können Sie ein Verschiebe-Notiz zum Ticket hinzufügen.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Automatisches Sperren und setzen des aktuellen Agenten als Besitzer nachdem der Verschieben-Bildschirm im Agenten-Interface geöffnet wurde.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Erlaubt das Setzen eines neuen Ticket-Status im Verschieben-Bildschirm im Agenten-Interface.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Definiert den nächsten Ticket Status nach dem verschieben in eine andere Queue in der "Ticket Queue" Ansicht der Agenten-Oberfläche.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Zeigt die Auswahl zur Einstellung der Ticket-Priorität im verschieben-Bildschirm des Agentenbereichs.',
        'Allows to save current work as draft in the ticket move screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Verschieben-Bildschirm des Agentenbereichs.',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Benötigte Rechte um den "Umleiten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Umleiten-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Legt den Folgestatus eines über den Umleiten-Bildschirm des Agenten-Bereichs umgeleiteten Tickets fest.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Definiert die Standardbenachrichtigung für umgeleitete Tickets für Kunden/Absender im Umleiten-Bildschirm des Agentenbereichs.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Benötigte Rechte um den "Verfassen"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, auf die ein Agent im Antworten-Bildschirm im Agenten-Interface geantwortet hat.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Definiert den nächsten möglichen Status nach Erstellen eines / Antworten auf ein Ticket im Verfassen-Bildschirm im Agenten-Interface.',
        'Defines if the message in the ticket compose screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Nachricht im Verfassen-Bildschirm des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Allows to save current work as draft in the ticket compose screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Verfassen-Bildschirm des Agentenbereichs.',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Steuert das Format von Antworten im Ticket erstellen-Bildschirm im Agentenbereich ([% Data.OrigFrom | html %] entspricht genau dem Absender, [% Data.OrigFromName | html %] enthält nur den realen Namen des Absenders).',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'Legt das genutzte Zeichen für Zitate in Plaintext-E-Mails im Verfassen-Bildschirm des Agentenbereichs fest. Bleibt das Feld leer oder ist die Einstellung nicht aktiviert, wird die ursprüngliche E-Mail nicht zitiert, sondern an die Antwort angehängt.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Legt die maximale Anzahl an zitierten Zeilen fest, die zu Antworten hinzugefügt werden.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Fügt die Kunden E-Mailadresse zu den Empfängern hinzu in der "TicketCompose"-Oberfläche des Agenten-Interface hinzu. Die Kunden E-Mailadresse wird nicht hinzugefügt, wenn der Artikel-Typ \'email an intern\' ist.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Ersetzt den ursprünglichen Absender durch die E-Mail-Adresse des aktuellen Kunden beim Verfassen einer Antwort im Ticket verfassen-Bildschirm des Agentenbereichs.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Benötigte Rechte um den "Weiterleiten"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, für die im Weiterleiten-Bildschirm im Agenten-Interface eine Notiz hinzugefügt wurde.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Legt die möglichen Folgestatus fest, die nach dem Weiterleiten eines Tickets im Weiterleiten-Bildschirm des Agenten-Bereichs gewählt werden können.',
        'Defines if the message in the ticket forward screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Nachricht im Weiterleiten-Bildschirm des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Allows to save current work as draft in the ticket forward screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Weiterleiten-Bildschirm des Agentenbereichs.',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Benötigte Rechte, um den Dialog für ausgehende Emails im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Bestimmt den Folgestatus für Tickets, nachdem eine ausgehende E-Mail versendet wurde.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Definiert die nächsten, auswählbaren Status, nachdem eine ausgehende Email versendet wurde.',
        'Defines if the message in the email outbound screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Nachricht im Bildschirm für ausgehende E-Mails des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Required permissions to use the email resend screen in the agent interface.' =>
            'Benötigte Rechte, um den Dialog zum erneuten Senden von E-Mails im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the email resend screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Defines if the message in the email resend screen of the agent interface is visible for the customer by default.' =>
            'Gibt an, ob die Nachricht im Bildschirm für neu zu sendende E-Mails des Agentenbereichs standardmäßig für den Kunden sichtbar sein soll.',
        'Allows to save current work as draft in the email outbound screen of the agent interface.' =>
            'Erlaubt das Speichern des aktuellen Stands als Entwurf im Ausgehende-E-Mail-Bildschirm des Agentenbereichs.',
        'Required permissions to use the ticket merge screen of a zoomed ticket in the agent interface.' =>
            'Benötigte Rechte um den "Zusammenfassen"-Dialog eines Tickets im Agenten-Interface aufzurufen.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Benötigte Rechte um den Kunden eines Tickets im Agenten-Interface zu ändern.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Bestimmt, ob dieser Screen im Agenten-Interface das Sperren des Tickets voraussetzt. Das Ticket wird (falls nötig) gesperrt und der aktuelle Agent wird als Besitzer gesetzt.',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Wenn Tickets zusammengefasst werden, kann der Kunde durch Setzen des Kontrollkästchens "Sender informieren" per E-Mail informiert werden. In diesem Bereich können Sie einen vorformatierten Text definieren, der später durch die Agents modifiziert werden kann.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Wenn Tickets zusammengefasst werden, wird automatisch zu dem Ticket, das nicht länger aktiv ist, eine Notiz hinzugefügt. Hier können Sie den Gegenstand dieser Notiz definieren (dieser Text kann nicht durch den Agent verändert werden).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Wenn Tickets zusammengefasst werden, wird automatisch zu dem Ticket, das nicht länger aktiv ist, eine Notiz hinzugefügt. Hier können Sie den Textköper dieser Notiz definieren (dieser Text kann nicht durch den Agent verändert werden).',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Definiert die standardmäßigen sichtbaren Sendertypen eines Tickets (Standard: Kunde).',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            'Bestimmt die sichtbaren Sperrtypen eines Tickets. Hinweis: Bitte stellen Sie sicher, dass Sie bei Veränderung dieser Einstellung den Cache leeren.',
        'Defines the valid state types for a ticket. If a ticket is in a state which have any state type from this setting, this ticket will be considered as open, otherwise as closed.' =>
            'Definiert die gültigen Statustypen für ein Ticket. Wenn sich ein Ticket in einem Status befindet, der einen Statustyp aus dieser Einstellung hat, gilt dieses Ticket als offen, ansonsten als geschlossen.',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'Bestimmt gültige Status für entsperrte Tickets. Um Tickets zu entsperren, kann das Script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" genutzt werden.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Sendet eine Erinnerung eines Entsperrten Tickets nachdem das Erinnerungsdatum erreicht wurde. (Nur zum Besitzer des Tickets gesendet).',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be enabled).' =>
            'Verhindert das Versenden von Erinnerungen an den Verantwortlichen eines Tickets. (Ticket::Responsible muss aktiviert sein).',
        'Defines the state type of the reminder for pending tickets.' => 'Definiert den Statusttyp des Reminders für Tickets die auf "Warten" gesetzt sind.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Bestimmt die möglichen Status eines unerledigten Tickets, das den Status verändert hat nachdem die Zeitbegrenzung erreicht wurde.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Definiert welcher Status automatisch gesetzt wird (Inhalt), nachdem die Wartenzeit eines Status (Schlüssel) erreicht wurde.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Definiert eine externen Verbindung zu einer Kundendatenbank (z.B.: \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Definiert das \'target\'-Attribut eines Links zu einer externen Kunden-Datenbank. Z.B. \'target="cdb"\'.',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'Definiert das \'target\'-Attribut eines Links zu einer externen Kunden-Datenbank. Z.B. \'AsPopup PopupType_TicketAction\'.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Symbol in der Toolbar, um schnell zur entsprechenden Funktion zu gelangen. Die Gruppenspezifische Sichtbarkeit dieses Links kann durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der Tickets, für die der Agent verantwortlich ist. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der beobachteten Tickets. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der gesperrten Tickets. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der Tickets in "Meien Dienste". Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die Volltext-Suche über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die CIC-Suche über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen-Modul für den Zugriff auf die Such-Profile über die Navigationsleiste. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            'Modul zum Generieren eines HTML-OpenSearch-Profils für die Ticket-Schnellsuche im Agentenbereich.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Modul für die Anzeige von Benachrichtigungen und Eskalationen (ShownMax: max. angezeigte Eskalationen, EscalationInMinutes: Tickets, die in x Minuten eskalieren, CacheTime: Cache der kalkulierten Eskalationen in Minuten).',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Kunden-Tickets (Symbol), die die offenen Tickets eines Kunden als Infoblock anzeigt. Setzen Sie die Einstellung CustomerUserLogin auf 1 um Tickets auf Basis des Login-Namens zu suchen anstatt auf Basis der CustomerID.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Kunden-Tickets (Symbol), die die geschlossenen Tickets eines Kunden als Infoblock anzeigt. Setzen Sie die Einstellung CustomerUserLogin auf 1 um Tickets auf Basis des Login-Namens zu suchen anstatt auf Basis der CustomerID.',
        'Agent interface article notification module to check PGP.' => 'Benachrichtigungsmodul im Agenten-Interface das die PGP-Überprüfung durchführt.',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Modul im Agenten-Interface um eingehende E-Mails in der TicketZoomView auf vorhandene und gültige S/MIME-Schlüssel zu überprüfen.',
        'Agent interface article notification module to check S/MIME.' =>
            'Benachrichtigungsmodul im Agenten-Interface das die S/MIME-Prüfung durchführt.',
        'Module to define the email security options to use (PGP or S/MIME).' =>
            'Modul um die genutzte E-Mail-Sicherheitsoption festzulegen (PGP oder S/MIME).',
        'Module to compose signed messages (PGP or S/MIME).' => 'Modul um signierte Nachrichten zu verfassen (PGP oder S/MIME).',
        'Module to encrypt composed messages (PGP or S/MIME).' => 'Modul um verschlüsselte Nachrichten zu verfassen (PGP oder S/MIME).',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Zeigt einen Link zum Herunterladen von Anhängen an Artikeln in der TicketZoom-Ansicht des Agentenbereichs an.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Zeigt einen Link zum Betrachten von Anhängen über eine Onlineansicht im Artikel-Zoom im Agentenbereich an.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum zurück Gehen im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Sperren/Entsperren eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Betrachten der Historie eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Drucken eines Tickets oder Artikels im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Anzeigen der Priorität eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Bearbeiten der Freitextfelder eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Verlinken eines Tickets mit einem anderen Objekt im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to change the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Ändern des Besitzers eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to change the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Ändern des verantwortlichen Agenten eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to change the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Ändern des Kunden, der das Ticket eröffnet hat im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Hinzufügen einer Notiz zu einem Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a phone call outbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Hinzufügen eines ausgehenden Telefonanrufs zu einem Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to add a phone call inbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Hinzufügen eines eingehenden Telefonanrufs zu einem Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Senden einer ausgehenden E-Mail im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Zusammenführen von Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Setzen einer Wartezeit für ein Ticket im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum beobachten/nicht mehr beobachten eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Schließen eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt einen Link zum Löschen eines Tickets im Ticket-Zoom des Agentenbereichs an. Zusätzliche Zugriffskontrolle auf diesen Link kann durch Angabe von "Group" als Schlüssel und Inhalten wie "rw:group1;move_into:group2" als Wert konfiguriert werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Zeigt in der TicketZoom-Ansicht im Agentenbereich einen Link an, um ein Ticket als Junk zu kennzeichnen. Zusätzliche Zugriffskontrolle auf den Link kann durch befüllen des Schlüssels "Group" und befüllen des Contents (z. B. mit "rw:group1;move_into:group2") erreicht werden. Um Elemente des Ticketmenüs zu gruppieren, kann "ClusterName" als Schlüssel und ein beliebiger Name als Wert verwendet werden, unter dem diese Gruppe im Benutzer interface angezeigt werden soll. Verwenden Sie "ClusterPriority", um die Anzeigereihenfolge der verschiedenen Gruppen innerhalb des Ticketmenüs zu steuern.',
        'Shows link to external page in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Zeigt einen Link zu einer externen Seite in der Ticket-Detailansicht des Kundenbereichs. Die Sichtbarkeit des Links für bestimmte Gruppen kann über den Schlüssel "Group" und Inhalt wie "rw:group1;move_into:group2" gesteuert werden.',
        'This setting shows the sorting attributes in all overview screen, not only in queue view.' =>
            'Diese Einstellung zeigt die Sortier-Attribute aller Übersichtsansichten, nicht nur in der Queue-Ansicht.',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Definiert aus welchen Ticket-Attributen der Agent die Ergebnissortierung wählen kann.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Zeigt einen Link zum Sperren/Entsperren eines Tickets im Ticket-Zoom des Agentenbereichs an.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Zeigt einen Link zum Betrachten (Zoomen) von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Anzeigen der Historie von Tickets in den Ticketübersichten im Agentenbereich an.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Verändern der Priorität von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Hinzufügen von Notizen zu Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Schließen von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Zeigt einen Link zum Verschieben von Tickets in den Ticketübersichten des Agentenbereichs an.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Zeigt einen Link zum Löschen von Tickets in den Ticketübersichten des Agentenbereichs an. Zusätzliche Zugriffskontrolle für diesen Link kann über den Schlüssel "Group" und dazugehörigen Inhalt wie "rw:group1;move_into:group2" als Wert erreicht werden.',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Zeigt in allen Ticket-Übersichten im Agentenbereich einen Link an, um Tickets als Junk zu kennzeichnen. Zusätzliche Zugriffskontrolle auf den Link kann durch befüllen des Schlüssels "Group" und befüllen des Contents (z. B. mit "rw:group1;move_into:group2") erreicht werden.',
        'Module to grant access to the owner of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch den Agenten, der Besitzer des Tickets ist.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das OwnerCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Modul zum Gestatten des Zugriffs auf ein Ticket durch den verantwortlichen Agenten.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das ResponsibleCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Module to check the group permissions for the access to tickets.' =>
            'Modul zur Prüfung von Gruppen-Berechtigungen für den Zugriff auf Tickets.',
        'Module to grant access to the watcher agents of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch Agenten, die das Ticket beobachten.',
        'Module to grant access to the creator of a ticket.' => 'Modul zum Gestatten des Zugriffs auf ein Ticket durch den Agenten, der das Ticket ursprünglich erstellt hat.',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das CreatorCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Modul zum Gestatten des Zugriffs für jeden Agenten, der einmal in ein Ticket involviert war (basierend auf den Einträgen in der Ticket-Historie).',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Optionale Einschränkung auf Queues für das InvolvedCheck Permission-Modul. Wenn gesetzt, wird die Erlaubnis nur für Tickets in den hier angegebenen Queues erteilt.',
        'Module to check the group permissions for customer access to tickets.' =>
            'Modul zur Prüfung von Gruppen-Berechtigungen für den Zugriff von Kunden auf Tickets.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Modul zum Gestatten des Zugriffs, wenn die CustomerUserID eines Tickets der CustomerUserID des Kunden entspricht.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'Modul zum Gestatten des Zugriffs, wenn die CustomerID eines Tickets der CustomerID des Kunden entspricht.',
        'Module to grant access if the CustomerID of the customer has necessary group permissions.' =>
            'Modul zum Gestatten des Zugriffs, wenn die Kundennummer eines Kunden die notwendigen Gruppenrechte hat.',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Definiert, wie das "Von:"-Feld in den E-Mails (gesendet von Antworten und E-Mail-Tickets) aussehen soll.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Definiert das Trennzeichen zwischen dem wirklichen Namen des Agenten und der angegebenen E-Mail-Adresse der Queue.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the ticket stats of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'MyLastChangedTickets dashboard widget.' => 'Dashboard-Widget "Meine zuletzt geänderten Tickets"',
        'Parameters for the dashboard backend of the upcoming events widget of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Parameters for the dashboard backend of the queue overview widget of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "QueuePermissionGroup" is not mandatory, queues are only listed if they belong to this permission group if you enable it. "States" is a list of states, the key is the sort order of the state in the widget. "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "QueuePermissionGroup" legt fest (wenn aktiviert), dass nur Queues gelistet werden, die zur entsprechenden Rechtegruppe gehören. "States" ist eine Liste von Status, der Schlüssel ist die Sortierreihenfolge des Status im Widget. "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten.',
        'Parameters for the dashboard backend of the ticket events calendar of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Mit "Mandatory" kann das Dashlet so konfiguriert werden, dass Nutzer es nicht ausblenden können.',
        'Defines the calendar width in percent. Default is 95%.' => 'Definiert die Kalenderbreite in Prozent. Standard ist 95%.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Bestimmt die Queues, deren Tickets für die Anzeige als Kalender-Ereignisse berücksichtigt werden sollen.',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definiert dynamische Feldnamen für die Startzeit. Dieses Feld muss manuell im System als Ticket: "Datum / Uhrzeit" hinzugefügt werden und muss in Ticketerstellungsoberflächen und / oder in anderen Ticket-Aktionsoberflächen aktiviert werden.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Definiert dynamische Feldnamen für die Endzeit. Dieses Feld muss manuell im System als Ticket: "Datum / Uhrzeit" hinzugefügt werden und muss in Ticketerstellungsoberflächen und / oder in anderen Ticket-Aktionsoberflächen aktiviert werden.',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Definiert die dynamischen Felder, die benutzt werden um Kalender-Events anzuzeigen.',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'Legt die Ticket-Attribute fest, die in Kalender-Ereignissen angezeigt werden sollen. "Key" bestimmt das Feld oder Ticket-Attribut, "Content" legt den anzuzeigenden Namen fest.',
        'Defines if the values for filters should be retrieved from all available tickets. If enabled, only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            'Definiert, ob die Werte für Filter von allen verfügbaren Tickets abgerufen werden sollen. Wenn aktiviert, stehen für die Filterung nur Werte zur Verfügung, die aktuell in irgendeinem Ticket verwendet werden. Bitte beachten Sie: Die Liste der Kunden wird immer auf diesem Wege abgerufen.',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Kundenlisten-Widgets im Agentenbereich. "Limit" bestimmt die Anzahl der standardmäßig angezeigten Einträge. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Hinweis: Für DefaultColumns sind nur Ticketattribute und Dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) möglich.',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter für das Dashboard-Backend des Kundennummer-Status-Widgets im Agentenbereich. Über "Group" kann der Zugriff auf das Plugin beschränkt werden (z. B. Group: admin;group1;group2;). "Default" gibt an, ob das Plugin standardmäßig aktiviert sein soll oder ob der Nutzer es manuell aktivieren muss. "CacheTTLLocal" bestimmt die Laufzeit des Plugin-Caches in Minuten.',
        'Parameters for the dashboard backend of the customer id list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Legt die Parameter für das Dashboard-Backend fest. "Limit" legt die Anzahl an Einträgen fest, die standardmäßig angezeigt werden. "Group" beschränkt den Zugang zum jeweiligen Dashlet (z. B. Group: admin;group1;group2). "Default" bestimmt, ob das Dashlet standardmäßig aktiv ist oder vom Nutzer manuell aktiviert werden muss. "CacheTTLLocal" bestimmt die Cachingdauer für das Dashlet in Minuten.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Parameter für das Dashboard-Backend für die Ticketübersicht ausstehender Erinnerung im Agenten-Interface. "Limit" ist die Anzahl der standardmäßig angezeigten Einträge. "Gruppe" wird verwendet, um den Zugriff auf das Plugin einzuschränken (z. B. Gruppe: admin;group1;group2;). "Standard" bestimmt, ob das Plugin standardmäßig aktiviert ist oder ob der Benutzer es manuell aktivieren muss. "CacheTTLLocal" ist die Cache-Zeit in Minuten für das Plugin. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) erlaubt.',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Parameter für das Dashboard-Backend der Ticket-Eskalationsübersicht des Agenten-Interface. "Limit" ist die Anzahl der standardmäßig angezeigten Einträge. "Gruppe" wird verwendet, um den Zugriff auf das Plugin einzuschränken (z. B. Gruppe: admin;group1;group2;). "Standard" bestimmt, ob das Plugin standardmäßig aktiviert ist oder ob der Benutzer es manuell aktivieren muss. "CacheTTLLocal" ist die Cache-Zeit in Minuten für das Plugin. Hinweis: Für DefaultColumns sind nur Ticketattribute und dynamische Felder (DynamicField_NameX) erlaubt.',
        'Parameters for the CustomQueue object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter des CustomQueue-Objekts in den Benutzereinstellungen der Agenten-Oberfläche. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the CustomService object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter des CustomService-Objekts in der Einstellungsansicht der Agenten-Oberfläche. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the RefreshTime object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter des RefreshTime-Objekts in der Einstellungsansicht der Agenten-Oberfläche. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the pages (in which the tickets are shown) of the small ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter der Seiten (in der die Tickets angezeigt werden) der Small-Ticket-Übersicht. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the column filters of the small ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter der Spalten-Filter des Small-Ticket-Übersicht. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the pages (in which the tickets are shown) of the medium ticket overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter der Seiten (in der die Tickets angezeigt werden) der Medium-Ticket-Übersicht. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the pages (in which the tickets are shown) of the ticket preview overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter der Seiten (in der die Tickets angezeigt werden) der Ticket-Vorschau-Übersicht. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Parameters for the CreateNextMask object in the preference view of the agent interface. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter des CreateNextMask-Objekts in den Benutzereinstellungen der Agenten-Oberfläche. Bitte beachte: Wenn \'Active\' auf 0 eingestellt ist, so verhindert dies nur, dass Agenten die Einstellung dieser Gruppe in ihren persönlichen Einstellungen verändern können. Der Administrator kann weiterhin diese Einstellungen im Name von Benutzern verändern. Benutze \'PreferenceGroup\', um zu steuern, in welchem Bereich diese Einstellungen in der Benutzer-Oberfläche angezeigt werden.',
        'Parameters of the example queue attribute Comment2.' => 'Parameter für das Beispiel-Queue-Attribut Comment2.',
        'Parameters of the example service attribute Comment2.' => 'Parameter für das Beispiel-Service-Attribut Comment2.',
        'Parameters of the example SLA attribute Comment2.' => 'Parameter für das Beispiel-SLA-Attribut Comment2.',
        'Sends customer notifications just to the mapped customer.' => 'Versendet Kundenbenachrichtigungen nur für den gemappten Kunden.',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Legt fest, ob Agenten Benachrichtigungen erhalten sollen, wenn sie eine Aktion selbst ausgelöst haben.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Definiert den nächsten Bildschirm nach einem Kundenticket im Kunden-Interface.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Erlaubt Kunden das Setzen der Ticketpriorität im Kunden-Interface zu ändern.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Definiert die Standard-Prioriät von neuen Kundentickets in der Kundenoberfläche.',
        'Allows customers to set the ticket queue in the customer interface. If this is not enabled, QueueDefault should be configured.' =>
            'Ermöglicht es Kunden, die Ticket-Queue in der Kunden-Oberfläche zu setzen. Wenn dies nicht aktiviert ist, so sollte die QueueDefault konfiguriert sein.',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Definiert die Standard-Queue von neuen Kundentickets in der Kundenoberfläche.',
        'Allows customers to set the ticket type in the customer interface. If this is not enabled, TicketTypeDefault should be configured.' =>
            'Allows customers to set the ticket type in the customer interface. Wenn dies nicht aktiviert ist, so sollte TicketTypeDefault konfiguriert sein.',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Definiert den Standard-Ticket-Typ für neue Kundentickets in der Kundenoberfläche.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Ermöglicht es Kunden den Ticket-Service im Kunden-Interface einzustellen.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Erlaubt Kunden das setzen von SLAst im Kunden-Interface zu ändern.',
        'Sets if service must be selected by the customer.' => 'Gibt an, ob ein Service durch einen Kundenbenutzer ausgewählt sein muss.',
        'Sets if SLA must be selected by the customer.' => 'Gibt an, ob ein SLA durch einen Kundenbenutzer ausgewählt sein muss.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Definiert den Standard-Status von neuen Kundentickets in der Kundenoberfläche.',
        'Sender type for new tickets from the customer inteface.' => 'Absender Typ für neue Tickets aus der Kunden-Oberfläche.',
        'Defines the default history type in the customer interface.' => 'Definiert den Standard-Historientyp im Kunden-Interface.',
        'Comment for new history entries in the customer interface.' => 'Kommentar für neue Historieneinträge im Kunden-Interface.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            'Legt die Art des Empfängers für Tickets im Kunden-Bereich fest ("Queue" zeigt alle Queues, "System address" nur die Queues, die System-Adressen zugewiesen sind).',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "&lt;Queue&gt;" shows the names of the queues, and for SystemAddress, "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Definiert, welche Queues für Ticket-Empfänger im Kunden-Interface gültig sind.',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Modul für die "An"-Auswahl im Ticket Erstellen-Bildschirm im Kundenbereich.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'Legt den Bildschirm fest, der nach einem Follow-Up aus der Ticket-Detailansicht im Kundenbereich aufgerufen werden soll.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Bestimmt den Standard-Absendertp für Telefon-Tickets in der TicketZoom-Anzeige in der Agenten-Oberfläche.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Definiert den Verlaufstyp für die Ticket-Zoom-Aktion, der für den Ticket-Verlauf in der Kundenschnittstelle verwendet wird.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Definiert den Historien-Kommentar für die Aktion "Warten auf Erinnerung" welcher in der Ticket-Historie in der Agenten-Oberfläche angezeigt wird.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Erlaubt Kunden die Ticketpriorität im Kunden-Interface zu ändern.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Steuert die Folgepriorität für Tickets, für die im Kundenbereich eine Kundennachfrage eingegangen ist.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Ermöglicht die Wahl des nächsten Verfassen-Status für Kundenticket im Kunden-Interface.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Steuert den Folgestatus für Tickets, für die im Kundenbereich eine Kundennachfrage eingegangen ist.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Definiert die nächsten möglichen Status für Tickets von Kunden in der Kunden-Oberfläche.',
        'Shows the enabled ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            'Zeigt die aktivierten Ticket-Attribute im Kundenbereich (0 = abgeschaltet, 1 = eingeschaltet).',
        'Defines the length of the article preview in the customer interface.' =>
            '',
        'Defines the displayed style of the From field in notes that are visible for customers. A default agent name can be defined in Ticket::Frontend::CustomerTicketZoom###DefaultAgentName setting.' =>
            'Definiert den angezeigten Stil des Feldes "Von" in Notizen, die für Kunden sichtbar sind. Ein Standard-Agentenname kann in der Einstellung Ticket::Frontend::CustomerTicketZoom####DefaultAgentName definiert werden.',
        'Defines the default agent name in the ticket zoom view of the customer interface.' =>
            'Definiert den Standard-Agentennamen in der Ticket-Detailansicht des Kunden-Interface.',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Maximale Anzahl von Tickets, die im Suchergebnis des Kunden-Interfaces angezeigt werden sollen.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Anzahl der anzuzeigenen Tickets pro Seite in einem Suchergebnis in der Kundenoberfläche.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in einer Ticket-Suche im Kunden-Interface.',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Suchergebnis-Ansicht des Kundenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            'Ermöglicht erweiterte Suchbedingungen in der Ticketsuche der Kundenschnittstelle. Mit dieser Funktion können Sie z. B. den Titel eines Tickets mit Bedingungen wie "(*key1*&amp;&amp;*key2*)" oder "(*key1*||*key2*)" suchen.',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Wenn aktiviert, können Kunden nach Tickets mit allen Services suchen (unabhängig davon, welche Services dem jeweiligen Kunden zugewiesen sind).',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Definiert alle Parameter für das Objekt ShownTickets in den Kundeneinstellungen des Kunden-Interface.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Definiert alle Parameter für das Objekt RefreshTime in den Kundeneinstellungen des Kunden-Interface.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Definiert das standardmäßig genutzte Frontend-Modul im Agenten-Interface, wenn kein Action-Paramenter in der URL übergeben wurde.',
        'Default queue ID used by the system in the agent interface.' => 'Standard-Queue-ID welche von Znuny in der Agentenoberfläche verwendet wird.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Standard-Ticket-ID welche von Znuny in der Agentenoberfläche verwendet wird.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Definiert das standardmäßig genutzte Frontend-Modul im Kunden-Interface, wenn kein Action-Paramenter in der URL übergeben wurde.',
        'Default ticket ID used by the system in the customer interface.' =>
            'Standard-Ticket-ID welche von Znuny in der Kundenoberfläche verwendet wird.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Modul zum Generieren eines HTML-OpenSearch-Profils für die Ticket-Schnellsuche im Kundenbereich.',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Bestimmt das nächste Fenster nach dem das Ticket verschoben ist. LastScreenOverview wechselt zur letzten Übersichtsseite. TicketZoom wechselt zur Ticket-Detailansicht.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Bestimmt den Standard-Betreff für Notizen, die im Ticket verschieben-Bildschirm im Agentenbereich hinzugefügt werden.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Definiert den Standard Body-Text für Notizen in der "Ticket Verschieben" Ansicht in der Agenten-Oberfläche.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            'Ermöglicht erweiterte Suchbedingungen in der Ticketsuche der generischen Agentenschnittstelle. Mit dieser Funktion können Sie z. B. den Titel eines Tickets mit Bedingungen wie "(*key1*&amp;&amp;*key2*)" oder "(*key1*||*key2*)" suchen.',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Legt die maximale Anzahl an Tickets fest, die pro GenericAgent-Job-Ausführung bearbeitet werden.',
        'Allows generic agent to execute custom modules.' => 'Ermöglicht es dem GenericAgent, benutzerdefinierte Module auszuführen.',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Geben Sie tickets frei, wenn eine Notiz hinzugefügt wurde und der Besitzer nicht im Büro ist.',
        'Include unknown customers in ticket filter.' => 'Unbekannte Kunden in Ticketfiltern mit einschließen.',
        'List of all ticket events to be displayed in the GUI.' => 'Liste aller Ticket-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all article events to be displayed in the GUI.' => 'Liste aller Artikel-Ereignisse, welche in der grafischen Benutzeroberfläche angezeigt werden sollen.',
        'List of all queue events to be displayed in the GUI.' => 'Liste alle Queue-Ereignisse, die in der Benutzeroberfläche angezeigt werden.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Ereignismodul, das ein Update-Statement auf TicketIndex ausführt, um die Queue umzubenennen (wenn nötig und wenn StaticDB genutzt wird).',
        'Ignores not ticket related attributes.' => 'Ignoriert nicht ticketbezogene Attribute.',
        'Transport selection for ticket notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Transportselektion der Terminbenachrichtigungen. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'ACL Modul das erlaubt Eltern-Tickets nur dann zu schließen, wenn alle seine Kinder-Tickets geschlossen wurden. ("Status" zeigt welche Status für das Eltern-Ticket nicht verfügbar sind, bis alle Kinder-Tickets geschlossen sind).',
        'Default ACL values for ticket actions.' => 'Standard ACL-Werte für Ticketaktionen.',
        'Defines which items are available in first level of the ACL structure.' =>
            'Definiert welche Begriffe in der ersten Ebene einer ACL-Struktur verfügbar sind.',
        'Defines which items are available in second level of the ACL structure.' =>
            'Definiert welche Begriffe in der zweiten Ebene einer ACL-Struktur verfügbar sind.',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Definiert welche Begriffe für eine \'Aktion\' in der dritten Ebene einer ACL-Struktur verfügbar sind.',
        'Cache time in seconds for the DB ACL backend.' => 'Cache-Zeit in Sekunden für Datenbank ACL-Backends.',
        'If enabled debugging information for ACLs is logged.' => 'Wenn aktiviert, werden Informationen zur Fehlerbehebung für ACLs geloggt.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Maximale Anzahl von automatischen E-Mailantworten zur eigenen E-Mail-Adresse pro Tag (Loop-Protection).',
        'Maximal auto email responses to own email-address a day, configurable by email address (Loop-Protection).' =>
            'Maximale Anzahl von automatischen E-Mail-Antworten zur eigenen E-Mailadresse pro Tag (Loop-Protection).',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Maximale Größe in KBytes für E-Mails die via POP3/POP3S/IMAP/IMAPS empfangen werden (in KBytes).',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Die maximale Anzahl an Mails, die auf einmal abgerufen werden, bevor eine neue Verbindung zum Server aufgebaut wird.',
        'Default loop protection module.' => 'Standard "Loop Protection"-Modul.',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Pfad zur Log-Datei (wird nur angewandt und ist dann verpflichtend, wenn "FS" als LoopProtectionModule ausgewählt wurde).',
        'Converts HTML mails into text messages.' => 'Konvertiert HTML E-Mails in Textnachrichten.',
        'Specifies user id of the postmaster data base.' => 'Definiert die Benutzer-Id der Postmaster Datenbank.',
        'Defines the postmaster default queue.' => 'Definiert die Postmaster-Queue.',
        'Defines the default priority of new tickets.' => 'Definiert die Standard-Priorität von neuen Tickets.',
        'Defines the default state of new tickets.' => 'Definiert den Standard-Status von neuen Tickets.',
        'Defines the state of a ticket if it gets a follow-up.' => 'Definiert den Status eines Tickets, wenn ein Follow-Up eingeht.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Definiert den Status eines geschlossenen Tickets, wenn ein Follow-Up eingeht.',
        'Defines the PostMaster header to be used on the filter for keeping the current state of the ticket.' =>
            'Bestimmt den Postmaster-Header im Filter, um den aktuellen Ticketstatus beizubehalten.',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Sendet Rückfrage Benachrichtigungen für Agenten nur an den Ticket Besitzer wenn das Ticket entsperrt ist (standardmäßig werden die Benachrichtigungen an alle Agenten gesendet).',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Legt die Anzahl von Header-Feldern in Frontend-Modulen für das Hinzufügen/Aktualisieren von Postmaster-Filtern fest. Bis zu 99 Felder möglich.',
        'Indicates if a bounce e-mail should always be treated as normal follow-up.' =>
            'Legt fest, ob eine Bounce-E-Mail immer wie ein normales Follow-Up behandelt werden soll.',
        'Defines all the X-headers that should be scanned.' => 'Definiert alle X-Headers, die überprüft werden sollen.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Modul zum filtern und bearbeiten von eingehenden Nachrichten. Blockiere/Ignoriere alle Nachrichten mit einer noreply@ Absender-Adresse.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From =&gt; \'(.+?)@.+?\', and use () as [***] in Set =&gt;.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blockiert alle eingehenden E-Mails, die keine gültige Ticketnummer im Betreff mit Absenderadresse: @ example.com besitzen.',
        'Defines the sender for rejected emails.' => 'Definiert die Absendeadresse für abgelehnte E-Mails.',
        'Defines the subject for rejected emails.' => 'Bestimmt den Betreff von abgelehnten E-Mails.',
        'Defines the body text for rejected emails.' => 'Definiert den Body-Text für abgelehnte E-Mails.',
        'Module to use database filter storage.' => 'Modul zur Nutzung des Datenbank Filter Storage.',
        'Module to check if arrived emails should be marked as internal (because of original forwarded internal email). IsVisibleForCustomer and SenderType define the values for the arrived email/article.' =>
            'Modul zur Prüfung, ob eingegangene E-Mails aufgrund einer vorher weitergeleiteten internen E-Mail als internal gekennzeichnet werden sollen. Über IsVisibleForCustomer und SenderType werden die Werte für die eingegangene E-Mail/den eingegangenen Artikel festgelegt.',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number. Note: the first capturing group from the \'NumberRegExp\' expression will be used as the ticket number value.' =>
            'Erkennen Sie, ob ein Ticket eine Folgemaßnahme zu einem bestehenden Ticket ist, indem Sie eine externe Ticket-Nummer verwenden. Hinweis: Die erste erfasste Gruppe aus dem Ausdruck \'NumberRegExp\' wird als Wert für die Ticket-Nummer verwendet.',
        'Module to filter encrypted bodies of incoming messages.' => 'Modul zum Filtern von verschlüsselten Texten bei eingehenden Nachrichten.',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            'Modul zum Ermitteln von SMIME-Zertifikaten des Kundenbenutzers bei eingehenden Nachrichten.',
        'Module to check if a incoming e-mail message is bounce.' => 'Prüfmodul zum Erkennen, ob es sich bei einer eingehenden E-Mail um eine abgelehnte E-Mail handelt.',
        'Module used to detect if attachments are present.' => 'Modul um das Vorhandensein von Anhängen zu prüfen.',
        'Executes follow-up checks on Znuny Header \'X-OTRS-Bounce\'.' =>
            'Führt Follow-Up-Checks auf dem Znuny-Header \'X-OTRS-Bounce\' aus.',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Prüft, ob eine E-Mail ein Follow-Up zu einem bestehenden Ticket ist, indem der Betreff nach einer gültigen Ticketnummer durchsucht wird.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'Führt Follow-Up-Checks auf In-Reply-To- oder References-Headern von E-Mails aus, deren Betreff keine Ticketnummer enthält.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'Führt Follow-Up-Checks auf Texten von E-Mails aus, deren Betreff keine Ticketnummer enthält.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'Führt Follow-Up-Checks auf Anhänge von E-Mails aus, deren Betreff keine Ticketnummer enthält.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'Führt Follow-Up-Checks auf Quelltexten von E-Mails aus, deren Betreff keine Ticketnummer enthält.',
        'Checks if an email is a follow-up to an existing ticket with external ticket number which can be found by ExternalTicketNumberRecognition filter module.' =>
            'Prüft, ob eine E-Mail ein Follow-Up zu einem bestehenden Ticket ist, indem der Betreff nach einer gültigen Ticketnummer durchsucht wird.',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            'Legt fest, ob die Absenderadresse bei unbekannten Kunden automatisch als Kundennummer gesetzt wird.',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Wenn dieser reguläre Ausdruck zutrifft, wird durch den Autoresponder keine Nachricht versendet.',
        'If this option is enabled, tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is not enabled, no autoresponses will be sent.' =>
            'Wenn diese Option aktiviert ist, werden für Tickets, welche über das externe Interface oder das Agenten-Interface erstellt wurden, eine Automatische Antwort versendet, sofern dies in der Konfiguration der Queue so eingestellt ist. Wenn diese Option nicht aktiviert ist, werden keine Automatischen Antworten versendet.',
        'Links 2 tickets with a "Normal" type link.' => 'Verknüpft 2 Tickets mit dem Linktyp "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Verknüpft 2 Tickets mit dem Linktyp "Eltern-Kind".',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Definiert, dass Tickets mit den ausgewählten Tickets Status nicht bei den verknüpften Tickets angezeigt werden sollen.',
        'For these state types the ticket numbers are striked through in the link table.' =>
            'Tickets mit den hier angegebenen Typen werden in der Tabelle verknüpfter Objekte durchgestrichen dargestellt.',
        'Module to generate ticket statistics.' => 'Modul zur Generierung von Ticket-Statistiken.',
        'Determines if the statistics module may generate ticket lists.' =>
            'Definiert, ob das Statistik-Modul Ticket-Listen generieren kann.',
        'Module to generate accounted time ticket statistics.' => 'Modul zur Generierung von Statistiken für die benötigte Bearbeitungszeit.',
        'Module to generate ticket solution and response time statistics.' =>
            'Modul zur Generierung von Lösungs- und Antwortzeitstatistiken.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Definiert Standardhöhe (in Pixel) für Inline_HTML-Feldern in AgentTicketZoom.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Definiert maximale Höhe (in Pixel) für Inline_HTML-Feldern in AgentTicketZoom.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'Maximale Anzahl aufgeklappter Artikel in der Ticket-Detailansicht.',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Die maximale Anzahl von Artikeln, welche auf einer Seite im AgentTicketZoom angezeigt werden.',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Steuert, ob der Artikel als Richtext angezeigt werden soll, auch wenn das Schreiben von Richtext abgeschaltet ist.',
        'Parameters for the pages (in which the dynamic fields are shown) of the dynamic fields overview. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Parameter der Seiten (in der die dynamischen Felder angezeigt werden) der dynamischen-Felder-Übersicht. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.',
        'Dynamic fields shown in the ticket close screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Ticket schließen-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket compose screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Ticket verfassen-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket email screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im E-Mail Ticket-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket free text screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Freitextfelder-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket forward screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Ticket weiterleiten-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the email outbound screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im ausgehende E-Mail-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket move screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Ticket verschieben-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket note screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Notiz erstellen-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket owner screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Besitzer wechseln-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket pending screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Wartezeit setzen-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket phone screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Telefon-Ticket-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket phone inbound screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im eingehender Anruf-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket phone outbound screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im ausgehender Anruf-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket priority screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Priorität setzen-Bildschirm des Agentenbereichs.',
        'Dynamic fields shown in the ticket responsible screen of the agent interface.' =>
            'Dynamische Felder zur Eingabe im Verantwortlicher setzen-Bildschirm des Agentenbereichs.',
        'Dynamic fields options shown in the ticket message screen of the customer interface. NOTE. If you want to display these fields also in the ticket zoom of the customer interface, you have to enable them in CustomerTicketZoom###DynamicField.' =>
            'Dynamische Felder zur Eingabe im Ticket erstellen-Bildschirm des Kundenbereichs. Hinweis: Wenn Sie diese Felder ebenfalls in der Ticket-Detailansicht anzeigen möchten, können Sie sie bitte in der Einstellung CustomerTicketZoom###DynamicField einschalten.',
        'Dynamic fields shown in the ticket small format overview screen of the agent interface.' =>
            'Angezeigte dynamische Felder in der Kleinansicht von Ticket-Listen im Agentenbereich.',
        'Dynamic fields shown in the ticket medium format overview screen of the agent interface.' =>
            'Angezeigte Dynamische Felder in der Medium-Ansicht von Ticket-Listen im Agentenbereich.',
        'Dynamic fields shown in the ticket preview format overview screen of the agent interface.' =>
            'Angezeigte Dynamische Felder in der Großansicht von Ticket-Listen im Agentenbereich.',
        'Dynamic fields shown in the sidebar of the ticket zoom screen of the agent interface.' =>
            'Angezeigte Dynamische Felder in der Seitenleiste in der Ticket-Detailansicht des Agentenbereichs.',
        'AgentTicketZoom widget that displays ticket data in the side bar.' =>
            'Widget für AgentTicketZoom, das weitere Daten des aktuellen Tickets anzeigt.',
        'AgentTicketZoom widget that displays customer information for the ticket in the side bar.' =>
            'Widget für AgentTicketZoom, das Kundeninformationen des Kunden anzeigt, dem das aktuelle Ticket zugewiesen ist.',
        'AgentTicketZoom widget that displays a table of objects linked to the ticket.' =>
            'Widget für AgentTicketZoom, das eine Tabelle von Objekten anzeigt, die mit dem aktuellen Ticket verknüpft sind.',
        'Dynamic fields shown in the ticket zoom screen of the customer interface.' =>
            'Angezeigte dynamische Felder in der Ticket-Detailansicht im Kundenbereich.',
        'Dynamic fields options shown in the ticket reply section in the ticket zoom screen of the customer interface.' =>
            'Dynamische Felder zur Eingabe bei der Ticket-Beantwortung im Kundenbereich.',
        'Dynamic fields shown in the ticket print screen of the agent interface.' =>
            'Angezeigte Dynamische Felder in der Ticket drucken-Ansicht im Agentenbereich.',
        'Dynamic fields shown in the ticket print screen of the customer interface.' =>
            'Angezeigte dynamische Felder in der Ticket drucken-Ansicht im Kundenbereich.',
        'Dynamic fields shown in the ticket search screen of the agent interface.' =>
            'Angezeigte dynamische Felder im Suchergebnis von Ticket-Suchen im Agentenbereich.',
        'Defines the default shown ticket search attribute for ticket search screen. Example: "Key" must have the name of the Dynamic Field in this case \'X\', "Content" must have the value of the Dynamic Field depending on the Dynamic Field type,  Text: \'a text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.' =>
            'Definiert die Standard Suchattribute für die Ticketsuche Beispiel: "Key" muss den Namen des dynamischen Feldes haben, in diesem Fall \'X\', "Content" muss den Wert des dynamischen Feldes, abhängig vom Feldtyp, haben, Text: \'ein Text\', Dropdown: \'1\', Date/Time: \'Search_DynamicField_XTimeSlotStartYear=1974; Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Dynamic Fields welche beim Export des Suchergebnisses im CSV-Format auszugeben sind.',
        'Dynamic fields shown in the ticket search screen of the customer interface.' =>
            'Angezeigte dynamische Felder im Suchergebnis von Ticket-Suchen im Kundenbereich.',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface.' =>
            'Angezeigte dynamische Felder in der Anzeige von Suchergebnissen der Ticketsuche im Kundenbereich.',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (https://doc.znuny.org/manual/developer/), chapter "Ticket Event Module".' =>
            'Konfiguriert eine Standardeinstellung für TicketDynamicField. "Name" definiert das Dynamische Feld, das verwendet werden soll, "Wert" sind die Daten, die gesetzt werden sollen, und "Ereignis" definiert das Auslöseereignis. Bitte beachten Sie das Entwicklerhandbuch (https://doc.znuny.org/manual/developer/), Kapitel "Ticket Event Module".',
        'Defines the list of types for templates.' => 'Definiert die Typenliste für Templates.',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Liste der Standardvorlagen, welche neuen Queues nach Erstellung automatisch zugeordnet werden.',
        'General ticket data shown in the ticket overviews (fall-back). Note that TicketNumber can not be disabled, because it is necessary.' =>
            'Anzeige von allgemeinen Ticket-Daten in Ticket-Übersichten (Fallback). Beachten Sie, dass die Ticket-Nummer nicht abgeschaltet werden kann.',
        'Columns that can be filtered in the status view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the queue view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the responsible view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the watch view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the locked view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the escalation view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the ticket search result view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Columns that can be filtered in the service view of the agent interface. Note: Only Ticket attributes, Dynamic Fields (DynamicField_NameX) and Customer attributes (e.g. CustomerUserPhone, CustomerCompanyName, ...) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Frontend module registration (disable AgentTicketService link if Ticket Service feature is not used).' =>
            'Frontend-Modulregistrierung (AgentTicketService-Link entfernen wenn das Service-Feature nicht aktiv ist).',
        'Default display type for recipient (To,Cc) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Standard Anzeigetyp für Empfängernamen(To, Cc) in AgentTicketZoom und CustomerTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Standard-Anzeigetyp für Absender-Namen (Von) in AgentTicketZoom und CustomerTicketZoom.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            'Definieren Sie, welche Spalten im verlinkte Tickets-Widget sichtbar sein sollen (LinkObject::ViewMode = "complex"). Hinweis: Nur Ticket-Attribute und dynamische Felder (DynamicField_NameX) sind als Standard-Spalten erlaubt.',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'Legt fest, ob Meta-Informationen aus Artikeln anhand von Filtern, die in Ticket::Frontend::ZoomCollectMetaFilters festgelegt wurden, extrahiert werden sollen.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            'Definiert einen Filter zum Sammeln von CVE-Nummern von Artikel-Texten im AgentTicketZoom. Das Ergebnis wird in einer Meta-Box neben dem Artikel angezeigt. Füllen Sie URLPreview aus, wenn Sie beim halten des Cursors über dem Linkelement eine Vorschau sehen möchten. Das kann dieselbe URL wie in "URL", aber auch eine andere. Bitte beachten Sie, dass einige Webseiten es verbieten in einem iframe (z.B. Google) angezeigt zu werden. Diese würden mit dem Vorschau-Modus nicht funktionieren.',
        'Sets the default link type of split tickets in the agent interface.' =>
            'Bestimmt den voreingestellten Link-Typ für geteilte Tickets im Agentenbereich.',
        'Defines available article actions for Internal articles.' => 'Legt verfügbare Artikel-Aktionen für interne Artikel fest.',
        'Defines available article actions for Phone articles.' => 'Legt verfügbare Artikel-Aktionen für Telefon-Artikel fest.',
        'Defines available article actions for Email articles.' => 'Legt verfügbare Artikel-Aktionen für E-Mail-Artikel fest.',
        'Defines available article actions for invalid articles.' => 'Legt verfügbare Artikel-Aktionen für ungültige Artikel fest.',
        'Disables the redirection to the last screen overview / dashboard after a ticket is closed.' =>
            'Deaktiviert die Umleitung auf die letzte Übersicht / das Dashboard, nachdem ein Ticket geschlossen wurde.',
        'Defines the default queue for new tickets in the agent interface.' =>
            'Definiert die Standard-Queue für neue Tickets im Agentenbereich fest.',

        # XML Definition: Kernel/Config/Files/XML/Znuny.xml
        'Enables/disables the Znuny package verification. If disabled, all packages are shown as verified. It\'s still recommended to use only verified packages.' =>
            'Aktiviert/deaktiviert die Znuny-Paketverifizierung. Wenn deaktiviert werden alle Pakete als verifiziert angezeigt. Es wird trotzdem empfohlen, nur verifizierte Pakete zu verwenden.',
        'Screens for which it is possible to enable or disable dynamic fields.' =>
            'Dialoge, für die es möglich ist, dynamische Felder zu aktivieren oder zu deaktivieren.',
        'Screens for which it is possible to enable or disable default columns.' =>
            'Dialoge, für die es möglich ist, Standardspalten zu aktivieren oder zu deaktivieren.',
        'Mapping of Ticket::Generic invoker name (key) to list of fields (content) whose values will be base-64 encoded. Fields have to be given in the following form: Field1->Field2;Field3->Field4->Field5;Field6. So a nested data structure can be given by connecting the fields with \'->\'. Content of different fields can be given by separating those fields by \';\'.' =>
            'Mapping von Ticket::Generic-Invoker-Name (Schlüssel) zu einer Liste von Feldern (Inhalt), die base-64-kodiert werden sollen. Felder müssen in der folgenden Form angegeben werden: Feld1->Feld2;Feld3->Feld4->Feld5;Feld6. Eine verschachtelte Datenstruktur kann also durch Verbindung der Felder mit \'->\' angegeben werden. Inhalte aus verschiedenen Feldern je Invoker können kodiert werden, indem die Felder mit \';\' voneinander getrennt werden. Bitte beachten Sie die Dokumentation des Pakets für weitere Informationen.',
        'Mapping of Ticket::Generic invoker name (key) to list of fields (content) which will be removed from the request. Fields have to be given in the following form: Field1->Field2;Field3->Field4->Field5;Field6. So a nested data structure can be given by connecting the fields with \'->\'. Different fields can be omitted by separating them by \';\'.' =>
            'Mapping von Ticket::Generic-Invoker-Name (Schlüssel) zu einer Liste von Feldern (Inhalt), die aus dem Request entfernt werden. Felder müssen in der folgenden Form angegeben werden: Feld1->Feld2;Feld3->Feld4->Feld5;Feld6. Eine verschachtelte Datenstruktur kann also durch Verbindung der Felder mit \'->\' angegeben werden. Verschiedene Felder je Invoker können entfernt werden, indem sie mit \';\' voneinander getrennt werden. Bitte beachten Sie die Dokumentation des Pakets für weitere Informationen.',
        'Maximum number of parallel instances when using OTRS_AsynchronousInvokerExecution in invoker Ticket::Generic.' =>
            'Maximale Anzahl paralleler Instanzen bei Nutzung von OTRS_AsynchronousInvokerExecution im Invoker Ticket::Generic.',
        'Enables support for huge XML data in load_xml calls of CPAN library XML::LibXML. This should only be enabled if absolutely needed. Disabling this option (default) protects against denial of service through entity expansion attacks. Before enabling this option ensure that alternative measures to protect the application against this type of attack have been taken.' =>
            'Aktiviert die Unterstützung für große XML-Daten in load_xml-Aufrufen der CPAN-Bibliothek XML::LibXML. Diese Option sollte nur aktiviert werden, wenn sie unbedingt benötigt wird. Die Deaktivierung dieser Option (Standard) schützt vor Denial-of-Service-Angriffen durch Entity-Expansion. Bevor diese Option aktiviert wird, muss sichergestellt werden, dass alternative Maßnahmen ergriffen wurden, um die Anwendung gegen diese Art von Angriffen zu schützen.',
        'Shows a link in the menu to create a unit test for the current ticket.' =>
            'Zeigt einen Link im Menü zur Erzeugung eines Unit-Tests für das aktuelle Ticket.',
        'Shows a link in the menu to create and send a unit test for the current ticket.' =>
            'Zeigt einen Link im Menü zur Erzeugung und den Versand eines Unit-Tests für das aktuelle Ticket.',
        'Dynamic field backend registration.' => 'Registrierung eines Dynamic-Field-Backends.',
        'Frontend module for the agent interface that provides the AJAX interface for the web service dynamic field backends.' =>
            'Frontend-Modul für die Agentenschnittstelle, das die AJAX-Schnittstelle für die Webservice-Dynamic-Field-Backends bereitstellt.',
        'Frontend module for the customer interface that provides the AJAX interface for the web service dynamic field backends.' =>
            'Frontend-Modul für die Kundenschnittstelle, das die AJAX-Schnittstelle für die Webservice-Dynamic-Field-Backends bereitstellt.',
        'Ticket event module that stores values of the selected web service record into the configured additional dynamic fields.' =>
            'Ticket-Event-Modul zur Speicherung von Werten des gewählten Webservice-Datensatzes in den konfigurierten zusätzlichen dynamischen Feldern.',
        'It might happen that a dynamic field of type WebserviceDropdown or WebserviceMultiselect will be set to a value fetched from a configured web service table but the web service record will not have a value set in the field that is configured as displayed value. Enable this setting to hide those dynamic fields in the ticket information widget of AgentTicketZoom so that they will not be shown as empty.' =>
            'Es kann vorkommen, dass ein dynamisches Feld vom Typ WebserviceDropdown oder WebserviceMultiselect auf einen Wert gesetzt wird, der aus einer konfigurierten Webservice-Tabelle geholt wird, aber der Webservice-Datensatz keinen Wert in dem Feld hat, das als angezeigter Wert konfiguriert ist. Aktivieren Sie diese Einstellung, um diese dynamischen Felder im Ticketinformations-Widget von AgentTicketZoom auszublenden, damit sie nicht als leer angezeigt werden.',
        'Mapping for field values received from form. This setting is necessary for the correct identification of the form fields. Key means value type, value means possible representation in views.' =>
            'Mapping für die vom Formular empfangenen Feldwerte. Diese Einstellung ist für die korrekte Identifizierung der Formularfelder notwendig. Schlüssel ist Typ, Inhalt ist möglicher Name im Formular.',
        'Mapping for field values received from form which have multiple values. This setting is needed when the view shows the values of a particular field in a custom way (e.g. selectable customer user in ticket creation view). This setting is always respected first. There is also the possibility to specify an order for checking fields. (Field of customer user in ticket creation view can be saved as CustomerUser or just simple e-mail. First we need to check if CustomerKey is present (CustomerKey -> ID of CustomerUser). If not, then simply take plain text (CustomerTicketText -> E-mail)).' =>
            'Zuordnung für Feldwerte, die vom Formular empfangen werden und mehrere Werte haben. Diese Einstellung wird benötigt, wenn die Ansicht die Werte eines bestimmten Feldes in einer benutzerdefinierten Weise anzeigt (z. B. auswählbarer Kundenbenutzer in der Ansicht zur Ticketerstellung). Diese Einstellung wird immer zuerst beachtet. Es besteht auch die Möglichkeit, eine Reihenfolge für die Überprüfung der Felder festzulegen. (Das Feld des Kundenbenutzers in der Ticket-Erstellungsansicht kann als CustomerUser oder als einfache E-Mail gespeichert werden. Zuerst muss geprüft werden, ob CustomerKey vorhanden ist (CustomerKey -> ID von CustomerUser). Ist dies nicht der Fall, wird einfach der Text verwendet (CustomerTicketText -> E-Mail)).',
        'Options and default field set for attributes. Values of this setting will always be passed as simple form value without possibility to further configure it in AdminDynamicField view. The keys with which the form values will be sent to the invoker can be edited in the "Default" section of this setting.' =>
            'Optionen und Standardfeld für Attribute. Die Werte dieser Einstellung werden immer als einfache Formularwerte übergeben, ohne die Möglichkeit, sie in der Ansicht AdminDynamicField weiter zu konfigurieren. Die Schlüssel, mit denen die Formularwerte an den Invoker gesendet werden, können im Abschnitt "Default" dieser Einstellung bearbeitet werden.',
        'Options and default field set for selectable attributes. Values which will be passed to invoker (ID or Name or both) can be configured in AdminDynamicField view. The keys with which the form values (ID or Name) will be sent to the invoker can be edited in the "Default" section of this setting. Example usage for field Queue: Field with selected ID and Name will send QueueID = 3 and Queue = Raw.' =>
            'Optionen und Standardfeld für auswählbare Attribute. Die Werte, die an den Aufrufer übergeben werden (ID oder Name oder beides), können in der Ansicht AdminDynamicField konfiguriert werden. Die Schlüssel, mit denen die Formularwerte (ID oder Name) an den Invoker gesendet werden, können im Abschnitt "Default" dieser Einstellung bearbeitet werden. Beispiel für die Verwendung des Feldes Queue: Feld mit ausgewählter ID und Name sendet QueueID = 3 und Queue = Raw.',
        'Template for the out-of-office message shown to the user in the frontend. Placeholders for out-of-office information can be used via ###PlaceholderName###. Possible placeholders are: StartYear, StartMonth, StartDay, EndYear, EndMonth, EndDay, DaysRemaining.' =>
            'Template für die "Out-of-Office"-Nachricht, die im Agenten-Interface angezeigt wird. Platzhalter für Out-Of-Office-Daten können wie folgt benutzt werden: ###PlatzhalterName###. Mögliche Out-Of-Office-PLatzhalter sind: StartYear, StartMonth, StartDay, EndYear, EndMonth, EndDay, DaysRemaining.',
        'Message that will be shown if the agent is currently logged in.' =>
            'Meldung, die angezeigt werden soll, wenn der Agent gerade angemeldet ist.',
        'Message that will be shown if the agent is currently logged out.' =>
            'Meldung, die angezeigt werden soll, wenn der Agent gerade abgemeldet ist.',
        'Assignment between action and attributes.' => 'Zuordnung zwischen Aktion und Attributen.',
        'Possible types for agent interface.' => 'Mögliche Typen für das Agenten-Interface.',
        'Possible types for customer interface.' => 'Mögliche Typen für das Kunden-Interface.',
        'Assignment between type and icon.' => 'Zuordnung zwischen Typ und Icon.',
        'List of actions that will be ignored.' => 'Liste von Aktionen, die ignoriert werden.',
        'List of sub-actions that will be ignored.' => 'Liste von Sub-Aktionen, die ignoriert werden.',
        'Registers a user preferences module for LastViewsLimit.' => 'Registriert ein User-Preference-Modul für LastViewsLimit',
        'Registers a user preferences module for LastViewsPosition.' => 'Registriert ein User-Preference-Modul für LastViewsPosition.',
        'Registers a user preferences module for LastViewsType.' => 'Registriert ein User-Preference-Modul für LastViewsType.',
        'Pre-application module to store the current view.' => 'Pre-Application-Modul zum Speichern der aktuellen Ansicht.',
        'Domains accessed through WebUserAgent module for which no proxy should be used. Separate domains by semicolon.' =>
            'Domains, auf die durch das WebUserAgent-Modul zugegriffen wird und für die kein Proxy verwendet werden soll. Mehrere Domains können durch Semikolon getrennt hinterlegt werden.',
        'User agent string to use for the WebUserAgent module. Leave empty to use the default user agent string.' =>
            'User-Agent-String zur Verwendung im WebUserAgent-Modul. Leerlassen, um Standard-User-Agent-String zu verwenden.',
        'Agent recipient information which will be passed to the web service.' =>
            'Agenten-Empfänger-Information, die an den Webservice weitergegeben wird.',
        'Customer recipient information which will be passed to the web service.' =>
            'Kunden-Empfänger-Information, die an den Webservice weitergegeben wird.',
        'Parameter name for additional recipients.' => 'Parametername für zusätzliche Empfänger.',
        'Shows only valid dynamic fields in screen configuration (AdminDynamicFieldScreenConfiguration) if enabled.' =>
            'Zeigt nur gültige dynamische Felder in der Maskenkonfiguration (AdminDynamicFieldScreenConfiguration), falls aktiviert.',
        'Shows only valid dynamic fields in dynamic field export selection (AdminDynamicFieldConfigurationImportExport) if enabled.' =>
            'Zeigt nur gültige dynamische Felder in der Auswahl für den Export (AdminDynamicFieldConfigurationImportExport), falls aktiviert.',
        'Config keys and their action to activate dynamic fields in different screens, grouped by object type.' =>
            'Config-Keys und deren Action zur Aktivierung von dynamischen Feldern in verschiedenen Dialogen, gruppiert nach Objekttyp.',
        'Dynamic field screen config keys and their action for all screens that don\'t allow dynamic fields to be mandatory.' =>
            'Config-Keys zur Aktivierung von dynamischen Feldern inkl. zugehöriger Action, für alle Dialoge, in denen dynamische Felder nicht als Pflichtfelder konfiguriert werden können.',
        'Frontend module registration for the admin interface.' => 'Frontend-Modulregistrierung im Admin-Interface.',
        'The user\'s Mattermost username.' => 'Der Benutzername des Mattermost-Benutzers',
        'Loader module registration for the admin interface.' => 'Loader-Modulregistrierung für die Adminoberfläche.',
        'Adds ticket attribute relations based on CSV/Excel data.' => 'Fügt auf CSV-/Excel-Daten basierende abhängige Ticketattribute hinzu.',
        'Available/allowed actions for ticket attribute relations.' => 'Verfügbare/erlaubte Aktionen für abhängige Ticketattribute.',
        'Always adds empty values to the ticket attribute relations so that it is not needed to add them to the CSV/Excel data.' =>
            'Fügt immer leere Werte zu abhängigen Ticketattributen hinzu, so dass diese nicht zu den CSV-/Excel-Daten hinzugefügt werden müssen.',
        'Triggers event \'TicketAllChildrenClosed\' if all child tickets of a parent ticket have been closed/merged/removed.' =>
            'Löst Event \'TicketAllChildrenClosed\' aus, wenn alle Kind-Tickets eines Eltern-Tickets den Status geschlossen/gemergt/entfernt erreicht haben.',
        'Ticket event module which sends new ticket notifications even for tickets without articles.' =>
            'Ticket-Eventmodul, das Benachrichtigungen für Prozess-Tickets versendet, die keine Artikel haben.',
        'Name of the dynamic field in which the attachment file IDs of the transition will be stored.' =>
            'Name des dynamischen Felds, in dem die Datei-IDs der Anhänge der Transition gespeichert werden.',
        'Keep dynamic field attachments after each transition.' => 'Anhänge in dynamischem Feld nach jeder Transition beibehalten.',
        'Format string for output of attachments in the selection list. "%1$d": article number; "%2$s": filename; "%3$s": translated object type (e.g. Article => Artikel); "%4$s": translated attachment label (e.g. "Anhang").' =>
            'Formatierter String zur Ausgabe der Anhänge in Auswahllisten. "%1$d": Artikelnummer; "%2$s": Dateiname; "%3$s": übersetzter Objekttyp (z. B. Article => Artikel); "%4$s": übersetztes Anhang-Label (z. B. "Anhang").',
        'Sets the service in the ticket bulk screen in the agent interface (Ticket::Service needs to be enabled).' =>
            'Setzt den Service in der Ticket-Sammelaktion in der Agentenoberfläche (Ticket::Service muss aktiviert sein).',
        'Dynamic fields shown in the ticket bulk screen of the agent interface.' =>
            'Dynamische Felder, die in der Ticket-Sammelaktion in der Agentenoberfläche angezeigt werden.',
        'This configuration defines if a dynamic field has to be checked in the agent ticket bulk view to get set for each ticket. This prevents unwanted overwrite of dynamic field values with their default or even empty values.' =>
            'Diese Konfiguration definiert, ob ein dynamisches Feld in der Ticket-Sammelaktion zum Setzen mit einer Checkbox markiert werden muss. Dies verhindert das ungewollte Überschreiben von dynamischen Feldwerten durch deren Standardwerte oder sogar leeren Inhalt.',
        'Default format for export files.' => 'Default-Format für Exportdateien.',
        'Separator for exported CSV files.' => 'Trennzeichen für exportierte CSV-Dateien.',
        'Quoting character for exported CSV files.' => 'Anführungszeichen für exportierte CSV-Dateien.',
        'Handles changes to data of modules which use the DBCRUD base module.' =>
            'Verarbeitet Änderungen an Daten von Modulen, die das DBCRUD-Modul als Basis nutzen.',
        'Cache settings for DBCRUD modules (default: 1 day).' => 'Cache-Einstellungen für DBCRUD-Module (Standardwert: 1 Tag).',
        'Displays notifications for missing and expired OAuth2 tokens.' =>
            'Zeigt Benachrichtigungen für fehlende und abgelaufene OAuth2-Token an.',
        'Authentication type for sendmail module. If \'OAuth2 token\' has been selected, SendmailModule::OAuth2TokenConfigName must also be configured.' =>
            'Authentifikationstyp für das Sendmail-Modul. Falls \'OAuth2-Token\' gewählt wurde, muss SendmailModule::OAuth2TokenConfigName ebenfalls konfiguriert werden.',
        'Name of the OAuth2 token configuration to use for sending mails if \'OAuth2 token\' was configured in SendmailModule::AuthenticationType.' =>
            'Name der OAuth2-Token-Konfiguration für den Versand von E-Mails, falls \'OAuth2-Token\' in SendmailModule::AuthenticationType konfiguriert wurde.',
        'Hosts that need a separate info about authentication method and token (instead of both in one line). Most commonly needed for Office 365 and Outlook.' =>
            'Hosts, die eine getrennte Info über Authentifizierungsmethode und Token benötigen (anstatt beides in einer Zeile). Wird am häufigsten für Office 365 und Outlook benötigt.',
        'This option enables a dropdown which will be displayed instead of the time unit input field.' =>
            'Diese Option aktiviert ein Dropdown, das anstelle des Eingabefeldes für die Zeiteinheit angezeigt wird.',
        'Defines the default ticket attribute for ticket sorting in the owner view of the agent interface.' =>
            'Bestimmt das Standard-Ticket-Attribut für das Sortieren der Tickets in der Besitzer-Tickets-Anzeige im Agent-Interface.',
        'Defines the default ticket order in the owner view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Steuert die Ticket-Sortierung für die Besitzer-Ansicht des Agentenbereichs. Auf: Älteste oben. Ab: Neuste oben.',
        'Columns that can be filtered in the owner view of the agent interface. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed.' =>
            'Filterbare Spalten in der betreffenden Ansicht des Agentenbereichs. Hinweis: Nur Ticket-Attribute, Dynamische Felder (DynamicField_NameX) und Kundenattribute (z. B. CustomerUserPhone, CustomerCompanyName) sind zulässig.',
        'Agent interface notification module to see the number of tickets an agent is owner for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Agenten-Schnittstellen Benachrichtigungs-Modul zum Anzeigen der Anzahl der Tickets, für die der Agent besitzer ist. Zusätzliche Zugriffssteuerung zum Zeigen oder Verstecken dieses Links können durch Nutzung des Schlüssels "Group" und Inhalten wie "rw:group1;move_into:group2" realisiert werden.',
        'Defines the next possible ticket states for calendar based tickets.' =>
            'Definiert die nächstmöglichen Ticketzustände für kalenderbasierte Tickets.',
        'Defines the default next state.' => 'Definiert den standardmäßigen nächsten Zustand in der Agentenschnittstelle.',
        'Defines the default ticket priority for calendar based tickets.' =>
            'Definiert die Standard-Ticketpriorität für kalenderbasierte Tickets.',
        'Defines if the processes should be displayed in TreeView.' => 'Definiert ob die Prozesse in TreeView angezeigt werden sollen.',
        'Enables calendar based ticket creation feature only for the listed groups.' =>
            'Aktiviert die kalenderbasierte Ticketerstellung nur für die aufgeführten Gruppen.',
        'Defines the default ticket title for calendar based tickets.' =>
            'Definiert den Standard-Tickettitel für kalenderbasierte Tickets.',
        'Defines the default ticket body for calendar based tickets.' => 'Definiert den Standard-Ticketbody für kalenderbasierte Tickets.',
        'Defines the default article channel name for calendar based tickets.' =>
            'Definiert den Standardartikelkanal für kalenderbasierte Tickets.',
        'Defines the default visibility of articles for calendar based tickets.' =>
            'Definiert die Standardsichtbarkeit von Artikeln für kalenderbasierte Tickets.',
        'Defines the default sender type for calendar based tickets.' => 'Definiert den Standard-Absendertyp für kalenderbasierte Tickets.',
        'Defines the default from for calendar based tickets.' => 'Definiert die Standardeinstellung des Absenders für kalenderbasierte Tickets.',
        'Defines the default history type for calendar based tickets.' =>
            'Definiert den Standardhistorientyp für kalenderbasierte Tickets.',
        'Defines the default history comment for calendar based tickets.' =>
            'Definiert den standardmäßigen Verlaufskommentar für kalenderbasierte Tickets.',
        'Defines the default content type for calendar based tickets.' =>
            'Definiert den Standardinhaltstyp für kalenderbasierte Tickets.',
        'Threshold (in minutes) for catching up with ticket creation for appointments. Tickets for due appointments will only be created if their planned creation date is not older than the configured amount of minutes. This prevents creation of tickets for e. g. recurring appointments if the ticket creation will be executed some time later.' =>
            'Schwellenwert (in Minuten) für das Aufholen der Ticketerstellung für Termine. Tickets für fällige Termine werden nur dann erstellt, wenn ihr geplantes Erstellungsdatum nicht älter als die konfigurierte Anzahl von Minuten ist. Dadurch wird verhindert, dass Tickets für z. B. wiederkehrende Termine erstellt werden, wenn die Ticketerstellung einige Zeit später durchgeführt wird.',
        'Creates the calendar-based tickets regularly.' => 'Erstellt regelmäßig die kalenderbasierten Tickets.',
        'Cleans up the calendar-based tickets regularly.' => 'Säubert die kalenderbasierten Tickets regelmäßig.',
        'Maximum number of quoted lines to be added to forwarded messages.' =>
            'Maximale Anzahl zitierter Zeilen in weitergeleiteten Nachrichten.',
        'Re-indexes S/MIME certificate folders. Note: S/MIME needs to be enabled in SysConfig.' =>
            'Re-indiziert S/MIME-Zertifikat-Verzeichnisse. Hinweis: S/MIME muss in der SysConfig aktiviert sein.',
        'Maximum length of displayed attachment filenames in the article preview of ticket zoom view.' =>
            'Maximale Länge der angezeigten Dateinamen von Anhängen in der Artikelvorschau der Ticket-Detailansicht.',
        'General settings for autocompletion in rich text editor.' => 'Allgemeine Einstellungen für Autovervollständigung im Rich-Text-Editor.',
        'Rich text editor configuration for autocompletion module.' => 'Rich-Text-Editor-Konfiguration für Autocompletion-Modul.',
        'Rich text editor configuration for autocompletion module to support templates.' =>
            'Rich-Text-Editor-Konfiguration für Autocompletion-Modul zur Unterstützung von Vorlagen.',
        'Defines which notifications about mentions should be sent.' => 'Bestimmt, welche Benachrichtigungen über Erwähnungen versendet werden sollen.',
        'Defines if the toolbar mention icon should count mentions.' => 'Erwähnungs-Icon in Toolbar soll Anzahl der Erwähnungen anzeigen.',
        'These groups won\'t be selectable to be mentioned.' => 'Diese Gruppen stehen nicht für Erwähnungen zur Auswahl.',
        'Limits number of users (per article) that will be marked as mentioned and be notified. Users (and users from mentioned groups) that exceed this limit will silently be ignored.' =>
            'Begrenzt die Anzahl der Benutzer (pro Artikel), die als erwähnt markiert und benachrichtigt werden sollen. Benutzer (und Benutzer aus erwähnten Gruppen), die dieses Limit überschreiten, werden ohne Hinweis ignoriert.',
        'Frontend registration of triggers for mention plugin of CKEditor.' =>
            'Frontend-Registrierung für Trigger des CKEditor-Mention-Plugins.',
        'Frontend registration of input/output templates for mention plugin of CKEditor.' =>
            'Frontend-Registrierung für Template des CKEditor-Mention-Plugins.',
        'Event handler for mentions.' => 'Event-Handler für Erwähnungen.',
        'Parameters for the dashboard backend of the last mention widget.' =>
            'Parameter für das Dasboard-Widget "Letzte Erwähnung".',
        'Agent interface notification module to show the number of mentions.' =>
            'Benachrichtigungsmodul für Agenten-Interface, das die Anzahl der Erwähnungen anzeigt.',
        'Module to grant access to the mentioned agents of a ticket.' => 'Modul, das Zugriff für die erwähnten Agenten eines Tickets gewährt.',
        'Assignment between event and type.' => '',
        'Defines the link type for each activity.' => '',
        'List of colors in hexadecimal RGB which will be available for selection. Make sure the colors are dark enough so white text can be overlayed on them.' =>
            '',
        'Mapping of non-standard time zones to official ones.' => 'Mapping von Nicht-Standard-Zeitzonen zu offiziellen Zeitzonen.',
        'Start date (YYYYMMDD) of the range to use when parsing ICS files. The used CPAN module iCal::Parser needs this to be able to parse ICS files with events in a year before the current one. The end date of the range is automatically set to 10 years in the future from the time of parsing/execution.' =>
            'Startdatum (JJJJMMTT) des Bereichs, der beim Parsen von ICS-Dateien verwendet werden soll. Das verwendete CPAN-Modul iCal::Parser benötigt diese Angabe, um ICS-Dateien mit Events in einem Jahr vor dem aktuellen Jahr parsen zu können. Das Enddatum des Bereichs wird automatisch auf 10 Jahre in der Zukunft ab dem Zeitpunkt des Parsens/Ausführens gesetzt.',
        'Define a mapping between variables of the customer company data (keys) and dynamic fields of a ticket (values). The purpose is to store customer company data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerCompany setting.' =>
            'Definiert eine Zuordnung zwischen Variablen der Kundendaten (Schlüssel) und dynamischen Feldern eines Ticket (Werte). Somit können Sie Kundendaten eines Tickets in dynamische Felder speichern. Die dynamischen Felder müssen im System vorhanden sein und sollten für AgentTicketFreeText aktiviert werden, damit sie eingestellt / manuell durch den Agenten aktualisiert werden können. Sie dürfen nicht für AgentTicketPhone, AgentTicketEmail und AgentTicketCustomer aktiviert werden. Wenn dies der Fall ist, so haben sie Vorrang gegenüber den automatisch gesetzten Werten. Um dieses Mapping zu verwenden, müssen Sie auch die Ticket Einstellung Ticket::EventModulePost###4100-DynamicFieldFromCustomerCompany aktivieren.',
        'This event module stores attributes from customer companies in ticket dynamic fields. Please see DynamicFieldFromCustomerCompany::Mapping setting for how to configure the mapping.' =>
            'Dieses Eventmodul speichert Attribute des Kunden in dynamischen Ticketfeldern. Bitte schauen Sie sich die DynamicFieldFromCustomerCompany::Mapping-Einstellung für die Konfiguration des Mappings an.',
        'Required permissions to use the NoteToLinkedTicket screen in the agent interface.' =>
            'Benötigte Rechte, um den "Notiz übergeben"-Dialog im Agenten-Interface aufzurufen.',
        'Sets the state of the selected linked ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            'Setzt den Status des ausgewählten verknüpften Tickets im NoteToLinkedTicket-Dialog des Agenten-Interface',
        'Defines the default next state of a ticket after adding a note in the NoteToLinkedTicket screen of the agent interface.' =>
            'Definiert den standardmäßigen nächsten Status des Tickets nach dieser Aktion in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Activates the selection if a note in NoteToLinkedTicket screen should be created in this origin ticket.' =>
            'Aktiviert die Auswahl, ob eine Notiz in der "Notiz übergeben"-Aktion auch im Ursprungsticket erstellt werden soll.',
        'Defines the default value if a note in NoteToLinkedTicket screen should be created in this origin ticket.' =>
            'Definiert den Standardwert, ob eine Notiz in der "Notiz übergeben"-Aktion auch im Ursprungsticket erstellt werden soll.',
        'Sets the default subject for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            'Bestimmt den Standardbetreff für Notizen, die im "Notiz übergeben"-Dialog im Agenten-Interface hinzugefügt werden.',
        'Sets the default body text for notes added in the NoteToLinkedTicket screen of the agent interface.' =>
            'Setzt den Standardtext für Notizen in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Allows adding notes in the NoteToLinkedTicket screen of the agent interface.' =>
            'Erlaubt im Agenten-Interface das Hinzufügen von Notizen im "Notiz übergeben"-Dialog.',
        'Sets if a note in NoteToLinkedTicket screen must be filled in by the agent.' =>
            'Bestimmt, ob die Notiz im "Notiz übergeben"-Dialog befüllt sein muss.',
        'Defines the history type for the NoteToLinkedTicket screen, which will be used for ticket history in the agent interface.' =>
            'Definiert den History-Typ für die Aktion "Notiz übergeben", welcher für die Ticket-Historie im Agenten-Interface benutzt wird.',
        'Defines the history comment for the NoteToLinkedTicket screen, which will be used for ticket history in the agent interface.' =>
            'Steuert den History-Kommentar für die "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Defines if the note in the NoteToLinkedTicket screen of the agent interface is visible for the customer by default.' =>
            'Definiert, ob eine Notiz im "Notiz übergeben"-Dialog für den Kunden sichtbar sein soll.',
        'Sets the ticket type in the NoteToLinkedTicket screen of the agent interface (Ticket::Type needs to be activated).' =>
            'Setzt den Ticket-Typ in der "Notiz übergeben"-Aktion im Agenten-Interface. (Ticket::Type muss aktiviert werden).',
        'Sets the service in the NoteToLinkedTicket screen of the agent interface (Ticket::Service needs to be activated).' =>
            'Setzt den Service in der "Notiz übergeben"-Aktion im Agenten-Interface (Ticket::Service muss aktiviert sein).',
        'Sets the queue in the NoteToLinkedTicket screen of a zoomed ticket in the agent interface.' =>
            'Setzt die Queue in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Sets the ticket owner in the NoteToLinkedTicket screen of the agent interface.' =>
            'Setzt den Ticket-Besitzer in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Sets the responsible agent of the ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            'Setzt den Verantwortlichen in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Sets the state of a ticket in the NoteToLinkedTicket screen of the agent interface.' =>
            'Setzt den Status in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Defines the next state of a ticket after adding a note in the NoteToLinkedTicket screen of the agent interface.' =>
            'Definiert den nächsten Status des Tickets nach dieser Aktion in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Shows the ticket priority options in the NoteToLinkedTicket screen of the agent interface.' =>
            'Zeig die Ticket-Priorität-Option in der "Notiz übergeben"-Aktion im Agenten-Interface an.',
        'Defines the default ticket priority in the NoteToLinkedTicket screen of the agent interface.' =>
            'Definiert die standardmäßige nächste Priorität des Tickets nach dieser Aktion in der "Notiz übergeben"-Aktion im Agenten-Interface.',
        'Shows the title field in the NoteToLinkedTicket screen of the agent interface.' =>
            'Zeigt den Ticket-Titel in der "Notiz übergeben"-Aktion im Agenten-Interface an.',
        'User preferences backend to use.' => 'Zu verwendendes User-Preferences-Backend.',
        'Loader module registration for the public interface.' => 'Lade-Modulregistrierung für das öffentliche Interface.',
        'Deletes orphaned sessions.' => 'Löscht verwaiste Sessions.',
        'Defines the config parameters available in the preferences view. The default redirect URL from SysConfig \'MarkTicketUnseenRedirectDefaultURL\' is used if no selection is made by the agent.' =>
            'Definiert die zur Verfügung stehenden Konfigurationsparameter in der Einstellungsansicht. Der Standard-Umleitungs-URL der SysConfig-Einstellung \'MarkTicketUnseenRedirectDefaultURL\' wird verwendet, falls der Agent keine Auswahl getroffen hat.',
        'Defines the redirect URL for setting a ticket article to \'unseen\'.' =>
            'Definiert den URL, zu dem umgeleitet wird, nachdem ein Artikel auf \'ungelesen\' gesetzt wurde.',
        'Defines the config parameters available in the preferences view. The default redirect URL from SysConfig \'MarkTicketSeenRedirectDefaultURL\' is used if no selection is made by the agent.' =>
            'Definiert die zur Verfügung stehenden Konfigurationsparameter in der Einstellungsansicht. Der Standard-Umleitungs-URL der SysConfig-Einstellung \'MarkTicketSeenRedirectDefaultURL\' wird verwendet, falls der Agent keine Auswahl getroffen hat.',
        'Defines the redirect URL for setting a ticket article to \'seen\'.' =>
            'Definiert den URL, zu dem umgeleitet wird, nachdem ein Artikel auf \'gelesen\' gesetzt wurde.',
        'Registers a link in the ticket menu to mark a ticket as unseen.' =>
            'Registriert einen Link im Ticketmenü, um ein Ticket als ungelesen zu markieren.',
        'Registers a link in the ticket menu to mark a ticket as seen.' =>
            'Registriert einen Link im Ticketmenü, um ein Ticket als gelesen zu markieren.',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as unseen.' =>
            'Registriert einen Link im Ticketmenü von Ticketübersichten, um ein Ticket als ungelesen zu markieren.',
        'Registers a link in the ticket menu of ticket overviews to mark all articles of the ticket as seen.' =>
            'Registriert einen Link im Ticketmenü von Ticketübersichten, um ein Ticket als gelesen zu markieren.',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "agent".' =>
            'Mapping der Ticketpriorität zum X-Priority E-Mail-Header für ausgehende E-Mails des Kommunikationskanals "Agent".',
        'Mapping of ticket priority to X-Priority email header for outgoing emails of communication channel "system".' =>
            'Mapping der Ticketpriorität zum X-Priority E-Mail-Header für ausgehende E-Mails des Kommunikationskanals "System".',
        'Adds the field mapping for AgentTicketActionCommon for an unknown action. Used by Znuny.Form.Input.' =>
            'Ergänzt Feld-Mapping für AgentTicketActionCommon für unbekannte Action. Wird von Znuny.Form.Input verwendet.',

        # XML Definition: scripts/database/initial_insert.xml
        'invalid-temporarily' => 'ungültig-temporär',
        'Group for default access.' => 'Gruppe für den Standardzugriff.',
        'Group of all administrators.' => 'Gruppe aller Administratoren.',
        'Group for statistics access.' => 'Gruppe für den Statistikzugriff.',
        'Group for time accounting web service access.' => '',
        'new' => 'neu',
        'All new state types (default: viewable).' => 'Alle neuen Statustypen (Standard: sichtbar).',
        'open' => 'offen',
        'All open state types (default: viewable).' => 'Alle offenen Statustypen (Standard: sichtbar).',
        'closed' => 'geschlossen',
        'All closed state types (default: not viewable).' => 'Alle geschlossenen Statustypen (Standard: nicht sichtbar).',
        'pending reminder' => 'warten zur Erinnerung',
        'All \'pending reminder\' state types (default: viewable).' => 'Alle \'warten auf\'-Statustypen (Standard: sichtbar).',
        'pending auto' => 'warten auf',
        'All \'pending auto *\' state types (default: viewable).' => 'Alle \'warten auf automatisch *\'-Statustypen (Standard: sichtbar).',
        'removed' => 'entfernt',
        'All \'removed\' state types (default: not viewable).' => 'Alle \'entfernt\'-Statustypen (Standard: nicht sichtbar).',
        'merged' => 'zusammengefasst',
        'State type for merged tickets (default: not viewable).' => 'Statustyp für zusammengefasste Tickets (Standard: nicht sichtbar).',
        'New ticket created by customer.' => 'Neues Ticket von Kunden erstellt.',
        'closed successful' => 'erfolgreich geschlossen',
        'Ticket is closed successful.' => 'Ticket erfolgreich geschlossen.',
        'closed unsuccessful' => 'erfolglos geschlossen',
        'Ticket is closed unsuccessful.' => 'Das Ticket ist erfolglos geschlossen.',
        'Open tickets.' => 'Offene Tickets.',
        'Customer removed ticket.' => 'Kunde hat Ticket entfernt.',
        'Ticket is pending for agent reminder.' => 'Das Ticket wartet auf Erinnerung für Agenten.',
        'pending auto close+' => 'warten auf erfolgreich schließen',
        'Ticket is pending for automatic close.' => 'Das Ticket wartet auf automatisches schließen.',
        'pending auto close-' => 'warten auf erfolglos schließen',
        'State for merged tickets.' => 'Status für zusammengefasste Tickets.',
        'system standard salutation (en)' => 'Systemstandardanrede (en)',
        'Standard Salutation.' => 'Standardanrede.',
        'system standard signature (en)' => 'Systemstandardsignatur (en)',
        'Standard Signature.' => 'Standard Signatur.',
        'Standard Address.' => 'Standard Adresse.',
        'possible' => 'möglich',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Rückfragen für geschlossene Tickets sind möglich. Tickets werden wieder geöffnet.',
        'reject' => 'ablehnen',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Rückfragen für geschlossene Tickets sind nicht möglich. Neue Tickets werden nicht erstellt.',
        'new ticket' => 'neues Ticket',
        'Follow-ups for closed tickets are not possible. A new ticket will be created.' =>
            'Rückfragen für geschlossene Tickets sind nicht möglich. Ein neues Ticket wird erstellt.',
        'Postmaster queue.' => 'Postmaster-Queue.',
        'All default incoming tickets.' => 'Alle eingehenden Tickets.',
        'All junk tickets.' => 'Alle Junk-Tickets.',
        'All misc tickets.' => 'Alle Misc-Tickets.',
        'auto reply' => 'automatische Antwort',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Eine automatische Antwort wird versandt, nachdem ein neues Ticket erstellt wurde.',
        'auto reject' => 'automatische Ablehnung',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Automatische Ablehnung, die gesendet wird, nachdem eine Rückantwort abgelehnt wurde (falls die Queue-Einstellung für Rückantworten auf "Ablehnen" gesetzt ist).',
        'auto follow up' => 'automatische Rückfrage',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Automatische Bestätigung, die gesendet wird, nachdem eine Rückantwort für ein Ticket empfangen wurde (falls die Queue-Einstellung für Rückantworten auf "Möglich" gesetzt ist).',
        'auto reply/new ticket' => 'automatische Antwort / neues Ticket',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Automatische Antwort, die gesendet wird, nachdem eine Rückantwort abgelehnt und ein neues Ticket erstellt wurde (falls die Queue-Einstellung für Rückantworten auf "Neues Ticket" gesetzt ist.',
        'auto remove' => 'automatisches Entfernen',
        'Auto remove will be sent out after a customer removed the request.' =>
            '"Automatisches Entfernen" wird versendet, nachdem der Kundenbenutzer die Anfrage entfernt hat.',
        'default reply (after new ticket has been created)' => 'Standardantwort (nachdem ein neues Ticket erstellt wurde)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'Standardablehnung (nachdem eine Antwort auf ein geschlossenes Ticket eingegangen und diese abgelehnt wurde)',
        'default follow-up (after a ticket follow-up has been added)' => 'Standardantwort (nachdem eine Antwort auf ein Ticket eingegangen ist)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'Standardablehnung/Neues Ticket erstellt (nachdem eine Antwort auf ein geschlossenes Ticket eingegangen ist und ein neues Ticket erstellt wurde)',
        'Unclassified' => 'Unklassifiziert',
        '1 very low' => '1 sehr niedrig',
        '2 low' => '2 niedrig',
        '3 normal' => '3 normal',
        '4 high' => '4 hoch',
        '5 very high' => '5 sehr hoch',
        'unlock' => 'frei',
        'lock' => 'gesperrt',
        'tmp_lock' => 'tmp_lock',
        'agent' => 'Agent',
        'system' => 'System',
        'customer' => 'Kunde',
        'Ticket create notification' => 'Benachrichtigung über neues Ticket',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket in Ihren unter "Meine Queues" oder "Meine Services" ausgewählten Queues oder Services erstellt wird.',
        'Ticket follow-up notification (unlocked)' => 'Benachrichtigung über Folgeaktionen (entsperrtes Ticket)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Kunde eine Rückmeldung zu einem Ticket sendet, das in Ihren unter "Meine Queues" oder "Meine Services" ausgewählten Queues oder Services erstellt wurde.',
        'Ticket follow-up notification (locked)' => 'Benachrichtigung über Folgeaktionen (gesperrtes Ticket)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Kunde eine Rückmeldung zu einem Ticket sendet, dessen Besitzer oder Verantwortlicher Sie sind.',
        'Ticket lock timeout notification' => 'Mitteilung bei Überschreiten der Ticket-Sperrzeit',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket, dessen Besitzer Sie sind, automatisch entsperrt wurde.',
        'Ticket owner update notification' => 'Benachrichtigung über Änderung des Ticket-Besitzers',
        'Ticket responsible update notification' => 'Benachrichtigung über Änderung des Ticket-Verantwortlichen',
        'Ticket new note notification' => 'Benachrichtigung über neue Notiz',
        'Ticket queue update notification' => 'Benachrichtigung über Änderung der Queue',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Sie erhalten eine Benachrichtigung, wenn ein Ticket in eine der Queues verschoben wurde, die Sie unter "Meine Queues" ausgewählt haben.',
        'Ticket pending reminder notification (locked)' => 'Benachrichtigung über Erreichen der Erinnerungszeit (gesperrtes Ticket)',
        'Ticket pending reminder notification (unlocked)' => 'Benachrichtigung über Erreichen der Erinnerungszeit (entsperrtes Ticket)',
        'Ticket escalation notification' => 'Benachrichtigung über erfolgte Ticket-Eskalation',
        'Ticket escalation warning notification' => 'Benachrichtigung über baldige Ticket Eskalation',
        'Ticket service update notification' => 'Benachrichtigung über Änderung des Services',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            'Sie erhalten eine Benachrichtigung, wenn für ein Ticket einer der Services ausgewählt wurde, die Sie unter "Meine Services" ausgewählt haben.',
        'Appointment reminder notification' => 'Benachrichtigung über Erreichen der Erinnerungszeit von Terminen',
        'You will receive a notification each time a reminder time is reached for one of your appointments.' =>
            'Sie erhalten immer dann eine Benachrichtigung, wenn der Benachrichtigungszeitpunkt für einen Ihrer Termine erreicht wurde.',
        'Ticket email delivery failure notification' => 'Benachrichtigung über Fehler beim Versand von E-Mail-Tickets',
        'Mention notification' => 'Benachrichtigung für Erwähnung',

        # JS File: var/httpd/htdocs/js/Core.AJAX.js
        'Error during AJAX communication. Status: %s, Error: %s' => 'Fehler während AJAX-Kommunikation. Status: %s, Fehler: %s',
        'This window must be called from compose window.' => 'Dieses Fenster muss aus dem Fenster zum Verfassen von Tickets aufgerufen werden.',

        # JS File: var/httpd/htdocs/js/Core.Activity.js
        'An error occurred' => 'Ein Fehler ist aufgetreten',
        'The activity could not be created. %s is needed.' => 'Die Aktivität konnte nicht erstellt werden. %s wird benötigt.',
        'The activity could not be created.' => 'Die Aktivität konnte nicht erstellt werden.',
        'The activity could not be updated.' => 'Die Aktivität konnte nicht aktualisiert werden.',
        'The activity could not be deleted.' => 'Die Aktivität konnte nicht gelöscht werden.',
        'The activity could not be marked as new.' => 'Die Aktivität konnte nicht als neu markiert werden.',
        'The activity could not be marked as seen.' => 'Die Aktivität konnte nicht als gelesen markiert werden.',
        'The activities could not be marked as seen.' => 'Die Aktivitäten konnten nicht als gelesen markiert werden.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ACL.js
        'Add all' => 'Alle hinzufügen',
        'An item with this name is already present.' => 'Ein Eintrag mit diesem Namen existiert bereits.',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Dieser Eintrag enthält Untereinträge. Wollen Sie den Eintrag und alle Untereinträge wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.AppointmentCalendar.Manage.js
        'Press Ctrl+C (Cmd+C) to copy to clipboard' => 'In die Zwischenablage legen mit Strg+C (Cmd+C)',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Attachment.js
        'Delete this Attachment' => 'Diesen Anhang entfernen',
        'Deleting attachment...' => 'Anhang wird entfernt...',
        'There was an error deleting the attachment. Please check the logs for more information.' =>
            'Es ist ein Fehler beim Entfernen des Anhangs aufgetreten. Bitte prüfen Sie die Protokolle für mehr Informationen.',
        'Attachment was deleted successfully.' => 'Anhang erfolgreich entfernt.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.DynamicField.js
        'Do you really want to delete this dynamic field? ALL associated data will be LOST!' =>
            'Wollen Sie dieses Dynamische Feld wirklich löschen? Alle darin enthaltenen Daten werden GELÖSCHT!',
        'Delete field' => 'Feld löschen',
        'Deleting the field and its data. This may take a while...' => 'Lösche das Feld und die zugehörigen Daten. Dies kann etwas dauern...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericAgent.js
        'Remove this dynamic field' => 'Dieses dynamische Feld entfernen',
        'Remove selection' => 'Auswahl entfernen',
        'An error occurred during communication.' => 'Während der Kommunikation ist ein Fehler aufgetreten.',
        'Duplicate event.' => 'Ereignis duplizieren.',
        'This event is already attached to the job, Please use a different one.' =>
            'Dieses Event ist dem Job bereits zugeordnet. Bitte wählen Sie ein anderes aus.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceDebugger.js
        'Request Details' => 'Anfragedetails',
        'Request Details for Communication ID' => 'Anfragedetails für Verbindungs-ID',
        'Show or hide the content.' => 'Inhalt anzeigen oder verbergen.',
        'Clear debug log' => 'Debug-Protokoll leeren',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceErrorHandling.js
        'Delete error handling module' => 'Fehlerbehandlungs-Modul entfernen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvoker.js
        'It is not possible to add a new event trigger because the event is not set.' =>
            'Es ist nicht möglich einen neuen Event-Trigger hinzuzufügen, da das Event noch nicht angelegt ist.',
        'Delete this Invoker' => 'Diesen Invoker löschen',
        'Delete this Event Trigger' => 'Diesen Event-Trigger löschen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvokerEvent.js
        'Sorry, the only existing condition can\'t be removed.' => 'Die einzig existierende Bedingung kann nicht entfernt werden.',
        'Sorry, the only existing field can\'t be removed.' => 'Das einzig existierende Feld kann nicht entfernt werden.',
        'Delete conditions' => 'Bedingungen löschen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceMapping.js
        'Mapping for Key %s' => 'Mapping für Schlüssel %s',
        'Mapping for Key' => 'Mapping für Schlüssel',
        'Delete this Key Mapping' => 'Schlüssel-Mapping löschen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceOperation.js
        'Delete this Operation' => 'Diese Operation löschen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceWebservice.js
        'Clone web service' => 'Webservice klonen',
        'Delete operation' => 'Operation löschen',
        'Delete invoker' => 'Invoker löschen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Group.js
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'VORSICHT: Wenn Sie den Namen der \'admin\'-Gruppe ändern ohne zuvor die entsprechenden Anpassungen in der SysConfig getätigt haben, verlieren Sie den Zugang zum Adminbereich! In diesem Fall sollten Sie den Gruppennamen in der Datenbank zurücksetzen.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js
        'Delete this Mail Account' => 'E-Mail-Konto löschen',
        'Deleting the mail account and its data. This may take a while...' =>
            'E-Mail-Konto und Daten werden gelöscht. Dies kann einige Zeit dauern...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.NotificationEvent.js
        'Do you really want to delete this notification language?' => 'Möchten Sie diese Benachrichtigungssprache wirklich löschen?',
        'Do you really want to delete this notification?' => 'Möchten Sie diese Benachrichtigung wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.OAuth2TokenManagement.js
        'Do you really want to delete this token and its configuration?' =>
            'Soll das Token und dessen Konfiguration wirklich gelöscht werden?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PGP.js
        'Do you really want to delete this key?' => 'Möchten Sie diesen Schlüssel wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PackageManager.js
        'There is a package upgrade process running, click here to see status information about the upgrade progress.' =>
            'Derzeit läuft ein Prozess zur Paketaktualisierung. Klicken Sie hier, um Statusinformationen zu erhalten.',
        'A package upgrade was recently finished. Click here to see the results.' =>
            'Eine Paketaktualisierung wurde kürzlich beendet. Klicken Sie hier, um die Ergebnisse zu betrachten.',
        'No response from get package upgrade result.' => 'Keine Antwort von get package upgrade result.',
        'Update all packages' => 'Alle Pakete aktualisieren',
        'Dismiss' => 'Verwerfen',
        'Update All Packages' => 'Alle Pakete aktualisieren',
        'No response from package upgrade all.' => 'Keine Antwort von upgrade all.',
        'Currently not possible' => 'Derzeit nicht möglich',
        'This is currently disabled because of an ongoing package upgrade.' =>
            'Dies ist derzeit nicht möglich, da eine Paketaktualisierung läuft.',
        'This option is currently disabled because the Znuny Daemon is not running.' =>
            'Diese Option ist derzeit deaktiviert, weil der Znuny Daemon nicht läuft.',
        'Are you sure you want to update all installed packages?' => 'Sind Sie sicher, dass Sie alle installierten Pakete aktualisieren möchten?',
        'No response from get package upgrade run status.' => 'Keine Antwort von package upgrade run status.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.PostMasterFilter.js
        'Delete this PostMasterFilter' => 'Diesen Postmaster-Filter löschen',
        'Deleting the postmaster filter and its data. This may take a while...' =>
            'Lösche den Postmaster-Filter und die zugehörigen Daten. Dies kann etwas dauern...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.Canvas.js
        'Remove Entity from canvas' => 'Eintrag entfernen',
        'No TransitionActions assigned.' => 'Keine Übergangsaktionen zugewiesen.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Es sind noch keine Dialoge zugewiesen. Wählen Sie einfach einen Aktivitäts-Dialog in der linken Liste aus und ziehen Sie ihn in die rechte Liste.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Diese Aktivität kann nicht gelöscht werden, weil sie die Start-Aktivität ist.',
        'Remove the Transition from this Process' => 'Diesen Übergang aus dem Prozess entfernen',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.js
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Sobald sie die Schaltfäche oder den Link verwenden, verlassen Sie dieses Fenster, und der aktuelle Stand wird automatisch gespeichert. Möchten Sie fortfahren?',
        'Delete Entity' => 'Eintrag löschen',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Diese Aktivität wird bereits im Prozess verwendet. Sie können sie nicht erneut hinzufügen!',
        'Error during AJAX communication' => 'Fehler während AJAX-Kommunikation',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Auf der Zeichenfläche ist ein nicht verbundener Übergang vorhanden. Bitte verbinden Sie diesen Übergang zuerst, bevor Sie einen weiteren Übergang platzieren.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Dieser Übergang wird bereits für diese Aktiviät verwendet. Sie können ihn nicht erneut hinzufügen!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Diese Übergangsaktion wird bereits in diesem Pfad verwendet. Sie können sie nicht erneut hinzufügen!',
        'Hide EntityIDs' => 'EntityIDs ausblenden',
        'Edit Field Details' => 'Felddetails bearbeiten',
        'Customer interface does not support articles not visible for customers.' =>
            'Das Kunden-Interface unterstützt keine internen Artikeltypen.',
        'Sorry, the only existing parameter can\'t be removed.' => 'Der einzig existierende Parameter kann nicht entfernt werden.',
        'Are you sure you want to overwrite the config parameters?' => 'Sollen die Konfigurations-Parameter wirklich überschrieben werden?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SMIME.js
        'Do you really want to delete this certificate?' => 'Möchten Sie dieses Zertifikat wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SupportDataCollector.js
        'Generating...' => 'Wird erstellt...',
        'It was not possible to generate the Support Bundle.' => 'Das Support-Paket konnte nicht erzeugt werden.',
        'Generate Result' => 'Ergebnis der Generierung',
        'Support Bundle' => 'Support-Paket',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SysConfig.Entity.js
        'It is not possible to set this entry to invalid. All affected configuration settings have to be changed beforehand.' =>
            'Es ist nicht möglich, diesen Eintrag auf ungültig zu setzen, bevor alle betroffenen Konfiguration entsprechend angepasst wurden.',
        'Cannot proceed' => 'Kann nicht fortfahren',
        'Update manually' => 'Manuell aktualisieren',
        'You can either have the affected settings updated automatically to reflect the changes you just made or do it on your own by pressing \'update manually\'.' =>
            'Sie können die betroffenen Einstellungen automatisch entsprechend der vorgenommen Änderungen aktualisieren lassen oder die Änderungen durch Klicken von "manuell anpassen" selbst vornehmen.',
        'Save and update automatically' => 'Speichern und automatisch aktualisieren',
        'Don\'t save, update manually' => 'Nicht speichern, manuell aktualisieren',
        'The item you\'re currently viewing is part of a not-yet-deployed configuration setting, which makes it impossible to edit it in its current state. Please wait until the setting has been deployed. If you\'re unsure what to do next, please contact your system administrator.' =>
            'Der Eintrag, den Sie gerade betrachten, ist Teil einer Konfigurationseinstellung, die bislang nicht in Betrieb genommen wurde und deshalb derzeit nicht änderbar ist. Bitte warten Sie, bis die Einstellung in Betrieb genommen wurde. Wenn Sie unsicher sind, was als nächstes zu tun ist, kontaktieren Sie bitte Ihren Systemadministrator.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemConfiguration.js
        'Loading...' => 'Laden...',
        'Search the System Configuration' => 'Systemkonfiguration durchsuchen',
        'Please enter at least one search word to find anything.' => 'Bitte geben Sie mindestens einen Suchbegriff ein.',
        'Unfortunately deploying is currently not possible, maybe because another agent is already deploying. Please try again later.' =>
            'Inbetriebnahme derzeit nicht möglich. Möglicherweise läuft bereits eine durch einen anderen Agenten angestoßene Inbetriebnahme. Bitte versuchen Sie es später noch einmal.',
        'Deploy' => 'In Betrieb nehmen',
        'The deployment is already running.' => 'Inbetriebnahme läuft bereits.',
        'Deployment successful. You\'re being redirected...' => 'Inbetriebnahme erfolgreich, sie werden weitergeleitet...',
        'There was an error. Please save all settings you are editing and check the logs for more information.' =>
            'Es sind Fehler aufgetreten. Bitte speichern Sie alle Einstellungen, die Sie derzeit bearbeiten und prüfen Sie die Protokolle für mehr Informationen.',
        'Reset option is required!' => 'Reset-Option wird benötigt!',
        'By restoring this deployment all settings will be reverted to the value they had at the time of the deployment. Do you really want to continue?' =>
            'Bei Wiederherstellung dieser Version werden alle Einstellungen auf den Stand zurückgesetzt, den sie zum Zeitpunkt der jeweiligen Inbetriebnahme hatten. Möchten Sie fortfahren?',
        'Keys with values can\'t be renamed. Please remove this key/value pair instead and re-add it afterwards.' =>
            'Schlüssel mit Werten können nicht umbenannt werden. Bitte entfernen Sie dieses Schlüssel/Wert-Paar und fügen Sie es anschließend erneut hinzu.',
        'Unlock setting.' => 'Einstellung entsperren.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemMaintenance.js
        'Do you really want to delete this scheduled system maintenance?' =>
            'Wollen Sie diese geplante Systemwartung wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Template.js
        'Delete this Template' => 'Diese Vorlage löschen',
        'Deleting the template and its data. This may take a while...' =>
            'Lösche das Template und die zugehörigen Daten. Dies kann etwas dauern...',

        # JS File: var/httpd/htdocs/js/Core.Agent.AppointmentCalendar.js
        'Jump' => 'Springen',
        'Timeline Month' => 'Zeitstrahl Monat',
        'Timeline Week' => 'Zeitstrahl Woche',
        'Timeline Day' => 'Zeitstrahl Tag',
        'Previous' => 'Zurück',
        'Resources' => 'Ressourcen',
        'Su' => 'So',
        'Mo' => 'Mo',
        'Tu' => 'Di',
        'We' => 'Mi',
        'Th' => 'Do',
        'Fr' => 'Fr',
        'Sa' => 'Sa',
        'This is a repeating appointment' => 'Dieser Termin wiederholt sich',
        'Would you like to edit just this occurrence or all occurrences?' =>
            'Möchten Sie nur diesen Termin oder alle Vorkommnisse bearbeiten?',
        'All occurrences' => 'Alle Vorkommnisse',
        'Just this occurrence' => 'Nur diesen Termin',
        'Too many active calendars' => 'Zuviele aktive Kalender',
        'Please either turn some off first or increase the limit in configuration.' =>
            'Bitte deaktivieren Sie zuerst einige oder erhöhen Sie das Limit in der Konfiguration.',
        'Restore default settings' => 'Standard-Einstellungen wiederherstellen',
        'Are you sure you want to delete this appointment? This operation cannot be undone.' =>
            'Möchten Sie diesen Termin wirklich löschen? Diese Änderung kann nicht rückgängig gemacht werden.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerSearch.js
        'First select a customer user, then select a customer ID to assign to this ticket.' =>
            'Wählen Sie zunächst einen Kundenbenutzer aus. Anschließend können Sie das Ticket einer Kundennummer zuweisen.',
        'Duplicated entry' => 'Doppelter Eintrag',
        'It is going to be deleted from the field, please try again.' => 'Er wird aus dem Feld entfernt, bitte versuchen Sie es erneut.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerUserAddressBook.js
        'Please enter at least one search value or * to find anything.' =>
            'Bitte geben Sie zumindest einen Suchbegriff ein oder * um nach Allem zu suchen.',
        'Insert selected customer user(s) into the "%s:" field.' => 'Ausgewählte(n) Kundenbenutzer in das Feld "%s:" einfügen.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Daemon.js
        'Information about the Znuny Daemon' => 'Informationen über den Znuny Daemon',

        # JS File: var/httpd/htdocs/js/Core.Agent.Dashboard.js
        'Please check the fields marked as red for valid inputs.' => 'Bitte prüfen Sie die rot markierten Felder auf gültige Eingaben.',
        'month' => 'Monat',
        'Remove active filters for this widget.' => 'Aktive Filter für dieses Widget entfernen.',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.SearchForm.js
        'Please wait...' => 'Bitte warten...',
        'Searching for linkable objects. This may take a while...' => 'Suche nach verknüpfbaren Objekten. Dies kann etwas dauern...',

        # JS File: var/httpd/htdocs/js/Core.Agent.LinkObject.js
        'Do you really want to delete this link?' => 'Möchten Sie diese Verknüpfung wirklich löschen?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Login.js
        'Are you using a browser plugin like AdBlock or AdBlockPlus? This can cause several issues and we highly recommend you to add an exception for this domain.' =>
            'Nutzen Sie ein Browser-Plugin wie AdBlock oder AdBlockPlus? Dies kann Probleme bei der Nutzung der Software verursachen. Es wird daher empfohlen, eine Ausnahme für diese Domain hinzuzufügen.',
        'Do not show this warning again.' => 'Warnung nicht mehr anzeigen.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Preferences.js
        'Sorry, but you can\'t disable all methods for notifications marked as mandatory.' =>
            'Entschuldigung, Sie können für eine erforderliche Benachrichtigungen nicht alle Benachrichtigungsmethoden abschalten.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Entschuldigung, Sie können für diese Benachrichtigung nicht alle Benachrichtigungsmethoden abschalten.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.' =>
            'Bitte beachten Sie, dass mindestens eine geänderte Einstellung ein Neuladen benötigt. Klicken Sie hier, um den Bildschirm neu zu laden.',
        'An unknown error occurred. Please contact the administrator.' =>
            'Ein unbekannter Fehler ist aufgetreten. Bitte kontaktieren Sie den Administrator.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Responsive.js
        'Switch to desktop mode' => 'Zur Desktop-Ansicht wechseln',

        # JS File: var/httpd/htdocs/js/Core.Agent.Search.js
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Bitte entfernen Sie die folgenden Wörter aus Ihrer Suche, da nach ihnen nicht gesucht werden kann:',

        # JS File: var/httpd/htdocs/js/Core.Agent.SharedSecretGenerator.js
        'Generate' => 'Generieren',

        # JS File: var/httpd/htdocs/js/Core.Agent.SortedTree.js
        'This element has children elements and can currently not be removed.' =>
            'Dieses Element besitzt Kindelemente und kann derzeit nicht entfernt werden.',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketAction.js
        'Select a customer ID to assign to this ticket' => 'Wählen Sie eine Kundennummer aus, die Sie diesem Ticket zuordnen möchten',
        'Do you really want to continue?' => 'Möchten Sie wirklich fortfahren?',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketBulk.js
        ' ...and %s more' => ' ...und %s weitere(s)',
        ' ...show less' => ' ...weniger zeigen',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketFormDraft.js
        'Add new draft' => 'Als Entwurf speichern',
        'Delete draft' => 'Entwurf löschen',
        'There are no more drafts available.' => 'Derzeit sind keine weiteren Entwürfe verfügbar.',
        'It was not possible to delete this draft.' => 'Es war nicht möglich, den Entwurf zu löschen.',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketZoom.js
        'Article filter' => 'Artikelfilter',
        'Apply' => 'Anwenden',
        'Event Type Filter' => 'Ereignistyp-Filter',

        # JS File: var/httpd/htdocs/js/Core.Agent.js
        'Slide the navigation bar' => 'Verschieben Sie die Navigationsleiste',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Bitte schalten Sie den Kompatibilitätsmodus im Internet Explorer aus!',

        # JS File: var/httpd/htdocs/js/Core.App.Responsive.js
        'Switch to mobile mode' => 'Zur mobilen Ansicht wechseln',

        # JS File: var/httpd/htdocs/js/Core.App.js
        'Error: Browser Check failed!' => 'Fehler: Webbrowser-Überprüfung fehlgeschlagen!',
        'Reload page' => 'Seite aktualisieren',
        'Reload page (%ss)' => 'Seite aktualisieren (%ss)',

        # JS File: var/httpd/htdocs/js/Core.Debug.js
        'Namespace %s could not be initialized, because %s could not be found.' =>
            'Der Namensraum %s konnte nicht initialisiert werden, weil %s nicht gefunden wurde.',

        # JS File: var/httpd/htdocs/js/Core.Exception.js
        'An error occurred! Please check the browser error log for more details!' =>
            'Ein Fehler ist aufgetreten! Bitte prüfen Sie das Protokoll Ihres Webbrowsers für mehr Details!',

        # JS File: var/httpd/htdocs/js/Core.Form.Validate.js
        'One or more errors occurred!' => 'Ein oder mehrere Fehler sind aufgetreten!',

        # JS File: var/httpd/htdocs/js/Core.Installer.js
        'Mail check successful.' => 'Konfigurationsprüfung erfolgreich.',
        'Error in the mail settings. Please correct and try again.' => 'Fehler in der Mail-Konfiguration. Bitte korrigieren und nochmals probieren.',

        # JS File: var/httpd/htdocs/js/Core.SystemConfiguration.js
        'Open this node in a new window' => 'Diesen Knoten in einem neuen Fenster öffnen',
        'Please add values for all keys before saving the setting.' => 'Bitte tragen Sie Werte für alle Schlüssel ein, bevor Sie die Einstellung speichern.',
        'The key must not be empty.' => 'Der Schlüssel darf nicht leer sein.',
        'A key with this name (\'%s\') already exists.' => 'Ein Schlüssel mit diesem Namen (\'%s\') existiert bereits.',
        'Do you really want to revert this setting to its historical value?' =>
            'Möchten Sie diese Einstellung wirklich auf ihren ursprünglichen Wert zurücksetzen?',

        # JS File: var/httpd/htdocs/js/Core.UI.Datepicker.js
        'Open date selection' => 'Datumsauswahl öffnen',
        'Invalid date (need a future date)!' => 'Ungültiges Datum (Benötige Datum in der Zukunft)!',
        'Invalid date (need a past date)!' => 'Ungültiges Datum (Benötige Datum in der Vergangenheit)!',

        # JS File: var/httpd/htdocs/js/Core.UI.InputFields.js
        'Not available' => 'Nicht verfügbar',
        'and %s more...' => 'und %s weitere...',
        'Show current selection' => 'Aktuelle Auswahl anzeigen',
        'Current selection' => 'Aktuelle Auswahl',
        'Clear all' => 'Alles löschen',
        'Filters' => 'Filter',
        'Clear search' => 'Suche löschen',

        # JS File: var/httpd/htdocs/js/Core.UI.Popup.js
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Wenn Sie diese Seite verlassen, werden auch alle geöffneten Dialoge geschlossen!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Auf diesem Bildschirm ist bereits ein Popup-Fenster geöffnet. Möchten Sie dieses schließen und dieses stattdessen öffnen?',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Konnte Popup-Fenster nicht öffnen. Bitte deaktivieren Sie alle Popup-Blocker für diese Anwendung.',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.Sort.js
        'Ascending sort applied, ' => 'Aufsteigende Sortierung angewandt, ',
        'Descending sort applied, ' => 'Absteigende Sortierung angewandt, ',
        'No sort applied, ' => 'Keine Sortierung angewandt, ',
        'sorting is disabled' => 'Sortierung deaktiviert',
        'activate to apply an ascending sort' => 'Aktivieren, um eine aufsteigende Sortierung anzuwenden',
        'activate to apply a descending sort' => 'Aktivieren, um eine absteigende Sortierung anzuwenden',
        'activate to remove the sort' => 'Aktivieren, um die Sortierung zu entfernen',

        # JS File: var/httpd/htdocs/js/Core.UI.Table.js
        'Remove the filter' => 'Filter entfernen',

        # JS File: var/httpd/htdocs/js/Core.UI.TreeSelection.js
        'There are currently no elements available to select from.' => 'Derzeit sind keine Elemente für die Auswahl vorhanden.',

        # JS File: var/httpd/htdocs/js/Core.UI.js
        'Please only select one file for upload.' => 'Bitte wählen Sie nur eine Datei zum Hochladen aus.',
        'Sorry, you can only upload one file here.' => 'Sie können hier nur eine Datei hochladen.',
        'Sorry, you can only upload %s files.' => 'Sie können nur %s Datei(en) hochladen.',
        'Please only select at most %s files for upload.' => 'Bitte wählen Sie höchstens %s Datei(en) zum Hochladen aus.',
        'The following files are not allowed to be uploaded: %s' => 'Die folgenden Dateien dürfen nicht geändert werden: %s',
        'The following files exceed the maximum allowed size per file of %s and were not uploaded: %s' =>
            'Folgende Dateien überschreiten die Maximalgröße pro Datei (%s) und wurden nicht aktualisiert: %s',
        'The names of the following files exceed the maximum allowed length of %s characters and were not uploaded: %s' =>
            'Die Namen der folgenden Dateien überschreiten die Maximallänge von %s Zeichen und wurden nicht hochgeladen: %s',
        'The following files were already uploaded and have not been uploaded again: %s' =>
            'Folgende Dateien waren bereits hochgeladen und wurden nicht erneut verarbeitet: %s',
        'No space left for the following files: %s' => 'Kein Speicherplatz verfügbar für folgende Dateien: %s',
        'Available space %s of %s.' => 'Verfügbarer Platz %s von %s.',
        'Upload information' => 'Upload-Information',
        'An unknown error occurred when deleting the attachment. Please try again. If the error persists, please contact your system administrator.' =>
            'Beim Löschen des Anhangs ist ein unbekannter Fehler aufgetreten. Bitte versuchen Sie es erneut. Wenn der Fehler weiterhin auftritt, kontaktieren Sie bitte Ihren Systemadministrator.',

        # JS File: var/httpd/htdocs/js/test/Core.Language.UnitTest.js
        'yes' => 'ja',
        'no' => 'nein',
        'This is %s' => 'Dies ist %s',
        'Complex %s with %s arguments' => 'Komplex %s mit %s Argumenten',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js
        'Grouped' => 'Gruppiert',
        'Stacked' => 'Gestapelt',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js
        'Stream' => 'Fließend',
        'Expanded' => 'Ausgedehnt',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Sehr geehrter Kunde,

Leider enthält der von Ihnen verwendete Betreff keine gültige Ticketnummer, so dass diese E-Mail nicht automatisch verarbeitet werden kann.

Bitte erstellen Sie ein neues Ticket im Kundenbereich.

Danke für Ihr Verständnis!

Ihr Helpdesk-Team
',
        ' (work units)' => ' (Arbeitseinheiten)',
        ' 2 minutes' => ' 2 Minuten',
        ' 5 minutes' => ' 5 Minuten',
        ' 7 minutes' => ' 7 Minuten',
        '%s' => '%s',
        '(UserLogin) Firstname Lastname' => '(BenutzerLogin) Vorname Nachname',
        '(UserLogin) Lastname Firstname' => '(UserLogin) Lastname Firstname',
        '(UserLogin) Lastname, Firstname' => '(BenutzerLogin) Nachname, Vorname',
        '0 - Disabled' => '0 - Deaktiviert',
        '1 - Available' => '1 - Verfügbar',
        '1 - Enabled' => '1 - Aktiviert',
        '10 Minutes' => '10 Minuten',
        '100 (Expert)' => '100 (Experte)',
        '15 Minutes' => '15 Minuten',
        '2 - Enabled and required' => '2 - Aktiviert und verpflichtend',
        '2 - Enabled and shown by default' => '2 - Aktiviert und standardmäßig angezeigt',
        '2 - Enabled by default' => '2 - standardmäßig aktiviert',
        '2 Minutes' => '2 Minuten',
        '200 (Advanced)' => '200 (Fortgeschritten)',
        '30 Minutes' => '30 Minuten',
        '300 (Beginner)' => '300 (Anfänger)',
        '5 Minutes' => '5 Minuten',
        'A TicketWatcher Module.' => 'Ein Ticket-Beobachten-Modul.',
        'A Website' => 'Eine Webseite',
        'A picture' => 'Ein Bild',
        'AJAX functions for notification event transport web service.' =>
            'AJAX-Funktionen für Webservice-Transport-Modul der Ticket-Benachrichtigungen.',
        'AJAX interface for the web service dynamic field backends.' => 'AJAX-Schnittstelle für die Webservice-Dynamic-Field-Backends.',
        'AccountedTime' => 'Erfasste Zeit',
        'Activation of dynamic fields for screens.' => 'Aktivierung dynamischer Felder für Masken.',
        'Activity LinkTarget' => '',
        'Activity Notification' => 'Aktivitätsbenachrichtigung',
        'Activity.' => 'Aktivität.',
        'ActivityID' => 'ActivityID',
        'Add a note to this ticket' => 'Eine Notiz zu diesem Ticket hinzufügen',
        'Add an inbound phone call to this ticket' => 'Einen eingehenden Anruf zu diesem Ticket hinzufügen',
        'Add an outbound phone call to this ticket' => 'Einen ausgehenden Telefonanruf zu diesem Ticket hinzufügen',
        'Added %s time unit(s), for a total of %s time unit(s).' => '%s Zeiteinheit(en) hinzugefügt, %s Einheit(en) insgesamt.',
        'Added email. %s' => 'E-Mail hinzugefügt. %s',
        'Added follow-up to ticket [%s]. %s' => 'Follow-Up hinzugefügt zu Ticket [%s]. %s',
        'Added link to ticket "%s".' => 'Verknüpfung zu "%s" hergestellt.',
        'Added note (%s).' => 'Notiz hinzugefügt (%s).',
        'Added phone call from customer.' => 'Anruf des Kunden hinzugefügt.',
        'Added phone call to customer.' => 'Anruf beim Kunden hinzugefügt.',
        'Added subscription for user "%s".' => 'Abo für Benutzer "%s" eingetragen.',
        'Added system request (%s).' => 'Systemanfrage (%s) hinzugefügt.',
        'Added web request from customer.' => 'Anfrage des Kunden über Webinterface hinzugefügt.',
        'Admin' => 'Admin',
        'Admin Area.' => 'Administratorbereich.',
        'Admin Notification' => 'Admin-Benachrichtigung',
        'Admin configuration dialog for dynamic field types WebserviceDropdown and WebserviceMultiselect' =>
            'Admin-Konfigurationsdialog für die dynamischen Feldtypen WebserviceDropdown und WebserviceMultiselect',
        'Admin modules overview.' => 'Admin Modul Übersicht.',
        'Admin.' => 'Admin.',
        'Administration' => 'Administration',
        'Agent Customer Search' => 'Kundensuche Agentenbereich',
        'Agent Customer Search.' => 'Kundensuche Agentenbereich.',
        'Agent Name' => 'Agentenname',
        'Agent Name + FromSeparator + System Address Display Name' => 'Agenten-Name + From-Trennzeichen + Anzeigename der System-Adresse',
        'Agent Preferences.' => 'Agenten-Einstellungen.',
        'Agent Statistics.' => 'Agent Statistiken.',
        'Agent User Search' => 'Nutzersuche Agentenbereich',
        'Agent User Search.' => 'Nutzersuche Agentenbereich.',
        'All CustomerIDs of a customer user.' => 'Alle Kundennummern eines Kundenbenutzers.',
        'All customer users of a CustomerID' => 'Alle Kundenbenutzer einer Kundennummer',
        'All escalated tickets' => 'Alle eskalierten Tickets',
        'All new tickets, these tickets have not been worked on yet' => 'Alle neuen Tickets; an diesen Tickets wurde noch nicht gearbeitet',
        'All open tickets, these tickets have already been worked on.' =>
            'Alle offenen Tickets, an denen bereits gearbeitet wurde.',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Alle Tickets, deren Erinnerungszeit erreicht ist',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Erlaubt erweiterte Suchbedingungen in der Ticket-Suche des Agentenbereichs. Mit dieser Funktion können Sie z.B. Ticket-Titel mit Bedingungen wie "(key1&&key2)" oder "(key1||key2)" suchen.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Erlaubt erweiterte Suchbedingungen in der Ticketsuche im Kundenbereich. Mit dieser Funktion können Sie z.B. Ticket-Titel mit Bedingungen wie "(key1&&key2)" oder "(key1||key2)" suchen.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            'Erlaubt erweiterte Suchbedingungen der generischen Agenten-Schnittstelle. Mit diesem Feature kann man z.B. Ticket-Titel mit Bedingungen wie dieser "(*key1*&&*key2*)" oder "(*key1*||*key2*)" durchsuchen.',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Ermöglicht eine Ticket-Übersicht mit einigen Ticketinformationen (Customer => 1 - zeigt auch die Kundeninformation).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Ermöglicht die Benutzung der kleinenTicketübersicht (CustomerInfo => 1 - zeigt auch die Kundeninformation ).',
        'Always show RichText if available' => 'RichText immer verwenden, wenn verfügbar',
        'An additional screen to add notes to a linked ticket.' => 'Ein zusätzlicher Dialog zum Hinzufügen von Notizen an ein verlinktes Ticket.',
        'Answer' => 'Beantworten',
        'Appointment Calendar overview page.' => 'Terminkalender-Übersichtsseite.',
        'Appointment Notifications' => 'Terminbenachrichtigungen',
        'Appointment edit screen.' => 'Terminbearbeitungsansicht.',
        'Appointment list' => 'Terminliste',
        'Appointment list.' => 'Terminliste.',
        'Appointment notifications' => 'Terminbenachrichtigungen',
        'Arabic (Saudi Arabia)' => 'Arabisch (Saudi-Arabien)',
        'ArticleTree' => 'Artikelbaum',
        'Attachment Name' => 'Name des Anhangs',
        'Avatar' => 'Avatar',
        'Based on global RichText setting' => 'Basierend auf der globalen Richtext-Einstellung',
        'Bounced to "%s".' => 'Bounced an "%s".',
        'Bulgarian' => 'Bulgarisch',
        'Bulk Action' => 'Sammel-Aktion',
        'CSV Separator' => 'Trennzeichen für CSV-Daten',
        'Calendar manage screen.' => 'Kalenderverwaltungsansicht.',
        'Catalan' => 'Katalanisch',
        'Change password' => 'Passwort ändern',
        'Change queue!' => 'Queue ändern!',
        'Change the customer for this ticket' => 'Ticket-Kunden ändern',
        'Change the free fields for this ticket' => 'Freie Felder des Tickets ändern',
        'Change the owner for this ticket' => 'Besitzer dieses Tickets ändern',
        'Change the priority for this ticket' => 'Priorität des Tickets ändern',
        'Change the responsible for this ticket' => 'Verantwortlichen für dieses Tickets ändern',
        'Change your avatar image.' => 'Avatar-Bild ändern.',
        'Change your password and more.' => 'Passwort und Weiteres ändern.',
        'Changed SLA to "%s" (%s).' => 'SLA geändert auf "%s" (%s).',
        'Changed archive state to "%s".' => 'Archivstatus geändert auf "%s".',
        'Changed customer to "%s".' => 'Kunde geändert auf "%s".',
        'Changed dynamic field %s from "%s" to "%s".' => 'Dynamisches Feld %s geändert von "%s" auf "%s".',
        'Changed owner to "%s" (%s).' => 'Besitzer geändert auf "%s" (%s).',
        'Changed pending time to "%s".' => 'Wartezeit geändert auf "%s".',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Priorität aktualisiert von "%s" (%s) nach "%s" (%s).',
        'Changed queue to "%s" (%s) from "%s" (%s).' => 'Queue geändert zu "%s" (%s) von "%s" (%s).',
        'Changed responsible to "%s" (%s).' => 'Verantwortlicher geändert auf "%s" (%s).',
        'Changed service to "%s" (%s).' => 'Service geändert auf "%s" (%s).',
        'Changed state from "%s" to "%s".' => 'Status geändert von "%s" auf "%s".',
        'Changed title from "%s" to "%s".' => 'Titel geändert von "%s" auf "%s".',
        'Changed type from "%s" (%s) to "%s" (%s).' => 'Typ geändert von "%s" (%s) auf "%s" (%s).',
        'Chat communication channel.' => 'Kommunikationskanal Chat.',
        'Checkbox' => 'Kontrollkästchen',
        'Child' => 'Kinder',
        'Chinese (Simplified)' => 'Chinesisch (vereinfacht)',
        'Chinese (Traditional)' => 'Chinesisch (traditionell)',
        'Choose for which kind of appointment changes you want to receive notifications.' =>
            'Wählen Sie, für welche Art von Terminänderungen Sie Benachrichtigungen erhalten möchten.',
        'Choose for which kind of ticket changes you want to receive notifications. Please note that you can\'t completely disable notifications marked as mandatory.' =>
            'Legen Sie fest, bei welchen Ticketänderungen Sie benachrichtigt werden möchten. Bitte beachten Sie, dass Sie Benachrichtigungen, die als verpflichtend markiert sind, nicht vollständig abschalten können.',
        'Choose which notifications you\'d like to receive.' => 'Legen Sie fest, welche Benachrichtigungen Sie erhalten möchten.',
        'Christmas Eve' => 'Heiligabend',
        'Close this ticket' => 'Dieses Ticket schließen',
        'Closed tickets (customer user)' => 'Geschlossene Tickets (Kundenbenutzer)',
        'Closed tickets (customer)' => 'Geschlossene Tickets (Kunden)',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Ticket-Filter-Spalte für Ticketübersichten vom Typ "Klein".',
        'Comment2' => 'Kommentar2',
        'Communication & Notifications' => 'Kommunikation & Benachrichtigungen',
        'Communication Log GUI' => 'Kommunikationsprotokoll Benutzeroberfläche',
        'Communication log limit per page for Communication Log Overview.' =>
            'Limit für Protokolleinträge pro Seite in der Übersicht aller Verbindungsprotokolle.',
        'CommunicationLog Overview Limit' => 'Limit Verbindungsprotokoll-Übersicht',
        'Company Status' => 'Firmenstatus',
        'Company Tickets.' => 'Firmen-Tickets.',
        'Compat module for AgentZoom to AgentTicketZoom.' => 'Übergangsmodul für AgentZoom zu AgentTicketZoom.',
        'Complex' => 'Komplex',
        'Compose' => 'Verfassen',
        'Configure Processes.' => 'Prozesse verwalten.',
        'Configure and manage ACLs.' => 'ACLs konfigurieren und verwalten.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Konfigurieren Sie, welche Oberfläche angezeigt werden soll, nachdem ein neues Ticket erstellt wurde.',
        'Configure which screen should be shown after marking a ticket or article as seen.' =>
            'Konfigurieren Sie, welche Oberfläche angezeigt werden soll, nachdem ein Ticket oder Artikel als gelesen markiert wurde.',
        'Configure which screen should be shown after marking a ticket or article as unseen.' =>
            'Konfigurieren Sie, welche Oberfläche angezeigt werden soll, nachdem ein Ticket oder Artikel als ungelesen markiert wurde.',
        'Create New process ticket.' => 'Neues Prozess-Ticket erstellen.',
        'Create Process Ticket' => 'Neues Prozess-Ticket erstellen',
        'Create Ticket' => 'Ticket erstellen',
        'Create a new calendar appointment linked to this ticket' => 'Erstellt einen neuen Termin in einem Kalender, welcher direkt mit diesem Ticket verknüpft ist',
        'Create a unit test file' => 'Unit-Test-Datei erzeugen',
        'Create and manage Service Level Agreements (SLAs).' => 'Service-Level-Vereinbarungen (SLAs) erstellen und verwalten.',
        'Create and manage agents.' => 'Agenten erstellen und verwalten.',
        'Create and manage appointment notifications.' => 'Terminbenachrichtigungen erstellen und verwalten.',
        'Create and manage attachments.' => 'Anhänge erstellen und verwalten.',
        'Create and manage calendars.' => 'Kalender erstellen und verwalten.',
        'Create and manage customer users.' => 'Kundenbenutzer erstellen und verwalten.',
        'Create and manage customers.' => 'Kunden erstellen und verwalten.',
        'Create and manage dynamic fields.' => 'Dynamische Felder erstellen und verwalten.',
        'Create and manage groups.' => 'Gruppen erstellen und verwalten.',
        'Create and manage queues.' => 'Queues erstellen und verwalten.',
        'Create and manage responses that are automatically sent.' => 'Vorlagen für automatische Antworten erstellen und verwalten.',
        'Create and manage roles.' => 'Rollen erstellen und verwalten.',
        'Create and manage salutations.' => 'Anreden erstellen und verwalten.',
        'Create and manage services.' => 'Services erstellen und verwalten.',
        'Create and manage signatures.' => 'Signaturen erstellen und verwalten.',
        'Create and manage templates.' => 'Vorlagen erstellen und verwalten.',
        'Create and manage ticket notifications.' => 'Ticket-Benachrichtigungen erstellen und verwalten.',
        'Create and manage ticket priorities.' => 'Ticket-Prioritäten erstellen und verwalten.',
        'Create and manage ticket states.' => 'Ticket-Status erstellen und verwalten.',
        'Create and manage ticket types.' => 'Ticket-Typen erstellen und verwalten.',
        'Create and manage web services.' => 'Webservices erstellen und verwalten.',
        'Create new Ticket.' => 'Neues Ticket erstellen.',
        'Create new appointment.' => 'Einen neuen Termin erstellen.',
        'Create new email ticket and send this out (outbound).' => 'Neues E-Mail-Ticket erstellen und versenden (ausgehend).',
        'Create new email ticket.' => 'Neues E-Mail-Ticket erstellen.',
        'Create new phone ticket (inbound).' => 'Neues Telefon-Ticket erstellen (eingehend).',
        'Create new phone ticket.' => 'Neues Telefon-Ticket erstellen.',
        'Create new process ticket.' => 'Neues Prozess-Ticket erstellen.',
        'Create tickets.' => 'Tickets erstellen.',
        'Created ticket [%s] in "%s" with priority "%s" and state "%s".' =>
            'Ticket erstellt [%s] in "%s" mit Priorität "%s" und Status "%s".',
        'Creates a unit test file for this ticket and sends it to Znuny.' =>
            'Erzeugt eine Unit-Test-Datei für dieses Ticket und sendet diese an Znuny.',
        'Creates a unit test file for this ticket.' => 'Erzeugt eine Unit-Test-Datei für dieses Ticket.',
        'Croatian' => 'Kroatisch',
        'Customer Administration' => 'Kundenverwaltung',
        'Customer Companies' => 'Kunden',
        'Customer IDs' => 'Kundennummern',
        'Customer Information Center Search.' => 'Kunden-Informationszentrum-Suche.',
        'Customer Information Center search.' => 'Kunden-Informationszentrum-Suche.',
        'Customer Information Center.' => 'Kunden-Informationszentrum.',
        'Customer Ticket Print Module.' => 'Kunden-Ticketdruck-Modul.',
        'Customer User Administration' => 'Kundenbenutzer-Verwaltung',
        'Customer User Information' => 'Kundenbenutzerinformation',
        'Customer User Information Center Search.' => 'Suche Kundenbenutzer-Informationszentrum.',
        'Customer User Information Center search.' => 'Kundenbenutzer-Informationszentrum-Suche.',
        'Customer User Information Center.' => 'Kundenbenutzer-Informationszentrum.',
        'Customer User-Customer Relations' => 'Beziehungen zwischen Kundenbenutzern und Kunden',
        'Customer preferences.' => 'Kunden-Einstellungen.',
        'Customer ticket overview' => 'Kunden-Ticket-Übersicht',
        'Customer ticket search.' => 'Kunden-Ticketsuche.',
        'Customer ticket zoom' => 'Ticketansicht für Kunden',
        'Customer user search' => 'Kundenbenutzersuche',
        'CustomerID search' => 'Kundennummern-Suche',
        'CustomerName' => 'Kundenname',
        'CustomerUser' => 'Kundenbenutzer',
        'Czech' => 'Tschechisch',
        'Danish' => 'Dänisch',
        'Dark' => '',
        'Dashboard overview.' => 'Dashboardübersicht.',
        'Date / Time' => 'Datum / Zeit',
        'Default agent name' => 'Standard-Agentenname',
        'Default value for NameX' => 'Standardwert für NameX',
        'Define the queue comment 2.' => 'Definiert den 2. Queue-Kommentar.',
        'Define the service comment 2.' => 'Lege den Servicekommentar 2 fest.',
        'Define the sla comment 2.' => 'Lege den SLA-Kommentar 2 fest.',
        'Delete this ticket' => 'Dieses Ticket löschen',
        'Deleted link to ticket "%s".' => 'Verknüpfung zu "%s" gelöscht.',
        'Detached' => 'Losgelöst',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Bestimmt die Zeichenfolgen, die als Empfänger (An:) eines Telefon-Tickets und als Absender (Von:) eines E-Mail-Tickets im Agenten-Interface angezeigt werden. Für Queue als NewQueueSelectionType zeigt "<Queue>" den Namen der Queue und für SystemAddress zeigt "<Realname> <<Email>>" den Namen und E-Mail-Adresse des Empfängers.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Bestimmt die Zeichenfolgen, die als Empfänger (An:) eines Tickets im Kunden-Interface angezeigt werden. Für Queue als CustomerPanelSelectionType zeigt "<Queue>" den Namen der Queues und für SystemAddress zeigt "<Realname> <<Email>>" den Namen und E-Mail-Adresse des Empfängers.',
        'Display communication log entries.' => 'Einträge des Verbindungsprotokolls anzeigen.',
        'Down' => 'Ab',
        'Dropdown' => 'Einfachauswahl',
        'Dutch' => 'Niederländisch',
        'Dynamic Fields Checkbox Backend GUI' => 'Dynamic Fields-Oberfläche für Checkboxen',
        'Dynamic Fields Date Time Backend GUI' => 'Dynamic Fields-Oberfläche für DatumZeit-Felder',
        'Dynamic Fields Drop-down Backend GUI' => 'Dynamic Fields-Oberfläche für Auswahlboxen',
        'Dynamic Fields GUI' => 'Dynamic Fields-Oberfläche',
        'Dynamic Fields Multiselect Backend GUI' => 'Dynamic Fields-Oberfläche für Mehrfachauswahlboxen',
        'Dynamic Fields Overview Limit' => 'Übersichtsbegrenzung der dynamischen Felder',
        'Dynamic Fields Text Backend GUI' => 'Dynamic Fields-Oberfläche für Textfelder',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'Dynamische Feldergruppen für das Prozess-Widget. Der Schlüssel ist der Name der Gruppe, der Wert enthält die Felder, die angezeigt werden sollen. Beispiel: \'Key => Meine Gruppe\', \'Content: NameX, NameY\'.',
        'Dynamic fields limit per page for Dynamic Fields Overview.' => 'Maximale Anzahl dynamischer Felder pro Seite in Übersichtsseite der dynamischen Felder.',
        'DynamicField' => 'DynamicField',
        'DynamicField_%s' => 'DynamicField_%s',
        'E-Mail Outbound' => 'Ausgehende E-Mail',
        'Edit Customer Companies.' => 'Kundenfirmen bearbeiten.',
        'Edit Customer Users.' => 'Kundenbenutzer bearbeiten.',
        'Edit appointment' => 'Termin bearbeiten',
        'Edit customer company' => 'Kundenunternehmen bearbeiten',
        'Email Outbound' => 'Ausgehende E-Mail',
        'Email Resend' => 'E-Mail erneut senden',
        'Email communication channel.' => 'Kommunikationskanal E-Mail.',
        'Enabled filters.' => 'Filter aktiviert.',
        'English (Canada)' => 'Englisch (Kanada)',
        'English (United Kingdom)' => 'Englisch (Vereinigtes Königreich)',
        'English (United States)' => 'Englisch (Vereinigte Staaten)',
        'Enroll process for this ticket' => 'Startet einen Prozess für dieses Ticket',
        'Enter your shared secret to enable two factor authentication. WARNING: Make sure that you add the shared secret to your generator application and the application works well. Otherwise you will be not able to login anymore without the two factor token.' =>
            'Geben Sie Ihr "gemeinsames Geheimnis" ein, um die Zwei-Faktor-Authentifizierung zu aktivieren. WARNUNG: Stellen Sie sicher, dass Sie das "gemeinsames Geheimnis" zu Ihrer Generatoranwendung hinzufügen und die Anwendung gut funktioniert. Andernfalls können Sie sich ohne das Zwei-Faktor-Token nicht mehr anmelden.',
        'Escalated Tickets' => 'Eskalierte Tickets',
        'Escalation view' => 'Ansicht nach Eskalationen',
        'EscalationTime' => 'Eskalationszeit',
        'Estonian' => 'Estnisch',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Eventmodul-Registierung. Für höhere Performancen können Sie ein Trigger-Event definieren (z.B. Event => TicketCreate).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Eventmodul-Registierung. Für höhere Performancen können Sie ein Trigger-Event definieren (z.B. Event => TicketCreate). Dies ist nur möglich, wenn alle dynamischen Ticketfelder das gleiche Event benötigen.',
        'Events Ticket Calendar' => 'Ticket-Ereigniskalender',
        'Execute SQL statements.' => 'SQL-Befehle ausführen.',
        'External' => 'Extern',
        'External Link' => 'Externer Link',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Filter zum Debuggen von ACLs. Hinweis: Weitere Ticket-Attribute können im Format <OTRS_TICKET_Attribute> (z. B. <OTRS_TICKET_Priority>) hinzugefügt werden.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Filter zum Debuggen von Transitions. Hinweis: Weitere Filter können im Format <OTRS_TICKET_Attribute> (z. B. <OTRS_TICKET_Priority>) hinzugefügt werden.',
        'Filter incoming emails.' => 'Eingehende E-Mails filtern.',
        'Finnish' => 'Finnisch',
        'First Christmas Day' => '1. Weihnachtstag',
        'First Queue' => 'Erste Queue',
        'First response time' => 'Zeit für erste Reaktion',
        'FirstLock' => 'Erstsperrzeit',
        'FirstResponse' => 'Erstantwortzeit',
        'FirstResponseDiffInMin' => 'Erstantwortzeitdifferenz in Minuten',
        'FirstResponseInMin' => 'Erstantwortzeit in Minuten',
        'Firstname Lastname' => 'Vorname Nachname',
        'Firstname Lastname (UserLogin)' => 'Vorname Nachname (BenutzerLogin)',
        'Forwarded to "%s".' => 'Weitergeleitet an "%s".',
        'Free Fields' => 'Freie Felder',
        'French' => 'Französisch',
        'French (Canada)' => 'Französisch (Kanada)',
        'Frontend' => 'Oberfläche',
        'Full value' => 'Vollständiger Wert',
        'Fulltext search' => 'Volltextsuche',
        'Galician' => 'Galizisch',
        'Generic Info module.' => 'Generisches Informationsmodul.',
        'GenericAgent' => 'GenericAgent',
        'GenericInterface Debugger GUI' => 'GenericInterface Debugger Benutzeroberfläche',
        'GenericInterface ErrorHandling GUI' => 'GenericInterface Fehlerbehandlungs-Benutzeroberfläche',
        'GenericInterface Invoker Event GUI' => 'GenericInterface Invoker Ereignis Benutzeroberfläche',
        'GenericInterface Invoker GUI' => 'GenericInterface Invoker Benutzeroberfläche',
        'GenericInterface Operation GUI' => 'GenericInterface Operation Benutzeroberfläche',
        'GenericInterface TransportHTTPREST GUI' => 'GenericInterface TransportHTTPREST Benutzeroberfläche',
        'GenericInterface TransportHTTPSOAP GUI' => 'GenericInterface TransportHTTPSOAP Benutzeroberfläche',
        'GenericInterface Web Service GUI' => 'GenericInterface Webservices-Benutzeroberfläche',
        'GenericInterface Web Service History GUI' => 'GenericInterface Webservice Verlauf Benutzeroberfläche',
        'GenericInterface Web Service Mapping GUI' => 'GenericInterface Webservice Mapping Benutzeroberfläche',
        'German' => 'Deutsch',
        'Gives customer users group based access to tickets from customer users of the same customer (ticket CustomerID is a CustomerID of the customer user).' =>
            'Gibt Kundenbenutzern gruppenbasierten Zugriff auf Tickets von Kundenbenutzern desselben Kunden (Kundennummer des Tickets ist eine Kundennummer des Kundenbenutzers).',
        'Global Search Module.' => 'Globales Suchmodul.',
        'Go to dashboard!' => 'Zur Übersicht gehen!',
        'Good PGP signature.' => 'Gute PGP-Signatur.',
        'Google Authenticator' => 'Google Authenticator',
        'Graph: Bar Chart' => 'Diagramm: Balken',
        'Graph: Line Chart' => 'Diagramm: Linien',
        'Graph: Stacked Area Chart' => 'Diagramm: Gestapelte Ebenen',
        'Greek' => 'Griechisch',
        'Hebrew' => 'Hebräisch',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Ungarisch',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if <$OTRSHome>/var/run/ can not be used.' =>
            'Wenn aktiviert, verwendet der Daemon dieses Verzeichnis, um seine PID-Dateien zu erstellen. Hinweis: Bitte stoppen Sie den Daemon vor der Änderung und nutzen Sie diese Einstellung nur, wenn <$OTRSHome>/var/run/ nicht benutzt werden kann.',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Wenn diese Option aktiviert ist, werden die verschiedenen Übersichtsseiten (Dashboard, LockedView, Queue-Ansicht) automatisch nach der angegebenen Zeit aktualisiert.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            'Informiert andere Benutzer über den genauen Zeitraum Ihrer Abwesenheit.',
        'Import appointments screen.' => 'Termin-Import Oberfläche.',
        'Incoming Phone Call.' => 'Eingehender Telefonanruf.',
        'Indonesian' => 'Indonesisch',
        'Inline' => 'Inline',
        'Input' => 'Eingabe',
        'Interface language' => 'Sprache Benutzeroberfläche',
        'Internal' => 'Intern',
        'Internal communication channel.' => 'Interner Kommunikationskanal.',
        'International Workers\' Day' => 'Tag der Arbeit',
        'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.' =>
            'Es war nicht möglich, die PGP-Signatur zu überprüfen, dies kann durch einen fehlenden öffentlichen Schlüssel oder einen nicht unterstützten Algorithmus verursacht werden.',
        'Italian' => 'Italienisch',
        'Japanese' => 'Japanisch',
        'Korean' => 'Koreanisch',
        'Language' => 'Sprache',
        'Large' => 'Groß',
        'Last Mentions' => 'Letzte Erwähnungen',
        'Last Screen Overview' => 'Letzte Masken-Übersicht',
        'Last customer subject' => 'Letzter Kunden-Betreff',
        'Last view - limit' => 'Letzte Ansicht - Limit',
        'Last view - position' => 'Letzte Ansicht - Position',
        'Last view - types' => 'Letzte Ansicht - Typen',
        'Last viewed overview' => 'Zuletzt angesehene Ansicht',
        'Last viewed screen' => 'Zuletzt angesehene Aktion',
        'Lastname Firstname' => 'Nachname Vorname',
        'Lastname Firstname (UserLogin)' => 'Nachname Vorname (BenutzerAnmeldung)',
        'Lastname, Firstname' => 'Nachname, Vorname',
        'Lastname, Firstname (UserLogin)' => 'Nachname, Vorname (BenutzerLogin)',
        'LastnameFirstname' => 'NachnameVorname',
        'Latvian' => 'Lettisch',
        'Link Object' => 'Verknüpfe Objekt',
        'Link Object.' => 'Link-Objekt.',
        'Link agents to groups.' => 'Agenten zu Gruppen zuordnen.',
        'Link agents to roles.' => 'Agenten zu Rollen zuordnen.',
        'Link customer users to customers.' => 'Kundenbenutzer zu Kunden zuordnen.',
        'Link customer users to groups.' => 'Kundenbenutzer zu Gruppen zuordnen.',
        'Link customer users to services.' => 'Kundenbenutzer zu Services zuordnen.',
        'Link customers to groups.' => 'Kunden zu Gruppen zuordnen.',
        'Link queues to auto responses.' => 'Automatische Antworten zu Queues zuordnen.',
        'Link roles to groups.' => 'Rollen zu Gruppen zuordnen.',
        'Link templates to attachments.' => 'Vorlagen mit Anhängen verknüpfen.',
        'Link templates to queues.' => 'Vorlagen zu Queues zuordnen.',
        'Link this ticket to other objects' => 'Dieses Ticket mit anderen Objekten verknüpfen',
        'List view' => 'Listenansicht',
        'Lithuanian' => 'Litauisch',
        'Lock / unlock this ticket' => 'Dieses Ticket sperren / entsperren',
        'Locked Tickets' => 'Gesperrte Tickets',
        'Locked Tickets.' => 'Gesperrte Tickets.',
        'Locked ticket.' => 'Ticket gesperrt.',
        'Logged in users.' => 'Angemeldete Benutzer.',
        'Logged-In Users' => 'Angemeldete Nutzer',
        'Logout of customer panel.' => 'Abmelden vom Kunden-Bereich.',
        'Look into a ticket!' => 'Ticket genauer ansehen!',
        'Loop protection: no auto-response sent to "%s".' => 'Loop-Protection! Keine Auto-Antwort versandt an "%s".',
        'Macedonian' => 'Mazedonisch',
        'Mail Accounts' => 'E-Mailkonten',
        'Malay' => 'Malaysisch',
        'Manage Customer User-Customer Relations.' => 'Beziehungen zwischen Kundenbenutzern und Kunden verwalten.',
        'Manage OAuth2 tokens and their configurations.' => 'Verwalten von OAuth2-Token und deren Konfigurationen.',
        'Manage PGP keys for email encryption.' => 'PGP-Schlüssel für E-Mail-Verschlüsselung verwalten.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'POP3- oder IMAP-Konten für das Abholen von E-Mail verwalten.',
        'Manage S/MIME certificates for email encryption.' => 'S/MIME-Zertifikate für E-Mail-Verschlüsselung verwalten.',
        'Manage System Configuration Deployments.' => 'Inbetriebnahmen von Systemkonfigurationen verwalten.',
        'Manage different calendars.' => 'Verschiedene Kalender verwalten.',
        'Manage existing sessions.' => 'Sitzungen verwalten.',
        'Manage support data.' => 'Supportdaten verwalten.',
        'Manage system files.' => 'Systemdateien verwalten',
        'Manage tasks triggered by event or time based execution.' => 'Verwaltung von event- oder zeitbasierten Aufgaben.',
        'Management of ticket attribute relations.' => 'Verwaltung von abhängigen Ticketattributen.',
        'Mark as Spam!' => 'Als Spam makieren!',
        'Mark this ticket as junk!' => 'Dieses Ticket als Junk markieren!',
        'Mark ticket as seen' => 'Ticket als gelesen markieren',
        'Mark ticket as unseen' => 'Ticket als ungelesen markieren',
        'Mattermost Username' => 'Mattermost-Benutzername',
        'Max. number of articles per page in TicketZoom' => 'Max. Anzahl Artikel pro Seite in der Ticket-Detailansicht',
        'Medium' => 'Mittel',
        'Mentioned in article' => 'In Artikel erwähnt',
        'Mentioned in ticket' => 'In Ticket erwähnt',
        'Mentions.' => 'Erwähnungen.',
        'Merge this ticket and all articles into another ticket' => 'Dieses Ticket und alle Artikel in ein anderes Ticket zusammenfassen',
        'Merged Ticket (%s/%s) to (%s/%s).' => 'Ticket (%s/%s) zusammengeführt mit (%s/%s).',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Ticket <OTRS_TICKET> wurde mit <OTRS_MERGE_TO_TICKET> zusammengefasst.',
        'Minute' => 'Minute',
        'Miscellaneous' => 'Verschiedenes',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Modul zum Filtern und Verändern eingehender Nachrichten. Extrahieren Sie beispielsweise eine vierstellige Zahl aus dem Betreff (SomeNumber:1234) und speichern Sie sie in einem Dynamischen Feld, indem Sie in "Match" einen Schlüssel "Subject" mit dem regulären Ausdruck "SomeNumber:(\d\d\d\d)" und in "Set" einen Schlüssel "X-OTRS-DynamicField-Name" mit dem Wert "[***]" anlegen.',
        'Multiselect' => 'Mehrfachauswahl',
        'My Queues' => 'Meine Queues',
        'My Services' => 'Meine Services',
        'My last changed tickets' => 'Meine zuletzt geänderten Tickets',
        'NameX' => 'NameX',
        'New Tickets' => 'Neue Tickets',
        'New Window' => 'Neues Fenster',
        'New Year\'s Day' => 'Neujahr',
        'New Year\'s Eve' => 'Silvester',
        'New process ticket' => 'Neues Prozess-Ticket',
        'News' => 'News',
        'No public key found.' => 'Kein öffentlicher Schlüssel gefunden.',
        'No valid OpenPGP data found.' => 'Keine gültigen Open PGP-Daten gefunden.',
        'None' => 'Keine',
        'Norwegian' => 'Norwegisch',
        'Notification Settings' => 'Benachrichtigungseinstellungen',
        'Notified about response time escalation.' => 'Über Antwortzeit-Eskalation benachrichtigt.',
        'Notified about solution time escalation.' => 'Über Lösungszeit-Eskalation benachrichtigt.',
        'Notified about update time escalation.' => 'Über Aktualisierungszeit-Eskalation benachrichtigt.',
        'Number of displayed tickets' => 'Anzahl der angezeigten Tickets',
        'OAuth2' => 'OAuth2',
        'OAuth2 token' => 'OAuth2-Token',
        'OTRS' => 'OTRS',
        'Open an external link!' => 'Externen Link öffnen!',
        'Open tickets (customer user)' => 'Offene Tickets (Kundenbenutzer)',
        'Open tickets (customer)' => 'Offene Tickets (Kunde)',
        'Option' => 'Option',
        'Other Customers' => 'Andere Kunden',
        'Out Of Office' => 'Derzeit nicht im Büro',
        'Out Of Office Time' => 'Abwesenheitszeit',
        'Out of Office users.' => 'Abwesende Benutzer.',
        'Overview Escalated Tickets.' => 'Übersicht eskalierter Tickets.',
        'Overview Refresh Time' => 'Aktualisierungszeiten der Übersichten',
        'Overview of all Tickets per assigned Queue.' => 'Übersicht aller Tickets pro zugewiesener Queue.',
        'Overview of all appointments.' => 'Übersicht aller Termine.',
        'Overview of all escalated tickets.' => 'Übersicht aller eskalierter Tickets.',
        'Overview of all open Tickets.' => 'Übersicht über alle offenen Tickets.',
        'Overview of all open tickets.' => 'Übersicht aller offenen Tickets.',
        'Overview of customer tickets.' => 'Übersicht von Kunden-Tickets.',
        'PGP Key' => 'PGP-Schlüssel',
        'PGP Key Management' => 'PGP-Schlüssel-Verwaltung',
        'PGP Keys' => 'PGP-Schlüssel',
        'Parent' => 'Eltern',
        'ParentChild' => 'Eltern-Kind',
        'Pending time' => 'Warten bis',
        'People' => 'Personen',
        'Persian' => 'Persisch',
        'Phone Call Inbound' => 'Eingehender Telefonanruf',
        'Phone Call Outbound' => 'Ausgehender Telefonanruf',
        'Phone Call.' => 'Telefonanruf.',
        'Phone call' => 'Telefonanruf',
        'Phone communication channel.' => 'Telefon-Kommunikationskanal.',
        'Phone-Ticket' => 'Telefon-Ticket',
        'Picture Upload' => 'Bild-Upload',
        'Picture upload module.' => 'Bild-Upload-Modul.',
        'Picture-Upload' => 'Bild-Hochladen',
        'Plugin search' => 'Pluginsuche',
        'Plugin search module for autocomplete.' => 'Module zur Pluginsuche für die Autovervollständigung.',
        'Polish' => 'Polnisch',
        'Portuguese' => 'Portugiesisch',
        'Portuguese (Brasil)' => 'Portugiesisch (Brasilien)',
        'PostMaster Filters' => 'Postmaster-Filter',
        'Print this ticket' => 'Dieses Ticket drucken',
        'Priorities' => 'Prioritäten',
        'Process Management Activity Dialog GUI' => 'Prozess-Management Aktivität-Dialog Benutzeroberfläche',
        'Process Management Activity GUI' => 'Prozess-Management-Aktivitäten Benutzeroberfläche',
        'Process Management Path GUI' => 'Prozess-Management-Pfad Benutzeroberfläche',
        'Process Management Transition Action GUI' => 'Prozess-Management Übergangs-Aktionen Benutzeroberfläche',
        'Process Management Transition GUI' => 'Prozess-Management-Übergangs Benutzeroberfläche',
        'Process Ticket.' => 'Prozess-Ticket.',
        'ProcessID' => 'ProcessID',
        'Processes & Automation' => 'Prozesse & Automatisierung',
        'Provides a matrix overview of the tickets per state per queue' =>
            'Stellt eine Matrix-Übersicht von Tickets pro Status in Queues zur Verfügung',
        'Provides customer users access to tickets even if the tickets are not assigned to a customer user of the same customer ID(s), based on permission groups.' =>
            'Gibt Kundenbenutzern Zugriff auf Tickets, auch wenn diese nicht einem Kundenbenutzer derselben Kundennummer zugewiesen sind, basierend auf Gruppenrechten.',
        'Public Calendar' => 'Öffentlicher Kalender',
        'Public calendar.' => 'Öffentlicher Kalender.',
        'Queue view' => 'Ansicht nach Queues',
        'Refresh interval' => 'Aktualisierungsintervall',
        'Reminder Tickets' => 'Erinnerungs-Tickets',
        'Removed subscription for user "%s".' => 'Abo für Benutzer "%s" ausgetragen.',
        'Reports' => 'Berichte',
        'Resend Ticket Email.' => 'Ticket-E-Mail erneut senden.',
        'Resent email to "%s".' => 'E-Mail erneut senden an "%s".',
        'Responsible Tickets' => 'Verantwortliche Tickets',
        'Responsible Tickets.' => 'Verantwortliche Tickets.',
        'Right' => 'Rechts',
        'Romanian' => 'Rumänisch',
        'Running Process Tickets' => 'Aktive Prozess-Tickets',
        'Russian' => 'Russisch',
        'S/MIME Certificates' => 'S/MIME-Zertifikate',
        'Schedule a maintenance period.' => 'Eine Wartungsperiode planen.',
        'Screen after marking as seen' => 'Ansicht nachdem als gelesen markiert wurde',
        'Screen after marking as unseen' => 'Ansicht nachdem als ungelesen markiert wurde',
        'Screen after new ticket' => 'Ansicht nach Ticket-Erstellung',
        'Search Customer' => 'Kunden suchen',
        'Search Ticket.' => 'Ticket suchen.',
        'Search Tickets.' => 'Tickets suchen.',
        'Search User' => 'Benutzer suchen',
        'Search tickets.' => 'Tickets suchen.',
        'Second Christmas Day' => '2. Weihachtstag',
        'Second Queue' => 'Zweite Queue',
        'Seconds' => 'Sekunden',
        'Select after which period ticket overviews should refresh automatically.' =>
            'Definiert, in welchen Zeitabständen die Ticket-Zusammenfassung automatisch aktualisiert wird.',
        'Select how many last views should be shown.' => 'Wählen Sie aus, wie viele letzte Ansichten angezeigt werden sollen.',
        'Select how many tickets should be shown in overviews by default.' =>
            'Definiert, wieviele Tickets in der Übersicht standardmäßig angezeigt werden.',
        'Select the main interface language.' => 'Wählen Sie die Sprache der Hauptoberfläche.',
        'Select the maximum articles per page shown in TicketZoom. System default value will apply when entered empty value.' =>
            'Wählen Sie die maximale Anzahl angezeigter Artikel pro Seite in der Ticket-Detailansicht. Der Systemstandardwert wird angewendet, wenn ein leerer Wert eingegeben wird.',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Wählen Sie das Trennzeichen, dass in CSV-Dateien (Statistiken und Suchenergebnisse) benutzt werden soll. Wenn Sie hier kein Zeichen wählen, dann wird das Standard-Trennzeichen gemäß der eingestellten Sprache benutzt.',
        'Select where to display the last views.' => 'Wählen Sie aus, wo die letzten Ansichten angezeigt werden sollen.',
        'Select which types should be displayed.' => 'Wählen Sie aus, welche Typen angezeigt werden sollen.',
        'Select your frontend Theme.' => 'Wählen Sie Ihr Anzeigeschema aus.',
        'Select your personal time zone. All times will be displayed relative to this time zone.' =>
            'Wählen Sie Ihre persönliche Zeitzone aus. Alle Zeiten werden relativ zur eingestellten Zeitzone angezeigt.',
        'Select your preferred layout for the software.' => 'Wählen Sie Ihr bevorzugtes Layout aus.',
        'Select your preferred theme for OTRS.' => 'Wählen Sie Ihr bevorzugtes Theme für Znuny.',
        'Send a unit test file' => 'Unit-Test-Datei versenden',
        'Send new outgoing mail from this ticket' => 'Neue ausgehende E-Mail aus diesem Ticket heraus senden',
        'Send notifications to users.' => 'Benachrichtigungen an Agenten verschicken.',
        'Sent "%s" notification to "%s" via "%s".' => 'Benachrichtigung "%s" versandt an "%s" via "%s".',
        'Sent auto follow-up to "%s".' => 'Automatische Rückfrage versandt an "%s".',
        'Sent auto reject to "%s".' => 'Automatische Ablehnung versandt an "%s".',
        'Sent auto reply to "%s".' => 'Automatische Antwort versandt an "%s".',
        'Sent email to "%s".' => 'E-Mail versandt an "%s".',
        'Sent email to customer.' => 'E-Mail an Kunden versandt.',
        'Sent notification to "%s".' => 'Benachrichtigung versandt an "%s".',
        'Serbian Cyrillic' => 'Kyrillisches Serbisch',
        'Serbian Latin' => 'Lateinisches Serbisch',
        'Service view' => 'Ansicht nach Services',
        'ServiceView' => 'DienstAnsicht',
        'Set a new password by filling in your current password and a new one.' =>
            'Setzen Sie ein neues Passwort, indem Sie Ihr derzeitiges und ein neues Passwort eintragen.',
        'Set sender email addresses for this system.' => 'Absendeadressen für dieses System verwalten.',
        'Set this ticket to pending' => 'Ticket auf "warten" setzen',
        'Shared Secret' => 'Gemeinsames Geheimnis',
        'Show the history for this ticket' => 'Zeige die Historie für dieses Ticket an',
        'Show the ticket history' => 'Ticket-Historie anzeigen',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Ermöglicht eine Ticket-Übersicht mit einigen Ticketinformationen (Customer => 1 - zeigt auch die Kundeninformation, CustomerInfoMaxSize steuert die maximale Anzahl an Zeichen der Kundeninformation).',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows last mention of tickets.' => 'Zeigt letzte Erwähnung von Tickets.',
        'Signature data.' => 'Signatur-Daten.',
        'Simple' => 'Einfach',
        'Skin' => 'Skin',
        'Slovak' => 'Slowakisch',
        'Slovenian' => 'Slowenisch',
        'Small' => 'Klein',
        'Snippet' => 'Snippet',
        'Software Package Manager.' => 'Softwarepaketverwaltung.',
        'Solution time' => 'Lösungszeit',
        'SolutionDiffInMin' => 'Lösungszeitdifferenz in Minuten',
        'SolutionInMin' => 'Lösungszeit in Minuten',
        'Some description!' => 'Eine Beschreibung!',
        'Some picture description!' => 'Eine Bildbeschreibung!',
        'Spam' => 'Spam',
        'Spanish' => 'Spanisch',
        'Spanish (Colombia)' => 'Spanisch (Kolumbien)',
        'Spanish (Mexico)' => 'Spanisch (Mexiko)',
        'Started response time escalation.' => 'Antwortzeit-Eskalation gestartet.',
        'Started solution time escalation.' => 'Lösungszeit-Eskalation gestartet.',
        'Started update time escalation.' => 'Aktualisierungszeit-Eskalation gestartet.',
        'Stat#' => 'Stat#',
        'States' => 'Status',
        'Statistics overview.' => 'Statistik-Übersicht.',
        'Status view' => 'Ansicht nach Status',
        'Stopped response time escalation.' => 'Antwortzeit-Eskalation gestoppt.',
        'Stopped solution time escalation.' => 'Lösungszeit-Eskalation gestoppt.',
        'Stopped update time escalation.' => 'Aktualisierungszeit-Eskalation gestoppt.',
        'Support Agent' => 'Support-Agent',
        'Swahili' => 'Swahili',
        'Swedish' => 'Schwedisch',
        'System Address Display Name' => 'System-Adresse Anzeigename',
        'System Configuration Deployment' => 'Inbetriebnahme Systemkonfiguration',
        'System Configuration Group' => 'Systemkonfigurations-Gruppe',
        'System Maintenance' => 'Systemwartung',
        'Textarea' => 'Textfeld',
        'Thai' => 'Thai',
        'The PGP signature is expired.' => 'Die PGP-Signatur ist abgelaufen.',
        'The PGP signature was made by a revoked key, this could mean that the signature is forged.' =>
            'Die PGP-Signatur wurde mit einem widerrufenen Schlüssel erstellt, dies könnte bedeuten, dass die Signatur gefälscht ist.',
        'The PGP signature was made by an expired key.' => 'Die PGP-Signatur wurde mit einem abgelaufenen Schlüssel erstellt.',
        'The PGP signature with the keyid has not been verified successfully.' =>
            'Die PGP-Signatur mit der Schlüssel-ID wurde nicht erfolgreich verifiziert.',
        'The PGP signature with the keyid is good.' => 'Die PGP-Signatur mit der Schlüssel-ID ist gut.',
        'The secret you supplied is invalid. The secret must only contain letters (A-Z, uppercase) and numbers (2-7) and must consist of 16 characters.' =>
            'Das von Ihnen eingegebene Secret ist ungültig. Das Secret darf nur Buchstaben (A-Z, Großbuchstaben) und Zahlen (2-7) enthalten und muss genau 16 Zeichen lang sein.',
        'The value of the From field' => 'Der Wert des Von-Feldes',
        'Theme' => 'Schema',
        'This is a Description for Comment on Framework.' => 'Dies ist die Beschreibung eines Kommentars.',
        'This is a Description for DynamicField on Framework.' => 'Dies ist die Beschreibung eines dynamischen Feldes.',
        'This is the dark skin for the agent interface.' => '',
        'This is the dark skin for the customer interface.' => '',
        'This is the default orange - black skin for the customer interface.' =>
            'Der Standard-Skin (grau) für den Kundenbereich.',
        'This is the default orange - black skin.' => 'Dies ist die Standard orange-schwarze Farbgebung.',
        'This key is not certified with a trusted signature!' => 'Dieser Schlüssel ist nicht mit einer vertrauenswürdigen Signatur zertifiziert!',
        'This module is part of the admin area of OTRS.' => '',
        'Ticket Close.' => 'Ticket schließen.',
        'Ticket Compose Bounce Email.' => 'E-Mail-Erstellung für Ticket-Umleitung.',
        'Ticket Compose email Answer.' => 'E-Mail-Erstellung für Ticket-Antwort.',
        'Ticket Customer.' => 'Ticket-Kunde.',
        'Ticket Forward Email.' => 'Ticket-Weiterleitung.',
        'Ticket FreeText.' => 'Ticket Freitext-Felder.',
        'Ticket History.' => 'Ticket-History.',
        'Ticket Lock.' => 'Ticket-Sperre.',
        'Ticket Merge.' => 'Ticket-Zusammenfassung.',
        'Ticket Move.' => 'Ticket verschieben.',
        'Ticket Note.' => 'Ticket-Notiz.',
        'Ticket Notifications' => 'Ticket-Benachrichtigungen',
        'Ticket Outbound Email.' => 'Ausgehende Ticket-E-Mail.',
        'Ticket Overview "Medium" Limit' => 'Begrenzung für Ticketübersicht "Mittel"',
        'Ticket Overview "Preview" Limit' => 'Begrenzung für Ticketübersicht "Vorschau"',
        'Ticket Overview "Small" Limit' => 'Begrenzung für Ticketübersicht "Klein"',
        'Ticket Owner.' => 'Ticket-Besitzer.',
        'Ticket Pending.' => 'Ticket in Wartestatus versetzen.',
        'Ticket Print.' => 'Ticket drucken.',
        'Ticket Priority.' => 'Ticket-Priorität.',
        'Ticket Queue Overview' => 'Ticket-Übersicht nach Queues',
        'Ticket Responsible.' => 'Ticket-Verantwortlicher.',
        'Ticket Search' => 'Suche',
        'Ticket Watcher' => 'Ticket-Beobachter',
        'Ticket Zoom' => 'Ticket-Zoom',
        'Ticket Zoom.' => 'Ticket-Detailansicht.',
        'Ticket bulk module.' => 'Ticket-Stapelverarbeitung.',
        'Ticket creation' => 'Ticketerstellung',
        'Ticket limit per page for Ticket Overview "Medium".' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Mittel".',
        'Ticket limit per page for Ticket Overview "Preview".' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Vorschau".',
        'Ticket limit per page for Ticket Overview "Small".' => 'Maximale Anzahl Tickets pro Seite für Ticketübersicht "Klein".',
        'Ticket notifications' => 'Ticket-Benachrichtigungen',
        'Ticket overview' => 'Ticket-Übersicht',
        'Ticket plain view of an email.' => 'Nur-Text-Ansicht für Ticket-E-Mails.',
        'Ticket split dialog.' => 'Ticket teilen-Dialog.',
        'Ticket title' => 'Ticket-Titel',
        'Ticket zoom view.' => 'Ticket-Detailansicht.',
        'TicketNumber' => 'Ticketnummer',
        'Tickets.' => 'Tickets.',
        'To accept login information, such as an EULA or license.' => 'Um Login-Informationen zu akzeptieren, wie EULAs oder Lizenzen.',
        'To download attachments.' => 'Zum Herunterladen von Anhängen.',
        'To view HTML attachments.' => 'Zum Betrachten von HTML-Anhängen.',
        'Tree view' => 'Baumansicht',
        'Turkish' => 'Türkisch',
        'Tweak the system as you wish.' => 'Passen Sie das System nach Ihren Wünschen an.',
        'Ukrainian' => 'Ukrainisch',
        'Unlocked ticket.' => 'Ticketsperre aufgehoben.',
        'Up' => 'Auf',
        'Upcoming Events' => 'Anstehende Ereignisse',
        'Update time' => 'Aktualisierungszeit',
        'Upload your PGP key.' => 'Laden Sie Ihren PGP Schlüssel hoch.',
        'Upload your S/MIME certificate.' => 'Laden Sie Ihr S/MIME Zertifikat hoch.',
        'User Profile' => 'Benutzerprofil',
        'UserFirstname' => 'Benutzervorname',
        'UserLastname' => 'Benutzernachname',
        'Users, Groups & Roles' => 'Benutzer, Gruppen & Rollen',
        'Vietnam' => 'Vietnamesisch',
        'View performance benchmark results.' => 'Ergebnisse der Leistungsmessung ansehen.',
        'Watch this ticket' => 'Dieses Ticket beobachten',
        'Watched Tickets' => 'Beobachtete Tickets',
        'Watched Tickets.' => 'Beobachtete Tickets.',
        'We are performing scheduled maintenance.' => 'Wir führen eine geplante Wartung durch.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Wir führen eine geplante Wartung durch. Das Einloggen ist im Moment nicht möglich.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Wir führen eine geplante Wartung durch. Wir werden bald wieder online sein.',
        'Web Services' => 'Webservices',
        'Web service (Dropdown)' => 'Webservice (Einfachauswahl)',
        'Web service (Multiselect)' => 'Webservice (Mehrfachauswahl)',
        'Web service dynamic field AJAX interface' => 'AJAX-Schnittstelle für dynamische Webservice-Felder',
        'Webservice' => 'Webservice',
        'Yes, but hide archived tickets' => 'Ja, aber archivierte Tickets verstecken',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Ihre E-Mail mit Ticket-Nummer "<OTRS_TICKET>" wurde an "<OTRS_BOUNCE_TO>" umgeleitet. Kontaktieren Sie diese Adresse für weitere Informationen.',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Ihre E-Mail mit Ticket-Nummer "<OTRS_TICKET>" wurde zu Ticket-Nummer "<OTRS_MERGE_TO_TICKET>" zusammengefasst.',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'Die Auswahl ihrer bevorzugten (abonnierten) Queues. Sie werden auch per E-Mail über diese Queues benachrichtigt, wenn die Einstellung aktiv ist.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'Auswahl der bevorzugten Services. Es werden E-Mail-Benachrichtigungen über diesen ausgewählten Services versendet, falls aktiviert.',
        'Your username in Mattermost without the leading @' => 'Ihr Benutzername in Mattermost ohne das führende @',
        'Znuny.org - News' => 'Znuny.org - News',
        'Zoom' => 'Inhalt',
        'all tickets' => 'alle Tickets',
        'archived tickets' => 'archivierte Tickets',
        'attachment' => 'attachment',
        'bounce' => 'Umleiten',
        'compose' => 'Verfassen',
        'debug' => 'debug',
        'error' => 'error',
        'forward' => 'Weiterleiten',
        'info' => 'info',
        'inline' => 'inline',
        'normal' => 'normal',
        'not archived tickets' => 'nicht archivierte Tickets',
        'notice' => 'notice',
        'open in current tab' => 'im gleichen Tab öffnen',
        'open in new tab' => 'im neuen Tab öffnen',
        'pending' => 'Warten',
        'phone' => 'Telefonanruf',
        'responsible' => 'Verantwortlicher',
        'reverse' => 'umgekehrt',
        'stats' => 'stats',

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
