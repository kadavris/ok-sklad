#perl -w

%resNumbers = ( # mapping keyword to resource nimber
  'TITLE'     => 1,
  'MOTTO'     => 2,
  'COPYRIGHT' => 3,
  'URL'       => 4,
  'INSTDIR'   => 5,
  'COMPANY'   => 6,
  'URL_KeyActivate'     => 7,
  'URL_KeyActivatePost' => 8,
  'URL_KeyCheck'        => 9,
  'URL_KeyCheckPost'    => 10,
  'URL_KeyHost'         => 11,
);

require '..\..\branding.pl';
require '..\..\paths.pl';

foreach my $distr ( sort(keys(%distribs)) ){
  ($lang, $type, @mods) = split '-', $distr;
  $shortLang = $slang{$lang};

  $modsuff = '-' . $lang;
  if ( $#mods > -1 ){
    $modsuff .= '-' . join '-', @mods;
  }

  @resstrings = split "\n", $branding{$distr};

  $resfile = "$distr";
  open RES, ">$resfile.rc" or die "$resfile: $!";

  print RES "STRINGTABLE\nBEGIN\n";
  foreach my $sr (@resstrings){
    $sr =~ s/^_(\w+)_=(.*)$/    $resNumbers{$1}, "$2"\n/g;
    print RES $sr;
  }
  print RES "END\n";

  print RES "ABOUT BITMAP \"$bitmapsDir\\logos\\about$modsuff.bmp\"\n";
  print RES "SPLASH BITMAP \"$bitmapsDir\\logos\\splash$modsuff.bmp\"\n";
  print RES "HBANNER BITMAP \"$bitmapsDir\\logos\\hbanner$modsuff.bmp\"\n";
  print RES "HBANSRV BITMAP \"$bitmapsDir\\logos\\hbanner-server$modsuff.bmp\"\n";
  close RES;

  system "mkres.bat $resfile";
}
