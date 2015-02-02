@echo off
if not exist DCU mkdir DCU
if not exist BIN mkdir BIN
%Delphi%\bin\make.exe -s -B -DPROJECT=IdeSN -fAll.bpg