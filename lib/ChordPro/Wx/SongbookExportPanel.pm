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
use ChordPro::Wx::Config;
use ChordPro::Wx::Utils;
use Encode qw( decode_utf8 encode_utf8 );
use ChordPro::Utils qw( is_msw demarkup );
use File::LoadLines;
use ChordPro::Paths;

my $wv;

sub new {
    my $self = shift;
    $self = $self->SUPER::new(@_);

    $wv = is_msw ? 0 : eval { use Wx::WebView; 1 };
    if ( $wv ) {
	my $w = Wx::WebView::New( $self->{p_preview},
				  wxID_ANY,
				  CP->findres( "chordpro-icon.png",
					       class => "icons" ) );
	$self->{sz_preview}->Replace( $self->{webview}, $w, 1 );
	$self->{webview}->Destroy;
	$self->{webview} = $w;
	$self->{sz_preview}->Layout;
    }

    $wv = is_msw ? 0 : eval { use Wx::WebView; 1 };
    if ( $wv ) {
	$self->setup_webview;
    }

    $self->{sw_e_p}->Unsplit(undef);
    $self->{sw_ep_m}->Unsplit(undef);
    return $self;
}

sub refresh {
    my ( $self ) = @_;

    my $log = Wx::LogTextCtrl->new( $self->{t_messages} );
    Wx::Log::SetActiveTarget( $log );
    $self->setup_menubar;
    $self->log( 'I', "Using " .
		( ref($self->{p_editor}{webview}) eq 'Wx::WebView'
		  ? "embedded" : "external") . " PDF viewer" );


    my $c = $state{songbookexport};
    $self->{dp_folder}->SetPath( $state{sbefolder} // $c->{folder} // "");
    $self->{t_exporttitle}->SetValue($c->{title} // "");
    $self->{t_exportstitle}->SetValue($c->{subtitle} // "");
    $self->{fp_cover}->SetPath($c->{cover} // "");
    $self->{cb_stdcover}->SetValue($c->{stdcover} // 0);
    $self->OnStdCoverChecked();

    # Not handled yet by wxGlade.
    Wx::Event::EVT_DIRPICKER_CHANGED( $self, $self->{dp_folder}->GetId,
				      $self->can("OnDirPickerChanged") );


    $state{sbefiles} = [];

    if ( $state{sbefolder} && -d $state{sbefolder} ) {
	$self->{dp_folder}->SetPath($state{sbefolder});
	$self->log( 'I', "Using folder " . $state{sbefolder} );
	$self->OnDirPickerChanged(undef);
    }

}

sub log {
    my $self = shift;
    $self->GetParent->log(@_);
}

sub alert {
    my ( $self ) = @_;
    $self->{bmb_messages}->SetBackgroundColour(Wx::Colour->new(255, 0, 0));
}

sub save_prefs {
    my ( $self ) = @_;
    my $c = $state{songbookexport};
    $c->{folder} =   $self->{dp_folder}->GetPath // "";
    $c->{title} =    $self->{t_exporttitle}->GetValue // "";
    $c->{subtitle} = $self->{t_exportstitle}->GetValue // "";
    $c->{cover} =    $self->{fp_cover}->GetPath // "";
    $c->{stdcover} = $self->{cb_stdcover}->IsChecked // 0;
}

sub setup_menubar {
    my ( $self ) = @_;

    my $mb =
    make_menubar( $self,
      [ [ wxID_FILE,
	  [ [ wxID_NEW, "", "Create or open a ChordPro document", "OnNew" ],
	    [],
	    [ wxID_ANY, "Hide/Show messages",
	      "Hide or show the messages pane", "OnWindowMessages" ],
	    [ wxID_ANY, "Save messages",
	      "Save the messages to a file", "OnMessagesSave" ],
	    [ wxID_ANY, "Clear messages",
	      "Clear the current messages", "OnMessagesClear" ],
	    [],
	    [ wxID_EXIT, "", "Close window and exit", "OnClose" ],
	  ]
	],
	[ wxID_EDIT,
	  [ [ wxID_ANY, "Preferences...\tCtrl-R",
	      "Preferences", "OnPreferences" ],
	  ]
	],
	[ wxID_ANY, "Tasks",
	  [ [ wxID_ANY, "Default preview\tCtrl-P",
	      "Preview with default formatting", "OnPreview" ],
	    [ wxID_ANY, "No chord diagrams",
	      "Preview without chord diagrams", "OnPreviewNoDiagrams" ],
	    [ wxID_ANY, "Lyrics only",
	      "Preview just the lyrics". "OnPreviewLyricsOnly" ],
	    [ wxID_ANY, "More...",
	      "Transpose, transcode, and more", "OnPreviewMore" ],
	    [],
	    [ wxID_ANY, "Hide/Show Preview",
	      "Hide or show the preview pane", "OnWindowPreview" ],
	    [ wxID_ANY, "Save preview", "Save the preview to a PDF",
	      "OnPreviewSave" ],
	  ]
	],
	[ wxID_HELP,
	  [ [ wxID_ANY, "ChordPro file format",
	      "Help about the ChordPro file format", "OnHelp_ChordPro" ],
	    [ wxID_ANY, "ChordPro config files",
	      "Help about the config files", "OnHelp_Config" ],
	    [],
	    [ wxID_ANY, "Enable debug info in PDF",
	      "Add sources and configs to the PDF for debugging", 1,
	      "OnHelp_DebugInfo" ],
	    [],
	    [ wxID_ABOUT, "", "About WxChordPro", "OnAbout" ],
	  ]
	]
      ] );

    my $menu = $mb->FindMenu("Tasks");
    $menu = $mb->GetMenu($menu);
    # Append separator.
    $menu->AppendSeparator if @{$state{tasks}};
    for my $task ( @{$state{tasks} } ) {
	my ( $desc, $file ) = @$task;
	my $id = Wx::NewId();
	# Append to the menu.
	$menu->Append( $id, $desc, _T("Custom task: ").$desc );
	Wx::Event::EVT_MENU
	    ( $self->GetParent, $id,
	      sub {
		  my ( $self, $event ) = @_;
		  $self->preview( [ "--config", $file ],
				  target => $self->{p_sbexport},
				  filelist => 1  );
	      } );
    }
}

sub setup_webview {
    my ( $self ) = @_;
    my $w = Wx::WebView::New( $self->{p_right},
			      wxID_ANY,
			      CP->findres( "chordpro-icon.png",
					   class => "icons" ) );
    $self->{sz_preview}->Replace( $self->{webview}, $w, 1 );
    $self->{webview}->Destroy;
    $self->{webview} = $w;
    $self->{sz_preview}->Layout;
}

sub opendir {
    my ( $self, $dir ) = @_;
    $dir =~ s/[\\\/]$//;
    $self->{dp_folder}->SetPath($dir);
    $self->OnDirPickerChanged;
}

################ Event handlers ################

sub OnNew {
    my ( $self ) = @_;
    $self->GetParent->select_mode("initial");
}

sub OnDirPickerChanged {
    my ( $self, $event ) = @_;

    my $folder = $self->{dp_folder}->GetPath;
    CORE::opendir( my $dir, $folder )
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
	$self->{cb_filelist}->Enable;
	$self->{cb_recursive}->Disable;
    }
    else {
	$self->{cb_filelist}->Disable;
    }
    if ( -s "$folder/$src" && !$self->{cb_filelist}->IsChecked ) {
	@files = loadlines("$folder/$src");
    }
    else {
	$src = "folder";
	use File::Find qw(find);
	my $recurse = $self->{cb_recursive}->IsChecked;
	find sub {
	    if ( -s && m/^[^.].*\.(cho|crd|chopro|chord|chordpro|pro)$/ ) {
		push( @files, $File::Find::name );
	    }
	    if ( -d && $File::Find::name ne $folder ) {
		$File::Find::prune = !$recurse;
		$self->{cb_recursive}->Enable;
	    }
	}, $folder;
	@files = map { decode_utf8( s;^\Q$folder\E/?;;r) } sort @files;
    }

    my $n = scalar(@files);
    my $msg = "Found $n ChordPro file" . ( $n == 1 ? "" : "s" ) . " in $src" .
      ( $self->{cb_recursive}->IsChecked ? "s" : "" );
    $self->{l_info}->SetLabel($msg);
    $self->log( 'S', $msg );

    if ( $Wx::wxVERSION < 3.001 ) {
	# Due to bugs in the implementation of the wxRearrangeCtrl widget
	# we cannot update it, so we must recreate the widget.
	# https://github.com/wxWidgets/Phoenix/issues/1052#issuecomment-434388084
	my @order = ( 0 .. $#files );
	my $w = Wx::RearrangeCtrl->new($self->{sz_export_outer}->GetStaticBox(), wxID_ANY, wxDefaultPosition, wxDefaultSize, \@order, \@files );
	$self->{sz_export_outer}->Replace( $self->{w_rearrange}, $w, 1 );
	$self->{w_rearrange}->Destroy;
	$self->{w_rearrange} = $w;
    }
    else {
	$self->{w_rearrange}->GetList->Set(\@files);
	$self->{w_rearrange}->GetList->Check($_,1) for 0..$#files;
    }
    unless ( $self->{w_rearrange}->IsShown ) {
	$self->{sl_rearrange}->Show;
	$self->{l_rearrange}->Show;
	$self->{w_rearrange}->Show;
	$self->{sz_export_inner}->Layout;
    }
    $self->{sz_ep}->Layout;
    $state{sbefiles} = \@files;
}

sub OnFilelistIgnore {
    my ( $self, $event ) = @_;
    $self->OnDirPickerChanged($event);
}

sub OnRecursive {
    my ( $self, $event ) = @_;
    $self->OnDirPickerChanged($event);
}

sub OnStdCoverChecked {
    my ( $self, $event ) = @_;
    $self->{l_cover}->Enable( !$self->{cb_stdcover}->IsChecked );
    $self->{fp_cover}->Enable( !$self->{cb_stdcover}->IsChecked );
    $self->{l_exporttitle}->Enable( $self->{cb_stdcover}->IsChecked );
    $self->{t_exporttitle}->Enable( $self->{cb_stdcover}->IsChecked );
    $self->{l_exportstitle}->Enable( $self->{cb_stdcover}->IsChecked );
    $self->{t_exportstitle}->Enable( $self->{cb_stdcover}->IsChecked );
}

sub previewtooltip {
    my ( $self ) = @_;
    if ( $self->{sw_e_p}->IsSplit ) {
	$self->{bmb_preview}->SetToolTip(_T("Hide preview"));
    }
    else {
	$self->{bmb_preview}->SetToolTip(_T("Generate and show preview"));
    }
}

sub messagestooltip {
    my ( $self ) = @_;
    if ( $self->{sw_ep_m}->IsSplit ) {
	$self->{bmb_messages}->SetToolTip(_T("Hide messages"));
    }
    else {
	$self->{bmb_messages}->SetToolTip(_T("Show messages"));
    }
}

sub OnPreferences {
    my ( $self, $event ) = @_;
    use ChordPro::Wx::PreferencesDialog;
    $self->{d_prefs} ||= ChordPro::Wx::PreferencesDialog->new($self, -1, "Preferences");
    restorewinpos( $self->{d_prefs}, "prefs" );
    my $ret = $self->{d_prefs}->ShowModal;
    savewinpos( $self->{d_prefs}, "prefs" );
    $self->GetParent->SavePreferences if $ret == wxID_OK;
}

sub OnShowPreview {		# for button
    my ( $self, $event ) = @_;
    $self->{sw_e_p}->IsSplit
      ? goto &OnPreviewClose
      : goto &OnPreview;
}

sub OnPreview {
    my ( $self, $event, $args ) = @_;
    $args //= [];

    my $folder = $self->{dp_folder}->GetPath;
    my @files = @{ $state{sbefiles} };
    unless ( $folder && @files ) {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Please select a folder!",
	    "No folder selected",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    }

    $self->save_prefs();

    my $filelist = "";
    my @o = $self->{w_rearrange}->GetList->GetCurrentOrder;
    for ( $self->{w_rearrange}->GetList->GetCurrentOrder ) {
	$filelist .= "$folder/$files[$_]\n" unless $_ < 0;
    }
    if ( $filelist eq "" ) {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Please select one or more song files.",
	    "No songs selected",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    }

    my @args = ( @$args, "--filelist", \$filelist );
    my %opts = ( target => $self, filelist => 1 );

    if ( $self->{cb_stdcover}->IsChecked ) {
	push( @args, "--title",
	      encode_utf8($self->{t_exporttitle}->GetValue // "") );
	if ( my $stitle = $self->{t_exportstitle}->GetValue ) {
	    push( @args, "--subtitle", encode_utf8($stitle) );
	}
    }
    elsif ( my $cover = $self->{fp_cover}->GetPath ) {
	push( @args, "--cover", encode_utf8($cover) );
    }
    $self->preview( \@args, %opts );
    $self->previewtooltip;

    $event->Skip;
}

sub OnPreviewClose {
    my ( $self, $event ) = @_;
    return unless $self->{sw_ep_m}->IsSplit;
    $self->{sw_ep_m}->Unsplit(undef);
    $self->previewtooltip;
}

sub OnPreviewSave {
    my ( $self, $event ) = @_;
    $self->GetParent->save_preview;
}

sub OnShowMessages {
    my ( $self, $event ) = @_;
    $self->OnWindowMessages;
}

sub OnSashLRChanged {
    my ( $self, $event ) = @_;
    $state{sash}{sbexport_edit_view} = $self->{sw_e_p}->GetSashPosition;
}

sub OnWindowPreview {
    my ( $self, $event ) = @_;
    if ( $self->{sw_e_p}->IsSplit ) {
	$state{sash}{sbexport_edit_view} = $self->{sw_e_p}->GetSashPosition;
	$self->{sw_e_p}->Unsplit(undef);
    }
    else {
	$self->{sw_e_p}->SplitVertically( $self->{p_left},
					  $self->{p_right},
					  $state{sash}{sbexport_edit_view} // 0 );
    }
    $self->previewtooltip;
}

sub OnSashTBChanged {
    my ( $self, $event ) = @_;
    $state{sash}{sbexport_editview_messages} = $self->{sw_ep_m}->GetSashPosition;
}

sub OnWindowMessages {
    my ( $self, $event ) = @_;
    if ( $self->{sw_ep_m}->IsSplit ) {
	$state{sash}{sbexport_editview_messages} = $self->{sw_ep_m}->GetSashPosition;
	$self->{sw_ep_m}->Unsplit(undef);
    }
    else {
	$self->{bmb_messages}->SetBackgroundColour(wxNullColour);
	$self->{sw_ep_m}->SplitHorizontally( $self->{p_top},
					     $self->{p_bottom},
					     $state{sash}{sbexport_editview_messages} // 0 );
    }
    $self->messagestooltip;
}

sub OnMessagesClear {
    my ( $self, $event ) = @_;
    $self->{t_messages}->Clear;
}

sub OnMessagesSave {
    my ( $self, $event ) = @_;
    my $conf = Wx::ConfigBase::Get;
    my $file = $state{messages}{savedas} // "";
    my $fd = Wx::FileDialog->new
      ($self, _T("Choose file to save in"),
       "", $file,
       "*",
       0|wxFD_SAVE|wxFD_OVERWRITE_PROMPT,
       wxDefaultPosition);

    my $ret = $fd->ShowModal;
    if ( $ret == wxID_OK ) {
	$file = $fd->GetPath;
	$self->log( 'S',  "Messages saved." );
	$self->{t_messages}->SaveFile($file);
	$state{messages}{savedas} = $file;

=for later

	$self->{t_messages}->Clear if $cb->IsChecked;

=cut

    }
    $fd->Destroy;
    return $ret;
}

1;
