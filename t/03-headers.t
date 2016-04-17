use lib 'lib/';
use Test;
use Formatter::Align;

my @headers = <<ID Name Type "Family Name">>;
my @data =
  (1, "George", "CEO", "Reagen"),
  (2, "Tami", "Employee", "?"),
  (3, "Kaaris", "CXO", "Rap");

is format(@data, @headers), q:to/END/.chomp, "Headers";
 ID  Name    Type      Family Name 
 ==  ====    ====      =========== 
 1   George  CEO       Reagen      
 2   Tami    Employee  ?           
 3   Kaaris  CXO       Rap         
END

is format(@data, @headers, :padding-from(3), :padding-to(2)), q:to/END/.chomp, "Headers + options";
   ID     Name       Type         Family Name  
   ==     ====       ====         ===========  
   1      George     CEO          Reagen       
   2      Tami       Employee     ?            
   3      Kaaris     CXO          Rap          
END
