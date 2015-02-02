#!perl -w

if ($#ARGV < 0){
  push @dirs, '.';

} else {
  while( defined($ARGV[0])) {
    push @dirs, shift;
  }
}

for my $dir (@dirs){
  open DIRS, qq~dir /b/s "$dir\\*.dpk" |~ or die "$dir: $!";

  while(<DIRS>){
    chomp;
    next if ! /\.dpk$/i;

    ($path = $_) =~ s/[^\\]+$//;
    $sec = 'g';
    $pkgname = '';
    my $requires = $contains = 0;
    print "dpk: $_";
    push @dpkfiles, $_; # init

    $cb = '';
    open DPK, $_;
    while(<DPK>){
      skipComments();

      next if $_ eq '';

      if ( /^package\s+(\S+)\s*;/i ){
        $pkgname = $1;
        push @dpk, $1;
        $ourdpks{lc($1)} = $#dpk;
        $sec = 'g';
        next;

      } elsif ( /^requires(\s+(.+))?/i ){
        $sec = 'r';

        next if ! defined($2);
        $_ = $2;
        # below it will parse it

      } elsif ( /^contains(\s+(.+))?/i ){
        $sec = 'c';

        next if ! defined($2);
        $_ = $2;
        # below it will parse it

      } elsif ( /^end./i ){
        last;
      }

      #-------------------------------------------------
      if ( $sec eq 'r' ){
        die if ! /(\w+)\s*[;,]/;
        push @{$req[$#dpk]}, $1;
        ++$requires;

      } elsif ( $sec eq 'c' ){
        ++$contains;
        die qq~$dpkfiles[$#dpkfiles]: bad 'contains' line: "$_"~ if ! /^(\s*,\s*)?(\w+)(\s+in\s+'([^']+)')?\s*[;,]?$/;
        my $uname = $2;
        my $fpath = $4;
        if ( ! defined($fpath) || $fpath eq '' ) { $fpath = $uname . '.pas'; }
        (my $fname = $fpath) =~ s/.+\\//;
        $units{lc($uname)} = [$#dpk, $path . $fpath, $fname];
        lc($uname . '.pas') ne lc($fname) and print "\n!!! Warning: different filename for unit $uname!!!\n";
        #$dcont[$#dpk] .= $1 . ',';

      }

      if ( /;/ && $sec ne 'g' ){
        $sec = 'g';
      }

    } # while DPK
    close DPK;
    print " Req: $requires, contains: $contains - OK\n";
  } # while DIRS
  close DIRS;
} # for my $dir (@dirs)

#######################################################
#reading deps from dpk units

$| = 1;
print "\n...scanning units...\n";
for my $u (keys %units){
  ($dpki, $file, $fname) = @{$units{$u}};
  $uses{$u} = [];
  open U, $file or die "$fname ($file) of $dpkfiles[$dpki]: $!";

  $sec = 'int';
  @ul = ();
  $cb = '';
  #$line = 0;
  while(<U>){
    #my $ls = '' . ++$line;
    #print $ls, "\b" x length($ls);
    skipComments();
    next if $_ eq '';

    /^implementation/ and $sec = 'imp';

    $sec eq 'imp' and /^(procedure|function)/ and last;

    /^uses\b/ or next;
    s/^uses\s*//;
    my $done = 0;

    while(<U>){
      #$ls = '' . ++$line;
      #print $ls, "\b" x length($ls);
      skipComments();
      next if $_ eq '';

      if ( /;/ ){ ++$done; chop; }

      for (split /\s*,\s*/){ push @{$uses{$u}}, lc($_) if $_ ne ''; }

      $done and last;
    }

    $sec eq 'imp' and last;
  } # while U
  close U;
} # for my $u (keys %units)

print "\n...resolving...\n";
for my $u (keys %units){
  print "$dpk[$dpki]: $file: ";

  ($dpki, $file) = @{$units{$u}};
  @ul = @{$uses{$u}};

  my $total = $resolved = 0;

  UL: for ( @ul ){
    ++$total;
    defined($units{$_}) or next;
    my $pi = $units{$_}[0];
    next if $pi == $dpki; # skip our package
    my $p = lc($dpk[$pi]);

    for my $dd ( @{$req[$dpki]} ){
      lc($dd) eq $p and next UL;
    }

    ++$resolved;
    push @{$req[$dpki]},    $dpk[$pi];
    push @{$reqnew[$dpki]}, $dpk[$pi];
    push @{$rncmt[$dpki]},  " // unit $_ used in $u";
  }
  print " total: $total, resolved: $resolved\n";
} # for my $u (keys %units)

print "\n", '#'x50, "\n...needed to be added...\n";
for my $i (0..$#dpk){
  $#{$reqnew[$i]} < 0 and next;
  print "\nDPK: $dpk[$i] in $dpkfiles[$i]\n";
  for( 0..$#{$reqnew[$i]} ){ print ${$reqnew[$i]}[$_], ',', ${$rncmt[$i]}[$_], "\n"; }
  print "\n", '-'x20, "\n";
}

print "\n", '#'x50, "\n...order...\n";
# counting references
for my $i (0..$#dpk){
  for my $r ( @{$req[$i]} ){
    next if ! defined($ourdpks{lc($r)});
    push @{$inrefs{lc($r)}}, lc($dpk[$i]);
  }
}
#print ">>>", join(',', @{$inrefs{'eqtld6'}}), "\n";
#print ">>>", getdeps('cxdatad7','cxIBXAdaptersD7'), "\n";

@order = keys %ourdpks;
for my $i ( 0..$#order ){
  for my $ii ( $i+1..$#order ){
    if ( getdeps($order[$ii], $order[$i]) ){ # it's first arg in dependencies list of second arg (or it's ancestors)
      my $t = $order[$i];
      $order[$i] = $order[$ii];
      $order[$ii] = $t;
    }
  }
}

for my $u ( @order ){
  if ( $#{$inrefs{ lc($u) }} < 0 ){
    #print "rem Unused: ";
  }
  print $dpkfiles[$ourdpks{$u}], "\n";
}

########################################################################
sub ordsrt {
  getdeps($a, $b) and return -1;
  return 1;
  getdeps($b, $a) and return 1;
  return 0;
}

sub getdeps { # ret 1 if pkgname(arg2) depends on pkgname(arg1)
  my $a = lc($_[0]);
  my $b = lc($_[1]);
  return 0 if ! defined( $ourdpks{$b} );
  return 0 if 0 == @{ $req[$ourdpks{$b}] };

  for my $r ( @{$req[$ourdpks{$b}]} ){
    if( $a eq lc($r) || getdeps($a, $r) ){ return 1; }
  }
  return 0;
}

#########################################################################
#########################################################################
#########################################################################
sub skipComments {
  while (1){
    if ( $cb eq '' ){
      if ( /{|\(\*/ ){
        $cb = quotemeta($&);
        $ce = $& eq '{' ? '}' : '\*\)';

        if( s/$cb.*?$ce// ) {
          $cb = '';

        } else {
          s/$cb.*$//;
          last;
        }
        next;

      } else {
        last;
      } 

    } else {
      if ( /^.*?$ce/ ){
        s/^.*?$ce//;
        $cb = '';

      } else {
        $_ = '';
        last;
      }
    }
  }

  s~//.*~~;

  s/^\s+//;
  s/\s+$//;
}
