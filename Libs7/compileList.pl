#!perl -w
$listfile = 'compilelist.lst';

open OF, $listfile or die "$listfile: $!";

while(<OF>){
  chomp;
  next if /^\s*$/;
  next if /^\s*#/;
  ($path = $_) =~ s/\\[^\\]+$//;
  ($dpk = $_) =~ s/^.+\\//;

  $cmd = qq~cd "$path" & perl c:\\bin\\bat\\dcc7.pl --nw --nh --lib "$dpk"~;
  print "\n", '='x80, "\n>>>>> $cmd\n";
  system $cmd;
  exit if $? > 0;
}
close OF;
