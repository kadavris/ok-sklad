{$I ok_sklad.inc}
unit EditPayOrder_UKR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ssBevel,
  ExtCtrls, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, xLngDefs,
  ssGradientPanel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, DB, DBClient,
  ssClientDataSet, cxMemo, FR_Class, cxSpinEdit, FR_DSet, FR_DBSet,
  cxCheckBox, Menus, ssBaseConst, xButton, okMoneyFun;

type
  TfrmEditPayOrder_UKR = class(TfrmBaseSkin)
    panButtons: TPanel;
    ActionList: TActionList;
    aCancel: TAction;
    aSave: TAction;
    aPreview: TAction;
    bvlFrame: TssBevel;
    lTitle: TLabel;
    edNum: TcxTextEdit;
    lFrom: TLabel;
    edOnDate: TcxDateEdit;
    lPayer: TLabel;
    lEnt: TLabel;
    lEntOKPO: TLabel;
    bvlEntOKPO: TssBevel;
    lEntOKPOv: TLabel;
    lEntBank: TLabel;
    lEntBankv: TLabel;
    bvlEntBank: TssBevel;
    bvlEntMFO: TssBevel;
    lEntMFOv: TLabel;
    lEntMFO: TLabel;
    lReceiver: TLabel;
    lKAgent: TLabel;
    lKAgentOKPO: TLabel;
    bvlKAgentOKPO: TssBevel;
    lKAgentOKPOv: TLabel;
    lKAgentBank: TLabel;
    lKAgentBankv: TLabel;
    bvlKAgentBank: TssBevel;
    lKAgentMFO: TLabel;
    bvlKAgentMFO: TssBevel;
    lKAgentMFOv: TLabel;
    bvlEntAcc: TssBevel;
    lEntAcc: TLabel;
    lSum: TLabel;
    bvlKAgentAcc: TssBevel;
    bvlEmpty: TssBevel;
    bvlSum: TssBevel;
    lSumv: TLabel;
    lKAgentAcc: TLabel;
    lcbAcc: TssDBLookupCombo;
    cdsAcc: TssClientDataSet;
    srcAcc: TDataSource;
    lSumStr: TLabel;
    lSumStrv: TLabel;
    bvlSumStr: TssBevel;
    lDest: TLabel;
    memDest: TcxMemo;
    lMP: TLabel;
    lSubscr: TLabel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    lBankDate: TLabel;
    lBankSubscr: TLabel;
    Label1: TLabel;
    ssBevel3: TssBevel;
    edAcc: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    frDoc: TfrReport;
    bvlFooterSep: TssBevel;
    lCount: TLabel;
    edDocCount: TcxSpinEdit;
    chbDefault: TcxCheckBox;
    aAccNew: TAction;
    aAccProps: TAction;
    aAccRefresh: TAction;
    btnSave: TxButton;
    btnCancel: TxButton;
    btnPreview: TxButton;
    btnNewAcc: TssSpeedButton;
    aDel: TAction;
    btnDel: TxButton;
    lcbEntAccv: TssDBLookupCombo;
    btnEntAccv: TssSpeedButton;
    cdsEntAcc: TssClientDataSet;
    srcEntAcc: TDataSource;
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
    procedure aAccNewExecute(Sender: TObject);
    procedure aAccRefreshExecute(Sender: TObject);
    procedure GoNext(Sender: TObject; var Key: Char);
    procedure aDelExecute(Sender: TObject);
    procedure lcbEntAccvPropertiesEditValueChanged(Sender: TObject);
    procedure lcbAccEnter(Sender: TObject);
    procedure lcbAccExit(Sender: TObject);
    procedure btnNewAccMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnNewAccMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnEntAccvMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cdsEntAccBeforeOpen(DataSet: TDataSet);
  private
    FID: integer;
    KAID: integer;
    FModified: boolean;
    DocExists: Boolean;
    FCurrCtrl: TControl;
    procedure SetID(const Value: integer);
    procedure SetCaptions;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    { Private declarations }
  public
    ParentHandle: HWND;
    property ID: integer read FID write SetID;
  end;

var
  frmEditPayOrder_UKR: TfrmEditPayOrder_UKR;

implementation

uses ClientData, ssFun, prConst, prFun, ssDateUtils,
  EditKAAccount, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditPayOrder_UKR.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aCancelExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.aSaveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aSaveExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    TrStart;

    try
      Screen.Cursor := crSQLWait;
      ProviderName := 'pPayOrder_Del';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Execute;

      ProviderName := 'pPayOrder_Ins';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := ID;
      Params.ParamByName('accid').AsInteger := lcbAcc.KeyValue;
      Params.ParamByName('num').AsString := edNum.Text;
      Params.ParamByName('acc').AsString := edAcc.Text;
      Params.ParamByName('paydest').AsString := memDest.Text;
      Params.ParamByName('ondate').AsDateTime := edOnDate.Date;
      Params.ParamByName('entaccid').AsInteger := lcbEntAccv.KeyValue;
      Execute;

      if chbDefault.Checked then begin
        ProviderName := 'pPayOrderParams_Del';
        Params.Clear;
        Execute;

        ProviderName := 'pPayOrderParams_InsEx';
        FetchParams;
        Params.ParamByName('pkindid').DataType := ftInteger;
        Params.ParamByName('pkindid').Clear;
        Params.ParamByName('acc').AsString := edAcc.Text;
        Params.ParamByName('paytype').AsString := '';
        Params.ParamByName('paytime').AsString := '';
        Params.ParamByName('dest').AsString := '';
        Params.ParamByName('res').AsString := '';
        Params.ParamByName('code').AsString := '';
        Params.ParamByName('q').AsString := '';
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
procedure TfrmEditPayOrder_UKR.aPreviewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aPreviewExecute') else _udebug := nil;{$ENDIF}

  SmartShowRep(frDoc, 'PayOrder_ukr.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.SetID(const Value: integer);
  var
    s: extended;
    ss: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;
  with newDataSet do
  try
    ProviderName := 'pPayOrderParams_Get';
    Open;
    if not IsEmpty then begin
      edAcc.Text := fieldbyname('acc').AsString;
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
    lKAgentOKPOv.Caption := fieldbyname('okpo').AsString;
    s := RoundToA(fieldbyname('onvalue').AsFloat*fieldbyname('total').AsFloat, -2);
    lSumv.Caption := FormatFloat(MoneyDisplayFormat, s);
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
     memDest.Text := fieldbyname('paydest').AsString;
     FModified := False;
    end;
    Close;
   finally
    Free;
   end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.cdsAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.cdsAccBeforeOpen') else _udebug := nil;{$ENDIF}


     cdsAcc.Params.ParamByName('kaid').AsInteger := KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.btnSaveGetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.btnSaveGetDrawParams') else _udebug := nil;{$ENDIF}


     if AState in [cxbsHot, cxbsPressed] then begin
      AFont.Style := [fsBold];
      AColor := TcxButton(Sender).Colors.Normal;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.FormCreate') else _udebug := nil;{$ENDIF}


  cdsEntAcc.Open;
  lEnt.Caption := EntFullName;
  lEntOKPOv.Caption := EntOKPO;
//  lEntBankv.Caption := EntBank;
//  lEntMFOv.Caption := EntMFO;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.lcbAccPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.lcbAccPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


    if cdsAcc.Locate('accid', lcbAcc.KeyValue, []) then begin
     lKAgentBankv.Caption := cdsAcc.fieldbyname('name').AsString;
     lKAgentMFOv.Caption := cdsAcc.fieldbyname('mfo').AsString;
    end
    else begin
     lKAgentBankv.Caption := '';
     lKAgentMFOv.Caption := '';
    end;
    FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.ActionListUpdate') else _udebug := nil;{$ENDIF}


     aSave.Enabled := (Trim(edNum.Text)<>EmptyStr) and
      (lcbAcc.KeyValue<>lcbAcc.EmptyValue) and FModified;
     aPreview.Enabled := (lcbAcc.KeyValue<>lcbAcc.EmptyValue);
     btnDel.Visible := DocExists;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.edNumPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.edNumPropertiesChange') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.frDocGetValue') else _udebug := nil;{$ENDIF}


   if 0 = AnsiCompareText(ParName, 'num') then ParValue := edNum.Text;
   if 0 = AnsiCompareText(ParName, 'acc') then ParValue := edAcc.Text;
   if 0 = AnsiCompareText(ParName, 'ondate') then ParValue := ssDateToStr(edOnDate.Date); //DateToStrUKR(edOnDate.Date);
   if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntFullName;
   if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := EntOKPO;
   if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := lEntMFOv.Caption;
   if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := lEntBankv.Caption;
   if 0 = AnsiCompareText(ParName, 'entacc') then ParValue := lcbEntAccv.EditText;
   if 0 = AnsiCompareText(ParName, 'total') then ParValue := lSumv.Caption;
   if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := lKAgent.Caption;
   if 0 = AnsiCompareText(ParName, 'kagentokpo') then ParValue := lKAgentOKPOv.Caption;
   if 0 = AnsiCompareText(ParName, 'kagentbank') then ParValue := lKAgentBankv.Caption;
   if 0 = AnsiCompareText(ParName, 'kagentmfo') then ParValue := lKAgentMFOv.Caption;
   if 0 = AnsiCompareText(ParName, 'kagentacc') then ParValue := cdsAcc.fieldbyname('accnum').AsString;
   if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := lSumStrv.Caption;
   if 0 = AnsiCompareText(ParName, 'dest') then ParValue := memDest.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.frDocBeginBand(Band: TfrBand);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.frDocBeginBand') else _udebug := nil;{$ENDIF}


   if band.Typ=btMasterData then begin
    band.IsVirtualDS := True;
    band.DataSet.RangeEndCount := edDocCount.Value;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.SetCaptions') else _udebug := nil;{$ENDIF}
    
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
procedure TfrmEditPayOrder_UKR.edDocCountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.edDocCountPropertiesChange') else _udebug := nil;{$ENDIF}


  if edDocCount.Value<1 then edDocCount.Value := 1;
  if edDocCount.Value>100000 then edDocCount.Value := 100000;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.aAccNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aAccNewExecute') else _udebug := nil;{$ENDIF}


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
    if (Sender as TComponent).Tag = 1
      then if FCurrCtrl = lcbEntAccv
        then ID := lcbEntAccv.KeyValue
        else ID := lcbAcc.KeyValue
     else ID := 0;
    ShowModal;
   finally
    Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.aAccRefreshExecute(Sender: TObject);
  var id_: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aAccRefreshExecute') else _udebug := nil;{$ENDIF}


     id_ := cdsAcc.fieldbyname('accid').AsInteger;
     DSRefresh(cdsAcc, 'accid', 0);
     lcbAcc.KeyValue := id_;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.WMRefresh') else _udebug := nil;{$ENDIF}


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
procedure TfrmEditPayOrder_UKR.GoNext(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.GoNext') else _udebug := nil;{$ENDIF}


  if NextCtrlOnEnter and (Key=#13) then begin
   Key := #0;
   Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.aDelExecute') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditPayOrder_UKR.lcbEntAccvPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.lcbEntAccvPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if cdsEntAcc.Locate('accid', lcbEntAccv.KeyValue, []) then begin
    lEntMFOv.Caption := cdsEntAcc.FieldByName('mfo').AsString;
    lEntBankv.Caption := cdsEntAcc.FieldByName('name').AsString;
  end
  else begin
    lEntMFOv.Caption := EmptyStr;
    lEntBankv.Caption := EmptyStr;
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.lcbAccEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.lcbAccEnter') else _udebug := nil;{$ENDIF}


  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.lcbAccExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.lcbAccExit') else _udebug := nil;{$ENDIF}


  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.btnNewAccMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.btnNewAccMouseDown') else _udebug := nil;{$ENDIF}


  FCurrCtrl := lcbAcc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.btnNewAccMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.btnNewAccMouseUp') else _udebug := nil;{$ENDIF}


  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.btnEntAccvMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.btnEntAccvMouseDown') else _udebug := nil;{$ENDIF}


  FCurrCtrl := lcbEntAccv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPayOrder_UKR.cdsEntAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPayOrder_UKR.cdsEntAccBeforeOpen') else _udebug := nil;{$ENDIF}


  cdsEntAcc.Params.ParamByName('kaid').AsInteger := CurrEnt.KAID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPayOrder_UKR', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
