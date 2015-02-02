#!perl -w

#readCfg();

$skipFunc = 0; # skip functions processing
$onlyNew = 1; # process only the files unprocessed before

while ( @ARGV > 0 ){
  $_ = pop @ARGV;
  /-s/ and ++$skipFunc;
  /-n/ and $onlyNew = 0;
}

$unitIDnum = 0;
$unitIDstr = 'DEBUG_unit_ID';
$unitDSstr = 'Debugging';
$unitGRPstr = 'DEBUG_group_ID';

$dVar     = '_udebug';
$dVarDef  = "  {\$IFDEF UDEBUG}var $dVar: Tdebug;{\$ENDIF}\n";
$dVarInit = "  {\$IFDEF UDEBUG}if $unitDSstr then $dVar := Tdebug.Create(debugLevelHigh, $unitIDstr, '\$fname') else $dVar := nil;{\$ENDIF}\n\n";
$dVarFree = q~"
$indent  {\$IFDEF UDEBUG}if $dVar <> nil then $dVar.Destroy;{\$ENDIF}
"~;

$debugTryCode = "  try // inserted by UDEBUG processor\n";
$debugExceptCode = q~"  except // inserted by UDEBUG processor
    on e: exception do begin
      debugInstantLog('error at $unit/$place: ' + e.Message);
      e.Create('error at $unit/$place: ' + e.Message);
    end;
  end; // try

"~;

@keywords = qw~asm class try case begin end exit function procedure constructor destructor unit interface implementation initialization finalization uses~;

$cwd = `cd`;
open LIST, 'dir /b/s *.pas|' or die "LIST: $!";

while (<LIST>){
  chomp;

  $file = $basename = $path = $_;
  $basename =~ s/^.*\\//;
  $path =~ s/\\[^\\]+$//;
  chdir($path) or die("chdir($path): $!");

  $fileorig = $file . '.GCFBAK';

  if ( ! -f $fileorig ){
    rename( $_, $fileorig ) or die "ren '$_' -> '$fileorig': $!";
  } elsif ( $onlyNew ){
    next; # only unprocessed
  }

  print '*' x 30, "\n* source: $file\n";
  open CODE, $fileorig or die "$fileorig: $!";

  $line = 0;
  $cmt = '';

  $unit = '';
  $int = $imp = $ini = $fin = -1;

  @bname = ();
  @blockb = ();
  @blocke = ();
  @blockt = ();
  @level = ();

  @code = ();

  $place = '';
  $instr = 0;

  $noProcess = 0; # if this file was already processed

  while(<CODE>){ # reading code and preformatting
    ++$line;

    if ( $place eq '' && $noProcess == 0 && /udebug/i ){
      ++$noProcess;
    }

    if ( $noProcess ){
      push @code, $_;
      next;
    }

    if ( /^(\s+)/ ){
      $indent = $1; # storing spaces at the line beginning
    } else {
      $indent = '';
    }

    @l = split '';

    $pushfrom = 0;
    for ( $i = 0; $i <= $#l; ++$i ){

      if ( $cmt ne '' ) { # checking for comment end
        if ( $cmt eq '{' && $l[$i] eq '}' ){
          $cmt = '';

        } elsif ( $cmt eq '(*' && $i + 1 <= $#l && $l[$i] eq '*' && $l[$i+1] eq ')' ){
          $cmt = '';
          ++$i;
        }
        next;

      } else { # not in comments

        # string begin/end
        if ( $l[$i] eq "'" ){
          my $ii = $i;
          while ( $ii <= $#l && $l[$ii] eq "'"){ ++$ii; }
          $ii = $ii - $i;
          $i += $ii - 1; # skipping the rest

          if ( $ii % 2 == 1 ){ # only odd number of quotes changes state
            $instr ^= 1;
          }
          next;

        } 

        next if $instr;

        # check for comments
        if ( $l[$i] eq '{' ){
          pushCode($i - 1);
          $cmt = '{';

        } elsif ( $i + 1 <= $#l && $l[$i] eq '(' && $l[$i+1] eq '*' ){
          pushCode($i - 1);
          $cmt = '(*';
          ++$i;

        } elsif ( $i + 1 <= $#l && $l[$i] eq '/' && $l[$i+1] eq '/' ){
          pushCode($i - 1);
          $i = $#l;
          next;

        } else { # analysing keywords here

          next if $l[$i] =~ /\W/;

          my $found = '';
          for (@keywords) {
            my $len = length ($_);
            my $pos = $i - $len + 1;
            next if $pos < 0;
#$line==79 and print " : check: '$_' l: $len, p: $pos, i: $i ('",$l[$pos-1],"','$l[$i]')\n";

            if ( $pos > 0 && $l[$pos-1] =~ /[a-z_.]/i ){ next; }
            if ( $i < $#l && $l[$i+1] =~ /[a-z_]/i ){ next; }

            next if $_ ne lc(join '', @l[$pos..$i]);

            $found = $_;
            last;
          }

          next if $found eq '';

#print " > $line: $#level. kw: $found\n";

          if ( $found eq 'class' or $found eq 'try' or $found eq 'case' ){
            next if $imp == -1;

            push @bname,  '';
            push @level,  $line;
            push @blockb, $line;
            push @blocke, -1;
            push @blockt, $found;


          } elsif ( $found eq 'begin' || $found eq 'asm' ){
            my $fname = $bname[0];
            push @bname,  '';
            push @level,  $line;
            push @blockb, $line;
            push @blocke, -1;
            push @blockt, $found;

            if ( $#level == 1 && $found ne 'asm' && ! $skipFunc  && lc($fname) ne 'register'){
              pushCode($i - length($found) );
              $i > 4 and push @code, "\n";
              push @code, $dVarDef;
              pushCode($i);
              push @code, "\n";
              ( my $vi = $dVarInit ) =~ s/\$fname/$fname/gi;
              push @code, $vi;

            } else {
              pushCode($i);

            }


          } elsif ( $found eq 'end' ){
            next if $imp == -1;

            pushCode($i - 3);

            if ( $#level == -1 ){ # end of unit
              if ( $ini == -1 ){
                push @code, "\n\ninitialization\n$initCode";
              }

              if ( $fin == -1 ){
                push @code, "\n\nfinalization";
              }
              push @code, "\n$finalCode\n";

            } else {
              # removing 'begin'/'asm' from stack
              pop @bname;
              pop @level;
              pop @blockb;
              pop @blocke;
              my $bt = pop @blockt;

              if ( $#level > -1 && $blockt[$#blockt] eq 'f' ){ # end of func?
                $fname = pop @bname;
                pop @level;
                pop @blockb;
                pop @blocke;
                pop @blockt;
              }

              if ( $bt ne 'asm' && lc($fname) ne 'register' && ! $skipFunc ) {
                $#level == -1 and push @code, "\n" . eval $dVarFree;
              }
              pushCode($i);
            }


          } elsif ( $found eq 'exit' ){
            # checking if it function level 0 only
            my $f = 0;
            for ( @blockt[1..$#level] ){ if( $_ eq 'f' ){ $f = 1; last; } }

            if ( ! $f ){
              pushCode($i - 4);
              if ( ! $skipFunc ){
                push @code, ' begin' . eval $dVarFree;
                push @code, "$indent  ";
                pushCode($i+1); # pushing ; too
                push @code, "\n${indent}end;\n";
              }
            }


          } elsif ( $found eq 'function' || $found eq 'procedure' || $found eq 'constructor' || $found eq 'destructor'){
            next if $imp == -1;

            if ( $i < $#l && $l[$i+1] eq ';' ){ next; } # skipping type-as-procedure declarations

            my $funcname = '';
            my $p = $i+1;
            while( $l[$p] =~ /\s/ ){ ++$p; }
            while( $l[$p] =~ /[\w.]/i ) { $funcname .= $l[$p]; ++$p; }
            $i = $p; # saving time

            if ( $#blockt != -1 && $blockt[$#blockt] eq 'class' && $blockb[$#blockb] == $line ){
              # it's "class function", etc, so cleaning up
              pop @bname;
              pop @level;
              pop @blockb;
              pop @blocke;
              pop @blockt;
            }
            push @bname,  $funcname;
            push @level,  $line;
            push @blockb, $line;
            push @blocke, -1;
            push @blockt, 'f';


          } elsif ( $found eq 'uses' ){
            next if $imp == -1;

            pushCode($i);
            push @code, "\n  {\$IFDEF UDEBUG}\n  uses udebug, sysutils;\n  var $unitIDstr: Integer; $unitDSstr: Boolean; $unitGRPstr: String = '';\n  {\$ENDIF}\n\n";


          } elsif ( $found eq 'unit' ){
            push @code, "//UDEBUG code already inserted. Please do not remove this line.\n";
            $unit = '';
            my $p = $i+1;
            while( $l[$p] =~ /\s/ ){ ++$p; }
            while( $l[$p] =~ /\w/i ) { $unit .= $l[$p]; ++$p; }

            $initCode = "  {\$IFDEF UDEBUG}\n  $unitDSstr := False;\n  $unitIDstr := debugRegisterUnit('$unit', \@$unitDSstr, $unitGRPstr);\n  {\$ENDIF}\n";
            $finalCode = "  {\$IFDEF UDEBUG}\n  //debugUnregisterUnit($unitIDstr);\n  {\$ENDIF}\n";


          } elsif ( $found eq 'interface' ){
            $int = $line;  $place = 'int';


          } elsif ( $found eq 'implementation' ){
            $imp = $line;  $place = 'imp';
            pushCode($i);
            #push @code, "\n  {\$IFDEF UDEBUG}\n  uses udebug, sysutils;\n  var $unitIDstr: Integer; $unitDSstr: Boolean; $unitGRPstr: String = '';\n  {\$ENDIF}\n\n";


          } elsif ( $found eq 'initialization' ){
            $ini = $line; $place = 'ini';
            pushCode($i);
            push @code, "\n$initCode";
            push @code, $debugTryCode;


          } elsif ( $found eq 'finalization' ){
            my $ec = eval $debugExceptCode;
            $place eq 'ini' and push @code, $ec;
            $fin = $line; $place = 'fin';


          }
        } # if ($l eq ...
      } # not a comment
    } # for $i
    pushCode($#l);
  } # while <CODE>

  close CODE;


  open OUT, ">$file" or die "$file: $!";
  for (@code){ print OUT $_; }
  close OUT;
}
chdir($cwd);

#######################################################3
sub pushCode {
  if ( $_[0] >= 0 ){
    push @code, join '', @l[$pushfrom..$_[0]];
    #print " >> pushCode: '",join '', @l[$pushfrom..$_[0]],"'\n";
    #push @iscode, $_[1];
    #push @srclnum, $line;
  }
  $pushfrom = $_[0]+1;
}
