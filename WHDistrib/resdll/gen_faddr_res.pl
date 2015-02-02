#!perl -w

require '..\branding.pl';
require '..\paths.pl';

$rcfile = 'res.rc';
$key = '63257671816471645';

open M, $ARGV[0] or die "$ARGV[0]: $!";

# skipping to publics list
while(<M>){
  last if /Publics.by.Value/i;
}

#reading data
$count = 0;
while(<M>){
  $count > 0 and last if /^\s*$/;
  next if /^\s*$/;

  /^[^:]+:(\S+)\s+(\S+)/;
  $addr = $1;
  $fname = $2;
  next if length($fname) < 3; # skipping specials

  $outname = '';
  for ( $i = 0; $i < length($fname); ++$i ){
    #$c = chr(ord(substr($fname, $i, 1)) + int(substr($key, $i % length($key), 1)));
    #$outname .= $c eq '\\' ? '\\\\' : $c;

    $outname .= chr(ord(substr($fname, $i, 1)) + int(substr($key, $i % length($key), 1)));
  }

  ++$count;
  #push @rc, qq~    $count, "$addr:$outname"\n~;
  push @rc, hex($addr) . "=$outname\n";
}
close M;

open RC, ">$rcfile" or die "$rcfile: $!";
#print RC qq~STRINGTABLE\nBEGIN\n    0, "$count"\n~;
foreach (@rc){ print RC $_; }
#print RC "END\n";
close RC;

rename $rcfile, $ARGV[1];
#system qq~mkres.cmd res "$ARGV[1]"~;

