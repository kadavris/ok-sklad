#!perl -w

require 'c:\\bin\\bat\\dcc_commons.pl';
$compiler = 'c:\\Program Files\\Borland\\Delphi7\\bin\\dcc32.exe';
dcc_init();
dcc_compile();
exit;

=head
CodeGear Delphi for Win32 compiler version 20.0
Copyright (c) 1983,2008 CodeGear

Syntax: dcc32 [options] filename [options]

  -A<unit>=<alias> = Set unit alias
  -B = Build all units             
  -CC = Console target             
  -CG = GUI target                 
  -D<syms> = Define conditionals   
  -E<path> = EXE/DLL output directory
  -F<offset> = Find error          
  -GD = Detailed map file          
  -GP = Map file with publics      
  -GS = Map file with segments     
  -H = Output hint messages        
  -I<paths> = Include directories  
  -J = Generate .obj file          
  -JPHNE = Generate C++ .obj file, .hpp file, in namespace, export all
  -JL = Generate package .lib, .bpi, and all .hpp files for C++
  -K<addr> = Set image base addr   
  -LE<path> = package .bpl output directory
  -LN<path> = package .dcp output directory
  -LU<package> = Use package       
  -M = Make modified units         
  -N0<path> = unit .dcu output directory
  -NH<path> = unit .hpp output directory
  -NO<path> = unit .obj output directory
  -NB<path> = unit .bpi output directory
  -NS<namespaces> = Namespace search path
  -O<paths> = Object directories   
  -P = look for 8.3 file names also
  -Q = Quiet compile               
  -R<paths> = Resource directories 
  -U<paths> = Unit directories     
  -V = Debug information in EXE    
  -VR = Generate remote debug (RSM)
  -W[+|-|^][warn_id] = Output warning messages
  -Z = Output 'never build' DCPs   
  -$<dir> = Compiler directive     
  --help = Show this help screen   
  --version = Show name and version
  --codepage:<cp> = specify source file encoding
  --default-namespace:<namespace> = set namespace
  --depends = output unit dependency information
  --doc = output XML documentation 
  --drc = output resource string .drc file
  --no-config = do not load default DCC32.CFG file
  --description:<string> = set executable description
  --inline:{on|off|auto} = function inlining control
  --string-checks:{on|off} = string format checking (default: on)
  --peflags:<flags> = set extra PE Header flags field
  --peoptflags:<flags> = set extra PE Header optional flags field
  --peosversion:<major>.<minor> = set OS Version fields in PE Header (default: 5.0)
  --pesubsysversion:<major>.<minor> = set Subsystem Version fields in PE Header (default: 4.0)
  --peuserversion:<major>.<minor> = set User Version fields in PE Header (default: 0.0)
Compiler switches: -$<letter><state> (defaults are shown below)
  A8  Aligned record fields         
  B-  Full boolean Evaluation       
  C+  Evaluate assertions at runtime
  D+  Debug information             
  G+  Use imported data references  
  H+  Use long strings by default   
  I+  I/O checking                  
  J-  Writeable structured consts   
  L+  Local debug symbols           
  M-  Runtime type info             
  O+  Optimization                  
  P+  Open string params            
  Q-  Integer overflow checking     
  R-  Range checking                
  T-  Typed @ operator              
  U-  Pentium(tm)-safe divide       
  V+  Strict var-strings            
  W-  Generate stack frames         
  X+  Extended syntax               
  Y+  Symbol reference info         
  Z1  Minimum size of enum types    
