# generated by wxGlade 1.1.0b1 on Fri Sep  6 08:22:52 2024
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;
# begin wxGlade: dependencies
use Wx::Locale gettext => '_T';
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::Main_wxg;

use Wx qw[:everything];
use base qw(Wx::Frame);
use strict;

# begin wxGlade: dependencies
use Wx::Locale gettext => '_T';
# end wxGlade

sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: ChordPro::Wx::Main_wxg::new
    $style = wxDEFAULT_FRAME_STYLE
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->SetSize($self->ConvertDialogSizeToPixels(Wx::Size->new(401, 311)));
    $self->SetTitle(_T("ChordPro"));
    $self->SetBackgroundColour(Wx::Colour->new(248, 207, 199));
    
    

    # Menu Bar

    $self->{main_menubar} = Wx::MenuBar->new();
    use constant wxID_EXPORT_FOLDER => Wx::NewId();
    use constant wxID_PREVIEW_DEFAULT => Wx::NewId();
    use constant wxID_PREVIEW_NOCHORDS => Wx::NewId();
    use constant wxID_PREVIEW_LYRICSONLY => Wx::NewId();
    use constant wxID_PREVIEW_MORE => Wx::NewId();
    use constant wxID_HELP_ChordPro => Wx::NewId();
    use constant wxID_HELP_Config => Wx::NewId();
    use constant wxID_HELP_EXAMPLE => Wx::NewId();
    use constant wxID_W_MSG => Wx::NewId();
    use constant wxID_HELP_DEBUGINFO => Wx::NewId();
    my $wxglade_tmp_menu;
    $wxglade_tmp_menu = Wx::Menu->new();
    $wxglade_tmp_menu->Append(wxID_NEW, _T("New"), _T("Create a new ChordPro document"));
    $wxglade_tmp_menu->Append(wxID_OPEN, _T("Open...\tCtrl-O"), _T("Open an existing ChordPro file"));
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_PREVIEW, _T("Preview\tCtrl-P"), _T("Format and preview"));
    $wxglade_tmp_menu->Append(wxID_SAVE, _T("Save...\tCtrl-S"), _T("Save the current ChordPro file"));
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_EXIT, _T("Exit"), _T("Close window and exit"));
    $self->{main_menubar}->Append($wxglade_tmp_menu, _T("File"));
    $wxglade_tmp_menu = Wx::Menu->new();
    $wxglade_tmp_menu->Append(wxID_UNDO, _T("Undo"), "");
    $wxglade_tmp_menu->Append(wxID_REDO, _T("Redo"), "");
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_CUT, _T("Cut"), "");
    $wxglade_tmp_menu->Append(wxID_COPY, _T("Copy"), "");
    $wxglade_tmp_menu->Append(wxID_PASTE, _T("Paste"), "");
    $wxglade_tmp_menu->Append(wxID_DELETE, _T("Delete"), "");
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_PREFERENCES, _T("Preferences...\tCtrl-R"), _T("Preferences"));
    $self->{main_menubar}->Append($wxglade_tmp_menu, _T("Edit"));
    $wxglade_tmp_menu = Wx::Menu->new();
    $wxglade_tmp_menu->Append(wxID_EXPORT_FOLDER, _T("Export Folder\N{U+2026}"), _T("Create a songook from all ChordPro files in a folder."));
    $self->{main_menubar}->Append($wxglade_tmp_menu, _T("Songbook"));
    $wxglade_tmp_menu = Wx::Menu->new();
    $wxglade_tmp_menu->Append(wxID_PREVIEW_DEFAULT, _T("Default preview"), _T("Preview with default formatting"));
    $wxglade_tmp_menu->Append(wxID_PREVIEW_NOCHORDS, _T("No chord diagrams"), _T("Preview without chord diagrams"));
    $wxglade_tmp_menu->Append(wxID_PREVIEW_LYRICSONLY, _T("Lyrics only"), _T("Preview just the lyrics"));
    $wxglade_tmp_menu->Append(wxID_PREVIEW_MORE, _T("More..."), _T("Transpose, transcode, and more"));
    $self->{main_menubar}->Append($wxglade_tmp_menu, _T("Tasks"));
    $wxglade_tmp_menu = Wx::Menu->new();
    $wxglade_tmp_menu->Append(wxID_HELP_ChordPro, _T("ChordPro file format"), _T("Help about the ChordPro file format"));
    $wxglade_tmp_menu->Append(wxID_HELP_Config, _T("ChordPro config files"), _T("Help about the config files"));
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_HELP_EXAMPLE, _T("Insert song example"), _T("Insert an example song into the editor window"));
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_W_MSG, _T("Show Messages window"), _T("Show the messages window."));
    $wxglade_tmp_menu->Append(wxID_HELP_DEBUGINFO, _T("Enable debug info in PDF"), _T("Add sources and configs to the PDF for debugging"), 1);
    $wxglade_tmp_menu->AppendSeparator();
    $wxglade_tmp_menu->Append(wxID_ABOUT, _T("About"), _T("About WxChordPro"));
    $self->{main_menubar}->Append($wxglade_tmp_menu, _T("Help"));
    $self->SetMenuBar($self->{main_menubar});
    
    # Menu Bar end

    
    $self->{f_main_statusbar} = $self->CreateStatusBar(1);
    $self->{f_main_statusbar}->SetStatusWidths(-1);
    
    
    $self->{sz_outer} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_main} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_outer}->Add($self->{sz_main}, 1, wxALL|wxEXPAND, 5);
    
    $self->{p_init} = Wx::Panel->new($self, wxID_ANY);
    $self->{p_init}->SetBackgroundColour(Wx::Colour->new(248, 207, 199));
    $self->{sz_main}->Add($self->{p_init}, 1, wxEXPAND, 0);
    
    $self->{sz_init} = Wx::BoxSizer->new(wxHORIZONTAL);
    
    my $bm_init = Wx::StaticBitmap->new($self->{p_init}, wxID_ANY, Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-icon-small.png", wxBITMAP_TYPE_ANY));
    $self->{sz_init}->Add($bm_init, 0, 0, 0);
    
    $self->{sizer_2} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_init}->Add($self->{sizer_2}, 1, wxEXPAND|wxLEFT, 20);
    
    $self->{l_init} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Welcome to ChordPro!"));
    $self->{l_init}->SetFont(Wx::Font->new(20, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, 0, ""));
    $self->{l_init}->Wrap(1);
    $self->{sizer_2}->Add($self->{l_init}, 0, wxBOTTOM|wxTOP, 40);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_3}, 0, wxEXPAND, 0);
    
    $self->{b_initnew} = Wx::Button->new($self->{p_init}, wxID_ANY, "");
    $self->{b_initnew}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/document-new.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_3}->Add($self->{b_initnew}, 0, wxEXPAND, 0);
    
    $self->{l_initnew} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Create a new song"));
    $self->{sizer_3}->Add($self->{l_initnew}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_4} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_4}, 0, wxEXPAND, 0);
    
    $self->{b_initopen} = Wx::Button->new($self->{p_init}, wxID_ANY, "");
    $self->{b_initopen}->SetFocus();
    $self->{b_initopen}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/document-open.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_4}->Add($self->{b_initopen}, 0, wxEXPAND, 0);
    
    $self->{l_initopen} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Open an existing song"));
    $self->{sizer_4}->Add($self->{l_initopen}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sizer_6} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_6}, 0, wxEXPAND, 0);
    
    $self->{b_initwww} = Wx::Button->new($self->{p_init}, wxID_ANY, "");
    $self->{b_initwww}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-web.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_6}->Add($self->{b_initwww}, 0, wxEXPAND, 0);
    
    $self->{l_initwww} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Visit the ChordPro site"));
    $self->{sizer_6}->Add($self->{l_initwww}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_7} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_7}, 0, wxEXPAND, 0);
    
    $self->{b_initdocs} = Wx::Button->new($self->{p_init}, wxID_ANY, "");
    $self->{b_initdocs}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-web.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_7}->Add($self->{b_initdocs}, 0, wxEXPAND, 0);
    
    $self->{l_initdocs} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Read the documentation"));
    $self->{sizer_7}->Add($self->{l_initdocs}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sizer_5} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_5}, 0, wxEXPAND, 0);
    
    $self->{b_initcancel} = Wx::Button->new($self->{p_init}, wxID_ANY, "");
    $self->{b_initcancel}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/cancel.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_5}->Add($self->{b_initcancel}, 0, wxEXPAND, 0);
    
    $self->{l_initcancel} = Wx::StaticText->new($self->{p_init}, wxID_ANY, _T("Cancel"));
    $self->{sizer_5}->Add($self->{l_initcancel}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{p_edit} = Wx::Panel->new($self, wxID_ANY);
    $self->{p_edit}->Show(0);
    $self->{sz_main}->Add($self->{p_edit}, 1, wxEXPAND, 0);
    
    $self->{sz_source} = Wx::StaticBoxSizer->new(Wx::StaticBox->new($self->{p_edit}, wxID_ANY, ""), wxHORIZONTAL);
    
    $self->{t_source} = Wx::TextCtrl->new($self->{sz_source}->GetStaticBox(), wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE);
    $self->{sz_source}->Add($self->{t_source}, 1, wxEXPAND, 0);
    
    $self->{p_msg} = Wx::Panel->new($self, wxID_ANY);
    $self->{p_msg}->Show(0);
    $self->{sz_main}->Add($self->{p_msg}, 1, wxEXPAND, 0);
    
    $self->{sz_msg} = Wx::StaticBoxSizer->new(Wx::StaticBox->new($self->{p_msg}, wxID_ANY, _T("Messages")), wxVERTICAL);
    
    $self->{t_msg} = Wx::TextCtrl->new($self->{sz_msg}->GetStaticBox(), wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY);
    $self->{sz_msg}->Add($self->{t_msg}, 1, wxEXPAND, 0);
    
    $self->{sizer_1} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_msg}->Add($self->{sizer_1}, 0, wxEXPAND|wxTOP, 5);
    
    $self->{sizer_1}->Add(2, 2, 1, 0, 0);
    
    $self->{button_1} = Wx::Button->new($self->{sz_msg}->GetStaticBox(), wxID_SAVE, "");
    $self->{sizer_1}->Add($self->{button_1}, 0, wxRIGHT, 5);
    
    $self->{button_2} = Wx::Button->new($self->{sz_msg}->GetStaticBox(), wxID_CANCEL, "");
    $self->{sizer_1}->Add($self->{button_2}, 0, 0, 0);
    
    $self->{p_msg}->SetSizer($self->{sz_msg});
    
    $self->{p_edit}->SetSizer($self->{sz_source});
    
    $self->{p_init}->SetSizer($self->{sz_init});
    
    $self->SetSizer($self->{sz_outer});
    
    $self->Layout();
    Wx::Event::EVT_MENU($self, wxID_NEW, $self->can('OnNew'));
    Wx::Event::EVT_MENU($self, wxID_OPEN, $self->can('OnOpen'));
    Wx::Event::EVT_MENU($self, wxID_PREVIEW, $self->can('OnPreview'));
    Wx::Event::EVT_MENU($self, wxID_SAVE, $self->can('OnSave'));
    Wx::Event::EVT_MENU($self, wxID_EXIT, $self->can('OnQuit'));
    Wx::Event::EVT_MENU($self, wxID_UNDO, $self->can('OnUndo'));
    Wx::Event::EVT_MENU($self, wxID_REDO, $self->can('OnRedo'));
    Wx::Event::EVT_MENU($self, wxID_CUT, $self->can('OnCut'));
    Wx::Event::EVT_MENU($self, wxID_COPY, $self->can('OnCopy'));
    Wx::Event::EVT_MENU($self, wxID_PASTE, $self->can('OnPaste'));
    Wx::Event::EVT_MENU($self, wxID_DELETE, $self->can('OnDelete'));
    Wx::Event::EVT_MENU($self, wxID_PREFERENCES, $self->can('OnPreferences'));
    Wx::Event::EVT_MENU($self, wxID_EXPORT_FOLDER, $self->can('OnExportFolder'));
    Wx::Event::EVT_MENU($self, wxID_PREVIEW_DEFAULT, $self->can('OnPreview'));
    Wx::Event::EVT_MENU($self, wxID_PREVIEW_NOCHORDS, $self->can('OnPreviewNoChords'));
    Wx::Event::EVT_MENU($self, wxID_PREVIEW_LYRICSONLY, $self->can('OnPreviewLyricsOnly'));
    Wx::Event::EVT_MENU($self, wxID_PREVIEW_MORE, $self->can('OnPreviewMore'));
    Wx::Event::EVT_MENU($self, wxID_HELP_ChordPro, $self->can('OnHelp_ChordPro'));
    Wx::Event::EVT_MENU($self, wxID_HELP_Config, $self->can('OnHelp_Config'));
    Wx::Event::EVT_MENU($self, wxID_HELP_EXAMPLE, $self->can('OnHelp_Example'));
    Wx::Event::EVT_MENU($self, wxID_W_MSG, $self->can('OnHelp_ShowMessages'));
    Wx::Event::EVT_MENU($self, wxID_HELP_DEBUGINFO, $self->can('OnHelp_DebugInfo'));
    Wx::Event::EVT_MENU($self, wxID_ABOUT, $self->can('OnAbout'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initnew}->GetId, $self->can('OnInitialNew'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initopen}->GetId, $self->can('OnInitialOpen'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initwww}->GetId, $self->can('OnInitialSite'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initdocs}->GetId, $self->can('OnInitialDocs'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initcancel}->GetId, $self->can('OnInitialCancel'));
    Wx::Event::EVT_TEXT($self, $self->{t_source}->GetId, $self->can('OnText'));
    Wx::Event::EVT_BUTTON($self, $self->{button_1}->GetId, $self->can('OnMsgSave'));
    Wx::Event::EVT_BUTTON($self, $self->{button_2}->GetId, $self->can('OnMsgCancel'));

    # end wxGlade
    return $self;

}


sub OnNew {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnNew <event_handler>
    warn "Event handler (OnNew) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnOpen {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnOpen <event_handler>
    warn "Event handler (OnOpen) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPreview {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPreview <event_handler>
    warn "Event handler (OnPreview) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnSave {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnSave <event_handler>
    warn "Event handler (OnSave) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnQuit {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnQuit <event_handler>
    warn "Event handler (OnQuit) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnUndo {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnUndo <event_handler>
    warn "Event handler (OnUndo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnRedo {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnRedo <event_handler>
    warn "Event handler (OnRedo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCut {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnCut <event_handler>
    warn "Event handler (OnCut) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnCopy {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnCopy <event_handler>
    warn "Event handler (OnCopy) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPaste {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPaste <event_handler>
    warn "Event handler (OnPaste) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnDelete {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnDelete <event_handler>
    warn "Event handler (OnDelete) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPreferences {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPreferences <event_handler>
    warn "Event handler (OnPreferences) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnExportFolder {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnExportFolder <event_handler>
    warn "Event handler (OnExportFolder) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPreviewNoChords {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPreviewNoChords <event_handler>
    warn "Event handler (OnPreviewNoChords) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPreviewLyricsOnly {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPreviewLyricsOnly <event_handler>
    warn "Event handler (OnPreviewLyricsOnly) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnPreviewMore {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnPreviewMore <event_handler>
    warn "Event handler (OnPreviewMore) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnHelp_ChordPro {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnHelp_ChordPro <event_handler>
    warn "Event handler (OnHelp_ChordPro) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnHelp_Config {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnHelp_Config <event_handler>
    warn "Event handler (OnHelp_Config) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnHelp_Example {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnHelp_Example <event_handler>
    warn "Event handler (OnHelp_Example) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnHelp_ShowMessages {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnHelp_ShowMessages <event_handler>
    warn "Event handler (OnHelp_ShowMessages) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnHelp_DebugInfo {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnHelp_DebugInfo <event_handler>
    warn "Event handler (OnHelp_DebugInfo) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnAbout {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnAbout <event_handler>
    warn "Event handler (OnAbout) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialNew {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnInitialNew <event_handler>
    warn "Event handler (OnInitialNew) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialOpen {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnInitialOpen <event_handler>
    warn "Event handler (OnInitialOpen) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialSite {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnInitialSite <event_handler>
    warn "Event handler (OnInitialSite) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialDocs {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnInitialDocs <event_handler>
    warn "Event handler (OnInitialDocs) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialCancel {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnInitialCancel <event_handler>
    warn "Event handler (OnInitialCancel) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnText {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnText <event_handler>
    warn "Event handler (OnText) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnMsgSave {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnMsgSave <event_handler>
    warn "Event handler (OnMsgSave) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnMsgCancel {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::Main_wxg::OnMsgCancel <event_handler>
    warn "Event handler (OnMsgCancel) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::Main_wxg

1;

