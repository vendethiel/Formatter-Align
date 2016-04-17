use lib 'lib/';
use Test;
use Formatter::Align;

plan 3;

my @data =
  ("Hello there", "Salut"),
  ("Bye", "Au revoir");

is format(@data, :padding-from(3)), q:to/END/.chomp, "Padding from";
   Hello there    Salut     
   Bye            Au revoir 
END

is format(@data, :padding-to(3)), q:to/END/.chomp, "Padding to";
 Hello there    Salut       
 Bye            Au revoir   
END

is format(@data, :padding-from(3)), q:to/END/.chomp, "Padding from+to";
   Hello there    Salut     
   Bye            Au revoir 
END

is format(@data, :padding-from(0), :padding-to(0)), q:to/END/.chomp, "No padding";
Hello thereSalut    
Bye        Au revoir
END
