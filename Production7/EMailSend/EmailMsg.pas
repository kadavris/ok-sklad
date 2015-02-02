{$I ok_sklad.inc}
unit EmailMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, ssSpeedButton, ExtCtrls, cxControls, cxContainer,
  cxCheckListBox, DB, ssMemDS,
  cxEdit, cxTextEdit, cxMemo,
  cxGroupBox, ssGroupBox, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, StdCtrls, IdAntiFreezeBase, IdAntiFreeze,
  JvExStdCtrls, JvHtControls;

type
  TfrmSendMsg = class(TBaseDlg)
      gbMsg: TssGroupBox;
      edMsg: TcxMemo;
      edSubject: TcxMemo;
      lSubject: TLabel;
      lMsg: TLabel;
      IdAntiFreeze1: TIdAntiFreeze;
      lImp: TLabel;
      lImpText: TLabel;
      lemail: TLabel;
      edEmail: TcxTextEdit;
      lText: TJvHTLabel;

      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
      procedure FormCreate(Sender: TObject);

    private
      FSentBytes, FtoSend: Integer;
      FStartTime: TDateTime;

      procedure HTTPwork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
  end;

  function SendEmail(const AHost, AUser, APass, ASubject, ATo, AFrom, AText: String; Quiet: Boolean = False): boolean;

var
  frmSendMsg: TfrmSendMsg;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, ssBaseConst, ssBaseIntfDlg, fMessageDlg, synachar, synacode, prFun,
  CCMain, IdSMTP, IdMessage, prConst, ssRegUtils, StrUtils, udebug, xLngDefs, Protection,
  WebReq, jpeg, DateUtils, ssStrUtil;

const
  Addresses: array[0..1, 0..2] of String = (
    ('ok-inventory.com', 'bugs@ok-inventory.com', ''),
    ('ok-sklad.com', 'bugs@ok-sklad.com', '')
  );

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function makeScreenShot: TJPEGImage;
  var
    Canvas: TCanvas;
    ScreenV: HDC;
    b: TBitmap;
begin
  Result := TjpegImage.Create;
  b := TBitmap.Create;
  ScreenV := GetDC(0);
  Canvas := TCanvas.Create;
  Canvas.Handle := ScreenV;
  Result.CompressionQuality := 80;
  b.Width := Screen.Width;
  b.Height := Screen.Height;
  b.Canvas.Copyrect(Rect(0, 0, b.Width, b.Height), Canvas, Rect(0, 0, Screen.Width, Screen.Height));
  Result.Assign(b);
  ReleaseDC(0, ScreenV);
  Canvas.Free;
  b.Free;
end;

//==============================================================================================
procedure TfrmSendMsg.HTTPwork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
  var
    total, speed: Extended;
    m: String;
begin
  if AWorkMode = wmRead then Exit;

  if AWorkCount > 1048576 then begin
    total := AWorkCount / 1048576;
    m := 'Mb';
  end
  else if AWorkCount > 1024 then begin
    total := AWorkCount / 1024;
    m := 'Kb';
  end
  else begin
    total := AWorkCount;
    m := 'b';
  end;
  total := Int(total * 100) / 100;
  if SecondsBetween(now, FStartTime) = 0
    then speed := 1
    else speed := AWorkCount / SecondsBetween(now, FStartTime) / 1024;
  speed := Int(speed * 10) / 10;

  fProgress.InfoDet := FloatToStr(total) + ' ' + m + ' ' + rs('', 'sent') + ' (' + FloatToStr(speed) + rs('', 'speed_kb', 2) + ')';
  fProgress.pbDet.Position := AWorkCount;
end;

//==============================================================================================
procedure TfrmSendMsg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    FSend_Ok: boolean;
    i: integer;
    MsgText, MsgFrom, email, s: String;
    ParentHeader: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSendMsg.FormCloseQuery') else _udebug := nil;{$ENDIF}

  FSentBytes := 0;
  FStartTime := now;

  if ModalResult in [mrOK, mrYes] then
    try // finally
      Screen.Cursor := crHourGlass;
      CanClose := false;
      FSend_Ok := False;

      try
        ParentHeader := '';

        for i := Screen.FormCount - 1 downto 0 do begin
          if (Screen.Forms[i].Visible) and (Screen.Forms[i] <> Self) then begin
            if (Screen.Forms[i] is TfrmCCMain)
              then ParentHeader := ParentHeader + ', ' + TfrmCCMain(Screen.Forms[i]).FrameList.CurrentFrame
              else begin
                if ParentHeader <> ''
                  then ParentHeader := ParentHeader + ', ' + Screen.Forms[i].ClassName
                  else ParentHeader := Screen.Forms[i].ClassName;
              end;
          end;
        end;

      except
        //ssMessageDlg(LangMan.GetRS(Self.Name, 'SendError'), ssmtError, [ssmbOK]);
      end;

      MsgFrom := Trim(edEmail.text);
      email := MsgFrom;

      if (MsgFrom = '') and (RegInfo.Values['user'] <> '') then begin
        email := Trim(RegInfo.Values['email']);
        MsgFrom := RegInfo.Values['user'] + '<' + email + '>';
      end;

      If email <> ''
        then MsgText := 'email=' + EncodeBase64(email) + crlf
        else MsgText := '';

      MsgText := 'hid = ' + trim(CurrentHardwareID) + #13#10'error='
          + EncodeBase64( 'hid = ' + trim(CurrentHardwareID)
            + addNonEmptyLine('From: ', MsgFrom, 1)
            + 'Frames: ' + ParentHeader + #13#10
            + addNonEmptyLine('Message subject: ', edSubject.Text, 3)
            + addNonEmptyLine('Client''s message: ', edMsg.Text, 1)
            + addNonEmptyLine('Server''s error: ', LastServerError, 1)
            + crlf + getUsageStat + crlf + StringOfChar('-', 30) + crlf + CollectTechInfo(True)
            + udebugDump(False)
          );
      FtoSend := Length(MsgText);
      fProgress.pbDet.Max := FtoSend;

      fprogress.HideAll;
      fprogress.Caption := 'Sending';
      fprogress.ProgressMain.Min := 0;
      fprogress.ProgressMain.Max := High(Addresses);
      fProgress.ShowDetail;
      fprogress.Show;

      for i := 0 to High(Addresses) do begin
        fprogress.InfoText := 'Sending to ' + Addresses[i, 0];
        fProgress.InfoDet := '...';

        FSend_Ok := WebQuickPost(URL_KeyHost, 'http://' + Addresses[i, 0] + '/error.php', MsgText, s, 20000, HTTPwork);

        {fprogress.lText.Caption := 'Sending to ' + Addresses[i, 1] + ' via ' + Addresses[i, 0];
        FSend_Ok := SendEmail(Addresses[i, 0], Addresses[i, 1], Addresses[i, 2],
                    '=?windows-1251?Q?' + EncodeQuotedPrintable('Bug Report: ' + edSubject.Text) + '?=',
                    Addresses[i, 1], MsgFrom, MsgText, True);
        }

        fprogress.ProgressMain.StepIt;

        if FSend_Ok then begin
          ssMessageDlg(RS(Self.Name, 'SendOk'){$IFDEF DEBUG} + crlf + 'resp: ' + s{$ENDIF}, ssmtInformation, [ssmbOK]);
          CanClose := True;
          Break;
        end
        else begin
          debugInstantLog('! error send to ' + Addresses[i, 0] + ': ' + s);
          CanClose := False;
        end;
      end; // for i := 0 to High(Addresses)

      fprogress.Hide;
      if not FSend_Ok then ssMessageDlg(RS(Self.Name, 'SendError') + crlf + s, ssmtError, [ssmbOK]);

    finally
      Screen.Cursor := crDefault;

      if trim(MsgFrom) <> '' then WriteToRegStr(MainRegKey + '\', Self.Name, MsgFrom);
    end
  else CanClose := true; //if ModalResult in [mrOK, mrYes]

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSendMsg.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSendMsg.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOK.Enabled := (Length(edSubject.Text) > 3) or (Length(edMsg.Text) > 3);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSendMsg.FormCreate(Sender: TObject);
  var
    s: String;
    //_udebug: Tdebug;
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSendMsg.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edMsg.Clear;
  edSubject.Clear;

  if ReadFromRegStr(MainRegKey + '\', Self.Name, s) and ( trim(s) <> '' )
    then edEmail.Text := s
    else edEmail.Text := RegInfo.Values['email'];

  with LangMan do begin
    lSubject.Caption := GetRS(Self.Name, 'MsgSbj') + ':';
    gbMsg.Caption := ' ' + GetRS(Self.Name, 'SendMsg') + ' ';
    lMsg.Caption := GetRS(Self.Name, 'MsgBody') + ':';
    aOK.Caption := GetRS(Self.Name,'Send');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aHelp.Hint := GetRS('Common','Help');
    aLock.Hint := GetRS('Common','Lock');
    Self.Caption := GetRS('Common','SendErrMessage');
    lText.Caption := GetRS(Self.Name, 'Text');
    lImp.Caption := GetRS(Self.Name, 'Imp') + '!';
    lImpText.Caption := GetRS(Self.Name, 'ImpText');

    lemail.Caption := GetRS(Self.Name, 'lemail');
  end;//with

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function SendEmail(const AHost, AUser, APass, ASubject, ATo, AFrom, AText: String; Quiet: Boolean = False): Boolean;
 var
   LSMTP: TIdSMTP;
   LMsg: TIdMessage;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SendEmail') else _udebug := nil;{$ENDIF}

  Result := True;

  try
    LSMTP := TIdSMTP.Create(nil);
    LMsg := TIdMessage.Create(LSMTP);

    try
      with LMsg do begin
        Subject := ASubject;
        Recipients.EMailAddresses := ATo;
        From.Text := AFrom;
        Body.Text := AText;
        ContentType := 'text/html';
      end;

      with LSMTP do begin
        Host     := AHost;
        Username := AUser;
        Password := APass;

        Connect;

        Send(LMsg);
      end;

    except
      on e:Exception do begin
        Result := False;
        debugInstantLog('! SendEmail to ' + ATo + ' via ' + AHost + ' failed with err: ' + e.Message);
        if not Quiet then ssMessageDlg(e.Message, ssmtError, [ssmbOK], '', False, False);
      end;
    end;

  finally
    LSMTP.Disconnect;
    FreeAndNil(LMsg);
    FreeAndNil(LSMTP);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EmailMsg', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
