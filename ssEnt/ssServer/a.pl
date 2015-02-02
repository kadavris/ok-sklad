open IN, 'aa';
$r = 0;
$fc = 0;
while(<IN>){
	@f = split /\t/;
	next if $#f < 0;
	$fc = $#f;
	++$r;
	CHK:for($i = 0 ; $i <= $#f; ++$i){
		if(length($f[$i]) >= 255){
			print $_;
			last CHK;
		}
	}
}
close IN;

print "$r recs, $fc fields\n";
