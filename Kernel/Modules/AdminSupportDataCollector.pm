# --
# Copyright (C) 2001-2021 OTRS AG, https://otrs.com/
# Copyright (C) 2021 Znuny GmbH, https://znuny.org/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::Modules::AdminSupportDataCollector;

use strict;
use warnings;

use Kernel::System::SupportDataCollector::PluginBase;

use Kernel::System::VariableCheck qw(:all);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    if ( $Self->{Subaction} eq 'GenerateSupportBundle' ) {
        return $Self->_GenerateSupportBundle();
    }
    elsif ( $Self->{Subaction} eq 'DownloadSupportBundle' ) {
        return $Self->_DownloadSupportBundle();
    }
    elsif ( $Self->{Subaction} eq 'DeleteCache' ) {
        return $Self->_DeleteCache();
    }

    return $Self->_SupportDataCollectorView(%Param);
}

sub _SupportDataCollectorView {
    my ( $Self, %Param ) = @_;

    my %SupportData = $Kernel::OM->Get('Kernel::System::SupportDataCollector')->Collect(
        UseCache => 1,
    );

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    if ( !$SupportData{Success} ) {
        $LayoutObject->Block(
            Name => 'SupportDataCollectionFailed',
            Data => \%SupportData,
        );
    }
    else {
        $LayoutObject->Block(
            Name => 'NoteSupportBundle',
        );

        $LayoutObject->Block(
            Name => 'SupportData',
        );
        my ( $LastGroup, $LastSubGroup ) = ( '', '' );

        for my $Entry ( @{ $SupportData{Result} || [] } ) {

            $Entry->{StatusName} = $Kernel::System::SupportDataCollector::PluginBase::Status2Name{
                $Entry->{Status}
            };

            # get the display path, display type and additional information for the output
            my ( $DisplayPath, $DisplayType, $DisplayAdditional ) = split( m{[\@\:]}, $Entry->{DisplayPath} // '' );

            my ( $Group, $SubGroup ) = split( m{/}, $DisplayPath );
            if ( $Group ne $LastGroup ) {
                $LayoutObject->Block(
                    Name => 'SupportDataGroup',
                    Data => {
                        Group => $Group,
                    },
                );
            }
            $LastGroup = $Group // '';

            if ( !$SubGroup || $SubGroup ne $LastSubGroup ) {

                $LayoutObject->Block(
                    Name => 'SupportDataRow',
                    Data => $Entry,
                );
            }

            if ( $SubGroup && $SubGroup ne $LastSubGroup ) {

                $LayoutObject->Block(
                    Name => 'SupportDataSubGroup',
                    Data => {
                        %{$Entry},
                        SubGroup => $SubGroup,
                    },
                );
            }
            $LastSubGroup = $SubGroup // '';

            if ( $DisplayType && $DisplayType eq 'Table' && ref $Entry->{Value} eq 'ARRAY' ) {

                $LayoutObject->Block(
                    Name => 'SupportDataEntryTable',
                    Data => $Entry,
                );

                if ( IsArrayRefWithData( $Entry->{Value} ) ) {

                    # get the table columns
                    my @TableColumns = split( m{,}, $DisplayAdditional // '' );

                    my @Identifiers;
                    my @Labels;

                    COLUMN:
                    for my $Column (@TableColumns) {

                        next COLUMN if !$Column;

                        # get the identifier and label
                        my ( $Identifier, $Label ) = split( m{\|}, $Column );

                        # set the identifier as default label
                        $Label ||= $Identifier;

                        push @Identifiers, $Identifier;
                        push @Labels,      $Label;
                    }

                    $LayoutObject->Block(
                        Name => 'SupportDataEntryTableDetails',
                        Data => {
                            Identifiers => \@Identifiers,
                            Labels      => \@Labels,
                            %{$Entry},
                        },
                    );
                }
            }
            elsif ( !$SubGroup ) {

                $LayoutObject->Block(
                    Name => 'SupportDataEntry',
                    Data => $Entry,
                );
                if ( defined $Entry->{Value} && length $Entry->{Value} ) {
                    if ( $Entry->{Value} =~ m{\n} ) {
                        $LayoutObject->Block(
                            Name => 'SupportDataEntryValueMultiLine',
                            Data => $Entry,
                        );
                    }
                    else {
                        $LayoutObject->Block(
                            Name => 'SupportDataEntryValueSingleLine',
                            Data => $Entry,
                        );
                    }
                }
            }
            else {

                $LayoutObject->Block(
                    Name => 'SupportDataSubEntry',
                    Data => $Entry,
                );

                if ( $Entry->{Message} || $Entry->{MessageFormatted} ) {
                    $LayoutObject->Block(
                        Name => 'SupportDataSubEntryMessage',
                        Data => {
                            Message          => $Entry->{Message},
                            MessageFormatted => $Entry->{MessageFormatted},
                        },
                    );
                }
            }
        }
    }

    # get user data
    my %User = $Kernel::OM->Get('Kernel::System::User')->GetUserData(
        UserID => $Self->{UserID},
        Cached => 1,
    );

    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get sender email address
    if ( $User{UserEmail} && $User{UserEmail} !~ /root\@localhost/ ) {
        $Param{SenderAddress} = $User{UserEmail};
    }
    elsif (

        $ConfigObject->Get('AdminEmail')
        && $ConfigObject->Get('AdminEmail') !~ /root\@localhost/
        && $ConfigObject->Get('AdminEmail') !~ /admin\@example.com/
        )
    {
        $Param{SenderAddress} = $ConfigObject->Get('AdminEmail');
    }
    $Param{SenderName} = $User{UserFullname};

    # verify if the email is valid, set it to empty string if not, this will be checked on client
    #    side
    if (
        $Param{SenderAddress} &&
        !$Kernel::OM->Get('Kernel::System::CheckItem')->CheckEmail( Address => $Param{SenderAddress} )
        )
    {
        $Param{SenderAddress} = '';
    }

    my $Output = $LayoutObject->Header();
    $Output .= $LayoutObject->NavigationBar();
    $Output .= $LayoutObject->Output(
        TemplateFile => 'AdminSupportDataCollector',
        Data         => \%Param,
    );
    $Output .= $LayoutObject->Footer();

    return $Output;
}

sub _GenerateSupportBundle {
    my ( $Self, %Param ) = @_;

    $Kernel::OM->Get('Kernel::Output::HTML::Layout')->ChallengeTokenCheck();

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');
    my $RandomID   = $MainObject->GenerateRandomString(
        Length     => 8,
        Dictionary => [ 0 .. 9, 'a' .. 'f' ],
    );

    # remove any older file
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');
    my $TempDir      = $ConfigObject->Get('TempDir') . '/SupportBundleDownloadCache';

    if ( !-d $TempDir ) {
        mkdir $TempDir;
    }

    $TempDir = $ConfigObject->Get('TempDir') . '/SupportBundleDownloadCache/' . $RandomID;

    if ( !-d $TempDir ) {
        mkdir $TempDir;
    }

    # remove all files
    my @ListOld = glob( $TempDir . '/*' );
    for my $File (@ListOld) {
        unlink $File;
    }

    # create the support bundle
    my $Result = $Kernel::OM->Get('Kernel::System::SupportBundleGenerator')->Generate();

    if ( !$Result->{Success} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => $Result->{Message},
        );
    }
    else {

        # save support bundle in the FS (temporary)
        my $FileLocation = $MainObject->FileWrite(
            Location   => $TempDir . '/' . $Result->{Data}->{Filename},
            Content    => $Result->{Data}->{Filecontent},
            Mode       => 'binmode',
            Type       => 'Local',
            Permission => '644',
        );
    }

    my $JSONString = $Kernel::OM->Get('Kernel::System::JSON')->Encode(
        Data => {
            Success  => $Result->{Success},
            Message  => $Result->{Message} || '',
            Filesize => $Result->{Data}->{Filesize} || '',
            Filename => $Result->{Data}->{Filename} || '',
            RandomID => $RandomID,
        },
    );

    return $Kernel::OM->Get('Kernel::Output::HTML::Layout')->Attachment(
        ContentType => 'text/html',
        Content     => $JSONString,
        Type        => 'inline',
        NoCache     => 1,
    );
}

sub _DownloadSupportBundle {
    my ( $Self, %Param ) = @_;

    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    $LayoutObject->ChallengeTokenCheck();

    my $Filename = $ParamObject->GetParam( Param => 'Filename' ) || '';
    my $RandomID = $ParamObject->GetParam( Param => 'RandomID' ) || '';

    # Validate simple file name.
    if ( !$Filename || $Filename !~ m{^[a-z0-9._-]+$}smxi ) {
        return $LayoutObject->ErrorScreen(
            Message => "Need Filename or Filename invalid!",
        );
    }

    # Validate simple RandomID.
    if ( !$RandomID || $RandomID !~ m{^[a-f0-9]+$}smx ) {
        return $LayoutObject->ErrorScreen(
            Message => "Need RandomID or RandomID invalid!",
        );
    }

    my $TempDir  = $Kernel::OM->Get('Kernel::Config')->Get('TempDir') . '/SupportBundleDownloadCache/' . $RandomID;
    my $Location = $TempDir . '/' . $Filename;

    my $MainObject = $Kernel::OM->Get('Kernel::System::Main');
    my $Content    = $MainObject->FileRead(
        Location => $Location,
        Mode     => 'binmode',
        Type     => 'Local',
        Result   => 'SCALAR',
    );

    if ( !$Content ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'File %s could not be read!', $Location ),
        );
    }

    my $Success = $MainObject->FileDelete(
        Location => $Location,
        Type     => 'Local',
    );

    if ( !$Success ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "File $Location could not be deleted!",
        );
    }

    rmdir $TempDir;

    return $LayoutObject->Attachment(
        Filename    => $Filename,
        ContentType => 'application/octet-stream; charset=' . $LayoutObject->{UserCharset},
        Content     => $$Content,
    );
}

sub _DeleteCache {
    my ($Self) = @_;
    $Kernel::OM->Get('Kernel::System::SupportDataCollector')->DeleteCache();
    return $Self->_SupportDataCollectorView();
}

1;
