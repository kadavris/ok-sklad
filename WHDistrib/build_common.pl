#!perl -w

require 'paths.pl';
readopts();

#($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
(undef,$minute,$hour,$mday,$mon,$year,undef) = localtime(time);
$year += 1900;
++$mon;
$date = sprintf '%d-%02d-%02d', $year, $mon, $mday;
$time = sprintf '%02d:%02d', $hour, $minute;

#---------------------------------------------------------------------
sub dobuild {
  my ($cmd, $dir, $dstName, $incdst, $incsrc, $name, $protDir);

  my $type = $_[0];

  if ( $build eq 'c' ){
    $dir = $clientSrcDir;
    $protDir = $protClientDir;
    $name = 'ok_sklad';

  } elsif ( $build eq 's' ){
    $dir = $serverSrcDir;
    $protDir = $protServerDir;
    $name = 'ok_server';

  } else {
    die "define $build to something as 'c'=client, 's'=server, etc";
  }

  $incsrc = "${name}_${type}.inc";
  $incdst = "${name}.inc";
  $dstname = "$protDir\\${name}_$type";

  my $useOptions = \$commonOptions;

  $type eq 'debug' and $useOptions = \$debugOptions;

  print "\n\n\n> $type  ", '=' x 40, "\n";

  chdir($dir) and system("copy $incsrc $incdst");
  die "copy $incsrc" if $? != 0;

  $cmd = 'c:\\program files\\borland\\delphi7\\bin\\DCC32.EXE';
  -f $cmd or substr($cmd, 0, 1) = 'd';
  $cmd = qq~"$cmd" ~ . $$useOptions . " $name.dpr";
  print "\n\n:::::\nCMD: $cmd\n:::::\n";
  system($cmd);
  
  my $ok = ($? == 0);

  if ( $type ne 'debug' ) {
    chdir($dir) and system("copy ${name}_debug.inc $incdst");
    die('debug inc copy') if $? != 0;
  }

  die('compilation error') if ! $ok;

  print "++++++ Compiled OK ++++++++\n\n";

  if ( $type ne 'debug' ) {
    chdir($distrDir);
    #doCrypt($inc);
    print "\n... $dir\\${name}.exe --> ${dstname}.exe\n";
    system ("copy /b \"$dir\\${name}.exe\" \"${dstname}.exe\"");

    print "... Making functions address list for access Violation resolver\n";
    rename "$dir\\${name}.map", "${dstname}.map";
    chdir $resDir;
    system qq~perl gen_faddr_res.pl "${dstname}.map" "${dstname}.faddr"~;
  }

  chdir($distrDir);
}

######################################################################
sub doCrypt {
die 'not implemented';
  my $prj = 'D:\Projects\WHDistrib\EXECrypt\run.ep2';
  my $outexe = $protClientDir . '\ok_sklad_' . $_[0] . ".exe\n";

  open ECPT, 'D:\Projects\WHDistrib\EXECrypt\template.ep2' or die "template.ep2: $!";
  open ECPR, ">$prj" or die "$prj: $!";

  while (<ECPT>) {
    if (/^\s*AppProtectedFile=/i ){
      $_ = "AppProtectedFile=$outexe\n";
    }
    print ECPR $_;
  }
  close ECPT;
  close ECPR;

  unlink($outexe);

  system("\"D:\\Projects\\WHDistrib\\EXECrypt\\execrypt.exe $prj");
  die('Crypt error') if $? != 0;
  unlink($clientSrcDir . 'ok_sklad.exe');
}

###################################################################3
sub readopts {
  $commonOptions = '';
  $debugOptions = '';
  my $commonOpts = '';

  my $section = \$commonOpts; # unnamed is for any section

  open OPT, 'build.opts' or die "build.opts: $!";
  while(<OPT>){
    chomp;
    next if /^\s*$/;
    next if /^\s*#/;

    if ( /^\[(\w+)\]/ ){ #section
      if ( $1 eq 'common' ){
        $section = \$commonOptions;
        $commonOptions = $commonOpts;

      } elsif ( $1 eq 'debug' ){
        $section = \$debugOptions;
        $debugOptions = $commonOpts;

      } else {
        die ("unknown option section: $_\n");
      }
      next;
    }

    if ( /"/ ) { # option have a space char, so it is quoted
      #s/"/\\"/g;

    } else {
      s/#?\s.*//; # del comments
    }

    $$section .=  ' ' . $_;
  }
  close OPT;
  #print "Common options: $commonOptions\nDebug options: $debugOptions\n";
}

#####################################################################################
#####################################################################################
#####################################################################################
sub parseDOF {
  my $dof = "$clientSrcDir\\ok_sklad.dof";

  print "\n\nParsing version info in $dof\n\n";

  my ($section, $val, $var);

  open IN, $dof or die "$dof: $!";
  #open OUT, ">$dof.new" or die "$dof.new: $!";

  while(<IN>){
    chomp;
    if ( /^\[/ ) {
      if( lc eq '[version info]' ) { $section = 1; }
      elsif ( lc eq '[version info keys]' ){ $section = 2; }
      else { $section = 0; }
      #print OUT $_, "\n";
      next;
    }

    if ( $section == 0 || ! /=/) {
      #print OUT $_, "\n";
      next;
    }

    s/^\s+//;
    s/\s+$//;
    ( $var, $val ) = split /\s*=\s*/;

    if ( $section == 1 ){ # [Version Info]
      if ( lc( $var ) eq 'majorver' ) {
        $dof_ver = $val;

      } elsif ( lc( $var ) eq 'minorver' ) {
        $dof_ver .= '.' . $val;

      } elsif ( lc( $var ) eq 'release' ) {
        $dof_ver .= '.' . $val;

      } elsif ( lc( $var ) eq 'build' ) {
        $val = int( '0' . $val );
        #$val = int( '0' . $val ) + 1;
        $dof_build = $val;
        $dof_fullver = $dof_ver . '.' . $val;

      } elsif ( lc( $var ) eq 'debug' ) {
        $var eq '1' and $dof_versuff .= '_Dbg';

      } elsif ( lc( $var ) eq 'prerelease' ) {
        $var eq '1' and $dof_versuff .= '_Pre';

      } elsif ( lc( $var ) eq 'special' ) {
        $var eq '1' and $dof_versuff .= '_Spc';
  
      } elsif ( lc( $var ) eq 'private' ) {
        $var eq '1' and $dof_versuff .= '_Pvt';

      }

    } else { # [Version Info Keys]
      if ( lc( $var ) eq 'fileversion' ) {
        $val = $dof_ver;

      } elsif ( lc( $var ) eq 'productversion' ) {
        $val = $dof_ver;

      }
    }
    
    #print OUT "$var=$val\n";
  }
  close IN;
  #close OUT;
  
  #rename $dof, $dof . '_BACKUP_' . $dof_ver . $dof_versuff;
  #rename $dof . '.new', $dof;
}

1;
