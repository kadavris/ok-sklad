{$I ok_sklad.inc}
unit CCMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StrUtils, Dialogs, ActnList, DB, DBClient, ImgList, ExtCtrls, StdCtrls, ComCtrls,
  BaseFrame, Menus, ToolWin, Clipbrd, Buttons,

  prTypes, prFun, apTree,
  okFrameList,
  ssBaseConst, ssBaseTypes, ssFormStorage, ssImagePanel, ssPopupMenu, ssClientDataSet, ssMemDS,
  ssLabel, ssPanel, ssDBGrid, ssSpeedButton, ssGradientPanel, ssBevel, ssMDIChild,

  dxCntner6, dxTL6, dxDBCtrl6, dxDBTL6, dxDBGrid6,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTextEdit, cxContainer, cxTreeView, cxEdit, cxLookAndFeelPainters, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxPC, cxCheckBox, cxListView,

  xClasses, TB2Item,
  xButton, FR_Class, TB2ExtItems;

type
  TfrmCCMain = class(TMDIChild)
    aByGroup: TAction;
    aByWHouse: TAction;
    aCheck: TAction;
    aClose: TAction;
    aContextFind: TAction;
    ActionList1: TActionList;
    aDel: TAction;
    aDirUp: TAction;
    aDrillDown: TAction;
    aDynamic: TAction;
    aErrMess: TAction;
    aExcel: TAction;
    aFind2: TAction;
    aFind: TAction;
    aFindBegin: TAction;
    aFindConcurr: TAction;
    aFindProps: TAction;
    aFindSubstr: TAction;
    aGroupLargeIcons: TAction;
    aGroupList: TAction;
    aGroupSmallIcons: TAction;
    aGroupTable: TAction;
    aHelp: TAction;
    aLock: TAction;
    aNew: TAction;
    aNewDCGroup: TAction;
    aNewEx: TAction;
    aNewGrp: TAction;
    aNewMain: TAction;
    aPaste: TAction;
    aPatternNew: TAction;
    aPrint: TAction;
    aPrintInCashOrder: TAction;
    aPrintPayOrder: TAction;
    aProps: TAction;
    aReconnect: TAction;
    aRefresh: TAction;
    aSelect: TAction;
    aShowTree: TAction;
    aTreeColExp: TAction;
    aTreeDel: TAction;
    aTreeGrpNew: TAction;
    aTreeNew: TAction;
    aTreeProps: TAction;
    aTreeRefresh: TAction;
    aTreeRename: TAction;
    aView: TAction;
    aWBMovPrint: TAction;
    aWBMovPrintPT: TAction;
    aWBMovPrintTorg13: TAction;
    aWBMovPrintW: TAction;
    Bevel1: TBevel;
    Bevel3: TBevel;
    btnByGroup: TssSpeedButton;
    btnByWHouse: TssSpeedButton;
    btnCheck: TssSpeedButton;
    btnClose: TxButton;
    btnDel: TssSpeedButton;
    btnDirUp: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    btnDyn: TssSpeedButton;
    btnErrMess: TssSpeedButton;
    btnExcel: TssSpeedButton;
    btnFind2: TssSpeedButton;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnNew: TssSpeedButton;
    btnPatternNew: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnReconnect: TssSpeedButton;
    btnRefresh: TssSpeedButton;
    btnSelect: TxButton;
    btnShowGrp: TssSpeedButton;
    btnView: TssSpeedButton;
    Button1: TButton;
    bvlBarTop: TssBevel;
    bvlFooterSep: TssBevel;
    cbFindCriteria: TcxComboBox;
    cbFindField: TcxComboBox;
    cdsTree: TssClientDataSet;
    chbContextFind: TcxCheckBox;
    edFind2: TcxTextEdit;
    FormStorage: TssFormStorage;
    FrameList: TokFrameList;
    frDoc: TfrReport;
    imnuNewGrp: TTBItem;
    lFindBy: TssLabel;
    lvGroup: TcxListView;
    mnuFindBegin: TTBItem;
    mnuFindConcurr: TTBItem;
    mnuFindParamsSep: TTBSeparatorItem;
    mnuFindSubstr: TTBItem;
    panBar: TPanel;
    panButtons: TPanel;
    panData: TPanel;
    panTree: TPanel;
    panFindBottom: TPanel;
    panGroup: TPanel;
    panLeft: TPanel;
    panLeftButtons: TPanel;
    panMain: TPanel;
    panNoAccess: TPanel;
    panRight: TssImagePanel;
    pmFind: TTBPopupMenu;
    pmGroup: TTBPopupMenu;
    pmPayDoc: TTBPopupMenu;
    pmTree: TTBPopupMenu;
    pmWBMov: TTBPopupMenu;
    sepClip: TTBSeparatorItem;
    sepDel: TTBSeparatorItem;
    sepDyn: TBevel;
    sepPrint: TBevel;
    splMain: TSplitter;
    srcTree: TDataSource;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
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
    TBSubmenuItem1: TTBSubmenuItem;
    tlMain: TTreeView;
    txtLang: TssLabel;
    txtNoAccess: TssBevel;
    miNewWebCat: TTBEditItem;
    miNewWebCatLabel: TTBItem;
    miNewWebCatSep: TTBSeparatorItem;
    panFindTop: TPanel;
    txtLang2: TssLabel;
    btnFind: TssSpeedButton;
    btnFindParams: TssSpeedButton;
    edFind: TcxTextEdit;
    Bevel2: TBevel;

    procedure aByGroupExecute(Sender: TObject);
    procedure aByWHouseExecute(Sender: TObject);
    procedure aCheckExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aContextFindExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure aDelExecute(Sender: TObject);
    procedure aDirUpExecute(Sender: TObject);
    procedure aDrillDownExecute(Sender: TObject);
    procedure aDynamicExecute(Sender: TObject);
    procedure aErrMessExecute(Sender: TObject);
    procedure aExcelExecute(Sender: TObject);
    procedure aFindBeginExecute(Sender: TObject);
    procedure aFindConcurrExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aFindPropsExecute(Sender: TObject);
    procedure aFindSubstrExecute(Sender: TObject);
    procedure aGroupSmallIconsExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aLockExecute(Sender: TObject);
    procedure aNewDCGroupExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aNewExExecute(Sender: TObject);
    procedure aNewGroupExecute(Sender: TObject);
    procedure aNewGrpExecute(Sender: TObject);
    procedure aNewMainExecute(Sender: TObject);
    procedure aNewMatExecute(Sender: TObject);
    procedure aPasteExecute(Sender: TObject);
    procedure aPatternNewExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintInCashOrderExecute(Sender: TObject);
    procedure aPrintPayOrderExecute(Sender: TObject);
    procedure aPropsExecute(Sender: TObject);
    procedure aReconnectExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aSelectExecute(Sender: TObject);
    procedure aShowTreeExecute(Sender: TObject);
    procedure aTreeColExpExecute(Sender: TObject);
    procedure aTreeDelExecute(Sender: TObject);
    procedure aTreeGrpNewExecute(Sender: TObject);
    procedure aTreeNewExecute(Sender: TObject);
    procedure aTreePropsExecute(Sender: TObject);
    procedure aTreeRefreshExecute(Sender: TObject);
    procedure aTreeRenameExecute(Sender: TObject);
    procedure aViewExecute(Sender: TObject);
    procedure aWBMovPrintExecute(Sender: TObject);
    procedure aWBMovPrintPTExecute(Sender: TObject);
    procedure aWBMovPrintTorg13Execute(Sender: TObject);
    procedure aWBMovPrintWExecute(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure btnShowGrpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbFindCriteriaPropertiesEditValueChanged(Sender: TObject);
    procedure cbFindFieldPropertiesEditValueChanged(Sender: TObject);
    procedure cdsTreeAfterOpen(DataSet: TDataSet);
    procedure chbContextFindClick(Sender: TObject);
    procedure edFind2KeyPress(Sender: TObject; var Key: Char);
    procedure edFind2PropertiesChange(Sender: TObject);
    procedure edFindCurChange(Sender: TObject);
    procedure edFindPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormStorageStoredValues0Restore(Sender: TStoredValue; var Value: Variant);
    procedure FormStorageStoredValues0Save(Sender: TStoredValue; var Value: Variant);
    procedure FrameListChange(Sender: TObject);
    procedure lvGroupCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvGroupDblClick(Sender: TObject);
    procedure lvGroupGetImageIndex(Sender: TObject; Item: TListItem);
    procedure pmFindPopup(Sender: TObject);
    procedure pmPayDocPopup(Sender: TObject);
    procedure pmTreePopup(Sender: TObject);
    procedure splMainCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure tlMainChange(Sender: TObject; Node: TTreeNode);
    procedure tlMainChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure tlMainCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tlMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tlMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tlMainEdited(Sender: TObject; Node: TTreeNode; var S: String);
    procedure tlMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
    procedure tlMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure tlMainGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tlMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure miNewWebCatAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);

  private
    bState: TButtonsState;
    FFindList: TList;
    FFindListNames: TStringList;
    FFindLock: Boolean;
    FID: integer;
    FMatGrpItems, FWHouseItems: TTreeView;
    FParam: Integer;
    FSection: string;
    FViewType: TCCViewType;
    GrpID: Integer;
    IsGrp: Integer;
    notRefreshWHouseItems, notRefreshMatGrpItems: boolean;
    PrevNode, PopupNode: TTreeNode;
    //DragID: integer;
    //DragType: TDragType;
    //TempNodeText: string;

    function  GetDetNode(ANode: TTreeNode; const AID: integer): TTreeNode;
    function  GetFunctionName(const AClassName: string): string;
    function  GetWHNode(ANode: TTreeNode): TTreeNode;
    function  GetWIDByNode(ANode: TTreeNode): Integer;
    function  SetNewDCGParent(AID, APID: integer): integer;
    function  SetNewDCParent(AID, APID: integer): integer;
    function  SetNewMatGroupParent(AID, APID: integer): integer;
    function  SetNewMatParent(AID, APID: integer): integer;
    function  SetNewSvcGroupParent(AID, APID: integer): integer;
    function  UpdateDCGroup(ANode: TTreeNode; const S: string): Boolean;
    function  UpdateMatGroup(ANode: TTreeNode; const S: string): boolean;
    function  UpdateSvcGroup(ANode: TTreeNode; const S: string): Boolean;
    function  UpdateUserTreeView(ANode: TTreeNode; const S: string): boolean;
    procedure AssignItemData(ASource, ADest: TTreeView);
    procedure CancelNodeEditing(ANode: TTreeNode; const AText: string);
    procedure DoFind(Sender: TObject; AFwd: Boolean);
    procedure MakeWebCatNode(FNode, ParentNode: TTreeNode; apTreeNode: TapTreeNode);
    procedure mnuFindClick(Sender: TObject);
    procedure RefreshNode(ANode: TTreeNode);
    procedure ReloadGroup(ANode: TTreeNode);
    procedure SetID(const Value: integer);
    procedure SetParam(const Value: Integer);
    procedure SetTreeLng;
    procedure SetViewType(const Value: TCCViewType);
    procedure UpdActions;
    procedure UpdTreeActions;
    procedure WMAddTreeItem(var M: TMessage); message WM_ADDTREEITEM;
    procedure WMCallBack(var M: TMessage); message WM_CALLBACK;
    procedure WMChangeBState(var M: TMessage); message WM_CHANGEBSTATE;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMInputLangChange(var M: TMessage); message WM_INPUTLANGCHANGE;
    procedure WMInputLangChangeRequest(var M: TMessage); message WM_INPUTLANGCHANGEREQUEST;
    procedure WMItemMoved(var M: TMessage); message WM_ITEMMOVED;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMRefreshBin(var M: TMessage); message WM_REFRESHBIN;
    procedure WMRefreshNode(var M: TMessage); message WM_REFRESHNODE;
    procedure WMRefreshTreeItem(var M: TMessage); message WM_REFRESHTREEITEM;
    procedure WMResetStyle(var M: TMessage); message WM_RESETSTYLE;
    procedure WMRestoreFromBin(var M: TMessage); message WM_RESTOREFROMBIN;
    procedure WMSearchFailed(var M: TMessage); message WM_SEARCHFAILED;
    procedure WMSelectItem(var M: TMessage); message WM_SELECTITEM;
    procedure WMSetCaptionEx(var M: TMessage); message WM_SETCAPTIONEX;
    procedure WMSetFindParams(var M: TMessage); message WM_SETFINDPARAMS;
    procedure WMSetFindStr(var M: TMessage); message WM_SETFINDSTR;
    procedure WMSetNewCaption(var M: TMessage); message WM_SETNEWCAPTION;
    procedure WMSetParentCaption(var M: TMessage); message WM_SETPARENTCAPTION;
    procedure WMSetTreeItem(var M: TMessage); message WM_SETTREEITEM;

  protected
    WMatNode, FSvcNode, FDCNode: TTreeNode;
    FCashNode, FCashlessNode: TTreeNode;
    FWebShopNodes: TList; // nil if none in this view type
    FInSearch: boolean;

    function  LoadFrame(const AClass: string; GType: integer): TssBaseFrame; virtual;
    function  SetTreeItem(ANode: TTreeNode; const AValue: Integer; ASelect: boolean = True): TTreeNode;
    procedure DeleteTreeItemInfo(ANode: TTreeNode);
    procedure GetCashDeskLevel(ANode: TTreeNode);
    procedure GetCurrencyLevel(ANode: TTreeNode);
    procedure GetDCGroupLevel(ANode: TTreeNode);
    procedure GetEntAccLevel(ANode: TTreeNode);
    procedure GetKAgentLevel(ANode: TTreeNode);
    procedure GetLevel(ANode: TTreeNode); virtual;
    procedure GetMatGroupLevel(ANode: TTreeNode; ANodeType: integer);
    procedure GetSvcGroupLevel(ANode: TTreeNode);
    procedure GetWHouseLevel(ANode: TTreeNode);
    procedure LocateDiscGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
    procedure LocateKAgent(ANode: TTreeNode; AID: integer);
    procedure LocateMatGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
    procedure LocateSvcGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
    procedure LocateWHouse(ANode: TTreeNode; AID: integer);

  public
    NotChangeDetail: Boolean;
    RefType: TRefType;
    ParentHandle: HWND;

    constructor Create(AOwner: TComponent; ARefType: TRefType; const ASection: string); reintroduce; overload; virtual;
    constructor Create(AOwner: TComponent); overload; override;

    procedure RefreshTree(const ATreeID: integer);
    procedure RefreshWH;
    procedure SetCaptions; override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure ExecRefresh(const AClass: string; ID: Integer; AParam: Integer = 0); virtual;
    procedure ExecLocate(const AClass: string; ID: Integer; GType: Integer = 0); virtual;

    property ViewType: TCCViewType read FViewType write SetViewType;
    property ID: integer read FID write SetID;
    property Param: Integer read FParam write SetParam;
  end;

  TfrmCCMainForm = class of TfrmCCMain;

var
  frmCCMain: TfrmCCMain;
  FLib: Integer;

//=============================================================================
implementation

uses
  ClientData, uDebug, xLngDefs, fMeasures, prConst, fCurrency, fEqType,
  fBank, fMaterials, ShellAPI, fWebShops,
  fRecycleBin, fUserGroups, fUsers, fUserMonitor, fAccountType,
  Options, fKAgent, fWHouse, ssStrUtil, ssFun, Waybill,
  WMat, ssBaseSkinForm, fPayDoc, fWaybillOut, fAllReports,
  ssCallbackConst, Main, fAccOut, fPriceTypes, EditMaterials,
  fMessageDlg, fCountries, fContr, fTaxWB, fDB, Login, ssRegUtils,
  fWaybillMov, fNA, fPriceList, fOperLog, fWBRest, fChargeType, BaseWBDoc,
  fWriteOff, fInventory, fReturnOut, fReturnIn, ssDateUtils, fServices,
  fSvcGroup, fCashDesks, fFinance, fWBReestr, fSQLEditor, fMoneyMove,
  fTaxes, fInvoices, fDiscCards, EditDiscCards, fOrders, ok_rep,
  fDCG, MetaProduct, EditWebShop, fMatGroup, Bundles, Bundling;

{$R *.dfm}

const
  // TTreeItemInfo.NodeType local types
  nt_Undefined = -1; //
  nt_Any = 0; // unspecified (this number is from UserTreeView table)
  nt_Top = 1; // top of the branch and just a sub-tree holder (this number is from UserTreeView table)

  nt_WebStoreCategory = -71;// web store (sub-)category node
  nt_WebStore     = -70; // web store root (under Products(All) actually)
  nt_DiscCardCat  = -60; //группы дисконтных карт
  nt_SvcCat       = -50; // service category
  nt_BusinessPartner = -6;
  nt_Reports      = -5;
  nt_Finances     = 118; //6
  nt_BankAccounts = 119;

  //nt_Internet      = 600;
  //nt_WebShops      = 601;
  //nt_RSS           = 602;

var
  FProc: procedure; cdecl;
  {$IFDEF UDEBUG}DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

//=========================================================================
procedure TfrmCCMain.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  setFontStyle(txtNoAccess.Font);

  txtLang.Caption := keyboardIndicator;
  txtLang2.Caption := txtLang.Caption;
  FormStorage.IniFileName := MainRegKey;

  if FSection <> ''
    then FormStorage.IniSection := FSection
    else FormStorage.IniSection := Self.ClassName;

  FormStorage.Active := True;

  FFindList := TList.Create;
  FFindListNames := TStringList.Create;

  FWHouseItems := TTreeView.Create(nil);
  FMatGrpItems := TTreeView.Create(nil);
  FMatGrpItems.Visible := False;
  FMatGrpItems.Parent := Self;
  FWHouseItems.Visible := False;
  FWHouseItems.Parent := Self;

  //SetStyle(Self, IStyle);
  //FrameList := TssFrameList.Create(Self);
  SetCaptions;

  //aDrillDown.Checked := False;
  //aByWHouse.Checked := True;

  Temp := 0;
  ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'WMatShowType', Temp);

  if Temp = 0 then begin
    aByWHouse.Checked := True;
    btnByWHouse.Checked := True;
  end
  else begin
    aByGroup.Checked := True;
    btnByGroup.Checked := True;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'DrillDown', Temp) then begin
    btnDrillDown.Checked := (Temp <> 0);
    aDrillDown.Checked := (Temp <> 0);
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'WMatShowType2', Temp) then begin
    btnShowGrp.Checked := (Temp <> 0);
  end;

  ReadFromRegInt(MainRegKey, 'LastNodeID', LastNodeID);
  ReadFromRegInt(MainRegKey, 'LastPNodeID', LastPNodeID);
  ReadFromRegInt(MainRegKey, 'LastMatID', LastMatID);
  lvGroup.ViewStyle := vsReport;

  if CountryRules.AR <> accRul_RU then aWBMovPrintTorg13.Visible := False;

  if wsGroupTrees = nil then wsGroupTrees := TapWoods.Create(nil); // a pack of shrubs ;). one for each webshop

  if WebCatsLangTree = nil // loading all 'cos it's small
    then WebCatsLangTree := TapTree.Create(tree_wwwLangs, cfOwnerTypeWebShop, -1)
    else WebCatsLangTree.LoadData(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormClose') else _udebug := nil;{$ENDIF}

  if FormStyle = fsMDIChild then Action := caFree;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.LoadFrame(const AClass: string; GType: integer): TssBaseFrame;
  var
    tfClass: TssBaseFrameClass;
    FParam: Variant;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LoadFrame') else _udebug := nil;{$ENDIF}

  Result := nil;
  Screen.Cursor := crHourGlass;

  try
    tfClass := nil;

    if AClass = TfmMeasures.ClassName        then tfClass := TfmMeasures
    else if AClass = TfmCurrency.ClassName   then tfClass := TfmCurrency
    else if AClass = TfmTaxWB.ClassName      then tfClass := TfmTaxWB
    else if AClass = TfmOrders.ClassName     then tfClass := TfmOrders
    else if AClass = TfmInvoices.ClassName   then tfClass := TfmInvoices
    else if AClass = TfmDiscCards.ClassName  then tfClass := TfmDiscCards
    else if AClass = TfmTaxes.ClassName      then tfClass := TfmTaxes
    else if AClass = TfmWBReestr.ClassName   then tfClass := TfmWBReestr
    else if AClass = TfmMoneyMove.ClassName  then tfClass := TfmMoneyMove
    else if AClass = TfmContr.ClassName      then tfClass := TfmContr

    else if AClass = TfmServices.ClassName   then tfClass := TfmServices
    else if AClass = TfmMatGroup.ClassName   then tfClass := TfmMatGroup
    else if AClass = TfmFinance.ClassName    then tfClass := TfmFinance

    else if AClass = TfmCashDesks.ClassName  then tfClass := TfmCashDesks
    else if AClass = TfmSvcGroup.ClassName   then tfClass := TfmSvcGroup
    else if AClass = TfmEqType.ClassName     then tfClass := TfmEqType
    else if AClass = TfmBank.ClassName       then tfClass := TfmBank
    else if AClass = TfmCountries.ClassName  then tfClass := TfmCountries
    else if AClass = TfmPriceList.ClassName  then tfClass := TfmPriceList
    else if AClass = TfmChargeType.ClassName then tfClass := TfmChargeType

    else if AClass = TfmAllReports.ClassName then tfClass := TfmAllReports

    else if -1 <> AnsiIndexStr(AClass, ['f_RepKA', 'f_RepWH', 'f_RepSvc', 'f_RepContr'])
      then tfClass := TfmAllReports

    else if AClass = TfmWriteOff.ClassName   then tfClass := TfmWriteOff
    else if AClass = TfmWaybillMov.ClassName then tfClass := TfmWaybillMov
    else if AClass = TfmMaterials.ClassName  then tfClass := TfmMaterials
    else if AClass = TfmKAgent.ClassName     then tfClass := TfmKAgent

    else if AClass = TfmWaybill.ClassName then tfClass := TfmWaybill

    else if AClass = TfmInventory.ClassName then tfClass := TfmInventory

    else if AClass = TfmWBRest.ClassName then tfClass := TfmWBRest
    else if AClass = TfmAccOut.ClassName then tfClass := TfmAccOut
    else if AClass = TfmWaybillOut.ClassName then tfClass := TfmWaybillOut
    else if AClass = TfmPayDoc.ClassName then tfClass := TfmPayDoc

    else if AClass = TfmAccountType.ClassName then tfClass := TfmAccountType
    else if AClass = TfmPriceTypes.ClassName then tfClass := TfmPriceTypes
    else if AClass = TfmWMat.ClassName then tfClass := TfmWMat
    else if AClass = TfmWhouse.ClassName then tfClass := TfmWhouse
    else if AClass = TfmOperLog.ClassName then tfClass := TfmOperLog

    else if AClass = TfmUsers.ClassName then tfClass := TfmUsers
    else if AClass = TfmSQLEditor.ClassName then tfClass := TfmSQLEditor
    else if AClass = TfmNA.ClassName then tfClass := TfmNA

    else if AClass = TfmUserGroups.ClassName then tfClass := TfmUserGroups
    else if AClass = TfmRecycleBin.ClassName then tfClass := TfmRecycleBin

    else if AClass = TfmUserMonitor.ClassName then tfClass := TfmUserMonitor
    else if AClass = TfmDB.ClassName then tfClass := TfmDB
    else if AClass = TfmDCG.ClassName then tfClass := TfmDCG

    else if AClass = TfmWBReturnOut.ClassName then begin
      //{$IFNDEF LITE}
      tfClass := TfmWBReturnOut;
      //{$ELSE}
      //tfClass := TfmNA;
      //{$ENDIF}
    end
    else if AClass = TfmWBReturnIn.ClassName then begin
      //{$IFNDEF LITE}
      tfClass := TfmWBReturnIn;
      //{$ELSE}
      //tfClass := TfmNA;
      //{$ENDIF}
    end
    else if AClass = TfmWebShops.ClassName then tfClass := TfmWebShops
    //else if AClass = TfmRSS.ClassName then tfClass := TfmRSS
    else if AClass = TfmBundles.ClassName then tfClass := TfmBundles

    else if AClass = '' then tfClass := TfmNA;

    if tfClass = TfmNA
      then TTreeItemInfo(tlMain.Selected.Data).refersClassName := 'TfmNA';

    if tfClass <> nil then begin
      Result := tfClass.Create(nil);
      Result.ParentHandle := Self.Handle;
      Result.ParentCCForm := Self;
      Result.FunID := TTreeItemInfo(tlMain.Selected.Data).FunID;
      Result.ViewType := Self.ViewType;
      Result.ModalView := (Self.FormStyle = fsNormal);

      Result.ImageIndex := tlMain.Selected.ImageIndex;

      if tfClass = TfmCurrency
        then FParam := 1
        else FParam := 0;

      Result.OnDate := Self.OnDate;
      Result.Tag := GType;
      Result.FDrillDown := aDrillDown.Checked;

      case RefType of
        rtPersons: Result.Tag := 100;
        rtEnt:     Result.Tag := 101;
      end;

      if Self.WindowState = wsNormal then Result.DoSomething;

      //Application.ProcessMessages;
      Result.DoOpen(FParam);
    end;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aPropsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPropsExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aDelExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoDelete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aRefreshExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMChangeBState(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMChangeBState') else _udebug := nil;{$ENDIF}

  if TssBaseFrame(Pointer(M.LParam)).Enabled then begin
    bState := TButtonsState(word(pointer(M.WParam)^));
    UpdActions;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.UpdActions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdActions') else _udebug := nil;{$ENDIF}

  aNew.Enabled := panData.Visible and (bsInsert in bState);
  aPatternNew.Enabled := panData.Visible and (bsPatternInsert in bState);
  aNewMain.Enabled := aNew.Enabled;
  aProps.Enabled := panData.Visible and (bsProperties in bState);
  aDel.Enabled := panData.Visible and (bsDelete in bState);
  aRefresh.Enabled := panData.Visible and (bsRefresh in bState);
  aDynamic.Enabled := panData.Visible and (bsDynamic in bState);
  aDynamic.Checked := bsDynChecked in bState;
  btnDyn.Checked := aDynamic.Checked;
  aPrint.Enabled := panData.Visible and (bsPrint in bState);
  aExcel.Enabled := panData.Visible and (bsExcel in bState);
  sepPrint.Visible := aExcel.Visible or aPrint.Visible;
  sepDyn.Visible := aDynamic.Visible;
  aCheck.Enabled := panData.Visible and (bsCheck in bState);

  aDrillDown.Enabled := ((panData.Visible) and (bsDrillDown in bState))
    or (btnShowGrp.Checked and (TTreeItemInfo(tlMain.Selected.Data).NodeType = -3));

  btnShowGrp.Enabled := aByWHouse.Checked and panData.Visible and (FrameList.FcurrFrame is TfmWMat);

  //----------------------------------
  {panFindBottom.Enabled := edFind.Enabled
    and not (ViewType in [vtAccountType, vtMeasures, vtWHouse, vtBank, vtMatGroup, vtSvcGroup, vtCountries, vtChargeType, vtCashDesks, vtDiscCardGroup]);
  }

  aFind.Enabled := (bsFind in bState) and panData.Visible;

  panFindBottom.Visible := aFind.Enabled and ShowFindPanel
    and not (ViewType in [vtDiscCardGroup, vtMatGroup, vtSvcGroup, vtBank, vtMeasures, vtWHouse, vtCountries, vtChargeType, vtCashDesks]);

  if (Self.FormStyle = fsNormal) and (ViewType = vtFinances) then panFindBottom.Visible := False;
  bvlFooterSep.Visible := panFindBottom.Visible;

  panFindTop.Enabled := aFind.Enabled;
  aFindProps.Enabled := aFind.Enabled;

  //----------------------------------
  //aNewEx.Visible := (FrameList.FcurrFrame<>nil) and (FrameList.FcurrFrame is TfmMaterials);
  //aNew.Visible := not (FrameList.FcurrFrame is TfmMaterials);

  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmCCMain.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aNew.Caption := GetRS('Common', 'Add');
    aNew.Hint := aNew.Caption;
    aPatternNew.Caption := GetRS('Common', 'PatternAdd');
    aPatternNew.Hint := aPatternNew.Caption;
    aNewEx.Caption := aNew.Caption;
    aNewEx.Hint := aNewEx.Caption;
    aCheck.Caption := GetRS('Common', 'Check');
    aCheck.Hint := aCheck.Caption;
    aProps.Caption := GetRS('Common', 'Properties');
    aProps.Hint := aProps.Caption;
    aDel.Caption := GetRS('Common', 'Del');
    aDel.Hint := aDel.Caption;
    aRefresh.Caption := GetRS('Common', 'Refresh');
    aRefresh.Hint := aRefresh.Caption;
    aDynamic.Caption := GetRS('Common', 'Dynamic');
    aDynamic.Hint := aDynamic.Caption;
    aDirUp.Caption := GetRS('Common', 'LevelUp');
    aDirUp.Hint := aDirUp.Caption;
    aHelp.Caption := GetRS('Common', 'Help');
    aHelp.Hint := aHelp.Caption;

    aFind.Caption := GetRS('Common', 'Find');
    aFind.Hint := aFind.Caption;
    aFindBegin.Caption := GetRS('Common', 'FindBegin');
    aFindBegin.Hint := aFindBegin.Caption;
    aFindConcurr.Caption := GetRS('Common', 'FindConcurr');
    aFindConcurr.Hint := aFindConcurr.Caption;
    aFindSubstr.Caption := GetRS('Common', 'FindSubst');
    aFindSubstr.Hint := aFindSubstr.Caption;
    aContextFind.Caption := GetRS('Common', 'FindContext');
    aContextFind.Hint := aContextFind.Caption;
    aFindProps.Caption := GetRS('Common', 'FindParams');
    aFindProps.Hint := aFindProps.Caption;
    aFind2.Caption := GetRS('Common', 'FindNext');
    aFind2.Hint := aFind2.Caption;

    lFindBy.Caption := GetRS('TfrmCCMain', 'FindBy');
    chbContextFind.Properties.Caption := GetRS('Common', 'FindContext');

    with cbFindCriteria.Properties do begin
      Items.Clear;
      Items.Add(GetRS('Common', 'FindBegin'));
      Items.Add(GetRS('Common', 'FindConcurr'));
      Items.Add(GetRS('Common', 'FindSubst'));
      cbFindCriteria.ItemIndex := 2;
    end;

    aPrint.Caption := GetRS('Common', 'Print');
    aPrint.Hint := aPrint.Caption;
    aView.Caption := GetRS('Common', 'View');
    aView.Hint := aView.Caption;
    aDrillDown.Caption := GetRS('Common', 'DrillDown');
    aDrillDown.Hint := aDrillDown.Caption;
    aReconnect.Hint := GetRS('Common', 'Reconnect');
    aExcel.Caption := GetRS('Common', 'Excel');
    aExcel.Hint := GetRS('Common', 'ExcelHint');
    aErrMess.Hint := GetRS('Common', 'SendMessage');

    aNewDCGroup.Caption := GetRS('fmDiscCards', 'DCGroupD') + '...';

    btnShowGrp.Hint := GetRS('TfrmCCMain', 'ShowGrp');

    txtNoAccess.Caption := GetRS('TfrmCCMain', 'NoAccess') + #13#10 + GetRS(Self.ClassName, 'ConnectAdmin');

    aPaste.Caption := GetRS('Common', 'Paste');

    aPrintPayOrder.Caption := GetRS('TfrmCCMain', 'PayOrder');
    aPrintInCashOrder.Caption := GetRS('TfrmCCMain', 'InCashOrder');

    aWBMovPrint.Caption := GetRS('fmWaybill','WBMovPrint');
    aWBMovPrintW.Caption := GetRS('fmWaybill','WBMovPrintW');
    aWBMovPrintPT.Caption := GetRS('fmWaybill','WBMovPrintPT');
    aWBMovPrintTorg13.Caption := GetRS('fmWaybill', 'WBMovPrintTorg13');

    aByWHouse.Caption := GetRS('Common', 'ByWHouse');
    btnByWHouse.Hint := aByWHouse.Caption;
    aByGroup.Caption := GetRS('Common', 'ByGrp');
    btnByGroup.Hint := aByGroup.Caption;
    aLock.Caption := GetRS('Common', 'Lock');
    aLock.Hint := aLock.Caption;

    aTreeRename.Caption := GetRS('Common', 'Rename');
    aTreeRename.Hint := aTreeRename.Caption;
    aTreeRefresh.Caption := GetRS('Common', 'Refresh');
    aTreeRefresh.Hint := aTreeRefresh.Caption;
    aTreeDel.Caption := GetRS('Common', 'Del');
    aTreeNew.Caption := GetRS('Common', 'Add');
    aTreeProps.Caption := GetRS('Common', 'Properties') + '...';

    aSelect.Caption := GetRS('Common', 'Select');
    aClose.Caption := GetRS('Common', 'Cancel');

    aGroupSmallIcons.Caption := GetRS('Common', 'SmallIcons');
    aGroupLargeIcons.Caption := GetRS('Common', 'LargeIcons');
    aGroupList.Caption := GetRS('Common', 'List');
    aGroupTable.Caption := GetRS('Common', 'Table');

    miNewWebCatLabel.Caption := GetRS('TfrmCCMain', 'miNewWebCat');
    miNewWebCatLabel.Enabled := False;
    miNewWebCat.Caption := '';
    miNewWebCat.EditCaption := miNewWebCat.Caption;
    miNewWebCat.Hint := GetRS('TfrmCCMain', 'miNewWebCatHint');
  end;
  
  SetTreeLng;

  FrameList.SetCaptions;

  UpdActions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.ReloadGroup(ANode: TTreeNode);
  var
   i: integer;
   li: TListItem;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.ReloadGroup') else _udebug := nil;{$ENDIF}

   with lvGroup do begin
     Items.Clear;
     if (ANode.Count > 0) and (ANode.Item[0].Text = '') then GetLevel(ANode);

     for i := 0 to ANode.Count - 1 do begin
       li := Items.Add;
       li.Caption := TTreeItemInfo(ANode.Item[i].Data).DisplayedName;
       li.ImageIndex := TTreeItemInfo(ANode.Item[i].Data).ImageIndex;
       li.Data := ANode.Item[i];
     end;

     Tag := 1;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.cdsTreeAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.cdsTreeAfterOpen') else _udebug := nil;{$ENDIF}

  tlMain.FullExpand;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aGroupSmallIconsExecute(Sender: TObject);
  var
    lv: TcxListView;
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aGroupSmallIconsExecute') else _udebug := nil;{$ENDIF}

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TcxListView then begin
      lv := TcxListView(Components[i]);

      case (Sender as TComponent).Tag of
        0: lv.ViewStyle := vsList;
        1: lv.ViewStyle := vsList;
        2: lv.ViewStyle := vsList;
        3: lv.ViewStyle := vsList;
      end;
    end;

  (Sender as TAction).Checked := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.lvGroupDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.lvGroupDblClick') else _udebug := nil;{$ENDIF}

  if Assigned(lvGroup.Selected) then begin
    if not tlMain.Selected.Expanded then tlMain.Selected.Expand(False);

    tlMain.Selected := TTreeNode(lvGroup.Selected.Data);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormStorageStoredValues0Restore(Sender: TStoredValue; var Value: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormStorageStoredValues0Restore') else _udebug := nil;{$ENDIF}

  if Value <> '' then
    case Value of
      0: begin
          aGroupSmallIcons.Checked := True;
          lvGroup.ViewStyle := vsReport;
         end;

      1: begin
          aGroupLargeIcons.Checked := True;
          lvGroup.ViewStyle := vsReport;
         end;

      2: begin
          aGroupList.Checked := True;
          lvGroup.ViewStyle := vsReport;
         end;

      3: begin
          aGroupTable.Checked := True;
          lvGroup.ViewStyle := vsReport;
         end;
    end; // case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormStorageStoredValues0Save(Sender: TStoredValue; var Value: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormStorageStoredValues0Save') else _udebug := nil;{$ENDIF}

  if aGroupSmallIcons.Checked then Value := 0
  else if aGroupLargeIcons.Checked then Value := 1
  else if aGroupList.Checked then Value := 2
  else if aGroupTable.Checked then Value := 3;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aHelpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aHelpExecute') else _udebug := nil;{$ENDIF}

  if Assigned(tlMain.Selected) then begin
    if TTreeItemInfo(tlMain.Selected.Data).utv_gType = 2
      then ShowHelpTopic('Documents')
    else if TTreeItemInfo(tlMain.Selected.Data).utv_gType = 3
      then ShowHelpTopic('Service')
    else if TTreeItemInfo(tlMain.Selected.Data).utv_gType = 1
      then ShowHelpTopic('Refs')
    else if TTreeItemInfo(tlMain.Selected.Data).utv_gType = 5
      then ShowHelpTopic('Reports')
    else if Assigned(FrameList.FcurrFrame)
      then FrameList.FcurrFrame.DoHelp;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aDynamicExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aDynamicExecute') else _udebug := nil;{$ENDIF}

  aDynamic.Checked := not aDynamic.Checked;
  btnDyn.Checked := not btnDyn.Checked;
  FrameList.FcurrFrame.DoDynamic;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormDestroy') else _udebug := nil;{$ENDIF}

  FrameList.FreeAndClear;
  //FrameList.Free;
  FFindList.Free;
  FFindListNames.Free;
  FMatGrpItems.Free;
  FWHouseItems.Free;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'WMatShowType',  Integer(aByGroup.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'WMatShowType2', Integer(btnShowGrp.Checked));

  if (tlMain.Selected <> nil) and (ViewType = vtWMat) and (FormStyle = fsNormal) then begin
    if (tlMain.Selected <> WMatNode)
      then WriteToRegInt(MainRegKey, 'LastNodeID', TTreeItemInfo(tlMain.Selected.Data).ID)
      else WriteToRegInt(MainRegKey, 'LastNodeID', -1);

    if (tlMain.Selected.Parent <> nil) and (tlMain.Selected.Parent <> WMatNode)
      then WriteToRegInt(MainRegKey, 'LastPNodeID', TTreeItemInfo(GetWHNode(tlMain.Selected).Data).ID)
      else WriteToRegInt(MainRegKey, 'LastPNodeID', -1);
  end;

  if (tlMain.Selected <> nil) and (ViewType = vtMat) and (FormStyle = fsNormal) then begin
    if (tlMain.Selected <> tlMain.Items[0])
      then WriteToRegInt(MainRegKey, 'LastMatID', TTreeItemInfo(tlMain.Selected.Data).ID)
      else WriteToRegInt(MainRegKey, 'LastMatID', -1)
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.RefreshTree(const ATreeID: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.RefreshTree') else _udebug := nil;{$ENDIF}

  try
    tlMain.Items.Clear;

  except
  end;

  if cdsTree.Active then cdsTree.Close;

  cdsTree.Params.ParamByName('treeid').AsInteger := ATreeID;
  cdsTree.Params.ParamByName('shortname').AsString := LangName;
  cdsTree.Open;

  GetLevel(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetLevel(ANode: TTreeNode);
  var
    BM: TBookmark;
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    RootID, GType: integer;
    FName, s: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetLevel') else _udebug := nil;{$ENDIF}

  with cdsTree do begin
    BM := cdsTree.GetBookmark;
    NotChangeDetail := True;

    try
      DeleteTreeItemInfo(ANode);

      if ANode = nil then begin
        tlMain.Items.Clear;
        Finfo := nil;
      end
      else begin
        ANode.DeleteChildren;
        Finfo := Anode.Data // for a good code look ;)
      end;

      gType := utv_gType_All;

      // this section adds various non-root sub-nodes
      if (ANode <> nil) and (FInfo.refersClassName = TfmCurrency.ClassName)       then GetCurrencyLevel(ANode)
      else if (ANode <> nil) and (FInfo.refersClassName = TfmKAgent.ClassName)    then GetKAgentLevel(ANode)
      else if (ANode <> nil) and (FInfo.refersClassName = TfmMaterials.ClassName) then GetMatGroupLevel(ANode, -2)
      else if (ANode <> nil) and (FInfo.refersClassName = TfmServices.ClassName)  then GetSvcGroupLevel(ANode)
      else if (ANode <> nil) and (FInfo.refersClassName = TfmDiscCards.ClassName) then GetDCGroupLevel(ANode)
      else if (ANode <> nil) and (FInfo.refersClassName = TfmWMat.ClassName)
              and (aByGroup.Checked
                   or (aByWHouse.Checked and btnShowGrp.Checked and (TTreeItemInfo(ANode.Data).NodeType = -4)
                       or (TTreeItemInfo(ANode.Data).NodeType = -3)
                      )
                  )
           then GetMatGroupLevel(ANode, -3)

      else if (ANode <> nil) and (FInfo.refersClassName = TfmWMat.ClassName) and aByWHouse.Checked then GetWHouseLevel(ANode)
      else if (ANode <> nil) and (FInfo.ID = utvID_Cash) then GetCashDeskLevel(ANode)
      else if (ANode <> nil) and (FInfo.ID = utvID_CashLess) then GetEntAccLevel(ANode)

      // and this section adds root nodes and sub-nodes too. fuck
      else begin
        case ViewType of
          vtAccountType:   gType := utv_gType_AccountType;
          vtAll:           gType := utv_gType_All;
          vtBank:          gType := utv_gType_Bank;
          vtCashDesks:     gType := utv_gType_CashDesks;
          vtChargeType:    gType := utv_gType_ChargeType;
          vtContrIn:       gType := utv_gType_ContrIn;
          vtContrOut:      gType := utv_gType_ContrOut;
          vtCountries:     gType := utv_gType_Countries;
          vtDiscCardGroup: gType := utv_gType_DiscCardGroup;
          vtDiscCards:     gType := utv_gType_DiscCards;
          vtDocs:          gType := utv_gType_Docs;
          vtFinances:      gType := utv_gType_Finances;
          vtInternet:      gType := utv_gType_Internet;
          vtKAgent:        gType := utv_gType_KAgent;
          vtMat:           gType := utv_gType_Mat;
          vtMatGroup:      gType := utv_gType_MatGroup;
          vtMeasures:      gType := utv_gType_Measures;
          vtOrderIn:       gType := utv_gType_OrderIn;
          vtOrderOut:      gType := utv_gType_OrderOut;
          vtPDIn:          gType := utv_gType_PayDocIn;
          vtPDOut:         gType := utv_gType_PayDocOut;
          vtPriceTypes:    gType := utv_gType_PriceTypes;
          vtRefs:          gType := utv_gType_Refs;
          vtReports:       gType := utv_gType_Reports;
          vtRSS:           gType := utv_gType_RSS;
          vtService:       gType := utv_gType_service;
          vtServices:      gType := utv_gType_Services;
          vtSvcGroup:      gType := utv_gType_SvcGroup;
          vtWBReestr:      gType := utv_gType_WBReestr;
          vtWebShops:      gType := utv_gType_WebShops;
          vtWHouse:        gType := utv_gType_WHouse;
          vtWMat:          gType := utv_gType_WMat;
        end;

        RootID := gType; // WTF????

        if (gType <> utv_gType_All) and cdsTree.Locate('gtype', gType, [])
          then RootID := cdsTree.fieldbyname('id').AsInteger;

        cdsTree.First;

        while not cdsTree.Eof do begin
          if not (((FieldByName('visible').AsInteger = 1) and (Self.FormStyle = fsMDIChild)) or (Self.FormStyle = fsNormal))
          then begin
            cdsTree.Next;
            Continue;
          end;

          if ANode = nil then begin // root sub-nodes
            if ((RootID = utv_gType_All) and (FieldByName('id').AsInteger = FieldByName('pid').AsInteger)) // root categories (documens root, etc)
               or ((ViewType = vtWMat)
                   and (FieldByName('gtype').AsInteger in [utv_gType_WMat, utv_gType_WBMov, utv_gType_WriteOff, utv_gType_WBRest,
                                                           utv_gType_Inventory, utv_gType_Bundles])) // Warehouse section root nodes
               or ((ViewType = vtFinances)
                   and (FieldByName('id').AsInteger in [utvID_PayDocs, utvID_Finance, utvID_MoneyMove])) // Finances section root nodes
                   
               or (((FieldByName('id').AsInteger = RootID) or (FieldByName('gtype').AsInteger = GType))  // root nodes for some section
                   and (ViewType in [vtAccountType, vtBank, vtCashDesks, vtChargeType, vtContrIn, vtContrOut, vtCountries,
                                     vtDiscCardGroup, vtDiscCards, vtDocs, vtInternet, vtKAgent, vtMat, vtMatGroup, vtMeasures,
                                     vtOrderIn, vtOrderOut, vtPDIn, vtPDOut, vtPriceTypes, vtRefs, vtReports, vtRSS, vtService, vtServices,
                                     vtSvcGroup, vtWBReestr, vtWebShops, vtWHouse]
                  ))
            then begin
              if (FieldByName('gtype').AsInteger in [utv_gType_WBMov, utv_gType_WriteOff, utv_gType_WBRest, utv_gType_Inventory,
                                                     utv_gType_Bundles, utv_gType_Bundling, utv_gType_UnBundling])
                 and (Self.FormStyle = fsNormal)
              then begin
                cdsTree.Next;
                Continue;
              end;

              FNode := tlMain.Items.Add(nil, cdsTree.fieldbyname('name').AsString);

              FInfo := TTreeItemInfo.Create;
              FInfo.ID := cdsTree.fieldbyname('id').AsInteger;
              FInfo.FunID := cdsTree.fieldbyname('funid').AsInteger;
              FInfo.DisplayedName := cdsTree.fieldbyname('name').AsString;
              FInfo.ImageIndex := cdsTree.fieldbyname('imageindex').AsInteger;
              FInfo.DisabledIndex := cdsTree.fieldbyname('disabledindex').AsInteger;

              if cdsFunc.Locate('funid', cdsTree.fieldbyname('funid').asinteger, [])
              then begin
                FInfo.refersClassName := cdsFunc.fieldbyname('classname').AsString;
                FInfo.FunName := FInfo.refersClassName;

                if -1 <> AnsiIndexStr(FInfo.refersClassName, ['f_RepKA', 'f_RepWH', 'f_RepFin', 'f_RepDocs', 'f_RepSvc', 'f_RepContr'])
                  then FInfo.refersClassName := TfmAllReports.ClassName;
              end;

              FInfo.NodeType := cdsTree.fieldbyname('isgroup').AsInteger;
              FInfo.ShowInTree := cdsTree.fieldbyname('showintree').AsInteger;
              FInfo.utv_gType := cdsTree.FieldByName('gtype').AsInteger;

              if FInfo.refersClassName = TfmServices.ClassName then FSvcNode := FNode;
              if FInfo.refersClassName = TfmDiscCards.ClassName then FDCNode := FNode;

              if cdsTree.FieldByName('funid').IsNull
                then FInfo.Enabled := True
                else FInfo.Enabled := GetUserAccess(cdsTree.fieldbyname('funid').asinteger, uaView);

              FNode.Data := FInfo;
              if FInfo.Enabled and ((FInfo.refersClassName <> '') and (FInfo.ShowInTree = 1)) or (FInfo.refersClassName = '')
                then tlMain.Items.AddChild(FNode, '');

              if (ViewType in [vtWMat, vtMat, vtRefs]) then begin
                if not (cdsTree.FieldByName('gtype').AsInteger in [utv_gType_WaybillMove, utv_gType_WriteOff, utv_gType_WBRest, utv_gType_Inventory,
                                                                   utv_gType_Bundles, utv_gType_Bundling, utv_gType_UnBundling])
                   then WMatNode := FNode;
                //FNode.Expand(False);
              end;

              if (FInfo.Enabled) and (1 = cdsTree.FieldByName('showexpanded').AsInteger)
                 or ((ViewType in [vtMat, vtKAgent, vtServices]) and (Self.FormStyle = fsNormal))
              then FNode.Expand(False);

              if (RootID = utv_gType_Finances) and (Self.FormStyle = fsNormal) then Break;
            end; // if RootID = utv_gType_All ...
          end // if Anode = nil (root sub-nodes)

          else begin // adding regular sub-node
            if (cdsTree.FieldByName('pid').AsInteger = TTreeItemInfo(ANode.Data).ID)
               and (cdsTree.FieldByName('pid').AsInteger <> cdsTree.FieldByName('id').AsInteger)
            then begin
              if (cdsTree.FieldByName('funid').AsInteger = funID_Options) // let options be accessible from main menu only.
                 or (not ShowPrices and (cdsTree.FieldByName('funid').AsInteger = funID_PriceTypes))
              then begin
                cdsTree.Next;
                Continue;
              end;

              case CountryRules.AR of
                accRul_RU:
                  if cdsTree.FieldByName('funid').AsInteger = funID_TaxWB then begin
                    cdsTree.Next;
                    Continue;
                  end;

                {accRul_UA:
                  if cdsTree.FieldByName('funid').AsInteger = funID_Invoices then begin
                    cdsTree.Next;
                    Continue;
                  end;
                }

                else // other accounting rules
                  case cdsTree.FieldByName('funid').AsInteger of
                    funID_TaxWB:
                      begin
                        cdsTree.Next;
                        Continue;
                      end;
                  end; // case cdsTree.FieldByName('funid').AsInteger of

              end; //case CountryRules.AR

              FNode := tlMain.Items.AddChild(ANode, cdsTree.fieldbyname('name').AsString);

              FInfo := TTreeItemInfo.Create;
              FInfo.ID := cdsTree.fieldbyname('id').AsInteger;
              FInfo.DisplayedName := cdsTree.fieldbyname('name').AsString;
              FInfo.FunID     := cdsTree.fieldbyname('funid').AsInteger;
              FInfo.utv_gType := cdsTree.FieldByName('gtype').AsInteger;

              FInfo.ImageIndex    := cdsTree.fieldbyname('imageindex').AsInteger;
              FInfo.DisabledIndex := cdsTree.fieldbyname('disabledindex').AsInteger;

              if FInfo.ID = utvID_Cash then FCashNode := FNode;
              if FInfo.ID = utvID_CashLess then FCashlessNode := FNode;

              if cdsFunc.Locate('funid', cdsTree.fieldbyname('funid').asinteger, []) then begin
                FInfo.refersClassName := cdsFunc.fieldbyname('classname').AsString;
                FInfo.FunName := FInfo.refersClassName;

                if -1 <> AnsiIndexStr(FInfo.refersClassName, ['f_RepKA', 'f_RepWH', 'f_RepFin', 'f_RepDocs', 'f_RepSvc', 'f_RepContr'])
                  then FInfo.refersClassName := TfmAllReports.ClassName;

                // hiding defunct features  
                if -1 <> AnsiIndexStr(FInfo.refersClassName, ['TfmUserGroups', 'TfmAssemblies'])
                then begin
                  FInfo.refersClassName := TfmNA.ClassName;
                  FInfo.utv_gType := 0;
                end;
              end;

              FInfo.NodeType   := cdsTree.fieldbyname('isgroup').AsInteger;
              FInfo.ShowInTree := cdsTree.fieldbyname('showintree').AsInteger;
              FInfo.FunID      := cdsTree.fieldbyname('funid').AsInteger;

              if FInfo.refersClassName = TfmServices.ClassName  then FSvcNode := FNode;
              if FInfo.refersClassName = TfmDiscCards.ClassName then FDCNode := FNode;

              if cdsTree.FieldByName('gtype').AsInteger = utv_gType_WMat then begin
                FInfo.utv_gType := utv_gType_WMat;
                WMatNode := FNode;
              end;

              if cdsTree.FieldByName('funid').IsNull
                then FInfo.Enabled := True
                else FInfo.Enabled := GetUserAccess(cdsTree.fieldbyname('funid').asinteger, uaView);

              FNode.Data := FInfo;

              if FInfo.Enabled and ((FInfo.refersClassName <> '') and (FInfo.ShowInTree = 1)) or (FInfo.refersClassName = '')
                then tlMain.Items.AddChild(FNode, '');

              if (cdsTree.FieldByName('showexpanded').AsInteger = 1) and (FInfo.Enabled)
                then FNode.Expand(False);
            end; // adding sub-node
          end; // if Anode = nil (else)

          cdsTree.Next;
        end; //while not cdsTree.Eof

        if (ANode = nil) and (Self.ViewType in [vtDocs, vtWMat, vtRefs]) and cdsTree.Locate('gtype', utv_gType_RecycleBin, [])
        then begin
           FNode := tlMain.Items.Add(nil, cdsTree.fieldbyname('name').AsString);

           FInfo := TTreeItemInfo.Create;
           FInfo.ID := cdsTree.fieldbyname('id').AsInteger;
           FInfo.FunID := cdsTree.fieldbyname('funid').AsInteger;
           FInfo.DisplayedName := rs('Tree', 'main' + IntToStr(cdsTree.fieldbyname('id').AsInteger));
           FInfo.ImageIndex := cdsTree.fieldbyname('imageindex').AsInteger;
           FInfo.DisabledIndex := cdsTree.fieldbyname('disabledindex').AsInteger;

           if cdsFunc.Locate('funid', cdsTree.fieldbyname('funid').asinteger, [])
             then FInfo.refersClassName := cdsFunc.fieldbyname('classname').AsString;

           FInfo.FunName := FInfo.refersClassName;
           FInfo.Enabled := GetUserAccess(cdsTree.fieldbyname('funid').asinteger, uaView);

           FInfo.NodeType := cdsTree.fieldbyname('isgroup').AsInteger;
           FInfo.ShowInTree := cdsTree.fieldbyname('showintree').AsInteger;
           FInfo.utv_gType := cdsTree.FieldByName('gtype').AsInteger;
           FNode.Data := FInfo;
        end;
      end;
      cdsTree.GotoBookmark(BM);

    finally
      cdsTree.FreeBookmark(BM);
      NotChangeDetail := False;
    end;
  end; // with cdsTree

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aDirUpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aDirUpExecute') else _udebug := nil;{$ENDIF}

  if (tlMain.Selected <> nil) and (tlMain.Selected.Parent <> nil)
    then tlMain.Selected := tlMain.Selected.Parent;

  if (tlMain.Selected <> nil) and (TTreeItemInfo(tlMain.Selected.Data).NodeType = nt_Undefined)
    then FrameList.FcurrFrame.DoUp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aViewExecute(Sender: TObject);
  (*var
     Pos: TPoint;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aViewExecute') else _udebug := nil;{$ENDIF}

  Pos := panBar.ClientToScreen(Point(btnView.Left, btnView.Top+btnView.Height+1));
  pmGroup.Popup(Pos.X, Pos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.GetCurrencyLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    cdsT: TClientDataSet;
    //CurrInfo: TCurrencyInfo;
    BaseCurrName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetCurrencyLevel') else _udebug := nil;{$ENDIF}

    BaseCurrName := GetBaseCurrName(dmData.SConnection);
    cdsT := newDataSet;

    with newDataSet do
     try
      DeleteTreeItemInfo(ANode);
      ANode.DeleteChildren;
      ProviderName := 'pCC_CurrencyList';
      Open;

      cdsT.ProviderName := 'pCC_CurrencyRate';
      cdsT.FetchParams;
      cdsT.Params.ParamByName('ondate').AsDateTime := OnDate;
      cdsT.Open;
      while not Eof do begin

        if FieldByName('def').AsInteger = 1
          then FNode := tlMain.Items.AddChildFirst(ANode, fieldbyname('shortname').AsString)
          else FNode := tlMain.Items.AddChild(ANode, fieldbyname('shortname').AsString);

        FInfo := TTreeItemInfo.Create;
        FInfo.ID := fieldbyname('currid').AsInteger;
        FInfo.FunID := 3;
        FInfo.DisplayedName := fieldbyname('shortname').AsString;
        FInfo.ImageIndex := ANode.ImageIndex;
        FInfo.DisabledIndex := ANode.ImageIndex;
        FInfo.refersClassName := '';
        FInfo.NodeType := nt_Undefined;
        FInfo.Enabled := True;

        {CurrInfo := TCurrencyInfo.Create;
        CurrInfo.ID := FNode.Values[0];
        CurrInfo.Name := fieldbyname('name').AsString;
        CurrInfo.ShortName := FNode.Values[1];
        if cdsT.Locate('currid', FNode.Values[0], []) then begin
          CurrInfo.OnDate := cdsT.fieldbyname('ondate').AsDateTime;
          CurrInfo.OnValue := cdsT.fieldbyname('onvalue').AsFloat;
          CurrInfo.BaseCurr := BaseCurrName;
        end;
        FNode.Values[6] := Integer(CurrInfo);
        }

        FInfo.FullName := fieldbyname('name').AsString;
        FNode.Data := FInfo;
        Next;
      end;

      Close;
      cdsT.Close;

     finally
       Free;
       cdsT.Free;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//=========================================================================
function TfrmCCMain.SetTreeItem(ANode: TTreeNode; const AValue: Integer; ASelect: boolean = True): TTreeNode;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetTreeItem') else _udebug := nil;{$ENDIF}

  Result := nil;
  if (ANode.Count > 0) and (ANode.Item[0].Text = '') then GetLevel(ANode);

  for i := 0 to ANode.Count - 1 do
    if TTreeItemInfo(ANode.Item[i].Data).ID = AValue then begin
      if not ANode.Expanded then ANode.Expand(False);

      if ASelect then tlMain.Selected := ANode.Item[i];

      Result := ANode.Item[i];

      Break;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSetTreeItem(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetTreeItem') else _udebug := nil;{$ENDIF}

   if TTreeItemInfo(tlMain.Selected.Data).refersClassName = TfmCurrency.ClassName then begin
     if tlMain.Selected.Item[0] <> nil then begin
       if tlMain.Selected.Item[0].Text = '' then begin
         GetLevel(tlMain.Selected);
         tlMain.Selected.Expand(False);
       end;

       SetTreeItem(tlMain.Selected, M.WParam);
     end;
   end
   else if (TTreeItemInfo(tlMain.Selected.Data).refersClassName = TfmMaterials.ClassName) then begin
     if not FInSearch and (M.LParam <> -1)
       then LocateMatGroup(tlMain.Selected, M.WParam, M.LParam, True)
       else LocateMatGroup(tlMain.Selected, M.WParam, 0, True);
   end
   else if (TTreeItemInfo(tlMain.Selected.Data).refersClassName = TfmServices.ClassName) then begin
     if not FInSearch and (M.LParam <> -1)
       then LocateSvcGroup(tlMain.Selected, M.WParam, M.LParam, True)
       else LocateSvcGroup(tlMain.Selected, M.WParam, 0);
   end
   else if (TTreeItemInfo(tlMain.Selected.Data).refersClassName = TfmDiscCards.ClassName) then begin
     if not FInSearch and (M.LParam <> -1)
       then LocateDiscGroup(tlMain.Selected, M.WParam, M.LParam, True)
       else LocateDiscGroup(tlMain.Selected, M.WParam, 0);
   end
   else if (TTreeItemInfo(tlMain.Selected.Data).refersClassName = TfmWMat.ClassName) then begin
     if aByGroup.Checked
       then LocateMatGroup(tlMain.Selected, M.WParam)
       else LocateWHouse(tlMain.Selected, M.WParam);
   end
   else if (TTreeItemInfo(tlMain.Selected.Parent.Data).refersClassName = TfmKAgent.ClassName) then begin
     LocateKAgent(tlMain.Selected, M.WParam);
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;
  FrameList.SetOnDate(OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMAddTreeItem(var M: TMessage);
  var
    FNode, DetNode: TTreeNode;
    FInfo: TTreeItemInfo;
    //i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMAddTreeItem') else _udebug := nil;{$ENDIF}

  FNode := tlMain.Selected;

  case PssInfo(pointer(M.WParam)).Param of
      1: if TTreeItemInfo(FNode.Data).NodeType = nt_Undefined
         then begin
           TTreeItemInfo(FNode.Data).DisplayedName := PssInfo(pointer(M.WParam)).Name;
           FNode.Text := PssInfo(pointer(M.WParam)).Name;
         end
         else if (FNode.Item[0].Text <> '') then begin
           DetNode := GetDetNode(FNode, PssInfo(pointer(M.WParam)).ID);

           if DetNode <> nil then begin
             TTreeItemInfo(DetNode.Data).DisplayedName := PssInfo(pointer(M.WParam)).Name;
             DetNode.Text := PssInfo(pointer(M.WParam)).Name;
           end;
         end;

      2: begin
          if (FNode.Item[0].Text <> '') then begin
            if TTreeItemInfo(FNode.Data).NodeType = nt_Undefined
              then FNode := tlMain.Items.AddChild(FNode.Parent, PssInfo(pointer(M.WParam)).Name)
              else FNode := tlMain.Items.AddChild(FNode, PssInfo(pointer(M.WParam)).Name);

            FInfo := TTreeItemInfo.Create;
            FInfo.ID := PssInfo(pointer(M.WParam)).ID;
            FInfo.DisplayedName := PssInfo(pointer(M.WParam)).Name;
            FInfo.ImageIndex := TTreeItemInfo(FNode.Parent.Data).ImageIndex;
            FInfo.ImageIndex := TTreeItemInfo(FNode.Parent.Data).FunID;
            FInfo.refersClassName := '';
            FInfo.Enabled := True;
            FInfo.NodeType := nt_Undefined;

            FNode.ImageIndex := FInfo.ImageIndex;
            FNode.SelectedIndex := FInfo.ImageIndex;
            FNode.Data := FInfo;
          end;
         end;

      3: begin
           //if FNode.Values[4]=-1 then tlMain.FocusedNumber := FNode.AbsoluteIndex-1;
           DetNode := GetDetNode(FNode, PssInfo(pointer(M.WParam)).ID);
           
           if DetNode <> nil then begin
             TTreeItemInfo(DetNode.Data).Free;
             DetNode.Free;
           end;
          end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.GetDetNode(ANode: TTreeNode; const AID: integer): TTreeNode;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetDetNode') else _udebug := nil;{$ENDIF}

  Result := nil;
  for i := 0 to ANode.Count - 1 do
   if (ANode.Item[i].Text <> '') and (TTreeItemInfo(ANode.Item[i].Data).ID = AID) then begin
     Result := ANode.Item[i];
     {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
     Exit;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreeRefreshExecute(Sender: TObject);
  var
    Exp: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeRefreshExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;
  Exp := tlMain.Selected.Expanded;

  if tlMain.Selected.Count > 0 then GetLevel(tlMain.Selected);
  if Exp then tlMain.Selected.Expand(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMRefreshBin(var M: TMessage);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMRefreshBin') else _udebug := nil;{$ENDIF}

  for i := 0 to FrameList.FramesCount - 1 do
    if FrameList.Items[i] is TfmRecycleBin then FrameList.Items[i].NeedRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMRestoreFromBin(var M: TMessage);
  (*var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMRestoreFromBin') else _udebug := nil;{$ENDIF}

  if cdsFunc.Locate('funid', M.WParam, []) then
    for i := 0 to FrameList.FramesCount - 1 do
     if FrameList.Items[i].ClassName=cdsFunc.FieldByName('classname').AsString
      then FrameList.Items[i].DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.aShowTreeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aShowTreeExecute') else _udebug := nil;{$ENDIF}

  aShowTree.Checked := not aShowTree.Checked;
  panLeft.Visible := aShowTree.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMResetStyle(var M: TMessage);
  (*var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMResetStyle') else _udebug := nil;{$ENDIF}

  SetStyle(Self, IStyle);
  for i := 0 to FrameList.FramesCount - 1 do
    SendMessage(FrameList.Items[i].Handle, WM_RESETSTYLE, 0, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.MakeWebCatNode(FNode, ParentNode: TTreeNode; apTreeNode: TapTreeNode);
  var
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.MakeWebCatNode') else _udebug := nil;{$ENDIF}

  apTreeNode.RTData.Ptr['CCMainTree' + IntToStr(Integer(Self))] := FNode;
  FNode.ImageIndex := 45;
  FNode.SelectedIndex := FNode.ImageIndex;

  FInfo := TTreeItemInfo.Create;
  FNode.Data := FInfo;
  FInfo.ID := apTreeNode.ID;
  FInfo.DisplayedName := apTreeNode.Name;
  FInfo.FunID := funID_Products;
  FInfo.NodeType := nt_WebStoreCategory;

  FInfo.refersClassName := TTreeItemInfo(ParentNode.Data).refersClassName;
  FInfo.Enabled := True;
  FInfo.ImageIndex := FNode.ImageIndex;

  FInfo.utv_gType := TTreeItemInfo(ParentNode.Data).utv_gType;
  FInfo.UserData := Integer(apTreeNode);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetMatGroupLevel(ANode: TTreeNode; ANodeType: integer);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    nodeData: TapTreeNodeData;
    node: TapTreeNode;
    apt: TapTree;
    errors: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetMatGroupLevel') else _udebug := nil;{$ENDIF}

  with newDataSet do try
    tlMain.Items.BeginUpdate;

    DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;

    if TTreeItemInfo(ANode.Data).NodeType = nt_WebStore then begin // loading categories tree
      apt := TapTree(TTreeItemInfo(ANode.Data).UserData);

      if apt = nil then begin // loading tree now
        apt := wsGroupTrees.byName(tree_wwwGroups + IntToStr(TTreeItemInfo(ANode.Data).ID));
        // creating and loading new if not found. loading only categories own data (OwnerID=0)
        if apt = nil then apt := wsGroupTrees.Add(tree_wwwGroups + IntToStr(TTreeItemInfo(ANode.Data).ID), cfOwnerTypeWebShop, 0);
        apt.RTData.Ptr['CCMainTree' + IntToStr(Integer(Self))] := ANode;

        errors := FixGroupsTree(apt, WebCatsLangTree);
        if errors > 0 then ANode.Text := ANode.Text + '. ' + Format(rs('fmMaterials', 'err_bad_cats'), [errors, ANode.Text]);
        TTreeItemInfo(ANode.Data).UserData := Integer(apt);
      end;

      if apt.BrokenItems = 0 then begin // don't want to show if tree is broken
        node := apt.FirstNode; // if there is no children nodes then FirstNode returns itself.
        while (node <> apt) and (node <> nil) do begin
          FNode := nil;
          if node.Parent = apt
            then FNode := tlMain.Items.AddChildObject(ANode, node.name, node) // make it topmost nodes
            else if node.FindData(0, 0).asInteger = 0 // skipping non-master nodes
                 then FNode := tlMain.Items.AddChildObject(TTreeNode(node.Parent.RTData.Ptr['CCMainTree' + IntToStr(Integer(Self))]), node.Name, node); // group node

          if FNode <> nil then begin
            MakeWebCatNode(FNode, ANode, node);

            (*// expanding all subtree
            if node.FindData(pid, -1).asInteger = 1
              then while FNode <> nil do begin
                FNode.Expand(False);
                FNode := FNode.Parent;
              end;
            *)
          end;

          node := node.NextNode;
        end; // while node...
      end; // if apt.BrokenItems = 0
    end // adding webstore categories tree

    else begin // local product (sub-)category
      if TTreeItemInfo(ANode.Data).NodeType = ANodeType
      then begin
        ProviderName := 'pMatGroup_GetLevel';
        FetchParams;
        Params.ParamByName('pid').AsInteger := TTreeItemInfo(ANode.Data).ID;
      end
      else ProviderName := 'pMatGroup_GetRootLevel';

      Open;

      while not Eof do begin
        FNode := tlMain.Items.AddChild(ANode, fieldbyname('name').AsString);
        FInfo := TTreeItemInfo.Create;
        FInfo.ID := fieldbyname('grpid').AsInteger;
        FInfo.DisplayedName := fieldbyname('name').AsString;
        FInfo.FunID := funID_Products;
        FInfo.NodeType := ANodeType;

        FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
        FInfo.Enabled := True;
        FInfo.ImageIndex := 14;

        if ANodeType = -3
          then FInfo.utv_gType := 4
          else FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;

        FNode.Data := FInfo;
        tlMain.Items.AddChild(FNode, '');

        Next;
      end;
      Close;
    end; // local product (sub-)category

    //--------------------------------------------------------------------------------
    if (TTreeItemInfo(ANode.Data).NodeType <> ANodeType) and (TTreeItemInfo(ANode.Data).NodeType <> nt_WebStore)
    then begin // under root node adding just web shops
      ProviderName := 'pWebShops_List';
      Open;
      while not eof do begin
        FNode := tlMain.Items.AddChild(ANode, fieldbyname('name').AsString);
        if FWebShopNodes = nil then FWebShopNodes := TList.Create;
        FWebShopNodes.Add(FNode);

        FInfo := TTreeItemInfo.Create;
        FInfo.ID := fieldbyname('id').AsInteger;
        FInfo.DisplayedName := fieldbyname('name').AsString;
        FInfo.FunID := funID_Products;
        FInfo.NodeType := nt_WebStore;

        FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
        FInfo.Enabled := True;
        FInfo.ImageIndex := 210;

        FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;

        apt := wsGroupTrees.byName(tree_wwwGroups + IntToStr(FInfo.ID));
        if apt <> nil then apt.RTData.Ptr['CCMainTree' + IntToStr(Integer(Self))] := FNode;

        FInfo.UserData := Integer(apt);

        FNode.Data := FInfo;
        tlMain.Items.AddChild(FNode, '');

        Next;
      end; // webshops list
      Close;

    end; // webcats adding

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.LocateMatGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
  var
    FMatNode: TTreeNode;
    s: string;
    IsMat: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  //------------------------------------------------------------------
  function GetMatNode(ANode: TTreeNode; ANodeType: integer): TTreeNode;
  begin
    if TTreeItemInfo(ANode.Data).NodeType <> ANodeType
      then Result := ANode
      else Result := GetMatNode(ANode.Parent, ANodeType);
  end;

  //------------------------------------------------------------------
  procedure ExpandToParent(ANode: TTreeNode);
  begin
    if (ANode.Parent <> nil) and not ANode.Parent.Expanded then begin
      ANode.Parent.Expand(False);
      ExpandToParent(ANode.Parent);
    end;
  end;

  //------------------------------------------------------------------
  function LocateNode(AValue: integer): boolean;
    var i: integer;
  begin
    Result := False;
    for i := 0 to tlMain.Items.Count - 1 do begin
      if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).ID = AValue)
          and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = -2)
      then begin

        ExpandToParent(tlMain.Items[i]);
        tlMain.Selected := tlMain.Items[i];

        if ANew then tlMain.Selected.DeleteChildren;

        Result := True;
        Exit;
      end
      else if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).ID = APID)
              and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = -2) and ANew
      then GetLevel(tlMain.Items[i]);
    end;
  end;

  //------------------------------------------------------------------
  procedure GetParent(AID: integer; var s: string; DS: TDataSet);
    var BM: TBookmark;
  begin
    BM := DS.GetBookmark;
    try
      DS.First;
      while not DS.Eof do begin
        if (DS.FieldByName('grpid').AsInteger = AID) and (DS.FieldByName('pid').AsInteger <> AID) then begin
          s := DS.FieldByName('pid').AsString + ',' + s;
          GetParent(DS.FieldByName('pid').AsInteger, s, DS);
        end;
        DS.Next;
      end;
      DS.GotoBookmark(BM);

    finally
      DS.FreeBookmark(BM);
    end;
  end;

  //------------------------------------------------------------------
  function GetParentSeq(AID: integer): string;
  begin
    Result := IntToStr(AID);

    with newDataSet do
     try
       ProviderName := 'pMatGroup_List';
       Open;
       GetParent(AID, Result, Fields[0].DataSet);
       Close;

     finally
       Free;
     end;
  end;

  //------------------------------------------------------------------
  procedure ExpandSeq(s: string);
    var
      i: integer;
      FNode: TTreeNode;
      wc: integer;
  begin
    FNode := FMatNode;
    wc := WordCount(s, [',']);

    for i := 1 to wc do begin
      //if (FNode.Count = 0) then GetLevel(FNode);
      if i < wc
        then FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])), False)
        else FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])));
    end;
  end;

//- MAIN FUNC -----------------------------------------------------------------
begin
  if ANode = nil then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LocateMatGroup') else _udebug := nil;{$ENDIF}

  if AID = 0 then begin
    tlMain.Selected := FMatNode;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if Self.FormStyle = fsNormal
    then IsMat := (ViewType = vtMat)
    else IsMat := FrameList.FcurrFrame is TfmMaterials;

  if IsMat
    then FMatNode := GetMatNode(ANode, -2)
    else FMatNode := GetMatNode(ANode, -3);

  if (FMatNode.Count = 0) or (FMatNode.Item[0].Text = '') or ((APID = 0) and ANew) or ((APID = AID) and ANew)
    then GetLevel(FMatNode);

  tlMain.Items.BeginUpdate;

  try
    if (APID <> 0) and not ANew and (ANode.Count > 0) and (ANode.Item[0].Text = '')
      then GetLevel(ANode);

    NotChangeDetail := True;
    //if ANew and (APID<>0) then LocateNode(APID);
    if not LocateNode(AID) then begin
      s := GetParentSeq(AID);
      ExpandSeq(s);
    end;

  finally
    NotChangeDetail := False;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreeColExpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeColExpExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  with tlMain.Selected do
   if Expanded
     then Collapse(False)
     else Expand(False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.pmTreePopup(Sender: TObject);
  var
    SelNodeInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.pmTreePopup') else _udebug := nil;{$ENDIF}

  if tlMain.Selected <> nil
    then SelNodeInfo := tlMain.Selected.Data
    else SelNodeInfo := nil;

  if (tlMain.Selected <> nil) and tlMain.Selected.Expanded
    then aTreeColExp.Caption := rs('Common', 'Collapse')
    else aTreeColExp.Caption := rs('Common', 'Expand');

  aTreeRename.Visible := (tlMain.Selected <> nil) and (SelNodeInfo.ID > 0)
    and (SelNodeInfo.refersClassName <> TfrmOptions.ClassName)
    and SelNodeInfo.Enabled;

  aTreeRefresh.Visible := (PopupNode <> nil) and (tlMain.Selected <> nil) and (SelNodeInfo.refersClassName <> TfrmOptions.ClassName)
    and SelNodeInfo.Enabled;

  aTreeDel.Visible := (tlMain.Selected <> nil)
    and ((SelNodeInfo.NodeType = -2)
         or (SelNodeInfo.NodeType = nt_WebStoreCategory)
         or  (SelNodeInfo.NodeType = nt_SvcCat)
         or  (SelNodeInfo.NodeType = nt_DiscCardCat));

  sepDel.Visible := aTreeDel.Visible;
  aTreeProps.Visible := (tlMain.Selected <> nil) and SelNodeInfo.Enabled;

  aTreeNew.Visible := (tlMain.Selected <> nil) and (PopupNode <> nil)
    and
    ((SelNodeInfo.NodeType = -2)
     or (SelNodeInfo.NodeType = nt_SvcCat)
     or (SelNodeInfo.NodeType = nt_DiscCardCat)
     or (PopupNode = FDCNode)
     or (SelNodeInfo.utv_gType = utv_gType_Services)
     or (SelNodeInfo.utv_gType = utv_gType_Mat)
    );

  aPaste.Visible := aTreeDel.Visible;
  aPaste.Enabled := aPaste.Visible;
  sepClip.Visible := aPaste.Visible;

  aNewDCGroup.Visible := aTreeNew.Visible and ((PopupNode = FDCNode) or (SelNodeInfo.NodeType = nt_DiscCardCat));

  aTreeGrpNew.Visible := not aNewDCGroup.Visible;

  if aTreeNew.Visible and (PopupNode <> nil)
    then if (TTreeItemInfo(PopupNode.Data).NodeType = -2) or (SelNodeInfo.utv_gType = 101)
      then imnuNewGrp.Caption := rs('TfrmCCMain', 'MatGroupD')
      else imnuNewGrp.Caption := rs('fmServices', 'SvcGroupD');

  miNewWebCat.Visible := (SelNodeInfo.NodeType = nt_WebStore) or (SelNodeInfo.NodeType = nt_WebStoreCategory);
  miNewWebCatLabel.Visible := miNewWebCat.Visible;
  miNewWebCatSep.Visible := miNewWebCat.Visible;
  imnuNewGrp.Visible := not miNewWebCat.Visible; // hide std "new group" item

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.UpdateUserTreeView(ANode: TTreeNode; const S: String): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdateUserTreeView') else _udebug := nil;{$ENDIF}

  Result := False;
  if Trim(S) = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
    try
      try
        ProviderName := 'pUserTreeView_UpdName';
        FetchParams;
        Params.ParamByName('id').AsInteger := TTreeItemInfo(ANode.Data).ID;
        Params.ParamByName('name').AsString := trim(S);
        Params.ParamByName('shortname').AsString := LangName;
        Execute;
        Result := True;

      finally
        Free;
      end;

    except
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.CancelNodeEditing(ANode: TTreeNode; const AText: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.CancelNodeEditing') else _udebug := nil;{$ENDIF}

  ssMessageDlg(AText, ssmtError, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.UpdateMatGroup(ANode: TTreeNode; const S: string): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdateMatGroup') else _udebug := nil;{$ENDIF}

  Result := False;
  if S = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
    try
      try
        ProviderName := 'pMatGroup_UpdName';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := TTreeItemInfo(ANode.Data).ID;
        Params.ParamByName('name').AsString := S;
        Execute;
        Result := True;

      finally
        Free;
      end;

    except
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreeRenameExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeRenameExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  tlMain.Selected.EditText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.DeleteTreeItemInfo(ANode: TTreeNode);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  procedure ExecOnChildren(ANode: TTreeNode);
    var i: integer;
  begin
    if ANode.Data <> nil then TTreeItemInfo(ANode.Data).Free;

    for i := 0 to ANode.Count - 1 do ExecOnChildren(ANode.Item[i]);
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.DeleteTreeItemInfo') else _udebug := nil;{$ENDIF}

  try
    if ANode = nil then begin
      for i := 0 to tlMain.Items.Count - 1 do
        if ANode.Data <> nil then TTreeItemInfo(tlMain.Items[i].Data).Free;
    end
    else for i := 0 to ANode.Count - 1 do ExecOnChildren(ANode.Item[i]);

  except
    on e: Exception do debuginstantlog('!ERROR TfrmCCMain.DeleteTreeItemInfo: except: ' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainGetImageIndex(Sender: TObject; Node: TTreeNode);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainGetImageIndex') else _udebug := nil;{$ENDIF}

  if not Assigned(Node.Data) then Exit;

  with TTreeItemInfo(Node.Data) do begin
    if Enabled then begin
      if ( (ID > 0) and ( (NodeType = nt_DiscCardCat) or (NodeType = nt_SvcCat) or (NodeType = -3) or (NodeType = -2) ) )
         or ( (NodeType <> -4) and (ID in [utvID_PayDocs, utvID_Slips, utvID_Contracts, utvID_Returning, utvID_Orders]) )
      then begin
        if Node.Expanded then begin
          Node.ImageIndex := 49;
          Node.SelectedIndex := 49;
        end
        else begin
          Node.ImageIndex := 48;
          Node.SelectedIndex := 48;
        end;
      end
      else begin
        Node.ImageIndex := ImageIndex;
        Node.SelectedIndex := ImageIndex;
      end;
    end
    else begin
      Node.ImageIndex := DisabledIndex;
    end;
  end; // with

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainExpanding') else _udebug := nil;{$ENDIF}

  if (Node.Count = 1) and (Node.Item[0].Text = '') then GetLevel(Node);
  AllowExpansion := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainChange(Sender: TObject; Node: TTreeNode);
  var
    fmTemp: TssBaseFrame;
    AInfo: TGrpInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainChange') else _udebug := nil;{$ENDIF}

  if Node <> nil then begin
    CurrentNode := TTreeItemInfo(Node.Data).utv_gType;

    if not NotChangeDetail then begin
      NotChangeDetail := True;

      try
        if TTreeItemInfo(Node.Data).refersClassName = TfrmOptions.ClassName
        then begin
          with TfrmOptions.Create(nil) do
            try
              ShowModal;
              tlMain.Selected := PrevNode;

            finally
              free;
            end;
        end // Options
        else
          case TTreeItemInfo(Node.Data).NodeType of
            nt_Any:
              begin
                panData.Visible := True;

                if FrameList.CurrentFrame = TfmUserMonitor.ClassName then FrameList.FcurrFrame.StopProcess;

                if not FrameList.FrameInList(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType)
                then begin
                  fmTemp := LoadFrame(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);

                  if fmTemp <> nil then begin
                    FrameList.Add(fmTemp, True);

                    if FrameList.FcurrFrame is TfmWMat
                      then TfmWMat(FrameList.FCurrFrame).ByW := aByWHouse.Checked;

                    fmTemp.DoUp;
                    fmTemp.Parent := panData;

                    if fmTemp.ClassName = TfmKAgent.ClassName then fmTemp.DoRefresh(0);

                    if fmTemp.ClassName = TfmFinance.ClassName then begin
                      if TTreeItemInfo(Node.Data).NodeType = 0
                        then fmTemp.DoRefresh(0, -TTreeItemInfo(Node.Data).ID)
                        else fmTemp.DoRefresh(TTreeItemInfo(Node.Data).ID, -TTreeItemInfo(Node.Data).NodeType);
                    end;

                    Application.ProcessMessages;
                    fmTemp.DoShow;
                    SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
                  end; // if fmTemp <> nil
                end // if not FrameList.FrameInList(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType)

                else begin // frame is already created
                  FrameList.SetFrame(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);
                  FrameList.FCurrFrame.DoUp;
                  FrameList.FcurrFrame.DoRefreshFindParams;

                  if FrameList.CurrentFrame = TfmFinance.ClassName then begin
                    if TTreeItemInfo(Node.Data).NodeType = 0
                      then FrameList.FcurrFrame.DoRefresh(0, -TTreeItemInfo(Node.Data).ID)
                      else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, -TTreeItemInfo(Node.Data).NodeType);
                  end;

                  if FrameList.FcurrFrame is TfmWMat
                    then TfmWMat(FrameList.FCurrFrame).ByW := aByWHouse.Checked;

                  if (FrameList.FcurrFrame is TfmWMat)
                     or (-1 <> AnsiIndexText(FrameList.CurrentFrame, [TfmMaterials.ClassName, TfmServices.ClassName, TfmDiscCards.ClassName]))
                  then begin
                    FrameList.FCurrFrame.DoRefresh(0, 2);
                    //FrameList.FcurrFrame.DoActivate;
                  end
                  else if (FrameList.CurrentFrame = TfmKAgent.ClassName)
                       then FrameList.FCurrFrame.DoRefresh(1, 1)
                       else FrameList.FcurrFrame.DoActivate;

                  SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);

                  if FrameList.CurrentFrame = TfmUserMonitor.ClassName
                    then FrameList.FcurrFrame.StartProcess;
                end; // if not FrameList.FrameInList(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType) else

                if FrameList.CurrentFrame <> '' then FrameList.FcurrFrame.UpdateActionList;
              end;

            //---------------------------------------------------------------------------------------------------
            nt_Top:
              begin
                ReloadGroup(Node);
                panData.Visible := False;
              end;

            //---------------------------------------------------------------------------------------------------
            nt_Undefined:
              begin
                if FrameList.CurrentFrame = TfmUserMonitor.ClassName then FrameList.FcurrFrame.StopProcess;

                if not FrameList.FrameInList(TTreeItemInfo(Node.Parent.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType)
                then begin
                  fmTemp := LoadFrame(TTreeItemInfo(Node.Parent.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);

                  if fmTemp <> nil then begin
                    FrameList.Add(fmTemp, True);
                    FrameList.FcurrFrame.DoDetRefresh(TTreeItemInfo(Node.Data).ID, 0);
                    FrameList.FcurrFrame.DoDown;
                    fmTemp.Parent := panData;
                    fmTemp.DoShow;
                    SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
                  end;
                end
                else begin
                  FrameList.SetFrame(TTreeItemInfo(Node.Parent.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);
                  FrameList.FcurrFrame.DoDetRefresh(TTreeItemInfo(Node.Data).ID, 0);
                  FrameList.FcurrFrame.DoDown;
                  FrameList.FcurrFrame.DoRefreshFindParams;
                  SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
                end;
                panData.Visible := True;
              end;

           //---------------------------------------------------------------------------------------------------
           //nt_Internet, nt_webShops, nt_RSS,
           nt_WebStoreCategory,
           -2, -3, -4, // Products listing modes
           nt_BusinessPartner, nt_SvcCat, nt_DiscCardCat, nt_Finances, nt_BankAccounts:
             begin
               if FrameList.CurrentFrame = TfmUserMonitor.ClassName then FrameList.FcurrFrame.StopProcess;

               if not FrameList.FrameInList(TTreeItemInfo(Node.Parent.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType)
               then begin // frame does not exist yet
                 fmTemp := LoadFrame(TTreeItemInfo(Node.Parent.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);

                 if fmTemp <> nil then begin
                   FrameList.Add(fmTemp, True);

                   if TTreeItemInfo(Node.Data).ID > 0 then begin
                     if FrameList.FcurrFrame is TfmWMat then begin
                       TfmWMat(FrameList.FCurrFrame).ByW     := aByWHouse.Checked;
                       TfmWMat(FrameList.FCurrFrame).ShowGrp := btnShowGrp.Checked;
                       TfmWMat(FrameList.FCurrFrame).WID     := GetWIDByNode(Node);
                     end;

                     case TTreeItemInfo(Node.Data).NodeType of
                       nt_Finances:     FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, -1);
                       nt_BankAccounts: FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, -2);
                       nt_WebStoreCategory: FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).UserData, -2); // passing TapTreeNode
                       -4: FrameList.FcurrFrame.DoRefresh(-TTreeItemInfo(Node.Data).ID, 1)
                       else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 1);
                     end;
                   end
                   else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 3);

                   fmTemp.Parent := panData;
                   fmTemp.DoShow;
                   SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
                 end;
               end
               else begin // if not FrameList.FrameInList else (frame already created)
                 FrameList.CurrentFrame := TTreeItemInfo(Node.Parent.Data).refersClassName;
                 FrameList.FcurrFrame.DoRefreshFindParams;

                 if FrameList.FcurrFrame is TfmWMat then begin
                   TfmWMat(FrameList.FCurrFrame).ByW     := aByWHouse.Checked;
                   TfmWMat(FrameList.FCurrFrame).ShowGrp := btnShowGrp.Checked;
                   TfmWMat(FrameList.FCurrFrame).WID     := GetWIDByNode(Node);

                   if TTreeItemInfo(Node.Data).ID > 0 then begin
                     if (TTreeItemInfo(Node.Data).NodeType = -4)
                       then FrameList.FcurrFrame.DoRefresh(0, 1)
                       else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 1);
                   end
                   else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 3);
                 end
                 else begin
                   if TTreeItemInfo(Node.Data).NodeType in [nt_Finances, nt_BankAccounts]
                   then begin
                     case TTreeItemInfo(Node.Data).NodeType of
                       nt_Finances:     FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, -1);
                       nt_BankAccounts: FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, -2);
                     end
                   end
                   else if TTreeItemInfo(Node.Data).NodeType = nt_WebStoreCategory
                        then FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).UserData, -2) // passing TapTreeNode
                   else if TTreeItemInfo(Node.Data).ID > 0
                     then FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 1)
                     else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 3);
                 end;

                 SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
               end;

               panData.Visible := True;
              end;

           //---------------------------------------------------------------------------------------------------
           nt_Reports:
             begin
               if FrameList.CurrentFrame = TfmUserMonitor.ClassName then FrameList.FcurrFrame.StopProcess;

               if not FrameList.FrameInList(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType)
               then begin
                 fmTemp := LoadFrame(TTreeItemInfo(Node.Data).refersClassName, TTreeItemInfo(Node.Data).utv_gType);

                 if fmTemp <> nil then begin
                   FrameList.Add(fmTemp, True);

                   if TTreeItemInfo(Node.Data).ID > 0
                     then FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 1)
                     else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 3);

                   fmTemp.Parent := panData;
                   fmTemp.DoShow;
                   SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
                 end;
               end
               else begin
                 FrameList.CurrentFrame := TTreeItemInfo(Node.Data).refersClassName;

                 if TTreeItemInfo(Node.Data).ID > 0
                   then FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 1)
                   else FrameList.FcurrFrame.DoRefresh(TTreeItemInfo(Node.Data).ID, 3);

                 SetUserActivity(dmData.SConnection, FrameList.FcurrFrame.FunID);
               end;

               panData.Visible := True;
             end; // case nt_Reports

         end; // case TTreeItemInfo(Node.Data).NodeType

      finally
        NotChangeDetail := False;
      end;
    end; // if not NotChangeDetail
  end; // if Node <> nil

  UpdActions;
  UpdTreeActions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainChanging') else _udebug := nil;{$ENDIF}

  if not TTreeItemInfo(Node.Data).Enabled then begin
    AllowChange := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    if ((RefType = rtPersons) and (TTreeItemInfo(tlMain.Selected.Data).ID = 4))
       or ((RefType = rtEnt) and (TTreeItemInfo(tlMain.Selected.Data).ID = 5))
       or ((ViewType = vtWMat) and (FParam > 0) and (Node.AbsoluteIndex = 0))
    then AllowChange := False;

  except
  end;

  PrevNode := tlMain.Selected;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainEditing') else _udebug := nil;{$ENDIF}

  if ((TTreeItemInfo(tlMain.Selected.Data).NodeType = -2) and (TTreeItemInfo(tlMain.Selected.Data).ID = -1))
     or (TTreeItemInfo(tlMain.Selected.Data).NodeType = nt_WebStore)
  then begin
    AllowEdit := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainEdited(Sender: TObject; Node: TTreeNode; var S: String);
  var
    apn: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainEdited') else _udebug := nil;{$ENDIF}

  case TTreeItemInfo(Node.Data).NodeType of
    nt_Any, nt_Top:
      begin
        if not UpdateUserTreeView(Node, S) then begin
          CancelNodeEditing(Node, RS('TfrmCCMain', 'ErrorValue'));
          S := Node.Text;
        end;
      end;

    -2: begin
          if not UpdateMatGroup(Node, S) then begin
            CancelNodeEditing(Node, RS('TfrmCCMain', 'ErrorValue'));
            S := Node.Text;
          end;
        end;

    nt_SvcCat:
      begin
        if not UpdateSvcGroup(Node, S) then begin
          CancelNodeEditing(Node, RS('TfrmCCMain', 'ErrorValue'));
          S := Node.Text;
        end;
      end;

    nt_DiscCardCat:
      begin
        if not UpdateDCGroup(Node, S) then begin
          CancelNodeEditing(Node, RS('TfrmCCMain', 'ErrorValue'));
          S := Node.Text;
        end;
      end;

    nt_WebStoreCategory:
      begin
        apn := TapTreeNode(TTreeItemInfo(Node.Data).UserData);
        if apn.Parent.FindFirst(s, False) = nil then begin
          apn.Name := S;
          apn.Save(False);
        end
        else begin
          CancelNodeEditing(Node, RS('TfrmCCMain', 'ErrorValue'));
          S := Node.Text;
        end;
      end;
  end;

  //panRightTitle.Caption := '  '+S;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    FPos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainMouseUp') else _udebug := nil;{$ENDIF}

  if not (RefType in [rtPersons, rtEnt]) and (Button = mbRight) then begin
    PopupNode := tlMain.GetNodeAt(X, Y);
    FPos := tlMain.ClientToScreen(Point(X, Y));
    pmTree.Popup(FPos.X, FPos.Y);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewExExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewExExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.WMSetNewCaption(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetNewCaption') else _udebug := nil;{$ENDIF}

  aNewMain.Caption := String(pointer(M.WParam)^);
  aNewGrp.Caption := String(pointer(M.LParam)^);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMRefreshNode(var M: TMessage);
  var
    Exp: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMRefreshNode') else _udebug := nil;{$ENDIF}

  Exp := tlMain.Selected.Expanded;
  tlMain.Items.BeginUpdate;

  try
    GetLevel(tlMain.Selected);

    if Exp then tlMain.Selected.Expand(False);

  finally
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewMainExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewMainExecute') else _udebug := nil;{$ENDIF}

  aNew.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewGrpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewGrpExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoGrpInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    FNode: TTreeNode;
    FNodeInfo, FSelInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainDragOver') else _udebug := nil;{$ENDIF}

  Accept := False;

  try
    FNode := tlMain.GetNodeAt(X, Y);

    FSelInfo := TTreeItemInfo(tlMain.Selected.Data);
    FNodeInfo := TTreeItemInfo(FNode.Data);

    if (Source as TComponent).Name = tlMain.Name then begin
      if (FSelInfo.NodeType = nt_WebStore) // instantly disallowing improper draggings for web-store's nodes
         or ((FSelInfo.NodeType = nt_WebStoreCategory) and (FNodeInfo.NodeType <> nt_WebStore) and (FNodeInfo.NodeType <> nt_WebStoreCategory))
         or (FNode = tlMain.Selected)
      then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end

      else if (FSelInfo.NodeType = nt_WebStoreCategory)
           then Accept := True

      else if (FSelInfo.NodeType = -2) and (FSelInfo.ID <> -1)
      then begin
        if (FNode <> tlMain.Selected) and (FNode <> tlMain.Selected.Parent)
            and (((FNodeInfo.NodeType = -2) and (FNodeInfo.ID > 0))
            or ((FNodeInfo.ID <> -1) and (FNodeInfo.refersClassName = TfmMaterials.ClassName)))
        then Accept := True;
      end
      else if (FSelInfo.NodeType = nt_SvcCat) and (FSelInfo.ID <> -1) then begin
        if (FNode <> tlMain.Selected) and (FNode <> tlMain.Selected.Parent)
           and (((FNodeInfo.NodeType = nt_SvcCat) and (FNodeInfo.ID > 0)) or ((FNodeInfo.ID <> -1) and (FNodeInfo.refersClassName = TfmServices.ClassName)))
        then Accept := True;
      end
      else if (FSelInfo.NodeType = nt_DiscCardCat) and (FSelInfo.ID <> -1) then begin
        if (FNode <> tlMain.Selected) and (FNode <> tlMain.Selected.Parent)
           and (((FNodeInfo.NodeType = nt_DiscCardCat) and (FNodeInfo.ID > 0)) or ((FNodeInfo.ID <> -1) and (FNodeInfo.refersClassName = TfmDiscCards.ClassName)))
        then Accept := True;
      end;
    end // if (Source as TComponent).Name = tlMain.Name

    else if (Source as TComponent).Name = 'dbgMaterials' then begin
      if (FNodeInfo.NodeType = nt_WebStoreCategory)
        then Accept := True
      else
      with PDragInfo(pointer((Source as TComponent).Tag))^ do
        if (((FNodeInfo.NodeType = -2) and (FNodeInfo.ID <> GrpID))) and (FNodeInfo.ID <> -1) and (IsGrp = 0)
        then Accept := True;

    end

    else if prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^.RefType = rtServices then begin
      with prTypes.PDragInfo(pointer((Source as TComponent).Tag))^ do
        if (((FNodeInfo.NodeType = nt_SvcCat) and (FNodeInfo.ID <> GrpID))) and (FNodeInfo.ID <> -1) and (IsGrp = 0)
        then Accept := True;
    end

    else if prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^.RefType = rtDiscCards then begin
       with prTypes.PDragInfo(pointer((Source as TComponent).Tag))^ do
         if (((FNodeInfo.NodeType = nt_DiscCardCat) and (FNodeInfo.ID <> GrpID))) and (FNodeInfo.ID <> -1) and (IsGrp = 0)
         then Accept := True;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
     FNode: TTreeNode;
     sFrom, sTo: string;
     Res, i, scount: integer;
     FSelInfo, FNodeInfo: TTreeItemInfo;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainDragDrop') else _udebug := nil;{$ENDIF}

  FNodeInfo := nil;
  Res := -1;

  FNode := tlMain.GetNodeAt(X, Y);
  if FNode <> nil then FNodeInfo := TTreeItemInfo(FNode.Data);

  if TComponent(Source).Name = tlMain.Name then begin
    FSelInfo := TTreeItemInfo(tlMain.Selected.Data);

    sTo := '<' + FNode.Text + '>';
    sFrom := '<' + tlMain.Selected.Text + '>';

    if mrYes <> ssMessageDlg(Format(RS('TfrmCCMain', 'OkToMoveMat'), [sFrom, sTo]), ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (FNode <> nil) then begin
      if (FNode.Count = 1) and (FNode.Item[0].Text = '') then GetLevel(FNode);

      if FNodeInfo.refersClassName = TfmMaterials.ClassName
      then begin
        if (FNodeInfo.NodeType = nt_WebStore) or (FNodeInfo.NodeType = nt_WebStoreCategory) then begin
          TapTreeNode(FSelInfo.UserData).Parent := TapTreeNode(FNodeInfo.UserData);
          TapTreeNode(FSelInfo.UserData).Save(False);
          Res := 0;
        end
        else if FNodeInfo.NodeType = -2
          then Res := SetNewMatGroupParent(FSelInfo.ID, FNodeInfo.ID)
          else Res := SetNewMatGroupParent(FSelInfo.ID, FSelInfo.ID);
      end
      else if FNodeInfo.refersClassName = TfmDiscCards.ClassName then begin
        if FNodeInfo.NodeType = nt_DiscCardCat
          then Res := SetNewDCGParent(FSelInfo.ID, FNodeInfo.ID)
          else Res := SetNewDCGParent(FSelInfo.ID, FSelInfo.ID);
      end
      else if FNodeInfo.refersClassName = TfmServices.ClassName then begin
        if FNodeInfo.NodeType = nt_SvcCat
          then Res := SetNewSvcGroupParent(FSelInfo.ID, FNodeInfo.ID)
          else Res := SetNewSvcGroupParent(FSelInfo.ID, FSelInfo.ID);
      end;

      if Res = 0 then begin
        if not FNode.Expanded then FNode.Expand(False);

        tlMain.Selected.MoveTo(FNode, naAddChild);
      end
      else begin
        ssMessageDlg(RS('TfrmCCMain', 'UpdParentError'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;
  end
  //---------------------------------------------------------------------------------------------------------------
  //- Products ----------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------
  else if TComponent(Source).Name = 'dbgMaterials'
  then with prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^ do begin
    sTo := '<' + FNode.Text + '>';
    sFrom := '<' + Name + '>';

    // for webcats we do copy always
    if (FNodeInfo.NodeType <> nt_WebStoreCategory)
       and (mrYes <> ssMessageDlg(Format(RS('TfrmCCMain', 'OkToMoveMatEx'), [sFrom, sTo]), ssmtWarning, [ssmbYes, ssmbNo]))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (FNode <> nil) then begin
      FNodeInfo := TTreeItemInfo(FNode.Data);

      if (FNode.Count = 1) and (FNode.Item[0].Text = '') then GetLevel(FNode);

      fProgress.Caption := rs('Common', ifThen((FNodeInfo.NodeType = nt_WebStoreCategory) or (FNodeInfo.NodeType = nt_WebStoreCategory), 'Copying', 'Moving'));
      fProgress.pbMain.Max := TdxDBGrid(Source).SelectedCount;
      fProgress.Show;
      fProgress.Update;

      try
        for i := 0 to TdxDBGrid(Source).SelectedCount - 1 do begin
          fProgress.lText.Caption := TdxDBGrid(Source).SelectedNodes[i].Values[3];
          Application.ProcessMessages;

          if FNodeInfo.NodeType = nt_WebStoreCategory then begin
            TapTreeNode(FNodeInfo.UserData).FindData(TdxDBGrid(Source).SelectedNodes[i].Values[0], -1, True).asBoolean := True;
            Res := 0;
          end
          else if FNodeInfo.NodeType = -2
            then Res := SetNewMatParent(TdxDBGrid(Source).SelectedNodes[i].Values[0], FNodeInfo.ID)
            else Res := SetNewMatParent(TdxDBGrid(Source).SelectedNodes[i].Values[0], 0);

          fProgress.pbMain.StepIt;
        end;

        if FNodeInfo.NodeType = nt_WebStoreCategory then TapTreeNode(FNodeInfo.UserData).SaveData(-1, False);

      finally
        fProgress.Hide;
        Application.ProcessMessages;
      end;

      scount := TdxDBGrid(Source).SelectedCount;

      if Res = 0 then begin
        tlMain.Selected := FNode;

        if scount = 1 then SendMessage(FrameList.FcurrFrame.Handle, WM_LOCATEID, ID, 0);
      end
      else begin
        ssMessageDlg(RS('TfrmCCMain', 'UpdGrpError'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;
  end
  //---------------------------------------------------------------------------------------------------------------
  //- Services ----------------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------
  else if prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^.RefType = rtServices
  then with prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^ do begin
    sTo := '<' + FNode.Text + '>';
    sFrom := '<' + Name + '>';

    if mrYes = ssMessageDlg(Format(RS('fmServices', 'OkToMoveSvc'), [sFrom, sTo]), ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (FNode <> nil) then begin
      if (FNode.Count = 1) and (FNode.Item[0].Text = '') then GetLevel(FNode);

      fProgress.Caption := rs('Common', 'Moving');
      fProgress.pbMain.Max := TdxDBGrid(Source).SelectedCount;
      fProgress.Show;
      fProgress.Update;

      try
        for i := 0 to TdxDBGrid(Source).SelectedCount - 1 do begin
          fProgress.lText.Caption := TdxDBGrid(Source).SelectedNodes[i].Values[2];
          Application.ProcessMessages;

          if FNodeInfo.NodeType = nt_SvcCat
            then Res := SetNewSvcGroupParent(TdxDBGrid(Source).SelectedNodes[i].Values[3], FNodeInfo.ID)
            else Res := SetNewSvcGroupParent(TdxDBGrid(Source).SelectedNodes[i].Values[3], 0);

          fProgress.pbMain.StepIt;
        end;

      finally
        fProgress.Hide;
        Application.ProcessMessages;
      end;

      scount := TdxDBGrid(Source).SelectedCount;

      if Res = 0 then begin
        tlMain.Selected := FNode;
        if scount = 1 then SendMessage(FrameList.FcurrFrame.Handle, WM_LOCATEID, ID, 0);
      end
      else begin
        ssMessageDlg(RS('TfrmCCMain', 'UpdGrpError'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;
  end
  //---------------------------------------------------------------------------------------------------------------
  //- Discount cards ----------------------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------------------------------------
  else if prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^.RefType = rtDiscCards
  then with prTypes.PDragInfo(Pointer((Source as TComponent).Tag))^ do begin
    sTo := '<' + FNode.Text + '>';
    sFrom := '<' + Name + '>';

    if mrYes <> ssMessageDlg(Format(RS('fmDiscCards', 'OkToMoveGrp'), [sFrom, sTo]), ssmtWarning, [ssmbYes, ssmbNo])
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (FNode <> nil) then begin
      if (FNode.Count = 1) and (FNode.Item[0].Text = '') then GetLevel(FNode);

      fProgress.Caption := rs('Common', 'Moving');
      fProgress.pbMain.Max := TdxDBGrid(Source).SelectedCount;
      fProgress.Show;
      fProgress.Update;

      try
        for i := 0 to TdxDBGrid(Source).SelectedCount - 1 do begin
          fProgress.lText.Caption := TdxDBGrid(Source).SelectedNodes[i].Values[1];
          Application.ProcessMessages;

          if FNodeInfo.NodeType = nt_DiscCardCat
            then Res := SetNewDCParent(TdxDBGrid(Source).SelectedNodes[i].Values[6], FNodeInfo.ID)
            else Res := SetNewDCParent(TdxDBGrid(Source).SelectedNodes[i].Values[6], 0);

          fProgress.pbMain.StepIt;
        end;

      finally
        fProgress.Hide;
        Application.ProcessMessages;
      end;

      scount := TdxDBGrid(Source).SelectedCount;

      if Res = 0 then begin
        tlMain.Selected := FNode;

        if scount = 1 then SendMessage(FrameList.FcurrFrame.Handle, WM_LOCATEID, ID, 0);
      end
      else begin
        ssMessageDlg(RS('TfrmCCMain', 'UpdGrpError'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.SetNewMatGroupParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetNewMatGroupParent') else _udebug := nil;{$ENDIF}

  if IsCyclingRef(dmData.SConnection, 'matgroup', 'grpid', 'pid', AID, APID) then begin
    Result := -2;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Result := 0;

  with newDataSet do
  try
    try
      ProviderName := 'pMatGroup_UpdParent';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := AID;
      Params.ParamByName('pid').AsInteger := APID;
      Execute;

    except
      Result := -1;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.SetNewMatParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetNewMatParent') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
    try
      try
        ProviderName := 'pMaterials_UpdParent';
        FetchParams;
        Params.ParamByName('matid').AsInteger := AID;
        if APID = 0 then begin
          Params.ParamByName('grpid').DataType := ftInteger;
          Params.ParamByName('grpid').Clear;
        end
        else Params.ParamByName('grpid').AsInteger := APID;
        Execute;

      except
        Result := -1;
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aFindExecute') else _udebug := nil;{$ENDIF}

  DoFind(Sender, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aFindPropsExecute(Sender: TObject);
  var
     Pos: TPoint;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aFindPropsExecute') else _udebug := nil;{$ENDIF}

  Pos := panBar.ClientToScreen(Point(btnFindParams.Left, btnFindParams.Top + btnFindParams.Height + 1));
  pmFind.Popup(Pos.X, Pos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSetFindParams(var M: TMessage);
  var
    i: Integer;
    FItem: TTBItem;
    ed: TcxTextEdit;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetFindParams') else _udebug := nil;{$ENDIF}

  if edFind.Focused
    then ed := edFind
    else ed := edFind2;

  FFindLock := True;
  try
    with FFindList do begin
      for i := 0 to Count - 1 do begin
        pmFind.Items.Delete(pmFind.Items.IndexOf(TTBItem(Items[i])));
        TTBItem(Items[i]).Free;
      end;

      Clear;
    end;

    cbFindField.Properties.Items.Clear;

     with FFindListNames do begin
       Assign(TStringList(pointer(M.WParam)));

       for i := 0 to Count - 1 do begin
         FItem := TTBItem.Create(pmFind);
         FItem.GroupIndex := 12;
         //FItem.RadioItem := True;
         FItem.Caption := ExtractWord(1, Strings[i], [';']);
         FItem.Tag := Integer(Objects[i]);
         FItem.OnClick := mnuFindClick;

         if i = M.LParam then FItem.Checked := True;

         pmFind.Items.Insert(i, FItem);
          //FItem.MenuIndex := i;
         FFindList.Add(FItem);
         cbFindField.Properties.Items.Add(FItem.Caption);
       end;
     end;

     try
       if PSearchInfo(M.LParam)^.SearchID <> -1 then begin
         cbFindField.ItemIndex := PSearchInfo(M.LParam)^.SearchID;
         pmFind.Items[cbFindField.ItemIndex].Checked := True;

         case PSearchInfo(M.LParam)^.LocateType of
           ltBegin:
             begin
               cbFindCriteria.ItemIndex := 0;
               aFindBegin.Checked := True;
             end;

           ltFull:
             begin
               cbFindCriteria.ItemIndex := 1;
               aFindConcurr.Checked := True;
             end;

           ltSubstr:
             begin
               cbFindCriteria.ItemIndex := 2;
               aFindSubstr.Checked := True;
             end;
         end;

         if not PSearchInfo(M.LParam)^.Failed
           then ed.Text := PSearchInfo(M.LParam)^.FindStr
           else ed.Text := PSearchInfo(M.LParam)^.PrevFindStr;

         ed.SelStart := Length(ed.Text);

         {if PSearchInfo(M.LParam)^.Failed
           then begin
             edFind2.Style.Color := $006365FF;
             Application.ProcessMessages;
             edFind2.Style.Color := clWindow;
           end
           else edFind2.Style.Color := clWindow;
         }
       end;

     except
     end;

  finally
    FFindLock := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.edFindCurChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.edFindCurChange') else _udebug := nil;{$ENDIF}

  edFind.Text := edFind.CurText;
  if btnFindContext.Down then begin
    aFind.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.aPrintExecute(Sender: TObject);
  var
    Pos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPrintExecute') else _udebug := nil;{$ENDIF}

  if (FrameList.FcurrFrame is TfmPayDoc) then begin
    Pos := panBar.ClientToScreen(Point(btnPrint.Left, btnPrint.Top + btnPrint.Height + 1));
    pmPayDoc.Popup(Pos.X, Pos.Y);
  end
  else if (FrameList.FcurrFrame is TfmWaybillMov) then begin
    Pos := panBar.ClientToScreen(Point(btnPrint.Left, btnPrint.Top + btnPrint.Height + 1));
    pmWBMov.Popup(Pos.X, Pos.Y);
  end
  else if (FrameList.FcurrFrame is TfmWaybillOut) then begin
    Pos := panBar.ClientToScreen(Point(btnPrint.Left, btnPrint.Top + btnPrint.Height + 1));
    FrameList.FcurrFrame.DoPrintPopup(Pos.X, Pos.Y);
  end
  else if (FrameList.FcurrFrame is TfmAccOut) then begin
    Pos := panBar.ClientToScreen(Point(btnPrint.Left, btnPrint.Top + btnPrint.Height + 1));
    FrameList.FcurrFrame.DoPrintPopup(Pos.X, Pos.Y);
  end
  else if (FrameList.FcurrFrame is TfmContr) then begin
    Pos := panBar.ClientToScreen(Point(btnPrint.Left, btnPrint.Top + btnPrint.Height + 1));
    FrameList.FcurrFrame.DoPrintPopup(Pos.X, Pos.Y);
  end
  else begin
    FrameList.FcurrFrame.DoPrint;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aExcelExecute(Sender: TObject);
  var
    Grid: TdxDBGrid;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aExcelExecute') else _udebug := nil;{$ENDIF}

  if TAction(Sender).Tag = 0
    then FrameList.FcurrFrame.DoExcel(nil)
    else begin
      Grid := nil;
      FrameList.FcurrFrame.DoExcel(Grid);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.SetViewType(const Value: TCCViewType);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetViewType') else _udebug := nil;{$ENDIF}

  FViewType := Value;

  NotChangeDetail := True;
  try
    RefreshTree(TreeID);
    NotChangeDetail := True;

    //if ViewType <> vtWMat then begin
      for i := 0 to tlMain.Items.Count - 1 do
        if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).utv_gType = CurrentNode)
           and (CurrentNode <> 0) and not (RefType in [rtPersons, rtEnt])
        then begin
          tlMain.Selected := tlMain.Items[i];
          Break;
        end;
    //end;

    if (ViewType = vtWMat) and (FParam > 0)
      then tlMain.Items[1].Selected := True
      else begin
        if (tlMain.Items.Count > 0) and not (RefType in [rtPersons, rtEnt]) and (tlMain.Selected = nil)
          then tlMain.Selected := tlMain.Items[0];
      end;

    if (Value = vtWMat) and (Self.FormStyle = fsNormal) and (btnShowGrp.Checked) and (LastPNodeID <> -1)
    then begin
      if aByGroup.Checked
        then LocateMatGroup(WMatNode, LastPNodeID)
        else LocateWHouse(WMatNode, LastPNodeID);
    end;

    if (Value = vtWMat) and (Self.FormStyle = fsNormal) and (LastNodeID <> -1)
    then begin
      if btnShowGrp.Checked and (LastPNodeID <> -1) then begin
        LocateMatGroup(tlMain.Selected, LastNodeID);
      end
      else if aByGroup.Checked
           then LocateMatGroup(WMatNode, LastNodeID)
           else LocateWHouse(WMatNode, LastNodeID);
    end
    else if (Value = vtMat) and (Self.FormStyle = fsNormal) and (LastMatID <> -1)
         then LocateMatGroup(tlMain.Items[0], LastMatID);

    if RefType = rtPersons then begin
      tlMain.Items[3].Selected := True;
    end
    else if RefType = rtEnt then begin
      tlMain.Items[4].Selected := True;
    end;

  finally
    NotChangeDetail := False;
    tlMainChange(tlMain, tlMain.Selected);
  end;

  panLeft.Visible := (Value in [vtKAgent, vtMat, vtServices, vtWMat, vtAll, vtDocs, vtRefs, vtReports, vtService,
                                vtInternet, vtWebShops, vtRSS, vtBundling, vtUnbundling])
                     or ((Value = vtFinances) and (FormStyle <> fsNormal));

  if FormStyle <> fsNormal then CurrentView := ViewType;

  if FrameList.FcurrFrame <> nil then FrameList.FcurrFrame.Param := FParam;

  //  splMain.Visible := panLeft.Visible;
  if Self.FormStyle = fsNormal then begin
    if Screen.WorkAreaWidth >= 1024 then
     case Value of
       vtMat, vtWMat, vtServices:
         begin
           Width := 900;
           Height := 600;
         end;

       vtKAgent, vtDiscCards:
         begin
           Width := 800;
           Height := 540;
         end;

       vtMeasures, vtWHouse, vtAccountType, vtBank, vtCountries, vtChargeType, vtCashDesks, vtFinances:
         begin
           Width := 630;
           Height := 420;
         end;

       vtMatGroup, vtSvcGroup, vtDiscCardGroup:
         begin
           Width := 800;
           Height := 540;
         end;
      end
    else // if Screen.Width >= 1024
      case Value of
        vtMeasures, vtAccountType, vtBank, vtCountries, vtChargeType, vtCashDesks, vtFinances:
          begin
            Width := 600;
            Height := 400;
          end;

        vtMatGroup, vtSvcGroup, vtDiscCardGroup:
          begin
            Width := 640;
            Height := 440;
          end;

        vtMat, vtServices, vtDiscCards:
          begin
            Width := 780;
            Height := 560;
          end;
      end; // case
   end; // if Screen.Width >= 1024

   panNoAccess.Visible := Assigned(frmMainForm) and frmMainForm.AllDisabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSetCaptionEx(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetCaptionEx') else _udebug := nil;{$ENDIF}

  panLeftTitle.Caption := ' '+String(pointer(M.WParam)^);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.Action1Execute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.Action1Execute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.pmFindPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.pmFindPopup') else _udebug := nil;{$ENDIF}

  mnuFindParamsSep.Visible := pmFind.Items.IndexOf(mnuFindParamsSep)<>0;
  cbFindCriteriaPropertiesEditValueChanged(cbFindCriteria);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aFindBeginExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aFindBeginExecute') else _udebug := nil;{$ENDIF}

  cbFindCriteria.ItemIndex := 0;
  cbFindFieldPropertiesEditValueChanged(cbFindField);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aFindConcurrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aFindConcurrExecute') else _udebug := nil;{$ENDIF}

  cbFindCriteria.ItemIndex := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aFindSubstrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aFindSubstrExecute') else _udebug := nil;{$ENDIF}

  cbFindCriteria.ItemIndex := 2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aContextFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aContextFindExecute') else _udebug := nil;{$ENDIF}

  aContextFind.Checked := not aContextFind.Checked;
  chbContextFind.Checked := aContextFind.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.mnuFindClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.mnuFindClick') else _udebug := nil;{$ENDIF}

  with (Sender as TTBItem) do begin
    Checked := True;
    cbFindField.ItemIndex := pmFind.Items.IndexOf(Sender as TTBItem);
    FrameList.FcurrFrame.CurrentSearchID := pmFind.Items.IndexOf(Sender as TTBItem);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.edFindPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.edFindPropertiesChange') else _udebug := nil;{$ENDIF}

  if aContextFind.Checked then begin
    aFind.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aByGroupExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aByGroupExecute') else _udebug := nil;{$ENDIF}

  //aByGroup.Checked := True;
  tlMain.Items.BeginUpdate;
  
  try
   {FWHouseItems.Items.Assign(tlMain.Items);
   AssignItemData(tlMain, FWHouseItems);
   notRefreshWHouseItems := True;
   if not notRefreshMatGrpItems
   then begin
   }
     GetLevel(WMatNode);
     WMatNode.Expand(False);
     tlMain.Selected := WMatNode;
     tlMainChange(tlMain, tlMain.Selected);
   {
   end
   else begin
     tlMain.Items.Assign(FMatGrpItems.Items);
     AssignItemData(FMatGrpItems, tlMain);
   end;
   }

  finally
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aByWHouseExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aByWHouseExecute') else _udebug := nil;{$ENDIF}

  //aByWHouse.Checked := True;
  tlMain.Items.BeginUpdate;
  try
    {FMatGrpItems.Items.Assign(tlMain.Items);
    AssignItemData(tlMain, FMatGrpItems);
    notRefreshMatGrpItems := True;

    if not notRefreshWHouseItems then begin
    }
      GetLevel(WMatNode);
      WMatNode.Expand(False);
      tlMain.Selected := WMatNode;
      tlMainChange(tlMain, tlMain.Selected);
    {end
    else begin
      tlMain.Items.Assign(FWHouseItems.Items);
      AssignItemData(FWHouseItems, tlMain);
    end;
    }

  finally
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetWHouseLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetWHouseLevel') else _udebug := nil;{$ENDIF}

  tlMain.Items.BeginUpdate;
  with newDataSet do
  try
    DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;
    
    ProviderName := 'pWHouse_List';
    FetchMacros;
    Macros.ParamByName('m').AsString := WHAccessMacro;
    Open;

    while not Eof do begin
      if (ViewType = vtWMat) and (FParam > 0) and (FieldByName('wid').AsInteger <> FParam)
      then begin
        Next;
        Continue;
      end;

      FNode := tlMain.Items.AddChild(ANode, FieldByName('name').AsString);
      FInfo := TTreeItemInfo.Create;
      FInfo.ID := FieldByName('wid').AsInteger;
      FInfo.DisplayedName := FieldByName('name').AsString;
      FInfo.ImageIndex := 50;
      FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
      FInfo.NodeType := -4; //материалы
      FInfo.Enabled := True;
      FInfo.utv_gType := utv_gType_WMat;
      FNode.Data := FInfo;

      if aByWHouse.Checked and (btnShowGrp.Checked) then tlMain.Items.AddChild(FNode, '');

      Next;
    end;
    Close;

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.AssignItemData(ASource, ADest: TTreeView);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.AssignItemData') else _udebug := nil;{$ENDIF}

  for i := 0 to ASource.Items.Count - 1 do begin
    ADest.Items[i].Data := ASource.Items[i].Data;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aDrillDownExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aDrillDownExecute') else _udebug := nil;{$ENDIF}

  btnDrillDown.Checked := not btnDrillDown.Checked;
  //aDrillDown.Checked := not aDrillDown.Checked;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'DrillDown', Integer(btnDrillDown.Checked));
  if Assigned(FrameList.FcurrFrame) then FrameList.FcurrFrame.DoDrillDown;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aSelectExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aSelectExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aCloseExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aCloseExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
constructor TfrmCCMain.Create(AOwner: TComponent; ARefType: TRefType; const ASection: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.Create') else _udebug := nil;{$ENDIF}

  Create(AOwner);
  RefType := ARefType;
  FSection := ASection;

  panButtons.Visible := True;
  btnTBMinimize.Visible := False;
  btnTBMaximize.Visible := False;
  bvlBarTop.Edges := [];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
constructor TfrmCCMain.Create(AOwner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.Create(AOwner)') else _udebug := nil;{$ENDIF}

  FWebShopNodes := nil;
  RefType := rtNone;
  inherited Create(AOwner);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSetParentCaption(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetParentCaption') else _udebug := nil;{$ENDIF}

  if FormStyle = fsNormal then panTitleBar.Caption := String(pointer(M.WParam)^);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then
    if (FrameList.FcurrFrame is TfmWMat) then begin
      if TfmWMat(FrameList.FcurrFrame).FMode < 2
        then SendMessage(ParentHandle, WM_REFRESH, Integer(@TfmWMat(FrameList.FcurrFrame).PosInfo), Integer(FrameList.FcurrFrame.RefType))
        else SendMessage(ParentHandle, WM_REFRESH, Integer(TfmWMat(FrameList.FcurrFrame).mdMats),   Integer(FrameList.FcurrFrame.RefType));
    end

    else if (FrameList.FcurrFrame is TfmMaterials) and (FrameList.FcurrFrame.Param <> 0) then begin
      SendMessage(ParentHandle, WM_REFRESH, Integer(TfmMaterials(FrameList.FcurrFrame).mdMats), Integer(FrameList.FcurrFrame.RefType));
    end

    else if (FrameList.FcurrFrame is TfmServices) and (FrameList.FcurrFrame.Param <> 0) then begin
      SendMessage(ParentHandle, WM_REFRESH, Integer(TfmServices(FrameList.FcurrFrame).mdAdd), Integer(FrameList.FcurrFrame.RefType));
    end

    else begin
      SendMessage(ParentHandle, WM_REFRESH, FrameList.FcurrFrame.CurrentID, Integer(FrameList.FcurrFrame.RefType));
      FrameList.FcurrFrame.SelectRecord(ParentHandle);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.btnOkGetDrawParams(Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor; AFont: TFont);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.btnOkGetDrawParams') else _udebug := nil;{$ENDIF}

  if AState in [cxbsHot, cxbsPressed] then begin
    AFont.Style := [fsBold];
    AColor := TcxButton(Sender).Colors.Normal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormShow(Sender: TObject);
  var
     Temp: Integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  aReconnect.Visible := FormStyle = fsMDIChild;
  try
    panTitleButtons.Invalidate;

    if (FormStyle = fsNormal) and not (FrameList.FcurrFrame.RefType in [rtPersons, rtEnt])
      then edFind2.SetFocus;

  except
  end;

  if (FormStyle <> fsNormal) and (FrameList.FcurrFrame <> nil)
    then FrameList.FcurrFrame.DoShowModal;

  UpdTreeActions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewGroupExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewGroupExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoGrpInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewMatExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.LocateWHouse(ANode: TTreeNode; AID: integer);
  var
    RootNode: TTreeNode;
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LocateWHouse') else _udebug := nil;{$ENDIF}

  NotChangeDetail := True;
  try
    if TTreeItemInfo(ANode.Data).NodeType <> -4
      then RootNode := ANode
      else RootNode := ANode.Parent;

    if not RootNode.Expanded then RootNode.Expand(False);

    for i := 0 to RootNode.Count - 1 do
      if TTreeItemInfo(RootNode.Item[i].Data).ID = AID then begin
        tlMain.Selected := RootNode.Item[i];
        Exit;
      end;

  finally
    NotChangeDetail := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//=========================================================================
procedure TfrmCCMain.cbFindCriteriaPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.cbFindCriteriaPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  case cbFindCriteria.ItemIndex of
    0: aFindBegin.Checked := True;
    1: aFindConcurr.Checked := True;
    2: aFindSubstr.Checked := True;
  end;

  if Self.Visible and not FFindLock and (FrameList.FcurrFrame <> nil)
  then
    case cbFindCriteria.ItemIndex of
      0: FrameList.FcurrFrame.SearchLocateType := ltBegin;
      1: FrameList.FcurrFrame.SearchLocateType := ltFull;
      2: FrameList.FcurrFrame.SearchLocateType := ltSubstr;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.chbContextFindClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.chbContextFindClick') else _udebug := nil;{$ENDIF}

  aContextFind.Checked := chbContextFind.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.cbFindFieldPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.cbFindFieldPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not FFindLock then begin
    pmFind.Items[cbFindField.ItemIndex].Checked := True;
    FrameList.FcurrFrame.CurrentSearchID := cbFindField.ItemIndex;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.edFind2PropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.edFind2PropertiesChange') else _udebug := nil;{$ENDIF}

  if aContextFind.Checked and not FFindLock then aFind2.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmCCMain.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;
  if FrameList.FcurrFrame <> nil then FrameList.FcurrFrame.CurrentID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aCheckExecute(Sender: TObject);
  var
    Pos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aCheckExecute') else _udebug := nil;{$ENDIF}

  if FrameList.FcurrFrame = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (FrameList.FcurrFrame is TfmContr) then begin
    Pos := panBar.ClientToScreen(Point(btnCheck.Left, btnCheck.Top + btnCheck.Height + 1));
    FrameList.FcurrFrame.DoCheckPopup(Pos.X, Pos.Y);
  end
  else begin
    FrameList.FcurrFrame.DoCheck(False);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aPrintPayOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPrintPayOrderExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aPrintInCashOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPrintInCashOrderExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.pmPayDocPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.pmPayDocPopup') else _udebug := nil;{$ENDIF}

  aPrintInCashOrder.Visible := FrameList.FcurrFrame.Tag = utv_gType_PayDocIn;
  aPrintPayOrder.Visible := FrameList.FcurrFrame.Tag = utv_gType_PayDocOut;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSelectItem(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSelectItem') else _udebug := nil;{$ENDIF}

  aSelect.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.edFind2KeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.edFind2KeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (Trim(edFind2.EditingText) <> '') then begin
    Key := #0;

    if (FormStyle = fsNormal) and not chbContextFind.Checked then aSelect.Execute;

    if Self.FormStyle = fsNormal
      then FrameList.FcurrFrame.DoAfterFind
      else FrameList.FcurrFrame.DoSetFocus;

    //if Self.FormStyle = fsMDIChild then AFind2.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetKAgentLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    BaseCurrName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetKAgentLevel') else _udebug := nil;{$ENDIF}

  DeleteTreeItemInfo(ANode);
  ANode.DeleteChildren;

  FNode := tlMain.Items.AddChild(ANode, RS('TfrmCCMain', 'EntPersons'));
  FInfo := TTreeItemInfo.Create;
  FInfo.ID := 2;
  FInfo.DisplayedName := FNode.Text;
  FInfo.ImageIndex := 18;
  FInfo.FunID := 10;
  FInfo.refersClassName := '';
  FInfo.NodeType := nt_BusinessPartner;
  FInfo.Enabled := True;
  FInfo.FullName := FNode.Text;
  FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;
  FNode.Data := FInfo;

  FNode := tlMain.Items.AddChild(ANode, RS('TfrmCCMain', 'PhPersons'));
  FInfo := TTreeItemInfo.Create;
  FInfo.ID := 3;
  FInfo.FunID := 10;
  FInfo.DisplayedName := FNode.Text;
  FInfo.ImageIndex := 67;
  FInfo.refersClassName := '';
  FInfo.NodeType := nt_BusinessPartner;
  FInfo.Enabled := True;
  FInfo.FullName := FNode.Text;
  FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;
  FNode.Data := FInfo;

  FNode := tlMain.Items.AddChild(ANode, RS('TfrmCCMain', 'Workers'));
  FInfo := TTreeItemInfo.Create;
  FInfo.ID := 4;
  FInfo.FunID := 10;
  FInfo.DisplayedName := FNode.Text;
  FInfo.ImageIndex := 70;
  FInfo.refersClassName := '';
  FInfo.NodeType := nt_BusinessPartner;
  FInfo.Enabled := True;
  FInfo.FullName := FNode.Text;
  FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;
  FNode.Data := FInfo;

  FNode := tlMain.Items.AddChild(ANode, RS('TfrmCCMain', 'Ents'));
  FInfo := TTreeItemInfo.Create;
  FInfo.ID := 5;
  FInfo.FunID := 10;
  FInfo.DisplayedName := FNode.Text;
  FInfo.ImageIndex := 18;
  FInfo.refersClassName := '';
  FInfo.NodeType := nt_BusinessPartner;
  FInfo.Enabled := True;
  FInfo.FullName := FNode.Text;
  FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;
  FNode.Data := FInfo;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.LocateKAgent(ANode: TTreeNode; AID: integer);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LocateKAgent') else _udebug := nil;{$ENDIF}

  NotChangeDetail := True;

  try
   for i := 0 to ANode.Parent.Count - 1 do
    if AID = TTreeItemInfo(ANode.Parent.Item[i].Data).ID then begin
      tlMain.Selected := ANode.Parent.Item[i];
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  finally
    NotChangeDetail := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMDelete(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMDelete') else _udebug := nil;{$ENDIF}

  SendMessage(ParentHandle, WM_DELETE, M.WParam, Integer(FrameList.FcurrFrame.RefType));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreeDelExecute(Sender: TObject);
  var
    Err: string;
    IsSvc, IsDC: Boolean;
    Finfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeDelExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  if not ((PopupNode.Count = 0) or (PopupNode.Item[0].Text = '')) then begin
    ssMessageDlg(RS('TfrmCCMain', 'DelDependentGroups'), ssmtError, [ssmbOk]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FInfo := TTreeItemInfo(PopupNode.Data);

  if FInfo.NodeType = nt_WebStoreCategory then begin
    if mrYes <> ssMessageDlg(RS('Common', 'DelConfirm'), ssmtWarning, [ssmbNo, ssmbYes]) then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    TapTreeNode(FInfo.UserData).Delete;
    TapTreeNode(FInfo.UserData).Save(True);

    DeleteTreeItemInfo(PopupNode);
    PopupNode.Free;
    
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  IsSvc := (FInfo.NodeType = nt_SvcCat);
  IsDC  := (FInfo.NodeType = nt_DiscCardCat);

  with newDataSet do
  try
    if IsSvc then begin
      ProviderName := 'pSvcGroup_ChildCount';
      FetchParams;
      Params.ParamByName('svcid').AsInteger := TTreeItemInfo(PopupNode.Data).ID;
      Open;
      if Fields[0].AsInteger > 0 then begin
        ssMessageDlg(rs('fmServices', 'GrpHaveChildren'), ssmtError, [ssmbOK]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
      Close;
    end

    else if IsDC then begin
      ProviderName := 'pDCG_ChildCount';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := TTreeItemInfo(PopupNode.Data).ID;
      Open;
      if Fields[0].AsInteger > 0 then begin
        ssMessageDlg(rs('fmServices', 'GrpHaveChildren'), ssmtError, [ssmbOK]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
      Close;
    end;

    if IsSvc then ProviderName := 'pSvcGroup_Del'
    else if IsDC
         then ProviderName := 'pDCG_Del'
         else ProviderName := 'pMatGroup_Del';

    FetchParams;
    if not IsSvc
      then Params.ParamByName('grpid').AsInteger := TTreeItemInfo(PopupNode.Data).ID
      else Params.ParamByName('svcid').AsInteger := TTreeItemInfo(PopupNode.Data).ID;

    try
      Execute;

      if IsDC then begin
        ProviderName := 'pSQL';
        FetchMacros;
        Params.Clear;
        Macros.ParamByName('sql').AsString := 'drop generator gen_dcg' + IntToStr(TTreeItemInfo(PopupNode.Data).ID);
        Execute;
      end;

      {if tlMain.Selected.GetNext<>nil
        then tlMain.Selected := tlMain.Selected.GetNext
        else tlMain.Selected := tlMain.Selected.GetPrev;

       tlMain.Selected := tlMain.Selected.GetNext;
      }
      DeleteTreeItemInfo(PopupNode);
      PopupNode.Free;

      if not IsDC then frmMainForm.ExecRefresh('WH', 0);

    except
      on e:exception do begin
        Err := RS('TfrmCCMain', 'ErrDelGrp') + #10#13 + e.Message;

        ssMessageDlg(Err, ssmtError, [ssmbOk]);
      end;
   end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreeNewExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeNewExecute') else _udebug := nil;{$ENDIF}
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.aTreeGrpNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreeGrpNewExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  if FrameList.CurrentFrame = TfmMaterials.ClassName
    then TfmMaterials(FrameList.FcurrFrame).aNewGrp.Execute
    else if FrameList.CurrentFrame = TfmServices.ClassName
         then TfmServices(FrameList.FcurrFrame).aNewGrp.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMCallBack(var M: TMessage);
  var
    i: Integer;
    FFrameClass: TClass;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMCallBack') else _udebug := nil;{$ENDIF}

  FFrameClass := nil;
  
  case M.LParam of
    CA_MEASURES:    FFrameClass := TfmMeasures;
    CA_ACCOUNTTYPE: FFrameClass := TfmAccountType;
    CA_WHOUSE:      FFrameClass := TfmWhouse;
    CA_COUNTRIES:   FFrameClass := TfmCountries;
    CA_BANKS:       FFrameClass := TfmBank;
    CA_MATERIALS:   FFrameClass := TfmMaterials;
    CA_KAGENTS:     FFrameClass := TfmKAgent;
    CA_CURRENCY:    FFrameClass := TfmCurrency;
    CA_WMAT:        FFrameClass := TfmWMat;
    CA_WBIN:        FFrameClass := TfmWaybill;
    CA_PAYDOCIN, CA_PAYDOCOUT: FFrameClass := TfmPayDoc;
    CA_PRICETYPES:  FFrameClass := TfmPriceTypes;
  end;

  for i := 0 to FrameList.FramesCount - 1 do
    if (FrameList.Items[i] is FFrameClass)
       and
       (
        (M.WParam <> ServerAddr)
        or
        (
         (M.WParam <> ServerAddr)
         and
         (
          (FrameList.FcurrFrame is FFrameClass) or ( (FrameList.FcurrFrame is FFrameClass) and (frmMainForm.ActiveMDIChild <> Self) )
         )
        )
       )
      then FrameList.Items[i].DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMInputLangChangeRequest(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMInputLangChangeRequest') else _udebug := nil;{$ENDIF}

  //showmessage(inttostr(m.lparam));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.WMInputLangChange(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMInputLangChange') else _udebug := nil;{$ENDIF}

  //showmessage('change');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  txtLang.Caption := keyboardIndicator;
  txtLang2.Caption := txtLang.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormKeyDown') else _udebug := nil;{$ENDIF}

  if ((Key = Ord('F')) or (Key = VK_DOWN)) and (ssCtrl in Shift) and panFindBottom.Visible then begin
    Key := 0;
    if edFind2.Visible then edFind2.SetFocus;
  end

  else if (Key = VK_UP) and (ssCtrl in Shift) then begin
    if FrameList.FcurrFrame <> nil then begin
      Key := 0;
      FrameList.FcurrFrame.DoSetFocus;
    end
  end

  else if (Key = VK_UP) and (Shift = []) then begin
    if edFind2.Focused then DoFind(aFind2, False)
    else if edFind.Focused then DoFind(aFind, False);
  end

  else if (Key = VK_DOWN) and (Shift = []) then begin
    if edFind2.Focused then DoFind(aFind2, True)
    else if edFind.Focused then DoFind(aFind, False);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aPatternNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPatternNewExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPatternInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aTreePropsExecute(Sender: TObject);
  var
    FSelInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aTreePropsExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  FSelInfo := TTreeItemInfo(tlMain.Selected.Data);
  //FNodeInfo := TTreeItemInfo(FNode.Data);

  if (FSelInfo.NodeType = -2) then begin
    with TfrmEditMaterials.Create(nil) do
      try
        MainHandle := Self.Handle;
        ParentNameEx := 'fmMaterials';
        OnDate := Self.OnDate;
        cbType.ItemIndex := 1;
        cbType.Enabled := False;
        lcbParent.Enabled := False;
        btnGrp.Enabled := False;

        ID := FSelInfo.ID;

        ShowModal;

      finally
        Free;
      end;
  end

  else if (FSelInfo.NodeType = nt_DiscCardCat) then begin
    with TfrmEditDiscCards.Create(nil) do
      try
        MainHandle := Self.Handle;
        ParentNameEx := 'fmDiscCards';
        OnDate := Self.OnDate;
        tsGroup.Show;

        ID := FSelInfo.ID;

        ShowModal;

      finally
        Free;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMRefresh') else _udebug := nil;{$ENDIF}

  case M.LParam of
    -1: with newDataSet do
          try
            Perform(WM_SETTREEITEM, PGrpInfo(M.WParam).ID, PGrpInfo(M.WParam).PID);
            ProviderName := 'pMatGroup_Get';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := PGrpInfo(M.WParam).ID;

            Open;
            if not IsEmpty then tlMain.Selected.Text := FieldByName('name').AsString;
            Close;

          finally
            Free;
          end;

    -2: with newDataSet do
          try
            Perform(WM_SETTREEITEM, PGrpInfo(M.WParam).ID, PGrpInfo(M.WParam).PID);
            ProviderName := 'pDCG_Get';
            FetchParams;
            Params.ParamByName('grpid').AsInteger := PGrpInfo(M.WParam).ID;

            Open;
            if not IsEmpty then tlMain.Selected.Text := FieldByName('name').AsString;
            Close;

          finally
            Free;
          end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aReconnectExecute(Sender: TObject);
  var
    i: Integer;
    FUser, FHost_: string;
    FDBID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aReconnectExecute') else _udebug := nil;{$ENDIF}

  with TokLoginClass.Create(nil) do
    try
      FDBID := dmData.SConnection.DBID;
      LoginType := ltProduction;
      SConn := dmData.SConnection;
      btnParamsClick(btnParams);

      if ShowModal = mrOk then begin
        Application.ProcessMessages;
        EntName := '';
        InitProfile(dmData.SConnection, UserID, ProfID, TreeID, dmData.scMain);
        frmMainForm.SetBtnStates;
        BaseCurrName := GetBaseCurrName(dmData.SConnection);

        with frmMainForm do begin
          for i := 0 to MDIChildCount - 1 do
            if MDIChildren[i].Handle <> Self.Handle then MDIChildren[i].Close;

          try
            for i := 0 to FrameList.FramesCount - 1 do FrameList.Items[i].Free;
          except
          end;

          FrameList.Clear;
          NotChangeDetail := True;
          //FrameList.Free;
          //FrameList := TssFrameList.Create(Self);
          ReloadRes;

          if Self.ViewType <> frmMainForm.GetEnabledView(Self.ViewType)
            then Self.ViewType := frmMainForm.GetEnabledView(Self.ViewType)
            else Self.RefreshTree(0);

          panNoAccess.Visible := frmMainForm.AllDisabled;
          NotChangeDetail := False;
          tlMain.Selected := tlMain.Items[0];
          panTitleButtons.Invalidate;
        end;
      end
      else if not dmData.SConnection.Connected
           then prFun.Login(dmData.SConnection, ltProduction, UserName, UserPass, HostAddr, FDBID, False);

      frmMainForm.RefreshStatusBar;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.btnLockClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.btnLockClick') else _udebug := nil;{$ENDIF}

  panTitleButtons.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aLockExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aLockExecute') else _udebug := nil;{$ENDIF}

  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.SetParam(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetParam') else _udebug := nil;{$ENDIF}

  FParam := Value;
  if FParam > 0 then begin
    btnByWHouse.Checked := True;
    aByGroup.Checked := False;
    //aByGroup.Enabled := False;
  end;

  if FrameList.FcurrFrame <> nil then FrameList.FcurrFrame.Param := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aPasteExecute(Sender: TObject);
  var
    strClip: string;
    i, FCount, FID: Integer;
    FEn: Boolean;
    IsSvc: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aPasteExecute') else _udebug := nil;{$ENDIF}

  NotChangeDetail := True;
  try // finally
    if PopupNode <> nil then tlMain.Selected := PopupNode;
    with Clipboard do begin
      strClip := AsText;
      IsSvc := Pos(ClipText + 'svc:', strClip) = 1;
      FEn := ((Pos(ClipText + 'mat:', strClip) = 1) and (TTreeItemInfo(PopupNode.Data).NodeType = -2)) or
             ((Pos(ClipText + 'svc:', strClip) = 1) and (TTreeItemInfo(PopupNode.Data).NodeType = nt_SvcCat));

      if not FEn then begin
        ssMessageDlg(rs('Common', 'ClipboardError'), ssmtError, [ssmbOk]);
        Exit;
      end;
    end;

    Delete(strClip, 1, Length(ClipText) + 4);
    FCount := WordCount(strClip, [';']);
    fProgress.Caption := rs('Common', 'Moving');
    fProgress.pbMain.Max := FCount;

    try
      fProgress.Show;
      fProgress.Update;

      for i := 1 to FCount do begin
        FID := StrToInt(ExtractWord(i, strClip, [';']));
        if not IsSvc then begin
          if SetNewMatParent(FID, TTreeItemInfo(tlMain.Selected.Data).ID) <> 0 then begin
            ssMessageDlg('Error!', ssmtError, [ssmbOk]);
            Exit;
          end;
        end // not isSvc
        else if SetNewSvcGroupParent(FID, TTreeItemInfo(tlMain.Selected.Data).ID) <> 0 then begin
          ssMessageDlg('Error!', ssmtError, [ssmbOk]);
          Exit;
        end;

        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

    finally
      fProgress.Hide;
    end;

    NotChangeDetail := False;
    tlMainChange(tlMain, tlMain.Selected);

  finally
    NotChangeDetail := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//=========================================================================
procedure TfrmCCMain.ExecRefresh(const AClass: string; ID: Integer; AParam: Integer = 0);
  var
    i: Integer;
    FID: Integer;
    FNode: TTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.ExecRefresh') else _udebug := nil;{$ENDIF}

  if AParam > 0 then begin
    SendMessage(Self.Handle, WM_REFRESHTREEITEM, ID, AParam);
    //Exit;
  end;

  if (ViewType = vtFinances) and (ID = -1) then begin
    //NotChangeDetail := True;
    GetLevel(FCashlessNode);
    FCashlessNode.Expand(False);
    tlMainChange(tlMain, tlMain.Selected);
    //NotChangeDetail := False;
  end

  else if (ViewType = vtWMat) and (AClass = TfmWMat.ClassName) and (ID = -1)
  then begin
    if aByWHouse.Checked then begin
      FID := TTreeItemInfo(tlMain.Selected.Data).ID;
      GetLevel(tlMain.Items[0]);
      tlMain.Items[0].Expand(False);
      NotChangeDetail := True;

      try
        FNode := SetTreeItem(tlMain.Items[0], FID);

      finally
        NotChangeDetail := False;
      end;

      if FNode = nil then tlMainChange(tlMain, tlMain.Selected);
    end;
  end
  else
    for i := 0 to FrameList.FramesCount - 1 do
      if FrameList.Items[i].ClassName = AClass
        then FrameList.Items[i].NeedRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aErrMessExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aErrMessExecute') else _udebug := nil;{$ENDIF}

  SendMsg;

 //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.splMainCanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.splMainCanResize') else _udebug := nil;{$ENDIF}

  if (FormStyle = fsNormal) and (NewSize > 210)
    then Accept := False
    else Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.GetFunctionName(const AClassName: string): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetFunctionName') else _udebug := nil;{$ENDIF}
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.SetTreeLng;
  var
    i: Integer;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetTreeLng') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pViewLng_Get';
      FetchParams;
      Params.ParamByName('shortname').AsString := LangName;
      Open;
      for i := 0 to tlMain.Items.Count - 1 do begin
        if (tlMain.Items[i].Text <> '') and ((TTreeItemInfo(tlMain.Items[i].Data).NodeType in [nt_Any, nt_Top])
            or (TTreeItemInfo(tlMain.Items[i].Data).NodeType = nt_Reports))
            and Locate('id', TTreeItemInfo(tlMain.Items[i].Data).ID, [])
        then begin
          tlMain.Items[i].Text := FieldByName('Name').AsString;
          TTreeItemInfo(tlMain.Items[i].Data).DisplayedName := FieldByName('Name').AsString;
        end;
      end;
      Close;

    finally
      Free;
    end;

  if (tlMain.Selected <> nil) and (TTreeItemInfo(tlMain.Selected.Data).NodeType = 1)
    then ReloadGroup(tlMain.Selected);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aWBMovPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aWBMovPrintExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aWBMovPrintWExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aWBMovPrintWExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aWBMovPrintPTExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aWBMovPrintPTExecute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.tlMainCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  var
    FRect: TRect;
    //_udebug: Tdebug;
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.tlMainCustomDrawItem') else _udebug := nil;{$ENDIF}

  try
    //if UserID = 0 then Exit;
    if Assigned(TTreeNode(Node.Data).Data) then begin
      if (Node.Data <> nil) and not TTreeItemInfo(Node.Data).Enabled and (TTreeItemInfo(Node.Data).NodeType <> 1)
      then Sender.Canvas.Font.Color := clBtnShadow;
    end;
    
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.lvGroupCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  var
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.lvGroupCustomDrawItem') else _udebug := nil;{$ENDIF}

  try
    //if UserID = 0 then Exit;
    if Assigned(TTreeNode(Item.Data).Data) then begin
      FInfo := TTreeItemInfo(TTreeNode(Item.Data).Data);

      if not FInfo.Enabled and (FInfo.NodeType <> 1)
        then Sender.Canvas.Font.Color := clBtnShadow;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.lvGroupGetImageIndex(Sender: TObject; Item: TListItem);
  var
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.lvGroupGetImageIndex') else _udebug := nil;{$ENDIF}

  try
    //if UserID = 0 then Exit;

    if Assigned(TTreeNode(Item.Data).Data) then begin
      FInfo := TTreeItemInfo(TTreeNode(Item.Data).Data);

      if FInfo.Enabled
        then Item.ImageIndex := FInfo.ImageIndex
        else Item.ImageIndex := FInfo.DisabledIndex;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FormActivate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FormActivate') else _udebug := nil;{$ENDIF}

  if FrameList.FcurrFrame <> nil then FrameList.FcurrFrame.DoActivate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.ExecLocate(const AClass: string; ID: Integer; GType: Integer = 0);
  var
    i: Integer;
    NeedNotify: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.ExecLocate') else _udebug := nil;{$ENDIF}

  NeedNotify := (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame.ClassName = AClass)
                and (frmMainForm.bufMain.Current.ClassName_ <> AClass);

  for i := 0 to tlMain.Items.Count - 1 do begin
    if (tlMain.Items.Item[i].Text <> '') and
       (TTreeItemInfo(tlMain.Items.Item[i].Data).refersClassName = AClass) and
       ((TTreeItemInfo(tlMain.Items.Item[i].Data).utv_gType = GType) or (GType = 0)
         or (AClass = TfmWMat.ClassName) or (AClass = TfmWaybill.ClassName)
         or (AClass = TfmWBRest.ClassName) or (AClass = TfmWaybillMov.ClassName)
         or (AClass = TfmWBReturnIn.ClassName) or (AClass = TfmMaterials.ClassName))
    then begin
      tlMain.Selected := tlMain.Items.Item[i];

      if -1 <> AnsiIndexStr(AClass, [TfmWMat.ClassName, TfmWaybill.ClassName, TfmWaybillMov.ClassName,
                                     TfmWBRest.ClassName, TfmMaterials.ClassName, TfmWBReturnIn.ClassName])
        then FrameList.FcurrFrame.DoLocate(ID, GType)
        else FrameList.FcurrFrame.DoLocate(ID);

      if NeedNotify then FrameList.FcurrFrame.NotifyChanged;

      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.RefreshWH;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.RefreshWH') else _udebug := nil;{$ENDIF}

  if aByGroup.Checked then begin
    GetLevel(WMatNode);
    WMatNode.Expand(False);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetSvcGroupLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetSvcGroupLevel') else _udebug := nil;{$ENDIF}
                 
  tlMain.Items.BeginUpdate;
  with newDataSet do
  try
    //DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;

    if ANode <> FSvcNode then begin
      ProviderName := 'pSvcGroup_GetLevel';
      FetchParams;
      Params.ParamByName('pid').AsInteger := TTreeItemInfo(ANode.Data).ID;
    end
    else ProviderName := 'pSvcGroup_GetRootLevel';
    Open;

    while not Eof do begin
      FNode := tlMain.Items.AddChild(ANode, FieldByName('name').AsString);
      FInfo := TTreeItemInfo.Create;
      FInfo.ID := FieldByName('svcid').AsInteger;
      FInfo.DisplayedName := FieldByName('name').AsString;
      FInfo.ImageIndex := 14;
      FInfo.FunID := 38;
      FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
      FInfo.Enabled := True;
      FInfo.NodeType := nt_SvcCat; //группы услуг
      FInfo.utv_gType := TTreeItemInfo(ANode.Data).utv_gType;
      FNode.Data := FInfo;
      tlMain.Items.AddChild(FNode, '');
      Next;
    end;
    Close;

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.UpdateSvcGroup(ANode: TTreeNode; const S: string): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  Result := False;
  if S = '' then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdateSvcGroup') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    try
      ProviderName := 'pSvcGroup_UpdName';
      FetchParams;
      Params.ParamByName('svcid').AsInteger := TTreeItemInfo(ANode.Data).ID;
      Params.ParamByName('name').AsString := S;
      Execute;

      Result := True;

    finally
      Free;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.LocateSvcGroup(ANode: TTreeNode; AID, APID: integer; ANew: boolean);
  var
    FSvcNode: TTreeNode;
    s: string;
    IsMat: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function GetMatNode(ANode: TTreeNode; ANodeType: integer): TTreeNode;
  begin
    if TTreeItemInfo(ANode.Data).NodeType <> ANodeType
      then Result := ANode
      else Result := GetMatNode(ANode.Parent, ANodeType);
  end;

  procedure ExpandToParent(ANode: TTreeNode);
  begin
    if (ANode.Parent <> nil) and not ANode.Parent.Expanded then begin
      ANode.Parent.Expand(False);
      ExpandToParent(ANode.Parent);
    end;
  end;

  function LocateNode(AValue: integer): boolean;
    var i: Integer;
  begin
    Result := False;

    for i := 0 to tlMain.Items.Count - 1 do begin
      if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).ID = AValue) and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = nt_SvcCat)
      then begin
        ExpandToParent(tlMain.Items[i]);
        tlMain.Selected := tlMain.Items[i];
        if ANew then tlMain.Selected.DeleteChildren;
        Result := True;
        Exit;
      end
      else if (tlMain.Items[i].Text<>'') and (TTreeItemInfo(tlMain.Items[i].Data).ID=APID)
              and (TTreeItemInfo(tlMain.Items[i].Data).NodeType=nt_SvcCat) and ANew
           then GetLevel(tlMain.Items[i]);
    end;
  end;

  procedure GetParent(AID: integer; var s: string; DS: TDataSet);
    var BM: TBookmark;
  begin
    BM := DS.GetBookmark;
    try
      DS.First;
      while not DS.Eof do begin
        if (DS.FieldByName('svcid').AsInteger=AID) and (DS.FieldByName('pid').AsInteger<>AID) then begin
          s := DS.FieldByName('pid').AsString+','+s;
          GetParent(DS.FieldByName('pid').AsInteger, s, DS);
        end;
        DS.Next;
      end;
      DS.GotoBookmark(BM);

    finally
      DS.FreeBookmark(BM);
    end;
  end;

  function GetParentSeq(AID: integer): string;
  begin
    Result := IntToStr(AID);

    with newDataSet do
      try
        ProviderName := 'pSvcGroup_List';
        Open;
        GetParent(AID, Result, Fields[0].DataSet);
        Close;

      finally
        Free;
      end;
  end;

  procedure ExpandSeq(s: string);
    var
      i: integer;
      FNode: TTreeNode;
      wc: integer;
  begin
    FNode := FSvcNode;
    wc := WordCount(s, [',']);
    for i := 1 to wc do begin
      //if (FNode.Count = 0) then GetLevel(FNode);
      if i < wc then begin
         FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])), False);
      end
      else FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])));
    end;
  end;

begin
  if ANode = nil then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LocateSvcGroup') else _udebug := nil;{$ENDIF}

  if Self.FormStyle = fsNormal
    then IsMat := (ViewType = vtServices)
    else IsMat := FrameList.FcurrFrame is TfmServices;

  FSvcNode := GetMatNode(ANode, nt_SvcCat);

  if AID = 0 then begin
    tlMain.Selected := FSvcNode;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if (FSvcNode.Count = 0) or (FSvcNode.Item[0].Text = '') or ((APID = 0) and ANew) or ((APID = AID) and ANew)
    then GetLevel(FSvcNode);

  tlMain.Items.BeginUpdate;

  try
    if (APID <> 0) and not ANew and (ANode.Count > 0) and (ANode.Item[0].Text = '') then GetLevel(ANode);
    NotChangeDetail := True;
    //if ANew and (APID<>0) then LocateNode(APID);
    if not LocateNode(AID) then begin
      s := GetParentSeq(AID);
      ExpandSeq(s);
    end;

  finally
    NotChangeDetail := False;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.LocateDiscGroup(ANode: TTreeNode; AID, APID: integer; ANew: boolean);
  var
    s: string;
    IsMat: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  //----------------------------------------------------
  procedure ExpandToParent(ANode: TTreeNode);
  begin
    if (ANode.Parent <> nil) and not ANode.Parent.Expanded then begin
      ANode.Parent.Expand(False);
      ExpandToParent(ANode.Parent);
    end;
  end;

  //----------------------------------------------------
  function LocateNode(AValue: integer): boolean;
    var i: Integer;
  begin
    Result := False;

    for i := 0 to tlMain.Items.Count - 1 do begin
      if (tlMain.Items[i].Text<>'') and (TTreeItemInfo(tlMain.Items[i].Data).ID=AValue)
         and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = nt_DiscCardCat)
      then begin
        ExpandToParent(tlMain.Items[i]);
        tlMain.Selected := tlMain.Items[i];

        if ANew then tlMain.Selected.DeleteChildren;

        Result := True;
        Exit;
      end
      else if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).ID = APID)
               and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = nt_DiscCardCat) and ANew
           then GetLevel(tlMain.Items[i]);
    end;
  end;

  //----------------------------------------------------
  procedure GetParent(AID: integer; var s: string; DS: TDataSet);
    var BM: TBookmark;
  begin
    BM := DS.GetBookmark;

    try
      DS.First;
      while not DS.Eof do begin
        if (DS.FieldByName('grpid').AsInteger = AID) and (DS.FieldByName('pid').AsInteger <> AID)
        then begin
          s := DS.FieldByName('pid').AsString + ',' + s;
          GetParent(DS.FieldByName('pid').AsInteger, s, DS);
        end;
        DS.Next;
      end;
      DS.GotoBookmark(BM);

    finally
      DS.FreeBookmark(BM);
    end;
  end;

  //----------------------------------------------------
  function GetParentSeq(AID: integer): string;
  begin
    Result := IntToStr(AID);
    with newDataSet do
      try
        ProviderName := 'pDCG_List';
        Open;
        GetParent(AID, Result, Fields[0].DataSet);
        Close;

      finally
        Free;
      end;
  end;

  //----------------------------------------------------
  procedure ExpandSeq(s: string);
    var
      i: integer;
      FNode: TTreeNode;
      wc: integer;
  begin
    FNode := FDCNode;
    wc := WordCount(s, [',']);
    for i := 1 to wc do begin
      //if (FNode.Count = 0) then GetLevel(FNode);
      if i < wc
        then FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])), False)
        else FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])));
    end;
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.LocateDiscGroup') else _udebug := nil;{$ENDIF}

  if ANode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if AID = 0 then begin
    tlMain.Selected := FDCNode;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if (FDCNode.Count = 0) or (FDCNode.Item[0].Text='') or ((APID=0) and ANew) or ((APID=AID) and ANew)
    then GetLevel(FDCNode);

  tlMain.Items.BeginUpdate;
  try
    if (APID<>0) and not ANew and (ANode.Count>0) and (ANode.Item[0].Text='')
      then GetLevel(ANode);

    NotChangeDetail := True;

    //if ANew and (APID<>0) then LocateNode(APID);

    if not LocateNode(AID) then begin
      s := GetParentSeq(AID);
      ExpandSeq(s);
    end;

  finally
    NotChangeDetail := False;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.SetNewSvcGroupParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetNewSvcGroupParent') else _udebug := nil;{$ENDIF}

  Result := 0;

  if IsCyclingRef(dmData.SConnection, 'services', 'svcid', 'pid', AID, APID) then begin
    Result := -2;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try
    try
      ProviderName := 'pSvcGroup_UpdParent';
      FetchParams;
      Params.ParamByName('svcid').AsInteger := AID;
      Params.ParamByName('pid').AsInteger := APID;
      Execute;

    except
      Result := -1;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.btnShowGrpClick(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.btnShowGrpClick') else _udebug := nil;{$ENDIF}

  if WMatNode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if btnShowGrp.Checked then begin
    for i := 0 to WMatNode.Count - 1 do tlMain.Items.AddChild(WMatNode.Item[i], '');
  end
  else begin
    for i := 0 to WMatNode.Count - 1 do begin
      DeleteTreeItemInfo(WMatNode.Item[i]);
      WMatNode.Item[i].DeleteChildren;
    end;
  end;

  tlMainChange(tlMain, tlMain.Selected);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.GetWIDByNode(ANode: TTreeNode): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetWIDByNode') else _udebug := nil;{$ENDIF}

  Result := 0;

  if TTreeItemInfo(ANode.Data).NodeType = -4 then begin
    Result := TTreeItemInfo(ANode.Data).ID;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end

  else if Assigned(ANode.Parent)
    then Result := GetWIDByNode(ANode.Parent);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSetFindStr(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSetFindStr') else _udebug := nil;{$ENDIF}

  FFindLock := True;
  try
    edFind2.Text := string(Pointer(M.WParam)^);
  finally
    FFindLock := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=========================================================================
procedure TfrmCCMain.GetCashDeskLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetCashDeskLevel') else _udebug := nil;{$ENDIF}

  tlMain.Items.BeginUpdate;

  with newDataSet do
  try
    DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;
    ProviderName := 'pCashDesks_List';
    Open;
    while not Eof do begin
      FNode := tlMain.Items.AddChild(ANode, FieldByName('name').AsString);
      FInfo := TTreeItemInfo.Create;
      FInfo.ID := FieldByName('cashid').AsInteger;
      FInfo.DisplayedName := FieldByName('name').AsString;
      FInfo.ImageIndex := TTreeItemInfo(ANode.Data).ImageIndex;
      FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
      FInfo.NodeType := nt_Finances;
      FInfo.Enabled := True;
      FInfo.utv_gType := utv_gType_Finances;
      FNode.Data := FInfo;
      Next;
    end;
    Close;

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetEntAccLevel(ANode: TTreeNode);
 var
   FNode: TTreeNode;
   FInfo: TTreeItemInfo;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetEntAccLevel') else _udebug := nil;{$ENDIF}

  tlMain.Items.BeginUpdate;

  with newDataSet do
  try
    DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;
    ProviderName := 'p_EntAccounts_List';
    Open;
    while not Eof do begin
      FNode := tlMain.Items.AddChild(ANode, FieldByName('accnum').AsString);
      FInfo := TTreeItemInfo.Create;
      FInfo.ID := FieldByName('accid').AsInteger;
      FInfo.DisplayedName := FieldByName('accnum').AsString;
      FInfo.ImageIndex := 23;
      FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
      FInfo.NodeType := nt_BankAccounts; //счета
      FInfo.Enabled  := True;
      FInfo.utv_gType := utv_gType_Finances;
      FNode.Data := FInfo;
      Next;
    end;
    Close;

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMRefreshTreeItem(var M: TMessage);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMRefreshTreeItem') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtCashDesks:
      if ViewType = vtFinances then RefreshNode(FCashNode);

    rtEntAcc:
      if ViewType = vtFinances then RefreshNode(FCashlessNode);

    rtWebShops: // Wparam = WebShop ID
      if FWebShopNodes <> nil then begin
        for i := 0 to FWebShopNodes.Count do
          if TTreeItemInfo(TTreeNode(FWebShopNodes[i]).Data).ID = M.WParam
          then begin
            RefreshNode(TTreeNode(FWebShopNodes[i]));
            Break;
          end;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.RefreshNode(ANode: TTreeNode);
  var
    Exp: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.RefreshNode') else _udebug := nil;{$ENDIF}

  Exp := ANode.Expanded;
  tlMain.Items.BeginUpdate;

  try
    GetLevel(ANode);

    if Exp then ANode.Expand(False);

  finally
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.ActionList1Update') else _udebug := nil;{$ENDIF}

  if FormStyle = fsNormal then begin
    if (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame is TfmWMat) and (TfmWMat(FrameList.FcurrFrame).FMode < 2)
      then aSelect.Enabled := TfmWMat(FrameList.FcurrFrame).CurrAmount > 0
      else aSelect.Enabled := (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame.CurrentID > 0);
  end;

  {if frmMainForm.ActiveMDIChild <> Self then Exit;

  aDirUp.Enabled := (tlMain.Selected<>nil) and (tlMain.Selected.Parent<>nil) and not (RefType in [rtPersons, rtEnt]);
  aView.Enabled := not panData.Visible;
  aTreeColExp.Enabled := (tlMain.Selected<>nil) and (tlMain.Selected.Count>0);

  if (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame is TfmWMat) and (TfmWMat(FrameList.FcurrFrame).FMode < 2)
   then aSelect.Enabled := TfmWMat(FrameList.FcurrFrame).CurrAmount > 0
   else aSelect.Enabled := (FrameList.FcurrFrame<>nil) and (FrameList.FcurrFrame.CurrentID > 0);

  aReconnect.Enabled := Self.FormStyle = fsMDIChild;

  aByGroup.Enabled := (tlMain.Selected<>nil) and (TTreeItemInfo(tlMain.Selected.Data).utv_gType=4) and (FParam<=0);
  aByWHouse.Enabled := aByGroup.Enabled;
  }

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aWBMovPrintTorg13Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aWBMovPrintTorg13Execute') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.DoPrint(3);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMSearchFailed(var M: TMessage);
  var
    ed: TcxTextEdit;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMSearchFailed') else _udebug := nil;{$ENDIF}

  if edFind.Focused
    then ed := edFind
    else ed := edFind2;

  ed.Style.Color := okSearchFailedColor;
  Application.ProcessMessages;
  Beep;
  Sleep(100);
  ed.Style.Color := clWindow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.FrameListChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.FrameListChange') else _udebug := nil;{$ENDIF}

  FrameList.FcurrFrame.NotifyChanged;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.Button1Click(Sender: TObject);
  {var
    s, n: extended;
    arr: array of Variant;
    }
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.Button1Click') else _udebug := nil;{$ENDIF}

  {dmData.scMain.Style.Font.CHARSET := ANSI_CHARSET;
  dmData.scMain.Style.Font.Name := 'Times New Roman';
  ndscalc(8000000, 0.06, 18, 1, s, n);
  showmessage(formatfloat(',0.00', s) + ' | ' + formatfloat(',0.00', n) + ' | ' + formatfloat(',0.00', s+n));
  dmData.SConnection.AppServer.db_Copy(45, 'countries,measures,matgroup,materials,matchange');
  dmData.SConnection.AppServer.db_Copy(45, 'taxes', 1);
  arr := VarArrayOf([1, 2, 4, 8, 5]);
  ShowMessage(OKR_BuildQuery(2, 100, arr));
  }

  //frDesignerClass := TokDesignerForm;
  //frDoc.designreport;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.GetDCGroupLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    FInfo: TTreeItemInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetDCGroupLevel') else _udebug := nil;{$ENDIF}

  tlMain.Items.BeginUpdate;

  with newDataSet do
  try
    //DeleteTreeItemInfo(ANode);
    ANode.DeleteChildren;
    if ANode <> FDCNode then begin
      ProviderName := 'pDCGroup_GetLevel';
      FetchParams;
      Params.ParamByName('pid').AsInteger := TTreeItemInfo(ANode.Data).ID;
    end
    else ProviderName := 'pDCGroup_GetRootLevel';

    Open;

    while not Eof do begin
      FNode := tlMain.Items.AddChild(ANode, FieldByName('name').AsString);
      FInfo := TTreeItemInfo.Create;
      FInfo.ID := FieldByName('grpid').AsInteger;
      FInfo.DisplayedName := FieldByName('name').AsString;
      FInfo.ImageIndex := II_DISC_CARDS;
      FInfo.FunID := 66;
      FInfo.refersClassName := TTreeItemInfo(ANode.Data).refersClassName;
      FInfo.Enabled := True;
      FInfo.NodeType := nt_DiscCardCat; //группы дисконтных карт
      FNode.Data := FInfo;

      tlMain.Items.AddChild(FNode, '');

      Next;
    end;
    Close;

  finally
    Free;
    tlMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.aNewDCGroupExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.aNewDCGroupExecute') else _udebug := nil;{$ENDIF}

  if PopupNode <> nil then tlMain.Selected := PopupNode;

  if FrameList.CurrentFrame = TfmDiscCards.ClassName
    then TfmDiscCards(FrameList.FcurrFrame).aNewGrp.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.UpdateDCGroup(ANode: TTreeNode; const S: string): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  Result := False;

  if S = '' then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdateDCGroup') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    try
      ProviderName := 'pDCG_UpdName';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := TTreeItemInfo(ANode.Data).ID;
      Params.ParamByName('name').AsString := S;
      Execute;

      Result := True;

    finally
      Free;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.SetNewDCGParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetNewDCGParent') else _udebug := nil;{$ENDIF}

  Result := 0;

  if IsCyclingRef(dmData.SConnection, 'disccardgrp', 'grpid', 'pid', AID, APID) then begin
    Result := -2;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try
    try
      ProviderName := 'pDCG_UpdParent';
      FetchParams;
      Params.ParamByName('grpid').AsInteger := AID;
      Params.ParamByName('pid').AsInteger := APID;
      Execute;

    except
      Result := -1;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.SetNewDCParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.SetNewDCParent') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
  try
    try
      ProviderName := 'pDC_UpdParent';
      FetchParams;
      Params.ParamByName('cardid').AsInteger := AID;

      if APID = 0 then begin
        Params.ParamByName('grpid').DataType := ftInteger;
        Params.ParamByName('grpid').Clear;
      end
      else Params.ParamByName('grpid').AsInteger := APID;

      Execute;

    except
      Result := -1;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.UpdTreeActions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.UpdTreeActions') else _udebug := nil;{$ENDIF}


  aDirUp.Enabled := (tlMain.Selected <> nil) and (tlMain.Selected.Parent <> nil) and not (RefType in [rtPersons, rtEnt]);
  aView.Enabled := not panData.Visible;
  aTreeColExp.Enabled := (tlMain.Selected <> nil) and (tlMain.Selected.Count > 0);

  if (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame is TfmWMat) and (TfmWMat(FrameList.FcurrFrame).FMode < 2)
    then aSelect.Enabled := (TfmWMat(FrameList.FcurrFrame).CurrAmount > 0)
    else aSelect.Enabled := (FrameList.FcurrFrame <> nil) and (FrameList.FcurrFrame.CurrentID > 0);

  aReconnect.Enabled := (Self.FormStyle = fsMDIChild);
  aByGroup.Enabled := (tlMain.Selected <> nil) and (TTreeItemInfo(tlMain.Selected.Data).utv_gType = 4) and (FParam <= 0);
  aByWHouse.Enabled := aByGroup.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.DoFind(Sender: TObject; AFwd: Boolean);
  var
    FName: string;
    i: Integer;
    FType: TLocateType;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.DoFind') else _udebug := nil;{$ENDIF}

  FInSearch := True;

  try
    FType := ltBegin;

    with FFindList do
      for i := 0 to Count - 1 do
        if TTBItem(Items[i]).Checked
          then FName := ExtractWord(2, FFindListNames.Strings[i], [';']);

    if aFindConcurr.Checked then FType := ltFull
    else if aFindBegin.Checked then FType := ltBegin
    else if aFindSubstr.Checked then FType := ltSubstr;

    if TComponent(Sender).Tag = 0
      then FrameList.FcurrFrame.DoFind(FName, edFind.Text, FType, AFwd)
      else FrameList.FcurrFrame.DoFind(FName, edFind2.Text, FType, AFwd)

  finally
    FInSearch := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
function TfrmCCMain.GetWHNode(ANode: TTreeNode): TTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.GetWHNode') else _udebug := nil;{$ENDIF}

  Result := ANode.Parent;

  while Result.Parent <> WMatNode do Result := Result.Parent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.WMItemMoved(var M: TMessage); // called when frmEditMaterials changed parent for current tree item
  var
    Fnode: TTreeNode;
    Res, i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.WMItemMoved') else _udebug := nil;{$ENDIF}

  {Fnode := tlMain.Selected;
  while TTreeItemInfo(FNode.Parent.Data).refersClassName = TfmMaterials.ClassName do
    Fnode := Fnode.Parent;
  }
  FNode := nil;
  for i := 0 to tlMain.Items.Count - 1 do
    if (tlMain.Items[i].Text <> '') and (TTreeItemInfo(tlMain.Items[i].Data).ID = M.LParam)
       and (TTreeItemInfo(tlMain.Items[i].Data).NodeType = -2)
    then begin
      FNode := tlMain.Items[i];
      break;
    end;

  if Fnode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} exit; end;

  if TTreeItemInfo(FNode.Data).NodeType = -2
    then Res := SetNewMatGroupParent(TTreeItemInfo(tlMain.Selected.Data).ID, M.LParam)
    else Res := SetNewMatGroupParent(TTreeItemInfo(tlMain.Selected.Data).ID, TTreeItemInfo(tlMain.Selected.Data).ID);

  //GetLevel(FNode);

  {repeat
    FNode := FNode.GetNext;
  until (FNode.Data <> nil) and (TTreeItemInfo(FNode.Data).ID = M.LParam);
  }
  if Res = 0 then begin
    if not FNode.Expanded then FNode.Expand(False);

    tlMain.Selected.MoveTo(FNode, naAddChild);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=========================================================================
procedure TfrmCCMain.miNewWebCatAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  var
    tvnode: TTreeNode;
    Node: TapTreeNode;
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  inherited;

  Accept := False;
  s := trim(NewText);
  if s = '' then exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCCMain.miNewWebCatAcceptText') else _udebug := nil;{$ENDIF}

  node := TapTreeNode(TTreeItemInfo(tlMain.Selected.Data).UserData);

  if nil <> Node.FindFirst(s, False) then begin // some child has this name
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Node := Node.AddChild(s);
  tvnode := tlMain.Items.AddChildObject(tlMain.Selected, s, node);
  MakeWebCatNode(tvNode, tlMain.Selected, node);

  addWebCatData(node, tvNode, nil); // not adding lang nodes to tlMain though (source is in EditWebShop module)
  node.Save(False);

  Accept := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('CCMain', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//=========================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.


