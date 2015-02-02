unit protection;

interface

uses
  Classes;

const
  // return values for key checker (bit field)
  protKeyLoaded: Cardinal      =  1; // loaded succesful but not checked yet
  protKeyChecked: Cardinal     =  2; // Validity check completed (either with succes or not. just passed the routine)
  protKeyFileMissing: Cardinal =  4; // Missing file with key
  protKeyHIDChanged: Cardinal  =  8; // Hardware ID changed
  protKeyMissField: Cardinal   = 16; // Missing some field

  protKeyActPending: Cardinal  = $20000000; // Activation pending
  protKeyActTimeout: Cardinal  = $40000000; // Activation period limit timeout
  protKeyReserved: Cardinal    = $80000000; // hidden default for RegKeyIsValid() to check RegKeyCheckState

var
  CurrentHardwareID: String; // local HID
  RegHardwareID    : String; // HID from key
  RegInfo          : TStringList; // the key
  RegSysInfo       : TStringList; // system information

  RegUserName     : string;
  RegID           : string;
  RegEMail        : string;
  RegKey          : String; // encoded key as is
  RegKeyFile      : String; // path to file from which key was loaded last time

  RegKeyCheckState: Cardinal; // see protKey... constants

function GetHardwareID: string;
procedure GetSystemInfo;
function MakeHash(const s: string; size: integer): string;
function CheckRegKey: Boolean; // basic check of needed fields. fills RegKeyCheckState with protKey... constants
function CheckRegHardwareID: Boolean; // check for reg key hid and current hardware match
function decodeKey(const k: string): string;
function encodeKey(const k: string): string;
function LoadRegKey(const path: string = ''): Boolean;
function SaveRegKey(const path: string): Boolean;
function AssignRegKey(const key: string; Check: boolean = True): Boolean;
function RegKeyIsValid(AStatus: Cardinal = $80000000; checkActFlags: Boolean = False): Boolean; // helper to quckly tell whether key is usable or not

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF DEBUG}Dialogs,{$ENDIF}
  IdeInfo2, Windows, sysUtils, Registry, ssRegUtils, PJSysInfo, {ideSN,} synacode, StrUtils, DateUtils, Types;

//==============================================================================================
procedure Clear; // internal: clearing all info
begin
  RegKeyCheckState:= 0;

  RegHardwareID := '';
  RegInfo.Text := '';

  RegUserName := '';
  RegID := '';
  RegEMail := '';
  RegKey := '';
end;

//==============================================================================================
function RegKeyIsValid(AStatus: Cardinal = $80000000; checkActFlags: Boolean = False): Boolean; // helper to quckly tell whether key is usable or not
begin
  if AStatus = $80000000 then AStatus := RegKeyCheckState;

  Result :=
        (AStatus and protKeyLoaded = protKeyLoaded)
    and (AStatus and protKeyChecked = protKeyChecked)
    and (0 = (AStatus and (protKeyFileMissing or protKeyHIDChanged or protKeyMissField)));

  if Result and checkActFlags then begin // std fields is OK, now checking activation part if requested
    Result := (AStatus and protKeyActTimeout = 0)
              and (AStatus and protKeyActPending = 0)
              ;
  end;
end;

//==============================================================================================
function AssignRegKey(const key: string; Check: boolean = True): Boolean;
begin
  Clear;

  RegKey := trim(key);
  RegInfo.Text := decodeKey(RegKey);
  RegKeyCheckState := protKeyLoaded;

  if Check
    then Result := CheckRegKey
    else Result := True;
end;

//==============================================================================================
function LoadRegKey(const path: string = ''): Boolean;
  var
    f: Text;
    s: String;
begin
  Clear;

  try
    if path <> '' then begin
      AssignFile(F, path);
      RegKeyFile := '';
    end
    else AssignFile(F, RegKeyFile);

    {$I-}
    Reset(F);
    try
      while not eof(f) do begin
        readln(F, s);
        RegKey := RegKey + trim(s);
      end;
    finally
    end;
    CloseFile(F);
    {$I+}

    RegKeyCheckState := protKeyLoaded;
    RegInfo.Text := decodeKey(RegKey);

  except
    Clear;
    RegKeyCheckState := protKeyFileMissing;
  end;

  if RegKeyCheckState = protKeyLoaded
    then Result := CheckRegKey
    else Result := False;

  if Result then RegKeyFile := path;
end;

//==============================================================================================
function SaveRegKey(const path: string): Boolean;
  var
    f: Text;
begin
  if RegKey = '' then begin
    Result := False;
    Exit;
  end;

  Result := True;

  try
    AssignFile(F, path);
    {$I-}
    Rewrite(F);
    writeln(F, RegKey);
    CloseFile(F);
    {$I+}
    RegKeyFile := path;

  except
    Result := False;
  end;
end;

//==============================================================================================
function encodeKey(const k: string): string;
  var
    i: integer;
    s: string;
begin
  s := '';
  for i := 1 to 9 do
    if random(2) > 1
      then s := s + chr(ord('A') + random(20))
      else s := s + chr(ord('a') + random(20));
  Result := s;

  s := EncodeBase64(AnsiReverseString(EncodeBase64(k)));
  Result := MidStr(s, 0, 4) + Result + MidStr(s, 5, length(s));
end;

//==============================================================================================
function decodeKey(const k: string): string;
begin
  Result := DecodeBase64(
              AnsiReverseString(
                DecodeBase64(
                  MidStr(k, 0, 4) + MidStr(k, 14, length(k))
                )
              )
            );
end;

//==============================================================================================
function CheckRegKey: Boolean;
  var
    i: integer;
begin
  if RegKeyCheckState <> protKeyLoaded then begin
    Result := False;
    Exit;
  end;
  
  RegKeyCheckState := (RegKeyCheckState or protKeyChecked);

  if RegInfo.Count < 2 then RegInfo.Text := AnsiReplaceStr(RegInfo.Text, #10, #13#10);

  i := RegInfo.IndexOfName('user');
  if i = -1
    then RegKeyCheckState := RegKeyCheckState or protKeyMissField
    else RegUserName := trim(RegInfo.ValueFromIndex[i]);

  i := RegInfo.IndexOfName('id');
  if i = -1
    then RegKeyCheckState := RegKeyCheckState or protKeyMissField
    else RegID := trim(RegInfo.ValueFromIndex[i]);

  i := RegInfo.IndexOfName('email');
  if i = -1
    then RegKeyCheckState := RegKeyCheckState or protKeyMissField
    else RegEmail := trim(RegInfo.ValueFromIndex[i]);

  i := RegInfo.IndexOfName('hardwareid');
  if i = -1
    then RegKeyCheckState := RegKeyCheckState or protKeyMissField
    else begin
      RegHardwareID := trim(RegInfo.ValueFromIndex[i]);

      CheckRegHardwareID;
    end;

  Result := RegKeyIsValid;

  if not Result then Clear;
end;

//==============================================================================================
function CheckRegHardwareID: Boolean;
  var
    s: String;
    i, hidchanged, hidcount: Integer;
begin
  CurrentHardwareID := GetHardwareID;

  Result := True;
  hidchanged := 0;
  hidcount := 0;

  s := '';

  i := 0;
  while i < length(CurrentHardwareID) do begin
    inc(hidcount);

    if AnsiLowerCase(MidStr(CurrentHardwareID, i, 8)) <> AnsiLowerCase(MidStr(RegHardwareID, i, 8))
    then begin
      inc(hidchanged);
      s := s + IntTostr(hidcount) + ',';
    end;

    inc(i, 8);
  end;

  if hidchanged > 0 then RegSysInfo.Values['Changed'] := s;

  if (hidcount < 2) or (hidchanged > 2) then Result := False;

  if not Result then RegKeyCheckState := RegKeyCheckState or protKeyHIDChanged;

  (*
    {$IFDEF DEBUG}MessageDlg('key hardwareid mismatch. key: "' + RegHardwareID +'", THIS: "'
                  +CurrentHardwareID+'"', mtError, [mbOk], 0);{$ENDIF}
  *)

  //if Result then RegKeyCheckState := (RegKeyCheckState or protKeyChecked); // set to checked-ok
end;

//==============================================================================================
function MakeHash(const s: string; size: Integer): string;
  var
    r: string;
    i,n: integer;
begin
  r := '';

  for i := 1 to size do r := r + chr(i mod 255);

  n := 0;

  for i := 1 to length(s) do begin
    inc(n);
    if n > size then n := 1;
    r[n] := chr(ord(r[n]) xor ord(s[i]));
  end;

  for i := 1 to size do r[i] := chr(ord(r[i]) mod 92 + 33); //squeezing it roughly to printable chars
  Result := r;
end;

//==============================================================================================
procedure GetSystemInfo;
  const
    CPUArch: array[TPJProcessorArchitecture] of string = (
      'Unknown',    // Unknown architecture
      'X64',        // X64 (AMD or Intel)
      'IA64',       // Intel Itanium processor family (IPF)
      'X86'         // Intel 32 bit
    );

  var
    osinfo: TPJOSInfo;
    compinfo: TPJComputerInfo;
    s: String;
    i: Integer;
begin
  if RegSysInfo.Count <> 0 then RegSysInfo.Clear;

  try
    // this section uses unit PJSysInfo
    osinfo := TPJOSInfo.Create;

    s := osinfo.ProductName + ' ' + osinfo.Edition + ' ' + IntToStr(osinfo.MajorVersion) + '.' + IntToStr(osinfo.MinorVersion) + ' (';

    if osinfo.isServer then s := s + ' Server';
    if osinfo.IsWin32s then s := s + ' Win32s';
    if osinfo.IsWin9x then s := s + ' Win9x';
    if osinfo.IsWinNT then s := s + ' WinNT';
    if osinfo.IsWow64 then s := s + ' Wow64';
    if osinfo.IsMediaCenter then s := s + ' MediaCenter';
    if osinfo.IsTabletPC then s := s + ' TabletPC';

    RegSysInfo.Values['OS'] := s + ')';

    RegSysInfo.Values['OSDesc'] := osinfo.Description;
    RegSysInfo.Values['OSBuild'] := IntToStr(osinfo.BuildNumber);
    RegSysInfo.Values['OSSP'] := osinfo.ServicePack + '(' + IntToStr(osinfo.ServicePackMajor) + '.' + IntToStr(osinfo.ServicePackMinor) + ')';

    RegSysInfo.Values['HIDProductID'] := osinfo.ProductID;
    osinfo.Free;

    compinfo := TPJComputerInfo.Create;

    RegSysInfo.Values['ComputerName'] := trim(compinfo.ComputerName);
    RegSysInfo.Values['MACAddress'] := compinfo.MACAddress;
    RegSysInfo.Values['UserName'] := compinfo.UserName;
    RegSysInfo.Values['CPUCount'] := IntToStr(compinfo.ProcessorCount);

    try
      s := CPUArch[compinfo.Processor];
    except
      s := 'Unregistered CPU architecture';
    end;

    if compinfo.Is64Bit
      then s := s + ' x64'
      else s := s + ' x32';

    RegSysInfo.Values['CPUArch'] := s;

    compinfo.free;

    // hash section 3. this section uses unit ideSN

    RegSysInfo.Values['IDESN'] := GetIdeDiskSerialNumber; // unit IdeInfo2: get 1st valid S/N
    for i := 0 to ideInfoStrings.Count - 1 do RegSysInfo.Add('IdeInfo2_' + ideInfoStrings.Strings[i]);

    { // old idesn code. just in case
    i := 0; // trying to poll scsi0 to scsi9 in order to find something appropriate
    while i < 10 do begin
      s := trim(GetIdeDiskSerialNumber(i));

      if s = '' then begin
        if i = 0 then begin // anti-pollution: no error reporting for other devices
          n := GetLastError;
          if n = 0
            then s := 'no S.M.A.R.T. support'
            else if n <> 2 then s := 'GetIdeDiskSerialNumber error ' + IntToStr(n) + ': ' + SysErrorMessage(n);
        end;
      end
      else if RegSysInfo.Values['IDESN'] = '' then RegSysInfo.Values['IDESN'] := s; // registering 1st succeful as the hardware key

      if s <> '' then RegSysInfo.Values['IDEDevice' + IntToStr(i) + 'SN'] := s;
      inc(i);
    end;
    }

    if not ReadFromRegStr('HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'ProcessorNameString', s, HKEY_LOCAL_MACHINE) then s := 'ERROR';
    RegSysInfo.Values['RegCPUName'] := s;

    if not ReadFromRegStr('HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'Identifier', s, HKEY_LOCAL_MACHINE) then s := 'ERROR';
    RegSysInfo.Values['RegCPUID'] := s;

    if not ReadFromRegStr('HARDWARE\DESCRIPTION\System\CentralProcessor\0', 'VendorIdentifier', s, HKEY_LOCAL_MACHINE) then s := 'ERROR';
    RegSysInfo.Values['RegCPUVendor'] := s;

  except
    on e: Exception do RegSysInfo.Values['STATE'] := 'Exception in GetSystemInfo: ' + e.Message;
  end;
end;

//==============================================================================================
function GetHardwareID: string;
  var
    s: string;
    i: integer;
begin
  Result := '';
  s := '';

  // hash section 1
  s := s + MakeHash(RegSysInfo.Values['ComputerName'], 4);
  // hash section 2
  s := s + MakeHash(RegSysInfo.Values['MACAddress'], 4);

  // hash section 3. this section uses unit ideSN
  s := s + MakeHash(RegSysInfo.Values['IDESN'], 4);

  // hash section 4. this is just plain registry
  if RegSysInfo.Values['RegCPUID'] <> 'ERROR'
    then s := s + MakeHash(RegSysInfo.Values['RegCPUID'] + RegSysInfo.Values['RegCPUVendor'], 4)
    else s := s + MakeHash(RegSysInfo.Values['CPUArch'], 4);

  for i := 1 to length(s) do Result := Result + IntToHex(ord(s[i]),2);
end;

//==============================================================================================
initialization
  RegInfo := TStringList.Create;
  RegSysInfo := TStringList.Create;
  GetSystemInfo;

  CurrentHardwareID := GetHardwareID;

  Clear;

//==============================================================================================
finalization

end.
