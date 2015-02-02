#!perl -w

open IN, 'in.txt' or die "$!";
open OT, '>out.txt';
open OB, '>out.bat';

$m = 0;
while(<IN>){
  chomp;

  if ( $m == 0 ){
    /^\d+$/ or next;
    $ccode = $_;
    ++$m;

  } elsif ( $m == 1 ){
    $a3 = substr($_, 2, 3);
    ++$m;

  } elsif ( $m == 2 ){
    $a2 = $_;
    ++$m;

  } elsif ( $m == 3 ){
    /^([^|]+)\|([^"]+)/;
    $cname = $1;
    $pic = $2;
    print OT "$ccode|$a3|$a2|$cname\n";
    print OB "ren $pic $a3.png\n";
    $m = 0;
  }
}

close IN;
close OT;
close OB;
