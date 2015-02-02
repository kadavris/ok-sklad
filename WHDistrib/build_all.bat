perl build_server.pl
if errorlevel 1 exit
perl build_client.pl 
if errorlevel 1 exit
perl Make.pl
make_distrib.bat
