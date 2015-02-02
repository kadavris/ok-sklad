{$I ok_sklad.inc}
unit BaseWBDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, TB2Item, Menus, ActnList, ExtCtrls, StdCtrls,
  prTypes, BaseRef, ssDataSource, ssClientDataSet, ssSpeedButton, ssBevel, ssMemDS,
  ssDBGrid, ssPeriod, okPeriod, ssDBLookupCombo,
  dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6,
  cxImageComboBox, cxDropDownEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxPC,
  dxExEdtr6, dxInspRw, dxInspct, dxDBTLCl6, dxGrClms6, dxExEdtr, dxCntner;

type
  TfmBaseWBDoc = class(TfmBaseRef)
    aAddPayDoc: TAction;
    aDetColParams: TAction;
    aDRPrint: TAction;
    aFindAtMats: TAction;
    aFindAtSvc: TAction;
    aFindAtWH: TAction;
    aGotoDoc: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMC: TAction;
    aShowNullBallance: TAction;
    aSvcInfo: TAction;
    btnKagent: TssSpeedButton;
    bvlCurrSep: TssBevel;
    bvlMainListTop: TssBevel;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cbChecked: TcxImageComboBox;
    cdsDetail: TssMemoryData;
    cdsDetailFetch: TssClientDataSet;
    cdsDetailAMOUNT: TFloatField;
    cdsDetailARTIKUL: TStringField;
    cdsDetailBARCODE: TStringField;
    cdsDetailMATID: TIntegerField;
    cdsDetailMATNAME: TStringField;
    cdsDetailMSRNAME: TStringField;
    cdsDetailNDS: TFloatField;
    cdsDetailONVALUE: TFloatField;
    cdsDetailPOSID: TIntegerField;
    cdsDetailPRICE: TFloatField;
    cdsDetailpricedef: TFloatField;
    cdsDetailpricewithnds: TFloatField;
    cdsDetailpricewonds: TFloatField;
    cdsDetailrecno: TIntegerField;
    cdsDetailsumcurr: TFloatField;
    cdsDetailsummdef2: TFloatField;
    cdsDetailsumnds: TFloatField;
    cdsDetailsumwithnds: TFloatField;
    cdsDetailsumwonds: TFloatField;
    cdsDetailWBILLID: TIntegerField;
    cdsDetailWHNAME: TStringField;
    cdsDetailWID: TIntegerField;
    cdsDocRel: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsRel: TssClientDataSet;
    colAmount: TdxDBGridColumn;
    colArchived: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colBarCode: TdxDBGridColumn;
    colCardHolder: TdxDBGridColumn;
    colCardNum: TdxDBGridColumn;
    colCertDate: TdxDBGridColumn;
    colCertNum: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colCurrName: TdxDBGridColumn;
    colDetNDS: TdxDBGridColumn;
    colDocSaldo: TdxDBGridColumn;
    colDRID: TdxDBGridColumn;
    colDRNum: TdxDBGridColumn;
    colDROnDate: TdxDBGridColumn;
    colDRShortName: TdxDBGridColumn;
    colDRSummAll: TdxDBGridColumn;
    colDRType: TdxDBGridImageColumn;
    colDRTypeName: TdxDBGridColumn;
    colGTD: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colMatName: TdxDBGridColumn;
    colMeasureName: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNDS: TdxDBGridColumn;
    colNorm: TdxDBGridColumn;
    colNotes: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPosID: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colPriceInCurr: TdxDBGridColumn;
    colPriceWONDS: TdxDBGridColumn;
    colProducer: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colRChecked: TdxDBGridImageColumn;
    colRecNo: TdxDBGridColumn;
    colSummAll: TdxDBGridColumn;
    colSummCurr: TdxDBGridColumn;
    colSummDef: TdxDBGridColumn;
    colSummDefWONDS: TdxDBGridColumn;
    colSummInCurr: TdxDBGridColumn;
    colSummPay: TdxDBGridColumn;
    colWHouseName: TdxDBGridColumn;
    grdDet: TssDBGrid;
    grdDocRel: TssDBGrid;
    inspMain: TdxInspector;
    irAmount: TdxInspectorTextRow;
    irCurr: TdxInspectorTextRow;
    irEmail: TdxInspectorTextHyperLinkRow;
    irFax: TdxInspectorTextRow;
    irKAAdress: TdxInspectorTextMemoRow;
    irKAFullName: TdxInspectorTextMemoRow;
    irKAgent: TdxInspectorTextButtonRow;
    irKAPhone: TdxInspectorTextRow;
    irNotes: TdxInspectorTextRow;
    irNum: TdxInspectorTextRow;
    irPerson: TdxInspectorTextRow;
    irReason: TdxInspectorTextRow;
    irStatus: TdxInspectorTextRow;
    irWWW: TdxInspectorTextHyperLinkRow;
    itmColParams: TTBItem;
    itmDetColParams: TTBItem;
    itmDRPrint: TTBItem;
    itmFindAtMats: TTBItem;
    itmFindAtSvc: TTBItem;
    itmMatInfo: TTBItem;
    itmMatMove: TTBItem;
    itmMatRsv: TTBItem;
    itmMC: TTBItem;
    itmPatternIns: TTBItem;
    lcbKAgent: TssDBLookupCombo;
    lDocsCount: TLabel;
    lDocsSumm: TLabel;
    lKAgent: TLabel;
    lStatus: TLabel;
    lTot: TLabel;
    lTotalCurr: TLabel;
    lTotNDS: TLabel;
    lTotNDSOut: TLabel;
    mnuGotoDoc: TTBItem;
    PanDetFooter: TPanel;
    panFilter: TPanel;
    panFooter: TPanel;
    pcMain: TcxPageControl;
    pmDet: TTBPopupMenu;
    pmDocRel: TTBPopupMenu;
    prdMain: TokPeriod;
    sepDetColOptions: TTBSeparatorItem;
    Splitter1: TSplitter;
    srcDetail: TDataSource;
    srcKAgent: TDataSource;
    srcMainEx: TDataSource;
    srcRel: TDataSource;
    ssBevel10: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel21: TssBevel;
    ssBevel22: TssBevel;
    ssBevel2: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    stCount: TssBevel;
    stSummCurr: TssBevel;
    stSummDef: TssBevel;
    stSummDefNDS: TssBevel;
    stSummDefNoNDS: TssBevel;
    stTotal: TssBevel;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20basewbdoc: TTBItem;
    TBItem23: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    tsDocRel: TcxTabSheet;
    tsInfo: TcxTabSheet;
    tsPositions: TcxTabSheet;
    tsTemp: TcxTabSheet;

    procedure aAddPayDocExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure aDetColParamsExecute(Sender: TObject);
    procedure aDRPrintExecute(Sender: TObject);
    procedure aFindAtMatsExecute(Sender: TObject);
    procedure aFindAtSvcExecute(Sender: TObject);
    procedure aFindAtWHExecute(Sender: TObject);
    procedure aGotoDocExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aMCExecute(Sender: TObject);
    procedure aShowNullBallanceExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailFetchBeforeOpen(DataSet: TDataSet);
    procedure cdsDocRelBeforeOpen(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsRelAfterOpen(DataSet: TDataSet);
    procedure cdsRelBeforeOpen(DataSet: TDataSet);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDetNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDRSummAllGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummAllGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummPayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdDetChangedColumnsWidth(Sender: TObject);
    procedure grdDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdDetNeedAdjust(Sender: TObject); virtual;
    procedure grdDocRelDblClick(Sender: TObject);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetGroupNodeAddText(Sender: TObject; Node: TdxTreeListNode; var AText: String);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irKAgentButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure prdMainChange(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure srcMainExDataChange(Sender: TObject; Field: TField);
    procedure cdsDetailBeforeOpen(DataSet: TDataSet);

  private
    F: Boolean;
    function GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;

  protected
    FCurrRate: Extended;
    FShowNullBallanceStr: string;
    WBType: Integer;
    FNoALUpdate: Boolean; // temporary skip actionlistupdate calls

    function  GetDelStr(AID: Integer): string; virtual;
    procedure RealignControls; virtual;
    procedure RefreshDetail; virtual;
    procedure GetSummAll; virtual;
    procedure UpdatePos; virtual;
    procedure LoadPayment;
    procedure ShowTotalAmountNode;
    function  GetByDocID(ADocID: Integer): Integer;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoShow; override;
    procedure DoDelete; override;
    procedure DoShowFilter; override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure UpdateActionList; override;
    procedure DoRefresh(const AID: integer; AParam: Integer = 0); override;
    procedure LoadSkin; override;
    procedure DoCopy; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
  end;

var
  fmBaseWBDoc: TfmBaseWBDoc;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, prFun, ssRegUtils, ssBaseConst, ssFun, ssDateUtils,
  ClientData, BaseFrame, EditMaterials, MatMove, MatRsv, fMessageDlg,
  ssClntCallback, ssCallbackConst, MCList, KATurnover, EditServices, prRep,
  ssStrUtil, Udebug;

var
  FcdsDetailOpening: Boolean = False;
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmBaseWBDoc.DoOpen(AParam: Variant);
 var
   dtTmp: TDateTime;
   intHeight, i, intTmp: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoOpen') else _udebug := nil;{$ENDIF}

  CanRefresh := False;

  prdMain.RegistryPath := MainRegKey + '\' + Self.ClassName;

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  {if ReadFromRegDate(MainRegKey + '\' + Self.ClassName + '\' + panFilter.Name + '\' + edFromDate.Name, 'Date', dtTmp)
  then begin
    if dtTmp <> 0
      then edFromDate.Date := dtTmp
      else edFromDate.Text := '';
  end;
  }

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName + '\' + panClient.Name, 'Height', intHeight)
    then if intHeight > 0 then panClient.Height := intHeight;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'ActivePage', intTmp)
    then pcMain.ActivePageIndex := intTmp
    else pcMain.ActivePageIndex := 0;

  dmData.i14.GetBitmap(0, irKAgent.Buttons[0].Glyph);

  inherited;

  prdMain.LoadFromRegistry;
  //AdjustGrid(grdDocRel, colDRTypeName);
  colRChecked.Visible := True;
  colRChecked.Index := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoShow') else _udebug := nil;{$ENDIF}

  RealignControls;
  DoShowFilter;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.RealignControls;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.RealignControls') else _udebug := nil;{$ENDIF}

  cbChecked.Left := panFilter.Width - cbChecked.Width - 6;
  lStatus.Left := cbChecked.Left - lStatus.Width - 4;
  btnKAgent.Left := lStatus.Left - btnKAgent.Width - 8;
  lKAgent.Left := prdMain.Left + prdMain.Width + 5;
  lcbKAgent.Left := lKAgent.Left + lKAgent.Width + 2;
  lcbKAgent.Width := btnKAgent.Left - lcbKAgent.Left - 1;
  lcbKAgent.Anchors := lcbKAgent.Anchors + [akRight];

  stSummDef.Left := panDetFooter.Width - stSummDef.Width - 8;
  lTot.Left := stSummDef.Left - lTot.Width - 4;
  stSummDefNDS.Left := lTot.Left - stSummDefNDS.Width - 6;
  lTotNDS.Left := stSummDefNDS.Left - lTotNDS.Width - 4;
  stSummDefNoNDS.Left := lTotNDS.Left - stSummDefNoNDS.Width - 6;
  lTotNDSOut.Left := stSummDefNoNDS.Left - lTotNDSOut.Width - 4;

  stTotal.Left := panFooter.Width - stTotal.Width - 8;
  lDocsSumm.Left := stTotal.Left - lDocsSumm.Width - 4;
  stCount.Left := lDocsSumm.Left - stCount.Width - 6;
  lDocsCount.Left := stCount.Left - lDocsCount.Width - 4;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    //lFromDate.Caption := GetRS('fmWaybill', 'FromDate');
    //lToDate.Caption := GetRS('fmWaybill', 'ToDate');
    aAddPayDoc.Caption := GetRS('fmWaybill', 'AddPayDoc');
    aDetColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aDRPrint.Caption := GetRS('Common', 'Print');
    aFindAtMats.Caption := GetRS('fmWaybill', 'FindAtMats') + '...';
    aFindAtSvc.Caption := GetRS('fmWaybill', 'FindAtSvc') + '...';
    aFindAtWH.Caption := GetRS('fmWaybill', 'FindAtWH') + '...';
    aGotoDoc.Caption := GetRS('Common', 'Jump');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aMC.Caption := GetRS('fmWMat', 'ShowMCList');
    aShowNullBallance.Caption := GetRS('fmWaybill', 'ShowNullBallance');
    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');

    btnKAgent.Hint := rs('fmWaybill', 'KAAdd');

    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[1].Description := GetRS('fmWaybill', 'Checked');
    cbChecked.Properties.Items[2].Description := GetRS('fmWaybill', 'NoChecked');

    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colArtikul.Caption := GetRS('fmWaybill', 'Artikul');
    colBarCode.Caption := GetRS('fmMaterials', 'BarCode');
    colCardHolder.Caption := GetRS('fmDiscCards', 'Holder');
    colCardNum.Caption := GetRS('fmWaybill', 'DiscCard');
    colCertDate.Caption := GetRS('fmWaybill', 'CertDate');
    colCertNum.Caption := GetRS('fmWaybill', 'CertNum');
    colChecked.Caption := '';
    colDetNDS.Caption := GetRS('fmWaybill', 'NDS') + ', ' + BaseCurrName;
    colDocSaldo.Caption := GetRS('fmWaybill', 'DocSaldo');
    colDRNum.Caption := GetRS('fmWaybill', 'Num');
    colDROnDate.Caption := GetRS('fmWaybill', 'OnDate');
    colDRSummAll.Caption := GetRS('fmWaybill', 'Summ');
    colDRType.Caption := '';
    colDRTypeName.Caption := GetRS('fmWaybill', 'DocType');
    colGTD.Caption := GetRS('fmWaybill', 'GTD');
    colImg.Caption := '';
    colMatName.Caption := GetRS('fmWaybill', 'MatName');
    colMeasureName.Caption := GetRS('fmWaybill', 'Measure');
    colName.Caption := GetRS('fmWaybill', 'KAgent');
    colNDS.Caption := GetRS('fmMaterials', 'NDSRate');
    colNotes.Caption := GetRS('fmWaybill', 'Notes');
    colNum.Caption := GetRS('fmWaybill', 'Num');
    colOnDate.Caption := GetRS('fmWaybill', 'OnDate');
    colPrice.Caption := GetRS('fmWaybill', 'PriceWithNDS');
    colPriceWONDS.Caption := GetRS('fmWaybill', 'Price') + ' ' + GetRS('fmWaybill', 'outNDS');
    colProducer.Caption := GetRS('fmMaterials', 'Producer');
    colRate.Caption := GetRS('fmWaybill', 'Kurs');
    colRChecked.Caption := '';
    colRecNo.Caption := amountPrefix(False);
    colSummAll.Caption := GetRS('fmWaybill', 'Summ') + ', ' + BaseCurrName;
    colSummDef.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS');
    colSummDefWONDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'outNDS');
    colSummInCurr.Caption := GetRS('fmWaybill', 'SummCurr');
    colSummPay.Caption := GetRS('fmWaybill', 'PaySumm');
    colWHouseName.Caption := GetRS('fmWaybill', 'WHouse');

    irAmount.Caption := GetRS('fmWaybill', 'TotalAmount');
    irCurr.Caption := GetRS('fmWaybill', 'Summ');
    irFax.Caption := GetRS('fmWaybill', 'KAFax');
    irKAAdress.Caption := GetRS('fmWaybill', 'KAadress');
    irKAFullName.Caption := GetRS('fmWaybill', 'KAFullName');
    irKAgent.Caption := GetRS('fmWaybill','KAgent');
    irKAPhone.Caption := GetRS('fmWaybill', 'KAPhone');
    irNotes.Caption := GetRS('fmWaybill', 'Notes');
    irNum.Caption := amountPrefix(False);
    irPerson.Caption := GetRS('fmWaybill', 'PersonnameIn');
    irReason.Caption := GetRS('fmWaybill', 'Reason');
    irStatus.Caption := GetRS('fmWaybill', 'DocStatus');
    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');
    lcbKAgent.Text := GetRS('Common', 'All');

    lDocsCount.Caption := GetRS('fmWaybill', 'DocsCount') + ':';
    lDocsSumm.Caption := GetRS('fmWaybill', 'DocsSumm') + ':';
    lKAgent.Caption := GetRS('fmWaybill', 'KAgent');
    lStatus.Caption := GetRS('fmWaybill', 'Status');
    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') + ':';

    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    prdMain.InitRes;

    tsDocRel.Caption := GetRS('fmWaybill', 'DocRel');
    tsInfo.Caption := GetRS('fmWaybill', 'DocInfo');
    tsPositions.Caption := GetRS('fmWaybill', 'Positions') + ' ';
  end;

  RealignControls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdDetNeedAdjust(grdDet);
  //grdMain.Adjust(nil, [colImg, colChecked]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FFirst: Boolean;
    FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  cdsMain.DisableControls;
  FFirst := not cdsMain.Active;
  case AParam of
      0: DSRefresh(cdsMain, _ID_, AID);

    100: DSRefresh(cdsMain, _ID_, 0);

    Integer(rtKAgent):
      begin
        DSRefresh(cdsKAgent, 'kaid', AID);
        lcbKAgent.KeyValue := AID;
        lcbKAgent.SelStart := 0;
        lcbKAgent.SelLength := 0;
      end;
  end;

  if FFirst then begin
    try
      if grdMain.Count > 0 then cdsMain.Locate(_ID_, grdMain.Items[0].Values[colID.Index], []);

    except
    end;
  end;

  grdMain.TopIndex := FLastIndex;
  cdsMain.EnableControls;

  SelectFocusedNode;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if cdsKAgent.Active and (lcbKAgent.Text = '') then lcbKAgent.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

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
procedure TfmBaseWBDoc.btnKagentClick(Sender: TObject);
 var
   intID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.btnKagentClick') else _udebug := nil;{$ENDIF}

  try
    intID := lcbKAgent.KeyValue;
  except
    intID := 0;
  end;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, intID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colSummAllGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colSummAllGetText') else _udebug := nil;{$ENDIF}

  try
    //AText := FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(AText), -2));
    AText := FormatFloat(MoneyDisplayFormat, RoundToA(ANode.Values[colSUMMALL.Index], -2));
  except
    AText := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoClose') else _udebug := nil;{$ENDIF}

  if not ModalView then WriteToRegInt(MainRegKey + '\' + Self.ClassName + '\' + panClient.Name, 'Height', panClient.Height);

  prdMain.SaveToRegistry;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'ActivePage', pcMain.ActivePageIndex);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), ANode.Values[colOnDate.Index]);
  except
    AText := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsMainAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    FSum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  DataSet.EnableControls;
  FSum := 0;
  with grdMain do
    for i := 0 to Count - 1 do begin
      try
        FSum := FSum + RoundToA(Items[i].Values[colSummAll.Index], -2);
      except
      end;
    end;

  stTotal.Caption := FormatFloat(MoneyDisplayFormat, FSum) + ' ' + BaseCurrName;
  stCount.Caption := IntToStr(grdMain.Count);
  FrameResize(Self);
  NeedRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.UpdateActionList') else _udebug := nil;{$ENDIF}

  if not ModalView then begin
    aNew.Enabled := not limited;
    aPaste.Enabled := not limited;

    aProperties.Enabled := (grdMain.SelectedCount > 0)
      and (not grdMain.FocusedNode.HasChildren)
      and (VarToInt(grdMain.FocusedNode.Values[colChecked.Index]) = 0);

    aDel.Enabled := aProperties.Enabled;

    if Self.RefType <> prTypes.rtAccOut then aCheck.Enabled := grdMain.SelectedCount > 0;
  end;

  aRefresh.Enabled := True;
  aPrint.Enabled := grdMain.SelectedCount > 0;

  aPatternInsert.Enabled := (not limited)
    and (grdMain.SelectedCount > 0) and (RefType <> prTypes.rtInv)
    and not grdMain.FocusedNode.HasChildren and not ModalView;

  aMatInfo.Enabled := not cdsDetail.IsEmpty;
  aMatMove.Enabled := aMatInfo.Enabled;
  aMatRsv.Enabled := aMatInfo.Enabled;
  aMC.Enabled := aMatInfo.Enabled;

  aGotoDoc.Enabled := not cdsRel.IsEmpty;
  aDRPrint.Enabled := not cdsRel.IsEmpty;
  aFindAtWH.Enabled := not cdsDetail.IsEmpty;
  aAddPayDoc.Enabled := not cdsMain.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.srcMainExDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.srcMainExDataChange') else _udebug := nil;{$ENDIF}

  with grdMain do
    if not cdsMain.IsEmpty and (cdsMain.FieldByName('checked').AsInteger = 0)
      then aCheck.Caption := rs('Common', 'Check')
      else aCheck.Caption := rs('Common', 'UnCheck');

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
    i, FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  UpdateActionList;

  with cdsMain do begin
    if not IsEmpty then begin
      irNum.Text := FieldByName('num').AsString + rs('fmWaybill', 'From', 3)
         + ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);

      irKAgent.Text := FieldByName('kaname').AsString;
      irKAFullName.Text := FieldByName('kafullname').AsString;
      irKAPhone.Text := FieldByName('kaphone').AsString;
      irFax.Text := FieldByName('fax').AsString;

      if Trim(FieldByName('email').AsString) <> ''
        then irEmail.Text := 'mailto:' + FieldByName('email').AsString
        else irEmail.Text := '';

      irWWW.Text := FieldByName('www').AsString;

      irKAAdress.Text := FieldByName('postindex').AsString;
      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('country').AsString) <> '')
        then irKAAdress.Text := FieldByName('country').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('country').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('district').AsString) <> '')
        then irKAAdress.Text := FieldByName('district').AsString + ', ' +irKAAdress.Text
        else irKAAdress.Text := FieldByName('district').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('city').AsString) <> '')
        then irKAAdress.Text := FieldByName('city').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('city').AsString + irKAAdress.Text;

      if (Trim(irKAAdress.Text) <> '') and (Trim(FieldByName('address').AsString) <> '')
        then irKAAdress.Text := FieldByName('address').AsString + ', ' + irKAAdress.Text
        else irKAAdress.Text := FieldByName('address').AsString + irKAAdress.Text;

      if FindField('currrate') <> nil then FCurrRate := FieldByName('currrate').AsFloat;

      if FindField('reason') <> nil then irReason.Text := FieldByName('reason').AsString;

      irNotes.Text := FieldByName('notes').AsString;
      irPerson.Text := FieldByName('personname').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

      colSummCurr.Caption := rs('fmWaybill', 'SummCurr') + ', ' + fieldbyname('currname').AsString;
      lTotalCurr.Caption := rs('fmWaybill', 'TotalIn') + ' ' + cdsMain.FieldByName('currname').AsString + ':';

      //colSummDef.Visible := (BaseCurrID <> FieldByName('currid').AsInteger) and not IsEmpty;
      //if colSummDef.Visible then
          colPriceInCurr.Caption := rs('fmWaybill', 'PriceInCurr') + ', ' + FieldByName('currname').AsString;
      //else colPrice.Caption := rs('fmWaybill', 'PriceWithNDS') + ', ' + BaseCurrName;

      bvlCurrSep.Visible := colSummDef.Visible;
      stSummCurr.Visible := colSummDef.Visible;

      lTotalCurr.Visible := colSummDef.Visible;

      if tsDocRel.TabVisible then begin
        cdsRel.Close;
        cdsRel.Open;
      end;
    end // if not isEmpty
    else begin
      irNum.Text := '';
      irKAgent.Text := '';
      irKAPhone.Text := '';
      irKAFullName.Text := '';
      irKAAdress.Text := '';
      irCurr.Text := '';
      irReason.Text := '';
      irPerson.Text := '';
      irFax.Text := '';
      irEmail.Text := '';
      irWWW.Text := '';
      irStatus.Text := '';
      irNotes.Text := '';
      colSummDef.Visible := False;
      colSummCurr.Caption := rs('fmWaybill', 'SummCurr') + ', ' + BaseCurrName;
      colPriceInCurr.Caption := rs('fmWaybill', 'PriceInCurr') + ', ' + BaseCurrName;
    end;
  end;

  RefreshDetail;
  GetSummAll;

  if cdsDetail.IsEmpty
    then FPosID := 0
    else FPosID := cdsDetail.FieldByName('posid').AsInteger;

  SetCurrIDToBuffer(cdsMain.FieldByName('docid').AsInteger, FPosID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not pcMain.Visible or not cdsMain.Active then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsInfo then begin
      LoadPayment;
      DSRefresh(cdsDetail, 'posid', 0);
      grdDetNeedAdjust(grdDet);
      GetSummAll;
    end
    else if pcMain.ActivePage = tsPositions then begin
      DSRefresh(cdsDetail, 'posid', 0);
      grdDetNeedAdjust(grdDet);
      GetSummAll;
    end
    else if pcMain.ActivePage = tsDocRel then begin
      if tsDocRel.TabVisible then DSRefresh(cdsRel, 'docid', 0);
      AdjustGrid(grdDocRel, colDRTypeName);
    end;

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.pcMainChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colRecNoGetText') else _udebug := nil;{$ENDIF}

  if (ANode <> nil) and (Atext <> '') then AText := IntToStr(ANode.Index + 1);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.LoadPayment;
  (*var
    tmpDate: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.LoadPayment') else _udebug := nil;{$ENDIF}

  with newDataset do
    try
      Screen.Cursor := crSQLWait;
      ProviderName := 'pWayBillPay_Get';
      FetchParams;
      Params.ParamByName(_ID_).AsInteger := cdsMain.FieldByName(_ID_).AsInteger;
      Open;
      if not IsEmpty then begin
        irPayMPerson.Text := FieldByName('name').AsString;
        irPayType.Text := FieldByName('typename').AsString;
        tmpDate := ssDateToStr(FieldByName('ondate').AsDateTime);
        irPayment.Text := amountPrefix + FieldByName('docnum').AsString + ' ' +
          rs('fmWaybill', 'From') + ' ' + tmpDate + ' ' +
          AnsiLowerCase(rs('fmWaybill', 'DocsSumm')) + ' ' +
          FormatFloat(MoneyDisplayFormat, FieldByName('total').AsFloat) + ' ' +
          FieldByName('shortname').AsString;
      end
      else begin
        irPayment.Text := '';
        irPayType.Text := '';
        irPayMPerson.Text := '';
      end;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmBaseWBDoc.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsDetailBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if FcdsDetailOpening then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsDetailBeforeOpen') else _udebug := nil;{$ENDIF}

  FcdsDetailOpening := True;

  inherited;

  try
    try
      cdsDetailFetch.Close;
      cdsDetailFetch.Open;
      //CopyDataSet(cdsDetail, cdsDetailFetch);

    except
      raise;
    end;

  finally
    FcdsDetailOpening := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsDetailFetchBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsDetailFetchBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsDetailFetch.Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);

  with cdsDetail do begin
    DisableControls;
    First;

    while not Eof do begin
      UpdatePos;
      Next;
    end;

    First;
    EnableControls;
  end;
  
  GetSummAll;

  with cdsMain do
    if not IsEmpty then begin
      if FieldByName('currid').AsInteger = BaseCurrID
        then irCurr.Text := FormatFloat(MoneyDisplayFormat, FieldByName('summall').AsCurrency) + ' ' + BaseCurrName
        else begin
          irCurr.Text := stSummCurr.Caption + ' ' + FieldByName('currname').AsString + ' = '
            + FieldByName('summall').AsString + ' ' + BaseCurrName + ' ('
            + rs('fmWaybill', 'Kurs') + ': ' + FloatToStr(FCurrRate) +  ' ' + BaseCurrName + ')';
        end;
    end
    else irCurr.Text := '';

  ShowTotalAmountNode;

  UpdateActionList;

  if grdDet.FocusedNode <> nil
    then grdDet.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef: Extended;
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
    FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if cdsDetail.FindField('onvalue') <> nil
          then FCurrRate := VarToFloat(Items[i].Values[colRate.Index]);

        FNorm := 0;

        try
          if not VarIsNull(Items[i].Values[colNorm.Index])
            then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
            else FNorm := 1;
        except
          FNorm := 0;
        end;

        if FNorm > 0 then FAmount := FNorm * FAmount;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        AllSummCurr := AllSummCurr + SummCurr;

      except
        ;
    //Items[i].Values[colSummCurr.Index] := 0;
      end;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefNDS + SummDefOutNDS, -2);
          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;

          NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
            ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

        end
        else Items[i].Values[colSummDef.Index] := 0;

      except
    //Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;

    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := cdsDetail.FieldByName('matid').AsInteger;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0;
      ID := cdsDetail.FieldByName('matid').AsInteger;
      ShowModal;
      
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := cdsDetail.FieldByName('matid').AsInteger;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(PriceDisplayFormatEx, RoundToA(StrToFloat(AText), -6));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBaseWBDoc.GetDelStr(AID: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.GetDelStr') else _udebug := nil;{$ENDIF}

  case FunID of
    21: Result := rs('fmWaybill', 'DocWBIn');
    23: Result := rs('fmWaybill', 'DocWBOut');
    30: Result := rs('fmWaybill', 'DocAccOut');
    33: Result := rs('fmWaybill', 'DocTaxWB');
    36: Result := rs('fmWaybill', 'DocWBMove');
    44: Result := rs('fmWaybill', 'DocWBRest');
    41: Result := rs('fmWaybill', 'DocWriteOff');
    42: Result := rs('fmWaybill', 'DocWBRetIn');
    43: Result := rs('fmWaybill', 'DocWBRetOut');
    53: Result := rs('fmWaybill', 'DocInv');
    62: Result := rs('fmWaybill', 'DocInvoice');
    64: Result := rs('fmWaybill', 'DocOrderOut');
    65: Result := rs('fmWaybill', 'DocOrderIn');
  end;

  Result := Result + amountPrefix + cdsMain.FieldByName('num').AsString +
    RS('fmWaybill', 'From', 3) +
    DateToStr(cdsMain.FieldByName('ondate').AsDateTime) + ' ' +
    AnsiLowerCase(RS('fmWaybill', 'DocsSumm')) + ' ' +
    FormatFloat(MoneyDisplayFormat, cdsMain.FieldByName('summall').AsFloat) +
    BaseCurrName;

  if not (FunID in [44, 53, 41, 36])
    then Result := Result + ' (' + cdsMain.FieldByName('kaname').AsString + ')';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoDelete') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
    then try
      Application.ProcessMessages;

      if DelToRecycleBin then begin
        if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), False, Self.FunID)
        then begin
          ssMessageDlg(rs('Common','ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
      end
      else
        if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
          then raise Exception.Create(rs('Common','DeleteError'));

      LocateAfterDel;
      DoRefresh(0);
      RefreshFun('TfmWMat', 0);
      UpdateActionList;

      {if RefreshAllClients then begin
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
      end;
      }

    except
      on e:exception do ssMessageDlg(rs('Common', 'NoDelete'), ssmtError, [ssmbOk]);
    end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdMainDblClick') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if grdMain.Count > 0 then begin
    if aProperties.Enabled
      then DoProperties
      else begin
        if aCheck.Enabled then DoCheck(True);
        UpdateActionList;
        if aProperties.Enabled then DoProperties;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.Splitter1Moved(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.Splitter1Moved') else _udebug := nil;{$ENDIF}

  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aMCExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aMCExecute') else _udebug := nil;{$ENDIF}

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    ID := cdsDetail.FieldByName('matid').AsInteger;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsDocRelBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsDocRelBeforeOpen') else _udebug := nil;{$ENDIF}


  with cdsDocRel do begin
    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsDocRel, 'docid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsRelBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsRelBeforeOpen') else _udebug := nil;{$ENDIF}

  //cdsRel.Params.ParamByName('wbillid').AsInteger := cdsMain.FieldByName('wbillid').AsInteger;
  cdsRel.Params.ParamByName('docid').AsInteger := cdsMain.FieldByName('docid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colDROnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), ANode.Values[colDROnDate.Index]);
  except
    AText := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colDRTypeNameGetText') else _udebug := nil;{$ENDIF}

  case ANode.Values[colDRType.Index] of
     5: AText := rs('fmWaybill', 'DocWBRest');
     1: AText := rs('fmWaybill', 'DocWBIn');
    -1: AText := rs('fmWaybill', 'DocWBOut');
     2: AText := rs('fmWaybill', 'DocAccOut');
    -5: AText := rs('fmWaybill', 'DocWriteOff');
     7: AText := rs('fmWaybill', 'DocInv');
    -7: AText := rs('fmWaybill', 'DocTaxWB');
    -3: AText := rs('fmWaybill', 'PDOut');
     3: AText := rs('fmWaybill', 'PDIn');
     8: AText := rs('fmWaybill', 'ContrIn');
    -8: AText := rs('fmWaybill', 'ContrOut');
    -9: AText := rs('fmWaybill', 'DocInvoice');
   -16: AText := rs('fmWaybill', 'DocOrderOut');
    16: AText := rs('fmWaybill', 'DocOrderIn');
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoLocate(const AID: Integer; ASubID: Integer = 0);
  var
    FFrom, FTo, FDocDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoLocate') else _udebug := nil;{$ENDIF}

  grdMain.ClearSelection;
  srcMain.ChangeDelay := 0;
  
  if not cdsMain.Locate('docid', AID, []) then
    with newDataSet do
    try
      if Self.RefType = prTypes.rtTaxWB
        then ProviderName := 'pTaxWB_Get_Doc'
        else ProviderName := 'pWaybill_Get_Doc';

      FetchParams;
      Params.ParamByName('docid').AsInteger := AID;
      Open;

      if IsEmpty
        then begin
          if AID <> 0
            then ssMessageDlg(rs('fmWaybill', 'DocNotFound'), ssmtError, [ssmbOK])
            else SelectFocusedNode;
        end
        else begin
          CanRefresh := False;

          if prdMain.FromDate = 0
            then FFrom := MinDateTime
            else FFrom := prdMain.FromDate;

          if prdMain.ToDate = 0
            then FTo := MaxDateTime
            else FTo := LastSecondInDay(prdMain.ToDate);

          FDocDate := FieldByName('ondate').AsDateTime;
          if (FDocDate < FFrom) or (FDocDate > FTo) then begin
            prdMain.PeriodType := ptCustom;
            prdMain.FromDate := Int(FDocDate);
            prdMain.ToDate := Int(FDocDate);
          end;
          
          if lcbKAgent.Visible and (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue)
            then lcbKAgent.KeyValue := FieldByName('kaid').AsInteger;

          if cbChecked.EditValue > 0 then cbChecked.EditValue := 2 - FieldByName('checked').AsInteger;

          CanRefresh := True;
          DSRefresh(cdsMain, 'docid', AID);
        end;

      Close;

    finally
      Free;
    end;

  if (ASubID > 0) and (cdsDetail.Active) then cdsDetail.Locate('posid', ASubID, []);

  srcMain.ChangeDelay := 250;
  SelectFocusedNode;
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aGotoDocExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aGotoDocExecute') else _udebug := nil;{$ENDIF}

  FID := cdsRel.FieldByName('docid').AsInteger;

  case cdsRel.FieldByName('doctype').AsInteger of
      1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybill', FID);
     -1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybillOut', FID);
      2: frmMainForm.ExecLocate(vtDocs, 'TfmAccOut', FID);
      5: frmMainForm.ExecLocate(vtWMat, 'TfmWBRest', FID);
     -5: frmMainForm.ExecLocate(vtWMat, 'TfmWriteOff', FID);
      7: frmMainForm.ExecLocate(vtWMat, 'TfmInventory', FID);
     -7: frmMainForm.ExecLocate(vtDocs, 'TfmTaxWB', FID);
     -3: frmMainForm.ExecLocate(vtDocs, 'TfmPayDoc', FID, 207);
      3: frmMainForm.ExecLocate(vtDocs, 'TfmPayDoc', FID, 206);
      8: frmMainForm.ExecLocate(vtDocs, 'TfmContr', FID, 20);
     -8: frmMainForm.ExecLocate(vtDocs, 'TfmContr', FID, -20);
     -9: frmMainForm.ExecLocate(vtDocs, 'TfmInvoices', FID);
    -16: frmMainForm.ExecLocate(vtDocs, 'TfmOrders', FID, -16);
     16: frmMainForm.ExecLocate(vtDocs, 'TfmOrders', FID, 16);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdDocRelDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdDocRelDblClick') else _udebug := nil;{$ENDIF}

  aGotoDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.cdsRelAfterOpen(DataSet: TDataSet);
  var
    BM: TBookmark;
    FSkip: Boolean;
    FDocType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsRelAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  with cdsRel do begin
    DisableControls;
    //BM := GetBookmark;

    try
      First;
      while not Eof do begin
        FDocType := FieldByName('doctype').AsInteger;
        FSkip := True;

        case RefType of
          {
          prTypes.rtWBIn:
            FSkip := (FDocType = -3) or (FDocType = 8) or (FDocType = 16);

          prTypes.rtWBOut:
            FSkip := (FDocType = 3) or (FDocType = 2) or (FDocType = -7) or
                     (FDocType = -8) or (FDocType = -9) or (FDocType = -16);
          }

          prTypes.rtAccOut:
            FSkip := (FDocType = 3) or (FDocType = -1) or (FDocType = -8);

          prTypes.rtWBRetIn:
            FSkip := (FDocType = -3);

          prTypes.rtWBRetOut:
            FSkip := (FDocType = 3);

          prTypes.rtWBRest:
            FSkip := (FDocType = 7);

          prTypes.rtWriteOff:
            FSkip := (FDocType = 7);

          prTypes.rtInvoice:
            FSkip := (FDocType = -1) or (FDocType = 3);

          prTypes.rtOrderOut:
            FSkip := (FDocType = 3) or (FDocType = -1);

          prTypes.rtOrderIn:
            FSkip := (FDocType = -3) or (FDocType = 1);

          prTypes.rtTaxWB:
            FSkip := (FDocType = -1);
        end;

        if FSkip then Next else Delete;

      end;
    finally
      //GotoBookmark(BM);
      //FreeBookmark(BM);
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.irKAgentButtonClick(Sender: TObject; AbsoluteIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.irKAgentButtonClick') else _udebug := nil;{$ENDIF}

  if cdsMain.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := Self.cdsMain.FieldByName('kaid').AsInteger;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aSvcInfoExecute') else _udebug := nil;{$ENDIF}


  with TfrmEditServices.Create(nil) do
    try
      ParentNameEx := 'fmServices';
      OnDate := Self.OnDate;
      ID := cdsDetail.FieldByName('matid').AsInteger;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aDetColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aDetColParamsExecute') else _udebug := nil;{$ENDIF}

  grdDet.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdDetNeedAdjust(Sender: TObject);
  var
    ACol: TdxDBTreeListColumn;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdDetNeedAdjust') else _udebug := nil;{$ENDIF}

  ACol := GetFirstVisibleCol(grdDet);
  if ACol <> nil then AdjustGrid(grdDet, ACol);
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdDetChangedColumnsWidth(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdDetChangedColumnsWidth') else _udebug := nil;{$ENDIF}

  grdDetNeedAdjust(grdDet);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfmBaseWBDoc.GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.GetFirstVisibleCol') else _udebug := nil;{$ENDIF}

  Result := nil;
  for i := 1 to AGrid.ColumnCount - 1 do
    if (AGrid.Columns[i].Visible) and (AGrid.Columns[i] <> colRecNo) and (AGrid.Columns[i].Tag > 0)
    then begin
      Result := AGrid.Columns[i];
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colDetNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colDetNDSGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colNDSGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colNDSGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aDRPrintExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aDRPrintExecute') else _udebug := nil;{$ENDIF}

  FID := GetByDocID(cdsRel.FieldByName('docid').AsInteger);

  case cdsRel.FieldByName('doctype').AsInteger of
      1: xRep.ShowRep(rtWBIn, FID);
     -1: xRep.ShowRep(rtWBOut, FID);
      2: xRep.ShowRep(rtAccOut, FID);
      5: xRep.ShowRep(rtWBRest, FID);
     -5: xRep.ShowRep(rtWriteOff, FID);
      7: xRep.ShowRep(rtInv, FID);
     -9: xRep.ShowRep(rtWBOutInvoice, FID);
    -16: xRep.ShowRep(rtOrderOut, FID);
     16: xRep.ShowRep(rtOrderIn, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.ShowTotalAmountNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.ShowTotalAmountNode') else _udebug := nil;{$ENDIF}

  try
    if not cdsDetailFetch.IsEmpty and (cdsDetailFetch.Aggregates[0].Value = cdsDetailFetch.Aggregates[1].Value) then begin
      irAmount.Visible := True;

      irAmount.Text := FormatFloat(MatDisplayFormat, cdsDetailFetch.Aggregates[2].Value) + ' ' + cdsDetailFetch.FieldByName('msrname').AsString;

      irAmount.Node.MoveTo(irReason.Node, inaInsert);
    end
    else begin
      irAmount.Visible := False;
    end;

  except
    irAmount.Visible := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aFindAtWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aFindAtWHExecute') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecLocate(vtWMat, 'TfmWMat', cdsDetail.FieldByName('matid').AsInteger, cdsDetail.FieldByName('posid').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdMainNeedAdjust(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmBaseWBDoc.colDocSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colDocSaldoCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if VarToFloat(ANode.Values[colDocSaldo.Index]) < 0 then AFont.Color := clRed;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colSummPayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colSummPayGetText') else _udebug := nil;{$ENDIF}

  try
    if AText <> '' then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Color := clokFilter;
  panFooter.Color := clokFooter;
  panDetFooter.Color := clokFooter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colDRSummAllGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FCurr: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colDRSummAllGetText') else _udebug := nil;{$ENDIF}

  try
    FCurr := VarToStr(ANode.Values[colDRShortName.Index]);
    if FCurr = '' then FCurr := BaseCurrName;
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText)) + ' ' + FCurr;

  except
    AText := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBaseWBDoc.GetByDocID(ADocID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.GetByDocID') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataset do
  try
    ProviderName := 'pWaybill_GetByDocID';
    FetchParams;
    Params.ParamByName('docid').AsInteger := ADocID;
    Open;
    Result := FieldByName('wbillid').AsInteger;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aShowNullBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aShowNullBallanceExecute') else _udebug := nil;{$ENDIF}

  if not aShowNullBallance.Checked
    then FShowNullBallanceStr := ' and formatfloat(wblist.summall - coalesce(wblist.summpay, 0), -2) <> 0'
    else FShowNullBallanceStr := '';

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if VarToInt(ANode.Values[colArchived.Index]) = 1 then AFont.Color := clBtnShadow;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aFindAtMatsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aFindAtMatsExecute') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecLocate(vtRefs, 'TfmMaterials', cdsDetail.FieldByName('matid').AsInteger, cdsDetail.FieldByName('grpid').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aFindAtSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aFindAtSvcExecute') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecLocate(vtRefs, 'TfmServices', cdsDetail.FieldByName('matid').AsInteger, cdsDetail.FieldByName('grpid').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.aAddPayDocExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.aAddPayDocExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmBaseWBDoc.grdMainGetGroupNodeAddText(Sender: TObject; Node: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.grdMainGetGroupNodeAddText') else _udebug := nil;{$ENDIF}

  AText := ' (' + IntToStr(Node.Count) + ' ' + DeclineWordList(Node.Count, rs('lang', 'DocumentDeclensions')) + ')';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colCheckedGetText') else _udebug := nil;{$ENDIF}

  if AText = '0' then AText := '-1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.colRCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.colRCheckedGetText') else _udebug := nil;{$ENDIF}

  if AText = '0' then AText := '-1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.prdMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.prdMainChange') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    s: String;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if cdsDetail.IsEmpty then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.UpdatePos') else _udebug := nil;{$ENDIF}

  with cdsDetail do begin
    try
      FAmount := FieldByName('amount').AsFloat;
      FPriceCurr := FieldByName('price').AsFloat;
      FNDS := FieldByName('nds').AsFloat;
      FCurrRate := FieldByName('onvalue').AsFloat;

    except
      raise;  // wtf???
    end;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    //if FNorm > 0 then FAmount := FAmount * FNorm;

    FSummCurr := RoundToA(FAmount * FPriceCurr, -2);

    try
      Edit;
      FieldByName('sumcurr').AsCurrency := FSummCurr;
      FieldByName('pricewithnds').AsFloat := FPriceWithNDS;
      FieldByName('pricewonds').AsFloat := FPriceWONDS;
      FieldByName('sumwithnds').AsFloat := FSummWithNDS;
      FieldByName('sumnds').AsFloat := FSummNDS;
      FieldByName('sumwonds').AsFloat := FSummWONDS;
      FieldByName('onvalue').AsFloat := FCurrRate;
      Post;

    except
      on e: Exception do begin
        //very possible DB corruption. appears when already null-ed 'required' field(s) was fetched from DB.
        // also happens when there is no positions in the document what does not allowed
        if pos('Field value required', e.Message) > 0 then begin
          s := e.Message + '\n';

          {$IFDEF DEBUG}
          s := s + 'fields: \n';

          for i := 0 to FieldCount - 1 do begin
            s := s + Fields[i].Name + ' (' + Fields[i].FieldName + '): ';

            if Fields[i].Required then s := s + 'Required, ';
            if Fields[i].ReadOnly then s := s + 'ReadOnly, ';
            if Fields[i].FieldKind <> fkData then s := s + 'not fkData, ';
            if Fields[i].IsNull then s := s + 'NULL, ';

            s := s + '\n';
          end;
          {$ENDIF}

          ssMessageDlg(s + rs('Common', 'Err_DBFixReq'), ssmtError, [ssmbOK])
        end;
      end;
    end;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoCopy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoCopy') else _udebug := nil;{$ENDIF}

  grdDet.CopySelectedToClipboard;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseWBDoc.DoExcel(Grid: TdxDBGrid);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.DoExcel') else _udebug := nil;{$ENDIF}

  if Grid <> nil then begin
    Grid := grdDet;
    buildExpList(Grid);
  end;

  inherited DoExcel(Grid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BaseWBDoc', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
