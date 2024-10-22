#! perl

use strict;
use warnings;
use utf8;

# Implementation of ChordPro::Wx::RenderDialog_wxg details.

package ChordPro::Wx::RenderDialog;

# ChordPro::Wx::RenderDialog_wxg is generated by wxGlade and contains
# all UI associated code.

use parent qw( ChordPro::Wx::RenderDialog_wxg );

use Wx qw[:everything];
use Wx::Locale gettext => '_T';
use ChordPro::Wx::Config;
use ChordPro::Wx::Utils;

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

# As of wxGlade 1.0 __set_properties and __do_layout are gone.
sub new {
    my $self = shift->SUPER::new(@_);

    if ( @{$state{tasks}} ) {
	$self->{l_customtasks}->Show(1);
	my $index = 0;
	for my $task ( @{$state{tasks}} ) {
	    my $id = Wx::NewId();
	    $self->{sz_customtasks}->Add
	      ( $self->{"cb_customtask_$index"} = Wx::CheckBox->new
		($self, $id, $task->[0] ),
		0, 0, 0 );
	    $index++;
	}
	$self->Layout;
	$self->Fit;
    }
    restorewinpos( $self, "tasks" );
    $self;
}

#               C      D      E  F      G      A        B C
my @xpmap = qw( 0 1  1 2 3  3 4  5 6  6 7 8  8 9 10 10 11 12 );
my @sfmap = qw( 0 7 -5 2 9 -3 4 -1 6 -6 1 8 -4 3 10 -2  5 0  );

################ Event handlers ################

sub OnAccept {
    my ( $self, $event ) = @_;
    savewinpos( $self, "tasks" );
    $event->Skip;
}

sub OnCancel {
    my ( $self, $event ) = @_;
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

1;
