#! perl

use strict;
use warnings;
use utf8;

# Implementation of ChordPro::Wx::PreferencesDialog_wxg details.

package ChordPro::Wx::PreferencesDialog;

# ChordPro::Wx::PreferencesDialog_wxg is generated by wxGlade and contains
# all UI associated code.

use parent qw( ChordPro::Wx::PreferencesDialog_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';
use ChordPro::Wx::Utils;
use Encode qw(encode_utf8);
use ChordPro::Utils qw( is_macos );

# BUilt-in descriptions for some notation systems.
my $notdesc =
  { "common"	   => "C, D, E, F, G, A, B",
    "dutch"	   => "C, D, E, F, G, A, B",
    "german"	   => "C, ... A, Ais/B, H",
    "latin"	   => "Do, Re, Mi, Fa, Sol, ...",
    "scandinavian" => "C, ... A, A#/Bb, H",
    "solfege"	   => "Do, Re, Mi, Fa, So, ...",
    "solfège"	   => "Do, Re, Mi, Fa, So, ...",
    "nashville"	   => "1, 2, 3, ...",
    "roman"	   => "I, II, III, ...",
  };

sub get_configfile {
    my ( $self ) = @_;
    # warn("CF: ", $self->GetParent->{prefs_configfile} || "");
    $self->GetParent->{prefs_configfile} || ""
}

# As of wxGlade 1.0 __set_properties and __do_layout are gone.
sub new {
    my $self = shift->SUPER::new(@_);
    $self->fetch_prefs();
    $self;
}

sub _enablecustom {
    my ( $self ) = @_;
    my $n = $self->{cb_configfile}->IsChecked;
    $self->{fp_customconfig}->Enable($n);

    $n = $self->{cb_customlib}->IsChecked;
    $self->{dp_customlibrary}->Enable($n);

    $n = $self->{cb_tmplfile}->IsChecked;
    $self->{fp_tmplfile}->Enable($n);
}

sub fetch_prefs {
    my ( $self ) = @_;

    # Fetch preferences from parent.

    my $parent = $self->GetParent;

    # Skip default (system, user, song) configs.
    $self->{cb_skipstdcfg}->SetValue($parent->{prefs_skipstdcfg});

    # Presets.
    $self->{cb_presets}->SetValue($parent->{prefs_enable_presets});
    $self->{ch_presets}->Enable($parent->{prefs_enable_presets});
    my $ctl = $self->{ch_presets};
    $ctl->Clear;
    for ( @{ $parent->stylelist } ) {
	my $t = ucfirst(lc($_));
	$t =~ s/_/ /g;
	$t =~ s/ (.)/" ".uc($1)/eg;
	$ctl->Append($t);
    }

    my $p = $parent->{prefs_cfgpreset};
    foreach ( @$p ) {
	if ( $_ eq "custom" ) {
	    $self->{cb_configfile}->SetValue(1);
	    next;
	}
	my $t = ucfirst(lc($_));
	$t =~ s/_/ /g;
	$t =~ s/ (.)/" ".uc($1)/eg;
	my $n = $ctl->FindString($t);
	unless ( $n == wxNOT_FOUND ) {
	    $ctl->Check( $n, 1 );
	}
    }

    # Custom config file.
    $self->{cb_configfile}->SetValue($parent->{prefs_enable_configfile});
    $self->{fp_customconfig}->SetPath($parent->{prefs_configfile})
      if $parent->{prefs_configfile};

    # Custom library.
    $self->{cb_customlib}->SetValue($parent->{prefs_enable_customlib});
    $self->{dp_customlibrary}->SetPath($parent->{prefs_customlib})
      if $parent->{prefs_customlib};

    # New song template.
    $self->{cb_tmplfile}->SetValue($parent->{prefs_enable_tmplfile});
    $self->{fp_tmplfile}->SetPath($parent->{prefs_tmplfile})
      if $parent->{prefs_tmplfile};

    # Editor.
    $ctl = $self->{ch_editfont};
    $ctl->SetSelection( $parent->{prefs_editfont} );
    $ctl = $self->{sp_editfont};
    $ctl->SetValue( $parent->{prefs_editsize} );

    # Notation.
    $ctl = $self->{ch_notation};
    $ctl->Clear;
    my $n = 0;
    my $check = 0;
    for ( @{ $parent->notationlist } ) {
	my $s = ucfirst($_);
	$check = $n if $_ eq lc $parent->{prefs_notation};
	$s .= " (" . $notdesc->{lc($s)} .")" if $notdesc->{lc($s)};
	$ctl->Append($s);
	$ctl->SetClientData( $n, $_);
	$n++;
    }
    $ctl->SetSelection($check);

    # Transpose.

    # Transcode.
    $ctl = $self->{ch_transcode};
    $ctl->Clear;
    $ctl->Append("-----");
    $n = 1;
    for ( @{ $parent->notationlist } ) {
	my $s = ucfirst($_);
	$check = $n if $_ eq lc $parent->{prefs_xcode};
	$s .= " (" . $notdesc->{lc($s)} .")" if $notdesc->{lc($s)};
	$ctl->Append($s);
	$ctl->SetClientData( $n, $_);
	$n++;
    }
    $ctl->SetSelection($check);

    # PDF Viewer.
    $self->{t_pdfviewer}->SetValue($parent->{prefs_pdfviewer})
      if $parent->{prefs_pdfviewer};

    $self->_enablecustom;

}

#               C      D      E  F      G      A        B C
my @xpmap = qw( 0 1  1 2 3  3 4  5 6  6 7 8  8 9 10 10 11 12 );
my @sfmap = qw( 0 7 -5 2 9 -3 4 -1 6 -6 1 8 -4 3 10 -2  5 0  );

sub store_prefs {
    my ( $self ) = @_;

    # Transfer all preferences to the parent.
    my $parent = $self->GetParent;

    # Skip default (system, user, song) configs.
    $parent->{prefs_skipstdcfg}  = $self->{cb_skipstdcfg}->IsChecked;

    # Presets.
    $parent->{prefs_enable_presets} = $self->{cb_presets}->IsChecked;
    my $ctl = $self->{ch_presets};
    my $cnt = $ctl->GetCount;
    my @p;
    my $styles = $parent->stylelist;
    for ( my $n = 0; $n < $cnt; $n++ ) {
	next unless $ctl->IsChecked($n);
	push( @p, $styles->[$n] );
	if ( $n == $cnt - 1 ) {
	    my $c = $self->{fp_customconfig}->GetPath;
	    $parent->{_cfgpresetfile} =
	      $parent->{prefs_configfile} = $c;
	}
    }
    $parent->{prefs_cfgpreset} = \@p;

    # Custom config file.
    $parent->{prefs_enable_configfile} = $self->{cb_configfile}->IsChecked;
    $parent->{prefs_configfile}        = $self->{fp_customconfig}->GetPath;

    # Custom library.
    $parent->{prefs_enable_customlib} = $self->{cb_customlib}->IsChecked;
    $parent->{prefs_customlib}        = $self->{dp_customlibrary}->GetPath;

    # New song template.
    $parent->{prefs_enable_tmplfile} = $self->{cb_tmplfile}->IsChecked;
    $parent->{prefs_tmplfile}        = $self->{fp_tmplfile}->GetPath;

    # Editor.
    $parent->{prefs_editfont}	   = $self->{ch_editfont}->GetSelection;
    $parent->{prefs_editsize}	   = $self->{sp_editfont}->GetValue;

    # Notation.
    my $n = $self->{ch_notation}->GetSelection;
    if ( $n > 0 ) {
	$parent->{prefs_notation} =
	  $self->{ch_notation}->GetClientData($n);
    }
    else {
       	$parent->{prefs_notation} = "";
    }

    # Transpose.
    $parent->{prefs_xpose_from} = $xpmap[$self->{ch_xpose_from}->GetSelection];
    $parent->{prefs_xpose_to  } = $xpmap[$self->{ch_xpose_to  }->GetSelection];
    $parent->{prefs_xpose_acc}  = $self->{ch_acc}->GetSelection;
    $n = $parent->{prefs_xpose_to} - $parent->{prefs_xpose_from};
    $n += 12 if $n < 0;
    $n += 12 if $parent->{prefs_xpose_acc} == 1; # sharps
    $n -= 12 if $parent->{prefs_xpose_acc} == 2; # flats
    $parent->{prefs_xpose} = $n;

    # Transcode.
    $n = $self->{ch_transcode}->GetSelection;
    if ( $n > 0 ) {
	$parent->{prefs_xcode} =
	  $self->{ch_transcode}->GetClientData($n);
    }
    else {
       	$parent->{prefs_xcode} = "";
    }

    # PDF Viewer.
    $parent->{prefs_pdfviewer} = $self->{t_pdfviewer}->GetValue;
}

################ Event handlers ################

# Event handlers override the subs generated by wxGlade in the _wxg class.

sub OnConfigFile {
    my ( $self, $event ) = @_;
    my $n = $self->{cb_configfile}->IsChecked;
    $self->{fp_customconfig}->Enable($n);
    $event->Skip;
}

sub OnCustomConfigChanged {
    my ( $self, $event ) = @_;
    my $path = $self->{fp_customconfig}->GetPath;
    my $fn = encode_utf8($path);
    return if -s $fn;		# existing config

    my $md = Wx::MessageDialog->new
      ( $self,
	"Create new config $path?",
	"Creating a config file",
	wxYES_NO | wxICON_INFORMATION );
    my $ret = $md->ShowModal;
    $md->Destroy;
    if ( $ret == wxID_YES ) {
	my $fd;
	if ( open( $fd, ">:utf8", $fn )
	     and print $fd ChordPro::Config::config_final( default => 1 )
	     and close($fd) ) {
	    $self->{fp_customconfig}->SetPath($path);
	}
	else {
	    my $md = Wx::MessageDialog->new
	      ( $self,
		"Error creating $path: $!",
		"File open error",
		wxOK | wxICON_ERROR );
	    $md->ShowModal;
	    $md->Destroy;
	}
    }
}

sub OnCustomLib {
    my ( $self, $event ) = @_;
    my $n = $self->{cb_customlib}->IsChecked;
    $self->{dp_customlibrary}->Enable($n);
}

sub OnTmplFile {
    my ( $self, $event ) = @_;
    my $n = $self->{cb_tmplfile}->IsChecked;
    $self->{fp_tmplfile}->Enable($n);
}

sub OnTmplFileDialog {
    my ( $self, $event ) = @_;
    my $fd = Wx::FileDialog->new
      ($self, _T("Choose template for new songs"),
       "", $self->GetParent->{prefs_tmplfile} || "",
       "ChordPro files (*.cho,*.crd,*.chopro,*.chord,*.chordpro,*.pro)|*.cho;*.crd;*.chopro;*.chord;*.chordpro;*.pro" .
       ( is_macos ? ";*.txt" : "|All files|*.*" ),
       0|wxFD_OPEN|wxFD_FILE_MUST_EXIST,
       wxDefaultPosition);
    my $ret = $fd->ShowModal;
    if ( $ret == wxID_OK ) {
	my $file = $fd->GetPath;
	$self->{t_tmplfiledialog}->SetValue($file);
    }
    $fd->Destroy;
}

sub OnAccept {
    my ( $self, $event ) = @_;
    $self->store_prefs();
    $event->Skip;
}

sub OnCancel {
    my ( $self, $event ) = @_;
    $event->Skip;
}

sub OnSkipStdCfg {
    my ( $self, $event ) = @_;
    $event->Skip;
}

sub OnPresets {
    my ( $self, $event ) = @_;
    $self->{ch_presets}->Enable( $self->{cb_presets}->GetValue );
    $event->Skip;
}

sub OnXposeFrom {
    my ( $self, $event ) = @_;
    $self->OnXposeTo($event);
}

sub OnXposeTo {
    my ( $self, $event ) = @_;
    my $sel = $self->{ch_xpose_to}->GetSelection;
    my $sf = $sfmap[$sel];
    if ( $sf == 0 ) {
	$sf = $sel - $self->{ch_xpose_from}->GetSelection;
    }
    if ( $sf < 0 ) {
	$self->{ch_acc}->SetSelection(2);
    }
    elsif ( $sf > 0 ) {
	$self->{ch_acc}->SetSelection(1);
    }
    else {
	$self->{ch_acc}->SetSelection(0);
    }
    $event->Skip;
}

sub OnChNotation {
    my ( $self, $event ) = @_;
    my $n = $self->{ch_notation}->GetSelection;
    $event->Skip;
}

sub OnChTranscode {
    my ( $self, $event ) = @_;
    my $n = $self->{ch_transcode}->GetSelection;
    $event->Skip;
}

sub OnChEditFont {
    my ($self, $event) = @_;
    my $parent = $self->GetParent;
    my $pedit = $parent->{p_edit};
    my $ctl = $pedit->{t_source};
    my $n = $self->{ch_editfont}->GetSelection;
    my $font = $parent->fonts->[$n]->{font};
    $font->SetPointSize($parent->{prefs_editsize});
    $ctl->SetFont($font);
    $parent->{prefs_editfont} = $n;
    $event->Skip;
}

sub OnSpEditFont {
    my ($self, $event) = @_;
    my $parent = $self->GetParent;
    my $pedit = $parent->{p_edit};
    my $ctl = $pedit->{t_source};
    my $n = $self->{sp_editfont}->GetValue;
    my $font = $ctl->GetFont;
    $font->SetPointSize($n);
    $ctl->SetFont($font);
    $parent->{prefs_editsize} = $n;
    $event->Skip;
}

sub OnChEditColour {
    my ($self, $event) = @_;
    my $parent = $self->GetParent;
    my $pedit = $parent->{p_edit};
    my $ctl = $pedit->{t_source};
    my $n = $self->{cp_editor}->GetColour;
    if ( $n && $n->IsOk ) {
	$ctl->SetBackgroundColour($n)
	  if $ctl->can("SetBackgroundColour");
	$parent->{prefs_editcolour} = $n->GetAsString(wxC2S_HTML_SYNTAX);
    }
    $event->Skip;
}

1;
