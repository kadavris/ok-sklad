{$I ok_sklad.inc}
unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, SConnect, ActnList, ImgList,
  ssFormStorage, ssFun, ssMemDS, ssBaseSkinForm, ssSpeedButton, ssGradientPanel, ssBevel,
  ssSocketConnection, ssClientDataSet, ssBaseConst, ssLabel, ssGroupBox, ssPanel,
  prFun, Main,
  dxEditor, dxCntner,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxLookAndFeelPainters, cxButtons,
  cxGroupBox, cxCheckBox, cxDropDownEdit, cxButtonEdit, xButton, xBevel,
  DateUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdHTTP, jpeg;

type
  TfrmLogin = class(TfrmBaseSkin)
    aCancel: TAction;
    ActionList1: TActionList;
    aHelp: TAction;
    btnCancel: TxButton;
    btnOK: TxButton;
    btnParams: TxButton;
    FormStorage: TssFormStorage;
    gbMain: TssGroupBox;
    panButtons: TPanel;
    panMain: TPanel;
    ssBevel2: TssBevel;
    lApp: TLabel;
    lVersion: TLabel;
    lCopyright: TLabel;
    lTradeMark: TssLabel;
    LogoNY: TImage;
    imgBG: TImage;
    lUser: TLabel;
    lPassword: TLabel;
    lLang: TLabel;
    btnHelp: TssSpeedButton;
    chbSingleMode: TcxCheckBox;
    edPass: TcxTextEdit;
    edUser: TcxComboBox;
    panParams: TPanel;
    btnDBWiz: TssSpeedButton;
    lHost: TssLabel;
    lDB: TssLabel;
    btnHost: TssSpeedButton;
    cbDB: TcxComboBox;
    edHost: TcxComboBox;

    procedure aCancelExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDBWizClick(Sender: TObject);
    procedure btnHostClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure btnParamsClick(Sender: TObject);
    procedure cbDBPropertiesInitPopup(Sender: TObject);
    procedure edHostPropertiesChange(Sender: TObject);
    procedure edPassKeyPress(Sender: TObject; var Key: Char);
    procedure edUserKeyPress(Sender: TObject; var Key: Char);

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FLoginType: TLoginType;
    FPass: string;
    FDBListLoaded: boolean;
    AservKey, AservMsg: OleVariant;
    keyState, maxusers: Integer;

    function  CheckEmptyPassword: boolean;
    function  ConnectToServer: boolean;
    procedure AuthThreadDone(Sender: TObject);
    procedure SaveSettings;
    procedure SetLoginType(const Value: TLoginType);
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  public
    SConn: TssSocketConnection;

    procedure SetCaptions; virtual;
    procedure LoadSkin; override;

    property  LoginType: TLoginType read FLoginType write SetLoginType;
  end;

  TokLogin = class of TfrmLogin;

var
  frmLogin: TfrmLogin;
  TokLoginClass: TokLogin;

//==============================================================================================
implementation

uses
  ssFileUtil, ssStrUtil, prConst, ClientData, ssRegUtils, Udebug, ShellAPI, StrUtils,
  DBClient, StartWiz, SelectHost, fMessageDlg, WebReq, Protection, ActivationDlg, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmLogin.btnOkClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnOkClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.AuthThreadDone(Sender: TObject); // called by web-requester thread when it's done
begin
  WriteToRegStr(PrRegKey, 'AType', ActivationResponse.dataString);

  {$IFDEF DEBUG}
  debugInstantLog('Activation response code: ' + TThreadedWebReq(Sender).idHTTP.responseText
     + #13#10'<BR>raw data: ' + ActivationResponse.dataString
     + #13#10'<BR>decoded data: ' + decodeKey(ActivationResponse.dataString));
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.btnParamsClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnParamsClick') else _udebug := nil;{$ENDIF}

  if panParams.Visible then begin
    Self.Height := Self.Height - panParams.Height;
    btnParams.Caption := rs('Common', 'Params') + ' >>';
    panParams.Visible := False;
  end
  else begin
    panParams.Visible := True;
    Self.Height := Self.Height + panParams.Height;
    btnParams.Caption := '<< '+ rs('Common', 'Params');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.FormCreate(Sender: TObject);
  var
    FDB: string;
    FDBID,n: integer;
    strTmp: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  //strTmp := TComponent(0).Name; // .map file processing test on access violation

  btnParamsClick(btnParams); // to hide additional params at startup

  setFontStyle(lVersion.Font);

  lLang.Caption := keyboardIndicator;

  try
    strTmp := ClientPath + 'loginbg-' + CountryRules.code3 + '.jpg';
    if FileExists(strTmp)
      then imgBg.Picture.LoadFromFile(strTmp)
      else imgBg.Picture.LoadFromFile(ClientPath + 'loginbg-std.jpg');
      
  except
    lTradeMark.Visible := True;
    lApp.Visible := True;
  end;

  SetCaptions;

  if ReadFromRegStr(PrRegKey + '\' + Self.Name, 'Users', strTmp) then begin
    edUser.Properties.Items.Delimiter := ';';
    edUser.Properties.Items.DelimitedText := strTmp;
  end;

  if ReadFromRegStr(PrRegKey + '\' + Self.Name, 'Hosts', strTmp) then begin
    edHost.Properties.Items.Delimiter := ';';
    edHost.Properties.Items.DelimitedText := strTmp;

    if ReadFromRegStr(PrRegKey + '\' + Self.Name, 'DefaultHost', strTmp) then begin
      edHost.ItemIndex := edHost.Properties.Items.IndexOf(strTmp);
    end;
  end;

  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  cbDB.Clear;
  cbDB.Properties.Items.AddObject(rs('Common', 'DefaultDB'), TObject(-1));
  cbDB.ItemIndex := 0;

  if ReadFromRegInt(PrRegKey + '\' + Self.Name, 'DBID', FDBID) and ReadFromRegStr(PrRegKey + '\' + Self.Name, 'DBName', FDB)
  then begin
    if FDBID <> -1 then begin
      cbDB.Properties.Items.AddObject(FDB, TObject(FDBID));
      cbDB.ItemIndex := 1;
    end;
  end;

  LogoNY.Visible := (DayOfTheYear(date) < 15) or (DayOfTheYear(date) > 360);
  Application.Title := OK_AppName;

  {$IF defined(FREE) or defined(LITE)}
    edUser.Enabled := False;
    edPass.Enabled := False;
    //btnParams.Enabled := False;
    //btnCancel.Enabled := False;
    chbSingleMode.checked := True;
    chbSingleMode.Properties.ReadOnly := True;
  {$IFEND}

  if ReadFromRegInt(prRegStatKey, regKeyRunCount, stat_runcount)
    then inc(stat_runcount)
    else stat_runcount := 1;

  WriteToRegInt(prRegStatKey, regKeyRunCount, stat_runcount);
  ClientStartTime := now;

  if not ReadFromRegInt(prRegStatKey, regKeyExceptions, stat_Exceptions) then stat_Exceptions := 0;
  if not ReadFromRegInt(prRegStatKey, regKeyRunTimeCurVer, stat_RunTimeCurVer) then stat_RunTimeCurVer := 0;
  if not ReadFromRegInt(prRegStatKey, regKeyRunTime, stat_TotalRunTime) then stat_TotalRunTime := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.FormShow(Sender: TObject);
  var
    ServHID: OLEVariant;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.FormShow') else _udebug := nil;{$ENDIF}

  if edUser.Text = '' then begin
    edUser.Text := AdminLoginName;
    edPass.Text := '';
  end;

  if Trim(edHost.Text) = '' then edHost.Text := 'localhost';

  try // finally
    if not ConnectToServer then Exit;

    try
      // getting state of server's key. FREE VER can do it too. with dummy returns though, but it may set some variables too
      SConn.AppServer.ClientRegInfo('', ServHID, AServMsg);
      keyState := AServMsg;

    except
      keyState := -1;
    end;

    {$IFNDEF FREE}
      if edUser.Text <> '' then edPass.SetFocus;

      // checking server's key
      AServKey := '';

      try
        maxusers := Sconn.AppServer.ver_GetCount;

      except
        maxusers := 0;
      end;

      if (keystate = -1) or not RegKeyIsValid(keystate, True) // will check activation flags also
      then begin
        with TActivationDlg.Create(Self) do try
          ServerHardwareID := trim(ServHID);

          if keyState = -1 then AskForServerAddress := True;

          ShowModal;

          // checking outcome
          keyState := getKeyState;
          AservKey := newServerKey;

        finally
          Free;
        end;
      end; //if (keystate = -1) or not RegKeyIsValid(keystate)
    {$ELSE}
      // demo ver settings
      btnOK.SetFocus;
      //ModalResult := mrOk; // for auto-click OK. not fucking works
      btnOK.Gradient.colorBegin := clLime;
      btnOK.Gradient.colorEnd := clGreen;
    {$ENDIF}

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    s,url: string;
    n, logRes: integer;
    postres: TStringList;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;

    Screen.Cursor := crSQLWait;

    Application.ProcessMessages;

    if not ConnectToServer then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    try
      // for free ver we'll often send usage statistics
      dmData.idHTTP1.Request.UserAgent := OK_Version;
      {$IFDEF VER150}
      dmData.idHTTP1.host := URL_KeyHost;
      {$ENDIF}
      dmData.idHTTP1.ReadTimeout := 30000;

      if (maxusers = 1) and (trim(edUser.Text) = AdminLoginName) then begin // setting to always monopoly mode for easier backup/restore services
        chbSingleMode.checked := True;
      end;

      logRes := prFun.Login(SConn, LoginType, edUser.Text, edPass.Text, edHost.Text,
                            Integer(cbDB.Properties.Items.Objects[cbDB.ItemIndex]), chbSingleMode.Checked);

      {$IFNDEF FREE}
        // Activation or keycheck requested.
        if (servMsg.Text <> '') and (servMsg.Values['Atype'] <> '') then begin
          case StrToInt(servMsg.Values['Atype']) of
             1: url := URL_KeyActivate + '?' + URL_KeyActivatePost + RegKey; // activation requested
            -1: logRes := 0; //random(10); // timed out. client proceeds as usual,server will halt operations in this case
            else url := URL_KeyCheck + '?' + URL_KeyCheckPost + RegKey; // Atype=2
          end;

          {$IFDEF DEBUG}debugInstantLog('Server regcheck request code: ' + servMsg.Values['Atype'] + ', URL: ' + url);{$ENDIF}

          ActivationResponse := TStringStream.Create('');

          with TThreadedWebReq.Create(dmData.idHTTP1, url, ActivationResponse)
            do OnTerminate := AuthThreadDone;
        end;
      {$ENDIF}

      {$IF defined(FREE) or defined(DEBUG)}
        if logRes in [0,3] then begin // no error (3=user already logged in)
          if stat_runcount = 1 then ssMessageDlg(rs(Self.Name, 'gettingwebinfo1st'), ssmtInformation, [ssmbOk]);

          fProgress.HideAll;
          fProgress.Caption := rs(Self.Name, 'gettingwebinfo', 1) + URL_KeyHost;
          fProgress.InfoText := rs(Self.Name, 'pleasewait');
          fProgress.DoTimer(5);
          Application.ProcessMessages;

          {sending usage statistics and other stuff
            returns op_getver(): ver=xxxxx\nbuilt=xxxx
            to check for new releases
          }
          WebQuickPost(URL_KeyHost, 'http://' + URL_KeyHost + '/dv.php',
                       'op=rep'#13#10'hid=' + trim(CurrentHardwareID) + #13#10'rc=' + IntToStr(stat_runcount)
                       + #13#10'version=' + FullVersionNo + #13#10'si=' + encodeKey(CollectTechInfo(False) + getUsageStat)
                       , s, 5000);
          fProgress.Hide;
          {$IFDEF DEBUG}debugInstantLog('Sendinfo response code: ' + s);{$ENDIF}
          postres := TStringList.Create;
          postres.Text := s;
          if postres.Values['ver'] <> '' then begin
            if not ReadFromRegStr(PrRegKey, regKeyDVPHPLatestVer, s, HKEY_CURRENT_USER)
              then s := FullVersionNo;

            if compareVersionNumbers(s, postres.Values['ver']) < 0
              then ssMessageDlg(Format(rs('', 'UpdatesAvailable'), [URL_KeyHost, postres.Values['ver'], postres.Values['built'], FullVersionNo]), ssmtInformation, [ssmbOk]);
          end;

          s := postres.Values['ver'];
          WriteToRegStr(PrRegKey, regKeyDVPHPLatestVer, s, HKEY_CURRENT_USER);
          postres.Free;
        end;
      {$IFEND}

      LoginCodeInterprete(logRes); // just displays various error messages if needed

      if not (logRes in [0,3]) then begin // fatal error
        SConn.Close;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    finally
      Screen.Cursor := crDefault;
    end;

    SingleUserMode := chbSingleMode.Checked;
    HostAddr := edHost.Text;

    SaveSettings;

    CanClose := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.FormDestroy') else _udebug := nil;{$ENDIF}

  SaveSettings;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.SaveSettings;
begin
  with edUser.Properties.Items do
    if IndexOf(edUser.Text) = -1 then Add(edUser.Text);

  with edHost.Properties.Items do
    if IndexOf(edHost.Text) = -1 then Add(edHost.Text);

  WriteToRegStr(PrRegKey + '\' + Self.Name, 'Users', edUser.Properties.Items.DelimitedText);
  WriteToRegStr(PrRegKey + '\' + Self.Name, 'Hosts', edHost.Properties.Items.DelimitedText);
  WriteToRegStr(PrRegKey + '\' + Self.Name, 'DefaultHost', edHost.Text);

  WriteToRegInt(PrRegKey + '\' + Self.Name, 'DBID', Integer(cbDB.Properties.Items.Objects[cbDB.ItemIndex]));
  WriteToRegStr(PrRegKey + '\' + Self.Name, 'DBName', cbDB.Properties.Items.Strings[cbDB.ItemIndex]);
end;

//==============================================================================================
procedure TfrmLogin.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.SetCaptions') else _udebug := nil;{$ENDIF}

  Self.Caption := RS('frmLogin', 'Title');

  lTradeMark.Caption := OK_AppName;
  lTrademark.Font.Size := 16;
  lApp.Caption := OK_AppNameMotto;
  lApp.Font.Size := 11;

  //lVersion.Left := lApp.left + lApp.width + 5;
  lVersion.Caption := OK_Version;

  lCopyright.Caption := OK_CopyRight;

  lUser.Caption := RS('frmLogin', 'User') + ':';
  lPassword.Caption := RS('frmLogin', 'Pass') + ':';
  lHost.Caption := RS('frmLogin', 'Host') + ':';
  lDB.Caption := RS('frmLogin', 'DB') + ':';
  btnDBWiz.Hint := RS('frmLogin', 'NewDB');
  btnHost.Hint := RS('frmLogin', 'SelectHost');

  gbMain.Caption := RS('frmLogin', 'UserAuth', 3);
  chbSingleMode.Properties.Caption := RS('frmLogin', 'SingleMode');

  aHelp.Caption := RS('Common', 'Help');
  aHelp.Hint := RS('Common', 'Help');

  btnOk.Caption := RS('Common', 'OK');
  btnCancel.Caption := RS('Common', 'Cancel');
  btnParams.Caption := RS('Common', 'Params') + ' >>';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.SetLoginType(const Value: TLoginType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.SetLoginType') else _udebug := nil;{$ENDIF}

  FLoginType := Value;

  if Value = ltServer then begin
    lUser.Enabled := False;
    lPassword.Enabled := False;
    edUser.Enabled := False;
    edUser.Text := '';
    edPass.Enabled := False;
    lApp.Caption := 'Application Server';
  end;
  //else imgApp.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.edPassKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.edPassKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then btnOkClick(btnOk);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnOkGetDrawParams') else _udebug := nil;{$ENDIF}

  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmLogin.cbDBPropertiesInitPopup(Sender: TObject);
  var
    FCurrDBID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if FDBListLoaded then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.cbDBPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  try // finally
    Screen.Cursor := crHourGlass;

    if cbDB.ItemIndex <> -1
      then FCurrDBID := Integer(cbDB.Properties.Items.Objects[cbDB.ItemIndex])
      else FCurrDBID := -1;

    Application.ProcessMessages;

    //if SConn.DBConnected then SConn.DBConnected := False;

    if not ConnectToServer then Exit;

    try
      with newDataSet(Sconn) do
      try
        ProviderName := 'pSysDB_List';
        Open;
        cbDB.Properties.Items.Clear;
        if not IsEmpty then begin
          cbDB.Properties.Items.AddObject(rs('Common', 'DefaultDB'), TObject(-1));

          while not Eof do begin
            cbDB.Properties.Items.AddObject(fieldbyname('desc').AsString, TObject(fieldbyname('dbid').AsInteger));
            Next;
          end;
        end;
        Close;

      finally
        Free;
      end;

      FDBListLoaded := True;
      cbDB.ItemIndex := cbDB.Properties.Items.IndexOfObject(TObject(FCurrDBID));

    except
      on e:Exception do ssMessageDlg(rs('frmLogin', 'Err_ConnError', 1) + e.Message, ssmtError, [ssmbOk] {$IFDEF DEBUG}, '', False, True{$ENDIF});
    end;

    Screen.Cursor := crDefault;

  finally  
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

end;

//==============================================================================================
procedure TfrmLogin.btnDBWizClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnDBWizClick') else _udebug := nil;{$ENDIF}

  try // finally
    if not SConn.Connected then begin
      SConn.DBConnectAtOnce := False;

      if not ConnectToServer then begin
        SConn.DBConnectAtOnce := True;
        Exit;
      end;
    end; // if not SConn.Connected

    SConn.DBConnectAtOnce := True;

    {if SConn.AppServer.CheckLogin(edUser.Text, edPass.Text,
      Integer(cbDB.Properties.Items.Objects[cbDB.ItemIndex]), False) < 0 then begin
      ssMessageDlg(rs('frmLogin', 'NoDBCreatePerm'), ssmtError, [ssmbOk]);
      Exit;
    end;
    }

    {$IFDEF LIMITED}
      cbDBPropertiesInitPopup(cbDB); // init databases list
      if limitDatabasesCount <= cbDB.Properties.Items.Count - 1 then begin // count - 1 for no default db item
        ssMessageDlg(rs('limits', 'DBCount', 1), ssmtError, [ssmbOk]);
        Exit;
      end;
    {$ENDIF}

    with TfrmStartWiz.Create(nil) do
    try
      ParentHandle := Self.Handle;
      WizType := wtDB;
      defaultConn := Self.SConn;
      NeedClose := True;
      NeedReconnect := True;
      ShowModal;

    finally
      Free;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TfrmLogin.CheckEmptyPassword: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.CheckEmptyPassword') else _udebug := nil;{$ENDIF}

  Result := True;

  if Trim(edPass.Text) = '' then begin
    Result := False;
    ssMessageDlg(rs('frmLogin', 'InvalidUser'), ssmtError, [ssmbOk]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.WMRefresh') else _udebug := nil;{$ENDIF}

  FDBListLoaded := False;
  cbDBPropertiesInitPopup(cbDB);
  cbDB.ItemIndex := cbDB.Properties.Items.IndexOfObject(TObject(M.WParam));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.edHostPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.edHostPropertiesChange') else _udebug := nil;{$ENDIF}

  FDBListLoaded := False;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.btnCancelClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnCancelClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.WMLayoutChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  lLang.Caption := keyboardIndicator;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.edUserKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.edUserKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.aHelpExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.aHelpExecute') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('Login');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLogin.btnHostClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.btnHostClick') else _udebug := nil;{$ENDIF}

  with TfrmSelectHost.Create(nil) do
    try
      if ShowModal = mrOk then edHost.Text := lvMain.Selected.Caption;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmLogin.ConnectToServer: boolean;
  var
    FHost, FPort: String;
    port: Integer;
    noScktSrvr: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLogin.ConnectToServer') else _udebug := nil;{$ENDIF}

  Result := False;

  if Trim(edHost.Text) = ''
    then FHost := 'localhost'
    else FHost := Trim(edHost.Text);

  edHost.Text := FHost;
  if not SetHostPort(SConn, FHost) then Exit;

  try  // finally
    CheckSocketServer(SConn);

    try
      edHost.Style.Font.Color := clWindowText;

      if not SConn.Connected then SConn.Open;

    except
      on e: Exception do edHost.Style.Font.Color := clRed;
    end;

    Result := SConn.Connected;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Login', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
