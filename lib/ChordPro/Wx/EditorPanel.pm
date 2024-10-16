#! perl

use strict;
use warnings;
use utf8;

# Implementation of ChordPro::Wx::EditorPanel_wxg details.

package ChordPro::Wx::EditorPanel;

# ChordPro::Wx::EditorPanel_wxg is generated by wxGlade and contains
# all UI associated code.

use parent qw( ChordPro::Wx::EditorPanel_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';
use ChordPro::Wx::Utils;
use ChordPro::Utils qw( demarkup is_macos is_msw );
use ChordPro::Paths;

my $stc;
my $wv;

sub new {
    my( $self, $parent, $id, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );

    # By default the TextCtrl on MacOS substitutes smart quotes and dashes.
    # Note that OSXDisableAllSmartSubstitutions requires an augmented
    # version of wxPerl.
    $self->{t_source}->OSXDisableAllSmartSubstitutions
      if $self->{t_source}->can("OSXDisableAllSmartSubstitutions");

    # Try Styled Text Control (Scintilla). This required an updated
    # version of Wx.
    $stc = eval { use Wx::STC; 1 };
    if ( $stc ) {
	# This may decide otherwise.
	$self->setup_scintilla;
    }

    $wv = is_msw ? 0 : eval { use Wx::WebView; 1 };
    if ( $wv ) {
	my $w = Wx::WebView::New( $self->{p_preview},
				  wxID_ANY,
				  CP->findres( "chordpro-icon.png",
					       class => "icons" ) );
	$self->{sz_prv}->Replace( $self->{webview}, $w, 1 );
	$self->{webview}->Destroy;
	$self->{webview} = $w;
	$self->{sz_prv}->Layout;
    }

    $self->{sw_main}->Unsplit(undef);
    return $self;

}

sub log {
    my $self = shift;
    wxTheApp->GetTopWindow->log(@_);
}

################ API Functions ################

sub setup_scintilla {
    my ( $self ) = @_;

    # Replace the placeholder Wx::TextCtrl.
    my $stc = Wx::StyledTextCtrl->new( $self->{p_left},
				       wxID_ANY );

    # Check for updated STC.
    for ( qw( IsModified DiscardEdits MarkDirty ) ) {
	unless ( $stc->can($_) ) {
	    # Unpatched Wx, missing methods.
	    $stc->Destroy;
	    return;
	}
    }

    $self->{sz_source}->Replace( $self->{t_source}, $stc, 1 );
    $self->{t_source}->Destroy;
    $self->{t_source} = $stc;
    $self->{sz_source}->Layout;

    $stc->SetLexer(wxSTC_LEX_CONTAINER);
    $stc->SetKeyWords(0,
		      [qw( album arranger artist capo chord chorus
			   column_break columns comment comment_box
			   comment_italic composer copyright define
			   diagrams duration end_of_bridge end_of_chorus
			   end_of_grid end_of_tab end_of_verse grid
			   highlight image key lyricist meta new_page
			   new_physical_page new_song no_grid pagesize
			   pagetype sorttitle start_of_bridge
			   start_of_chorus start_of_grid start_of_tab
			   start_of_verse subtitle tempo time title
			   titles transpose year )
		      ]);

    Wx::Event::EVT_STC_STYLENEEDED($self, -1, $self->can('OnStyleNeeded'));

    $stc->StyleClearAll;
    # 0 - basic
    # 1 - comments
    $stc->StyleSetSpec( 1, "bold,fore:grey" );
    # 2 - Keywords
    $stc->StyleSetSpec( 2, "bold,fore:grey" );
    # 3 - Brackets
    $stc->StyleSetSpec( 3, "bold,fore:blue" );
    # 4 - Chords
    $stc->StyleSetSpec( 4, "fore:red" );
    # 5 - Directives
    $stc->StyleSetSpec( 5, "bold,fore:indigo" );
    # 6 - Directive arguments
    $stc->StyleSetSpec( 6, "fore:orange" );

    # For linenumbers.
    $stc->SetMarginWidth( 0, 40 ); # TODO
}

sub style_text {
    my ( $self, $stc ) = @_;

    # Scintilla uses byte indices.
    use Encode;
    my $text  = Encode::encode_utf8($stc->GetText);

    my $style = sub {
	my ( $re, @styles ) = @_;
	pos($text) = 0;
	while ( $text =~ m/$re/g ) {
	    my @s = @styles;
	    die("!!! ", scalar(@{^CAPTURE}), ' ', scalar(@s)) unless @s == @{^CAPTURE};
	    my $end = pos($text);
	    my $start = $end - length($&);
	    my $group = 0;
	    while ( $start < $end ) {
		my $l = length(${^CAPTURE[$group++]});
		$stc->StartStyling( $start, 0 );
		$stc->SetStyling( $l, shift(@s) );
		$start += $l;
	    }
	}
    };

    # Comments/
    $style->( qr/^(#.*)/m, 1 );
    # Directives.
    $style->( qr/^(\{)([-\w!]+)([: ]+)(.*)(\})/m, 3, 5, 3, 6, 3 );
    # Chords.
    $style->( qr/(\[)([^\[\]]*)(\])/m, 3, 4, 3 );
}

################ API Functions ################

sub refresh {
    my ( $self ) = @_;
    # Enable/disable menu items.
    for ( $self->GetParent->{main_menubar} ) {
	$_->FindItem(wxID_UNDO)->Enable($self->{t_source}->CanUndo);
	$_->FindItem(wxID_REDO)->Enable($self->{t_source}->CanRedo);
    }
}

sub open {
    my ( $self, $create ) = @_;
    return unless $self->checksaved;

    if ( $create ) {
	$self->newfile;
    }
    else {
	$self->opendialog;
    }
}

sub opendialog {
    my ($self) = @_;
    my $fd = Wx::FileDialog->new
      ($self, _T("Choose ChordPro file"),
       "", "",
       "ChordPro files (*.cho,*.crd,*.chopro,*.chord,*.chordpro,*.pro)|*.cho;*.crd;*.chopro;*.chord;*.chordpro;*.pro".
       (is_macos ? ";*.txt" : "|All files|*.*"),
       0|wxFD_OPEN|wxFD_FILE_MUST_EXIST,
       wxDefaultPosition);
    my $ret = $fd->ShowModal;
    if ( $ret == wxID_OK ) {
	$self->openfile( $fd->GetPath, 1 );
    }
    $fd->Destroy;
}

sub openfile {
    my ( $self, $file, $checked ) = @_;

    # File tests fail on Windows, so bypass when already checked.
    unless ( $checked || -f -r $file ) {
	$self->log( 'W',  "Error opening $file: $!",);
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Error opening $file: $!",
	    "File open error",
	    wxOK | wxICON_ERROR );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return;
    }
    unless ( $self->{t_source}->LoadFile($file) ) {
	$self->log( 'W',  "Error opening $file: $!",);
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Error opening $file: $!",
	    "File load error",
	    wxOK | wxICON_ERROR );
	$md->ShowModal;
	$md->Destroy;
	return;
    }
    #### TODO: Get rid of selection on Windows
    $self->{_currentfile} = $file;
    $self->GetParent->Recents->add($file);
    if ( $self->{t_source}->GetText =~ /^\{\s*t(?:itle)?[: ]+([^\}]*)\}/m ) {
	my $title = demarkup($1);
	my $n = $self->{t_source}->GetLineCount;
	$self->log( 'S', "Loaded: $title ($n line" . ( $n == 1 ? "" : "s" ) . ")");
    }
    else {
	my $n = $self->{t_source}->GetLineCount;
	$self->log( 'S', "Loaded: $file ($n line" . ( $n == 1 ? "" : "s" ) . ")");
    }


    $self->{prefs_xpose} = 0;
    $self->{prefs_xposesharp} = 0;
    return 1;
}

sub newfile {
    my ( $self ) = @_;
    undef $self->{_currentfile};

    my $file = $self->{prefs_tmplfile};
    my $content = "{title: New Song}\n\n";
    if ( $file ) {
	$self->log( 'I', "Loading template $file" );
	if ( -f -r $file ) {
	    if ( $self->{t_source}->LoadFile($file) ) {
		$content = "";
	    }
	    else {
		$content = "# Error opening template $file: $!\n\n" . $content;
	    }
	}
	else {
	    $content = "# Error opening template $file: $!\n\n" . $content;
	}
     }
    $self->{t_source}->SetText($content) unless $content eq "";
    $self->{t_source}->SetModified(0);
    $self->log( 'S', "New file");
    $self->{prefs_xpose} = 0;
    $self->{prefs_xposesharp} = 0;
}

sub checksaved {
    my ( $self ) = @_;
    return 1 unless ( $self->{t_source} && $self->{t_source}->IsModified );
    if ( $self->{_currentfile} ) {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "File " . $self->{_currentfile} . " has been changed.\n".
	    "Do you want to save your changes?",
	    "File has changed",
	    0 | wxCANCEL | wxYES_NO | wxYES_DEFAULT | wxICON_QUESTION );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return if $ret == wxID_CANCEL;
	if ( $ret == wxID_YES ) {
	    $self->save_as( $self->{_currentfile} );
	}
    }
    else {
	my $md = Wx::MessageDialog->new
	  ( $self,
	    "Do you want to save your changes?",
	    "Contents has changed",
	    0 | wxCANCEL | wxYES_NO | wxYES_DEFAULT | wxICON_QUESTION );
	my $ret = $md->ShowModal;
	$md->Destroy;
	return if $ret == wxID_CANCEL;
	if ( $ret == wxID_YES ) {
	    return if $self->OnSaveAs == wxID_CANCEL;
	}
    }
    return 1;
}

sub saveas {
    my ( $self ) = @_;
    my $fd = Wx::FileDialog->new
      ($self, _T("Choose output file"),
       "", "",
       "*.cho",
       0|wxFD_SAVE|wxFD_OVERWRITE_PROMPT,
       wxDefaultPosition);
    my $ret = $fd->ShowModal;
    if ( $ret == wxID_OK ) {
	$self->save_as( $self->{_currentfile} = $fd->GetPath );
    }
    $fd->Destroy;
    return $ret;
}

sub save_as {
    my ( $self, $file ) = @_;
    $self->{t_source}->SaveFile($file);

    $self->log( 'S',  "Saved." );
}

sub save {
    my ( $self ) = @_;
    goto &saveas unless $self->{_currentfile};
    $self->save_as( $self->{_currentfile} );
}

sub undo {
    my ( $self ) = @_;
    $self->{t_source}->CanUndo
      ? $self->{t_source}->Undo
	: $self->log( 'I', "Sorry, can't undo yet");
}

sub redo {
    my ( $self ) = @_;
    $self->{t_source}->CanRedo
      ? $self->{t_source}->Redo
	: $self->log( 'I', "Sorry, can't redo yet");
}

sub cut {
    my ( $self ) = @_;
    $self->{t_source}->Cut;
}

sub paste {
    my ( $self ) = @_;
    $self->{t_source}->Paste;
}

sub delete {
    my ( $self ) = @_;
    my ( $from, $to ) = $self->{t_source}->GetSelection;
    $self->{t_source}->Remove( $from, $to ) if $from < $to;
}

sub alert {
    my ( $self ) = @_;
}

################ Event Handlers ################

sub OnText {
    my ($self, $event) = @_;
    $self->{t_source}->SetModified(1);
}

sub OnPreferences {
    my ( $self, $event ) = @_;
    $self->GetParent->OnPreferences($event);
}

sub OnPreview {
    my ( $self, $event ) = @_;
    $self->GetParent->preview( [], target => $self );
}

sub OnPreviewClose {
    my ( $self, $event ) = @_;
    return unless $self->{sw_main}->IsSplit;
    $self->{sw_main}->Unsplit(undef);
    $self->{b_preview_close}->Show(0);
    $self->{b_preview_save}->Show(0);
    $self->{sz_buttons}->Layout;
}

sub OnPreviewSave {
    my ( $self, $event ) = @_;
    $self->GetParent->save_preview;
}

sub OnShowMessages {
    my ( $self, $event ) = @_;
    $self->GetParent->{_prev_mode} = "EDIT";
    $self->GetParent->select_mode("MSGS");
}

sub OnStyleNeeded {
    my ( $self, $event ) = @_;
    $self->style_text($self->{t_source});
}

sub OnInitial {
    my ( $self, $event ) = @_;
    $self->Skip if $self->checksaved;
}

################ Compatibility ################

# This is to facilitate swapping between TextCtrl and Scintilla.

sub Wx::StyledTextCtrl::SetFont {
    $_[0]->StyleSetFont( $_, $_[1] ) for 0..6;
}

sub Wx::StyledTextCtrl::GetFont {
    $_[0]->StyleGetFont(0, $_[1]);
}

# IsModified, MarkDirty and DiscardEdits need custom patches.
sub Wx::StyledTextCtrl::SetModified {
    $_[1] ? $_[0]->MarkDirty : $_[0]->DiscardEdits;
}

sub Wx::TextCtrl::GetText {
    $_[0]->GetValue;
}

sub Wx::TextCtrl::SetText {
    $_[0]->SetValue($_[1]);
}

sub Wx::TextCtrl::GetLineCount {
    $_[0]->GetNumberOfLines;
}

1;

