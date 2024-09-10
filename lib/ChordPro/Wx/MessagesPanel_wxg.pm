# generated by wxGlade 1.1.0b1 on Tue Sep 10 21:50:14 2024
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package ChordPro::Wx::MessagesPanel_wxg;

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

    # begin wxGlade: ChordPro::Wx::MessagesPanel_wxg::new
    $style = wxTAB_TRAVERSAL
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );
    
    $self->{sz_msg} = Wx::BoxSizer->new(wxVERTICAL);
    
    $self->{t_msg} = Wx::TextCtrl->new($self, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY);
    $self->{sz_msg}->Add($self->{t_msg}, 1, wxEXPAND, 0);
    
    $self->{sizer_1} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sz_msg}->Add($self->{sizer_1}, 0, wxEXPAND|wxTOP, 5);
    
    $self->{sizer_1}->Add(2, 2, 1, 0, 0);
    
    $self->{button_3} = Wx::Button->new($self, wxID_CLEAR, "");
    $self->{sizer_1}->Add($self->{button_3}, 0, wxRIGHT, 5);
    
    $self->{button_1} = Wx::Button->new($self, wxID_SAVE, "");
    $self->{sizer_1}->Add($self->{button_1}, 0, wxRIGHT, 5);
    
    $self->SetSizer($self->{sz_msg});
    $self->{sz_msg}->Fit($self);
    
    $self->Layout();
    Wx::Event::EVT_BUTTON($self, $self->{button_3}->GetId, $self->can('OnMsgClear'));
    Wx::Event::EVT_BUTTON($self, $self->{button_1}->GetId, $self->can('OnMsgSave'));

    # end wxGlade
    return $self;

}


sub OnMsgClear {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::MessagesPanel_wxg::OnMsgClear <event_handler>
    warn "Event handler (OnMsgClear) not implemented";
    $event->Skip;
    # end wxGlade
}


sub OnMsgSave {
    my ($self, $event) = @_;
    # wxGlade: ChordPro::Wx::MessagesPanel_wxg::OnMsgSave <event_handler>
    warn "Event handler (OnMsgSave) not implemented";
    $event->Skip;
    # end wxGlade
}


# end of class ChordPro::Wx::MessagesPanel_wxg

1;

