#! perl

use strict;
use warnings;
use utf8;

# Implementation of ChordPro::Wx::SongbookExportPanel_wxg details.

package ChordPro::Wx::SongbookExportPanel;

# ChordPro::Wx::SoongbookExport_wxg is generated by wxGlade and contains
# all UI associated code.

use parent qw( ChordPro::Wx::SongbookExportPanel_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';
use ChordPro::Wx::Utils;
use constant CFGBASE => "songbookexport/";
use Encode qw( decode_utf8 encode_utf8 );
use ChordPro::Utils qw(demarkup);
use File::LoadLines;

sub new {
    my $self = shift;
    $self = $self->SUPER::new(@_);

    return $self;
}

sub refresh {
    my ( $self ) = @_;
    my $conf = Wx::ConfigBase::Get;
    $self->{dp_folder}->SetPath( $self->GetParent->{_sbefolder} // $conf->Read( CFGBASE . "folder" ) // "");
    $self->{t_exporttitle}->SetValue($conf->Read( CFGBASE . "title" ) // "");
    $self->{fp_cover}->SetPath($conf->Read( CFGBASE . "cover" ) // "");

    Wx::Event::EVT_DIRPICKER_CHANGED( $self, $self->{dp_folder}->GetId,
				      $self->can("OnDirPickerChanged") );


    $self->{_sbefiles} = [];

    if ( -d $self->{dp_folder}->GetPath ) {
	$self->OnDirPickerChanged(undef);
    }

}

sub log {
    my $self = shift;
    $self->GetParent->log(@_);
}

sub alert {
    my ( $self ) = @_;
    $self->{b_msgs}->SetBackgroundColour(Wx::Colour->new(255, 0, 0));
}

################ Event handlers ################

sub OnDirPickerChanged {
    my ( $self, $event ) = @_;

    my $folder = $self->{dp_folder}->GetPath;
    opendir( my $dir, $folder )
      or do {
	$self->GetParent->log( 'W', "Error opening folder $folder: $!");
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Error opening folder $folder: $!",
	    "Error",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    };

    my @files;
    my $src = "filelist.txt";
    if ( -s "$folder/$src" ) {
	$self->{l_filelist}->Show;
	$self->{cb_filelist}->Show;
	$self->{sz_export_inner}->Layout;
    }
    else {
	$self->{l_filelist}->Hide;
	$self->{cb_filelist}->Hide;
	$self->{sz_export_inner}->Layout;
    }
    if ( -s "$folder/$src" && !$self->{cb_filelist}->IsChecked ) {
	@files = loadlines("$folder/$src");
    }
    else {
	$src = "folder";
	@files = map { decode_utf8($_) } sort grep {
	    m/^[^.].*\.(cho|crd|chopro|chord|chordpro|pro)$/
	} readdir($dir);
    }

    my $n = scalar(@files);
    my $msg = "Found $n ChordPro file" . ( $n == 1 ? "" : "s" ) . " in $src";
    $self->{l_info}->SetLabel($msg);
    $self->log( 'S', $msg );

    $self->{w_rearrange}->GetList->Set(\@files);
    $self->{w_rearrange}->GetList->Check($_,1) for 0..$#files;
    unless ( $self->{w_rearrange}->IsShown ) {
	$self->{sl_rearrange}->Show;
	$self->{l_rearrange}->Show;
	$self->{w_rearrange}->Show;
	$self->{_sbefiles} = \@files;
	$self->{sizer_1}->Layout;
    }
}

sub OnFilelistIgnore {
    my ( $self, $event ) = @_;
    $self->OnDirPickerChanged($event);
}

sub OnPreferences {
    my ( $self, $event ) = @_;
    $self->GetParent->OnPreferences($event);
}

sub OnPreview {
    my ( $self, $event ) = @_;

    my $folder = $self->{dp_folder}->GetPath;
    my @files = @{ $self->{_sbefiles} };
    unless ( $folder && @files ) {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Please select a folder! ($folder)(".scalar(@files).")",
	    "No folder selected",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    }

    my $conf = Wx::ConfigBase::Get;
    $conf->Write( CFGBASE . "folder", $self->{dp_folder}->GetPath // "" );
    $conf->Write( CFGBASE . "title", $self->{t_exporttitle}->GetValue // "" );
    $conf->Write( CFGBASE . "cover", $self->{fp_cover}->GetPath // "" );

    my $filelist = "";
    my @o = $self->{w_rearrange}->GetList->GetCurrentOrder;
    for ( $self->{w_rearrange}->GetList->GetCurrentOrder ) {
	$filelist .= "$folder/$files[$_]\n" unless $_ < 0;
    }
    $self->log( 'I', "Filelist: @o\n$filelist" );
    unless ( $filelist ) {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Please select one or more song files.",
	    "No songs selected",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    }

    my $dialog;
    my $pcb = sub {
	my $ctl = shift;

	$self->log( 'I', "Generating output " . $ctl->{index} .
			       " of " . $ctl->{songs} . ": " .
			       demarkup($ctl->{title}) )
	  if $ctl->{index} && $ctl->{songs} > 1;

	if ( $ctl->{index} == 0 ) {
	    return 1 unless $ctl->{songs} > 1;
	    $dialog = Wx::ProgressDialog->new
	      ( 'Processing...',
		'Starting',
		$ctl->{songs}, $self,
		wxPD_CAN_ABORT|wxPD_AUTO_HIDE|wxPD_APP_MODAL|
		wxPD_ELAPSED_TIME|wxPD_ESTIMATED_TIME|wxPD_REMAINING_TIME );
	}
	elsif ( $dialog ) {
	    $dialog->Update( $ctl->{index},
			     "Song " . $ctl->{index} . " of " .
			     $ctl->{songs} . ": " .
			     demarkup($ctl->{title}) )
	      and return 1;
	    $self->log( 'I', "Processing cancelled." );
	    return;
	}

	return 1;
    };

    my @args = ( "--filelist", \$filelist,
		 "--progress_callback" => $pcb );
    if ( my $title = $self->{t_exporttitle}->GetValue ) {
	push( @args, "--define", "pdf.info.title=".encode_utf8($title) );
    }
    if ( my $cover = $self->{fp_cover}->GetPath ) {
	push( @args, "--cover", encode_utf8($cover) );
    }
    $self->GetParent->preview(@args);

    $dialog->Destroy if $dialog;
    $event->Skip;
}

sub OnShowMessages {
    my ( $self, $event ) = @_;
    $self->{b_msgs}->SetBackgroundColour(wxNullColour);
    $self->GetParent->{_prev_mode} = "SBEX";
    $self->GetParent->select_mode("MSGS");
}

1;
