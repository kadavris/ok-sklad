{$I ok_sklad.inc}
unit EditInventory;

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
  ssCalcEdit, ssDBLookupCombo, ssLabel, xButton, dxDBTLCl6, dxGrClms6,
  TB2Item, ssDBGrid, okSearchEdit;

type
  TfrmEditInventory = class(TBaseDlg)
    aActivateFind: TAction;
    aAddWHouseOut: TAction;
    aCDel: TAction;
    aCheck: TAction;
    aCIns: TAction;
    aColParams: TAction;
    aCUpd: TAction;
    aGetRestsFromWH: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMCList: TAction;
    aPersonsOut: TAction;
    aPrint: TAction;
    aSelectAll: TAction;
    aSetTime: TAction;
    aShowRealPrice: TAction;
    btnChairman: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnGetRestsFromWH: TssSpeedButton;
    btnMatInfo: TssSpeedButton;
    btnNew: TssSpeedButton;
    btnPerson1: TssSpeedButton;
    btnPerson2: TssSpeedButton;
    btnPerson3: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnSetTime: TssSpeedButton;
    btnWHouseOut: TssSpeedButton;
    cdsChairman: TssClientDataSet;
    cdsPerson1: TssClientDataSet;
    cdsPerson2: TssClientDataSet;
    cdsPerson3: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbPosting: TcxCheckBox;
    colAmount: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colBarCode: TdxDBGridColumn;
    colCurrName: TdxDBGridColumn;
    colDiff: TdxDBGridColumn;
    colDiffSum: TdxDBGridColumn;
    colFlag: TdxDBGridImageColumn;
    colGrpName: TdxDBGridColumn;
    colMatID: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colMeasureName: TdxDBGridColumn;
    colNDS: TdxDBGridColumn;
    colPosId: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colPriceTXT: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colRealAmount: TdxDBGridCalcColumn;
    colRealPrice: TdxDBGridCalcColumn;
    colRecNo: TdxDBGridColumn;
    colSummCurr: TdxDBGridColumn;
    colSummDef: TdxDBGridColumn;
    colWHouseName: TdxDBGridColumn;
    dbgWaybillDet: TssDBGrid;
    dsChairman: TDataSource;
    dsDet: TDataSource;
    dsPerson1: TDataSource;
    dsPerson2: TDataSource;
    dsPerson3: TDataSource;
    dsWhouse: TDataSource;
    edDate: TcxDateEdit;
    edFind: TokGridSearchEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    edTime: TcxTimeEdit;
    frDoc: TfrReport;
    fsrcDoc: TfrDBDataSet;
    gbComm: TssGroupBox;
    gbHeader: TssGroupBox;
    gbPos: TssGroupBox;
    lcbChairman: TssDBLookupCombo;
    lcbPerson1: TssDBLookupCombo;
    lcbPerson2: TssDBLookupCombo;
    lcbPerson3: TssDBLookupCombo;
    lcbWHouseOut: TssDBLookupCombo;
    lChairman: TLabel;
    lNum: TLabel;
    lOndate: TLabel;
    lPerson1: TLabel;
    lPerson2: TLabel;
    lPerson3: TLabel;
    lRealSum: TLabel;
    lReason: TLabel;
    lSum: TLabel;
    lSummDiff: TLabel;
    lWhouseOut: TLabel;
    mdDet: TdxMemData;
    mdDetamount: TFloatField;
    mdDetartikul: TStringField;
    mdDetbarcode: TStringField;
    mdDetchecked: TIntegerField;
    mdDetcurrid: TIntegerField;
    mdDetcurrname: TStringField;
    mdDetdiscount: TFloatField;
    mdDetgrpname: TStringField;
    mdDetmatid: TIntegerField;
    mdDetmatname: TStringField;
    mdDetmsrname: TStringField;
    mdDetnds: TFloatField;
    mdDetnum: TIntegerField;
    mdDetondate: TDateTimeField;
    mdDetonvalue: TFloatField;
    mdDetposid: TIntegerField;
    mdDetprice: TFloatField;
    mdDetptypeid: TIntegerField;
    mdDetwbillid: TIntegerField;
    mdDetwhname: TStringField;
    mdDetwid: TIntegerField;
    mdReport: TdxMemData;
    panData: TPanel;
    panHeader: TPanel;
    PanPos: TPanel;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    sepDyn: TBevel;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    txtDiffSum: TssBevel;
    txtSum: TssBevel;
    txtSumReal: TssBevel;




    function AddToWMat(WBILLID:integer):boolean;
    function DelFromWMat(WBILLID:integer):boolean;
    function NumMats1:boolean;
    procedure aActivateFindExecute(Sender: TObject);
    procedure aAddWHouseInExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCheckExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aGetRestsFromWHExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aMCListExecute(Sender: TObject);
    procedure aPersonsInExecute(Sender: TObject);
    procedure aPersonsOutExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure btnChairmanMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnChairmanMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPerson1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPerson2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPerson3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPerson3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnWHouseInMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnWHouseOutMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDiffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDiffSumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colFlagGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceNoNdsGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRealAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetChangedColumnsWidth(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure dbgWaybillDetEditing(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure dbgWaybillDetNeedAdjust(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure edDateKeyPress(Sender: TObject; var Key: Char);
    procedure edNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edReasonPropertiesChange(Sender: TObject);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure lcbChairmanEnter(Sender: TObject);
    procedure lcbChairmanExit(Sender: TObject);
    procedure lcbChairmanPropertiesEditValueChanged(Sender: TObject);
    procedure lcbPerson3KeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNameInPropertiesChange(Sender: TObject);
    procedure lcbPersonNameOutPropertiesChange(Sender: TObject);
    procedure lcbWHouseInKeyPress(Sender: TObject; var Key: Char);
    procedure lcbWHouseInPropertiesChange(Sender: TObject);
    procedure lcbWHouseOutKeyPress(Sender: TObject; var Key: Char);
    procedure lcbWHouseOutPropertiesChange(Sender: TObject);
    procedure lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure SetDefCurrCtrls;

  private
    ALLSUMM : Extended;
    FCanCheck: Boolean;
    FCurrCtrl: TControl;
    FCurrNum: Integer;
    FGridRefresh: boolean;
    FPosError:boolean;
    FPosModified: boolean;
    SummText: string;

    function CheckDatesIn:Boolean;
    function GetFirstVisibleCol: TdxDBTreeListColumn;
    procedure GetRestsFromWH;
    procedure GetSummAll;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    //Функция подсчёта суммы с НДС
    //function GetSummWithNDS(PriceNDS,Amount,aNDS:Extended):Extended;

  protected
    procedure SetKurs;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    function CheckNum:boolean;

  public
    ParentHandle: HWND;

    procedure SetCaptions; override;
  end;

var
  frmEditInventory: TfrmEditInventory;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI,
  StdConvs, EditPositionMov, prTypes, ssCallbackConst, fMessageDlg,
  ssRegUtils, EditMaterials, KATurnover, ssStrUtil, ssDateUtils,
  EditInvPos, MatMove, MatRsv, MCList, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function TfrmEditInventory.CheckDatesIn: Boolean;
  (*
  var
    eStr, eStr2,m: String;
    i:integer; tmpMaxDate:TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  Result := True;

  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.CheckDatesIn') else _udebug := nil;{$ENDIF}

  try
    m := '';
    eStr := '';
    eStr2 := '';
    if not mdWMatTurn.IsEmpty then begin
      with mdWMatTurn do begin
        First;
        while not Eof do begin
          if m='' then  m := m+IntToStr(fieldbyname('posid').AsInteger)
          else m := m+','+IntToStr(fieldbyname('posid').AsInteger);
          Next;
        end;
      end;

      with newDataSet do
      try
        ProviderName := 'pWaybill_TurnDateMin';
        FetchMacros;
        Macros.ParamByName('m').AsString := m;
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := edDate.Date+edTime.Time;
        Open;
        if not IsEmpty then begin
          tmpMaxDate := MinDateTime;

        //Формирование сообщения
          for i := 0 to dbgWaybillDet.Count-1  do begin
            eStr2 := '';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              if mdWMatTurn.FieldByName('sourceid').AsInteger=dbgWaybillDet.Items[i].Values[colPosid.Index]
                 and Locate('posid',mdWMatTurn.fieldbyname('posid').AsInteger,[]) then begin
                if eStr2='' then eStr2 := eStr2+Fields[1].AsString
                else eStr2 := eStr2+', '+Fields[1].AsString;
                if tmpMaxDate<Fields[1].AsDateTime then  tmpMaxDate := Fields[1].AsDateTime;
              end;//if
              mdWMatTurn.Next;
            end;
            if eStr2<>'' then
              eStr := eStr+amountPrefix+inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index])
            +' дата поступления товара на склад: '+eStr2+#13;

          end;//for
          eStr := 'Дата документа ('+DateTimeToStr(edDate.Date+edTime.Time)+') конфликтует со следующими позициями:'+#13+
          eStr+#13+'Поставить в документ дату последнего поступления ('+DateTimeToStr(tmpMaxDate)+') ?';
          if ssMessageDlg(eStr,ssmtWarning,[ssmbYes,ssmbNo])=mrYes then begin
            edDate.Date := tmpMaxDate;
            edTime.Time := tmpMaxDate;
//            sbEditTime.Caption := FormatDateTime('hh:mm',frac(tmpMaxDate));
            Result := true;
          end
          else Result := false;
        end//if not IsEmpty
        else Result := true;
         Close;
       finally
         Free;
      end;
    end//if not mdWMatTurn.IsEmpty then begin
    else Result := true;
  except
    Result := false;
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfrmEditInventory.GetSummAll;
 var
   i: Integer;
   FSum, FRealSum: Extended;
   FRealAmount: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    FSum := 0;
    FRealSum := 0;

    for i := 0 to Count - 1 do begin
      FSum := FSum + RoundToA(ssStrToFloat(Items[i].Values[colAmount.Index]) * ssStrToFloat(Items[i].Values[colPrice.Index]), -2);

      if VarIsNull(Items[i].Values[colRealAmount.Index])
        then FRealAmount := 0
        else FRealAmount := ssStrToFloat(Items[i].Values[colRealAmount.Index]);

      FRealSum := FRealSum + RoundToA(FRealAmount * ssStrToFloat(Items[i].Values[colRealPrice.Index]), -2);
    end;

    txtSum.Caption := FormatFloat(MoneyDisplayFormat, FSum);
    txtSumReal.Caption := FormatFloat(MoneyDisplayFormat, FRealSum);
    txtDiffSum.Caption := FormatFloat(MoneyDisplayFormat, FRealSum - FSum);

    if FRealSum - FSum < 0 then txtDiffSum.Font.Color := clRed
    else if FRealSum - FSum > 0 then txtDiffSum.Font.Color := clBlue
    else txtDiffSum.Font.Color := clMaroon;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.WMRefresh(var M: TMessage);
  var
    tmpp1, tmpp2:integer;
    tmpp1s, tmpp2s:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.WMRefresh') else _udebug := nil;{$ENDIF}


  if M.LParam = 9 then begin
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
    GetSummAll;
  end
  else if M.LParam = -1 then GetSummAll
  else
  case TRefType(M.LParam) of
    rtPersons: begin
      if lcbChairman.Tag = 1 then begin
        DSRefresh(cdsChairman, 'kaid', M.WParam);
        lcbChairman.KeyValue := M.WParam;
        lcbChairman.SelStart := 0;
      end
      else if lcbPerson1.Tag = 1 then begin
        DSRefresh(cdsPerson1, 'kaid', M.WParam);
        lcbPerson1.KeyValue := M.WParam;
        lcbPerson1.SelStart := 0;
      end
      else if lcbPerson2.Tag = 1 then begin
        DSRefresh(cdsPerson2, 'kaid', M.WParam);
        lcbPerson2.KeyValue := M.WParam;
        lcbPerson2.SelStart := 0;
      end
      else if lcbPerson3.Tag = 1 then begin
        DSRefresh(cdsPerson3, 'kaid', M.WParam);
        lcbPerson3.KeyValue := M.WParam;
        lcbPerson3.SelStart := 0;
      end;
    end;//rtPersons:begin

    rtWHouse: begin
      if lcbWHouseOut.Tag = 1 then begin
        FCanCheck := False;
        DSRefresh(cdsWhouse, 'wid', M.WParam);
        lcbWHouseOut.KeyValue := 0;
        lcbWHouseOut.Clear;
        FCanCheck := True;
        lcbWHouseOut.KeyValue := M.WParam;
      end
    end;//rtWHouse
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInventory.DelFromWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.DelFromWMat') else _udebug := nil;{$ENDIF}

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
    on e:exception do TrRollback;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInventory.AddToWMat(WBILLID:integer):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.AddToWMat') else _udebug := nil;{$ENDIF}

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
    on e:exception do TrRollback;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInventory.checkNum:boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.checkNum') else _udebug := nil;{$ENDIF}

  Result := false;

  with newDataSet do
  try
    ProviderName := 'pWaybillNum_Get';
    FetchParams;
    Params.ParamByName('NUM').AsString := edNum1.Text;
    Open;
    if Fields[0].AsInteger > 0
      then Result := false
      else Result := true;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditInventory.setid') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  lcbChairman.KeyValue := 0;
  lcbChairman.Text := '';

  lcbPerson1.KeyValue := 0;
  lcbPerson1.Text := '';

  lcbPerson2.KeyValue := 0;
  lcbPerson2.Text := '';

  lcbPerson3.KeyValue := 0;
  lcbPerson3.Text := '';

  DSRefresh(cdsWhouse, 'wid', 0);
  lcbWHouseOut.KeyValue := 0;
  lcbWHouseOut.Text := '';

  edDate.Date := OnDate;
  edReason.Text := '';
  edTime.Time := Time;
  SetKurs;
  Fid := Value;

  //*****************************

    with newDataSet do
    try
      chbPosting.Checked := InvChecked;

      if (Value = 0) and InvAutoNum then begin
        FCurrNum := GetDocNum(dmData.SConnection, dtInv, 1);
        edNum1.Text := InvPrefix + IntToStr(FCurrNum) + InvSuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin
        Self.Caption := rs(ParentNameEx, 'TitleEdit');
        ProviderName := 'pWaybill_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        if not IsEmpty then begin
          edNum1.Text := fieldbyname('num').AsString;
          edDate.Date := Int(fieldbyname('ondate').AsDateTime);
          edTime.Time := Frac(fieldbyname('ondate').AsDateTime);
          edReason.Text := fieldbyname('REASON').asstring;
          chbPosting.Checked := fieldbyname('CHECKED').AsInteger = 1;
        end;
        Close;

        //чтени комиссии
        ProviderName := 'pWOCom_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        if not IsEmpty then begin
          if Locate('num', 0, []) then lcbChairman.KeyValue := fieldbyname('kaid').AsInteger;
          if Locate('num', 1, []) then lcbPerson1.KeyValue := fieldbyname('kaid').AsInteger;
          if Locate('num', 2, []) then lcbPerson2.KeyValue := fieldbyname('kaid').AsInteger;
          if Locate('num', 3, []) then lcbPerson3.KeyValue := fieldbyname('kaid').AsInteger;
        end;
        Close;

        //чтение складов из waybillmove
        ProviderName := 'pWayBillMove_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        if not IsEmpty then lcbWHouseOut.KeyValue := fieldbyname('sourcewid').AsInteger;
        Close;
      end//if Value<>0
      else Self.Caption := rs(ParentNameEx,'TitleAdd');

      if Value > 0 then begin
        ProviderName := 'pWaybillDet_GetInv';// чтение позиций в mdDet
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := FID;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);
        if not mdDet.IsEmpty then begin
          mdDet.First;
          lcbWHouseOut.KeyValue := mdDet.fieldbyname('wid').AsInteger;
        end;

        if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

        Close;
      end
      else begin
        mdDet.Open;
      end;

      GetSummAll;

      FModified := false;
      FPosModified := false;
      FGridRefresh := true;

    finally
      Free;
    end;

    FCanCheck := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM:TBookmark;
    tmpPosId:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if True then begin
      with newDataSet do begin
        try
          TrStart;

          try
            Screen.Cursor := crSQLWait;
            NewRecord := (ID = 0);

            if NewRecord
               then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

            if NewRecord
              then ProviderName := 'pWaybill_Ins'
              else ProviderName := 'pWaybill_Upd';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;
            Params.ParamByName('DEFNUM').AsInteger := 0;
            Params.ParamByName('ONDATE').AsDateTime := Int(edDate.Date) + Frac(edTime.Time);
            Params.ParamByName('KAID').DataType := ftInteger;
            Params.ParamByName('KAID').Clear;
            Params.ParamByName('CURRID').DataType := ftInteger;
            Params.ParamByName('CURRID').Clear;
            Params.ParamByName('ATTNUM').DataType := ftString;
            Params.ParamByName('ATTNUM').Clear;
            Params.ParamByName('ATTDATE').DataType := ftDateTime;
            Params.ParamByName('ATTDATE').Clear;

            if Trim(edReason.Text) = '' then begin
              Params.ParamByName('REASON').DataType := ftString;
              Params.ParamByName('REASON').Clear;
            end
            else Params.ParamByName('REASON').AsString := edReason.Text;

            Params.ParamByName('PERSONID').DataType := ftInteger;
            Params.ParamByName('PERSONID').Clear;
            Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
            Params.ParamByName('WTYPE').AsInteger := 7;
            Params.ParamByName('DELETED').AsInteger := 0;
            Params.ParamByName('SUMMALL').AsFloat := 0;//RoundToA(ALLSUMM,-2);
            Params.ParamByName('NDS').DataType := ftFloat;
            Params.ParamByName('NDS').Clear;
            Params.ParamByName('RECEIVED').DataType := ftString;
            Params.ParamByName('RECEIVED').Clear;
            Params.ParamByName('TODATE').DataType := ftDateTime;
            Params.ParamByName('TODATE').Clear;

            Execute;//Записали в waybilllist

            ProviderName := 'pWayBillMove_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;

            Execute; //Удалили из WAYBILLMOVE

            ProviderName := 'pWayBillMove_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('sourcewid').AsInteger := lcbWHouseOut.KeyValue;
            Params.ParamByName('destwid').DataType := ftInteger;
            Params.ParamByName('destwid').Clear;
            Params.ParamByName('personid').DataType := ftInteger;
            Params.ParamByName('personid').Clear;

            Execute;// Записали в WAYBILLMOVE

            ProviderName := 'pWOCom_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;

            Execute; //Удалили из comission

            ProviderName := 'pWOCom_Ins';
            FetchParams;
            //Запись председателя
            if lcbChairman.Text <> '' then begin
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbChairman.KeyValue;
              Params.ParamByName('NUM').AsInteger := 0;
              Execute;// Записали в WAYBILLMOVE
            end;

            //Запись 1-го
            if lcbPerson1.Text <> '' then begin
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson1.KeyValue;
              Params.ParamByName('NUM').AsInteger := 1;
              Execute;// Записали в WAYBILLMOVE
            end;

            //Запись 2-го
            if lcbPerson2.Text <> '' then begin
              ProviderName := 'pWOCom_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson2.KeyValue;
              Params.ParamByName('NUM').AsInteger := 2;
              Execute;// Записали в WAYBILLMOVE
            end;

            //Запись 3-го
            if lcbPerson3.Text <> '' then begin
              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('KAID').AsInteger := lcbPerson3.KeyValue;
              Params.ParamByName('NUM').AsInteger := 3;
              Execute;// Записали в WAYBILLMOVE
            end;

            if FPosModified then begin // Запись позиций в накладную
              // 2 Удаляем позиции
              ProviderName := 'pWaybillDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := FID;

              Execute;

              // 3 Запись позиций из mdDet в waybilldet
              BM := mdDet.GetBookmark;
              mdDet.DisableControls;
              mdDet.First;
              ProviderName := 'pWaybillDet_InvIns';
              FetchParams;
              while not mdDet.Eof do begin
                Params.ParamByName('POSID').AsInteger := GetMaxID(dmData.SConnection,'waybilldet', 'posid');
                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := lcbWHouseOut.KeyValue;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(mdDet.fieldbyname('AMOUNT').AsFloat, MatDisplayDigits);
                Params.ParamByName('PRICE').AsFloat := mdDet.fieldbyname('PRICE').AsFloat;
                Params.ParamByName('DISCOUNT').AsFloat := RoundToA(mdDet.fieldbyname('DISCOUNT').AsFloat, -3);
                Params.ParamByName('NDS').AsFloat := mdDet.fieldbyname('nds').AsFloat;
                Params.ParamByName('CurrId').AsInteger := BaseCurrID;
                Params.ParamByName('OnDate').AsDateTime := Int(edDate.Date) + Frac(edTime.Time);
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
                Params.ParamByName('Num').AsInteger := mdDet.RecNo;
                Params.ParamByName('checked').AsInteger := mdDet.FieldByName('checked').AsInteger;
                Execute;//Записываем очередную позицию
                mdDet.Next;
              end;//while not mdDet.Eof

              mdDet.GotoBookmark(BM);
              FreeBookmark(BM);
              mdDet.EnableControls;
              FPosModified := False;
            end; //if FPosModified

            FModified := False;//флаг изменения документа false

            TrCommit;

            if (ModalResult = mrYes) then//Если применить
              if NewRecord then begin
                mdDet.Close;
                ID := 0;
              end
              else begin
                if chbPosting.Checked then CanClose := True;
              end//else NewRecord
            else CanClose := True;

            SendMessage(MainHandle, WM_REFRESH, ID, 0);

            if Logging then RefreshLog;

            {if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;
            }

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
      end;// with TClientDataSet.Create(nil)
    end;//if CheckDatesIn then begin
  end
  else begin
    if GetDocNum(dmData.SConnection, dtInv, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtInv, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditInventory.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aAddWHouseOut.Enabled := mdDet.IsEmpty;

  aOk.Enabled := (trim(edNum1.Text)<>'') and (edDate.Text<>'') and(lcbWHouseOut.Text<>'')and (not FPosError);

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified);

  aCIns.Enabled := (lcbWHouseOut.Text<>'');
  aCDel.Enabled := (not mdDet.IsEmpty);
  aCUpd.Enabled := aCDel.Enabled and (dbgWaybillDet.SelectedCount = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.SetCaptions') else _udebug := nil;{$ENDIF}

   inherited;

   with LangMan do begin
     aSelectAll.Caption := GetRS('Common', 'SelectAll');
     aGetRestsFromWH.Caption := GetRS(ParentNameEx, 'GetRestsFromWH');

     edFind.InitRes;

     lRealSum.Caption := GetRS(ParentNameEx, 'RealSum') + ' (' + BaseCurrName + '):';
     lSum.Caption := GetRS(ParentNameEx, 'Sum') + ' (' + BaseCurrName + '):';
     lSummDiff.Caption := GetRS(ParentNameEx, 'DiffSum') + ':';

     btnPrint.Hint := GetRS('fmWaybill', 'PrintWB');
     aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
     btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');

     aOK.Caption := GetRS('Common', 'OK');
     aCancel.Caption := GetRS('Common', 'Cancel');
     aApply.Caption := GetRS('Common', 'Apply');

     aCIns.Caption := GetRS('Common', 'Add');
     aCIns.Hint := GetRS('fmWaybill', 'NewPos');
     aCUpd.Caption := GetRS('Common', 'Properties');
     aCUpd.Hint := GetRS('fmWaybill','EditPos');
     aCDel.Caption := GetRS('Common', 'Del');
     aCDel.Hint := GetRS('fmWaybill','PosDel');

     aShowRealPrice.Caption := GetRS('fmWaybill','ShowRealPrice');
     aSetTime.Hint := GetRS('fmWaybill','EditTime');
     aPersonsOut.Hint := GetRS('fmWaybill','aPersons');
     btnWHouseOut.Hint := GetRS('fmWaybill','WHouseRef');

     lNum.Caption := GetRS('fmWaybill','Num') + ':';
     lOndate.Caption := GetRS('fmWaybill','OnDate') + ':';
     lWhouseOut.Caption := GetRS('fmWaybill','WHouse') + ':';

     lChairman.Caption := GetRS('fmWriteOff', 'Chairman') + ':';
     lPerson1.Caption := GetRS('fmWriteOff','Person1') + ':';
     lPerson2.Caption := GetRS('fmWriteOff','Person2') + ':';
     lPerson3.Caption := GetRS('fmWriteOff','Person3') + ':';

     lReason.Caption := GetRS('fmWaybill','Reason') + ':';

     chbPosting.Properties.Caption := GetRS('fmWaybill','Posting');

     colRecNo.Caption := GetRS('fmWaybill','NumEx');
     colMatName.Caption := GetRS('fmWaybill','MatName');
     colMeasureName.Caption := GetRS('fmWaybill','Measure');
     colBarCode.Caption := GetRS('fmMaterials', 'BarCode');
     colDiff.Caption := GetRS(ParentNameEx, 'Diff');
     colRealAmount.Caption := GetRS(ParentNameEx, 'RealAmount');
     colAmount.Caption := GetRS(ParentNameEx, 'Amount');
     colWHouseName.Caption := GetRS('fmWaybill','WHouse');
     colSummCurr.SummaryFooterFormat := GetRS('fmWaybill','Summ')+': '+'0.00';
     colSummDef.SummaryFooterFormat := GetRS('fmWaybill','Summ')+': '+'0.00';
     colPriceTXT.Caption := GetRS('fmWaybill','Price');
     colRealPrice.Caption := GetRS(ParentNameEx, 'RealPrice');
     colPrice.Caption := GetRS(ParentNameEx, 'CalcPrice') + ' (' + GetRS(ParentNameEx, 'AvgPrice') + ')';
     colDiffSum.Caption := GetRS(ParentNameEx, 'DiffSum');
     colGrpName.Caption := GetRS('fmMaterials', 'MatGroup');
     colArtikul.Caption := GetRS('fmWaybill', 'Artikul');
     colFlag.Caption := '';

     aColParams.Caption := GetRS('Common', 'ColOptions') + '...';

     aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
     aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
     aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
     aMCList.Caption := GetRS('fmWMat', 'ShowMCList');

     gbComm.Caption := ' ' + GetRS(ParentNameEx, 'CommissionEx') + ' ';
     gbHeader.Caption := ' ' + GetRS(ParentNameEx, 'MainInfo') + ' ';
     gbPos.Caption := ' ' + GetRS(ParentNameEx, 'Positions') + ' ';
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aCInsExecute') else _udebug := nil;{$ENDIF}

 Screen.Cursor := crSQLWait;

 with TfrmEditInvPos.Create(nil) do
 try
   ParentHandle := Self.Handle;
   Tag := Integer(mdDet);
   OnDate := Self.OnDate;
   txtWHouse.Caption := lcbWHouseOut.EditingText;
   txtWHouse.Tag := lcbWHouseOut.KeyValue;
   Caption := rs('fmWaybill', 'PosAdd');
   ID := 0;
   ShowModal;

 finally
   Free;
   Screen.Cursor := crDefault;

   if not mdDet.IsEmpty then dbgWaybillDet.SetFocus;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aCDelExecute(Sender: TObject);
  var
    FItem: TListItem;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
     or
     ((dbgWaybillDet.SelectedCount > 1) and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;

  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
     //Удаление из mdWMatTurn
     if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
       then mdDet.Delete;
    end;

    if dbgWaybillDet.SelectedCount = 1 then begin
      if dbgWaybillDet.FocusedNode.AbsoluteIndex < dbgWaybillDet.Count - 1
        then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetNext.Values[colPosId.Index], [])
      else if dbgWaybillDet.FocusedNode.AbsoluteIndex > 0
        then mdDet.Locate('posid', dbgWaybillDet.FocusedNode.GetPrev.Values[colPosId.Index], [])
    end
    else begin
      mdDet.First;
    end;

  finally
    dbgWaybillDet.ClearSelection;

    if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

    mdDet.EnableControls;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.edNum1PropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.cxDateEdit1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.cxDateEdit1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  SetKurs;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.chbPostingPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.SetKurs;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.SetKurs') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditInventory.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

    if ASelected then
      if (AColumn.Index <> dbgWaybillDet.FocusedColumn) or not AFocused then AColor := $00BEBEBE;

    if ASelected and AFocused and AColumn.DisableEditor then AColor := dbgWaybillDet.HighlightColor;

    if not ASelected or not AFocused then begin
      if (ANode.Values[colDiff.Index] < 0)
        then AFont.Color := clRed
        else if (ANode.Values[colDiff.Index] > 0)
          then AFont.Color := clBlue
          else AFont.Color := clWindowText;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.mdMatsAfterPost(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.mdMatsAfterDelete(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.mdMatsAfterEdit(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormShow') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crDefault;
  FormResize(Self);
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.SetDefCurrCtrls;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.SetDefCurrCtrls') else _udebug := nil;{$ENDIF}

  colSummDef.Caption := rs_SummIn+' '+defCurrName;
  colSummCurr.Caption := rs_SummIn+' '+cbCurr.EditText;
  if defCurrID<>cbCurr.KeyValue then colSummDef.Visible := true
   else colSummDef.Visible := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.edTimePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.edTimePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aCUpdExecute') else _udebug := nil;{$ENDIF}

 Screen.Cursor := crSQLWait;

 with TfrmEditInvPos.Create(nil) do
 try
   dbgWaybillDet.SetFocus;
   Application.ProcessMessages;
   ParentHandle := Self.Handle;
   Tag := Integer(mdDet);
   OnDate := Int(edDate.Date) + Frac(edTime.Time);
   Caption := rs('fmWaybill','PosEdit');
   txtWHouse.Tag := lcbWHouseOut.KeyValue;
   txtWHouse.Caption := lcbWHouseOut.Text;
   edMat.MatID := mdDet.fieldbyname('matid').AsInteger;
   edAmount.Value := mdDet.FieldByName('discount').AsFloat;
   ID := mdDet.FieldByName('matid').AsInteger;
   edRealPrice.Value := mdDet.FieldByName('nds').AsFloat;
   ShowModal;

 finally
   Free;
   Screen.Cursor := crDefault;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormClose') else _udebug := nil;{$ENDIF}

   mdDet.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.cdsDetailCalcFields(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//Нумерация позиций
//==============================================================================================
function TfrmEditInventory.NumMats1: boolean;
  (*
  var
    BM:TBookmark;
    i:integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  Result := True;

  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.NumMats1') else _udebug := nil;{$ENDIF}

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
          if CurKurs>0 then FieldByName('summdef').AsFloat := FieldByName('summ').AsFloat * CurKurs
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
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.edDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.edDateKeyPress') else _udebug := nil;{$ENDIF}

  if key = #32 then edDate.DroppedDown := true;
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;
  edDate.Date := Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colPriceGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(',0.######', StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    GetSummAll;
    dbgWaybillDet.Repaint;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colPriceNoNdsGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colPriceNoNdsGetText') else _udebug := nil;{$ENDIF}

  try
    AText := floattostr(ANode.Values[colPrice.index]-roundtoa(NDSOut(ANode.Values[colPrice.index],CurrentNDS),-2));

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked
      then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext))+' '+ANode.Values[colCurrName.Index]
      else AText := atext+' '+ANode.Values[colCurrName.Index];

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colRecNoGetText') else _udebug := nil;{$ENDIF}

  try
    AText := IntToStr(ANode.Index + 1);

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormResize') else _udebug := nil;{$ENDIF}

  inherited;

  AStyle := GetWindowLong(dbgWaybillDet.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colMatName.Width := dbgWaybillDet.Width - Offset;

  for i := 0 to dbgWaybillDet.ColumnCount - 1 do
    if (dbgWaybillDet.Columns[i] <> colMatName) and dbgWaybillDet.Columns[i].Visible
      then colMatName.Width := colMatName.Width - dbgWaybillDet.Columns[i].Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  btnDel.ImageIndex := 2;
  btnNew.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  FPosError := false;
  cdsChairman.Open;
  cdsPerson1.Open;
  cdsPerson2.Open;
  cdsPerson3.Open;

  btnWHouseOut.ImageIndex := 26;
  edFind.SetLng;

  dbgWaybillDet.LoadFromRegistry(MainRegKey + '\' + Self.Name);
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\PosFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aPersonsOutExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aPersonsOutExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = lcbChairman then begin
    try aid := lcbChairman.KeyValue; except aid := 0; end;

    lcbChairman.Tag := 1;
    lcbChairman.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbChairman.Tag := 0;
  end
  else if FCurrCtrl = lcbPerson1 then begin
    try aid := lcbPerson1.KeyValue; except aid := 0; end;

    lcbPerson1.Tag := 1;
    lcbPerson1.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPerson1.Tag := 0;
  end
  else if FCurrCtrl = lcbPerson2 then begin
    try aid := lcbPerson2.KeyValue; except aid := 0; end;

    lcbPerson2.Tag := 1;
    lcbPerson2.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPerson2.Tag := 0;
  end
  else if FCurrCtrl = lcbPerson3 then begin
    try aid := lcbPerson3.KeyValue; except aid := 0; end;

    lcbPerson3.Tag := 1;
    lcbPerson3.SetFocus;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPerson3.Tag := 0;
  end
  else if FCurrCtrl = lcbWHouseOut then begin
    try aid := lcbWHouseOut.KeyValue; except aid := 0; end;

    lcbWHouseOut.Tag := 1;
    lcbWHouseOut.SetFocus;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
    lcbWHouseOut.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtPersons: DSRefresh(cdsPerson1, 'kaid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.edReasonPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.edReasonPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.edNum1KeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.edNum1KeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aPersonsInExecute(Sender: TObject);
  (*var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aPersonsInExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbPersonNameIn.KeyValue; except aid := 0; end;
  lcbPersonNameIn.Tag := 1;
  lcbPersonNameIn.SetFocus;
  ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
  lcbPersonNameIn.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.lcbPersonNameOutPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbPersonNameOutPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbPersonNameInPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbPersonNameInPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aAddWHouseInExecute(Sender: TObject);
  (*var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aAddWHouseInExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbWHouseIn.KeyValue; except aid := 0; end;
  lcbWHouseIn.Tag := 1;
  lcbWHouseIn.SetFocus;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  lcbWHouseIn.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.lcbWHouseOutKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbWHouseOutKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbWHouseInKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbWHouseInKeyPress') else _udebug := nil;{$ENDIF}

  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbWHouseOutPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbWHouseOutPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbWHouseInPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbWHouseInPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dsDetDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dsDetDataChange') else _udebug := nil;{$ENDIF}

  if mdDet.FieldByName('checked').AsInteger = 1
    then aCheck.Caption := rs('Common', 'Unmark')
    else aCheck.Caption := rs('Common', 'Mark');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbChairmanEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbChairmanEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbChairmanExit(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbChairmanExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnChairmanMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnChairmanMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbChairman;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnChairmanMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnChairmanMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnPerson1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnPerson1MouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPerson1;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnPerson2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnPerson2MouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPerson2;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnWHouseInMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnWHouseInMouseDown') else _udebug := nil;{$ENDIF}
  //FCurrCtrl := lcbWHouseIn;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnWHouseOutMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnWHouseOutMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbWHouseOut;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.FormDestroy') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SaveToRegistry(MainRegKey + '\' + Self.Name);
  edFind.SaveToRegistry(MainRegKey + '\' + Self.Name + '\PosFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

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
procedure TfrmEditInventory.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  SmartShowRep(frDoc, 'Inv.frf');

  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FTmp: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text else
  if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text;// + ' ' + edTime.Text;
  if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName else
  if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text else
  if 0 = AnsiCompareText(ParName, 'chairman') then ParValue := lcbChairman.EditingText else
  if 0 = AnsiCompareText(ParName, 'person1') then ParValue := lcbPerson1.EditingText else
  if 0 = AnsiCompareText(ParName, 'person2') then ParValue := lcbPerson2.EditingText else
  if 0 = AnsiCompareText(ParName, 'person3') then ParValue := lcbPerson3.EditingText else
  if 0 = AnsiCompareText(ParName, 'whname') then ParValue := lcbWHouseOut.Text else
  if 0 = AnsiCompareText(ParName, 'propis') then ParValue := SummText else
  if 0 = AnsiCompareText(ParName, 'realsum') then begin
    ParValue := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'calcsum') then begin
    ParValue := RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'diffsum') then begin
    ParValue := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
                - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);
  end
  else if 0 = AnsiCompareText(ParName, 'diffsum1') then begin
    FTmp := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
            - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);

    if FTmp < 0
      then ParValue := FTmp
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'diff')
    then ParValue := mdReport.FieldByName('discount').AsFloat - mdReport.FieldByName('amount').AsFloat
  else if 0 = AnsiCompareText(ParName, 'diffsum2') then begin
    FTmp := RoundToA(mdReport.FieldByName('discount').AsFloat * mdReport.FieldByName('nds').AsFloat, -2)
            - RoundToA(mdReport.FieldByName('amount').AsFloat * mdReport.FieldByName('price').AsFloat, -2);

    if FTmp > 0
      then ParValue := FTmp
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'color1') then ParValue := okRepColor1
  else if 0 = AnsiCompareText(ParName, 'color2') then ParValue := okRepColor2
  else if 0 = AnsiCompareText(ParName, 'BaseCurrName') then ParValue := BaseCurrShortName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbWHouseOutPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbWHouseOutPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if FCanCheck then begin
    if lcbWHouseOut.KeyValue > 0 then aGetRestsFromWH.Execute;

    (Sender as TssDBLookupCombo).SelStart := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnPerson3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnPerson3MouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPerson3;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.btnPerson3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.btnPerson3MouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aGetRestsFromWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aGetRestsFromWHExecute') else _udebug := nil;{$ENDIF}

  if lcbWHouseOut.KeyValue <= 0 then begin
    ssMessageDlg(rs(ParentNameEx, 'NoWHSelected'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if ssMessageDlg(rs(ParentNameEx, 'GetRestsConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  GetRestsFromWH;

  with dbgWaybillDet do begin

    if Count > 0 then begin
      ClearSelection;
      mdDet.First;
      FocusedField := mdDet.FieldByName('discount');
      Items[0].Selected := True;
    end;
  end;

  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.GetRestsFromWH;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.GetRestsFromWH') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    mdDet.DisableControls;
    mdDet.Close;
    mdDet.Open;

    fProgress.Caption := rs('Common', 'Processing') + '...';
    fProgress.Show;

    ProviderName := 'pWMat_ListNew';
    FetchParams;

    Params.ParamByName('wid').AsInteger := lcbWHouseOut.KeyValue;
    Params.ParamByName('kaid').AsInteger := 0;
    Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edDate.Date);
    Params.ParamByName('grpid').AsInteger := 0;
    Params.ParamByName('getempty').AsInteger := 0;
    Params.ParamByName('wh').AsString := AllowedWH;
    Open;

    fProgress.pbMain.Max := RecordCount;
    i := 1;

    while not Eof do begin
      fProgress.lText.Caption := FieldByName('matname').AsString;
      Application.ProcessMessages;
      mdDet.Append;
      mdDet.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
      mdDet.FieldByName('matname').AsString := FieldByName('matname').AsString;
      mdDet.FieldByName('grpname').AsString := FieldByName('grpname').AsString;
      mdDet.FieldByName('artikul').AsString := FieldByName('artikul').AsString;
      mdDet.FieldByName('barcode').AsString := FieldByName('barcode').AsString;
      mdDet.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
      mdDet.FieldByName('amount').AsFloat := StrToFloat(DelChars(FormatFloat(MatDisplayFormat, RoundToA(FieldByName('remain').AsFloat, MatDisplayDigits)), [ThousandSeparator]));
      mdDet.FieldByName('discount').AsFloat := mdDet.FieldByName('amount').AsFloat;
      mdDet.FieldByName('price').AsFloat := FieldByName('avgprice').AsFloat;
      mdDet.FieldByName('nds').AsFloat := FieldByName('avgprice').AsFloat;
      mdDet.FieldByName('posid').AsInteger := i;
      mdDet.Post;

      Inc(i);
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;

      Next;
    end;
    Close;

  finally
    fProgress.Hide;
    mdDet.EnableControls;
    mdDet.First;
    AdjustGrid(dbgWaybillDet, GetFirstVisibleCol);
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colDiffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FRealAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colDiffGetText') else _udebug := nil;{$ENDIF}

  if VarIsNull(ANode.Values[colRealAmount.Index])
    then FRealAmount := 0
    else FRealAmount := ANode.Values[colRealAmount.Index];

  AText := FormatFloat(MatDisplayFormat, FRealAmount - ANode.Values[colAmount.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetEditing(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetEditing') else _udebug := nil;{$ENDIF}

  Allow := dbgWaybillDet.FocusedColumn <> colRealAmount.Index;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetEdited(Sender: TObject; Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetEdited') else _udebug := nil;{$ENDIF}

  FPosModified := True;
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Int(edDate.Date) + Frac(edTime.Time);
      WID := 0;
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmMatRsv.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Int(edDate.Date) + Frac(edTime.Time);
      WID := 0;
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aMCListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aMCListExecute') else _udebug := nil;{$ENDIF}

  if dbgWaybillDet.SelectedCount <> 1 then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmMCList.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Int(edDate.Date) + Frac(edTime.Time);
      ID := dbgWaybillDet.FocusedNode.Values[colMatID.Index];
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbPerson3KeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbPerson3KeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    dbgWaybillDet.SetFocus;
    dbgWaybillDet.ShowEditor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colDiffSumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FRealPrice, FPrice, FAmount, FRealAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colDiffSumGetText') else _udebug := nil;{$ENDIF}

  try FRealPrice := ANode.Values[colRealPrice.Index];   except FRealPrice := 0; end;
  try FPrice := ANode.Values[colPrice.Index];           except FPrice := 0; end;
  try FAmount := ANode.Values[colAmount.Index];         except FAmount := 0; end;
  try FRealAmount := ANode.Values[colRealAmount.Index]; except FRealAmount := 0; end;

  if FPrice = 0 then FPrice := FRealPrice;
  if FRealPrice = 0 then FRealPrice := FPrice;
  
  AText := FormatFloat(MoneyDisplayFormat,RoundToA(FRealAmount * FRealPrice, -2) - RoundToA(FAmount * FPrice, -2));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.lcbChairmanPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.lcbChairmanPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  with Sender as TcxComboBox do begin
    SelStart := 0;
    SelLength := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aColParamsExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocInv');
  ImgList := dmData.Images;
  AIndex := II_INVENTORY;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(dbgWaybillDet, GetFirstVisibleCol);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditInventory.GetFirstVisibleCol: TdxDBTreeListColumn;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.GetFirstVisibleCol') else _udebug := nil;{$ENDIF}

  Result := nil;

  for i := 0 to dbgWaybillDet.VisibleColumnCount - 1 do
    if dbgWaybillDet.VisibleColumns[i] <> colRecNo then begin
      Result := dbgWaybillDet.VisibleColumns[i];
      Break;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetChangedColumnsWidth(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetChangedColumnsWidth') else _udebug := nil;{$ENDIF}

  dbgWaybillDetNeedAdjust(dbgWaybillDet);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colFlagGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colFlagGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aCheckExecute(Sender: TObject);
  var
    i: Integer;
    BM: TBookmark;
    FVal: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aCheckExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  BM := mdDet.GetBookmark;
  mdDet.DisableControls;

  try
    FVal := 1 - mdDet.FieldByName('checked').AsInteger;

    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('matid', dbgWaybillDet.SelectedNodes[i].Values[colMatID.Index], []) then begin
        mdDet.Edit;
        mdDet.FieldByName('checked').AsInteger := FVal;
        mdDet.Post;
      end;
    end;

  finally
    mdDet.GotoBookmark(BM);
    mdDet.FreeBookmark(BM);
    mdDet.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.colRealAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.colRealAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditInventory.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditInventory.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    dbgWaybillDet.CloseEditor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditInventory', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
