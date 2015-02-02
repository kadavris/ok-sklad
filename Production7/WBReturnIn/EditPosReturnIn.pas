{$I ok_sklad.inc}
unit EditPosReturnIn;

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
  ssLabel, ssDBLookupCombo, TB2Item, Menus, xButton, ssMemDS,
  KAOutParty, okSearchEdit, cxButtonEdit;

type
  TfrmEditPosReturnIn = class(TBaseDlg)
    aAddMat: TAction;
    aAddWHouse: TAction;
    aPartysSelect: TAction;
    aSetPanels: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    bvlSN: TssBevel;
    bvlSummary: TssBevel;
    cbWHouse: TssDBLookupCombo;
    cdsFind: TssClientDataSet;
    cdsMeasure: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    dsmdPosition: TDataSource;
    dsMeasure: TDataSource;
    dsWhouse: TDataSource;
    edAmount: TssCalcEdit;
    edFindMat: TokMatSearchEdit;
    edPrice: TssCalcEdit;
    edPriceNoNDS: TssCalcEdit;
    edSN: TcxButtonEdit;
    lAmount: TLabel;
    lAmountEx: TLabel;
    lDisclaimer: TLabel;
    lMatEx: TLabel;
    lNDS: TssLabel;
    lPrice: TLabel;
    lPriceNoNDS: TssLabel;
    lRemain: TLabel;
    lSN: TssLabel;
    lSummary: TLabel;
    lSummWithNDS: TssLabel;
    lSummWONDS: TLabel;
    lTitle: TLabel;
    lWhouse: TLabel;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncardid: TIntegerField;
    mdPositioncertdate: TDateField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocnum: TStringField;
    mdPositiondocnumtxt: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionprice: TFloatField;
    mdPositionpricetxt: TStringField;
    mdPositionproducer: TStringField;
    mdPositionSN: TStringField;
    mdPositionsourceid: TIntegerField;
    mdPositionwbillid: TIntegerField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdPositionwtype: TIntegerField;
    panMat: TPanel;
    panPrice: TPanel;
    panSN: TPanel;
    panSummary: TPanel;
    sbAddWHouse: TssSpeedButton;
    sbPartysSelect: TssSpeedButton;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel8: TssBevel;
    stAmountEx: TssBevel;
    stCurrShortName: TssBevel;
    stCurrShortNameOutNDS: TssBevel;
    stMeasureName: TssBevel;
    stRemain: TssBevel;
    stSumm: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    txtSummWONDS: TssBevel;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddWHouseExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPartysSelectExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure btnFindMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnFindMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMCClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure cbWHouseKeyPress(Sender: TObject; var Key: Char);
    procedure cbWhousePropertiesChange(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure DataModified(Sender: TObject);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edFindMatChange(Sender: TObject);
    procedure edMatKeyPress(Sender: TObject; var Key: Char);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edPriceNoNDSPropertiesEditValueChanged(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lcbPartyKeyPress(Sender: TObject; var Key: Char);
    procedure mdPositionCalcFields(DataSet: TDataSet);

  private
    CurrShortName: string;
    FBSPressed: Boolean;
    FCanRefresh: boolean;
    FCurrID: integer;
    FFindPressed: Boolean;
    FFindStr: string;
    FFPos:TRetOutPos;
    FKeyPressed: Boolean;
    FMatModified: Boolean;
    FPanSNVis: Boolean;
    FPanSummaryVis: Boolean;
    FRealigned: Boolean;
    FRemain:Extended;
    Kurs:Extended;
    LastInPrice: Extended;
    LockFind: Boolean;
    PosNDS: Extended;

    function GetTPos(aposid,asourceid:Integer):TRetOutPos;
    function SummCurr:Extended;
    procedure CalcSummary;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure SavePanVisibility;
    procedure SetCurrID(const Value: integer);
    procedure SetPos(const Value: TRetOutPos);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

    property FPos: TRetOutPos read FFPos write SetPos;

  protected
    procedure setid(const Value: integer); override;

  public
    FKAID:Integer;
    ParentHandle: HWND;
    
    property CurrID: integer read FCurrID write SetCurrID;
    procedure SetCaptions; override;
  end;

var
  frmEditPosReturnIn: TfrmEditPosReturnIn;

implementation

uses
  prConst, ClientData, Login, prFun, ssFun, prTypes,
  dxmdaset,fMaterials,fWHouse, ssRegUtils, fMessageDlg, EditMaterials,
  MatMove, MatRsv, ssBaseIntfDlg, MCList, ssStrUtil, SetPanels,
  PartySelect, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditPosReturnIn.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtRetPos: begin
      LockFind := True;
      SendMessage(Self.Handle, WM_REFRESH,GetMatIdByPosId(dmData.SConnection,PRetOutPos(M.WParam)^.SourceId),integer(rtMat));
      FPos := GetTPos(PRetOutPos(M.WParam)^.PosId,PRetOutPos(M.WParam)^.SourceId);
      LockFind := False;
    end;

    rtMat: begin
      LockFind := True;
      edFindMat.MatID := M.WParam;
      LockFind := False;
    end;

    rtWHouse: begin
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      cbWhouse.KeyValue := M.WParam;
    end;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция суммы в валюте
//==============================================================================================
function TfrmEditPosReturnIn.SummCurr: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.SummCurr') else _udebug := nil;{$ENDIF}

  Result := edAmount.Value * edPrice.Value;
  //stSumm.Caption := FormatFloat('0.00',res)+;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPosReturnIn.setid') else _udebug := nil;{$ENDIF}

  if Value <> 0 then begin
    Fid := Value;
    
    with TdxMemData(pointer(Tag)) do begin
      SendMessage(Self.Handle, WM_REFRESH, FieldByName('matid').AsInteger, Integer(rtMat));
      Application.ProcessMessages;
      cbWhouse.KeyValue := FieldByName('wid').AsInteger;
      edAmount.Value := FieldByName('amount').AsFloat;
      FPos := GetTPos(FieldByName('pposid').AsInteger, FieldByName('sourceid').AsInteger);
      edSN.Text := FieldByName('sn').AsString;
    end;
  end // if Value <> 0
  else begin
    mdPosition.EmptyTable;
    SetPos(GetTPos(0, 0));
    edFindMat.MatID := 0;
    edAmount.Value := ReturnInDefAmount;
    edPrice.Value := 0;
    
    aAddMatExecute(nil); // running batch selector first
  end;
  
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   NextId:integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPosReturnIn.FormCloseQuery') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with TdxMemData(pointer(Tag)) do begin
      if ID = 0 then  begin
        NextID := dsNextPosID(Fields[0].DataSet);
        Append;
        FieldByName('posid').AsInteger := NextID;
      end
      else Edit;

      FieldByName('matid').AsInteger := edFindMat.MatID;
      FieldByName('matname').AsString := edFindMat.MatName;
      FieldByName('wid').AsInteger := cbWhouse.KeyValue;
      FieldByName('whname').AsString := cbWhouse.EditText;
      FieldByName('amount').AsFloat := StrToFloat(edAmount.EditingText);
      FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);
      FieldByName('msrname').AsString := stMeasureName.Caption;
      FieldByName('currid').AsInteger := CurrID;
      FieldByName('NDS').AsFloat := PosNDS;
      FieldByName('onvalue').AsFloat := Kurs;
      FieldByName('artikul').AsString := edFindMat.Artikul;
      FieldByName('sn').AsString := edSN.EditingText;
      FieldByName('currname').AsString := mdPosition.fieldbyname('currname').AsString;
      FieldByName('ondate').AsDateTime := mdPosition.fieldbyname('ondate').AsDateTime;
      FieldByName('sourceid').AsInteger := mdPosition.fieldbyname('sourceid').AsInteger;
      FieldByName('pposid').AsInteger := mdPosition.fieldbyname('posid').AsInteger;
      FieldByName('cardid').AsInteger := mdPosition.fieldbyname('cardid').AsInteger;

      Post;
      SendMessage(ParentHandle, WM_REFRESH, 0, 9);
    end;//with TdxMemData(pointer(Tag))

    if ID = 0 then begin
      if ModalResult = mrYes then begin
        edFindMat.Editor.SetFocus;
        edFindMat.MatID := 0;
        stRemain.Caption := '';
        ID := 0;
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
procedure TfrmEditPosReturnIn.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if edFindMat.Editor.Focused
    then aAddMat.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddMat.ShortCut := TextToShortCut('');

  if cbWhouse.Focused
    then aAddWHouse.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddWHouse.ShortCut := TextToShortCut('');

  try
    aOk.Enabled := (edFindMat.MatID > 0) and (lWhouse.Font.Color <> clRed) and
      (StrToFloat(edAmount.EditingText) > 0) and (RoundToA(StrToFloat(edAmount.EditingText), MatDisplayDigits) <= RoundToA(FRemain, MatDisplayDigits))
      and (((StrToFloat(edPrice.EditingText) > 0) and not WBInAllowZero) or WBInAllowZero);

    aApply.Enabled := aOk.Enabled and FModified;

  except
    aOk.Enabled := False;
    aApply.Enabled := False;
  end;

  aPartysSelect.Enabled := (mdPosition.Active) and (not mdPosition.IsEmpty);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.SetCaptions') else _udebug := nil;{$ENDIF}
                                      
  with LangMan do begin
    edFindMat.InitRes;
    edFindMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';
    
    if edFindMat.CurrentSearchIndex = 0 then edFindMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    aPartysSelect.Hint := GetRS('fmWaybill','Partys');
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    lWhouse.Caption := GetRS(ParentNameEx, 'WHouse') + ':';
    lAmount.Caption := GetRS(ParentNameEx, 'Amount') + ':';
    lAmountEx.Caption := GetRS(ParentNameEx, 'Amount') + ':';
    lSummary.Caption := GetRS(ParentNameEx, 'Total') + ':';
    lSummWithNDS.Caption := GetRS(ParentNameEx, 'Summ') + ' ' + GetRS('Common', 'withNDS') + ':';
    lSummWoNDS.Caption := GetRS(ParentNameEx, 'Summ') + ' ' + GetRS('Common', 'withoutNDS') + ':';
    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');

    aAddMat.Hint := GetRS('fmWaybill', 'PartyOuts');
    aAddWHouse.Hint := GetRS(ParentNameEx, 'WHouseRef');
    lPrice.Caption := GetRS(ParentNameEx, 'PriceWithNDS') + ':';
    lPriceNoNDS.Caption := GetRS(ParentNameEx, 'Price') + ' ' + GetRS(ParentNameEx, 'outNDS') + ':';
    lRemain.Caption := GetRS('fmWaybill', 'RemainPos') + ':';
    lDisclaimer.Caption := GetRS('fmWaybill', 'Disclaimer') + ' "' + GetRS('fmInventory', 'NameShort')+'"';
    lSN.Caption := GetRS('fmWaybill', 'SNs') + ':';

    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.FormCreate(Sender: TObject);
 var
   Temp: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  edFindMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\Find');

  SetCaptions;
  panSummary.Align := alTop;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

  cdsWhouse.Open;
  cdsMeasure.Open;

  FCanRefresh := True;

  edAmount.Value := WBInDefAmount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.cbWhousePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.cbWhousePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edAmountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  CalcSummary;
  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edSummCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  edsummdef.Value := edSummCurr.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edPriceNondsPropertiesChange(Sender: TObject);
  (*var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Tag=0  then begin
   try
    edPrice.Tag := 1;
    if edPriceNoNDS.EditingText='' then v := 0
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
  *)
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edSummCurrNoNdsPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}

  edSummDefNoNds.Value := edSummCurrNoNds.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.aAddMatExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.aAddMatExecute') else _udebug := nil;{$ENDIF}

  with TfrmKAOutParty.Create(nil) do
  try
    ParentNameEx := Self.Name;
    ParentHandle := Self.Handle;
    OnDate := Self.OnDate;
    ID := FKAID;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.aAddWHouseExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.aAddWHouseExecute') else _udebug := nil;{$ENDIF}

  try
    aid := cbWHouse.KeyValue;

  except
    aid := 0;
  end;

  cbWhouse.SetFocus;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.CalcSummary;
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.CalcSummary') else _udebug := nil;{$ENDIF}

  stAmountEx.Caption := edAmount.Text;

  try
    NDSCalc(StrToFloat(edAmount.EditText),StrToFloat(edPrice.EditText),PosNDS,1,FSumWONDS,FNDS);
    FSumWithNDS := FSumWONDS + FNDS;
    FNDS := RoundToA(FNDS, -2);
    FSumWithNDS := RoundToA(FSumWithNDS, -2);
    FSumWONDS := FSumWithNDS - FNDS;
    stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, FNDS);
    stSumm.Caption := FormatFloat(MoneyDisplayFormat, FSumWONDS);
    stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, FSumWithNDS);
    stSumm.Hint := stSumm.Caption;
    stSummNDS.Hint := stSummNDS.Caption;
    stSummWithNDS.Hint := stSummWithNDS.Caption;
    stAmountEx.Hint := stAmountEx.Caption;
    lNDS.Caption := rs(ParentNameEx, 'NDS')+' '+FloatToStr(PosNDS)+'%:';

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
procedure TfrmEditPosReturnIn.SetCurrID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.SetCurrID') else _udebug := nil;{$ENDIF}

  FCurrID := Value;

  if Value = BaseCurrID then begin
    lPrice.Caption := rs(ParentNameEx, 'PriceWithNDS') + ':';
    lSummWONDS.Caption := rs(ParentNameEx, 'Summ') + ' ' + rs(ParentNameEx, 'outNDS') + ':';
  end
  else begin
    lPrice.Caption := rs(ParentNameEx, 'Price') + ':';
    lSummWONDS.Caption := rs(ParentNameEx, 'Summ') + ':';
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
procedure TfrmEditPosReturnIn.edPricePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  try
    edPriceNoNDS.Value := NDSOut(StrToFloat(edPrice.EditingText),PosNDS);

  except
    edPriceNoNDS.Text := '';
  end;

  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if CurrID <> BaseCurrID
    then lNDS.Caption := rs(ParentNameEx, 'NDS') + ':'
    else lNDS.Caption := rs(ParentNameEx, 'NDS')+' '+FloatToStr(PosNDS)+'%:';

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    if btnCancel.Focused or btnOk.Focused or btnApply.Focused then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if cbWHouse.Focused and not cbWHouse.DroppedDown then begin
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
procedure TfrmEditPosReturnIn.cbWHouseKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.cbWHouseKeyPress') else _udebug := nil;{$ENDIF}

  if lWhouse.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edAmountKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edAmountKeyPress') else _udebug := nil;{$ENDIF}

  if lAmount.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  if Key = '-' then Key := #0;
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.WMRecordChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.WMRecordChanged') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditPosReturnIn.edMatKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edMatKeyPress') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
{procedure TfrmEditPosReturnIn.FindMat(AForward: Boolean);
var
  FSQL: String;
  FFieldName: String;
  MinPrice, MaxPrice, AvgPrice: Extended;
begin
  LockFind := True;
  try
    FSQL := '';
    if not FBSPressed and FMatModified then FFindStr := edMat.Text
      else FBSPressed := False;

    if FFindStr = '' then begin
      FMatID := 0;
      edMat.Tag := 0;
      lMatEx.Caption := ' ';
      Exit;
    end;

    if FMatModified or not cdsFind.Active then begin
      if cdsFind.Active then cdsFind.Close;
      if mnuName.Checked then FFieldName := 'name'
        else FFieldName := 'artikul';
      FSQL := 'select m.matid, m.name, m.artikul, ms.shortname, m.wid ' +
        ' from materials m, measures ms where ms.mid=m.mid and upper(m.' +
        FFieldName + ') like ''' +
        AnsiUpperCaseEx(FFindStr) + '%'' order by m.' + FFieldName;
      cdsFind.Macros.ParamByName('sql').AsString := FSQL;
      Screen.Cursor := crSQLWait;
      try
        cdsFind.Open;
      finally
        Screen.Cursor := crDefault;
      end;
      FMatModified := False;
    end
    else if AForward then cdsFind.Next
      else cdsFind.Prior;
    if not cdsFind.Eof then begin
      if mnuName.Checked
        then edMat.Text := cdsFind.FieldByName('name').AsString
        else edMat.Text := cdsFind.FieldByName('artikul').AsString;
      edMat.SelStart := Length(FFindStr);
      edMat.SelLength := Length(edMat.Text) - Length(FFindStr);

      FMatName := cdsFind.FieldByName('name').AsString;
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + FMatName;
      FFMatID := cdsFind.FieldByName('matid').AsInteger;
      stMeasureName.Caption := cdsFind.FieldByName('shortname').AsString;
      txtSummAmount.Caption := cdsFind.FieldByName('shortname').AsString;
      FArtikul := cdsFind.FieldByName('artikul').AsString;
      edMat.Tag := FFMatID;



      if mdPosition.Active and (not mdPosition.IsEmpty) then mdPosition.First;

      if cdsFind.FieldByName('wid').IsNull then begin
        cdsWhouse.Locate('def', 1, []);
        cbWHouse.KeyValue := cdsWhouse.fieldbyname('wid').AsInteger;
      end
      else cbWHouse.KeyValue := cdsFind.FieldByName('wid').AsInteger;
    end
    else ssMessageDlg(rs('Common', 'FindError') + ', ' +
      rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
  finally
    LockFind := False;
//    lcbPartyPropertiesEditValueChanged(nil);
  end;
end;
}

//==============================================================================================
procedure TfrmEditPosReturnIn.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.FormDestroy') else _udebug := nil;{$ENDIF}

  edFindMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\Find');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnFindMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnFindMouseDown') else _udebug := nil;{$ENDIF}

  FFindPressed := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnFindMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnFindMouseUp') else _udebug := nil;{$ENDIF}

  FFindPressed := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnInfoClick') else _udebug := nil;{$ENDIF}

  if edFindMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
  try
    ParentNameEx := 'fmMaterials';
    OnDate := Self.OnDate;
    ID := edFindMat.MatID;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnMoveClick') else _udebug := nil;{$ENDIF}

  if edFindMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := edFindMat.MatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnRsvClick') else _udebug := nil;{$ENDIF}

  if edFindMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := edFindMat.MatID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFindMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPrice.Value < 0 then edPrice.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edPriceNoNDSPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edPriceNoNDSPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Value < 0 then edPriceNoNDS.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.btnMCClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.btnMCClick') else _udebug := nil;{$ENDIF}

  if edFindMat.MatID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    ID := edFindMat.MatID;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.mdPositionCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.mdPositionCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FieldByName('docnumtxt').AsString := FieldByName('docnum').AsString+' '+
                rs('fmWaybill','AttDate')+' '+DateTimeToStr(FieldByName('ondate').AsDateTime);

    FieldByName('pricetxt').AsString := FloatToStr(FieldByName('price').AsFloat)+' '+ FieldByName('currname').AsString;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.lcbPartyKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.lcbPartyKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(rs('fmWaybill', 'PanMat'), panMat);
    FList.AddObject(rs('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(rs('fmWaybill', 'PanSN'), panSN);
    FList.AddObject(rs('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panSN.Visible := FPanSNVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.RealignPanels;
  var
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;
  if not panSN.Visible then FOffs := FOffs - panSN.Height;
  if not panSummary.Visible then FOffs := FOffs - panSummary.Height;

  panSummary.Align := alClient;

  if not panSummary.Visible then FOffs := FOffs + 12;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanSNVis := panSN.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.WMRealignPanels(var M: TMessage);
  var
    FList: TStringList;
    i: Integer;
    FVis: Boolean;
    FPan: TPanel;
    FOffs: Integer;
    Y: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.WMRealignPanels') else _udebug := nil;{$ENDIF}

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

  if not panSummary.Visible then Self.Height := Self.Height + 5;

  Y := panPrice.Top + panPrice.Height - 1;

  if panSN.Visible then begin
    panSN.Top := Y;
    Y := Y + panSN.Height;
  end;

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edFindMat) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edFindMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edFindMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.aPartysSelectExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.aPartysSelectExecute') else _udebug := nil;{$ENDIF}

  if (not mdPosition.Active) or (mdPosition.IsEmpty) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmPartySelect.Create(nil) do
  try
    FRetInMode := True;
    colChk.DisableEditor := True;
    colPrice.Caption := rs('fmWaybill', 'PriceOut');
    FBySN := edFindMat.IsSerial;
    mdSN.Tag := 1;
    mdSN.Open;
    FAmount := Round(StrToFloat(edAmount.EditingText));
    MatName := edFindMat.MatName;

    if FBySN then begin
      colAsel.DisableEditor := true;
      colAsel.ReadOnly := True;
    end;

    if True{GetDSCount(mdPosition, 'postype', 0) > 0} then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := 0;
      mdSN.FieldByName('pid').AsInteger := 0;
      mdSN.FieldByName('docnumtxt').AsString := rs('fmMaterials', 'Mat');
      mdSN.Post;
    end;

    with mdPosition do begin
      DisableControls;
      First;

      while not Eof do begin
        mdSN.Append;
        mdSN.FieldByName('num').AsInteger := mdSN.RecNo;

        if FBySN then mdSN.FieldByName('SN').AsString := FieldByName('SN').AsString;

        mdSN.FieldByName('docnumtxt').AsString := FieldByName('docnumtxt').AsString;
        mdSN.FieldByName('wbillid').AsInteger := FieldByName('wbillid').AsInteger;
        mdSN.FieldByName('wtype').AsInteger := FieldByName('wtype').AsInteger;
        mdSN.FieldByName('pid').AsInteger := 0;
        mdSN.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
        mdSN.FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
        mdSN.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
        mdSN.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
        mdSN.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
        mdSN.FieldByName('currname').AsString := FieldByName('currname').AsString;
        mdSN.FieldByName('gtd').AsString := FieldByName('gtd').AsString;
        mdSN.FieldByName('certnum').AsString := FieldByName('certnum').AsString;
        mdSN.FieldByName('producer').AsString := FieldByName('producer').AsString;

        if FieldByName('certdate').IsNull
          then mdSN.FieldByName('certdate').Clear
          else mdSN.FieldByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime;

        if (FieldByName('posid').AsInteger=FPos.PosId)and(FieldByName('sourceid').AsInteger=FPos.SourceId) then begin
          mdSN.FieldByName('checked').AsBoolean := true;
          mdSN.FieldByName('asel').AsFloat := edAmount.Value;
        end//if
        else begin
          mdSN.FieldByName('checked').AsBoolean := false;
          mdSN.FieldByName('asel').AsFloat := 0
        end;//else

        mdSN.Post;
        Next;
      end;//while not eof

      EnableControls;
    end;//with mdPosition

    if not mdSN.Locate('checked', True, []) then begin
      mdSN.Tag := 0;
      mdSN.First;
    end;

    mdSN.Tag := 0;

    if ShowModal=mrOk then begin
      edAmount.Value := mdSN.FieldByName('asel').AsFloat;
      FPos := GetTPos(mdSN.FieldByName('posid').AsInteger,mdSN.FieldByName('sourceid').AsInteger);
    end
    else FPos := GetTPos(FPos.PosId,FPos.SourceId);

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.SetPos(const Value: TRetOutPos);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.SetPos') else _udebug := nil;{$ENDIF}

  with mdPosition do begin
    if Active and (not IsEmpty) and Locate('posid;sourceid', VarArrayOf([Value.PosId,Value.SourceId]),[]) then begin
      FFPos.PosId := Value.PosId; FFPos.SourceId := Value.SourceId;
      cbWHouse.KeyValue := FieldByName('wid').AsInteger;
      FRemain := FieldByName('amount').AsFloat;
      stSumm.Caption := FormatFloat(MoneyDisplayFormat,RoundToA(FieldByName('amount').AsFloat*FieldByName('price').AsFloat,RoundSumm));
      PosNDS := FieldByName('nds').AsFloat;
      Kurs := FieldByName('onvalue').AsFloat;
      edPrice.EditValue := FieldByName('price').AsString;
      FCurrID := FieldByName('currid').AsInteger;
      stCurrShortName.Caption := FieldByName('currname').AsString;
      stCurrShortNameOutNDS.Caption := stCurrShortName.Caption;
      stCurrShortName.Caption := FieldByName('currname').AsString;
      txtSummWONDS.Caption := FieldByName('currname').AsString;
      txtSummNDS.Caption := FieldByName('currname').AsString;
      txtSummWithNDS.Caption := FieldByName('currname').AsString;
      edSN.Text := FieldByName('sn').AsString;
    end//if
    else begin
      FFPos.PosId := 0; FFPos.SourceId := 0;
      stCurrShortName.Caption := '';
      stCurrShortNameOutNDS.Caption := stCurrShortName.Caption;
      txtSummWONDS.Caption := '';
      txtSummNDS.Caption := '';
      txtSummWithNDS.Caption := '';
      FCurrID := BaseCurrID;
      Kurs := 0;
      FRemain := 0;
      stSumm.Caption := '';
      edPrice.EditValue := 0;
      edSN.Text := '';
    end;//else

    stRemain.Caption := FormatFloat(MatDisplayFormat, RoundToA(FRemain,MatDisplayDigits));
  end;//with mdPosition do begin

  edPricePropertiesChange(nil);
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPosReturnIn.GetTPos(aposid, asourceid: Integer): TRetOutPos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.GetTPos') else _udebug := nil;{$ENDIF}

  Result.PosId := aposid;
  Result.SourceId := asourceid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.edFindMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.edFindMatChange') else _udebug := nil;{$ENDIF}

  GetMatSelsByKA(dmData.SConnection,edFindMat.MatID,FKAID,integer(mdPosition));

  with mdPosition do
    if Active and (not IsEmpty) then begin
      First;
      FPos := GetTPos(FieldByName('posid').AsInteger,FieldByName('sourceid').AsInteger);
    end
    else FPos := GetTPos(0,0);

  stMeasureName.Caption := edFindMat.Measure;
  txtSummAmount.Caption := stMeasureName.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPosReturnIn.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosReturnIn.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPosReturnIn', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
