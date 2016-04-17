unit module Formatter::Align;

sub format(@data, @headers?, Int :$padding-from = 1, Int :$padding-to = 1) is export {
  return "" if !@data;
  my $columns = @data[0].elems;
  my @depths = do for ^$columns -> $i {
    max (@headers[$i] // '').chars, |@data.map({$_[$i].Str.chars})
  };
  my $pad-beginning = " " x $padding-from;
  my $pad-end = " " x $padding-to;

  my Str $header = "";
  if @headers {
    my Str $underline;
    for @headers -> $column {
      my $size = @depths[$++] - $column.chars;
      $header ~= $pad-beginning ~ $column ~ " " x $size ~ $pad-end;
      $underline ~= $pad-beginning ~ "=" x $column.chars ~ " " x $size ~ $pad-end;
    };
    $header ~= "\n$underline\n";
  }

  $header ~ join "\n", do for @data -> @row {
    join '',  do for @row -> $value {
      $pad-beginning ~ $value ~ " " x (@depths[$++] - $value.chars) ~ $pad-end;
    }
  }
}
