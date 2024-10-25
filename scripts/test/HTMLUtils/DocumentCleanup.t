# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

use strict;
use warnings;
use utf8;

use vars (qw($Self));

# get HTMLUtils object
my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

# DocumentCleanup tests
my @Tests = (
    {
        Input  => 'Some Tex<b>t</b>',
        Result => 'Some Tex<b>t</b>',
        Name   => 'DocumentCleanup - blockquote'
    },
    {
        Input => '<blockquote>Some Tex<b>t</b></blockquote>',
        Result =>
            '<div  style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">Some Tex<b>t</b></div>',
        Name => 'DocumentCleanup - blockquote'
    },
    {
        Input => '<blockquote>Some Tex<b>t</b><blockquote>test</blockquote> </blockquote>',
        Result =>
            '<div  style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">Some Tex<b>t</b><div  style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">test</div> </div>',
        Name => 'DocumentCleanup - blockquote'
    },
    {
        Input =>
            '<head><base href=3D"file:///C:\Users\dol\AppData\Local\Temp\SnipFile-%7b102B7C0B-D396-440B-9DD6-DD3342805533%7d.HTML"></head>',
        Result => '<head></head>',
        Name   => 'DocumentCleanup - base tag',
    },
    {
        Input =>
            '<head><baSe href=3D"file:///C:\Users\dol\AppData\Local\Temp\SnipFile-%7b102B7C0B-D396-440B-9DD6-DD3342805533%7d.HTML"></head>',
        Result => '<head></head>',
        Name   => 'DocumentCleanup - baSe tag',
    },
    {
        Input =>
            '<HEAD><TITLE>Aufzeichnung</TITLE>
<META content=3D"text/html; charset=3Dus-ascii" http-equiv=3DContent-Type><=
BASE=20
href=3D"file:///C:/Users/goi/AppData/Local/Temp/SnipFile-%7B77CE7BE6-0C04-4=
CED-898D-4ECC17BCA028%7D.HTML">
</HEAD>',
        Result => '<HEAD><TITLE>Aufzeichnung</TITLE>
<META content=3D"text/html; charset=3Dus-ascii" http-equiv=3DContent-Type><=
BASE=20
href=3D"file:///C:/Users/goi/AppData/Local/Temp/SnipFile-%7B77CE7BE6-0C04-4=
CED-898D-4ECC17BCA028%7D.HTML">
</HEAD>',
        Name => 'DocumentCleanup - BASE tag',
    },
);

for my $Test (@Tests) {
    my $HTML = $HTMLUtilsObject->DocumentCleanup(
        String => $Test->{Input},
    );
    $Self->Is(
        $HTML,
        $Test->{Result},
        $Test->{Name},
    );
}

1;
