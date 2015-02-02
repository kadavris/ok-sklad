{$I ok_sklad.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit ActivationDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton,
  ssSpeedButton, ssPanel, ssGradientPanel, ExtCtrls, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit,
  cxProgressBar, cxRadioGroup, ComCtrls;

type
  TActivationDlg = class(TBaseDlg)
    pcMain: TPageControl;
    tsLogin: TTabSheet;
    lEmail: TcxLabel;
    edEmail: TcxTextEdit;
    edPassword: TcxTextEdit;
    lPassword: TcxLabel;
    tsDistributions: TTabSheet;
    rgDistributions: TcxRadioGroup;
    tsTimer: TTabSheet;
    Timer1: TTimer;
    pbMain: TcxProgressBar;
    btnActivate: TxButton;
    tsServerAddress: TTabSheet;
    lServAddr: TcxLabel;
    edServAddr: TcxTextEdit;
    btnServaddr: TxButton;
    lServAddrMsg: TcxLabel;
    lDistrMsg: TcxLabel;
    lLoginMsg: TcxLabel;
    lTimerMsg: TcxLabel;
    btnHost: TssSpeedButton;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnActivateClick(Sender: TObject);
    procedure rgDistributionsPropertiesChange(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure btnServaddrClick(Sender: TObject);
    procedure btnHostClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    Host, URL, Req, Resp: String;
    ServerConnChecked: Boolean;
    FkeyState: Integer;

    procedure SetCaptions; override;
    procedure StartTimer(secs: Integer; Msg: String);
    procedure StopTimer;
    function  CheckWebConn: Boolean;
    function  CheckServerConnection: Boolean;

  public
    ServerHardwareID, newServerKey: String;
    AskForServerAddress: Boolean;
    function getKeyState: Integer;
  end;

var
  fActivationDlg: TActivationDlg;

//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  WebReq, ssRegUtils, prConst, fMessageDlg, ClientData, prFun, Protection,
  xLngDefs, SelectHost, StrUtils;

const
  resSection = 'ActDlg';

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$R *.dfm}

//==============================================================================================
function TActivationDlg.getKeyState: Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.getKeyState') else _udebug := nil;{$ENDIF}

  Result := FkeyState;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.Timer1Timer(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.Timer1Timer') else _udebug := nil;{$ENDIF}

  pbMain.Position := pbMain.Position + 1;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  SetCaptions;
  
  AskForServerAddress := False;
  ServerConnChecked := True;

  Host := URL_KeyHost;
  URL := URL_KeyActivate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.StartTimer(secs: Integer; Msg: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.StartTimer') else _udebug := nil;{$ENDIF}

  pbMain.Position := 0;
  pbMain.Properties.Max := secs;
  pcMain.ActivePage := tsTimer;
  lTimerMsg.Caption := rs(resSection, Msg);
  Timer1.Enabled := True;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.StopTimer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.StopTimer') else _udebug := nil;{$ENDIF}

  Timer1.Enabled := False;
  pbMain.Position := pbMain.Properties.Max;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  panTitleBar.Caption := rs(resSection, 'Title');

  lEmail.Caption := rs(resSection, 'lEmail');
  lPassword.Caption := rs(resSection, 'lPassword');

  lDistrMsg.Caption := rs(resSection, 'lDistrMsg');
  lLoginMsg.Caption := rs(resSection, 'lLoginMsg');
  lTimerMsg.Caption := rs(resSection, 'lTimerMsg');

  lServAddr.Caption := rs(resSection, 'lServAddr');
  lServAddrMsg.Caption := rs(resSection, 'lServAddrMsg');

  btnHost.Hint := RS('frmLogin', 'SelectHost');
  btnActivate.Caption := RS(resSection, 'btnActivate');
  btnServAddr.Caption := RS(resSection, 'btnServAddr');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.rgDistributionsPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.rgDistributionsPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;
  btnOK.Enabled := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.FormCloseQuery') else _udebug := nil;{$ENDIF}

  CanClose := True;

  if ModalResult in [mrCancel] then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TActivationDlg.CheckWebConn: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.CheckWebConn') else _udebug := nil;{$ENDIF}

  startTimer(15, 'CheckConn');

  Result := True;
  if not WebQuickPost(Host, URL, 'op=addkey', Resp, 15000) or (AnsiMidStr(Resp,1,5) <> 'READY') then begin
    StopTimer;
    Result := False;
    ssMessageDlg(rs(resSection, 'CheckConnErr', 1) + Resp, ssmtError, [ssmbOK]);
  end;

  StopTimer;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.FormShow(Sender: TObject);
  var
    s: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if ReadFromRegStr(PrRegKey, 'ActEMail', s) then edEmail.Text := s;

  if AskForServerAddress then begin // need to ask for server address and then query its key by myself
    pcMain.ActivePage := tsServerAddress;
  end
  else begin
    if not CheckWebConn then ModalResult := mrCancel;
    pcMain.ActivePage := tsLogin;
  end;

  btnOK.Enabled := False;

  if (Host = '') or (URL = '') then ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.btnActivateClick(Sender: TObject);
  var
    sl: TStringList;
    i, ii, n: Integer;
    item: TcxRadioGroupItem;
    AservKey, AservMsg: OleVariant;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.btnActivateClick') else _udebug := nil;{$ENDIF}

  try //finally
    if (trim(edEmail.Text) = '') or (trim(edPassword.Text) = '') then Exit;
    WriteToRegStr(PrRegKey, 'ActEMail', trim(edEmail.Text));

    Req := 'op=addkey' + crlf + 'l=' + encodeKey(edEmail.Text) + crlf + 'p=' + encodeKey(edPassword.Text)
           + crlf + 'h=' + ServerHardwareID + crlf + 'lang=' + LangName;

    if rgDistributions.Properties.Items.Count > 0 then begin
      if rgDistributions.ItemIndex <> -1 then Exit; // no distr selected

      Req := Req + crlf + 'd=' + VarToStr(rgDistributions.Properties.Items[rgDistributions.ItemIndex].Value);
    end;

    startTimer(30, 'Activating');

    if WebQuickPost(Host, URL, Req, Resp, 30000) then begin
      StopTimer;

      sl := TStringList.Create;
      sl.Text := Resp;

      if AnsiMidStr(sl[0], 1, 8) = 'BADLOGIN' then begin
        pcMain.ActivePage := tsLogin;
        ssMessageDlg(rs(resSection, 'Err_Login'), ssmtError, [ssmbOK]);
        Exit;

      end
      else if AnsiMidStr(sl[0], 1, 2) = 'OK' then begin
        if AnsiMidStr(sl[1], 1, 4) = 'DCNT' then begin // check if we have many distributions and need to chose one

          ii := StrToInt(AnsiMidStr(sl[1], 6, length(sl[1]))); // distributions count

          rgDistributions.Clear;
          rgDistributions.Properties.BeginUpdate;
          for i := 2 to ii + 1 do begin
            item := TcxRadioGroupItem(rgDistributions.Properties.Items.Add);
            item.Value := StrToInt(AnsiMidStr(sl[i], 2, pos(' ', sl[i]) - 2 ));
            item.Caption := AnsiMidStr(sl[i], pos(' ', sl[i]) + 1, length(sl[i])) + ' (';
            item.Caption := item.Caption + rs(resSection, 'ActState' + ifThen(AnsiMidStr(sl[i], 1, 1) = '+', 'On', 'Off')) + ')';
          end;
          rgDistributions.Properties.EndUpdate;

          pcMain.ActivePage := tsDistributions;

          Exit;

        end; // many distrs

        sl.Delete(0);
        newServerKey := sl.Text;
        sl.Destroy;

        // pushing key to the server
        AServKey := encodeKey('type=A' + crlf + decodeKey(newServerKey));
        try
          if not dmData.Sconnection.Connected then dmData.SConnection.Open;
          dmData.Sconnection.AppServer.ClientRegInfo(AServKey, AServKey, AServMsg);
          //dmData.Sconnection.Close; // probably, we won't use it here anymore ;)

          FkeyState := AServMsg; // that can be read from outside

        except
          on e: Exception do begin
            FkeyState := -1;
            ssMessageDlg(rs(resSection, 'WebRegErr', 1) + e.Message, ssmtError, [ssmbOK]);
          end;
        end;

        //WriteToRegStr(PrRegKey, 'AType', newServerKey); //saving key

        // now checking what our server thinks about this key
        if RegKeyIsValid(FkeyState) then begin
          ssMessageDlg(rs(resSection, 'WebRegOK'), ssmtInformation, [ssmbOK]);
          ModalResult := mrOK;
          Exit;

        end
        else ssMessageDlg(rs('frmLogin', 'Err_ActDenied'), ssmtError, [ssmbOk]); // strange shit happens. maybe banned customer

      end // else if sl[0] = 'OK'
      else ssMessageDlg(rs(resSection, 'WebRegErr', 1) + Resp, ssmtError, [ssmbOK]); // general error. maybe at activation server side.
    end
    else begin // general request error
      StopTimer;
      pcMain.ActivePage := tsLogin;
      WriteToRegStr(PrRegKey, 'AType', '');  //saving key
      ssMessageDlg(rs(resSection, 'WebRegErr', 1) + Resp, ssmtError, [ssmbOK]);
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
// OK is enabled if distributions are exists and one of them was selected for activation
procedure TActivationDlg.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.aOKExecute') else _udebug := nil;{$ENDIF}

  inherited;
  btnActivateClick(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TActivationDlg.CheckServerConnection: Boolean;
  var
    AservKey, AservMsg: OleVariant;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.CheckServerConnection') else _udebug := nil;{$ENDIF}

  ServerConnChecked := False;
  ServerHardwareID := '';

  Result := CheckSocketServer(dmData.SConnection);
  if not Result then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;


  try
    AservKey := '';
    AservMsg := '';
    sleep(1000);
    if not dmData.Sconnection.Connected then dmData.SConnection.Open;
    dmData.SConnection.AppServer.ClientRegInfo('', AServKey, AServMsg); // getting state of server's key
    ServerHardwareID := AservKey;
    FkeyState := AServMsg;

    ServerConnChecked := True;

  except
  end;

  Result := ServerConnChecked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.btnServaddrClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.btnServaddrClick') else _udebug := nil;{$ENDIF}

  if Trim(edServAddr.Text) = '' then edServAddr.Text := 'localhost';
  dmData.SConnection.Host := Trim(edServAddr.Text);

  if not CheckServerConnection then begin
    ssMessageDlg(rs(resSection, 'Err_ServConn'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if RegKeyIsValid(FkeyState) then begin
    ModalResult := mrCancel; // key is good
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  pcMain.ActivePage := tsLogin;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TActivationDlg.btnHostClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TActivationDlg.btnHostClick') else _udebug := nil;{$ENDIF}

  with TfrmSelectHost.Create(nil) do
    try
      if ShowModal = mrOk then edServaddr.Text := lvMain.Selected.Caption;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ActivationDlg', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}
end.

