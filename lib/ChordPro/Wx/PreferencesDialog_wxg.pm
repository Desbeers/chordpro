# generated by wxGlade 1.1.0b1 on Mon Oct 21 10:22:14 2024
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::PreferencesDialog_wxg;

use Wx qw[:everything];
use base qw(Wx::Dialog);
use strict;

use Wx::Locale gettext => '_T';
sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent //= undef;
    $id     //= -1;
    $title  //= "";
    $pos    //= wxDefaultPosition;
    $size   //= wxDefaultSize;
    $name   //= "";

    # begin wxGlade: ChordPro::Wx::PreferencesDialog_wxg::new
    $style = wxDEFAULT_DIALOG_STYLE|wxMAXIMIZE_BOX|wxRESIZE_BORDER
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->SetSize($self->ConvertDialogSizeToPixels(Wx::Size->new(264, 240)));
    $self->SetTitle(_T("Preferences"));
    
    $self->{sz_prefs_outer} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_prefs_inner} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_prefs_outer}->Add($self->{sz_prefs_inner}, 1, wxALL|wxEXPAND, 10);
    
    $self->{sizer_2} = Wx::GridBagSizer->new(5, 5);
    $self->{sz_prefs_inner}->Add($self->{sizer_2}, 1, wxEXPAND|wxTOP, 5);
    
    $self->{cb_skipstdcfg} = Wx::CheckBox->new($self, wxID_ANY, _T("Ignore default (system, user, song) configs"));
    $self->{cb_skipstdcfg}->SetToolTipString(_T("Ignore system, user and song configs, if any."));
    $self->{cb_skipstdcfg}->SetValue(1);
    $self->{sizer_2}->Add($self->{cb_skipstdcfg}, Wx::GBPosition->new(0, 0), Wx::GBSpan->new(1, 2), wxALIGN_CENTER_VERTICAL|wxEXPAND, 5);
    
    $self->{cb_presets} = Wx::CheckBox->new($self, wxID_ANY, _T("Presets"));
    $self->{cb_presets}->SetToolTipString(_T("Enable/disable the presets from the list."));
    $self->{sizer_2}->Add($self->{cb_presets}, Wx::GBPosition->new(1, 0), Wx::GBSpan->new(1, 1), 0, 5);
    
    $self->{ch_presets} = Wx::CheckListBox->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Default")], wxLB_EXTENDED|wxLB_NEEDED_SB);
    $self->{ch_presets}->SetMinSize($self->{ch_presets}->ConvertDialogSizeToPixels(Wx::Size->new(130, 39)));
    $self->{ch_presets}->SetToolTipString(_T("Select config presets"));
    $self->{ch_presets}->Enable(0);
    $self->{ch_presets}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_presets}, Wx::GBPosition->new(1, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    $self->{cb_configfile} = Wx::CheckBox->new($self, wxID_ANY, _T("Custom config"));
    $self->{sizer_2}->Add($self->{cb_configfile}, Wx::GBPosition->new(2, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{fp_customconfig} = Wx::FilePickerCtrl->new($self, wxID_ANY, "", _T("Choose config file"), _T("Config files (*.prp,*.json)|*.prp;*.json"), wxDefaultPosition, wxDefaultSize, wxFLP_OPEN|wxFLP_USE_TEXTCTRL);
    $self->{sizer_2}->Add($self->{fp_customconfig}, Wx::GBPosition->new(2, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    $self->{cb_customlib} = Wx::CheckBox->new($self, wxID_ANY, _T("Custom library"));
    $self->{cb_customlib}->SetToolTipString(_T("Use a custom library with configs, images, templates, fonts, \N{U+2026}"));
    $self->{sizer_2}->Add($self->{cb_customlib}, Wx::GBPosition->new(3, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{dp_customlibrary} = Wx::DirPickerCtrl->new($self, wxID_ANY, "", _T("Choose custom library"), wxDefaultPosition, wxDefaultSize, wxDIRP_DIR_MUST_EXIST|wxDIRP_USE_TEXTCTRL);
    $self->{sizer_2}->Add($self->{dp_customlibrary}, Wx::GBPosition->new(3, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    $self->{cb_tmplfile} = Wx::CheckBox->new($self, wxID_ANY, _T("Template for new songs"));
    $self->{cb_tmplfile}->SetToolTipString(_T("Use a template for new songs."));
    $self->{sizer_2}->Add($self->{cb_tmplfile}, Wx::GBPosition->new(4, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL|wxEXPAND, 5);
    
    $self->{fp_tmplfile} = Wx::FilePickerCtrl->new($self, wxID_ANY, "", _T("Choose template for new songs"), _T("ChordPro files (*.cho,*.crd,*.chopro,*.chord,*.chordpro,*.pro)|*.cho;*.crd;*.chopro;*.chord;*.chordpro;*.pro;*.txt"), wxDefaultPosition, wxDefaultSize, wxFLP_FILE_MUST_EXIST|wxFLP_OPEN|wxFLP_USE_TEXTCTRL);
    $self->{fp_tmplfile}->SetMinSize($self->{fp_tmplfile}->ConvertDialogSizeToPixels(Wx::Size->new(132, 14)));
    $self->{sizer_2}->Add($self->{fp_tmplfile}, Wx::GBPosition->new(4, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    my $static_line_5 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_5, Wx::GBPosition->new(5, 0), Wx::GBSpan->new(1, 2), wxEXPAND, 0);
    
    $self->{l_notation} = Wx::StaticText->new($self, wxID_ANY, _T("Notation"));
    $self->{sizer_2}->Add($self->{l_notation}, Wx::GBPosition->new(6, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{ch_notation} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Common (C, D, E, F, G, A, B)"), _T("German (C, D, E, F, G, A, H)"), _T("Latin (Do, Re, Mi, Fa, Sol, ...)"), _T("Solf\N{U+00e8}ge (Do, Re, Mi, Fa, So, ...)"), _T("Nashville (0, 1, 2, ...)"), _T("Roman (I, II, III, ...)")], );
    $self->{ch_notation}->SetToolTipString(_T("Select the notation system for the song"));
    $self->{ch_notation}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_notation}, Wx::GBPosition->new(6, 1), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL|wxEXPAND, 5);
    
    $self->{l_xpose} = Wx::StaticText->new($self, wxID_ANY, _T("Transpose"));
    $self->{sizer_2}->Add($self->{l_xpose}, Wx::GBPosition->new(7, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{sz_xpose} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sz_xpose}, Wx::GBPosition->new(7, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    $self->{l_xpose_from} = Wx::StaticText->new($self, wxID_ANY, _T("From"));
    $self->{sz_xpose}->Add($self->{l_xpose_from}, 0, wxALIGN_CENTER_VERTICAL|wxRIGHT, 5);
    
    $self->{ch_xpose_from} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_from}->SetToolTipString(_T("Starting note for transposition"));
    $self->{ch_xpose_from}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_from}, 0, 0, 0);
    
    $self->{l_xpose_to} = Wx::StaticText->new($self, wxID_ANY, _T("To"));
    $self->{sz_xpose}->Add($self->{l_xpose_to}, 0, wxALIGN_CENTER_VERTICAL|wxFIXED_MINSIZE|wxLEFT|wxRIGHT, 5);
    
    $self->{ch_xpose_to} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("C"), _T("C#"), _T("Db"), _T("D"), _T("D#"), _T("Eb"), _T("E"), _T("F"), _T("F#"), _T("Gb"), _T("G"), _T("G#"), _T("Ab"), _T("A"), _T("A#"), _T("Bb"), _T("B")], );
    $self->{ch_xpose_to}->SetToolTipString(_T("Destination note for transposition"));
    $self->{ch_xpose_to}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_xpose_to}, 0, 0, 0);
    
    $self->{sz_xpose}->Add(2, 2, 1, wxEXPAND, 0);
    
    my $l_acc = Wx::StaticText->new($self, wxID_ANY, _T("Acc."));
    $self->{sz_xpose}->Add($l_acc, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 15);
    
    $self->{ch_acc} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Default"), _T("Sharps"), _T("Flats")], );
    $self->{ch_acc}->SetToolTipString(_T("How to treat chords that need accidentals after transposition.\nDefault is to use sharps when transposing up, and flats when transposing down."));
    $self->{ch_acc}->SetSelection(0);
    $self->{sz_xpose}->Add($self->{ch_acc}, 0, wxEXPAND, 0);
    
    $self->{l_transcode} = Wx::StaticText->new($self, wxID_ANY, _T("Transcode to"));
    $self->{sizer_2}->Add($self->{l_transcode}, Wx::GBPosition->new(8, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{ch_transcode} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("-----"), _T("Common (C, D, E, F, G, A, B)"), _T("German (C, D, E, F, G, A, H)"), _T("Latin (Do, Re, Mi, Fa, Sol, ...)"), _T("Solf\N{U+00e8}ge (Do, Re, Mi, Fa, So, ...)"), _T("Nashville (0, 1, 2, ...)"), _T("Roman (I, II, III, ...)")], );
    $self->{ch_transcode}->SetToolTipString(_T("Select a notation system to transcode the song to"));
    $self->{ch_transcode}->SetSelection(0);
    $self->{sizer_2}->Add($self->{ch_transcode}, Wx::GBPosition->new(8, 1), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL|wxEXPAND, 5);
    
    my $static_line_3 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_3, Wx::GBPosition->new(9, 0), Wx::GBSpan->new(1, 2), wxEXPAND, 0);
    
    my $l_edit = Wx::StaticText->new($self, wxID_ANY, _T("Editor"));
    $self->{sizer_2}->Add($l_edit, Wx::GBPosition->new(10, 0), Wx::GBSpan->new(1, 1), wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_3}, Wx::GBPosition->new(10, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 0);
    
    $self->{ch_editfont} = Wx::Choice->new($self, wxID_ANY, wxDefaultPosition, wxDefaultSize, [_T("Monospaced"), _T("Serif"), _T("Sans Serif")], );
    $self->{ch_editfont}->SetToolTipString(_T("Font to use in the editor."));
    $self->{ch_editfont}->SetSelection(0);
    $self->{sizer_3}->Add($self->{ch_editfont}, 1, wxEXPAND, 0);
    
    $self->{sp_editfont} = Wx::SpinCtrl->new($self, wxID_ANY, "14", wxDefaultPosition, wxDefaultSize, wxSP_ARROW_KEYS, 4, 40, 14);
    $self->{sp_editfont}->SetToolTipString(_T("Size of the editor font."));
    $self->{sizer_3}->Add($self->{sp_editfont}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 5);
    
    $self->{cp_editor} = Wx::ColourPickerCtrl->new($self, wxID_ANY, wxWHITE);
    $self->{cp_editor}->SetMinSize($self->{cp_editor}->ConvertDialogSizeToPixels(Wx::Size->new(15, -1)));
    $self->{cp_editor}->SetToolTipString(_T("Background colour."));
    $self->{sizer_3}->Add($self->{cp_editor}, 0, wxEXPAND|wxLEFT, 5);
    
    $self->{cb_pdfviewer} = Wx::CheckBox->new($self, wxID_ANY, _T("PDF Viewer"));
    $self->{cb_pdfviewer}->SetToolTipString(_T("Use an external program instead of the built-in PDF viewer"));
    $self->{sizer_2}->Add($self->{cb_pdfviewer}, Wx::GBPosition->new(11, 0), Wx::GBSpan->new(1, 1), 0, 0);
    
    $self->{t_pdfviewer} = Wx::TextCtrl->new($self, wxID_ANY, "");
    $self->{t_pdfviewer}->SetToolTipString(_T("Alternative PDF viewer.\n  %f will be replaced by the file name\n  %u will be replaced by the file URL\nLeave empty to use the system default viewer."));
    $self->{sizer_2}->Add($self->{t_pdfviewer}, Wx::GBPosition->new(11, 1), Wx::GBSpan->new(1, 1), wxEXPAND, 5);
    
    $self->{sz_prefs_inner}->Add(1, 1, 1, wxEXPAND, 0);
    
    my $static_line_1 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sz_prefs_inner}->Add($static_line_1, 0, wxEXPAND|wxTOP, 5);
    
    $self->{sz_prefs_buttons} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_prefs_inner}->Add($self->{sz_prefs_buttons}, 0, wxEXPAND|wxTOP, 5);
    
    $self->{sz_prefs_buttons}->Add(5, 1, 1, wxEXPAND, 0);
    
    $self->{b_prefs_cancel} = Wx::Button->new($self, wxID_CANCEL, "");
    $self->{sz_prefs_buttons}->Add($self->{b_prefs_cancel}, 0, 0, 0);
    
    $self->{b_prefs_ok} = Wx::Button->new($self, wxID_OK, "");
    $self->{b_prefs_ok}->SetDefault();
    $self->{sz_prefs_buttons}->Add($self->{b_prefs_ok}, 0, wxLEFT, 5);
    
    $self->{sizer_2}->AddGrowableRow(1);
    $self->{sizer_2}->AddGrowableCol(1);
    
    $self->SetSizer($self->{sz_prefs_outer});
    
    $self->Layout();
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_skipstdcfg}->GetId, $self->can('OnSkipStdCfg'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_presets}->GetId, $self->can('OnPresets'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_configfile}->GetId, $self->can('OnConfigFile'));
    Wx::Event::EVT_FILEPICKER_CHANGED($self, $self->{fp_customconfig}->GetId, $self->can('OnCustomConfigChanged'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_customlib}->GetId, $self->can('OnCustomLib'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_tmplfile}->GetId, $self->can('OnTmplFile'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_notation}->GetId, $self->can('OnChNotation'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_from}->GetId, $self->can('OnXposeFrom'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_xpose_to}->GetId, $self->can('OnXposeTo'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_transcode}->GetId, $self->can('OnChTranscode'));
    Wx::Event::EVT_CHOICE($self, $self->{ch_editfont}->GetId, $self->can('OnChEditFont'));
    Wx::Event::EVT_SPINCTRL($self, $self->{sp_editfont}->GetId, $self->can('OnSpEditFont'));
    Wx::Event::EVT_COLOURPICKER_CHANGED($self, $self->{cp_editor}->GetId, $self->can('OnChEditColour'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_pdfviewer}->GetId, $self->can('OnPDFViewer'));
    Wx::Event::EVT_BUTTON($self, $self->{b_prefs_cancel}->GetId, $self->can('OnCancel'));
    Wx::Event::EVT_BUTTON($self, $self->{b_prefs_ok}->GetId, $self->can('OnAccept'));

    # end wxGlade
    return $self;

}


sub OnSkipStdCfg {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnSkipStdCfg <event_handler>
    warn "Event handler (OnSkipStdCfg) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPresets {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnPresets <event_handler>
    warn "Event handler (OnPresets) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnConfigFile {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnConfigFile <event_handler>
    warn "Event handler (OnConfigFile) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCustomConfigChanged {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnCustomConfigChanged <event_handler>
    warn "Event handler (OnCustomConfigChanged) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCustomLib {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnCustomLib <event_handler>
    warn "Event handler (OnCustomLib) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnTmplFile {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnTmplFile <event_handler>
    warn "Event handler (OnTmplFile) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChNotation {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnChNotation <event_handler>
    warn "Event handler (OnChNotation) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeFrom {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnXposeFrom <event_handler>
    warn "Event handler (OnXposeFrom) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnXposeTo {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnXposeTo <event_handler>
    warn "Event handler (OnXposeTo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChTranscode {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnChTranscode <event_handler>
    warn "Event handler (OnChTranscode) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChEditFont {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnChEditFont <event_handler>
    warn "Event handler (OnChEditFont) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnSpEditFont {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnSpEditFont <event_handler>
    warn "Event handler (OnSpEditFont) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnChEditColour {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnChEditColour <event_handler>
    warn "Event handler (OnChEditColour) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPDFViewer {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnPDFViewer <event_handler>
    warn "Event handler (OnPDFViewer) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCancel {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnCancel <event_handler>
    warn "Event handler (OnCancel) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnAccept {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::PreferencesDialog_wxg::OnAccept <event_handler>
    warn "Event handler (OnAccept) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::PreferencesDialog_wxg

1;

