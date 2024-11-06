# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --
## nofilter(TidyAll::Plugin::Znuny::Perl::ObjectDependencies)

package Kernel::System::UnitTest::TicketToUnitTest::HistoryType::AddNote;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::Log',
    'Kernel::System::Ticket',
    'Kernel::System::Ticket::Article',
);

use parent qw( Kernel::System::UnitTest::TicketToUnitTest::Base );

sub Run {
    my ( $Self, %Param ) = @_;

    my $ArticleObject = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    my $LogObject     = $Kernel::OM->Get('Kernel::System::Log');

    NEEDED:
    for my $Needed (qw(ArticleID TicketID HistoryType)) {

        next NEEDED if defined $Param{$Needed};

        $LogObject->Log(
            Priority => 'error',
            Message  => "Parameter '$Needed' is needed!",
        );
        return;
    }

    my %Article = $ArticleObject->ArticleGet(
        TicketID  => $Param{TicketID},
        ArticleID => $Param{ArticleID}
    );

    my $Output = <<OUTPUT;
\$TempValue = <<'BODY';
$Article{Body}
BODY

\$ArticleID = \$HelperObject->ArticleCreate(
    TicketID             => \$TicketID,
    Subject              => '$Article{Subject}',
    Body                 => \$TempValue,
    IsVisibleForCustomer => '$Article{IsVisibleForCustomer}',
    SenderType           => '$Article{SenderType}',
    From                 => '$Article{From}',
    To                   => '$Article{To}',
    Charset              => '$Article{Charset}',
    MimeType             => '$Article{MimeType}',
    HistoryType          => '$Param{HistoryType}',
    HistoryComment       => 'UnitTest',
    UserID               => \$UserID,
);

# trigger transaction events
\$Kernel::OM->ObjectsDiscard(
    Objects => ['Kernel::System::Ticket'],
);
\$TicketObject = \$Kernel::OM->Get('Kernel::System::Ticket');

OUTPUT

    return $Output;

}

1;
