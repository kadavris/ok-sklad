#!perl -w

require 'branding.pl';
require 'paths.pl';
require 'build_common.pl';

parseDOF();

makecurrverphp();

open MAKE, '>make_distrib.bat' or die "make_distrib.bat: $!";
print MAKE "rem Build version: $dof_fullver\n";
print MAKE "D: && cd $distrDir || exit\n\nperl backupOldDistr.pl\n\n";

foreach my $distr ( sort(keys(%distribs)) ){
  ($lang, $type, @mods) = split '-', $distr;
  $shortLang = $slang{$lang};

  $modsuff = '-' . $lang;
  if ( $#mods > -1 ){
    $modsuff .= '-' . join '-', @mods;
  }

  $outfile = eval $distribs{$distr}->[0];
  @addSuffixes = split( /\s*,\s*/, eval $distribs{$distr}->[1] );
  $mainBrand = shift @addSuffixes;
  $gdbsuff = $distribs{$distr}->[2];

  $vfile = 'vars_' . $outfile . '.inc';
  $brandFiles = 'vars_' . $outfile. '_brandFiles.inc';
  $langvars = 'vars_' . $outfile . '_langs.inc';

  open BRAND, '>', $brandFiles or die "$brandFiles: $!";

  print BRAND q~SetOutPath "$INSTDIR\\Client"~, "\n";
  print BRAND qq~File /oname=loginbg-std.jpg "$bitmapsDir\\logos\\loginbg-$mainBrand.jpg"\n~;
  for my $brandSuff ( @addSuffixes ){
    print BRAND qq~File "$bitmapsDir\\logos\\loginbg-$brandSuff.jpg"\n~;
  }
  close BRAND;

  open VARS, '>', $vfile or die "$vfile: $!";

  print VARS '!define _CLTEXE_ "', $protClientDir, "\\ok_sklad_$type", "\"\n"; # no ext
  print VARS '!define _SRVEXE_ "', $protServerDir, '\\ok_server_', $srvNameSuff{$type}, "\"\n"; # no ext
  print VARS '!define _DEMODB_ "', $DBDir, '\\demodb_', $gdbsuff, '.gdb', "\"\n";
  print VARS '!define _EMPTYDB_ "', $DBDir, '\\emptydb_', $gdbsuff, '.gdb', "\"\n";
  print VARS '!define _CLIENTSRC_ "', $clientSrcDir, "\"\n";
  print VARS '!define _SERVERSRC_ "', $serverSrcDir, "\"\n";
  print VARS '!define _LICENSE_ "texts\license', $modsuff, ".txt\"\n";
  print VARS '!define _SUFFIX_ "', $distr, "\"\n";
  print VARS '!define _LANG_ "', $lang, "\"\n";
  print VARS '!define _VER_ "', $dof_ver, "\"\n";
  print VARS '!define _VERBUILD_ "', $dof_build, "\"\n";
  print VARS '!define _VERFULL_ "', $dof_fullver, "\"\n";
  print VARS '!define _DISTR_ "', $type, "\"\n";
  print VARS '!define _SETUPEXE_ "', $outfile, ".exe\"\n";
  print VARS '!define _COUNTRYID_ ', $countryIDs{$lang}, "\n";
  print VARS '!define _INIT_WINDOW_ "', $clientSrcDir . '\\logos\\splash' . $modsuff . ".bmp\"\n";

  ( $bs = $branding{$distr} ) =~ s/(_COPYRIGHT_=)([^\n]+)/$1\(c\) $2 2003-${year}/;
  $bs =~ s/^(\w+)=/!define $1 "/gm;
  $bs =~ s/\n/"\n/g;
  print VARS $bs;

  print MAKE "\n\@echo ", '-' x 50, "\n\@echo - $distr ", '-' x 20, "\n";

  my $nsis = 'C:\\Program Files\\NSIS\\makensis.exe';
  -f $nsis or $nsis =~ s/^./D/;
  print MAKE "\"$nsis\" /V2 /D_VARS_=$vfile /D_LANGVARS_=$langvars /D_BRANDFILESINC_=$brandFiles install.nsi\n";
  # print MAKE "IF ERRORLEVEL 1 exit\n";

  close VARS;

  open LANGVARS, '>', $langvars or die "$langvars: $!";

#!!!!!!!!!!!!!!!! fix the install_langstrings.nsi for new added languages!!!!!!!!!!!!
  for my $l (qw~English SpanishInternational Russian~){
    #Afrikaans Danish Dutch Finnish French German Greek Hebrew Italian Norwegian Portuguese Swedish 
    print LANGVARS qq~!insertmacro MUI_LANGUAGE "$l"\n~;
  }

#  if ($lang ne "ENG"){
#    for my $l (qw~~){
#      # Ukrainian Uzbek Polish Czech
#      print LANGVARS qq~!insertmacro MUI_LANGUAGE "$l"\n~;
#    }
#  }

  close LANGVARS;

}
close MAKE;

#print "Running: make_distrib.bat $batver\n";
#system "make_distrib.bat $batver";


##########################################3
sub makecurrverphp {
  #php to include on client's update info request (dv.php?op=getver on site)
  my $changes = '';

  open CL, 'Changelog.txt' or die "changelog: $!";
  while(<CL>){
    last if /^${dof_fullver}/;
  }

  while(<CL>){
    s/'/\\'/g;
    #s/.*?://; # skip coder name and subsys
    $changes .= $_;
  }
  close CL;
  chomp $changes;
  $changes =~ s/\n/\\n/gm;

  $changes =~ /^\s*$/ and $changes = 'Some small usability improvements';
  open PHP, '>currver.php' or die "currver.php: $!";
  print PHP qq~<?php\nglobal \$CurrClientVer;\n\$CurrClientVer = 'ver=$dof_fullver\nbuilt=$date $time\nchanges=$changes';\n?>~;
  close PHP;
}
