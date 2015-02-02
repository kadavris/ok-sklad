unit ClientData;

{$I ok_sklad.inc}

{$IFDEF PKG}
{$I clientdatapkgstub.pas}
{$ELSE}
interface

uses
  iniFiles, SysUtils, Classes, DB,
  DBClient, MConnect, SConnect, Forms, ImgList, Controls, Dialogs, Windows,
  JvTimerList,
  cxContainer, cxEdit, cxStyles,
  ssSocketConnection, okServer_TLB, okClasses, ssClientDataSet,
  xClasses, xLog, xLngManager, xStyleContainer,
  frHTMExp, frXMLExl, frOLEExl, FR_Class, FR_E_TXT, FR_Desgn,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  AppEvnts, TBSkinPlus;

type
  TdmData = class(TDataModule)
    cdsEnt: TssClientDataSet;
    CurrentEnt: TokKAgent;
    frHTMLTableExport1: TfrHTMLTableExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frTextExport1: TfrTextExport;
    frXMLExcelExport1: TfrXMLExcelExport;
    i12: TImageList;
    i14: TImageList;
    i15: TImageList;
    IdHTTP1: TIdHTTP;
    Images14x14: TImageList;
    Images18x18: TImageList;
    Images18x18dis: TImageList;
    Images24x24: TImageList;
    Images: TImageList;
    ImagesTree: TImageList;
    LargeImages: TImageList;
    Lng: TxLngManager;
    logClient: TxLog;
    scMain: TcxEditStyleController;
    sknMain: TTBSkin;
    SConnection: TssSocketConnection;
    srMain: TcxStyleRepository;
    stSelection: TcxStyle;
    ImageListFlags: TImageList;
    scMainErr: TcxEditStyleController;
    scMainOK: TcxEditStyleController;
    scMain4Labels: TcxEditStyleController;
    ApplicationEvents1: TApplicationEvents;
    IdTCPClient1: TIdTCPClient;

    procedure DataModuleCreate(Sender: TObject);
    procedure SConnectionAfterConnect(Sender: TObject);
    procedure SConnectionAfterDisconnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SConnectionAfterDBConnect(Sender: TObject);
    procedure SConnectionLossConnect(Sender: TObject);
    procedure CurrentEntChange(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);

  private
    FCallback: IssCallback;
    FMHandle: HWND;
    qEvents: TxQueue;
    InProcess: Boolean;

    procedure SetMHandle(const Value: HWND);
    procedure DoAction(AAction: TxQueueAction);

  public
    Timers: TJvTimerList;
    iniFile: TMemIniFile;

    property MHandle: HWND read FMHandle write SetMHandle;
    procedure q_Add(AType: integer; AParam, AAddr: Variant);
  end;

var
  dmData: TdmData;

//==============================================================================================
implementation

uses
  prFun, ssClntCallback, ssBaseConst, prConst, fMessageDlg, VerInf,
  ssRegUtils, ssStrUtil, CCMain, ok_rep, Udebug, strUtils, Graphics, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TdmData.DataModuleCreate(Sender: TObject);
 var
   i: Integer;
   s, ss: String;
   b: array [0..999] of char;
   DllH: THandle;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.DataModuleCreate') else _udebug := nil;{$ENDIF}

  ApplicationEvents1.Activate;
  OKR_Ents.RemoteServer := SConnection;
  OKR_Attrs.RemoteServer := SConnection;
  OKR_EntRel.RemoteServer := SConnection;

  Lng.CfgFile := ExtractFilePath(ParamStr(0)) + 'LNG\lng.ini';

  try
    Lng.Active := True;

  except
    ssMessageDlg('Unable to load language resource file!', ssmtError, [ssmbOK]);
    raise;
  end;

  lng.Logger := logClient;
  lng.DefaultSection := 'Common'; // look there if not found within specified at getrs()
  LangMan := Lng;

  CurrEnt := CurrentEnt;
  cdsEnts := cdsEnt;

  ImagesTree.AddImages(Images);

  qEvents := TxQueue.Create(nil);
  qEvents.CheckInterval := 2000;
  qEvents.OnAction := DoAction;

  logClient.FileName := ExtractFilePath(ParamStr(0)) + 'Client_add.log';

  with TVersionInfo.Create(AppFileName) do
    try
      VersionNo := Format('%d.%d.%d', [FileLongVersion.All[2], FileLongVersion.All[1], FileLongVersion.All[4]]);
      FullVersionNo := Format('%d.%d.%d.%d', [FileLongVersion.All[2], FileLongVersion.All[1],
                              FileLongVersion.All[4], FileLongVersion.All[3]]);
    finally
      Free;
    end;

  Timers := TJvTimerList.Create(nil);
  //Timers.
  Timers.Active := True;

  s := GetEnvironmentVariable('APPDATA') + '\OK-Soft';
  if not DirectoryExists(s) then MkDir(s);
  s := s + '\Client.ini';

  //iniFile.Create(s);

  CountryRules := TCountryRules.Create(ClientPath + 'CountryFlags.dll');

  setFontStyle(scMain.style.font);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.DataModuleDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.DataModuleDestroy') else _udebug := nil;{$ENDIF}

  qEvents.Free;
  Timers.Active := False;
  Timers.Free;

  if FCallback <> nil then begin
    FCallback := nil;
    //debugInstantLog('callback = nil');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.DoAction(AAction: TxQueueAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.DoAction') else _udebug := nil;{$ENDIF}

  PostMessage(MHandle, WM_CALLBACK, AAction.AddInfo, AAction.Param);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.q_Add(AType: integer; AParam, AAddr: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.q_Add') else _udebug := nil;{$ENDIF}

  qEvents.Add(AType, AParam, AAddr);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.SConnectionAfterConnect(Sender: TObject); platform;
  var
    AServer: IokSrvDisp;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.SConnectionAfterConnect') else _udebug := nil;{$ENDIF}

  //debugInstantLog('after connect');
  MaxUserCount := SConnection.AppServer.ver_GetCount;

  try
    FCallBack := TIssClntCallback.Create;

  except
    on e: exception do debugInstantLog('TIssClntCallback.Create (after connect): ' + e.Message);
  end;

  FCallback := nil;
  AServer := IokSrvDisp(SConnection.GetServer);

  ServerAddr := AServer.SetClientInfo(SConnection.SelfIP, SConnection.SelfName, FCallback);

  if ServerAddr = -10 then begin
    SConnection.ErrCode := 4;
    ssMessageDlg(Format(LangMan.GetRS('Common', 'UserCountErr'), [MaxUserCount]), ssmtError, [ssmbOk]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.SConnectionAfterDisconnect(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.SConnectionAfterDisconnect') else _udebug := nil;{$ENDIF}

  try
    FCallBack := nil;

  except
    on e: exception do debugInstantLog('! after disconnect: ' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.SConnectionAfterDBConnect(Sender: TObject);
  var
    FVer: string;
    FRes: TxVerCompResult;
    Res: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.SConnectionAfterDBConnect') else _udebug := nil;{$ENDIF}

  if not InProcess then begin
    InProcess := True;

    try
      FVer := SConnection.AppServer.db_CheckVersion(VersionNo);
      FRes := TxVerInfo.Compare(FVer, VersionNo);

      case FRes of
        crSmaller:
          begin
            if mrYes = ssMessageDlg(Format(Lng.GetRS('Common', 'NewClientVersionError'), [VersionNo]), ssmtError, [ssmbYes, ssmbNo])
            then begin
              with TSaveDialog.Create(nil) do
              try
                Title := LangMan.GetRS('Common', 'ChooseBackupFile');
                DefaultExt := 'fbk';
                Filter := 'Firebird Backup Files (*.fbk)|*.fbk';
                Res := True;

                if Execute then begin
                  Application.ProcessMessages;
                  Res := (0 = SConnection.AppServer.db_Backup(FileName, SConnection.DBID));

                  if Res
                    then ssMessageDlg(LangMan.GetRS('Common', 'BackupSuccess'), ssmtInformation, [ssmbOk])
                else ssMessageDlg(LangMan.GetRS('Common', 'BackupError') + lastServerError,
                            ssmtError, [ssmbOk], '', False, True); // set it to allow error reporting
                end;

                Screen.Cursor := crSQLWait;
                SConnection.DBConnected := False;
                Application.ProcessMessages;

                // AP: update only if requested backup was succesful
                if Res and (0 <> SConnection.AppServer.db_DoUpdate(VersionNo))
                then begin
                  ssMessageDlg(LangMan.GetRS('Common', 'UpdateFailed') + lastServerError,
                          ssmtError, [ssmbOk], '', False, True); // set it to allow error reporting
                  Application.Terminate; // nothing to do lately
                end
                else ssMessageDlg(Format(LangMan.GetRS('Common', 'UpdateSuccess'), [VersionNo]), ssmtInformation, [ssmbOk]);

                SConnection.DBConnected := True;

              finally
                Free;
                Screen.Cursor := crDefault;
              end;
            end;
          end;

        crLarger: ssMessageDlg(Format(Lng.GetRS('Common', 'OldClientVersionError'), [FVer]), ssmtError, [ssmbOk]);
      end;

    finally
      InProcess := False;
    end;

    DSRefresh(cdsEnt, 'kaid', 0);
  end;

  if cdsFunc = nil then InitUserAccess(SConnection, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.SConnectionLossConnect(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.SConnectionLossConnect') else _udebug := nil;{$ENDIF}

  ConnectionLost(SConnection); // prFun module

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.SetMHandle(const Value: HWND);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.SetMHandle') else _udebug := nil;{$ENDIF}

  FMHandle := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.CurrentEntChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.CurrentEntChange') else _udebug := nil;{$ENDIF}

  with CurrentEnt do begin
    EntName := Name_;
    EntFullName := FullName;
    EntAddr := GetAddr;
    EntAccount := Accounts.FieldByName('accnum').AsString;
    EntMFO := Accounts.FieldByName('mfo').AsString;
    EntCorrAcc := Accounts.FieldByName('coracc').AsString;
    EntBank := Accounts.FieldByName('name').AsString;
    EntPhone := Phone;
    EntINN := INN;
    EntOKPO := OKPO;
    EntKPP := KPP;
    EntCertNum := CertNum;
    EntNDSPayer := Integer(NDSPayer);
  end;

  if EntName <> ''
    then frmMainForm.Caption := EntName
    else frmMainForm.Caption := Lng.GetRS('Common', 'EmptyEnt');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.ApplicationEvents1Exception(Sender: TObject; E: Exception);
  var
    s, errtxt, srverr: String;
    showAddButtons: boolean;
    i: Integer;
    o: TObject;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  Screen.Cursor := crDefault;
  showAddButtons := True;
  debugStoreErrorPlace;
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ApplicationEvents1Exception') else _udebug := nil;{$ENDIF}

  try //finally
    if CheckLost then Exit;

    inc(stat_Exceptions);
    WriteToRegInt(prRegKey, regKeyExceptions, stat_Exceptions);

    if AnsiContainsText(E.Message, 'socket error') then begin
      debugInstantLog('! Exception in ' + Sender.ClassName + ': ' + E.Message);
      ConnectionLost(dmData.SConnection);
      Exit;
    end;

    srverr := lastServerError(True);

    errtxt := '';
    if AnsiContainsText(E.Message, 'Invalid data packet') then begin
      showAddButtons := False;

      if srverr = '' 
        then errtxt := rs('ErrorsServer', 'InvDatPack')
        else errtxt := srverr;
    end // inv data packet
    //----------------------------------------------------------------------------------
    else if AnsiContainsText(E.Message, 'database file appears corrupt')
         or AnsiContainsText(E.Message, 'internal gds software consistency check')
    then begin
      showAddButtons := False;
      errtxt := rs('ErrorsServer', 'InvDatPack'); // show DB appears corrupted msg
    end // DB corrupt
    //----------------------------------------------------------------------------------
    else if AnsiContainsText(E.Message, 'Field type mismatch') // strangely appears when there is empty dataset for the doc's items.
    then begin
      showAddButtons := False;
      errtxt := rs('Common', 'Err_DBFixReq');
    end
    //----------------------------------------------------------------------------------
    else if AnsiContainsText(E.Message, 'Access violation')
    then begin
      //showAddButtons := False;
      errtxt := rs('Common', 'Err_AccessViol'){ + translateAccViolAddr(clientExeMapFile, e.Message)};
    end
    //----------------------------------------------------------------------------------
    else if AnsiContainsText(e.Message, 'FOREIGN KEY') or AnsiContainsText(srverr, 'FOREIGN KEY') then begin // deleting item that is used somewhere
      showAddButtons := False;
      errtxt := rs('Common', 'Err_CantDelRefdItem');
    end;

    //----------------------------------------------------------------------------------
    if errtxt = '' then errtxt := E.Message;

    {try // shit'O'hell
      o := Sender;
      s := '';
      while o <> nil do begin
        if o is TComponent then begin
          s := TComponent(o).Name + '/' + s;
          o := TComponent(o).GetParentComponent;
        end
        else begin
          s := o.ClassName + '/' + s;
          o := nil;
        end;
      end;

    except
    end;

    debugInstantLog('! Exception in ' + s + ': ' + errtxt);
    }

    if showAddButtons then begin
      errtxt := rs('Common', 'ErrorOccured') + ':  ' + errtxt;
    end
    else begin
      errtxt := rs('Common', 'ErrorOccuredNoAdd') + ':  ' + errtxt;
      debugInstantLog(udebugDump, False);
    end;

    ssMessageDlg(errtxt, ssmtError, [ssmbOK], '', False, showAddButtons);

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ClientData', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

{$ENDIF} //PKG
end.

