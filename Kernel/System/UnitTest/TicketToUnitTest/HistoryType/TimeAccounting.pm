# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::Pod::Validator)

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::TimeAccounting;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $LogObject = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(TimeAccounting)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my $Output = <<OUTPUT;
\$Success = \$TicketObject->TicketAccountTime(
    TicketID  => \$TicketID,
    ArticleID => \$ArticleID,
    TimeUnit  => '$Param{TimeAccounting}',
    UserID    => \$UserID,
);

\$Self->True(
    \$Success,
    'TicketAccountTime "$Param{TimeAccounting}" was successful.',
);

OUTPUT

    return $Output;
}

1;
