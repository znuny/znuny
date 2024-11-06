# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::Console::Command::Dev::Tools::TranslationsUpdate;

use strict;
use warnings;

use parent qw(Kernel::System::Console::BaseCommand);

use File::Basename;
use File::Copy;
use Lingua::Translit;

use Kernel::Language;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DateTime',
    'Kernel::System::Encode',
    'Kernel::System::Main',
    'Kernel::System::Package',
);

sub Configure {
    my ( $Self, %Param ) = @_;

    $Self->Description('Update the Znuny translation files.');
    $Self->AddOption(
        Name        => 'language',
        Description => "Which language to use, omit to update all languages.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.+/,
    );
    $Self->AddOption(
        Name        => 'module-directory',
        Description => "Translate the Znuny module in the given directory.",
        Required    => 0,
        HasValue    => 1,
        ValueRegex  => qr/.+/,
    );
    $Self->AddOption(
        Name => 'generate-po',
        Description =>
            "Generate PO (translation content) files. This is only needed if a module is not yet available in Weblate to force initial creation of the gettext files.",
        Required => 0,
        HasValue => 0,
    );
    $Self->AddOption(
        Name => 'keep-old',
        Description =>
            "Keep old language files (e.g. Kernel/Language/de_GeneralCatalog.pm). This is only needed if you want to diff these files.",
        Required => 0,
        HasValue => 0,
    );

    my $Name = $Self->Name();

    $Self->AdditionalHelp(<<"EOF");

<yellow>Translating Znuny</yellow>

Make sure that you have a clean system with a current configuration. No modules may be installed or linked into the system!

    <green>znuny.Console.pl $Name --language de</green>

<yellow>Translating Extension Modules</yellow>

Make sure that you have a clean system with a current configuration. The module that needs to be translated has to be installed or linked into the system, but only this one!

    <green>znuny.Console.pl $Name --language de --module-directory \$PathToDirectory</green>
EOF

    return;
}

my $BreakLineAfterChars = 60;

sub PreRun {
    my ( $Self, %Param ) = @_;

    return $Self->ExitCodeOk() if $Self->GetOption('module-directory');

    my $Home = $Kernel::OM->Get('Kernel::Config')->Get('Home');

    $Self->Print("<yellow>Check for symbolic links...</yellow>");

    my @FilesInDirectory = $Kernel::OM->Get('Kernel::System::Main')->DirectoryRead(
        Directory => $Home,
        Filter    => '*',
        Silent    => 1,
    );

    my $LinkedFile = 0;
    for my $File (@FilesInDirectory) {
        if ( -l "$File" ) {
            $LinkedFile++;
            $Self->Print("<red>Linked file detected:</red> $File\n");
        }
    }
    $Self->Print("<green> Done.</green>\n");
    return $Self->ExitCodeOk() if !$LinkedFile;

    $Self->Print("\n<red>Make sure that all symbolic links are removed before.</red>\n");
    $Self->Print("<green>perl module-tools/bin/otrs.ModuleTools.pl Module::File::Unlink --all $Home</green>\n\n");

    die;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $ConfigObject  = $Kernel::OM->Get('Kernel::Config');
    my $MainObject    = $Kernel::OM->Get('Kernel::System::Main');
    my $PackageObject = $Kernel::OM->Get('Kernel::System::Package');

    my @Languages;
    my $LanguageOption = $Self->GetOption('language');
    my $Home           = $ConfigObject->Get('Home');

    # check params
    if ( !$LanguageOption ) {
        my %DefaultUsedLanguages = %{ $ConfigObject->Get('DefaultUsedLanguages') };
        @Languages = sort keys %DefaultUsedLanguages;
        @Languages = grep { $_ ne 'en' } @Languages;    # ignore en*.pm files
    }
    else {
        push @Languages, $LanguageOption;
        if ( !-f "$Home/Kernel/Language/$Languages[0].pm" ) {
            $Self->PrintError("No core translation file: $Languages[0]!");
            return $Self->ExitCodeError();
        }
    }

    $Self->Print("<yellow>Starting...</yellow>\n\n");

    # Gather some statistics
    my %Stats;

    my $ModuleCopyrightVendor;
    if ( $Self->GetOption('module-directory') ) {
        my @Files = $MainObject->DirectoryRead(
            Directory => $Self->GetOption('module-directory'),
            Filter    => '*.sopm',
        );

        my $FileContent = $MainObject->FileRead(
            Location => $Files[0],
        );

        my %SOPM = $PackageObject->PackageParse( String => $FileContent );

        if (%SOPM) {
            $ModuleCopyrightVendor = 'com' if $SOPM{URL}->{Content} =~ m{\bznuny\.com\b}i;
            $ModuleCopyrightVendor = 'org' if $SOPM{URL}->{Content} =~ m{\bznuny\.org\b}i;
        }

    }

    for my $Language (@Languages) {
        $Self->HandleLanguage(
            Language              => $Language,
            Module                => $Self->GetOption('module-directory'),
            ModuleCopyrightVendor => $ModuleCopyrightVendor,
            WritePO               => $Self->GetOption('generate-po'),
            Stats                 => \%Stats,
        );
    }

    $Self->Print("\n<yellow>Translation statistics:</yellow>\n");
    for my $Language (
        sort { ( $Stats{$b}->{Translated} // 0 ) <=> ( $Stats{$a}->{Translated} // 0 ) }
        keys %Stats
        )
    {
        my $Strings      = $Stats{$Language}->{Total}      // 0;
        my $Translations = $Stats{$Language}->{Translated} // 0;
        $Self->Print( "\t" . sprintf( "%7s", $Language ) . ": " );
        $Self->Print( sprintf( "%02d", int( ( $Translations / ( $Strings || 1 ) ) * 100 ) ) );
        $Self->Print( sprintf( "%% (%4d/%4d)\n", $Translations, $Strings ) );

    }

    $Self->Print("\n<green>Done.</green>\n");

    return $Self->ExitCodeOk();
}

my @OriginalTranslationStrings;

# Remember which strings came from JavaScript
my %UsedInJS;

sub HandleLanguage {
    my ( $Self, %Param ) = @_;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');

    my $Language = $Param{Language};

    # Language file, which contains all translations
    my $LanguageObject = Kernel::Language->new(
        UserLanguage => $Language,
    );

    my $Module = $Param{Module} || '';

    my $ModuleDirectory = $Module;
    my $LanguageFile;
    my $TargetFile;
    my $TargetPOTFile;
    my $TargetPOFile;
    my $IsSubTranslation;

    my $DefaultTheme = $ConfigObject->Get('DefaultTheme');

    # We need to map internal codes to the official ones used by Weblate
    my %WeblateLanguagesMap = (
        sr_Cyrl => 'sr',
        sr_Latn => 'sr',
    );

    my $WeblateLanguage = $WeblateLanguagesMap{$Language} // $Language;
    my $Home            = $ConfigObject->Get('Home');

    if ($Module) {
        $IsSubTranslation = 1;

        # extract module name from module path
        $Module = basename $Module;
        my $LanguageFile = $Module;

        $LanguageFile =~ s/\-//gix;

        # save module directory in target file
        $TargetFile = "$ModuleDirectory/Kernel/Language/${Language}_$LanguageFile.pm";

        $TargetPOTFile = "$ModuleDirectory/i18n/$Module/$Module.pot";
        $TargetPOFile  = "$ModuleDirectory/i18n/$Module/$Module.$WeblateLanguage.po";
    }
    else {
        $LanguageFile  = "$Home/Kernel/Language/$Language.pm";
        $TargetFile    = "$Home/Kernel/Language/$Language.pm";
        $TargetPOTFile = "$Home/i18n/Znuny/Znuny.pot";
        $TargetPOFile  = "$Home/i18n/Znuny/Znuny.$WeblateLanguage.po";
    }

    my $WritePOT = $Param{WritePO} || -e $TargetPOTFile;

    if ( !-w $TargetFile ) {
        if ( -w $TargetPOFile || $Self->GetOption('language') ) {
            $Self->Print(
                "Creating missing file <yellow>$TargetFile</yellow>\n"
            );
        }
        else {
            $Self->PrintError("Ignoring missing file $TargetFile!");
            return;
        }
    }

    if ( !@OriginalTranslationStrings ) {

        $Self->Print("<yellow>Extracting source strings, this can take a moment.</yellow>\n");

        # open .tt files and save all strings into @OriginalTranslationStrings
        $Self->Print("<yellow>Extracting TT Templates...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetTTTemplateTranslatableStrings(
            ModuleDirectory => $ModuleDirectory,
        );
        $Self->Print("<green> Done.</green>\n");

        $Self->Print("<yellow>Extracting JS Templates...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetJSTemplateTranslatableStrings(
            ModuleDirectory => $ModuleDirectory,
        );
        $Self->Print("<green> Done.</green>\n");

        $Self->Print("<yellow>Extracting PerlModule...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetPerlModuleTranslatableStrings(
            ModuleDirectory => $ModuleDirectory,
        );
        $Self->Print("<green> Done.</green>\n");

        $Self->Print("<yellow>Extracting XML...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetXMLTranslatableStrings(
            ModuleDirectory => $ModuleDirectory,
        );
        $Self->Print("<green> Done.</green>\n");

        $Self->Print("<yellow>Extracting JS...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetJSTranslatableStrings(
            ModuleDirectory => $ModuleDirectory,
        );
        $Self->Print("<green> Done.</green>\n");

        $Self->Print("<yellow>Extracting SysConfig...</yellow>");
        push @OriginalTranslationStrings, $LanguageObject->GetSysConfigTranslatableStrings();
        $Self->Print("<green> Done.</green>\n\n");

    }

    if ($IsSubTranslation) {
        $Self->Print(
            "Processing language <yellow>$Language</yellow> template files from <yellow>$Module</yellow>, writing output to <yellow>$TargetFile</yellow>\n"
        );
    }
    else {
        $Self->Print(
            "Processing language <yellow>$Language</yellow> template files, writing output to <yellow>$TargetFile</yellow>\n"
        );
    }

    # Language file, which only contains the Znuny core translations
    my $LanguageCoreObject = Kernel::Language->new(
        UserLanguage    => $Language,
        TranslationFile => 1,
    );

    # Helpers for SR Cyr2Lat Transliteration
    my $TranslitObject;
    my $TranslitLanguageCoreObject;
    my $TranslitLanguageObject;
    my %TranslitLanguagesMap = (
        sr_Latn => {
            SourceLanguage => 'sr_Cyrl',
            TranslitTable  => 'ISO/R 9',
        },
    );
    if ( $TranslitLanguagesMap{$Language} ) {
        $TranslitObject = new Lingua::Translit( $TranslitLanguagesMap{$Language}->{TranslitTable} );    ## no critic
        $TranslitLanguageCoreObject = Kernel::Language->new(
            UserLanguage    => $TranslitLanguagesMap{$Language}->{SourceLanguage},
            TranslationFile => 1,
        );
        $TranslitLanguageObject = Kernel::Language->new(
            UserLanguage => $TranslitLanguagesMap{$Language}->{SourceLanguage},
        );
    }

    my %POTranslations;

    if ( $WritePOT || $Param{WritePO} ) {
        %POTranslations = $Self->LoadPOFile(
            TargetPOFile => $TargetPOFile,
        );
    }

    my @TranslationStrings;

    STRING:
    for my $OriginalTranslationString (@OriginalTranslationStrings) {

        my $String = $OriginalTranslationString->{Source};

        # skip if we translate a module and the word already exists in the core translation
        next STRING if $IsSubTranslation && exists $LanguageCoreObject->{Translation}->{$String};

        my $Translation;

        # transliterate word from existing translation if language supports it
        if ( $TranslitLanguagesMap{$Language} ) {
            $Translation = $POTranslations{$String}
                || ( $IsSubTranslation ? $TranslitLanguageObject : $TranslitLanguageCoreObject )->{Translation}
                ->{$String};
            $Translation = $TranslitObject->translit($Translation) || '';
        }

        # lookup for existing translation
        else {
            $Translation = $POTranslations{$String}
                || ( $IsSubTranslation ? $LanguageObject : $LanguageCoreObject )->{Translation}
                ->{$String};
            $Translation ||= '';
        }

        push @TranslationStrings, {
            Location    => $OriginalTranslationString->{Location},
            Source      => $String,
            Translation => $Translation,
        };

        $Param{Stats}->{ $Param{Language} }->{Total}++;
        $Param{Stats}->{ $Param{Language} }->{Translated}++ if $Translation;
    }

    if ( $WritePOT && !$Self->{POTFileWritten}++ ) {
        $Self->WritePOTFile(
            TranslationStrings => \@TranslationStrings,
            TargetPOTFile      => $TargetPOTFile,
            Module             => $Module,
        );
    }
    if ( $Param{WritePO} && !$TranslitLanguagesMap{$Language} ) {
        $Self->WritePOFile(
            TranslationStrings => \@TranslationStrings,
            TargetPOTFile      => $TargetPOTFile,
            TargetPOFile       => $TargetPOFile,
            Module             => $Module,
        );
    }

    if ( !%UsedInJS && IsHashRefWithData( $LanguageObject->{UsedInJS} ) ) {
        %UsedInJS = %{ $LanguageObject->{UsedInJS} };
    }

    $Self->WritePerlLanguageFile(
        IsSubTranslation      => $IsSubTranslation,
        LanguageCoreObject    => $LanguageCoreObject,
        Language              => $Language,
        Module                => $Module,
        ModuleCopyrightVendor => $Param{ModuleCopyrightVendor},
        LanguageFile          => $LanguageFile,
        TargetFile            => $TargetFile,
        TranslationStrings    => \@TranslationStrings,
        UsedInJS              => \%UsedInJS,                      # Remember which strings came from JavaScript
    );
    return 1;
}

sub LoadPOFile {
    my ( $Self, %Param ) = @_;

    return if !-e $Param{TargetPOFile};

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    $MainObject->Require('Locale::PO') || die "Could not load Locale::PO";
    my $POEntries = Locale::PO->load_file_asarray( $Param{TargetPOFile} );

    my %POTranslations;

    ENTRY:
    for my $Entry ( @{$POEntries} ) {

        # Skip entries marked as "fuzzy" for now, as they may be very different than the source string.
        next ENTRY if $Entry->fuzzy();

        if ( $Entry->msgstr() ) {
            my $Source = $Entry->dequote( $Entry->msgid() );
            $Source =~ s/\\{2}/\\/g;
            $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Source );
            my $Translation = $Entry->dequote( $Entry->msgstr() );
            $Translation =~ s/\\{2}/\\/g;
            $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Translation );
            $POTranslations{$Source} = $Translation;
        }
    }

    return %POTranslations;
}

sub WritePOFile {
    my ( $Self, %Param ) = @_;

    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $EncodeObject = $Kernel::OM->Get('Kernel::System::Encode');

    $MainObject->Require('Locale::PO') || die "Could not load Locale::PO";

    if ( !-e $Param{TargetPOFile} ) {
        File::Copy::copy( $Param{TargetPOTFile}, $Param{TargetPOFile} )
            || die "Could not copy $Param{TargetPOTFile} to $Param{TargetPOFile}: $!";
    }

    my $POEntries = Locale::PO->load_file_asarray( $Param{TargetPOFile} );
    my %POLookup;

    for my $Entry ( @{$POEntries} ) {
        my $Source = $Entry->dequote( $Entry->msgid() );
        $Source =~ s/\\{2}/\\/g;
        $EncodeObject->EncodeInput( \$Source );
        $POLookup{$Source} = $Entry;
    }

    for my $String ( @{ $Param{TranslationStrings} } ) {

        my $Source = $String->{Source};
        $Source =~ s/\\/\\\\/g;
        $EncodeObject->EncodeOutput( \$Source );
        my $Translation = $String->{Translation};
        $Translation =~ s/\\/\\\\/g;
        $EncodeObject->EncodeOutput( \$Translation );

        # Is there an entry in the PO already?
        if ( exists $POLookup{ $String->{Source} } ) {

            # Yes, update it
            $POLookup{ $String->{Source} }->msgstr($Translation);
            $POLookup{ $String->{Source} }->automatic( $String->{Location} );
        }
        else {

            # No PO entry yet, create one.
            push @{$POEntries}, Locale::PO->new(
                -msgid     => $Source,
                -msgstr    => $Translation,
                -automatic => $String->{Location},
            );
        }
    }

    # Theoretically we could now also check for removed strings, but since the translations
    #   are handled by Weblate, this will not be needed as Weblate will handle that for us.
    Locale::PO->save_file_fromarray( $Param{TargetPOFile}, $POEntries )
        || die "Could not save file $Param{TargetPOFile}: $!";

    return 1;
}

sub WritePOTFile {
    my ( $Self, %Param ) = @_;

    my @POTEntries;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    $MainObject->Require('Locale::PO') || die "Could not load Locale::PO";

    my $Package = $Param{Module} // 'Znuny';

    # build creation date, only YEAR-MO-DA HO:MI is needed without seconds
    my $CreationDate = $Kernel::OM->Create('Kernel::System::DateTime')->Format(
        Format => '%Y-%m-%d %H:%M+0000'
    );

    push @POTEntries, Locale::PO->new(
        -msgid => '',
        -msgstr =>
            "Project-Id-Version: $Package\n" .
            "POT-Creation-Date: $CreationDate\n" .
            "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n" .
            "Last-Translator: FULL NAME <EMAIL\@ADDRESS>\n" .
            "Language-Team: LANGUAGE <LL\@li.org>\n" .
            "Language: \n" .
            "MIME-Version: 1.0\n" .
            "Content-Type: text/plain; charset=UTF-8\n" .
            "Content-Transfer-Encoding: 8bit\n",
    );

    for my $String ( @{ $Param{TranslationStrings} } ) {
        my $Source = $String->{Source};
        $Source =~ s/\\/\\\\/g;
        $Kernel::OM->Get('Kernel::System::Encode')->EncodeOutput( \$Source );

        push @POTEntries, Locale::PO->new(
            -msgid     => $Source,
            -msgstr    => '',
            -automatic => $String->{Location},
        );
    }

    # Avoid writing the file if the content is the same. In this case,
    #    only the CreationDate changes, which can cause issues in our toolchain.
    if ( -e $Param{TargetPOTFile} ) {
        my %PreviousPOTEntries = $Self->LoadPOFile( TargetPOFile => $Param{TargetPOTFile} );
        my @PreviousPOTEntries = sort grep { length $_ } keys %PreviousPOTEntries;
        my @NewPOTEntries      = sort map { $_->{Source} } @{ $Param{TranslationStrings} };
        my $DataIsDifferent    = DataIsDifferent(
            Data1 => \@PreviousPOTEntries,
            Data2 => \@NewPOTEntries
        );

        if ( !$DataIsDifferent ) {

            # File content is the same, don't write the file so the CreationDate stays the same.
            return;
        }
    }

    Locale::PO->save_file_fromarray( $Param{TargetPOTFile}, \@POTEntries )
        || die "Could not save file $Param{TargetPOTFile}: $!";

    return;
}

sub WritePerlLanguageFile {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my $LanguageCoreObject = $Param{LanguageCoreObject};

    my $Indent = ' ' x 8;    # 8 spaces for core files
    if ( $Param{IsSubTranslation} ) {
        $Indent = ' ' x 4;    # 4 spaces for module files
    }

    my $Data = '';

    my ( $StringsTotal, $StringsTranslated );

    my $PreviousLocation = '';
    for my $String ( @{ $Param{TranslationStrings} } ) {
        if ( $PreviousLocation ne $String->{Location} ) {
            $Data .= "\n";
            $Data .= $Indent . "# $String->{Location}\n";
            $PreviousLocation = $String->{Location};
        }

        $StringsTotal++;
        if ( $String->{Translation} ) {
            $StringsTranslated++;
        }

        # Escape ' signs in strings
        my $Key = $String->{Source};
        $Key =~ s/'/\\'/g;
        my $Translation = $String->{Translation};
        $Translation =~ s/'/\\'/g;

        if ( $Param{IsSubTranslation} ) {
            if ( index( $Key, "\n" ) > -1 || length($Key) < $BreakLineAfterChars ) {
                $Data .= $Indent . "\$Self->{Translation}->{'$Key'} = '$Translation';\n";
            }
            else {
                $Data .= $Indent . "\$Self->{Translation}->{'$Key'} =\n";
                $Data .= $Indent . '    ' . "'$Translation';\n";
            }
        }
        else {
            if ( index( $Key, "\n" ) > -1 || length($Key) < $BreakLineAfterChars ) {
                $Data .= $Indent . "'$Key' => '$Translation',\n";
            }
            else {
                $Data .= $Indent . "'$Key' =>\n";
                $Data .= $Indent . '    ' . "'$Translation',\n";
            }
        }
    }

    # add data structure for JS translations
    my $JSData = "    \$Self->{JavaScriptStrings} = [\n";

    if ( $Param{IsSubTranslation} ) {
        $JSData = '    push @{ $Self->{JavaScriptStrings} //= [] }, (' . "\n";
    }

    for my $String ( sort keys %{ $Param{UsedInJS} // {} } ) {
        my $Key = $String;
        $Key =~ s/'/\\'/g;
        $JSData .= $Indent . "'" . $Key . "',\n";
    }

    if ( $Param{IsSubTranslation} ) {
        $JSData .= "    );\n";
    }
    else {
        $JSData .= "    ];\n";
    }

    my %MetaData;
    my $NewOut = '';

    # translating a module
    if ( $Param{IsSubTranslation} ) {

        # needed for cvs check-in filter
        my $Separator = "# --";

        my $HeaderString = "# Copyright (C) ";

        if ( $Param{ModuleCopyrightVendor} ) {
            $HeaderString .= "2012 Znuny GmbH, https://znuny.com/" if $Param{ModuleCopyrightVendor} eq "com";
            $HeaderString .= "2021 Znuny GmbH, https://znuny.org/" if $Param{ModuleCopyrightVendor} eq "org";
        }

        $Param{Module} =~ s/\-//gix;

        $NewOut = <<"EOF";
$Separator
$HeaderString
$Separator
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
$Separator

package Kernel::Language::$Param{Language}_$Param{Module};

use strict;
use warnings;
use utf8;

sub Data {
    my \$Self = shift;
$Data

$JSData
}

1;
EOF
    }

    # translating the core
    else {
        ## no critic
        open( my $In, '<', $Param{LanguageFile} ) || die "Can't open: $Param{LanguageFile}\n";
        ## use critic
        while (<$In>) {
            my $Line = $_;
            $Kernel::OM->Get('Kernel::System::Encode')->EncodeInput( \$Line );
            if ( !$MetaData{DataPrinted} ) {
                $NewOut .= $Line;
            }
            if ( $_ =~ /\$\$START\$\$/ && !$MetaData{DataPrinted} ) {
                $MetaData{DataPrinted} = 1;

                $NewOut .= "    # possible charsets\n";
                $NewOut .= "    \$Self->{Charset} = [";
                for my $Charset ( $LanguageCoreObject->GetPossibleCharsets() ) {
                    $NewOut .= "'$Charset', ";
                }
                $NewOut .= "];\n";
                my $Completeness = 0;
                if ($StringsTranslated) {
                    $Completeness = $StringsTranslated / $StringsTotal;
                }
                $NewOut .= <<"EOF";
    # date formats (\%A=WeekDay;\%B=LongMonth;\%T=Time;\%D=Day;\%M=Month;\%Y=Year;)
    \$Self->{DateFormat}          = '$LanguageCoreObject->{DateFormat}';
    \$Self->{DateFormatLong}      = '$LanguageCoreObject->{DateFormatLong}';
    \$Self->{DateFormatShort}     = '$LanguageCoreObject->{DateFormatShort}';
    \$Self->{DateInputFormat}     = '$LanguageCoreObject->{DateInputFormat}';
    \$Self->{DateInputFormatLong} = '$LanguageCoreObject->{DateInputFormatLong}';
    \$Self->{Completeness}        = $Completeness;

    # csv separator
    \$Self->{Separator}         = '$LanguageCoreObject->{Separator}';

    \$Self->{DecimalSeparator}  = '$LanguageCoreObject->{DecimalSeparator}';
    \$Self->{ThousandSeparator} = '$LanguageCoreObject->{ThousandSeparator}';
EOF

                if ( $LanguageCoreObject->{TextDirection} ) {
                    $NewOut .= <<"EOF";
    # TextDirection rtl or ltr
    \$Self->{TextDirection} = '$LanguageCoreObject->{TextDirection}';

EOF
                }
                $NewOut .= <<"EOF";
    \$Self->{Translation} = {
$Data
    };

EOF
                $NewOut .= $JSData . "\n";
            }

            if ( $_ =~ /\$\$STOP\$\$/ ) {
                $NewOut .= $Line;
                $MetaData{DataPrinted} = 0;
            }
        }
        close $In;
    }

    my $TargetFile = $Param{TargetFile};

    if ( -e $TargetFile && $Self->GetOption('keep-old') ) {
        rename( $TargetFile, "$TargetFile.old" ) || die $!;
    }
    elsif ( -e $TargetFile ) {
        unlink($TargetFile);
    }

    $MainObject->FileWrite(
        Location => $TargetFile,
        Content  => \$NewOut,
        Mode     => 'utf8',        # binmode|utf8
    );

    return 1;
}

1;
