# generated by wxGlade 1.1.0pre on Mon Nov 15 15:27:04 2021
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package App::Music::ChordPro::Wx::PreferencesDialog_wxg;

use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;

use Wx::Locale gettext => '_T';
sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::new
    $style = wxDEFAULT_DIALOG_STYLE|wxMAXIMIZE_BOX|wxRESIZE_BORDER
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->SetTitle(_T("Preferences"));
    
    $self->{sz_prefs_outer} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_prefs_inner} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_prefs_outer}->Add($self->{sz_prefs_inner}, 1, wxEXPAND|wxLEFT|wxRIGHT|wxTOP, 0);
    
    $self->{sizer_2} = Wx::FlexGridSizer->new(13, 2, 5, 5);
    $self->{sz_prefs_inner}->Add($self->{sizer_2}, 1, 0, 5);
    
    $self->{cb_skipstdcfg} = Wx::CheckBox->new($self, wxID_ANY, _T("Ignore standard configs"));
    $self->{cb_skipstdcfg}->SetToolTipString(_T("Ignore user and legacy configs, if any"));
    $self->{cb_skipstdcfg}->SetValue(1);
    $self->{sizer_2}->Add($self->{cb_skipstdcfg}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sizer_2}->Add(0, 0, 0, 0, 0);
    
    $self->{l_config} = Wx::StaticText->new($self, wxID_ANY, _T("Standard configs"));
    $self->{l_config}->Enable(0);
    $self->{sizer_2}->Add($self->{l_config}, 1, wxLEFT|wxTOP, 5);
    
    $self->{ch_config} = Wx::CheckListBox->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Default")], wxLB_EXTENDED|wxLB_NEEDED_SB);
    $self->{ch_config}->SetMinSize($self->{ch_config}->ConvertDialogSizeToPixels(Wx::Size->new(130, 39)));
    $self->{ch_config}->Enable(0);
    $self->{ch_config}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_config}, 1, wxALIGN_CENTER_VERTICAL|wxEXPAND|wxRIGHT|wxTOP, 5);
    
    $self->{cb_configfile} = Wx::CheckBox->new($self, wxID_ANY, _T("Custom config"));
    $self->{sizer_2}->Add($self->{cb_configfile}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sz_configfile} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_configfile}, 1, wxEXPAND|wxRIGHT, 5);
    
    $self->{t_configfiledialog} = Wx::TextCtrl->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_READONLY);
    $self->{t_configfiledialog}->SetToolTipString(_T("Select a custom config file by pressing the [...] button."));
    $self->{sz_configfile}->Add($self->{t_configfiledialog}, 1, wxEXPAND, 0);
    
    $self->{b_configfiledialog} = Wx::Button->new($self, wxID_ANY, _T("\N{U+2026}"), wxDefaultPosition, wxDefaultSize, wxBU_EXACTFIT);
    $self->{b_configfiledialog}->SetMinSize($self->{b_configfiledialog}->ConvertDialogSizeToPixels(Wx::Size->new(38, 14)));
    $self->{sz_configfile}->Add($self->{b_configfiledialog}, 0, 0, 0);
    
    $self->{cb_customlib} = Wx::CheckBox->new($self, wxID_ANY, _T("Custom library"));
    $self->{sizer_2}->Add($self->{cb_customlib}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sz_customlib} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_customlib}, 1, wxEXPAND|wxRIGHT, 5);
    
    $self->{t_customlibdialog} = Wx::TextCtrl->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_READONLY);
    $self->{t_customlibdialog}->SetToolTipString(_T("Select a custom library by pressing the [...] button."));
    $self->{sz_customlib}->Add($self->{t_customlibdialog}, 1, wxEXPAND, 0);
    
    $self->{b_customlibdialog} = Wx::Button->new($self, wxID_ANY, _T("\N{U+2026}"), wxDefaultPosition, wxDefaultSize, wxBU_EXACTFIT);
    $self->{b_customlibdialog}->SetMinSize($self->{b_customlibdialog}->ConvertDialogSizeToPixels(Wx::Size->new(38, 14)));
    $self->{sz_customlib}->Add($self->{b_customlibdialog}, 0, 0, 0);
    
    my $static_line_1 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_1, 0, wxEXPAND, 0);
    
    my $static_line_2 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_2, 0, wxEXPAND, 0);
    
    my $l_tmpl = Wx::StaticText->new($self, wxID_ANY, _T("New song template"));
    $self->{sizer_2}->Add($l_tmpl, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sz_tmpl} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_tmpl}, 1, wxEXPAND|wxRIGHT, 5);
    
    $self->{t_tmpldialog} = Wx::TextCtrl->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_READONLY);
    $self->{t_tmpldialog}->SetToolTipString(_T("Select a template for new songs by pressing the [...] button."));
    $self->{sz_tmpl}->Add($self->{t_tmpldialog}, 1, wxEXPAND, 0);
    
    $self->{b_tmpldialog} = Wx::Button->new($self, wxID_ANY, _T("\N{U+2026}"), wxDefaultPosition, wxDefaultSize, wxBU_EXACTFIT);
    $self->{b_tmpldialog}->SetMinSize($self->{b_tmpldialog}->ConvertDialogSizeToPixels(Wx::Size->new(38, 14)));
    $self->{sz_tmpl}->Add($self->{b_tmpldialog}, 0, 0, 0);
    
    my $static_line_5 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_5, 0, wxEXPAND, 0);
    
    my $static_line_6 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_6, 0, wxEXPAND, 0);
    
    my $l_edit = Wx::StaticText->new($self, wxID_ANY, _T("Editor font"));
    $self->{sizer_2}->Add($l_edit, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_3}, 1, wxEXPAND, 0);
    
    $self->{ch_editfont} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Monospaced"), _T("Serif"), _T("Sans Serif")], );
    $self->{ch_editfont}->SetSelection(0);
    $self->{sizer_3}->Add($self->{ch_editfont}, 1, wxEXPAND, 0);
    
    $self->{sp_editfont} = Wx::SpinCtrl->new($self, wxID_ANY, "14", wxDefaultPosition, wxDefaultSize, wxSP_ARROW_KEYS, 4, 40, 14);
    $self->{sizer_3}->Add($self->{sp_editfont}, 0, 0, 0);
    
    my $static_line_3 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_3, 0, wxEXPAND, 0);
    
    my $static_line_4 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_4, 0, wxEXPAND, 0);
    
    $self->{l_notation} = Wx::StaticText->new($self, wxID_ANY, _T("Notation"));
    $self->{sizer_2}->Add($self->{l_notation}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{ch_notation} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Common (C, D, E, F, G, A, B)"), _T("German (C, D, E, F, G, A, H)"), _T("Latin (Do, Re, Mi, Fa, Sol, ...)"), _T("Solf\N{U+00e8}ge (Do, Re, Mi, Fa, So, ...)"), _T("Nashville (0, 1, 2, ...)"), _T("Roman (I, II, III, ...)")], );
    $self->{ch_notation}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_notation}, 0, wxALIGN_CENTER_VERTICAL|wxEXPAND|wxRIGHT, 5);
    
    $self->{l_xpose} = Wx::StaticText->new($self, wxID_ANY, _T("Transpose"));
    $self->{sizer_2}->Add($self->{l_xpose}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{sz_xpose} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_xpose}, 1, wxEXPAND|wxRIGHT, 5);
    
    $self->{l_xpose_from} = Wx::StaticText->new($self, wxID_ANY, _T("From"));
    $self->{sz_xpose}->Add($self->{l_xpose_from}, 0, wxALIGN_CENTER_VERTICAL|wxRIGHT, 5);
    
    $self->{ch_xpose_from} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_from}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_from}, 0, 0, 0);
    
    $self->{l_xpose_to} = Wx::StaticText->new($self, wxID_ANY, _T("To"));
    $self->{sz_xpose}->Add($self->{l_xpose_to}, 0, wxALIGN_CENTER_VERTICAL|wxFIXED_MINSIZE|wxLEFT|wxRIGHT, 5);
    
    $self->{ch_xpose_to} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_to}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_to}, 0, 0, 0);
    
    $self->{rb_xpose_sharp} = Wx::RadioButton->new($self, wxID_ANY, _T("Sharp"));
    $self->{rb_xpose_sharp}->SetToolTipString(_T("Use sharp chords"));
    $self->{sz_xpose}->Add($self->{rb_xpose_sharp}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT|wxRIGHT, 5);
    
    $self->{rb_xpose_flat} = Wx::RadioButton->new($self, wxID_ANY, _T("Flat"));
    $self->{rb_xpose_flat}->SetToolTipString(_T("Use flat chords"));
    $self->{sz_xpose}->Add($self->{rb_xpose_flat}, 0, wxALIGN_CENTER_VERTICAL, 0);
    
    $self->{l_transcode} = Wx::StaticText->new($self, wxID_ANY, _T("Transcode to"));
    $self->{sizer_2}->Add($self->{l_transcode}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{ch_transcode} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("-----"), _T("Common (C, D, E, F, G, A, B)"), _T("German (C, D, E, F, G, A, H)"), _T("Latin (Do, Re, Mi, Fa, Sol, ...)"), _T("Solf\N{U+00e8}ge (Do, Re, Mi, Fa, So, ...)"), _T("Nashville (0, 1, 2, ...)"), _T("Roman (I, II, III, ...)")], );
    $self->{ch_transcode}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_transcode}, 0, wxALIGN_CENTER_VERTICAL|wxEXPAND|wxRIGHT, 5);
    
    $self->{l_pdfviewer} = Wx::StaticText->new($self, wxID_ANY, _T("PDF previewer"));
    $self->{sizer_2}->Add($self->{l_pdfviewer}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{t_pdfviewer} = Wx::TextCtrl->new($self, wxID_ANY, "");
    $self->{t_pdfviewer}->SetToolTipString(_T("Alternative PDF previewer.\n  %f will be replaced by the file name\n  %u will be replaced by the file URL\nLeave empty to use the system default viewer."));
    $self->{sizer_2}->Add($self->{t_pdfviewer}, 0, wxEXPAND|wxRIGHT, 5);
    
    $self->{sz_prefs_outer}->Add(1, 1, 0, wxEXPAND, 0);
    
    $self->{sz_prefs_buttons} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_prefs_outer}->Add($self->{sz_prefs_buttons}, 0, wxALL|wxEXPAND, 5);
    
    $self->{sz_prefs_buttons}->Add(5, 1, 1, wxEXPAND, 0);
    
    $self->{b_prefs_cancel} = Wx::Button->new($self, wxID_CANCEL, "");
    $self->{sz_prefs_buttons}->Add($self->{b_prefs_cancel}, 0, 0, 0);
    
    $self->{b_prefs_ok} = Wx::Button->new($self, wxID_OK, "");
    $self->{b_prefs_ok}->SetDefault();
    $self->{sz_prefs_buttons}->Add($self->{b_prefs_ok}, 0, wxLEFT, 5);
    
    $self->{sizer_2}->AddGrowableRow(1);
    $self->{sizer_2}->AddGrowableCol(1);
    
    $self->SetSizer($self->{sz_prefs_outer});
    $self->{sz_prefs_outer}->Fit($self);
    
    $self->Layout();
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_skipstdcfg}->GetId, $self->can('OnSkipStdCfg'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_configfile}->GetId, $self->can('OnConfigFile'));
    Wx::Event::EVT_BUTTON($self, $self->{b_configfiledialog}->GetId, $self->can('OnConfigFileDialog'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_customlib}->GetId, $self->can('OnCustomLib'));
    Wx::Event::EVT_BUTTON($self, $self->{b_customlibdialog}->GetId, $self->can('OnCustomLibDialog'));
    Wx::Event::EVT_BUTTON($self, $self->{b_tmpldialog}->GetId, $self->can('OnTmplFileDialog'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_editfont}->GetId, $self->can('OnChEditFont'));
    Wx::Event::EVT_SPINCTRL($self, $self->{sp_editfont}->GetId, $self->can('OnSpEditFont'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_notation}->GetId, $self->can('OnChNotation'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_from}->GetId, $self->can('OnXposeFrom'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_to}->GetId, $self->can('OnXposeTo'));
    Wx::Event::EVT_RADIOBUTTON($self, $self->{rb_xpose_sharp}->GetId, $self->can('OnXposeSharp'));
    Wx::Event::EVT_RADIOBUTTON($self, $self->{rb_xpose_flat}->GetId, $self->can('onXposeFlat'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_transcode}->GetId, $self->can('OnChTranscode'));
    Wx::Event::EVT_BUTTON($self, $self->{b_prefs_cancel}->GetId, $self->can('OnCancel'));
    Wx::Event::EVT_BUTTON($self, $self->{b_prefs_ok}->GetId, $self->can('OnAccept'));

    # end wxGlade
    return $self;

}


sub OnSkipStdCfg {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnSkipStdCfg <event_handler>
    warn "Event handler (OnSkipStdCfg) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnConfigFile {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnConfigFile <event_handler>
    warn "Event handler (OnConfigFile) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnConfigFileDialog {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnConfigFileDialog <event_handler>
    warn "Event handler (OnConfigFileDialog) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCustomLib {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnCustomLib <event_handler>
    warn "Event handler (OnCustomLib) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCustomLibDialog {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnCustomLibDialog <event_handler>
    warn "Event handler (OnCustomLibDialog) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnTmplFileDialog {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnTmplFileDialog <event_handler>
    warn "Event handler (OnTmplFileDialog) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChEditFont {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnChEditFont <event_handler>
    warn "Event handler (OnChEditFont) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnSpEditFont {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnSpEditFont <event_handler>
    warn "Event handler (OnSpEditFont) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChNotation {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnChNotation <event_handler>
    warn "Event handler (OnChNotation) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeFrom {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnXposeFrom <event_handler>
    warn "Event handler (OnXposeFrom) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeTo {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnXposeTo <event_handler>
    warn "Event handler (OnXposeTo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeSharp {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnXposeSharp <event_handler>
    warn "Event handler (OnXposeSharp) not implemented";
    $event->Skip;
    # end wxGlade
}


sub onXposeFlat {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::onXposeFlat <event_handler>
    warn "Event handler (onXposeFlat) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChTranscode {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnChTranscode <event_handler>
    warn "Event handler (OnChTranscode) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCancel {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnCancel <event_handler>
    warn "Event handler (OnCancel) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnAccept {
    my ($self, $event) = @_;
    # wxGlade: App::Music::ChordPro::Wx::PreferencesDialog_wxg::OnAccept <event_handler>
    warn "Event handler (OnAccept) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class App::Music::ChordPro::Wx::PreferencesDialog_wxg

1;

