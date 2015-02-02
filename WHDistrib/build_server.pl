#perl -w
require 'paths.pl';
require 'build_common.pl';

readopts();
setcompiledate();

$build = 's'; #server

$commonOptions .= ' -GD -DSERVER';

#$commonOptions .= ' -DDEBUG';

if ( $#ARGV != -1 ){
  print "\n\nBuilding $ARGV[0] type by request\n\n";
  dobuild($ARGV[0]);

} else {
  foreach $type (qw~free com~){
    dobuild($type);
  }
}

dobuild('debug');

###################################################################3
sub setcompiledate {
  open CI, ">$serverSrcDir\\ok_server_compile_date.inc" or die "compile include: $!";

  print CI "    compiledYear := ", $year + 1900, ";
    compiledMonth := ", $mon + 1, ";
    compiledDay := ", $mday, ";
    compiledHour := ", $hour, ";
    compiledMinute := ", $minute, ";
    compiledDateStr := '", sprintf('%d-%02d-%02d %02d:%02d', $year, $mon, $mday, $hour, $minute), "';";
  close CI;
}
