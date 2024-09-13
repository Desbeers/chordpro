# generated by wxGlade 1.1.0b1 on Fri Sep 13 15:30:02 2024
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
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: ChordPro::Wx::InitialPanel_wxg::new
    $style = wxTAB_TRAVERSAL
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );
    
    $self->{sz_init} = Wx::BoxSizer->new(wxHORIZONTAL);
    
    $self->{sz_init}->Add(20, 1, 1, 0, 0);
    
    $self->{sizer_8} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_init}->Add($self->{sizer_8}, 0, wxEXPAND, 0);
    
    $self->{sizer_8}->Add(1, 1, 1, 0, 0);
    
    my $bm_init = Wx::StaticBitmap->new($self, wxID_ANY, Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-icon-narrow.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_8}->Add($bm_init, 0, 0, 0);
    
    $self->{sizer_8}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_2} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sz_init}->Add($self->{sizer_2}, 0, wxEXPAND|wxLEFT, 20);
    
    $self->{l_init} = Wx::StaticText->new($self, wxID_ANY, "Welcome to ChordPro!");
    $self->{l_init}->SetFont(Wx::Font->new(20, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, 0, ""));
    $self->{l_init}->Wrap(1);
    $self->{sizer_2}->Add($self->{l_init}, 0, wxBOTTOM|wxTOP, 40);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_3}, 0, wxEXPAND, 0);
    
    $self->{b_initnew} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initnew}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/document-new.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_3}->Add($self->{b_initnew}, 0, wxEXPAND, 0);
    
    $self->{l_initnew} = Wx::StaticText->new($self, wxID_ANY, "Create a new song");
    $self->{sizer_3}->Add($self->{l_initnew}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_4} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_4}, 0, wxEXPAND, 0);
    
    $self->{b_initopen} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initopen}->SetFocus();
    $self->{b_initopen}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-open.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_4}->Add($self->{b_initopen}, 0, wxEXPAND, 0);
    
    $self->{l_initopen} = Wx::StaticText->new($self, wxID_ANY, "Open an existing song");
    $self->{sizer_4}->Add($self->{l_initopen}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_5} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_5}, 0, wxEXPAND, 0);
    
    $self->{b_initexamople} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initexamople}->SetFocus();
    $self->{b_initexamople}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-song.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_5}->Add($self->{b_initexamople}, 0, wxEXPAND, 0);
    
    $self->{l_initexample} = Wx::StaticText->new($self, wxID_ANY, "Open an example song");
    $self->{sizer_5}->Add($self->{l_initexample}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sizer_6} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_6}, 0, wxEXPAND, 0);
    
    $self->{b_initwww} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initwww}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-web.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_6}->Add($self->{b_initwww}, 0, wxEXPAND, 0);
    
    $self->{l_initwww} = Wx::StaticText->new($self, wxID_ANY, "Visit the ChordPro site");
    $self->{sizer_6}->Add($self->{l_initwww}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 1, 0, 0);
    
    $self->{sizer_7} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_2}->Add($self->{sizer_7}, 0, wxEXPAND, 0);
    
    $self->{b_initdocs} = Wx::Button->new($self, wxID_ANY, "");
    $self->{b_initdocs}->SetBitmap(Wx::Bitmap->new("/home/jv/src/ChordPro/lib/ChordPro/res/icons/chordpro-web.png", wxBITMAP_TYPE_ANY));
    $self->{sizer_7}->Add($self->{b_initdocs}, 0, wxEXPAND, 0);
    
    $self->{l_initdocs} = Wx::StaticText->new($self, wxID_ANY, "Read the documentation");
    $self->{sizer_7}->Add($self->{l_initdocs}, 0, wxALIGN_CENTER_VERTICAL|wxLEFT, 10);
    
    $self->{sizer_2}->Add(1, 1, 2, 0, 0);
    
    $self->{sz_init}->Add(20, 1, 1, 0, 0);
    
    $self->SetSizer($self->{sz_init});
    $self->{sz_init}->Fit($self);
    
    $self->Layout();
    Wx::Event::EVT_BUTTON($self, $self->{b_initnew}->GetId, $self->can('OnInitialNew'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initopen}->GetId, $self->can('OnInitialOpen'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initexamople}->GetId, $self->can('OnInitialExample'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initwww}->GetId, $self->can('OnInitialSite'));
    Wx::Event::EVT_BUTTON($self, $self->{b_initdocs}->GetId, $self->can('OnInitialDocs'));

    # end wxGlade
    return $self;

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


sub OnInitialExample {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::InitialPanel_wxg::OnInitialExample <event_handler>
    warn "Event handler (OnInitialExample) not implemented";
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

