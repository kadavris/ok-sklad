#!perl -w
open C, 'mkres-codes-en.txt';
@a = <C>;
close C;

@cnames = sort mysort @a;

$i = 1;
for ( @cnames ){
  chomp;

  ($code, $name) = split /\|/;

  -f "pics\\$code.bmp" or die("Flag BMP for $code does not exist!");

  $clist .= $code;
  $names .= '    ' . $i++ . ', "' . $name . qq~"\n~;
  $pics .= qq~$code BITMAP "pics\\$code.bmp"\n~;
}

open OUT, '>CountryCodes.rc' or die "rc: $!";
print OUT "STRINGTABLE\nBEGIN\n    0, \"$clist\"\n${names}END\n$pics\n";
close OUT;

#--------------------------
sub mysort {
  return substr($a, 2) cmp substr($b, 2);
}
