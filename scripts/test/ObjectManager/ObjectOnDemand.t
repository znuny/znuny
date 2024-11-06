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
use vars (qw($Self));
use utf8;
#
# This test makes sure that object dependencies are only created when
# the object actively asks for them, not earlier.
#

use Kernel::System::ObjectManager;

local $Kernel::OM = Kernel::System::ObjectManager->new();

$Self->True( $Kernel::OM, 'Could build object manager' );

$Self->True(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Encode'},
    'Kernel::System::Encode is always preloaded',
);

$Self->False(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Valid'},
    'Kernel::System::Valid was not loaded yet',
);

$Self->False(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Log'},
    'Kernel::System::Log was not loaded yet',
);

$Kernel::OM->Get('Kernel::System::Valid');

$Self->True(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Valid'},
    'Kernel::System::Valid was loaded',
);

$Self->False(
    exists $Kernel::OM->{Objects}->{'Kernel::System::Log'},
    'Kernel::System::Log is a dependency of Kernel::System::Valid, but was not yet loaded',
);

1;
