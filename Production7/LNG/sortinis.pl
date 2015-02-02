#!perl -w

for my $ini (<*.lng>){
	next if $ini =~ /\.sorted\.lng/i;

	($inisorted = $ini ) =~ s/\.lng$/.sorted.lng/i;
	($inidup = $ini ) =~ s/\.lng$/.dups.lng/i;
	open INI, $ini or die "$ini: $!";
	open OUT, ">$inisorted" or die "$inisorted: $!";
	open DUP, ">$inidup" or die "$inidup: $!";

	print "processing $ini\n";

	@rs = ();
	@sec = ();
	$currsec = '';

	while(<INI>){
		s/^\s+//; 
		s/\s+$//;

		next if $_ eq '';

		if ( /^\[/ ){ #section
			$currsec = $_;
			next;
		}

		push @sec, $currsec;
		push @rs, $_;
	}

	close INI;

	@idx = sort mycmp 0..$#rs;

	$currsec = '*';
    $lastvar = '';
    $dups = 0;
	for ( 0..$#idx ) {
		my $i = $idx[$_];

		if ( lc($sec[$i]) ne lc($currsec) ){
			$currsec = $sec[$i];
			print OUT "\n$currsec\n";
		}

		print OUT $rs[$i], "\n";

        if ( $lastvar eq lc($rs[$i]) ) {
          print DUP "$currsec $rs[$i]\n";
          ++$dups;
        }
        $lastvar = lc($rs[$i]);
	}
	close OUT;
    close DUP;
    $dups > 0 or unlink "$inidup";
}

sub mycmp {
    my $sa = lc($sec[$a]);
	my $sb = lc($sec[$b]);

	if ( $sa lt $sb ){ return -1; }
	elsif ( $sa gt $sb ){ return 1; }

	my $ra = lc($rs[$a]);
	my $rb = lc($rs[$b]);

	if ( $ra lt $rb ){ return -1; }
	elsif ( $ra gt $rb ){ return 1; }
	return 0;
}
