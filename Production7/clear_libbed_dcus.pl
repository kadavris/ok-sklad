#!perl -w

open F, 'dir /b/s *.pas|';

while(<F>){
  chomp;
  s/\.pas/.dcu/;
  s/.+\\//;
  $p = "..\\libs7\\lib\\dcu\\$_";
  -f $p or next;
  print "$p\n";
  unlink $p;
}
close F;

@specials = qw~
  okFramelist.dcu
~;

for (@specials){
  $p = "..\\libs7\\lib\\dcu\\$_";
  -f $p or next;
  print "$p\n";
  unlink $p;
}
