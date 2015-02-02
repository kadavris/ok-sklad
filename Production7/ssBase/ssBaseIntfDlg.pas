{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit ssBaseIntfDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, ActnList, xButton, 

  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,

  dxDBGrid6, dxTL6,

  okSearchEdit, ssDBGrid, ssBaseSkinForm, ssSpeedButton, ssPanel, ssGradientPanel;

type
  TfrmBaseIntfDlg = class(TfrmBaseSkin)
    aApply: TAction;
    aCancel: TAction;
    ActionList: TActionList;
    aOK: TAction;
    btnApply: TxButton;
    btnCancel: TxButton;
    btnOK: TxButton;
    panButtons: TPanel;

    procedure aApplyExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure GoNextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  protected
    EditingDisabled: Boolean; // used to indicate that current user is not the owner hence no right to save
  end;

var
  frmBaseIntfDlg: TfrmBaseIntfDlg;

//==============================================================================================
implementation

uses
  {$IFNDEF PKG}prFun, {$ENDIF}
  ssBaseConst, prConst, prTypes, Udebug, clientData, fMessageDlg;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBaseIntfDlg.aApplyExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.aApplyExecute') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}
  if EditingDisabled
    then ssMessageDlg(rs('Common', 'notAdocOwner'), ssmtError, [ssmbOK], '', False, False)
    else ModalResult := mrYes;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.aOKExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.aOKExecute') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}
  if EditingDisabled
    then ssMessageDlg(rs('Common', 'notAdocOwner'), ssmtError, [ssmbOK], '', False, False)
    else ModalResult := mrOk;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.aCancelExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.GoNext(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.GoNext') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key = #13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.GoNextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.GoNextKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
   case Key of
     VK_UP  : Perform(WM_NEXTDLGCTL, 1, 0);
     VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
   end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  var
    Ctrl: TWinControl;
    //_udebug: Tdebug;
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    Ctrl := Self.ActiveControl;

    if (Ctrl is TcxCustomInnerTextEdit)
       and ((Ctrl as TcxCustomInnerTextEdit).Parent is TcxCustomDropDownEdit)
            and not (TcxCustomDropDownEdit((Ctrl as TcxCustomInnerTextEdit).Parent).DroppedDown
       )
    then begin
      case Key of
        VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP  : Perform(WM_NEXTDLGCTL, 1, 0);
      end;

      Key := 0;
    end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.FormShow(Sender: TObject);
  var
    i: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFNDEF PKG}
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TdxDBGrid then
      with (Components[i] as TdxDBGrid) do begin
        HighlightColor := GridHighlightColor;
        HighlightTextColor := clWindow;
        HideSelectionColor := GridHideSelColor;
        HideSelectionTextColor := clWindow;
        HideFocusRect := True;
        HeaderColor := clokGridHeader;
        setFontStyle(Font, True);
      end

    else if Components[i] is TssDBTreeList then
      with (Components[i] as TssDBTreeList) do begin
        HighlightColor := GridHighlightColor;
        HighlightTextColor := clWindow;
        HideSelectionColor := GridHideSelColor;
        HideSelectionTextColor := clWindow;
        HideFocusRect := True;
        HeaderColor := clokGridHeader;
        setFontStyle(Font, True);
      end

    else if Components[i] is TokSearchEdit then
      with (Components[i] as TokSearchEdit) do begin
        GoNextOnEnter := NextCtrlOnEnter;
      end;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.FormCreate(Sender: TObject);
  var
    i: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFNDEF PKG}
  if not NextCtrlOnEnter then btnOk.Default := True;

  {for i := 0 to ComponentCount - 1 do begin
    if Components[i] is TControl then begin
      THackCtrl(Components[i]).Font.Name := Font_Main.Name;
      THackCtrl(Components[i]).Font.Charset := Font_Main.Charset;
    end;

    if Components[i] is TcustomdxTreeListControl then begin
      THackdxTL(Components[i]).BandFont.Name := Font_Main.Name;
      THackdxTL(Components[i]).BandFont.Charset := Font_Main.Charset;
      THackdxTL(Components[i]).HeaderFont.Name := Font_Main.Name;
      THackdxTL(Components[i]).HeaderFont.Charset := Font_Main.Charset;
      THackdxTL(Components[i]).Font.Name := Font_Main.Name;
      THackdxTL(Components[i]).Font.Charset := Font_Main.Charset;
    end;
  end;
  }

  EditingDisabled := False;
  {$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseIntfDlg.FormDestroy(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseIntfDlg.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseIntfDlg', @Debugging, DEBUG_group_ID);
  {$ENDIF}


//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
