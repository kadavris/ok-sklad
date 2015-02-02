{$I ok_sklad.inc}
unit EditPriceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, ActnList, ssFormStorage, ImgList, xButton, xLngDefs,
  ssGradientPanel, ssSpeedButton, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, cxMemo,
  cxGroupBox, ssGroupBox, cxSplitter, dxCntner6, dxTL6, dxDBCtrl6, dxDBTL6,
  DB, DBClient, ssClientDataSet, ssMemDS, dxmdaset, TB2Item, Menus,
  TB2ExtItems, dxDBTLCl6, Grids, DBGrids, ssDBLookupCombo, ssBevel, ssBaseConst,
  dxDBGrid6, FR_Class, FR_DBSet, FR_DSet, cxPC, BaseFrame, fNA,
  XLSExportComp, ssXLSExport, ssPanel, dxGrClms6, FR_Cross;

type
  TfrmEditPriceList = class(TBaseDlg)
    aAddGrp: TAction;
    aAddMat: TAction;
    aAddSvc: TAction;
    aAddSvcGrp: TAction;
    aAlignCenter: TAction;
    aAlignLeft: TAction;
    aAlignRight: TAction;
    aColsParams: TAction;
    aColums: TAction;
    aContextFind: TAction;
    aCreateColum: TAction;
    aCurrClick: TAction;
    aDel: TAction;
    aDeleteColum: TAction;
    aExpandAll: TAction;
    aExport: TAction;
    aFind: TAction;
    aFindBegin: TAction;
    aFindConcurr: TAction;
    aFindParams: TAction;
    aFindSubstr: TAction;
    aGetWMat: TAction;
    aIns: TAction;
    aMatInfo: TAction;
    aPriceClick: TAction;
    aPrint: TAction;
    aPropMat: TAction;
    aRefMat: TAction;
    aRefServ: TAction;
    aRefSet: TAction;
    aSelectAll: TAction;
    aSetAmount: TAction;
    aSetColums: TAction;
    aSetKurs: TAction;
    aSetPriceDef: TAction;
    aSetPriceDefAll: TAction;
    aShowAmount: TAction;
    aShowArt: TAction;
    aShowMsr: TAction;
    aShowName: TAction;
    aShowProdImage: TAction;
    aSvcInfo: TAction;
    aUseLogo: TAction;
    btnAdd: TssSpeedButton;
    btnColsParam: TssSpeedButton;
    btnDel: TssSpeedButton;
    btnFind: TssSpeedButton;
    btnFindParams: TssSpeedButton;
    btnFullExpand: TssSpeedButton;
    btnGetWMat: TssSpeedButton;
    btnMatInfo: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnProps: TssSpeedButton;
    btnRefMat: TssSpeedButton;
    btnRefServ: TssSpeedButton;
    btnSvcInfo: TssSpeedButton;
    btnUseLogo: TssSpeedButton;
    cbCurr: TssDBLookupCombo;
    cdsCurr: TssClientDataSet;
    cdsCurrCURRID: TIntegerField;
    cdsCurrCURTYPE: TIntegerField;
    cdsCurrDEF: TIntegerField;
    cdsCurrDELETED: TIntegerField;
    cdsCurrNAME: TStringField;
    cdsCurrREPFRACNAME: TStringField;
    cdsCurrREPSHORTNAME: TStringField;
    cdsCurrSHORTNAME: TStringField;
    cdsMatRef: TssClientDataSet;
    cdsSrvRef: TssClientDataSet;
    colRefArt: TdxDBTreeListColumn;
    colRefId: TdxDBTreeListColumn;
    colRefIsGroup: TdxDBTreeListColumn;
    colRefMsrName: TdxDBTreeListColumn;
    colRefName: TdxDBTreeListColumn;
    colRefPid: TdxDBTreeListColumn;
    colRefPrice: TdxDBTreeListColumn;
    colRefRemain: TdxDBTreeListColumn;
    colSvcArtikul: TdxDBTreeListColumn;
    colSvcId: TdxDBTreeListColumn;
    colSvcISGROUP: TdxDBTreeListColumn;
    colSvcMsrName: TdxDBTreeListColumn;
    colSvcName: TdxDBTreeListColumn;
    colSvcPid: TdxDBTreeListColumn;
    colSvcPrice: TdxDBTreeListColumn;
    colSvcRemain: TdxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    DataSource1: TDataSource;
    dbgListDet: TdxDBGrid;
    dbgRef: TdxDBTreeList;
    dbgSrv: TdxDBTreeList;
    dsCurr: TDataSource;
    dsListDet: TDataSource;
    dsMatRef: TDataSource;
    dsSrvRef: TDataSource;
    edDate: TcxDateEdit;
    edFind: TcxTextEdit;
    edName: TcxTextEdit;
    edNotes: TcxMemo;
    fmNA2: TfmNA;
    frCrossObject1: TfrCrossObject;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    frUserDataset1: TfrUserDataset;
    frUserDataset2: TfrUserDataset;
    gbMainInfo: TssGroupBox;
    gbNotes: TssGroupBox;
    gbPositions: TssGroupBox;
    gbRef: TssGroupBox;
    lCurr: TLabel;
    lKurs: TLabel;
    lName: TLabel;
    lNotes: TLabel;
    lOndate: TLabel;
    mdCols: TdxMemData;
    mdColsColName: TStringField;
    mdColsCurrId: TStringField;
    mdListDet: TssMemoryData;
    mnuPosArtikul: TTBItem;
    mnuPosName: TTBItem;
    PageMat: TcxTabSheet;
    PageServ: TcxTabSheet;
    PageSet: TcxTabSheet;
    panHeader: TPanel;
    panPosBtn: TPanel;
    PanPositions: TPanel;
    panRef: TPanel;
    panRefPosBtn: TPanel;
    pcRef: TcxPageControl;
    pmFind: TTBPopupMenu;
    pmListDet: TTBPopupMenu;
    pmMatSvc: TTBPopupMenu;
    pmRef: TTBPopupMenu;
    sbKurs: TssSpeedButton;
    sepDyn: TBevel;
    ssSpeedButton1: TssSpeedButton;
    tbAlCenter: TTBItem;
    tbAlLeft: TTBItem;
    tbAlRight: TTBItem;
    tbColName: TTBEditItem;
    tbCreateNewColum: TTBItem;
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
    TBItem1: TTBItem;
    TBItem20: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    tbSetCols: TTBItem;
    tbShowAmount: TTBItem;
    tbShowArt: TTBItem;
    tbShowMsr: TTBItem;
    tbShowName: TTBItem;
    tbShowProdImage: TTBItem;
    TBSubCols: TTBSubmenuItem;
    TBSubmenuItem1: TTBSubmenuItem;
    txtLang: TLabel;
    xlsExpFile: TXLSExportFile;
    xlsExport: TssXLSExport;

    procedure aAddGrp1Execute(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddSvcExecute(Sender: TObject);
    procedure aAddSvcGrpExecute(Sender: TObject);
    procedure aAlignCenterExecute(Sender: TObject);
    procedure aAlignLeftExecute(Sender: TObject);
    procedure aAlignRightExecute(Sender: TObject);
    procedure aColsParamsExecute(Sender: TObject);
    procedure aContextFindExecute(Sender: TObject);
    procedure aCreateColumExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurrClickExecute(Sender: TObject);
    procedure aDeleteColumExecute(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aExpandAllExecute(Sender: TObject);
    procedure aExportExecute(Sender: TObject);
    procedure aFindBeginExecute(Sender: TObject);
    procedure aFindConcurrExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure aFindParamsExecute(Sender: TObject);
    procedure aFindSubstrExecute(Sender: TObject);
    procedure aGetWMatExecute(Sender: TObject);
    procedure aInsExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aPriceClickExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPropMatExecute(Sender: TObject);
    procedure aRefMatExecute(Sender: TObject);
    procedure aRefServExecute(Sender: TObject);
    procedure aRefSetExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSendErrMessageExecute(Sender: TObject);
    procedure aSetAmountExecute(Sender: TObject);
    procedure aSetKursExecute(Sender: TObject);
    procedure aSetPriceDefAllExecute(Sender: TObject);
    procedure aSetPriceDefExecute(Sender: TObject);
    procedure aShowAmountExecute(Sender: TObject);
    procedure aShowArtExecute(Sender: TObject);
    procedure aShowMsrExecute(Sender: TObject);
    procedure aShowNameExecute(Sender: TObject);
    procedure aShowProdImageExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure aUseLogoExecute(Sender: TObject);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure dbgListDet1GetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure dbgListDetChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
    procedure dbgListDetChangedColumnsWidth(Sender: TObject);
    procedure dbgListDetColumn1CustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgListDetColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure dbgListDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgListDetDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgListDetDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
    procedure dbgListDetDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgListDetRecIdGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgRefCanNodeSelected(Sender: TObject; ANode: TdxTreeListNode; var Allow: Boolean);
    procedure dbgRefDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgRefGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure dbgSrvGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure edDatePropertiesChange(Sender: TObject);
    procedure edFindPropertiesChange(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNotesPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure frReport1PrintColumn(ColNo: Integer; var Width: Integer);
    procedure mdListDet1AfterDelete(DataSet: TDataSet);
    procedure mdListDet1AfterPost(DataSet: TDataSet);
    procedure mnuPosArtikulClick(Sender: TObject);
    procedure mnuPosNameClick(Sender: TObject);
    procedure mpItemNameAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure pmListDetPopup(Sender: TObject);

  private
    FOnActivate: boolean;
    blobds: TssClientDataSet; // for images fetching
    colProdImage: TdxDBTreeListImageColumn;

    function  CanSelectNode(ANode: TdxTreeListNode):boolean;
    function  CopyFromRef: boolean;
    function  CopyFromSvc: boolean;
    function  GetSelCountEx(ATL:TdxDBTreeList):Integer;
    function  GetSvcPrice(SvcId:Integer;OnDate:TDateTime):Extended;
    function  IsParenSel(ANode:TdxTreeListNode):boolean;
    procedure CopyNodesCh(ANode:TdxTreeListNode);
    procedure FindRefPos;
    procedure SaveNodesCh(ANode:TdxTreeListNode; mIns1:string; var TmpId:integer);
    procedure SelParents(ANode:TdxTreeListNode);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    ColsWidth,VisColCount,CurWidth,CurAlign:integer;
    CurKurs : Extended;
    ExportLIst: TStringList;
    FindIndex: Integer;
    FindStr: string;
    FRateDate: TDateTime;
    FRateID: integer;

    function  GetDefPType:integer;
    procedure SetExportLIst;
    procedure setid(const Value: integer); override;
    procedure SetKurs;
    procedure SetNumMat;
    procedure SetParentName(const Value: string); override;

  public

    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmEditPriceList: TfrmEditPriceList;

const
  FAutoSetPrice = True;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst,ClientData, ssBaseIntfDlg, prFun, fMessageDlg, EditMaterials, jpeg,
  CurrencyEdit, ssBaseTypes, ssFun, SetCols, prTypes, cxCheckListBox, cxCheckBox,
  SetWMat, ssRegUtils, ShellAPI, EmailMsg, Math, EditServices, ssStrUtil, StrUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
function TfrmEditPriceList.GetSvcPrice(SvcId:Integer;OnDate:TDateTime):Extended;
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.GetSvcPrice') else _udebug := nil;{$ENDIF}

  if not cdsSrvRef.Active then cdsSrvRef.Open;

  Result := 0;
  with cdsSrvRef do begin
    BM := GetBookmark;
    DisableControls;
    
    try
      if Locate('svcid',SvcId,[])
        then Result := FieldByName('price').AsFloat * GetCurrencyRateEx(dmData.SConnection,FieldByName('currid').AsInteger,OnDate);

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SetExportLIst;
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SetExportLIst') else _udebug := nil;{$ENDIF}

  with ExportList do begin
    Clear;
    for i := 0 to dbgListDet.ColumnCount - 1 do begin
      if dbgListDet.Columns[i].Visible and (dbgListDet.Columns[i].Tag <> 5)
        then AddObject(dbgListDet.Columns[i].Name, pointer(1));
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceList.IsParenSel(ANode:TdxTreeListNode):boolean;
  var
    PNode:TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.IsParenSel') else _udebug := nil;{$ENDIF}

  Result := false;
  PNode := ANode.Parent;
  if PNode <> nil then Result := IsParenSel(PNode) or PNode.Selected ;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SelParents(ANode:TdxTreeListNode);
  var
    PNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SelParents') else _udebug := nil;{$ENDIF}

  PNode := ANode.Parent;
  if PNode <> nil then begin
    PNode.Selected := true;
    SelParents(PNode);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceList.GetSelCountEx(ATL:TdxDBTreeList):Integer;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function GetChCount(ANode:TdxTreeListNode):integer;
    var i:integer;
  begin
    Result := 0;
    if ANode.Count > 0 then begin
      Result := ANode.Count;
      for i := 0 to ANode.Count - 1 do begin
        Result := Result + GetChCount(ANode.Items[i]);
      end;
    end;//if ANode.Count>0
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.GetSelCountEx') else _udebug := nil;{$ENDIF}

  Result := 0;
  for i := 0 to ATL.Count - 1 do begin
    if ATL.Items[i].Selected then Result := Result + GetChCount(ATL.Items[i]) + 1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SetNumMat;
  var
    i,num:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SetNumMat') else _udebug := nil;{$ENDIF}

  num := 0;
  for i := 0 to dbgListDet.Count - 1 do begin
    if integer(dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('isgroup').Index]) in [0,2] then begin
      inc(num);
      dbgListDet.Items[i].Values[dbgListDet.ColumnByName('colNumMat').Index] := num;
    end
    else dbgListDet.Items[i].Values[dbgListDet.ColumnByName('colNumMat').Index] := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat, rtMatGroup:
      begin
        Application.ProcessMessages;
        cdsMatRef.Close;
        cdsMatRef.Open;
        dbgRef.ClearSelection;
        dbgRef.FullExpand;
        Application.ProcessMessages;

        try
          case TRefType(M.LParam) of
            rtMat:      dbgRef.FindNodeByKeyValue(M.WParam).Selected := True;
            rtMatGroup: dbgRef.FindNodeByKeyValue(-M.WParam).Selected := True;
          end;//case

          CopyFromRef;

        finally
          SetNumMat;
          FModified := True;
        end;
      end;//rtMat,rtMatGroup

    rtServices, rtSvcGroup:
      begin
        Application.ProcessMessages;
        cdsSrvRef.Close;
        cdsSrvRef.Open;
        dbgSrv.ClearSelection;
        dbgSrv.FullExpand;
        Application.ProcessMessages;

        try
          dbgSrv.FindNodeByKeyValue(M.WParam).Selected := True;
          CopyFromSvc;

        finally
          SetNumMat;
          FModified := True;
        end;
      end;//rtServices, rtSvcGroup
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FindRefPos;
  var
    FNode: TdxTreeListNode;
    FName: string;
    ftype: TLocateType;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.FindRefPos') else _udebug := nil;{$ENDIF}

   inherited;

   if FindStr <> edFind.Text then FindIndex := -1;

   FindStr := edFind.Text;

   if edFind.Text = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   if mnuPosName.Checked
     then FName := 'name'
     else FName := 'art';

   ftype := ltFull;

   if aFindBegin.Checked
     then ftype := ltBegin
     else if aFindSubstr.Checked then ftype := ltSubstr;

   FNode := FindNodeTr(dbgRef , FName, edFind.Text, ftype, FindIndex);

   if FNode <> nil then begin
     FindIndex := FNode.Index;
     cdsMatRef.Locate('id', FNode.Values[dbgRef.ColumnByFieldName('id').Index], []);
     dbgRef.ClearSelection;
     dbgRef.FocusedNode.Selected := true;
   end
   else ssMessageDlg(rs('Common', 'FindError') + ',' + #13#10 + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceList.GetDefPType:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.GetDefPType') else _udebug := nil;{$ENDIF}

  Result := -1;
  with newDataSet do
  try
    ProviderName := 'pPLPTypesDef_Get';
    Open;
    if not IsEmpty
      then Result := fieldbyname('PTypeId').AsInteger
      else Result := -1;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SetKurs;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SetKurs') else _udebug := nil;{$ENDIF}

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
    //sbKurs.Font.Color := clRed;
    sbKurs.Caption := rs(ParentNameEx, 'NoKurs');
  end;

  sbKurs.Refresh;

  if Self.Visible and CheckCurrency and (FRateDate <> edDate.Date)
     and (cbCurr.KeyValue <> BaseCurrID) and (cbCurr.Text <> '')
  then aSetKurs.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceList.CopyFromSvc: boolean;
  var
    i,j:integer;
    strFrom,strTo:String;
    minprice,maxprice,avgprice,LastInPrice,
    remain,rsv, FFinalPrice:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.CopyFromSvc') else _udebug := nil;{$ENDIF}

  Result := True;

  if (dbgSrv.SelectedCount > 1) or aExpandAll.Checked then fProgress.Show;
  
  try
    mdListDet.DisableControls;
    fProgress.Caption := rs(ParentNameEx,'Copy');
    strFrom := rs(ParentNameEx,'From');
    strTo := rs(ParentNameEx,'To');

    if not aExpandAll.Checked
      then fProgress.pbMain.Max := dbgSrv.SelectedCount
      else fProgress.pbMain.Max := GetSelCountEx(dbgSrv);

    with dbgSrv do begin
      for i := 0 to Count - 1 do begin
        if Items[i].Selected then begin
          //Проверка, такой материал сущ., то не добавлаем
          if not mdListDet.Locate('matid',Items[i].Values[colSvcId.Index],[]) then begin
            fProgress.Caption := rs(ParentNameEx,'Copy');
            fProgress.lText.Caption := Items[i].Values[colSvcName.Index];
            Application.ProcessMessages;
            mdListDet.Append;
            mdListDet.FieldByName('pldetid').AsInteger := mdListDet.RecNo;
            mdListDet.FieldByName('matid').AsInteger := Items[i].Values[colSvcId.Index];
            mdListDet.FieldByName('pmatid').AsInteger := Items[i].Values[colSvcPid.Index];
            mdListDet.FieldByName('MatName').AsString := Items[i].Values[colSvcName.Index];
            mdListDet.FieldByName('art').AsString := Items[i].Values[colSvcArtikul.Index];
            mdListDet.FieldByName('msrname').AsString := Items[i].Values[colSvcMsrName.Index];
            mdListDet.FieldByName('IsGroup').AsInteger := Items[i].Values[colSvcISGROUP.Index];
            //Установка цен
            if FAutoSetPrice and (mdListDet.FieldByName('IsGroup').AsInteger=2) then begin
              for j := 0 to mdListDet.FieldCount-1 do begin
                if (mdListDet.Fields[j].Tag > 0)
                    and (dbgListDet.FindColumnByFieldName(mdListDet.Fields[j].FieldName).Visible)
                then begin
                  {GetMatPrices(dmData.SConnection,mdListDet.FieldByName('matid').AsInteger,minprice,maxprice,avgprice,LastInPrice,remain,rsv);
                  case POType of
                    poAvg:begin
                      FFinalPrice := GetDefPriceOut(dmData.SConnection,
                          mdListDet.FieldByName('matid').AsInteger,
                          mdListDet.Fields[j].Tag, avgprice,
                          StrToDate(edDate.EditingText), CurKurs);
                      end;
                      
                    poLast:begin
                      FFinalPrice := GetDefPriceOut(dmData.SConnection,
                         mdListDet.FieldByName('matid').AsInteger, mdListDet.Fields[j].Tag,
                         LastInPrice, StrToDate(edDate.EditingText), CurKurs);
                    end;
                  end;//case

                  FFinalPrice := SalesPriceRound(FFinalPrice);
                  }
                  FFinalPrice := GetSvcPrice(mdListDet.FieldByName('matid').AsInteger,StrToDate(edDate.EditingText));
                  mdListDet.Fields[j].AsString := FormatFloat(MoneyDisplayFormat, FFinalPrice);

                end;//if
              end; // for j := 0 to mdListDet.FieldCount-1
            end; // if FAutoSetPrice and (mdListDet.FieldByName('IsGroup').AsInteger=2)

            mdListDet.Post;
          end;
          fProgress.pbMain.StepIt;

        end;//if Items[i].Selected

        //Копируем childs
        CopyNodesCh(Items[i]);
      end;//for
    end;//with

  finally
    mdListDet.EnableControls;
    SetNumMat;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditPriceList.CopyFromRef: boolean;
  var
    i,j: integer;
    strFrom,strTo: String;
    minprice,maxprice,avgprice,LastInPrice, remain,rsv, FFinalPrice, FTmp:Extended;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.CopyFromRef') else _udebug := nil;{$ENDIF}

  Result := True;

  if (dbgRef.SelectedCount > 1) or aExpandAll.Checked then fProgress.Show;

  try
    mdListDet.DisableControls;
    fProgress.Caption := rs(ParentNameEx,'Copy');
    strFrom := rs(ParentNameEx,'From');
    strTo := rs(ParentNameEx,'To');

    if not aExpandAll.Checked
      then fProgress.pbMain.Max := dbgRef.SelectedCount
      else fProgress.pbMain.Max := GetSelCountEx(dbgRef);

    with dbgRef do begin
      for i := 0 to Count-1 do begin
        if Items[i].Selected then begin
          //Проверка, такой продукт сущ., то не добавлаем
          if not mdListDet.Locate('matid',Items[i].Values[colRefId.Index],[]) then begin
            fProgress.Caption := rs(ParentNameEx,'Copy');
            fProgress.lText.Caption := Items[i].Values[colRefName.Index];//+' '+strFrom+' '+char(39)+LastGr+char(39)+' '+strTo+' '+char(39)+LastGr+char(39);
            Application.ProcessMessages;
            mdListDet.Append;
            mdListDet.FieldByName('pldetid').AsInteger := mdListDet.RecNo;
            mdListDet.FieldByName('matid').AsInteger := Items[i].Values[colRefId.Index];
            mdListDet.FieldByName('pmatid').AsInteger := Items[i].Values[colRefPid.Index];
            mdListDet.FieldByName('MatName').AsString := Items[i].Values[colRefName.Index];
            mdListDet.FieldByName('art').AsString := Items[i].Values[colRefArt.Index];
            mdListDet.FieldByName('msrname').AsString := Items[i].Values[colRefMsrName.Index];
            mdListDet.FieldByName('IsGroup').AsInteger := Items[i].Values[colRefIsGroup.Index];

            FFinalPrice := 0;
            //Установка цен
            if FAutoSetPrice and (mdListDet.FieldByName('IsGroup').AsInteger <> 1)
            then for j := 0 to mdListDet.FieldCount - 1 do begin
              if (mdListDet.Fields[j].Tag > 0) and (dbgListDet.FindColumnByFieldName(mdListDet.Fields[j].FieldName).Visible)
              then begin
                GetMatPrices(dmData.SConnection, mdListDet.FieldByName('matid').AsInteger, minprice, maxprice, avgprice, LastInPrice, remain, rsv);

                case POType of
                  poAvg:
                      FFinalPrice := GetDefPriceOut(dmData.SConnection, mdListDet.FieldByName('matid').AsInteger,
                                     mdListDet.Fields[j].Tag, avgprice, StrToDate(edDate.EditingText), CurKurs, FWithNDS, cbCurr.KeyValue);

                  poLast:
                      FFinalPrice := GetDefPriceOut(dmData.SConnection, mdListDet.FieldByName('matid').AsInteger, mdListDet.Fields[j].Tag,
                                     LastInPrice, StrToDate(edDate.EditingText), CurKurs, FWithNDS, cbCurr.KeyValue);
                end;//case POType

                FFinalPrice := SalesPriceRound(FFinalPrice);

                mdListDet.Fields[j].AsString := FormatFloat(MoneyDisplayFormat, FFinalPrice);
              end;
            end;

            mdListDet.Post;
          end;

          fProgress.pbMain.StepIt;

        end;//if Items[i].Selected

        //Копируем childs
        CopyNodesCh(Items[i]);
      end;//for
    end;//with

  finally
    mdListDet.EnableControls;
    SetNumMat;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
End;

//==============================================================================================
function TfrmEditPriceList.CanSelectNode(ANode: TdxTreeListNode):boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.CanSelectNode') else _udebug := nil;{$ENDIF}

  if ANode.Level > 0
    then Result := not ANode.Selected and CanSelectNode(ANode.Parent)
    else Result := not ANode.Selected;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.setid(const Value: integer);
  var
    i,j: integer;
    ColIds: array[1..50] of integer;
    cdsDetData: TClientDataSet;
    AColumn: TdxDBTreeListColumn;
    TabName, m, mRestCols: string;
    AField: TField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPriceList.setid') else _udebug := nil;{$ENDIF}

   Fid := Value;
   mdListDet.Close;

   if FID > 0 then begin
     mdListDet.DisableControls;
     cxSplitter1.CloseSplitter;
     cxSplitter1.Hint := rs(ParentNameEx,'ShowMatRef');
     Self.Caption := rs(ParentNameEx,'TitleEdit');

     with newDataSet do
     try
       Screen.Cursor := crSQLWait;

       //Чтение из PriceList
       ProviderName := 'p_PriceList_Get';
       FetchParams;
       Params.ParamByName('plid').AsInteger := FID;
       Open;
       if not IsEmpty then begin
         edName.Text := FieldByName('name').AsString;
         edDate.Date := FieldByName('ondate').AsDateTime;
         edNotes.Text := FieldByName('notes').AsString;
         cbCurr.KeyValue := FieldByName('currid').AsInteger;
         aUseLogo.Checked := (FieldByName('uselogo').AsInteger = 1);
         //btnUseLogo.Checked := aUseLogo.Checked;
         TabName := FieldByName('TableName').AsString;
       end;
       Close;

       //Чтение из PLCols
       ProviderName := 'pPLCols_Get';
       FetchParams;
       Params.ParamByName('plid').AsInteger := FID;
       Open;
       First;
       mRestCols := '';
       while not Eof do begin
         AColumn := dbgListDet.FindColumnByFieldName(FieldByName('fname').AsString);

         if AColumn <> nil then begin
           AColumn.Caption := FieldByName('name').AsString;
           AColumn.Index := FieldByName('num').AsInteger;
           AColumn.Visible := FieldByName('visible').AsInteger = 1;
           AColumn.Width := FieldByName('width').AsInteger;

           case FieldByName('coltype').AsInteger of
             0: begin
                 if AColumn.FieldName='amount' then begin
                   aShowAmount.Checked := AColumn.Visible;
                   tbShowAmount.Checked := AColumn.Visible;
                 end;

                 mRestCols := mRestCols + AColumn.Field.FieldName + ', ';

                 for j := 0 to TBSubCols.Count - 1 do begin
                   if TBSubCols.Items[j].Tag = AColumn.Field.Tag then TBSubCols.Items[j].Checked := AColumn.Visible;
                 end;
               end;//0-стандартная цена

             1: begin
                  tbShowName.Checked := AColumn.Visible;
                  aShowName.Checked := AColumn.Visible;
               end;

             2: begin
                  tbShowArt.Checked := AColumn.Visible;
                  aShowArt.Checked := AColumn.Visible;
               end;

             3: begin
                  tbShowMsr.Checked := AColumn.Visible;
                  aShowMsr.Checked := AColumn.Visible;
               end;

             5: begin
                  tbShowProdImage.Checked := AColumn.Visible;
                  aShowProdImage.Checked := AColumn.Visible;
               end;
           end;//case

           case FieldByName('align').AsInteger of
             -1: AColumn.Alignment := taLeftJustify;
              0: AColumn.Alignment := taCenter;
              1: AColumn.Alignment := taRightJustify;
           end;//case
         end // if AColumn <> nil
         else begin
           // Создаём пользовательское поле
           with TStringField.Create(mdListDet) do  begin
             FieldName := FieldByName('fname').AsString;
             FieldKind := fkData;
             Size := 255;
             Required := false;
             DataSet := mdListDet;
             mdListDet.FieldDefs.Add(FieldName, ftString, 255, false);

             //Создаём столбец в dbgListDet;
             AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
             AColumn.Name := 'colfield'+inttostr(mdListDet.FieldCount);
             AColumn.ReadOnly := false;
             AColumn.Caption := FieldByName('name').AsString;
             AColumn.FieldName := FieldByName('fname').AsString;
             AColumn.Width := FieldByName('width').AsInteger;
             AColumn.Tag := FieldByName('coltype').AsInteger;
             AColumn.HeaderAlignment := taCenter;

             case FieldByName('align').AsInteger of
               -1: AColumn.Alignment := taLeftJustify;
                0: AColumn.Alignment := taCenter;
                1: AColumn.Alignment := taRightJustify;
             end;//case

             AColumn.Index := FieldByName('num').AsInteger;
             AColumn.Visible := FieldByName('VISIBLE').AsInteger=1;
             mdCols.Append;
             mdCols.FieldByName('colname').AsString := AColumn.Name;
             mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
             mdCols.Post;
             mRestCols := mRestCols + 'PL_X.' + AColumn.Field.FieldName + ', ';
           end;//with
         end;

         Next;
       end;
       Close;

       if mRestCols <> '' then begin
         mRestCols := ', '+mRestCols;
         mRestCols[Length(mRestCols)-1] := ' ';
       end;

       mdListDet.Open;
       //Чтение из PL_X
       m := '';
       ProviderName := 'pSQL';
       FetchMacros;
       m := 'select PL_X.PLDetId, PL_X.matid, -PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + 'mats.name as matname, mats.artikul as art, msr.shortname as msrname ' + mRestCols
            + 'from ' + TabName + ' PL_X, materials mats, measures msr '
            + 'where PL_X.IsGroup = 0 and mats.matid = PL_X.matid and msr.mid = mats.mid '

            + 'union all '
            + 'select PL_X.PLDetId, -PL_X.matid as matid, -PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + ' CAST(mg.name as varchar(255)) as matname, CAST(Null as varchar(255)) as art, CAST(Null as varchar(6)) as msrname '
            + mRestCols
            + 'from ' + TabName + ' PL_X, matgroup mg '
            + 'where PL_X.IsGroup = 1 and mg.grpid = PL_X.matid'

            + ' union all '
            + 'select PL_X.PLDetId, PL_X.matid, PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + 'cast(svc.name as varchar(255)) as matname, cast(svc.artikul as varchar(255)) as art, msr.shortname as msrname '
            + mRestCols
            + 'from ' + TabName + ' PL_X, services svc, measures msr '
            + 'where PL_X.IsGroup = 2 and svc.svcid = PL_X.matid and msr.mid=svc.mid '

            + ' union all '
            + 'select PL_X.PLDetId, PL_X.matid as matid, PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + ' CAST(mg.name as varchar(255)) as matname, CAST(Null as varchar(255)) as art, CAST(Null as varchar(6)) as msrname '
            + mRestCols
            + 'from ' + TabName + ' PL_X, services mg '
            + 'where PL_X.IsGroup = 3 and mg.svcid = PL_X.matid';

       Macros.ParamByName('sql').AsString := m;

       Open;
       First;
       while not Eof do begin
         mdListDet.Append;
         for i := 0 to Fields.Count - 1 do begin
           AField := mdListDet.FindField(Fields[i].FieldName);

           if AField <> nil then begin
             case AField.DataType of
               ftInteger: AField.AsInteger := Fields[i].AsInteger;
               ftString:  AField.AsString := Fields[i].AsString;
             end; // case
           end;//if AField<>nil
         end; //for i := 0 to Fields.Count-1

         mdListDet.Post;
         Next;
       end;

     finally
       mdListDet.SortOnFields('pldetid');
       mdListDet.EnableControls;
       dbgListDet.FullExpand;
       dbgListDet.GotoFirst;
       dbgListDet.ColumnByName('colNumMat').Visible := true;
       dbgListDet.ColumnByName('colisgroup').Visible := true;
       dbgListDet.ColumnByName('colisgroup').Index := 1;
       dbgListDet.ColumnByName('colisgroup').Width := 25;
       dbgListDet.ColumnByName('colisgroup').Caption := '';
       SetNumMat;
       Screen.Cursor := crDefault;
       Free;
     end;
   end
   else begin
     mdListDet.Open;
     cxSplitter1.Hint := rs(ParentNameEx,'HideMatRef');
     Self.Caption := rs(ParentNameEx,'TitleAdd');
     edName.Text := '';
     edDate.Date := OnDate;
     edNotes.Text := '';
     dbgListDet.ColumnByFieldName('matname').Visible := true;
     dbgListDet.ColumnByFieldName('msrname').Visible := true;
     dbgListDet.ColumnByName('colNumMat').Visible := true;
     dbgListDet.ColumnByName('colisgroup').Visible := true;

     SetNumMat;

     //наценка по умолчанию
     j := GetDefPType;
     if j > 0 then begin
       for i := 0 to dbgListDet.ColumnCount-1 do begin
         if (dbgListDet.Columns[i].Tag <> -100)and (dbgListDet.Columns[i].Field.Tag = j)
           then dbgListDet.Columns[i].Visible := true;
       end;

       for i := 0 to TBSubCols.Count-1 do begin
         if TBSubCols.Items[i].Tag = j then TBSubCols.Items[i].Checked := true;
       end;
     end;//if j>0

     tbShowName.Checked := true;
     aShowName.Checked := true;
     tbShowMsr.Checked := true;
     aShowMsr.Checked := true;
   end;//else
   FModified := false;
   Application.ProcessMessages;
   SetExportLIst;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
End;

//==============================================================================================
procedure TfrmEditPriceList.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddGrp.Caption := GetRS(ParentNameEx,'AddMatGrp');
    aAddSvc.Caption := GetRS('fmWaybill', 'SvcV');
    aAddSvcGrp.Caption := GetRS(ParentNameEx,'AddSvcGrp');
    aDel.Caption := GetRS('Common','Del');
    aDel.Hint := aDel.Caption;
    aIns.Caption := GetRS('Common', 'Add');
    aIns.Hint := aIns.Caption;
    aPropMat.Caption := GetRS('Common','Properties');
    aPropMat.Hint := aPropMat.Caption;
    aShowProdImage.Caption := GetRS(ParentNameEx, 'ProdImage');
    aShowProdImage.Hint := aShowProdImage.Caption;

    gbMainInfo.Caption := GetRS(ParentNameEx,'MainInfo')+' ';
    lName.Caption := GetRS(ParentNameEx,'Name')+ ':';
    lOndate.Caption := GetRS(ParentNameEx,'OnDate')+ ':';
    gbPositions.Caption := GetRS(ParentNameEx,'Positions')+' ';
    lCurr.Caption := GetRS(ParentNameEx,'CurrName')+ ':';
    lKurs.Caption := GetRS('fmWaybill', 'Kurs') + ':';
    tbColName.Caption := GetRS(ParentNameEx,'Name');
    tbColName.EditCaption := GetRS(ParentNameEx,'Name');
    aCreateColum.Caption := GetRS(ParentNameEx,'NewColum');
    tbCreateNewColum.Caption := GetRS(ParentNameEx,'NewColum');
    gbRef.Caption := ' ' + GetRS(ParentNameEx,'Ref') + ' ';
    aSetPriceDef.Caption := GetRS(ParentNameEx,'SetDefPricePr');
    aSetPriceDefAll.Caption := GetRS(ParentNameEx,'SetDefPriceAll');
    aSetAmount.Caption := GetRS(ParentNameEx,'SetAmount');
    gbNotes.Caption := GetRS(ParentNameEx,'Notes')+' ';
    lNotes.Caption := GetRS(ParentNameEx, 'Notes');

    colRefName.Caption := GetRS('fmMaterials','Name');
    colRefArt.Caption := GetRS('fmMaterials','Artikul');
    colRefMsrName.Caption := GetRS('fmMaterials','Measure');

    colSvcName.Caption := colRefName.Caption;
    colSvcArtikul.Caption := colRefArt.Caption;
    colSvcMsrName.Caption := colRefMsrName.Caption;

    aDeleteColum.Caption := GetRS(ParentNameEx,'DelColum');

    aExpandAll.Caption := GetRS(ParentNameEx,'AddChildNodes');
    aExpandAll.Hint := aExpandAll.Caption;
    aGetWMat.Hint := GetRS(ParentNameEx,'GetWMat');
    aColsParams.Caption := GetRS(ParentNameEx,'ColsParams');
    aColsParams.Hint := GetRS(Self.ParentNameEx,'ColsParamsEx');//aColsParams.Caption;

    aUseLogo.Hint := GetRS(ParentNameEx,'UseLogo');
    aMatInfo.Hint := GetRS('fmMaterials','MatInfo');
    aPrint.Hint := GetRS(ParentNameEx,'ViewPrint');
    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');
    aSvcInfo.Hint := aSvcInfo.Caption;

    aAlignLeft.Caption := GetRS(ParentNameEx,'AlignLeft');
    aAlignCenter.Caption := GetRS(ParentNameEx,'AlignCenter');
    aAlignRight.Caption := GetRS(ParentNameEx,'AlignRight');
    TBSubCols.Caption := GetRS(ParentNameEx,'Colums');
    btnFind.Hint := GetRS('Common', 'Find');
    btnFindParams.Hint := GetRS('Common', 'FindParams');
    aFindBegin.Caption := GetRS('Common', 'FindBegin');
    aFindConcurr.Caption := GetRS('Common', 'FindConcurr');
    aFindSubstr.Caption := GetRS('Common', 'FindSubst');
    aContextFind.Caption := GetRS('Common', 'FindContext');
    aRefMat.Hint := GetRS(ParentNameEx,'RefMat');
    aRefServ.Hint := GetRS(ParentNameEx,'RefServ');
    aRefSet.Hint := GetRS(ParentNameEx,'RefSet');
    //fmNA1.SetCaptions;
    fmNA2.SetCaptions;
    aSelectAll.Caption := GetRS('Common','SelectAll');

    aShowName.Caption := GetRS('fmMaterials','Name');
    aShowArt.Caption := GetRS('fmMaterials','Artikul');
    aShowMsr.Caption := GetRS('fmMaterials','Measure');
  end;//with LangMan

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{$R *.dfm}

//==============================================================================================
procedure TfrmEditPriceList.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.ActionListUpdate') else _udebug := nil;{$ENDIF}

  btnFullExpand.Checked := aExpandAll.Checked;
  btnUseLogo.Checked := aUseLogo.Checked;
  aSetKurs.Enabled := (BaseCurrID <> cbCurr.KeyValue);
  aPropMat.Enabled := (mdListDet.RecordCount > 0);
  aDel.Enabled := aPropMat.Enabled;

  aRefMat.Checked := PageMat.Visible;
  btnRefMat.Checked := aRefMat.Checked;
  aRefServ.Checked := PageServ.Visible;
  btnRefServ.Checked := aRefServ.Checked;
  aRefSet.Checked := PageSet.Visible;

  try
    StrToDate(edDate.EditingText);
    lOndate.Tag := 0;
  except
    lOndate.Tag := 1;
  end;

  aOK.Enabled := (trim(edName.Text)<>'') and (lOndate.Tag = 0) and (not mdListDet.IsEmpty);
  aCancel.Enabled := true;
  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.edNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.edDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.edDatePropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  SetKurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.edNotesPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.edNotesPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    i,j,tmpId:integer;
    TabName, m, mIns1, mIns2:string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := false;
    try
      Screen.Cursor := crSQLWait;
      TrStart;

      with newDataSet do
      try
        NewRecord := (ID=0) or (IsPattern);

        if NewRecord then begin
          FID := GetMaxID(dmData.SConnection,'pricelist','plid');
          ProviderName := 'p_PriceList_Ins';
        end
        else ProviderName := 'p_PriceList_Upd';

        FetchParams;
        Params.ParamByName('PLID').AsInteger := FID;
        Params.ParamByName('ONDATE').AsDateTime := StrToDate(edDate.EditingText);
        Params.ParamByName('NAME').AsString := edName.Text;
        Params.ParamByName('NOTES').AsString := edNotes.Text;
        Params.ParamByName('DELETED').AsInteger := 0;
        TabName := 'PL_' + inttostr(FID);
        Params.ParamByName('TableName').AsString := TabName;
        Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
        Params.ParamByName('UseLogo').AsInteger := integer(btnUseLogo.Checked);
        Execute;

        //Проверка сущ. ли таблица
        ProviderName := 'pTable_Exists';
        FetchParams;
        Params.ParamByName('TableName').AsString := TabName;
        Open;
        if not IsEmpty then begin
          //Удаление таблицы PL_X
          Close;
          ProviderName := 'pPL_X_Drop';
          FetchMacros;
          Macros.ParamByName('m').AsString := TabName;
          Execute;
        end
        else Close;

        //Удаление из PLColPriceTypes
        ProviderName := 'pPLColPriceT_Del';
        FetchParams;
        Params.ParamByName('PLID').AsInteger := FID;
        Execute;
        //Удаление из PLCols
        ProviderName := 'pPLCols_Del';
        FetchParams;
        Params.ParamByName('PLID').AsInteger := FID;
        Execute;

        m := '';
        m := 'CREATE TABLE ' + TabName + ' (';

        //Запись в PLCols
        for i := 0 to dbgListDet.ColumnCount - 1 do begin
          if ((dbgListDet.Columns[i].Tag <> 0) and (dbgListDet.Columns[i].Tag <> -100))
             or ((dbgListDet.Columns[i].Tag = 0) and dbgListDet.Columns[i].Visible)
          then begin
            ProviderName := 'pPLCols_Ins';
            FetchParams;
            tmpId := GetMaxID(dmData.SConnection,'plcols', 'colid');
            Params.ParamByName('COLID').AsInteger := tmpId;
            Params.ParamByName('PLID').AsInteger := FID;
            Params.ParamByName('NAME').AsString := dbgListDet.Columns[i].Caption;
            Params.ParamByName('COLTYPE').AsInteger := dbgListDet.Columns[i].Tag;
            Params.ParamByName('NUM').AsInteger := dbgListDet.Columns[i].Index;
            Params.ParamByName('FNAME').AsString := dbgListDet.Columns[i].FieldName;
            //********************************************************
            dbgListDet.ColumnByFieldName('PLDetId').Field.Required := true;

            if ((dbgListDet.Columns[i].Tag = 0) and (dbgListDet.Columns[i].Visible)) or (dbgListDet.Columns[i].Tag = -1) then begin
              m := m + dbgListDet.Columns[i].FieldName + ' ';

              case dbgListDet.Columns[i].Field.DataType of
                ftInteger: m := m + 'INTEGER';
                ftString:  m := m + 'VARCHAR(' + inttostr(dbgListDet.Columns[i].Field.Size) + ')';
                ftGraphic:    m := m + 'INTEGER'; // just a placeholder
              end;//case

              if dbgListDet.Columns[i].Field.Required then m := m + ' NOT NULL';

              m := m + ', ';
            end;//if dbgListDet.Columns[i].Tag<=0
            //***********************************************************
            if dbgListDet.Columns[i].FieldName <> 'PLDetId'
              then Params.ParamByName('VISIBLE').AsInteger := integer(dbgListDet.Columns[i].Visible)
              else Params.ParamByName('VISIBLE').AsInteger := 0;

            case dbgListDet.Columns[i].Alignment of
              taLeftJustify:Params.ParamByName('ALIGN').AsInteger := -1;
              taCenter:Params.ParamByName('ALIGN').AsInteger := 0;
              taRightJustify:Params.ParamByName('ALIGN').AsInteger := 1;
            end;//case

            Params.ParamByName('WIDTH').AsInteger := dbgListDet.Columns[i].Width;
            Execute;

            //Если столбец - цена, то записываем в PLColPriceTypes
            if (dbgListDet.Columns[i].Tag = 0) and (dbgListDet.Columns[i].Field.Tag > 0)
            then begin
              ProviderName := 'pPLColPriceT_Ins';
              FetchParams;
              Params.ParamByName('COLID').AsInteger := tmpId;
              Params.ParamByName('PTYPEID').AsInteger := dbgListDet.Columns[i].Field.Tag;

              if mdCols.Locate('colname',dbgListDet.Columns[i].Name,[])
                then Params.ParamByName('CURRID').AsInteger := mdCols.fieldbyname('currid').AsInteger
                else Params.ParamByName('CURRID').AsInteger := BaseCurrID;//

              Execute;
            end;//if
          end;//if (dbgListDet.Columns[i].Tag<>0)or
        end;//for i := 0

        m := m + 'primary key (PLDetID))';

        ProviderName := 'pPL_X_Create';
        FetchMacros;
        Macros.ParamByName('m').AsString := m;
        Execute;//Создали таблицу PL_X
        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').AsString := 'grant all on ' + TabName + ' to public';
        Execute;

        TrCommit;

        TrStart;

        //Запись данных в PL_X
        try
          tmpId := GetMaxID(dmData.SConnection,TabName,'PLDetID');
          fProgress.Show;
          fProgress.Caption := rs(ParentNameEx,'SavePr');
          fProgress.pbMain.Max := mdListDet.RecordCount;
          for i := 0 to dbgListDet.Count - 1 do begin
            fProgress.lText.Caption := dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('matname').Index];
            Application.ProcessMessages;
            tmpId := tmpId + 1;
            mIns1 := '';
            mIns1 := 'INSERT INTO ' + TabName + '(PLDetId, matid, pmatid, isgroup,';
            mIns2 := 'VALUES (';
            mIns2 := mIns2 + inttostr(tmpId) + ',';//PLDetId

            mIns2 := mIns2 + IntToStr(Abs(integer(dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('matid').Index]))) + ',';
            mIns2 := mIns2 + IntToStr(Abs(integer(dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('pmatid').Index]))) + ',';

            mIns2 := mIns2 + IntToStr(dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('isgroup').Index]) + ',';

            for j := 0 to dbgListDet.ColumnCount - 1 do begin
              if (dbgListDet.Columns[j].Tag = 0) and (dbgListDet.Columns[j].Visible) then begin
                mIns1 := mIns1 + '' + dbgListDet.Columns[j].FieldName + ',';

                // image always goes as integer null field
                if (dbgListDet.Columns[j].Tag <> 5) AND (dbgListDet.Items[i].Values[dbgListDet.Columns[j].Index] <> null)
                  then mIns2 := mIns2 + char(39) + dbgListDet.Items[i].Values[dbgListDet.Columns[j].Index] + char(39) + ','
                  else mIns2 := mIns2 + 'NULL,'
              end;//if
            end;//for

            mIns1[Length(mIns1)] := ')';
            mIns2[Length(mIns2)] := ')';
            
            ProviderName := 'pSQL';
            FetchMacros;
            Macros.ParamByName('sql').AsString := mIns1 + mIns2;
            Execute;
            fProgress.pbMain.StepIt;
          end;//for

        finally
          fProgress.Hide;
          Application.ProcessMessages;
        end;

      finally
        Free;
        Screen.Cursor := crDefault;
      end;

      TrCommit;
      SendMessage(MainHandle, WM_REFRESH,ID,0);

      if ModalResult = mrYes then begin
        if NewRecord
          then ID := 0
          else ID := ID;
      end
      else CanClose := True;

    except
      on e:exception do begin
        TrRollback;
        raise;
      end;
    end;
  end
  else CanClose := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.FormDestroy') else _udebug := nil;{$ENDIF}

  ExportLIst.Free;
  cdsMatRef.Close;
  cdsSrvRef.Close;
  mdListDet.Close;

  if aFindBegin.Checked then Temp := 0
  else if aFindSubstr.Checked then Temp := 1
  else Temp := 2;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindCriteria', Temp);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosContextFind', Integer(aContextFind.Checked));

  if mnuPosName.Checked
    then Temp := 0
    else Temp := 1;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindField', Temp);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgRefGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgRefGetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Values[colRefIsGroup.Index] = 1 then begin
    if Node.Expanded
      then Index := 49
      else Index := 48;
  end
  else index := 14;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgRefCanNodeSelected(Sender: TObject; ANode: TdxTreeListNode; var Allow: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgRefCanNodeSelected') else _udebug := nil;{$ENDIF}

  Allow := CanSelectNode(ANode);
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgRefDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgRefDragOver') else _udebug := nil;{$ENDIF}

  Accept := false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDet1GetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDet1GetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Values[dbgListDet.ColumnByName('colisgroup').Index] = 1 then begin
    if Node.Expanded then Index := 49
    else Index := 48;
  end
  else index := 14;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.cxSplitter1AfterOpen(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.cxSplitter1AfterOpen') else _udebug := nil;{$ENDIF}

  // matref
  if not cdsMatRef.Active then
    try
      Screen.Cursor := crSQLWait;
      cdsMatRef.DisableControls;
      cdsMatRef.Open;

    finally
      cdsMatRef.EnableControls;
      dbgRef.GotoFirst;
      Screen.Cursor := crDefault;
      dbgRef.FullCollapse;
    end;

  // svcref
  if not cdsSrvRef.Active then
    try
      Screen.Cursor := crSQLWait;
      cdsSrvRef.DisableControls;
      cdsSrvRef.Open;

    finally
      cdsSrvRef.EnableControls;
      dbgSrv.GotoFirst;
      Screen.Cursor := crDefault;
      dbgSrv.FullCollapse;
    end;

  cxSplitter1.Hint := rs(ParentNameEx,'HideMatRef');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FormCreate(Sender: TObject);
  var
    AItem:TTBCustomItem;
    AColumn:TdxDBTreeListColumn;
    i, iimg:integer;
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  FOnActivate := False;
  ExportLIst := TStringList.Create;
  pcRef.ActivePage := PageMat;
  txtLang.Caption := keyboardIndicator;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindCriteria', Temp)
  then
    case Temp of
      0: aFindBegin.Checked := True;
      1: aFindSubstr.Checked := True;
      2: aFindConcurr.Checked := True;
    end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosContextFind', Temp)
    then aContextFind.Checked := Temp <> 0;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'PosFindField', Temp)
  then
    case Temp of
      0: mnuPosName.Checked := True;
      1: mnuPosArtikul.Checked := True;
    end;

   mdCols.Open;
   cdsCurr.Open;
   cbCurr.KeyValue := BaseCurrID;
   cxSplitter1.CloseSplitter;
   cxSplitter1.Hint := rs(ParentNameEx,'ShowMatRef');

   // Создаём столбец # товара
   AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn, dbgListDet);
   AColumn.Name := 'colNumMat';
   AColumn.FieldName := '';
   AColumn.Tag := -100;
   AColumn.Visible := true;
   AColumn.MinWidth := 30;
   AColumn.Width := 30;
   AColumn.Sizing := false;
   AColumn.Caption := amountPrefix;
   AColumn.HeaderAlignment := taCenter;
   AColumn.Alignment := taCenter;
   AColumn.DisableEditor := True;

   // Создаём поле PLDetId
   with TIntegerField.Create(mdListDet) do  begin
     FieldName := 'PLDetId';
     Tag := 0;
     FieldKind := fkData;
     DataSet := mdListDet;
     Required := false;
     mdListDet.FieldDefs.Add(FieldName,ftInteger,0,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn, dbgListDet);
     AColumn.Name := 'col'+FieldName;
     AColumn.FieldName := FieldName;
     AColumn.Tag := -1;
     AColumn.Visible := false;

     AColumn.MinWidth := 30;
     AColumn.Width := 30;
     AColumn.Sizing := false;
     AColumn.Caption := amountPrefix;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле matid
   with TIntegerField.Create(mdListDet) do  begin
     FieldName := 'matid';
     Tag := 0;
     FieldKind := fkData;
     DataSet := mdListDet;
     Required := true;
     mdListDet.FieldDefs.Add(FieldName,ftInteger,0,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col' + FieldName;
     AColumn.FieldName := FieldName;
     AColumn.Tag := -1;
     AColumn.Visible := false;

     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;

   end;

   //Создаём поле pmatid
   with TIntegerField.Create(mdListDet) do  begin
     FieldName := 'pmatid';
     Tag := 0;
     FieldKind := fkData;
     DataSet := mdListDet;
     mdListDet.FieldDefs.Add(FieldName,ftInteger,0,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col'+FieldName;
     AColumn.FieldName := FieldName;
     AColumn.Tag := -1;
     AColumn.Visible := false;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле isgroup
   with TIntegerField.Create(mdListDet) do  begin
     FieldName := 'isgroup';
     Tag := -100;
     FieldKind := fkData;
     DataSet := mdListDet;
     Required := true;
     mdListDet.FieldDefs.Add(FieldName,ftInteger,0,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListImageColumn,dbgListDet);
     AColumn.Name := 'col'+FieldName;
     AColumn.FieldName := FieldName;
     AColumn.Tag := -1;
     AColumn.Visible := true;
     AColumn.MinWidth := 25;
     AColumn.Width := 25;
     AColumn.Sizing := false;
     AColumn.Caption := '';
     AColumn.HeaderAlignment := taCenter;
     AColumn.Alignment := taCenter;
     AColumn.DisableEditor := True;
     Application.ProcessMessages;
     (AColumn as TdxDBTreeListImageColumn).Images := dmData.Images;
     (AColumn as TdxDBTreeListImageColumn).Values.Clear;
     for iimg := 0 to dmData.Images.Count-1  do begin
       case iimg of
         14: (AColumn as TdxDBTreeListImageColumn).Values.Add('0');
         15: (AColumn as TdxDBTreeListImageColumn).Values.Add('2');
         //48: (AColumn as TdxDBTreeListImageColumn).Values.Add('1');
         else (AColumn as TdxDBTreeListImageColumn).Values.Add('');
       end;//case
     end;//for

     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;//with

   //Создаём поле pmatname
   with TStringField.Create(mdListDet) do  begin
     FieldName := 'matname';
     Tag := 0;
     FieldKind := fkData;
     DataSet := mdListDet;
     Required := true;
     Size := 128;
     DisplayLabel := rs('fmMaterials','Name');
     mdListDet.FieldDefs.Add(FieldName,ftString,128,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col'+FieldName;
     AColumn.ReadOnly := false;
     AColumn.FieldName := FieldName;
     AColumn.Tag := 1;
     AColumn.Caption := DisplayLabel;
     AColumn.Alignment := taLeftJustify;
     AColumn.HeaderAlignment := taCenter;
     AColumn.Visible := true;
     AColumn.Width := 50; AColumn.MinWidth := 50;
     AColumn.DisableEditor := True;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле art
   with TStringField.Create(mdListDet) do  begin
     FieldName := 'art';
     Tag := 0;
     FieldKind := fkData;
     Required := false;
     Size := 128;
     DataSet := mdListDet;
     DisplayLabel := rs('fmMaterials','Artikul');
     mdListDet.FieldDefs.Add(FieldName,ftString,128,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col'+FieldName;
     //AColumn.ReadOnly := true;
     AColumn.FieldName := FieldName;
     AColumn.Tag := 2;
     AColumn.Caption := DisplayLabel;
     AColumn.Alignment := taLeftJustify;
     AColumn.HeaderAlignment := taCenter;
     AColumn.Visible := true;
     AColumn.Width := 50; AColumn.MinWidth := 50;
     AColumn.DisableEditor := True;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле msrname
   with TStringField.Create(mdListDet) do  begin
     FieldName := 'msrname';
     Tag := 0;
     FieldKind := fkData;
     Required := false;
     Size := 6;
     DataSet := mdListDet;
     DisplayLabel := rs('fmMaterials','Measure');
     mdListDet.FieldDefs.Add(FieldName,ftString,6,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col'+FieldName;
     //AColumn.ReadOnly := true;
     AColumn.FieldName := FieldName;
     AColumn.Tag := 3;
     AColumn.Caption := DisplayLabel;
     AColumn.Alignment := taRightJustify;
     AColumn.HeaderAlignment := taCenter;
     AColumn.Visible := true;
     AColumn.Width := 30; AColumn.MinWidth := 30;
     AColumn.DisableEditor := True;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле доступное кол-во amount
   with TStringField.Create(mdListDet) do  begin
     FieldName := 'amount';
     Tag := -10;
     FieldKind := fkData;
     Required := false;
     Size := 128;
     DataSet := mdListDet;
     DisplayLabel := rs('fmPriceList','ExAmount');
     mdListDet.FieldDefs.Add(FieldName,ftString,128,false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col' + FieldName;
     AColumn.ReadOnly := false;
     AColumn.FieldName := FieldName;
     AColumn.Tag := 0;//Кол-во
     AColumn.Caption := DisplayLabel;
     AColumn.Alignment := taRightJustify;
     AColumn.HeaderAlignment := taCenter;
     AColumn.Visible := true;
     AColumn.Width := 50; AColumn.MinWidth := 50;
     aShowAmount.Caption := DisplayLabel;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле label
   with TStringField.Create(mdListDet) do  begin
     FieldName := 'labeldescr';
     Tag := 0;
     FieldKind := fkData;
     Required := false;
     Size := 255;
     DataSet := mdListDet;
     DisplayLabel := rs('fmMaterials', 'LabelDescr');
     mdListDet.FieldDefs.Add(FieldName, ftString, 255, false);

     //Создаём столбец в dbgListDet;
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
     AColumn.Name := 'col' + FieldName;
     AColumn.FieldName := FieldName;
     AColumn.Tag := 0;
     AColumn.Caption := DisplayLabel;
     AColumn.Alignment := taRightJustify;
     AColumn.HeaderAlignment := taCenter;
     AColumn.Visible := true;
     AColumn.Width := 30; AColumn.MinWidth := 30;
     AColumn.DisableEditor := True;
     mdCols.Append;
     mdCols.FieldByName('colname').AsString := AColumn.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   //Создаём поле c изображением товара
   with TGraphicField.Create(mdListDet) do begin
     FieldName := 'ProdImage';
     Tag := 0;
     FieldKind := fkData;
     Required := false;
     DataSet := mdListDet;
     DisplayLabel := aShowProdImage.Caption;
     mdListDet.FieldDefs.Add(FieldName, ftGraphic);

     //Создаём столбец в dbgListDet;
     colProdImage := TdxDBTreeListImageColumn(dbgListDet.CreateColumnEx(TdxDBTreeListImageColumn, dbgListDet));
     colProdImage.Name := 'col' + FieldName;
     colProdImage.ReadOnly := True; // nothing to edit
     colProdImage.FieldName := FieldName;
     colProdImage.Tag := 5; // blob mark
     colProdImage.Caption := DisplayLabel;
     colProdImage.Alignment := taLeftJustify;
     colProdImage.HeaderAlignment := taCenter;
     colProdImage.Visible := False;
     colProdImage.Width := 100; colProdImage.MinWidth := 100;

     mdCols.Append;
     mdCols.FieldByName('colname').AsString := colProdImage.Name;
     mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
     mdCols.Post;
   end;

   with newDataSet do
   try
     // Чтение ценовых категорий и запись их в меню_
     ProviderName := 'pPriceTypes_List';
     Open;
     First;
     while not Eof do begin
       AItem := TTBCustomItem.Create(nil);
       AItem.Caption := fieldbyname('name').AsString;
       AItem.Tag := fieldbyname('ptypeid').AsInteger;
       AItem.OnClick := aPriceClick.OnExecute;
       TBSubCols.Add(AItem);

       //Создаём соответствующее поле
       with TStringField.Create(mdListDet) do  begin
           FieldName := 'aPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
           Tag := fieldbyname('ptypeid').AsInteger;
           FieldKind := fkData;
           Required := false;
           Size := 255;
           DataSet := mdListDet;
           DisplayLabel := AItem.Caption;
           mdListDet.FieldDefs.Add(FieldName, ftString, 255, false);
       end;
       //Создаём столбец в dbgListDet;
       AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
       AColumn.Name := 'colPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
       AColumn.ReadOnly := false;
       AColumn.FieldName := 'aPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
       AColumn.Width := 50;
       AColumn.Tag := 0;//Цена
       AColumn.Caption := AItem.Caption;
       AColumn.Alignment := taRightJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := false;
       AColumn.MinWidth := 50;
       mdCols.Append;
       mdCols.FieldByName('colname').AsString := AColumn.Name;
       mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
       mdCols.Post;
       Next;
     end;
     Close;

     AItem := TTBSeparatorItem.Create(nil);
     TBSubCols.Add(AItem);

     AItem := TTBCustomItem.Create(nil);
     AItem.Caption := tbSetCols.Caption;
     AItem.Tag := tbSetCols.Tag;
     AItem.Action := tbSetCols.Action;
     AItem.OnClick := tbSetCols.OnClick;
     AItem.Images := tbSetCols.Images;
     TBSubCols.Add(AItem);
     tbSetCols.Destroy;

   finally
     Free;
   end;

   for i := 0 to dbgListDet.ColumnCount - 1 do begin
     dbgListDet.Columns[i].Visible := false;
   end;

   blobds := nil;
   
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  if dbgListDet.Focused then begin
    dbgListDet.SelectAll;
    SetNumMat;
  end
  else if aRefMat.Checked then dbgRef.SelectAll
  else if aRefServ.Checked then dbgSrv.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.cxSplitter1AfterClose(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.cxSplitter1AfterClose') else _udebug := nil;{$ENDIF}

  cxSplitter1.Hint := rs(ParentNameEx,'ShowMatRef');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.mpItemNameAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.mpItemNameAcceptText') else _udebug := nil;{$ENDIF}

  dbgListDet.Columns[pmListDet.Tag].Caption := NewText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aDeleteColumExecute(Sender: TObject);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aDeleteColumExecute') else _udebug := nil;{$ENDIF}

  if mrYes = ssMessageDlg(rs(ParentNameEx, 'DelColum',1) + char(39) + dbgListDet.Columns[pmListDet.Tag].Caption + char(39) + '?', ssmtWarning,[ssmbYes, ssmbNo]) then begin
    if dbgListDet.Columns[pmListDet.Tag].Tag >= 0 then begin
      case dbgListDet.Columns[pmListDet.Tag].Tag of
        0: begin
           dbgListDet.Columns[pmListDet.Tag].Visible := false;

           for i := 0 to TBSubCols.Count-1 do begin
             if TBSubCols.Items[i].Tag = dbgListDet.Columns[pmListDet.Tag].Field.Tag then TBSubCols.Items[i].Checked := false;
           end;

           if dbgListDet.Columns[pmListDet.Tag].Field.Tag=0 then begin
             //Удаление столбца
             //dbgListDet.Columns[pmMain.Tag].Field.Destroy;
             dbgListDet.Columns[pmListDet.Tag].Destroy;
           end;
         end;//0

        1: begin
           dbgListDet.Columns[pmListDet.Tag].Visible := false;
           aShowName.Checked := false;
           tbShowName.Checked := false;
        end;//1

        2: begin
          dbgListDet.Columns[pmListDet.Tag].Visible := false;
          tbShowArt.Checked := false;
          aShowArt.Checked := false;
        end;//2

        3: begin
           dbgListDet.Columns[pmListDet.Tag].Visible := false;
           tbShowMsr.Checked := false;
           aShowMsr.Checked := false;
        end;//3
      end;
    end
    {else begin
      dbgListDet.Columns[pmMain.Tag].Destroy;
    end;
    }
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aShowNameExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aShowNameExecute') else _udebug := nil;{$ENDIF}

  aShowName.Checked := not aShowName.Checked;
  tbShowName.Checked := aShowName.Checked;
  dbgListDet.ColumnByName('colmatname').Visible := aShowName.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aShowArtExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aShowArtExecute') else _udebug := nil;{$ENDIF}

  aShowArt.Checked := not aShowArt.Checked;
  tbShowArt.Checked := aShowArt.Checked;
  dbgListDet.ColumnByName('colart').Visible := aShowArt.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aShowMsrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aShowMsrExecute') else _udebug := nil;{$ENDIF}

  aShowMsr.Checked := not aShowMsr.Checked;
  tbShowMsr.Checked := aShowMsr.Checked;
  dbgListDet.ColumnByName('colmsrname').Visible := aShowMsr.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aPriceClickExecute(Sender: TObject);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aPriceClickExecute') else _udebug := nil;{$ENDIF}

  with Sender as TTBCustomItem do begin
    Checked := not Checked;

    for i := 0 to dbgListDet.ColumnCount-1 do begin
      if (dbgListDet.Columns[i].Tag <> -100) and (dbgListDet.Columns[i].Field.Tag = Tag)
        then dbgListDet.Columns[i].Visible := Checked;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.mdListDet1AfterDelete(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.mdListDet1AfterDelete') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.mdListDet1AfterPost(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.mdListDet1AfterPost') else _udebug := nil;{$ENDIF}

  FModified := true;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSetPriceDefExecute(Sender: TObject);
  var
    BM:TBookmark;
    minprice,maxprice,avgprice,LastInPrice,remain,rsv:Extended;
    FFinalPrice, FPrice, FTmp: Extended;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSetPriceDefExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  if dbgListDet.SelectedCount > 1 then fProgress.Show;

  fProgress.Caption := rs(ParentNameEx, 'SetDefPricePr', 1) + char(39) + dbgListDet.Columns[pmListDet.Tag].Caption+char(39) + '...';
  fProgress.pbMain.Max := dbgListDet.SelectedCount;
  mdListDet.DisableControls;
  BM := mdListDet.GetBookmark;

  with mdListDet do
  try
    First;
    while not Eof do begin
      if (FieldByName('isgroup').AsInteger in [0,2])
         and (dbgListDet.FindNodeByKeyValue(FieldByName('pldetid').AsInteger).Selected)
      then begin
        fProgress.lText.Caption := FieldByName('matname').AsString;
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
        Edit;

        FFinalPrice := 0;

        case FieldByName('isgroup').AsInteger of
          0:begin
              GetMatPrices(dmData.SConnection,FieldByName('matid').AsInteger, minprice, maxprice, avgprice, LastInPrice, remain, rsv);
              if WBOutAutoPrice = 0 then begin

                if POType = poAvg
                  then FPrice := AvgPrice
                  else FPrice := LastInPrice;

                FPrice := GetDefPriceOut(dmData.SConnection, FieldByName('matid').AsInteger,
                          dbgListDet.Columns[pmListDet.Tag].Field.Tag, FPrice, StrToDate(edDate.EditingText), CurKurs, FWithNDS);

                //if FWithNDS then FPrice := NDSOut(FPrice, NDS);

                FPrice := RoundToA(FPrice, PriceDisplayDigits);
                FFinalPrice := FPrice;
              end
              else begin
                FPrice := GetLastOutPrice(dmData.SConnection, FieldByName('matid').AsInteger, cbCurr.KeyValue, StrToDate(edDate.EditingText), CurKurs);
                FPrice := RoundToA(FPrice, PriceDisplayDigits);
                FFinalPrice := FPrice;
              end;

             {case POType of
               poAvg:begin
                 FFinalPrice := GetDefPriceOut(dmData.SConnection,
                   FieldByName('matid').AsInteger,
                   dbgListDet.Columns[pmListDet.Tag].Field.Tag, avgprice,
                   StrToDate(edDate.EditingText), CurKurs, FWithNDS);
               end;//poAvg

               poLast:begin
                 FFinalPrice := GetDefPriceOut(dmData.SConnection,
                   FieldByName('matid').AsInteger, dbgListDet.Columns[pmListDet.Tag].Field.Tag,
                   LastInPrice, StrToDate(edDate.EditingText), CurKurs, FWithNDS);
               end;//poLast
             end;//case
             }

             FFinalPrice := SalesPriceRound(FFinalPrice);
          end;//0

          2:begin
            FFinalPrice := GetSvcPrice(FieldByName('matid').AsInteger,StrToDate(edDate.EditingText));
          end;//2
        end;//case

        dbgListDet.Columns[pmListDet.Tag].Field.AsString := FormatFloat(MoneyDisplayFormat, FFinalPrice);
        Post;
      end;//if

      Next;
    end;//while

  finally
    GotoBookmark(BM);
    FreeBookmark(BM);
    EnableControls;
    SetNumMat;
    fProgress.Hide;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aCurrClickExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aCurrClickExecute') else _udebug := nil;{$ENDIF}

  with Sender as TTBCustomItem do begin
    if mdCols.Locate('colname',dbgListDet.Columns[pmListDet.Tag].Name,[]) then begin
      mdCols.Edit;
      mdCols.FieldByName('currid').AsInteger := Tag;
      mdCols.Post;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aCreateColumExecute(Sender: TObject);
  var
    i:integer;
    AColumn:TdxDBTreeListColumn;
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aCreateColumExecute') else _udebug := nil;{$ENDIF}

  with TssMemoryData.Create(nil) do
  try
    Screen.Cursor := crHourGlass;
    BM := mdListDet.GetBookmark;
    CopyStructure(mdListDet.Fields[0].DataSet);
    LoadFromDataSet(mdListDet.Fields[0].DataSet,0,lmAppend);

    try
      mdListDet.DisableControls;
      mdListDet.Close;
      //Создаём поле
      with TStringField.Create(mdListDet) do  begin
         FieldName := 'afield' + inttostr(mdListDet.FieldCount + 1);
         DisplayLabel := rs(ParentNameEx,'Column') + '_' + inttostr(mdListDet.FieldCount + 1);
         FieldKind := fkData;
         Size := 255;
         Required := false;
         DataSet := mdListDet;
         mdListDet.FieldDefs.Add(FieldName, ftString, 255, false);
      end;

      //Запись обратно в mdListDet
      mdListDet.Open;
      First;
      while not eof do begin
        mdListDet.Append;

        for i := 0 to Fields.Count - 1 do begin
          if Fields[i].ClassName = TStringField.ClassName
            then mdListDet.FieldByName(Fields[i].FieldName).AsString := Fields[i].AsString
            else if Fields[i].ClassName = TIntegerField.ClassName
                 then mdListDet.FieldByName(Fields[i].FieldName).AsInteger := Fields[i].AsInteger;
        end;

        mdListDet.Post;
        Next;
      end;
      mdListDet.GotoBookmark(BM);

    finally
      FreeBookmark(BM);
      mdListDet.EnableControls;
      //if dbgListDet.Count>0 then dbgListDet.FocusedNode.Selected := true;
    end;

    //Создаём столбец в dbgListDet;
    AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
    AColumn.Name := 'colfield'+inttostr(mdListDet.FieldCount);
    AColumn.ReadOnly := false;
    AColumn.FieldName := 'afield'+inttostr(mdListDet.FieldCount);
    AColumn.Width := 50;
    AColumn.Tag := 0;
    AColumn.HeaderAlignment := taCenter;
    mdCols.Append;
    mdCols.FieldByName('colname').AsString := AColumn.Name;
    mdCols.FieldByName('Currid').AsInteger := BaseCurrID;
    mdCols.Post;

  finally
    Close;
    Free;
    SetNumMat;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAlignLeftExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAlignLeftExecute') else _udebug := nil;{$ENDIF}

  dbgListDet.Columns[pmListDet.Tag].Alignment := taLeftJustify;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAlignCenterExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAlignCenterExecute') else _udebug := nil;{$ENDIF}

  dbgListDet.Columns[pmListDet.Tag].Alignment := taCenter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAlignRightExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAlignRightExecute') else _udebug := nil;{$ENDIF}

  dbgListDet.Columns[pmListDet.Tag].Alignment := taRightJustify;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aPropMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aPropMatExecute') else _udebug := nil;{$ENDIF}

  case mdListDet.FieldByName('isgroup').AsInteger of
    0,1: begin
      with TfrmEditMaterials.Create(nil) do
      try
        MainHandle := Self.Handle;
        ParentNameEx := 'fmMaterials';
        OnDate := Self.OnDate;
        case mdListDet.FieldByName('isgroup').AsInteger of
          0:begin
              ID := mdListDet.fieldbyname('matid').AsInteger;
            end;//0

          1:begin
              cbType.ItemIndex := 1;
              cbType.Enabled := False;
              lcbParent.Enabled := False;
              btnGrp.Enabled := False;
              ID := mdListDet.fieldbyname('matid').AsInteger*-1;
          end;//1
        end;//case

        ShowModal;

      finally
        Free;
      end;
    end;//0,1:

    2,3:begin
      with TfrmEditServices.Create(nil) do
      try
        ParentNameEx := 'fmServices';
        OnDate := Self.OnDate;

        if mdListDet.FieldByName('isgroup').AsInteger=3 then begin
          cbType.ItemIndex := 1;
          cbType.Enabled := False;
          lcbParent.Enabled := False;
          btnGrp.Enabled := False;
        end;

        ID := dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('matid').Index];
        CanModify := True;
        ShowModal;

      finally
        Free;
      end;
    end;//2,3:begin
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aDelExecute') else _udebug := nil;{$ENDIF}

  try
    if dbgListDet.SelectedCount>1 then begin
      if mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgListDet.SelectedCount]), ssmtWarning,[ssmbYes, ssmbNo])
      then begin
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        dbgListDet.DeleteSelection;
        SetNumMat;
      end;
    end
    else begin
      if mrYes = ssMessageDlg(rs('Common', 'DelConfirm')+' '+char(39)+dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('matname').Index]+char(39), ssmtWarning,[ssmbYes, ssmbNo])
      then begin
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        dbgListDet.FocusedNode.Selected := true;
        dbgListDet.DeleteSelection;
        SetNumMat;
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  SetKurs;
  FModified := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aExpandAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aExpandAllExecute') else _udebug := nil;{$ENDIF}

  aExpandAll.Checked := not aExpandAll.Checked;
  //dbgListDet.FullExpand;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSetKursExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSetKursExecute') else _udebug := nil;{$ENDIF}

  with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Self.edDate.Date;
    ID := Self.cbCurr.KeyValue;

    if Self.FRateDate = Self.edDate.Date then SubID := Self.FRateID;

    SetFocusToRate := True;
    SetInactive;

    if ShowModal = mrOk then begin
      SetKurs;
      //FGridRefresh := true;
    end;

  finally
    Free;
  end;

  {with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Self.edDate.Date;
    ID := Self.cbCurr.KeyValue;
    if Self.FRateDate=Self.edDate.Date then SubID := Self.FRateID;
    SetFocusToRate := True;
    if ShowModal=mrOk then begin
      SetKurs;
    end;

  finally
    Free;
  end;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aColsParamsExecute(Sender: TObject);
  var
    //chlbItem: TcxCheckListBoxItem;
    i,j: integer;
    AColumn: TdxDBTreeListColumn;
    //tmpIcon: TIcon;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aColsParamsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetCols.Create(nil) do
  try
    mdCols.Open;
    Caption := rs(Self.ParentNameEx,'ColsParamsEx');
    colVsb.Caption := '';
    colColumn.Caption := rs(Self.ParentNameEx,'Column');
    colName.Caption := rs(Self.ParentNameEx,'Name');
    colAlign.Caption := '';

    {ImgAlign.Clear;
    tmpIcon := TIcon.Create;
    dmData.Images.GetIcon(120,tmpIcon);
    ImgAlign.AddIcon(tmpIcon);
    dmData.Images.GetIcon(121,tmpIcon);
    ImgAlign.AddIcon(tmpIcon);
    dmData.Images.GetIcon(122,tmpIcon);
    ImgAlign.AddIcon(tmpIcon);

    tmpIcon.Free;
    }

    for i := 0 to dbgListDet.ColumnCount-1 do begin
      case dbgListDet.Columns[i].Tag of
        0,1,2,3,5: begin
          mdCols.Append;
          mdCols.FieldByName('ind').AsInteger := dbgListDet.Columns[i].Index;
          mdCols.FieldByName('visb').AsInteger := integer(dbgListDet.Columns[i].Visible);
          mdCols.FieldByName('column').AsString := dbgListDet.Columns[i].Field.DisplayLabel;
          mdCols.FieldByName('fieldname').AsString := dbgListDet.Columns[i].FieldName;
          mdCols.FieldByName('name').AsString := dbgListDet.Columns[i].Caption;
          case dbgListDet.Columns[i].Alignment of
            taLeftJustify:mdCols.FieldByName('align').AsInteger := -1;
            taCenter:mdCols.FieldByName('align').AsInteger := 0;
            taRightJustify:mdCols.FieldByName('align').AsInteger := 1;
          end;//case;
          mdCols.Post;
        end;//0,1,2,3,5
      end//case
    end;

    colColumn.ReadOnly := true;
    colInd.ReadOnly := true;

    mdCols.First;
    while not mdCols.Eof do begin
      mdCols.Edit;
      mdCols.FieldByName('ind').AsInteger := mdCols.RecNo;
      mdCols.Post;
      mdCols.Next;
    end;

    SetCaptions;
    if ShowModal = mrOk then begin
      mdCols.First;
      while not mdCols.Eof do begin
        AColumn := dbgListDet.FindColumnByFieldName(mdCols.FieldByName('fieldname').AsString);

        if AColumn <> nil then begin
          AColumn.Caption := mdCols.FieldByName('name').AsString;
          AColumn.Index := mdCols.RecNo;
          AColumn.Visible := (mdCols.FieldByName('visb').AsInteger = 1);

          case mdCols.FieldByName('align').AsInteger of
            -1: AColumn.Alignment := taLeftJustify;
             0: AColumn.Alignment := taCenter;
             1: AColumn.Alignment := taRightJustify;
          end;//case

          //******************************
          case AColumn.Tag of
            0: begin
                if AColumn.FieldName = 'amount' then begin
                  aShowAmount.Checked := AColumn.Visible;
                  tbShowAmount.Checked := AColumn.Visible;
                end;

                for j := 0 to TBSubCols.Count-1 do begin
                  if (TBSubCols.Items[j].Tag = AColumn.Field.Tag) and (TBSubCols.Items[j].Tag > 0)
                     then TBSubCols.Items[j].Checked := AColumn.Visible;
                end;
            end;//0-стандартная цена

            1: begin
                tbShowName.Checked := AColumn.Visible;
                aShowName.Checked := AColumn.Visible;
             end;

            2: begin
                tbShowArt.Checked := AColumn.Visible;
                aShowArt.Checked := AColumn.Visible;
            end;

            3: begin
                tbShowMsr.Checked := AColumn.Visible;
                aShowMsr.Checked := AColumn.Visible;
            end;

            5: begin // Product image
                tbShowProdImage.Checked := AColumn.Visible;
                aShowProdImage.Checked := AColumn.Visible;
            end;
          end;//case
          //******************************
        end;

        mdCols.Next;
      end;

      SetExportLIst;
    end;//if ShowModal=mrOk then begin

  finally
    dbgListDet.ColumnByFieldName('isgroup').Index := 1;
    mdCols.Close;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aFindParamsExecute(Sender: TObject);
  var
    Pos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aFindParamsExecute') else _udebug := nil;{$ENDIF}

  Pos := panRefPosBtn.ClientToScreen(Point(btnFindParams.Left, btnFindParams.Top + btnFindParams.Height + 1));
  pmFind.Popup(Pos.X, Pos.Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aContextFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aContextFindExecute') else _udebug := nil;{$ENDIF}

  aContextFind.Checked := not aContextFind.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aFindBeginExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aFindBeginExecute') else _udebug := nil;{$ENDIF}

  aFindBegin.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aFindConcurrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aFindConcurrExecute') else _udebug := nil;{$ENDIF}

  aFindConcurr.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aFindSubstrExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aFindSubstrExecute') else _udebug := nil;{$ENDIF}

  aFindSubstr.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aFindExecute') else _udebug := nil;{$ENDIF}

  if PageMat.Visible then FindRefPos;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.CopyNodesCh(ANode:TdxTreeListNode);
  var
    i,j:integer;
    minprice,maxprice,avgprice,LastInPrice,
    remain,rsv, FFinalPrice, FTmp: Extended;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.CopyNodesCh') else _udebug := nil;{$ENDIF}

  if ANode.Count>0 then begin
    for i := 0 to ANode.Count-1 do begin
      if (ANode.Items[i].Selected and not aExpandAll.Checked)
         or (aExpandAll.Checked and (IsParenSel(ANode.Items[i]) or ANode.Items[i].Selected))
      then begin

        //Проверка, такой материал сущ., то не добавлаем
        if ((ANode.Owner = dbgRef) and (not mdListDet.Locate('matid',ANode.Items[i].Values[colRefId.Index],[])))
           or ((ANode.Owner = dbgSrv) and (not mdListDet.Locate('matid',ANode.Items[i].Values[colSvcId.Index],[])))
        then begin
          fProgress.Caption := rs(ParentNameEx,'Copy');
          fProgress.lText.Caption := ANode.Items[i].Values[colRefName.Index];
          Application.ProcessMessages;
          mdListDet.Append;
          mdListDet.FieldByName('pldetid').AsInteger := mdListDet.RecNo;

          if ANode.Owner = dbgRef then begin
            mdListDet.FieldByName('matid').AsInteger := ANode.Items[i].Values[colRefId.Index];
            mdListDet.FieldByName('pmatid').AsInteger := ANode.Items[i].Values[colRefPid.Index];
            mdListDet.FieldByName('MatName').AsString := ANode.Items[i].Values[colRefName.Index];
            mdListDet.FieldByName('art').AsString := ANode.Items[i].Values[colRefArt.Index];
            mdListDet.FieldByName('msrname').AsString := ANode.Items[i].Values[colRefMsrName.Index];
            mdListDet.FieldByName('IsGroup').AsInteger := ANode.Items[i].Values[colRefIsGroup.Index];
          end
          else if ANode.Owner = dbgSrv then begin
            mdListDet.FieldByName('matid').AsInteger := ANode.Items[i].Values[colSvcId.Index];
            mdListDet.FieldByName('pmatid').AsInteger := ANode.Items[i].Values[colSvcPid.Index];
            mdListDet.FieldByName('MatName').AsString := ANode.Items[i].Values[colSvcName.Index];
            mdListDet.FieldByName('art').AsString := ANode.Items[i].Values[colSvcArtikul.Index];
            mdListDet.FieldByName('msrname').AsString := ANode.Items[i].Values[colSvcMsrName.Index];
            mdListDet.FieldByName('IsGroup').AsInteger := ANode.Items[i].Values[colSvcISGROUP.Index];
          end;

          //Установка цен
          FFinalPrice := 0; //init

          if {(ANode.Owner=dbgRef) and} FAutoSetPrice and (mdListDet.FieldByName('IsGroup').AsInteger in [0,2])
          then
            for j := 0 to mdListDet.FieldCount - 1 do begin
              if (mdListDet.Fields[j].Tag > 0) and (dbgListDet.FindColumnByFieldName(mdListDet.Fields[j].FieldName).Visible)
              then begin
                //Установка цен
                case mdListDet.FieldByName('IsGroup').AsInteger of
                  0:begin
                    GetMatPrices(dmData.SConnection,mdListDet.FieldByName('matid').AsInteger,minprice,maxprice,avgprice,LastInPrice,remain,rsv);

                    case POType of
                      poAvg:
                          FFinalPrice := GetDefPriceOut(dmData.SConnection, mdListDet.FieldByName('matid').AsInteger,
                                         mdListDet.Fields[j].Tag, avgprice, StrToDate(edDate.EditingText), CurKurs, FWithNDS, cbCurr.KeyValue);

                      poLast:
                          FFinalPrice := GetDefPriceOut(dmData.SConnection, mdListDet.FieldByName('matid').AsInteger, mdListDet.Fields[j].Tag,
                                         LastInPrice, StrToDate(edDate.EditingText), CurKurs, FWithNDS, cbCurr.KeyValue);
                    end;//case

                    FFinalPrice := SalesPriceRound(FFinalPrice);

                    mdListDet.Fields[j].AsString := FormatFloat(MoneyDisplayFormat, FFinalPrice);
                  end;//0

                  2:begin
                    FFinalPrice := GetSvcPrice(mdListDet.FieldByName('matid').AsInteger,StrToDate(edDate.EditingText));
                    mdListDet.Fields[j].AsString := FormatFloat(MoneyDisplayFormat, FFinalPrice);
                  end;//2
                end;//case mdListDet.FieldByName('IsGroup').AsInteger of
              end;//if (mdListDet.Fields[j].Tag > 0) and (dbgListDet.FindColumnByFieldName(mdListDet.Fields[j].FieldName).Visible)
            end;//for j := 0 to mdListDet.FieldCount - 1 do begin

          mdListDet.Post;
        end;//if

        fProgress.pbMain.StepIt;
      end;//if Items[i].Selected

      //Копируем childs
      CopyNodesCh(ANode.Items[i]);
    end;//for
  end;//if ANode.Count>0

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.SaveNodesCh(ANode: TdxTreeListNode; mIns1:string; var TmpId:integer);
  var
    i,j:integer;
    mIns2:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.SaveNodesCh') else _udebug := nil;{$ENDIF}

  if ANode.Count > 0 then begin
    with newDataSet do
    try
      for i := 0 to ANode.Count - 1 do begin
        //****************************************************************
        fProgress.lText.Caption := ANode.Items[i].Values[dbgListDet.ColumnByFieldName('matname').Index];
        Application.ProcessMessages;
        tmpId := tmpId + 1;
        mIns2 := 'VALUES (';
        mIns2 := mIns2 + inttostr(tmpId) + ',';//PLDetId
        if ANode.Items[i].Values[dbgListDet.ColumnByFieldName('isgroup').Index] = 0 then begin
          mIns2 := mIns2 + IntToStr(ANode.Items[i].Values[dbgListDet.ColumnByFieldName('matid').Index]) + ',';
          mIns2 := mIns2 + IntToStr(-ANode.Items[i].Values[dbgListDet.ColumnByFieldName('pmatid').Index]) + ',';
        end
        else begin
          mIns2 := mIns2 + IntToStr(-ANode.Items[i].Values[dbgListDet.ColumnByFieldName('matid').Index]) + ',';
          mIns2 := mIns2 + IntToStr(-ANode.Items[i].Values[dbgListDet.ColumnByFieldName('pmatid').Index]) + ',';
        end;

        mIns2 := mIns2 + IntToStr(ANode.Items[i].Values[dbgListDet.ColumnByFieldName('isgroup').Index]) + ',';

        for j := 0 to  dbgListDet.ColumnCount-1 do begin
          if (dbgListDet.Columns[j].Tag = 0) and (dbgListDet.Columns[j].Visible) then begin
            if ANode.Items[i].Values[dbgListDet.Columns[j].Index] <> null
              then mIns2 := mIns2 + char(34) + ANode.Items[i].Values[dbgListDet.Columns[j].Index] + char(34) + ','
              else mIns2 := mIns2 + 'NULL' + ','
           end;//if
        end;//for

        mIns2[Length(mIns2)] := ')';
        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').AsString := mIns1+mIns2;
        Execute;
        fProgress.pbMain.StepIt;
        SaveNodesCh(ANode.Items[i],mIns1,tmpId);

        //****************************************************************
      end;

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditPriceList.pmListDetPopup(Sender: TObject);
  var
    i,j:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.pmListDetPopup') else _udebug := nil;{$ENDIF}

  j := 0;
  for i := 0 to dbgListDet.ColumnCount - 1 do begin
    if dbgListDet.Columns[i].Visible then begin
      if dbgListDet.FocusedColumn = j then begin
        pmListDet.Tag := dbgListDet.Columns[i].Index;

        aSetPriceDef.Enabled := ((dbgListDet.Columns[i].Tag = 0)
                            and((dbgListDet.Columns[i] as TdxDBTreeListColumn).Field.Tag > 0))
                            and(CurKurs>0);

        aSetPriceDef.Visible := aSetPriceDef.Enabled;

        aSetPriceDefAll.Enabled := aSetPriceDef.Enabled;
        aSetPriceDefAll.Visible := aSetPriceDef.Visible;

        aSetAmount.Enabled := dbgListDet.Columns[i].FieldName='amount';
        aSetAmount.Visible := aSetAmount.Enabled;


        aDeleteColum.Enabled := (dbgListDet.Columns[i].Tag<>-100);
        tbAlLeft.Checked := (dbgListDet.Columns[i].Alignment=taLeftJustify);
        TBAlCenter.Checked := (dbgListDet.Columns[i].Alignment=taCenter);
        TBAlRight.Checked := (dbgListDet.Columns[i].Alignment=taRightJustify);
        tbColName.Text := dbgListDet.Columns[i].Caption;
        tbColName.Enabled := (dbgListDet.Columns[i].Tag<>-100);
        Break;
      end;
      inc(j);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if AColumn.Name = 'colProdImage' then begin
      if ACanvas.Brush = nil then ACanvas.Brush := TBrush.Create;
      ACanvas.Brush.Style := bsCross;
      Acanvas.brush.Color := clBlack;
      ACanvas.FloodFill(0, 0, 0, fsSurface);
    end
    else begin
      if integer(ANode.Values[dbgListDet.ColumnByFieldName('isgroup').Index]) in [1,3]
        then AFont.Style := [fsBold]
        else AFont.Style := [];

      if (integer(ANode.Values[dbgListDet.ColumnByFieldName('isgroup').Index]) in [1,3])and not ASelected
        then AColor := PLGrpColor;
    end;
    
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    i, tmpID:integer;
    BM:TBookmark;
    FCh:boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetDragDrop') else _udebug := nil;{$ENDIF}

  if Source <> Sender then begin
    if Source = dbgRef
      then CopyFromRef
      else if Source = dbgSrv then CopyFromSvc
  end
  else begin
    try
      mdListDet.DisableControls;
      BM := mdListDet.GetBookmark;
      tmpID := mdListDet.FieldByName('pldetid').AsInteger + 1;
      //Всё что ниже сдвигаем вниз
      mdListDet.First;
      while not mdListDet.Eof do begin
        FCh := true;
        for i := 0 to dbgListDet.Count-1 do begin
          if dbgListDet.Items[i].Selected
             and dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('pldetid').Index] = mdListDet.FieldByName('pldetid').AsInteger
          then FCh := false;
        end;

        if FCh and (mdListDet.FieldByName('pldetid').AsInteger >= tmpID) then begin
          mdListDet.Edit;
          mdListDet.FieldByName('pldetid').AsInteger := mdListDet.FieldByName('pldetid').AsInteger+mdListDet.RecordCount;
          mdListDet.Post;
        end;//if FCh then begin

        mdListDet.Next;
      end;

      //**************************
      for i := 0 to dbgListDet.Count-1 do begin
        if dbgListDet.Items[i].Selected then begin
          if mdListDet.Locate('pldetid',dbgListDet.Items[i].Values[dbgListDet.ColumnByFieldName('pldetid').Index],[])
          then begin
            mdListDet.Edit;
            mdListDet.FieldByName('pldetid').AsInteger := tmpID;
            mdListDet.Post;
            tmpID := tmpID+1;
          end;
        end;
      end;

      mdListDet.SortOnFields('pldetid');
      mdListDet.First;

      while not mdListDet.Eof do begin
        mdListDet.Edit;
        mdListDet.FieldByName('pldetid').AsInteger := mdListDet.RecNo;
        mdListDet.Post;
        mdListDet.Next;
      end;

      mdListDet.GotoBookmark(BM);
      mdListDet.FreeBookmark(BM);

    finally
      mdListDet.EnableControls;
      SetNumMat;
    end;
  end;//else;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetDragOver') else _udebug := nil;{$ENDIF}

  if (Source <> Sender)
  then Accept := Source is TdxDBTreeList
  else begin
    Accept := true;
    //Accept := (Sender as TdxDBGrid).FocusedNode.Values[dbgListDet.ColumnByFieldName('isgroup').Index]=1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetRecIdGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetRecIdGetText') else _udebug := nil;{$ENDIF}

  AText := inttostr(ANode.Index+1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetColumn1CustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetColumn1CustomDrawCell') else _udebug := nil;{$ENDIF}

  AFont.Style := [];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAddGrp1Execute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAddGrp1Execute') else _udebug := nil;{$ENDIF}

  aid := 0;
  ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aUseLogoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aUseLogoExecute') else _udebug := nil;{$ENDIF}

  aUseLogo.Checked := not aUseLogo.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgListDet.SelectedCount <> 1) or (dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('isgroup').Index] <> 0)
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
  try
    ParentNameEx := 'fmMaterials';
    OnDate := Self.OnDate;
    ID := dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('matid').Index];
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aPrintExecute(Sender: TObject);
  var
    i,j: integer;
    BM: TBookmark;
    BSRead, BSWrite: TStream;
    jpeg: TJPEGImage;
    frpv: TfrPictureView;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aPrintExecute') else _udebug := nil;{$ENDIF}

  mdListDet.DisableControls;
  BM := mdListDet.GetBookmark;

  try
    mdListDet.SortOnFields('pldetid');

    j := 0;
    ColsWidth := 0;
    for i := 0 to dbgListDet.ColumnCount-1 do begin
      if dbgListDet.Columns[i].Visible then begin
        dbgListDet.Columns[i].Index := j;
        inc(j);
      end;
    end;

    VisColCount := j - 1;
    ColsWidth := 0;

    for i := 2 to VisColCount do begin
      ColsWidth := ColsWidth + dbgListDet.Columns[i].Width;
    end;

    // pre-loading report file to make possible of images creation
    if colProdImage.Visible
      then SmartShowRep(frReport1, 'PriceListImg.frf', False)
      else SmartShowRep(frReport1, 'PriceList.frf', False);

    if dbgListDet.ColumnByName('colProdImage').Visible then begin // pre-loading images
      if blobds = nil then begin
        blobds := newDataSet;
        blobds.ProviderName := 'Blobs_Get';
        blobds.FetchParams;
        blobds.Params.ParamByName('ownertype').AsInteger := cfOwnerTypeProduct;
      end;

      mdListDet.First;
      while not mdListDet.eof do begin
        if (mdListDet.FieldByName('matid').asInteger > 0) and mdListDet.FieldByName('ProdImage').IsNull
        then begin
          blobds.Params.ParamByName('ownerid').AsInteger := mdListDet.FieldByName('matid').asInteger;
          blobds.Open;
          if not blobds.eof then begin
            mdListDet.Edit;
            Bsread := blobds.CreateBlobStream(blobds.FieldByName('data'), bmRead);
            BsWrite := mdListDet.CreateBlobStream(mdListDet.FieldByName('ProdImage'), bmWrite);
            jpeg := TJPEGImage.Create;
            jpeg.LoadFromStream(BSRead);
            jpeg.DIBNeeded;
            jpeg.SaveToStream(BSWrite);
            //bswrite.CopyFrom(BSRead, BSRead.Size);
            mdListDet.Post;
            BSRead.Free;
            BSWrite.Free;
            jpeg.free;
            {
            Bsread := blobds.CreateBlobStream(blobds.FieldByName('data'), bmRead);
            // making another image for report
            frpv := TfrPictureView.Create;
            jpeg := TJPEGImage.Create;
            jpeg.LoadFromStream(BSRead);
            frpv.Picture.Bitmap.Assign(jpeg);
            jpeg.Free;
            //frpv.BlobType := btJPG;
            //frpv.Stretched := True;
            frpv.Name := 'ProdImage' + IntTostr(mdListDet.RecNo);
            //frpv.LoadFromStream(BSRead);
            frpv.SetBounds(1,1,100,100);
            frReport1.Pages[0].Objects.add(frpv);
            BSRead.Free;
            }
          end;

          blobds.Close;
        end; // if IsNull
        mdListDet.Next;
      end; // while not mdListDet.eof
    end; // if blob column visible

    frUserDataset1.RangeEndCount := VisColCount - 1;
    frUserDataset2.RangeEndCount := VisColCount - 1;
    frReport1.ShowReport;

  finally
    mdListDet.GotoBookmark(BM);
    mdListDet.FreeBookmark(BM);
    mdListDet.EnableControls;
    SetNumMat;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aGetWMatExecute(Sender: TObject);
  var
    m: string;
    ANode: TdxTreeListNode;
    AExStatus: boolean;
    mdTmpWMat: TssMemoryData;
    bm: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aGetWMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  m := '';
  mdTmpWMat := nil;

  with TfrmSetWMat.Create(nil) do
  try
    chbColAmount.Properties.Caption := rs(Self.ParentNameEx, 'ExAmount');
    chbColAmount.Checked := dbgListDet.FindColumnByFieldName('amount').Visible;
    mdTmpWMat := TssMemoryData.Create(nil);
    Caption := aGetWMat.Hint;
    colName.Caption := '';
    colVsb.Caption := '';
    SetCaptions;

    if ShowModal = mrOk then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //Получение списка складов
      mdWHouse.First;

      while not mdWHouse.Eof do begin
        if (mdWHouse.FieldByName('def').AsInteger = 1)
           and ((AllowedWH = '*') or (WordPositionEx(mdWHouse.FieldByName('wid').AsString, AllowedWH, [',']) > 0))
        then m := m + mdWHouse.FieldByName('wid').AsString + ',';

        mdWHouse.Next;
      end;

      if m <> ''
        then System.Delete(m, Length(m), 1)
        else m := '-1';

      mdListDet.Close;
      mdListDet.Open;
      Application.ProcessMessages;
      mdTmpWMat.Close;

      with newDataSet do
      try
        ProviderName := 'pPL_GetMatRemain';
        FetchParams;
        Params.ParamByName('matid').AsInteger := 0;
        Params.ParamByName('ondate').AsDateTime := MaxDateTime;
        Params.ParamByName('wh').AsString := m;
        FetchMacros;
        if edMatGroup.Visible and (edMatGroup.Text <> '') then begin
          if btnDrillDown.Checked
            then Macros.ParamByName('m').AsString := ' where grpid in ('
                 + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value) + ')'
            else Macros.ParamByName('m').AsString := ' where grpid=' + inttostr(edMatGroup.Value);
        end
        else Macros.ParamByName('m').AsString := '';

        Open;
        mdTmpWMat.CopyStructure(Fields[0].DataSet);
        mdTmpWMat.LoadFromDataSet(Fields[0].DataSet, 0, lmAppend);
        Close;
        if not mdTmpWMat.IsEmpty then begin
          //Выделяем ноды
          cdsMatRef.Open;
          dbgRef.ClearSelection;
          mdTmpWMat.First;

          while not mdTmpWMat.Eof do begin
            ANode := dbgRef.FindNodeByKeyValue(mdTmpWMat.FieldByName('matid').AsInteger);

            if ANode <> nil then begin
              ANode.Selected := true;
              SelParents(ANode);
            end;

            mdTmpWMat.Next;
          end;
          AExStatus := aExpandAll.Checked;
          aExpandAll.Checked := false;
          CopyFromRef;//Копируем
          dbgRef.ClearSelection;
          aExpandAll.Checked := AExStatus;

          //Устанавливаем amount
          dbgListDet.ColumnByFieldName('amount').Visible := chbColAmount.Checked;
          bm := mdListDet.GetBookmark;
          mdListDet.DisableControls;

          try
            mdTmpWMat.First;
            while not mdTmpWMat.Eof do begin
              if mdListDet.Locate('matid',mdTmpWMat.fieldbyname('matid').AsInteger,[]) then begin
                mdListDet.Edit;
                mdListDet.FieldByName('amount').AsFloat := RoundTo(RoundToA(mdTmpWMat.FieldByName('remain').AsFloat
                                                   - mdTmpWMat.FieldByName('rsv').AsFloat, MatDisplayDigits), MatDisplayDigits);
                mdListDet.Post;
              end;
              mdTmpWMat.Next;
            end;//while

          finally
            mdListDet.GotoBookmark(bm);
            mdListDet.FreeBookmark(bm);
            mdListDet.EnableControls;
          end;
        end; //if not mdTmpWMat.IsEmpty

      finally
        Free;
      end;
    end;

  finally
    mdTmpWMat.Free;
    SetNumMat;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aShowAmountExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aShowAmountExecute') else _udebug := nil;{$ENDIF}

  aShowAmount.Checked := not aShowAmount.Checked;
  tbShowAmount.Checked := aShowAmount.Checked;
  dbgListDet.ColumnByFieldName('amount').Visible := aShowAmount.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aExportExecute(Sender: TObject);
  var
    AFName, AImgFName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aExportExecute') else _udebug := nil;{$ENDIF}

  with TSaveDialog.Create(nil) do
  try
    DefaultExt := 'xls';
    Filter := 'Excel files (*.xls)|*.xls';

    if not Execute then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if FileName <> '' then AFName := FileName;

  finally
    Free;
  end;

  Application.ProcessMessages;

  try
    xlsExpFile.Workbook.Sheets.Clear;
    xlsExpFile.Workbook.Sheets.Add('Sheet1');

    //Сохранение лого в tmplogo.bmp
    if (btnUseLogo.Checked) and (EntLogo.Size > 0) then begin
      EntLogo.Position := 0;
      AImgFName := ExtractFilePath(Application.ExeName) + 'tmplogo.bmp';
      EntLogo.SaveToFile(AImgFName);
    end
    else AImgFName := '';

    SetExportLIst;
    try
      xlsExport.ExportPL(0, 6, 0, dbgListDet, ExportList, AFName, EntName, EntAddr, EntPhone,edName.Text,edNotes.Text,AImgFName,PLGrpColor);
    except
      ssMessageDlg(Format(rs('Common','ExpFileBlocked'), [AFName]),ssmtError,[ssmbOK]);
    end;

  finally
    fProgress.Hide;

    if FileExists(AImgFName) then DeleteFile(AImgFName);
  end;

  ShellExecute(Application.Handle, nil, PChar(AFName), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  var
    frpv: TfrPictureView;
    jpeg: TJPEGImage;
    BSRead: TStream;
    pic: TfrPictureView;
    str: TStream;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  if (View.Name = 'EntLogo') and (btnUseLogo.Checked) and (EntLogo.Size > 0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end
  else if View.Name = 'MemoH' then begin // header band
    if dbgListDet.Columns[frUserDataset1.RecNo + 2].Name = 'colProdImage'
      then View.dx := 100
      else View.dx := CurWidth;
  end
  else if View.Name = 'MemoC' then begin // Cell
    View.dx := CurWidth;
    {pic := TfrPictureView(frReport1.FindObject('Picture1'));
    pic.visible := False;
    }
    (View as TfrMemoView).Alignment := CurAlign;
    if dbgListDet.Columns[frUserDataset1.RecNo + 2].Name = 'colProdImage' then begin // here goes image. repositioning.
      View.dx := 0;// to not block the image
      (*
      if blobds = nil then begin
        blobds := newDataSet;
        blobds.ProviderName := 'Blobs_Get';
        blobds.FetchParams;
        blobds.Params.ParamByName('ownertype').AsInteger := cfOwnerTypeProduct;
      end;

      blobds.Params.ParamByName('ownerid').AsInteger := mdListDet.FieldByName('matid').asInteger;
      blobds.Open;
      if not blobds.eof then begin
        Bsread := blobds.CreateBlobStream(blobds.FieldByName('data'), bmRead);
        pic.visible := False;
        pic.LoadFromStream(Bsread);
        pic.dx := View.dx;
        pic.dy := View.dy;
      end;
      blobds.close;
      *)
      {// leave it till the good times
      frpv := TfrPictureView(frReport1.FindObject('ProdImage' + IntToStr(mdListDet.RecNo)));
      if frpv <> nil then begin
        View.dx := 100;
        View.dy := 100;
        View.Parent.dy := 100;
        frpv.SetBounds(View.x, View.y, View.dx, View.dy);

        if frpv.ParentPage <> View.ParentPage then begin // relocating to right page
          frpv.ParentPage.Objects.Delete(frpv.ParentPage.Objects.IndexOf(frpv));
          View.ParentPage.Objects.Add(frpv);
        end;
        }
      end;

    if mdListDet.FieldByName('isgroup').AsInteger in [1,3] then begin
      (View as TfrMemoView).Font.Style := [fsBold];
      (View as TfrMemoView).Font.Color := clBlack;
      (View as TfrMemoView).FillColor := PLGrpColor;
    end//if group
    else begin
      (View as TfrMemoView).Font.Style := [];
      (View as TfrMemoView).Font.Color := clBlack;
      (View as TfrMemoView).FillColor := clWhite;
    end;
  end //if cell
  else if View.Name = 'ProdImage' then begin
    str := mdListdet.CreateBlobStream(mdListDet.FieldByName('ProdImage'), bmRead);
    //(View as TfrPictureView).Picture.Bitmap.LoadFromStream(str);
    jpeg := TJPEGImage.Create;
    jpeg.LoadFromStream(str);
    (View as TfrPictureView).Picture.Bitmap.Assign(jpeg);
    jpeg.Free;

    str.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.frReport1GetValue(const ParName: String; var ParValue: Variant);
  var
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.frReport1GetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'Cell') then begin
    {if dbgListDet.Columns[frUserDataset1.RecNo + 2].Name = 'colProdImage'
      then begin
        s := 'ProdImage' + IntTostr(mdListDet.RecNo);
        if nil = frReport1.FindObject(s)
          then ParValue := ''
          else ParValue := s;
      end
      else} ParValue := dbgListDet.Columns[frUserDataset1.RecNo + 2].Field.Value;
  end
  else if 0 = AnsiCompareText(ParName, 'Header') then ParValue := dbgListDet.Columns[frUserDataset2.RecNo + 2].Caption
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'reptitle') then ParValue := edName.Text
  else if 0 = AnsiCompareText(ParName, 'notes') then ParValue := edNotes.Text
  else if 0 = AnsiCompareText(ParName, 'ondate') then ParValue := DateToStr(edDate.Date)
  else if 0 = AnsiCompareText(ParName, 'entadr') then ParValue := EntAddr
  else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := EntPhone;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.frReport1PrintColumn(ColNo: Integer; var Width: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.frReport1PrintColumn') else _udebug := nil;{$ENDIF}

  case dbgListDet.Columns[ColNo+1].Alignment of
    taLeftJustify:CurAlign := 0;
    taCenter:CurAlign := 2;
    taRightJustify:CurAlign := 1
  end;

  CurWidth := Trunc(dbgListDet.Columns[ColNo + 1].Width * (711/ColsWidth));
  Width := CurWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.edFindPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.edFindPropertiesChange') else _udebug := nil;{$ENDIF}

  if aContextFind.Checked then aFind.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.WMLayoutChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  txtLang.Caption := keyboardIndicator;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.mnuPosNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.mnuPosNameClick') else _udebug := nil;{$ENDIF}

  mnuPosName.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.mnuPosArtikulClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.mnuPosArtikulClick') else _udebug := nil;{$ENDIF}

  mnuPosArtikul.Checked := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aRefMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aRefMatExecute') else _udebug := nil;{$ENDIF}

  PageMat.Show;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aRefServExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aRefServExecute') else _udebug := nil;{$ENDIF}

  PageServ.Show;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aRefSetExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aRefSetExecute') else _udebug := nil;{$ENDIF}

  PageSet.Show;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetColumnMoved') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  SetExportLIst;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSendErrMessageExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSendErrMessageExecute') else _udebug := nil;{$ENDIF}

  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAddMatExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAddMatExecute') else _udebug := nil;{$ENDIF}

  aid := 0;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FormActivate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.FormActivate') else _udebug := nil;{$ENDIF}

  //if (ID=0) and (not FOnActivate)  then  ssMessageDlg(rs(ParentNameEx, 'FirstPriceList'), ssmtWarning,  [ssmbOK], 'FirstPriceList', True);
  FOnActivate := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSetAmountExecute(Sender: TObject);
  var
    m:string;
    mdTmpWMat:TssMemoryData;
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSetAmountExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  m := '';
  mdTmpWMat := nil;

  with TfrmSetWMat.Create(nil) do
  try
    chbColAmount.Properties.Caption := rs(Self.ParentNameEx,'ExAmount');
    chbColAmount.Checked := dbgListDet.FindColumnByFieldName('amount').Visible;
    mdTmpWMat := TssMemoryData.Create(nil);
    Caption := aSetAmount.Caption;
    chbColAmount.Hide;
    colName.Caption := '';
    colVsb.Caption := '';
    SetCaptions;
    lMatGroup.Visible := False;
    edMatGroup.Visible := False;
    btnAddMG.Visible := False;
    btnDrillDown.Visible := False;

    if ShowModal = mrOk then begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //Получение списка складов
      mdWHouse.First;
      while not mdWHouse.Eof do begin
        if mdWHouse.FieldByName('def').AsInteger = 1
          then m := m + IntToStr(mdWHouse.FieldByName('wid').AsInteger) + ', ';

        mdWHouse.Next;
      end;

      if m <> '' then m[Length(m)-1] := ' ';

      Application.ProcessMessages;
      mdTmpWMat.Close;

      with newDataSet do
      try
        ProviderName := 'pPL_GetMatRemain';
        FetchParams;
        Params.ParamByName('matid').AsInteger := 0;
        Params.ParamByName('ondate').AsDateTime := MaxDateTime;
        Params.ParamByName('wh').AsString := m;
        Open;
        mdTmpWMat.CopyStructure(Fields[0].DataSet);
        mdTmpWMat.LoadFromDataSet(Fields[0].DataSet,0,lmAppend);
        Close;

      finally
        Free;
      end;

      //*******************************************************
      if dbgListDet.SelectedCount > 1 then fProgress.Show;

      fProgress.Caption := rs(ParentNameEx,'SetAmount')+'...';
      fProgress.pbMain.Max := dbgListDet.SelectedCount;

      mdListDet.DisableControls;
      BM := mdListDet.GetBookmark;

      with mdListDet do
      try
        First;
        while not Eof do begin
          if (FieldByName('isgroup').AsInteger=0)
             and (dbgListDet.FindNodeByKeyValue(FieldByName('pldetid').AsInteger).Selected)
          then begin
            fProgress.lText.Caption := FieldByName('matname').AsString;
            fProgress.pbMain.StepIt;
            Application.ProcessMessages;
            Edit;

            if mdTmpWMat.Locate('matid',FieldByName('matid').AsInteger,[])
              then FieldByName('amount').AsFloat := RoundToA(mdTmpWMat.FieldByName('remain').AsFloat-mdTmpWMat.FieldByName('rsv').AsFloat,MatDisplayDigits)
              else FieldByName('amount').AsFloat := 0;

            Post;

          end;//if

          Next;
        end;//while

      finally
        GotoBookmark(BM);
        FreeBookmark(BM);
        EnableControls;
        SetNumMat;
        fProgress.Hide;
        Screen.Cursor := crDefault;
      end;
    end;

  finally
    mdTmpWMat.Free;
    SetNumMat;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSetPriceDefAllExecute(Sender: TObject);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSetPriceDefAllExecute') else _udebug := nil;{$ENDIF}

  aSelectAll.Execute;
  aSetPriceDef.Execute;

  with dbgListDet do
    for i := 0 to Count-1 do Items[i].Selected := Items[i]=FocusedNode;

  SetNumMat;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgSrvGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgSrvGetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Values[colSvcISGROUP.Index]=3 then begin
    if Node.Expanded
      then Index := 49
      else Index := 48;
  end
  else index := 15;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

  if (dbgListDet.SelectedCount<>1)or(dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('isgroup').Index] <> 2)
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditServices.Create(nil) do
  try
    ParentNameEx := 'fmServices';
    OnDate := Self.OnDate;
    ID := dbgListDet.FocusedNode.Values[dbgListDet.ColumnByFieldName('matid').Index];
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aInsExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aInsExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditPriceList.aAddSvcExecute(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  AID := 0;
  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, AID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.aAddSvcGrpExecute(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aAddSvcGrpExecute') else _udebug := nil;{$ENDIF}

  AID := 0;
  ShowModalRef(Self, rtSvcGroup, vtSvcGroup, 'TfmSvcGroup', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetChangedColumnsWidth(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetChangedColumnsWidth') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetChangeColumn(Sender: TObject; Node: TdxTreeListNode; Column: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetChangeColumn') else _udebug := nil;{$ENDIF}

  inherited;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.dbgListDetDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.dbgListDetDragEndHeader') else _udebug := nil;{$ENDIF}

  inherited;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPriceList.FormConstrainedResize(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  inherited;
  MinWidth := 590;
  MinHeight := 570;
end;

//==============================================================================================
procedure TfrmEditPriceList.aShowProdImageExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPriceList.aShowProdImageExecute') else _udebug := nil;{$ENDIF}

  aShowProdImage.Checked := not aShowProdImage.Checked;
  tbShowProdImage.Checked := aShowProdImage.Checked;
  dbgListDet.ColumnByFieldName('ProdImage').Visible := aShowProdImage.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPriceList', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
