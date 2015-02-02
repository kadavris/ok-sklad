open IN, $ARGV[0] or die "in: $!";
open OUT, '>', $ARGV[0] . '.out';

while (<IN>){
  if( /^\s*\[/ or /^\s*$/ ){ 
    s/�/i/g;
    print OUT;
    next;
  }

  /^([^=]+)=(.+)$/;
  $var = $1;
  $val = $2;

  $var =~ s/�/i/g;
  $val =~ s/i/�/g;
  print OUT "$var=$val\n";
}
close OUT;
close IN;
