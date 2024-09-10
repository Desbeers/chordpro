#! perl

use strict;
use warnings;
use utf8;

# Implementation of ChordPro::Wx::MessagesPanel_wxg details.

package ChordPro::Wx::MessagesPanel;

# ChordPro::Wx::SoongbookExport_wxg is generated by wxGlade and contains
# all UI associated code.

use parent qw( ChordPro::Wx::MessagesPanel_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';

sub new {
    my( $self, $parent, $id, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    $self = $self->SUPER::new( $parent, $id, $pos, $size, $style, $name );
    $self->Layout();
    return $self;

}


sub mine() { yes }


1;

