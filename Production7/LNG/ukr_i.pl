open IN, $ARGV[0] or die "in: $!";
open OUT, '>', $ARGV[0] . '.out';

while (<IN>){
  if( /^\s*\[/ or /^\s*$/ ){ 
    s/³/i/g;
    print OUT;
    next;
  }

  /^([^=]+)=(.+)$/;
  $var = $1;
  $val = $2;

  $var =~ s/³/i/g;
  $val =~ s/i/³/g;
  print OUT "$var=$val\n";
}
close OUT;
close IN;
