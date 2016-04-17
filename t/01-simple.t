use lib 'lib/';
use Test;
use Formatter::Align;

plan 1;

{
  my @data =
    ("Hello there", "Salut"),
    ("Bye", "Au revoir");

  is format(@data), q:to/END/.chomp, "Simplest variant";
   Hello there  Salut     
   Bye          Au revoir 
  END
}
