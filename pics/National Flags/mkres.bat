@echo off
rem mkres.pl

brcc32 countrycodes.rc
if errorlevel 1 exit

dcc32 countrycodes.pas
