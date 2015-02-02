{$I ok_sklad.inc}
unit fFinance;

interface

uses
  Dialogs, BaseFrame, TB2Item, Menus, ActnList, StdCtrls, ssBevel, ExtCtrls,
  dxExEdtr6, dxCntner6, dxInspct, dxTL6, dxDBCtrl6, dxDBGrid6,
  ssDBGrid, dxDBTLCl6, dxGrClms6, cxContainer, cxEdit, cxTextEdit, cxMemo,
  dxInspRw, cxPC, cxControls, cxDropDownEdit, ssDBLookupCombo,
  cxMaskEdit, cxCalendar, ssSpeedButton, DB, ssMemDS, ssClientDataSet,
  dxDBTL6, DBClient, Tabs, TeeProcs, TeEngine, Chart, Series, cxTrackBar,
  cxCheckBox, ssCheckBox, cxSplitter, Grids, DBGrids,
  JvxSlider,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvExControls, dxExEdtr, dxCntner;

type
  TfmFinance = class(TssBaseFrame)
    aCashWithCharge: TAction;
    aConvert: TAction;
    aGotoDoc: TAction;
    aMove: TAction;
    aNull: TAction;
    aRecalc: TAction;
    aRecalcActives: TAction;
    aRecalcActivesAll: TAction;
    aRecalcAll: TAction;
    aShowCurr: TAction;
    btnKagent: TssSpeedButton;
    bvlActives: TssBevel;
    bvlCash: TssBevel;
    bvlCashless: TssBevel;
    bvlCreditors: TssBevel;
    bvlDebtors: TssBevel;
    bvlWHSumm: TssBevel;
    cdsActives: TssClientDataSet;
    cdsCashDesks: TssClientDataSet;
    cdsChargeType: TssClientDataSet;
    cdsCurr: TssClientDataSet;
    cdsEntAcc: TssClientDataSet;
    cdsEntAccACCID: TIntegerField;
    cdsEntAccACCNUM: TStringField;
    cdsEntAccBANKID: TIntegerField;
    cdsEntAccDEF: TIntegerField;
    cdsEntAccfullname: TStringField;
    cdsEntAccMFO: TStringField;
    cdsEntAccNAME: TStringField;
    cdsEntAccTYPEID: TIntegerField;
    cdsEntAccTYPENAME: TStringField;
    cdsKAgent: TssClientDataSet;
    cdsMain: TssClientDataSet;
    cdsTurnover: TssClientDataSet;
    chbShowActives: TssCheckBox;
    chbShowCash: TssCheckBox;
    chbShowCashless: TssCheckBox;
    chbShowCreditors: TssCheckBox;
    chbShowDebtors: TssCheckBox;
    chbShowGrid: TssCheckBox;
    chbShowWHSumm: TssCheckBox;
    colAcc: TdxDBGridColumn;
    colActID: TdxDBTreeListColumn;
    colActName: TdxDBTreeListColumn;
    colActSaldo: TdxDBTreeListCurrencyColumn;
    colBankName: TdxDBGridColumn;
    colCashName: TdxDBGridColumn;
    colChargeType: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBTreeListColumn;
    colKAID: TdxDBGridColumn;
    colKAName: TdxDBGridColumn;
    colName: TdxDBTreeListColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPayType: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colSaldo: TdxDBTreeListCurrencyColumn;
    colShortName: TdxDBGridColumn;
    colTOID: TdxDBGridColumn;
    colTotal: TdxDBGridColumn;
    colTotalDef: TdxDBGridColumn;
    crtActives: TChart;
    CurrencyField1: TCurrencyField;
    cxSplitter1: TcxSplitter;
    edACFromDate: TcxDateEdit;
    edACToDate: TcxDateEdit;
    edFromDate: TcxDateEdit;
    edToDate: TcxDateEdit;
    grdTurnOver: TssDBGrid;
    inspCurr: TdxInspector;
    inspCurrRow1: TdxInspectorTextRow;
    inspCurrRow2: TdxInspectorTextRow;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    lACFrom: TLabel;
    lACTo: TLabel;
    lcbCurr: TssDBLookupCombo;
    lcbCurrency: TssDBLookupCombo;
    lcbKAgent: TssDBLookupCombo;
    lCurr: TLabel;
    lFromDate: TLabel;
    lKAgent: TLabel;
    lToDate: TLabel;
    lTotal: TLabel;
    mdActives: TssMemoryData;
    mdMain: TssMemoryData;
    mdMainid: TIntegerField;
    mdMainiindex: TIntegerField;
    mdMainname: TStringField;
    mdMainpid: TIntegerField;
    mdMainsaldo: TCurrencyField;
    mdTurnOver: TssMemoryData;
    mdTurnOveraccnum: TStringField;
    mdTurnOverbankname: TStringField;
    mdTurnOvercashname: TStringField;
    mdTurnOverchargename: TStringField;
    mdTurnOverchecked: TIntegerField;
    mdTurnOverdoctype: TIntegerField;
    mdTurnOverkaid: TIntegerField;
    mdTurnOverkaname: TStringField;
    mdTurnOvernum: TStringField;
    mdTurnOverondate: TDateTimeField;
    mdTurnOveronvalue: TFloatField;
    mdTurnOverpaydocid: TIntegerField;
    mdTurnOverptypename: TStringField;
    mdTurnOvershortname: TStringField;
    mdTurnOvertotal: TCurrencyField;
    mdTurnOvertotaldef: TCurrencyField;
    panActChartFilter: TPanel;
    panChartOptions: TPanel;
    panCurrTotal: TPanel;
    panData: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    panFilter: TPanel;
    panMain: TPanel;
    panSaldo: TPanel;
    pcFin: TcxPageControl;
    pcMain: TcxPageControl;
    pmActChart: TTBPopupMenu;
    pmActives: TTBPopupMenu;
    pmDet: TTBPopupMenu;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    sldMinMax: TJvxSlider;
    sldTopBottom: TJvxSlider;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    srcActives: TDataSource;
    srcActivesChart: TDataSource;
    srcChargeType: TDataSource;
    srcCurr: TDataSource;
    srcKAgent: TDataSource;
    srcMain: TDataSource;
    srcTurnOver: TDataSource;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    ssBevel17: TssBevel;
    ssBevel18: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    StringField1: TStringField;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem17: TTBItem;
    TBItem20: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    tlActives: TdxDBTreeList;
    tlMain: TdxDBTreeList;
    tsActChart: TcxTabSheet;
    tsActives: TcxTabSheet;
    tsFinance: TcxTabSheet;
    tsTurnover: TcxTabSheet;
    txtSaldoDate: TssBevel;
    txtSaldoNA: TssBevel;
    txtTONA: TssBevel;
    txtTotal: TssBevel;

    procedure aCashWithChargeExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure aConvertExecute(Sender: TObject);
    procedure aGotoDocExecute(Sender: TObject);
    procedure aMoveExecute(Sender: TObject);
    procedure aRecalcActivesAllExecute(Sender: TObject);
    procedure aRecalcActivesExecute(Sender: TObject);
    procedure aRecalcExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure bvlActivesClick(Sender: TObject);
    procedure cdsActivesBeforeOpen(DataSet: TDataSet);
    procedure cdsCurrAfterOpen(DataSet: TDataSet);
    procedure cdsCurrBeforeOpen(DataSet: TDataSet);
    procedure cdsEntAccCalcFields(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsTurnoverBeforeOpen(DataSet: TDataSet);
    procedure chbShowActivesClick(Sender: TObject);
    procedure chbShowCashClick(Sender: TObject);
    procedure chbShowCashlessClick(Sender: TObject);
    procedure chbShowCreditorsClick(Sender: TObject);
    procedure chbShowDebtorsClick(Sender: TObject);
    procedure chbShowGridClick(Sender: TObject);
    procedure chbShowWHSummClick(Sender: TObject);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colKANameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colSaldoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure crtActivesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure crtActivesStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure grdTurnOverColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdTurnOverCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdTurnOverGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdTurnOverNeedAdjust(Sender: TObject);
    procedure inspCurrDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure inspCurrDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure inspCurrDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspCurrDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspCurrStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCurrPropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure pcFinChange(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure sldMinMaxChange(Sender: TObject);
    procedure sldTopBottomChange(Sender: TObject);
    procedure srcMainDataChange(Sender: TObject; Field: TField);
    procedure tlActivesChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure tlActivesColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
    procedure tlActivesCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tlMainChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure tlMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tlMainDblClick(Sender: TObject);
    procedure tlMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tlMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tlMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tlMainStartDrag(Sender: TObject; var DragObject: TDragObject);

  private
    FCash: Boolean;
    Opened: Boolean;
    F: Boolean;
    FFromNode: TdxInspectorNode;
    FFromTreeNode: TdxTreeListNode;
    FCanSelect: Boolean;
    FActivesLastDate: TDateTime;
    FActivesLoaded: Boolean;
    FP: TPoint;

    procedure inspDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure RealignFilter;
    procedure LoadData(ARoot: Integer);
    procedure BuildActives;
    function GetDSSummF(DS: TDataSet; const AFieldName: string; const ACondFName: string; ACondValue: Variant; ACurrID: Integer = 0; AGetRate: Boolean = False): Extended;
    procedure GetCurr;
    procedure RefreshDetail;
    procedure SetNA;
    procedure RefreshChart;

  protected
    FMinY, FMaxY, FCMinY, FCMaxY: Extended;
    procedure SetCurrentID(const Value: integer); override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure MoveMoney(AType, AFromCashID, AFromAccID, AToCashID, AToAccID, AFromCurr, AToCurr: Integer);

  public
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoSetFocus; override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
    procedure NotifyChanged; override;
    procedure DoHelp; override;
  end;

var
  fmFinance: TfmFinance;

implementation

uses
  ClientData, ssFun, prFun, prConst, ssBaseConst, ssDateUtils,
  ssStrUtil, ssRegUtils, okDateUtils, prTypes, DateUtils, EditMoneyMove, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfmFinance.DoOpen(AParam: Variant);
  var
    intTmp, i: Integer;
    dtTmp: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoOpen') else _udebug := nil;{$ENDIF}

  edFromDate.Date := IncDay(Date, -7);  
  edToDate.Date := Self.OnDate;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'FinPage', intTmp)
    then pcFin.ActivePageIndex := intTmp;

  if (pcFin.ActivePage = tsFinance) then begin
    tsTurnover.TabVisible := True;
    tsActChart.TabVisible := False;
    pcMain.ActivePage := tsTurnover;
  end
  else begin
    tsTurnover.TabVisible := False;
    tsActChart.TabVisible := True;
    pcMain.ActivePage := tsActChart;
  end;

  Splitter2.Visible := not ModalView;
  pcMain.Visible := not ModalView;

  if ModalView then begin
    pcFin.ActivePage := tsFinance;
    tsActives.TabVisible := False;
    tsFinance.TabVisible := False;
  end;

  RefType := rtFinances;

  if ModalView then inspCurr.DragMode := dmManual;
  if ModalView then tlMain.DragMode := dmManual;

  inherited DoOpen(AParam);

  tlMain.HideSelectionColor := GridHideSelColor;
  cdsCurr.Open;
  CanRefresh := False;
  lcbCurrency.KeyValue := BaseCurrID;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'TOHeight', intTmp) then pcMain.Height := intTmp;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'SaldoWidth', intTmp) then panSaldo.Width := intTmp;

  if ReadFromRegDate(MainRegKey + '\' + Self.Name, 'ACFromDate', dtTmp)
    then begin
      if dtTmp = 0
        then edACFromDate.EditValue := Null
        else edACFromDate.Date := dtTmp;
    end
    else edACFromDate.EditValue := Null;

  edACToDate.Date := Self.OnDate;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series0', intTmp) then chbShowActives.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series1', intTmp) then chbShowWHSumm.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series2', intTmp) then chbShowCash.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series3', intTmp) then chbShowCashless.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series4', intTmp) then chbShowDebtors.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series5', intTmp) then chbShowCreditors.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ShowGrid', intTmp)then chbShowGrid.Checked := (intTmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series0Color', intTmp) then begin
    crtActives.Series[0].SeriesColor := intTmp;
    bvlActives.Color := intTmp;
    bvlActives.ColorInner := intTmp;
    bvlActives.ColorOuter := intTmp;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series1Color', intTmp) then begin
    crtActives.Series[1].SeriesColor := intTmp;
    bvlWHSumm.Color := intTmp;
    bvlWHSumm.ColorInner := intTmp;
    bvlWHSumm.ColorOuter := intTmp;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series2Color', intTmp) then begin
    crtActives.Series[2].SeriesColor := intTmp;
    bvlCash.Color := intTmp;
    bvlCash.ColorInner := intTmp;
    bvlCash.ColorOuter := intTmp;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series3Color', intTmp) then begin
    crtActives.Series[3].SeriesColor := intTmp;
    bvlCashless.Color := intTmp;
    bvlCashless.ColorInner := intTmp;
    bvlCashless.ColorOuter := intTmp;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series4Color', intTmp) then begin
    crtActives.Series[4].SeriesColor := intTmp;
    bvlDebtors.Color := intTmp;
    bvlDebtors.ColorInner := intTmp;
    bvlDebtors.ColorOuter := intTmp;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Series5Color', intTmp) then begin
    crtActives.Series[5].SeriesColor := intTmp;
    bvlCreditors.Color := intTmp;
    bvlCreditors.ColorInner := intTmp;
    bvlCreditors.ColorOuter := intTmp;
  end;

  Opened := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.DoRefresh(const AID: integer; AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoRefresh') else _udebug := nil;{$ENDIF}

  try // finally
    UpdateActionList;

    case AParam of
      {utvID_Cash = 61;   //  Наличные деньги
      utvID_Finance = 62; //  Финансы
      utvID_CashLess = 63;//  Безналичные деньги
      }
      -61, -62, -63: GrpID := AParam;

      -1, -2: GrpID := AID;

      Integer(rtKAgent):
        begin
          CanRefresh := False;
          DSRefresh(cdsKAgent, 'kaid', 0);
          CanRefresh := True;
          lcbKAgent.KeyValue := AID;
          Exit;
        end;

      Integer(rtMoneyMove): RefreshFun('TfmMoneyMove', 0);
    end;

    if AParam <> 0 then FCash := (AParam = -1);

    if pcFin.ActivePage = tsFinance then begin
      CanRefresh := False;
      LoadData(GrpID);
      NeedRefresh := False;
      CanRefresh := True;
      RefreshDetail;
    end
    else BuildActives;

    if aShowCurr.Checked then begin
      GetCurr;
      lcbCurrencyPropertiesEditValueChanged(lcbCurrency);
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmFinance.inspCurrDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspCurrDrawCaption') else _udebug := nil;{$ENDIF}

  if Odd(Sender.Node.Index)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmFinance.GetDSSummF(DS: TDataSet; const AFieldName, ACondFName: string; ACondValue: Variant; ACurrID: Integer = 0; AGetRate: Boolean = False): Extended;
  var
    BM: TBookmark;
    FRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.GetDSSummF') else _udebug := nil;{$ENDIF}

  Result := 0;
  BM := DS.GetBookmark;

  try
    DS.First;
    while not DS.Eof do begin
      FRate := 1;

      if ACurrID = 0 then FRate := DS.FieldByName('onvalue').AsFloat;

      if (ACurrID = 0) or (ACurrID = DS.FieldByName('currid').AsInteger) then begin
        if ACondFName <> EmptyStr then begin
          if DS.FieldByName(ACondFName).AsVariant = ACondValue
            then Result := Result + RoundToA(DS.FieldByName(AFieldName).AsCurrency * FRate, -2);
        end
        else Result := Result + RoundToA(DS.FieldByName(AFieldName).AsCurrency * FRate, -2);
      end;
      DS.Next;
    end;

  finally
    DS.GotoBookmark(BM);
    DS.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.LoadData(ARoot: Integer);
  var
    FOldID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  procedure GetRoot(DS: TDataSet);
  begin
    mdMain.Append;
    mdMain.FieldByName('id').AsInteger := -62;
    mdMain.FieldByName('iindex').AsInteger := 169;
    mdMain.FieldByName('pid').AsInteger := -62;
    mdMain.FieldByName('name').AsString := rs(Self.Name, 'Finance');
    mdMain.FieldByName('saldo').AsCurrency := GetDSSummF(DS, 'saldo', '', 0);
    mdMain.Post;
  end;

  procedure GetSubRootCash(DS: TDataSet; AFromRoot: Boolean);
  begin
    mdMain.Append;
    mdMain.FieldByName('id').AsInteger := -61;
    mdMain.FieldByName('iindex').AsInteger := 167;

    if AFromRoot
      then mdMain.FieldByName('pid').AsInteger := -62
      else mdMain.FieldByName('pid').AsInteger := -61;

    mdMain.FieldByName('name').AsString := rs(Self.Name, 'Cash');
    mdMain.FieldByName('saldo').AsCurrency := GetDSSummF(DS, 'saldo', 'saldotype', 0);
    mdMain.Post;
  end;

  procedure GetSubRootCashless(DS: TDataSet; AFromRoot: Boolean);
  begin
    mdMain.Append;
    mdMain.FieldByName('id').AsInteger := -63;
    mdMain.FieldByName('iindex').AsInteger := 170;

    if AFromRoot
      then mdMain.FieldByName('pid').AsInteger := -62
      else mdMain.FieldByName('pid').AsInteger := -63;

    mdMain.FieldByName('name').AsString := rs(Self.Name, 'Cashless');
    mdMain.FieldByName('saldo').AsCurrency := GetDSSummF(DS, 'saldo', 'saldotype', 1);
    mdMain.Post;
  end;

  procedure GetCash(DS: TDataSet; AID: Integer = 0);
  begin
    with cdsCashDesks do begin
      First;
      while not Eof do begin
        if (AID > 0) and (FieldByName('cashid').AsInteger <> AID) then begin
          Next;
          Continue;
        end;

        if not mdMain.Locate('id', FieldByName('cashid').AsInteger, []) then begin
          mdMain.Append;
          mdMain.FieldByName('id').AsInteger := FieldByName('cashid').AsInteger;
          mdMain.FieldByName('iindex').AsInteger := 167;
          mdMain.FieldByName('pid').AsInteger := -61;
          mdMain.FieldByName('name').AsString := FieldByName('name').AsString;
          mdMain.FieldByName('saldo').AsCurrency := GetDSSummF(DS, 'saldo', 'cashid', FieldByName('cashid').AsInteger);
          mdMain.Post;
        end;
        Next;

      end;
    end;
  end;

  procedure GetCashless(DS: TDataSet; AID: Integer = 0);
  begin
    with cdsEntAcc do begin
      First;
      while not Eof do begin
        if (AID > 0) and (FieldByName('accid').AsInteger <> AID) then begin
          Next;
          Continue;
        end;

        if not mdMain.Locate('id', -(FieldByName('accid').AsInteger + 1000000), []) then begin
          mdMain.Append;
          mdMain.FieldByName('id').AsInteger := -(FieldByName('accid').AsInteger + 1000000);
          mdMain.FieldByName('iindex').AsInteger := 81;
          mdMain.FieldByName('pid').AsInteger := -63;
          mdMain.FieldByName('name').AsString := FieldByName('fullname').AsString;
          mdMain.FieldByName('saldo').AsCurrency := GetDSSummF(DS, 'saldo', 'accid', FieldByName('accid').AsInteger);
          mdMain.Post;
        end;
        Next;

      end;
    end;
  end;

//--------------------------------------------------------------------------------
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.LoadData') else _udebug := nil;{$ENDIF}

  if mdMain.IsEmpty
    then FOldID := 0
    else FOldID := mdMain.FieldByName('id').AsInteger;

  mdMain.Close;
  mdMain.Open;

  DSRefresh(cdsMain, 'accid', 0);
  DSRefresh(cdsEntAcc, 'accid', 0);
  DSRefresh(cdsCashDesks, 'cashid', 0);
  Screen.Cursor := crSQLWait;

  with cdsMain do
  try
    case ARoot of
      -62:begin
            GetRoot(Fields[0].DataSet);
            GetSubRootCash(Fields[0].DataSet, True);
            GetSubRootCashless(Fields[0].DataSet, True);
            GetCash(Fields[0].DataSet);
            GetCashless(Fields[0].DataSet);
          end;

      -61:begin
            GetSubRootCash(Fields[0].DataSet, False);
            GetCash(Fields[0].DataSet);
          end;

      -63:begin
            GetSubRootCashless(Fields[0].DataSet, False);
            GetCashless(Fields[0].DataSet);
          end

      else if FCash
           then GetCash(Fields[0].DataSet, GrpID)
           else GetCashless(Fields[0].DataSet, GrpID);
    end;

    if FOldID = 0
      then mdMain.First
      else mdMain.Locate('id', FOldID, []);

  finally
    Screen.Cursor := crDefault;
  end;

  SetNA;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.RealignFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.RealignFilter') else _udebug := nil;{$ENDIF}

  lcbCurr.Left := panFilter.Width - lcbCurr.Width - 5;
  lcbCurr.Anchors := [akRight, akTop];

  lCurr.Left := lcbCurr.Left - lCurr.Width - 5;
  lCurr.Anchors := [akRight, akTop];

  btnKagent.Left := lCurr.Left - btnKagent.Width - 4;

  lcbKAgent.Width := btnKagent.Left - lcbKAgent.Left - 2;
  lcbKAgent.Anchors := [akRight, akTop, akLeft];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aMove.Caption := GetRS('fmFinance', 'Move');
    aConvert.Caption := GetRS('fmFinance', 'Convert');
    aCashWithCharge.Caption := GetRS('fmFinance', 'CashWithCharge');
    aGotoDoc.Caption := GetRS('Common', 'Jump');
    aRecalcActives.Caption := GetRS('fmFinance', 'RecalcActives');
    aRecalcActivesAll.Caption := GetRS('fmFinance', 'RecalcActivesByPeriod');
    aRecalc.Caption := GetRS('fmWMat', 'RecalcRemains');
    aNull.Caption := GetRS(Self.Name, 'aNull');
    aRecalcAll.Caption := GetRS(Self.Name, 'RecalcAll');

    btnKagent.Hint := GetRS('fmPayDoc', 'KAgentRef');

    chbShowGrid.Properties.Caption := GetRS('fmFinance', 'ShowGrid');
    chbShowActives.Properties.Caption := GetRS('fmFinance', 'Actives');
    chbShowWHSumm.Properties.Caption := GetRS('fmFinance', 'WH');
    chbShowCash.Properties.Caption := GetRS('fmFinance', 'CashEx');
    chbShowCashless.Properties.Caption := GetRS('fmFinance', 'CashlessEx');
    chbShowDebtors.Properties.Caption := GetRS('fmFinance', 'Debtors');
    chbShowCreditors.Properties.Caption := GetRS('fmFinance', 'Creditors');

    colActName.Caption := GetRS(Self.Name, 'SectionName');
    colActSaldo.Caption := GetRS(Self.Name, 'Summ') + ', ' + BaseCurrName;
    colName.Caption := GetRS(Self.Name, 'SectionName');
    colSaldo.Caption := GetRS(Self.Name, 'Summ') + ', ' + BaseCurrName;
    colCashName.Caption := GetRS('fmPayDoc', 'CashDesk');
    colKAName.Caption := GetRS('fmPayDoc', 'KAgent');
    colOnDate.Caption := GetRS('fmPayDoc', 'Date');
    colPayType.Caption := GetRS('fmPayDoc', 'PayType');
    colTotal.Caption := GetRS('fmPayDoc', 'Total');
    colDocType.Caption := '';
    colTotalDef.Caption := GetRS('fmPayDoc', 'Summ') + ', ' + BaseCurrName;
    colNum.Caption := GetRS('fmPayDoc', 'DocNum');
    colAcc.Caption := GetRS('fmPayDoc', 'Account');
    colChargeType.Caption := GetRS('fmPayDoc', 'ChargeTypeOut');
    colRate.Caption := GetRS('fmPayDoc', 'Rate');
    colShortName.Caption := GetRS('fmPayDoc', 'Currency');

    lACFrom.Caption := GetRS('fmPayDoc', 'FromDate');
    lACTo.Caption := GetRS('fmPayDoc', 'ToDate');

    tsTurnover.Caption := GetRS(Self.Name, 'Turnover');
    tsActChart.Caption := GetRS(Self.Name, 'ActChart');
    tsActives.Caption := GetRS(Self.Name, 'Actives');
    tsFinance.Caption := GetRS(Self.Name, 'Finance');

    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');
    lcbCurr.DisplayEmpty := GetRS('Common', 'All');
    lCurr.Caption := GetRS('Common', 'Currency');
    lFromDate.Caption := RS('fmPayDoc', 'FromDate');
    lKAgent.Caption := GetRS('fmPayDoc', 'KAgent');
    lToDate.Caption := RS('fmPayDoc', 'ToDate');
    lTotal.Caption := GetRS(Self.Name, 'TotalIn');

    txtSaldoNA.Caption := GetRS('Common', 'NotInThisVer');
    txtTONA.Caption := GetRS('Common', 'NotInThisVer');

    if pcFin.ActivePage = tsFinance
      then txtSaldoDate.Caption := rs(Self.Name, 'SaldoOn', 3) + okDateToStr(LangMan, Self.OnDate)
      else txtSaldoDate.Caption := rs(Self.Name, 'ActivesOn', 3) + okDateToStr(LangMan, Self.OnDate);

    FTitle := rs('fmFinance', 'Finance');
    Self.Caption := FTitle;
    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);
  end;

  RealignFilter;

  if Self.Visible then BuildActives;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsEntAccCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsEntAccCalcFields') else _udebug := nil;{$ENDIF}

  cdsEntAcc.FieldByName('fullname').AsString := cdsEntAcc.FieldByName('accnum').AsString + ' (' + cdsEntAcc.FieldByName('name').AsString + ') ';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colID.Index] = -61) or (ANode.Values[colID.Index] = -63) or (ANode.Values[colID.Index] = -62)
  then begin
    AFont.Style := [fsBold];
    if not ASelected then AColor := GridOddLinesColor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colSaldoCustomDrawCell') else _udebug := nil;{$ENDIF}

  if ANode.Values[colSaldo.Index] < 0 then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainChangeNode') else _udebug := nil;{$ENDIF}

  if aShowCurr.Checked and CanRefresh then GetCurr;

  if CanRefresh then RefreshDetail;

  SetNA;

  if ((Node.Values[colID.Index] > 0) or (Abs(Node.Values[colID.Index]) >= 1000000)) and FCanSelect
    then FCurrentID := Trunc(Abs(Node.Values[colID.Index]))
    else FCurrentID := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.GetCurr;
  var
    FRow: TdxInspectorTextRow;
    FSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function CurrExist(ACurrID: Integer): Boolean;
    var i: Integer;
  begin
    Result := False;

    for i := 0 to inspCurr.Count - 1 do
      if inspCurr.Rows[i].Tag = ACurrID then begin
        Result := True;
        Exit;
      end;
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.GetCurr') else _udebug := nil;{$ENDIF}

  inspCurr.ClearRows;

  if pcFin.ActivePage = tsFinance then begin
    with cdsMain do begin
      cdsMain.First;

      while not Eof do begin
        if not CurrExist(FieldByName('currid').AsInteger) then begin
          FRow := TdxInspectorTextRow.Create(inspCurr);
          FRow.Inspector := inspCurr;
          cdsCurr.Locate('currid', FieldByName('currid').AsInteger, []);
          FRow.Caption := FieldByName('shortname').AsString + ' (' + FormatFloat(',0.00000', cdsCurr.FieldByName('onvalue').AsFloat) + ')';
          FRow.Tag := FieldByName('currid').AsInteger;
          FRow.Alignment := taRightJustify;
          FRow.ReadOnly := True;
          FRow.OnDrawValue := inspDrawValue;

          case mdMain.FieldByName('id').AsInteger of
            -62: FSumm := GetDSSummF(cdsMain, 'saldo', '', 0, FRow.Tag);
            -61: FSumm := GetDSSummF(cdsMain, 'saldo', 'saldotype', 0, FRow.Tag);
            -63: FSumm := GetDSSummF(cdsMain, 'saldo', 'saldotype', 1, FRow.Tag);
            else if mdMain.FieldByName('id').AsInteger <= -1000000
                   then FSumm := GetDSSummF(cdsMain, 'saldo', 'accid', -(mdMain.FieldByName('id').AsInteger + 1000000), FRow.Tag)
                   else FSumm := GetDSSummF(cdsMain, 'saldo', 'cashid', mdMain.FieldByName('id').AsInteger, FRow.Tag)
          end;

          FRow.Text := FormatFloat(MoneyDisplayFormat, FSumm);
        end;

        Next;
      end;
    end;
  end
  else begin
    FRow := TdxInspectorTextRow.Create(inspCurr);
    FRow.Inspector := inspCurr;
    FRow.Caption := BaseCurrName;
    FRow.Tag := BaseCurrID;
    FRow.Alignment := taRightJustify;
    FRow.ReadOnly := True;
    FRow.OnDrawValue := inspDrawValue;
    FSumm := mdActives.FieldByName('saldo').AsCurrency;
    FRow.Text := FormatFloat(MoneyDisplayFormat, FSumm);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.SetOnDate') else _udebug := nil;{$ENDIF}
        
  inherited;

  if pcFin.ActivePage = tsFinance
    then txtSaldoDate.Caption := rs(Self.Name, 'SaldoOn',3) + okDateToStr(LangMan, Self.OnDate)
    else txtSaldoDate.Caption := rs(Self.Name, 'ActivesOn',3) + okDateToStr(LangMan, Self.OnDate);

  DSRefresh(cdsCurr, 'currid', 0);

  if CanRefresh then begin
    aRefresh.Execute;
    if pcFin.ActivePage = tsFinance then mdActives.Close;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMain.Params.ParamByName('ondate').AsDateTime := Self.OnDate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.inspDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspDrawValue') else _udebug := nil;{$ENDIF}

  try
    if StrToFloat(DelChars(AText, [ThousandSeparator])) < 0 then AFont.Color := clRed;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.inspCurrDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspCurrDrawValue') else _udebug := nil;{$ENDIF}

  if Odd(Sender.Node.Index)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
  var
    FSumm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.lcbCurrencyPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not CanRefresh then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if pcFin.ActivePage = tsFinance then begin
    case mdMain.FieldByName('id').AsInteger of
      -62: FSumm := GetDSSummF(cdsMain, 'saldo', '', 0, 0, True);
      -61: FSumm := GetDSSummF(cdsMain, 'saldo', 'saldotype', 0, 0, True);
      -63: FSumm := GetDSSummF(cdsMain, 'saldo', 'saldotype', 1, 0, True);
      else if mdMain.FieldByName('id').AsInteger <= -1000000
           then FSumm := GetDSSummF(cdsMain, 'saldo', 'accid', -(mdMain.FieldByName('id').AsInteger + 1000000), 0, True)
           else FSumm := GetDSSummF(cdsMain, 'saldo', 'cashid', mdMain.FieldByName('id').AsInteger, 0, True);
    end; //case
  end
  else begin
    FSumm := mdActives.FieldByName('saldo').AsCurrency;
  end;

  cdsCurr.Locate('currid', lcbCurrency.KeyValue, []);

  if not cdsCurr.FieldByName('onvalue').IsNull and (0 <> cdsCurr.FieldByName('onvalue').asFloat)
    then FSumm := RoundToA(FSumm / cdsCurr.FieldByName('onvalue').AsFloat, -2);

  txtTotal.Caption := FormatFloat(MoneyDisplayFormat, FSumm);

  if FSumm < 0
    then txtTotal.Font.Color := clRed
    else txtTotal.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsCurrBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsCurrBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsCurr.Params.ParamByName('ondate').AsDateTime := Self.OnDate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.srcMainDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.srcMainDataChange') else _udebug := nil;{$ENDIF}

  lcbCurrencyPropertiesEditValueChanged(lcbCurrency);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoClose') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'TOHeight', pcMain.Height);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'SaldoWidth', panSaldo.Width);

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'FinPage', pcFin.ActivePageIndex);
  WriteToRegDate(MainRegKey + '\' + Self.Name, 'FromDate', edFromDate.Date);
  WriteToRegDate(MainRegKey + '\' + Self.Name, 'ACFromDate', edACFromDate.Date);

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series0', Integer(chbShowActives.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series1', Integer(chbShowWHSumm.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series2', Integer(chbShowCash.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series3', Integer(chbShowCashless.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series4', Integer(chbShowDebtors.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series5', Integer(chbShowCreditors.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ShowGrid', Integer(chbShowGrid.Checked));

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series0Color', crtActives.Series[0].SeriesColor);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series1Color', crtActives.Series[1].SeriesColor);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series2Color', crtActives.Series[2].SeriesColor);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series3Color', crtActives.Series[3].SeriesColor);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series4Color', crtActives.Series[4].SeriesColor);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Series5Color', crtActives.Series[5].SeriesColor);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsCurrAfterOpen(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsCurrAfterOpen') else _udebug := nil;{$ENDIF}

  lcbCurr.KeyValue := BaseCurrID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmFinance.RefreshDetail;
  var
    FMaxx: Integer;
    m: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if not pcMain.Visible or ModalView then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.RefreshDetail') else _udebug := nil;{$ENDIF}

  (*{$IFDEF LITE}
  if (tlMain.FocusedNode <> nil) and
     (tlMain.FocusedNode.Values[colID.Index] <> -63) and
     (tlMain.FocusedNode.Values[colID.Index] > -1000000)
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  {$ENDIF}
  *)

  if pcMain.ActivePage = tsTurnover then begin
    DSRefresh(cdsTurnover, 'id', 0);

    {with newDataSet do
    try
      mdTurnOver.DisableControls;
      ProviderName := 'pMoneySaldo_Get';
      FetchParams;
      Params.ParamByName('ondate').AsDateTime := edFromDate.Date;
      Open;
      mdTurnOver.Close;
      mdTurnOver.Open;
      if (mdMain.FieldByName('pid').AsInteger = -61) or (mdMain.FieldByName('id').AsInteger = -61) then begin
        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -100;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'StartSaldo');
        if edFromDate.Date > 0 then
          mdTurnOver.FieldByName('ondate').AsDateTime := edFromDate.Date;
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          if (mdMain.FieldByName('id').AsInteger > 0) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0);
          end;
          //mdTurnOver.FieldByName('totaldef').AsCurrency := mdTurnOver.FieldByName('total').AsCurrency;
        end
        else begin
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          if (mdMain.FieldByName('id').AsInteger > 0) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'cashid', mdMain.FieldByName('id').AsInteger, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger, lcbCurr.KeyValue)
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'saldotype', 0, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0, lcbCurr.KeyValue);
          end;
        end;
        mdTurnOver.Post;
        Close;

        ProviderName := 'pPayDoc_CashTurnover';
        FetchParams;
        FetchMacros;
        Params.ParamByName('fromdate').AsDateTime := edFromDate.Date;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date);
        m := '';
        if (mdMain.FieldByName('id').AsInteger > 0)
          then m := m + ' and cd.cashid=' + mdMain.FieldByName('id').AsString;
        if lcbCurr.KeyValue <> lcbCurr.EmptyValue
          then m := m + ' and pd.currid=' + IntToStr(lcbCurr.KeyValue);
        if lcbKAgent.KeyValue <> lcbKAgent.EmptyValue
          then m := m + ' and pd.kaid=' + IntToStr(lcbKAgent.KeyValue);
        Macros.ParamByName('m').AsString := m;
        Open;
        while not Eof do begin
          FMaxx := GetMax(mdTurnOver, 'id') + 1;
          mdTurnover.Append;
          mdTurnOver.FieldByName('id').AsInteger := FMaxx;
          mdTurnOver.FieldByName('paydocid').AsInteger := FieldByName('paydocid').AsInteger;
          mdTurnOver.FieldByName('checked').AsInteger := FieldByName('checked').AsInteger;
          mdTurnOver.FieldByName('doctype').AsInteger := FieldByName('doctype').AsInteger;
          case FieldByName('doctype').AsInteger of
            -3, 3: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperMove');
            -4, 4: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperConvert');
            -5, 5: mdTurnOver.FieldByName('kaname').AsString := rs('fmMoneyMove', 'CashWithCharge');
            else mdTurnOver.FieldByName('kaname').AsString := FieldByName('kaname').AsString;
          end;
          mdTurnOver.FieldByName('kaid').AsInteger := FieldByName('kaid').AsInteger;
          mdTurnOver.FieldByName('ptypename').AsString := FieldByName('ptypename').AsString;
          mdTurnOver.FieldByName('chargename').AsString := FieldByName('chargename').AsString;
          mdTurnOver.FieldByName('cashname').AsString := FieldByName('cashname').AsString;
          mdTurnOver.FieldByName('shortname').AsString := FieldByName('shortname').AsString;
          mdTurnOver.FieldByName('total').AsCurrency := FieldByName('total').AsCurrency;
          mdTurnOver.FieldByName('totaldef').AsCurrency :=
            RoundToA(FieldByName('total').AsCurrency * FieldByName('onvalue').AsFloat, -2);
          mdTurnOver.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          mdTurnOver.FieldByName('num').AsString := FieldByName('docnum').AsString;
          mdTurnOver.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
          mdTurnOver.Post;
          Next;
        end;
        Close;

        ProviderName := 'pMoneySaldo_Get';
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        Open;

        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -200;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'EndSaldo');
        if Trim(edToDate.Text) <> '' then
          mdTurnOver.FieldByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          if (mdMain.FieldByName('id').AsInteger > 0) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0);
          end;
        end
        else begin
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          if (mdMain.FieldByName('id').AsInteger > 0) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'cashid', mdMain.FieldByName('id').AsInteger, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'cashid', mdMain.FieldByName('id').AsInteger, lcbCurr.KeyValue);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'saldotype', 0, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 0, lcbCurr.KeyValue);
          end;
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
        end;
        mdTurnOver.Post;

        Close;
      end else
      if (mdMain.FieldByName('pid').AsInteger = -63) or (mdMain.FieldByName('id').AsInteger = -63) then begin
        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -100;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'StartSaldo');
        if edFromDate.Date > 0 then
          mdTurnOver.FieldByName('ondate').AsDateTime := edFromDate.Date;
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid',  - mdMain.FieldByName('id').AsInteger - 1000000);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid',  - mdMain.FieldByName('id').AsInteger - 1000000);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1);
          end;
        end
        else begin
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000) then begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000, lcbCurr.KeyValue);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldo', 'saldotype', 1, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency :=
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1, lcbCurr.KeyValue);
          end;
        end;
        mdTurnOver.Post;
        Close;

        ProviderName := 'pPayDoc_CashlessTurnover';
        FetchParams;
        FetchMacros;
        Params.ParamByName('fromdate').AsDateTime := edFromDate.Date;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date);
        m := '';
        if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000)
          then m := m + ' and pd.accid=' + IntToStr(- mdMain.FieldByName('id').AsInteger - 1000000);
        if lcbCurr.KeyValue <> lcbCurr.EmptyValue
          then m := m + ' and pd.currid=' + IntToStr(lcbCurr.KeyValue);
        if lcbKAgent.KeyValue <> lcbKAgent.EmptyValue
          then m := m + ' and pd.kaid=' + IntToStr(lcbKAgent.KeyValue);
        Macros.ParamByName('m').AsString := m;
        Open;
        while not Eof do begin
          FMaxx := GetMax(mdTurnOver, 'id') + 1;
          mdTurnover.Append;
          mdTurnOver.FieldByName('id').AsInteger := FMaxx;
          mdTurnOver.FieldByName('paydocid').AsInteger := FieldByName('paydocid').AsInteger;
          mdTurnOver.FieldByName('checked').AsInteger := FieldByName('checked').AsInteger;
          mdTurnOver.FieldByName('doctype').AsInteger := FieldByName('doctype').AsInteger;
          case FieldByName('doctype').AsInteger of
            -3, 3: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperMove');
            -4, 4: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperConvert');
            -5, 5: mdTurnOver.FieldByName('kaname').AsString := rs('fmMoneyMove', 'CashWithCharge');
            else mdTurnOver.FieldByName('kaname').AsString := FieldByName('kaname').AsString;
          end;
          mdTurnOver.FieldByName('kaid').AsInteger := FieldByName('kaid').AsInteger;
          mdTurnOver.FieldByName('ptypename').AsString := FieldByName('ptypename').AsString;
          mdTurnOver.FieldByName('chargename').AsString := FieldByName('chargename').AsString;
          mdTurnOver.FieldByName('bankname').AsString := FieldByName('bankname').AsString;
          mdTurnOver.FieldByName('accnum').AsString := FieldByName('accnum').AsString;
          mdTurnOver.FieldByName('shortname').AsString := FieldByName('shortname').AsString;
          mdTurnOver.FieldByName('total').AsCurrency := FieldByName('total').AsCurrency;
          mdTurnOver.FieldByName('totaldef').AsCurrency := 
            RoundToA(FieldByName('total').AsCurrency * FieldByName('onvalue').AsFloat, -2);
          mdTurnOver.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          mdTurnOver.FieldByName('num').AsString := FieldByName('docnum').AsString;
          mdTurnOver.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
          mdTurnOver.Post;
          Next;
        end;
        Close;

        ProviderName := 'pMoneySaldo_Get';
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        Open;

        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -200;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'EndSaldo');
        if Trim(edToDate.Text) <> '' then
          mdTurnOver.FieldByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000) then begin
            mdTurnOver.FieldByName('total').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000);
            mdTurnOver.FieldByName('totaldef').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000);
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1);
            mdTurnOver.FieldByName('totaldef').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1);
          end;
        end
        else begin
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000) then begin
            mdTurnOver.FieldByName('total').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldo', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'accid', - mdMain.FieldByName('id').AsInteger - 1000000, lcbCurr.KeyValue)
          end
          else begin
            mdTurnOver.FieldByName('total').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldo', 'saldotype', 1, lcbCurr.KeyValue);
            mdTurnOver.FieldByName('totaldef').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldodef', 'saldotype', 1, lcbCurr.KeyValue);
          end;
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
        end;
        mdTurnOver.Post;

        Close;
      end else
      if (mdMain.FieldByName('id').AsInteger = -62) then begin
        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -100;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'StartSaldo');
        if edFromDate.Date > 0 then
          mdTurnOver.FieldByName('ondate').AsDateTime := edFromDate.Date;
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          mdTurnOver.FieldByName('total').AsCurrency := 
            GetDSSummF(Fields[0].DataSet, 'saldodef', '', 0);
          mdTurnOver.FieldByName('totaldef').AsCurrency := mdTurnOver.FieldByName('total').AsCurrency;
        end
        else begin
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          mdTurnOver.FieldByName('total').AsCurrency := 
              GetDSSummF(Fields[0].DataSet, 'saldo', '', 0, lcbCurr.KeyValue);
          mdTurnOver.FieldByName('totaldef').AsCurrency := 
            RoundToA(mdTurnOver.FieldByName('total').AsCurrency * cdsCurr.FieldByName('onvalue').AsFloat, -2);
        end;
        mdTurnOver.Post;
        Close;

        ProviderName := 'pPayDoc_AllTurnover';
        FetchParams;
        FetchMacros;
        Params.ParamByName('fromdate').AsDateTime := edFromDate.Date;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date);
        m := '';
        if lcbCurr.KeyValue <> lcbCurr.EmptyValue
          then m := m + ' and pd.currid=' + IntToStr(lcbCurr.KeyValue);
        if lcbKAgent.KeyValue <> lcbKAgent.EmptyValue
          then m := m + ' and pd.kaid=' + IntToStr(lcbKAgent.KeyValue);
        Macros.ParamByName('m').AsString := m;
        Open;
        while not Eof do begin
          FMaxx := GetMax(mdTurnOver, 'id') + 1;
          mdTurnover.Append;
          mdTurnOver.FieldByName('id').AsInteger := FMaxx;
          mdTurnOver.FieldByName('paydocid').AsInteger := FieldByName('paydocid').AsInteger;
          mdTurnOver.FieldByName('checked').AsInteger := FieldByName('checked').AsInteger;
          mdTurnOver.FieldByName('doctype').AsInteger := FieldByName('doctype').AsInteger;
          case FieldByName('doctype').AsInteger of
            -3, 3: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperMove');
            -4, 4: mdTurnOver.FieldByName('kaname').AsString := rs('fmPayDoc', 'OperConvert');
            -5, 5: mdTurnOver.FieldByName('kaname').AsString := rs('fmMoneyMove', 'CashWithCharge');
            else mdTurnOver.FieldByName('kaname').AsString := FieldByName('kaname').AsString;
          end;
          mdTurnOver.FieldByName('kaid').AsInteger := FieldByName('kaid').AsInteger;
          mdTurnOver.FieldByName('ptypename').AsString := FieldByName('ptypename').AsString;
          mdTurnOver.FieldByName('chargename').AsString := FieldByName('chargename').AsString;
          mdTurnOver.FieldByName('bankname').AsString := FieldByName('bankname').AsString;
          mdTurnOver.FieldByName('accnum').AsString := FieldByName('accnum').AsString;
          mdTurnOver.FieldByName('cashname').AsString := FieldByName('cashname').AsString;
          mdTurnOver.FieldByName('shortname').AsString := FieldByName('shortname').AsString;
          mdTurnOver.FieldByName('total').AsCurrency := FieldByName('total').AsCurrency;
          mdTurnOver.FieldByName('totaldef').AsCurrency := 
            RoundToA(FieldByName('total').AsCurrency * FieldByName('onvalue').AsFloat, -2);
          mdTurnOver.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          mdTurnOver.FieldByName('num').AsString := FieldByName('docnum').AsString;
          mdTurnOver.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
          mdTurnOver.Post;
          Next;
        end;
        Close;

        ProviderName := 'pMoneySaldo_Get';
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        Open;

        FMaxx := GetMax(mdTurnOver, 'id') + 1;
        mdTurnOver.Append;
        mdTurnOver.FieldByName('id').AsInteger := FMaxx;
        mdTurnOver.FieldByName('doctype').AsInteger := -200;
        mdTurnOver.FieldByName('kaname').AsString := rs('fmWaybill', 'EndSaldo');
        if Trim(edToDate.Text) <> '' then
          mdTurnOver.FieldByName('ondate').AsDateTime := LastSecondInDay(edToDate.Date);
        if lcbCurr.KeyValue = lcbCurr.EmptyValue then begin
          mdTurnOver.FieldByName('shortname').AsString := BaseCurrName;
          mdTurnOver.FieldByName('total').AsCurrency :=
            GetDSSummF(Fields[0].DataSet, 'saldodef', '', 0);
          mdTurnOver.FieldByName('totaldef').AsCurrency := mdTurnOver.FieldByName('total').AsCurrency;
        end
        else begin
          mdTurnOver.FieldByName('shortname').AsString := lcbCurr.Text;
          mdTurnOver.FieldByName('total').AsCurrency :=
            GetDSSummF(Fields[0].DataSet, 'saldo', '', 0, lcbCurr.KeyValue);
          cdsCurr.Locate('currid', lcbCurr.KeyValue, []);
          mdTurnOver.FieldByName('totaldef').AsCurrency :=
            RoundToA(mdTurnOver.FieldByName('total').AsCurrency * cdsCurr.FieldByName('onvalue').AsFloat, -2);
        end;
        mdTurnOver.Post;

        Close;
      end;
      mdTurnOver.SortOnFields('ondate');
      mdTurnOver.First;
    finally
      Free;
      Screen.Cursor := crDefault;
      mdTurnOver.EnableControls;
    end;
    Screen.Cursor := crDefault;
}

    AdjustGrid(grdTurnOver, colKAName);
  end
  else RefreshChart;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colCheckedGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if not F then begin
    F := True;
    if (TcxDateEdit(Sender).Text = '') then begin
      TcxDateEdit(Sender).EditValue := 0;
      TcxDateEdit(Sender).EditText := '';
    end;
    F := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.edFromDateKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (TcxDateEdit(Sender).Text <> '') then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    if CanRefresh then RefreshDetail;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
 var
   FSign: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colTotalGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, Abs(StrToFloat(AText)));
  except
  end;

  if ((VarToInt(ANode.Values[colDocType.Index]) < 0) and (VarToInt(ANode.Values[colDocType.Index]) > -20))
     or (VarToFloat(ANode.Values[colTotal.Index]) < 0)
  then FSign := '- '
  else if VarToInt(ANode.Values[colDocType.Index]) > 0
       then FSign := '+ '
       else FSign := '';

  AText := FSign + AText + ' ' + ANode.Values[colShortName.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.grdTurnOverCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.grdTurnOverCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if (ANode.Values[colDocType.Index] = -100) or (ANode.Values[colDocType.Index] = -200)
      then AFont.Style := [fsBold];

    if ((ANode.Values[colDocType.Index] < 0) or (ANode.Values[colTotal.Index] < 0)) and (ANode.Values[colDocType.Index] > -20)
      then AFont.Color := clRed;

    if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
      then AColor := GridOddLinesColor;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.lcbCurrPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.lcbCurrPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdTurnOver.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.grdTurnOverGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.grdTurnOverGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmFinance', 'Turnover');
  ImgList := dmData.Images;
  AIndex := II_FINANCES;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.grdTurnOverNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.grdTurnOverNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdTurnOver, colKAName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.grdTurnOverColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.grdTurnOverColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := (Column = colOnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  FrameResize(Self);

  if ModalView then
  try
    UpdateActionList;

    if ((tlMain.FocusedNode.Values[colID.Index] > 0) or (Abs(tlMain.FocusedNode.Values[colID.Index]) >= 1000000))
      then FCurrentID := Trunc(Abs(tlMain.FocusedNode.Values[colID.Index]))
      else FCurrentID := 0;

    tlMain.SetFocus;

  except
  end;

  if (pcFin.ActivePage = tsActives) and not cdsActives.Active
    then RefreshChart;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(grdTurnOver, colKAName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.btnKagentClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.btnKagentClick') else _udebug := nil;{$ENDIF}

  try AID := lcbKAgent.KeyValue; except AID := 0; end;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

  if not cdsKAgent.Active then begin
    Screen.Cursor := crSQLWait;

    try
      cdsKAgent.Open;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbKAgent.Text = '' then lcbKAgent.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := False;
  aRefresh.Enabled := True;
  aPatternInsert.Enabled := False;
  aDel.Enabled := False;
  aProperties.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aRecalcExecute(Sender: TObject);

  procedure Recalc(ASaldoType, AAccID, ACashID, ACurrID: Integer);
  begin
    with newDataSet do
    try
      ProviderName := 'pMoneySaldo_Recalc';
      FetchParams;
      Params.ParamByName('OnDate').AsDateTime := Self.OnDate;
      Params.ParamByName('CurrID').AsInteger := ACurrID;
      Params.ParamByName('SaldoType').AsInteger := ASaldoType;

      if ASaldoType = 0 then begin
        Params.ParamByName('cashid').AsInteger := ACashID;
        Params.ParamByName('accid').DataType := ftInteger;
        Params.ParamByName('accid').Clear;
      end
      else begin
        if AAccID <= 0 then Exit;
        Params.ParamByName('accid').AsInteger := AAccID;
        Params.ParamByName('cashid').DataType := ftInteger;
        Params.ParamByName('cashid').Clear;
      end;

      Execute;

    finally
      Free;
    end;
  end;

  procedure RecalcCurr(ASaldoType, AAccID, ACashID: Integer);
  begin
    fProgress.Show;

    try
      with cdsMain do begin
        First;

        fProgress.Caption := rs('fmWMat', 'RecalcRemains') + '...';
        fProgress.pbMain.Max := RecordCount;

        while not Eof do begin
          if (ASaldoType = -1) 
             or (
                 (FieldByName('saldotype').AsInteger = ASaldoType)
                 and
                 (
                  ( (ASaldoType = 0) and ( (FieldByName('cashid').AsInteger = ACashID) or (ACashID = 0) ) )
                  or
                  ( (ASaldoType = 1) and ( (FieldByName('accid').AsInteger = AAccID) or (AAccID = 0) ) )
                 )
                ) 
          then begin
            if not (((FieldByName('saldotype').AsInteger = 0) and (FieldByName('cashid').AsInteger = 0))
                   or
                   ((FieldByName('saldotype').AsInteger = 1) and (FieldByName('accid').AsInteger = 0)))
            then Recalc(FieldByName('saldotype').AsInteger, FieldByName('accid').AsInteger,
                          FieldByName('cashid').AsInteger, FieldByName('currid').AsInteger);

            fProgress.pbMain.StepIt;
            Application.ProcessMessages;
          end;

          Next;

        end;
      end;

    finally
      fProgress.Hide;
    end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aRecalcExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 1
    then RecalcCurr(-1, 0, 0)
    else case mdMain.FieldByName('id').AsInteger of
      -61: RecalcCurr(0, 0, 0);
      -62: RecalcCurr(-1, 0, 0);
      -63: RecalcCurr(1, 0, 0);
      else if mdMain.FieldByName('id').AsInteger > 0
           then RecalcCurr(0, 0, mdMain.FieldByName('id').AsInteger)
           else RecalcCurr(1, - mdMain.FieldByName('id').AsInteger - 1000000, 0);
    end;

  Application.ProcessMessages;
  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aGotoDocExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aGotoDocExecute') else _udebug := nil;{$ENDIF}

  FID := mdTurnOver.FieldByName('paydocid').AsInteger;

  case mdTurnOver.FieldByName('doctype').AsInteger of
    -1: frmMainForm.ExecLocate(vtDocs, 'TfmPayDoc', FID, 207);
    -2: frmMainForm.ExecLocate(vtDocs, 'TfmPayDoc', FID, 210);
     1: frmMainForm.ExecLocate(vtDocs, 'TfmPayDoc', FID, 206);
    -3, 3, -4, 4: frmMainForm.ExecLocate(vtFinances, 'TfmMoneyMove', FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    if (ANode.Values[colOnDate.Index] < 0) or (ANode.Values[colOnDate.Index] >= MaxDateTime - 1)
      then AText := ''
      else AText := DateToStr(ANode.Values[colOnDate.Index]);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colSaldoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
(*  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colSaldoGetText') else _udebug := nil;{$ENDIF}

  {$IFDEF LITE}
  if (ANode.Values[colID.Index] <> -63) and (ANode.Values[colID.Index] > -1000000)
    then AText := rs('Common', 'NotInThisVer');
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
*)
end;

//==============================================================================================
procedure TfmFinance.SetNA;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF LITE}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.SetNA') else _udebug := nil;{$ENDIF}

  if pcFin.ActivePage = tsFinance then begin
    if tlMain.FocusedNode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    try
      if (tlMain.FocusedNode.Values[colID.Index] <> -63)
         and (tlMain.FocusedNode.Values[colID.Index] > -1000000)
        then begin
          panCurrTotal.Visible := False;
          inspCurr.Visible := False;
          grdTurnOver.Visible := False;
          panFilter.Visible := False;
          txtSaldoNA.Visible := True;
          txtTONA.Visible := True;
        end
        else begin
          panFilter.Visible := True;
          grdTurnOver.Visible := True;
          panCurrTotal.Visible := True;
          inspCurr.Visible := True;
          txtSaldoNA.Visible := False;
          txtTONA.Visible := False;
        end;

    except
    end;
  end
  else begin
    panCurrTotal.Visible := False;
    inspCurr.Visible := False;
    grdTurnOver.Visible := False;
    panFilter.Visible := False;
    txtSaldoNA.Visible := True;
    txtTONA.Visible := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.inspCurrDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
 var
   FNode: TdxInspectorNode;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspCurrDragOver') else _udebug := nil;{$ENDIF}

  if (Source = inspCurr) then begin
    FNode := inspCurr.GetNodeAt(X, Y);
    Accept := (FNode <> FFromNode) and (FNode <> nil);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.inspCurrStartDrag(Sender: TObject; var DragObject: TDragObject);
  var
    P: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspCurrStartDrag') else _udebug := nil;{$ENDIF}

  GetCursorPos(P);
  P := inspCurr.ScreenToClient(P);
  FFromNode := inspCurr.GetNodeAt(P.X, P.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.inspCurrDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    FNode: TdxInspectorNode;
    FAccID, FCashID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.inspCurrDragDrop') else _udebug := nil;{$ENDIF}

  if (Source = inspCurr) then begin
    FNode := inspCurr.GetNodeAt(X, Y);
    FAccID := 0;
    FCashID := 0;

    if (FNode <> FFromNode) and (FNode <> nil) then begin
      if mdMain.FieldByName('id').AsInteger > 0
        then FCashID := mdMain.FieldByName('id').AsInteger
      else if Abs(mdMain.FieldByName('id').AsInteger) >= 1000000
        then FAccID := -mdMain.FieldByName('id').AsInteger-1000000;

      MoveMoney(1, FCashID, FAccID, FCashID, FAccID, TdxInspectorRowNode(FFromNode).Row.Tag, TdxInspectorRowNode(FNode).Row.Tag);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.MoveMoney(AType, AFromCashID, AFromAccID, AToCashID, AToAccID, AFromCurr, AToCurr: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.MoveMoney') else _udebug := nil;{$ENDIF}

  with TfrmEditMoneyMove.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmFinance';
    OnDate := Self.OnDate;
    ID := 0;
    DefineOperation(AType, AFromCashID, AFromAccID, AToCashID, AToAccID, AFromCurr, AToCurr);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainStartDrag(Sender: TObject; var DragObject: TDragObject);
  var
    P: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainStartDrag') else _udebug := nil;{$ENDIF}

  GetCursorPos(P);
  P := tlMain.ScreenToClient(P);
  FFromTreeNode := tlMain.GetNodeAt(P.X, P.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainDragOver') else _udebug := nil;{$ENDIF}

  if (Source = tlMain) then begin
    FNode := tlMain.GetNodeAt(X, Y);

    Accept := (FNode <> tlMain.DragNode) and (FNode <> nil)
      and ((tlMain.DragNode.Values[colID.Index] > 0) or (Abs(tlMain.DragNode.Values[colID.Index]) >= 1000000))
      and ((FNode.Values[colID.Index] > 0) or (Abs(FNode.Values[colID.Index]) >= 1000000));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    FNode: TdxTreeListNode;
    FAccID, FCashID, FToAccID, FToCashID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainDragDrop') else _udebug := nil;{$ENDIF}

  if Source = tlMain then begin
    FNode := tlMain.GetNodeAt(X, Y);
    FAccID := 0;
    FCashID := 0;
    FToAccID := 0;
    FToCashID := 0;

    if (FNode <> tlMain.DragNode) and (FNode <> nil) then begin
      if tlMain.DragNode.Values[colID.Index] > 0
        then FCashID := tlMain.DragNode.Values[colID.Index]
      else if Abs(tlMain.DragNode.Values[colID.Index]) >= 1000000
        then FAccID := -tlMain.DragNode.Values[colID.Index] - 1000000;

      if FNode.Values[colID.Index] > 0
        then FToCashID := FNode.Values[colID.Index]
      else if Abs(FNode.Values[colID.Index]) >= 1000000
        then FToAccID := -FNode.Values[colID.Index] - 1000000;

      MoveMoney(0, FCashID, FAccID, FToCashID, FToAccID, 0, 0);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainDblClick') else _udebug := nil;{$ENDIF}

  if ModalView and (FCurrentID > 0)
    then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.SetCurrentID') else _udebug := nil;{$ENDIF}

  FCanSelect := Value <> 0;
  //if FCanSelect then inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colDocTypeGetText') else _udebug := nil;{$ENDIF}

  if AText = '-3' then AText := '3'
  else if AText = '-4' then AText := '4'
  else if AText = '-5' then AText := '5'
  else if AText = '6'
       then if VarToFloat(ANode.Values[colTotal.Index]) < 0 then AText := '-6';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aMoveExecute') else _udebug := nil;{$ENDIF}

  if mdMain.FieldByName('id').AsInteger > 0
    then MoveMoney(0, mdMain.FieldByName('id').AsInteger, 0, 0, 0, 0, 0)
    else MoveMoney(0, 0, -mdMain.FieldByName('id').AsInteger - 1000000, 0, 0, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aConvertExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aConvertExecute') else _udebug := nil;{$ENDIF}

  if mdMain.FieldByName('id').AsInteger > 0
    then MoveMoney(1, mdMain.FieldByName('id').AsInteger, 0, 0, 0, 0, 0)
    else MoveMoney(1, 0, -mdMain.FieldByName('id').AsInteger - 1000000, 0, 0, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aCashWithChargeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aCashWithChargeExecute') else _udebug := nil;{$ENDIF}

  MoveMoney(2, 0, -mdMain.FieldByName('id').AsInteger - 1000000, 0, 0, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.pmMainPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.pmMainPopup') else _udebug := nil;{$ENDIF}

  aMove.Visible := (mdMain.FieldByName('id').AsInteger > 0) or (Abs(mdMain.FieldByName('id').AsInteger) >= 1000000);
  aConvert.Visible := aMove.Visible;
  aCashWithCharge.Visible := Abs(mdMain.FieldByName('id').AsInteger) >= 1000000;
  TBSeparatorItem1.Visible := aCashWithCharge.Visible or aConvert.Visible or aMove.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoSetFocus') else _udebug := nil;{$ENDIF}

  tlMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    tlMainDblClick(tlMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.BuildActives;
  var
    FWHSumm, FDebtors, FCreditors, FCash, FCashless: Extended;
    FLastID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.BuildActives') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  CanRefresh := False;

  try
    Application.ProcessMessages;

    with newDataSet do
    try
      if not mdActives.Active then begin
        ProviderName := 'pActives_GetEx';
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Open;
        if IsEmpty then begin
          Close;
          ProviderName := 'pActives_Recalc';
          FetchParams;
          Params.ParamByName('ondate').AsDateTime := Self.OnDate;
          Open;
        end;

        Close;
      end;

      ProviderName := 'pActives_Get';
      FetchParams;
      Params.ParamByName('ondate').AsDateTime := Self.OnDate;
      Open;
      if not IsEmpty then begin
        FWHSumm := FieldByName('whsumm').AsCurrency;
        FDebtors := FieldByName('debtors').AsCurrency;
        FCreditors := FieldByName('creditors').AsCurrency;
        FCash := FieldByName('cash').AsCurrency;
        FCashless := FieldByName('cashless').AsCurrency;
        FActivesLastDate := FieldByName('ondate').AsDateTime;
      end
      else begin
        FWHSumm := 0;
        FDebtors := 0;
        FCreditors := 0;
        FCash := 0;
        FCashless := 0;
        FActivesLastDate := 0;
      end;

      Close;

    finally
      Free;
    end;

    with mdActives do
    try
      if Active
        then FLastID := FieldByName('id').AsInteger
        else FLastID := 0;

      Close;
      Open;

      Append;
      FieldByName('id').AsInteger := -1;
      FieldByName('iindex').AsInteger := 169;
      FieldByName('name').AsString := rs('fmFinance', 'Actives');
      FieldByName('pid').AsInteger := -1;
      FieldByName('saldo').AsCurrency := FWHSumm - FDebtors - FCreditors + FCash + FCashless;
      Post;

      Append;
      FieldByName('id').AsInteger := 1;
      FieldByName('iindex').AsInteger := 80;
      FieldByName('name').AsString := rs('fmFinance', 'WHPrimeCost');
      FieldByName('saldo').AsCurrency := FWHSumm;
      FieldByName('pid').AsInteger := -1;
      Post;

      Append;
      FieldByName('id').AsInteger := 2;
      FieldByName('iindex').AsInteger := 167;
      FieldByName('name').AsString := rs('fmFinance', 'Cash');
      FieldByName('saldo').AsCurrency := FCash;
      FieldByName('pid').AsInteger := -1;
      Post;

      Append;
      FieldByName('id').AsInteger := 3;
      FieldByName('iindex').AsInteger := 170;
      FieldByName('name').AsString := rs('fmFinance', 'Cashless');
      FieldByName('saldo').AsCurrency := FCashless;
      FieldByName('pid').AsInteger := -1;
      Post;

      Append;
      FieldByName('id').AsInteger := 4;
      FieldByName('iindex').AsInteger := II_KADis;
      FieldByName('name').AsString := rs('fmFinance', 'Creditors');
      FieldByName('saldo').AsCurrency := -FCreditors;
      FieldByName('pid').AsInteger := -1;
      Post;

      Append;
      FieldByName('id').AsInteger := 5;
      FieldByName('iindex').AsInteger := II_KADis;
      FieldByName('name').AsString := rs('fmFinance', 'Debtors');
      FieldByName('saldo').AsCurrency := -FDebtors;
      FieldByName('pid').AsInteger := -1;
      Post;

      if FLastID > 0
        then Locate('id', FLastID, [])
        else First;

      if FActivesLastDate > 0
        then tsActives.Caption := rs('fmFinance', 'Actives') + ' (' + rs('Common','on') + DateToStr(FActivesLastDate) +')'
        else tsActives.Caption := rs('fmFinance', 'Actives');

    finally
    end;

    CanRefresh := True;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlActivesCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlActivesCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.AbsoluteIndex) and not ASelected then AColor := GridOddLinesColor;

  if ANode.Level = 0 then AFont.Style := [fsBold];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aRecalcActivesExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aRecalcActivesExecute') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pActives_Recalc';
    FetchParams;
    Params.ParamByName('ondate').AsDateTime := Self.OnDate;
    Open;
    Close;
    aRefresh.Execute;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlActivesColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlActivesColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.pcFinChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.pcFinChange') else _udebug := nil;{$ENDIF}

  if not Self.Visible or not Opened then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (pcFin.ActivePage = tsFinance) then begin
    if CanRefresh and mdMain.IsEmpty then aRefresh.Execute;
    txtSaldoDate.Caption := rs(Self.Name, 'SaldoOn',3) + okDateToStr(LangMan, Self.OnDate);
    tsTurnover.TabVisible := True;
    tsActChart.TabVisible := False;
    pcMain.ActivePage := tsTurnover;
    if not cdsTurnover.Active and CanRefresh then RefreshDetail;
  end
  else begin
    if mdActives.IsEmpty then aRefresh.Execute;
    txtSaldoDate.Caption := rs(Self.Name, 'ActivesOn',3) + okDateToStr(LangMan, Self.OnDate);
    tsTurnover.TabVisible := False;
    tsActChart.TabVisible := True;
    pcMain.ActivePage := tsActChart;
    if not cdsActives.Active then RefreshDetail;
  end;

  if aShowCurr.Checked then begin
    GetCurr;
    lcbCurrencyPropertiesEditValueChanged(lcbCurrency);
  end;

  SetNA;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.tlActivesChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.tlActivesChangeNode') else _udebug := nil;{$ENDIF}

  if aShowCurr.Checked and CanRefresh then GetCurr;
  SetNA;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.RefreshChart;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.RefreshChart') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  try
    crtActives.LeftAxis.Automatic := True;
    crtActives.BottomAxis.Automatic := True;
    cdsActives.Close;
    cdsActives.Open;

    with crtActives do begin
      for i := 0 to SeriesCount - 1 do Series[i].Clear;

      while not cdsActives.Eof do begin
        if cdsActives.FieldByName('actdate').AsDateTime > 0 then begin
          Series[0].AddXY(cdsActives.FieldByName('actdate').AsDateTime, cdsActives.FieldByName('actives').AsFloat);
          Series[1].AddXY(cdsActives.FieldByName('actdate').AsDateTime, cdsActives.FieldByName('whsum').AsFloat);
          Series[2].AddXY(cdsActives.FieldByName('actdate').AsDateTime, cdsActives.FieldByName('cash').AsFloat);
          Series[3].AddXY(cdsActives.FieldByName('actdate').AsDateTime, cdsActives.FieldByName('cashless').AsFloat);
          Series[4].AddXY(cdsActives.FieldByName('actdate').AsDateTime, -cdsActives.FieldByName('debtors').AsFloat);
          Series[5].AddXY(cdsActives.FieldByName('actdate').AsDateTime, -cdsActives.FieldByName('creditors').AsFloat);
        end;

        cdsActives.Next;
      end;

      LeftAxis.AdjustMaxMin;
      BottomAxis.AdjustMaxMin;
      FMinY := LeftAxis.Minimum;
      FMaxY := LeftAxis.Maximum;
      LeftAxis.Automatic := False;
      sldMinMaxChange(sldMinMax);
    end;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsActivesBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsActivesBeforeOpen') else _udebug := nil;{$ENDIF}

  if edACFromDate.Date <= 0
    then cdsActives.Params.ParamByName('fromdate').AsDateTime := MinDateTime
    else cdsActives.Params.ParamByName('fromdate').AsDateTime := edACFromDate.Date;

  if edACToDate.Date <= 0
    then cdsActives.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsActives.Params.ParamByName('todate').AsDateTime := edACToDate.Date;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.sldMinMaxChange(Sender: TObject);
  var
    FPos: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.sldMinMaxChange') else _udebug := nil;{$ENDIF}

  FPos := sldMinMax.Value - 50;
  FCMinY := FMinY - Abs(Trunc(FMinY * (FPos + 100) / 100));
  FCMaxY := FMaxY + Abs(Trunc(FMaxY * (FPos + 100) / 100));
  crtActives.LeftAxis.Minimum := FCMinY;
  crtActives.LeftAxis.Maximum := FCMaxY;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.sldTopBottomChange(Sender: TObject);
  var
    FPos: Extended;
    FLength: Extended;
    FOffs: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.sldTopBottomChange') else _udebug := nil;{$ENDIF}

  FPos := sldTopBottom.Value - 50;
  FLength := FCMaxY - FCMinY;
  FOffs := Trunc(FLength / 100 * FPos);
  crtActives.LeftAxis.Minimum := FCMinY - FOffs;
  crtActives.LeftAxis.Maximum := FCMaxY - FOffs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.aRecalcActivesAllExecute(Sender: TObject);
  var
    FFrom, FTo, FCurr: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.aRecalcActivesAllExecute') else _udebug := nil;{$ENDIF}

  if edACFromDate.Date <= 0
    then FFrom := GetMinDocDate(dmData.SConnection)
    else FFrom := edACFromDate.Date;

  if edACToDate.Date <= 0
    then FTo := GetMaxDocDate(dmData.SConnection)
    else FTo := edACToDate.Date;

  with newDataSet do
  try
    fProgress.Caption := rs('fmFinance', 'RecalcActives') + '...';
    fProgress.pbMain.Max := Trunc(FTo - FFrom);
    fProgress.Show;
    ProviderName := 'pActives_Recalc';
    FetchParams;
    FCurr := FFrom;

    repeat
      Params.ParamByName('ondate').AsDateTime := FCurr;
      Open;
      Close;
      FCurr := IncDay(FCurr);
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    until FCurr > FTo;

  finally
    fProgress.Hide;
    Free;
  end;

  RefreshChart;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowWHSummClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowWHSummClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[1].Active := chbShowWHSumm.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowActivesClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowActivesClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[0].Active := chbShowActives.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowCashClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowCashClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[2].Active := chbShowCash.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowCashlessClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowCashlessClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[3].Active := chbShowCashless.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowDebtorsClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowDebtorsClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[4].Active := chbShowDebtors.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowCreditorsClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowCreditorsClick') else _udebug := nil;{$ENDIF}

  crtActives.Series[5].Active := chbShowCreditors.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.chbShowGridClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.chbShowGridClick') else _udebug := nil;{$ENDIF}

  crtActives.LeftAxis.Grid.Visible := chbShowGrid.Checked;
  crtActives.BottomAxis.Grid.Visible := chbShowGrid.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.bvlActivesClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.bvlActivesClick') else _udebug := nil;{$ENDIF}

  with TColorDialog.Create(nil) do
  try
    Color := (Sender as TssBevel).Color;
    if Execute then begin
      (Sender as TssBevel).Color := Color;
      (Sender as TssBevel).ColorInner := Color;
      (Sender as TssBevel).ColorOuter := Color;
      crtActives.Series[(Sender as TssBevel).Tag].SeriesColor := Color;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.crtActivesStartDrag(Sender: TObject; var DragObject: TDragObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.crtActivesStartDrag') else _udebug := nil;{$ENDIF}

  FP := crtActives.GetCursorPos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.crtActivesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    FdyK, FdxK: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.crtActivesDragOver') else _udebug := nil;{$ENDIF}

  Accept := True;

  with crtActives do begin
    FdxK := (BottomAxis.Maximum - BottomAxis.Minimum)/Width;
    FdyK := (LeftAxis.Maximum - LeftAxis.Minimum)/Height;
    LeftAxis.Scroll(-(FP.Y - Y) * FdyK, False);
    BottomAxis.Scroll((FP.X - X) * FdxK, False);
    FP.X := X;
    FP.Y := Y;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtFinances, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.DoHelp') else _udebug := nil;{$ENDIF}

  if pcFin.ActivePage = tsFinance
    then ShowHelpTopic('fmFinance')
    else ShowHelpTopic('fmFinance1');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.cdsTurnoverBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.cdsTurnoverBeforeOpen') else _udebug := nil;{$ENDIF}

  if edFromDate.Date > 0
    then cdsTurnover.Params.ParamByName('fromdate').AsDateTime := edFromDate.Date
    else cdsTurnover.Params.ParamByName('fromdate').AsDateTime := MinDateTime;

  if edToDate.Date > 0
    then cdsTurnover.Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date)
    else cdsTurnover.Params.ParamByName('todate').AsDateTime := MaxDateTime;

  if lcbCurr.KeyValue = lcbCurr.EmptyValue
    then cdsTurnover.Params.ParamByName('currid').AsInteger := 0
    else cdsTurnover.Params.ParamByName('currid').AsInteger := lcbCurr.KeyValue;

  if lcbKAgent.KeyValue = lcbKAgent.EmptyValue
    then cdsTurnover.Params.ParamByName('inkaid').AsInteger := 0
    else cdsTurnover.Params.ParamByName('inkaid').AsInteger := lcbKAgent.KeyValue;

  if (mdMain.FieldByName('pid').AsInteger = -61) or (mdMain.FieldByName('id').AsInteger = -61)
  then begin
    cdsTurnover.Params.ParamByName('turntype').AsInteger := 1;

    if mdMain.FieldByName('id').AsInteger > 0
      then cdsTurnover.Params.ParamByName('inid').AsInteger := mdMain.FieldByName('id').AsInteger
      else cdsTurnover.Params.ParamByName('inid').AsInteger := 0;
  end
  else if (mdMain.FieldByName('pid').AsInteger = -63) or (mdMain.FieldByName('id').AsInteger = -63)
  then begin
    cdsTurnover.Params.ParamByName('turntype').AsInteger := 2;
    if (abs(mdMain.FieldByName('id').AsInteger) >= 1000000)
      then cdsTurnover.Params.ParamByName('inid').AsInteger := - mdMain.FieldByName('id').AsInteger - 1000000
      else cdsTurnover.Params.ParamByName('inid').AsInteger := 0;
  end
  else if (mdMain.FieldByName('pid').AsInteger = -62) then begin
      cdsTurnover.Params.ParamByName('turntype').AsInteger := 0;
      cdsTurnover.Params.ParamByName('inid').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colKANameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colKANameGetText') else _udebug := nil;{$ENDIF}

  case VarToInt(ANode.Values[colDocType.Index]) of
    -100: AText := rs('fmWaybill', 'StartSaldo');
    -200: AText := rs('fmWaybill', 'EndSaldo');
    -3,3: AText := rs('fmPayDoc', 'OperMove');
    -4,4: AText := rs('fmPayDoc', 'OperConvert');
    -5,5: AText := rs('fmMoneyMove', 'CashWithCharge');
       6: if ANode.Values[colTotal.Index] < 0
            then AText := rs('fmMoneyMove', 'OperAdjustOut')
            else AText := rs('fmMoneyMove', 'OperAdjustIn');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmFinance.colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmFinance.colTotalDefGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fFinance', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
