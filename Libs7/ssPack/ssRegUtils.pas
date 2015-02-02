unit ssRegUtils;

interface

uses
  Registry, Windows;

var
  ssRegUtils_Error: String;

function WriteToRegInt(const ARegKey, AValueName: string; AValue: Integer; const root: HKEY = HKEY_CURRENT_USER): boolean;
function ReadFromRegInt(const ARegKey, AValueName: string; var AValue: Integer; const root: HKEY = HKEY_CURRENT_USER): boolean;
function WriteToRegStr(const ARegKey, AValueName, AValue: string; const root: HKEY = HKEY_CURRENT_USER): boolean;
function ReadFromRegStr(const ARegKey, AValueName: string; var AValue: String; const root: HKEY = HKEY_CURRENT_USER): boolean;
function WriteToRegDate(const ARegKey, AValueName: string; AValue: TDateTime; const root: HKEY = HKEY_CURRENT_USER): boolean;
function ReadFromRegDate(const ARegKey, AValueName: string; var AValue: TDateTime; const root: HKEY = HKEY_CURRENT_USER): boolean;
function WriteToRegBool(const ARegKey, AValueName: string; AValue: Boolean; const root: HKEY = HKEY_CURRENT_USER): boolean;
function ReadFromRegBool(const ARegKey, AValueName: string; var AValue: Boolean; const root: HKEY = HKEY_CURRENT_USER): boolean;
function DropRegKey(const ARegKey: string; const root: HKEY = HKEY_CURRENT_USER): Boolean;
function DropRegValue(const ARegKey, AValueName: string; const root: HKEY = HKEY_CURRENT_USER): Boolean;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  StrUtils, SysUtils, Math;

var
  r: TRegistry;

//==============================================================================================
function DropRegValue(const ARegKey, AValueName: string; const root: HKEY = HKEY_CURRENT_USER): Boolean;
begin
  Result := True;
  ssRegUtils_Error := '';

  with r do
    try // except
      Access := KEY_ALL_ACCESS;
      RootKey := root;

      if not KeyExists(ARegKey) then Exit;

      if OpenKey(ARegKey, False) then try
        if ValueExists(AValueName) then Result := DeleteValue(AValueName)
        
      finally
        CloseKey;
      end;

    except
      on e: Exception do begin
        ssRegUtils_Error := 'DropRegValue(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '): ' + e.Message;
        Result := False;
      end;
    end;
end;

//==============================================================================================
function DropRegKey(const ARegKey: string; const root: HKEY = HKEY_CURRENT_USER): Boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
    try // except
      Access := KEY_ALL_ACCESS;
      RootKey := root;

      if KeyExists(ARegKey)
        then Result := DeleteKey(ARegKey)
        else Result := True;

    except
      on e: Exception do ssRegUtils_Error := 'DropRegKey(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '): ' + e.Message;
    end;
end;

//==============================================================================================
function valueIsValid(key,val: string; t: TRegDataType): Boolean; // internal
begin
  Result := False;
  if not r.ValueExists(val) then begin
    ssRegUtils_Error := 'Value not found: ' + Val + ' in ' + Key;
    Exit;
  end;

  if t <> r.GetDataType(Val) then begin
    ssRegUtils_Error := 'Value of wrong type: ' + Val + ' in ' + Key;
    Exit;
  end;
  Result := True;
end;

//==============================================================================================
function ReadFromRegDate(const ARegKey, AValueName: string; var AValue: TDateTime; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_READ;
      RootKey := root;

      if OpenKey(ARegKey, False) then begin
        if not valueIsValid(ARegKey, AValueName, rdBinary) then Exit;
        AValue := ReadDateTime(AValueName);
        Result := True;
      end;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'ReadFromRegDate(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;


//==============================================================================================
function WriteToRegDate(const ARegKey, AValueName: string; AValue: TDateTime; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_ALL_ACCESS;
      RootKey := root;

      if not OpenKey(ARegKey, True) then Exit;

      WriteDateTime(AValueName, AValue);
      Result := True;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'WriteToRegDate(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;

//==============================================================================================
function WriteToRegInt(const ARegKey, AValueName: string; AValue: Integer; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_ALL_ACCESS;
      RootKey := root;

      if not OpenKey(ARegKey, True) then Exit;

      WriteInteger(AValueName, AValue);
      Result := True;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'WriteToRegInt(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;

//==============================================================================================
function ReadFromRegInt(const ARegKey, AValueName: string; var AValue: Integer; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_READ;
      RootKey := root;

      if OpenKey(ARegKey, False) then begin
        if not valueIsValid(ARegKey, AValueName, rdInteger) then Exit;
        AValue := ReadInteger(AValueName);
        Result := True;
      end;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'ReadFromRegInt(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;

//==============================================================================================
function ReadFromRegStr(const ARegKey, AValueName: string; var AValue: string; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_READ;
      RootKey := root;

      if OpenKey(ARegKey, False) then begin
        if not valueIsValid(ARegKey, AValueName, rdString) then Exit;
        AValue := ReadString(AValueName);
        Result := True;
      end;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'ReadFromRegStr(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;

//==============================================================================================
function WriteToRegStr(const ARegKey, AValueName, AValue: string; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := False;
  ssRegUtils_Error := '';

  with r do
  try // finally
    try // except
      Access := KEY_ALL_ACCESS;
      RootKey := root;

      if not OpenKey(ARegKey, True) then Exit;

      WriteString(AValueName, AValue);
      Result := True;

    except
      on e: Exception do begin
        Result := False;
        ssRegUtils_Error := 'WriteToRegStr(' + ifThen(root = HKEY_CURRENT_USER, 'HKCU\', 'HKLM\') + ARegKey + '\' + AValueName + '): ' + e.Message;
      end;
    end;

  finally
    CloseKey;
  end;
end;

//==============================================================================================
function WriteToRegBool(const ARegKey, AValueName: string; AValue: Boolean; const root: HKEY = HKEY_CURRENT_USER): boolean;
begin
  Result := WriteToRegInt(ARegKey, AValueName, ifThen(AValue, 1, 0), root);
end;

//==============================================================================================
function ReadFromRegBool(const ARegKey, AValueName: string; var AValue: Boolean; const root: HKEY = HKEY_CURRENT_USER): boolean;
  var
    v: Integer;
begin
  AValue := False;
  Result := ReadFromRegInt(ARegKey, AValueName, v, root);
  if Result then AValue := (v <> 0);
end;

//==============================================================================================
initialization
  r := TRegistry.Create;
  r.LazyWrite := False;

//==============================================================================================
finalization
  r.Free;
end.
