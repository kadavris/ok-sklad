unit ssWinVer;

interface

function IsWin95: Boolean;
function IsWin98: Boolean;
function IsWinMe: Boolean;
function IsWinNT: Boolean;
function IsWin2k: Boolean;
function IsWinXP: Boolean;
function IsNTPlatform: Boolean;

implementation

uses Windows;

function IsWin98: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 10) and (WInfo.dwMajorVersion = 4);
end;

function IsWin95: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 0) and (WInfo.dwMajorVersion = 4);
end;

function IsWinNT: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 51) and (WInfo.dwMajorVersion = 3);
end;

function IsWin2k: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 0) and (WInfo.dwMajorVersion = 5);
end;

function IsWinXP: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 1) and (WInfo.dwMajorVersion = 5);
end;

function IsWinMe: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := (WInfo.dwMinorVersion = 90) and (WInfo.dwMajorVersion = 4);
end;

function IsNTPlatform: Boolean;
var
  WInfo: _OSVERSIONINFO;
begin
  Result := False;
  WInfo.dwOSVersionInfoSize := SizeOf(WInfo);
  if GetVersionEx(WInfo) then
    Result := WInfo.dwPlatformId = VER_PLATFORM_WIN32_NT;
end;

end.
