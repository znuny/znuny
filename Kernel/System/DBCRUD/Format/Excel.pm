# --
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::System::DBCRUD::Format::Excel;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::CSV',
    'Kernel::System::Encode',
    'Kernel::System::FileTemp',
    'Kernel::System::HTMLUtils',
    'Kernel::System::Log',
    'Kernel::System::Main',
);

use MIME::Base64 qw();
use Spreadsheet::XLSX;

=head1 NAME

Kernel::System::DBCRUD::Format::Excel - DBCRUD Excel lib

=head1 SYNOPSIS

All DBCRUD format Excel functions.

=head1 PUBLIC INTERFACE

=head2 new()

create an object

    my DBCRUDExcelObject = $Kernel::OM->Get('Kernel::System::DBCRUD::Format::Excel');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    my $Self = {};
    bless( $Self, $Type );

    $Self->{CacheType} = 'DBCRUDExcel';
    $Self->{CacheTTL}  = 60 * 60 * 24 * 20;

    for my $Item ( sort keys %Param ) {
        $Self->{$Item} = $Param{$Item};
    }

    return $Self;
}

=head2 GetContent()

return content of Excel String as array-ref.

    my $Array = $DBCRUDExcelObject->GetContent(
        Content => $ContentString,
    );

Returns:

    my $Array = [];

=cut

sub GetContent {
    my ( $Self, %Param ) = @_;

    my $MainObject     = $Kernel::OM->Get('Kernel::System::Main');
    my $FileTempObject = $Kernel::OM->Get('Kernel::System::FileTemp');
    my $LogObject      = $Kernel::OM->Get('Kernel::System::Log');

    # $Param{Content} = MIME::Base64::decode_base64( $Param{Content} );

    my $Loaded = $MainObject->Require(
        'Spreadsheet::XLSX',
        Silent => 1,
    );

    if ( !$Loaded ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't extract XLSX data because module 'Spreadsheet::XLSX' is missing!",
        );
        return;
    }

    my ( $FileHandle, $Location ) = $FileTempObject->TempFile(
        Suffix => '.xlsx',
    );

    close $FileHandle;

    my $FileLocation = $MainObject->FileWrite(
        Location => $Location,
        Content  => \$Param{Content},
        Mode     => 'binmode',
    );

    if ( !$FileLocation ) {
        $LogObject->Log(
            Priority => 'error',
            Message  => "Can't write excel data to temp file!",
        );
        return;
    }

    my $Excel = Spreadsheet::XLSX->new($Location);

    my ($FirstWorksheet) = @{ $Excel->{Worksheet} || [] };

    return if !$FirstWorksheet;

    my @ArrayResult;

    ROW:
    for my $Row ( 0 .. $FirstWorksheet->{MaxRow} ) {
        $FirstWorksheet->{MaxCol} ||= $FirstWorksheet->{MinCol};
        my $Row = $FirstWorksheet->{Cells}->[$Row];

        my @Entry;
        for my $Index ( 0 .. $FirstWorksheet->{MaxRow} ) {
            push @Entry, $Self->_EncodeExcelValue( \$Row->[$Index]->{Val} );
        }
        push @ArrayResult, \@Entry;
    }

    my @Result;
    my @Columns = @{ shift @ArrayResult || [] };
    ROW:
    for my $Row (@ArrayResult) {

        my %Data;
        for my $ColumnIndex ( 0 .. @Columns - 1 ) {
            $Data{ $Columns[$ColumnIndex] } = $Row->[$ColumnIndex];
        }
        next ROW if !%Data;
        push @Result, \%Data;
    }
    return \@Result;

}

=head2 SetContent()

return content of array as excel string.

    my $ExportString = $DBCRUDExcelObject->SetContent(
        Content => $Array,
    );

Returns:

    my $ExportString = '---';

=cut

sub SetContent {
    my ( $Self, %Param ) = @_;

    my $CSVObject = $Kernel::OM->Get('Kernel::System::CSV');
    my @Header;

    COLUMN:
    for my $ColumnOrder ( @{ $Param{ColumnsOrder} } ) {
        next COLUMN if !$Param{Content}->[0]->{$ColumnOrder};
        push @Header, $ColumnOrder;
    }

    my @Data;
    for my $Data ( @{ $Param{Content} } ) {
        my @Row;

        # backup for header
        if ( !@Header ) {
            @Header = sort keys %{$Data};
        }

        # create Data for Array2CSV
        for my $Entry (@Header) {
            push @Row, $Data->{$Entry};
        }
        push @Data, [@Row];
    }

    my $ExportString = $CSVObject->Array2CSV(
        Head   => \@Header,
        Data   => \@Data,
        Format => 'Excel',
    );

    return $ExportString;
}

=head2 _EncodeExcelValue()

This function will encode the value and move it too ascii.

    $DBCRUDExcelObject->_EncodeExcelValue(\$Value);

Returns:

    my $Value = 1;

=cut

sub _EncodeExcelValue {
    my ( $Self, $Value ) = @_;

    my $EncodeObject    = $Kernel::OM->Get('Kernel::System::Encode');
    my $HTMLUtilsObject = $Kernel::OM->Get('Kernel::System::HTMLUtils');

    return if !defined $Value;

    $EncodeObject->EncodeInput( \$Value );

    return if !${$Value};

    ${$Value} = $HTMLUtilsObject->ToAscii( String => ${$Value} );

    return ${$Value};
}

1;
