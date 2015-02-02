{$I ok_server.inc}
program OK_Server;

uses
  Classes,
  ComObj, DSIntf, MidConst,// midas.dll load
  ComServ,
  Controls,
  Dialogs,
  Forms,
  Registry,
  ShellAPI,
  About in 'About.pas',
  CommonConstants in 'CommonConstants.pas',
  idesn in '..\..\Libs7\Hardware\idesn\idesn.pas',
  Main in 'Main.pas' {frmMain},
  okServer_TLB in 'okServer_TLB.pas',
  PJSysInfo in '..\..\Libs7\Hardware\ddsysinfo\PJSysInfo.pas',
  Props in 'Props.pas' {frmProps},
  protection in '..\..\Production7\Protection\protection.pas',
  Reg in 'Reg.pas' {frmReg},
  ServerData in 'ServerData.pas' {dmData: TDataModule},
  servlog in 'servlog.pas' {frmLog},
  SrvData in 'SrvData.pas' {okSrv: TRemoteDataModule} {okSrv: CoClass},
  ssFun in 'ssFun.pas',
  ssMemDS in '..\..\Libs7\ssPack\ssMemDS.pas',
  ssRegUtils in '..\..\Libs7\ssPack\ssRegUtils.pas',
  ssSrvConst in 'ssSrvConst.pas',
  ssSrvDB in 'ssSrvDB.pas',
  ssSrvTypes in 'ssSrvTypes.pas',
  StrUtils,
  synacode in '..\..\Production7\EMailSend\synacode.pas',
  SysUtils,
  Udebug in '..\..\Libs7\ap\udebug.pas',
  VerInf in '..\..\Libs7\xLib\VerInf.pas',
  Windows,
  xClasses in '..\..\Libs7\xLib\xClasses.pas',
  xFun in '..\..\Libs7\xLib\xFun.pas',
  xIBQuery in '..\..\libs7\ssPack\xIB\xIBQuery.pas',
  xIBUtils in '..\..\libs7\ssPack\xIB\xIBUtils.pas',
  xLngDefs in '..\..\Libs7\ssPack\xLngDefs.pas',
  xStrUtils in '..\..\Libs7\xLib\xStrUtils.pas',
  xIBConst in '..\..\Libs7\ssPack\xIB\xIBConst.pas';

{$R *.TLB}

{$R *.res}

var
  Err, s: string;
  i: Integer;
  manualReg: boolean;
  midash: THandle;

//==============================================================================================
begin
  {$I ok_server_compile_date.inc}

  randomize;
  Application.ShowMainForm := False;
  Application.Initialize;

  udebugSetLogFile(ExtractFilePath(ParamStr(0)) + LogFileName);

  CheckLogFile;
  LogEvent(#13#10#13#10'******************************* Starting **************************************');

  serverPath := ExtractFilePath(ParamStr(0));

  if not CheckSocketServer then begin
    Application.Terminate;
    Application.ProcessMessages;
    Halt;
  end;

  //---------------------------------------------------------------------------------
  if ReadFromRegStr(ServerRegKey, 'Path', s, HKEY_LOCAL_MACHINE) and (trim(s) <> '')
    then ExtTblPath := trim(s) + '\server\ext\'
    else ExtTblPath := serverPath + ExtTblPath + '\';

  if not DirectoryExists(ExtTblPath) then CreateDir(ExtTblPath);

  // load branding bitmaps, strings and other volatile stuff
  s := serverPath + 'soapmgr32.dll';
  resdllHandle := LoadLibrary(PChar(s));
  if resDllHandle = 0 then DieOnSysError(s);

  //---------------------------------------------------------------------------------
  LogEvent('+ cleaning vile borland sh-tuff');
  DropRegKey('CLSID\{9E8D2FA1-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);
  DropRegKey('CLSID\{9E8D2FA3-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);
  DropRegKey('CLSID\{9E8D2FA5-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);

  s := serverPath + 'midas.dll';
  LogEvent('+ preloading our ' + s);
  try
    RegisterComServer(s);
  except
    on e:Exception do LogError('! NOTE: RegisterComServer(' + s + '): ' + e.Message);
  end;

  midash := LoadLibrary(PChar(s));

  if midash = 0 then begin
    LogError(SErrorLoadingMidas);
    MessageDlg('OK-Server initialization error: '#13#10 + SErrorLoadingMidas + #13#10 + s, mtError, [mbOk], 0);
    Application.Terminate;
    Application.ProcessMessages;
    Halt;
  end;

  RegisterMidasLib(GetProcAddress(midash, 'DllGetClassObject'));

  //---------------------------------------------------------------------------------
  LogEvent('+ providers init');
  Err := InitializeServer;
  if Err <> '' then begin
    LogError(Err);
    MessageDlg('OK-Server initialization error: '#13#10 + Err, mtError, [mbOk], 0);
    Application.Terminate;
    Application.ProcessMessages;
    Halt;
  end;

  //---------------------------------------------------------------------------------
  {LogEvent('+ Check users');
  if not CheckUsers
    then LogError('Checkusers() error !');
  }
  //---------------------------------------------------------------------------------
  LogEvent('+ dmData');
  Application.Title := 'OK-Server';
  Application.CreateForm(TdmData, dmData);
  LogEvent('+ MainForm');
  Application.CreateForm(TfrmMain, frmMain);

  //---------------------------------------------------------------------------------
  {$IFDEF DEBUG}
    cmdLineDebug := True;
    DebugLevel := 10;
  {$ELSE}
    cmdLineDebug := False;
    DebugLevel := 0;
  {$ENDIF}
  ManualReg := False;

  i := 1;
  while i <= ParamCount do begin
    if AnsiLowercase(AnsiMidStr(ParamStr(i), 1, 2)) = '-d' then begin

      if length(ParamStr(i)) > 2 then begin // digits are here
        s := AnsiMidStr(ParamStr(i), 3, length(ParamStr(i)) - 2);
      end
      else begin // digits in next param
        inc(i);
        s := ParamStr(i);
      end;

      try
        DebugLevel := StrToInt(s);
        if DebugLevel > 0 then cmdLineDebug := true;
        WriteToRegInt(ServerRegKey, 'DebugLevel', DebugLevel);
        Application.MessageBox(PChar('Debug level set to ' + s +'. Exitting succefully'), PChar('Operation successful'));
        Application.Terminate;
        Application.ProcessMessages;
        Halt;

      except
        DebugLevel := 0;
      end;
    end // -d
    else if AnsiLowercase(ParamStr(i)) = '-reg' then ManualReg := True
    else if AnsiLowercase(ParamStr(i)) = '-regsvr' then begin
      //justRegister := True;
      
      Application.Terminate;
      Application.ProcessMessages;
      Halt;
    end
    else if AnsiLowercase(ParamStr(i)) = '-embedding' then begin // socket server's tricks
    end
    else begin
      Application.MessageBox(PChar('Invalid command line switch: ' + ParamStr(i)), PChar('Cmd line switch error'));
      Application.Terminate;
      Application.ProcessMessages;
      Halt;
    end;

    inc(i);
  end;

  if ReadFromRegInt(ServerRegKey, 'DebugLevel', DebugLevel) then begin
    if DebugLevel > 0 then cmdLineDebug := true;
    LogEvent('* Debug Level: ' + IntToStr(DebugLevel));
  end;

  //---------------------------------------------------------------------------------
  {$IFNDEF FREE}
    LoadRegKey(serverPath + 'srvkey.txt');

    if manualReg then begin
      with TfrmReg.Create(nil) do
      try
        ShowModal;

        if ModalResult = mrOK then LoadRegKey;

      finally
        Free;
      end;

      Application.Terminate;
      Application.ProcessMessages;
      Halt;
    end;

    if RegKeyCheckState = (protKeyLoaded or protKeyChecked)
      then MaxClientsCount := StrToInt(RegInfo.Values['maxclients'])
      else MaxClientsCount := 0; // will allow only basic functioning for key push from client

    SetNextRegCheck;
  {$ENDIF}

  //---------------------------------------------------------------------------------
  LogEvent('* ' + OK_AppName + ' Server ' + OK_Version + ' Started');

  frmMain.AddIcon;
  Application.Run;

  //FreeLibrary(midash);
end.

