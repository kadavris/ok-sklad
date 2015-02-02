#!perl -w

print "\n\nBackupping old distrib\n";
@masks = qw~ok-sklad*.exe biz-oper*.exe ok-inventory*.exe~;

$found = 0;
foreach my $mask (@masks){
  open C, "dir /b \"$mask\"|" or die "dir $mask: $!";
  while(<C>){ /\.exe/i and ++$found; }
  close C;
}

print "Found $found files\n";

exit if ! $found;

#($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
(undef,undef,undef,$mday,$mon,$year,undef,undef,undef) = localtime(time);

#$lastDistr = sprintf 'LastDistr%d-%02d-%02d_%02d-%02d-%02d',$year+1900,$mon+1,$mday,$hour,$min,$sec;
$lastDistr = sprintf 'LastDistr%d-%02d-%02d',$year+1900,$mon+1,$mday;

if( (-d $lastDistr) or mkdir($lastDistr) ){
  foreach my $mask (@masks){
    system "move /y \"$mask\" \"$lastDistr\"";
  }
} else {
	print "backupOldDistr.pl: mkdir $lastDistr: $!\n";
}

