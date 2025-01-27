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

my $DBObject    = $Kernel::OM->Get('Kernel::System::DB');
my $CacheObject = $Kernel::OM->Get('Kernel::System::Cache');

$CacheObject->CleanUp(
    Type => 'DB',
);

my @Tests = (
    {
        Name     => 'Get ColumnMaxLengths of Table ticket_type',
        Table    => 'ticket_type',
        Expected => {
            change_by   => undef,
            change_time => undef,
            create_by   => undef,
            create_time => undef,
            id          => undef,
            name        => 200,
            valid_id    => undef,
        },
        ExpectedOracle => {
            change_by   => 22,
            change_time => 7,
            create_by   => 22,
            create_time => 7,
            id          => 22,
            name        => 200,
            valid_id    => 22,
        },
    },
    {
        Name     => 'Get ColumnMaxLengths of Table ticket_type cached',
        Table    => 'ticket_type',
        Expected => {
            change_by   => undef,
            change_time => undef,
            create_by   => undef,
            create_time => undef,
            id          => undef,
            name        => 200,
            valid_id    => undef,
        },
        ExpectedOracle => {
            change_by   => 22,
            change_time => 7,
            create_by   => 22,
            create_time => 7,
            id          => 22,
            name        => 200,
            valid_id    => 22,
        },
    }
);

for my $Test (@Tests) {

    my %ColumnsMaxLength = $DBObject->GetColumnMaxLengths(
        Table => $Test->{Table},
    );

    if ( $DBObject->{'DB::Type'} eq 'oracle' ) {
        $Self->IsDeeply(
            \%ColumnsMaxLength,
            \%{ $Test->{ExpectedOracle} },
            "$Test->{Name}",
        );
    }
    else {
        $Self->IsDeeply(
            \%ColumnsMaxLength,
            \%{ $Test->{Expected} },
            "$Test->{Name}",
        );
    }

}

1;
