{$I ok_sklad.inc}
unit EditPayOrder_RUS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ssBevel,
  ExtCtrls, ssBaseSkinForm, ImgList, ssSpeedButton, xLngDefs, 
  ssGradientPanel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, DB, DBClient,
  ssClientDataSet, cxMemo, FR_Class, cxSpinEdit, FR_DSet, FR_DBSet,
  cxCheckBox, Menus, ssBaseConst, xButton, ssPanel, okMoneyFun;

type
  TfrmEditPayOrder_RUS = class(TfrmBaseSkin)
    panButtons: TPanel;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aPreview: TAction;
    cdsAcc: TssClientDataSet;
    srcAcc: TDataSource;
    frDoc: TfrReport;
    bvlFooterSep: TssBevel;
    lCount: TLabel;
    edDocCount: TcxSpinEdit;
    sbMain: TScrollBox;
    bvlFrame: TssBevel;
    lTitle: TLabel;
    lFrom: TLabel;
    bvlEntOKPO: TssBevel;
    lKAgentOKPO: TLabel;
    lSumv: TLabel;
    lSumStrv: TLabel;
    Label2: TLabel;
    btnNewAcc: TssSpeedButton;
    edNum: TcxTextEdit;
    edOnDate: TcxDateEdit;
    lcbAcc: TssDBLookupCombo;
    memDest: TcxMemo;
    edAcc: TcxTextEdit;
    Label4: TLabel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    lPayer: TLabel;
    Label3: TLabel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    lEntOKPO: TLabel;
    ssBevel9: TssBevel;
    Label5: TLabel;
    ssBevel10: TssBevel;
    lEntMFO: TLabel;
    Label6: TLabel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    Label7: TLabel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    Label8: TLabel;
    ssBevel15: TssBevel;
    Label9: TLabel;
    ssBevel16: TssBevel;
    Label10: TLabel;
    ssBevel17: TssBevel;
    ssBevel3: TssBevel;
    Label1: TLabel;
    ssBevel18: TssBevel;
    ssBevel19: TssBevel;
    Label11: TLabel;
    Label12: TLabel;
    ssBevel20: TssBevel;
    Label13: TLabel;
    ssBevel21: TssBevel;
    Label14: TLabel;
    ssBevel22: TssBevel;
    Label15: TLabel;
    ssBevel23: TssBevel;
    Label16: TLabel;
    ssBevel24: TssBevel;
    Label17: TLabel;
    ssBevel25: TssBevel;
    Label18: TLabel;
    ssBevel1: TssBevel;
    Label19: TLabel;
    ssBevel2: TssBevel;
    ssBevel26: TssBevel;
    ssBevel27: TssBevel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ssBevel28: TssBevel;
    ssBevel29: TssBevel;
    ssBevel30: TssBevel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    ssBevel31: TssBevel;
    ssBevel32: TssBevel;
    lcbPayKind: TssDBLookupCombo;
    cdsPayKind: TssClientDataSet;
    srcPayKind: TDataSource;
    lEnt: TLabel;
    lINN: TLabel;
    lKPP: TLabel;
    lEntMFOv: TLabel;
    lEntBankv: TLabel;
    lKAgentINN: TLabel;
    lKAgentKPP: TLabel;
    lKAgent: TLabel;
    lKAgentMFO: TLabel;
    lKAgentBank: TLabel;
    edPayType: TcxTextEdit;
    edCode: TcxTextEdit;
    edDest: TcxTextEdit;
    edPayTime: TcxTextEdit;
    edQ: TcxTextEdit;
    edRes: TcxTextEdit;
    chbDefault: TcxCheckBox;
    aAccNew: TAction;
    aAccProps: TAction;
    aAccRefresh: TAction;
    btnSave: TxButton;
    btnCancel: TxButton;
    xButton1: TxButton;
    ssBevel33: TssBevel;
    ssBevel34: TssBevel;
    aDel: TAction;
    btnDel: TxButton;
    lcbEntAccv: TssDBLookupCombo;
    btnEntAccv: TssSpeedButton;
    srcEntAcc: TDataSource;
    cdsEntAcc: TssClientDataSet;
    ssBevel35: TssBevel;
    ssBevel36: TssBevel;
    ssBevel37: TssBevel;
    ssBevel38: TssBevel;
    ssBevel39: TssBevel;
    ssBevel40: TssBevel;
    ssBevel41: TssBevel;
    edAdd1: TcxTextEdit;
    edAdd2: TcxTextEdit;
    edAdd3: TcxTextEdit;
    edAdd4: TcxTextEdit;
    edAdd5: TcxTextEdit;
    edAdd7: TcxTextEdit;
    ssBevel42: TssBevel;
    Label27: TLabel;
    ssBevel43: TssBevel;
    lEntCorAcc: TLabel;
    lKACorAcc: TLabel;
    edAdd6: TcxDateEdit;
    procedure aCancelExecute(Sender: TObject);
    procedure aSaveExecute(Sender: TObject);
    procedure aPreviewExecute(Sender: TObject);
    procedure cdsAccBeforeOpen(DataSet: TDataSet);
    procedure btnSaveGetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure FormCreate(Sender: TObject);
    procedure lcbAccPropertiesEditValueChanged(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure edNumPropertiesChange(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure frDocBeginBand(Band: TfrBand);
    procedure edDocCountPropertiesChange(Sender: TObject);
    procedure aAccRefreshExecute(Sender: TObject);
    procedure aAccNewExecute(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure aDelExecute(Sender: TObject);
    procedure lcbEntAccvPropertiesEditValueChanged(Sender: TObject);
    procedure lcbEntAccvEnter(Sender: TObject);
    procedure lcbEntAccvExit(Sender: TObject);
    procedure btnEntAccvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEntAccvMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnNewAccMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cdsEntAccBeforeOpen(DataSet: TDataSet);
  private
    FCurrCtrl: TControl;
    FID: integer;
    KAID: integer;
    FModified: boolean;
    DocExists: Boolean;
    procedure SetID(const Value: integer);
    procedure SetCaptions;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    { Private declarations }
  public
    ParentHandle: HWND;
    property ID: integer read FID write SetID;
  end;

var
  frmEditPayOrder_RUS: TfrmEditPayOrder_RUS;

implementation

uses
  ClientData, ssFun, prConst, prFun, ssDateUtils,
  ssStrUtil, EditKAAccount, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditPayOrder_RUS.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.aSaveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aSaveExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
   try
     TrStart;

     try
       Screen.Cursor := crSQLWait;
       ProviderName := 'pPayOrder_Del';
       FetchParams;
       Params.ParamByName('paydocid').AsInteger := ID;
       Execute;

       ProviderName := 'pPayOrder_InsEx';
       FetchParams;
       Params.ParamByName('paydocid').AsInteger := ID;
       Params.ParamByName('accid').AsInteger := lcbAcc.KeyValue;
       Params.ParamByName('entaccid').AsInteger := lcbEntAccv.KeyValue;
       Params.ParamByName('num').AsString := edNum.Text;
       Params.ParamByName('acc').AsString := edAcc.Text;
       Params.ParamByName('paydest').AsString := memDest.Text;
       Params.ParamByName('ondate').AsDateTime := edOnDate.Date;
       Params.ParamByName('pkindid').AsInteger := lcbPayKind.KeyValue;
       Params.ParamByName('paytype').AsString := edPayType.Text;
       Params.ParamByName('paytime').AsString := edPayTime.Text;
       Params.ParamByName('code').AsString := edCode.Text;
       Params.ParamByName('res').AsString := edRes.Text;
       Params.ParamByName('q').AsString := edQ.Text;
       Params.ParamByName('dest').AsString := edDest.Text;
       Params.ParamByName('add1').AsString := edAdd1.Text;
       Params.ParamByName('add2').AsString := edAdd2.Text;
       Params.ParamByName('add3').AsString := edAdd3.Text;
       Params.ParamByName('add4').AsString := edAdd4.Text;
       Params.ParamByName('add5').AsString := edAdd5.Text;
       Params.ParamByName('add6').AsString := edAdd6.EditingText;
       Params.ParamByName('add7').AsString := edAdd7.Text;
       Execute;

       if chbDefault.Checked then begin
         ProviderName := 'pPayOrderParams_Del';
         Params.Clear;
         Execute;

         ProviderName := 'pPayOrderParams_InsEx';
         FetchParams;
         Params.ParamByName('pkindid').AsInteger := lcbPayKind.KeyValue;
         Params.ParamByName('acc').AsString := edAcc.Text;
         Params.ParamByName('paytype').AsString := edPayType.Text;
         Params.ParamByName('paytime').AsString := edPayTime.Text;
         Params.ParamByName('dest').AsString := edDest.Text;
         Params.ParamByName('res').AsString := edRes.Text;
         Params.ParamByName('code').AsString := edCode.Text;
         Params.ParamByName('q').AsString := edQ.Text;
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
procedure TfrmEditPayOrder_RUS.aPreviewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aPreviewExecute') else _udebug := nil;{$ENDIF}

  SmartShowRep(frDoc, 'PayOrder_rus.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.SetID(const Value: integer);
  var
    s: extended;
    ss: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;

  with newDataSet do
  try
    ProviderName := 'pPayOrderParams_Get';
    Open;
    if not IsEmpty then begin
      edAcc.Text := fieldbyname('acc').AsString;
      lcbPayKind.KeyValue := fieldbyname('pkindid').AsInteger;
      edDest.Text := fieldbyname('dest').AsString;
      edPayType.Text := fieldbyname('paytype').AsString;
      edPayTime.Text := fieldbyname('paytime').AsString;
      edCode.Text := fieldbyname('code').AsString;
      edRes.Text := fieldbyname('res').AsString;
      edQ.Text := fieldbyname('q').AsString;
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
    lKAgentKPP.Caption := fieldbyname('kpp').AsString;
    lKAgentINN.Caption := fieldbyname('inn').AsString;
    s := RoundToA(fieldbyname('onvalue').AsFloat*fieldbyname('total').AsFloat, -2);
    lSumv.Caption := ReplaceStr(FormatFloat(MoneyDisplayFormat, s), DecimalSeparator, '-');
    ss := MoneyToStr(s);
    ss := AnsiUpperCase(ss[1])+Copy(ss, 2, Length(ss)-1);
    lSumStrv.Caption := ss;
    Close;
    cdsAcc.Open;

    ProviderName := 'pPayOrder_Get';
    FetchParams;
    Params.ParamByName('paydocid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
     DocExists := True;
     edNum.Text := fieldbyname('num').AsString;
     edAcc.Text := fieldbyname('acc').AsString;
     edOnDate.Date := fieldbyname('ondate').AsDateTime;
     lcbAcc.KeyValue := fieldbyname('accid').AsInteger;
     lcbEntAccv.KeyValue := fieldbyname('entaccid').AsInteger;
     lcbPayKind.KeyValue := fieldbyname('pkindid').AsInteger;
     memDest.Text := fieldbyname('paydest').AsString;
     edDest.Text := fieldbyname('dest').AsString;
     edPayType.Text := fieldbyname('paytype').AsString;
     edQ.Text := fieldbyname('q').AsString;
     edPayTime.Text := fieldbyname('paytime').AsString;
     edRes.Text := fieldbyname('res').AsString;
     edCode.Text := fieldbyname('code').AsString;
     edAdd1.Text := FieldByName('add1').AsString;
     edAdd2.Text := FieldByName('add2').AsString;
     edAdd3.Text := FieldByName('add3').AsString;
     edAdd4.Text := FieldByName('add4').AsString;
     edAdd5.Text := FieldByName('add5').AsString;
     try
       edAdd6.Date := StrToDate(FieldByName('add6').AsString);
     except
     end;  
     edAdd7.Text := FieldByName('add7').AsString;
     FModified := False;
    end;
    Close;
   finally
    Free;
   end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.cdsAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.cdsAccBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsAcc.Params.ParamByName('kaid').AsInteger := KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.btnSaveGetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.btnSaveGetDrawParams') else _udebug := nil;{$ENDIF}


  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.FormCreate') else _udebug := nil;{$ENDIF}


  lEnt.Caption := EntFullName;
  lINN.Caption := EntINN;
  lKPP.Caption := EntKPP;

  SetCaptions;
  cdsPayKind.Open;
  cdsEntAcc.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.lcbAccPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.lcbAccPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if not cdsAcc.IsEmpty then begin
    lKAgentBank.Caption := cdsAcc.fieldbyname('name').AsString;
    lKAgentMFO.Caption := cdsAcc.fieldbyname('mfo').AsString;
    lKACorAcc.Caption := cdsAcc.fieldbyname('coracc').AsString;
  end
  else begin
    lKAgentBank.Caption := '';
    lKAgentMFO.Caption := '';
    lKACorAcc.Caption := '';
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aSave.Enabled := (Trim(edNum.Text)<>EmptyStr) and (lcbAcc.KeyValue<>lcbAcc.EmptyValue) and FModified;
  aPreview.Enabled := (lcbAcc.KeyValue<>lcbAcc.EmptyValue);
  btnDel.Visible := DocExists;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.edNumPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.edNumPropertiesChange') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.frDocGetValue') else _udebug := nil;{$ENDIF}


   if 0 = AnsiCompareText(ParName, 'num') then ParValue := edNum.Text
   else if 0 = AnsiCompareText(ParName, 'acc') then ParValue := edAcc.Text
   else if 0 = AnsiCompareText(ParName, 'ondate') then ParValue := DateToStr(edOnDate.Date)
   else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntFullName
   else if 0 = AnsiCompareText(ParName, 'entkpp') then ParValue := EntKPP
   else if 0 = AnsiCompareText(ParName, 'entinn') then ParValue := EntINN
   else if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := lEntMFOv.Caption
   else if 0 = AnsiCompareText(ParName, 'entcoracc') then ParValue := lEntCorAcc.Caption
   else if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := lEntBankv.Caption
   else if 0 = AnsiCompareText(ParName, 'entacc') then ParValue := lcbEntAccv.EditText
   else if 0 = AnsiCompareText(ParName, 'total') then ParValue := lSumv.Caption
   else if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := lKAgent.Caption
   else if 0 = AnsiCompareText(ParName, 'kagentkpp') then ParValue := lKAgentKPP.Caption
   else if 0 = AnsiCompareText(ParName, 'kagentinn') then ParValue := lKAgentINN.Caption
   else if 0 = AnsiCompareText(ParName, 'kagentbank') then ParValue := lKAgentBank.Caption
   else if 0 = AnsiCompareText(ParName, 'kagentmfo') then ParValue := lKAgentMFO.Caption
   else if 0 = AnsiCompareText(ParName, 'kacoracc') then ParValue := lKACorAcc.Caption
   else if 0 = AnsiCompareText(ParName, 'kagentacc') then ParValue := cdsAcc.fieldbyname('accnum').AsString
   else if 0 = AnsiCompareText(ParName, 'paykind') then ParValue := cdsPayKind.fieldbyname('name').AsString
   else if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := lSumStrv.Caption
   else if 0 = AnsiCompareText(ParName, 'dest') then ParValue := memDest.Text
   else if 0 = AnsiCompareText(ParName, 'paydest') then ParValue := edDest.Text
   else if 0 = AnsiCompareText(ParName, 'paytime') then ParValue := edPayTime.Text
   else if 0 = AnsiCompareText(ParName, 'code') then ParValue := edCode.Text
   else if 0 = AnsiCompareText(ParName, 'paytype') then ParValue := edPayType.Text
   else if 0 = AnsiCompareText(ParName, 'res') then ParValue := edRes.Text
   else if 0 = AnsiCompareText(ParName, 'q') then ParValue := edQ.Text
   else if 0 = AnsiCompareText(ParName, 'add1') then ParValue := edAdd1.Text
   else if 0 = AnsiCompareText(ParName, 'add2') then ParValue := edAdd2.Text
   else if 0 = AnsiCompareText(ParName, 'add3') then ParValue := edAdd3.Text
   else if 0 = AnsiCompareText(ParName, 'add4') then ParValue := edAdd4.Text
   else if 0 = AnsiCompareText(ParName, 'add5') then ParValue := edAdd5.Text
   else if 0 = AnsiCompareText(ParName, 'add6') then ParValue := edAdd6.Text
   else if 0 = AnsiCompareText(ParName, 'add7') then ParValue := edAdd7.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.frDocBeginBand(Band: TfrBand);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.frDocBeginBand') else _udebug := nil;{$ENDIF}


   if band.Typ=btMasterData then begin
     band.IsVirtualDS := True;
     band.DataSet.RangeEndCount := edDocCount.Value;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.SetCaptions') else _udebug := nil;{$ENDIF}
    
  with LangMan do begin
    panTitleBar.Caption := GetRS('fmPayDoc', 'PayOrder');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aSave.Caption := GetRS('Common', 'Save');
    aDel.Caption := GetRS('Common', 'Del');
    aPreview.Caption := GetRS('fmPayDoc', 'Preview');
    lCount.Caption := GetRS('fmPayDoc', 'DocCount');
    chbDefault.Properties.Caption := GetRS('fmPayDoc', 'SetDefault');

    aAccNew.Caption := GetRS('Common', 'Add');
    aAccProps.Caption := GetRS('Common', 'Properties');
    aAccRefresh.Caption := GetRS('Common', 'Refresh');
    btnEntAccv.Hint := GetRS('fmPayDoc', 'AddAccount');
    btnNewAcc.Hint := GetRS('fmPayDoc', 'AddAccount');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.edDocCountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.edDocCountPropertiesChange') else _udebug := nil;{$ENDIF}


  if edDocCount.Value < 1 then edDocCount.Value := 1;
  if edDocCount.Value > 100000 then edDocCount.Value := 100000;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.aAccRefreshExecute(Sender: TObject);
  var
   id_: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aAccRefreshExecute') else _udebug := nil;{$ENDIF}


  id_ := cdsAcc.fieldbyname('accid').AsInteger;
  DSRefresh(cdsAcc, 'accid', 0);
  lcbAcc.KeyValue := id_;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.aAccNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aAccNewExecute') else _udebug := nil;{$ENDIF}


  with TfrmEditKAAccount.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      MainHandle := Self.Handle;
      if FCurrCtrl = lcbEntAccv then begin
        lKAName.Caption := lEnt.Caption;
        PID := CurrEnt.KAID;
      end
      else begin
        lKAName.Caption := lKAgent.Caption;
        PID := KAID;
      end;
      if (Sender as TComponent).Tag = 1 then begin
        if FCurrCtrl = lcbEntAccv
          then ID := lcbEntAccv.KeyValue
          else ID := lcbAcc.KeyValue
      end
      else ID := 0;
      ShowModal;
   finally
    Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.WMRefresh') else _udebug := nil;{$ENDIF}


  if FCurrCtrl = lcbAcc then begin
    DSRefresh(cdsAcc, 'accid', M.WParam);
    lcbAcc.KeyValue := M.WParam;
  end
  else begin
    DSRefresh(cdsEntAcc, 'accid', M.WParam);
    lcbEntAccv.KeyValue := M.WParam;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.GoNext') else _udebug := nil;{$ENDIF}


  if NextCtrlOnEnter and (Key=#13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.aDelExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pPayOrder_Del';
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

//==============================================================================================
procedure TfrmEditPayOrder_RUS.lcbEntAccvPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.lcbEntAccvPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if cdsEntAcc.Locate('accid', lcbEntAccv.KeyValue, []) then begin
    lEntMFOv.Caption := cdsEntAcc.FieldByName('mfo').AsString;
    lEntBankv.Caption := cdsEntAcc.FieldByName('name').AsString;
    lEntCorAcc.Caption := cdsEntAcc.FieldByName('coracc').AsString;
  end
  else begin
    lEntMFOv.Caption := EmptyStr;
    lEntBankv.Caption := EmptyStr;
    lEntCorAcc.Caption := '';
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.lcbEntAccvEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.lcbEntAccvEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.lcbEntAccvExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.lcbEntAccvExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.btnEntAccvMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.btnEntAccvMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbEntAccv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.btnEntAccvMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.btnEntAccvMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.btnNewAccMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.btnNewAccMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbAcc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_RUS.cdsEntAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_RUS.cdsEntAccBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsEntAcc.Params.ParamByName('kaid').AsInteger := CurrEnt.KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPayOrder_RUS', @Debugging, DEBUG_group_ID);{$ENDIF}


//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
