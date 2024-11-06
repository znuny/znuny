# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::CodeStyle::STDERRCheck)

package Kernel::Language;

use strict;
use warnings;
use Pod::Strip;

use Exporter qw(import);
our @EXPORT_OK = qw(Translatable);    ## no critic

use File::stat;
use Digest::MD5;

use Kernel::System::DateTime;

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::DateTime',
    'Kernel::System::Log',
    'Kernel::System::Main',
    'Kernel::System::SysConfig',
);

=head1 NAME

Kernel::Language - global language interface

=head1 DESCRIPTION

All language functions.

=head1 PUBLIC INTERFACE

=head2 new()

create a language object. Do not use it directly, instead use:

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new(
        'Kernel::Language' => {
            UserLanguage => 'de',
        },
    );
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {%Param};
    bless( $Self, $Type );

    # 0=off; 1=on; 2=get all not translated words; 3=get all requests
    $Self->{Debug} = 0;

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $MainObject   = $Kernel::OM->Get('Kernel::System::Main');
    my $LogObject    = $Kernel::OM->Get('Kernel::System::Log');

    # user language
    $Self->{UserLanguage} = $Param{UserLanguage}
        || $ConfigObject->Get('DefaultLanguage')
        || 'en';

    # check if language is configured
    my %Languages = %{ $ConfigObject->Get('DefaultUsedLanguages') };
    if ( !$Languages{ $Self->{UserLanguage} } ) {
        $Self->{UserLanguage} = 'en';
    }

    # take time zone
    $Self->{TimeZone} = $Param{UserTimeZone} || $Param{TimeZone} || Kernel::System::DateTime->OTRSTimeZoneGet();

    # Debug
    if ( $Self->{Debug} > 0 ) {
        $LogObject->Log(
            Priority => 'debug',
            Message  => "UserLanguage = $Self->{UserLanguage}",
        );
    }

    $Self->{Home}         = $ConfigObject->Get('Home') . '/';
    $Self->{DefaultTheme} = $ConfigObject->Get('DefaultTheme');
    $Self->{UsedWords}    = {};
    $Self->{UsedInJS}     = {};

    my $LanguageFile = "Kernel::Language::$Self->{UserLanguage}";

    # load text catalog ...
    if ( !$MainObject->Require($LanguageFile) ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Sorry, can't locate or load $LanguageFile "
                . "translation! Check the Kernel/Language/$Self->{UserLanguage}.pm (perl -cw)!",
        );
    }
    else {
        push @{ $Self->{LanguageFiles} }, "$Self->{Home}/Kernel/Language/$Self->{UserLanguage}.pm";
    }

    my $LanguageFileDataMethod = $LanguageFile->can('Data');

    # Execute translation map by calling language file data method via reference.
    if ($LanguageFileDataMethod) {
        if ( $LanguageFileDataMethod->($Self) ) {

            # Debug info.
            if ( $Self->{Debug} > 0 ) {
                $LogObject->Log(
                    Priority => 'debug',
                    Message  => "Kernel::Language::$Self->{UserLanguage} load ... done.",
                );
            }
        }
    }
    else {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Sorry, can't load $LanguageFile! Check if it provides Data method",
        );
    }

    # load action text catalog ...
    my $CustomTranslationModule = '';
    my $CustomTranslationFile   = '';

    # do not include addition translation files, a new translation file gets created
    if ( !$Param{TranslationFile} ) {

        # looking to addition translation files
        my @Files = $MainObject->DirectoryRead(
            Directory => $Self->{Home} . "Kernel/Language/",
            Filter    => "$Self->{UserLanguage}_*.pm",
        );
        FILE:
        for my $File (@Files) {

            # get module name based on file name
            my $Module = $File =~ s/^$Self->{Home}(.*)\.pm$/$1/rg;
            $Module =~ s/\/\//\//g;
            $Module =~ s/\//::/g;

            # Do we have a toplevel language without country code?
            if ( length $Self->{UserLanguage} == 2 ) {

                # Ignore sub-language translation files like (en_GB, en_CA, ...).
                #
                # This will not work for sr_Cyrl and sr_Latn, but in this case there is no "parent"
                #   language where this could be problematic.
                next FILE if $Module =~ /^Kernel::Language::[a-z]{2}_[A-Z]{2}$/;    # en_GB
                next FILE if $Module =~ /^Kernel::Language::[a-z]{2}_[A-Z]{2}_/;    # en_GB_ITSM*
            }

            # Remember custom files to load at the end.
            if ( $Module =~ /_Custom$/ ) {
                $CustomTranslationModule = $Module;
                $CustomTranslationFile   = $File;
                next FILE;
            }

            # load translation module
            if ( !$MainObject->Require($Module) ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "Sorry, can't load $Module! Check the $File (perl -cw)!",
                );
                next FILE;
            }
            else {
                push @{ $Self->{LanguageFiles} }, $File;
            }

            my $ModuleDataMethod = $Module->can('Data');

            if ( !$ModuleDataMethod ) {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "Sorry, can't load $Module! Check if it provides Data method.",
                );
                next FILE;
            }

            # Execute translation map by calling module data method via reference.
            if ( eval { $ModuleDataMethod->($Self) } ) {

                # debug info
                if ( $Self->{Debug} > 0 ) {
                    $LogObject->Log(
                        Priority => 'debug',
                        Message  => "$Module load ... done.",
                    );
                }
            }
        }

        # load custom text catalog ...
        if ( $CustomTranslationModule && $MainObject->Require($CustomTranslationModule) ) {

            push @{ $Self->{LanguageFiles} }, $CustomTranslationFile;

            my $CustomTranslationDataMethod = $CustomTranslationModule->can('Data');

            # Execute translation map by calling custom module data method via reference.
            if ($CustomTranslationDataMethod) {
                if ( eval { $CustomTranslationDataMethod->($Self) } ) {

                    # Debug info.
                    if ( $Self->{Debug} > 0 ) {
                        $LogObject->Log(
                            Priority => 'Debug',
                            Message  => "$CustomTranslationModule load ... done.",
                        );
                    }
                }
            }
            else {
                $LogObject->Log(
                    Priority => 'error',
                    Message  => "Sorry, can't load $CustomTranslationModule! Check if it provides Data method.",
                );
            }
        }
    }

    # if no return charset is given, use recommended return charset
    if ( !$Self->{ReturnCharset} ) {
        $Self->{ReturnCharset} = $Self->GetRecommendedCharset();
    }

    # get source file charset
    # what charset should I use (take it from translation file)!
    if ( $Self->{Charset} && ref $Self->{Charset} eq 'ARRAY' ) {
        $Self->{TranslationCharset} = $Self->{Charset}->[-1];
    }

    return $Self;
}

=head2 Translatable()

this is a no-op to mark a text as translatable in the Perl code.

Example:

    my $Selection = $LayoutObject BuildSelection (
        Data => {
            'and' => Translatable('and'),
            'or'  => Translatable('or'),
            'xor' => Translatable('xor'),
        },
        Name        => "ConditionLinking[_INDEX_]",
        Sort        => 'AlphanumericKey',
        Translation => 1,
        Class       => 'Modernize W50pc',
    );

=cut

sub Translatable {
    return shift;
}

=head2 Translate()

translate a text with placeholders.

    my $Text = $LanguageObject->Translate('Hello %s!', 'world');

=cut

sub Translate {
    my ( $Self, $Text, @Parameters ) = @_;

    $Text //= '';

    $Text = $Self->{Translation}->{$Text} || $Text;

    return $Text if !@Parameters;

    for my $Count ( 0 .. $#Parameters ) {
        return $Text if !defined $Parameters[$Count];
        $Text =~ s/\%(s|d)/$Parameters[$Count]/;
    }

    return $Text;
}

=head2 FormatTimeString()

formats a timestamp according to the specified date format for the current
language (locale).

    my $Date = $LanguageObject->FormatTimeString(
        '2009-12-12 12:12:12',  # timestamp
        'DateFormat',           # which date format to use, e. g. DateFormatLong
        0,                      # optional, hides the seconds from the time output
    );

Please note that the TimeZone will not be applied in the case of DateFormatShort (date only)
to avoid switching to another date.

If you only pass an ISO date ('2009-12-12'), it will be returned unchanged.
Invalid strings will also be returned with an error logged.

=cut

sub FormatTimeString {
    my ( $Self, $String, $Config, $Short ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    return '' if !$String;

    $Config ||= 'DateFormat';
    $Short  ||= 0;

    # Valid timestamp
    if ( $String =~ /(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2})/ ) {
        my $ReturnString = $Self->{$Config} || "$Config needs to be translated!";

        my $DateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                String => $String,
            },
        );

        if ( !$DateTimeObject ) {
            $LogObject->Log(
                Priority => 'error',
                Message  => "Invalid date/time string $String.",
            );

            return $String;
        }

        # Convert to time zone, but only if we actually display the time!
        # Otherwise the date might be off by one day because of the TimeZone diff.
        if ( $Self->{TimeZone} && $Config ne 'DateFormatShort' ) {
            $DateTimeObject->ToTimeZone( TimeZone => $Self->{TimeZone} );
        }

        my $DateTimeValues = $DateTimeObject->Get();

        my $Year      = $DateTimeValues->{Year};
        my $Month     = sprintf "%02d", $DateTimeValues->{Month};
        my $MonthAbbr = $DateTimeValues->{MonthAbbr};
        my $Day       = sprintf "%02d", $DateTimeValues->{Day};
        my $DayAbbr   = $DateTimeValues->{DayAbbr};
        my $Hour      = sprintf "%02d", $DateTimeValues->{Hour};
        my $Minute    = sprintf "%02d", $DateTimeValues->{Minute};
        my $Second    = sprintf "%02d", $DateTimeValues->{Second};

        if ($Short) {
            $ReturnString =~ s/\%T/$Hour:$Minute/g;
        }
        else {
            $ReturnString =~ s/\%T/$Hour:$Minute:$Second/g;
        }
        $ReturnString =~ s/\%D/$Day/g;
        $ReturnString =~ s/\%M/$Month/g;
        $ReturnString =~ s/\%Y/$Year/g;

        $ReturnString =~ s{(\%A)}{$Self->Translate($DayAbbr);}egx;
        $ReturnString
            =~ s{(\%B)}{$Self->Translate($MonthAbbr);}egx;

        # output time zone only if it differs from OTRS' time zone
        if (
            $Config ne 'DateFormatShort'
            && $Self->{TimeZone}
            && $Self->{TimeZone} ne Kernel::System::DateTime->OTRSTimeZoneGet()
            )
        {
            return $ReturnString . " ($Self->{TimeZone})";
        }

        return $ReturnString;
    }

    # Invalid string passed? (don't log for ISO dates)
    if ( $String !~ /^(\d{2}:\d{2}:\d{2})$/ ) {
        $LogObject->Log(
            Priority => 'notice',
            Message  => "No FormatTimeString() translation found for '$String' string!",
        );
    }

    return $String;

}

=head2 GetRecommendedCharset()

DEPRECATED. Don't use this function any more, 'utf-8' is always the internal charset.

Returns the recommended charset for frontend (based on translation
file or utf-8).

    my $Charset = $LanguageObject->GetRecommendedCharset();

=cut

sub GetRecommendedCharset {
    my $Self = shift;

    return 'utf-8';
}

=head2 GetPossibleCharsets()

Returns an array of possible charsets (based on translation file).

    my @Charsets = $LanguageObject->GetPossibleCharsets();

=cut

sub GetPossibleCharsets {
    my $Self = shift;

    return @{ $Self->{Charset} } if $Self->{Charset};
    return;
}

=head2 Time()

Returns a time string in language format (based on translation file).

    $Time = $LanguageObject->Time(
        Action => 'GET',
        Format => 'DateFormat',
    );

    $TimeLong = $LanguageObject->Time(
        Action => 'GET',
        Format => 'DateFormatLong',
    );

    $TimeLong = $LanguageObject->Time(
        Action => 'RETURN',
        Format => 'DateFormatLong',
        Year   => 1977,
        Month  => 10,
        Day    => 27,
        Hour   => 20,
        Minute => 10,
        Second => 05,
    );

These tags are supported: %A=WeekDay;%B=LongMonth;%T=Time;%D=Day;%M=Month;%Y=Year;

Note that %A only works correctly with Action GET, it might be dropped otherwise.

Also note that it is also possible to pass HTML strings for date input:

    $TimeLong = $LanguageObject->Time(
        Action => 'RETURN',
        Format => 'DateInputFormatLong',
        Mode   => 'NotNumeric',
        Year   => '<input value="2014"/>',
        Month  => '<input value="1"/>',
        Day    => '<input value="10"/>',
        Hour   => '<input value="11"/>',
        Minute => '<input value="12"/>',
        Second => '<input value="13"/>',
    );

Note that %B may not work in NonNumeric mode.

=cut

sub Time {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Needed (qw(Action Format)) {
        if ( !$Param{$Needed} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Needed!",
            );
            return;
        }
    }
    my $ReturnString = $Self->{ $Param{Format} } || 'Need to be translated!';
    my ( $Year, $Month, $MonthAbbr, $Day, $DayAbbr, $Hour, $Minute, $Second );

    # set or get time
    if ( lc $Param{Action} eq 'get' ) {

        my $DateTimeObject = $Kernel::OM->Create(
            'Kernel::System::DateTime',
            ObjectParams => {
                TimeZone => $Self->{TimeZone},
            },
        );
        my $DateTimeValues = $DateTimeObject->Get();

        $Year      = $DateTimeValues->{Year};
        $Month     = sprintf "%02d", $DateTimeValues->{Month};
        $MonthAbbr = $DateTimeValues->{MonthAbbr};
        $Day       = sprintf "%02d", $DateTimeValues->{Day};
        $DayAbbr   = $DateTimeValues->{DayAbbr};
        $Hour      = sprintf "%02d", $DateTimeValues->{Hour};
        $Minute    = sprintf "%02d", $DateTimeValues->{Minute};
        $Second    = sprintf "%02d", $DateTimeValues->{Second};
    }
    elsif ( lc $Param{Action} eq 'return' ) {
        $Year   = $Param{Year}   || 0;
        $Month  = $Param{Month}  || 0;
        $Day    = $Param{Day}    || 0;
        $Hour   = $Param{Hour}   || 0;
        $Minute = $Param{Minute} || 0;
        $Second = $Param{Second} || 0;

        my @MonthAbbrs = qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/;
        $MonthAbbr = defined $Month && $Month =~ m/^\d+$/ ? $MonthAbbrs[ $Month - 1 ] : '';
    }

    # do replace
    if ( ( lc $Param{Action} eq 'get' ) || ( lc $Param{Action} eq 'return' ) ) {
        my $Time = '';
        if ( $Param{Mode} && $Param{Mode} =~ /^NotNumeric$/i ) {
            if ( !$Second ) {
                $Time = "$Hour:$Minute";
            }
            else {
                $Time = "$Hour:$Minute:$Second";
            }
        }
        else {
            $Time  = sprintf( "%02d:%02d:%02d", $Hour, $Minute, $Second );
            $Day   = sprintf( "%02d",           $Day );
            $Month = sprintf( "%02d",           $Month );
        }

        # if we have an dynamic field Date or DateTime, we want to add additional div's
        # to use the css flex magic in the frontend
        if ( $Param{DynamicFieldConfig} && $Param{DynamicFieldConfig}->{FieldType} =~ /(Date|DateTime)/ ) {
            my ( $Date, $Time ) = split / - /, $ReturnString;
            $ReturnString = '';
            if ($Date) {
                $ReturnString .= '<div class="DynamicFieldDate">' . $Date . '</div>';
            }

            if ($Time) {
                $ReturnString .= '<div class="DynamicFieldTime">' . $Time . '</div>';
            }
        }

        if ($Time) {
            $ReturnString =~ s/\%T/$Time/g;
        }
        $ReturnString =~ s/\%D/$Day/g;
        $ReturnString =~ s/\%M/$Month/g;
        $ReturnString =~ s/\%Y/$Year/g;
        $ReturnString =~ s{(\%A)}{defined $DayAbbr ? $Self->Translate($DayAbbr) : '';}egx;
        $ReturnString =~ s{(\%B)}{defined $MonthAbbr ? $Self->Translate($MonthAbbr) : '';}egx;

        return $ReturnString;
    }

    return $ReturnString;
}

=head2 LanguageChecksum()

This function returns an MD5 sum that is generated from all loaded language files and their modification timestamps.
Whenever a file is changed, added or removed, this checksum will change.

=cut

sub LanguageChecksum {
    my $Self = shift;

    # Create a string with filenames and file modification times of the loaded language files.
    my $LanguageString = '';
    for my $File ( @{ $Self->{LanguageFiles} } ) {

        # get file metadata
        my $Stat = stat($File);

        if ( !$Stat ) {
            print STDERR "Error: cannot stat file '$File': $!";
            return;
        }

        $LanguageString .= $File . $Stat->mtime();
    }

    return Digest::MD5::md5_hex($LanguageString);
}

=head2 GetTTTemplateTranslatableStrings()

Returns an array of translation strings from tt templates.

    my @TranslationStrings = $LanguageObject->GetTTTemplateTranslatableStrings(
        ModuleDirectory => "$Home/...",  # optional, translates the Znuny module in the given directory
    );

Returns:

    my @TranslationStrings = (
        {
            Location => "TT Template: Kernel/Output/HTML/Templates/Standard/AdminACL.tt",
            Source   => 'Actions',
        }
    );

=cut

sub GetTTTemplateTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my @TranslationStrings;
    $Param{ModuleDirectory} ||= '';

    my $TemplatesDirectory = $Param{ModuleDirectory}
        ? "$Param{ModuleDirectory}/Kernel/Output/HTML/Templates/$Self->{DefaultTheme}"
        : "$Self->{Home}/Kernel/Output/HTML/Templates/$Self->{DefaultTheme}";

    my @TemplateList;
    if ( -d $TemplatesDirectory ) {
        @TemplateList = $MainObject->DirectoryRead(
            Directory => $TemplatesDirectory,
            Filter    => '*.tt',
            Recursive => 1,
        );
    }

    my $CustomTemplatesDir = "$Param{ModuleDirectory}/Custom/Kernel/Output/HTML/Templates/$Self->{DefaultTheme}";
    if ( $Param{ModuleDirectory} && -d $CustomTemplatesDir ) {
        my @CustomTemplateList = $MainObject->DirectoryRead(
            Directory => $CustomTemplatesDir,
            Filter    => '*.tt',
            Recursive => 1,
        );
        push @TemplateList, @CustomTemplateList;
    }

    for my $File (@TemplateList) {

        my $ContentRef = $MainObject->FileRead(
            Location => $File,
            Mode     => 'utf8',
        );

        if ( !ref $ContentRef ) {
            die "Can't open $File: $!";
        }

        my $Content = ${$ContentRef};

        $File =~ s{^.*/(Kernel/.+?)}{$1}smx;

        # do translation
        $Content =~ s{
            Translate\(
                \s*
                (["'])(.*?)(?<!\\)\1
        }
        {
            my $Word = $2 // '';

            # unescape any \" or \' signs
            $Word =~ s{\\"}{"}smxg;
            $Word =~ s{\\'}{'}smxg;

            if ( $Word && !$Self->{UsedWords}->{$Word}++ ) {

                push @TranslationStrings, {
                    Location => "TT Template: $File",
                    Source   => $Word,
                };
            }

            '';
        }egx;
    }

    return @TranslationStrings;
}

=head2 GetJSTemplateTranslatableStrings()

Returns an array of translation strings from JS templates.

    my @TranslationStrings = $LanguageObject->GetJSTemplateTranslatableStrings(
        ModuleDirectory  => "$Home/...",  # optional, translates the Znuny module in the given directory
    );

Returns:

    my @TranslationStrings = (
        {
            Location => "JS Template: Kernel/Output/JavaScript/Templates/Standard/Agent/TicketZoom/FormDraftDeleteDialog.html.tmpl",
            Source   => 'Cancel',
        }
    );

=cut

sub GetJSTemplateTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my @TranslationStrings;
    $Param{ModuleDirectory} ||= '';

    # Add strings from .html.tmpl files (JavaScript templates).
    my $JSTemplatesDirectory = $Param{ModuleDirectory}
        ? "$Param{ModuleDirectory}/Kernel/Output/JavaScript/Templates/$Self->{DefaultTheme}"
        : "$Self->{Home}/Kernel/Output/JavaScript/Templates/$Self->{DefaultTheme}";

    my @JSTemplateList;
    if ( -d $JSTemplatesDirectory ) {
        @JSTemplateList = $MainObject->DirectoryRead(
            Directory => $JSTemplatesDirectory,
            Filter    => '*.html.tmpl',
            Recursive => 1,
        );
    }

    my $CustomJSTemplatesDir
        = "$Param{ModuleDirectory}/Custom/Kernel/Output/JavaScript/Templates/$Self->{DefaultTheme}";
    if ( $Param{ModuleDirectory} && -d $CustomJSTemplatesDir ) {
        my @CustomJSTemplateList = $MainObject->DirectoryRead(
            Directory => $CustomJSTemplatesDir,
            Filter    => '*.html.tmpl',
            Recursive => 1,
        );
        push @JSTemplateList, @CustomJSTemplateList;
    }

    for my $File (@JSTemplateList) {

        my $ContentRef = $MainObject->FileRead(
            Location => $File,
            Mode     => 'utf8',
        );

        if ( !ref $ContentRef ) {
            die "Can't open $File: $!";
        }

        my $Content = ${$ContentRef};

        $File =~ s{^.*/(Kernel/.+?)}{$1}smx;

        # Find strings marked for translation.
        $Content =~ s{
            \{\{
            \s*
            (["'])(.*?)(?<!\\)\1
            \s*
            \|
            \s*
            Translate
        }
        {
            my $Word = $2 // '';

            # Unescape any \" or \' signs.
            $Word =~ s{\\"}{"}smxg;
            $Word =~ s{\\'}{'}smxg;

            if ( $Word && !$Self->{UsedWords}->{$Word}++ ) {
                push @TranslationStrings, {
                    Location => "JS Template: $File",
                    Source   => $Word,
                };
            }

            # Also save that this string was used in JS (for later use in Loader).
            $Self->{UsedInJS}->{$Word} = 1;

            '';
        }egx;
    }

    return @TranslationStrings;
}

=head2 GetPerlModuleTranslatableStrings()

Returns an array of translation strings from Perl modules mark with Translatable or Translate.

    my @TranslationStrings = $LanguageObject->GetPerlModuleTranslatableStrings(
        ModuleDirectory  => "$Home/...",  # optional, translates the Znuny module in the given directory
    );

Returns:

    my @TranslationStrings = (
        {
            Location => "Perl Module: Kernel/Modules/AdminACL.pm",
            Source   => 'This field is required',
        }
    );

=cut

sub GetPerlModuleTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my @TranslationStrings;
    $Param{ModuleDirectory} ||= '';

    # add translatable strings from Perl code
    my $PerlModuleDirectory = $Param{ModuleDirectory}
        ? "$Param{ModuleDirectory}/Kernel"
        : "$Self->{Home}/Kernel";

    my @PerlModuleList;
    if ( -d $PerlModuleDirectory ) {
        @PerlModuleList = $MainObject->DirectoryRead(
            Directory => $PerlModuleDirectory,
            Filter    => '*.pm',
            Recursive => 1,
        );
    }

    # include Custom folder for modules
    my $CustomKernelDir = "$Param{ModuleDirectory}/Custom/Kernel";
    if ( $Param{ModuleDirectory} && -d $CustomKernelDir ) {
        my @CustomPerlModuleList = $MainObject->DirectoryRead(
            Directory => $CustomKernelDir,
            Filter    => '*.pm',
            Recursive => 1,
        );
        push @PerlModuleList, @CustomPerlModuleList;
    }

    # Include some additional folders for modules.
    for my $AdditionalFolder ( 'var/packagesetup', 'var/processes/examples', 'var/webservices/examples' ) {
        if ( $Param{ModuleDirectory} && -d "$Param{ModuleDirectory}/$AdditionalFolder" ) {
            my @PackageSetupModuleList = $MainObject->DirectoryRead(
                Directory => "$Param{ModuleDirectory}/$AdditionalFolder",
                Filter    => '*.pm',
                Recursive => 1,
            );
            push @PerlModuleList, @PackageSetupModuleList;
        }
    }

    FILE:
    for my $File (@PerlModuleList) {

        next FILE if ( $File =~ m{cpan-lib}xms );
        next FILE if ( $File =~ m{Kernel/Config/Files}xms );

        my $ContentRef = $MainObject->FileRead(
            Location => $File,
            Mode     => 'utf8',
        );

        if ( !ref $ContentRef ) {
            die "Can't open $File: $!";
        }

        $File =~ s{^.*/(Kernel/)}{$1}smx;
        $File =~ s{^.*/(var/)}{$1}smx;

        my $Content = ${$ContentRef};

        # Remove POD
        my $PodStrip = Pod::Strip->new();
        $PodStrip->replace_with_comments(1);
        my $Code;
        $PodStrip->output_string( \$Code );
        $PodStrip->parse_string_document($Content);

        # Purge all comments
        $Code =~ s{^ \s* # .*? \n}{\n}xmsg;

        # do translation
        $Code =~ s{
            (?:
                ->Translate | Translatable
            )
            \(
                \s*
                (["'])(.*?)(?<!\\)\1
        }
        {
            my $Word = $2 // '';

            # unescape any \" or \' signs
            $Word =~ s{\\"}{"}smxg;
            $Word =~ s{\\'}{'}smxg;

            # Ignore strings containing variables
            my $SkipWord;
            $SkipWord = 1 if $Word =~ m{\$}xms;

            if ( $Word && !$SkipWord && !$Self->{UsedWords}->{$Word}++ ) {

                push @TranslationStrings, {
                    Location => "Perl Module: $File",
                    Source => $Word,
                };

            }
            '';
        }egx;
    }

    return @TranslationStrings;
}

=head2 GetXMLTranslatableStrings()

Returns an array of translation strings from JS templates.

    my @TranslationStrings = $LanguageObject->GetXMLTranslatableStrings(
        ModuleDirectory  => "$Home/...",  # optional, translates the Znuny module in the given directory
    );

Returns:

    my @TranslationStrings = (
        {
            Location => "XML Definition:  scripts/database/initial_insert.xml",
            Source   => 'This field is required',
        }
    );

=cut

sub GetXMLTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my @TranslationStrings;
    $Param{ModuleDirectory} ||= '';

    # add translatable strings from DB XML
    my @XMLFiles = $MainObject->DirectoryRead(
        Directory => "Kernel/Config/Files/XML",
        Recursive => 1,
        Filter    => '*.xml',
    );

    push @XMLFiles, "scripts/database/initial_insert.xml";

    if ( $Param{ModuleDirectory} ) {
        @XMLFiles = $MainObject->DirectoryRead(
            Directory => "$Param{ModuleDirectory}",
            Recursive => 1,
            Filter    => '*.sopm',
        );
    }

    FILE:
    for my $File (@XMLFiles) {

        my $ContentRef = $MainObject->FileRead(
            Location => $File,
            Mode     => 'utf8',
        );

        if ( !ref $ContentRef ) {
            die "Can't open $File: $!";
        }

        $File =~ s{^.*/(scripts/)}{$1}smx;
        $File =~ s{//}{/}g;
        if ( $Param{ModuleDirectory} ) {
            $File =~ s{^.*/(.+\.sopm)}{$1}smx;
        }

        my $Content = ${$ContentRef};
        next FILE if !$Content;

        # do translation
        $Content =~ s{
            <(Data|Description)[^>]+Translatable="1"[^>]*>(.*?)</\1>
        }
        {
            my $Word = $2 // '';
            if ( $Word && !$Self->{UsedWords}->{$Word}++ ) {
                push @TranslationStrings, {
                    Location => "XML Definition: $File",
                    Source   => $Word,
                };
            }
            '';
        }egx;
    }

    return @TranslationStrings;
}

=head2 GetJSTranslatableStrings()

Returns an array of translation strings from JS.

    my @TranslationStrings = $LanguageObject->GetJSTranslatableStrings(
        ModuleDirectory  => "$Home/...",  # optional, translates the Znuny module in the given directory
    );

Returns:

    my @TranslationStrings = (
        {
            Location => "JS File: var/httpd/htdocs/js/Core.Agent.Admin.ACL",
            Source   => 'Add all',
        }
    );

=cut

sub GetJSTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');

    my @TranslationStrings;
    $Param{ModuleDirectory} ||= '';

    # add translatable strings from JavaScript code
    my $JSDirectory = $Param{ModuleDirectory}
        ? "$Param{ModuleDirectory}/var/httpd/htdocs/js"
        : "$Self->{Home}/var/httpd/htdocs/js";

    my @JSFileList;
    if ( -d $JSDirectory ) {
        @JSFileList = $MainObject->DirectoryRead(
            Directory => $JSDirectory,
            Filter    => '*.js',
            Recursive => 1,
        );
    }

    FILE:
    for my $File (@JSFileList) {

        my $ContentRef = $MainObject->FileRead(
            Location => $File,
            Mode     => 'utf8',
        );

        if ( !ref $ContentRef ) {
            die "Can't open $File: $!";
        }

        # skip js cache files
        next FILE if ( $File =~ m{\/js\/js-cache\/}xmsg );

        my $Content = ${$ContentRef};

        # skip third-party files without custom markers
        if ( $File =~ m{\/js\/thirdparty\/}xmsg ) {
            next FILE if ( $Content !~ m{\/\/\s*OTRS}xmsg );
        }

        $File =~ s{^.*\/(var/httpd/htdocs/js.+?)}{$1}smx;

        # Purge all comments
        $Content =~ s{^ \s* // .*? \n}{\n}xmsg;

        # do translation
        $Content =~ s{
            (?:
                Core.Language.Translate
            )
            \(
                \s*
                (["'])(.*?)(?<!\\)\1
        }
        {
            my $Word = $2 // '';

            # unescape any \" or \' signs
            $Word =~ s{\\"}{"}smxg;
            $Word =~ s{\\'}{'}smxg;

            if ( $Word && !$Self->{UsedWords}->{$Word}++ ) {

                push @TranslationStrings, {
                    Location => "JS File: $File",
                    Source   => $Word,
                };

            }

            # also save that this string was used in JS (for later use in Loader)
            $Self->{UsedInJS}->{$Word} = 1;

            '';
        }egx;
    }

    return @TranslationStrings;
}

=head2 GetSysConfigTranslatableStrings()

Returns an array of translation strings from SysConfig.

    my @TranslationStrings = $LanguageObject->GetSysConfigTranslatableStrings();

Returns:

    my @TranslationStrings = (
        {
            Location => "SysConfig",
            Source   => 'Add all',
        }
    );

=cut

sub GetSysConfigTranslatableStrings {
    my ( $Self, %Param ) = @_;

    my @Strings = $Kernel::OM->Get('Kernel::System::SysConfig')->ConfigurationTranslatableStrings();
    my @TranslationStrings;

    STRING:
    for my $String ( sort @Strings ) {

        next STRING if !$String || $Self->{UsedWords}->{$String}++;

        push @TranslationStrings, {
            Location => 'SysConfig',
            Source   => $String,
        };
    }

    return @TranslationStrings;
}

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<https://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see L<https://www.gnu.org/licenses/gpl-3.0.txt>.

=cut
