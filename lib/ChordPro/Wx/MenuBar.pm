# generated by wxGlade 1.1.0b1 on Tue Sep 17 16:54:49 2024
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

package ChordPro::Wx::MenuBar;

use Wx qw[:everything];
use base qw(Wx::MenuBar);
use strict;

# begin wxGlade: dependencies
use Wx::Locale gettext => '_T';
# end wxGlade

sub new {
    my( $self,  ) = @_;
    # begin wxGlade: ChordPro::Wx::MenuBar::new
    $self = $self->SUPER::new( @_[1 .. $#_] );
    my $wxglade_tmp_menu;
    # end wxGlade
    return $self;

}


# end of class ChordPro::Wx::MenuBar

1;

