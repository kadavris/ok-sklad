{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit fMessageDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ExtCtrls,
  ssBaseSkinForm, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, 
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit, cxCheckBox,
  xButton, xBevel, ActnList;

const
  MaxWidth = 400;
  MaxHeight = 800;

type
  TssmdType = (ssmtError, ssmtConfirmation, ssmtWarning, ssmtInformation);
  TssmdButton = (ssmbOK, ssmbCancel, ssmbYes, ssmbNo, ssmbYesForAll, ssmbSkip);
  TssmdButtons = set of TssmdButton;

  TfrmMessageDlg = class(TfrmBaseSkin)
    aClose: TAction;
    ActionList1: TActionList;
    btnBigSend: TxButton;
    btnCancel: TxButton;
    btnCopy: TssSpeedButton;
    btnNo: TxButton;
    btnOK: TxButton;
    btnSendErrMsg: TssSpeedButton;
    btnSkip: TxButton;
    btnYes: TxButton;
    btnYesForAll: TxButton;
    bvlText: TssBevel;
    chbDontShow: TcxCheckBox;
    ImagesMsg: TImageList;
    imgMain: TImage;
    memoLog: TMemo;
    panButtons: TPanel;
    panCheck: TPanel;
    panMain: TPanel;
    panText: TPanel;

    procedure aCloseExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnSendErrMsgClick(Sender: TObject);
    procedure btnSkipClick(Sender: TObject);
    procedure btnYesClick(Sender: TObject);
    procedure btnYesForAllClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FSender, FUserMessage: string;

    procedure ShowButtons(AButtons: TssmdButtons);
    procedure SetMsgText(const AText: string);
    procedure SetCaptions;

    function GetMaxStrWidth(const AText: string): Integer;
  end;

//------------------------------------------------------------------------------------------
  function ssMessageDlg(const AText: string; AType: TssmdType; AButtons:
                        TssmdButtons; ASender: string = ''; ADontShowInFuture: Boolean = False;
                        AShowAddButtons: Boolean = False): TModalResult;

//------------------------------------------------------------------------------------------
var
  frmMessageDlg: TfrmMessageDlg;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFNDEF PKG}prFun, {$ENDIF}
  StrUtils, ssBaseConst, ssStrUtil, prConst, ssRegUtils, clipbrd, Udebug, protection;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function ssMessageDlg(const AText: string; AType: TssmdType; AButtons: TssmdButtons;
                      ASender: string = ''; ADontShowInFuture: Boolean = False;
                      AShowAddButtons: Boolean = False): TModalResult;

  var
    i, intTmp: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ssMessageDlg') else _udebug := nil;{$ENDIF}

  if ReadFromRegInt(MainRegKey, ASender, intTmp) and (intTmp = 1) then begin
    Result := mrYes;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmMessageDlg.Create(nil) do
    try
      if AShowAddButtons then memoLog.text := udebugDump(False);

      panCheck.Visible := ADontShowInFuture;
      ShowButtons(AButtons);
      SetMsgText(AText);

      case AType of
        ssmtWarning:      i := 0;
        ssmtError:        i := 1;
        ssmtInformation:  i := 2;
        ssmtConfirmation: i := 3
        else i := 2;
      end;

      btnCopy.Visible := AShowAddButtons;
      btnSendErrMsg.Visible := AShowAddButtons;
      btnBigSend.Visible := AShowAddButtons;

      FSender := ASender;
      ImagesMsg.GetBitmap(i, imgMain.Picture.Bitmap);
      Result := ShowModal;

    finally
      Free;
    end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TfrmMessageDlg }
//==============================================================================================
procedure TfrmMessageDlg.SetCaptions;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMessageDlg.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    btnYes.Caption := GetRS('Common', 'Yes');
    btnYesForAll.Caption := GetRS('Common', 'YesForAll');
    btnSkip.Caption := GetRS('Common', 'Skip');
    btnNo.Caption := GetRS('Common', 'No');
    btnCancel.Caption := GetRS('Common', 'Cancel');
    btnOk.Caption := GetRS('Common', 'OK');
    btnCopy.Hint := GetRS('Common', 'CopyErrToClipboard');
    btnSendErrMsg.Hint := GetRS('Common', 'SendErrMessage');
    btnBigSend.Hint := GetRS('Common', 'SendErrMessage');
    btnBigSend.Caption := GetRS('Common', 'SendErrMsgShort');

    {$IFNDEF PKG}panTitleBar.Caption := OK_AppName;{$ENDIF}

    chbDontShow.Properties.Caption := GetRS('Common', 'DontShowInFuture');
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmMessageDlg.GetMaxStrWidth(const AText: string): Integer;
  var
    i, l: Integer;
    s: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.GetMaxStrWidth') else _udebug := nil;{$ENDIF}

  Result := 0;
  for i := 1 to WordCount(AText, [#13]) do begin
    s := ExtractWord(i, AText, [#13]);
    l := Self.Canvas.TextWidth(s);

    if l > Result then Result := l;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.SetMsgText(const AText: string);
  const
    Als: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);

  var
    Flags: Longint;
    R: TRect;
    W, H: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.SetMsgText') else _udebug := nil;{$ENDIF}

  FUserMessage := Atext;
  bvlText.Caption := AnsiReplaceStr(AText, '\n', #13#10);
  W := GetMaxStrWidth(bvlText.Caption);

  if W > bvlText.Width then begin
    if W > MaxWidth then W := MaxWidth;
    Self.Width := Self.Width + W - bvlText.Width + 20;
  end;

  Flags := DT_CALCRECT or DT_EXPANDTABS or DT_WORDBREAK or Als[bvlText.Alignments.Horz];
  Flags := DrawTextBiDiModeFlags(Flags);
  R := bvlText.ClientRect;
  H := DrawText(Self.Canvas.Handle, PChar(bvlText.Caption), -1, R, Flags);

  if H > bvlText.Height then begin
    if H > MaxHeight then H := MaxHeight;
    Self.Height := Self.Height + H - bvlText.Height + 20;
  end;

  if panCheck.Visible then Self.Height := Self.Height + 20;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.ShowButtons(AButtons: TssmdButtons);
  var
    bLeft: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.ShowButtons') else _udebug := nil;{$ENDIF}

  bLeft := panButtons.Width - 1;

  btnOk.Visible := ssmbOK in AButtons;
  btnCancel.Visible := ssmbCancel in AButtons;
  btnYes.Visible := ssmbYes in AButtons;
  btnSkip.Visible := ssmbSkip in AButtons;
  btnYesForAll.Visible := ssmbYesForAll in AButtons;
  btnNo.Visible := ssmbNo in AButtons;

  if btnCancel.Visible then begin
    btnCancel.Left := bLeft - 4 - btnCancel.Width;
    bLeft := btnCancel.Left;
  end;

  if btnNo.Visible then begin
    btnNo.Left := bLeft - 4 - btnNo.Width;
    bLeft := btnNo.Left;
  end;

  if btnYesForAll.Visible then begin
    btnYesForAll.Left := bLeft - 4 - btnYesForAll.Width;
    bLeft := btnYesForAll.Left;
  end;

  if btnSkip.Visible then begin
    btnSkip.Left := bLeft - 4 - btnSkip.Width;
    bLeft := btnSkip.Left;
  end;

  if btnYes.Visible then begin
    btnYes.Left := bLeft - 4 - btnYes.Width;
    bLeft := btnYes.Left;
  end;

  if btnOk.Visible then begin
    btnOk.Left := bLeft - 4 - btnOk.Width;
    bLeft := btnOk.Left;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.FormCreate(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  SetCaptions;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnOKClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnOKClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnYesClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnYesClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnNoClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnNoClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrNo;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnCancelClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnCancelClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.aCloseExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.aCloseExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnYesForAllClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnYesForAllClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrYesToAll;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if chbDontShow.Checked
    then WriteToRegInt(MainRegKey, FSender, Integer(chbDontShow.Checked));

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnSkipClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnSkipClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrIgnore;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnCopyClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnCopyClick') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}
  with Clipboard do begin
    Open;
    Clear;
    SetTextBuf(PChar('<HTML><BODY>'#13#10'Error Message: ' + FUserMessage + #13#10'<P>'#13#10 + CollectTechInfo(True)
                 + #13#10'<P>Debug Dump:<P>'#13#10 + encodeKey(udebugDump(False)) + #13#10'</HTML></BODY>'));
    Close;
  end;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.btnSendErrMsgClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnSendErrMsgClick') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}
  SendMsg(bvlText.Caption);
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMessageDlg.FormShow(Sender: TObject);
  var
    showLog: Boolean;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMessageDlg.btnSendErrMsgClick') else _udebug := nil;{$ENDIF}

  inherited;

  showLog := {$IFDEF DEBUG}True{$ELSE}(cmdLineDebugLevel > 9){$ENDIF} and (trim(memoLog.Text) <> '');

  if showLog then begin
    if not memoLog.Visible then begin
      memoLog.Visible := True;
      Self.Height := Self.Height + memoLog.Height;
    end;
  end
  else begin
    if memoLog.Visible then begin
      memoLog.Visible := False;
      Self.Height := Self.Height - memoLog.Height;
    end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fMessageDlg', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
