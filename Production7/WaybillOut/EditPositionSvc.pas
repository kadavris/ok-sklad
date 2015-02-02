{$I ok_sklad.inc}
unit EditPositionSvc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, dxCntner6, dxEditor6, StdCtrls, Dialogs, okSearchEdit,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, ssCalcEdit, ssLabel, ssBevel, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssSpeedButton, ssBaseTypes,
  cxLookAndFeelPainters, cxButtons, ssBaseDlg, cxMemo, cxDBEdit, Buttons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, DB, DBClient,
  ssClientDataSet, Grids, cxListView, Mask, dxTL6, dxDBCtrl6, dxDBGrid6,
  dxDBTLCl6, dxGrClms6, ssBaseConst, ssMemDS, dxmdaset, ssDBLookupCombo, TB2Item,
  Menus;

type
  TfrmEditPositionSvc = class(TBaseDlg)
    aPersonsRef: TAction;
    aRef: TAction;
    aSetKurs: TAction;
    aSetPanels: TAction;
    aSvcInfo: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    btnShowNDS: TssSpeedButton;
    bvlDiscount: TssBevel;
    bvlSummary: TssBevel;
    bvlSvc: TssBevel;
    cdsPersonName: TssClientDataSet;
    chbDiscount: TcxCheckBox;
    chbIsNormed: TcxCheckBox;
    chbSvcToPrice: TcxCheckBox;
    edAmount: TssCalcEdit;
    edDiscount: TssCalcEdit;
    edNDS: TssCalcEdit;
    edNorm: TssCalcEdit;
    edPrice: TssCalcEdit;
    edRate: TssCalcEdit;
    edSvc: TokSvcSearchEdit;
    lAmount: TLabel;
    lAmountEx: TLabel;
    lDisc: TssLabel;
    lKurs: TLabel;
    lMatEx: TLabel;
    lNDS: TssLabel;
    lNDSRate: TssLabel;
    lNorm: TssLabel;
    lPersonname: TLabel;
    lPrice: TLabel;
    lPriceDiscount: TssLabel;
    lSummWONDS: TLabel;
    lSummWithNDS: TssLabel;
    lSummary: TLabel;
    lTitle: TLabel;
    lcbPersonName: TssDBLookupCombo;
    panDiscount: TPanel;
    panPrice: TPanel;
    panSummary: TPanel;
    panSvc: TPanel;
    srcPersonName: TDataSource;
    ssBevel2: TssBevel;
    ssBevel8: TssBevel;
    stAmountEx: TssBevel;
    stCurrShortName: TssBevel;
    stMeasureName: TssBevel;
    stPriceDiscount: TssBevel;
    stSumm: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtFinallyPriceCurr: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWONDS: TssBevel;
    txtSummWithNDS: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aPersonsRefExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnShowNDSClick(Sender: TObject);
    procedure chbDiscountPropertiesChange(Sender: TObject);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edDiscountPropertiesChange(Sender: TObject);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edSvcChange(Sender: TObject);
    procedure edSvcRefButtonClick(Sender: TObject);
    procedure lcbPersonNameEnter(Sender: TObject);
    procedure lcbPersonNameExit(Sender: TObject);

  private
    FArtikul: string;
    FBSPressed: Boolean;
    FCanRefresh: boolean;
    FCurrCtrl: TControl;
    FFindPressed: Boolean;
    FFindStr: string;
    FKeyPressed: Boolean;
    FMatID: Integer;
    FMatModified: Boolean;
    FMatName: string;
    FPanSummaryVis, FPanDiscVis: Boolean;
    FRateDate: TDateTime;
    FRateID: Integer;
    FRealigned: Boolean;
    FRemain, AvgPrice, minprice, maxprice, LastInPrice: Extended;
    LockFind: Boolean;
    ManualPrice, CloseMode: Boolean;

    function SummCurr:Extended;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure CalcSummary;
    procedure SetCurrID(const Value: integer);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    procedure SavePanVisibility;
    procedure LoadPanVisibility;
    procedure RealignPanels;

  protected
    procedure setid(const Value: integer); override;

  public
    AOMode: Boolean;
    FCurrID: integer;
    FRateValue: Extended;
    Kurs:Extended;
    ParentHandle2: HWND;
    ParentHandle: HWND;
    PosNDS:Extended;
    WbillType:Integer;
    mdDet: TdxMemData;

    property CurrID: integer read FCurrID write SetCurrID;
    procedure SetCaptions; override;
  end;

var
  frmEditPositionSvc: TfrmEditPositionSvc;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, CurrencyEdit, ClientData, Login, prFun, ssFun, prTypes,
  ssBaseIntfDlg, fMessageDlg, ssRegUtils, ssStrUtil, EditServices,
  SetPanels, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditPositionSvc.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtServices: edSvc.SvcID := M.WParam;
    rtPersons:
      begin
        DSRefresh(cdsPersonName, 'kaid', M.WParam);
        lcbPersonName.KeyValue := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция суммы в валюте
//==============================================================================================
function TfrmEditPositionSvc.SummCurr: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.SummCurr') else _udebug := nil;{$ENDIF}

  Result := edAmount.Value * edPrice.Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPositionSvc.setid') else _udebug := nil;{$ENDIF}

  FID := Value;

  if mdDet.FindField('svctoprice') = nil then chbSvcToPrice.Enabled := False; // temporary (?) trick for waybillout

  if Value <> 0 then begin
    edSvc.SvcID := mdDet.FieldByName('matid').AsInteger;
    edDiscount.Value := StrToFloat(mdDet.FieldByName('discount').AsString);
    chbDiscount.Checked := edDiscount.Value > 0;
    edAmount.Value := StrToFloat(mdDet.FieldByName('amount').AsString);
    edPrice.Value := StrToFloat(mdDet.FieldByName('price').AsString) / (100 - edDiscount.Value) * 100;

    if mdDet.FieldByName('personid').AsInteger > 0
      then lcbPersonName.KeyValue := mdDet.FieldByName('personid').AsInteger
      else lcbPersonName.EditingText := '';

    edNDS.Value := PosNDS;

    FModified := False;

    if chbSvcToPrice.Enabled then chbSvcToPrice.Checked := (mdDet.FieldByName('svctoprice').AsInteger = 1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    NextID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPositionSvc.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with mdDet do begin
      if FID = 0 then begin
        NextID := dsNextPosID(Fields[0].DataSet);
        Append;
        FieldByName('posid').AsInteger := NextID;
      end
      else Edit;

      FieldByName('postype').AsInteger := 1;
      FieldByName('matid').AsInteger := edSvc.SvcID;
      FieldByName('matname').AsString := edSvc.SvcName;
      FieldByName('artikul').AsString := edSvc.Artikul;
      FieldByName('wid').AsInteger := 0;
      FieldByName('whname').AsString := '';
      FieldByName('amount').AsFloat := RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);

      if chbDiscount.Checked
        then FieldByName('discount').AsFloat := edDiscount.EditValue
        else FieldByName('discount').AsFloat := 0;

      FieldByName('price').AsFloat := StrToFloat(stPriceDiscount.Caption);
      FieldByName('fullprice').AsFloat := FieldByName('price').AsFloat / (100 - FieldByName('discount').AsFloat) * 100;
      FieldByName('msrname').AsString := edSvc.Measure;
      FieldByName('onvalue').AsFloat := FRateValue;
      FieldByName('nds').AsFloat := PosNDS;

      if FindField('svctoprice') <> nil
        then FieldByName('svctoprice').AsInteger := Integer(chbSvcToPrice.Checked);

      if edSvc.IsNormed
        then FieldByName('norm').AsFloat := StrToFloat(edNorm.EditText)
        else FieldByName('norm').AsFloat := 0;

      if lcbPersonName.EditText = ''
        then FieldByName('personid').Clear
        else FieldByName('personid').AsInteger := lcbPersonName.KeyValue;

      FieldByName('PTypeID').Clear;
      Post;
      SendMessage(ParentHandle, WM_REFRESH, 0, 9);
    end;

    if FID = 0 then begin
      if ModalResult = mrYes then begin
        edSvc.SvcID := 0;
        edAmount.Value := 1;
        FID := 0;
        edSvc.Editor.SetFocus;
      end
      else CanClose := True;
    end
    else begin
      if ModalResult = mrOK
        then CanClose := True
        else ID := ID;
      FModified := False;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FEnPrice: Boolean;
    FAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aSetKurs.Enabled := (CurrID <> BaseCurrID);

  lNDSRate.Visible := btnShowNDS.Checked;
  edNDS.Visible := btnShowNDS.Checked;

  try
    FAmount := StrToFloat(edAmount.EditingText);

  except
    FAmount := 0;
  end;

  try
    if (strtofloat(edDiscount.EditText) >= 0) and (strtofloat(edDiscount.EditText) <= 100)
      then chbDiscount.Style.Font.Color := clBlack
      else chbDiscount.Style.Font.Color := clRed;

  except
    chbDiscount.Style.Font.Color:=clRed;
  end;

  try
    if ((StrToFloat(edPrice.EditingText) = 0) and WBOutAllowZero) or (StrToFloat(edPrice.EditingText) <> 0)
      then FEnPrice := True
      else FEnPrice := False;

  except
    FEnPrice := False;
  end;

  edDiscount.Enabled := chbDiscount.Checked;

  aOk.Enabled := FEnPrice
    and (chbDiscount.Style.Font.Color <> clRed) and (lPriceDiscount.Font.Color <> clRed)
    and (edSvc.SvcID > 0) and (FAmount > 0);

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.SetCaptions') else _udebug := nil;{$ENDIF}

   with LangMan do begin
     edSvc.SearchNames[0] := GetRS('fmWaybill', 'NameShort') + ';name';

     if edSvc.CurrentSearchIndex = 0 then edSvc.Caption.Caption := GetRS('fmWaybill', 'NameShort') + ':';

     panTitleBar.Caption := GetRS('fmServices', 'TitleAdd');
     chbIsNormed.Properties.Caption := GetRS('fmServices', 'SvcNormed');
     lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
     lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
     lPersonname.Caption := GetRS('fmWaybill', 'PersonSvc') + ':';
     btnPersonName.Hint := GetRS('fmWaybill', 'aPersons');
     lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
     lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS') + ':';
     aSetKurs.Hint := GetRS('fmWaybill','SetKurs');
     lKurs.Caption := GetRS('fmWaybill', 'CurrRate') + ':';
     lPrice.Caption := GetRS('fmServices', 'Price') + ':';
     chbDiscount.Properties.Caption := GetRS('fmWaybill', 'ApplyDiscount') + ':';
     lPriceDiscount.Caption := GetRS('fmWaybill', 'PriceDiscount') + ':';
     aSvcInfo.Hint := GetRS('fmWaybill', 'SvcInfo');
     lNorm.Caption := GetRS('fmServices', 'Norm') + ':';
     lDisc.Caption := GetRS('fmWaybill', 'Discount') + ', %:';
     lNDSRate.Caption := GetRS('fmMaterials', 'NDSRate') + ':';
     btnShowNDS.Hint := GetRS('fmWaybill', 'ShowNDS');
     btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');
     chbSvcToPrice.Properties.Caption := GetRS('fmWaybill', 'SvcToPrice');
   end;

   inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.FormCreate') else _udebug := nil;{$ENDIF}

  edSvc.SetLng;

  btnShowNDS.Checked := True;
  SetCaptions;
  ManualPrice := False;
  cdsPersonName.Open;
  lcbPersonName.Text := '';
  panSummary.Align := alTop;

  btnShowNDS.ImageIndex := 104;
  edNDS.Value := NDS;

  FCanRefresh := True;
  edSvc.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edAmountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.CalcSummary;
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    FFinalPrice: Extended;
    FAmount, FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.CalcSummary') else _udebug := nil;{$ENDIF}

  try FAmount := StrToFloat(edAmount.EditText); except FAmount := 0; end;
  try FNorm := StrToFloat(edNorm.EditText); except FNorm := 0; end;

  stAmountEx.Caption := edAmount.Text;

  if edSvc.IsNormed then FAmount := FAmount * FNorm;

  try
    if chbDiscount.Checked then begin
      try
        FFinalPrice := RoundToA(StrToFloat(edPrice.EditText)-((StrToFloat(edPrice.EditText)/100)*strtofloat(edDiscount.EditText)), -6);

      except
        FFinalPrice := StrToFloat(edPrice.EditText);
      end;
    end
    else begin
      FFinalPrice := StrToFloat(edPrice.EditText);
    end;

    stPriceDiscount.Caption := FloatToStr(FFinalPrice);

    NDSCalc(FAmount, FFinalPrice, PosNDS, 1, FSumWONDS, FNDS);
    FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
    FSumWONDS := RoundToA(FSumWithNDS - RoundToA(FNDS, -2), -2);

    if CurrID = BaseCurrID then begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
      stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
      stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, FSumWithNDS);
    end
    else begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(FFinalPrice * FAmount, RoundSumm));
    end;

    stSumm.Hint := stSumm.Caption;
    stSummNDS.Hint := stSummNDS.Caption;
    stSummWithNDS.Hint := stSummWithNDS.Caption;
    stAmountEx.Hint := stAmountEx.Caption;

  except
    stSumm.Caption := '';
    stSummNDS.Caption := '';
    stSummWithNDS.Caption := '';
    stSumm.Hint := stSumm.Caption;
    stSummNDS.Hint := stSummNDS.Caption;
    stSummWithNDS.Hint := stSummWithNDS.Caption;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditPositionSvc.SetCurrID(const Value: integer);
  var
    FName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.SetCurrID') else _udebug := nil;{$ENDIF}

  FCurrID := Value;
  GetCurrencyInfo(dmData.SConnection, Value, Self.OnDate, FName, FRateDate, FRateID);
  aSetKurs.Caption := FloatToStr(FRateValue);
  edRate.Value := FRateValue;
  stCurrShortName.Caption := FName;
  txtFinallyPriceCurr.Caption := FName;
  txtSummNDS.Caption := FName;
  txtSummWithNDS.Caption := FName;
  txtSummWONDS.Caption := FName;

  if Value = BaseCurrID then begin
    lSummWONDS.Caption := LangMan.GetRS('fmWaybill', 'Summ') + ' ' + LangMan.GetRS('fmWaybill', 'outNDS') + ':';
  end
  else begin
    lSummWONDS.Caption := LangMan.GetRS('fmWaybill','Summ') + ':';
    lNDS.Enabled := False;
    stSummNDS.Enabled := False;
    lSummWithNDS.Enabled := False;
    stSummWithNDS.Enabled := False;
    stSummWithNDS.Caption := '';
    stSummNDS.Caption := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edPricePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if CurrID <> BaseCurrID
    then lNDS.Caption := LangMan.GetRS('fmWaybill','NDS') + ':'
    else lNDS.Caption := LangMan.GetRS('fmWaybill','NDS')+' '+FloatToStr(PosNDS)+'%:';

  edSvc.Editor.SetFocus;

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  if Key = '-' then Key := #0;
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.chbDiscountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.chbDiscountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified:=true;

  try
    if not(chbDiscount.Checked) and not ((StrToFloat(edDiscount.EditText) >= 0) and (StrToFloat(edDiscount.EditText) <= 100))
      then edDiscount.Value := 0;

  except
    edDiscount.Value:=0;
  end;

  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edDiscountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edDiscountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edSvc.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPrice.Value < 0 then edPrice.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edSvcChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edSvcChange') else _udebug := nil;{$ENDIF}

  if edSvc.SvcID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edSvc.SvcName;
    end;

  if edSvc.SvcID > 0 then begin
    chbIsNormed.Checked := edSvc.IsNormed;
    stMeasureName.Caption := edSvc.Measure;
    txtSummAmount.Caption := edSvc.Measure;
    if edSvc.IsNormed then edNorm.Value := edSvc.Norm;
    edPrice.Value := edSvc.Price * CurrToCurr(dmData.SConnection, edSvc.CurrID,CurrID, Self.OnDate);
  end
  else begin
    chbIsNormed.Checked := False;
    stMeasureName.Caption := '';
    txtSummAmount.Caption := '';
    edPrice.Value := 0;
    edNorm.Value := 0;
  end;

  lNorm.Enabled := chbIsNormed.Checked;
  edNorm.Enabled := chbIsNormed.Checked;

  if not edNorm.Enabled then edNorm.Value := 1;

  if chbIsNormed.Checked
    then lPrice.Caption := LangMan.GetRS('fmServices', 'NormPrice') + ':'
    else lPrice.Caption := LangMan.GetRS('fmServices', 'Price') + ':';

  CalcSummary;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

  if edSvc.SvcID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditServices.Create(nil) do
    try
      ParentNameEx := 'fmServices';
      OnDate := Self.OnDate;
      ID := edSvc.SvcID;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edSvcRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edSvcRefButtonClick') else _udebug := nil;{$ENDIF}

  try AID := edSvc.SvcID; except AID := 0; end;

  edSvc.Editor.SetFocus;
  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, AID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.FormDestroy') else _udebug := nil;{$ENDIF}

  edSvc.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.aPersonsRefExecute(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.aPersonsRefExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = lcbPersonName then begin
    try AID := lcbPersonName.KeyValue; except AID := 0; end;
    lcbPersonName.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, AID, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.lcbPersonNameEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.lcbPersonNameEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;
  aPersonsRef.ShortCut := ShortCut(VK_INSERT, [ssCtrl]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;
  aPersonsRef.ShortCut := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.btnPersonNameMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.btnPersonNameMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.btnShowNDSClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.btnShowNDSClick') else _udebug := nil;{$ENDIF}
  btnShowNDS.Checked := not btnShowNDS.Checked;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPositionSvc.edNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  if edNDS.Tag = 0 then
    try
      PosNDS := StrToFloat(edNDS.EditText);
    except
      PosNDS := 0;
    end;

  FModified := True;
  lNDS.Caption := LangMan.GetRS('fmWaybill', 'NDS') + ' ' + FloatToStr(PosNDS) + '%:';
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanSvc'), panSvc);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanDiscount'), panDiscount);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panDiscount.Visible := FPanDiscVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanDiscVis := panDiscount.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.RealignPanels;
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;
  if not panDiscount.Visible then FOffs := FOffs - panDiscount.Height;
  if not panSummary.Visible then FOffs := FOffs - panSummary.Height;

  panSummary.Align := alClient;

  if not panSummary.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.WMRealignPanels(var M: TMessage);
  var
    FList: TStringList;
    i: Integer;
    FVis: Boolean;
    FPan: TPanel;
    FOffs: Integer;
    Y: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panSummary.Align := alNone;

  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);

    if FPan.Visible <> FVis then begin
      if FVis
        then FOffs := FOffs + FPan.Height
        else FOffs := FOffs - FPan.Height;
      FPan.Visible := FVis;
    end;
  end;

  panSummary.Align := alClient;

  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  Y := panPrice.Top + panPrice.Height - 1;

  if panDiscount.Visible then begin
    panDiscount.Top := Y;
    Y := Y + panDiscount.Height;
  end;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionSvc.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionSvc.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edSvc) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edSvc.SvcID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edSvc.SvcName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPositionSvc', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
