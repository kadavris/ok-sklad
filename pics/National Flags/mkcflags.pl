#!perl -w
open C, 'dir /b pics\??.bmp|';
@a = <C>;
close C;

@cnames = sort @a;

open OUT, '>CountryFlags.rc' or die "rc: $!";
for ( @cnames ){
  chomp;

  $code = substr($_, 0, 2);

  print OUT qq~$code BITMAP "pics\\$_"\n~;
}

close OUT;

system 'brcc32 countryflags.rc';
system 'dcc32 countryflags.pas';