# --
# Copyright (C) 2021 Perl-Services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY.
# It is licensed under GNU AFFERO GENERAL PUBLIC LICENSE (AGPL),
# see https://www.gnu.org/licenses/agpl-3.0.txt.
#

package My::EmailTest;

use strict;
use warnings;

our @ObjectDependencies = ();

sub new { return bless {}, shift }

sub Check {
    my ($Self, %Param) = @_;

    my $Message = $Param{Test} ? '' : 'Error!';

    return (
        Successful => $Param{Test},
        Message    => $Message,
    );
}

1;

