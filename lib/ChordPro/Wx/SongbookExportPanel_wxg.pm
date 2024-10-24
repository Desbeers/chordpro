# generated by wxGlade 1.1.0b1 on Thu Oct 24 16:41:05 2024
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
use Wx::ArtProvider qw/:artid :clientid/;
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::SongbookExportPanel_wxg;

use Wx qw[:everything];
use base qw(Wx::Panel);
use strict;

use Wx::Locale gettext => '_T';
# begin wxGlade: dependencies
use Wx::ArtProvider qw/:artid :clientid/;
# end wxGlade

sub new {
    my( $self, $parent, $id, $pos, $size, $style, $name ) = @_;
    $parent //= undef;
    $id     //= -1;
    $pos    //= wxDefaultPosition;
    $size   //= wxDefaultSize;
    $name   //= "";

    # begin wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::new
    use ChordPro::Wx::Utils;
    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );
    
    $self->{sz_outer} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_toolbar} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_outer}->Add($self->{sz_toolbar}, 0, wxBOTTOM|wxEXPAND, 3);
    
    $self->{l_status} = Wx::StaticText->new($self, wxID_ANY, _T("Songbook"));
    $self->{sz_toolbar}->Add($self->{l_status}, 0, wxALIGN_CENTER_VERTICAL, 0);
    
    $self->{sz_toolbar}->Add(1, 1, 1, wxEXPAND, 0);
    
    $self->{bmb_preferences} = Wx::BitmapButton->new($self, wxID_ANY, Wx::ArtProvider::GetBitmap(wxART_EXECUTABLE_FILE, wxART_TOOLBAR, wxDefaultSize));
    $self->{bmb_preferences}->SetToolTip(_T("Preferences"));
    $self->{bmb_preferences}->SetSize($self->{bmb_preferences}->GetBestSize());
    $self->{sz_toolbar}->Add($self->{bmb_preferences}, 0, wxRIGHT, 4);
    
    $self->{bmb_preview} = Wx::BitmapButton->new($self, wxID_ANY, Wx::ArtProvider::GetBitmap(wxART_PRINT, wxART_TOOLBAR, wxDefaultSize));
    $self->{bmb_preview}->SetToolTip(_T("Generate and show preview"));
    $self->{bmb_preview}->SetSize($self->{bmb_preview}->GetBestSize());
    $self->{sz_toolbar}->Add($self->{bmb_preview}, 0, wxRIGHT, 4);
    
    $self->{bmb_messages} = Wx::BitmapButton->new($self, wxID_ANY, Wx::ArtProvider::GetBitmap(wxART_LIST_VIEW, wxART_TOOLBAR, wxDefaultSize));
    $self->{bmb_messages}->SetToolTip(_T("Show messages"));
    $self->{bmb_messages}->SetSize($self->{bmb_messages}->GetBestSize());
    $self->{sz_toolbar}->Add($self->{bmb_messages}, 0, 0, 0);
    
    $self->{sw_tb} = Wx::SplitterWindow->new($self, wxID_ANY);
    $self->{sw_tb}->SetMinimumPaneSize(20);
    $self->{sz_outer}->Add($self->{sw_tb}, 1, wxEXPAND, 0);
    
    $self->{p_top} = Wx::Panel->new($self->{sw_tb}, wxID_ANY);
    
    $self->{sz_ep} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sw_lr} = Wx::SplitterWindow->new($self->{p_top}, wxID_ANY);
    $self->{sw_lr}->SetMinimumPaneSize(20);
    $self->{sw_lr}->SetSashGravity(0.5);
    $self->{sz_ep}->Add($self->{sw_lr}, 0, wxEXPAND, 0);
    
    $self->{p_left} = Wx::Panel->new($self->{sw_lr}, wxID_ANY);
    
    $self->{sz_left} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sz_export_inner} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_left}->Add($self->{sz_export_inner}, 1, wxEXPAND, 0);
    
    $self->{sz_sbexp} = Wx::FlexGridSizer->new(8, 2, 5, 5);
    $self->{sz_export_inner}->Add($self->{sz_sbexp}, 0, wxEXPAND, 5);
    
    $self->{label_1} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Folder"));
    $self->{sz_sbexp}->Add($self->{label_1}, 0, wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{dp_folder} = Wx::DirPickerCtrl->new($self->{p_left}, wxID_ANY, "", _T("Select folder"), wxDefaultPosition, wxDefaultSize, wxDIRP_USE_TEXTCTRL);
    $self->{sz_sbexp}->Add($self->{dp_folder}, 0, wxEXPAND, 0);
    
    $self->{sz_sbexp}->Add(1, 1, 0, 0, 0);
    
    $self->{sizer_2} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_sbexp}->Add($self->{sizer_2}, 1, wxEXPAND, 0);
    
    $self->{l_info} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Select a folder with ChordPro songs"));
    $self->{sizer_2}->Add($self->{l_info}, 1, wxALIGN_CENTER_VERTICAL, 0);
    
    $self->{cb_recursive} = Wx::CheckBox->new($self->{p_left}, wxID_ANY, _T("Recursive"));
    $self->{cb_recursive}->Enable(0);
    $self->{sizer_2}->Add($self->{cb_recursive}, 0, wxEXPAND, 0);
    
    $self->{cb_filelist} = Wx::CheckBox->new($self->{p_left}, wxID_ANY, _T("Ignore filelist.txt"));
    $self->{cb_filelist}->Enable(0);
    $self->{sizer_2}->Add($self->{cb_filelist}, 0, wxEXPAND|wxLEFT, 10);
    
    $self->{sz_sbexp}->Add(1, 1, 0, 0, 0);
    
    $self->{sz_sbexp}->Add(1, 1, 0, 0, 0);
    
    my $static_line_2 = Wx::StaticLine->new($self->{p_left}, wxID_ANY);
    $self->{sz_sbexp}->Add($static_line_2, 0, 0, 0);
    
    my $static_line_3 = Wx::StaticLine->new($self->{p_left}, wxID_ANY);
    $self->{sz_sbexp}->Add($static_line_3, 0, 0, 0);
    
    $self->{l_cover} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Cover"));
    $self->{sz_sbexp}->Add($self->{l_cover}, 0, wxALIGN_CENTER_VERTICAL, 0);
    
    $self->{fp_cover} = Wx::FilePickerCtrl->new($self->{p_left}, wxID_ANY, "", _T("Select PDF cover document"), _T("PDF files (*.pdf)|*.pdf"), wxDefaultPosition, wxDefaultSize, wxFLP_FILE_MUST_EXIST|wxFLP_OPEN|wxFLP_USE_TEXTCTRL);
    $self->{fp_cover}->SetToolTip(_T("Select a PDF document to be prepended as cover page."));
    $self->{sz_sbexp}->Add($self->{fp_cover}, 0, wxEXPAND, 0);
    
    my $label_3 = Wx::StaticText->new($self->{p_left}, wxID_ANY, "");
    $self->{sz_sbexp}->Add($label_3, 0, 0, 0);
    
    $self->{cb_stdcover} = Wx::CheckBox->new($self->{p_left}, wxID_ANY, _T("Add a standard cover page"));
    $self->{cb_stdcover}->SetToolTip(_T("Add a standard cover page to the output."));
    $self->{sz_sbexp}->Add($self->{cb_stdcover}, 0, wxEXPAND, 0);
    
    $self->{l_exporttitle} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Title"));
    $self->{l_exporttitle}->Enable(0);
    $self->{sz_sbexp}->Add($self->{l_exporttitle}, 0, wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{t_exporttitle} = Wx::TextCtrl->new($self->{p_left}, wxID_ANY, "");
    $self->{t_exporttitle}->SetToolTip(_T("Specify the title for the songbook."));
    $self->{t_exporttitle}->Enable(0);
    $self->{sz_sbexp}->Add($self->{t_exporttitle}, 0, wxEXPAND, 5);
    
    $self->{l_exportstitle} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Subtitle"));
    $self->{l_exportstitle}->Enable(0);
    $self->{sz_sbexp}->Add($self->{l_exportstitle}, 0, wxALIGN_CENTER_VERTICAL, 5);
    
    $self->{t_exportstitle} = Wx::TextCtrl->new($self->{p_left}, wxID_ANY, "");
    $self->{t_exportstitle}->SetToolTip(_T("Specify the title for the songbook."));
    $self->{t_exportstitle}->Enable(0);
    $self->{sz_sbexp}->Add($self->{t_exportstitle}, 0, wxEXPAND, 5);
    
    use ChordPro::Utils qw(is_msw);
    $self->{sl_rearrange} = Wx::StaticLine->new($self->{p_left}, wxID_ANY);
    $self->{sl_rearrange}->Show(0) unless is_msw();
    $self->{sz_left}->Add($self->{sl_rearrange}, 0, wxBOTTOM|wxEXPAND|wxRESERVE_SPACE_EVEN_IF_HIDDEN|wxTOP, 5);
    
    $self->{l_rearrange} = Wx::StaticText->new($self->{p_left}, wxID_ANY, _T("Rearrange file list"));
    $self->{l_rearrange}->Show(0) unless is_msw();
    $self->{sz_left}->Add($self->{l_rearrange}, 0, wxEXPAND|wxRESERVE_SPACE_EVEN_IF_HIDDEN, 0);
    
    $self->{w_rearrange} = Wx::RearrangeCtrl->new($self->{p_left}, wxID_ANY, wxDefaultPosition, wxDefaultSize, [-1], ['Select and rearrange items']);
    $self->{w_rearrange}->Show(0) unless is_msw();
    $self->{sz_left}->Add($self->{w_rearrange}, 999, wxEXPAND|wxRESERVE_SPACE_EVEN_IF_HIDDEN, 0);
    
    $self->{p_right} = Wx::Panel->new($self->{sw_lr}, wxID_ANY);
    
    $self->{sz_preview} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{webview} = Wx::TextCtrl->new($self->{p_right}, wxID_ANY, _T("Preview not available"), wxDefaultPosition, wxDefaultSize, wxTE_READONLY);
    $self->{sz_preview}->Add($self->{webview}, 1, wxEXPAND, 0);
    
    $self->{p_bottom} = Wx::Panel->new($self->{sw_tb}, wxID_ANY);
    
    $self->{sz_messages} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{t_messages} = Wx::TextCtrl->new($self->{p_bottom}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY);
    $self->{sz_messages}->Add($self->{t_messages}, 1, wxEXPAND, 0);
    
    $self->{p_bottom}->SetSizer($self->{sz_messages});
    
    $self->{p_right}->SetSizer($self->{sz_preview});
    
    $self->{sz_sbexp}->AddGrowableCol(1);
    
    $self->{p_left}->SetSizer($self->{sz_left});
    
    $self->{sw_lr}->SplitVertically($self->{p_left}, $self->{p_right}, , 620);
    
    $self->{p_top}->SetSizer($self->{sz_ep});
    
    $self->{sw_tb}->SplitHorizontally($self->{p_top}, $self->{p_bottom}, );
    
    $self->SetSizer($self->{sz_outer});
    $self->{sz_outer}->Fit($self);
    
    $self->Layout();
    Wx::Event::EVT_BUTTON($self, $self->{bmb_preferences}->GetId, $self->can('OnPreferences'));
    Wx::Event::EVT_BUTTON($self, $self->{bmb_preview}->GetId, $self->can('OnShowPreview'));
    Wx::Event::EVT_BUTTON($self, $self->{bmb_messages}->GetId, $self->can('OnShowMessages'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_recursive}->GetId, $self->can('OnRecursive'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_filelist}->GetId, $self->can('OnFilelistIgnore'));
    Wx::Event::EVT_CHECKBOX($self, $self->{cb_stdcover}->GetId, $self->can('OnStdCoverChecked'));

    # end wxGlade
    return $self;

}


sub OnPreferences {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnPreferences <event_handler>
    warn "Event handler (OnPreferences) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnShowPreview {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnShowPreview <event_handler>
    warn "Event handler (OnShowPreview) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnShowMessages {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnShowMessages <event_handler>
    warn "Event handler (OnShowMessages) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnRecursive {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnRecursive <event_handler>
    warn "Event handler (OnRecursive) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnFilelistIgnore {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnFilelistIgnore <event_handler>
    warn "Event handler (OnFilelistIgnore) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnStdCoverChecked {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::SongbookExportPanel_wxg::OnStdCoverChecked <event_handler>
    warn "Event handler (OnStdCoverChecked) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::SongbookExportPanel_wxg

1;

