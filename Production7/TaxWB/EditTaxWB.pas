{$I ok_sklad.inc}
unit EditTaxWB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ActnList, ssBaseTypes,
  dxExEdtr6, ssFormStorage, cxMemo, cxCheckBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg, cxPC,
  dxTL6, dxDBCtrl6, dxDBGrid6, DB, ssMemDS, Menus, ssImagePanel,
  cxTreeView, ComCtrls, cxListView, cxDBEdit, cxGraphics, xLngDefs,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit,
  cxButtonEdit, Buttons, DBClient, ssClientDataSet, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, ssGroupBox,
  cxCalendar, cxSpinEdit, ssDBComboBox, Grids, DBGrids, ssBaseConst, cxCalc,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, cxTimeEdit, DBCtrls, dxmdaset,
  ssBevel, ssSpeedButton, ImgList, ssPanel, ssGradientPanel,
  ssCalcEdit, ssDBLookupCombo, ssLabel, TB2Item, cxRadioGroup, dxDBTLCl6,
  dxGrClms6, xButton, okSearchEdit;

type
  TfrmEditTaxWB = class(TBaseDlg)
    aAddKA: TAction;
    aBalance: TAction;
    aCDel: TAction;
    aCIns: TAction;
    aContextFind: TAction;
    ActionList1: TActionList;
    aCUpd: TAction;
    aFind: TAction;
    aFindBegin: TAction;
    aFindConcurr: TAction;
    aFindParams: TAction;
    aFindSubstr: TAction;
    aMatInfo: TAction;
    aPersons: TAction;
    aPrint: TAction;
    aSelectAll: TAction;
    aShowRealPrice: TAction;
    btnAdd: TssSpeedButton;
    btnBallance: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnFind: TssSpeedButton;
    btnFindParams: TssSpeedButton;
    btnMatInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnSetTime: TssSpeedButton;
    cbPayForm: TcxComboBox;
    cdsFind: TssClientDataSet;
    cdsPersonName: TssClientDataSet;
    chbCheckNDS: TcxCheckBox;
    chbPosting: TcxCheckBox;
    colAmount: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colMatID: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colMeasureName: TdxDBGridColumn;
    colOnDate: TdxDBGridDateColumn;
    colPrice: TdxDBGridColumn;
    colPriceNDS: TdxDBGridColumn;
    colPriceWONDS: TdxDBGridColumn;
    colRecNo: TdxDBGridColumn;
    colSummCurr: TdxDBGridColumn;
    dbgWaybillDet: TdxDBGrid;
    dsDet: TDataSource;
    edAddCharges: TssCalcEdit;
    edCondition: TcxMemo;
    edDate: TcxDateEdit;
    edDiscountAdd: TssCalcEdit;
    edDiscountDec: TssCalcEdit;
    edFind: TcxTextEdit;
    edKAAdress: TcxMemo;
    edKACertNum: TcxTextEdit;
    edKAFullName: TcxMemo;
    edKAgent: TokKASearchEdit;
    edKAINN: TcxTextEdit;
    edKAPhone: TcxTextEdit;
    edNum1: TcxTextEdit;
    edTime: TcxTimeEdit;
    frDBDataSet1: TfrDBDataSet;
    frDoc: TfrReport;
    gbAddInfo: TssGroupBox;
    gbHeader: TssGroupBox;
    gbPos: TssGroupBox;
    lAddCharges: TssBevel;
    lcbPersonName: TssDBLookupCombo;
    lCondition: TssBevel;
    lKAAdress: TLabel;
    lKACertNum: TssBevel;
    lKAFullName: TLabel;
    lKAINN: TLabel;
    lKAPhone: TLabel;
    lNum: TLabel;
    lOndate: TLabel;
    lPayForm: TssLabel;
    lPersonname: TLabel;
    lSummDef: TssBevel;
    lSummDefNDS: TssBevel;
    lSummDefNoNDS: TssBevel;
    lTot: TLabel;
    lTotal: TLabel;
    lTotNDS: TLabel;
    lTotNDSOut: TLabel;
    mdDet: TdxMemData;
    mdReport: TdxMemData;
    mnuPosArtikul: TTBItem;
    mnuPosName: TTBItem;
    panData: TPanel;
    panHeader: TPanel;
    PanPos: TPanel;
    panPosBar: TPanel;
    pmFind: TTBPopupMenu;
    pmMain: TTBPopupMenu;
    rbtDiscountAdd: TcxRadioButton;
    rbtDiscountDec: TcxRadioButton;
    srcPersonName: TDataSource;
    stCurrShortName: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    txtLang: TssBevel;

    function AddToWMat(WBILLID:integer):boolean;
    function DelFromWMat(WBILLID:integer):boolean;
    function NextIdMat:integer;{ Функция получения следующего ID для позиции}
    function NumMats:boolean;

    procedure aAddKAExecute(Sender: TObject);
    procedure aBalanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure aContextFindExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aFindBeginExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aFindParamsExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aPersonsExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetKursExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure btnSetTimeClick(Sender: TObject);
    procedure cbCurrKeyPress(Sender: TObject; var Key: Char);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbPayCurrKeyPress(Sender: TObject; var Key: Char);
    procedure cbPayCurrPropertiesChange(Sender: TObject);
    procedure cbPayTypePropertiesChange(Sender: TObject);
    procedure cbPayTypePropertiesInitPopup(Sender: TObject);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure chbCheckNDSClick(Sender: TObject);
    procedure chbPayClick(Sender: TObject);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceNoNdsGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure edAddChargesPropertiesChange(Sender: TObject);
    procedure edConditionKeyPress(Sender: TObject; var Key: Char);
    procedure edDateKeyPress(Sender: TObject; var Key: Char);
    procedure edDiscountAddPropertiesChange(Sender: TObject);
    procedure edDiscountDecPropertiesChange(Sender: TObject);
    procedure edFindPropertiesChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure edNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edPayNumKeyPress(Sender: TObject; var Key: Char);
    procedure edPayNumPropertiesChange(Sender: TObject);
    procedure edPaySummKeyPress(Sender: TObject; var Key: Char);
    procedure edReasonPropertiesChange(Sender: TObject);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure GetPayForms;
    procedure lcbPersonNameExit(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesChange(Sender: TObject);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure mnuPosNameClick(Sender: TObject);
    procedure rbtDiscountAddClick(Sender: TObject);
    procedure rbtDiscountDecClick(Sender: TObject);
    procedure SetDefCurrCtrls;

  private
    AAddCharges, ADiscount, ASummWONDS, ASummNDS:Extended;
    CurKurs : Extended;
    CurrentNDS:Extended;
    defCurrID:integer;
    defCurrName, defCurrShortName:string;
    DocALLSUMM: Extended;
    FBSPressed: Boolean;
    FCurrNum: Integer;
    FFindStr: string;
    FGridRefresh: boolean;
    FindIndex: Integer;
    FindStr: string;
    FKAID: Integer;
    FKAModified: Boolean;
    FPosModified: boolean;
    FRateDate: TDateTime;
    FRateID: integer;
    LockFind: Boolean;

    function  KAName(kaid:integer):string;
    function GetSummWithNDS(PriceNDS,Amount,aNDS:Extended):Extended; //Функция подсчёта суммы с НДС
    procedure FindPos;
    procedure GetSummAll;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure SetKurs_;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    function checkNum:boolean;

  public
    ParentHandle: HWND;
    WBillID: Integer;
    procedure SetCaptions; override;
  end;

var
  frmEditTaxWB: TfrmEditTaxWB;

//=============================================================================================
implementation

uses
  prConst, ClientData, prFun,
  fKAgent, ssFun, ShellAPI, StdConvs, EditTaxWBDet, prTypes, CurrencyEdit,
  ssCallbackConst, fMessageDlg, xLngManager, ssRegUtils, EditMaterials, KATurnover,
  StrUtils, ssStrUtil, okClasses, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure  TfrmEditTaxWB.GetPayForms;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.GetPayForms') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    Screen.Cursor := crSQLWait;
    cbPayForm.Clear;
    cbPayForm.Properties.Items.Clear;
    ProviderName := 'pPayType_List';
    Open;
    if not IsEmpty then begin
      First;
      while not eof do begin
        if Fields.fieldbyname('name').AsString<>'' then
          cbPayForm.Properties.Items.Add(Fields.fieldbyname('name').AsString);
        Next;
      end;//while not eof
    end;//if not IsEmpty then
    Close;

  finally
    Screen.Cursor := crDefault;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция подсчёта суммы с НДС
//==============================================================================================
function TfrmEditTaxWB.GetSummWithNDS(PriceNDS,Amount,aNDS:Extended):Extended;
  var
    pricenonds,summcurnonds,summnds:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.GetSummWithNDS') else _udebug := nil;{$ENDIF}

  pricenonds := roundtoa(PriceNDS - NDSOut(PriceNDS,aNDS),-6);
  summcurnonds := roundtoa(amount * pricenonds,-2);
  summnds := roundtoa(GetNDS(summcurnonds,CurrentNDS),-2);
  result := summcurnonds + summnds;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfrmEditTaxWB.GetSummAll;
  var
    i:integer;
    PriceOutNDS, PriceNDS, SummOutNDS,SummNDS,Summ,
    AllSumm, AllSummOutNDS, AllSummNDS,
    AddChargesNDS, AddChargesOutNDS, DiscountNDS, DiscountOutNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    AAddCharges := 0;
    ADiscount := 0;
    AllSumm := 0;
    AllSummOutNDS := 0;
    AllSummNDS := 0;
    AllSumm := 0;

    for i := 0 to Count - 1 do begin
      try
        PriceOutNDS := RoundToA(NDSOut(ssStrToFloat(Items[i].Values[colPrice.Index]), CurrentNDS), RoundPrice);
        PriceNDS := RoundToA(Items[i].Values[colPrice.Index] - PriceOutNDS,RoundPrice);

        NDSCalc(ssStrToFloat(Items[i].Values[colAmount.Index]), ssStrToFloat(Items[i].Values[colPrice.Index]),
          CurrentNDS, 1, SummOutNDS, SummNDS);

        Summ := RoundToA(SummOutNDS + SummNDS, -2);  //Сумма c НДС
        SummNDS := RoundToA(SummNDS, -2);
        SummOutNDS := RoundToA(Summ - SummNDS, -2);
        AllSumm := AllSumm + Summ;
        AllSummOutNDS := AllSummOutNDS + SummOutNDS;
        AllSummNDS := AllSummNDS + SummNDS;

      except
        Items[i].Values[colSummCurr.Index] := -1;
        Items[i].Values[colPriceWONDS.Index] := -1;
        Items[i].Values[colPriceNDS.Index] := -1;
      end;
    end;

    try
      if rbtDiscountAdd.Checked and (StrToFloat(edDiscountAdd.EditingText)>=0) then begin
        DiscountNDS := AllSummNDS/100 * StrToFloat(edDiscountAdd.EditingText);
        DiscountOutNDS := AllSummOutNDS/100 * StrToFloat(edDiscountAdd.EditingText);
        AllSummOutNDS := RoundtoA(AllSummOutNDS + DiscountOutNDS, -2);
        AllSummNDS := RoundtoA(AllSummNDS + DiscountNDS, -2);
        AllSumm := AllSummOutNDS + AllSummNDS;
        ADiscount := DiscountOutNDS;
      end;

    except
    end;

    try
      if rbtDiscountDec.Checked and (StrToFloat(edDiscountDec.EditingText) >= 0) then begin
        DiscountNDS := AllSummNDS / 100 * StrToFloat(edDiscountDec.EditingText);
        DiscountOutNDS := AllSummOutNDS / 100 * StrToFloat(edDiscountDec.EditingText);
        AllSummOutNDS := RoundtoA(AllSummOutNDS - DiscountOutNDS, -2);
        AllSummNDS := RoundtoA(AllSummNDS - DiscountNDS, -2);
        AllSumm := AllSummOutNDS + AllSummNDS;
        ADiscount := -DiscountOutNDS;
      end;

    except
    end;

    try
      try
        if StrToFloat(edAddCharges.EditText)>0 then begin
           NDSCalc(1, StrToFloat(edAddCharges.EditingText),CurrentNDS, 1, AddChargesOutNDS, AddChargesNDS);
           AllSummOutNDS := RoundtoA(AllSummOutNDS + AddChargesOutNDS, -2);
           AAddCharges := AddChargesOutNDS;
           AllSummNDS := RoundtoA(AllSummNDS + AddChargesNDS, -2);
           AllSumm := AllSummOutNDS + AllSummNDS;
        end;

        except
        end;

    finally
      lSummDefNoNDS.Caption := formatfloat(MoneyDisplayFormat, AllSummOutNDS);
      lSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
      ASummWONDS := AllSummOutNDS;

      lSummDefNDS.Caption := formatfloat(MoneyDisplayFormat,AllSummNDS);
      lSummDefNDS.Hint := lSummDefNDS.Caption;
      ASummNDS := AllSummNDS;

      lSummDef.Caption := formatfloat(MoneyDisplayFormat, AllSumm);
      lSummDef.Hint := lSummDef.Caption;

    end;
    DocALLSUMM := AllSumm;
  end;//with dbgWaybillDet do

  FGridRefresh := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam=9
      then begin
        GetSummAll;
        dbgWaybillDet.ClearSelection;
        dbgWaybillDet.FocusedNode.Selected := True;
      end
      else case TRefType(M.LParam) of
        rtPersons:
           begin
            DSRefresh(cdsPersonName, 'KAID', M.WParam);
            lcbPersonName.KeyValue := M.WParam;
            lcbPersonName.SelStart := 0;
           end;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditTaxWB.DelFromWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.DelFromWMat') else _udebug := nil;{$ENDIF}


  result := False;

  with newDataSet do
  try
    TrStart;
    try
      ProviderName := 'pWMatTurn_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;
      ProviderName := 'pWMat_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;
      result := True;
      TrCommit;
    finally
      Free;
    end;

  except
    on e:exception do begin
       TrRollback;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
function TfrmEditTaxWB.AddToWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.AddToWMat') else _udebug := nil;{$ENDIF}

  result := False;
  with newDataSet do
  try
    TrStart;

    try
      ProviderName := 'pWMatTurn_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMat_Del';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMat_Ins2';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      ProviderName := 'pWMatTurn_Ins';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := WBILLID;
      Execute;

      result := True;
      TrCommit;

    finally
      Free;
    end;

  except
    on e:exception do begin
       TrRollback;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditTaxWB.NextIdMat: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.NextIdMat') else _udebug := nil;{$ENDIF}

  try
    with newDataSet do
     try
       Result := GetMaxID(dmData.SConnection, 'taxwbdet', 'twbdetid');

     finally
       Free;
     end;

  except
    Result := -1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditTaxWB.checkNum:boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.checkNum') else _udebug := nil;{$ENDIF}

  Result := false;

  with newDataSet do
  try
    ProviderName := 'pWaybillNum_Get';
    FetchParams;
    Params.ParamByName('NUM').AsString := edNum1.Text;
    Open;
    if  Fields[0].AsInteger > 0
      then Result := false
      else Result := true;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.setid') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  CurrentNDS := NDS;
  chbCheckNDS.Checked := NDS <> 0;
  //edNDS.EditValue := NDS;

  cdsPersonName.Open;
  if cdsPersonName.Locate('userid', UserID, [])
    then lcbPersonName.KeyValue := cdsPersonName.FieldByName('kaid').AsInteger
    else begin
      lcbPersonName.KeyValue := 0;
      lcbPersonName.Text := '';
    end;
  edDate.Date := OnDate;
  CurKurs := 1;
  //SetKurs;
  Fid := Value;
  edKAgent.Tag := 0;
  edKAgent.Text := '';
  GetPayForms;

  with newDataSet do
  try
    //Установка номера по умолчанию
    if (Value = 0) and TaxAutoNum then begin
      FCurrNum := GetDocNum(dmData.SConnection, dtTaxWB, 1);
      edNum1.Text := TaxPrefix + IntToStr(FCurrNum) + TaxSuffix;
    end
    else edNum1.Text := '';

    if Value <> 0 then begin
      Self.Caption := rs('fmWaybill', 'EditTaxWB');
      ProviderName := 'pTaxWB_Get';
      FetchParams;
      Params.ParamByName('twbid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edNum1.Text := fieldbyname('num').AsString;
        edNum1.Tag := fieldbyname('defnum').AsInteger;
        edDate.Date := fieldbyname('ondate').AsDateTime;
        edTime.Time := fieldbyname('ondate').AsDateTime;
        edKAgent.KAID := FieldByName('kaid').AsInteger;
        if not fieldbyname('personid').IsNull then lcbPersonName.KeyValue := fieldbyname('personid').AsInteger;
        edCondition.Text := fieldbyname('Condition').AsString;
        chbPosting.Checked := fieldbyname('CHECKED').AsInteger=1;
        cbPayForm.Text := fieldbyname('Form').AsString;
        edAddCharges.Value := fieldbyname('addcharges').AsFloat;

        if fieldbyname('DISCOUNT').AsFloat >= 0 then begin
          rbtDiscountAdd.Checked := true;
          edDiscountAdd.Value := fieldbyname('DISCOUNT').AsFloat;
        end
        else begin
          rbtDiscountDec.Checked := true;
          edDiscountDec.Value := -1*fieldbyname('DISCOUNT').AsFloat;
        end;

        CurrentNDS := fieldbyname('NDS').AsFloat;
        chbCheckNDS.Checked := fieldbyname('NDS').AsFloat > 0;
        //edNDS.EditValue := CurrentNDS;
      end;//if not IsEmpty
      Close;
    end//if Value<>0
    else Self.Caption := rs('fmWaybill', 'AddTaxWB');

    ProviderName := 'pTaxWBDet_Get';// чтение позиций в mdDet
    FetchParams;
    Params.ParamByName('twbid').AsInteger := fid;
    Open;
    mdDet.CopyFromDataSet(Fields[0].DataSet);
    mdDet.First;
    if not mdDet.IsEmpty then begin
      //dbgWaybillDet.FocusedAbsoluteIndex := dbgWaybillDet.Items[0].AbsoluteIndex;
      dbgWaybillDet.FocusedNode.Selected := True;
    end;

    FModified := false;
    FPosModified := false;
    FGridRefresh := True;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
     NewRecord: boolean;
     BM:TBookmark;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    with newDataSet do begin
      try
        TrStart;
        try
          Screen.Cursor := crSQLWait;
          NewRecord := (ID = 0);

          if NewRecord then begin
            FID := GetMaxID(dmData.SConnection, 'taxwb', 'twbid');
          end;//if ID=0

          if NewRecord
            then ProviderName := 'pTaxWB_Ins'
            else ProviderName := 'pTaxWB_Upd';

          FetchParams;
          Params.ParamByName('TWBID').AsInteger := FID;
          Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
          Params.ParamByName('ONDATE').AsDate := edDate.Date + edTime.Time;
          Params.ParamByName('NUM').AsString := edNum1.Text;
          Params.ParamByName('ADDCHARGES').AsFloat := RoundToA(edAddCharges.Value, -2);

          if rbtDiscountAdd.Checked then
            Params.ParamByName('DISCOUNT').AsFloat := RoundToA(edDiscountAdd.Value, -2);

          if rbtDiscountDec.Checked then
            Params.ParamByName('DISCOUNT').AsFloat := -1*RoundToA(edDiscountDec.Value, -2);

          if edNum1.Tag > 0
            then Params.ParamByName('DEFNUM').AsInteger := edNum1.Tag
            else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,3);

          Params.ParamByName('DELETED').AsInteger := 0;
          Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
          Params.ParamByName('SUMMALL').AsFloat := DocALLSUMM;
          Params.ParamByName('CONDITION').AsString := edCondition.Text;
          Params.ParamByName('FORM').AsString := cbPayForm.Text;
          if lcbPersonName.EditText='' then begin
            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
          end
          else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

          Params.ParamByName('NDS').AsFloat := roundtoa(CurrentNDS,-2);
          
          {Params.ParamByName('ATTNUM').AsString := '';
          Params.ParamByName('ATTDATE').AsDate := 0;
          Params.ParamByName('WTYPE').AsInteger := 1;//тип накладной 0-приходная; 1-расходная;
          Params.ParamByName('NDS').AsFloat := roundtoa(CurrentNDS,-2);
          Params.ParamByName('RECEIVED').AsString := '';
          Params.ParamByName('TODATE').DataType := ftDateTime;
          Params.ParamByName('TODATE').Clear;
          }

          Execute;


          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pTaxWBDet_Del';
            FetchParams;
            Params.ParamByName('TWBID').AsInteger := ID;
            Execute;  //Удалили позиции

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.First; // Запись позиций из mdDet в waybilldet
            ProviderName := 'pTaxWBDet_Ins';
            FetchParams;
            while not mdDet.Eof do begin
              Params.ParamByName('TWBDETID').AsInteger := NextIdMat;
              if Params.ParamByName('TWBDETID').AsInteger<0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));
              Params.ParamByName('TWBID').AsInteger := FID;
              Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
              Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString),MatDisplayDigits);
              Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString),-6);
              Params.ParamByName('ONDATE').AsDateTime := mdDet.fieldbyname('ONDATE').AsDateTime;
              Execute;//Записываем очередную позицию
              mdDet.Next;
            end;//while not mdDet.Eof
            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;
            FPosModified := false;//Сбрасываем флаг изменения позиций
          end;//if FPosModified

          if WBillID > 0 then begin
            ProviderName := 'pDocsRel_WB_Tax_Ins';
            FetchParams;
            Params.ParamByName('twbid').AsInteger := FID;
            Params.ParamByName('wbillid').AsInteger := WBillID;
            Execute;
          end;

          FModified := False;//флаг изменения документа false
          TrCommit;

          if WBillID > 0 then begin
            SendMessage(MainHandle, WM_REFRESH, 0, 0);
            RefreshFun('TfmTaxWB', 0);
          end
          else begin
            SendMessage(MainHandle, WM_REFRESH, ID, 0);
          end;

          if (ModalResult=mrYes) then//Если применить
            if NewRecord then begin
              edDate.Date := Date;
              edKAgent.KAID := 0;
              edCondition.Text := '';
              //edPersonname.Text := '';
              chbPosting.Checked := false;
              edNum1.SetFocus;
              mdDet.Close;
              //  {???}       SendMessage(MainHandle, WM_REFRESH, ID, 0);
              ID := 0;
            end//if NewRecord
            else begin
              if chbPosting.Checked then CanClose := true
              else begin
                mdDet.Close;
                ID := ID;
              end;
            end//else NewRecord
          else CanClose := True;
          FGridRefresh := True;

        finally
          Free;
          Screen.Cursor := crDefault;
        end;

      except
        on e:exception do begin
          TrRollback;
          raise;
        end;
      end;
    end;
  end
  else begin
    if GetDocNum(dmData.SConnection, dtTaxWB, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtTaxWB, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditTaxWB.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.ActionListUpdate') else _udebug := nil;{$ENDIF}

  edDiscountAdd.Enabled := rbtDiscountAdd.Checked;
  edDiscountDec.Enabled := rbtDiscountDec.Checked;

  if edKAgent.Focused
    then aAddKA.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddKA.ShortCut := TextToShortCut('');

  if lcbPersonName.Focused
    then aPersons.ShortCut := TextToShortCut('Ctrl+Ins')
    else aPersons.ShortCut := TextToShortCut('');


  lTotal.Caption := rs('fmWaybill', 'TotalIn')+' '+BaseCurrName;

  if FGridRefresh then GetSummAll;

  aOk.Enabled := (lNum.Font.Color<>clRed)and(lOndate.Font.Color<>clRed)
    and(lCondition.Font.Color<>clRed)
    and(lAddCharges.Font.Color<>clRed)and(rbtDiscountAdd.Font.Color<>clRed)
    and(rbtDiscountDec.Font.Color<>clRed)and(not mdDet.IsEmpty)
    and (edKAgent.KAID > 0);

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified);

  aCIns.Enabled := True;
  aCDel.Enabled := dbgWaybillDet.SelectedCount > 0;
  aCUpd.Enabled := aCDel.Enabled and (dbgWaybillDet.SelectedCount = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.DataModified') else _udebug := nil;{$ENDIF}
  FModified := True;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.SetCaptions;
  //var FItem: TcxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill', 'DocTaxWB');
    btnFind.Hint := GetRS('Common', 'Find');
    btnFindParams.Hint := GetRS('Common', 'FindParams');
    aFindBegin.Caption := GetRS('Common', 'FindBegin');
    aFindConcurr.Caption := GetRS('Common', 'FindConcurr');
    aFindSubstr.Caption := GetRS('Common', 'FindSubst');
    aContextFind.Caption := GetRS('Common', 'FindContext');
    mnuPosName.Caption := GetRS('fmWaybill', 'Name');
    mnuPosArtikul.Caption := GetRS('fmWaybill', 'Artikul');

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aCIns.Caption := GetRS('Common', 'Add');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCDel.Caption := GetRS('Common', 'Del');
    aShowRealPrice.Caption := GetRS('fmWaybill', 'ShowRealPrice');
    btnSetTime.Hint := GetRS('fmWaybill', 'EditTime');
    aPersons.Hint := GetRS('fmWaybill', 'aPersons');
    gbHeader.Caption := ' ' + GetRS('fmWaybill', 'MainInfo') + ' ';
    gbAddInfo.Caption := ' ' + GetRS('fmWaybill', 'AddInfo') + ' ';
    gbPos.Caption := ' ' + GetRS('fmWaybill', 'Positions') + ' ';

    edKAgent.InitRes;
    edKAgent.Caption.Caption := GetRS('fmWaybill', 'KANameOut') + ':';
    lNum.Caption := GetRS('fmWaybill', 'Num') + ':';
    lOndate.Caption := GetRS('fmWaybill', 'OnDate') + ':';
    lKAFullName.Caption := GetRS('fmWaybill', 'FullName') + ':';
    lKAAdress.Caption := GetRS('fmWaybill', 'KAadress') + ':';
    lKAPhone.Caption := GetRS('fmWaybill', 'KAPhone') + ':';
    lKAINN.Caption := GetRS('fmWaybill', 'INN') + ':';
    lKACertNum.Caption := GetRS('fmWaybill', 'CertNumEx') + ':';

    lCondition.Caption := GetRS('fmWaybill', 'Condition') + ':';
    lPayForm.Caption := GetRS('fmWaybill', 'PayForm') + ':';
    lAddCharges.Caption := GetRS('fmWaybill', 'TransCharges') + ':';
    lPersonname.Caption := GetRS('fmWaybill', 'WhoCreate') + ':';
    rbtDiscountAdd.Caption := GetRS('fmWaybill', 'Extra') + ' (%)';
    rbtDiscountDec.Caption := GetRS('fmWaybill', 'Discount') + ' (%)';

    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') + ':';
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
    chbCheckNDS.Properties.Caption := GetRS('fmWaybill', 'GetNDS');
    chbPosting.Properties.Caption := GetRS('fmWaybill', 'Posting');

    colRecNo.Caption := GetRS('fmWaybill', 'NumEx');
    colMatName.Caption := GetRS('fmWaybill', 'MatName');
    colMeasureName.Caption := GetRS('fmWaybill', 'Measure');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colPrice.Caption := GetRS('fmWaybill', 'PriceWithNDS');
    colPriceNDS.Caption := GetRS('fmWaybill', 'NDS');
    colPriceWONDS.Caption := GetRS('fmWaybill', 'Price') + ' ' + GetRS('fmWaybill', 'outNDS');
    colOnDate.Caption := GetRS('fmWaybill', 'DateOfShipment');
    colSummCurr.Caption := GetRS('fmWaybill', 'Summ');
    colSummCurr.SummaryFooterFormat := GetRS('fmWaybill', 'Summ') + ': ' + '0.00';
    aMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnPrint.Hint := GetRS('fmWaybill', 'PrintWB');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aCInsExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditTaxWBDet.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    ParentHandle := Self.Handle;
    OnDate := Self.OnDate;
    edDateOfShipment.Date := edDate.Date;
    PosNDS := CurrentNDS;
    CurrID := BaseCurrID;
    Kurs := CurKurs;
    Tag := integer(mdDet);
    id := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    Caption := rs('fmWaybill', 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := true;
      dbgWaybillDet.SetFocus;
    end;

    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;




//==============================================================================================
procedure TfrmEditTaxWB.aCDelExecute(Sender: TObject);
var
  FItem: TListItem;
  i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aCDelExecute') else _udebug := nil;{$ENDIF}


  if ((dbgWaybillDet.SelectedCount = 1) and
     (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes))
       or
     ((dbgWaybillDet.SelectedCount > 1) and
     (ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])<>mrYes))
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;

  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('twbdetid', dbgWaybillDet.SelectedNodes[i].Values[colID.Index], [])
        then mdDet.Delete;
    end;

    NumMats;
    FPosModified := true;
    FGridRefresh := true;

  finally
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.cxDateEdit1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cxDateEdit1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  NumMats;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditTaxWB.SetKurs_;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.SetKurs_') else _udebug := nil;{$ENDIF}

  CurKurs := -1;
  try
    CurKurs := GetCurrencyRate(dmData.SConnection,cbCurr.KeyValue,strtodate(edDate.Text), FRateDate, FRateID);
  except
    CurKurs := -1;
  end;

  if CurKurs>0 then begin
    sbKurs.Font.Color := clBlack;
    sbKurs.Caption := floattostr(CurKurs);
  end
  else begin
    sbKurs.Font.Color := clRed;
    sbKurs.Caption := rs_NoKurs;
  end;

  sbKurs.Refresh;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;


//==============================================================================================
procedure TfrmEditTaxWB.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.mdMatsAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.mdMatsAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.mdMatsAfterEdit(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormShow') else _udebug := nil;{$ENDIF}

  inherited;
  btnAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  Screen.Cursor := crDefault;
  FormResize(frmEditTaxWB);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.SetDefCurrCtrls;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.SetDefCurrCtrls') else _udebug := nil;{$ENDIF}

  colSummDef.Caption := rs_SummIn+' '+BaseCurrName;
  colSummCurr.Caption := rs_SummIn+' '+cbCurr.EditText;
  if BaseCurrID <> cbCurr.KeyValue
    then colSummDef.Visible := true
    else colSummDef.Visible := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;


//==============================================================================================
procedure TfrmEditTaxWB.edTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edTimePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditTaxWBDet.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    dbgWaybillDet.SetFocus;
    OnDate := Self.OnDate;
    ParentHandle := Self.Handle;
    PosNDS := CurrentNDS;
    CurrID := BaseCurrID;
    Kurs := CurKurs;
    Tag := integer(mdDet);

    id := mdDet.FieldByName('twbdetid').AsInteger;
    Caption := rs('fmWaybill', 'PosEdit');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditTaxWB.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.cdsDetailCalcFields(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;


//Нумерация позиций
//==============================================================================================
function TfrmEditTaxWB.NumMats: boolean;
  var
    BM:TBookmark;
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.NumMats') else _udebug := nil;{$ENDIF}

  Result := True;

  with mdDet do begin
    BM := GetBookmark;
    DisableControls;

    try
      try
        First;
        i := 1;

        while not Eof do begin
          Edit;
          FieldByName('posid').AsInteger := i;

          if CurKurs > 0
            then FieldByName('summdef').AsFloat := FieldByName('summ').AsFloat*CurKurs
            else FieldByName('summdef').Clear;

          Post;
          Inc(i);
          Next;
        end;//while

      except
        Result := false;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;//while

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



//==============================================================================================
procedure TfrmEditTaxWB.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edDateKeyPress') else _udebug := nil;{$ENDIF}

  if key = #32 then edDate.DroppedDown := true;
  if lOndate.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aSetTimeExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aAddKAExecute') else _udebug := nil;{$ENDIF}

  try aid := edKAgent.KAID; except aid := 0; end;
  edKAgent.Editor.SetFocus;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, aid, 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
   if not aShowRealPrice.Checked  then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := formatfloat(MoneyDisplayFormat, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    dbgWaybillDet.Repaint;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colPriceNoNdsGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colPriceNoNdsGetText') else _udebug := nil;{$ENDIF}

  try
   AText := floattostr(ANode.Values[colPrice.index]-roundtoa(NDSOut(ANode.Values[colPrice.index],CurrentNDS),-2));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    PrWONDS, PrNDS: Extended;
    SummOutNDS, SummNDS, Summ: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  try
    PrWONDS := RoundToA(NDSOut(ANode.Values[colPrice.Index], CurrentNDS), RoundPrice);
    PrNDS := RoundToA(ANode.Values[colPrice.Index] - PrWONDS, RoundPrice);
    NDSCalc(ANode.Values[colAmount.Index], ANode.Values[colPrice.Index], CurrentNDS, 1, SummOutNDS, SummNDS);
    Summ := SummOutNDS + SummNDS;
    if not aShowRealPrice.Checked
      then AText := FormatFloat(MoneyDisplayFormat, Summ)
      else AText := FloatToStr(Summ);

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colRecNoGetText') else _udebug := nil;{$ENDIF}

  try
    AText := IntToStr(ANode.Index+1);
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, AWidth, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormResize') else _udebug := nil;{$ENDIF}

  inherited;

  AStyle := GetWindowLong(dbgWaybillDet.Handle, GWL_STYLE);

   if AStyle and WS_VSCROLL = WS_VSCROLL
     then Offset := 19
     else Offset := 2;

   AWidth := dbgWaybillDet.Width - Offset;

   for i := 0 to dbgWaybillDet.ColumnCount - 1 do
     if (dbgWaybillDet.Columns[i] <> colMatName) and dbgWaybillDet.Columns[i].Visible
       then AWidth := AWidth - dbgWaybillDet.Columns[i].Width;

   colMatName.Width := AWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.chbPayPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked) then begin
       edPayNum.Text := inttostr(GetMaxID(dmData.SConnection, 'paydoc', 'paydocid')+1);
       edPaySumm.Tag := 1;
       edPaySumm.Value := roundtoa(ALLSUMM,-2);
       edPaySumm.Tag := 0;
       cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
    else begin
      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
      cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end;//else
   FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.edPayNumPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edPayNumPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbPayTypePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbPayTypePropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbPayCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbPayCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FModified := true;
    SetKurs;
    NumMats;
    FGridRefresh := true;
    SetDefCurrCtrls;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbCurrPropertiesEditValueChanged(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  FormResize(Self);
  if BaseCurrID<>cbCurr.KeyValue
   then colPrice.Caption := rs_Price
   else colPrice.Caption := rs_PriceWithNDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.chbPayClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.chbPayClick') else _udebug := nil;{$ENDIF}

  cbPayType.Enabled := chbPay.Checked;
  edPaySumm.Enabled := chbPay.Checked;
  edPayNum.Enabled := chbPay.Checked;
  cbPayCurr.Enabled := chbPay.Checked;
  lPayType.Enabled := chbPay.Checked;
  lPayNum.Enabled := chbPay.Checked;
  lPaySumm.Enabled := chbPay.Checked;
  lPayCurr.Enabled := chbPay.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbPayTypePropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbPayTypePropertiesInitPopup') else _udebug := nil;{$ENDIF}

  cbPayForm.Properties.DropDownWidth := cbPayForm.Width-2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    n: tdxtreelistnode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edTime.Time := Time;
  chbPosting.Checked := DefCheckWB;
  chbCheckNDS.Checked := EntNDSPayer = 1;

  txtLang.Caption := keyboardIndicator;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindCriteria', Temp)
    then case Temp of
      0: aFindBegin.Checked := True;
      1: aFindSubstr.Checked := True;
      2: aFindConcurr.Checked := True;
    end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosContextFind', Temp)
    then aContextFind.Checked := Temp <> 0;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindField', Temp)
    then case Temp of
      0: mnuPosName.Checked := True;
      1: mnuPosArtikul.Checked := True;
    end;

  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\edKAgent');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
   rtPersons: DSRefresh(cdsPersonName, 'kaid', 0);
   //rtKAgent: DSRefresh(cdsKAgent, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.Enabled then begin
    if Key = #13 then begin
      Key := #0;
      dbgWaybillDet.SetFocus;
    end;
  end
  else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  {if chbPay.Enabled then begin
    if Key=#13 then begin
      Key := #0;
      chbPay.SetFocus;
    end;
  end
  else
  }
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbPayCurrKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbPayCurrKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    if btnOk.Enabled
      then btnOk.SetFocus
      else btnCancel.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormKeyDown') else _udebug := nil;{$ENDIF}

  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
    if cbPayForm.Focused and not cbPayForm.DroppedDown then begin
      case Key of
        VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
        VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
      end;
      Key := 0;
    end
    else if lcbPersonName.Focused and not lcbPersonName.DroppedDown then begin
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
procedure TfrmEditTaxWB.edNum1KeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edNum1KeyPress') else _udebug := nil;{$ENDIF}

  if lNum.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.cbCurrKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.cbCurrKeyPress') else _udebug := nil;{$ENDIF}

  if sbKurs.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.aPersonsExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aPersonsExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbPersonName.KeyValue; except aid := 0; end;
  lcbPersonName.SetFocus;
  ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  lcbPersonName.SelStart := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aSetKursExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aSetKursExecute') else _udebug := nil;{$ENDIF}

  with TfrmCurrencyEdit.Create(nil) do
    try
       MainHandle := Self.Handle;
       ParentNameEx := Self.Name;
       OnDate := Self.edDate.Date;
       ID := Self.cbCurr.KeyValue;
       if Self.FRateDate=Self.edDate.Date
        then SubID := Self.FRateID;
       SetFocusToRate := True;
       if ShowModal=mrOk then begin
        SetKurs;
       end;

    finally
       Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfrmEditTaxWB.KAName(kaid:integer):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.KAName') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    RemoteServer := dmData.SConnection;
    ProviderName := 'pKAgentName_Get';
    FetchParams;
    Params.ParamByName('KAID').AsInteger := kaid;
    Open;

    if not IsEmpty
      then Result := Fields[0].AsString
      else Result := '';

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditTaxWB.lcbPersonNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.lcbPersonNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edReasonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edReasonPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edPaySummKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edPaySummKeyPress') else _udebug := nil;{$ENDIF}

  if lPaySumm.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.edPayNumKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edPayNumKeyPress') else _udebug := nil;{$ENDIF}

  if lPayNum.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.dsDetDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.dsDetDataChange') else _udebug := nil;{$ENDIF}

  try
    FormResize(Self);
  finally
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edConditionKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edConditionKeyPress') else _udebug := nil;{$ENDIF}

  if lCondition.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edNDSPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    if StrToFloat(edNDS.EditingText)>=0
      then  CurrentNDS := (StrToFloat(edNDS.EditingText))
      else CurrentNDS := 0;

  except
    CurrentNDS := 0;
  end;

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditTaxWB.colPriceNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    Pr, Pr1: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colPriceNDSGetText') else _udebug := nil;{$ENDIF}

  try
    Pr1 := RoundToA(NDSOut(ANode.Values[colPrice.Index], CurrentNDS), RoundPrice);
    Pr := RoundToA(ANode.Values[colPrice.Index] - Pr1, RoundPrice);

    if not aShowRealPrice.Checked
      then AText := FormatFloat(MoneyDisplayFormat, Pr)
      else AText := FloatToStr(Pr);

  except
    AText := FormatFloat(MoneyDisplayFormat, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.colPriceWONDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    Pr: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.colPriceWONDSGetText') else _udebug := nil;{$ENDIF}

  try
    Pr := RoundToA(NDSOut(ANode.Values[colPrice.Index], CurrentNDS), RoundPrice);
    if not aShowRealPrice.Checked
      then AText := FormatFloat(MoneyDisplayFormat, Pr)
      else AText := FloatToStr(Pr);

  except
    AText := formatfloat(MoneyDisplayFormat, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edAddChargesPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edAddChargesPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edDiscountAddPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edDiscountAddPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edDiscountDecPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edDiscountDecPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.rbtDiscountAddClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.rbtDiscountAddClick') else _udebug := nil;{$ENDIF}

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.rbtDiscountDecClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.rbtDiscountDecClick') else _udebug := nil;{$ENDIF}

  FModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.chbCheckNDSClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.chbCheckNDSClick') else _udebug := nil;{$ENDIF}

  if chbCheckNDS.Checked
    then CurrentNDS := NDS
    else CurrentNDS := 0;

  FModified := True;
  FGridRefresh := True;
  dbgWaybillDet.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.btnSetTimeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.btnSetTimeClick') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;
  edDate.Date := Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  txtLang.Caption := keyboardIndicator;

  edKAgent.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aFindBeginExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aFindBeginExecute') else _udebug := nil;{$ENDIF}

  (Sender as TAction).Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aContextFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aContextFindExecute') else _udebug := nil;{$ENDIF}

  aContextFind.Checked := not aContextFind.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aFindParamsExecute(Sender: TObject);
  var
    Pos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aFindParamsExecute') else _udebug := nil;{$ENDIF}

  Pos := panPosBar.ClientToScreen(Point(btnFindParams.Left, btnFindParams.Top + btnFindParams.Height + 1));
  pmFind.Popup(Pos.X, Pos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\edKAgent');

  if aFindBegin.Checked then Temp := 0
  else if aFindSubstr.Checked then Temp := 1
  else Temp := 2; // aFindConcurr.Checked

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindCriteria', Temp);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosContextFind', Integer(aContextFind.Checked));

  if mnuPosName.Checked
    then Temp := 0
    else Temp := 1;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindField', Temp);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.mnuPosNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.mnuPosNameClick') else _udebug := nil;{$ENDIF}

  (Sender as TTBItem).Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.FindPos;
  var
    FNode: TdxTreeListNode;
    FName: string;
    ftype: TLocateType;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.FindPos') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr <> edFind.Text then FindIndex := -1;

  FindStr := edFind.Text;

  if FindStr = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if mnuPosName.Checked
    then FName := 'matname'
    else FName := 'artikul';

   if aFindConcurr.Checked then ftype := ltFull
   else if aFindBegin.Checked then ftype := ltBegin
   else ftype := ltSubstr; // if aFindSubstr.Checked

   FNode := FindNode(dbgWaybillDet, FName, edFind.Text, ftype, FindIndex);

   if FNode <> nil then begin
     FindIndex := FNode.Index;
     dbgWaybillDet.ClearSelection;
     dbgWaybillDet.FocusedAbsoluteIndex := FNode.AbsoluteIndex;
     FNode.Selected := True;
     mdDet.Locate('twbdetid', FNode.Values[colID.Index], []);
   end
   else ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aFindExecute') else _udebug := nil;{$ENDIF}

  FindPos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edFindPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edFindPropertiesChange') else _udebug := nil;{$ENDIF}

  if aContextFind.Checked then begin
    aFind.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  //************************************
    mdReport.Close;
    //Чтение позиций из налоговой накладной
    mdReport.CopyFromDataSet(mdDet);

    //Перевод цен в "без НДС"
    with mdReport do begin
      First;
      while not Eof do begin
        Edit;
        FieldByName('price').AsFloat := RoundToA(NDSOut(FieldByName('price').AsFloat, CurrentNDS), RoundPrice);
        Next;
      end;
    end;

  SmartShowRep(frDoc, 'TaxWB.frf');

  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aBalanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aBalanceExecute') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if edKAgent.KAID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := edKAgent.KAID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'ondate') then  ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'docnum') then  ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'Condition') then  ParValue := edCondition.Text
  else if 0 = AnsiCompareText(ParName, 'Form') then  ParValue := cbPayForm.Text
  else if 0 = AnsiCompareText(ParName, 'NDS') then  ParValue := FloatToStr(CurrentNDS)
  else if 0 = AnsiCompareText(ParName, 'Personname') then  ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'MatDisplayFormat') then ParValue := MatDisplayFormat
  else if 0 = AnsiCompareText(ParName, 'AddCharges') then ParValue := AAddCharges
  else if 0 = AnsiCompareText(ParName, 'DiscountAdd') then begin
    if ADiscount > 0
      then ParValue := ADiscount
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'DiscountDec') then begin
    if ADiscount < 0
      then ParValue := -ADiscount
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'SummWONDS') then ParValue := ASummWONDS
  else if 0 = AnsiCompareText(ParName, 'SummNDS') then ParValue := ASummNDS
  else if 0 = AnsiCompareText(ParName, 'EntFullName') then  ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'EntPhone') then  ParValue := EntPhone
  else if 0 = AnsiCompareText(ParName, 'EntCertNo') then  ParValue := EntCertNum
  else if 0 = AnsiCompareText(ParName, 'EntAdress') then  ParValue := EntAddr

  else if AnsiStartsText('EntINN', ParName) then begin
    ParValue := 'X';
    try
      i := StrToInt(AnsiMidStr(ParName, 7, 2));

      if length(EntINN) >= i then ParValue := EntINN[i]
    except
    end
  end

  else if AnsiStartsText('KAINN', ParName) then begin
    ParValue := 'X';
    try
      i := StrToInt(AnsiMidStr(ParName, 6, 2));

      if (Length(edKAINN.Text) >= i) and (edKAINN.Tag=1) then ParValue := edKAINN.Text[i]
    except
    end
  end

  else if 0 = AnsiCompareText(ParName, 'KAFullName') then begin
    if Trim(edKAFullName.Text) <> ''
      then ParValue := edKAFullName.Text
      else ParValue := edKAgent.Obj.NameEx;
  end
  else if 0 = AnsiCompareText(ParName, 'KAPhone') then  ParValue := edKAPhone.Text
  else if 0 = AnsiCompareText(ParName, 'KACertNo') then  ParValue := edKACertNum.Text
  else if 0 = AnsiCompareText(ParName, 'KAAdress') then begin
    ParValue := edKAAdress.Text;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTaxWB.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTaxWB.edKAgentChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);
  edKAFullName.Text := edKAgent.Obj.FullName;
  edKAPhone.Text := edKAgent.Obj.Phone;
  edKAINN.Text := edKAgent.Obj.INN;
  edKAINN.Tag := Integer(edKAgent.Obj.NDSPayer);
  edKACertNum.Text := edKAgent.Obj.CertNum;
  edKAAdress.Text := edKAgent.Obj.GetAddr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditTaxWB', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
