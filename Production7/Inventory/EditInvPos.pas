{$I ok_sklad.inc}
unit EditInvPos;

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
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel,ssBaseConst, ssCalcEdit,
  ssLabel, ssDBLookupCombo, TB2Item, Menus, xButton, okSearchEdit;

type
  TfrmEditInvPos = class(TBaseDlg)
    aAddMat: TAction;
    aAddWHouse: TAction;
    aContextFind: TAction;
    aFind: TAction;
    aFindBegin: TAction;
    aFindConcurr: TAction;
    aFindParams: TAction;
    aFindSubstr: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    edAmount: TssCalcEdit;
    edMat: TokMatSearchEdit;
    edRealPrice: TssCalcEdit;
    lAmount: TLabel;
    lDiff: TLabel;
    lDiffSum: TLabel;
    lMatEx: TLabel;
    lPrice: TLabel;
    lRealPrice: TLabel;
    lRealSum: TssLabel;
    lRemain: TLabel;
    lSum: TLabel;
    lSummary: TLabel;
    lSummDiff: TssLabel;
    lTitle: TLabel;
    lWhouse: TLabel;
    panMat: TPanel;
    panPrice: TPanel;
    panSummary: TPanel;
    sbAddWHouse: TssSpeedButton;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel8: TssBevel;
    ssBevelLeft: TssBevel;
    stM2: TssBevel;
    stM3: TssBevel;
    stMeasureName: TssBevel;
    stRemain: TssBevel;
    txtCurr: TssBevel;
    txtDiff: TssBevel;
    txtDiffSum: TssBevel;
    txtDiffSumCurr: TssBevel;
    txtPrice: TssBevel;
    txtRealPriceCurr: TssBevel;
    txtRealSum: TssBevel;
    txtRealSumCurr: TssBevel;
    txtSum: TssBevel;
    txtSumCurr: TssBevel;
    txtSumDiffCurr: TssBevel;
    txtSummDiff: TssBevel;
    txtWHouse: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMCClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    FArtikul: string;
    FAvgPrice, FAmount: Extended;
    FCanRefresh: boolean;
    FMatModified: Boolean;
    LastInPrice: Extended;

    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure CalcSummary;
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;

  protected
    procedure setid(const Value: integer); override;

  public
    PosNDS: Extended;
    CurrDefName,CurrShortName: string;
    WbillType:Integer;
    Kurs:Extended;
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmEditInvPos: TfrmEditInvPos;

implementation

uses
  prConst, ClientData, Login, prFun, ssFun, prTypes,
  dxmdaset,fMaterials,fWHouse, ssRegUtils, fMessageDlg, EditMaterials,
  MatMove, MatRsv, ssBaseIntfDlg, MCList, ssStrUtil, ssDateUtils,
  xLngManager, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmEditInvPos.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtMat:
      begin
        edMat.MatID := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditInvPos.setid') else _udebug := nil;{$ENDIF}


  if Value <> 0 then begin
    Fid := Value;
    with TdxMemData(pointer(Tag)) do begin
      edMat.MatID := FieldByName('matid').AsInteger;
      edAmount.Value := FieldByName('discount').AsFloat;
      //edPrice.Value := FieldByName('price').AsFloat;
    end;//while
  end;
  {else begin
    edAmount.Value := WBInDefAmount;
    edPrice.Value := 0;
    cbWHouse.KeyValue := 
    if cdsWHouse.Locate('def', 1, [])
      then cbWhouse.KeyValue := cdsWHouse.fieldbyname('wid').AsInteger
      else cbWHouse.KeyValue := cbWHouse.EmptyValue;
  end;//else
  }
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   NextId:integer;
   FRealAmount, FRealPrice: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.FormCloseQuery') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;
  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    with TdxMemData(pointer(Tag)) do begin
      if ID = 0 then  begin
        //NextID := dsNextPosID(Fields[0].DataSet);
        Append;
        //FieldByName('posid').AsInteger := NextID;
      end
      else Edit;
      FieldByName('matid').AsInteger := edMat.MatID;
      FieldByName('matname').AsString := edMat.MatName;
      FieldByName('wid').AsInteger := txtWHouse.Tag;
      //FieldByName('whname').AsString := cbWhouse.EditText;
      try
        FRealAmount := StrToFloat(edAmount.EditingText);
      except
        FRealAmount := 0;
      end;
      try
        FRealPrice := StrToFloat(edRealPrice.EditingText);
      except
        FRealPrice := 0;
      end;
      FieldByName('discount').AsFloat := FRealAmount;
      FieldByName('amount').AsFloat := FAmount;
      FieldByName('price').AsFloat := FAvgPrice;
      FieldByName('nds').AsFloat := FRealPrice;
      FieldByName('msrname').AsString := edMat.Measure;
      FieldByName('grpname').AsString := edMat.GrpName;
      //FieldByName('currid').AsInteger := CurrID;
      //FieldByName('NDS').AsFloat := PosNDS;
      //FieldByName('onvalue').AsFloat := Kurs;
      FieldByName('artikul').AsString := edMat.Artikul;
      FieldByName('barcode').AsString := Self.edMat.BarCode;
      Post;
      SendMessage(ParentHandle, WM_REFRESH, 0, 9);
    end;//with TdxMemData(pointer(Tag))
    if ID = 0 then begin
      if ModalResult = mrYes then begin
        edMat.MatID := 0;
        edMat.Editor.SetFocus;
        edAmount.Value := 0;
        FAmount := 0;
        FAvgPrice := 0;
        CalcSummary;
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
procedure TfrmEditInvPos.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := (edMat.MatID > 0);
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    lWhouse.Caption := GetRS('fmWaybill', 'WHouse') + ':';
    lAmount.Caption := GetRS('fmInventory', 'RealAmountShort') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';

    lPrice.Caption := GetRS('fmInventory', 'CalcPriceShort') + ':';
    lRealPrice.Caption := GetRS('fmInventory', 'RealPriceShort') + ':';
    lDiff.Caption := GetRS('fmWaybill', 'Sum') + ':';
    lRemain.Caption := GetRS('fmInventory', 'AmountShort') + ':';
    lDiff.Caption := GetRS('fmInventory', 'Diff') + ':';
    lSum.Caption := GetRS('fmInventory', 'Sum') + ':';
    lRealSum.Caption := GetRS('fmInventory', 'RealSum') + ':';
    lSummDiff.Caption := GetRS('fmInventory', 'DiffSumShort') + ':';

    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');

    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';
    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.FormCreate') else _udebug := nil;{$ENDIF}


  edMat.SetLng;

  SetCaptions;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name);
  txtCurr.Caption := BaseCurrName;
  txtRealPriceCurr.Caption := BaseCurrName;
  txtDiffSumCurr.Caption := BaseCurrName;
  txtSumDiffCurr.Caption := BaseCurrName;
  txtRealSumCurr.Caption := BaseCurrName;
  txtSumCurr.Caption := BaseCurrName;
  FCanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.edAmountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}


  CalcSummary;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.CalcSummary;
 var
   FRealAmount, FRealPrice, FDiff, FDiffSum: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.CalcSummary') else _udebug := nil;{$ENDIF}


  try
    FRealAmount := StrToFloat(edAmount.EditingText);
  except
    FRealAmount := 0;
  end;
  try
    FRealPrice := StrToFloat(edRealPrice.EditingText);
  except
    FRealPrice := 0;
  end;
  FDiff := RoundToA(FRealAmount - FAmount, MatDisplayDigits);
  FDiffSum := RoundToA(FRealAmount * FRealPrice, -2) - RoundToA(FAmount * FAvgPrice, -2);
  txtDiff.Caption := FloatToStr(FDiff);
  txtDiffSum.Caption := FormatFloat(MoneyDisplayFormat, FDiffSum);
  txtSummDiff.Caption := FormatFloat(MoneyDisplayFormat, FDiffSum);
  if FDiff < 0 then begin
    txtDiff.Font.Color := clRed;
    txtSummDiff.Font.Color := clRed;
    txtDiffSum.Font.Color := clRed;
  end
  else if FDiff > 0 then begin
    txtDiff.Font.Color := clBlue;
    txtSummDiff.Font.Color := clBlue;
    txtDiffSum.Font.Color := clBlue;
  end else begin
    txtDiff.Font.Color := clMaroon;
    txtSummDiff.Font.Color := clMaroon;
    txtDiffSum.Font.Color := clMaroon;
  end;

  txtSum.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(FAmount * FAvgPrice, -2));
  txtRealSum.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(FRealAmount * FRealPrice, -2));

  {stAmountEx.Caption := edAmount.Text;
  try
   NDSCalc(StrToFloat(edAmount.EditText),StrToFloat(edPrice.EditText),PosNDS,1,FSumWONDS,FNDS);
   FSumWithNDS := FSumWONDS+FNDS;
   if CurrID=BaseCurrID then begin
    FNDS := RoundToA(FNDS, -2);
    FSumWithNDS := RoundToA(FSumWithNDS, -2);
    FSumWONDS := FSumWithNDS - FNDS;
    stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
    stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
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
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
   if btnCancel.Focused or btnOk.Focused or btnApply.Focused then begin
    case Key of
     VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
     VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
    end;
    Key := 0;
   end else
   if cbWHouse.Focused and not cbWHouse.DroppedDown then begin
    case Key of
     VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
     VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
    end;
    Key := 0;
   end;
  //else
    end;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvPos.WMRecordChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.WMRecordChanged') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat:
      begin
        FMatID := PNewRecordInfo(M.WParam).ID;
        txtMat.Caption := PNewRecordInfo(M.WParam).Name;
        edMat.Text := PNewRecordInfo(M.WParam).Notes;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInvPos.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.btnInfoClick') else _udebug := nil;{$ENDIF}
    
  if edMat.MatID = 0 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := edMat.MatID;
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.btnMoveClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := edMat.MatID;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.btnRsvClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := edMat.MatID;
     ShowModal;
   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.WMLayoutChanged') else _udebug := nil;{$ENDIF}


  edMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.btnMCClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.btnMCClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    ID := Self.edMat.MatID;
    CanModify := False;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.edMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.edMatChange') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  stMeasureName.Caption := edMat.Measure;
  stM2.Caption := edMat.Measure;
  stM3.Caption := edMat.Measure;

  with newDataSet do
  try
    ProviderName := 'pInv_GetMatRemain';
    FetchParams;
    Params.ParamByName('matid').AsInteger := edMat.MatID;
    Params.ParamByName('wid').AsInteger := txtWHouse.Tag;
    Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    Open;
    FAmount := FieldByName('remain').AsFloat;
    FAvgPrice := FieldByName('avgprice').AsFloat;
    stRemain.Caption := FormatFloat('0.###', FAmount);
    txtPrice.Caption := FormatFloat('0.######', FAvgPrice);
    edRealPrice.Value := FAvgPrice; 
    CalcSummary;
    Close;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  if edMat.MatID <= 0
    then edMat.Editor.SetFocus
    else edAmount.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.edMatRefButtonClick(Sender: TObject);
 var
   aid: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.edMatRefButtonClick') else _udebug := nil;{$ENDIF}


  try
    aid := edMat.MatID;
  except
    aid := 0;
  end;
  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.FormDestroy') else _udebug := nil;{$ENDIF}


  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInvPos.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInvPos.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edMat) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

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
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditInvPos', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
