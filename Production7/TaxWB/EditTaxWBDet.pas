{$I ok_sklad.inc}
unit EditTaxWBDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons, ssBaseDlg,
  cxMemo, cxDBEdit, cxDropDownEdit, cxCalc, Buttons, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, DB,
  DBClient, ssClientDataSet, Grids, DBGrids, cxListView, Mask,
  dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6, ssBevel,
  ImgList, ssSpeedButton, ssGradientPanel,ssBaseConst, ssCalcEdit,
  ssLabel, ssDBLookupCombo, TB2Item, Menus, cxCalendar, xButton, ssPanel,
  okSearchEdit;

type
  TfrmEditTaxWBDet = class(TBaseDlg)
    aAddMat: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    cdsFind: TssClientDataSet;
    edAmount: TssCalcEdit;
    edDateOfShipment: TcxDateEdit;
    edMat: TokMatSearchEdit;
    edPrice: TssCalcEdit;
    edPriceNoNDS: TssCalcEdit;
    lAmount: TLabel;
    lAmountEx: TLabel;
    lDateOfShipment: TLabel;
    lMatEx: TLabel;
    lNDS: TssLabel;
    lPrice: TLabel;
    lPriceNoNDS: TssLabel;
    lSummary: TLabel;
    lSummWithNDS: TssLabel;
    lSummWONDS: TLabel;
    lTitle: TLabel;
    ssBevel4: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    ssBevelLeft: TssBevel;
    stAmountEx: TssBevel;
    stCurrShortName: TssBevel;
    stCurrShortNameOutNDS: TssBevel;
    stMeasureName: TssBevel;
    stSumm: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    txtSummWONDS: TssBevel;

    procedure aAddMatExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure btnMCClick(Sender: TObject);
    procedure cbWhousePropertiesChange(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edDateOfShipmentKeyPress(Sender: TObject; var Key: Char);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    FBSPressed: Boolean;
    FCanRefresh: boolean;
    FCurrID: integer;
    FKeyPressed: Boolean;
    FMatModified: Boolean;

    function  SummCurr:Extended;
    procedure CalcSummary;
    procedure SetCurrID(const Value: integer);
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    procedure setid(const Value: integer); override;

  public
    CurrDefName,CurrShortName:string;
    Kurs:Extended;
    ParentHandle: HWND;
    PosNDS:Extended;
    WbillType:Integer;

    property CurrID: integer read FCurrID write SetCurrID;
    procedure SetCaptions; override;
  end;

var
  frmEditTaxWBDet: TfrmEditTaxWBDet;

implementation

uses 
  prConst, ClientData, Login, prFun, ssFun, prTypes,
  dxmdaset, fMaterials, fWHouse, ssRegUtils, fMessageDlg, EditMaterials,
  MatMove, MatRsv, MCList, ssStrUtil, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditTaxWBDet.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat: edMat.MatID := M.WParam;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция суммы в валюте
//==============================================================================================
function TfrmEditTaxWBDet.SummCurr: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.SummCurr') else _udebug := nil;{$ENDIF}

  Result := edAmount.Value * edPrice.Value;
  //  stSumm.Caption := FormatFloat('0.00',res)+;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditTaxWBDet.setid') else _udebug := nil;{$ENDIF}


  if Value <> 0 then begin
    Fid := Value;
    with TdxMemData(pointer(Tag)) do begin
      edMat.MatID := FieldByName('matid').AsInteger;
      edDateOfShipment.Date := FieldByName('ondate').AsDateTime;
      edAmount.Value := FieldByName('amount').AsFloat;
      edPrice.Value := FieldByName('price').AsFloat;
      //stMeasureName.Caption := FieldByName('msrname').AsString;
      //txtSummAmount.Caption := stMeasureName.Caption;
      //edMat.Text := FieldByName('artikul').AsString;
    end;
  end
  else begin
    edAmount.Value := TaxWBDefAmount;
    edPrice.Value := 0;
  end;
  FModified := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditTaxWBDet.FormCloseQuery') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;
  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    with TdxMemData(pointer(Tag)) do begin
      if ID = 0 then  begin
        Append;
        FieldByName('twbdetid').AsInteger := RecordCount+1;
      end
      else Edit;

      FieldByName('matid').AsInteger := edMat.MatID;
      FieldByName('amount').AsFloat := StrToFloat(edAmount.EditingText);
      FieldByName('ondate').AsDateTime := edDateOfShipment.Date;
      FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);
      FieldByName('matname').AsString := edMat.MatName;;
      FieldByName('artikul').AsString := edMat.Artikul;
      FieldByName('msrname').AsString := edMat.Measure;
      Post;
      SendMessage(ParentHandle, WM_REFRESH, 0, 9);
    end;//with TdxMemData(pointer(Tag))
    if ID = 0 then begin
      if ModalResult = mrYes then begin
        edMat.Editor.SetFocus;
        edMat.MatID := 0;
        ID := 0;
       {Очистить поля}
      end
      else CanClose := true;
    end//if ID=0
    else begin
      if ModalResult = mrOK then CanClose := true;
    end;
  end
  else CanClose := true;
  FModified := false;
  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    PriceCurrOutNDS, Amount, SummCurr, SummCurrOutNDS, SummCurrNDS, PriceDefOutNDS, PriceDef, SummDefOutNDS, SummDefNDS, SummDef :Extended;
    V, C: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.ActionListUpdate') else _udebug := nil;{$ENDIF}

  try
    V := StrToFloat(edPrice.EditingText);
  except
    V := 0;
  end;

  try
    C := StrToFloat(edAmount.EditingText);
  except
    C := 0;
  end;

  aOk.Enabled := (edMat.MatID > 0) and (lDateOfShipment.Font.Color <> clRed) and (V > 0) and (C > 0);

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    //lMat.Caption := GetRS('fmWaybill', 'MatName') + ':';
    lDateOfShipment.Caption := GetRS('fmWaybill', 'DateOfShipment')+':';

    lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
    lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS') + ':';

    lPrice.Caption := GetRS('fmWaybill', 'PriceWithNDS') + ':';
    lPriceNoNDS.Caption := GetRS('fmWaybill', 'Price') + ' ' + GetRS('fmWaybill', 'outNDS') + ':';

    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';

    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    btnRsv.Hint := GetRS('fmWaybill', 'RsvInfo');
    btnMove.Hint := GetRS('fmWaybill', 'MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  //lWName.Visible := Trim(edName.Text)=EmptyStr;
  //DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.FormCreate(Sender: TObject);
var
  Temp: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.FormCreate') else _udebug := nil;{$ENDIF}


  SetCaptions;

  FCanRefresh := True;
  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\' + edMat.Name);

  edAmount.DecimalPlaces := Abs(MatDisplayDigits);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.cbWhousePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.cbWhousePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edAmountPropertiesChange(Sender: TObject);
  var
    remaind:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  CalcSummary;
  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edSummCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  //edsummdef.Value := edSummCurr.Value*Kurs;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edPriceNondsPropertiesChange(Sender: TObject);
  var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Tag = 0  then begin
   try
     edPrice.Tag := 1;

     if edPriceNoNDS.EditingText = ''
       then v := 0
       else v := NDSIn(StrToFloat(edPriceNoNDS.EditingText), PosNDS);

     edPrice.Value := v;
     edPrice.Tag := 0;

   except
     edPrice.Tag := 0;
     edPrice.Text := '';
   end;

   CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edSummCurrNoNdsPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}


  //edSummDefNoNds.Value := edSummCurrNoNds.Value*Kurs;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.CalcSummary;
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.CalcSummary') else _udebug := nil;{$ENDIF}

  stAmountEx.Caption := edAmount.Text;

  try
    NDSCalc(StrToFloat(edAmount.EditText),StrToFloat(edPrice.EditText),PosNDS,1,FSumWONDS,FNDS);
    FSumWithNDS := FSumWONDS+FNDS;

    if CurrID = BaseCurrID then begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
      stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
      stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, FSumWithNDS);
    end
    else begin
      stSumm.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(edPrice.EditText)*StrToFloat(edAmount.EditText), RoundSumm));
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
procedure TfrmEditTaxWBDet.SetCurrID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.SetCurrID') else _udebug := nil;{$ENDIF}

  FCurrID := Value;

  if Value = BaseCurrID then begin
    lPrice.Caption := rs('fmWaybill', 'PriceWithNDS') + ';';
    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ' ' + rs('fmWaybill', 'outNDS') + ':';
  end
  else begin
    lPrice.Caption := rs('fmWaybill', 'Price') + ':';
    lSummWONDS.Caption := rs('fmWaybill', 'Summ') + ':';
    lPriceNoNDS.Enabled := False;
    edPriceNoNDS.Enabled := False;
    lNDS.Enabled := False;
    stSummNDS.Enabled := False;
    lSummWithNDS.Enabled := False;
    stSummWithNDS.Enabled := False;
    stSummWithNDS.Caption := '';
    stSummNDS.Caption := '';
    stCurrShortNameOutNDS.Font.Color := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edPricePropertiesChange(Sender: TObject);
  var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  if (edPrice.Tag = 0) and edPriceNoNDS.Enabled then begin
    try
      edPriceNoNDS.Tag := 1;

      if edPrice.EditingText = ''
        then v := 0
        else v := NDSOut(StrToFloat(edPrice.EditingText),PosNDS);

      edPriceNoNDS.Value := v;
      edPriceNoNDS.Tag := 0;

    except
      edPriceNoNDS.Tag := 0;
      edPriceNoNDS.Text := '';
    end;//try
  end;

  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if CurrID <> BaseCurrID
    then lNDS.Caption := rs('fmWaybill', 'NDS')
    else lNDS.Caption := rs('fmWaybill', 'NDS') + ' ' + FloatToStr(PosNDS)+'%:';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    if btnCancel.Focused or btnOk.Focused or btnApply.Focused then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if edDateOfShipment.Focused and not edDateOfShipment.DroppedDown then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edAmountKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edAmountKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edPriceNoNDSKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.WMRecordChanged(var M: TMessage);
  (*var
    tmpmsrname:string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.WMRecordChanged') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat:
      begin
        FMatID := PNewRecordInfo(M.WParam).ID;
        edMat.Tag := FMatID;
        FMatName := PNewRecordInfo(M.WParam).Name;
        //txtMat.Caption := MatName(dmData.SConnection,txtMat.Tag,tmpmsrname);
        stMeasureName.Caption := PNewRecordInfo(M.WParam).Str1;
        txtSummAmount.Caption := PNewRecordInfo(M.WParam).Str1;
        FArtikul := PNewRecordInfo(M.WParam).Notes;
        if mnuName.Checked
          then edMat.Text := PNewRecordInfo(M.WParam).Name
          else edMat.Text := PNewRecordInfo(M.WParam).Notes;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.FormDestroy') else _udebug := nil;{$ENDIF}

  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\' + edMat.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditTaxWBDet.edDateOfShipmentKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edDateOfShipmentKeyPress') else _udebug := nil;{$ENDIF}

  if lDateOfShipment.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if edMat.Tag = 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := edMat.Tag;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if edMat.Tag = 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := edMat.Tag;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if edMat.Tag = 0 then   begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := edMat.Tag;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.btnMCClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.btnMCClick') else _udebug := nil;{$ENDIF}

  if edMat.Tag <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    MainHandle := Self.Handle;
    ID := edMat.Tag;
    CheckRemain := False;
    CanModify := False;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edMatChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);
  stMeasureName.Caption := edMat.Measure;
  txtSummAmount.Caption := edMat.Measure;

  if edMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edMat) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.edMatRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  try
    AID := edMat.MatID;
  except
    AID := 0;
  end;

  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWBDet.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWBDet.aAddMatExecute') else _udebug := nil;{$ENDIF}

  edMat.ShowRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditTaxWBDet', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
