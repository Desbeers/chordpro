# generated by wxGlade 1.1.0b1 on Sat Oct  5 07:45:01 2024
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::InitialPanel_wxg;

use Wx qw[:everything];
use base qw(Wx::Panel);
use strict;

sub new {
    my( $self, $parent, $id, $pos, $size, $style, $name ) = @_;
    $parent //= undef;
    $id     //= -1;
    $pos    //= wxDefaultPosition;
    $size   //= wxDefaultSize;
    $name   //= "";

    # begin wxGlade: ChordPro::Wx::InitialPanel_wxg::new
    $style = wxTAB_TRAVERSAL
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );
    $self->SetSize($self->ConvertDialogSizeToPixels(Wx::Size->new(345, 229)));
    
    $self->{sz_init} = Wx::BoxSizer->new(wxHORIZONTAL);
    
    $self->{sz_init}->Add(20, 1, 1, wxEXPAND, 0);
    
    $self->{sizer_8} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_init}->Add($self->{sizer_8}, 1, wxEXPAND, 0);
    
    $self->{sizer_8}->Add(1, 1, 1, wxEXPAND, 0);
    
    my $bm_init = Wx::StaticBitmap->new($self, wxID_ANY, Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/chordpro-logo-narrow.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_8}->Add($bm_init, 0, wxEXPAND, 0);
    
    $self->{sizer_8}->Add(1, 1, 1, wxEXPAND, 0);
    
    $self->{sizer_2} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_init}->Add($self->{sizer_2}, 0, wxEXPAND|wxLEFT, 20);
    
    $self->{l_init} = Wx::StaticText->new($self, wxID_ANY, "Welcome to ChordPro!");
    $self->{l_init}->SetMinSize($self->{l_init}->ConvertDialogSizeToPixels(Wx::Size->new(132, 12)));
    $self->{l_init}->SetFont(Wx::Font->new(20, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, 0, ""));
    $self->{sizer_2}->Add($self->{l_init}, 0, wxBOTTOM|wxFIXED_MINSIZE|wxTOP, 20);
    
    $self->{sizer_2}->Add(1, 1, 1, wxEXPAND, 0);
    
    $self->{sizer_11} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_11}, 0, wxBOTTOM|wxEXPAND, 5);
    
    $self->{rb_createrecent} = Wx::RadioBox->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, ["Create", "Recent"], 1, wxRA_SPECIFY_ROWS);
    $self->{rb_createrecent}->SetSelection(0);
    $self->{sizer_11}->Add($self->{rb_createrecent}, 1, 0, 0);
    
    $self->{sz_createrecentpanels} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_2}->Add($self->{sz_createrecentpanels}, 1, wxEXPAND, 0);
    
    $self->{p_create} = Wx::Panel->new($self, wxID_ANY);
    $self->{sz_createrecentpanels}->Add($self->{p_create}, 0, 0, 0);
    
    $self->{sizer_1} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_1}->Add($self->{sizer_3}, 0, wxEXPAND, 0);
    
    $self->{b_initnew} = Wx::Button->new($self->{p_create}, wxID_ANY, "");
    $self->{b_initnew}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/document-new32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_3}->Add($self->{b_initnew}, 0, wxEXPAND, 0);
    
    $self->{l_initnew} = Wx::StaticText->new($self->{p_create}, wxID_ANY, "Create a new song");
    $self->{sizer_3}->Add($self->{l_initnew}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_1}->Add(1, 5, 1, wxEXPAND, 0);
    
    $self->{sizer_4} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_1}->Add($self->{sizer_4}, 0, wxEXPAND, 0);
    
    $self->{b_initopen} = Wx::Button->new($self->{p_create}, wxID_ANY, "");
    $self->{b_initopen}->SetFocus();
    $self->{b_initopen}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/document-open32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_4}->Add($self->{b_initopen}, 0, wxEXPAND, 0);
    
    $self->{l_initopen} = Wx::StaticText->new($self->{p_create}, wxID_ANY, "Open an existing song");
    $self->{sizer_4}->Add($self->{l_initopen}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_1}->Add(1, 5, 1, wxEXPAND, 0);
    
    $self->{sizer_9} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_1}->Add($self->{sizer_9}, 0, wxEXPAND, 0);
    
    $self->{b_initsbexp} = Wx::Button->new($self->{p_create}, wxID_ANY, "");
    $self->{b_initsbexp}->SetToolTip("Make a songbook from a folder of ChordPro files.");
    $self->{b_initsbexp}->SetFocus();
    $self->{b_initsbexp}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/document-more32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_9}->Add($self->{b_initsbexp}, 0, wxEXPAND, 0);
    
    $self->{l_initsbexp} = Wx::StaticText->new($self->{p_create}, wxID_ANY, "Make a songbook");
    $self->{l_initsbexp}->Wrap(200);
    $self->{sizer_9}->Add($self->{l_initsbexp}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_1}->Add(1, 5, 1, wxEXPAND, 0);
    
    $self->{sizer_5} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_1}->Add($self->{sizer_5}, 0, wxEXPAND, 0);
    
    $self->{b_initexamople} = Wx::Button->new($self->{p_create}, wxID_ANY, "");
    $self->{b_initexamople}->SetFocus();
    $self->{b_initexamople}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/document-open32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_5}->Add($self->{b_initexamople}, 0, wxEXPAND, 0);
    
    $self->{l_initexample} = Wx::StaticText->new($self->{p_create}, wxID_ANY, "Open an example song");
    $self->{sizer_5}->Add($self->{l_initexample}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{p_recent} = Wx::Panel->new($self, wxID_ANY);
    $self->{p_recent}->Show(0);
    $self->{sz_createrecentpanels}->Add($self->{p_recent}, 1, wxEXPAND, 0);
    
    $self->{sizer_10} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{lb_recent} = Wx::ListBox->new($self->{p_recent}, wxID_ANY, wxDefaultPosition, wxDefaultSize, ["No recent songs"], wxLB_SINGLE);
    $self->{lb_recent}->Enable(0);
    $self->{sizer_10}->Add($self->{lb_recent}, 1, wxEXPAND, 0);
    
    $self->{l_recent} = Wx::StaticText->new($self->{p_recent}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxST_ELLIPSIZE_MIDDLE|wxST_NO_AUTORESIZE);
    $self->{l_recent}->SetToolTip("Full file name will show here.");
    $self->{sizer_10}->Add($self->{l_recent}, 0, wxALL|wxEXPAND, 2);
    
    $self->{sizer_2}->Add(1, 1, 1, wxEXPAND, 0);
    
    my $static_line_1 = Wx::StaticLine->new($self, wxID_ANY);
    $self->{sizer_2}->Add($static_line_1, 0, wxEXPAND, 0);
    
    $self->{sizer_2}->Add(1, 1, 1, wxEXPAND, 0);
    
    $self->{sizer_6} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_6}, 0, wxEXPAND, 0);
    
    $self->{b_initwww} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initwww}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/chordpro-web32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_6}->Add($self->{b_initwww}, 0, wxEXPAND, 0);
    
    $self->{l_initwww} = Wx::StaticText->new($self, wxID_ANY, "Visit the ChordPro site");
    $self->{sizer_6}->Add($self->{l_initwww}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, wxEXPAND, 0);
    
    $self->{sizer_7} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_7}, 0, wxEXPAND, 0);
    
    $self->{b_initdocs} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initdocs}->SetBitmap(Wx::Bitmap->new("/usr/local/src/ChordPro/lib/ChordPro/res/icons/chordpro-web32.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_7}->Add($self->{b_initdocs}, 0, wxEXPAND, 0);
    
    $self->{l_initdocs} = Wx::StaticText->new($self, wxID_ANY, "Read the documentation");
    $self->{sizer_7}->Add($self->{l_initdocs}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 5, wxEXPAND, 0);
    
    $self->{sz_init}->Add(20, 1, 1, wxEXPAND, 0);
    
    $self->{p_recent}->SetSizer($self->{sizer_10});
    
    $self->{p_create}->SetSizer($self->{sizer_1});
    
    $self->SetSizer($self->{sz_init});
    
    $self->Layout();
    Wx::Event::EVT_RADIOBOX($self, $self->{rb_createrecent}->GetId, $self->can('OnCreateRecent'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initnew}->GetId, $self->can('OnInitialNew'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initopen}->GetId, $self->can('OnInitialOpen'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initsbexp}->GetId, $self->can('OnInitialSBexp'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initexamople}->GetId, $self->can('OnInitialExample'));
    Wx::Event::EVT_LISTBOX($self, $self->{lb_recent}->GetId, $self->can('OnInitialRecentSelect'));
    Wx::Event::EVT_LISTBOX_DCLICK($self, $self->{lb_recent}->GetId, $self->can('OnInitialRecentDclick'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initwww}->GetId, $self->can('OnInitialSite'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initdocs}->GetId, $self->can('OnInitialDocs'));

    # end wxGlade
    return $self;

}


sub OnCreateRecent {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnCreateRecent <event_handler>
    warn "Event handler (OnCreateRecent) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialNew {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialNew <event_handler>
    warn "Event handler (OnInitialNew) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialOpen {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialOpen <event_handler>
    warn "Event handler (OnInitialOpen) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialSBexp {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialSBexp <event_handler>
    warn "Event handler (OnInitialSBexp) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialExample {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialExample <event_handler>
    warn "Event handler (OnInitialExample) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialRecentSelect {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialRecentSelect <event_handler>
    warn "Event handler (OnInitialRecentSelect) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialRecentDclick {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialRecentDclick <event_handler>
    warn "Event handler (OnInitialRecentDclick) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialSite {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialSite <event_handler>
    warn "Event handler (OnInitialSite) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnInitialDocs {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialDocs <event_handler>
    warn "Event handler (OnInitialDocs) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::InitialPanel_wxg

1;

