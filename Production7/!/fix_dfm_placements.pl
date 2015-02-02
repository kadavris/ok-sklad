#!perl -w

$oldext = '.fixplac';

open LOG, '>fixplac.log';
open DFMLIST, 'dir /b/s *.dfm|';
while(<DFMLIST>){
  chomp;
  print LOG "\n\n", '-'x50, "\nFile: $_\n\n";
  $dfm = $_;
  $origdfm = $dfm . $oldext;

  if ( -f $origdfm ) {
    (undef,undef,undef,undef,undef,undef,undef,undef,undef,$dmtime,undef,undef,undef) = stat($dfm);
    (undef,undef,undef,undef,undef,undef,undef,undef,undef,$omtime,undef,undef,undef) = stat($origdfm);
    if ( $dmtime > $omtime ) { unlink $origdfm; }
  }

  -f $origdfm or rename $dfm, $origdfm or die "rename $dfm --> $origdfm: $!";

  open IN, $origdfm;
  open OUT, '>', $dfm;

  $inItem = 0;
  $line = 0;
  while(<IN>){
    ++$line;
    chomp;
    if ( /^(\s*)(object|inherited|inline)\s+(\w+.*)$/ ){
      my $os = $1;
      my $newobj = $3;
      my $newobjtype = $2;
      $#dumped > -1 and dumpobj();
      push @object, $newobj;
      push @objtype, $newobjtype;
      push @objSpaces, $os;

      print OUT $_, "\n";

      initobj();

    } elsif ( /^\s*item\s*$/ ) {
        ++$inItem;
        push @t, $_;

    } elsif ( /^(\s*)((Client)?Height)\s*=\s*(\d+)/ ) {
      $spaces = $1;
      $objHname = $2;
      $objH = $4;
#print LOG ">>>$object: h: $objH\n";

    } elsif ( /^(\s*)((Client)?Width)\s*=\s*(\d+)/ ) {
      $spaces = $1;
      $objWname = $2;
      $objW = $4;

    } elsif ( /^(\s*)Left\s*=\s*(-?\d+)/ ) {
      $spaces = $1;
      $objL = $2;

    } elsif ( /^(\s*)Top\s*=\s*(-?\d+)/ ) {
      $spaces = $1;
      $objT = $2;

    } elsif ( /^(\s*)end\b/ ) {
      my $os = $1;
      if ( $inItem ) {
        push @t, $_;
        $inItem = 0;
        next;
      }

      if ( $os ne $objSpaces[$#objSpaces] ) { print LOG '!!!!! end with invalid indent at line ', $line, "\n"; }
      dumpobj();
      print OUT $_, "\n";

      pop @widths;
      pop @heights;
      pop @object;
      pop @objtype;
      pop @dumped;
      pop @objSpaces;

    } else {
      push @t, $_;
    }
  }
  close IN;
  close OUT;
  $atime = $mtime = time;
  utime $atime, $mtime, $origdfm;
}
close DFMLIST;
close LOG;

###########################################################################
sub initobj {
  $maxW = $maxH = 99999;

  for ( my $i = $#widths; $i >= 0; --$i ){
    my $w = $widths[$i]; my $h = $heights[$i];
    if ( $maxW == 99999 && $w > 0 ) { $maxW = $w; }
    if ( $maxH == 99999 && $h > 0 ) { $maxH = $h; }
    last if ($maxW != 99999) && ($maxH != 99999);
  }

  $objW = $objH = $objT = $objL = -99999;
  @t = ();
  push @dumped, 0;
  push @widths, $objW;
  push @heights, $objH;
  $spaces = '';
  #print LOG ">>>lvl $#object: $object[$#object]: maxh: $maxH, maxW: $maxW\n";
}

###########################################################################
sub dumpobj {
  $dumped[$#dumped] and return;

  if ( $objL != -99999 ){
    if ( $objL >= $maxW || $objL < 0 ){
      print LOG "Fixed Left ($objL, max: $maxW) for $object[$#object]\n";
      $objL = 1;
    }
    print OUT $spaces, 'Left = ', $objL, "\n";
  }

  if ( $objT != -99999 ){
    if ( $objT >= $maxH || $objT < 0 ){
      print LOG "Fixed Top ($objT, max: $maxH) for $object[$#object]\n";
      $objT = 1;
    }
    print OUT $spaces, 'Top = ', $objT, "\n";
  }

  if ( $objW != -99999 ) {
    my $l = $objL == -99999 ? 0 : $objL;
    if ( $l + $objW > $maxW ) {
      my $ow = $objW;
      $objW = $maxW - 1 - $l;
      print LOG "Fixed Width ($ow to $objW, max: $maxW) for $object[$#object]\n";
    }
    $widths[$#widths] = $objW;
    print OUT $spaces, $objWname, ' = ', $objW, "\n";
  }

  if ( $objH != -99999 ) {
    #my $t = $objT == -99999 ? 0 : $objT;
    #if ( $t + $objH > $maxH ) {
    #  my $oh = $objH;
    #  $objH = $maxH - 1 - $t;
    #  print LOG "Fixed Height ($oh to $objH, max: $maxH) for $object[$#object]\n";
    #}
    $heights[$#heights] = $objH;
    print OUT $spaces, $objHname, ' = ', $objH, "\n";
  }

  for my $p (@t){ print OUT $p, "\n"; }
  $dumped[$#dumped] = 1;
}
