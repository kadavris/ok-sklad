#!perl -w

require 'paths.pl';
require 'build_common.pl';
$build = 'c'; #client
$commonOptions .= ' -GD';


parseDOF();


open CLOG, '>>Changelog.txt';
print CLOG "\n\n$dof_fullver (Built $date $time)\n";
close CLOG;


setCompileDate();


if ( $#ARGV != -1 ){
  print "\n\nBuilding $ARGV[0] type by request\n\n";
  dobuild($ARGV[0]);

} else {
  dobuild('free');
  dobuild('com');
  #dobuild('gold');

  #dobuild('beta');
}

chdir $clientSrcDir and system 'ok_sklad_build_debug.bat';


########################################################
sub setCompileDate {
  open CI, ">$clientSrcDir\\ok_sklad_compile_date.inc" or die "compile include: $!";

  print CI "  compiledYear := ", $year, ";
    compiledMonth := ", $mon, ";
    compiledDay := ", $mday, ";
    compiledHour := ", $hour, ";
    compiledMinute := ", $minute, ";
    compiledDateStr := '", sprintf('%d-%02d-%02d %02d:%02d', $year, $mon, $mday, $hour, $minute), "';

    MaxFreeDays := 90;
  ";

  close CI;
}
