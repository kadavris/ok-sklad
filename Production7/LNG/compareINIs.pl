#!perl -w
# copying missing sections/vars from master file to dst file

$#ARGV < 1 and die 'args: master(complete)_file file_to_check';
my $mastername = $ARGV[0]; -f $mastername or die "$mastername: not found";
my $dstname = $ARGV[1]; -f $dstname or die "$dstname: not found";

readINI($dstname, \@dsecs, \@dvars, \@dvals);
readINI($mastername, \@msecs, \@mvars, \@mvals);

#print "! 1st pri: $dsecs[0]/$dvars[0]/$dvals[0]\n";
#exit;
#print "primary: $#dvars, secondary: $#mvars\n";

print "Checking\n";
$newvars = 0;

$sec = '';

for $si ( 0..$#dvars ){

#print "+ next primary: $si/$dsecs[$si]/$dvars[$si]\n";
	if ( $dsecs[$si] ne $sec ){ # new section
		print "+ new sec: $dsecs[$si]";

		if ( $sec ne '' && $dsb != -1 ){ # saving missing vars of master into dst
			for $di ( $dsb..$dse ){
				next if $msecs[$di] eq '';
				push @dsecs, $sec;
				push @dvars, $mvars[$di];
				push @dvals, $mvals[$di];
				$msecs[$di] = '';
				++$newvars;
			}
		}

		$sec = $dsecs[$si];

		$dsb = $dse = -1; # master sec begin/end idx
		for $di ( 0..$#msecs ){
			if ( $dsb == -1 ){
				if ( lc($sec) eq lc($msecs[$di]) ){
					$dsb = $di;
				}
				next;
			}

			if ( lc($sec) ne lc($msecs[$di]) ){ # end of sec found?
				$dse = $di - 1;
				last;
			}
		}
		$dse == -1 and $dse = $#msecs;
		print " range: $dsb - $dse\n";
	} # new sec

	next if $dsb == -1; # new section in primary

	$found = 0;
	for $di ( $dsb..$dse ){
    	if ( lc($dvars[$si]) eq lc($mvars[$di]) ){
			$msecs[$di] = ''; # marking found var
			++$found;
			last;
		}
	}

	#if( ! $found ){ print "\tnot found: $dsecs[$si]/$dvars[$si]\n" }

	#if ( ($si / ( $#dvars / 100 ) ) % 10 == 0 ){ $|=1; print '.'; $|=0; }
} # for dvars

$sec = '';
for $di ( 0..$#mvars ){
	next if $msecs[$di] eq ''; # saving missing sections of master into dst

	if ( $sec ne $msecs[$di] ){
		$sec = $msecs[$di];
	}
	push @dsecs, $sec;
	push @dvars, $mvars[$di];
	push @dvals, $mvals[$di];
	++$newvars;
	print "\tmissing var: $sec/$mvars[$di]\n";
}

print "\n$newvars missing vars\n";

print "\nSaving\n";
open OUT, ">$dstname.cmp" or die "$dstname.cmp: $!";

$sec = '';
for (sort scmp 0..$#dvars){
	if ( $sec ne $dsecs[$_] ){
		$sec = $dsecs[$_];
		print OUT "\n$sec\n";
	}
	print OUT $dvars[$_], '=', $dvals[$_], "\n";
}

close OUT;

############################################################################
sub readINI {
	@vars = (); @vals = (); @secs = ();
	#$asecs = $_[1]; $avars = $_[2];

	open INI, $_[0] or die "$_[0]: $!";

	print "\nparsing $_[0]\n";

	$secnum = 0;

	while(<INI>){
		s/^\s+//; 
        s/\s+$//;

		next if $_ eq '';

		if ( /^\s*\[/ ){ #section
			$currsec = $_;
			++$secnum;
			next;
		}

		push @secs, $currsec;

		/^([^=]+)\s*=\s*(.+)$/ or next;

		push @vars, $1;
		push @vals, $2;
	}

	close INI;

	print "Sorting\n";
	for ( sort ricmp 0..$#vars ){
		push @{$_[1]}, $secs[$_];
		push @{$_[2]}, $vars[$_];
		push @{$_[3]}, $vals[$_];
	}
	print "$secnum sections, $#vars variables\n";
}

############################################################################
sub ricmp {
	if ( lc($secs[$a]) ne lc($secs[$b]) ){ return lc($secs[$a]) cmp lc($secs[$b]); }

	return lc($vars[$a]) cmp lc($vars[$b]);
}

############################################################################
sub scmp {
	if ( lc($dsecs[$a]) ne lc($dsecs[$b]) ){ return lc($dsecs[$a]) cmp lc($dsecs[$b]); }

	return lc($dvars[$a]) cmp lc($dvars[$b]);
}
