@echo off
if .%1==. exit

brcc32 %1.rc
if errorlevel 1 exit

move %1.res okres.res
dcc32 okres.pas
if errorlevel 1 exit

move okres.dll %1.dll
