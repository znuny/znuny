# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));
use File::Path();

use Kernel::System::VariableCheck qw(:all);

$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);

my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
my $MainObject     = $Kernel::OM->Get('Kernel::System::Main');
my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

my $DefaultTheme = $ConfigObject->Get('DefaultTheme');
my $TempDir      = $ConfigObject->Get('TempDir');
my $ModuleDir    = "$TempDir/ZnunyLanguage";

if ( !-d $ModuleDir ) {
    File::Path::make_path( $ModuleDir, { chmod => 0770 } );    ## no critic
}

# GetTTTemplateTranslatableStrings
my @Tests = (
    {
        Name => '1. [% Translate("GetTTTemplateTranslatableStrings - Znuny rocks") | html %]',
        Data => {
            Filename  => 'Template.tt',
            Content   => '<h1>[% Translate("GetTTTemplateTranslatableStrings - Znuny rocks") | html %]</h1>',
            Directory => "$ModuleDir/Kernel/Output/HTML/Templates/$DefaultTheme",
        },
        Expected => [
            {
                'Location' => 'TT Template: Kernel/Output/HTML/Templates/Standard/Template.tt',
                'Source'   => 'GetTTTemplateTranslatableStrings - Znuny rocks',
            }
        ],
    },
);

for my $Test (@Tests) {

    if ( !-d $Test->{Data}->{Directory} ) {
        File::Path::make_path( $Test->{Data}->{Directory}, { chmod => 0770 } );    ## no critic
    }

    my $TemplateLocation = $MainObject->FileWrite(
        %{ $Test->{Data} },
        Permission => '644',
        Content    => \$Test->{Data}->{Content},
    );

    my @TranslationStrings = $LanguageObject->GetTTTemplateTranslatableStrings(
        ModuleDirectory => $ModuleDir,
    );

    $Self->IsDeeply(
        \@TranslationStrings,
        $Test->{Expected},
        'GetTTTemplateTranslatableStrings - ' . $Test->{Name},
    );
}

# GetJSTemplateTranslatableStrings
@Tests = (
    {
        Name => '1. <span>{{ "GetJSTemplateTranslatableStrings - Znuny rocks" | Translate }}</span>',
        Data => {
            Filename  => 'Template.html.tmpl',
            Content   => '<span>{{ "GetJSTemplateTranslatableStrings - Znuny rocks" | Translate }}</span>',
            Directory => "$ModuleDir/Kernel/Output/JavaScript/Templates/$DefaultTheme",
        },
        Expected => [
            {
                'Location' => 'JS Template: Kernel/Output/JavaScript/Templates/Standard/Template.html.tmpl',
                'Source'   => 'GetJSTemplateTranslatableStrings - Znuny rocks',
            }
        ],
    },
);

for my $Test (@Tests) {

    if ( !-d $Test->{Data}->{Directory} ) {
        File::Path::make_path( $Test->{Data}->{Directory}, { chmod => 0770 } );    ## no critic
    }

    my $TemplateLocation = $MainObject->FileWrite(
        %{ $Test->{Data} },
        Permission => '644',
        Content    => \$Test->{Data}->{Content},
    );

    my @TranslationStrings = $LanguageObject->GetJSTemplateTranslatableStrings(
        ModuleDirectory => $ModuleDir,
    );

    $Self->IsDeeply(
        \@TranslationStrings,
        $Test->{Expected},
        'GetJSTemplateTranslatableStrings - ' . $Test->{Name},
    );
}

# GetPerlModuleTranslatableStrings
@Tests = (
    {
        Name => '1. Translatable("GetPerlModuleTranslatableStrings - Znuny rocks")',
        Data => {
            Filename  => 'Nanok.pm',
            Content   => 'my $Strin = Translatable("GetPerlModuleTranslatableStrings - Znuny rocks");',
            Directory => "$ModuleDir/Kernel/",
        },
        Expected => [
            {
                'Location' => 'Perl Module: Kernel/Nanok.pm',
                'Source'   => 'GetPerlModuleTranslatableStrings - Znuny rocks',
            }
        ],
    },
);

for my $Test (@Tests) {

    if ( !-d $Test->{Data}->{Directory} ) {
        File::Path::make_path( $Test->{Data}->{Directory}, { chmod => 0770 } );    ## no critic
    }

    my $TemplateLocation = $MainObject->FileWrite(
        %{ $Test->{Data} },
        Permission => '644',
        Content    => \$Test->{Data}->{Content},
    );

    my @TranslationStrings = $LanguageObject->GetPerlModuleTranslatableStrings(
        ModuleDirectory => $ModuleDir,
    );

    $Self->IsDeeply(
        \@TranslationStrings,
        $Test->{Expected},
        'GetPerlModuleTranslatableStrings - ' . $Test->{Name},
    );
}

# GetXMLTranslatableStrings
@Tests = (
    {
        Name => '1. <Description Translatable="1">GetXMLTranslatableStrings - Znuny rocks</Description>',
        Data => {
            Filename  => 'Znuny.sopm',
            Content   => '<Description Translatable="1">GetXMLTranslatableStrings - Znuny rocks</Description>',
            Directory => "$ModuleDir/Znuny/",
        },
        Expected => [
            {
                'Location' => 'XML Definition: Znuny.sopm',
                'Source'   => 'GetXMLTranslatableStrings - Znuny rocks',
            }
        ],
    },
);

for my $Test (@Tests) {

    if ( !-d $Test->{Data}->{Directory} ) {
        File::Path::make_path( $Test->{Data}->{Directory}, { chmod => 0770 } );    ## no critic
    }

    my $TemplateLocation = $MainObject->FileWrite(
        %{ $Test->{Data} },
        Permission => '644',
        Content    => \$Test->{Data}->{Content},
    );

    my @TranslationStrings = $LanguageObject->GetXMLTranslatableStrings(
        ModuleDirectory => $ModuleDir,
    );

    $Self->IsDeeply(
        \@TranslationStrings,
        $Test->{Expected},
        'GetXMLTranslatableStrings - ' . $Test->{Name},
    );
}

# GetJSTranslatableStrings
@Tests = (
    {
        Name => '1. [% Translate("GetJSTranslatableStrings - Znuny rocks") | html %]',
        Data => {
            Filename  => 'Znuny.App.js',
            Content   => "Core.Language.Translate('GetJSTranslatableStrings - Znuny rocks')",
            Directory => "$ModuleDir/var/httpd/htdocs/js",
        },
        Expected => [
            {
                'Location' => 'JS File: var/httpd/htdocs/js/Znuny.App.js',
                'Source'   => 'GetJSTranslatableStrings - Znuny rocks',
            }
        ],
    },
);

for my $Test (@Tests) {

    if ( !-d $Test->{Data}->{Directory} ) {
        File::Path::make_path( $Test->{Data}->{Directory}, { chmod => 0770 } );    ## no critic
    }

    my $TemplateLocation = $MainObject->FileWrite(
        %{ $Test->{Data} },
        Permission => '644',
        Content    => \$Test->{Data}->{Content},
    );

    my @TranslationStrings = $LanguageObject->GetJSTranslatableStrings(
        ModuleDirectory => $ModuleDir,
    );

    $Self->IsDeeply(
        \@TranslationStrings,
        $Test->{Expected},
        'GetJSTranslatableStrings - ' . $Test->{Name},
    );
}

{
    $LanguageObject->{Translation}->{"This is a test for a new feature in Translate(). - %s %s"} = [ 'A simple Test - %s %s', \&ReplaceParams ];
    my $Translated = $LanguageObject->Translate("This is a test for a new feature in Translate(). - %s %s", "Znuny", "rocks!");

    $Self->Is(
        $Translated,
	'A simple Test - Perl is great!',
	'Replaced params for translated string',
    );

    sub ReplaceParams {
        return "Perl", "is great!";
    }
}

1;
