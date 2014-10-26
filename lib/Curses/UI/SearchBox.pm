package Curses::UI::SearchBox;
{
  $Curses::UI::SearchBox::VERSION = '0.001';
}
# ABSTRACT: Extension of Curses::UI::TextEntry
use Moo;

extends 'Curses::UI::TextEntry';

after delete_character => sub { shift->draw };

after delete_till_eol => sub { shift->draw };

around new => sub { shift->() };

has history_index => (
    is => 'rw',
    default => sub {0},
);

1;
