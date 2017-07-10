#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Test::More tests => 6;

use App::Music::ChordPro::Config;
use App::Music::ChordPro::Songbook;

our $config = App::Music::ChordPro::Config::configurator;
# Prevent a dummy {body} for chord grids.
$config->{chordgrid}->{show} = 0;
my $s = App::Music::ChordPro::Songbook->new;

my $data = <<EOD;
{title Grids}
{start_of_grid 4x3}
| B . . | C . . | D . . | E . . |
| B . . | C . . | D . . | E . . |
| B . . | C . . | D . . | E . . |
| B . . | C . . | D . . | E . . |
{end_of_grid}
EOD

eval { $s->parsefile(\$data) } or diag("$@");

ok( scalar( @{ $s->{songs} } ) == 1, "One song" );
isa_ok( $s->{songs}->[0], 'App::Music::ChordPro::Song', "It's a song" );
#use DDumper; warn(DDumper($s));
my $song = {
      meta => {
        title => ['Grids'],
      },
      settings => {},
      structure => 'linear',
      title => 'Grids',
      body => [
	       { context => 'grid',
		 name => 'gridparams',
		 type => 'set',
		 value => [4, 3, undef, undef]},
	       { context => 'grid',
		 type => 'gridline',
		 tokens => [
			   { class => 'bar', symbol => '|' },
			   { chord => 'B', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'C', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'D', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'E', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			  ],
	       },
	       { context => 'grid',
		 type => 'gridline',
		 tokens => [
			   { class => 'bar', symbol => '|' },
			   { chord => 'B', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'C', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'D', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'E', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			  ],
	       },
	       { context => 'grid',
		 type => 'gridline',
		 tokens => [
			   { class => 'bar', symbol => '|' },
			   { chord => 'B', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'C', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'D', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'E', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			  ],
	       },
	       { context => 'grid',
		 type => 'gridline',
		 tokens => [
			   { class => 'bar', symbol => '|' },
			   { chord => 'B', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'C', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'D', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			   { chord => 'E', class => 'chord' },
			   { class => 'space', symbol => '.' },
			   { class => 'space', symbol => '.' },
			   { class => 'bar', symbol => '|' },
			  ],
	       },
	      ],
	   };

is_deeply( { %{ $s->{songs}->[0] } }, $song, "Song contents" );

$s = App::Music::ChordPro::Songbook->new;

# Chord definitions.
$data = <<EOD;
{title Grids}
{start_of_grid 1+4x3+2}
| B . . | C . . | D . . | E . . |
{end_of_grid}
{start_of_grid}
| B . . | C . . | D . . | E . . |
{end_of_grid}
{start_of_grid}
| B . . | C . . | D . . | E . . |
{end_of_grid}
{start_of_grid}
| B . . | C . . | D . . | E . . |
{end_of_grid}
EOD

eval { $s->parsefile(\$data) } or diag("$@");

ok( scalar( @{ $s->{songs} } ) == 1, "One song" );
isa_ok( $s->{songs}->[0], 'App::Music::ChordPro::Song', "It's a song" );

$song->{body}->[0]->{value} = [ 4, 3, 1, 2 ];
is_deeply( { %{ $s->{songs}->[0] } }, $song, "Song contents" );