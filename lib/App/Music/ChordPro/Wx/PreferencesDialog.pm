#! perl

use strict;
use warnings;

# Implementation of App::Music::ChordPro::Wx::PreferencesDialog_wxg details.

package App::Music::ChordPro::Wx::PreferencesDialog;

# App::Music::ChordPro::Wx::PreferencesDialog_wxg is generated by wxGlade and contains
# all UI associated code.

use base qw( App::Music::ChordPro::Wx::PreferencesDialog_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';

sub get_configfile {
    my ( $self ) = @_;
    # warn("CF: ", $self->GetParent->{prefs_configfile} || "");
    $self->GetParent->{prefs_configfile} || ""
}

sub __set_properties {
    my ( $self ) = @_;
    $self->SUPER::__set_properties;
    $self->{t_configfiledialog}->SetValue($self->GetParent->{prefs_configfile})
      if $self->GetParent->{prefs_configfile};
    $self->{t_pdfviewer}->SetValue($self->GetParent->{prefs_pdfviewer})
      if $self->GetParent->{prefs_pdfviewer};
    $self->{cb_skipstdcfg}->SetValue($self->GetParent->{prefs_skipstdcfg});

    my $cfglib = ::findlib("config");
    my $ctl = $self->{ch_config};
    $ctl->Clear;
    my $n = 0;
    for ( @{ $self->GetParent->stylelist } ) {
	$ctl->Append($_->[0]);
	$ctl->SetClientData( $n, $_->[1]) if $_->[1];
	$n++;
    }
    $n = 0;
    if ( $self->GetParent->{prefs_cfgpreset} ) {
	$n = $ctl->FindString($self->GetParent->{prefs_cfgpreset});
	if ( $n == wxNOT_FOUND ) {
	    $n = 0;
	}
	else {
	    $self->GetParent->{_cfgpresetfile} =
	      $self->{ch_config}->GetClientData($n);
	}
    }
    $ctl->SetSelection($n);
    $self->_enablecustom($n);
}

sub _enablecustom {
    my ( $self, $n ) = @_;
    my $ctl = $self->{ch_config};
    for ( $self->{l_cfgfile}, $self->{t_configfiledialog}, $self->{b_configfiledialog} ) {
	$_->Enable( $n == $ctl->GetCount - 1 );
    }
}

################ Event handlers ################

# Event handlers override the subs generated by wxGlade in the _wxg class.

sub OnCfgChoice {
    my ( $self, $event ) = @_;
    my $n = $self->{ch_config}->GetSelection;
    my $cfg = $self->{ch_config}->GetClientData($n);
    $self->{cfg_preset} = $cfg;
    $self->_enablecustom($n);
}

sub OnConfigFileDialog {
    my ( $self, $event ) = @_;
    my $fd = Wx::FileDialog->new
      ($self, _T("Choose config file"),
       "", $self->GetParent->{prefs_configfile} || "",
       "Config files (*.cfg,*.json)|*.cfg;*.json|All files|*.*",
       0|wxFD_OPEN,
       wxDefaultPosition);
    my $ret = $fd->ShowModal;
    if ( $ret == wxID_OK ) {
	my $file = $fd->GetPath;
	if ( -f $file ) {
	    $self->{t_configfiledialog}->SetValue($file);
	}
	else {
	    my $md = Wx::MessageDialog->new
	      ( $self,
		"Create new config $file?",
		"Creating a config file",
		wxYES_NO | wxICON_INFORMATION );
	    my $ret = $md->ShowModal;
	    $md->Destroy;
	    if ( $ret == wxID_YES ) {
		my $fd;
		if ( open( $fd, ">", $file )
		     and print $fd App::Music::ChordPro::Config::config_defaults()
		     and close($fd) ) {
		    $self->{t_configfiledialog}->SetValue($file);
		}
		else {
		    my $md = Wx::MessageDialog->new
		      ( $self,
			"Error creating $file: $!",
			"File open error",
			wxOK | wxICON_ERROR );
		    $md->ShowModal;
		    $md->Destroy;
		}
	    }
	}
    }
    $fd->Destroy;
}

#               C      D      E  F      G      A        B
my @xpmap = qw( 0 1  1 2 3  3 4  5 6  6 7 8  8 9 10 10 11 );
my @sfmap = qw( 0 7 -5 2 9 -3 4 -1 6 -6 1 8 -4 3 10 -2  5 );

sub OnAccept {
    my ( $self, $event ) = @_;

    my $n = $self->{ch_config}->GetSelection;
    $self->GetParent->{prefs_cfgpreset} =
      $self->{ch_config}->GetString($n);
    if ( $n == 0 ) {
	$self->GetParent->{_cfgpresetfile} = "";
    }
    elsif ( $n == $self->{ch_config}->GetCount - 1 ) {
	$self->GetParent->{_cfgpresetfile} =
	$self->GetParent->{prefs_configfile} =
	  $self->{t_configfiledialog}->GetValue;
    }
    else {
	$self->GetParent->{_cfgpresetfile} =
	  $self->{ch_config}->GetClientData($n);
    }
    # warn("CFG: ", $self->GetParent->{_cfgpresetfile}, "\n");
    $self->GetParent->{prefs_pdfviewer} = $self->{t_pdfviewer}->GetValue;

    my $xp = $xpmap[$self->{ch_xpose_to}->GetSelection]
      - $xpmap[$self->{ch_xpose_from}->GetSelection];
    $xp += 12 if $xp < 0;
    $xp = $xp - 12 if $self->{rb_xpose_flat }->GetValue;
    $self->GetParent->{prefs_xpose} = $xp;
    $self->GetParent->{prefs_skipstdcfg} =
      $self->{cb_skipstdcfg}->IsChecked ? 1 : 0;

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

sub OnXposeFrom {
    my ( $self, $event ) = @_;
    $event->Skip;
}

sub OnXposeTo {
    my ( $self, $event ) = @_;
    my $sel = $self->{ch_xpose_to}->GetSelection;
    my $sf = $sfmap[$sel];
    if ( $sf < 0 ) {
	$self->{rb_xpose_flat }->SetValue(1);
	$self->{rb_xpose_sharp}->SetValue(0);
    }
    elsif ( $sf > 0 ) {
	$self->{rb_xpose_flat }->SetValue(0);
	$self->{rb_xpose_sharp}->SetValue(1);
    }
    else {
	$self->{rb_xpose_flat }->SetValue(0);
	$self->{rb_xpose_sharp}->SetValue(0);
    }
    $event->Skip;
}

sub OnXposeSharp {
    my ( $self, $event ) = @_;
    $self->{rb_xpose_flat }->SetValue(0);
    $event->Skip;
}

sub onXposeFlat {
    my ( $self, $event ) = @_;
    $self->{rb_xpose_sharp}->SetValue(0);
    $event->Skip;
}

1;