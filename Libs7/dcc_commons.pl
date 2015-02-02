#!perl -w
# common functions for dccX.pl

# init globals and parse cmdline switches

my @onOff = ('Off', 'On');

sub dcc_init {
  $mainProject = 'D:\Projects\Production7';
  $componentsDir = 'D:\Projects\Libs7';

  $debug = 1;
  $warn = 1;
  $hints = 1;
  $quiet = 1;
  $buildall = 1;
  @debugKeys = ( ' -$D- -$L-', ' -V -$D+ -$L+' );
  @warnKeys = ( ' -W-', ' -W+' );
  @hintKeys = ( ' -H-', ' -H+' );
  @quietKeys = ( ' ', ' -Q' );
  @buildAllKeys = ( ' ', ' -B' );
  $KEYS = '-GD -$H+ -$M- -$O- -$U-';
  #$KEYS = '-B -Q';

  $ENV{'PATH'} .= 'D:\\Projects\\libs7\\lib\\bpl;D:\\Projects\\libs7\\lib\\dcu;D:\\Projects\\libs7\\lib\\dcp';

  $DIR = 'D:\\Projects\\Libs7\\lib'; -d $DIR or mkdir $DIR;
  $BPLDIR = $DIR . '\\bpl'; -d $BPLDIR or mkdir $BPLDIR;
  $DCPDIR = $DIR . '\\dcp'; -d $DCPDIR or mkdir $DCPDIR;
  $DCUDIR = $DIR . '\\dcu'; -d $DCUDIR or mkdir $DCUDIR;
  $RESDIR = $DIR . '\\res'; -d $RESDIR or mkdir $RESDIR;

  $libMode = 0;
  $DCUOUTDIR = ''; # use --lib switch to make it filled

  #-------------------------------------------------------------
  for $i (0 .. $#ARGV){
    if ( $ARGV[$i] =~ /^--/ ){
      if ( $ARGV[$i] =~ /^--lib/ ){ # library/package making
        $DCUOUTDIR = $DCUDIR;
        -d $DCUOUTDIR or mkdir $DCUOUTDIR;
        ++$libMode;
        $ARGV[$i] = '';

      } elsif ( $ARGV[$i] eq '--nd' ) {
        $debug = 0;
        $ARGV[$i] = '';

      } elsif ( $ARGV[$i] eq '--nw' ) {
        $warn = 0;
        $ARGV[$i] = '';

      } elsif ( $ARGV[$i] eq '--nh' ) {
        $hints = 0;
        $ARGV[$i] = '';

      } elsif ( $ARGV[$i] eq '--nq' ) {
        $quiet = 0;
        $ARGV[$i] = '';

      } elsif ( $ARGV[$i] eq '--nball' ) {
        $buildall = 0;
        $ARGV[$i] = '';

      } else { die "Invalid switch: $ARGV[$i]"; }
    }
    elsif ( $ARGV[$i] =~ /^-/ ){
      $KEYS .= ' ' . $ARGV[$i];
      $ARGV[$i] = '';
    }
  }

  $DCUOUTDIR ne '' and $KEYS .= ' -N' . $DCUOUTDIR;

  $includes = qq~-U"d:\\program files\\borland\\delphi7\\bin" -U$DCUDIR -R$RESDIR -U$BPLDIR -U$DCPDIR -I$mainProject -U$mainProject~
              . qq~ -U$mainProject\\ssbase -U$componentsDir\\ap -RD:\\Projects\\Libs7\\jcl\\jvcl\\resources~;
}

#-------------------------------------------------------------
sub dcc_compile {
  print "\n", '-' x 50, "\n";

  for my $wc (@ARGV){
    next if $wc eq '';

    #my @flist = split /\x0d\x0a/, `cmd /c dir /b "$wc"`;
    my @flist = ($wc);

    for my $file (@flist){
      chomp $file;

      my $K = $KEYS . $debugKeys[$debug] . $warnKeys[$warn] . $hintKeys[$hints] . $quietKeys[$quiet] . $buildAllKeys[$buildall];
      if ( $file =~ /\.dpk$/i ){
        $K .= " -DPKG -DNODESIGN -D_NODESIGN -E$BPLDIR -O$DCUDIR";
      }

      #($name = $file ) =~ s/\.[^.]+//;
      #movecfg('dof', 0);
      #movecfg('dsk', 0);
      #movecfg('cfg', 0);

      print ">>> Compiling $file :\n";
      print "User options: debug: $onOff[$debug], warnings: $onOff[$warn], hints: $onOff[$hints], quiet: $onOff[$quiet], build all: $onOff[$buildall]\n";
      my $cmd = $compiler;
      -f $cmd or substr($cmd, 0, 1) = 'd';
      $cmd = qq~"$cmd" "$file" $K $includes~;
      print '>>> ', $cmd, "\n";
      system $cmd;

      if ( $? != 0 ){
        die('!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!');

      } else {
        print "--------------  OK  ---------------\n";
      }

      if ( $libMode ){
        print "Copy/Move to common libdirs:\n";
        movefiles( '*.bpl', "$BPLDIR\\" );
        movefiles( '*.dcu', "$DCUDIR\\" );
        movefiles( '*.dcp', "$DCPDIR\\" );
        movefiles( '*.map', "$DIR\\map\\" );
        copyfiles( '*.res', "$RESDIR\\" );
        copyfiles( '*.dfm', "$RESDIR\\" );
      }
      print "\n";

      #movecfg('dof', 1);
      #movecfg('dsk', 1);
      #movecfg('cfg', 1);
    }
  }
}

#-----------------------------------------------------------------------------
sub movefiles {
  copyfiles($_[0], $_[1], 1);
}

sub copyfiles {
  my $dir = $_[1];
  my $move = (defined($_[2]) && $_[2] != 0)? 1 : 0;

  while (<$_[0]>){
    if ( $move ){
      system qq~move /y "$_" "$dir"~;
      $? or unlink($_);

    } else {
      system qq~copy /y "$_" "$dir" > nul~;
    }

    print "  $_ -> $dir: ", ( $? > 0 ? "ERROR\n" : 'OK' . ' 'x20 . "\r");
  }
}

#-----------------------------------------------------------------------------
sub movecfg {
  if ( $_[1] == 0 ){ # comment out
    -f "$name.$_[0]" and system qq~move "$name.$_[0]" "$name.${_[0]}_tmp"~;

  } else { # restore
    -f "$name.${_[0]}_tmp" and system qq~move "$name.${_[0]}_tmp" "$name.$_[0]"~;
  }
}
