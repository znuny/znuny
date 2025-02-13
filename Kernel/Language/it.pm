# --
# Copyright (C) 2003,2008 Remo Catelotti <Remo.Catelotti at eutelia.it>
# Copyright (C) 2003 Gabriele Santilli <gsantilli at omnibus.net>
# Copyright (C) 2005,2009 Giordano Bianchi <giordano.bianchi at gmail.com>
# Copyright (C) 2009 Remo Catelotti <Remo.Catelotti at agilesistemi.com>
# Copyright (C) 2009 Emiliano Coletti <e.coletti at gmail.com>
# Copyright (C) 2009 Alessandro Faraldi <faraldia at gmail.com>
# Copyright (C) 2010 Alessandro Grassi <alessandro.grassi at devise.it>
# Copyright (C) 2012,2013 Massimo Bianchi <mxbianchi at tiscali.it>
# Copyright (C) 2013 Luca Maranzano <liuk@linux.it>
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Translation::JavaScriptStrings)

package Kernel::Language::it;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # $$START$$
    # possible charsets
    $Self->{Charset} = ['utf-8', ];
    # date formats (%A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;)
    $Self->{DateFormat}          = '%D/%M/%Y %T';
    $Self->{DateFormatLong}      = '%A %D %B %Y %T';
    $Self->{DateFormatShort}     = '%D/%M/%Y';
    $Self->{DateInputFormat}     = '%D/%M/%Y';
    $Self->{DateInputFormatLong} = '%D/%M/%Y - %T';
    $Self->{Completeness}        = 0.602437417654809;

    # csv separator
    $Self->{Separator}         = '';

    $Self->{DecimalSeparator}  = ',';
    $Self->{ThousandSeparator} = '.';
    $Self->{Translation} = {

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt
        'Actions' => 'Azioni',
        'Create New ACL' => 'Crea una nuova ACL',
        'Deploy ACLs' => 'Rendi attive le ACL',
        'Export ACLs' => 'Esporta le ACL',
        'Filter for ACLs' => 'Filtro per ACL',
        'Just start typing to filter...' => 'Digita qualche carattere per attivare il filtro...',
        'Configuration Import' => 'Importazione configurazione',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Qui puoi caricare un file di configurazione per importare le ACL. Il file deve essere in formato .yml così come viene esportato dal modulo editor delle ACL.',
        'This field is required.' => 'Questo campo è obbligatorio.',
        'Overwrite existing ACLs?' => 'Sovrascrivere le ACL esistenti?',
        'Upload ACL configuration' => 'Carica una configurazione di ACL',
        'Import ACL configuration(s)' => 'Importa una configurazione di ACL',
        'Description' => 'Descrizione',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Per creare una nuova ACL si può importarne una proveniente da un altro sistema o crearne una nuova del tutto.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'I cambiamenti al processo sono riportati a sistema solo se effettuate la sincronizzazione. Con la sincronizzazione le modifiche sono scritte nella configurazione.',
        'ACL Management' => 'Gestione ACL',
        'ACLs' => 'ACL',
        'Filter' => 'Filtro',
        'Show Valid' => '',
        'Show All' => '',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Nota: questa tabella rappresenta l\'ordine di esecuzione delle ACL. Se è necessario modificare l\'ordine in cui vengono eseguite le ACL, modifica i nomi delle ACL interessate.',
        'ACL name' => 'Nome ACL',
        'Comment' => 'Commento',
        'Validity' => 'Validità',
        'Export' => 'Esporta',
        'Copy' => 'Copia',
        'No data found.' => 'Nessun dato trovato.',
        'No matches found.' => 'Nessun risultato.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLEdit.tt
        'Go to overview' => 'Vai al riepilogo',
        'Delete ACL' => 'Elimina ACL',
        'Delete Invalid ACL' => 'Elimina ACL non valida',
        'Match settings' => 'Criteri di corrispondenza',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Imposta i criteri di corrispondenza per questa ACL. Usare \'Properties\' per corrispondenze con la schermata corrente, oppure \'PropertiesDatabase" per corrispondenze con gli attributi del ticket corrente che sono nel database.',
        'Change settings' => 'Cambia impostazioni',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Imposta cosa cambiare nei criteri di corrispondenza. Considerare che \'Possible\' è una whitelist, \'PossibileNot\' una blacklist.',
        'Check the official %sdocumentation%s.' => 'Controlla la %s documentazione ufficiale %s.',
        'Edit ACL %s' => 'Modifica l\'ACL %s',
        'Edit ACL' => 'Modifica ACL',
        'Show or hide the content' => 'Mostra o nascondi contenuto',
        'Edit ACL Information' => 'Modifica informazioni ACL',
        'Name' => 'Nome',
        'Stop after match' => 'Ferma dopo trovato',
        'Edit ACL Structure' => 'Modifica struttura ACL',
        'Cancel' => 'Annulla',
        'Save' => 'Salva',
        'Save and finish' => 'Salva e termina',
        'Do you really want to delete this ACL?' => 'Sei sicuro di volere eliminare questa ACL?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLNew.tt
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Crea una nuova ACL confermando i dati. Dopo la creazione dell\'ACL, sarà possibile aggiungere voci di configurazione in modalità modifica.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentCalendarManage.tt
        'Calendar Overview' => 'Panoramica calendario',
        'Add new Calendar' => 'Aggiungi nuovo Calendario',
        'Add Calendar' => 'Aggiungi Calendario',
        'Import Appointments' => 'Importa Appuntamenti',
        'Calendar Import' => 'Importazione Calendario',
        'Here you can upload a configuration file to import a calendar to your system. The file needs to be in .yml format as exported by calendar management module.' =>
            'Qui è possibile caricare un file di configurazione per importare un calendario nel sistema. Il file deve essere nel formato YML così come esportato dal modulo di gestione calendari.',
        'Overwrite existing entities' => 'Sovrascrivi le entità esistenti',
        'Upload calendar configuration' => 'Carica configurazione calendario',
        'Import Calendar' => 'Importa Calendario',
        'Filter for Calendars' => 'Filtra per Calendari',
        'Filter for calendars' => 'Filtra per calendari',
        'Depending on the group field, the system will allow users the access to the calendar according to their permission level.' =>
            'Dipende dal gruppo di appartenenza, l\'accesso al calendario sarà regolato secondo i permessi settati sul sistema.',
        'Read only: users can see and export all appointments in the calendar.' =>
            'Solo lettura: gli utenti possono visualizzare e esportare tutti gli appuntamenti nel calendario.',
        'Move into: users can modify appointments in the calendar, but without changing the calendar selection.' =>
            'Muovi in: gli utenti possono modificare gli appuntamenti nel calendario, ma senza cambiare la selezione del calendario.',
        'Create: users can create and delete appointments in the calendar.' =>
            'Creare: gli utenti possono creare e cancellare gli appuntamenti nel calendario.',
        'Read/write: users can manage the calendar itself.' => 'Lettura/scrittura: gli utenti possono gestire autonomamente il calendario.',
        'Calendar Management' => 'Gestione Calendario',
        'Edit Calendar' => 'Modifica Celendario',
        'Group' => 'Gruppo',
        'Changed' => 'Modificato',
        'Created' => 'Creato',
        'Download' => 'Scarica',
        'URL' => 'URL',
        'Export calendar' => 'Esporta calendario',
        'Download calendar' => 'Scarica calendario',
        'Copy public calendar URL' => 'Copia URL pubblico calendario',
        'Calendar' => 'Calendario',
        'Calendar name' => 'Nome Calendario',
        'Calendar with same name already exists.' => 'Esiste già un calendario con lo stesso nome.',
        'Permission group' => 'Permessi di gruppo',
        'Ticket Appointments' => 'Appuntamenti ticket',
        'Rule' => 'Regola',
        'Remove this entry' => 'Rimuovi questa voce',
        'Remove' => 'Rimuovi',
        'Start date' => 'Data di inizio',
        'End date' => 'Data fine',
        'Use options below to narrow down for which tickets appointments will be automatically created.' =>
            'Usare le opzioni sottostanti per limitare gli appuntamenti ticket che verranno creati automaticamente.',
        'Queues' => 'Code',
        'Please select a valid queue.' => 'Si prega di selezionare una coda valida.',
        'Search attributes' => 'Attributi di ricerca',
        'Add entry' => 'Aggiungi entry',
        'Add' => 'Aggiungi',
        'Define rules for creating automatic appointments in this calendar based on ticket data.' =>
            'Definisce le regole per creare in questo calendario appuntamenti automatici basati sui dati dei ticket.',
        'Add Rule' => 'Aggiungi Regola',
        'Submit' => 'Invia',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentImport.tt
        'Go back' => 'Indietro',
        'Uploaded file must be in valid iCal format (.ics).' => 'Il file caricato deve essere in formato iCal (.ics) valido.',
        'If desired Calendar is not listed here, please make sure that you have at least \'create\' permissions.' =>
            'Il calendario desiderato non è elencato, assicurarsi di avere almeno i permessi \'crea\'.',
        'Appointment Import' => 'Caricamento Appuntamento',
        'Upload' => 'Caricamento',
        'Update existing appointments?' => 'Aggiornare appuntamenti esistenti?',
        'All existing appointments in the calendar with same UniqueID will be overwritten.' =>
            'Tutti gli appuntamenti esistenti nel calendario con lo stesso UniqueID saranno sovrascritti.',
        'Upload calendar' => 'Carica calendario',
        'Import appointments' => 'Importa appuntamenti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEvent.tt
        'Add Notification' => 'Aggiungi notifica',
        'Export Notifications' => 'Esportazione notifiche',
        'Filter for Notifications' => 'Filtro per notifiche',
        'Filter for notifications' => 'Filtro per notifiche',
        'Here you can upload a configuration file to import appointment notifications to your system. The file needs to be in .yml format as exported by the appointment notification module.' =>
            'qui puoi caricare un file di configurazione per importare notifiche di appuntamenti nel tuo sistema.Il file deve avere il formato .yml come viene esportato dal modulo di notifiche appuntamenti .',
        'Overwrite existing notifications?' => 'Vuoi sovrascrivere le notifiche esistenti?',
        'Upload Notification configuration' => 'Carica configurazione delle notifiche',
        'Import Notification configuration' => 'Importa configurazione delle notifiche',
        'Appointment Notification Management' => 'Gestione delle notifiche di appuntamento',
        'Edit Notification' => 'Modifica notifica',
        'List' => 'Lista',
        'Delete' => 'Elimina',
        'Delete this notification' => 'Elimina questa notifica',
        'Show in agent preferences' => 'Mostra nelle preferenze degli agenti',
        'Agent preferences tooltip' => 'Suggerimento preferenze agente',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Questo messaggio verrà visualizzato nella schermata delle preferenze dell\'agente come descrizione per questa notifica.',
        'Toggle this widget' => 'Imposta questo widget',
        'Events' => 'Eventi',
        'Event' => 'Evento',
        'Here you can choose which events will trigger this notification. An additional appointment filter can be applied below to only send for appointments with certain criteria.' =>
            'Qui puoi scegliere quali eventi attiveranno questa notifica. Di seguito è possibile applicare un filtro di appuntamenti aggiuntivo per inviare solo appuntamenti con determinati criteri.',
        'Appointment Filter' => 'Filtro appuntamenti',
        'Type' => 'Tipo',
        'Title' => 'Titolo',
        'Location' => 'Sede',
        'Team' => 'Squadra',
        'Resource' => 'Seguenti appuntamenti sono iniziati',
        'Recipients' => 'Destinatari',
        'Send to' => 'Invia a',
        'Send to these agents' => 'Invia a questi agenti',
        'Send to all group members (agents only)' => 'Invia a tutti i membri del gruppo (solo agenti)',
        'Send to all role members' => 'Invia a tutti i membri del ruolo',
        'Also send if the user is currently out of office.' => 'Invia anche se l\'utente è attualmente fuori sede.',
        'Send on out of office' => 'Invia se fuori sede',
        'Notify user just once per day about a single appointment using a selected transport.' =>
            'Avvisare l\'utente solo una volta al giorno di un singolo appuntamento utilizzando un trasporto selezionato.',
        'Once per day' => 'Una volta al giorno',
        'Notification Methods' => 'Metodi di notifica',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Questi sono i possibili metodi che possono essere utilizzati per inviare questa notifica a ciascuno dei destinatari. Seleziona almeno un metodo di seguito.',
        'Enable this notification method' => 'Abilita questo metodo di notifica',
        'Transport' => 'Trasporto',
        'At least one method is needed per notification.' => 'È necessario almeno un metodo per ogni notifica.',
        'Active by default in agent preferences' => 'Attivo di default nelle preferenze dell\'agente',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Questo è il valore predefinito per gli agenti destinatario assegnati che non hanno ancora scelto questa notifica nelle loro preferenze. Se la casella è abilitata, la notifica verrà inviata a tali agenti.',
        'This feature is currently not available.' => 'Questa funzionalità non è attualmente disponibile.',
        'No data found' => 'Nessun dato trovato',
        'No notification method found.' => 'Nessun metodo di notifica trovato.',
        'Notification Text' => 'Testo della notifica',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Questa lingua non è presente o abilitata sul sistema. Questo testo di notifica può essere eliminato se non più necessario.',
        'Remove Notification Language' => 'Rimuovi lingua delle notifiche',
        'Subject' => 'Oggetto',
        'Text' => 'Testo',
        'Message body' => 'Corpo del messaggio',
        'Add new notification language' => 'Aggiungi nuova lingua delle notifiche',
        'Save Changes' => 'Salva cambiamenti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEventTransportEmailSettings.tt
        'Additional recipient email addresses' => 'Indirizzi email di destinazione aggiuntivi',
        'This field must have less then 200 characters.' => 'Questo campo deve avere meno di 200 caratteri.',
        'Article visible for customer' => 'Articolo visibile al cliente',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Verrà creato un articolo se la notifica viene inviata al cliente o un indirizzo e-mail aggiuntivo.',
        'Email template' => 'Modello di email',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Utilizza questo modello per generare l\'email completa (solo per email HTML).',
        'Enable email security' => 'Abilitare la sicurezza via email',
        'Email security level' => 'Livello di sicurezza email',
        'If signing key/certificate is missing' => 'Nel caso in cui il certificato di firma sia mancante',
        'If encryption key/certificate is missing' => 'Nel caso in cui la chiave di criptaggio sia mancante',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAttachment.tt
        'Add Attachment' => 'Aggiungi allegato',
        'Filter for Attachments' => 'Filtro per gli allegati',
        'Filter for attachments' => 'Filtro per allegati',
        'Related Actions' => '',
        'Templates' => 'Modelli',
        'Templates ↔ Attachments' => '',
        'Attachment Management' => 'Gestione allegati',
        'Edit Attachment' => 'Modifica allegato',
        'Filename' => 'Nome file',
        'Download file' => 'Scarica file',
        'Delete this attachment' => 'Elimina questo allegato',
        'Do you really want to delete this attachment?' => 'Vuoi veramente cancellare questo allegato?',
        'Attachment' => 'Allegato',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAutoResponse.tt
        'Add Auto Response' => 'Aggiungi risposta automatica',
        'Filter for Auto Responses' => 'Filtri per le risposte automatiche',
        'Filter for auto responses' => 'Filtri per le risposte automatiche',
        'Queues ↔ Auto Responses' => '',
        'Auto Response Management' => 'Gestione risposte automatiche',
        'Edit Auto Response' => 'Modifica risposta automatica',
        'Response' => 'Risposta',
        'Auto response from' => 'Risposta automatica da',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLog.tt
        'Time Range' => 'Intervallo di tempo',
        'Show only communication logs created in specific time range.' =>
            'Mostrare solo i registri di comunicazione creati in un intervallo di tempo specifico.',
        'Filter for Communications' => 'Filtra per Comunicazioni',
        'Filter for communications' => 'Filtro per le comunicazioni',
        'Hint' => 'Suggerimento',
        'In this screen you can see an overview about incoming and outgoing communications.' =>
            'In questa schermata è possibile visualizzare una panoramica delle comunicazioni in entrata e in uscita.',
        'You can change the sort and order of the columns by clicking on the column header.' =>
            'È possibile modificare l\'ordinamento e l\'ordine delle colonne facendo clic sull\'intestazione della colonna.',
        'If you click on the different entries, you will get redirected to a detailed screen about the message.' =>
            'Se fai clic sulle diverse voci, verrai reindirizzato a una schermata dettagliata sul messaggio.',
        'Communication Log' => 'Log di comunicazione',
        'Status for: %s' => 'Stato per: %s',
        'Failing accounts' => 'Account con errori',
        'Some account problems' => 'Qualche problema con gli account.',
        'No account problems' => 'Nessun problema con gli account.',
        'No account activity' => 'Nessuna attività degli account.',
        'Number of accounts with problems: %s' => 'Numero di account con problemi: %s',
        'Number of accounts with warnings: %s' => 'Numero di account con avvisi: %s',
        'Failing communications' => 'Comunicazioni fallite',
        'No communication problems' => 'Nessun problema di comunicazione',
        'No communication logs' => 'Nessun log delle comunicazioni',
        'Number of reported problems: %s' => 'Numero di problemi segnalati: %s',
        'Open communications' => 'Comunicazioni aperte',
        'No active communications' => 'Nessuna comunicazione attiva',
        'Number of open communications: %s' => 'Numero di comunicazioni aperte: %s',
        'Average processing time' => 'Tempo medio di elaborazione',
        'List of communications (%s)' => 'Elenco delle comunicazioni (%s)',
        'Settings' => 'Impostazioni',
        'Entries per page' => 'Voci per pagina',
        'No communications found.' => 'Nessuna comunicazione trovata.',
        '%s s' => '%s s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogAccounts.tt
        'Back to overview' => 'Torna alla Panoramica',
        'Filter for Accounts' => 'Filtra per Account',
        'Filter for accounts' => 'Filtro per gli account',
        'You can change the sort and order of those columns by clicking on the column header.' =>
            'È possibile modificare l\'ordinamento e l\'ordine di tali colonne facendo clic sull\'intestazione della colonna.',
        'Account Status' => 'Stato account',
        'Account status for: %s' => 'Stato account per: %s',
        'Status' => 'Stato',
        'Account' => 'Account',
        'Edit' => 'Modifica',
        'No accounts found.' => 'Nessun account trovato.',
        'Communication Log Details (%s)' => 'Dettagli del log di comunicazione (%s)',
        'Direction' => 'Direzione',
        'Start Time' => 'Istante di Inizio',
        'End Time' => 'Orario di termine',
        'No communication log entries found.' => 'Nessuna voce del registro di comunicazione trovata.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogCommunications.tt
        'Duration' => 'Durata',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogObjectLog.tt
        '#' => '#',
        'Priority' => 'Priorità',
        'Module' => 'Modulo',
        'Information' => 'Informazione',
        'No log entries found.' => 'Nessuna voce di registro trovata.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogZoom.tt
        'Filter for Log Entries' => 'Filtro per voci di registro',
        'Filter for log entries' => 'Filtro per il log',
        'Show only entries with specific priority and higher:' => 'Mostrare solo le voci con priorità specifica e superiore:',
        'Detail view for %s communication started at %s' => 'Vista dettagliata per %s la comunicazione iniziata alle %s',
        'Communication Log Overview (%s)' => 'Panoramica del registro di comunicazione (%s)',
        'No communication objects found.' => 'Nessun oggetto di comunicazione trovato.',
        'Communication Log Details' => 'Dettagli del log di comunicazione',
        'Please select an entry from the list.' => 'Seleziona una voce dall\'elenco.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerCompany.tt
        'Search' => 'Cerca',
        'Wildcards like \'*\' are allowed.' => 'Sono permessi i caratteri jolly come \'*\'.',
        'Add Customer' => 'Aggiungi cliente',
        'Select' => 'Seleziona',
        'Customer Users' => 'Utenze clienti',
        'Customers ↔ Groups' => '',
        'Customer Management' => 'Gestione clienti',
        'Edit Customer' => 'Modifica cliente',
        'List (only %s shown - more available)' => 'Elenco (%s visualizzati - altri disponibili)',
        'total' => 'totale',
        'Please enter a search term to look for customers.' => 'Inserire una chiave di ricerca per i clienti.',
        'Customer ID' => 'ID Cliente',
        'Please note' => 'Nota',
        'This customer backend is read only!' => 'Questo backend del cliente è di sola lettura!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerGroup.tt
        'Notice' => 'Notifica',
        'This feature is disabled!' => 'Questa funzione è disabilitata!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Usa questa funzione solo se vuoi definire permessi di gruppo per i clienti.',
        'Enable it here!' => 'Abilita funzione qui!',
        'Edit Customer Default Groups' => 'Modifica gruppi predefiniti degli utenti',
        'These groups are automatically assigned to all customers.' => 'Questi gruppi saranno assegnati automaticamente a tutti gli utenti.',
        'You can manage these groups via the configuration setting "CustomerGroupCompanyAlwaysGroups".' =>
            'È possibile gestire questi gruppi tramite l\'impostazione di configurazione "CustomerGroupCompanyAlwaysGroups".',
        'Filter for Groups' => 'Filtri per gruppi',
        'Select the customer:group permissions.' => 'Seleziona i permessi cliente:gruppo.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Se non si effettua una selezione, non ci saranno permessi in questo gruppo (i ticket non saranno disponibili al cliente).',
        'Customers' => 'Clienti',
        'Groups' => 'Gruppi',
        'Manage Customer-Group Relations' => 'Gestisci relazioni Cliente-Gruppo',
        'Search Results' => 'Risultato della ricerca',
        'Change Group Relations for Customer' => 'Cambia relazioni di gruppo per il cliente',
        'Change Customer Relations for Group' => 'Cambia relazioni dei clienti per il gruppo',
        'Toggle %s Permission for all' => 'Imposta permesso %s per tutti',
        'Toggle %s permission for %s' => 'Imposta permesso %s per %s',
        'Customer Default Groups:' => 'Gruppi predefiniti cliente:',
        'No changes can be made to these groups.' => 'Nessun cambiamento verrà effettuato a questi gruppi.',
        'Reference' => 'Riferimento',
        'ro' => 'sola lettura',
        'Read only access to the ticket in this group/queue.' => 'Accesso in sola lettura ai ticket in questo gruppo/coda.',
        'rw' => 'lettura e scrittura',
        'Full read and write access to the tickets in this group/queue.' =>
            'Accesso completo in lettura e scrittura ai ticket in questo gruppo/coda.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUser.tt
        'Back to search results' => 'Torna ai risultati della ricerca',
        'Add Customer User' => 'Aggiungi utenza cliente',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Le utenze cliente sono necessarie per avere una cronologia del cliente e per effettuare l\'accesso dal pannello clienti.',
        'Customer Users ↔ Customers' => 'Utenze clienti ↔ Clienti',
        'Customer Users ↔ Groups' => 'Utenze clienti ↔ Gruppi',
        'Customer Users ↔ Services' => 'Utenze clienti ↔ Servizi',
        'Customer User Management' => 'Gestione utenze cliente',
        'Edit Customer User' => 'Modifica utenza cliente',
        'List (%s total)' => 'Elenco (% totale)',
        'Username' => 'Nome utente',
        'Email' => 'Email',
        'Last Login' => 'Ultimo accesso',
        'Login as' => 'Accedi come',
        'Switch to customer' => 'Impersona il cliente',
        'This customer backend is read only, but the customer user preferences can be changed!' =>
            'Questo backend clienti è in sola lettura, ma è possibile cambiare le preferenze dell’utenza cliente!',
        'This field is required and needs to be a valid email address.' =>
            'Questo campo è obbligatorio e deve contenere un indirizzo email valido.',
        'This email address is not allowed due to the system configuration.' =>
            'Questo indirizzo email non è consentito dalla configurazione di sistema.',
        'This email address failed MX check.' => 'Questo indirizzo email non ha superato il controllo MX.',
        'DNS problem, please check your configuration and the error log.' =>
            'Problema con il DNS, verifica la tua configurazione e il log degli errori.',
        'The syntax of this email address is incorrect.' => 'La sintassi di questa email è errata.',
        'This CustomerID is invalid.' => 'Questo CustomerID è invalido',
        'Effective Permissions for Customer User' => 'Permessi effettivi per utenza cliente',
        'Group Permissions' => 'Permessi di gruppo',
        'This customer user has no group permissions.' => 'Questa utenza cliente non ha permessi di gruppo.',
        'Table above shows effective group permissions for the customer user. The matrix takes into account all inherited permissions (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'La tabella sopra mostra le autorizzazioni di gruppo di permessi per l\'utenza cliente. La matrice tiene conto di tutti i permessi ereditato (ad es. tramite gruppi di cliente). Nota: la tabella non considera le modifiche apportate a questo modulo senza inviarlo.',
        'Customer Access' => 'Accesso cliente',
        'Customer' => 'Cliente',
        'This customer user has no customer access.' => 'Questo utenza cliente non ha accesso al cliente.',
        'Table above shows granted customer access for the customer user by permission context. The matrix takes into account all inherited access (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            'La tabella sopra mostra l\'accesso al cliente concesso all\'utenza cliente in base al contesto dell\'autorizzazione. La matrice tiene conto di tutti gli accessi ereditati (ad es. Gruppi cliente). Nota: la tabella non considera le modifiche apportate a questo modulo senza inviarlo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserCustomer.tt
        'Select the customer user:customer relations.' => 'Seleziona le relazioni utenza cliente:cliente',
        'Manage Customer User-Customer Relations' => 'Gestione associazioni utenze cliente ↔ cliente',
        'Change Customer Relations for Customer User' => 'Modifica le relazioni con il cliente per l\'utenza cliente',
        'Change Customer User Relations for Customer' => 'Modifica le relazioni utenza cliente per cliente',
        'Toggle active state for all' => 'Imposta stato attivo per tutti',
        'Active' => 'Attivo',
        'Toggle active state for %s' => 'Imposta stato attivo per %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserGroup.tt
        'Just use this feature if you want to define group permissions for customer users.' =>
            'Usa questa funzione solo se vuoi definire le permessi di gruppo per gli utenti dei cliente.',
        'Edit Customer User Default Groups' => 'Modifica gruppi predefiniti utenza cliente',
        'These groups are automatically assigned to all customer users.' =>
            'Questi gruppi vengono automaticamente assegnati a tutti gli utenti dei cliente.',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'È possibile gestire questi gruppi tramite l\'impostazione di configurazione "CustomerGroupAlwaysGroups".',
        'Filter for groups' => 'Filtri per gruppi',
        'Select the customer user - group permissions.' => 'Seleziona l\'utenza cliente - permessi di gruppo.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer user).' =>
            'Se non viene selezionato nulla, non ci sono permessi in questo gruppo (i ticket non saranno disponibili per l\'utenza cliente).',
        'Manage Customer User-Group Relations' => 'Gestire le relazioni utenza cliente-gruppo',
        'Customer User Default Groups:' => 'Gruppi predefiniti utenza cliente:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserService.tt
        'Edit default services' => 'Modifica servizi di default',
        'Filter for Services' => 'Filtri per i servizi',
        'Filter for services' => 'Filtri per i servizi',
        'Services' => 'Servizi',
        'Service Level Agreements' => 'Accordi sul livello di servizio',
        'Manage Customer User-Service Relations' => 'Gestire le utenza cliente con il servizio clienti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicField.tt
        'Add new field for object' => 'Aggiungi un nuovo campo per l\'oggetto',
        'Filter for Dynamic Fields' => 'Filtri per Campi dinamici',
        'Filter for dynamic fields' => 'Filtri per Campi dinamici',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Per aggiungere un nuovo campo, selezionare il tipo di campo da uno degli elenchi dell\'oggetto, l\'oggetto definisce il limite del campo e non può essere modificato dopo la creazione del campo.',
        'Import and export of configurations' => '',
        'Upload a file in YAML format (as provided by the export) to import dynamic field configurations.' =>
            '',
        'Overwrite existing configurations' => '',
        'Import configurations' => '',
        'Export configurations' => '',
        'Process Management' => 'Gestione dei processi',
        'Dynamic fields ↔ Screens' => '',
        'Dynamic Fields Management' => 'Gestione campi dinamici',
        'Dynamic Fields List' => 'Elenco campi dinamici',
        'Dynamic fields per page' => 'Campi dinamici per pagina',
        'Label' => 'Etichetta',
        'Order' => 'Ordine',
        'Object' => 'Oggetto',
        'Delete this field' => 'Elimina questo campo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldCheckbox.tt
        'Go back to overview' => 'Torna alla vista globale',
        'Dynamic Fields' => 'Campi dinamici',
        'General' => 'Generale',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Campo obbligatorio. Il valore può contenere solo lettere e numeri.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Deve essere univoco e contenere solo lettere e numeri.',
        'Changing this value will require manual changes in the system.' =>
            'La modifica di questo valore richiede modifiche manuali al sistema.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Questo è il nome mostrato sulle pagine quando il campo è attivo.',
        'Field order' => 'Ordine del campo',
        'This field is required and must be numeric.' => 'Campo obbligatorio. Può contenere solo numeri.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Questo è l\'ordine con cui il campo sarà mostrato sulle pagine quando è attivo.',
        'Is not possible to invalidate this entry, all config settings have to be changed beforehand.' =>
            'Non è possibile invalidare questa voce, tutte le impostazioni di configurazione devono essere modificate in anticipo.',
        'Field type' => 'Tipo di campo',
        'Object type' => 'Tipo di oggetto',
        'Internal field' => 'Campo interno',
        'This field is protected and can\'t be deleted.' => 'Questo campo è protetto e non può essere eliminato.',
        'This dynamic field is used in the following config settings:' =>
            'Questo campo dinamico viene utilizzato nelle seguenti impostazioni di configurazione:',
        'Field Settings' => 'Impostazioni del campo',
        'Default value' => 'Valore predefinito',
        'This is the default value for this field.' => 'Questo è il valore predefinito per il campo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldConfigurationImportExport.tt
        'Select the dynamic fields you want to import and click on \'Import\'.' =>
            '',
        'Select the dynamic fields whose configuration you want to export and click on \'Export\' to generate a YAML file.' =>
            '',
        'Dynamic field configurations: %s' => '',
        'Dynamic fields' => 'Campi dinamici',
        'For the following dynamic fields a configuration cannot be imported because of an invalid backend.' =>
            '',
        'Select all field configurations' => '',
        'Select all screen configurations' => '',
        'The uploaded file does not contain configuration(s), is not a YAML file, is damaged or has the wrong structure.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDateTime.tt
        'Default date difference' => 'Differenza predefinita tra le date',
        'This field must be numeric.' => 'Questo campo deve essere numerico.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Differenza rispetto al momento attuale in secondi, per calcolare il valore predefinito del campo (ad es. 3600 o -60).',
        'Define years period' => 'Periodo in anni',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Attiva questa funzionalità per definire un intervallo fisso di anni, nel futuro e nel passato, mostrato nella parte anno del campo.',
        'Years in the past' => 'Anni nel passato',
        'Years in the past to display (default: 5 years).' => 'Anni nel passato da mostrare (predefinito: 5 anni).',
        'Years in the future' => 'Anni nel futuro',
        'Years in the future to display (default: 5 years).' => 'Anni nel futuro da mostrare (predefinito: 5 anni).',
        'Show link' => 'Mostra collegamento',
        'Reserved keywords. The following placeholders are not allowed:' =>
            '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Qui puoi specificare un collegamento http per il campo nelle schermate vista globale e zoom.',
        'If special characters (&, @, :, /, etc.) should not be encoded, use \'url\' instead of \'uri\' filter.' =>
            'Se i caratteri speciali (&, @,:, /, ecc.) non devono essere codificati, utilizzare \'url\' invece del filtro \'uri\'.',
        'Example' => 'Esempio',
        'Link for preview' => 'Link per l\'anteprima',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Se compilato, questo URL verrà utilizzato per un\'anteprima che viene mostrata quando questo link viene spostato nello zoom del ticket. Per far funzionare tutto questo, è necessario compilare anche il normale campo URL sopra.',
        'Restrict entering of dates' => 'Limita la digitazione di date',
        'Here you can restrict the entering of dates of tickets.' => 'Qui puoi limitare la digitazione delle date dei ticket.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDropdown.tt
        'Possible values' => 'Valori ammessi',
        'Key' => 'Chiave',
        'Value' => 'Valore',
        'Remove value' => 'Rimuovi valore',
        'Add value' => 'Aggiungi valore',
        'Add Value' => 'Aggiungi valore',
        'Add empty value' => 'Aggiungi valore vuoto',
        'Activate this option to create an empty selectable value.' => 'Attiva questa opzione per creare un valore nullo selezionabile.',
        'Tree View' => 'Visualizzazione ad albero',
        'Activate this option to display values as a tree.' => 'Attiva questa opzione per visualizzare i valori come un albero.',
        'Translatable values' => 'Valore da tradurre',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Se attivate questa opzione i valori saranno tradotti nella lingua dell\'utente.',
        'Note' => 'Nota',
        'You need to add the translations manually into the language translation files.' =>
            'È necessario aggiungere le traduzioni manualmente nei file di traduzione.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldScreenConfiguration.tt
        'Assignment of dynamic fields to screens' => '',
        'Overview' => 'Vista Globale',
        'Screens' => '',
        'Overview Default Columns' => '',
        'Add dynamic field' => 'Aggiungi campo dinamico',
        'You can assign elements by dragging and dropping them to the lists of available, disabled, assigned and required elements.' =>
            '',
        'Filter available elements' => '',
        'Assign selected elements to this list' => '',
        'Select all' => 'Seleziona tutto',
        'Filter disabled elements' => '',
        'Filter assigned elements' => '',
        'Filter required elements' => '',
        'Reset' => 'Ripristina',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldText.tt
        'Number of rows' => 'Numero di righe',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Specifica l\'altezza (in righe) per questo campo in modalità di modifica.',
        'Number of cols' => 'Numero di colonne',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Specifica la larghezza (in caratteri) per questo campo in modalità di modifica.',
        'Check RegEx' => 'Espressione regolare di controllo',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Qui puoi specificare un\'espressione regolare per verificare il valore. Il regex verrà eseguito con i modificatori xms.',
        'RegEx' => 'Espressione regolare',
        'Invalid RegEx' => 'Espressione regolare non valida',
        'Error Message' => 'Messaggio di errore',
        'Add RegEx' => 'Aggiungi espressione regolare',

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
        'Web service' => 'Servizio web',
        'Web service which will be used for this dynamic field.' => '',
        'Invoker to search for records' => '',
        'Invoker which will be used for this dynamic field. Searches for the search term(s) and returns an array as result. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Invoker to get a record' => '',
        'Invoker which will be used for this dynamic field. Returns a hash of the record that will be found when searching for its identifier in the field configured in \'key for stored value\' below. Note: The invoker needs to be enabled in the web service you specified above.' =>
            '',
        'Backend' => 'Backend',
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
        'Limit' => 'Limite',
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
            'Con questo modulo, gli amministratori possono inviare messaggi ad agenti e ai membri di gruppi o ruoli.',
        'Admin Message' => 'Messaggio dell\'amministratore',
        'Create Administrative Message' => 'Creazione messaggio amministrativo',
        'Your message was sent to' => 'Il messaggio è stato inviato a',
        'From' => 'Da',
        'Send message to users' => 'Invia messaggio agli utenti',
        'Send message to group members' => 'Invia messaggio ai membri del gruppo',
        'Group members need to have permission' => 'I membri del gruppo necessitano del permesso',
        'Send message to role members' => 'Invia messaggio ai membri del ruolo',
        'Also send to customers in groups' => 'Invia anche ai clienti nei gruppi',
        'Body' => 'Testo',
        'Send' => 'Invia',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericAgent.tt
        'Add Job' => 'Aggiungere lavoro',
        'Filter for Jobs' => 'Filtro per lavori',
        'Filter for jobs' => 'Filtro per lavori',
        'Generic Agent Job Management' => 'Gestione dei lavori dell\'agente generico',
        'Edit Job' => 'Modifica lavoro',
        'Run Job' => 'Esegui lavoro',
        'Last run' => 'Ultima esecuzione',
        'Run' => 'Esegui',
        'Delete this task' => 'Elimina questo task',
        'Run this task' => 'Esegui questo task',
        'Do you really want to delete this generic agent job?' => '',
        'Job Settings' => 'Impostazioni job',
        'Job name' => 'Nome job',
        'The name you entered already exists.' => 'Il nome immesso è già esistente.',
        'Automatic Execution (Multiple Tickets)' => 'Esecuzione automatica (più ticket)',
        'Execution Schedule' => 'Pianificazione esecuzione',
        'Schedule minutes' => 'Minuti della pianificazione',
        'Schedule hours' => 'Ore della pianificazione',
        'Schedule days' => 'Giorni della pianificazione',
        'Automatic execution values are in the system timezone.' => 'I valori di esecuzione automatica si trovano nel fuso orario del sistema.',
        'Currently this generic agent job will not run automatically.' =>
            'Al momento questo job agente generico non viene eseguito automaticamente.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Per abilitare l\'esecuzione automatica, seleziona almeno un valore per i minuti, ore e giorni!',
        'Event Based Execution (Single Ticket)' => 'Esecuzione basata su eventi (ticket singolo)',
        'Event Triggers' => 'Trigger di eventi',
        'List of all configured events' => 'Elenco di tutti gli eventi configurati',
        'Delete this event' => 'Elimina questo evento',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Questo job può essere lanciato sulla base di eventi legati al ticket, in aggiunta o in alternativa all\'esecuzione periodica.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Se viene generato un evento ticket, verrà applicato il filtro ticket per verificare se il ticket corrisponde. Solo allora il lavoro viene eseguito su quel ticket.',
        'Add Event Trigger' => 'Aggiungi trigger di eventi',
        'To add a new event select the event object and event name' => 'Per aggiungere un nuovo evento selezionare l\'oggetto evento e il nome dell\'evento',
        'Do you really want to delete this event trigger?' => 'Vuoi davvero eliminare questo trigger?',
        'Select Tickets' => 'Seleziona ticket',
        '(e. g. 10*5155 or 105658*)' => '(per esempio \'10*5155\' o \'105658*\')',
        '(e. g. 234321)' => '(per esempio \'234321\')',
        'Customer user ID' => 'ID utenza cliente',
        '(e. g. U5150)' => '(per esempio \'U5150\')',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Ricerca a testo nell\'articolo (ad es. "Mar*in" o "Baue*").',
        'To' => 'A',
        'Cc' => 'Cc',
        'Service' => 'Servizio',
        'Service Level Agreement' => 'Accordo sul livello di servizio',
        'Queue' => 'Coda',
        'State' => 'Stato',
        'Agent' => 'Agente',
        'Owner' => 'Proprietario',
        'Responsible' => 'Responsabile',
        'Ticket lock' => 'Blocco ticket',
        'Create times' => 'Tempi di creazione',
        'No create time settings.' => 'Data di creazione mancante.',
        'Ticket created' => 'Ticket creato',
        'Ticket created between' => 'Ticket creato tra',
        'and' => 'e',
        'Last changed times' => 'Ultimo evento di modifica',
        'No last changed time settings.' => 'Nessuna ultima modifica dell\'ora.',
        'Ticket last changed' => 'Ultima modifica apportata al ticket',
        'Ticket last changed between' => 'Ultima modifica apportata al ticket fra',
        'Change times' => 'Modifica orari',
        'No change time settings.' => 'Nessuna modifica tempo.',
        'Ticket changed' => 'Ticket cambiato',
        'Ticket changed between' => 'Ticket cambiato fra',
        'Last close times' => 'Ultimi tempi di chiusura',
        'No last close time settings.' => 'Nessuna ultima impostazione di chiusura.',
        'Ticket last close' => 'Ultima chiusura del ticket',
        'Ticket last close between' => 'Ultima chiusura del ticket tra',
        'Close times' => 'Tempi di chiusura',
        'No close time settings.' => 'Nessuna data di chiusura.',
        'Ticket closed' => 'Ticket chiusi',
        'Ticket closed between' => 'Ticket chiuso tra',
        'Pending times' => 'Tempi di attesa',
        'No pending time settings.' => 'Tempo di attesa non selezionato.',
        'Ticket pending time reached' => 'Tempo di attesa per ticket raggiunto',
        'Ticket pending time reached between' => 'Tempo di attesa per ticket raggiunto fra',
        'Escalation times' => 'Tempi di escalation',
        'No escalation time settings.' => 'Tempo di gestione non selezionato.',
        'Ticket escalation time reached' => 'Tempo di gestione per ticket superato',
        'Ticket escalation time reached between' => 'Tempo di gestione per ticket superato fra',
        'Escalation - first response time' => 'Escalation - Prima risposta',
        'Ticket first response time reached' => 'Tempo di prima risposta superato',
        'Ticket first response time reached between' => 'Tempo di prima risposta superato fra',
        'Escalation - update time' => 'Escalation - Aggiornamento',
        'Ticket update time reached' => 'Tempo di gestione - Aggiorna scaduto',
        'Ticket update time reached between' => 'Tempo di gestione - Aggiorna scaduto fra',
        'Escalation - solution time' => 'Escalation - Soluzione',
        'Ticket solution time reached' => 'Tempo per soluzione scaduto',
        'Ticket solution time reached between' => 'Tempo per soluzione scaduto fra',
        'Archive search option' => 'Opzione di ricerca in archivio',
        'Update/Add Ticket Attributes' => 'Aggiorna/Aggiungi attributi ticket',
        'Set new service' => 'Imposta nuovo servizio',
        'Set new Service Level Agreement' => 'Imposta nuovo Service Level Agreement',
        'Set new priority' => 'Imposta nuova priorità',
        'Set new queue' => 'Imposta nuova coda',
        'Set new state' => 'Imposta nuovo stato',
        'Pending date' => 'In attesa fino a',
        'Set new agent' => 'Imposta nuovo agente',
        'new owner' => 'nuovo proprietario',
        'new responsible' => 'nuovo responsabile',
        'Set new ticket lock' => 'Imposta il nuovo blocco ticket',
        'New customer user ID' => 'Nuovo ID utenza cliente',
        'New customer ID' => 'Nuovo ID cliente',
        'New title' => 'Nuovo titolo',
        'New type' => 'Nuovo tipo',
        'Archive selected tickets' => 'Archivia i ticket selezionati',
        'Add Note' => 'Aggiungi nota',
        'Visible for customer' => 'Visibile per il cliente',
        'Time units' => 'Tempo',
        'Execute Ticket Commands' => 'Esegui i comandi associati al ticket',
        'Send agent/customer notifications on changes' => 'Invia notifiche ad agente/cliente alla modifica',
        'Delete tickets' => 'Elimina ticket',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Attenzione: Tutti i ticket corrispondenti saranno rimossi dal database e non potranno essere ripristinati!',
        'Execute Custom Module' => 'Esegui Modulo Custom',
        'Param %s key' => 'Chiave parametro %s',
        'Param %s value' => 'Valore parametro %s',
        'Results' => 'Risultati',
        '%s Tickets affected! What do you want to do?' => '%s ticket corrispondenti! Cosa vuoi fare?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Avviso: è stata usata l\'opzione ELIMINA. Tutti i ticket eliminati saranno persi!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Avvertenza: vi sono %s ticket interessati ma possono essere modificati solo %s durante l\'esecuzione di un lavoro!',
        'Affected Tickets' => 'Ticket corrispondenti',
        'Age' => 'Età',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceDebugger.tt
        'Go back to web service' => 'Ritorna al web service',
        'Clear' => 'Cancella',
        'Do you really want to clear the debug log of this web service?' =>
            'Vuoi davvero cancellare il log di debug per questo web service?',
        'GenericInterface Web Service Management' => 'GenericInterface gestione web service',
        'Web Service Management' => 'Gestione dei servizi Web',
        'Debugger' => 'Debugger',
        'Request List' => 'Lista richieste',
        'Time' => 'Tempo',
        'Communication ID' => 'ID comunicazione',
        'Remote IP' => 'IP remoto',
        'Loading' => 'Caricamento',
        'Select a single request to see its details.' => 'Seleziona una sola richiesta per vederne i dettagli.',
        'Filter by type' => 'Filtra per tipo',
        'Filter from' => 'Filtra da',
        'Filter to' => 'Filtra a',
        'Filter by remote IP' => 'Filtra per IP remoto',
        'Refresh' => 'Aggiorna',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingDefault.tt
        'Do you really want to delete this error handling module?' => 'Vuoi veramente cancellare questo modulo di gestione degli errori?',
        'All configuration data will be lost.' => 'Tutti i dati di configurazione saranno persi.',
        'Add ErrorHandling' => 'Aggiungi ErrorHandling',
        'Edit ErrorHandling' => 'Modificare ErrorHandling',
        'General options' => 'Opzioni generali',
        'The name can be used to distinguish different error handling configurations.' =>
            'Il nome può essere utilizzato per distinguere diverse configurazioni di gestione degli errori.',
        'Please provide a unique name for this web service.' => 'Indica un nome univoco per questo web service.',
        'Error handling module backend' => 'Errore nella gestione del back-end del modulo',
        'This Znuny error handling backend module will be called internally to process the error handling mechanism.' =>
            'Questo modulo di back-end di gestione degli errori Znuny verrà chiamato internamente per elaborare il meccanismo di gestione degli errori.',
        'Processing options' => 'Opzioni di elaborazione',
        'Configure filters to control error handling module execution.' =>
            'Configurare i filtri per controllare l\'esecuzione del modulo di gestione degli errori.',
        'Only requests matching all configured filters (if any) will trigger module execution.' =>
            'Solo le richieste corrispondenti a tutti i filtri configurati (se presenti) attiveranno l\'esecuzione del modulo.',
        'Operation filter' => 'Filtro operativo',
        'Only execute error handling module for selected operations.' => 'Eseguire il modulo di gestione degli errori solo per le operazioni selezionate.',
        'Note: Operation is undetermined for errors occuring while receiving incoming request data. Filters involving this error stage should not use operation filter.' =>
            'Nota: l\'operazione non è determinata per errori che si verificano durante la ricezione dei dati della richiesta in arrivo. I filtri che coinvolgono questa fase di errore non devono utilizzare il filtro operativo.',
        'Invoker filter' => 'Filtro Invoker',
        'Only execute error handling module for selected invokers.' => 'Eseguire il modulo di gestione degli errori solo per i chiamanti selezionati.',
        'Error message content filter' => 'Filtro contenuto messaggio di errore',
        'Enter a regular expression to restrict which error messages should cause error handling module execution.' =>
            'Immettere un\'espressione regolare per limitare quali messaggi di errore dovrebbero causare l\'esecuzione del modulo di gestione degli errori.',
        'Error message subject and data (as seen in the debugger error entry) will considered for a match.' =>
            'Oggetto del messaggio di errore e dati (come indicato nella voce dell\'errore del debugger) verranno considerati per una corrispondenza.',
        'Example: Enter \'^.*401 Unauthorized.*\$\' to handle only authentication related errors.' =>
            'Esempio: immettere \'^.*401 Non autorizzato. *\$\' per gestire solo errori relativi all\'autenticazione.',
        'Error stage filter' => 'Filtro fase errore',
        'Only execute error handling module on errors that occur during specific processing stages.' =>
            'Eseguire il modulo di gestione degli errori solo sugli errori che si verificano durante specifiche fasi di elaborazione.',
        'Example: Handle only errors where mapping for outgoing data could not be applied.' =>
            'Esempio: gestire solo errori in cui non è stato possibile applicare la mappatura per i dati in uscita.',
        'Error code' => 'Codice di errore',
        'An error identifier for this error handling module.' => 'Un identificatore di errore per questo modulo di gestione degli errori.',
        'This identifier will be available in XSLT-Mapping and shown in debugger output.' =>
            'Questo identificatore sarà disponibile in XSLT-Mapping e mostrato nell\'output del debugger.',
        'Error message' => 'Messaggio di errore',
        'An error explanation for this error handling module.' => 'Una spiegazione dell\'errore per questo modulo di gestione degli errori.',
        'This message will be available in XSLT-Mapping and shown in debugger output.' =>
            'Questo messaggio sarà disponibile in XSLT-Mapping e mostrato in uscita debugger.',
        'Define if processing should be stopped after module was executed, skipping all remaining modules or only those of the same backend.' =>
            'Definire se l\'elaborazione deve essere sospesa dopo è stato eseguito modulo, saltando tutti i moduli rimanenti o solo quelli dello stesso backend.',
        'Default behavior is to resume, processing the next module.' => 'Il comportamento predefinito è quello di riprendere, elaborare il modulo successivo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingRequestRetry.tt
        'This module allows to configure scheduled retries for failed requests.' =>
            'Questo modulo permette di configurare in programma tentativi per le richieste non riuscite.',
        'Default behavior of GenericInterface web services is to send each request exactly once and not to reschedule after errors.' =>
            'Il comportamento predefinito di servizi WEB un\'interfaccia generica è quella di inviare ogni richiesta esattamente una volta e non di riprogrammare dopo gli errori.',
        'If more than one module capable of scheduling a retry is executed for an individual request, the module executed last is authoritative and determines if a retry is scheduled.' =>
            'Se viene eseguito più di un modulo in grado di programmare un nuovo tentativo per una singola richiesta, il modulo eseguito per ultimo è autorevole e determina se è stato pianificato un nuovo tentativo.',
        'Request retry options' => 'Richiedi opzioni di nuovo tentativo',
        'Retry options are applied when requests cause error handling module execution (based on processing options).' =>
            'Le opzioni di tentativo vengono applicate quando le richieste causano errori nella gestione del modulo (basato sulle opzioni di elaborazione).',
        'Schedule retry' => 'Riprova',
        'Should requests causing an error be triggered again at a later time?' =>
            'Le richieste che causano un errore devono essere nuovamente attivate in un secondo momento?',
        'Initial retry interval' => 'Intervallo di tentativi iniziali',
        'Interval after which to trigger the first retry.' => 'Intervallo dopo il quale attivare il primo tentativo.',
        'Note: This and all further retry intervals are based on the error handling module execution time for the initial request.' =>
            'Nota: questo e tutti gli altri intervalli di tentativi si basano sul tempo di esecuzione del modulo di gestione degli errori per la richiesta iniziale.',
        'Factor for further retries' => 'Fattore per ulteriori tentativi',
        'If a request returns an error even after a first retry, define if subsequent retries are triggered using the same interval or in increasing intervals.' =>
            'Se una richiesta restituisce un errore anche dopo un primo tentativo, definire se i tentativi successivi vengono attivati utilizzando lo stesso intervallo o in intervalli crescenti.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\' and retry factor at \'2\', retries would be triggered at 10:01 (1 minute), 10:03 (2*1=2 minutes), 10:07 (2*2=4 minutes), 10:15 (2*4=8 minutes), ...' =>
            'Esempio: se una richiesta viene inizialmente attivata alle 10:00 con intervallo iniziale a \'1 minuto\' e fattore di ripetizione a \'2\', i tentativi verranno attivati alle 10:01 (1 minuto), 10:03 (2*1 = 2 minuti), 10:07 (2*2 = 4 minuti), 10:15 (2*4 = 8 minuti), ...',
        'Maximum retry interval' => 'Intervallo massimo di tentativi',
        'If a retry interval factor of \'1.5\' or \'2\' is selected, undesirably long intervals can be prevented by defining the largest interval allowed.' =>
            'Se si seleziona un fattore di intervallo di tentativi di \'1,5\' o \'2\', è possibile impedire intervalli indesiderabili lunghi definendo l\'intervallo massimo consentito.',
        'Intervals calculated to exceed the maximum retry interval will then automatically be shortened accordingly.' =>
            'Gli intervalli calcolati per superare l\'intervallo massimo di tentativi verranno automaticamente abbreviati di conseguenza.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum interval at \'5 minutes\', retries would be triggered at 10:01 (1 minute), 10:03 (2 minutes), 10:07 (4 minutes), 10:12 (8=>5 minutes), 10:17, ...' =>
            'Esempio: se una richiesta viene inizialmente attivata alle 10:00 con intervallo iniziale a \'1 minuto\', fattore di tentativo a \'2\' e intervallo massimo a \'5 minuti\', i tentativi verranno attivati ​​alle 10:01 (1 minuto), 10:03 (2 minuti), 10:07 (4 minuti), 10:12 (8 => 5 minuti), 10:17, ...',
        'Maximum retry count' => 'Numero massimo di tentativi',
        'Maximum number of retries before a failing request is discarded, not counting the initial request.' =>
            'Numero massimo di tentativi prima di scartare una richiesta non riuscita, senza contare la richiesta iniziale.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry count at \'2\', retries would be triggered at 10:01 and 10:02 only.' =>
            'Esempio: se una richiesta viene inizialmente attivata alle 10:00 con intervallo iniziale a \'1 minuto\', fattore di tentativo a \'2\' e conteggio massimo dei tentativi a \'2\', i tentativi verranno attivati ​​solo alle 10:01 e 10:02.',
        'Note: Maximum retry count might not be reached if a maximum retry period is configured as well and reached earlier.' =>
            'Nota: il conteggio massimo dei tentativi potrebbe non essere raggiunto se è configurato anche un periodo massimo di tentativi e raggiunto in precedenza.',
        'This field must be empty or contain a positive number.' => 'Questo campo deve essere vuoto o contenere un numero positivo.',
        'Maximum retry period' => 'Periodo massimo di tentativi',
        'Maximum period of time for retries of failing requests before they are discarded (based on the error handling module execution time for the initial request).' =>
            'Periodo massimo di tempo per i tentativi di richieste non riuscite prima che vengano eliminate (in base al tempo di esecuzione del modulo di gestione degli errori per la richiesta iniziale).',
        'Retries that would normally be triggered after maximum period is elapsed (according to retry interval calculation) will automatically be triggered at maximum period exactly.' =>
            'I tentativi che verrebbero normalmente attivati ​​dopo che è trascorso il periodo massimo (in base al calcolo dell\'intervallo di tentativi) verranno automaticamente attivati ​​al periodo massimo esatto.',
        'Example: If a request is initially triggered at 10:00 with initial interval at \'1 minute\', retry factor at \'2\' and maximum retry period at \'30 minutes\', retries would be triggered at 10:01, 10:03, 10:07, 10:15 and finally at 10:31=>10:30.' =>
            'Esempio: se una richiesta viene inizialmente attivata alle 10:00 con intervallo iniziale a "1 minuto", fattore di tentativo a "2" e periodo di tentativo massimo a "30 minuti", i tentativi verranno attivati ​​alle 10:01, 10:03, 10:07, 10:15 e infine alle 10:31 => 10:30.',
        'Note: Maximum retry period might not be reached if a maximum retry count is configured as well and reached earlier.' =>
            'Nota: il periodo massimo di tentativi potrebbe non essere raggiunto se anche un conteggio massimo tentativi è configurato e raggiunto in precedenza.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerDefault.tt
        'Do you really want to delete this invoker?' => 'Vuoi davvero eliminare questo invoker?',
        'Add Invoker' => 'Aggiungi Invoker',
        'Edit Invoker' => 'Modifica Invoker',
        'Invoker Details' => 'Dettagli dell\'Invoker',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Questo nome è normalmente usato per innescare l\'operazione di un web service remoto.',
        'Invoker backend' => 'Invoker backend',
        'This Znuny invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Questo modulo di Invoker di backend viene utilizzato per preparare i dati da inviare al sistema remoto e per processare le risposte.',
        'Mapping for outgoing request data' => 'Mapping per i dati delle richieste in uscita',
        'Configure' => 'Configurazione',
        'The data from the invoker of Znuny will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'I dati dell\'Invoker Znuny saranno trasformati con questa mappatura, per modificarli secondo le aspettative del sistema remoto.',
        'Mapping for incoming response data' => 'Mapping per i dati delle richieste in ingresso',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of Znuny expects.' =>
            'I dati del sistema remoto saranno trasformati con questa mappatura, per modificarli secondo le aspettative del sistema Znuny.',
        'Asynchronous' => 'Asincrono',
        'Condition' => 'Condizione',
        'Edit this event' => 'Modifica questo evento',
        'This invoker will be triggered by the configured events.' => 'Questo Invoker sarà scatenato dagli eventi configurati.',
        'Add Event' => 'Aggiungi evento',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Per aggiungere un nuovo evento seleziona nome e oggetto, e premi sul pulsante "+"',
        'Asynchronous event triggers are handled by the Znuny Scheduler Daemon in background (recommended).' =>
            'I trigger di eventi asincroni sono gestiti dal demone Scheduler Znuny in background (consigliato).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'I trigger sincroni di eventi saranno elaborati direttamente durante la richiesta web.',
        'Add all attachments' => '',
        'Add all attachments to invoker payload.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerEvent.tt
        'GenericInterface Invoker Event Settings for Web Service %s' => 'GenericInterface Invoker Event Settings per il servizio Web %s',
        'Go back to' => 'Torna indietro a',
        'Delete all conditions' => 'Elimina tutte le condizioni',
        'Do you really want to delete all the conditions for this event?' =>
            'Vuoi veramente cancellare tutte le condizioni per questo evento?',
        'General Settings' => 'Impostazioni generali',
        'Event type' => 'Tipo di evento',
        'Conditions' => 'Condizioni',
        'Conditions can only operate on non-empty fields.' => 'Le condizioni possono funzionare solo su campi non vuoti.',
        'Type of Linking between Conditions' => 'Tipo del collegamento tra le Condizioni',
        'Remove this Condition' => 'Rimuovi questa condizione',
        'Type of Linking' => 'Tipo di Collegamento',
        'Fields' => 'Campi',
        'Add a new Field' => 'Aggiungi un nuovo campo',
        'Remove this Field' => 'Rimuovi questo campo',
        'And can\'t be repeated on the same condition.' => 'E non può essere ripetuto nella stessa condizione.',
        'Add New Condition' => 'Aggiungi nuova condizione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingSimple.tt
        'Mapping Simple' => 'Mapping Semplice',
        'Default rule for unmapped keys' => 'Regole di default per chiavi non mappate',
        'This rule will apply for all keys with no mapping rule.' => 'Questa regola sarà applicata per tutte le chiavi senza regole specifiche di mapping',
        'Default rule for unmapped values' => 'Regola di default per valori non mappati',
        'This rule will apply for all values with no mapping rule.' => 'Questa regola sarà applicata per tutti i valori senza regole specifiche di mapping',
        'New key map' => 'Nuova mappatura chiavi',
        'Add key mapping' => 'Aggiungi mappatura chiavi',
        'Mapping for Key ' => 'Mappatura per la chiave ',
        'Remove key mapping' => 'Rimuovere mappatura chiave',
        'Key mapping' => 'Mappatura chiave',
        'Map key' => 'Chiave Sorgente',
        'matching' => '',
        'to new key' => 'Chiave Destinazione',
        'Value mapping' => 'Mappatura valori',
        'Map value' => 'Valore Sorgente',
        'new value' => '',
        'Remove value mapping' => 'Rimuovere mappatura valori',
        'New value map' => 'Nuova mappatura valori',
        'Add value mapping' => 'Aggiungi mappatura valori',
        'Do you really want to delete this key mapping?' => 'Vuoi davvero eliminare questa mappatura?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingXSLT.tt
        'General Shortcuts' => 'Scorciatoie generiche',
        'MacOS Shortcuts' => 'Scorciatoie MacOS',
        'Comment code' => 'Codice commento',
        'Uncomment code' => 'Rimuovere il codice commento',
        'Auto format code' => 'Auto formato codice',
        'Expand/Collapse code block' => 'Espandi / comprimi blocco di codice',
        'Find' => 'Trova',
        'Find next' => 'Trova successivo',
        'Find previous' => 'Trova precedente',
        'Find and replace' => 'Trova e sostituisci',
        'Find and replace all' => 'Trova e sostituisci tutto',
        'XSLT Mapping' => 'Mappa XSLT',
        'XSLT stylesheet' => 'Foglio di stile XSLT',
        'The entered data is not a valid XSLT style sheet.' => 'I dati inseriti non sono un foglio di stile XSLT valido.',
        'Here you can add or modify your XSLT mapping code.' => 'Qui puoi aggiungere o modificare il codice di mappatura XSLT.',
        'The editing field allows you to use different functions like automatic formatting, window resize as well as tag- and bracket-completion.' =>
            'Il campo di modifica consente di utilizzare diverse funzioni come la formattazione automatica, il ridimensionamento della finestra e il completamento di tag e parentesi.',
        'Data includes' => 'Certificato client',
        'Select one or more sets of data that were created at earlier request/response stages to be included in mappable data.' =>
            'Selezionare uno o più set di dati che sono stati creati nelle fasi precedenti di richiesta/risposta da includere nei dati mappabili.',
        'These sets will appear in the data structure at \'/DataInclude/<DataSetName>\' (see debugger output of actual requests for details).' =>
            'Questi set appariranno nella struttura dei dati in \'/ DataInclude/<DataSetName>\'(vedere l\'output del debugger delle richieste effettive per i dettagli).',
        'Force array for tags' => '',
        'Enter tags separated by space for which array representation should be forced.' =>
            '',
        'Keep XML attributes' => '',
        'Only needed for content type XML.' => '',
        'Data key regex filters (before mapping)' => 'Filtri regex chiave dati (prima della mappatura)',
        'Data key regex filters (after mapping)' => 'Filtri regex chiave dati (dopo la mappatura)',
        'Regular expressions' => 'Espressioni regolari',
        'Replace' => 'Sostituisci',
        'Remove regex' => 'Rimuovi espressione regolare',
        'Add regex' => 'Aggiungi espressione regolare',
        'These filters can be used to transform keys using regular expressions.' =>
            'Questi filtri possono essere usati per trasformare le chiavi usando espressioni regolari.',
        'The data structure will be traversed recursively and all configured regexes will be applied to all keys.' =>
            'La struttura dei dati verrà attraversata in modo ricorsivo e tutte le regex configurate verranno applicate a tutte le chiavi.',
        'Use cases are e.g. removing key prefixes that are undesired or correcting keys that are invalid as XML element names.' =>
            'I casi d\'uso sono ad es. rimozione di prefissi chiave indesiderati o correzione di chiavi non valide come nomi di elementi XML.',
        'Example 1: Search = \'^jira:\' / Replace = \'\' turns \'jira:element\' into \'element\'.' =>
            'Esempio 1: Cerca = \'^jira:\' / Sostituisci = \'\' trasforma \'jira:element\' in \'element\'.',
        'Example 2: Search = \'^\' / Replace = \'_\' turns \'16x16\' into \'_16x16\'.' =>
            'Esempio 2: Cerca = \'^\' / Sostituisci = \'_\' trasforma \'16x16\' in \'_16x16\'.',
        'Example 3: Search = \'^(?<number>\d+) (?<text>.+?)\$\' / Replace = \'_\$+{text}_\$+{number}\' turns \'16 elementname\' into \'_elementname_16\'.' =>
            'Esempio 3: Cerca = \'^ (?<number>\ d +) (?<text>. +?) \ $\' / Sostituisci = \'_\$+{text}_ \$+{numero}\' trasforma \'16 elementname \'into \'_elementname_16\'.',
        'For information about regular expressions in Perl please see here:' =>
            'Per informazioni sulle espressioni regolari in Perl, consultare qui:',
        'Perl regular expressions tutorial' => 'Tutorial sulle espressioni regolari del Perl',
        'If modifiers are desired they have to be specified within the regexes themselves.' =>
            'Se si desidera che i modificatori debbano essere specificati all\'interno delle regex stesse.',
        'Regular expressions defined here will be applied before the XSLT mapping.' =>
            'Le espressioni regolari qui definite verranno applicate prima della mappatura XSLT.',
        'Regular expressions defined here will be applied after the XSLT mapping.' =>
            'Le espressioni regolari qui definite verranno applicate dopo la mappatura XSLT.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceOperationDefault.tt
        'Do you really want to delete this operation?' => 'Vuoi davvero eliminare questa operazione?',
        'Add Operation' => 'Aggiungi operazione',
        'Edit Operation' => 'Modifica operazione',
        'Operation Details' => 'Dettagli operazione',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Il nome è solitamente utilizzato per richiamare questa operazione del web service da un sistema remoto',
        'Operation backend' => 'Motore operazione',
        'This Znuny operation backend module will be called internally to process the request, generating data for the response.' =>
            'Questo modulo di backend di Znuny sarà chiamato internamente per elaborare la richiesta, generando i dati per la risposta.',
        'Mapping for incoming request data' => 'Mappatura per i dati in ingresso',
        'The request data will be processed by this mapping, to transform it to the kind of data Znuny expects.' =>
            'I dati del sistema remoto saranno trasformati con questa mappatura, per modificarli secondo le aspettative del sistema Znuny.',
        'Mapping for outgoing response data' => 'Mappatura per i dati in uscita',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'I dati ricevuti saranno trasformati con questa mappatura, per modificarli secondo le aspettative del sistema remoto.',
        'Include Ticket Data' => 'Includi dati ticket',
        'Include ticket data in response.' => 'Include i dati del ticket nella risposta.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPREST.tt
        'Network Transport' => 'Trasporto di rete',
        'Properties' => 'Proprietà',
        'Route mapping for Operation' => 'Mappatura di instradamento per l\'Operazione',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Definire il percorso che dovrebbe essere mappato a questa operazione. Le variabili contrassegnate da un \':\' verranno mappate al nome inserito e passate insieme alle altre alla mappatura. (ad es. / Ticket /: TicketID).',
        'Valid request methods for Operation' => 'Metodi di richiesta validi per l\'operazione',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Limitare questa operazione a metodi di richiesta specifici. Se non viene selezionato alcun metodo, verranno accettate tutte le richieste.',
        'Parser backend for operation' => '',
        'Defines the incoming data format.' => '',
        'Parser backend parameter' => '',
        'Please click \'Save\' to get the corresponding backend parameter if the parser backend was changed.' =>
            '',
        'Maximum message length' => 'Lunghezza massima del messaggio',
        'This field should be an integer number.' => 'Questo campo deve essere un numero intero.',
        'Here you can specify the maximum size (in bytes) of REST messages that Znuny will process.' =>
            'Qui è possibile specificare la dimensione massima (in byte) dei messaggi REST che verranno elaborati da Znuny.',
        'Send Keep-Alive' => 'Invia Keep-Alive',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Questa configurazione definisce se le connessioni in entrata devono essere chiuse o mantenute attive.',
        'Endpoint' => 'Terminatore',
        'URI to indicate specific location for accessing a web service.' =>
            'URI per indicare la posizione specifica per l\'accesso a un servizio web.',
        'e.g https://www.example.com:10745/api/v1.0 (without trailing backslash)' =>
            'ad es. https://www.example.com:10745/api/v1.0 (senza barra finale)',
        'Disable SSL hostname certificate verification' => '',
        'Disables hostname certificate verification. This is not recommended and should only be used in test environments.' =>
            '',
        'Timeout' => 'Tempo scaduto',
        'Timeout value for requests.' => 'Valore di time scaduto per le richieste.',
        'Authentication' => 'Autenticazione',
        'An optional authentication mechanism to access the remote system.' =>
            'Un meccanismo di autenticazione opzionale per accedere al sistema remoto.',
        'BasicAuth User' => 'Utente BasicAuth',
        'The user name to be used to access the remote system.' => 'Utente per accesso al sistema remoto.',
        'BasicAuth Password' => 'Password BasicAuth',
        'The password for the privileged user.' => 'Password per l\'utente',
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
        'Use Proxy Options' => 'Usa le opzioni proxy',
        'Show or hide Proxy options to connect to the remote system.' => 'Mostrare o nascondi le opzioni proxy per connettersi al sistema remoto.',
        'Proxy Server' => 'Server proxy',
        'URI of a proxy server to be used (if needed).' => 'URI del Proxy Server, se richiesto',
        'e.g. http://proxy_hostname:8080' => 'es. http://proxy_hostname:8080',
        'Proxy User' => 'Utente del proxy',
        'The user name to be used to access the proxy server.' => 'Utente per l\'accesso al Proxy Server',
        'Proxy Password' => 'Password per l\'utente del proxy',
        'The password for the proxy user.' => 'La password per l\'utente per il proxy.',
        'Skip Proxy' => 'Salta Proxy',
        'Skip proxy servers that might be configured globally?' => 'Salta i server proxy che potrebbero essere configurati a livello globale?',
        'Use SSL Options' => 'Opzione per utilizzo di SSL',
        'Show or hide SSL options to connect to the remote system.' => 'Mostra o nascondi l\'opzione SSL per connettersi al sistema remoto.',
        'Client Certificate' => 'Certificato del cliente',
        'The full path and name of the SSL client certificate file (must be in PEM, DER or PKCS#12 format).' =>
            'Il percorso completo e il nome del file del certificato client SSL (deve essere in formato PEM, DER o PKCS # 12).',
        'e.g. /opt/znuny/var/certificates/SOAP/certificate.pem' => 'esempio: /opt/znuny/var/certificates/SOAP/certificate.pem',
        'Client Certificate Key' => 'Chiave del certificato client',
        'The full path and name of the SSL client certificate key file (if not already included in certificate file).' =>
            'Il percorso completo e il nome del file della chiave del certificato client SSL (se non già incluso nel file del certificato).',
        'e.g. /opt/znuny/var/certificates/SOAP/key.pem' => 'ad es. /opt/znuny/var/certificates/SOAP/key.pem',
        'Client Certificate Key Password' => 'Password chiave certificato client',
        'The password to open the SSL certificate if the key is encrypted.' =>
            'La password per aprire il certificato SSL se la chiave è crittografata.',
        'Certification Authority (CA) Certificate' => 'Certificato Autorità di certificazione (CA)',
        'The full path and name of the certification authority certificate file that validates SSL certificate.' =>
            'Percorso completo e nome del file dell\'autorità di certificazione che convalida il certificato SSL.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA/ca.pem' => 'es. /opt/znuny/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Cartella dell\'autorità di certificazione (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Percorso completo e nome del file della directory che contiene i certificati CA',
        'e.g. /opt/znuny/var/certificates/SOAP/CA' => 'es. /opt/znuny/var/certificates/SOAP/CA',
        'Controller mapping for Invoker' => 'Mappatura del controller per l\'invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Il controller a cui il chiamante deve inviare richieste. Le variabili contrassegnate da un \':\' verranno sostituite dal valore dei dati e passate insieme alla richiesta. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password)',
        'Valid request command for Invoker' => 'Comando di richiesta per l\'invoker valido',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Uno specifico comando HTTP da utilizzare per le richieste con questo invoker (facoltativo).',
        'Default command' => 'Comando predefinito',
        'The default HTTP command to use for the requests.' => 'Il comando HTTP predefinito da utilizzare per le richieste.',
        'Additional response headers' => 'Intestazioni di risposta aggiuntive',
        'Additional request headers' => '',
        'Header' => 'Intestazione',
        'Add response header' => 'Aggiungi intestazione risposta',
        'Add request header' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPSOAP.tt
        'e.g. https://example.com:8000/Webservice/Example' => 'ad es. https://example.com:8000/Webservice/Example',
        'Set SOAPAction' => 'Imposta SOAPAction',
        'Set to "Yes" in order to send a filled SOAPAction header.' => 'Impostare su "Sì" per inviare un\'intestazione SOAPAction riempita.',
        'Set to "No" in order to send an empty SOAPAction header.' => 'Impostare su "No" al fine di inviare un header SOAPAction vuota.',
        'Set to "Yes" in order to check the received SOAPAction header (if not empty).' =>
            'Impostare su "Sì" al fine di verificare l\'intestazione SOAPAction ricevuto (se non vuoto).',
        'Set to "No" in order to ignore the received SOAPAction header.' =>
            'Impostare su "No" per ignorare l\'intestazione SOAPAction ricevuto.',
        'SOAPAction scheme' => 'Schema SOAPAction',
        'Select how SOAPAction should be constructed.' => 'Seleziona come deve essere costruita SOAPAction.',
        'Some web services require a specific construction.' => 'Alcuni servizi Web richiedono una costruzione specifica.',
        'Some web services send a specific construction.' => 'Alcuni servizi Web inviano una costruzione specifica.',
        'SOAPAction separator' => 'separatore SOAPAction',
        'Character to use as separator between name space and SOAP operation.' =>
            'Carattere da utilizzare come separatore tra spazio dei nomi e operazione SOAP.',
        'Usually .Net web services use "/" as separator.' => 'Di solito i servizi web .Net usano "/" come separatore.',
        'SOAPAction free text' => 'SOAPAction testo libero',
        'Text to be used to as SOAPAction.' => 'Testo da utilizzare come SOAPAction.',
        'Namespace' => 'Spazio dei nomi',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI per indicare ai metodi SOAP il contesto, per ridurre le ambiguità',
        'e.g urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions' =>
            'es. rn:otrs-com:soap:functions o http://www.example.com/GenericInterface/actions',
        'Omit namespace prefix' => '',
        'Omits the namespace prefix (e. g. namesp1:) in root tag of SOAP message.' =>
            '',
        'Request name scheme' => 'Schema del nome di richiesta',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Seleziona la modalità di creazione del involucro della funzione di richiesta SOAP.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'FunctionName\' viene utilizzato come esempio per il nome effettivo dell\'operatore / operazione.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'FreeText\' è un esempio di valore realmente configurato.',
        'Request name free text' => 'Richiedi nome testo libero',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Testo da utilizzare come suffisso o sostituzione del nome del involucro di funzione.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Considera le restrizioni sulla denominazione degli elementi XML (ad es. Non utilizzare "<" e "&").',
        'Response name scheme' => 'Schema del nome di risposta',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Seleziona la modalità di creazione del wrapper della funzione di risposta SOAP.',
        'Response name free text' => 'Testo del nome di risposta',
        'Here you can specify the maximum size (in bytes) of SOAP messages that Znuny will process.' =>
            'Specifica il la dimensione massima (in byte) del messaggio SOAP che Znuny elaborerà.',
        'Fixed namespace prefix' => '',
        'Use a fixed namespace prefix (e. g. myns:) for the root tag of a SOAP message.' =>
            '',
        'Suffix for response tag' => '',
        'Usually Znuny expects a response tag like "&lt;Operation&gt;Response". This setting can change the "Response" part, e. g. to "Result".' =>
            '',
        'Encoding' => 'Codifica',
        'The character encoding for the SOAP message contents.' => 'La codifica di caratteri del contenuto del messaggio SOAP.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'es. utf-8, latin1, iso-8859-1, cp1250, Etc.',
        'User' => 'Utente',
        'Password' => 'Password',
        'Disable SSL hostname verification' => '',
        'Disables (setting "Yes") or enables (setting "No", default) the SSL hostname verification.' =>
            '',
        'Sort options' => 'Opzioni di ordinamento',
        'Add new first level element' => 'Aggiungi nuovo elemento di primo livello',
        'Element' => 'Elemento',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Ordinamento in uscita per i campi xml (struttura che inizia sotto il wrapper del nome della funzione): consultare la documentazione per il trasporto SOAP.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebservice.tt
        'Add Web Service' => 'Aggiungi servizio Web',
        'Clone Web Service' => 'Clona Servizio Web',
        'The name must be unique.' => 'Il nome deve essere univoco.',
        'Clone' => 'Copia',
        'Export Web Service' => 'Esporta web service',
        'Import web service' => 'Importa web service',
        'Configuration File' => 'File di Configurazione',
        'The file must be a valid web service configuration YAML file.' =>
            'Il file deve essere un file di configurazione di web service in formato YAML.',
        'Here you can specify a name for the webservice. If this field is empty, the name of the configuration file is used as name.' =>
            'Qui è possibile specificare un nome per il servizio web. Se questo campo è vuoto, il nome del file di configurazione viene utilizzato come nome.',
        'Import' => 'Importa',
        'Configuration History' => 'Cronologia di configurazione',
        'Delete web service' => 'Elimina il web service',
        'Do you really want to delete this web service?' => 'Vuoi davvero eliminare questo web service?',
        'Ready2Adopt Web Services' => 'Ready2Adopt Web Services',
        'Import Ready2Adopt web service' => 'Importa il servizio Web Ready2Adopt',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Dopo aver salvato, sarai rediretto alla schermata di modifica.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Se vuoi ritornare alla vista globale, utilizza il pulsante "Vai alla vista globale".',
        'Edit Web Service' => 'Modifica servizio WEB',
        'Remote system' => 'Sistema Remoto',
        'Provider transport' => 'Trasporto del Provider',
        'Requester transport' => 'Trasporto del Richiedente',
        'Debug threshold' => 'Soglia di debug',
        'In provider mode, Znuny offers web services which are used by remote systems.' =>
            'In modalità fornitore, Znuny espone web service utilizzati dai sistemi remoti.',
        'In requester mode, Znuny uses web services of remote systems.' =>
            'In modalità richiedente, Znuny sfrutta i web service del sistema remoto',
        'Network transport' => 'Network transport',
        'Error Handling Modules' => 'Moduli di gestione degli errori',
        'Error handling modules are used to react in case of errors during the communication. Those modules are executed in a specific order, which can be changed by drag and drop.' =>
            'I moduli di gestione degli errori vengono utilizzati per reagire in caso di errori durante la comunicazione. Tali moduli vengono eseguiti in un ordine specifico, che può essere modificato trascinandolo.',
        'Add error handling module' => 'Aggiungi modulo di gestione degli errori',
        'Operations are individual system functions which remote systems can request.' =>
            'Operazioni sono funzionalità singole che i sistemi remoti possono richiedere',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Gli invoker preparano i dati per una richiesta al web service di un sistema remoto, e processano i dati ricevuti in risposta',
        'Controller' => 'Controller',
        'Inbound mapping' => 'Mappatura in ingresso',
        'Outbound mapping' => 'Mappatura in uscita',
        'Delete this action' => 'Elimina questa azione',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Almeno un %s ha un controller che è non attivo o non disponibile, verifica la registrazione del controller o elimina la %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebserviceHistory.tt
        'Go back to Web Service' => 'Ritorna al web service',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Qui potete vedere le versioni precedenti della configurazione del web service, potete esportarle o ripristinale.',
        'History' => 'Storico',
        'Configuration History List' => 'Elenco storico configurazioni',
        'Version' => 'Versione',
        'Create time' => 'Data di Creazione',
        'Select a single configuration version to see its details.' => 'Selezionate una sola versione per vederne i dettagli.',
        'Export web service configuration' => 'Esporta la configurazione del web service',
        'Restore web service configuration' => 'Ripristina la configurazione del web service',
        'Do you really want to restore this version of the web service configuration?' =>
            'Vuoi davvero ripristinare questa versione della configurazione del web service?',
        'Your current web service configuration will be overwritten.' => 'La configurazione attuale del web service sarà sovrascritta.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGroup.tt
        'Add Group' => 'Inserisci gruppo',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Il gruppo admin ha accesso all\'area di amministrazione mentre il gruppo stats ha accesso alle statistiche.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Crea nuovi gruppi per gestire i permessi di accesso per diversi gruppi di agenti (ad esempio il dipartimento acquisti, dipartimento di supporto, dipartimento vendite, ...). ',
        'It\'s useful for ASP solutions. ' => 'È utile per soluzioni ASP. ',
        'Agents ↔ Groups' => 'Agenti ↔ Gruppi',
        'Roles ↔ Groups' => 'Ruoli ↔ Gruppi',
        'Group Management' => 'Gestione gruppo',
        'Edit Group' => 'Modifica gruppo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminLog.tt
        'Clear log entries' => '',
        'Here you will find log information about your system.' => 'Qui si troveranno informazioni di log sul sistema.',
        'Hide this message' => 'Nascondi questo messaggio',
        'System Log' => 'Log di sistema',
        'Recent Log Entries' => 'Interazioni recenti',
        'Facility' => 'Funzione',
        'Message' => 'Messaggio',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminMailAccount.tt
        'Add Mail Account' => 'Aggiungi account di posta',
        'Filter for Mail Accounts' => 'Filtro per account di posta',
        'Filter for mail accounts' => 'Filtro per account di posta',
        'All incoming emails with one account will be dispatched in the selected queue.' =>
            'Tutte le e-mail in arrivo con un account verranno spedite nella coda selezionata.',
        'If your account is marked as trusted, the X-OTRS headers already existing at arrival time (for priority etc.) will be kept and used, for example in PostMaster filters.' =>
            'Se il tuo account è contrassegnato come attendibile, le intestazioni X-OTRS già esistenti all\'ora di arrivo (per priorità ecc.) Verranno conservate e utilizzate, ad esempio nei filtri PostMaster.',
        'Outgoing email can be configured via the Sendmail* settings in %s.' =>
            'La posta elettronica in uscita può essere configurata tramite le impostazioni di Sendmail * in %s.',
        'System Configuration' => 'Configurazione di sistema',
        'Mail Account Management' => 'Gestione Credenziali Mail',
        'Edit Mail Account for host' => 'Modifica account di posta per host',
        'and user account' => 'e account utente',
        'Host' => 'Server',
        'Authentication type' => '',
        'Fetch mail' => 'Scarica posta',
        'Delete account' => 'Elimina account',
        'Do you really want to delete this mail account?' => 'Vuoi veramente cancellare questo account di posta?',
        'Example: mail.example.com' => 'Esempio: mail.esempio.it',
        'IMAP Folder' => 'Cartella IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Modifica questo solo per recuperare la posta da una cartella diversa da INBOX',
        'Trusted' => 'Fidato',
        'Dispatching' => 'Smistamento',
        'Edit Mail Account' => 'Modifica account di posta',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNavigationBar.tt
        'Administration Overview' => 'Panoramica dell\'amministrazione',
        'Favorites' => 'Preferiti',
        'You can add favorites by moving your cursor over items on the right side and clicking the star icon.' =>
            'Puoi aggiungere i preferiti spostando il cursore sugli elementi a destra e facendo clic sull\'icona a forma di stella.',
        'Links' => 'Collegamenti',
        'View the admin manual on Github' => 'Visualizza il manuale di amministrazione su Github',
        'Filter for Items' => 'Filtro per articoli',
        'No Matches' => 'Nessuna corrispondenza',
        'Sorry, your search didn\'t match any items.' => 'Siamo spiacenti, la tua ricerca non ha prodotto risultati.',
        'Set as favorite' => 'Imposta come preferito',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEvent.tt
        'Here you can upload a configuration file to import Ticket Notifications to your system. The file needs to be in .yml format as exported by the Ticket Notification module.' =>
            'Qui puoi caricare un file di configurazione per importare le Notifiche ticket sul tuo sistema. Il file deve essere in formato .yml esportato dal modulo Notifica ticket.',
        'Ticket Notification Management' => 'Gestione delle notifiche dei ticket',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Qui puoi scegliere quali eventi attiveranno questa notifica. Di seguito è possibile applicare un filtro ticket aggiuntivo per inviare il ticket solo con determinati criteri.',
        'Ticket Filter' => 'Filtro ticket',
        'Lock' => 'Blocca',
        'SLA' => 'SLA',
        'Customer User ID' => 'ID utenza cliente',
        'Article Filter' => 'Filtro articoli',
        'Only for ArticleCreate and ArticleSend event' => 'Solo per eventi ArticleCreate e ArticleSend',
        'Article sender type' => 'Tipologia del mittente dell\'articolo',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Se ArticleCreate o ArticleSend viene utilizzato come evento trigger, è necessario specificare anche un filtro articolo. Seleziona almeno uno dei campi filtro articolo.',
        'Customer visibility' => 'Visibilità cliente',
        'Communication channel' => 'Canale di comunicazione',
        'Include attachments to notification' => 'Includi allegati nella notifica',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Avvisare l\'utente una sola volta al giorno di un singolo ticket utilizzando un trasporto selezionato.',
        'This field is required and must have less than 4000 characters.' =>
            'Questo campo è obbligatorio e deve contenere meno di 4000 caratteri.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportEmailSettings.tt
        'Use comma or semicolon to separate email addresses.' => 'Utilizzare la virgola o il punto e virgola per separare gli indirizzi e-mail.',
        'You can use Znuny-tags like <OTRS_TICKET_DynamicField_...> to insert values from the current ticket.' =>
            'È possibile utilizzare tag Znuny come <OTRS_TICKET_DynamicField_...> per inserire valori dal ticket corrente.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminNotificationEventTransportWebserviceSettings.tt
        'Web service name' => '',
        'Invoker' => '',
        'Asynchronous event triggers will be handled as separate process by the scheduler daemon (recommended).' =>
            '',
        'Synchronous event triggers will be processed directly during the web request.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminOAuth2TokenManagement/Edit.tt
        'Queue Management' => 'Gestione coda',
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
        'Template' => 'Modello',
        'This is the template that was used to create this OAuth2 token configuration.' =>
            '',
        'Notifications' => 'Notifiche',
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
        'PGP support is disabled' => 'Il supporto PGP è disabilitato',
        'To be able to use PGP in Znuny, you have to enable it first.' =>
            'Per poter utilizzare PGP in Znuny, devi prima abilitarlo.',
        'Enable PGP support' => 'Abilita supporto PGP',
        'Faulty PGP configuration' => 'Configurazione PGP non valida',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'Il supporto PGP è abilitato, ma la relativa configurazione contiene errori. Si prega di verificare la configurazione usando il pulsante qui sotto.',
        'Configure it here!' => 'Configuralo qui!',
        'Check PGP configuration' => 'Controlla la configurazione PGP',
        'Add PGP Key' => 'Aggiungi chiave PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'In questo modo puoi configurare direttamente il portachiavi PGP in SysConfig',
        'Introduction to PGP' => 'Introduzione a PGP',
        'PGP Management' => 'Gestione PGP',
        'Identifier' => 'Identificatore',
        'Bit' => 'Bit',
        'Fingerprint' => 'Impronta (fingerprint)',
        'Expires' => 'Scade',
        'Delete this key' => 'Elimina questa chiave',
        'PGP key' => 'Chiave PGP',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPackageManager.tt
        'Package Manager' => 'Gestione Pacchetti',
        'Uninstall Package' => 'Disinstalla pacchetto',
        'Uninstall package' => 'Disinstalla pacchetto',
        'Do you really want to uninstall this package?' => 'Vuoi davvero disinstallare questo pacchetto?',
        'Reinstall package' => 'Reinstalla pacchetto',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Vuoi davvero reinstallare questo pacchetto? Ogni modifica manuale sarà persa.',
        'Go to updating instructions' => 'Vai alle istruzioni di aggiornamento',
        'Go to znuny.org' => '',
        'package information' => 'informazioni sul pacchetto',
        'Package installation requires a patch level update of Znuny.' =>
            'L\'installazione del pacchetto richiede un aggiornamento a livello di patch di Znuny.',
        'Package update requires a patch level update of Znuny.' => 'L\'aggiornamento del pacchetto richiede un aggiornamento a livello di patch di Znuny.',
        'Please note that your installed Znuny version is %s.' => 'Si noti che la versione Znuny installata è %s.',
        'To install this package, you need to update Znuny to version %s or newer.' =>
            'Per installare questo pacchetto, è necessario aggiornare Znuny alla versione %s o più nuova.',
        'This package can only be installed on Znuny version %s or older.' =>
            'Questo pacchetto può essere installato solo sulla versione Znuny %s o più vecchia.',
        'This package can only be installed on Znuny version %s.' => '',
        'Why should I keep Znuny up to date?' => 'Perché dovrei tenere aggiornato Znuny?',
        'You will receive updates about relevant security issues.' => 'Riceverai aggiornamenti su importanti problemi di sicurezza.',
        'You will receive updates for all other relevant Znuny issues.' =>
            'Riceverai aggiornamenti per tutti gli altri problemi Znuny pertinenti.',
        'How can I do a patch level update if I don’t have a contract?' =>
            'Come posso effettuare un aggiornamento a livello di patch se non ho un contratto?',
        'Please find all relevant information within the updating instructions at %s.' =>
            'Tutte le informazioni pertinenti sono disponibili nelle istruzioni di aggiornamento all\'indirizzo %s.',
        'In case you would have further questions we would be glad to answer them.' =>
            'Nel caso dovessi avere altre domande, saremo felici di risponderti.',
        'Please visit our customer portal and file a request.' => 'Per cortesia visita il nostro portale clienti e inoltra una richiesta.',
        'Install Package' => 'Installa pacchetto',
        'Update Package' => 'Aggiorna pacchetto',
        'Package' => '',
        'Required package %s is already installed.' => '',
        'Required Perl module %s is already installed.' => '',
        'Required package %s needs to get installed!' => '',
        'Required package %s needs to get updated to version %s!' => '',
        'Required Perl module %s needs to get installed or updated!' => '',
        'Continue' => 'Continua',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Assicurati che il tuo database accetti i pacchetti %s dimensioni MB (al momento accetta solo pacchetti fino a %s MB). Adatta l\'impostazione max_allowed_packet del tuo database per evitare errori.',
        'Install' => 'Installa',
        'Update' => 'Aggiorna',
        'Update repository information' => 'Aggiorna informazioni sui repository',
        'Update all installed packages' => 'Aggiorna tutti i pacchetti installati',
        'Online Repository' => 'Archivio Online',
        'Vendor' => 'Fornitore',
        'Action' => 'Azione',
        'Module documentation' => 'Documentazione sul modulo',
        'Local Repository' => 'Archivio Locale',
        'Uninstall' => 'Disinstalla',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Estensione non installata correttamente! Reinstallare il pacchetto.',
        'Reinstall' => 'Re-installa',
        'Download package' => 'Scarica pacchetto',
        'Rebuild package' => 'Ricostruisci pacchetto',
        'Package Information' => 'Informazioni sul pacchetto',
        'Metadata' => 'Metadati',
        'Change Log' => 'Storia delle Modifiche',
        'Date' => 'Data',
        'List of Files' => 'Lista dei file',
        'Permission' => 'Permessi',
        'Size' => 'Dimensione',
        'Problem' => 'Problema',
        'OK' => 'OK',
        'Download file from package!' => 'Scarica file dal pacchetto!',
        'Required' => 'Richiesto',
        'Primary Key' => 'Chiave primaria',
        'Auto Increment' => 'Incremento automatico',
        'SQL' => 'Limite',
        'File Differences for File %s' => 'Differenze di file per file %s',
        'File differences for file %s' => 'Differenze per il file %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPerformanceLog.tt
        'This feature is enabled!' => 'Questa funzione è abilitata!',
        'Just use this feature if you want to log each request.' => 'Usa questa funzione solo se vuoi registrare ogni richiesta.',
        'Activating this feature might affect your system performance!' =>
            'L\'attivazione di questa funzionalità può ridurre le prestazioni del sistema!',
        'Disable it here!' => 'Disabilitalo qui!',
        'Logfile too large!' => 'Log File troppo grande!',
        'The logfile is too large, you need to reset it' => 'Il file di log è troppo grande, è necessario un reset del file',
        'Performance Log' => 'Log delle Performance',
        'Range' => 'Intervallo',
        'last' => 'ultimo',
        'Interface' => 'Interfaccia',
        'Requests' => 'Richieste',
        'Min Response' => 'Minimo per Risposta',
        'Max Response' => 'Massimo per Risposta',
        'Average Response' => 'Media per Risposta',
        'Period' => 'Periodo',
        'minutes' => 'minuti',
        'Min' => 'Minimo',
        'Max' => 'Massimo',
        'Average' => 'Media',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPostMasterFilter.tt
        'Add PostMaster Filter' => 'Aggiungi filtro PostMaster',
        'Filter for PostMaster Filters' => 'Filtro per filtri PostMaster',
        'Filter for PostMaster filters' => 'Filtro per filtri PostMaster',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Per gestire o filtrare email in entrata basandosi sugli header. È anche possibile usare espressioni regolari.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Se vuoi che corrisponda solo negli indirizzi di email , usa EMAILADDRESS:info@example.com in From, To or Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Se desideri usare espressioni regolari, puoi usare il valore corrispondente tra () come [***] nell\'azione \'Set\'.',
        'You can also use named captures %s and use the names in the \'Set\' action %s (e.g. Regexp: %s, Set action: %s). A matched EMAILADDRESS has the name \'%s\'.' =>
            'Puoi anche utilizzare acquisizioni con nome %s e utilizzare i nomi nell\'azione "Imposta" %s (ad es. Regexp: %s, Imposta azione: %s). Un EMAILADDRESS abbinato ha il nome \'%s\'.',
        'PostMaster Filter Management' => 'Gestione filtri posta in ingresso',
        'Edit PostMaster Filter' => 'Modifica filtro PostMaster',
        'Delete this filter' => 'Elimina questo filtro',
        'Do you really want to delete this postmaster filter?' => 'Vuoi veramente eliminare questo filtro postmaster?',
        'A postmaster filter with this name already exists!' => 'Esiste già un filtro postmaster con questo nome!',
        'Filter Condition' => 'Condizione per il filtro',
        'AND Condition' => 'Condizione AND',
        'Search header field' => 'Cerca campo di intestazione',
        'for value' => 'per valore',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Il campo deve essere una espressione regolare valida o una parola specifica.',
        'Negate' => 'Nega',
        'Set Email Headers' => 'Imposta intestazione dell\'email',
        'Set email header' => 'Imposta intestazione dell\'email',
        'with value' => 'con valore',
        'The field needs to be a literal word.' => 'Il campo deve essere una parola specifica',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPriority.tt
        'Add Priority' => 'Aggiungi Priorità',
        'Filter for Priorities' => 'Filtro per priorità',
        'Filter for priorities' => 'Filtro per priorità',
        'Configure Priority Visibility and Defaults' => '',
        'Priority Management' => 'Gestione Priorità',
        'Edit Priority' => 'Modifica Priorità',
        'Color' => 'Colore',
        'This priority is present in a SysConfig setting, confirmation for updating settings to point to the new priority is needed!' =>
            'Questa priorità è presente in un\'impostazione di SysConfig, è necessaria la conferma dell\'aggiornamento delle impostazioni per puntare alla nuova priorità!',
        'This priority is used in the following config settings:' => 'Questa priorità viene utilizzata nelle seguenti impostazioni di configurazione:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagement.tt
        'Filter for Processes' => 'Filtra per Processo',
        'Filter for processes' => 'Filtro per processi',
        'Create New Process' => 'Crea Nuovo Processo',
        'Deploy All Processes' => 'Attiva tutti i processi',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Qui è possibile importare un file di configurazione per importare un processo a sistema. Il file deve essere in formato .yml come esportato dal modulo di export della gestione processi',
        'Upload process configuration' => 'Carica la configurazione di processo',
        'Import process configuration' => 'Importa la configurazione di processo',
        'Ready2Adopt Processes' => 'Processi Ready2Adopt',
        'Here you can activate Ready2Adopt processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            'Qui è possibile attivare i processi Ready2Adopt che mostrano le nostre migliori pratiche. Si noti che potrebbe essere necessaria una configurazione aggiuntiva.',
        'Import Ready2Adopt process' => 'Importa il processo Ready2Adopt',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Per creare un nuovo processo puoi importare un processo esportato da un altro sistema o crearne uno completamente nuovo.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'I cambiamenti al processo sono riportati a sistema solo se effettuate la sincronizzazione. Con la sincronizzazione le modifiche sono scritte nella configurazione.',
        'Access Control Lists (ACL)' => 'Access Control List (ACL)',
        'Generic Agent' => '',
        'Manage Process Widget Groups' => '',
        'Processes' => 'Processi',
        'Process name' => 'Nome del processo',
        'Print' => 'Stampa',
        'Export Process Configuration' => 'Esporta la configurazione del processo',
        'Copy Process' => 'Copia il Processo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivity.tt
        'Please note, that changing this activity will affect the following processes' =>
            'Attenzione, i cambiamenti a questa attività influenzano i seguenti processi',
        'Activity' => 'Attività',
        'Activity Name' => 'Nome dell\'attività',
        'Scope' => '',
        'Scope Entity ID' => '',
        'This field is required for activities with a scope.' => '',
        'Activity Dialogs' => 'Interazioni dell\'attività',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Puoi assegnare le interazioni dell\'attività trascinando gli elementi con il mouse dalla lista di sinistra a quella di destra.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Puoi ordinare gli elementi dell\'elenco anche attraverso il trascinamento.',
        'Available Activity Dialogs' => 'Interazioni dell\'attività disponibili',
        'Filter available Activity Dialogs' => 'Imposta un filtro alle interazioni delle attività disponibili.',
        'Also show global %s' => '',
        'Name: %s, EntityID: %s' => 'Nome: %s, EntityID: %s',
        'Create New Activity Dialog' => 'Crea una nuova interazione per l\'attività',
        'Assigned Activity Dialogs' => 'Interazioni per l\'attività assegnati',
        'Filter Assigned Activity Dialogs' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivityDialog.tt
        'Please note that changing this activity dialog will affect the following activities' =>
            'Attenzione, i cambiamenti a questo messaggio delle attività influenzano le seguenti attività',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Notare che l\'utenza cliente non potrà vedere o usare i seguenti campi: Proprietario, Responsabile, Blocco, TempoAttesa e IDCliente.',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Il campo Coda può essere utilizzato solo dai clienti durante la creazione di un nuovo ticket.',
        'Activity Dialog' => 'messaggio dell\'attività',
        'Activity dialog Name' => 'Nome per messaggio dell\'attività',
        'Available in' => 'Disponibile in',
        'Description (short)' => 'Descrizione (breve)',
        'Description (long)' => 'Descrizione (estesa)',
        'The selected permission does not exist.' => 'Il permesso selezionato non esiste.',
        'Required Lock' => 'Blocco richiesto',
        'The selected required lock does not exist.' => 'Il lock richiesto e selezionato non esiste.',
        'This field is required for activitiy dialogs with a scope.' => '',
        'Submit Advice Text' => 'Testo per i suggerimenti di invio',
        'Submit Button Text' => 'Testo per il bottone di invio',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Puoi assegnare campi a questo messaggio di attività trascinando gli elementi con il mouse dalla lista di sinistra a quella di destra.',
        'Available Fields' => 'Campi disponibili',
        'Filter available fields' => 'Filtro sui campi disponibili',
        'Assigned Fields' => 'Campi assegnati',
        'Filter assigned fields' => '',
        'Communication Channel' => 'Canale di comunicazione',
        'Is visible for customer' => 'È visibile per il cliente',
        'Text Template' => 'Modello di testo',
        'Auto fill' => '',
        'Display' => 'Mostra',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementPath.tt
        'Path' => 'percorso',
        'Edit this transition' => 'Modifica questa transizione',
        'Transition Actions' => 'Azioni di transizione',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Puoi assegnare azioni di transizione a questo transizione trascinando gli elementi con il mouse dalla lista di sinistra a quella di destra.',
        'Available Transition Actions' => 'Azioni di transizione disponibili',
        'Filter available Transition Actions' => 'Filtra sulle azioni di transizioni disponibili',
        'Create New Transition Action' => 'Crea nuova azione di transizione',
        'Assigned Transition Actions' => 'Azione di transizione assegnate',
        'Filter assigned Transition Actions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessAccordion.tt
        'Activities' => 'Attività',
        'Filter Activities...' => 'Filtra attività...',
        'Create New Activity' => 'Crea nuova attività...',
        'Filter Activity Dialogs...' => 'Filtra le interazioni dell\'attività',
        'Transitions' => 'Transizioni',
        'Filter Transitions...' => 'Filtra sulle transizioni...',
        'Create New Transition' => 'Crea Nuova Transizione',
        'Filter Transition Actions...' => 'Filtra sulle azioni di transizione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessEdit.tt
        'Print process information' => 'Stampa le informazioni del processo',
        'Delete Process' => 'Elimina processo',
        'Delete Inactive Process' => 'Elimina processo inattivo',
        'Available Process Elements' => 'Elementi di Processo disponibili',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Gli elementi presenti sopra questa barra possono essere spostati nel riquadro a destra trascinandoli.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Puoi immettere Attività nel riquadro per assegnare l\'Attività al Processo',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Per assegnare un messaggio di attività ad una attività trascinare il messaggio dalla barra sopra l\'attività nel riquadro.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            'È possibile avviare una connessione tra due attività rilasciando l\'elemento Transizione sull\'attività di avvio della connessione. Dopodiché puoi spostare l\'estremità libera della freccia su Fine attività.',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Le azioni possono essere assegnate ad una transizione trascinando l\'elemento sulla descrizione della trascrizione.',
        'Edit Process' => 'Modifica Processo',
        'Edit Process Information' => 'Modifica le informazioni del Processo',
        'Process Name' => 'Nome del Processo',
        'The selected state does not exist.' => 'Lo stato selezionato non esiste.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Aggiungi e modifica le attività, le interazioni delle attività e le transizioni',
        'Show EntityIDs' => 'Mostra gli identificativi EntityID',
        'Extend the width of the Canvas' => 'Aumenta la larghezza del riquadro',
        'Extend the height of the Canvas' => 'Aumenta l\'altezza del riquadro',
        'Remove the Activity from this Process' => 'Rimuovi l\'attività dal processo',
        'Edit this Activity' => 'Modifica questa attività',
        'Save Activities, Activity Dialogs and Transitions' => 'Salva attività, finestre di attività e transizioni',
        'Do you really want to delete this Process?' => 'Vuoi davvero eliminare questo processo?',
        'Do you really want to delete this Activity?' => 'Vuoi davvero eliminare questa attività?',
        'Do you really want to delete this Activity Dialog?' => 'Vuoi davvero eliminare questa finestra dell\'attività?',
        'Do you really want to delete this Transition?' => 'Vuoi davvero eliminare questa transizione?',
        'You can not edit a transition before it\'s connected to two activities.' =>
            '',
        'Do you really want to delete this Transition Action?' => 'Vuoi davvero eliminare questa azione di transizione?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Vuoi davvero rimuovere questa attività dal riquadro? Ciò può essere annullato solo uscendo dalla schermata senza salvare.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Vuoi davvero rimuovere questa transizione dal riquadro? Ciò può essere annullato solo uscendo dalla schermata senza salvare.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessNew.tt
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'In questa schermata puoi creare un nuovo processo. Per rendere il nuovo processo disponibile agli utenti, occorre mettere lo stato in \'Attivo\' ed effettuare la sincronizzazione al termine del lavoro.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessPrint.tt
        'Start Activity' => 'Avvia attività',
        'Contains %s dialog(s)' => 'Contiene %s finestra(e)',
        'Assigned dialogs' => 'Finestre assegnate',
        'Activities are not being used in this process.' => 'Le attività non sono utilizzate in questo processo.',
        'Assigned fields' => 'Campi assegnati',
        'Activity dialogs are not being used in this process.' => 'Le finestre di attività non sono utilizzate in questo processo.',
        'Condition linking' => 'Collegamento delle condizioni',
        'Transitions are not being used in this process.' => 'Le transizioni non sono utilizzate in questo processo.',
        'Module name' => 'Nome del modulo',
        'Configuration' => 'Configurazione',
        'Transition actions are not being used in this process.' => 'Le azioni di transizione non sono utilizzate in questo processo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransition.tt
        'Please note that changing this transition will affect the following processes' =>
            'Attenzione, i cambiamenti a questa transizione impattano sui seguenti processi',
        'Transition' => 'Transizione',
        'Transition Name' => 'Nome della Transizione',
        'This field is required for transitions with a scope.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransitionAction.tt
        'Please note that changing this transition action will affect the following processes' =>
            'Attenzione, i cambiamenti a questa azione di transizione impattano sui seguenti processi',
        'Transition Action' => 'Azione di Transizione',
        'Transition Action Name' => 'Nome dell\'azione di transizione',
        'Transition Action Module' => 'Modulo per l\'azione di transizione',
        'This field is required for transition actions with a scope.' => '',
        'Config Parameters' => 'parametri di configurazione',
        'Add a new Parameter' => 'Aggiungi un nuovo parametro',
        'Remove this Parameter' => 'Rimuovi questo parametro',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueue.tt
        'Add Queue' => 'Aggiungi coda',
        'Filter for Queues' => 'Filtri per le code',
        'Filter for queues' => 'Filtro per le code',
        'Email Addresses' => 'Indirizzi Email',
        'PostMaster Mail Accounts' => 'Account di posta PostMaster',
        'Salutations' => 'Formule di saluto',
        'Signatures' => 'Firme',
        'Templates ↔ Queues' => '',
        'Configure Working Hours' => '',
        'Configure Queue Related Settings' => '',
        'Edit Queue' => 'Modifica coda',
        'A queue with this name already exists!' => 'Una coda con questo nome esiste già!',
        'This queue is present in a SysConfig setting, confirmation for updating settings to point to the new queue is needed!' =>
            'Questa coda è presente in un\'impostazione SysConfig, è necessaria la conferma dell\'aggiornamento delle impostazioni per puntare alla nuova coda!',
        'Sub-queue of' => 'Sotto-coda di',
        'Follow up Option' => 'Opzioni per i follow-up',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Specifica se i follow-up ai ticket chiusi riaprono i ticket, vengono respinti o portano a un nuovo ticket.',
        'Unlock timeout' => 'Tempo di sblocco automatico',
        '0 = no unlock' => '0 = nessuno sblocco automatico',
        'hours' => 'ore',
        'Only business hours are counted.' => 'Sono considerate solo le ore lavorative.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Se un agente blocca un ticket e non lo chiude prima dello sblocco automatico, il ticket viene sbloccato e diventa disponibile per altri agenti.',
        'Notify by' => 'Notificato da',
        '0 = no escalation' => '0 = nessuna escalation',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Se non c\'è un nuovo contatto con il cliente, sia per email che per telefono per un ticket nuovo, prima che il tempo qui definito scada, il ticket viene scalato.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Se c\'è un articolo aggiunto, come un follow-up o il portale cliente, il tempo di aggiornamento di scalo viene azzerato. Se non c\'è un contatto con il cliente, sia per posta che per telefono, aggiunto al ticket prima che scada il tempo definito qui, il ticket viene scalato.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Se il ticket non viene impostato a chiuso prima che scada il tempo qui definito, il ticket viene scalato.',
        'Ticket lock after a follow up' => 'Blocco del ticket dopo una prosecuzione',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Se un ticket viene chiuso e il cliente invia un follow-up, il ticket sarà preso in carica dal vecchio proprietario.',
        'System address' => 'Indirizzo di sistema',
        'Will be the sender address of this queue for email answers.' => 'Sarà l’indirizzo del mittente di questa cosa per le risposte via email.',
        'Default sign key' => 'Chiave di default per le firme',
        'To use a sign key, PGP keys or S/MIME certificates need to be added with identifiers for selected queue system address.' =>
            'Per utilizzare una chiave di segno, è necessario aggiungere chiavi PGP o certificati S / MIME con identificatori per l\'indirizzo di sistema della coda selezionato.',
        'Salutation' => 'Saluto',
        'The salutation for email answers.' => 'Saluto (parte iniziale) per le email generate automaticamente dal sistema.',
        'Signature' => 'Firma',
        'The signature for email answers.' => 'Firma (parte finale) per le email generate automaticamente dal sistema.',
        'This queue is used in the following config settings:' => 'Questa coda viene utilizzata nelle seguenti impostazioni di configurazione:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueAutoResponse.tt
        'This filter allow you to show queues without auto responses' => 'Questo filtro ti consente di mostrare le code senza risposte automatiche',
        'Queues without Auto Responses' => 'Code senza risposte automatiche',
        'This filter allow you to show all queues' => 'Questo filtro ti consente di mostrare tutte le code',
        'Show All Queues' => 'Mostra tutte le code',
        'Auto Responses' => 'Risposte Automatiche',
        'Manage Queue-Auto Response Relations' => 'Gestisci relazioni Coda-Risposte automatiche',
        'Change Auto Response Relations for Queue' => 'Cambia le relazioni delle risposte automatiche con la coda',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueTemplates.tt
        'Filter for Templates' => 'Filtro per modelli',
        'Filter for templates' => 'Filtro per modelli',
        'Manage Template-Queue Relations' => 'Gestione relazioni Modelli-Code',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRole.tt
        'Add Role' => 'Aggiungi Ruolo',
        'Filter for Roles' => 'Filtri per i ruoli',
        'Filter for roles' => 'Filtro per ruoli',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Crea un ruolo e mettici i gruppi. Poi aggiungi il ruolo agli utenti.',
        'Agents ↔ Roles' => 'Agenti ↔ Ruoli',
        'Role Management' => 'Gestione ruoli',
        'Edit Role' => 'Modifica ruolo',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Non ci sono ruoli definiti. Usa il tasto Aggiungi per crearne uno nuovo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleGroup.tt
        'Roles' => 'Ruoli',
        'Manage Role-Group Relations' => 'Gestione relazioni ruolo-gruppo',
        'Select the role:group permissions.' => 'Seleziona i permessi ruolo:gruppo',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Se non si seleziona niente, non ci sono permessi in questo gruppo (i ticket non saranno disponibili per questo ruolo).',
        'Toggle %s permission for all' => 'Imposta il permesso %s per tutti',
        'move_into' => 'sposta_in',
        'Permissions to move tickets into this group/queue.' => 'Permessi per spostare i ticket in questo gruppo/coda.',
        'create' => 'crea',
        'Permissions to create tickets in this group/queue.' => 'Permessi per creare ticket in questo gruppo/coda.',
        'note' => 'Annotazioni',
        'Permissions to add notes to tickets in this group/queue.' => 'Permesso di aggiungere note ai ticket in questo gruppo/coda.',
        'owner' => 'gestore',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Permessi per cambiare il gestore dei ticket in questo gruppo/coda.',
        'priority' => 'priorità',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Autorizzazione a cambiare la priorità di un ticket in questo gruppo/coda.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleUser.tt
        'Add Agent' => 'Aggiungi agente',
        'Filter for Agents' => 'Filtra per agenti',
        'Filter for agents' => 'Filtro per agenti',
        'Agents' => 'Agenti',
        'Manage Agent-Role Relations' => 'Gestisci relazioni Agente-Ruolo',
        'Manage Role-Agent Relations' => 'Gestisci relazioni Ruolo-Agente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSLA.tt
        'Add SLA' => 'Aggiungi SLA',
        'Filter for SLAs' => 'Filtro per SLA',
        'Configure SLA Visibility and Defaults' => '',
        'SLA Management' => 'Gestione SLA',
        'Edit SLA' => 'Modifica SLA',
        'Please write only numbers!' => 'Usa solo numeri!',
        'Minimum Time Between Incidents' => 'Tempo minimo tra incidenti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIME.tt
        'SMIME support is disabled' => 'Il supporto SMIME è disabilitato',
        'To be able to use SMIME in Znuny, you have to enable it first.' =>
            'Per poter utilizzare SMIME in Znuny, devi prima abilitarlo.',
        'Enable SMIME support' => 'Abilita supporto SMIME',
        'Faulty SMIME configuration' => 'Configurazione SMIME non valida',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'Il supporto SMIME è abilitato, ma la relativa configurazione contiene errori. Si prega di verificare la configurazione usando il pulsante qui sotto',
        'Check SMIME configuration' => 'Controllo configurazione SMIME',
        'Add Certificate' => 'Aggiungi certificato',
        'Add Private Key' => 'Aggiunti chiave privata',
        'Filter for Certificates' => 'Filtro per certificati',
        'Filter for certificates' => 'Filtro per i certificati',
        'To show certificate details click on a certificate icon.' => 'Per mostrare i dettagli del certificato, fai clic sull\'icona del certificato.',
        'To manage private certificate relations click on a private key icon.' =>
            'Per gestire le relazione del certificato privato, fai clic sull\'icona di una chiave privata.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Qui puoi aggiungere relazioni al tuo certificato privato, che verranno incorporate nella firma S / MIME ogni volta che usi questo certificato per firmare un\'email.',
        'See also' => 'Vedi anche',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Puoi modificare il certificato e la chiave privata direttamente sul filesystem.',
        'S/MIME Management' => 'Gestione S/MIME',
        'Hash' => 'Puoi modificare il certificato e la chiave privata direttamente sul filesystem.',
        'Create' => 'Crea',
        'Handle related certificates' => 'Gestisci i certificati collegati',
        'Read certificate' => 'leggi il certificato',
        'Delete this certificate' => 'Elimina questo certificato',
        'File' => 'File',
        'Secret' => 'Segreto',
        'Related Certificates for' => 'Certificato collegato a',
        'Delete this relation' => 'Elimina questa relazione',
        'Available Certificates' => 'Certificati disponibili',
        'Filter for S/MIME certs' => 'Filtro per i certificati S/MIME',
        'Relate this certificate' => 'Collegati a questo certificato',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIMECertRead.tt
        'S/MIME Certificate' => 'Certificato S/MIME',
        'Close' => 'Chiudi',
        'Certificate Details' => 'Dettagli certificato',
        'Close this dialog' => 'Chiudere questa schermata',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSalutation.tt
        'Add Salutation' => 'Aggiungi saluto',
        'Filter for Salutations' => 'Filtro per i Saluti',
        'Filter for salutations' => 'Filtro per i saluti',
        'Salutation Management' => 'Gestione saluti',
        'Edit Salutation' => 'Modifica saluto',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSecureMode.tt
        'Secure Mode Needs to be Enabled!' => 'La modalità protetta deve essere abilitata!',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'La modalità sicura (normalmente) viene abilitata dopo il completamento installazione.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Se non è attivata la modalità sicura, attivarla tramite SySConfig perché il programma è già in esecuzione.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSelectBox.tt
        'Filter for Results' => 'Filtro per risultati',
        'Filter for results' => 'Filtra per risultati',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Qui è possibile inserire SQL per inviarlo direttamente al database dell\'applicazione. Non è possibile modificare il contenuto delle tabelle, sono consentite solo determinate query.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Qui è possibile inserire SQL per inviarlo direttamente al database.',
        'SQL Box' => 'script SQL',
        'Options' => 'Opzioni',
        'Only select queries are allowed.' => 'Sono consentite solo query di selezione.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'La sintassi della query SQL è sbagliata.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'C\'è almeno un parametro mancante per il binding. Controlla.',
        'Result format' => 'Formato dei risultati',
        'Run Query' => 'Esegui query',
        '%s Results' => '%s risultati',
        'Query is executed.' => 'La query è eseguita.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminService.tt
        'Add Service' => 'inserisci un servizio',
        'Configure Service Visibility and Defaults' => '',
        'Service Management' => 'Gestione Servizi',
        'Edit Service' => 'Modifica servizio',
        'Service name maximum length is 200 characters (with Sub-service).' =>
            'La lunghezza massima del nome del servizio è di 200 caratteri (con sottoservizio).',
        'Sub-service of' => 'Sotto-servizio di',
        'Criticality' => 'Urgenza',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSession.tt
        'All sessions' => 'Tutte le sessioni',
        'Agent sessions' => 'Sessioni agenti',
        'Customer sessions' => 'Sessioni clienti',
        'Unique agents' => 'Agenti unici',
        'Unique customers' => 'Clienti unici',
        'Kill all sessions' => 'termina tutte le sessioni',
        'Kill this session' => 'Termina questa sessione',
        'Filter for Sessions' => 'Filtra per sessioni',
        'Filter for sessions' => 'Filtra per sessioni',
        'Session Management' => 'Gestione Sessioni',
        'Detail Session View for %s (%s)' => 'Vista dettagli sessione per %s (%s)',
        'Session' => 'Sessione',
        'Kill' => 'Termina',
        'Detail View for SessionID: %s - %s' => 'Vista dettagli per SessionID: %s - %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSignature.tt
        'Add Signature' => 'Aggiungi firma',
        'Filter for Signatures' => 'Filtro per Firme',
        'Filter for signatures' => 'Filtro per firme',
        'Signature Management' => 'Gestione firme digitali',
        'Edit Signature' => 'Modifica firma',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminState.tt
        'Add State' => 'inserisci stato',
        'Filter for States' => 'Filtra per Stati',
        'Filter for states' => 'Filtra per stati',
        'Attention' => 'Attenzione',
        'Please also update the states in SysConfig where needed.' => 'Aggiorna anche gli stati in SysConfig, dove necessario.',
        'Configure State Visibility and Defaults' => '',
        'Configure State Type Visibility and Defaults' => '',
        'State Management' => 'Gestione Stati',
        'Edit State' => 'Modifica stato',
        'This state is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Questo stato è presente in un\'impostazione SysConfig, è necessaria una conferma per l\'aggiornamento delle impostazioni per puntare al nuovo tipo!',
        'State type' => 'Tipo di stato',
        'It\'s not possible to invalidate this entry because there is no other merge states in system!' =>
            'Non è possibile invalidare questa voce perché non ci sono altri stati di unione nel sistema!',
        'This field must be a hexadecimal color code.' => '',
        'This state is used in the following config settings:' => 'Questo stato viene utilizzato nelle seguenti impostazioni di configurazione:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSupportDataCollector.tt
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Un bundle di supporto (incluso: informazioni sulla registrazione del sistema, dati di supporto, un elenco di pacchetti installati e tutti i file di codice sorgente modificati localmente) può essere generato premendo questo pulsante:',
        'Generate Support Bundle' => 'Genera pacchetto di supporto',
        'The Support Bundle has been Generated' => 'Il pacchetto di supporto è stato generato',
        'A file containing the support bundle will be downloaded to the local system.' =>
            'Un file contenente il pacchetto di supporto verrà scaricato nel sistema locale.',
        'Support Data' => 'Dati di supporto',
        'Error: Support data could not be collected (%s).' => 'Errore: i dati di supporto non possono essere collezionati (%s).',
        'Support Data Collector' => 'Collezionatore dati di supporto',
        'Delete cache' => '',
        'Details' => 'Dettagli',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemAddress.tt
        'Add System Address' => 'Aggiungi indirizzo di sistema',
        'Filter for System Addresses' => 'Filtro per Indirizzi di Sistema',
        'Filter for system addresses' => 'Filtro per indirizzi di sistema',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Tutta la posta in entrata con questo indirizzo in A: o Cc: verrà inoltrata alla coda selezionata.',
        'System Email Addresses Management' => 'Gestione indirizzi Email di sistema',
        'Add System Email Address' => 'Aggiungi indirizzo email di sistema',
        'Edit System Email Address' => 'Modifica indirizzo email di sistema',
        'Email address' => 'Indirizzo email',
        'Display name' => 'Nome visibile',
        'This email address is already used as system email address.' => 'Questo indirizzo email è già utilizzato come indirizzo email di sistema.',
        'The display name and email address will be shown on mail you send.' =>
            'Il nome visualizzato e l\'indirizzo email verranno visualizzati sulle email inviate da qui.',
        'This system address cannot be set to invalid.' => 'Questo indirizzo di sistema non può essere impostato su non valido.',
        'This system address cannot be set to invalid, because it is used in one or more queue(s) or auto response(s).' =>
            'Questo indirizzo di sistema non può essere impostato su non valido, poiché viene utilizzato in una coda(e) o risposta(e) automatica.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfiguration.tt
        'online administrator documentation' => 'documentazione dell\'amministratore online',
        'System configuration' => 'Configurazione di sistema',
        'Navigate through the available settings by using the tree in the navigation box on the left side.' =>
            'Navigare attraverso le impostazioni disponibili utilizzando l\'albero nella casella di navigazione sul lato sinistro.',
        'Find certain settings by using the search field below or from search icon from the top navigation.' =>
            'Trova alcune impostazioni utilizzando il campo di ricerca in basso o dall\'icona di ricerca nella barra di navigazione in alto.',
        'Find out how to use the system configuration by reading the %s.' =>
            'Scopri come utilizzare la configurazione del sistema leggendo il %s.',
        'Search in all settings...' => 'Cerca in tutte le impostazioni ...',
        'There are currently no settings available. Please make sure to run \'znuny.Console.pl Maint::Config::Rebuild\' before using the software.' =>
            'Al momento non ci sono impostazioni disponibili. Assicurati di eseguire \'znuny.Console.pl Maint::Config::Rebuild\' prima di utilizzare il software.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationDeployment.tt
        'Help' => 'Aiuto',
        'This is an overview of all settings which will be part of the deployment if you start it now. You can compare each setting to its former state by clicking the icon on the top right.' =>
            'Questa è una panoramica di tutte le impostazioni che faranno parte dell\'attivazione che sta per effettuare. È possibile confrontare ogni impostazione con il suo stato precedente facendo clic sull\'icona in alto a destra.',
        'To exclude certain settings from a deployment, click the checkbox on the header bar of a setting.' =>
            'Per escludere alcune impostazioni dall\'attivazione, fare clic sulla casella di spunta nella barra di intestazione dell\'impostazione.',
        'By default, you will only deploy settings which you changed on your own. If you\'d like to deploy settings changed by other users, too, please click the link on top of the screen to enter the advanced deployment mode.' =>
            'In modo predefinito, verrano attivate solo le impostazioni cambiate da te. Per attivare impostazioni cambiate da altri utenti, fare clic sul link nella parte superiore dello schermo per passare alla modalità di attivazione avanzata.',
        'A deployment has just been restored, which means that all affected setting have been reverted to the state from the selected deployment.' =>
            'Una distribuzione è stata appena ripristinata, il che significa che tutte le impostazioni interessate sono state ripristinate allo stato dalla distribuzione selezionata.',
        'Please review the changed settings and deploy afterwards.' => 'Rivedere le impostazioni cambiate e attivare in seguito',
        'An empty list of changes means that there are no differences between the restored and the current state of the affected settings.' =>
            'Un elenco vuoto di modifiche significa che non ci sono differenze tra lo stato ripristinato e quello corrente delle impostazioni interessate.',
        'Changes Deployment' => 'Attivazione modifiche',
        'Changes Overview' => 'Panoramica delle modifiche',
        'There are %s changed settings which will be deployed in this run.' =>
            'Ci sono %s impostazioni cambiate che verranno attivate in questa esecuzione.',
        'Switch to basic mode to deploy settings only changed by you.' =>
            'Passare alla modalità base per attivare soltanto le impostazioni cambiate da te.',
        'You have %s changed settings which will be deployed in this run.' =>
            'Hai %s impostazioni cambiate che verranno attivate in questa esecuzione.',
        'Switch to advanced mode to deploy settings changed by other users, too.' =>
            'Passare alla modalità avanzata per attivare anche le impostazioni cambiate dagli altri utenti.',
        'There are no settings to be deployed.' => 'Non ci sono impostazioni da attivare.',
        'Switch to advanced mode to see deployable settings changed by other users.' =>
            'Passare alla modalità base per vedere le impostazioni attivabili cambiati dagli altri utenti.',
        'Deploy selected changes' => 'Attiva le modifiche selezionate',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationGroup.tt
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups.' =>
            'Questo gruppo non contiene alcuna impostazione. Prova a navigare in uno dei suoi sottogruppi.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationImportExport.tt
        'Import & Export' => 'Importa ed esporta',
        'Upload a file to be imported to your system (.yml format as exported from the System Configuration module).' =>
            'Carica un file da importare nel tuo sistema (formato .yml esportato dal modulo di configurazione del sistema).',
        'Upload system configuration' => 'Carica la configurazione del sistema',
        'Import system configuration' => 'Importa la configurazione del sistema',
        'Download current configuration settings of your system in a .yml file.' =>
            'Scarica le impostazioni di configurazione correnti del tuo sistema in un file .yml.',
        'Export current configuration' => 'Esporta la configurazione corrente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearch.tt
        'Search for' => 'Cercare',
        'Search for category' => 'Cerca per categoria',
        'Settings I\'m currently editing' => 'Impostazioni che sto modificando',
        'Your search for "%s" in category "%s" did not return any results.' =>
            'La tua ricerca di "%s" nella categoria "%s" non ha restituito alcun risultato.',
        'Your search for "%s" in category "%s" returned one result.' => 'La tua ricerca di "%s" nella categoria "%s" ha restituito un risultato.',
        'Your search for "%s" in category "%s" returned %s results.' => 'La tua ricerca di "%s" nella categoria "%s" tornò %s risultati.',
        'You\'re currently not editing any settings.' => 'Al momento non stai modificando alcuna impostazione.',
        'You\'re currently editing %s setting(s).' => 'Attualmente stai modificando %s impostazione(i).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationSearchDialog.tt
        'Category' => 'Categoria',
        'Run search' => 'Esegui ricerca',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationView.tt
        'Go back to Deployment Details' => 'Torna ai dettagli di attivazione',
        'View a custom List of Settings' => 'Visualizza un elenco personalizzato di impostazioni',
        'View single Setting: %s' => 'Visualizza impostazione singola: %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles.tt
        'System file support' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles/Widget.tt
        'Permissions' => 'Permessi',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenance.tt
        'Schedule New System Maintenance' => 'Pianifica nuova manutenzione di sistema',
        'Filter for System Maintenances' => 'Filtro per manutenzioni di sistema',
        'Filter for system maintenances' => 'Filtro per manutenzioni di sistema',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Pianifica un periodo di manutenzione del sistema per annunciare agli agenti e ai clienti che il sistema sarà non disponibile per un certo intervallo.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Qualche tempo prima dell\'inizio della manutenzione del sistema, gli utenti riceveranno una notifica su ogni schermata che annuncia questo fatto.',
        'System Maintenance Management' => 'Gestione delle manutenzioni del sistema',
        'Stop date' => 'Data di fine',
        'Delete System Maintenance' => 'Elimina manutenzione di sistema',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenanceEdit.tt
        'Edit System Maintenance' => 'Modifica manutenzione del sistema',
        'Edit System Maintenance Information' => 'Modifica le informazioni di manutenzione del sistema',
        'Date invalid!' => 'Data invalida!',
        'Login message' => 'Messaggio all\'accesso',
        'This field must have less then 250 characters.' => 'Questo campo deve contenere meno di 250 caratteri.',
        'Show login message' => 'Mostra messaggio all\'accesso',
        'Notify message' => 'Messaggio di notifica',
        'Manage Sessions' => 'Gestisci sessioni',
        'All Sessions' => 'Tutte le sessioni',
        'Agent Sessions' => 'Sessioni agente',
        'Customer Sessions' => 'Sessioni clienti',
        'Kill all Sessions, except for your own' => 'Termina tutte le sessioni, eccetto la tua',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplate.tt
        'Add Template' => 'Aggiungi modello',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Un modello è un testo predefinito che aiuta gli agenti a scrivere più velocemente ticket, risposte o inoltri.',
        'Don\'t forget to add new templates to queues.' => 'Non dimenticare di aggiungere nuovi modelli alle code.',
        'Template Management' => 'Gestione del modello',
        'Edit Template' => 'Modifica modello',
        'Attachments' => 'Allegati',
        'Delete this entry' => 'Elimina questa voce',
        'Do you really want to delete this template?' => 'Vuoi veramente cancellare questo modello?',
        'A standard template with this name already exists!' => 'Un modello standard con questo nome esiste già!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplateAttachment.tt
        'Manage Template-Attachment Relations' => 'Gestisci relazioni modello-allegato',
        'Toggle active for all' => 'Imposta attivo per tutti',
        'Link %s to selected %s' => 'Collega %s a %s selezionato',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTicketAttributeRelations.tt
        'Import CSV or Excel file' => '',
        'Ticket attribute relations' => '',
        'Add ticket attribute relations' => '',
        'Edit ticket attribute relations' => '',
        'Attribute' => 'Attributo',
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
        'Add Type' => 'Aggiungi tipo',
        'Filter for Types' => 'Filtro per Tipi',
        'Filter for types' => 'Filtro per tipi',
        'Configure Type Visibility and Defaults' => '',
        'Type Management' => 'Gestione tipologie',
        'Edit Type' => 'Modifica tipo',
        'A type with this name already exists!' => 'Un tipo con questo nome esiste già!',
        'This type is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            'Questo tipo è presente in un\'impostazione SysConfig, è necessaria una conferma per l\'aggiornamento delle impostazioni per puntare al nuovo tipo!',
        'This type is used in the following config settings:' => 'Questo tipo viene utilizzato nelle seguenti impostazioni di configurazione:',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUser.tt
        'Edit personal preferences for this agent' => 'Modifica le preferenze personali per questo agente.',
        'Agents will be needed to handle tickets.' => 'Gli agenti servono a gestire i ticket.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Non dimenticare di aggiungere un nuovo agente ai gruppi e/o ai ruoli!',
        'Agent Management' => 'Gestione agenti',
        'Edit Agent' => 'Modifica agente',
        'Please enter a search term to look for agents.' => 'Inserisci una chiave di ricerca per trovare gli agenti.',
        'Last login' => 'Ultimo accesso',
        'Switch to agent' => 'Passa all’agente',
        'Title or salutation' => 'Titolo o formula di saluto',
        'Firstname' => 'Nome',
        'Lastname' => 'Cognome',
        'A user with this username already exists!' => 'Un utente con questo nome esiste già!',
        'Will be auto-generated if left empty.' => 'Sarà generato automaticamente se lasciato vuoto.',
        'Mobile' => 'Cellulare',
        'Effective Permissions for Agent' => 'Permessi in vigore per agente',
        'This agent has no group permissions.' => 'Questo agente non ha permessi di gruppo.',
        'Table above shows effective group permissions for the agent. The matrix takes into account all inherited permissions (e.g. via roles).' =>
            'La tabella sopra mostra i permessi di gruppo efficaci per l\'agente. La matrice tiene conto di tutti i permessi ereditari (ad es. Tramite ruoli).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUserGroup.tt
        'Manage Agent-Group Relations' => 'Gestisci relazioni Agentge-Gruppo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentAgendaOverview.tt
        'Agenda Overview' => 'Panoramica dell\'Agenda',
        'Manage Calendars' => 'Amministrazione Calendari',
        'Add Appointment' => 'Aggiungi Evento',
        'Today' => 'Oggi',
        'All-day' => 'Giorno intero',
        'Repeat' => 'Ripetizione',
        'Notification' => 'Notifica',
        'Yes' => 'Sì',
        'No' => 'No',
        'No calendars found. Please add a calendar first by using Manage Calendars page.' =>
            'Nessun calendario trovato. Si prega di aggiungere in primis un calendario utilizzando la pagina di Gestione dei calendari.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentCalendarOverview.tt
        'Add new Appointment' => 'Aggiungi nuovo appuntamento',
        'Appointments' => '',
        'Calendars' => 'Calendari',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentEdit.tt
        'Basic information' => 'Informazioni di base',
        'Date/Time' => 'Data/ora',
        'Invalid date!' => 'Data non valida!',
        'Please set this to value before End date.' => 'Si prega di impostare questo valore prima della data di fine.',
        'Please set this to value after Start date.' => 'Si prega di impostare questo valore dopo la data di inizio.',
        'This an occurrence of a repeating appointment.' => 'Questo è il verificarsi di un appuntamento ricorrente.',
        'Click here to see the parent appointment.' => 'Clicca qui per vedere l\'appuntamento dei genitori.',
        'Click here to edit the parent appointment.' => 'Fai clic qui per modificare l\'appuntamento principale.',
        'Frequency' => 'Frequenza',
        'Every' => 'Ogni',
        'day(s)' => 'giorno(i)',
        'week(s)' => 'settimana(e)',
        'month(s)' => 'mese(i)',
        'year(s)' => 'anno(i)',
        'On' => 'Acceso',
        'Monday' => 'Lunedì',
        'Mon' => 'Lun',
        'Tuesday' => 'Martedì',
        'Tue' => 'Mar',
        'Wednesday' => 'Mercoledì',
        'Wed' => 'Mer',
        'Thursday' => 'Giovedì',
        'Thu' => 'Gio',
        'Friday' => 'Venerdì',
        'Fri' => 'Ven',
        'Saturday' => 'Sabato',
        'Sat' => 'Sab',
        'Sunday' => 'Domenica',
        'Sun' => 'Dom',
        'January' => 'Gennaio',
        'Jan' => 'Gen',
        'February' => 'Febbraio',
        'Feb' => 'Feb',
        'March' => 'Marzo',
        'Mar' => 'Mar',
        'April' => 'Aprile',
        'Apr' => 'Apr',
        'May_long' => 'Maggio',
        'May' => 'Mag',
        'June' => 'Giugno',
        'Jun' => 'Giu',
        'July' => 'Luglio',
        'Jul' => 'Lug',
        'August' => 'Agosto',
        'Aug' => 'Ago',
        'September' => 'Settembre',
        'Sep' => 'Set',
        'October' => 'Ottobre',
        'Oct' => 'Ott',
        'November' => 'Novembre',
        'Nov' => 'Nov',
        'December' => 'Dicembre',
        'Dec' => 'Dic',
        'Relative point of time' => 'Punto di tempo relativo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenter.tt
        'Customer Information Center' => 'Centro informazioni clienti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenterSearch.tt
        'Customer User' => 'Utenza clienti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerTableView.tt
        'Note: Customer is invalid!' => 'Nota: il cliente non è valido!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBook.tt
        'Customer User Address Book' => 'Rubrica utenze clienti',
        'Search for recipients and add the results as \'%s\'.' => 'Cerca i destinatari e aggiungi i risultati come \'%s\'.',
        'Search template' => 'Modello di ricerca',
        'Create Template' => 'Crea modello',
        'Create New' => 'Crea nuovo',
        'Save changes in template' => 'Salva modifiche al template',
        'Filters in use' => 'Filtri in uso',
        'Additional filters' => 'Filtri aggiuntivi',
        'Add another attribute' => 'Aggiungi un altro attributo',
        'The attributes with the identifier \'(Customer)\' are from the customer company.' =>
            'Gli attributi con l\'identificatore \'(Cliente)\' provengono dalla società del cliente.',
        '(e. g. Term* or *Term*)' => '(es. Termine* o *Termine*)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverview.tt
        'The customer user is already selected in the ticket mask.' => 'L\'utenza cliente è già selezionato nella maschera del ticket.',
        'Select this customer user' => 'Seleziona questa utenza cliente',
        'Add selected customer user to' => 'Aggiungi l\'utenza cliente selezionato a',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverviewNavBar.tt
        'Change search options' => 'Modifica le opzioni di ricerca',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserInformationCenter.tt
        'Customer User Information Center' => 'Centro informazioni utenze dei clienti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDaemonInfo.tt
        'The Znuny Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Znuny Daemon è un processo demone che esegue operazioni asincrone, ad es. trigger dell\'escalation dei ticket, invio delle email, ecc.',
        'A running Znuny Daemon is mandatory for correct system operation.' =>
            'Un Znuny Daemon in esecuzione è obbligatorio per una corretta operatività del sistema.',
        'Starting the Znuny Daemon' => 'Avvio di Znuny Daemon',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the Znuny Daemon is running and start it if needed.' =>
            'Assicurati che il file \'%s\' esiste (senza estensione .dist). Questo cron job controllerà ogni 5 minuti se il Demone Znuny è in esecuzione e lo avvierà se necessario.',
        'Execute \'%s start\' to make sure the cron jobs of the \'znuny\' user are active.' =>
            'Esecuzione \'%s avviata\' per assicurarsi che i lavori cron dell\'utente\' otrs \'siano attivi.',
        'After 5 minutes, check that the Znuny Daemon is running in the system (\'bin/znuny.Daemon.pl status\').' =>
            'Dopo 5 minuti, controlla che Znuny Daemon sia in esecuzione nel sistema (\'bin/znuny.Daemon.pl status\').',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboard.tt
        'Dashboard' => 'Cruscotto',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardAppointmentCalendar.tt
        'New Appointment' => 'Nuovo appuntamento',
        'Tomorrow' => 'Domani',
        'Soon' => 'Presto',
        '5 days' => '5 giorni',
        'Start' => 'Inizio',
        'none' => 'nessuno',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCalendarOverview.tt
        'in' => 'in',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCommon.tt
        'All' => 'Tutti',
        'Search inactive widgets' => '',
        'Active Widgets' => '',
        'Save changes' => '',
        'Close this widget' => '',
        'Hide' => '',
        'more' => 'altro',
        'No Data Available.' => '',
        'Available Columns' => 'Colonne disponibili',
        'Visible Columns (order by drag & drop)' => 'Colonne visibili (ordina con trascinamento e rilascio)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDList.tt
        'Change Customer Relations' => 'Cambia le relazioni con il cliente',
        'Open' => 'Aperto',
        'Closed' => 'Chiuso',
        'Phone ticket' => 'Ticket da Telefonata',
        'Email ticket' => 'Ticket da Email',
        '%s open ticket(s) of %s' => '%s ticket aperti su %s',
        '%s closed ticket(s) of %s' => '%s ticket chiusi su %s',
        'New phone ticket from %s' => 'Nuovo Ticket telefonico da %s',
        'New email ticket to %s' => 'Nuovo Ticket via email da %s',
        'Edit customer ID' => 'Modifica ID cliente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDStatus.tt
        'Escalated tickets' => 'Tickets scaduti',
        'Open tickets' => 'Ticket aperti',
        'Closed tickets' => 'Ticket chiusi',
        'All tickets' => 'Tutti i ticket',
        'Archived tickets' => 'Ticket archiviati',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserInformation.tt
        'Note: Customer User is invalid!' => 'Nota: utenza cliente non valida!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserList.tt
        'Customer user information' => 'Informazioni utenza cliente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardMyLastChangedTickets.tt
        'No tickets found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardRSSOverview.tt
        'Posted %s ago.' => 'Inviato %s giorni fa.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardStats.tt
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'La configurazione per questo widget statistico contiene errori, si prega di rivedere le impostazioni.',
        'Download as SVG file' => 'Scarica come file SVG',
        'Download as PNG file' => 'Scarica come file PNG',
        'Download as CSV file' => 'Scarica come file CSV',
        'Download as Excel file' => 'Scarica come file Excel',
        'Download as PDF file' => 'Scarica come file PDF',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Seleziona un formato di uscita grafico valido nella configurazione di questo widget.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Il contenuto di questa statistica è in preparazione per te, per favore sii paziente.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Questa statistica al momento non può essere utilizzata perché la sua configurazione deve essere corretta dall\'amministratore delle statistiche.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketGeneric.tt
        'Show' => 'Visualizza',
        'Assigned to customer user' => 'Assegnato a utenza cliente',
        'Accessible for customer user' => 'Accessibile per utenza cliente',
        'My locked tickets' => 'Ticket bloccati da me',
        'My owned tickets' => '',
        'My watched tickets' => 'Ticket osservati da me',
        'My responsibilities' => 'Mie responsabilità',
        'Tickets in My Queues' => 'Ticket nelle mie code',
        'Tickets in My Services' => 'Ticket nei miei servizi',
        'Service Time' => 'Tempo di servizio',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketQueueOverview.tt
        'Total' => 'Totale',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOnline.tt
        'out of office' => 'fuori sede',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOutOfOffice.tt
        'until' => 'Fino a',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentInfo.tt
        'To accept some news, a license or some changes.' => 'Accettare delle news, una licenza o dei cambiamenti.',
        'Yes, accepted.' => 'Sì, accettato',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentLinkObject.tt
        'Manage links for %s' => 'Gestisci collegamenti per %s',
        'Close and Back' => '',
        'Create new links' => 'Crea nuovi collegamenti',
        'Manage existing links' => 'Gestisci collegamenti esistenti',
        'Link with' => 'Collegamento con',
        'Start search' => 'Inizia la ricerca',
        'There are currently no links. Please click \'Create new Links\' on the top to link this item to other objects.' =>
            'Al momento non ci sono collegamenti. Fai clic su \'Crea nuovi collegamenti\' in alto per collegare questo oggetto ad altri oggetti.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferences.tt
        'Preferences' => 'Preferenze',
        'Please note: you\'re currently editing the preferences of %s.' =>
            'Nota: al momento stai modificando le preferenze di %s.',
        'Go back to editing this agent' => 'Torna alla modifica di questo agente',
        'Set up your personal preferences. Save each setting by clicking the checkmark on the right.' =>
            'Imposta le tue preferenze personali. Salvare ciascuna impostazione facendo clic sul segno di spunta sulla destra.',
        'You can use the navigation tree below to only show settings from certain groups.' =>
            'È possibile utilizzare la struttura di navigazione in basso per mostrare solo le impostazioni di determinati gruppi.',
        'Dynamic Actions' => 'Azioni dinamiche',
        'Filter settings...' => 'Impostazioni filtro...',
        'Filter for settings' => 'Filtro per impostazioni',
        'Save all settings' => 'Salva tutte le impostazioni',
        'Edit your preferences' => 'Modifica preferenze',
        'Personal Preferences' => 'Preferenze personali',
        'Avatars have been disabled by the system administrator. You\'ll see your initials instead.' =>
            'Gli avatar sono stati disabilitati dall\'amministratore di sistema. Vedrai invece le tue iniziali.',
        'You can change your avatar image by registering with your email address %s at %s. Please note that it can take some time until your new avatar becomes available because of caching.' =>
            'Puoi cambiare l\'immagine dell\'avatar registrandoti con il tuo indirizzo email %s a %s. Tieni presente che potrebbe trascorrere del tempo prima che il tuo nuovo avatar diventi disponibile a causa della memorizzazione nella cache.',
        'Off' => 'Spento',
        'End' => 'Fine',
        'Left' => 'Sinistra',
        'The horizontal distance of the window relative to the screen, in pixels.' =>
            '',
        'Top' => '',
        'The vertical distance of the window relative to the screen, in pixels.' =>
            '',
        'Width' => '',
        'Width in pixels or percent.' => '',
        'Height' => '',
        'Height in pixels or percent.' => '',
        'This setting can currently not be saved.' => 'Questa impostazione al momento non può essere salvata.',
        'This setting can currently not be saved' => 'Questa impostazione al momento non può essere salvata',
        'Save setting' => '',
        'Save this setting' => 'Salva questa impostazione',
        'Did you know? You can help translating Znuny at %s.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentPreferencesOverview.tt
        'Choose from the groups on the left to find the settings you\'d wish to change.' =>
            '',
        'Did you know?' => 'Lo sapevate?',
        'You can change your avatar by registering with your email address %s on %s' =>
            'Puoi cambiare il tuo avatar registrandoti con il tuo indirizzo email %s su %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentSplitSelection.tt
        'Target' => 'Obbiettivo',
        'Process' => 'Processo',
        'Split' => 'Dividi',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsAdd.tt
        'Statistics Management' => 'Gestione delle statistiche',
        'Add Statistics' => 'Aggiungi statistiche',
        'Dynamic Matrix' => 'Matrice dinamica',
        'Each cell contains a singular data point.' => 'Ogni cella contiene un punto dati singolare.',
        'Dynamic List' => 'Elenco dinamico',
        'Each row contains data of one entity.' => 'Ogni riga contiene i dati di un\'entità.',
        'Static' => 'Statico',
        'Non-configurable complex statistics.' => 'Statistiche complesse non configurabili.',
        'General Specification' => 'Specifiche generali',
        'Create Statistic' => 'Crea statistica',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsEdit.tt
        'Run now' => 'Esegui ora',
        'Edit Statistics' => 'Modifica statistiche',
        'Statistics Preview' => 'Anteprima statistiche',
        'Save Statistic' => 'Salva Statistica',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsImport.tt
        'Import Statistics' => 'Statistiche di importazione',
        'Import Statistics Configuration' => 'Importa configurazione statistiche',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsOverview.tt
        'Statistics' => 'Statistiche',
        'Edit statistic "%s".' => 'Modifica la statistica "%s".',
        'Export statistic "%s"' => 'Esporta statistica "%s"',
        'Export statistic %s' => 'Esporta statistica %s',
        'Delete statistic %s' => 'Elimina la statistica %s',
        'Do you really want to delete this statistic?' => 'Vuoi davvero eliminare questa statistica?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsView.tt
        'Statistics Information' => 'Informazioni statistiche',
        'Created by' => 'Creato da',
        'Changed by' => 'Modificato da',
        'Sum rows' => 'Somma le righe',
        'Sum columns' => 'somma le colonne',
        'Show as dashboard widget' => 'Mostrare come widget nel cruscotto',
        'Cache' => 'Cache',
        'Statistics Overview' => 'Panoramica delle statistiche',
        'View Statistics' => 'Visualizza statistiche',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Questa statistica contiene errori di configurazione e al momento non può essere utilizzata.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketActionCommon.tt
        'Change Free Text of %s%s%s' => 'Cambia testo libero di %s%s%s',
        'Change Owner of %s%s%s' => 'Cambia proprietario di %s%s%s',
        'Close %s%s%s' => 'Chiudi %s%s%s',
        'Add Note to %s%s%s' => 'Aggiungi note a %s%s%s',
        'Set Pending Time for %s%s%s' => 'Imposta tempo di attesa per %s%s%s',
        'Change Priority of %s%s%s' => 'Cambia priorità di %s%s%s',
        'Change Responsible of %s%s%s' => 'Responsabile del cambiamento di %s%s%s',
        'The ticket has been locked' => 'Il ticket è stato bloccato',
        'Ticket Settings' => 'Impostazioni dei ticket',
        'Service invalid.' => 'Servizio non valido.',
        'SLA invalid.' => 'SLA non valido.',
        'Team Data' => '',
        'Queue invalid.' => 'Coda non valida.',
        'New Owner' => 'Nuovo Gestore',
        'Please set a new owner!' => 'Imposta un nuovo proprietario!',
        'Owner invalid.' => 'Proprietario non valido.',
        'New Responsible' => 'Nuovo responsabile',
        'Please set a new responsible!' => 'Impostare un nuovo responsabile!',
        'Responsible invalid.' => 'Responsabile non valido.',
        'Ticket Data' => '',
        'Next state' => 'Stato successivo',
        'State invalid.' => 'Stato non valido.',
        'For all pending* states.' => 'Per tutti gli stati* in sospeso.',
        'Dynamic Info' => '',
        'Add Article' => 'Aggiungi articolo',
        'Inform' => '',
        'Inform agents' => 'Informa agenti',
        'Inform involved agents' => 'Informa agenti coinvolti',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Qui è possibile selezionare gli altri agenti che dovrebbero ricevere una notifica relativa al nuovo articolo.',
        'Text will also be received by' => 'Il testo sarà ricevuto anche da',
        'Communications' => '',
        'Create an Article' => 'Crea un articolo',
        'Setting a template will overwrite any text or attachment.' => 'L\'impostazione di un modello sovrascriverà qualsiasi testo o allegato.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBounce.tt
        'Bounce %s%s%s' => 'Rimbalzo %s%s%s',
        'cancel' => '',
        'Bounce to' => 'Rispedisci a',
        'You need a email address.' => 'È necessario un indirizzo email.',
        'Need a valid email address or don\'t use a local email address.' =>
            'È necessario un indirizzo email valido o non usare un indirizzo email locale.',
        'Next ticket state' => 'Stato successivo del ticket',
        'Inform sender' => 'Informa il mittente',
        'Send mail' => 'Invia messaggio',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBulk.tt
        'Ticket Bulk Action' => 'Azioni multiple',
        'Send Email' => 'Invia Email',
        'Merge' => 'Unisci',
        'Merge to' => 'Unisci a',
        'Invalid ticket identifier!' => 'Identificatore ticket non valido!',
        'Merge to oldest' => 'Unisci a precedente',
        'Link together' => 'Collega',
        'Link to parent' => 'Collega a genitore',
        'Unlock tickets' => 'Sblocca ticket',
        'Watch tickets' => '',
        'Mark tickets as seen' => '',
        'Mark tickets as unseen' => '',
        'Execute Bulk Action' => 'Esegui l\'azione in blocco',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCompose.tt
        'Compose Answer for %s%s%s' => 'Componi risposta per %s%s%s',
        'Date Invalid!' => 'Data non valida!',
        'Select one or more recipients from the customer user address book.' =>
            'Seleziona uno o più destinatari dalla rubrica dell\'utenza cliente.',
        'Customer user address book' => 'Rubrica utenze clienti',
        'This address is registered as system address and cannot be used: %s' =>
            'Questo indirizzo è registrato come indirizzo di sistema e non può essere utilizzato: %s',
        'Please include at least one recipient' => 'Includere almeno un destinatario',
        'Remove Ticket Customer' => 'Rimuovi ticket del cliente',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Rimuovere i valori ed immetterne di validi',
        'This address already exists on the address list.' => 'Questo indirizzo esiste già nell\'elenco.',
        'Remove Cc' => 'Rimuovi Cc',
        'Bcc' => 'Ccn',
        'Remove Bcc' => 'Rimuovi Ccn',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCustomer.tt
        'Change Customer of %s%s%s' => 'Cambia cliente di %s%s%s',
        'Customer Information' => 'Informazioni cliente',
        'Customer user' => 'Utenza cliente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmail.tt
        'Create New Email Ticket' => 'Crea nuovo ticket email',
        'Example Template' => 'Modello di esempio',
        'To customer user' => 'Alla utenza cliente',
        'Please include at least one customer user for the ticket.' => 'Includere almeno una utenza cliente per il ticket.',
        'Select this customer as the main customer.' => 'Seleziona questo cliente come cliente principale.',
        'Remove Ticket Customer User' => 'Rimuovi utenza cliente dal ticket',
        'From queue' => 'Dalla coda',
        'Get all' => 'Prendi tutto',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailOutbound.tt
        'Outbound Email for %s%s%s' => 'Messaggio di posta in uscita per %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailResend.tt
        'Resend Email for %s%s%s' => 'Reinvia email per %s%s%s',
        'All fields marked with an asterisk (*) are mandatory.' => 'Tutti i campi marcati con un asterisco (*) sono obbligatori.',
        'Cancel & close' => 'Annulla e chiudi',
        'Undo & close' => 'Annulla e chiudi',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEscalation.tt
        'Ticket %s: first response time is over (%s/%s)!' => 'Ticket %s: il tempo di prima risposta è scaduto (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Ticket %s: il tempo di prima risposta scadrà tra %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Ticket %s : tempo di aggiornamento scaduto (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Ticket %s: il tempo di aggiornamento scadrà tra %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Ticket %s : tempo di soluzione scaduto (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Ticket %s: il tempo di soluzione scadrà tra %s/%s!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketForward.tt
        'Forward %s%s%s' => 'Inoltrare %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketHistory.tt
        'History of %s%s%s' => 'Storia di %s%s%s',
        'Start typing to filter...' => '',
        'Filter for history items' => 'Filtro per elementi cronologici',
        'Expand/Collapse all' => '',
        'CreateTime' => 'CreateTime',
        'Article' => 'Articolo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMerge.tt
        'Merge %s%s%s' => 'Unisci %s%s%s',
        'Merge Settings' => 'Impostazioni di unione',
        'Try typing part of the ticket number or title in order to search by it.' =>
            'Prova a digitare parte del numero o del titolo del ticket per cercarlo.',
        'You need to use a ticket number!' => 'Devi usare un numero di ticket!',
        'A valid ticket number is required.' => 'Serve un numero ticket valido.',
        'Limit the search to tickets with same Customer ID (%s).' => 'Limita la ricerca ai ticket con lo stesso ID cliente (%s).',
        'Inform Sender' => 'Informa mittente',
        'Need a valid email address.' => 'Serve un indirizzo email valido',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMove.tt
        'Move %s%s%s' => 'Muove %s%s%s',
        'New Queue' => 'Nuova coda',
        'Communication' => 'Comunicazione',
        'Move' => 'Sposta',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketNoteToLinkedTicket.tt
        'Add note to linked %s%s%s' => '',
        'Notes' => '',
        'Note to linked Ticket' => '',
        'LinkList invalid.' => '',
        'Note to origin Ticket' => '',
        'NoteToTicket invalid.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewMedium.tt
        'No ticket data found.' => 'Non sono stati trovati dati ticket.',
        'Open / Close ticket action menu' => '',
        'Select this ticket' => '',
        'Sender' => 'Mittente',
        'Customer User Name' => 'Nome utenza cliente',
        'Impact' => 'Impatto',
        'Update Time' => 'Tempo per aggiornamento',
        'Solution Time' => 'Tempo per soluzione',
        'First Response Time' => 'Tempo iniziale per risposta',
        'Move ticket to a different queue' => 'Sposta il ticket ad una coda differente',
        'Change queue' => 'Cambia coda',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewNavBar.tt
        'Remove active filters for this screen.' => 'Rimuovi i filtri attivi per questa schermata.',
        'Clear all filters' => '',
        'Remove mention' => '',
        'Remove from list of watched tickets' => 'Rimuovere dalla lista di ticket osservati',
        'Tickets per page' => 'Numero di ticket per pagina',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewPreview.tt
        'Missing channel' => 'Canale mancante',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewSmall.tt
        'Reset overview' => 'Ripristina panoramica',
        'Column Filters Form' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhone.tt
        'Split Into New Phone Ticket' => 'Dividi in nuovo ticket telefonico',
        'Create New Phone Ticket' => 'Crea nuovo ticket telefonico',
        'Please include at least one customer for the ticket.' => 'Si prega di includere almeno un cliente per il ticket.',
        'To queue' => 'Alla coda',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhoneCommon.tt
        'Phone Call for %s%s%s' => 'Telefonata per %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPlain.tt
        'View Email Plain Text for %s%s%s' => 'Visualizza e-mail testo semplice per %s%s%s',
        'Plain' => 'Testo nativo',
        'Download this email' => 'Scarica questa email',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcess.tt
        'Create New Process Ticket' => 'Crea nuovo ticket con processo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcessSmall.tt
        'Enroll Ticket into a Process' => 'Iscriviti al ticket in un processo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketSearch.tt
        'Profile link' => 'Collegamento a profilo',
        'Output' => 'Tipo di risultato',
        'Fulltext' => 'Testo libero',
        'Customer ID (complex search)' => 'ID cliente (ricerca complessa)',
        '(e. g. 234*)' => '(e. g. 234*)',
        'Customer ID (exact match)' => 'ID cliente (ricerca complessa)',
        'Assigned to Customer User Login (complex search)' => 'Assegnato al login utenza cliente (ricerca complessa)',
        '(e. g. U51*)' => '(e. g. U51*)',
        'Assigned to Customer User Login (exact match)' => 'Assegnato al login utenza cliente (corrispondenza esatta)',
        'Accessible to Customer User Login (exact match)' => 'Accessibile al login utenza cliente (corrispondenza esatta)',
        'Created in Queue' => 'Creata nella Coda',
        'Lock state' => 'Stato blocco',
        'Watcher' => 'Osservatore',
        'Article Create Time (before/after)' => 'Tempo di creazione articolo (prima/dopo)',
        'Article Create Time (between)' => 'Tempo di creazione articolo (in mezzo)',
        'Please set this to value before end date.' => 'Si prega di impostare questo valore prima della data di fine.',
        'Please set this to value after start date.' => 'Si prega di impostare questo valore dopo la data di inizio.',
        'Ticket Create Time (before/after)' => 'Tempo di creazione ticket (prima/dopo)',
        'Ticket Create Time (between)' => 'Tempo di creazione ticket (in mezzo)',
        'Ticket Change Time (before/after)' => 'Tempo di modifica ticket (prima/dopo)',
        'Ticket Change Time (between)' => 'Tempo di modifica ticket (in mezzo)',
        'Ticket Last Change Time (before/after)' => 'Ora ultima modifica ticket (prima/dopo)',
        'Ticket Last Change Time (between)' => 'Ora ultima modifica ticket (tra)',
        'Ticket Pending Until Time (before/after)' => 'Ticket in sospeso fino a ora (prima/dopo)',
        'Ticket Pending Until Time (between)' => 'Ticket in sospeso fino a ora (tra)',
        'Ticket Close Time (before/after)' => 'Tempo di chiusura ticket (prima/dopo)',
        'Ticket Close Time (between)' => 'Tempo di chiusura ticket (in mezzo)',
        'Ticket Escalation Time (before/after)' => 'Tempo di escalation del ticket (prima/dopo)',
        'Ticket Escalation Time (between)' => 'Tempo di escalation del ticket (tra)',
        'Archive Search' => 'Ricerca archivio',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom.tt
        'Sender Type' => 'Tipo mittente',
        'Save filter settings as default' => 'Salva impostazioni filtri come predefinite',
        'Event Type' => 'Tipo evento',
        'Save as default' => 'Salva come predefinito',
        'Drafts' => 'Bozze',
        'by' => 'da',
        'Change Queue' => 'Cambia coda',
        'There are no dialogs available at this point in the process.' =>
            'Non ci sono finestre di dialogo disponibili a questo punto nel processo.',
        'This item has no articles yet.' => 'Questo oggetto non ha ancora articoli',
        'Article Overview - %s Article(s)' => 'Panoramica dell\'articolo - %s Articolo(i)',
        'Page %s' => 'Pagina %s',
        'Add Filter' => 'Aggiungi filtro',
        'Set' => 'Impostazione',
        'Reset Filter' => 'Reimposta filtro',
        'No.' => 'Num.',
        'Unread articles' => 'Articoli non letti',
        'Via' => 'Attraverso',
        'Important' => 'Importante',
        'Unread Article!' => 'Articolo non letto!',
        'Incoming message' => 'Messaggio ricevuto',
        'Outgoing message' => 'messaggio in uscita',
        'Internal message' => 'messaggio interno',
        'Sending of this message has failed.' => 'L\'invio di questo messaggio non è riuscito.',
        'Resize' => 'Ridimensiona',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/Chat.tt
        '#%s' => '#%s',
        'via %s' => 'attaverso %s',
        'by %s' => 'da %s',
        'Toggle article details' => 'Attiva/disattiva i dettagli dell\'articolo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/ArticleRender/MIMEBase.tt
        'This message is being processed. Already tried to send %s time(s). Next try will be %s.' =>
            'Questo messaggio è in fase di elaborazione. Ho già provato a inviare %s volta(e). Il prossimo tentativo sarà %s.',
        'This message contains events' => '',
        'This message contains an event' => '',
        'Show more information' => '',
        'Start: %s, End: %s' => '',
        'Calendar events details' => '',
        'Calendar event details' => '',
        'To open links in the following article, you might need to press Ctrl or Cmd or Shift key while clicking the link (depending on your browser and OS).' =>
            'Per aprire i collegamenti nel seguente articolo, potrebbe essere necessario premere Ctrl o Cmd o Maiusc mentre si fa clic sul collegamento (a seconda del browser e del sistema operativo).',
        'Close this message' => 'Chiudi questo messaggio',
        'Image' => 'Immagine',
        'PDF' => 'PDF',
        'View' => 'Vista',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/LinkTable.tt
        'Linked Objects' => 'Oggetti collegati',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/MentionsTable.tt
        'Mentions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/TicketInformation.tt
        'Archive' => 'Archivio',
        'This ticket is archived.' => 'Questo ticket è stato archiviato.',
        'is invalid' => '',
        'Pending till' => 'In attesa fino a',
        'Locked' => 'Bloccato',
        'Accounted time' => 'Tempo addebitato',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ArticleContent/Invalid.tt
        'Preview of this article is not possible because %s channel is missing in the system.' =>
            'L\'anteprima di questo articolo non è possibile perché %s manca il canale nel sistema.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AttachmentBlocker.tt
        'To protect your privacy, remote content was blocked.' => 'Per proteggere la tua privacy, il contenuto remoto è stato bloccato.',
        'Load blocked content.' => 'Carica contenuto bloccato.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Breadcrumb.tt
        'Home' => 'Casa',
        'Back' => 'Precedente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Create.tt
        'Ticket Creation' => '',
        'Link' => 'Collega',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Link.tt
        'Remove entry' => 'Rimuovi voce',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt
        'Dear Customer,' => 'Caro cliente,',
        'thank you for using our services.' => 'grazie per aver utilizzato i nostri servizi.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerCompany/TicketCustomerIDSelection.tt
        'The customer ID is not changeable, no other customer ID can be assigned to this ticket.' =>
            'L\'ID cliente non è modificabile, nessun altro ID cliente può essere assegnato a questo ticket.',
        'First select a customer user, then you can select a customer ID to assign to this ticket.' =>
            'Prima seleziona un utenza cliente, quindi puoi selezionare un ID cliente da assegnare a questo ticket.',
        'Select a customer ID to assign to this ticket.' => 'Seleziona un ID cliente da assegnare a questo ticket.',
        'From all Customer IDs' => 'Da tutti gli ID cliente',
        'From assigned Customer IDs' => 'Dagli ID cliente assegnati',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerError.tt
        'Error' => 'Errore',
        'An Error Occurred' => 'Si è verificato un errore',
        'Traceback' => 'Dettaglio della tracciatura',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooter.tt
        'Powered by %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooterJS.tt
        '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '%s rilevato possibili problemi di rete. Puoi provare a ricaricare questa pagina manualmente o attendere fino a quando il tuo browser non ha ristabilito la connessione da solo.',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            'La connessione è stata ristabilita dopo una perdita temporanea della connessione. Per questo motivo, gli elementi di questa pagina potrebbero non funzionare più correttamente. Per poter riutilizzare correttamente tutti gli elementi, si consiglia vivamente di ricaricare questa pagina.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerHeader.tt
        'Edit personal preferences' => 'Modifica impostazioni personali',
        'Personal preferences' => 'Preferenze personali',
        'Logout' => 'Esci',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerLogin.tt
        'JavaScript Not Available' => 'JavaScript non disponibile',
        'In order to experience this software, you\'ll need to enable JavaScript in your browser.' =>
            'Per provare questo software, devi abilitare JavaScript nel tuo browser.',
        'Browser Warning' => 'Attenzione: browser non compatibile',
        'The browser you are using is too old.' => 'Il browser in uso è obsoleto.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.' =>
            'Questo software funziona con un enorme elenco di browser, per favore esegui l\'upgrade a uno di questi.',
        'Please see the documentation or ask your admin for further information.' =>
            'Consulta la documentazione o chiedi al tuo amministratore per ulteriori informazioni.',
        'One moment please, you are being redirected...' => 'Attendi un attimo, stai per essere rediretto...',
        'Login' => 'Accesso',
        'User name' => 'Nome utente',
        'Your user name' => 'Il suo user name',
        'Your password' => 'La sua password',
        'Forgot password?' => 'Password dimenticata?',
        '2 Factor Token' => '2 token fattore',
        'Your 2 Factor Token' => 'Tuo 2 token fattore',
        'Log In' => 'Accesso',
        'Request New Password' => 'Richiedi nuova password',
        'Your User Name' => 'Il tuo nome utente',
        'A new password will be sent to your email address.' => 'Una nuova password sarà inviata al tuo indirizzo email.',
        'Back to login' => 'Torna all\'accesso',
        'Create Account' => 'Registrati',
        'Please fill out this form to receive login credentials.' => 'Compila questo modulo per ricevere le credenziali di accesso.',
        'How we should address you' => 'Come chiamarla',
        'Your First Name' => 'Nome',
        'Your Last Name' => 'Cognome',
        'Your email address (this will become your username)' => 'Indirizzo email (diventerà il tuo username)',
        'Not yet registered?' => 'Non ancora registrato?',
        'Sign up now' => 'Registrazione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketMessage.tt
        'New Ticket' => 'Nuovo ticket',
        'Service level agreement' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketOverview.tt
        'Tickets' => 'Ticket',
        'Welcome!' => 'Benvenuto!',
        'Please click the button below to create your first ticket.' => 'Usa il pulsante qui sotto per creare il tuo primo ticket.',
        'Create your first ticket' => 'Crea il tuo primo ticket',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketProcess.tt
        'New Process Ticket' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearch.tt
        'Ticket Search' => '',
        'Profile' => 'Profilo',
        'Template Name' => 'Nome modello',
        'e. g. 10*5155 or 105658*' => 'es 10*5155 or 105658*',
        'CustomerID' => 'Codice cliente',
        'Types' => 'Tipi',
        'Limitation' => '',
        'No time settings' => 'Nessuna impostazione per il tempo',
        'Specific date' => 'Data specifica',
        'Only tickets created' => 'Solo ticket creati',
        'Date range' => 'Periodo',
        'Only tickets created between' => 'Solo ticket creati tra',
        'Ticket Archive System' => 'Sistema di archiviazione ticket',
        'Save Search as Template?' => 'Salva ricerca come modello?',
        'Save as Template' => 'Salva come modello',
        'Save as Template?' => 'Salvare come modello?',
        'Pick a profile name' => 'Scegli un profilo',
        'Output to' => 'Output',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearchResultShort.tt
        'Remove this Search Term.' => 'Rimuovi questo termine di ricerca.',
        'of' => 'di',
        'Page' => 'Pagina',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom.tt
        'Ticket Details' => '',
        'Next Steps' => 'Prossime attività',
        'Reply' => 'Risposta',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom/ArticleRender/Chat.tt
        'Expand article' => 'Espandi l\'articolo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerWarning.tt
        'Warning' => 'Attenzione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/DashboardEventsTicketCalendar.tt
        'Event Information' => 'Informazioni evento',
        'Ticket fields' => 'Campi ticket',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Error.tt
        'Error Details' => 'Dettagli dell\'errore',
        'Expand' => 'Espandi',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/AttachmentList.tt
        'Click to delete this attachment.' => 'Fai clic per eliminare questo allegato.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftButtons.tt
        'Update draft' => 'Aggiorna bozza',
        'Save as new draft' => 'Salva in bozza',

        # TT Template: Kernel/Output/HTML/Templates/Standard/FormElements/DraftNotifications.tt
        'You have loaded the draft "%s".' => 'Hai caricato la bozza "%s"',
        'You have loaded the draft "%s". You last changed it %s.' => 'Hai caricato la bozza "%s". L\'hai modificata per ultimo %s.',
        'You have loaded the draft "%s". It was last changed %s by %s.' =>
            'Hai caricato la bozza "%s". L\'ultima modifica è %s di %s.',
        'Please note that you have already one or more saved drafts for this action.' =>
            '',
        'Please note that this draft is outdated because the ticket was modified since this draft was created.' =>
            'Attenzione: questa bozza è obsoleta perché il ticket è stato modificato dopo che la bozza è stata creata.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Header.tt
        'Last viewed' => '',
        'You are logged in as' => 'Hai effettuato l\'accesso come',
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
        'JavaScript not available' => 'JavaScript non disponibile',
        'License' => 'Licenza',
        'Database Settings' => 'Impostazioni database',
        'General Specifications and Mail Settings' => 'Specifiche generiche ed impostazioni email',
        'Finish' => 'Fine',
        'Welcome to %s' => 'Benvenuto in %s',
        'Address' => 'Indirizzo',
        'Phone' => 'Telefono',
        'Web site' => 'Sito web',
        'Community' => '',
        'Next' => 'Successivo',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerConfigureMail.tt
        'Configure Outbound Mail' => 'Configura posta in uscita',
        'Outbound mail type' => 'Tipo di posta in uscita',
        'Select outbound mail type.' => 'Seleziona il tipo di posta in uscita.',
        'Outbound mail port' => 'Porta del server di posta in uscita',
        'Select outbound mail port.' => 'Seleziona la porta del server di posta in uscita.',
        'SMTP host' => 'Host SMTP',
        'SMTP host.' => 'Host SMTP.',
        'SMTP authentication' => 'Autenticazione SMTP',
        'Does your SMTP host need authentication?' => 'Serve autenticazione SMTP per questo host?',
        'SMTP auth user' => 'Utente per autenticazione SMTP',
        'Username for SMTP auth.' => 'Username per l\'autenticazione SMTP',
        'SMTP auth password' => 'Password per autenticazione SMTP',
        'Password for SMTP auth.' => 'Password per l\'autenticazione SMTP',
        'Configure Inbound Mail' => 'Configura posta in entrata',
        'Inbound mail type' => 'Tipo posta in entrata',
        'Select inbound mail type.' => 'Seleziona il tipo di posta in entrata.',
        'Inbound mail host' => 'Host di posta in entrata',
        'Inbound mail host.' => 'Host di posta in entrata',
        'Inbound mail user' => 'Host di posta in entrata',
        'User for inbound mail.' => 'Nome utente per la posta in entrata.',
        'Inbound mail password' => 'Password per la posta in entrata',
        'Password for inbound mail.' => 'Password per la posta in entrata',
        'Result of mail configuration check' => 'Risultato del controllo di configurazione della posta',
        'Check mail configuration' => 'Controllo configurazione della posta',
        'or' => 'oppure',
        'Skip this step' => 'Salta questo passaggio',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBResult.tt
        'Done' => 'Fatto',
        'Database setup successful!' => 'Configurazione database terminata con successo!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBStart.tt
        'Install Type' => 'Tipo di installazione',
        'Create a new database for Znuny' => 'Crea un nuovo database per Znuny',
        'Use an existing database for Znuny' => 'Usa un database esistente per Znuny',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmssql.tt
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Se hai impostato una password di root per il database inseriscila qui, altrimenti lascia il campo vuoto.',
        'Database name' => 'Nome del database',
        'Check database settings' => 'Controlla impostazioni database',
        'Result of database check' => 'Risultato del controllo database',
        'Database check successful.' => 'Controllo database eseguito con successo.',
        'Database User' => 'Utente del database',
        'New' => 'Nuovi',
        'A new database user with limited permissions will be created for this Znuny system.' =>
            'Verrà creato un nuovo database a permessi limitati per questo sistema Znuny',
        'Repeat Password' => 'Ripeti la password',
        'Generated password' => 'Password generata',
        'Database' => 'Database',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmysql.tt
        'Passwords do not match' => 'Le password non coincidono',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBoracle.tt
        'SID' => 'SID',
        'Port' => 'Porta',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerFinish.tt
        'To be able to use Znuny you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Per poter usare Znuny, devi inserire questa riga di comando in una shell come utente root.',
        'Restart your webserver' => 'Riavvia il tuo server web',
        'After doing so your Znuny is up and running.' => 'Dopo di ciò Znuny sarà pronto all\'uso.',
        'Start page' => 'Pagina iniziale',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerLicense.tt
        'Don\'t accept license' => 'Non accetto la licenza',
        'Accept license and continue' => 'Accetto la licenza e continua',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerSystem.tt
        'SystemID' => 'ID del sistema',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'L\'identificatore di questo sistema. Ogni numero di ticket e ogni ID di sessione HTTP contengono questo numero.',
        'System FQDN' => 'FQDN del sistema',
        'Fully qualified domain name of your system.' => 'Nome FQDN di questo sistema',
        'AdminEmail' => 'Admin Email',
        'Email address of the system administrator.' => 'Indirizzo dell\'amministratore di sistema.',
        'Organization' => 'Società',
        'Log' => 'Log',
        'LogModule' => 'Modulo di log',
        'Log backend to use.' => 'Backend di log da usare',
        'LogFile' => 'File di log',
        'Webfrontend' => 'Interfaccia web',
        'Default language' => 'Lingua di default',
        'Default language.' => 'Lingua di default.',
        'CheckMXRecord' => 'Controlli sui record MX',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Gli indirizzi scritti a mano vengono controllati tramite i record MX trovati nei DNS. Non usare questa opzione se il DNS usato dalla macchina è lento o non risolve gli indirizzi pubblici.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/LinkObject.tt
        'Delete link' => 'Elimina collegamenti',
        'Delete Link' => 'Elimina Collegamenti',
        'Object#' => 'Oggetto#',
        'Add links' => 'Aggiungi collegamenti',
        'Delete links' => 'Elimina collegamenti',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Login.tt
        'Lost your password?' => 'Hai dimenticato la password?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MetaFloater.tt
        'Scale preview content' => 'Ridimensiona il contenuto dell\'anteprima',
        'Open URL in new tab' => 'Apri l\'URL in una nuova scheda',
        'Close preview' => 'Chiude l’anteprima',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Non è possibile fornire un\'anteprima di questo sito Web perché non ha permesso di essere incorporato.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MobileNotAvailableWidget.tt
        'Feature not Available' => 'Funzionalità non Disponibile',
        'Sorry, but this feature of Znuny is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Siamo spiacenti, ma questa funzione di Znuny non è attualmente disponibile per i dispositivi mobili. Se desideri utilizzarlo, puoi passare alla modalità desktop o utilizzare il tuo normale dispositivo desktop.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Motd.tt
        'Message of the Day' => 'Motto del giorno',
        'This is the message of the day. You can edit this in %s.' => 'Questo è il messaggio del giorno. Puoi modificarlo in %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NoPermission.tt
        'Insufficient Rights' => 'Permessi insufficienti',
        'Back to the previous page' => 'Pagina precedente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NotificationEvent/Email/Alert.tt
        'Alert' => 'Mettere in guardia',
        'Powered by' => 'Fornito da',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Pagination.tt
        'Show first page' => 'Mostra prima pagina',
        'Show previous pages' => 'Mostra pagine precedenti',
        'Show page %s' => 'Mostra pagina %s',
        'Show next pages' => 'Mostra pagine successive',
        'Show last page' => 'Mostra ultima pagina',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PictureUpload.tt
        'Need FormID!' => 'FormID necessario!',
        'No file found!' => 'Nessun file trovato!',
        'The file is not an image that can be shown inline!' => 'Il file non è un\'immagine che può essere mostrata in linea!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PreferencesNotificationEvent.tt
        'No user configurable notifications found.' => 'Non sono state trovate notifiche configurabili dall\'utente.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Ricevi messaggi per notifica \'%s\' per metodo di trasporto\'%s\'.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/ActivityDialogHeader.tt
        'Process Information' => 'Informazioni processo',
        'Dialog' => 'Finestra',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/Article.tt
        'Inform Agent' => 'Informa agente',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PublicDefault.tt
        'Welcome' => 'Benvenuto',
        'This is the default public interface of Znuny! There was no action parameter given.' =>
            'Questa è l\'interfaccia pubblica predefinita di Znuny! Non è stato fornito alcun parametro di azione.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            'È possibile installare un modulo pubblico personalizzato (tramite il gestore pacchetti), ad esempio il modulo FAQ, che ha un\'interfaccia pubblica.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAppointmentNotificationEvent.tt
        'To get the appointment attribute' => 'Per recuperare l’attributo appuntamento',
        'e. g.' => 'ad es.',
        'To get the first 20 character of the appointment title.' => 'Usa i primi 20 caratteri dell\'oggetto.',
        'To get the calendar attribute' => 'Per ottenere l\'attributo calendario',
        'Attributes of the recipient user for the notification' => 'Attributi dell\'utente destinatario delle notifiche',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAutoResponse.tt
        'To get the first 20 character of the subject.' => 'Usa i primi 20 caratteri dell\'oggetto.',
        'To get the first 5 lines of the email.' => 'Usa le prime 5 righe dell\'email.',
        'To get the name of the ticket\'s customer user (if given).' => 'Per ottenere il nome dell’utenza cliente del ticket (se fornito).',
        'To get the article attribute' => 'Usa l\'attributo dell\'articolo',
        'Options of the current customer user data' => 'Opzioni dei dati dell’utenza cliente attuale',
        'Ticket owner options' => 'Operazioni proprietario ticket',
        'Options of the ticket data' => 'Opzioni dei dati del ticket',
        'Options of ticket dynamic fields internal key values' => 'Opzioni per i valori dei campi dinamici a livello di ticket',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Opzioni per i valori dei campi dinamici a livello di ticket, utili per i campi a tendina e a selezione multipla',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminNotificationEvent.tt
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Per avere i primi 20 caratteri mail - subject (agent)',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Per avere le prime 5 righe del corpo messaggio (dell\'ultimo articolo dell\'agente).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Per avere i primi 20 caratteri mail - subject (customer).',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Per avere le prime 5 righe corpo mail (customer).',
        'Attributes of the current customer user data' => 'Attributi dei dati utente del cliente attuale',
        'Attributes of the current ticket owner user data' => 'Attributi dei dati utente del proprietario del ticket corrente',
        'Attributes of the ticket data' => 'Attributi dei dati del ticket',
        'Ticket dynamic fields internal key values' => 'Valori chiave interni dei campi dinamici del ticket',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'I campi dinamici del ticket visualizzano valori, utili per i campi Dropdown e Multiselect',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminTemplate.tt
        'To get the first 20 characters of the subject of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'Per ottenere i primi 20 caratteri dell\'oggetto dell\'articolo agente corrente / più recente (corrente per risposta e inoltro, ultima per tipo di modello Nota). Questo tag non è supportato per altri tipi di modello.',
        'To get the first 5 lines of the body of the current/latest agent article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'Per ottenere le prime 5 righe del corpo dell\'articolo agente attuale / più recente (corrente per risposta e inoltro, ultima per tipo di modello Nota). Questo tag non è supportato per altri tipi di modello.',
        'To get the first 20 characters of the subject of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'Per ottenere i primi 20 caratteri dell\'oggetto dell\'articolo corrente / più recente (corrente per risposta e inoltro, ultima per il tipo di modello Nota). Questo tag non è supportato per altri tipi di modello.',
        'To get the first 5 lines of the body of the current/latest article (current for Answer and Forward, latest for Note template type). This tag is not supported for other template types.' =>
            'Per ottenere le prime 5 righe del corpo dell\'articolo corrente / più recente (corrente per Risposta e Inoltra, ultima per il tipo di modello Nota). Questo tag non è supportato per altri tipi di modello.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/Default.tt
        'Tag Reference' => 'Riferimento tag',
        'You can use the following tags' => 'Puoi usare i seguenti tag',
        'Ticket responsible options' => 'Operazione responsabile ticket',
        'Options of the current user who requested this action' => 'Opzioni dell\'utente corrente che ha richiesto questa azione',
        'Config options' => 'Opzioni di configurazione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/GeneralSpecificationsWidget.tt
        'You can select one or more groups to define access for different agents.' =>
            'Si può scegliere uno o più gruppi per definire l\'accesso a diversi agenti.',
        'Result formats' => 'Formati dei risultati',
        'Time Zone' => 'Fuso orario',
        'The selected time periods in the statistic are time zone neutral.' =>
            'I periodi di tempo selezionati nella statistica sono neutrali rispetto al fuso orario.',
        'Create summation row' => 'Crea riga di riepilogo',
        'Generate an additional row containing sums for all data rows.' =>
            'Genera una riga aggiuntiva contenente somme per tutte le righe di dati.',
        'Create summation column' => 'Crea colonna di riepilogo',
        'Generate an additional column containing sums for all data columns.' =>
            'Genera una colonna aggiuntiva contenente somme per tutte le colonne di dati.',
        'Cache results' => 'Risultato della ricerca',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            'Memorizza i dati dei risultati delle statistiche in una cache da utilizzare nelle viste successive con la stessa configurazione (richiede almeno un campo orario selezionato).',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Fornisci la statistica come widget che gli agenti possono attivare nel loro cruscotto.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Si noti che l\'attivazione del widget cruscotto attiverà la memorizzazione nella cache di questa statistica nel cruscotto.',
        'If set to invalid end users can not generate the stat.' => 'Se impostato a invalido gli utenti finali non possono generare la statistica.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/PreviewWidget.tt
        'There are problems in the configuration of this statistic:' => 'Ci sono problemi nella configurazione di questa statistica:',
        'You may now configure the X-axis of your statistic.' => 'Ora puoi configurare l\'asse X della tua statistica.',
        'This statistic does not provide preview data.' => 'Questa statistica non fornisce dati di anteprima.',
        'Preview format' => 'Formato anteprima',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Si noti che l\'anteprima utilizza dati casuali e non considera i filtri di dati.',
        'Configure X-Axis' => 'Configura asse X',
        'X-axis' => 'Asse X',
        'Configure Y-Axis' => 'Configura asse Y',
        'Y-axis' => 'Asse Y',
        'Configure Filter' => 'Configura filtro',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/RestrictionsWidget.tt
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Seleziona solo un elemento e togli \'Fisso\'.',
        'Absolute period' => 'Periodo assoluto',
        'Between %s and %s' => 'Tra %s e %s',
        'Relative period' => 'Periodo relativo',
        'The past complete %s and the current+upcoming complete %s %s' =>
            'Il passato è completo %s e l\'attuale + imminente completato %s %s',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Non consentire modifiche a questo elemento quando viene generata la statistica.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsParamsWidget.tt
        'Format' => 'Formato',
        'Exchange Axis' => 'Scambia assi',
        'Configurable Params of Static Stat' => 'Parametri configurabili di Static Stat',
        'No element selected.' => 'Nessun elemento selezionato.',
        'Scale' => 'scala valori',
        'show more' => 'mostrare di più',
        'show less' => 'mostrare di meno',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsResultRender/D3.tt
        'Download SVG' => 'Scarica SVG',
        'Download PNG' => 'Scarica PNG',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/XAxisWidget.tt
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Il periodo di tempo selezionato definisce il periodo di tempo predefinito per questa statistica da cui raccogliere i dati.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Definisce l\'unità di tempo che verrà utilizzata per dividere il periodo di tempo selezionato in punti dati di reporting.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/YAxisWidget.tt
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Ricordare che la scala per l\'asse Y deve essere più grande della scala per l\'asse X (ad es. Asse X => mese, asse Y => anno).',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsList.tt
        'This setting is disabled.' => 'Questa impostazione è disabilitata.',
        'This setting is fixed but not deployed yet!' => 'Questa impostazione è fissa ma non ancora distribuita!',
        'This setting is currently being overridden in %s and can\'t thus be changed here!' =>
            'Questa impostazione è attualmente ignorata %s e non può quindi essere modificata qui!',
        'Changing this setting is only available in a higher config level!' =>
            'La modifica di questa impostazione è disponibile solo a un livello di configurazione superiore!',
        '%s (%s) is currently working on this setting.' => '%s(%s) sta attualmente lavorando su questa impostazione.',
        'Toggle advanced options for this setting' => 'Attiva o disattiva le opzioni avanzate per questa impostazione',
        'Disable this setting, so it is no longer effective' => 'Disabilita questa impostazione, quindi non è più efficace',
        'Disable' => 'Disabilita',
        'Enable this setting, so it becomes effective' => 'Abilita questa impostazione, quindi diventa effettiva',
        'Enable' => 'Abilita',
        'Reset this setting to its default state' => 'Ripristina questa impostazione al suo stato predefinito',
        'Reset setting' => 'Ripristinare le impostazioni',
        'Copy a direct link to this setting to your clipboard' => 'Copia un link diretto a questa impostazione negli appunti',
        'Copy direct link' => 'Copia collegamento diretto',
        'Remove this setting from your favorites setting' => 'Rimuovi questa impostazione dalle tue impostazioni preferite',
        'Remove from favourites' => 'Rimuovi dai preferiti',
        'Add this setting to your favorites' => 'Aggiungi questa impostazione ai tuoi preferiti',
        'Add to favourites' => 'Aggiungi ai preferiti',
        'Cancel editing this setting' => 'Annulla la modifica di questa impostazione',
        'Save changes on this setting' => 'Salva le modifiche su questa impostazione',
        'Edit this setting' => 'Modifica questa impostazione',
        'Enable this setting' => 'Abilita questa impostazione',
        'This group doesn\'t contain any settings. Please try navigating to one of its sub groups or another group.' =>
            'Questo gruppo non contiene alcuna impostazione. Prova a navigare verso uno dei suoi sottogruppi o un altro gruppo.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/SettingsListCompare.tt
        'Now' => 'Ora',
        'User modification' => 'Modifica dell\'utente',
        'enabled' => 'abilita',
        'disabled' => 'disabilita',
        'Setting state' => 'Stato di impostazione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Actions.tt
        'Edit search' => 'Modifica ricerca',
        'Go back to admin: ' => 'Torna all\'amministratore: ',
        'Deployment' => 'Attivazione',
        'My favourite settings' => 'Le mie impostazioni preferite',
        'Invalid settings' => 'Impostazioni non valide',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/DynamicActions.tt
        'Filter visible settings...' => 'Filtra le impostazioni visibili ...',
        'Enable edit mode for all settings' => 'Abilita la modalità di modifica per tutte le impostazioni',
        'Save all edited settings' => 'Salva tutte le impostazioni modificate',
        'Cancel editing for all settings' => 'Annulla la modifica per tutte le impostazioni',
        'All actions from this widget apply to the visible settings on the right only.' =>
            'Tutte le azioni da questo widget si applicano solo alle impostazioni visibili a destra.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Help.tt
        'Currently edited by me.' => 'Attualmente modificato da me.',
        'Modified but not yet deployed.' => 'Modificata, ma non ancora attivata.',
        'Currently edited by another user.' => 'Attualmente modificato da un altro utente.',
        'Different from its default value.' => 'Diverso dal suo valore predefinito.',
        'Save current setting.' => 'Salva le impostazioni correnti.',
        'Cancel editing current setting.' => 'Annulla la modifica delle impostazioni correnti.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SystemConfiguration/Sidebar/Navigation.tt
        'Navigation' => 'Navigazione',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Test.tt
        'Znuny Test Page' => 'Pagina di test Znuny',
        'Unlock' => 'Sblocca',
        'Welcome %s %s' => 'Benvenuto %s %s',
        'Counter' => 'Contatore',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Ticket/TimeUnits.tt
        'Invalid time!' => 'Ora non valida!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Warning.tt
        'Go back to the previous page' => 'Torna alla pagina precedente',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/FormDraftAddDialog.html.tmpl
        'Draft title' => 'Titolo della bozza',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/ArticleViewSettingsDialog.html.tmpl
        'Article display' => 'Visualizzazione dell\'articolo',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl
        'Do you really want to delete "%s"?' => 'Vuoi veramente cancellare "%s"?',
        'Confirm' => 'Conferma',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/WidgetLoading.html.tmpl
        'Loading, please wait...' => 'Attendere il caricamento prego...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/AjaxDnDUpload/UploadContainer.html.tmpl
        'Click to select a file for upload.' => 'Fare clic per selezionare un file per il caricamento.',
        'Select files or drop them here' => '',
        'Select a file or drop it here' => '',
        'Uploading...' => 'Caricamento...',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/PackageManager/InformationDialog.html.tmpl
        'Process state' => 'Stato processo',
        'Running' => 'Avvio',
        'Finished' => 'Operazione terminata',
        'Unknown' => 'Sconosciuto',
        'No package information available.' => 'Nessuna informazione sul pacchetto disponibile.',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddButton.html.tmpl
        'Add new entry' => 'Aggiungi nuova entry',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddHashKey.html.tmpl
        'Add key' => 'Aggiungi chiave',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogDeployment.html.tmpl
        'Deployment comment...' => 'Commento di attivazione...',
        'This field can have no more than 250 characters.' => 'Questo campo non può contenere più di 250 caratteri.',
        'Deploying, please wait...' => 'Attivazione in corso, attendere...',
        'Preparing to deploy, please wait...' => 'Preparazione dell\'attivazione, attendere...',
        'Deploy now' => 'Attiva adesso',
        'Try again' => 'Riprova',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/DialogReset.html.tmpl
        'Do you really want to reset this setting to it\'s default value?' =>
            'Vuoi davvero ripristinare questa impostazione al suo valore predefinito?',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/HelpDialog.html.tmpl
        'You can use the category selection to limit the navigation tree below to entries from the selected category. As soon as you select the category, the tree will be re-built.' =>
            'È possibile utilizzare la selezione della categoria per limitare la struttura di navigazione in basso alle voci della categoria selezionata. Non appena si seleziona la categoria, l\'albero verrà ricostruito.',

        # Perl Module: Kernel/Config/Defaults.pm
        'Database Backend' => 'Backend del database',
        'CustomerIDs' => 'Codici cliente',
        'Fax' => 'Fax',
        'Street' => 'Via',
        'Zip' => 'CAP',
        'City' => 'Città',
        'Country' => 'Stato',
        'Valid' => 'Valido',
        'Mr.' => 'Sig',
        'Mrs.' => 'Sig.ra',
        'View system log messages.' => 'Visualizza messaggi del log di sistema.',
        'Edit the system configuration settings.' => 'Modifica le impostazioni di sistema.',
        'Update and extend your system with software packages.' => 'Aggiorna ed estendi il tuo sistema con i pacchetti software.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'Le ACL dal database non sono allineate con la configurazione di sistema, effettua il rilascio di tutte le ACL.',
        'ACLs could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'Non è stato possibile importare ACL a causa di un errore sconosciuto. Per ulteriori informazioni, consultare i registri Znuny',
        'The following ACLs have been added successfully: %s' => 'Sono stati aggiunti correttamente i seguenti ACL: %s',
        'The following ACLs have been updated successfully: %s' => 'Sono stati aggioranti correttamente i seguenti ACL: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            'Lì dove errori durante l\'aggiunta / aggiornamento dei seguenti ACL: %s. Per ulteriori informazioni, consultare il file di registro.',
        'This field is required' => 'Questo campo è obbligatorio',
        'There was an error creating the ACL' => 'Si è verificato un errore durante la creazione dell\'ACL',
        'Need ACLID!' => 'ACLID necessario!',
        'Could not get data for ACLID %s' => 'Impossibile ottenere i dati per ACLID %s',
        'There was an error updating the ACL' => 'Si è verificato un errore durante l\'aggiornamento dell\'ACL',
        'There was an error setting the entity sync status.' => 'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità.',
        'There was an error synchronizing the ACLs.' => 'Si è verificato un errore durante la sincronizzazione degli ACL.',
        'ACL %s could not be deleted' => 'L\'ACL %s non può essere eliminata',
        'There was an error getting data for ACL with ID %s' => 'Si è verificato un errore durante il recupero dei dati per ACL con ID %s',
        '%s (copy) %s' => '%s (copia) %s',
        'Please note that ACL restrictions will be ignored for the Superuser account (UserID 1).' =>
            'Si noti che le restrizioni ACL verranno ignorate per l\'account Amministratore (UserID 1).',
        'Exact match' => 'Corrispondenza esatta',
        'Negated exact match' => 'Corrispondenza esatta negata',
        'Regular expression' => 'Espressione regolare',
        'Regular expression (ignore case)' => 'Espressione regolare (non distinguere le maiuscole)',
        'Negated regular expression' => 'Espressione regolare negata',
        'Negated regular expression (ignore case)' => 'Espressione regolare negata (non distinguere le maiuscole)',

        # Perl Module: Kernel/Modules/AdminAppointmentCalendarManage.pm
        'System was unable to create Calendar!' => 'Non è stato possibile creare il Calendario nel sistema!',
        'Please contact the administrator.' => 'Si prega di contattare l\'amministratore.',
        'No CalendarID!' => 'Non c\'è il CalendarID!',
        'You have no access to this calendar!' => 'Non hai accesso a questo calendario!',
        'Error updating the calendar!' => 'Errore durante l\'aggiornamento del calendario!',
        'Couldn\'t read calendar configuration file.' => 'Impossibile leggere il file di configurazione del calendario.',
        'Please make sure your file is valid.' => 'Assicurati che il tuo file sia valido.',
        'Could not import the calendar!' => 'Non è stato possibile importare il calendario!',
        'Calendar imported!' => 'Calendario importato!',
        'Need CalendarID!' => 'Serve il CalendarID!',
        'Could not retrieve data for given CalendarID' => 'Impossibile recuperare i dati per il CalendarID specificato',
        'Successfully imported %s appointment(s) to calendar %s.' => 'Importato con successo %s appuntamento(i) al calendario %s.',
        '+5 minutes' => '+5 minuti',
        '+15 minutes' => '+15 minuti',
        '+30 minutes' => '+30 minuti',
        '+1 hour' => '+1 ora',

        # Perl Module: Kernel/Modules/AdminAppointmentImport.pm
        'No permissions' => 'No Permessi',
        'System was unable to import file!' => 'Il sistema non è stato in grado di importare il file!',
        'Please check the log for more information.' => 'Si prega di controllare il registro per ulteriori informazioni.',

        # Perl Module: Kernel/Modules/AdminAppointmentNotificationEvent.pm
        'Notification name already exists!' => 'Il nome della notifica esiste già!',
        'Notification added!' => 'Notifica aggiunta!',
        'There was an error getting data for Notification with ID:%s!' =>
            'Si è verificato un errore durante il recupero dei dati per la notifica con ID:%s!',
        'Unknown Notification %s!' => 'Notifica sconosciuta %s!',
        '%s (copy)' => '%s (copia)',
        'There was an error creating the Notification' => 'Si è verificato un errore durante la creazione della notifica',
        'Notifications could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'Non è stato possibile importare le notifiche a causa di un errore sconosciuto. Per ulteriori informazioni, consultare i registri Znuny',
        'The following Notifications have been added successfully: %s' =>
            'Le seguenti notifiche sono state aggiunte correttamente: %s',
        'The following Notifications have been updated successfully: %s' =>
            'Le seguenti notifiche sono state aggiornate correttamente: %s',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            'Lì dove errori durante l\'aggiunta/aggiornamento delle seguenti notifiche: %s. Per ulteriori informazioni, consultare il file di registro.',
        'Notification updated!' => 'Notifica aggiornata!',
        'Agent (resources), who are selected within the appointment' => 'Agente (risorse), che sono selezionati all\'interno dell\'appuntamento',
        'All agents with (at least) read permission for the appointment (calendar)' =>
            'Tutti gli agenti con (almeno) il permesso di lettura per l\'appuntamento (calendario)',
        'All agents with write permission for the appointment (calendar)' =>
            'Tutti gli agenti con permesso di scrittura per l\'appuntamento (calendario)',

        # Perl Module: Kernel/Modules/AdminAutoResponse.pm
        'Auto Response added!' => 'Aggiunta risposta automatica!',

        # Perl Module: Kernel/Modules/AdminCommunicationLog.pm
        'Invalid CommunicationID!' => 'CommunicationID non valido!',
        'All communications' => 'Tutte le comunicazioni',
        'Last 1 hour' => 'Ultima 1 ora',
        'Last 3 hours' => 'Ultime 3 ore',
        'Last 6 hours' => 'Ultime 6 ore',
        'Last 12 hours' => 'Ultime 12 ore',
        'Last 24 hours' => 'Ultime 24 ore',
        'Last week' => 'Ultima settimana',
        'Last month' => 'Ultimo mese',
        'Invalid StartTime: %s!' => 'StartTime non valido: %s!',
        'Successful' => 'Successo',
        'Processing' => 'Processo',
        'Failed' => 'Fallito',
        'Invalid Filter: %s!' => 'Filtro non valido: %s!',
        'Less than a second' => 'Meno di un secondo',
        'sorted descending' => 'ordine decrescente',
        'sorted ascending' => 'ordine crescente',
        'Trace' => 'Tracciare',
        'Debug' => 'Debug',
        'Info' => 'Informazioni',
        'Warn' => 'Avvisare',
        'days' => 'giorni',
        'day' => 'giorno',
        'hour' => 'ora',
        'minute' => 'minuto',
        'seconds' => 'secondi',
        'second' => 'secondo',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer company updated!' => 'Azienda del cliente aggiornata!',
        'Dynamic field %s not found!' => 'Campo dinamico %s non trovato!',
        'Unable to set value for dynamic field %s!' => 'Impossibile impostare il valore per il campo dinamico %s!',
        'Customer Company %s already exists!' => 'La società cliente %s esite già!',
        'Customer company added!' => 'Azienda del cliente aggiunta!',

        # Perl Module: Kernel/Modules/AdminCustomerGroup.pm
        'No configuration for \'CustomerGroupPermissionContext\' found!' =>
            'Nessuna configurazione trovata per \'CustomerGroupPermissionContext\' trovata!',
        'Please check system configuration.' => 'Si prega di verificare la configurazione del sistema.',
        'Invalid permission context configuration:' => 'Configurazione del contesto di autorizzazione non valida:',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'Customer updated!' => 'Cliente aggiornato!',
        'New phone ticket' => 'Nuovo ticket da telefonata',
        'New email ticket' => 'Nuovo ticket da email',
        'Customer %s added' => 'Cliente %s aggiunto',
        'Customer user updated!' => 'Utenza cliente aggiornata!',
        'Same Customer' => 'Stesso cliente',
        'Direct' => 'Diretto',
        'Indirect' => 'Indiretto',

        # Perl Module: Kernel/Modules/AdminCustomerUserGroup.pm
        'Change Customer User Relations for Group' => 'Modifica relazioni utenza cliente per gruppo',
        'Change Group Relations for Customer User' => 'Cambia relazioni di gruppo per l\'utenza cliente',

        # Perl Module: Kernel/Modules/AdminCustomerUserService.pm
        'Allocate Customer Users to Service' => 'Allocare gli utenti del cliente al servizio',
        'Allocate Services to Customer User' => 'Allocare servizi all\'utenza cliente',

        # Perl Module: Kernel/Modules/AdminDynamicField.pm
        'Fields configuration is not valid' => 'La configurazione dei campi non è valida',
        'Objects configuration is not valid' => 'La configurazione degli oggetti non è valida',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Impossibile ripristinare correttamente l\'ordine del Campo dinamico, controllare il registro errori per ulteriori dettagli.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Sottrazione indefinita.',
        'Need %s' => '%s richiesto',
        'Add %s field' => 'Aggiungi %s campo',
        'The field does not contain only ASCII letters and numbers.' => 'Il campo non contiene solo lettere e numeri ASCII.',
        'There is another field with the same name.' => 'C\'è un altro campo con lo stesso nome.',
        'The field must be numeric.' => 'Il campo deve essere numerico.',
        'Need ValidID' => 'ValidID richiesto',
        'Could not create the new field' => 'Impossibile creare il nuovo campo',
        'Need ID' => 'ID richiesto',
        'Could not get data for dynamic field %s' => 'Impossibile ottenere i dati per il campo dinamico %s',
        'Change %s field' => 'Cambio %s campo',
        'The name for this field should not change.' => 'Il nome per questo campo non dovrebbe cambiare.',
        'Could not update the field %s' => 'Impossibile aggiornare il campo %s',
        'Currently' => 'Attualmente',
        'Unchecked' => 'Non verificato',
        'Checked' => 'Verificato',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Impedisci l\'inserimento di date in futuro',
        'Prevent entry of dates in the past' => 'Impedisci l\'inserimento di date nel passato',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Questo valore di campo è duplicato.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldScreenConfiguration.pm
        'Settings were saved.' => '',
        'System was not able to save the setting!' => '',
        'Setting is locked by another user!' => 'L\'impostazione è bloccata da un\'altro utente!',
        'System was not able to reset the setting!' => 'Il sistema non è in grado di resettare l\'impostazione!',
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
        'Select at least one recipient.' => 'Seleziona almeno un destinatario.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'minute(s)' => 'minuto(i)',
        'hour(s)' => 'ora(e)',
        'Time unit' => 'Unità di tempo',
        'within the last ...' => 'negli ultimi ...',
        'within the next ...' => 'nei prossimi ...',
        'more than ... ago' => 'più di ...',
        'Unarchived tickets' => 'Ticket non archiviati',
        'archive tickets' => 'ticket d\'archivio',
        'restore tickets from archive' => 'ripristinare i ticket dall\'archivio',
        'Need Profile!' => 'Profilo richiesto!',
        'Got no values to check.' => 'Non ho valori da controllare.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Rimuovi le seguenti parole perché non possono essere utilizzate per la selezione del ticket:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Bisogno WebserviceID!',
        'Could not get data for WebserviceID %s' => 'Impossibile ottenere i dati per WebserviceID %s',
        'ascending' => 'Crescente',
        'descending' => 'Decrescente',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingDefault.pm
        'Need communication type!' => 'Hai bisogno di un tipo di comunicazione!',
        'Communication type needs to be \'Requester\' or \'Provider\'!' =>
            'Il tipo di comunicazione deve essere "Richiedente" o "Provider"!',
        'Invalid Subaction!' => 'Sottrazione non valida!',
        'Need ErrorHandlingType!' => 'Hai bisogno di ErrorHandlingType!',
        'ErrorHandlingType %s is not registered' => 'ErrorHandlingType %s non è registrato',
        'Could not update web service' => 'Impossibile aggiornare il servizio Web',
        'Need ErrorHandling' => 'Ha bisogno di ErrorHandling',
        'Could not determine config for error handler %s' => 'Impossibile determinare la configurazione per il gestore errori %s',
        'Invoker processing outgoing request data' => 'Invoker che elabora i dati delle richieste in uscita',
        'Mapping outgoing request data' => 'Mappatura dei dati delle richieste in uscita',
        'Transport processing request into response' => 'Richiesta di elaborazione del trasporto in risposta',
        'Mapping incoming response data' => 'Mappatura dei dati di risposta in entrata',
        'Invoker processing incoming response data' => 'Invoker che elabora i dati di risposta in arrivo',
        'Transport receiving incoming request data' => 'Trasporto che riceve i dati della richiesta in arrivo',
        'Mapping incoming request data' => 'Mappatura dei dati delle richieste in arrivo',
        'Operation processing incoming request data' => 'Operazione che elabora i dati della richiesta in arrivo',
        'Mapping outgoing response data' => 'Mappatura dei dati di risposta in uscita',
        'Transport sending outgoing response data' => 'Trasporto che invia i dati di risposta in uscita',
        'skip same backend modules only' => 'salta solo gli stessi moduli backend',
        'skip all modules' => 'salta tutti i moduli',
        'Operation deleted' => 'Operazione eliminata',
        'Invoker deleted' => 'Invoker eliminato',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceErrorHandlingRequestRetry.pm
        '0 seconds' => '0 secondi',
        '15 seconds' => '15 secondi',
        '30 seconds' => '30 secondi',
        '45 seconds' => '45 secondi',
        '1 minute' => '1 minuto',
        '2 minutes' => '2 minuti',
        '3 minutes' => '3 minuti',
        '4 minutes' => '4 minuti',
        '5 minutes' => '5 minuti',
        '10 minutes' => '10 minuti',
        '15 minutes' => '15 minuti',
        '30 minutes' => '30 minuti',
        '1 hour' => '1 ora',
        '2 hours' => '2 ore',
        '3 hours' => '3 ore',
        '4 hours' => '4 ore',
        '5 hours' => '5 ore',
        '6 hours' => '6 ore',
        '12 hours' => '12 ore',
        '18 hours' => '18 ore',
        '1 day' => '1 giorno',
        '2 days' => '2 giorni',
        '3 days' => '3 giorni',
        '4 days' => '4 giorni',
        '6 days' => '6 giorni',
        '1 week' => '1 settimana',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerDefault.pm
        'Could not determine config for invoker %s' => 'Impossibile determinare la configurazione per invoker %s',
        'InvokerType %s is not registered' => 'InvokerType %s non è registrato',
        'MappingType %s is not registered' => 'MappingType %s non è registrato',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerEvent.pm
        'Need Invoker!' => 'Hai bisogno di Invoker!',
        'Need Event!' => 'Hai bisogno di un evento!',
        'Could not get registered modules for Invoker' => 'Impossibile ottenere i moduli registrati per Invoker',
        'Could not get backend for Invoker %s' => 'Impossibile ottenere il backend per Invoker %s',
        'The event %s is not valid.' => 'L\'evento %s non è valido.',
        'Could not update configuration data for WebserviceID %s' => 'Impossibile aggiornare i dati di configurazione per WebserviceID %s',
        'This sub-action is not valid' => 'Questa azione secondaria non è valida',
        'xor' => 'xor',
        'String' => 'Stringa',
        'Regexp' => 'Regexp',
        'Validation Module' => 'Modulo di convalida',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Simple Mapping for Outgoing Data' => 'Mappatura semplice per i dati in uscita',
        'Simple Mapping for Incoming Data' => 'Mappatura semplice per i dati in entrata',
        'Could not get registered configuration for action type %s' => 'Impossibile ottenere la configurazione registrata per il tipo di azione %s',
        'Could not get backend for %s %s' => 'Impossibile ottenere backend per %s %s',
        'Keep (leave unchanged)' => 'Mantieni (lascia invariato)',
        'Ignore (drop key/value pair)' => 'Ignora (tasto drop/coppia valore)',
        'Map to (use provided value as default)' => 'Mappa su (usa il valore fornito come predefinito)',
        'Exact value(s)' => 'Valori esatto(i)',
        'Ignore (drop Value/value pair)' => 'Ignora (elimina coppia valore/valore)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'XSLT Mapping for Outgoing Data' => 'Mappatura XSLT per dati in uscita',
        'XSLT Mapping for Incoming Data' => 'Mappatura XSLT per dati in entrata',
        'Could not find required library %s' => 'Impossibile trovare la libreria %s richiesta',
        'Outgoing request data before processing (RequesterRequestInput)' =>
            'Dati di richiesta in uscita prima dell\'elaborazione (RequesterRequestInput)',
        'Outgoing request data before mapping (RequesterRequestPrepareOutput)' =>
            'Dati di richiesta in uscita prima del mapping (RequesterRequestPrepareOutput)',
        'Outgoing request data after mapping (RequesterRequestMapOutput)' =>
            'Dati delle richieste in uscita dopo il mapping (RequesterRequestMapOutput)',
        'Incoming response data before mapping (RequesterResponseInput)' =>
            'Dati di risposta in entrata prima del mapping (RequesterResponseInput)',
        'Outgoing error handler data after error handling (RequesterErrorHandlingOutput)' =>
            'Dati del gestore degli errori in uscita dopo la gestione degli errori (RequesterErrorHandlingOutput)',
        'Incoming request data before mapping (ProviderRequestInput)' => 'Dati di richiesta in entrata prima del mapping (ProviderRequestInput)',
        'Incoming request data after mapping (ProviderRequestMapOutput)' =>
            'Dati della richiesta in arrivo dopo il mapping (ProviderRequestMapOutput)',
        'Outgoing response data before mapping (ProviderResponseInput)' =>
            'Dati di risposta in uscita prima del mapping (ProviderResponseInput)',
        'Outgoing error handler data after error handling (ProviderErrorHandlingOutput)' =>
            'Dati del gestore degli errori in uscita dopo la gestione degli errori (ProviderErrorHandlingOutput)',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceOperationDefault.pm
        'Could not determine config for operation %s' => 'Impossibile determinare la configurazione per l\'operazione %s',
        'OperationType %s is not registered' => 'OperationType %s non è registrato',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceTransportHTTPREST.pm
        'Need valid Subaction!' => 'Hai bisogno di una subazione valida!',
        'This field should be an integer.' => 'Questo campo dovrebbe essere un numero intero.',
        'Invalid key file and/or password (if needed, see below).' => '',
        'Invalid password and/or key file (see above).' => '',
        'Certificate is expired.' => '',
        'Certificate file could not be parsed.' => '',
        'Please enter a time in seconds (at least 10 seconds).' => '',
        'Please enter data in expected form (see explanation of field).' =>
            '',
        'File or Directory not found.' => 'File o cartella non trovata.',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebservice.pm
        'There is another web service with the same name.' => 'Esiste un altro servizio web con lo stesso nome.',
        'There was an error updating the web service.' => 'Si è verificato un errore durante l\'aggiornamento del servizio Web.',
        'There was an error creating the web service.' => 'Si è verificato un errore durante la creazione del servizio Web.',
        'Web service "%s" created!' => 'Web service "%s" creato!',
        'Need Name!' => 'Hai bisogno di un nome!',
        'Need ExampleWebService!' => 'Hai bisogno di ExampleWebService!',
        'Could not load %s.' => 'Impossibile caricare %s.',
        'Could not read %s!' => 'Impossibile leggere %s!',
        'Need a file to import!' => 'Hai bisogno di un file da importare!',
        'The imported file has not valid YAML content! Please check Znuny log for details' =>
            'Il file importato non ha contenuto YAML valido! Consultare il registro Znuny per i dettagli',
        'Web service "%s" deleted!' => 'Web service "%s" eliminato!',
        'Znuny as provider' => 'Znuny come fornitore',
        'Operations' => 'Operazioni',
        'Znuny as requester' => 'Znuny come richiedente',
        'Invokers' => 'Invokers',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => 'Non avuto WebserviceHistoryID!',
        'Could not get history data for WebserviceHistoryID %s' => 'Impossibile ottenere i dati della cronologia per WebserviceHistoryID %s',

        # Perl Module: Kernel/Modules/AdminGroup.pm
        'Group updated!' => 'Gruppo aggiornato!',

        # Perl Module: Kernel/Modules/AdminMailAccount.pm
        'Mail account added!' => 'Account di posta aggiunto!',
        'Email account fetch already fetched by another process. Please try again later!' =>
            'Recupero dell\'account e-mail già recuperato da un altro processo. Per favore riprova più tardi!',
        'Dispatching by email To: field.' => 'Smistamento in base al campo A:.',
        'Dispatching by selected Queue.' => 'Smistamento in base alla coda selezionata.',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Agent who created the ticket' => 'L’agente che ha creato il ticket',
        'Agent who owns the ticket' => 'L’agente che possiede il ticket',
        'Agent who is responsible for the ticket' => 'L’agente che è responsabile del ticket',
        'All agents watching the ticket' => 'Tutti gli agenti che osservano il ticket',
        'All agents with write permission for the ticket' => 'Tutti gli agenti con permesso di scrittura per il ticket',
        'All agents subscribed to the ticket\'s queue' => 'Tutti gli agenti si sono iscritti alla coda del ticket',
        'All agents subscribed to the ticket\'s service' => 'Tutti gli agenti si sono iscritti al servizio del ticket',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Tutti gli agenti si sono abbonati alla coda e al servizio del ticket',
        'Customer user of the ticket' => 'Utenza cliente del ticket',
        'All recipients of the first article' => 'Tutti i destinatari del primo articolo',
        'All recipients of the last article' => 'Tutti i destinatari dell\'ultimo articolo',
        'All agents who are mentioned in the ticket' => '',
        'Invisible to customer' => 'Invisibile al cliente',
        'Visible to customer' => 'Visibile al cliente',

        # Perl Module: Kernel/Modules/AdminOAuth2TokenManagement.pm
        'Authorization code parameters not found.' => '',

        # Perl Module: Kernel/Modules/AdminPGP.pm
        'PGP environment is not working. Please check log for more info!' =>
            'L\'ambiente PGP non funziona. Si prega di controllare il registro per maggiori informazioni!',
        'Need param Key to delete!' => 'È necessaria la chiave param per eliminare!',
        'Key %s deleted!' => 'Chiave %s eliminata!',
        'Need param Key to download!' => 'È necessario scaricare la chiave param!',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!' =>
            'Spiacenti, Apache::Reload è necessario come PerlModule e PerlInitHandler nel file di configurazione di Apache. Vedi anche script/apache2-httpd.include.conf. In alternativa, è possibile utilizzare lo strumento da riga di comando bin/znuny.Console.pl per installare i pacchetti!',
        'No such package!' => 'Nessun pacchetto del genere!',
        'No such file %s in package!' => 'Nessun file del genere %s nel pacchetto!',
        'No such file %s in local file system!' => 'Nessun file %s nel file system locale!',
        'Can\'t read %s!' => 'Impossibile leggere %s!',
        'Package has locally modified files.' => 'Il pacchetto ha file modificati localmente.',
        'Not Started' => 'Non iniziato',
        'Updated' => 'Aggiornato',
        'Already up-to-date' => 'Già aggiornato',
        'Installed' => 'Installato',
        'Not correctly deployed' => 'Non correttamente attivata',
        'Package updated correctly' => 'Pacchetto aggiornato correttamente',
        'Package was already updated' => 'Il pacchetto è stato già aggiornato',
        'Dependency installed correctly' => 'Dipendenza installata correttamente',
        'The package needs to be reinstalled' => 'Il pacchetto deve essere reinstallato',
        'The package contains cyclic dependencies' => 'Il pacchetto contiene dipendenze cicliche',
        'Not found in on-line repositories' => 'Non trovato nelle repository on-line',
        'Required version is higher than available' => 'La versione richiesta è superiore a quella disponibile',
        'Dependencies fail to upgrade or install' => 'Le dipendenze non riescono ad aggiornare o installare',
        'Package could not be installed' => 'Impossibile installare il pacchetto',
        'Package could not be upgraded' => 'Impossibile aggiornare il pacchetto',
        'Repository List' => 'Elenco dei repository',
        'No packages found in selected repository. Please check log for more info!' =>
            'Nessun pacchetto trovato nel repository selezionato. Si prega di controllare il registro per maggiori informazioni!',

        # Perl Module: Kernel/Modules/AdminPostMasterFilter.pm
        'No such filter: %s' => 'Nessun filtro: %s',

        # Perl Module: Kernel/Modules/AdminPriority.pm
        'Priority added!' => 'Priorità aggiunta!',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Le informazioni di Process Management del database non sono sincronizzate con la configurazione di sistema, sincronizza tutti i processi.',
        'Need ExampleProcesses!' => 'Un esempio Processo è necessario!',
        'Need ProcessID!' => 'Il ProcessID è necessario!',
        'Yes (mandatory)' => 'Sì (obbligatorio)',
        'Unknown Process %s!' => 'Processo %s sconosciuto!',
        'There was an error generating a new EntityID for this Process' =>
            'Si è verificato un errore durante la generazione di un nuovo EntityID per questo processo',
        'The StateEntityID for state Inactive does not exists' => 'StateEntityID per stato Inattivo non esiste',
        'There was an error creating the Process' => 'Si è verificato un errore durante la creazione del processo',
        'There was an error setting the entity sync status for Process entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità per Processo entity: %s',
        'Could not get data for ProcessID %s' => 'Impossibile ottenere i dati per ProcessID %s',
        'There was an error updating the Process' => 'Si è verificato un errore durante l\'aggiornamento del processo',
        'Process: %s could not be deleted' => 'Il processo: %s non può essere cancellato',
        'There was an error synchronizing the processes.' => 'Si è verificato un errore durante la sincronizzazione dei processi.',
        'The %s:%s is still in use' => '%s:%s è ancora in uso',
        'The %s:%s has a different EntityID' => '%s:%s ha un EntityID diverso',
        'Could not delete %s:%s' => 'Impossibile eliminare %s:%s',
        'There was an error setting the entity sync status for %s entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità %s entity: %s',
        'Could not get %s' => 'Impossibile ottenere %s',
        'Need %s!' => '%s richiesto!',
        'Process: %s is not Inactive' => 'il processo: %s non è attivo',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            'Si è verificato un errore durante la generazione di un nuovo EntityID per questa attività',
        'There was an error creating the Activity' => 'Si è verificato un errore durante la creazione dell\'attività',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità per l\'entità Attività: %s',
        'Need ActivityID!' => 'ActivityID necessario!',
        'Could not get data for ActivityID %s' => 'Impossibile ottenere i dati per ActivityID %s',
        'There was an error updating the Activity' => 'Si è verificato un errore durante l\'aggiornamento dell\'attività',
        'Missing Parameter: Need Activity and ActivityDialog!' => 'Parametro mancante: Need Activity e ActivityDialog!',
        'Activity not found!' => 'Attività non trovata!',
        'ActivityDialog not found!' => 'ActivityDialog non trovato!',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            'ActivityDialog già assegnato ad Activity. Non è possibile aggiungere un ActivityDialog due volte!',
        'Error while saving the Activity to the database!' => 'Errore durante il salvataggio dell\'attività nel database!',
        'This subaction is not valid' => 'Questa azione secondaria non è valida',
        'Edit Activity "%s"' => 'Modifica attività "%s"',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            'Si è verificato un errore durante la generazione di un nuovo EntityID per questo ActivityDialog',
        'There was an error creating the ActivityDialog' => 'Si è verificato un errore durante la creazione di ActivityDialog',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità per l\'entità ActivityDialog: %s',
        'Need ActivityDialogID!' => 'ActivityDialogID necessario!',
        'Could not get data for ActivityDialogID %s' => 'Impossibile ottenere i dati per ActivityDialogID %s',
        'There was an error updating the ActivityDialog' => 'Si è verificato un errore durante l\'aggiornamento di ActivityDialog',
        'Edit Activity Dialog "%s"' => 'Finestra di dialogo Modifica attività "%s"',
        'Agent Interface' => 'Interfaccia utenti interni',
        'Customer Interface' => 'Interfaccia clienti',
        'Agent and Customer Interface' => 'Interfaccia utenti interni e clienti',
        'Do not show Field' => 'Non mostrare il campo',
        'Show Field' => 'Mostra campo',
        'Show Field As Mandatory' => 'Mostra campo come obbligatorio',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => 'Modifica percorso',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            'Si è verificato un errore durante la generazione di un nuovo EntityID per questa transizione',
        'There was an error creating the Transition' => 'Si è verificato un errore durante la creazione della transizione',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità per l\'entità di transizione: %s',
        'Need TransitionID!' => 'TransitionID necessario!',
        'Could not get data for TransitionID %s' => 'Impossibile ottenere i dati per TransitionID %s',
        'There was an error updating the Transition' => 'Si è verificato un errore durante l\'aggiornamento della transizione',
        'Edit Transition "%s"' => 'Modifica transizione "%s"',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => 'È richiesto almeno un parametro di configurazione valido.',
        'There was an error generating a new EntityID for this TransitionAction' =>
            'Si è verificato un errore durante la generazione di un nuovo EntityID per questa TransitionAction',
        'There was an error creating the TransitionAction' => 'Si è verificato un errore durante la creazione di TransitionAction',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            'Si è verificato un errore durante l\'impostazione dello stato di sincronizzazione dell\'entità per l\'entità TransitionAction: %s',
        'Need TransitionActionID!' => 'TransitionActionID necessario!',
        'Could not get data for TransitionActionID %s' => 'Impossibile ottenere i dati per TransitionActionID %s',
        'There was an error updating the TransitionAction' => 'Si è verificato un errore durante l\'aggiornamento di TransitionAction',
        'Edit Transition Action "%s"' => 'Modifica azione di transizione "%s"',
        'Error: Not all keys seem to have values or vice versa.' => 'Errore: non tutte le chiavi sembrano avere valori o viceversa.',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Queue updated!' => 'Coda aggiornata!',
        'Don\'t use :: in queue name!' => 'Non utilizzare :: nel nome della coda!',
        'Click back and change it!' => 'Fai clic indietro e modificalo!',
        '-none-' => '-nessuno-',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => 'Code ( senza risposte automatiche )',

        # Perl Module: Kernel/Modules/AdminQueueTemplates.pm
        'Change Queue Relations for Template' => 'Cambia le relazioni con le code per il modello',
        'Change Template Relations for Queue' => 'Cambia le relazioni con i modelli per la coda',

        # Perl Module: Kernel/Modules/AdminRole.pm
        'Role updated!' => 'Ruolo aggiornato!',
        'Role added!' => 'Ruolo aggiunto!',

        # Perl Module: Kernel/Modules/AdminRoleGroup.pm
        'Change Group Relations for Role' => 'Cambia le relazioni del gruppo per il ruolo',
        'Change Role Relations for Group' => 'Cambia le relazioni del ruolo per il gruppo',

        # Perl Module: Kernel/Modules/AdminRoleUser.pm
        'Role' => 'Ruolo',
        'Change Role Relations for Agent' => 'Cambia relazioni ruolo per agente',
        'Change Agent Relations for Role' => 'Cambia relazioni agente per ruolo',

        # Perl Module: Kernel/Modules/AdminSLA.pm
        'Please activate %s first!' => 'Attiva prima %s!',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            'L\'ambiente S/MIME non funziona. Si prega di controllare il registro per maggiori informazioni!',
        'Need param Filename to delete!' => 'Il parametro Nome file è necessario per la cancellazione!',
        'Need param Filename to download!' => 'Il parametro Nome file è necessario per effettuare il download!',
        'Needed CertFingerprint and CAFingerprint!' => 'CertFingerprint e CAFingerprint sono necessari!',
        'CAFingerprint must be different than CertFingerprint' => 'CAFingerprint deve essere diverso da CertFingerprint',
        'Relation exists!' => 'La relazione esiste!',
        'Relation added!' => 'Relazione aggiunta!',
        'Impossible to add relation!' => 'Impossibile aggiungere una relazione!',
        'Relation doesn\'t exists' => 'La relazione non esiste',
        'Relation deleted!' => 'Relazione eliminata!',
        'Impossible to delete relation!' => 'Impossibile cancellare la relazione!',
        'Certificate %s could not be read!' => 'Il certificato %s non può essere letto!',
        'Handle Private Certificate Relations' => 'Gestire le relazioni di certificati privati',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation added!' => 'Saluto aggiunto!',

        # Perl Module: Kernel/Modules/AdminSignature.pm
        'Signature updated!' => 'Firma aggiornata!',
        'Signature added!' => 'Firma aggiunta!',

        # Perl Module: Kernel/Modules/AdminState.pm
        'State added!' => 'Stato aggiunto!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => 'Il file %s non può essere letto!',

        # Perl Module: Kernel/Modules/AdminSystemAddress.pm
        'System e-mail address added!' => 'Account di posta di sistema aggiunto!',

        # Perl Module: Kernel/Modules/AdminSystemConfiguration.pm
        'Invalid Settings' => 'Impostazioni non valide',
        'There are no invalid settings active at this time.' => 'Al momento non sono attive impostazioni non valide.',
        'You currently don\'t have any favourite settings.' => 'Al momento non hai alcuna impostazione preferita.',
        'The following settings could not be found: %s' => 'Impossibile trovare le seguenti impostazioni: %s',
        'Import not allowed!' => 'Importazione non consentita!',
        'System Configuration could not be imported due to an unknown error, please check Znuny logs for more information.' =>
            'Impossibile importare la configurazione del sistema a causa di un errore sconosciuto. Per ulteriori informazioni, consultare i registri Znuny.',
        'Category Search' => 'Ricerca per categoria',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationDeployment.pm
        'Some imported settings are not present in the current state of the configuration or it was not possible to update them. Please check the Znuny log for more information.' =>
            'Alcune impostazioni importate non sono presenti nello stato corrente della configurazione o non è stato possibile aggiornarle. Per ulteriori informazioni, consultare il registro Znuny.',

        # Perl Module: Kernel/Modules/AdminSystemConfigurationGroup.pm
        'You need to enable the setting before locking!' => 'È necessario abilitare l\'impostazione prima del blocco!',
        'You can\'t work on this setting because %s (%s) is currently working on it.' =>
            'Non puoi lavorare su questa impostazione perché %s (%s) ci sta attualmente lavorando.',
        'Missing setting name!' => 'Nome impostazione mancante!',
        'Missing ResetOptions!' => 'Opzione Reset mancante!',
        'System was not able to lock the setting!' => 'Il sistema non è in grado di bloccare l\'impostazione !',
        'System was unable to update setting!' => '',
        'Missing setting name.' => '',
        'Setting not found.' => '',
        'Missing Settings!' => '',

        # Perl Module: Kernel/Modules/AdminSystemFiles.pm
        'Package files - %s' => '',
        '(Files where only the permissions have been changed will not be displayed.)' =>
            '',

        # Perl Module: Kernel/Modules/AdminSystemMaintenance.pm
        'Start date shouldn\'t be defined after Stop date!' => '',
        'There was an error creating the System Maintenance' => '',
        'Need SystemMaintenanceID!' => '',
        'Could not get data for SystemMaintenanceID %s' => '',
        'System Maintenance was added successfully!' => '',
        'System Maintenance was updated successfully!' => '',
        'Session has been killed!' => '',
        'All sessions have been killed, except for your own.' => '',
        'There was an error updating the System Maintenance' => '',
        'Was not possible to delete the SystemMaintenance entry: %s!' => '',

        # Perl Module: Kernel/Modules/AdminTemplate.pm
        'Template updated!' => 'Modello aggiornato!',

        # Perl Module: Kernel/Modules/AdminTemplateAttachment.pm
        'Change Attachment Relations for Template' => '',
        'Change Template Relations for Attachment' => '',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => '',
        'Type added!' => 'Tipo aggiunto!',

        # Perl Module: Kernel/Modules/AdminUser.pm
        'Agent updated!' => 'Agente aggiornato!',

        # Perl Module: Kernel/Modules/AdminUserGroup.pm
        'Change Group Relations for Agent' => 'Cambia relazioni gruppo per agente',
        'Change Agent Relations for Group' => 'Cambia relazioni agente per gruppo',

        # Perl Module: Kernel/Modules/AgentAppointmentAgendaOverview.pm
        'Month' => 'Mese',
        'Week' => 'Settimana',
        'Day' => 'Giorno',

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
        'Customer History' => 'Cronologia cliente',

        # Perl Module: Kernel/Modules/AgentCustomerUserAddressBook.pm
        'No RecipientField is given!' => '',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => '',
        'Statistic' => 'Statistica',
        'No preferences for %s!' => 'Nessuna preferenza per %s!',
        'Can\'t get element data of %s!' => '',
        'Can\'t get filter content data of %s!' => '',
        'Customer Name' => 'Nome cliente',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => '',
        'You need ro permission!' => '',
        'Can not delete link with %s!' => 'Impossibile eliminare il collegamento con %s!',
        '%s Link(s) deleted successfully.' => '',
        'Can not create link with %s! Object already linked as %s.' => '',
        'Can not create link with %s!' => 'Impossibile creare il collegamento con %s!',
        '%s links added successfully.' => '',
        'The object %s cannot link with other object!' => '',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => '',

        # Perl Module: Kernel/Modules/AgentSplitSelection.pm
        'Process ticket' => '',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => 'Manca il parametro %s.',
        'Invalid Subaction.' => '',
        'Statistic could not be imported.' => 'La statistica non può essere importata.',
        'Please upload a valid statistic file.' => 'Carica un file di statistiche valido.',
        'Export: Need StatID!' => '',
        'Delete: Get no StatID!' => '',
        'Need StatID!' => '',
        'Could not load stat.' => '',
        'Add New Statistic' => 'Aggiungi nuova statistica',
        'Could not create statistic.' => '',
        'Run: Get no %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => '',
        'You need %s permissions!' => '',
        'Loading draft failed!' => 'Caricamento della bozza fallito!',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Spiacente, devi essere il proprietario del ticket per effettuare questa operazione.',
        'Please change the owner first.' => 'Prima è necessario cambiare il proprietario.',
        'FormDraft functionality disabled!' => 'Funzione bozze non attiva!',
        'Draft name is required!' => 'La bozza richiede un nome!',
        'FormDraft name %s is already in use!' => 'Il nome %s per il modulo bozza è già usato!',
        'Could not perform validation on field %s!' => '',
        'No subject' => 'Nessun oggetto',
        'Could not delete draft!' => 'Non puoi cancellare la bozza!',
        'Previous Owner' => 'Gestore precedente',
        'wrote' => 'ha scritto',
        'Message from' => 'Messaggio da',
        'End message' => 'Fine messaggio',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '%s è richiesto!',
        'Plain article not found for article %s!' => '',
        'Article does not belong to ticket %s!' => '',
        'Can\'t bounce email!' => '',
        'Can\'t send email!' => 'Impossibile inviare il messaggio!',
        'Wrong Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => '',
        'Ticket (%s) is not unlocked!' => 'Il ticket (%s) non è sbloccato!',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to tickets: %s.' =>
            '',
        'The following ticket was ignored because it is locked by another agent or you don\'t have write access to ticket: %s.' =>
            '',
        'You need to select at least one ticket.' => '',
        'Bulk feature is not enabled!' => '',
        'No selectable TicketID is given!' => '',
        'You either selected no ticket or only tickets which are locked by other agents.' =>
            '',
        'The following tickets were ignored because they are locked by another agent or you don\'t have write access to these tickets: %s.' =>
            '',
        'The following tickets were locked: %s.' => '',

        # Perl Module: Kernel/Modules/AgentTicketCompose.pm
        'Article subject will be empty if the subject contains only the ticket hook!' =>
            '',
        'Address %s replaced with registered customer address.' => 'L\'indirizzo %s è stato sostituito con l\'indirizzo registrato del cliente.',
        'Customer user automatically added in Cc.' => 'Utenza cliente aggiunta automaticamente in CC.',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'Ticket "%s" created!' => 'Ticket "%s" creato!',
        'No Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => '',
        'System Error!' => 'Errore di sistema!',

        # Perl Module: Kernel/Modules/AgentTicketEmailResend.pm
        'No ArticleID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Next week' => 'Settimana prossima',
        'Ticket Escalation View' => 'Vista Ticket Escalation',

        # Perl Module: Kernel/Modules/AgentTicketForward.pm
        'Article %s could not be found!' => '',
        'Forwarded message from' => 'Messaggio inoltrato da',
        'End forwarded message' => 'Fine messaggio inoltrato',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => '',
        'Sorry, the current owner is %s!' => 'Spiacente, l\'attuale proprietario è %s!',
        'Please become the owner first.' => 'Prima è necessario diventare il proprietario.',
        'Ticket (ID=%s) is locked by %s!' => '',
        'Change the owner!' => 'Cambia il proprietario!',

        # Perl Module: Kernel/Modules/AgentTicketLockedView.pm
        'New Article' => 'Nuovo articolo',
        'Pending' => 'In attesa',
        'Reminder Reached' => 'Promemoria raggiunti',
        'My Locked Tickets' => 'Ticket bloccati da me',

        # Perl Module: Kernel/Modules/AgentTicketMentionView.pm
        'New mention' => '',
        'My Mentions' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => 'Ti servono i permessi di spostamento!',

        # Perl Module: Kernel/Modules/AgentTicketPhoneCommon.pm
        'Ticket locked.' => 'Ticket bloccato.',

        # Perl Module: Kernel/Modules/AgentTicketPlain.pm
        'No ArticleID!' => '',
        'This is not an email article.' => '',
        'Can\'t read plain article! Maybe there is no plain email in backend! Read backend message.' =>
            '',

        # Perl Module: Kernel/Modules/AgentTicketPrint.pm
        'Need TicketID!' => '',

        # Perl Module: Kernel/Modules/AgentTicketProcess.pm
        'Couldn\'t get ActivityDialogEntityID "%s"!' => '',
        'No Process configured!' => '',
        'The selected process is invalid!' => 'Il processo selezionato non è valido!',
        'Process %s is invalid!' => 'Il processo %s non è valido!',
        'Subaction is invalid!' => '',
        'Parameter %s is missing in %s.' => '',
        'No ActivityDialog configured for %s in _RenderAjax!' => '',
        'Got no Start ActivityEntityID or Start ActivityDialogEntityID for Process: %s in _GetParam!' =>
            '',
        'Couldn\'t get Ticket for TicketID: %s in _GetParam!' => '',
        'Couldn\'t determine ActivityEntityID. DynamicField or Config isn\'t set properly!' =>
            '',
        'Process::Default%s Config Value missing!' => '',
        'Got no ProcessEntityID or TicketID and ActivityDialogEntityID!' =>
            '',
        'Can\'t get StartActivityDialog and StartActivityDialog for the ProcessEntityID "%s"!' =>
            '',
        'Can\'t get Ticket "%s"!' => '',
        'Can\'t get ProcessEntityID or ActivityEntityID for Ticket "%s"!' =>
            '',
        'Can\'t get Activity configuration for ActivityEntityID "%s"!' =>
            '',
        'Can\'t get ActivityDialog configuration for ActivityDialogEntityID "%s"!' =>
            '',
        'Can\'t get data for Field "%s" of ActivityDialog "%s"!' => '',
        'PendingTime can just be used if State or StateID is configured for the same ActivityDialog. ActivityDialog: %s!' =>
            '',
        'Pending Date' => 'Attesa fino a',
        'for pending* states' => 'per gli stati di attesa*',
        'ActivityDialogEntityID missing!' => '',
        'Couldn\'t get Config for ActivityDialogEntityID "%s"!' => '',
        'Couldn\'t use CustomerID as an invisible field.' => '',
        'Missing ProcessEntityID, check your ActivityDialogHeader.tt!' =>
            '',
        'No StartActivityDialog or StartActivityDialog for Process "%s" configured!' =>
            '',
        'Couldn\'t create ticket for Process with ProcessEntityID "%s"!' =>
            '',
        'Couldn\'t set ProcessEntityID "%s" on TicketID "%s"!' => '',
        'Couldn\'t set ActivityEntityID "%s" on TicketID "%s"!' => '',
        'Could not store ActivityDialog, invalid TicketID: %s!' => '',
        'Invalid TicketID: %s!' => '',
        'Missing ActivityEntityID in Ticket %s!' => '',
        'This step does not belong anymore to the current activity in process for ticket \'%s%s%s\'! Another user changed this ticket in the meantime. Please close this window and reload the ticket.' =>
            '',
        'Missing ProcessEntityID in Ticket %s!' => '',
        'Could not set DynamicField value for %s of Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Could not set attachments for ticket with ID %s in activity dialog "%s"!' =>
            '',
        'Could not set PendingTime for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Wrong ActivityDialog Field config: %s can\'t be Display => 1 / Show field (Please change its configuration to be Display => 0 / Do not show field or Display => 2 / Show field as mandatory)!' =>
            '',
        'Could not set %s for Ticket with ID "%s" in ActivityDialog "%s"!' =>
            '',
        'Default Config for Process::Default%s missing!' => '',
        'Default Config for Process::Default%s invalid!' => '',

        # Perl Module: Kernel/Modules/AgentTicketQueue.pm
        'Available tickets' => 'Ticket disponibili',
        'including subqueues' => 'incluse le sottocode',
        'excluding subqueues' => 'escluse le sottocode',
        'QueueView' => 'Vista della coda',

        # Perl Module: Kernel/Modules/AgentTicketResponsibleView.pm
        'My Responsible Tickets' => 'Miei ticket di cui sono il responsabile',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'last-search' => 'Ultima ricerca',
        'Untitled' => 'Senza titolo',
        'Ticket Number' => 'Numero ticket',
        'Ticket' => 'Ticket',
        'printed by' => 'stampato da',
        'CustomerID (complex search)' => '',
        'CustomerID (exact match)' => '',
        'Invalid Users' => 'Utenti non validi',
        'Normal' => 'Normale',
        'CSV' => 'CSV',
        'Excel' => 'Excel',
        'in more than ...' => 'in più di ...',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => 'Funzionalità non abilitata!',
        'Service View' => 'Visualizzazione servizio',

        # Perl Module: Kernel/Modules/AgentTicketStatusView.pm
        'Status View' => 'Visualizzazione stato',

        # Perl Module: Kernel/Modules/AgentTicketWatchView.pm
        'My Watched Tickets' => 'Miei ticket osservati',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => 'La funzionalità non è attiva',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'This ticket does not exist, or you don\'t have permissions to access it in its current state.' =>
            '',
        'Missing FormDraftID!' => 'Manca l\'ID del modulo bozza!',
        'Can\'t get for ArticleID %s!' => '',
        'Article filter settings were saved.' => '',
        'Event type filter settings were saved.' => '',
        'Need ArticleID!' => '',
        'Invalid ArticleID!' => '',
        'Forward article via mail' => 'Inoltra l\'articolo via email',
        'Forward' => 'Inoltra',
        'Fields with no group' => 'Campi senza gruppo',
        'Invisible only' => '',
        'Visible only' => '',
        'Visible and invisible' => '',
        'Article could not be opened! Perhaps it is on another article page?' =>
            '',
        'Show one article' => 'Mostra un articolo',
        'Show all articles' => 'Mostra tutti gli articoli',

        # Perl Module: Kernel/Modules/AjaxAttachment.pm
        'Got no FormID.' => '',
        'Error: the file could not be deleted properly. Please contact your administrator (missing FileID).' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketArticleContent.pm
        'ArticleID is needed!' => '',
        'No TicketID for ArticleID (%s)!' => '',
        'HTML body attachment is missing!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketAttachment.pm
        'FileID and ArticleID are needed!' => '',
        'No such attachment (%s)!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketMessage.pm
        'Check SysConfig setting for %s::QueueDefault.' => '',
        'Check SysConfig setting for %s::TicketTypeDefault.' => '',
        'You don\'t have sufficient permissions for ticket creation in default queue.' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketOverview.pm
        'Need CustomerID!' => '',
        'My Tickets' => 'I miei ticket',
        'Company Tickets' => 'Ticket della Società',
        'Untitled!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Customer Realname' => 'Nome reale cliente',
        'Created within the last' => 'Creato negli ultimi',
        'Created more than ... ago' => 'Creato più di ... fa',
        'Please remove the following words because they cannot be used for the search:' =>
            '',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => '',
        'Create a new ticket!' => 'Creare un nuovo ticket!',

        # Perl Module: Kernel/Modules/Installer.pm
        'SecureMode active!' => '',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            '',
        'Directory "%s" doesn\'t exist!' => '',
        'Configure "Home" in Kernel/Config.pm first!' => '',
        'File "%s/Kernel/Config.pm" not found!' => '',
        'Directory "%s" not found!' => 'Cartella "%s" non trovata!',
        'Install Znuny' => 'Installa Znuny',
        'Intro' => 'Introduzione',
        'Kernel/Config.pm isn\'t writable!' => '',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            '',
        'Database Selection' => 'Selezione database',
        'Unknown Check!' => '',
        'The check "%s" doesn\'t exist!' => '',
        'Enter the password for the database user.' => 'Inserisci la password per l\'utente del database',
        'Database %s' => 'Database %s',
        'Configure MySQL' => '',
        'Enter the password for the administrative database user.' => 'Inserisci la password per l\'utente amministrativo del database',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => '',
        'Please go back.' => '',
        'Create Database' => 'Crea database',
        'Install Znuny - Error' => '',
        'File "%s/%s.xml" not found!' => 'File "%s/%s.xml" non trovato!',
        'Contact your Admin!' => 'Contatta il tuo amministratore!',
        'System Settings' => 'Impostazioni di sistema',
        'Syslog' => '',
        'Configure Mail' => 'Configurazione posta',
        'Mail Configuration' => 'Configurazione della posta',
        'Can\'t write Config file!' => '',
        'Unknown Subaction %s!' => '',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            '',
        'Can\'t connect to database, read comment!' => '',
        'Database already contains data - it should be empty!' => 'Il database risulta contenere dati - dovrebbe essere vuoto!',
        'Error: You have the wrong database version installed (%s). You need at least version %s! ' =>
            '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            '',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            '',
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
        'Need config Package::RepositoryAccessRegExp' => '',
        'Authentication failed from %s!' => 'Autenticazione non riuscita da %s!',

        # Perl Module: Kernel/Output/HTML/Article/Chat.pm
        'Chat' => 'Chat',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketBounce.pm
        'Bounce Article to a different mail address' => 'Reinvia l\'articolo a un indirizzo di posta diverso',
        'Bounce' => 'Rispedisci',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketCompose.pm
        'Reply All' => 'Rispondi a tutti',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketEmailResend.pm
        'Resend this article' => '',
        'Resend' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketMessageLog.pm
        'View message log details for this article' => '',
        'Message Log' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNote.pm
        'Reply to note' => 'Rispondere alla nota',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNoteToLinkedTicket.pm
        'Create notice for linked ticket' => '',
        'Transfer notice' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPhone.pm
        'Split this article' => 'Dividi questo articolo',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPlain.pm
        'View the source for this Article' => '',
        'Plain Format' => 'Formato semplice',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPrint.pm
        'Print this article' => 'Stampa questo articolo',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkArticleSeenUnseen.pm
        'Mark article as unseen' => '',
        'Mark as unseen' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkAsImportant.pm
        'Mark' => 'Seleziona',
        'Unmark' => 'Deseleziona',

        # Perl Module: Kernel/Output/HTML/ArticleAction/ReinstallPackageLink.pm
        'Re-install Package' => '',
        'Re-install' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Crypted' => 'Cifrato',
        'Sent message encrypted to recipient!' => '',
        'Signed' => 'Firmato',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '',
        'Ticket decrypted before' => '',
        'Impossible to decrypt: private key for email was not found!' => '',
        'Successful decryption' => 'Decifratura avvenuta con successo',

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
        'PGP sign and encrypt' => '',
        'PGP encrypt' => '',
        'SMIME sign' => '',
        'SMIME sign and encrypt' => '',
        'SMIME encrypt' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCompose/Sign.pm
        'Cannot use expired signing key: \'%s\'. ' => '',
        'Cannot use revoked signing key: \'%s\'. ' => '',
        'There are no signing keys available for the addresses \'%s\'.' =>
            '',
        'There are no selected signing keys for the addresses \'%s\'.' =>
            '',
        'Sign' => 'Firma',
        'Keys/certificates will only be shown for a sender with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Dashboard/AppointmentCalendar.pm
        'Shown' => 'Mostrati',
        'Refresh (minutes)' => '',
        'off' => 'spento',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerIDList.pm
        'Shown customer ids' => 'Id clienti mostrati',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerUserList.pm
        'Shown customer users' => 'Utenze clienti mostrate',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/MyLastChangedTickets.pm
        'Shown Tickets' => 'Ticket visualizzati',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'Shown Columns' => 'Mostra colonne',
        'filter not active' => 'filtro non attivo',
        'filter active' => 'filtro attivo',
        'This ticket has no title or subject' => 'Questo ticket non ha né titolo né oggetto',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketStatsGeneric.pm
        '7 Day Stats' => 'Statistiche ultimi 7 Giorni',

        # Perl Module: Kernel/Output/HTML/Dashboard/UserOnline.pm
        'User is currently offline.' => '',
        'User is currently active.' => '',
        'User was inactive for a while.' => '',
        'User set their status to unavailable.' => '',
        'Away' => '',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'Standard' => 'Standard',
        'The following tickets are not updated: %s.' => '',
        'h' => 'h',
        'm' => 'm',
        'd' => 'g',
        'This ticket does not exist, or you don\'t have permissions to access it in its current state. You can take one of the following actions:' =>
            '',
        'This is a' => 'Questo è un',
        'email' => 'email',
        'click here' => 'fai clic qui',
        'to open it in a new window.' => 'per aprire in una nuova finestra.',
        'Year' => 'Anno',
        'Hours' => 'Ore',
        'Minutes' => 'Minuti',
        'Check to activate this date' => 'Seleziona per attivare questa data',
        '%s TB' => '',
        '%s GB' => '',
        '%s MB' => '',
        '%s KB' => '',
        '%s B' => '',
        'No Permission!' => 'Permessi insufficienti!',
        'No Permission' => 'Nessun permesso',
        'Show Tree Selection' => 'Mostra la selezione ad albero',
        'Split Quote' => '',
        'Remove Quote' => '',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Collegato come',
        'Search Result' => 'Risultato della ricerca',
        'Linked' => 'Collegato',
        'Bulk' => 'Aggiornamento multiplo',

        # Perl Module: Kernel/Output/HTML/Layout/Ticket.pm
        'Lite' => 'Ridotta',
        'Unread article(s) available' => 'Articoli non letti disponibili',

        # Perl Module: Kernel/Output/HTML/LinkObject/Appointment.pm
        'Appointment' => 'Appuntamento',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => '',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOnline.pm
        'Online Agent: %s' => 'Agenti collegati: %s',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTicketEscalation.pm
        'There are more escalated tickets!' => 'Ci sono altri ticket scalati!',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTimeZoneCheck.pm
        'Please select a time zone in your preferences and confirm it by clicking the save button.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerOnline.pm
        'Online Customer: %s' => 'Clienti collegati: %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'System maintenance is active!' => '',
        'A system maintenance period will start at: %s and is expected to stop at: %s' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/DaemonCheck.pm
        'Znuny Daemon is not running.' => 'Il demone Znuny non è in esecuzione.',

        # Perl Module: Kernel/Output/HTML/Notification/OAuth2TokenManagementTokenExpired.pm
        'OAuth2 token for "%s" has expired.' => '',
        'OAuth2 refresh token for "%s" has expired.' => '',

        # Perl Module: Kernel/Output/HTML/Notification/OutofOfficeCheck.pm
        'You have Out of Office enabled, would you like to disable it?' =>
            'Risposta automatica abilitata. Vuoi disabilitarla?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationInvalidCheck.pm
        'You have %s invalid setting(s) deployed. Click here to show invalid settings.' =>
            'Hai %s impostazioni non valide attivate. Fare clic qui per vedere le impostazioni non valide.',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationIsDirtyCheck.pm
        'You have undeployed settings, would you like to deploy them?' =>
            'Ci sono modifiche non attivate. Attivarle adesso?',

        # Perl Module: Kernel/Output/HTML/Notification/SystemConfigurationOutOfSyncCheck.pm
        'The configuration is being updated, please be patient...' => '',
        'There is an error updating the system configuration!' => '',

        # Perl Module: Kernel/Output/HTML/Notification/UIDCheck.pm
        'Don\'t use the Superuser account to work with %s! Create new Agents and work with these accounts instead.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/AppointmentNotificationEvent.pm
        'Please make sure you\'ve chosen at least one transport method for mandatory notifications.' =>
            '',
        'Preferences updated successfully!' => 'Preferenze modificate con successo!',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(in corso)',

        # Perl Module: Kernel/Output/HTML/Preferences/MaxArticlesPerPage.pm
        'Max. number of articles per page must be between 1 and 1000 or empty.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => '',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Current password' => 'Password attuale',
        'New password' => 'Nuova password',
        'Verify password' => 'Verifica password',
        'The current password is not correct. Please try again!' => 'La password corrente è errata. Riprova!',
        'Please supply your new password!' => 'Fornisci la nuova password!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Impossibile aggiornare la password, le password nuove non corrispondono. Riprova!',
        'This password is forbidden by the current system configuration. Please contact the administrator if you have additional questions.' =>
            '',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Impossibile aggiornare la password, deve essere lunga almeno %s caratteri!',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase letter characters!' =>
            '',
        'Can\'t update password, it must contain at least 1 digit!' => 'Impossibile aggiornare la password, deve contenere almeno un numero!',
        'Can\'t update password, it must contain at least 2 letter characters!' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/TimeZone.pm
        'Time zone updated successfully!' => '',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'invalid' => 'non valido',
        'valid' => 'valido',
        'No (not supported)' => 'No (non supportato)',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            '',
        'The selected time period is larger than the allowed time period.' =>
            '',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            '',
        'The selected date is not valid.' => 'La data selezionata non è valida.',
        'The selected end time is before the start time.' => 'L\'ora di fine selezionata precede l\'ora di inizio.',
        'There is something wrong with your time selection.' => '',
        'Please select only one element or allow modification at stat generation time.' =>
            '',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            '',
        'Please select one element for the X-axis.' => 'Seleziona un elemento per l\'asse X.',
        'You can only use one time element for the Y axis.' => '',
        'You can only use one or two elements for the Y axis.' => '',
        'Please select at least one value of this field.' => 'Seleziona almeno un valore di questo campo.',
        'Please provide a value or allow modification at stat generation time.' =>
            '',
        'Please select a time scale.' => 'Seleziona una scala temporale.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            '',
        'second(s)' => 'secondo(i)',
        'quarter(s)' => 'trimestre(i)',
        'half-year(s)' => 'semestre(i)',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            '',

        # Perl Module: Kernel/Output/HTML/SysConfig.pm
        'Cancel editing and unlock this setting' => '',
        'Reset this setting to its default value.' => '',
        'Unable to load %s!' => '',
        'Content' => 'Contenuto',

        # Perl Module: Kernel/Output/HTML/TicketMenu/Lock.pm
        'Unlock to give it back to the queue' => 'Sbloccalo per rimetterlo nella coda',
        'Lock it to work on it' => 'Bloccalo per lavorare sul ticket',

        # Perl Module: Kernel/Output/HTML/TicketMenu/TicketWatcher.pm
        'Unwatch' => 'Non osservare',
        'Watch' => 'Osserva',
        'Add to list of watched tickets' => 'Aggiungere alla lista di ticket osservati',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Ordina per',

        # Perl Module: Kernel/Output/HTML/TicketZoom/TicketInformation.pm
        'Ticket Information' => 'Informazioni sul ticket',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketLocked.pm
        'Locked Tickets New' => 'Nuovi ticket bloccati',
        'Locked Tickets Reminder Reached' => 'Reminder raggiunto ticket bloccati',
        'Locked Tickets Total' => 'Totale ticket bloccati',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketMention.pm
        'Total mentions' => '',
        'Total new mentions' => '',
        'New mentions' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketOwner.pm
        'Owned Tickets New' => '',
        'Owned Tickets Reminder Reached' => '',
        'Owned Tickets Total' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketResponsible.pm
        'Responsible Tickets New' => 'Nuovi ticket assegnati',
        'Responsible Tickets Reminder Reached' => 'Reminder raggiunto ticket assegnati',
        'Responsible Tickets Total' => 'Totale ticket assegnati',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketWatcher.pm
        'Watched Tickets New' => 'Nuovi ticket osservati',
        'Watched Tickets Reminder Reached' => 'Reminder raggiunto ticket osservati',
        'Watched Tickets Total' => 'Totale ticket osservati',

        # Perl Module: Kernel/Output/PDF/Ticket.pm
        'Ticket Dynamic Fields' => 'Campi dinamici ticket',

        # Perl Module: Kernel/System/ACL/DB/ACL.pm
        'Couldn\'t read ACL configuration file. Please make sure the file is valid.' =>
            '',

        # Perl Module: Kernel/System/Auth.pm
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Al momento non è possibile accedere al sistema per attività di manutenzione in corso.',

        # Perl Module: Kernel/System/AuthSession.pm
        'Session limit reached! Please try again later.' => 'Numero massimo di sessioni raggiunto. Per favore, riprovare più tardi.',
        'Session per user limit reached!' => '',

        # Perl Module: Kernel/System/AuthSession/DB.pm
        'Session invalid. Please log in again.' => 'Sessione non valida. Effettua di nuovo l\'accesso.',
        'Session has timed out. Please log in again.' => 'Sessione scaduta per inattività. Effettua di nuovo l\'accesso.',

        # Perl Module: Kernel/System/Calendar/Event/Transport/Email.pm
        'PGP sign only' => '',
        'PGP encrypt only' => '',
        'SMIME sign only' => '',
        'SMIME encrypt only' => '',
        'PGP and SMIME not enabled.' => '',
        'Skip notification delivery' => '',
        'Send unsigned notification' => '',
        'Send unencrypted notification' => '',

        # Perl Module: Kernel/System/Calendar/Plugin/Ticket/Create.pm
        'On the date' => '',

        # Perl Module: Kernel/System/CalendarEvents.pm
        'on' => '',
        'of year' => '',
        'of month' => '',
        'all-day' => '',

        # Perl Module: Kernel/System/Console/Command/Dev/Tools/Config2Docbook.pm
        'Configuration Options Reference' => 'Riferimenti per Opzioni di Configurazione',
        'This setting can not be changed.' => 'Questa impostazione non può essere modificata.',
        'This setting is not active by default.' => 'Questa impostazione non è attiva in modo predefinito.',
        'This setting can not be deactivated.' => 'Questa impostazione non può essere disattivata.',
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
        'before/after' => 'prima/dopo',
        'between' => 'tra',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/TextArea.pm
        'This field is required or' => 'Questo campo è obbligatorio oppure',
        'The field content is too long!' => 'Il contenuto del campo è troppo lungo!',
        'Maximum size is %s characters.' => 'La dimensione massima è di %s caratteri.',

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
        'not installed' => 'non installato',
        'installed' => 'Installato',
        'Unable to parse repository index document.' => 'Impossibile analizzare l\'indice dei repository.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Non esistono pacchetti per la vostra versione del framework in questo repository, ne sono contenuti solo per altre versioni.',
        'File is not installed!' => '',
        'File is different!' => '',
        'Can\'t read file!' => '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process.pm
        'The process "%s" and all of its data has been imported successfully.' =>
            '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Inattivo',
        'FadeAway' => '',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Somma',
        'week' => 'settimana',
        'quarter' => 'trimestre',
        'half-year' => 'semestre',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Tipo di stato',
        'Created Priority' => 'Priorità creata',
        'Created State' => 'Stato ticket',
        'Create Time' => 'Tempo di Creazione',
        'Pending until time' => '',
        'Close Time' => 'Tempo di Chiusura',
        'Escalation' => 'Escalation',
        'Escalation - First Response Time' => '',
        'Escalation - Update Time' => '',
        'Escalation - Solution Time' => '',
        'Agent/Owner' => 'Agente/Proprietario',
        'Created by Agent/Owner' => 'Creato da Agente/Proprietario',
        'Assigned to Customer User Login' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Valutato da',
        'Ticket/Article Accounted Time' => 'Ticket/Tempo allocato',
        'Ticket Create Time' => 'Istante di creazione Ticket',
        'Ticket Close Time' => 'Istante di chiusura Ticket',
        'Accounted time by Agent' => 'Tempo impiegato dall\'operatore',
        'Total Time' => 'Tempo totale',
        'Ticket Average' => 'Media Ticket',
        'Ticket Min Time' => 'Max Tempo Ticket',
        'Ticket Max Time' => 'Min Tempo Ticket',
        'Number of Tickets' => 'Numero dei Tickets',
        'Article Average' => 'Media Articolo',
        'Article Min Time' => 'Min Tempo Articolo',
        'Article Max Time' => 'Max Tempo Articolo',
        'Number of Articles' => 'Numero di Articoli',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => '',
        'Attributes to be printed' => 'Attributi sa stampare',
        'Sort sequence' => 'Sequenza di ordinamento',
        'State Historic' => '',
        'State Type Historic' => '',
        'Historic Time Range' => '',
        'Number' => 'Numero',
        'Last Changed' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketSolutionResponseTime.pm
        'Solution Average' => '',
        'Solution Min Time' => '',
        'Solution Max Time' => '',
        'Solution Average (affected by escalation configuration)' => '',
        'Solution Min Time (affected by escalation configuration)' => '',
        'Solution Max Time (affected by escalation configuration)' => '',
        'Solution Working Time Average (affected by escalation configuration)' =>
            '',
        'Solution Min Working Time (affected by escalation configuration)' =>
            '',
        'Solution Max Working Time (affected by escalation configuration)' =>
            '',
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
        'Number of Tickets (affected by escalation configuration)' => '',

        # Perl Module: Kernel/System/Stats/Static/StateAction.pm
        'Days' => 'Giorni',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/OutdatedTables.pm
        'Outdated Tables' => '',
        'Outdated tables were found in the database. These can be removed if empty.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Tabella delle Presenze',
        'Internal Error: Could not open file.' => 'Errore interno: Impossibile aprire il file.',
        'Table Check' => 'Controllo Tabelle',
        'Internal Error: Could not read file.' => 'Errore interno: Impossibile leggere il file.',
        'Tables found which are not present in the database.' => 'Trovate tabelle non presenti nel database.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Dimensione Database',
        'Could not determine database size.' => 'Impossibile determinare la dimensione del database.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Versione Database',
        'Could not determine database version.' => 'Impossibile determinare la versione del database.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Charset della Connessione Client',
        'Setting character_set_client needs to be utf8mb4.' => '',
        'Server Database Charset' => 'Charset del Server Database',
        'The setting character_set_database needs to be \'utf8mb4\'.' => '',
        'Table Charset' => 'Charset della Tabella',
        'There were non-system tables found which do not have \'utf8mb4\' as charset.' =>
            '',
        'There were tables found which do not have \'utf8mb4\' as charset.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => '',
        'The setting innodb_log_file_size must be at least 256 MB.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InvalidDefaultValues.pm
        'Invalid Default Values' => '',
        'Tables with invalid default values were found. In order to fix it automatically, please run: bin/znuny.Console.pl Maint::Database::Check --repair' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Dimensione Massima della Query',
        'The setting \'max_allowed_packet\' must be higher than 64 MB.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Default Storage Engine',
        'Table Storage Engine' => '',
        'Tables with a different storage engine than the default engine were found.' =>
            'Sono state trovate tabelle che hanno una storage engine diversa dal default del database.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'È richiesto l\'uso di MySQL 5.x o versioni superiori.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Impostazione NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG deve essere impostato a al32utf8 (ad es. GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Parametro NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'Il parametro NLS_DATE_FORMAT deve essere impostato nel formato \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'Controllo impostazione SQL NLS_DATE_FORMAT',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/PrimaryKeySequencesAndTriggers.pm
        'Primary Key Sequences and Triggers' => '',
        'The following sequences and/or triggers with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Il parametro client_encoding deve essere UNICODE o UTF8.',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Il parametro server_encoding deve essere UNICODE o UTF8.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Formato Data',
        'Setting DateStyle needs to be ISO.' => 'Il parametro DateStyle deve essere di tipo ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/PrimaryKeySequences.pm
        'Primary Key Sequences' => '',
        'The following sequences with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 9.2 or higher is required.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionZnuny.pm
        'Operating System' => 'Sistema operativo',
        'Znuny Disk Partition' => 'Partizione disco di Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Utilizzo Disco',
        'The partition where Znuny is located is almost full.' => 'La partizione dove risiede Znuny è quasi satura.',
        'The partition where Znuny is located has no disk space problems.' =>
            'La partizione disco dove risiede Znuny non ha problemi di spazio.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => 'Utilizzo delle partizioni disco',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Distribuzione',
        'Could not determine distribution.' => 'Impossibile determinare la distribuzione.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Versione di Kernel',
        'Could not determine kernel version.' => 'Impossibile ricavare la versione del Kernel',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Carico di sistema',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Moduli Perl',
        'Not all required Perl modules are correctly installed.' => 'Non tutti i moduli Perl necessari sono correttamente installati.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModulesAudit.pm
        'Perl Modules Audit' => '',
        'CPAN::Audit reported that one or more installed Perl modules have known vulnerabilities. Please note that there might be false positives for distributions patching Perl modules without changing their version number.' =>
            '',
        'CPAN::Audit did not report any known vulnerabilities in the installed Perl modules.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlVersion.pm
        'Perl Version' => 'Versione di Perl',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Spazio Swap libero (%)',
        'No swap enabled.' => 'Swap non abilitata.',
        'Used Swap Space (MB)' => 'Utilizzo spazio Swap (MB)',
        'There should be more than 60% free swap space.' => '',
        'There should be no more than 200 MB swap space used.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Webserver',
        'Loaded Apache Modules' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'Modello MPM',
        'Znuny requires apache to be run with the \'prefork\' MPM model.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Utilizzo dell\'acceleratore CGI',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            '',
        'mod_deflate Usage' => 'Utilizzo di mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Si suggerisce l\'installazione di mod_deflate per migliorare i tempi di risposta dell\'interfaccia utente',
        'mod_filter Usage' => 'Utilizzo mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'Installa mod_filter se è utilizzato mod_deflate.',
        'mod_headers Usage' => 'Utilizzo di mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Si suggerisce l\'installazione di mod_headers per migliorare i tempi di risposta dell\'interfaccia utente.',
        'Apache::Reload Usage' => 'Utilizzo di Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            '',
        'Apache2::DBI Usage' => 'Apache2::DBI Usage',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => 'Variabili di ambiente',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => '',
        'Support data could not be collected from the web server.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Versione Webserver',
        'Could not determine webserver version.' => 'Impossibile determinare la versione del server web.',

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
        'Config Settings' => 'Impostazioni di configurazione',
        'Could not determine value.' => 'Impossibile determinare il valore.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DaemonRunning.pm
        'Daemon' => 'Demone',
        'Daemon is running.' => '',
        'Daemon is not running.' => 'Il demone non è in esecuzione.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DatabaseRecords.pm
        'Database Records' => 'Record di Database',
        'Ticket History Entries' => 'Voci nello Storico Ticket',
        'Articles' => 'Articoli',
        'Attachments (DB, Without HTML)' => 'Allegati (DB, senza HTML)',
        'Customers With At Least One Ticket' => 'Clienti Con Almeno Un Ticket',
        'Dynamic Field Values' => 'Valori dei Campi Dinamici',
        'Invalid Dynamic Fields' => 'Campi Dinamici non validi',
        'Invalid Dynamic Field Values' => 'Valori dei Campi Dinamici non validi',
        'GenericInterface Webservices' => 'GenericInterface Webservice',
        'Process Tickets' => '',
        'Months Between First And Last Ticket' => 'Numero mesi fra primo e ultimo Ticket',
        'Tickets Per Month (avg)' => 'Ticket per mese (media)',
        'Open Tickets' => 'Ticket aperti',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'Nome utente e password SOAP predefiniti',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Possibile rischio sicurezza: si stanno usando le impostazioni predefinite per SOAP::User e SOAP::Password, si consiglia di cambiarle.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultUser.pm
        'Default Admin Password' => 'Password di Admin predefinita',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Attenzione: l\'utente root@localhost ha la password predefinita. Si consiglia di cambiare la password o disabilitare l\'utente.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/EmailQueue.pm
        'Email Sending Queue' => '',
        'Emails queued for sending' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FQDN.pm
        'FQDN (domain name)' => 'FQDN (nome di dominio)',
        'Please configure your FQDN setting.' => 'Configura l\'impostazione di FQDN.',
        'Domain Name' => 'Nome a Dominio',
        'Your FQDN setting is invalid.' => 'L\'impostazione del FQDN non è valida.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FileSystemWritable.pm
        'File System Writable' => 'File System scrivibile.',
        'The file system on your Znuny partition is not writable.' => 'Il file system dove risiede Znuny non è scrivibile.',

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
        'Package Installation Status' => 'Stato di installazione del pacchetto',
        'Some packages have locally modified files.' => '',
        'Some packages are not correctly installed.' => 'Alcuni pacchetti non sono correttamente installati.',
        'Package Framework Version Status' => '',
        'Some packages are not allowed for the current framework version.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageList.pm
        'Package List' => 'Lista pacchetti',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SessionConfigSettings.pm
        'Session Config Settings' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SpoolMails.pm
        'Spooled Emails' => '',
        'There are emails in var/spool that Znuny could not process.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Il parametro SystemID è invalido, può contenere solo numeri.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/DefaultType.pm
        'Default Ticket Type' => '',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Modulo indice ticket',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => '',
        'There are invalid users with locked tickets.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/OpenTickets.pm
        'You should not have more than 8,000 open tickets in your system.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => '',
        'The indexing process forces the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => '',
        'Table ticket_lock_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',
        'Orphaned Records In ticket_index Table' => '',
        'Table ticket_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/TimeSettings.pm
        'Time Settings' => '',
        'Server time zone' => 'Fuso orario server',
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
        'Znuny Version' => 'Versione Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/Znuny/ConcurrentUsers.pm
        'Concurrent Users Details' => '',
        'Concurrent Users' => 'Utenti concomitanti',

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
        'Can not lock the deployment for UserID \'%s\'!' => 'Impossibile bloccare l\'attivazione per l\'UserID \'%s\'!',
        'All Settings' => '',

        # Perl Module: Kernel/System/SysConfig/BaseValueType.pm
        'Default' => 'Predefinito',
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
        'Reset of unlock time.' => '',

        # Perl Module: Kernel/System/Ticket/Article/Backend/Chat.pm
        'Chat Participant' => '',
        'Chat Message Text' => '',

        # Perl Module: Kernel/System/Web/InterfaceAgent.pm
        'Login failed! Your user name or password was entered incorrectly.' =>
            'Accesso non riuscito! Il nome utente o la password sono errati.',
        'Authentication succeeded, but no user data record is found in the database. Please contact the administrator.' =>
            '',
        'Can`t remove SessionID.' => '',
        'Logout successful.' => 'Disconnessione avvenuta.',
        'Feature not active!' => 'Funzione non attiva!',
        'Sent password reset instructions. Please check your email.' => 'Inviate le istruzioni per il ripristino della password. Controlla l\'email.',
        'Invalid Token!' => 'Token non valido!',
        'Sent new password to %s. Please check your email.' => 'Nuova password inviata a %s. Controlla l\'email.',
        'Error: invalid session.' => '',
        'No Permission to use this frontend module!' => '',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            'Reimpostazione della password fallita. Contattare l\'Amministratore.',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'L\'indirizzo email inserito esiste già. Effettuare l\'accesso o reimposta la password.',
        'This email address is not allowed to register. Please contact support staff.' =>
            'L\'indirizzo email inserito non è abilitato per la registrazione. Contatta il supporto tecnico.',
        'Added via Customer Panel (%s)' => '',
        'Customer user can\'t be added!' => '',
        'Can\'t send account info!' => '',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Nuovo account creato. Le informazioni di accesso sono state inviate a %s. Controlla l\'email.',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'Action "%s" not found!' => 'Azione "%s" non trovata!',

        # XML Definition: Kernel/Config/Files/XML/Calendar.xml
        'Frontend module registration for the public interface.' => '',
        'Frontend module registration for the agent interface.' => '',
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
            '',
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
        'Uses richtext for viewing and editing ticket notification.' => 'Utilizza il RichText per visualizzare ed editare le notifiche dei ticket.',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            '',
        'Transport selection for appointment notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Selezione del trasporto per le notifiche degli appuntamenti. Nota: l\'impostazione di "Attivo" su 0 impedirà agli agenti di modificare le impostazioni di questo gruppo solo nelle loro preferenze personali, ma consentirà comunque agli amministratori di modificare le impostazioni per conto di un altro utente. Utilizzare \'PreferenceGroup\' per controllare in quale area devono essere visualizzate queste impostazioni nell\'interfaccia utente.',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            '',
        'Defines all the parameters for this notification transport.' => '',
        'Appointment calendar event module that updates the ticket with data from ticket appointment.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" defines the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Shows a link in the menu for creating a calendar appointment linked to the ticket directly from the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Defines an icon with link to the google map page of the current location in appointment edit screen.' =>
            '',
        'Triggers add or update of automatic calendar appointments based on certain ticket times.' =>
            'Attiva l\'aggiunta o l\'aggiornamento degli appuntamenti automatici del calendario in base a determinati orari dei ticket.',

        # XML Definition: Kernel/Config/Files/XML/Daemon.xml
        'Defines the module to display a notification in the agent interface if the Znuny Daemon is not running.' =>
            '',
        'List of CSS files to always be loaded for the agent interface.' =>
            '',
        'List of JS files to always be loaded for the agent interface.' =>
            '',
        'Type of daemon log rotation to use: Choose \'OTRS\' to let Znuny system to handle the file rotation, or choose \'External\' to use a 3rd party rotation mechanism (i.e. logrotate). Note: External rotation mechanism requires its own and independent configuration.' =>
            'Tipologie di log utilizzate dal Daemon:
- Scegli "OTRS" per lasciare che sia il sistema a gestire questa rotazione;
- Scegli "External" per utilizzare una rotazione di 3a parte (e.g. logrotate).

NOTA: i sistemi di terze parti richiedono una configurazione a se.',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if &lt;$OTRSHome&gt;/var/run/ can not be used.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => '',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            '',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            '',
        'The daemon registration for the scheduler generic agent task manager.' =>
            '',
        'The daemon registration for the scheduler cron task manager.' =>
            '',
        'The daemon registration for the scheduler future task manager.' =>
            '',
        'The daemon registration for the scheduler task worker.' => '',
        'The daemon registration for the system configuration deployment sync manager.' =>
            'La registrazione del daemon per il gestore di sync delle attivazioni della configurazione di sistema.',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Definisce il numero massimo di operazioni da eseguire contemporaneamente.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            '',
        'Defines the maximum number of affected tickets per job.' => '',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            '',
        'Delete expired cache from core modules.' => '',
        'Delete expired upload cache hourly.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => '',
        'Fetch emails via fetchmail.' => 'Recupera le email tramite fetchmail.',
        'Fetch emails via fetchmail (using SSL).' => 'Recupera le email tramite fetchmail (utilizzando SSL).',
        'Generate dashboard statistics.' => '',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Attiva gli eventi di escalation dei ticket e gli eventi di notifica per l\'escalation.',
        'Process pending tickets.' => '',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            '',
        'Fetch incoming emails from configured mail accounts.' => '',
        'Rebuild the ticket index for AgentTicketQueue.' => '',
        'Delete expired sessions.' => 'Elimina le sessioni scadute.',
        'Unlock tickets that are past their unlock timeout.' => 'Sblocca i ticket che hanno passato il tempo previsto.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be enabled in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Checks for articles that needs to be updated in the article search index.' =>
            '',
        'Checks for queued outgoing emails to be sent.' => '',
        'Checks for communication log entries to be deleted.' => '',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            '',
        'Run file based generic agent jobs (Note: module name needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Collect support data for asynchronous plug-in modules.' => '',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            '',
        'Removes old system configuration deployments (Sunday mornings).' =>
            'Rimuove le vecchie attivazioni della configurazione di sistema (domenica mattina).',
        'Removes old ticket number counters (each 10 minutes).' => '',
        'Removes old generic interface debug log entries created before the specified amount of days.' =>
            '',
        'Delete expired ticket draft entries.' => '',

        # XML Definition: Kernel/Config/Files/XML/Framework.xml
        'Disables the web installer (http://yourhost.example.com/znuny/installer.pl), to prevent the system from being hijacked. If not enabled, the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If enabled, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => '',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            '',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            '',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Controlla se l\'amministratore è autorizzato ad importare in SysConfig una configurazione di sistema salvata.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            '',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of Znuny).' =>
            '',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Defines the fully qualified domain name for external IDs generation (i.e. Message-ID, ContentID).' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the timeout (in seconds, minimum is 20 seconds) for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            '',
        'Whether to force redirect all requests from http to https protocol. Please check that your web server is configured correctly for https protocol before enable this option.' =>
            'Indica se forzare il reindirizzamento di tutte le richieste dal protocollo http al protocollo https. Per favore, seleziona questa opzione se il tuo webserver è configurato correttamente per gestire questa opzione.',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            '',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            '',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            '',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            '',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            '',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            '',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.znuny.org/manual/developer/.' =>
            '',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'The headline shown in the customer interface.' => '',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The shortcut icon for the customer interface.' => '',
        'The shortcut icon for the customer interface for the skin "default".' =>
            '',
        'The Apple touch icon for the customer interface.' => '',
        'The Apple touch icon for the customer interface for skin "default".' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            '',
        'The logo shown on top of the login box of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The shortcut icon for the agent interface.' => '',
        'The shortcut icon for the agent interface fot the skin "default".' =>
            '',
        'The Apple touch icon for the agent interface.' => '',
        'The Apple touch icon for the agent interface for the skin "default".' =>
            '',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Definisce la path URL di icone, CSS e Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Definisce la path URL delle icone di navigazione.',
        'Defines the URL CSS path.' => 'Definisce la path CSS dell\'URL',
        'Defines the URL java script path.' => 'Definisce la path URL dei java script.',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Puoi utilizzare l\'editor RichText per modificare: articoli, saluti, firme, templates standard, risposte automatiche e notifiche.',
        'Defines the URL rich text editor path.' => 'Definisce la path URL del rich text editor.',
        'Defines the default CSS used in rich text editors.' => '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            '',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            '',
        'Defines the selectable font sizes in the rich text editor.' => '',
        'Defines the selectable fonts in the rich text editor.' => '',
        'Defines the selectable format tags in the rich text editor.' => '',
        'Defines additional plugins for use in the rich text editor.' => '',
        'Defines extra content that is allowed for use in the rich text editor.' =>
            '',
        'Global settings for all popup profiles.' => '',
        'Disable autocomplete in the login screen.' => '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow Znuny to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Automated line break in text messages after x number of chars.' =>
            'A capo automatico nelle linee dopo X caratteri',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            '',
        'Limits the number of options for modernized selection fields. If this limit will be exceeded, the selection field will for performance reasons be shown as non-modernized.' =>
            '',
        'Turns on drag and drop for the main navigation.' => 'Attiva il trascinamento e rilascio per la navigazione principale.',
        'Defines the date input format used in forms (option or input fields).' =>
            '',
        'Defines the available steps in time selections. Select "Minute" to be able to select all minutes of one hour from 1-59. Select "30 Minutes" to only make full and half hours available.' =>
            '',
        'Shows time in long format (days, hours, minutes), if enabled; or in short format (days, hours), if not enabled.' =>
            '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Permette di scegliere tra mostrare gli allegati di un ticket nel browser (in linea) o renderli scaricabili (allegato).',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            '',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Definisce l\'indirizzo di un server DNS dedicato, se necessario, per i look-up di "CheckMXRecord".',
        'Sets the timeout (in seconds) for DNS resolver queries.' => '',
        'Makes the application check the syntax of email addresses.' => '',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Definire un\'espressione regolare che esclude alcuni indirizzi dal controllo sintattico (se "CheckEmailAddress" è impostato a "Sì"). Inserire una espressione regolare in questo campo per gli indirizzi email, che non sono sintatticamente validi, ma che sono necessari per il sistema (ad es. "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Definisce un\'espressione regolare che filtra tutti gli indirizzi email che non dovrebbero essere usati nell\'applicazione.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            '',
        'Determines if a button to delete a link should be displayed next to each link in each zoom mask.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            '',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            '',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            '',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            '',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            '',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            '',
        'Adds a suffix with the actual year and month to the Znuny log file. A logfile for every month will be created.' =>
            'Aggiunge un suffisso con l\'attuale anno e mese nel log di Znuny. Verrà creato un log per ogni mese.',
        'Set the minimum log level. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages. The order of log levels is: \'debug\', \'info\', \'notice\' and \'error\'.' =>
            '',
        'Defines the module to send emails. "DoNotSendEmail" doesn\'t send emails at all. Any of the "SMTP" mechanisms use a specified (external) mailserver. "Sendmail" directly uses the sendmail binary of your operating system. "Test" doesn\'t send emails, but writes them to $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/ for testing purposes.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            '',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            '',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            '',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Forza la codifica dei messaggi di posta in uscita (7bit|8bit|quoted-printable|base64).',
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
        'Defines an alternate URL, where the login link refers to.' => 'Definisce un URL alternativo, a cui si riferisce il collegamento di accesso.',
        'Defines an alternate URL, where the logout link refers to.' => 'Definisce un URL alternativo, a cui si riferisce il collegamento di uscita.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Definisce un modulo utile per caricare opzioni utente specifiche o per mostrare notizie.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            '',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            '',
        'Defines the module to generate code for periodic page reloads.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            '',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            '',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            '',
        'Defines the module to display a notification in the agent interface, if there are modified sysconfig settings that are not deployed yet.' =>
            'Definisce il modulo per mostrare una notifica nell\'interfaccia agente, nel caso in cui ci siano impostazioni di sistema modificate e non ancora attivate.',
        'Defines the module to display a notification in the agent interface, if there are invalid sysconfig settings deployed.' =>
            'Definisce il modulo per mostrare una notifica nell\'interfaccia agente, nel caso in cui ci siano attivate impostazioni di sistema non valide.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the agent interface if the system configuration is out of sync.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent has not yet selected a time zone.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            '',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            '',
        'Defines the name of the session key. E.g. Session, SessionID or Znuny.' =>
            '',
        'Defines the name of the key for customer sessions.' => '',
        'Turns on the remote ip address check. It should not be enabled if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            'Attiva il controllo dell\'indirizzo IP remoto. Non dovrebbe essere abilitato se l\'applicazione viene utilizzata, ad esempio, tramite una farm proxy o una connessione dialup, poiché l\'indirizzo IP remoto è principalmente diverso per le richieste.',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            '',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Definisce il massimo tempo di validità (in secondi) per un id di sessione.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            '',
        'Deletes requested sessions if they have timed out.' => '',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            '',
        'Stores cookies after the browser has been closed.' => 'Memorizza i cookie dopo la chiusura del browser.',
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
            '',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            '',
        'Defines the period of time (in minutes) before agent is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            '',
        'Defines the period of time (in minutes) before customer is marked as "away" due to inactivity (e.g. in the "Logged-In Users" widget or for the chat).' =>
            '',
        'This setting is deprecated. Set OTRSTimeZone instead.' => 'Questa impostazione è obsoleta. Impostare invece OTRSTimeZone.',
        'Sets the time zone being used internally by Znuny to e. g. store dates and times in the database. WARNING: This setting must not be changed once set and tickets or any other data containing date/time have been created.' =>
            '',
        'Sets the time zone that will be assigned to newly created users and will be used for users that haven\'t yet set a time zone. This is the time zone being used as default to convert date and time between the Znuny time zone and the user\'s time zone.' =>
            '',
        'If enabled, users that haven\'t selected a time zone yet will be notified to do so. Note: Notification will not be shown if (1) user has not yet selected a time zone and (2) OTRSTimeZone and UserDefaultTimeZone do match and (3) are not set to UTC.' =>
            '',
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Define the start day of the week for the date picker.' => 'Definire il giorno di inizio settimana per il selezionatore di date.',
        'Adds the permanent vacation days.' => '',
        'Adds the one time vacation days.' => '',
        'Defines the hours and week days to count the working time.' => '',
        'Defines the name of the indicated calendar.' => 'Definisce il nome del calendario indicato.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            '',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            '',
        'Adds the permanent vacation days for the indicated calendar.' =>
            '',
        'Adds the one time vacation days for the indicated calendar.' => '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            '',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your Znuny instance to stop working (probably any mask which takes input from the user).' =>
            '',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            '',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            '',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            '',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Attiva la funzione password dimenticata per gli agenti, nell\'interfaccia agenti.',
        'Shows the message of the day on login screen of the agent interface.' =>
            '',
        'Runs the system in "Demo" mode. If enabled, agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Permette agli amministratori di effettuare l\'accesso come altri utenti, tramite il pannello di amministrazione.',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Permette agli amministratori di effettuare la login come altri clienti attraverso il pannello di amministrazione clienti.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            '',
        'Sets the timeout (in seconds) for http/ftp downloads.' => '',
        'Defines the connections for http/ftp, via a proxy.' => 'Definisce le connessioni per http/ftp, tramite un proxy.',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Disattiva la convalida del certificato SSL, ad esempio se si utilizza un proxy HTTPS trasparente. Utilizzare a proprio rischio!',
        'Enables file upload in the package manager frontend.' => '',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            '',
        'List of online package repositories.' => '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Definisce l\'espressione regolare di IP per accedere al repository locale. È necessario abilitare questa funzione per avere accesso al tuo repository locale e il pacchetto package::RepositoryList è richiesto sull\'host remoto.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            '',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            '',
        'If this setting is enabled, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'Package event module file a scheduler task for update registration.' =>
            '',
        'List of all Package events to be displayed in the GUI.' => '',
        'List of all DynamicField events to be displayed in the GUI.' => '',
        'List of all LinkObject events to be displayed in the GUI.' => '',
        'DynamicField object registration.' => '',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            '',
        'Enable keep-alive connection header for SOAP responses.' => '',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png).' =>
            '',
        'Size of the logo in the page header.' => '',
        'Defines the standard size of PDF pages.' => 'Definisce la dimensione standard delle pagine PDF.',
        'Defines the maximum number of pages per PDF file.' => 'Definisce il numero massimo di pagine per file PDF.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            '',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            '',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the Znuny user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            '',
        'Defines the path to PGP binary.' => 'Definisce il percorso del binario PGP.',
        'Sets the options for PGP binary.' => 'Imposta le opzioni per il binario di PGP.',
        'Sets the preferred digest to be used for PGP binary.' => '',
        'Sets the password for private PGP key.' => 'Imposta la password per la chiave privata PGP.',
        'Enable this if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Configure your own log text for PGP.' => '',
        'Sets the method PGP will use to sing and encrypt emails. Note Inline method is not compatible with RichText messages.' =>
            '',
        'Enables S/MIME support.' => 'Abilita supporto S/MIME.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            '',
        'Specifies the directory where SSL certificates are stored.' => 'Specifica la cartella dove sono conservati i certificati SSL.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Specifica la cartella dove sono conservati i certificati privati SSL.',
        'Cache time in seconds for the SSL certificate attributes.' => '',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com).' =>
            '',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            '',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the body text for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            '',
        'Defines the body text for notification mails sent to agents, about new password.' =>
            'Definisce il corpo del testo per la mail di notifica inviata all\'agente, sulla nuova password.',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            '',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            '',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Questa impostazione consente di sovrascrivere l\'elenco dei paesi integrati con il proprio elenco di paesi. Ciò è particolarmente utile se si desidera utilizzare solo un piccolo gruppo selezionato di paesi.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            '',
        'Specifies the path of the file for the performance log.' => '',
        'Defines the maximum size (in MB) of the log file.' => 'Definisce la dimensione massima (in MB) del file di log.',
        'Defines the two-factor module to authenticate agents.' => '',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            '',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            '',
        'Defines the name of the table where the user preferences are stored.' =>
            '',
        'Defines the column to store the keys for the preferences table.' =>
            'Definisce le colonne in cui memorizzare le chiavi per la tabella delle preferenze.',
        'Defines the name of the column to store the data in the preferences table.' =>
            '',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the users avatar. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => '',
        'Activates support for customer and customer user groups.' => '',
        'Defines the groups every customer user will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer user for these groups).' =>
            '',
        'Defines the groups every customer will be in (if CustomerGroupSupport is enabled and you don\'t want to manage every customer for these groups).' =>
            '',
        'Defines a permission context for customer to group assignment.' =>
            '',
        'Defines the module that shows the currently logged in agents in the customer interface.' =>
            '',
        'Defines the module that shows the currently logged in customers in the customer interface.' =>
            '',
        'Defines the module to display a notification in the customer interface, if the customer is logged in while having system maintenance active.' =>
            '',
        'Defines the module to display a notification in the customer interface, if the customer user has not yet selected a time zone.' =>
            '',
        'Defines an alternate login URL for the customer panel..' => 'Definisce un URL alternativo, a cui si riferisce il collegamento di accesso del pannello dei clienti.',
        'Defines an alternate logout URL for the customer panel.' => 'Definisce un URL alternativo, a cui si riferisce il link di uscita del pannello dei clienti.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona Google Maps alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona Google alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona LinkedIn alla fine di un blocco di informazioni cliente.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Definire un oggetto cliente, che genera l\'icona XING alla fine di un blocco di informazioni cliente.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Questo modulo e la sua funzione PreRun() verranno eseguiti, se definiti, per ogni richiesta. Questo modulo è utile per verificare alcune opzioni utente o per visualizzare notizie su nuove applicazioni.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            '',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            '',
        'Activates lost password feature for customers.' => 'Attiva la funzione di password dimenticata per i clienti.',
        'Enables customers to create their own accounts.' => 'Permette ai clienti di creare i propri account.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            '',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            '',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the body text for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            '',
        'Defines the body text for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            '',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Definisce il corpo delle email di notifica inviate ai clienti, relative ai nuovi account.',
        'Defines the module to authenticate customers.' => 'Definisce il modulo per autenticare i clienti.',
        'If "DB" was selected for Customer::AuthModule, the encryption type of passwords must be specified.' =>
            '',
        'If "bcrypt" was selected for CryptType, use cost specified here for bcrypt hashing. Currently max. supported cost value is 31.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            '',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            '',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use Znuny. Specify the group, who may access the system.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            '',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule and special parameters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            '',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            '',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            '',
        'Defines the two-factor module to authenticate customers.' => '',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            '',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            '',
        'Defines the parameters for the customer preferences table.' => '',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Definisce i parametri di configurazione per questo oggetto, in modo che vengano mostrate nella schermata delle preferenze.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Definire tutti i parametri per questo oggetto nelle preferenze del cliente.',
        'Parameters for the pages (in which the communication log entries are shown) of the communication log overview.' =>
            '',
        'Search backend router.' => '',
        'JavaScript function for the search frontend.' => 'Funzione JavaScript per l\'interfaccia di ricerca.',
        'Main menu registration.' => '',
        'Parameters for the dashboard backend of the customer company information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer user information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Search backend default router.' => '',
        'Defines available groups for the admin overview screen.' => '',
        'Frontend module registration (show personal favorites as sub navigation items of \'Admin\').' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            '',
        'Frontend module registration for the customer interface.' => '',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Attiva i temi disponibili sul sistema. Il valore 1 significa attivi, 0 significa inattivi.',
        'Defines the default value for the action parameter.' => '',
        'Defines the shown links in the footer area of the customer and public interface of this Znuny system. The value in "Key" is the external URL, the value in "Content" is the shown label.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            '',
        'Sets the stats hook.' => '',
        'Start number for statistics counting. Every new stat increments this number.' =>
            '',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            '',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            '',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            '',
        'Defines the search limit for the stats.' => '',
        'Defines all the possible stats output formats.' => 'Definisce tutti i possibili formati di output delle statistiche.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Permette agli operatori di scambiare gli assi di una statistica che generano.',
        'Adds the following elements for use in stats: "Agent/Owner", "Created by Agent/Owner", "Responsible", "Accounted time by Agent".' =>
            '',
        'Allows invalid agents to be used in stats. Stats::UseAgentElementInStats must be active.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            '',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            '',
        'Znuny can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            '',
        'Specify the username to authenticate for the first mirror database.' =>
            '',
        'Specify the password to authenticate for the first mirror database.' =>
            '',
        'Configure any additional readonly mirror databases that you want to use.' =>
            '',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            '',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Definisce un filtro per analizzare il testo negli articoli, in modo da evidenziare certe parole chiave.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i collegamenti dietro ai numeri CVE. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usato il percorso delle immagini di Znuny. La seconda possibilità è inserire un collegamento all\'immagine.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i collegamenti dietro ai numeri bugtraq. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usato il percorso delle immagini di Znuny. La seconda possibilità è inserire un collegamento all\'immagine.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i collegamenti dietro ai numeri MSBulletin. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usato il percorso delle immagini di Znuny. La seconda possibilità è inserire un collegamento all\'immagine.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definisce un filtro per l\'output HTML per aggiungere collegamenti dietro una determinata stringa. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usato il percorso delle immagini di Znuny. La seconda possibilità è inserire un collegamento all\'immagine.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Definire un filtro per l\'output HTML per aggiungere i collegamenti dietro una determinata stringa. L\'elemento Image permette due tipi di input. Uno è il nome di una certa immagine (ad es. faq.png). In questo caso verrà usato il percorso delle immagini di Znuny. La seconda possibilità è inserire un collegamento all\'immagine.',
        'If enabled, the Znuny version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, Znuny will deliver all CSS files in minified form.' =>
            '',
        'If enabled, Znuny will deliver all JavaScript files in minified form.' =>
            '',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            '',
        'List of JS files to always be loaded for the admin interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            '',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            '',
        'List of JS files to always be loaded for the customer interface.' =>
            '',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            '',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            '',
        'Default skin for the agent interface.' => 'Tema predefinito per l\'interfaccia agente.',
        'Dark skin for the agent interface.' => '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Default skin for the customer interface.' => 'Tema predefinito per l\'interfaccia del cliente.',
        'Dark skin for the customer interface.' => '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            '',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            '',
        'Shows time use complete description (days, hours, minutes), if enabled; or just first letter (d, h, m), if not enabled.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            '',
        'Controls if the autocomplete field will be used for the customer ID selection in the AdminCustomerUser interface.' =>
            '',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            '',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            '',
        'List of all CustomerUser events to be displayed in the GUI.' => '',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            '',
        'Event module that updates customer users after an update of the Customer.' =>
            '',
        'Event module that updates customer company object name for dynamic fields.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            '',
        'Event module that updates customer user service membership if login changes.' =>
            '',
        'Event module that updates customer user object name for dynamic fields.' =>
            '',
        'Selects the cache backend to use.' => '',
        'If enabled, the cache data be held in memory.' => '',
        'If enabled, the cache data will be stored in cache backend.' => '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            '',
        'Defines the config options for the autocompletion feature.' => '',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            '',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            '',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            '',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            '',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Utilizza le nuove tipologie di "select" e "autocompletamento" nei campi della customer interface, dove possibile (InputFields).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'Utilizza le nuove tipologie di "select" e "autocompletamento" nei campi della customer interface, dove possibile (InputFields).',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            '',
        'Defines an overview module to show the address book view of a customer user list.' =>
            '',
        'Specifies the group where the user needs rw permissions so that they can edit other users preferences.' =>
            '',
        'Defines email communication channel.' => '',
        'Defines internal communication channel.' => '',
        'Defines phone communication channel.' => '',
        'Defines chat communication channel.' => '',
        'Defines groups for preferences items.' => '',
        'Defines how many deployments the system should keep.' => 'Definisce quante attivazioni vengono mantenute dal sistema.',
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
        'Cache time in seconds for the web service config backend.' => '',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            '',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            '',
        'GenericInterface module registration for the transport layer.' =>
            '',
        'GenericInterface module registration for the operation layer.' =>
            '',
        'GenericInterface module registration for the invoker layer.' => '',
        'GenericInterface module registration for the mapping layer.' => '',
        'Defines the default visibility of the article to customer for this operation.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the default auto response type of the article for this operation.' =>
            '',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            '',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            '',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            '',
        'GenericInterface module registration for an error handling module.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/ProcessManagement.xml
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate).' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Questa opzione definisce il campo dinamico in cui è archiviato un ID entità del processo Gestione processo.',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Questa opzione definisce il campo dinamico in cui è archiviato un ID entità attività Gestione processo.',
        'This option defines the process tickets default queue.' => 'Questa opzione definisce la coda predefinita dei ticket di processo.',
        'This option defines the process tickets default state.' => 'Questa opzione definisce lo stato predefinito dei ticket di processo.',
        'This option defines the process tickets default lock.' => 'Questa opzione definisce il blocco predefinito dei ticket di processo.',
        'This option defines the process tickets default priority.' => 'Questa opzione definisce la priorità predefinita dei ticket di processo.',
        'Display settings to override defaults for Process Tickets.' => '',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key =&gt; My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            '',
        'Loader module registration for the customer interface.' => '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            '',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Prefisso standard per le entità di Process Management generate automaticamente.',
        'Cache time in seconds for the DB process backend.' => '',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            '',
        'Shows existing parent/child (separated by ::) process lists in the form of a tree or a list.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'If enabled debugging information for transitions is logged.' => '',
        'Defines the priority in which the information is logged and presented.' =>
            '',
        'Filter for debugging Transitions. Note: More filters can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'DynamicField backend registration.' => '',
        'Defines the default keys and values for the transition action module parameters. Mandatory fields are marked with "(* required)". Note: For most of the keys the AttributeID can also be used, e.g. "Owner" can be "OwnerID". Keys that define the same Attribute should only be used once, e.g. "Owner" and "OwnerID" are redundant.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Ticket.xml
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            '',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            '',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            '',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Il testo all\'inizio dell\'oggetto in una risposta via email, ad es. RE, AW o AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Il testo all\'inizio dell\'oggetto quando viene inoltrata un\'email, ad es. FW, Fwd o WG.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            '',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            '',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Nome della coda personalizzata. La coda personalizzata raccoglie le tue code preferite e può essere selezionata tra le proprie impostazioni.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            '',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Cambia il proprietario del ticket a tutti (utile per ASP). Normalmente solo gli agenti con permessi R/W sulla coda del ticket verranno mostrati.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            '',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            '',
        'Automatically change the state of a ticket with an invalid owner once it is unlocked. Maps from a state type to a new ticket state.' =>
            '',
        'Enables ticket type feature.' => '',
        'Defines the default ticket type.' => '',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Permette di definire servizi e SLA per i ticket (e.g. email, desktop, network, ...), e attributi di scalo per gli SLA (se è abilitata la funzione servizio/SLA)',
        'Retains all services in listings even if they are children of invalid elements.' =>
            '',
        'Allows default services to be selected also for non existing customers.' =>
            'Permette l’inserimento di servizi di default anche per clienti non registrati.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Attiva il sistema di archivio dei ticket per avere un sistema più veloce spostando alcuni ticket fuori dall\'ambito giornaliero. Per cercare questi ticket, il contrassegno dell\'archivio deve essere abilitato nella ricerca dei ticket.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            '',
        'Removes the ticket watcher information when a ticket is archived.' =>
            '',
        'Activates the ticket archive system search in the customer interface.' =>
            'Attiva la ricerca nei ticket archiviati nell\'interfaccia cliente.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). With "Random" the ticket numbers will be generated by 12 random numbers. The format looks like SystemID.RandomNumbers (e.g. 10123456789012).' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups. If not enabled, SystemID will be changed after using the system.' =>
            '',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            '',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            '',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            '',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the Znuny user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            '',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            '',
        'Specifies the directory to store the data in, if "FS" was selected for ArticleStorage.' =>
            '',
        'Specifies whether the (MIMEBase) article attachments will be indexed and searchable.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            '',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Updates the ticket index accelerator.' => 'Carica il "Ticket Index Accelerator".',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Azzera e sblocca il proprietario di un ticket se il ticket viene spostato in un’altra coda.',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            '',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Imposta automaticamente la responsabilità del ticket (se non è già impostata) dopo il primo cambio di proprietà.',
        'When agent creates a ticket, whether or not the ticket is automatically locked to the agent.' =>
            'Quando un agente crea un ticket, viene automaticamente preso in carico dallo stesso agente.',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            '',
        'Sends the notifications which are configured in the admin interface under "Ticket Notifications".' =>
            '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Aggiorna il tempo di escalation del ticket dopo aver aggiornato un suo attributo.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Modulo evento ticket che attiva gli eventi di arresto dell\'escalation.',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Forza lo sblocco dei ticket dopo lo spostamento in un’altra coda.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Aggiorna il flag "Visualizzato" se tutti gli articoli sono stati visualizzati o un nuovo Articolo viene creato.',
        'Event module that updates tickets after an update of the Customer.' =>
            '',
        'Event module that updates tickets after an update of the Customer User.' =>
            '',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser setting.' =>
            '',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see DynamicFieldFromCustomerUser::Mapping setting for how to configure the mapping.' =>
            'Questo modulo eventi memorizza gli attributi di CustomerUser come ticket DynamicFields. Vedere DynamicFieldFromCustomerUser::Mapping setting per come configurare il mapping.',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            '',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). It will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild".' =>
            '',
        'Defines whether to index archived tickets for fulltext searches.' =>
            '',
        'Force the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            '',
        'Basic fulltext index settings. Execute "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" in order to generate a new index.' =>
            '',
        'Fulltext index regex filters to remove parts of the text.' => '',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            '',
        'Allows having a small format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo =&gt; 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            '',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            '',
        'Defines if the first article should be displayed as expanded, that is visible for the related customer. If nothing defined, latest article will be expanded.' =>
            '',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Tempo in secondi che viene aggiunto all\'ora effettiva se si imposta uno stato in sospeso (impostazione predefinita: 86400 = 1 giorno).',
        'Define the max depth of queues.' => 'Definisci la profondità massima delle code.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            '',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            '',
        'Enables ticket watcher feature only for the listed groups.' => '',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            '',
        'Enables ticket bulk action feature only for the listed groups.' =>
            '',
        'Defines time in minutes since last modification for drafts of specified type before they are considered expired.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => '',
        'Shows all the articles of the ticket (expanded) in the agent zoom view.' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            '',
        'Shows the article head information in the agent zoom view.' => '',
        'Shows a count of attachments in the ticket zoom, if the article has attachments.' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            '',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Attiva il filtro degli articoli nella visualizzazione zoom per specificare quali articoli devono essere mostrati.',
        'Displays the number of all tickets with the same CustomerID as current ticket in the ticket zoom view.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            '',
        'Controls how to display the ticket history entries as readable values.' =>
            '',
        'Permitted width for compose email windows.' => '',
        'Permitted width for compose note windows.' => '',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            '',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            '',
        'Makes the application block external content loading.' => '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            '',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            '',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            '',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            '',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            '',
        'Controls if customers have the ability to sort their tickets.' =>
            'Controlla se i clienti hanno la possibilità di ordinare i loro ticket.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Questa opzione negherà l\'accesso ai ticket dell\'società del cliente, che non vengono creati dall\'utenza cliente.',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            '',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            '',
        'Show the current owner in the customer interface.' => 'Mostra l’agente attuale nell\'interfaccia cliente.',
        'Show the current queue in the customer interface.' => 'Mostra la coda attuale nell\'interfaccia cliente.',
        'Dynamic fields shown in the ticket overview screen of the customer interface.' =>
            '',
        'Strips empty lines on the ticket preview in the queue view.' => '',
        'Shows all both ro and rw queues in the queue view.' => '',
        'Show queues even when only locked tickets are in.' => '',
        'Enable highlighting queues based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            '',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Attiva il meccanismo di blinking della coda che contiene il ticket più vecchio.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            '',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            '',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            '',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            '',
        'Strips empty lines on the ticket preview in the service view.' =>
            '',
        'Shows all both ro and rw tickets in the service view.' => '',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            '',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            '',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            '',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            '',
        'Enable highlighting services based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting services that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting services that contain untouched tickets.' =>
            '',
        'Activates a blinking mechanism of the service that contains the oldest ticket.' =>
            '',
        'Activates time accounting.' => 'Attiva Rendicontazione Tempo.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Imposta le unità di tempo preferite (ad es. unità di lavoro, ore, minuti).',
        'Defines if time accounting is mandatory in the agent interface. If enabled, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Definisce se la rendicontazione del tempo è necessaria per le azioni multiple',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            '',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            '',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            '',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            '',
        'Data used to export the search result in CSV format.' => 'Dati usati per esportare i risultati di ricerca in formato CSV',
        'Includes article create times in the ticket search of the agent interface.' =>
            '',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            '',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            '',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            '',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di free text dei ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets if service must be selected by the agent.' => 'Attivare se l’agente deve selezionare il servizio.',
        'Sets if SLA must be selected by the agent.' => 'Imposta se SLA deve essere selezionato dall\'agente.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets if queue must be selected by the agent.' => 'Attivare se l’agente deve selezionare la coda.',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if ticket owner must be selected by the agent.' => 'Imposta se il proprietario del ticket deve essere selezionato dall\'agente.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if ticket responsible must be selected by the agent.' => '',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if state must be selected by the agent.' => '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note nella schermata a testo libero del ticket nell\'interfaccia dell\'operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket free text screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            '',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            '',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di ticket telefonico in uscita dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            '',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            '',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "&lt;Queue&gt;" shows the names of the queues and for SystemAddress "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            '',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            '',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            '',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            '',
        'Sets the default article customer visibility for new phone tickets in the agent interface.' =>
            '',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            '',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            '',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            '',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            '',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            '',
        'Sets the default priority for new email tickets in the agent interface.' =>
            '',
        'Sets the default article customer visibility for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            '',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            '',
        'Sets the default text for new email tickets in the agent interface.' =>
            '',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            '',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            '',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se è necessario bloccare un ticket nella schermata di chiusura ticket dell\'interfaccia degli agenti (se il ticket non è ancora bloccato, il ticket viene bloccato automaticamente e l’agente attuale viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            '',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note nella schermata di chiusura del ticket nell\'interfaccia dell\'operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines if the note in the close ticket screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            '',
        'Shows the title field in the close ticket screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the close ticket screen of the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di note dei ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note nella schermata del ticket nell\'interfaccia dell\'operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket note screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            '',
        'Shows the title field in the ticket note screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket note screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di proprietà di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note nella schermata proprietario del ticket nella schermata ingrandita nell\'interfaccia operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket owner screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title field in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket owner screen of the agent interface.' =>
            'Permette di salvare il lavoro attuale come bozza nella schermata proprietario del ticket dell\'interfaccia agente.',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di attesa di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note ad un ticket in attesa nella schermata ingrandita dell\'interfaccia operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket pending screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title field in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket pending screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di priorità di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Permette di aggiungere note nella sezione priorità di un ticket nella schermata ingrandita dell\'interfaccia operatore. Può essere sovrascritto da Ticket::Frontend::NeedAccountedTime.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket priority screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Shows the title field in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket priority screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di responsabilità ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            '',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket responsible screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            '',
        'Shows the title field in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            '',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Prendi in carico automaticamente sull\'operatore attuale dopo aver selezionato un\'azione multipla.',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket bulk screen of the agent interface is visible for the customer by default.' =>
            '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            '',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            '',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Permette di impostare un nuovo stato di ticket nella schermata di movimento ticket dell\'interfaccia degli operatori.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket move screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di rispedizione ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            '',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di composizione ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            '',
        'Defines if the message in the ticket compose screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            '',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            '',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            '',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            '',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            '',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di inoltro ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            '',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            '',
        'Defines if the message in the ticket forward screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket forward screen of the agent interface.' =>
            '',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Permessi richiesti per utilizzare la schermata della posta in uscita nell\'interfaccia agente.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            '',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            '',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            '',
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
            '',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria nella schermata di unione di un ticket sotto zoom dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            '',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Definisce se una presa in carico è necessaria per un cambio di cliente di un ticket dell\'interfaccia degli agenti (se il ticket non è ancora preso in carico, il ticket viene preso in carico automaticamente e l’agente viene automaticamente impostato come proprietario).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Quando i ticket vengono uniti, è possibile avvisare l\'utente che li ha aperti di questa operazione attraverso una mail grazie al campo "Inform Sender". In quest\'area di testo puoi definire un testo preformattato che successivamente può essere modificato dagli agenti.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Quando i ticket vengono uniti, una nota verrà aggiunta automaticamente al ticket che non è più attivo. Qui è possibile definire l\'oggetto di questa nota (questo argomento non può essere modificato dall\'agente).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Quando due ticket vengono uniti, viene aggiunta una nota al ticket inattivo. Qui puoi modificare il corpo di questa nota (questo testo non può essere modificato dagli agenti).',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            '',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the valid state types for a ticket. If a ticket is in a state which have any state type from this setting, this ticket will be considered as open, otherwise as closed.' =>
            '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            '',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            '',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be enabled).' =>
            '',
        'Defines the state type of the reminder for pending tickets.' => '',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            '',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            '',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            '',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            '',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Barra degli strumenti Voce per un collegamento. È possibile eseguire un controllo di accesso aggiuntivo per mostrare o non mostrare questo collegamento utilizzando la chiave "Gruppo" e Contenuti come "rw:group1;move_into:group2".',
        'Agent interface notification module to see the number of tickets an agent is responsible for. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of watched tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of locked tickets. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface notification module to see the number of tickets in My Services. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access fulltext search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access CIC search via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Agent interface module to access search profiles via nav bar. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Module to generate html OpenSearch profile for short ticket search in the agent interface.' =>
            '',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            '',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            '',
        'Agent interface article notification module to check PGP.' => 'Modulo di notifica degli articoli dell\'interfaccia operatore per il controllo PGP',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Modulo dell\'interfaccia degli operatori per controllare le email in entrata nella visualizzazione ticket zoom se S/MIME è disponibile e attivo.',
        'Agent interface article notification module to check S/MIME.' =>
            'Modulo di notifica degli articoli dell\'interfaccia operatore per il controllo S/MIME',
        'Module to define the email security options to use (PGP or S/MIME).' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'Modulo per comporre messaggi firmati (PGP o S/MIME).',
        'Module to encrypt composed messages (PGP or S/MIME).' => '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            '',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a phone call outbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a phone call inbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows link to external page in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'This setting shows the sorting attributes in all overview screen, not only in queue view.' =>
            'Questa impostazione mostra gli attributi di ordinamento in tutte le schermate della panoramica, non solo nella vista coda.',
        'Defines from which ticket attributes the agent can select the result order.' =>
            '',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            '',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            '',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Module to grant access to the owner of a ticket.' => 'Modulo per accordare l\'accesso al proprietario di un ticket.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to grant access to the agent responsible of a ticket.' =>
            '',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to check the group permissions for the access to tickets.' =>
            '',
        'Module to grant access to the watcher agents of a ticket.' => '',
        'Module to grant access to the creator of a ticket.' => 'Modulo per accordare l\'accesso all\'autore di un ticket.',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            '',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            '',
        'Module to check the group permissions for customer access to tickets.' =>
            '',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            '',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            '',
        'Module to grant access if the CustomerID of the customer has necessary group permissions.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Definisce l\'aspetto del campo Da: delle email (inviate come risposte nei ticket email).',
        'Defines the separator between the agents real name and the given queue email address.' =>
            '',
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
        'Defines the calendar width in percent. Default is 95%.' => 'Definisce la larghezza del calendario in percentuale. Il valore predefinito è 95%.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            '',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            '',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            '',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            '',
        'Defines if the values for filters should be retrieved from all available tickets. If enabled, only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
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
        'Parameters of the example queue attribute Comment2.' => '',
        'Parameters of the example service attribute Comment2.' => '',
        'Parameters of the example SLA attribute Comment2.' => '',
        'Sends customer notifications just to the mapped customer.' => '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            '',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            '',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Permette ai clienti di impostare la priorità dei ticket nell\'interfaccia cliente.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            '',
        'Allows customers to set the ticket queue in the customer interface. If this is not enabled, QueueDefault should be configured.' =>
            '',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            '',
        'Allows customers to set the ticket type in the customer interface. If this is not enabled, TicketTypeDefault should be configured.' =>
            '',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            '',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Permette ai clienti di impostare il servizio dei ticket nell\'interfaccia cliente.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Permette ai clienti di impostare la SLA dei ticket nell\'interfaccia cliente.',
        'Sets if service must be selected by the customer.' => 'Imposta se il servizio deve essere selezionato dal cliente.',
        'Sets if SLA must be selected by the customer.' => 'Imposta se SLA deve essere selezionato dal cliente.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            '',
        'Sender type for new tickets from the customer inteface.' => '',
        'Defines the default history type in the customer interface.' => '',
        'Comment for new history entries in the customer interface.' => 'Commento per nuove voce nello storico dell\'interfaccia cliente.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "&lt;Queue&gt;" shows the names of the queues, and for SystemAddress, "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            '',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            '',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            '',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            '',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            '',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Permette ai clienti di cambiare la priorità dei ticket nell\'interfaccia cliente.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            '',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Permette di scegliere lo stato di composizione successivo nella schermata dei ticket dei clienti.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            '',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            '',
        'Shows the enabled ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Defines the length of the article preview in the customer interface.' =>
            '',
        'Defines the displayed style of the From field in notes that are visible for customers. A default agent name can be defined in Ticket::Frontend::CustomerTicketZoom###DefaultAgentName setting.' =>
            '',
        'Defines the default agent name in the ticket zoom view of the customer interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            '',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            '',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            '',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            '',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Definire tutti i parametri per l\'oggetto ShownTickets nelle preferenze del cliente nell\'interfaccia dei clienti.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Definire tutti i parametri per l\'oggetto RefreshTime nelle preferenze del cliente nell\'interfaccia dei clienti.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            '',
        'Default queue ID used by the system in the agent interface.' => 'ID predefinito della coda usato dal sistema nell\'interfaccia degli agenti.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Ticket ID predefinito usato dal sistema nell\'interfaccia agente.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            '',
        'Default ticket ID used by the system in the customer interface.' =>
            'Ticket ID predefinito usato dal sistema nell\'interfaccia clienti.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            '',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            '',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            '',
        'Allows generic agent to execute custom modules.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Sblocca i ticket nel momento in cui viene aggiunta una nota e il proprietario è "out-of-office".',
        'Include unknown customers in ticket filter.' => '',
        'List of all ticket events to be displayed in the GUI.' => '',
        'List of all article events to be displayed in the GUI.' => '',
        'List of all queue events to be displayed in the GUI.' => '',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            '',
        'Ignores not ticket related attributes.' => '',
        'Transport selection for ticket notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            'Selezione del trasporto per le notifiche dei ticket. Nota: l\'impostazione di "Attivo" su 0 impedirà agli agenti di modificare le impostazioni di questo gruppo solo nelle loro preferenze personali, ma consentirà comunque agli amministratori di modificare le impostazioni per conto di un altro utente. Utilizzare \'PreferenceGroup\' per controllare in quale area devono essere visualizzate queste impostazioni nell\'interfaccia utente.',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Modulo ACL che permette di chiudere ticket genitori solo se tutti i ticket figli sono già chiusi ("Stato" mostra quali stati non sono disponibili per il ticket padre finché non sono chiusi tutti i figli).',
        'Default ACL values for ticket actions.' => 'ACL di default per le azioni sui ticket.',
        'Defines which items are available in first level of the ACL structure.' =>
            '',
        'Defines which items are available in second level of the ACL structure.' =>
            '',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            '',
        'Cache time in seconds for the DB ACL backend.' => '',
        'If enabled debugging information for ACLs is logged.' => '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            '',
        'Maximal auto email responses to own email-address a day, configurable by email address (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            '',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Il numero massimo di mail recuperate contemporaneamente prima di riconnettersi al server.',
        'Default loop protection module.' => 'Modulo di default per la protezione dei loop',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            '',
        'Converts HTML mails into text messages.' => 'Converte la posta in HTML in Interazioni di testo.',
        'Specifies user id of the postmaster data base.' => '',
        'Defines the postmaster default queue.' => '',
        'Defines the default priority of new tickets.' => 'Definisce la priorità predefinita dei nuovi ticket.',
        'Defines the default state of new tickets.' => 'Definisce lo stato predefinito dei nuovi ticket.',
        'Defines the state of a ticket if it gets a follow-up.' => '',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            '',
        'Defines the PostMaster header to be used on the filter for keeping the current state of the ticket.' =>
            '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            '',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            '',
        'Indicates if a bounce e-mail should always be treated as normal follow-up.' =>
            '',
        'Defines all the X-headers that should be scanned.' => 'Definisce tutti gli X-Header che dovrebbero essere esaminati.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            '',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From =&gt; \'(.+?)@.+?\', and use () as [***] in Set =&gt;.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blocca tutte le email in entrata che non hanno un numero di ticket valido nell\'oggetto con indirizzo Da: @esempio.com.',
        'Defines the sender for rejected emails.' => 'Definisce il mittente delle email rifiutate.',
        'Defines the subject for rejected emails.' => 'Definisce l\'oggetto delle email rifiutate.',
        'Defines the body text for rejected emails.' => 'Definisce il corpo delle email rifiutate.',
        'Module to use database filter storage.' => '',
        'Module to check if arrived emails should be marked as internal (because of original forwarded internal email). IsVisibleForCustomer and SenderType define the values for the arrived email/article.' =>
            '',
        'Recognize if a ticket is a follow-up to an existing ticket using an external ticket number. Note: the first capturing group from the \'NumberRegExp\' expression will be used as the ticket number value.' =>
            '',
        'Module to filter encrypted bodies of incoming messages.' => '',
        'Module to fetch customer users SMIME certificates of incoming messages.' =>
            '',
        'Module to check if a incoming e-mail message is bounce.' => '',
        'Module used to detect if attachments are present.' => '',
        'Executes follow-up checks on Znuny Header \'X-OTRS-Bounce\'.' =>
            '',
        'Checks if an E-Mail is a followup to an existing ticket by searching the subject for a valid ticket number.' =>
            'Verifica se una email è una prosecuzione a un ticket esistente cercando l\'oggetto di un numero ticket valido.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            '',
        'Checks if an email is a follow-up to an existing ticket with external ticket number which can be found by ExternalTicketNumberRecognition filter module.' =>
            'Verifica se un\'e-mail è il seguito di un ticket esistente con un numero di ticket esterno che può essere trovato dal modulo filtro ExternalTicketNumberRecognition.',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            '',
        'If this option is enabled, tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is not enabled, no autoresponses will be sent.' =>
            '',
        'Links 2 tickets with a "Normal" type link.' => 'Collega due ticket con un collegamento di tipo "Normale".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Collega due ticket con un collegamento di tipo "PadreFiglio".',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            '',
        'For these state types the ticket numbers are striked through in the link table.' =>
            '',
        'Module to generate ticket statistics.' => 'Modulo per generare le statistiche dei ticket.',
        'Determines if the statistics module may generate ticket lists.' =>
            '',
        'Module to generate accounted time ticket statistics.' => '',
        'Module to generate ticket solution and response time statistics.' =>
            '',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            '',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            '',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            '',
        'Show article as rich text even if rich text writing is disabled.' =>
            '',
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
            '',
        'Dynamic Fields used to export the search result in CSV format.' =>
            '',
        'Dynamic fields shown in the ticket search screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (https://doc.znuny.org/manual/developer/), chapter "Ticket Event Module".' =>
            '',
        'Defines the list of types for templates.' => '',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            '',
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
            '',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            '',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            'Indica se raccogliere o meno le informazioni dagli articoli utilizzando i filtri configurati in Ticket::Frontend::ZoomCollectMetaFilters.',
        'Defines a filter to collect CVE numbers from article texts in AgentTicketZoom. The results will be displayed in a meta box next to the article. Fill in URLPreview if you would like to see a preview when moving your mouse cursor above the link element. This could be the same URL as in URL, but also an alternate one. Please note that some websites deny being displayed within an iframe (e.g. Google) and thus won\'t work with the preview mode.' =>
            '',
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
        'invalid-temporarily' => 'non valido-temporaneamente',
        'Group for default access.' => 'Gruppo per l\'accesso predefinito.',
        'Group of all administrators.' => 'Gruppo di tutti gli amministratori.',
        'Group for statistics access.' => 'Gruppo per l\'accesso alle statistiche.',
        'Group for time accounting web service access.' => '',
        'new' => 'nuovo',
        'All new state types (default: viewable).' => '',
        'open' => 'aperto',
        'All open state types (default: viewable).' => '',
        'closed' => 'chiuso',
        'All closed state types (default: not viewable).' => '',
        'pending reminder' => 'in attesa di promemoria',
        'All \'pending reminder\' state types (default: viewable).' => '',
        'pending auto' => 'in attesa di chiusura automatica',
        'All \'pending auto *\' state types (default: viewable).' => '',
        'removed' => 'rimosso',
        'All \'removed\' state types (default: not viewable).' => '',
        'merged' => 'unito',
        'State type for merged tickets (default: not viewable).' => '',
        'New ticket created by customer.' => 'Nuovo ticket creato dal cliente.',
        'closed successful' => 'chiuso con successo',
        'Ticket is closed successful.' => 'Ticket chiuso con successo.',
        'closed unsuccessful' => 'chiuso senza successo',
        'Ticket is closed unsuccessful.' => 'Ticket chiuso senza successo.',
        'Open tickets.' => 'Ticket aperti.',
        'Customer removed ticket.' => 'Il cliente ha rimosso il ticket.',
        'Ticket is pending for agent reminder.' => '',
        'pending auto close+' => 'in attesa di chiusura automatica+',
        'Ticket is pending for automatic close.' => '',
        'pending auto close-' => 'in attesa di chiusura automatica-',
        'State for merged tickets.' => 'Stato per i ticket uniti.',
        'system standard salutation (en)' => 'formula di saluto standard di sistema (en)',
        'Standard Salutation.' => 'Formula di saluto standard.',
        'system standard signature (en)' => 'firma standard di sistema (en)',
        'Standard Signature.' => 'Firma standard.',
        'Standard Address.' => 'Indirizzo standard.',
        'possible' => 'possibile',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Sono possibili prosecuzioni .per i ticket chiusi. Il ticket verrà riaperto.',
        'reject' => 'rifiuta',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Non sono possibili prosecuzioni per i ticket. Non verrà creato alcun nuovo ticket.',
        'new ticket' => 'nuovo ticket',
        'Follow-ups for closed tickets are not possible. A new ticket will be created.' =>
            'Non sono possibili prosecuzioni per i ticket chiusi. Verrà creato un nuovo ticket.',
        'Postmaster queue.' => 'Coda Postmaster.',
        'All default incoming tickets.' => '',
        'All junk tickets.' => '',
        'All misc tickets.' => '',
        'auto reply' => 'risposta automatica',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            '',
        'auto reject' => 'rifiuto automatico',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Rifiuto automatico che verrà inviato dopo che una prosecuzione è stata respinta (nel caso in cui l\'opzione prosecuzione per la coda è "reject").',
        'auto follow up' => 'follow up automatico',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Conferma automatica che viene inviata dopo che è stata ricevuta una prosecuzione per un ticket (qualora l\'opzione prosecuzione per la cosa è "possibile").',
        'auto reply/new ticket' => 'risposta automatica con creazione nuovo ticket',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Risposta automatica che verrà inviata dopo aver respinto una prosecuzione e aver creato un nuovo ticket (qualora l\'opzione prosecuzione per la coda è "new ticket").',
        'auto remove' => 'rimozione automatica',
        'Auto remove will be sent out after a customer removed the request.' =>
            '',
        'default reply (after new ticket has been created)' => '',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            '',
        'default follow-up (after a ticket follow-up has been added)' => '',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            '',
        'Unclassified' => 'Non classificato',
        '1 very low' => '1 molto bassa',
        '2 low' => '2 bassa',
        '3 normal' => '3 normale',
        '4 high' => '4 alta',
        '5 very high' => '5 molto alta',
        'unlock' => 'sbloccato',
        'lock' => 'bloccato',
        'tmp_lock' => 'tmp_lock',
        'agent' => 'Agente',
        'system' => 'sistema',
        'customer' => 'cliente',
        'Ticket create notification' => 'Notifica di creazione dei ticket',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            'Riceverai una notifica ogni volta che un nuovo ticket vine creato in una delle "Mie code" o "Miei servizi".',
        'Ticket follow-up notification (unlocked)' => '',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            'Riceverai una notifica se un cliente invia un seguito a un ticket sbloccato che è in una delle "Mie code" o "Miei servizi".',
        'Ticket follow-up notification (locked)' => '',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            'Riceverai una notifica se un cliente invia una prosecuzione a un ticket bloccato per il quale sei proprietario o responsabile.',
        'Ticket lock timeout notification' => 'Notifica scadenza blocco ticket',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            '',
        'Ticket owner update notification' => 'Notifica aggiornamento proprietario ticket',
        'Ticket responsible update notification' => 'Notifica aggiornamento responsabile ticket',
        'Ticket new note notification' => '',
        'Ticket queue update notification' => '',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            'Riceverai una notifica se un ticket viene trasferito in una delle tue "Code personali"',
        'Ticket pending reminder notification (locked)' => '',
        'Ticket pending reminder notification (unlocked)' => '',
        'Ticket escalation notification' => '',
        'Ticket escalation warning notification' => '',
        'Ticket service update notification' => '',
        'You will receive a notification if a ticket\'s service is changed to one of your "My Services".' =>
            '',
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
        'Add all' => 'Aggiungi tutto',
        'An item with this name is already present.' => 'Una voce con questo nome esiste già.',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Questa voce contiene delle sottovoci. Sei sicuro di volere rimuovere questa voce con le relative sottovoci?',

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
            'Vuoi davvero eliminare questo campo dinamico? TUTTI i dati associati saranno PERSI!',
        'Delete field' => 'Elimina campo',
        'Deleting the field and its data. This may take a while...' => 'Eliminazione del campo e dei suoi dati. Ciò potrebbe richiedere del tempo...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericAgent.js
        'Remove this dynamic field' => '',
        'Remove selection' => 'Rimuovi selezione',
        'An error occurred during communication.' => 'Errore durante la comunicazione',
        'Duplicate event.' => 'Evento duplicato.',
        'This event is already attached to the job, Please use a different one.' =>
            'Questo evento è già collegato al job, specificarne uno diverso',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceDebugger.js
        'Request Details' => 'Richiedi dettagli',
        'Request Details for Communication ID' => '',
        'Show or hide the content.' => 'Mostra o nascondi il contenuto',
        'Clear debug log' => 'Cancella il debug log',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceErrorHandling.js
        'Delete error handling module' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvoker.js
        'It is not possible to add a new event trigger because the event is not set.' =>
            '',
        'Delete this Invoker' => 'Elimina questo invoker',
        'Delete this Event Trigger' => 'Elimina questo trigger',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvokerEvent.js
        'Sorry, the only existing condition can\'t be removed.' => '',
        'Sorry, the only existing field can\'t be removed.' => '',
        'Delete conditions' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceMapping.js
        'Mapping for Key %s' => '',
        'Mapping for Key' => '',
        'Delete this Key Mapping' => 'Elimina questa mappatura',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceOperation.js
        'Delete this Operation' => 'Elimina questa operazione',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceWebservice.js
        'Clone web service' => 'Copia web service',
        'Delete operation' => 'Elimina operazione',
        'Delete invoker' => 'Elimina invoker',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Group.js
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'AVVISO: Quando cambi il nome del gruppo \'admin\', prima delle opportune modifiche in SysConfig, sarai escluso dal pannello di amministrazione! Se ciò accade ripristina il nome precedente del gruppo a \'admin\'.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js
        'Delete this Mail Account' => '',
        'Deleting the mail account and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.NotificationEvent.js
        'Do you really want to delete this notification language?' => 'Vuoi davvero eliminare questa lingua delle notifiche?',
        'Do you really want to delete this notification?' => 'Vuoi davvero eliminare questa notifica?',

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
        'Remove Entity from canvas' => '',
        'No TransitionActions assigned.' => 'Non ci sono Azioni di Transizione Assegnate.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Non ci sono interazioni assegnate. Seleziona un messaggio dall\'elenco a sinistra e trascinalo qui.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Questa attività non può essere eliminata perché è l\'attività iniziale.',
        'Remove the Transition from this Process' => 'Rimuovi la transizione da questo processo',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.js
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Non appena utilizzi il pulsante o il collegamento, abbandonerai questa schermata e lo stato corrente sarà salvato in automatico. Vuoi continuare?',
        'Delete Entity' => 'Elimina entità',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Questa attività è già in uso nel Processo. Non puoi aggiungerla due volte!',
        'Error during AJAX communication' => '',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            '',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Questa Transizione è già utilizzata per questa Attività. Non puoi aggiungerla due volte!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'Questa Azione di Transizione è già in uso in questo percorso. Non puoi usarla due volte!',
        'Hide EntityIDs' => 'Nascondi EntityID',
        'Edit Field Details' => 'Modifica i dettagli per il campo',
        'Customer interface does not support articles not visible for customers.' =>
            '',
        'Sorry, the only existing parameter can\'t be removed.' => '',
        'Are you sure you want to overwrite the config parameters?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SMIME.js
        'Do you really want to delete this certificate?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SupportDataCollector.js
        'Generating...' => 'Generazione in corso...',
        'It was not possible to generate the Support Bundle.' => '',
        'Generate Result' => '',
        'Support Bundle' => '',

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
            'La voce che si sta visualizzando fa parte di una impostazione di configurazione non ancora attivata. Non è possibile modificala nello stato attuare. Attendere fino al completamento dell\'attivazione. Nel dubbio, contattare il proprio amministratore di sistema.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemConfiguration.js
        'Loading...' => 'Caricamento in corso...',
        'Search the System Configuration' => '',
        'Please enter at least one search word to find anything.' => '',
        'Unfortunately deploying is currently not possible, maybe because another agent is already deploying. Please try again later.' =>
            'Impossibile eseguire adesso l\'attivazione, forse è in corso un\'altra attivazione da parte di un altro agente. Provare nuovamente in seguito.',
        'Deploy' => 'Attiva',
        'The deployment is already running.' => 'L\'attivazione è già in esecuzione.',
        'Deployment successful. You\'re being redirected...' => 'Attivazione riuscita. Redirezione ad altra pagina...',
        'There was an error. Please save all settings you are editing and check the logs for more information.' =>
            '',
        'Reset option is required!' => '',
        'By restoring this deployment all settings will be reverted to the value they had at the time of the deployment. Do you really want to continue?' =>
            'Ripristinando questa attivazione, verranno ripristinati tutti i valori che le impostazioni avevano al momento dell\'attivazione. Continuare?',
        'Keys with values can\'t be renamed. Please remove this key/value pair instead and re-add it afterwards.' =>
            '',
        'Unlock setting.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SystemMaintenance.js
        'Do you really want to delete this scheduled system maintenance?' =>
            'Vuoi davvero eliminare questa manutenzione di sistema pianificata?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Template.js
        'Delete this Template' => '',
        'Deleting the template and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.AppointmentCalendar.js
        'Jump' => '',
        'Timeline Month' => '',
        'Timeline Week' => '',
        'Timeline Day' => '',
        'Previous' => 'Precedente',
        'Resources' => '',
        'Su' => 'Do',
        'Mo' => 'Lu',
        'Tu' => 'Ma',
        'We' => 'Me',
        'Th' => 'Gi',
        'Fr' => 'Ve',
        'Sa' => 'Sa',
        'This is a repeating appointment' => 'Questo è un evento ripetuto',
        'Would you like to edit just this occurrence or all occurrences?' =>
            'Vorresti modificare solo questo evento o tutti gli eventi nella serie?',
        'All occurrences' => 'Tutti gli eventi',
        'Just this occurrence' => 'Solo questo evento',
        'Too many active calendars' => '',
        'Please either turn some off first or increase the limit in configuration.' =>
            '',
        'Restore default settings' => '',
        'Are you sure you want to delete this appointment? This operation cannot be undone.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerSearch.js
        'First select a customer user, then select a customer ID to assign to this ticket.' =>
            '',
        'Duplicated entry' => 'Voce duplicata',
        'It is going to be deleted from the field, please try again.' => 'Sta per essere eliminato dal campo, riprova.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerUserAddressBook.js
        'Please enter at least one search value or * to find anything.' =>
            'Inserisci almeno un termine o * per cercare tutto.',
        'Insert selected customer user(s) into the "%s:" field.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Daemon.js
        'Information about the Znuny Daemon' => 'Informazioni su Znuny Daemon',

        # JS File: var/httpd/htdocs/js/Core.Agent.Dashboard.js
        'Please check the fields marked as red for valid inputs.' => '',
        'month' => 'mese',
        'Remove active filters for this widget.' => '',

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
            '',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Spiacenti, ma non puoi disabilitare tutti i metodi per questa notifica.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.' =>
            '',
        'An unknown error occurred. Please contact the administrator.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Responsive.js
        'Switch to desktop mode' => 'Passa alla modalità desktop',

        # JS File: var/httpd/htdocs/js/Core.Agent.Search.js
        'Please remove the following words from your search as they cannot be searched for:' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.SharedSecretGenerator.js
        'Generate' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.SortedTree.js
        'This element has children elements and can currently not be removed.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketAction.js
        'Select a customer ID to assign to this ticket' => '',
        'Do you really want to continue?' => 'Vuoi davvero continuare?',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketBulk.js
        ' ...and %s more' => '',
        ' ...show less' => ' ...mostra meno',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketFormDraft.js
        'Add new draft' => 'Aggiungi nuova bozza',
        'Delete draft' => 'Cancella bozza',
        'There are no more drafts available.' => '',
        'It was not possible to delete this draft.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketZoom.js
        'Article filter' => 'Filtro articolo',
        'Apply' => 'Applica',
        'Event Type Filter' => 'Filtro tipo di evento',

        # JS File: var/httpd/htdocs/js/Core.Agent.js
        'Slide the navigation bar' => '',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Disattiva la modalità di compatibilità in Internet Explorer!',

        # JS File: var/httpd/htdocs/js/Core.App.Responsive.js
        'Switch to mobile mode' => 'Passa alla modalità mobile',

        # JS File: var/httpd/htdocs/js/Core.App.js
        'Error: Browser Check failed!' => '',
        'Reload page' => '',
        'Reload page (%ss)' => '',

        # JS File: var/httpd/htdocs/js/Core.Debug.js
        'Namespace %s could not be initialized, because %s could not be found.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Exception.js
        'An error occurred! Please check the browser error log for more details!' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Form.Validate.js
        'One or more errors occurred!' => 'Si sono verificati uno o più errori!',

        # JS File: var/httpd/htdocs/js/Core.Installer.js
        'Mail check successful.' => 'Controllo email eseguito con successo.',
        'Error in the mail settings. Please correct and try again.' => 'Errore nelle impostazioni dell\'email. Correggi e riprova.',

        # JS File: var/httpd/htdocs/js/Core.SystemConfiguration.js
        'Open this node in a new window' => '',
        'Please add values for all keys before saving the setting.' => '',
        'The key must not be empty.' => '',
        'A key with this name (\'%s\') already exists.' => '',
        'Do you really want to revert this setting to its historical value?' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.UI.Datepicker.js
        'Open date selection' => 'Apri selezione data',
        'Invalid date (need a future date)!' => 'Data non valida (è necessaria una data nel futuro)!',
        'Invalid date (need a past date)!' => 'Data non valida (è necessaria una data nel passato)!',

        # JS File: var/httpd/htdocs/js/Core.UI.InputFields.js
        'Not available' => 'Non disponibile',
        'and %s more...' => 'e %s altri...',
        'Show current selection' => '',
        'Current selection' => '',
        'Clear all' => 'Cancella tutto',
        'Filters' => 'Filtri',
        'Clear search' => 'Cancella la ricerca',

        # JS File: var/httpd/htdocs/js/Core.UI.Popup.js
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Se si abbandona questa pagina, tutti i popup verranno chiusi!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Un popup di questa schermata è già aperto. Si desidera chiuderlo ed aprire questo invece?',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Impossibile aprire una finestra di popup. Disabilita ogni blocco di popup per questa applicazione.',

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
        'There are currently no elements available to select from.' => '',

        # JS File: var/httpd/htdocs/js/Core.UI.js
        'Please only select one file for upload.' => '',
        'Sorry, you can only upload one file here.' => '',
        'Sorry, you can only upload %s files.' => '',
        'Please only select at most %s files for upload.' => '',
        'The following files are not allowed to be uploaded: %s' => 'Non è permesso caricare i seguenti file: %s',
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
        'yes' => 'sì',
        'no' => 'no',
        'This is %s' => '',
        'Complex %s with %s arguments' => '',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js
        'Grouped' => 'Raggruppato',
        'Stacked' => 'Impilato',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js
        'Stream' => 'Flusso',
        'Expanded' => 'Espanso',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '
Gentile utente,

sfortunatamente non siamo riusciti a riconoscere  un numero di ticket valido
nell\'oggetto della mail, che quindi non può essere elaborata.

Può creare un nuovo ticket dalla pagina web.

Grazie per l\'aiuto.

Il tuo helpdesk.
',
        ' (work units)' => ' (unità di lavoro)',
        ' 2 minutes' => ' 2 minuti',
        ' 5 minutes' => ' 5 minuti',
        ' 7 minutes' => ' 7 minuti',
        '%s' => '%s',
        '(UserLogin) Firstname Lastname' => '(Nome utente) Nome Cognome',
        '(UserLogin) Lastname Firstname' => '',
        '(UserLogin) Lastname, Firstname' => '(Nome utente) Cognome, Nome',
        '0 - Disabled' => '',
        '1 - Available' => '',
        '1 - Enabled' => '',
        '10 Minutes' => '',
        '100 (Expert)' => '100 (Esperto)',
        '15 Minutes' => '',
        '2 - Enabled and required' => '',
        '2 - Enabled and shown by default' => '',
        '2 - Enabled by default' => '',
        '2 Minutes' => '',
        '200 (Advanced)' => '200 (Avanzato)',
        '30 Minutes' => '',
        '300 (Beginner)' => '300 (Novizio)',
        '5 Minutes' => '',
        'A TicketWatcher Module.' => '',
        'A Website' => 'Un sito web',
        'A picture' => 'Un\'immagine',
        'AJAX functions for notification event transport web service.' =>
            '',
        'AJAX interface for the web service dynamic field backends.' => '',
        'AccountedTime' => '',
        'Activation of dynamic fields for screens.' => '',
        'Activity LinkTarget' => '',
        'Activity Notification' => '',
        'Activity.' => '',
        'ActivityID' => '',
        'Add a note to this ticket' => 'Aggiungi una nota a questo ticket',
        'Add an inbound phone call to this ticket' => '',
        'Add an outbound phone call to this ticket' => 'Aggiungi una chiamata in uscita a questo ticket',
        'Added %s time unit(s), for a total of %s time unit(s).' => '',
        'Added email. %s' => 'Aggiunta email. %s',
        'Added follow-up to ticket [%s]. %s' => 'Aggiunta prosecuzione al ticket [%s]. %s',
        'Added link to ticket "%s".' => 'Aggiunto collegamento al ticket "%s".',
        'Added note (%s).' => '',
        'Added phone call from customer.' => '',
        'Added phone call to customer.' => '',
        'Added subscription for user "%s".' => 'Aggiunta sottoscrizione per l\'utente "%s".',
        'Added system request (%s).' => '',
        'Added web request from customer.' => '',
        'Admin' => 'Admin',
        'Admin Area.' => '',
        'Admin Notification' => 'Notifiche amministrative',
        'Admin configuration dialog for dynamic field types WebserviceDropdown and WebserviceMultiselect' =>
            '',
        'Admin modules overview.' => '',
        'Admin.' => 'Admin.',
        'Administration' => 'Amministrazione',
        'Agent Customer Search' => '',
        'Agent Customer Search.' => '',
        'Agent Name' => 'Nome agente',
        'Agent Name + FromSeparator + System Address Display Name' => '',
        'Agent Preferences.' => '',
        'Agent Statistics.' => '',
        'Agent User Search' => '',
        'Agent User Search.' => '',
        'All CustomerIDs of a customer user.' => '',
        'All customer users of a CustomerID' => '',
        'All escalated tickets' => 'Tutti i ticket scalati',
        'All new tickets, these tickets have not been worked on yet' => 'Tutti i nuovi ticket, questi ticket devono ancora essere elaborati',
        'All open tickets, these tickets have already been worked on.' =>
            '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Tutti i ticket con un promemoria scaduto',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permette di avere il formato medio nella visualizzazione dei ticket (CustomerInfo =>1 - mostra anche le informazioni del cliente)',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Permette di avere il formato piccolo nella visualizzazione dei ticket (CustomerInfo =>1 - mostra anche le informazioni del cliente)',
        'Always show RichText if available' => '',
        'An additional screen to add notes to a linked ticket.' => '',
        'Answer' => 'Rispondi',
        'Appointment Calendar overview page.' => '',
        'Appointment Notifications' => '',
        'Appointment edit screen.' => '',
        'Appointment list' => '',
        'Appointment list.' => '',
        'Appointment notifications' => '',
        'Arabic (Saudi Arabia)' => 'Arabo (Arabia Saudita)',
        'ArticleTree' => '',
        'Attachment Name' => 'Nome allegato',
        'Avatar' => '',
        'Based on global RichText setting' => '',
        'Bounced to "%s".' => 'Rispedito a "%s".',
        'Bulgarian' => 'Bulgaro',
        'Bulk Action' => 'Operazioni multiple',
        'CSV Separator' => 'Separatore CSV',
        'Calendar manage screen.' => '',
        'Catalan' => 'Catalano',
        'Change password' => 'Cambio password',
        'Change queue!' => 'Cambio coda!',
        'Change the customer for this ticket' => 'Cambia il cliente di questo ticket',
        'Change the free fields for this ticket' => 'Cambia i campi liberi di questo ticket',
        'Change the owner for this ticket' => 'Cambia proprietario di questo ticket',
        'Change the priority for this ticket' => 'Cambia la priorità di questo ticket',
        'Change the responsible for this ticket' => 'Cambia il responsabile di questo ticket',
        'Change your avatar image.' => '',
        'Change your password and more.' => 'Cambia la password ed altro.',
        'Changed SLA to "%s" (%s).' => '',
        'Changed archive state to "%s".' => '',
        'Changed customer to "%s".' => 'Cliente cambiato in “%s”.',
        'Changed dynamic field %s from "%s" to "%s".' => '',
        'Changed owner to "%s" (%s).' => 'Proprietario impostato a "%s" (%s).',
        'Changed pending time to "%s".' => '',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Priorità cambiata da "%s" (%s) a "%s" (%s).',
        'Changed queue to "%s" (%s) from "%s" (%s).' => '',
        'Changed responsible to "%s" (%s).' => '',
        'Changed service to "%s" (%s).' => '',
        'Changed state from "%s" to "%s".' => '',
        'Changed title from "%s" to "%s".' => '',
        'Changed type from "%s" (%s) to "%s" (%s).' => '',
        'Chat communication channel.' => '',
        'Checkbox' => 'Caselle a scelta obbligata',
        'Child' => 'Figlio',
        'Chinese (Simplified)' => 'Cinese (semplificato)',
        'Chinese (Traditional)' => 'Cinese (tradizionale)',
        'Choose for which kind of appointment changes you want to receive notifications.' =>
            '',
        'Choose for which kind of ticket changes you want to receive notifications. Please note that you can\'t completely disable notifications marked as mandatory.' =>
            '',
        'Choose which notifications you\'d like to receive.' => '',
        'Christmas Eve' => 'Vigilia di Natale',
        'Close this ticket' => 'Chiudi questo ticket',
        'Closed tickets (customer user)' => 'Ticket chiusi (utenza cliente)',
        'Closed tickets (customer)' => 'Ticket chiusi (cliente)',
        'Column ticket filters for Ticket Overviews type "Small".' => '',
        'Comment2' => 'Commento2',
        'Communication & Notifications' => '',
        'Communication Log GUI' => '',
        'Communication log limit per page for Communication Log Overview.' =>
            '',
        'CommunicationLog Overview Limit' => '',
        'Company Status' => 'Stato Società',
        'Company Tickets.' => '',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => '',
        'Compose' => 'Componi',
        'Configure Processes.' => 'Processi Configurati.',
        'Configure and manage ACLs.' => 'Configura e gestisci le ACL.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Seleziona quale schermata mostrare dopo la creazione di un ticket.',
        'Configure which screen should be shown after marking a ticket or article as seen.' =>
            '',
        'Configure which screen should be shown after marking a ticket or article as unseen.' =>
            '',
        'Create New process ticket.' => '',
        'Create Process Ticket' => '',
        'Create Ticket' => '',
        'Create a new calendar appointment linked to this ticket' => '',
        'Create a unit test file' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Crea e gestisce gli SLA',
        'Create and manage agents.' => 'Crea e gestisce gli agenti.',
        'Create and manage appointment notifications.' => '',
        'Create and manage attachments.' => 'Crea e gestisce gli allegati.',
        'Create and manage calendars.' => '',
        'Create and manage customer users.' => 'Crea e gestisce le utenze cliente.',
        'Create and manage customers.' => 'Crea e gestisce i clienti.',
        'Create and manage dynamic fields.' => 'Crea e gestisci Campi Dinamici',
        'Create and manage groups.' => 'Crea e gestisce i gruppi',
        'Create and manage queues.' => 'Crea e gestisce le code.',
        'Create and manage responses that are automatically sent.' => 'Crea e gestisce le risposte che vengono inviate automaticamente.',
        'Create and manage roles.' => 'Crea e gestisce i ruoli.',
        'Create and manage salutations.' => 'Crea e gestisce i saluti.',
        'Create and manage services.' => 'Crea e gestisce i servizi.',
        'Create and manage signatures.' => 'Crea e gestisce le firme.',
        'Create and manage templates.' => '',
        'Create and manage ticket notifications.' => 'Crea e gestisci le notifiche dei ticket',
        'Create and manage ticket priorities.' => 'Crea e gestisce le priorità dei ticket.',
        'Create and manage ticket states.' => 'Crea e gestisce gli stati dei ticket.',
        'Create and manage ticket types.' => 'Crea e gestisce i tipi di ticket.',
        'Create and manage web services.' => 'Crea e gestisce i web service',
        'Create new Ticket.' => 'Crea nuovo ticket.',
        'Create new appointment.' => '',
        'Create new email ticket and send this out (outbound).' => 'Crea un nuovo ticket via email e invialo (in uscita).',
        'Create new email ticket.' => 'Crea nuovo ticket via email.',
        'Create new phone ticket (inbound).' => '',
        'Create new phone ticket.' => '',
        'Create new process ticket.' => '',
        'Create tickets.' => 'Crea ticket.',
        'Created ticket [%s] in "%s" with priority "%s" and state "%s".' =>
            '',
        'Creates a unit test file for this ticket and sends it to Znuny.' =>
            '',
        'Creates a unit test file for this ticket.' => '',
        'Croatian' => 'Croato',
        'Customer Administration' => 'Amministrazione clienti',
        'Customer Companies' => 'Aziende dei clienti',
        'Customer IDs' => '',
        'Customer Information Center Search.' => '',
        'Customer Information Center search.' => '',
        'Customer Information Center.' => '',
        'Customer Ticket Print Module.' => '',
        'Customer User Administration' => 'Amministrazione utenze clienti',
        'Customer User Information' => 'Informazioni sull\'utente del cliente',
        'Customer User Information Center Search.' => 'Cerca informazioni utenza del cliente',
        'Customer User Information Center search.' => '',
        'Customer User Information Center.' => 'Centro informazioni utenze dei clienti',
        'Customer User-Customer Relations' => 'Associazioni utenze clienti ↔ clienti',
        'Customer preferences.' => '',
        'Customer ticket overview' => '',
        'Customer ticket search.' => '',
        'Customer ticket zoom' => '',
        'Customer user search' => 'Ricerca utenze clienti',
        'CustomerID search' => '',
        'CustomerName' => '',
        'CustomerUser' => '',
        'Czech' => 'Ceco',
        'Danish' => 'Danese',
        'Dark' => '',
        'Dashboard overview.' => 'Panoramica cruscotto.',
        'Date / Time' => 'Data / Ora',
        'Default agent name' => '',
        'Default value for NameX' => '',
        'Define the queue comment 2.' => '',
        'Define the service comment 2.' => '',
        'Define the sla comment 2.' => '',
        'Delete this ticket' => 'Elimina questo ticket',
        'Deleted link to ticket "%s".' => 'Eliminato link al ticket "%s".',
        'Detached' => '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            '',
        'Display communication log entries.' => '',
        'Down' => 'Giù',
        'Dropdown' => 'Menu a tendina',
        'Dutch' => 'Olandese',
        'Dynamic Fields Checkbox Backend GUI' => '',
        'Dynamic Fields Date Time Backend GUI' => '',
        'Dynamic Fields Drop-down Backend GUI' => '',
        'Dynamic Fields GUI' => '',
        'Dynamic Fields Multiselect Backend GUI' => '',
        'Dynamic Fields Overview Limit' => '',
        'Dynamic Fields Text Backend GUI' => '',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields limit per page for Dynamic Fields Overview.' => '',
        'DynamicField' => '',
        'DynamicField_%s' => '',
        'E-Mail Outbound' => 'Posta in uscita',
        'Edit Customer Companies.' => '',
        'Edit Customer Users.' => '',
        'Edit appointment' => '',
        'Edit customer company' => '',
        'Email Outbound' => 'Posta in uscita',
        'Email Resend' => '',
        'Email communication channel.' => '',
        'Enabled filters.' => 'Filtri abilitati.',
        'English (Canada)' => 'Inglese (Canada)',
        'English (United Kingdom)' => 'Inglese (Regno Unito)',
        'English (United States)' => 'Inglese (Stati Uniti)',
        'Enroll process for this ticket' => '',
        'Enter your shared secret to enable two factor authentication. WARNING: Make sure that you add the shared secret to your generator application and the application works well. Otherwise you will be not able to login anymore without the two factor token.' =>
            '',
        'Escalated Tickets' => 'Ticket scalati',
        'Escalation view' => '',
        'EscalationTime' => '',
        'Estonian' => 'Estone',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Events Ticket Calendar' => '',
        'Execute SQL statements.' => 'Esegui statement SQL',
        'External' => '',
        'External Link' => '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            '',
        'Filter incoming emails.' => 'Filtra email in ingresso.',
        'Finnish' => 'Finlandese',
        'First Christmas Day' => 'Natale',
        'First Queue' => 'Prima coda',
        'First response time' => '',
        'FirstLock' => '',
        'FirstResponse' => '',
        'FirstResponseDiffInMin' => '',
        'FirstResponseInMin' => '',
        'Firstname Lastname' => 'Nome Cognome',
        'Firstname Lastname (UserLogin)' => 'Nome Cognome (Utente)',
        'Forwarded to "%s".' => 'Inoltrato a "%s".',
        'Free Fields' => 'Campi liberi',
        'French' => 'Francese',
        'French (Canada)' => 'Francese (Canada)',
        'Frontend' => '',
        'Full value' => 'Valore completo',
        'Fulltext search' => 'Ricerca testo completo',
        'Galician' => 'Galiziano',
        'Generic Info module.' => '',
        'GenericAgent' => 'AgenteGenerico',
        'GenericInterface Debugger GUI' => '',
        'GenericInterface ErrorHandling GUI' => '',
        'GenericInterface Invoker Event GUI' => '',
        'GenericInterface Invoker GUI' => '',
        'GenericInterface Operation GUI' => '',
        'GenericInterface TransportHTTPREST GUI' => '',
        'GenericInterface TransportHTTPSOAP GUI' => '',
        'GenericInterface Web Service GUI' => '',
        'GenericInterface Web Service History GUI' => '',
        'GenericInterface Web Service Mapping GUI' => '',
        'German' => 'Tedesco',
        'Gives customer users group based access to tickets from customer users of the same customer (ticket CustomerID is a CustomerID of the customer user).' =>
            '',
        'Global Search Module.' => '',
        'Go to dashboard!' => 'Vai al cruscotto!',
        'Good PGP signature.' => 'Buona firma PGP.',
        'Google Authenticator' => 'Autenticatore Google',
        'Graph: Bar Chart' => '',
        'Graph: Line Chart' => '',
        'Graph: Stacked Area Chart' => '',
        'Greek' => 'Greco',
        'Hebrew' => 'Ebraico',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Ungherese',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if <$OTRSHome>/var/run/ can not be used.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            '',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Import appointments screen.' => '',
        'Incoming Phone Call.' => 'Telefonata in entrata.',
        'Indonesian' => '',
        'Inline' => '',
        'Input' => '',
        'Interface language' => 'Lingua dell\'interfaccia',
        'Internal' => '',
        'Internal communication channel.' => '',
        'International Workers\' Day' => 'Festa dei lavoratori',
        'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.' =>
            '',
        'Italian' => 'Italiano',
        'Japanese' => 'Giapponese',
        'Korean' => '',
        'Language' => 'Lingua',
        'Large' => 'Large',
        'Last Mentions' => '',
        'Last Screen Overview' => '',
        'Last customer subject' => '',
        'Last view - limit' => '',
        'Last view - position' => '',
        'Last view - types' => '',
        'Last viewed overview' => '',
        'Last viewed screen' => '',
        'Lastname Firstname' => 'Cognome Nome',
        'Lastname Firstname (UserLogin)' => 'Cognome Nome (Utente)',
        'Lastname, Firstname' => 'Cognome, Nome',
        'Lastname, Firstname (UserLogin)' => 'Cognome, Nome (Utente)',
        'LastnameFirstname' => '',
        'Latvian' => 'Lettone',
        'Link Object' => 'Collega oggetto',
        'Link Object.' => '',
        'Link agents to groups.' => 'Collega gli agenti ai gruppi.',
        'Link agents to roles.' => 'Collega gli agenti ai ruoli.',
        'Link customer users to customers.' => '',
        'Link customer users to groups.' => '',
        'Link customer users to services.' => '',
        'Link customers to groups.' => '',
        'Link queues to auto responses.' => 'Collega le code alle risposte automatiche.',
        'Link roles to groups.' => 'Collega i ruoli ai gruppi.',
        'Link templates to attachments.' => '',
        'Link templates to queues.' => 'Collega i modelli alle code.',
        'Link this ticket to other objects' => 'Collega questo ticket ad un altro oggetto',
        'List view' => 'Elenco',
        'Lithuanian' => 'Lituano',
        'Lock / unlock this ticket' => 'Blocca/ sblocca questo ticket',
        'Locked Tickets' => 'Ticket bloccati',
        'Locked Tickets.' => 'Ticket bloccati.',
        'Locked ticket.' => 'Ticket bloccato.',
        'Logged in users.' => '',
        'Logged-In Users' => '',
        'Logout of customer panel.' => '',
        'Look into a ticket!' => 'Visualizza un ticket!',
        'Loop protection: no auto-response sent to "%s".' => '',
        'Macedonian' => '',
        'Mail Accounts' => 'Account di posta',
        'Malay' => 'Malese',
        'Manage Customer User-Customer Relations.' => 'Gestisce le associazioni utenze cliente ↔ cliente.',
        'Manage OAuth2 tokens and their configurations.' => '',
        'Manage PGP keys for email encryption.' => 'Gestisci le chiavi PGP per la cifratura delle email.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Gestisci gli account POP3 o IMAP da cui recuperare le email.',
        'Manage S/MIME certificates for email encryption.' => 'Gestisci i certificati S/MIME per la cifratura delle email.',
        'Manage System Configuration Deployments.' => 'Gestisce le attivazioni della configurazione di sistema.',
        'Manage different calendars.' => '',
        'Manage existing sessions.' => 'Gestisci le sessioni esistenti.',
        'Manage support data.' => 'Gestisci i dati di supporto.',
        'Manage system files.' => '',
        'Manage tasks triggered by event or time based execution.' => '',
        'Management of ticket attribute relations.' => '',
        'Mark as Spam!' => 'Contrassegna come spam!',
        'Mark as seen' => '',
        'Mark this ticket as junk!' => 'Marca questo ticket come spam!',
        'Mark ticket as seen' => '',
        'Mark ticket as unseen' => '',
        'Mattermost Username' => '',
        'Max. number of articles per page in TicketZoom' => '',
        'Medium' => 'Medium',
        'Mentioned in article' => '',
        'Mentioned in ticket' => '',
        'Mentions.' => '',
        'Merge this ticket and all articles into another ticket' => '',
        'Merged Ticket (%s/%s) to (%s/%s).' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Ticket <OTRS_TICKET> unito a <OTRS_MERGE_TO_TICKET>.',
        'Minute' => '',
        'Miscellaneous' => 'Varie',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            '',
        'Multiselect' => 'Selezione multipla',
        'My Queues' => 'Le mie code',
        'My Services' => 'I miei servizi',
        'My last changed tickets' => '',
        'NameX' => 'NomeX',
        'New Tickets' => 'Nuovi ticket',
        'New Window' => 'Nuova finestra',
        'New Year\'s Day' => 'Capodanno',
        'New Year\'s Eve' => 'Vigilia di Capodanno',
        'New process ticket' => '',
        'News' => '',
        'No public key found.' => 'Nessuna chiave pubblica trovata.',
        'No valid OpenPGP data found.' => 'Nessun dato OpenPGP valido trovato.',
        'None' => 'Nessuno',
        'Norwegian' => 'Norvegese',
        'Notification Settings' => 'Impostazioni delle notifiche',
        'Notified about response time escalation.' => '',
        'Notified about solution time escalation.' => '',
        'Notified about update time escalation.' => '',
        'Number of displayed tickets' => 'Numero di ticket mostrati',
        'OAuth2' => '',
        'OAuth2 token' => '',
        'OTRS' => 'OTRS',
        'Open an external link!' => '',
        'Open tickets (customer user)' => 'Ticket aperti (utenza cliente)',
        'Open tickets (customer)' => 'Ticket aperti (cliente)',
        'Option' => 'Opzione',
        'Other Customers' => 'Altri clienti',
        'Out Of Office' => 'Fuori sede',
        'Out Of Office Time' => 'Orario di assenza dall\'ufficio',
        'Out of Office users.' => '',
        'Overview Escalated Tickets.' => '',
        'Overview Refresh Time' => 'Frequenza di aggiornamento della Vista Globale',
        'Overview of all Tickets per assigned Queue.' => '',
        'Overview of all appointments.' => '',
        'Overview of all escalated tickets.' => '',
        'Overview of all open Tickets.' => 'Panoramica di tutti i ticket aperti.',
        'Overview of all open tickets.' => 'Panoramica di tutti i ticket aperti.',
        'Overview of customer tickets.' => 'Panoramica dei ticket clienti.',
        'PGP Key' => 'Chiave PGP',
        'PGP Key Management' => 'Gestione chiavi PGP',
        'PGP Keys' => 'Chiavi PGP',
        'Parent' => 'Genitore',
        'ParentChild' => '',
        'Pending time' => '',
        'People' => 'Persone',
        'Persian' => 'Iraniano',
        'Phone Call Inbound' => 'Telefonata ricevuta',
        'Phone Call Outbound' => 'Telefonata effettuata',
        'Phone Call.' => 'Telefonata.',
        'Phone call' => 'Chiamata telefonica',
        'Phone communication channel.' => '',
        'Phone-Ticket' => 'Ticket telefonico',
        'Picture Upload' => '',
        'Picture upload module.' => '',
        'Picture-Upload' => 'Caricamento immagine',
        'Plugin search' => '',
        'Plugin search module for autocomplete.' => '',
        'Polish' => 'Polacco',
        'Portuguese' => 'Portoghese',
        'Portuguese (Brasil)' => 'Portoghese (Brasile)',
        'PostMaster Filters' => 'Filtri PostMaster',
        'Print this ticket' => 'Stampa questo ticket',
        'Priorities' => 'Priorità',
        'Process Management Activity Dialog GUI' => '',
        'Process Management Activity GUI' => '',
        'Process Management Path GUI' => '',
        'Process Management Transition Action GUI' => '',
        'Process Management Transition GUI' => '',
        'Process Ticket.' => '',
        'ProcessID' => 'ID processo',
        'Processes & Automation' => '',
        'Provides a matrix overview of the tickets per state per queue' =>
            '',
        'Provides customer users access to tickets even if the tickets are not assigned to a customer user of the same customer ID(s), based on permission groups.' =>
            '',
        'Public Calendar' => '',
        'Public calendar.' => '',
        'Queue view' => 'Vista per Coda',
        'Refresh interval' => 'Intervallo di aggiornamento',
        'Reminder Tickets' => 'Tickets di promemoria',
        'Removed subscription for user "%s".' => 'Rimossa sottoscrizione per l\'utente "%s".',
        'Reports' => 'Resoconti',
        'Resend Ticket Email.' => '',
        'Resent email to "%s".' => '',
        'Responsible Tickets' => '',
        'Responsible Tickets.' => '',
        'Right' => 'Destra',
        'Romanian' => '',
        'Running Process Tickets' => '',
        'Russian' => 'Russo',
        'S/MIME Certificates' => 'Certificati S/MIME',
        'Schedule a maintenance period.' => '',
        'Screen after marking as seen' => '',
        'Screen after marking as unseen' => '',
        'Screen after new ticket' => 'Pagina da mostrare dopo un nuovo ticket',
        'Search Customer' => 'Ricerca cliente',
        'Search Ticket.' => 'Ricerca ticket.',
        'Search Tickets.' => 'Ricerca ticket.',
        'Search User' => 'Cerca utente',
        'Search tickets.' => '',
        'Second Christmas Day' => 'Santo Stefano',
        'Second Queue' => 'Seconda coda',
        'Seconds' => '',
        'Select after which period ticket overviews should refresh automatically.' =>
            '',
        'Select how many last views should be shown.' => '',
        'Select how many tickets should be shown in overviews by default.' =>
            '',
        'Select the main interface language.' => 'Scegli la lingua preferita.',
        'Select the maximum articles per page shown in TicketZoom. System default value will apply when entered empty value.' =>
            '',
        'Select the separator character used in CSV files (stats and searches). If you don\'t select a separator here, the default separator for your language will be used.' =>
            'Seleziona il carattere di separazione usato nei file CSV (statistiche e ricerca). Se non selezioni un separatore, sarà usato il separatore predefinito per la tua lingua.',
        'Select where to display the last views.' => '',
        'Select which types should be displayed.' => '',
        'Select your frontend Theme.' => 'Scegli il tema per la tua interfaccia.',
        'Select your personal time zone. All times will be displayed relative to this time zone.' =>
            '',
        'Select your preferred layout for the software.' => '',
        'Select your preferred theme for OTRS.' => '',
        'Send a unit test file' => '',
        'Send new outgoing mail from this ticket' => '',
        'Send notifications to users.' => 'Invia notifiche agli utenti.',
        'Sent "%s" notification to "%s" via "%s".' => '',
        'Sent auto follow-up to "%s".' => '',
        'Sent auto reject to "%s".' => '',
        'Sent auto reply to "%s".' => '',
        'Sent email to "%s".' => '',
        'Sent email to customer.' => '',
        'Sent notification to "%s".' => '',
        'Serbian Cyrillic' => 'Serbo (Cirillico)',
        'Serbian Latin' => 'Serbo (Latino)',
        'Service view' => '',
        'ServiceView' => '',
        'Set a new password by filling in your current password and a new one.' =>
            'Imposta una nuova password inserendo prima quella attuale.',
        'Set sender email addresses for this system.' => '',
        'Set this ticket to pending' => 'Metti questo ticket in attesa',
        'Shared Secret' => 'Segreto condiviso',
        'Show the history for this ticket' => 'Mostra la cronologia di questo ticket',
        'Show the ticket history' => 'Mostra la cronologia del ticket',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows last mention of tickets.' => '',
        'Signature data.' => 'Dati della firma.',
        'Simple' => 'Semplice',
        'Skin' => 'Tema',
        'Slovak' => 'Slovacco',
        'Slovenian' => 'Sloveno',
        'Small' => 'Small',
        'Snippet' => '',
        'Software Package Manager.' => '',
        'Solution time' => '',
        'SolutionDiffInMin' => '',
        'SolutionInMin' => '',
        'Some description!' => 'Una descrizione!',
        'Some picture description!' => 'Una descrizione dell\'immagine!',
        'Spam' => 'Spam',
        'Spanish' => 'Spagnolo',
        'Spanish (Colombia)' => 'Spagnolo (Colombia)',
        'Spanish (Mexico)' => 'Spagnolo (Messico)',
        'Started response time escalation.' => '',
        'Started solution time escalation.' => '',
        'Started update time escalation.' => '',
        'Stat#' => 'Statistica#',
        'States' => 'Stati',
        'Statistics overview.' => '',
        'Status view' => 'Vista di stato',
        'Stopped response time escalation.' => '',
        'Stopped solution time escalation.' => '',
        'Stopped update time escalation.' => '',
        'Support Agent' => '',
        'Swahili' => 'Swahili',
        'Swedish' => 'Svedese',
        'System Address Display Name' => '',
        'System Configuration Deployment' => 'Attivazione configurazione di sistema',
        'System Configuration Group' => '',
        'System Maintenance' => 'Manutenzione di sistema',
        'Textarea' => 'Area di testo',
        'Thai' => 'Thai',
        'The PGP signature is expired.' => 'La firma PGP è scaduta.',
        'The PGP signature was made by a revoked key, this could mean that the signature is forged.' =>
            '',
        'The PGP signature was made by an expired key.' => '',
        'The PGP signature with the keyid has not been verified successfully.' =>
            '',
        'The PGP signature with the keyid is good.' => '',
        'The secret you supplied is invalid. The secret must only contain letters (A-Z, uppercase) and numbers (2-7) and must consist of 16 characters.' =>
            'Il segreto che hai fornito non è valido. Il segreto deve contenere solo lettere (A-Z, maiuscole) e numeri (2-7) e deve contenere 16 caratteri.',
        'The value of the From field' => 'Il valore del campo Da',
        'Theme' => 'Tema',
        'This is a Description for Comment on Framework.' => 'Questa è una descrizione per Comment on Framework.',
        'This is a Description for DynamicField on Framework.' => 'Questa è una descrizione per DynamicField su Framework.',
        'This is the dark skin for the agent interface.' => '',
        'This is the dark skin for the customer interface.' => '',
        'This is the default orange - black skin for the customer interface.' =>
            'Questa è la skin arancione - nera predefinita per l\'interfaccia clienti.',
        'This is the default orange - black skin.' => 'Questo è il tema arancione - nero predefinito.',
        'This key is not certified with a trusted signature!' => 'Questa chiave non è certificata con una firma attendibile!',
        'This module is part of the admin area of OTRS.' => '',
        'Ticket Close.' => 'Chiusura del ticket.',
        'Ticket Compose Bounce Email.' => 'Email di rimbalzo per la composizione dei ticket.',
        'Ticket Compose email Answer.' => 'Ticket Componi risposta via email.',
        'Ticket Customer.' => 'Ticket Cliente',
        'Ticket Forward Email.' => 'Email di inoltro del ticket.',
        'Ticket FreeText.' => 'Ticket FreeText.',
        'Ticket History.' => 'Ticket storico',
        'Ticket Lock.' => 'Ticket Bloccato.',
        'Ticket Merge.' => 'Ticket unito',
        'Ticket Move.' => 'Ticket spostato.',
        'Ticket Note.' => 'Nota del ticket.',
        'Ticket Notifications' => 'Notifiche ticket',
        'Ticket Outbound Email.' => 'Email in uscita del ticket.',
        'Ticket Overview "Medium" Limit' => 'Limite di visualizzazione ticket nella visuale "Media"',
        'Ticket Overview "Preview" Limit' => 'Limite di visualizzazione ticket nella visuale "Grande"',
        'Ticket Overview "Small" Limit' => 'Limite di visualizzazione ticket nella visuale "Piccola"',
        'Ticket Owner.' => 'Ticket Proprietario',
        'Ticket Pending.' => 'Ticket in sospeso.',
        'Ticket Print.' => 'Stampa Ticket.',
        'Ticket Priority.' => 'Ticket Priorità.',
        'Ticket Queue Overview' => 'Riepilogo coda dei ticket',
        'Ticket Responsible.' => 'Ticket Responsabile.',
        'Ticket Watcher' => 'Ticket Osservazione',
        'Ticket Zoom' => 'Ticket Zoom',
        'Ticket Zoom.' => 'Ticket Zoom.',
        'Ticket bulk module.' => 'Modulo di massa ticket.',
        'Ticket creation' => '',
        'Ticket limit per page for Ticket Overview "Medium".' => 'Limite ticket per pagina per Panoramica ticket "Medio".',
        'Ticket limit per page for Ticket Overview "Preview".' => 'Limite di ticket per pagina per la panoramica dei ticket "Anteprima".',
        'Ticket limit per page for Ticket Overview "Small".' => 'Limite ticket per pagina per Panoramica ticket "Piccolo".',
        'Ticket notifications' => 'Notifiche dei ticket',
        'Ticket overview' => 'Panoramica ticket',
        'Ticket plain view of an email.' => 'Ticket vista semplice di una e-mail.',
        'Ticket split dialog.' => 'Finestra di dialogo suddivisione ticket.',
        'Ticket title' => 'Titolo del ticket',
        'Ticket zoom view.' => 'Visualizzazione zoom ticket.',
        'TicketNumber' => 'NumeroTicket',
        'Tickets.' => 'Ticket.',
        'To accept login information, such as an EULA or license.' => 'Per accettare le informazioni di accesso, come un EULA o una licenza.',
        'To download attachments.' => 'Per scaricare gli allegati.',
        'To view HTML attachments.' => 'Per visualizzare gli allegati HTML.',
        'Tree view' => 'Vista ad albero',
        'Turkish' => 'Turco',
        'Tweak the system as you wish.' => 'Modifica il sistema a tuo piacimento.',
        'Ukrainian' => 'Ucraino',
        'Unlocked ticket.' => 'Ticket sbloccato.',
        'Up' => 'Su',
        'Upcoming Events' => 'Eventi prossimi',
        'Update time' => 'Tempo per aggiornamento',
        'Upload your PGP key.' => 'Carica la tua chiave PGP.',
        'Upload your S/MIME certificate.' => 'Carica il tuo certificato S/MIME.',
        'User Profile' => 'Profilo utente',
        'UserFirstname' => 'Nome',
        'UserLastname' => 'Cognome',
        'Users, Groups & Roles' => 'Utenti, Gruppi e Ruoli',
        'Vietnam' => 'Vietnamita',
        'View performance benchmark results.' => 'Visualizza i risultati del test di performance.',
        'Watch this ticket' => 'Osserva questo ticket',
        'Watched Tickets' => 'Ticket osservati',
        'Watched Tickets.' => 'Ticket osservati.',
        'We are performing scheduled maintenance.' => 'Stiamo eseguendo una manutenzione programmata.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Stiamo eseguendo una manutenzione programmata. L\'accesso è temporaneamente non disponibile.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Stiamo eseguendo una manutenzione programmata. Torneremo in linea al più presto.',
        'Web Services' => 'Web service',
        'Web service (Dropdown)' => '',
        'Web service (Multiselect)' => '',
        'Web service dynamic field AJAX interface' => '',
        'Webservice' => '',
        'Yes, but hide archived tickets' => 'Sì, ma nascondi i ticket archiviati',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'La tua email con la richiesta numero "<OTRS_TICKET>" è stata reinviata a "<OTRS_BOUNCE_TO>". Contatta questo indirizzo per ulteriori informazioni.',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'La tua email con il numero di ticket "<OTRS_TICKET>" è stata unita a "<OTRS_MERGE_TO_TICKET>".',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            'La selezione delle tue code preferite. Vengono inoltre abilitate le notifiche via email, se abilitate, di queste ultime.',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            'La selezione dei tuoi servizi preferiti. Vengono inoltre abilitate le notifiche via email, se abilitate, di questi ultimi.',
        'Your username in Mattermost without the leading @' => '',
        'Znuny.org - News' => '',
        'Zoom' => 'Dettagli',
        'all tickets' => '',
        'archived tickets' => '',
        'attachment' => 'allegato',
        'bounce' => 'Rispedisci',
        'compose' => 'componi',
        'debug' => 'debug',
        'error' => 'errore',
        'forward' => 'inoltra',
        'info' => 'info',
        'inline' => 'In linea',
        'normal' => 'normale',
        'not archived tickets' => '',
        'notice' => 'Avviso',
        'open in current tab' => '',
        'open in new tab' => '',
        'pending' => 'in attesa',
        'phone' => 'telefono',
        'responsible' => 'responsabile',
        'reverse' => 'inverti',
        'stats' => 'statistiche',

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
