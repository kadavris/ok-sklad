{$I ok_sklad.inc}
unit EditCashOrder_RUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ssBevel,
  ExtCtrls, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel,
  ssGradientPanel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, DB, DBClient,
  ssClientDataSet, cxMemo, FR_Class, cxSpinEdit, FR_DSet, FR_DBSet,
  cxCheckBox, FR_E_TXT, FR_E_RTF, xButton, xLngDefs, okMoneyFun;

type
  TfrmEditCashOrder_RUS = class(TfrmBaseSkin)
    panButtons: TPanel;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aPreview: TAction;
    frDoc: TfrReport;
    bvlFooterSep: TssBevel;
    lCount: TLabel;
    edDocCount: TcxSpinEdit;
    sbMain: TScrollBox;
    bvlFrame: TssBevel;
    lEntMFO: TLabel;
    chbDefault: TcxCheckBox;
    ssBevel32: TssBevel;
    ssBevel1: TssBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lNum: TLabel;
    Label5: TLabel;
    lOnDateStr: TLabel;
    Label7: TLabel;
    memKAgent: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    lSumStrShort: TLabel;
    lNDSStrEx: TLabel;
    Label12: TLabel;
    lOnDate: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ssBevel2: TssBevel;
    Label17: TLabel;
    Label18: TLabel;
    ssBevel3: TssBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    edOKUD: TcxTextEdit;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    Label24: TLabel;
    Label25: TLabel;
    ssBevel8: TssBevel;
    Label26: TLabel;
    ssBevel9: TssBevel;
    Label27: TLabel;
    Label28: TLabel;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    Label23: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel18: TssBevel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    ssBevel19: TssBevel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    ssBevel20: TssBevel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    ssBevel21: TssBevel;
    ssBevel22: TssBevel;
    ssBevel23: TssBevel;
    edDebet: TcxTextEdit;
    ssBevel24: TssBevel;
    ssBevel25: TssBevel;
    ssBevel26: TssBevel;
    edCorrAcc: TcxTextEdit;
    ssBevel27: TssBevel;
    lSum: TssBevel;
    ssBevel29: TssBevel;
    ssBevel30: TssBevel;
    Label41: TLabel;
    ssBevel31: TssBevel;
    lKAgent: TLabel;
    Label43: TLabel;
    ssBevel33: TssBevel;
    Label44: TLabel;
    lSumStr: TLabel;
    lNDSStr: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    ssBevel34: TssBevel;
    Label50: TLabel;
    ssBevel35: TssBevel;
    Label51: TLabel;
    ssBevel36: TssBevel;
    Label52: TLabel;
    ssBevel37: TssBevel;
    Label53: TLabel;
    edNum: TcxTextEdit;
    edOnDate: TcxDateEdit;
    lEnt: TLabel;
    lNDS: TLabel;
    lNDSEx: TLabel;
    memTotalStr: TMemo;
    lEntEx: TLabel;
    memReasonEx: TMemo;
    lReason: TLabel;
    btnSave: TxButton;
    btnCancel: TxButton;
    xButton1: TxButton;
    aDel: TAction;
    btnDel: TxButton;
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure btnSaveGetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure edNumPropertiesChange(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure frDocBeginBand(Band: TfrBand);
    procedure edOnDatePropertiesChange(Sender: TObject);
    procedure edDocCountPropertiesChange(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure aDelExecute(Sender: TObject);
  private
    FID: integer;
    KAID: integer;
    FModified: boolean;
    FNDS: extended;
    DocExists: Boolean;
    procedure SetID(const Value: integer);
    procedure SetCaptions;
    { Private declarations }
  public
    ParentHandle: HWND;
    property ID: integer read FID write SetID;
  end;

var
  frmEditCashOrder_RUS: TfrmEditCashOrder_RUS;

implementation

uses ClientData, ssFun, prConst, Math, ssBaseConst, prFun, ssDateUtils,
  ssStrUtil, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditCashOrder_RUS.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.aCancelExecute') else _udebug := nil;{$ENDIF}


  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.aSaveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.aSaveExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    TrStart;

    try
      Screen.Cursor := crSQLWait;
      ProviderName := 'pCashOrder_Del';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Execute;

      ProviderName := 'pCashOrder_Ins';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Params.ParamByName('num').AsString := edNum.Text;
      Params.ParamByName('okud').AsString := edOKUD.Text;
      Params.ParamByName('ondate').AsDateTime := edOnDate.Date;
      Params.ParamByName('debet').AsString := edDebet.Text;
      Params.ParamByName('corracc').AsString := edCorrAcc.Text;
      Execute;

      if chbDefault.Checked then begin
        ProviderName := 'pCashOrderParams_Del';
        Params.Clear;
        Execute;

        ProviderName := 'pCashOrderParams_Ins';
        FetchParams;
        Params.ParamByName('okud').AsString := edOKUD.Text;
        Params.ParamByName('debet').AsString := edDebet.Text;
        Params.ParamByName('corracc').AsString := edCorrAcc.Text;
        Params.ParamByName('doccount').AsInteger := edDocCount.Value;
        Execute;
      end;

      TrCommit;
      SendMessage(ParentHandle, WM_REFRESH, ID, 0);
      FModified := False;
      ModalResult := mrOk;

    except
      TrRollback;
      raise;
   end;

  finally
    Screen.Cursor := crDefault;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.aPreviewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.aPreviewExecute') else _udebug := nil;{$ENDIF}

  SmartShowRep(frDoc, 'InCashOrder_rus.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.SetID(const Value: integer);
  var
    s: extended;
    ss: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  with newDataSet do
  try
    ProviderName := 'pCashOrderParams_Get';
    Open;

    if not IsEmpty then begin
      edOKUD.Text := fieldbyname('okud').AsString;
      edDebet.Text := fieldbyname('debet').AsString;
      edCorrAcc.Text := fieldbyname('corracc').AsString;
      edDocCount.Value := fieldbyname('doccount').AsInteger;
    end;

    Close;
    if edDocCount.Value=0 then edDocCount.Value := 1;

    ProviderName := 'pPayOrder_GetDoc';
    FetchParams;
    Params.ParamByName('paydocid').AsInteger := Value;
    Open;
    edNum.Text := fieldbyname('docnum').AsString;
    edOnDate.Date := fieldbyname('ondate').AsDateTime;

    KAID := fieldbyname('kaid').AsInteger;
    lKAgent.Caption := fieldbyname('name').AsString;
    memKAgent.Text := fieldbyname('name').AsString;
    memReasonEx.Text := fieldbyname('reason').AsString;
    lReason.Caption := fieldbyname('reason').AsString;
    s := RoundToA(fieldbyname('onvalue').AsFloat*fieldbyname('total').AsFloat, -2);
    lSum.Caption := ReplaceStr(FormatFloat(MoneyDisplayFormat, s), DecimalSeparator, ',');
    ss := MoneyToStr(s);
    ss := AnsiUpperCase(ss[1])+Copy(ss, 2, Length(ss)-1);
    lSumStr.Caption := ss;
    memTotalStr.Text := ss;
    lSumStrShort.Caption := MoneyToStrShort(s);

    if FieldByname('withnds').AsInteger=1 then begin
      lNDSStr.Visible := True;
      lNDSStrEx.Visible := True;
      FNDS := s-RoundToA(NDSOut(s, NDS), -2);
      lNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS)+' '+BaseCurrShortName;
      lNDSEx.Caption := MoneyToStrShort(FNDS);
    end
    else begin
      lNDSStr.Visible := False;
      lNDSStrEx.Visible := False;
      lNDS.Caption := '';
      lNDSEx.Caption := '';
    end;
    Close;

    ProviderName := 'pCashOrder_Get';
    FetchParams;
    Params.ParamByName('paydocid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      DocExists := True;
      edNum.Text := fieldbyname('num').AsString;
      edOnDate.Date := fieldbyname('ondate').AsDateTime;
      edOKUD.Text := fieldbyname('okud').AsString;
      edDebet.Text := fieldbyname('debet').AsString;
      edCorrAcc.Text := fieldbyname('corracc').AsString;
      FModified := False;
    end;
    Close;

   finally
    Free;
   end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.btnSaveGetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.btnSaveGetDrawParams') else _udebug := nil;{$ENDIF}


  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.FormCreate') else _udebug := nil;{$ENDIF}


  lEnt.Caption := EntFullName;
  lEntEx.Caption := EntName;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aSave.Enabled := (Trim(edNum.Text)<>EmptyStr) and FModified;
  aPreview.Enabled := True;
  btnDel.Visible := DocExists;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.edNumPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.edNumPropertiesChange') else _udebug := nil;{$ENDIF}


  FModified := True;
  lNum.Caption := edNum.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum.Text
  else if 0 = AnsiCompareText(ParName, 'docdatestr') then ParValue := lOnDateStr.Caption
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := DateToStr(edOnDate.Date)
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'entfullname') then ParValue := EntFullName
  else if 0 = AnsiCompareText(ParName, 'total') then ParValue := lSum.Caption
  else if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := lKAgent.Caption
  else if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := lSumStr.Caption
  else if 0 = AnsiCompareText(ParName, 'okud') then ParValue := edOKUD.Text
  else if 0 = AnsiCompareText(ParName, 'debet') then ParValue := edDebet.Text
  else if 0 = AnsiCompareText(ParName, 'corracc') then ParValue := edCorrAcc.Text
  else if 0 = AnsiCompareText(ParName, 'totalstrshort') then ParValue := lSumStrShort.Caption
  else if 0 = AnsiCompareText(ParName, 'nds') then ParValue := FormatFloat(MoneyDisplayFormat, FNDS)
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := lReason.Caption
  else if 0 = AnsiCompareText(ParName, 'withnds')
    then if lNDSStr.Visible
         then ParValue := 1
         else ParValue := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.frDocBeginBand(Band: TfrBand);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.frDocBeginBand') else _udebug := nil;{$ENDIF}


  if band.Typ=btMasterData then begin
    band.IsVirtualDS := True;
    band.DataSet.RangeEndCount := edDocCount.Value;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    panTitleBar.Caption := GetRS('fmPayDoc', 'InCashOrder');

    aCancel.Caption := GetRS('Common', 'Cancel');
    aSave.Caption := GetRS('Common', 'Save');
    aDel.Caption := GetRS('Common', 'Del');
    aPreview.Caption := GetRS('fmPayDoc', 'Preview');
    lCount.Caption := GetRS('fmPayDoc', 'DocCount');

    chbDefault.Properties.Caption := GetRS('fmPayDoc', 'SetDefault');
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.edOnDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}


  FModified := True;
  try
    lOnDate.Caption := DateToStr(edOnDate.EditValue);
    lOnDateStr.Caption := ssDateToStr(edOnDate.EditValue);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.edDocCountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.edDocCountPropertiesChange') else _udebug := nil;{$ENDIF}


  if edDocCount.Value < 1 then edDocCount.Value := 1;
  if edDocCount.Value > 100000 then edDocCount.Value := 100000;

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.GoNext') else _udebug := nil;{$ENDIF}


  if NextCtrlOnEnter and (Key=#13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_RUS.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_RUS.aDelExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pCashOrder_Del';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Execute;
      SendMessage(ParentHandle, WM_REFRESH, ID, 0);
      DocExists := False;
      FModified := True;
      ModalResult := mrOk;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditCashOrder_RUS', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
