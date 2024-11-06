# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::SupportDataCollector::Plugin::Znuny::MultipleJSFileLoad;

use strict;
use warnings;
use utf8;

use parent qw(Kernel::System::SupportDataCollector::PluginBase);

use Kernel::Language qw(Translatable);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::Language',
);

sub GetDisplayPath {
    return Translatable('Znuny');
}

sub Run {
    my $Self = shift;

    my $ConfigObject   = $Kernel::OM->Get('Kernel::Config');
    my $LanguageObject = $Kernel::OM->Get('Kernel::Language');

    my $Message = $LanguageObject->Translate('The following JavaScript files loaded multiple times:') . "\n\r";
    my $FoundMultipleJSFiles;

    for my $Interface (qw (Agent Customer)) {

        # get global js
        my $CommonJSList = $ConfigObject->Get("Loader::$Interface\::CommonJS");

        # load js for agent views.
        my %MultipleJSFileActionSettings;

        my $FrontendModuleRoleLabel = $Interface eq 'Agent' ? 'Frontend::Module' : 'CustomerFrontend::Module';
        my $ActionListConfig        = $ConfigObject->Get($FrontendModuleRoleLabel);
        my @Actions                 = keys %{$ActionListConfig};

        my %MultipleJSFileActions;
        for my $Action (@Actions) {
            my $Setting = $ConfigObject->Get("Loader::Module::$Action") || {};

            KEY:
            for my $Key ( sort keys %{$CommonJSList} ) {
                next KEY if $Key eq '100-CKEditor' && !$ConfigObject->Get('Frontend::RichText');
                FILE:
                for my $File ( @{ $CommonJSList->{$Key} } ) {
                    $MultipleJSFileActionSettings{$Action}->{$File} ||= [];
                    push @{ $MultipleJSFileActionSettings{$Action}->{$File} }, "Loader::$Interface\::CommonJS###$Key";
                }
            }

            MODULE:
            for my $Module ( sort keys %{$Setting} ) {
                next MODULE if ref $Setting->{$Module}->{JavaScript} ne 'ARRAY';
                FILE:
                for my $File ( @{ $Setting->{$Module}->{JavaScript} } ) {

                    $MultipleJSFileActionSettings{$Action}->{$File} ||= [];
                    push @{ $MultipleJSFileActionSettings{$Action}->{$File} }, "Loader::Module::$Action###$Module";
                }
            }
        }

        for my $Action ( sort keys %MultipleJSFileActionSettings ) {
            my $MultipleJSFileCount = 0;
            my $MessageFiles        = '';
            for my $File ( sort keys %{ $MultipleJSFileActionSettings{$Action} } ) {
                if ( scalar @{ $MultipleJSFileActionSettings{$Action}->{$File} } > 1 ) {
                    $MultipleJSFileCount++;
                    $FoundMultipleJSFiles++;
                    $MessageFiles .= "\n\n" . $File . ":\n\t○ ";
                    $MessageFiles .= join "\n\t○ ", @{ $MultipleJSFileActionSettings{$Action}->{$File} };
                }
            }

            $Message .= $MessageFiles;

            my $Value = $MultipleJSFileCount . " ";
            $Value .= (
                $MultipleJSFileCount > 1 ? $LanguageObject->Translate('Files') : $LanguageObject->Translate('File')
            );

            if ( $MultipleJSFileCount > 0 ) {
                $Self->AddResultInformation(
                    Identifier       => $Action,
                    Label            => $Action,
                    Value            => $Value,
                    MessageFormatted => $Message,
                    DisplayPath      => Translatable('Znuny') . '/'
                        . Translatable('Views with multiple loaded JavaScript files'),
                );
            }
        }
    }

    if ( !$FoundMultipleJSFiles ) {
        $Self->AddResultInformation(
            Label => Translatable('Views with multiple loaded JavaScript files'),
        );
    }

    return $Self->GetResults();
}

1;
