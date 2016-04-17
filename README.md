Formatter::Align
===============


Easily format an array in an aligned table.


Usage:

```perl6
use Formatter::Align;

my @headers = <<ID Name Type "Family Name">>;
my @data =
  (1, "George", "CEO", "Reagen"),
  (2, "Tami", "Employee", "?"),
  (3, "Kaaris", "CXO", "Rap");

# The headers are optional.
say format(@data, @headers);
```

Output:

```
 ID  Name    Type      Family Name 
 ==  ====    ====      =========== 
 1   George  CEO       Reagen      
 2   Tami    Employee  ?           
 3   Kaaris  CXO       Rap         
```

Options:

- padding-from: The space at the beginning of a column.
- padding-to: The space at the end of a column.
