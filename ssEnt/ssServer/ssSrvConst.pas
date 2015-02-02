{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit ssSrvConst;

interface

uses
  Windows, Classes, DBClient, ssSrvDB, ssSrvTypes, xClasses, xLngDefs;

const
  DBDefaultExt = '.gdb';
  regKeyExceptions = 'Exceptions'; // total exceptions caught
  serverExeMapFile = 'borlfl32.dat';

  pSysProviders_List = 'pSysProviders_Get';
  pSysDB_List        = 'pSysDB_List';
  pSysRsv_List       = 'pSysRsv_List';
  pSysDBParams_List  = 'pSysDBParams_List';
  pSysUsers_List     = 'pSysUsers_List';
  pSysActiveUsers_List = 'pSysActiveUsers_List';

  LangDir = 'LNG';
  MinClientVer = '2.1.5.1';

var
  sqlServerAddr : string = ''; // empty for local
  DBdriver      : string = ''; // filled in InitSysproviders

  Version       : string = '1.0.0';
  FullVersionNo : string = '1.0.0.0';

  BackupSvcRegKey : string = 'Software\Operator\BackupSvc';
  MainRegKey      : string = 'Software\Operator\Sklad';
  ServerRegKey    : string = 'Software\Operator\Server';
  nonActStop      : string = 'LogLastRec'; // keyname containing date to stop operations if not activated
  nextKeyCheck    : string = 'LogRotate';  // next date of key validity check at our WWW

  resDllHandle    : THandle;

  UserDBPath      : string = 'userdb\'; // '\' at end is mandatory!
  ExtTblPath      : string = 'ext\'; // used to store external tables when copying old db data to new one

  UserDefDBName   : string = 'workdb';
  XMLDataDir      : string = '';
  defaultProvDir  : string = 'xml\';
  SysProvFile     : string = 'provgroups.xml';
  SySDBFile       : string = 'databases.xml';
  SySDBParamsFile : string = 'dbparams.xml';
  SysProvTextFile : string = 'provtext.xml';
  SysUsersFile    : string = 'users.xml';
  LogFileName     : string = 'ok-server.log';

  EmptyDBFile     : string = 'emptydb';

  EmptyDBSQL      : string = 'emptydb.sql';
  EmptyDBData     : string = 'dbdata.sql';

  dbAdminDefName  : string = 'SYSDBA';
  dbAdminDefPass  : string = 'masterkey';

  DBsLockedTimeOut: cardinal = 10000;
  QueueCheckInterval : cardinal = 2000;

  ProvidersLocked   : boolean = False;

  rdmCount: Integer = 0; // active TremoteDataModules count (for logging purposes now)

  SysIniFile : string = 'ok_server.ini';

  serverPath  : string = '';

  xSrvDB : TxSrvDB;
  xQueue : TxQueue;

  SingleUserOwner: pointer = nil; // client object that set the singleuser

  ProvExecLogging : boolean = False;
  CheckForDeadConnections : boolean = True;
  MaxLogBackupsQuantity: Cardinal = 5;
  MaxLogSize : Cardinal = 100;

  servAuthMsg : TStringList;
  FNextProtCheck: TDateTime; // next protection check schedule

  cmdLineDebug: Boolean;
  DebugLevel:   Integer;

  justRegister: Boolean = False; // True if -regsvr cmd line key present.
  compiledYear, compiledMonth, compiledDay, compiledHour, compiledMinute: Integer;
  compiledDateStr: string;
  
  //--------------------------------------------------------------------------
  function InitializeServer: string;
  function CheckUsers: Boolean;
  function BuildConnString(AValues: TStringList): string;

  procedure LockProvider;
  procedure UnLockProvider;

  procedure CheckLogFile;
  function CheckSocketserver: Boolean;

  procedure LogEvent(const tolog: string; const ADebugLevel: Integer = 0);
  procedure LogError(const S: string);
  procedure AddToStack(S: string; const ADebugLevel: Integer = 0);
  function  GetLogStack(html: Boolean; const ADebugLevel: Integer = 0): String;

  function  GetConnString(var ADBID: integer; var ADBPath: string): string;

  procedure SetNextRegCheck;
  procedure ClearRegCheck;
  procedure needActivation;
  function  ProtCheck: Boolean;

  function  GetSysError(ACode: Integer = 0): String;
  procedure DieOnSysError(Amsg: String);

  function isProcessRunning(const s: String): Boolean;
  function GetDir(AWhere: String; var AOut: String): Integer; // used to mimic file save/open dialog at client's side
  function SetSingleUserMode(AID: Pointer; ASwitch: Boolean): Integer; // AID- ptr to TxClient owner object

  function OK_URL: string;
  function OK_Copyright: string;
  function OK_AppName: string;
  function OK_AppNameMotto: string;
  function OK_Version: string;

  function WaitForLock(var lockVar: Boolean; timeout: Integer = 5): Boolean;
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  udebug, // used for TLoopedList
  IdTCPClient, idGlobal, xIBUtils, Forms, ShellAPI, TlHelp32,
  SysUtils, IniFiles, Dialogs, DB,
  VerInf, ssRegUtils, protection, StrUtils, DateUtils, Types,
  ssStrUtil, ServerData, CommonConstants;

const
  LogStackMax = 1000;
  LogLockedTimeOut: cardinal = 10000; //ms

var
  FLocked: Boolean = False;
  logFileHandle : TextFile;
  LogLocked : boolean;
  LogStack: TLoopedList;
  lastError: String = ''; // lastError... used in logEvent()
  lastErrorCount: Integer = 0;
  lastErrorLevel: Integer = 0;
  lastErrorTime: TDateTime;
  {$IFDEF UDEBUG}DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

//==============================================================================================
// wait for timeout seconds or milliseconds (if number > 100) and sets lockvar to true then
function WaitForLock(var lockVar: Boolean; timeout: Integer = 5): Boolean;
  var
    t: Integer;
begin
  Result := False;

  if timeout < 100 //seconds or milli?
    then t := timeout * 1000
    else t := timeout;

  while lockVar do begin
    sleep(100);
    dec(t, 100);
    if t <= 0 then Exit;
  end;

  lockVar := True;
  Result := True;
end;

//==============================================================================================
procedure threadLock; // waits if locked and locks then for itself
begin
  if not WaitForLock(Flocked, 5) then begin
    LogError('! threadLock critical delay');
    Exit;
  end;
end;

//==============================================================================================
procedure threadUnLock; // waits if locked and locks then for itself
begin
  FLocked := False;
end;

//==============================================================================================
function CheckUsers: Boolean;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'CheckUsers') else _udebug := nil;{$ENDIF}

  Result := True;

  (*{$IFDEF IBX}
  with TIBSecurityService.Create(nil) do
    try
      try
        LoginPrompt := False;
        ServerName := 'localhost';
        Params.Add('user_name=sysdba');
        Params.Add('password=masterkey');
        Active := True;
        xSrvDB.cdsUsers.First;

        while not xSrvDB.cdsUsers.Eof do begin
          if Trim(xSrvDB.cdsUsers.FieldByName('sysname').AsString) <> '' then begin
            DisplayUser(xSrvDB.cdsUsers.FieldByName('sysname').AsString);

            if UserInfoCount = -1 then begin
              UserName := xSrvDB.cdsUsers.FieldByName('sysname').AsString;
              UserID := xSrvDB.cdsUsers.FieldByName('userid').AsInteger;
              Password := xSrvDB.cdsUsers.FieldByName('pass').AsString;

              try
                AddUser;
                LogEvent('+ User ' + xSrvDB.cdsUsers.FieldByName('sysname').AsString + ' successfully added');

              except
                on E: Exception do LogError('add_user: ' + xSrvDB.cdsUsers.FieldByName('sysname').AsString + #13#10 + E.Message);
              end;
            end;
          end;
          xSrvDB.cdsUsers.Next;
        end;

        xSrvDB.cdsUsers.First;
        Active := False;

      except
        on E: Exception do begin
          LogError('CheckUsers: ' + E.Message);
          Result := False;
        end;
      end;
    finally
      Free;
    end;

  {$ENDIF}
  *)

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetConnString(var ADBID: integer; var ADBPath: string): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetConnString') else _udebug := nil;{$ENDIF}

  Result := '';
  ADBPath := '';

  try // finally
    try // except
      with xSrvDB.cdsDBParams do
        if Active then begin
          if (ADBID = -1) and xSrvDB.cdsDB.Locate('def', 1, []) then ADBID := xSrvDB.cdsDB.fieldbyname('dbid').AsInteger;

          if ADBID = -1 then begin
            LogError('GetConnString: no default DB');
            Exit;
          end;

          First;

          while not Eof do begin
            if fieldbyname('dbid').AsInteger = ADBID then begin

              Result := Result + fieldbyname('parname').AsString + '=' + FieldByName('parvalue').AsString + ';';

              if FieldByName('parname').AsString = 'Data Source'
                then ADBPath := DelChars(FieldByName('parvalue').AsString, [#10,#13]);
            end;

            Next;
          end;

          Result := DelChars(Result, [#10,#13]);

          LogEvent('+ GetConnString: ID=' + IntToStr(ADBID) + '; Path = "' + ADBPath + '"', 10);

        end //if Active

        else LogError('GetConnString: WTF? cdsDB is not active');

    except
      on e: Exception do LogError('GetConnString: exception: ' + e.Message);
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure DoAction(Obj: TObject; AAction: TxQueueAction);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'DoAction') else _udebug := nil;{$ENDIF}

  try
    case xSrvDB.Clnt_SendAll(AAction) of
      srAbandoned: LogEvent('? Clnt_SendAll: mtxClients abandoned!');
      srTimedOut:  LogEvent('? Clnt_SendAll: mtxClients timed out!');
    end;

  except
    on e: exception do LogError('Clnt_SendAll: ' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure CheckLogFile;
  var
    i: Integer;
    FSrvLog, s: string;
begin
  if ReadFromRegInt(ServerRegKey, 'MaxLogSize', i, HKEY_LOCAL_MACHINE)
    then MaxLogSize := i;

  if ReadFromRegInt(ServerRegKey, 'MaxLogBackups', i, HKEY_LOCAL_MACHINE)
    then MaxLogBackupsQuantity := i;

  FSrvLog := ExtractFilePath(ParamStr(0)) + LogFileName;
  AssignFile(logFileHandle, FSrvLog);

  if FileExists(FSrvLog) then begin
    if {$IFDEF DEBUG}FileSizeByName(FSrvLog) > 0  // rotate log for each session in debug build
       {$ELSE}FileSizeByName(FSrvLog) > MaxLogSize * 1000
       {$ENDIF}
    then begin
      for i := MaxLogBackupsQuantity - 1 downto 1 do begin // shifting old logs, removing oldest
        s := FSrvLog + 'bak' + IntToStr(i + 1);
        if FileExists(s) then deleteFile(s);
        RenameFile(FSrvLog + 'bak' + IntToStr(i), s);
      end;

      RenameFile(FSrvLog, FSrvLog + 'bak1');
      FileCreate(FSrvLog);
    end;
  end
  else FileCreate(FSrvLog);
end;

//==============================================================================================
function GetLogStack(html: Boolean; const ADebugLevel: Integer = 0): String;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetLogStack') else _udebug := nil;{$ENDIF}

  try
    WaitForLock(LogLocked, LogLockedTimeOut);

    if not html then begin
      logStack.First;
      while not logStack.eof do begin
        if ADebugLevel <= Integer(LogStack.CurrentID)
          then Result := Result + LogStack.CurrentData + #13#10;

        logStack.Next;
      end;

      Exit;
    end;

    // html version
    Result := '<UL>' + #10#13;

    logStack.First;
    while not logStack.eof do begin
      if ADebugLevel <= Integer(LogStack.CurrentID)
        then Result := Result + '<LI>' + LogStack.CurrentData + '</LI>'#13#10;

      logStack.Next;
    end;

    Result := Result + '</UL>' + #10#13;

  finally
    LogLocked := False;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure AddToStack(S: string; const ADebugLevel: Integer = 0);
  var 
    d: TDateTime;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  s := trim(s);
  if s = '' then Exit;

  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'AddToStack') else _udebug := nil;{$ENDIF}

  d := now;
  LogStack.Push(Format('%s.%03d: %s', [DateTimeToStr(d), MilliSecondOfTheSecond(d), s]), AdebugLevel);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure AddToLog(const S: string; const ADebugLevel: Integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'AddToLog') else _udebug := nil;{$ENDIF}

  if S <> '' then AddToStack(S, AdebugLevel);
  if ADebugLevel <= DebugLevel then debugInstantLog(s);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure LogEvent(const tolog: string; const ADebugLevel: Integer = 0);
  var
    S: string;
    //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'LogEvent') else _udebug := nil;{$ENDIF}

  WaitForLock(LogLocked, LogLockedTimeOut);
  s := trim(tolog);

  try // finally
    if lastError = s then begin
      inc(lastErrorCount);

      if SecondsBetween(now, lastErrorTime) < 10 then Exit;

      // too long ago. resetting
      AddToLog(lastError + ': repeated ' + IntToStr(lastErrorCount) + ' times', LastErrorLevel);
      lastError := '';
      lastErrorCount := 1;
      lastErrorTime := now;
    end
    else begin
      if lastErrorCount > 1 then AddToLog(lastError + ': repeated ' + IntToStr(lastErrorCount) + ' times', LastErrorLevel);
      lastError := s;
      lastErrorCount := 1;
      lastErrorTime := now;
      LastErrorLevel := ADebugLevel;

      AddToLog(S, LastErrorLevel);
    end;

  finally
    LogLocked := False;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure LogError(const S: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'LogError') else _udebug := nil;{$ENDIF}

  LogEvent('', 0); // dumping last msg and adding a blank line
  LogEvent('! ERROR: ' + s,  0);
  LogEvent('', 0); // making it to log immediately

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetSysError(ACode: Integer = 0): String;
  var
    lpMsgBuf: pchar;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'GetSysErr') else _udebug := nil;{$ENDIF}

  if Acode = 0 then ACode := GetLastError;

  if Acode = 0 then begin
    Result := '';
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM, nil, Acode, 0, @lpMsgBuf, 0, nil);
  Result := lpMsgBuf;
  LocalFree( Cardinal(lpMsgBuf) );

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure DieOnSysError(Amsg: String);
  var
    ErrMsg: String;
    ErrCode: Integer;
begin
  ErrCode := GetLastError;
  if ErrCode = 0 then Exit;

  if Amsg <> ''
    then ErrMsg := Amsg + ': ' + GetSysError(ErrCode)
    else ErrMsg := GetSysError(ErrCode);

  LogError(ErrMsg);
  MessageDlg(ErrMsg, mtError, [mbOk], 0);

  Application.Terminate;
  Application.ProcessMessages;
  Halt;
end;

//==============================================================================================
procedure LockProvider;
begin
  ProvidersLocked := True;
end;

//==============================================================================================
procedure UnLockProvider;
begin
  ProvidersLocked := False;
end;

//==============================================================================================
function BuildConnString(AValues: TStringList): string;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'BuildConnString') else _udebug := nil;{$ENDIF}

  Result := '';

  for i := 0 to AValues.Count - 1 do Result := Result + AValues[i] + ';';

  if Result <> '' then Delete(Result, Length(Result), 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function InitializeServer: string;
  var
    ini: TIniFile;
    lstKeys, lstValues: TStringList;
    i: integer;
    FInfo: TxSrvDBInfo;
    pMethod: ^TMethod;
    s,section: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitSysProviders') else _udebug := nil;{$ENDIF}

  with TVersionInfo.Create(AppFileName) do
    try
      Version := Format('%d.%d.%d', [FileLongVersion.All[2], FileLongVersion.All[1], FileLongVersion.All[4]]);
      FullVersionNo := Version + '.' + IntToStr(FileLongVersion.All[3]);

    finally
      Free;
    end;

  Result := '';
  lstKeys := TStringList.Create;
  lstValues := TStringList.Create;

  try //finally
    try //except
      s := serverPath + SysIniFile;
      section := 'Opening ' + s;
      ini := TIniFile.Create(s);

      with ini do try // finally
        ReadSection('main', lstKeys);
        ReadSectionValues('main', lstValues);

        section := 'ini: sysprovdir';
        i := lstKeys.IndexOf('SysProvDir');
        if i = -1 then begin
          XMLDataDir := serverPath + defaultProvDir;
        end
        else begin
          s := Trim(ExtractWord(2, lstValues.Strings[i], ['=']));
          if DirectoryExists(s)
            then XMLDataDir := s
            else begin
              LogError('invalid .ini xml dir: ' + s);
              XMLDataDir := serverPath + defaultProvDir;
            end;
        end;

        section := 'ini: dbdriver';
        //------------------------------------------------------
        {$IF defined(ZEOS)}
          i := lstKeys.IndexOf('DBdriver');
          if i = -1
            then DBDriver := 'firebird-2.0'
            else DBdriver := Trim(ExtractWord(2, lstValues.Strings[i], ['=']));

          if DBdriver = 'firebird-1.0'
            then InitFBDLL(1)
          else if DBdriver = 'firebird-2.0'
            then InitFBDLL(2)
          else if DBdriver = 'firebird-2.1'
            then InitFBDLL(21)
          else begin
             LogError('invalid .ini DBDriver: ' + DBDriver + '; using default');
             DBdriver := 'firebird-2.0';
             InitFBDLL(2);
          end;
        {$IFEND}

        {$IFDEF IBX}
          DBdriver := 'IBX';
          InitFBDLL(1);
        {$ENDIF}

        LogEvent('Using DB driver: ' + DBdriver);

        section := 'ini: debuglevel';
        //------------------------------------------------------
        i := lstKeys.IndexOf('DebugLevel');
        if i <> -1 then debugLevel := StrToInt(Trim(ExtractWord(2, lstValues.Strings[i], ['='])));

      finally
        lstKeys.Free;
        lstValues.Free;
      end;

      section := 'srvDB';
      LogEvent('.ini read and understood');

      FInfo.DBPath := XMLDataDir;
      FInfo.ProvFile := SysProvFile;
      FInfo.ProvTextFile := SysProvTextFile;
      FInfo.DBFile := SysDBFile;
      FInfo.DBParamsFile := SySDBParamsFile;
      FInfo.UsersFile := SysUsersFile;
      xSrvDB := TxSrvDB.Create(FInfo);

      {xSrvDB.Clients.Add(nil, '', '', Now, Now, nil, nil);
      LogEvent('xsrvdb created');
      xSrvDB.Clients.Add(nil, 'test', 'test', now, now, nil, nil);
      }

      section := 'xQueue';
      xQueue := TxQueue.Create(nil);
      xQueue.CheckInterval := QueueCheckInterval;
      //xQueue.OnAction := TempObj.DoAction;

      pMethod := @@xQueue.OnAction;
      pMethod.Code := @DoAction;
      LogEvent('Server Initialized Successfully');

    except
      on e: Exception do 
        Result := section + ': ' + e.Message;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function OK_URL: string;
  var
    b: array [0..255] of char;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OK_URL') else _udebug := nil;{$ENDIF}

  loadString(resDllHandle, 4, b, 255);
  Result := string(b);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function OK_Copyright: string;
  var
    b: array [0..255] of char;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OK_Copyright') else _udebug := nil;{$ENDIF}

  loadString(resDllHandle, 3, b, 255);
  Result := '(c) ' + b + ', 2003-' + IntToStr(CurrentYear);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function OK_AppName: string;
  var
    b: array [0..255] of char;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OK_AppName') else _udebug := nil;{$ENDIF}

  loadString(resDllHandle, 1, b, 255);
  Result := string(b);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function OK_AppNameMotto: string;
  var
    b: array [0..255] of char;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OK_AppNameMotto') else _udebug := nil;{$ENDIF}

  loadString(resDllHandle, 2, b, 255);
  Result := string(b);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function OK_Version: string;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'OK_Version') else _udebug := nil;{$ENDIF}

  Result := dmData.Lng.GetRS('Common', 'Version') + ' ' + FullVersionNo + ' [' + compiledDateStr + ']';

  {$IFDEF FREE}Result := Result + ' ' + dmData.Lng.GetRS('Common','DemoVer') + ' ';{$ENDIF}
  {$IFDEF BETA}Result := Result + ' ' + dmData.Lng.GetRS('Common','BetaVer') + ' ';{$ENDIF}
  {$IFDEF DEBUG}Result := Result + ' !DEBUG!';{$ENDIF}
  if (CountryRules.CID < 0) or (CountryRules.CID > cidMax) 
    then Result := Result + ' {!cid unset!}. '
    else Result := Result + ' {' + CountryRules.CountryName + '}. ';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
// ASPROTECT code
//Function EnvelopeCheck: Boolean;
//{$I ASPROTECT\DelphiEnvelopeCheckFunc.inc}
function ProtCheck: Boolean;
begin
  Result := True;

  {$IFNDEF PROTECT}
    Exit;
  {$ELSE}
    //{$I ASPROTECT\UserPolyBuffer.inc}
    if CompareDateTime(Now, FNextProtCheck) = GreaterThanValue then  begin
      Exit;
    end;
    // not yet

    FNextProtCheck := IncMilliSecond(now, random(10000) + 500); // 0,5 - 10 sec

    //If not EnvelopeCheck then Result := False;

    {$IFNDEF FREE}
      if trim(Reginfo.Text) = '' then Result := False;
    {$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure setNextCheckDate;
begin
  {$IFNDEF FREE}
  {$IFDEF DEBUG}LogEvent('# SetNextCheckDate: ' + DateToStr(IncDay(now, 3)));{$ENDIF}
  if not WriteToRegDate(ServerRegKey, nextKeyCheck, IncDay(now, 3), HKEY_LOCAL_MACHINE)
    then if not WriteToRegDate(ServerRegKey, nextKeyCheck, IncDay(now, 3), HKEY_CURRENT_USER)
         then LogError(ssRegUtils_Error);
  {$ENDIF}
end;

//==============================================================================================
procedure ClearRegCheck;
begin
  {$IFNDEF FREE}
  {$IFDEF DEBUG}LogEvent('# ClearRegCheck');{$ENDIF}
  if not DropRegValue(serverRegKey, nonActStop, HKEY_CURRENT_USER) then begin
    LogError(ssRegUtils_Error);
    WriteToRegDate(ServerRegKey, nonActStop, IncMonth(now,9), HKEY_CURRENT_USER);
  end;

  if not DropRegValue(serverRegKey, nonActStop, HKEY_LOCAL_MACHINE) then begin
    LogError(ssRegUtils_Error);
    WriteToRegDate(ServerRegKey, nonActStop, IncMonth(now,9), HKEY_LOCAL_MACHINE);
  end;

  servAuthMsg.Values['Atype'] := '';
  setNextCheckDate;
  {$ENDIF}
end;

//==============================================================================================
procedure SetNextRegCheck;
  {$IFNDEF FREE}
  var
    d: TDateTime;
  {$ENDIF}
begin
  {$IFNDEF FREE}
  try // finally
    threadLock;
    servAuthMsg.Values['Atype'] := ''; // init
    // checking/setting next activation/keycheck dates
    d := 0.0;
    if not ReadFromRegDate(serverRegKey, nonActStop, d, HKEY_LOCAL_MACHINE)
       then ReadFromRegDate(serverRegKey, nonActStop, d, HKEY_CURRENT_USER);

    {$IFDEF DEBUG}LogEvent('# SetNextRegCheck: nonActStop: ' + IfThen(d <> 0.0, DateToStr(d), 'Nope ;)'));{$ENDIF}

    if d <> 0.0 then begin
      if CompareDate(d, now) = LessThanValue
        then servAuthMsg.Values['Atype'] := '-1' // timeout. halt
        else servAuthMsg.Values['Atype'] := '1'; // still waiting
    end;

    if servAuthMsg.Values['Atype'] = '' then begin // do periodic checking when already activated
      d := 0.0;
      if not ReadFromRegDate(serverRegKey, nextKeyCheck, d, HKEY_LOCAL_MACHINE)
        then if not ReadFromRegDate(serverRegKey, nextKeyCheck, d, HKEY_CURRENT_USER)
             then LogError(ssRegUtils_Error);

      {$IFDEF DEBUG}LogEvent('# SetNextRegCheck: nextKeyCheck:' + DateToStr(d));{$ENDIF}
      if d <> 0.0 then begin
        if CompareDate(d, now) <> GreaterThanValue // do check if timed out or today.
          then servAuthMsg.Values['Atype'] := '2';
      end
      else setNextCheckDate;
    end;
    
  finally
    threadUnLock;
    {$IFDEF DEBUG}LogEvent('# SetNextRegCheck: Atype=' + servAuthMsg.Values['Atype']);{$ENDIF}
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure needActivation;
begin
  {$IFNDEF FREE}
  if not WriteToRegDate(ServerRegKey, nonActStop, IncMonth(now), HKEY_CURRENT_USER) then LogError(ssRegUtils_Error);
  if not WriteToRegDate(ServerRegKey, nonActStop, IncMonth(now), HKEY_LOCAL_MACHINE) then LogError(ssRegUtils_Error);
  servAuthMsg.Values['Atype'] := '1';
  {$IFDEF DEBUG}LogEvent('# needActivation');{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
function isProcessRunning(const s: String): Boolean;
  var
    hSnap: THandle;
    pe: TProcessEntry32;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'isProcessRunning') else _udebug := nil;{$ENDIF}

  Result := False;
  
  try
    pe.dwSize := SizeOf(pe);
    hSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    Process32First(hSnap, pe);

    While Process32Next(hSnap, pe) do begin
      if 0 = AnsiCompareText(LowerCase(ExtractFileName(pe.szExeFile)), LowerCase(s))
      then begin
        Result := True;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function GetDir(AWhere: String; var AOut: String): Integer;
  var
    sr: TSearchRec;
begin
  AOut := '';
  Result := FindFirst(AWhere, faAnyFile, sr);

  if Result > 0 then begin
    FindClose(sr);
    Exit;
  end;

  repeat
    AOut := AOut + sr.Name + '|' + DateTimeToStr(FileDateToDateTime(sr.Time)) + '|' + IntTostr(sr.Size) + '|';

    AOut := AOut + ifThen((sr.Attr and SysUtils.faReadOnly) > 0,  'R', '-');
    AOut := AOut + ifThen((sr.Attr and SysUtils.faHidden) > 0,    'H', '-');
    AOut := AOut + ifThen((sr.Attr and SysUtils.faSysFile) > 0,   'S', '-');
    AOut := AOut + ifThen((sr.Attr and SysUtils.faVolumeID) > 0,  'V', '-');
    AOut := AOut + ifThen((sr.Attr and SysUtils.faDirectory) > 0, 'D', '-');
    AOut := AOut + ifThen((sr.Attr and SysUtils.faArchive) > 0,   'A', '-');

    AOut := AOut + #13#10;
  until 0 <> FindNext(sr);

  FindClose(sr);
end;

//==============================================================================================
function SetSingleUserMode(AID: Pointer; ASwitch: Boolean): Integer;
begin
  if (SingleUserOwner <> nil) and (AID <> SingleUserOwner) then begin // we're not the owner
    Result := cmdSetSingleUserMode_res_NotOwner;
    Exit;
  end;

  if not ASwitch then begin // off
    SingleUserOwner := nil;
    Result := 0;
  end
  else if xSrvDB.Clients.ClientsCount = 1 then begin // on and we're alone
    SingleUserOwner := AID;
    Result := 0;
  end
  else Result := cmdSetSingleUserMode_res_NotAlone;
end;

//==============================================================================================
function CheckSocketserver: Boolean;
  var
    tc: TidTCPCLient;
    s: String;
    i: Integer;
begin
  Result := False;

  tc := TIdTCPClient.Create(nil);

  try //finally
    for i := 1 to 2 do begin
      try //except
        tc.Host := '127.0.0.1';
        tc.Port := 211; // default...
        tc.Connect(2000);
        Result := tc.Connected;
        tc.Disconnect;

      except
        on e: Exception do begin
          //MessageDlg(e.Message, mtError, [mbOk], 0);
          LogError(e.Message);
        end;
      end;

      if (i = 2) or Result then Exit;

      // trying to start local socket server
      ShellExecute(Application.Handle, nil, PChar(ServerPath + '\\scktsrvr.exe'), '-install -quiet', nil, SW_HIDE);

      if 33 > ShellExecute(Application.Handle, nil, PChar(ServerPath + '\\scktsrvr.exe'), nil, nil, SW_HIDE)
      then begin
        s := dmData.Lng.GetRS('Common', 'Err_CantExecScktSrvr') + ' ' + GetSysError;
        MessageDlg(s, mtError, [mbOk], 0);
        LogError(s);
        Exit;
      end;
    end; //for

  finally
    tc.Free;
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssSrvConst', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  try // inserted by UDEBUG processor
    LogStack := TLoopedList.Create(LogStackMax);
    servAuthMsg := TStringList.Create;

  except // inserted by UDEBUG processor
    {$IFDEF UDEBUG}
    on e: exception do begin
      debugInstantLog('error at ssSrvConst/ini: ' + e.Message);
      e.Create('error at ssSrvConst/ini: ' + e.Message);
    end;
    {$ENDIF}
  end; // try

//==============================================================================================
finalization
  {try
    if Assigned(xSrvDB) then xSrvDB.Destroy;
    if Assigned(xQueue) then xQueue.Destroy;

  except
  end;
  }

  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
