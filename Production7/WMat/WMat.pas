{$I ok_sklad.inc}
unit WMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssClientDataSet, ssBaseTypes,
  FR_DSet, FR_DBSet, FR_Class, FR_Desgn, cxPC, cxControls, prTypes,
  ssDataSource, ExtCtrls, StdCtrls, ssBevel, ComCtrls, ssMemDS, TB2Item,
  ssDBGrid, cxDropDownEdit, ssDBLookupCombo, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxCalendar, ssSpeedButton, ssLabel, dxDBTLCl6,
  dxGrClms6, Math, TB2ExtItems, strUtils;

const
  WM_SHOW_PROGRESS = WM_USER + 1000;

type
  TfmWMat = class(TssBaseFrame)
    aAddFunctions: TAction;
    aCreateAccOut: TAction;
    aCreateWBMove: TAction;
    aCreateWBOut: TAction;
    aCreateWriteOff: TAction;
    aDetColParams: TAction;
    aGotoDoc: TAction;
    aGotoOrder: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMatsColOptions: TAction;
    aMatsDel: TAction;
    aMatsSelectAll: TAction;
    aMCColOptions: TAction;
    aMCJump: TAction;
    aOColOptions: TAction;
    aOrder: TAction;
    aOrderMinRsv: TAction;
    aRecalc: TAction;
    aRecalcAll: TAction;
    aRePosting: TAction;
    aShowMCList: TAction;
    aShowNull: TAction;
    aShowNullPos: TAction;
    aWriteOffAll: TAction;
    btnKagent: TssSpeedButton;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cdsFind: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsOrdered: TssClientDataSet;
    cdsOrderedCURRID: TIntegerField;
    cdsOrderedDOCID: TIntegerField;
    cdsOrderedDOCNUM: TStringField;
    cdsOrderedkaname: TStringField;
    cdsOrderedNAME: TStringField;
    cdsOrderedONDATE: TDateTimeField;
    cdsOrderedONVALUE: TFloatField;
    cdsOrderedORDERED: TFloatField;
    cdsOrderedPOSID: TIntegerField;
    cdsOrderedPRICE: TFloatField;
    cdsOrderedREMAIN: TFloatField;
    cdsOrderedreserved: TFloatField;
    cdsOrderedRSV: TFloatField;
    cdsOrderedSHORTNAME: TStringField;
    cdsOrderedTODATE: TDateTimeField;
    cdsOrderedWBILLID: TIntegerField;
    cdsOrderedWID: TIntegerField;
    cdsOrderedWTYPE: TIntegerField;
    cdsPrice: TssClientDataSet;
    cdsPriceCERTDATE: TDateTimeField;
    cdsPriceCERTNUM: TStringField;
    cdsPriceDOCID: TIntegerField;
    cdsPriceDOCNUM: TStringField;
    cdsPriceGTD: TStringField;
    cdsPriceNAME: TStringField;
    cdsPriceONDATE: TDateTimeField;
    cdsPriceONVALUE: TFloatField;
    cdsPricePOSID: TIntegerField;
    cdsPricePRICE: TFloatField;
    cdsPricePRODUCER: TStringField;
    cdsPriceREMAIN: TFloatField;
    cdsPricereserved: TFloatField;
    cdsPriceRSV: TFloatField;
    cdsPriceSHORTNAME: TStringField;
    cdsPriceSN: TStringField;
    cdsPriceTypes: TssClientDataSet;
    cdsPriceWBILLID: TIntegerField;
    cdsPriceWID: TIntegerField;
    cdsPriceWTYPE: TIntegerField;
    cdsPT: TssClientDataSet;
    cdsRsv_Temp: TssClientDataSet;
    cdsView: TssClientDataSet;
    cdsViewARTIKUL: TStringField;
    cdsViewAVGPRICE: TFloatField;
    cdsViewBARCODE: TStringField;
    cdsViewCOUNTRY: TStringField;
    cdsViewisserial: TIntegerField;
    cdsViewMATID: TIntegerField;
    cdsViewMATNAME: TStringField;
    cdsViewminreserv: TFloatField;
    cdsViewminrsvneeded: TFloatField;
    cdsViewMSRNAME: TStringField;
    cdsViewNUM: TIntegerField;
    cdsViewofree: TFloatField;
    cdsViewordered: TFloatField;
    cdsVieworsv: TFloatField;
    cdsViewprices: TStringField;
    cdsViewPRODUCER: TStringField;
    cdsViewREMAIN: TFloatField;
    cdsViewreserved: TFloatField;
    cdsViewRSV: TFloatField;
    cdsViewtfree: TFloatField;
    cdsViewtremain: TFloatField;
    cdsViewtrsv: TFloatField;
    cdsWH: TssClientDataSet;
    cdsWHouse: TssClientDataSet;
    cdsWHouseNAME: TStringField;
    cdsWHouseREMAIN: TFloatField;
    cdsWHousereserved: TFloatField;
    cdsWHouseRSV: TFloatField;
    cdsWHouseWID: TIntegerField;
    colArtikul: TdxDBGridColumn;
    colAtWH: TdxDBGridColumn;
    colAvgPrice: TdxDBGridColumn;
    colBarCode: TdxDBGridColumn;
    colCountry: TdxDBGridColumn;
    colCurName: TdxDBGridColumn;
    colFree: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colInWay: TdxDBGridColumn;
    colMAmount: TdxDBGridColumn;
    colMCArtikul: TdxDBGridColumn;
    colMCBarCode: TdxDBGridColumn;
    colMCCountry: TdxDBGridColumn;
    colMCFree: TdxDBGridColumn;
    colMCGrpName: TdxDBGridColumn;
    colMCID: TdxDBGridColumn;
    colMCMsrName: TdxDBGridColumn;
    colMCName: TdxDBGridColumn;
    colMCProducer: TdxDBGridColumn;
    colMCRsv: TdxDBGridColumn;
    colMCTotal: TdxDBGridColumn;
    colMeasure: TdxDBGridColumn;
    colMinReserv: TdxDBGridColumn;
    colMinRsvNeeded: TdxDBGridColumn;
    colMMatArtikul: TdxDBGridColumn;
    colMMatID: TdxDBGridColumn;
    colMMatName: TdxDBGridColumn;
    colMPrice: TdxDBGridColumn;
    colMPriceType: TdxDBGridLookupColumn;
    colMRecNo: TdxDBGridColumn;
    colMSumm: TdxDBGridColumn;
    colMWHName: TdxDBGridLookupColumn;
    colName: TdxDBGridColumn;
    colNo: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOAmount: TdxDBGridColumn;
    colODocDate: TdxDBGridColumn;
    colODocNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colOnTime: TdxDBGridColumn;
    colOnValue: TdxDBGridColumn;
    colOPosID: TdxDBGridColumn;
    colOPrice: TdxDBGridColumn;
    colOPriceInCurr: TdxDBGridColumn;
    colORate: TdxDBGridColumn;
    colOrdered: TdxDBGridColumn;
    colOrdFree: TdxDBGridColumn;
    colOrdRsv: TdxDBGridColumn;
    colORsv: TdxDBGridColumn;
    colOShortName: TdxDBGridColumn;
    colOSupplier: TdxDBGridColumn;
    colOToDate: TdxDBGridColumn;
    colOWHName: TdxDBGridColumn;
    colOWID: TdxDBGridColumn;
    colOWType: TdxDBGridImageColumn;
    colP_CertDate: TdxDBGridColumn;
    colP_CertNum: TdxDBGridColumn;
    colP_GTD: TdxDBGridColumn;
    colP_Producer: TdxDBGridColumn;
    colPDocNum: TdxDBGridColumn;
    colPDocType: TdxDBGridImageColumn;
    colpPosID: TdxDBGridColumn;
    colPPrice: TdxDBGridColumn;
    colPPriceN: TdxDBGridColumn;
    colPRemain: TdxDBGridColumn;
    colPReserved: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colProducer: TdxDBGridColumn;
    colPWID: TdxDBGridColumn;
    colRemain: TdxDBGridColumn;
    colReserved: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    colSN: TdxDBGridColumn;
    colTFree: TdxDBGridColumn;
    colTRemain: TdxDBGridColumn;
    colTRsv: TdxDBGridColumn;
    colWBillID: TdxDBGridColumn;
    colWFree: TdxDBGridColumn;
    colWHouse: TdxDBGridColumn;
    colWID: TdxDBGridColumn;
    colWName: TdxDBGridColumn;
    colWRemain: TdxDBGridColumn;
    colWReserved: TdxDBGridColumn;
    edFromDate: TcxDateEdit;
    edToDate: TcxDateEdit;
    grdMain: TssDBGrid;
    grdMats: TssDBGrid;
    grdMC: TssDBGrid;
    grdOrdered: TssDBGrid;
    grdPrice: TssDBGrid;
    grdWHouse: TssDBGrid;
    itmCreateAcc: TTBItem;
    itmDefPT: TTBSubmenuItem;
    lcbKAgent: TssDBLookupCombo;
    lCount: TLabel;
    lFree: TLabel;
    lFreeMat: TLabel;
    lFromDate: TssLabel;
    lKAgent: TssLabel;
    lReserved: TLabel;
    lRsv: TLabel;
    lToDate: TssLabel;
    lTotal: TLabel;
    lTotalMat: TLabel;
    mdMats: TssMemoryData;
    mdMatsamount: TFloatField;
    mdMatsartikul: TStringField;
    mdMatsbarcode: TStringField;
    mdMatsdiscount: TFloatField;
    mdMatsfullprice: TFloatField;
    mdMatsmatid: TIntegerField;
    mdMatsmid: TIntegerField;
    mdMatsmsrname: TStringField;
    mdMatsname: TStringField;
    mdMatsnds: TFloatField;
    mdMatsposid: TIntegerField;
    mdMatsprice: TFloatField;
    mdMatsproducer: TStringField;
    mdMatsptypeid: TIntegerField;
    mdMatsptypename: TStringField;
    mdMatssumm: TFloatField;
    mdMatswhname: TStringField;
    mdMatswid: TIntegerField;
    mdMC: TssMemoryData;
    mdMCartikul: TStringField;
    mdMCbarcode: TStringField;
    mdMCcountry: TStringField;
    mdMCcurrid: TIntegerField;
    mdMCfree: TFloatField;
    mdMCgrpname: TStringField;
    mdMCmatid: TIntegerField;
    mdMCmsrname: TStringField;
    mdMCname: TStringField;
    mdMCnotes: TStringField;
    mdMCondate: TDateTimeField;
    mdMConvalue: TFloatField;
    mdMCprice: TFloatField;
    mdMCproducer: TStringField;
    mdMCrsv: TFloatField;
    mdMCshortname: TStringField;
    mdMCtotal: TFloatField;
    panClient: TPanel;
    panFilter: TPanel;
    panFooter: TPanel;
    panSummary: TPanel;
    panWHouse: TPanel;
    panWHouseFooter: TPanel;
    pcMain: TcxPageControl;
    pmAdd: TTBPopupMenu;
    pmMats: TTBPopupMenu;
    pmMC: TTBPopupMenu;
    pmOrdered: TTBPopupMenu;
    pmPrices: TTBPopupMenu;
    sepCreateAcc: TTBSeparatorItem;
    splMain: TSplitter;
    srcKAgent: TDataSource;
    srcMats: TDataSource;
    srcMC: TDataSource;
    srcOrdered: TDataSource;
    srcPrice: TDataSource;
    srcViewEx: TssDataSource;
    srcWHouse: TDataSource;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel18: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel20: TssBevel;
    ssBevel22: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    stFreeValue: TssBevel;
    stReservedValue: TssBevel;
    stTotalValue: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBItem29: TTBItem;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    tsAdd: TcxTabSheet;
    tsMC: TcxTabSheet;
    tsOrdered: TcxTabSheet;
    tsPrice: TcxTabSheet;
    tsWHouse: TcxTabSheet;
    txtCount: TssBevel;
    txtFree: TssBevel;
    txtRsv: TssBevel;
    txtTotal: TssBevel;

    procedure aAddFunctionsExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure aCreateAccOutExecute(Sender: TObject);
    procedure aCreateWBMoveExecute(Sender: TObject);
    procedure aCreateWBOutExecute(Sender: TObject);
    procedure aCreateWriteOffExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDetColParamsExecute(Sender: TObject);
    procedure aGotoDocExecute(Sender: TObject);
    procedure aGotoOrderExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aMatsColOptionsExecute(Sender: TObject);
    procedure aMatsDelExecute(Sender: TObject);
    procedure aMatsSelectAllExecute(Sender: TObject);
    procedure aMCColOptionsExecute(Sender: TObject);
    procedure aMCJumpExecute(Sender: TObject);
    procedure aOColOptionsExecute(Sender: TObject);
    procedure aOrderExecute(Sender: TObject);
    procedure aOrderMinRsvExecute(Sender: TObject);
    procedure aRecalcExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aShowEmptyPosExecute(Sender: TObject);
    procedure aShowMCListExecute(Sender: TObject);
    procedure aShowNullExecute(Sender: TObject);
    procedure aShowNullPosExecute(Sender: TObject);
    procedure aWriteOffAllExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure cdsOrderedAfterOpen(DataSet: TDataSet);
    procedure cdsOrderedBeforeOpen(DataSet: TDataSet);
    procedure cdsOrderedCalcFields(DataSet: TDataSet);
    procedure cdsPriceAfterOpen(DataSet: TDataSet);
    procedure cdsPriceBeforeOpen(DataSet: TDataSet);
    procedure cdsPriceCalcFields(DataSet: TDataSet);
    procedure cdsPriceTypesAfterOpen(DataSet: TDataSet);
    procedure cdsPTAfterOpen(DataSet: TDataSet);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure cdsViewCalcFields(DataSet: TDataSet);
    procedure cdsWHAfterOpen(DataSet: TDataSet);
    procedure cdsWHBeforeOpen(DataSet: TDataSet);
    procedure cdsWHouseAfterOpen(DataSet: TDataSet);
    procedure cdsWHouseBeforeOpen(DataSet: TDataSet);
    procedure cdsWHouseCalcFields(DataSet: TDataSet);
    procedure colAtWHGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colAvgPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colInWayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMCRsvCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colMCTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMPriceChange(Sender: TObject);
    procedure colMPriceTypeCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure colMRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMSummGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMWHNameCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
    procedure colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colODocDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colODocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnTimeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOPriceInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOToDateCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colOToDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPPriceNGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPTGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure grdMatsColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdMatsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMatsDblClick(Sender: TObject);
    procedure grdMatsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdMatsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdMatsEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure grdMatsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMatsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMatsNeedAdjust(Sender: TObject);
    procedure grdMCCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMCDblClick(Sender: TObject);
    procedure grdMCGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdOrderedDblClick(Sender: TObject);
    procedure grdOrderedGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdOrderedNeedAdjust(Sender: TObject);
    procedure grdPriceChangedColumnsWidth(Sender: TObject);
    procedure grdPriceClick(Sender: TObject);
    procedure grdPriceDblClick(Sender: TObject);
    procedure grdPriceGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdPriceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPriceNeedAdjust(Sender: TObject);
    procedure grdWHouseDblClick(Sender: TObject);
    procedure grdWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure mdMatsCalcFields(DataSet: TDataSet);
    procedure pcMainChange(Sender: TObject);
    procedure splMainMoved(Sender: TObject);
    procedure srcOrderedDataChange(Sender: TObject; Field: TField);
    procedure srcPriceDataChange(Sender: TObject; Field: TField);
    procedure srcViewExDelayedDataChange(Sender: TObject; Field: TField);
    procedure srcWHouseDataChange(Sender: TObject; Field: TField);

  private
    FMatName: string;
    FWHouseName: string;
    FWHCount: Integer;
    IsOneWH: Boolean;
    FSelected: Boolean;
    FPriceChanged: Boolean;

    function GetWHCount: Integer;
    procedure SetMatName(const Value: string);
    procedure SetWHouseName(const Value: string);
    function CheckWHCount: boolean;
    procedure WMShowProgress(var M: TMessage); message WM_SHOW_PROGRESS;
    procedure WMOKShowModal(var M: TMessage); message WM_OK_SHOWMODAL;
    procedure GetMCList;
    procedure RealignFilter;
    function GetWHByID(const WID: Integer): string;
    function GetWHList: string;
    function GetFinalPrice(AMatID, AKAID, APTypeID: Integer; var ADisc: Extended; var ANDS: Extended): Extended;
    procedure AddMatToDoc;
    procedure SelectWHErr;

  protected
    CurrPTypeID: Integer;

    procedure SavePTColumns;
    function GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;
    procedure SetGrdWHouseWidth;
    procedure SetGrdPriceWidth;
    procedure SetGrdMainWidth; virtual;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure SetCurrentID(const Value: integer); override;
    procedure SetParam(const Value: Integer); override;
    procedure LoadGrids; override;
    procedure SaveGrids; override;

  private
    CanRefresh: Boolean;
    InRefresh: Boolean;
    FParam: Integer;
    FromTime, ToTime: Integer;

    procedure RefreshDetail;
    procedure SetTitle;
    procedure BuildPTMenu(AID: Integer);
    procedure mnuPTClick(Sender: TObject);
    procedure SetPTForAll(AID: Integer);

    property MatName: string read FMatName write SetMatName;
    property WHouseName: string read FWHouseName write SetWHouseName;

  public
    ByW: boolean;
    WID: Integer;
    ShowGrp: Boolean;

    CurrAmount: Extended;
    FMode: Integer;
    PosInfo: TPosInfo;
    DocInfo: TokAddDocInfo;

    procedure FillMD;
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoShow; override;
    procedure DoDrillDown; override;
    procedure SetCaptions; override;
    procedure DoAfterFind(AParam: Integer = 0); override;
    procedure DoSetFocus; override;
    procedure DoShowFilter; override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure NotifyChanged; override;
  end;

  TWaitThread = class(TThread)
    public
      ParentWND: Pointer;
      procedure Execute; override;
  end;

var
  fmWMat: TfmWMat;

//==========================================================================
//==========================================================================
//==========================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun, Export, MatMove,
  ssStrUtil, ssDateUtils, fMessageDlg, MatRsv, EditMaterials, MCList,
  ssRegUtils, EditAccOut, EditWaybillOut, EditWaybillMov, EditWriteOff,
  EditOrderTmp, CCMain, Types, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'posid';

//==============================================================================================
procedure TfmWMat.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ShowEmptyPos', Integer(aShowNull.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ShowNullPos', Integer(aShowNullPos.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name + '\' + pcMain.Name, 'Height', pcMain.Height);

  if not ModalView
    then WriteToRegInt(MainRegKey + '\' + Self.Name, 'ActivePage', pcMain.ActivePageIndex);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoOpen(AParam: Variant);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoOpen') else _udebug := nil;{$ENDIF}

  edFromDate.Date := OnDate;
  edToDate.Date := OnDate;
  RefType := rtWMat;
  FindType := ftMeasures;

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;
  pcMain.ActivePageIndex := 0;

  inherited;

  if not LoadExpParams
    then with ExportList do
      for i := 0 to grdMain.ColumnCount - 1 do
        if grdMain.Columns[i].Tag = 1 then AddObject(grdMain.Columns[i].Name, pointer(1));

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ShowEmptyPos', i)
    then aShowNull.Checked := (i = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ShowNullPos', i)
    then aShowNullPos.Checked := (i = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + pcMain.Name, 'Height', i)
    then if i > 0 then pcMain.Height := i;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ActivePage', i)
    then pcMain.ActivePageIndex := i
    else pcMain.ActivePageIndex := 0;

  grdPriceNeedAdjust(grdPrice);
  SetGrdMainWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS('fmWMat', 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS('fmWMat', 'Name');
    colArtikul.Caption := GetRS('fmWMat', 'Artikul');
    colOWType.Caption := '';

    aMatsDel.Caption := GetRS('Common', 'Del');
    aMatsSelectAll.Caption := GetRS('Common', 'SelectAll');
    aMatsColOptions.Caption := GetRS('Common', 'ColOptions') + '...';
    aOrder.Caption := GetRS('fmOrders', 'ToOrder');
    aShowNull.Caption := GetRS('fmWMat', 'ShowNull');

    aOColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    tsAdd.Caption := ' ' + GetRS('fmMaterials', 'MatList') + ' ';
    tsOrdered.Caption := GetRS('fmWMat', 'Ordered') + ' ';

    colMMatName.Caption := GetRS('fmMaterials', 'Name');
    colMAmount.Caption := GetRS('fmWaybill', 'Amount');
    colMPriceType.Caption := GetRS('fmWaybill', 'PriceType');
    colMMatArtikul.Caption := GetRS('fmWMat', 'Artikul');
    colMWHName.Caption := GetRS('fmWMat', 'Title');
    colMSumm.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS') + ':';

    colAvgPrice.Caption := GetRS('fmWMat', 'AvgPrice');

    aMatMove.Caption := GetRS('fmWMat', 'MatMove');
    aMatRsv.Caption := GetRS('fmWMat', 'MatRsv');
    aMatInfo.Caption := GetRS('fmWMat', 'MatInfo');
    aMCJump.Caption := GetRS('fmWMat', 'MCJump');
    aShowMCList.Caption := GetRS('fmWMat', 'ShowMCList');
    aRecalc.Caption := GetRS('fmWMat', 'RecalcRemains');
    aRecalcAll.Caption := GetRS('fmWMat', 'RecalcRemainsAll');
    aDetColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aGotoDoc.Caption := GetRS('Common', 'Jump');
    aGotoOrder.Caption := GetRS('Common', 'Jump');
    aShowNullPos.Caption := GetRS('fmWMat', 'ShowNullPos');
    aOrderMinRsv.Caption := GetRS('fmWMat', 'OrderMinRsv');

    grdOrdered.Bands[0].Caption := GetRS('fmWMat', 'Order');
    colODocDate.Caption := GetRS('fmWMat', 'OrderDate');
    colODocNum.Caption := GetRS('fmWMat', 'OrderNo');
    colOToDate.Caption := GetRS('fmWMat', 'OrderToDate');
    colOWHName.Caption := GetRS('fmWMat', 'Title');
    colOAmount.Caption := GetRS('fmWMat', 'RemainEx');
    colOPriceInCurr.Caption := GetRS('fmWMat', 'Price');
    colOPrice.Caption := GetRS('fmWMat', 'NPrice');
    colORsv.Caption := GetRS('fmWMat', 'Reserved');
    colOSupplier.Caption := GetRS('fmWaybill', 'Supplier');

    colOrdFree.Caption := GetRS('fmWMat', 'FreeOrdered');
    colOrdRsv.Caption := GetRS('fmWMat', 'RsvOrdered');
    colTFree.Caption := GetRS('fmWMat', 'FreeAll');
    colTRsv.Caption := GetRS('fmWMat', 'RsvAll');
    colTRemain.Caption := GetRS('fmWMat', 'AllRemain');

    colMeasure.Caption := GetRS('fmWMat', 'Measure');
    colRemain.Caption := GetRS('fmWMat', 'TotalAtWH');
    colAtWH.Caption := GetRS('fmWMat', 'RemainAtWH');
    colOrdered.Caption := GetRS('fmWMat', 'TotalOrdered');
    colInWay.Caption := GetRS('fmWMat', 'InWay');
    colFree.Caption := GetRS('fmWMat', 'FreeAtWh');
    colReserved.Caption := GetRS('fmWMat', 'RsvAtWH');
    colBarCode.Caption := GetRS('fmMaterials', 'BarCode');
    colCountry.Caption := GetRS('fmMaterials', 'Country');
    colProducer.Caption := GetRS('fmMaterials', 'Producer');
    colMinReserv.Caption := GetRS('fmWMat', 'Minimum');
    colMinRsvNeeded.Caption := GetRS('fmWMat', 'NotEnough');
    
    grdMain.Bands[0].Caption := GetRS('fmWMat', 'Mat');
    grdMain.Bands[1].Caption := GetRS('fmWMat', 'Remain');
    grdMain.Bands[2].Caption := GetRS('fmWMat', 'MatReserv');
    grdMain.Bands[3].Caption := GetRS('fmWMat', 'Ordered');
    grdMain.Bands[4].Caption := GetRS('fmWMat', 'RemOrd');

    colMCName.Caption := GetRS('fmMaterials', 'MCName');
    colPrice.Caption := GetRS('fmWMat', 'LastInPrice');
    colMCTotal.Caption := GetRS('fmWMat', 'AllRemain');
    colMCFree.Caption := GetRS('fmWMat', 'Free');
    colMCRsv.Caption := GetRS('fmWMat', 'Reserved');
    colMCArtikul.Caption := colArtikul.Caption;
    colMCBarCode.Caption := colBarCode.Caption;
    colMCMsrName.Caption := colMeasure.Caption;
    colMCGrpName.Caption := GetRS('fmMaterials', 'MatGroup');
    colMCProducer.Caption := colProducer.Caption;
    colMCCountry.Caption := colCountry.Caption;
    aMCColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    tsWHouse.Caption := GetRS('fmWMat', 'MatsAtWH') + ' ';
    tsPrice.Caption := GetRS('fmWaybill', 'Partys') + '    ';
    tsMC.Caption := GetRS('fmWMat', 'MC') + ' ';
    colWName.Caption := GetRS('fmWMat', 'Title');
    colWRemain.Caption := GetRS('fmWMat', 'AllRemain');
    colWFree.Caption := GetRS('fmWMat', 'Free');
    colWReserved.Caption := GetRS('fmWMat', 'Reserved');

    lTotal.Caption := GetRS('fmWMat', 'AllRemain') + ':';
    lFree.Caption := GetRS('fmWMat', 'Free') + ':';
    lReserved.Caption := GetRS('fmWMat', 'Reserved') + ':';
    lCount.Caption := GetRS('fmWMat', 'MatCount') + ':';
    lTotalMat.Caption := GetRS('fmWMat', 'AllRemain') + ':';
    lFreeMat.Caption := GetRS('fmWMat', 'Free') + ':';
    lRsv.Caption := GetRS('fmWMat', 'Reserved') + ':';

    colWHouse.Caption := GetRS('fmWMat', 'Title');
    colOnDate.Caption := GetRS('fmWMat', 'InDate');
    colOnTime.Caption := GetRS('fmWMat', 'InTime');
    colPRemain.Caption := GetRS('fmWMat', 'RemainEx');
    colPPrice.Caption := GetRS('fmWMat', 'Price');
    colPPriceN.Caption := GetRS('fmWMat', 'NPrice');
    colPReserved.Caption := GetRS('fmWMat', 'Reserved');
    colSN.Caption := GetRS('fmWMat', 'SN');
    colPDocType.Caption := '';
    colPDocNum.Caption := GetRS('fmWMat', 'DocNum');
    colP_GTD.Caption := GetRS('fmWaybill', 'GTD');
    colP_CertNum.Caption := GetRS('fmWaybill', 'CertNum');
    colP_CertDate.Caption := GetRS('fmWaybill', 'CertDate');
    colP_Producer.Caption := GetRS('fmMaterials', 'Producer');

    lFromDate.Caption := GetRS('fmWaybill', 'FromDate');
    lToDate.Caption := GetRS('fmWaybill', 'ToDate');
    btnKAgent.Hint := GetRS('fmWaybill', 'KAAdd');
    lKAgent.Caption := GetRS('fmWaybill', 'KANameIn');
    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');
    lcbKAgent.Text := GetRS('Common', 'All');

    aCreateAccOut.Caption := GetRS('fmWMat', 'CreateAccOut') + '...';
    aCreateWBOut.Caption := GetRS('fmWMat', 'CreateWBOut') + '...';
    aCreateWBMove.Caption := GetRS('fmWMat', 'CreateWBMove') + '...';
    aCreateWriteOff.Caption := GetRS('fmWMat', 'CreateWriteOff') + '...';

    aAddFunctions.Caption := GetRS('fmWMat', 'AddFunctions');
    aRePosting.Caption := GetRS('fmWMat', 'RePosting');
    aWriteOffAll.Caption := GetRS('fmWMat', 'WriteOffAll');

    grdPrice.Bands[0].Caption := GetRS('fmWMat', 'Doc');
    grdPrice.Bands[2].Caption := GetRS('fmWMat', 'InPrice');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmWMat', 'NameD') + ';' + 'matname', pointer(1));
    FindList.AddObject(GetRS('fmWMat', 'ArtikulD') + ';' + 'artikul', pointer(2));
    FindList.AddObject(GetRS('fmMaterials', 'BarCodeD') + ';' + 'barcode', pointer(3));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.UpdateActionList') else _udebug := nil;{$ENDIF}

  aProperties.Enabled := False;
  aDel.Enabled := False;
  aDynamic.Enabled := False;
  aNew.Enabled := False;
  aPatternInsert.Enabled := False;
  aDrillDown.Enabled := (not ByW);// or (ByW and (ParentCCForm as TfrmCCMain).btnShowGrp.Checked);
  aPrint.Enabled := False;

  aMatMove.Enabled := not cdsView.IsEmpty;
  aMatRsv.Enabled := aMatMove.Enabled;
  aMatInfo.Enabled := aMatRsv.Enabled;
  aShowMCList.Enabled := aMatMove.Enabled;
  aGotoDoc.Enabled := (grdPrice.Count > 0) and not ModalView;
  aGotoOrder.Enabled := (grdOrdered.Count > 0) and not ModalView;
  aCreateAccOut.Enabled := (grdPrice.Count > 0) and not ModalView;
  aCreateWBMove.Enabled := aCreateAccOut.Enabled;
  aCreateWBOut.Enabled := aCreateAccOut.Enabled;
  aCreateWriteOff.Enabled := aCreateAccOut.Enabled;

  aMatsDel.Enabled := grdMats.SelectedCount > 0;
  if FMode > 1 then
    if mdMats.IsEmpty
      then FCurrentID := -1
      else FCurrentID := 1;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoRefresh') else _udebug := nil;{$ENDIF}

  case AParam of
    2: GrpID := 0;

    1: GrpID := AID;

    Integer(rtKAgent):
      begin
        DSRefresh(cdsKAgent, 'kaid', AID);
        lcbKAgent.KeyValue := AID;
        lcbKAgent.SelStart := 0;
        lcbKAgent.SelLength := 0;
      end;
  end;

  if not CanRefresh then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  Screen.Cursor := crSQLWait;
  InRefresh := True;

  try
    case AParam of
      2: begin
           GrpID := 0;
           WID := 0;
           DSRefresh(cdsView, 'matid', 0);
         end;

    -16: begin
           DSRefresh(cdsView, 'matid', 0);
         end;

      1: begin
           GrpID := AID;
           DSRefresh(cdsView, 'matid', 0);
         end
      else DSRefresh(cdsView, 'matid', AID);
    end;

  finally
    InRefresh := False;
    Screen.Cursor := crDefault;
    //if fLoading.Visible then fLoading.Hide;
  end;
  grdMain.ClearSelection;

  if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
      then AColor := GridOddLinesColor;

    if TComponent(Sender).Name = grdMain.Name then begin
      if (ANode.Values[colRemain.Index] < 0.000001) and (not ASelected)
        then AFont.Color := clGrayText;

      if ((AColumn = colReserved) and (ANode.Values[colReserved.Index] > 0))
         or ((AColumn = colOrdRsv) and (ANode.Values[colOrdRsv.Index] > 0))
         or ((AColumn = colTRsv) and (ANode.Values[colTRsv.Index] > 0))
      then AFont.Color := clRed;

      if HighlightNeededMats and not ASelected and (VarToFloat(ANode.Values[colMinRsvNeeded.Index]) > 0)
        then AColor := CL_OK_WMAT_HIGHLIGHT_NEEDED;

      if AnsiStartsStr('colPT', AColumn.Name) then begin // price type columns
        if not ShowPrices then Atext := rs('Common', 'NA');

        {with grdMain.DataSource.DataSet do begin
          try
            case FieldbyName(AnsiMidStr(AColumn.Name, 4, 99)).Tag of
              0: AFont.Color := $00FF2200; // BGR. % of incoming price
              1: AFont.Color := $00000000; // BGR. explicitly set price
              2,3: AFont.Color := $00BBBB22; // BGR. % of another price type
            end;
          except;
          end; // try
        }
      end;

    end
    else if TComponent(Sender).Name = grdWHouse.Name then begin
      if (ANode.Values[colWReserved.Index] > 0) and (AColumn = colWReserved)
        then AFont.Color := clRed;
    end

    else if Sender = grdPrice then begin
      if (ANode.Values[colPRemain.Index] < 0.000001) and (ANode.Values[colPReserved.Index] < 0.000001) and (not ASelected)
      then AFont.Color := clGrayText;

      if (ANode.Values[colPReserved.Index] > 0) and (AColumn = colPReserved)
        then AFont.Color := clRed;

    end
    else if Sender = grdOrdered then begin
      if (ANode.Values[colOAmount.Index] < 0.000001) and (ANode.Values[colORsv.Index] < 0.000001) and (not ASelected)
      then AFont.Color := clGrayText;

      if (ANode.Values[colORsv.Index] > 0) and (AColumn = colORsv)
      then AFont.Color := clRed;
    end;

  except
    //AColor := clRed; // mark the fuck
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    FChar: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  SearchInfo.Failed := False;

  if FindStr <> AStr then begin
    if FilterOnSearch then begin
      case ALocateType of
        ltSubstr: FChar := '%';
        else FChar := '';
      end;

      if AStr = ''
        then cdsView.Filter := ''
        else begin
          if cdsView.FieldByName(AFName) is TDateTimeField
            then cdsView.Filter := ''
            else cdsView.Filter := AFName + ' like ''' + FChar + AStr + '%''';
        end;

      cdsView.Filtered := True;
    end;
    //else cdsMain.Filtered := True;
    FindIndex := -1;
  end;

  FindStr := AStr;

  if AStr = '' then begin
    if FilterOnSearch then cdsView.Filtered := False;
    
    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := FindNode(grdMain, AFName, AStr, ALocateType, FindIndex, AFwd);

  if FNode <> nil then begin
    FindIndex := FNode.Index;
    grdMain.ClearSelection;
    grdMain.TopIndex := FNode.AbsoluteIndex;
    grdMain.FocusedAbsoluteIndex := FNode.AbsoluteIndex;
    FNode.Focused := True;

    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;

    SearchInfo.PrevFindStr := FindStr;
   end
   else begin
     SearchInfo.Failed := True;

     if FilterOnSearch then cdsView.Filtered := False;

     SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
   end;

   DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
  try
    if cdsFunc.Locate('classname', Self.ClassName, [])
      then FunID := cdsFunc.fieldbyname('funid').AsInteger
      else FunID := 0;

    grdExp := grdMain;
    lName.Caption := Self.Caption;
    FList := ExportList;

    if ShowModal <> mrOk
      then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
      else FShowExcel := chbShowExcel.Checked;

  finally
    Free;
  end;

  ExportToExcel(grdMain, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoPrint(AParam: integer = 0);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoPrint') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsViewBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  FromTime := GetTickCount;

  if DataSet = cdsView then begin
    if not cdsPT.Active then cdsPT.Open;
    DSRefresh(cdsRsv_Temp, 'posid', 0);
  end;

  with (DataSet as TssClientDataSet).Params do begin
    ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    ParamByName('getempty').AsInteger := Integer(aShowNull.Checked or (FMode = 7)); // Fmode=7 is client's Order
    ParamByName('wh').AsString := AllowedWH;
    ParamByName('grp').AsString := '';

    if AShowNull.Checked or (FMode = 7)  // Fmode=7 is client's Order
      then ParamByName('showallmats').AsInteger := Integer(WMatShowAll or (FMode = 7))
      else ParamByName('showallmats').AsInteger := 0;

    if GrpID = 0 then begin
      ParamByName('grpid').AsInteger := 0;
      ParamByName('wid').AsInteger := WID;
    end
    else begin
      if ByW then begin
        if not ShowGrp then begin
          ParamByName('wid').AsInteger := Trunc(Abs(GrpID));
          ParamByName('grpid').AsInteger := 0;
        end
        else begin
          ParamByName('wid').AsInteger := WID;

          if FDrillDown and (GrpID > 0) then begin
            ParamByName('grpid').AsInteger := 0;
            ParamByName('grp').AsString := GetDrillDownList(clientdata.dmData.SConnection, 'matgroup', 'grpid', 'pid', GrpID);
          end
          else begin
            ParamByName('grpid').AsInteger := GrpID;
            ParamByName('grp').AsString := '';
          end;
        end;
      end
      else begin
        ParamByName('wid').AsInteger := 0;

        if FDrillDown then begin
          ParamByName('grpid').AsInteger := 0;
          ParamByName('grp').AsString := GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', GrpID);
        end
        else begin
          ParamByName('grpid').AsInteger := GrpID;
          ParamByName('grp').AsString := '';
        end;
      end;
    end;

    if (lcbKAgent.EmptyValue = lcbKAgent.KeyValue) or not panFilter.Visible
      then ParamByName('kaid').AsInteger := 0
      else ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
  end;

  colNum.Visible := (GrpID > 0) and not ByW;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colFreeGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat,  RoundToA(ANode.Values[colRemain.Index] - ANode.Values[colReserved.Index], MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if grdMC.Focused and mdMC.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;

      if grdMC.Focused then begin
        WID := Self.WID;
        ID := Self.mdMC.FieldByName('matid').AsInteger;
      end
      else begin
        if grdWHouse.Focused
          then WID := Self.cdsWHouse.FieldByName('wid').AsInteger
          else WID := Self.WID;

        ID := Self.cdsView.fieldbyname('matid').AsInteger;
      end;

      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colWFreeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colWFreeGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(ANode.Values[colWRemain.Index] - ANode.Values[colWReserved.Index], MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsWHouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsWHouseBeforeOpen') else _udebug := nil;{$ENDIF}

  with (DataSet as TssClientDataSet).Params do begin
    if cdsView.IsEmpty
      then ParamByName('matid').AsInteger := -1
      else ParamByName('matid').AsInteger := cdsView.fieldbyname('matid').AsInteger;

    ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    ParamByName('wh').AsString := AllowedWH;

    if FMode < 2
      then ParamByName('wid').AsInteger := WID
      else ParamByName('wid').AsInteger := 0;

    if (lcbKAgent.EmptyValue = lcbKAgent.KeyValue) or not panFilter.Visible
      then ParamByName('kaid').AsInteger := 0
      else ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsWHouseAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsWHouseAfterOpen') else _udebug := nil;{$ENDIF}

  stTotalValue.Caption := FormatFloat(MatDisplayFormat, RoundToA(cdsView.fieldbyname('remain').AsFloat, MatDisplayDigits));
  stReservedValue.Caption := FormatFloat(MatDisplayFormat, RoundToA(cdsView.fieldbyname('reserved').AsFloat, MatDisplayDigits));

  stFreeValue.Caption := FormatFloat(MatDisplayFormat, RoundToA(cdsView.fieldbyname('remain').AsFloat
                         - cdsView.fieldbyname('reserved').AsFloat, MatDisplayDigits));

  if cdsView.FieldByName('reserved').AsFloat > 0
    then stReservedValue.Font.Color := clRed
    else stReservedValue.Font.Color := clMaroon;

  IsOneWH := CheckWHCount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.srcViewExDelayedDataChange(Sender: TObject; Field: TField);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.srcViewExDelayedDataChange') else _udebug := nil;{$ENDIF}

  //if (FParam > 0) then begin
    if FMode < 2 then FCurrentID := cdsView.fieldbyname('matid').AsInteger;

    PosInfo.MatID := FCurrentID;

    if WID > 0
      then PosInfo.WID := WID
      else PosInfo.WID := 0;

    PosInfo.PosID := 0;
  //end;

  CurrAmount := cdsView.FieldByName('remain').AsFloat + cdsView.FieldByName('ordered').AsFloat -
     cdsView.FieldByName('reserved').AsFloat - cdsView.FieldByName('orsv').AsFloat;

   MatName := cdsView.fieldbyname('matname').AsString;

  if grdMain.Count > 0 then begin
    grdPrice.Bands[1].Caption := cdsView.fieldbyname('matname').AsString;
    grdOrdered.Bands[1].Caption := cdsView.fieldbyname('matname').AsString;
  end
  else begin
    grdPrice.Bands[1].Caption := rs(Self.Name, 'Mat');
    grdOrdered.Bands[1].Caption := rs(Self.Name, 'Mat');
  end;

  for i := 0 to pcMain.PageCount-1 do pcMain.Pages[i].Tag := 1;

  RefreshDetail;
  cdsRsv_Temp.Close;
  cdsRsv_Temp.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPPriceGetText') else _udebug := nil;{$ENDIF}

  try
    if ShowPrices
      then AText := FormatFloat(MoneyDisplayFormat, ANode.Values[colPPrice.Index]) + ' ' + ANode.Values[colCurName.Index]
      else AText := rs('Common', 'NA');

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsPrice then begin
      DSRefresh(cdsPrice, 'posid', 0);
      SetGrdPriceWidth;
    end
    else if pcMain.ActivePage = tsMC then begin
      GetMCList;
    end
    else if pcMain.ActivePage = tsWHouse then begin
      DSRefresh(cdsWHouse, 'wid', 0);
      SetGrdWHouseWidth;
    end
    else if pcMain.ActivePage = tsOrdered then begin
      DSRefresh(cdsOrdered, 'posid', 0);
    end;

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.pcMainChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsPriceBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsPriceBeforeOpen') else _udebug := nil;{$ENDIF}

  with (DataSet as TssClientDataSet) do begin
    Params.ParamByName('matid').AsInteger := cdsView.fieldbyname('matid').AsInteger;
    Params.ParamByName('getempty').AsInteger := Integer(aShowNullPos.Checked or (Fmode = 7)); // Fmode=7 is client's Order
    Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('wid').AsInteger := WID;

    if (lcbKAgent.EmptyValue = lcbKAgent.KeyValue) or not panFilter.Visible
      then Params.ParamByName('kaid').AsInteger := 0
      else Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPPriceNGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPPriceNGetText') else _udebug := nil;{$ENDIF}

  try // finally
    if not ShowPrices then begin
      AText := rs('Common', 'NA');
      Exit;
    end;

    try
      AText := FormatFloat(MoneyDisplayFormat,
               StrToFloat(ANode.Values[colPPrice.Index]) * StrToFloat(ANode.Values[colOnValue.Index])) + ' ' + BaseCurrName;

    except
      //if Atext <> '' then AText := '-ERR-';
      udebug1('"' + Atext + '" convert error');
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmWMat.aShowNullExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aShowNullExecute') else _udebug := nil;{$ENDIF}

  aShowNull.Checked := not aShowNull.Checked;
  aRefresh.Execute;
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := DateToStr(ANode.Values[grdPrice.ColumnByName(colOnDate.Name).Index]);

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOnTimeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOnTimeGetText') else _udebug := nil;{$ENDIF}

  try
    AText := TimeToStr(ANode.Values[grdPrice.ColumnByName(colOnTime.Name).Index]);

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoShow;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoShow') else _udebug := nil;{$ENDIF}

  //fLoading.Show(panClient);
  try
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    DoShowFilter;
    cdsView.Open;
    RealignFilter;
    SetGrdWHouseWidth;
    SetGrdMainWidth;
    SetGrdPriceWidth;

    if ModalView then
      case FMode of
        0: pcMain.ActivePage := tsWHouse;

        1: begin
             pcMain.ActivePage := tsPrice;
             tsWHouse.TabVisible := False;
           end;

        2,3,4,5,6,7: begin
          for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].TabVisible := False;
          tsAdd.TabVisible := True;
          tsWHouse.TabVisible := True;
          tsAdd.PageIndex := 0;
          pcMain.ActivePage := tsAdd;
          colMPrice.Caption := rs('fmWaybill', 'Price') + ', ' + DocInfo.CurrName;
          CurrPTypeID := DocInfo.PTypeID;

          case FMode of
            2: tsAdd.ImageIndex := II_WBOUT;

            3: tsAdd.ImageIndex := II_AccOut;

            4,5,6,7:
              begin
                 if FMode = 4 then tsAdd.ImageIndex := II_WRITEOFF
                 else if FMode = 5 then tsAdd.ImageIndex := II_WBMove
                 else if FMode = 7 then tsAdd.ImageIndex := II_ORDEROUT
                 else tsAdd.ImageIndex := II_WBRETOUT;

                 colMSumm.Tag := 0;
                 colMSumm.Visible := False;
                 colMPrice.Tag := 0;
                 colMPrice.Visible := False;
                 colMPriceType.Tag := 0;
                 colMPriceType.Visible := False;
                 colMWHName.ReadOnly := True;
               end;
          end;

          cdsPriceTypes.Open;
          BuildPTMenu(DocInfo.PTypeID);
          cdsWH.Open;
          mdMats.Open;
          grdMain.DragMode := dmAutomatic;
        end;
      end;

  finally
    //fLoading.Hide;
    CanRefresh := True;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  SetGrdWHouseWidth;
  SetGrdPriceWidth;
  SetGrdMainWidth;
  grdMats.Adjust(nil, [colMRecNo]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetGrdWHouseWidth;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetGrdWHouseWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdWHouse, colWName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetGrdPriceWidth;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetGrdPriceWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdPrice, GetFirstVisibleCol(grdPrice));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetGrdMainWidth;
  var
    i, j: Integer;
    FVis: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetGrdMainWidth') else _udebug := nil;{$ENDIF}

  for j := 0 to grdMain.Bands.Count - 1 do begin
    FVis := False;

    for i := 1 to grdMain.ColumnCount - 1 do
      if grdMain.Columns[i].Visible and (grdMain.Columns[i].BandIndex = j)
        then FVis := True;

    grdMain.Bands.Items[j].Visible := FVis;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoDrillDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoDrillDown') else _udebug := nil;{$ENDIF}

  inherited;

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colReservedGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  if Value <> MaxDateTime then begin
    edFromDate.Date := Value;
    edToDate.Date := Value;
  end
  else begin
    edFromDate.Date := 0;
    edFromDate.EditValue := Null;
    edFromDate.EditText := '';
    edFromDate.EditText := '';
    edToDate.EditValue := Null;
  end;
  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colWReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colWReservedGetText') else _udebug := nil;{$ENDIF}

  try
    FRsv := ANode.Values[colWReserved.Index];

  except
    FRsv := 0;
  end;

  AText := FormatFloat(MatDisplayFormat, RoundToA(FRsv, MatDisplayDigits));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPRemainGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText) - StrToFloat(ANode.Values[colPReserved.Index]), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.FillMD;
  var
    BM: TBookmark;
    FWID, FMatID: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.FillMD') else _udebug := nil;{$ENDIF}

  with TssMemoryData(pointer(FCurrentID)) do begin
    Close;
    Open;

    if tsWHouse.Tag = 1 then DSRefresh(cdsWHouse, 'wid', 0);

    if tsPrice.Tag = 1 then DSRefresh(cdsPrice, 'posid', 0);

    FWID := cdsWHouse.fieldbyname('wid').AsInteger;
    FMatID := cdsView.fieldbyname('matid').AsInteger;
    BM := cdsPrice.GetBookmark;
    cdsPrice.DisableControls;

    try
     cdsPrice.First;
     while not cdsPrice.Eof do begin
       if (cdsPrice.FieldByName('wid').AsInteger = FWID) and (cdsPrice.fieldbyname('remain').AsFloat - cdsPrice.fieldbyname('reserved').AsFloat > 0)
       then begin
         Append;
         FieldByName('matid').AsInteger := FMatID;
         FieldByName('wid').AsInteger := FWID;
         FieldByName('posid').AsInteger := cdsPrice.fieldbyname('posid').AsInteger;
         FieldByName('amount').AsFloat := cdsPrice.fieldbyname('remain').AsFloat-cdsPrice.fieldbyname('reserved').AsFloat;
         FieldByName('price').AsCurrency := cdsPrice.fieldbyname('price').AsFloat*cdsPrice.fieldbyname('onvalue').AsFloat;
         FieldByName('ondate').AsDateTime := cdsPrice.fieldbyname('ondate').AsDateTime;
         Post;
       end;

       cdsPrice.Next;
     end;

    finally
      cdsPrice.GotoBookmark(BM);
      cdsPrice.FreeBookmark(BM);
      cdsPrice.EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetMatName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetMatName') else _udebug := nil;{$ENDIF}

  FMatName := Value;
  SetTitle;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetWHouseName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetWHouseName') else _udebug := nil;{$ENDIF}

  FWHouseName := Value;
  SetTitle;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetTitle;
  var
    s: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetTitle') else _udebug := nil;{$ENDIF}

  if ModalView then begin
    s := rs(Self.Name, 'Title') + ': ' + MatName;// + ': ' + WHouseName + ']';
    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@s), 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.srcWHouseDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.srcWHouseDataChange') else _udebug := nil;{$ENDIF}

  WHouseName := cdsWHouse.fieldbyname('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colRemainGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colWRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colWRemainGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoAfterFind(AParam: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoAfterFind') else _udebug := nil;{$ENDIF}

  inherited;

  if AParam = 1 then begin
    grdMain.SetFocus;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if tsAdd.TabVisible then begin
    grdMainDblClick(grdMain);
  end
  else begin
    if pcMain.ActivePage <> tsWHouse then pcMain.ActivePage := tsWHouse;
    grdWHouse.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and ModalView then begin
    if FMode > 1 then begin
      grdMainDblClick(grdMain);
    end
    else begin
      Key := 0;
      if tsWHouse.TabVisible then begin
        if (pcMain.ActivePage <> tsWHouse) then pcMain.ActivePage := tsWHouse;
      end
      else if (pcMain.ActivePage <> tsPrice) and tsPrice.TabVisible then begin
        pcMain.ActivePage := tsPrice;
      end;

      if pcMain.ActivePage = tsPrice then begin
        if grdPrice.Count = 1
          then grdPriceDblClick(grdPrice)
          else grdPrice.SetFocus;
      end
      else begin
        if IsOneWH
          then grdWHouseDblClick(grdWHouse)
          else grdWHouse.SetFocus;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdWHouseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdWHouseKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and ModalView then begin
    Key := 0;
    grdWHouseDblClick(grdWHouse);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdWHouseDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdWHouseDblClick') else _udebug := nil;{$ENDIF}

  if grdWHouse.Count > 0 then
    case FMode of
      0:
        begin
          PosInfo.WID := cdsWHouse.FieldByName('wid').AsInteger;
          PosInfo.MatID := cdsView.FieldByName('matid').AsInteger;
          SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
        end;

      2, 3:
        begin
          SendMessage(ParentHandle, WM_SETTREEITEM, cdsWHouse.FieldByName('wid').AsInteger, 0);
          WID := cdsWHouse.FieldByName('wid').AsInteger;
          DoRefresh(0);
          tsAdd.Show;
        end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsViewAfterOpen(DataSet: TDataSet);
  var
    FTotal, FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;
  FrameResize(Self);
  txtCount.Caption := IntToStr(cdsView.RecordCount);

  if not VarIsNull(cdsView.Aggregates[0].Value)
    then FTotal := cdsView.Aggregates[0].Value
    else FTotal := 0;

  if not VarIsNull(cdsView.Aggregates[1].Value)
    then FRsv := cdsView.Aggregates[1].Value
    else FRsv := 0;

  txtTotal.Caption := FormatFloat(MatDisplayFormat, FTotal);
  txtRsv.Caption := FormatFloat(MatDisplayFormat, FRsv);
  txtFree.Caption := FormatFloat(MatDisplayFormat, FTotal - FRsv);
  txtTotal.Hint := txtTotal.Caption;
  txtRsv.Hint := txtRsv.Caption;
  txtFree.Hint := txtFree.Caption;

  if not FSelected then begin
    FSelected := True;

    if FParam < 0 then cdsView.Locate('matid', -FParam, []);
  end;
  ToTime := GetTickCount;

  grdMain.ClearSelection;

  if grdMain.FocusedNode <> nil
    then grdMain.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.splMainMoved(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.splMainMoved') else _udebug := nil;{$ENDIF}

  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceClick') else _udebug := nil;{$ENDIF}

  inherited;
  FCurrentID := cdsPrice.FieldByName('posid').AsInteger; //cdsView.FieldByName('matid').AsInteger;
  PosInfo.PosID := FCurrentID;
  PosInfo.MatID := cdsView.FieldByName('matid').AsInteger;
  PosInfo.WID := cdsPrice.FieldByName('wid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceDblClick') else _udebug := nil;{$ENDIF}

  if (grdPrice.Count > 0) then begin
{if (FMode = 1) then begin
      FCurrentID := cdsPrice.FieldByName('posid').AsInteger;
      RefType := rtWMat;
      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end
    }
//else if (FMode = 0) {and (FParam > 0)} then begin
    grdPriceClick(Sender);
    SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.srcPriceDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.srcPriceDataChange') else _udebug := nil;{$ENDIF}

  if (FMode = 1) and (pcMain.ActivePage = tsPrice)
    then FCurrentID := cdsPrice.fieldbyname('posid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainDblClick') else _udebug := nil;{$ENDIF}

  srcViewExDelayedDataChange(nil, nil); // try to load all needed data before exit

  if FMode < 2 then begin

    if (grdMain.Count > 0) then begin

      if (FMode < 1) and tsWHouse.TabVisible{and (FParam = 0)} then begin

        DSRefresh(cdsWHouse, 'wid', 0);

        if ModalView and IsOneWH then begin
          FCurrentID := cdsView.fieldbyname('matid').AsInteger;
          PosInfo.MatID := FCurrentID;

          if cdsWHouse.IsEmpty
            then PosInfo.WID := WID
            else PosInfo.WID := cdsWHouse.FieldByName('wid').AsInteger;

          PosInfo.PosID := 0;

          if (cdsView.FieldByName('remain').AsFloat - cdsView.FieldByName('reserved').AsFloat) = 0
          then begin
            DSRefresh(cdsOrdered, 'posid', 0);
            PosInfo.PosID := cdsOrdered.FieldByName('posid').AsInteger;
            PosInfo.WID := cdsOrdered.FieldByName('wid').AsInteger;
          end;

          CurrAmount := cdsView.FieldByName('remain').AsFloat +
              cdsView.FieldByName('ordered').AsFloat -
              cdsView.FieldByName('reserved').AsFloat -
              cdsView.FieldByName('orsv').AsFloat;

          if (CurrAmount > 0) and (FMode = 0) then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);

        end //if ModalView and IsOneWH
        else if not ModalView then aMatMove.Execute;

      end //if (FMode < 1) and tsWHouse.TabVisible
      else begin
        DSRefresh(cdsPrice, 'posid', 0);

        if ModalView{ and (cdsPrice.RecordCount = 1)}
        then begin
          FCurrentID := cdsPrice.fieldbyname('posid').AsInteger;

          if cdsPrice.RecordCount = 1
            then PosInfo.PosID := FCurrentID
            else PosInfo.PosID := 0;

          PosInfo.MatID := cdsView.FieldByName('matid').AsInteger;
          PosInfo.WID := cdsPrice.FieldByName('wid').AsInteger;

          CurrAmount := cdsView.FieldByName('remain').AsFloat + cdsView.FieldByName('ordered').AsFloat
                        - cdsView.FieldByName('orsv').AsFloat - cdsView.FieldByName('reserved').AsFloat;

          if (CurrAmount > 0) then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);

        end;
      end;
    end;
  end //if FMode < 2
  else begin
    if ModalView then begin
      if (FMode <> 7) and (WID = 0) and (FWHCount > 1) // Fmode=7 for clients order
        then SelectWHErr
        else AddMatToDoc;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if mdMC.IsEmpty and grdMC.Focused then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
  try
    ParentNameEx := 'fmWMat';
    OnDate := Self.OnDate;

    if grdMC.Focused then begin
      WID := 0;
      ID := mdMC.FieldByName('matid').AsInteger;
    end
    else begin
      if grdWHouse.Focused
        then WID := Self.cdsWHouse.FieldByName('wid').AsInteger
        else WID := 0;

      ID := Self.cdsView.fieldbyname('matid').AsInteger;
    end;

    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value > 0 then cdsView.Locate('matid', Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatInfoExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if mdMC.IsEmpty and grdMC.Focused then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if grdMC.Focused
    then FID := mdMC.FieldByName('matid').AsInteger
    else FID := Self.cdsView.fieldbyname('matid').AsInteger;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := FID;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colNameGetText') else _udebug := nil;{$ENDIF}

  AText := ' ' + AText;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWMat.CheckWHCount: Boolean;
  var
    BM: TBookmark;
    FWID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.CheckWHCount') else _udebug := nil;{$ENDIF}

  Result := True;
  BM := cdsWHouse.GetBookmark;

  try
    cdsWHouse.First;
    FWID := cdsWHouse.FieldByName('wid').AsInteger;

    while not cdsWHouse.Eof do begin
      if FWID <> cdsWHouse.FieldByName('wid').AsInteger then begin
        Result := False;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
      cdsWHouse.Next;
    end;

  finally
    cdsWHouse.GotoBookmark(BM);
    cdsWHouse.FreeBookmark(BM);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoSetFocus') else _udebug := nil;{$ENDIF}

  if grdMain.Visible then grdMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsViewCalcFields(DataSet: TDataSet);
  var
    FRsv: Extended;
    i, pp, ptype: Integer;
    s: String;
    pf: Extended; // price factor
    pfield, cfield: TField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsViewCalcFields') else _udebug := nil;{$ENDIF}

  CalcPriceFields(TDataSet(cdsView), TDataSet(cdsPriceTypes));

  try
    DataSet.FieldByName('remain').AsString := FloatToStr(RoundTo(RoundToA(DataSet.FieldByName('remain').AsFloat, MatDisplayDigits), MatDisplayDigits));
    DataSet.FieldByName('rsv').AsString := FloatToStr(RoundTo(RoundToA(DataSet.FieldByName('rsv').AsFloat, MatDisplayDigits), MatDisplayDigits));
    FRsv := DataSet.FieldByName('rsv').AsFloat;

    with cdsRsv_Temp do
      if Active then begin
        First;
        while not Eof do begin
          if ((FieldByName('visible').AsInteger = 1) or ((FieldByName('visible').AsInteger = 0) and (fieldbyname('addr').AsInteger = ServerAddr)))
             and (FieldByName('matid').AsInteger = DataSet.FieldByName('matid').AsInteger)
          then
            if (not ByW) or (ByW and ((Trunc(Abs(WID)) = 0) or (Trunc(Abs(WID)) = FieldByName('wid').AsInteger)))
            then FRsv := FRsv + FieldByName('amount').AsFloat;

          Next;
        end;
      end;

    with DataSet do begin
      FieldByName('reserved').AsFloat := FRsv;

      if (FieldByName('minreserv').AsFloat > 0)
         and
         (FieldByName('minreserv').AsFloat >= FieldByName('remain').AsFloat +
            FieldByName('ordered').AsFloat - FieldByName('reserved').AsFloat - FieldByName('orsv').AsFloat)
      then FieldByName('minrsvneeded').AsFloat :=
          FieldByName('minreserv').AsFloat - FieldByName('remain').AsFloat + FieldByName('reserved').AsFloat -
          FieldByName('ordered').AsFloat + FieldByName('orsv').AsFloat;

      if not FieldByName('ordered').IsNull
        then FieldByName('ofree').AsFloat := FieldByName('ordered').AsFloat - FieldByName('orsv').AsFloat;

      FieldByName('tremain').AsFloat := FieldByName('ordered').AsFloat + FieldByName('remain').AsFloat;
      FieldByName('trsv').AsFloat := FieldByName('orsv').AsFloat + FieldByName('reserved').AsFloat;
      FieldByName('tfree').AsFloat := FieldByName('remain').AsFloat - FieldByName('reserved').AsFloat + FieldByName('ofree').AsFloat;
    end;

  except
    //on e: Exception do ssMessagedlg(e.Message, ssmtError, [ssmbOK]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.WMShowProgress(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.WMShowProgress') else _udebug := nil;{$ENDIF}

  if InRefresh then fLoading.Show(panClient);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

{ TWaitThread }
//==============================================================================================
procedure TWaitThread.Execute;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWaitThread.Execute') else _udebug := nil;{$ENDIF}

  Sleep(1000);
  ShowProgress := True;
  Terminate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWMat.cdsPriceCalcFields(DataSet: TDataSet);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsPriceCalcFields') else _udebug := nil;{$ENDIF}

  try
    FRsv := DataSet.FieldByName('rsv').AsFloat;

    with cdsRsv_Temp do
      if Active then begin
        First;
        while not Eof do begin
          if ((FieldByName('visible').AsInteger = 1)
              or ((FieldByName('visible').AsInteger = 0) and (fieldbyname('addr').AsInteger = ServerAddr))
             )
             and (FieldByName('posid').AsInteger = DataSet.FieldByName('posid').AsInteger)
          then FRsv := FRsv + FieldByName('amount').AsFloat;

          Next;
        end;
      end;

    DataSet.FieldByName('reserved').AsFloat := FRsv;

  except
    //on e: Exception do ssMessagedlg(e.Message, ssmtError, [ssmbOK]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPReservedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPReservedGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetParam(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetParam') else _udebug := nil;{$ENDIF}

  FParam := Value;
  if Value > 0 then tsWHouse.TabVisible := False;
  if cdsView.Active then cdsView.Locate('matid', -Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aRecalcExecute(Sender: TObject);
  var
    FMultiple: Boolean;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aRecalcExecute') else _udebug := nil;{$ENDIF}

  FMultiple := (Sender as TAction) = aRecalcAll;

  with newDataSet do
    try
      if FMultiple then begin
        fProgress.Caption := rs(Self.Name, 'RecalcRemains') + '...';
        fProgress.pbMain.Max := grdMain.Count;
        fProgress.Show;
      end;
      ProviderName := 'pWMat_Recalc_Mat';
      FetchParams;

      if FMultiple then begin
        for i := 0 to grdMain.Count - 1 do begin
          fProgress.lText.Caption := VarToStr(grdMain.Items[i].Values[colName.Index]);
          Application.ProcessMessages;
          Params.ParamByName('matid').AsInteger := grdMain.Items[i].Values[colID.Index];
          Params.ParamByName('ondate').AsDateTime := Self.OnDate;
          Execute;
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;
      end
      else begin
        Params.ParamByName('matid').AsInteger := cdsView.FieldByName('matid').AsInteger;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Execute;
      end;

    finally
      if FMultiple then fProgress.Hide;

      Free;
    end;

    Application.ProcessMessages;
    DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsWHouseCalcFields(DataSet: TDataSet);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsWHouseCalcFields') else _udebug := nil;{$ENDIF}

  FRsv := DataSet.FieldByName('Rsv').AsFloat;

  with cdsRsv_Temp do
    if Active then begin
      First;
      while not Eof do begin
        if ((FieldByName('visible').AsInteger = 1) or ((FieldByName('visible').AsInteger = 0) and (fieldbyname('addr').AsInteger = ServerAddr)))
           and (FieldByname('wid').AsInteger = cdsWHouse.FieldByName('wid').AsInteger)
           and (FieldByname('matid').AsInteger = cdsView.fieldbyname('matid').AsInteger)
        then FRsv := FRsv + fieldbyname('amount').asFloat;

        Next;
      end;
    end;

  DataSet.FieldByName('reserved').AsFloat := FRsv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aShowMCListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aShowMCListExecute') else _udebug := nil;{$ENDIF}

  with TfrmMCList.Create(nil) do
  try
//GetMCList;
    OnDate := Self.OnDate;
    ID := Self.cdsView.FieldByName('matid').AsInteger;

//grdMain.DataSource := srcMC;
    if ShowModal = mrOk then begin
      if not Self.cdsView.Locate('matid', cdsMC.FieldByName('id').AsInteger, [])
        then ssMessageDlg(Format(rs(Self.Name, 'MatNotFound'), [cdsMC.FieldByName('name').AsString]), ssmtError, [ssmbOK]);
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.GetMCList;
  var
    BM: TBookmark;
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetMCList') else _udebug := nil;{$ENDIF}

  mdMC.Close;
  mdMC.Open;

  BM := nil;
  with newDataSet do
  try
    Screen.Cursor := crSQLWait;
    srcViewEx.OnDelayedDataChange := nil;
    BM := cdsView.GetBookmark;
    ProviderName := 'pMatChange_GetWithPrice';
    FetchParams;
    Params.ParamByName('matid').AsInteger := cdsView.FieldByName('matid').AsInteger;
    Params.ParamByName('ondate').AsDateTime := Self.OnDate;
    Open;

    while not Eof do begin
      mdMC.Append;
      mdMC.FieldByName('matid').AsInteger := FieldByName('id').AsInteger;
      mdMC.FieldByName('name').AsString := FieldByName('name').AsString;
      mdMC.FieldByName('artikul').AsString := FieldByName('artikul').AsString;
      mdMC.FieldByName('country').AsString := FieldByName('country').AsString;
      mdMC.FieldByName('producer').AsString := FieldByName('producer').AsString;
      mdMC.FieldByName('barcode').AsString := FieldByName('barcode').AsString;
      mdMC.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
      mdMC.FieldByName('grpname').AsString := FieldByName('grpname').AsString;
      mdMC.FieldByName('notes').AsString := FieldByName('notes').AsString;
      mdMC.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
      mdMC.FieldByName('shortname').AsString := FieldByName('shortname').AsString;
      mdMC.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
      mdMC.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
      mdMC.FieldByName('price').AsVariant := FieldByName('price').AsVariant;
      FNode := grdMain.FindNodeByKeyValue(FieldByName('id').AsInteger);

      if FNode <> nil then begin
        mdMC.FieldByName('total').AsFloat := FNode.Values[colRemain.Index];
        mdMC.FieldByName('free').AsFloat := FNode.Values[colRemain.Index] - FNode.Values[colReserved.Index];
        mdMC.FieldByName('rsv').AsFloat := FNode.Values[colReserved.Index];
      end;

      mdMC.Post;
      Next;
    end;

    mdMC.First;
    Close;

  finally
    cdsView.GotoBookmark(BM);
    cdsView.FreeBookmark(BM);
    Free;
    srcViewEx.OnDelayedDataChange := srcViewExDelayedDataChange;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colNoGetText') else _udebug := nil;{$ENDIF}

  try
    AText := IntToStr(ANode.AbsoluteIndex + 1);

  except
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
    if AText <> '' then AText := AText + ' ' + VarToStr(ANode.Values[colShortName.Index]);

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMCRsvCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMCRsvCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if (AText <> '') and (StrToFloat(AText) <> 0) then AFont.Color := clRed;

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMCCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMCCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  try
    if VarIsNull(ANode.Values[colMCTotal.Index]) or (ANode.Values[colMCTotal.Index] = 0)
      then if not ASelected
           then AFont.Color := clBtnShadow
           else AFont.Color := GridOddLinesColor;
  except
    //AFont.Color := clBtnShadow;
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMCDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMCDblClick') else _udebug := nil;{$ENDIF}

  aMCJump.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMCJumpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMCJumpExecute') else _udebug := nil;{$ENDIF}


  if not VarIsNull(grdMC.FocusedNode.Values[colMCTotal.Index]) then begin
    cdsView.Locate('matid', grdMC.FocusedNode.Values[colMCID.Index], []);
    grdMain.ClearSelection;

    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aMCJump.Enabled := (grdMC.Count > 0) and not VarIsNull(grdMC.FocusedNode.Values[colMCTotal.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.RealignFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.RealignFilter') else _udebug := nil;{$ENDIF}

  btnKAgent.Left := panFilter.Width - btnKagent.Width - 6;
  lcbKAgent.Width := btnKagent.Left - lcbKAgent.Left - 2;

  if lcbKAgent.Width > 200 then begin
    lcbKAgent.Width := 200;
    btnKAgent.Left := lcbKAgent.Width + 2;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if cdsKAgent.Active and (lcbKAgent.Text = '')
    then lcbKAgent.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

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
procedure TfmWMat.btnKagentClick(Sender: TObject);
  var
    intID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.btnKagentClick') else _udebug := nil;{$ENDIF}

  try
    intID := lcbKAgent.KeyValue;

  except
    intID := 0;
  end;

  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, intID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    grdPriceDblClick(grdPrice);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aDetColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aDetColParamsExecute') else _udebug := nil;{$ENDIF}

  grdPrice.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceNeedAdjust(Sender: TObject);
  var
    i, j: Integer;
    FVis: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceNeedAdjust') else _udebug := nil;{$ENDIF}

  for j := 0 to grdPrice.Bands.Count - 1 do begin
    FVis := False;
    for i := 1 to grdPrice.ColumnCount - 1 do
      if grdPrice.Columns[i].Visible and (grdPrice.Columns[i].BandIndex = j)
        then FVis := True;

    grdPrice.Bands.Items[j].Visible := FVis;
  end;

  AdjustGrid(grdPrice, GetFirstVisibleCol(grdPrice));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceChangedColumnsWidth(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceChangedColumnsWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdPrice, GetFirstVisibleCol(grdPrice));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfmWMat.GetFirstVisibleCol(AGrid: TdxDBGrid): TdxDBTreeListColumn;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetFirstVisibleCol') else _udebug := nil;{$ENDIF}

  Result := nil;

  for i := 0 to AGrid.VisibleColumnCount - 1 do
    if (AGrid.VisibleColumns[i] <> colPDocType) and
       (AGrid.VisibleColumns[i] <> colOWType)
    then begin
      Result := AGrid.VisibleColumns[i];
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.DoLocate(const AID: Integer; ASubID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.DoLocate') else _udebug := nil;{$ENDIF}

  if JumpFromBuffer then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  srcViewEx.ChangeDelay := 0;
  if cdsView.Locate('matid', AID, []) then begin
    if ASubID > 0 then begin
      tsPrice.Tag := 1;

      if pcMain.ActivePage = tsPrice
        then RefreshDetail
        else pcMain.ActivePage := tsPrice;

      if not cdsPrice.Locate('posid', ASubID, [])
        then ssMessageDlg(rs('fmWMat', 'PosNotFound'), ssmtInformation, [ssmbOk]);

      grdPrice.ClearSelection;

      if grdPrice.FocusedNode <> nil then grdPrice.FocusedNode.Selected := True;
    end;

    grdMain.ClearSelection;

    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  end
  else ssMessageDlg(rs('fmWMat', 'MatNotFoundEx'), ssmtInformation, [ssmbOk]);

  srcViewEx.ChangeDelay := 250;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aGotoDocExecute(Sender: TObject);
  var
    FWBillID, FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aGotoDocExecute') else _udebug := nil;{$ENDIF}

  FWBillID := cdsPrice.FieldByName('docid').AsInteger;
  FPosID := cdsPrice.FieldByName('posid').AsInteger;
  case cdsPrice.FieldByName('wtype').AsInteger of
    1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybill', FWBillID, FPosID);
    5: frmMainForm.ExecLocate(vtWMat, 'TfmWBRest', FWBillID, FPosID);
    4: frmMainForm.ExecLocate(vtWMat, 'TfmWaybillMov', FWBillID, FPosID);
    6: frmMainForm.ExecLocate(vtDocs, 'TfmWBReturnIn', FWBillID, FPosID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsPriceAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsPriceAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;
  grdPrice.ClearSelection;

  if grdPrice.FocusedNode <> nil
    then grdPrice.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMCTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMCTotalGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aShowNullPosExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aShowNullPosExecute') else _udebug := nil;{$ENDIF}

  aShowNullPos.Checked := not aShowNullPos.Checked;
  DSRefresh(cdsPrice, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aCreateAccOutExecute(Sender: TObject);
  var
    FPos: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aCreateAccOutExecute') else _udebug := nil;{$ENDIF}

  FPos := '';
  for i := 0 to grdPrice.SelectedCount - 1 do
    if (grdPrice.SelectedNodes[i].Values[colPRemain.Index] -
        grdPrice.SelectedNodes[i].Values[colPReserved.Index] > 0)
    then FPos := FPos + IntToStr(grdPrice.SelectedNodes[i].Values[colPPosID.Index]) + ',';

  if FPos = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  System.Delete(FPos, Length(FPos), 1);

  with TfrmEditAccOut.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    AddMats(FPos);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.AbsoluteIndex + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aShowEmptyPosExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aShowEmptyPosExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWMat.aCreateWBOutExecute(Sender: TObject);
  var
    FPos: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aCreateWBOutExecute') else _udebug := nil;{$ENDIF}

  FPos := '';
  for i := 0 to grdPrice.SelectedCount - 1 do
    if (grdPrice.SelectedNodes[i].Values[colPRemain.Index] - grdPrice.SelectedNodes[i].Values[colPReserved.Index] > 0)
      then FPos := FPos + IntToStr(grdPrice.SelectedNodes[i].Values[colPPosID.Index]) + ',';

  if FPos = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  System.Delete(FPos, Length(FPos), 1);

  with TfrmEditWaybillOut.Create(nil) do
  try
    WBType := wbtWaybillOut;
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    AddMats(FPos);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aCreateWBMoveExecute(Sender: TObject);
  var
    FPos: string;
    i, WID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aCreateWBMoveExecute') else _udebug := nil;{$ENDIF}

  FPos := '';
  WID := grdPrice.SelectedNodes[0].Values[colPWID.Index];
  for i := 0 to grdPrice.SelectedCount - 1 do begin
    if WID <> grdPrice.SelectedNodes[i].Values[colPWID.Index] then begin
      ssMessageDlg(rs('fmWMat', 'NotTheSameWH'), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (grdPrice.SelectedNodes[i].Values[colPRemain.Index] - grdPrice.SelectedNodes[i].Values[colPReserved.Index] > 0)
      then FPos := FPos + IntToStr(grdPrice.SelectedNodes[i].Values[colPPosID.Index]) + ',';
  end;

  if FPos = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  System.Delete(FPos, Length(FPos), 1);

  with TfrmEditWaybillMov.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    AddMats(FPos);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aCreateWriteOffExecute(Sender: TObject);
  var
    FPos: string;
    i, WID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aCreateWriteOffExecute') else _udebug := nil;{$ENDIF}

  (*
  {$IFDEF LITE}
  showNotAvailable;
  {$ELSE}
  *)
  //{$I ASPROTECT\reg_crypt_begin.inc}

  FPos := '';
  WID := grdPrice.SelectedNodes[0].Values[colPWID.Index];
  for i := 0 to grdPrice.SelectedCount - 1 do begin
    if WID <> grdPrice.SelectedNodes[i].Values[colPWID.Index] then begin
      ssMessageDlg(rs('fmWMat', 'NotTheSameWH'), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (grdPrice.SelectedNodes[i].Values[colPRemain.Index] - grdPrice.SelectedNodes[i].Values[colPReserved.Index] > 0)
    then FPos := FPos + IntToStr(grdPrice.SelectedNodes[i].Values[colPPosID.Index]) + ',';
  end;

  if FPos <> ''
    then System.Delete(FPos, Length(FPos), 1)
    else begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditWriteOff.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWriteOff';
    OnDate := Self.OnDate;
    ID := 0;
    AddMats(FPos);
    ShowModal;

  finally
    Free;
  end;

  //{$I ASPROTECT\reg_crypt_end.inc}
  //{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWMat', 'Title');
  ImgList := dmData.Images;
  AIndex := II_WH;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aAddFunctionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aAddFunctionsExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWMat.aWriteOffAllExecute(Sender: TObject);
  var
    WH: string;
    FWID, FWBillID, i, tmpPosID: Integer;
    cdsT: TssClientDataSet;
    FWBNum: string;
    FAmount: Extended;
    SummDefOutNDS, SummDefNDS, SummDef: Extended;
    FNeedPosting: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aWriteOffAllExecute') else _udebug := nil;{$ENDIF}

  (*
  {$IFDEF LITE}
  showNotAvailable;
  {$ELSE}
  *)
  //{$I ASPROTECT\reg_crypt_begin.inc}
  
  FNeedPosting := (TComponent(Sender).Tag = 1);

  if (WID = 0) or not ByW then begin
    if ssMessageDlg(rs('fmWMat', 'OkToWriteOffAll'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
      then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  end
  else begin
    if ssMessageDlg(Format(rs('fmWMat', 'OkToWriteOffWH'), [GetWHByID(WID)]), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
      then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  end;
  Application.ProcessMessages;

  if (WID = 0) or not ByW
    then WH := GetWHList
    else WH := IntToStr(WID);

  if WH = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  cdsT := newDataSet;

  with newDataSet do
  try
    ProviderName := 'pWMat_GetAllPos';
    FetchParams;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('wh').AsString := AllowedWH;

    fProgress.Caption := rs('fmWMat', 'WriteOffMats') + '...';
    fProgress.pbMain.Max := WordCount(WH, [',']);
    fProgress.lDet.Caption := '';
    fProgress.ShowDetail;
    fProgress.Show;

    TrStart;

    try
      for i := 1 to WordCount(WH, [',']) do begin
        FWID := StrToInt(ExtractWord(i, WH, [',']));
        Params.ParamByName('wid').AsInteger := FWID;
        Application.ProcessMessages;
        Open;
        if IsEmpty then begin
          Close;
          Continue;
        end;

        SummDef := 0;
        while not Eof do begin
          FAmount := FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat;

          NDSCalc(FAmount, FieldByName('price').AsFloat * FieldByName('onvalue').AsFloat,
                  FieldByName('nds').AsFloat, 1, SummDefOutNDS, SummDefNDS);

          SummDef := SummDef + RoundToA(SummDefNDS + SummDefOutNDS, -2);
          Next;
        end;

        cdsT.ProviderName := 'pWaybill_Ins';
        cdsT.FetchParams;
        FWBillID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

        if WriteOffAutoNum
          then FWBNum := WriteOffPrefix + IntToStr(GetDocNum(dmData.SConnection, dtWriteOff, 1)) + WriteOffSuffix
          else FWBNum := IntToStr(FWBillID);

        cdsT.Params.ParamByName('wbillid').AsInteger := FWBillID;
        cdsT.Params.ParamByName('num').AsString := FWBNum;
        cdsT.Params.ParamByName('defnum').AsInteger := Integer(not FNeedPosting);
        cdsT.Params.ParamByName('ondate').AsDateTime := Int(Self.OnDate) + Time;
        cdsT.Params.ParamByName('kaid').DataType := ftInteger;
        cdsT.Params.ParamByName('kaid').Clear;
        cdsT.Params.ParamByName('currid').DataType := ftInteger;
        cdsT.Params.ParamByName('currid').Clear;
        cdsT.Params.ParamByName('attnum').DataType := ftString;
        cdsT.Params.ParamByName('attnum').Clear;
        cdsT.Params.ParamByName('attdate').DataType := ftDateTime;
        cdsT.Params.ParamByName('attdate').Clear;
        cdsT.Params.ParamByName('reason').DataType := ftString;
        cdsT.Params.ParamByName('reason').Clear;
        cdsT.Params.ParamByName('notes').AsString := '';
        cdsT.Params.ParamByName('personid').DataType := ftInteger;
        cdsT.Params.ParamByName('personid').Clear;
        cdsT.Params.ParamByName('checked').AsInteger := 1;
        cdsT.Params.ParamByName('wtype').AsInteger := -5;//тип накладной -5-списание
        cdsT.Params.ParamByName('deleted').AsInteger := 0;
        cdsT.Params.ParamByName('summall').AsCurrency := SummDef;
        cdsT.Params.ParamByName('nds').DataType := ftFloat;
        cdsT.Params.ParamByName('nds').Clear;
        cdsT.Params.ParamByName('received').AsString := '';
        cdsT.Params.ParamByName('todate').DataType := ftDateTime;
        cdsT.Params.ParamByName('todate').Clear;

        cdsT.Execute;

        fProgress.lText.Caption := rs('fmWaybill', 'DocWriteOff') + amountPrefix + FWBNum + ' (' + GetWHByID(FWID) + ')';
        fProgress.pbDet.Position := 0;
        fProgress.pbDet.Max := RecordCount * 2;

        Application.ProcessMessages;

        cdsT.ProviderName := 'pWayBillMove_Ins';
        cdsT.FetchParams;
        cdsT.Params.ParamByName('wbillid').AsInteger := FWBillID;
        cdsT.Params.ParamByName('sourcewid').AsInteger := FWID;
        cdsT.Params.ParamByName('destwid').DataType := ftInteger;
        cdsT.Params.ParamByName('destwid').Clear;
        cdsT.Params.ParamByName('personid').DataType := ftInteger;
        cdsT.Params.ParamByName('personid').Clear;
        cdsT.Execute;

        cdsT.ProviderName := 'pWaybillDet_Ins';
        cdsT.FetchParams;

        First;
        while not Eof do begin
          fProgress.lDet.Caption := FieldByName('matname').AsString + ' - ' +
               FormatFloat(MatDisplayFormat, FieldByName('remain').AsFloat -
               FieldByName('rsv').AsFloat) + ' ' + FieldByName('msrname').AsString;
          Application.ProcessMessages;

          tmpPosId := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
          Edit;
          FieldByName('srcid').AsInteger := tmpPosID;
          Post;

          cdsT.Params.ParamByName('posid').AsInteger := tmpPosId;
          cdsT.Params.ParamByName('wbillid').AsInteger := FWBillID;
          cdsT.Params.ParamByName('matid').AsInteger := FieldByName('matid').AsInteger;
          cdsT.Params.ParamByName('wid').AsInteger := FWID;
          cdsT.Params.ParamByName('amount').AsFloat := FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat;
          cdsT.Params.ParamByName('price').AsFloat := FieldByName('price').AsFloat;
          cdsT.Params.ParamByName('discount').DataType := ftFloat;
          cdsT.Params.ParamByName('discount').Clear;
          cdsT.Params.ParamByName('nds').AsFloat := FieldByName('nds').AsFloat;
          cdsT.Params.ParamByName('currid').AsInteger := FieldByName('CurrId').AsInteger;
          cdsT.Params.ParamByName('ondate').AsDateTime := Int(Self.OnDate) + Time;
          cdsT.Params.ParamByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          cdsT.Params.ParamByName('ptypeid').DataType := ftInteger;
          cdsT.Params.ParamByName('ptypeid').Clear;
          cdsT.Params.ParamByName('num').AsInteger := tmpPosID;

          cdsT.Execute;
          Next;

          fProgress.pbDet.StepIt;
          Application.ProcessMessages;
        end;

        cdsT.ProviderName := 'pWMatTurnOut_Ins';
        cdsT.FetchParams;

        First;
        while not Eof do begin
          fProgress.lDet.Caption := FieldByName('matname').AsString + ' - '
               + FormatFloat(MatDisplayFormat, FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat)
               + ' ' + FieldByName('msrname').AsString;

          Application.ProcessMessages;
          cdsT.Params.ParamByName('posid').AsInteger := FieldByName('posid').AsInteger;
          cdsT.Params.ParamByName('sourceid').AsInteger := FieldByName('srcid').AsInteger;
          cdsT.Params.ParamByName('matid').AsInteger := FieldByName('matid').AsInteger;
          cdsT.Params.ParamByName('wid').AsInteger := FWID;
          cdsT.Params.ParamByName('turntype').AsInteger := matTurnOut;
          cdsT.Params.ParamByName('ondate').AsDateTime := Int(Self.OnDate) + Time;
          cdsT.Params.ParamByName('amount').AsFloat := FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat;
          cdsT.Execute;

          Next;

          fProgress.pbDet.StepIt;
          Application.ProcessMessages;
        end;

        Close;

        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

      TrCommit;

      aRefresh.Execute;
      RefreshFun('TfmWriteOff', 0);

    except
      TrRollback;

      raise;
    end;

  finally
    Free;
    cdsT.Free;
    if fProgress.Visible then fProgress.Hide;
  end;

  //{$I ASPROTECT\reg_crypt_end.inc}
  //{$ENDIF} // not a freeware version

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWMat.GetWHByID(const WID: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetWHByID') else _udebug := nil;{$ENDIF}

  Result := '';

  with newDataSet do
  try
    ProviderName := 'pWHouse_Get';
    FetchParams;
    Params.ParamByName('wid').AsInteger := WID;
    Open;
    Result := FieldByName('name').AsString;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  SetGrdMainWidth;
  SavePTColumns;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWMat.GetWHList: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetWHList') else _udebug := nil;{$ENDIF}

  Result := '';

  with newDataSet do
  try
    ProviderName := 'pWHouse_List';
    FetchMacros;
    Macros.ParamByName('m').AsString := WHAccessMacro;
    Open;
    Result := GetDSStr(Fields[0].DataSet, 'wid');
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtWMat, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colAtWHGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colAtWHGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(ANode.Values[colRemain.Index]
             - VarToFloat(ANode.Values[colInWay.Index]) - VarToFloat(ANode.Values[colOrdered.Index]), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colInWayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colInWayGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and (grdMats.FocusedColumn = colMAmount.ColIndex) then begin
    grdMain.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsDragOver') else _udebug := nil;{$ENDIF}

  Accept := (Source = grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsDragDrop(Sender, Source: TObject; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsDragDrop') else _udebug := nil;{$ENDIF}

  // Fmode=7 for clients order
  if (FMode <> 7) and (WID = 0) and (FWHCount > 1)
    then SelectWHErr
    else AddMatToDoc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.AddMatToDoc;
  var
    FPrice, FDisc, FNDS: Extended;
    i: Integer;
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.AddMatToDoc') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Executing');
  fProgress.pbMain.Max := grdMain.SelectedCount;

  if grdMain.SelectedCount > 0 then fProgress.Show;
  try
    mdMats.DisableControls;

    for i := 0 to grdMain.SelectedCount - 1 do begin
      ANode := grdMain.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colName.Index];
      Application.ProcessMessages;

      with mdMats do begin
        FDisc := 0;
        FPrice := GetFinalPrice(ANode.Values[colID.Index], DocInfo.KAID, CurrPTypeID, FDisc, FNDS);
        Append;
        FieldByName('posid').AsInteger := RecordCount + 1;
        FieldByName('matid').AsInteger := ANode.Values[colID.Index];
        FieldByName('ptypeid').AsInteger := CurrPTypeID;
//if cdsPriceTypes.Locate('ptypeid', CurrPTypeID, [])
//  then FieldByName('ptypename').AsString := cdsPriceTypes.FieldByName('name').AsString;
        FieldByName('name').AsString := ANode.Values[colName.Index];
        FieldByName('amount').AsFloat := WBOutDefAmount;
        FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];
        FieldByName('msrname').AsString := ANode.Values[colMeasure.Index];
        FieldByName('producer').AsString := ANode.Values[colProducer.Index];
        FieldByName('barcode').AsString := ANode.Values[colBarCode.Index];
        FieldByName('whname').AsString := WHName(dmData.SConnection, WID);

        if WID > 0
          then FieldByName('wid').AsInteger := WID
          else begin
            cdsWH.Locate('def', 1, []);
            FieldByName('wid').AsInteger := cdsWH.FieldByName('wid').AsInteger;
          end;

        FieldByName('price').AsFloat := FPrice;
        FieldByName('fullprice').AsFloat := FPrice / (100 - FDisc) * 100;
        FieldByName('discount').AsFloat := FDisc;
        FieldByName('nds').AsFloat := FNDS;
        Post;
      end;

      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

  finally
    if fProgress.Visible then fProgress.Hide;

    mdMats.EnableControls;
    grdMats.Adjust(nil, [colMRecNo]);
  end;

  tsAdd.Show;
  grdMats.SetFocus;
  grdMats.ClearSelection;

  if grdMats.FocusedNode <> nil
    then grdMats.FocusedNode.Selected := True;

  UpdateActionList;
  grdMats.FocusedColumn := colMAmount.ColIndex;
  grdMats.ShowEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if odd(ANode.Index) and not ASelected
      then AColor := GridOddLinesColor;

    if ASelected then
      if (AColumn.ColIndex <> grdMats.FocusedColumn) or not AFocused
        then begin
          AColor := $00BEBEBE;
        end;

    if ASelected and AFocused and AColumn.DisableEditor then AColor := grdMats.HighlightColor;

    if not ASelected or not AFocused
      then AFont.Color := clWindowText;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMRecNoGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.Index + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainDragOver') else _udebug := nil;{$ENDIF}

  if Source = grdMats then Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatsDelExecute(Sender: TObject);
  var
    i: Integer;
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatsDelExecute') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.pbMain.Max := grdMats.SelectedCount;

  if grdMats.SelectedCount > 1 then fProgress.Show;

  try
    mdMats.DisableControls;

    for i := 0 to grdMats.SelectedCount - 1 do begin
      ANode := grdMats.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colMMatName.Index];
      fProgress.pbMain.StepIt;
      mdMats.Locate('matid', ANode.Values[colMMatID.Index], []);
      mdMats.Delete;
      Application.ProcessMessages;
    end;

  finally
    if fProgress.Active then fProgress.Hide;

    mdMats.EnableControls;
    grdMats.Adjust(nil, [colMRecNo]);
  end;

  if grdMats.FocusedNode <> nil then grdMats.FocusedNode.Selected := True;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMainDragDrop(Sender, Source: TObject; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMainDragDrop') else _udebug := nil;{$ENDIF}

  if Source = grdMats then aMatsDel.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatsSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatsSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMats.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMatsColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMatsColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMats.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsDblClick') else _udebug := nil;{$ENDIF}

  aMatsDel.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWMat.grdMatsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;
  AIndex := tsAdd.ImageIndex;
  AText := rs('fmMaterials', 'MatList');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsNeedAdjust') else _udebug := nil;{$ENDIF}

  grdMats.Adjust(nil, [colMRecNo]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWMat.GetFinalPrice(AMatID, AKAID, APTypeID: Integer; var ADisc: Extended; var ANDS: Extended): Extended;
  var
    FMin, FMax, FAvg, FLast, FRsv, FRemain, FPrice, FTmp: Extended;
    FWithNDS: Boolean;
    FDisc, FNDS: Extended;
    FIntTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetFinalPrice') else _udebug := nil;{$ENDIF}

  FPrice := 0;
  FNDS := 0;

  GetMatPrices(dmData.SConnection, AMatID, FMin, FMax, FAvg, FLast, FRemain, FRsv);

  if WBOutAutoPrice > 0 then begin
    if WBOutAutoPrice = 1
      then FIntTmp := 0
      else FIntTmp := AKAID;

    FPrice := GetLastOutPrice(dmData.SConnection, AMatID, DocInfo.CurrID, DocInfo.OnDate, DocInfo.CurrRate, FIntTmp);
    FPrice := RoundToA(FPrice, PriceDisplayDigits);

    FWithNDS := True;
    case WBOutPriceType of
      0: if not FWithNDS then FPrice := NDSIn(FPrice, ANDS);
      1: if FWithNDS then FPrice := NDSOut(FPrice, ANDS);
    end;
  end;

  if (WBOutAutoPrice = 0) or (FPrice = 0) then begin
    if POType = poAvg
      then FPrice := FAvg
      else FPrice := FLast;

    with newDataSet do
    try
      ProviderName := 'pMaterials_GetNDS';
      FetchParams;
      Params.ParamByName('matid').AsInteger := AMatID;
      Open;

      if not IsEmpty then FNDS := FieldByName('nds').AsFloat;

      if FNDS = -1 then FNDS := 0;

      if not DocInfo.NDSPayer then FNDS := 0;

      Close;

    finally
      Free;
    end;

    ANDS := FNDS;

    FPrice := GetDefPriceOut(dmData.SConnection, AMatID, APTypeID, FPrice, DocInfo.OnDate, DocInfo.CurrRate, FWithNDS, DocInfo.CurrID);

    case WBOutPriceType of
      0: if not FWithNDS then FPrice := NDSIn(FPrice, FNDS);
      1: if FWithNDS then FPrice := NDSOut(FPrice, FNDS);
    end;
  end;

  FPrice := RoundToA(FPrice{ / Kurs}, PriceDisplayDigits);

  FDisc := GetDiscount(dmData.SConnection, AMatID, AKAID);
  FPrice := RoundToA(FPrice - (FPrice / 100) * FDisc, -6);

  FPrice := SalesPriceRound(FPrice);

  ADisc := FDisc;
  Result := FPrice;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.BuildPTMenu(AID: Integer);
  var
    FItem: TTBItem;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.BuildPTMenu') else _udebug := nil;{$ENDIF}

  with cdsPriceTypes do begin
    First;

    i := 0;
    while not Eof do begin
      if FieldByName('ptypeid').AsInteger > 0 then begin
        FItem := TTBItem.Create(pmMats);
        FItem.GroupIndex := 12;
        FItem.AutoCheck := True;
        FItem.Caption := FieldByName('name').AsString;
        FItem.Tag := FieldByName('ptypeid').AsInteger;
        //FItem.Tag := Integer(Objects[i]);
        FItem.OnClick := mnuPTClick;

        if AID = FieldByName('ptypeid').AsInteger then begin
          FItem.Checked := True;
          itmDefPT.Caption := rs('fmWMat', 'CurrPT') + ': ' + FItem.Caption;
        end;

        itmDefPT.Insert(i, FItem);
        //FItem.MenuIndex := i;
        Inc(i);
      end;

      Next;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.mnuPTClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.mnuPTClick') else _udebug := nil;{$ENDIF}

  with TTBItem(Sender) do begin
    if CurrPTypeID <> Tag then begin
      CurrPTypeID := Tag;
      itmDefPT.Caption := rs('fmWMat', 'CurrPT') + ': ' + Self.Caption;

      if ssMessageDlg(Format(rs('fmWMat', 'SetPTForAll'), [Caption]), ssmtConfirmation, [ssmbYes, ssmbNo]) = mrYes
        then SetPTForAll(CurrPTypeID);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMPriceTypeCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  var
    FPrice, FDisc, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMPriceTypeCloseUp') else _udebug := nil;{$ENDIF}

  grdMats.CloseEditor;

  if VarToInt(Value) <> mdMats.FieldByName('ptypeid').AsInteger then
    try
      Screen.Cursor := crSQLWait;

      if VarToInt(Value) = 0
        then FPrice := 0
        else FPrice := GetFinalPrice(mdMats.FieldByName('matid').AsInteger, DocInfo.KAID, VarToInt(Value), FDisc, FNDS);

      mdMats.Edit;
      mdMats.FieldByName('price').AsFloat := FPrice;
      mdMats.Post;

    finally
      Screen.Cursor := crDefault;
    end;

  if VarToInt(Value) = 0 then begin
    grdMats.FocusedField := mdMatsprice;
    grdMats.ShowEditor;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsPriceTypesAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsPriceTypesAfterOpen') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    Append;
    FieldByName('pname').AsString := 'DUMMY';
    FieldByName('ptypeid').AsInteger := 0;
    FieldByName('name').AsString := rs('fmWMat', 'Manual');
    FieldByName('onvalue').AsFloat := 0;
    FieldByName('num').AsInteger := 0;
    FieldByName('deleted').AsInteger := 0;
    FieldByName('def').AsInteger := 0;
    Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMPriceChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMPriceChange') else _udebug := nil;{$ENDIF}

  if mdMats.FieldByName('ptypeid').AsInteger <> 0
    then FPriceChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMatsEdited(Sender: TObject; Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMatsEdited') else _udebug := nil;{$ENDIF}

  if FPriceChanged then begin
    mdMats.Edit;
    mdMats.FieldByName('ptypeid').AsInteger := 0;
    mdMats.Post;
    FPriceChanged := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SetPTForAll(AID: Integer);
  var
    BM: TBookmark;
    FPrice, FDisc, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SetPTForAll') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('fmWMat', 'DefiningPrices') + '...';
  fProgress.Show;
  fProgress.pbMain.Max := mdMats.RecordCount;

  with mdMats do begin
    BM := GetBookmark;
    DisableControls;

    try
      First;
      while not Eof do begin
        fProgress.lText.Caption := FieldByName('name').AsString;
        Application.ProcessMessages;
        FPrice := GetFinalPrice(FieldByName('matid').AsInteger, DocInfo.KAID, AID, FDisc, FNDS);

        Edit;
        FieldByName('ptypeid').AsInteger := AID;
        FieldByName('price').AsFloat := FPrice;
        Post;

        Next;

        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      fProgress.Hide;
      EnableControls;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWMat.GetWHCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.GetWHCount') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWHouse_Count';
    Open;
    Result := Fields[0].AsInteger;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SelectWHErr;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SelectWHErr') else _udebug := nil;{$ENDIF}

  ssMessageDlg(rs('fmWMat', 'SelectWHErr'), ssmtError, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsWHAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsWHAfterOpen') else _udebug := nil;{$ENDIF}

  FWHCount := DataSet.RecordCount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMWHNameCloseUp(Sender: TObject; var Value: Variant; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMWHNameCloseUp') else _udebug := nil;{$ENDIF}

  grdMats.CloseEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.WMOKShowModal(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.WMOKShowModal') else _udebug := nil;{$ENDIF}

  Sleep(250);

  if FMode > 1 then ssMessageDlg(rs('fmMaterials', 'MatsNote'), ssmtInformation, [ssmbOk], 'MatsNote', True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsWHBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsWHBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWH.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsOrderedBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsOrderedBeforeOpen') else _udebug := nil;{$ENDIF}

  with (DataSet as TssClientDataSet) do begin
    Params.ParamByName('matid').AsInteger := cdsView.fieldbyname('matid').AsInteger;
    Params.ParamByName('getempty').AsInteger := 0;
    Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('wid').AsInteger := WID;

    if (lcbKAgent.EmptyValue = lcbKAgent.KeyValue) or not panFilter.Visible
      then Params.ParamByName('kaid').AsInteger := 0
      else Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsOrderedAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsOrderedAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;
  grdOrdered.ClearSelection;

  if grdOrdered.FocusedNode <> nil
    then grdOrdered.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colODocDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colODocDateGetText') else _udebug := nil;{$ENDIF}

  try
    if VarToInt(ANode.Values[colWBillID.Index]) = -16
      then AText := ''
      else AText := DateToStr(ANode.Values[grdOrdered.ColumnByName(colODocDate.Name).Index]);

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOToDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOToDateGetText') else _udebug := nil;{$ENDIF}

  try
    if VarToStr(ANode.Values[grdOrdered.ColumnByName(colOToDate.Name).Index]) <> ''
      then AText := DateToStr(ANode.Values[grdOrdered.ColumnByName(colOToDate.Name).Index]);

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOToDateCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOToDateCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if (AText <> '') and (StrToDate(AText) < OnDate)
      then AFont.Color := clRed;

  except
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOPriceInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOPriceInCurrGetText') else _udebug := nil;{$ENDIF}

  if ShowPrices then begin
    try
      AText := FormatFloat(MoneyDisplayFormat, ANode.Values[colOPriceInCurr.Index]) + ' ' + ANode.Values[colOShortName.Index]

    except
      //if Atext <> '' then AText := '-ERR-';
      udebug1('"' + Atext + '" convert error');
    end;
  end
  else AText := rs('Common', 'NA');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOPriceGetText') else _udebug := nil;{$ENDIF}

  try
   if ShowPrices
     then AText := FormatFloat(MoneyDisplayFormat,
           StrToFloat(ANode.Values[colOPrice.Index]) * StrToFloat(ANode.Values[colORate.Index])) + ' ' + BaseCurrName
     else AText := rs('Common', 'NA');

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdOrderedNeedAdjust(Sender: TObject);
  var
    i, j: Integer;
    FVis: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdOrderedNeedAdjust') else _udebug := nil;{$ENDIF}

  for j := 0 to grdOrdered.Bands.Count - 1 do begin
    FVis := False;

    for i := 1 to grdOrdered.ColumnCount - 1 do
      if grdOrdered.Columns[i].Visible and (grdOrdered.Columns[i].BandIndex = j)
        then FVis := True;

    grdOrdered.Bands.Items[j].Visible := FVis;
  end;

  AdjustGrid(grdOrdered, GetFirstVisibleCol(grdOrdered));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aOColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aOColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdOrdered.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aGotoOrderExecute(Sender: TObject);
  var
    FWBillID, FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aGotoOrderExecute') else _udebug := nil;{$ENDIF}

  FWBillID := cdsOrdered.FieldByName('docid').AsInteger;
  FPosID := cdsOrdered.FieldByName('posid').AsInteger;

  case cdsOrdered.FieldByName('wtype').AsInteger of
    16: frmMainForm.ExecLocate(vtDocs, 'TfmOrders', FWBillID, 16);
     1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybill', FWBillID, FPosID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colOAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colOAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText) - StrToFloat(ANode.Values[colORsv.Index]), MatDisplayDigits));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsOrderedCalcFields(DataSet: TDataSet);
  var
    FRsv: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsOrderedCalcFields') else _udebug := nil;{$ENDIF}

  FRsv := DataSet.FieldByName('rsv').AsFloat;

  with cdsRsv_Temp do
    if Active then begin
      First;
      while not Eof do begin
        if ((FieldByName('visible').AsInteger = 1) or
           ((FieldByName('visible').AsInteger = 0) and
            (fieldbyname('addr').AsInteger = ServerAddr))) and
           (FieldByName('posid').AsInteger = DataSet.FieldByName('posid').AsInteger)
          then FRsv := FRsv + FieldByName('amount').AsFloat;
        Next;
      end;
    end;

  DataSet.FieldByName('reserved').AsFloat := FRsv;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdOrderedDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdOrderedDblClick') else _udebug := nil;{$ENDIF}

  if (grdOrdered.Count > 0) then begin
    {if (FMode = 1) then begin
      FCurrentID := cdsPrice.FieldByName('posid').AsInteger;
      RefType := rtWMat;
      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end}
//else if (FMode = 0) {and (FParam > 0)} then begin
      FCurrentID := cdsOrdered.FieldByName('posid').AsInteger; //cdsView.FieldByName('matid').AsInteger;
      PosInfo.PosID := FCurrentID;
      PosInfo.MatID := cdsView.FieldByName('matid').AsInteger;
      PosInfo.WID := cdsOrdered.FieldByName('wid').AsInteger;
      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdPriceGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdPriceGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := Trim(tsPrice.Caption);
  ImgList := dmData.Images;
  AIndex := 171;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdOrderedGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdOrderedGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWMat', 'Ordered');
  ImgList := dmData.Images;
  AIndex := 203;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.srcOrderedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.srcOrderedDataChange') else _udebug := nil;{$ENDIF}

  if (FMode = 1) and (pcMain.ActivePage = tsOrdered)
    then FCurrentID := cdsOrdered.fieldbyname('posid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colODocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colODocNumGetText') else _udebug := nil;{$ENDIF}

  try
    if VarToInt(ANode.Values[colWBillID.Index]) = -16
      then AText := rs('fmOrders', 'Temp');

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aOrderExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditOrderTmp.Create(nil) do
  try
    MainHandle := Self.Handle;
    ID := 0;
    edMat.MatID := cdsView.FieldByName('matid').AsInteger;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.LoadGrids;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.LoadGrids') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TdxDBGrid) and (edgoStoreToRegistry in TdxDBGrid(Self.Components[i]).OptionsBehavior)
    then if (Self.Components[i] = grdMain) and ModalView
         then TdxDBGrid(Self.Components[i]).LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name + 'Modal')
         else TdxDBGrid(Self.Components[i]).LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.SaveGrids;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SaveGrids') else _udebug := nil;{$ENDIF}

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TdxDBGrid) and (edgoStoreToRegistry in TdxDBGrid(Self.Components[i]).OptionsBehavior)
      then if (Self.Components[i] = grdMain) and ModalView
           then TdxDBGrid(Self.Components[i]).SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name + 'Modal')
           else TdxDBGrid(Self.Components[i]).SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\' + Self.Components[i].Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colAvgPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colAvgPriceGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(PriceDisplayFormat, StrToFloat(AText));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.mdMatsCalcFields(DataSet: TDataSet);
  var
    FNDS, FDisc, FSumWONDS, FSumWithNDS, FAmount, FPosNDS, FPrice: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.mdMatsCalcFields') else _udebug := nil;{$ENDIF}

  FAmount := DataSet.FieldByName('amount').AsFloat;
  FDisc := DataSet.FieldByName('discount').AsFloat;
  FPrice := DataSet.FieldByName('price').AsFloat / (100 - FDisc) * 100;
  FPosNDS := DataSet.FieldByName('nds').AsFloat;
  NDSCalc(FAmount, FPrice, FPosNDS, 1, FSumWONDS, FNDS);
  FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
  FSumWONDS := RoundToA(FSumWithNDS - RoundToA(FNDS, -2), -2);

  //todo 5 -cмысли: Multiple taxes accounting
  {FTaxSumm := 0;
   if not edFindMat.Taxes.IsEmpty then
     with edFindMat.Taxes do begin
       First;
       while not Eof do begin
         if AllowTax(FieldByName('taxtype').AsInteger, KAType) then
           FTaxSumm := FTaxSumm + RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);
         Next;
       end;
     end;}

  DataSet.FieldByName('summ').AsFloat := FSumWithNDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colMSummGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colMSummGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aOrderMinRsvExecute(Sender: TObject);
  var
    BM: TBookmark;
    FID, FWID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aOrderMinRsvExecute') else _udebug := nil;{$ENDIF}

  //{$IFNDEF LITE}
  if WID > 0
    then FWID := WID
    else begin
      DSRefresh(cdsWH, 'wid', 0);
      cdsWH.Locate('def', 1, []);
      FWID := cdsWH.FieldByName('wid').AsInteger;
    end;

  aRefresh.Execute;
  fProgress.pbMain.Max := cdsView.RecordCount;
  fProgress.Caption := rs('fmWMat', 'OrderMinRsvCap');
  fProgress.Show;

  BM := cdsView.GetBookmark;
  cdsView.DisableControls;

  with newDataSet do
  try
    cdsView.First;
    while not cdsView.Eof do begin
      fProgress.lText.Caption := cdsView.FieldByName('matname').AsString;
      Application.ProcessMessages;

      if (cdsView.FieldByName('isserial').AsInteger = 0) and (cdsView.FieldByName('minrsvneeded').AsFloat > 0)
      then begin
        TrStart;

        try
          FID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := -16;
          Open;
          if IsEmpty then begin
            Close;
            ProviderName := 'pWaybill_InsS';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := -16;
            Params.ParamByName('num').AsString := 'System';
            Params.ParamByName('ondate').AsDateTime := Date;
            Params.ParamByName('checked').AsInteger := 0;
            Params.ParamByName('deleted').AsInteger := 1;
            Params.ParamByName('defnum').AsInteger := 0;
            Params.ParamByName('wtype').AsInteger := 16;
            Execute;
          end;
          Close;

          ProviderName := 'pWaybillDet_InsS';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FID;
          Params.ParamByName('matid').AsInteger := cdsView.FieldByName('matid').AsInteger;
          Params.ParamByName('wbillid').AsInteger := wbtOrderOut;
          Params.ParamByName('num').AsInteger := FID;
          Params.ParamByName('wid').AsInteger := FWID;//?
          Params.ParamByName('amount').AsFloat := cdsView.FieldByName('minrsvneeded').AsFloat;
          Params.ParamByName('nds').AsFloat := NDS;
          Params.ParamByName('ondate').AsDateTime := Now;
          Execute;

          ProviderName := 'pWaybillDetAP_InsS';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FID;
          Params.ParamByName('notes').AsString := colMinRsvNeeded.Caption;
          Params.ParamByName('certnum').AsString := UserFullName;
          Execute;

          ProviderName := 'pWMatTurnOut_Ins';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FID;
          Params.ParamByName('matid').AsInteger := cdsView.FieldByName('matid').AsInteger;
          Params.ParamByName('wid').AsInteger := FWID;
          Params.ParamByName('sourceid').AsInteger := FID;
          Params.ParamByName('turntype').AsInteger := matTurnOrdered;
          Params.ParamByName('ondate').AsDateTime := Now;
          Params.ParamByName('amount').AsFloat := cdsView.FieldByName('minrsvneeded').AsFloat;
          Execute;

          TrCommit;

        except
          TrRollback;
          raise;
        end;
      end;

      cdsView.Next;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;
    aRefresh.Execute;

  finally
    cdsView.GotoBookmark(BM);
    cdsView.FreeBookmark(BM);
    cdsView.EnableControls;
    Free;
    fProgress.Hide;
  end;

  //{$I ASPROTECT\reg_crypt_end.inc}
  (*
  {$ELSE}
  showNotAvailable; // freeware ver
  {$ENDIF}
  *)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aMCColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aMCColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMC.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.grdMCGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.grdMCGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := tsMC.Caption;
  ImgList := dmData.Images;
  AIndex := II_MC;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.cdsPTAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    ACol: TdxDBTreeListColumn;
    FIndex, FColWidth, FColVis: Integer;
    FField, FFieldCurr: TStringField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.cdsPTAfterOpen') else _udebug := nil;{$ENDIF}

  with grdMain do begin
    BeginUpdate;
    i := 0;

    while i <= ColumnCount - 1 do begin
      if (Pos('colPT', Columns[i].Name) = 1) or (Pos('colCurrPT', Columns[i].Name) = 1)
        then Columns[i].Free
        else Inc(i);
    end;

    while i <= cdsView.Fields.Count - 1 do begin
      if (Pos('fldPT', cdsView.Fields[i].FieldName) = 1) or (Pos('fldCurrPT', cdsView.Fields[i].FieldName) = 1)
        then cdsView.Fields[i].Free
        else Inc(i);
    end;

    cdsPT.First;
    while not cdsPT.Eof do begin
      ACol := CreateColumnEx(TdxDBGridColumn, grdMain);
      ACol.Name := 'colCurrPT' + cdsPT.FieldByName('ptypeid').AsString;
      ACol.FieldName := 'CurrPT' + cdsPT.FieldByName('ptypeid').AsString;
      ACol.Visible := False;

      ACol := CreateColumnEx(TdxDBGridColumn, grdMain);
      ACol.Name := 'colPT' + cdsPT.FieldByName('ptypeid').AsString;
      ACol.FieldName := 'PT' + cdsPT.FieldByName('ptypeid').AsString;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Width', FColWidth)
        then ACol.Width := FColWidth
        else ACol.Width := 70;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Visible', FColVis)
        then ACol.Visible := (FColVis = 1)
        else ACol.Visible := False;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Index', FIndex)
        then ACol.Index := FIndex;

      ACol.MinWidth := 30;

      ACol.Tag := 1;
      ACol.Sizing := True;
      ACol.Caption := cdsPT.FieldByName('name').AsString;
      ACol.HeaderAlignment := taCenter;
      ACol.Alignment := taRightJustify;
      //ACol.OnGetText := colPTGetText;

      FField := TStringField.Create(cdsView);
      FField.Size := 24;
      FField.Name := 'fldPT' + cdsPT.FieldByName('ptypeid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'PT' + cdsPT.FieldByName('ptypeid').AsString;
      FField.DataSet := cdsView;

      FFieldCurr := TStringField.Create(cdsView);
      FFieldCurr.Name := 'fldCurrPT' + cdsPT.FieldByName('ptypeid').AsString;
      FFieldCurr.FieldKind := fkInternalCalc;
      FFieldCurr.Size := 24;
      FFieldCurr.FieldName := 'CurrPT' + cdsPT.FieldByName('ptypeid').AsString;
      FFieldCurr.DataSet := cdsView;
      cdsPT.Next;
    end;

    EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.colPTGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  (*var
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.colPTGetText') else _udebug := nil;{$ENDIF}

  try
    s := Anode.Values[(Sender as TdxDBTreeListColumn).Index - 1];

    if AText <> '' then AText := FormatFloat(',0.00####', RoundToA(StrToFloat(AText), -5))  + ' ' + s;

  except
    //if Atext <> '' then AText := '-ERR-';
    udebug1('"' + Atext + '" convert error');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWMat.SavePTColumns;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.SavePTColumns') else _udebug := nil;{$ENDIF}

  with grdMain do begin
    for i := 0 to ColumnCount - 1 do
      if Pos('colPT', Columns[i].Name) = 1 then begin
        WriteToRegInt(MainRegKey + '\' + Self.Name + '\' + Columns[i].Name, 'Width', Columns[i].Width);
        WriteToRegInt(MainRegKey + '\' + Self.Name + '\' + Columns[i].Name, 'Index', Columns[i].Index);
        WriteToRegInt(MainRegKey + '\' + Self.Name + '\' + Columns[i].Name, 'Visible', Integer(Columns[i].Visible));
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWMat.aSelectAllExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWMat.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMain.SelectAll;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WMat', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

