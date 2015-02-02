{$I ok_sklad.inc}
unit EditCashOrder_UKR;

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
  TfrmEditCashOrder_UKR = class(TfrmBaseSkin)
    panButtons: TPanel;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aPreview: TAction;
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
    Label7: TLabel;
    memKAgent: TMemo;
    Label8: TLabel;
    lOnDateStr: TLabel;
    Label15: TLabel;
    ssBevel2: TssBevel;
    Label18: TLabel;
    ssBevel3: TssBevel;
    Label20: TLabel;
    Label28: TLabel;
    edCorrAcc: TcxTextEdit;
    Label41: TLabel;
    ssBevel31: TssBevel;
    lKAgent: TLabel;
    Label43: TLabel;
    ssBevel33: TssBevel;
    Label44: TLabel;
    lSumStr: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    edNum: TcxTextEdit;
    memTotalStr: TMemo;
    lEntEx: TLabel;
    ssBevel28: TssBevel;
    lEnt: TLabel;
    Label6: TLabel;
    memReasonEx: TMemo;
    lReason: TLabel;
    ssBevel4: TssBevel;
    ssBevel10: TssBevel;
    ssBevel5: TssBevel;
    ssBevel12: TssBevel;
    edDay: TcxSpinEdit;
    edMonth: TcxSpinEdit;
    lYear: TLabel;
    ssBevel6: TssBevel;
    ssBevel21: TssBevel;
    Label35: TLabel;
    Label4: TLabel;
    ssBevel27: TssBevel;
    ssBevel7: TssBevel;
    Label10: TLabel;
    Label11: TLabel;
    lSum: TssBevel;
    Label13: TLabel;
    ssBevel8: TssBevel;
    Label21: TLabel;
    Label22: TLabel;
    ssBevel9: TssBevel;
    ssBevel11: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    Label9: TLabel;
    ssBevel13: TssBevel;
    frDoc: TfrReport;
    btnSave: TxButton;
    btnCancel: TxButton;
    btnPreview: TxButton;
    btnDel: TxButton;
    aDel: TAction;
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
    procedure edMonthPropertiesChange(Sender: TObject);
    procedure edDayPropertiesChange(Sender: TObject);
    procedure edDocCountPropertiesChange(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure aDelExecute(Sender: TObject);
  private
    FID: integer;
    KAID: integer;
    FModified: boolean;
    FNDS: extended;
    FOnDate: TDateTime;
    DocExists: Boolean;
    procedure SetID(const Value: integer);
    procedure SetCaptions;
    procedure SetOnDate(const Value: TDateTime);
    { Private declarations }
  public
    ParentHandle: HWND;
    property ID: integer read FID write SetID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
  end;

var
  frmEditCashOrder_UKR: TfrmEditCashOrder_UKR;

implementation

uses ClientData, ssFun, prConst, Math, ssBaseConst, prFun, ssDateUtils,
  ssStrUtil, DateUtils, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$R *.dfm}

//==============================================================================================
procedure TfrmEditCashOrder_UKR.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.aSaveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.aSaveExecute') else _udebug := nil;{$ENDIF}

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
      Params.ParamByName('okud').AsString := '';
      Params.ParamByName('ondate').AsDateTime := FOnDate;
      Params.ParamByName('debet').AsString := '';
      Params.ParamByName('corracc').AsString := edCorrAcc.Text;
      Execute;

      if chbDefault.Checked then begin
        ProviderName := 'pCashOrderParams_Del';
        Params.Clear;
        Execute;

        ProviderName := 'pCashOrderParams_Ins';
        FetchParams;
        Params.ParamByName('okud').AsString := '';
        Params.ParamByName('debet').AsString := '';
        Params.ParamByName('corracc').AsString := edCorrAcc.Text;
        Params.ParamByName('doccount').AsInteger := edDocCount.Value;
        Execute;
      end;

      TrCommit;
      SendMessage(ParentHandle, WM_REFRESH, ID, 0);
      FModified := False;
      DocExists := True;
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
procedure TfrmEditCashOrder_UKR.aPreviewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.aPreviewExecute') else _udebug := nil;{$ENDIF}

  SmartShowRep(frDoc, 'InCashOrder_ukr.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.SetID(const Value: integer);
  var
    s: extended;
    ss: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  with newDataSet do
  try
    ProviderName := 'pCashOrderParams_Get';
    Open;
    if not IsEmpty then begin
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
    OnDate := fieldbyname('ondate').AsDateTime;

    KAID := fieldbyname('kaid').AsInteger;
    lKAgent.Caption := fieldbyname('name').AsString;
    memKAgent.Text := fieldbyname('name').AsString;
    lReason.Caption := fieldbyname('reason').AsString;
    memReasonEx.Text := fieldbyname('reason').AsString;
    s := RoundToA(fieldbyname('onvalue').AsFloat*fieldbyname('total').AsFloat, -2);
    lSum.Caption := ReplaceStr(FormatFloat(MoneyDisplayFormat, s), DecimalSeparator, ',');
    ss := MoneyToStr(s);
    ss := AnsiUpperCase(ss[1])+Copy(ss, 2, Length(ss)-1);
    lSumStr.Caption := ss;
    memTotalStr.Text := ss;
    Close;

    ProviderName := 'pCashOrder_Get';
    FetchParams;
    Params.ParamByName('paydocid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      DocExists := True;
      edNum.Text := fieldbyname('num').AsString;
      OnDate := fieldbyname('ondate').AsDateTime;
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
procedure TfrmEditCashOrder_UKR.btnSaveGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;AFont: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.btnSaveGetDrawParams') else _udebug := nil;{$ENDIF}


  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.FormCreate') else _udebug := nil;{$ENDIF}


  lEnt.Caption := EntName;
  lEntEx.Caption := EntName;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aSave.Enabled := (Trim(edNum.Text)<>EmptyStr) and FModified;
  aPreview.Enabled := True;
  btnDel.Visible := DocExists;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.edNumPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.edNumPropertiesChange') else _udebug := nil;{$ENDIF}


  FModified := True;
  lNum.Caption := edNum.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum.Text
  else if 0 = AnsiCompareText(ParName, 'docdatestr') then ParValue := lOnDateStr.Caption
  else if 0 = AnsiCompareText(ParName, 'year') then ParValue := YearOf(FOnDate)
  else if 0 = AnsiCompareText(ParName, 'day') then ParValue := edDay.Value
  else if 0 = AnsiCompareText(ParName, 'month') then ParValue := edMonth.Value
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'total') then ParValue := lSum.Caption
  else if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := lKAgent.Caption
  else if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := lSumStr.Caption
  else if 0 = AnsiCompareText(ParName, 'corracc') then ParValue := edCorrAcc.Text
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := lReason.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.frDocBeginBand(Band: TfrBand);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.frDocBeginBand') else _udebug := nil;{$ENDIF}


   if band.Typ=btMasterData then begin
    band.IsVirtualDS := True;
    band.DataSet.RangeEndCount := edDocCount.Value;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.SetCaptions') else _udebug := nil;{$ENDIF}


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
procedure TfrmEditCashOrder_UKR.edOnDatePropertiesChange(Sender: TObject);
  var y,m,d: word;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.edOnDatePropertiesChange') else _udebug := nil;{$ENDIF}


     FModified := True;
     DecodeDate(FOnDate,y,m,d);
     FOnDate := EncodeDate(y, edMonth.Value, edDay.Value);
     try
       lOnDateStr.Caption := ssDateToStr(FOnDate);
       //lOnDateStr.Caption := DateToStrUKR(FOnDate);
     except
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.SetOnDate(const Value: TDateTime);
  var y,m,d: word;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  DecodeDate(FOnDate, y, m, d);
  edDay.Value := d;
  edMonth.Value := m;
  lYear.Caption := IntToStr(y) + ' ð.';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.edMonthPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.edMonthPropertiesChange') else _udebug := nil;{$ENDIF}


  if edMonth.Value < 1 then begin
    edMonth.Value := 1;
    edMonth.SelectAll;
  end
  else if edMonth.Value > 12 then begin
    edMonth.Value := 12;
    edMonth.SelectAll;
  end;

  edDayPropertiesChange(edMonth);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.edDayPropertiesChange(Sender: TObject);
  var
    y,m,d: word;
    FDate: TDateTime;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.edDayPropertiesChange') else _udebug := nil;{$ENDIF}

  DecodeDate(FOnDate, y,m,d);
  FDate := EncodeDate(y, edMonth.Value, 1);
  if edDay.Value < 1 then begin
    edDay.Value := 1;
    if (Sender as TComponent).Name = edDay.Name then edDay.SelectAll;
  end
  else if edDay.Value > DaysInMonth(FDate) then begin
    edDay.Value := DaysInMonth(FDate);
    if (Sender as TComponent).Name = edDay.Name then edDay.SelectAll;
  end;

  edOnDatePropertiesChange(edDay);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.edDocCountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.edDocCountPropertiesChange') else _udebug := nil;{$ENDIF}

  if edDocCount.Value < 1 then edDocCount.Value := 1;
  if edDocCount.Value > 100000 then edDocCount.Value := 100000;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.GoNext') else _udebug := nil;{$ENDIF}

  if NextCtrlOnEnter and (Key=#13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditCashOrder_UKR.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditCashOrder_UKR.aDelExecute') else _udebug := nil;{$ENDIF}

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
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditCashOrder_UKR', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
