# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Translation::JavaScriptStrings)

package Kernel::Language::ms;

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
    $Self->{Completeness}        = 0.538068556361239;

    # csv separator
    $Self->{Separator}         = ';';

    $Self->{DecimalSeparator}  = '.';
    $Self->{ThousandSeparator} = ',';
    $Self->{Translation} = {

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt
        'Actions' => 'Tindakan',
        'Create New ACL' => 'Cipta Senarai Kawalan Akses baru',
        'Deploy ACLs' => 'Menggerakkan Senarai Kawalan Akses',
        'Export ACLs' => 'Eksport Senarai Kawalan Akses',
        'Filter for ACLs' => 'Tapisan pada Senarai Kawalan Akses',
        'Just start typing to filter...' => 'Hanya mula menaip untuk menapis...',
        'Configuration Import' => 'Import konfigurasi',
        'Here you can upload a configuration file to import ACLs to your system. The file needs to be in .yml format as exported by the ACL editor module.' =>
            'Di sini anda boleh memuat naik fail konfigurasi untuk mengimport Senarai Kawalan Akses kepada sistem anda. Fail tersebut perlu berada dalam format .yml sebagaimana dieksport oleh modul editor Senarai Kawalan Akses.',
        'This field is required.' => 'Bidang ini diperlukan.',
        'Overwrite existing ACLs?' => 'Gantikan Senarai Kawalan Akses yang ada sekarang?',
        'Upload ACL configuration' => 'Memuatnaik konfigurasi Senarai Kawalan Akses',
        'Import ACL configuration(s)' => 'Import konfigurasi(beberapa) Senarai Kawalan Akses',
        'Description' => 'Penerangan',
        'To create a new ACL you can either import ACLs which were exported from another system or create a complete new one.' =>
            'Untuk mencipta Senarai Kawalan Akses baharu, anda boleh mengimport Senarai Kawalan Akses yang telah dieksport oleh sistem lain atau mencipta yang baharu.',
        'Changes to the ACLs here only affect the behavior of the system, if you deploy the ACL data afterwards. By deploying the ACL data, the newly made changes will be written to the configuration.' =>
            'Perubahan kepada Senarai Kawalan Akses di sini hanya memberi kesan kepada kelakuan sistem, jika anda menggunakan data Senarai Kawalan Akses kemudiannya. Dengan menggunakan data Senarai Kawalan Akses, perubahan yang baru dibuat akan disalin pada konfigurasi.',
        'ACL Management' => 'Pengurusan Senarai Kawalan Akses',
        'ACLs' => 'Senarai Kawalan Akses',
        'Filter' => 'Tapisan',
        'Show Valid' => '',
        'Show All' => '',
        'Please note: This table represents the execution order of the ACLs. If you need to change the order in which ACLs are executed, please change the names of the affected ACLs.' =>
            'Sila ambil perhatian: Jadual ini menunjukkan  susunan pelaksanaan program Senarai Kawalan Akses. Jika anda perlu mengubah perintah itu di mana Senarai Kawalan Akses dilaksanakan, sila tukar nama-nama Senarai Kawalan Akses yang terjejas.',
        'ACL name' => 'Nama Senarai Kawalan Akses',
        'Comment' => 'Komen',
        'Validity' => 'Pengesahan',
        'Export' => 'Eksport',
        'Copy' => 'Salin',
        'No data found.' => 'Tiada data dijumpai.',
        'No matches found.' => 'Tiada padanan ditemui.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLEdit.tt
        'Go to overview' => 'Pergi ke papar semua',
        'Delete ACL' => 'Padam Senarai Kawalan Akses',
        'Delete Invalid ACL' => 'Padam Senarai Kawalan Akses tidak sah',
        'Match settings' => 'Tetapan penyesuaian',
        'Set up matching criteria for this ACL. Use \'Properties\' to match the current screen or \'PropertiesDatabase\' to match attributes of the current ticket that are in the database.' =>
            'Menetapkan kriteria penyesuaian untuk Senarai Kawalan Akses. Gunakan \'Ciri-ciri\' untuk menyesuaikan skrin semasa atau \'Ciri-ciri pangkalan data\' untuk menyesuaikan sifat-sifat tiket semasa yang berada di dalam pangkalan data.',
        'Change settings' => 'Menukar tetapan',
        'Set up what you want to change if the criteria match. Keep in mind that \'Possible\' is a white list, \'PossibleNot\' a black list.' =>
            'Tetapkan apa yang ingin anda ubah jika ciri-ciri sesuai. Ingat bahawa \'Mungkin\' ialah senarai putih, \'Tidak mungkin\' ialah senarai hitam.',
        'Check the official %sdocumentation%s.' => '',
        'Edit ACL %s' => 'Sunting Senarai Kawalan Akses',
        'Edit ACL' => '',
        'Show or hide the content' => 'Menunjukkan atau menyembunyikan kandungan',
        'Edit ACL Information' => '',
        'Name' => 'Nama',
        'Stop after match' => 'Berhenti selepas perlawanan',
        'Edit ACL Structure' => '',
        'Cancel' => 'Batal',
        'Save' => 'Simpan',
        'Save and finish' => 'Simpan dan tamat',
        'Do you really want to delete this ACL?' => 'Adakah anda benar-benar mahu memadam Senarai Kawalan Akses ini?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminACLNew.tt
        'Create a new ACL by submitting the form data. After creating the ACL, you will be able to add configuration items in edit mode.' =>
            'Cipta Senarai Kawalan Akses baru dengan mengemukakan bentuk data. Selepas mewujudkan Senarai Kawalan Akses, anda akan dapat menambah barangan konfigurasi dalam mod sunting. ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentCalendarManage.tt
        'Calendar Overview' => '',
        'Add new Calendar' => '',
        'Add Calendar' => '',
        'Import Appointments' => '',
        'Calendar Import' => '',
        'Here you can upload a configuration file to import a calendar to your system. The file needs to be in .yml format as exported by calendar management module.' =>
            '',
        'Overwrite existing entities' => 'Salin semula entiti sedia ada',
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
        'Calendar Management' => '',
        'Edit Calendar' => '',
        'Group' => 'Kumpulan',
        'Changed' => 'Diubah',
        'Created' => 'Dicipta',
        'Download' => 'Muat turun',
        'URL' => '',
        'Export calendar' => '',
        'Download calendar' => '',
        'Copy public calendar URL' => '',
        'Calendar' => 'Kalendar',
        'Calendar name' => '',
        'Calendar with same name already exists.' => '',
        'Permission group' => '',
        'Ticket Appointments' => '',
        'Rule' => 'Peraturan',
        'Remove this entry' => 'Buang lema ini',
        'Remove' => 'Buang',
        'Start date' => 'Tarikh Mula',
        'End date' => '',
        'Use options below to narrow down for which tickets appointments will be automatically created.' =>
            '',
        'Queues' => 'Barisan',
        'Please select a valid queue.' => '',
        'Search attributes' => '',
        'Add entry' => 'Tambah entri',
        'Add' => 'Tambah',
        'Define rules for creating automatic appointments in this calendar based on ticket data.' =>
            '',
        'Add Rule' => '',
        'Submit' => 'Hantar',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentImport.tt
        'Go back' => 'Kembali',
        'Uploaded file must be in valid iCal format (.ics).' => '',
        'If desired Calendar is not listed here, please make sure that you have at least \'create\' permissions.' =>
            '',
        'Appointment Import' => '',
        'Upload' => 'Muat naik',
        'Update existing appointments?' => '',
        'All existing appointments in the calendar with same UniqueID will be overwritten.' =>
            '',
        'Upload calendar' => '',
        'Import appointments' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEvent.tt
        'Add Notification' => 'Tambah pemberitahuan',
        'Export Notifications' => 'Eksport pemberitahuan',
        'Filter for Notifications' => '',
        'Filter for notifications' => '',
        'Here you can upload a configuration file to import appointment notifications to your system. The file needs to be in .yml format as exported by the appointment notification module.' =>
            '',
        'Overwrite existing notifications?' => 'Tulis ganti pemberitahuan sedia ada?',
        'Upload Notification configuration' => 'Muat naik konfigurasi Pemberitahuan',
        'Import Notification configuration' => 'Import konfigurasi Pemberitahuan',
        'Appointment Notification Management' => '',
        'Edit Notification' => 'Edit pemberitahuan',
        'List' => 'Senarai',
        'Delete' => 'Padam',
        'Delete this notification' => 'Padam pemberitahuan ini',
        'Show in agent preferences' => 'Tunjukkan dalam keutamaan ejen',
        'Agent preferences tooltip' => 'Tip alat pilihan ejen',
        'This message will be shown on the agent preferences screen as a tooltip for this notification.' =>
            'Mesej ini akan dipaparkan pada skrin pilihan ejen sebagai tip alat untuk pemberitahuan ini.',
        'Toggle this widget' => 'ubah widget ini',
        'Events' => 'Acara',
        'Event' => 'Acara',
        'Here you can choose which events will trigger this notification. An additional appointment filter can be applied below to only send for appointments with certain criteria.' =>
            '',
        'Appointment Filter' => '',
        'Type' => 'Jenis',
        'Title' => 'Tajuk',
        'Location' => 'Lokasi',
        'Team' => '',
        'Resource' => '',
        'Recipients' => 'Penerima-penerima',
        'Send to' => 'Hantar ke',
        'Send to these agents' => 'Hantar ke ejen ini',
        'Send to all group members (agents only)' => '',
        'Send to all role members' => 'Hantar ke semua peranan ahli',
        'Also send if the user is currently out of office.' => 'Juga menghantar jika pengguna sedang berada di luar pejabat.',
        'Send on out of office' => 'Menghantar di luar pejabat',
        'Notify user just once per day about a single appointment using a selected transport.' =>
            '',
        'Once per day' => 'Sekali sehari',
        'Notification Methods' => 'Kaedah pemberitahuan',
        'These are the possible methods that can be used to send this notification to each of the recipients. Please select at least one method below.' =>
            'Ini adalah kaedah yang mungkin boleh digunakan untuk menghantar pemberitahuan ini kepada setiap penerima. Sila pilih sekurang- kurangnya satu kaedah di bawah.',
        'Enable this notification method' => 'Membenarkan kaedah pemberitahuan ini',
        'Transport' => 'Pengangkutan',
        'At least one method is needed per notification.' => 'Sekurang-kurangnya satu kaedah diperlukan bagi setiap pemberitahuan.',
        'Active by default in agent preferences' => 'Aktif ikut lalai dalam kesukaan ejen',
        'This is the default value for assigned recipient agents who didn\'t make a choice for this notification in their preferences yet. If the box is enabled, the notification will be sent to such agents.' =>
            'Ini adalah nilai lazim untuk menentukan ejen-ejen penerima yang tidak membuat pilihan untuk notifikasi ini dalam kesukaan mereka lagi. Jika kotak itu dibolehkan, notifikasi itu akan dihantar kepada ejen-ejen sepatutnya.',
        'This feature is currently not available.' => 'Ciri ini tidak tersedia.',
        'No data found' => 'Tiada data dijumpai',
        'No notification method found.' => 'Tiada kaedah pemberitahuan dijumpai.',
        'Notification Text' => 'Teks Pemberitahuan',
        'This language is not present or enabled on the system. This notification text could be deleted if it is not needed anymore.' =>
            'Bahasa ini tiada atau dibolehkan dalam sistem. Teks pemberitahuan ini boleh dipadam jika ia tidak diperlukan lagi.',
        'Remove Notification Language' => 'Buang Bahasa Pemberitahuan',
        'Subject' => 'Subjek',
        'Text' => 'Teks',
        'Message body' => 'Badan Mesej',
        'Add new notification language' => 'Menambah bahasa pemberitahuan baru',
        'Save Changes' => 'Simpan Perubahan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAppointmentNotificationEventTransportEmailSettings.tt
        'Additional recipient email addresses' => 'Alamat e-mel penerima tambahan',
        'This field must have less then 200 characters.' => '',
        'Article visible for customer' => '',
        'An article will be created if the notification is sent to the customer or an additional email address.' =>
            'Sebuah artikel akan dicipta jika pemberitahuan dihantar kepada pelanggan atau alamat e-mel tambahan.',
        'Email template' => 'Templat e-mel',
        'Use this template to generate the complete email (only for HTML emails).' =>
            'Menggunakan templat ini untuk menjana e-mel yang lengkap (hanya untuk e-mel HTML).',
        'Enable email security' => 'Membolehkan keselamatan email',
        'Email security level' => 'tahap keselamatan email',
        'If signing key/certificate is missing' => 'Jika kunci penandatangan/sijil hilang',
        'If encryption key/certificate is missing' => 'Jika kunci penyulitan/sijil hilang',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAttachment.tt
        'Add Attachment' => 'Tambah lampiran',
        'Filter for Attachments' => 'Penapis lampiran',
        'Filter for attachments' => '',
        'Related Actions' => '',
        'Templates' => 'Templat',
        'Templates ↔ Attachments' => '',
        'Attachment Management' => 'Pengurusan Lampiran',
        'Edit Attachment' => 'Audit lampiran',
        'Filename' => 'Nama fail',
        'Download file' => 'Muat turun fail',
        'Delete this attachment' => 'Padam lampiran ini',
        'Do you really want to delete this attachment?' => 'Adakah anda benar ingin buang lampiran ini?',
        'Attachment' => 'Lampiran',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminAutoResponse.tt
        'Add Auto Response' => 'Tambah balasan automatik',
        'Filter for Auto Responses' => 'Penapis untuk Tindak Balas Auto',
        'Filter for auto responses' => '',
        'Queues ↔ Auto Responses' => '',
        'Auto Response Management' => 'Pengurusan tindak balas automatik',
        'Edit Auto Response' => 'Tambah balasan automatik',
        'Response' => 'Tindak balas',
        'Auto response from' => 'Jawapan automatik',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLog.tt
        'Time Range' => '',
        'Show only communication logs created in specific time range.' =>
            '',
        'Filter for Communications' => '',
        'Filter for communications' => '',
        'Hint' => 'Petunjuk',
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
        'Settings' => 'Tetapan',
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
        'Status' => 'Status',
        'Account' => '',
        'Edit' => 'Mengedit',
        'No accounts found.' => '',
        'Communication Log Details (%s)' => '',
        'Direction' => 'Arah',
        'Start Time' => 'Waktu Mula',
        'End Time' => 'Masa Akhir',
        'No communication log entries found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogCommunications.tt
        'Duration' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCommunicationLogObjectLog.tt
        '#' => '',
        'Priority' => 'Keutamaan',
        'Module' => 'Modul',
        'Information' => 'Informasi ',
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
        'Search' => 'Carian',
        'Wildcards like \'*\' are allowed.' => 'Kad bebas seperti \'*\' adalah dibenarkan.',
        'Add Customer' => 'Tambah pelanggan',
        'Select' => 'Pilih',
        'Customer Users' => 'Pengguna-pengguna Pelanggan',
        'Customers ↔ Groups' => '',
        'Customer Management' => 'Pengurusan Pelanggan',
        'Edit Customer' => 'Audit pelanggan',
        'List (only %s shown - more available)' => 'Senarai (jika %s ditunjukkan - terdapat lebih)',
        'total' => 'jumlah',
        'Please enter a search term to look for customers.' => 'Sila masukkan kata kunci untuk mencari pelanggan.',
        'Customer ID' => 'ID Pelanggan',
        'Please note' => '',
        'This customer backend is read only!' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerGroup.tt
        'Notice' => 'Catatan',
        'This feature is disabled!' => 'Ciri ini dilumpuhkan!',
        'Just use this feature if you want to define group permissions for customers.' =>
            'Gunakan fungsi ini program jika anda mahu untuk menentukan kebenaran kumpulan untuk pelanggan.',
        'Enable it here!' => 'untuk mengaktifkan!',
        'Edit Customer Default Groups' => 'Edit Kumpulan Pelanggan Sedia Ada',
        'These groups are automatically assigned to all customers.' => 'Kumpulan-kumpulan ini secara automatik diberikan kepada semua pelanggan.',
        'You can manage these groups via the configuration setting "CustomerGroupCompanyAlwaysGroups".' =>
            '',
        'Filter for Groups' => 'Penapis untuk kumpulan',
        'Select the customer:group permissions.' => 'Pilih pelanggan: dari kumpulan hak',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer).' =>
            'Jika tiada apa yang dipilih, maka terdapat tiada kebenaran dalam kumpulan ini (tiket tidak akan disediakan untuk pelanggan).',
        'Customers' => 'Pelanggan',
        'Groups' => 'Kumpulan',
        'Manage Customer-Group Relations' => 'Pelanggan tugasan kumpulan Mengurus',
        'Search Results' => 'Search Results',
        'Change Group Relations for Customer' => 'Kumpulan tugasan untuk menguruskan pelanggan',
        'Change Customer Relations for Group' => 'Tukar Perhubungan Pelanggan untuk Kumpulan',
        'Toggle %s Permission for all' => 'Toggle Kebenaran %s untuk semua',
        'Toggle %s permission for %s' => 'Toggle kebenaran %s untuk %s',
        'Customer Default Groups:' => 'Kumpulan standard:',
        'No changes can be made to these groups.' => 'Dalam kumpulan-kumpulan ini tidak boleh diubah suai.',
        'Reference' => 'Rujukan(en)',
        'ro' => 'ro',
        'Read only access to the ticket in this group/queue.' => 'Baca sahaja akses kepada tiket dalam kumpulan ini / beratur.',
        'rw' => 'rw',
        'Full read and write access to the tickets in this group/queue.' =>
            'Penuh membaca dan menulis akses kepada tiket dalam kumpulan ini / beratur.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUser.tt
        'Back to search results' => 'Kembali ke hasil carian',
        'Add Customer User' => 'Tambah Pengguna Pelanggan',
        'Customer user are needed to have a customer history and to login via customer panel.' =>
            'Pengguna pelanggan diperlukan untuk mempunyai sejarah pelanggan dan untuk log masuk melalui panel pelanggan.',
        'Customer Users ↔ Customers' => '',
        'Customer Users ↔ Groups' => '',
        'Customer Users ↔ Services' => '',
        'Customer User Management' => 'Pengurusan Pengguna Pelanggan',
        'Edit Customer User' => 'Sunting Pengguna Pelanggan',
        'List (%s total)' => 'Senarai (%s jumlah)',
        'Username' => 'Nama Pengguna',
        'Email' => 'Emel',
        'Last Login' => 'Log masuk terakhir',
        'Login as' => 'Log masuk sebagai',
        'Switch to customer' => 'Tukar kepada pelanggan',
        'This customer backend is read only, but the customer user preferences can be changed!' =>
            '',
        'This field is required and needs to be a valid email address.' =>
            'Bidang ini diperlukan dan mestilah alamat e-mel yang sah.',
        'This email address is not allowed due to the system configuration.' =>
            'Ini alamat e-mel tidak dibenarkan oleh konfigurasi sistem semasa.',
        'This email address failed MX check.' => 'Untuk alamat e-mel MX-ujian gagal.',
        'DNS problem, please check your configuration and the error log.' =>
            'Masalah DNS, sila semak konfigurasi anda dan log ralat.',
        'The syntax of this email address is incorrect.' => 'Sintaks alamat e-mel tidak sah.',
        'This CustomerID is invalid.' => '',
        'Effective Permissions for Customer User' => '',
        'Group Permissions' => '',
        'This customer user has no group permissions.' => '',
        'Table above shows effective group permissions for the customer user. The matrix takes into account all inherited permissions (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            '',
        'Customer Access' => '',
        'Customer' => 'Pelanggan',
        'This customer user has no customer access.' => '',
        'Table above shows granted customer access for the customer user by permission context. The matrix takes into account all inherited access (e.g. via customer groups). Note: The table does not consider changes made to this form without submitting it.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserCustomer.tt
        'Select the customer user:customer relations.' => '',
        'Manage Customer User-Customer Relations' => '',
        'Change Customer Relations for Customer User' => '',
        'Change Customer User Relations for Customer' => '',
        'Toggle active state for all' => 'ubah keadaan aktif untuk semua',
        'Active' => 'Aktif',
        'Toggle active state for %s' => 'ubah keadaan aktif untuk %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserGroup.tt
        'Just use this feature if you want to define group permissions for customer users.' =>
            '',
        'Edit Customer User Default Groups' => '',
        'These groups are automatically assigned to all customer users.' =>
            '',
        'You can manage these groups via the configuration setting "CustomerGroupAlwaysGroups".' =>
            'Anda boleh menguruskan kumpulan ini melalui tetapan tatarajah "CustomerGroupAlwaysGroups".',
        'Filter for groups' => '',
        'Select the customer user - group permissions.' => '',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the customer user).' =>
            '',
        'Manage Customer User-Group Relations' => '',
        'Customer User Default Groups:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminCustomerUserService.tt
        'Edit default services' => 'Standard Perkhidmatan sunting',
        'Filter for Services' => 'Tapisan Perkhidmatan',
        'Filter for services' => '',
        'Services' => 'Servis',
        'Service Level Agreements' => 'Tahap Persetujuan Perkhidmatan',
        'Manage Customer User-Service Relations' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicField.tt
        'Add new field for object' => 'Tambah Bidang Baru bagi objek',
        'Filter for Dynamic Fields' => '',
        'Filter for dynamic fields' => '',
        'To add a new field, select the field type from one of the object\'s list, the object defines the boundary of the field and it can\'t be changed after the field creation.' =>
            'Untuk menambah bidang baru , pilih jenis medan dari salah satu daripada senarai objek, objek yang mentakrifkan sempadan medan dan ia tidak boleh diubah selepas penciptaan medan.',
        'Import and export of configurations' => '',
        'Upload a file in YAML format (as provided by the export) to import dynamic field configurations.' =>
            '',
        'Overwrite existing configurations' => '',
        'Import configurations' => '',
        'Export configurations' => '',
        'Process Management' => 'Pengurusan Proses',
        'Dynamic fields ↔ Screens' => '',
        'Dynamic Fields Management' => 'Pengurusan Dinamik Bidang',
        'Dynamic Fields List' => 'Senarai bidang yang dinamik',
        'Dynamic fields per page' => 'Dinamik bidang per halaman',
        'Label' => 'Label',
        'Order' => 'Menyusun',
        'Object' => 'Objek',
        'Delete this field' => 'Padam bidang ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldCheckbox.tt
        'Go back to overview' => 'Pergi kembali ke gambaran keseluruhan',
        'Dynamic Fields' => 'Perlengkapan dinamik',
        'General' => 'Umum',
        'This field is required, and the value should be alphabetic and numeric characters only.' =>
            'Bidang ini diperlukan, dan nilai harus aksara abjad dan nombor sahaja.',
        'Must be unique and only accept alphabetic and numeric characters.' =>
            'Mestilah unik dan hanya menerima aksara abjad dan nombor.',
        'Changing this value will require manual changes in the system.' =>
            'Menukar nilai ini akan memerlukan perubahan manual dalam sistem.',
        'This is the name to be shown on the screens where the field is active.' =>
            'Ini adalah nama yang ditunjukkan pada skrin di mana bidang aktif.',
        'Field order' => 'Turutan bidang',
        'This field is required and must be numeric.' => 'Bidang ini diperlukan dan mesti terdiri daripada angka.',
        'This is the order in which this field will be shown on the screens where is active.' =>
            'Ini adalah perintah di mana bidang ini akan ditunjukkan pada skrin di mana aktif.',
        'Is not possible to invalidate this entry, all config settings have to be changed beforehand.' =>
            '',
        'Field type' => 'Jenis bidang',
        'Object type' => 'Jenis objek',
        'Internal field' => 'Medan dalaman',
        'This field is protected and can\'t be deleted.' => 'Medan ini adalah dilindungi dan tidak boleh dihapuskan.',
        'This dynamic field is used in the following config settings:' =>
            '',
        'Field Settings' => 'Aturan bidang',
        'Default value' => 'Nilai sedia ada',
        'This is the default value for this field.' => 'Ini adalah nilai lalai untuk bidang ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldConfigurationImportExport.tt
        'Select the dynamic fields you want to import and click on \'Import\'.' =>
            '',
        'Select the dynamic fields whose configuration you want to export and click on \'Export\' to generate a YAML file.' =>
            '',
        'Dynamic field configurations: %s' => '',
        'Dynamic fields' => 'Medan dinamik',
        'For the following dynamic fields a configuration cannot be imported because of an invalid backend.' =>
            '',
        'Select all field configurations' => '',
        'Select all screen configurations' => '',
        'The uploaded file does not contain configuration(s), is not a YAML file, is damaged or has the wrong structure.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDateTime.tt
        'Default date difference' => 'Perbezaan tarikh sedia ada',
        'This field must be numeric.' => 'Bidang ini mestilah angka.',
        'The difference from NOW (in seconds) to calculate the field default value (e.g. 3600 or -60).' =>
            'Perbezaan dari SEKARANG (dalam saat) untuk mengira nilai bidang lalai (contohnya 3600 atau -60).',
        'Define years period' => 'Tentukan tahun',
        'Activate this feature to define a fixed range of years (in the future and in the past) to be displayed on the year part of the field.' =>
            'Aktifkan ciri ini untuk menentukan pelbagai tetap tahun (pada masa hadapan dan pada masa lalu) akan dipaparkan pada bahagian tahun bidang.',
        'Years in the past' => 'Tahun pada masa lalu',
        'Years in the past to display (default: 5 years).' => 'Tahun pada masa lalu untuk memaparkan (lalai: 5 tahun).',
        'Years in the future' => 'Tahun pada masa hadapan',
        'Years in the future to display (default: 5 years).' => 'Tahun akan datang untuk memaparkan (lalai: 5 tahun).',
        'Show link' => 'Papar pautan',
        'Reserved keywords. The following placeholders are not allowed:' =>
            '',
        'Here you can specify an optional HTTP link for the field value in Overviews and Zoom screens.' =>
            'Disini anda boleh menyatakan pilihan pautan HTTP untuk nilai bidang dalam gambaran keseluruhan dan skrin Zoom.',
        'If special characters (&, @, :, /, etc.) should not be encoded, use \'url\' instead of \'uri\' filter.' =>
            '',
        'Example' => 'Contoh',
        'Link for preview' => 'Sambungan untuk pratonton',
        'If filled in, this URL will be used for a preview which is shown when this link is hovered in ticket zoom. Please note that for this to work, the regular URL field above needs to be filled in, too.' =>
            'Jika diisi, URL ini akan digunakan untuk pratonton yang mana ditunjukkan apabila pautan ini berlegar-legar dalam zum tiket. Sila pastikan untuk perkara ini berjaya, kawasan URL biasa yang diatas perlu diisi, juga.',
        'Restrict entering of dates' => 'Hadkan memasukkan tarikh',
        'Here you can restrict the entering of dates of tickets.' => 'Di sini anda boleh menyekat kemasukan tarikh tiket.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldDropdown.tt
        'Possible values' => 'nilai yang mungkin',
        'Key' => 'Kunci',
        'Value' => 'Nilai',
        'Remove value' => 'Buang nilai',
        'Add value' => 'Tambah nilai',
        'Add Value' => 'Tambah Nilai',
        'Add empty value' => 'Tambah nilai kosong',
        'Activate this option to create an empty selectable value.' => 'Aktifkan pilihan ini untuk mewujudkan nilai dipilih kosong.',
        'Tree View' => 'Lihat Pokok',
        'Activate this option to display values as a tree.' => 'Aktifkan pilihan ini untuk memaparkan nilai sebagai pokok.',
        'Translatable values' => 'nilai yang boleh diterjemahkan',
        'If you activate this option the values will be translated to the user defined language.' =>
            'Jika anda mengaktifkan pilihan ini nilai akan diterjemahkan kepada pengguna ditakrifkan bahasa.',
        'Note' => 'Nota',
        'You need to add the translations manually into the language translation files.' =>
            'Anda perlu menambah terjemahan secara manual ke dalam fail terjemahan bahasa.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldScreenConfiguration.tt
        'Assignment of dynamic fields to screens' => '',
        'Overview' => 'Gambaran keseluruhan',
        'Screens' => '',
        'Overview Default Columns' => '',
        'Add dynamic field' => '',
        'You can assign elements by dragging and dropping them to the lists of available, disabled, assigned and required elements.' =>
            '',
        'Filter available elements' => '',
        'Assign selected elements to this list' => '',
        'Select all' => 'Pilih semua',
        'Filter disabled elements' => '',
        'Filter assigned elements' => '',
        'Filter required elements' => '',
        'Reset' => 'Set Semula',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminDynamicFieldText.tt
        'Number of rows' => 'Bilangan baris',
        'Specify the height (in lines) for this field in the edit mode.' =>
            'Tentukan ketinggian (dalam barisan) untuk bidang ini dalam mod edit.',
        'Number of cols' => 'Bilangan lajur',
        'Specify the width (in characters) for this field in the edit mode.' =>
            'Menetapkan lebar dalam aksara untuk bidang ini dalam mod edit.',
        'Check RegEx' => 'Semak UngkapanBiasa',
        'Here you can specify a regular expression to check the value. The regex will be executed with the modifiers xms.' =>
            'Di sini anda boleh menentukan ungkapan biasa untuk memeriksa nilai. Ungkapan biasa ini akan dilaksanakan dengan pengubah XMS.',
        'RegEx' => 'UngkapanBiasa',
        'Invalid RegEx' => 'UngkapanBiasa tidak sah',
        'Error Message' => 'Mesej kesilapan',
        'Add RegEx' => 'Tambah UngkapanBiasa',

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
        'Limit' => 'Menghadkan',
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
            'Dengan modul ini, pentadbir boleh menghantar mesej kepada ejen, kumpulan atau peranan ahli.',
        'Admin Message' => '',
        'Create Administrative Message' => 'Buat Mesej Pentadbiran',
        'Your message was sent to' => 'Mesej anda telah dihantar kepada',
        'From' => 'Daripada',
        'Send message to users' => 'Hantar mesej kepada pengguna',
        'Send message to group members' => 'Hantar mesej kepada ahli kumpulan',
        'Group members need to have permission' => 'Ahli kumpulan perlu mempunyai kebenaran',
        'Send message to role members' => 'Hantar mesej kepada ahli peranan',
        'Also send to customers in groups' => 'Juga dihantar kepada kumpulan pelanggan',
        'Body' => 'Badan',
        'Send' => 'Hantar',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericAgent.tt
        'Add Job' => '',
        'Filter for Jobs' => '',
        'Filter for jobs' => '',
        'Generic Agent Job Management' => '',
        'Edit Job' => '',
        'Run Job' => '',
        'Last run' => 'jangka terakhir',
        'Run' => 'Jalankan',
        'Delete this task' => 'Padam tugas ini',
        'Run this task' => 'Jalankan tugas ini',
        'Do you really want to delete this generic agent job?' => '',
        'Job Settings' => 'kerja Tetapan',
        'Job name' => 'Nama kerja',
        'The name you entered already exists.' => 'Nama yang anda masukkan sudah wujud.',
        'Automatic Execution (Multiple Tickets)' => '',
        'Execution Schedule' => 'Jadual pelaksanaan',
        'Schedule minutes' => 'Jadual minit(n)',
        'Schedule hours' => 'jadual waktu(n)',
        'Schedule days' => 'Jadual hari(en)',
        'Automatic execution values are in the system timezone.' => '',
        'Currently this generic agent job will not run automatically.' =>
            'Masa kerja ini ejen generik tidak akan berjalan secara automatik.',
        'To enable automatic execution select at least one value from minutes, hours and days!' =>
            'Untuk membolehkan pelaksanaan automatik pilih sekurang-kurangnya satu nilai daripada minit, jam dan hari!',
        'Event Based Execution (Single Ticket)' => '',
        'Event Triggers' => 'Pencentus Acara',
        'List of all configured events' => 'Senarai semua peristiwa konfigurasi',
        'Delete this event' => 'Padam acara ini',
        'Additionally or alternatively to a periodic execution, you can define ticket events that will trigger this job.' =>
            'Sebagai tambahan atau sebagai alternatif kepada pelaksanaan berkala, anda boleh menentukan peristiwa tiket yang akan mencetuskan kerja ini.',
        'If a ticket event is fired, the ticket filter will be applied to check if the ticket matches. Only then the job is run on that ticket.' =>
            'Sekiranya peristiwa tiket dihentikan, penapis tiket akan digunakan untuk memeriksa jika tiket adalah padan. Hanya selepas itu tugas akan dijalankan ke atas tiket.',
        'Add Event Trigger' => 'Tambah pencetus acara',
        'To add a new event select the event object and event name' => '',
        'Do you really want to delete this event trigger?' => 'Anda pasti mahu memadam pencetus acara ini?',
        'Select Tickets' => 'Memilih Tiket',
        '(e. g. 10*5155 or 105658*)' => 'contoh. 10*5144 atau 105658*',
        '(e. g. 234321)' => 'contoh. 234321',
        'Customer user ID' => '',
        '(e. g. U5150)' => 'cth. U5150',
        'Fulltext-search in article (e. g. "Mar*in" or "Baue*").' => 'Teks Carian Penuh dalam artikel-artikel (cth. "Mar*in" atau "Baue*").',
        'To' => 'Kepada',
        'Cc' => 'Cc',
        'Service' => 'Servis',
        'Service Level Agreement' => 'Tahap Persetujuan Perkhidmatan',
        'Queue' => 'Barisan',
        'State' => 'Keadaan',
        'Agent' => 'Ejen',
        'Owner' => 'Pemilik',
        'Responsible' => 'Tanggungjawab',
        'Ticket lock' => 'Mengunci Tiket',
        'Create times' => 'Buat kali',
        'No create time settings.' => 'Tiada mewujudkan tetapan masa',
        'Ticket created' => 'tiket menciptakan',
        'Ticket created between' => 'Tiket diwujudkan antara',
        'and' => 'dan',
        'Last changed times' => 'Masa perubahan lepas',
        'No last changed time settings.' => 'TIada tetapan masa perubahan lepas',
        'Ticket last changed' => 'Perubahan tiket lepas',
        'Ticket last changed between' => 'Perubahan tiket lepas antara',
        'Change times' => 'Perubahan kali',
        'No change time settings.' => 'Tiada masa perubahan tetapan',
        'Ticket changed' => 'tiket berubah',
        'Ticket changed between' => 'Tiket berubah antara',
        'Last close times' => '',
        'No last close time settings.' => '',
        'Ticket last close' => '',
        'Ticket last close between' => '',
        'Close times' => 'kali Tutup',
        'No close time settings.' => 'Tiada tetapan masa dekat',
        'Ticket closed' => 'tiket ditutup',
        'Ticket closed between' => 'Tiket ditutup antara',
        'Pending times' => 'Menunggu masa',
        'No pending time settings.' => 'Tetapan Tiada masa menunggu',
        'Ticket pending time reached' => 'Masa Tiket menunggu sampai',
        'Ticket pending time reached between' => 'Masa Tiket menunggu dicapai antara',
        'Escalation times' => 'peningkatan kali',
        'No escalation time settings.' => 'Tiada peningkatan tetapan masa',
        'Ticket escalation time reached' => 'Masa peningkatan Tiket mencapai',
        'Ticket escalation time reached between' => 'Tiket masa peningkatan dicapai antara',
        'Escalation - first response time' => 'Peningkatan tindak balas kali pertama',
        'Ticket first response time reached' => 'Tiket masa tindak balas pertama mencecah',
        'Ticket first response time reached between' => 'Tiket tindak balas kali pertama dicapai antara',
        'Escalation - update time' => 'Peningkatan - kemas kini masa',
        'Ticket update time reached' => 'Tiket kemas kini masa sampai',
        'Ticket update time reached between' => 'Tiket kemas kini masa dicapai antara',
        'Escalation - solution time' => 'Peningkatan - penyelesaian masa',
        'Ticket solution time reached' => 'Masa penyelesaian Tiket mencapai',
        'Ticket solution time reached between' => 'Tiket masa penyelesaian dicapai antara',
        'Archive search option' => 'Arkib carian pilihan',
        'Update/Add Ticket Attributes' => 'Kemas kini/Tambah Sifat Tiket',
        'Set new service' => 'Tetapkan perkhidmatan baru',
        'Set new Service Level Agreement' => 'Tetapkan Perjanjian Tahap Perkhidmatan baru',
        'Set new priority' => 'Tetapkan keutamaan baru',
        'Set new queue' => 'Tetapkan barisan baru',
        'Set new state' => 'Tetapkan keadaan yang baru',
        'Pending date' => 'Tarikh Penangguhan',
        'Set new agent' => 'Tetapkan ejen baru',
        'new owner' => 'Pemilik baru',
        'new responsible' => 'tanggungjawab baru',
        'Set new ticket lock' => 'Tetapkan kunci tiket baru',
        'New customer user ID' => '',
        'New customer ID' => 'ID pelanggan Baru',
        'New title' => 'tajuk baru',
        'New type' => 'jenis baru',
        'Archive selected tickets' => 'Arkib dipilih tiket',
        'Add Note' => 'Tambah Nota',
        'Visible for customer' => '',
        'Time units' => 'masa unit',
        'Execute Ticket Commands' => 'Jalankan Arahan Tiket',
        'Send agent/customer notifications on changes' => 'Hantar ejen / pelanggan pemberitahuan mengenai perubahan',
        'Delete tickets' => 'Padam tiket',
        'Warning: All affected tickets will be removed from the database and cannot be restored!' =>
            'Amaran: Semua tiket yang terjejas akan dikeluarkan dari pangkalan data dan tidak boleh dipulihkan.',
        'Execute Custom Module' => 'Melaksanakan Modul Custom',
        'Param %s key' => 'Parameter Utama %s',
        'Param %s value' => 'Nilai Parameter %s',
        'Results' => 'Keputusan',
        '%s Tickets affected! What do you want to do?' => '%s Tiket terjejas! Apa yang anda mahu lakukan?',
        'Warning: You used the DELETE option. All deleted tickets will be lost!' =>
            'Amaran: Anda menggunakan pilihan DELETE. Semua tiket yang dipadam akan hilang!',
        'Warning: There are %s tickets affected but only %s may be modified during one job execution!' =>
            'Amaran : Terdapat %s tiket terjejas tetapi hanya %s boleh diubah suai dalam satu pelaksanaan kerja!',
        'Affected Tickets' => 'Tiket yang terjejas',
        'Age' => 'Umur',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceDebugger.tt
        'Go back to web service' => 'Kembali kepada perkhidmatan web',
        'Clear' => 'Padam',
        'Do you really want to clear the debug log of this web service?' =>
            'Adakah anda benar-benar mahu untuk membersihkan debug log perkhidmatan web ini?',
        'GenericInterface Web Service Management' => 'Pengurusan Perkhidmatan Wen GenericInterface',
        'Web Service Management' => '',
        'Debugger' => 'penyahpepijat',
        'Request List' => 'Senarai Permintaan',
        'Time' => 'Masa',
        'Communication ID' => '',
        'Remote IP' => 'IP Jauh',
        'Loading' => 'Memuatkan...',
        'Select a single request to see its details.' => 'Pilih permintaan tunggal untuk melihat butirannya.',
        'Filter by type' => 'Tapis mengikut jenis',
        'Filter from' => 'Tapis dari',
        'Filter to' => 'Tapis untuk',
        'Filter by remote IP' => 'Menapis oleh IP jauh',
        'Refresh' => 'Menyegarkan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceErrorHandlingDefault.tt
        'Do you really want to delete this error handling module?' => '',
        'All configuration data will be lost.' => 'Semua data konfigurasi akan hilang.',
        'Add ErrorHandling' => '',
        'Edit ErrorHandling' => '',
        'General options' => '',
        'The name can be used to distinguish different error handling configurations.' =>
            '',
        'Please provide a unique name for this web service.' => 'Sila berikan nama unik untuk perkhidmatan web ini.',
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
        'Do you really want to delete this invoker?' => 'Adakah anda benar-benar mahu memadam invoker ini?',
        'Add Invoker' => '',
        'Edit Invoker' => '',
        'Invoker Details' => 'Butiran Invoker',
        'The name is typically used to call up an operation of a remote web service.' =>
            'Nama biasanya digunakan untuk memanggil operasi perkhidmatan web jauh.',
        'Invoker backend' => 'Invoker backend',
        'This Znuny invoker backend module will be called to prepare the data to be sent to the remote system, and to process its response data.' =>
            'Modul Znuny invoker backend ini akan dipanggil untuk menyediakan data untuk dihantar ke sistem jauh, dan untuk memproses data respons.',
        'Mapping for outgoing request data' => 'Pemetaan untuk permintaan data keluar',
        'Configure' => 'Konfigurasi',
        'The data from the invoker of Znuny will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Data dari invoker daripada Znuny akan diproses oleh pemetaan ini, untuk mengubah kepada jenis data sistem jauh menjangka.',
        'Mapping for incoming response data' => 'Pemetaan data respons masuk',
        'The response data will be processed by this mapping, to transform it to the kind of data the invoker of Znuny expects.' =>
            'Data tindak balas akan diproses oleh pemetaan ini, untuk mengubah kepada jenis data invoker jangkaan Znuny.',
        'Asynchronous' => 'Tak segerak',
        'Condition' => 'Keadaan',
        'Edit this event' => '',
        'This invoker will be triggered by the configured events.' => 'Invoker ini akan dicetuskan oleh peristiwa-peristiwa yang dikonfigurasikan.',
        'Add Event' => 'Tambah Acara',
        'To add a new event select the event object and event name and click on the "+" button' =>
            'Untuk menambah acara baru pilih objek acara dan nama acara kemudian tekan pada butang "+"',
        'Asynchronous event triggers are handled by the Znuny Scheduler Daemon in background (recommended).' =>
            'Pencetus peristiwa tidak selari dikendalikan oleh Penjadual Daemon Znuny pada latar belakang (disyorkan).',
        'Synchronous event triggers would be processed directly during the web request.' =>
            'Pencetus acara yang segerak akan diproses terus semasa permintaan web.',
        'Add all attachments' => '',
        'Add all attachments to invoker payload.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceInvokerEvent.tt
        'GenericInterface Invoker Event Settings for Web Service %s' => '',
        'Go back to' => 'Kembali ke',
        'Delete all conditions' => '',
        'Do you really want to delete all the conditions for this event?' =>
            '',
        'General Settings' => '',
        'Event type' => '',
        'Conditions' => 'Keadaan',
        'Conditions can only operate on non-empty fields.' => 'Keadaan hanya boleh beroperasi pada ruang-ruang tidak-kosong.',
        'Type of Linking between Conditions' => 'Jenis Pemautan antara Syarat',
        'Remove this Condition' => 'Buang keadaan ini',
        'Type of Linking' => 'Jenis Pemautan',
        'Fields' => 'Medan',
        'Add a new Field' => 'Tambah Medan baru',
        'Remove this Field' => 'Buang medan ini',
        'And can\'t be repeated on the same condition.' => 'Dan tidak boleh berulang pada keadaan yang sama.',
        'Add New Condition' => 'Tambah Keadaan Baru',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceMappingSimple.tt
        'Mapping Simple' => 'Pemetaan mudah',
        'Default rule for unmapped keys' => 'Peraturan asal untuk kekunci yang tidak dipetakan',
        'This rule will apply for all keys with no mapping rule.' => 'Peraturan ini akan dipakai untuk semua kunci yang tiada peraturan pemetaan.',
        'Default rule for unmapped values' => 'Peraturan asal untuk nilai yang tidak dipetakan.',
        'This rule will apply for all values with no mapping rule.' => 'Peraturan ini akan dipakai untuk semua nilai yang tiada peraturan pemetaan.',
        'New key map' => 'Kunci peta baru',
        'Add key mapping' => 'Tambah pemetaan kunci',
        'Mapping for Key ' => 'Pemetaan untuk kunci',
        'Remove key mapping' => 'Buang pemetaan kunci',
        'Key mapping' => 'Pemetaan kunci',
        'Map key' => 'Peta kunci',
        'matching' => '',
        'to new key' => 'kepada kunci baru',
        'Value mapping' => 'pemetaan nilai',
        'Map value' => 'peta nilai',
        'new value' => '',
        'Remove value mapping' => 'Buang pemetaan nilai',
        'New value map' => 'Pemetaan nilai baru',
        'Add value mapping' => 'Tambah pemetaan nilai',
        'Do you really want to delete this key mapping?' => 'Anda pasti mahu memadam pemetaan kunci ini?',

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
        'Do you really want to delete this operation?' => 'Anda pasti mahu memadam operasi ini?',
        'Add Operation' => '',
        'Edit Operation' => '',
        'Operation Details' => 'Butiran operasi',
        'The name is typically used to call up this web service operation from a remote system.' =>
            'Nama biasanya digunakan untuk memanggil operasi perkhidmatan web ini dari sistem yang jauh.',
        'Operation backend' => 'Operasi backend',
        'This Znuny operation backend module will be called internally to process the request, generating data for the response.' =>
            'Operasi backend Znuny ini akan dipanggil secara dalaman untuk memproses permintaan itu, menjana data untuk tidak balas.',
        'Mapping for incoming request data' => 'Pemetaan untuk permintaan masuk data.',
        'The request data will be processed by this mapping, to transform it to the kind of data Znuny expects.' =>
            'Data yang dipinta akan diproses oleh pemetaan ini, untuk mengubah ia kepada jenis data yang dijangka Znuny.',
        'Mapping for outgoing response data' => 'Pemetaan untuk tindak balas data yang keluar.',
        'The response data will be processed by this mapping, to transform it to the kind of data the remote system expects.' =>
            'Data yang bertindak balas akan diproses oleh pemetaan ini, untuk mengubah kepada jenis data yang dijangka oleh sistem jauh itu.',
        'Include Ticket Data' => '',
        'Include ticket data in response.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceTransportHTTPREST.tt
        'Network Transport' => '',
        'Properties' => 'Sifat',
        'Route mapping for Operation' => 'Pemetaan laluan bagi Operasi',
        'Define the route that should get mapped to this operation. Variables marked by a \':\' will get mapped to the entered name and passed along with the others to the mapping. (e.g. /Ticket/:TicketID).' =>
            'Menentukan laluan yang perlu dapat dipetakan kepada operasi ini. Pembolehubah ditandai dengan \':\' akan dapat dipetakan kepada nama yang dimasukkan dan dipindahkan bersama-sama dengan yang lain untuk pemetaan. (cth /Tiket/:TicketID).',
        'Valid request methods for Operation' => 'Kaedah permintaan sah untuk Operasi',
        'Limit this Operation to specific request methods. If no method is selected all requests will be accepted.' =>
            'Hadkan Operasi ini kepada kaedah permintaan khusus. Jika tiada kaedah yang dipilih semua permintaan akan diterima.',
        'Parser backend for operation' => '',
        'Defines the incoming data format.' => '',
        'Parser backend parameter' => '',
        'Please click \'Save\' to get the corresponding backend parameter if the parser backend was changed.' =>
            '',
        'Maximum message length' => 'Panjang maksimum mesej',
        'This field should be an integer number.' => 'Ruang ini haruslah disi dengan nombor.',
        'Here you can specify the maximum size (in bytes) of REST messages that Znuny will process.' =>
            'Di sini anda boleh menentukan saiz maksimum (dalam bait) mesej yang lain yang Znuny akan proses .',
        'Send Keep-Alive' => 'Hantar Kekal-Hidup',
        'This configuration defines if incoming connections should get closed or kept alive.' =>
            'Konfigurasi ini mentakrifkan jika sambungan masuk seharusnya ditutup atau kekal hidup.',
        'Endpoint' => 'Titik akhir',
        'URI to indicate specific location for accessing a web service.' =>
            '',
        'e.g https://www.example.com:10745/api/v1.0 (without trailing backslash)' =>
            'contoh https://www.example.com:10745/api/v1.0 (tanpa backslash berjela-jela)',
        'Disable SSL hostname certificate verification' => '',
        'Disables hostname certificate verification. This is not recommended and should only be used in test environments.' =>
            '',
        'Timeout' => '',
        'Timeout value for requests.' => '',
        'Authentication' => 'Pengesahan',
        'An optional authentication mechanism to access the remote system.' =>
            '',
        'BasicAuth User' => '',
        'The user name to be used to access the remote system.' => 'Nama pengguna yang akan digunakan untuk mengakses sistem jauh.',
        'BasicAuth Password' => '',
        'The password for the privileged user.' => 'Kata laluan untuk pengguna istimewa.',
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
        'Proxy Server' => 'Server Proksi',
        'URI of a proxy server to be used (if needed).' => 'URI server proksi yang boleh digunakan (jika diperlukan)',
        'e.g. http://proxy_hostname:8080' => 'contoh: http://proxy_hostname:8080',
        'Proxy User' => 'Pengguna Proksi',
        'The user name to be used to access the proxy server.' => 'Nama pengguna yang akan digunakan untuk mengakses server proksi.',
        'Proxy Password' => 'Kata laluan Proksi',
        'The password for the proxy user.' => 'Kata laluan untuk pengguna proksi.',
        'Skip Proxy' => '',
        'Skip proxy servers that might be configured globally?' => '',
        'Use SSL Options' => 'Gunakan pilihan SSL',
        'Show or hide SSL options to connect to the remote system.' => 'Menunjukkan atau menyembunyikan pilihan SSL untuk menyambung ke sistem jauh.',
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
            'Laluan penuh dan nama fail pensijilan sijil kuasa yang mengesahkan sijil SSL.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA/ca.pem' => 'contoh: /opt/znuny/var/certificates/SOAP/CA/ca.pem',
        'Certification Authority (CA) Directory' => 'Direktori Pihak Berkuasa Persijilan (CA)',
        'The full path of the certification authority directory where the CA certificates are stored in the file system.' =>
            'Laluan penuh direktori pihak berkuasa pemerakuan yang mana sijil CA disimpan dalam sistem fail.',
        'e.g. /opt/znuny/var/certificates/SOAP/CA' => 'contoh: /opt/znuny/var/certificates/SOAP/CA',
        'Controller mapping for Invoker' => 'Pengawal pemetaan untuk Invoker',
        'The controller that the invoker should send requests to. Variables marked by a \':\' will get replaced by the data value and passed along with the request. (e.g. /Ticket/:TicketID?UserLogin=:UserLogin&Password=:Password).' =>
            'Pengawal yang invoker perlu hantar permintaan untuk. Pembolehubah ditandai dengan \':\' akan dapat digantikan dengan nilai data dan diluluskan bersama-sama dengan permintaan itu. (contoh/Tiket/:TicketID Userlogin=:Userlogin&Kata Laluan=:Kata laluan).',
        'Valid request command for Invoker' => 'Arahan permohonan sah untuk Invoker',
        'A specific HTTP command to use for the requests with this Invoker (optional).' =>
            'Arahan HTTP spesifik untuk digunakan bagi permintaan dengan Invoker (pilihan) ini.',
        'Default command' => 'Arahan lalai',
        'The default HTTP command to use for the requests.' => 'Arahan HTTP lalai untuk digunakan untuk permintaan.',
        'Additional response headers' => '',
        'Additional request headers' => '',
        'Header' => 'Permulaan',
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
        'SOAPAction separator' => 'Pemisah TindakanSOAP',
        'Character to use as separator between name space and SOAP operation.' =>
            '',
        'Usually .Net web services use "/" as separator.' => '',
        'SOAPAction free text' => '',
        'Text to be used to as SOAPAction.' => '',
        'Namespace' => 'Ruang nama',
        'URI to give SOAP methods a context, reducing ambiguities.' => 'URI untuk memberi kaedah SOAP konteks, mengurangkan kekaburan.',
        'e.g urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions' =>
            'contoh: urn:example-com:soap:functions or http://www.example.com/GenericInterface/actions',
        'Omit namespace prefix' => '',
        'Omits the namespace prefix (e. g. namesp1:) in root tag of SOAP message.' =>
            '',
        'Request name scheme' => 'Skim nama permintaan',
        'Select how SOAP request function wrapper should be constructed.' =>
            'Pilih bagaimana pembalut fungsi permintaan SOAP patut dibina.',
        '\'FunctionName\' is used as example for actual invoker/operation name.' =>
            '\'NamaFungsi\' adakah digunakan sebagai contoh untuk invoker sebenar/nama operasi.',
        '\'FreeText\' is used as example for actual configured value.' =>
            '\'TeksBebas\' digunakan sebagai contoh untuk nilai dikonfigurasikan yang sebenar.',
        'Request name free text' => '',
        'Text to be used to as function wrapper name suffix or replacement.' =>
            'Teks yang akan digunakan sebagai nama tugas pembungkus akhiran atau penggantian.',
        'Please consider XML element naming restrictions (e.g. don\'t use \'<\' and \'&\').' =>
            'Sila pertimbangkan elemen sekatan menamakan XML (contohnya tidak menggunakan \'<\' dan \'&\').',
        'Response name scheme' => 'Nama skema tindak balas',
        'Select how SOAP response function wrapper should be constructed.' =>
            'Pilih bagaimana pembalut fungsi tindakbalas SOAP patut dibina.',
        'Response name free text' => 'Nama jawapan teks bebas',
        'Here you can specify the maximum size (in bytes) of SOAP messages that Znuny will process.' =>
            'Di sini anda boleh menentukan saiz maksimum (dalam byte) mesej SOAP yang akan diproses oleh Znuny.',
        'Fixed namespace prefix' => '',
        'Use a fixed namespace prefix (e. g. myns:) for the root tag of a SOAP message.' =>
            '',
        'Suffix for response tag' => '',
        'Usually Znuny expects a response tag like "&lt;Operation&gt;Response". This setting can change the "Response" part, e. g. to "Result".' =>
            '',
        'Encoding' => 'Pengekodan',
        'The character encoding for the SOAP message contents.' => 'Pengekodan aksara bagi kandungan mesej SOAP.',
        'e.g utf-8, latin1, iso-8859-1, cp1250, Etc.' => 'contoh: utf-8, latin1, iso-8859-1, cp1250, dll.',
        'User' => 'Pengguna',
        'Password' => 'Kata Laluan',
        'Disable SSL hostname verification' => '',
        'Disables (setting "Yes") or enables (setting "No", default) the SSL hostname verification.' =>
            '',
        'Sort options' => 'Pilihan jenis',
        'Add new first level element' => 'Tambah baru unsur peringkat pertama',
        'Element' => 'Elemen',
        'Outbound sort order for xml fields (structure starting below function name wrapper) - see documentation for SOAP transport.' =>
            'Perintah jenis Outbound untuk bidang xml (struktur permulaan di bawah nama tugas pembungkus) - lihat dokumentasi untuk pengangkutan SOAP.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebservice.tt
        'Add Web Service' => '',
        'Clone Web Service' => '',
        'The name must be unique.' => 'Nama perlu unik',
        'Clone' => 'Klon',
        'Export Web Service' => '',
        'Import web service' => 'Import perkhidmatan web',
        'Configuration File' => 'Fail Konfigurasi',
        'The file must be a valid web service configuration YAML file.' =>
            'Fail tersebut mestilah fail konfigurasi YAML perkhidmatan web yang sah',
        'Here you can specify a name for the webservice. If this field is empty, the name of the configuration file is used as name.' =>
            '',
        'Import' => 'Import',
        'Configuration History' => '',
        'Delete web service' => 'Padam perkhidmatan web',
        'Do you really want to delete this web service?' => 'Anda pasti mahu memadam perkhidmatan web ini?',
        'Ready2Adopt Web Services' => '',
        'Import Ready2Adopt web service' => '',
        'After you save the configuration you will be redirected again to the edit screen.' =>
            'Selepas anda menyimpan konfigurasi anda akan dibawa semula ke skrin sunting.',
        'If you want to return to overview please click the "Go to overview" button.' =>
            'Jika anda ingin kembali ke gambaran sila klik butang "Pergi ke gambaran".',
        'Edit Web Service' => '',
        'Remote system' => 'Sistem jarak jauh',
        'Provider transport' => 'Pengankutan pembekal',
        'Requester transport' => 'Pengangkutan peminta',
        'Debug threshold' => 'Paras ambang debug.',
        'In provider mode, Znuny offers web services which are used by remote systems.' =>
            'Dalam mod pembekal, Znuny menawarkan perkhidmatan web yang digunakan oleh sistem jauh.',
        'In requester mode, Znuny uses web services of remote systems.' =>
            'Dalam mod peminta, Znuny menggunakan perkhidmatan web sistem terpencil.',
        'Network transport' => 'Pengangkutan Rangkaian',
        'Error Handling Modules' => '',
        'Error handling modules are used to react in case of errors during the communication. Those modules are executed in a specific order, which can be changed by drag and drop.' =>
            '',
        'Add error handling module' => '',
        'Operations are individual system functions which remote systems can request.' =>
            'Operasi fungsi sistem individu yang sistem jauh boleh meminta.',
        'Invokers prepare data for a request to a remote web service, and process its response data.' =>
            'Invokers menyediakan data untuk permintaan untuk perkhidmatan web jauh, dan memproses data respons.',
        'Controller' => 'Pengawal',
        'Inbound mapping' => 'Pemetaan dalam',
        'Outbound mapping' => 'Pemetaan keluar',
        'Delete this action' => 'Padam tindakan ini',
        'At least one %s has a controller that is either not active or not present, please check the controller registration or delete the %s' =>
            'Sekurang-kurangnya satu %s mempunyai pengawal yang sama ada tidak aktif atau tidak hadir, sila semak pendaftaran pengawal atau memadam %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGenericInterfaceWebserviceHistory.tt
        'Go back to Web Service' => 'Pergi kembali ke Perkhidmatan Web',
        'Here you can view older versions of the current web service\'s configuration, export or even restore them.' =>
            'Di sini anda boleh melihat versi yang lebih lama perkhidmatan web semasa tatarajah, eksport atau malah memulihkan mereka.',
        'History' => 'Sejarah',
        'Configuration History List' => 'Senarai Sejarah Konfigurasi',
        'Version' => 'Versi',
        'Create time' => 'Masa cipta',
        'Select a single configuration version to see its details.' => 'Pilih versi konfigurasi tunggal untuk melihat butirannya.',
        'Export web service configuration' => 'Eksport konfigurasi perkhidmatan web',
        'Restore web service configuration' => 'Kembalikan konfigurasi perkhidmatan web',
        'Do you really want to restore this version of the web service configuration?' =>
            'Adakah anda benar-benar mahu memulihkan versi ini konfigurasi perkhidmatan web?',
        'Your current web service configuration will be overwritten.' => 'Perkhidmatan web konfigurasi semasa anda akan diganti.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminGroup.tt
        'Add Group' => 'Tambah Kumpulan',
        'The admin group is to get in the admin area and the stats group to get stats area.' =>
            'Kumpulan admin adalah untuk masuk ke kawasan admin dan statistik kumpulan untuk mendapat statistik kawasan.',
        'Create new groups to handle access permissions for different groups of agent (e. g. purchasing department, support department, sales department, ...). ' =>
            'Cipta kumpulan baru untuk memberi kebenaran untuk perbezaan kumpulan dari ejen (cth. membeli jabatan, sokongan jabatan, jabatan jualan, ...).',
        'It\'s useful for ASP solutions. ' => 'Ianya berguna untuk solusi ASP.',
        'Agents ↔ Groups' => '',
        'Roles ↔ Groups' => '',
        'Group Management' => 'Pengurusan Kumpulan',
        'Edit Group' => 'Audit Kumpulan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminLog.tt
        'Clear log entries' => '',
        'Here you will find log information about your system.' => 'Disini anda akan dapat log informasi mengenani sistem anda.',
        'Hide this message' => 'Sorok mesej ni',
        'System Log' => 'Log Sistem',
        'Recent Log Entries' => 'Log Masuk Baru',
        'Facility' => 'Kemudahan',
        'Message' => 'Mesej',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminMailAccount.tt
        'Add Mail Account' => 'Tambah emel akaun',
        'Filter for Mail Accounts' => '',
        'Filter for mail accounts' => '',
        'All incoming emails with one account will be dispatched in the selected queue.' =>
            '',
        'If your account is marked as trusted, the X-OTRS headers already existing at arrival time (for priority etc.) will be kept and used, for example in PostMaster filters.' =>
            '',
        'Outgoing email can be configured via the Sendmail* settings in %s.' =>
            '',
        'System Configuration' => 'Konfigurasi Sistem',
        'Mail Account Management' => 'Pengurusan Akaun Emel',
        'Edit Mail Account for host' => '',
        'and user account' => '',
        'Host' => 'Hos',
        'Authentication type' => '',
        'Fetch mail' => 'E-Mails abholen',
        'Delete account' => 'Padam akaun',
        'Do you really want to delete this mail account?' => '',
        'Example: mail.example.com' => 'Contoh: mail.contoh.com',
        'IMAP Folder' => 'folder IMAP',
        'Only modify this if you need to fetch mail from a different folder than INBOX.' =>
            'Hanya mengubah suai ini jika anda perlu mengambil mel dari folder yang berbeza daripada PET MASUK.',
        'Trusted' => 'dipercayai',
        'Dispatching' => 'menghantar',
        'Edit Mail Account' => 'Edit Akaun Mel',

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
            'Di sini anda boleh memuat naik fail konfigurasi untuk mengimport Pemberitahuan Tiket untuk sistem anda. Fail tersebut perlu berada dalam format .yml seperti yang dieksport oleh modul Pemberitahuan Tiket.',
        'Ticket Notification Management' => 'Pengurusan Pemberitahuan Tiket ',
        'Here you can choose which events will trigger this notification. An additional ticket filter can be applied below to only send for ticket with certain criteria.' =>
            'Di sini anda boleh memilih mana-mana peristiwa yang akan mencetuskan pemberitahuan ini. Penapis tiket tambahan boleh digunakan di bawah untuk hanya menghantar tiket dengan kriteria tertentu.',
        'Ticket Filter' => 'Penapis tiket',
        'Lock' => 'Kunci',
        'SLA' => 'TPP',
        'Customer User ID' => '',
        'Article Filter' => 'Tapisan Artikel',
        'Only for ArticleCreate and ArticleSend event' => 'Hanya untuk acara CiptaArtikel dan HantarArtikel ',
        'Article sender type' => 'Jenis penghantar artikel',
        'If ArticleCreate or ArticleSend is used as a trigger event, you need to specify an article filter as well. Please select at least one of the article filter fields.' =>
            'Jika CiptaArtikel atau HantarArtikel digunakan sebagai peristiwa pencetus, anda perlu menentukan penapis artikel juga. Sila pilih sekurang-kurangnya salah satu daripada bidang penapis artikel.',
        'Customer visibility' => '',
        'Communication channel' => '',
        'Include attachments to notification' => 'Termasuk lampiran pemberitahuan',
        'Notify user just once per day about a single ticket using a selected transport.' =>
            'Memberitahu pengguna hanya sekali setiap hari kira-kira satu tiket menggunakan pengangkutan yang dipilih.',
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
        'Template' => 'Templat',
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
        'PGP support is disabled' => 'sokongan PGP tidak dibolehkan',
        'To be able to use PGP in Znuny, you have to enable it first.' =>
            'Untuk boleh menggunakan PGP dalam Znuny, anda perlu membolehkannya terlebih dahulu.',
        'Enable PGP support' => 'Bolehkan sokongan PGP',
        'Faulty PGP configuration' => 'Konfigurasi PGP tidak betul',
        'PGP support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'sokongan PGP dibolehkan, tetapi konfigurasi berkaitan mempunyai kesilapan-kesilapan. Sila periksa konfigurasi itu dengan butang dibawah.',
        'Configure it here!' => 'Konfigurasi ia di sini!',
        'Check PGP configuration' => 'Semak konfigurasi PGP',
        'Add PGP Key' => 'Tambah Kunci PGP',
        'In this way you can directly edit the keyring configured in SysConfig.' =>
            'Dengan cara ini, anda boleh terus edit gegelang kunci dikonfigurasikan dalam SysConfig.',
        'Introduction to PGP' => 'Pengenalan kepada PGP',
        'PGP Management' => 'PGP-Pengurusan',
        'Identifier' => 'Kenal pasti',
        'Bit' => 'Bit',
        'Fingerprint' => 'cap jari',
        'Expires' => 'Tamat',
        'Delete this key' => 'Padamkan kunci ini',
        'PGP key' => 'PGP kunci',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPackageManager.tt
        'Package Manager' => 'Pengurus pakej',
        'Uninstall Package' => '',
        'Uninstall package' => 'buang pakej',
        'Do you really want to uninstall this package?' => 'Adakah anda benar-benar mahu untuk memadam pakej ini?',
        'Reinstall package' => 'Pasang semula pakej',
        'Do you really want to reinstall this package? Any manual changes will be lost.' =>
            'Adakah anda benar-benar mahu memasang semula pakej ini? Sebarang perubahan manual akan hilang.',
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
            'Sekiranya anda mempunya sebarang pertanyaan kami sedia menjawabnya.',
        'Please visit our customer portal and file a request.' => '',
        'Install Package' => 'Pasang Pakej',
        'Update Package' => '',
        'Package' => '',
        'Required package %s is already installed.' => '',
        'Required Perl module %s is already installed.' => '',
        'Required package %s needs to get installed!' => '',
        'Required package %s needs to get updated to version %s!' => '',
        'Required Perl module %s needs to get installed or updated!' => '',
        'Continue' => 'Sambung',
        'Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Sila pastikan pangkalan data anda menerima pakej melebihi saiz %s MB (buat masa ini ia hanya menerima pakej sehingga %s MB). Sila sesuaikan tetapan max_paket_dibenarkan pada pangkalan data anda agar tidak terdapat ralat.',
        'Install' => 'Pasang',
        'Update' => 'Kemaskini',
        'Update repository information' => 'Kemaskini maklumat repositori',
        'Update all installed packages' => '',
        'Online Repository' => 'repositori talian',
        'Vendor' => 'Penjual',
        'Action' => 'Tindakan',
        'Module documentation' => 'dokumentasi modul',
        'Local Repository' => 'Direktori tempatan',
        'Uninstall' => 'Nyah-pasang',
        'Package not correctly deployed! Please reinstall the package.' =>
            'Pakej tidak dikerah dengan betul! Sila memasang semula pakej.',
        'Reinstall' => 'Pasang semula',
        'Download package' => 'Muat pakej',
        'Rebuild package' => 'membina pakej',
        'Package Information' => '',
        'Metadata' => 'metadata',
        'Change Log' => 'Perubahan Log',
        'Date' => 'Tarikh',
        'List of Files' => 'Senarai Fail',
        'Permission' => 'Kebenaran',
        'Size' => 'Saiz',
        'Problem' => 'Masalah',
        'OK' => 'OK',
        'Download file from package!' => 'Muat turun fail dari pakej!',
        'Required' => 'Diperlukan',
        'Primary Key' => 'Kunci Utama',
        'Auto Increment' => 'Kenaikan Auto',
        'SQL' => 'SQL',
        'File Differences for File %s' => '',
        'File differences for file %s' => 'Fail perbezaan untuk fail %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPerformanceLog.tt
        'This feature is enabled!' => 'Ciri ini diaktifkan!',
        'Just use this feature if you want to log each request.' => 'Hanya menggunakan ciri ini jika anda mahu untuk log setiap permintaan.',
        'Activating this feature might affect your system performance!' =>
            'Mengaktifkan ciri ini mungkin menjejaskan prestasi sistem anda!',
        'Disable it here!' => 'Melumpuhkan ia di sini!',
        'Logfile too large!' => 'Fail log terlalu besar!',
        'The logfile is too large, you need to reset it' => 'Fail log adalah terlalu besar, anda perlu untuk menetapkan semula',
        'Performance Log' => 'Log prestasi',
        'Range' => 'Pertengahan',
        'last' => 'akhir',
        'Interface' => 'Paparan',
        'Requests' => 'permintaan',
        'Min Response' => 'Tindakbalas min',
        'Max Response' => 'Tindakbalas Max',
        'Average Response' => 'purata Tindakbalas',
        'Period' => 'tempoh',
        'minutes' => 'Beberapa minit',
        'Min' => 'Min',
        'Max' => 'Max',
        'Average' => 'purata',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPostMasterFilter.tt
        'Add PostMaster Filter' => 'Tambah Postmaster Penapis',
        'Filter for PostMaster Filters' => '',
        'Filter for PostMaster filters' => '',
        'To dispatch or filter incoming emails based on email headers. Matching using Regular Expressions is also possible.' =>
            'Untuk penghantaran atau menapis e-mel masuk berdasarkan pengepala e. Pemadanan menggunakan Ungkapan Biasa juga mungkin.',
        'If you want to match only the email address, use EMAILADDRESS:info@example.com in From, To or Cc.' =>
            'Jika anda mahu untuk dipadankan hanya alamat e-mel, menggunakan ALAMAT EMAIL: info@example.come masuk Dari, Kepada atau Cc.',
        'If you use Regular Expressions, you also can use the matched value in () as [***] in the \'Set\' action.' =>
            'Jika anda menggunakan Ungkapan Biasa, anda juga boleh menggunakan nilai yang dipadankan dalam () sebagai [***] di \'Set\' tindakan.',
        'You can also use named captures %s and use the names in the \'Set\' action %s (e.g. Regexp: %s, Set action: %s). A matched EMAILADDRESS has the name \'%s\'.' =>
            '',
        'PostMaster Filter Management' => 'Postmaster Penapis Pengurusan',
        'Edit PostMaster Filter' => 'Edit Postmaster Penapis',
        'Delete this filter' => 'Padam penapis ini',
        'Do you really want to delete this postmaster filter?' => '',
        'A postmaster filter with this name already exists!' => '',
        'Filter Condition' => 'Keadaan penapis',
        'AND Condition' => 'DAN Keadaan',
        'Search header field' => '',
        'for value' => '',
        'The field needs to be a valid regular expression or a literal word.' =>
            'Bidang perlu untuk menjadi ungkapan yang sah tetap atau perkataan literal.',
        'Negate' => 'Sangkal',
        'Set Email Headers' => 'Tetapkan Pengepala E-mel',
        'Set email header' => 'Set kepala emel',
        'with value' => '',
        'The field needs to be a literal word.' => 'Bidang perlu menjadi perkataan literal.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminPriority.tt
        'Add Priority' => 'Tambah Keutamaan',
        'Filter for Priorities' => '',
        'Filter for priorities' => '',
        'Configure Priority Visibility and Defaults' => '',
        'Priority Management' => 'Pengurusan keutamaan',
        'Edit Priority' => 'Edit Keutamaan',
        'Color' => '',
        'This priority is present in a SysConfig setting, confirmation for updating settings to point to the new priority is needed!' =>
            '',
        'This priority is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagement.tt
        'Filter for Processes' => 'Penapis untuk Proses',
        'Filter for processes' => '',
        'Create New Process' => 'Cipta Proses Baru',
        'Deploy All Processes' => 'Gerakkan semua proses',
        'Here you can upload a configuration file to import a process to your system. The file needs to be in .yml format as exported by process management module.' =>
            'Disini anda boleh muat naik fail konfigurasi untuk import proses kedalam sistem anda. Fail itu mestilah di dalam format .yml seperti yang diexport oleh modul pengurusan proses.',
        'Upload process configuration' => 'Muat naik konfigurasi proses',
        'Import process configuration' => 'Import konfigurasi proses',
        'Ready2Adopt Processes' => '',
        'Here you can activate Ready2Adopt processes showcasing our best practices. Please note that some additional configuration may be required.' =>
            '',
        'Import Ready2Adopt process' => '',
        'To create a new Process you can either import a Process that was exported from another system or create a complete new one.' =>
            'Untuk cipta Proses baru anda boleh sama ada import sebuah Proses yang telah diexport daripada sistem lain atau cipta proses yang baru.',
        'Changes to the Processes here only affect the behavior of the system, if you synchronize the Process data. By synchronizing the Processes, the newly made changes will be written to the Configuration.' =>
            'Perubahan kepada Proses disini hanya akan memberi kesan kepada kelakuan sistem, jika anda menyamakan data Proses. Dengan menyamakan Proses, perubahan yang baru akan ditulis ke Konfigurasi.',
        'Access Control Lists (ACL)' => 'Senarai Kawalan Akses (ACL)',
        'Generic Agent' => '',
        'Manage Process Widget Groups' => '',
        'Processes' => 'Proses',
        'Process name' => 'Nama Proses',
        'Print' => 'Cetak',
        'Export Process Configuration' => 'Export Konfigurasi Proses',
        'Copy Process' => 'Salin Proses',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivity.tt
        'Please note, that changing this activity will affect the following processes' =>
            'Sila ambil perhatian bahawa mengubah aktiviti ini akan menjejaskan proses berikut',
        'Activity' => 'Aktiviti',
        'Activity Name' => 'Nama Aktiviti',
        'Scope' => '',
        'Scope Entity ID' => '',
        'This field is required for activities with a scope.' => '',
        'Activity Dialogs' => 'Dialog Aktiviti',
        'You can assign Activity Dialogs to this Activity by dragging the elements with the mouse from the left list to the right list.' =>
            'Anda boleh berikan Dialog Aktiviti ke Aktiviti ini dengan menarik unsur tersebut menggunakan tetikus dari senarai kiri ke senarai kanan.',
        'Ordering the elements within the list is also possible by drag \'n\' drop.' =>
            'Memesan unsur dalam senarai juga boleh dilakukan dengan drag dan drop.',
        'Available Activity Dialogs' => 'Dialog Aktiviti Tersedia',
        'Filter available Activity Dialogs' => 'Dialog Aktiviti dengan Penapis',
        'Also show global %s' => '',
        'Name: %s, EntityID: %s' => 'Nama: %s, EntitiID: %s',
        'Create New Activity Dialog' => 'Cipta Dialog Aktiviti Baru',
        'Assigned Activity Dialogs' => 'Dialog Aktiviti Ditugaskan',
        'Filter Assigned Activity Dialogs' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementActivityDialog.tt
        'Please note that changing this activity dialog will affect the following activities' =>
            'Sila ambil perhatian bahawa menukar dialog aktiviti ini akan memberi kesan kepada aktiviti-aktiviti berikut',
        'Please note that customer users will not be able to see or use the following fields: Owner, Responsible, Lock, PendingTime and CustomerID.' =>
            'Sila ambil perhatian bahawa pengguna pelanggan tidak akan dapat melihat atau menggunakan bidang-bidang berikut: Pemilik, Tanggungjawab, Kunci, Masa tangguh dan IDPelanggan. ',
        'The Queue field can only be used by customers when creating a new ticket.' =>
            'Medan barisan hanya boleh digunakan oleh pelanggan semasa membuat tiket baru.',
        'Activity Dialog' => 'Dialog Aktiviti',
        'Activity dialog Name' => 'Nama dialog aktiviti',
        'Available in' => 'Tersedia dalam',
        'Description (short)' => 'Penerangan (pendek)',
        'Description (long)' => 'Penerangan (panjang)',
        'The selected permission does not exist.' => 'Kebenaran yang dipilih tidak wujud.',
        'Required Lock' => 'Kunci Diperlukan',
        'The selected required lock does not exist.' => 'Kunci dikehendaki dipilih tidak wujud.',
        'This field is required for activitiy dialogs with a scope.' => '',
        'Submit Advice Text' => 'Hantar Teks Makluman',
        'Submit Button Text' => 'Teks Butang Hantar',
        'You can assign Fields to this Activity Dialog by dragging the elements with the mouse from the left list to the right list.' =>
            'Anda boleh tetapkan medan pada Aktiviti Dialog ini dengan menarik unsur tersebut menggunakan tetikus dari senarai kiri ke senarai kanan.',
        'Available Fields' => 'Medan tersedia',
        'Filter available fields' => 'Tapis medan tersedia',
        'Assigned Fields' => 'Medan yang ditetapkan',
        'Filter assigned fields' => '',
        'Communication Channel' => '',
        'Is visible for customer' => '',
        'Text Template' => 'Templat teks',
        'Auto fill' => '',
        'Display' => 'Pameran',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementPath.tt
        'Path' => 'Laluan',
        'Edit this transition' => 'Edit peralihan ini',
        'Transition Actions' => 'Tindakan Peralihan',
        'You can assign Transition Actions to this Transition by dragging the elements with the mouse from the left list to the right list.' =>
            'Anda boleh tetapkan TIndakan Peralihan pada Peralihan ini dengan menarik unsur tersebut menggunakan tetikus dari senarai kiri ke senarai kanan.',
        'Available Transition Actions' => 'Tindakan Peralihan Tersedia',
        'Filter available Transition Actions' => 'Tapis Tindakan Peralihan tersedia',
        'Create New Transition Action' => 'Mencipta Tindakan Peralihan Baharu',
        'Assigned Transition Actions' => 'Tindakan Peralihan yang ditetapkan',
        'Filter assigned Transition Actions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessAccordion.tt
        'Activities' => 'Aktiviti-aktiviti',
        'Filter Activities...' => 'Tapis Aktiviti...',
        'Create New Activity' => 'Cipta Aktiviti Baru',
        'Filter Activity Dialogs...' => 'Tapis Dialog Aktiviti...',
        'Transitions' => 'Peralihan',
        'Filter Transitions...' => 'Tapis Peralihan...',
        'Create New Transition' => 'Mencipta Peralihan Baharu',
        'Filter Transition Actions...' => 'Tapis Tindakan Peralihan...',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessEdit.tt
        'Print process information' => 'Cetak maklumat proses',
        'Delete Process' => 'Padam proses',
        'Delete Inactive Process' => 'Padam proses tidak aktif',
        'Available Process Elements' => 'Elemen Proses Tersedia',
        'The Elements listed above in this sidebar can be moved to the canvas area on the right by using drag\'n\'drop.' =>
            'Unsur yang disenaraikan di atas di sidebar ini boleh dipindahkan ke kawasan kanvas di sebelah kanan dengan menggunakan tarik dan lepas.',
        'You can place Activities on the canvas area to assign this Activity to the Process.' =>
            'Anda boleh meletakkan Aktiviti pada kawasan kanvas untuk menetapkan aktiviti ini kepada Proses.',
        'To assign an Activity Dialog to an Activity drop the Activity Dialog element from this sidebar over the Activity placed in the canvas area.' =>
            'Untuk memperuntukkan satu Dialog Aktiviti untuk aktiviti yang menggugurkan elemen Aktiviti Dialog daripada bar sisi ini ke atas aktiviti yang diletakkan di kawasan kanvas.',
        'You can start a connection between two Activities by dropping the Transition element over the Start Activity of the connection. After that you can move the loose end of the arrow to the End Activity.' =>
            '',
        'Actions can be assigned to a Transition by dropping the Action Element onto the label of a Transition.' =>
            'Tindakan boleh diberikan kepada Peralihan dengan menjatuhkan Unsur Tindakan ke label Peralihan.',
        'Edit Process' => 'Edit Proses',
        'Edit Process Information' => 'Edit Maklumat Proses',
        'Process Name' => 'Nama Proses',
        'The selected state does not exist.' => 'Keadaan yang dipilih tidak wujud.',
        'Add and Edit Activities, Activity Dialogs and Transitions' => 'Tambah dan Edit Aktiviti, Dialog Kegiatan dan Peralihan',
        'Show EntityIDs' => 'Tunjuk EntityIDs',
        'Extend the width of the Canvas' => 'Memperluaskan lebar Kanvas',
        'Extend the height of the Canvas' => 'Memperluaskan ketinggian kanvas',
        'Remove the Activity from this Process' => 'Buang Aktiviti daripada Proses ini',
        'Edit this Activity' => 'Edit Aktiviti ini',
        'Save Activities, Activity Dialogs and Transitions' => 'Simpan Aktiviti, Aktiviti Dialog dan Peralihan',
        'Do you really want to delete this Process?' => 'Adakah anda benar-benar mahu memadam Proses ini?',
        'Do you really want to delete this Activity?' => 'Adakah anda benar-benar mahu untuk memadam Aktiviti ini?',
        'Do you really want to delete this Activity Dialog?' => 'Adakah anda benar-benar mahu untuk memadam Aktiviti Dialog ini?',
        'Do you really want to delete this Transition?' => 'Anda pasti mahu memadam Peralihan ini?',
        'You can not edit a transition before it\'s connected to two activities.' =>
            '',
        'Do you really want to delete this Transition Action?' => 'Anda pasti mahu memadam Tindakan Peralihan ini?',
        'Do you really want to remove this activity from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Adakah anda benar-benar mahu menghapuskan aktiviti ini dari kanvas? Ini hanya boleh dibuat asal dengan meninggalkan skrin ini tanpa menyimpan.',
        'Do you really want to remove this transition from the canvas? This can only be undone by leaving this screen without saving.' =>
            'Adakah anda benar-benar mahu menghapuskan peralihan ini dari kanvas? Ini hanya boleh dibuat asal dengan meninggalkan skrin ini tanpa menyimpan.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessNew.tt
        'In this screen, you can create a new process. In order to make the new process available to users, please make sure to set its state to \'Active\' and synchronize after completing your work.' =>
            'Pada skrin ini, anda boleh mencipta proses baru. Dalam usaha untuk membuat proses yang baru yang tersedia kepada pengguna , sila pastikan untuk menetapkan keadaannya kepada \'Aktif\' dan menyelaraskan selepas menamatkan kerja anda.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementProcessPrint.tt
        'Start Activity' => 'Mula Aktiviti',
        'Contains %s dialog(s)' => 'Mengandungi dialog(dialog-dialog) %s',
        'Assigned dialogs' => 'Dialog yang ditetapkan',
        'Activities are not being used in this process.' => 'Aktiviti tidak digunakan dalam proses ini.',
        'Assigned fields' => 'Medan yang ditetapkan',
        'Activity dialogs are not being used in this process.' => 'Aktiviti dialog tidak digunakan dalam proses ini.',
        'Condition linking' => 'Keadaan menghubungkan',
        'Transitions are not being used in this process.' => 'Peralihan tidak digunakan dalam proses ini.',
        'Module name' => 'Nama modul',
        'Configuration' => 'Konfigurasi',
        'Transition actions are not being used in this process.' => 'Tindakan peralihan tidak digunakan dalam proses ini.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransition.tt
        'Please note that changing this transition will affect the following processes' =>
            'Sila ambil perhatian bahawa perubahan peralihan ini akan memberi kesan kepada proses berikut',
        'Transition' => 'Peralihan',
        'Transition Name' => 'Nama Peralihan',
        'This field is required for transitions with a scope.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminProcessManagementTransitionAction.tt
        'Please note that changing this transition action will affect the following processes' =>
            'Sila ambil perhatian bahawa perubahan tindakan peralihan ini akan memberi kesan kepada proses berikut',
        'Transition Action' => 'Tindakan Peralihan',
        'Transition Action Name' => 'Nama Tindakan Peralihan',
        'Transition Action Module' => 'Modul Tindakan Peralihan',
        'This field is required for transition actions with a scope.' => '',
        'Config Parameters' => 'Config Parameter',
        'Add a new Parameter' => 'Tambah Parameter baru',
        'Remove this Parameter' => 'Buang Parameter ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueue.tt
        'Add Queue' => 'Tambah Barisan',
        'Filter for Queues' => 'Penapis untuk barisan',
        'Filter for queues' => '',
        'Email Addresses' => 'Alamat emel',
        'PostMaster Mail Accounts' => 'Akaun Mel PostMaster',
        'Salutations' => 'Kata Aluan',
        'Signatures' => 'Tanda Tangan',
        'Templates ↔ Queues' => '',
        'Configure Working Hours' => '',
        'Configure Queue Related Settings' => '',
        'Edit Queue' => 'Edit barisan',
        'A queue with this name already exists!' => 'Barisan dengan nama ini sudah wujud!',
        'This queue is present in a SysConfig setting, confirmation for updating settings to point to the new queue is needed!' =>
            '',
        'Sub-queue of' => 'Sub-barisan',
        'Follow up Option' => 'Susulan Pilihan',
        'Specifies if follow up to closed tickets would re-open the ticket, be rejected or lead to a new ticket.' =>
            'Menetapkan jika susulan kepada tiket ditutup akan membuka semula tiket, boleh ditolak atau membawa kepada tiket baru.',
        'Unlock timeout' => 'Buka masa tamat',
        '0 = no unlock' => '0 = tidak buka kunci',
        'hours' => 'beberapa jam',
        'Only business hours are counted.' => 'Hanya waktu perniagaan dikira.',
        'If an agent locks a ticket and does not close it before the unlock timeout has passed, the ticket will unlock and will become available for other agents.' =>
            'Jika ejen mengunci tiket dan tidak menutupnya sebelum masa tamat membuka telah berlalu, tiket akan membuka dan akan menjadi tersedia untuk ejen-ejen lain.',
        'Notify by' => 'memberitahu melalui',
        '0 = no escalation' => '0 = tidak peningkatan',
        'If there is not added a customer contact, either email-external or phone, to a new ticket before the time defined here expires, the ticket is escalated.' =>
            'Jika ada tidak menambah kenalan pelanggan, sama ada melalui e-mel luaran atau telefon, tiket baru sebelum tamat tempoh masa yang ditetapkan, di sini, tiket meningkat.',
        'If there is an article added, such as a follow-up via email or the customer portal, the escalation update time is reset. If there is no customer contact, either email-external or phone, added to a ticket before the time defined here expires, the ticket is escalated.' =>
            'Jika terdapat satu artikel menambah, seperti susulan melalui e-mel atau portal pelanggan, masa peningkatan kemas kini semula. Jika tiada hubungan pelanggan, sama ada melalui e-mel luaran atau telefon, ditambah kepada tiket sebelum tamat tempoh masa yang ditetapkan, di sini, tiket meningkat.',
        'If the ticket is not set to closed before the time defined here expires, the ticket is escalated.' =>
            'Jika tiket itu tidak bersedia untuk ditutup sebelum tamat tempoh masa yang ditetapkan, di sini, tiket meningkat.',
        'Ticket lock after a follow up' => 'Tiket kunci selepas susulan',
        'If a ticket is closed and the customer sends a follow up the ticket will be locked to the old owner.' =>
            'Jika tiket ditutup dan pelanggan menghantar susulan tiket akan dikunci kepada pemilik lama.',
        'System address' => 'Alamat Sistem',
        'Will be the sender address of this queue for email answers.' => 'Akan menjadi alamat pengirim barisan ini untuk mendapatkan jawapan e-mel.',
        'Default sign key' => 'Tanda kunci lalai',
        'To use a sign key, PGP keys or S/MIME certificates need to be added with identifiers for selected queue system address.' =>
            '',
        'Salutation' => 'Kata Aluan',
        'The salutation for email answers.' => 'Kata aluan untuk mendapatkan jawapan e-mel.',
        'Signature' => 'Tanda Tangan',
        'The signature for email answers.' => 'Tandatangan untuk mendapatkan jawapan e-mel.',
        'This queue is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueAutoResponse.tt
        'This filter allow you to show queues without auto responses' => 'Tapisan ini membenarkan anda untuk menunjukkan barisan-barisan tanpa tindak balas auto',
        'Queues without Auto Responses' => '',
        'This filter allow you to show all queues' => 'Tapisan ini membenarkan anda untuk menunjukkan semua barisan',
        'Show All Queues' => '',
        'Auto Responses' => 'Auto Tindak Balas',
        'Manage Queue-Auto Response Relations' => 'Mengurus Perhubungan Response Barisan-Auto',
        'Change Auto Response Relations for Queue' => 'Tukar Perhubungan Response Auto untuk Barisan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminQueueTemplates.tt
        'Filter for Templates' => 'Menapis Templat',
        'Filter for templates' => '',
        'Manage Template-Queue Relations' => 'Mengurus Perkaitan Barisan-Templat ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRole.tt
        'Add Role' => 'Tambah Peranan',
        'Filter for Roles' => 'Menapis Peranan',
        'Filter for roles' => '',
        'Create a role and put groups in it. Then add the role to the users.' =>
            'Buat peranan dan meletakkan kumpulan di dalamnya. Kemudian menambah peranan kepada pengguna.',
        'Agents ↔ Roles' => '',
        'Role Management' => 'Pengurusan peranan',
        'Edit Role' => 'Edit Peranan',
        'There are no roles defined. Please use the \'Add\' button to create a new role.' =>
            'Tiada peranan ditakrifkan. Sila gunakan \'Tambah\' butang untuk mencipta peranan baru.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleGroup.tt
        'Roles' => 'peranan',
        'Manage Role-Group Relations' => 'Mengurus Perhubungan Kumpulan Peranan',
        'Select the role:group permissions.' => 'Pilih peranan: kebenaran kumpulan.',
        'If nothing is selected, then there are no permissions in this group (tickets will not be available for the role).' =>
            'Jika tiada apa yang dipilih, maka terdapat tiada kebenaran dalam kumpulan ini (tiket tidak akan disediakan untuk peranan).',
        'Toggle %s permission for all' => 'Togol %s kebenaran untuk semua',
        'move_into' => 'move_into',
        'Permissions to move tickets into this group/queue.' => 'Kebenaran untuk bergerak tiket ke kumpulan ini / barisan.',
        'create' => 'mewujudkan',
        'Permissions to create tickets in this group/queue.' => 'Kebenaran untuk mewujudkan tiket dalam kumpulan ini / barisan.',
        'note' => 'nota',
        'Permissions to add notes to tickets in this group/queue.' => 'Kebenaran untuk menambah nota untuk tiket dalam kumpulan ini / beratur.',
        'owner' => 'pemilik',
        'Permissions to change the owner of tickets in this group/queue.' =>
            'Kebenaran untuk menukar pemilik tiket dalam kumpulan ini / beratur.',
        'priority' => 'Keutamaan',
        'Permissions to change the ticket priority in this group/queue.' =>
            'Keizinan untuk menukar keutamaan tiket dalam kumpulan ini / barisan.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminRoleUser.tt
        'Add Agent' => 'Tambah Agen',
        'Filter for Agents' => 'Tapis untuk Ejen',
        'Filter for agents' => '',
        'Agents' => 'Ejen-ejen',
        'Manage Agent-Role Relations' => 'Mengurus Perhubungan Ejen-Peranan',
        'Manage Role-Agent Relations' => 'Mengurus Perhubungan Peranan Agen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSLA.tt
        'Add SLA' => 'SLA Tambah',
        'Filter for SLAs' => '',
        'Configure SLA Visibility and Defaults' => '',
        'SLA Management' => 'SLA-Pengurusan',
        'Edit SLA' => 'SLA Edit',
        'Please write only numbers!' => 'Sila tulis nombor sahaja!',
        'Minimum Time Between Incidents' => 'Masa minima antara incident',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIME.tt
        'SMIME support is disabled' => 'sokongan SMIME dinyahaktifkan',
        'To be able to use SMIME in Znuny, you have to enable it first.' =>
            'Untuk boleh menggunakan SMIME dalam Znuny, anda perlu membolehkannya terlebih dahulu.',
        'Enable SMIME support' => 'Bolehkan sokongan SMIME',
        'Faulty SMIME configuration' => 'Konfigurasi SMIME tidak betul',
        'SMIME support is enabled, but the relevant configuration contains errors. Please check the configuration using the button below.' =>
            'sokongan SMIME dibolehkan, tetapi konfigurasi berkaitan mempunyai kesilapan. Sila semak konfigurasi tersebut menggunakan butang dibawah.',
        'Check SMIME configuration' => 'Semak konfigurasi SMIME',
        'Add Certificate' => 'Tambah Sijil',
        'Add Private Key' => 'Tambah Kunci Persendirian',
        'Filter for Certificates' => '',
        'Filter for certificates' => 'Tapis bagi sijil',
        'To show certificate details click on a certificate icon.' => 'Untuk menunjukkan maklumat persijilan, klik pada ikon persijilan.',
        'To manage private certificate relations click on a private key icon.' =>
            'Untuk menguruskan hubungan persijilan peribadi, klik pada ikon kekunci peribadi.',
        'Here you can add relations to your private certificate, these will be embedded to the S/MIME signature every time you use this certificate to sign an email.' =>
            'Di sini anda boleh menambah hubungan kepada persijilan swasta anda, ini akan tertanam kepada tandatangan S/MIME setiap kali anda guna sijil ini untuk menandatangani satu emel.',
        'See also' => 'Lihat juga',
        'In this way you can directly edit the certification and private keys in file system.' =>
            'Dengan cara ini, anda boleh terus mengedit kunci pensijilan dan swasta dalam sistem fail.',
        'S/MIME Management' => 'S/MIME-Pengurusan',
        'Hash' => 'Hash',
        'Create' => 'Buat',
        'Handle related certificates' => 'Mengendalikan sijil yang berkaitan',
        'Read certificate' => 'Baca persijilan',
        'Delete this certificate' => 'Padam sijil ini',
        'File' => 'Fail',
        'Secret' => 'rahsia',
        'Related Certificates for' => 'Pensijilan berkaitan untuk',
        'Delete this relation' => 'Padam hubungan ini',
        'Available Certificates' => 'Pensijilan yang disediakan',
        'Filter for S/MIME certs' => 'Tapisan untuk sijil S/MIME',
        'Relate this certificate' => 'Hubungkaitkan sijil ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSMIMECertRead.tt
        'S/MIME Certificate' => 'Sijil S/MIME',
        'Close' => 'Tutup',
        'Certificate Details' => '',
        'Close this dialog' => 'Tutup dialog ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSalutation.tt
        'Add Salutation' => 'Tambah salam',
        'Filter for Salutations' => '',
        'Filter for salutations' => '',
        'Salutation Management' => 'salam Pengurusan',
        'Edit Salutation' => 'Edit salam',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSecureMode.tt
        'Secure Mode Needs to be Enabled!' => '',
        'Secure mode will (normally) be set after the initial installation is completed.' =>
            'DerMod selamat (biasanya) akan ditetapkan selepas pemasangan awal selesai.',
        'If secure mode is not activated, activate it via SysConfig because your application is already running.' =>
            'Jika mod selamat tidak diaktifkan, mengaktifkannya melalui SysConfig kerana permohonan anda sudah berjalan.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSelectBox.tt
        'Filter for Results' => '',
        'Filter for results' => '',
        'Here you can enter SQL to send it directly to the application database. It is not possible to change the content of the tables, only select queries are allowed.' =>
            'Di sini anda boleh memasukkan SQL untuk menghantarnya secara terus kepada pangkalan data permohonan. Adalah tidak mungkin untuk mengubah kandungan jadual, hanya memilih pertanyaan dibenarkan.',
        'Here you can enter SQL to send it directly to the application database.' =>
            'Sini anda boleh masukkan SQL untuk menghantar terus kepada pangkalan data permohonan.',
        'SQL Box' => 'Kotak SQL',
        'Options' => 'Pilihan',
        'Only select queries are allowed.' => 'Hanya permohonan \'select\' dibenarkan.',
        'The syntax of your SQL query has a mistake. Please check it.' =>
            'Syntax query SQL anda mempunyai kesilapan. Sila semak.',
        'There is at least one parameter missing for the binding. Please check it.' =>
            'Terdapat sekurang-kurangnya satu parameter yang hilang untuk mengikat. Sila semak.',
        'Result format' => 'format Keputusan',
        'Run Query' => 'Jalankan Query',
        '%s Results' => '',
        'Query is executed.' => 'Pertanyaan dilaksanakan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminService.tt
        'Add Service' => 'Tambah Perkhidmatan',
        'Configure Service Visibility and Defaults' => '',
        'Service Management' => 'perkhidmatan Pengurusan',
        'Edit Service' => 'Edit Perkhidmatan',
        'Service name maximum length is 200 characters (with Sub-service).' =>
            '',
        'Sub-service of' => 'Sub-perkhidmatan',
        'Criticality' => 'Kritikal',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSession.tt
        'All sessions' => 'semua sesi',
        'Agent sessions' => 'agen sesi',
        'Customer sessions' => 'Pelanggan sesi',
        'Unique agents' => 'ejen unik',
        'Unique customers' => 'pelanggan unik',
        'Kill all sessions' => 'Bunuh semua sesi',
        'Kill this session' => 'Bunuh sesi ini',
        'Filter for Sessions' => '',
        'Filter for sessions' => '',
        'Session Management' => 'Pengurusan sesi',
        'Detail Session View for %s (%s)' => '',
        'Session' => 'sesi',
        'Kill' => 'Bunuh',
        'Detail View for SessionID: %s - %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSignature.tt
        'Add Signature' => 'Tambah Tandatangan',
        'Filter for Signatures' => '',
        'Filter for signatures' => '',
        'Signature Management' => 'Pengurusan tandatangan',
        'Edit Signature' => 'Edit Tandatangan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminState.tt
        'Add State' => 'Tambah keadaan',
        'Filter for States' => '',
        'Filter for states' => '',
        'Attention' => 'Perhatian',
        'Please also update the states in SysConfig where needed.' => 'Sila juga mengemaskini keadaan dalam SysConfig mana diperlukan',
        'Configure State Visibility and Defaults' => '',
        'Configure State Type Visibility and Defaults' => '',
        'State Management' => 'Pengurusan Keadaan',
        'Edit State' => 'Edit keadaan',
        'This state is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            '',
        'State type' => 'Jenis Keadaan',
        'It\'s not possible to invalidate this entry because there is no other merge states in system!' =>
            '',
        'This field must be a hexadecimal color code.' => '',
        'This state is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSupportDataCollector.tt
        'A support bundle (including: system registration information, support data, a list of installed packages and all locally modified source code files) can be generated by pressing this button:' =>
            'Bungkusan sokongan (termasuk: maklumat pendaftaran sistem, data sokongan, senarai pemasangan pakej dan semua fail-fail kod sumber ubahsuai tempatan) boleh dihasilkan dengan menekan butang ini:',
        'Generate Support Bundle' => 'Menghasilkan Berkas Sokongan',
        'The Support Bundle has been Generated' => '',
        'A file containing the support bundle will be downloaded to the local system.' =>
            'Fail yang mengandungi berkas sokongan akan dimuat turun ke sistem domestik.',
        'Support Data' => 'Data Sokongan',
        'Error: Support data could not be collected (%s).' => 'Ralat: Data sokongan tidak boleh dikumpulkan (%s).',
        'Support Data Collector' => 'Pengumpul Data Sokongan',
        'Delete cache' => '',
        'Details' => 'Butiran',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemAddress.tt
        'Add System Address' => '',
        'Filter for System Addresses' => '',
        'Filter for system addresses' => '',
        'All incoming email with this address in To or Cc will be dispatched to the selected queue.' =>
            'Semua e-mel masuk dengan alamat ini Untuk atau Cc akan dihantar ke barisan yang dipilih.',
        'System Email Addresses Management' => 'Sistem E-mel Alamat Pengurusan',
        'Add System Email Address' => 'Tambah Sistem Alamat E-mel',
        'Edit System Email Address' => 'Edit Alamat E-mel System',
        'Email address' => 'alamat e-mel',
        'Display name' => 'Paparkan nama',
        'This email address is already used as system email address.' => '',
        'The display name and email address will be shown on mail you send.' =>
            'Nama paparan dan alamat e-mel akan ditunjukkan di atas email yang anda hantar.',
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
        'Category' => 'Kategori',
        'Run search' => 'Jalankan carian',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemConfigurationView.tt
        'Go back to Deployment Details' => '',
        'View a custom List of Settings' => '',
        'View single Setting: %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles.tt
        'System file support' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemFiles/Widget.tt
        'Permissions' => 'kebenaran',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenance.tt
        'Schedule New System Maintenance' => 'Jadual Penyelenggaraan Sistem Baru',
        'Filter for System Maintenances' => '',
        'Filter for system maintenances' => '',
        'Schedule a system maintenance period for announcing the Agents and Customers the system is down for a time period.' =>
            'Jadualkan waktu penyelenggaraan sistem untuk mengumumkan pada Ejen dan Pelanggan bahawa sistem rosak buat sementara waktu.',
        'Some time before this system maintenance starts the users will receive a notification on each screen announcing about this fact.' =>
            'Beberapa ketika sebelum penyelenggaraan sistem bermula, pengguna akan menerima pemberitahuan di skrin mengenainya.',
        'System Maintenance Management' => 'Pengurusan Penyelenggaraan Sistem',
        'Stop date' => 'Tarikh Berhenti',
        'Delete System Maintenance' => 'Padam Penyelenggaraan Sistem',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminSystemMaintenanceEdit.tt
        'Edit System Maintenance' => '',
        'Edit System Maintenance Information' => '',
        'Date invalid!' => 'Tarikh tidak sah!',
        'Login message' => 'Mesej log masuk',
        'This field must have less then 250 characters.' => '',
        'Show login message' => 'Tunjuk mesej log masuk',
        'Notify message' => 'Mesej memaklumkan',
        'Manage Sessions' => 'Mengurus Sesi',
        'All Sessions' => 'Semua Sesi',
        'Agent Sessions' => 'Sesi Agen ',
        'Customer Sessions' => ' Sesi Pelanggan',
        'Kill all Sessions, except for your own' => 'Buang semua Sesi, kecuali kepunyaan anda',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplate.tt
        'Add Template' => 'Tambah Templat',
        'A template is a default text which helps your agents to write faster tickets, answers or forwards.' =>
            'Templat ialah teks lalai yang membantu ejen-ejen anda menulis tiket-tiket lebih cepat, menjawab atau mengemukakan.',
        'Don\'t forget to add new templates to queues.' => 'Jangan lupa untuk menambah templat baru kepada barisan.',
        'Template Management' => '',
        'Edit Template' => 'Edit Templat ',
        'Attachments' => 'Lampiran',
        'Delete this entry' => 'Padam entri ini',
        'Do you really want to delete this template?' => 'Adakah anda benar-benar mahu untuk memadam template ini?',
        'A standard template with this name already exists!' => 'Templat piawai dengan nama ini sudah wujud!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTemplateAttachment.tt
        'Manage Template-Attachment Relations' => '',
        'Toggle active for all' => 'Togol aktif untuk semua',
        'Link %s to selected %s' => 'Pautan %s terpilih %s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminTicketAttributeRelations.tt
        'Import CSV or Excel file' => '',
        'Ticket attribute relations' => '',
        'Add ticket attribute relations' => '',
        'Edit ticket attribute relations' => '',
        'Attribute' => 'Sifat',
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
        'Add Type' => 'Tambah Jenis',
        'Filter for Types' => '',
        'Filter for types' => '',
        'Configure Type Visibility and Defaults' => '',
        'Type Management' => 'Pengurusan jenis',
        'Edit Type' => 'Edit Jenis',
        'A type with this name already exists!' => 'Jenis dengan nama ini sudah wujud!',
        'This type is present in a SysConfig setting, confirmation for updating settings to point to the new type is needed!' =>
            '',
        'This type is used in the following config settings:' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUser.tt
        'Edit personal preferences for this agent' => '',
        'Agents will be needed to handle tickets.' => 'Ejen akan diperlukan untuk mengendalikan tiket.',
        'Don\'t forget to add a new agent to groups and/or roles!' => 'Jangan lupa untuk menambah ejen baru kepada kumpulan dan / atau peranan!',
        'Agent Management' => 'Pengurusan Ejen',
        'Edit Agent' => 'Edit Agen',
        'Please enter a search term to look for agents.' => 'Sila masukkan istilah carian untuk mencari ejen.',
        'Last login' => 'log masuk terakhir',
        'Switch to agent' => 'Beralih kepada ejen',
        'Title or salutation' => 'Tajuk atau sapaan',
        'Firstname' => 'Nama Pertama',
        'Lastname' => 'Nama Akhir',
        'A user with this username already exists!' => 'Pengguna dengan nama pengguna ini sudah wujud!',
        'Will be auto-generated if left empty.' => 'Akan dijana secara automatik sekiranya dibiar kosong.',
        'Mobile' => 'mudah alih',
        'Effective Permissions for Agent' => '',
        'This agent has no group permissions.' => '',
        'Table above shows effective group permissions for the agent. The matrix takes into account all inherited permissions (e.g. via roles).' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AdminUserGroup.tt
        'Manage Agent-Group Relations' => 'Mengurus Perhubungan Kumpulan-Ejen',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentAgendaOverview.tt
        'Agenda Overview' => 'Pandangan Agenda',
        'Manage Calendars' => '',
        'Add Appointment' => '',
        'Today' => 'Hari ini',
        'All-day' => 'Setiap-hari',
        'Repeat' => '',
        'Notification' => 'Pemberitahuan',
        'Yes' => 'Ya',
        'No' => 'Tidak',
        'No calendars found. Please add a calendar first by using Manage Calendars page.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentCalendarOverview.tt
        'Add new Appointment' => '',
        'Appointments' => '',
        'Calendars' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentAppointmentEdit.tt
        'Basic information' => '',
        'Date/Time' => '',
        'Invalid date!' => 'Tarikh Tidak Sah!',
        'Please set this to value before End date.' => '',
        'Please set this to value after Start date.' => '',
        'This an occurrence of a repeating appointment.' => '',
        'Click here to see the parent appointment.' => '',
        'Click here to edit the parent appointment.' => '',
        'Frequency' => '',
        'Every' => '',
        'day(s)' => 'hari(beberapa)',
        'week(s)' => 'minggu(beberapa)',
        'month(s)' => 'Bulan(beberapa)',
        'year(s)' => 'tahun(beberapa)',
        'On' => 'Buka',
        'Monday' => 'Isnin',
        'Mon' => 'Isn',
        'Tuesday' => 'Selasa',
        'Tue' => 'Sel',
        'Wednesday' => 'Rabu',
        'Wed' => 'Rab',
        'Thursday' => 'Khamis',
        'Thu' => 'Kha',
        'Friday' => 'Jumaat',
        'Fri' => 'Jum',
        'Saturday' => 'Sabtu',
        'Sat' => 'Sab',
        'Sunday' => 'Ahad',
        'Sun' => 'Ahd',
        'January' => 'Januari',
        'Jan' => 'Jan',
        'February' => 'Februari',
        'Feb' => 'Feb',
        'March' => 'Mac',
        'Mar' => 'Mac',
        'April' => 'April',
        'Apr' => 'Apr',
        'May_long' => 'Mei',
        'May' => 'Mei',
        'June' => 'Jun',
        'Jun' => 'Jun',
        'July' => 'Julai',
        'Jul' => 'Jul',
        'August' => 'Ogos',
        'Aug' => 'Ogs',
        'September' => 'September',
        'Sep' => 'Sep',
        'October' => 'Oktober',
        'Oct' => 'Okt',
        'November' => 'November',
        'Nov' => 'Nov',
        'December' => 'Disember',
        'Dec' => 'Dis',
        'Relative point of time' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenter.tt
        'Customer Information Center' => 'Pusat Informasi Pelanggan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerInformationCenterSearch.tt
        'Customer User' => 'Pengguna Pelanggan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerTableView.tt
        'Note: Customer is invalid!' => 'Nota: Pelanggan tidak sah!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBook.tt
        'Customer User Address Book' => '',
        'Search for recipients and add the results as \'%s\'.' => '',
        'Search template' => 'Cari templat',
        'Create Template' => 'Buat templat',
        'Create New' => 'Buat baru',
        'Save changes in template' => 'Simpan perubahan dalam templat.',
        'Filters in use' => 'Tapisan digunakan',
        'Additional filters' => 'Tapisan tambahan',
        'Add another attribute' => 'Tambah atribut lain',
        'The attributes with the identifier \'(Customer)\' are from the customer company.' =>
            '',
        '(e. g. Term* or *Term*)' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverview.tt
        'The customer user is already selected in the ticket mask.' => '',
        'Select this customer user' => '',
        'Add selected customer user to' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserAddressBookOverviewNavBar.tt
        'Change search options' => 'Ubah opsyen pencarian',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentCustomerUserInformationCenter.tt
        'Customer User Information Center' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDaemonInfo.tt
        'The Znuny Daemon is a daemon process that performs asynchronous tasks, e.g. ticket escalation triggering, email sending, etc.' =>
            'Znuny Daemon ialah proses daemon yang menjalankan tugas tidak segerak, contoh: cetusan peningkatan tiket, menghantar emel dan lain-lain.',
        'A running Znuny Daemon is mandatory for correct system operation.' =>
            'Znuny Daemon yang berjalan adalah wajib untuk operasi sistem yang betul.',
        'Starting the Znuny Daemon' => 'Memulakan Znuny Daemon',
        'Make sure that the file \'%s\' exists (without .dist extension). This cron job will check every 5 minutes if the Znuny Daemon is running and start it if needed.' =>
            'Pastikan fail \'%s\' wujud (tanpa sambungan .dist). Tugas cron ini akan memeriksa setiap 5 minit jika Znuny Daemon sedang berjalan dan memulakan apabila diperlukan.',
        'Execute \'%s start\' to make sure the cron jobs of the \'znuny\' user are active.' =>
            'Jalankan \'%s mula\' untuk memastikan tugas cron pengguna \'znuny\' aktif.',
        'After 5 minutes, check that the Znuny Daemon is running in the system (\'bin/znuny.Daemon.pl status\').' =>
            'Selepas 5 minit, periksa Znuny Deamon yang berjalan di dalam sistem (\'bin/znuny.Daemon.pl status\').',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboard.tt
        'Dashboard' => 'Dashboard',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardAppointmentCalendar.tt
        'New Appointment' => '',
        'Tomorrow' => 'Esok',
        'Soon' => '',
        '5 days' => '',
        'Start' => 'mula',
        'none' => 'tiada',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCalendarOverview.tt
        'in' => 'dalam',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCommon.tt
        'Search inactive widgets' => '',
        'Active Widgets' => '',
        'Save changes' => '',
        'Close this widget' => '',
        'Hide' => '',
        'more' => 'lagi',
        'No Data Available.' => '',
        'Available Columns' => 'Ruangan tersedia',
        'Visible Columns (order by drag & drop)' => 'Ruangan dapat dilihat (susunan secara tarik dan lepas)',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDList.tt
        'Change Customer Relations' => '',
        'Open' => 'Buka',
        'Closed' => 'Ditutup',
        'Phone ticket' => 'Tiket telefon',
        'Email ticket' => 'Tiket emel',
        '%s open ticket(s) of %s' => '%s membuka tiket(tiket-tiket) %s',
        '%s closed ticket(s) of %s' => '%s menutup tiket(tiket-tiket) %s',
        'New phone ticket from %s' => 'Tiket telefon baru daripada %s',
        'New email ticket to %s' => 'Tiket emel baru kepada %s',
        'Edit customer ID' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerIDStatus.tt
        'Escalated tickets' => 'Peningkatan tiket',
        'Open tickets' => 'Buka tiket',
        'Closed tickets' => 'Tiket ditutup',
        'All tickets' => 'Semua Tiket',
        'Archived tickets' => 'Tiket Disimpan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserInformation.tt
        'Note: Customer User is invalid!' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardCustomerUserList.tt
        'Customer user information' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardMyLastChangedTickets.tt
        'No tickets found.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardRSSOverview.tt
        'Posted %s ago.' => 'Dipos %s lalu.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardStats.tt
        'The configuration for this statistic widget contains errors, please review your settings.' =>
            'Konfigurasi untuk wiget statistik ini mengandungi ralat, sila semak semula tetapan anda.',
        'Download as SVG file' => 'Muat turun sebagai fail SVG',
        'Download as PNG file' => 'Muat turun sebagai fail PNG',
        'Download as CSV file' => 'Muat turun sebagai fail CSV',
        'Download as Excel file' => 'Muat turun sebagai fail Excel',
        'Download as PDF file' => 'Muat turun sebagai fail PDF',
        'Please select a valid graph output format in the configuration of this widget.' =>
            'Sila pilih format output graf yang sah dalam konfigurasi wiget ini.',
        'The content of this statistic is being prepared for you, please be patient.' =>
            'Kandungan statistik ini sedang disediakan untuk anda, sila bersabar.',
        'This statistic can currently not be used because its configuration needs to be corrected by the statistics administrator.' =>
            'Statistik tidak boleh digunakan pada masa ini kerana konfigurasi perlu diperbetulkan oleh pentadbir statistik.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketGeneric.tt
        'Show' => '',
        'Assigned to customer user' => '',
        'Accessible for customer user' => '',
        'My locked tickets' => 'Tiket dikunci saya',
        'My owned tickets' => '',
        'My watched tickets' => 'Tiket menonton saya',
        'My responsibilities' => 'saya tanggungjawab',
        'Tickets in My Queues' => 'Tiket dalam barisan saya',
        'Tickets in My Services' => 'Tiket dalam Perkhidmatan Saya',
        'Service Time' => 'Masa Servis',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardTicketQueueOverview.tt
        'Total' => 'Jumlah',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOnline.tt
        'out of office' => 'keluar dari pejabat',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentDashboardUserOutOfOffice.tt
        'until' => 'sehingga',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentInfo.tt
        'To accept some news, a license or some changes.' => 'Untuk menerima beberapa berita, lesen atau beberapa perubahan.',
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
        'Preferences' => 'Pilihan',
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
        'Edit your preferences' => 'Edit pilihan anda',
        'Personal Preferences' => '',
        'Avatars have been disabled by the system administrator. You\'ll see your initials instead.' =>
            '',
        'You can change your avatar image by registering with your email address %s at %s. Please note that it can take some time until your new avatar becomes available because of caching.' =>
            '',
        'Off' => 'Tutup',
        'End' => 'Tamat',
        'Left' => 'Kiri',
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
        'Target' => '',
        'Process' => 'Proses',
        'Split' => 'Pemecahan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsAdd.tt
        'Statistics Management' => '',
        'Add Statistics' => '',
        'Dynamic Matrix' => 'Matrik Dinamik',
        'Each cell contains a singular data point.' => '',
        'Dynamic List' => 'Senarai Dinamik',
        'Each row contains data of one entity.' => '',
        'Static' => 'Statik',
        'Non-configurable complex statistics.' => '',
        'General Specification' => 'Spesifikasi Umum',
        'Create Statistic' => 'Cipta Statistik',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsEdit.tt
        'Run now' => 'Jalankan sekarang',
        'Edit Statistics' => '',
        'Statistics Preview' => 'Pratonton Statistik',
        'Save Statistic' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsImport.tt
        'Import Statistics' => '',
        'Import Statistics Configuration' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsOverview.tt
        'Statistics' => 'Statistik',
        'Edit statistic "%s".' => 'Sunting statistik "%s".',
        'Export statistic "%s"' => 'Eksport statistik "%s".',
        'Export statistic %s' => 'Eksport statistik %s',
        'Delete statistic %s' => 'Padam statistik %s',
        'Do you really want to delete this statistic?' => 'Adakah anda betul-betul ingin memadam statistik ini?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentStatisticsView.tt
        'Statistics Information' => '',
        'Created by' => 'Dicipta oleh',
        'Changed by' => 'Diubah oleh',
        'Sum rows' => 'Jumlah baris',
        'Sum columns' => 'Jumlah lajur',
        'Show as dashboard widget' => 'Tunjuk sebagai papan pemuka widget',
        'Cache' => 'Cache',
        'Statistics Overview' => '',
        'View Statistics' => '',
        'This statistic contains configuration errors and can currently not be used.' =>
            'Statistik ini mengandungi ralat konfigurasi dan tidak boleh digunakan pada masa sekarang.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketActionCommon.tt
        'Change Free Text of %s%s%s' => 'Tukar Teks Percuma bagi %s%s%s',
        'Change Owner of %s%s%s' => 'Tukar Pemilik bagi %s%s%s',
        'Close %s%s%s' => 'Tutup %s%s%s',
        'Add Note to %s%s%s' => 'Tambah Nota pada %s%s%s',
        'Set Pending Time for %s%s%s' => 'Tentukan Waktu Sementara bagi %s%s%s',
        'Change Priority of %s%s%s' => 'Tukar Kewajipan bagi %s%s%s',
        'Change Responsible of %s%s%s' => ' ',
        'The ticket has been locked' => 'Tiket telah dikunci',
        'Ticket Settings' => 'Aturan Tiket',
        'Service invalid.' => 'Perkhidmatan tidak sah.',
        'SLA invalid.' => '',
        'Team Data' => '',
        'Queue invalid.' => '',
        'New Owner' => 'Pemilik baru',
        'Please set a new owner!' => 'Sila tetapkan pemilik baru!',
        'Owner invalid.' => '',
        'New Responsible' => 'Tanggungjawab baharu',
        'Please set a new responsible!' => '',
        'Responsible invalid.' => '',
        'Ticket Data' => '',
        'Next state' => 'Keadaan seterusnya',
        'State invalid.' => '',
        'For all pending* states.' => 'Untuk semua keadaan tergantung*.',
        'Dynamic Info' => '',
        'Add Article' => 'Tambah Artikel',
        'Inform' => '',
        'Inform agents' => 'Memaklumkan agen',
        'Inform involved agents' => 'Beritahu ejen terlibat',
        'Here you can select additional agents which should receive a notification regarding the new article.' =>
            'Di sini anda boleh memilih ejen tambahan yang sepatutnya menerima pemberitahuan mengenai artikel baru.',
        'Text will also be received by' => 'Teks juga akan diterima oleh',
        'Communications' => '',
        'Create an Article' => 'Cipta Artikel',
        'Setting a template will overwrite any text or attachment.' => 'Menetapkan templat akan menulis ganti sebarang teks atau lampiran.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBounce.tt
        'Bounce %s%s%s' => 'Lantunan %s%s%s',
        'cancel' => '',
        'Bounce to' => 'Bounce kepada',
        'You need a email address.' => 'Anda perlu alamat e-mel.',
        'Need a valid email address or don\'t use a local email address.' =>
            'Perlu alamat emel yang sah atau jangan menggunakan alamat emel tempatan.',
        'Next ticket state' => 'Status tiket seterusnya',
        'Inform sender' => 'Memaklumkan penghantar',
        'Send mail' => 'Hantar mel!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketBulk.tt
        'Ticket Bulk Action' => 'Tindakan Pukal Tiket',
        'Send Email' => 'Hantar Emel',
        'Merge' => 'Bergabung',
        'Merge to' => 'Gabung dengan',
        'Invalid ticket identifier!' => 'Pengecam tiket tidak sah!',
        'Merge to oldest' => 'Bergabung kepada yang terlama',
        'Link together' => 'Cantum bersama',
        'Link to parent' => 'Cantum dengan yang paling asal',
        'Unlock tickets' => 'Buka tiket',
        'Watch tickets' => '',
        'Mark tickets as seen' => '',
        'Mark tickets as unseen' => '',
        'Execute Bulk Action' => 'Laksanakan Tindakan Pukal',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCompose.tt
        'Compose Answer for %s%s%s' => 'Mengarang Jawapan untuk %s%s%s',
        'Date Invalid!' => 'Tarikh tidak sah!',
        'Select one or more recipients from the customer user address book.' =>
            '',
        'Customer user address book' => '',
        'This address is registered as system address and cannot be used: %s' =>
            'Alamat ini didaftarkan sebagai alamat sistem dan tidak boleh digunakan: %s',
        'Please include at least one recipient' => 'Sila sertakan sekurang-kurangnya satu penerima',
        'Remove Ticket Customer' => 'Buang Pelanggan Tiket',
        'Please remove this entry and enter a new one with the correct value.' =>
            'Sila keluarkan entri ini dan masukkan satu yang baru dengan nilai yang betul.',
        'This address already exists on the address list.' => 'Alamat ini sudah pun wujud pada senarai alamat',
        'Remove Cc' => 'Buang Cc',
        'Bcc' => 'Bcc',
        'Remove Bcc' => 'Buang Bcc',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketCustomer.tt
        'Change Customer of %s%s%s' => 'Tukar Pelanggan bagi %s%s%s',
        'Customer Information' => 'Informasi Pelanggan',
        'Customer user' => 'Pengguna pelanggan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmail.tt
        'Create New Email Ticket' => 'Buat Tiket Email Baru.',
        'Example Template' => 'Contoh Templat',
        'To customer user' => 'Ke pengguna pelanggan',
        'Please include at least one customer user for the ticket.' => 'Sila masukkan sekurang-kurangnya satu pengguna pelanggan bagi tiket.',
        'Select this customer as the main customer.' => 'Pilih pelanggan ini sebagai pelanggan utama.',
        'Remove Ticket Customer User' => 'Buang Tiket Pengguna Pelanggan',
        'From queue' => 'Dari barisan.',
        'Get all' => 'Dapatkan semua.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailOutbound.tt
        'Outbound Email for %s%s%s' => 'Emel Menuju Ke Luar bagi %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEmailResend.tt
        'Resend Email for %s%s%s' => '',
        'All fields marked with an asterisk (*) are mandatory.' => 'Semua medan bertanda bintang (*) adalah wajib.',
        'Cancel & close' => 'Batal dan tutup',
        'Undo & close' => 'Buat semula & tutup',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketEscalation.tt
        'Ticket %s: first response time is over (%s/%s)!' => 'Tiket %s: reaksi masa pertama sudah tamat (%s/%s)!',
        'Ticket %s: first response time will be over in %s/%s!' => 'Tiket %s: reaksi masa pertama akan tamat dalam %s/%s!',
        'Ticket %s: update time is over (%s/%s)!' => 'Tiket %s: masa kemaskini telah tamat (%s/%s)!',
        'Ticket %s: update time will be over in %s/%s!' => 'Tiket %s: masa kemaskini akan tamat dalam %s/%s!',
        'Ticket %s: solution time is over (%s/%s)!' => 'Tiket %s: masa penyelesaian sudah tamat (%s/%s)!',
        'Ticket %s: solution time will be over in %s/%s!' => 'Tiket %s: masa penyelesaian akan tamat dalam %s/%s!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketForward.tt
        'Forward %s%s%s' => 'Kehadapan %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketHistory.tt
        'History of %s%s%s' => 'Sejarah bagi %s%s%s',
        'Start typing to filter...' => '',
        'Filter for history items' => '',
        'Expand/Collapse all' => '',
        'CreateTime' => 'Cipta Masa',
        'Article' => 'Artikel',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMerge.tt
        'Merge %s%s%s' => 'Menggabungkan %s%s%s',
        'Merge Settings' => 'Gabung Aturan',
        'Try typing part of the ticket number or title in order to search by it.' =>
            '',
        'You need to use a ticket number!' => 'Anda perlu menggunakan nombor tiket!',
        'A valid ticket number is required.' => 'Nombor tiket yang sah diperlukan.',
        'Limit the search to tickets with same Customer ID (%s).' => '',
        'Inform Sender' => '',
        'Need a valid email address.' => 'Memerlukan alamat emel yang sah.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketMove.tt
        'Move %s%s%s' => 'Menggerakkan %s%s%s',
        'New Queue' => 'Barisan baru',
        'Communication' => 'Komunikasi',
        'Move' => 'Gerak',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketNoteToLinkedTicket.tt
        'Add note to linked %s%s%s' => '',
        'Notes' => '',
        'Note to linked Ticket' => '',
        'LinkList invalid.' => '',
        'Note to origin Ticket' => '',
        'NoteToTicket invalid.' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewMedium.tt
        'No ticket data found.' => 'Tiada data tiket ditemui.',
        'Open / Close ticket action menu' => '',
        'Select this ticket' => '',
        'Sender' => 'Penghantar',
        'Customer User Name' => '',
        'Impact' => 'Kesan',
        'Update Time' => 'Masa Kemas Kini',
        'Solution Time' => 'Masa Penyelasaian',
        'First Response Time' => 'Masa respon pertama',
        'Move ticket to a different queue' => 'Pindah tiket ke barisan baru',
        'Change queue' => 'Ubah barisan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewNavBar.tt
        'Remove active filters for this screen.' => 'Buang penapis aktif untuk skrin ini.',
        'Clear all filters' => '',
        'Remove mention' => '',
        'Remove from list of watched tickets' => 'Dibuang daripada senarai tiket dilihat',
        'Tickets per page' => 'Tiket setiap halaman',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewPreview.tt
        'Missing channel' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketOverviewSmall.tt
        'Reset overview' => 'Set semula tinjauan',
        'Column Filters Form' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhone.tt
        'Split Into New Phone Ticket' => 'Pisah Kepada Tiket Telefon Baru',
        'Create New Phone Ticket' => 'Buat Tiket Telefon Baru.',
        'Please include at least one customer for the ticket.' => 'Sila masukkan sekurang-kurangnya satu pelanggan bagi tiket.',
        'To queue' => 'Kepada barisan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPhoneCommon.tt
        'Phone Call for %s%s%s' => 'Panggilan Telefon untuk %s%s%s',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketPlain.tt
        'View Email Plain Text for %s%s%s' => '',
        'Plain' => 'Biasa',
        'Download this email' => 'Muat turun emel ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcess.tt
        'Create New Process Ticket' => 'Cipta Tiket Proses Baharu',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketProcessSmall.tt
        'Enroll Ticket into a Process' => 'Daftar Tiket ke dalam Proses',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketSearch.tt
        'Profile link' => 'Pautan profil.',
        'Output' => 'Output',
        'Fulltext' => 'Teks penuh',
        'Customer ID (complex search)' => '',
        '(e. g. 234*)' => '',
        'Customer ID (exact match)' => '',
        'Assigned to Customer User Login (complex search)' => '',
        '(e. g. U51*)' => '',
        'Assigned to Customer User Login (exact match)' => '',
        'Accessible to Customer User Login (exact match)' => '',
        'Created in Queue' => 'Dibuat dalam barisan',
        'Lock state' => 'Kunci status',
        'Watcher' => 'Pemerhati',
        'Article Create Time (before/after)' => 'Masa Artikel Dibuat (sebelum/selepas)',
        'Article Create Time (between)' => 'Masa Artikel Dibuat (diantara)',
        'Please set this to value before end date.' => '',
        'Please set this to value after start date.' => '',
        'Ticket Create Time (before/after)' => 'Masa Tiket Dibuat (sebelum/selepas)',
        'Ticket Create Time (between)' => 'Masa Tiket Dibuat (diantara)',
        'Ticket Change Time (before/after)' => 'Masa Tiket Diubah (sebelum/selepas)',
        'Ticket Change Time (between)' => 'Masa Tiket Diubah (diantara)',
        'Ticket Last Change Time (before/after)' => 'Masa Perubahan Terakhir Tiket (sebelum/selepas)',
        'Ticket Last Change Time (between)' => 'Masa Perubahan Terakhir Tiket (diantara)',
        'Ticket Pending Until Time (before/after)' => '',
        'Ticket Pending Until Time (between)' => '',
        'Ticket Close Time (before/after)' => 'Masa Tiket Ditutup (sebelum/selepas)',
        'Ticket Close Time (between)' => 'Masa Tiket Ditutup (diantara)',
        'Ticket Escalation Time (before/after)' => 'Masa Peningkatan Tiket (sebelum/selepas)',
        'Ticket Escalation Time (between)' => 'Masa Peningkatan Tiket (antara)',
        'Archive Search' => 'Carian Arkib',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom.tt
        'Sender Type' => 'Jenis penghantar',
        'Save filter settings as default' => 'Simpan tetapan penapis sebagai piawai.',
        'Event Type' => 'Jenis Acara',
        'Save as default' => 'Simpan sebagai lalai',
        'Drafts' => '',
        'by' => 'oleh',
        'Change Queue' => 'Ubah Barisan',
        'There are no dialogs available at this point in the process.' =>
            'Tidak terdapat dialog ketika ini di dalam proses.',
        'This item has no articles yet.' => 'Barangan ini tidak mempunyai artikel lagi.',
        'Article Overview - %s Article(s)' => '',
        'Page %s' => '',
        'Add Filter' => 'Tambah Tapisan',
        'Set' => 'Tetapkan',
        'Reset Filter' => 'Tetapkan semula penapis',
        'No.' => 'Tidak',
        'Unread articles' => 'Artikel yang belum dibaca',
        'Via' => '',
        'Important' => 'Penting',
        'Unread Article!' => 'Artikel belum dibaca!',
        'Incoming message' => 'Mesej masuk',
        'Outgoing message' => 'Mesej keluar',
        'Internal message' => 'Mesej dalaman',
        'Sending of this message has failed.' => '',
        'Resize' => 'Mengubah saiz',

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
            'Untuk membuka pautan dalam artikel berikut , anda mungkin perlu menekan Ctrl atau Cmd atau Shift semasa mengklik link (bergantung kepada pelayar dan OS anda).',
        'Close this message' => 'Tutup mesej ni',
        'Image' => '',
        'PDF' => '',
        'View' => 'Melihat',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/LinkTable.tt
        'Linked Objects' => 'Objek yang Dihubungkan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/MentionsTable.tt
        'Mentions' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AgentTicketZoom/TicketInformation.tt
        'Archive' => 'Arkib',
        'This ticket is archived.' => 'Sistem ini diarkibkan.',
        'is invalid' => '',
        'Pending till' => 'Menunggu sehingga',
        'Locked' => 'Terkunci',
        'Accounted time' => 'Masa yang diperuntukan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ArticleContent/Invalid.tt
        'Preview of this article is not possible because %s channel is missing in the system.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/AttachmentBlocker.tt
        'To protect your privacy, remote content was blocked.' => 'Untuk melindungi privasi anda, kandungan jauh telah disekat.',
        'Load blocked content.' => 'Buka kandungan yang disekat.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Breadcrumb.tt
        'Home' => '',
        'Back' => 'Kebelakang',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Create.tt
        'Ticket Creation' => '',
        'Link' => 'Pautan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Calendar/Plugin/Ticket/Link.tt
        'Remove entry' => 'Buang kemasukan',

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
        'Error' => 'Kesilapan',
        'An Error Occurred' => 'Kesalahan Telah Berlaku',
        'Traceback' => 'Menjejaki kembali',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooter.tt
        'Powered by %s' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerFooterJS.tt
        '%s detected possible network issues. You could either try reloading this page manually or wait until your browser has re-established the connection on its own.' =>
            '',
        'The connection has been re-established after a temporary connection loss. Due to this, elements on this page could have stopped to work correctly. In order to be able to use all elements correctly again, it is strongly recommended to reload this page.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerHeader.tt
        'Edit personal preferences' => 'Edit pilihan peribadi',
        'Personal preferences' => '',
        'Logout' => 'Log keluar',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerLogin.tt
        'JavaScript Not Available' => 'JavaScript idak disediakan',
        'In order to experience this software, you\'ll need to enable JavaScript in your browser.' =>
            '',
        'Browser Warning' => 'Amaran Browser',
        'The browser you are using is too old.' => 'Browser yang anda gunakan adalah terlalu lama.',
        'This software runs with a huge lists of browsers, please upgrade to one of these.' =>
            '',
        'Please see the documentation or ask your admin for further information.' =>
            'Sila lihat dokumentasi atau menanya kepada admin anda untuk maklumat lanjut.',
        'One moment please, you are being redirected...' => 'Sebentar, anda sedang diarahkan...',
        'Login' => 'Log masuk',
        'User name' => 'Nama pengguna',
        'Your user name' => 'Nama pengguna anda',
        'Your password' => 'Kata kunci anda',
        'Forgot password?' => 'Lupa kata kunci?',
        '2 Factor Token' => 'Token 2 Faktor',
        'Your 2 Factor Token' => 'Token 2 Faktor Anda',
        'Log In' => 'Log masuk',
        'Request New Password' => 'Mohon Kata Kunci Baru',
        'Your User Name' => 'Nama pengguna anda',
        'A new password will be sent to your email address.' => 'Kata kunci yang baru akan dihantar ke alamat emel anda.',
        'Back to login' => 'Kembali ke log masuk',
        'Create Account' => 'Buat akaun',
        'Please fill out this form to receive login credentials.' => 'Sila isi borang ini untuk menerima butiran log masuk.',
        'How we should address you' => 'Bagaimana harus kami memanggil anda?',
        'Your First Name' => 'Nama pertama anda',
        'Your Last Name' => 'Nama akhir anda',
        'Your email address (this will become your username)' => 'Alamat emel anda (ini akan menjadi nama pengguna anda)',
        'Not yet registered?' => 'Belum lagi mendaftar?',
        'Sign up now' => 'Daftar sekarang',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketMessage.tt
        'New Ticket' => 'Tiket Baru',
        'Service level agreement' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketOverview.tt
        'Welcome!' => 'Selamat datang!',
        'Please click the button below to create your first ticket.' => 'Sila tekan butang di bawah untuk membuat tiket pertama anda.',
        'Create your first ticket' => 'Buat tiket pertama anda',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketProcess.tt
        'New Process Ticket' => '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearch.tt
        'Profile' => 'Profil',
        'e. g. 10*5155 or 105658*' => 'contoj: 10*5155 atau 105658*',
        'CustomerID' => 'IDPelanggan',
        'Types' => 'Jenis',
        'Limitation' => '',
        'No time settings' => 'Tiada tetapan masa',
        'All' => 'Semua',
        'Specific date' => 'Tarikh spesifik',
        'Only tickets created' => 'Hanya tiket yang dibuat',
        'Date range' => 'Jarak tarikh',
        'Only tickets created between' => 'Hanya tiket yang dibuat diantara',
        'Ticket Archive System' => '',
        'Save Search as Template?' => '',
        'Save as Template' => 'Simpan sebagai templat',
        'Save as Template?' => 'Simpan sebagai templat?',
        'Template Name' => 'Nama templat',
        'Pick a profile name' => 'Pilih nama profil',
        'Output to' => 'Output kepada',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketSearchResultShort.tt
        'Remove this Search Term.' => 'Buang Istilah Carian ini.',
        'of' => 'daripada',
        'Page' => 'Halaman',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom.tt
        'Ticket Details' => '',
        'Next Steps' => 'Langkah Seterusnya',
        'Reply' => 'Balas',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerTicketZoom/ArticleRender/Chat.tt
        'Expand article' => 'Kembangkan artikel',

        # TT Template: Kernel/Output/HTML/Templates/Standard/CustomerWarning.tt
        'Warning' => 'Amaran',

        # TT Template: Kernel/Output/HTML/Templates/Standard/DashboardEventsTicketCalendar.tt
        'Event Information' => 'Informasi Acara',
        'Ticket fields' => 'Medan tiket',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Error.tt
        'Error Details' => 'Butiran kesilapan',
        'Expand' => 'Kembang',

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
        'You are logged in as' => 'Anda menlog masuk sebagai',
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
        'JavaScript not available' => 'JavaScript tidak disediakan',
        'License' => 'Lesen',
        'Database Settings' => 'Datenbankeinstellungen',
        'General Specifications and Mail Settings' => 'Spesifikasi Am dan Tetapan Mail',
        'Finish' => 'selesai',
        'Welcome to %s' => 'Selamat datang ke %s',
        'Address' => 'Alamat',
        'Phone' => 'Telefon',
        'Web site' => 'Laman web',
        'Community' => '',
        'Next' => 'Seterusnya',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerConfigureMail.tt
        'Configure Outbound Mail' => 'Konfigurasi penghantaran mel',
        'Outbound mail type' => 'Jenis e-mel keluar',
        'Select outbound mail type.' => 'Pilih jenis mel keluar',
        'Outbound mail port' => 'Port emel keluar',
        'Select outbound mail port.' => 'Pilih port emel keluar',
        'SMTP host' => 'Hos SMTP',
        'SMTP host.' => 'Hos SMTP.',
        'SMTP authentication' => 'Pengesahan SMTP',
        'Does your SMTP host need authentication?' => 'Adakah hos SMTP anda perlukan pengesahan?',
        'SMTP auth user' => 'pengguna SMTP yang disahkan',
        'Username for SMTP auth.' => 'Nama pengguna untuk pengesahan SMTP',
        'SMTP auth password' => 'Kata kunci pengesahan SMTP',
        'Password for SMTP auth.' => 'Kata kunci untuk pegesahan SMTP.',
        'Configure Inbound Mail' => 'Konfigurasi mel masuk',
        'Inbound mail type' => 'Jenis mel masuk',
        'Select inbound mail type.' => 'Pilih jenis mel masuk',
        'Inbound mail host' => 'Hos mel masuk',
        'Inbound mail host.' => 'Hos mel masuk.',
        'Inbound mail user' => 'Pengguna mel masuk',
        'User for inbound mail.' => 'Pengguna untuk mel masuk',
        'Inbound mail password' => 'Kata kunci mel masuk',
        'Password for inbound mail.' => 'Kata kunci untuk mel masuk.',
        'Result of mail configuration check' => 'Hasil untuk semakan konfigurasi mel',
        'Check mail configuration' => 'Semak konfigurasi mel',
        'or' => 'atau',
        'Skip this step' => 'Langkau langkah ini',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBResult.tt
        'Done' => 'Selesai',
        'Database setup successful!' => 'Penubuhan pangkalan data berjaya!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBStart.tt
        'Install Type' => 'Jenis Pemasangan',
        'Create a new database for Znuny' => 'Cipta pangkalan data baharu untuk Znuny',
        'Use an existing database for Znuny' => 'Guna pangkalan data sedia ada untuk Znuny',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmssql.tt
        'If you have set a root password for your database, it must be entered here. If not, leave this field empty.' =>
            'Jika anda menetapkan kata laluan root untuk pangkalan data anda, ia mesti dimasukkan di sini. Jika tidak, biarkan medan ini kosong.',
        'Database name' => 'Nama pangkalan data',
        'Check database settings' => 'Semak tetapan database',
        'Result of database check' => 'Hasil semakan database',
        'Database check successful.' => 'Semakan database berjaya.',
        'Database User' => 'Pengguna pangkalan data',
        'New' => 'Baru',
        'A new database user with limited permissions will be created for this Znuny system.' =>
            'Seorang pengguna pangkalan data baru dengan keistimewaan yang terhad dicipta pada sistem Znuny ini.',
        'Repeat Password' => 'Ulang kata Laluan',
        'Generated password' => 'Menghasilkan kata laluan',
        'Database' => 'Pangkalan data',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBmysql.tt
        'Passwords do not match' => 'Kata laluan tidak serasi',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerDBoracle.tt
        'SID' => 'SID',
        'Port' => 'Port',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerFinish.tt
        'To be able to use Znuny you have to enter the following line in your command line (Terminal/Shell) as root.' =>
            'Untuk menggunakan Znuny, mesti masukkan baris berikut sebagai root pada baris arahan (terminal / shell).',
        'Restart your webserver' => 'Mulakan semula webserver anda.',
        'After doing so your Znuny is up and running.' => 'Selepas berbuat demikian Znuny anda akan bersedia untuk dijalankan',
        'Start page' => 'Halaman mula',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerLicense.tt
        'Don\'t accept license' => 'Jangan menerima lesen',
        'Accept license and continue' => 'Menerima lesen dan meneruskan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/InstallerSystem.tt
        'SystemID' => 'IDSistem',
        'The identifier of the system. Each ticket number and each HTTP session ID contain this number.' =>
            'Pengecam sistem. Setiap nombor tiket dan setiap ID sesi HTTP, dan nombor.',
        'System FQDN' => 'Sistem FQDN',
        'Fully qualified domain name of your system.' => 'Nama domain sistem anda yang layak sepenuhnya.',
        'AdminEmail' => 'Emel Admin',
        'Email address of the system administrator.' => 'Alamat e-mel pentadbir sistem.',
        'Organization' => 'Organisasi',
        'Log' => 'Log',
        'LogModule' => 'log modul',
        'Log backend to use.' => 'Log backend untuk digunakan.',
        'LogFile' => 'Log Fail',
        'Webfrontend' => 'Webfrontend',
        'Default language' => 'Bahasa asal',
        'Default language.' => 'Bahasa asal.',
        'CheckMXRecord' => 'Semak MX-Records',
        'Email addresses that are manually entered are checked against the MX records found in DNS. Don\'t use this option if your DNS is slow or does not resolve public addresses.' =>
            'Alamat E-mel yang dinyatakan oleh pengguna diperiksa terhadap rekod MX dalam DNS. Gunakan pilihan ini jika DNS anda adalah lambat atau tidak boleh menyelesaikan alamat awam.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/LinkObject.tt
        'Delete link' => '',
        'Delete Link' => '',
        'Object#' => 'Objek#',
        'Add links' => 'Tambah pautan',
        'Delete links' => 'Padam pautan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Login.tt
        'Lost your password?' => 'Hilang kata kunci anda?',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MetaFloater.tt
        'Scale preview content' => 'Skala pandangan kandungan',
        'Open URL in new tab' => 'Buka URL dalam tab baru',
        'Close preview' => 'Tutup pratonton',
        'A preview of this website can\'t be provided because it didn\'t allow to be embedded.' =>
            'Satu pratonton untuk laman web ini tidak boleh diberikan kerana ia tidak membenarkan untuk dibenam.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/MobileNotAvailableWidget.tt
        'Feature not Available' => '',
        'Sorry, but this feature of Znuny is currently not available for mobile devices. If you\'d like to use it, you can either switch to desktop mode or use your regular desktop device.' =>
            'Maaf, ciri Znuny ini tidak tersedia pada masa sekarang untuk mod telefon bimbit. Jika anda ingin menggunakannya, anda boleh sama ada menukar ke mod komputer atau gunakan alat komputer biasa.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Motd.tt
        'Message of the Day' => 'Mesej untuk hari ini',
        'This is the message of the day. You can edit this in %s.' => 'Ini adalah mesej untuk hari ini. Anda boleh sunting dalam ini %s.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NoPermission.tt
        'Insufficient Rights' => 'Hak tidak mencukupi',
        'Back to the previous page' => 'Kembali ke halaman sebelumnya',

        # TT Template: Kernel/Output/HTML/Templates/Standard/NotificationEvent/Email/Alert.tt
        'Alert' => '',
        'Powered by' => 'Dikuasakan oleh',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Pagination.tt
        'Show first page' => 'Pamer halaman pertama',
        'Show previous pages' => 'Pamer halaman sebelumnya',
        'Show page %s' => 'Pamer halaman %s',
        'Show next pages' => 'Pamer halaman seterusnya',
        'Show last page' => 'Pamer halaman terakhir',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PictureUpload.tt
        'Need FormID!' => 'Perlu IDForm',
        'No file found!' => 'Tiada fail ditemui!',
        'The file is not an image that can be shown inline!' => 'Fail bukan imej yang boleh ditunjukkan sebaris!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PreferencesNotificationEvent.tt
        'No user configurable notifications found.' => 'Tiada pemberitahuan boleh dikonfigurasi pengguna dijumpai.',
        'Receive messages for notification \'%s\' by transport method \'%s\'.' =>
            'Terima mesej pemberitahuan \'%s\' dengan kaedah pengangkutan \'%s\'.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/ActivityDialogHeader.tt
        'Process Information' => 'Proses maklumat ',
        'Dialog' => 'Dialog',

        # TT Template: Kernel/Output/HTML/Templates/Standard/ProcessManagement/Article.tt
        'Inform Agent' => 'Memaklumkan Agen.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/PublicDefault.tt
        'Welcome' => 'Selamat datang',
        'This is the default public interface of Znuny! There was no action parameter given.' =>
            'Ini adalah antara muka awam lalai bagi Znuny! Tidak terdapat pada parameter yang diberikan.',
        'You could install a custom public module (via the package manager), for example the FAQ module, which has a public interface.' =>
            '',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAppointmentNotificationEvent.tt
        'To get the appointment attribute' => '',
        'e. g.' => 'cth.',
        'To get the first 20 character of the appointment title.' => '',
        'To get the calendar attribute' => '',
        'Attributes of the recipient user for the notification' => 'Sifat-sifat pengguna penerima bagi pemberitahuan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminAutoResponse.tt
        'To get the first 20 character of the subject.' => '20 aksara pertama subjek',
        'To get the first 5 lines of the email.' => 'Yang pertama lima baris mesej',
        'To get the name of the ticket\'s customer user (if given).' => 'Untuk mendapatkan nama tiket pengguna pelanggan (jika diberikan).',
        'To get the article attribute' => 'Atribut Seksyen',
        'Options of the current customer user data' => 'Atribut pelanggan semasa',
        'Ticket owner options' => 'Atribut memegang tiket',
        'Options of the ticket data' => 'Pilihan data tiket',
        'Options of ticket dynamic fields internal key values' => 'Pilihan tiket medan dinamik nilai utama dalaman',
        'Options of ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Pilihan tiket medan dinamik memaparkan nilai , berguna untuk medan kotak pilihan dan medan pelbagai pilihan ',

        # TT Template: Kernel/Output/HTML/Templates/Standard/SmartTags/AdminNotificationEvent.tt
        'To get the first 20 character of the subject (of the latest agent article).' =>
            'Untuk mendapatkan pertama 20 watak subjek (artikel ejen terbaru).',
        'To get the first 5 lines of the body (of the latest agent article).' =>
            'Untuk mendapatkan 5 baris pertama badan (artikel ejen terbaru).',
        'To get the first 20 character of the subject (of the latest customer article).' =>
            'Untuk mendapatkan pertama 20 watak subjek (artikel pelanggan terbaru)',
        'To get the first 5 lines of the body (of the latest customer article).' =>
            'Untuk mendapatkan 5 baris pertama badan (pelanggan artikel yang terbaru).',
        'Attributes of the current customer user data' => 'Sifat-sifat data pengguna semasa pelanggan',
        'Attributes of the current ticket owner user data' => 'Sifat-sifat data pengguna pemilik tiket semasa',
        'Attributes of the ticket data' => 'Sifat-sifat data tiket',
        'Ticket dynamic fields internal key values' => 'Tiket medan dinamik nilai utama dalaman',
        'Ticket dynamic fields display values, useful for Dropdown and Multiselect fields' =>
            'Tiket bidang dinamik memaparkan nilai, berguna untuk medan Turun ke bawah dan Pelbagai pilihan.',

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
        'Tag Reference' => 'Label Rujukan',
        'You can use the following tags' => 'Tag berikut boleh digunakan',
        'Ticket responsible options' => 'Atribut caj tiket',
        'Options of the current user who requested this action' => 'Pilihan pengguna semasa yang meminta tindakan ini',
        'Config options' => 'tetapan tatarajah',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/GeneralSpecificationsWidget.tt
        'You can select one or more groups to define access for different agents.' =>
            'Anda boleh memilih satu atau lebih kumpulan untuk menentukan akses untuk ejen yang berbeza.',
        'Result formats' => 'Format Keputusan',
        'Time Zone' => 'Zon Masa',
        'The selected time periods in the statistic are time zone neutral.' =>
            'Tempoh masa yang dipilih di dalam statistik ialah zon masa neutral.',
        'Create summation row' => 'Cipta baris penjumlahan',
        'Generate an additional row containing sums for all data rows.' =>
            'Menghasilkan baris tambahan yang mengandungi hasil tambah bagi semua barisan data.',
        'Create summation column' => 'Cipta lajur penjumlahan',
        'Generate an additional column containing sums for all data columns.' =>
            'Menghasilkan lajur tambahan yang mengandungi hasil tambah bagi semua lajuran data.',
        'Cache results' => 'Keputusan cache',
        'Stores statistics result data in a cache to be used in subsequent views with the same configuration (requires at least one selected time field).' =>
            '',
        'Provide the statistic as a widget that agents can activate in their dashboard.' =>
            'Sediakan statistik sebagai widget yang ejen boleh aktifkan pada papan pemuka mereka.',
        'Please note that enabling the dashboard widget will activate caching for this statistic in the dashboard.' =>
            'Sila ambil perhatian bahawa membolehkan widget papan pemuka akan mengaktifkan caching untuk statistik ini pada papan pemuka.',
        'If set to invalid end users can not generate the stat.' => 'Jika ditetapkan ke tidak sah, pengguna tidak boleh menjana stat',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/PreviewWidget.tt
        'There are problems in the configuration of this statistic:' => 'Terdapat masalah dalam konfigurasi statistik ini:',
        'You may now configure the X-axis of your statistic.' => 'Anda kini boleh mengkonfigurasi paksi-X statistik anda.',
        'This statistic does not provide preview data.' => 'Statistik ini tidak menyediakan data pratonton.',
        'Preview format' => '',
        'Please note that the preview uses random data and does not consider data filters.' =>
            'Sila ambil perhatian bahawa pratonton menggunakan data rawak dan tidak mengambil kira penapis data.',
        'Configure X-Axis' => 'Konfigurasi Paksi-X',
        'X-axis' => 'Paksi-X',
        'Configure Y-Axis' => 'Konfigurasi Paksi-Y',
        'Y-axis' => 'Paksi-Y',
        'Configure Filter' => 'Konfigurasi Tapisan',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/RestrictionsWidget.tt
        'Please select only one element or turn off the button \'Fixed\'.' =>
            'Sila pilih hanya satu elemen atau mematikan butang \'Tetap\'!',
        'Absolute period' => 'Tempoh mutlak',
        'Between %s and %s' => '',
        'Relative period' => 'Tempoh relatif',
        'The past complete %s and the current+upcoming complete %s %s' =>
            '%s lengkap lalu dan  %s %s semasa+lengkap akan datang',
        'Do not allow changes to this element when the statistic is generated.' =>
            'Tidak membenarkan perubahan kepada unsur ini apabila statistik dihasilkan .',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsParamsWidget.tt
        'Format' => 'Format',
        'Exchange Axis' => 'Paksi Pertukaran',
        'Configurable Params of Static Stat' => '',
        'No element selected.' => 'Tiada unsur yang dipilih.',
        'Scale' => 'Skala',
        'show more' => 'tunjuk lebih',
        'show less' => 'tunjuk kurang',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/StatsResultRender/D3.tt
        'Download SVG' => 'Muat turun SVG',
        'Download PNG' => 'Muat turun PNG',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/XAxisWidget.tt
        'The selected time period defines the default time frame for this statistic to collect data from.' =>
            'Tempoh masa yang dipilih mendefinisikan tempoh masa default untuk statistik ini untuk mengumpul data daripada.',
        'Defines the time unit that will be used to split the selected time period into reporting data points.' =>
            'Mentakrifkan unit masa yang akan digunakan untuk memisahkan tempoh masa yang dipilih ke dalam melaporkan titik data.',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Statistics/YAxisWidget.tt
        'Please remember that the scale for the Y-axis has to be larger than the scale for the X-axis (e.g. X-axis => Month, Y-Axis => Year).' =>
            'Sila ingat bahawa skala bagi paksi-Y telah menjadi lebih besar daripada skala untuk paksi-X (contoh: paksi-X => Bulan, paksi-Y => Tahun).',

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
        'Znuny Test Page' => 'Halaman percubaan Znuny',
        'Unlock' => 'Membuka',
        'Welcome %s %s' => 'Selamat datang %s %s',
        'Counter' => 'Kaunter',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Ticket/TimeUnits.tt
        'Invalid time!' => 'Masa Tidak Sah!',

        # TT Template: Kernel/Output/HTML/Templates/Standard/Warning.tt
        'Go back to the previous page' => 'Kembali ke halaman sebelumnya',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/FormDraftAddDialog.html.tmpl
        'Draft title' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/ArticleViewSettingsDialog.html.tmpl
        'Article display' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl
        'Do you really want to delete "%s"?' => '',
        'Confirm' => 'Sah',

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
        'Finished' => 'Ditamatkan',
        'Unknown' => 'Tidak diketahui',
        'No package information available.' => '',

        # JS Template: Kernel/Output/JavaScript/Templates/Standard/SysConfig/AddButton.html.tmpl
        'Add new entry' => 'Tambah kemasukan baru',

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
        'CustomerIDs' => 'IDPelanggan',
        'Fax' => 'Faks',
        'Street' => 'Jalan',
        'Zip' => 'Poskod',
        'City' => 'Bandar',
        'Country' => 'Negara',
        'Valid' => 'Sah',
        'Mr.' => 'Encik',
        'Mrs.' => 'Puan',
        'View system log messages.' => 'Melihat mesej log sistem.',
        'Edit the system configuration settings.' => 'Mengaudit aturan konfigurasi sistem',
        'Update and extend your system with software packages.' => 'Naik taraf dan kembangkan sistem anda dengan pakej perisian.',

        # Perl Module: Kernel/Modules/AdminACL.pm
        'ACL information from database is not in sync with the system configuration, please deploy all ACLs.' =>
            'Maklumat ACL dari pangkalan data tidak selari dengan konfigurasi sistem , sila gunakan semua ACL.',
        'ACLs could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            'ACLs tidak boleh diimport kerana kesalahan yang tidak dapat dikenalpasti, sila semak log Znuny untuk maklumat lanjut',
        'The following ACLs have been added successfully: %s' => 'ACL yang berikut telah ditambah dengan jayanya: %s',
        'The following ACLs have been updated successfully: %s' => 'ACL yang berikut telah dikemaskini dengan jayanya: %s',
        'There where errors adding/updating the following ACLs: %s. Please check the log file for more information.' =>
            '',
        'This field is required' => 'Bidang ini diperlukan',
        'There was an error creating the ACL' => 'Terdapat kesalahan mencipta ACL tersebut',
        'Need ACLID!' => 'Perlukan ACLID!',
        'Could not get data for ACLID %s' => 'Tidak boleh mendapatkan data untuk ACLID %s',
        'There was an error updating the ACL' => 'Terdapat kesalahan mengemaskini ACL tersebut',
        'There was an error setting the entity sync status.' => 'Terdapat kesalahan pada tetapan status entiti selari.',
        'There was an error synchronizing the ACLs.' => '',
        'ACL %s could not be deleted' => 'ACL %s tidak boleh dipadam',
        'There was an error getting data for ACL with ID %s' => 'Terdapat kesalahan mendapatkan data ACL dengan ID %s',
        '%s (copy) %s' => '',
        'Please note that ACL restrictions will be ignored for the Superuser account (UserID 1).' =>
            '',
        'Exact match' => 'Padanan tepat',
        'Negated exact match' => 'Menafikan padanan tepat',
        'Regular expression' => 'Ekspressi biasa',
        'Regular expression (ignore case)' => '',
        'Negated regular expression' => 'Menafikan pernyataan biasa',
        'Negated regular expression (ignore case)' => 'Menafikan pernyataan biasa (abaikan kes)',

        # Perl Module: Kernel/Modules/AdminAppointmentCalendarManage.pm
        'System was unable to create Calendar!' => '',
        'Please contact the administrator.' => '',
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
        'Notification added!' => '',
        'There was an error getting data for Notification with ID:%s!' =>
            '',
        'Unknown Notification %s!' => '',
        '%s (copy)' => '',
        'There was an error creating the Notification' => '',
        'Notifications could not be Imported due to a unknown error, please check Znuny logs for more information' =>
            '',
        'The following Notifications have been added successfully: %s' =>
            '',
        'The following Notifications have been updated successfully: %s' =>
            '',
        'There where errors adding/updating the following Notifications: %s. Please check the log file for more information.' =>
            '',
        'Notification updated!' => '',
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
        'Failed' => 'Gagal',
        'Invalid Filter: %s!' => '',
        'Less than a second' => '',
        'sorted descending' => '',
        'sorted ascending' => '',
        'Trace' => '',
        'Debug' => '',
        'Info' => 'Info',
        'Warn' => '',
        'days' => 'beberapa hari',
        'day' => 'hari',
        'hour' => 'jam',
        'minute' => 'minit',
        'seconds' => 'beberapa saat',
        'second' => 'saat',

        # Perl Module: Kernel/Modules/AdminCustomerCompany.pm
        'Customer company updated!' => 'Syarikat pelanggan dikemaskini!',
        'Dynamic field %s not found!' => '',
        'Unable to set value for dynamic field %s!' => '',
        'Customer Company %s already exists!' => 'Syarikat Pengguna %s telah wujud!',
        'Customer company added!' => 'Syarikat pelanggan ditambah!',

        # Perl Module: Kernel/Modules/AdminCustomerGroup.pm
        'No configuration for \'CustomerGroupPermissionContext\' found!' =>
            '',
        'Please check system configuration.' => '',
        'Invalid permission context configuration:' => '',

        # Perl Module: Kernel/Modules/AdminCustomerUser.pm
        'Customer updated!' => 'Pelanggan dikemaskini!',
        'New phone ticket' => 'Tiket telefon baru',
        'New email ticket' => 'Tiket emel baru',
        'Customer %s added' => 'Pelanggan %s ditambah',
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
        'Fields configuration is not valid' => 'Konfigurasi bidang-bidang tidak layak',
        'Objects configuration is not valid' => 'Konfigurasi objek-objek tidak layak',
        'Could not reset Dynamic Field order properly, please check the error log for more details.' =>
            'Tidak boleh membetulkan semula susunan Bidang Dinamik dengan elok, sila semak log kesalahan untuk maklumat lanjut.',

        # Perl Module: Kernel/Modules/AdminDynamicFieldCheckbox.pm
        'Undefined subaction.' => 'Tindakan bawah tidak tertakrif',
        'Need %s' => 'Perlukan %s',
        'Add %s field' => '',
        'The field does not contain only ASCII letters and numbers.' => '',
        'There is another field with the same name.' => 'Terdapat ruang yang lain dengan nama yang sama.',
        'The field must be numeric.' => 'Ruang tersebut perlu jadi numerik',
        'Need ValidID' => 'Perlukan ValidID',
        'Could not create the new field' => 'Tidak boleh cipta ruang baru',
        'Need ID' => 'Perlukan ID',
        'Could not get data for dynamic field %s' => 'Tidak boleh mendapatkan data untuk ruang dinamik %s',
        'Change %s field' => '',
        'The name for this field should not change.' => 'Nama untuk ruang tidak patut ditukar.',
        'Could not update the field %s' => 'Tidak dapat mengemaskini ruang tersebut %s',
        'Currently' => 'Buat masa sekarang',
        'Unchecked' => 'Tidak disemak',
        'Checked' => 'Disemak',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDateTime.pm
        'Prevent entry of dates in the future' => 'Menghalang tarikh entri pada masa akan datang',
        'Prevent entry of dates in the past' => 'Menghalang tarikh entri pada masa lalu',

        # Perl Module: Kernel/Modules/AdminDynamicFieldDropdown.pm
        'This field value is duplicated.' => 'Nilai ruang ini diduplikasi.',

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
        'Select at least one recipient.' => 'Pilih sekurang-kurangnya satu penerima.',

        # Perl Module: Kernel/Modules/AdminGenericAgent.pm
        'minute(s)' => 'minit(beberapa)',
        'hour(s)' => 'jam(beberapa)',
        'Time unit' => 'Unit masa',
        'within the last ...' => 'dalam lingkungan lepas',
        'within the next ...' => 'dalam lingkungan seterusnya',
        'more than ... ago' => 'lebih daripada ... lepas',
        'Unarchived tickets' => 'Mengeluarkan tiket',
        'archive tickets' => 'Tiket-tiket arkib',
        'restore tickets from archive' => 'mengembalikan tiket-tiket dari arkib',
        'Need Profile!' => 'Perlukan Profil!',
        'Got no values to check.' => 'Tiada terdapat nilai untuk disemak.',
        'Please remove the following words because they cannot be used for the ticket selection:' =>
            'Sila keluarkan perkataan yang berikut kerana ia tidak boleh digunakan untuk pemilihan tiket:',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceDebugger.pm
        'Need WebserviceID!' => 'Perlukan IDServisWeb!',
        'Could not get data for WebserviceID %s' => '',
        'ascending' => 'Menaik',
        'descending' => 'Menurun',

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
        '10 minutes' => '10 Minit',
        '15 minutes' => '15 Minit',
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
        'Could not determine config for invoker %s' => '',
        'InvokerType %s is not registered' => '',
        'MappingType %s is not registered' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceInvokerEvent.pm
        'Need Invoker!' => '',
        'Need Event!' => '',
        'Could not get registered modules for Invoker' => '',
        'Could not get backend for Invoker %s' => '',
        'The event %s is not valid.' => '',
        'Could not update configuration data for WebserviceID %s' => '',
        'This sub-action is not valid' => '',
        'xor' => '',
        'String' => '',
        'Regexp' => '',
        'Validation Module' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingSimple.pm
        'Simple Mapping for Outgoing Data' => '',
        'Simple Mapping for Incoming Data' => '',
        'Could not get registered configuration for action type %s' => '',
        'Could not get backend for %s %s' => '',
        'Keep (leave unchanged)' => '',
        'Ignore (drop key/value pair)' => '',
        'Map to (use provided value as default)' => '',
        'Exact value(s)' => '',
        'Ignore (drop Value/value pair)' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceMappingXSLT.pm
        'XSLT Mapping for Outgoing Data' => '',
        'XSLT Mapping for Incoming Data' => '',
        'Could not find required library %s' => '',
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
        'Could not determine config for operation %s' => '',
        'OperationType %s is not registered' => '',

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
        'There is another web service with the same name.' => '',
        'There was an error updating the web service.' => '',
        'There was an error creating the web service.' => '',
        'Web service "%s" created!' => 'Perkhidmatan web "%s" dicipta!',
        'Need Name!' => '',
        'Need ExampleWebService!' => '',
        'Could not load %s.' => '',
        'Could not read %s!' => '',
        'Need a file to import!' => '',
        'The imported file has not valid YAML content! Please check Znuny log for details' =>
            '',
        'Web service "%s" deleted!' => 'Perkhidmatan web "%s" dipadam!',
        'Znuny as provider' => 'Znuny sebagai pembekal',
        'Operations' => 'Operasi',
        'Znuny as requester' => 'Znuny sebagai peminta',
        'Invokers' => '',

        # Perl Module: Kernel/Modules/AdminGenericInterfaceWebserviceHistory.pm
        'Got no WebserviceHistoryID!' => '',
        'Could not get history data for WebserviceHistoryID %s' => '',

        # Perl Module: Kernel/Modules/AdminGroup.pm
        'Group updated!' => 'Kumpulan dikemaskini',

        # Perl Module: Kernel/Modules/AdminMailAccount.pm
        'Mail account added!' => 'Akaun emel ditambah!',
        'Email account fetch already fetched by another process. Please try again later!' =>
            '',
        'Dispatching by email To: field.' => 'Menghantar oleh emel kepada: bidang.',
        'Dispatching by selected Queue.' => 'Menghantar oleh Barisan dipilih.',

        # Perl Module: Kernel/Modules/AdminNotificationEvent.pm
        'Agent who created the ticket' => '',
        'Agent who owns the ticket' => 'Agen yang memiliki tiket',
        'Agent who is responsible for the ticket' => 'Agen yang bertanggungjawab ke atas tiket',
        'All agents watching the ticket' => 'Semua agen memerhatikan tiket',
        'All agents with write permission for the ticket' => 'Semua agen dengan kebenaran menulis ke atas tiket',
        'All agents subscribed to the ticket\'s queue' => 'Semua agen yang melanggan barisan tiket',
        'All agents subscribed to the ticket\'s service' => 'Semua agen yang melanggan perkhidmatan tiket',
        'All agents subscribed to both the ticket\'s queue and service' =>
            'Semua agen yang melanggan perkhidmatan dan barisan tiket',
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
            '',
        'Need param Key to delete!' => '',
        'Key %s deleted!' => '',
        'Need param Key to download!' => '',

        # Perl Module: Kernel/Modules/AdminPackageManager.pm
        'Sorry, Apache::Reload is needed as PerlModule and PerlInitHandler in Apache config file. See also scripts/apache2-httpd.include.conf. Alternatively, you can use the command line tool bin/znuny.Console.pl to install packages!' =>
            '',
        'No such package!' => '',
        'No such file %s in package!' => '',
        'No such file %s in local file system!' => '',
        'Can\'t read %s!' => '',
        'Package has locally modified files.' => '',
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
        'No such filter: %s' => '',

        # Perl Module: Kernel/Modules/AdminPriority.pm
        'Priority added!' => 'Keutamaan ditambah!',

        # Perl Module: Kernel/Modules/AdminProcessManagement.pm
        'Process Management information from database is not in sync with the system configuration, please synchronize all processes.' =>
            'Maklumat Pengurusan Proses dari pangkalan data tidak selari dengan konfigurasi sistem, sila selaraskan semua proses.',
        'Need ExampleProcesses!' => '',
        'Need ProcessID!' => '',
        'Yes (mandatory)' => '',
        'Unknown Process %s!' => '',
        'There was an error generating a new EntityID for this Process' =>
            '',
        'The StateEntityID for state Inactive does not exists' => '',
        'There was an error creating the Process' => '',
        'There was an error setting the entity sync status for Process entity: %s' =>
            '',
        'Could not get data for ProcessID %s' => '',
        'There was an error updating the Process' => '',
        'Process: %s could not be deleted' => '',
        'There was an error synchronizing the processes.' => '',
        'The %s:%s is still in use' => '',
        'The %s:%s has a different EntityID' => '',
        'Could not delete %s:%s' => '',
        'There was an error setting the entity sync status for %s entity: %s' =>
            '',
        'Could not get %s' => '',
        'Need %s!' => '',
        'Process: %s is not Inactive' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivity.pm
        'There was an error generating a new EntityID for this Activity' =>
            '',
        'There was an error creating the Activity' => '',
        'There was an error setting the entity sync status for Activity entity: %s' =>
            '',
        'Need ActivityID!' => '',
        'Could not get data for ActivityID %s' => '',
        'There was an error updating the Activity' => '',
        'Missing Parameter: Need Activity and ActivityDialog!' => '',
        'Activity not found!' => '',
        'ActivityDialog not found!' => '',
        'ActivityDialog already assigned to Activity. You cannot add an ActivityDialog twice!' =>
            '',
        'Error while saving the Activity to the database!' => '',
        'This subaction is not valid' => '',
        'Edit Activity "%s"' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementActivityDialog.pm
        'There was an error generating a new EntityID for this ActivityDialog' =>
            '',
        'There was an error creating the ActivityDialog' => '',
        'There was an error setting the entity sync status for ActivityDialog entity: %s' =>
            '',
        'Need ActivityDialogID!' => '',
        'Could not get data for ActivityDialogID %s' => '',
        'There was an error updating the ActivityDialog' => '',
        'Edit Activity Dialog "%s"' => '',
        'Agent Interface' => '',
        'Customer Interface' => '',
        'Agent and Customer Interface' => '',
        'Do not show Field' => '',
        'Show Field' => '',
        'Show Field As Mandatory' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementPath.pm
        'Edit Path' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransition.pm
        'There was an error generating a new EntityID for this Transition' =>
            '',
        'There was an error creating the Transition' => '',
        'There was an error setting the entity sync status for Transition entity: %s' =>
            '',
        'Need TransitionID!' => '',
        'Could not get data for TransitionID %s' => '',
        'There was an error updating the Transition' => '',
        'Edit Transition "%s"' => '',

        # Perl Module: Kernel/Modules/AdminProcessManagementTransitionAction.pm
        'At least one valid config parameter is required.' => '',
        'There was an error generating a new EntityID for this TransitionAction' =>
            '',
        'There was an error creating the TransitionAction' => '',
        'There was an error setting the entity sync status for TransitionAction entity: %s' =>
            '',
        'Need TransitionActionID!' => '',
        'Could not get data for TransitionActionID %s' => '',
        'There was an error updating the TransitionAction' => '',
        'Edit Transition Action "%s"' => '',
        'Error: Not all keys seem to have values or vice versa.' => '',

        # Perl Module: Kernel/Modules/AdminQueue.pm
        'Queue updated!' => 'Barisan dikemaskini!',
        'Don\'t use :: in queue name!' => '',
        'Click back and change it!' => '',
        '-none-' => '-tiada-',

        # Perl Module: Kernel/Modules/AdminQueueAutoResponse.pm
        'Queues ( without auto responses )' => '',

        # Perl Module: Kernel/Modules/AdminQueueTemplates.pm
        'Change Queue Relations for Template' => 'Tukar Giliran Perhubungan untuk Templat',
        'Change Template Relations for Queue' => 'Tukar Perkaitan Templat untuk Barisan',

        # Perl Module: Kernel/Modules/AdminRole.pm
        'Role updated!' => 'watak dikemaskini!',
        'Role added!' => 'Watak ditambah!',

        # Perl Module: Kernel/Modules/AdminRoleGroup.pm
        'Change Group Relations for Role' => 'Tukar Perhubungan Kumpulan bagi Peranan',
        'Change Role Relations for Group' => 'Perubahan Peranan Perhubungan bagi Kumpulan',

        # Perl Module: Kernel/Modules/AdminRoleUser.pm
        'Role' => '',
        'Change Role Relations for Agent' => 'Perubahan Peranan Perhubungan untuk Agen',
        'Change Agent Relations for Role' => 'Tukar Perhubungan Agen untuk Peranan',

        # Perl Module: Kernel/Modules/AdminSLA.pm
        'Please activate %s first!' => 'Sila aktifkan %s dahulu.',

        # Perl Module: Kernel/Modules/AdminSMIME.pm
        'S/MIME environment is not working. Please check log for more info!' =>
            '',
        'Need param Filename to delete!' => '',
        'Need param Filename to download!' => '',
        'Needed CertFingerprint and CAFingerprint!' => '',
        'CAFingerprint must be different than CertFingerprint' => '',
        'Relation exists!' => '',
        'Relation added!' => '',
        'Impossible to add relation!' => '',
        'Relation doesn\'t exists' => '',
        'Relation deleted!' => '',
        'Impossible to delete relation!' => '',
        'Certificate %s could not be read!' => '',
        'Handle Private Certificate Relations' => '',

        # Perl Module: Kernel/Modules/AdminSalutation.pm
        'Salutation added!' => '',

        # Perl Module: Kernel/Modules/AdminSignature.pm
        'Signature updated!' => 'Tandatangan dikemaskini!',
        'Signature added!' => 'Tandatangan ditambah!',

        # Perl Module: Kernel/Modules/AdminState.pm
        'State added!' => 'Keadaan ditambah!',

        # Perl Module: Kernel/Modules/AdminSupportDataCollector.pm
        'File %s could not be read!' => '',

        # Perl Module: Kernel/Modules/AdminSystemAddress.pm
        'System e-mail address added!' => 'Alamat sistem emel ditambah!',

        # Perl Module: Kernel/Modules/AdminSystemConfiguration.pm
        'Invalid Settings' => '',
        'There are no invalid settings active at this time.' => '',
        'You currently don\'t have any favourite settings.' => '',
        'The following settings could not be found: %s' => '',
        'Import not allowed!' => '',
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
        'Template updated!' => '',

        # Perl Module: Kernel/Modules/AdminTemplateAttachment.pm
        'Change Attachment Relations for Template' => 'Tukar Perhubungan Lampiran untuk Templat',
        'Change Template Relations for Attachment' => 'Tukar Perkaitan Templat untuk Lampiran',

        # Perl Module: Kernel/Modules/AdminType.pm
        'Need Type!' => '',
        'Type added!' => 'Jenis ditambah!',

        # Perl Module: Kernel/Modules/AdminUser.pm
        'Agent updated!' => 'Ejen dikemaskini!',

        # Perl Module: Kernel/Modules/AdminUserGroup.pm
        'Change Group Relations for Agent' => 'Tukar Kumpulan Perhubungan untuk Ejen',
        'Change Agent Relations for Group' => 'Tukar Perhubungan Agen untuk Kumpulan',

        # Perl Module: Kernel/Modules/AgentAppointmentAgendaOverview.pm
        'Month' => 'Bulan',
        'Week' => '',
        'Day' => 'Hari',

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
        'Customer History' => 'Sejarah pelanggan',

        # Perl Module: Kernel/Modules/AgentCustomerUserAddressBook.pm
        'No RecipientField is given!' => '',

        # Perl Module: Kernel/Modules/AgentDashboardCommon.pm
        'No such config for %s' => '',
        'Statistic' => 'Statistik',
        'No preferences for %s!' => '',
        'Can\'t get element data of %s!' => '',
        'Can\'t get filter content data of %s!' => '',
        'Customer Name' => '',

        # Perl Module: Kernel/Modules/AgentLinkObject.pm
        'Need SourceObject and SourceKey!' => '',
        'You need ro permission!' => '',
        'Can not delete link with %s!' => 'Tidak boleh memadam pautan dengan %s!',
        '%s Link(s) deleted successfully.' => '',
        'Can not create link with %s! Object already linked as %s.' => '',
        'Can not create link with %s!' => 'Tidak boleh mencipta pautan dengan %s!',
        '%s links added successfully.' => '',
        'The object %s cannot link with other object!' => '',

        # Perl Module: Kernel/Modules/AgentPreferences.pm
        'Param Group is required!' => '',

        # Perl Module: Kernel/Modules/AgentSplitSelection.pm
        'Process ticket' => '',

        # Perl Module: Kernel/Modules/AgentStatistics.pm
        'Parameter %s is missing.' => '',
        'Invalid Subaction.' => '',
        'Statistic could not be imported.' => 'Statistik tidak boleh diimport.',
        'Please upload a valid statistic file.' => 'Sila muat naik fail statistik yang sah.',
        'Export: Need StatID!' => '',
        'Delete: Get no StatID!' => '',
        'Need StatID!' => '',
        'Could not load stat.' => '',
        'Add New Statistic' => 'Tambah Statistik Baru',
        'Could not create statistic.' => '',
        'Run: Get no %s!' => '',

        # Perl Module: Kernel/Modules/AgentTicketActionCommon.pm
        'No TicketID is given!' => '',
        'You need %s permissions!' => '',
        'Loading draft failed!' => '',
        'Sorry, you need to be the ticket owner to perform this action.' =>
            'Maaf, anda perlu menjadi pemilik tiket untuk melaksanakan tindakan ini.',
        'Please change the owner first.' => 'Sila tukar pemilik dahulu.',
        'FormDraft functionality disabled!' => '',
        'Draft name is required!' => '',
        'FormDraft name %s is already in use!' => '',
        'Could not perform validation on field %s!' => '',
        'No subject' => 'Tiada subjek',
        'Could not delete draft!' => '',
        'Previous Owner' => 'Pemilik sebelumnya',
        'wrote' => 'menulis',
        'Message from' => 'Mesej daripada',
        'End message' => 'Akhir mesej',

        # Perl Module: Kernel/Modules/AgentTicketBounce.pm
        '%s is needed!' => '',
        'Plain article not found for article %s!' => '',
        'Article does not belong to ticket %s!' => '',
        'Can\'t bounce email!' => '',
        'Can\'t send email!' => '',
        'Wrong Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketBulk.pm
        'Can\'t lock Tickets, no TicketIDs are given!' => '',
        'Ticket (%s) is not unlocked!' => '',
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
        'Address %s replaced with registered customer address.' => 'Alamat %s digantikan dengan alamat pelanggan yang didaftar.',
        'Customer user automatically added in Cc.' => 'Pengguna pelanggan ditambah secara automatik ke dalam Cc.',

        # Perl Module: Kernel/Modules/AgentTicketEmail.pm
        'Ticket "%s" created!' => 'Tiket "%s" dicipta!',
        'No Subaction!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmailOutbound.pm
        'Got no TicketID!' => '',
        'System Error!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEmailResend.pm
        'No ArticleID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketEscalationView.pm
        'Next week' => 'Minggu Hadapan',
        'Ticket Escalation View' => 'Lihat Peningkatan Tiket',

        # Perl Module: Kernel/Modules/AgentTicketForward.pm
        'Article %s could not be found!' => '',
        'Forwarded message from' => 'Mesej dikemukan daripada',
        'End forwarded message' => 'Mesej akhir dikemukan',

        # Perl Module: Kernel/Modules/AgentTicketHistory.pm
        'Can\'t show history, no TicketID is given!' => '',

        # Perl Module: Kernel/Modules/AgentTicketLock.pm
        'Can\'t lock Ticket, no TicketID is given!' => '',
        'Sorry, the current owner is %s!' => '',
        'Please become the owner first.' => '',
        'Ticket (ID=%s) is locked by %s!' => '',
        'Change the owner!' => '',

        # Perl Module: Kernel/Modules/AgentTicketLockedView.pm
        'New Article' => 'Artikel Baru',
        'Pending' => 'Tergantung',
        'Reminder Reached' => 'Peringatan Disampaikan',
        'My Locked Tickets' => 'Tiket Kunci Saya',

        # Perl Module: Kernel/Modules/AgentTicketMentionView.pm
        'New mention' => '',
        'My Mentions' => '',

        # Perl Module: Kernel/Modules/AgentTicketMerge.pm
        'Can\'t merge ticket with itself!' => '',

        # Perl Module: Kernel/Modules/AgentTicketMove.pm
        'You need move permissions!' => '',

        # Perl Module: Kernel/Modules/AgentTicketPhoneCommon.pm
        'Ticket locked.' => 'Tiket dikunci.',

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
        'The selected process is invalid!' => 'Proses yang dipilih tidak sah.',
        'Process %s is invalid!' => '',
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
        'Pending Date' => 'Tarikh penangguhan',
        'for pending* states' => 'Untuk status tertangguh',
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
        'Available tickets' => 'Tiket disediakan',
        'including subqueues' => 'termasuk subjujukan',
        'excluding subqueues' => 'tidak termasuk subjujukan',
        'QueueView' => 'Lihat-Barisan',

        # Perl Module: Kernel/Modules/AgentTicketResponsibleView.pm
        'My Responsible Tickets' => 'Tiket Tanggungjawab saya',

        # Perl Module: Kernel/Modules/AgentTicketSearch.pm
        'last-search' => 'Carian-akhir',
        'Untitled' => '',
        'Ticket Number' => 'Nombor Tiket',
        'Ticket' => 'Tiket',
        'printed by' => 'dicetak oleh',
        'CustomerID (complex search)' => '',
        'CustomerID (exact match)' => 'IDPelanggan (padanan tepat)',
        'Invalid Users' => 'Pengguna Tidak Sah',
        'Normal' => 'Normal',
        'CSV' => '',
        'Excel' => '',
        'in more than ...' => 'dalam lebih daripada',

        # Perl Module: Kernel/Modules/AgentTicketService.pm
        'Feature not enabled!' => '',
        'Service View' => 'Lihat Perkhidmatan ',

        # Perl Module: Kernel/Modules/AgentTicketStatusView.pm
        'Status View' => 'Lihat Status',

        # Perl Module: Kernel/Modules/AgentTicketWatchView.pm
        'My Watched Tickets' => 'Tiket yang diperhati saya',

        # Perl Module: Kernel/Modules/AgentTicketWatcher.pm
        'Feature is not active' => '',

        # Perl Module: Kernel/Modules/AgentTicketZoom.pm
        'This ticket does not exist, or you don\'t have permissions to access it in its current state.' =>
            '',
        'Missing FormDraftID!' => '',
        'Can\'t get for ArticleID %s!' => '',
        'Article filter settings were saved.' => '',
        'Event type filter settings were saved.' => '',
        'Need ArticleID!' => '',
        'Invalid ArticleID!' => '',
        'Forward article via mail' => 'Kehadapankan artikel melalui mel',
        'Forward' => 'Kehadapan',
        'Fields with no group' => 'Medan tanpa kumpulan',
        'Invisible only' => '',
        'Visible only' => '',
        'Visible and invisible' => '',
        'Article could not be opened! Perhaps it is on another article page?' =>
            'Artikel tidak dapat dibuka! Mungkinkah ia berada dalam muka surat artikel lain?',
        'Show one article' => 'Tunjukkan satu artikel',
        'Show all articles' => 'Tunjukkan kesemua artikel',

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
        'My Tickets' => 'Tiket Saya',
        'Company Tickets' => 'Tiket Syarikat',
        'Untitled!' => '',

        # Perl Module: Kernel/Modules/CustomerTicketSearch.pm
        'Customer Realname' => 'Nama sebenar pelanggan',
        'Created within the last' => 'Diwujudkan dalam lingkungan lepas ',
        'Created more than ... ago' => 'Diwujudkan lebih daripada ... lepas',
        'Please remove the following words because they cannot be used for the search:' =>
            'Sila keluarkan perkataan yang berikut kerana mereka tidak boleh digunakan untuk carian:',

        # Perl Module: Kernel/Modules/CustomerTicketZoom.pm
        'Can\'t reopen ticket, not possible in this queue!' => '',
        'Create a new ticket!' => '',

        # Perl Module: Kernel/Modules/Installer.pm
        'SecureMode active!' => '',
        'If you want to re-run the Installer, disable the SecureMode in the SysConfig.' =>
            '',
        'Directory "%s" doesn\'t exist!' => '',
        'Configure "Home" in Kernel/Config.pm first!' => '',
        'File "%s/Kernel/Config.pm" not found!' => '',
        'Directory "%s" not found!' => '',
        'Install Znuny' => 'Memasang Znuny',
        'Intro' => 'Permulaan',
        'Kernel/Config.pm isn\'t writable!' => '',
        'If you want to use the installer, set the Kernel/Config.pm writable for the webserver user!' =>
            '',
        'Database Selection' => 'Pilihan pangkalan data',
        'Unknown Check!' => '',
        'The check "%s" doesn\'t exist!' => '',
        'Enter the password for the database user.' => 'Masukkan kata laluan untuk pengguna pangkalan data.',
        'Database %s' => '',
        'Configure MySQL' => '',
        'Enter the password for the administrative database user.' => 'Masukkan kata laluan untuk pengguna pangkalan data pentadbiran.',
        'Configure PostgreSQL' => '',
        'Configure Oracle' => '',
        'Unknown database type "%s".' => '',
        'Please go back.' => '',
        'Create Database' => 'Mencipta pangkalan data',
        'Install Znuny - Error' => '',
        'File "%s/%s.xml" not found!' => '',
        'Contact your Admin!' => '',
        'System Settings' => 'Pengaturan sistem',
        'Syslog' => '',
        'Configure Mail' => 'Konfigurasi emel',
        'Mail Configuration' => 'Konfigurasi mel',
        'Can\'t write Config file!' => '',
        'Unknown Subaction %s!' => '',
        'Can\'t connect to database, Perl module DBD::%s not installed!' =>
            '',
        'Can\'t connect to database, read comment!' => '',
        'Database already contains data - it should be empty!' => 'Pangkalan data sudah mempunyai data - ia sepatutnya kosong!',
        'Error: You have the wrong database version installed (%s). You need at least version %s! ' =>
            '',
        'Error: Please make sure your database accepts packages over %s MB in size (it currently only accepts packages up to %s MB). Please adapt the max_allowed_packet setting of your database in order to avoid errors.' =>
            'Ralat: Sila pastikan pangkalan data anda menerima pakej melebihi saiz %s MB (buat masa ini ia hanya menerima pakej sehingga %s MB). Sila sesuaikan tetapan max_paket_dibenarkan pada pangkalan data anda agar tidak terdapat ralat.',
        'Error: Please set the value for innodb_log_file_size on your database to at least %s MB (current: %s MB, recommended: %s MB). For more information, please have a look at %s.' =>
            'Ralat: Sila tetapkan nilai untuk innodb_log_file_size pada pangkalan data anda kepada sekurang-kurangnya %s MB ( semasa: %s MB, disyorkan: %s MB) . Untuk maklumat lanjut, sila lihat di %s.',
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
        'Authentication failed from %s!' => '',

        # Perl Module: Kernel/Output/HTML/Article/Chat.pm
        'Chat' => 'Sembang',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketBounce.pm
        'Bounce Article to a different mail address' => 'Lantun Artikel pada alamat emel berbeza.',
        'Bounce' => 'Lantun',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketCompose.pm
        'Reply All' => 'Balas semua',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketEmailResend.pm
        'Resend this article' => '',
        'Resend' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketMessageLog.pm
        'View message log details for this article' => '',
        'Message Log' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNote.pm
        'Reply to note' => 'Balas pada nota',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketNoteToLinkedTicket.pm
        'Create notice for linked ticket' => '',
        'Transfer notice' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPhone.pm
        'Split this article' => 'Pisahkan artikel ini',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPlain.pm
        'View the source for this Article' => '',
        'Plain Format' => 'Format kosong',

        # Perl Module: Kernel/Output/HTML/ArticleAction/AgentTicketPrint.pm
        'Print this article' => 'Cetak tiket ini',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkArticleSeenUnseen.pm
        'Mark article as unseen' => '',
        'Mark as unseen' => '',

        # Perl Module: Kernel/Output/HTML/ArticleAction/MarkAsImportant.pm
        'Mark' => 'Tanda',
        'Unmark' => 'Menyahtanda',

        # Perl Module: Kernel/Output/HTML/ArticleAction/ReinstallPackageLink.pm
        'Re-install Package' => '',
        'Re-install' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/PGP.pm
        'Crypted' => 'Dikodkan',
        'Sent message encrypted to recipient!' => '',
        'Signed' => 'Ditandatangani',
        '"PGP SIGNED MESSAGE" header found, but invalid!' => '',

        # Perl Module: Kernel/Output/HTML/ArticleCheck/SMIME.pm
        '"S/MIME SIGNED MESSAGE" header found, but invalid!' => '',
        'Ticket decrypted before' => '',
        'Impossible to decrypt: private key for email was not found!' => '',
        'Successful decryption' => '',

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
        'Sign' => 'Menandatangani',
        'Keys/certificates will only be shown for a sender with more than one key/certificate. The first found key/certificate will be pre-selected. Please make sure to select the correct one.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Dashboard/AppointmentCalendar.pm
        'Shown' => 'Ditunjukkan',
        'Refresh (minutes)' => '',
        'off' => 'tutup',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerIDList.pm
        'Shown customer ids' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/CustomerUserList.pm
        'Shown customer users' => 'Pengguna pelanggan ditunjukkan',

        # Perl Module: Kernel/Output/HTML/Dashboard/EventsTicketCalendar.pm
        'The start time of a ticket has been set after the end time!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/MyLastChangedTickets.pm
        'Shown Tickets' => 'Perlihat Tiket',

        # Perl Module: Kernel/Output/HTML/Dashboard/RSS.pm
        'Can\'t connect to %s!' => '',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketGeneric.pm
        'Shown Columns' => 'Lajur dipamerkan',
        'filter not active' => '',
        'filter active' => '',
        'This ticket has no title or subject' => 'Tiket ini tidak mempunyai tajuk atau subjek',

        # Perl Module: Kernel/Output/HTML/Dashboard/TicketStatsGeneric.pm
        '7 Day Stats' => 'Statistik 7 hari',

        # Perl Module: Kernel/Output/HTML/Dashboard/UserOnline.pm
        'User is currently offline.' => '',
        'User is currently active.' => '',
        'User was inactive for a while.' => '',
        'User set their status to unavailable.' => '',
        'Away' => '',

        # Perl Module: Kernel/Output/HTML/Layout.pm
        'Standard' => 'Piawaian',
        'The following tickets are not updated: %s.' => '',
        'h' => 'h',
        'm' => 'm',
        'd' => 'd',
        'This ticket does not exist, or you don\'t have permissions to access it in its current state. You can take one of the following actions:' =>
            '',
        'This is a' => 'Ini adalah',
        'email' => 'emel',
        'click here' => 'Tekan Sini',
        'to open it in a new window.' => 'untuk buka ia dalam tetingkap baru',
        'Year' => 'Tahun',
        'Hours' => 'Beberapa Jam',
        'Minutes' => 'Beberapa Minit',
        'Check to activate this date' => 'Periksa untuk mengaktifkan tarikh ini',
        '%s TB' => '',
        '%s GB' => '',
        '%s MB' => '',
        '%s KB' => '',
        '%s B' => '',
        'No Permission!' => 'Tiada kebenaran!',
        'No Permission' => '',
        'Show Tree Selection' => 'Papar Pilihan Pokok',
        'Split Quote' => 'Pisah Petikan',
        'Remove Quote' => '',

        # Perl Module: Kernel/Output/HTML/Layout/LinkObject.pm
        'Linked as' => 'Dipautkan sebagai',
        'Search Result' => '',
        'Linked' => 'Dipautkan',
        'Bulk' => 'Pukal',

        # Perl Module: Kernel/Output/HTML/Layout/Ticket.pm
        'Lite' => 'Sedikit',
        'Unread article(s) available' => 'Artikel yang tidak dibaca disediakan',

        # Perl Module: Kernel/Output/HTML/LinkObject/Appointment.pm
        'Appointment' => '',

        # Perl Module: Kernel/Output/HTML/LinkObject/Ticket.pm
        'Archive search' => '',

        # Perl Module: Kernel/Output/HTML/Notification/AgentOnline.pm
        'Online Agent: %s' => 'Egen dalam talian: %s',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTicketEscalation.pm
        'There are more escalated tickets!' => 'Terdapat banyak lagi peningkatan tiket!',

        # Perl Module: Kernel/Output/HTML/Notification/AgentTimeZoneCheck.pm
        'Please select a time zone in your preferences and confirm it by clicking the save button.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerOnline.pm
        'Online Customer: %s' => 'Pelanggan dalam talian: %s',

        # Perl Module: Kernel/Output/HTML/Notification/CustomerSystemMaintenanceCheck.pm
        'System maintenance is active!' => '',
        'A system maintenance period will start at: %s and is expected to stop at: %s' =>
            '',

        # Perl Module: Kernel/Output/HTML/Notification/DaemonCheck.pm
        'Znuny Daemon is not running.' => 'Znuny Daemon tidak berjalan.',

        # Perl Module: Kernel/Output/HTML/Notification/OAuth2TokenManagementTokenExpired.pm
        'OAuth2 token for "%s" has expired.' => '',
        'OAuth2 refresh token for "%s" has expired.' => '',

        # Perl Module: Kernel/Output/HTML/Notification/OutofOfficeCheck.pm
        'You have Out of Office enabled, would you like to disable it?' =>
            'Anda membolehkan keluar dari pejabat, adakah anda ingin melumpuhkan ia?',

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
            'Sila pastikan anda telah memilih sekurang-kurangnya satu kaedah pengangkutan untuk pemberitahuan mandatori.',
        'Preferences updated successfully!' => 'Kemaskini pilihan berjaya!',

        # Perl Module: Kernel/Output/HTML/Preferences/Language.pm
        '(in process)' => '(dalam proses)',

        # Perl Module: Kernel/Output/HTML/Preferences/MaxArticlesPerPage.pm
        'Max. number of articles per page must be between 1 and 1000 or empty.' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/OutOfOffice.pm
        'Please specify an end date that is after the start date.' => 'Sila nyatakan tarikh akhir iaitu selepas tarikh mula.',

        # Perl Module: Kernel/Output/HTML/Preferences/Password.pm
        'Current password' => 'Kata laluan asal',
        'New password' => 'Kata laluan baru',
        'Verify password' => 'Mengesahkan kata laluan',
        'The current password is not correct. Please try again!' => 'Kata laluan asal tidak tepat. Sila cuba lagi!',
        'Please supply your new password!' => 'Sila berikan kata laluan baru anda!',
        'Can\'t update password, your new passwords do not match. Please try again!' =>
            'Tidak boleh kemas kini kata laluan, kata laluan baru anda tidak sama. Sila cuba sekali lagi!',
        'This password is forbidden by the current system configuration. Please contact the administrator if you have additional questions.' =>
            '',
        'Can\'t update password, it must be at least %s characters long!' =>
            'Tidak boleh kemaskini kata laluan, ia mesti mengandungi sekurang kurangnya %s karakter panjang.',
        'Can\'t update password, it must contain at least 2 lowercase and 2 uppercase letter characters!' =>
            '',
        'Can\'t update password, it must contain at least 1 digit!' => 'Tidak boleh mengemaskini kata laluan, ia mesti mengandungi sekurang-kurangnya 1 digit.',
        'Can\'t update password, it must contain at least 2 letter characters!' =>
            '',

        # Perl Module: Kernel/Output/HTML/Preferences/TimeZone.pm
        'Time zone updated successfully!' => '',

        # Perl Module: Kernel/Output/HTML/Statistics/View.pm
        'invalid' => 'tidak sah',
        'valid' => 'sah',
        'No (not supported)' => '',
        'No past complete or the current+upcoming complete relative time value selected.' =>
            'Tiada lengkapan masa lalu atau nilai masa relatif lengkapan semasa+akan datang dipilih.',
        'The selected time period is larger than the allowed time period.' =>
            'Tempoh masa yang dipilih lebih besar daripada tempoh masa yang dibenarkan.',
        'No time scale value available for the current selected time scale value on the X axis.' =>
            'Tiada nilai skala masa tersedia untuk nilai skala masa dipilih sekarang pada paksi X.',
        'The selected date is not valid.' => 'Tarikh yang dipilih tidak sah.',
        'The selected end time is before the start time.' => 'Masa tamat yang dipilih adalah sebelum masa permulaan.',
        'There is something wrong with your time selection.' => 'Ada sesuatu yang salah dengan pilihan masa anda.',
        'Please select only one element or allow modification at stat generation time.' =>
            'Sila pilih hanya satu elemen atau membenarkan pengubahsuaian pada masa generasi stat.',
        'Please select at least one value of this field or allow modification at stat generation time.' =>
            'Sila pilih sekurang-kurangnya satu nilai medan ini atau membenarkan pengubahsuaian pada masa generasi stat.',
        'Please select one element for the X-axis.' => 'Sila pilih salah satu elemen untuk paksi-x.',
        'You can only use one time element for the Y axis.' => 'Anda hanya boleh menggunakan satu unsur masa untuk paksi Y.',
        'You can only use one or two elements for the Y axis.' => 'Anda hanya boleh menggunakan satu atau dua elemen untuk paksi Y.',
        'Please select at least one value of this field.' => 'Sila pilih sekurang-kurangnya satu nilai bidang ini.',
        'Please provide a value or allow modification at stat generation time.' =>
            'Sila berikan nilai atau membenarkan ubahsuaian pada masa generasi stat.',
        'Please select a time scale.' => 'Sila pilih skala masa.',
        'Your reporting time interval is too small, please use a larger time scale.' =>
            'Selang masa laporan anda terlalu kecil, sila gunakan skala masa yang lebih besar.',
        'second(s)' => 'saat(beberapa)',
        'quarter(s)' => 'suku(beberapa) tahun',
        'half-year(s)' => 'setengah tahun(beberapa)',
        'Please remove the following words because they cannot be used for the ticket restrictions: %s.' =>
            'Sila keluarkan perkataan yang berikut kerana mereka tidak boleh digunakan untuk sekatan tiket : %s.',

        # Perl Module: Kernel/Output/HTML/SysConfig.pm
        'Cancel editing and unlock this setting' => '',
        'Reset this setting to its default value.' => '',
        'Unable to load %s!' => '',
        'Content' => 'kandungan',

        # Perl Module: Kernel/Output/HTML/TicketMenu/Lock.pm
        'Unlock to give it back to the queue' => 'Buka untuk diberi semula pada barisan',
        'Lock it to work on it' => 'Kunci ia untuk digunakan ia',

        # Perl Module: Kernel/Output/HTML/TicketMenu/TicketWatcher.pm
        'Unwatch' => 'Tidak diperhati',
        'Watch' => 'Perhati',
        'Add to list of watched tickets' => 'Tambah kepada senarai tiket yang dilihat',

        # Perl Module: Kernel/Output/HTML/TicketOverviewMenu/Sort.pm
        'Order by' => 'Disusun mengikut',

        # Perl Module: Kernel/Output/HTML/TicketZoom/TicketInformation.pm
        'Ticket Information' => 'Informasi Tiket',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketLocked.pm
        'Locked Tickets New' => 'Tiket Baru Dikunci',
        'Locked Tickets Reminder Reached' => 'Jangkauan peringatan tiket dikunci',
        'Locked Tickets Total' => 'Jumlah Tiket Dikunci',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketMention.pm
        'Total mentions' => '',
        'Total new mentions' => '',
        'New mentions' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketOwner.pm
        'Owned Tickets New' => '',
        'Owned Tickets Reminder Reached' => '',
        'Owned Tickets Total' => '',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketResponsible.pm
        'Responsible Tickets New' => 'Tanggungjawab Tiket Baru',
        'Responsible Tickets Reminder Reached' => 'Tanggungjawab Tiket Mencapai Peringatan',
        'Responsible Tickets Total' => 'Jumlah Tanggungjawab Tiket',

        # Perl Module: Kernel/Output/HTML/ToolBar/TicketWatcher.pm
        'Watched Tickets New' => 'Memerhati Tiket Baru',
        'Watched Tickets Reminder Reached' => 'Memerhati Tiket Mencapai Peringatan',
        'Watched Tickets Total' => 'Memerhati Jumlah Tiket',

        # Perl Module: Kernel/Output/PDF/Ticket.pm
        'Ticket Dynamic Fields' => 'Tiket Medan Dinamik',

        # Perl Module: Kernel/System/ACL/DB/ACL.pm
        'Couldn\'t read ACL configuration file. Please make sure the file is valid.' =>
            '',

        # Perl Module: Kernel/System/Auth.pm
        'It is currently not possible to login due to a scheduled system maintenance.' =>
            'Log masuk tidak mungkin pada masa ini berikutan penyelenggaraan berkala sistem.',

        # Perl Module: Kernel/System/AuthSession.pm
        'Session limit reached! Please try again later.' => 'Had sesi telah dicapai. Sila cuba sebentar lagi.',
        'Session per user limit reached!' => '',

        # Perl Module: Kernel/System/AuthSession/DB.pm
        'Session invalid. Please log in again.' => 'Sesi tidak sah. Sila log masuk semula.',
        'Session has timed out. Please log in again.' => 'Sesi ini sudah tamat. Sila log masuk semula',

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
        'Configuration Options Reference' => 'Konfigurasi Pilihan Rujukan',
        'This setting can not be changed.' => 'Tetapan ini tidak boleh diubah.',
        'This setting is not active by default.' => 'Tetapan ini tidak aktif secara default.',
        'This setting can not be deactivated.' => 'Tetapan ini tidak boleh dinyahaktifkan.',
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
        'before/after' => 'sebelum/selepas',
        'between' => 'diantara',

        # Perl Module: Kernel/System/DynamicField/Driver/BaseText.pm
        'e.g. Text or Te*t' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/Checkbox.pm
        'Ignore this field.' => '',

        # Perl Module: Kernel/System/DynamicField/Driver/TextArea.pm
        'This field is required or' => 'Medan diperlukan untuk',
        'The field content is too long!' => 'Kandungan medan terlalu panjang!',
        'Maximum size is %s characters.' => 'Saiz maksimum ialah %s karakter.',

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
        'not installed' => '',
        'installed' => 'Dipasangkan',
        'Unable to parse repository index document.' => 'Tidak dapat menghurai repositori dokumen indeks.',
        'No packages for your framework version found in this repository, it only contains packages for other framework versions.' =>
            'Tiada pakej untuk rangka kerja anda ditemui didalam repositori ini, ia hanya mengandungi pakej untuk rangka kerja versi lain.',
        'File is not installed!' => '',
        'File is different!' => '',
        'Can\'t read file!' => '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process.pm
        'The process "%s" and all of its data has been imported successfully.' =>
            '',

        # Perl Module: Kernel/System/ProcessManagement/DB/Process/State.pm
        'Inactive' => 'Tidak Aktif',
        'FadeAway' => '',

        # Perl Module: Kernel/System/Stats.pm
        'Sum' => 'Jumlah',
        'week' => 'minggu',
        'quarter' => 'suku tahun',
        'half-year' => 'setengah tahun',

        # Perl Module: Kernel/System/Stats/Dynamic/Ticket.pm
        'State Type' => 'Jenis Keadaan',
        'Created Priority' => 'Keutamaan dicipta',
        'Created State' => 'Status dicipta',
        'Create Time' => 'Masa dicipta',
        'Pending until time' => '',
        'Close Time' => 'Masa tutup',
        'Escalation' => 'Peningkatan',
        'Escalation - First Response Time' => 'Peningkatan - Waktu Tindak balas Pertama',
        'Escalation - Update Time' => 'Peningkatan - Masa Kemas kini ',
        'Escalation - Solution Time' => 'Peningkatan - Masa Penyelesaian ',
        'Agent/Owner' => 'Egen/Pemilik',
        'Created by Agent/Owner' => 'Dicipta oleh Egen/Pemilik',
        'Assigned to Customer User Login' => '',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketAccountedTime.pm
        'Evaluation by' => 'Disemak oleh',
        'Ticket/Article Accounted Time' => 'Tiket/Artikel Menyumbang Masa',
        'Ticket Create Time' => 'Tiket Mencipta Masa',
        'Ticket Close Time' => 'Tiket Menutup Masa',
        'Accounted time by Agent' => 'Menyumbang masa oleh ejen',
        'Total Time' => 'Jumlah masa',
        'Ticket Average' => 'Purata tiket',
        'Ticket Min Time' => 'Masa Minimum Tiket',
        'Ticket Max Time' => 'Masa Maksimum Tiket',
        'Number of Tickets' => 'Bilangan Tiket',
        'Article Average' => 'Purata Artikel',
        'Article Min Time' => 'Masa Minimum Artikel',
        'Article Max Time' => 'Masa Maximum Artikel',
        'Number of Articles' => 'Bilangan Artikel',

        # Perl Module: Kernel/System/Stats/Dynamic/TicketList.pm
        'unlimited' => '',
        'Attributes to be printed' => 'Sifat-sifat untuk dicetak',
        'Sort sequence' => 'Susun urutan',
        'State Historic' => 'Sejarah Keadaan',
        'State Type Historic' => 'Sejarah Jenis Keadaan',
        'Historic Time Range' => 'Julat Masa Bersejarah',
        'Number' => 'Nombor',
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
        'Days' => 'Hari',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/OutdatedTables.pm
        'Outdated Tables' => '',
        'Outdated tables were found in the database. These can be removed if empty.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/TablePresence.pm
        'Table Presence' => 'Kehadiran jadual',
        'Internal Error: Could not open file.' => 'Ralat Dalaman: Tidak dapat membuka fail.',
        'Table Check' => 'Cek jadual',
        'Internal Error: Could not read file.' => 'Ralat Dalaman: Tidak dapat membaca fail.',
        'Tables found which are not present in the database.' => 'Jadual dijumpai tidak terdapat dalam pangkalan data.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Size.pm
        'Database Size' => 'Saiz Pangkalan data',
        'Could not determine database size.' => 'Tidak dapat menentukan saiz pangkalan data.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mssql/Version.pm
        'Database Version' => 'Versi Pangkalan data',
        'Could not determine database version.' => 'Tidak dapat menentukan versi pangkalan data.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Charset.pm
        'Client Connection Charset' => 'Setchar Sambungan Pelanggan',
        'Setting character_set_client needs to be utf8mb4.' => '',
        'Server Database Charset' => 'Setchar Pangkalan data Pelayan',
        'The setting character_set_database needs to be \'utf8mb4\'.' => '',
        'Table Charset' => 'Setchar Jadual',
        'There were non-system tables found which do not have \'utf8mb4\' as charset.' =>
            '',
        'There were tables found which do not have \'utf8mb4\' as charset.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InnoDBLogFileSize.pm
        'InnoDB Log File Size' => 'Saiz Fail Log InnoDB',
        'The setting innodb_log_file_size must be at least 256 MB.' => 'Tetapan saiz_fail_innodb haruslah sekurang-kurangnya 256 MB.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/InvalidDefaultValues.pm
        'Invalid Default Values' => '',
        'Tables with invalid default values were found. In order to fix it automatically, please run: bin/znuny.Console.pl Maint::Database::Check --repair' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/MaxAllowedPacket.pm
        'Maximum Query Size' => 'Saiz Query Maksimum',
        'The setting \'max_allowed_packet\' must be higher than 64 MB.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/StorageEngine.pm
        'Default Storage Engine' => 'Ejen Simpanan Lalai',
        'Table Storage Engine' => 'Enjin Simpanan Rajah',
        'Tables with a different storage engine than the default engine were found.' =>
            'Jadual dengan enjin simpanan berlainan daripada enjin default dijumpai.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/mysql/Version.pm
        'MySQL 5.x or higher is required.' => 'MySQL 5.x atau lebih tinggi diperlukan.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/NLS.pm
        'NLS_LANG Setting' => 'Tetapan NLS_LANG',
        'NLS_LANG must be set to al32utf8 (e.g. GERMAN_GERMANY.AL32UTF8).' =>
            'NLS_LANG mestilah disetkan ke al32utf8 (contoh: GERMAN_GERMANY.AL32UTF8).',
        'NLS_DATE_FORMAT Setting' => 'Tetapan NLS_DATE_FORMAT',
        'NLS_DATE_FORMAT must be set to \'YYYY-MM-DD HH24:MI:SS\'.' => 'NLS_DATE_FORMAT mestilah disetkan ke \'YYYY-MM-DD HH24:MI:SS\'.',
        'NLS_DATE_FORMAT Setting SQL Check' => 'Tetapan NLS_DATE_FORMAT Periksa SQL',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/oracle/PrimaryKeySequencesAndTriggers.pm
        'Primary Key Sequences and Triggers' => '',
        'The following sequences and/or triggers with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Charset.pm
        'Setting client_encoding needs to be UNICODE or UTF8.' => 'Tetapan client_encoding haruslah UNICODE atau UTF8 ',
        'Setting server_encoding needs to be UNICODE or UTF8.' => 'Tetapan server_encoding haruslah UNICODE atau UTF8 ',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/DateStyle.pm
        'Date Format' => 'Format Tarikh',
        'Setting DateStyle needs to be ISO.' => 'Tetapan JenisTarikh haruslah ISO.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/PrimaryKeySequences.pm
        'Primary Key Sequences' => '',
        'The following sequences with possible wrong names have been found. Please rename them manually.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Database/postgresql/Version.pm
        'PostgreSQL 9.2 or higher is required.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskPartitionZnuny.pm
        'Operating System' => 'Sistem Beroperasi',
        'Znuny Disk Partition' => 'Pembahagian Cakera Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpace.pm
        'Disk Usage' => 'Penggunaan cakera',
        'The partition where Znuny is located is almost full.' => 'Pembahagian di mana Znuny diletakkan hampir penuh.',
        'The partition where Znuny is located has no disk space problems.' =>
            'Pembahagian di mana Znuny diletakkan tidak mempunyai masalah ruangan cakera.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/DiskSpacePartitions.pm
        'Disk Partitions Usage' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Distribution.pm
        'Distribution' => 'Pengagihan',
        'Could not determine distribution.' => 'Tidak dapat menentukan pengagihan.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/KernelVersion.pm
        'Kernel Version' => 'Versi Kernel',
        'Could not determine kernel version.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Load.pm
        'System Load' => 'Memuat sistem',
        'The system load should be at maximum the number of CPUs the system has (e.g. a load of 8 or less on a system with 8 CPUs is OK).' =>
            'Beban sistem hendaklah maksimum dengan jumlah CPU sistem ini miliki (contohnya beban 8 atau kurang pada sistem dengan 8 CPU adalah OK).',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModules.pm
        'Perl Modules' => 'Modul Perl',
        'Not all required Perl modules are correctly installed.' => 'Tidak semua modul Perl yang diperlukan dipasang dengan betul.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlModulesAudit.pm
        'Perl Modules Audit' => '',
        'CPAN::Audit reported that one or more installed Perl modules have known vulnerabilities. Please note that there might be false positives for distributions patching Perl modules without changing their version number.' =>
            '',
        'CPAN::Audit did not report any known vulnerabilities in the installed Perl modules.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/PerlVersion.pm
        'Perl Version' => 'Versi Perl',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/OS/Swap.pm
        'Free Swap Space (%)' => 'Ruang Tukaran Kosong (%)',
        'No swap enabled.' => 'Tiada penukaran dibenarkan.',
        'Used Swap Space (MB)' => 'Ruang Tukaran Digunakan (MB)',
        'There should be more than 60% free swap space.' => 'Ia sepatutnya mempunyai lebih daripada 60% ruang tukaran kosong.',
        'There should be no more than 200 MB swap space used.' => 'Ia sepatutnya mempunyai tidak lebih daripada 200 MB ruang tukaran yang digunakan.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/LoadedModules.pm
        'Webserver' => 'Pelayan web',
        'Loaded Apache Modules' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/MPMModel.pm
        'MPM model' => 'Model MPM',
        'Znuny requires apache to be run with the \'prefork\' MPM model.' =>
            'Znuny memerlukan apache dijalankan dengan model MPM \'prefork\'.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Apache/Performance.pm
        'CGI Accelerator Usage' => 'Penggunaan Pemecut CGI',
        'You should use FastCGI or mod_perl to increase your performance.' =>
            'Anda harus menggunakan FastCGI atau mod_perl untuk meningkatkan prestasi anda.',
        'mod_deflate Usage' => 'Penggunaan mod_deflate',
        'Please install mod_deflate to improve GUI speed.' => 'Sila pasang mod_deflate untuk meningkatkan kelajuan GUI.',
        'mod_filter Usage' => 'Penggunaan mod_filter',
        'Please install mod_filter if mod_deflate is used.' => 'Sila pasang mod_filter jika mod_deflate digunakan.',
        'mod_headers Usage' => 'Penggunaan mod_headers',
        'Please install mod_headers to improve GUI speed.' => 'Sila pasang mod_headers untuk meningkatkan kelajuan GUI.',
        'Apache::Reload Usage' => 'Penggunaan Apache::Reload',
        'Apache::Reload or Apache2::Reload should be used as PerlModule and PerlInitHandler to prevent web server restarts when installing and upgrading modules.' =>
            'Apache::Reload atau Apache2::Muat semula harus digunakan sebagai ModulPerl dan PengendaliAwalPerl untuk mengelak pelayan web bermula semula apabila memasang dan menaik taraf modul. ',
        'Apache2::DBI Usage' => 'Penggunaan Apache2::DBI',
        'Apache2::DBI should be used to get a better performance  with pre-established database connections.' =>
            'Apache2::DBI harus digunakan untuk mendapatkan prestasi yang lebih baik dengan sambungan pangkalan data sebelum ditubuhkan.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/EnvironmentVariables.pm
        'Environment Variables' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/InternalWebRequest.pm
        'Support Data Collection' => '',
        'Support data could not be collected from the web server.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Webserver/Version.pm
        'Webserver Version' => 'Versi pelayan web',
        'Could not determine webserver version.' => 'Tidak dapat menentukan versi pelayan web.',

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
        'Config Settings' => '',
        'Could not determine value.' => 'Tidak dapat menentukan nilai.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DaemonRunning.pm
        'Daemon' => 'Daemon',
        'Daemon is running.' => '',
        'Daemon is not running.' => 'Daemon tidak berjalan.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DatabaseRecords.pm
        'Database Records' => '',
        'Tickets' => 'Tiket',
        'Ticket History Entries' => 'Penyertaan Sejarah Tiket ',
        'Articles' => 'Artikel',
        'Attachments (DB, Without HTML)' => 'Lampiran (DB, Tanpa HTML)',
        'Customers With At Least One Ticket' => 'Pelanggan Dengan Sekurang-kurangnya Satu Tiket',
        'Dynamic Field Values' => 'Nilai Medan Dinamik',
        'Invalid Dynamic Fields' => 'Medan Dinamik tidak sah',
        'Invalid Dynamic Field Values' => 'Nilai Medan Dinamik tidak sah',
        'GenericInterface Webservices' => 'AntaramukaGenerik Servisweb',
        'Process Tickets' => '',
        'Months Between First And Last Ticket' => 'Bulan Di antara Tiket Pertama Dan Tiket Terakhir',
        'Tickets Per Month (avg)' => 'Tiket setiap bulan (purata)',
        'Open Tickets' => 'TIket Terbuka',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultSOAPUser.pm
        'Default SOAP Username And Password' => 'SOAP default Namapengguna Dan Katalaluan',
        'Security risk: you use the default setting for SOAP::User and SOAP::Password. Please change it.' =>
            'Risiko keselamatan: anda menggunakan tetapan default untuk SOAP::Pengguna dan SOAP::Katalaluan. Sila tukar.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/DefaultUser.pm
        'Default Admin Password' => 'Kata laluan Default Admin',
        'Security risk: the agent account root@localhost still has the default password. Please change it or invalidate the account.' =>
            'Risiko keselamatan: akaun agen root@localhost masih mempunyai kata laluan default. Sila tukar atau batalkan akaun.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/EmailQueue.pm
        'Email Sending Queue' => '',
        'Emails queued for sending' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FQDN.pm
        'FQDN (domain name)' => 'FQDN (nama domain)',
        'Please configure your FQDN setting.' => 'Sila konfigurasi tetapan FQDN anda.',
        'Domain Name' => 'Nama Domain',
        'Your FQDN setting is invalid.' => 'Tetapan FQDN anda tidak sah.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/FileSystemWritable.pm
        'File System Writable' => 'Fail Sistem Boleh Disalin',
        'The file system on your Znuny partition is not writable.' => 'Sistem fail pada bahagian Znuny anda tidak boleh ditulis.',

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
        'Package Installation Status' => 'Status Pemasangan Pakej',
        'Some packages have locally modified files.' => '',
        'Some packages are not correctly installed.' => 'Sesetengah pakej tidak dipasang dengan betul.',
        'Package Framework Version Status' => '',
        'Some packages are not allowed for the current framework version.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/PackageList.pm
        'Package List' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SessionConfigSettings.pm
        'Session Config Settings' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SpoolMails.pm
        'Spooled Emails' => '',
        'There are emails in var/spool that Znuny could not process.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/SystemID.pm
        'Your SystemID setting is invalid, it should only contain digits.' =>
            'Tetapan IDSistem anda tidak sah, ia sepatutnya hanya mengandungi angka.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/DefaultType.pm
        'Default Ticket Type' => '',
        'The configured default ticket type is invalid or missing. Please change the setting Ticket::Type::Default and select a valid ticket type.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/IndexModule.pm
        'Ticket Index Module' => 'Modul Indeks Tiket',
        'You have more than 60,000 tickets and should use the StaticDB backend. See admin manual (Performance Tuning) for more information.' =>
            'Anda mempunyai lebih daripada 60,000 tiket dan harus menggunakan backend StaticDB. Lihat manual admin (Penalaan Prestasi) untuk maklumat lanjut.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/InvalidUsersWithLockedTickets.pm
        'Invalid Users with Locked Tickets' => '',
        'There are invalid users with locked tickets.' => '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/OpenTickets.pm
        'You should not have more than 8,000 open tickets in your system.' =>
            'Anda sepatutnya mempunyai tidak lebih dari 8,000 tiket terbuka di dalam sistem anda.',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/SearchIndexModule.pm
        'Ticket Search Index Module' => 'Modul Indeks Carian Tiket',
        'The indexing process forces the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/Ticket/StaticDBOrphanedRecords.pm
        'Orphaned Records In ticket_lock_index Table' => 'Rekod piatu dalam Jadual ticket_lock_index',
        'Table ticket_lock_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            'Jadual ticket_lock_index mengandungi rekod piatu. Sila jalankan bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" untuk membersihkan indeks StaticDB.',
        'Orphaned Records In ticket_index Table' => 'Rekod piatu dalam Jadual ticket_index',
        'Table ticket_index contains orphaned records. Please run bin/znuny.Console.pl "Maint::Ticket::QueueIndexCleanup" to clean the StaticDB index.' =>
            '',

        # Perl Module: Kernel/System/SupportDataCollector/Plugin/Znuny/TimeSettings.pm
        'Time Settings' => '',
        'Server time zone' => 'Zon waktu pelayan',
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
        'Znuny Version' => 'Versi Znuny',

        # Perl Module: Kernel/System/SupportDataCollector/PluginAsynchronous/Znuny/ConcurrentUsers.pm
        'Concurrent Users Details' => '',
        'Concurrent Users' => 'Pengguna Sedia ada',

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
        'Default' => '',
        'Value is not correct! Please, consider updating this field.' => '',
        'Value doesn\'t satisfy regex (%s).' => '',

        # Perl Module: Kernel/System/SysConfig/ValueType/Checkbox.pm
        'Enabled' => 'Dibolehkan',
        'Disabled' => 'Tidak dibolehkan',

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
            'Log masuk gagal. Kata nama anda atau kata laluan yang dimasukkan tidak tepat',
        'Authentication succeeded, but no user data record is found in the database. Please contact the administrator.' =>
            '',
        'Can`t remove SessionID.' => '',
        'Logout successful.' => '',
        'Feature not active!' => 'Ciri-ciri tidak aktif!',
        'Sent password reset instructions. Please check your email.' => 'Hantar arahan set semula kata laluan. Sila periksa emel anda.',
        'Invalid Token!' => 'Tanda tidak sah!',
        'Sent new password to %s. Please check your email.' => 'Menghantar kata laluan baru untuk %s. Sila semak emel anda.',
        'Error: invalid session.' => '',
        'No Permission to use this frontend module!' => '',

        # Perl Module: Kernel/System/Web/InterfaceCustomer.pm
        'Authentication succeeded, but no customer record is found in the customer backend. Please contact the administrator.' =>
            '',
        'Reset password unsuccessful. Please contact the administrator.' =>
            '',
        'This e-mail address already exists. Please log in or reset your password.' =>
            'Alamat emel ini telah wujud. Sila log masuk atau tetapkan semula kata laluan anda. ',
        'This email address is not allowed to register. Please contact support staff.' =>
            'Alamat e-mel tidak dibenarkan mendaftar. Sila hubungi kakitangan sokongan.',
        'Added via Customer Panel (%s)' => '',
        'Customer user can\'t be added!' => '',
        'Can\'t send account info!' => '',
        'New account created. Sent login information to %s. Please check your email.' =>
            'Akaun baru telah didaftarkan. Hantar maklumat log masuk kepada %s. Sila periksa emel anda',

        # Perl Module: Kernel/System/Web/InterfaceInstaller.pm
        'Action "%s" not found!' => '',

        # XML Definition: Kernel/Config/Files/XML/Calendar.xml
        'Frontend module registration for the public interface.' => 'Frontend pendaftaran modul untuk antara muka awam.',
        'Frontend module registration for the agent interface.' => 'Pendaftaran modul frontend untuk paparan ejen.',
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
        'Uses richtext for viewing and editing ticket notification.' => 'Menggunakan richtext untuk melihat dan mengedit pemberitahuan tiket.',
        'Defines the width for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Mentakrifkan lebar untuk komponen editor teks kaya untuk skrin ini. Masukkan nombor (piksel) atau nilai peratus (relatif).',
        'Defines the height for the rich text editor component for this screen. Enter number (pixels) or percent value (relative).' =>
            'Mentakrifkan tinggi untuk komponen editor teks kaya untuk skrin ini. Masukkan nombor (piksel) atau nilai peratus (relatif).',
        'Transport selection for appointment notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the number of character per line used in case an HTML article preview replacement on TemplateGenerator for EventNotifications.' =>
            'Menentukan bilangan aksara per baris digunakan dalam kes HTML penggantian artikel pratonton pada TemplateGenerator untuk EventNotifications.',
        'Defines all the parameters for this notification transport.' => 'Mentakrifkan semua parameter bagi pengangkutan pemberitahuan ini.',
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
            'Mentakrifkan modul untuk memaparkan pemberitahuan dalam antara muka ejen jika Znuny Daemon tidak berjalan.',
        'List of CSS files to always be loaded for the agent interface.' =>
            'Senarai fail CSS untuk sentiasa dimuatkan untuk paparan ejen.',
        'List of JS files to always be loaded for the agent interface.' =>
            'Senarai fail JS untuk sentiasa dimuatkan untuk paparan ejen.',
        'Type of daemon log rotation to use: Choose \'OTRS\' to let Znuny system to handle the file rotation, or choose \'External\' to use a 3rd party rotation mechanism (i.e. logrotate). Note: External rotation mechanism requires its own and independent configuration.' =>
            '',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if &lt;$OTRSHome&gt;/var/run/ can not be used.' =>
            '',
        'Defines the number of days to keep the daemon log files.' => 'Mentakrifkan bilangan hari untuk menyimpan fail log daemon.',
        'If enabled the daemon will redirect the standard output stream to a log file.' =>
            'Jika didayakan daemon akan mengarahkan aliran output standard ke fail log.',
        'If enabled the daemon will redirect the standard error stream to a log file.' =>
            'Jika didayakan daemon akan mengarahkan aliran ralat piawai ke fail log.',
        'The daemon registration for the scheduler generic agent task manager.' =>
            'Pendaftaran daemon untuk penjadual ejen generik pengurus tugas.',
        'The daemon registration for the scheduler cron task manager.' =>
            'Pendaftaran daemon untuk pengurus tugas penjadual cron.',
        'The daemon registration for the scheduler future task manager.' =>
            'Pendaftaran daemon untuk penjadual tugas pengurus masa depan.',
        'The daemon registration for the scheduler task worker.' => 'Pendaftaran daemon untuk pekerja tugas penjadual.',
        'The daemon registration for the system configuration deployment sync manager.' =>
            '',
        'Defines the maximum number of tasks to be executed as the same time.' =>
            'Menentukan jumlah tugasan maksimum untuk dijalankan pada masa yang sama.',
        'Specifies the email addresses to get notification messages from scheduler tasks.' =>
            'Menentukan alamat emel untuk mendapat mesej pemberitahuan daripada penjadual tugas.',
        'Defines the maximum number of affected tickets per job.' => 'Mentakrifkan nombor maksimum bagi tiket yang terjejas untuk setiap tugas.',
        'Defines a sleep time in microseconds between tickets while they are been processed by a job.' =>
            'Mentakrifkan masa tidur dalam mikrosaat antara tiket ketika mereka sedang diproses oleh pekerjaan.',
        'Delete expired cache from core modules.' => 'Memadam cache tamat tempoh daripada modul teras.',
        'Delete expired upload cache hourly.' => '',
        'Delete expired loader cache weekly (Sunday mornings).' => 'Padam pemuat cache tamat tempoh mingguan (Ahad pagi).',
        'Fetch emails via fetchmail.' => 'Ambil emel melalui fetchmail.',
        'Fetch emails via fetchmail (using SSL).' => 'Ambil emel melalui fetchmail (menggunakan SSL).',
        'Generate dashboard statistics.' => 'Janakan statistik papan pemuka.',
        'Triggers ticket escalation events and notification events for escalation.' =>
            'Mencetuskan peristiwa peningkatan tiket dan peristiwa pemberitahuan untuk peningkatan.',
        'Process pending tickets.' => 'Proses tiket ditangguh.',
        'Reprocess mails from spool directory that could not be imported in the first place.' =>
            'Proses semula mel daripada direktori spool yang tidak boleh diimport pada mulanya.',
        'Fetch incoming emails from configured mail accounts.' => 'Kutip e-mel masuk dari akaun mel dikonfigurasikan.',
        'Rebuild the ticket index for AgentTicketQueue.' => 'Membina semula indeks tiket untuk AgentTicketQueue.',
        'Delete expired sessions.' => 'Padam sesi tamat tempoh.',
        'Unlock tickets that are past their unlock timeout.' => 'Membuka tiket yang melepasi tempoh tamat masa buka kunci mereka.',
        'Renew existing SMIME certificates from customer backend. Note: SMIME and SMIME::FetchFromCustomer needs to be enabled in SysConfig and customer backend needs to be configured to fetch UserSMIMECertificate attribute.' =>
            '',
        'Checks for articles that needs to be updated in the article search index.' =>
            '',
        'Checks for queued outgoing emails to be sent.' => '',
        'Checks for communication log entries to be deleted.' => '',
        'Executes a custom command or module. Note: if module is used, function is required.' =>
            'Melaksanakan arahan langganan atau modul. Nota: jika modul digunakan, fungsi diperlukan.',
        'Run file based generic agent jobs (Note: module name needs to be specified in -configuration-module param e.g. "Kernel::System::GenericAgent").' =>
            '',
        'Collect support data for asynchronous plug-in modules.' => 'Kumpul data sokongan untuk modul sumbat masuk tak segerak.',
        'Defines the default the number of seconds (from current time) to re-schedule a generic interface failed task.' =>
            'Menentukan nombor saat yang default (daripada waktu semasa) untuk menyusun tugas antara muka generik yang gagal.',
        'Removes old system configuration deployments (Sunday mornings).' =>
            '',
        'Removes old ticket number counters (each 10 minutes).' => '',
        'Removes old generic interface debug log entries created before the specified amount of days.' =>
            '',
        'Delete expired ticket draft entries.' => '',

        # XML Definition: Kernel/Config/Files/XML/Framework.xml
        'Disables the web installer (http://yourhost.example.com/znuny/installer.pl), to prevent the system from being hijacked. If not enabled, the system can be reinstalled and the current basic configuration will be used to pre-populate the questions within the installer script. If enabled, it also disables the GenericAgent, PackageManager and SQL Box.' =>
            '',
        'Enables or disables the debug mode over frontend interface.' => 'Membolehkan atau melumpuhkan mod nyahpepijat atas muka akhir hadapan.',
        'Delivers extended debugging information in the frontend in case any AJAX errors occur, if enabled.' =>
            '',
        'Enables or disables the caching for templates. WARNING: Do NOT disable template caching for production environments for it will cause a massive performance drop! This setting should only be disabled for debugging reasons!' =>
            'Mengaktif atau menyahaktifkan caching untuk templat. AMARAN: JANGAN melumpuhkan template caching untuk persekitaran pengeluaran kerana ia akan menyebabkan penurunan prestasi besar-besaran! Tetapan ini hanya boleh dimatikan atas sebab debugging!',
        'Sets the configuration level of the administrator. Depending on the config level, some sysconfig options will be not shown. The config levels are in in ascending order: Expert, Advanced, Beginner. The higher the config level is (e.g. Beginner is the highest), the less likely is it that the user can accidentally configure the system in a way that it is not usable any more.' =>
            'Menetapkan tahap konfigurasi pentadbir. Bergantung kepada tahap config, beberapa pilihan sysconfig akan tidak ditunjukkan. Tahap config di dalam tertib menaik: Pakar, Advanced, Permulaan. Semakin tinggi tahap config (Permulaan contohnya adalah yang tertinggi), semakin kurang kemungkinan adalah bahawa pengguna tidak sengaja boleh mengkonfigurasi sistem dalam cara yang ia tidak boleh digunakan lagi.',
        'Controls if the admin is allowed to import a saved system configuration in SysConfig.' =>
            'Mengawal jika admin dibenarkan untuk mengimport konfigurasi sistem disimpan dalam SysConfig.',
        'Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.' =>
            'Mentakrifkan nama aplikasi, ditunjukkan dalam paparan web, tab dan bar tajuk browser web.',
        'Defines the system identifier. Every ticket number and http session string contains this ID. This ensures that only tickets which belong to your system will be processed as follow-ups (useful when communicating between two instances of Znuny).' =>
            'Mentakrifkan pengecam sistem. Setiap nombor tiket dan sesi http rentetan mengandungi ID ini. Ini memastikan bahawa hanya tiket yang tergolong dalam sistem anda akan diproses susulan (berguna apabila berkomunikasi antara dua contoh Znuny).',
        'Defines the fully qualified domain name of the system. This setting is used as a variable, OTRS_CONFIG_FQDN which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Mentakrifkan nama domain sistem yang layak sepenuhnya. Tetapan ini digunakan sebagai pembolehubah, OTRS_CONFIG_FQDN dimana ia wujud dalam beberapa bentuk mesej yang digunakan oleh aplikasi itu.',
        'Defines the fully qualified domain name for external IDs generation (i.e. Message-ID, ContentID).' =>
            '',
        'Defines the HTTP hostname for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the timeout (in seconds, minimum is 20 seconds) for the support data collection with the public module \'PublicSupportDataCollector\' (e.g. used from the Znuny Daemon).' =>
            '',
        'Defines the type of protocol, used by the web server, to serve the application. If https protocol will be used instead of plain http, it must be specified here. Since this has no affect on the web server\'s settings or behavior, it will not change the method of access to the application and, if it is wrong, it will not prevent you from logging into the application. This setting is only used as a variable, OTRS_CONFIG_HttpType which is found in all forms of messaging used by the application, to build links to the tickets within your system.' =>
            'Mentakrifkan jenis protokol, yang digunakan oleh pelayan web, untuk menyerahkan permohonan itu. Jika protokol https akan digunakan dan bukannya http kosong, ia perlu dinyatakan di sini. Oleh kerana ini telah tidak memberi kesan pada tetapan pelayan web atau tingkah laku, ia tidak akan mengubah kaedah akses kepada permohonan itu dan, jika ia adalah salah, ia tidak akan menghalang anda daripada masuk ke aplikasi. Tetapan ini hanya digunakan sebagai pembolehubah, OTRS_CONFIG_HttpType yang terdapat dalam semua bentuk mesej yang digunakan oleh permohonan itu, untuk membina pautan kepada tiket dalam sistem anda.',
        'Whether to force redirect all requests from http to https protocol. Please check that your web server is configured correctly for https protocol before enable this option.' =>
            '',
        'Sets the prefix to the scripts folder on the server, as configured on the web server. This setting is used as a variable, OTRS_CONFIG_ScriptAlias which is found in all forms of messaging used by the application, to build links to the tickets within the system.' =>
            'Set prefiks untuk folder skrip pada server, seperti yang dikonfigurasikan pada server web. Tetapan ini digunakan sebagai pembolehubah, OTRS_CONFIG_ScriptAlias ​​yang terdapat dalam semua bentuk pesanan yang digunakan oleh aplikasi, untuk membina hubungan tiket dalam sistem.',
        'Defines the system administrator\'s email address. It will be displayed in the error screens of the application.' =>
            'Mentakrifkan alamat emel pentadbir sistem. Ia akan dipamerkan dalam skrin error aplikasi.',
        'Company name which will be included in outgoing emails as an X-Header.' =>
            'Nama syarikat yang akan dimasukkan ke dalam e-mel keluar sebagai X- Header.',
        'Defines the default front-end language. All the possible values are determined by the available language files on the system (see the next setting).' =>
            'Mentakrifkan  bahasa hadapan-hujung asal. Semua nilai-nilai yang mungkin ditentukan oleh fail bahasa yang ada pada sistem (lihat tetapan yang seterusnya).',
        'Defines all the languages that are available to the application. Specify only English names of languages here.' =>
            'Mentakrifkan semua bahasa yang boleh didapati dengan permohonan itu. Menetapkan nama yang hanya bahasa Inggeris di sini.',
        'Defines all the languages that are available to the application. Specify only native names of languages here.' =>
            'Mentakrifkan semua bahasa yang boleh didapati dengan permohonan itu. Nyatakan hanya nama-nama bahasa asal di sini.',
        'Defines the default front-end (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.znuny.org/manual/developer/.' =>
            'Mentakrifkan tema (HTML) bahagian depan default yang akan digunakan oleh ejen-ejen dan pelanggan. Jika anda suka, anda boleh menambah tema anda sendiri. Sila rujuk manual pentadbir yang terletak di https://doc.znuny.org/manual/developer/.',
        'It is possible to configure different themes, for example to distinguish between agents and customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid theme on your system. Please see the example entries for the proper form of the regex.' =>
            'Ia adalah mungkin untuk mengkonfigurasi tema yang berbeza, sebagai contoh untuk membezakan antara ejen dan pelanggan, yang akan digunakan atas dasar per domain dalam aplikasi. Menggunakan ungkapan biasa (regex), anda boleh mengkonfigurasi sepasang Kunci / Kandungan untuk dipadankan domain. Nilai dalam "Key" harus sepadan domain, dan nilai dalam "Content" harus menjadi tema yang sah pada sistem anda. Sila lihat catatan contoh untuk bentuk yang betul daripada regex.',
        'The headline shown in the customer interface.' => 'Headline ditunjukkan dalam paparan pelanggan.',
        'The logo shown in the header of the customer interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Logo ditunjukkan dalam header paparan pelanggan. URL kepada imej boleh relatif kepada direktori kulit imej, atau URL penuh ke server web jauh.',
        'The shortcut icon for the customer interface.' => '',
        'The shortcut icon for the customer interface for the skin "default".' =>
            '',
        'The Apple touch icon for the customer interface.' => '',
        'The Apple touch icon for the customer interface for skin "default".' =>
            '',
        'The logo shown in the header of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            'Logo ditunjukkan dalam header paparan ejen. URL kepada imej boleh relatif kepada direktori kulit imej, atau URL penuh ke server web jauh.',
        'The logo shown in the header of the agent interface for the skin "default". See "AgentLogo" for further description.' =>
            'Logo ditunjukkan di header antara muka ejen bagi kulit "default". Lihat "LogoAgen" untuk keterangan lanjut.',
        'The logo shown on top of the login box of the agent interface. The URL to the image can be a relative URL to the skin image directory, or a full URL to a remote web server.' =>
            '',
        'The shortcut icon for the agent interface.' => '',
        'The shortcut icon for the agent interface fot the skin "default".' =>
            '',
        'The Apple touch icon for the agent interface.' => '',
        'The Apple touch icon for the agent interface for the skin "default".' =>
            '',
        'Defines the URL base path of icons, CSS and Java Script.' => 'Mentakrifkan laluan asas URL dari ikon, CSS dan Java Script.',
        'Defines the URL image path of icons for navigation.' => 'Mentakrifkan laluan imej URL dari ikon untuk navigasi.',
        'Defines the URL CSS path.' => 'Mentakrifkan laluan URL CSS.',
        'Defines the URL java script path.' => 'Mentakrifkan laluan URL java script',
        'Uses richtext for viewing and editing: articles, salutations, signatures, standard templates, auto responses and notifications.' =>
            'Menggunakan richtext untuk melihat dan mengedit : artikel, tanda hormat, tandatangan, templat standard, respon auto dan pemberitahuan.',
        'Defines the URL rich text editor path.' => 'Mentakrifkan laluan URL editor teks kaya.',
        'Defines the default CSS used in rich text editors.' => 'Mentakrifkan CSS asal yang digunakan dalam editor teks kaya.',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.).' =>
            'Mentakrifkan jika mod dipertingkatkan harus digunakan (membolehkan penggunaan jadual, penggantian, subskrip, superskrip, tampal dari perkataan, dll).',
        'Defines if the enhanced mode should be used (enables use of table, replace, subscript, superscript, paste from word, etc.) in customer interface.' =>
            '',
        'Defines the width for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Mentakrifkan kelebaran untuk komponen editor teks beraneka. Masukkan nombor (piksel) atau nilai peratus (relatif).',
        'Defines the height for the rich text editor component. Enter number (pixels) or percent value (relative).' =>
            'Mentakrifkan ketinggian untuk komponent editor teks beraneka. Masukkan nombor (piksel) atau nilai peratus (relatif).',
        'Defines the selectable font sizes in the rich text editor.' => '',
        'Defines the selectable fonts in the rich text editor.' => '',
        'Defines the selectable format tags in the rich text editor.' => '',
        'Defines additional plugins for use in the rich text editor.' => '',
        'Defines extra content that is allowed for use in the rich text editor.' =>
            '',
        'Global settings for all popup profiles.' => '',
        'Disable autocomplete in the login screen.' => '',
        'Disable HTTP header "X-Frame-Options: SAMEORIGIN" to allow Znuny to be included as an IFrame in other websites. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            'Menyahaktif header HTTP "Pilihan Bingkai-X: SAMEORIGIN" untuk membenarkan Znuny untuk dimasukkan sebagai IFrame dalam laman web lain. Menyahaktifkan header HTTP ini boleh menjadi isu keselamatan! Hanya nyahaktifkannya, jika anda tahu apa yang anda lakukan!',
        'Disable HTTP header "Content-Security-Policy" to allow loading of external script contents. Disabling this HTTP header can be a security issue! Only disable it, if you know what you are doing!' =>
            '',
        'Automated line break in text messages after x number of chars.' =>
            'Memecahkan garis Automatik dalam mesej teks selepas beberapa x aksara.',
        'Sets the number of lines that are displayed in text messages (e.g. ticket lines in the QueueZoom).' =>
            'Tetapkan jumlah barisan yang dipamerkan dalam mesej teks (cth: barisan tiket dalam dalam QueueZoom).',
        'Turns on drag and drop for the main navigation.' => 'Aktifkan tarik dan lepas untuk navigasi utama.',
        'Defines the date input format used in forms (option or input fields).' =>
            'Mentakrifkan format input tarikh yang digunakan dalam bentuk (pilihan atau medan input).',
        'Defines the available steps in time selections. Select "Minute" to be able to select all minutes of one hour from 1-59. Select "30 Minutes" to only make full and half hours available.' =>
            '',
        'Shows time in long format (days, hours, minutes), if enabled; or in short format (days, hours), if not enabled.' =>
            '',
        'Allows choosing between showing the attachments of a ticket in the browser (inline) or just make them downloadable (attachment).' =>
            'Membolehkan memilih antara menunjukkan lampiran tiket dalam pelayar (sebaris) atau hanya membuat mereka dimuat turun (lampiran).',
        'Makes the application check the MX record of email addresses before sending an email or submitting a telephone or email ticket.' =>
            'Membuatkan aplikasi menyemak rekod MX alamat emel sebelum menghantar emel atau menyerahakan tiket telefon atau emel.',
        'Defines the address of a dedicated DNS server, if necessary, for the "CheckMXRecord" look-ups.' =>
            'Mentakrifkan alamat server DNS yangng berdedikasi, jika perlu, untuk melihat "CheckMXRecord".',
        'Sets the timeout (in seconds) for DNS resolver queries.' => '',
        'Makes the application check the syntax of email addresses.' => 'Membuatkan aplikasi menyemak sintaks alamat emel.',
        'Defines a regular expression that excludes some addresses from the syntax check (if "CheckEmailAddresses" is set to "Yes"). Please enter a regex in this field for email addresses, that aren\'t syntactically valid, but are necessary for the system (i.e. "root@localhost").' =>
            'Mentakrifkan ungkapan biasa yang tidak termasuk sebarang alamat daripada menyemak syntax (jika "CheckEmailAddress" diset kepada "Ya"). Sila masukkan regex dalam bidang ini untuk alamat e-mel, yang tidak sah syntaxnya, tetapi diperlukan oleh sistem (contoh "root@localhost").',
        'Defines a regular expression that filters all email addresses that should not be used in the application.' =>
            'Mentakrifkan ungkapan biasa yang menapis semua alamat e-mel yang tidak patut digunakan dalam aplikasi.',
        'Determines the way the linked objects are displayed in each zoom mask.' =>
            'Menentukan cara objek yang dipaut dipamerkan di dalam setiap zoom mask.',
        'Determines if a button to delete a link should be displayed next to each link in each zoom mask.' =>
            '',
        'Defines the link type \'Normal\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Mentakrifkan pautan jenis \'Normal\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah yang tidak berhala tuju; sebaliknya, hasil akan memberikan pautan yang mempunyai hala tuju.',
        'Defines the link type \'ParentChild\'. If the source name and the target name contain the same value, the resulting link is a non-directional one; otherwise, the result is a directional link.' =>
            'Mentakrifkan pautan jenis \'ParentChild\'. Jika nama sumber dan nama sasaran mengandungi nilai yang sama, pautan yang terhasil adalah yang tidak berhala tuju; sebaliknya, hasil akan memberikan pautan yang mempunyai hala tuju.',
        'Defines the link type groups. The link types of the same group cancel one another. Example: If ticket A is linked per a \'Normal\' link with ticket B, then these tickets could not be additionally linked with link of a \'ParentChild\' relationship.' =>
            'Mentakrifkan pautan jenis kumpulan. Jenis pautan dari kumpulan yang sama membatalkan satu sama lain. Contoh: Jika tiket A dipaut kan mengunakan pautan \'Normal\' bersama tiket B, maka tiket ini tidak boleh menambah pautan bersama pautan dari hubungan \'ParentChild\'.',
        'Defines the log module for the system. "File" writes all messages in a given logfile, "SysLog" uses the syslog daemon of the system, e.g. syslogd.' =>
            'Mentakrifkan modul log untuk sistem. "File" menulis kesemua mesej dalam fail log yang diberi, "SysLog" menggunakan syslog daemon dari sistem, contoh: syslogd.',
        'If "SysLog" was selected for LogModule, a special log facility can be specified.' =>
            'Jika "SysLog" dipilih untuk LogModule, kemudahan log istimewa boleh ditentukan.',
        'If "SysLog" was selected for LogModule, the charset that should be used for logging can be specified.' =>
            'Jika "SysLog" dipilih untuk LogModule, set aksara yang sepatutnya digunakan untuk menlog boleh ditentukan.',
        'If "file" was selected for LogModule, a logfile must be specified. If the file doesn\'t exist, it will be created by the system.' =>
            'Jika "file" dipilih untuk LogModule, suatu logfile mesti ditentukan. Jika fail tersebut tidak wujud, ia akan dicipta oleh sistem.',
        'Adds a suffix with the actual year and month to the Znuny log file. A logfile for every month will be created.' =>
            'Tambah akhiran dengan tahun sebenar dan bulan untuk fail log Znuny. Satu fail log bagi setiap bulan akan diwujudkan.',
        'Set the minimum log level. If you select \'error\', just errors are logged. With \'debug\' you get all logging messages. The order of log levels is: \'debug\', \'info\', \'notice\' and \'error\'.' =>
            '',
        'Defines the module to send emails. "DoNotSendEmail" doesn\'t send emails at all. Any of the "SMTP" mechanisms use a specified (external) mailserver. "Sendmail" directly uses the sendmail binary of your operating system. "Test" doesn\'t send emails, but writes them to $OTRS_HOME/var/tmp/CacheFileStorable/EmailTest/ for testing purposes.' =>
            '',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the mailhost that sends out the mails must be specified.' =>
            'Jika satu daripada mekanisme "SMTP" dipilih sebagai SendmailModule, hos mel yang menghantar mel keluar mesti ditentukan.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, the port where your mailserver is listening for incoming connections must be specified.' =>
            'Jika satu daripada mekanisme "SMTP" dipilih sebagai SendmailModule, port dimana server mel anda mendengar untuk sambungan masuk mesti ditentukan.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, an username must be specified.' =>
            'Jika satu daripada mekanisme "SMTP" dipilih sebagai SendmailModule, dan pengesahan kepada server mel diperlukan, nama pengguna mesti ditentukan.',
        'If any of the "SMTP" mechanisms was selected as SendmailModule, and authentication to the mail server is needed, a password must be specified.' =>
            'Jika satu daripada mekanisme "SMTP" dipilih sebagai SendmailModule, dan pengesahan kepada server mel diperlukan, katalalun mesti ditentukan.',
        'Sends all outgoing email via bcc to the specified address. Please use this only for backup reasons.' =>
            'Hantar kesemua emel keluar melalui bcc kepada alamat tertentu. Sila guna ini hanya untuk tindak balas sokongan.',
        'If set, this address is used as envelope sender in outgoing messages (not notifications - see below). If no address is specified, the envelope sender is equal to queue e-mail address.' =>
            'Jika ditetapkan, alamat ini digunakan sebagai sampul surat penghantar dalam mesej keluar (bukan pemberitahuan - lihat di bawah). Jika tiada alamat dinyatakan, pengguna sampul surat itu adalah sama dengan barisan alamat emel.',
        'If set, this address is used as envelope sender header in outgoing notifications. If no address is specified, the envelope sender header is empty (unless SendmailNotificationEnvelopeFrom::FallbackToEmailFrom is set).' =>
            '',
        'If no SendmailNotificationEnvelopeFrom is specified, this setting makes it possible to use the email\'s from address instead of an empty envelope sender (required in certain mail server configurations).' =>
            '',
        'Forces encoding of outgoing emails (7bit|8bit|quoted-printable|base64).' =>
            'Memaksa pengekodan emel keluar (7bit|8bit|quoted-printable|base64).',
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
        'Defines an alternate URL, where the login link refers to.' => 'Mentakrifkan URL gantian, dimana pautan log masuk merujuk kepada.',
        'Defines an alternate URL, where the logout link refers to.' => 'Mentakrifkan URL gantian, dimana pautan log keluar merujuk kepada.',
        'Defines a useful module to load specific user options or to display news.' =>
            'Mentakrifkan modul yang berguna untuk memuatkan pilihan pengguna tertentu atau memaparkan berita.',
        'Defines the key to be checked with Kernel::Modules::AgentInfo module. If this user preferences key is true, the message is accepted by the system.' =>
            'Mentakrifkan kunci untuk disemak bersama modul Kernel::Modues""AgentInfo. Jika tetapan kunci pengguna ini benar, mesej akan diterima oleh sistem.',
        'File that is displayed in the Kernel::Modules::AgentInfo module, if located under Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.' =>
            'Fail yang dipamerkan di dalam modul Kernel::Modules::AgentInfo, jika terletak di bawah Kernel/Output/HTML/Templates/Standard/AgentInfo.tt.',
        'Defines the module to generate code for periodic page reloads.' =>
            'Mentakrifkan modul untuk menghasilkan kod untuk isian semula halaman berkala.',
        'Defines the module to display a notification in the agent interface, if the system is used by the admin user (normally you shouldn\'t work as admin).' =>
            'Mentakrifkan modul untuk mempamerkan notifikasi dalam paparan ejen, jika sistem digunakan oleh pengguna admin (kebiasaannya anda tidak patut berkerja sebagai admin).',
        'Defines the module that shows all the currently logged in agents in the agent interface.' =>
            'Mentakrifkan modul yang menunjukkan kesemua ejen yang sedang log masuk dalam paparan ejen.',
        'Defines the module that shows all the currently logged in customers in the agent interface.' =>
            '',
        'Defines the module to display a notification in the agent interface, if there are modified sysconfig settings that are not deployed yet.' =>
            '',
        'Defines the module to display a notification in the agent interface, if there are invalid sysconfig settings deployed.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having out-of-office active.' =>
            'Mentakrifkan modul untuk mempamerkan notifikasi dalam paparan ejen, jika ejen menlog keluar semasa out-of-office aktif.',
        'Defines the module to display a notification in the agent interface, if the agent is logged in while having system maintenance active.' =>
            'Mentakrifkan modul untuk memaparkan pemberitahuan dalam antara muka ejen, jika ejen log masuk sambil mengalami penyelenggaraan sistem aktif.',
        'Defines the module to display a notification in the agent interface if the system configuration is out of sync.' =>
            '',
        'Defines the module to display a notification in the agent interface, if the agent has not yet selected a time zone.' =>
            '',
        'Defines the module that shows a generic notification in the agent interface. Either "Text" - if configured - or the contents of "File" will be displayed.' =>
            'Mentakrifkan modul yang menunjukkan notifikasi generik dalam paparan ejen. Samada "Text" - jika dikonfigurasi - atau isi kandungan "File" akan dipamerkan.',
        'Defines the module used to store the session data. With "DB" the frontend server can be splitted from the db server. "FS" is faster.' =>
            'Mentakrifkan modul digunakan untuk menyimpan data sesi. Dengan "DB" server frontend boleh dipisahkan dari server db. "FS" adalah lebih laju.',
        'Defines the name of the session key. E.g. Session, SessionID or Znuny.' =>
            'Mentakrifkan nama kunic sesi. Contoh: Session, SessionID atau Znuny.',
        'Defines the name of the key for customer sessions.' => 'Mentakrifkan nama kunci untuk sesi pelanggan.',
        'Turns on the remote ip address check. It should not be enabled if the application is used, for example, via a proxy farm or a dialup connection, because the remote ip address is mostly different for the requests.' =>
            '',
        'Deletes a session if the session id is used with an invalid remote IP address.' =>
            'Memadam sesuatu sesi jika id sesi digunakan bersama alamat IP jarak jauh yang tidak sah.',
        'Defines the maximal valid time (in seconds) for a session id.' =>
            'Mentakrifkan masa sah  maksima (dalam saat) untuk satu id sesi.',
        'Sets the inactivity time (in seconds) to pass before a session is killed and a user is logged out.' =>
            '',
        'Deletes requested sessions if they have timed out.' => 'Memadam sesi yang diminta jika mereka telah tamat masa.',
        'Makes the session management use html cookies. If html cookies are disabled or if the client browser disabled html cookies, then the system will work as usual and append the session id to the links.' =>
            'Membuatkan pengurusan sesi menggunakan cookies html. Jika cookies html dimatikan atau browser klien matikan cookies html, sistem akan berjalan seperti biasa dan melampirkan id sesi kepada pautan.',
        'Stores cookies after the browser has been closed.' => 'Menyimpan cookies selepas browser telah ditutup.',
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
            'Jika "DB" dipilih untuk SessionModule, direktori dimana data sesi akan disimpan mesti ditentukan.',
        'If "DB" was selected for SessionModule, a table in database where session data will be stored must be specified.' =>
            'Jika "DB" dipilih untuk SessionModule, jadual di dalam pangakalan data dimana data sesi akan disimpan mesti ditentukan.',
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
        'Maximum Number of a calendar shown in a dropdown.' => '',
        'Define the start day of the week for the date picker.' => 'Menetukan hari permulaan mingguan untuk pemilih tarikh.',
        'Adds the permanent vacation days.' => '',
        'Adds the one time vacation days.' => '',
        'Defines the hours and week days to count the working time.' => 'Mentakrifkan jam dan minggu hari untuk mengira masa berkerja.',
        'Defines the name of the indicated calendar.' => 'Mentakrifkan nama kalendar yang dinyatakan.',
        'Defines the time zone of the indicated calendar, which can be assigned later to a specific queue.' =>
            'Mentakrifkan zon masa dari kalendar yang dinyatakan, dimana ia boleh ditetapkan kemudian kepada aturan yang tertentu.',
        'Define the start day of the week for the date picker for the indicated calendar.' =>
            'Menentukan hari permulaan minggu untuk pemilih tarikh untuk kalendar yang ditunjukkan.',
        'Adds the permanent vacation days for the indicated calendar.' =>
            '',
        'Adds the one time vacation days for the indicated calendar.' => '',
        'Defines the hours and week days of the indicated calendar, to count the working time.' =>
            'Mentakrifkan jam dan minggu hari dari kalendar yang dinyatakan, untuk mengira masa berkerja.',
        'Defines the maximal size (in bytes) for file uploads via the browser. Warning: Setting this option to a value which is too low could cause many masks in your Znuny instance to stop working (probably any mask which takes input from the user).' =>
            'Mentakrifkan saiz maksimum (dalam byte) untuk muat naik fail melalui pelayar. Amaran: Menetapkan pilihan ini kepada nilai yang terlalu rendah boleh menyebabkan banyak topeng dalam hal Znuny anda berhenti kerja (mungkin apa-apa topeng yang mengambil input daripada pengguna).',
        'Selects the module to handle uploads via the web interface. "DB" stores all uploads in the database, "FS" uses the file system.' =>
            'Memilih modul untuk mengendalikan Gambar melalui paparan web. "DB" menyimpan semua Gambar dalam pangkalan data, "FS" menggunakan sistem fail.',
        'Specifies the text that should appear in the log file to denote a CGI script entry.' =>
            'Menentukan teks yang patut muncul dalam fail log untuk menunjukkan kemasukan skrip CGI.',
        'Defines the filter that processes the text in the articles, in order to highlight URLs.' =>
            'Mentakrifkan penapis yang memproses teks di dalam artikel, untuk menampakan URLs.',
        'Activates lost password feature for agents, in the agent interface.' =>
            'Mengaktifkan ciri kata kunci yang hilang untuk ejen, di dalam interface ejen',
        'Shows the message of the day on login screen of the agent interface.' =>
            'Menunjukkan mesej untuk hari itu pada srin log masuk dari paparan ejen.',
        'Runs the system in "Demo" mode. If enabled, agents can change preferences, such as selection of language and theme via the agent web interface. These changes are only valid for the current session. It will not be possible for agents to change their passwords.' =>
            '',
        'Allows the administrators to login as other users, via the users administration panel.' =>
            'Membolehkan mempunyai format tiket gambaran kecil (CustomerInfo => 1 - juga menunjukkan maklumat pelanggan).',
        'Allows the administrators to login as other customers, via the customer user administration panel.' =>
            'Membenarkan pentadbir untuk log masuk sebagai pelanggan lain, melalui panel pentadbir pengguna pelanggan.',
        'Specifies the group where the user needs rw permissions so that he can access the "SwitchToCustomer" feature.' =>
            'Menentukan kumpulan di mana pengguna perlu kebenaran rw supaya dapat mengakses ciri "SwitchToCustomer". ',
        'Sets the timeout (in seconds) for http/ftp downloads.' => 'Tetapkan masa tamat (dalam saat) untuk http/ftp muat turun.',
        'Defines the connections for http/ftp, via a proxy.' => 'Mentakrifkan sambungan untuk http/ftp, melalui proksi.',
        'Turns off SSL certificate validation, for example if you use a transparent HTTPS proxy. Use at your own risk!' =>
            'Mematikan pengesahan sijil SSL, sebagai contoh jika anda menggunakan proksi HTTP telus. Gunakan pada risiko anda sendiri!',
        'Enables file upload in the package manager frontend.' => 'Membolehkan muat naik fail dalam frontend pengurusan pakej.',
        'Defines the location to get online repository list for additional packages. The first available result will be used.' =>
            'Mentakrifkan lokasi untuk mendapatkan senarai repositori dalam talian untuk pakej tambahan. Hasil pertama yang tersedia akan digunakan.',
        'List of online package repositories.' => '',
        'Defines the IP regular expression for accessing the local repository. You need to enable this to have access to your local repository and the package::RepositoryList is required on the remote host.' =>
            'Mentakrifkan ungkapan biasa IP untuk mengakses repositori tempatan. Anda perlu untuk membolehkan ini untuk mempunyai akses untuk repositori tempatan anda dan package::RepositoryList adalah diperlukan pada hos jauh.',
        'Sets the timeout (in seconds) for package downloads. Overwrites "WebUserAgent::Timeout".' =>
            'Tetapkan masa tamat (dalam saat) untuk muat turun pakej. Menggantikan "WebUserAgent::Timeout".',
        'Fetches packages via proxy. Overwrites "WebUserAgent::Proxy".' =>
            'Memperoleh pakej menggunakan proxy. Mengganti "WebUserAgent::Proxy".',
        'If this setting is enabled, local modifications will not be highlighted as errors in the package manager and support data collector.' =>
            '',
        'Package event module file a scheduler task for update registration.' =>
            'Pakej modul acara memfailkan tugas penjadual untuk kemaskini pendaftaran.',
        'List of all Package events to be displayed in the GUI.' => 'Senarai semua acara Pakej untuk dipaparkan dalam GUI.',
        'List of all DynamicField events to be displayed in the GUI.' => 'Senarai semua acara MedanDinamik untuk dipaparkan dalam GUI.',
        'List of all LinkObject events to be displayed in the GUI.' => '',
        'DynamicField object registration.' => 'pendaftaran objek DynamicField',
        'Defines the username to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Mentakrifkan nama pengguna untuk akses SOAP handle (bin/cgi-bin/rpc.pl).',
        'Defines the password to access the SOAP handle (bin/cgi-bin/rpc.pl).' =>
            'Mentakrifkan katalaluan untuk akses SOAP handle',
        'Enable keep-alive connection header for SOAP responses.' => 'Membolehkan sambungan header terus disimpan untuk jawapan SOAP.',
        'Specifies the path of the file for the logo in the page header (gif|jpg|png).' =>
            '',
        'Size of the logo in the page header.' => '',
        'Defines the standard size of PDF pages.' => 'Mentakrifkan saiz standard mukasurat PDF.',
        'Defines the maximum number of pages per PDF file.' => 'Mentakrifkan nombor maksima mukasurat untuk satu fail PDF.',
        'Defines the path and TTF-File to handle proportional font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font proportional dalam dokumen PDF.',
        'Defines the path and TTF-File to handle bold proportional font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font proportional tebal dalam dokumen PDF.',
        'Defines the path and TTF-File to handle italic proportional font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font propotional italik dalam dokumen PDF.',
        'Defines the path and TTF-File to handle bold italic proportional font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font propotional italik tebal dalam dokumen PDF.',
        'Defines the path and TTF-File to handle monospaced font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font monospaced dalam dokumen PDF.',
        'Defines the path and TTF-File to handle bold monospaced font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font monospaced tebal dalam dokumen PDF.',
        'Defines the path and TTF-File to handle italic monospaced font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font monospaced italik dalam dokumen PDF.',
        'Defines the path and TTF-File to handle bold italic monospaced font in PDF documents.' =>
            'Mentakrifkan laluan dan TTF-File untuk mengendalikan font monospaced italik tebal dalam dokumen PDF.',
        'Enables PGP support. When PGP support is enabled for signing and encrypting mail, it is HIGHLY recommended that the web server runs as the Znuny user. Otherwise, there will be problems with the privileges when accessing .gnupg folder.' =>
            'Mendayakan sokongan PGP. Apabila sokongan PGP didayakan untuk menandatangani dan mengekodkan mel, ia amat disyorkan bahawa pelayan web dijalankan sebagai pengguna Znuny. Jika tidak, akan ada masalah dengan keistimewaan semasa mengakses fail .gnupg.',
        'Defines the path to PGP binary.' => 'Mentakrifkan laluan ke binari PGP',
        'Sets the options for PGP binary.' => 'Tetapkan pilihan untuk binari PGP.',
        'Sets the preferred digest to be used for PGP binary.' => '',
        'Sets the password for private PGP key.' => 'Tetapkan katalaluan untuk kunci PGP private.',
        'Enable this if you trust in all your public and private pgp keys, even if they are not certified with a trusted signature.' =>
            '',
        'Configure your own log text for PGP.' => 'Konfigur teks log anda sendiri untuk PGP.',
        'Sets the method PGP will use to sing and encrypt emails. Note Inline method is not compatible with RichText messages.' =>
            '',
        'Enables S/MIME support.' => 'Mengaktifkan sokongan S/MIME.',
        'Defines the path to open ssl binary. It may need a HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).' =>
            'Mentakrifkan laluan ke binari open ssl. Ia mungkin memerlukan satu HOME env ($ENV{HOME} = \'/var/lib/wwwrun\';).',
        'Specifies the directory where SSL certificates are stored.' => 'Tentukan direktori dimana perakuan SSL disimpan.',
        'Specifies the directory where private SSL certificates are stored.' =>
            'Tentukan direktori dimana perakuan SSL private disimpan.',
        'Cache time in seconds for the SSL certificate attributes.' => 'Masa Cache dalam saat untuk sifat pensijilan SSL.',
        'Enables fetch S/MIME from CustomerUser backend support.' => '',
        'Specifies the name that should be used by the application when sending notifications. The sender name is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com).' =>
            'Menentukan nama yang harus digunakan oleh permohonan apabila menghantar pemberitahuan. Nama penghantar digunakan untuk membina nama paparan lengkap untuk pemberitahuan master (contoh: "Znuny Notifications" znuny@your.example.com).',
        'Specifies the email address that should be used by the application when sending notifications. The email address is used to build the complete display name for the notification master (i.e. "Znuny Notifications" znuny@your.example.com). You can use the OTRS_CONFIG_FQDN variable as set in your configuation, or choose another email address.' =>
            'Menentukan alamat emel yang harus digunakan oleh permohonan penghantaran pemberitahuan. Alamat emel digunakan untuk membina nama paparan lengkap untuk pemberitahuan master (contoh: "Znuny Notifications" znuny@your.example.com). Anda boleh menggunakan pemboleh ubah OTRS_CONFIG_FQDN seperti diset dalam konfigurasi anda, atau memilih alamt emel yang lain.',
        'Defines the subject for notification mails sent to agents, with token about new requested password.' =>
            'Mentakrifkan subjek mel notifikasi dihantar kepada ejen, dengan token mengenai katalaluan baru yang diminta.',
        'Defines the body text for notification mails sent to agents, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to agents, about new password.' =>
            'Mentakrifkan subjek untuk mel notifikasi dihantar kepada ejen, mengenai katalauan baru.',
        'Defines the body text for notification mails sent to agents, about new password.' =>
            '',
        'Standard available permissions for agents within the application. If more permissions are needed, they can be entered here. Permissions must be defined to be effective. Some other good permissions have also been provided built-in: note, close, pending, customer, freetext, move, compose, responsible, forward, and bounce. Make sure that "rw" is always the last registered permission.' =>
            'Standard kebenaran disediakan untuk ejen dalam aplikasi. Jika lebih banyak kebenaran yang diperlukan, mereka boleh dimasukkan di sini. Kebenaran mesti ditakrifkan untuk menjadi berkesan. Beberapa kebenaran lain yang baik juga telah disediakan terbina dalam: Note, close pending, customer, freetext, move, compose, responsible, forward, dan bounce. Pastikan bahawa "rw" sentiasa kebenaran berdaftar terakhir.',
        'Defines the standard permissions available for customers within the application. If more permissions are needed, you can enter them here. Permissions must be hard coded to be effective. Please ensure, when adding any of the afore mentioned permissions, that the "rw" permission remains the last entry.' =>
            'Mentakrifkan kebenaran standard disediakan untuk pelanggan dalam aplikai. Jika lebih banyak kebenaran yang diperlukan, anda boleh masukkan mereka di sini. Kebenaran mesti "hard coded" untuk berkesan. Sila pastikan, apabila menambah mana-mana satu kebenaran yang dinyatakan, bahawa kebenaran "rw" kekal kemasukan terakhir.',
        'This setting allows you to override the built-in country list with your own list of countries. This is particularly handy if you just want to use a small select group of countries.' =>
            'Tetapan ini membolehkan anda untuk mengatasi senarai negara yang dibina dalam sistem dengan senarai negara anda sendiri. Ini berguna khususnya jika anda hanya mahu menggunakan kumpulan kecil negara.',
        'Enables performance log (to log the page response time). It will affect the system performance. Frontend::Module###AdminPerformanceLog must be enabled.' =>
            'Mengaktifkan log prestasi (untuk menlog masa tindak balas halaman). Ia akan menjejaskan prestasi sistem. Frontend::Module###AdminPerformanceLog mesti diaktifkan.',
        'Specifies the path of the file for the performance log.' => 'Menentukan laluan fail untuk log prestasi.',
        'Defines the maximum size (in MB) of the log file.' => 'Mentakrifkan saiz maksima (dalam MB) fail log.',
        'Defines the two-factor module to authenticate agents.' => 'Mentakrifkan modul dua-faktor untuk mengesahkan agen.',
        'Defines the agent preferences key where the shared secret key is stored.' =>
            'Mentakrifkan kunci keutamaan ejen di mana kunci rahsia yang dikongsi disimpan.',
        'Defines if agents should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Mentakrifkan jika ejen harus dibenarkan untuk log masuk jika mereka tidak mempunyai rahsia dikongsi disimpan di dalam pilihan mereka dan oleh itu tidak menggunakan pengesahan dua faktor.',
        'Defines if the previously valid token should be accepted for authentication. This is slightly less secure but gives users 30 seconds more time to enter their one-time password.' =>
            'Mentakrifkan jika cara yang sebelum ini sah perlu diterima untuk pengesahan. Ini adalah sedikit kurang selamat tetapi memberi pengguna 30 saat lebih banyak masa untuk memasukkan kata laluan berkadar sekali mereka.',
        'Defines the name of the table where the user preferences are stored.' =>
            '',
        'Defines the column to store the keys for the preferences table.' =>
            'Mentakrifkan ruangan untuk menyimpan kunci untuk jadual keutamaan.',
        'Defines the name of the column to store the data in the preferences table.' =>
            'Mentakrifkan nama kolum untuk menyimpan data dalam jadual tetapan.',
        'Defines the name of the column to store the user identifier in the preferences table.' =>
            'Mentakrifkan nama kolum untuk menyimpan pengenal pasti pelanggan dalam jadual tetapan.',
        'Defines the config parameters of this item, to be shown in the preferences view. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control). \'PasswordMaxLoginFailed\' allows to set an agent to invalid-temporarily if max failed logins reached. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Gives end users the possibility to override the separator character for CSV files, defined in the translation files. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the users avatar. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'Defines the user identifier for the customer panel.' => 'Mentakrifkan pengecam pengguna untuk panel pelanggan.',
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
        'Defines an alternate login URL for the customer panel..' => 'Mentakrifkan URL log masuk gantian untuk panel pelanggan..',
        'Defines an alternate logout URL for the customer panel.' => 'Mentakrifkan URL log keluar gantian untuk panel pelanggan.',
        'Defines a customer item, which generates a google maps icon at the end of a customer info block.' =>
            'Mentakrifkan item pelanggan, yang menjana ikon peta google pada akhir blok info pelanggan.',
        'Defines a customer item, which generates a google icon at the end of a customer info block.' =>
            'Mentakrifkan item pelanggan, yang menjana ikon google pada akhir blok info pelanggan.',
        'Defines a customer item, which generates a LinkedIn icon at the end of a customer info block.' =>
            'Mentakrifkan item pelanggan, yang menjana ikon LinkedIn pada akhir blok info pelanggan.',
        'Defines a customer item, which generates a XING icon at the end of a customer info block.' =>
            'Mentakrifkan item pelanggan, yang menjana ikon XING pada akhir blok info pelanggan.',
        'This module and its PreRun() function will be executed, if defined, for every request. This module is useful to check some user options or to display news about new applications.' =>
            'Modul ini dan fungsi PreRun() akan dilaksanankan, jika ditakrifkan, untuk setiap permintaan. Modul ini berguna untuk semak beberapa pilihan pengguna atau untuk mempamerkan berita mengenai aplikasi baru.',
        'Defines the key to check with CustomerAccept. If this user preferences key is true, then the message is accepted by the system.' =>
            'Mentakrifkan kunci untuk disemak bersama CustomerAccept. Jika tetapan kunci pengguna ini adalah benar, mesej itu akan diterima oleh sistem.',
        'Defines the path of the shown info file, that is located under Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.' =>
            'Mentakrifkan laluan maklumat fail yang ditunjukkan, yang terletak di bawah Kernel/Output/HTML/Templates/Standard/CustomerAccept.tt.',
        'Activates lost password feature for customers.' => 'Mengaktifkan ciri kata kunci yang hilang untuk pelanggan.',
        'Enables customers to create their own accounts.' => 'Membolehkan pelanggan untuk mencipta akaun mereka sendiri.',
        'If active, one of the regular expressions has to match the user\'s email address to allow registration.' =>
            'Jika aktif, salah satu ungkapan biasa perlu serasi dengan alamat emel pengguna untuk  membenarkan pendaftaran.',
        'If active, none of the regular expressions may match the user\'s email address to allow registration.' =>
            'Jika aktif, tiada ungkapan biasa boleh serasi dengan alamat emel pengguna untuk membenarkan pendaftaran.',
        'Defines the subject for notification mails sent to customers, with token about new requested password.' =>
            'Mentakrifkan subjek untuk mel notfikasi dihantar kepada pelanggan, dengan token mengenai katalaluan baru yang diminta.',
        'Defines the body text for notification mails sent to customers, with token about new requested password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new password.' =>
            'Mentakrifkan subjek untuk mel notfikasi dihantar kepada pelanggan, mengenai katalaluan baru.',
        'Defines the body text for notification mails sent to customers, about new password.' =>
            '',
        'Defines the subject for notification mails sent to customers, about new account.' =>
            'Mentakrifkan subjek untuk mel notfikasi dihantar kepada pelanggan, mengenai akaun baru.',
        'Defines the body text for notification mails sent to customers, about new account.' =>
            'Mentakrifkan teks badan untuk mel pemberitahuan dihantar kepada pelanggan, tentang akaun baru.',
        'Defines the module to authenticate customers.' => 'Mentakrifkan modul untuk mengesahkan pelanggan.',
        'If "DB" was selected for Customer::AuthModule, the encryption type of passwords must be specified.' =>
            '',
        'If "bcrypt" was selected for CryptType, use cost specified here for bcrypt hashing. Currently max. supported cost value is 31.' =>
            '',
        'If "DB" was selected for Customer::AuthModule, the name of the table where your customer data should be stored must be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, nama untuk jadual dimana data pelanggan anda disimpankan mesti ditentukan.',
        'If "DB" was selected for Customer::AuthModule, the name of the column for the CustomerKey in the customer table must be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, nama kolum untuk CustomerKey dalam  jadual pelanggan mesti ditentukan.',
        'If "DB" was selected for Customer::AuthModule, the column name for the CustomerPassword in the customer table must be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, nama kolum untuj CustomerPassword dalam jadual pelanggan mesti ditentukan.',
        'If "DB" was selected for Customer::AuthModule, the DSN for the connection to the customer table must be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, DSN untuk sambungan ke jadual pelanggan mesti ditentukan.',
        'If "DB" was selected for Customer::AuthModule, a username to connect to the customer table can be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, nama pengguna untuk sambung ke jadual pelanggan boleh ditentukan.',
        'If "DB" was selected for Customer::AuthModule, a password to connect to the customer table can be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, katalaluan untuk sambung ke jadual pelanggan boleh ditentukan.',
        'If "DB" was selected for Customer::AuthModule, a database driver (normally autodetection is used) can be specified.' =>
            'Jika "DB" dipilih untuk Customer::AuthModule, pemacu pangkalan data (biasanya pengesanan auto akan digunakan) boleh ditentukan.',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify to strip leading parts of user names (e. g. for domains like example_domain\user to user).' =>
            'Jika "HTTPBasicAuth" dipilih untuk Customer::AuthModule, anda boleh tentukan untuk lucutkan bahagian nama pengguna (cth: untuk domain seperti example_domain\user to user).',
        'If "HTTPBasicAuth" was selected for Customer::AuthModule, you can specify (by using a RegExp) to strip parts of REMOTE_USER (e. g. for to remove trailing domains). RegExp-Note, $1 will be the new Login.' =>
            'Jika "HTTPBasicAuth" dipilih untuk Customer::AuthModule, anda boleh tentukan (dengan menggunakan RegExp) untuk lucutkan bahagian dari REMOTE_USER (cth: untuk membuang trailing domain). RegExp-Note, $1 akan jadi log masuk yang baru.',
        'If "LDAP" was selected for Customer::AuthModule, the LDAP host can be specified.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, hos LDAP mesti ditentukan.',
        'If "LDAP" was selected for Customer::AuthModule, the BaseDN must be specified.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, BaseDN mesti ditentukan',
        'If "LDAP" was selected for Customer::AuthModule, the user identifier must be specified.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, pengecam pengguna mesti ditentukan.',
        'If "LDAP" was selected for Customer::Authmodule, you can check if the user is allowed to authenticate because he is in a posixGroup, e.g. user needs to be in a group xyz to use Znuny. Specify the group, who may access the system.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, anda boleh semak jika pengguna dibenarkan untuk mengesahkan sebab pengguna tersebut berada dalam posixGroup, cth: pengguna perlu berada di dalam kumpulan xyz untuk gunaOTRS. Tentukan kumpulan tersebut, siapa yang boleh akses sistem tersebut.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify access attributes here.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, anda boleh tentukan atribut akses disini.',
        'If "LDAP" was selected for Customer::AuthModule, user attributes can be specified. For LDAP posixGroups use UID, for non LDAP posixGroups use full user DN.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, atribut pengguna boleh ditentukan. Untuk LDAP posixGroups gne UID, untuk bukan LDAP posixGroups guna DN pengguna penuh.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the username for this special user here.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule dan pengguna anda hanya ada aksestanpa nama kepada pokok LDAP, tapi anda mahu cari melalui data itu, anda boleh lakukannya dengan pengguna yang mempunyai akses kepada direktori LDAP. Tentukan katalaluan untuk pengguna istimewa ini di sini.',
        'If "LDAP" was selected for Customer::AuthModule and your users have only anonymous access to the LDAP tree, but you want to search through the data, you can do this with a user who has access to the LDAP directory. Specify the password for this special user here.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule dan pengguna anda hanya ada aksestanpa nama kepada pokok LDAP, tapi anda mahu cari melalui data itu, anda boleh lakukannya dengan pengguna yang mempunyai akses kepada direktori LDAP. Tentukan katalaluan untuk pengguna istimewa ini di sini.',
        'If "LDAP" was selected, you can add a filter to each LDAP query, e.g. (mail=*), (objectclass=user) or (!objectclass=computer).' =>
            'Jika "LDAP" dipilih, anda boleh menambah penapis untuk setiap aturan LDAP, cth: (mail=*), (objectclass=user) atau (!objectclass=computer).',
        'If "LDAP" was selected for Customer::AuthModule and if you want to add a suffix to every customer login name, specifiy it here, e. g. you just want to write the username user but in your LDAP directory exists user@domain.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule dan jika anda mahu menambah akhiran kepada setiap nama log masuk pelanggan, tentukan ia disini, cthL anda hanya mahu menulis nama pengguna untuk pengguna tapi dalam direktori LDAP anda wujudnya user@domain.',
        'If "LDAP" was selected for Customer::AuthModule and special parameters are needed for the Net::LDAP perl module, you can specify them here. See "perldoc Net::LDAP" for more information about the parameters.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule dan parameter istimewa diperlkan untuk modul perl Net::LDAP, anda boleh tentukannya di sini. Lihat "perldoc Net::LDAP" untuk maklumat lebih mengenai parameter.',
        'If "LDAP" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Jika "LDAP" dipilih untuk Customer::AuthModule, anda boleh tentukan samada aplikasi akan berhenti jika cth: suatu sambungan kepada server tidak dapat dihubungi disebabkan masalah jaringan.',
        'If "Radius" was selected for Customer::AuthModule, the radius host must be specified.' =>
            'Jika "Radius" dipilih untuk Customer::AuthModule, hos radius mesti ditentukan.',
        'If "Radius" was selected for Customer::AuthModule, the password to authenticate to the radius host must be specified.' =>
            'Jika "Radius" dipilih untuk Customer::AuthModule, katalaluan untuk mengesahkan hos radius mesti ditentukan.',
        'If "Radius" was selected for Customer::AuthModule, you can specify if the applications will stop if e. g. a connection to a server can\'t be established due to network problems.' =>
            'Jika "Radius" dipilih untuk Customer::AuthModule, anda boleh tentukan samada aplikasi akan berhenti jika cth: suatu sambungan kepada server tidak dapat dihubungi disebabkan masalah jaringan.',
        'Defines the two-factor module to authenticate customers.' => 'Mentakrifkan modul dua-faktor untuk mengesahkan pelanggan.',
        'Defines the customer preferences key where the shared secret key is stored.' =>
            'Mentakrifkan kunci keutamaan pelanggan di mana kunci rahsia yang dikongsi disimpan.',
        'Defines if customers should be allowed to login if they have no shared secret stored in their preferences and therefore are not using two-factor authentication.' =>
            'Mentakrifkan jika pelanggan harus dibenarkan untuk log masuk jika mereka tidak mempunyai rahsia dikongsi disimpan di dalam pilihan mereka dan oleh itu tidak menggunakan pengesahan dua faktor.',
        'Defines the parameters for the customer preferences table.' => 'Mentakrifkan parameter untuk jadual tetapan pelanggan.',
        'Defines all the parameters for this item in the customer preferences. \'PasswordRegExp\' allows to match passwords against a regular expression. Define the minimum number of characters using \'PasswordMinSize\'. Define if at least 2 lowercase and 2 uppercase letter characters are needed by setting the appropriate option to \'1\'. \'PasswordMin2Characters\' defines if the password needs to contain at least 2 letter characters (set to 0 or 1). \'PasswordNeedDigit\' controls the need of at least 1 digit (set to 0 or 1 to control).' =>
            '',
        'Defines the config parameters of this item, to be shown in the preferences view.' =>
            'Mentakrifkan parameter konfig dari item ini, untuk dipamerkan  dalam lihat keutamaan.',
        'Defines all the parameters for this item in the customer preferences.' =>
            'Mentakrifkan semua parameter untuk item ini dalam keutamaan pelanggan.',
        'Parameters for the pages (in which the communication log entries are shown) of the communication log overview.' =>
            '',
        'Search backend router.' => 'Mencari router backend',
        'JavaScript function for the search frontend.' => 'Fungsi JavaScript untuk muka hadapan carian.',
        'Main menu registration.' => 'Menu utama pendaftaran',
        'Parameters for the dashboard backend of the customer company information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Parameters for the dashboard backend of the customer user information of the agent interface. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            '',
        'Search backend default router.' => 'Mencari router backend default.',
        'Defines available groups for the admin overview screen.' => '',
        'Frontend module registration (show personal favorites as sub navigation items of \'Admin\').' =>
            '',
        'Frontend module registration (disable company link if no company feature is used).' =>
            'Pendaftaran modul frontend (melumpuhkan pautan syarikat jika tiada fungsi syarikat yang digunakan).',
        'Frontend module registration for the customer interface.' => 'Pendaftaran modul frontend untuk paparan pelanggan.',
        'Activates the available themes on the system. Value 1 means active, 0 means inactive.' =>
            'Mengaktifkan tema yang disediajan di dalam sistem. Nilai 1 bermaksud aktif, 0 bermaksud tidak aktif.',
        'Defines the default value for the action parameter.' => '',
        'Defines the shown links in the footer area of the customer and public interface of this Znuny system. The value in "Key" is the external URL, the value in "Content" is the shown label.' =>
            '',
        'Defines the default value for the action parameter for the public frontend. The action parameter is used in the scripts of the system.' =>
            'Mentakrifkan nilai asal parameter tindakan untuk frontend umum. Paramater tindakan digunakan di dalam skrip daripada sistem.',
        'Sets the stats hook.' => 'Tetapkan hook status.',
        'Start number for statistics counting. Every new stat increments this number.' =>
            'Nombor permulaan untuk pengiraan statistik. Setiap kenaikan status baru nombor ini.',
        'Defines the default maximum number of statistics per page on the overview screen.' =>
            'Menentukan bilangan maksimum lalai statistik setiap halaman pada skrin gambaran keseluruhan.',
        'Defines the default selection at the drop down menu for dynamic objects (Form: Common Specification).' =>
            'Mentakrifkan pemilihan asal pada menu drop down untuk objek dinamik (Bentuk: Spesifikasi Biasa).',
        'Defines the default selection at the drop down menu for permissions (Form: Common Specification).' =>
            'Mentakrifkan pemilihan asal pada menu drop down untuk keizinan (Bentuk: Spesifikasi Biasa).',
        'Defines the default selection at the drop down menu for stats format (Form: Common Specification). Please insert the format key (see Stats::Format).' =>
            'Mentakrifkan pemilihan asal pada menu drop down untuk keizinan (Bentuk: Spesifikasi Biasa). Sila masukkan kunci format (lihar Stats::Format)',
        'Defines the search limit for the stats.' => 'Mentakrifkan had carian untuk status.',
        'Defines all the possible stats output formats.' => 'Mentakrifkan semua kemungkinan statistik format output.',
        'Allows agents to exchange the axis of a stat if they generate one.' =>
            'Membolehkan ejen untuk menukar paksi sesebuah status jika ia menghasilkan satu.',
        'Adds the following elements for use in stats: "Agent/Owner", "Created by Agent/Owner", "Responsible", "Accounted time by Agent".' =>
            '',
        'Allows invalid agents to be used in stats. Stats::UseAgentElementInStats must be active.' =>
            '',
        'Shows all the customer identifiers in a multi-select field (not useful if you have a lot of customer identifiers).' =>
            'Menunjukkan kesemua pengecam pelanggan dalam medan multi-select (tidak berguna jika anda ada banyak pengecam pelanggan).',
        'Shows all the customer user identifiers in a multi-select field (not useful if you have a lot of customer user identifiers).' =>
            '',
        'Defines the default maximum number of X-axis attributes for the time scale.' =>
            'Mentakrifkan nombor maksimum asal dari sifat-sifat paksi-x untuk skala masa.',
        'Znuny can use one or more readonly mirror databases for expensive operations like fulltext search or statistics generation. Here you can specify the DSN for the first mirror database.' =>
            'Znuny boleh menggunakan salah satu atau lebih pangkalan data cermin baca sahaja untuk operasi mahal seperti carian atau statistik teks penuh generasi. Di sini anda boleh menentukan DSN untuk pangkalan data cermin pertama.',
        'Specify the username to authenticate for the first mirror database.' =>
            'Nyatakan nama pengguna untuk mengesahkan pada pangkalan data cermin pertama.',
        'Specify the password to authenticate for the first mirror database.' =>
            'Nyatakan kata laluan untuk mengesahkan pada pangkalan data cermin pertama.',
        'Configure any additional readonly mirror databases that you want to use.' =>
            'Konfigurasi sebarang tambahan pangkalan data cermin baca sahaja yang anda mahu gunakan.',
        'Defines the parameters for the dashboard backend. "Limit" defines the number of entries displayed by default. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Defines the parameters for the dashboard backend. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Shows the message of the day (MOTD) in the agent dashboard. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'Starts a wildcard search of the active object after the link object mask is started.' =>
            'Memulakan carian wildcard pada objek aktif selepas pautan mask objek dimulakan.',
        'Defines a filter to process the text in the articles, in order to highlight predefined keywords.' =>
            'Mentakrifkan tapisan untuk memproses teks dalam artikel, dalam usaha untuk menyerlahkan kata kunci yang dipratentukan.',
        'Defines a filter for html output to add links behind CVE numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Mentakrifkan tapisan untuk output html untuk menambah pautan di belakang nombor CVE. Imej unsur membolehkan dua jenis input. Sekaligus nama satu imej (contoh faq.png). Dalam kes ini laluan imej Znuny akan digunakan. Kemungkinan yang kedua adalah memasukkan pautan pada imej.',
        'Defines a filter for html output to add links behind bugtraq numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Mentakrifkan tapisan untuk output html untuk menambah pautan di belakang nombor bugtraq. Imej unsur membolehkan dua jenis input. Sekaligus nama satu imej (contoh faq.png). Dalam kes ini laluan imej Znuny akan digunakan. Kemungkinan yang kedua adalah memasukkan pautan pada imej.',
        'Defines a filter for html output to add links behind MSBulletin numbers. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Mentakrifkan tapisan untuk output html untuk menambah pautan di belakang nombor MSBulletin. Imej unsur membolehkan dua jenis input. Sekaligus nama satu imej (contoh faq.png). Dalam kes ini laluan imej Znuny akan digunakan. Kemungkinan yang kedua adalah memasukkan pautan pada imej.',
        'Define a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Mentakrif tapisan untuk output html untuk menambah pautan di sebalik takrifan yang berkait. Imej unsur membolehkan 2 jenis input. Sekaligus nama sesuatu imej (Contohnya faq.png). Dalam kes ini laluan imej Znuny akan digunakan. Kemungkinan kedua adalah untuk memasukkan pautan kepada imej.',
        'Defines a filter for html output to add links behind a defined string. The element Image allows two input kinds. At once the name of an image (e.g. faq.png). In this case the Znuny image path will be used. The second possiblity is to insert the link to the image.' =>
            'Mentakrifkan tapisan untuk output html untuk menambah pautan di belakang string yang ditakrifkan. Imej unsur membolehkan dua jenis input. Sekaligus nama satu imej (contoh faq.png). Dalam kes ini laluan imej Znuny akan digunakan. Kemungkinan yang kedua adalah memasukkan pautan pada imej.',
        'If enabled, the Znuny version tag will be removed from the Webinterface, the HTTP headers and the X-Headers of outgoing mails. NOTE: If you change this option, please make sure to delete the cache.' =>
            '',
        'If enabled, Znuny will deliver all CSS files in minified form.' =>
            '',
        'If enabled, Znuny will deliver all JavaScript files in minified form.' =>
            'Jika diakifkan, Znuny akan menghantar kesemua fail JavaScript dalam bentuk yang dikecilkan.',
        'List of responsive CSS files to always be loaded for the agent interface.' =>
            'Senarai fail responsif CSS untuk sentiasa dimuatkan untuk paparan ejen.',
        'List of JS files to always be loaded for the admin interface.' =>
            '',
        'List of CSS files to always be loaded for the customer interface.' =>
            'Senarai fail CSS untuk sentiasa dimuatkan untuk paparan pelanggan.',
        'List of responsive CSS files to always be loaded for the customer interface.' =>
            'Senarai fail responsif CSS untuk sentiasa dimuatkan untuk paparan pelanggan.',
        'List of JS files to always be loaded for the customer interface.' =>
            'Senarai fail JS untuk sentiasa dimuatkan untuk paparan pelanggan.',
        'If enabled, the first level of the main menu opens on mouse hover (instead of click only).' =>
            'Jika diaktifkan, tahap pertama menu utama akan dibuka pada saat tetikus diatasnya (dan bukannya hanya dengan klik).',
        'Specifies the order in which the firstname and the lastname of agents will be displayed.' =>
            'Menentukan susunan di mana nama pertama dan nama akhir agen akan ditunjukkan.',
        'Default skin for the agent interface.' => 'Kulit default untuk antaramuka agen.',
        'Dark skin for the agent interface.' => '',
        'The agent skin\'s InternalName which should be used in the agent interface. Please check the available skins in Frontend::Agent::Skins.' =>
            'Kulit InternalName ejen yang patut digunakan dalam paparan ejen. Sila semak kulit yang tersedia dalam Frontend::Agent::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent agents, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Ia adalah mungkin untuk mengkonfigurasi kulit yang berbeza, contohnya untuk membezakan antara agen berbeza dari faktor, yang akan digunakan atas dasar per domain dalam aplikasi. Menggunakan ungkapan biasa (regex), anda boleh mengkonfigurasi sepasang Kunci / Kandungan untuk dipadankan domain. Nilai dalam "Key" harus sepadan domain, dan nilai dalam "Content" harus menjadi kulit yang sah pada sistem anda. Sila lihat catatan contoh untuk bentuk yang betul daripada regex.',
        'Default skin for the customer interface.' => 'Kulit default untuk antaramuka pelanggan.',
        'Dark skin for the customer interface.' => '',
        'The customer skin\'s InternalName which should be used in the customer interface. Please check the available skins in Frontend::Customer::Skins.' =>
            'Kulit InternalName pelanggan yang patut digunakan dalam paparan pelanggan. Sila semak kulit yang tersedia dalam Frontend::Customer::Skins.',
        'It is possible to configure different skins, for example to distinguish between diferent customers, to be used on a per-domain basis within the application. Using a regular expression (regex), you can configure a Key/Content pair to match a domain. The value in "Key" should match the domain, and the value in "Content" should be a valid skin on your system. Please see the example entries for the proper form of the regex.' =>
            'Ia adalah mungkin untuk mengkonfigurasi kulit yang berbeza, contohnya untuk membezakan antara pelanggan berbeza dari faktor, yang akan digunakan atas dasar per domain dalam aplikasi. Menggunakan ungkapan biasa (regex), anda boleh mengkonfigurasi sepasang Kunci / Kandungan untuk dipadankan domain. Nilai dalam "Key" harus sepadan domain, dan nilai dalam "Content" harus menjadi kulit yang sah pada sistem anda. Sila lihat catatan contoh untuk bentuk yang betul daripada regex.',
        'Shows time use complete description (days, hours, minutes), if enabled; or just first letter (d, h, m), if not enabled.' =>
            '',
        'Runs an initial wildcard search of the existing customer users when accessing the AdminCustomerUser module.' =>
            'Menjalankan carian wildcard awal daripada pengguna pelanggan yang sedia ada semasa mengakses modul AdminCustomerUser itu.',
        'Controls if the autocomplete field will be used for the customer ID selection in the AdminCustomerUser interface.' =>
            '',
        'Runs an initial wildcard search of the existing customer company when accessing the AdminCustomerCompany module.' =>
            'Menjalankan carian awal wildcard pada syarikat pelanggan sedia ada apabila mengakses modul AdminCustomerCompany.',
        'Controls if the admin is allowed to make changes to the database via AdminSelectBox.' =>
            'Kawal jika admin dibenarkan untuk membuat perubahan kepada pangkalan data melalui KotakPilihAdmin.',
        'List of all CustomerUser events to be displayed in the GUI.' => 'Senarai semua acara PenggunaPelanggan untuk dipaparkan dalam GUI.',
        'List of all CustomerCompany events to be displayed in the GUI.' =>
            'Senarai semua acara PelangganSyarikat untuk dipaparkan dalam GUI.',
        'Event module that updates customer users after an update of the Customer.' =>
            'Modul acara yang mengemaskini pengguna pelanggan selepas satu kemas kini Pelanggan.',
        'Event module that updates customer company object name for dynamic fields.' =>
            '',
        'Event module that updates customer user search profiles if login changes.' =>
            'Modul acara yang mengemaskini profil carian pengguna pelanggan jika log masuk berubah.',
        'Event module that updates customer user service membership if login changes.' =>
            'Modul acara yang mengemaskini keahlian perkhidmatan pengguna pelanggan jika log masuk berubah.',
        'Event module that updates customer user object name for dynamic fields.' =>
            '',
        'Selects the cache backend to use.' => 'Pilih bahagian belakang cache untuk digunakan.',
        'If enabled, the cache data be held in memory.' => '',
        'If enabled, the cache data will be stored in cache backend.' => '',
        'Specify how many sub directory levels to use when creating cache files. This should prevent too many cache files being in one directory.' =>
            'Berikan butir berapa banyak peringkat direktori sub untuk digunakan apabila mencipta fail cache. Ini sepatutnya mengelakkan terlalu banyak fail cache di dalam satu direktori.',
        'Defines the config options for the autocompletion feature.' => 'Mentakrifkan pilihan konfigurasi untuk ciri autolengkap.',
        'Defines the list of possible next actions on an error screen, a full path is required, then is possible to add external links if needed.' =>
            '',
        'Sets the minutes a notification is shown for notice about upcoming system maintenance period.' =>
            'Menetapkan minit pemberitahuan dipaparkan bagi notis mengenai tempoh penyelenggaraan sistem yang akan datang.',
        'Sets the default message for the notification is shown on a running system maintenance period.' =>
            'Set mesej default untuk pemberitahuan ditunjukkan pada tempoh menjalankan sistem penyelenggaraan.',
        'Sets the default message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Set mesej default untuk skrin login antara muka agen dan pelanggan, ia ditunjukkan apabila tempoh menjalankan sistem penyelenggaraan adalah aktif.',
        'Sets the default error message for the login screen on Agent and Customer interface, it\'s shown when a running system maintenance period is active.' =>
            'Set mesej ralat default untuk skrin log masuk dalam antara muka agen dan pelanggan, ia ditunjukkan apabila tempoh menjalankan sistem penyelenggaraan adalah aktif.',
        'Use new type of select and autocomplete fields in agent interface, where applicable (InputFields).' =>
            'Gunakan jenis pilih yang baru dan medan auto-lengkap dalam antara muka ejen, jika berkenaan (MedanInput).',
        'Use new type of select and autocomplete fields in customer interface, where applicable (InputFields).' =>
            'Gunakan jenis pilih yang baru dan medan auto-lengkap dalam antara muka pelanggan, jika berkenaan (MedanInput).',
        'Defines the fall-back path to open fetchmail binary. Note: The name of the binary needs to be \'fetchmail\', if it is different please use a symbolic link.' =>
            'Mentakrifkan laluan berundur untuk membuka fetchmail binari. Nota: Nama binari perlu \'fetchmail\', jika ia berbeza sila gunakan pautan simbolik.',
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
        'Cache time in seconds for the web service config backend.' => 'Masa Cache dalam saat untuk backend web config perkhidmatan.',
        'Cache time in seconds for agent authentication in the GenericInterface.' =>
            'Masa Cache dalam saat untuk pengesahan ejen dalam GenericInterface.',
        'Cache time in seconds for customer authentication in the GenericInterface.' =>
            'Masa Cache dalam saat untuk pengesahan pelanggan di GenericInterface.',
        'GenericInterface module registration for the transport layer.' =>
            'Pendaftaran modul GenericInterface untuk lapisan pengangkutan.',
        'GenericInterface module registration for the operation layer.' =>
            'Pendaftaran modul GenericInterface untuk lapisan operasi.',
        'GenericInterface module registration for the invoker layer.' => 'Pendaftaran modul GenericInterface untuk lapisan pencetus.',
        'GenericInterface module registration for the mapping layer.' => 'Pendaftaran modul GenericInterface untuk lapisan pemetaan.',
        'Defines the default visibility of the article to customer for this operation.' =>
            '',
        'Defines the history type for this operation, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk operasi ini, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for this operation, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk operasi ini, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the default auto response type of the article for this operation.' =>
            'Mentakrifkan jenis tindakbalas auto asal dari artikel untuk operasi ini.',
        'Defines the maximum size in KiloByte of GenericInterface responses that get logged to the gi_debugger_entry_content table.' =>
            'Mentakrifkan saiz maksimum dalam kilobait jawapan GenericInterface yang dapat log ke meja gi_debugger_entry_content.',
        'Maximum number of tickets to be displayed in the result of this operation.' =>
            'Jumlah tiket maksimum untuk dipamerkan di keputusan operasi ini.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of this operation.' =>
            'Mentakrifkan sifat tiket default untuk pengkelasan tiket dalam hasil carian tiket operasi ini. ',
        'Defines the default ticket order in the ticket search result of the this operation. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan arahan tiket default untuk pengkelasan tiket dalam hasil carian tiket operasi ini. Atas: Tertua di atas. Bawah: Terbaru di atas.',
        'GenericInterface module registration for an error handling module.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/ProcessManagement.xml
        'Frontend module registration (disable ticket processes screen if no process available).' =>
            'Pendaftaran modul frontend (melumpuhkan skrin proses tiket jika tiada terdapat proses).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate).' =>
            '',
        'This option defines the dynamic field in which a Process Management process entity id is stored.' =>
            'Pilihan ini mentakrifkan medan dinamik di mana id entiti proses Pengurusan Proses disimpan. ',
        'This option defines the dynamic field in which a Process Management activity entity id is stored.' =>
            'Pilihan ini mentakrifkan medan dinamik di mana id entiti aktiviti Pengurusan Proses disimpan.',
        'This option defines the process tickets default queue.' => 'Pilihan ini mentakrifkan barisan lalai tiket proses.',
        'This option defines the process tickets default state.' => 'Pilihan ini mentakrifkan keadaan lalai tiket proses.',
        'This option defines the process tickets default lock.' => 'Pilihan ini mentakrifkan kunci lalai tiket proses.',
        'This option defines the process tickets default priority.' => 'Pilihan ini mentakrifkan keutamaan lalai tiket proses.',
        'Display settings to override defaults for Process Tickets.' => 'Tetapan paparan untuk mengatasi lalai untuk Tiket Proses.',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key =&gt; My Group\', \'Content: Name_X, NameY\'.' =>
            '',
        'Dynamic fields shown in the process widget in ticket zoom screen of the agent interface.' =>
            '',
        'Shows a link in the menu to enroll a ticket into a process in the ticket zoom view of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk mendaftar tiket ke dalam proses dalam paparan zum tiket dari paparan ejen.',
        'Loader module registration for the customer interface.' => '',
        'Frontend module registration (disable ticket processes screen if no process available) for Customer.' =>
            'Pendaftaran modul frontend (melumpuhkan skrin proses tiket jika tiada terdapat proses) untuk Pelanggan.',
        'Default ProcessManagement entity prefixes for entity IDs that are automatically generated.' =>
            'Entiti prefix default ProcessManagement untuk ID entiti yang dijanakan secara automatik.',
        'Cache time in seconds for the DB process backend.' => 'Masa Cache dalam saat untuk backend proses DB.',
        'Cache time in seconds for the ticket process navigation bar output module.' =>
            'Masa Cache dalam saat untuk modul output navigasi bar proses tiket.',
        'Determines the next possible ticket states, for process tickets in the agent interface.' =>
            'Menetukan status tiket kemungkinan yang seterusnya, untuk tiket proses dalam paparan agen.',
        'Shows existing parent/child (separated by ::) process lists in the form of a tree or a list.' =>
            '',
        'Determines the next possible ticket states, for process tickets in the customer interface.' =>
            '',
        'Controls if CustomerID is read-only in the agent interface.' => '',
        'If enabled debugging information for transitions is logged.' => 'Jika maklumat nyahpepijat dibolehkan untuk peralihan sedang dilog.',
        'Defines the priority in which the information is logged and presented.' =>
            'Mentakrifkan keutamaan di mana maklumat direkod dan dibentangkan.',
        'Filter for debugging Transitions. Note: More filters can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Parameters for the dashboard backend of the running process tickets overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents.' =>
            '',
        'DynamicField backend registration.' => 'Pendaftaran backend DynamicField',
        'Defines the default keys and values for the transition action module parameters. Mandatory fields are marked with "(* required)". Note: For most of the keys the AttributeID can also be used, e.g. "Owner" can be "OwnerID". Keys that define the same Attribute should only be used once, e.g. "Owner" and "OwnerID" are redundant.' =>
            '',

        # XML Definition: Kernel/Config/Files/XML/Ticket.xml
        'The identifier for a ticket, e.g. Ticket#, Call#, MyTicket#. The default is Ticket#.' =>
            'Pengecam untuk tiket, cth: Ticket#, Call#, MyTicket#. Default ialah Ticket#.',
        'The divider between TicketHook and ticket number. E.g \': \'.' =>
            'Pemisah diantara TicketHook dan nombor tiket. Cth: \':\'.',
        'Max size of the subjects in an email reply and in some overview screens.' =>
            'Saiz maksimum subjek dalam badan balasan emel dan dalam skrin beberapa gambaran keseluruhan.',
        'The text at the beginning of the subject in an email reply, e.g. RE, AW, or AS.' =>
            'Teks pada permulaan subjek dalam emel balas, cth: RE, AW, atau AS.',
        'The text at the beginning of the subject when an email is forwarded, e.g. FW, Fwd, or WG.' =>
            'Teks pada permulaan subjek dalam emel dikehadapankan, cth: FW, Fwd, atau WG.',
        'The format of the subject. \'Left\' means \'[TicketHook#:12345] Some Subject\', \'Right\' means \'Some Subject [TicketHook#:12345]\', \'None\' means \'Some Subject\' and no ticket number. In the latter case you should verify that the setting PostMaster::CheckFollowUpModule###0200-References is activated to recognize followups based on email headers.' =>
            'Format untuk subjek. \'Kiri\' bermaksud \'[TicketHook#:12345] Sesuatu Subjek\', \'Kanan\' bermaksud \'Sesuatu Subjek [TicketHook#:12345]\', \'None\' bermaksud \'Sesuatu Subjek\' dan tiada nombor tiket. Dalam kes seterusnya anda harus mengesahkan tetapan PostMaster::CheckFollowUpModule###0200-References diaktifkan untuk mengenalpasti susulan berdasarkan kepala emel.',
        'A list of dynamic fields that are merged into the main ticket during a merge operation. Only dynamic fields that are empty in the main ticket will be set.' =>
            'Senarai medan dinamik yang digabung ke dalam tiket utama semasa operasi penggabungan. Hanya medan dinamik yang kosong di dalam tiket utama akan disetkan.',
        'Name of custom queue. The custom queue is a queue selection of your preferred queues and can be selected in the preferences settings.' =>
            'Nama aturan tersuai. Aturan tersuai ialah pemilihan aturan pada aturan yang anda inginkan dan boleh dipilih dalam tetapan pilihan.',
        'Name of custom service. The custom service is a service selection of your preferred services and can be selected in the preferences settings.' =>
            'Nama servis tersuai. Servis tersuai ialah pemilihan servis pada aturan yang anda inginkan dan boleh dipilih dalam tetapan pilihan.',
        'Ignore system sender article types (e. g. auto responses or email notifications) to be flagged as \'Unread Article\' in AgentTicketZoom or expanded automatically in Large view screens.' =>
            '',
        'Changes the owner of tickets to everyone (useful for ASP). Normally only agent with rw permissions in the queue of the ticket will be shown.' =>
            'Perubahan pemilik tiket kepada semua orang (bergunda untuk ASP). Kebiasaannya, hanya ejen yang mempunyai kebenaran rw di dalam barisan yang akan ditunjukkan.',
        'Enables ticket responsible feature, to keep track of a specific ticket.' =>
            'Mengaktifkan fungsi tanggungjawab tiket, untuk mengikuti perkembangan tiket tertentu.',
        'Automatically sets the owner of a ticket as the responsible for it (if ticket responsible feature is enabled). This will only work by manually actions of the logged in user. It does not work for automated actions e.g. GenericAgent, Postmaster and GenericInterface.' =>
            '',
        'Automatically change the state of a ticket with an invalid owner once it is unlocked. Maps from a state type to a new ticket state.' =>
            '',
        'Enables ticket type feature.' => '',
        'Defines the default ticket type.' => 'Mentakrifkan jenis tiket default.',
        'Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).' =>
            'Membolehkan perkhidmatan didefinisi dan SLA untuk tiket (contoh: emel, desktop, rangkaian, ...), dan atribut maklum balas untuk SLAs (jika perkhidmatan tiket/fungsi SLA diaktifkan).',
        'Retains all services in listings even if they are children of invalid elements.' =>
            'Mengekalkan semua servis dalam penyenaraian walaupun ianya adalah anak kepada elemen yang tidak sah.',
        'Allows default services to be selected also for non existing customers.' =>
            'Membolehkan perkhidmatan asal dipilih juga untuk pelanggan yang tidak wujud.',
        'Activates the ticket archive system to have a faster system by moving some tickets out of the daily scope. To search for these tickets, the archive flag has to be enabled in the ticket search.' =>
            'Mengaktifkan sistem arkib tiket untuk mempunyai sistem yang lebih laju dengan memindahkan sebahagian tiket keluar daripada skop harian. Untuk mencari tiket ini, bendera arkib mestilah diaktifkan pada carian tiket.',
        'Controls if the ticket and article seen flags are removed when a ticket is archived.' =>
            'Mengawal jika tiket dan artikel melihat penanda dikeluarkan apabila tiket diarkibkan. ',
        'Removes the ticket watcher information when a ticket is archived.' =>
            'Mengalihkan maklumat pemerhati tiket apabila tiket diarkibkan.',
        'Activates the ticket archive system search in the customer interface.' =>
            'Mengaktifkan pencarian sistem arkib tiket di dalam interface pelanggan.',
        'Selects the ticket number generator module. "AutoIncrement" increments the ticket number, the SystemID and the counter are used with SystemID.counter format (e.g. 1010138, 1010139). With "Date" the ticket numbers will be generated by the current date, the SystemID and the counter. The format looks like Year.Month.Day.SystemID.counter (e.g. 200206231010138, 200206231010139). With "DateChecksum"  the counter will be appended as checksum to the string of date and SystemID. The checksum will be rotated on a daily basis. The format looks like Year.Month.Day.SystemID.Counter.CheckSum (e.g. 2002070110101520, 2002070110101535). With "Random" the ticket numbers will be generated by 12 random numbers. The format looks like SystemID.RandomNumbers (e.g. 10123456789012).' =>
            '',
        'Checks the SystemID in ticket number detection for follow-ups. If not enabled, SystemID will be changed after using the system.' =>
            '',
        'Sets the minimal ticket counter size if "AutoIncrement" was selected as TicketNumberGenerator. Default is 5, this means the counter starts from 10000.' =>
            '',
        'Enables the minimal ticket counter size (if "Date" was selected as TicketNumberGenerator).' =>
            'Membolehkan saiz kaunter tiket minimum (jika "Tarikh" telah dipilih sebagai TicketNumberGenerator).',
        'IndexAccelerator: to choose your backend TicketViewAccelerator module. "RuntimeDB" generates each queue view on the fly from ticket table (no performance problems up to approx. 60.000 tickets in total and 6.000 open tickets in the system). "StaticDB" is the most powerful module, it uses an extra ticket-index table that works like a view (recommended if more than 80.000 and 6.000 open tickets are stored in the system). Use the command "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" for initial index creation.' =>
            'IndexAccelerator: untuk memilih modul backend TicketViewAccelerator anda/ "RuntimeDB" menjana setiap paparan aturan pada jadual dengan cepat dari jadual tiket (tiada masalah prestasi dijangka sehingga berjumlah 60,000 tiket dan 6,000 tiket terbuka di dalam sistem). "StaticDB" ialah modul yang berkuasa, ia menggunakan jadual indeks-tiket ekstra yang bekerja seperti paparan (disyorkan jika lebih daripada 80,000 dan 6,000 tiket buka disimpan dalam sistem). Gunakan arahan "bin/znuny.Console.pl Maint::Ticket::QueueIndexRebuild" untuk ciptaan indeks awalan.',
        'Saves the attachments of articles. "DB" stores all data in the database (not recommended for storing big attachments). "FS" stores the data on the filesystem; this is faster but the webserver should run under the Znuny user. You can switch between the modules even on a system that is already in production without any loss of data. Note: Searching for attachment names is not supported when "FS" is used.' =>
            'Menyimpan lampiran artikel. "DB" menyimpan semua data dalam pangkalan data (tidak digalakkan untuk menyimpan lampiran besar). "FS" menyimpan data pada sistem fail, ini adalah lebih cepat tetapi server web perlu dijalankan di bawah pengguna Znuny itu. Anda boleh bertukar antara modul walaupun pada satu sistem yang sudah dalam pengeluaran tanpa kehilangan data. Nota: Carian untuk nama lampiran tidak disokong apabila "FS" digunakan.',
        'Specifies whether all storage backends should be checked when looking for attachments. This is only required for installations where some attachments are in the file system, and others in the database.' =>
            'Menetapkan sama ada kesemua backend simpanan sepatutnya diperiksa apabila melihat lampiran. Ini hanya memerlukan pemasangan di mana sesetengah lampiran berada dalam fail sistem, dan selebihnya di dalam pangkalan data.',
        'Specifies the directory to store the data in, if "FS" was selected for ArticleStorage.' =>
            '',
        'Specifies whether the (MIMEBase) article attachments will be indexed and searchable.' =>
            '',
        'The duration in minutes after emitting an event, in which the new escalation notify and start events are suppressed.' =>
            'Tempoh dalam beberapa minit selepas mengeluarkan sesuatu acara, di mana peningkatan yang baru dan mula memberitahu peristiwa-peristiwa yang ditindas.',
        'Restores a ticket from the archive (only if the event is a state change to any open available state).' =>
            '',
        'Updates the ticket index accelerator.' => 'Naik taraf pemecut indeks tiket.',
        'Resets and unlocks the owner of a ticket if it was moved to another queue.' =>
            'Reset dan membuka pemilik sesuatu tiket jika ia telah dipindahkan ke aturan yang lain.',
        'Forces to choose a different ticket state (from current) after lock action. Define the current state as key, and the next state after lock action as content.' =>
            'Memaksa untuk memilih status tiket yang lain (daripada yang terkini) selepas tindakan mengunci. Mentakrifkan status terkini sebagai kunci, dan status seterusnya selepas tindakan mengunci sebagai isi kandungan.',
        'Automatically sets the responsible of a ticket (if it is not set yet) after the first owner update.' =>
            'Secara automatik menetapkan tanggungjawab sesebuah tiket (jika ia tidak ditetapkan lagi) selepas kemas kini pemilik pertama.',
        'When agent creates a ticket, whether or not the ticket is automatically locked to the agent.' =>
            '',
        'Sets the PendingTime of a ticket to 0 if the state is changed to a non-pending state.' =>
            'Tetapkan PendingTime untuk suatu tiket kepada 0 jika statusnya telah diubah kepada status bukan pending.',
        'Sends the notifications which are configured in the admin interface under "Ticket Notifications".' =>
            '',
        'Updates the ticket escalation index after a ticket attribute got updated.' =>
            'Naik tarah indeks lambungan tiket selepas atribut tiket dinaik taraf.',
        'Ticket event module that triggers the escalation stop events.' =>
            'Modul acara tiket yang mencetuskan lambungan hentian acara..',
        'Forces to unlock tickets after being moved to another queue.' =>
            'Memaksa untuk membuka tiket selepas dipindahkan ke aturan yang lain.',
        'Update Ticket "Seen" flag if every article got seen or a new Article got created.' =>
            'Naik taraf bendera "Seen" tiket jika setiap artikel telah dilihat atau Artikel baru telah dicipta.',
        'Event module that updates tickets after an update of the Customer.' =>
            'Modul acara yang mengemaskini tiket selepas satu kemas kini Pelanggan.',
        'Event module that updates tickets after an update of the Customer User.' =>
            'Modul acara yang mengemaskinikan tiket selepas satu kemas kini Pengguna Pelanggan.',
        'Define a mapping between variables of the customer user data (keys) and dynamic fields of a ticket (values). The purpose is to store customer user data in ticket dynamic fields. The dynamic fields must be present in the system and should be enabled for AgentTicketFreeText, so that they can be set/updated manually by the agent. They mustn\'t be enabled for AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer. If they were, they would have precedence over the automatically set values. To use this mapping, you have to also activate the Ticket::EventModulePost###4100-DynamicFieldFromCustomerUser setting.' =>
            '',
        'This event module stores attributes from CustomerUser as DynamicFields tickets. Please see DynamicFieldFromCustomerUser::Mapping setting for how to configure the mapping.' =>
            '',
        'Overloads (redefines) existing functions in Kernel::System::Ticket. Used to easily add customizations.' =>
            'Terlebih muat (mentakrifkan semula) fungsi sedia ada dalam Kernel::System::Ticket. Digunakan untuk memudahkan menambah penyesuaian.',
        'Helps to extend your articles full-text search (From, To, Cc, Subject and Body search). It will strip all articles and will build an index after article creation, increasing fulltext searches about 50%. To create an initial index use "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild".' =>
            '',
        'Defines whether to index archived tickets for fulltext searches.' =>
            '',
        'Force the storage of the original article text in the article search index, without executing filters or applying stop word lists. This will increase the size of the search index and thus may slow down fulltext searches.' =>
            '',
        'Display a warning and prevent search when using stop words within fulltext search.' =>
            'Mempamerkan amaran dan menghalang pencarian apabila menggunakan perkataan menghentikan dalam pencarian teks penuh.',
        'Basic fulltext index settings. Execute "bin/znuny.Console.pl Maint::Ticket::FulltextIndex --rebuild" in order to generate a new index.' =>
            '',
        'Fulltext index regex filters to remove parts of the text.' => 'Teks penuh indeks penapis ungkapan biasa untuk mengeluarkan bahagian-bahagian teks.',
        'English stop words for fulltext index. These words will be removed from the search index.' =>
            'Perkataan berhenti Inggeris untuk indeks teks penuh. Perkataan ini akan dibuang dari indeks carian.',
        'German stop words for fulltext index. These words will be removed from the search index.' =>
            'Perkataan berhenti Jerman untuk indeks teks penuh. Perkataan ini akan dibuang dari indeks carian.',
        'Dutch stop words for fulltext index. These words will be removed from the search index.' =>
            'Kata-kata hentian Belanda bagi indeks teks penuh. Kata-kata ini akan dikeluarkan daripada indeks carian.',
        'Spanish stop words for fulltext index. These words will be removed from the search index.' =>
            'Perkataan berhenti Sepanyol untuk indeks teks penuh. Perkataan ini akan dibuang dari indeks carian.',
        'French stop words for fulltext index. These words will be removed from the search index.' =>
            'Perkataan berhenti Perancis untuk indeks teks penuh. Perkataan ini akan dibuang dari indeks carian.',
        'Italian stop words for fulltext index. These words will be removed from the search index.' =>
            'Perkataan berhenti Itali untuk indeks teks penuh. Perkataan ini akan dibuang dari indeks carian.',
        'Customizable stop words for fulltext index. These words will be removed from the search index.' =>
            'Kata-kata berhenti disesuaikan bagi indeks teks penuh. Kata-kata ini akan dikeluarkan daripada indeks carian.',
        'Allows having a small format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo =&gt; 1 - shows also the customer information).' =>
            '',
        'Shows a preview of the ticket overview (CustomerInfo =&gt; 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            '',
        'Defines which article sender types should be shown in the preview of a ticket.' =>
            'Mentakrifkan artikel jenis penghantar yang mana harus di pamerkan dalam previu tiket.',
        'Sets the count of articles visible in preview mode of ticket overviews.' =>
            'Set bilangan artikel yang dapat dilihat dalam mod pratonton gambaran keseluruhan tiket.',
        'Defines if the first article should be displayed as expanded, that is visible for the related customer. If nothing defined, latest article will be expanded.' =>
            '',
        'Time in seconds that gets added to the actual time if setting a pending-state (default: 86400 = 1 day).' =>
            'Masa dalam saat yang dapat menambah ke masa sebenar jika menetapkan keadaan tertangguh (default: 86400 = 1 hari).',
        'Define the max depth of queues.' => 'Menentukan kedalaman maksimum barisan.',
        'Shows existing parent/child queue lists in the system in the form of a tree or a list.' =>
            'Menunjukkan senarai aturan parent/child yang sedia ada dalam sistem dalam bentuk pokok atau senarai.',
        'Enables or disables the ticket watcher feature, to keep track of tickets without being the owner nor the responsible.' =>
            'Mengaktifkan atau melumpuhkan fungsi pemantau tiket, untuk mengikuti perkembangan tiket tanpa pemilik atau yang bertanggungjawab.',
        'Enables ticket watcher feature only for the listed groups.' => 'Mengaktifkan fungsi pantauan tiket hanya untuk kumpulan yang tersenarai.',
        'Enables ticket bulk action feature for the agent frontend to work on more than one ticket at a time.' =>
            'Mengaktifkan fungsi tindakan tiket pukal untuk frontend ejen untuk melaksanakan lebih dari satu tiket pada satu masa.',
        'Enables ticket bulk action feature only for the listed groups.' =>
            'Mengaktifkan fungsi tindakan tiket pukal hanya untuk kumpulan yang tersenarai.',
        'Defines time in minutes since last modification for drafts of specified type before they are considered expired.' =>
            '',
        'Shows a link to see a zoomed email ticket in plain text.' => 'Menunjukkan pautan untuk melihat tiket emel yang dizum dalam teks kosong.',
        'Shows all the articles of the ticket (expanded) in the agent zoom view.' =>
            '',
        'Shows the articles sorted normally or in reverse, under ticket zoom in the agent interface.' =>
            'Menunjukkan aritkel disusun seperti biasa atau terbalik, dibawah tiket zum dalam paparan ejen.',
        'Shows the article head information in the agent zoom view.' => '',
        'Shows a count of attachments in the ticket zoom, if the article has attachments.' =>
            '',
        'Displays the accounted time for an article in the ticket zoom view.' =>
            'Pamerkan masa yang diperuntukkan untuk artikel dalam paparan zum tiket.',
        'Activates the article filter in the zoom view to specify which articles should be shown.' =>
            'Mengaktifkan tapisan artikel dalam paparan besar untuk menyatakan artikel yang perlu dipaparkan.',
        'Displays the number of all tickets with the same CustomerID as current ticket in the ticket zoom view.' =>
            '',
        'Shows the ticket history (reverse ordered) in the agent interface.' =>
            'Menunjukkan sejarah tiekt (susunan terbalik) dalam paparan ejen.',
        'Controls how to display the ticket history entries as readable values.' =>
            'Mengawal bagaimana untuk memaparkan catatan sejarah tiket sebagai nilai-nilai yang boleh dibaca.',
        'Permitted width for compose email windows.' => 'Kelebaran yang diberi kebenaran untuk karang emel windows.',
        'Permitted width for compose note windows.' => 'Kelebaran yang diberi kebenaran untuk karan nota windows.',
        'Max size (in rows) of the informed agents box in the agent interface.' =>
            'Saiz maksimum (dalam baris) pada kotak ejen telah dimaklumkan dalam paparan ejen.',
        'Max size (in rows) of the involved agents box in the agent interface.' =>
            'Saiz maksimum (dalam baris) pada kotak ejen terlibat dalam paparan ejen.',
        'Makes the application block external content loading.' => '',
        'Shows the customer user information (phone and email) in the compose screen.' =>
            'Menunjukkan maklumat pelanggan pengguna (telefon dan emel) dalam skrin karang.',
        'Max size (in characters) of the customer information table (phone and email) in the compose screen.' =>
            'Saiz maksimum (dalam aksara) pada jadual informasi pelanggan (telefon dan emel) dalam skrin karang.',
        'Maximum size (in characters) of the customer information table in the ticket zoom view.' =>
            'Saiz maksimum (dalam aksara) dari jadual maklumat pelanggan dalam paparan zum tiket.',
        'Maximum length (in characters) of the dynamic field in the sidebar of the ticket zoom view.' =>
            'Panjang maksimum (dalam aksara) medan dinamik dalam sisi bar pada paparan zum tiket.',
        'Maximum length (in characters) of the dynamic field in the article of the ticket zoom view.' =>
            'Panjang maksimum (dalam aksara) medan dinamik dalam artikel pada paparan zum tiket.',
        'Controls if customers have the ability to sort their tickets.' =>
            'Kawalan jika pelanggan mempunyai keupayaan untuk mengatur tiket mereka.',
        'This option will deny the access to customer company tickets, which are not created by the customer user.' =>
            'Pilihan ini akan menafikan akses ke tiket syarikat pelanggan, di mana ia tidak dicipta oleh pengguna pelanggan.',
        'Custom text for the page shown to customers that have no tickets yet (if you need those text translated add them to a custom translation module).' =>
            'Teks kebiasaan untuk halaman yang ditunjukkan kepada pelanggan yang tidak mempunyai tiket lagi (jika anda memerlukan teks yang telah diterjemahkan tambahkan mereka kepada modul terjemahan kebiasaan).',
        'Shows either the last customer article\'s subject or the ticket title in the small format overview.' =>
            'Menunjukkan samada subjek artikel pelanggan terakhir atau tajuk tiket dalam overview format kecil.',
        'Show the current owner in the customer interface.' => 'Tunjuk pemilik semasa dalam antara muka pelanggan.',
        'Show the current queue in the customer interface.' => 'Tunjuk barisan semasa dalam antara muka pelanggan.',
        'Dynamic fields shown in the ticket overview screen of the customer interface.' =>
            '',
        'Strips empty lines on the ticket preview in the queue view.' => 'Melucutkan barisan kosong pada previu tiket dalam paparan aturan.',
        'Shows all both ro and rw queues in the queue view.' => 'Menunjukkan kesemua aturan kedua-dua ro dan rw dalam paparan aturan.',
        'Show queues even when only locked tickets are in.' => 'Tunjukkan barisan walaupun apabila hanya ada tiket berkunci.',
        'Enable highlighting queues based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting queues that contain untouched tickets.' =>
            'Tetapkan umur dalam minit (tahap pertama) untuk aturan ditonjolkan ang mengandungi tiket yang tidak disentuh.',
        'Sets the age in minutes (second level) for highlighting queues that contain untouched tickets.' =>
            'Tetapkan umur dalam minit (tahap kedua) untuk aturan ditonjolkan ang mengandungi tiket yang tidak disentuh.',
        'Activates a blinking mechanism of the queue that contains the oldest ticket.' =>
            'Mengaktifkan mekanisma berkelip untuk barisan yang mengandungi tiket yang terlama.',
        'Include tickets of subqueues per default when selecting a queue.' =>
            'Termasuk tiket daripada sub-barisan secara default apabila memilih barisan.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the queue view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the QueueID for the key and 0 or 1 for value.' =>
            'Susun tiket (menaik atau menurun) apabila atau aturan tunggal dipilh dalam paparan aturan dan selepas tiket disusun mengikut keutamaan. Nilai: 0 = menaik (terlama diatas, default), 1 = menurun (terbaru diatas). Menggunakan QueueID untuk kunci dan 0 atau 1 untuk nilai.',
        'Defines the default sort criteria for all queues displayed in the queue view.' =>
            'Mentakrifkan kriteria jenis lalai untuk semua barisan dipaparkan dalam paparan barisan.',
        'Defines if a pre-sorting by priority should be done in the queue view.' =>
            'Mentakrifkan jika pra-pengasingan mengikut keutamaan perlu dilakukan dalam paparan barisan.',
        'Defines the default sort order for all queues in the queue view, after priority sort.' =>
            'Mentakrifkan turutan susunan asal untuk kesemua aturan dalam paparan aturan, selepas aturan keutamaan.',
        'Strips empty lines on the ticket preview in the service view.' =>
            'Jalur baris kosong pada pratonton tiket dalam pandangan perkhidmatan.',
        'Shows all both ro and rw tickets in the service view.' => 'Menunjukkan semua kedua-dua tiket ro dan rw dalam pandangan servis.',
        'Sorts the tickets (ascendingly or descendingly) when a single queue is selected in the service view and after the tickets are sorted by priority. Values: 0 = ascending (oldest on top, default), 1 = descending (youngest on top). Use the ServiceID for the key and 0 or 1 for value.' =>
            'Susun tiket (menaik atau menurun) apabila atau aturan tunggal dipilh dalam paparan servis dan selepas tiket disusun mengikut keutamaan. Nilai: 0 = menaik (terlama diatas, default), 1 = menurun (terbaru diatas). Menggunakan ServiceID untuk kunci dan 0 atau 1 untuk nilai.',
        'Defines the default sort criteria for all services displayed in the service view.' =>
            'Mentakrifkan kriteria jenis lalai untuk semua perkhidmatan dipaparkan dalam paparan perkhidmatan.',
        'Defines if a pre-sorting by priority should be done in the service view.' =>
            'Mentakrifkan jika pra-pengasingan mengikut keutamaan perlu dilakukan dalam paparan perkdidmatan.',
        'Defines the default sort order for all services in the service view, after priority sort.' =>
            'Mentakrifkan turutan susunan asal untuk kesemua perkhidmatan dalam paparan perkhidmatan, selepas pengkelasan keutamaan.',
        'Enable highlighting services based on ticket age.' => '',
        'Sets the age in minutes (first level) for highlighting services that contain untouched tickets.' =>
            '',
        'Sets the age in minutes (second level) for highlighting services that contain untouched tickets.' =>
            '',
        'Activates a blinking mechanism of the service that contains the oldest ticket.' =>
            '',
        'Activates time accounting.' => 'Mengaktifkan perakaunan masa.',
        'Sets the prefered time units (e.g. work units, hours, minutes).' =>
            'Tetapkan unit masa yang disukai (cth: unit kerja, jam, minit).',
        'Defines if time accounting is mandatory in the agent interface. If enabled, a note must be entered for all ticket actions (no matter if the note itself is configured as active or is originally mandatory for the individual ticket action screen).' =>
            '',
        'Defines if time accounting must be set to all tickets in bulk action.' =>
            'Mentakrifkan jika perakaunan masa mesti diset kepada semua tiket dalam tindakan pukal.',
        'Defines the default ticket attribute for ticket sorting in the status view of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk penyusunan tiket dalam paparan status dari paparan ejen.',
        'Defines the default ticket order (after priority sort) in the status view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal (selepas susunan keutamaan) dalam paparan status dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Defines the required permission to show a ticket in the escalation view of the agent interface.' =>
            'Mentakrifkan kebenaran yang diperlukan untuk menunjukkan paparan lambungan tiket dari paparan ejen.',
        'Defines the default ticket attribute for ticket sorting in the escalation view of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk penyusunan tiket dalam paparan lambungan dari paparan ejen',
        'Defines the default ticket order (after priority sort) in the escalation view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal (selepas susunan keutamaan) dalam paparan lambungan dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the agent interface.' =>
            'Jumlah maksimum tiket untuk dipamerkan dalam hasil carian dalam paparan ejen.',
        'Number of tickets to be displayed in each page of a search result in the agent interface.' =>
            'Jumlah tiket yang akan dipamerkan dalam setiap halaman dari hasil carian dalam paparan ejen.',
        'Number of lines (per ticket) that are shown by the search utility in the agent interface.' =>
            'Jumlah barisan (setiap tiket) yang diunjukkan oleh utiliti carian dalam paparan ejen.',
        'Defines the default ticket attribute for ticket sorting of the ticket search result of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk aturan tiket dalam hasil pencarian tiket dari paparan ejen.',
        'Defines the default ticket order in the ticket search result of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal dalam hasil carian tiket dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Exports the whole article tree in search result (it can affect the system performance).' =>
            'Export keseluruh pokok artikel dalam hasil carian (ia boleh menjejaskan prestasi sistem).',
        'Data used to export the search result in CSV format.' => 'Data digunakan untuk mengeksport hasil carian dalam format CSV.',
        'Includes article create times in the ticket search of the agent interface.' =>
            'Termasuk masa artikel dicipta dalam carian tiket dari paparan ejen.',
        'Defines the default shown ticket search attribute for ticket search screen.' =>
            'Mentakrifkan sifat pencarian tiket yang ditunjuk yang asal untuk skrin carian tiket.',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimePointFormat=year;TicketCreateTimePointStart=Last;TicketCreateTimePoint=2;".' =>
            'Data asal digunakan untuk sifat bagi skrin carian tiket. Contoh: TicketCreateTimePointFormat=tahun;TicketCreateTimePointStart=Terakhir;TicketCreateTimePoint=2;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketCreateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".' =>
            'Data asal digunakan untuk sifat bagi skrin carian tiket. Contoh: TicketCrateTimeStartYear=2010;TicketCreateTimeStartMonth=10;TicketCreateTimeStartDay=4;TicketCreateTimeStopYear=2010;TicketCreateTimeStopMonth=11;TicketCreateTimeStopDay=3;".',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimePointFormat=year;TicketLastChangeTimePointStart=Last;TicketLastChangeTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketLastChangeTimeStartYear=2010;TicketLastChangeTimeStartMonth=10;TicketLastChangeTimeStartDay=4;TicketLastChangeTimeStopYear=2010;TicketLastChangeTimeMonth=11;TicketLastChangeTimeStopDay=3;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimePointFormat=year;TicketPendingTimePointStart=Last;TicketPendingTimePoint=2;".' =>
            '',
        'Default data to use on attribute for ticket search screen. Example: "TicketPendingTimeStartYear=2010;TicketPendingTimeStartMonth=10;TicketPendingTimeStartDay=4;TicketPendingTimeStopYear=2010;TicketPendingTimeMonth=11;TicketPendingTimeStopDay=3;".' =>
            '',
        'Defines the default ticket attribute for ticket sorting in the locked ticket view of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk penyusunan tiket dalam paparan tiket terkunci dari paparan ejen.',
        'Defines the default ticket order in the ticket locked view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal dalam paparan tiket terkunci dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Defines the default ticket attribute for ticket sorting in the responsible view of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk penyusunan tiket dalam paparan tanggungjawab dari paparan ejen.',
        'Defines the default ticket order in the responsible view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal dalam paparan tanggungjawab dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Defines the default ticket attribute for ticket sorting in the watch view of the agent interface.' =>
            'Mentakrifkan sifat tiket asal untuk aturan tiket dalam paparan pantau dari paparan ejen',
        'Defines the default ticket order in the watch view of the agent interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal dalam paparan pantau dari paparan ejen. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Required permissions to use the ticket free text screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket bebas teks dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket free text screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin percuma dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket free text screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket free text screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets if service must be selected by the agent.' => 'Set jika servis mesti dipilih oleh agen.',
        'Sets if SLA must be selected by the agent.' => 'Set jika SLA mesti dipilih oleh agen.',
        'Sets the queue in the ticket free text screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin teks tiket bebas pada tiket zum dalam antara muka agen.',
        'Sets if queue must be selected by the agent.' => '',
        'Sets the ticket owner in the ticket free text screen of the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin tiket bebas teks dari paparan ejen.',
        'Sets if ticket owner must be selected by the agent.' => 'Tetapkan jika pemilik tiket mesti dipilih oleh ejen.',
        'Sets the responsible agent of the ticket in the ticket free text screen of the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin tiket bebas teks dari paparan ejen.',
        'Sets if ticket responsible must be selected by the agent.' => '',
        'Sets the state of a ticket in the ticket free text screen of the agent interface.' =>
            '',
        'Sets if state must be selected by the agent.' => '',
        'Defines the next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin tiket bebas teks dari paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket free text screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin teks percuma tiket dari paparan ejen.',
        'Allows adding notes in the ticket free text screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin tiket bebas teks pada antaramuka agen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets if note must be filled in by the agent. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Set jika nota mesti diisi oleh agen. Boleh ditulis semula oleh Ticket::Frontend::NeedAccountedTime.',
        'Defines the default subject of a note in the ticket free text screen of the agent interface.' =>
            'Mentakrifkan subjek nota asal dalam sirin tiket bebas teks dari paparan ejen.',
        'Defines the default body of a note in the ticket free text screen of the agent interface.' =>
            'Mentakrifkan badan asal nota dalam skrin tiket teks percuma dari paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket free text screen of the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin tiket bebas teks dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket free text screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket free text screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket free text screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin tiket bebas teks dari paparan ejen.',
        'Defines the default ticket priority in the ticket free text screen of the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin tiket bebas teks dari paparan ejen.',
        'Shows the title field in the ticket free text screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket free text screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket free text screen action, which gets used for ticket history.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket bebas teks, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket free text screen action, which gets used for ticket history.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket bebas teks, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket phone outbound screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket telefon keluar dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket phone outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin tiket telefon keluar dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Defines the default sender type for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Mentakrifkan jenis asal penghantar untuk tiket telefon di skrin telefon tiket keluar paparan ejen.',
        'Defines the default subject for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Mentakrifkan subjek asal untuk tiket telefon dalam skrin tiket telefon keluar dari paparan ejen.',
        'Defines the default note body text for phone tickets in the ticket phone outbound screen of the agent interface.' =>
            'Mentakrifkan teks badan nota asal untuk tiket telefon dalam skrin keluar telefon tiket dari paparan ejen.',
        'Defines the default ticket next state after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Mentakrifkan keadaan seterusnya tiket asal selepas menambah nota telefon dalam skrin tiket telefon keluar dari paparan ejen.',
        'Next possible ticket states after adding a phone note in the ticket phone outbound screen of the agent interface.' =>
            'Status tiket yang mungkin yang seterusnya selepas menambah nita telefon dalam skrin tiket telefon keluar dari paparan ejen.',
        'Defines the history type for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket telefon keluar, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket phone outbound screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket telefon keluar, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Allows to save current work as draft in the ticket phone outbound screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket phone inbound screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket telefon masuk dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket phone inbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin tiket telefon masuk dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Defines the default sender type for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Mentakrifkan jenis asal penghantar untuk tiket telefon di skrin telefon tiket masuk paparan ejen.',
        'Defines the default subject for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Mentakrifkan subjek asal untuk tiket telefon dalam skrin tiket telefon masuk dari paparan ejen.',
        'Defines the default note body text for phone tickets in the ticket phone inbound screen of the agent interface.' =>
            'Mentakrifkan teks badan nota asal untuk tiket telefon dalam skrin masuk telefon tiket dari paparan ejen.',
        'Defines the default ticket next state after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Mentakrifkan keadaan seterusnya tiket asal selepas menambah nota telefon dalam skrin tiket telefon masuk dari paparan ejen.',
        'Next possible ticket states after adding a phone note in the ticket phone inbound screen of the agent interface.' =>
            'Status tiket yang mungkin yang seterusnya selepas menambah nota telefon dalam skrin tiket telefon masuk dari paparan ejen.',
        'Defines the history type for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket telefon masuk, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket phone inbound screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket telefon masuk, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Allows to save current work as draft in the ticket phone inbound screen of the agent interface.' =>
            '',
        'Shows an owner selection in phone and email tickets in the agent interface.' =>
            'Menunjukkan pemilihan pemilik dalam tiket telefon dan emel dalam paparan ejen.',
        'Show a responsible selection in phone and email tickets in the agent interface.' =>
            'Menunjukkan pilihan tanggungjawab dalam tiket telefon dan emel dalam paparan ejen.',
        'Defines the recipient target of the phone ticket and the sender of the email ticket ("Queue" shows all queues, "System address" displays all system addresses) in the agent interface.' =>
            'Mentakrifkan sasaran penerima tiket telefon dan penghantar tiket emel ("Giliran" menunjukkan semua barisan, "Alamat sistem" memaparkan semua alamat sistem) dalam antara muka ejen.',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "&lt;Queue&gt;" shows the names of the queues and for SystemAddress "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which options will be valid of the recipient (phone ticket) and the sender (email ticket) in the agent interface.' =>
            'Menentukan pilihan yang akan menjadi sah pada penerima (tiket telefon) dan penghantar (tiket e-mel) dalam antara muka ejen.',
        'Shows customer history tickets in AgentTicketPhone, AgentTicketEmail and AgentTicketCustomer.' =>
            'Menunjukkan sejarah tiket pelanggan dalam AgentTicketPhone, AgentTicketEmail dan AgentTicketCustomer.',
        'If enabled, TicketPhone and TicketEmail will be open in new windows.' =>
            'Jika diaktifkan, TicketPhone dan TicketEmail akan di buka di tingkap yang baru.',
        'Sets the default priority for new phone tickets in the agent interface.' =>
            'Tetapkan keutamaan default untuk tiket telefon baru dalam paparan ejen.',
        'Sets the default sender type for new phone ticket in the agent interface.' =>
            'Tetapkan jenis penghantar default untuk tiket telefon baru dalam paparan ejen.',
        'Sets the default article customer visibility for new phone tickets in the agent interface.' =>
            '',
        'Controls if more than one from entry can be set in the new phone ticket in the agent interface.' =>
            'Kawalan jika lebih daripada satu daripada kemasukan boleh ditetapkan dalam tiket telefon baru dalam interface ejen.',
        'Sets the default subject for new phone tickets (e.g. \'Phone call\') in the agent interface.' =>
            'Tetapkan subjek default untuk tiket telefon baru (cth: \'Panggilan telefon\') dalam paparan ejen.',
        'Sets the default note text for new telephone tickets. E.g \'New ticket via call\' in the agent interface.' =>
            'Tetapkan teks nota default untuk tiket telefon baru. Cth: \'Tiket baru melalui panggilan\' dalam paparan ejen.',
        'Sets the default next state for new phone tickets in the agent interface.' =>
            'Tetapkan status default seterusnya untuk tiket telefon baru dalam paparan ejen.',
        'Determines the next possible ticket states, after the creation of a new phone ticket in the agent interface.' =>
            'Menentukan status tiket kemungkinan yang seterusnya, selepas penciptaan tiket telefon baru dalam paparan ejen.',
        'Defines the history type for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket telefon, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the phone ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket telefon, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Sets the default link type of splitted tickets in the agent interface.' =>
            'Tetapkan jenis pautan default tiket yang dipisahkan dalam paparn ejen.',
        'Sets the default priority for new email tickets in the agent interface.' =>
            'Tetapkan keutamaan default untuk tiket emel baru dalam paparan ejen.',
        'Sets the default article customer visibility for new email tickets in the agent interface.' =>
            '',
        'Sets the default sender type for new email tickets in the agent interface.' =>
            'Tetapkan jenis penghantar default untuk tiket emel baru dalam paparan ejen.',
        'Sets the default subject for new email tickets (e.g. \'email Outbound\') in the agent interface.' =>
            'Tetapkan subjek default untuk tiket emel baru (cth: \'emel keluar\') dalam paparan ejen.',
        'Sets the default text for new email tickets in the agent interface.' =>
            'Tetapkan teks default untuk tiket emel baru dalam paparan ejen.',
        'Sets the default next ticket state, after the creation of an email ticket in the agent interface.' =>
            'Tetapkan status tiket default seterusnya, selepas penciptaan tiket emel dalam paparan ejen.',
        'Determines the next possible ticket states, after the creation of a new email ticket in the agent interface.' =>
            'Menetukan status tiket kemungkinan yang seterusnya, selepas penciptaan tiket emel baru dalam paparan ejen.',
        'Defines the history type for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket emel, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the email ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket emel, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the close ticket screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket tertutup dalam paparan ejen.',
        'Defines if a ticket lock is required in the close ticket screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket adalah diperlukan dalam skrin tiket tutup dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the close ticket screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the close ticket screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket close screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin tiket tutup dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the close ticket screen of the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin tiket tertutup dari paparan ejen.',
        'Sets the responsible agent of the ticket in the close ticket screen of the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin tiket tertutup dari paparan ejen.',
        'Sets the state of a ticket in the close ticket screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin tiket tertutup dari paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the close ticket screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin tiket tutup dari paparan ejen.',
        'Allows adding notes in the close ticket screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin tiket tertutup dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the close ticket screen of the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin tiket tertutup dari paparan ejen.',
        'Sets the default body text for notes added in the close ticket screen of the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin tiket tertutup dari paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the close ticket screen of the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin tiket tertutup dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the close ticket screen of the agent interface.' =>
            '',
        'Defines if the note in the close ticket screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the close ticket screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin tiket tertutup dari paparan ejen.',
        'Defines the default ticket priority in the close ticket screen of the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin tiket tertutup dari paparan ejen.',
        'Shows the title field in the close ticket screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the close ticket screen of the agent interface.' =>
            '',
        'Defines the history type for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket tertutup, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the close ticket screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket tertutup, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket note screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin nota tiket dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket note screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin nota tiket dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket note screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket note screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket note screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin nota tiket dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the ticket note screen of the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin nota tiket dari paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket note screen of the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin nota tiket dari paparan ejen.',
        'Sets the state of a ticket in the ticket note screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin nota tiket dari paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket note screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin nota tiket dari paparan ejen.',
        'Allows adding notes in the ticket note screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin nota tiket dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the ticket note screen of the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin nota tiket dari paparan ejen.',
        'Sets the default body text for notes added in the ticket note screen of the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin nota tiket dari paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket note screen of the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin nota tiket dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket note screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket note screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket note screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin nota tiket dari paparan ejen.',
        'Defines the default ticket priority in the ticket note screen of the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin nota tiket dari paparan ejen.',
        'Shows the title field in the ticket note screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket note screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin nota tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket note screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin nota tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin pemilik tiket ari tiket dizum dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket owner screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket owner screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin pemilik tiket dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen.',
        'Sets the state of the ticket in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin pemilik tiket dari tiket yang dizum dalam paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen.',
        'Allows adding notes in the ticket owner screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin pemilik tiket dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin pemilik tiket dari tiket dizum dalam  paparan ejen.',
        'Sets the default body text for notes added in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin pemilik tiket dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket owner screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin pemilik tiket dari tiket dizum dalam paparan ejen.',
        'Defines the default ticket priority in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin pemilik tiket dalam tiket dizum dari paparan ejen.',
        'Shows the title field in the ticket owner screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket owner screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin pemilik tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket owner screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin pemilik tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket pending screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin menunggu tiket dari tiket dizum dalam paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket pending screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin tiket tergantung dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Sets the state of the ticket in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin tiket tertangguh dari tiket yang dizum dalam paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin menunggu tiket dari tiket dizum dalam paparan ejen.',
        'Allows adding notes in the ticket pending screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin tangguhan tiket pada tiket yang dizum dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Sets the default body text for notes added in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin tiket tertangguh dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket pending screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin tiket tertangguh dari tiket dizum dalam paparan ejen.',
        'Defines the default ticket priority in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin tiket tangguhan dalam tiket dizum dari paparan ejen.',
        'Shows the title field in the ticket pending screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket pending screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tiket tertangguh, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket pending screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tiket tertangguh, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket priority screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin keutamaaan tiket dari tiket dizum dalam paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket priority screen of a zoomed ticket in the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin keutamaan tiket dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Sets the state of the ticket in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin keutamaan tiket dari tiket yang dizum dalam paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Allows adding notes in the ticket priority screen of a zoomed ticket in the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin keutamaan tiket pada tiket yang dizum dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin keutamaan tiket daritiket dizum dalam paparan ejen.',
        'Sets the default body text for notes added in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Defines if the note in the ticket priority screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin keutamaan tiket dari tiket dizum dalam paparan ejen.',
        'Defines the default ticket priority in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin keutamaan tiket dalam tiket dizum dari paparan ejen.',
        'Shows the title field in the ticket priority screen of a zoomed ticket in the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket priority screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin keutamaan tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket priority screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin keutamaan tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Required permissions to use the ticket responsible screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tanggungjawab tiket dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket responsible screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin tanggungjawab tiket dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Sets the ticket type in the ticket responsible screen of the agent interface (Ticket::Type needs to be enabled).' =>
            '',
        'Sets the service in the ticket responsible screen of the agent interface (Ticket::Service needs to be enabled).' =>
            '',
        'Sets the queue in the ticket responsible screen of a zoomed ticket in the agent interface.' =>
            'Set barisan dalam skrin tanggungjawab tiket dari tiket zum dalam antara muka agen.',
        'Sets the ticket owner in the ticket responsible screen of the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket responsible screen of the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Sets the state of a ticket in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas menambah satu nota, dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Defines the default next state of a ticket after adding a note, in the ticket responsible screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas menambah nota, dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Allows adding notes in the ticket responsible screen of the agent interface. Can be overwritten by Ticket::Frontend::NeedAccountedTime.' =>
            'Membolehkan penambahan nota di dalam skrin tanggungjawab tiket dalam antaramuka ejen. Boleh ditulis semula oleh Tiket::Frontend::PerluMasaPerakaunan.',
        'Sets the default subject for notes added in the ticket responsible screen of the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Sets the default body text for notes added in the ticket responsible screen of the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Shows a list of all the involved agents on this ticket, in the ticket responsible screen of the agent interface.' =>
            'Menunjukkan senarai kesemua ejen yang terlibat pada tiket ini, dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Shows a list of all the possible agents (all agents with at least ro permissions on the queue/ticket) to determine who should be informed about this note, in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines if the note in the ticket responsible screen of the agent interface is visible for the customer by default.' =>
            '',
        'Shows the ticket priority options in the ticket responsible screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Defines the default ticket priority in the ticket responsible screen of the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin tanggungjawab tiket dari paparan ejen.',
        'Shows the title field in the ticket responsible screen of the agent interface.' =>
            '',
        'Allows to save current work as draft in the ticket responsible screen of the agent interface.' =>
            '',
        'Defines the history type for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin tanggungjawab tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket responsible screen action, which gets used for ticket history in the agent interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan skrin tanggungjawab tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Automatically lock and set owner to current Agent after selecting for an Bulk Action.' =>
            'Secara automatik mengunci dan menetapkan pemilik kepada Ejen semasa, selepas memilih untuk Tindakan Pukal.',
        'Sets the ticket type in the ticket bulk screen of the agent interface.' =>
            'Tetapkan jenis tiket dalam skrin tiket pukal dari paparan ejen.',
        'Sets the ticket owner in the ticket bulk screen of the agent interface.' =>
            'Tetapkan pemilik tiket dalam skrin tiket pukal dari paparan ejen.',
        'Sets the responsible agent of the ticket in the ticket bulk screen of the agent interface.' =>
            'Tetapkan ejen bertanggungjawab untuk tiket dalam skrin tiket pukal dari paparan ejen.',
        'Sets the state of a ticket in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Defines the default next state of a ticket, in the ticket bulk screen of the agent interface.' =>
            '',
        'Shows the ticket priority options in the ticket bulk screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin tiket pukal dari paparan ejen.',
        'Defines the default ticket priority in the ticket bulk screen of the agent interface.' =>
            'Mentakrifkan keutamaan tiket asal dalam skrin tiket pukal dari paparan ejen.',
        'Defines if the note in the ticket bulk screen of the agent interface is visible for the customer by default.' =>
            '',
        'Determines if the list of possible queues to move to ticket into should be displayed in a dropdown list or in a new window in the agent interface. If "New Window" is set you can add a move note to the ticket.' =>
            'Menentukan jika senarai aturan yang mungkin untuk dipindahkan ke tiket perlu dipamerkan dalam senarai dropdown atau dalam window yang baru dalam paparan ejen.',
        'Automatically lock and set owner to current Agent after opening the move ticket screen of the agent interface.' =>
            'Kunci secara automatik dan set pemilik ke Agen semasa selepas pembukaan skrin alih tiket pada antara muka agen.',
        'Allows to set a new ticket state in the move ticket screen of the agent interface.' =>
            'Membolehkan untuk menetapkan status tiket baru di dalam skrin pindahan tiket di dalam interface ejen.',
        'Defines the next state of a ticket after being moved to another queue, in the move ticket screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas dipindahkan ke aturan yang lain, dalam skrin pindah tiket dari paparan ejen.',
        'Shows the ticket priority options in the move ticket screen of the agent interface.' =>
            'Menunjukkan pilihan keutamaan tiket dalam skrin pindah tiket dari paparan ejen.',
        'Allows to save current work as draft in the ticket move screen of the agent interface.' =>
            '',
        'Required permissions to use the ticket bounce screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin tiket latun dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket bounce screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin lantun tiket dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Defines the default next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas dilantun, dalam skrin lantun tiket dari paparan ejen.',
        'Defines the next state of a ticket after being bounced, in the ticket bounce screen of the agent interface.' =>
            'Mentakrifkan status tiket seterusnya selepas dilantun, dalam skrin lantunan tiket dari paparan ejen.',
        'Defines the default ticket bounced notification for customer/sender in the ticket bounce screen of the agent interface.' =>
            'Mentakrifkan notifikasi melantun tiket asal untuk pelanggan/penghantar dalam skrin lantunan tiket dari paparan ejen.',
        'Required permissions to use the ticket compose screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin karang tiket dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket compose screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin mengarang dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Defines the default next state of a ticket if it is composed / answered in the ticket compose screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket jika ia digubah / dijawab dalam skrin gubah tiket dari paparan ejen.',
        'Defines the next possible states after composing / answering a ticket in the ticket compose screen of the agent interface.' =>
            'Mentakrifkan status yang mungkin yang seterusya selepas mengarang / menjawab tiket dalam skrin karang tiket dari paparan ejen.',
        'Defines if the message in the ticket compose screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket compose screen of the agent interface.' =>
            '',
        'Defines the format of responses in the ticket compose screen of the agent interface ([% Data.OrigFrom | html %] is From 1:1, [% Data.OrigFromName | html %] is only realname of From).' =>
            'Mentakrifkan format jawapan dalam skrin menulis tiket bagi antara muka ejen ([% Data.OrigFrom | html %] adalah dari 1:1, [% Data.OrigFromName | html %] hanya namasebenar Daripada).',
        'Defines the used character for plaintext email quotes in the ticket compose screen of the agent interface. If this is empty or inactive, original emails will not be quoted but appended to the response.' =>
            'Mentakrifkan aksara yang digunakan untuk kuota emel teks kosong dalam skrin karang tiket bagi antara muka ejen. Jika ini adalah kosong atau tidak aktif, emel asal tidak akan diberikan tetapi dilampirkan pada respon.',
        'Defines the maximum number of quoted lines to be added to responses.' =>
            'Mentakrifkan bilangan maksimum baris dipetik untuk ditambahkan kepada jawapan.',
        'Adds customers email addresses to recipients in the ticket compose screen of the agent interface. The customers email address won\'t be added if the article type is email-internal.' =>
            'Menambah alamat e-mel pelanggan kepada penerima dalam skrin gubahan tiket bagi antara muka ejen. Alamat e-mel pelanggan tidak akan ditambah jika jenis artikel itu adalah e-mel
dalaman.',
        'Replaces the original sender with current customer\'s email address on compose answer in the ticket compose screen of the agent interface.' =>
            'Menggantikan pengganti asal dengan alamat emel pelanggan semasa pada jawapan dikarang dalam skrin karang tiket dari paparan ejen.',
        'Required permissions to use the ticket forward screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin menghadapankan tiket dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket forward screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin hadapan dari paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Defines the default next state of a ticket after being forwarded, in the ticket forward screen of the agent interface.' =>
            'Mentakrifkan asal keadaan seterusnya dari tiket selepas dihadapankan, dalam skrin hadapan tiket dari paparan ejen.',
        'Defines the next possible states after forwarding a ticket in the ticket forward screen of the agent interface.' =>
            'Mentakrifkan status yang mungkin yang seterusya selepas penghantaran tiket dalam skrin hantar tiket dari paparan ejen.',
        'Defines if the message in the ticket forward screen of the agent interface is visible for the customer by default.' =>
            '',
        'Allows to save current work as draft in the ticket forward screen of the agent interface.' =>
            '',
        'Required permissions to use the email outbound screen in the agent interface.' =>
            'Memerlukan kebenaran untuk menggunakan skrin emel keluar dalam antara muka agen.',
        'Defines if a ticket lock is required in the email outbound screen of the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin keluar e-mel antara muka ejen (jika tiket itu tidak dikunci lagi, tiket yang akan dikunci dan ejen semasa akan ditetapkan secara automatik sebagai pemiliknya).',
        'Defines the default next state of a ticket after the message has been sent, in the email outbound screen of the agent interface.' =>
            'Mentakrifkan lalai keadaan tiket seterusnya selepas mesej telah dihantar, dalam skrin keluar e-mel antara muka ejen.',
        'Defines the next possible states after sending a message in the email outbound screen of the agent interface.' =>
            'Mentakrifkan keadaan kemungkinan akan datang selepas menghantar mesej dalam skrin keluar e-mel antara muka ejen.',
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
            'Memerlukan kebenaran untuk menggunakan skrin tiket gabung dari tiket dizum dalam paparan ejen.',
        'Defines if a ticket lock is required in the ticket merge screen of a zoomed ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan dalam skrin gabungan tiket dari tiket dizum dalam paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'Required permissions to change the customer of a ticket in the agent interface.' =>
            'Memerkulan kebenaran untuk mengubah pelanggan sesuatu tiket dalam paparan ejen.',
        'Defines if a ticket lock is required to change the customer of a ticket in the agent interface (if the ticket isn\'t locked yet, the ticket gets locked and the current agent will be set automatically as its owner).' =>
            'Mentakrifkan jika kunci tiket diperlukan untuk menukar pelanggan tiket dalam paparan ejen (jika tiket tidak dikunci lagi, tiket akan dikunci dan ejen semasa akan diset secara automatik sebagai pemiliknya).',
        'When tickets are merged, the customer can be informed per email by setting the check box "Inform Sender". In this text area, you can define a pre-formatted text which can later be modified by the agents.' =>
            'Apabila tiket digabungkan, pelanggan boleh diberitahu setiap e-mel dengan menetapkan kotak semak "Memaklumkan Penghantar". Dalam kawasan teks ini, anda boleh menentukan teks pra-format yang kemudiannya boleh diubah suai oleh ejen.',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the subject of this note (this subject cannot be changed by the agent).' =>
            'Apabila tiket digabungkan, nota akan ditambah secara automatik ke tiket yang tidak lagi aktif. Di sini anda boleh menentukan subjek nota ini (teks ini tidak boleh diubah oleh ejen itu).',
        'When tickets are merged, a note will be added automatically to the ticket which is no longer active. Here you can define the body of this note (this text cannot be changed by the agent).' =>
            'Apabila tiket digabungkan, nota akan ditambah secara automatik ke tiket yang tidak lagi aktif. Di sini anda boleh menentukan kandungan nota ini (teks ini tidak boleh diubah oleh ejen itu).',
        'Defines the default viewable sender types of a ticket (default: customer).' =>
            'Mentakrifkan jenis penghantar tiket asal yang boleh dilihat (asal: customer).',
        'Defines the viewable locks of a ticket. NOTE: When you change this setting, make sure to delete the cache in order to use the new value. Default: unlock, tmp_lock.' =>
            '',
        'Defines the valid state types for a ticket. If a ticket is in a state which have any state type from this setting, this ticket will be considered as open, otherwise as closed.' =>
            '',
        'Defines the valid states for unlocked tickets. To unlock tickets the script "bin/znuny.Console.pl Maint::Ticket::UnlockTimeout" can be used.' =>
            'Mentakrifkan keadaan sah untuk tiket dibuka. Untuk membuka kunci tiket skrip "bin/znuny.Console.pl Maint::Tiket::UnlockTimeout" yang boleh digunakan.',
        'Sends reminder notifications of unlocked ticket after reaching the reminder date (only sent to ticket owner).' =>
            'Hantar notifikasi peringatan tiket terbuka selapas mencapai tarikh peringatan (hanya hantar kepada pemilik tiket).',
        'Disables sending reminder notifications to the responsible agent of a ticket (Ticket::Responsible needs to be enabled).' =>
            '',
        'Defines the state type of the reminder for pending tickets.' => 'Mentakrifkan jenis status dari peringatan untuk tiket tertangguh.',
        'Determines the possible states for pending tickets that changed state after reaching time limit.' =>
            'Menentukan status kemungkinan untuk tiket tertangguh yang mengubah status selepas mencapai had masa.',
        'Defines which states should be set automatically (Content), after the pending time of state (Key) has been reached.' =>
            'Mentakrifkan status yang mana harus di set secara automatik (Isi kandungan), selepas masa tangguhan status (Kunci) telah dicapai.',
        'Defines an external link to the database of the customer (e.g. \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' or \'\').' =>
            'Mentakrifkan pautan luar ke pangkalan data pelanggan (contoh: \'http://yourhost/customer.php?CID=[% Data.CustomerID %]\' atau \'\').',
        'Defines the target attribute in the link to external customer database. E.g. \'target="cdb"\'.' =>
            'Mentakrifkan sifat sasaran di dalam pautan ke pangkalan data pelanggan luaran.',
        'Defines the target attribute in the link to external customer database. E.g. \'AsPopup PopupType_TicketAction\'.' =>
            'Mentakrifkan sifat sasaran dalam pautan kepada pangkalan data pelanggan luaran. Contoh : \'AsPopup PopupType_TicketAction.',
        'Toolbar Item for a shortcut. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
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
            'Modul untuk menjana profil html OpenSearch untuk carian pendek tiket dalam paparan ejen.',
        'Module to show notifications and escalations (ShownMax: max. shown escalations, EscalationInMinutes: Show ticket which will escalation in, CacheTime: Cache of calculated escalations in seconds).' =>
            'Modul untuk menunjukkan notifikasi dan lambungan (ShownMax: lambungan maksimum dipamerkan, EscalationInMinutes: Menunjukkan tiket dimana akan dilambungkan, CacheTimet: Cache lambungan uang dikira dalam saat).',
        'Customer item (icon) which shows the open tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Item pelanggan (icon) yang menunjukkan tiket terbuka pelanggan ini sebagai blok info. Menetapkan CustomerUserLogin kepada carian 1 untuk tiket berdasarkan nama log masuk dan bukannya CustomerID.',
        'Customer item (icon) which shows the closed tickets of this customer as info block. Setting CustomerUserLogin to 1 searches for tickets based on login name rather than CustomerID.' =>
            'Item pelanggan (icon) yang menunjukkan tiket tertutup pelanggan ini sebagai blok info. Menetapkan CustomerUserLogin kepada carian 1 untuk tiket berdasarkan nama log masuk dan bukannya CustomerID.',
        'Agent interface article notification module to check PGP.' => 'Interface artikel pemberitahuan modul ejen untuk memeriksa PGP',
        'Agent interface module to check incoming emails in the Ticket-Zoom-View if the S/MIME-key is available and true.' =>
            'Interface modul ejen untuk menyemak emel masuk di dalam Paparan-Besar-Tiket jika kunci S/MIME tersedia dan betul.',
        'Agent interface article notification module to check S/MIME.' =>
            'Interface artikel pemberitahuan modul ejen untuk memeriksa S/MIME.',
        'Module to define the email security options to use (PGP or S/MIME).' =>
            '',
        'Module to compose signed messages (PGP or S/MIME).' => 'Modul untuk karang mesej ditandatangan (PGP atau S/MIME).',
        'Module to encrypt composed messages (PGP or S/MIME).' => '',
        'Shows a link to download article attachments in the zoom view of the article in the agent interface.' =>
            'Menunjukkan pautan untk muat turun lampiran artikel dalam paparan zum artikel dalam paparan ejen.',
        'Shows a link to access article attachments via a html online viewer in the zoom view of the article in the agent interface.' =>
            'Menunjukkan pautan untuk akses lampiran artikel melalui penglihat html online dalam paparan zum artikel dalam paparan ejen.',
        'Shows a link in the menu to go back in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk kembali ke paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to lock/unlock tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk mengunci/membuka kunci tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to access the history of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk mengakses sejarah tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to print a ticket or an article in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk mencetak tiket atau artikel dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to see the priority of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk melihat keutamaan tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to add a free text field in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk menambah bidang teks bebas dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu that allows linking a ticket with another object in the ticket zoom view of the agent interface.  Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu yang membenarkan pemautan tiket dengan objek lain dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to change the owner of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the responsible agent of a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to change the customer who requested the ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a note in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk menambah nota dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to add a phone call outbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to add a phone call inbound in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            '',
        'Shows a link in the menu to send an outbound email in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk menghantar emel keluar dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu that allows merging tickets in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu yang membenarkan cantuman tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to set a ticket as pending in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk tetapkan tiket sebagai ditangguh dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu for subscribing / unsubscribing from a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk melanggan/tidak melanggan daripada tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to close a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk menutup tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link in the menu to delete a ticket in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan dalam menu untuk memadam tiket dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows a link to set a ticket as junk in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2". To cluster menu items use for Key "ClusterName" and for the Content any name you want to see in the UI. Use "ClusterPriority" to configure the order of a certain cluster within the toolbar.' =>
            'Menunjukkan pautan untuk tetapkan tiket sebagai junk dalam paparan zum tiket antara muka agen. Kawalan akses tambahan untuk menunjukkan atau tidak menunjukkan pautan ini boleh dilakukan dengan menggunakan Kekunci "Kumpulan" dan Kandungan seperti "rw:group1;move_into:group2". Untuk merangkaikan item menu gunakan kekunci "ClusterName" dan untuk Kandungan mana-mana nama yang anda mahu lihat dalam UI. Gunakan "ClusterPriority" untuk mengkonfigurasi susunan rangkaian tertentu dalam toolbar.',
        'Shows link to external page in the ticket zoom view of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'This setting shows the sorting attributes in all overview screen, not only in queue view.' =>
            '',
        'Defines from which ticket attributes the agent can select the result order.' =>
            'Mentakrifkan dari ciri tiket manakah agen boleh memilih urutan keputusan.',
        'Shows a link in the menu to lock / unlock a ticket in the ticket overviews of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk mengunci/membuka tiket dalam overview tiket dari paparan ejen.',
        'Shows a link in the menu to zoom a ticket in the ticket overviews of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk zum  tiket dalam overview tiket dari paparan ejen.',
        'Shows a link in the menu to see the history of a ticket in every ticket overview of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk melihat sejarah tiket dalam setiap overview tiket dari paparan ejen.',
        'Shows a link in the menu to set the priority of a ticket in every ticket overview of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk tetapkan keutamaan tiket dalam setiap overview tiket dari paparan ejen.',
        'Shows a link in the menu to add a note to a ticket in every ticket overview of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk menambah nota kepada tiket dalam setiap overview tiket dari paparan ejen.',
        'Shows a link in the menu to close a ticket in every ticket overview of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk menutup tiket dalam setiap overview tiket dari paparan ejen.',
        'Shows a link in the menu to move a ticket in every ticket overview of the agent interface.' =>
            'Menunjukkan pautan dalam menu untuk pindah tiket dalam setiap overview tiket dari paparan ejen.',
        'Shows a link in the menu to delete a ticket in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            'Menunjukkan pautan dalam menu untuk memadam tiket dalam setiap overview tiket dari paparan ejen. Kawalan akses tambahan untuk tunjuk atau tidak tunjuk pautan ini boleh dilakukan menggunakan Kunci "Group" dan Kandungan seperti "rw:group1;move_into:group2".',
        'Shows a link in the menu to set a ticket as junk in every ticket overview of the agent interface. Additional access control to show or not show this link can be done by using Key "Group" and Content like "rw:group1;move_into:group2".' =>
            '',
        'Module to grant access to the owner of a ticket.' => 'Modul untuk memberi akses kepada pemilik tiket.',
        'Optional queue limitation for the OwnerCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Had barisan pilihan untuk modul kebenaran OwnerCheck. Jika ditetapkan, kebenaran itu hanya boleh diberi untuk tiket dalam barisan yang dinyatakan.',
        'Module to grant access to the agent responsible of a ticket.' =>
            'Modul untuk memberi akses kepada agen bertanggungjawab ke atas tiket.',
        'Optional queue limitation for the ResponsibleCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Had barisan pilihan untuk modul kebenaran ResponsibleCheck. Jika ditetapkan, kebenaran itu hanya boleh diberi untuk tiket dalam barisan yang dinyatakan.',
        'Module to check the group permissions for the access to tickets.' =>
            'Modul untuk menyemak kebenaran kumpulan untuk akses kepada tiket.',
        'Module to grant access to the watcher agents of a ticket.' => 'Modul untuk memberi akses kepada agen pemerhati tiket.',
        'Module to grant access to the creator of a ticket.' => 'Modul untuk memberi akses kepada pencipta tiket.',
        'Optional queue limitation for the CreatorCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Had barisan pilihan untuk modul kebenaran CreatorChec . Jika ditetapkan, kebenaran itu hanya boleh diberi untuk tiket dalam barisan yang dinyatakan.',
        'Module to grant access to any agent that has been involved in a ticket in the past (based on ticket history entries).' =>
            'Modul untuk memberi akses ke mana-mana agen yang terlibat dengan tiket pasa masa lepas (berdasarkan kemasukan sejarah tiket).',
        'Optional queue limitation for the InvolvedCheck permission module. If set, permission is only granted for tickets in the specified queues.' =>
            'Had barisan pilihan untuk modul kebenaran InvolvedCheck. Jika ditetapkan, kebenaran itu hanya boleh diberi untuk tiket dalam barisan yang dinyatakan.',
        'Module to check the group permissions for customer access to tickets.' =>
            'Modul untuk menyemak kebenaran kumpulan untuk akses pelanggan kepada tiket.',
        'Module to grant access if the CustomerUserID of the ticket matches the CustomerUserID of the customer.' =>
            'Modul untuk memberi akses jika IDPenggunaPelanggan tiket serasi dengan IDPenggunaPelanggan pelanggan.',
        'Module to grant access if the CustomerID of the ticket matches the CustomerID of the customer.' =>
            'Modul untuk memberi akses jika IDPelanggan tiket serasi dengan IDPelanggan pelanggan.',
        'Module to grant access if the CustomerID of the customer has necessary group permissions.' =>
            '',
        'Defines how the From field from the emails (sent from answers and email tickets) should look like.' =>
            'Mentakrifkan bagaimana bidang From dari e-mel (dihantar daripada jawapan dan tiket e-mel) mestilah kelihatan sama.',
        'Defines the separator between the agents real name and the given queue email address.' =>
            'Mentakrifkan pemisah antara nama sebenar ejen dan alamat emel aturan yang diberi.',
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
        'Defines the calendar width in percent. Default is 95%.' => 'Mentakrifkan lebar kalendar dalam peratus. Lalai adalah 95%.',
        'Defines queues that\'s tickets are used for displaying as calendar events.' =>
            'Mentakrifkan barisan bahawa tiket digunakan untuk dipaparkan sebagai acara kalendar .',
        'Define dynamic field name for start time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Tentukan nama medan dinamik untuk masa mula. Bidang ini perlu secara manual ditambah ke dalam sistem sebagai tiket: "Tarikh / Masa" dan mesti diaktifkan dalam skrin penciptaan tiket dan/atau dalam mana-mana skrin tindakan tiket lain.',
        'Define dynamic field name for end time. This field has to be manually added to the system as Ticket: "Date / Time" and must be activated in ticket creation screens and/or in any other ticket action screens.' =>
            'Tentukan nama medan dinamik untuk masa akhir. Bidang ini perlu secara manual ditambah ke dalam sistem sebagai tiket: "Tarikh / Masa" dan mesti diaktifkan dalam skrin penciptaan tiket dan/atau dalam mana-mana skrin tindakan tiket lain.',
        'Defines the dynamic fields that are used for displaying on calendar events.' =>
            'Mentakrifkan medan dinamik yang digunakan untuk dipaparkan pada acara kalendar .',
        'Defines the ticket fields that are going to be displayed calendar events. The "Key" defines the field or ticket attribute and the "Content" defines the display name.' =>
            'Mentakrifkan bidang tiket yang akan menjadi acara kalendar yang dipaparkan. "Kunci" mentakrifkan bidang atau tiket sifat dan "Kandungan" mentakrifkan nama paparan.',
        'Defines if the values for filters should be retrieved from all available tickets. If enabled, only values which are actually used in any ticket will be available for filtering. Please note: The list of customers will always be retrieved like this.' =>
            '',
        'Parameters for the dashboard backend of the customer user list overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter untuk backend papan pemuka daripada pengguna pelanggan senarai gambaran bagi antara muka ejen. "Had" adalah bilangan penyertaan ditunjukkan secara default. "Kumpulan" digunakan untuk menyekat akses kepada plugin (contoh: Kumpulan: admin; kumpulan1; kumpulan2;). "Default" menentukan jika plugin ini diaktifkan secara lalai atau jika pengguna perlu untuk membolehkan secara manual. "CacheTTLLocal" adalah masa cache dalam minit untuk plugin.',
        'Parameters for the dashboard backend of the ticket pending reminder overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the ticket escalation overview of the agent interface . "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the new tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the open tickets overview of the agent interface. "Limit" is the number of entries shown by default. "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin. Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Parameters for the dashboard backend of the customer id status widget of the agent interface . "Group" is used to restrict the access to the plugin (e. g. Group: admin;group1;group2;). "Default" determines if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTLLocal" is the cache time in minutes for the plugin.' =>
            'Parameter untuk backend papan pemuka status widget id pelanggan bagi antara muka ejen. "Kumpulan" digunakan untuk menyekat akses kepada plugin (contoh: Kumpulan: admin; kumpulan1; kumpulan2;). "Default" menentukan jika plugin ini diaktifkan secara default atau jika pengguna perlu untuk membolehkan secara manual. "CacheTTLLocal" adalah masa cache dalam minit untuk plugin.',
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
        'Parameters of the example queue attribute Comment2.' => 'Parameter contoh atribut aturan Komen2',
        'Parameters of the example service attribute Comment2.' => 'Parameter contoh atribut perkhidmatan Komen2',
        'Parameters of the example SLA attribute Comment2.' => 'Parameter contoh atribut SLA Komen2',
        'Sends customer notifications just to the mapped customer.' => '',
        'Specifies if an agent should receive email notification of his own actions.' =>
            'Tentukan jika ejen sepatutnya menerima notifikasi emel dari tindakannya sendiri.',
        'Determines the next screen after new customer ticket in the customer interface.' =>
            'Menentukan skrin seterusnya selepas tiket pelanggan baru dalam paparan pelanggan.',
        'Allows customers to set the ticket priority in the customer interface.' =>
            'Membolehkan pelanggan untuk menetapkan keutamaan tiket di dalam interface pelanggan.',
        'Defines the default priority of new customer tickets in the customer interface.' =>
            'Mentakrifkan keutamaan asal dari tiket pengguna baru dalam paparan pelanggan.',
        'Allows customers to set the ticket queue in the customer interface. If this is not enabled, QueueDefault should be configured.' =>
            '',
        'Defines the default queue for new customer tickets in the customer interface.' =>
            'Mentakrifkan aturan asal untuk tiket pelanggan baru dalam paparan pelanggan.',
        'Allows customers to set the ticket type in the customer interface. If this is not enabled, TicketTypeDefault should be configured.' =>
            '',
        'Defines the default ticket type for new customer tickets in the customer interface.' =>
            'Mentakrifkan jenis tiket lalai untuk tiket pelanggan baru dalam antara muka pelanggan.',
        'Allows customers to set the ticket service in the customer interface.' =>
            'Membolehkan pelanggan untuk menetapkan perkhidmatan tiket di dalam interface Allows choosing the next compose state for customer tickets in the customer interface pelanggan.',
        'Allows customers to set the ticket SLA in the customer interface.' =>
            'Membolehkan pelanggan untuk menetapkan tiket SLA di dalam interface pelanggan.',
        'Sets if service must be selected by the customer.' => 'Set jika servis mesti dipilih oleh pelanggan.',
        'Sets if SLA must be selected by the customer.' => 'Set jika SLA mesti dipilih oleh pelanggan.',
        'Defines the default state of new customer tickets in the customer interface.' =>
            'Mentakrifkan status asal untuk tiket pelanggan baru dalam paparan pelanggan.',
        'Sender type for new tickets from the customer inteface.' => 'Jenis penghantar untuk tiket baru daripada antara muka pelanggan.',
        'Defines the default history type in the customer interface.' => 'Mentakrifkan jenis sejarah asal dalam paparan pelanggan.',
        'Comment for new history entries in the customer interface.' => 'Komen untuk kemasukan sejarah baru di dalam interface pelanggan.',
        'Defines the recipient target of the tickets ("Queue" shows all queues, "SystemAddress" shows only the queues which are assigned to system addresses) in the customer interface.' =>
            '',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "&lt;Queue&gt;" shows the names of the queues, and for SystemAddress, "&lt;Realname&gt; &lt;&lt;Email&gt;&gt;" shows the name and email of the recipient.' =>
            '',
        'Determines which queues will be valid for ticket\'s recepients in the customer interface.' =>
            'Menentukan aturan mana akan sah untuk penerima tiket dalam paparan pelanggan.',
        'Module for To-selection in new ticket screen in the customer interface.' =>
            'Modul untuk To-selecion dalam skrin tiket baru dalam paparan pelanggan.',
        'Determines the next screen after the follow-up screen of a zoomed ticket in the customer interface.' =>
            'Menentukan skrin seterusnya selepas skrin susulan daripada tiket zum dalam antara muka pelanggan.',
        'Defines the default sender type for tickets in the ticket zoom screen of the customer interface.' =>
            'Mentakrifkan jenis penghantar asal untuk tiket dalam skrin zum tiket dari paparan pelanggan.',
        'Defines the history type for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Mentakrifkan jenis sejarah untuk tindakan skrin zum tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Defines the history comment for the ticket zoom action, which gets used for ticket history in the customer interface.' =>
            'Mentakrifkan sejarah komen untuk tindakan zum tiket, yang dapat digunakan untuk sejarah tiket di dalam paparan ejen.',
        'Allows customers to change the ticket priority in the customer interface.' =>
            'Membolehkan pelanggan untuk menukar keutamaan tiket di dalam interface pelanggan.',
        'Defines the default priority of follow-up customer tickets in the ticket zoom screen in the customer interface.' =>
            'Mentakrifkan keutamaan lalai tiket susulan pelanggan dalam skrin zum tiket dalam antara muka pelanggan.',
        'Allows choosing the next compose state for customer tickets in the customer interface.' =>
            'Membolehkan memilih status yang diwujudkan seterusnya untuk tiket pelanggan di dalam interface pelanggan.',
        'Defines the default next state for a ticket after customer follow-up in the customer interface.' =>
            'Mentakrifkan lalai keadaan akan datang untuk tiket selepas susulan pelanggan dalam antara muka pelanggan.',
        'Defines the next possible states for customer tickets in the customer interface.' =>
            'Mentakrifkan status yang mungkin yang seterusya untuk tiket pelanggan dalam paparan pelanggan.',
        'Shows the enabled ticket attributes in the customer interface (0 = Disabled and 1 = Enabled).' =>
            '',
        'Defines the length of the article preview in the customer interface.' =>
            '',
        'Defines the displayed style of the From field in notes that are visible for customers. A default agent name can be defined in Ticket::Frontend::CustomerTicketZoom###DefaultAgentName setting.' =>
            '',
        'Defines the default agent name in the ticket zoom view of the customer interface.' =>
            '',
        'Maximum number of tickets to be displayed in the result of a search in the customer interface.' =>
            'Jumlah tiket untuk dipamerkan dalam hasil carian dalam paparan pelanggan.',
        'Number of tickets to be displayed in each page of a search result in the customer interface.' =>
            'Jumlah tiket yang akan dipamerkan dalam setiap halaman dari hasil carian dalam paparan pelanggan.',
        'Defines the default ticket attribute for ticket sorting in a ticket search of the customer interface.' =>
            'Mentakrifkan sifate tiket asal untuk penyusunan tiket dalam pencarian tiket dari paparan pelanggan',
        'Defines the default ticket order of a search result in the customer interface. Up: oldest on top. Down: latest on top.' =>
            'Mentakrifkan turutan tiket asal dalam hasil carian dari paparan pelanggan. Atas: yang lama di atas. Bawah: yang terbaru di atas.',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'If enabled, the customer can search for tickets in all services (regardless what services are assigned to the customer).' =>
            'Jika dibolehkan, pelanggan boleh mencari untuk tiket dalam semua servis (tanpa menghiraukan apakah servis yang diatur kepada pelanggan).',
        'Defines all the parameters for the ShownTickets object in the customer preferences of the customer interface.' =>
            'Mentakrifkan semua parameter untuk objek ShownTickets dalam keutamaan pelanggan dari paparan pelanggan.',
        'Defines all the parameters for the RefreshTime object in the customer preferences of the customer interface.' =>
            'Mentakrifkan semua parameter untuk objek RefreshTime dalam keutamaan pelanggan dari paparan pelanggan.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the agent interface.' =>
            'Mentakrifkan penggunaan asal Modul Frontend jika tiada parameter tindakan diberi dalam url dari paparan ejen.',
        'Default queue ID used by the system in the agent interface.' => 'Barisan ID asal yang digunakan sistem di dalam paparan ejen.',
        'Default ticket ID used by the system in the agent interface.' =>
            'Tiket ID asal digunakan oleh sistem di dalam paparan ejen.',
        'Defines the default used Frontend-Module if no Action parameter given in the url on the customer interface.' =>
            'Mentakrifkan penggunaan asal Modul Frontend jika tiada parameter tindakan diberi dalam url dari paparan pelanggan.',
        'Default ticket ID used by the system in the customer interface.' =>
            'Tiket ID asal digunakan oleh sistem di dalam paparan pengguna.',
        'Module to generate html OpenSearch profile for short ticket search in the customer interface.' =>
            'Modul untuk menjana profil html OpenSearch untuk carian pendek tiket dalam paparan pelanggan. ',
        'Determines the next screen after the ticket is moved. LastScreenOverview will return the last overview screen (e.g. search results, queueview, dashboard). TicketZoom will return to the TicketZoom.' =>
            'Menentukan skrin seterusnya selepas tiket yang digerakkan. LastScreenOverview akan kembalikan skrin gambaran yang terakhir (contohnya hasil carian, queueview, papan pemuka). TicketZoom akan kembali ke TicketZoom itu.',
        'Sets the default subject for notes added in the ticket move screen of the agent interface.' =>
            'Tetapkan subjek default untuk nota yang ditambah dalam skrin pindah tiket dari paparan ejen.',
        'Sets the default body text for notes added in the ticket move screen of the agent interface.' =>
            'Tetapkan teks body untuk nota yang ditambah dalam skrin pindah tiket dari paparan ejen.',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&amp;&amp;*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Set the limit of tickets that will be executed on a single genericagent job execution.' =>
            'Set had tiket yang akan dijalankan ke atas pelaksanaan tugas genericagent tunggal.',
        'Allows generic agent to execute custom modules.' => '',
        'Unlock tickets whenever a note is added and the owner is out of office.' =>
            'Buka tiket apabila nota ditambah dan pemilik berada di luar pejabat.',
        'Include unknown customers in ticket filter.' => '',
        'List of all ticket events to be displayed in the GUI.' => 'Senarai semua acara tiket untuk dipaparkan dalam GUI.',
        'List of all article events to be displayed in the GUI.' => 'Senarai semua acara artikel untuk dipaparkan dalam GUI.',
        'List of all queue events to be displayed in the GUI.' => 'Senarai semua acara barisan untuk dipaparkan dalam GUI.',
        'Event module that performs an update statement on TicketIndex to rename the queue name there if needed and if StaticDB is actually used.' =>
            'Modul acara yang melaksanakan satu kenyataan terkini mengenai TicketIndex untuk menamakan semula nama barisan jika diperlukan dan jika StaticDB yang sebenarnya digunakan.',
        'Ignores not ticket related attributes.' => '',
        'Transport selection for ticket notifications. Please note: setting \'Active\' to 0 will only prevent agents from editing settings of this group in their personal preferences, but will still allow administrators to edit the settings of another user\'s behalf. Use \'PreferenceGroup\' to control in which area these settings should be shown in the user interface.' =>
            '',
        'ACL module that allows closing parent tickets only if all its children are already closed ("State" shows which states are not available for the parent ticket until all child tickets are closed).' =>
            'Modul ACL yang membolehkan penutupan tiket induk hanya jika kesemua anaknya telah ditutup ("Status" menunjukkan status yang tidak disediakan untuk tiket induk sehingga semua anak tiket ditutup)',
        'Default ACL values for ticket actions.' => 'Nilai asal ACL untuk tindakan tiket',
        'Defines which items are available in first level of the ACL structure.' =>
            'Mentakrifkan barangan mana yang terdapat pada tahap pertama struktur ACL. ',
        'Defines which items are available in second level of the ACL structure.' =>
            'Mentakrifkan barangan mana yang terdapat pada tahap kedua struktur ACL. ',
        'Defines which items are available for \'Action\' in third level of the ACL structure.' =>
            'Mentakrif barangan mana boleh didapati untuk \'Tindakan\' di peringkat ketiga struktur ACL.',
        'Cache time in seconds for the DB ACL backend.' => 'Masa Cache dalam saat untuk backend DB ACL.',
        'If enabled debugging information for ACLs is logged.' => 'Jika maklumat nyahpepijat dibolehkan untuk ACL sedang dilog.',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format &lt;OTRS_TICKET_Attribute&gt; e.g. &lt;OTRS_TICKET_Priority&gt;.' =>
            '',
        'Maximal auto email responses to own email-address a day (Loop-Protection).' =>
            'Tindak balas auto emel maksimum kepada alamat emel sendiri sehari (perlindungan pengulangan).',
        'Maximal auto email responses to own email-address a day, configurable by email address (Loop-Protection).' =>
            '',
        'Maximal size in KBytes for mails that can be fetched via POP3/POP3S/IMAP/IMAPS (KBytes).' =>
            'Saiz maksimum dalam KBytes untuk mel yang dapat diambil melalui POP3/POP3S/IMAP/IMAPS (KBytes).',
        'The maximum number of mails fetched at once before reconnecting to the server.' =>
            'Bilangan maksimum mel diambil sekaligus sebelum menyambung ke pelayan.',
        'Default loop protection module.' => 'Modul perlindungan lingkaran asal.',
        'Path for the log file (it only applies if "FS" was selected for LoopProtectionModule and it is mandatory).' =>
            'Laluan untuk fail log (ia hanya diunakan jika "FS" dipilh untuk LoopProtectionModule dan ia adalam mandatori).',
        'Converts HTML mails into text messages.' => 'Menukarkan mel HTML ke dalam mesej teks.',
        'Specifies user id of the postmaster data base.' => 'Menentukan id pengguna pada pangkalan data postmaster.',
        'Defines the postmaster default queue.' => 'Mentakrifkan aturan postmaster default.',
        'Defines the default priority of new tickets.' => 'Mentakrifkan keutamaan asal tiket baru.',
        'Defines the default state of new tickets.' => 'Mentakrifkan status asal tiket baru',
        'Defines the state of a ticket if it gets a follow-up.' => 'Mentakrifkan status sesuatu tiket jika mendapat susulan.',
        'Defines the state of a ticket if it gets a follow-up and the ticket was already closed.' =>
            'Mentakrifkan status sesuatu tiket jika mendapat susulan dan tiket tersebut sudah ditutup.',
        'Defines the PostMaster header to be used on the filter for keeping the current state of the ticket.' =>
            '',
        'Sends agent follow-up notification only to the owner, if a ticket is unlocked (the default is to send the notification to all agents).' =>
            'Menghantar notifikasi susulan ejen hanya kepada pemilik, jika tiket tidak dikunci (default ialah untuk hantar notifikasi kepada kesemua ejen).',
        'Defines the number of header fields in frontend modules for add and update postmaster filters. It can be up to 99 fields.' =>
            'Menentukan bilangan medan tajuk dalam modul frontend untuk menambah dan mengemaskini penapis ketua pos. Ia boleh menjadi sehingga 99 bidang.',
        'Indicates if a bounce e-mail should always be treated as normal follow-up.' =>
            '',
        'Defines all the X-headers that should be scanned.' => 'Mentakrifkan semua X-headers yang perlu diimbas.',
        'Module to filter and manipulate incoming messages. Block/ignore all spam email with From: noreply@ address.' =>
            'Modul untuk menapis dan memanipulasi mesej yang masuk. Halang/abai kesemua emel span dengan Dari: noreply@ address.',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From =&gt; \'(.+?)@.+?\', and use () as [***] in Set =&gt;.' =>
            '',
        'Blocks all the incoming emails that do not have a valid ticket number in subject with From: @example.com address.' =>
            'Blok semua e-mel masuk yang tidak mempunyai nombor tiket yang sah tertakluk dengan Dari: @ example.com alamat.',
        'Defines the sender for rejected emails.' => 'Mentakrifkan penghantar untuk emel yang ditolak.',
        'Defines the subject for rejected emails.' => 'Mentakrifkan subjek untuk emel yang ditolak.',
        'Defines the body text for rejected emails.' => 'Mentakrifkan teks badan untuk e-mel yang ditolak.',
        'Module to use database filter storage.' => 'Modul untuk menggunakan penyimpanan penapis pangkalan data.',
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
            'Memeriksa jika emel adalah susulan kepada tiket yang sedia ada dengan mencari subjek untuk nombor tiket yang sah.',
        'Executes follow-up checks on In-Reply-To or References headers for mails that don\'t have a ticket number in the subject.' =>
            'Melaksanakan semakan susulan dalam pada In-Reply-To atau headers Rujukan untuk mel yang tidak mempunyai nombor tiket di dalam subjek.',
        'Executes follow-up checks on email body for mails that don\'t have a ticket number in the subject.' =>
            'Melaksanakan pemeriksaan susulan ke atas badan e-mel untuk mel yang tidak mempunyai nombor tiket dalam subjek.',
        'Executes follow-up checks on attachment contents for mails that don\'t have a ticket number in the subject.' =>
            'Melaksanakan pemeriksaan susulan ke atas kandungan lampiran untuk mel yang tidak mempunyai nombor tiket dalam subjek.',
        'Executes follow-up checks on the raw source email for mails that don\'t have a ticket number in the subject.' =>
            'Melaksanakan pemeriksaan susulan ke atas e-mel sumber mentah untuk mel yang tidak mempunyai nombor tiket dalam subjek.',
        'Checks if an email is a follow-up to an existing ticket with external ticket number which can be found by ExternalTicketNumberRecognition filter module.' =>
            '',
        'Controls if CustomerID is automatically copied from the sender address for unknown customers.' =>
            '',
        'If this regex matches, no message will be send by the autoresponder.' =>
            'Jika regex ini padan, tiada mesej akan dihantar oleh tindak balas auto.',
        'If this option is enabled, tickets created via the web interface, via Customers or Agents, will receive an autoresponse if configured. If this option is not enabled, no autoresponses will be sent.' =>
            '',
        'Links 2 tickets with a "Normal" type link.' => 'Pautkan 2 tiket dengan pautan jenis "Normal".',
        'Links 2 tickets with a "ParentChild" type link.' => 'Pautkan 2 tiket dengan pautan jenis "ParentChild".',
        'Defines, which tickets of which ticket state types should not be listed in linked ticket lists.' =>
            'Mentakrifkan, tiket mana dari jenis keadaan tiket yang mana tidak boleh disenaraikan dalam senarai tiket berkaitan.',
        'For these state types the ticket numbers are striked through in the link table.' =>
            '',
        'Module to generate ticket statistics.' => 'Modul untuk menjana statistik tiket.',
        'Determines if the statistics module may generate ticket lists.' =>
            'Menentukan jika modul statistik boleh menjana senarai tiket.',
        'Module to generate accounted time ticket statistics.' => 'Modul untuk menjana statistik tiket masa yang diperuntukkan',
        'Module to generate ticket solution and response time statistics.' =>
            'Modul untuk menjana penyelesaian tiket dan statistik masa tindak balas.',
        'Set the default height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Tetapkan ketinggian default (dalam piksel) artikel inline HTML dalam AgentTicketZoom.',
        'Set the maximum height (in pixels) of inline HTML articles in AgentTicketZoom.' =>
            'Tetapkan ketinggian maksimum (dalam piksel) artikel inline HTML dalam AgentTicketZoom.',
        'The maximal number of articles expanded on a single page in AgentTicketZoom.' =>
            'Bilangan maksimum artikel diperluaskan pada satu halaman dalam ZumTiketAgen .',
        'The maximal number of articles shown on a single page in AgentTicketZoom.' =>
            'Bilangan maksimum artikel pada satu halaman dalam ZumTiketAgen .',
        'Show article as rich text even if rich text writing is disabled.' =>
            'Menunjukkan artikel sebagai teks walaupun penulisan teks aneka dimatikan.',
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
            'Mentakrifkan default yang ditunjukkan tiket sifat pencarian skrin carian tiket. Contoh: "Utama" mesti mempunyai nama medan dinamik dalam kes ini \'X\', "Kandungan" mesti mempunyai nilai medan dinamik bergantung kepada jenis Medan Dinamik, Teks: \'teks\', jatuh turun: \'1\', Tarikh/Masa: \'Search_DynamicField_XTimeSlotStartYear = 1974;
Search_DynamicField_XTimeSlotStartMonth=01; Search_DynamicField_XTimeSlotStartDay=26; Search_DynamicField_XTimeSlotStartHour=00; Search_DynamicField_XTimeSlotStartMinute=00; Search_DynamicField_XTimeSlotStartSecond=00; Search_DynamicField_XTimeSlotStopYear=2013; Search_DynamicField_XTimeSlotStopMonth=01; Search_DynamicField_XTimeSlotStopDay=26; Search_DynamicField_XTimeSlotStopHour=23; Search_DynamicField_XTimeSlotStopMinute=59; Search_DynamicField_XTimeSlotStopSecond=59;\' and or \'Search_DynamicField_XTimePointFormat=week; Search_DynamicField_XTimePointStart=Before; Search_DynamicField_XTimePointValue=7\';.',
        'Dynamic Fields used to export the search result in CSV format.' =>
            'Medan Dinamik digunakan untuk export hasil carian dalam format CSV.',
        'Dynamic fields shown in the ticket search screen of the customer interface.' =>
            '',
        'Dynamic fields shown in the ticket search overview results screen of the customer interface.' =>
            '',
        'Event module registration. For more performance you can define a trigger event (e. g. Event =&gt; TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            '',
        'Configures a default TicketDynamicField setting. "Name" defines the dynamic field which should be used, "Value" is the data that will be set, and "Event" defines the trigger event. Please check the developer manual (https://doc.znuny.org/manual/developer/), chapter "Ticket Event Module".' =>
            'Mengkonfigurasi tetapan TicketDynamicField default. "Nama" mentakrifkan bidang dinamik yang sepatutnya digunakan, "Nilai" adalah data yang akan diset, dan "Event" mentakrifkan peristiwa pencetus. Sila semak manual pemaju (https://doc.znuny.org/manual/developer/), bab "Tiket Acara Modul".',
        'Defines the list of types for templates.' => 'Mentakrifkan senarai jenis untuk templat.',
        'List of default Standard Templates which are assigned automatically to new Queues upon creation.' =>
            'Senarai Templat Piawai default yang ditetapkan secara automatik kepada Barisan baharu atas penciptaan.',
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
            'Jenis paparan default untuk nama penerima (Ke,Cc) dalam AgentTicketZoom dan CustomerTicketZoom.',
        'Default display type for sender (From) names in AgentTicketZoom and CustomerTicketZoom.' =>
            'Jenis paparan default untuk nama penghantar (Daripada) dalam AgentTicketZoom dan CustomerTicketZoom.',
        'Define which columns are shown in the linked tickets widget (LinkObject::ViewMode = "complex"). Note: Only Ticket attributes and Dynamic Fields (DynamicField_NameX) are allowed for DefaultColumns.' =>
            '',
        'Whether or not to collect meta information from articles using filters configured in Ticket::Frontend::ZoomCollectMetaFilters.' =>
            '',
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
        'invalid-temporarily' => 'tidak sah-sementara',
        'Group for default access.' => 'Kumpulan untuk akses lalai.',
        'Group of all administrators.' => 'Kumpulan seluruh pentadbir.',
        'Group for statistics access.' => 'Kumpulan untuk akses statistik.',
        'Group for time accounting web service access.' => '',
        'new' => 'baru',
        'All new state types (default: viewable).' => 'Seluruh jenis keadaan baru (lalai: boleh dilihat).',
        'open' => 'buka',
        'All open state types (default: viewable).' => 'Seluruh jenis keadaan buka (lalai: boleh dilihat).',
        'closed' => 'ditutup',
        'All closed state types (default: not viewable).' => 'Seluruh jenis keadaan tutup (lalai: boleh dilihat).',
        'pending reminder' => 'Peringatan tergantung',
        'All \'pending reminder\' state types (default: viewable).' => 'Seluruh jenis keadaan \'tangguh peringatan\' (lalai: boleh dilihat).',
        'pending auto' => 'auto tergantung',
        'All \'pending auto *\' state types (default: viewable).' => 'Seluruh jenis keadaan \'tangguh automatik *\' (lalai: boleh dilihat).',
        'removed' => 'Dibuang',
        'All \'removed\' state types (default: not viewable).' => 'Seluruh jenis keadaan \'buang\' (lalai: tidak boleh dilihat).',
        'merged' => 'Digabungkan',
        'State type for merged tickets (default: not viewable).' => 'Jenis keadaan untuk tiket bergabung (lalai: tidak boleh dilihat).',
        'New ticket created by customer.' => 'Tiket baru dicipta oleh pelanggan.',
        'closed successful' => 'Ditutup dengan jayanya',
        'Ticket is closed successful.' => 'Tiket ditutup dengan jayanya.',
        'closed unsuccessful' => 'Ditutup dengan gagalnya',
        'Ticket is closed unsuccessful.' => 'Tiket ditutup dengan gagalnya.',
        'Open tickets.' => 'Buka tiket.',
        'Customer removed ticket.' => 'Pelanggan membuang tiket.',
        'Ticket is pending for agent reminder.' => 'Tiket ditangguh untuk peringatan ejen.',
        'pending auto close+' => 'auto tergantung tutup+',
        'Ticket is pending for automatic close.' => 'Tiket ditangguh untuk tutup automatik.',
        'pending auto close-' => 'auto tergantung tutup-',
        'State for merged tickets.' => 'Keadaan untuk tiket bergabung.',
        'system standard salutation (en)' => 'Sistem piawaian penghormatan (en)',
        'Standard Salutation.' => 'Piawaian Penghormatan',
        'system standard signature (en)' => 'sistem piawaian tandatangan (en)',
        'Standard Signature.' => 'Piawaian Tandatangan',
        'Standard Address.' => 'Piawaian Alamat.',
        'possible' => 'mungkin',
        'Follow-ups for closed tickets are possible. Ticket will be reopened.' =>
            'Tindakan susulan untuk tiket yang ditutup adalah mungkin. Tiket akan dibuka semula.',
        'reject' => 'menolak',
        'Follow-ups for closed tickets are not possible. No new ticket will be created.' =>
            'Tindakan susulan untuk tiket yang ditutup adalah tidak mungkin. Tiada tiket baru akan dicipta.',
        'new ticket' => 'tiket baharu',
        'Follow-ups for closed tickets are not possible. A new ticket will be created.' =>
            '',
        'Postmaster queue.' => 'Barisan postmaster.',
        'All default incoming tickets.' => 'Semua tiket masuk lalai.',
        'All junk tickets.' => 'Semua tiket-tiket lama.',
        'All misc tickets.' => 'Semua tiket pelbagai.',
        'auto reply' => 'balas auto',
        'Automatic reply which will be sent out after a new ticket has been created.' =>
            'Jawapan automatik yang akan dihantar selepas tiket baru dicipta.',
        'auto reject' => 'ditolak auto',
        'Automatic reject which will be sent out after a follow-up has been rejected (in case queue follow-up option is "reject").' =>
            'Penolakan automatik yang akan dihantar keluar selepas susulan telah ditolak (sekiranya pilihan susulan barisan ialah "tolak").',
        'auto follow up' => 'mengikut auto',
        'Automatic confirmation which is sent out after a follow-up has been received for a ticket (in case queue follow-up option is "possible").' =>
            'Pengesahan automatik yang dihantar selepas susulan diterima untuk tiket (sekiranya susulan barisan ialah "mungkin").',
        'auto reply/new ticket' => 'balas auto/tiket baru',
        'Automatic response which will be sent out after a follow-up has been rejected and a new ticket has been created (in case queue follow-up option is "new ticket").' =>
            'Tindakbalas automatik yang akan dihantar keluar selepas susulan telah ditolak dan tiket baharu telah dicipta (sekiranya pilihan susulan barisan ialah "tiket").',
        'auto remove' => 'buang auto',
        'Auto remove will be sent out after a customer removed the request.' =>
            'Penyingkiran automatik akan dihantar selepas pelanggan membuang permohonan.',
        'default reply (after new ticket has been created)' => 'Jawapan default (selepas tiket baharu telah dicipta)',
        'default reject (after follow-up and rejected of a closed ticket)' =>
            'Penolakan default (selepas susulan dan ditolak bagi tiket yang ditutup)',
        'default follow-up (after a ticket follow-up has been added)' => 'Susulan default (selepas susulan tiket sudah ditambah)',
        'default reject/new ticket created (after closed follow-up with new ticket creation)' =>
            'Penolakan default/tiket baharu dicipta (selepas susulan ditutup dengan ciptaan tiket baharu)',
        'Unclassified' => 'Tidak diklasifikasikan',
        '1 very low' => '1 sangat rendah',
        '2 low' => '2 rendah',
        '3 normal' => '3 biasa',
        '4 high' => '4 tinggi',
        '5 very high' => '5 sangat tinggi',
        'unlock' => 'buka',
        'lock' => 'kunci',
        'tmp_lock' => 'tmp_lock',
        'agent' => 'ejen',
        'system' => 'sistem',
        'customer' => 'pelanggan',
        'Ticket create notification' => 'Pemberitahuan ciptaan tiket',
        'You will receive a notification each time a new ticket is created in one of your "My Queues" or "My Services".' =>
            '',
        'Ticket follow-up notification (unlocked)' => 'Pemberitahuan susulan tiket (buka kunci)',
        'You will receive a notification if a customer sends a follow-up to an unlocked ticket which is in your "My Queues" or "My Services".' =>
            '',
        'Ticket follow-up notification (locked)' => 'Pemberitahuan susulan tiket (dikunci)',
        'You will receive a notification if a customer sends a follow-up to a locked ticket of which you are the ticket owner or responsible.' =>
            '',
        'Ticket lock timeout notification' => 'Pemberitahuan tiket dikunci masa tamat',
        'You will receive a notification as soon as a ticket owned by you is automatically unlocked.' =>
            '',
        'Ticket owner update notification' => 'Pemberitahuan kemaskini pemilik tiket',
        'Ticket responsible update notification' => 'Pemberitahuan kemaskini tanggungjawab tiket',
        'Ticket new note notification' => 'Pemberitahuan nota tiket baru',
        'Ticket queue update notification' => 'Pemberitahuan kemas kini barisan tiket',
        'You will receive a notification if a ticket is moved into one of your "My Queues".' =>
            '',
        'Ticket pending reminder notification (locked)' => 'Pemberitahuan peringatan tiket tertangguh (dikunci)',
        'Ticket pending reminder notification (unlocked)' => 'Pemberitahuan peringatan tiket tertangguh (buka kunci)',
        'Ticket escalation notification' => 'Pemberitahuan peningkatan tiket ',
        'Ticket escalation warning notification' => 'Pemberitahuan amaran peningkatan tiket',
        'Ticket service update notification' => 'Pemberitahuan kemas kini servis tiket',
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
        'Add all' => 'Tambah semua',
        'An item with this name is already present.' => 'Item dengan nama ini sudah ada.',
        'This item still contains sub items. Are you sure you want to remove this item including its sub items?' =>
            'Item ini masih mengandungi barangan sub. Adakah anda pasti anda mahu mengeluarkan item ini termasuk barang-barang sub?',

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
            'Adakah anda benar-benar mahu untuk memadam bidang ini yang dinamik? SEMUA data yang berkaitan akan HILANG!',
        'Delete field' => 'Padam bidang',
        'Deleting the field and its data. This may take a while...' => 'Membuang bahagian serta datanya. Ini mungkin mengambil sedikit masa...',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericAgent.js
        'Remove this dynamic field' => '',
        'Remove selection' => 'Alih pilihan',
        'An error occurred during communication.' => 'Ralat berlaku semasa komunikasi.',
        'Duplicate event.' => 'Menyalin acara',
        'This event is already attached to the job, Please use a different one.' =>
            'Acara ini sudah dilampirkan pada tugas. Sila gunakan yang lain.',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceDebugger.js
        'Request Details' => 'Butiran Permintaan ',
        'Request Details for Communication ID' => '',
        'Show or hide the content.' => 'Menunjukkan atau menyembunyikan kandungan.',
        'Clear debug log' => 'debug log yang jelas',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceErrorHandling.js
        'Delete error handling module' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvoker.js
        'It is not possible to add a new event trigger because the event is not set.' =>
            '',
        'Delete this Invoker' => 'Padam Invoker ini',
        'Delete this Event Trigger' => 'Padam pencetus acara ini',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceInvokerEvent.js
        'Sorry, the only existing condition can\'t be removed.' => '',
        'Sorry, the only existing field can\'t be removed.' => '',
        'Delete conditions' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceMapping.js
        'Mapping for Key %s' => '',
        'Mapping for Key' => '',
        'Delete this Key Mapping' => 'Padam pemetaan kunci ini',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceOperation.js
        'Delete this Operation' => 'Padam operasi ini',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.GenericInterfaceWebservice.js
        'Clone web service' => 'Klon perkhidmatan web',
        'Delete operation' => 'Padam operasi',
        'Delete invoker' => 'Padam invoker',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Group.js
        'WARNING: When you change the name of the group \'admin\', before making the appropriate changes in the SysConfig, you will be locked out of the administrations panel! If this happens, please rename the group back to admin per SQL statement.' =>
            'AMARAN: Bila anda tukar nama kumpulan \'admin\'-sebelum membuat perubahan dalam SysConfig, anda akan mengunci panel admin! Jika ini berlaku, sila nama semula kumpulan kembali kepada admin seperti penyata SQL',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.MailAccount.js
        'Delete this Mail Account' => '',
        'Deleting the mail account and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.NotificationEvent.js
        'Do you really want to delete this notification language?' => 'Adakah anda pasti ingin menghapuskan bahasa pemberitahuan ini?',
        'Do you really want to delete this notification?' => 'Anda pasti mahu memadam pemberitahuan ini?',

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
        'Dismiss' => 'Abaikan',
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
        'Remove Entity from canvas' => 'Buang Entiti daripada kanvas',
        'No TransitionActions assigned.' => 'Tiada TransitionActions diberikan.',
        'No dialogs assigned yet. Just pick an activity dialog from the list on the left and drag it here.' =>
            'Tiada dialog diberikan lagi. Hanya pilih dialog aktiviti dari senarai di sebelah kiri dan tarik ke sini.',
        'This Activity cannot be deleted because it is the Start Activity.' =>
            'Aktiviti ini tidak boleh dihapuskan kerana ia adalah Aktiviti Mula.',
        'Remove the Transition from this Process' => 'Buang Peralihan Dari Proses ini',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.ProcessManagement.js
        'As soon as you use this button or link, you will leave this screen and its current state will be saved automatically. Do you want to continue?' =>
            'Selepas sahaja anda guna butang atau pautan ini, anda akan meninggalkan skrin ini dan keadaan semasa akan disimpan secara automatik. Adakah anda mahu teruskan?',
        'Delete Entity' => 'Padam Entiti',
        'This Activity is already used in the Process. You cannot add it twice!' =>
            'Aktiviti ini telah digunakan dalam Proses. Anda tidak boleh menambah dua kali!',
        'Error during AJAX communication' => '',
        'An unconnected transition is already placed on the canvas. Please connect this transition first before placing another transition.' =>
            'Peralihan yang tidak berkaitan sudah diletakkan di atas kanvas. Sila sambung peralihan ini terlebih dahulu sebelum meletakkan peralihan lain.',
        'This Transition is already used for this Activity. You cannot use it twice!' =>
            'Peralihan ini telah digunakan untuk aktiviti ini. Anda tidak boleh menggunakannya dua kali!',
        'This TransitionAction is already used in this Path. You cannot use it twice!' =>
            'TransitionAction ini telah digunakan dalam laluan ini. Anda tidak boleh menggunakannya dua kali!',
        'Hide EntityIDs' => 'Sembunyi EntityIDs',
        'Edit Field Details' => 'EditPerincianMedan',
        'Customer interface does not support articles not visible for customers.' =>
            '',
        'Sorry, the only existing parameter can\'t be removed.' => '',
        'Are you sure you want to overwrite the config parameters?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SMIME.js
        'Do you really want to delete this certificate?' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.SupportDataCollector.js
        'Generating...' => 'Menghasilkan...',
        'It was not possible to generate the Support Bundle.' => 'Ia adalah mustahil untuk menghasilkan Berkas Sokongan.',
        'Generate Result' => 'Hasilkan Keputusan',
        'Support Bundle' => 'Berkas Sokongan',

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
        'Loading...' => 'Memuatkan...',
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
            'Adakah anda benar-benar mahu memadam penyelenggaraan sistem berjadual ini?',

        # JS File: var/httpd/htdocs/js/Core.Agent.Admin.Template.js
        'Delete this Template' => '',
        'Deleting the template and its data. This may take a while...' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.AppointmentCalendar.js
        'Jump' => '',
        'Timeline Month' => '',
        'Timeline Week' => '',
        'Timeline Day' => '',
        'Previous' => 'Sebelum',
        'Resources' => '',
        'Su' => 'Ahd',
        'Mo' => 'Isn',
        'Tu' => 'Sel',
        'We' => 'Rbu',
        'Th' => 'Kha',
        'Fr' => 'Jum',
        'Sa' => 'Sab',
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
        'Duplicated entry' => 'kemasukan disalin',
        'It is going to be deleted from the field, please try again.' => 'Ia akan dipadam daripada medan, sila cuba lagi.',

        # JS File: var/httpd/htdocs/js/Core.Agent.CustomerUserAddressBook.js
        'Please enter at least one search value or * to find anything.' =>
            'Sila masukkan sekurang-kurangnya satu nilai carian atau * untuk mencari apa saja.',
        'Insert selected customer user(s) into the "%s:" field.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Daemon.js
        'Information about the Znuny Daemon' => 'Informasi mengenai Znuny Daemon',

        # JS File: var/httpd/htdocs/js/Core.Agent.Dashboard.js
        'Please check the fields marked as red for valid inputs.' => 'Sila semak bahagian yang bertanda merah untuk input sah.',
        'month' => 'bulan',
        'Remove active filters for this widget.' => 'Buang tapisan aktif untuk wiget ini.',

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
            'Maaf, tetapi anda tidak boleh mematikan semua kaedah untuk pemberitahuan yang ditanda sebagai mandatori.',
        'Sorry, but you can\'t disable all methods for this notification.' =>
            'Maaf, tetapi anda tidak boleh mematikan semua kaedah untuk pemberitahuan ini.',
        'Please note that at least one of the settings you have changed requires a page reload. Click here to reload the current screen.' =>
            '',
        'An unknown error occurred. Please contact the administrator.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.Responsive.js
        'Switch to desktop mode' => 'Tukar kepada mod komputer',

        # JS File: var/httpd/htdocs/js/Core.Agent.Search.js
        'Please remove the following words from your search as they cannot be searched for:' =>
            'Sila keluarkan perkataan yang berikut daripada carian kerana ia tidak boleh dicari:',

        # JS File: var/httpd/htdocs/js/Core.Agent.SharedSecretGenerator.js
        'Generate' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.SortedTree.js
        'This element has children elements and can currently not be removed.' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketAction.js
        'Select a customer ID to assign to this ticket' => '',
        'Do you really want to continue?' => 'Adakah anda benar-benar ingin meneruskan?',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketBulk.js
        ' ...and %s more' => '',
        ' ...show less' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketFormDraft.js
        'Add new draft' => '',
        'Delete draft' => '',
        'There are no more drafts available.' => '',
        'It was not possible to delete this draft.' => '',

        # JS File: var/httpd/htdocs/js/Core.Agent.TicketZoom.js
        'Article filter' => 'Tapisan artikel',
        'Apply' => 'Mohon',
        'Event Type Filter' => 'Tapisan Jenis Acara',

        # JS File: var/httpd/htdocs/js/Core.Agent.js
        'Slide the navigation bar' => 'Gelongsor bar navigasi',
        'Please turn off Compatibility Mode in Internet Explorer!' => 'Sila tutup Mod Keserasian dalam Internet Explorer!',

        # JS File: var/httpd/htdocs/js/Core.App.Responsive.js
        'Switch to mobile mode' => 'Tukar kepada mod telefon bimbit',

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
        'One or more errors occurred!' => 'Satu atau lebih kesilapan berlaku!',

        # JS File: var/httpd/htdocs/js/Core.Installer.js
        'Mail check successful.' => 'Semakan mel berjaya',
        'Error in the mail settings. Please correct and try again.' => 'Kesilapan dalam konfigurasi e-mel. Sila betulkan dan cuba lagi.',

        # JS File: var/httpd/htdocs/js/Core.SystemConfiguration.js
        'Open this node in a new window' => '',
        'Please add values for all keys before saving the setting.' => '',
        'The key must not be empty.' => '',
        'A key with this name (\'%s\') already exists.' => '',
        'Do you really want to revert this setting to its historical value?' =>
            '',

        # JS File: var/httpd/htdocs/js/Core.UI.Datepicker.js
        'Open date selection' => 'Buka pilihan tarikh',
        'Invalid date (need a future date)!' => 'Tarikh tidak sah (memerlukan tarikh di hadapan)!',
        'Invalid date (need a past date)!' => 'Tarikh tidak sah (memerlukan tarikh yang lepas)!',

        # JS File: var/httpd/htdocs/js/Core.UI.InputFields.js
        'Not available' => 'Tidak tersedia',
        'and %s more...' => 'dan %s lebih...',
        'Show current selection' => '',
        'Current selection' => '',
        'Clear all' => 'Padam semua',
        'Filters' => 'Tapisan',
        'Clear search' => 'Padam carian',

        # JS File: var/httpd/htdocs/js/Core.UI.Popup.js
        'If you now leave this page, all open popup windows will be closed, too!' =>
            'Jika anda meninggalkan halaman ini sekarang, kesemua tetingkap timbul juga akan ditutup!',
        'A popup of this screen is already open. Do you want to close it and load this one instead?' =>
            'Tetingkap timbul untuk skrin ini sudah dibuka. Adakah anda mahu menutupnya dan membuka yang ini?',
        'Could not open popup window. Please disable any popup blockers for this application.' =>
            'Tidak boleh membuka tetingkap pop timbul. Sila lumpuhkan sebarang penyekat pop timbul untuk aplikasi ini.',

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
        'There are currently no elements available to select from.' => 'Tiada elemen tersedia untuk dipilh.',

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
        'yes' => 'ya',
        'no' => 'tidak',
        'This is %s' => '',
        'Complex %s with %s arguments' => '',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSMultiBarChart.js
        'Grouped' => 'Digolongkan ',
        'Stacked' => 'Bertingkat',

        # JS File: var/httpd/htdocs/js/thirdparty/nvd3-1.7.1/models/OTRSStackedAreaChart.js
        'Stream' => 'Aliran',
        'Expanded' => 'Dikembangkan',

        # SysConfig
        '
Dear Customer,

Unfortunately we could not detect a valid ticket number
in your subject, so this email can\'t be processed.

Please create a new ticket via the customer panel.

Thanks for your help!

 Your Helpdesk Team
' => '

Pelanggan yang dihormati,

Malangnya kiami tidak dapat mengesan nombpr tiket yang sah
dalam subjek anda, jadi e-mel ini tidak boleh diproses.

Sila buat tiket baru melalui panel pelanggan.

Terima kasih atas bantuan anda!

Kumpulan MejaBantuan Anda
',
        ' (work units)' => '(unit kerja)',
        ' 2 minutes' => ' 2 Minit',
        ' 5 minutes' => ' 5 Minit',
        ' 7 minutes' => ' 7 Minit',
        '%s' => '%s',
        '(UserLogin) Firstname Lastname' => '(LogmasukPengguna) Namapertama Namaakhir',
        '(UserLogin) Lastname Firstname' => '(LogmasukPengguna) Namaakhir Namapertama',
        '(UserLogin) Lastname, Firstname' => '(LogmasukPengguna) Namaakhir, Namapertama ',
        '0 - Disabled' => '',
        '1 - Available' => '',
        '1 - Enabled' => '',
        '10 Minutes' => '',
        '100 (Expert)' => '',
        '15 Minutes' => '',
        '2 - Enabled and required' => '',
        '2 - Enabled and shown by default' => '',
        '2 - Enabled by default' => '',
        '2 Minutes' => '',
        '200 (Advanced)' => '',
        '30 Minutes' => '',
        '300 (Beginner)' => '',
        '5 Minutes' => '',
        'A TicketWatcher Module.' => '',
        'A Website' => 'Laman web',
        'A picture' => 'Gambar',
        'AJAX functions for notification event transport web service.' =>
            '',
        'AJAX interface for the web service dynamic field backends.' => '',
        'AccountedTime' => 'MasaDipertanggungjawab',
        'Activation of dynamic fields for screens.' => '',
        'Activity LinkTarget' => '',
        'Activity Notification' => '',
        'Activity.' => '',
        'ActivityID' => 'IDAktiviti',
        'Add a note to this ticket' => 'Tambah nota kepada tiket ini',
        'Add an inbound phone call to this ticket' => 'Tambah panggilan telefon masuk pada tiket ini.',
        'Add an outbound phone call to this ticket' => 'Tambah panggilan telefon keluar pada tiket ini.',
        'Added %s time unit(s), for a total of %s time unit(s).' => '',
        'Added email. %s' => 'Tambah emel. %s',
        'Added follow-up to ticket [%s]. %s' => '',
        'Added link to ticket "%s".' => 'Jalan pintas untuk "%s" dihasilkan.',
        'Added note (%s).' => '',
        'Added phone call from customer.' => '',
        'Added phone call to customer.' => '',
        'Added subscription for user "%s".' => 'Langgan Pengguna "%s" dimasukkan.',
        'Added system request (%s).' => '',
        'Added web request from customer.' => '',
        'Admin' => 'Admin',
        'Admin Area.' => '',
        'Admin Notification' => 'Pemberitahuan admin',
        'Admin configuration dialog for dynamic field types WebserviceDropdown and WebserviceMultiselect' =>
            '',
        'Admin modules overview.' => '',
        'Admin.' => 'Admin.',
        'Administration' => 'Pentadbiran',
        'Agent Customer Search' => '',
        'Agent Customer Search.' => '',
        'Agent Name' => '',
        'Agent Name + FromSeparator + System Address Display Name' => '',
        'Agent Preferences.' => '',
        'Agent Statistics.' => '',
        'Agent User Search' => '',
        'Agent User Search.' => '',
        'All CustomerIDs of a customer user.' => '',
        'All customer users of a CustomerID' => 'Semua pengguna pelanggan PelangganID',
        'All escalated tickets' => 'Semua peningkatan tiket',
        'All new tickets, these tickets have not been worked on yet' => 'Semua tiket baru, tiket ini masih belum dijalankan lagi',
        'All open tickets, these tickets have already been worked on.' =>
            '',
        'All tickets with a reminder set where the reminder date has been reached' =>
            'Semua tiket dengan set peringatan dimana tarikh peringatan telah tiba',
        'Allows extended search conditions in ticket search of the agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the customer interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows extended search conditions in ticket search of the generic agent interface. With this feature you can search e. g. ticket title with this kind of conditions like "(*key1*&&*key2*)" or "(*key1*||*key2*)".' =>
            '',
        'Allows having a medium format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Membolehkan mempunyai format tiket gambaran sederhana (CustomerInfo => 1 - juga menunjukkan maklumat pelanggan).',
        'Allows having a small format ticket overview (CustomerInfo => 1 - shows also the customer information).' =>
            'Membolehkan mempunyai format tiket gambaran kecil (InfoPelanggan => 1 - juga menunjukkan maklumat pelanggan).',
        'Always show RichText if available' => '',
        'An additional screen to add notes to a linked ticket.' => '',
        'Answer' => 'Jawapan',
        'Appointment Calendar overview page.' => '',
        'Appointment Notifications' => '',
        'Appointment edit screen.' => '',
        'Appointment list' => '',
        'Appointment list.' => '',
        'Appointment notifications' => '',
        'Arabic (Saudi Arabia)' => 'Arab (Arab Saudi)',
        'ArticleTree' => 'PokokArtikel',
        'Attachment Name' => 'Nama Lampiran',
        'Avatar' => '',
        'Based on global RichText setting' => '',
        'Bounced to "%s".' => 'bangkit satu "%s".',
        'Bulgarian' => 'Bulgaria',
        'Bulk Action' => 'Tindakan pukal',
        'CSV Separator' => 'Pengasing CSV',
        'Calendar manage screen.' => '',
        'Catalan' => 'Catalan',
        'Change password' => 'Ubah kata laluan',
        'Change queue!' => 'Ubah barisan',
        'Change the customer for this ticket' => 'Ubah pelanggan untuk tiket ini',
        'Change the free fields for this ticket' => 'Ubah medan bebas untuk tiket ini',
        'Change the owner for this ticket' => 'Tukar pemilik untuk tiket ini',
        'Change the priority for this ticket' => 'Ubah keutamaan untuk tiket ini',
        'Change the responsible for this ticket' => 'Ubah tanggungjawab untuk tiket ini',
        'Change your avatar image.' => '',
        'Change your password and more.' => '',
        'Changed SLA to "%s" (%s).' => '',
        'Changed archive state to "%s".' => '',
        'Changed customer to "%s".' => '',
        'Changed dynamic field %s from "%s" to "%s".' => '',
        'Changed owner to "%s" (%s).' => '',
        'Changed pending time to "%s".' => '',
        'Changed priority from "%s" (%s) to "%s" (%s).' => 'Keutamaan kemaskini dari "%s" (%s) ke "%s" (%s).',
        'Changed queue to "%s" (%s) from "%s" (%s).' => '',
        'Changed responsible to "%s" (%s).' => '',
        'Changed service to "%s" (%s).' => '',
        'Changed state from "%s" to "%s".' => '',
        'Changed title from "%s" to "%s".' => '',
        'Changed type from "%s" (%s) to "%s" (%s).' => '',
        'Chat communication channel.' => '',
        'Checkbox' => 'Kotak petak',
        'Child' => 'Child',
        'Chinese (Simplified)' => 'Cina (dipermudahkan)',
        'Chinese (Traditional)' => 'Cina (Tradisional)',
        'Choose for which kind of appointment changes you want to receive notifications.' =>
            '',
        'Choose for which kind of ticket changes you want to receive notifications. Please note that you can\'t completely disable notifications marked as mandatory.' =>
            '',
        'Choose which notifications you\'d like to receive.' => '',
        'Christmas Eve' => 'Perayaan Natal',
        'Close this ticket' => 'Tutup tiket ini',
        'Closed tickets (customer user)' => 'Tiket ditutup (pengguna pelanggan)',
        'Closed tickets (customer)' => 'Tiket ditutup (pelanggan)',
        'Column ticket filters for Ticket Overviews type "Small".' => 'Lajur penapis tiket untuk Tinjauan Tiket jenis "Kecil".',
        'Comment2' => 'Komen2',
        'Communication & Notifications' => '',
        'Communication Log GUI' => '',
        'Communication log limit per page for Communication Log Overview.' =>
            '',
        'CommunicationLog Overview Limit' => '',
        'Company Status' => 'Status Syarikat',
        'Company Tickets.' => '',
        'Compat module for AgentZoom to AgentTicketZoom.' => '',
        'Complex' => '',
        'Compose' => 'Mengarang',
        'Configure Processes.' => 'Konfigurasi Proses',
        'Configure and manage ACLs.' => 'Konfigurasi dan menguruskan ACLs.',
        'Configure which screen should be shown after a new ticket has been created.' =>
            'Konfigurasi skrin hendaklah ditunjukkan selepas tiket baru telah diwujudkan.',
        'Configure which screen should be shown after marking a ticket or article as seen.' =>
            '',
        'Configure which screen should be shown after marking a ticket or article as unseen.' =>
            '',
        'Create New process ticket.' => '',
        'Create Process Ticket' => '',
        'Create Ticket' => '',
        'Create a new calendar appointment linked to this ticket' => '',
        'Create a unit test file' => '',
        'Create and manage Service Level Agreements (SLAs).' => 'Mewujudkan dan menguruskan Perjanjian Tahap Perkhidmatan (SLA).',
        'Create and manage agents.' => 'Mewujudkan dan menguruskan ejen.',
        'Create and manage appointment notifications.' => '',
        'Create and manage attachments.' => 'Mewujudkan dan menguruskan lampiran.',
        'Create and manage calendars.' => '',
        'Create and manage customer users.' => 'Cipta dan urus pengguna pelanggan.',
        'Create and manage customers.' => 'Mewujudkan dan menguruskan pelanggan.',
        'Create and manage dynamic fields.' => 'Mewujudkan dan menguruskan bidang dinamik.',
        'Create and manage groups.' => 'Mewujudkan dan menguruskan kumpulan.',
        'Create and manage queues.' => 'Mewujudkan dan menguruskan barisan.',
        'Create and manage responses that are automatically sent.' => 'Mewujudkan dan menguruskan tindak balas yang dihantar secara automatik.',
        'Create and manage roles.' => 'Mewujudkan dan menguruskan peranan.',
        'Create and manage salutations.' => 'Mewujudkan dan menguruskan penghormatan.',
        'Create and manage services.' => 'Mewujudkan dan menguruskan perkhidmatan.',
        'Create and manage signatures.' => 'Mewujudkan dan menguruskan tanda tangan.',
        'Create and manage templates.' => 'Cipta dan urus templat.',
        'Create and manage ticket notifications.' => 'Cipta dan urus pemberitahuan tiket.',
        'Create and manage ticket priorities.' => 'Mewujudkan dan menguruskan keutamaan tiket.',
        'Create and manage ticket states.' => 'Mewujudkan dan menguruskan status tiket.',
        'Create and manage ticket types.' => 'Mewujudkan dan menguruskan jenis tiket.',
        'Create and manage web services.' => 'Mewujudkan dan menguruskan perkhidmatan web.',
        'Create new Ticket.' => '',
        'Create new appointment.' => '',
        'Create new email ticket and send this out (outbound).' => '',
        'Create new email ticket.' => '',
        'Create new phone ticket (inbound).' => '',
        'Create new phone ticket.' => '',
        'Create new process ticket.' => '',
        'Create tickets.' => '',
        'Created ticket [%s] in "%s" with priority "%s" and state "%s".' =>
            '',
        'Creates a unit test file for this ticket and sends it to Znuny.' =>
            '',
        'Creates a unit test file for this ticket.' => '',
        'Croatian' => 'Croatia',
        'Customer Administration' => 'Pentadbiran Pelanggan',
        'Customer Companies' => 'Firma Pelanggan',
        'Customer IDs' => '',
        'Customer Information Center Search.' => '',
        'Customer Information Center search.' => '',
        'Customer Information Center.' => '',
        'Customer Ticket Print Module.' => '',
        'Customer User Administration' => 'Pentadbiran Pengguna Pelanggan',
        'Customer User Information' => '',
        'Customer User Information Center Search.' => '',
        'Customer User Information Center search.' => '',
        'Customer User Information Center.' => '',
        'Customer User-Customer Relations' => '',
        'Customer preferences.' => '',
        'Customer ticket overview' => '',
        'Customer ticket search.' => '',
        'Customer ticket zoom' => '',
        'Customer user search' => 'Carian pengguna pelanggan',
        'CustomerID search' => 'Carian IDPelanggan',
        'CustomerName' => 'NamaPelanggan',
        'CustomerUser' => '',
        'Czech' => 'Czech',
        'Danish' => 'Denmark',
        'Dark' => '',
        'Dashboard overview.' => '',
        'Date / Time' => 'Tarikh / Masa',
        'Default agent name' => '',
        'Default value for NameX' => 'Nilai asal untuk NameX',
        'Define the queue comment 2.' => 'Tentukan barisan komen 2.',
        'Define the service comment 2.' => 'Tentukan perkhidmatan komen 2.',
        'Define the sla comment 2.' => 'Tentukan komen sla 2.',
        'Delete this ticket' => 'Padam tiket ini!',
        'Deleted link to ticket "%s".' => 'Jalan pintas untuk "%s" dipadam.',
        'Detached' => '',
        'Determines the strings that will be shown as recipient (To:) of the phone ticket and as sender (From:) of the email ticket in the agent interface. For Queue as NewQueueSelectionType "<Queue>" shows the names of the queues and for SystemAddress "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Menentukan string yang akan ditunjukkan sebagai penerima (Untuk:) tiket telefon dan sebagai penghantar (Dari:) tiket emel dalam antara muka ejen. Untuk Giliran sebagai NewQueueSelectionType "<Barisan>" menunjukkan nama-nama barisan dan untuk SystemAddress "<Realname> <<Emel>>" menunjukkan nama dan emel penerima.',
        'Determines the strings that will be shown as recipient (To:) of the ticket in the customer interface. For Queue as CustomerPanelSelectionType, "<Queue>" shows the names of the queues, and for SystemAddress, "<Realname> <<Email>>" shows the name and email of the recipient.' =>
            'Menentukan rangkaian yang akan dipamerkan sebagai penerima (Kepada:) tiket dalam paparan pelanggan. Untuk Barisan sebagai CustomerPanelSelectionType "<Barisan>" menunjukkan nama barisan dan untuk SystemAddress "<RealName> <<Email>>" menunjukkan nama dan emel penerima.',
        'Display communication log entries.' => '',
        'Down' => 'Bawah',
        'Dropdown' => 'Dropdown',
        'Dutch' => '',
        'Dynamic Fields Checkbox Backend GUI' => 'GUI Backend Checkbox Medan Dinamik',
        'Dynamic Fields Date Time Backend GUI' => 'GUI Backend Tarikh Masa Medan Dinamik',
        'Dynamic Fields Drop-down Backend GUI' => 'GUI Backend Drop-down Medan Dinamik',
        'Dynamic Fields GUI' => 'GUI Medan Dinamik',
        'Dynamic Fields Multiselect Backend GUI' => 'GUI Backend Multiselect Medan Dinamik',
        'Dynamic Fields Overview Limit' => 'Had Overview Medan Dinamik',
        'Dynamic Fields Text Backend GUI' => 'GUI Backend Teks Medan Dinamik',
        'Dynamic fields groups for process widget. The key is the name of the group, the value contains the fields to be shown. Example: \'Key => My Group\', \'Content: Name_X, NameY\'.' =>
            'Medan kumpulan dinamik untuk proses widget. Kuncinya adalah nama kumpulan, nilai mengandungi medan untuk ditunjukkan. Contoh: \'Kunci => Kumpulan Saya\', \'Kandungan: Nama_X, NamaY\'.',
        'Dynamic fields limit per page for Dynamic Fields Overview.' => '',
        'DynamicField' => 'MedanDinamik',
        'DynamicField_%s' => '',
        'E-Mail Outbound' => 'E-mel Menuju ke Luar',
        'Edit Customer Companies.' => '',
        'Edit Customer Users.' => '',
        'Edit appointment' => '',
        'Edit customer company' => 'Edit syarikat pelanggan',
        'Email Outbound' => '',
        'Email Resend' => '',
        'Email communication channel.' => '',
        'Enabled filters.' => 'Membolehkan tapisan.',
        'English (Canada)' => 'English (Kanada)',
        'English (United Kingdom)' => 'English (United Kingdom)',
        'English (United States)' => 'English (Amerika Syarikat)',
        'Enroll process for this ticket' => 'Mendaftar proses untuk tiket ini',
        'Enter your shared secret to enable two factor authentication. WARNING: Make sure that you add the shared secret to your generator application and the application works well. Otherwise you will be not able to login anymore without the two factor token.' =>
            '',
        'Escalated Tickets' => 'Peningkatan Tiket',
        'Escalation view' => 'Paparan lambungan',
        'EscalationTime' => 'MasaPeningkatan',
        'Estonian' => 'Estonia',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate).' =>
            'Acara pendaftaran modul. Untuk prestasi yang lebih anda boleh menentukan peristiwa pencetus (contoh: acara => CiptaTiket).',
        'Event module registration. For more performance you can define a trigger event (e. g. Event => TicketCreate). This is only possible if all Ticket dynamic fields need the same event.' =>
            'Pendaftaran modul acara. Untuk lebih prestasi anda boleh mentakrifkan acara pencetus (contoh: Event => TicketCreate). Ini hanya mungkin jika kesemua medan dinamik Tiket perlu acara yang sama.',
        'Events Ticket Calendar' => 'Kalendar Acara Tiket',
        'Execute SQL statements.' => 'Melaksanakan penyata SQL.',
        'External' => '',
        'External Link' => '',
        'Filter for debugging ACLs. Note: More ticket attributes can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Tapisan untuk nyahpepijat ACLs. Nota: Lebih sifat tiket boleh ditambah dalam format <OTRS_TICKET_Attribute> contoh: <OTRS_TICKET_Priority>.',
        'Filter for debugging Transitions. Note: More filters can be added in the format <OTRS_TICKET_Attribute> e.g. <OTRS_TICKET_Priority>.' =>
            'Tapisan untuk nyahpepijat Peralihan: Lebih sifat tiket boleh ditambah dalam format <OTRS_TICKET_Attribute> contoh: <OTRS_TICKET_Priority>.',
        'Filter incoming emails.' => 'Penapis emel masuk.',
        'Finnish' => 'Bahasa Finland',
        'First Christmas Day' => 'Hari Pertama Natal',
        'First Queue' => 'Barisan Pertama',
        'First response time' => '',
        'FirstLock' => 'KunciPertama',
        'FirstResponse' => 'ResponPertama',
        'FirstResponseDiffInMin' => 'FirstResponseDiffInMin',
        'FirstResponseInMin' => 'FirstResponseInMin',
        'Firstname Lastname' => 'Namapertama Namaakhir',
        'Firstname Lastname (UserLogin)' => 'Namapertama, Namaakhir (LogmasukPengguna)',
        'Forwarded to "%s".' => 'dikemukakan kepada "%s".',
        'Free Fields' => 'Bidang percuma',
        'French' => 'Bahasa Perancis',
        'French (Canada)' => 'Bahasa Perancis (Kanada)',
        'Frontend' => '',
        'Full value' => 'Nilai penuh',
        'Fulltext search' => 'Carian teks penuh',
        'Galician' => 'Galicia',
        'Generic Info module.' => '',
        'GenericAgent' => 'GenericAgent',
        'GenericInterface Debugger GUI' => 'GenericInterface Debugger GUI',
        'GenericInterface ErrorHandling GUI' => '',
        'GenericInterface Invoker Event GUI' => '',
        'GenericInterface Invoker GUI' => 'GenericInterface Pencetus GUI',
        'GenericInterface Operation GUI' => 'GenericInterface Operasi GUI',
        'GenericInterface TransportHTTPREST GUI' => 'GenericInterface TransportHTTPREST GUI',
        'GenericInterface TransportHTTPSOAP GUI' => 'GenericInterface TransportHTPSOAP GUI',
        'GenericInterface Web Service GUI' => 'GenericInterface GUI Perkhidmatan Web',
        'GenericInterface Web Service History GUI' => '',
        'GenericInterface Web Service Mapping GUI' => '',
        'German' => 'Jerman',
        'Gives customer users group based access to tickets from customer users of the same customer (ticket CustomerID is a CustomerID of the customer user).' =>
            '',
        'Global Search Module.' => '',
        'Go to dashboard!' => 'Pergi ke papan pemuka!',
        'Good PGP signature.' => '',
        'Google Authenticator' => 'Pengesah Google',
        'Graph: Bar Chart' => '',
        'Graph: Line Chart' => '',
        'Graph: Stacked Area Chart' => '',
        'Greek' => 'Yunani',
        'Hebrew' => 'Hebrew',
        'Hindi' => 'Hindi',
        'Hungarian' => 'Hungari',
        'If enabled the daemon will use this directory to create its PID files. Note: Please stop the daemon before any change and use this setting only if <$OTRSHome>/var/run/ can not be used.' =>
            '',
        'If enabled, the different overviews (Dashboard, LockedView, QueueView) will automatically refresh after the specified time.' =>
            'Jika diaktifkan, overviews yang berbeza (Dashboard, LockedView, QueueView) akan direfresh secara automatik selepas masa yang tertentu.',
        'If you\'re going to be out of office, you may wish to let other users know by setting the exact dates of your absence.' =>
            '',
        'Import appointments screen.' => '',
        'Incoming Phone Call.' => '',
        'Indonesian' => '',
        'Inline' => '',
        'Input' => 'Input',
        'Interface language' => 'Bahasa Paparan',
        'Internal' => '',
        'Internal communication channel.' => '',
        'International Workers\' Day' => 'Hari Pekerja Kebangsaan',
        'It was not possible to check the PGP signature, this may be caused by a missing public key or an unsupported algorithm.' =>
            '',
        'Italian' => 'Itali',
        'Japanese' => 'Jepun',
        'Korean' => '',
        'Language' => 'Bahasa',
        'Large' => 'Besar',
        'Last Mentions' => '',
        'Last Screen Overview' => '',
        'Last customer subject' => '',
        'Last view - limit' => '',
        'Last view - position' => '',
        'Last view - types' => '',
        'Last viewed overview' => '',
        'Last viewed screen' => '',
        'Lastname Firstname' => 'Namaakhir Namapertama',
        'Lastname Firstname (UserLogin)' => 'Namaakhir Namapertama (LogmasukPengguna)',
        'Lastname, Firstname' => 'Namaakhir, Namapertama',
        'Lastname, Firstname (UserLogin)' => 'Namaakhir, Namapertama (LogmasukPengguna)',
        'LastnameFirstname' => '',
        'Latvian' => 'Latvia',
        'Link Object' => 'Objek pautan',
        'Link Object.' => '',
        'Link agents to groups.' => 'Pautan ejen kepada kumpulan.',
        'Link agents to roles.' => 'Pautan ejen kepada peranan.',
        'Link customer users to customers.' => '',
        'Link customer users to groups.' => '',
        'Link customer users to services.' => '',
        'Link customers to groups.' => '',
        'Link queues to auto responses.' => 'Pautan aturan kepada tindak balas auto.',
        'Link roles to groups.' => 'Pautan peranan kepada kumpulan.',
        'Link templates to attachments.' => '',
        'Link templates to queues.' => 'Menghubungkan templat kepada barisan.',
        'Link this ticket to other objects' => 'Pautkan tiket ini kepada objek lain',
        'List view' => 'Paparan senarai',
        'Lithuanian' => 'Lithuania',
        'Lock / unlock this ticket' => 'Buka / kunci tiket ini',
        'Locked Tickets' => 'Tiket Dikunci',
        'Locked Tickets.' => '',
        'Locked ticket.' => 'Tiket ditutup.',
        'Logged in users.' => '',
        'Logged-In Users' => '',
        'Logout of customer panel.' => '',
        'Look into a ticket!' => 'Lihat kedalam tiket!',
        'Loop protection: no auto-response sent to "%s".' => '',
        'Macedonian' => '',
        'Mail Accounts' => 'Akaun Mel',
        'Malay' => 'Melayu',
        'Manage Customer User-Customer Relations.' => '',
        'Manage OAuth2 tokens and their configurations.' => '',
        'Manage PGP keys for email encryption.' => 'Mengurus kunci PGP untuk enkripsi emel.',
        'Manage POP3 or IMAP accounts to fetch email from.' => 'Mengurus akaun POP3 atau IMAP untuk mengambil emel dari.',
        'Manage S/MIME certificates for email encryption.' => 'Mengurus Perakuan S/MIME untuk enkripsi emel.',
        'Manage System Configuration Deployments.' => '',
        'Manage different calendars.' => '',
        'Manage existing sessions.' => 'Mengurus sesi yang sedia ada.',
        'Manage support data.' => 'Urus data sokongan.',
        'Manage system files.' => '',
        'Manage tasks triggered by event or time based execution.' => 'Uruskan tugas yang dicetuskan oleh acara atau pelaksanaan berdasarkan masa.',
        'Management of ticket attribute relations.' => '',
        'Mark as Spam!' => 'Tanda sebagai Spam!',
        'Mark as seen' => '',
        'Mark this ticket as junk!' => 'Tanda tiket ini sebagai junk!',
        'Mark ticket as seen' => '',
        'Mark ticket as unseen' => '',
        'Mattermost Username' => '',
        'Max. number of articles per page in TicketZoom' => '',
        'Medium' => 'Sederhana',
        'Mentioned in article' => '',
        'Mentioned in ticket' => '',
        'Mentions.' => '',
        'Merge this ticket and all articles into another ticket' => '',
        'Merged Ticket (%s/%s) to (%s/%s).' => '',
        'Merged Ticket <OTRS_TICKET> to <OTRS_MERGE_TO_TICKET>.' => 'Gabung Tiket <OTRS_TICKET> ke <OTRS_MERGE_TO_TICKET>.',
        'Minute' => '',
        'Miscellaneous' => 'Pelbagai',
        'Module to filter and manipulate incoming messages. Get a 4 digit number to ticket free text, use regex in Match e. g. From => \'(.+?)@.+?\', and use () as [***] in Set =>.' =>
            'Modul untuk menapis dan memanipulasi mesej yang masuk. Dapatkan nombor 4 digit kepada tiket bebas teks, guna regex dalam Padanan cth: From => \'(.+?)@.+?\', dan guna () sebagai [***] dalam Set =>.',
        'Multiselect' => 'Pelbagaipilih',
        'My Queues' => 'Barisan saya',
        'My Services' => 'Perkhidmatan Saya',
        'My last changed tickets' => '',
        'NameX' => 'NamaX',
        'New Tickets' => 'Tiket Baru',
        'New Window' => 'Tetingkap Baru',
        'New Year\'s Day' => 'Hari Tahun Baru',
        'New Year\'s Eve' => 'Perayaan Tahun Baru',
        'New process ticket' => 'Tiket proses baharu',
        'News' => '',
        'No public key found.' => '',
        'No valid OpenPGP data found.' => '',
        'None' => 'Tiada',
        'Norwegian' => 'Norway',
        'Notification Settings' => 'Tetapan Pemberitahuan',
        'Notified about response time escalation.' => '',
        'Notified about solution time escalation.' => '',
        'Notified about update time escalation.' => '',
        'Number of displayed tickets' => 'Jumlah tiket yang dipamerkan',
        'OAuth2' => '',
        'OAuth2 token' => '',
        'OTRS' => 'OTRS',
        'Open an external link!' => '',
        'Open tickets (customer user)' => 'Buka tiket (pengguna pelanggan)',
        'Open tickets (customer)' => 'Buka tiket (pelanggan)',
        'Option' => '',
        'Other Customers' => '',
        'Out Of Office' => 'Keluar Dari Pejabat',
        'Out Of Office Time' => 'Masa Keluar dari Pejabat',
        'Out of Office users.' => '',
        'Overview Escalated Tickets.' => '',
        'Overview Refresh Time' => 'Overview masa refresh',
        'Overview of all Tickets per assigned Queue.' => '',
        'Overview of all appointments.' => '',
        'Overview of all escalated tickets.' => '',
        'Overview of all open Tickets.' => 'Overview kesemua Tiket terbuka.',
        'Overview of all open tickets.' => '',
        'Overview of customer tickets.' => '',
        'PGP Key' => 'Kunci PGP',
        'PGP Key Management' => 'Pengurusan Kunci PGP',
        'PGP Keys' => 'Kunci PGP',
        'Parent' => 'Parent',
        'ParentChild' => '',
        'Pending time' => '',
        'People' => 'Orang',
        'Persian' => 'Persia',
        'Phone Call Inbound' => 'Panggilan telefon masuk',
        'Phone Call Outbound' => 'Panggilan telefon keluar',
        'Phone Call.' => '',
        'Phone call' => 'Panggilan telefon',
        'Phone communication channel.' => '',
        'Phone-Ticket' => 'Tiket-Telefon',
        'Picture Upload' => '',
        'Picture upload module.' => '',
        'Picture-Upload' => 'Muatnaik Gambar',
        'Plugin search' => '',
        'Plugin search module for autocomplete.' => '',
        'Polish' => 'Poland',
        'Portuguese' => 'Portugis',
        'Portuguese (Brasil)' => 'Portugis (Brazil)',
        'PostMaster Filters' => 'Penapis PostMaster',
        'Print this ticket' => 'Cetak tiket ini',
        'Priorities' => 'Keutamaan',
        'Process Management Activity Dialog GUI' => 'Dialog Aktiviti Pengurusan Proses GUI',
        'Process Management Activity GUI' => 'Aktiviti Pengurusan Proses GUI',
        'Process Management Path GUI' => 'Laluan Pengurusan Proses GUI',
        'Process Management Transition Action GUI' => 'GUI Tindakan Peralihan Pengurusan Proses ',
        'Process Management Transition GUI' => 'GUI Peralihan Pengurusan Proses ',
        'Process Ticket.' => '',
        'ProcessID' => 'IDProses',
        'Processes & Automation' => '',
        'Provides a matrix overview of the tickets per state per queue' =>
            '',
        'Provides customer users access to tickets even if the tickets are not assigned to a customer user of the same customer ID(s), based on permission groups.' =>
            '',
        'Public Calendar' => '',
        'Public calendar.' => '',
        'Queue view' => 'Paparan Aturan',
        'Refresh interval' => 'Tempoh selang refresh',
        'Reminder Tickets' => 'Peringatan Tiket',
        'Removed subscription for user "%s".' => 'Langgan Pengguna "%s" yang diadakan.',
        'Reports' => 'Laporan',
        'Resend Ticket Email.' => '',
        'Resent email to "%s".' => '',
        'Responsible Tickets' => '',
        'Responsible Tickets.' => '',
        'Right' => 'Kanan',
        'Romanian' => '',
        'Running Process Tickets' => 'Menjalankan Tiket Proses',
        'Russian' => 'Rusia',
        'S/MIME Certificates' => 'Sijil S/MIME',
        'Schedule a maintenance period.' => 'Menjadualkan satu tempoh penyelenggaraan.',
        'Screen after marking as seen' => '',
        'Screen after marking as unseen' => '',
        'Screen after new ticket' => 'Skrin selepas tiket baru',
        'Search Customer' => 'Carian Pelanggan',
        'Search Ticket.' => '',
        'Search Tickets.' => '',
        'Search User' => 'Cari Pengguna',
        'Search tickets.' => '',
        'Second Christmas Day' => 'Hari Kedua Natal',
        'Second Queue' => 'Barisan kedua',
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
            'Pilih pengasing karakter untuk diguna dalam fail CSV (statistik dan pencarian). Jika anda tidak pilih pengasing disini, pengasing sedia ada untuk bahasa anda akan digunakan.',
        'Select where to display the last views.' => '',
        'Select which types should be displayed.' => '',
        'Select your frontend Theme.' => 'Memilih tema frontend anda.',
        'Select your personal time zone. All times will be displayed relative to this time zone.' =>
            '',
        'Select your preferred layout for the software.' => '',
        'Select your preferred theme for OTRS.' => '',
        'Send a unit test file' => '',
        'Send new outgoing mail from this ticket' => 'Hantar mel keluar baru daripada tiket ini.',
        'Send notifications to users.' => 'Hantar notifikasi kepada pelanggan.',
        'Sent "%s" notification to "%s" via "%s".' => '',
        'Sent auto follow-up to "%s".' => '',
        'Sent auto reject to "%s".' => '',
        'Sent auto reply to "%s".' => '',
        'Sent email to "%s".' => '',
        'Sent email to customer.' => '',
        'Sent notification to "%s".' => '',
        'Serbian Cyrillic' => 'Serbia Cyril',
        'Serbian Latin' => 'Serbia Latin',
        'Service view' => 'Paparan perkhidmatan',
        'ServiceView' => '',
        'Set a new password by filling in your current password and a new one.' =>
            '',
        'Set sender email addresses for this system.' => 'Tetapkan alamat emel penghantar untuk sistem ini..',
        'Set this ticket to pending' => 'Tetapkan tiket ini kepada tergantung',
        'Shared Secret' => 'Rahsia Dikongsi',
        'Show the history for this ticket' => 'Tunjuk sejarah tiket.',
        'Show the ticket history' => 'Tunjuk sejarah tiket',
        'Shows a preview of the ticket overview (CustomerInfo => 1 - shows also Customer-Info, CustomerInfoMaxSize max. size in characters of Customer-Info).' =>
            'Menunjukkan previu overview tiket (CustomerInfo => 1 - tunjuk juga maklumat pelanggan, CustomerInfoMaxSize saiz maksimum aksara maklumat pelanggan).',
        'Shows information on how to start OTRS Daemon' => '',
        'Shows last mention of tickets.' => '',
        'Signature data.' => '',
        'Simple' => '',
        'Skin' => 'Kulit',
        'Slovak' => 'Slovakia',
        'Slovenian' => 'Slovenia',
        'Small' => 'Kecil',
        'Snippet' => '',
        'Software Package Manager.' => '',
        'Solution time' => '',
        'SolutionDiffInMin' => 'SolutionDiffInMin',
        'SolutionInMin' => 'SolutionInMin',
        'Some description!' => 'Sedikit penerangan!',
        'Some picture description!' => 'Sedikit penerangan gambar!',
        'Spam' => '',
        'Spanish' => 'Sepanyol',
        'Spanish (Colombia)' => 'Sepanyol (Columbia)',
        'Spanish (Mexico)' => 'Sepanyol (Mexico)',
        'Started response time escalation.' => '',
        'Started solution time escalation.' => '',
        'Started update time escalation.' => '',
        'Stat#' => 'Nombor Statistik.',
        'States' => 'Status',
        'Statistics overview.' => '',
        'Status view' => 'Paparan statistik',
        'Stopped response time escalation.' => '',
        'Stopped solution time escalation.' => '',
        'Stopped update time escalation.' => '',
        'Support Agent' => '',
        'Swahili' => 'Swahili',
        'Swedish' => 'Sweden',
        'System Address Display Name' => '',
        'System Configuration Deployment' => '',
        'System Configuration Group' => '',
        'System Maintenance' => ' Penyelenggaraan Sistem',
        'Textarea' => 'Textarea',
        'Thai' => 'Thai',
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
        'Theme' => 'Tema',
        'This is a Description for Comment on Framework.' => '',
        'This is a Description for DynamicField on Framework.' => '',
        'This is the dark skin for the agent interface.' => '',
        'This is the dark skin for the customer interface.' => '',
        'This is the default orange - black skin for the customer interface.' =>
            '',
        'This is the default orange - black skin.' => '',
        'This key is not certified with a trusted signature!' => '',
        'This module is part of the admin area of OTRS.' => '',
        'Ticket Close.' => '',
        'Ticket Compose Bounce Email.' => '',
        'Ticket Compose email Answer.' => '',
        'Ticket Customer.' => '',
        'Ticket Forward Email.' => '',
        'Ticket FreeText.' => '',
        'Ticket History.' => '',
        'Ticket Lock.' => '',
        'Ticket Merge.' => '',
        'Ticket Move.' => '',
        'Ticket Note.' => '',
        'Ticket Notifications' => 'Pemberitahuan tiket',
        'Ticket Outbound Email.' => '',
        'Ticket Overview "Medium" Limit' => 'Lihat semula Tiket "Sederhana" Had',
        'Ticket Overview "Preview" Limit' => 'Lihat semula Tiket "Yang Ditunjuk" Had',
        'Ticket Overview "Small" Limit' => 'Lihat semula tiket "Kecil" Had',
        'Ticket Owner.' => '',
        'Ticket Pending.' => '',
        'Ticket Print.' => '',
        'Ticket Priority.' => '',
        'Ticket Queue Overview' => 'Tinjauan Barisan Tiket',
        'Ticket Responsible.' => '',
        'Ticket Search' => '',
        'Ticket Watcher' => '',
        'Ticket Zoom' => '',
        'Ticket Zoom.' => '',
        'Ticket bulk module.' => 'modul pukal tiket',
        'Ticket creation' => '',
        'Ticket limit per page for Ticket Overview "Medium".' => '',
        'Ticket limit per page for Ticket Overview "Preview".' => '',
        'Ticket limit per page for Ticket Overview "Small".' => '',
        'Ticket notifications' => 'Pemberitahuan tiket',
        'Ticket overview' => 'Overview tiket',
        'Ticket plain view of an email.' => 'pandangan dataran tiket suatu e-mel',
        'Ticket split dialog.' => '',
        'Ticket title' => 'tajuk tiket',
        'Ticket zoom view.' => 'pandangan zum tiket',
        'TicketNumber' => 'NomborTiket',
        'Tickets.' => 'Tiket-tiket',
        'To accept login information, such as an EULA or license.' => '',
        'To download attachments.' => 'untuk memuat turun lampiran',
        'To view HTML attachments.' => '',
        'Tree view' => 'Lihat Pokok',
        'Turkish' => 'Turki',
        'Tweak the system as you wish.' => '',
        'Ukrainian' => 'Ukrain',
        'Unlocked ticket.' => 'Kunci Tiket dilepaskan.',
        'Up' => 'Atas',
        'Upcoming Events' => 'Acara akan datang',
        'Update time' => '',
        'Upload your PGP key.' => '',
        'Upload your S/MIME certificate.' => '',
        'User Profile' => 'Butiran Pengguna',
        'UserFirstname' => 'NamapertamaPengguna',
        'UserLastname' => 'NamaakhirPengguna',
        'Users, Groups & Roles' => '',
        'Vietnam' => 'Vietnam',
        'View performance benchmark results.' => 'Melihat hasil penanda aras prestasi.',
        'Watch this ticket' => 'Perhatikan tiket ini',
        'Watched Tickets' => 'Tiket Diperhati',
        'Watched Tickets.' => 'Tiket-tiket dilihat.',
        'We are performing scheduled maintenance.' => 'Kami sedang menjalankan penyelenggaraan berjadual.',
        'We are performing scheduled maintenance. Login is temporarily not available.' =>
            'Kami sedang menjalankan penyelenggaraan berjadual. Log masuk tidak tersedia buat sementara waktu.',
        'We are performing scheduled maintenance. We should be back online shortly.' =>
            'Kami sedang menjalankan penyelenggaraan berjadual. Kami akan kembali sebentar lagi.',
        'Web Services' => 'Perkhidmatan Web',
        'Web service (Dropdown)' => '',
        'Web service (Multiselect)' => '',
        'Web service dynamic field AJAX interface' => '',
        'Webservice' => '',
        'Yes, but hide archived tickets' => 'Ya, tetapi sembunyi tiket disimpan.',
        'Your email with ticket number "<OTRS_TICKET>" is bounced to "<OTRS_BOUNCE_TO>". Contact this address for further information.' =>
            'Emel anda dengan nombor tiket "<OTRS_TICKET>" dilantunkan ke "<OTRS_BOUNCE_TO>".  Hubungi alamat ini untuk maklumat lanjut. ',
        'Your email with ticket number "<OTRS_TICKET>" is merged to "<OTRS_MERGE_TO_TICKET>".' =>
            'Emel anda dengan nombor tiket "<OTRS_TICKET>" adalah digabungkan kepada "<OTRS_MERGE_TO_TICKET>"!',
        'Your queue selection of your preferred queues. You also get notified about those queues via email if enabled.' =>
            '',
        'Your service selection of your preferred services. You also get notified about those services via email if enabled.' =>
            '',
        'Your username in Mattermost without the leading @' => '',
        'Znuny.org - News' => '',
        'Zoom' => 'zoom',
        'all tickets' => '',
        'archived tickets' => '',
        'attachment' => 'lampiran',
        'bounce' => '',
        'compose' => '',
        'debug' => 'nyahpepijat',
        'error' => 'ralat',
        'forward' => 'Kemuka',
        'info' => 'info',
        'inline' => 'sebaris',
        'normal' => 'biasa',
        'not archived tickets' => '',
        'notice' => 'notis',
        'open in current tab' => '',
        'open in new tab' => '',
        'pending' => 'Tangguh',
        'phone' => 'Telefon',
        'responsible' => 'bertanggungjawab',
        'reverse' => 'berbalik',
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
