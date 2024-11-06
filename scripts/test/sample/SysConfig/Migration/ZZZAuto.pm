# OTRS config file (automatically generated)
# VERSION:1.1
package scripts::test::sample::SysConfig::Migration::ZZZAuto;
use strict;
use warnings;
no warnings 'redefine';
use utf8;

## nofilter(TidyAll::Plugin::OTRS::Perl::PerlTidy)

sub Load {
    my ($File, $Self) = @_;

$Self->{'Frontend::RichTextPath'}   = '<OTRS_CONFIG_Frontend::WebPath>js/thirdparty/ckeditor-4.17.1/';
$Self->{'Frontend::RichTextWidth'}  = '320';
$Self->{'Frontend::RichTextHeight'} = '620';
$Self->{'MigrateSysConfigSettings'} = 1;

}

1;
