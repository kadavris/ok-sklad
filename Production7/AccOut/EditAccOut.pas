{$I ok_sklad.inc}
unit EditAccOut; // invoice/client order

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ActnList, Menus, Buttons, DBClient, DB, ComCtrls, Grids, DBGrids, DBCtrls, ImgList, 

  ssBaseTypes, ssFormStorage, ssMemDS, ssImagePanel, ssClientDataSet, ssGroupBox, ssDBComboBox, ssBaseConst, ssBevel,
  ssSpeedButton, ssPanel, ssGradientPanel, ssCalcEdit, ssDBLookupCombo, ssLabel, 
  ssDBGrid, ssBaseWBDocDlg, ssBaseWBDocDlgWithPayment, ssPageControl, 

  cxMemo, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg, cxPC,
  cxListView,  cxDBEdit, cxGraphics, cxTreeView, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, 
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit, cxButtonEdit, 
  cxCalendar, cxSpinEdit, cxCalc, cxTimeEdit, 

  dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, dxExEdtr6, dxEditor6, dxDBTLCl6, dxGrClms6, dxmdaset,

  xButton, TB2Item, xCtrls, FR_DSet, FR_DBSet, FR_Class, FR_Desgn, prTypes,
  okSearchEdit, okClasses, xLngDefs;

type
  TfrmEditAccOut = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddMatList: TAction;
    aAddSvc: TAction;
    aAddSvcList: TAction;
    aCDel: TAction;
    aChangeEnt: TAction;
    aChangeEntAcc: TAction;
    aChangeEntAccBW: TAction;
    aChangeEntBW: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aOrdersInfo: TAction;
    aRemoveRsv: TAction;
    aRemoveRsvAll: TAction;
    aSelectAll: TAction;
    aSetDiscount: TAction;
    aSetKurs: TAction;
    aSetRsv: TAction;
    aSetRsvAll: TAction;
    aSetTime: TAction;
    aShowSN: TAction;
    btnDel: TssSpeedButton;
    btnOrdersInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    btnPosAdd: TssSpeedButton;
    btnProps: TssSpeedButton;
    cdsFind: TssClientDataSet;
    cdsRsv_Temp: TssClientDataSet;
    chbToDate: TcxCheckBox;
    DataSource1: TDataSource;
    DateTimeField1: TDateTimeField;
    dsmdTmpIds: TDataSource;
    dsmdWMatTurn: TDataSource;
    dsmdWMatTurnOld: TDataSource;
    dsPayType: TDataSource;
    edContr: TokContractSearchEdit;
    edFind: TokGridSearchEdit;
    edKAgent: TokKASearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    edToDate: TcxDateEdit;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    frDBDataSet1: TfrDBDataSet;
    frDoc: TfrReport;
    FsrcTaxes: TfrDBDataSet;
    imnuAdd: TTBSubmenuItem;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    kaEnt: TokKAgent;
    lcbPersonName: TssDBLookupCombo;
    lEntEx: TxLabelEx;
    lNotes: TLabel;
    lNum: TLabel;
    lPersonname: TLabel;
    lReason: TLabel;
    lTitle: TLabel;
    mdDetbySN: TIntegerField;
    mdDetstatus: TIntegerField;
    mdDettaxsum: TFloatField;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncertdate: TDateTimeField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocdate: TDateTimeField;
    mdPositiondocnum: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionpostype: TIntegerField;
    mdPositionprice: TCurrencyField;
    mdPositionproducer: TStringField;
    mdPositionSN: TStringField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdReport: TdxMemData;
    mdRsv: TssMemoryData;
    mdRsvcurrname: TStringField;
    mdRsvpricein: TFloatField;
    mdRsvSN: TStringField;
    mdTaxes: TdxMemData;
    mdTaxesname: TStringField;
    mdTaxesonvalue: TFloatField;
    mdTaxestaxid: TIntegerField;
    mdTaxestaxsumm: TFloatField;
    mdTmpIds: TdxMemData;
    mdTmpIdsamount: TFloatField;
    mdTmpIdsforall: TIntegerField;
    mdTmpIdsfree: TIntegerField;
    mdTmpIdsposid: TIntegerField;
    mdTmpIdsSourceID: TIntegerField;
    mdTmpIdsTmpId: TIntegerField;
    mdWMatTurn: TdxMemData;
    mdWMatTurnamount: TFloatField;
    mdWMatTurnflag: TIntegerField;
    mdWMatTurnmatid: TIntegerField;
    mdWMatTurnOld: TdxMemData;
    mdWMatTurnondate: TDateTimeField;
    mdWMatTurnposid: TIntegerField;
    mdWMatTurnSN: TStringField;
    mdWMatTurnsourceid: TIntegerField;
    mdWMatTurnturntype: TIntegerField;
    mdWMatTurnwid: TIntegerField;
    panPosBar: TPanel;
    pmMain: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    srcEnt: TDataSource;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;

    function CheckDatesIn:Boolean;
    procedure aActivateFindExecute(Sender: TObject);
    procedure aAddKAExecute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aAddSvcExecute(Sender: TObject);
    procedure aAddSvcListExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aChangeEntAccExecute(Sender: TObject);
    procedure aChangeEntExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aRemoveRsvAllExecute(Sender: TObject);
    procedure aRemoveRsvExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetDiscountExecute(Sender: TObject);
    procedure aSetRsvAllExecute(Sender: TObject);
    procedure aSetRsvExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure aShowSNExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPayMPersonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure cbPayTypePropertiesChange(Sender: TObject);
    procedure cdsEntAccBeforeOpen(DataSet: TDataSet);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure chbToDatePropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNormGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;  ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
    procedure edContrChange(Sender: TObject);
    procedure edKAgentChange(Sender: TObject);
    procedure edKAgentEnter(Sender: TObject);
    procedure edKAgentExit(Sender: TObject);
    procedure edNum1PropertiesChange(Sender: TObject);
    procedure edPaySummPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frDocBeginDoc;
    procedure frDocEndDoc;
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure kaEntAccountChange(Sender: TObject);
    procedure lcbPayMPersonPropertiesChange(Sender: TObject);
    procedure lcbPersonNameEnter(Sender: TObject);
    procedure lcbPersonNameExit(Sender: TObject);
    procedure lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
    procedure lcbPersonNamePropertiesChange(Sender: TObject);
    procedure lEntExGetHintText(Sender: TObject; Index: Integer; var AText: String);
    procedure lEntExItemClick(Sender: TObject; Index: Integer);
    procedure mdDetAfterDelete(DataSet: TDataSet);
    procedure mdDetAfterPost(DataSet: TDataSet);
    procedure mdMatsAfterDelete(DataSet: TDataSet);
    procedure mdMatsAfterEdit(DataSet: TDataSet);
    procedure mdMatsAfterPost(DataSet: TDataSet);
    procedure mdWMatTurnAfterDelete(DataSet: TDataSet);
    procedure mdWMatTurnBeforeDelete(DataSet: TDataSet);
    procedure srcEntDataChange(Sender: TObject; Field: TField);

  private
    procedure ChangeMatsCur;
    procedure CheckSvc;
    procedure colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DelPos;
    function  KAName(kaid:integer):string;
    procedure SetSvcPresent(const Value: Boolean);
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    AllSummDef : Extended;
    DocInfo: TokAddDocInfo;
    FAttDate: TDate;
    FAttNum: string;
    FContrDocID: Integer;
    FCurrNum, FCurrPayNum: Integer;
    FDelPosID: Integer;
    FKAID: Integer;
    FKAModified: Boolean;
    FLastGen: string;
    FOrdID: Integer;
    FPaySummChange:boolean;
    FRateDate: TDateTime;
    FRateID: integer;
    FSummAll: Extended;
    FSummNDS: Extended;
    FSvcPresent: Boolean;
    KAAddr: string;
    KAFullName: string;
    KAPhone: string;
    LockFind: Boolean;
    NoRsvConfirm: Boolean;
    NotRsvPresent: Boolean;
    oldkaid: integer;
    OldPayDocId: integer;
    PayDocChecked: boolean;
    PayDocDate: TDateTime;
    PayDocId: integer;
    SummTaxAll: Extended;
    WHMode: Boolean;


    function  CheckModified: Boolean; override;
    function  DoRemoveRsv(APosID: Integer): Boolean;
    function  DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended): Boolean;
    procedure FillMatsFromWMat(DS: TDataSet);
    procedure GetSummAll; override;
    procedure GetTaxes; virtual;
    procedure SaveAddProps(APosID: Integer); virtual;
    procedure SaveTaxes(APosID: Integer); virtual;
    procedure SetAttDate(const Value: TDate);
    procedure SetAttNum(const Value: string);
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure UpdatePos; override;

    property AttDate: TDate read FAttDate write SetAttDate;
    property AttNum: string read FAttNum write SetAttNum;
    property SvcPresent: Boolean read FSvcPresent write SetSvcPresent;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure AddMats(var IDs: string); virtual;
  end;

var
  frmEditAccOut: TfrmEditAccOut;

//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI,
  StdConvs, EditPositionAcc, CurrencyEdit, EditAtt, ssCallbackConst,
  ssDateUtils, fMessageDlg, ssBaseIntfDlg, EditMaterials, KATurnover,
  ssRegUtils, ssStrUtil, EditPositionSvc, EditServices, Serials,
  SetDiscount, okMoneyFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
function TfrmEditAccOut.CheckDatesIn: boolean;
  var
    eStr, eStr2, m, tmpstr :String;
    i:integer; tmpMaxDate:TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.CheckDatesIn') else _udebug := nil;{$ENDIF}

  try
    m := '';
    eStr := '';
    eStr2 := '';

    if not mdWMatTurn.IsEmpty then begin
      with mdWMatTurn do begin
        First;
        while not Eof do begin
          if m = ''
            then m := m + IntToStr(fieldbyname('posid').AsInteger)
            else m := m + ',' + IntToStr(fieldbyname('posid').AsInteger);
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
          for i := 0 to dbgWaybillDet.Count - 1  do begin
            eStr2 := '';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              if mdWMatTurn.FieldByName('sourceid').AsInteger = dbgWaybillDet.Items[i].Values[colPosid.Index]
                   and Locate('posid',mdWMatTurn.fieldbyname('posid').AsInteger,[])
              then begin
                if eStr2 = ''
                  then eStr2 := Fields[1].AsString
                  else eStr2 := eStr2 + ', ' + Fields[1].AsString;

                if tmpMaxDate < Fields[1].AsDateTime then tmpMaxDate := Fields[1].AsDateTime;
              end;//if

              mdWMatTurn.Next;
            end;
            if eStr2 <> '' then
               eStr := eStr + amountPrefix + inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index]) + ' '
                       + dbgWaybillDet.Items[i].Values[colMatName.Index] + rs('fmWaybill','AccErr1') + eStr2 + #13;
          end;//for

          eStr := Format(rs('fmWaybill', 'AccErr2'),[DateTimeToStr(edDate.Date + edTime.Time),
          #13, eStr, #13, DateTimeToStr(tmpMaxDate)]);

          //eStr := 'Дата документа ('+DateTimeToStr(edDate.Date+edTime.Time)+') конфликтует со следующими позициями:'+#13+
          //eStr+#13+'Поставить в документ дату последнего поступления ('+DateTimeToStr(tmpMaxDate)+') ?';
          if ssMessageDlg(eStr, ssmtWarning, [ssmbYes, ssmbCancel]) = mrYes then begin
            edDate.Date := tmpMaxDate;
            edTime.Time := frac(tmpMaxDate);
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
end;

//==============================================================================================
procedure TfrmEditAccOut.SetAttDate(const Value: TDate);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SetAttDate') else _udebug := nil;{$ENDIF}

  if FAttDate <> Value then begin
    FAttDate := Value;
    FModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.SetAttNum(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SetAttNum') else _udebug := nil;{$ENDIF}

  if FAttNum <> Value then begin
    FAttNum := Value;
    FModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfrmEditAccOut.GetSummAll;
  var
    i, j: Integer;
    BM: TBookmark;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm: Extended;
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef, SummTax, PosSummTax: Extended;
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.GetSummAll') else _udebug := nil;{$ENDIF}
    
  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
          else FNorm := 0;

        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]),
                ssStrToFloat(Items[i].Values[colNDSRate.Index]), 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and (Pos('colTaxRate', Columns[j].Name) = 0) and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;
      except
      end;

      try
        try
          FNDS := ssStrToFloat(Items[i].Values[colNDSRate.Index]);
        except
          FNDS := NDS;
        end;

        {Цены с НДС и без НДС}
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);
        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

        PosSummTax := 0;
        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and (Pos('colTaxRate', Columns[j].Name) = 0) and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        SummDef := SummDef + PosSummTax;
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
        //Сумма в нац. валюте с НДС;
        AllSummDef := AllSummDef + SummDef;

      except
      end;
    end;

    lSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    lSummCurr.Hint := lSummCurr.Caption;
    lSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    lSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
    lSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    lSummDefNDS.Hint := lSummDefNDS.Caption;
    lSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
    lSummDef.Hint := lSummDef.Caption;
    AllSumm := AllSummDef;
  end;
  FGridRefresh := False;

  with dbgWaybillDet do begin
    NotRsvPresent := False;
    for i := 0 to Count - 1 do begin
      try
        if (Items[i].Values[colPType.Index] = 0) then
          if not mdWMatTurn.Locate('sourceid', Items[i].Values[colPosId.Index],[]) then begin
            NotRsvPresent := True;
            Break;
          end;
      except
      end;
    end;
  end;
  CheckSvc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.WMRefresh') else _udebug := nil;{$ENDIF}

  if M.LParam = 9 then begin
    UpdatePos;
    GetSummAll;
    SelectFocusedNode;
    if dbgWaybillDet.FocusedNode.Values[colPType.Index] = 1
      then SvcPresent := True;
  end
  else case TRefType(M.LParam) of
    rtFinances:
      if (M.WParam > 0) and (M.WParam < 1000000) then begin
        lcbPayType.KeyValue := 1;
        lcbCashDesks.KeyValue := M.WParam;
      end
      else begin
        lcbPayType.KeyValue := 2;
        lcbAccount.KeyValue := M.WParam - 1000000;
      end;

    rtWMat, rtServices:
      begin
        FillMatsFromWMat(TDataSet(M.WParam));
      end;

    rtCashDesks:
      begin
        DSRefresh(cdsCashDesks, 'cashid', M.WParam);
        lcbCashDesks.KeyValue := M.WParam;
        lcbCashDesks.SelStart := 0;
      end;//rtKAgent: begin

{rtSetKurs:
       begin
         SetKurs;
         FGridRefresh := true;
         ActionList.UpdateAction(nil);
       end;//rtSetKurs: begin}

    rtPersons:
      if lcbPayMPerson.Tag = 1 then begin
        DSRefresh(cdsPayMPersons, 'kaid', M.WParam);
        lcbPayMPerson.KeyValue := M.WParam;
        lcbPayMPerson.SelStart := 0;
      end
      else if lcbPersonName.Tag = 1 then begin
        DSRefresh(cdsPayMPersons, 'kaid', M.WParam);
        lcbPersonName.KeyValue := M.WParam;
        lcbPersonName.SelStart := 0;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.setid(const Value: integer);
 var
   FItem: TcxTreeListNode;
   FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
   APreffix, ASuffix: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditAccOut.setid') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  mdTmpIds.Close;
  mdTmpIds.Open;
  mdWMatTurn.Close;
  mdWMatTurn.Open;
  mdWMatTurnOld.Close;
  mdWMatTurnOld.Open;
  mdDet.Close;
  mdDet.Open;

  {CurrentNDS := NDS;
  chbCheckNDS.Tag := 1;
  chbCheckNDS.Properties.Caption := rs('fmWaybill','GetNDS');
  chbCheckNDS.Checked := true;
  chbCheckNDS.Tag := 0;
  }
  cdsEnts.Locate('kaid', CurrEnt.KAID, []);
  cdsCurr.Open;
  cdsPayType.Open;
  lcbPayType.KeyValue := 2;

  //Установка валюты по умолчанию_
  if cdsCurr.Locate('def', 1, []) then begin
    cbCurr.KeyValue := cdsCurr.fieldbyname('currid').AsInteger;
    cbPayCurr.KeyValue := cbCurr.KeyValue;
  end;

  edDate.Date := OnDate;
  edTime.Time := Time;
  edToDate.Date := LastSecondInDay(edDate.Date + DefAccOutPeriod);
  edReason.Text := '';
  //SetKurs;
  Fid := Value;

  //********** Чтение оборотов ***********************
  if Value > 0 then begin
    with newDataSet do
      try
        ProviderName := 'pWMatTurnOut_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
        Close;
        mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);

      finally
        Free;
      end;
  end;// if Value > 0
  //*****************************

  edKAgent.KAID := 0;
  with newDataSet do
    try
      //Установка номера по умолчанию
      if ((Value = 0) or IsPattern) and AOAutoNum then begin
        APreffix := AOPrefix;
        ASuffix := AOSuffix;
        FLastGen := '';

        FCurrNum := GetDocNumEx(dmData.SConnection, dtAO, 1, APreffix, ASuffix, FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

        edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin
          Self.Caption := rs('fmWaybill', 'TitleEditAccOut');
          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := Value;
          Open;
          if not IsEmpty then begin
            if not IsPattern then begin
              edNum1.Text := fieldbyname('num').AsString;
              edNum1.Tag := fieldbyname('defnum').AsInteger;
              eddate.Date := fieldbyname('ondate').AsDateTime;
              edTime.Time := fieldbyname('ondate').AsDateTime;
            end;

            if fieldbyname('todate').IsNull then begin
              chbToDate.Checked := false;
              edToDate.EditText := '';
            end
            else begin
              chbToDate.Checked := True;
              edToDate.Date := fieldbyname('todate').AsDateTime;
            end;

            cdsPayType.Locate('PTYPEID',lcbPayType.KeyValue,[]);
            edKAgent.KAID := fieldbyname('kaid').AsInteger;

            if not FieldByName('personid').IsNull
              then lcbPersonName.KeyValue := FieldByName('personid').AsInteger
              else lcbPersonName.Text := '';

            oldkaid := fieldbyname('kaid').AsInteger;
            edReason.Text := fieldbyname('REASON').asstring;
            edNotes.Text := fieldbyname('notes').asstring;

            if not FieldByName('entid').IsNull
              then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

            kaEnt.AccID := FieldByName('defnum').AsInteger;

            if cdsCurr.Locate('CURRID',fieldbyname('CURRID').AsInteger,[])
              then cbCurr.KeyValue := fieldbyname('CURRID').AsInteger;

            edRate.Value := FieldByName('onvalue').AsFloat;

            {CurrentNDS := fieldbyname('NDS').AsFloat;
            chbCheckNDS.Tag := 1;
            if CurrentNDS<>0 then begin
               chbCheckNDS.Properties.Caption := rs('fmWaybill','GetNDS');
               chbCheckNDS.Checked := true;
            end
            else begin
               chbCheckNDS.Properties.Caption := rs('fmWaybill','GetNDS');
               chbCheckNDS.Checked := false;
            end;
            chbCheckNDS.Tag := 0;}
          end;
          Close;
      end//if Value<>0
      else Self.Caption := rs('fmWaybill','TitleAddAccOut');

      if Value > 0 then begin
        ProviderName := 'pWaybillDet_GetOut';// чтение позиций в mdDet
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := fid;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);
        Close;

        ProviderName := 'pWaybillSvc_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);

        if not mdDet.IsEmpty then begin
          mdDet.First;
          while not mdDet.Eof do begin
            if (mdDet.FieldByName('bySN').AsInteger = 1)
                and mdWMatTurn.Locate('sourceid',mdDet.FieldByName('posid').AsInteger,[])
            then begin
              mdDet.Edit;
              mdWMatTurn.First;
              while not mdWMatTurn.Eof do begin
                if (mdWMatTurn.FieldByName('sourceid').AsInteger=mdDet.FieldByName('posid').AsInteger)
                   and (not mdWMatTurn.FieldByName('SN').IsNull)
                then begin
                  mdDet.FieldByName('SN').AsString := mdDet.FieldByName('SN').AsString+mdWMatTurn.FieldByName('SN').AsString+'; ';
                end;
                mdWMatTurn.Next;
              end;

              if mdDet.FieldByName('SN').IsNull then mdDet.Cancel
              else begin
                mdDet.FieldByName('SN').AsString := System.Copy(mdDet.FieldByName('SN').AsString,1,Length(mdDet.FieldByName('SN').AsString)-2);
                mdDet.Post;
              end;
            end;//if
            mdDet.Next;
          end;//while
        end;//if

        Close;

        ProviderName := 'pDocsRel_WB_Contr_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Params.ParamByName('doctype').AsInteger := -8;
        Open;

        if not IsEmpty then begin
          edContr.DocID := FieldByName('rdocid').AsInteger;
          FContrDocID := edContr.DocID;
        end
        else edContr.DocID := 0;

        Close;

        ProviderName := 'pWaybillDet_GetTaxes';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        while not Eof do begin
          if mdDet.Locate('posid', FieldByName('posid').AsInteger, []) then begin
            FPrice := mdDet.FieldByName('price').AsFloat * mdDet.FieldByName('onvalue').AsFloat;
            FPosNDS := mdDet.FieldByName('nds').AsFloat;
            NDSCalc(mdDet.FieldByName('amount').AsFloat, FPrice, FPosNDS, 1, FSumWONDS, FNDS);
            FSumWONDS := RoundToA(RoundToA(FSumWONDS + FNDS, -2) - RoundToA(FNDS, -2), -2);
            FTaxSumm := RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
            mdDet.Edit;
            mdDet.FieldByName('Tax' + FieldByName('taxid').AsString).AsFloat := FieldByName('onvalue').AsFloat;
            mdDet.FieldByName('TaxRate' + FieldByName('taxid').AsString).AsFloat := FTaxSumm;
            mdDet.Post;
          end;
          Next;
        end;
        Close;

        with dbgWaybillDet do
          if FocusedNode <> nil
            then FocusedNode.Selected := True;

        if not IsPattern then begin
          ProviderName := 'pWayBillPay_Get';// Чтение платежа
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := fid;
          Open;
          if not IsEmpty then begin
            chbPay.Enabled := false;
            chbPay.Checked := true;
            chbPay.Enabled := true;
            PayDocChecked := fieldbyname('Checked').AsInteger = 1;
            chbPay.Enabled := not PayDocChecked;

            if not chbPay.Enabled then begin
              lcbPayType.Enabled := False;
              //lPayNum.Enabled := false;
              //lPayNum.Enabled := false;
              lPaySumm.Enabled := False;
              lPayCurr.Enabled := False;
              lPayType.Enabled := False;
              edPaySumm.Enabled := False;
              edPayNum.Enabled := False;
              cbPayCurr.Enabled := False;
              lPayMPerson.Enabled := false;
              lcbPayMPerson.Enabled := False;
              btnPayMPerson.Enabled := False;
              lcbCashDesks.Enabled := False;
              lcbAccount.Enabled := False;
              lAcc.Enabled := False;
              lCashDesks.Enabled := False;
              btnCashDesks.Enabled := False;
              btnFinPay.Enabled := False;
            end;
            PayDocId := fieldbyname('PayDocId').AsInteger;
            OldPayDocID := PayDocID;
            PayDocDate := FieldByName('OnDate').AsDateTime;
            //lPayOnDate.Caption := rs_AttDate+' '+DateToStr(OldPayDocDate);
            edPayNum.Text := fieldbyname('DocNum').AsString;
            lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;

            if cdsPayType.Locate('PTypeId', fieldbyname('CurrId').AsInteger, [])
              then cbPayCurr.KeyValue := fieldbyname('CurrId').AsInteger;

            edPaySumm.Tag := 1;
            edPaySumm.Value := fieldbyname('Total').AsFloat;
            edPaySumm.Tag := 0;

            if not FieldByName('mpersonid').IsNull
              then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger
              else lcbPayMPerson.Text := '';

            if not FieldByName('accid').IsNull
              then lcbAccount.KeyValue := FieldByName('accid').AsInteger
              else lcbAccount.Clear;

            if not FieldByName('cashid').IsNull
              then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
              else lcbCashDesks.Clear;

          end//if not IsEmpty
          else begin
            PayDocChecked := false;
            PayDocId := 0;
            chbPay.Enabled := false;
            chbPay.Checked := false;
            chbPay.Enabled := true;
            edPayNum.Text := '';
            edPaySumm.Tag := 1;
            edPaySumm.Value := 0;
            edPaySumm.Tag := 0;
          end;//else
          Close;
        end;
      end // if Value > 0
      else begin
        mdDet.Open;
        mdWMatTurn.Open;
        mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
        PayDocChecked := False;
        PayDocId := 0;
        chbPay.Enabled := False;
        chbPay.Checked := False;
        chbPay.Enabled := True;
        edPayNum.Text := '';
        edPaySumm.Tag := 1;
        edPaySumm.Value := 0;
        edPaySumm.Tag := 0;
        with cdsPayMPersons do begin
          if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
        end;
      end;

      if UserID <> 0 then begin
        lcbPersonName.Enabled := False;
        btnPersonName.Enabled := False;
        if Value <> 0 then  // editing enabled only for document owner or admin
          with cdsPayMPersons do
            if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
            then EditingDisabled := True;
      end;
      
      FModified := False;

      if IsPattern then begin
        FPosModified := True;
        FID := 0;
        mdWMatTurn.Close;
        mdWMatTurn.Open;
        mdWMatTurnOld.Close;
        mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
        FShowRsvMsgs := False;
        aSetRsvAll.Execute;
        FShowRsvMsgs := True;
        dbgWaybillDet.ClearSelection;
        mdDet.First;

        with dbgWaybillDet do
          if FocusedNode <> nil then FocusedNode.Selected := True;
      end
      else FPosModified := False;
 //FPaySummChange := true;

      if Value > 0 then begin
        FGridRefresh := True;
        mdDet.First;
        while not mdDet.Eof do begin
          if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then begin
            mdDet.Edit;

            mdDet.FieldByName('fullprice').AsFloat :=
                mdDet.FieldByName('price').AsFloat / (100 - mdDet.FieldByName('discount').AsFloat) * 100;

            mdDet.FieldByName('status').AsInteger := 1;
            mdDet.Post;
          end;
          UpdatePos;
          mdDet.Next;
        end;
        mdDet.First;
      end;
      //FPaySummChange := false;
      FPayDocModified := false;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   BM:TBookmark;
   FPosID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if (ModalResult = mrCancel) and (FID > 0) and CheckModified
    then ModalResult := mrOK;

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if (edContr.DocID > 0) and not CheckByContr(edContr, cbCurr.KeyValue, (edDate.Date + edTime.Time))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (edContr.DocID > 0) and chbPay.Checked and (edPaySumm.Value>(edContr.Obj.Summ-Abs(edContr.Obj.PaidSumm)))
    then begin
      ssMessageDlg(Format(rs('fmContr','CheckErr8'), [edContr.Obj.Num, FormatFloat(MoneyDisplayFormat,edContr.Obj.Summ-abs(edContr.Obj.PaidSumm))]),ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if True{CheckDatesIn} then begin
      Application.ProcessMessages;
      with newDataSet do begin
        try
          TrStart;
          try
            Screen.Cursor := crSQLWait;
            NewRecord := (ID = 0);

            if ID = 0 then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

            if NewRecord
              then ProviderName := 'pWaybill_InsEx'
              else ProviderName := 'pWaybill_UpdEx';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;
            Params.ParamByName('DEFNUM').AsInteger := kaEnt.AccID;
            Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;// StrToTime(sbEditTime.Caption);
            Params.ParamByName('KAID').AsInteger := edKAgent.KAID;
            Params.ParamByName('CURRID').AsInteger := cbCurr.KeyValue;
            Params.ParamByName('ONVALUE').AsFloat := edRate.Value;
            Params.ParamByName('ATTNUM').AsString := AttNum;
            Params.ParamByName('ATTDATE').AsDate := AttDate;
            Params.ParamByName('REASON').AsString := edReason.Text;
            Params.ParamByName('notes').AsString := edNotes.Text;

            if lcbPersonName.EditText <> '' then begin
              Params.ParamByName('personid').AsInteger := lcbPersonName.KeyValue;
            end
            else begin
              Params.ParamByName('personid').DataType := ftInteger;
              Params.ParamByName('personid').Clear;
            end;

            Params.ParamByName('CHECKED').AsInteger := integer(false);
            Params.ParamByName('WTYPE').AsInteger := 2;//тип накладной 2-счёт
            Params.ParamByName('DELETED').AsInteger := 0;
            Params.ParamByName('SUMMALL').AsFloat := RoundToA(ALLSUMM,-2);
            Params.ParamByName('SUMMINCURR').AsFloat := AllSummCurr;
            Params.ParamByName('NDS').DataType := ftFloat;
            Params.ParamByName('NDS').Clear;
            Params.ParamByName('RECEIVED').AsString := '';

            try
              if chbToDate.Checked{ and (StrToDate(edToDate.Text)>=StrToDate(edDate.Text))}
              then Params.ParamByName('TODATE').AsDateTime := LastSecondInDay(StrToDate(edToDate.Text))
              else begin
                Params.ParamByName('TODATE').DataType := ftDateTime;
                Params.ParamByName('TODATE').Clear;
              end;

            except
              Params.ParamByName('TODATE').DataType := ftDateTime;
              Params.ParamByName('TODATE').Clear;
            end;

            if cdsEnts.IsEmpty then begin
              Params.ParamByName('entid').DataType := ftInteger;
              Params.ParamByName('entid').Clear;
            end
            else Params.ParamByName('entid').AsInteger := cdsEnts.FieldByName('kaid').AsInteger;

            Execute;//Записали в waybilllist

            // 1 )Удаляем из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили из wmatturn

            ProviderName := 'pAccOutDet_DelEx';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили из wmatturn

            if FPosModified then begin // Запись позиций в накладную

              // 2 Удаляем позиции
              ProviderName := 'pWaybillDet_Del';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := ID;
              Execute;

              ProviderName := 'pWaybillSvc_Del';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;

              // 3 Запись позиций из mdDet в waybilldet
              BM := mdDet.GetBookmark;
              mdDet.DisableControls;
              mdDet.First;

              while not mdDet.Eof do begin
                if mdDet.FieldByName('postype').AsInteger = 0 then begin
                  ProviderName := 'pWaybillDet_Ins';
                  FetchParams;
                  FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                  Params.ParamByName('POSID').AsInteger := FPosID;
                  //3.1 Ставим реальные Sourceid для оборотов
                  mdWMatTurn.First;

                  while not mdWMatTurn.Eof do begin
                    if mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
                      mdWMatTurn.Edit;
                      mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
                      mdWMatTurn.Post;
                    end;
                    mdWMatTurn.Next;
                  end;
                  //**************************

                  if Params.ParamByName('POSID').AsInteger < 0
                    then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

                  Params.ParamByName('WBILLID').AsInteger := FID;
                  Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
                  Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
                  Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
                  Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);
                  Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);
                  Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
                  Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
                  Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
                  Params.ParamByName('OnDate').AsDateTime := edDate.Date + edTime.Time;

                  if mdDet.fieldbyname('PTypeID').IsNull then begin
                    Params.ParamByName('PTypeID').DataType := ftInteger;
                    Params.ParamByName('PTypeID').Clear;
                  end
                  else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

                  Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                  Execute;//Записываем очередную позицию

                  SaveAddProps(FPosID);
                  SaveTaxes(FPosID);
                end
                else begin
                  ProviderName := 'pWaybillSvc_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                  Params.ParamByName('wbillid').AsInteger := FID;
                  Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                  Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                  Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                  Params.ParamByName('norm').AsFloat := StrToFloat(mdDet.fieldbyname('norm').AsString);
                  Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                  Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
                  Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                  Params.ParamByName('num').AsInteger := mdDet.RecNo;

                  if not mdDet.FieldByName('personid').IsNull
                    then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                    else begin
                      Params.ParamByName('personid').DataType := ftInteger;
                      Params.ParamByName('personid').Clear;
                    end;

                  Execute;
                end;
                mdDet.Next;
              end;//while not mdDet.Eof

              mdDet.GotoBookmark(BM);
              FreeBookmark(BM);
              mdDet.EnableControls;

              ProviderName := 'pAccOutSvc_InsEx';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;

              FPosModified := False; //Сбрасываем флаг изменения позиций
            end;//if FPosModified


            //2)Запись в обороты
            ProviderName := 'pWMatTurnOut_Ins';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              FetchParams;
              Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
              Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;
              Params.ParamByName('MATID').AsInteger := mdWMatTurn.fieldbyname('MATID').AsInteger;
              Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('WID').AsInteger;
              Params.ParamByName('TurnType').AsInteger := 2;
              Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time; //StrToTime(sbEditTime.Caption);
              Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString), MatDisplayDigits);
              Execute;
              mdWMatTurn.Next;
            end;

            {if not NewRecord then begin
              ProviderName := 'pAccOutDet_DelEx';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;
            end;}

            ProviderName := 'pAccOutDet_InsEx';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            if FPayDocModified then begin//Если платёж изменён, то записываем его
              if OldPayDocId > 0 then begin
                PayDocId := OldPayDocId;
                PayDocDate := edDate.Date;
              end;

              if chbPay.Checked then begin //
                if PayDocId > 0 then begin //если платёж существует, то обновляем
                  ProviderName := 'pWaybillPayDoc_Upd';
                  FetchParams;
                end//if PayDocId>0
                else begin // если платёж не существует
                  //Получить ID нового платежа
                  PayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                  ProviderName := 'pPayDoc_Ins';
                  FetchParams;
                  Params.ParamByName('withnds').AsInteger := 1;
                  Params.ParamByName('doctype').AsInteger := 1;
                  Params.ParamByName('notes').AsString := '';
                  PayDocDate := edDate.Date + Time;
                end;// если платёж не существует

                Params.ParamByName('reason').AsString := RS('fmWaybill','TitleAccOut')+amountPrefix+edNum1.Text;

                Params.ParamByName('ondate').AsDateTime := PayDocDate;
                Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
                Params.ParamByName('paydocid').AsInteger := PayDocId;
                Params.ParamByName('docnum').AsString := edPayNum.Text;
                Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;
                Params.ParamByName('currid').AsInteger := cbPayCurr.KeyValue;

                if cbCurr.KeyValue = cbPayCurr.KeyValue
                  then Params.ParamByName('onvalue').AsFloat := StrToFloat(edRate.EditingText)
                  else Params.ParamByName('onvalue').AsFloat :=
                         GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);

                Params.ParamByName('total').AsFloat := RoundToA(edPaySumm.Value,-2);
                Params.ParamByName('checked').AsInteger := Integer(True);

                if lcbPayMPerson.EditingText = '' then begin
                  Params.ParamByName('mpersonid').DataType := ftInteger;
                  Params.ParamByName('mpersonid').Clear;
                end
                else Params.ParamByName('mpersonid').AsInteger := lcbPayMPerson.KeyValue;

                if lcbPayType.KeyValue = 1
                  then Params.ParamByName('cashid').AsInteger := lcbCashDesks.KeyValue
                  else begin
                    Params.ParamByName('cashid').DataType := ftInteger;
                    Params.ParamByName('cashid').Clear;
                  end;

                if (lcbPayType.KeyValue = 2) and (lcbAccount.EditText <> '')
                  then Params.ParamByName('accid').AsInteger := lcbAccount.KeyValue
                  else begin
                    Params.ParamByName('accid').DataType := ftInteger;
                    Params.ParamByName('accid').Clear;
                  end;

                Params.ParamByName('ctypeid').AsInteger := 1;
                Execute;// Записываем изменения в paydoc

                if ProviderName = 'pPayDoc_Ins' then begin // Если плётёж новый
                  ProviderName := 'pWaybillPay_Ins';       // то записываем его в WaybillPay
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := FID;
                  Params.ParamByName('paydocid').AsInteger := PayDocId;
                  Execute;
                end;//if ProviderName='pPayDoc_Ins'

              end // if chbPay.Checked
              else begin                  //Удаление платежа
                if PayDocId > 0 then begin // если он существует
  {ProviderName := 'pWayBillPay_Del';
                  FetchParams;
                  Params.ParamByName('WBillID').AsInteger := FID;
                  Execute; // Удаление из WaybillPay
                  }
                  ProviderName := 'pPayDoc_Del';
                  FetchParams;
                  Params.ParamByName('PayDocId').AsInteger := PayDocId;
                  Execute; //Удаление из PayDoc
                  PayDocId := 0;
                  OldPayDocId := 0;
                end;//if PayDocId>0
              end;//else chbPay.Checked

              FPayDocModified := false;
            end;//if FPayDocModified

            FModified := False;//флаг изменения документа false

            if not NewRecord and (FContrDocID > 0) then begin
              ProviderName := 'pDocsRel_WB_Contr_Del';
              FetchParams;
              Params.ParamByName('docid').AsInteger := FContrDocID;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;
            end;

            if edContr.DocID > 0 then begin
              ProviderName := 'pDocsRel_WB_Contr_Ins';
              FetchParams;
              Params.ParamByName('docid').AsInteger := edContr.DocID;
              Params.ParamByName('wbillid').AsInteger := FID;
              Execute;
            end;

            if not TrCommit then raise Exception.Create('');

            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);

            if ModalResult = mrYes then
              if NewRecord then begin
                PayDocId := 0;
                mdDet.Close;
                mdDet.Open;
                mdTmpIds.Close;
                mdTmpIds.Open;
                mdWMatTurn.Close;
//mdWMatTurnOld.Close;
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                ID := 0;
//FID := 0;
              end//if NewRecord
              else begin
//PayDocId := 0;

                if PDInAutoNum and (OldPayDocID = 0) and chbPay.Checked
                  then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);

                OldPayDocId := PayDocID;

//mdDet.Close;
//mdDet.Open;
                mdTmpIds.Close;
                mdTmpIds.Open;
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                ID := ID;
              end//else NewRecord
            else CanClose := True;

     //TrCommit;
      //dmData.SConnection.AppServer.q_Add(CA_REFRESH,CA_WMAT);
            FGridRefresh := true;
    //OldPayDocId := 0;
            FPaySummChange := true;

            if not WHMode
              then SendMessage(MainHandle, WM_REFRESH, ID, 0)
              else begin
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                SendMessage(MainHandle, WM_REFRESH, 0, 0);
                RefreshFun('TfmAccOut', 0);
              end;
            RefreshFun('TfmWMat', 0);
            RefreshFun('TfmFinance', 0);
            RefreshFun('TfmPayDoc', 0);

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
    end;// if CheckDatesIn then begin
  end
  else begin
    if FLastGen = '' then begin
      if GetDocNum(dmData.SConnection, dtAO, 0) = FCurrNum
        then GetDocNum(dmData.SConnection, dtAO, -1);
    end
    else begin
      if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
        then Gen_ID(dmData.SConnection, FLastGen, -1);
    end;

    if GetDocNum(dmData.SConnection, dtPDIn,0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDIn, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditAccOut.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
 var
  FEnToDate: Boolean;
  FEnPay: Boolean;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.ActionListUpdate') else _udebug := nil;{$ENDIF}

  {  if chbToDate.Checked then
    try
      FEnToDate := StrToDateTime(edToDate.Text) >= StrToDateTime(edDate.Text);
    except
      FEnToDate := False;
    end
  else FEnToDate := True;
  }

  FEnToDate := True;

  edToDate.Enabled := chbToDate.Checked;
  aSetDiscount.Enabled := dbgWaybillDet.SelectedCount > 0;

  edRate.Enabled := (BaseCurrID <> cbCurr.KeyValue);
  //aSetKurs.Enabled := sbKurs.Enabled;

  //chbPay.Enabled := not PayDocChecked;

  if chbPay.Checked and not PayDocChecked then begin
    try
      FEnPay := (StrToFloat(edPaySumm.EditingText) > 0) and (Trim(edPayNum.Editor.EditingText) <> '');
    except
      FEnPay := False;
    end;
  end
  else begin
    FEnPay := True;
  end;

  if edContr.Obj.DocID>0 then cbPayCurr.Enabled := false;

  if dbgWaybillDet.SelectedCount = 1 then begin
    try
      aSetRsv.Enabled := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]) = 0;
      aRemoveRsv.Enabled := not aSetRsv.Enabled;
    except
      aSetRsv.Enabled := False;
      aRemoveRsv.Enabled := False;
    end;
  end
  else begin
    aSetRsv.Enabled := not mdDet.IsEmpty;
    aRemoveRsv.Enabled := not mdDet.IsEmpty;
  end;

 if FGridRefresh then
   begin
     GetSummAll;
     if (not PayDocChecked) and (chbPay.Checked) and (not FPaySummChange) and (dbgWaybillDet.Tag <> 0)
     then begin
       edPaySumm.Tag := 1;
       edPaySumm.Value := roundtoa(ALLSUMM,-2);
       edPaySumm.Tag := 0;
     end;
     dbgWaybillDet.Tag := dbgWaybillDet.Tag+1;

   end;

  lSummCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
  lTotalCurr.Visible := cbCurr.KeyValue <> BaseCurrID;

  aOk.Enabled := (Trim(edNum1.Text) <> '')
    and (edDate.Text <> '')
    and (edKAgent.KAID > 0) and (cbCurr.KeyValue > 0)
    and (not mdDet.IsEmpty) and (lPaySumm.Font.Color<>clRed)
    and FEnToDate and FEnPay;

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified);

  aCDel.Enabled := not mdDet.IsEmpty;
  aCUpd.Enabled := aCDel.Enabled;

  if not mdDet.IsEmpty and (dbgWaybillDet.FocusedNode <> nil)
    then aRemoveRsv.Enabled := dbgWaybillDet.FocusedNode.Values[colStatus.Index] = 1
    else aRemoveRsv.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    colPType.Caption := '';
    edKAgent.InitRes;
    edKAgent.Caption.Caption := GetRS('fmWaybill', 'KANameOut') + ':';

    imnuAdd.Caption := GetRS('Common', 'Add');

    aAddSvc.Caption := GetRS('fmWaybill', 'SvcV');
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
    aAddSvcList.Caption := GetRS('fmWaybill', 'AddSvcList');
    aOrdersInfo.Caption := GetRS('fmOrders', 'OrderedIn');
    btnOrdersInfo.Hint := GetRS('fmOrders', 'OrderedIn');

    aSetDiscount.Caption := GetRS('fmWaybill', 'SetDiscount');

    btnSvcInfo.Hint := GetRS('fmWaybill', 'SvcInfo');
    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');

    btnPayMPerson.Hint := GetRS('fmWaybill', 'aPersons');

    edFind.InitRes;

    aCIns.Caption := GetRS('Common', 'Add');
    aCIns.Hint := GetRS('fmWaybill', 'NewPos');
    aCUpd.Caption := GetRS('Common', 'Properties');
    aCUpd.Hint := GetRS('fmWaybill','EditPos');
    aCDel.Caption := GetRS('Common', 'Del');
    aCDel.Hint := GetRS('fmWaybill','PosDel');

    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aRemoveRsv.Caption := GetRS('fmWaybill','DelRsv');
    aRemoveRsvAll.Caption := GetRS('fmWaybill', 'RemoveRsvAll');
    aSetRsv.Caption := GetRS('fmWaybill', 'SetRsv');
    aSetRsvAll.Caption := GetRS('fmWaybill', 'SetRsvAll');

    btnPrint.Hint := GetRS('fmWaybill', 'PrintBill');
    btnBallance.Hint := GetRS('fmWaybill', 'KABallance');
    btnMatInfo.Hint := GetRS('fmWaybill', 'MatInfo');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');

    aShowRealPrice.Caption := GetRS('fmWaybill', 'ShowRealPrice');
    aSetTime.Hint := GetRS('fmWaybill', 'EditTime');
    aAddKA.Hint := GetRS('fmWaybill','KAAdd');
    //aSetKurs.Hint := GetRS('fmWaybill','SetKurs');

    lNum.Caption := GetRS('fmWaybill', 'Num') + ':';
    lOnDate.Caption := GetRS('fmWaybill', 'OnDate') + ':';
    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') + ':';
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
    lCurr.Caption := GetRS('fmWaybill', 'Curr') + ':';
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    lPayCurr.Caption := GetRS('fmWaybill', 'Curr') + ':';
    lPaySumm.Caption := GetRS('fmWaybill', 'Summ') + ':';
    lReason.Caption := GetRS('fmWaybill', 'Reason') + ':';
    lPayType.Caption := GetRS('fmWaybill', 'PayType') + ':';
    lPersonname.Caption := GetRS('fmWaybill', 'Billed') + ':';
    colRecNo.Caption := GetRS('fmWaybill','NumEx');
    colMatName.Caption := GetRS('fmWaybill','MatSvc');
    colMeasureName.Caption := GetRS('fmWaybill','Measure');
    colAmount.Caption := GetRS('fmWaybill','Amount');
    colWHouseName.Caption := GetRS('fmWaybill','WHouse');
    colNorm.Caption := GetRS('fmWaybill', 'Norm');
    colStatus.Caption := GetRS('fmWMat', 'Reserved');
    chbPay.Properties.Caption := GetRS('fmWaybill','ExecPayment');
    chbToDate.Properties.Caption := GetRS('fmWaybill','AccToDate') + ':';
    lTotal.Caption := GetRS('fmWaybill', 'TotalIn') + ' ' + BaseCurrName;
    gbHeader.Caption := ' ' + GetRS('fmWaybill', 'MainInfo') + ' ';
    gbPos.Caption := ' ' + GetRS('fmWaybill', 'Positions') + ' ';
    aShowSN.Caption := GetRS('fmWaybill','SNs');
    edContr.InitRes;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBOutDefAction of
    aaMat:     aAddMat.Execute;
    aaSvc:     aAddSvc.Execute;
    aaMatList: aAddMatList.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aCDelExecute(Sender: TObject);
 var
   FItem: TListItem;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1) and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes))
     or
     ((dbgWaybillDet.SelectedCount > 1) and
     (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.Show;
  fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
  CanSelect := False;
  try
    mdDet.DisableControls;
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      Application.ProcessMessages;

      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
        then DelPos;

      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;
    LocateAfterDel;
    FGridRefresh := True;

  finally
    fProgress.Hide;
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    CanSelect := True;
    SelectFocusedNode;
    RealignGrid;
  end;//if

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edNum1PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edNum1PropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  FPayDocModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.chbPostingPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdMatsAfterPost(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdMatsAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdMatsAfterDelete(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdMatsAfterDelete') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdMatsAfterEdit(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdMatsAfterEdit') else _udebug := nil;{$ENDIF}

  FPosModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  Screen.Cursor := crDefault;
  FormResize(Self);
  //chbCheckNDS.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aCUpdExecute') else _udebug := nil;{$ENDIF}

  try
    Screen.Cursor := crSQLWait;

    case mdDet.FieldByName('postype').AsInteger of
      0:
        with TfrmEditPositionAcc.Create(nil) do
        try
          ParentNameEx := Self.ParentNameEx;
          dbgWaybillDet.SetFocus;
          Application.ProcessMessages;

          WBType := wbtAccOut;
          FAccOutID := FOrdID;
          edDiscount.Tag := edKAgent.KAID;
          OnDate := Self.OnDate;
          ParentHandle := Self.Handle;
          ParentHandle2 := Self.Handle;
          PTypeID := Self.edKAgent.Obj.PTypeID;
          NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;
          KAType := Self.edKAgent.Obj.KType;
          CurrID := Self.cbCurr.KeyValue;
          OnDate := StrToDate(edDate.Text);
          FRateDate := Self.FRateDate;
          FRateID := Self.FRateID;
          FexchangeRate := CurKurs;
          aSetKurs.Caption := FloatToStr(CurKurs);

          parentMDDet := mdDet;
          parentmdWMatTurn := mdWMatTurn;
          parentMDWMatTurnOld := mdWMatTurnOld;
          parentMDTmpIDs := mdTmpIds;
          CurrName := cdsCurr.fieldbyname('shortname').AsString;
          {if Trim(stCurrShortName.Caption) = '' then begin
            stCurrShortName.Caption := cdsCurr.fieldbyname('shortname').AsString;
          end;}
          Caption := rs('fmWaybill', 'PosEdit');
          aShowPriceIn.Hint := rs('fmWaybill', 'ShowPriceIn');
          chbRsv.Tag := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]);
          chbRsv.Checked := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]) = 1;
          //FInAcc := (Self.FInAccOut>0);
          AOMode := True;
          ID := mdDet.FieldByName('posid').AsInteger;
          Self.FOrdID := FAccOutID;
          Screen.Cursor := crDefault;

        finally
          Free;
        end;

      1:
        with TfrmEditPositionSvc.Create(nil) do
        try
          ParentHandle := Self.Handle;
          ParentNameEx := Self.ParentNameEx;
          OnDate := Int(edDate.Date) + Frac(edTime.Time);
          FRateValue := Self.edRate.Value;
          CurrID := Self.cbCurr.KeyValue;
          mdDet := Self.mdDet;
          PosNDS := StrToFloat(mdDet.FieldByName('nds').AsString);
          ID := Self.mdDet.FieldByName('posid').AsInteger;
          ShowModal;

        finally
          Free;
        end;
    end;//case

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormClose') else _udebug := nil;{$ENDIF}

  mdDet.Close;
  cdsCurr.Close;
  cdsPayType.Close;
  mdTmpIds.Close;
  dmData.SConnection.AppServer.Rsv_Delete(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdDetAfterPost(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdDetAfterPost') else _udebug := nil;{$ENDIF}

  FPosModified := true;
  FGridRefresh := true;
  if Self.Visible and CanSelect then begin
    with dbgWaybillDet do begin
      ClearSelection;
      if FocusedNode <> nil
        then FocusedNode.Selected := True;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdDetAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdDetAfterDelete') else _udebug := nil;{$ENDIF}

  //NumMats;
  FPosModified := true;
  FGridRefresh := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aAddKAExecute(Sender: TObject);
 var
   aid: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aAddKAExecute') else _udebug := nil;{$ENDIF}

  if edKAgent.Editor.Focused then edKAgent.ShowRef
  else if edContr.Editor.Focused then edContr.ShowRef
  else if FCurrCtrl = lcbPayType then ShowFinance(Self, Date, 1)
  else if FCurrCtrl = lcbCashDesks then begin
    try aid := lcbCashDesks.KeyValue; except aid := 0; end;
    lcbCashDesks.SetFocus;
    ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
  end
  else if FCurrCtrl = lcbPayMPerson then begin
    try aid := lcbPayMPerson.KeyValue; except aid := 0; end;
    lcbPayMPerson.SetFocus;
    lcbPayMPerson.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPayMPerson.Tag := 0;
  end
  else if FCurrCtrl = lcbPersonName then begin
    try aid := lcbPersonName.KeyValue; except aid := 0; end;
    lcbPersonName.SetFocus;
    lcbPersonName.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPersonName.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  try
    aShowRealPrice.Checked := not aShowRealPrice.Checked;
    dbgWaybillDet.Repaint;
  except

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    if not aShowRealPrice.Checked
    then AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormResize') else _udebug := nil;{$ENDIF}

  RealignGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked) then begin
      //edPayNum.Text := inttostr(GetMaxID(dmData.SConnection, 'paydoc', 'paydocid'));

      if PDInAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection,dtPDIn,1);
        edPayNum.Text := PDInPrefix+IntToStr(FCurrPayNum)+PDInSuffix;
      end
      else edPayNum.Text := FPayNum;

      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(AllSummCurr,-2);
      edPaySumm.Tag := 0;
      //cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
    else begin

      if PDInAutoNum and (OldPayDocID = 0) then begin
        if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
          then GetDocNum(dmData.SConnection, dtPDIn, -1);
      end;

      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
      //cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end;//else
   FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.cbPayTypePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.cbPayTypePropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edPaySummPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edPaySummPropertiesChange') else _udebug := nil;{$ENDIF}

  FPayDocModified := true;

  if edPaySumm.Tag = 0 then FPaySummChange := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  lTotalCurr.Caption := rs('fmWaybill', 'TotalIn') + ' ' + cbCurr.EditingText;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.cbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.cbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  inherited;

  cbPayCurr.KeyValue := CurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.WMDelete(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.WMDelete') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditAccOut.lcbPersonNameKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lcbPersonNameKeyPress') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditAccOut.dbgWaybillDetKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.dbgWaybillDetKeyPress') else _udebug := nil;{$ENDIF}

  if chbPay.Enabled then begin
    if Key = #13 then begin
      Key := #0;
      chbPay.SetFocus;
    end;
  end
  else GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lcbPersonNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lcbPersonNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditAccOut.KAName(kaid:integer):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.KAName') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
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
procedure TfrmEditAccOut.chbToDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.chbToDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if chbToDate.Checked and (edToDate.EditText = '')
    then edToDate.Date := LastSecondInDay(edDate.Date + DefAccOutPeriod);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aRemoveRsvExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aRemoveRsvExecute') else _udebug := nil;{$ENDIF}

  if mrYes =  ssMessageDlg(rs('fmWaybill', 'DelRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]) then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount>1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','DelRsvPr');
    fProgress.Refresh;
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index] <> 0 then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;
          DoRemoveRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index]);
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;
      end;

    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;
  end;//if  ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgWaybillDet.SelectedCount <> 1) or (dbgWaybillDet.SelectedNodes[0].Values[colPType.Index] <> 0)
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

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
procedure TfrmEditAccOut.colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colStatusGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.DelPos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.DelPos') else _udebug := nil;{$ENDIF}

    //Удаление из mdWMatTurn
    while mdWMatTurn.Locate('sourceid',mdDet.fieldbyname('posid').AsInteger,[] ) do mdWMatTurn.Delete;

    //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
    with mdTmpIds  do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger=mdDet.fieldbyname('posid').AsInteger) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end//if
        else Next;
      end;//while not eof
    end;//with mdTmpIds

    //Освобождение редактируемых позиций (старых)
    mdWMatTurnOld.First;
    while not mdWMatTurnOld.Eof do begin
      if mdWMatTurnOld.FieldByName('sourceid').AsInteger=mdDet.fieldbyname('posid').AsInteger then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          Open;
          if not IsEmpty then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;

            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,
                                                       Fields[0].AsInteger, Fields[1].AsInteger, 0,
                                                       RoundToA(-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits));

            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end;//if not IsEmpty
          Close;

        finally
          Free;
        end;
      end;//if
      mdWMatTurnOld.Next;

   end;//while not mdWMatTurnOld.Eof
   mdDet.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edKAgent.SetLng;
  edFind.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormCreate') else _udebug := nil;{$ENDIF}

  GetTaxes;

  inherited;

  //kaEnt.RemoteServer := dmData.SConnection;
  cdsEnts.Locate('kaid', CurrEnt.KAID, []);
  FCurrPayNum := -1;
  colPosType.Caption := '';
  cdsPayMPersons.Open;
  lcbPayMPerson.KeyValue := 0;
  lcbPayMPerson.Text := '';
  btnPosAdd.ImageIndex := 0;
  btnProps.ImageIndex := 1;
  btnDel.ImageIndex := 2;
  btnPayMPerson.ImageIndex := 32;
  btnPersonName.ImageIndex := 67;
  btnFinPay.ImageIndex := 44;

  if cdsPayMPersons.Locate('userid', UserID, [])
    then lcbPersonName.KeyValue := cdsPayMPersons.FieldByName('kaid').AsInteger
    else lcbPersonName.Clear;

  edKAgent.SetLng;
  edFind.SetLng;

  edKAgent.LoadFromRegistry(MainRegKey + '\' + Self.ClassName);
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');

  (*
  {$IFDEF LITE}
  edContr.OnRefButtonClick := NoAccess;
  {$ENDIF}
  *)

  lcbPayType.KeyValue := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSetRsvExecute(Sender: TObject);
 var
   ASourceId,APosId,ATmpId, i:integer;
   AAmount,FRemain, tmpremain, tmpsumm, summamount, TmpAmount:Extended;
   eStr, SNs: string;
   BM:TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSetRsvExecute') else _udebug := nil;{$ENDIF}

  if not FShowRsvMsgs or NoRsvConfirm or (mrYes = ssMessageDlg(rs('fmWaybill', 'SetRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]))
  then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount > 1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','SetRsvPr');
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if (dbgWaybillDet.SelectedNodes[i].Values[colPType.Index] = 0) and
           (dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index] <> 1)
        then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;
          if not DoSetRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index],
            dbgWaybillDet.SelectedNodes[i].Values[colMatId.Index],
            dbgWaybillDet.SelectedNodes[i].Values[colWId.Index],
            dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index])
          then begin
            if dbgWaybillDet.SelectedCount > 1 then begin
              eStr := rs('fmWaybill', 'RsvErrorPr1') + ': <' +
                //IntToStr(dbgWaybillDet.Items[i].Values[colRecNo.Index])+'.'+
                dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index]+ '>. ' +
                rs('fmWaybill','RsvErrorPr2');

              if FShowRsvMsgs and (ssMessageDlg(eStr, ssmtError,[ssmbYes,ssmbNo]) <> mrYes) then begin
                mdPosition.Close;
                fProgress.Hide;
                Break;
              end;
            end
            else if FShowRsvMsgs
              then ssMessageDlg(rs('fmWaybill', 'RsvErrorPr1') +
                ' <' + dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index] + '>. ', ssmtError, [ssmbOK]);
          end;
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;//if dbgWaybillDet...
      end;//for

    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;
  end;//if  ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aBallanceExecute') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditAccOut.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FormDestroy') else _udebug := nil;{$ENDIF}

  edKAgent.SaveToRegistry(MainRegKey + '\' + Self.ClassName);
  edFind.SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edKAgentEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edKAgentEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edKAgentExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edKAgentExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.btnPayMPersonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.btnPayMPersonMouseDown') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPayMPerson;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.btnPayMPersonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.btnPayMPersonMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aPrintExecute(Sender: TObject);
 var
   FSumWONDS, FNDS, FSumWithNDS, FAmount: Extended;
   cdsT: TssClientDataSet;
   i: Integer;
   SummTax, PosSummTax: Extended;
   TaxID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty or (edKAgent.KAID = 0) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
    try
      ProviderName := 'pKAgent_Get';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
      Open;
      KAPhone := FieldByName('phone').AsString;
      KAAddr := FieldByName('postindex').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('country').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('country').AsString
        else KAAddr := KAAddr + FieldByName('country').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('district').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('district').AsString
        else KAAddr := KAAddr + FieldByName('district').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('city').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('city').AsString
        else KAAddr := KAAddr + FieldByName('city').AsString;

      if (Trim(KAAddr) <> '') and (Trim(FieldByName('address').AsString) <> '')
        then KAAddr := KAAddr + ', ' + FieldByName('address').AsString
        else KAAddr := KAAddr + FieldByName('address').AsString;

      if Trim(FieldByName('fullname').AsString) <> ''
        then KAFullName := FieldByName('fullname').AsString
        else KAFullName := FieldByName('name').AsString;

      Close;

    finally
      Free;
    end;

  mdReport.CopyFromDataSet(mdDet);

  mdReport.First;
  while not mdReport.Eof do begin
    mdReport.Edit;
    FAmount := mdReport.FieldByName('amount').AsFloat;

    if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
      then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    mdReport.FieldByName('amount').AsFloat := FAmount;
    mdReport.Post;
    mdReport.Next;
  end;

  //if PrintType=0 then begin
  mdReport.Close;
  with TFloatField.Create(mdReport) do  begin
    FieldName := 'price2';
    FieldKind := fkData;
    Required := false;
    DataSet := mdReport;
    mdReport.FieldDefs.Add(FieldName, ftFloat, 0, false);
  end;//with
  mdReport.LoadFromDataSet(mdDet);

  cdsT := newDataSet;
  try
    cdsT.ProviderName := 'pTaxes_ListP';
    cdsT.Open;
    mdTaxes.Close;
    mdTaxes.Open;

    SummTaxAll := 0;
    with mdReport do begin
      First;
      while not Eof do begin
        PosSummTax := 0;
        for i := 0 to FieldCount - 1 do begin
          if (Pos('Tax', Fields[i].FieldName) = 1) and
             (Pos('TaxRate', Fields[i].FieldName) = 0) and
             (Fields[i].AsFloat > 0)
          then begin
            TaxID := StrToInt(Copy(Fields[i].FieldName, 4, Length(Fields[i].FieldName) - 3));
            SummTax := Fields[i + 1].AsCurrency;
            if cdsT.Locate('taxid', TaxID, []) then begin
              if not mdTaxes.Locate('taxid', TaxID, []) then begin
                mdTaxes.Append;
                mdTaxes.FieldByName('taxid').AsInteger := TaxID;
                mdTaxes.FieldByName('onvalue').AsFloat := Fields[i].AsFloat;
                mdTaxes.FieldByName('name').AsString := cdsT.FieldByName('name').AsString;
              end
              else mdTaxes.Edit;

              mdTaxes.FieldByName('taxsum').AsCurrency := mdTaxes.FieldByName('taxsum').AsCurrency + SummTax;
              mdTaxes.Post;
            end;
            PosSummTax := PosSummTax + SummTax;
            SummTaxAll := SummTaxAll + SummTax;
          end;
        end;
        Edit;
        FieldByName('taxsum').AsCurrency := PosSummTax;
        Post;
        Next;
      end;
    end;

  finally
    cdsT.Free;
  end;

  mdReport.First;
  while not mdReport.Eof do begin
    mdReport.Edit;
    mdReport.FieldByName('price2').AsFloat := mdReport.FieldByName('price').AsFloat;
    FAmount := mdReport.FieldByName('amount').AsFloat;

    if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
    then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

    mdReport.FieldByName('amount').AsFloat := FAmount;

    if PrintType = 0 then begin
      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := RoundToA(FSumWithNDS - FNDS, -2);
      mdReport.FieldByName('price').AsFloat := FSumWONDS;//NDSOut(mdReport.FieldByName('price').AsFloat,mdReport.FieldByName('nds').AsFloat);
    end;
    mdReport.Post;
    mdReport.Next;
  end;//while

  FGridRefresh := True;

  SmartShowRep(frDoc, 'WaybillAcc_Out.frf');

  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := kaEnt.NameEx
  else if 0 = AnsiCompareText(ParName, 'entshortname') then ParValue := kaEnt.Name_
  else if 0 = AnsiCompareText(ParName, 'rate') then ParValue := CurKurs
  else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Obj.FullName
  else if 0 = AnsiCompareText(ParName, 'kainn') then ParValue := edKAgent.Obj.INN
  else if 0 = AnsiCompareText(ParName, 'kakpp') then ParValue := edKAgent.Obj.KPP
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'entinn') then ParValue := kaEnt.INN
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'entkpp') then ParValue := kaEnt.KPP
  else if 0 = AnsiCompareText(ParName, 'director') then ParValue := kaEnt.Director
  else if 0 = AnsiCompareText(ParName, 'buh') then ParValue := kaEnt.Buh
  else if 0 = AnsiCompareText(ParName, 'MFO') then begin
    case CountryRules.AR of
      accRul_RU: ParValue := rs('fmBank', 'BIC');
      accRul_UA: ParValue := rs('fmBank', 'MFO');
      else ParValue := rs('fmBank', 'ABA');
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'postaxsum') then ParValue := mdReport.FieldByName('taxsum').AsCurrency
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    if PrintType = 0 then begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

       FSumm := RoundToA(FWONDS + FNDS, -2);
       //FWONDS := RoundToA(FSumm - FNDS, -2);
       FWONDS := FSumm - FNDS;
       ParValue := RoundToA(FWONDS, -2);
    end
    else begin
      NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      ParValue := RoundToA(FWONDS + FNDS, -2);
    end;
  end
  else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
            mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  else if 0 = AnsiCompareText(ParName, 'todate') then begin
    if chbToDate.Checked and (edToDate.Date > 0)
      then ParValue := edToDate.Date
      else ParValue := 0;
  end
  //else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text
  else if 0 = AnsiCompareText(ParName, 'entaddr') then begin
    kaEnt.Addr.Locate('addrtype', 0, []);
    ParValue := kaEnt.GetAddr;
  end
  else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := kaEnt.Phone
  else if 0 = AnsiCompareText(ParName, 'entaccount') then ParValue := kaEnt.Accounts.FieldByName('accnum').AsString
  else if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := kaEnt.Accounts.FieldByName('name').AsString
  else if 0 = AnsiCompareText(ParName, 'entcoracc') then ParValue := kaEnt.Accounts.FieldByName('coracc').AsString
  else if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := kaEnt.Accounts.FieldByName('mfo').AsString
  else if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := kaEnt.OKPO
  else if 0 = AnsiCompareText(ParName, 'kaphone') then ParValue := KAPhone
  else if 0 = AnsiCompareText(ParName, 'kaaddr') then ParValue := KAAddr
  else if 0 = AnsiCompareText(ParName, 'received') then ParValue := ''
  else if 0 = AnsiCompareText(ParName, 'att') then ParValue := ''
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := StrToFloat(DelChars(lSummDefNDS.Caption, [ThousandSeparator]))
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));

  {if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text else
  if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Date else
  if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName else
  if 0 = AnsiCompareText(ParName, 'entaddr') then ParValue := EntAddr else
  if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := EntPhone else
  if 0 = AnsiCompareText(ParName, 'entaccount') then ParValue := EntAccount else
  if 0 = AnsiCompareText(ParName, 'entbank') then ParValue := EntBank else
  if 0 = AnsiCompareText(ParName, 'entmfo') then ParValue := EntMFO else
  if 0 = AnsiCompareText(ParName, 'entokpo') then ParValue := EntOKPO else
  if 0 = AnsiCompareText(ParName, 'kaphone') then ParValue := KAPhone else
  if 0 = AnsiCompareText(ParName, 'kaaddr') then ParValue := KAAddr else
  if 0 = AnsiCompareText(ParName, 'possum') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);
    ParValue := RoundToA(FWONDS + FNDS, -2);
  end else
  if 0 = AnsiCompareText(ParName, 'todate') then begin
    if chbToDate.Checked and (edToDate.Date>0) then ParValue := edToDate.Date
      {rs('fmWaybill', 'AccToDate') + ' ' +
        FormatDateTime('dd.mm.yyyy', edToDate.Date)}
{    else ParValue := 0;
  end else
  if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := KAFullName else
  if 0 = AnsiCompareText(ParName, 'curnds') then begin
    if chbCheckNDS.Checked then ParValue := NDS
      else ParValue := 0;
  end else
  if 0 = AnsiCompareText(ParName, 'propis') then ParValue := Propis else
  if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := FSummNDS else
  if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := FSummAll else
  if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text;
}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lcbPayMPersonPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lcbPayMPersonPropertiesChange') else _udebug := nil;{$ENDIF}


  FPayDocModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.frDocEndDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.frDocEndDoc') else _udebug := nil;{$ENDIF}

  GetSummAll;
  dbgWaybillDet.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := Self.edRate.Value;
    CurrID := Self.cbCurr.KeyValue;
    mdDet := Self.mdDet;
    PosNDS := NDS;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPositionAcc.Create(nil) do
  try
    WBType := wbtAccOut;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Self.OnDate;
    FKAID := edKAgent.KAID;
    FAccOutID := FOrdID;
    ParentHandle := Self.Handle;
    ParentHandle2 := Self.Handle;
    PTypeID := Self.edKAgent.Obj.PTypeID;
    NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;
    KAType := Self.edKAgent.Obj.KType;
    CurrID := Self.cbCurr.KeyValue;
    OnDate := StrToDate(edDate.Text);
    FRateDate := Self.FRateDate;
    FRateID := Self.FRateID;
    FExchangeRate := CurKurs;
    aSetKurs.Caption := FloatToStr(CurKurs);

    parentMDDet := mdDet;
    parentmdWMatTurn := mdWMatTurn;
    parentMDWMatTurnOld := mdWMatTurnOld;
    parentMDTmpIDs := mdTmpIds;

    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    {if trim(stCurrShortName.Caption) = '' then begin
      stCurrShortName.Caption := cdsCurr.fieldbyname('shortname').AsString;
    end;}
    Caption := rs('fmWaybill', 'PosAdd');
    aShowPriceIn.Hint := rs('fmWaybill','ShowPriceIn');
    AOMode := True;

    if kaEnt.NDSPayer
      then FPosNDS := NDS
      else FPosNDS := 0;

    ID := 0; // see TfrmEditPositionAcc.setid()

    Self.FOrdID := FAccOutID;
    Screen.Cursor := crDefault;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := True;
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgWaybillDet.SelectedCount <> 1) or (dbgWaybillDet.SelectedNodes[0].Values[colPType.Index] <> 1)
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditServices.Create(nil) do
    try
      ParentNameEx := 'fmServices';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.SelectedNodes[0].Values[colMatID.Index];
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.SetSvcPresent(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SetSvcPresent') else _udebug := nil;{$ENDIF}

  FSvcPresent := Value;

  colNorm.Visible := Value;
  AdjustGrid(dbgWaybillDet, colMatName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.colNormGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colNormGetText') else _udebug := nil;{$ENDIF}

  if (AText = '0') then AText := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.CheckSvc;
  var
    i: Integer;
    FSvc: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.CheckSvc') else _udebug := nil;{$ENDIF}

  FSvc := False;
  with dbgWaybillDet do
    for i := 0 to Count - 1 do
      if Items[i].Values[colPType.Index] = 1 then begin
        FSvc := True;
        Break;
      end;

  if FSvc <> SvcPresent then SvcPresent := FSvc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.ChangeMatsCur;
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.ChangeMatsCur') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    BM := GetBookmark;
    DisableControls;
    try
      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('CurrId').AsFloat := cbCurr.KeyValue;
          Post;
          Next;
        end;//while

      except
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aShowSNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aShowSNExecute') else _udebug := nil;{$ENDIF}

  with TfrmSerials.Create(nil) do
  try
    colSN.DisableEditor := true;
    mdSN.Open;
    with mdWMatTurn do begin
      First;
      while not Eof do begin
        if (mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.FieldByName('posid').AsInteger)
           and not mdWMatTurn.FieldByName('SN').IsNull
        then begin
            mdSN.Append;
            mdSN.FieldByName('num').AsInteger := mdSN.RecNo;
            mdSN.FieldByName('sn').AsString := mdWMatTurn.FieldByName('SN').AsString;
            mdSN.Post;
          end;
        Next;
      end;//while
    end;//with

    if not mdSN.IsEmpty then begin
      mdSN.First;
      ShowModal;
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSetRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSetRsvAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;
  aSetRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aRemoveRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aRemoveRsvAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;
  aRemoveRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocAccOut');
  ImgList := dmData.Images;
  AIndex := II_ACCOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.AddMats(var IDs: string);
  var
    FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
    i, FPTypeID: Integer;
    FWithNDS: Boolean;
    tmpMD: TdxMemData;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.AddMats') else _udebug := nil;{$ENDIF}

  tmpMD := TdxMemData.Create(nil);
  
  try // finally
    WHMode := True;

    with newDataSet do
    try
      cdsRsv_Temp.Close;
      cdsRsv_Temp.Open;
      mdDet.Close;
      mdDet.Open;

      ProviderName := 'pWaybillDet_GetPosEx';
      FetchParams;
      FetchMacros;
      Params.ParamByName('ondate').AsDateTime := MaxDateTime;
      Macros.ParamByName('ids').AsString := IDs;
      Open;
      tmpMD.CopyFromDataSet(Fields[0].DataSet);

      tmpMD.First;
      while not tmpMD.Eof do begin
        FRsv := tmpMD.FieldByName('rsv').AsFloat;

        if cdsRsv_Temp.Locate('posid', tmpMD.FieldByName('posid').AsInteger, [])
          then FRsv := FRsv + cdsRsv_Temp.FieldByName('amount').AsFloat;

        tmpMD.Edit;
        tmpMD.FieldByName('posid').AsInteger := -tmpMD.FieldByName('posid').AsInteger;

        if tmpMD.FieldByName('remain').IsNull
          then tmpMD.FieldByName('amount').AsFloat := RoundToA(tmpMD.FieldByName('amount').AsFloat - FRsv, MatDisplayDigits)
          else tmpMD.FieldByName('amount').AsFloat := RoundToA(tmpMD.FieldByName('remain').AsFloat - FRsv, MatDisplayDigits);

        tmpMD.FieldByName('discount').AsFloat := 0;
        tmpMD.Post;
        tmpMD.Next;
      end;

      mdDet.LoadFromDataSet(tmpMD);
      tmpMD.Close;
      Close;

      ProviderName := 'pSQL';
      FetchMacros;
      Params.Clear;
      Macros.ParamByName('sql').AsString := 'select ptypeid from pricetypes where def=1';
      Open;
      FPTypeID := Fields[0].AsInteger;
      Close;

      mdDet.First;
      for i := 0 to mdDet.RecordCount - 1 do begin
        GetMatPrices(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2);

        if POType = poAvg
          then FPrice := FAvgPrice
          else FPrice := FLastInPrice;

        FPrice := GetDefPriceOut(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger,
                                 FPTypeID, FPrice, OnDate, CurKurs, FWithNDS);

        case WBOutPriceType of
          0: if not FWithNDS then FPrice := NDSIn(FPrice, mdDet.fieldbyname('nds').AsFloat);
          1: if FWithNDS then FPrice := NDSOut(FPrice, mdDet.fieldbyname('nds').AsFloat);
        end;

        FPrice := RoundToA(FPrice, -6);

        mdRsv.Open;
        mdRsv.Append;
        mdRsv.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
        mdRsv.FieldByName('pricein').AsFloat := StrToFloat(mdDet.FieldByName('price').AsString);
        mdRsv.FieldByName('amount').AsFloat := StrToFloat(mdDet.FieldByName('amount').AsString);
        mdRsv.Post;

        mdWMatTurn.Open;
        mdWMatTurn.Append;
        mdWMatTurn.FieldByName('posid').AsInteger := -mdDet.fieldbyname('posid').AsInteger;
        mdWMatTurn.FieldByName('matid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
        mdWMatTurn.FieldByName('wid').AsInteger := mdDet.fieldbyname('wid').AsInteger;
        mdWMatTurn.FieldByName('sourceid').AsInteger := mdDet.fieldbyname('posid').AsInteger;
        mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);
        mdWMatTurn.FieldByName('ondate').AsDateTime := 0;
        mdWMatTurn.Post;

        mdTmpIds.Open;
        mdTmpIds.Append;
        mdTmpIds.FieldByName('sourceid').AsInteger := mdDet.FieldByName('posid').AsInteger;
        mdTmpIds.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
        mdTmpIds.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);

        mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(-mdDet.FieldByName('posid').AsInteger,
          mdDet.FieldByName('matid').AsInteger, mdDet.FieldByName('wid').AsInteger, 0, StrToFloat(mdTmpIds.FieldByName('amount').AsString));

        mdTmpIds.FieldByName('free').AsInteger := 0;
        mdTmpIds.FieldByName('forall').AsInteger := 0;
        mdTmpIds.Post;

        mdDet.Edit;
        mdDet.FieldByName('price').AsFloat := FPrice;
        mdDet.FieldByName('fullprice').AsFloat := FPrice;
        mdDet.FieldByName('ptypeid').AsInteger := FPTypeID;
        mdDet.FieldByName('status').AsInteger := 1;
        mdDet.Post;
        UpdatePos;

        mdDet.Next;
      end;
      SelectFocusedNode;

      NoRsvConfirm := True;

    finally
      NoRsvConfirm := False;
      Free;
    end;

  finally
    tmpMD.Free;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditAccOut.SaveAddProps(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SaveAddProps') else _udebug := nil;{$ENDIF}


  if (mdDet.FieldByName('producer').AsString <> '') or
     (mdDet.FieldByName('certnum').AsString <> '') or
     (mdDet.FieldByName('gtd').AsString <> '') or
     (mdDet.FieldByName('certdate').AsDateTime <> 0) or
     (mdDet.FieldByName('cardid').AsInteger > 0)
  then
    with newDataSet do
    try
      ProviderName := 'pWaybillDetAP_Ins';
      FetchParams;
      Params.ParamByName('posid').AsInteger := APosID;
      Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
      Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
      Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

      if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
        Params.ParamByName('certdate').DataType := ftDateTime;
        Params.ParamByName('certdate').Clear;
      end
      else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

      if mdDet.FieldByName('cardid').IsNull then begin
        Params.ParamByName('cardid').DataType := ftInteger;
        Params.ParamByName('cardid').Clear;
      end
      else Params.ParamByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;

      Execute;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;
    while not Eof do begin
      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;
      ACol.OnGetText := colTaxGetText;

      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
      ACol.Name := 'colTaxRate' + FieldByName('taxid').AsString;
      ACol.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString;
      ACol.Width := 60;
      ACol.OnGetText := colTaxRateGetText;

      Next;
    end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colTaxGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.colTaxRateGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.SaveTaxes(APosID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.SaveTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDetTaxes_Ins';
    FetchParams;
    Params.ParamByName('posid').AsInteger := APosID;

    for i := 0 to mdDet.FieldCount - 1 do begin
      if (Pos('Tax', mdDet.Fields[i].FieldName) = 1) and
         (Pos('TaxRate', mdDet.Fields[i].FieldName) = 0) and
         (mdDet.Fields[i].AsFloat > 0)
      then begin
        Params.ParamByName('taxid').AsInteger := StrToInt(Copy(mdDet.Fields[i].FieldName, 4, Length(mdDet.Fields[i].FieldName) - 3));
        Params.ParamByName('onvalue').AsFloat := mdDet.Fields[i].AsFloat;
        Execute;
      end;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.frDocBeginDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.frDocBeginDoc') else _udebug := nil;{$ENDIF}

  if frDoc.FindObject('MasterData2') <> nil then begin
    TfrBandView(frDoc.FindObject('MasterData2')).DataSet := 'FsrcTaxes';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.WMSetText(var M: TMessage);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  S := panTitleBar.Caption;
  if Assigned(lTitle) then begin
    panTitleBar.Caption := '';
    lTitle.Caption := S;
    lEntEx.Left := lTitle.Left + lTitle.Width + 8;
    panTitleButtons.Invalidate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.srcEntDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.srcEntDataChange') else _udebug := nil;{$ENDIF}

  if kaEnt.RemoteServer = nil then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if kaEnt.KAID <> cdsEnts.FieldByName('kaid').AsInteger then begin
    DSRefresh(cdsEntAcc, 'accid', 0);
    Self.kaEnt.KAID := cdsEnts.FieldByName('kaid').AsInteger;

    if kaEnt.Accounts.IsEmpty then lcbAccount.Clear;

    lcbAccount.Update;
    lEntEx.AutoSize := True;
    lEntEx.Captions.Clear;
    lEntEx.Captions.Add('(' + cdsEnts.FieldByName('name').AsString + ')');

    if not kaEnt.Accounts.IsEmpty
      then lEntEx.Captions.Add(' - (' + Self.kaEnt.GetAccShort + ')');

    if lEntEx.Left + lEntEx.Width > panTitleButtons.Left + btnTBClose.Left - 4 then begin
      lEntEx.AutoSize := False;
      lEntEx.Width := panTitleButtons.Left + btnTBClose.Left - 4 - lEntEx.Left;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lEntExItemClick(Sender: TObject; Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lEntExItemClick') else _udebug := nil;{$ENDIF}
   
  case Index of
    0: aChangeEnt.Execute;
    1: aChangeEntAcc.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aChangeEntExecute(Sender: TObject);
  var
    APreffix, ASuffix: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aChangeEntExecute') else _udebug := nil;{$ENDIF}

  if cdsEnts.RecordCount > 1 then begin
    if TComponent(Sender).Tag = 0 then begin
      cdsEnts.Next;
      if cdsEnts.Eof then cdsEnts.First;
    end
    else begin
      cdsEnts.Prior;
      if cdsEnts.Bof then cdsEnts.Last;
    end;

    if (FID = 0) and AOAutoNum then begin
      if FLastGen <> '' then begin
        if Gen_ID(dmData.SConnection, FLastGen, 0) = FCurrNum
          then Gen_ID(dmData.SConnection, FLastGen, -1);
      end
      else if GetDocNum(dmData.SConnection, dtAO, 0) = FCurrNum
        then GetDocNum(dmData.SConnection, dtAO, -1);

      APreffix := AOPrefix;
      ASuffix := AOSuffix;
      FLastGen := '';

      FCurrNum := GetDocNumEx(dmData.SConnection, dtAO, 1, APreffix, ASuffix,
                  FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

      edNum1.Text := APreffix + IntToStr(FCurrNum) + ASuffix;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edKAgentChange') else _udebug := nil;{$ENDIF}
   
  DataModified(Self);

  if (PayDocId > 0) and (edKAgent.KAID <> oldkaid) and chbPay.Checked then
   if ssMessageDlg(rs('fmWaybill', 'KAChangeError') + edPayNum.Text + '?', ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
   then begin
     PayDocChecked := False;
     chbPay.Enabled := True;
     chbPay.Checked := False;
     OldPayDocId := PayDocId;
     PayDocId := 0;
     oldkaid := edKAgent.KAID;
     FModified := True;
   end
   else begin
     edKAgent.KAID := oldkaid;
     //edKAgent.Text := KANameEx(dmData.SConnection,edKAgent.Tag, FPTypeID, KType);
   end;//else

  if not edContr.Editor.Focused and not edContr.Locked then begin
    FCurrCtrl := edKAgent;

    if not edKAgent.Obj.Contracts.IsEmpty and edKAgent.Obj.Contracts.Locate('doctype', -8, [])
      then edContr.DocID := edKAgent.Obj.Contracts.FieldByName('docid').AsInteger
      else edContr.DocID := 0;

    //edContr.KAID := edKAgent.KAID;
    FCurrCtrl := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.edContrChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.edContrChange') else _udebug := nil;{$ENDIF}

  if (FCurrCtrl <> edKAgent) and (edContr.DocID > 0) and Visible then edKAgent.KAID := edContr.Obj.KAID;

  if (edContr.Obj.DocID>0) and (cbCurr.KeyValue<>edContr.Obj.CurrID) then cbCurr.KeyValue := edContr.Obj.CurrID;

  if (edContr.Obj.DocID>0) and (cbPayCurr.KeyValue<>edContr.Obj.CurrID) then cbPayCurr.KeyValue := edContr.Obj.CurrID;

  cbCurr.Enabled := not (edContr.Obj.DocID>0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aChangeEntAccExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aChangeEntAccExecute') else _udebug := nil;{$ENDIF}
   
  if not kaEnt.Accounts.IsEmpty then begin
    if TComponent(Sender).Tag = 0
      then kaEnt.NextAccount
      else kaEnt.PrevAccount;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lEntExGetHintText(Sender: TObject; Index: Integer; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lEntExGetHintText') else _udebug := nil;{$ENDIF}

  case Index of
    0: AText := rs('fmWaybill', 'ChangeEnt') + ' (Ctrl+Right/Left)';
    1: AText := rs('fmWaybill', 'ChangeEntAcc') + ' (Shift+Ctrl+Right/Left)';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.kaEntAccountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.kaEntAccountChange') else _udebug := nil;{$ENDIF}


  lEntEx.Captions[1] := (' - (' + kaEnt.GetAccShort + ')');
  lcbAccount.KeyValue := kaEnt.AccID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.cdsEntAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.cdsEntAccBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsEntAcc.Params.ParamByName('kaid').AsInteger := cdsEnts.FieldByName('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.KAID := edKAgent.KAID;
  DocInfo.OnDate := edDate.Date;
  DocInfo.NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalWH(Self, MaxDateTime, 0, 3, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditAccOut.DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended): Boolean;
  var
    ASourceId, FPosId, ATmpId, i:integer;
    FAmount, FRemain, tmpremain, tmpsumm, TmpAmount: Extended;
    SNs: string;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.DoSetRsv') else _udebug := nil;{$ENDIF}

  SNs := '';

  //1. Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;

  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = APosID then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;

          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,
                                                     Fields[0].AsInteger, Fields[1].AsInteger, 0, -strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString));

          mdTmpIds.FieldByName('free').AsInteger := 1;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;

    mdWMatTurnOld.Next;
  end;//while not mdWMatTurnOld.Eof

  //Освобождение редактируемых позиций (новых)
  mdTmpIds.First;
  while not mdTmpIds.Eof do begin
    if (mdTmpIds.FieldByName('sourceid').AsInteger = APosID) and (mdTmpIds.FieldByName('free').AsInteger <> 1)
    then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdTmpIds.FieldByName('posid').AsInteger;
        Open;

        if not IsEmpty then begin
          BM := mdTmpIds.GetBookmark;  //Сохранение текщей позиции
          ASourceId := mdTmpIds.FieldByName('sourceid').AsInteger;
          FAmount := mdTmpIds.FieldByName('amount').AsFloat;
          FPosId := mdTmpIds.FieldByName('posid').AsInteger;
          ATmpId := mdTmpIds.FieldByName('tmpid').AsInteger;

          try
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := ASourceId;
            mdTmpIds.FieldByName('amount').AsFloat := -FAmount;
            mdTmpIds.FieldByName('posid').AsInteger := FPosId;

            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FPosId, Fields[0].AsInteger, Fields[1].AsInteger, 0,
                                                       -FAmount);

            mdTmpIds.FieldByName('free').AsInteger := 1;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;

          finally
            mdTmpIds.GotoBookmark(BM);
            mdTmpIds.FreeBookmark(BM);
          end;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;

    mdTmpIds.Next;
  end;//while not mdTmpIds.Eof

  //2.
  //*******************************************************************
  //Получение остатков на складе
  //GetMatRestsOnWHouse(dmData.SConnection, AMatID, AWID, MaxDateTime, Integer(mdPosition));
  GetMatRestsByKAorWID(dmData.SConnection, AMatID, 0, AWID, MaxDateTime, Integer(mdPosition));

  {if not mdPosition.IsEmpty then
    case ChargeType of
      ctFIFO: mdPosition.SortOnFields('postype;ondate');
      ctLIFO: mdPosition.SortOnFields('postype;ondate',true,true);
  end;
  }

  mdPosition.First;
  FRemain := 0;

  while not mdPosition.Eof do begin
    mdPosition.Edit;
    mdPosition.fieldbyname('amount').AsFloat := RoundToA(mdPosition.fieldbyname('amount').AsFloat, MatDisplayDigits);
    mdPosition.Post;
    FRemain := FRemain + strtofloat(mdPosition.fieldbyname('amount').AsString);
    mdPosition.Next;
  end;//while not Eof

  //3.
  //*******************************************************************
  //    Резерв позиций
  try
    tmpremain := AAmount;
    tmpsumm := 0.0;
    mdRsv.Close;
    mdRsv.Open;

    with mdPosition do begin
      First;

      while not Eof and (tmpremain > 0) do begin
        if (tmpremain <= strtofloat(fieldbyname('amount').AsString)) and (strtofloat(fieldbyname('amount').AsString) > 0)
        then begin
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
          mdRsv.FieldByName('amount').AsFloat := tmpremain;
          tmpsumm := tmpsumm + (tmpremain * strtofloat(FieldByName('price').AsString));

          if not FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
//ShowMessage(mdRsv.FieldByName('SN').AsString);
          end;

          mdRsv.Post;
        end
        else
          if strtofloat(fieldbyname('amount').AsString) > 0 then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
            mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
            mdRsv.FieldByName('amount').AsFloat := strtofloat(FieldByName('amount').AsString);
            tmpsumm := tmpsumm + (strtofloat(FieldByName('amount').AsString) * strtofloat(FieldByName('price').AsString));

            if not FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
              //ShowMessage(mdRsv.FieldByName('SN').AsString);
            end;

            mdRsv.Post;
          end;

        tmpremain := tmpremain - fieldbyname('amount').AsFloat;

        Next;
      end;//while
    end;//with

  Except
    mdRsv.Close;
  end;

  //*******************************************************************
  //Удаление освобождённых позиций
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if (FieldByName('sourceid').AsInteger = APosID) and (FieldByName('free').AsInteger = 1)
      then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
    end;//while not eof
  end;//with

  //*******************************************************************
  //Проверка наличия
  if FRemain >= AAmount then begin
    //Удаление всего резерва для текущего sourceid
    with mdTmpIds do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger=APosID) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end
        else Next;
      end;//while not eof
    end;//with TdxMemData(pointer(stRemain.Tag))

    //Удаление всех записей из mdWMatTurn для текущего sourceid
    with mdWMatTurn do begin
      First;
      while not Eof do begin
        if (fieldbyname('sourceid').AsInteger = APosID)
          then Delete
          else Next;
      end;//while
    end;//with TdxMemData(pointer(panMain.Tag))

    //************* Запись в mdWMatturn новых позиций
    mdRsv.First;
    while not mdRsv.Eof do begin
      //ShowMessage(mdRsv.FieldByName('SN').AsString);
      //Запись в mdWMatTurn
      mdWMatTurn.Append;
      mdWMatTurn.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('matid').AsInteger := AMatID;
      mdWMatTurn.FieldByName('wid').AsInteger := AWID;
      mdWMatTurn.FieldByName('sourceid').AsInteger := APosID;
      mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
      mdWMatTurn.FieldByName('ondate').AsDateTime := 0;

      if not mdRsv.fieldbyname('SN').IsNull then begin
        mdWMatTurn.FieldByName('SN').AsString := mdRsv.fieldbyname('SN').AsString;
        SNs := SNs + mdWMatTurn.FieldByName('SN').AsString + '; ';
      end;

      mdWMatTurn.Post;

      if mdWMatTurnOld.Locate('posid;sourceid', VarArrayOf([mdRsv.fieldbyname('posid').AsInteger, APosID]),[])
      then begin
        mdWMatTurnOld.Edit;
        mdWMatTurnOld.FieldByName('flag').AsInteger := 1;
        mdWMatTurnOld.Post;

        if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
           > RoundToA(strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
        then begin
          {Получить сумму для текущего posid в mdTmpIds}
          with mdTmpIds do begin
            First;
            TmpAmount := 0;

            while not Eof do begin
              if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
                then TmpAmount := RoundToA(TmpAmount + RoundToA(strtofloat(FieldByName('amount').AsString), MatDisplayDigits), MatDisplayDigits);

              Next;
            end;//while not Eof
          end;//with TdxMemData(pointer(stRemain.Tag))

          if TmpAmount < 0 then begin
            if RoundToA(-TmpAmount, MatDisplayDigits)
               > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
            then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разница для себя
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(StrToFloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);

              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,
                                                         strtofloat(mdTmpIds.FieldByName('amount').AsString));

              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;
            end
            else begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Доступное кол-во для себя TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-TmpAmount, MatDisplayDigits);

              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,
                                                         strtofloat(mdTmpIds.FieldByName('amount').AsString));

              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;

              if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits)
              then begin
                mdTmpIds.Append;
                mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
                mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1

                mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
                                                          - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits);

                mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,
                                                           strtofloat(mdTmpIds.FieldByName('amount').AsString));

                mdTmpIds.FieldByName('free').AsInteger := 0;
                mdTmpIds.Post;
              end;//if RoundToA...
            end;//else
          end//if TmpAmount<0
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для всех
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 1;
            mdTmpIds.Post;
          end;//else
        end//if
        else begin
          if 0 <> RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
          then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString)
                  - strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);

            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0, strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end;//if
        end;//else
      end//if mdWMatTurnOld.Locate
      else begin
        //Проверка
        //Получить сумму для текущего posid в mdTmpIds
        with mdTmpIds do begin
          First;
          TmpAmount := 0;
          while not Eof do begin
            if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
              then TmpAmount := RoundToA(TmpAmount + FieldByName('amount').AsFloat, MatDisplayDigits);

            Next;
          end;//while
        end;//with TdxMemData(pointer(stRemain.Tag))

        if TmpAmount < 0 then begin
          if RoundToA(-TmpAmount, MatDisplayDigits) > RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
          then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Всё кол-во для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);

            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,
                        strtofloat(mdTmpIds.FieldByName('amount').AsString));

            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end//if
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Доступное кол-во для себя TmpAmount*-1
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-TmpAmount, MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,strtofloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;

            if RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits) <> 0 then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString) + TmpAmount, MatDisplayDigits);

              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,
                        strtofloat(mdTmpIds.FieldByName('amount').AsString));

              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 1;
              mdTmpIds.Post;
            end;//if
          end;//else
        end//if TmpAmount<0 then begin
        else begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
          mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
          //Всё кол-во для всех
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(strtofloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);

          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,
              strtofloat(mdTmpIds.FieldByName('amount').AsString));

          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 1;
          mdTmpIds.Post;
        end;//else
      end;//else
      mdRsv.Next;
    end;//while not mdRsv.Eof

    //Освобождение оставшихся позиций, старых
    with mdWMatTurnOld do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger = APosID) and (FieldByName('flag').AsInteger <> 1) then begin
          Edit;
          FieldByName('flag').AsInteger := 1;
          Post;
          //Освобождение для себя
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('posid').AsInteger := fieldbyname('posid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := -RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(fieldbyname('posid').AsInteger, AMatID, AWID, 0, -RoundToA(strtofloat(fieldbyname('amount').AsString), MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if
        Next;
      end;//while not Eof

      First;

      while not Eof do begin
        Edit;
        FieldByName('flag').AsInteger := 0;
        Post;
        Next;
      end;//while not eof
    end;//with TdxMemData(pointer(stMeasureName.Tag))
    //?????????????????????????????????????????????????????????????????????????
  end//if FRemain >= dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index]
  else begin
    Result := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  //Запись в SN для WMat
  SNs := System.Copy(SNs, 1, Length(SNs) - 2);
  with mdDet do begin
    BM := GetBookmark;
    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('status').AsInteger := 1;

        if SNs <> '' then FieldByName('sn').AsString := SNs;

        Post;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditAccOut.DoRemoveRsv(APosID: Integer): Boolean;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.DoRemoveRsv') else _udebug := nil;{$ENDIF}

  Result := True;

  while mdWMatTurn.Locate('sourceid', APosID, [] ) do mdWMatTurn.Delete;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if FieldByName('sourceid').AsInteger = APosID then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
     end;
  end;

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = APosID then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-StrToFloat(mdWMatTurnOld.FieldByName('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger, Fields[0].AsInteger, Fields[1].AsInteger, 0, RoundToA(-StrToFloat(mdWMatTurnOld.FieldByName('amount').AsString), MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;
        Close;

      finally
        Free;
      end;
    end;

    mdWMatTurnOld.Next;
  end;

  //Затирание в mdDet SN
  with mdDet do begin
    BM := GetBookmark;

    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('SN').Clear;
        FieldByName('status').AsInteger := 0;
        Post;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdWMatTurnBeforeDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdWMatTurnBeforeDelete') else _udebug := nil;{$ENDIF}

  FDelPosID := DataSet.FieldByName('sourceid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.mdWMatTurnAfterDelete(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.mdWMatTurnAfterDelete') else _udebug := nil;{$ENDIF}

  if (FDelPosID > 0) and not mdWMatTurn.Locate('sourceid', FDelPosID, []) then begin
    mdDet.Edit;
    mdDet.FieldByName('status').AsInteger := 0;
    mdDet.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditAccOut.FillMatsFromWMat(DS: TDataSet);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.FillMatsFromWMat') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Reserving');
  fProgress.pbMain.Max := DS.RecordCount;
  fProgress.Show;
  FShowRsvMsgs := False;
  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;
      DS.DisableControls;
      mdDet.DisableControls;
      mdDet.AfterPost := nil;
      DS.First;
      while not DS.Eof do begin
        fProgress.lText.Caption := DS.FieldByName('name').AsString;
        fProgress.Update;
        FPosID := dsNextPosID(mdDet);
        Append;
        FieldByName('posid').AsInteger := FPosID;
        FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
        FieldByName('postype').AsInteger := DS.Tag;

        if DS.Tag = 0 then FieldByName('status').AsInteger := 0;

        FieldByName('matname').AsString := DS.FieldByName('name').AsString;
        FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
        FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
        FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
        FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;

        if DS.Tag = 0 then begin
          FieldByName('fullprice').AsFloat := DS.FieldByName('fullprice').AsFloat;
          FieldByName('discount').AsFloat := DS.FieldByName('discount').AsFloat;
          FieldByName('wid').AsInteger := DS.FieldByName('wid').AsInteger;
          FieldByName('whname').AsString := DS.FieldByName('whname').AsString;
          FieldByName('currid').AsInteger := cbCurr.KeyValue;
          FieldByName('currname').AsString := cbCurr.Text;
        end
        else begin
          FieldByName('discount').AsFloat := 0;
          FieldByName('norm').AsFloat := 0;
        end;

        if CurrEnt.NDSPayer
          then FieldByName('nds').AsFloat := NDS
          else FieldByName('nds').AsFloat := 0;

        FieldByName('onvalue').AsFloat := edRate.Value;
        FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
        FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;

        if (DS.FindField('ptypeid') <> nil) and (DS.FieldByName('ptypeid').AsInteger > 0)
          then FieldByName('ptypeid').AsInteger := DS.FieldByName('ptypeid').AsInteger;

        Post;
        UpdatePos;

        if DS.Tag = 0
          then DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger,
                        FieldByName('wid').AsInteger, FieldByName('amount').AsFloat);

        DS.Next;
        fProgress.pbMain.StepIt;
        fProgress.Update;
      end;
    end;
    DS.EnableControls;
    FPosModified := True;
    mdDet.EnableControls;
    mdDet.AfterPost := mdDetAfterPost;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo, colStatus]);
    FGridRefresh := True;

    SelectFocusedNode;

  finally
    FShowRsvMsgs := True;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aSetDiscountExecute(Sender: TObject);
  var
    BM: TBookmark;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aSetDiscountExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetDiscount.Create(nil) do
  try
    if ShowModal in [mrOk] then begin
      mdDet.DisableControls;
      BM := mdDet.GetBookmark;

      try
        for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
          if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
          then begin
            mdDet.Edit;
            mdDet.FieldByName('price').AsFloat := mdDet.FieldByName('fullprice').AsFloat * (100 - edDisc.Value) / 100;
            mdDet.FieldByName('discount').AsFloat := edDisc.Value;
            mdDet.Post;
            UpdatePos;
          end;
        end;

      finally
        mdDet.GotoBookmark(BM);
        mdDet.FreeBookmark(BM);
        mdDet.EnableControls;
      end;
      //UpdateActionList;
    end;
    
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  ShowOrdersInfo(edKAgent.KAID, -16, OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lcbPersonNameEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lcbPersonNameEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.lcbPersonNameExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.lcbPersonNameExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.btnPersonNameMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.btnPersonNameMouseDown') else _udebug := nil;{$ENDIF}

  lcbPersonName.SetFocus;
  FCurrCtrl := lcbPersonName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.btnPersonNameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.btnPersonNameMouseUp') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditAccOut.CheckModified: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.CheckModified') else _udebug := nil;{$ENDIF}

  Result := False;

  if EditingDisabled then Exit;

  if (FModified or FPosModified) and (ssMessageDlg(rs('Common', 'DataChangedSave'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)
    then Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    FSummTax, FPosSummTax: Extended;
    j: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.UpdatePos') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FAmount := FieldByName('amount').AsFloat;
    FNorm := FieldByName('norm').AsFloat;

    if FNorm > 0 then FAmount := FAmount * FNorm;

    FPriceCurr := FieldByName('price').AsFloat;
    FNDS := FieldByName('nds').AsFloat;
    FCurrRate := FieldByName('onvalue').AsFloat;

    NDSCalc(FAmount, FPriceCurr, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummWONDS := FSummWithNDS - RoundToA(FSummNDS, -2);
    FPosSummTax := 0;

    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;

    FSummCurr := RoundToA(FAmount * FPriceCurr, -2) + FPosSummTax;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    FPosSummTax := 0;

    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;

    FSummWithNDS := FSummWithNDS + FPosSummTax;

    Edit;
    FieldByName('sumcurr').AsFloat := FSummCurr;
    FieldByName('pricewithnds').AsFloat := FPriceWithNDS;
    FieldByName('pricewonds').AsFloat := FPriceWONDS;
    FieldByName('sumwithnds').AsFloat := FSummWithNDS;
    FieldByName('sumnds').AsFloat := FSummNDS;
    FieldByName('sumwonds').AsFloat := FSummWONDS;
    Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditAccOut.aAddSvcListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditAccOut.aAddSvcListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.Tag := 2;
  DocInfo.OnDate := edDate.Date;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditAccOut', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
