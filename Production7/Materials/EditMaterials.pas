{$I ok_sklad.inc}
unit EditMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ExtDlgs,
  ActnList, DB, DBClient, Buttons, ComCtrls, Mask, Menus, ImgList,

  dxCntner6, dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6,

  cxControls, cxContainer, cxEdit, cxTextEdit, cxPC, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxCheckBox, cxCurrencyEdit, cxDBLookupComboBox,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxCalc, cxTreeView, cxGroupBox, cxSplitter, cxImage, cxCheckListBox, cxDBCheckListBox,

  ssBaseTypes, ssFormStorage, ssClientDataSet, ssDBComboBox, ssBaseDlg, ssBaseConst, ssImagePanel,
  ssPopupTreeEdit, ssDBTreeView, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, ssDBLookupCombo, ssLabel, ssMemDS,
  ssCalcEdit, ssGroupBox, ssPageControl,
  okSearchEdit, okLabel,
  prTypes, TreeSelector,

  TB2Item, xButton, xBarCode, CheckLst, TB2ExtItems, SqlTimSt, apTree, apImgList,
  cxListView, Grids, cxFilter, cxData, cxDataStorage, cxImageComboBox,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxTLData, cxDBTL, ValEdit;

type
  TfrmEditMaterials = class(TBaseDlg)
    aBundleAdd: TAction;
    aBundleDel: TAction;
    aBundleEdit: TAction;
    aGrpDel1: TMenuItem;
    aGrpIns1: TMenuItem;
    aGrpProp1: TMenuItem;
    aGrpRefresh1: TMenuItem;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMCDel: TAction;
    aMCNew: TAction;
    aMCProps: TAction;
    aMIns: TAction;
    apImgList1: TapImgList;
    aPricesAdd: TAction;
    aPricesDel: TAction;
    aPricesProps: TAction;
    bcMain: TxBarCode;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btnBundleAdd: TssSpeedButton;
    btnBundleDel: TssSpeedButton;
    btnBundleEdit: TssSpeedButton;
    btnCopyArtikul: TssSpeedButton;
    btnCopyName: TssSpeedButton;
    btnCountries: TssSpeedButton;
    btnDelIndNDS: TssSpeedButton;
    btnGenBarcode: TssSpeedButton;
    btnGrp: TssSpeedButton;
    btnGrpParent: TssSpeedButton;
    btnMCDel: TssSpeedButton;
    btnMCDelEx: TssSpeedButton;
    btnMCLevelUp: TssSpeedButton;
    btnMCNew: TssSpeedButton;
    btnMCNewEx: TssSpeedButton;
    btnMCProps: TssSpeedButton;
    btnMCPropsEx: TssSpeedButton;
    btnMeasures: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnWHouse: TssSpeedButton;
    butWWWcopyDown: TssSpeedButton;
    bvlDiscSep: TssBevel;
    cbDemandCat: TcxComboBox;
    cbExtra: TcxComboBox;
    cbGoldColor: TcxComboBox;
    cbProducer: TcxComboBox;
    cbType: TcxComboBox;
    cbWWWCustomAlias: TcxCheckBox;
    cbWWWPost: TcxCheckBox;
    cbWWWPriceCategory: TcxComboBox;
    cbWWWSpecial: TcxCheckBox;
    cdsCountries: TssClientDataSet;
    cdsCurrency: TssClientDataSet;
    cdsMatGroup: TssClientDataSet;
    cdsMeasures: TssClientDataSet;
    cdsParent: TssClientDataSet;
    cdsPriceType: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsTaxes: TssClientDataSet;
    cdsTaxeschb: TIntegerField;
    cdsTaxesDELETED: TIntegerField;
    cdsTaxesNAME: TStringField;
    cdsTaxesONVALUE: TFloatField;
    cdsTaxesTAXID: TIntegerField;
    cdsWarehouse: TssClientDataSet;
    chbDefineExtra: TcxCheckBox;
    chbNDS: TcxCheckBox;
    chbSerials: TcxCheckBox;
    chbWithNDS: TcxCheckBox;
    clbGoldColors: TCheckListBox;
    clbGoldSizes: TCheckListBox;
    colCurrName: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colDeff: TcxTreeListColumn;
    colID: TcxTreeListColumn;
    colMCArtikul: TdxDBGridMemoColumn;
    colMCMatID: TdxDBGridColumn;
    colMCName: TdxDBGridColumn;
    colNAme: TcxTreeListColumn;
    colPricesPPType: TdxDBGridColumn;
    colPTypeExtra: TdxDBGridColumn;
    colPTypeName: TdxDBGridColumn;
    colPTypeType: TdxDBGridColumn;
    cxSplitter1: TcxSplitter;
    edArtikul: TcxTextEdit;
    edBarCode: TcxTextEdit;
    edDisc: TssCalcEdit;
    edKoef: TssCalcEdit;
    edLabelDescr: TcxTextEdit;
    edMCMat: TokMatSearchEdit;
    edMinReserv: TssCalcEdit;
    edName: TcxTextEdit;
    edNDS: TssCalcEdit;
    edNotes: TcxMemo;
    edPrice: TssCalcEdit;
    edSize: TssCalcEdit;
    edWeight: TssCalcEdit;
    edWWWAlias: TcxTextEdit;
    edWWWMEtaKeywords: TcxTextEdit;
    edWWWMetaTitle: TcxTextEdit;
    edWWWProdName: TcxTextEdit;
    edWWWRetailPrice: TssCalcEdit;
    edWWWShortDescr: TcxTextEdit;
    gbAddInfo: TssGroupBox;
    gbBundle: TssGroupBox;
    gbExtra: TssGroupBox;
    gbExtras: TssGroupBox;
    gbGoldColors1: TcxGroupBox;
    gbGoldColors2: TcxGroupBox;
    gbGoldSizes2: TcxGroupBox;
    gbMainInfo: TssGroupBox;
    gbMatChange: TssGroupBox;
    gbMC: TssGroupBox;
    gbNotes: TssGroupBox;
    gbTax: TssGroupBox;
    gbWWW: TssGroupBox;
    gbWWWMainDescr: TcxGroupBox;
    gbWWWMeta: TcxGroupBox;
    grdMC: TdxDBGrid;
    grdPrices: TdxDBGrid;
    lArtikul: TssLabel;
    lBarCode: TssLabel;
    lcbCountries: TssDBLookupCombo;
    lcbCurrency: TssDBLookupCombo;
    lcbGrpParent: TssPopupTreeEdit;
    lcbMeasure: TssDBLookupCombo;
    lcbParent: TssPopupTreeEdit;
    lcbPriceTypes: TssDBLookupCombo;
    lcbPTExtra: TssDBLookupCombo;
    lcbWarehouse: TssDBLookupCombo;
    lCountry: TssLabel;
    lDemandCat: TssLabel;
    lDiscText: TssLabel;
    lGoldColors: TokLabel;
    lGoldSizes: TokLabel;
    lGrpParent: TssLabel;
    lLabelDescr: TssLabel;
    lMCNotes: TssLabel;
    lMeasure: TssLabel;
    lMinM: TssLabel;
    lMinReserv: TssLabel;
    lName: TssLabel;
    lNDS: TssLabel;
    lParent: TssLabel;
    lPrice: TssLabel;
    lPriceNotes: TssLabel;
    lPricePercent1: TssLabel;
    lPricePercent2: TssLabel;
    lProducer: TssLabel;
    lSize: TssLabel;
    lSizeM: TssLabel;
    lTaxText: TssLabel;
    lType: TssLabel;
    lWarehouse: TssLabel;
    lWeight: TssLabel;
    lWeightM: TssLabel;
    lWWWAlias: TcxLabel;
    lWWWDescr: TcxLabel;
    lWWWDetails: TcxLabel;
    lWWWGroups: TcxLabel;
    lWWWMetaDescr: TcxLabel;
    lWWWMetaKeywords: TcxLabel;
    lWWWMetaTitle: TcxLabel;
    lWWWPriceCategory: TcxLabel;
    lWWWProdName: TcxLabel;
    lWWWRetailPrice: TcxLabel;
    lWWWShortDescr: TcxLabel;
    mdBundles: TssMemoryData;
    mdMC: TssMemoryData;
    mdMCartikul: TStringField;
    mdMCfnode: TIntegerField;
    mdMCmatid: TIntegerField;
    mdMCname: TStringField;
    mdMCnotes: TStringField;
    mdPrices: TssMemoryData;
    mdPricesCurrID: TIntegerField;
    mdPricescurrmodified: TIntegerField;
    mdPricesCurrName: TStringField;
    mdPricesDef: TIntegerField;
    mdPricesen: TIntegerField;
    mdPricesExtraType: TIntegerField;
    mdPricesFNode: TIntegerField;
    mdPricesName: TStringField;
    mdPricesOnValue: TFloatField;
    mdPricespptypeid: TIntegerField;
    mdPricesPTypeID: TIntegerField;
    mdPricesSrc: TIntegerField;
    mdPricesvaluemodified: TIntegerField;
    mdPriceswithnds: TIntegerField;
    memMCNotes: TcxMemo;
    memoWWWDescr: TcxMemo;
    memoWWWDetails: TcxMemo;
    memoWWWMETADescr: TcxMemo;
    miGoldAdd: TTBEditItem;
    miGoldEdit: TTBEditItem;
    miGoldHeader: TTBItem;
    mnuDiscAdd: TTBItem;
    N1: TMenuItem;
    N2: TMenuItem;
    panBarCode: TPanel;
    Panel1: TPanel;
    pangbExtra: TPanel;
    pangbMC: TPanel;
    panGoldColors: TPanel;
    panGoldSizes: TPanel;
    panMCBar: TPanel;
    pcMain: TcxPageControl;
    pcParent: TPageControl;
    pcWWW: TssPageControl;
    pmGoldSizeColor: TTBPopupMenu;
    pmMatGroup: TPopupMenu;
    pmMC: TTBPopupMenu;
    rbtDisc: TcxRadioButton;
    rbtExtra: TcxRadioButton;
    rbtKoef: TcxRadioButton;
    rbtNoParent: TcxRadioButton;
    rbtParent: TcxRadioButton;
    rbtPrice: TcxRadioButton;
    sbTax: TScrollBox;
    splGold: TcxSplitter;
    srcBundles: TDataSource;
    srcCountries: TDataSource;
    srcCurrency: TDataSource;
    srcMatGroup: TDataSource;
    srcMC: TDataSource;
    srcMeasures: TDataSource;
    srcParent: TDataSource;
    srcPrices: TDataSource;
    srcPriceType: TDataSource;
    srcPriceTypes: TDataSource;
    srcWarehouse: TDataSource;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    tsBundle: TcxTabSheet;
    tsGoldProps: TcxTabSheet;
    tsGrp: TTabSheet;
    tsImages: TcxTabSheet;
    tsMain: TcxTabSheet;
    tsMat: TTabSheet;
    tsMatChange: TcxTabSheet;
    tsMatChangeList: TcxTabSheet;
    tsNotes: TcxTabSheet;
    tsPrice: TcxTabSheet;
    tsPrices: TcxTabSheet;
    tsTax: TcxTabSheet;
    tsWWW: TcxTabSheet;
    tsWWWGroups: TcxTabSheet;
    tsWWWMain: TcxTabSheet;
    tsWWWMarketing: TcxTabSheet;
    tvBundles: TcxDBTreeList;
    tvBundlesID: TcxDBTreeListColumn;
    tvBundlesModel: TcxDBTreeListColumn;
    tvBundlesMsrName: TcxDBTreeListColumn;
    tvBundlesName: TcxDBTreeListColumn;
    tvBundlesPID: TcxDBTreeListColumn;
    tvBundlesPOS: TcxDBTreeListColumn;
    tvBundlesQuantity: TcxDBTreeListColumn;
    tvBundlesType: TcxDBTreeListColumn;
    tvGroups: TcxTreeView;
    tvMain: TcxTreeList;
    btnWWWCopyFromMain: TssSpeedButton;
    tsCustomAttr: TcxTabSheet;
    gbCustAttr: TcxGroupBox;
    panCustAttr: TPanel;
    vlCustAttr: TValueListEditor;
    btnCAAdd: TxButton;
    btnCADel: TxButton;
    lCustAttr_SideNote: TLabel;

    procedure aApplyExecute(Sender: TObject);
    procedure aBundleAddExecute(Sender: TObject);
    procedure aBundleDelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aMCDelExecute(Sender: TObject);
    procedure aMCNewExecute(Sender: TObject);
    procedure aMInsExecute(Sender: TObject);
    procedure apImgList1Change(Sender: TObject);
    procedure aPricesDelExecute(Sender: TObject);
    procedure aPricesPropsExecute(Sender: TObject);
    procedure aWInsExecute(Sender: TObject);
    procedure btnCopyArtikulClick(Sender: TObject);
    procedure btnCopyNameClick(Sender: TObject);
    procedure btnDelIndNDSClick(Sender: TObject);
    procedure btnGenBarcodeClick(Sender: TObject);
    procedure btnMCLevelUpClick(Sender: TObject);
    procedure btnMCMatClick(Sender: TObject);
    procedure btnMeasuresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnMeasuresMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure butWWWcopyDownClick(Sender: TObject);
    procedure cbDemandCatEnter(Sender: TObject);
    procedure cbDemandCatExit(Sender: TObject);
    procedure cbDemandCatKeyPress(Sender: TObject; var Key: Char);
    procedure cbDemandCatPropertiesChange(Sender: TObject);
    procedure cbDemandCatPropertiesEditValueChanged(Sender: TObject);
    procedure cbExtraPropertiesEditValueChanged(Sender: TObject);
    procedure cbGoldSizePropertiesChange(Sender: TObject);
    procedure cbProducerEnter(Sender: TObject);
    procedure cbProducerExit(Sender: TObject);
    procedure cbProducerKeyPress(Sender: TObject; var Key: Char);
    procedure cbProducerPropertiesChange(Sender: TObject);
    procedure cbTypePropertiesChange(Sender: TObject);
    procedure cdsCurrencyAfterOpen(DataSet: TDataSet);
    procedure cdsMeasuresAfterOpen(DataSet: TDataSet);
    procedure cdsParentAfterOpen(DataSet: TDataSet);
    procedure cdsWarehouseAfterOpen(DataSet: TDataSet);
    procedure cdsWarehouseBeforeOpen(DataSet: TDataSet);
    procedure Change(Sender: TObject);
    procedure chbDefineExtraClick(Sender: TObject);
    procedure chbNDSClick(Sender: TObject);
    procedure chbSerialsClick(Sender: TObject);
    procedure clbGoldSizesClickCheck(Sender: TObject);
    procedure clbGoldSizesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DataModified(Sender: TObject);
    procedure edArtikulPropertiesChange(Sender: TObject);
    procedure edBarCodeEnter(Sender: TObject);
    procedure edBarCodeExit(Sender: TObject);
    procedure edBarCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edBarCodePropertiesChange(Sender: TObject);
    procedure edKoefEnter(Sender: TObject);
    procedure edKoefExit(Sender: TObject);
    procedure edKoefKeyPress(Sender: TObject; var Key: Char);
    procedure edKoefPropertiesChange(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edMCMatChange(Sender: TObject);
    procedure edMinReservEnter(Sender: TObject);
    procedure edMinReservExit(Sender: TObject);
    procedure edMinReservKeyPress(Sender: TObject; var Key: Char);
    procedure edMinReservPropertiesChange(Sender: TObject);
    procedure edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNotesPropertiesChange(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edSizeEnter(Sender: TObject);
    procedure edSizeExit(Sender: TObject);
    procedure edSizeKeyPress(Sender: TObject; var Key: Char);
    procedure edSizePropertiesChange(Sender: TObject);
    procedure edWeightEnter(Sender: TObject);
    procedure edWeightExit(Sender: TObject);
    procedure edWeightKeyPress(Sender: TObject; var Key: Char);
    procedure edWeightPropertiesChange(Sender: TObject);
    procedure edWWWEditChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdMCDblClick(Sender: TObject);
    procedure grdPricesColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdPricesCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdPricesDblClick(Sender: TObject);
    procedure grdPricesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbCountriesEnter(Sender: TObject);
    procedure lcbCountriesExit(Sender: TObject);
    procedure lcbCountriesKeyPress(Sender: TObject; var Key: Char);
    procedure lcbCountriesPropertiesChange(Sender: TObject);
    procedure lcbCountriesPropertiesEditValueChanged(Sender: TObject);
    procedure lcbCurrencyPropertiesChange(Sender: TObject);
    procedure lcbGrpParentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbMeasureEnter(Sender: TObject);
    procedure lcbMeasureExit(Sender: TObject);
    procedure lcbMeasureKeyPress(Sender: TObject; var Key: Char);
    procedure lcbMeasurePropertiesChange(Sender: TObject);
    procedure lcbMeasurePropertiesEditValueChanged(Sender: TObject);
    procedure lcbMeasurePropertiesInitPopup(Sender: TObject);
    procedure lcbParentEnter(Sender: TObject);
    procedure lcbParentExit(Sender: TObject);
    procedure lcbParentGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure lcbParentKeyPress(Sender: TObject; var Key: Char);
    procedure lcbParentPropertiesChange(Sender: TObject);
    procedure lcbParentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbPriceTypesPropertiesEditValueChanged(Sender: TObject);
    procedure lcbWarehouseEnter(Sender: TObject);
    procedure lcbWarehouseExit(Sender: TObject);
    procedure lcbWarehouseKeyPress(Sender: TObject; var Key: Char);
    procedure lcbWarehousePropertiesChange(Sender: TObject);
    procedure lcbWarehousePropertiesEditValueChanged(Sender: TObject);
    procedure lcbWarehousePropertiesInitPopup(Sender: TObject);
    procedure mdMCAfterDelete(DataSet: TDataSet);
    procedure memMCNotesPropertiesChange(Sender: TObject);
    procedure miGoldAddAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure miGoldEditAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure rbtExtraClick(Sender: TObject);
    procedure rbtKoefClick(Sender: TObject);
    procedure rbtParentClick(Sender: TObject);
    procedure rbtPriceClick(Sender: TObject);
    procedure refreshGoldComboBox(clb: TCheckListBox);
    procedure sbAddMeasureClick(Sender: TObject);
    procedure splMainMoved(Sender: TObject);
    procedure srcMCDataChange(Sender: TObject; Field: TField);
    procedure srcPricesDataChange(Sender: TObject; Field: TField);
    procedure tsPriceShow(Sender: TObject);
    procedure tvBundlesCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tvBundlesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvBundlesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvBundlesEdited(Sender: TObject; AColumn: TcxTreeListColumn);
    procedure tvBundlesGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure tvGroupsCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
    procedure tvGroupsDblClick(Sender: TObject);
    procedure tvMainCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure tvMainSelectionChanged(Sender: TObject);
    procedure btnWWWCopyFromMainClick(Sender: TObject);
    procedure btnCAAddClick(Sender: TObject);
    procedure btnCADelClick(Sender: TObject);
    procedure vlCustAttrSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);

  private
    DefBarCode: string;
    DefCountry: Integer;
    DefDemandCat: Integer;
    DefGrpID: Integer;
    DefMID: Integer;
    DefMinReserv: Extended;
    DefProducer: string;
    DefSize: Extended;
    DefWeight: Extended;
    DefWID: Integer;
    EdCanChange: Boolean;
    FBundleNode, FPricesNode, FMatChangeNode, FwwwNode, FimagesNode: TcxTreeListNode;
    FCanModify, FMCModified: Boolean;
    FCurrRef: TControl;
    FdateAdded, FDateModified: TDateTime;
    FNDSGrpName: string;
    FNDSGrpValue: Extended;
    FTmpMatID: Integer;
    FTreeSel: TfmTreeSelector;
    FTypeID: Integer; // tangible, bundle, etc
    isProduct: Boolean; // true for product/bundle. False fo prod group
    OldGrp: string;
    OldNum: integer;
    PriceCanChange, PriceCanPost, MCCanPost, MCCanChange: Boolean;
    SelfNDS: Boolean;
    wsGroups: TapTree;// ptr to current wshop's groups tree
    wwwTree, wsLangTree: TapTree; // WebShops related data

    function  CheckMC: Boolean;
    function  CheckPrices: Boolean;
    function  LocateMC: Boolean;
    procedure chbTaxClick(Sender: TObject);
    procedure GetPrices;
    procedure GetProducers;
    procedure LoadWebShops;
    procedure SetCanModify(const Value: Boolean);
    procedure switchWebShop(const wsID: Integer); // switches current webshop view
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMTreeSelect(var M: TMessage); message WM_TREESELECT;
    procedure MakeGroupsTree;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetGrpID(const Value: integer); override;
    procedure SetIDs(const Value: string); override;
    procedure GetImages;
    procedure GetTaxes;

  public
    ParentHandle: HWND;
    MatType: Integer;

    procedure SetCaptions; override;
    procedure SetPriceType(AType: boolean);
    property CanModify: Boolean read FCanModify write SetCanModify;
  end;

var
  frmEditMaterials: TfrmEditMaterials;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, prFun, ClientData, Login, ssFun, Udebug, DBTables, xStrUtils,
  EditMeasure, EditWHouse, fWHouse, ssCallbackConst, synacode, StrUtils,
  fMessageDlg, ssStrUtil, MatMove, MatRsv, StdConvs, MetaProduct,
  jpeg, regexpr, xLngDefs,
  ssBaseIntfDlg, EditWaybillOut;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
  initialGroup: Integer; //initial group of this product. used for tracking the change in grouptree
  jpeg: TJpegImage;
  {$IFDEF GOLD}colorsTree, sizesTree: TapTree;{$ENDIF}

{$R *.dfm}
//==============================================================================================
procedure TfrmEditMaterials.FormCreate(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    ctnode: TapTreeNode;
    ctData: TapTreeNodeData;
    ds: TssClientDataSet;
    fld: TField;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cbWWWPost.Tag := 1; // skip onChange events for WWW controls

  FCanModify := True;

  edMCMat.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  Screen.Cursor := crSQLWait;
  try
    Application.ProcessMessages;

    pcMain.ActivePage := tsMain;
    SetPriceType(True);

    cdsMeasures.Open;
    cdsCurrency.Open;
    cdsWarehouse.Open;
    cdsParent.Open;

    cdsPriceType.Open;
    cdsPriceTypes.Open;
    mdPrices.Open;

    mdMC.Open;
    cdsCountries.Open;
    lcbCountries.Text := '';

    GetProducers;
    GetTaxes;
    
    if not BarcodesEnabled then begin
      lBarcode.Enabled := False;
      bcMain.Visible := False;
    end;
    edBarCodePropertiesChange(edBarCode);

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF GOLD}
  {
  colorsTree := TapTree.Create(1, cfOwnerTypeProduct);
  clbGoldColors.Clear;
  clbGoldColors.Items.BeginUpdate;
  for i := 0 to colorsTree.Count - 1 do clbGoldColors.Items.AddObject(colorsTree[i].Name, colorsTree[i]);
  clbGoldColors.Items.EndUpdate;
  }

  sizesTree := TapTree.Create(2, cfOwnerTypeProduct);
  clbGoldSizes.Clear;

  clbGoldSizes.Items.BeginUpdate;
  for i := 0 to sizesTree.Count - 1 do clbGoldSizes.Items.AddObject(sizesTree[i].Name, sizesTree[i]);
  clbGoldSizes.Items.EndUpdate;
  {$ENDIF}

  // bundles
  with TIntegerField.Create(mdBundles) do begin
    FieldName := 'id'; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdBundles) do begin
    FieldName := 'type'; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TStringField.Create(mdBundles) do begin
    FieldName := 'name'; Size := 255; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftString);
  end;

  with TStringField.Create(mdBundles) do begin
    FieldName := 'model'; Size := 255; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftString);
  end;

  with TIntegerField.Create(mdBundles) do begin
    FieldName := 'pid'; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TIntegerField.Create(mdBundles) do begin
    FieldName := 'pos'; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftInteger);
  end;

  with TStringField.Create(mdBundles) do begin
    FieldName := 'msrname'; Size := 20; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftString);
  end;

  with TFloatField.Create(mdBundles) do begin
    FieldName := 'quantity'; DataSet := mdBundles; mdBundles.FieldDefs.Add(FieldName, ftFloat);
  end;

  with mdBundles do begin
    // numbers here are from pMat_getBundleable
    // products tree root
    Open;
    Append;
    FieldByName('id').asInteger := -2;
    FieldByName('type').asInteger := 0;
    FieldByName('name').asString := rs('fmMaterials', 'Mat');
    FieldByName('model').asString := '';
    FieldByName('pid').asInteger := 0;
    FieldByName('pos').asInteger := 0;
    FieldByName('msrname').asString := '';
    FieldByName('quantity').asFloat := 0.0;
    Post;

    // services tree root
    Append;
    FieldByName('id').asInteger := -1;
    FieldByName('type').asInteger := 0;
    FieldByName('name').asString := rs('fmServices', 'Title');
    FieldByName('model').asString := '';
    FieldByName('pid').asInteger := 0;
    FieldByName('pos').asInteger := 0;
    FieldByName('msrname').asString := '';
    FieldByName('quantity').asFloat := 0.0;
    Post;
  end; // with mdBundles

  cbWWWPost.Tag := 0; // enable onChange events for WWW controls

  FormResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.setid(const Value: integer);
  var
    FNode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    i, ii: Integer;
    s: String;
    BlobStream: TStream;
    hexStream: TMemoryStream;
    ctNode: TapTreeNode;
    ctData: TapTreeNodeData;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditMaterials.setid') else _udebug := nil;{$ENDIF}

  cbTypePropertiesChange(cbType); // init some variables and things 

  if not IsPattern then FID := Value;

  PriceCanChange := False;
  edNDS.Value := NDS;

  Screen.Cursor := crSQLWait;

  case isProduct of
    False: begin // Cleaning up for Prod Group
      LoadWebShops; // just for data integrity
      FimagesNode.DeleteChildren;
      FimagesNode.Delete;
      FimagesNode := nil;
    end;
  end;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not isProduct then begin // _Mat_Group_
        ProviderName := 'pMatGroup_Get';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := Value;
        Open;

        if not IsEmpty then begin
          edName.Text := FieldByName('name').AsString;

          if not FieldByName('pid').IsNull and (FieldByName('pid').AsInteger <> Value)
            then begin
              lcbGrpParent.Value := FieldByName('pid').AsInteger;
              rbtParent.Checked := True;
              initialGroup := lcbGrpParent.Value
            end
            else begin
              rbtNoParent.Checked := True;
              initialGroup := 0;
            end;
        end;
        Close;

        ProviderName := 'pMatGroup_GetNDS';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := Value;
        Open;

        if FieldByName('agrpid').AsInteger = -1 then begin
          chbNDS.Checked := True;
          edNDS.Value := NDS;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromOptions');
        end
        else if FieldByName('agrpid').AsInteger <> Value then begin
          chbNDS.Checked := FieldByName('ands').AsFloat <> -1;
          FNDSGrpValue := FieldByName('ands').AsFloat;
          FNDSGrpName := FieldByName('agrpname').AsString;
          edNDS.Value := FNDSGrpValue;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromGrp') + ' "' + FNDSGrpName + '"';
        end
        else if FieldByName('ands').AsFloat = -1 then begin
          chbNDS.Checked := False;
          edNDS.Value := NDS;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NoNDSGrp');
          SelfNDS := True;
        end
        else begin
          chbNDS.Checked := True;
          edNDS.Value := FieldByName('ands').AsFloat;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSInd');
          SelfNDS := True;
        end;
        Close;

        ProviderName := 'pMatGroupTaxes_Get';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := Value;
        Open;
        while not Eof do begin
          if cdsTaxes.Locate('taxid', FieldByName('taxid').AsInteger, []) then begin
            TssCalcEdit(TcxCheckBox(cdsTaxes.FieldByName('chb').AsInteger).Tag).Value := FieldByName('onvalue').AsFloat;
            TcxCheckBox(cdsTaxes.FieldByName('chb').AsInteger).Checked := True;
          end;

          Next;
        end;
        Close;
      end // if not isProduct = Product Group
      //--------------------------------------------------------------------------------------------------------------------
      else begin // product or bundle
        ProviderName := 'pMaterials_Get';
        FetchParams;
        Params.ParamByName('matid').AsInteger := Value;
        Open;
        if not IsEmpty then begin
          edName.Text := fieldbyname('name').asstring;

          {$IFDEF GOLD}
          s := fieldbyname('artikul').asstring;
          i := AnsiPos('_GOLD:', s);
          if i > 0
            then edArtikul.Text := AnsiMidStr(s, 1, i - 1)
            else edArtikul.Text := s;
          {$ELSE}
          edArtikul.Text := fieldbyname('artikul').asstring;
          {$ENDIF}

          lcbMeasure.KeyValue := fieldbyname('mid').AsInteger;
          edNotes.Text := fieldbyname('notes').asstring;

          if FieldByName('grpid').IsNull
            then lcbParent.EditingText := ''
            else lcbParent.Value := FieldByName('grpid').AsInteger;

          FGrpID := lcbParent.Value;
          if fieldbyname('wid').IsNull
            then lcbWarehouse.EditingText := ''
            else lcbWarehouse.KeyValue := fieldbyname('wid').AsInteger;

          OldNum := FieldByName('num').AsInteger;

          if not FieldByName('demandcat').IsNull
            then cbDemandCat.ItemIndex := FieldByName('demandcat').AsInteger;

          lcbCountries.KeyValue := -1;

          if not FieldByName('typeid').IsNull
            then FTypeID := FieldByName('typeid').asInteger
            else FTypeID := prodTIDTangible;

          case FTypeID of
            prodTIDTangible: cbType.ItemIndex := 0;
            prodTIDBundle:   cbType.ItemIndex := 2;
          end;
              
          if not FieldByName('cid').IsNull
            then lcbCountries.KeyValue := FieldByName('cid').AsInteger
            else lcbCountries.Clear;

          cbProducer.Text := FieldByName('producer').AsString;
          edWeight.Value := FieldByName('weight').AsFloat;
          edSize.Value := FieldByName('msize').AsFloat;
          edBarCode.Text := FieldByName('barcode').AsString;
          edMinReserv.Value := FieldByName('minreserv').AsFloat;
          chbSerials.Checked := (FieldByName('serials').AsInteger = 1);

          DefCountry := FieldByName('cid').AsInteger;
          DefProducer := FieldByName('producer').AsString;
          DefMID := FieldByName('mid').AsInteger;
          DefGrpID := FieldByName('grpid').AsInteger;
          DefWID := FieldByName('wid').AsInteger;

          if not FieldByName('demandcat').IsNull
            then DefDemandCat := FieldByName('demandcat').AsInteger
            else DefDemandCat := -1;

          DefSize := FieldByName('msize').AsFloat;
          DefWeight := FieldByName('weight').AsFloat;
          DefBarCode := FieldByName('barcode').AsString;
          DefMinReserv := FieldByName('minreserv').AsFloat;

          if not FieldByName('labeldescr').IsNull
            then edLabelDescr.EditingText := FieldByName('labeldescr').asString;

          // set delimiters to correct ones for SQL date conversion.
          if not FieldByName('dateadded').IsNull
            then FDateAdded := FieldByName('dateadded').AsDateTime
            else FDateAdded := Now;

          if not FieldByName('datemodified').IsNull
            then FDateModified := FieldByName('datemodified').AsDateTime
            else FDateModified := Now;

          (*
          {$IFDEF GOLD}
          if not FieldByName('cf1').IsNull and (colorsTree.NodeByID(FieldByName('cf1').AsInteger) <> nil) then begin
            cbGoldColor.Properties.Items.Add(colorsTree.NodeByID(FieldByName('cf1').AsInteger).Name);
            cbGoldColor.ItemIndex := 0;
          end;

          if not FieldByName('cf2').IsNull and (sizesTree.NodeByID(FieldByName('cf2').AsInteger) <> nil) then begin
            cbGoldSize.Properties.Items.Add(sizesTree.NodeByID(FieldByName('cf2').AsInteger).Name);
            cbGoldSize.ItemIndex := 0;
          end;
          {$ENDIF}
          *)
        end; // not isEmpty
        Close;

        ProviderName := 'pMaterials_GetNDS';
        FetchParams;
        Params.ParamByName('matid').AsInteger := Value;
        Open;

        if FieldByName('grpid').AsInteger = -1 then begin
          chbNDS.Checked := True;
          edNDS.Value := NDS;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromOptions');
        end
        else if not FieldByName('grpname').IsNull then begin
          chbNDS.Checked := FieldByName('nds').AsFloat <> -1;
          FNDSGrpValue := FieldByName('nds').AsFloat;
          FNDSGrpName := FieldByName('grpname').AsString;
          edNDS.Value := FNDSGrpValue;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromGrp') + ' "' + FNDSGrpName + '"';
        end
        else if FieldByName('nds').AsFloat = -1 then begin
          chbNDS.Checked := False;
          edNDS.Value := NDS;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NoNDS');
        end
        else begin
          chbNDS.Checked := True;
          edNDS.Value := FieldByName('nds').AsFloat;
          lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSInd');
        end;
        Close;

        ProviderName := 'pMatChange_Get';
        FetchParams;
        Params.ParamByName('matid').AsInteger := Value;
        Open;
        MCCanChange := False;

        while not Eof do begin
          FNode := tvMain.AddChild(FMatChangeNode, Pointer(5));
          FNode.Values[0] := FieldByName('name').AsString;
          FNode.ImageIndex := 14;
          FNode.SelectedIndex := 14;
          mdMC.Append;
          mdMC.FieldByName('matid').AsInteger := FieldByName('id').AsInteger;
          mdMC.FieldByName('fnode').AsInteger := Integer(FNode);
          mdMC.FieldByName('name').AsString := FieldByName('name').AsString;
          mdMC.FieldByName('artikul').AsString := FieldByName('artikul').AsString;
          mdMC.FieldByName('notes').AsString := FieldByName('notes').AsString;
          mdMC.Post;
          Next;
        end;
        Close;

        if FTypeID = prodTIDBundle then begin
          ProviderName := 'pBundle_Get';
          FetchParams;
          Params.ParamByName('bundleid').AsInteger := Value;
          Open;
          while not eof do begin
            mdBundles.Append;
            if FieldByName('itemType').asInteger = 0 then begin
              mdBundles.FieldByName('Type').AsInteger := bundleItemTypeProd;
              mdBundles.FieldByName('ID').AsInteger := FieldByName('itemID').AsInteger;
              mdBundles.FieldByName('PID').AsInteger := -2; // products tree root
            end
            else begin
              mdBundles.FieldByName('Type').AsInteger := bundleItemTypeSvc;
              mdBundles.FieldByName('ID').AsInteger := FieldByName('itemID').AsInteger;
              mdBundles.FieldByName('PID').AsInteger := -1; // services tree root
            end;

            mdBundles.FieldByName('Name').AsString    := FieldByName('Name').AsString;
            mdBundles.FieldByName('Model').AsString   := FieldByName('Model').AsString;
            mdBundles.FieldByName('pos').AsInteger    := FieldByName('pos').asInteger;
            mdBundles.FieldByName('Quantity').AsFloat := FieldByName('Quantity').asFloat;
            mdBundles.FieldByName('MsrName').AsString := FieldByName('Msrname').AsString;
            mdBundles.Post;
            Next;
          end;
          Close;
        end; //if FTypeID = prodTIDBundle

        // loading unconventional data about this product
        if ProductsTree = nil
          then ProductsTree := TapTree.Create(tree_Products, cfOwnerTypeProduct, ID)
          else ProductsTree.LoadData(ID);

        vlCustAttr.Strings.Clear;
        ctNode := ProductsTree.FindFirst(tree_ProdCustAttr, False, True);
        for i := 0 to ctNode.Count - 1 do begin
          ctData := ctNode[i].FindData(ID);
          if (ctdata <> nil) and (ctData.OwnerID = ID) and (ctData.dataType = apTreeDTTxt)
          then vlCustAttr.InsertRow(ctNode[i].Name, ctData.asText, True);
        end;

        if vlCustAttr.Strings.Count > 0 then begin
          vlCustAttr.Enabled := True;
          btnCADel.enabled := True;
        end;

      end; // if not isProduct  _else_ - Product/Bundle

      //-------------------------------------------------------------------
      if isProduct then begin // Prod/Bundle
        ProviderName := 'pMatPrices_GetFromGroup';
        FetchParams;
        Params.ParamByName('matid').AsInteger := Value;
        Open;

        while not eof do begin
          if mdPrices.Locate('ptypeid', FieldByName('ptypeid').AsInteger, []) then begin
            mdPrices.Edit;
            mdPrices.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
            mdPrices.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
            mdPrices.FieldByName('currname').AsString := FieldByName('shortname').AsString;
            mdPrices.FieldByName('extratype').AsInteger := FieldByName('extratype').AsInteger;
            mdPrices.FieldByName('src').AsInteger := 1;

            if not FieldByName('pptypeid').IsNull
              then mdPrices.FieldByName('pptypeid').AsInteger := FieldByName('pptypeid').AsInteger
              else mdPrices.FieldByName('pptypeid').AsInteger := 0;

            mdPrices.Post;
          end;

          Next;
        end;
        Close;

        // ************* loading images *****************
        ProviderName := 'Blobs_Get';
        FetchParams;
        Params.ParamByName('ownerid').AsInteger := Value;
        Params.ParamByName('ownertype').AsInteger := cfOwnerTypeProduct;
        Open;
        while not eof do
          try
            BlobStream := CreateBlobStream(FieldByName('data'), bmRead);

            if isPattern
              then i := apImgList1.AddFromStream(BlobStream) // set it as new
              else i := apImgList1.AddFromStream(BlobStream, FieldByName('id').asInteger);

            apImgList1.PostToWeb[i] := ((1 and FieldByName('userdata').asInteger) = 1);
            if ((2 and FieldByName('userdata').asInteger) = 2) then apImgList1.DefaultIndex := i;
            BlobStream.Free;
            Next;
          except
          end;
        Close;

        LoadWebShops;

        wwwTree.LoadData(Value);
        for i := 0 to wsGroupTrees.Count - 1
          do wsGroupTrees[i].LoadData(Value);

        if isPattern then begin
          wwwTree.ChangeOID(Value, 0); // mark it as new
          for i := 0 to wsGroupTrees.Count - 1
            do wsGroupTrees[i].ChangeOID(Value, -1); // mark it as new
        end;

        ProviderName := 'pMatPrices_Get';
        FetchParams;
        Params.ParamByName('matid').AsInteger := Value;
      end //if isProduct (product/Bundle)
      else begin
        ProviderName := 'pMatGroupPrices_Get';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := Value;
      end;

      Open;
      while not Eof do begin
        if mdPrices.Locate('ptypeid', FieldByName('ptypeid').AsInteger, []) then begin // ?need that?
          mdPrices.Edit;

          mdPrices.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          mdPrices.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
          mdPrices.FieldByName('currname').AsString := FieldByName('shortname').AsString;
          mdPrices.FieldByName('extratype').AsInteger := FieldByName('extratype').AsInteger;

          if not FieldByName('pptypeid').IsNull
            then mdPrices.FieldByName('pptypeid').AsInteger := FieldByName('pptypeid').AsInteger
            else mdPrices.FieldByName('pptypeid').AsInteger := 0;

          mdPrices.FieldByName('def').AsInteger := 0;
          mdPrices.FieldByName('src').AsInteger := 2;

          if FieldByName('dis').IsNull
            then mdPrices.FieldByName('en').AsInteger := 0
            else mdPrices.FieldByName('en').AsInteger := 1 - FieldByName('dis').AsInteger;

          mdPrices.FieldByName('withnds').AsInteger := FieldByName('withnds').AsInteger;

          if ShowPrices then
            with TcxTreeListNode(mdPrices.FieldByName('fnode').AsInteger) do begin
              Values[2] := 0;
              if not FieldByName('dis').IsNull and (FieldByName('dis').AsInteger = 1) then begin
                SelectedIndex := 88;
                ImageIndex := 88;
              end;
            end;

          mdPrices.Post;
        end; // if mdPrices.Locate('ptypeid', FieldByName('ptypeid').AsInteger, [])

        Next;
      end; // while not Eof

      Close;

      btnApply.Enabled := False;

      if not IsPattern then cbType.Enabled := False;
    end // if Value <> 0
    else begin
      if isProduct // groups are already processed above
        then LoadWebShops; // we still need that
    end;

    {$IFDEF GOLD}
    // getting colors/sizes list states
    sizesTree.LoadData(Value);
    if isPattern then sizesTree.ChangeOID(Value, 0); // mark it as new

    for i := 0 to clbGoldSizes.Count - 1 do begin // setting states in check-list box
      ctData := TapTreeNode(clbGoldSizes.Items.Objects[i]).FindData(Value);
      if nil <> ctData then clbGoldSizes.Checked[i] := ctData.asBoolean; // actually if it exists then it shouldn't be other than True
    end;

    {
    colorsTree.LoadData(Value);

    refreshGoldComboBox(clbGoldSizes);
    refreshGoldComboBox(clbGoldColors);
    }
    {$ENDIF}

  finally
    Free;
    PriceCanChange := True;
  end;

  {if not isProduct then begin // prod group - hiding some controls
  end;
  }

  FMCModified := False;
  MCCanChange := True;
  EdCanChange := False;

  Screen.Cursor := crDefault;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    GrpID, Num, i, j, wsid: Integer;
    FInfo: TGrpInfo;
    m, s: string;
    FNDS, FRate: Extended;
    BM: TBookmark;
    Fchb: TcxCheckBox;
    sl: TStringList;
    BinStream: TMemoryStream;
    tree: TapTree;
    node: TapTreeNode;
    apdata: TapTreeNodeData;
    ds: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormCloseQuery') else _udebug := nil;{$ENDIF}

  NewRecord := (ID = 0);
  GrpID := 0;

  ds := newDataSet;
  try //finally
    if FTreeSel <> nil then begin
      FTreeSel.Destroy;
      FTreeSel := nil;
    end;

    if not CanModify then Exit;

    if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;

      if not CheckPrices then Exit;

      if not BarcodesEnabled then begin  // prevent a 'barcode disabled' msg to be stored in DB
        edBarCode.Enabled := True;
        edBarCode.Text := '';
      end;

      (*
      {$IFDEF GOLD}
      if (cbGoldSize.ItemIndex < 1) then begin
        ssMessageDlg('Please choose the size on the appropriate page', ssmtError, [ssmbOK]);
        pcMain.ActivePage := tsGoldProps;
        Exit;
      end;
      {$ENDIF}
      *)

      // checking web data sanity
      if Fwwwnode <> nil then begin
        m := '';
        for i := 0 to FwwwNode.Count - 1 do begin // cycle through webshop main nodes
          s := '';
          wsid := FwwwNode.Items[i].Values[1]; // webshop ID
          node := wwwTree.FindFirst('Post');
          if (node.FindData(ID, wsid) = nil) or not node.FindData(ID, wsid).asBoolean then Continue;

          if wwwTree.FindFirst('PriceCategory').FindData(ID, wsid).asInteger = 0 then s := s + lWWWPriceCategory.Caption + ', ';

          for j := 0 to FwwwNode.Items[i].Count - 1 do begin // cycle through webshop language nodes
            // getting root node for this lang
            node := wwwTree.FindFirst(wsLangTree[FwwwNode.Items[i].Items[j].Values[2]].Items[0].name);
            // checking
            if node.FindFirst('Name').FindData(ID, wsid).asString = ''
              then s := s + FwwwNode.Items[i].Items[j].Values[0] + '/' + lWWWProdName.Caption + ', ';

            if node.FindFirst('Alias').FindData(ID, wsid).asString = ''
              then s := s + FwwwNode.Items[i].Items[j].Values[0] + '/' + lWWWAlias.Caption + ', ';

            if node.FindFirst('SDescr').FindData(ID, wsid).asString = ''
              then s := s + FwwwNode.Items[i].Items[j].Values[0] + '/' + lWWWShortDescr.Caption + ', ';

            if node.FindFirst('LDescr').FindData(ID, wsid).asString = ''
              then s := s + FwwwNode.Items[i].Items[j].Values[0] + '/' + lWWWDescr.Caption + ', ';
          end; // for j

          // checking if there is no categories selected
          if NewRecord
            then j := -1
            else j := FID;

          node := wsGroupTrees.byName(tree_wwwGroups + IntToStr(wsid)).FirstNode;
          while node <> nil do
            if (node.FindData(0, 0).asInteger = 0) and (nil <> node.FindData(j)) and (node.FindData(j).asBoolean)
              then Break
              else node := node.NextNode;

          if node = nil then s := s + tsWWWGroups.Caption + ', ';

          if s <> '' then begin
            num := length(s);
            if num > 2 then setlength(s, num - 2); // strip last delimiter
            m := m + FwwwNode.Values[0] + ': ' +  FwwwNode.Items[i].Values[0] + ' (' + s + ')';
          end;
        end; // for i

        if m <> '' then begin
          ssMessageDlg(format(rs(ParentNameEx, 'ws_data_bad'), [m]), ssmtError, [ssmbOK]);
          Exit;
        end;
      end; // if Fwwwnode <> nil

      fProgress.Show; // let's entertain the user ;)
      if Fwwwnode <> nil
        then fProgress.ProgressMain.Max := 3 + wsGroupTrees.Count
        else fProgress.ProgressMain.Max := 3;
      fProgress.ProgressMain.Position := 0;
      fProgress.Caption := 'Saving';
      fProgress.InfoText := 'Saving main data';

      //----------------------------------------
      TrStart;
      {$IFDEF UDEBUG}_udebug.CheckPoint('TrStart');{$ENDIF}
      //----------------------------------------

      with ds do
      try // except
        if isProduct then begin // product/bundle
          if NewRecord
            then ProviderName := 'pMaterials_CheckArtikul'
            else ProviderName := 'pMaterials_CheckArtikulEx';

          (*
          {$IFDEF GOLD}
          FetchMacros;
          try // in case of incorrect selection causing findfirst return nil
            Macros.ParamByName('w').asString :=
              'and cf2<>' + IntToStr(sizesTree.FindFirst(cbGoldSize.EditingText).ID)
              + ' and cf1<>' + IntTosTr(colorsTree.FindFirst(cbGoldColor.EditingText).ID);
          except
          end;
          {$ENDIF}
          *)

          FetchParams;
          Params.ParamByName('artikul').AsString := edArtikul.EditingText;
          if not NewRecord then Params.ParamByName('matid').AsInteger := FID;

          Open;
          if not IsEmpty then begin
            if mrYes <> ssMessageDlg(Format(rs(ParentNameEx, 'CheckArtikul'), [Fields[0].AsString]), ssmtWarning, [ssmbYes, ssmbNo])
            then begin
              Close;
              TrRollBack;
              Exit;
            end;
          end;
          Close;

          if NewRecord then FID := GetMaxID(dmData.SConnection, 'materials', 'matid');

          if NewRecord or (FGrpID <> lcbParent.Value) then begin
            ProviderName := 'pMaterials_MaxNum';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := lcbParent.Value;
            Open;
            Num := Fields[0].AsInteger + 1;
            Close;
          end
          else Num := OldNum;

          if IsPattern then begin
            ProviderName := 'pMaterials_UpdNumUp';
            FetchParams;
            Params.ParamByName('num').AsInteger := OldNum + 1;
            Params.ParamByName('grpid').AsInteger := lcbParent.Value;
            Execute;
          end;

          if IDs <> '' then begin // mass edit
            {$IFDEF UDEBUG}_udebug.CheckPoint('multiID data save');{$ENDIF}
            ProviderName := 'pSQL';
            Params.Clear;
            FetchMacros;
            m := 'update materials set ';

            if cbProducer.Tag = 1 then m := m + 'producer=''' + cbProducer.EditText + ''',';

            if lcbCountries.Tag = 1 then begin
              if lcbCountries.EditingText = ''
                then m := m + 'cid=null,'
                else m := m + 'cid=' + IntToStr(lcbCountries.KeyValue) + ',';
            end;

            if lcbWarehouse.Tag = 1 then begin
              if lcbWarehouse.EditingText = ''
                then m := m + 'wid=null,'
                else m := m + 'wid=' + IntToStr(lcbWarehouse.KeyValue) + ',';
            end;

            if cbDemandCat.Tag = 1 then begin
              if cbDemandCat.ItemIndex = -1
                //then m := m + 'wid=null,' // AP: WTF !????
                then m := m + 'demandcat=null,'
                else m := m + 'demandcat=' + IntToStr(cbDemandCat.ItemIndex) + ',';
            end;

            if lcbMeasure.Tag = 1  then m := m + 'mid=' + IntToStr(lcbMeasure.KeyValue) + ',';
            if edWeight.Tag = 1    then m := m + 'weight=' + FloatToStr(edWeight.Value) + ',';
            if edSize.Tag = 1      then m := m + 'msize=' + FloatToStr(edSize.Value) + ',';
            if edMinReserv.Tag = 1 then m := m + 'minreserv=' + FloatToStr(edMinReserv.Value) + ',';
            if edBarCode.Tag = 1   then m := m + 'barcode=''' + edBarCode.EditingText + ''',';
            if lcbParent.Tag = 1   then m := m + 'grpid=' + IntToStr(lcbParent.Value) + ',';

            if m[Length(m)] = ',' then System.Delete(m, Length(m), 1);

            m := m + ' where matid in (' + IDs + ')';

            Macros.ParamByName('sql').AsString := m;
            Execute;

          end // if IDs <> '' (mass edit)
          //-----------------------------------------------------------------------
          else begin
            {$IFDEF UDEBUG}_udebug.CheckPoint('main save');{$ENDIF}
            if NewRecord
              then ProviderName := 'pMaterials_Ins'
              else ProviderName := 'pMaterials_Upd';

            FetchParams;
            Params.ParamByName('matid').AsInteger := ID;
            Params.ParamByName('mid').AsInteger := lcbMeasure.KeyValue;
            Params.ParamByName('name').AsString := edName.Text;
            Params.ParamByName('notes').AsString := edNotes.Text;

            (*{$IFDEF GOLD}
            Params.ParamByName('artikul').AsString := edArtikul.EditingText
              + '_GOLD:' + cbGoldSize.EditingText + '/' + cbGoldColor.EditingText;
            {$ELSE}*)
            Params.ParamByName('artikul').AsString := edArtikul.EditingText;
            //{$ENDIF}

            Params.ParamByName('def').AsInteger := 0;//Integer(chbDefault.Checked);
            Params.ParamByName('deleted').AsInteger := 0;
            Params.ParamByName('weight').AsFloat := edWeight.Value;
            Params.ParamByName('msize').AsFloat := edSize.Value;
            Params.ParamByName('serials').AsInteger := Integer(chbSerials.Checked);
            FNDS := StrToFloat(edNDS.EditingText);

            if edNDS.Tag = 0 then begin
              if not SelfNDS then begin
                Params.ParamByName('nds').DataType := ftFloat;
                Params.ParamByName('nds').Clear;
              end
              else begin
                if not chbNDS.Checked
                  then Params.ParamByName('nds').AsFloat := -1
                  else Params.ParamByName('nds').AsFloat := FNDS;
              end;
            end
            else begin
              if not chbNDS.Checked
                then Params.ParamByName('nds').AsFloat := -1
                else Params.ParamByName('nds').AsFloat := FNDS;
            end;

            Params.ParamByName('msize').AsFloat := edSize.Value;
            Params.ParamByName('producer').AsString := cbProducer.Text;
            Params.ParamByName('barcode').AsString := edBarCode.Text;
            Params.ParamByName('minreserv').AsFloat := edMinReserv.Value;

            if cbDemandCat.EditText = '' then begin
              Params.ParamByName('demandcat').DataType := ftInteger;
              Params.ParamByName('demandcat').Clear;
            end
            else Params.ParamByName('demandcat').AsInteger := cbDemandCat.ItemIndex;

            if lcbCountries.EditText = '' then begin
              Params.ParamByName('cid').DataType := ftInteger;
              Params.ParamByName('cid').Clear;
            end
            else Params.ParamByName('cid').AsInteger := lcbCountries.KeyValue;

            //Params.ParamByName('currid').AsInteger := lcbCurrency.KeyValue;

            if IsPattern
              then Params.ParamByName('num').AsInteger := OldNum + 1
              else Params.ParamByName('num').AsInteger := Num;

            if lcbWarehouse.EditingText <> ''
             then Params.ParamByName('wid').AsInteger := lcbWarehouse.KeyValue
             else begin
               Params.ParamByName('wid').DataType := ftInteger;
               Params.ParamByName('wid').Clear;
             end;

            Params.ParamByName('grpid').AsInteger := lcbParent.Value;
            GrpID := lcbParent.Value;

            Params.ParamByName('typeid').asInteger := FTypeID;
            Params.ParamByName('labeldescr').asString := edLabelDescr.EditingText;
            Params.ParamByName('dateadded').AsDateTime := FDateAdded;
            Params.ParamByName('datemodified').AsDateTime := Now;

            // clearing all that. just in case;
            Params.ParamByName('cf1').DataType := ftInteger;
            Params.ParamByName('cf1').Clear;
            Params.ParamByName('cf2').DataType := ftInteger;
            Params.ParamByName('cf2').Clear;
            Params.ParamByName('cf3').DataType := ftInteger;
            Params.ParamByName('cf3').Clear;
            Params.ParamByName('cf4').DataType := ftInteger;
            Params.ParamByName('cf4').Clear;
            Params.ParamByName('cf5').DataType := ftInteger;
            Params.ParamByName('cf5').Clear;

            (*
            {$IFDEF GOLD}
            // saving this product selections
            if (cbGoldColor.ItemIndex > 0) and (cbGoldColor.EditingText <> '') then begin
              Params.ParamByName('cf1').AsInteger :=
                 colorsTree.FindFirst(cbGoldColor.EditingText).Id;
            end;

            if (cbGoldSize.ItemIndex > 0) and (cbGoldSize.EditingText <> '') then begin
              Params.ParamByName('cf2').AsInteger :=
                 sizesTree.FindFirst(cbGoldSize.EditingText).Id;
            end;
            {$ENDIF}
            *)

            Execute; // save product

            //---------------------------------------------------
            if FTypeID = prodTIDBundle then begin
              {$IFDEF UDEBUG}_udebug.CheckPoint('bundle save');{$ENDIF}
              ProviderName := 'pBundle_Del';
              FetchParams;
              Params.ParamByName('bundleid').AsInteger := FID;
              Execute;

              ProviderName := 'pBundle_Ins';
              FetchParams;
              Params.ParamByName('bundleid').AsInteger := FID;
              mdBundles.First;
              while not mdBundles.eof do begin
                case mdBundles.FieldByName('Type').asInteger of
                  bundleItemTypeProd: Params.ParamByName('itemType').AsInteger := 0;
                  bundleItemTypeSvc:  Params.ParamByName('itemType').AsInteger := 1;
                  else begin
                    mdBundles.Next;
                    Continue;// category item
                  end;
                end;

                Params.ParamByName('itemID').AsInteger := mdBundles.FieldByName('id').asInteger;
                Params.ParamByName('pos').AsInteger := mdBundles.FieldByName('pos').asInteger;

                Params.ParamByName('Quantity').AsFloat := mdBundles.FieldByName('Quantity').asFloat;
                Execute;

                mdBundles.Next;
              end;
            end; //if FTypeID = prodTIDBundle

            //-----------------------------------------------
            if NewRecord then ProductsTree.ChangeOID(0, FID); // setting owner ID to real
            ProductsTree.Save(True);
            ProductsTree.SaveData(-1, True);

            //-----------------------------------------------
            fProgress.ProgressMain.StepIt;
            fProgress.InfoText := 'Saving Main Web data';
            {$IFDEF UDEBUG}_udebug.CheckPoint('Saving Main Web data');{$ENDIF}

            if wwwTree <> nil then begin
              if NewRecord then begin
                wwwTree.ChangeOID(0, FID); // setting owner ID to real
                for i := 0 to wsGroupTrees.Count - 1 do wsGroupTrees[i].ChangeOID(-1, FID);
              end;

              wwwTree.SaveData(FID, True);
            end;

            fProgress.ProgressMain.StepIt;
            fProgress.InfoText := 'Saving web categories data';
            {$IFDEF UDEBUG}_udebug.CheckPoint('Saving web categories data');{$ENDIF}

            // clearing unused data items to speedup save and load
            for i := 0 to wsGroupTrees.Count - 1 do begin
              tree := wsGroupTrees[i];
              node := tree.FirstNode;

              while node <> nil do begin
                apdata := node.FindData(0, 0); // in case of broken tree
                if (apdata <> nil) and (apdata.asInteger <> 0) then begin // skipping master node
                  apdata := node.FindData(FID, -1);
                  if (apdata <> nil) and not apdata.asBoolean then apdata.Delete;
                end;

                node := node.NextNode;
              end; // while node <> nil

              tree.SaveData(FID, True);

              fProgress.ProgressMain.StepIt;
            end; // for i := 0 to wsGroupTrees.Count - 1

            {$IFDEF GOLD}
              // saving tree nodes and states
              {$IFDEF UDEBUG}_udebug.CheckPoint('golds data save');{$ENDIF}
              sizesTree.Save(True); // save nodes
              for i := 0 to clbGoldSizes.Count - 1 do begin
                node := TapTreeNode(clbGoldSizes.Items.Objects[i]);
                if clbGoldSizes.Checked[i]
                  then node.FindData(FID, -1, True).asBoolean := True // adding checked if needed
                  else if nil <> node.FindData(FID) then node.FindData(FID).Delete; // just mark for deletion for unchecked
              end;

              if NewRecord then sizesTree.ChangeOID(0, FID);
              sizesTree.SaveData(FID, True);

              //colorsTree.Save(True);
            {$ENDIF} // gold

            // ******** saving images **********
            fProgress.InfoText := 'Saving Images';
            {$IFDEF UDEBUG}_udebug.CheckPoint('images');{$ENDIF}

            for i := 0 to apImgList1.Count - 1 do begin
              if apImgList1.isDeleted[i] then begin
                if apImgList1.isNew[i] then Continue;

                ProviderName := 'Blobs_Del';
                FetchMacros;
                Macros.ParamByName('w').asString := 'id=' + IntTostr(apImgList1.ID[i]);
                Execute;

                Continue;
              end;

              // preparing blobs:userdata field value
              j := boolToInt(apImgList1.PostToWeb[i]);
              if i = apImgList1.DefaultIndex then inc(j,2);

              if apImgList1.isNew[i] then begin
                m := StreamToHexStr(apImgList1.Stream[i]);

                dmData.SConnection.AppServer.usr_WriteBlob(m, 0, 'blobs', 'data', 0, '' ,
                   'ownerid, ownertype, userdata', IntToStr(ID) + ',' + IntToStr(cfOwnerTypeProduct) + ',' + IntTostr(j));

                ProviderName := 'Blobs_Get_ID';
                FetchParams;
                Params.ParamByName('ownerid').AsInteger := ID;
                Params.ParamByName('ownertype').AsInteger := cfOwnerTypeProduct;
                Open;
                if not isEmpty then apImgList1.ID[i] := FieldByName('id').asInteger;
                Close;
              end
              else begin // existing image
                ProviderName := 'pSQL';
                FetchMacros;
                Macros.ParamByName('sql').asString := 'update blobs set userdata=' + IntTostr(j) + ' where id=' + IntTostr(apImgList1.ID[i]);
                Execute;
              end; // existing image
            end; // for i := 0 to apImgList1.Count - 1
          end; // if IDs <> '' else
        end //if isProduct - Product/Bundle
        //------------------------------------------------------------------------------------------------------
        else begin // group
          {$IFDEF UDEBUG}_udebug.CheckPoint('prod category main');{$ENDIF}
          if ID = 0 then FID := GetMaxID(dmData.SConnection, 'matgroup', 'grpid');

          if NewRecord
            then ProviderName := 'pMatGroup_Ins'
            else ProviderName := 'pMatGroup_Upd';

          FetchParams;
          Params.ParamByName('grpid').AsInteger := FID;

          if rbtParent.Checked and (lcbGrpParent.EditingText <> '')
            then Params.ParamByName('pid').AsInteger := lcbGrpParent.Value
            else Params.ParamByName('pid').AsInteger := FID;

          Params.ParamByName('name').AsString := edName.Text;

          if not chbNDS.Checked then begin
            Params.ParamByName('nds').AsFloat := -1;
          end
          else begin
            if edNDS.Tag = 0 then begin
              Params.ParamByName('nds').DataType := ftFloat;
              Params.ParamByName('nds').Clear;
            end
            else Params.ParamByName('nds').AsFloat := edNDS.Value;
          end;

          Execute;
        end; // it's a group

        //--------------------------------------------------------------------------
        if IDs = '' then begin // single item editing
          {$IFDEF UDEBUG}_udebug.CheckPoint('prices');{$ENDIF}
          if isProduct then begin
            ProviderName := 'pMatPrices_Del';
            FetchParams;
            Params.ParamByName('matid').AsInteger := FID;
          end
          else begin
            ProviderName := 'pMatGroupPrices_Del';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := FID;
          end;
          Execute;

          if isProduct then begin
            ProviderName := 'pMatPrices_Ins';
            FetchParams;
            Params.ParamByName('matid').AsInteger := FID;
          end
          else begin
            ProviderName := 'pMatGroupPrices_Ins';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := FID;
          end;

          BM := mdPrices.GetBookmark;

          mdPrices.First;
          while not mdPrices.Eof do begin
            if mdPrices.FieldByName('def').AsInteger = 0 then begin
              Params.ParamByName('ptypeid').AsInteger := mdPrices.FieldByName('ptypeid').AsInteger;
              Params.ParamByName('onvalue').AsFloat := mdPrices.FieldByName('onvalue').AsFloat;
              Params.ParamByName('extratype').AsInteger := mdPrices.FieldByName('extratype').AsInteger;

              if mdPrices.FieldByName('pptypeid').AsInteger > 0
                then Params.ParamByName('pptypeid').AsInteger := mdPrices.FieldByName('pptypeid').AsInteger
                else begin
                  Params.ParamByName('pptypeid').DataType := ftInteger;
                  Params.ParamByName('pptypeid').Clear;
                end;

              if Params.FindParam('withnds') <> nil
                then Params.ParamByName('withnds').AsInteger := mdPrices.FieldByName('withnds').AsInteger;

              // set 'disabled' flag
              Params.ParamByName('dis').AsInteger := (1 - mdPrices.FieldByName('en').AsInteger);

              if mdPrices.FieldByName('extratype').AsInteger in [priceType_Markup, priceType_PCExtra] then begin
                Params.ParamByName('currid').DataType := ftInteger;
                Params.ParamByName('currid').Clear;
              end
              else Params.ParamByName('currid').AsInteger := mdPrices.FieldByName('currid').AsInteger;

              Execute;
            end; // mdPrices.FieldByName('def').AsInteger = 0

            mdPrices.Next;
          end;

          mdPrices.GotoBookmark(BM);
          mdPrices.FreeBookmark(BM);

          //-------------------------------------------------------------
          if FMCModified then begin
            {$IFDEF UDEBUG}_udebug.CheckPoint('matchange');{$ENDIF}

            if not NewRecord then begin
              ProviderName := 'pMatChange_Del';
              FetchParams;
              Params.ParamByName('matid').AsInteger := FID;
              Params.ParamByName('changeid').AsInteger := FID;
              Execute;
            end;

            ProviderName := 'pMatChange_Ins';
            FetchParams;
            Params.ParamByName('matid').AsInteger := FID;

            mdMC.First;
            while not mdMC.Eof do begin
              Params.ParamByName('changeid').AsInteger := mdMC.FieldByName('matid').AsInteger;
              Params.ParamByName('notes').AsString := mdMC.FieldByName('notes').AsString;
              Execute;

              mdMC.Next;
            end;
          end; // if FMCModified

          //-------------------------------------------------------------
          if not NewRecord then begin
            {$IFDEF UDEBUG}_udebug.CheckPoint('taxes del');{$ENDIF}
            if isProduct
              then ProviderName := 'pMatTaxes_Del'
              else ProviderName := 'pMatGroupTaxes_Del';

            FetchParams;
            if isProduct
              then Params.ParamByName('matid').AsInteger := FID
              else Params.ParamByName('grpid').AsInteger := FID;

            Execute;
          end; // if not NewRecord

          //-------------------------------------------------------------
          if not isProduct then begin  // saving individual taxes
            {$IFDEF UDEBUG}_udebug.CheckPoint('taxes save');{$ENDIF}
            if isProduct
              then ProviderName := 'pMatTaxes_Ins'
              else ProviderName := 'pMatGroupTaxes_Ins';

            FetchParams;

            if isProduct
              then Params.ParamByName('matid').AsInteger := FID
              else Params.ParamByName('grpid').AsInteger := FID;

            cdsTaxes.First;
            while not cdsTaxes.Eof do begin
              Fchb := TcxCheckBox(cdsTaxes.FieldByName('chb').AsInteger);

              if (Fchb <> nil) and Fchb.Checked then begin
                Params.ParamByName('taxid').AsInteger := cdsTaxes.FieldByName('taxid').AsInteger;

                try
                  FRate := StrToFloat(TssCalcEdit(Fchb.Tag).EditingText);

                except
                  FRate := 0;
                end;

                Params.ParamByName('onvalue').AsFloat := FRate;
                Execute;
              end;

              cdsTaxes.Next;
            end;
          end; // if not isProduct

        end; // if IDs = '' (single-item edit)

        fProgress.ProgressMain.StepIt;
        fProgress.InfoText := 'Finishing';

        //----------------------------------------------------
        {$IFDEF UDEBUG}_udebug.CheckPoint('commiting');{$ENDIF}
        if not TrCommit(True) then TrRollBack;
        //----------------------------------------------------

        fProgress.ProgressMain.StepIt;
        fProgress.Hide;

        if FwwwNode <> nil then for i := 0 to wsGroupTrees.Count - 1 do wsGroupTrees[i].ClearData(FID, True); // free cache resources

        {$IFDEF UDEBUG}_udebug.CheckPoint('WM_REFRESH');{$ENDIF}
        if isProduct then begin
          try
            if IDs <> ''
              then SendMessage(MainHandle, WM_REFRESH, ID, 0)
              else SendMessage(MainHandle, WM_REFRESH, ID, GrpID + 10);

          except
          end;
        end // if isProduct
        else begin
          FInfo.ID := ID;

          if lcbGrpParent.EditingText <> ''
            then FInfo.PID := lcbGrpParent.Value
            else FInfo.PID := ID;

          SendMessage(MainHandle, WM_REFRESH, integer(@FInfo), -1);
          frmMainForm.ExecRefresh('WH', 0);

          //if (lcbGrpParent.EditingText <> '') and (lcbGrpParent.Value <> initialGroup) then // move the tree
          //     SendMessage(MainHandle, WM_ITEMMOVED, initialGroup, lcbGrpParent.Value);
        end; // if isProduct else (prod group)

        //-----------------------------------------------------------------------------------------

        //if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_MATERIALS);

        if ModalResult = mrYes then begin
          {$IFDEF UDEBUG}_udebug.CheckPoint('cleanup on apply');{$ENDIF}
          if NewRecord then begin
            tvMain.FocusedNode := tvMain.Items[0];

            if not IsPattern then begin
              edName.Text := '';
              edArtikul.Text := '';
              edNotes.Text := '';
              cbProducer.Text := '';
              edBarCode.Clear;
              edWeight.Value := 0;
              edSize.Value := 0;
              lcbCountries.KeyValue := 0;
              lcbCountries.Clear;
              cbDemandCat.ItemIndex := -1;
              edMinReserv.Value := 0;
              mdMC.Close;
              mdMC.Open;

              if FMatChangeNode <> nil then FMatChangeNode.DeleteChildren;

              GetPrices;
            end
            else OldNum := OldNum + 1;

            edName.SetFocus;
            FID := 0;
            
            if isProduct then DSRefresh(cdsParent, 'grpid', 0);
          end // if NewRecord
        end //if ModalResult = mrYes
        else CanClose := True;

        FModified := False;

      except
        on e: exception do begin
          TrRollback;
          raise;
          //MessageDlg(e.Message, mtError, [mbOk], 0);
        end;
      end;
    end // if ModalResult in [mrOK, mrYes]
    else CanClose := true;

  finally
    fProgress.Hide;
    ds.Free;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditMaterials.SetCaptions;
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aApply.Caption := GetRS('Common', 'Apply');
    aBundleDel.Caption := GetRS('Common', 'Del');
    aBundleAdd.Caption := GetRS('Common', 'Add');
    aBundleEdit.Caption := GetRS('Common', 'Properties');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aMCDel.Caption := GetRS('Common', 'Del');
    aMCNew.Caption := GetRS('Common', 'Add');
    aMCProps.Caption := GetRS('Common', 'Properties');
    aOK.Caption := GetRS('Common', 'OK');

    btnCopyArtikul.Hint := GetRS(ParentNameEx, 'CopyArtikulToName');
    btnCopyName.Hint := GetRS(ParentNameEx, 'CopyName');
    btnCountries.Hint := GetRS(ParentNameEx, 'CountryRef');
    btnDelIndNDS.Hint := GetRS(ParentNameEx, 'DelIndNDS');
    btnGrp.Hint := GetRS(ParentNameEx, 'RefMatGroup');
    btnGenBarCode.Hint := GetRS(ParentNameEx, 'btnGenBarCodeHint');
    btnMCLevelUp.Hint := GetRS('Common', 'LevelUp');
    btnMeasures.Hint := GetRS(ParentNameEx, 'RefMeasures');
    btnMove.Hint := GetRS('fmWaybill', 'MoveInfo');
    btnRsv.Hint := GetRS('fmWaybill', 'RsvInfo');
    btnWHouse.Hint := GetRS(ParentNameEx, 'RefWHouse');

    cbType.ItemIndex := 0;
    cbType.Properties.Items.Add(GetRS(ParentNameEx, 'Mat'));
    cbType.Properties.Items.Add(GetRS(ParentNameEx, 'MatGroup'));
    cbType.Properties.Items.Add(GetRS(ParentNameEx, 'Bundle'));
    
    chbDefineExtra.Properties.Caption := GetRS(ParentNameEx, 'DefineExtra');
    chbNDS.Properties.Caption := GetRS(ParentNameEx, 'MatNDS');
    chbSerials.Properties.Caption := GetRS(ParentNameEx, 'Serials');
    chbWithNDS.Properties.Caption := GetRS('fmWaybill', 'withNDS');
    colMCArtikul.Caption := GetRS(ParentNameEx, 'Artikul');
    colMCName.Caption := GetRS(ParentNameEx, 'MCName');
    colPTypeExtra.Caption := GetRS(ParentNameEx, 'ExtraDiscPrice');
    colPTypeName.Caption := GetRS(ParentNameEx, 'PriceType');
    gbAddInfo.Caption := ' ' + GetRS(ParentNameEx, 'AddInfo') + ' ';
    gbBundle.Caption := ' ' + GetRS(ParentNameEx, 'gbBundle') + ' ';
    gbMatChange.Caption := ' ' + GetRS(ParentNameEx, 'MatChange') + ' ';
    gbNotes.Caption := ' ' + GetRS(ParentNameEx, 'Notes') + ' ';
    gbTax.Caption := ' ' + GetRS(ParentNameEx, 'Tax') + ' ';
    gbWWW.Caption := ' ' + GetRS(ParentNameEx, 'WWW') + ' ';
    lArtikul.Caption := GetRS(ParentNameEx, 'Artikul') + ':';
    lBarCode.Caption := GetRS(ParentNameEx, 'BarCode') + ':';
    lCountry.Caption := GetRS(ParentNameEx, 'Country') + ':';
    lDemandCat.Caption := GetRS(ParentNameEx, 'DemandCat') + ':';
    lDiscText.Caption := GetRS('fmPriceTypes', 'DiscText') + ':';
    lGrpParent.Caption := GetRS(ParentNameEx, 'Group');
    lLabelDescr.Caption := GetRS(ParentNameEx, 'LabelDescr') + ':';
    lMCNotes.Caption := GetRS(ParentNameEx, 'Notes') + ':';
    lMeasure.Caption := GetRS(ParentNameEx, 'Measure') + ':';
    lMinReserv.Caption := GetRS(ParentNameEx, 'MinReserv') + ':';
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lNDS.Caption := GetRS(ParentNameEx, 'NDSRate') + ':';
    lParent.Caption := GetRS(ParentNameEx, 'SubordToGrp') + ':';
    lPrice.Caption := GetRS(ParentNameEx, 'Price');
    lProducer.Caption := GetRS(ParentNameEx, 'Producer') + ':';
    lSize.Caption := GetRS(ParentNameEx, 'Size') + ':';
    lSizeM.Caption := GetRS(ParentNameEx, 'SizeM');
    lTaxText.Caption := '';
    lType.Caption := GetRS(ParentNameEx, 'Type') + ':';
    lWarehouse.Caption := GetRS(ParentNameEx, 'Warehouse') + ':';
    lWeight.Caption := GetRS(ParentNameEx, 'Weight') + ':';
    lWeightM.Caption := GetRS(ParentNameEx, 'WeightM');
    rbtDisc.Caption := GetRS('fmPriceTypes', 'Discount');
    rbtExtra.Caption := GetRS(ParentNameEx, 'Extra');
    rbtKoef.Caption := GetRS(ParentNameEx, 'AutoExtra');
    rbtNoParent.Caption := GetRS(ParentNameEx, 'NoDepend');
    rbtParent.Caption := GetRS(ParentNameEx, 'GrpDepend');
    rbtPrice.Caption := GetRS(ParentNameEx, 'ManualExtra');
    tsMain.Caption := GetRS(ParentNameEx, 'PageMain');
    tsPrice.Caption := GetRS(ParentNameEx, 'PageCena');

    tsWWWMain.Caption := GetRS(ParentNameEx, 'tsWWWMain');
    tsWWWMarketing.Caption := GetRS(ParentNameEx, 'tsWWWMarketing');
    tsWWWGroups.Caption := GetRS(ParentNameEx, 'tsWWWGroups');
    gbWWWMainDescr.Caption := ' ' + GetRS(ParentNameEx, 'gbWWWMainDescr') + ' ';
    gbWWWMeta.Caption :=  ' ' + GetRS(ParentNameEx, 'gbWWWMeta') + ' ';

    lWWWGroups.Caption := GetRS(ParentNameEx, 'lWWWGroups');

    cbWWWPost.Properties.Caption := GetRS(ParentNameEx, 'cbWWWPost');
    cbWWWSpecial.Properties.Caption := GetRS(ParentNameEx, 'cbWWWSpecial');

    lWWWAlias.Caption := GetRS(ParentNameEx, 'lWWWAlias');
    cbWWWCustomAlias.Properties.Caption := GetRS(ParentNameEx, 'cbWWWCustomAlias');
    lWWWDetails.Caption := GetRS(ParentNameEx, 'lWWWDetails');
    lWWWProdName.Caption := GetRS(ParentNameEx, 'lWWWProdName');
    lWWWShortDescr.Caption := GetRS(ParentNameEx, 'lWWWShortDescr');
    lWWWDescr.Caption := GetRS(ParentNameEx, 'lWWWDescr');

    lWWWMetaTitle.Caption := GetRS(ParentNameEx, 'lWWWMetaTitle');
    lWWWMetaKeywords.Caption := GetRS(ParentNameEx, 'lWWWMetaKeywords');
    lWWWMetaDescr.Caption := GetRS(ParentNameEx, 'lWWWMetaDescr');

    lWWWPriceCategory.Caption := GetRS(ParentNameEx, 'lWWWPriceCategory');
    lWWWRetailPrice.Caption := GetRS(ParentNameEx, 'lWWWRetailPrice');

    butWWWcopyDown.Hint := GetRS(ParentNameEx, 'butWWWcopyDown');
    btnWWWCopyFromMain.Hint := GetRS(ParentNameEx, 'btnWWWCopyFromMain');

    edMCMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';
    if edMCMat.CurrentSearchIndex = 0
      then edMCMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    with cbDemandCat.Properties do begin
      Items.Clear;
      Items.Add(GetRS(ParentNameEx, 'AverageDemand'));
      Items.Add(GetRS(ParentNameEx, 'HighDemand'));
      Items.Add(GetRS(ParentNameEx, 'LowDemand'));
    end;

    with cbExtra do begin
      Properties.Items.Add(GetRS('fmMaterials', 'ExtraIn'));
      Properties.Items.Add(GetRS('fmMaterials', 'ExtraPT'));
      ItemIndex := 0;
    end;

    vlCustAttr.TitleCaptions[0] := GetRS(ParentNameEx, 'CustAttr_Key');
    vlCustAttr.TitleCaptions[1] := GetRS(ParentNameEx, 'CustAttr_Val');
    gbCustAttr.Caption := RS(ParentNameEx, 'gbCustAttr', 3);
    btnCAAdd.Caption := RS('', 'add');
    btnCADel.Caption := RS('', 'del');
    lCustAttr_SideNote.Caption := rs(ParentNameEx, 'CustAttr_SideNote');

    with tvMain do begin
      Clear;
      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'PageMain');
      FItem.Data := Pointer(0);
      FItem.SelectedIndex := 99;
      FItem.ImageIndex := 99;

      FItem := Add;
      FItem.Data := pointer(2);
      FItem.Values[0] := GetRS(ParentNameEx, 'PageCena');
      FItem.SelectedIndex := 82;
      FItem.ImageIndex := 82;
      FPricesNode := FItem;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'Tax');
      FItem.Data := Pointer(6);
      FItem.SelectedIndex := 179;
      FItem.ImageIndex := 179;

      GetPrices;

      FItem := Add;
      FItem.Data := pointer(4);
      FItem.Values[0] := GetRS(ParentNameEx, 'MatChange');
      FItem.SelectedIndex := 153;
      FItem.ImageIndex := 153;
      FMatChangeNode := FItem;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'Notes');
      FItem.Data := Pointer(3);
      FItem.SelectedIndex := 4;
      FItem.ImageIndex := 4;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'Images');
      FItem.Data := Pointer(7);
      FItem.SelectedIndex := 124;
      FItem.ImageIndex := 124;
      FimagesNode := FItem;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'CustAttr_ti');
      FItem.Data := Pointer(11);
      FItem.SelectedIndex := 154;
      FItem.ImageIndex := 154;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'WWW');
      FItem.Data := Pointer(8);
      FItem.SelectedIndex := 91;
      FItem.ImageIndex := 91;
      FwwwNode := FItem;

      {$IFDEF GOLD}
      FItem := Add;
      FItem.Values[0] := 'Colors/Sizes';
      FItem.Data := Pointer(9);
      FItem.SelectedIndex := 1;
      FItem.ImageIndex := 1;
      {$ENDIF}

      FocusedNode := Items[0];
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if isProduct then begin
    aOk.Enabled := (
      (
        ((Trim(edName.Text) <> '') and (Trim(edArtikul.Text) <> '') and (lcbMeasure.Text <> '') and (trim(lcbParent.EditingText) <> ''))
        or (IDs <> '')
      )
      and ((lcbCurrency.Text <> '') and FModified)
    ) or not CanModify;
  end
  else aOk.Enabled := (Trim(edName.Text) <> '') and FModified;

  aApply.Enabled := aOk.Enabled and FModified;

  aMCNew.Enabled := True;//CanModify;
  aMCProps.Enabled := not mdMC.IsEmpty and CanModify and (tvMain.FocusedNode.Parent <> FMatChangeNode);
  aMCDel.Enabled := not mdMC.IsEmpty and CanModify;

  if Trim(edName.Text) = ''
    then edName.Style.StyleController := dmData.scMainErr
    else edName.Style.StyleController := dmData.scMainOK;

  if Trim(edArtikul.Text) = ''
    then edArtikul.Style.StyleController := dmData.scMainErr
    else edArtikul.Style.StyleController := dmData.scMainOK;

  if lcbMeasure.Text = ''
    then lcbMeasure.Style.StyleController := dmData.scMainErr
    else lcbMeasure.Style.StyleController := dmData.scMainOK;

  if trim(lcbParent.EditingText) = ''
    then lcbParent.Style.StyleController := dmData.scMainErr
    else lcbParent.Style.StyleController := dmData.scMainOK;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.SetPriceType(AType: boolean);
  var
     ed: TssCalcEdit;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.SetPriceType') else _udebug := nil;{$ENDIF}

  if not chbDefineExtra.Checked then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  PriceCanChange := False;

  try
    rbtExtra.Enabled := AType and CanModify;
    cbExtra.Enabled := (rbtExtra.Checked and rbtExtra.Enabled);

    lcbPTExtra.Enabled := cbExtra.Enabled;

    rbtDisc.Enabled := Atype and Canmodify;
    lDiscText.Enabled := (rbtDisc.Checked and rbtDisc.Enabled);
    lcbPriceTypes.Enabled := lDiscText.Enabled;

    edKoef.Enabled := cbExtra.Enabled;
    edDisc.Enabled := lDiscText.Enabled;

    if rbtDisc.Checked then ed := edDisc else ed := edKoef;

    edPrice.Enabled := not AType and CanModify;
    lPrice.Enabled := not AType and CanModify;
    chbWithNDS.Enabled := edPrice.Enabled;
    lcbCurrency.Enabled := not AType and CanModify;

    lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraFromHere');

    with mdPrices do begin
      if IsEmpty or not PriceCanPost then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      Edit;
      FieldByName('def').AsInteger := 0;

      if AType then begin
        if ed.EditText = ''
          then FieldByName('onvalue').AsFloat := 0
          else FieldByName('onvalue').AsFloat := StrToFloat(ed.EditText);

        if cbExtra.ItemIndex = 0
          then FieldByName('extratype').AsInteger := 0
          else FieldByName('extratype').AsInteger := 2;

        if rbtExtra.Checked
          then begin
            if cbExtra.ItemIndex = 0
              then FieldByName('pptypeid').Clear
              else FieldByName('pptypeid').AsInteger := lcbPTExtra.KeyValue;
          end
          else FieldByName('pptypeid').AsInteger := lcbPriceTypes.KeyValue;
      end // Atype
      else begin

        if edPrice.EditText = ''
          then FieldByName('onvalue').AsFloat := 0
          else FieldByName('onvalue').AsFloat := StrToFloat(edPrice.EditText);

        FieldByName('extratype').AsInteger := 1;
        FieldByName('currid').AsInteger := lcbCurrency.KeyValue;
        FieldByName('currname').AsString := lcbCurrency.EditText;
        FieldByName('withnds').AsInteger := Integer(chbWithNDS.Checked);
        FieldByName('pptypeid').Clear;
      end;
      Post;
    end;

    FModified := True;

  finally
    PriceCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasurePropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasurePropertiesInitPopup') else _udebug := nil;{$ENDIF}

  lcbMeasure.Properties.DropDownWidth := edName.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cdsCurrencyAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cdsCurrencyAfterOpen') else _udebug := nil;{$ENDIF}

  if Dataset.Locate('def', 1, [])
    then lcbCurrency.KeyValue := Dataset.fieldbyname('currid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.rbtKoefClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.rbtKoefClick') else _udebug := nil;{$ENDIF}

  SetPriceType(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.rbtPriceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.rbtPriceClick') else _udebug := nil;{$ENDIF}

  SetPriceType(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aMInsExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aMInsExecute') else _udebug := nil;{$ENDIF}


  if FCurrRef = btnMeasures then begin
    try aid := lcbMeasure.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtMeasures, vtMeasures, 'TfmMeasures', Self.OnDate, aid);
  end
  else if FCurrRef = btnGrp then begin
    try aid := lcbParent.Value; except aid := 0; end;
    ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate, aid);
  end
  else if FCurrRef = btnWHouse then begin
    try aid := lcbWarehouse.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);
  end
  else if FCurrRef = btnCountries then begin
    try aid := lcbCountries.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtCountries, vtCountries, 'TfmCountries', Self.OnDate, aid);
  end
  else PostMessage(Self.ActiveControl.Handle, WM_COPY, 0, 0);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.sbAddMeasureClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.sbAddMeasureClick') else _udebug := nil;{$ENDIF}

  aMIns.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.WMRefresh') else _udebug := nil;{$ENDIF}

   case TRefType(M.LParam) of
    rtMeasures:
       begin
         DSRefresh(cdsMeasures, 'mid', M.WParam);
         lcbMeasure.KeyValue := M.WParam;
       end;

    rtCountries:
       begin
         DSRefresh(cdsCountries, 'cid', M.WParam);
         lcbCountries.KeyValue := 0;
         lcbCountries.KeyValue := M.WParam;
       end;

    rtWHouse:
       begin
         DSRefresh(cdsWarehouse, 'wid', M.WParam);
         lcbWarehouse.KeyValue := M.WParam;
       end;

    rtMat:
       begin
         FTmpMatID := M.WParam;
       end;

    rtMatGroup:
       begin
         DSRefresh(cdsParent, 'grpid', M.WParam);
         //lcbParent.InnerTree.Refresh;
         lcbParent.Value := M.WParam;
         lcbGrpParent.Value := M.WParam;
       end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}

  if tvMain.FocusedNode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  try
    pcMain.ActivePageIndex := Integer(tvMain.FocusedNode.Data);
  except
  end;

  if pcMain.ActivePage = tsPrice then gbExtra.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' '
  else if pcMain.ActivePage = tsPrices then gbExtras.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' '
  else if pcMain.ActivePage = tsMain
    then begin
      gbMainInfo.Caption := rs(ParentNameEx, 'MainInfo',3);

      if isProduct
        then gbMainInfo.Caption := gbMainInfo.Caption + rs(ParentNameEx, 'AboutMat',2)
        else gbMainInfo.Caption := gbMainInfo.Caption + rs(ParentNameEx, 'AboutGrp',2);
    end
  else if pcMain.ActivePage = tsWWW then begin
    if tvMain.FocusedNode = FwwwNode then begin
      Fwwwnode.Expand(True);
      tvMain.SetFocusedNode(FWWWnode.Items[0].Items[0], []); // select first webshop's first language node by default
    end;

    if VarIsNull(tvMain.FocusedNode.Values[2]) // wshop node. set focus to 1st lang node
      then begin
        tvMain.FocusedNode.Expand(True);
        tvMain.SetFocusedNode(tvMain.FocusedNode.Items[0], []);
      end;

    switchWebShop(tvMain.FocusedNode.Parent.Values[1])
  end;

  if tvMain.FocusedNode.Parent = FPricesNode then begin
    if not VarIsNull(tvMain.FocusedNode.Values[1])
      then mdPrices.Locate('ptypeid', tvMain.FocusedNode.Values[1], [])
  end
  else if tvMain.FocusedNode.Parent = FMatChangeNode
    then mdMC.Locate('fnode', Integer(tvMain.FocusedNode), []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.switchWebShop(const wsID: Integer); // switches current webshop view
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    node: TapTreeNode;
    d: TapTreeNodeData;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  gbWWW.Caption := ' ' + tvMain.FocusedNode.Parent.Values[0] + '/' + tvMain.FocusedNode.Values[0] + ' ';
  node := nil;

  with wwwTree do try // in case of non-existing data definition (that's OK)
    if nil = FindFirst('Post').FindData(FID, wsID) then begin // no data for this wshop yet. init the tree
      FindFirst('Post').FindData(FID, wsID, True).asInteger := 0;
    end;
    MakeData(FID, wsID); // silently creates data nodes if some are missing

    cbWWWPost.Tag := 1; // to not trigger onSomething
    cbWWWPost.Checked := FindFirst('Post').FindData(FID, wsID).asBoolean;
    cbWWWSpecial.Checked := FindFirst('isSpecial').FindData(FID, wsID).asBoolean;

    cbWWWCustomAlias.Checked := FindFirst('CustomAlias').FindData(FID, wsID).asBoolean;
    if cbWWWCustomAlias.Checked then edWWWAlias.EditingText := FindFirst('Alias').FindData(FID, wsID).asString;
    edWWWAlias.Enabled := cbWWWCustomAlias.Checked;

    cbWWWPriceCategory.ItemIndex := cbWWWPriceCategory.Properties.Items.IndexOfObject(pointer(FindFirst('PriceCategory').FindData(FID, wsID).asInteger));
    edWWWRetailPrice.EditingText := FindFirst('RetailPrice').FindData(FID, wsID).asString;

    node := FindFirst(wsLangTree[tvMain.FocusedNode.Values[2]].Items[0].name); // getting language root node

  except
  end; // with wwwTree do try

  if node <> nil
  then with node do try
    edWWWProdName.EditingText := FindFirst('Name').FindData(FID, wsID).asString;
    edWWWShortDescr.EditingText := FindFirst('SDescr').FindData(FID, wsID).asString;
    memoWWWDescr.Text := FindFirst('LDescr').FindData(FID, wsID).asString;
    memoWWWDetails.Text := FindFirst('Details').FindData(FID, wsID).asString;

    edWWWMEtaKeywords.EditingText := FindFirst('MKeyw').FindData(FID, wsID).asString;
    edWWWMetaTitle.EditingText := FindFirst('MTitle').FindData(FID, wsID).asString;
    memoWWWMETADescr.Text := FindFirst('MDescr').FindData(FID, wsID).asString;
  except
  end; // with node do try
  cbWWWPost.Tag := 0;

  wsGroups := wsGroupTrees.byName(tree_wwwGroups + IntToStr(wsID));
  MakeGroupsTree;
  edWWWEditChanged(edWWWProdName); // update alias if needed

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edNamePropertiesChange(Sender: TObject);
  var
    strTemp: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    i: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  if IDs = '' then panTitleBar.Caption := cbtype.EditingText + ': ' + edName.Text;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edArtikulPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edArtikulPropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasurePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasurePropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (lcbMeasure.Tag <> 1) and EdCanChange then begin
    lMeasure.Caption := lMeasure.Caption + ' *';
    lMeasure.Enabled := True;
    lcbMeasure.Tag := 1;
    DataModified(Sender);
  end;
  lMinM.Caption := lcbMeasure.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not edPrice.DroppedDown and not VarIsNull(edPrice.EditValue)
    then edPrice.Value := RoundToA(edPrice.EditValue, -2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCurrencyPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCurrencyPropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.SetGrpID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.SetGrpID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value <> 0 then begin
    rbtParent.Checked := True;
    lcbParent.Value := Value;
    lcbGrpParent.Value := Value;
  end
  else rbtNoParent.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehousePropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehousePropertiesInitPopup') else _udebug := nil;{$ENDIF}

  lcbWarehouse.Properties.DropDownWidth := lcbWarehouse.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cdsWarehouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cdsWarehouseBeforeOpen') else _udebug := nil;{$ENDIF}

  with cdsWarehouse do begin
    FetchMacros;
    Macros.ParamByName('m').AsString := WHAccessMacro;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cdsWarehouseAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cdsWarehouseAfterOpen') else _udebug := nil;{$ENDIF}

  if Dataset.Locate('def', 1, [])
    then lcbWarehouse.KeyValue := Dataset.fieldbyname('wid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aWInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aWInsExecute') else _udebug := nil;{$ENDIF}

  ShowModalByClass(Self, TfrmEditWHouse, 'TfmWhouse', 0, Integer(rtWHouse));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNotesKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift
  then case Key of
    VK_UP: tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;

    VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  btnGrp.ImageIndex := 23;
  btnGrpParent.ImageIndex := 23;
  btnMeasures.ImageIndex := 33;
  btnWHouse.ImageIndex := 26;
  btnCountries.ImageIndex := 34;

  try
    edName.SetFocus;
  except
  end;

  PriceCanPost := False;

  try
    chbDefineExtraClick(chbDefineExtra);
  finally
    PriceCanPost := True;
  end;

  tvMainSelectionChanged(tvMain);
  edNamePropertiesChange(edName);

  if not isProduct and not cbType.Enabled and Assigned(FMatChangeNode)
    then FreeAndNil(FMatChangeNode);

  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormKeyDown') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cdsMeasuresAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cdsMeasuresAfterOpen') else _udebug := nil;{$ENDIF}

  if Dataset.Locate('def', 1, [])
    then lcbMeasure.KeyValue := Dataset.fieldbyname('mid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNameKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
    case Key of
      VK_INSERT : showmessage('ctrl+ins');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasureEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasureEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnMeasures;

  if (IDs <> '') and (lcbMeasure.Tag = 0) then begin
    EdCanChange := False;

    if DefMID > 0 then lcbMeasure.KeyValue := DefMID;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasureExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasureExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  if (IDs <> '') and (lcbMeasure.Tag = 0) then begin
    EdCanChange := False;
    lcbMeasure.KeyValue := lcbMeasure.EmptyValue;
    lcbMeasure.Text := '';
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnMeasuresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnMeasuresMouseDown') else _udebug := nil;{$ENDIF}

  FCurrRef := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnMeasuresMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnMeasuresMouseUp') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnGrp;
  if (IDs <> '') and (lcbParent.Tag = 0) then begin
    EdCanChange := False;

    if DefGrpID > 0 then lcbParent.Value := DefGrpID;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehouseEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnWHouse;
  if (IDs <> '') and (lcbWarehouse.Tag = 0) then begin
    EdCanChange := False;

    if DefWID > 0 then lcbWarehouse.KeyValue := DefWID;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbTypePropertiesChange') else _udebug := nil;{$ENDIF}

  try //finally
    // ctype.itemindex only set for the new product or prod group creation or when editing the product group
    // so, for the existing product editing, the initial value is undefined (-1)
    if cbType.ItemIndex = -1 then begin
      cbType.ItemIndex := 0; // setting to the Product editing mode
      Exit;
    end;

    isProduct := (cbType.ItemIndex = -1) or (cbType.ItemIndex = 0) or (cbType.ItemIndex = 2); // prod or bundle

    lArtikul.Visible := isProduct;
    lMeasure.Visible := isProduct;
    lWarehouse.Visible := isProduct;
    btnCopyName.Visible := isProduct;
    btnCopyArtikul.Visible := isProduct;
    edArtikul.Visible := isProduct;
    lcbMeasure.Visible := isProduct;
    btnMeasures.Visible := isProduct;
    lcbWarehouse.Visible := isProduct;
    btnWHouse.Visible := isProduct;
    tvMainSelectionChanged(tvMain);
    gbAddInfo.Visible := isProduct;

    if isProduct
      then pcParent.ActivePage := tsMat
      else pcParent.ActivePage := tsGrp;

    chbDefineExtra.Enabled := true; //AP: for groups
    sbTax.Visible := not isProduct;

    PriceCanChange := False;
    try
      if mdPrices.IsEmpty or not PriceCanPost then Exit;

      mdPrices.Edit;
      mdPrices.FieldByName('en').AsInteger := 1;
      mdPrices.Post;

    finally
      PriceCanChange := True;
    end;

    edNamePropertiesChange(edName);

    if cbType.ItemIndex = 2 then begin // bundle
      if FbundleNode = nil then begin
        FTypeID := prodTIDBundle;
        FBundleNode := tvMain.Add;
        FBundleNode.Values[0] := RS(ParentNameEx, 'Bundle');
        FBundleNode.Data := Pointer(10);
        FBundleNode.SelectedIndex := 50;
        FBundleNode.ImageIndex := 50;
      end;
    end
    else begin
      if FBundleNode <> nil then FBundleNode.Destroy;

      FBundleNode := nil;
      FTypeID := prodTIDTangible;
    end;

    if not Self.Visible then Exit;

    if FMatChangeNode <> nil then begin
      if cbType.ItemIndex = 1 then begin
        FMatChangeNode.DeleteChildren;
        FMatChangeNode.Free;
        FMatChangeNode := nil;
        mdMC.Close;
        mdMC.Open;
      end
    end
    else begin
      FMatChangeNode := tvMain.Insert(tvMain.LastNode);
      FMatChangeNode.Data := pointer(4);
      FMatChangeNode.Values[0] := rs(ParentNameEx, 'MatChange');
      FMatChangeNode.SelectedIndex := 153;
      FMatChangeNode.ImageIndex := 153;
    end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfrmEditMaterials.aPricesPropsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aPricesPropsExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.aPricesDelExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aPricesDelExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.Change(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.Change') else _udebug := nil;{$ENDIF}

  rbtKoefClick(rbtKoef);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edPricePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edPricePropertiesChange') else _udebug := nil;{$ENDIF}

  rbtPriceClick(rbtPrice);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.srcPricesDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.srcPricesDataChange') else _udebug := nil;{$ENDIF}

  PriceCanPost := False;
  EdCanChange := False;

  try
    if PriceCanChange then
      with mdPrices do begin
        chbDefineExtra.Checked := (FieldByName('en').AsInteger = 1);

        if FieldByName('extratype').AsInteger = 2 then begin // percent of other category
          edKoef.Value := FieldByName('onvalue').AsFloat;
          edDisc.Value := 0;
          rbtExtra.Checked := True;
          cbExtra.ItemIndex := 1;
          lcbPTExtra.KeyValue := FieldByName('pptypeid').AsInteger;
        end

        else if FieldByName('extratype').AsInteger = 0 then begin  // percent of incoming price
          if FieldByName('pptypeid').AsInteger > 0 then begin
            edDisc.Value := FieldByName('onvalue').AsFloat;
            edKoef.Value := 0;
            rbtDisc.Checked := True;
            lcbPriceTypes.KeyValue := FieldByName('pptypeid').AsInteger;
          end

          else begin // fixed price
            edKoef.Value := FieldByName('onvalue').AsFloat;
            edDisc.Value := 0;
            cbExtra.ItemIndex := 0;
            rbtExtra.Checked := True;
          end;

          edPrice.Value := 0;
          rbtKoef.Checked := True;
          SetPriceType(True);

          if (IDs <> '') then begin
            if FieldByName('valuemodified').AsInteger = 0 then begin
              edKoef.Tag := 0;
              edKoef.Clear;
            end
            else begin
              edKoef.Tag := 1;
            end;
          end;

        end  //if FieldByName('extratype').AsInteger = 0
        else begin
          edPrice.Value := FieldByName('onvalue').AsFloat;
          chbWithNDS.Checked := (FieldByName('withnds').AsInteger = 1);
          edKoef.Value := 0;
          edDisc.Value := 0;
          rbtPrice.Checked := True;
          lcbCurrency.KeyValue := FieldByName('currid').AsInteger;
          SetPriceType(False);
        end;

        if FieldByName('en').AsInteger = 0
          then lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraDisabled')
          else
            case FieldByName('src').AsInteger of
              0: lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraFromRef');
              1: lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraFromGrp');
              2: lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraFromHere');
            end;
      end; //with mdPrices do begin

  finally
    PriceCanPost := True;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvMainCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
  // {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not VarIsNull(AViewInfo.Node.Values[2]) and (AViewInfo.Node.Values[2] = 1) and not AViewInfo.Selected
  then with ACanvas do begin
    Brush.Color := clWindow;
    FillRect(AViewInfo.ContentRect);
    Font.Color := clBtnShadow;
    DrawTexT(AViewInfo.Node.Values[0], AViewInfo.EditRect, DT_CENTER or DT_SINGLELINE);
    ADone := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.chbDefineExtraClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.chbDefineExtraClick') else _udebug := nil;{$ENDIF}

  if not chbDefineExtra.Checked then begin
    lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraDisabled');
    rbtKoef.Enabled := False;

    rbtExtra.Enabled := False;
    rbtDisc.Enabled := False;
    lcbPriceTypes.Enabled := False;
    lDiscText.Enabled := False;
    cbExtra.Enabled := False;
    lcbPTExtra.Enabled := False;
    edKoef.Enabled := False;
    edDisc.Enabled := False;

    rbtPrice.Enabled := False;
    lPrice.Enabled := False;
    edPrice.Enabled := False;
    chbWithNDS.Enabled := False;
    lcbCurrency.Enabled := False;

    if Integer(tvMain.FocusedNode.Data) = 1 then
      with tvMain.FocusedNode do begin
        ImageIndex := 88;
        SelectedIndex := 88;
        Values[2] := 1;
      end;

    GetImages;
  end
  else begin
    rbtKoef.Enabled := CanModify;
    rbtPrice.Enabled := CanModify;

    lPriceNotes.Caption := '* ' + rs(ParentNameEx, 'ExtraFromHere');

    SetPriceType(rbtKoef.Checked);

    if Integer(tvMain.FocusedNode.Data) = 1 then
      with tvMain.FocusedNode do begin
        ImageIndex := 41;
        SelectedIndex := 41;
        Values[2] := 0;
      end;
  end;

  if PriceCanPost then
    with mdPrices do begin
      PriceCanChange := False;

      try
        Edit;
        FieldByName('def').AsInteger := 0;
        FieldByName('en').AsInteger := Integer(chbDefineExtra.Checked);
        Post;

      finally
        PriceCanChange := True;
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tsPriceShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tsPriceShow') else _udebug := nil;{$ENDIF}

  rbtKoef.Enabled := not rbtKoef.Enabled;
  rbtKoef.Enabled := not rbtKoef.Enabled;
  rbtPrice.Enabled := not rbtPrice.Enabled;
  rbtPrice.Enabled := not rbtPrice.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.grdPricesDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.grdPricesDblClick') else _udebug := nil;{$ENDIF}

  if ShowPrices and (grdPrices.Count > 0) then tvMain.FocusedNode := TcxTreeListNode(mdPrices.FieldByName('fnode').AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.grdPricesCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  var
    bm: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.grdPricesCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected and (ANode.Values[colDef.Index] = 1) then AFont.Color := clBtnShadow;

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  if AColumn = colPTypeExtra then begin
    case Anode.Values[colPTypeType.Index] of
      0: if ShowPrices // percent of incoming price
           then AText := FloatToStr(Anode.Values[colPTypeExtra.Index]) + '% ' + rs(ParentNameEx, 'ExtraIn')
           else AText := rs('Common', 'NA');

      1: Atext := Atext + ' (' + rs(ParentNameEx, 'FixPrice') + ')';

      2: if ShowPrices then begin // percent of other category
           bm := cdsPriceTypes.GetBookmark;
           if cdsPriceTypes.Locate('ptypeid', VarToInt(Anode.Values[colPricesPPType.Index]), [])
             then AText := AText + '% ' + rs(ParentNameEx, 'ExtraPT', 1) + cdsPriceTypes.fieldByName('name').asString
             else AText := AText + '% ' + rs(ParentNameEx, 'ExtraPT') + ' ???';
           cdsPriceTypes.GotoBookmark(bm);
           cdsPriceTypes.FreeBookmark(bm);
         end
         else AText := rs('Common', 'NA');
    end; //case
  end; // if AColumn = colPTypeExtra

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.grdPricesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.grdPricesKeyDown') else _udebug := nil;{$ENDIF}

  if ssCtrl in Shift then
    case Key of
      VK_UP: tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
      VK_DOWN: tvMain.FocusedNode := tvMain.FocusedNode.GetNext;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.GetProducers;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.GetProducers') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pMat_GetProducers';
      Open;
      while not Eof do begin
        if FieldByName('producer').AsString <> '' then cbProducer.Properties.Items.Add(FieldByName('producer').AsString);
        Next;
      end;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCountriesEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCountriesEnter') else _udebug := nil;{$ENDIF}

  FCurrRef := btnCountries;

  if (IDs <> '') and (lcbCountries.Tag = 0) then begin
    EdCanChange := False;

    if DefCountry > 0 then lcbCountries.KeyValue := DefCountry;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnCopyNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnCopyNameClick') else _udebug := nil;{$ENDIF}

  if isProduct and (trim(edName.Text) <> '') then
    edArtikul.Text := Copy(trim(edName.Text), 1, 64{edArtikul.Properties.MaxLength});

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnCopyArtikulClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnCopyArtikulClick') else _udebug := nil;{$ENDIF}

  if edName.Text <> edArtikul.Text
    then edName.Text := edName.Text + ' ' + edArtikul.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cdsParentAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cdsParentAfterOpen') else _udebug := nil;{$ENDIF}

  lcbParent.Value := cdsParent.fieldbyname('grpid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.rbtParentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.rbtParentClick') else _udebug := nil;{$ENDIF}

  DataModified(Self);
  lGrpParent.Enabled := rbtParent.Checked;
  lcbGrpParent.Enabled := rbtParent.Checked;
  btnGrpParent.Enabled := rbtParent.Checked and cbType.Enabled;

  if rbtParent.Checked
    then lcbGrpParent.EditingText := OldGrp
    else begin
      lcbGrpParent.Properties.OnEditValueChanged := nil;
      lcbGrpParent.EditingText := '';
      lcbGrpParent.Properties.OnEditValueChanged := lcbGrpParentPropertiesEditValueChanged;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbGrpParentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbGrpParentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  OldGrp := lcbGrpParent.EditingText;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.SetCanModify(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.SetCanModify') else _udebug := nil;{$ENDIF}

  FCanModify := Value;

  btnOk.Left := btnApply.Left;

  aApply.Enabled := Value;
  aApply.Visible := Value;
  aCancel.Visible := Value;
  aMIns.Enabled := Value;
  btnCopyArtikul.Enabled := Value;
  btnCopyName.Enabled := Value;
  btnDelIndNDS.Enabled := Value;
  cbDemandCat.Enabled := Value;
  cbProducer.Enabled := Value;
  cbType.Enabled := Value;
  chbDefineExtra.Enabled := Value;
  chbNDS.Enabled := Value;
  chbSerials.Enabled := Value;
  chbWithNDS.Enabled := Value;
  edArtikul.Enabled := Value;
  edBarCode.Enabled := Value;
  edKoef.Enabled := Value;
  edMCMat.Enabled := Value;
  edMinReserv.Enabled := Value;
  edName.Enabled := Value;
  edNDS.Enabled := Value;
  edNotes.Enabled := Value;
  edPrice.Enabled := Value;
  edSize.Enabled := Value;
  edWeight.Enabled := Value;
  lcbCountries.Enabled := Value;
  lcbCurrency.Enabled := Value;
  lcbGrpParent.Enabled := Value;
  lcbMeasure.Enabled := Value;
  lcbParent.Enabled := Value;
  lcbWarehouse.Enabled := Value;
  lGrpParent.Enabled := Value;
  memMCNotes.Enabled := Value;
  rbtKoef.Enabled := Value;
  rbtNoParent.Enabled := Value;
  rbtParent.Enabled := Value;
  rbtPrice.Enabled := Value;

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.grdPricesColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.grdPricesColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aMCNewExecute(Sender: TObject);
  var
    FNode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aMCNewExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 0 then begin
    if CheckMC then begin
      FNode := tvMain.AddChild(FMatChangeNode);

      FMatChangeNode.Expand(False);
      FNode.ImageIndex := II_MAT;
      FNode.SelectedIndex := II_MAT;
      FNode.Values[0] := '';
      FNode.Data := Pointer(5);
      gbMC.Caption := ' ';
      tvMain.FocusedNode := FNode;
      edMCMat.Editor.SetFocus;
      mdMC.Append;
      mdMC.FieldByName('matid').AsInteger := 0;
      mdMC.FieldByName('fnode').AsInteger := Integer(FNode);
      mdMC.Post;
    end
    else ssMessageDlg(rs(ParentNameEx, 'EmptyMCError'), ssmtError, [ssmbOk]);
  end
  else grdMCDblClick(grdMC);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditMaterials.CheckMC: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.CheckMC') else _udebug := nil;{$ENDIF}

  Result := mdMC.IsEmpty or (mdMC.FieldByName('matid').AsInteger <> 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.grdMCDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.grdMCDblClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode.Expanded := True;
  tvMain.FocusedNode := Pointer(mdMC.FieldByName('fnode').AsInteger);

  if edMCMat.Enabled then edMCMat.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnMCMatClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnMCMatClick') else _udebug := nil;{$ENDIF}

  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, mdMC.fieldbyname('matid').AsInteger);

  edMCMat.MatID := FTmpMatID;
  if edMCMat.MatID > 0 then begin
    if MCCanPost
      then try
        MCCanChange := False;

        if FID = edMCMat.MatID then begin
          ssMessageDlg(rs(ParentNameEx, 'MCSameMat'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        if (mdMC.FieldByName('matid').AsInteger <> edMCMat.MatID) and LocateMC then begin
          ssMessageDlg(Format(rs(ParentNameEx, 'MCMatExists'), [edName.Text]), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        tvMain.FocusedNode.Values[0] := edMCMat.MatName;
        gbMC.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
        mdMC.Edit;
        mdMC.FieldByName('matid').AsInteger := edMCMat.MatID;
        mdMC.FieldByName('name').AsString := edMCMat.MatName;
        mdMC.FieldByName('artikul').AsString := edMCMat.Artikul;
        mdMC.Post;
        FMCModified := True;

      finally
        MCCanChange := True;
      end;

    FTmpMatID := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.srcMCDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.srcMCDataChange') else _udebug := nil;{$ENDIF}

  gbMC.Caption := ' ' + mdMC.FieldByName('name').AsString + ' ';

  if MCCanChange then
    try
      MCCanPost := False;
      edMCMat.MatID := mdMC.fieldbyname('matid').AsInteger;
      memMCNotes.Text := mdMC.fieldbyname('notes').AsString;

    finally
      MCCanPost := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnMCLevelUpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnMCLevelUpClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode := tvMain.FocusedNode.Parent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aMCDelExecute(Sender: TObject);
  var
    FNode: Pointer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aMCDelExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FNode := Pointer(mdMC.FieldByName('fnode').AsInteger);
  mdMC.Delete;

  if tvMain.FocusedNode = FNode then tvMain.FocusedNode := TcxTreeListNode(FNode).GetPrev;

  TcxTreeListNode(FNode).Free;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.memMCNotesPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.memMCNotesPropertiesChange') else _udebug := nil;{$ENDIF}

  if MCCanPost and not mdMC.IsEmpty then
    try
      MCCanChange := False;
      mdMC.Edit;
      mdMC.FieldByName('notes').AsString := memMCNotes.Text;
      mdMC.Post;
      DataModified(Sender);
      FMCModified := True;

    finally
      MCCanChange := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.GetPrices;
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.GetPrices') else _udebug := nil;{$ENDIF}

  PriceCanChange := False;
  try
    FPricesNode.DeleteChildren;
    mdPrices.Close;
    mdPrices.Open;
    cdsPriceType.First;

    while not cdsPriceType.Eof do begin
      FItem := nil;

      if ShowPrices then begin
        FItem := tvMain.AddChild(FPricesNode);
        FItem.Values[0] := cdsPriceType.FieldByName('name').AsString;
        FItem.Values[1] := cdsPriceType.FieldByName('ptypeid').AsInteger;
        FItem.Values[2] := 1;
        FItem.Data := pointer(1);
        FItem.SelectedIndex := 41;
        FItem.ImageIndex := 41;
      end;

      mdPrices.Append;
      mdPrices.FieldByName('fnode').AsInteger := Integer(FItem);
      mdPrices.FieldByName('def').AsInteger := 1;
      mdPrices.FieldByName('ptypeid').AsInteger := cdsPriceType.FieldByName('ptypeid').AsInteger;

      if cdsPriceType.FieldByName('extratype').AsInteger = 2
        then mdPrices.FieldByName('extratype').AsInteger := 2
        else mdPrices.FieldByName('extratype').AsInteger := 0;

      mdPrices.FieldByName('name').AsString := cdsPriceType.FieldByName('name').AsString;
      mdPrices.FieldByName('onvalue').AsFloat := cdsPriceType.FieldByName('onvalue').AsFloat;
      mdPrices.FieldByName('src').AsInteger := 0;
      mdPrices.FieldByName('en').AsInteger := 1;

      if not cdsPriceType.FieldByName('pptypeid').IsNull
        then mdPrices.FieldByName('pptypeid').AsInteger := cdsPriceType.FieldByName('pptypeid').AsInteger;

      cbWWWPriceCategory.Properties.Items.AddObject(
        cdsPriceType.FieldByName('name').asString, pointer(cdsPriceType.FieldByName('ptypeid').asInteger));

      mdPrices.Post;
      cdsPriceType.Next;
    end;

  finally
    PriceCanChange := True;
  end;
  FPricesNode.Expand(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.LoadWebShops;
  var
    ds: TssClientDataSet;
    FItem, lnode: TcxTreeListNode;
    nodeData: TapTreeNodeData;
    apt: TapTree;
    i, lc: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if FwwwNode = nil then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.LoadWebShops') else _udebug := nil;{$ENDIF}

  if isProduct then begin // Only for products/Bundles
    wwwTree := TapTree.Create(tree_wwwProps, cfOwnerTypeProduct);
    wsLangTree := TapTree.Create(tree_wwwLangs, cfOwnerTypeWebShop, -1); // load all shops states
    MakeWebProductTree(wwwTree, wslangTree); // see MetaProduct unit

    with newDataSet do
    try
      try
        ProviderName := 'pWebShops_List';
        Open;
        while not eof do begin
          FItem := tvMain.AddChild(FwwwNode);
          FItem.Values[0] := FieldByName('name').AsString;
          FItem.Values[1] := FieldByName('id').AsString;
          FItem.Data := Pointer(8);
          FItem.SelectedIndex := 91;
          FItem.ImageIndex := 91;

          // adding language nodes
          lc := 0; // counter. to strip off site with no langs selected
          for i := 0 to wsLangTree.Count - 1 do begin
            nodeData := wslangTree[i].FindData(FieldByName('id').asInteger, 0);
            if (nodeData = nil) or (nodeData.asInteger = 0) then Continue;

            lnode := FItem.AddChild;
            lnode.Values[0] := wsLangTree[i].Name;
            lnode.Values[1] := wsLangTree[i].NodeData;
            lnode.Values[2] := i;
            lnode.Data := Pointer(8);
            lnode.SelectedIndex := 91;
            lnode.ImageIndex := 91;
            inc(lc);
          end;

          if lc = 0 then begin // no langs - removing site from list
            FItem.DeleteChildren;
            FItem.Delete;
          end
          else begin
            apt := wsGroupTrees.byName(tree_wwwGroups + FItem.Values[1]);
            
            if apt = nil then apt := wsGroupTrees.Add(tree_wwwGroups + FItem.Values[1], cfOwnerTypeWebShop, 0);

            i := FixGroupsTree(apt, wslangTree);

            if i > 0 then begin
              ssMessageDlg(Format(rs(ParentNameEx, 'err_bad_cats'), [i, FieldByName('name').AsString]), ssmtError, [ssmbOK]);
              wsGroupTrees.Delete(apt.TreeID);
              FItem.DeleteChildren;
              FItem.Delete;
            end;
          end;

          Next;
        end;
        Close;

      except
      end;

    finally
      Free;
    end;
  end; //if isProduct

  if FwwwNode.Count = 0 then begin // removing from sight
    FwwwNode.Delete;
    FwwwNode := nil;
  end
  else FwwwNode.Expand(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMCMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMCMatChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);
  if edMCMat.MatID > 0 then begin
    if MCCanPost
      then try
        MCCanChange := False;

        if FID = edMCMat.MatID then begin
          ssMessageDlg(rs(ParentNameEx, 'MCSameMat'), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        if (mdMC.FieldByName('matid').AsInteger <> edMCMat.MatID) and LocateMC then begin
          ssMessageDlg(Format(rs(ParentNameEx, 'MCMatExists'), [edName.Text]), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        tvMain.FocusedNode.Values[0] := edMCMat.MatName;
        gbMC.Caption := ' ' + tvMain.FocusedNode.Values[0] + ' ';
        mdMC.Edit;
        mdMC.FieldByName('matid').AsInteger := edMCMat.MatID;
        mdMC.FieldByName('name').AsString := edMCMat.MatName;
        mdMC.FieldByName('artikul').AsString := edMCMat.Artikul;
        mdMC.Post;
        FMCModified := True;

      finally
        MCCanChange := True;
      end;

    FTmpMatID := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditMaterials.LocateMC: Boolean;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.LocateMC') else _udebug := nil;{$ENDIF}

  BM := mdMC.GetBookmark;
  mdMC.DisableControls;
  try
    Result := mdMC.Locate('matid', edMCMat.MatID, []);

  finally
    mdMC.GotoBookmark(BM);
    mdMC.FreeBookmark(BM);
    mdMC.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edMCMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormDestroy') else _udebug := nil;{$ENDIF}

  edMCMat.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.mdMCAfterDelete(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.mdMCAfterDelete') else _udebug := nil;{$ENDIF}

  FMCModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.SetIDs(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditMaterials.SetIDs') else _udebug := nil;{$ENDIF}

  inherited;

  if Value <> '' then begin
    lType.Enabled := False;
    edName.Enabled := False;
    edArtikul.Enabled := False;
    edName.Text := '';
    edArtikul.Text := '';
    panTitleBar.Caption := rs(ParentNameEx, 'TitleEdit') + ': <' + IntToStr(WordCount(Value, [','])) + ' ' + rs(ParentNameEx, 'MatREx') + '>';

    FMatChangeNode.Free;
    FPricesNode.Free;
    btnCopyName.Enabled := False;
    btnCopyArtikul.Enabled := False;
    lCountry.Enabled := False;
    lProducer.Enabled := False;
    lName.Enabled := False;
    lArtikul.Enabled := False;
    lcbCountries.KeyValue := lcbCountries.EmptyValue;
    lcbCountries.Clear;
    cbProducer.Clear;
    lcbMeasure.KeyValue := lcbMeasure.EmptyValue;
    lcbMeasure.Clear;
    lcbParent.Value := 0;
    lcbParent.Clear;
    lcbWarehouse.KeyValue := lcbWarehouse.EmptyValue;
    lcbWarehouse.Clear;
    edWeight.Clear;
    edSize.Clear;
    edMinReserv.Clear;
    edBarCode.Clear;
    cbDemandCat.Clear;
    chbSerials.Enabled := False;

    lParent.Enabled := False;
    lMeasure.Enabled := False;
    lWarehouse.Enabled := False;
    lWeight.Enabled := False;
    lWeightM.Enabled := False;
    lSize.Enabled := False;
    lSizeM.Enabled := False;
    lBarCode.Enabled := False;
    lDemandCat.Enabled := False;
    lMinReserv.Enabled := False;
    lMinM.Enabled := False;

    edCanChange := True;
    FModified := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCountriesPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCountriesPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (lcbCountries.Tag <> 1) and EdCanChange then begin
    lCountry.Caption := lCountry.Caption + ' *';
    lCountry.Enabled := True;
    lcbCountries.Tag := 1;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCountriesExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCountriesExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  if (IDs <> '') and (lcbCountries.Tag = 0) then begin
    EdCanChange := False;
    lcbCountries.KeyValue := lcbCountries.EmptyValue;
    lcbCountries.Text := '';
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCountriesKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCountriesKeyPress') else _udebug := nil;{$ENDIF}

  if (lcbCountries.Tag = 0) and (IDs <> '') and (Key = #13)
    then lcbCountriesPropertiesChange(lcbCountries)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbProducerEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbProducerEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (cbProducer.Tag = 0) then begin
    EdCanChange := False;
    if DefProducer <> '' then cbProducer.Text := DefProducer;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbProducerExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbProducerExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (cbProducer.Tag = 0) then begin
    EdCanChange := False;
    cbProducer.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbProducerKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbProducerKeyPress') else _udebug := nil;{$ENDIF}

  if (cbProducer.Tag = 0) and (IDs <> '') and (Key = #13)
    then cbProducerPropertiesChange(cbProducer)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbProducerPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbProducerPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (cbProducer.Tag <> 1) then begin
    if EdCanChange then begin
      lProducer.Caption := lProducer.Caption + ' *';
      lProducer.Enabled := True;
      cbProducer.Tag := 1;
      DataModified(Sender);
    end;
  end
  else DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbCountriesPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbCountriesPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (IDs = '') or (lcbCountries.Tag = 1) then DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasurePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasurePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (IDs = '') or (lcbMeasure.Tag = 1) then DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbMeasureKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbMeasureKeyPress') else _udebug := nil;{$ENDIF}

  if (lcbMeasure.Tag = 0) and (IDs <> '') and (Key = #13)
    then lcbMeasurePropertiesChange(lcbMeasure)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (lcbParent.Tag <> 1) and EdCanChange then begin
    lParent.Caption := lParent.Caption + ' *';
    lParent.Enabled := True;
    lcbParent.Tag := 1;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (IDs = '') or (lcbParent.Tag = 1) then DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentKeyPress') else _udebug := nil;{$ENDIF}

  if (lcbParent.Tag = 0) and (IDs <> '') and (Key = #13)
    then lcbParentPropertiesChange(lcbParent)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbParentExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbParentExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  if (IDs <> '') and (lcbParent.Tag = 0) then begin
    EdCanChange := False;
    lcbParent.Value := 0;
    lcbParent.Text := '';
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if FID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := Self.FID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if FID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := Self.FID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehousePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehousePropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (lcbWarehouse.Tag <> 1) and EdCanChange then begin
    lWarehouse.Caption := lWarehouse.Caption + ' *';
    lWarehouse.Enabled := True;
    lcbWarehouse.Tag := 1;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehousePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehousePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (IDs = '') or (lcbWarehouse.Tag = 1) then DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehouseKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehouseKeyPress') else _udebug := nil;{$ENDIF}

  if (lcbWarehouse.Tag = 0) and (IDs <> '') and (Key = #13)
    then lcbWarehousePropertiesChange(lcbWarehouse)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbWarehouseExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbWarehouseExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;

  if (IDs <> '') and (lcbWarehouse.Tag = 0) then begin
    EdCanChange := False;
    lcbWarehouse.KeyValue := lcbWarehouse.EmptyValue;
    lcbWarehouse.Text := '';
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edWeightPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edWeightPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edWeight.Tag <> 1) then begin
    if EdCanChange then begin
      lWeight.Caption := lWeight.Caption + ' *';
      lWeight.Enabled := True;
      edWeight.Tag := 1;
      DataModified(Sender);
    end
  end
  else DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edWeightKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edWeightKeyPress') else _udebug := nil;{$ENDIF}

  if (edWeight.Tag = 0) and (IDs <> '') and (Key = #13)
    then edWeightPropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edWeightEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edWeightEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edWeight.Tag = 0) then begin
    EdCanChange := False;

    if DefWeight <> 0 then edWeight.Value := DefWeight;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edWeightExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edWeightExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edWeight.Tag = 0) then begin
    EdCanChange := False;
    edWeight.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edSizePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edSizePropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edSize.Tag <> 1) then begin
    if EdCanChange then begin
      lSize.Caption := lSize.Caption + ' *';
      lSize.Enabled := True;
      edSize.Tag := 1;
      DataModified(Sender);
    end
  end
  else DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edSizeKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edSizeKeyPress') else _udebug := nil;{$ENDIF}

  if (edSize.Tag = 0) and (IDs <> '') and (Key = #13)
    then edSizePropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edSizeEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edSizeEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edSize.Tag = 0) then begin
    EdCanChange := False;

    if DefSize <> 0 then edSize.Value := DefSize;

    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edSizeExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edSizeExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (TComponent(Sender).Tag = 0) then begin
    EdCanChange := False;
    edSize.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMinReservPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMinReservPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edMinReserv.Tag <> 1) then begin
    if EdCanChange then begin
      lMinReserv.Caption := lMinReserv.Caption + ' *';
      lMinReserv.Enabled := True;
      edMinReserv.Tag := 1;
      DataModified(Sender);
    end
  end
  else DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMinReservKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMinReservKeyPress') else _udebug := nil;{$ENDIF}

  if (edMinReserv.Tag = 0) and (IDs <> '') and (Key = #13)
    then edMinReservPropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMinReservEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMinReservEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edMinReserv.Tag = 0) then begin
    EdCanChange := False;
    if DefMinReserv <> 0 then edMinReserv.Value := DefMinReserv;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edMinReservExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edMinReservExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (TComponent(Sender).Tag = 0) then begin
    EdCanChange := False;
    edMinReserv.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edBarCodePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edBarCodePropertiesChange') else _udebug := nil;{$ENDIF}

  if BarcodesEnabled then begin
    if (IDs <> '') and (edBarCode.Tag <> 1) then begin
      if EdCanChange then begin
        lBarCode.Caption := lBarCode.Caption + ' *';
        lBarCode.Enabled := True;
        edBarCode.Tag := 1;
        DataModified(Sender);
      end
    end
    else DataModified(Sender);

    if edBarCode.Text = '' then begin
      bcMain.ErrorText := rs('fmMaterials', 'BarCodeNA');
      bcMain.ErrorTextColor := clWindowText;
    end
    else begin
      bcMain.ErrorText := rs('fmMaterials', 'BarCodeErr');
      bcMain.ErrorTextColor := clRed;
    end;

    bcMain.Visible := (trim(edBarCode.Text) <> '');

    bcMain.BarCode := edBarCode.Text;
  end
  else begin // without barcodes
    edBarCode.Text := rs('fmMaterials','BarCodeDis');
    edBarcode.Style.Font.Color := clRed;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edBarCodeKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edBarCodeKeyPress') else _udebug := nil;{$ENDIF}

  if (edBarCode.Tag = 0) and (IDs <> '') and (Key = #13)
    then edBarCodePropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edBarCodeEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edBarCodeEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edBarCode.Tag = 0) then begin
    EdCanChange := False;
    if DefBarCode <> '' then edBarCode.Text := DefBarCode;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edBarCodeExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edBarCodeExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edBarCode.Tag = 0) then begin
    EdCanChange := False;
    edBarCode.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbDemandCatPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbDemandCatPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (cbDemandCat.Tag <> 1) and EdCanChange then begin
    lDemandCat.Caption := lDemandCat.Caption + ' *';
    lDemandCat.Enabled := True;
    cbDemandCat.Tag := 1;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbDemandCatPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbDemandCatPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if (IDs = '') or (cbDemandCat.Tag = 1) then DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbDemandCatKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbDemandCatKeyPress') else _udebug := nil;{$ENDIF}

  if (cbDemandCat.Tag = 0) and (IDs <> '') and (Key = #13)
    then cbDemandCatPropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbDemandCatEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbDemandCatEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (cbDemandCat.Tag = 0) then begin
    EdCanChange := False;
    if DefDemandCat <> -1 then cbDemandCat.ItemIndex := DefDemandCat;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbDemandCatExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbDemandCatExit') else _udebug := nil;{$ENDIF}

  FCurrRef := nil;
  if (IDs <> '') and (cbDemandCat.Tag = 0) then begin
    EdCanChange := False;
    cbDemandCat.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edKoefPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edKoefPropertiesChange') else _udebug := nil;{$ENDIF}

  if (IDs <> '') then begin
    if (edKoef.Tag <> 1) and EdCanChange then begin
      edKoef.Tag := 1;
      PriceCanChange := False;

      try
        mdPrices.Edit;
        mdPrices.FieldByName('valuemodified').AsInteger := 1;
        mdPrices.Post;

      finally
        PriceCanChange := True;
      end;

      rbtKoefClick(rbtKoef);
    end;
  end
  else rbtKoefClick(rbtKoef);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edKoefKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edKoefKeyPress') else _udebug := nil;{$ENDIF}

  if (edKoef.Tag = 0) and (IDs <> '') and (Key = #13)
    then edKoefPropertiesChange(Sender)
    else GoNext(Sender, Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edKoefEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edKoefEnter') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edKoef.Tag = 0) then begin
    EdCanChange := False;
    edKoef.Value := mdPrices.FieldByName('onvalue').AsFloat;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edKoefExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edKoefExit') else _udebug := nil;{$ENDIF}

  if (IDs <> '') and (edKoef.Tag = 0) then begin
    EdCanChange := False;
    edKoef.Clear;
    EdCanChange := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.chbNDSClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.chbNDSClick') else _udebug := nil;{$ENDIF}

  lNDS.Enabled := chbNDS.Checked;
  edNDS.Enabled := chbNDS.Checked;
  btnDelIndNDS.Enabled := chbNDS.Checked;

  if not chbNDS.Checked
    then begin
      if isProduct
        then lTaxText.Caption := '* ' + rs(ParentNameEx, 'NoNDS')
        else lTaxText.Caption := '* ' + rs(ParentNameEx, 'NoNDSGrp');
    end
    else begin
      if edNDS.Tag = 0 then begin
        if FNDSGrpName = ''
          then lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromOptions')
          else lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromGrp') + ' "' + FNDSGrpName + '"';
      end
      else lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSInd');
    end;

  edNDS.Tag := 1;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}

  if Self.Visible then begin
    lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSInd');
    edNDS.Tag := 1;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnDelIndNDSClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnDelIndNDSClick') else _udebug := nil;{$ENDIF}

  if FNDSGrpName = '' then begin
    chbNDS.Checked := True;
    edNDS.Value := NDS;
    lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromOptions');
  end
  else begin
    chbNDS.Checked := FNDSGrpValue <> -1;
    edNDS.Value := FNDSGrpValue;
    lTaxText.Caption := '* ' + rs(ParentNameEx, 'NDSFromGrp') + ' "' + FNDSGrpName + '"';
  end;

  edNDS.Tag := 0;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edNotesPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edNotesPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.chbSerialsClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.chbSerialsClick') else _udebug := nil;{$ENDIF}

  if chbSerials.Checked
    then edMinReserv.DecimalPlaces := 0
    else edMinReserv.DecimalPlaces := 3;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.rbtExtraClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.rbtExtraClick') else _udebug := nil;{$ENDIF}

  SetPriceType(True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.GetImages;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.GetImages') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.lcbPriceTypesPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.lcbPriceTypesPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  rbtExtraClick(rbtExtra);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditMaterials.CheckPrices: Boolean;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.CheckPrices') else _udebug := nil;{$ENDIF}

  Result := False;
  PriceCanChange := False;

  with mdPrices do begin
    BM := GetBookmark;

    try
      First;

      while not Eof do begin
        if (FieldByName('def').AsInteger = 0) and (FieldByName('ptypeid').AsInteger = FieldByName('pptypeid').AsInteger)
        then begin
          ssMessageDlg(Format(rs('fmMaterials', 'WrongPType'), [FieldByName('name').AsString]), ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        Next;
      end;

      Result := True;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      PriceCanChange := True;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.GetTaxes;
  var
    Fchb: TcxCheckBox;
    Fed: TssCalcEdit;
    FYOffs: Integer;
    Fl: TssLabel;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.GetTaxes') else _udebug := nil;{$ENDIF}

  with cdsTaxes do
  try
    Close;
    Open;

    FYOffs := 0;

    while not Eof do begin
      Fchb := TcxCheckBox.Create(Self);
      Fchb.Name := 'chbTax' + FieldByName('taxid').AsString;
      Fchb.Properties.Caption := FieldByName('name').AsString;
      Fchb.Style.StyleController := dmData.scMain;
      Fchb.Parent := sbTax;
      //Fchb.Style.Font.Style := [];
      Fchb.Top := FYOffs;
      Fchb.Width := 300;
      Fchb.OnKeyPress := GoNext;
      Fchb.OnKeyDown := GoNextKeyDown;
      Fchb.Properties.OnChange := DataModified;
      Fchb.OnClick := chbTaxClick;
      Edit;
      FieldByName('chb').AsInteger := Integer(Fchb);
      Post;

      Fed := TssCalcEdit.Create(Self);
      Fchb.Name := 'edTax' + FieldByName('taxid').AsString;
      Fed.Enabled := False;
      Fed.Parent := sbTax;
      Fed.Top := FYOffs;
      Fed.Width := 70;
      Fed.Left := Fchb.Width + 5;
      Fed.Style.StyleController := dmData.scMain;
      //Fed.Style.Font.Style := [];
      Fed.OnKeyPress := GoNext;
      Fed.OnKeyDown := GoNextKeyDown;
      Fed.Properties.OnChange := DataModified;
      Fed.Value := FieldByName('onvalue').AsFloat;
      Fchb.Tag := Integer(Fed);

      Fl := TssLabel.Create(Self);
      Fl.Parent := sbTax;
      Fl.Caption := '%';
      Fl.Left := Fed.Left + Fed.Width + 2;
      Fl.Top := FYOffs + 4;
      //Fl.Font.Style := [];
      Fl.DisabledDraw := ddUser;
      Fl.DisabledColor := clBtnShadow;
      Fl.Enabled := False;
      Fed.Tag := Integer(Fl);

      Next;

      Inc(FYOffs, 26);
    end;

  finally
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.chbTaxClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.chbTaxClick') else _udebug := nil;{$ENDIF}

  TssCalcEdit((Sender as TcxCheckBox).Tag).Enabled := (Sender as TcxCheckBox).Checked;
  TssLabel(TssCalcEdit((Sender as TcxCheckBox).Tag).Tag).Enabled := (Sender as TcxCheckBox).Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.cbExtraPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbExtraPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  lcbPTExtra.Visible := cbExtra.ItemIndex = 1;
  rbtExtraClick(rbtExtra);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.splMainMoved(Sender: TObject);
begin
  inherited;
  tvMain.Repaint;
end;

//==============================================================================================
procedure TfrmEditMaterials.FormResize(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.FormResize') else _udebug := nil;{$ENDIF}

  inherited;

  for i := 0 to tvBundles.ColumnCount - 1 do begin
    if not tvBundles.Columns[i].Visible then Continue;

    if (tvBundles.Columns[i] = tvBundlesName) or (tvBundles.Columns[i] = tvBundlesModel)
      then tvBundles.Columns[i].Width := tvBundles.Width div 4
      else tvBundles.Columns[i].Width := tvBundles.Width div 4;
  end;

  tvBundles.Repaint;
  //tvMain.Repaint;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.miGoldAddAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  {$IFDEF GOLD}
  var
    clb: TCheckListBox;
    s: String;
    ctnode: TapTreeNode;
    ctData: TapTreeNodeData;
    tree: TapTree;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFDEF GOLD}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.miGoldAddAcceptText') else _udebug := nil;{$ENDIF}

  inherited;
  Accept := False;

  s := trim(NewText);
  if s = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;;

  if pmGoldSizeColor.Tag = 1
    then begin clb := ClbGoldSizes;  tree := sizesTree; end
    else begin clb := clbGoldcolors; tree := colorsTree; end;

  if clb.Items.IndexOfName(s) <> -1 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;; //duplicate name

  ctNode := TapTreeNode.Create(s, tree);
  ctNode.Save(False);
  {ctData := TapTreeNodeData.Create(ctnode);
  ctData.asInteger := 0;
  }

  clb.AddItem(s, ctNode);

  refreshGoldComboBox(clb);
  DataModified(Sender);
  Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.miGoldEditAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  {$IFDEF GOLD}
  var
    clb: TCheckListBox;
    ch: TStringList;
    s: String;
    tree: TapTree;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFDEF GOLD}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.miGoldEditAcceptText') else _udebug := nil;{$ENDIF}

  inherited;

  Accept := False;

  s := trim(NewText);
  if s = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;;

  if pmGoldSizeColor.Tag = 1
    then begin clb := ClbGoldSizes;  tree := sizesTree; end
    else begin clb := clbGoldcolors; tree := colorsTree; end;

  if clb.Items.IndexOfName(s) <> -1 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;; //duplicate name

  clb.Items[clb.ItemIndex] := s;

  TapTreeNode(clb.Items.Objects[clb.ItemIndex]).Name := s;
  TapTreeNode(clb.Items.Objects[clb.ItemIndex]).Save(False);

  refreshGoldComboBox(clb);
  DataModified(Sender);
  Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.refreshGoldComboBox(clb: TCheckListBox);
  {$IFDEF GOLD}
  var
    cb: TcxComboBox;
    s: String;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFDEF GOLD}
  if clb = ClbGoldSizes
    then Exit //cb := cbGoldSize
    else cb := cbGoldColor;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.refreshGoldComboBox') else _udebug := nil;{$ENDIF}

  s := cb.EditingText;
  cb.Properties.Items.BeginUpdate;
  cb.Properties.Items.Clear;
  cb.Properties.items.Add('');
  for i := 0 to clb.Items.Count - 1 do
    {if clb.Checked[i] then }cb.Properties.items.Add(clb.Items[i]);
  cb.itemIndex := cb.Properties.Items.IndexOf(s);
  cb.Properties.Items.EndUpdate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.clbGoldSizesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF GOLD}
  var
    clb: TCheckListBox;
    APoint: TPoint;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFDEF GOLD}
  if Button <> mbRight then begin
    inherited;
    Exit;
  end;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.clbGoldSizesMouseDown') else _udebug := nil;{$ENDIF}

  Apoint.x := x; apoint.y := y;
  clb := Sender as TCheckListBox;
  i := clb.ItemAtPos(Apoint, True);

  if i = -1
    then miGoldEdit.Enabled := False
    else begin
      clb.ItemIndex := i;  // making it selected
      miGoldEdit.Enabled := True;
      miGoldEdit.Text := clb.Items[clb.ItemIndex];
    end;

  pmGoldSizeColor.Tag := integer(Sender = clbGoldSizes); // setting mark which checklistbox will be edited

  if clb = clbGoldColors
    then miGoldHeader.Caption := 'Colors                                        '
    else miGoldHeader.Caption := 'Sizes                                         ';

  pmGoldSizeColor.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.clbGoldSizesClickCheck(Sender: TObject);
  (*
  {$IFDEF GOLD}
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
  *)
begin
  (*
  {$IFDEF GOLD}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.clbGoldSizesClickCheck') else _udebug := nil;{$ENDIF}

  // fuck these checkboxes for now ;)
  for i := 0 to (Sender as TCheckListBox).Count - 1 do
    (Sender as TCheckListBox).Checked[i] := False;
  refreshGoldComboBox(pointer(Sender));
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.cbGoldSizePropertiesChange(Sender: TObject);
  {$IFDEF GOLD}
  var
    cb: TcxComboBox;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFDEF GOLD}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.cbGoldSizePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  cb := (Sender as TcxComboBox);

  if cb.Properties.Items.IndexOf(cb.Text) = -1 then begin
    cb.SelectAll;
    cb.Style.Font.Style := [fsBold];
    cb.Style.Font.color := clRed;
    cb.clearSelection;
    beep;
    cb.ItemIndex := 0;
    cb.Clear;
  end;
  cb.Style.Font.Style := [];
  cb.Style.Font.color := clWindowText;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.edWWWEditChanged(Sender: TObject);
  var
    WebID : Integer;
    node: TapTreeNode;
    s: String;
    i,l: Integer;
    re: TRegExpr;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  inherited;
  if cbWWWPost.Tag = 1 then Exit; // data loading in progress

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.edWWWEditChanged') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  WebID := tvMain.FocusedNode.Parent.Values[1];

  with wwwTree do begin
    if Sender = cbWWWPost
      then begin
        wwwTree.FindFirst('Post').FindData(FID, WebID).asInteger := BoolToInt(cbWWWPost.Checked);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end

    else if Sender = cbWWWSpecial
      then begin
        wwwTree.FindFirst('isSpecial').FindData(FID, WebID).asBoolean := cbWWWSpecial.Checked;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end

    else if Sender = cbWWWPriceCategory
      then begin
        wwwTree.FindFirst('PriceCategory').FindData(FID, WebID).asInteger :=
          Integer(cbWWWPriceCategory.Properties.Items.Objects[cbWWWPriceCategory.ItemIndex]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end

    else if Sender = edWWWRetailPrice
      then begin
        wwwTree.FindFirst('RetailPrice').FindData(FID, WebID).asString := edWWWRetailPrice.EditingText;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    node := FindFirst(wsLangTree[tvMain.FocusedNode.Values[2]].Items[0].name); // getting language root node
  end; //with wwwTree

  // looking for language-specific items
  with node do begin
    if Sender = edWWWMEtaKeywords
      then FindFirst('MKeyw').FindData(FID, WebID).asString := edWWWMEtaKeywords.EditingText
    else if Sender = edWWWMetaTitle
      then FindFirst('MTitle').FindData(FID, WebID).asString := edWWWMetaTitle.EditingText
    else if Sender = memoWWWMETADescr
      then FindFirst('MDescr').FindData(FID, WebID).asString := memoWWWMETADescr.Text

    else if Sender = edWWWAlias
      then FindFirst('Alias').FindData(FID, WebID).asString := edWWWAlias.EditingText

    else if Sender = cbWWWCustomAlias
      then begin
        FindFirst('CustomAlias').FindData(FID, WebID).asBoolean := cbWWWCustomAlias.Checked;
        edWWWAlias.Enabled := cbWWWCustomAlias.Checked;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end

    else if Sender = edWWWProdName
      then begin
        FindFirst('Name').FindData(FID, WebID).asString := edWWWProdName.EditingText;

        if not cbWWWCustomAlias.Checked then begin
          re := TregExpr.Create;
          re.Expression := '\W+';
          edWWWAlias.EditingText := re.Replace(edWWWProdName.EditingText, '_', True);
          re.Destroy;
        end;
      end
    else if Sender = edWWWShortDescr
      then FindFirst('SDescr').FindData(FID, WebID).asString := edWWWShortDescr.EditingText
    else if Sender = memoWWWDescr
      then FindFirst('LDescr').FindData(FID, WebID).asString := memoWWWDescr.Text
    else if Sender = memoWWWDetails
      then FindFirst('Details').FindData(FID, WebID).asString := memoWWWDetails.Text;
  end; // with wwwTree

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.MakeGroupsTree;
  var
    node, langNode: TapTreeNode;
    tn: TTreeNode;
    pid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.MakeGroupsTree') else _udebug := nil;{$ENDIF}

  if FID > 0
    then pid := FID
    else pid := -1;

  with tvGroups.Items do begin
    if Count > 0 then Clear;

    BeginUpdate;
    node := wsGroups.FirstNode; // if there is no children nodes then FirstNode returns itself.

    while (node <> wsGroups) and (node <> nil) do begin
      tn := nil;

      if node.Parent = wsGroups
        then tn := AddObject(nil, node.name, node) // make it topmost nodes
        else if node.FindData(0, 0).asInteger = 0 // skipping non-master nodes
             then tn := AddChildObject(TTreenode(node.Parent.NodeData), node.Name, node); // group node

      if tn <> nil then begin
        node.NodeData := Integer(tn);
        tn.ImageIndex := 32 - node.FindData(pid, -1, True).asInteger; // autocreating if not exists
        tn.SelectedIndex := tn.ImageIndex;
        if node.FindData(pid, -1).asInteger = 1
          then while tn <> nil do begin
            tn.Expand(False);
            tn := tn.Parent;
          end;
      end;

      node := node.NextNode;
    end;

    EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvGroupsDblClick(Sender: TObject);
  var
    oid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvGroupsDblClick') else _udebug := nil;{$ENDIF}

  inherited;

  if tvGroups.Selected.ImageIndex = 31
    then tvGroups.Selected.ImageIndex := 32
    else tvGroups.Selected.ImageIndex := 31;

  tvGroups.Selected.SelectedIndex := tvGroups.Selected.ImageIndex;

  if FID > 0
    then oid := FID
    else oid := -1;

  TapTreeNode(tvGroups.Selected.Data).FindData(oid).asBoolean := (31 = tvGroups.Selected.ImageIndex);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvGroupsCollapsing(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
begin
  inherited;
  tvGroupsDblClick(Sender); // to overcome state change @ onClik event
end;

//==============================================================================================
procedure TfrmEditMaterials.btnGenBarcodeClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnGenBarcodeClick') else _udebug := nil;{$ENDIF}

  inherited;
  edBarCode.EditingText := genBarCodeFromStr(edArtikul.EditingText);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.apImgList1Change(Sender: TObject);
begin
  FModified := True;
end;

//==============================================================================================
procedure TfrmEditMaterials.butWWWcopyDownClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.butWWWcopyDownClick') else _udebug := nil;{$ENDIF}

  inherited;

  if trim(edWWWMetaKeywords.EditingText) = ''
    then edWWWMetaKeywords.EditingText := edWWWProdName.EditingText;

  if trim(edWWWMetaTitle.EditingText) = ''
    then edWWWMetaTitle.EditingText := edWWWProdName.EditingText;

  if trim(memoWWWMETADescr.EditingText) = ''
    then memoWWWMETADescr.Text := edWWWProdName.EditingText;

  if trim(edWWWShortDescr.EditingText) = ''
    then edWWWShortDescr.EditingText := edWWWProdName.EditingText;

  if trim(memoWWWDescr.EditingText) = ''
    then memoWWWDescr.Text := edWWWProdName.EditingText;

  if trim(memoWWWDetails.EditingText) = ''
    then memoWWWDetails.Text := edWWWProdName.EditingText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnWWWCopyFromMainClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnWWWCopyFromMainClick') else _udebug := nil;{$ENDIF}

  inherited;

  if trim(edWWWProdName.EditingText) = ''
    then edWWWProdName.EditingText := edName.EditingText;

  if trim(edWWWShortDescr.EditingText) = ''
    then edWWWShortDescr.EditingText := edName.EditingText + ' (' + edArtikul.EditingText + ')';

  if trim(memoWWWDescr.EditingText) = ''
    then memoWWWDescr.Text := edName.EditingText + crlf + edArtikul.EditingText + crlf + edLabelDescr.EditingText;

  if trim(memoWWWDetails.EditingText) = ''
    then memoWWWDetails.Text := edWWWProdName.EditingText + crlf + edArtikul.EditingText
         + crlf + cbProducer.EditingText + crlf + lcbCountries.EditingText;

  butWWWcopyDownClick(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.WMTreeSelect(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.WMTreeSelect') else _udebug := nil;{$ENDIF}

  tvBundles.BeginUpdate;

  with Ftreesel.DataSet do begin
    mdBundles.Append;
    mdBundles.FieldByName('Type').AsInteger := FieldByName('Type').AsInteger;

    if FieldByName('Type').asInteger = 14 then begin // 14=product, 15=service
      mdBundles.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger - 10000000;
      mdBundles.FieldByName('PID').AsInteger := -2;
    end
    else begin
      mdBundles.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger - 100000000;
      mdBundles.FieldByName('PID').AsInteger := -1;
    end;

    mdBundles.FieldByName('Name').AsString    := FieldByName('Name').AsString;
    mdBundles.FieldByName('Model').AsString   := FieldByName('Model').AsString;
    mdBundles.FieldByName('Quantity').AsFloat := 0.0;
    mdBundles.FieldByName('MsrName').AsString := FieldByName('Msrname').AsString;
    mdBundles.FieldByName('POS').AsInteger    := mdBundles.RecordCount;
    mdBundles.Post;
  end;

  tvBundles.EndUpdate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aBundleAddExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aBundleAddExecute') else _udebug := nil;{$ENDIF}

  if FTreeSel = nil then begin
    FTreeSel := TfmTReeSelector.Create(nil);

    with FtreeSel do begin
      Provider := 'pMat_getBundleable';
      SessionID := -1;
      dsParams.ParamByName('langid').asInteger := LangIDToDBid[LangID];
      TreeMode := True;
      SelectableType(14);
      SelectableType(15);
      AddColumn('name', rs(ParentNameEx, 'Name'));
      AddColumn('model', rs(ParentNameEx, 'Artikul'));
      AddColumn('msrname', rs(ParentNameEx, 'Measure'));
      //AddColumn('type', '', False);
    end;
  end;

  FtreeSel.Open(Self);

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.aBundleDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if (tvBundles.SelectionCount = 0) or (mdBundles.FieldByName('type').asInteger <= 0) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.aBundleDelExecute') else _udebug := nil;{$ENDIF}

  if mrYes = ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes,ssmbNo])
  then begin
    mdBundles.Delete;
    DataModified(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvBundlesCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
  var
    r: Trect;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvBundlesCustomDrawCell') else _udebug := nil;{$ENDIF}

  ADone := True;
  if AviewInfo.Node.Values[tvBundlesQuantity.VisibleIndex] = '0' then begin
    r := ACanvas.Canvas.ClipRect;
    ACanvas.FillRect(r);
    //AviewInfo.Node.Values[tvBundlesQuantity.VisibleIndex] := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditMaterials.tvBundlesGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvBundlesGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  Aindex := Anode.Values[tvBundlesType.ItemIndex];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvBundlesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    fnode, tnode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  Accept := False;
  if Source <> tvBundles then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvBundlesDragOver') else _udebug := nil;{$ENDIF}

  fnode := tvBundles.Selections[0];
  tnode := tvBundles.GetNodeAt(x,y);

  if (tnode = nil) or (tnode = fnode) or (fnode.Values[tvBundlesID.ItemIndex] < 0) // drop on empty space or dragged the root node
     or ((tnode.Values[tvBundlesID.ItemIndex] > 0)// check for same root
         and (fnode.parent.Values[tvBundlesID.ItemIndex] <> tnode.parent.Values[tvBundlesID.ItemIndex])
     )
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvBundlesDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    fnode, tnode: TcxTreeListNode;
    oldpos, newpos: Integer;
    bm: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.tvBundlesDragOver') else _udebug := nil;{$ENDIF}

  fnode := tvBundles.Selections[0];
  tnode := tvBundles.GetNodeAt(x,y);

  oldpos := fnode.Values[tvBundlesPOS.ItemIndex];
  newpos := tnode.Values[tvBundlesPOS.ItemIndex];

  with mdBundles do begin
    bm := GetBookmark;
    First;
    while not eof do begin
      if FieldByName('typeid').asInteger <> fnode.Values[tvBundlesType.ItemIndex] then Continue;

      if newpos > oldpos then begin
        if (FieldbyName('pos').asInteger > oldpos) and (FieldbyName('pos').asInteger < newpos)
        then begin
          Edit;
          FieldbyName('pos').asInteger := FieldbyName('pos').asInteger - 1;
          Post;
        end;
      end
      else begin
        if (FieldbyName('pos').asInteger < oldpos) and (FieldbyName('pos').asInteger > newpos)
        then begin
          Edit;
          FieldbyName('pos').asInteger := FieldbyName('pos').asInteger + 1;
          Post;
        end;
      end;

      Next;
    end;// while not eof
    GotoBookmark(bm);
    FreeBookmark(bm);
  end; //  with mdBundles

  fnode.MoveTo(tnode, tlamInsert);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.tvBundlesEdited(Sender: TObject; AColumn: TcxTreeListColumn);
begin
  DataModified(Sender);
end;

//==============================================================================================
procedure TfrmEditMaterials.btnCAAddClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnCAAddClick') else _udebug := nil;{$ENDIF}

  DataModified(Sender);
  vlCustAttr.Enabled := True;
  btnCADel.Enabled := true;
  vlCustAttr.InsertRow('-', '', True);
  ProductsTree.FindFirst('CustAttr').FindFirst('-', True, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.btnCADelClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnCADelClick') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(rs(ParentNameEx, 'CustAttr_delquestion'), ssmtWarning, [ssmbYes, ssmbNo])
  then Exit;

  try
    ProductsTree.FindFirst('CustAttr').FindFirst(vlCustAttr.Keys[vlCustAttr.Row]).Delete;
    vlCustAttr.Strings.Delete(vlCustAttr.Row);

  except
  end;

  DataModified(Sender);
  if vlCustAttr.Strings.Count > 0 then begin
    vlCustAttr.Enabled := True;
    btnCADel.Enabled := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditMaterials.vlCustAttrSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
  var
    n: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditMaterials.btnCAAddClick') else _udebug := nil;{$ENDIF}

  n := ProductsTree.FindFirst('CustAttr').FindFirst(vlCustAttr.Keys[vlCustAttr.Row]);
  if n = nil then Exit; // no attributes defined yet

  if vlCustAttr.Col = 0 // edit key
    then n.Name := Value
    else n.FindData(FID, 0, True).asText := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditMaterials', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
