{$I ok_sklad.inc}
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, ToolWin, DB, DBClient, strUtils, ActnList,
  StdCtrls, Buttons, ImgList, AppEvnts,
  prFun, prTypes, xLngDefs, debugTraceForm,
  dxDBGrid6,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxButtonEdit,
  ssBaseSkinForm, ssBevel, ssSpeedButton, ssBaseConst,
  ssGradientPanel, ssMDIChild, ssLabel, ssBaseTypes, ssFormStorage, ssClientDataSet,
  ssPanel, okClasses,
  TB2Item, TB2Dock, TB2Toolbar, TBSkinPlus,
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, TB2ExtItems, OleCtrls, SHDocVw,
  JvExStdCtrls, JvHtControls;

type
  TfrmMain = class(TfrmBaseSkin)
    aAbout: TAction;
    aBackupDB: TAction;
    aBufNext: TAction;
    aBufPrior: TAction;
    ActionList1: TActionList;
    ActionList2: TActionList;
    aDocs: TAction;
    aExcelImport: TAction;
    aExit: TAction;
    aFinances: TAction;
    aHelp: TAction;
    aInternet: TAction;
    aLang: TAction;
    aNewDB: TAction;
    aOptions: TAction;
    aRefs: TAction;
    aReports: TAction;
    aRestoreDB: TAction;
    aRunCC: TAction;
    aService: TAction;
    aUpdateStat: TAction;
    aURL: TAction;
    aWarehouse: TAction;
    btnBufNext: TssSpeedButton;
    btnBufPrior: TssSpeedButton;
    btnDocs: TssSpeedButton;
    btnFinances: TssSpeedButton;
    btnInet: TssSpeedButton;
    btnRefs: TssSpeedButton;
    btnReports: TssSpeedButton;
    btnService: TssSpeedButton;
    btnWMat: TssSpeedButton;
    bufMain: TokFunctionBuffer;
    dckMain: TTBDock;
    FormStorage: TssFormStorage;
    ilMain: TImageList;
    ilMainDis: TImageList;
    MenuBar: TTBToolbar;
    mnuDB: TTBSubmenuItem;
    mnuDebug: TTBSubmenuItem;
    mnuExcelImport: TTBItem;
    mnuFile: TTBSubmenuItem;
    mnuHelp: TTBSubmenuItem;
    mnuLang: TTBSubmenuItem;
    mnuService: TTBSubmenuItem;
    panToolbar: TPanel;
    pmNextBufferHistory: TTBPopupMenu;
    pmPriorBufferHistory: TTBPopupMenu;
    sbMain: TStatusBar;
    ssBevel1: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem48: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    mnuSrvDbgLevel: TTBEditItem;
    aTutorial: TAction;
    panInfo: TPanel;
    Bevel1: TBevel;
    debugButton1: TButton;
    debugButton2: TButton;
    smEnt: TTBSubmenuItem;
    miEnt0: TTBItem;
    lblStatus: TJvHTLabel;
    WebBrowser1: TWebBrowser;
    lDate: TLabel;
    edOnDate: TcxDateEdit;
    imgToolbarBg: TImage;

    procedure aAboutExecute(Sender: TObject);
    procedure aBackupDBExecute(Sender: TObject);
    procedure aBufNextExecute(Sender: TObject);
    procedure aBufPriorExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure aDocsExecute(Sender: TObject);
    procedure aExcelImportExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aFileExecute(Sender: TObject);
    procedure aFinancesExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aInternetExecute(Sender: TObject);
    procedure aLangEngExecute(Sender: TObject);
    procedure aLangExecute(Sender: TObject);
    procedure aNewDBExecute(Sender: TObject);
    procedure aOptionsExecute(Sender: TObject);
    procedure aRefsExecute(Sender: TObject);
    procedure aReportsExecute(Sender: TObject);
    procedure aRestoreDBExecute(Sender: TObject);
    procedure aRunCCExecute(Sender: TObject);
    procedure aServExecute(Sender: TObject);
    procedure aServiceExecute(Sender: TObject);
    procedure aTutorialExecute(Sender: TObject);
    procedure aUpdateStatExecute(Sender: TObject);
    procedure aURLExecute(Sender: TObject);
    procedure aViewExecute(Sender: TObject);
    procedure aWarehouseExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure bufMainChange(Sender: TObject);
    procedure debugButton2Click(Sender: TObject);
    procedure debugButton1Click(Sender: TObject);
    procedure edOnDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lblStatusHyperLinkClick(Sender: TObject; LinkName: String);
    procedure miEntClick(Sender: TObject);
    procedure mnuSrvDbgLevelAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure pmNextBufferHistoryPopup(Sender: TObject);
    procedure pmPriorBufferHistoryPopup(Sender: TObject);
    procedure sbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure TBItem9Click(Sender: TObject);

  private
    function CheckSingleMode: Boolean;
    function IsFunEnabled(ARoot: Integer): Boolean;
    function RefExists(AFrame: TClass): boolean;

    procedure CreateRef(AFrame: TClass);
    procedure mnuBufferHistoryClick(Sender: TObject);
    procedure mnuLangXXXClick(Sender: TObject);
    procedure RebuildLngMenu;
    procedure SetCaptions;
    procedure WMCallBack(var M: TMessage); message WM_CALLBACK;
    procedure WMInputLangChangeRequest(var M: TMessage); message WM_INPUTLANGCHANGEREQUEST;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMOKExecLocate(var M: TMessage); message WM_OK_EXECLOCATE;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    procedure WMSizing(var M: TMessage); message WM_SIZING;

  protected
    function IsCCFormFound(AType: TCCViewType): boolean;
    procedure SetActiveMDI(AForm: TForm);
    procedure BuildBufferHistoryMenu(APrior: Boolean);

  public
    function AllDisabled: Boolean;
    function GetEnabledView(AView: TCCViewType): TCCViewType;

    procedure AddToBuffer(AViewType: TCCViewType; AFunID: Integer; const AFunName, AClassName: string; AGType, AID, ASubID: Integer);
    procedure doAdvertizing(AURL: String = '');
    procedure ExecLocate(const AViewType: TCCViewType; const AClass: string; ID: Integer; GType: Integer = 0);
    procedure ExecRefresh(const AClass: string; ID: Integer; AParam: Integer = 0);
    procedure LoadSkin; override;
    procedure RefreshMultiEnts;
    procedure RefreshStatusBar;
    procedure ReloadRes;
    procedure ResetActive(AActive: TCCViewType);
    procedure ResetStyle;
    procedure SetBtnStates;
  end;

  TokMain = class of TfrmMain;

var
  frmMain: TfrmMain;
  ShellHook: HHOOK;
  FlastAdTime: TDateTime;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Registry, ClientData, prConst, CCMain, fMeasures, Options, fBank,
  fEqType, fMaterials, fAccountType, fUsers, fUserGroups, ShellAPI,
  fUserMonitor, fRecycleBin, fCurrency, ssFun, ssRegUtils, ssBaseWizard, StartWiz,
  ssCallbackConst, EditKAgent, EditWaybill, Login, ExImportWiz, Progress,
  About, fLoadingData, fMessageDlg, xLngManager, fWaybillOut, fAccOut,
  fOrders, BaseFrame, Udebug, Dateutils, FR_Class, Protection,
  CommonConstants, WebReq;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function ShellProcHook(Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT; stdcall;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ShellProcHook') else _udebug := nil;{$ENDIF}

  if Code = HSHELL_LANGUAGE then begin
    if Assigned(frmMainForm) then SendMessage(frmMainForm.Handle, WM_LAYOUTCHANGED, 0, Word(LParam));
    if Assigned(frmLogin) then SendMessage(frmLogin.Handle, WM_LAYOUTCHANGED, 0, Word(LParam));
  end;
  Result := CallNextHookEx(ShellHook, Code, WParam, LParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.doAdvertizing(AURL: String = '');
  var
    s: String;
begin
  if (trim(AURL) = '') and (MinutesBetween(now, FlastAdTime) < 5) then Exit;

  if trim(AURL) = ''
    then s := 'http://' + URL_KeyHost + '/dv.php?op=getad&hid=' + trim(CurrentHardwareID)
    else s := AURL;

  {$IF defined(DEBUG) or defined(FREE)}
    panInfo.Visible := True;
  {$ELSE}
    if not panInfo.Visible then panInfo.Visible := not optHideInfoPane;
  {$IFEND}
  
  WebBrowser1.Navigate(s);
  FlastAdTime := now;
end;

//==============================================================================================
function TfrmMain.IsCCFormFound(AType: TCCViewType): boolean;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.IsCCFormFound') else _udebug := nil;{$ENDIF}

  Result := False;

  for i := 0 to Screen.FormCount - 1 do
    if (Screen.Forms[i] is TfrmCCMain) and (TfrmCCMain(Screen.Forms[i]).ViewType = AType)
    then begin
      if Screen.Forms[i].WindowState = wsMinimized then Screen.Forms[i].WindowState := wsMaximized;

      if Screen.Forms[i] <> ActiveMDIChild then begin
        //with TfrmCCMain(Screen.Forms[i]) do
        //  if Assigned(FrameList) and Assigned(FrameList.FcurrFrame) then FrameList.FcurrFrame.DoActivate;
        //Screen.Forms[i].BringToFront;

        SendMessage(ClientHandle, WM_MDIACTIVATE, Screen.Forms[i].Handle, 0);
        //SendMessage(Screen.Forms[i].Handle, WM_MDIACTIVATE, ActiveMDIChild.Handle, Screen.Forms[i].Handle);
        //SendMessage(ActiveMDIChild.Handle, WM_MDIACTIVATE, ActiveMDIChild.Handle, Screen.Forms[i].Handle);
        //SetActiveMDI(Screen.Forms[i]);
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;
      end;

      Result := True;
      Break;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.btnExitClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.btnExitClick') else _udebug := nil;{$ENDIF}

  Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.SetCaptions;
  var
    i, days: Integer;
    lblStatusDefault: string;
    mi: TTbItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    lDate.Caption := GetRS('fmKAgent', 'Date');
    mnuFile.Caption := GetRS('frmMain', 'File');
    mnuHelp.Caption := GetRS('Common', 'Help');
    aAbout.Caption := GetRS('frmAbout', 'Title');

    aURL.Caption := GetRS('Common', 'URL');

    mnuService.Caption := GetRS('frmMain', 'Tools');

    mnuDB.Caption := GetRS('frmMain', 'DB');
    aNewDB.Caption := GetRS('frmMain', 'NewDB');

    aBufPrior.Hint := GetRS('Common', 'Backward');
    aBufNext.Hint := GetRS('Common', 'Forward');

    aDocs.Caption := GetRS('frmMain', 'Docs');
    aWarehouse.Caption := GetRS('frmMain', 'WMat');
    aReports.Caption := GetRS('frmMain', 'Reports');
    aRefs.Caption := GetRS('frmMain', 'Refs');
    aService.Caption := GetRS('frmMain', 'Service');
    aFinances.Caption := GetRS('frmMain', 'Finances');

    aExit.Caption := GetRS('frmMain', 'Exit');
    aHelp.Caption := GetRS('Common', 'Help');
    aTutorial.Caption := GetRS('Common', 'OnlineTutorial');
    aLang.Caption := GetRS('frmMain', 'Lang');
    aOptions.Caption := GetRS('frmMain', 'Options');
    aExcelImport.Caption := GetRS('frmMain', 'ExcelImport');
    aUpdateStat.Caption := GetRS('frmMain', 'UpdateStat');

    aBackupDB.Caption := GetRS('frmMain', 'BackupDB');
    aRestoreDB.Caption := GetRS('frmMain', 'RestoreDB');
    aBackupDB.Enabled := SingleUserMode;
    aRestoreDB.Enabled := SingleUserMode;

    sdxPanelText := rs('Common', 'GroupPanelText');

    lblStatusDefault := '';

    //setFontStyle(lblStatus.Font);

    {$IF defined(FREE) or defined(BETA)}
      days := MaxFreeDays - DaysBetween(Now, EncodeDate(compiledYear, compiledMonth, compiledDay));

      {$IFDEF FREE}
        lblStatusDefault := GetRS('Common', 'FreeVerStatus');
        aExcelImport.Enabled := False;
      {$ENDIF}

      {$IFDEF BETA}
        if days < 0 then days := 0;
        if days = 0 then lblStatusDefault := Format(GetRS('Common', 'DaysLeft'), [days]);
      {$ENDIF}
    {$IFEND}

    if ((ActivationResponse <> nil) and (ActivationResponse.DataString = '')) or (servMsg.Values['Atype'] = '1')
      then lblStatusDefault := rs('Common', 'ActPending');

    if lblStatusDefault = ''
      then lblStatus.Caption := GetRS('Common', 'URL')
      else lblStatus.Caption := lblStatusDefault + '   ' + GetRS('Common', 'VisitPls');

    lblStatus.Caption := lblStatus.Caption + ': <a href="' + OK_URL + '">' + OK_URL + '</a>';
  end;

  lblStatus.Left := menuBar.Left + menuBar.Width + 10;

  cdsEnts.First;
  smEnt.Clear;
  if cdsEnts.RecordCount <= 1
    then smEnt.Enabled := False
  else for i := 1 to cdsEnts.RecordCount do begin
    mi := TTBitem.Create(menuBar);
    smEnt.Add(mi);
    mi.Name := 'miEnt' + IntTostr(i);
    mi.Tag := cdsEnts.FieldByName('kaid').AsInteger;
    mi.OnClick := miEntClick;
    mi.Caption := cdsEnts.FieldByName('name').AsString;
    mi.Checked := (cdsEnts.FieldByName('def').AsInteger = 1);
    mi.Enabled := not mi.Checked;
    cdsEnts.Next;
  end;

  panTitleBar.Caption := OK_AppName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormCreate(Sender: TObject);
  var
    ov: OleVariant;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  setFontStyle(ToolbarFont);

  frmMainForm := Self;
  fLoading := TfmLoadingData.Create(nil);

  //SetStyle(Self, IStyle);
  RefreshStatusBar;
  SetCaptions;

  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  RebuildLngMenu;

  edOnDate.Date := Date;
  SetUserActivity(ClientData.dmData.SConnection, 0);
  ClientData.dmData.MHandle := Self.Handle;

  SetBtnStates;

  setFontStyle(Self.Font);
  setFontStyle(MenuBar.Font);

  mnuSrvDbgLevel.Text := dmData.SConnection.AppServer.Command(cmdSetServerDebugLevel, -1, ov); // get current dlevel

  {$IFNDEF FREE}
    panInfo.Visible := not optHideInfoPane;
  {$ENDIF}

  {$IFNDEF DEBUG}
    mnuDebug.Visible := (cmdLineDebugLevel > 0);
  {$ENDIF}

  {$IFNDEF DEBUG}
    debugButton1.Visible := False;
    debugButton2.Visible := False;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ReloadRes;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ReloadRes') else _udebug := nil;{$ENDIF}

  //LangMan.ActiveLngDesc := LangName;
  Self.SetCaptions;

  for i := 0 to Self.MDIChildCount - 1 do TMDIChild(Self.MDIChildren[i]).SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.CreateRef(AFrame: TClass);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.CreateRef') else _udebug := nil;{$ENDIF}

  if not RefExists(AFrame) then
    with TfrmCommonRef.Create(Application, AFrame.ClassName) do
      try
        OnDate := Self.edOnDate.Date;
        fFrameClass := AFrame;
        Show;
      except
        Free;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.edOnDateChange(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.edOnDateChange') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.MDIChildCount - 1 do TMDIChild(Self.MDIChildren[i]).OnDate := edOnDate.Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormDestroy(Sender: TObject);
  var
    s: String;
    i, runsec, runcount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormDestroy') else _udebug := nil;{$ENDIF}

  fProgress.Free;
  fLoading.Free;
  SetUserActivity(ClientData.dmData.SConnection, 0);
  WriteToRegInt(PrRegKey, 'ViewType', Ord(CurrentView));
  WriteToRegInt(PrRegKey, 'CurrNode', CurrentNode);

  // statistics
  if ClientStartTime <> 0.0 then begin // not cancelled at login
    if not ReadFromRegStr(prRegStatKey, regKeyLastVer, s) // 1st run maybe. initializing
      then s := FullVersionNo;

    i := SecondsBetween(now, ClientStartTime);

    //this version run time. resetting if ver changed from last time.
    if not ReadFromRegInt(prRegStatKey, regKeyRunTimeCurVer, runsec) or (s <> FullVersionNo) then runsec := 0;
    runsec := runsec + i;
    WriteToRegInt(prRegStatKey, regKeyRunTimeCurVer, runsec);

    // total run time for all versions
    if not ReadFromRegInt(prRegStatKey, regKeyRunTime, runsec) then runsec := 0;
    runsec := runsec + i;
    WriteToRegInt(prRegStatKey, regKeyRunTime, runsec);

    WriteToRegStr(prRegStatKey, regKeyLastVer, FullVersionNo);

    //sending usage statistics and other shit
    ReadFromRegInt(prRegStatKey, regKeyRunCount, runcount);
    WebQuickPost(URL_KeyHost, 'http://' + URL_KeyHost + '/dv.php',
                 'op=rep'#13#10'hid=' + trim(CurrentHardwareID) + #13#10'rc=' + IntToStr(runcount)
                 + #13#10'si=' + encodeKey(CollectTechInfo(False) + getUsageStat)
                 + #13#10'version=' + FullVersionNo, s, 5000);
    {$IFDEF DEBUG}debugInstantLog('Main.Formdestroy: Sendinfo response code: ' + s);{$ENDIF}
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ResetStyle;
  (*var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ResetStyle') else _udebug := nil;{$ENDIF}

  SetStyle(Self, IStyle);

  for i := 0 to Self.MDIChildCount - 1 do
    SendMessage(Self.MDIChildren[i].Handle, WM_RESETSTYLE, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aRunCCExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aRunCCExecute') else _udebug := nil;{$ENDIF}

  if not IsCCFormFound(vtAll) then
    with TfrmCCMain.Create(Application) do
      try
        OnDate := Self.edOnDate.Date;
        ViewType := vtAll;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aRunCC.Caption), 0);
        Show;

      except
        Free;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMain.RefExists(AFrame: TClass): boolean;
  (*var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    *)
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.RefExists') else _udebug := nil;{$ENDIF}

  Result := False;

  (*for i := 0 to MDIChildCount-1 do
    if (MDIChildren[i] is TfrmCommonRef) and (TfrmCommonRef(MDIChildren[i]).fFrame.ClassName=AFrame.ClassName)
    then begin
       MDIChildren[i].BringToFront;
       Result := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aDocsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aDocsExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtDocs);
  Application.ProcessMessages;

  if not IsCCFormFound(vtDocs) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        //Visible := False;
        OnDate := Self.edOnDate.Date;
        ViewType := vtDocs;
        Self.Height := Self.Height-1;
        Self.Height := Self.Height+1;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aDocs.Caption), 0);
//Visible := True;
        Show;
        
      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aInternetExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aInternetExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtInternet);
  Application.ProcessMessages;

  if not IsCCFormFound(vtInternet) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        //Visible := False;
        OnDate := Self.edOnDate.Date;
        ViewType := vtInternet;
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aInternet.Caption), 0);
        Show;

      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aReportsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aReportsExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtReports);
  Application.ProcessMessages;

  if not IsCCFormFound(vtReports) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        OnDate := Self.edOnDate.Date;
        ViewType := vtReports;
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aRunCC.Caption), 0);
        Show;

      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aRefsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aRefsExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtRefs);
  Application.ProcessMessages;

  if not IsCCFormFound(vtRefs) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        WindowState := wsMaximized;
        OnDate := Self.edOnDate.Date;
        ViewType := vtRefs;
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aRefs.Caption), 0);
        Show;

      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aServiceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aServiceExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtService);
  Application.ProcessMessages;

  if not IsCCFormFound(vtService) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        WindowState := wsMaximized;
        OnDate := Self.edOnDate.Date;
        ViewType := vtService;
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;

        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aService.Caption), 0);
        Show;

      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aWarehouseExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aWarehouseExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtWMat);
  Application.ProcessMessages;

  if not IsCCFormFound(vtWMat) then
    with TfrmCCMain.Create(Application) do
      try
        FormStyle := fsMDIChild;
        OnDate := Self.edOnDate.Date;
        ViewType := vtWMat;
        Self.Height := Self.Height - 1;
        Self.Height := Self.Height + 1;
        SendMessage(Handle, WM_SETCAPTIONEX, integer(@aRunCC.Caption), 0);
        Show;

      except
        Free;
        raise;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aFileExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aFileExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aExitExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aExitExecute') else _udebug := nil;{$ENDIF}

  Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aServExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aServExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aHelpExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aHelpExecute') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aViewExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aViewExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aOptionsExecute') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;

  with TfrmOptions.Create(Application) do
  try
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aLangExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aLangExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.aLangEngExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aLangEngExecute') else _udebug := nil;{$ENDIF}

  langID := (Sender as TComponent).Tag;
  langName := LangNames[LangID];
  case langID of
    lidRUS: mnuRus.Checked := True;
    lidUKR: mnuUkr.Checked := True;
    lidENG: mnuEng.Checked := True;
  end;

  with newDataSet do
   try
     ProviderName := 'pProfiles_UpdLang';
     FetchParams;
     Params.ParamByName('profid').AsInteger := ProfID;
     Params.ParamByName('lang').AsInteger := (Sender as TComponent).Tag;
     Execute;

   finally
     Free;
   end;

   WriteToRegStr(MainRegKey + '\', 'Lang', LangName);
   ReloadRes;
   panTitleButtons.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  Self.Caption := OK_AppName;

  if not EntParamsLoaded then begin
    with TfrmStartWiz.Create(nil) do
      try
        WizType := wtStartSettings;
        defaultConn := ClientData.dmData.SConnection;
        ShowModal;

      finally
        Free;
      end;

    SetCaptions;
  end;

  doAdvertizing;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMCallBack(var M: TMessage);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMCallBack') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.MDIChildCount - 1 do
    PostMessage(TMDIChild(Self.MDIChildren[i]).Handle, WM_CALLBACK, M.WParam, M.LParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMInputLangChangeRequest(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMInputLangChangeRequest') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMLayoutChanged(var M: TMessage);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  for i := 0 to Screen.FormCount - 1 do begin
    //if (Screen.Forms[i] is TfrmCCMain) or (Screen.Forms[i] is TfrmEditKAgent) or
    //(Screen.Forms[i] is TfrmEditWaybill) or (Screen.Forms[i] is TfrmLogin) or
      {then}
    if Screen.Forms[i] <> Self then
      PostMessage(Screen.Forms[i].Handle, WM_LAYOUTCHANGED, M.WParam, M.LParam);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMSizing(var M: TMessage); 
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMSizing') else _udebug := nil;{$ENDIF}

  {for i := 0 to Screen.FormCount - 1 do
    if (Screen.Forms[i] is TfrmCCMain) and (Screen.Forms[i].FormStyle <> fsNormal)
      then PostMessage(Screen.Forms[i].Handle, WM_SIZING, M.WParam, M.LParam);
  }
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aExcelImportExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aExcelImportExecute') else _udebug := nil;{$ENDIF}

  with TfrmExImportWiz.Create(nil) do
  try
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ExecRefresh(const AClass: string; ID: Integer; AParam: Integer = 0);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ExecRefresh') else _udebug := nil;{$ENDIF}

  if AClass = 'WH' then begin
    for i := 0 to MDIChildCount - 1 do
      if (MDIChildren[i] is TfrmCCMain) and (TfrmCCMain(MDIChildren[i]).ViewType = vtWMat)
        then TfrmCCMain(MDIChildren[i]).RefreshWH;
  end
  else
    for i := 0 to MDIChildCount - 1 do
      if MDIChildren[i] is TfrmCCMain then TfrmCCMain(MDIChildren[i]).ExecRefresh(AClass, ID, AParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aAboutExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aAboutExecute') else _udebug := nil;{$ENDIF}

  with TfrmAbout.Create(nil) do
  try
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMain.IsFunEnabled(ARoot: Integer): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}

  function IsChildEnabled(ADS: TDataSet; AID: Integer): Boolean;
    var
      BM: TBookmark;
  begin
    Result := False;
    BM := ADS.GetBookmark;

    try
      ADS.First;

      while not ADS.Eof do begin
        if (ADS.FieldByName('id').AsInteger = AID) then begin
          if not ADS.FieldByName('funid').IsNull and GetUserAccess(ADS.FieldByName('funid').AsInteger, uaView)
          then begin
            Result := True;
            Exit;
          end
        end
        else if (ADS.FieldByName('pid').AsInteger = AID)
        then begin
          Result := IsChildEnabled(ADS, ADS.FieldByName('id').AsInteger);

          if Result then Exit;
        end;

        ADS.Next;
      end;

    finally
      ADS.GotoBookmark(BM);
      ADS.FreeBookmark(BM);
    end;
  end;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.IsFunEnabled') else _udebug := nil;{$ENDIF}

  Result := False;

  with newDataSet do
    try
      ProviderName := 'pUserTreeView_GetEx';
      Open;
      while not Eof do begin
        if FieldByName('gtype').AsInteger = ARoot
          then Result := IsChildEnabled(Fields[0].DataSet, FieldByName('id').AsInteger);

        Next;
      end;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.SetBtnStates;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.SetBtnStates') else _udebug := nil;{$ENDIF}

  aDocs.Enabled := IsFunEnabled(2);
  aFinances.Enabled := IsFunEnabled(206) or IsFunEnabled(207);
  aRefs.Enabled := IsFunEnabled(1);
  aService.Enabled := IsFunEnabled(3);
  aReports.Enabled := IsFunEnabled(5);
  aWarehouse.Enabled := IsFunEnabled(4) or IsFunEnabled(150) or IsFunEnabled(250) or IsFunEnabled(251);

  aOptions.Enabled := GetUserAccessByClass('TfrmOptions', uaView);
  aExcelImport.Enabled := UserID = 0;
  aRestoreDB.Enabled := UserID = 0;
  aBackupDB.Enabled := UserID = 0;
  aUpdateStat.Enabled := UserID = 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMain.GetEnabledView(AView: TCCViewType): TCCViewType;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}

  function GetEnView: TCCViewType;
  begin
    Result := vtDocs;
    if aWarehouse.Enabled then Result := vtWMat
    else if aFinances.Enabled then Result := vtFinances
    else if aReports.Enabled then Result := vtReports
    else if aRefs.Enabled then Result := vtRefs
    else if aService.Enabled then Result := vtService
    else if aInternet.Enabled then Result := vtInternet;
  end;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.GetEnabledView') else _udebug := nil;{$ENDIF}

  Result := vtDocs;

  case AView of
    vtDocs:     if aDocs.Enabled      then Result := AView else Result := GetEnView;
    vtWMat:     if aWarehouse.Enabled then Result := AView else Result := GetEnView;
    vtFinances: if aFinances.Enabled  then Result := AView else Result := GetEnView;
    vtReports:  if aReports.Enabled   then Result := AView else Result := GetEnView;
    vtRefs:     if aRefs.Enabled      then Result := AView else Result := GetEnView;
    vtService:  if aService.Enabled   then Result := AView else Result := GetEnView;
    vtInternet: if aInternet.Enabled  then Result := AView else Result := GetEnView;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMain.AllDisabled: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.AllDisabled') else _udebug := nil;{$ENDIF}

  Result := not aDocs.Enabled and not aRefs.Enabled and not aReports.Enabled
    and not aWarehouse.Enabled and not aService.Enabled and not aFinances.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aUpdateStatExecute(Sender: TObject);
  var
    cdsTemp: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aUpdateStatExecute') else _udebug := nil;{$ENDIF}

  if not CheckSingleMode then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  fProgress.Caption := rs('frmMain', 'UpdatingStat');
  fProgress.Show;

  cdsTemp := newDataSet;

  with newDataSet do
  try
    cdsTemp.ProviderName := 'pIndices_List';
    ProviderName := 'pSQL';

    FetchMacros;
    cdsTemp.Open;
    fProgress.pbMain.Max := cdsTemp.RecordCount;

    while not cdsTemp.Eof do begin
      Macros.ParamByName('sql').AsString := 'set statistics index ' + cdsTemp.Fields[0].AsString;
      Execute;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
      cdsTemp.Next;
    end;
    cdsTemp.Close;

  finally
    cdsTemp.Free;
    Free;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aBackupDBExecute(Sender: TObject);
  var
    Res: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aBackupDBExecute') else _udebug := nil;{$ENDIF}

  if not CheckSingleMode then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TSaveDialog.Create(nil) do
  try
    DefaultExt := 'fbk';
    Filter := 'Firebird Backup Files (*.fbk)|*.fbk';

    if Execute then begin
      fProgress.Caption := rs('frmMain', 'Backuping');
      fProgress.DoTimer;

      Application.ProcessMessages;
      Res := (ClientData.dmData.SConnection.AppServer.db_Backup(FileName, ClientData.dmData.SConnection.DBID) = 0);
      fProgress.Hide;

      if Res
        then ssMessageDlg(rs('Common', 'BackupSuccess'), ssmtInformation, [ssmbOk])
        else ssMessageDlg(rs('Common', 'BackupError') + ' ' + lastServerError, ssmtError, [ssmbOk]);
    end;

  finally
    if fProgress.Visible then fProgress.Hide;

    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aRestoreDBExecute(Sender: TObject);
  var
    i, j: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aRestoreDBExecute') else _udebug := nil;{$ENDIF}

  if (not CheckSingleMode) or (mrYes <> ssMessageDlg(rs('frmMain', 'RestoreWarning'), ssmtWarning, [ssmbYes, ssmbCancel]))
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TOpenDialog.Create(nil) do
  try
    DefaultExt := 'fbk';
    Filter := 'Firebird Backup Files (*.fbk)|*.fbk';

    if Execute then begin
      fProgress.Caption := rs('frmMain', 'Restoring');
      fProgress.DoTimer;
      Application.ProcessMessages;

      if 0 = ClientData.dmData.SConnection.AppServer.db_Restore(FileName, ClientData.dmData.SConnection.DBID)
        then begin
          ClientData.dmData.SConnection.DBConnected := False;
          ClientData.dmData.SConnection.DBConnected := True;

          EntName := '';
          InitProfile(ClientData.dmData.SConnection, UserID, ProfID, TreeID, ClientData.dmData.scMain);
          frmMainForm.SetBtnStates;
          BaseCurrName := GetBaseCurrName(ClientData.dmData.SConnection);

          try
            for i := 0 to MDIChildCount - 1 do
              if MDIChildren[i] <> ActiveMDIChild
                then MDIChildren[i].Close
                else with TfrmCCMain(MDIChildren[i]) do begin
                  tlMain.Selected := tlMain.Items[0];

                  try
                    for j := 0 to FrameList.FramesCount - 1 do FrameList.Items[i].Free;

                  except
                  end;

                  FrameList.Clear;
                  NotChangeDetail := True;
                  ReloadRes;

                  if ViewType <> frmMainForm.GetEnabledView(ViewType)
                    then ViewType := frmMainForm.GetEnabledView(ViewType)
                    else RefreshTree(0);

                  panNoAccess.Visible := frmMainForm.AllDisabled;
                  NotChangeDetail := False;
                  tlMain.Selected := tlMain.Items[0];
                  panTitleButtons.Invalidate;
                end;

          except
            raise;
          end;

          fProgress.Hide;
          ssMessageDlg(rs('Common', 'RestoreSuccess'), ssmtInformation, [ssmbOk]);
        end
        else ssMessageDlg(rs('Common', 'RestoreError') + ' ' + lastServerError, ssmtError, [ssmbOk]);
    end;

  finally
    if fProgress.Visible then fProgress.Hide;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMain.CheckSingleMode: Boolean;
  var
    s: WideString;
    o: OleVariant;
    res: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.CheckSingleMode') else _udebug := nil;{$ENDIF}

  Result := SingleUserMode;

  if UserID <> 0
    then ssMessageDlg(rs('Common', 'SModeOnly'), ssmtError, [ssmbOk])
  else if not Result then begin
    s := '1'; // non-empty string to set single user
    res := ClientData.dmData.SConnection.AppServer.Command(cmdSetSingleUserMode, s, o);
    SingleUserMode := (0 = res);
    Result := SingleUserMode;

    case res of
       0: ;
       cmdSetSingleUserMode_res_NotOwner: ssMessageDlg(rs('Common', 'SModeNotOwner'), ssmtError, [ssmbOk]);
       cmdSetSingleUserMode_res_NotAlone: ssMessageDlg(rs('Common', 'SModeNotAlone'), ssmtError, [ssmbOk]);
    end;
  end;

  RefreshStatusBar;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.Image1Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.Image1Click') else _udebug := nil;{$ENDIF}

  aAbout.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ExecLocate(const AViewType: TCCViewType; const AClass: string; ID: Integer; GType: Integer = 0);
  var
    i: Integer;
    FActiveView: TfrmCCMain;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ExecLocate') else _udebug := nil;{$ENDIF}

  if not (ActiveMDIChild is TfrmCCMain) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FActiveView := TfrmCCMain(ActiveMDIChild);

  if (FActiveView.ViewType <> AViewType) then begin
    case AViewType of
      vtDocs:     aDocs.Execute;
      vtWMat:     aWarehouse.Execute;
      vtRefs:     aRefs.Execute;
      vtReports:  aReports.Execute;
      vtService:  aService.Execute;
      vtFinances: aFinances.Execute;
      vtInternet: aInternet.Execute;
    end;
    FActiveView := TfrmCCMain(ActiveMDIChild);
  end;

  FActiveView.ExecLocate(AClass, ID, GType);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.RebuildLngMenu;
  var
    i: Integer;
    FItem: TTBItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.RebuildLngMenu') else _udebug := nil;{$ENDIF}

  for i := 0 to LangMan.FilesCount - 1 do begin
    FItem := TTBItem.Create(MenuBar);
    FItem.GroupIndex := 10;
    FItem.Caption := LangMan.Files[i].Desc + ' - ' + LangMan.Files[i].LangName;
    FItem.OnClick := mnuLangXXXClick;
    mnuLang.Insert(i, FItem);
    if i = LangMan.ActiveLngIndex then FItem.Checked := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuLangXXXClick(Sender: TObject);
  var
    i:integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuLangXXXClick') else _udebug := nil;{$ENDIF}

  (Sender as TTBItem).Checked := True;
  switchLang(mnuLang.IndexOf(Sender as TTBItem));

  ReloadRes;
  panTitleButtons.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aFinancesExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aFinancesExecute') else _udebug := nil;{$ENDIF}

  ResetActive(vtFinances);
  Application.ProcessMessages;

  if not IsCCFormFound(vtFinances) then
    with TfrmCCMain.Create(Application) do
    try
      FormStyle := fsMDIChild;
      OnDate := Self.edOnDate.Date;
      ViewType := vtFinances;
      Self.Height := Self.Height - 1;
      Self.Height := Self.Height + 1;
      SendMessage(Handle, WM_SETCAPTIONEX, integer(@aFinances.Caption), 0);
      Show;

    except
      Free;
      raise;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  dckMain.Color := clokMainBk;
  MenuBar.Color := clokMainBk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aURLExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aURLExecute') else _udebug := nil;{$ENDIF}

  ShellExecute(Application.Handle, nil, PChar(OK_URL), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.debugButton2Click(Sender: TObject);
begin
  fprogress.Done;
  {with TColorDialog.Create(nil) do
  try
    if Execute then begin
      btnDocs.GrStartColor := Color;
      btnRefs.GrStartColor := Color;
      btnwmat.GrStartColor := Color;
      btnFinances.GrStartColor := Color;
      btnReports.GrStartColor := Color;
      btnService.GrStartColor := Color;
    end;
  finally
    Free;
  end;
  }
end;

//==============================================================================================
procedure TfrmMain.debugButton1Click(Sender: TObject);
begin
  //fprogress.DoTimer(30);
  {with TColorDialog.Create(nil) do
  try
    if Execute then begin
      btnDocs.grendcolor := Color;
      btnRefs.grendcolor := Color;
      btnwmat.grendcolor := Color;
      btnFinances.grendcolor := Color;
      btnReports.grendcolor := Color;
      btnService.grendcolor := Color;
    end;

  finally
    Free;
  end;
  }
end;

//==============================================================================================
procedure TfrmMain.SetActiveMDI(AForm: TForm);
  var
    FActiveID, FID, i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.SetActiveMDI') else _udebug := nil;{$ENDIF}

  FActiveID := -1;
  FID := -1;
  
  for i := 0 to MDIChildCount - 1 do
    if MDIChildren[i] = ActiveMDIChild
      then FActiveID := i
      else if MDIChildren[i] = AForm
           then FID := i;

  if FID > FActiveID then begin
    while AForm <> ActiveMDIChild do SendMessage(ClientHandle, WM_MDINEXT, 0, 0);
  end
  else begin
    while AForm <> ActiveMDIChild do SendMessage(ClientHandle, WM_MDINEXT, 0, 1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.AddToBuffer(AViewType: TCCViewType; AFunID: Integer; const AFunName, AClassName: string; AGType, AID, ASubID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.AddToBuffer') else _udebug := nil;{$ENDIF}

  bufMain.Add(AViewType, AFunID, AFunName, AClassName, AGType, AID, ASubID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aBufPriorExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aBufPriorExecute') else _udebug := nil;{$ENDIF}

  bufMain.Prior;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aBufNextExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aBufNextExecute') else _udebug := nil;{$ENDIF}

  bufMain.Next;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ActionList1Update') else _udebug := nil;{$ENDIF}

  aBufPrior.Enabled := not bufMain.BOF;
  aBufNext.Enabled := not bufMain.EOF;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.bufMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.bufMainChange') else _udebug := nil;{$ENDIF}

  JumpFromBuffer := True;

  with bufMain.Current do ExecLocate(ViewType, ClassName_, ID, GType);

  JumpFromBuffer := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.pmPriorBufferHistoryPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.pmPriorBufferHistoryPopup') else _udebug := nil;{$ENDIF}

  BuildBufferHistoryMenu(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.BuildBufferHistoryMenu(APrior: Boolean);
  var
    FItem: TTBItem;
    i: Integer;
    FFromIndex, FToIndex: Integer;
    FMenu: TTBPopupMenu;

  function ViewName(AViewType: TCCViewType): string;
  begin
    case AViewType of
      vtDocs:     Result := aDocs.Caption;
      vtRefs:     Result := aRefs.Caption;
      vtWMat:     Result := aWarehouse.Caption;
      vtReports:  Result := aReports.Caption;
      vtService:  Result := aService.Caption;
      vtFinances: Result := aFinances.Caption;
      vtInternet: Result := aInternet.Caption;
    end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.BuildBufferHistoryMenu') else _udebug := nil;{$ENDIF}

  if APrior then begin
    FMenu := pmPriorBufferHistory;
    FFromIndex := 0;
    FToIndex := bufMain.ItemIndex - 1;
  end
  else begin
    FMenu := pmNextBufferHistory;
    FFromIndex := bufMain.ItemIndex + 1;
    FToIndex := bufMain.ItemsCount - 1;
  end;

  FMenu.Items.Clear;

  for i := FToIndex downto FFromIndex do begin
    FItem := TTBItem.Create(FMenu);
    FItem.Caption := ViewName(bufMain.Items[i].ViewType) + ' - ' + bufMain.Items[i].FunName;
    FItem.Tag := i;
    FItem.OnClick := mnuBufferHistoryClick;
    FMenu.Items.Insert(FToIndex - i, FItem);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuBufferHistoryClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuBufferHistoryClick') else _udebug := nil;{$ENDIF}

  bufMain.MoveTo(TComponent(Sender).Tag);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.pmNextBufferHistoryPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.pmNextBufferHistoryPopup') else _udebug := nil;{$ENDIF}

  BuildBufferHistoryMenu(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.ResetActive(AActive: TCCViewType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.ResetActive') else _udebug := nil;{$ENDIF}

  btnDocs.Active := (AActive = vtDocs);
  btnWMat.Active := (AActive = vtWMat);
  btnRefs.Active := (AActive = vtRefs);
  btnFinances.Active := (AActive = vtFinances);
  btnReports.Active := (AActive = vtReports);
  btnService.Active := (AActive = vtService);
  btnInet.Active := (AActive = vtInternet);

  doAdvertizing;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMOKExecLocate(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMOKExecLocate') else _udebug := nil;{$ENDIF}

  with PokLocateInfo(M.WParam)^ do ExecLocate(ViewType, ClassName, ID, GType);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormResize(Sender: TObject);
  var
    i, ii: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormResize') else _udebug := nil;{$ENDIF}

  {for i := 0 to MDIChildCount - 1 do begin
    for ii := 0 to MDIChildren[i].ControlCount - 1 do try
      (MDIChildren[i].Controls[ii] as TWinControl).EnableAlign;

    except
    end;
    MDIChildren[i].Realign;
  end;
  }
  RefreshStatusBar;
  sbMain.Panels[1].Width := sbMain.Width - sbMain.Panels[2].Width - sbMain.Panels[0].Width - 150;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.RefreshStatusBar;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.RefreshStatusBar') else _udebug := nil;{$ENDIF}

  setFontStyle(sbMain.Font);
  sbMain.Panels[0].Text := ' ' + UserName + '@' + ClientData.dmData.SConnection.Host;
  sbMain.Panels[0].Width := 2 * sbMain.Canvas.TextWidth(sbMain.Panels[0].Text);
  sbMain.Panels[1].Text := OK_Version + ' ' + ifThen(trim(EntName) = '', rs('Common', 'EmptyEnt'), EntName);

  if SingleUserMode
    then sbMain.Panels[3].Text := ' ' + rs('frmMain', 'SingleUserMode')
    else sbMain.Panels[3].Text := '';

  doAdvertizing;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMSetText') else _udebug := nil;{$ENDIF}

  RefreshStatusBar;
  {if Trim(EntName) = ''
    then lTitle.Caption := rs('Common', 'EmptyEnt')
    else lTitle.Caption := OK_AppName + ' ' + OK_Version + '   ' + EntName;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.miEntClick(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.miEntClick') else _udebug := nil;{$ENDIF}

  try // finally
    Screen.Cursor := crSQLWait;

    try
      for i := 0 to smEnt.Count - 1 do begin
        smEnt.Items[i].Enabled := True;
        smEnt.Items[i].Checked := False;
      end;
      TTBItem(Sender).Checked := True;
      TTBItem(Sender).Enabled := False;
      MakeDefaultEnt(ClientData.dmData.SConnection, TTBItem(Sender).Tag);
      ExecRefresh('TfmKAgent', 0);

    finally
      Screen.Cursor := crDefault;
    end;

    RefreshStatusBar;

    if MultiEntsViewType = 1 then RefreshMultiEnts;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmMain.sbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
 var
   Flags: Longint;
   R: TRect;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.sbMainDrawPanel') else _udebug := nil;{$ENDIF}

  with sbMain.Canvas do begin
    if (Panel.Index = 3) and SingleUserMode then begin
  //Brush.Color := CL_OK_SINGLE_MODE;
      Pen.Color := clWindowText;
  //FillRect(Rect);
      Flags := DT_EXPANDTABS or DT_LEFT;
      Flags := DrawTextBiDiModeFlags(Flags);
      R := Rect;
      ClientData.dmData.Images.Draw(sbMain.Canvas, R.Left + 1, R.Top, 197);
      R.Top := R.Top + 1; R.Left := R.Left + 18;
      DrawText(Handle, PChar(Panel.Text), Length(Panel.Text), R, Flags);
    end
    else if (Panel.Index = 0) then begin
      //Brush.Color := CL_OK_SINGLE_MODE;
      Pen.Color := clWindowText;
      //FillRect(Rect);
      Flags := DT_EXPANDTABS or DT_LEFT;
      Flags := DrawTextBiDiModeFlags(Flags);
      R := Rect;
      ClientData.dmData.Images.Draw(sbMain.Canvas, R.Left + 1, R.Top, 198);
      R.Top := R.Top + 1; R.Left := R.Left + 18;
      DrawText(Handle, PChar(Panel.Text), Length(Panel.Text), R, Flags);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aNewDBExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.aNewDBExecute') else _udebug := nil;{$ENDIF}

  with TfrmStartWiz.Create(nil) do
  try // finally
    ParentHandle := Self.Handle;

    if (Sender as TComponent).Tag = 1
      then WizType := wtCopyDB
      else WizType := wtNewDBSimple;

    NeedClose := False;
    NeedReconnect := False;
    defaultConn := ClientData.dmData.SConnection;

    if (ShowModal = mrOk) and (mrYes = ssMessageDlg(rs('frmMain', 'ConnectDB'), ssmtConfirmation, [ssmbYes, ssmbNo]))
    then begin
      Application.ProcessMessages;
      ClientData.dmData.SConnection.Close;

      // new DB admin have no password by default
      if 0 <> LoginCodeInterprete(prFun.Login(ClientData.dmData.SConnection, ltProduction, AdminLoginName, '', ClientData.dmData.SConnection.Host, FnewDBID, False))
        then Exit;

      Application.ProcessMessages;

      EntName := '';
      InitProfile(ClientData.dmData.SConnection, UserID, ProfID, TreeID, ClientData.dmData.scMain);
      frmMainForm.SetBtnStates;
      BaseCurrName := GetBaseCurrName(ClientData.dmData.SConnection);

      with frmMainForm do begin
        for i := 0 to MDIChildCount - 1
          do if MDIChildren[i].Handle <> (ActiveMDIChild as TfrmCCMainClass).Handle
             then MDIChildren[i].Close;

        for i := 0 to (ActiveMDIChild as TfrmCCMainClass).FrameList.FramesCount - 1
          do (ActiveMDIChild as TfrmCCMainClass).FrameList.Items[i].Free;

        (ActiveMDIChild as TfrmCCMainClass).FrameList.Clear;
        (ActiveMDIChild as TfrmCCMainClass).NotChangeDetail := True;
//FrameList.Free;
        //FrameList := TssFrameList.Create(Self);
        ReloadRes;

        if (ActiveMDIChild as TfrmCCMainClass).ViewType <> frmMainForm.GetEnabledView((ActiveMDIChild as TfrmCCMainClass).ViewType)
          then (ActiveMDIChild as TfrmCCMainClass).ViewType := frmMainForm.GetEnabledView((ActiveMDIChild as TfrmCCMainClass).ViewType)
          else (ActiveMDIChild as TfrmCCMainClass).RefreshTree(0);

        (ActiveMDIChild as TfrmCCMainClass).panNoAccess.Visible := frmMainForm.AllDisabled;
        (ActiveMDIChild as TfrmCCMainClass).NotChangeDetail := False;
        (ActiveMDIChild as TfrmCCMainClass).tlMain.Selected := (ActiveMDIChild as TfrmCCMainClass).tlMain.Items[0];
        panTitleButtons.Invalidate;
      end;
    end;

    frmMainForm.RefreshStatusBar;

  finally
    Free;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmMain.RefreshMultiEnts;
  var
    i: Integer;
    FFrame: TssBaseFrame;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.RefreshMultiEnts') else _udebug := nil;{$ENDIF}

  FFrame := TfrmCCMain(Self.ActiveMDIChild).FrameList.FcurrFrame;

  if FFrame is TfmWaybillOut
    then FFrame.DoRefresh(0)
    else RefreshFun('TfmWaybillOut', 0);

  if FFrame is TfmAccOut
    then FFrame.DoRefresh(0)
    else RefreshFun('TfmAccOut', 0);

  if (FFrame is TfmOrders) and (FFrame.Tag = -16)
    then FFrame.DoRefresh(0)
    else RefreshFun('TfmOrders', -16);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.TBItem9Click(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.lblWWWClick') else _udebug := nil;{$ENDIF}

  with TfmDebugTrace.Create(nil) do begin
    Mode := (Sender as TTBItem).Tag;
    ShowModal;
    Free;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuSrvDbgLevelAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  var
    s: OleVariant;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuSrvDbgLevelAcceptText') else _udebug := nil;{$ENDIF}

  try
    NewText := trim(NewText);
    Accept := (0 <= StrToInt(NewText));

    if Accept then Accept := ClientData.dmData.SConnection.AppServer.Command(cmdSetServerDebugLevel, NewText, s); // server should accept that too ;)

  except
    Accept := False;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.aTutorialExecute(Sender: TObject);
  var
    err: Integer;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'aTutorialExecute') else _udebug := nil;{$ENDIF}

  s := URL_KeyHost + '/tutorial';
  err := ShellExecute(Application.Handle, nil, PChar(s), nil, nil, SW_SHOWNORMAL);
  if err < 33 then ssMessageDlg(s + crlf + GetSysError,  ssmtError, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.lblStatusHyperLinkClick(Sender: TObject; LinkName: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'lblStatusHyperLinkClick') else _udebug := nil;{$ENDIF}

  ShellExecute(Application.Handle, nil, PChar(LinkName), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Main', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  FlastAdTime := IncMonth(now, -1); // force 1st time show
  ShellHook := SetWindowsHookEx(WH_SHELL, @ShellProcHook, 0, GetCurrentThreadId);

//==============================================================================================
finalization
  UnhookWindowsHookEx(ShellHook);

  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.
