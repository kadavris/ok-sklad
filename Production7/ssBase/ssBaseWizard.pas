{$I ok_sklad.inc}
unit ssBaseWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBevel, ImgList, ssSpeedButton, ExtCtrls, ssPanel,
  ssGradientPanel, StdCtrls, cxLookAndFeelPainters, ActnList, cxButtons,
  cxControls, cxPC, ssBaseSkinForm, xButton;

type
  TfrmBaseWizard = class(TfrmBaseSkin)
    panButtons: TPanel;
    ssBevel1: TssBevel;
    ActionList: TActionList;
    aCancel: TAction;
    aNext: TAction;
    aPrior: TAction;
    pcMain: TcxPageControl;
    tsMain: TcxTabSheet;
    btnPrior: TxButton;
    btnCancel: TxButton;
    btnNext: TxButton;
    panHeader: TPanel;
    ssBevel9: TssBevel;
    btnLock: TssSpeedButton;
    btnSendErrMessage: TssSpeedButton;
    btnHelp: TssSpeedButton;

    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPriorExecute(Sender: TObject);
    procedure aNextExecute(Sender: TObject);
    procedure btnPriorGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure pcMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnSendErrMessageClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);

  private
    function FindNextPage(AGoForward: boolean; AStartIndex: integer): integer;

  protected
    CancelPressed: boolean;
    procedure SetCaptions; virtual;

  public
    ParentHandle: HWND;
  end;

var
  frmBaseWizard: TfrmBaseWizard;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssBaseConst, prConst, ssFun, prFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBaseWizard.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;
  CancelPressed := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aPrior.Enabled := (pcMain.ActivePageIndex > 0);
  aNext.Enabled := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.aPriorExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.aPriorExecute') else _udebug := nil;{$ENDIF}

  i := FindNextPage(False, pcMain.ActivePageIndex);
  if i <> -1 then pcMain.ActivePageIndex := i;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.aNextExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.aNextExecute') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePageIndex <> pcMain.PageCount - 1
    then pcMain.ActivePageIndex := FindNextPage(True, pcMain.ActivePageIndex)
    else ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.btnPriorGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.btnPriorGetDrawParams') else _udebug := nil;{$ENDIF}

  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    btnLock.Hint := GetRS('Common', 'Lock');
    btnHelp.Hint := GetRS('Common', 'Help');
    btnSendErrMessage.Hint := GetRS('Common', 'SendErrMessage');
    aPrior.Caption := '< ' + GetRS('Common', 'Prior');
    aCancel.Caption := GetRS('Common', 'Cancel');

    if pcMain.ActivePageIndex = pcMain.PageCount - 1
      then aNext.Caption := GetRS('Common', 'Finish')
      else aNext.Caption := GetRS('Common', 'Next') + ' >';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.pcMainChange') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePageIndex = pcMain.PageCount - 1
    then aNext.Caption := LangMan.GetRS('Common', 'Finish')
    else aNext.Caption := LangMan.GetRS('Common', 'Next') + ' >';

  try
    pcMain.SetFocus;
    Perform(WM_NEXTDLGCTL, 0, 0);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmBaseWizard.FindNextPage(AGoForward: boolean; AStartIndex: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  Result := -1;
  if (AStartIndex < 0) or (pcMain.PageCount <= AStartIndex) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.FindNextPage') else _udebug := nil;{$ENDIF}

  if AGoForward then begin
    if pcMain.Pages[AStartIndex + 1].Tag = 1
      then Result := FindNextPage(AGoForward, AStartIndex + 1)
      else Result := AStartIndex + 1;
  end
  else begin
    if pcMain.Pages[AStartIndex - 1].Tag = 1
      then Result := FindNextPage(AGoForward, AStartIndex - 1)
      else Result := AStartIndex - 1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.btnLockClick') else _udebug := nil;{$ENDIF}

  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.btnSendErrMessageClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.btnSendErrMessageClick') else _udebug := nil;{$ENDIF}

  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWizard.btnHelpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWizard.btnHelpClick') else _udebug := nil;{$ENDIF}

  ShowHelpTopic(Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseWizard', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
