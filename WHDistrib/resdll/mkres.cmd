@echo off
rem arg1: .rc file name w/o ext; arg2: output dll file name w ext
if .%1==. exit

brcc32 -fores.res "%1.rc"
if errorlevel 1 exit

dcc32 res.pas
if errorlevel 1 exit

move res.dll "%2"
