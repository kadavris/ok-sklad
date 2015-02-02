#!perl -w

(undef,$minute,$hour,$mday,$mon,$year,undef) = localtime(time);
$year += 1900;
++$mon;

open CI, ">ok_server_compile_date.inc" or die "compile include: $!";

print CI "  compiledYear := ", $year, ";
  compiledMonth := ", $mon, ";
  compiledDay := ", $mday, ";
  compiledHour := ", $hour, ";
  compiledMinute := ", $minute, ";
  compiledDateStr := '", sprintf('%d-%02d-%02d %02d:%02d', $year, $mon, $mday, $hour, $minute), "';";
close CI;
